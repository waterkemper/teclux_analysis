Type: task
Status: resolved
Blocked by: 01, 02, 04, 08

## Question

Como o Delphi grava preços e efeitos relacionados, quais transações, procedures, triggers e logs participam, e como o Laravel deve aplicar um lote F5 de forma atômica, idempotente e segura contra alterações concorrentes?

Definir revision/assinatura por registro, política de conflito tudo-ou-nada e Auditoria separada de Marketplace, correlacionando operação, Usuário, eventual Autorizador, Filial, filtros e diffs individuais anterior/novo.

## Answer

### Comportamento legado comprovado

- **CONFIRMADO** — `AlterarColunasPrecosProdutos` obtém uma autorização antes de persistir: o Gerente de Estoque confirma por senha; os demais usam login de Gerente autorizado (`delphi/apps/estoque/dmmanutencaopreco.pas:1660-1674`).
- **CONFIRMADO** — grava `colunasprecos`, `caracteristicas`, `produtoscargos`, `produtos` e o vínculo promocional em `precos` (`dmmanutencaopreco.pas:1677-1790`). Valor zero exclui coluna existente; valor não zero inclui/atualiza (`dmmanutencaopreco.pas:1688-1698`).
- **CONFIRMADO** — há `Perpetrar` após os três primeiros grupos e dentro dos laços de Produto e Promoção (`dmmanutencaopreco.pas:1701,1727,1746,1760,1785`), sem transação abrangente visível.
- **DÚVIDA** — a implementação compartilhada de `Perpetrar` e o limite final da conexão não foram localizados nesta unit; a atomicidade legada não está comprovada.
- **POSSÍVEL BUG LEGADO** — uma falha tardia pode deixar grupos anteriores aplicados. Isso não será reproduzido.
- **CONFIRMADO** — concatenação SQL em `colunasprecos` e `produtoscargos` é legado (`dmmanutencaopreco.pas:1623-1655`); o Laravel usará comandos parametrizados.

### Base Laravel comprovada

- **CONFIRMADO** — triggers append-only cobrem `produtos`, `produtoscargos`, `caracteristicas`, `precos` e `colunasprecos`, incluindo operação, chave, contexto, `request_id` e JSON `dados` (migrations `2026_05_08_100003`, `100004`, `100009`; nesta última: linhas 98-152, 221-275 e 344-398).
- **CONFIRMADO** — `DatabaseAuditContext` aplica Operador, origem, `request_id` e Filial por `SET LOCAL`, mas não o Autorizador (`DatabaseAuditContext.php:17-44`).
- **CONFIRMADO** — os serviços de preços existentes transacionam por operação, portanto não compõem sozinhos um lote atômico (`ProdutoPrecosWriteService.php:36-40`; `ProdutoPrecosCargosWriteService.php:59,102,139`). Já há hash de conciliação em `colunasprecos`.
- **CONFIRMADO** — `caracteristicas` possui revisão por `xmin`/ `cloud_row_version` e `produtos` por `cloud_row_version` (`LegacyCaracteristicaRepository.php:110-123,273-324`; `LegacyProdutoItemRepository.php:43-51,138-160`).
- **CONFIRMADO** — a prova sensível é curta, vinculada a Operador, Filial, módulo, ação e contexto e consumida uma vez (`SensitiveOperationProofService.php:19-38,64-104`).
- **DIVERGENTE** — `_log_new` também alimenta detecção Marketplace, mas é auditoria física transversal; esta gravação não chamará serviços ou publicação Marketplace.

### Decisões para persistência

- **DECISÃO NOVA** — confirmar pelo **F8 do Laravel** (equivalente ao F5 legado), após prévia modal.
- **DECISÃO NOVA** — usar coordenador próprio e uma única `DB::transaction`; não encadear métodos públicos com transações próprias.
- **DECISÃO NOVA** — lote tudo-ou-nada. Antes de qualquer escrita: validar autorização, Filial, payload e invariantes; bloquear alvos em ordem determinística; verificar todas as revisões.
- **DECISÃO NOVA** — cada intenção carrega `expected_revision` do registro físico. Reusar tokens de `produtos` e `caracteristicas`; para `colunasprecos`, `produtoscargos` e `precos`, assinar canonicamente chave, existência e campos relevantes, inclusive ausência esperada.
- **DECISÃO NOVA** — bloquear por tabela/chave na ordem `caracteristicas`, `precos`, `colunasprecos`, `produtos`, `produtoscargos`.
- **DECISÃO NOVA** — conflito retorna HTTP 409 com todos os alvos divergentes e revisões esperada/atual. Nada é aplicado e não há sobrescrita automática.
- **DECISÃO NOVA** — após sucesso, conservar filtros e repetir F6; falha do refresh não invalida o commit.

### Idempotência e auditoria

- **DECISÃO NOVA** — cada confirmação usa UUID `request_id` e hash canônico do payload. Um controle interno único por UUID devolve o resultado anterior para repetição idêntica e rejeita o mesmo UUID com payload diferente.
- **DECISÃO NOVA** — o cabeçalho registra UUID, hash, Operador, eventual Autorizador, Filial efetiva, filtros normalizados, horário, estado e contagens. É interno e separado de Marketplace.
- **DECISÃO NOVA** — obter a prova de Gerente antes da transação e reivindicá-la no commit, vinculada ao lote. Nunca persistir senha. O Operador entra no contexto dos triggers; o Autorizador fica no cabeçalho e no evento sensível.
- **DECISÃO NOVA** — os diffs anterior/novo vêm das triggers `_log_new`, correlacionados pelo UUID; não serão duplicados manualmente.
- **DECISÃO NOVA** — rejeições não produzem diffs; tentativas de autorização ficam no log sensível e falhas técnicas em log estruturado sem credenciais.

### Critérios verificáveis

1. Falha em qualquer grupo não altera nenhuma das cinco tabelas.
2. Em concorrência, no máximo um lote vence; o outro recebe todos os conflitos.
3. Repetir UUID e payload não gera novas alterações ou entradas de log.
4. Reusar UUID com payload diferente é rejeitado.
5. Cabeçalho e `_log_new` reconstroem o lote, distinguindo Operador e Autorizador.
6. Nenhum serviço de publicação Marketplace é acionado.

Esta fatia está pronta para `$to-spec` com as issues 08 e 10, depois de resolver a issue 11.

