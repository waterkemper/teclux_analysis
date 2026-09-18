# Auditar Contas a Pagar e Movimentos Bancários

Status: resolved

## Resultado

A revisão focada encontrou divergências no fluxo financeiro atual:

- `documentospag.valor` e valores da duplicata usam o valor da confirmação,
  mas o Delphi usa `VlrDesagio`/valor líquido;
- datas e campos operacionais de `documentospag`/`duplicatas` ainda não
  reproduzem toda a rotina capturada;
- mudança de data de confirmação não executa a remoção do evento antigo e a
  criação/relocalização do movimento novo;
- o estorno pode inferir evento por valor quando a identidade não está
  preenchida;
- confirmação faz UPDATE por linha e estorno consulta eventos por movimento,
  contrariando o processamento set-based exigido.

Foi criado o prompt complementar:

- `modules/caixa/controle-recebimentos/08-speckit-prompt-paridade-contas-pagar-movtos-bancos.md`

O prompt exige testes de valor líquido, datas, vínculos de Contas a Pagar,
delta bancário, mudança de data, estorno e ausência de N+1.
