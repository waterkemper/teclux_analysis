# Prompt para /speckit.specify — Remediação integral do tema escuro Laravel

/speckit.specify

Crie uma nova especificação de remediação pós-entrega para concluir corretamente o tema escuro da plataforma Laravel/ERP tecLUX. A infraestrutura central existe, mas a migração visual foi encerrada prematuramente: há ilhas claras, textos sem contraste, componentes compartilhados físicos e famílias inteiras não tematizadas.

A especificação deve ser autocontida, implementável e verificável por outra sessão. Não implemente código durante o `/speckit.specify`, não execute a remediação e não marque a feature anterior como suficiente apenas porque seus checkboxes estão concluídos.

## Objetivo

Especificar a correção de toda a interface Laravel tematizável, exceto relatórios, preservando o tema claro e as três paletas escuras existentes na mesma árvore de componentes. Ao final da futura implementação, não poderá restar papel, texto, borda, foco ou estado de chrome com cor física não classificada, nem superfície incluída sem prova visual real e contraste WCAG 2.2 AA.

“Sistema todo” significa toda superfície interativa renderizada pelo frontend Laravel: autenticação, `/welcome`, dashboard, hubs, navegação, administração, configurações, todos os cadastros, consultas, operações, grids, filtros, modais, drawers, lookups, toasts, estados e componentes compartilhados. Não significa alterar backend ou regras funcionais.

## Escopo negativo obrigatório

Exclua integralmente relatórios: telas de filtros/consulta pertencentes a famílias `Relatorio`, `Relatorios` ou `reports`, visualizações, previews, impressão, PDF, recibos, documentos gerados e seus CSS/Blade. A exclusão vale mesmo quando esses arquivos estiverem dentro de uma família incluída. Descubra-os e registre-os no manifesto como `excluído: relatório`; não os altere e não os ignore silenciosamente.

Também não autorize:

- mudanças em backend, banco, migrations, regras de negócio, permissões, atalhos, contratos HTTP/Inertia ou semântica operacional;
- duplicação de páginas/componentes para Claro e Escuro;
- remapeamento global de `white`, `black`, `slate`, `stone`, `gray`, `red`, `amber` ou outras escalas físicas;
- estratégia global baseada em `dark:`, seletores com `!important` ou branches condicionais por tema;
- redesenho da identidade tecLUX, remoção do Claro ou alteração de impressão para acompanhar a tela;
- declarar sucesso com amostragem de páginas, herança presumida, checklist histórico ou teste que apenas altere atributos do `documentElement`.

## Fontes obrigatórias

Inspecione o checkout atual antes de escrever a especificação e cite arquivos concretos. Use como evidência inicial:

- `/mnt/c/teclux_analysis/modules/shared/tema-escuro-laravel/01-speckit-prompt.md`;
- `docs/adr/491-erp-semantic-theme-tokens.md`;
- `specs/491-erp-dark-theme/spec.md`, `plan.md`, `tasks.md` e `contracts/`;
- `docs/erp-ui/theme-exceptions.md`;
- `/mnt/c/teclux_analysis/.scratch/tema-escuro-laravel-wayfinder/issues/07-auditar-implementacao-e-contraste-pos-entrega.md`;
- `/mnt/c/teclux_analysis/.scratch/tema-escuro-laravel-wayfinder/images/cadastro_de_produtos.png`;
- `/mnt/c/teclux_analysis/.scratch/tema-escuro-laravel-wayfinder/images/inventario.png`;
- `/mnt/c/teclux_analysis/.scratch/tema-escuro-laravel-wayfinder/images/ligarparaclientes.png`;
- `/mnt/c/teclux_analysis/.scratch/tema-escuro-laravel-remediacao-wayfinder/artifacts/01-inventario-superficie-tematizavel.md`;
- as decisões resolvidas em `.scratch/tema-escuro-laravel-remediacao-wayfinder/issues/`.

Classifique descobertas como `CONFIRMADO`, `INFERIDO`, `DÚVIDA`, `NÃO LOCALIZADO`, `DIVERGENTE` ou `POSSÍVEL BUG ATUAL`, sempre com caminho e evidência. Recalcule inventários no checkout atual; números abaixo são baseline de 2026-09-13 e qualquer diferença deve ser explicada, não ocultada.

## Baseline que a especificação deve enfrentar

No commit auditado `2e078019f` da branch `491-erp-dark-theme`, fora de relatórios:

