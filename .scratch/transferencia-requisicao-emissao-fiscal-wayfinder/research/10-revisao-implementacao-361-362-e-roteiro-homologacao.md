# Revisão da implementação 361-362 e roteiro de homologação

Data: 2026-08-12

## Base

O checkout `laravel` está em `56f6b8d3`, com `78d9d286` (spec 361/R-15…R-18) e `56f6b8d3` (spec 362/evidências operacionais). A análise foi feita contra a base `5346c04c` e pelos arquivos efetivamente presentes no `HEAD`.

## Fechamentos confirmados

- O request HTTP rejeita campos de autoridade fiscal e mantém `VendaTransferencia`/`DevolucaoTransferencia` fora do tipo aceito.
- O diagnóstico nominal usa `CertificateRequest.filialCodigo` igual à filial informada.
- O resolver de volumes materializa `tagvol` quando a fotografia possui volumes.
- O endpoint do snapshot é aplicado ao `TecluxNfeTools` nos caminhos de status e autorização.
- O resolver XSD principal seleciona a versão derivada do leiaute e não usa o `glob` antigo como autoridade.
- O builder de `nfeProc` não usa fallback `4.00` e chama o revalidator após a montagem.
- O gate exige diagnóstico, UF e grupo real, verifica filial/UF/modelo/ambiente e mantém `rb03_executado=false`.
- O pacote de evidências é somente leitura e redige segredos.

## Achados bloqueadores

### R-15 — defaults ainda entram no caminho HTTP

Em `backend/app/Application/Interlojas/TransferenciaRequisicaoEmissaoFiscal/TransferenciaFiscalPrepararFotografiaService.php`, o caminho não-harness:

- substitui natureza ausente por `TRANSFERENCIA_MERCADORIAS_SAIDA`;
- injeta `tipo_nf=1`, `tp_imp=1`, `tp_emis=1`, `fin_nfe=1`, `ind_final=0`, `ind_pres=0` e `proc_emi=0`.

Isso contradiz `matriz-origem-fotografia-http.md`, que exige resolver esses campos do domínio/snapshot ou retornar `FONTE_*` antes do seal. O comentário no `TransferenciaFiscalFotografiaOrigemResolver` está correto, mas a chamada anterior já preenche os valores.

### R-17 — fallback de custódia na reconciliação

Em `backend/app/Application/Fiscal/Emissao/ProcessarReconciliacaoNfeJobHandler.php`, quando `buildFromSignedAndSefazResponse()` retorna `null`, o código ainda aceita o texto bruto se ele contiver `nfeProc` e `protNFe`. Esse ramo bypassa o `NfeProcIdentidadeRevalidator` e viola a regra “qualquer builder, inclusive canônico recebido, passa pela revalidação”.

O caminho nominal de autorização já é mais rigoroso, mas a reconciliação é exatamente o caminho usado após timeout/em processamento; o primeiro smoke não deve depender dela enquanto esse fallback existir.

## Endurecimentos necessários antes do teste real

- `NfePhpFiscalGateway` aplica endpoint em status/autorização, mas não há aplicação/prova equivalente no `sefazConsultaChave` e `sefazConsultaRecibo`, usados pela reconciliação. A decisão deve ser explícita: endpoint do snapshot aplicado também às consultas, ou equivalência oficial testada.
- A tarefa de teste do applicator não corresponde a um arquivo `NfePhpEndpointApplicatorTest.php` presente; `NfePhpXsdAndEndpointTest.php` cobre ausência do endpoint, não a chamada efetiva ao adapter.
- `NfePhpXsdPackageResolver` valida versão, arquivo, UF/modelo/ambiente e imports, mas `FiscalConfigSnapshot` não expõe metadado de hash do pacote/arquivo. A implementação não pode afirmar a validação de hash prevista no contrato; deve adicionar a fonte autoritativa ou bloquear quando ela for obrigatória.
- O grupo criado por `persistir_alvo` não grava snapshot hash. O gate compara diagnóstico com snapshot vigente e a fotografia selada pode carregar hash, mas existe uma janela entre gate e emissão. O prompt 18 deve decidir e testar o binding do alvo ao snapshot sem selar nem alocar.
- Permanecem métodos privados legados no gateway com nomes fixos/glob (`findNfeXsd`), embora não sejam o caminho principal. Devem ser removidos ou tornados impossíveis de usar para evitar regressão/aceite falso.

## Prontidão externa

Antes de qualquer POST de emissão:

- container PHP 8.5, Composer e extensões fiscais instalados;
- banco, Redis/Horizon, storage de artefatos e worker operacionais;
- `FISCAL_TRANSFERENCIA_SKIP_SEFAZ_TESTING=false`;
- filial base emissora e filial requisitante reais, UF coerente, CNPJ/IE/endereço IBGE/CRT;
- certificado A1 de homologação selecionável para a filial base, com vínculo explícito mesmo quando filiais compartilham raiz de CNPJ;
- `FiscalConfigSnapshot` de NF-e 55/homologação com endpoint status/autorização, leiaute, schemas e hash/identidade definidos;
- grupo único `Transferencia` com itens e fontes fiscais completas: natureza/código, NCM, CFOP, GTIN ou `SEM GTIN`, tributos, totais, transporte, pagamento e volumes quando aplicáveis.

## Roteiro após os ajustes

1. Rodar a suíte autoritativa no container e arquivar comando, exit code e lista de testes.
2. Executar `fiscal:diagnostico-homologacao --filial=<BASE> --modelo=55 --uf=<UF> --json`; exigir `APROVADO`, `cStat=107`, snapshot, certificado e infraestrutura.
3. Criar/obter um único alvo com o dry-run real e `persistir_alvo=true`; guardar `transferencia_ctx_id` e `grupo`.
4. Executar `fiscal:smoke-transferencia-homologacao --filial=<BASE> --modelo=55 --uf=<UF> --diagnostico-id=<ID> --grupo=<KEY> --json`; exigir `liberado_rb03=true`, `rb03_executado=false`, `proximo_passo.acao=emitir`.
5. Usar somente `POST /consultas/interlojas/transferencia-requisicao-exposicao/fiscal/emitir`, com o mesmo contexto, `tipo_operacao=Transferencia`, `X-Request-Id` único e sem overrides/fake/multi-grupo.
6. Consultar grupo/emissão/artefatos; confirmar fotografia selada, série/número, chave, XML assinado, resposta, protocolo real e `nfeProc` revalidado.
7. Se houver timeout ou processamento, consultar por recibo/chave; não retransmitir cegamente.
8. Confirmar uma única projeção idempotente, zero entrada fiscal, zero financeiro, zero venda/devolução e replay sem segunda numeração.
9. Montar `fiscal:pacote-evidencias-transferencia-homologacao --grupo=<KEY> --diagnostico-id=<ID> --json`, revisar segredos e preencher aprovação/aborto humano.

## Conclusão

O sistema está mais próximo do smoke, mas o veredito correto no estado observado é `NAO_LIBERAR_SMOKE_REAL`: os defaults HTTP e o fallback de `nfeProc` são bloqueadores; endpoint de consulta, prova XSD e binding de snapshot são ajustes de fechamento antes do primeiro teste real.
