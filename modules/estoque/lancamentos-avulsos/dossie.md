# Dossiê — Migração Estoques → Lançamentos Avulsos

## 1. Finalidade e escopo

Fonte autocontida para especificar no Laravel o módulo **Estoques → Lançamentos Avulsos**. O executor não precisa acessar Delphi nem banco local para descobrir requisitos.

O módulo registra sincronamente uma intenção manual de estoque em `movimentos`. É inclusion-only: não oferece pesquisa para manutenção, edição, exclusão ou estorno genérico. Correção futura deverá ser novo movimento compensatório com Tipo explícito.

## 2. Regra arquitetural fundamental

`movimentos` é o livro cronológico por Produto + Filial; cada linha guarda o saldo posterior ao evento. `estoques` é a projeção corrente. Para Produto gerenciado por Lote, `movimentoslotes` é o livro derivado e `estoqueslotes` a projeção Produto + Filial + Lote.

O Laravel insere **somente um Movimento-raiz**. Triggers PostgreSQL atribuem número/ordem, carregam a operação do Tipo, calculam saldos/Financeiro, atualizam projeções e criam relacionados de transferência, composto, negativo e Lote. É proibido duplicar esses efeitos em PHP ou escrever diretamente em `estoques`, `estoqueslotes`, `movimentoslotes` ou filhos derivados.

## 3. Campos da intenção

- Produto, Filial, Tipo de Movimento e Data: obrigatórios.
- Quantidade decimal(11,3), não negativa, condicional à operação.
- Valor, Preço sem ICMS, Preço com ICMS e Valor da última compra: decimal(11,2), condicionais.
- Referência opcional, máximo 60.
- Filial destino obrigatória em transferência e diferente da origem.
- Lote obrigatório quando a característica gerencia lote/validade.
- operador vem da sessão; autorizador vem da prova sensível.
- UUID idempotente e token de preparação são controles obrigatórios.

Não aceitar do cliente: `numero`, `lancto`, `operacao`, saldos, Financeiro calculado, relações derivadas, usuários arbitrários, `comexcecaosenegativo`, `naoprocessartriggers` ou `naoprocessartriggersdepois`.

## 4. Tipo de Movimento e vetor `operacao`

Tipo elegível: existente, ativo, não interno, operação diferente de vinte `*` e vetor estruturalmente válido. O servidor relê o cadastro no POST; o browser envia apenas o código.

| Pos. | Efeito |
|---:|---|
| 1 | Em estoque |
| 2 | Reservado |
| 3 | Trânsito |
| 4 | Demonstração |
| 5 | Conserto |
| 6 | Futuro |
| 7 | Danificada |
| 8 | Estoque físico |
| 9 | Reserva prévia |
| 10 | Última entrada (`=`) |
| 11 | Última compra: data, quantidade, preços, IPI e valor |
| 12 | Financeiro |
| 13 | Última venda/agregado vendido |
| 14 | Compra/agregado comprado |
| 15 | reservado |
| 16 | Acabados |
| 17 | Semiacabados |
| 18–20 | reservados |

Para quantidades: `+` soma, `-` subtrai, `=` substitui e `*` não atua; a trigger usa a Quantidade absoluta. Financeiro também admite `C`, calculado pelo custo médio do banco. `TipoMovimentoOperacaoMapper` existente pode explicar/validar a configuração, mas não substituir as triggers.

## 5. Produto, Lote, transferência, composto e negativo

- Reutilizar `UserBranchAccessService`; validar origem e destino server-side.
- Exigir linha de Estoque coerente na origem e no destino nesta entrega.
- Produtos compostos dependem do parâmetro **“lançamentos avulsos de produtos compostos”**. As triggers geram componentes; Laravel não explode composição. Última compra não é editável para composto.
- Lupa/resolver de Lote são próprios do módulo, filtrados por Produto + Filial.
- Transferência gera contrapartida pela trigger; Laravel não grava saída e entrada separadamente.
- Se `quandoestoquenegativo` se aplica, a trigger pode manter Em estoque em zero e gerar compensação. Outros negativos protegidos abortam tudo. Não existe bypass livre de negativo.

## 6. Permissão e autorização

Criar middleware/Policy/module access próprios, com capabilities `canView` e `canCreate`; `canUpdate`, `canDelete` e `canReverse` são false.

Adicionar ao `SensitiveOperationAuthService` a ação `Estoque/lancamentos_avulsos_incluir`, perfil `gerenteestoque`, parâmetro **“Exigir Senha em Lançamentos Avulsos”**, sem reuso contextual automático. Operador não gerente exige Gerente; parâmetro ativo exige desafio também para gerente, admitindo senha própria pelo framework.

Persistir `usuariologado` da sessão e `usuarioautorizacao` da prova. Não criar abilities financeiras separadas nesta entrega: a autorização protege o lançamento inteiro.

## 7. Fluxo síncrono e interface

1. Abrir página com Filiais autorizadas e Data do servidor.
2. Escolher Filial, Produto, Tipo e campos condicionais.
3. Carregar contexto: valores/saldos atuais, eventual Lote e últimos dez movimentos.
4. `Preparar` valida sem escrever, interpreta Tipo e devolve resumo de efeitos.
5. Confirmar explicitamente redução, `=`, Financeiro/`C`, última compra, transferência ou composto.
6. Obter prova sensível quando exigida.
7. `Gravar` envia um POST síncrono; controles ficam bloqueados.
8. Sucesso somente após commit; recarregar projeções/histórico e gerar novo UUID.

