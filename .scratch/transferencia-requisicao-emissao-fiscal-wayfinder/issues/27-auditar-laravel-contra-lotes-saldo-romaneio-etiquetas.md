# Auditar a implementação Laravel após as decisões de lotes e pós-emissão

Label: wayfinder:issue
Type: task
Status: resolved
Blocked by: 24-pesquisar-lotes-agrupamentos-e-saldo-parcial-delphi-laravel, 25-definir-reabertura-saldo-pendente-pos-emissao, 26-confirmar-romaneio-e-etiquetas-de-volumes-no-delphi

## Question

Depois de resolvidas as três investigações anteriores, quais ajustes ainda faltam no Laravel para que o caminho completo da Transferência preserve agrupamentos, atendimento parcial, romaneio, volumes e etiquetas sem duplicar emissão ou estoque?

## Required output

Comparar o estado atual do Laravel com as decisões fechadas e produzir um ou mais prompts `/speckit.specify` em `modules/interlojas/transferencia-requisicao-emissao-fiscal/`. Cada prompt deve declarar explicitamente:

- o que já está implementado e não deve ser refeito;
- o que pertence à Transferência e o que pertence ao módulo posterior de Notas Fiscais Avulsas/Confirmação por Romaneios;
- contratos, transações, locks, idempotência, estados e permissões;
- comportamento de sucesso parcial e retry;
- geração de PDF, inclusão em romaneio e impressão de etiquetas, sem pressupor impressão automática se a decisão 26 não confirmar isso;
- critérios de aceite e testes.

Do not implement code in this ticket; publish prompts only after the blocking decisions are resolved.

## Answer

Auditoria concluída contra o estado atual do Laravel, as specs do módulo e os
tickets 24–26.

### Confirmado como implementado — não reabrir

- `TransferenciaFiscalFormarGruposService` forma uma NF por filial
  requisitante; `lotetransferencia` permanece metadado operacional e não
  separa a NF.
- A confirmação e a emissão relêem as linhas atuais e usam `FOR UPDATE` no
  conjunto ordenado; não há fallback produtivo para o payload da tela.
- A classificação por `pedidosfiliais.dadofiscal`, idempotência, pendência
  durável, numeração compartilhada, outbox, projeção legada e retry sem nova
  emissão já estão no pipeline comum.
- A confirmação fecha a linha original, aplica os movimentos já existentes e,
  quando o parâmetro está ativo, cria uma nova linha aberta por saldo positivo,
  com `codigoorigem`, `dadofiscal` nulo e TEP quando aplicável. A chamada atual
  ainda precisa receber a observação de saldo definida no ticket 24; isso foi
  incluído no prompt 40 como ajuste residual.
- A projeção atual persiste a linha fiscal em `volumesdadosfiscais`, mas não
  realiza o handoff de romaneio nem gera PDF de etiquetas.

### Lacunas que justificam os prompts publicados

1. O Laravel não oferece, após a NF existir, a escolha Delphi de não incluir,
   incluir em romaneio existente ou criar novo, nem grava os modos 1/2 em
   `dadosfiscais.modoinclusaoromaneio` ou o vínculo idempotente em
   `romaneiosnotas`.
2. O Laravel não expõe a decisão e o resultado por documento no fluxo de
   múltiplos grupos, nem possui pendência/retry específico para uma falha de
   inclusão após a NF estar concluída.
3. O Laravel não oferece o PDF de etiquetas de volumes. A expansão deve usar
   `volumesdadosfiscais`, uma etiqueta por volume, com fallback para uma
   etiqueta quando a linha existente tiver quantidade nula/zero; não deve
   iniciar impressão automática.

Foram publicados:

- `modules/interlojas/transferencia-requisicao-emissao-fiscal/40-speckit-prompt-specify-pos-emissao-romaneio-volumes.md` — contrato de handoff,
  romaneio, modo legado, volumes, idempotência, pendências e integração da
  tela;
- `modules/interlojas/transferencia-requisicao-emissao-fiscal/41-speckit-prompt-specify-pdf-etiquetas-volumes-transferencia.md` — PDF de
  etiquetas por volume, autorização, expansão, nova aba e exclusões.

As operações posteriores de conferência pertencem a Confirmação por Romaneios;
cancelamento/inutilização continuam em Estoque → Notas Fiscais Avulsas. Não
foi alterado código Laravel.
