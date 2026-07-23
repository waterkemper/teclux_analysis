# Correção do Vínculo Bancário na Quitação de Duplicata

Label: wayfinder:map

## Destination

Revalidar e atualizar `modules/financeiro/contas-pagar/quitacao-duplicata/dossie.md` e `modules/financeiro/contas-pagar/quitacao-duplicata/speckit-prompt.md` com uma especificação autocontida para corrigir, em todos os fluxos Laravel de quitação e refazimento aplicáveis, o documento e o histórico bancário e a persistência em `duplicatas` das chaves exatas de `movtosbancos` e `movtosbancoseventos`, preservando cancelamento, agregação, concorrência e rastreabilidade.

## Notes

- Motivação observada: o Laravel grava hoje `documentopag` em `movtosbancos.documento`, usa descrições como `Pagto doc ... parc ...` e não persiste `duplicatas.sequenciaevento`.
- Contrato Delphi inicialmente confirmado em `delphi/apps/contaspagar/dmcontaspagar.pas`: `movtosbancos.documento` recebe `duplicatas.chequepagto` quando informado; `duplicatas.sequencia` e `duplicatas.sequenciaevento` identificam o cabeçalho e o evento bancário; cabeçalho e evento usam `getdescricaohistoricopagamento`.
- O histórico Delphi é composto como `[NF|DOC] [complemento] DUP {documentopag}/{numero} - {fornecedor}`; o exemplo esperado sem nota/complemento é `DOC DUP 209120/1 - ANDRA UNIFORMES`.
- No Laravel atual, `PayDuplicataCommand` e `RebuildDuplicataPaymentCommand` chamam `ContasPagarMovimentoBancarioWriter`; `LegacyContasPagarMovtosBancosRepository` já calcula/grava `sequenciaevento`, porém seu retorno expõe somente `sequencia`, impedindo o vínculo completo na Duplicata.
- Analisar sempre o Delphi e o Laravel atuais antes de decidir. Reutilizar commands, writer, repositories, transação, Policies, Filiais, proof, idempotência, reconciliação e testes já implementados.
- Cobrir quitação interativa e refazer pagamento. Verificar lote e retorno como consumidores do mesmo contrato antes de incluí-los ou declarar justificadamente que não passam pelo writer atual.
- Tratar pagamento agregado: cada Duplicata precisa guardar a `sequenciaevento` do evento efetivamente criado para ela, mesmo quando várias Duplicatas compartilham o mesmo cabeçalho `movtosbancos`.
- Verificar o comportamento com `chequepagto` vazio, pagamento por adiantamento, desconto integral, pagamento parcial/residual, integração bancária inativa, cancelamento parcial/total e rebuild.
- Não copiar `MAX+1` desprotegido do legado; a especificação deve exigir alocação concorrente segura e retorno das chaves realmente persistidas.
- Classificar evidências como `CONFIRMADO`, `INFERIDO`, `DÚVIDA`, `NÃO LOCALIZADO`, `DIVERGENTE`, `POSSÍVEL BUG LEGADO` ou `OPORTUNIDADE`.
- Este mapa planeja e atualiza a especificação; não implementa o Laravel nem altera o Delphi.

## Decisions so far

<!-- Uma linha por ticket resolvido: link, título e síntese. -->

- [Fixar o contrato Delphi de vínculo e histórico bancário](issues/01-fixar-contrato-delphi-vinculo-historico.md) — confirmou cheque como documento bancário, descrição individual canônica, cabeçalho agregado genérico e chaves `sequencia`/`sequenciaevento` indispensáveis a pagamento, cancelamento e refazer; isolou fragilidades legadas que não devem ser copiadas.
- [Inventariar o vínculo bancário no Laravel atual](issues/02-inventariar-laravel-atual.md) — confirmou commands/writer reaproveitáveis, mas Pay descarta as chaves, Cancel desfaz por heurística, Rebuild pode duplicar o débito, documento/histórico/agregação divergem e lote/retorno são adapters ainda desconectados e sem cobertura funcional.
- [Definir o contrato seguro da correção bancária](issues/03-definir-contrato-correcao.md) — aprofundou o writer origem `P` com intents/resultados tipados, histórico e cheque server-side, vínculo completo atômico, agregação explícita, estorno exato, rebuild desfazer/reaplicar, locks determinísticos e reconciliação fail-closed.
- [Definir regressão, dados existentes e testes de aceite](issues/04-definir-regressao-dados-testes.md) — decidiu diagnóstico dry-run classificatório, reparo automático apenas por prova única, casos ambíguos fail-closed, rollout gradual e cobertura real de formatter, commands, writer, adapters, UI, PostgreSQL concorrente e saneamento idempotente.
- [Atualizar o dossiê e o prompt Spec Kit da Quitação](issues/05-atualizar-dossie-prompt.md) — incorporou o contrato bancário, saneamento e testes aos artefatos canônicos existentes, produzindo um único prompt autocontido que corrige e aprofunda o Laravel atual sem recriar seus ativos.

## Not yet specified

Nenhuma. O mapa atingiu o destino.

## Out of scope

- Alterar o Delphi.
- Implementar a correção Laravel durante este Wayfinder.
- Reespecificar toda a Quitação de Duplicata além do vínculo e histórico bancário afetados.
- Mudar regras contábeis, tributárias ou de Autorização de Pagamento não impactadas pela correção.
- Confiar em chaves bancárias fornecidas pelo browser ou recriá-las por consulta ambígua após o commit.
