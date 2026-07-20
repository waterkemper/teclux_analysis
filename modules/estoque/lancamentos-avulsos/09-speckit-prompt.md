# Prompt para /speckit.specify

```text
/speckit.specify

Crie a especificação funcional completa e implementável para **Estoques → Lançamentos Avulsos** no ERP tecLUX Laravel.

## Regra fundamental sobre as fontes

Você não possui acesso ao Delphi nem à base PostgreSQL investigada e **não deve procurar, solicitar, citar ou depender deles**. Não crie tarefas de “analisar o legado”, “extrair triggers”, “validar no Delphi” ou “confirmar no banco”. O contrato abaixo é autoritativo e autocontido.

Investigue somente o Laravel atual para localizar nomes concretos e contratos de componentes, serviços, rotas, Policies, repositories, Parâmetros, lookups, Auditoria e testes que serão reutilizados. Essa inspeção serve para integração, não para redescobrir requisitos. Se houver divergência, registre-a e especifique a adaptação no Laravel.

Não faça nova entrevista. Não implemente agora. Gere requisitos numerados, cenários, entidades, contratos e critérios mensuráveis, distinguindo Permissão, Autorização e Auditoria.

## Objetivo e natureza

Criar página de comando **síncrona e inclusion-only** para registrar uma intenção manual de Estoque. Não é CRUD: não pesquisar movimentos para manutenção, editar, excluir ou estornar genericamente. Correção futura será Movimento compensatório com Tipo explícito e escopo próprio.

Sucesso só aparece depois que o Movimento-raiz, todas as triggers e o commit terminarem. Não usar job/fila para a gravação.

## Autoridade do banco

`movimentos` é o livro cronológico por Produto + Filial; cada linha contém o saldo posterior. `estoques` é sua projeção corrente. Para Produto gerenciado por Lote, `movimentoslotes` é livro derivado e `estoqueslotes` a projeção Produto + Filial + Lote.

O Laravel insere **exatamente um Movimento-raiz**. As triggers PostgreSQL:

- geram `numero` e `lancto`;
- carregam `operacao`, transferência e política de negativo de `tiposmovimentos`;
- bloqueiam a projeção com `FOR UPDATE`;
- calculam saldos e Financeiro;
- atualizam `estoques`;
- criam relacionados de transferência, componentes e compensação negativa;
- criam `movimentoslotes`, que atualiza `estoqueslotes`;
- recalculam o encadeamento cronológico e auditam.

Proíba writes Laravel em `estoques`, `estoqueslotes`, `movimentoslotes` e movimentos derivados. Proíba replicar cálculos das triggers em PHP.

## Entrada do comando

Aceite somente:

- Filial, Produto, Tipo de Movimento e Data obrigatórios;
- Quantidade decimal(11,3), não negativa e condicional;
- Valor, Preço sem ICMS, Preço com ICMS e Valor da última compra decimal(11,2), condicionais;
- Referência opcional até 60;
- Filial destino condicional;
- `loteproduto` condicional;
- UUID idempotente;
- token de preparação;
- prova de autorização condicional.

Operador vem da sessão; autorizador vem da prova. Nunca aceite do cliente `numero`, `lancto`, `operacao`, saldos, Financeiro calculado, `cmpmovimento`, `negmovimento`, `trfmovimento`, usuários arbitrários, `comexcecaosenegativo`, `naoprocessartriggers` ou `naoprocessartriggersdepois`.

## Tipo de Movimento e operação

Tipo elegível: existente, ativo, não interno, `operacao` diferente de `********************` e vetor válido. O backend relê no POST; o browser envia só o código.

Posições:

1 Em estoque; 2 Reservado; 3 Trânsito; 4 Demonstração; 5 Conserto; 6 Futuro; 7 Danificada; 8 Estoque físico; 9 Reserva prévia; 10 Última entrada; 11 Última compra; 12 Financeiro; 13 venda/Última venda; 14 compra; 15 reservado; 16 Acabados; 17 Semiacabados; 18–20 reservados.

Para quantidades, `+` soma, `-` subtrai, `=` substitui e `*` não atua; a trigger absolutiza Quantidade. Financeiro admite também `C`, calculado por custo médio. Posições 10/11 atuam com `=`. Reutilize `TipoMovimentoOperacaoMapper` para apresentação/validação estrutural, nunca para substituir a execução do banco.

Forma dinâmica:

- Quantidade é obrigatória quando o vetor a utiliza; em `+`/`-`, maior que zero.
- Valor/preços aparecem apenas quando Financeiro/última compra os utilizam.
- `C` não aceita Financeiro livre.
- Última compra só com posição 11 `=` e Produto não composto.
- Destino obrigatório em transferência.
- Lote obrigatório quando a característica gerencia lote.
- Campo incompatível deve ser rejeitado/ignorado de modo explícito, não persistido ambiguamente.

## Produto, Filiais, Lote, composto e negativo

Reutilize `UserBranchAccessService`. Limite lookups e revalide origem/destino no servidor; elas devem ser distintas. Exija Estoque existente nas duas nesta entrega, sem depender implicitamente de `INCLUIR ESTOQUE AUTOMATICO`.

Produto composto depende de **“lançamentos avulsos de produtos compostos”**. Triggers geram componentes; Laravel não explode composição. Última compra é proibida para composto.

Crie lookup/resolver local de Lote por Produto + Filial. Saldo agregado não substitui saldo de Lote.

Transferência: usuário declara destino; trigger cria contrapartida. Nunca grave manualmente saída + entrada.

Negativo: preparação pode alertar pelo snapshot, mas trigger decide após lock. Se o Tipo usa `quandoestoquenegativo`, pode criar compensação; outros negativos protegidos abortam tudo. Não ofereça bypass/checkbox para negativo.

## Data contábil

Backend calcula data mínima pela Data Contábil ou `DiasNotaRetroativa`, entrega limites à UI e revalida pelo servidor. Rejeite data menor ou igual ao fechamento. Proíba futura, salvo regra sistêmica explícita. Não confie somente no date picker.

## Permissão e autorização

Crie módulo/middleware/Policy próprios. Capabilities: `canView`, `canCreate`; fixe `canUpdate`, `canDelete`, `canReverse` false.

Adicione ao `SensitiveOperationAuthService` ação estável `Estoque/lancamentos_avulsos_incluir`, perfil `gerenteestoque`, parâmetro **“Exigir Senha em Lançamentos Avulsos”**, sem reuso contextual automático.

- operador não gerente exige autorizador Gerente;
- parâmetro ativo exige desafio também para gerente, permitindo senha própria conforme framework;
- prova liga operador, Filial, ação e contexto/payload;
- POST final valida/consome a prova;
- grave `usuariologado` e `usuarioautorizacao` separadamente.

Não invente abilities financeiras separadas: a autorização protege todo lançamento. Destaque e audite efeitos financeiros.

## Fluxo de interface

1. Abrir com Filiais autorizadas e Data do servidor.
2. Selecionar Filial, Produto, Tipo e campos condicionais.
3. Exibir Valores atuais, Quantidades do Produto, eventual Quantidade do Lote e últimos dez Movimentos.
4. Preparar sem escrita e mostrar resumo dos efeitos.
5. Exigir confirmação para redução, `=`, Financeiro/`C`, última compra, transferência ou composto.
6. Obter prova sensível quando exigida.
7. Gravar sincronamente, bloqueando controles/duplo clique.
8. Após commit, recarregar contexto, limpar intenção e gerar novo UUID.

Preserve como conveniência Filial, Tipo, Data e Referência após sucesso. Trocar Filial limpa Produto/Lote/destino/contexto; trocar Produto limpa Lote; qualquer mudança invalida preparação/prova.

Não faça dry-run por INSERT+ROLLBACK e não mantenha transação HTTP aberta aguardando confirmação. O resumo mostra efeitos configurados e valores declarados, não promete saldo/custo final.

## Endpoints esperados

Sob `estoque.lancamentos_avulsos.module`:

- `GET /cadastros/estoque/lancamentos-avulsos`;
- lookups/resolvers locais de Produto, Tipo e Lote;
- `GET .../contexto`;
- `POST .../preparar`, sem escrita;
- `POST .../lancamentos`, síncrono.

Use `/api/sensitive-operation-auth/evaluate` para o desafio, mas o comando final valida a prova internamente.

Reutilize visualmente `CatalogCodeLookup`/`ErpTwoColumnCatalogLookupModal`. Endpoints são locais porque lookups genéricos têm permissões/filtros incompatíveis. Código digitado e lupa passam pela mesma regra.

## Preparação

Valide acesso, Filiais, data, Produto, Tipo, Lote e campos; leia contexto; monte resumo humano; informe autorização; emita token curto ligado ao operador, payload, Filiais e configuração.

Token não reserva saldo. POST final relê tudo. Payload/Tipo/parâmetro divergente retorna `409 preparation_stale`.

## Idempotência durável

Crie storage com unicidade `(operator_codigo, idempotency_key)`, `payload_hash`, status, `movimento_numero`, timestamps e resultado mínimo.

- normalize payload sem tokens efêmeros;
- reserve/bloqueie dentro da transação;
- mesma chave/hash concluída retorna mesmo Movimento com `replayed=true`, sem INSERT/prova;
- mesma chave/outro hash retorna `409 idempotency_conflict`;
- chave nova valida prova, insere e conclui atomicamente;
- falha reverte reserva; prova consumida pode exigir nova autorização;
- concorrentes convergem para um resultado.

Cache não basta. Após timeout/erro incerto, repita a mesma chave. Retry de deadlock/serialization é limitado e somente sob idempotência.

## Transação e locks

Uma `DB::transaction` curta cobre: replay/reserva, `DatabaseAuditContext`, revalidações, prova, whitelist do INSERT raiz, triggers, leitura mínima, conclusão idempotente e commit.

Não adquira locks manuais fora da ordem das triggers. Não use `MAX()+1` em PostgreSQL. Leia o contexto completo após commit.

Whitelist da raiz: Produto, Filial, Data, Tipo, Quantidade, valores/preços condicionais, Referência, destino, Lote, operador e autorizador.

## Auditoria e resposta

Combine `DatabaseAuditContext` (`web.erp`, request ID, ator, Filial), usuários na raiz, audit triggers e eventos sensíveis. Logue request ID, chave mascarada/hash, raiz, Filiais, Produto, Tipo, duração e falha; nunca senha/prova.

Resposta: Movimento-raiz, relacionados informativos classificados (`componente`, `negativo`, `transferencia`), `replayed`, request ID e mensagem. Relacionados têm cardinalidade variável e nunca são gravados pelo cliente.

## Erros

Contrato uniforme: `code`, `message`, `field_errors`, `request_id`, `retryable`. Use SQLSTATE + catálogo explícito de mensagens.

- 422 validação e regras conhecidas;
- 403 acesso/Filial sem revelar dados;
- 409 preparação/prova/contexto/idempotência e mudanças concorrentes;
- 503 retryable para timeout/deadlock conforme classe;
- 500 para schema/função ausente ou desconhecido.

Não exponha SQL/stack nem converta toda `QueryException` em 422. Qualquer exceção reverte raiz, relacionados, Lote, projeções e idempotência.

## Reuso obrigatório no Laravel

Investigue e reutilize no Laravel atual:

- `UserBranchAccessService`;
- `SensitiveOperationAuthService` e modal/prova/auditoria;
- `DatabaseAuditContext`;
- `TipoMovimentoOperacaoMapper` e repository de Tipos, com filtro local mais estrito;
- componentes de lookup;
- consultas de Movimentação Diária somente para histórico;
- ADR `210-marketplace-legacy-order-trigger-aware-write.md` como precedente.

Crie command/repository próprios. Não reutilize `LegacyMarketplaceOrderRepository`. SQLite não comprova triggers: exija PostgreSQL real.

## Legado proibido

Não reproduza: última compra atualizada sem Filial; Filiais globais; negativo validado só na UI; `MAX()+1`; transação esperando usuário; edição/exclusão herdadas; `operacao`/saldos/bypasses do browser; writes paralelos às triggers; log SQL local.

## Testes e aceite mínimo

Cubra Feature/Unit e integração PostgreSQL:

1. administrador/grant/sem acesso e Filiais origem/destino;
2. Tipo elegível e vetor inválido;
3. Produto, composto, Lote e data contábil;
4. forma dinâmica, preparação e token stale;
5. gerente, não gerente, parâmetro ativo, prova inválida/expirada/consumida;
6. mesmo UUID/payload, conflito de payload e concorrência;
7. operações `+`, `-`, `=`, `C`;
8. negativo permitido/rejeitado;
9. transferência, componentes, Lote e identidades relacionadas;
10. rollback integral em falha de trigger;
11. timeout/deadlock e repetição com mesma chave;
12. operador/autorizador, audit context e logs sem segredo;
13. sucesso somente após commit e recarga do contexto;
14. inexistência de rotas de editar/excluir/reverter;
15. teste arquitetural impedindo writes Laravel em projeções/derivados.

## Fora do escopo

Alterar/desabilitar triggers; alterar Delphi; corrigir dados existentes; migrar outros fluxos de `movimentos`; criar estorno genérico; substituir o mecanismo contábil de estoque; implementar processamento assíncrono.

## Saída esperada

Gere uma spec completa, verificável e pronta para planejamento/implementação. Numere requisitos funcionais, descreva fluxos felizes e falhas, entidades, contratos e critérios de sucesso mensuráveis. Identifique componentes Laravel reutilizáveis e novos limites necessários. Não crie pendências de investigação no Delphi ou PostgreSQL: tudo que precisa ser preservado está neste briefing.
```
