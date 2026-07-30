# Estorno de Pagamento em Lote de Duplicatas

Label: wayfinder:map

## Destination

Produzir, em `modules/financeiro/contas-pagar/estorno-pagamento-em-lote/`, um dossiê específico e um prompt `/speckit.specify` autocontido para implementar no Laravel o Estorno de Pagamento em Lote, com paridade ao Cadastro de Contas a Pagar Delphi e simetria com a Quitação em Lote já implementada.

## Notes

- Usar **Estorno do Pagamento** como termo canônico; “cancelamento de quitação” aparece apenas ao referenciar nomes legados.
- Fontes Delphi principais: `C:/projetos.vcl/apps/contaspagar/dmcancelamentoquitacao.pas/.dfm` e `fmcancelamentoquitacao.pas/.dfm`; consultar `dmcontaspagar.pas/.dfm`, `fmcontaspagar.pas/.dfm`, `dmquitacaoduplicatas.pas/.dfm` e `dmautorizacaopagamento.pas/.dfm` quando alcançáveis e necessárias.
- Analisar o Laravel vigente, especialmente `specs/277-quitacao-lote-duplicatas`, `specs/247-quitacao-duplicata`, `specs/254-quitacao-duplicata-bank`, os manifestos financeiros, ADR-0246, ADR-0247/0255, ADR-0254 e ADR-0277.
- O Estorno em Lote aceita uma ou várias Duplicatas quitadas e é atômico: qualquer falha deixa todas inalteradas.
- Preservar a simetria com a Quitação em Lote e reutilizar seus módulos profundos, locks, idempotência, reconciliação, Contabilidade, tributos, Auditoria e UX; não criar um segundo motor financeiro.
- Quem possui a autorização vigente para quitar também pode estornar; não criar uma permissão funcional separada apenas para o Estorno em Lote.
- O motivo do Estorno é obrigatório, como no Cadastro de Contas a Pagar, e integra prova, idempotência e Auditoria.
- Cada Duplicata estornada transita de `PAID` para `AUTHORIZED`, preservando sua identidade e a Autorização de Pagamento aplicável.
- Uma seleção pode estornar somente parte de uma quitação original com cheque único. Nesse caso, reconstruir atomicamente o movimento compartilhado: remover eventos estornados, recalcular o cabeçalho pela soma dos eventos restantes, preservar sua identidade e vínculos, e excluir o cabeçalho apenas quando não restar evento.
- Classificar evidências como `CONFIRMADO`, `INFERIDO`, `DÚVIDA`, `NÃO LOCALIZADO`, `DIVERGENTE`, `POSSÍVEL BUG LEGADO` ou `OPORTUNIDADE`.
- Este mapa produz planejamento e especificação; não altera o Delphi nem implementa o Laravel.

## Decisions so far

<!-- Uma linha por ticket resolvido: link, título e síntese. -->

- [Inventariar a interface e o fluxo do Estorno do Pagamento no Delphi](issues/01-inventariar-interface-fluxo-delphi.md) — confirmou filtros, seleção, totais, F6/F5 e a mesma autoridade usada para quitar; motivo obrigatório, preview atômico e reconstrução parcial sem expansão são requisitos novos, não paridade comprovada.
- [Inventariar as regras e os efeitos do Estorno do Pagamento no Delphi](issues/02-inventariar-regras-efeitos-delphi.md) — confirmou reautorização da Duplicata e reconstrução de banco/Contabilidade compartilhados, mas revelou processamento por item sem atomicidade, ausência de motivo/auditoria explícitos e lacuna sobre residual.
- [Inventariar o Estorno e os manifestos financeiros atuais no Laravel](issues/03-inventariar-laravel-atual.md) — encontrou Estorno individual e reconstrução parcial de `SINGLE_CHECK` já existentes; faltam orquestração batch, preview/UI, reconciliação de lote e testes PostgreSQL executáveis.
- [Definir o contrato transacional do Estorno de Pagamento em Lote](issues/04-definir-contrato-estorno-lote.md) — fixou preview/confirm e motor reversível compartilhado, seleção/dependências atômicas, restauração exata de residual/desconto, adoção legada determinística e reconstrução única por agregado com idempotência e reconciliação.
- [Definir a UX, a segurança, a reconciliação e os testes do Estorno em Lote](issues/05-definir-ux-seguranca-reconciliacao-testes.md) — definiu página própria, lista virtualizada sem paginação até 2.000 itens, dependências explícitas, proof com Permissão Pagamento, retomada segura, dupla reconciliação, testes reais e rollout por gates.
- [Consolidar o dossiê e o prompt Speck/Specify do Estorno em Lote](issues/06-consolidar-dossie-prompt-speckit.md) — reuniu evidências, matriz de mudanças, requisitos, testes e fases em dossiê rastreável e prompt autocontido pronto para `/speckit.specify`.

## Not yet specified

Nenhuma decisão conhecida permanece em aberto antes de `/speckit.specify`.

## Out of scope

- Alterar o Delphi.
- Reespecificar a Quitação individual, a Quitação em Lote ou a Autorização de Pagamento além das adaptações compartilhadas necessárias ao Estorno.
- Estornar operações que não sejam pagamentos de Duplicatas de Contas a Pagar.
