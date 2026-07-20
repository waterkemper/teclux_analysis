Type: task
Status: resolved
Blocked by: 03, 04

## Question

Qual desenho funcional e técnico deve implementar Lançamentos Avulsos no Laravel — comandos/endpoints, DTOs, lookups, estados da UI, capabilities, Filiais, data contábil, negativos, Lotes, transferências, compostos, exclusão/estorno, idempotência, locks, transação, Auditoria e tradução de erros — preservando as triggers como autoridade única dos saldos e com critérios verificáveis de aceite?

## Answer

### Decisão geral

Implementar **Estoques → Lançamentos Avulsos** como página de comando síncrono e inclusion-only. O browser prepara a intenção, apresenta seu efeito, obtém confirmação/autorização e envia um único comando final. O backend insere somente o Movimento-raiz; sucesso é devolvido apenas depois das triggers e do commit.

Não haverá edição, exclusão, fila assíncrona, cálculo paralelo de saldo ou gravação direta nas projeções. Correção/estorno futuro será novo lançamento compensatório com Tipo explícito e especificação própria.

### Componentes

- `LancamentosAvulsosController`, FormRequests e DTO normalizado.
- `LancamentosAvulsosModuleAccessService` + middleware/Policy próprios.
- `PrepararLancamentoAvulsoService`, sem escrita.
- `RegistrarLancamentoAvulsoCommand`, transacional.
- `LegacyLancamentoAvulsoRepository`, exclusivo para INSERT da raiz e leitura do resultado.
- queries dedicadas de Produto, Tipo, Lote e contexto.
- `LancamentoAvulsoIdempotencyRepository` durável.
- `LancamentoAvulsoPgsqlExceptionTranslator`.

Reutilizar `UserBranchAccessService`, `SensitiveOperationAuthService`, `DatabaseAuditContext`, `TipoMovimentoOperacaoMapper`, componentes de lookup e consultas de histórico. Não reutilizar repositório Marketplace nem permissões de relatórios/cadastros.

### Rotas

Sob autenticação e `estoque.lancamentos_avulsos.module`:

| Método | Rota sugerida | Finalidade |
|---|---|---|
| GET | `/cadastros/estoque/lancamentos-avulsos` | página, capabilities, Filiais e defaults |
| GET | `.../lookup-produtos` / `resolve-produto` | lupa e código direto pela mesma regra |
| GET | `.../lookup-tipos-movimentos` / `resolve-tipo-movimento` | Tipos elegíveis e configuração da forma |
| GET | `.../lookup-lotes` / `resolve-lote` | Lotes por Produto + Filial |
| GET | `.../contexto` | saldos, valores e últimos dez movimentos |
| POST | `.../preparar` | valida e resume sem escrever |
| POST | `.../lancamentos` | registra sincronamente a raiz |

Usar `/api/sensitive-operation-auth/evaluate` para o desafio. O POST final valida/consome a prova internamente; o cliente não trata `validate-proof` como autorização suficiente.

### DTO público

Aceitos: `filial`, `produto`, `tipomovimento`, `data`, `quantidade`, `valor`, `precosemicms`, `precocomicms`, `valorultimacompra`, `referencia`, `trffilial`, `loteproduto`, `idempotency_key`, `preparation_token` e `prova_autorizacao`.

Regras: Quantidade decimal(11,3) não negativa; valores decimal(11,2); Referência até 60; campos condicionais conforme Tipo; UUID obrigatório. Operador vem da sessão e autorizador da prova.

Nunca aceitar: `numero`, `lancto`, `operacao`, saldos, Financeiro calculado, relações derivadas, usuários informados pelo cliente, `comexcecaosenegativo` ou flags de bypass.

### Preparação e confirmação

`preparar` valida ability, Filiais, data, Produto, Tipo e Lote; relê `tiposmovimentos`; determina campos; lê contexto atual; monta resumo humano dos saldos/sentidos, transferência, composto, Lote e Financeiro; informa necessidade de autorização; e emite token curto ligado ao operador, payload, Filiais e configuração.

