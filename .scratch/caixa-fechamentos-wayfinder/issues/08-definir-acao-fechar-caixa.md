# Definir a ação Fechar Caixa (F8)

Type: grilling
Status: resolved
Blocked by: 03, 04

## Question

Quais são as regras completas e a ordem de execução da ação Fechar Caixa (atalho F8) — bloqueio por transferência não confirmada (`TransferenciaNaoConfirmada`), exigência de que o usuário só feche o próprio caixa, geração do PDF antes de persistir o fechamento, persistência do fechamento (`UsuarioLogin.FecharCaixa(DataFechamento)`), e o disparo condicional de `SalvarEventos` quando o usuário é Gerente de Caixa — e o que deve acontecer no Laravel quando cada uma dessas etapas falha?

## Answer

### Ordem de execução confirmada (`TfrmFechamentoCaixa.FecharCaixa` + `TdtmFechamentoCaixa.Fecharcaixa`)

1. **Guarda: transferência não confirmada** (`TransferenciaNaoConfirmada`) — bloqueia com aviso se existe transferência de saída (`tipo='S'`, `entradapendente=true`, `confirmacao is null`) pendente para este caixa. Ver `qryTransferenciaNaoConfirmada` (ticket 01).
2. **Guarda: código do caixa vazio** — bloqueia com aviso.
3. **Guarda: data de fechamento em branco** — bloqueia com erro.
4. **Guarda: só fecha o próprio caixa** — `edfCodigoCaixa.Text = IntToStr(CodigoUsuario)`, comparação direta de código, **sem exceção para Administrador/Suporte/GerenteCaixa** (nenhum papel pode fechar o caixa de outro operador; esses papéis só liberam **selecionar** outro caixa para consulta/impressão, confirmado no ticket 02). Caso contrário, bloqueia com aviso "operador/usuário diferem".
5. **Geração do documento** (PDF nesta migração, substituindo a escolha de impressora Delphi) — acontece **antes** de persistir o fechamento.
6. **Persistência do fechamento**: `UsuarioLogin.FecharCaixa(DataFechamento)` — só grava se `DataFechamento = dataaberturacaixa` atual (guarda de consistência já confirmada no ticket 03); se não bater, retorna falso e a UI mostra "data de abertura/fechamento diferem" **sem** ter persistido nada.
7. **Se o usuário é Gerente de Caixa**: dispara `SalvarEventos` (o batch-save da aba Eventos, ticket 07) — no Delphi isso acontece incondicionalmente, mesmo sem nenhuma linha alterada pendente.

### Decisão

O passo 7 é ajustado no Laravel: a segunda autorização sensível (senha para salvar Eventos) só é solicitada **quando existe de fato ao menos uma linha alterada pendente** na aba Eventos — não incondicionalmente a cada fechamento de um Gerente de Caixa. Isso remove uma fricção de senha sem propósito, tratada como artefato do fluxo Delphi, não regra de negócio intencional.

### Falhas — o que cada etapa faz no Laravel

- Qualquer guarda (1-4) falhar: nada é persistido, nenhum documento é gerado; mensagem de erro específica de cada guarda.
- Geração do documento (5) falhar: fechamento não é persistido (mesma ordem do Delphi — falha aqui impede a etapa 6).
- Persistência (6) falhar por incompatibilidade de data: nada muda no Usuário; mensagem "data de abertura/fechamento diferem".
- Se a etapa 7 (salvar Eventos, quando aplicável) falhar (senha incorreta ou usuário sem `GerenteCaixa`): o fechamento do caixa em si **já foi persistido** na etapa 6 — a falha em salvar Eventos não desfaz o fechamento (mesma ordem sequencial do Delphi, onde o `Result` de `SalvarEventos` só afeta o retorno da função como um todo, mas os efeitos das etapas anteriores já foram aplicados e commitados individualmente).
