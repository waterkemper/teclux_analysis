# Auditar superfície visual e tokens existentes

Type: task
Status: resolved

## Question

Quais superfícies da plataforma precisam participar do tema escuro e quais cores são estruturais, semânticas ou específicas de um domínio?

Inventariar `app.css`, `AppLayout`, primitives compartilhadas (`Button`, `Input`, Select, dialogs, grids, toasts), shell/menu, páginas representativas, tabelas, gráficos, SVGs, imagens, relatórios/impressão e protótipos. Separar utilitários hardcoded, tokens `teclux-*`, cores de status/paridade legada e exceções que não devem ser tematizadas. Entregar contagens reproduzíveis e uma matriz de consumidores.

## Answer

### Baseline confirmado

- `laravel/backend/resources/css/app.css` usa Tailwind CSS 4 via `@import 'tailwindcss'` e declara somente quatro tokens próprios em `@theme`: `teclux-primary`, `teclux-secondary`, `teclux-tertiary` e `teclux-neutral`. Não há tokens semânticos de superfície, texto, borda, foco, estado ou overlay.
- `laravel/backend/resources/views/app.blade.php` carrega o CSS/React e monta o Inertia, mas não inicializa atributo/classe de tema antes do carregamento. Uma preferência persistida aplicada somente após o mount poderia produzir flash de tema.
- `laravel/backend/resources/js/Layouts/AppLayout.tsx` já fornece o seam de preferência local: lê/escreve `teclux-erp-shell-sidebar-hidden` em `localStorage` e aplica `teclux-shell-sidebar-hidden` ao elemento `<html>`. É precedente reutilizável, não uma solução de tema pronta.
- Não foi localizado controlador global ERP para `data-theme`, `color-scheme` ou preferência de tema. Há uma exceção em `Pages/Cadastros/Clientes/ClienteQuickModal.tsx`, com classes `dark:` apenas nesse modal; ela é um piloto isolado e não comprova cobertura do restante do app.
- A busca reproduzível encontrou 661 arquivos TS/TSX com combinações comuns de cores de superfície/texto/borda e aproximadamente 8 mil ocorrências de utilitários de cor. Exemplos de contagem de ocorrências: `bg-white` 934, `bg-stone-50` 349, `bg-stone-100` 218, `bg-slate-50` 289, `text-slate-500` 318, `text-slate-600` 254, `border-stone-200` 757, `border-slate-200` 449, `border-slate-300` 401, `text-red-600` 211, `bg-red-50` 196 e `bg-amber-50` 183.
- O corpus agrupado por área encontrou, entre os arquivos que usam essas cores, 4 arquivos de layout/shell, 6 primitives de formulário, 82 dialogs/modais, 17 módulos de grid, 37 componentes de cadastro/consulta e 487 arquivos de páginas. Os grupos se sobrepõem e não são contagem de telas únicas.
- Existem 25 arquivos CSS em `resources/css`: `app.css` e 24 folhas de impressão/relatórios. As folhas de impressão usam preto/cinza e fundo claro deliberadamente; não devem herdar o tema de tela sem uma decisão específica de saída física.

### Matriz de superfície

| Superfície | Participa do tema de tela? | Evidência/decisão |
|---|---:|---|
| `AppLayout`, header, sidebar, breadcrumb e `#main-content` | Sim | muitos `bg-white`, `bg-stone-*`, `text-*`, bordas e foco em `AppLayout.tsx`; deve ser primeira fatia |
| `Button`, `Input`, `SelectField`, `FormSection`, campos numéricos e lookup | Sim | primitives usam fundos, bordas, placeholders, disabled e foco hardcoded; migrar antes das páginas |
| Command bars, rails e operation bars | Sim | `ErpCadastroCommandBar`/`ErpConsultaOperationBar` misturam branco/cinza/primary, sombra e focus ring |
| Grids, tabelas, filtros e paginação | Sim | `ErpGrid*`, tabelas e fieldsets usam `white`, `stone`, `slate`, seleção e estados disabled |
| Dialogs/modais/portals/toasts | Sim | 82 arquivos no grupo comum; precisam de superfície, backdrop, borda, foco e stacking coerentes |
| Feedback semântico: sucesso, atenção, erro, perigo, busy e autorização | Sim, com tokens próprios | não basta clarear/escurecer a paleta; preservar significado, contraste e não depender só de cor |
| Dashboard, gráficos e SVGs | Sim, seletivamente | `DashboardDemonstracao.tsx` possui cores de gráfico/`stopColor`; preferir série semântica adaptável e preservar imagens |
| Fotos, logos e imagens de Produto | Container sim; pixels não | não aplicar inversão/filtro global; adaptar moldura, placeholder e controles |
| Relatórios, impressão e PDFs físicos | Não por herança automática | folhas `*-print.css` e Blade de relatório têm contrato de saída clara; manter separado da preferência de tela |
| E-mails, recibos e documentos gerados | Não | são artefatos de distribuição/impressão, não superfície interativa do tema |
| `welcome.blade.php` e protótipos | Separar | o welcome contém `dark:` de scaffolding e é falso positivo para cobertura ERP; protótipos devem ser classificados à parte |

### Conclusão

O esforço é viável, mas deve ser tratado como migração de design tokens e primitives, não como adição pontual de `dark:`. A decisão recomendada para os próximos tickets é criar uma camada de tokens semânticos com tema selecionado no elemento `<html>`, migrar o shell e primitives primeiro, validar uma amostra de grids/modais/estados, e só então avançar por famílias de páginas. Não remapear globalmente `white`, `black`, `slate` ou `stone`, pois a mesma cor física hoje serve simultaneamente como fundo, texto, estado e saída legada.