- existem 2.048 arquivos-fonte incluídos e 159 componentes Inertia únicos;
- há 12.994 candidatos de cor em 758 arquivos: 9.074 utilitários físicos, 3.316 aliases físicos `teclux-*` e 604 literais;
- 730 dos 758 arquivos candidatos e 11.916 candidatos não foram tocados pelo commit;
- `Pages/Cadastros/Estoque` concentra 2.808 candidatos; também há grandes volumes em Components, Vendas, Marketplaces, Admin, Interlojas, Contas a Pagar, Cobrança SAC, Entregas, Financeiro e configurações;
- `text-teclux-secondary` e `text-teclux-neutral` continuam ligados a `#4a4a4a` e `#333333`; sobre `#182329`, medem aproximadamente `1,81:1` e `1,27:1`;
- o guardrail atual cobre somente 14 arquivos e quatro padrões;
- `appearanceSmokeMatrix.test.ts` não monta nem navega por tela alguma.

As três capturas provam defeitos diferentes:

- Cadastro de Produtos: fieldsets translúcidos claros, inputs brancos, metade inferior clara e textos físicos sem contraste;
- Inventário: painel principal escuro, mas barra de comando e controles compartilhados claros;
- Ligar para Clientes: conteúdo quase integralmente branco dentro do shell escuro e família não tocada pelo commit.

Exija investigação explícita de `ErpCadastroShell`, `ErpCadastroCommandBar`, `RomaneioNumeroInput`, Cadastro de Produtos e `Pages/Cadastros/CobrancaSac/LigarClientes`. Não limite a correção a essas superfícies.

## Arquitetura existente que deve ser preservada

Preserve, salvo bug comprovado, o bootstrap pré-React, a preferência `teclux-erp-theme-preference-v1`, o provider/controlador global, a flag de runtime `teclux.appearance_enabled`, `data-theme`, `data-palette`, `color-scheme` e os IDs:

- `graphite-turquoise`;
- `petrol-cyan`;
- `warm-graphite-amber`.

Claro e as três paletas escuras usam a mesma árvore e os tokens semânticos `--erp-*` do ADR 491. A remediação deve aprofundar esse contrato, não criar outro sistema de tema.

## Contrato de correção semântica

Proíba `teclux-primary`, `teclux-secondary`, `teclux-neutral` e outros aliases físicos no chrome adaptável. Migre papéis, textos, bordas e estados para tokens `--erp-*` e utilitários Tailwind semânticos.

Inclua normal, hover, pressed, foco, seleção, sucesso, alerta, erro, informação, loading, readonly e disabled. `disabled` e `readonly` não podem depender apenas de `opacity`; foco/seleção não podem usar `ring-offset-white`. Transparência não adapta cor física: restrinja opacidade a scrims, overlays e efeitos decorativos definidos.

Corrija em profundidade o seam e todos os consumidores capazes de sobrescrevê-lo por `className`, variante ou estilo inline. Proíba que consumidores reintroduzam `white`, `black`, `stone`, `slate`, `gray`, `teclux-*` físico ou literal de chrome. Corrigir o default do componente não torna automaticamente seus consumidores migrados.

Um seam só termina quando não possui candidato não classificado, todas as variantes foram verificadas, as quatro aparências passaram, consumidores representativos foram renderizados e não há ilha clara ou regressão no Claro.

## Ordem obrigatória dos seams

1. Tokens `--erp-*`, aliases e variantes semânticas.
2. `AppLayout` e superfícies estruturais.
3. `Button`, `Input`, `SelectField`, labels, validação e demais primitives.
4. `ErpCadastroShell`, barras de comando/operação e `RomaneioNumeroInput`.
5. Modais, drawers, lookups e toasts.
6. Filtros, shells de consulta e grids.
7. Sobrescritas remanescentes nas páginas consumidoras.

Considere explicitamente os multiplicadores identificados: `Button`, `Input`, `AppLayout`, `CatalogCodeLookup`, `CatalogStringCodeLookup`, `ErpCadastroShell`, `ErpCadastroCommandBar`, `ErpConsultaOperationBar`, `ConsultaFilterSection`, `FormSection`, `DataGrid`, `SelectField`, `ErpDraggableDialog` e `ErpGridShell`.

## Grafo de lotes da futura implementação

Defina dependências e gates, não uma tarefa por tela.

### Lote-base

Corrija tokens, estruturas, primitives e seams na ordem acima. Depois execute um gate-piloto obrigatório em Cadastro de Produtos, Inventário e Ligar para Clientes. Nenhum lote consumidor é liberado antes de essas três superfícies passarem no Claro e nas três paletas escuras, sem ilhas claras ou contraste indevido.

### Lotes consumidores

1. Autenticação, `/welcome`, dashboard, hubs e navegação.
2. Administração e configuração: `Admin`, `SystemParameters`, `Configuracoes`, usuários, filiais e grupos.
3. Cadastros gerais: clientes, endereços, bancos, serviços e todos os demais cadastros menores.
4. Estoque e compras: todo `Pages/Cadastros/Estoque` e `Pages/Estoque`, exceto relatórios.
5. Vendas e comercial: `Pages/Vendas` e `Pages/Cadastros/Vendas`.
6. Financeiro e cobrança: `Financeiro`, `Caixa`, `ContasPagar` e `CobrancaSac`, exceto relatórios.
7. Marketplaces.
8. Interlojas e entregas.
9. Componentes auxiliares e superfícies residuais ainda não atribuídos.