O token prova que a intenção foi exibida, não reserva saldo. O POST final relê tudo. Mudança de payload, Tipo ou parâmetro retorna `409 preparation_stale`.

Financeiro, `C`, última compra, transferência, composto, `=` ou redução exigem confirmação explícita antes do POST. Isso substitui o diálogo Delphi. Não haverá dry-run com INSERT+ROLLBACK nem transação HTTP aberta.

### Estados da UI

```text
inicial → contexto → edição → preparação → confirmação
       → autorização (se exigida) → gravação bloqueada → sucesso
       ↘ validação/conflito corrigível
       ↘ erro desconhecido com a mesma chave para retry seguro
```

Trocar Filial limpa Produto, Lote, destino, contexto, preparação e prova. Trocar Produto limpa Lote e dependências. Alterar qualquer campo invalida preparação/prova. Após sucesso, preservar apenas Filial/Tipo/Data/Referência, limpar a intenção, gerar novo UUID e recarregar o contexto.

### Capabilities e autorização

Expor `canView` e `canCreate`; fixar `canUpdate`, `canDelete` e `canReverse` como false. Não criar ability separada para Financeiro/última compra: o legado protege o lançamento inteiro pelo mesmo domínio Gerente de Estoque; riscos financeiros ficam destacados e auditados.

Adicionar ao catálogo sensível `Estoque/lancamentos_avulsos_incluir`, perfil `gerenteestoque`, parâmetro **“Exigir Senha em Lançamentos Avulsos”**, sem reuso contextual automático. Operador não gerente sempre exige Gerente; parâmetro ativo exige desafio também para gerente, admitindo senha própria pelo framework. Prova vinculada a operador, Filial, ação e payload. Gravar `usuariologado` da sessão e `usuarioautorizacao` da prova.

### Filial, Produto, Lote, composto e data

- `UserBranchAccessService` limita e revalida origem/destino; elas devem ser distintas.
- Exigir Estoque existente na origem e no destino nesta entrega, sem depender implicitamente de `INCLUIR ESTOQUE AUTOMATICO`.
- Produto composto depende de **“lançamentos avulsos de produtos compostos”**; Laravel não explode componentes.
- Produto gerenciado por lote exige Lote resolvido por Produto + Filial.
- Última compra é proibida para composto.
- Backend calcula data mínima com Data Contábil ou `DiasNotaRetroativa`, fornece limites à UI e revalida pelo relógio do servidor.
- Rejeitar data menor ou igual ao fechamento; data futura fica proibida salvo regra sistêmica explícita.

### Negativos, Financeiro e última compra

A preparação pode alertar insuficiência pelo snapshot agregado/Lote, mas não garante aceitação. A trigger decide após lock. Não existe checkbox livre para negativo nem envio de `comexcecaosenegativo`.

Se o Tipo possui `quandoestoquenegativo`, o resumo explica a compensação possível; somente a trigger cria o relacionado. Operação `C` informa cálculo por custo médio e não aceita Financeiro livre. `=` recebe destaque por substituir saldo/base. Última compra usa exclusivamente a posição 11 da trigger e Produto + Filial; o UPDATE global defeituoso do Delphi é proibido.

### Idempotência durável

Criar tabela de infraestrutura como `erp_lancamentos_avulsos_idempotency`, chave única `(operator_codigo, idempotency_key)`, com `payload_hash`, status, `movimento_numero`, timestamps e resultado mínimo.

Dentro da transação: normalizar payload de negócio sem tokens efêmeros; reservar/bloquear a chave; concluída com mesmo hash devolve o Movimento (`replayed=true`) sem INSERT/prova; mesmo UUID com hash diferente retorna `409 idempotency_conflict`; chave nova valida prova, insere e conclui. Falha DB reverte a reserva; uma prova já consumida pode exigir nova autorização por segurança. Concorrentes com mesma chave convergem para um resultado.

Cache não é fonte suficiente. Timeout/erro desconhecido deve ser repetido com a mesma chave, nunca com UUID novo. Deadlock/serialization pode ter retry limitado apenas sob esse comando idempotente.

### Locks e fronteira transacional

Uma única `DB::transaction` curta:

