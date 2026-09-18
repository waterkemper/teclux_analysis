# Prototipar o fluxo do login adaptativo

Type: prototype
Status: resolved
Blocked by: 03, 05, 06

## Question

Como o login existente deve apresentar os estados confiável, envio em andamento, código enviado, reenvio bloqueado, código inválido/expirado, e-mail ausente e falha operacional, mantendo acessibilidade, comportamento responsivo, mensagens seguras e retorno claro ao formulário inicial?

## Comments

- Protótipo descartável para avaliação humana: `/prototype/login-adaptativo`.
- Artefato: `laravel/backend/resources/js/Pages/Prototype/LoginAdaptativoPrototype.tsx`; rota disponível somente no ambiente `local`.
- A barra inferior alterna as variações A/B/C e todos os estados, preservando `?variant=&state=` para compartilhar uma visão específica. No campo de código, `123456` simula sucesso.
- Validação técnica parcial: bundle isolado com esbuild e sintaxe de `routes/web.php` aprovados. O build global permanece bloqueado por configuração preexistente do WASM apontando para `C:\teclux_cloud\backend`; o TypeScript global possui erros preexistentes, sem ocorrência neste arquivo.
- Avaliação humana concluída; a decisão validada abaixo substitui as alternativas exploratórias.
- Reação humana (2026-09-15): escolhida a opção A, condicionada à observância estrita das diretivas de layout, cores e fontes do ERP, incluindo os tokens `--erp-*` e seus utilitários semânticos.
- Refinamento aplicado ao artefato antes do encerramento: mesmo shell e proporções do login atual, `font-sans`/Instrument Sans, componentes compartilhados `Button` e `Input`, e aliases semânticos de superfície, conteúdo, borda, ação e status. Bundle isolado aprovado.

## Answer

Adotar a **opção A — passo focado** como continuação visual direta do login existente. A Verificação Adicional ocupa a mesma coluna do formulário, preserva o painel institucional em desktop e sua versão compacta no celular, identifica “Etapa 2 de 2” e mantém uma única ação principal evidente.

O contrato visual é normativo:

- herdar a tipografia oficial `Instrument Sans` por `font-sans`, sem fonte paralela;
- reutilizar `AuthLayout`, `LoginBrandPanel`, `Button`, `Input` e o padrão de alerta de autenticação;
- usar os utilitários semânticos ligados a `--erp-*` — `surface-*`, `content-*`, `border-*`, `action-*` e `status-*` — para os papéis da interface;
- reservar `teclux-*` à marca/overlay institucional quando já previsto pelo login; não introduzir cinzas `slate-*`/`gray-*`, branco ou hex como papéis visuais da tela;
- comunicar informação, sucesso, aviso e erro por texto/categoria além da cor, mantendo contraste, foco visível, `aria-live` e layout responsivo;
- preservar o contexto: usuário, senha e Filial já foram validados, mas a sessão ainda não existe enquanto o Login Pendente não for consumido.

As opções B e C não seguem para a especificação.
