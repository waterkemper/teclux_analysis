# Prompt para /speckit.specify - Ajustes pos-34 no F10 da Consulta de Compras

~~~text
/speckit.specify

Crie uma especificacao corretiva e incremental para as lacunas encontradas na revisao da implementacao do prompt 34 /mnt/c/teclux_analysis/modules/estoque/consulta-compras/ (feature 445, commit ecc 34). Gere a especificacao; nao implemente nesta etapa.

## Contexto e fronteira da revisao

Revisao realizada em `laravel` no commit `5d621075` (`ecc 34`), comparado ao pai `0f1383cd`. A implementacao fechou fornecedor F, filial por linha, fonte Total, filtro de sugestao zero, quantidade decimal, conflito no POST e log de correlacao. Entretanto, ainda ha riscos na construcao do payload, ausencia de evidencias de query budget no endpoint e duplicacao de normalizacao.

## Leituras obrigatorias

- `/mnt/c/teclux_analysis/modules/estoque/consulta-compras/34-speckit-prompt-correcao-integracao-pedido-fornecedor-quantidades.md`;
- `backend/resources/js/Pages/Cadastros/Estoque/ConsultaCompras/buildGerarPedidoPayload.ts`;
- `backend/resources/js/Pages/Cadastros/Estoque/ConsultaCompras/Index.tsx`;
- `backend/resources/js/Pages/Cadastros/Estoque/ConsultaCompras/components/AbaProdutosTotal.tsx`;
- `backend/app/Services/Estoque/ConsultaComprasGerarPedidoContratoService.php`;
- `backend/app/Domain/Estoque/ConsultaCompras/GerarPedidoCompraContractBuilder.php`;
- `backend/app/Domain/Estoque/ConsultaCompras/GerarPedidoLinhaIdentity.php`;
- `backend/app/Domain/Estoque/ConsultaCompras/GerarPedidoSelecaoConflictGuard.php`;
- `backend/app/Infrastructure/Persistence/Legacy/Estoque/LegacyConsultaComprasDetalheCompraRepository.php`;
- `backend/app/Services/Estoque/PedidoCompra/PedidoCompraHandoffService.php`;
- testes F10 existentes e `ConsultaComprasDetalheCompraBatchTest`;
- `specs/445-fix-cc-f10-pedido/spec.md` e `tasks.md` no commit 5d621075.

Classifique cada descoberta como CONFIRMADO, INFERIDO, DUVIDA, POSSIVEL BUG ou OPORTUNIDADE, citando arquivo e linha.

## Ajuste 1 - nunca aplicar first wins a conflito da fonte Total

Hoje `buildGerarPedidoSelecionadosF10` cria `byKey` com `if (!byKey.has(key))`, descartando silenciosamente a segunda linha quando `produtos_total` contem duas ocorrencias com a mesma chave `produto|filial`. Nesse caso o backend recebe apenas uma ocorrencia e `GerarPedidoSelecaoConflictGuard` nao consegue rejeitar o conflito.

Definir uma estrategia unica e explicita:

- detectar duplicidade da chave completa na fonte Total antes de reduzir o mapa;
- rejeitar com `F10_LINHA_CONFLITO` e informar Produto/Filial, ou transportar todas as ocorrencias ate o guard backend para obter a mesma rejeicao; nunca escolher a primeira;
- manter a ordem da selecao quando as chaves forem validas;
- manter Produto sem Filial distinto de Produto com Filial, sem transformar ausencia de filial em todas as filiais;
- alinhar o destaque visual, o checkbox e o payload: selecionar uma filial nao pode pintar como selecionadas as irmas do mesmo Produto.

Nao resolver o problema apenas com `Set<number>` ou alterando a mensagem. A identidade da linha deve continuar centralizada em `GerarPedidoLinhaIdentity`/`gerarPedidoLinhaKey`.

## Ajuste 2 - teste real de cancelamento e matriz F10

As tarefas T026, T029 e outras da `tasks.md` aparecem marcadas como concluidas, mas o diff do ecc 34 nao adiciona teste de cancelamento do modal nem teste de contagem de queries do POST F10. O teste existente de batch cobre diretamente o repositorio, nao o endpoint completo.

Completar testes automatizados sem depender de Excel ou banco artificial desnecessario:

- cancelamento do modal: zero chamada axios, zero alteracao de sessao e zero navegacao;
- fornecedor F informado, ausente, invalido e tipo diferente de F;
- filial unica, multipla e nenhuma;
- tres campos de quantidade, fracoes e sugestao base zero com minimo/maximo positivo;
- Produto/Filial duplicado na fonte Total e na requisicao;
- mesma ordem e identidade no payload, contrato, sessao e rascunho consumido pelo Cadastro;
- similares/grades presentes no resultado sem contaminar o F10.

## Ajuste 3 - query budget do POST F10 e remocao de leitura inutil

Medir o POST `estoque.consulta-compras.gerar_pedido_contrato` com `DB::listen` ou o helper de contagem existente, separando queries de autorizacao/catalogo/fornecedor das queries de detalhe. Demonstrar que N itens nao produzem N consultas por Produto e que a quantidade de queries cresce por lote, nao por item.

Revalidar o caminho quando `valores` nao vier no request: ele chama `loadDetalhes`, que executa leituras batch de estoques, customedio e precos informativos. O builder F10 consome somente `precocomicms`, `valorultimacompra` e `customedio`; portanto, se a leitura de precos informativos nao for necessaria para este endpoint, criar uma projecao/repositorio batch especifico do F10 ou outra solucao equivalente, sem alterar o detalhamento completo usado por outras telas.

Definir um limite testavel para dezenas de itens e um limite por lote para cardinalidade acima de `BATCH_SIZE`. Nao aceitar um teste que apenas prove que o metodo chamado `loadDetalhes` e batch. Registrar no teste quais SQLs foram eliminados ou mantidos e por que.

## Ajuste 4 - uma normalizacao canonica

Eliminar a duplicacao da conversao de Produto/Filial entre `GerarPedidoLinhaIdentity`, o service, o guard e o builder. A mesma entrada deve resultar na mesma chave e na mesma filial emitida no contrato. Preferir um valor/DTO normalizado ou metodo compartilhado, sem criar validacoes divergentes nem aumentar a lista de parametros posicionais dos metodos publicos.

## Observabilidade e qualidade

- rejeicoes por conflito devem carregar codigo estavel, Produto/Filial e `correlation_id` quando o fluxo ja tiver correlacao;
- rejeicao deve ocorrer antes de gravar o handoff;
- preservar ausencia explicita de fornecedor e nao criar vendedor de vendas;
- executar `git diff --check` no conjunto alterado e remover trailing whitespace introduzido nos documentos do ecc 34;
- atualizar a matriz de testes e a documentacao da decisao, sem marcar tarefas como concluidas sem evidencia.

## Fora de escopo

Nao alterar Delphi, schema, migrations, seeds, motores de sugestao/custo/impostos, Cadastro de Pedidos completo, Requisicao entre Filiais ou regras de vendedor de vendas. Nao trocar a precedencia `precocomicms -> valorultimacompra -> customedio`, nao truncar decimais e nao corrigir conflito com first wins silencioso.
~~~

