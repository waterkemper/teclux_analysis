Type: task
Status: resolved
Blocked by: 03

## Question

Como consolidar o inventário e a decisão de UX em um dossiê e prompt SpecKit autocontido para corrigir somente colunas, presets, atalhos e operações da Ficha de Produtos Laravel, sem mandar o agente investigar Delphi e sem regredir filtros, queries ou a grade existente?

## Answer

Consolidação publicada em [`../dossie.md`](../dossie.md). O documento transforma os levantamentos e decisões em contrato verificável e autocontido: delimita a correção à grade/operações do Laravel existente, define catálogo e visão padrão, grupos por botões sem atalhos, ordem canônica imutável, preferências temporárias/permanentes, busca e exportação server-side, AuthZ financeira end-to-end, comportamentos proibidos, critérios de aceite e testes.

O dossiê proíbe o futuro executor de acessar ou investigar Delphi, orienta inspeção somente do Laravel para localizar peças concretas e lista explicitamente tudo que deve permanecer sem regressão. O próximo passo é usar `$to-spec` no dossiê para gerar `modules/estoque/ficha-produtos/10-speckit-prompt-correcao-grade-operacoes.md`.
