# Definir a UX de títulos em Campos da Grade

Type: prototype
Status: resolved
Blocked by: 02

## Question

Como deve ficar o seletor `Campos da Grade` para editar títulos inline com referência ao original, restaurar uma coluna isoladamente e preservar o contrato de rascunho Confirmar/Cancelar/Restaurar padrão, incluindo pesquisa, teclado, foco, validação, títulos vazios/longos/duplicados e colunas técnicas não configuráveis?

## Answer

Escolhida pelo usuário a **variante A — Tabela compacta com edição inline**, validada no [protótipo descartável](../prototype/campos-grade.html). As variantes lista+editor e matriz comparativa foram rejeitadas.

### Estrutura

- Manter um único modal `Campos da Grade`, ampliado o suficiente para uma tabela compacta.
- Cada linha representa uma coluna de dados configurável e contém, nesta ordem: checkbox **Visível**, identificação da coluna, input **Título exibido** e ação **Restaurar**.
- A identificação mostra o título efetivo em destaque e `Padrão: <título do catálogo>` como referência estável.
- Colunas técnicas/fixas (seleção, ações, posição, checkbox etc.) não aparecem no seletor; não são exibidas desabilitadas.
- Colunas ocultas continuam com input de título editável, permitindo preparar o nome antes de torná-las visíveis.

### Pesquisa

- Um único campo filtra, sem persistir, por título padrão, Título Personalizado e `columnId`.
- A busca ignora caixa e acentos e preserva o rascunho das linhas temporariamente filtradas.
- Estado vazio: `Nenhuma coluna encontrada.`

### Rascunho e ações

- Abrir fotografa o layout persistido e cria um rascunho isolado.
- Checkbox e título atualizam somente o rascunho; o grid atrás do modal pode refletir a prévia, mas nenhuma chamada de persistência ocorre.
- **Restaurar** em uma linha remove somente seu override de título no rascunho.
- **Restaurar padrão** redefine no rascunho visibilidade, ordem, larguras e títulos do grid inteiro; ainda exige **Confirmar**.
- **Cancelar**, clique no backdrop e **Escape** descartam todo o rascunho e restauram a fotografia inicial.
- **Confirmar** normaliza e persiste visibilidade+títulos e demais alterações do rascunho em uma única operação; modal só fecha após sucesso. Em falha, permanece aberto, mantém o rascunho e mostra erro.
- Exibir indicador discreto da quantidade de alterações no rascunho; desabilitar Confirmar quando não houver diff válido.

### Validação

- Input `maxlength=120`, contador visível ao aproximar-se do limite.
- Vazio/apenas espaços mostra o título padrão como resultado e equivale a Restaurar na confirmação.
- Trim, controles e quebras de linha seguem o contrato do ticket de schema.
- Títulos duplicados são permitidos e não geram erro.
- Nenhum HTML/Markdown é interpretado.

### Teclado e foco

- Ao abrir: foco no campo de busca.
- Modal mantém focus trap; ordem natural: busca, depois checkbox/input/Restaurar de cada linha visível, ações do rodapé.
- `Escape` equivale a Cancelar.
- Após fechar, foco retorna ao elemento que abriu `Campos da Grade` (menu contextual, botão ou Alt+G).
- Labels/descrições acessíveis distinguem título padrão, título exibido e visibilidade; anúncio de erro e salvamento usa `aria-live`.

O protótipo é deliberadamente descartável e não contém persistência real.
