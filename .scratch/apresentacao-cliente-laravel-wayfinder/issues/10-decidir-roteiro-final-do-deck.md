# Decidir estrutura e roteiro final do deck

Type: grilling
Status: resolved
Blocked by: 01, 02, 03, 04, 05, 06, 07, 09

## Question

Com todo o conteúdo das tickets anteriores em mãos, qual a ordem final das seções, a narrativa de abertura/fechamento, o tom, e a densidade aproximada (quantas telas/seções) do deck, calibrados para uma reunião ao vivo de ~30-45min com donos/gestores do cliente final? Fechar o roteiro seção a seção antes de produzir o artefato.

## Answer

Roteiro final confirmado, calibrado para reunião ao vivo de ~30-45min, deck genérico (sem nome de cliente específico — personalização fica a cargo de quem apresenta):

1. **Abertura** — título tecLUX Cloud, tagline, contexto rápido do que será mostrado.
2. **Estrutura e módulos já liberados** — panorama técnico leve (React + Laravel + PostgreSQL compartilhado com o Delphi) seguido do mapa de módulos por domínio (ticket 01: Cadastros, Estoque, Contas a Pagar, Cobrança e SAC, Vendas, Interlojas, Entregas, Financeiro, Marketplaces, Administração — dez domínios desde o adendo de 2026-08-06).
3. **Vantagens e diferenças operacionais vs Delphi** — vantagens de fundo (sem instalação, atualização automática, mesmo banco) + exemplos concretos por domínio (ticket 02).
4. **Uso mobile** — acesso via navegador de qualquer aparelho, com a ressalva honesta sobre grids densas (ticket 07).
5. **Documentação e suporte já disponíveis** — 85 guias de usuário + 45 runbooks de suporte (ticket 03).
6. **Fluxo Help → ticket** — como reportar um problema, sem prometer que já está recebendo chamados em produção (ticket 04).
7. **IA** — bloco único cobrindo processo (menção genérica, sem citar ferramenta), resolução ágil de demandas (sem prazo/SLA) e produto (Busca Assistida já ativa) (ticket 09).
8. **Roadmap: como vai funcionar o Caixa** — comportamento esperado, sem termos internos nem prazo (ticket 05).
9. **Roadmap: como vai funcionar NFe/NFC-e** — comportamento esperado, sem termos internos nem prazo (ticket 06).
10. **Fechamento** — síntese rápida do que foi mostrado + convite a dúvidas/próximos passos, sem compromisso de data.

Lógica da ordem: abre mostrando o que já existe e funciona (estrutura, vantagens, mobile), constrói confiança (documentação, suporte, help, IA) e fecha olhando para frente (o que está vindo), terminando em convite ao diálogo em vez de uma lista de pendências.
