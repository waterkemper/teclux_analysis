# Prompt para /speckit.specify — Correção

```text
/speckit.specify

Corrija a Fundação/Parâmetros da Consulta de Compras (Estoque → Compras → Consultas), já implementada em `modules/estoque/consulta-compras/01-speckit-prompt.md` → spec `266-consulta-compras-parametros` → `resources/js/Pages/Cadastros/Estoque/ConsultaCompras/`. Isto **não é uma feature nova**: é uma correção pontual sobre código já implementado e em uso, identificada por comparação direta entre uma captura de tela do Delphi (`filtros_delphi.png`) e uma captura de tela do Laravel atual (`filtros_laravel.png`), fornecidas no workspace de análise.

Não invente comportamento novo além do que este prompt descreve. Inspecione o checkout Laravel atual antes de alterar qualquer arquivo — os caminhos citados abaixo já foram confirmados no checkout, mas confirme novamente antes de editar, e cite evidência concreta (arquivo + trecho) de qualquer divergência encontrada frente ao que este prompt afirma.

## Escopo

Sete correções independentes na mesma tela (`Index.tsx` e componentes relacionados em `resources/js/Pages/Cadastros/Estoque/ConsultaCompras/`):

1. Remover dois textos da UI.
2. Trocar Fornecedor/Grupos de Fornecedores para um componente de filtro por regra com multi-adição por código (lookup).
3. Adicionar atalhos de período de vendas usando o padrão já existente no Laravel.
4. Limitar "Número de dias" a 4 dígitos.
5. Eliminar o botão manual "Gravar preferências (F5)" — persistência vira automática, e passa a cobrir também largura/visibilidade de colunas dos grids de resultado.
6. Adicionar de volta os filtros "Estoque Em"/"Sem Estoque" (Filiais com/sem estoque), que ficaram de fora da implementação da Fundação.
7. Nenhuma mudança na `ErpConsultaOperationBar` em si — só uma explicação, não uma correção (ver seção correspondente abaixo).

## 1. Remover dois textos

Em `resources/js/Pages/Cadastros/Estoque/ConsultaCompras/Index.tsx`, linhas 622-628, remover as duas linhas de texto abaixo do título `<h1>`:

- `<p>Parâmetros e motor de sugestão de compras.</p>` (linha 623-625)
- `<p>Nenhuma filial marcada produz filtro vazio (não seleciona todas). Diferente da Análise de Estoques.</p>` (linha 626-628)

**Importante**: isto remove só o texto exibido ao usuário — a **regra em si** ("nenhuma filial marcada produz filtro vazio, sem tratamento especial de 'todas'") continua valendo exatamente como está implementada hoje. Essa regra foi uma decisão deliberada (fidelidade ao comportamento Delphi, incluindo sua ambiguidade original) — não reverta o comportamento, só o aviso textual ao usuário.

## 2. Fornecedor/Grupos de Fornecedores — trocar para filtro por regra com lookup multi-adição

Hoje (ver captura `filtros_laravel.png`, seção abaixo do filtro de produtos, não visível no crop mas presente no código): Fornecedor é um campo único; Grupos de Fornecedores usa um formato próprio.

**Correção**: usar o mesmo padrão já estabelecido em `resources/js/Components/erp/vendas/ClientFilterPanel.tsx` (filtro de clientes — painel por abas, regras com operador/condição, permite adicionar múltiplas entradas digitando código com lookup de resolução rápida, ver `TABS_COM_RESOLVE_RAPIDO`). Adapte esse mesmo componente/padrão (ou extraia a peça reutilizável equivalente) para Fornecedor e Grupos de Fornecedores nesta tela — permitindo múltiplos fornecedores/grupos por regra, digitando código diretamente com autocomplete/lookup, em vez do campo único atual.

Referência adicional: `resources/js/Components/erp/consulta/ConsultaRuleFilterPanel.tsx` e `resources/js/Components/erp/vendas/ProductFilterPanel.tsx` usam variações do mesmo padrão de regra com lookup — confirme no checkout qual delas é a mais adequada para reaproveitar (ou generalizar) para Fornecedor.

## 3. Período de Vendas — atalhos de período (padrão Laravel já existente)

Hoje: só Data Inicial, Data Final, Número de dias, sem nenhum atalho de preenchimento rápido.

**Correção**: adicionar os mesmos atalhos de período já usados em `resources/js/Components/erp/vendas/DateRangeFields.tsx` (constante `SHORTCUTS`): **Hoje, Ontem, 30 dias, Este mês, Mês ant.** — clicar num atalho preenche Data Inicial/Final automaticamente (ver `applyShortcut` no mesmo arquivo para a lógica de cálculo de cada atalho). Isto não é paridade Delphi (o Delphi desta tela não tem esse recurso) — é adoção do padrão de UX já estabelecido no restante do Laravel para filtros de data, por decisão do usuário.

Mantenha o recálculo bidirecional Data↔Número de dias já implementado (`periodoVendasSync.ts`) funcionando em conjunto com os novos atalhos — usar um atalho deve também atualizar "Número de dias" corretamente.

## 4. Número de dias — limite de 4 dígitos

Hoje: sem limite de tamanho visível no campo "Número de dias" do Período de Vendas.

**Correção**: limitar a entrada a no máximo 4 dígitos (valor máximo 9999), tanto na validação client-side quanto na `GerarConsultaComprasRequest`/`ValidarConsultaComprasParametrosRequest` (backend), se essa validação ainda não existir lá.

## 5. Eliminar "Gravar preferências (F5)" — persistência automática

Hoje (`Index.tsx:596-601`, `handleGravarPrefs` chamando `saveConsultaComprasPrefs` de `preferencesLocal.ts`): existe um botão manual "Gravar preferências" (atalho F5) na `ErpConsultaOperationBar`, que só persiste os parâmetros em `localStorage` quando clicado.

**Correção**:
- Remover o botão "Gravar preferências"/F5 da `ErpConsultaOperationBar` (`Index.tsx:596-601`).
- A persistência de parâmetros (mesmo conjunto hoje salvo por `saveConsultaComprasPrefs`: Filiais, Grupos de Filiais, regras de produto, período, estoque, dias, flags, conceitos, fornecedores) passa a ser **automática** — salvar a cada mudança relevante de estado (debounced, para não persistir a cada tecla digitada), sem exigir ação do usuário.
- **Amplia o escopo original**: a persistência automática também deve cobrir **largura e visibilidade de colunas dos grids de resultado** (abas Produtos Total, Produtos Similares, Produtos Grades — `AbaProdutosTotal.tsx`, `AbaProdutosSimilares.tsx`, `AbaProdutosGrades.tsx`) — hoje isso não é mencionado em nenhum lugar do código consultado; inspecione se já existe algum mecanismo de customização de coluna nesses grids (o padrão de grid já usado no restante do ERP, `ErpDataGrid`/`tanstack-grid` conforme spec `038-erp-tanstack-grid`, deve ter suporte nativo a persistência de layout — reaproveitar esse mecanismo, se existir, em vez de criar um novo).

## 6. Filtros "Estoque Em"/"Sem Estoque" ausentes

Confirmado pela comparação das capturas de tela: o Delphi tem 4 abas de seleção de Filial (`Filial`, `Grupo Filial`, `Filiais com Estoque`/"Estoque em", `Filiais sem Estoque`/"sem Estoque" — evidenciado em `dmconsultacompras.pas`: `MontarFiltroFiliaisEstoque`, `MontarFiltroFiliaissemEstoque`, controles `clbFiliaisEstoque`/`clbFiliaissemEstoque`), mas a implementação Laravel atual (`Index.tsx`) só tem **Filiais** e **Grupos de Filiais** — as duas abas de Filiais-com/sem-estoque não foram implementadas.

**Correção**: adicionar as duas seleções ausentes (Filiais com Estoque, Filiais sem Estoque) como listas de marcação múltipla, mesmo padrão visual das listas de Filiais/Grupos de Filiais já existentes, alimentando os parâmetros equivalentes a `MontarFiltroFiliaisEstoque`/`MontarFiltroFiliaissemEstoque` do Delphi. Verifique se o backend (`ConsultaComprasParametrosService`/`ConsultaComprasParameterManifest`) já tem esses campos previstos e não conectados na UI, ou se precisam ser adicionados também no backend.

## 7. "Contexto dos Atalhos" — não é uma correção, é uma explicação

A faixa vertical de ícones à direita na tela (visível em `filtros_laravel.png`) é a `ErpConsultaOperationBar` (`resources/js/Components/erp/consulta/ErpConsultaOperationBar.tsx`) dentro do `ErpCadastroShell` — o padrão de barra de comandos já usado por outras Consultas do ERP (não específico desta tela, não um bug). Ela concentra os comandos (Gerar F6, Validar parâmetros, atalhos de navegação) num layout colapsado por ícone, diferente da fileira horizontal com texto visível do Delphi (Gravar F5, Gerar F6, Cancelar, Relatório F7, Estoque F8, Pedido F10, Requisição F11...). **Não alterar este componente compartilhado** como parte desta correção — se a legibilidade dos comandos for considerada insuficiente, isso é uma decisão de UX transversal a todas as Consultas do ERP, fora do escopo desta correção pontual.

## Critérios de aceite

- [ ] Os dois textos (`Parâmetros e motor de sugestão de compras.` e o aviso sobre filial vazia) não aparecem mais na tela; a regra de filtro vazio para filial não marcada continua funcionando exatamente como antes.
- [ ] Fornecedor e Grupos de Fornecedores permitem adicionar múltiplas entradas por código, com lookup, no mesmo padrão do filtro de clientes.
- [ ] Período de Vendas tem os 5 atalhos (Hoje, Ontem, 30 dias, Este mês, Mês ant.), e o recálculo bidirecional data↔dias continua funcionando com eles.
- [ ] Número de dias não aceita mais de 4 dígitos, nem no client nem no backend.
- [ ] Não existe mais nenhum botão "Gravar preferências"/F5; os parâmetros persistem automaticamente sem ação do usuário.
- [ ] Largura/visibilidade de colunas dos grids de resultado (Produtos Total, Similares, Grades) persistem automaticamente entre sessões.
- [ ] Filiais com Estoque e Filiais sem Estoque aparecem como seleções próprias, alimentando o parâmetro correto no backend.
- [ ] Nenhuma mudança foi feita na `ErpConsultaOperationBar` compartilhada.

## Matriz mínima de testes

- Carregar a tela sem preferências salvas → nenhum texto removido aparece; nenhum botão de gravar aparece.
- Alterar um parâmetro (ex.: marcar uma Filial) → aguardar o debounce → recarregar a página → parâmetro continua marcado (persistência automática funcionando).
- Redimensionar/ocultar uma coluna num grid de resultado → recarregar → layout persistido.
- Digitar mais de 4 dígitos em "Número de dias" → input trunca ou rejeita; enviar valor de 5 dígitos direto ao backend → rejeitado pela validação.
- Clicar em cada um dos 5 atalhos de período → Data Inicial/Final e Número de dias atualizam corretamente para cada caso.
- Adicionar 2+ fornecedores por código no novo filtro → ambos aplicados na consulta.
- Marcar uma Filial em "Filiais com Estoque" → parâmetro correspondente enviado ao backend na geração da sugestão.
```
