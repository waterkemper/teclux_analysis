# Definir o schema e o domínio do ledger autenticacoes

Type: grilling
Status: resolved
Blocked by: 01

## Question

Como modelar `autenticacoes` no domínio Laravel como ledger somente-leitura nesta entrega — entidade/value objects por tipo (`P/D/N/A/B/C/H/S/E/J/R/G/T/F`), relação com as entidades já existentes ou ainda não migradas (Contratos/Parcelas, Cheques, Documentos a Pagar, Bancos, Motivos, Fornecedores), e a fronteira exata entre "schema e leitura definidos agora" e "escrita implementada por specs futuros" para cada tipo?

## Answer

### Estado Laravel confirmado para as entidades relacionadas

A maior parte do grafo de relações de `autenticacoes` **já existe** no Laravel (CONFIRMADO por grep no checkout):

| Entidade Delphi | Estado Laravel |
|---|---|
| `contratos`/`parcelas` | `ContratoCadastro` + `LegacyContratoParcelasRepository`/`LegacyParcelasLogRepository` — existe |
| `bancos` | `BancoCadastro` + `LegacyBancoRepository` — existe |
| `motivos` | `LegacyMotivoRepository` — existe |
| `documentospag`/`duplicatas` | `LegacyDocumentoPagRepository`/`LegacyDuplicataRepository` — existe |
| `vfornecedores` (cliente/fornecedor devedor) | `Fornecedor`, `LegacyClienteRepository`/`LegacyContatosVfornecedoresRepository` — existe |
| `eventos` | Cadastro completo: `EventoCadastro` + `EventosController` + `EventoCadastroPolicy` — existe, reaproveitável |
| `tiposrecebimentos` | Cadastro completo: `TipoRecebimentoVenda`, com o mesmo enum `tiporecebimento` (`D/C/B/H/T/P`) do Delphi — existe, reaproveitável |
| `cheques` | **Não existe nenhum repositório Laravel** — lacuna real |
| `recebimentos` (ledger de transações, distinto de `tiposrecebimentos`) | **Não existe nenhum repositório Laravel** — lacuna real |

### Decisões

1. **Escopo de leitura inclui `cheques` e `recebimentos`**: mesmo sendo lacunas novas, a Fundação de Caixa define um repositório de leitura mínimo para as duas (campos usados pelo Fechamento: `cheques.vencto`/`data`/`cliente`/`tipocliente`; `recebimentos.transacao`/`tiporecebimento`/`valorlancto`/`datalancto`/`filial`/`situacao`) — sem essas duas leituras, nenhuma totalização de Fechamento (tipos H e T) é possível. Continua tudo somente-leitura, sem CRUD de cheques/recebimentos.
2. **Forma do repositório**: segue o padrão dominante já estabelecido no checkout — um `LegacyAutenticacaoRepository` fino (mesma família dos `Legacy*Repository` existentes), com métodos de leitura tipados por finalidade (equivalentes às queries Delphi: por caixa/data/filial, por tipo, para totalização). Os 14 valores de `tipo` (`P/F/D/N/A/B/C/H/S/E/J/R/G/T/U` — ver ticket [Confirmar evidência física](01-confirmar-evidencia-fisica-e-tipos-lancamento.md) para a lista completa) viram uma constante/enum de leitura, **não** uma classe de domínio por tipo — evita over-engineering para algo ainda somente-leitura.
3. **Fronteira schema+leitura vs. escrita**: confirmada para todos os 14 tipos — a Fundação só lê; a escrita de cada tipo (Frente de Caixa, Controle de Recebimentos, Estorno, Cheques/Recebimentos, Depósitos, Transferências, Duplicatas, Perdas, Devoluções, Renegociação, Quitação Extra) fica para specs futuros do app Caixa, fora deste mapa (ver Notes/Out of scope do mapa).
4. **Predicado de cancelamento**: o repositório de leitura deve replicar o predicado Delphi (`Not Exists (select a1.numero from autenticacoes a1 where a.numero = a1.autenticacao)`) como o filtro padrão de "não cancelado" nas consultas agregadas, já que é o que a totalização usa de fato. O boolean `cancelada` (usado só em `qryEventos`) fica exposto como campo, mas sua consistência com o auto-join segue como DÚVIDA em aberto para o ticket de totalização (06).