1. replay/reserva idempotente;
2. `DatabaseAuditContext` com ator, `web.erp`, request ID e Filial;
3. revalidação de acesso, preparação, Tipo, Produto, Filiais, Lote e parâmetros;
4. validação/consumo da autorização quando não é replay;
5. INSERT whitelist de uma única raiz;
6. conclusão integral das triggers;
7. leitura da raiz/relacionados essenciais;
8. conclusão da idempotência e commit.

Não adquirir locks manuais de `estoques` fora da ordem das triggers; elas já usam `FOR UPDATE`, e locks duplicados ampliam deadlocks em transferência/composto. Contexto completo é relido após commit.

Whitelist da raiz: Produto, Filial, Data, Tipo, Quantidade, Valor, preços, Valor última compra, Referência, `trffilial`, `loteproduto`, operador e autorizador. Em PostgreSQL, deixar número/ordem ao mecanismo canônico; nunca `MAX()+1`.

### Auditoria e observabilidade

Combinar `DatabaseAuditContext`, usuários na raiz, audit triggers e eventos da autorização. Log estruturado registra request ID, chave idempotente mascarada/hash, raiz, Filiais, Produto, Tipo, duração e classe da falha; nunca senha ou prova. Monitorar deadlocks, timeouts, falhas desconhecidas e divergência estrutural.

### Tradução de erros

Contrato JSON: `code`, `message`, `field_errors`, `request_id`, `retryable`.

| Classe | HTTP | Ação |
|---|---:|---|
| validação antecipada | 422 | erro por campo |
| acesso/Filial | 403 | não revelar dados |
| preparação/prova/contexto expirado | 409 | preparar/autorizar novamente |
| UUID com outro payload | 409 | restaurar payload ou nova intenção |
| negativo/Financeiro/Lote pela trigger | 422/409 | mensagem segura e recarga |
| FK/Tipo/Lote alterado | 409 | refazer preparação |
| deadlock/serialization | 409/503 retryable | retry limitado, mesma chave |
| timeout | 503 retryable | repetir/consultar mesma chave |
| schema/função ausente/desconhecido | 500 | log interno, mensagem genérica |

Tradutor usa SQLSTATE e catálogo explícito de mensagens; não expõe SQL/stack nem converte toda `QueryException` em 422.

### Resposta

Retornar raiz (`numero`, Produto, Filial), relacionados informativos (`numero`, espécie, Produto, Filial), `replayed`, request ID e mensagem. Depois do commit, recarregar `estoques`, eventual `estoqueslotes` e últimos dez movimentos. A cardinalidade dos relacionados é variável e não governa o cliente.

### Critérios verificáveis de aceite

1. Sem capability ou Filial autorizada não se abre, pesquisa ou grava.
2. Origem/destino são revalidados; destino igual é rejeitado.
3. Tipo interno, inativo, sentinela ou operação inválida é rejeitado.
4. Lote e composto respeitam contexto/parâmetro.
5. Request rejeita operação, saldos, relações e bypasses.
6. Aplicação insere exatamente uma raiz; derivados pertencem às triggers.
7. Erro de trigger faz rollback de raiz, relacionados, lote e projeções.
8. Mesmo UUID/payload gera um único Movimento; payload diferente conflita.
9. Autorização persiste operador/autorizador corretos.
10. Data é validada no servidor.
11. `C`, `=`, última compra e riscos exibem confirmação; não há UPDATE global.
12. Não existe editar/excluir Movimento confirmado.
13. Sucesso só aparece após commit e contexto é relido.
14. Testes PostgreSQL cobrem `+`, `-`, `=`, `C`, negativo, transferência, composto, Lote, rollback, concorrência, idempotência e auditoria.
15. Teste arquitetural garante ausência de writes Laravel em `estoques`, `estoqueslotes`, `movimentoslotes` e derivados.

### Sequência futura

Policies/acesso → queries/lookups → preparação/forma → idempotência/comando/repositório → erros/auditoria → página síncrona → testes PostgreSQL. É orientação para o SpecKit, não implementação realizada no Wayfinder.
