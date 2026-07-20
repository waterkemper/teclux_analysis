Type: task
Status: resolved
Blocked by:

## Question

Qual é o estado atual do Laravel para Lançamentos Avulsos e gravações em `movimentos`: rotas, páginas, Policies/abilities, acesso a Filiais, lookups de Produto/Tipo/Lote, services/repositories, transações, Auditoria, tratamento de erros PostgreSQL, idempotência e testes; e quais componentes existentes podem ser reutilizados sem duplicar a lógica das triggers?

## Answer

### Conclusão

O Laravel **não possui atualmente o módulo Estoques → Lançamentos Avulsos**, nem um comando genérico e seguro para inclusão manual em `movimentos`. Não foram encontrados rota, página Inertia/React, controller, FormRequest, Policy/ability, serviço de aplicação, repositório de escrita ou testes específicos. A única menção funcional é incidental, no filtro “Somente lançamentos avulsos” da especificação da Ficha de Produtos.

Existe uma base reaproveitável importante — Filiais, autorização sensível, auditoria PostgreSQL, Tipos de Movimento, lookups e consultas — mas ela precisa ser composta atrás de um **novo limite de comando**.

### Inventário do estado atual

| Área | Ativo atual | Reuso seguro | Lacuna/limite |
|---|---|---|---|
| Rota e tela | Nenhum módulo de Lançamentos Avulsos | Shell ERP e componentes de formulário/lookup | Criar rotas, controller, FormRequest, página e estado próprios |
| Consulta | `LegacyMovimentacaoDiariaRepository` e `MovimentacaoDiariaConsultaService` | Histórico/últimos movimentos e filtros | São read-only; não devem virar repositório de escrita |
| Escrita | `LegacyMarketplaceOrderRepository` insere movimento de contrato | Precedente de INSERT mínimo orientado a triggers | Específico de Marketplace; não cobre autorização, lotes, transferências ou idempotência |
| Tipo | `LegacyTiposMovimentosRepository`, `TipoMovimentoService`, `TipoMovimentoOperacaoMapper` | Leitura e interpretação das 20 posições | Lookup não aplica toda a elegibilidade Delphi; validação atual só cobre inexistente/inativo |
| Filiais | `UserBranchAccessService` | Opções, códigos e validação server-side | Validar origem e também destino de transferência |
| Autorização | `SensitiveOperationAuthService`, prova consumível, rate limit, cache e auditoria | Senha própria/terceiro e perfil `gerenteestoque` | Falta definição para Lançamentos Avulsos e seu parâmetro legado |
| Auditoria DB | `DatabaseAuditContext` com `SET LOCAL` | Ator, origem, request ID e Filial na transação | Não substitui os usuários do movimento nem o audit trigger |
| Erros SQL | Classificadores locais de `QueryException` | Padrão de tradução por SQLSTATE | Falta tradutor das triggers de estoque |
| Idempotência | Soluções específicas de outros domínios | Convenção de UUID e resultado repetível | Não existe mecanismo genérico para INSERT de movimento |
| Testes | Unit/feature dos ativos; writes legados sobretudo em SQLite | Validação/orquestração isolada | SQLite não executa triggers; precisa integração PostgreSQL |

### Precedente trigger-aware

`LegacyMarketplaceOrderRepository` monta registro enxuto e executa `DB::table('movimentos')->insert($row)`. Em PostgreSQL não usa `MAX(numero)+1`; esse fallback só existe para SQLite. A ADR `docs/adr/210-marketplace-legacy-order-trigger-aware-write.md` já fixa: alinhar INSERT ao schema/triggers, não atualizar `estoques` na aplicação, não introspectar schema em runtime, não usar `MAX()+1` no PostgreSQL, abortar tudo em qualquer falha e validar as triggers em PostgreSQL.

O princípio deve ser reutilizado, mas não o repositório de Marketplace. Lançamentos Avulsos precisa de adapter próprio que insira **somente o movimento-raiz** e leia de volta o resultado consolidado pelo banco.

### Tipos de Movimento

`TipoMovimentoOperacaoMapper` é reutilizável para explicar/testar as 20 posições. Já o lookup do cadastro não deve ser chamado diretamente: pertence à permissão de tabelas auxiliares, não filtra todas as proibições Delphi e `assertCanUseInNewMovimento()` não rejeita `interno = true` nem `operacao = '********************'`.

