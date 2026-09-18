# Prompt para /speckit.specify - Fechamento pos-35 do F10 da Consulta de Compras

~~~text
/speckit.specify

Crie uma especificacao corretiva, incremental e verificavel para fechar os residuos da implementacao do prompt 35-speckit-prompt-ajuste-pos-34-f10-selecao-queries.md em /mnt/c/teclux_analysis/modules/estoque/consulta-compras/ no F10 da Consulta de Compras. Gere a especificacao; nao implemente nesta etapa.

## Contexto e fronteira da revisao

Revisao realizada no repositorio `laravel`, comparando a implementacao do prompt 35 no commit `6ab87cd8` com o fechamento anterior do prompt 34 no commit `5d621075`. O prompt 35 corrigiu os principais riscos funcionais: conflito duplicado Produto/Filial na fonte Total, identidade visual da linha, normalizacao compartilhada, rejeicao correlacionada e retirada da leitura de precos informativos do caminho F10.

Ainda faltam evidencias e ajustes de baixo risco antes de considerar o trabalho encerrado:

1. O teste de budget do POST verifica quantidade de consultas e ausencia de tabelas de precos informativos, mas nao verifica que os valores retornados pela projecao continuam corretos segundo a precedencia F10.
2. O teste de cardinalidade usa diretamente `loadValoresUnitariosF10(..., batchSize: 3)` no repositorio. Nao existe evidencia equivalente do endpoint para uma cardinalidade maior que `BATCH_SIZE`, nem uma decisao documentada sobre como tornar esse limite testavel sem acoplar o teste a um detalhe privado.
3. `loadValoresUnitariosF10` reutiliza `loadEstoquesBatch`, que seleciona colunas e faz join com `produtos` usadas pelo detalhamento completo, mas nao consumidas pela projecao F10. Isso nao reintroduz N+1, porem deixa uma oportunidade concreta de reduzir trabalho por lote.
4. O consumidor do handoff reconstrói os itens com Produto, quantidade e valor, descartando o campo `filial` que existe no contrato. Deve ser tomada uma decisao explícita sobre essa perda: preservar a filial por linha no rascunho, se ela fizer parte do contrato funcional do F10, ou documentar e testar que o Cadastro trabalha intencionalmente apenas com `filial_fatura` no cabeçalho.
5. O `git diff --check` da feature 447 ainda acusa trailing whitespace nos documentos gerados da especificacao, contrariando o requisito de higiene introduzido pelo prompt 35.

## Leituras obrigatorias

- `/mnt/c/teclux_analysis/modules/estoque/consulta-compras/35-speckit-prompt-ajuste-pos-34-f10-selecao-queries.md`;
- `specs/447-fix-cc-f10-residuals/spec.md`, `plan.md`, `tasks.md` e `contracts/`;
- `backend/app/Infrastructure/Persistence/Legacy/Estoque/LegacyConsultaComprasDetalheCompraRepository.php`;
- `backend/app/Services/Estoque/ConsultaComprasGerarPedidoContratoService.php`;
- `backend/app/Services/Estoque/PedidoCompra/PedidoCompraHandoffService.php`;
- `backend/app/Domain/Estoque/ConsultaCompras/GerarPedidoLinhaIdentity.php`;
- `backend/tests/Feature/Estoque/ConsultaCompras/ConsultaComprasGerarPedidoContratoTest.php`;
- `backend/tests/Feature/Estoque/ConsultaCompras/ConsultaComprasDetalheCompraBatchTest.php`;
- `backend/tests/Feature/Estoque/PedidoCompra/PedidoCompraHandoffTest.php`, se existente;
- os testes unitários de `GerarPedidoCompraContractBuilder`, `GerarPedidoSelecaoConflictGuard` e identidade de linha.

Classifique cada descoberta como CONFIRMADO, INFERIDO, DUVIDA, POSSIVEL BUG ou OPORTUNIDADE, citando arquivo e linha. Nao transforme uma DUVIDA sobre a semantica do Cadastro em alteracao automatica do Cadastro.

## Ajuste 1 - provar os valores da projecao F10

Fortalecer os testes do caminho `valores` ausente para provar simultaneamente budget e resultado funcional:

- sem `valores`, retornar para um conjunto controlado de Produto/Filial os campos `precocomicms`, `valorultimacompra` e `customedio` esperados;
- verificar a precedencia vigente `precocomicms -> valorultimacompra -> customedio`, incluindo pelo menos um caso em que cada alternativa seja escolhida;
- verificar que Produto/Filial nao cruza o valor de outra filial e que duplicidades de entrada nao multiplicam o resultado;
- manter a assercao de ausencia de `colunasprecos` e `fatoresprecosfiliais`;
- cobrir o caminho com `valores` informado e confirmar que ele nao executa consultas de detalhe.

