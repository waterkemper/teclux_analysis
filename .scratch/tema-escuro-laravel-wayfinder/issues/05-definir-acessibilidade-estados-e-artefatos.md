# Definir acessibilidade, estados e artefatos não temáticos

Type: grilling
Status: resolved
Blocked by: 01, 03, 04

## Answer

Adotar WCAG 2.2 nível AA como baseline obrigatório para o tema Claro e para as três paletas Escuras. Texto normal deve atingir contraste mínimo de 4,5:1; texto grande, 3:1; controles, bordas significativas e gráficos necessários para compreensão, 3:1. Cada combinação de tokens deve ser validada por contraste, incluindo hover, pressed, disabled, focus, seleção, texto sobre estado e overlays.

Sucesso, atenção, erro, informação, seleção, disabled e busy usarão tokens semânticos adaptáveis. Nenhum estado poderá depender apenas da cor: deverá haver texto, ícone, rótulo, forma, posição ou anúncio acessível equivalente. Cores literais de paridade operacional, como legendas da Ficha Financeira, serão preservadas somente quando representarem significado de negócio; terão documentação e fallback textual.

SVGs e ícones próprios da interface devem usar currentColor ou tokens. Gráficos devem usar paleta semântica por série, com legenda ou rótulo além da cor. Fotos, logos e imagens de produto não receberão inversão ou filtro global. PDF, impressão, recibos e documentos gerados manterão estilos de saída independentes, normalmente claros, e não herdarão automaticamente o tema da tela.

O documento aplicará color-scheme: light no tema Claro e color-scheme: dark no tema Escuro, para que controles nativos acompanhem a apresentação ativa. prefers-reduced-motion: reduce deverá remover ou reduzir transições e animações não essenciais; indicadores de busy continuarão informando o processamento sem depender de animação contínua.

Todos os controles interativos terão foco visível e com contraste suficiente, sem ser encoberto por header, rail ou overlay. A navegação por teclado não poderá criar armadilhas; a ordem será previsível e o link de salto para o conteúdo será mantido. Modais e drawers deverão prender o foco, fechar com Escape e devolver o foco ao acionador. Hover não será requisito para descobrir ou operar uma função.

O feedback assíncrono usará aria-busy durante carregamento, aria-live=polite para atualizações normais e sucesso, aria-live=assertive somente para erros bloqueantes ou alertas críticos, e role=alert para erros de validação relevantes. Badges e indicadores terão nome textual ou alternativa anunciável.

O critério de aceite deverá exercitar o shell, menu, barra de operações, formulário denso, grid, lookup, modal, toast, busy, erro, sucesso e estados legados nas três paletas Escuras, além do padrão Claro. Impressão, documentos, imagens e artefatos legados serão verificados em suas próprias regras, sem simular tema por inversão.

## Question

Quais critérios garantem que o tema escuro continue legível e semanticamente correto em foco, disabled, busy, seleção, erro, atenção, sucesso, danger, tabelas, gráficos, SVGs, imagens e impressão?

Fechar contraste WCAG aplicável, foco visível, não dependência de cor, `color-scheme` de controles nativos, reduced motion, leitores de tela, estados de autorização e overlays. Separar o que deve adaptar, permanecer neutro ou preservar cor literal por regra de negócio/paridade (por exemplo, legendas de situação), sempre com fallback acessível.
