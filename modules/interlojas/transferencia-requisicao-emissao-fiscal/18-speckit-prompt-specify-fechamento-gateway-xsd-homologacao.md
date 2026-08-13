# Prompt `/speckit.specify` — Fechamento do gateway, XSD e alvo de homologação

## Contexto

Revisar a implementação atual das specs 361/362 para permitir, somente após evidência automatizada, o primeiro smoke real de NF-e 55 `Transferencia` em homologação. Não implementar nesta etapa. Gerar uma spec `/speckit.specify` com contratos, riscos, testes e tarefas.

Fora do escopo: `VendaTransferencia`, `DevolucaoTransferencia`, NF-e de entrada, financeiro, produção e novo pipeline fiscal.

## Lacunas a fechar

1. O endpoint do `FiscalConfigSnapshot` é aplicado em status e autorização, mas o gateway ainda consulta chave/recibo sem aplicar ou provar a URL efetiva do snapshot. Reconciliação é parte do smoke e não pode depender de mapeamento implícito.
2. A cobertura existente testa endpoint ausente, mas não prova que a chamada do adapter usa a URL A do snapshot; criar teste de adapter/Tools com observação da URL efetiva ou equivalência oficial documentada e testada.
3. `NfePhpXsdPackageResolver` seleciona versão/arquivo/imports e verifica UF/modelo/ambiente, mas o modelo atual de `FiscalConfigSnapshot` não contém metadado explícito para hash do arquivo/pacote XSD. Definir fonte autoritativa; se o hash for obrigatório e estiver ausente, bloquear em vez de declarar validação verde.
4. Permanecem helpers privados legados no gateway com nomes fixos e `glob`; remover ou tornar impossível que sejam usados como autoridade, e adicionar teste de regressão contra seleção `last-wins`.
5. `persistir_alvo` cria identidade sem seal, mas não registra o snapshot hash. Decidir e implementar contrato para impedir corrida entre gate e emissão: o alvo deve ser comparado ao diagnóstico e ao snapshot vigente sem alocar número nem selar fotografia.

## Requisitos funcionais

- Status, autorização, consulta por chave e consulta por recibo devem usar endpoint compatível com o snapshot; ausência, não aplicação ou divergência devem ser tipadas e fail-closed.
- A evidência sanitizada deve registrar serviço, endpoint do snapshot, endpoint efetivo, UF, ambiente, autorizador e leiaute, sem certificados, senhas ou tokens.
- XSD deve ser escolhido deterministicamente pela versão do leiaute e `schemaRootRef`; imports/includes, escopo UF/ambiente/modelo e hash quando declarado devem ser conferidos.
- O diagnóstico deve continuar usando a filial emissora concreta; o grupo, diagnóstico, filial, UF, modelo, ambiente e snapshot devem identificar o mesmo alvo.
- O gate continua somente leitura: `rb03_executado=false`; a emissão ocorre apenas na rota HTTP Transferencia existente.
- O pacote de evidências deve ser somente leitura, por grupo, e não deve criar emissão, projetar ou retransmitir.

## Testes de aceite obrigatórios

- Snapshot URL A em status recebe A no adapter; URL ausente bloqueia.
- Snapshot URL A em autorização recebe A no adapter; URL ausente bloqueia.
- Snapshot URL A em consulta por chave/recibo recebe A ou passa por equivalência oficial explícita e testada.
- Endpoint efetivo divergente não é aceito como evidência verde.
- Pacote XSD com versão errada, import quebrado, hash divergente ou escopo incompatível bloqueia com código tipado; dois XSDs no diretório não causam escolha por `glob`.
- Grupo/diagnóstico com snapshot diferente bloqueia `liberado_rb03`; alteração do snapshot entre gate e emissão não pode transmitir o alvo errado.
- O comando de gate não aloca, não transmite e não chama `EmitirGrupo`; pacote também não produz efeitos fiscais.

## Critério operacional final

Só liberar o roteiro quando, no container PHP 8.5:

1. suíte 357–362 e nova suíte verde;
2. diagnóstico `APROVADO` com `cStat=107`, certificado da filial base, schemas, endpoint e infraestrutura;
3. dry-run real criar no máximo um alvo `Transferencia` sem seal/série/número;
4. smoke devolver `liberado_rb03=true`, `rb03_executado=false`, `proximo_passo.acao=emitir`;
5. POST de emissão usar apenas `transferencia_ctx_id`, `tipo_operacao=Transferencia`, contexto do mesmo grupo e `X-Request-Id` único;
6. após autorização, consultas/reconciliação, `nfeProc`, projeção, replay e pacote sanitizado produzirem as evidências do runbook, sem efeitos de entrada, venda, devolução ou financeiro.

## Saída esperada da spec

Publicar `spec.md`, contratos endpoint/XSD/alvo/evidências, plano, tarefas, quickstart de homologação e matriz de abortos. Não alterar código nesta etapa e não declarar o ambiente pronto apenas porque o diagnóstico foi aprovado.
