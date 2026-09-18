# Fluxo de entrega do Romaneio e `documentospag.previsao`

## Conclusão

A escrita é feita pelo Delphi, não por uma trigger de negócio localizada. No fluxo de `delphi/apps/entrega`, salvar a confirmação de entrega persiste os itens, recalcula `romaneios.situacao_romaneio` pela função PostgreSQL `Atualizar_situacao_romaneio` e chama a rotina compartilhada de Contas a Pagar. Esta rotina atribui `documentospag.previsao := false` quando **todos os itens não cancelados** têm `romaneiosnotas.entrega` preenchido.

O código não testa literalmente `situacao_romaneio = 'ENTREGUE'` para mudar `previsao`: situação e previsão são consequências correlatas do mesmo salvamento, calculadas por critérios distintos.

## Cadeia comprovada

1. A tela expõe **DATA/HORA ENTREGA**, ligada a `data_hora_recebimento` (`delphi/apps/entrega/fmcadastroromaneios.dfm:773-790,1346-1378`).
2. `TfrmCadastroRomaneio.InternoGravar` chama `dtmCadastroRomaneios.GravarRomaneios` (`delphi/apps/entrega/fmcadastroromaneios.pas:203-211`).
3. `GravarRomaneios` detecta alterações de recebimento, justificativa ou motivo (`delphi/apps/entrega/dmcadastroromaneios.pas:737-747,776-792`). Após autorização, grava usuário, atribui `DataHoraServidor` a `qryItensRomaneioentrega` e faz `Post` (`dmcadastroromaneios.pas:780-800`).
4. `qryItensRomaneio` é atualizável e seleciona `rn.entrega`, justificativa, motivo e recebimento diretamente de `romaneiosnotas` (`delphi/apps/entrega/dmcadastroromaneios.dfm:524-539,579-580,771-775`); o commit ocorre em `Perpetrar` (`dmcadastroromaneios.pas:853-862`).
5. Em sucesso, `GravarRomaneios` chama `AtualizarSituacaoRomaneio` (`dmcadastroromaneios.pas:865-869`), que executa `select Atualizar_situacao_romaneio(:romaneio)` (`dmcadastroromaneios.pas:2553-2557`; `dmcadastroromaneios.dfm:3493-3517`).
6. No snapshot PostgreSQL, `atualizar_situacao_romaneio` chama `situacao_romaneio` e atualiza somente `romaneios.situacao_romaneio` (`modules/entregas/cadastro-romaneios/schema/functions-2026-08-01.sql:3-25`). Para Romaneio normal em trânsito, a função retorna `ENTREGUE` quando não há item ativo sem recebimento/justificativa e existe item com um deles (`functions-2026-08-01.sql:352-382`, numeração de `rg -n`).
7. Depois, se `parsistema.IncluirDocumentoaPagarnoRomaneio` estiver habilitado, `GravarRomaneios` chama `IncluirDocumentosPag(..., Romaneios, ..., [qryRomaneios, qryValorEntrada, qryItensRomaneio])` (`delphi/apps/entrega/dmcadastroromaneios.pas:882-895`).
8. Na ramificação `Romaneios`, `ExisteEntregaPendente` começa em `true` e vira `false` ao encontrar item não cancelado com `entrega IS NULL` (`delphi/apps/contaspagar/dmcontaspagar.pas:5472-5487`). Apesar do nome, `true` significa “nenhuma entrega pendente”.
9. A linha decisiva é `qryDocumentosPagprevisao.AsBoolean := not ExisteEntregaPendente` (`delphi/apps/contaspagar/dmcontaspagar.pas:5550-5556`):

   | Itens não cancelados | Retorno | `previsao` |
   |---|---:|---:|
   | algum `entrega IS NULL` | `false` | `true` |
   | todos `entrega IS NOT NULL` | `true` | `false` |

10. `GravarContasPagar` faz `qryDocumentosPag.Post` e inclui o dataset no `Perpetrar`, efetivando a atualização (`delphi/apps/contaspagar/dmcontaspagar.pas:2314-2319,2548-2558`).

## Triggers e limites

- As cinco triggers habilitadas de `documentospag` no snapshot são exclusão, validação/efeitos de insert/update, log, auditoria e timestamps (`modules/entregas/cadastro-romaneios/schema/postgresql-authoritative-2026-08-01.json:18536-18582`). A inspeção integral não encontrou atribuição a `NEW.previsao` nem `UPDATE documentospag ... previsao`; `documentospag_log` apenas copia o valor para o log.
- Documento quitado não é alterado (`delphi/apps/contaspagar/dmcontaspagar.pas:5511-5517,5604-5606`); valor de vencimento zero pode levar à exclusão (`dmcontaspagar.pas:5515-5527`).
- A regra financeira olha `romaneiosnotas.entrega`, não a situação. Como justificativa ou motivo também preenchem `entrega`, `previsao=false` isoladamente não prova situação exatamente `ENTREGUE`.

## Não localizado

- Escrita direta de `documentospag.previsao` dentro de `delphi/apps/entrega`.
- Trigger PostgreSQL que converta a mudança de situação em alteração de `documentospag.previsao`.
- Efeito interno de `Atualizar_situacao_romaneio` sobre `documentospag`; a definição capturada atualiza apenas `romaneios`.

Os “não localizados” limitam-se ao código versionado e ao snapshot PostgreSQL de 2026-08-01 no repositório.
