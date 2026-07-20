Type: task
Status: resolved
Blocked by: 03, 06, 12, 21
Unblocks: 25

## Question

Quais tabelas e triggers `_log_new` cobrem o agregado do Contrato, como correlacionar field diffs, transições, autorizações, compensações e eventos externos numa timeline única, e quais integrações exigem outbox/idempotência sem expor segredos?

Manter Atendimentos, documentos e entregas como eventos vinculados, não como simples alterações de campo.

## Resolution

### Fontes localizadas e lacuna física

- `CONFIRMADO` — o Delphi oferece “Histórico do Contrato” e “Log Parcelas” separadamente: `delphi/apps/vendas/fmcadastrocontratos.pas:4317-4335` e `fmcadastrocontratos.dfm:8811-8817`.
- `CONFIRMADO` — o histórico lê snapshots de `contratos_log`, ordenados por `trigger_changed/trigger_id`, com situação, valores, Cliente, entrega, alteração e cancelamento: `delphi/repositorio/fmvisualizarlogcontratos.dfm:184-312`.
- `CONFIRMADO` — existe `contratos_log_modified` para comparar snapshots, mas seu acionamento está comentado: `delphi/repositorio/fmvisualizarlogcontratos.dfm:53-137` e `fmvisualizarlogcontratos.pas:127-137`.
- `CONFIRMADO` — parcelas lê `parcelas_log` para a família `primogenito`, expondo modo, tuple, data, usuário e transação: `delphi/repositorio/fmvisualizarlogparcelas.dfm:258-290`, `:442-463`.
- `CONFIRMADO` — `LegacyParcelasLogRepository::listByContratoFamilia` e `ParcelasLogService` já reproduzem essa leitura no Laravel; o detalhe permanece no modal próprio.
- `NÃO LOCALIZADO` — não há no checkout migrations/repositories para `contratos_log_new`, `produtoscontratos_log_new`, `servicoscontratos_log_new` ou `parcelas_log_new`; há `_log_new` para Cliente, Usuário, Grupo e Produto.
- `DÚVIDA` — o banco operacional pode ter triggers não versionadas. Cobertura, chaves e payload devem ser consultados no `information_schema`; isso foi graduado para “Confirmar cobertura física das triggers de auditoria do Contrato”.

### Manifesto mínimo de cobertura

| Parte | Fonte mínima | Timeline |
|---|---|---|
| cabeçalho/fotografia do Cliente | `contratos` e log | diffs e transições |
| produtos | `produtoscontratos` | inclusão, alteração e remoção de linha |
| lotes/séries | `produtoscontratoslotes`, `produtoscontratosseries` | vínculo/desvínculo; série sujeita a máscara |
| serviços | `servicoscontratos` | inclusão, alteração e cancelamento |
| proposta/parcelas | `parcelas` e proposta | resumo; detalhe no Log Parcelas |
| impostos retidos | `impostosretidoscontratos` | seleção/valor agrupados ao comando |
| contatos fotografados | tabela física a confirmar | somente fotografia própria, não contato mestre |
| reserva/estoque | movimentos e reservas | evento vinculado quantitativo |
| agenda/logística | entidades logísticas | evento vinculado |
| fiscal/devolução | `dadosfiscais`, `notas`, `cupons`, `notaspag` e itens | evento vinculado por documento/item |
| Atendimento/questionário | entidades próprias | evento vinculado, sem copiar conteúdo ao log técnico |

- `CONFIRMADO` — o data module contém `produtoscontratos` (`dmcadastrocontratos.dfm:724-803`), `parcelas` (`:2867-3006`), `servicoscontratos` (`:6328-6558`), séries (`:12369-12424`), lotes (`:12995-12997`) e impostos (`:8225-8271`).
- `DECISÃO NOVA` — trigger protege contra mudanças de Laravel, Delphi, script ou integração; evento de domínio explica a intenção. Uma fonte não substitui a outra.

### Envelope e correlação

- `DECISÃO NOVA` — envelope comum: `event_id`, Contrato, instante, categoria/tipo/resumo, ator, autorizador, origem, filial, `request_id`, `correlation_id`, `causation_id`, entidade, revision, changes, links e `metadata_safe`.
- `DECISÃO NOVA` — `request_id` identifica requisição; `correlation_id` acompanha a operação e retries; `causation_id` liga consequência à causa. Nenhum contém PII, token ou texto livre.
- `CONFIRMADO` — `DatabaseAuditContext` já injeta usuário, origem, request id e filial na sessão PostgreSQL: `laravel/backend/app/Infrastructure/Database/Audit/DatabaseAuditContext.php:15-49`.
- `DIVERGENTE` — faltam correlation/causation, comando e autorizador. Acrescentar contexto ou correlacionar por evento de domínio gravado na mesma transação.
- `DECISÃO NOVA` — diffs do mesmo correlation id agrupam-se sob evento como “Contrato cancelado”, expansível por cabeçalho, parcelas, reserva e agenda. Mudança externa aparece como tal, com usuário do banco e `source=db.external`.
- `DECISÃO NOVA` — transições, gravação, autorização e compensações geram evento explícito; intenção não é deduzida apenas de `situacao`.

