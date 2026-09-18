# Prompt para /speckit.specify - Ajuste pos-36 do F10: isolamento e consultas desnecessarias

~~~text
/speckit.specify

Crie uma especificacao corretiva, incremental e verificavel para os dois residuos encontrados na revisao da implementacao do prompt 36 / feature `449-fix-cc-f10-closeout` no F10 da Consulta de Compras. Gere a especificacao; nao implemente nesta etapa.

## Contexto e fronteira da revisao

Revisao realizada no repositorio `laravel`, comparando o fechamento do prompt 36 no commit `2c958952` com o prompt 35 no commit `6ab87cd8`. A feature 449 ja comprovou a precedencia de valores no POST, o batch via endpoint, a projecao F10 estreita, o handoff Caminho B e a higiene documental.

Foram encontrados dois pontos residuais:

1. `resolverValoresDoDetalhe` monta pares para todos os selecionados, inclusive linhas que o builder depois descarta por sugestao base zero ou por quantidade escolhida nao positiva. Isso pode consultar estoques e customedio para linhas que nunca entrarao no contrato.
2. `loadValoresUnitariosF10` executa `computeCustomedioBatch` para todo produto de todo lote, mesmo quando `precocomicms` ou `valorultimacompra` ja estao disponiveis e vencem a precedencia. Alem disso, o fallback `custosPorProduto` do builder pode usar silenciosamente o ultimo valor de um produto quando `valores` parcial traz apenas outra filial, cruzando o valor entre filiais.

Classifique cada descoberta como CONFIRMADO, INFERIDO, DUVIDA, POSSIVEL BUG ou OPORTUNIDADE, citando arquivo e linha. Nao reabra decisoes ja fechadas na 449 sem evidencia.

## Leituras obrigatorias

- `/mnt/c/teclux_analysis/modules/estoque/consulta-compras/36-speckit-prompt-ajuste-pos-35-f10-evidencias-query-handoff.md`;
- `specs/449-fix-cc-f10-closeout/spec.md`, `tasks.md`, `research.md` e `contracts/`;
- `backend/app/Services/Estoque/ConsultaComprasGerarPedidoContratoService.php`;
- `backend/app/Domain/Estoque/ConsultaCompras/GerarPedidoCompraContractBuilder.php`;
- `backend/app/Domain/Estoque/ConsultaCompras/DefinirValorProdutoPrecedence.php`;
- `backend/app/Infrastructure/Persistence/Legacy/Estoque/LegacyConsultaComprasDetalheCompraRepository.php`;
- `backend/tests/Feature/Estoque/ConsultaCompras/ConsultaComprasGerarPedidoContratoTest.php`;
- `backend/tests/Feature/Estoque/ConsultaCompras/ConsultaComprasDetalheCompraBatchTest.php`;
- testes de `GerarPedidoCompraContractBuilder` e do handoff.

## Ajuste 1 - nao consultar linhas inelegiveis

Garantir que a resolucao de custos considere somente linhas que poderiam ser emitidas pelo builder:

- aplicar a mesma regra canonica de elegibilidade da sugestao base antes de montar os pares Produto/Filial;
- considerar o campo de quantidade escolhido (`sugestao`, `sugestaominimo` ou `sugestaomaximo`) quando isso permitir eliminar consultas de linhas com quantidade nao positiva, sem duplicar ou divergir da regra do builder;
- se todas as linhas forem inelegiveis, preservar a rejeicao 422 existente e nao executar consultas de detalhe nem gravar handoff;
- manter a ordem das linhas elegiveis, a identidade Produto/Filial e a precedencia de valor;
- nao filtrar uma linha valida apenas porque os valores ainda serao resolvidos pelo repositorio.

Adicionar testes de query budget para:

- selecao com mistura de linhas elegiveis e sugestao base zero;
- selecao com quantidade escolhida zero e sugestao base positiva;
- selecao inteiramente inelegivel, comprovando zero consulta de detalhe e ausencia de handoff;
- regressao com linhas elegiveis mantendo valores e ordem.

## Ajuste 2 - evitar customedio quando a precedencia ja esta resolvida

Reduzir consultas de custo medio sem alterar o resultado:

- manter a leitura de estoques F10 em lote;
- identificar, por Produto/Filial, quais linhas ainda precisam de `customedio` porque `precocomicms` e `valorultimacompra` sao nulos, vazios ou zero segundo `DefinirValorProdutoPrecedence`;
- executar `computeCustomedioBatch` somente para os produtos necessarios, preferencialmente em lote e sem consulta por item;
- preservar o comportamento quando o mesmo produto aparece em varias filiais e quando uma filial precisa de customedio mas outra ja tem preco;
- documentar o novo teto de consultas: lote sem necessidade de customedio deve ter somente a consulta estreita de estoques; lote com necessidade deve manter a consulta adicional em batch;
- manter o ranking de estoques, o isolamento por filial e o arredondamento atuais.

Testar pelo menos:

- lote em que todos os itens possuem `precocomicms` ou `valorultimacompra`: nenhuma consulta de customedio;
- lote misto: customedio somente para os produtos necessarios, com valores corretos;
- mesmo produto em duas filiais, com necessidade de customedio em apenas uma filial;
- cardinalidade multi-lote sem regressao do teto proporcional a `ceil(N / batch_size)`.

## Ajuste 3 - impedir fallback de valor entre filiais

Revisar o fallback em `GerarPedidoCompraContractBuilder`:

- quando a selecao possui filial positiva e `valores` possui filial positiva, somente a chave Produto/Filial correspondente pode fornecer o valor;
- nao usar `custosPorProduto[$produto]` para preencher uma filial diferente da origem do valor;
- preservar o fallback por Produto apenas para o contrato legado em que a selecao e os valores nao carregam filial;
- decidir comportamento explicito para valor parcial: rejeicao controlada, ausencia/zero conforme regra autoritativa, ou fallback somente quando comprovadamente seguro;
- adicionar teste com Produto/Filial A presente em `valores` e Produto/Filial B selecionado sem valor correspondente; o teste deve impedir que A seja usado em B;
- manter o caso valido com o mesmo produto em duas filiais e os dois valores correspondentes.

Nao alterar a precedencia `precocomicms -> valorultimacompra -> customedio`, nao reintroduzir precos informativos e nao transformar deduplicacao em first-wins silencioso.

## Higiene e criterios de aceite

- atualizar contrato/research/tasks da feature seguinte somente se a decisao de valor parcial alterar uma regra observavel;
- medir consultas com `DB::listen` separando estoques, customedio e demais consultas de infraestrutura;
- garantir que nenhum loop execute uma consulta por Produto/Filial;
- executar os testes Feature/Unit relevantes e registrar bloqueios reais de infraestrutura, sem marcar tarefas como concluídas apenas por inspecao do diff;
- executar `git diff --check` no conjunto alterado.

## Fora de escopo

Nao alterar Delphi, schema, migrations, seeds, motores de sugestao, regras de vendedor, F11, Requisicao entre Filiais, Cadastro completo ou o handoff Caminho B da 449. Nao alterar o batch de `loadDetalhes`, a identidade canonica, o contrato HTTP, as quantidades decimais ou a precedencia de valor.
~~~
