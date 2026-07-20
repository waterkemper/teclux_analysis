Type: task
Status: resolved
Blocked by: 24

## Question

No schema PostgreSQL efetivamente usado pelo Laravel, quais `_log_new` e triggers cobrem cabeçalho, produtos, serviços, lotes, séries, parcelas, impostos e contatos do Contrato; quais são chaves, formato de `dados`, autoria/correlação, operações e lacunas?

Produzir matriz verificável origem → trigger → log → chave do Contrato → operações/payload, sem migration nem alteração no banco.

## Resolution

### Método e alcance

- `CONFIRMADO` — o inventário foi executado no PostgreSQL efetivamente configurado pelo container `teclux_cloud-php-1`, consultando somente `information_schema` e `pg_get_functiondef` dentro de `BEGIN`, `SET TRANSACTION READ ONLY` e `ROLLBACK`.
- `CONFIRMADO` — nenhuma tabela de negócio foi lida ou alterada. O script reproduzível está em `../schema-audit-readonly.php` e não contém credenciais.
- `CONFIRMADO` — a conexão direta pelo host é recusada pelo `pg_hba.conf`; a rota autorizada é o container PHP. Isso é detalhe operacional, não requisito do produto.

### Matriz física confirmada

| Origem | Trigger `_log_new` | Log | Chave copiada | Operações |
|---|---|---|---|---|
| `contratos` | `trg_contratos_audit_log_new` | `contratos_log_new` | `numero` | `INSERT`, `UPDATE`, `DELETE` |
| `produtoscontratos` | `trg_produtoscontratos_audit_log_new` | `produtoscontratos_log_new` | `contrato`, `produto`, `filial` | `INSERT`, `UPDATE`, `DELETE` |
| `produtoscontratoslotes` | `trg_produtoscontratoslotes_audit_log_new` | `produtoscontratoslotes_log_new` | `contrato`, `produto`, `filial`, `lote` | `INSERT`, `UPDATE`, `DELETE` |
| `produtoscontratosseries` | `trg_produtoscontratosseries_audit_log_new` | `produtoscontratosseries_log_new` | `contrato`, `produto`, `filial`, `numeroserie` | `INSERT`, `UPDATE`, `DELETE` |
| `servicoscontratos` | `trg_servicoscontratos_audit_log_new` | `servicoscontratos_log_new` | `contrato`, `servico` | `INSERT`, `UPDATE`, `DELETE` |
| `parcelas` | `trg_parcelas_audit_log_new` | `parcelas_log_new` | `contrato`, `numero` | `INSERT`, `UPDATE`, `DELETE` |
| `impostosretidoscontratos` | `trg_impostosretidoscontratos_audit_log_new` | `impostosretidoscontratos_log_new` | `contrato`, `impostoretido`, `aplicacao` | `INSERT`, `UPDATE`, `DELETE` |
| `contatos` | `trg_contatos_audit_log_new` | `contatos_log_new` | `numero` | `INSERT`, `UPDATE`, `DELETE` |
| `contatosvfornecedores` | `trg_contatosvfornecedores_audit_log_new` | `contatosvfornecedores_log_new` | `codigo`, `codigovfornecedores`, `tipovfornecedores` | `INSERT`, `UPDATE`, `DELETE` |

- `CONFIRMADO` — todas as origens do núcleo do Contrato possuem também trigger `replicacao_set_timestamps_fn()` para `created_at/updated_at` em inclusão/alteração.
- `CONFIRMADO` — `contratos`, `parcelas` e `produtoscontratos` mantêm simultaneamente os logs legados (`contratos_log`, `parcelas_log`, `produtoscontratos_log`) e os novos `_log_new`. A coexistência deve deduplicar por fonte, não presumir que ambos tenham o mesmo identificador.
- `CONFIRMADO` — há outras triggers de negócio nas origens, antes/depois das operações. A auditoria `_log_new` é `AFTER`, portanto fotografa o resultado já transformado pelas triggers `BEFORE` e registra também efeitos produzidos por gravações Delphi ou externas.

### Formato uniforme do log

Todas as nove tabelas inspecionadas seguem o mesmo envelope físico, acrescido das colunas da chave:

| Campo | Tipo/semântica |
|---|---|
| `log_id` | `bigint`, identificador do evento técnico |
| colunas da chave | cópia textual/numérica da identidade informada no trigger |
| `trigger_mode` | `INSERT`, `UPDATE` ou `DELETE` |
| `trigger_tuple` | `new`, `diff` ou `old` |
| `trigger_changed` | `timestamp with time zone` |
| `trigger_user_db` | usuário PostgreSQL |
| `app_user_id/login/name` | ator Laravel obtido do contexto da sessão |
| `app_source` | origem, como aplicação web ou alteração externa |
| `request_id` | correlação da requisição técnica |
| `filial_codigo_ref` | filial do contexto da sessão |
| `dados` | `jsonb`, obrigatório |

