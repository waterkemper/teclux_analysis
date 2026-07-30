# Decidir a autorização do Cadastro de Pedidos

Type: grilling
Status: resolved
Blocked by:

## Question

As rotas `estoque.pedidos-compra.*` hoje reaproveitam o middleware `estoque.consulta_compras.module` (mesmo grant de Consulta de Compras, comentário no código: "G6: reusa grant Consulta Compras"). No Delphi, `TfrmCadastroPedidos` é uma tela própria — não foi confirmado neste mapa (nem no anterior) se ela tem um código de autorização (`acessosmodulos`) distinto de Consulta de Compras no legado. Decidir: manter o reaproveitamento do grant (usuário que acessa Consulta de Compras também acessa Cadastro de Pedidos, sem controle fino) ou criar um módulo de autorização próprio para Cadastro de Pedidos (como foi feito para Consulta de Compras em `EstoqueConsultaComprasModuleAccessService`), permitindo conceder um sem o outro. Verificar primeiro no Delphi (`acessosmodulos` do legado, se acessível) se as duas telas já compartilham código de autorização ou são independentes lá.

## Answer

### Achado — G6 já estava documentado como provisório (CONFIRMADO, `laravel/specs/285-pedido-compra-cabecalho/research.md:162,214`, `tasks.md:46`, `docs/architecture/pedido-compra-cabecalho.md:22`)

O prompt/implementação anterior (spec 06 do mapa de motores/cabeçalho, `285-pedido-compra-cabecalho`) já registrou explicitamente que o middleware `estoque.consulta_compras.module` era um **stub provisório**: `research.md` lista "Gate G6: código exato do módulo legado / leaf de permissão (workspace ou inventário menu)" como pendência, e `tasks.md` marca a rota como "G6: reutilizar grant Estoque/Compras existente **ou leaf provisório documentado**" — ou seja, a própria implementação sinalizou que isso precisava ser revisitado, não é uma decisão de arquitetura definitiva.

### Decisão (DECISÃO NOVA, levada ao usuário)

**Criar módulo de autorização próprio para Cadastro de Pedidos**, seguindo o mesmo padrão já usado para Consulta de Compras:

- Nova classe `EstoquePedidoCompraModuleAccessService` (mesmo formato de `EstoqueConsultaComprasModuleAccessService`), com `INDEX_ROUTE = 'estoque.pedidos-compra.cadastro'`.
- Novo middleware (ex.: `estoque.pedidos_compra.module`) substituindo o reaproveitamento de `estoque.consulta_compras.module` no grupo de rotas `estoque.pedidos-compra.*` em `routes/web.php`.
- Migration de `acessosmodulos` própria (ticket 01 deste mapa) — folha nova sob o grupo "Compras", **não** reaproveitando o código existente de "Consultas" (Consulta de Compras).

**Razão**: segue o padrão do legado (cada tela = seu próprio código em `acessosmodulos`, confirmado pela migration já existente de Consulta de Compras) e o padrão já estabelecido no Laravel (uma `ModuleAccessService` por tela). Permite conceder Cadastro de Pedidos sem conceder Consulta de Compras e vice-versa — controle fino real, em vez de perpetuar o acoplamento provisório do G6.

### Decisão

Módulo de autorização próprio confirmado. Ticket 01 (criar menu) está desbloqueado e deve criar tanto a migration de `acessosmodulos` quanto (fora do ticket 01, mas junto na mesma leva de implementação mecânica) o novo middleware/`ModuleAccessService` e a atualização de `routes/web.php`.
