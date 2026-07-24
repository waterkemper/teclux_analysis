# Definir funcionalidades acessórias (Envio, Importação Daico, Relatório/Excel)

Type: grilling
Status: resolved
Blocked by: 03

## Question

Três funcionalidades acessórias do núcleo, cada uma pequena o bastante para não merecer ticket próprio, mas que precisam de uma decisão explícita de escopo: (1) **Envio de Pedido** (`sbnEnviarPedidoClick`, `fmcadastropedidos.pas:640-675`) — o que exatamente envia (e-mail? EDI? só muda situação?); (2) **Importação Daico** (`ImportarArquivoDaico`, `dmcadastropedidos.pas:4821-4931`) — formato do arquivo, e se há fornecedores que realmente usam isso hoje (verificar se vale a pena migrar ou se é legado morto); (3) **Relatório e Exportação** (`ImprimirRelatorio`/`frpRelatorioPedidos*`, `GravarExcel`, `dmcadastropedidos.pas:4348-4402,4569-4682`) — mesmo padrão de "citado para o ticket de critérios, não detalhado a fundo" usado em Consulta de Compras. Para cada uma, decidir: replicar fielmente, replicar simplificado, ou marcar como fora de escopo desta entrega.

## Answer

### 1. Envio de Pedido (CONFIRMADO, `fmcadastropedidos.pas:640-673`)

É **e-mail manual**, não EDI e não muda situação. Abre um diálogo genérico de envio de e-mail (`TfrmEnviarEmail`, componente compartilhado — não exclusivo de Pedidos), pré-preenchido com: destinatário = e-mail de contato do fornecedor (`qryContatosFornecedoresemail`; o ramo alternativo via `ParSistema.UsaitecLUX` está comentado/morto, confirma o achado do ticket 02), assunto "Pedido de Compra", corpo = "Pedido {número}" + o texto formatado em HTML de `MontarOrcamento` (`dmcadastropedidos.pas:2304-2513` — monta uma representação tipo orçamento/HTML do pedido, não investigado a fundo aqui, é geração de documento, não regra de negócio). O usuário confirma manualmente o envio na tela do diálogo; nada é enviado automaticamente ao gravar o pedido.

**Correção proposta**: reaproveitar qualquer infraestrutura de e-mail transacional já existente no Laravel (mailable + preview) para montar um e-mail equivalente (assunto + corpo em HTML com o resumo do pedido), disparado por um botão explícito "Enviar por e-mail" — não é preciso replicar o formulário de e-mail genérico do Delphi, só o resultado funcional.

### 2. Importação Daico (CONFIRMADO parcialmente, `dmcadastropedidos.pas:4821-4931`)

Importa um arquivo já pré-parseado num array `ArquivoTXT_Daico` (parsing do arquivo em si **NÃO LOCALIZADO** — a leitura/parse do arquivo-fonte não está nestes dois arquivos, é feita em outro ponto do sistema não fornecido). Por cada linha do arquivo: busca o produto pela **referência** (não pelo código); se não encontrar ou encontrar duplicado, avisa e pula; se encontrar e o produto já é uma linha do pedido atual, **soma** a quantidade importada à existente; senão, cria uma nova linha com os padrões fiscais do cadastro do produto (IPI/ICMS/PIS/COFINS/markup) mas preço e quantidade vindos do arquivo, marcada com uma flag dedicada `importadodaico := true`. Se o pedido já tem linhas importadas de uma rodada anterior, oferece removê-las antes de reimportar (evita duplicar).

**DÚVIDA a levar ao usuário antes de especificar**: "Daico" parece ser um formato/integração de um fornecedor específico. Não foi possível confirmar neste ticket se algum fornecedor ainda usa esse formato ativamente hoje. Antes de investir em especificar o parser do arquivo (que não foi localizado), vale confirmar com o negócio se essa importação ainda é usada — se não for, é candidata a ficar de fora desta entrega (fora de escopo), preservando só a mecânica genérica de "somar se já existe, criar com defaults fiscais senão" para uma eventual importação de planilha/CSV mais genérica, caso o negócio queira algo equivalente mas não especificamente o formato Daico.

### 3. Relatório e Exportação (CONFIRMADO por localização, não aprofundado — mesmo padrão de Consulta de Compras)

`ImprimirRelatorio`/`frpRelatorioPedidos*` (FastReport, `dmcadastropedidos.pas:4348-4402`) e `GravarExcel` (`dmcadastropedidos.pas:4569-4682`, exporta para uma planilha Excel usando automação COM, incluindo logo via `ParSistema.DiretorioImagens` e rodapé via `ParSistema.ObservacaoRodapePedidos`, ambos já confirmados no ticket 02) — geração de documento, não regra de negócio. Mesmo tratamento já usado em Consulta de Compras: citado para o ticket de critérios de aceite, sem especificação linha a linha.

### Decisão

Envio de Pedido: replicar funcionalmente (e-mail com resumo do pedido), infraestrutura pode ser mais simples que o Delphi (mailable padrão em vez de diálogo genérico). Importação Daico: **não especificar agora** — registrar como DÚVIDA de relevância de negócio; se confirmada a necessidade futuramente, vira ticket próprio (o parser do arquivo-fonte precisa ser localizado primeiro). Relatório/Excel: fora de detalhamento profundo, tratado no ticket de critérios de aceite como as demais telas do domínio.
