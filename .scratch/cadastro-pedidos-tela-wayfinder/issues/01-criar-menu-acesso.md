# Especificar o menu de acesso e o módulo de autorização do Cadastro de Pedidos

Type: task
Status: resolved
Blocked by: 02

## Question

Produzir o prompt `/speckit.specify` que cobre: a migration de menu (`acessosmodulos`) para o Cadastro de Pedidos de Compra, replicando o padrão já usado em `database/migrations/2026_07_21_000001_acessosmodulos_consulta_compras.php` — estrutura confirmada pelo usuário: `Estoques → Compras → Pedidos` (mesmo grupo "Compras" já usado por Consulta de Compras — folha "Consultas" — com nova folha "Pedidos"); e o módulo de autorização próprio decidido no ticket 02 (`EstoquePedidoCompraModuleAccessService`, novo middleware, atualização de `routes/web.php` para parar de reaproveitar `estoque.consulta_compras.module`). Nenhum código é escrito neste workspace — o ticket resolve produzindo o prompt, não implementando.

## Answer

Publicado [`modules/estoque/cadastro-pedidos/09-speckit-prompt.md`](../../../modules/estoque/cadastro-pedidos/09-speckit-prompt.md). Cobre a migration de menu (`Estoques → Compras → Pedidos`, reaproveitando o grupo "Compras" já criado por Consulta de Compras, folha nova "Pedidos") e o módulo de autorização próprio decidido no ticket 02 (`EstoquePedidoCompraModuleAccessService`, `EnsureEstoquePedidoCompraModuleAccess`, alias em `bootstrap/app.php`, atualização de `routes/web.php` para parar de reaproveitar `estoque.consulta_compras.module`). Segue o padrão de referência já existente para Consulta de Compras, e fecha explicitamente o gate "G6" documentado como provisório na implementação anterior.

### Decisão

Resolvido via prompt, sem edição de código neste workspace.