Famílias independentes podem avançar em paralelo após o lote-base. Cada arquivo, rota e superfície tem um único lote proprietário no manifesto. Se uma família encontrar defeito compartilhado, corrija a origem compartilhada e revalide todos os lotes aprovados que a consomem; não contorne apenas a página local e não transfira dívida ao lote seguinte.

## Manifesto integral de cobertura

A especificação deve definir um manifesto versionado, gerado/reconciliado com descoberta automática, contendo no mínimo arquivo, rota/componente Inertia, lote, tipo de superfície, autenticação/permissão/fixture, estados, aparências, viewports, resultado e exclusão/impedimento.

Descubra `resources/js/Pages`, `Components`, `Layouts`, CSS/Blade aplicáveis e valores de `Inertia::render(...)`. Toda rota e superfície incluída deve ser aberta nas quatro aparências; não há aprovação por amostragem. Estados de componentes podem usar casos representativos somente quando todas as variantes estiverem cobertas. Superfície inacessível por dados, permissão ou ambiente permanece impedida e impede o aceite do lote.

O manifesto deve incluir relatórios como excluídos e falhar se surgir arquivo tematizável sem lote, arquivo incluído sem scan, rota sem caso visual, exclusão não autorizada ou entrada obsoleta de allowlist.

## Exceções permitidas e revogadas

Use allowlist estruturada e fechada; não aceite marcador inline genérico como licença ampla. Cada entrada informa caminho e ocorrência/padrão exatos, categoria, justificativa, aparências verificadas e evidência de contraste quando aplicável.

- `resources/js/Pages/Welcome.tsx` e `/welcome` estão incluídos e devem ser tematizados.
- `resources/views/welcome.blade.php`, sem uso de rota encontrado, é scaffold órfão: registre fora da matriz, sem tematizar nem remover nesta feature.
- `Pages/Prototype/**` é local-only e fica fora da matriz de produção se continuar restrito a `APP_ENV=local`, com CSS isolado e sem remap global. Componentes de produção reutilizados continuam incluídos.
- Foto, logo/glifo e composição de marca do login não são invertidos. Overlay/texto fixos exigem contraste medido sobre a imagem nos dois viewports; formulário e chrome do login são tematizados.
- Fotos de produto, swatches e logos preservam cor real; seus containers, placeholders e controles são tematizados. Swatches exigem nome textual, seleção e borda visível.
- SVGs de interface usam `currentColor`/token; SVGs de marca ou dado exigem allowlist específica.
- Somente séries de gráficos podem usar paleta fixa central. Fundo, eixos, grades, títulos, legendas e tooltips são semânticos; séries não dependem só da cor.
- Revogue a exceção ampla de `.ficha-*`, `.contrato-*` e situações de grids. Estados operacionais usam tokens adaptáveis mantendo significado e legenda.
- Preserve valor/conversão TColor como dado. Cor exata só aparece como amostra ou indicador pequeno, com texto, contorno adaptável, contraste e allowlist; nunca como papel amplo.

Exceção de dado nunca libera o chrome ao redor.

## Guardrail estático obrigatório

Substitua `THEME_STRICT_SCAN_RELATIVE_PATHS` fixo por descoberta automática e reconciliação com o manifesto. O scan deve cobrir fundos, textos, bordas, rings, offsets, outlines, dividers, placeholders, gradientes, `fill`, `stroke`, aliases `teclux-*`, `dark:` e literais hex/rgb/hsl.

Use como baseline reproduzível, ampliando quando necessário:

```text
\b(bg|text|border|ring|ring-offset|outline|divide|placeholder|from|via|to|fill|stroke)-(white|black|slate|gray|stone|zinc|neutral|red|orange|amber|yellow|lime|green|emerald|teal|cyan|sky|blue|indigo|violet|purple|fuchsia|pink|rose)(-[0-9]{2,3})?(/[0-9]{1,3})?\b
\b(bg|text|border|ring|outline|fill|stroke)-teclux-(primary|secondary|tertiary|neutral)(/[0-9]{1,3})?\b
(?<![A-Za-z0-9_])#[0-9A-Fa-f]{3,8}\b|\b(rgb|rgba|hsl|hsla)\s*\(
```

Todo match deve ser migrado ou classificado precisamente. Zero candidato não classificado é condição de aceite, não meta opcional.

## Matriz visual em navegador real

Use Puppeteer, já instalado, para navegar pelas rotas reais com sessão, permissões e dados determinísticos. Montagem isolada serve apenas para estados/variantes e nunca substitui a página real.