Trocar Filial limpa Produto/Lote/destino/contexto; trocar Produto limpa Lote; qualquer mudança invalida preparação/prova. Não fazer dry-run com INSERT+ROLLBACK nem manter transação HTTP aberta aguardando confirmação.

## 8. Endpoints propostos

- `GET /cadastros/estoque/lancamentos-avulsos`
- GETs locais `lookup/resolve` para Produto, Tipo e Lote
- `GET .../contexto`
- `POST .../preparar`, sem escrita
- `POST .../lancamentos`, comando síncrono

Reutilizar o endpoint genérico de avaliação sensível, componentes `CatalogCodeLookup`/`ErpTwoColumnCatalogLookupModal`, contexto de auditoria e consultas de histórico. Endpoints de lookups são locais porque permissões e filtros dos cadastros genéricos são incompatíveis.

## 9. Data contábil

Backend calcula a data mínima pela Data Contábil ou `DiasNotaRetroativa`, fornece limites à UI e revalida com relógio do servidor. Rejeitar data menor ou igual ao fechamento. Data futura é proibida salvo regra sistêmica explícita.

## 10. Preparação

`preparar` valida acesso, Filiais, data, Produto, Tipo, Lote e campos; lê contexto; monta resumo humano e emite token curto vinculado a operador, payload e configuração. O token não reserva saldo. O POST final relê tudo; mudança de payload/Tipo/parâmetro retorna `409 preparation_stale`.

## 11. Idempotência

Persistir chave única `(operator_codigo, idempotency_key)`, hash do payload normalizado, status e `movimento_numero`. Mesma chave/hash concluída devolve o resultado (`replayed=true`) sem nova gravação/prova; mesma chave com outro payload retorna 409. Reserva, INSERT e conclusão ficam na mesma transação. Cache sozinho não basta. Após timeout, repetir a mesma chave, nunca gerar outra.

## 12. Transação, locks e auditoria

Uma `DB::transaction` curta engloba idempotência, `DatabaseAuditContext`, revalidações, prova, INSERT raiz, triggers, leitura mínima e conclusão. Não adquirir locks manuais fora da ordem das triggers; elas já usam `FOR UPDATE`. Falha reverte raiz, relacionados, Lotes, projeções e reserva.

Auditoria combina contexto `app.*`, operador/autorizador na raiz, audit triggers e eventos sensíveis. Logs estruturados usam request ID e nunca registram senha/prova.

## 13. Erros

Resposta uniforme: `code`, `message`, `field_errors`, `request_id`, `retryable`. Usar SQLSTATE e catálogo explícito de mensagens. Validação 422; acesso 403; preparação/prova/idempotência/contexto 409; timeout 503 retryable; falha estrutural/desconhecida 500. Não expor SQL/stack nem converter toda `QueryException` em validação.

## 14. Estado atual do Laravel e reuso

O módulo ainda não existe. Reutilizar:

- `UserBranchAccessService`;
- `SensitiveOperationAuthService` e modal/prova/auditoria;
- `DatabaseAuditContext`;
- `TipoMovimentoOperacaoMapper` e leitura de Tipos;
- componentes padronizados de lookup;
- `LegacyMovimentacaoDiariaRepository`/consulta somente para histórico;
- precedente trigger-aware da ADR `210-marketplace-legacy-order-trigger-aware-write.md`.

Criar comando/repositório próprios. Não chamar `LegacyMarketplaceOrderRepository`. SQLite não valida triggers; testes de integração PostgreSQL são obrigatórios.

## 15. Legado que não será reproduzido

- UPDATE de última compra sem Filial;
- lookup global de Filiais;
- validação negativa apenas na UI;
- `MAX()+1` em PostgreSQL;
- transação aberta esperando usuário;
- edição/exclusão herdadas do formulário;
- operação/saldos/bypasses vindos do cliente;
- escrita paralela às triggers;
- log SQL em arquivo local.

## 16. Critérios de aceite

1. Acesso, origem e destino são autorizados no servidor.
2. Tipo/Lote/Produto/composto/data são revalidados no POST.
3. Aplicação insere exatamente uma raiz e nenhum derivado/projeção.
4. Trigger falhando produz rollback total.
5. Mesmo UUID/payload produz um único Movimento; payload diferente conflita.
6. Autorização persiste operador/autorizador corretos.
7. Última compra afeta somente o contrato Produto + Filial da trigger.
8. Não existem editar/excluir/reverter nesta entrega.
9. Sucesso somente após commit e contexto relido.
10. PostgreSQL cobre `+`, `-`, `=`, `C`, negativo, transferência, composto, Lote, rollback, concorrência, idempotência e auditoria.
11. Teste arquitetural impede writes Laravel em projeções/derivados.

## 17. Fora do escopo

Alterar triggers ou Delphi; corrigir saldos existentes; migrar outros produtores de movimentos; criar estorno genérico; aceitar bypasses; implementar o módulo durante o levantamento.
