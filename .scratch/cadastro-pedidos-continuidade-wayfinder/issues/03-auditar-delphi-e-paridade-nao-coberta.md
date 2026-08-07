# Auditar comportamentos Delphi e paridade ainda não cobertos do Cadastro de Pedidos

Type: research
Status: resolved

## Question

Quais comportamentos e estados atuais de `dmcadastropedidos`/`fmcadastropedidos` e seus `.dfm`, incluindo a interface evidenciada pelas imagens, ainda não estão cobertos pelos dois mapas e 15 prompts, excluindo bugs, código morto e módulos autônomos já fora de escopo?

## Answer

A auditoria foi registrada em [Auditoria Delphi — paridade ainda não coberta do Cadastro de Pedidos](../../../modules/estoque/cadastro-pedidos/auditoria-delphi-paridade-nao-coberta.md). Foram confirmadas sete lacunas: contrato completo do cabeçalho e seus recálculos; editabilidade excepcional em Pedido Parcial/estado Recebido; distinção entre as duas observações; modo inline de custo/preço; sincronização bidirecional SEFAZ–Produtos; atalhos/gestos dos grids; e o gatilho da ficha compartilhada do fornecedor. Bugs, código morto e módulos deliberadamente fora de escopo foram separados e não reintroduzidos.
