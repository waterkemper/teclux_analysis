# Prompt para /speckit.specify - Correção pos-37 do F10 sem filial e higiene da 451

~~~text
/speckit.specify

Crie uma especificacao corretiva, incremental e verificavel para fechar uma regressao introduzida na implementacao do prompt 37 / feature `451-fix-cc-f10-query-budget` no F10 da Consulta de Compras. Gere a especificacao; nao implemente nesta etapa.

## Contexto e fronteira da revisao

Revisao realizada no repositorio `laravel`, comparando a implementacao do prompt 37 no commit `08fc9a20` com o prompt 36 no commit `2c958952`.

O prompt 37 corrigiu as consultas para linhas inelegiveis, tornou o customedio condicional e eliminou o fallback de valores entre filiais. Entretanto, a alteracao do builder criou uma regressao no caso legitimo de selecao sem filial:

1. `ConsultaComprasGerarPedidoContratoService::resolverValoresDoDetalhe` usa `filial_fatura` como filial efetiva quando a selecao nao possui filial e o repositorio retorna valores com `filial` positiva.
2. `GerarPedidoCompraContractBuilder` agora só procura `custosPorLinha` para selecao com filial, e só procura `custosPorProduto` quando o valor recebido tambem nao possui filial.
3. Portanto, selecao sem filial + POST sem `valores` recebe uma linha de custo `produto|filial_fatura`, mas nao a encontra no builder e pode emitir `valor_unitario` zero indevidamente. O comportamento anterior por Produto funcionava nesse fluxo.

Ha tambem uma falha de higiene: `git show --check 08fc9a20` acusa trailing whitespace em documentos novos de `specs/451-fix-cc-f10-query-budget/`, embora as tarefas T027/T029 estejam marcadas como concluidas.

Classifique cada descoberta como CONFIRMADO, POSSIVEL REGRESSAO, DUVIDA ou OPORTUNIDADE, citando arquivo e linha. Nao reabra o isolamento de filiais nem o contrato do handoff sem evidencia.

## Leituras obrigatorias

- `modules/estoque/consulta-compras/37-speckit-prompt-ajuste-pos-36-f10-isolamento-e-consultas-desnecessarias.md`;
- `specs/451-fix-cc-f10-query-budget/spec.md`, `tasks.md`, `research.md`, `quickstart.md` e `contracts/`;
- `backend/app/Services/Estoque/ConsultaComprasGerarPedidoContratoService.php`;
- `backend/app/Domain/Estoque/ConsultaCompras/GerarPedidoCompraContractBuilder.php`;
- `backend/app/Domain/Estoque/ConsultaCompras/GerarPedidoLinhaIdentity.php`;
- `backend/app/Infrastructure/Persistence/Legacy/Estoque/LegacyConsultaComprasDetalheCompraRepository.php`;
- `backend/tests/Feature/Estoque/ConsultaCompras/ConsultaComprasGerarPedidoContratoTest.php`;
- `backend/tests/Unit/Estoque/ConsultaCompras/GerarPedidoCompraContractBuilderTest.php`.

## Ajuste 1 - preservar valor quando a selecao nao traz filial

Corrigir a resolucao de custos sem reintroduzir cruzamento entre filiais:

- quando a selecao nao possui filial e o service resolveu o par usando `filial_fatura`, permitir lookup pela chave `produto|filial_fatura` retornada pelo repositorio;
- manter o item do contrato sem `filial` quando a selecao original nao tinha filial, salvo se o contrato autoritativo definir explicitamente outra forma;
- se houver valores positivos para outras filiais, nao usar uma filial diferente da `filial_fatura` como fallback silencioso;
- manter o fallback por Produto somente no contrato legado em que selecao e valores nao carregam filial;
- quando a chave efetiva `produto|filial_fatura` estiver ausente em um conjunto de valores parcial, preservar a regra definida na 451 (valor zero pela precedencia, sem herdar custo de outra filial);
- manter a precedencia `precocomicms -> valorultimacompra -> customedio`, quantidades decimais, ordem e handoff da 449/451.

## Ajuste 2 - testes de regressao e matriz de identidade

Adicionar testes que distingam claramente os contratos:

- POST sem `valores`, selecao sem filial e preco existente na `filial_fatura` → `valor_unitario` correto, sem emitir filial inesperada;
- POST sem `valores`, selecao sem filial e custo medio necessário → custo medio da filial efetiva correto;
- selecao sem filial com valores parciais de outra filial apenas → nao usar valor cruzado;
- selecao com filial positiva e valores da mesma filial → comportamento atual permanece;
- selecao e valores sem filial → fallback legado por Produto permanece;
- mesmo Produto em duas filiais → cada linha continua isolada;
- testar pelo menos uma vez cada fonte da precedencia no caso sem filial e no caso com filial quando aplicável.

Os testes devem observar o contrato emitido, nao somente o mapa interno de custos. O caso de regressao deve falhar no estado do commit 08fc9a20.

## Ajuste 3 - higiene e evidência honesta

- remover trailing whitespace de todos os documentos novos/tocados em `specs/451-fix-cc-f10-query-budget/`;
- executar `git diff --check` no conjunto real alterado, incluindo os documentos da 451;
- atualizar `tasks.md` e `quickstart.md` somente com testes realmente executados;
- executar via runtime Docker os testes Feature/Unit relevantes e registrar bloqueio real se o servico PHP nao estiver disponivel;
- nao declarar “executado” apenas porque a tarefa ou matriz foi escrita.

## Fora de escopo

Nao alterar Delphi, schema, migrations, seeds, motores de sugestao/custo/impostos, F11, Requisicao entre Filiais, regras de vendedor, Cadastro completo ou o handoff Caminho B. Nao remover o filtro de inelegibilidade, nao reintroduzir customedio indiscriminado, nao usar first-wins e nao permitir fallback de custo de uma filial diferente da filial efetiva.
~~~
