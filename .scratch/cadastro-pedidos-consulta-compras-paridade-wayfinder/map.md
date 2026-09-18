# Estoque → Compras — paridade da integração Consulta de Compras → Cadastro de Pedidos
Label: wayfinder:map

## Destination

Produzir uma especificação de ajustes incrementais, baseada em evidência, para o fluxo que sai da Consulta de Compras e inicia o Cadastro de Pedidos de Compra no Laravel. A especificação deve fechar as discrepâncias entre Delphi e Laravel — especialmente seleção da Parte Fornecedora/vendedor, filial de faturamento, quantidades e itens enviados — e eliminar queries desnecessárias ou N+1 comprovados, publicando os prompts na pasta de módulo apropriada.

## Notes

- Domínio: Estoque → Compras → Consulta de Compras → Pedido de Compra.
- Fontes Delphi primárias: `delphi/apps/estoque/dmconsultacompras.pas/.dfm`, `dmcadastropedidos.pas/.dfm` e, quando necessário, `fmconsultacompras.pas/.dfm`/`fmcadastropedidos.pas/.dfm`.
- O nome informado `dmconsultapras.pas` não foi localizado; o arquivo existente é `dmconsultacompras.pas`. Confirmar se era esse o alvo antes de tratar qualquer ausência como lacuna.
- Fontes Laravel: `laravel/backend`, documentação arquitetural existente e testes do fluxo Consulta de Compras/Cadastro de Pedidos.
- Decisões já fechadas devem ser reutilizadas, sem reabrir o contrato geral dos prompts anteriores: `.scratch/consulta-compras-wayfinder/`, `.scratch/cadastro-pedidos-wayfinder/` e `.scratch/cadastro-pedidos-continuidade-wayfinder/`.
- A investigação é de especificação e auditoria; não alterar `laravel/` nem fontes Delphi. Prompts corretivos devem ficar em `modules/estoque/cadastro-pedidos` e/ou `modules/estoque/consulta-compras`, conforme a fronteira de responsabilidade descoberta.
- Classificar cada achado como `CONFIRMADO`, `INFERIDO`, `DÚVIDA`, `NÃO LOCALIZADO`, `DIVERGENTE`, `POSSÍVEL BUG`, `SEM PROVA` ou `OPORTUNIDADE`, sempre com arquivo e trecho.
- Consultar o vocabulário em `CONTEXT.md` e as ADRs relevantes; usar `Pedido de Compra`, `Parte Fornecedora`, `Produto`, `Filial` e `Inclusão` com o significado do domínio.

## Decisions so far
- [Inventariar o fluxo F10 da Consulta de Compras ate a Inclusao do Pedido de Compra](issues/01-inventariar-fluxo-integracao-f10.md) - fluxo Delphi e Laravel localizado; a fonte efetiva e dmconsultacompras.pas/.dfm. Delphi transfere fornecedor/filial e percorre qryComprasTotal; Laravel usa payload -> contrato -> sessao -> Cadastro -> gravacao posterior. A UI Laravel atual envia fornecedor nulo; comparacao normativa e correcoes permanecem nos tickets 02-06.
- [Auditar selecao da Parte Fornecedora e do vendedor no Pedido de Compra](issues/02-auditar-parte-fornecedora-vendedor.md) - Delphi copia o codigo do lookup F para o cabecalho; Laravel preserva o valor recebido, mas a UI atual envia null e nao representa o tipo F.
- [Auditar quantidades e conjunto de itens enviados para o Pedido de Compra](issues/03-auditar-quantidades-e-itens-enviados.md) - Delphi usa apenas qryComprasTotal e AsInteger; Laravel usa todas as abas, chave por Produto e strings decimais. A regra sugestao zero permanece alinhada, mas escopo/chave/precisao exigem decisao.
- [Auditar queries desnecessarias e N+1 no fluxo integrado Laravel](issues/04-auditar-queries-e-n-plus-one.md) - loadDetalhes ja e batch; foram identificadas releituras e resolves por item no Cadastro/gravacao, sem medicao runtime.
- [Classificar discrepancias e decidir a fronteira dos ajustes corretivos](issues/05-classificar-discrepancias-e-fronteira-dos-ajustes.md) - fornecedor e itens/quantidades sao divergencias a corrigir; quantidade decimal e preservada; N+1 confirmado; prompts separados por Consulta e Cadastro.
- [Publicar prompts corretivos da integracao Consulta de Compras -> Pedido de Compra](issues/06-publicar-prompts-corretivos-de-integracao.md) - prompts 34 da Consulta e 26 do Cadastro publicados; contrato F10, fornecedor/quantidades e N+1 cobertos por fronteira.


## Not yet specified


## Out of scope

- Reespecificar os motores de sugestão, custo, impostos, financeiro ou a Requisição entre Filiais já fechados nos mapas anteriores, salvo quando forem evidência direta da quantidade/valor/filial no contrato F10.
- Implementar código, migrations, seeds, testes ou alterar o Delphi neste mapa.
- Corrigir a Consulta/Listagem de Pedidos, Cancelamento ou Cópia autônoma de Pedidos.
