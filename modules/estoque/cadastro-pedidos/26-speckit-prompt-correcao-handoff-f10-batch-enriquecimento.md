# Prompt para /speckit.specify - Correcao do handoff F10 e enriquecimento batch

~~~text
/speckit.specify

Crie uma especificacao corretiva e incremental para o Cadastro de Pedidos de Compra consumir o contrato F10 da Consulta de Compras. Gere a especificacao; nao implemente nesta etapa.

Este prompt depende do contrato estabilizado pelo prompt 34 de modules/estoque/consulta-compras e complementa os prompts existentes desta pasta. Nao reespecifique o Cadastro inteiro. O objetivo e preservar integralmente Parte Fornecedora, Filial, itens, quantidade e valor recebidos, eliminando N+1 confirmados e releituras evitaveis.

## Leituras obrigatorias

- prompt 34 de modules/estoque/consulta-compras;
- prompts existentes desta pasta e as auditorias auditoria-implementacao-laravel-atual.md, auditoria-delphi-paridade-nao-coberta.md e auditoria-matriz-requisitos-prompts.md;
- .scratch/cadastro-pedidos-consulta-compras-paridade-wayfinder/docs/04-queries-n-plus-one.md;
- .scratch/cadastro-pedidos-consulta-compras-paridade-wayfinder/docs/05-classificacao-fronteira.md;
- PedidoCompraController, PedidoCompraHandoffService, PedidoCompraCadastroPageService e GravarPedidoCompraService;
- PedidoCompraItemDocumentoSupport, PedidoCompraItemProdutoResolveService, LegacyPedidoCompraItemRepository e LegacyPedidoCompraRepository;
- Feature tests de PedidoCompraHandoff e de Cadastro/gravacao.

Inspecione o checkout antes de especificar e classifique descobertas como CONFIRMADO, INFERIDO, DUVIDA, NAO LOCALIZADO, DIVERGENTE, POSSIVEL BUG, SEM PROVA ou OPORTUNIDADE.

## Contrato a preservar

O Cadastro recebe um contrato unico, consumido uma vez da sessao, contendo Filial de faturamento, Parte Fornecedora opcional com tipo F quando aplicavel e itens na ordem recebida. Cada item ja possui Produto, quantidade decimal e valor unitario decimal escolhidos na Consulta.

Nao buscar novamente nem recalcular quantidade, campo escolhido, valor unitario ou regra de sugestao zero. Nao selecionar vendedor de vendas por item. Nao substituir a Filial de faturamento do contrato pela FilialBase do rascunho. Ausencia de fornecedor continua ausencia explicita.

## Evidencia do problema atual

- PedidoCompraController::mapItensMinimosParaRicos percorre cada item e chama produtoResolveService->resolve(produto). PedidoCompraItemProdutoResolveService::resolve faz consulta de Produto com joins e pode consultar fator de conversao, ICMS, PIS/COFINS e natureza.
- PedidoCompraItemDocumentoSupport::listarItensEnriquecidos le os itens e chama enriquecerLinha por linha; enriquecerLinha chama o mesmo resolver por Produto.
- GravarPedidoCompraService chama resolverDescricaoProduto dentro do array_map de linhas. resolverDescricaoProduto consulta descricaoHistoricaFromCadastro mesmo quando a descricao historica recebida ja esta preenchida, pois a expressao e avaliada antes de preferirHistorico.
- PedidoCompraController::cadastro e GravarPedidoCompraService releem o cabecalho em pontos que podem compartilhar o snapshot, embora a leitura final apos mutacao deva continuar quando necessaria.
- LegacyConsultaComprasDetalheCompraRepository::loadDetalhes ja deduplica pares e usa loaders batch; nao substituir nem duplicar essa estrategia.
- PedidoCompraHandoffService::calcularImpostosUmaVez ja monta todas as linhas e chama o motor uma vez; nao criar chamada por item.

## Especificacao do enriquecimento batch

Defina uma projecao ou servico de leitura em lote para os Produtos distintos do contrato e para os Produtos das linhas persistidas. A projecao deve:

