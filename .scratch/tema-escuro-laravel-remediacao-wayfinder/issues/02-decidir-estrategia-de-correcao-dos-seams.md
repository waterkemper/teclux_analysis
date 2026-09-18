# Decidir estratégia de correção dos seams compartilhados

Type: grilling
Status: resolved
Blocked by: 01

## Question

Qual contrato de correção deve ser aplicado aos seams compartilhados para eliminar em escala papéis, textos, bordas e estados físicos sem remapeamento global nem regressão no tema claro?

Decidir a ordem e o contrato para `AppLayout`, `ErpCadastroShell`, barras de comando/operação, `RomaneioNumeroInput`, primitives, filtros, grids, modais, drawers, lookups, toasts e aliases físicos `teclux-*`. Definir como tratar opacidade, disabled, hover, foco, seleção, estados semânticos e exceções de dados de negócio nas três paletas.

## Answer

Aplicar uma correção profunda e semântica nos seams compartilhados e nos consumidores que possam sobrescrevê-los. Não basta trocar estilos padrão no componente: todas as variantes, propriedades de estilo e classes fornecidas pelos consumidores devem ser auditadas para impedir que cores físicas reintroduzam ilhas claras ou baixo contraste.

### Contrato obrigatório

- Proibir `teclux-primary`, `teclux-secondary`, `teclux-neutral` e demais aliases físicos no chrome adaptável. Substituí-los por tokens semânticos `--erp-*` e seus utilitários Tailwind.
- Preservar cor fixa somente para identidade visual, imagens ou dados de negócio com significado operacional preexistente, contraste adequado e entrada explícita em allowlist.
- Não usar remapeamento CSS global, seletores com `!important`, variantes paralelas por tema nem branches Claro/Escuro. Tema claro e as três paletas escuras devem usar a mesma árvore de componentes.
- Migrar sucesso, alerta, erro, informação, seleção, hover, foco, loading, readonly e disabled para tokens semânticos próprios.
- Não usar transparência para adaptar cor física. Papéis, textos e bordas usam tokens semânticos; opacidade fica restrita a overlays, scrims e efeitos decorativos definidos pelo sistema.
- `disabled` e `readonly` não podem depender apenas de `opacity`; foco e seleção não podem usar `ring-offset-white` ou outra cor física.
- Classes e variantes fornecidas por consumidores não podem sobrescrever seams com `white`, `black`, `stone`, `slate`, `gray`, `teclux-*` físico ou literal de cor sem classificação e allowlist.

### Ordem de correção

1. Tokens `--erp-*`, aliases e variantes semânticas.
2. `AppLayout` e superfícies estruturais.
3. Primitives como `Button`, `Input`, `SelectField`, labels e validação.
4. `ErpCadastroShell`, barras de comando/operação e `RomaneioNumeroInput`.
5. Modais, drawers, lookups e toasts.
6. Filtros, shells de consulta e grids.
7. Sobrescritas remanescentes nas páginas consumidoras.

Cada etapa deve validar consumidores representativos antes da seguinte; corrigir o seam não autoriza declarar seus consumidores automaticamente migrados.

### Condição de conclusão por seam

Um seam só está concluído quando não possui cor física não classificada em componente, variantes ou consumidores; seus estados normal, hover, foco, seleção, erro, loading, readonly e disabled foram verificados; tema claro e as três paletas escuras passaram; consumidores representativos foram renderizados e capturados; texto e controles aplicáveis atendem WCAG 2.2 AA; e não restam ilhas claras, regressões no tema claro ou sobrescritas físicas não autorizadas.
