# Confirmar evidência física e classificar os tipos de lançamento de autenticacoes

Type: task
Status: resolved
Blocked by:

## Question

Analisando conjuntamente `apps/caixa/dmfechamentocaixa.pas`/`.dfm` e `apps/caixa/fmfechamentocaixa.pas`/`.dfm` (incluindo a query completa de `qryAutenticacoes`, a query UNION completa de `qryTotalizacoesCaixa` — só lida parcialmente até agora —, `qryResumoVendas`, `qryRenegociado`/`qryOrigem`, `qryEventos`, `qryRecebimentos`/`qryTiposRecebimentos`, `qryTransferenciaNaoConfirmada`), qual é o schema completo e comprovável de `autenticacoes`, `usuarios` (campos relacionados a caixa) e `eventos`: colunas, tipos, os 13+ valores de `a.tipo` (P/D/N/A/B/C/H/S/E/J/R/G/T/F) e o que cada um representa, chaves estrangeiras para `contratos`/`parcelas`/`cheques`/`documentospag`/`bancos`/`motivos`/`vfornecedores`/`usuarios`, e as regras de derivação (ex.: `caixaaberto`, documentos entrada vs. saída por comparação de saldo)?

## Answer

Evidência completa lida em `dmfechamentocaixa.dfm` (SQL das 9 queries) e `biblio/clusuario.pas` (estado de caixa no Usuário). Todas as classificações abaixo são CONFIRMADO por SQL/Object Pascal explícito, salvo indicação contrária.

### `usuarios` — campos de Caixa (CONFIRMADO, `clusuario.pas` + `qryCaixas`)

"Caixa" não é entidade própria: `qryCaixas`/`qryConsultaCaixas` fazem `SELECT ... FROM usuarios WHERE codigo=:codigo`. Campos:

- `codigo` (PK, é o próprio código do "caixa")
- `nome`
- `dataaberturacaixa` (date)
- `datafechamentocaixa` (date)
- `caixaaberto` — **não é coluna física**, é sempre derivado: `(dataaberturacaixa > datafechamentocaixa) AND (dataaberturacaixa = current_date)`
- Perfil booleans usados neste fluxo: `gerentecaixa`, `administrador`, `suporte` (já existem em Laravel — `caixa`/`gerentecaixa` na migration `2026_04_02_000001_align_usuarios_perfil_booleans_sqlite.php`; `administrador`/`suporte` não confirmados nesta lista, DÚVIDA para o ticket 03)
- `PermiteAbrirCaixa` (`clusuario.pas:579`) = `FCaixaAberto and (FDataAberturaCaixa = FDataLocal)` — o nome sugere "permitir abrir", mas a implementação testa se **já está** aberto na data local; POSSÍVEL BUG LEGADO/nome enganoso a esclarecer no ticket 03.

### `autenticacoes` — ledger (CONFIRMADO, `qryAutenticacoes` + predicados de `qryTotalizacoesCaixa`)

Colunas confirmadas: `numero` (PK), `data`, `hora`, `filial`, `caixa` (FK `usuarios.codigo`, operador que lançou), `autenticacao` (auto-FK: número da autenticação que ESTA cancela, quando `tipo='C'`), `banco` (FK `bancos.codigo`), `cheque` (FK `cheques.numero`), `contrato` (texto), `contratoparcela` (referencia `contratos.numero` via texto), `parcela` (FK `parcelas.numero`), `evento` (FK `eventos.codigo`), `historico`, `motivo` (FK `motivos.codigo`), `nota`, `parametros` (texto livre), `saldo` (saldo acumulado do caixa após o lançamento — base da derivação entrada/saída de Documentos e do Saldo Atual), `situacao` (bool), `tipo` (char(1), ver tabela abaixo), `transferencia` (FK `usuarios.codigo`, caixa de origem/destino de transferência), `entradapendente` (bool), `confirmacao` (bool nullable), `valor`, `valorvenctoparcela` (nullable, cai para `parcelas.valorvencto` via `coalesce`), `documentopag` (FK `documentospag.numero`), `numeroduplicata` (referencia `duplicatas.numero`), `venctoduplicata`, `cliente`/`tipocliente` (também reaproveitado como devedor em devolução), `transacao` (correlaciona com `recebimentos.transacao` para os lançamentos tipo `T`), `cancelada` (bool — usado só em `qryEventos`), `alterandoevento` (bool, setado pelo update de reclassificação).

**Tipos de `a.tipo` — são 14, não 13**: o comentário-fonte em `dmfechamentocaixa.pas` (linhas 228-243) documenta P/D/N/A/B/C/H/S/E/J/R/G/T/F mas **omite `U`**, que existe e é somado em `qryTotalizacoesCaixa` (`WHERE a.tipo in ('U')` → `AjustSldDevTroca`). DIVERGENTE (gap de documentação Delphi, não do Laravel).

