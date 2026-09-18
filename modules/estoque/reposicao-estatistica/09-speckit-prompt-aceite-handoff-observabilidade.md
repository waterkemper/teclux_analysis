# Prompt 09 — Aceite integrado, documentação e handoff

## Prompt para /speckit.specify

/speckit.specify

Feche a primeira entrega da Reposição Estatística com testes, documentação e observabilidade. Inspecione todos os prompts anteriores, o mapa Wayfinder e as implementações reais do ECC antes de criar critérios finais.

Cubra testes unitários, integração e aceitação para:

- filtros e componentes de estoque configuráveis por cliente;
- dataset e gate de qualidade;
- produtos inativol e foralinhal nos dois canais;
- vendas perdidas fora da primeira entrega e devoluções conforme Consulta de Compras;
- baselines, ETS, SBA/TSB, regressão, KNN por analogia e Monte Carlo para incerteza;
- fallback por baixa amostra, falha e confiança;
- mínimo/máximo, lead time, estoque de segurança e posição;
- transferência antes de compra residual;
- concentração, fontes concentradoras e alocação multifonte;
- snapshot, idempotência, retry e concorrência;
- tela Bancada de decisão;
- edição, justificativa, aprovação, gerente e revalidação ECC;
- modo sombra, piloto, métricas, circuit breaker e rollback;
- criação final de pedidosfiliais somente após confirmação.

Validar migrations, índices, constraints e consultas contra PostgreSQL 9.5/9.6. Documentar operação, permissões, alertas, retenção, anonimização, recuperação de falhas, modo sombra, piloto, promoção e rollback. Registrar claramente o que depende de uma base de cliente e não criar dados/defaults de demonstração como configuração produtiva.

O handoff deve separar o que é novo, o que é reutilizado do ECC, o que permanece específico por cliente e o que está fora da primeira entrega. Não alterar Delphi nesta fase.

## Aceite

- [ ] Suite cobre os dois canais sem duplicar necessidade.
- [ ] Testes verificam fallback e fail-safe.
- [ ] PostgreSQL 9.5/9.6 é suportado.
- [ ] Observabilidade e auditoria permitem reproduzir cada decisão.
- [ ] Documentação operacional está no local convencional do projeto.
- [ ] Não há defaults específicos de cliente.
- [ ] Primeira entrega mantém aprovação humana e fluxo existente.
- [ ] Handoff identifica pendências de medição em base representativa.
