# Revisar implementação 361-362 e prontidão para homologação

Type: research
Status: resolved
Blocked by:

## Question

Após a implementação das specs 15/361 e 16/362, o caminho atual está pronto para o primeiro teste real de NF-e 55 de `Transferencia` em homologação? Se não, quais prompts `/speckit.specify` devem orientar os ajustes sem implementar código?

## Scope

Somente `Transferencia`, NF-e modelo 55 e homologação SEFAZ. `VendaTransferencia`, `DevolucaoTransferencia`, NF-e de entrada e financeiro permanecem fora do fluxo.

## Answer

As specs 361 e 362 fecharam boa parte dos bloqueadores anteriores: rota HTTP sem overrides fiscais, resolução de certificado por filial no diagnóstico, volumes no serializer, aplicação de endpoint em status/autorização, XSD sem `glob` no resolver principal, matcher de alvo, gate com grupo real e pacote sanitizado.

O primeiro smoke real ainda não deve ser liberado sem dois ajustes complementares:

1. O preparador HTTP ainda injeta defaults de natureza e indicadores `ide` fora do harness, contrariando a matriz autoritativa da spec 361. A ausência deve ser resolvida por fonte de domínio ou bloquear antes do seal.
2. A reconciliação ainda possui fallback que aceita XML `nfeProc` textual quando o builder/revalidator retorna `null`, permitindo custódia sem a prova final obrigatória.

Há também endurecimentos recomendados antes de depender do caminho de timeout/reconciliação em homologação: aplicar e provar endpoint no caminho de consulta por chave/recibo, completar a prova automatizada do endpoint efetivo e alinhar o metadado/hash do pacote XSD ao `FiscalConfigSnapshot`.

Prompts publicados:

- [17 — correções residuais R-15/R-17](../../../modules/interlojas/transferencia-requisicao-emissao-fiscal/17-speckit-prompt-specify-correcoes-residuais-r15-r17.md)
- [18 — gateway, XSD e fechamento operacional](../../../modules/interlojas/transferencia-requisicao-emissao-fiscal/18-speckit-prompt-specify-fechamento-gateway-xsd-homologacao.md)

## Evidências locais

- Checkout Laravel revisado: `56f6b8d3`.
- Sintaxe PHP dos arquivos críticos revisada sem erro no PHP local 8.2.21.
- Suíte completa não executada: o projeto exige PHP 8.5 no container e o daemon Docker não estava acessível nesta sessão.
- As alterações observadas são do usuário; esta revisão não alterou código Laravel.

## Veredito operacional

`NAO_LIBERAR_SMOKE_REAL` até implementar e executar os prompts 17 e 18 no container PHP 8.5, obter suíte autoritativa verde, diagnóstico `APROVADO` com `cStat=107`, gate `liberado_rb03=true` e grupo real único.
