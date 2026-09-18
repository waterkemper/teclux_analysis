# Definir arquitetura-alvo e roadmap priorizado

Type: grilling
Status: resolved
Blocked by: 01, 02, 03, 04, 05, 06, 07

## Question

Com base nas investigações anteriores, qual arquitetura-alvo é adequada para a Plataforma Laravel, quais princípios e padrões devem ser mantidos ou simplificados, e como ordenar um roadmap de segurança, modernização e redução de risco por severidade, valor, esforço, dependências e reversibilidade?

## Answer

### Decisões confirmadas

- O alvo é um monólito modular endurecido; não haverá migração imediata para microsserviços.
- A Fase 1 priorizará redução de risco e capacidade operacional antes da grande refatoração de `Services` e `Support`.
- O contexto Fiscal/Operacional será o primeiro piloto de modularização, por concentrar riscos altos e já possuir Commands/Handlers, ports, outboxes, read models e integrações isoláveis.
- Cada nova fatia deverá respeitar `HTTP -> Application -> Domain`; banco, filas e integrações externas serão acessados por portas/adapters, com testes de arquitetura ou análise estática no CI. Exceções legadas devem ser explícitas, justificadas e temporárias.

### Arquitetura-alvo

Manter o Laravel como um único deploy modular, organizado por contexto funcional e não apenas por tipo técnico. Cada contexto novo deve separar:

- HTTP/apresentação: controllers finos, FormRequests declarativos e resources;
- Application: casos de uso, Commands, Handlers, DTOs e transações de aplicação;
- Domain: regras, invariantes, value objects e interfaces de portas;
- Infrastructure: persistência, clientes externos, filas, storage e adapters;
- ACL legada: tradução explícita para PostgreSQL/Delphi/Cloud.

O banco legado continua como fonte de verdade onde definido pelo ADR existente. Projeções, read models e outboxes são mecanismos de integração e consulta, não fontes concorrentes de verdade. A migração será incremental, por fatias verticais, com compatibilidade temporária e rollback operacional.

### Padrões a preservar

- Ports and adapters/anti-corruption layer nas integrações legadas e externas.
- Commands/Handlers e DTOs para casos de uso com orquestração relevante.
- Policies e autorização contextual por usuário, Filial e ação.
- Idempotência, CAS/revision, outbox, reconciliação, read models e jobs com IDs/correlation IDs.
- Health states, heartbeats, auditoria e entregas assinadas quando representarem garantias reais do negócio.

### Padrões a simplificar ou conter

- `Services` e `Support` devem ser compatibilidade existente, não destino arquitetural; novos códigos não devem ampliar esses catch-alls.
- Controllers, rotas e FormRequests grandes devem deixar de acessar diretamente DB, Models, Jobs e clientes HTTP.
- Evitar abstrações genéricas sem uma segunda implementação ou seam testável.
- Centralizar transporte externo e contratos frontend, reduzindo a mistura sem padrão de Inertia, Axios e `fetch`.
- Não usar eventos, filas ou repositórios como cerimônia universal; cada um deve oferecer desacoplamento, retry, idempotência, consistência ou substituibilidade observável.

### Roadmap priorizado

#### P0 — contenção de risco imediato

1. Fechar integrações: autenticação/assinatura de webhooks, validação de origem, rate limit consistente, controle de SSRF, allowlists de SMTP/URLs e TLS obrigatório.
2. Proteger dados: scan e ownership forte de uploads, sanitização de HTML em emails, mensagens de exceção sem detalhes internos e mascaramento de payloads/logs sensíveis.
3. Tornar a operação fiscal executável: alinhar filas, consumidores do Compose/deploy, supervisores, `timeout`, `retry_after` e locks.
4. Remodelar o outbox fiscal para claim/lease transacional, tentativas, backoff, reprocessamento e DLQ/reconciliação.
5. Corrigir integridade: migrations/backfills retomáveis, tratamento correto de exceções em transações PostgreSQL, TRF fail-closed e garantias relacionais/append-only onde exigidas.

#### P1 — entrega e observabilidade

1. Fazer o CI executar PHPUnit, Vitest, lint/format, análise estática aplicável, auditoria de dependências e scan de imagem antes de publicar.
2. Remover tags mutáveis ou registrar digests para imagens de runtime e validar a cadeia de instalação de Composer.
3. Formalizar `fila -> consumidor -> healthcheck -> métrica -> alerta -> runbook`, incluindo scheduler e sweeps fiscais.
4. Medir progresso real: último tick, último sweep, backlog, idade do item, falhas e DLQ; processo vivo sozinho não é healthcheck suficiente.
5. Revisar Redis, proxies, cookies, secret manager, SQL logging e redaction para evitar degradação silenciosa da segurança.

#### P2 — piloto Fiscal/Operacional

1. Definir contrato público, casos de uso, invariantes, estados de falha e ownership dos dados.
2. Mover uma fatia vertical completa para `HTTP -> Application -> Domain ports -> Infrastructure`, preservando a ACL legada.
3. Adicionar testes de contrato, concorrência, idempotência, retry, recovery e arquitetura; bloquear novos imports de Domain/Application para Infrastructure, DB, HTTP e Jobs.
4. Medir redução de acoplamento, tempo de diagnóstico, retries/duplicidades, cobertura de invariantes e substituibilidade do adapter.

#### P3 — expansão incremental

Aplicar o mesmo método a Marketplace, autenticação/autorização e demais contextos de maior risco. Só depois reduzir gradualmente `Services`/`Support`, dividir `routes/web.php`, consolidar clientes frontend e remover compatibilidade legada sem uso comprovado.

### Critérios e conclusão

O roadmap favorece primeiro mudanças de alto valor e alta reversibilidade: controles de entrada, configuração, gates, telemetria e contratos testáveis. Mudanças de dados e semântica fiscal exigem checkpoint, idempotência, reconciliação e rollback operacional. Refatorações estéticas ficam depois: o maior risco atual é a inconsistência entre padrões, deploy e garantias de runtime, não a ausência de padrões.

Conclusão: a plataforma possui modernidade arquitetural real em ilhas, mas maturidade global intermediária. O caminho recomendado é consolidar segurança e operação, usar Fiscal/Operacional como prova de fronteiras e expandir o monólito modular apenas quando as garantias forem automatizadas.
