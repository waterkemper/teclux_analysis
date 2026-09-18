# Auditoria Laravel - demais entradas de codigo de Produto

Escopo: somente `laravel/backend`. O ticket auditado pede as superficies fora de Ficha de Produtos e inclusao de item em Orcamento. Nenhum fonte Delphi foi consultado.

## Contrato operacional usado para classificar

A superficie e abrangida quando o operador digita um texto de identificacao de Produto e o backend resolve para a PK do Produto. A regra-alvo e: codigo visual exato OU codigo de barras exato em `produtoscodigobarras`; codigo interno numerico pode permanecer como fallback explicito. Busca parcial/modal e exibicao de codigo visual nao sao, por si, resolucao exata.

## Abrangido

| Area | Evidencia Laravel | Estado observado | Classificacao |
|---|---|---|---|
| Compras - item de Pedido de Compra | `resources/js/Pages/Cadastros/Estoque/PedidosCompra/components/PedidoCompraItemForm.tsx:1041-1076`; rota `routes/web.php:2412-2427`; `app/Http/Controllers/Estoque/PedidoCompraController.php:568-574,833-840`; `app/Infrastructure/Persistence/Legacy/Estoque/LegacyPedidoCompraProdutoLookupRepository.php:100-112` | Campo aceita leitor EAN/GTIN (comentario linha 1074), mas o lookup exato usa codigo/codigo visual; a busca nao consulta `produtoscodigobarras`. O endpoint de resolver recebe `produto` inteiro, portanto a conversao do texto ocorre no frontend/lookup. | ABRANGIDO; precisa adotar resolver compartilhado antes de gravar/resolver item. |
| Listas padrao - linhas de produtos | `resources/js/Pages/Cadastros/ListasPadrao/Cadastro.tsx:737-796`; `:177-188`; controller `app/Http/Controllers/Cadastros/ListasPadraoController.php:30-35`; service `app/Services/Cadastros/ListasPadraoCadastroService.php:239-243` | Usa `CatalogCodeLookup`, envia somente `produto_codigos` (PKs) e possui mensagem de codigo nao encontrado. O lookup delegado ao repositorio comum nao prova barcode exato. | ABRANGIDO; resolver o texto no endpoint de lookup/exact antes de enviar a PK. |
| Lancamentos avulsos | `resources/js/Pages/Cadastros/Estoque/LancamentosAvulsos/Index.tsx:328-336,1003-1045`; controller `app/Http/Controllers/Estoque/LancamentosAvulsosController.php:125-143,362-364`; repositorio `app/Infrastructure/Persistence/Legacy/Estoque/LegacyLancamentosAvulsosProdutoLookupRepository.php:38-53` | Ja possui endpoint dedicado de resolucao. Resolve codigo visual, barcode via EXISTS e codigo numerico; o lookup de lista ainda e parcial em descricao/codigo visual (linhas 25-27). | ABRANGIDO e parcialmente atendido; preservar a resolucao exata e alinhar precedencia/comparacao ao contrato canonico. |
| Transferencia para exposicao (Interlojas) | `resources/js/Pages/Interlojas/RequisicaoParaExposicao/components/RequisicaoExposicaoProdutoLookup.tsx:102-154`; controller `app/Http/Controllers/Interlojas/RequisicaoExposicaoController.php:226-240`; repositorio `app/Infrastructure/Persistence/Legacy/Interlojas/LegacyRequisicaoExposicaoProdutoLookupRepository.php:74-98` | Usa `catalogExactResolveUrl`; resolver consulta codigo visual, barcode e codigo numerico, com contexto de filiais/estoque. | ABRANGIDO e parcialmente atendido; validar contrato comum, ambiguidade e comparacao normalizada sem remover escopo de filial. |
| Venda perdida | `resources/js/Components/erp/venda-perdida/VendaPerdidaCaptureModal.tsx:181-228`; service `app/Services/Vendas/VendaPerdida/VendaPerdidaCatalogLookupService.php:28-67`; controller/rota `app/Http/Controllers/Vendas/VendaPerdidaCaptureController.php:30-52`, `routes/web.php:2967-2968` | Usa lookup paginado da pesquisa de venda/orcamento, sem `catalogExactResolveUrl`. A service delega a `VendaProdutoPesquisaService::pesquisar` com `search_field=nome`; nao ha prova de resolucao barcode para o texto digitado. | ABRANGIDO; adicionar resolucao exata contextualizada por filial/cliente antes de selecionar Produto. |

## Explicitamente excluido

| Ocorrencia | Evidencia | Motivo |
|---|---|---|
| Contratos - tabela de produtos ja persistidos | `resources/js/Pages/Vendas/Contratos/Cadastro/tabs/ProdutosTab.tsx:242-260` | Somente renderiza `produto`/codigo visual e abre fotos; nao existe input de codigo. |
| Contratos - Entrega/Cliente/Financiamento | `resources/js/Pages/Vendas/Contratos/Cadastro/tabs/EntregaTab.tsx:296-319`; `tabs/ClienteTab.tsx:74`; `components/ContratoFinanciamentoEmbutidoPanel.tsx:255` | Os lookups sao de filial, cliente, endereco, plano ou parametro; nao aceitam codigo de Produto. |
| Listas - codigo da propria lista e filtros de relatorio | `resources/js/Pages/Cadastros/ListasPadrao/Cadastro.tsx:349-380` | Identificam a lista, nao um Produto digitado. |
| CatalogCodeLookup em geral | `resources/js/Components/lookup/CatalogCodeLookup.tsx:68-80,187-199` | Componente generico para qualquer catalogo; nao se deve alterar globalmente sem verificar cada uso. A propriedade de resolver exato e opcional. |
| Equipamentos, cashback, manutencao de precos, parametros e financeiro | Exemplos: `resources/js/Pages/Cadastros/Equipamentos/Cadastro.tsx:630-645`; `resources/js/Pages/SystemParameters/components/ParameterValueFields.tsx:145` | Lookups de Produto podem existir, mas pertencem a cadastros/filtros fora da lista deste ticket ou sao catalogos de outra entidade. Nao alterar sem decisao de escopo. |

## Decisoes pendentes

1. Compras: o contrato deve aceitar barcode tambem no modal de pesquisa parcial, ou somente no Enter/blur exato?
2. Venda perdida: confirmar se barcode deve obedecer as mesmas regras comerciais de `VendaProdutoPesquisaService` (filial, cliente, cargo, estoque) e qual resposta para Produto inativo/inelegivel.
3. Transferencia: definir tratamento de duas linhas com o mesmo codigo visual/barcode antes de selecionar a primeira; o repositorio atual usa `first()`.
4. Comparacao: o contrato canonico do ticket 01 deve decidir `to_ascii`/case folding e trim para codigo visual/barcode; os resolvers atuais divergem.
5. Componentes genericos: decidir se `CatalogCodeLookup` recebera um modo de Produto com endpoint exato ou se cada fluxo fornecera `catalogExactResolveUrl`.

## Recomendacao para os prompts

Implementar em unidades independentes: (a) contrato/adaptador de resolver para Compras e Listas; (b) alinhamento/verificacao de Lancamentos e Interlojas; (c) Venda perdida; (d) decisao e testes do componente generico. Cada especificacao deve inspecionar somente Laravel, nao implementar durante `/speckit.specify`, e registrar divergencias contra o contrato fechado pelo ticket 01.

