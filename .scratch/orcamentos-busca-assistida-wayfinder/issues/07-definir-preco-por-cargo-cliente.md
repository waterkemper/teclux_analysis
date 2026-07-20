# Definir preço por Cargo do Cliente na Busca Assistida de Orçamentos

Type: grilling
Status: resolved
Blocked by: 01

## Question

Como a Busca Assistida em Orçamentos deve calcular e exibir o preço quando o Cliente do Orçamento já está identificado (e tem Cargo associado) versus quando ainda não está identificado: reaproveitar o mecanismo existente de Desconto por Cargo (`CargoVenda`, `ProdutoPrecosCargosTabReadService`, `VendasCargoAuthorizationService`) sem duplicar regras, e como isso se relaciona com a Filial Base já decidida para o cálculo de preço em Consulta de Estoques?

## Answer

**A busca e o detalhe precisam ser Cargo-aware quando o Cliente já está identificado — não é aceitável mostrar um preço genérico e só ajustar por Cargo na inclusão.** Achado que motivou a correção: no fluxo tradicional, `produto_lookup` (`OrcamentoProdutoInclusaoService`) já resolve o Cargo assim que o código é digitado/bipado — o preço já sai ajustado por Cargo desde a prévia, não existe um estágio "genérico antes". A Busca Assistida precisa replicar esse mesmo comportamento para não divergir do que o vendedor já vê hoje.

Mecanismo a reaproveitar, hoje privado dentro de `OrcamentoProdutoInclusaoService`:

- `resolveEmpcargo(clienteCodigo, empcargoOverride, filialCodigo)` — Cliente → Cargo (`clientes.empcargo`, se o parâmetro `PRECOS_POR_CARGO` estiver ligado); sem Cliente, cai no Cargo Tabela Preço Padrão por parâmetro (paridade com Delphi `qryProcuraClienteAfterOpen`) — sempre resolve *algum* Cargo, com ou sem Cliente.
- `resolveMarkupPercent(produtoCodigo, clienteCodigo, empcargo, filialCodigo)` — precedência markup do Cliente → markup do Cargo (`produtoscargos`) → zero.
- `resolvePrecoVenda` alimenta o markup resolvido em `priceEngineRepository->mapPrecoParaProdutosFilialMarkup(produto, Filial, markup)` — a mesma engine de preço usada em todo o Orçamento.

**Decisão**: extrair `resolveEmpcargo` + `resolveMarkupPercent` (Cliente → Cargo → markup) de `OrcamentoProdutoInclusaoService` para um serviço pequeno e compartilhado, chamado tanto pela inclusão quanto pela busca/detalhe da Busca Assistida quando hospedada em Orçamentos — sem duplicar a query/regra em dois lugares. A busca/detalhe passa a computar preço como: Filial Base (já decidido) + Cliente do Orçamento (se identificado, senão `null` — o serviço compartilhado já cai no Cargo Tabela Preço Padrão sozinho) → Cargo → markup → `priceEngineRepository`. O preço mostrado na busca fica idêntico ao que sairia na inclusão, sem lógica duplicada.

Isso não altera a decisão de Filial Base (ticket [Decidir escopo de Filial](03-filial-unica-vs-multipla.md)) — o Cliente/Cargo é uma dimensão adicional de preço, a Filial continua única e vinda da sessão.