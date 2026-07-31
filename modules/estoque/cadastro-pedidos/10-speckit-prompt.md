# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para construir, no Laravel, o botão **"Procurar F9"** (localizar um Pedido de Compra já existente) na tela de Cadastro de Pedidos de Compra, ativando o botão "Localizar (F9)" que já existe na barra de comandos mas está desabilitado (`onSearch={() => undefined}`, `searchDisabled`, em `resources/js/Pages/Cadastros/Estoque/PedidosCompra/Cadastro.tsx`). Esta é a décima fatia do Cadastro de Pedidos de Compra — reaproveita integralmente a infraestrutura de busca já usada por dezenas de outras telas de Cadastro já migradas.

Não implemente nesta etapa. Você não possui acesso ao código Delphi. Considere a seção `Evidência Delphi confirmada` como requisito legado autoritativo, e `Evidência Laravel confirmada` como o estado já mapeado do checkout — mas **reconfirme-o por inspeção direta antes de alterar qualquer coisa**, pois pode estar defasado. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE.

## Limite desta entrega

A entrega termina quando existir:

- um endpoint de lookup no backend (`estoque.pedidos-compra.lookup`, mesmo padrão de nomenclatura de `estoque.fornecedores.lookup`) que busca pedidos por nome do fornecedor, retornando nome do fornecedor/emissão/situação/valor do pedido/número, paginado e ordenável por qualquer uma dessas colunas;
- um modal `PedidoCompraLookupModal` (React), construído sobre a mesma infraestrutura compartilhada já usada por `ErpTwoColumnCatalogLookupModal` (`CadastrosTable`, `TablePagination`, classes de scroll `ERP_LOOKUP_TABLE_*`, tratamento de sessão expirada via `isUnauthenticatedOrSessionError`/`LookupSessionExpiredMessage`, sessão persistida para reabrir sem perder a última busca) — mas com as 5 colunas corretas (Nome do fornecedor, Emissão, Situação, Valor do pedido, Número), não as 2-3 do padrão genérico;
- a troca de `onSearch={() => undefined}`/`searchDisabled` em `Cadastro.tsx` para abrir esse modal; ao selecionar um pedido (`onSelect`), a tela carrega esse pedido (mesmo comportamento de "abrir registro existente" já usado pelo restante da tela).

Não inclua nesta entrega: qualquer alteração na lógica de negócio do cabeçalho/itens/grade já especificada (specs 01-08); o menu/autorização (spec 09, tratado à parte).

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM, data modules, queries ou qualquer outra fonte Delphi.
- As evidências Delphi abaixo já foram extraídas no workspace de análise a partir de `apps/estoque/fmcadastropedidos.pas`/`.dfm` e `repositorio/fmcadastropadrao.pas` (classe-base).
- Inspecione o checkout Laravel para confirmar o estado atual dos componentes/rotas citados — podem já ter mudado desde esta análise.
- Se uma decisão depender de informação Delphi ausente, registre a pergunta exata para o workspace de análise — não infira.

## Investigação Laravel obrigatória

- `resources/js/Components/erp/cadastro/ErpCadastroCommandBar.tsx` — já expõe `onSearch`/`searchDisabled` (botão "Localizar (F9)"), usado por 59 telas de Cadastro;
- `resources/js/Components/erp/cadastro/useRegistryCadastroShortcuts.ts` — atalho de teclado F9 já genérico, confirmar se `Cadastro.tsx` de Pedidos já o utiliza (diretamente ou via um hook de página que o envolve) ou se falta conectar;
- `resources/js/Components/erp/cadastro/ErpTwoColumnCatalogLookupModal.tsx` (usado por `Estoque/Fornecedores/Cadastro.tsx`) — modelo estrutural mais próximo a replicar (paginação, ordenação por coluna, sessão persistida, tratamento de sessão expirada) — **não** cobre o número de colunas necessário para Pedidos, adaptar, não usar tal como está;
- `app/Http/Controllers/Estoque/FornecedoresController.php` (método `lookup`) e a rota `estoque.fornecedores.lookup` — padrão de referência para o endpoint de lookup a criar para Pedidos;
- `resources/js/Pages/Cadastros/Estoque/PedidosCompra/Cadastro.tsx` (linhas atuais ~308-318) — ponto exato onde `onSearch`/`searchDisabled` precisam ser trocados;
- como a tela hoje carrega um pedido existente (edição) — reaproveitar o mesmo fluxo para o resultado da seleção no modal, em vez de criar um caminho de carregamento paralelo.

## Evidência Delphi confirmada

### F9 é comportamento genérico herdado, não um módulo à parte (CONFIRMADO, `fmcadastropedidos.pas:29`, `.dfm:29`)

`TfrmCadastroPedidos = class(TfrmCadastroPadrao)` — o botão "Procurar F9" da tela principal é `inherited sbnProcurar: TSpeedButton`, herdado da classe-base `TfrmCadastroPadrao` (`repositorio/fmcadastropadrao.pas`), o mesmo padrão usado por praticamente toda tela de Cadastro do sistema (confirmado por >250 arquivos referenciando o padrão base). **Não é o módulo `fmListadePedidos`/Consulta e Listagem de Pedidos**, que permanece fora de escopo (excluído no mapa anterior) — é a busca padrão do registro atual, aplicada ao cadastro de Pedidos.

