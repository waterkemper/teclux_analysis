# Paridade da Quitação em Lote de Duplicatas em Contas a Pagar

Label: wayfinder:map

## Destination

Produzir, em `modules/financeiro/contas-pagar/quitacao-em-lote/`, um dossiê específico e um prompt `/speckit.specify` autocontido para implementar no Laravel a tela completa de Quitação em Lote, preservando o fluxo alcançável do Delphi e aprofundando os componentes financeiros compartilhados já existentes, inclusive pagamento parcial, agrupamento opcional por cheque e conciliação bancária.

## Notes

- Fontes Delphi principais: `C:/projetos.vcl/apps/contaspagar/dmquitacaoduplicatas.pas/.dfm`, `fmquitacaoduplicatas.pas/.dfm` e a função `QuitarDuplicatas` de `dmcontaspagar.pas`; seguir outras units somente quando alcançáveis e necessárias para fixar o contrato.
- Analisar sempre o Delphi e o Laravel atuais antes de decidir. No Laravel, partir especialmente de `specs/196-contas-pagar-quitacao`, `PayDuplicatasBatchAdapter`, commands, writer bancário, repositories, Policies, autorização sensível, idempotência, reconciliação, UI e testes já implementados.
- Reutilizar os artefatos e decisões de `modules/financeiro/contas-pagar/quitacao-duplicata/`, `modules/financeiro/contas-pagar/autorizacao-pagamentos/`, ADR-0246 e ADR-0247; não criar uma segunda implementação da Quitação individual.
- Somente Duplicatas com Autorização de Pagamento vigente podem integrar o lote. Qualquer item não autorizado, já pago, incompatível ou alterado concorrentemente invalida o lote inteiro no servidor.
- O lote é atômico. Todas as decisões interativas são coletadas antes da persistência; **Cancelar** durante a análise de pagamento parcial encerra a operação sem efeitos.
- Quando `previsão < valor vencto`, oferecer **Cancelar**, **Gerar outra parcela** e **Desconto Obtido**, seguindo o contrato já existente no Cadastro de Contas a Pagar e confirmando no legado os cálculos e efeitos exatos.
- Com agrupamento por cheque, criar um único `movtosbancos` pelo total e um `movtosbancoseventos` por Duplicata, persistindo em cada Duplicata suas chaves `sequencia` e `sequenciaevento`. Sem agrupamento, cada Duplicata possui cabeçalho e evento próprios.
- Rastrear `tipopagamento`, `contapagto`, `datapagto`, `valorpagto`, cheque, Filial, autorização, parâmetros, filtros, seleção, previsão, valor de vencimento, parcial/residual/desconto, Contabilidade, tributos, Auditoria e conciliação.
- Classificar evidências como `CONFIRMADO`, `INFERIDO`, `DÚVIDA`, `NÃO LOCALIZADO`, `DIVERGENTE`, `POSSÍVEL BUG LEGADO` ou `OPORTUNIDADE`.
- Respeitar ADR-0002 (UI ERP), ADR-0005 (Parâmetros do Sistema), ADR-0007 (schema fail-fast), ADR-0246 (comandos financeiros) e ADR-0247 (Duplicata paga imutável e Estorno único).
- Este mapa gera planejamento e especificação; não altera Delphi nem implementa Laravel.

## Decisions so far

<!-- Uma linha por ticket resolvido: link, título e síntese. -->

- [Inventariar a interface e o fluxo da Quitação em Lote no Delphi](issues/01-inventariar-interface-fluxo-delphi.md) — confirmou a jornada filtros → revisão detalhada/agrupada → dados comuns → F5, previsão editável, marcação/totais, cheque único separado do agrupamento, impressão e lacunas de feedback/loop parcial no form.
- [Inventariar as regras e os efeitos financeiros da Quitação em Lote no Delphi](issues/02-inventariar-regras-efeitos-delphi.md) — fixou elegibilidade/autorização, cálculo e parcial, campos e parâmetros, bancos/Contabilidade/tributos, e demonstrou que o legado commita por Duplicata e pode deixar lote parcialmente quitado.
- [Inventariar a Quitação em Lote já existente no Laravel](issues/03-inventariar-laravel-atual.md) — confirmou um núcleo individual reutilizável, mas lote reduzido a loop não atômico e sem UI/rota, além de lacunas em parcial, proof, agrupamento/vínculos bancários, Contabilidade, Auditoria e testes reais.
- [Definir o contrato transacional da Quitação em Lote](issues/04-definir-contrato-quitacao-lote.md) — decidiu interface profunda preview/confirm, motor individual compartilhado, preflight e locks do conjunto, idempotência batch, parcial explícito, agregado bancário por cheque e manifesto reversível atômico/auditado.

- [Definir a UX, o agrupamento bancário, a reconciliação e os testes](issues/05-definir-ux-agrupamento-reconciliacao-testes.md) — fixou página completa, seleção explícita, prévia e loop parcial, separação dos agrupamentos, reconciliação transacional, retomada idempotente, impressão pós-commit e matriz executável de testes.

- [Consolidar o dossiê e o prompt Spec Kit da Quitação em Lote](issues/06-consolidar-dossie-prompt-speckit.md) — entregou dossiê canônico e prompt autocontido para `/speckit.specify`, com reanálise obrigatória do Laravel atual, requisitos, contratos, UX, testes, fases, aceite e proibições.

## Not yet specified

- Nenhuma. O caminho até a especificação está consolidado.

## Out of scope

- Implementar o Laravel durante este Wayfinder.
- Alterar o Delphi.
- Reimplementar ou substituir a Quitação individual quando seus componentes puderem ser reutilizados.
- Reespecificar a Autorização de Pagamento em lote, exceto seu contrato de consumo pela Quitação.
- Permitir edição de Duplicata paga ou introduzir operação diferente do Estorno do Pagamento após a Quitação.
- Migrar remessa, retorno bancário ou relatórios não acionados pelo fluxo de Quitação em Lote.
