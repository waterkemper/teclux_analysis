# Inventariar a superfície do Cadastro de Requisições no Delphi

Type: task
Status: resolved
Blocked by:

## Question

Lendo integralmente `dmrequisicaoexposicao.pas/.dfm` e `fmrequisicaoexposicao.pas/.dfm`, qual é a superfície funcional completa do cadastro: modos de inclusão, pesquisa, edição e exclusão; campos e estados visuais; atalhos e ações; navegação; mensagens; e dependências externas acionadas pelo formulário?

## Answer

### Natureza e ciclo do formulário

`TfrmRequisicaoExposicao` é uma tela MDI intitulada **“Requisição para Exposição”**, construída sobre `TfrmCadastroPadrao`. Apesar do nome histórico “Exposição”, o registro persistido é uma requisição entre filiais em `pedidosfiliais`. O formulário oferece o ciclo padrão:

- **F3 — Incluir**: abre a tabela, insere uma linha e foca a filial requisitada;
- **F5 — Gravar**: valida e persiste inclusão ou edição;
- **F6 — Cancelar**: o “Excluir F6” herdado é renomeado e faz cancelamento lógico;
- **F9 — Procurar**: pesquisa requisições abertas ou, contextualmente, filiais e produtos;
- **Esc**: confirma a perda e cancela alterações locais.

O registro é editável somente em `situacao = 'A'`. Outros estados tornam a query somente leitura e não podem ser cancelados.

### Inclusão e valores iniciais

Inicializa data/hora com `DataHoraLocal`, requisitante com `FilialBase`, nome com `NomeFilialBase` e situação `'A'`/“ABERTO”.

A requisitante **não é rigidamente fixa**: `TfraConsultaCodigo` usa `SomenteFiliaisUsuario = true`, permitindo selecionar uma filial autorizada. Requisitante e requisitada excluem uma à outra. Logo, requisitante ≠ requisitada, mas a requisitante pode diferir da filial-base — diferença importante frente à Consulta de Compras.

Trocar a requisitada limpa produto e quantidade; trocar produto limpa quantidade.

### Campos apresentados

- Identificação: número, data/hora, `codigoorigem` e situação textual (`A` aberta, `F` fechada, `D` confirmada, demais cancelada).
- Solicitação: requisitante, requisitada, produto por código visual/código de barras, unidade, descrição, quantidade pedida inteira não negativa, estoques informativos e observação de até 150 caracteres.
- Posteriores e somente leitura: quantidade recebida, série e número da nota fiscal.

A tela não executa recebimento, transferência, expedição nem vínculo de nota fiscal.

### Pesquisa e navegação

1. **Requisições**: somente abertas da requisitante, ordenadas por descrição/grades; seleciona pela chave `(requisitante, codigo)`.
2. **Filiais**: todas exceto a requisitante, por nome sem acentos. Filial tipo `'V'` resolve `filial_estoque` para saldo/movimentos.
3. **Produtos**: depende da requisitada; aceita código visual ou barras e busca por descrição, grades, referência, código, filial, estoque e unidade. Exclui compostos conforme `Transferir_Produtos_Compostos`; mostra grades conforme `UsarGradesProdutos`.

Produto inválido cobre código inexistente, destino ausente ou produto composto. Filial inválida usa `ctFILIALIGUALFILIALBASE`.

### Gravação, edição e duplicidade

São obrigatórios produto, código visual, data, requisitante, requisitada, quantidade e situação. Novo código vem de `pedidosfiliais_proximocodigo()`.

Se `Permitir_Requisicoes_de_Produtos_Duplicadas` proíbe duplicidade, nova requisição aberta para o mesmo produto/requisitante/requisitada pede confirmação para alterar a existente e navega até ela. Efeitos de estoque ficam no ticket **“Mapear persistência, validações e efeitos de estoque”**.

Registros abertos admitem edição de requisitante, requisitada, produto, quantidade e observação. Demais estados são somente leitura.

### Cancelamento

F6 usa `MensagemSimNaoopcaocancelamotivo`, podendo exigir motivo via `InformarMotivoCancelamentoPedido`. Confirmado: anexa motivo à observação, grava seu código, muda para `'C'`, limpa `qtderecebida`, reverte estoque quando `RequisicaoSubtraiEstoque` está ativo e persiste requisição/movimentos atomicamente. Não há senha/supervisor explícito nesses arquivos.

### Dependências acionadas

- `TfrmCadastroPadrao`/`TfrmAjudaBt`, `TfrmConsultaPorCampo` e `TfraConsultaCodigo`;
- parâmetros de compostos, grades, duplicidade, estoque imediato e motivo;
- `pedidosfiliais`, `filiais`, `estoques`, `produtos`, `caracteristicas`, `produtoscodigobarras`, `notas` e `movimentos`;
- `pedidosfiliais_proximocodigo()`, `movimentos_proximonumero()`, `Perpetrar` e `DataHoraLocal`.

### Limite confirmado

O Cadastro cria, localiza, edita e cancela requisições e exibe resultados posteriores. Consulta geral histórica, separação, transferência, expedição e recebimento não fazem parte dele; recebimento/NF são apenas projeções informativas.