Para cada superfície incluída, capture:

- Claro;
- Escuro `graphite-turquoise`;
- Escuro `petrol-cyan`;
- Escuro `warm-graphite-amber`;
- viewport desktop operacional, adotando `1440x900` como padrão;
- viewport estreito, adotando `390x844` como padrão;
- estado normal, mais estados representativos necessários para cobrir hover, foco, seleção, erro, loading, readonly, disabled, modal, drawer e toast.

Permita dimensões alternativas somente se a especificação registrar a justificativa e mantiver pelo menos um desktop e um estreito. Dados dinâmicos podem ser mascarados, mas a região deve permanecer visível e a máscara deve constar no manifesto.

Nomeie evidências por lote, superfície, aparência, viewport e estado, por exemplo `evidence/theme/<lote>/<superficie>/<aparencia>/<viewport>/<estado>.png`. Acompanhe por manifesto JSON ou Markdown com rota/fixture, commit, aparência, viewport, estado, contraste, exceções e impedimentos.

As três imagens da auditoria são evidência de defeito, não baseline aprovada. Crie baselines somente após aceite visual e de contraste. Diferenças futuras falham até revisão explícita; proíba atualização automática de snapshots. Máscaras e tolerâncias exigem justificativa.

## WCAG 2.2 AA

Meça no navegador a cor computada e o fundo efetivamente composto, inclusive transparências. Falhe abaixo de:

- `4,5:1` para texto normal;
- `3:1` para texto grande;
- `3:1` para controles, bordas significativas, foco e gráficos necessários à compreensão.

Exija foco visível e não encoberto, teclado sem armadilha, retorno de foco em modal/drawer, nenhum estado comunicado apenas por cor, reduced motion e semântica ARIA já contratada pela feature 491. Gradientes, imagens e casos não mensuráveis automaticamente exigem revisão visual registrada.

## Execução e comandos reproduzíveis

Defina scripts com interfaces estáveis, por exemplo:

```powershell
cd backend
npm run test:theme:static
npm run test:theme:visual -- --lot <lote>
npm run test:theme:visual:full
npm test
npm run build
```

Em toda alteração, execute scan integral, testes unitários e matriz do lote afetado. Mudança em seam exige matriz dos consumidores impactados. Antes da conclusão, execute a matriz completa de todas as superfícies nas quatro aparências e dois viewports, `npm test` e `npm run build`. Execução agendada pode repetir, mas não substituir o gate final.

Registre que, na auditoria, Vitest falhou antes da coleta por resolução do `setup.ts` através da junction `C:\teclux_cloud`, e o build falhou por ausência de `zxing_reader.wasm` no `node_modules`. Trate-os como impedimentos ambientais a reproduzir/corrigir, não como aprovação nem como regressão de tema presumida.

Inclua comandos para atualizar inventário, reconciliar rotas e inspecionar cobertura do diff, como `rg`, descoberta de `Inertia::render(...)` e `git diff --name-only main...HEAD`.

## Gate de conclusão por lote

Um lote somente termina com:

1. manifesto atualizado de todos os arquivos, rotas e superfícies;
2. scan sem candidato físico não classificado;
3. todas as superfícies abertas nas quatro aparências e dois viewports;
4. estados/variantes cobertos;
5. contraste e revisão visual aprovados;
6. capturas e manifesto de evidências armazenados;
7. allowlist fechada, sem entrada obsoleta;
8. testes relacionados e build aprovados;
9. zero impedimento oculto e zero dívida transferida.

Se qualquer item falhar, o lote permanece incompleto. Outros lotes independentes podem continuar, mas a remediação integral não pode ser declarada concluída.

## Entregáveis do /speckit.specify

A saída deve conter:

1. diagnóstico atualizado e divergências em relação ao inventário baseline;
2. escopo positivo integral e lista precisa das exclusões de relatório;
3. contrato de tokens e correção dos seams;
4. inventário/manifesto de arquivos, rotas, superfícies e consumidores;
5. grafo de lotes, dependências, gate-piloto e critérios de conclusão;
6. política de exceções e schema da allowlist;
7. desenho do guardrail autodiscoverável;
8. arquitetura da suíte Puppeteer e das fixtures/sessões;
9. matriz de quatro aparências, dois viewports, estados e WCAG;
10. formato e localização das evidências/baselines;
11. comandos reproduzíveis, testes, build e tratamento de impedimentos;
12. riscos, rollback e condições explícitas para não declarar sucesso parcial;
13. decomposição da futura implementação por seam e família, com dependências, sem uma tarefa por tela.

Não encerre a especificação com “telas representativas” como substituto da cobertura integral. Toda superfície incluída deve ter proprietário, caso visual e resultado verificável. Não implemente durante o `/speckit.specify`.