### Timeline única, fontes distintas

1. alterações do agregado: diffs `_log_new` e snapshots de inclusão/exclusão;
2. comandos: gravação, transição, cancelamento/reversão, conferência e cópia;
3. autorização: tentativa, aprovação/negação, operador e autorizador;
4. efeitos vinculados: reserva, parcela `E/Estornado`, Atendimento, questionário, fiscal, devolução, entrega, impressão, e-mail e integração.

- `CONFIRMADO` — `RegistryAuditTimeline` já suporta ator, origem, request id, resumo, changes, snapshots e paginação: `laravel/backend/resources/js/Components/erp/cadastro/RegistryAuditTimeline.tsx:67-111`.
- `DECISÃO NOVA` — reutilizar e generalizar essa apresentação; não criar timeline exclusiva. Log Parcelas, Atendimento, fiscal e entrega mantêm detalhe próprio, com resumo/link na timeline.
- `DECISÃO NOVA` — ordenar por instante, precedência causal e id estável; paginação por cursor composto sobre o feed unificado, não concatenação de páginas independentes.

### Autoria e segurança

- `CONFIRMADO` — `SensitiveOperationAuthAuditLogger` registra operador, autorizador, filial, ação, entidade, contexto, resultado e metadata e falha fechado: `laravel/backend/app/Services/Authorization/SensitiveOperationAuthAuditLogger.php:14-65`.
- `DECISÃO NOVA` — auditoria de segurança guarda tentativas; timeline funcional mostra apenas eventos do Contrato permitidos pela policy.
- `DECISÃO NOVA` — nunca persistir/exibir senha, hash, proof token, API/bearer key, SMTP/transportadora, payload fiscal integral, cartão/TEF, segredo iTeclux ou stack trace. `authorizer_login_attempt` não entra na timeline comum.
- `DECISÃO NOVA` — catálogo de campos define `public`, `masked`, `hidden`; desconhecido inicia `hidden`. PII, endereço, série e observações exigem máscara/permissão; financeiro respeita capability da Ficha.
- `DECISÃO NOVA` — timeline é append-only; correção cria evento. Retenção, exportação e leitura sensível têm policies próprias.

### Outbox e idempotência

| Consequência | Estratégia |
|---|---|
| Atendimento automático | outbox na transação; idempotência por correlação+tipo |
| e-mail Laravel | fila/outbox; chave por documento, revision, destinatários e template |
| site/iTeclux | inserção de saída como outbox, sem chamada dentro da gravação |
| fiscal futuro | outbox e máquina própria; retorno pelo documento/correlação |
| e-commerce/marketplace/webhook | outbox, snapshot mínimo, retry e dead-letter |
| anexos | operação idempotente; evento após confirmação, sem binário na outbox |
| impressão/PDF | resposta síncrona; evento de auditoria após sucesso |
| cotação de frete | consulta fora da transação com timeout; auditar seleção, não credenciais/payload bruto |
| questionário | comando do engine; só notificação externa usa outbox |
| trigger Cliente → Contrato | transação DB, `source=db.trigger`; sem republicar sem deduplicação |

- `CONFIRMADO` — `MarketplaceOutboxService` é precedente de chave, merge, retry e lock: `laravel/backend/app/Services/Marketplace/MarketplaceOutboxService.php:18-136`; não é tabela para Contratos.
- `DECISÃO NOVA` — `_log_new` não dispara outbox: perde intenção e duplica efeitos. Comando grava mudança, evento e outbox atomicamente; trigger é trilha independente.
- `DECISÃO NOVA` — outbox guarda referência/snapshot mínimo versionado, nunca segredo. Attempts têm resultado sanitizado; erro completo fica restrito.
- `DECISÃO NOVA` — situação, parcelas `E` e reserva são síncronos; somente efeitos externos ou projeções recuperáveis vão para outbox.

### Falhas e compatibilidade

- `DECISÃO NOVA` — auditoria sensível e evento de domínio falham fechado. Falha de projeção não bloqueia se evento/outbox persistiram.
- `DECISÃO NOVA` — legado sem request id é individual ou agrupado por `trigger_id`, tempo e usuário somente quando inequívoco; não fabricar correlation id.
- `INFERIDO` — `trigger_id` liga tuples `OLD/NEW`, como pressupõe `parcelas_log`; confirmar fisicamente no inventário.
- `DECISÃO NOVA` — coexistência combina logs legados/novos e deduplica por fonte+tabela+id, sem esconder mudanças Delphi.

## Spec boundary

Esta fatia **deve receber `$to-spec` próprio**, após “Confirmar cobertura física das triggers de auditoria do Contrato”. Cobrir envelope, agregador paginado, presenter seguro, correlação, eventos explícitos e outbox genérica.

Adapters de e-mail, fiscal, e-commerce e logística ficam em seus specs; aqui entram contrato de evento, idempotência, observabilidade e projeção.
