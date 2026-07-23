# Classificar as lacunas Delphi–Laravel do Caixa e do Fechamento

Type: task
Status: resolved
Blocked by: 03, 04, 05, 06, 07, 08, 09

## Question

Consolidando as decisões de 03 a 09, quais lacunas exatas existem hoje entre o Delphi e o estado atual do Laravel (nada implementado) para a Fundação de Caixa e o Fechamento de Caixa, classificadas como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO, DIVERGENTE, POSSÍVEL BUG LEGADO ou DECISÃO NOVA, com evidência concreta de arquivo/trecho para cada uma?

## Answer

### CONFIRMADO — schema e comportamento Delphi, com evidência de arquivo/trecho

- `usuarios` já carrega o estado de Caixa (`dataaberturacaixa`, `datafechamentocaixa`, `caixaaberto` derivado) — não existe entidade `caixas` separada (`dmfechamentocaixa.dfm` `qryCaixas`/`qryConsultaCaixas`, ambas `SELECT ... FROM usuarios`).
- `autenticacoes` tem 14 tipos de lançamento (`P/F/D/N/A/B/C/H/S/E/J/R/G/U`), evidenciados pela query UNION completa de `qryTotalizacoesCaixa` (`dmfechamentocaixa.dfm:397-1045`) — ver ticket 01.
- A ação Fechar Caixa (F8) segue ordem fixa de 7 passos (4 guardas → gerar documento → persistir → salvar Eventos condicional), `fmfechamentocaixa.pas:284-324` + `dmfechamentocaixa.pas:263-272` — ver ticket 08.
- A aba Eventos tem duas colunas editáveis (`evento`, `parametros`), nunca permite inserir linha nova, `fmfechamentocaixa.dfm` (colunas de `dbgEventos`) + `dmfechamentocaixa.pas:1784-1788` (`qryEventosAfterInsert` cancela insert) — ver ticket 07.
- 15 Parâmetros do Sistema de negócio (limites, seções do relatório, assinaturas, cópias) resolvem via `FList`, equivalente ao Configuration Center já existente (`clparametrossistema.pas`) — ver ticket 02.
- `GerenteCaixa`, `Administrador`, `Suporte`, `Caixa` (perfil) já existem no Usuário Laravel; `Eventos` e `tiposrecebimentos` (`TipoRecebimentoVenda`) já têm Cadastro completo reaproveitável; a autorização sensível por senha já tem equivalente pronto (`SensitiveOperationAuthService`) — ver tickets 02, 04, 05.
- Stack de PDF (Blade + Browsershot) já estabelecido por `orcamentos-impressao`, e `MoneyDecimal` já estabelecido pelo domínio comercial (Contratos/Orçamentos) — ver tickets 06, 09.

### NÃO LOCALIZADO — lacunas reais, sem equivalente Laravel hoje

- Campos de Caixa no Usuário (`dataaberturacaixa`, `datafechamentocaixa`, `caixaaberto`) — não existem.
- Tabela `autenticacoes` inteira — não existe nenhum repositório/model.
- `cheques` (necessário para classificar Cheque à Vista/Prazo) — nenhum repositório Laravel.
- `recebimentos` (ledger de transações, necessário para classificar Cartão/Pix — distinto de `tiposrecebimentos`, que já existe) — nenhum repositório Laravel.
- Os ~13 telas/fluxos que escrevem `autenticacoes` (Frente de Caixa, Controle de Recebimentos, Estorno, Transferências etc.) — confirmado fora de escopo deste mapa (Notes/Out of scope).

### DIVERGENTE — o próprio Delphi se contradiz

- Duas derivações de `caixaaberto` que discordam entre si (tela de Fechamento exige abertura hoje; objeto `TtecUsuarios` não exige) — resolvido no ticket 03, adotando a mais estrita como canônica.
- Predicado de cancelamento tem duas fontes: o auto-join `Not Exists (...)` (usado por toda a totalização) e o boolean `cancelada` (usado só por `qryEventos`) — ver DÚVIDA abaixo, não foi possível confirmar consistência física entre as duas sem acesso ao banco/triggers ao vivo.

### POSSÍVEL BUG LEGADO — código morto identificado, não replicado

- `if UsuarioLogin.PermiteAbrirCaixa then AbrirCaixa` em `TfrmTecsoft.AbrirCaixa` (`fmtecsoft.pas:552`) é matematicamente inalcançável — `PermiteAbrirCaixa` exige `CaixaAberto=true`, mas o bloco só é entrado quando `CaixaAberto` já é falso.
- `TdtmFechamentoCaixa.GetSaldoAtual` (property) nunca é chamada em lugar nenhum do app.
- A coluna física `saldoatual` calculada pela SQL de `qryTotalizacoesCaixa` nunca é exibida (nem tela, nem relatório) — só o CalcField `Saldo_Atual` é usado de fato.
- O comentário-fonte de `dmfechamentocaixa.pas` (linhas 228-243) documenta 13 tipos de `a.tipo` mas omite o 14º (`U`, Ajuste de Saldo de Devolução/Troca), que existe e é usado na totalização.

### DÚVIDA — não verificável sem acesso ao banco/produção ao vivo

- Se `cancelada` (boolean físico) e o auto-join `Not Exists` são sempre consistentes entre si, ou se há risco de drift entre as duas formas de saber "está cancelado" (provavelmente mantido por trigger de banco, fora do alcance desta análise de código-fonte).
- Se as 15 chaves de Parâmetro do Sistema já existem cadastradas em `parametrosfiliais`/no catálogo do Configuration Center, ou só a infraestrutura genérica existe (a confirmar ao escrever o prompt).

### DECISÃO NOVA — pontos onde o Laravel diverge intencionalmente do Delphi

- Regra de `caixaaberto` fixada na variante mais estrita (exige abertura hoje) — ticket 03.
- `AbrirCaixa`/`ReAbrirCaixa` colapsados num único comando de domínio — ticket 03.
- Segunda autorização sensível (salvar Eventos) só é pedida quando há pendência real, não incondicionalmente a cada Fechamento — ticket 08.
- ECF, impressora matricial, TEF e FastReport saem de escopo — tudo vira um PDF único (Notes do mapa + tickets 06, 09).
- `NumeroCopias` sai da migração — PDF sempre com via única — ticket 09.
- Toda a totalização usa `MoneyDecimal` (decimal), nunca float, mesmo o Delphi usando `Double`/`TFloatField` na maioria dos campos — ticket 06.
