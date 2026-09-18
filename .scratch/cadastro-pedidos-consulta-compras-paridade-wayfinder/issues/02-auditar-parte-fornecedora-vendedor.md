# Auditar seleção da Parte Fornecedora e do vendedor no Pedido de Compra

Type: research
Status: resolved

## Answer

Auditoria registrada em docs/02-parte-fornecedora-vendedor.md. No Delphi, a Parte Fornecedora vem do lookup configurado como TipoCliente F/Tipovfornecedor F e seu codigo e copiado para qryPedidosfornecedor antes do loop F10. Nao foi localizado uso de um vendedor separado nesse handoff; vendedor em dmconsultacompras pertence a uma consulta de vendas detalhada.

No Laravel, a UI da Consulta declara fornecedorPedido nulo, sem setter, e nao monta o componente de lookup existente. O contrato e o handoff preservam fornecedor quando recebido, e Cadastro grava exatamente o valor do cabecalho; no caminho atual da Consulta, portanto, o valor final e nulo. O lookup geral do Cadastro nao envia tipofornecimento=P e o contrato nao possui tipo de fornecedor.

Classificacao: DIVERGENTE quanto a selecao/escopo do fornecedor; CONFIRMADO quanto a propagacao do valor no Laravel; NAO LOCALIZADO quanto a vendedor separado; OPORTUNIDADE para decidir a ligacao do lookup existente e a representacao/validacao do tipo F. O comportamento sem fornecedor e a equivalencia normativa do tipo ainda dependem do ticket de classificacao. Nenhum codigo de producao foi alterado.

## Question

Comparar a regra Delphi para vendedor/fornecedor na Consulta de Compras e no Cadastro de Pedidos com a implementação Laravel atual. Determinar: origem do vendedor selecionado, uso de fornecedor opcional, chave código+tipo quando aplicável, defaults e overrides na abertura do Cadastro, comportamento com múltiplos fornecedores ou fornecedor ausente, e valor finalmente persistido na Inclusão do Pedido de Compra. Registrar qualquer divergência com evidência e separar fato do legado de decisão ainda necessária.