### Contrato do modal de busca (CONFIRMADO, `tela_f9_pesquisa_pedidos.png`)

Campo único "Procura por Nome" (busca pelo nome do fornecedor); grid de resultados com colunas Nome, Emissão, Situação, Valor pedido, Número; rodapé com dica de atalho "F11 - Próxima coluna" / "Shift F11 - Coluna anterior" (ordenação por coluna, ciclável) e contador de registros. Selecionar uma linha (ou confirmar) abre o pedido correspondente na tela principal.

## Evidência Laravel confirmada

### Botão já existe na tela, desabilitado (CONFIRMADO, `resources/js/Pages/Cadastros/Estoque/PedidosCompra/Cadastro.tsx:308-318`)

```
<ErpCadastroCommandBar
  onInsert={() => void handleIncluir()}
  onSave={() => void handleGravar()}
  ...
  onSearch={() => undefined}
  ...
  searchDisabled
```

O botão "Localizar (F9)" já é renderizado pela barra de comandos compartilhada, mas sem nenhuma ação — esta é a lacuna a fechar, não um recurso a construir do zero.

### Padrão de referência mais próximo — Fornecedores (CONFIRMADO, `Estoque/Fornecedores/Cadastro.tsx:552-557,817`)

Mesmo domínio (Estoque), já com `onSearch`/`searchDisabled={false}` funcionando, abrindo `ErpTwoColumnCatalogLookupModal`. Esse componente reaproveita `CadastrosTable`/`TablePagination`/classes de scroll compartilhadas e um padrão de sessão persistida (`erpCatalogLookupSessionStore`) para reabrir o modal sem perder a última busca/página/ordenação — replicar essa infraestrutura, adaptando o número de colunas.

## Decisões obrigatórias

1. F9 em Pedidos é a busca padrão de registro (herdada de `TfrmCadastroPadrao` no legado), não o módulo de Consulta/Listagem de Pedidos já excluído — não reabrir essa exclusão.
2. Reaproveitar a infraestrutura já usada por `ErpTwoColumnCatalogLookupModal`/Fornecedores (tabela, paginação, scroll, sessão expirada, sessão persistida) — não inventar um padrão novo de zero.
3. O modal de Pedidos precisa de 5 colunas (Nome, Emissão, Situação, Valor pedido, Número) — não é uma reutilização direta do modal de 2 colunas, é um componente novo seguindo a mesma estrutura.
4. Selecionar um pedido no modal carrega esse pedido pelo mesmo fluxo já usado para abrir um pedido existente na tela (não duplicar lógica de carregamento).

## Critérios de aceite

- [ ] Botão "Localizar (F9)" (mouse ou tecla F9) abre o modal de busca de pedidos.
- [ ] Busca por nome do fornecedor retorna pedidos correspondentes, paginados.
- [ ] Grid do modal mostra Nome do fornecedor, Emissão, Situação, Valor do pedido, Número — ordenável por qualquer coluna.
- [ ] Selecionar um pedido no modal carrega esse pedido na tela principal, pelo mesmo caminho já usado para abrir um pedido existente.
- [ ] Reabrir o modal (ex.: depois de fechar sem selecionar) preserva a última busca/página/ordenação, mesmo padrão já usado pelo lookup de Fornecedores.
- [ ] Sessão expirada durante a busca mostra a mesma mensagem já padronizada (`LookupSessionExpiredMessage`), não um erro genérico.

## Matriz mínima de testes

- **F9 abre o modal**: tecla F9 com foco em qualquer campo da tela → modal de busca abre (mesma cobertura de `useRegistryCadastroShortcuts`, que já funciona com foco em input/textarea/select).
- **Busca e seleção**: buscar por um trecho do nome de um fornecedor com múltiplos pedidos → grid lista todos; selecionar um → pedido correto é carregado na tela.
- **Ordenação por coluna**: clicar em "Situação" ou "Valor pedido" → resultados reordenam; clicar de novo → inverte a direção.
- **Paginação**: busca com mais resultados que uma página → paginação funciona, navegação preserva a busca ativa.
- **Sessão persistida**: buscar, navegar para a página 2, fechar o modal sem selecionar, reabrir → mesma busca/página/ordenação restauradas.
- **Sessão expirada**: simular sessão expirada durante a busca → mensagem padronizada exibida, sem quebrar a tela.

## Saída esperada do SpecKit

Produza uma especificação executável e um plano que:

- listem os requisitos funcionais do endpoint de lookup e do modal de busca;
- identifiquem os arquivos exatos a criar/editar (rota, controller/service de lookup, componente React, ponto de wiring em `Cadastro.tsx`), após inspecioná-los;
- detalhem o contrato de busca/colunas/ordenação acima, reaproveitando a infraestrutura compartilhada já mapeada;
- incluam os critérios de aceite e a matriz de testes acima;
- declarem explicitamente que este F9 não é o módulo de Consulta/Listagem de Pedidos (fora de escopo).

## Fora de escopo

- implementar durante `/speckit.specify` além do que os critérios acima descrevem;
- o módulo `fmListadePedidos`/Consulta e Listagem de Pedidos — mapa/esforço futuro próprio, confirmado novamente que não é este F9;
- qualquer alteração de lógica de negócio das rotas já implementadas (specs 01-08);
- o menu/autorização (spec 09, tratado à parte);
- alterar o schema Delphi ou desativar qualquer tela Delphi.
```