Deve existir provider/query do novo módulo filtrando ativo, não interno e operação diferente da sentinela. O cliente envia apenas o código; no comando o servidor relê `tiposmovimentos`. A string `operacao` nunca vem confiável do browser e as triggers permanecem autoridade final.

### Filial, Produto e Lote

Reutilizar `UserBranchAccessService`, validando novamente no POST tanto origem quanto destino. Reutilizar visualmente `CatalogCodeLookup`/`ErpTwoColumnCatalogLookupModal`, porém com endpoints contextuais do novo módulo:

- Produto existente/utilizável e coerente com a Filial;
- seleção direta por código passando pelo mesmo resolver da lupa;
- troca de Filial/Produto invalidando seleções dependentes;
- preços e saldos retornados apenas como contexto, nunca como valores confiáveis do INSERT;
- Lote filtrado e revalidado por Produto + Filial, condicionado a `gerenciarloteevalidade`.

Há leitura/manutenção de lotes no cadastro de Produtos, mas não um lookup pronto com esse contrato. Reutilizam-se modal e repositórios de leitura, não um endpoint de manutenção inadequadamente autorizado.

### Policy e autorização sensível

Criar ability/middleware e `LancamentosAvulsosModuleAccessService` próprios; não emprestar permissões de Movimentação Diária, Análise de Estoques ou Cadastro de Tipos.

Adicionar ao `SensitiveOperationAuthService` uma operação específica, vinculada ao parâmetro **“Exigir Senha em Lançamentos Avulsos”** e ao perfil `gerenteestoque`. A prova curta deve ser validada/consumida no servidor e vinculada a operador, Filial, módulo, ação e contexto. Persistir separadamente:

- `usuariologado`: operador autenticado;
- `usuarioautorizacao`: autorizador da prova válida, quando houver.

A auditoria das tentativas de autorização não substitui a auditoria do movimento.

### Transação e auditoria

Uma única `DB::transaction` deve abranger reserva idempotente, aplicação de `DatabaseAuditContext`, validações coerentes, consumo final da autorização, INSERT raiz e leitura mínima do resultado. Qualquer exceção das triggers reverte tudo.

Aplicar `DatabaseAuditContext::applyForWebRequest()` com ator, `web.erp`, request ID e Filial. A trilha combina contexto `app.*`, `usuariologado`, `usuarioautorizacao`, `trg_movimentos_audit_log_new` e evento de autorização.

Não manter transação HTTP aberta aguardando a confirmação de custo médio do Delphi. Qualquer prévia deve ocorrer antes do POST final, que será curto e atômico.

### Erros PostgreSQL

Criar tradutor específico na fronteira de aplicação. Regras conhecidas das triggers viram validação/conflito seguro; FK, unique e concorrência são classificados por SQLSTATE; falhas desconhecidas permanecem erro de servidor, registradas com request ID, sem expor SQL. Nunca capturar erro para continuar/confirmar parcialmente.

### Idempotência

A prova de autorização single-use não é idempotência. Repetir o INSERT reaplica o estoque. Exigir UUID por intenção e associação durável com unicidade, hash do payload e número do movimento. Mesma chave/payload retorna o resultado original; mesma chave/payload diferente retorna conflito. Reserva e INSERT ficam na mesma transação; cache isolado não basta.

### Resposta e testes

Após commit, recarregar do servidor saldos/projeções e últimos movimentos; não somar saldos localmente nem presumir movimentos derivados. A resposta identifica ao menos movimento-raiz e se foi resultado idempotente.

Testes necessários:

1. Unitários: elegibilidade, Produto/Filial/Lote, autorização, mapper, tradutor e idempotência.
2. Feature: Policy, Filiais de origem/destino, prova ausente/inválida/expirada/consumida e retries.
3. PostgreSQL real: `+`, `-`, `=`, `C`, transferência, composto, lote, negativo, rollback, auditoria, concorrência e repetição.
4. Regressão: nenhum caminho escreve diretamente em `estoques`, `estoqueslotes` ou movimentos derivados.

### Limite recomendado

Novo módulo = controller/FormRequest + Policy/module access + queries contextuais + comando transacional + repositório do movimento-raiz + idempotency store + tradutor PostgreSQL. Reutilizar Filiais, autorização sensível, auditoria, mapper, componentes de lookup e consultas de histórico. Não reutilizar permissões de outros módulos, o repositório de Marketplace ou a lógica das triggers em PHP.
