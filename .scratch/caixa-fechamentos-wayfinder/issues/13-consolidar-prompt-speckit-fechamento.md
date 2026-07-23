# Consolidar o prompt SpecKit — Fechamento de Caixa

Type: task
Status: resolved
Blocked by: 12, 06, 07, 08, 09, 11

## Question

Como consolidar as decisões de totalização (06), aba Eventos (07), ação Fechar Caixa (08), PDF (09) e os critérios de aceite/testes relevantes (11) num prompt autocontido para `/speckit.specify`, publicado em `modules/caixa/fechamentos/02-speckit-prompt.md`, construído sobre a Fundação já especificada em `modules/caixa/fechamentos/01-speckit-prompt.md` (ticket 12), no mesmo formato dos demais prompts SpecKit do repositório?

## Answer

Consolidado em [`modules/caixa/fechamentos/02-speckit-prompt.md`](../../../modules/caixa/fechamentos/02-speckit-prompt.md), construído explicitamente sobre a Fundação de Caixa (`01-speckit-prompt.md`). Cobre a matriz dourada de totalização (com a fórmula única de Saldo Atual e os dois cálculos independentes de juros/descontos), a aba Eventos (edição em lote, duas colunas editáveis), a ação Fechar Caixa (ordem de 7 passos, 4 guardas, segunda autorização condicional) e o PDF (Blade + Browsershot, seções condicionais, sem `NumeroCopias`). Declara fora de escopo a Fundação em si, as telas de lançamento e qualquer integração ECF/impressora física/TEF.

Com este ticket, o mapa está concluído — os dois prompts SpecKit da Fundação e do Fechamento de Caixa estão publicados e prontos para o Cursor.
