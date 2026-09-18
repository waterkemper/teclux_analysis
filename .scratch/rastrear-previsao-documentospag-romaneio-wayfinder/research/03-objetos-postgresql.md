# Pesquisa — objetos PostgreSQL e `documentospag.previsao`

## Pergunta e conclusão

**NÃO LOCALIZADO em PostgreSQL:** nos dois snapshots autoritativos versionados não há função, procedure ou trigger que, ao levar um Romaneio a `ENTREGUE`, atribua `documentospag.previsao = false`.

O objeto PostgreSQL alcançado pelo fluxo é `public.atualizar_situacao_romaneio(integer)`. Ele chama `situacao_romaneio(integer)` e grava somente `romaneios.situacao_romaneio`; não lê nem escreve `documentospag.previsao` ([funções do snapshot, linhas 3–14](../../../modules/entregas/cadastro-romaneios/schema/functions-2026-08-01.sql#L3)).

A escrita que explica a alteração do documento a pagar está no Delphi compartilhado de Contas a Pagar: `IncluirDocumentosPag` percorre os itens do Romaneio, considera pendente qualquer item não cancelado cujo campo `entrega` seja nulo e grava `qryDocumentosPagprevisao.AsBoolean := not ExisteEntregaPendente` ([dmcontaspagar.pas, linhas 5461–5487](../../../delphi/apps/contaspagar/dmcontaspagar.pas#L5461), [linha 5556](../../../delphi/apps/contaspagar/dmcontaspagar.pas#L5556)). Apesar do nome, a função local começa em `true` e muda para `false` quando encontra uma entrega pendente; portanto a expressão final resulta em:

- algum item não cancelado com `entrega IS NULL` → `previsao = true`;
- nenhum item não cancelado com `entrega IS NULL` → `previsao = false`.

Logo, o valor não é calculado a partir do texto `romaneios.situacao_romaneio = 'ENTREGUE'`. Situação e previsão são efeitos irmãos derivados dos itens no mesmo salvamento Delphi.

## Fontes examinadas

Os snapshots foram coletados em modo somente leitura no banco lógico `tecsoft`, schema `public`, em 2026-08-01 e 2026-08-03 ([README do snapshot de Entregas, linhas 5–10](../../../modules/entregas/cadastro-romaneios/schema/README.md#L5), [README do snapshot de Interlojas, linhas 5–11](../../../modules/interlojas/confirmacao-por-romaneios/schema/README.md#L5)). O primeiro declara que nenhum objeto solicitado ficou ausente ([README de Entregas, linha 12](../../../modules/entregas/cadastro-romaneios/schema/README.md#L12)); o segundo estende essa evidência histórica sem sobrescrevê-la.

Foram inspecionados:

- `modules/entregas/cadastro-romaneios/schema/functions-2026-08-01.sql`;
- `modules/entregas/cadastro-romaneios/schema/postgresql-authoritative-2026-08-01.json`;
- `modules/interlojas/confirmacao-por-romaneios/schema/postgresql-authoritative-2026-08-03.json`;
- definições versionadas dos triggers de `romaneios`, `romaneiosnotas`, `documentospag` e `duplicatas`;
- fontes Delphi alcançadas apenas para fechar a cadeia observável da chamada SQL até a escrita do campo.

Uma varredura das definições de funções e triggers nos dois JSONs encontrou `previsao` somente em `documentospag_log`; não encontrou atribuição `NEW.previsao := ...` nem `UPDATE documentospag SET previsao ...`.

## Cadeia comprovada no Cadastro de Romaneios

1. Ao alterar dados de recebimento, justificativa ou motivo, `GravarRomaneios` marca o item com o horário do servidor em `qryItensRomaneioentrega` ([dmcadastroromaneios.pas, linhas 776–840](../../../delphi/apps/entrega/dmcadastroromaneios.pas#L776)). O dataset prova que esse campo é `romaneiosnotas.entrega` ([dmcadastroromaneios.dfm, linhas 524–535](../../../delphi/apps/entrega/dmcadastroromaneios.dfm#L524)).
2. O mestre e os itens são persistidos; em seguida o código chama `AtualizarSituacaoRomaneio` ([dmcadastroromaneios.pas, linhas 853–878](../../../delphi/apps/entrega/dmcadastroromaneios.pas#L853)). O componente executa `select Atualizar_situacao_romaneio(:romaneio)` ([dmcadastroromaneios.dfm, linha 3505](../../../delphi/apps/entrega/dmcadastroromaneios.dfm#L3505)).
3. `situacao_romaneio` classifica o Romaneio normal liberado como `ENTREGUE` quando não encontra item fiscal ativo sem `data_hora_recebimento` e sem justificativa, e encontra ao menos um item com recebimento ou justificativa ([functions-2026-08-01.sql, linhas 644–683](../../../modules/entregas/cadastro-romaneios/schema/functions-2026-08-01.sql#L644)). `atualizar_situacao_romaneio` então atualiza exclusivamente `romaneios.situacao_romaneio` ([linhas 3–14](../../../modules/entregas/cadastro-romaneios/schema/functions-2026-08-01.sql#L3)).
4. Depois de recalcular/persistir a situação, se `ParSistema.IncluirDocumentoaPagarnoRomaneio` estiver ativo, `GravarRomaneios` chama `IncluirDocumentosPag` com `qryRomaneios`, `qryValorEntrada` e `qryItensRomaneio` ([dmcadastroromaneios.pas, linhas 882–895](../../../delphi/apps/entrega/dmcadastroromaneios.pas#L882)).
5. `IncluirDocumentosPag` abre o documento vinculado por número, não o altera se houver quitação, e no caminho de inclusão/edição calcula e atribui `previsao` a partir de `romaneiosnotas.entrega` ([dmcontaspagar.pas, linhas 5500–5556](../../../delphi/apps/contaspagar/dmcontaspagar.pas#L5500)). A persistência segue por `GravarContasPagar` ([linhas 5587–5592](../../../delphi/apps/contaspagar/dmcontaspagar.pas#L5587)).

Essa ordem explica a observação do usuário: na mesma gravação que faz o Romaneio aparecer como `ENTREGUE`, o Delphi regrava o documento vinculado como não previsão. Não existe, porém, uma dependência SQL direta `ENTREGUE → previsao=false`.

## O que fazem os objetos PostgreSQL relevantes

### Funções de situação

- `atualizar_situacao_romaneio(integer)`: chama `situacao_romaneio`, atualiza apenas a coluna de situação do mestre e retorna o texto ([snapshot de Entregas, linha 19408](../../../modules/entregas/cadastro-romaneios/schema/postgresql-authoritative-2026-08-01.json#L19408); [snapshot de Interlojas, linha 23870](../../../modules/interlojas/confirmacao-por-romaneios/schema/postgresql-authoritative-2026-08-03.json#L23870)).
- `situacao_romaneio(integer)`: calcula o estado agregado; a definição versionada contém as condições de `ENTREGUE`, mas nenhuma referência a `documentospag`/`previsao` ([snapshot de Entregas, linha 19474](../../../modules/entregas/cadastro-romaneios/schema/postgresql-authoritative-2026-08-01.json#L19474)).
- `situacao_romaneio_saida(integer, integer)`: calcula o estado por item e igualmente não escreve o financeiro ([snapshot de Entregas, linha 19485](../../../modules/entregas/cadastro-romaneios/schema/postgresql-authoritative-2026-08-01.json#L19485)).

### Triggers das tabelas alcançadas

- `documentospag_antesinseriratualizar`: gera número/valida e mantém movimentos bancários; não atribui `previsao` ([snapshot de Entregas, linha 18547](../../../modules/entregas/cadastro-romaneios/schema/postgresql-authoritative-2026-08-01.json#L18547); [Interlojas, linha 23009](../../../modules/interlojas/confirmacao-por-romaneios/schema/postgresql-authoritative-2026-08-03.json#L23009)).
- `documentospag_log`: apenas copia `OLD.previsao`/`NEW.previsao` para a tabela de log; observa a mudança, não a produz ([snapshot de Entregas, linha 18558](../../../modules/entregas/cadastro-romaneios/schema/postgresql-authoritative-2026-08-01.json#L18558); [Interlojas, linha 23020](../../../modules/interlojas/confirmacao-por-romaneios/schema/postgresql-authoritative-2026-08-03.json#L23020)).
- `romaneios_antesinseriratualizar`: trata concorrência/timestamp do mestre, sem efeito financeiro ([snapshot de Entregas, linha 19108](../../../modules/entregas/cadastro-romaneios/schema/postgresql-authoritative-2026-08-01.json#L19108)).
- `romaneiosnotas_antesinseriratualizar`: não toca `documentospag`; além disso, as duas instalações desse trigger estão desabilitadas no snapshot (`tgenabled = D`) ([snapshot de Entregas, linha 19152](../../../modules/entregas/cadastro-romaneios/schema/postgresql-authoritative-2026-08-01.json#L19152)).
- `duplicatas_depoisinseriratualizardeletar`: valida pagamentos e sincroniza parcelas de transferência; não altera `documentospag.previsao` ([snapshot de Entregas, linha 18613](../../../modules/entregas/cadastro-romaneios/schema/postgresql-authoritative-2026-08-01.json#L18613)).

## Interlojas: escrita distinta, também Delphi

Na Confirmação por Romaneios de transferência há outra escrita direta de `false`: `TdtmConfirmarromaneiosTransferencia.IncluirDocumentosPag` cria o documento a pagar da nota de entrada com `qryDocumentosPagprevisao.AsBoolean := false` ([dmconfirmarromaneiostransferencia.pas, linhas 979–1005](../../../delphi/apps/interlojas/dmconfirmarromaneiostransferencia.pas#L979)). O fluxo persiste documento/duplicatas e só depois executa `Atualizar_situacao_romaneio` ([linhas 486–518](../../../delphi/apps/interlojas/dmconfirmarromaneiostransferencia.pas#L486)). Portanto essa escrita também não é consequência de trigger ou do retorno `ENTREGUE`; é inicialização explícita de outro documento financeiro no Delphi.

## Limites e trecho ausente

- **NÃO LOCALIZADO:** objeto PostgreSQL que implemente a regra `quando situação do Romaneio = ENTREGUE, então documentospag.previsao = false`.
- **LOCALIZADO:** escritor Delphi do documento vinculado ao Cadastro de Romaneios, condicionado à ausência de `romaneiosnotas.entrega` pendente e à configuração `IncluirDocumentoaPagarnoRomaneio`.
- **LOCALIZADO, mas distinto:** escritor Delphi de Interlojas que já cria o documento financeiro de entrada com `previsao = false`.
- Os snapshots provam as definições existentes nas coletas de 2026-08-01/03, não o estado de outro banco ou de uma implantação posterior. Se o comportamento observado vier de ambiente diferente, será necessária nova coleta somente leitura de `pg_trigger`/`pg_proc` nesse ambiente; isso não muda o fato de que as fontes versionadas atuais já contêm um escritor Delphi suficiente para explicar o caso do Cadastro de Romaneios.
