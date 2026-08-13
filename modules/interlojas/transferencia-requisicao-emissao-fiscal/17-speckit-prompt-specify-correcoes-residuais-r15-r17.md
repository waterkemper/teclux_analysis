# Prompt `/speckit.specify` — Correções residuais R-15/R-17 antes do smoke real

## Contexto

Revisar o estado atual do Laravel no commit que contém as specs 361 e 362 da NF-e de homologação da transferência. A feature ativa é exclusivamente `Transferencia`, NF-e modelo 55, homologação SEFAZ. `VendaTransferencia`, `DevolucaoTransferencia`, NF-e de entrada, financeiro e um segundo pipeline estão fora do escopo.

Não implementar durante esta análise. Produzir uma spec executável, com critérios, contratos e tarefas; só implementar após `/speckit.plan` e `/speckit.tasks`.

## Problemas comprovados

1. `TransferenciaFiscalPrepararFotografiaService` ainda preenche, fora do harness marcado, natureza ausente com `TRANSFERENCIA_MERCADORIAS_SAIDA` e injeta defaults para `tipo_nf`, `tp_imp`, `tp_emis`, `fin_nfe`, `ind_final`, `ind_pres` e `proc_emi`. Isso contradiz a matriz autoritativa de `specs/361-trf-homolog-r15-r18/contracts/matriz-origem-fotografia-http.md`.
2. `ProcessarReconciliacaoNfeJobHandler` aceita o XML textual `nfeProc` quando `NfePhpNfeProcBuilder` retorna `null`, contornando o `NfeProcIdentidadeRevalidator` no caminho de timeout/consulta.

## Objetivo

Garantir que ausência de qualquer fonte fiscal bloqueie antes do seal e que nenhum `nfeProc` seja custodiado como autorizado sem revalidação pós-builder, tanto na autorização inicial quanto na reconciliação.

## Requisitos

- Separar explicitamente harness de teste/dry-run do caminho HTTP real.
- No caminho HTTP, resolver natureza/código fiscal e todos os indicadores `ide` por fonte de domínio documentada e persistível na fotografia; não usar default de produto, `app.name`, enum do tipo como natureza fiscal ou valor arbitrário.
- `idDest` só pode ser derivado por regra de domínio documentada a partir de emitente/destinatário; registrar a origem na fotografia.
- Ausência deve gerar código `FONTE_*` específico e impedir seal/alocação/transmissão.
- Cobrir a origem dos campos em teste por família: natureza/código, `tpNF`, `idDest`, `tpImp`, `tpEmis`, `finNFe`, `indFinal`, `indPres`, `procEmi`, `verProc`.
- Em reconciliação, remover o fallback que aceita XML cru. Todo candidato (`nfeProc` recebido, fragmento `protNFe`, resposta SOAP desembrulhada ou DOM montado) deve passar pelo builder/revalidator.
- A revalidação deve receber, quando disponíveis, identidade esperada da emissão: chave, ambiente, modelo, série, número e CNPJ emitente; também deve conferir digest, `chNFe`, `cStat` autorizado, `nProt`, `digVal` e versão.
- Falha de revalidação deve manter estado de reconciliação pendente/incompatível, sem `AUTORIZADA` conclusiva, sem projeção e sem fabricação de artefato.
- Manter zero alterações para Venda/Devolução e zero reenvio automático.

## Testes de aceite obrigatórios

- HTTP com fonte de natureza/indicador ausente retorna `FONTE_*` e não cria seal, série, número ou transmissão.
- Harness marcado continua capaz de testar fontes explícitas sem abrir autoridade no request HTTP.
- Resposta de reconciliação com `nfeProc` contendo chave, digest, versão, emitente ou protocolo divergente não produz `nfe_proc_bytes` nem estado autorizado.
- Resposta canônica válida passa pelo mesmo revalidator e é custodiada uma única vez.
- Timeout/em processamento segue consulta controlada, sem retransmissão cega.
- Teste de regressão confirma que nenhum caminho da feature aceita `VendaTransferencia` ou `DevolucaoTransferencia`.

## Saída esperada da spec

Entregar `spec.md`, contratos de erros/origem/custódia, plano, tarefas por story e quickstart. Incluir matriz arquivo→comportamento→teste e declarar que não há liberação de homologação até a suíte autoritativa verde em PHP 8.5.
