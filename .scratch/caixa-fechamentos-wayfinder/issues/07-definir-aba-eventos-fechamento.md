# Definir a aba Eventos do Fechamento

Type: grilling
Status: resolved
Blocked by: 03, 05

## Question

Como migrar a aba Eventos do Fechamento — grid editável de autenticações do dia com reclassificação do campo `evento`, restrita a quem tem `GerenteCaixa`, com autorização sensível por senha (`ObterAutorizacao`) antes de persistir, e a marca `alterado` controlando quais linhas realmente são gravadas (`SalvarEventos`) — incluindo o atalho F5/botão Salvar e o comportamento de `AfterOpen`/`AfterInsert` (inserção cancelada, não é permitido criar autenticação nova por aqui)?

## Answer

### Evidência de colunas (CONFIRMADO, `fmfechamentocaixa.dfm`)

O grid (`dbgEventos`) tem 5 colunas: `evento` (editável — via lookup Ctrl+F9/`ConsultaEvento` ou digitação direta do código), `descricao` (somente leitura — auto-derivada do join com `eventos`, ou formatada como "Dupl. X-Y Romaneio Z" quando a autenticação tem `documentopag`/`numeroduplicata` preenchidos), `valor` (somente leitura), `parametros` (**editável**, texto livre), `alterado` (somente leitura, indicador visual). Confirma-se que **duas colunas são editáveis por linha**: `evento` e `parametros`.

### Comportamento confirmado a replicar

- Só carrega autenticações do dia com `not a.cancelada and e.tipomovimentacao in ('E','S')` (ver ticket [Definir o domínio de Eventos](05-definir-dominio-eventos.md) para o lookup de Eventos reaproveitado).
- `AfterInsert` cancela imediatamente qualquer tentativa de inserção — o grid é **só para reclassificar linhas existentes**, nunca para criar novas autenticações.
- `BeforePost` marca `alterado := true` na linha (qualquer edição de `evento` ou `parametros` conta).
- `AfterOpen` desabilita edição inteira quando o usuário logado não é Gerente de Caixa (`ReadOnly := not GerenteCaixa`).
- Botão Salvar/F5 fica desabilitado até a primeira edição (`sbnSalvar.Enabled` liga no primeiro `AfterPost`, desliga de novo após salvar com sucesso).

### Decisão: edição em lote, uma autorização

O Laravel replica o modelo de edição em lote do Delphi: o usuário pode reclassificar `evento`/`parametros` em várias autenticações antes de salvar; uma única ação "Salvar" grava **todas** as linhas alteradas numa transação, gated por **uma única** autorização sensível (senha de Gerente de Caixa, via `SensitiveOperationAuthService` — ver ticket [Mapear Parâmetros e Autorizações](02-mapear-parametros-e-autorizacoes.md)) cobrindo o lote inteiro, não uma autorização por linha. Evita fricção repetida de senha, que seria pior UX que o próprio legado.
