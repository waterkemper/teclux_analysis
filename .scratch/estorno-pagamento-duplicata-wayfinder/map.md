# Imutabilidade Pós-Pagamento e Estorno da Duplicata

Label: wayfinder:map

## Destination

Revalidar o Delphi e o Laravel atual e atualizar `modules/financeiro/contas-pagar/quitacao-duplicata/dossie.md` e `speckit-prompt.md` para estabelecer que, após a Quitação, a Duplicata é imutável e a única operação permitida é o Estorno do Pagamento, que desfaz atomicamente os fatos da Duplicata e elimina seus `movtosbancos`/`movtosbancoseventos`, sem oferecer Refazer Pagamento ou edição pós-pagamento.

## Notes

- Regra informada: após o pagamento, nenhuma alteração cadastral ou financeira é permitida na Duplicata; somente Estorno do Pagamento.
- No estorno devem ser eliminados ao menos data de pagamento, tipo de pagamento, conta de pagamento e valor pago, além dos movimentos bancários vinculados.
- Verificar no Delphi e no Laravel quais campos correlatos também precisam ser limpos para não deixar vínculo órfão: cheque, Filial de Pagamento, Evento, `sequencia`, `sequenciaevento`, conta contábil, usuário, lote e auxiliares.
- Verificar efeitos tributários e contábeis alcançáveis, sem ampliar o escopo além do necessário para um estorno atomicamente consistente.
- Confrontar especialmente `CancelarQuitacao`/`DesQuitarDuplicatas` no Delphi e `CancelDuplicataPaymentCommand`, `RebuildDuplicataPaymentCommand`, FormRequests, rotas, Policies/abilities, UI e testes no Laravel.
- O contrato anterior de Refazer Pagamento em `.scratch/quitacao-duplicata-vinculo-bancario-wayfinder/` e nos artefatos canônicos deve ser revogado onde conflitar com esta regra.
- O termo canônico é **Estorno do Pagamento**; **Cancelamento da Quitação** é nome legado e **Exclusão** permanece restrita à remoção cadastral.
- Analisar sempre o Laravel e o Delphi atuais antes de propor ajustes; reutilizar commands, writer, repositories, transação, Filiais, proof, idempotência e reconciliação existentes.
- Classificar evidências como `CONFIRMADO`, `INFERIDO`, `DÚVIDA`, `NÃO LOCALIZADO`, `DIVERGENTE`, `POSSÍVEL BUG LEGADO` ou `OPORTUNIDADE`.
- Este mapa planeja e atualiza a especificação; não implementa Laravel nem altera Delphi.

## Decisions so far

- [Atualizar o domínio, o dossiê e o prompt Spec Kit](issues/05-atualizar-dominio-dossie-prompt.md): vocabulário, dossiê, prompt e ADR-0247 agora fixam `PAID -> AUTHORIZED` por Estorno único, reutilização do Laravel atual, remoção de Refazer e tratamento fail-safe do histórico.

- [Definir a superfície Laravel e os testes da regra pós-pagamento](issues/04-definir-superficie-testes-migracao.md): substituir Cancel por Estorno, remover Refazer sem alias, impor guard backend/UI, habilitar históricos somente após preflight seguro e exigir testes PostgreSQL reais de vínculos e agregados.

- [Definir o estado imutável e o contrato do Estorno do Pagamento](issues/03-definir-estado-e-contrato-estorno.md): `PAID` só admite Estorno para `AUTHORIZED`, com reversão atômica e exata dos efeitos, Auditoria persistente e bloqueio seguro de vínculos históricos incompletos ou ambíguos.

- [Inventariar o pós-pagamento no Laravel atual](issues/02-inventariar-laravel-pos-pagamento.md): Cancel e Rebuild existem ponta a ponta; Cancel preserva boas fronteiras transacionais, mas limpa campos/vínculos de forma incompleta, retorna não autorizada e a UI/backend não expressam uniformemente a imutabilidade pós-pagamento.

- [Inventariar o pós-pagamento e o estorno no Delphi](issues/01-inventariar-delphi-pos-pagamento-estorno.md): o fluxo normal só permite cancelar, retorna a Duplicata a autorizada/não paga e desfaz bancos/Contabilidade de forma agrupada; há um bypass legado divergente de Refazer e lacunas de limpeza individual que não devem ser reproduzidas.

<!-- Uma linha por ticket resolvido: link, título e síntese. -->

## Not yet specified


## Out of scope

- Alterar o Delphi.
- Implementar a mudança Laravel durante este Wayfinder.
- Permitir edição da Duplicata paga.
- Manter Refazer Pagamento como operação disponível ao Usuário, inclusive para suporte/administrador.
- Reespecificar a criação ou autorização da Duplicata fora do estado resultante do Estorno.
- Corrigir silenciosamente movimentos bancários históricos ambíguos.
