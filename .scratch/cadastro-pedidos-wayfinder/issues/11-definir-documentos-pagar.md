# Definir geração de Documentos a Pagar a partir do Pedido

Type: grilling
Status: resolved
Blocked by: 03

## Question

Como o Pedido de Compra gera/altera/exclui documentos a pagar (`GerarDocumentosPag`, `AlterarDocumentosPag`, `ExcluirDocumentosPag`, `dmcadastropedidos.pas:1311-1345,1693-1951`)? Em que momento do ciclo de vida do pedido isso é disparado (na gravação? numa situação específica?), quais campos são copiados (valor, vencimento, condição de pagamento), e existe já um módulo de Contas a Pagar migrado no Laravel para reaproveitar o lado de escrita?

## Answer

### Momento de disparo (CONFIRMADO — já visto no ticket 03)

Dentro do próprio `GravarPedido`: **insert** → `GerarDocumentosPag`; **edit** → `AlterarDocumentosPag`. Não é um passo separado nem condicionado a situação específica — todo Pedido gravado tem um Documento a Pagar associado 1:1.

### `GerarDocumentosPag` (CONFIRMADO, `dmcadastropedidos.pas:1923-1950`)

Cria **um único** registro em `qryDocumentosPag` (número via sequence `spcDocumentosPagProximo`): `fornecedor`/`tipofornecedor='F'` (fixo — sempre fornecedor, nunca outro tipo de credor), `emissao`/`datalancto` = data de emissão do pedido, `filialemissao` = filial de fatura do pedido, **`previsao := True`** (marca como pagável baseado em previsão, ainda não vinculado a uma Nota Fiscal de Entrada real — a transição para "confirmado" presumivelmente acontece no módulo de recebimento/Nota de Entrada, fora de escopo), `valor` = `ValorNotaCalculada`, `pedido` = número do pedido. Depois, **uma duplicata (parcela) por Previsão de Pedido** (ticket 04) — `data_vencto`/`valor_vencto` copiados diretamente de cada previsão, `numero` da duplicata = `recno` da previsão. Confirma exatamente o que o ticket 04 já apontava: as parcelas do Documento a Pagar são um espelho 1:1 das Previsões, não uma entidade independente.

### `AlterarDocumentosPag` (CONFIRMADO, `dmcadastropedidos.pas:1311-1342`)

Refaz a consulta do Documento a Pagar existente pelo número do pedido; atualiza os mesmos campos de cabeçalho; **apaga todas as duplicatas existentes e recria do zero** a partir das Previsões atuais. Ou seja, qualquer edição no Pedido (mudar previsões, mudar valor) reconstrói inteiramente o cronograma de parcelas — não há tentativa de "diff" incremental.

### `ExcluirDocumentosPag` (CONFIRMADO, `dmcadastropedidos.pas:1693-1707`)

Apaga todas as duplicatas e depois o Documento a Pagar — chamado tanto pela exclusão física quanto pelo cancelamento lógico do pedido (ticket 03, `ExcluirPedido`/`CancelarPedido`). **Confirma**: mesmo um pedido apenas *cancelado* (não excluído fisicamente) tem seu Documento a Pagar completamente removido, não marcado como cancelado — não deixa "fatura fantasma" para trás.

### Achado incidental — código morto (POSSÍVEL BUG LEGADO / não replicar)

`CalcularAcrescimoDesconto` (`dmcadastropedidos.pas:1344-1435`) — toda a função está **comentada** (bloco `{...}`), incluindo a fórmula cascata de até 4 descontos + 4 acréscimos percentuais sucessivos + frete nota/CTR que produziria `ValorNotaCalculada`. Essa função **não executa** no código atual — o valor real de `ValorNotaCalculada` deve vir de outro lugar (mais provável: da sincronização feita pelo motor de impostos, `AtualizarClientDataSet_to_TTecQuery` dentro de `CalcularImpostos_`, ticket 07). **Não replicar** a cascata de desconto/acréscimo por porcentagem como se fosse lógica ativa — é legado desligado.

### Decisão

Especificar Documentos a Pagar como uma entidade gerada automaticamente (não editável diretamente pelo usuário nesta tela) na gravação do Pedido, com cronograma de parcelas sempre espelhando 1:1 as Previsões de Pedido, recriado do zero a cada gravação, e removido por completo ao cancelar/excluir o pedido. Se o Laravel já tem um módulo de Contas a Pagar, reaproveitar o lado de escrita (criação de título + parcelas) — não foi confirmado neste ticket se esse módulo já existe no checkout Laravel (não investigado; fica como verificação para quem for consumir este prompt).
