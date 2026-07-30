# Cadastro de Pedidos de Compra — fechamento da tela (menu, autorização, abas informativas e paridade Delphi)

Label: wayfinder:map

## Destination

Fechar a lacuna entre a tela real do Cadastro de Pedidos de Compra (Delphi, evidenciada pelas imagens em `.scratch/cadastro-pedidos-wayfinder/imagens/`) e a implementação Laravel já construída a partir dos 8 prompts SpecKit (`modules/estoque/cadastro-pedidos/01` a `08-speckit-prompt.md`, já commitada em `laravel/backend`) — cobrindo: o menu de acesso (inexistente hoje), a decisão de autorização (atualmente reaproveita o grant de Consulta de Compras, "G6"), as 4 abas informativas não capturadas na investigação original (Fornecedor, Notas Fiscais, Contatos, Notas Pendentes de Entrada — confirmadas presentes em `dmcadastropedidos.pas`/`fmcadastropedidos.pas`, arquivos-núcleo já em escopo do mapa anterior, mas ausentes do inventário do ticket 01 daquele mapa), o comportamento F9 "Procurar" (confirmado herdado de `TfrmCadastroPadrao`, não é o módulo `fmListadePedidos` já excluído), e a paridade campo-a-campo/grid-a-grid entre as imagens de referência e a UI Laravel já construída (grade de Produtos, aba Produtos Similares, modal "Cadastro de Itens do Pedido").

Termina quando: o menu existe e abre a tela; a autorização está decidida e implementada; as 4 abas informativas estão especificadas (SQL, campos, read-only ou não) e implementadas quando a decisão for mecânica; a paridade visual/funcional dos grids e do modal de item foi auditada contra as imagens, com gaps registrados como specs adicionais ou corrigidos diretamente quando triviais.

## Notes

- Domínio: mesmo módulo do mapa anterior (`.scratch/cadastro-pedidos-wayfinder/map.md`, 22 tickets resolvidos — lógica de negócio/motor de custo-impostos já decidida, não redecidir aqui, só referenciar).
- Fonte Delphi real (caminho via symlink): `delphi/apps/estoque/dmcadastropedidos.pas`/`.dfm`, `fmcadastropedidos.pas`/`.dfm` (o mapa anterior referenciava esses mesmos arquivos como `apps/estoque/...`, caminho relativo ao mesmo alvo).
- Implementação Laravel já existe (caminho via symlink `laravel/backend`, repositório real `/c/teclux_cloud`): `app/Domain/Estoque/PedidoCompra/`, `app/Services/Estoque/PedidoCompra/`, `app/Http/Controllers/Estoque/PedidoCompraController.php`, `resources/js/Pages/Cadastros/Estoque/PedidosCompra/` (inclui `Cadastro.tsx` e componentes de cabeçalho/itens/grade/previsões/similares/formação de preço). Rotas já registradas em `routes/web.php` sob `estoque.pedidos-compra.*`, middleware `estoque.consulta_compras.module` (reaproveita o grant de Consulta de Compras — comentário no código: "G6: reusa grant Consulta Compras").
- Imagens de referência (fonte visual autoritativa): `.scratch/cadastro-pedidos-wayfinder/imagens/*.png` — `tela_principal`, `previsoes_de_pagamento`, `dados_fornecedor`, `notas_fiscais`, `contatos`, `notas_pendentes_entrada`, `produtos_similares`, `tela_inclusao_produtos`, `tela_f9_pesquisa_pedidos`.
- **Achado ao abrir este mapa**: o botão "Procurar F9" da tela principal é comportamento genérico herdado de `TfrmCadastroPadrao` (classe-base de `TfrmCadastroPedidos`) — mesmo padrão usado por outras telas de Cadastro já migradas, **não** é o módulo `fmListadePedidos`/Consulta de Pedidos já excluído do mapa anterior.
- **Achado ao abrir este mapa**: as abas "3-Fornecedor" (dados cadastrais), "4-Notas Fiscais" (notas vinculadas), "5-Contatos" (contatos do fornecedor) e "6-Notas Pendentes de Entrada" (NFe pendentes) existem em `dmcadastropedidos.pas`/`fmcadastropedidos.pas` mas não apareceram no inventário de subsistemas do ticket 01 do mapa anterior (que foi levantado por assinatura de procedure/function, não por aba de UI) — gap confirmado da investigação original, agora em escopo.
- **Correção do usuário (2026-07-24)**: nenhum código é escrito diretamente neste workspace — mesmo tickets "mecânicos" (ex.: migration de menu) resolvem em um prompt `/speckit.specify`, publicado em `modules/estoque/cadastro-pedidos/`, no mesmo padrão do mapa anterior. Este workspace nunca edita `laravel/` diretamente.
- Menu: confirmado pelo usuário — estrutura `Estoques → Compras → Pedidos`, replicando o grupo "Compras" já usado por Consulta de Compras (folha "Consultas"), com nova folha "Pedidos".
- Consultar `grilling`/`domain-modeling` para decisões de negócio/escopo; usar leitura direta das imagens (`Read`) para veredito de paridade visual; classificar achados com a mesma convenção do mapa anterior (CONFIRMADO/INFERIDO/DÚVIDA/NÃO LOCALIZADO/DIVERGENTE/POSSÍVEL BUG LEGADO/DECISÃO NOVA).

