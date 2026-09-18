# Auditar superfícies mobile existentes

Type: task
Status: resolved

## Answer

### Achados confirmados

- AppLayout concentra o shell: #main-content e o scroll vertical principal, menu lateral desktop a partir de md e drawer mobile com w-72 e max-w-[85vw]. O drawer fecha por Escape e ao concluir a navegacao. O main usa overflow-x-clip; qualquer scroll horizontal necessario precisa ser dono de um subcomponente, nao da pagina inteira.
- ErpCadastroShell ativa o rail somente com useErpViewportMd e apos um limiar de scroll, com threshold padrao de 72px. Em mobile permanece na barra full sticky; ErpOpsRailSurface e compartilhado. O rail lateral nao deve ser a solucao mobile presumida.
- ErpConsultaOperationBar possui modo full horizontalmente rolavel e modo rail. ErpCadastroCommandBar preserva atalhos, estados disabled/busy e trailingActions. A especificacao precisa definir ordem e descoberta das acoes sem alterar sua semantica.
- ConsultaRuleFilterPanel e um seam compartilhado: em sm+ usa regras em grid de seis colunas; no mobile empilha cada regra com rotulos, mantendo abas, lookup e adicionar/remover regras. Ainda nao define resumo de filtros ativos, apply/cancel/reset ou comportamento de filtros avancados.
- DataGrid concentra ordenacao, filtros, paginacao, selecao, edicao, resize/reorder de colunas, virtualizacao opcional, navegacao por teclado e area de scroll configuravel. A politica para muitas colunas deve ser decidida nesse contrato, nao repetida por tela.

### Sinais do inventario

As buscas indicam aproximadamente 170 ocorrencias de overflow-x-auto, 1.219 de min-w-, 714 larguras arbitrarias no formato w-[...], 314 referencias a ErpCadastroShell, 91 a ErpConsultaOperationBar, 42 a ConsultaRuleFilterPanel e 132 usos de DataGrid. Sao sinais de superficie e podem conter testes, strings e sobreposicoes; nao representam telas unicas.

| Familia | Representantes | Situacao mobile | Seam candidato |
| --- | --- | --- | --- |
| Shell e navegacao | AppLayout.tsx, drawer e #main-content | Base existente; falta contrato de header estreito, foco e safe area | AppLayout |
| Operacoes | ErpCadastroShell, ErpCadastroCommandBar, ErpConsultaOperationBar | Full/rail existe; rail e desktop e full pode ficar densa ou rolavel | operation bars + modo mobile |
| Filtros | ConsultaRuleFilterPanel e toolbars locais | Regra compartilhada empilha; locais sao heterogeneos | filtro compartilhado e estado |
| Grids e tabelas | DataGrid; tabelas em Configuracoes, Admin e consultas fiscais | Ha wrappers de overflow, mas nao politica para colunas prioritarias ou detalhe | DataGrid + presentation mode |
| Formularios densos | Cadastros/Vendas/PlanosPagamento e cadastros com secoes horizontais | Alguns grupos empilham; secoes internas usam overflow e min-width | primitives de form/group |
| Lookup, modal e feedback | lookup/painel compartilhado, modais e toasts | Requer validar foco, Escape, altura e area segura | overlay/feedback contract |
| Relatorios, graficos, anexos e imagens | consumidores diversos | Nao foi localizado um padrao unico | regras por tipo |

### Classificacao e implicacoes

- CONFIRMADO: o shell separa navegacao mobile em drawer e preserva desktop a partir de md; rail de operacoes nao e ativado em mobile.
- CONFIRMADO: ConsultaRuleFilterPanel e DataGrid sao pontos compartilhados com capacidades importantes para migracao incremental.
- INFERIDO: o problema principal nao e falta de classes responsivas, mas falta de prioridade quando comandos, filtros e colunas competem pelo espaco.
- POSSIVEL BUG ATUAL: overflow-x-clip no main combinado com wrappers locais, min-width e larguras fixas pode produzir scroll aninhado ou tornar parte do conteudo inacessivel; barras horizontais tambem podem esconder a existencia de acoes secundarias.
- DUVIDA A DECIDIR: filtros avancados devem usar drawer/sheet/tela dedicada? Grids largos devem preservar tabela com scroll delimitado, oferecer lista/cartoes com detalhe, ou suportar os dois modos?

### Recomendacao

Nao aplicar CSS mobile global nem criar variante por tela. A especificacao deve aprofundar quatro seams: AppLayout/header e operacoes; padrao de filtros; modo de apresentacao do DataGrid; e primitives para formularios/overlays. Depois cada tela declara apenas excecoes e prioridades de dados. O inventario torna os tickets 02, 03 e 04 decisoes bem delimitadas; o ticket 05 deve transformar essas decisoes em contratos de breakpoint, acessibilidade e compatibilidade desktop.

## Question

Qual é o inventário real de problemas mobile e quais seams compartilhados cobrem a maior parte das telas?

Auditar AppLayout, header, drawer, subheader, #main-content, barras de operação, filtros, formulários densos, DataGrid, tabelas HTML, lookup, modais, toasts, gráficos, relatórios e componentes com overflow-x-auto, min-width, width fixa ou rail overlay. Separar definições, wrappers, consumidores e exceções. Produzir uma matriz de representantes por família de tela, largura atual, scroll container, ações, filtros, colunas, edição, foco e teste existente.
