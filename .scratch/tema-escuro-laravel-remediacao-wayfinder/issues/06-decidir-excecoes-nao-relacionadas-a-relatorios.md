# Decidir exceções não relacionadas a relatórios

Type: grilling
Status: resolved
Blocked by: 01

## Question

Quais superfícies e cores físicas fora de relatórios podem permanecer como exceção legítima, e quais devem ser tematizadas apesar da allowlist histórica?

Decidir explicitamente o tratamento de `welcome.blade.php`, rota `Welcome`, rotas `Pages/Prototype`, foto/overlay do login, fotos e swatches de produto, logos/SVGs, gráficos e cores de situação/paridade Delphi em grids operacionais. Cada exceção deve ter caminho, motivo, fallback textual quando transmitir estado e regra verificável; papel físico do chrome nunca pode ser liberado por uma exceção de dado.

## Answer

A allowlist histórica deve ser reduzida a exceções de conteúdo visual ou dado real, nunca a papel, texto, borda ou estado do chrome adaptável. Toda exceção fica no manifesto e na allowlist estruturada com caminho, ocorrência, categoria, justificativa, aparências verificadas e evidência aplicável.

### Welcome

- `resources/js/Pages/Welcome.tsx` é uma superfície ativa da rota pública `/welcome`; deve ser tematizada e incluída na matriz visual.
- `resources/views/welcome.blade.php` não possui referência de rota encontrada; classificar como scaffold órfão, fora da matriz, sem tematizar nem remover neste esforço.

### Protótipos locais

`resources/js/Pages/Prototype/**` fica fora da matriz de produção porque suas rotas são registradas somente em `APP_ENV=local`. Pode manter estilos experimentais próprios apenas se o CSS permanecer isolado, sem remapear classes globais ou tokens de produção, e se a exceção constar no manifesto. Componentes de produção reutilizados por protótipos continuam sujeitos ao contrato de tema.

### Login e identidade visual

A foto `/assets/login-building.jpg`, o logotipo/glifo e o painel de marca do login podem preservar a composição fixa, sem recoloração ou `filter: invert`. Overlay e texto branco podem permanecer fixos porque compõem identidade independente da paleta, desde que o contraste seja medido sobre a imagem nos dois viewports. Formulário, campos, alertas, links, foco e demais fundos do login devem usar tokens semânticos nas quatro aparências.

### Fotos, swatches, logos e SVGs

- Fotos de produto, amostras de cor e logotipos preservam suas cores reais.
- Molduras, placeholders, fundos, botões e controles ao redor são chrome e devem ser tematizados.
- Swatches exigem nome textual, indicador de seleção e borda visível em todas as aparências.
- Ícones SVG de interface usam `currentColor` ou token semântico.
- SVGs de marca ou representação de dado podem manter cor fixa mediante allowlist específica.

### Gráficos

Cores fixas são permitidas somente nas séries, definidas em uma paleta de dados central. Fundo, eixos, grades, títulos, legendas e tooltips usam tokens semânticos. Séries devem ter contraste suficiente e não depender apenas de cor: incluir rótulo, padrão, forma ou marcador quando necessário. Proibir cores arbitrárias declaradas diretamente em cada gráfico.

### Situações operacionais e paridade Delphi

Remover a exceção ampla de `.ficha-*`, `.contrato-*` e cores de situação em grids. Estados como atrasado, pago, cancelado e reservado preservam significado e legenda, mas usam tokens semânticos adaptáveis. “Paridade Delphi” não autoriza papel nem texto físico no chrome.

Uma cor Delphi exata pode permanecer somente como indicador pequeno de dado, com rótulo textual, borda adaptável, contraste verificado e allowlist específica; nunca como fundo amplo de linha, célula ou painel.

### TColor como dado

Preservar a conversão e o valor TColor em vendas e editores de parâmetros, pois são dados legados reais. A amostra/editoração da cor exata deve vir acompanhada do valor ou significado textual e contorno adaptável. Quando TColor sinalizar situação em vendas ou grids, aplicar a regra de indicador pequeno e acessível, sem transformá-lo em papel da interface.

Fora desses casos e da exclusão já confirmada de relatórios, toda superfície e toda cor de chrome permanecem no escopo da tematização e dos guardrails.