- `CONFIRMADO` — em `INSERT`, `dados` contém o snapshot completo de `NEW` e `trigger_tuple='new'`; em `DELETE`, snapshot de `OLD` e tuple `old`.
- `CONFIRMADO` — em `UPDATE`, `dados` contém somente campos alterados no formato `{campo: {old: valor, new: valor}}` e tuple `diff`. Atualização sem diferença relevante não gera log.
- `CONFIRMADO` — `created_at`, `updated_at` e `cloud_row_version` são explicitamente ignorados no diff, evitando ruído técnico.
- `CONFIRMADO` — a função obtém autoria de `app.user_id`, `app.user_login`, `app.user_name`, `app.source`, `app.request_id` e `app.filial_codigo`; quando ausentes, conserva `CURRENT_USER` e metadados nulos.
- `CONFIRMADO` — valores do diff são convertidos para texto antes do JSON; presenters devem conhecer tipo/formatação do campo original para datas, booleanos, números e valores monetários.

### Cobertura de contatos

- `CONFIRMADO` — existem logs novos para `contatos` e `contatosvfornecedores`, ambos com cobertura integral das três operações.
- `CONFIRMADO` — o Cadastro Delphi consulta `contatosvfornecedores` pelo Cliente/tipo, não por número do Contrato: `delphi/apps/vendas/dmcadastrocontratos.dfm:9603-9711`.
- `DIVERGENTE` — `contatosvfornecedores_log_new` identifica o contato mestre (`codigo`, Cliente/Fornecedor e tipo), mas não possui chave `contrato`. Ele não pode ser agregado automaticamente à timeline como fotografia do Contrato.
- `DECISÃO NOVA` — alterações do contato mestre aparecem na timeline do Cliente. A timeline do Contrato mostra apenas o vínculo/fotografia que a futura implementação persistir explicitamente; não deve reconstruir retroativamente qual contato mestre valia na venda sem evidência.
- `DÚVIDA` — a tabela física destinada à fotografia de contatos do novo Cadastro de Contratos ainda será escolhida no spec de relacionamento. Ao criá-la/reutilizá-la, deverá possuir chave do Contrato e trigger `_log_new` equivalente.

### Lacunas confirmadas para a timeline

- `CONFIRMADO` — as `_log_new` não possuem `correlation_id`, `causation_id`, `event_type`, `revision`, autorizador nem vínculo direto a Atendimento, fiscal, reserva, entrega ou outbox.
- `DECISÃO NOVA` — `request_id` agrupa diffs de uma mesma requisição Laravel, mas não substitui `correlation_id`: retries, consumidores assíncronos e consequências posteriores precisam do envelope de eventos de domínio definido em “Definir projeção de auditoria e integrações do Contrato”.
- `DECISÃO NOVA` — operador vem do contexto do trigger; autorizador permanece no evento de autorização sensível/domínio. Não duplicar nem inserir credencial/proof em `dados`.
- `DECISÃO NOVA` — alterações feitas pelo Delphi não terão contexto de aplicação completo; devem aparecer com `trigger_user_db`/logs legados e classificação de origem externa, sem autoria inventada.
- `DECISÃO NOVA` — número de série está na própria chave e no snapshot. Sua exibição exige a política de mascaramento definida para a timeline, embora o dado bruto continue necessário à auditoria restrita.

### Consequências para leitura e índices

- `DECISÃO NOVA` — o repositório de auditoria do Contrato fará leitura `UNION ALL`/agregação sobre as sete `_log_new` do núcleo, filtrando diretamente pela coluna `numero` ou `contrato`, e apresentará `origem` tipada.
- `DECISÃO NOVA` — `contratos_log` e `parcelas_log` continuam disponíveis como histórico legado; `_log_new` é a fonte preferencial para novas alterações. A fronteira temporal/deduplicação deve ser explícita e testada.
- `INFERIDO` — consultas paginadas eficientes exigirão índices iniciando pela chave do Contrato e terminando em `trigger_changed DESC, log_id DESC`. A existência e adequação desses índices não foi objeto da consulta atual e deve ser verificada no spec/implementação antes de qualquer migration.
- `DECISÃO NOVA` — ausência de índice é questão de desempenho, não motivo para alterar o schema neste workspace.

## Spec boundary

O bloqueio físico foi removido. “Definir projeção de auditoria e integrações do Contrato” está pronto para `$to-spec`, incluindo as sete fontes `_log_new` confirmadas, convivência com `contratos_log`/`parcelas_log`, eventos de domínio correlacionados e contatos tratados somente quando houver fotografia própria do Contrato.

Este ticket não requer spec separado: sua matriz é evidência de entrada do spec de auditoria e integrações.
