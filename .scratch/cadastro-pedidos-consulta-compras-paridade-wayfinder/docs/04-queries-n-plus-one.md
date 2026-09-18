# Auditoria de queries e N+1 no fluxo integrado

## Escopo e metodo

Auditoria estatica do caminho F10 Laravel: contrato da Consulta de Compras, consumo da sessao no Cadastro de Pedido e gravacao posterior. Nao houve benchmark nem log de queries em runtime; portanto os achados de impacto sao estaticos e devem ser validados por teste de contagem antes da implementacao.

## Achados

### CONFIRMADO - carregamento da Consulta de Compras ja e set-based

Em `LegacyConsultaComprasDetalheCompraRepository::loadDetalhes` (linhas 33-85), os pares Produto/Filial sao deduplicados e processados em chunks. Cada chunk chama `loadEstoquesBatch`, `computeCustomedioBatch` e `loadPrecosInformativosBatch`. O contrato F10 chama `loadDetalhes` uma vez quando precisa completar valores.

Nao foi localizado N+1 por item nessa etapa. A alternativa correta ja esta presente: leitura em lote com projecoes especificas. Nao criar uma otimizacao duplicada no prompt.

### CONFIRMADO - N+1 no enriquecimento do Cadastro para pedidos persistidos

`PedidoCompraItemDocumentoSupport::listarItensEnriquecidos` (linhas 110-118) faz uma leitura de itens e depois percorre cada linha chamando `enriquecerLinha`. Este metodo chama `PedidoCompraItemProdutoResolveService::resolve` (linhas 125-145).

O resolver executa pelo menos uma consulta `produtos` com joins e `first` por Produto (linhas 97-144). Dependendo do contexto, tambem consulta fator de conversao, aliquota ICMS, aliquotas PIS/COFINS e natureza. Assim, para N itens, a forma atual e uma consulta de itens mais N resolucoes de produto, com possiveis consultas auxiliares por item.

O caminho direto do Cadastro chama esse suporte no controller (linhas 159-163). O mesmo suporte e usado para montar a resposta apos gravacao (linhas 195-211 de `GravarPedidoCompraService`). E um N+1 confirmado por leitura estatica; a quantidade real depende de N e do driver/contexto.

Alternativa: adicionar uma projecao batch que receba todos os Produtos e o contexto comum, carregue os campos de cadastro em uma consulta (ou poucas consultas set-based) e faca o merge fiscal em memoria. Preservar o fallback de produto inexistente e a precedencia do fiscal persistido. Nao trocar por eager loading de ORM sem demonstrar que as tabelas legadas e as funcoes SQL mantem a mesma semantica.

### CONFIRMADO - N+1 no handoff de itens minimos para itens ricos

`PedidoCompraController::mapItensMinimosParaRicos` (linhas 1078-1126) percorre cada item do contrato da Consulta e chama `produtoResolveService->resolve($produto)` na linha 1090. O contrato contem somente Produto, quantidade e valor; portanto cada Produto e reconsultado individualmente para renderizar o primeiro Cadastro.

Como o resolver consulta `produtos` por chave (linhas 89-144 de `PedidoCompraItemProdutoResolveService`), o handoff de N itens cria uma consulta por item, alem das consultas auxiliares que o resolver puder ativar. Esse achado e separado do N+1 de pedidos persistidos, embora possa compartilhar a mesma projecao batch.

Alternativa: resolver os Produtos distintos do contrato em lote e indexar o resultado por codigo, mantendo uma linha de fallback para produto ausente. O limite e a ordenacao devem continuar sendo os do contrato; a mudanca nao deve buscar novamente quantidades nem recalcular o valor unitario selecionado.

### CONFIRMADO - consulta por item na gravacao da descricao historica

`GravarPedidoCompraService::replaceAll` (linhas 151-170) chama `itemSupport->resolverDescricaoProduto` dentro do `array_map`, uma vez por item. `PedidoCompraItemDocumentoSupport::resolverDescricaoProduto` (linhas 64-70) chama `descricaoHistoricaFromCadastro`; essa chamada ocorre antes de `preferirHistorico`, mesmo quando a descricao historica recebida ja esta preenchida.

`descricaoHistoricaFromCadastro` executa uma consulta por Produto com join em `caracteristicas`. Logo, a gravacao de N itens tem uma consulta adicional por item que pode ser evitada quando o snapshot ja esta presente, ou substituida por carregamento em lote quando ele nao estiver.

Alternativa segura a decidir no prompt: primeiro preservar descricao nao vazia recebida pelo contrato/UI sem consultar o cadastro; para lacunas, carregar os Produtos distintos em lote. Validar a regra de snapshot historico e o limite de 120 caracteres.

### CONFIRMADO - releituras do cabecalho no caminho persistido

No `PedidoCompraController::cadastro`, o cabecalho e lido em `pedidoRepo->find` na linha 159 e e lido novamente na linha 188. Entre essas chamadas, `listarItensEnriquecidos` tambem chama `pedidoRepo->find` internamente (linha 112 de `PedidoCompraItemDocumentoSupport`). A segunda leitura do controller pode ser intencional para mapear o estado final e o resumo do fornecedor, mas e uma releitura observavel do mesmo pedido dentro da requisicao.

Na resposta de `GravarPedidoCompraService`, ha leitura final na linha 196 e outra leitura indireta ao chamar `listarItensEnriquecidos` na linha 211. Consolidar o snapshot do cabecalho e passalo ao mapeamento/enriquecimento e uma oportunidade, desde que o prompt preserve a leitura apos a mutacao quando ela for necessaria para refletir triggers ou valores calculados.

### OPORTUNIDADE - consultas de abas sao limitadas e condicionais

`PedidoCompraCadastroPageService::buildAbasPayload` (linhas 28-45) executa no maximo tres leituras independentes: resumo do fornecedor, notas fiscais do pedido e contatos do fornecedor. Nao ha loop por item nem lazy loading. Essas consultas sao parte do payload de abas e nao foram classificadas como N+1. No handoff sem fornecedor e sem numero persistido, elas sao puladas.

### CONFIRMADO - impostos do handoff nao fazem chamada por item

`PedidoCompraHandoffService::calcularImpostosUmaVez` constroi todas as linhas em memoria e chama `MotorImpostosService::calcularDocumento` uma vez. A UI tambem faz um POST de geracao e uma navegacao para o Cadastro; nao ha requisicao HTTP por item nesse trecho.

## Decisao para os prompts

Separar as correcoes por fronteira: a projecao batch e a reducao de releituras do enriquecimento pertencem a `modules/estoque/cadastro-pedidos`; o contrato F10 deve apenas consumir a projecao/servico sem voltar a buscar quantidades ou valores. Os prompts devem exigir instrumentacao de query count nos testes do fluxo, pois nao existe prova runtime nesta auditoria.

## Nao localizado

Nao foi localizado log de queries, teste com listener de `QueryExecuted` ou assertion de limite de consultas especifico para F10/Cadastro nos testes inspecionados. Nao afirmar numero absoluto de queries nem ganho de performance antes dessa medicao.
