# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para construir, no Laravel, o **menu de acesso** e o **módulo de autorização próprio** do Cadastro de Pedidos de Compra (Estoque → Compras → Pedidos), fechando o gate provisório ("G6") deixado pela implementação anterior (`specs/285-pedido-compra-cabecalho`), que hoje reaproveita o grant de Consulta de Compras. Esta é a nona fatia do Cadastro de Pedidos de Compra — as specs 01-08 já especificaram o motor de custo/impostos e as telas de cabeçalho/itens/grade/documentos a pagar; esta fatia fecha o acesso à tela já construída.

Não implemente nesta etapa. Você não possui acesso ao código Delphi. Considere as seções `Evidência Delphi confirmada` e `Evidência Laravel confirmada` deste prompt como o pacote de requisitos autoritativo. Inspecione o checkout Laravel para confirmar o estado atual antes de alterar qualquer coisa. Corrija hipóteses quando forem contrariadas pelo código acessível e cite evidência concreta do checkout. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações DECISÃO NOVA já fornecidas.

## Limite desta entrega

A entrega termina quando existir:

- uma migration de `acessosmodulos` que cria (ou reaproveita, se já existir com outro nome) o grupo **"Compras"** sob **"Estoques"** (já criado pela migration de Consulta de Compras) e uma **folha nova "Pedidos"** apontando para a rota `estoque.pedidos-compra.cadastro` — estrutura de menu confirmada pelo usuário: `Estoques → Compras → Pedidos`;
- um serviço de autorização próprio (`EstoquePedidoCompraModuleAccessService`, mesmo contrato de `canAccess(?Usuario $user): bool` já usado por `EstoqueConsultaComprasModuleAccessService`) e o middleware correspondente (`EnsureEstoquePedidoCompraModuleAccess`), registrados como novo alias em `bootstrap/app.php`;
- a atualização do grupo de rotas `estoque.pedidos-compra.*` em `routes/web.php` para usar o novo middleware, **parando** de reaproveitar `estoque.consulta_compras.module`.

Não inclua nesta entrega: qualquer alteração de lógica de negócio das rotas já existentes (cabeçalho, itens, grade, previsões, documentos a pagar — specs 01-08, já implementadas); a criação de novas telas ou campos.

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM, data modules, queries ou qualquer outra fonte Delphi.
- As evidências Delphi abaixo já foram extraídas no workspace de análise.
- Inspecione o checkout Laravel para confirmar o estado atual das rotas, migrations e middlewares — as evidências Laravel abaixo refletem o estado no momento desta análise e podem estar defasadas.
- Se uma decisão depender de informação Delphi ausente (ex.: se o legado realmente tinha códigos de `acessosmodulos` distintos para Consulta de Compras e Cadastro de Pedidos), registre a pergunta exata para o workspace de análise — não infira.

## Investigação Laravel obrigatória

- `database/migrations/2026_07_21_000001_acessosmodulos_consulta_compras.php` — migration de referência a replicar (idempotente: localiza o grupo "Compras" existente por `nomemenu`+`codigo_pai`+`teclux_cloud`, cria a folha só se não existir, replica acesso de usuários já concedidos ao grupo pai);
- `app/Services/Authorization/EstoqueConsultaComprasModuleAccessService.php` e `app/Http/Middleware/EnsureEstoqueConsultaComprasModuleAccess.php` — par de referência a replicar para Pedidos;
- `bootstrap/app.php` — bloco de registro de aliases de middleware (`estoque.consulta_compras.module` está registrado ali; adicionar o novo alias `estoque.pedidos_compra.module` no mesmo bloco);
- `routes/web.php` — grupo de rotas `estoque.pedidos-compra.*` (comentário atual: "G6: reusa grant Consulta Compras") — trocar o middleware do grupo;
- os artefatos da implementação anterior que deixaram o gate provisório: `specs/285-pedido-compra-cabecalho/research.md` (linha do "Gate G6"), `tasks.md` (linha "G6: reutilizar grant... ou leaf provisório documentado"), `docs/architecture/pedido-compra-cabecalho.md` (linha "Prefixo auth: middleware `estoque.consulta_compras.module` (provisório G6)") — confirmar que todos esses pontos são atualizados/desmarcados como resolvidos.

## Evidência Delphi confirmada

### Tela própria no legado (CONFIRMADO, `apps/estoque/fmcadastropedidos.pas`)

`TfrmCadastroPedidos` é uma tela própria e distinta de `TfrmConsultaCompras` (Consulta de Compras) — telas Delphi neste sistema, pelo padrão já confirmado em Consulta de Compras, têm cada uma seu próprio código em `acessosmodulos`. Não foi possível confirmar neste workspace de análise (sem acesso a um dump do `acessosmodulos` do legado) se as duas telas historicamente compartilhavam o mesmo código de autorização — a decisão de criar um módulo próprio para Pedidos segue o padrão estrutural do sistema (cada tela = seu código), não uma confirmação direta de dump de dados.

## Evidência Laravel confirmada

### Gate G6 documentado como provisório (CONFIRMADO, `specs/285-pedido-compra-cabecalho/research.md:162,214`, `tasks.md:46`, `docs/architecture/pedido-compra-cabecalho.md:22`)