## Decisions so far

- [Decidir a autorização do Cadastro de Pedidos](issues/02-decidir-autorizacao.md) — Confirmado que o middleware atual (`estoque.consulta_compras.module`, reaproveitando o grant de Consulta de Compras) era um stub explicitamente marcado como provisório ("G6") na implementação anterior. Decisão: criar módulo de autorização próprio (`EstoquePedidoCompraModuleAccessService`, novo middleware, migration de `acessosmodulos` própria), seguindo o padrão já usado por Consulta de Compras — desbloqueia o ticket 01 (menu).
- [Especificar o menu de acesso e o módulo de autorização do Cadastro de Pedidos](issues/01-criar-menu-acesso.md) — Publicado o prompt `09-speckit-prompt.md`: menu `Estoques → Compras → Pedidos` (grupo "Compras" reaproveitado, folha nova "Pedidos") + módulo de autorização próprio, fechando o gate "G6" provisório.
- [Conectar o F9 "Procurar Pedidos" ao padrão genérico já existente](issues/03-conectar-f9-procurar.md) — Confirmado: infraestrutura genérica (`ErpCadastroCommandBar`, `useRegistryCadastroShortcuts`, `ErpTwoColumnCatalogLookupModal`) já existe e é usada por 59 telas; o botão F9 já está na tela de Pedidos mas desabilitado (`searchDisabled`). Publicado o prompt `10-speckit-prompt.md`: endpoint de lookup + modal de 5 colunas (Nome/Emissão/Situação/Valor/Número), reaproveitando a infraestrutura compartilhada.
- [Especificar a aba "Fornecedor"](issues/04-especificar-aba-fornecedor.md) — Confirmado: mesma datasource já usada pelo lookup de fornecedor no cabeçalho (`dsrProcuraFornecedores`), sem query nova. Publicado junto no prompt `11-speckit-prompt.md`.
- [Especificar a aba "Notas Fiscais"](issues/05-especificar-aba-notas-fiscais.md) — SQL completa confirmada (join `notaspag`+`produtosnotaspag`, distinto de Documentos a Pagar). Publicado junto no prompt `11-speckit-prompt.md`.
- [Especificar a aba "Contatos"](issues/06-especificar-aba-contatos.md) — Confirmado: mesmos contatos do cadastro de fornecedores (`contatosvfornecedores`), mesma fonte já usada pelo Envio de Pedido. Publicado junto no prompt `11-speckit-prompt.md`.
- [Especificar a aba "Notas Pendentes de Entrada"](issues/07-especificar-aba-notas-pendentes.md) — Achado maior: reaproveita a integração `nsus`/`nsus_prod` (Manifestação do Destinatário/SEFAZ) **já implementada** em `LegacyConsultaEstoquesDetalheRepository::listNfeEntradaPendentes`, que já cruza com Pedidos em aberto. Publicado como prompt `12-speckit-prompt.md`, separado por depender dessa infraestrutura maior.
- [Paridade da grade "Produtos"](issues/08-paridade-grade-produtos.md) — Mapeados os ícones (maioria já implementada); confirmados 3 gaps reais: colorização de linha por situação (5 estados + variante "Concluído Excedido" com texto vermelho), reordenação cima/baixo, checkbox "Marcar/Desmarcar Todos". Publicado prompt `13-speckit-prompt.md`.
- [Paridade da aba "Produtos Similares"](issues/09-paridade-produtos-similares.md) — Confirmado gap real: implementação atual tem 3 campos, Delphi expõe ~10 (Linha/Coluna = rótulos de grade, não lógica nova). Publicado prompt `14-speckit-prompt.md`.
- [Paridade do modal "Cadastro de Itens do Pedido"](issues/10-paridade-modal-item.md) — Maior gap do mapa: formulário atual tem 4 campos, Delphi tem ~40 em 2 abas + painel de totais; backend ainda retorna `ncm`/`cfop`/`cst` como `null` (placeholders). "CFOP em dois níveis" resolvido: é um único lookup Natureza→CFOP. Publicado prompt `15-speckit-prompt.md`.

## Not yet specified

Nenhuma névoa restante — mapa completo. Todos os 10 tickets (menu/autorização, F9, 4 abas informativas, 3 fatias de paridade visual) foram resolvidos e traduzidos em 7 prompts `/speckit.specify` (09-15), publicados em `modules/estoque/cadastro-pedidos/`.

## Out of scope

- Toda a lógica de negócio/motor de custo-impostos já decidida no mapa anterior (`.scratch/cadastro-pedidos-wayfinder/map.md`) — não redecidir.
- `fmListadePedidos`/Consulta e Listagem de Pedidos — já excluído no mapa anterior; confirmado novamente que o F9 desta tela não é esse módulo.
- Botão "Atendimento F10" (abre Cadastro de Atendimentos/CRM) — módulo autônomo fora deste domínio.
- Botão "Imprimir F7" / relatório detalhado e "Enviar F12" — já especificados em `08-speckit-prompt.md` do mapa anterior (Relatório/Excel, Envio de Pedido); só reaproveitar.
