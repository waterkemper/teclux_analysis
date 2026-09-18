# Classificacao das discrepancias e fronteira dos ajustes

## Decisoes

### Deve corrigir

- Parte Fornecedora: a diferenca Delphi/Laravel e confirmada. O Delphi usa o lookup limitado ao tipo F e copia o codigo para o cabecalho; a UI Laravel envia null e o contrato nao leva o tipo. O prompt da Consulta deve conectar o campo existente, transportar codigo e tipo F e tornar explicito o comportamento quando nao houver selecao. O Cadastro deve persistir exatamente o valor recebido.
- Escopo e identidade dos itens: o F10 Delphi percorre somente qryComprasTotal; o Laravel concatena abas e deduplica por Produto, podendo descartar uma linha selecionada ou misturar Filiais. O contrato deve usar a fonte total autoritativa e uma identidade que nao colida entre Produto e Filial quando ambos existirem. Nunca aplicar first wins silencioso a linhas conflitantes.
- Quantidade: preservar a quantidade decimal no contrato Laravel. A conversao AsInteger do Delphi e uma divergencia confirmada e deve ser tratada como comportamento legado a nao replicar, salvo uma decisao fiscal explicita em contrario. Continuam validas a selecao do campo escolhido e a exclusao de sugestao base zero ja fechadas no contrato atual.
- N+1: corrigir o enriquecimento por Produto no Cadastro, o enriquecimento do handoff e a consulta de descricao historica por item na gravacao. A implementacao deve ser batch/set-based, preservar fallback de produto ausente, fiscal persistido e descricao historica.

### Nao deve corrigir neste fluxo

- Nao introduzir vendedor de vendas por item: ele nao e transferido pelo F10 Delphi.
- Nao reespecificar a precedencia de valor, impostos ou motores ja decidida nos mapas anteriores.
- Nao substituir o carregamento batch de loadDetalhes, que ja e a forma adequada.
- Nao transformar as tres consultas condicionais das abas em um problema N+1.

### Oportunidades de segunda prioridade

- Consolidar releituras do cabecalho entre controller, suporte de itens e resposta da gravacao. A leitura apos mutacao deve ser preservada quando necessaria para valores calculados, triggers ou estado final.
- Adicionar listener/assertion de QueryExecuted nos testes do fluxo para medir limite de queries por tamanho de item. Nao fixar ganho absoluto antes da medicao.

## Invariantes do contrato F10

1. Uma geracao envia um contrato unico e a sessao e consumida uma vez.
2. Filial de faturamento e Parte Fornecedora selecionadas sao carregadas para o Pedido sem fallback silencioso para outra Filial ou fornecedor.
3. Parte Fornecedora e representada por codigo e tipo F quando o fluxo e de Fornecedor; ausencia deve ser explicita.
4. Itens, ordem, quantidade escolhida e valor unitario do contrato nao sao recalculados pelo Cadastro.
5. A quantidade e transportada como decimal canonico; sugestao base zero continua inelegivel.
6. Linhas conflitantes por Produto/Filial sao rejeitadas ou resolvidas explicitamente antes do contrato, nunca pela primeira ocorrencia.
7. O Cadastro pode enriquecer metadados de Produto, mas deve faze-lo em lote e sem alterar quantidade ou valor do contrato.

## Fronteira e dependencias

- Prompt 1 - Consulta de Compras: campo da Parte Fornecedora, tipo F, Filial de faturamento, fonte qryComprasTotal equivalente, chave de selecao, quantidade decimal e contrato.
- Prompt 2 - Cadastro de Pedidos: consumo do handoff, projecao batch de Produtos, descricao historica, consolidacao de releituras e observabilidade de queries.
- Dependencia: o prompt do Cadastro consome o formato estabilizado pelo prompt da Consulta; ambos compartilham as invariantes acima. O Cadastro nao deve buscar novamente quantidades ou valores para reconstruir o contrato.

## Classificacao geral

Os desvios de fornecedor e itens/quantidades sao DIVERGENTE e POSSIVEL BUG quando o objetivo e paridade funcional. Os N+1 sao CONFIRMADO. A conversao inteira do Delphi e bug legado a nao replicar. O carregamento batch da Consulta, a chamada unica de impostos e as consultas condicionais das abas sao decisoes corretas ou oportunidades fora da prioridade funcional.