A implementação anterior já sinalizou explicitamente que o middleware `estoque.consulta_compras.module` usado pelas rotas de Pedidos era um stub: `research.md` lista "Gate G6: código exato do módulo legado / leaf de permissão (workspace ou inventário menu)" como pendência; `tasks.md` marca a rota como "G6: reutilizar grant Estoque/Compras existente **ou leaf provisório documentado**". Esta entrega fecha esse gate.

### Padrão de referência — Consulta de Compras (CONFIRMADO)

Par `ModuleAccessService`/`Middleware` com contrato idêntico: `canAccess(?Usuario $user): bool` — `true` se `$user->administrador`; senão, resolve o `codigo` do módulo em `acessosmodulos` pela `rota` (com `teclux_cloud = true`), e verifica se existe uma linha em `usuariosacessosmodulos` ligando o usuário a esse código. O middleware retorna 403 se `canAccess` for falso, redireciona para login se não autenticado.

A migration de referência é **idempotente e defensiva**: verifica `Schema::hasTable`/`hasColumn` antes de agir; localiza o grupo "Compras" pai por `nomemenu`+`codigo_pai`(Estoques)+`teclux_cloud`, criando-o só se ainda não existir; localiza a folha existente pela `rota` (para não duplicar se a migration rodar de novo com nome diferente); replica o acesso de usuários já concedidos ao grupo pai para a nova folha, evitando que ninguém perca acesso.

## Decisões obrigatórias

1. Estrutura de menu: `Estoques → Compras → Pedidos` — reaproveitar o grupo "Compras" já criado pela migration de Consulta de Compras (não duplicá-lo), criar só a folha nova "Pedidos".
2. Cadastro de Pedidos recebe módulo de autorização **próprio** (`EstoquePedidoCompraModuleAccessService`/`EnsureEstoquePedidoCompraModuleAccess`), não continua reaproveitando o de Consulta de Compras — decisão já tomada no workspace de análise (não redecidir, só aplicar).
3. A migration deve ser idempotente e defensiva, no mesmo padrão da migration de referência (checagem de schema, localização por nome antes de inserir, replicação de acesso de usuários do grupo pai).
4. Atualizar todos os pontos da documentação/specs anteriores que citam o gate G6 como provisório, marcando-os como resolvidos.

## Critérios de aceite

- [ ] Menu exibe `Estoques → Compras → Pedidos`, reaproveitando o grupo "Compras" existente (não cria um grupo duplicado).
- [ ] A folha "Pedidos" aponta para a rota `estoque.pedidos-compra.cadastro`.
- [ ] `EstoquePedidoCompraModuleAccessService`/`EnsureEstoquePedidoCompraModuleAccess` seguem exatamente o contrato do par de referência de Consulta de Compras.
- [ ] As rotas `estoque.pedidos-compra.*` usam o novo middleware; nenhuma rota deste grupo continua usando `estoque.consulta_compras.module`.
- [ ] Rodar a migration duas vezes seguidas não duplica grupo, folha, nem registros de acesso de usuário.
- [ ] Usuário administrador sempre tem acesso, independente de `acessosmodulos`.
- [ ] Usuário sem o novo código de acesso recebe 403 ao tentar acessar qualquer rota `estoque.pedidos-compra.*`.

## Matriz mínima de testes

- **Menu — estrutura e idempotência**: rodar a migration → grupo "Compras" não duplica (reaproveita o existente de Consulta de Compras); folha "Pedidos" criada apontando para a rota certa; rodar a migration de novo → nenhuma duplicata.
- **Replicação de acesso**: usuário com acesso ao grupo "Compras" antes da migration → após a migration, tem acesso automático à folha "Pedidos", sem conceder manualmente.
- **Autorização — administrador**: usuário administrador acessa `estoque.pedidos-compra.cadastro` mesmo sem registro em `usuariosacessosmodulos`.
- **Autorização — usuário sem grant**: usuário comum sem o novo código de acesso recebe 403 ao acessar qualquer rota `estoque.pedidos-compra.*`.
- **Autorização — usuário com grant**: usuário com o novo código de acesso (via `usuariosacessosmodulos`) acessa normalmente.
- **Separação de grants**: usuário com acesso só a Consulta de Compras (não ao novo código de Pedidos) **não** acessa mais Cadastro de Pedidos — confirma que o acoplamento provisório foi removido.

## Saída esperada do SpecKit

Produza uma especificação executável e um plano que:

- listem os requisitos funcionais do menu e da autorização própria;
- identifiquem os arquivos exatos a criar/editar (migration, service, middleware, `bootstrap/app.php`, `routes/web.php`), após inspecioná-los;
- detalhem a estrutura de menu e o contrato de autorização acima, replicando o padrão de Consulta de Compras;
- incluam os critérios de aceite e a matriz de testes acima;
- declarem explicitamente que nenhuma lógica de negócio das rotas já implementadas (specs 01-08) é alterada;
- marquem como resolvidos os pontos de documentação que citavam o gate G6 como provisório.

## Fora de escopo

- implementar durante `/speckit.specify` além do que os critérios acima descrevem;
- qualquer alteração de lógica de negócio das rotas já existentes de Pedidos (specs 01-08);
- o comportamento F9 "Procurar Pedidos", as abas informativas (Fornecedor/Notas Fiscais/Contatos/Notas Pendentes de Entrada) e a paridade visual de grids/modal — cobertos por fatias seguintes deste mapa de fechamento de tela;
- alterar o schema Delphi ou desativar qualquer tela Delphi.
```