- carregar os campos comuns de cadastro, grades, ANVISA, preco e dados fiscais necessarios em uma consulta ou conjunto limitado de consultas set-based;
- indexar por codigo do Produto e devolver as linhas na ordem original;
- preservar fallback deterministico para Produto inexistente sem disparar nova consulta por linha;
- separar dados comuns de Produto de resolucoes dependentes de contexto. Se fiscal, natureza ou fator tiver contexto variavel, agrupar por chave de contexto e nunca transformar o batch em um loop disfar?ado;
- preservar fiscal persistido sobre o valor resolvido quando essa e a regra atual;
- preservar descricao historica persistida ou recebida. Consultar o cadastro para descricao somente para Produtos sem snapshot, em lote, mantendo composicao, sanitizacao e limite de 120 caracteres.

Nao usar eager loading de ORM como justificativa suficiente: as tabelas sao legadas e existem funcoes SQL especificas. A especificacao deve citar a SQL ou projecao equivalente e provar que joins, funcoes de preco e regras fiscais nao mudaram.

## Handoff e Cadastro

- Substituir o enriquecimento item-a-item do handoff por uma chamada batch, sem reler a Consulta, a sessao ou o contrato por item.
- Reaproveitar o cabecalho ja carregado ao mapear itens e abas quando a semantica permitir.
- No caminho de pedido persistido, evitar pedidoRepo->find repetido entre controller, suporte e mapeamento; manter uma leitura final apos mutacao quando triggers, impostos ou valores calculados puderem alterar o estado.
- No salvamento, nao consultar descricao historica quando a linha ja possui descricao nao vazia; para lacunas, usar a projecao batch.
- Manter as consultas de abas condicionais e limitadas; elas nao sao N+1 e nao devem ser removidas sem requisito.

## Arquivos e seams esperados

Revalidar e especificar alteracoes apenas nos seams necessarios:

- controller e handoff do Cadastro;
- suporte de itens e resolver ou projecao batch de Produto;
- servico de gravacao e repositorios legados;
- testes Feature e infraestrutura de medicao de queries.

Nao criar migrations, seeds, tabelas novas, read model persistente ou alteracao Delphi neste prompt sem uma decisao separada. Uma projecao em memoria ou query set-based deve ser priorizada.

## Criterios de aceite

- Abrir Cadastro por handoff com N itens preserva exatamente Produto, ordem, quantidade, valor, Filial de faturamento e Parte Fornecedora do contrato.
- Handoff com fornecedor ausente nao cria fornecedor; fornecedor informado mantem codigo e tipo F.
- Produto inexistente produz fallback explicito e nao uma consulta adicional por item.
- Enriquecimento de N itens usa contagem de queries independente de N, salvo numero constante de leituras por contexto; nao existe resolve com acesso ao banco dentro de loop de item.
- listarItensEnriquecidos usa a mesma estrategia batch e preserva fiscal persistido, situacao, descricao e ordem.
- Gravacao com descricao historica preenchida nao faz consulta de snapshot por item; lacunas sao resolvidas em lote.
- A resposta final continua refletindo o estado persistido apos mutacao, mas nao rele o mesmo cabecalho sem necessidade.
- loadDetalhes, impostos em chamada unica e consultas de abas condicionais permanecem semanticamente iguais.

## Testes e regressao

Criar testes com zero, um e muitos itens, Produtos repetidos no contrato, Produto inexistente, fornecedor informado/ausente, filial valida, fiscal persistido, descricao historica preenchida/vazia e alteracao que aciona leitura final.

Usar listener de QueryExecuted nos testes Feature para comparar o caminho de um contra N itens e falhar quando a contagem crescer linearmente por Produto. Testar tambem que o contrato nao sofre alteracao apos enriquecimento e que a resposta de gravacao mantem os valores persistidos.

Executar regressao dos testes de handoff, Cadastro, gravacao, impostos e abas. Nao depender de Excel instalado nem de dados artificiais que eliminem as funcoes SQL usadas no PostgreSQL.

## Observabilidade

Adicionar, quando o padrao do projeto permitir, metricas ou log debug estruturado com correlation_id, quantidade de itens, Produtos distintos, grupos de contexto e contagem de queries. Nao registrar dados pessoais nem habilitar logging ruidoso em producao. Documentar o limite de queries medido e o motivo de qualquer leitura final apos mutacao.

## Fora de escopo

Alterar o contrato funcional da Consulta, motores de sugestao/custo/impostos, selecao de fornecedor na UI da Consulta, vendedor de vendas, Requisicao entre Filiais, migrations, seeds, novo read model persistente, alteracao Delphi, relatorios/exportacoes e implementacao nesta etapa.
~~~
