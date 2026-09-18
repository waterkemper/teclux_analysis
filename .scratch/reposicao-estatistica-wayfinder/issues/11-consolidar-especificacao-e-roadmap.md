# Consolidar especificação e roadmap implementável

Type: task
Status: resolved
Blocked by: 01, 02, 03, 04, 09, 10

## Answer

O handoff foi consolidado em [modules/estoque/reposicao-estatistica/README.md](../../../modules/estoque/reposicao-estatistica/README.md), com nove prompts sequenciais para Speckit:

1. fundação, domínio e canais;
2. dataset canônico e qualidade;
3. motor estatístico e incerteza;
4. política de estoque e lead time;
5. rede, alocação e residual;
6. execução, snapshots e idempotência;
7. revisão na Variante A — Bancada de decisão;
8. backtest, rollout, monitoramento e rollback;
9. aceite integrado, documentação e handoff.

O pacote preserva a separação entre previsão, política, alocação e workflow. Transferência usa primeiro o estoque do grupo; compra atende somente o residual. ECC continua responsável pela revalidação e pedidosfiliais pela efetivação. A primeira entrega é Laravel-only, assíncrona, fotografada, auditável e com aprovação humana.

Ficam explicitamente fora da primeira entrega worker Python, vendas perdidas, embalagens/múltiplos, autoaprovação, retreinamento automático, defaults específicos de cliente e alterações em Delphi. A seleção definitiva de modelo, limites e parâmetros de desempenho depende da medição em uma base representativa do cliente, já documentada no relatório de qualidade.

## Question

Como consolidar as evidências e decisões em uma especificação única, com modelo de domínio, contratos de dados, políticas, arquitetura, telas, segurança, observabilidade, plano de piloto, critérios de aceite e prompts Speckit fatiados em incrementos implementáveis?

O documento final deve distinguir o que é reutilizado do ECC, o que é novo, o que permanece específico por cliente e quais decisões ainda exigem confirmação antes de codificar.
