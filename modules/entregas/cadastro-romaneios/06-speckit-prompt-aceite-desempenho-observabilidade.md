# Prompt para /speckit.specify — aceite, desempenho e observabilidade

```text
/speckit.specify

Crie a especificação técnica transversal de verificação, desempenho e observabilidade do Cadastro de Romaneios, sexta e última spec. Feche as specs 01–05 sem criar funcionalidade. Transforme a matriz autoritativa em testes, gates, baselines, eventos, métricas e alertas.

Não implemente. Inspecione a infraestrutura Laravel de testes PostgreSQL, query listener, logs estruturados, correlação, SensitiveDataRedactor, métricas e alertas; cite arquivos. Leia integralmente, em modules/entregas/cadastro-romaneios/: aceite-testes-observabilidade.md, schema/README.md, modelo-dominio-coexistencia-transacoes.md, consulta-f6-sql-performance-cancelamento.md, seguranca-menu-parametros.md e as specs produzidas pelos prompts 01–05.

## Gates

- Suíte PostgreSQL real compatível com 9.5.25 bloqueia merge/release. Skip por indisponibilidade não aprova.
- SQLite cobre unidade/feature rápida, mas não substitui functions, triggers, sequences, SQL_ASCII, FOR UPDATE, concorrência, transação ou pg_cancel_backend.
- Divergência crítica de autorização, estado, financeiro, atomicidade, idempotência ou paridade bloqueia aceite.
- Rollout, feature flag e plano de retorno estão fora do escopo.

## Matriz automatizada

Mapeie requisitos→testes→evidências para:

- Normal/Transferência; criar/alterar/excluir; zero/um/muitos Itens; estados/guards;
- Item unitário/lote, Nota/Cupom, NF-e, scanner e Auto Incluir;
- agenda, RPS/ROS, recebimento, liberação, retenção, justificativa e histórico;
- financeiro off/on/inválido, uma Duplicata, proteção autorizada/paga;
- F6 com filtros, vazio, paginação, sort, exportação, cancelamento e resposta tardia;
- menu/capability/Filiais/admin/usuário comum/provas e acesso direto a cada rota;
- grids, preferências, atalhos, foco, dirty/busy, modais, relatórios e acessibilidade.

## PostgreSQL, concorrência e falhas

- Testar functions, triggers e sequences; schema incompatível falha com diagnóstico/checksum.
- Concorrência Laravel–Laravel e Delphi-equivalente–Laravel comprova locks, revisão e ausência de lost update.
- Mesma idempotência/payload reproduz; payload diferente conflita.
- Injetar falha após mestre, itens, agenda/conferência, situação, auditoria e financeiro. Nenhum registro parcial, Duplicata órfã ou idempotência presa.
- Cobrir deadlock/lock timeout e rollback nos dois sentidos Romaneio–Contas a Pagar.
- Cancelar F6 imediatamente e em cada fase, confirmando no PostgreSQL que o backend correto saiu; cobrir cancelamento duplicado/alheio, corrida e falha do endpoint.

## N+1 e desempenho

Instrumente contagem de queries para cardinalidades diferentes; deve ser limitada e independente das linhas. Falhe diante de relação/parâmetro/autorização/enriquecimento em loop.

Registre EXPLAIN (ANALYZE, BUFFERS) em volume representativo para consultas críticas, com plano, estimativas/reais, buffers, duração e dataset/checksum. Estabeleça orçamento pela baseline; não invente milissegundos. O gate considera regressão de plano, volume lido, duração e queries. Paginação/exportação não materializam o conjunto.

## Observabilidade

Especifique eventos estruturados de command/query started, succeeded, rejected, cancelled e failed, conflito, rollback, schema mismatch e efeito financeiro. Campos aplicáveis: request_id, trace_id, idempotência redigida, Romaneio, usuário, Filial, operação, estado anterior/novo, duração, linhas/queries, fase F6, eficácia do cancelamento e tipo de rollback.

Nunca registrar senha/prova, chave NF-e completa, binds SQL, sessão, Base64 ou payload financeiro sensível. Aplicar redator compartilhado.

Métricas: latência/taxa F6 por fase; queries/linhas; conflitos/deadlocks/timeouts/retries; rollbacks/falhas financeiras; schema mismatch; cancelamentos ineficazes. Alertas para schema, cancelamento falhando, timeouts anormais, conflitos crescentes, rollback financeiro e divergência Romaneio–Contas a Pagar. Limiares vêm de baseline observada.

## Saída esperada

Produza plano por camada, fixtures/builders, infraestrutura PostgreSQL, técnica de concorrência/falha injetada, catálogo de eventos/métricas, redação, dashboards/alertas aplicáveis e checklist de evidências. Cada teste aponta regra/spec de origem. Não implemente.

## Critérios de aceite

- [ ] Rastreabilidade requisito→teste→evidência completa.
- [ ] PostgreSQL obrigatório cobre schema, functions, triggers, locks, rollback e cancelamento.
- [ ] N+1 é detectado variando cardinalidade e medindo queries.
- [ ] Baselines usam EXPLAIN (ANALYZE, BUFFERS), sem orçamento arbitrário.
- [ ] Falhas/concorrência não deixam efeitos parciais.
- [ ] Endpoints/capabilities/Filiais/provas têm testes negativos.
- [ ] Eventos são correlacionáveis e dados sensíveis redigidos.
- [ ] Métricas/alertas cobrem cancelamento, conflitos, schema e financeiro.
- [ ] Evidências de aceite-testes-observabilidade.md compõem o gate final.

## Fora de escopo

- implementar ou corrigir funcionalidades das specs 01–05;
- definir rollout, feature flag ou plano de retorno;
- substituir a infraestrutura compartilhada de testes, logs ou métricas sem lacuna comprovada;
- aceitar skips PostgreSQL ou metas de desempenho arbitrárias como evidência.
```
