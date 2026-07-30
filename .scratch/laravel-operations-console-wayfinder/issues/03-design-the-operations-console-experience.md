# Design the Operations Console experience

Type: prototype
Status: resolved
Blocked by: 01, 02

## Question

What information architecture and interaction design lets an Administrator understand system health, investigate a problem, and perform guarded recovery actions without exposing unsafe framework internals?

## Comments

- Protótipo HITL: [OperationsConsolePrototype.tsx](../../../laravel/backend/resources/js/Pages/Prototype/OperationsConsolePrototype.tsx), rota local /prototype/operations-console?variant=A (variantes A/B/C). Build chegou à transformação Vite; verificação completa bloqueada por dependência preexistente ausente @tanstack/react-virtual.

## Answer

Adotar a variante **A — Central de saúde** como página inicial, incorporando a fila de decisões da variante **C — Caixa de entrada** como seção primária de exceções. Preservar a variante **B — Mapa operacional** como visão secundária de diagnóstico técnico.

- Cabeçalho sempre identifica ambiente e atualização dos dados.
- Resumo de saúde conduz a alertas e pendências acionáveis, não a métricas decorativas.
- Selecionar uma pendência abre detalhe sanitizado, tentativas, linha do tempo e ações permitidas.
- Filas, Processadores, Tarefas, Programações, Histórico e Auditoria ficam em visões secundárias.
- Ações destrutivas usam fluxo separado com impacto, motivo, frase digitada e reautenticação.
- Toda a experiência e microcópia são em português brasileiro.