O teste nao pode passar apenas porque recebeu a quantidade esperada de itens: deve falhar se a projecao devolver valor nulo, zero indevido ou valor de outra filial.

## Ajuste 2 - evidenciar o budget do endpoint por cardinalidade

Criar uma evidencia que atravesse o endpoint `estoque.consulta-compras.gerar_pedido_contrato` e demonstre crescimento por lote, nao por item:

- usar uma quantidade de itens maior que `BATCH_SIZE` (atualmente 250), ou tornar o tamanho do lote uma dependencia/configuracao de teste explicitamente injetavel;
- definir o limite exato: no maximo o numero de consultas de detalhe por lote multiplicado por `ceil(N / BATCH_SIZE)`, com a margem documentada;
- contar somente consultas de detalhe F10, separando autorizacao, fornecedor, parametros e catalogo;
- garantir que nenhuma consulta por Produto/Filial seja executada dentro de loop;
- verificar que o endpoint continua retornando todos os itens e os valores corretos;
- se a infraestrutura de teste nao puder suportar um POST com mais de 250 itens, registrar a razao, manter o teste direto do repositorio como complemento e documentar por que a fronteira do endpoint ficou coberta de modo equivalente.

Nao aceitar como unica prova um teste que chama diretamente o repositorio com `batchSize: 3` sem verificar a integracao do service/controller.

## Ajuste 3 - estreitar a projecao SQL F10 sem regressao

Avaliar e, se confirmado, corrigir a reutilizacao da consulta ampla de estoques:

- a leitura especifica do F10 deve selecionar somente Produto, Filial e os campos realmente necessarios para `precocomicms` e `valorultimacompra`, sem join ou colunas usadas apenas por `loadDetalhes`;
- manter `loadDetalhes` completo e inalterado para as demais telas que precisam de estoque, datas, aliquota, precos e dados de cadastro;
- manter `computeCustomedioBatch` em lote e sem N+1;
- nao alterar a precedencia de valores, arredondamento ou semantica de filial;
- adicionar teste que inspecione a consulta/projecao de F10 e impeça a reintroducao de colunas/join informativos desnecessarios;
- medir o numero de consultas antes/depois somente quando a medicao for deterministica no ambiente de teste.

Se a consulta ampla for mantida por uma justificativa de compatibilidade do driver legado, documentar a justificativa e registrar a oportunidade como aceita, sem mascarar a decisao como correcao.

## Ajuste 4 - decidir a filial no handoff do Cadastro

Comparar o contrato emitido pelo F10 com o rascunho consumido por `PedidoCompraHandoffService` e decidir explicitamente:

- se a filial por item for parte da semantica funcional do contrato, preservá-la até o rascunho e adicionar teste de Produto/Filial;
- se o Cadastro de Pedidos aceitar somente `filial_fatura` no cabeçalho e descartar filial por linha for intencional, documentar essa fronteira no contrato e testar que a filial do cabeçalho permanece correta;
- em ambos os casos, manter fornecedor ausente como ausencia, nao criar vendedor de vendas e nao gravar handoff quando houver rejeicao F10;
- nao alterar o Cadastro completo sem evidencia de que a filial por linha deve ser exibida ou persistida nele.

## Higiene, testes e criterios de aceite

- remover trailing whitespace introduzido pelos documentos de `specs/447-fix-cc-f10-residuals/` e executar `git diff --check` somente no conjunto alterado da feature;
- atualizar `tasks.md`, a matriz de testes e a documentacao da decisao sem marcar cobertura que nao foi executada;
- executar os testes PHPUnit F10, handoff e unitarios relevantes, alem dos testes Vitest de payload/identidade quando alterados;
- registrar claramente bloqueios de infraestrutura, como servico PHP/Docker indisponivel ou falha de permissao do runner JavaScript;
- preservar os testes de conflito, cancelamento, fornecedor, quantidades decimais, ordem e destaque visual já adicionados no prompt 35.

## Fora de escopo

Nao alterar Delphi, schema, migrations, seeds, motores de sugestao/custo/impostos, regras de vendedor de vendas, F11, Requisicao entre Filiais ou o Cadastro de Pedidos completo sem a decisao explícita do Ajuste 4. Nao reintroduzir `colunasprecos`/`fatoresprecosfiliais`, nao usar first wins para conflito F10, nao truncar quantidades decimais e nao mudar a precedencia `precocomicms -> valorultimacompra -> customedio`.
~~~