| tipo | significado | evidência de agregação |
|---|---|---|
| P | Prestação (recebimento de parcela) | soma `a.valor` |
| F | Frente de Caixa (recebimento) | somado junto com P em todos os totais |
| D | Documento — entrada OU saída | sinal decidido comparando `a.saldo` com o saldo do lançamento cronologicamente anterior do mesmo caixa/filial; maior = entrada, menor = saída (não há flag própria de direção) |
| N | Devolução de numerário | soma `a.valor` |
| A | Devolução de saldo de troca | soma `a.valor` |
| B | Depósito bancário | soma `a.valor` |
| C | Cancelamento (autenticação que cancela outra) | conta `count(*)` |
| H | Cheque — a vista/prazo/não identificado | à vista: `c.data >= c.vencto`; prazo: `c.data < c.vencto`; não identificado: `a.cheque is null` |
| S | Transferência de saída | soma só quando `confirmacao = true`; pendente = `entradapendente=true and confirmacao is null` (ver `qryTransferenciaNaoConfirmada`) |
| E | Transferência de entrada | soma `a.valor` |
| J | Perdas | soma `a.valor` |
| R | Resgate de cheque | soma `a.valor` |
| G | Duplicata de fornecedor | soma `a.valor` |
| T | Cartão/PIX/Crédito de Troca | **não soma `a.valor` diretamente** — soma `recebimentos.valorlancto` via `recebimentos.transacao = autenticacoes.transacao`, filtrando `tiposrecebimentos.tiporecebimento in ('C','B')` (Cartão) ou `= 'P'` (Pix) |
| U | Ajuste de saldo de devolução/troca | soma `a.valor` — DIVERGENTE, não documentado no comentário Delphi |

Exclusão de cancelados: em quase toda subquery, `Not Exists (select a1.numero from autenticacoes a1 where a.numero = a1.autenticacao)` — uma autenticação é tratada como cancelada se existe outra (tipo `C`) cujo campo `autenticacao` aponta pra ela. Isso é uma segunda forma de saber "está cancelado", paralela ao boolean `cancelada` usado em `qryEventos`. DÚVIDA a levar ao ticket 04/06: as duas fontes (auto-join vs. `cancelada`) são sempre consistentes, ou há um gap de sincronismo?

### `eventos` (CONFIRMADO, `qryEventos`)

`codigo` (PK), `descricao`, `parametros`, `valor`, `tipomovimentacao` (char 'E'/'S' — entrada/saída; filtra a reclassificação a `tipomovimentacao in ('E','S')` e restringe a busca de eventos pelo `CondicoesEvento` do form).

### `recebimentos` / `tiposrecebimentos` (CONFIRMADO, `qryRecebimentos`/`qryTiposRecebimentos`)

`recebimentos`: `transacao` (correlaciona com `autenticacoes.transacao`), `tiporecebimento` (FK `tiposrecebimentos.codigo`), `valorlancto`, `datalancto`, `filial`, `situacao` ('N' = não cancelado). `tiposrecebimentos`: `codigo`, `descricao`, `tiporecebimento` (char 1: `B`=Cartão Débito, `C`=Cartão Crédito, `D`=Dinheiro, `H`=Cheque, `T`=Crédito de Troca, `P`=Pix — só `B`/`C`/`P` entram na totalização do Fechamento).

### Derivações confirmadas

- `caixaaberto` = `(dataaberturacaixa > datafechamentocaixa) AND (dataaberturacaixa = current_date)`.
- Documento entrada vs. saída (tipo `D`): comparação cronológica de `a.saldo` (`data_hora_tz` do lançamento anterior mais recente do mesmo caixa/filial) — maior = entrada, menor = saída.
- Cheque à vista vs. a prazo: `c.data >= c.vencto` vs. `c.data < c.vencto`, via join com `cheques`.
- Renegociação: `contratos.primogenito` preenchido identifica um contrato renegociado; `parcelas.origempagto` liga a parcela nova à parcela de origem no contrato "primogênito" (`qryOrigem`).
- Saldo Atual do caixa: `a.saldo` do lançamento de maior `numero` na data pesquisada; se não houve nenhum lançamento na data, cai para o `saldo` do último lançamento anterior a ela.
- **DIVERGÊNCIA/POSSÍVEL BUG a levar ao ticket 06**: o Saldo Atual é calculado de duas formas diferentes — (1) `GetSaldoAtual` em `dmfechamentocaixa.pas` soma aritmeticamente saldo anterior + entradas − saídas a partir dos totais agregados, e (2) a última subquery do UNION pega o `saldo` físico gravado no último registro de `autenticacoes`. As duas podem divergir se algum tipo de lançamento (ex. `C` cancelamento, que não entra em nenhuma soma de entrada/saída) alterar o `saldo` físico sem estar refletido nos totais somados. Precisa decidir, no ticket 06, qual das duas fontes é a verdade no Laravel.

