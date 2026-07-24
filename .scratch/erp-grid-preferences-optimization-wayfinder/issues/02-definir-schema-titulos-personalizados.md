# Definir o contrato persistido de títulos personalizados

Type: grilling
Status: resolved
Blocked by: 01

## Question

Como estender `GridPreferenceSection`, resolução/merge/sanitização frontend+backend e `schemaVersion` para armazenar títulos personalizados por `columnId`, preservando o título original do catálogo como default, descartando IDs removidos ou não autorizados, sobrevivendo à evolução dos catálogos e mantendo compatibilidade com preferências já gravadas?

## Answer

### Linguagem e identidade

- **Catálogo de Grid** é a definição autorizada das colunas e seus títulos padrão.
- **Preferência de Grid** pertence a um Usuário e altera somente apresentação.
- **Título Personalizado** é um override durável por `columnId`; nunca substitui a identidade técnica, o `dataField`, a autorização ou o título padrão do catálogo.
- Os termos foram registrados no `CONTEXT.md` transversal.

### Forma persistida

`GridPreferenceSection` passa a aceitar o campo opcional e esparso:

```ts
columnTitles?: Record<string, string>
```

Somente overrides efetivos são persistidos. Ausência do campo ou ausência de um `columnId` significa usar o título padrão atual do Catálogo de Grid.

### Normalização

Frontend e backend aplicam as mesmas regras; o backend permanece autoritativo:

1. aceitar somente string;
2. remover espaços nas extremidades;
3. converter quebras de linha em espaço e remover caracteres de controle;
4. limitar a 120 caracteres Unicode;
5. vazio/apenas espaços significa restaurar o padrão e remove a chave;
6. valor igual ao título padrão atual remove a chave;
7. títulos duplicados são permitidos, pois identidade e operações continuam por `columnId`;
8. conteúdo é texto simples, nunca HTML/Markdown;
9. somente colunas de dados configuráveis, apresentadas em `Campos da Grade`, aceitam override; seleção, ações, posição, checkbox e demais colunas técnicas/fixas descartam títulos enviados.

A proteção específica contra fórmula XLSX pertence ao adaptador de exportação e não modifica o texto mostrado no grid.

### Compatibilidade e evolução

- Preferências antigas sem `columnTitles` continuam válidas e resolvem para mapa vazio.
- Adicionar o campo opcional não incrementa em massa o `schemaVersion` dos catálogos.
- `schemaVersion` continua descrevendo a evolução do conjunto de colunas daquele grid; a seção salva sempre recebe a versão atual do catálogo ao ser regravada.
- Resolução é por IDs conhecidos, nunca por descarte integral da seção quando versões divergem.
- Coluna nova recebe visibilidade/ordem/largura/título padrão do catálogo.
- Coluna removida ou não autorizada tem todos os valores, inclusive título, descartados no load/save.
- `columnId` é imutável; trocá-lo equivale a remover uma coluna e criar outra, sem transportar automaticamente o título.
- Se apenas o título padrão do catálogo mudar, usuários sem override veem o novo título; o Título Personalizado existente permanece até restauração explícita.

### Seam do módulo compartilhado

- `useErpGridLayout`/resolução do layout incorpora o mapa esparso de títulos, preservando separadamente default e override.
- `buildPreferenceSectionFromLayout` serializa somente overrides normalizados e diferentes do catálogo.
- `gridPreferenceSectionsEqual` inclui `columnTitles` para deduplicação.
- `SaveGridPreferencesRequest` valida o mapa (máximo de 80 IDs, IDs no formato já aceito, strings até 120 caracteres).
- `GridPreferencesMerge::sanitizeSection` repete normalização, allowlist e regra de coluna configurável usando o catálogo backend.
- O módulo compartilhado resolve o título efetivo; as 34 instâncias consumidoras não implementam merge ou persistência próprias.
- Catálogo/frontend e catálogo/backend continuam sendo as autoridades de autorização. Nunca se infere coluna a partir do payload.

### Variantes de preferência

`preferencesGridId` continua isolando variantes como Curva ABC por tipo. Títulos e layout não vazam entre variantes. O backend deve resolver cada chave efetiva de preferência para o catálogo autorizado da variante antes de sanear; o fallback atual sem catálogo é proibido para save, importação e aplicação em massa.

### Testes mínimos derivados

- seção legada sem títulos;
- override válido, duplicado e preservado após mudança do default;
- vazio/igual ao default remove override;
- trim, quebra de linha, controle e limite Unicode;
- ID desconhecido/removido/não autorizado/técnico descartado;
- coluna nova recebe default;
- variante `preferencesGridId` usa allowlist correta e permanece isolada;
- igualdade/deduplicação percebe mudança de título sem gerar gravação quando normalização produz a seção já persistida.

Não foi criado ADR: a mudança é opcional, compatível e reversível dentro do contrato já estabelecido de preferências.
