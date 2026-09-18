# Publicar prompts corretivos da integração Consulta de Compras → Pedido de Compra

Type: task
Status: resolved
Blocked by: 05

## Question

Consolidar os prompts `/speckit.specify` resultantes da auditoria, na pasta `modules/estoque/cadastro-pedidos` e/ou `modules/estoque/consulta-compras` escolhida no ticket de classificação. Cada prompt deve ser autocontido, incremental e incluir evidências, pré-requisitos, arquivos/seams afetados, contrato de vendedor/Parte Fornecedora, filial, valor e quantidade, correções de query/N+1 comprovadas, critérios de aceite, testes, regressões, observabilidade e fora de escopo. Não duplicar nem contradizer os prompts já publicados.
## Answer

Os dois prompts corretivos foram publicados:

- Consulta de Compras: modules/estoque/consulta-compras/34-speckit-prompt-correcao-integracao-pedido-fornecedor-quantidades.md
- Cadastro de Pedidos: modules/estoque/cadastro-pedidos/26-speckit-prompt-correcao-handoff-f10-batch-enriquecimento.md

O primeiro prompt fecha Parte Fornecedora/tipo F, Filial de faturamento, escopo qryComprasTotal, identidade Produto/Filial, quantidades decimais, sugestao zero e precedencia de valor, sem introduzir vendedor de vendas.

O segundo prompt fecha o consumo do contrato e os N+1 confirmados no handoff, no enriquecimento de itens persistidos e na descricao historica. Tambem exige reaproveitamento de cabecalho, testes com QueryExecuted e observabilidade sem fixar metas de query nao medidas.

Os prompts sao incrementais, referenciam as specs existentes e mantem fora de escopo motores ja decididos, migrations, seeds, Delphi, Requisicao entre Filiais e implementacao imediata. Nenhum codigo de producao foi alterado.
