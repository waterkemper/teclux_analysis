# Conectar o F9 "Procurar Pedidos" ao padrão genérico já existente

Type: task
Status: resolved
Blocked by:

## Question

Confirmado que o botão "Procurar F9" da tela principal (`tela_f9_pesquisa_pedidos.png` — modal "Procura por Nome" com grid Nome/Emissão/Situação/Valor pedido/Número, ordenação F11/Shift-F11) é comportamento genérico herdado de `TfrmCadastroPadrao`, não o módulo `fmListadePedidos` (já fora de escopo). Investigar se outras telas de Cadastro já migradas para Laravel (ex.: Consulta de Compras, Manutenção de Preços, ou qualquer outro `Cadastros/*` já pronto) implementam um padrão equivalente de busca F9/modal de localização — se sim, reaproveitar o mesmo componente/endpoint para Pedidos (buscar por nome do fornecedor, listando emissão/situação/valor/número, navegável por F11); se não existir ainda em nenhuma tela, este é o primeiro caso e a investigação deve propor o padrão a ser reaproveitado pelas telas seguintes. Resolve produzindo um prompt `/speckit.specify` — nenhum código é escrito neste workspace.

## Answer

### Confirmado: padrão genérico já existe e está parcialmente wireado (CONFIRMADO, checkout Laravel)

- `useRegistryCadastroShortcuts` (`resources/js/Components/erp/cadastro/useRegistryCadastroShortcuts.ts`) já escuta F3/F8/F6/F9 globalmente (F8 no lugar de F5 — F5 é reservado pelo navegador para refresh, divergência deliberada já assumida pelo sistema).
- `ErpCadastroCommandBar` (`.../ErpCadastroCommandBar.tsx`) já tem um botão "Localizar (F9)" genérico (`onSearch`/`searchDisabled`), usado por **59 telas de Cadastro** já migradas, incluindo `Estoque/Fornecedores/Cadastro.tsx`.
- **`PedidosCompra/Cadastro.tsx` já usa `ErpCadastroCommandBar`, mas com `onSearch={() => undefined}` e `searchDisabled` fixo** (linhas 308-318) — o botão existe na tela, mas está desabilitado/sem ação. Esta é exatamente a lacuna apontada pelo usuário.
- Duas variações de modal de busca já existem como referência: `ErpCadastroLookupModal` (específico de Users, colunas código/nome/login) e `ErpTwoColumnCatalogLookupModal` (mais genérico — usado por `Estoque/Fornecedores/Cadastro.tsx`, colunas código/nome/classificação fiscal, paginado, ordenável, com sessão persistida para reabrir sem perder a última busca). **Nenhum dos dois cobre as 5 colunas do F9 de Pedidos** (Nome/Emissão/Situação/Valor pedido/Número, `tela_f9_pesquisa_pedidos.png`) — precisa de um modal novo, mas reaproveitando a mesma infraestrutura (tabela/paginação/scroll compartilhados: `CadastrosTable`, `TablePagination`, `ERP_LOOKUP_TABLE_*_CLASS`, `isUnauthenticatedOrSessionError`, `LookupSessionExpiredMessage`) e o mesmo padrão estrutural (sessão persistida, ordenação por coluna clicável — equivalente ao F11/Shift-F11 do Delphi).

### Decisão

Não é preciso investigar mais nenhum padrão novo — a infraestrutura já existe e é usada por dezenas de telas. O trabalho é: (1) endpoint de lookup no backend (buscar pedidos por nome do fornecedor, retornando nome/emissão/situação/valor/número, paginado/ordenável); (2) um modal `PedidoCompraLookupModal` seguindo a mesma estrutura de `ErpTwoColumnCatalogLookupModal` mas com as 5 colunas corretas; (3) trocar `onSearch={() => undefined}`/`searchDisabled` em `Cadastro.tsx` para abrir esse modal e, ao selecionar, carregar o pedido escolhido (mesmo padrão de `onSelect(codigo)` já usado pelos outros lookups). Publicado como prompt `10-speckit-prompt.md`.
