# Diagnóstico arquitetural e de segurança da Plataforma Laravel

Label: wayfinder:map
Status: resolved

## Destination

Produzir um diagnóstico geral, baseado no código real, da Plataforma Laravel — estrutura, segurança, padrões de projeto, modernidade arquitetural, dados, operações e qualidade — e chegar a um roadmap priorizado de riscos, decisões e melhorias, sem implementar as mudanças neste esforço.

## Notes

- Contexto principal: Plataforma Laravel em `laravel/`, com backend em `laravel/backend/` e convivência com o legado Delphi/PostgreSQL.
- Usar o vocabulário de `CONTEXT.md` e `laravel/CONTEXT.md`; destacar qualquer conflito entre código, documentação e domínio.
- Consultar `docs/adr/` e os ADRs/contextos relevantes antes de propor decisões.
- Usar `/research` para fatos verificáveis no código e na documentação oficial; usar `/grilling` e `/domain-modeling` para decisões de alvo, prioridade e vocabulário.
- Planejamento apenas: este mapa produz evidências, decisões e roadmap; não implementa correções.
- A avaliação deve distinguir: evidência encontrada, risco/impacto, recomendação e confiança da conclusão.
- Segurança inclui autenticação, autorização contextual, escopo por Filial, segredos, dados sensíveis, entrada/saída, integrações, auditoria e supply chain.

## Decisions so far

- A subinvestigacao 01 confirmou divergencias concretas entre compose e deploy dos workers fiscais, runtime documentado PHP 8.3/8.5, rotas previstas por modulo e o web.php monolitico, alem de acoplamento entre camadas.

- [Avaliar filas, integrações assíncronas, observabilidade e resiliência](issues/06-avaliar-assincrono-observabilidade-e-resiliencia.md) — Há bons fundamentos de Horizon, scheduler, outboxes e reconciliação, mas consumidores fiscais ausentes no Compose, timeout heavy incompatível com o F6, claim fiscal não atômico, sweeps sem agendamento e telemetria fiscal parcial deixam riscos altos de indisponibilidade, duplicidade e diagnóstico.

<!-- Closed ticket decisions are indexed here; detail remains in the ticket. -->

- [Avaliar dados, transacoes, concorrencia e integridade](issues/04-avaliar-dados-transacoes-e-integridade.md) - Foram encontrados riscos altos em migration de backfill nao retomavel, QueryException dentro de transacao PostgreSQL abortada, projecao TRF fail-open e ausencia de garantias relacionais/append-only; ha bons controles de lock/CAS, idempotencia financeira e TX1/rede/TX2 fiscal, mas o gitlink raiz nao acompanha o HEAD do submodulo Laravel.

- [Mapear fronteiras arquiteturais e padrões de projeto](issues/03-mapear-fronteiras-arquiteturais-e-padroes.md) — Arquitetura híbrida: ports/adapters, Commands/DTOs, policies, idempotência, outbox e anti-corruption layer são reais em fatias novas, mas Services e Support são transversais; Domain/Application/HTTP ainda vazam Infrastructure, Models, DB, Jobs e apresentação. Controllers/FormRequests grandes e múltiplos clientes HTTP no frontend reduzem a coerência global.

- [Auditar superficie web, dados e integracoes externas](issues/05-auditar-superficie-web-dados-e-integracoes.md) - Webhooks CSRF-exempt sem autenticacao de origem; testes SMTP com host arbitrario e TLS desabilitado; upload de suporte sem scan/ownership forte; sink HTML cru em email de orcamento; cobertura inconsistente de rate limit e erros. Controles positivos: CSRF contextual, policies, allowlists de filtros, cliente WSDL e alertas assinados.

- [Inventariar topologia, runtime e dependências da Plataforma Laravel](issues/01-inventariar-topologia-runtime-e-de-dependencias.md) — Plataforma modular Laravel 13/PHP 8.5 com frontend Inertia/React, workers Horizon separados e atenção pendente a fronteiras entre camadas, superfície de rotas e reprodutibilidade Docker.
- [Avaliar autenticação, autorização e proteção de segredos](issues/02-avaliar-autenticacao-autorizacao-e-segredos.md) — Controles fortes de sessão, hashing, lockout, escopo e prova contextual; lacunas demonstráveis em troca de senha, permissão nominal sensível, revogação de reautorização, granularidade de Policies, webhooks e log bruto; produção depende de secure cookie, Redis, proxies e secret manager.
- [Avaliar testes, supply chain e processo de entrega](issues/07-avaliar-testes-supply-chain-e-entrega.md) — Há suíte extensa e deploy versionado com health checks, mas o CI visível só publica imagens e não demonstra gates de testes/segurança; tags mutáveis e scanner ausente permanecem pontos de atenção.

## Not yet specified

- Nenhum item pendente para este diagnóstico; a execução das mudanças está fora do escopo deste mapa.

## Out of scope

- Implementar correções, refatorações, upgrades de dependências ou mudanças de infraestrutura.
- Auditoria de penetração, certificação formal, parecer jurídico ou garantia de conformidade.
- Revisão detalhada de cada módulo funcional; módulos serão usados como amostra representativa e para riscos transversais.
- Redesenhar o domínio funcional do ERP já documentado, salvo quando necessário para esclarecer um risco arquitetural.


- Atualização da subinvestigação 02: controles fortes de sessão, hashing, lockout, escopo e provas contextuais; lacunas demonstráveis em troca de senha, permissão nominal sensível, revogação de reautorização, granularidade de Policies, webhooks e log bruto; produção depende de secure cookie, Redis, proxies e secret manager. Ver [ticket 02](issues/02-avaliar-autenticacao-autorizacao-e-segredos.md).

- Decisão HITL: a arquitetura-alvo será um monólito modular endurecido, com fronteiras explícitas entre contextos/camadas e camada anticorrupção para o legado Delphi/PostgreSQL/Cloud; não há migração imediata para microsserviços.

- Decisão HITL: a Fase 1 do roadmap priorizará redução de risco e capacidade operacional — segurança de entradas/integrações, filas fiscais, transações, integridade, deploy e gates de entrega — antes da grande refatoração de `Services` e `Support`.

- Decisão HITL: após a Fase 1, o contexto Fiscal/Operacional será o primeiro piloto de modularização, aproveitando seus Commands/Handlers, ports, outboxes, read models e integrações isoláveis.

- Decisão HITL: cada nova fatia deverá respeitar `HTTP -> Application -> Domain`, usar portas/adapters para banco/filas/integrações e ser protegida por testes de arquitetura/análise estática no CI; exceções legadas serão explícitas e temporárias.

- [Definir arquitetura-alvo e roadmap priorizado](issues/08-definir-arquitetura-alvo-e-roadmap-priorizado.md) — Monólito modular endurecido, Fase 1 focada em risco operacional e segurança, piloto Fiscal/Operacional e migração incremental com contratos de dependência verificáveis. O ticket contém o roadmap P0–P3 e os critérios de conclusão.
