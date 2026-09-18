# Auditar quantidades e conjunto de itens enviados para o Pedido de Compra

Type: research
Status: resolved

## Answer

Auditoria registrada em docs/03-quantidades-itens.md. Delphi F10 percorre apenas qryComprasTotal, exige selecionado=True e sugestao<>0, escolhe sugestao/minimo/maximo e grava o campo escolhido com AsInteger. Laravel coleta produtos_total, membros de similares e grades, deduplica por Produto e preserva a quantidade decimal como string.

Classificacao: DIVERGENTE na fonte de linhas e na precisao: valores fracionarios podem ser truncados no Delphi e preservados no Laravel. CONFIRMADO: a regra de excluir sugestao zero permanece alinhada ao contrato ja fechado, inclusive quando minimo/maximo foi escolhido. POSSIVEL BUG: a chave apenas Produto e a edicao com filial nula podem usar a primeira linha ou propagar uma sugestao para linhas conflitantes de Filial/aba. NAO ha prova de fixture real com duplicata, entao a ocorrencia em dados reais permanece SEM PROVA.

Antes de criar prompt, o ticket de classificacao deve decidir se a paridade exige somente qryComprasTotal ou tambem similares/grades, qual e a chave autoritativa da linha e se a precisao fracionaria deve seguir o legado ou o dominio decimal atual. Nenhum codigo de producao foi alterado.

## Question

Comparar, ponta a ponta, as quantidades que a Consulta de Compras calcula/exibe, a quantidade escolhida no modal, o filtro de linhas selecionadas e a quantidade recebida pelo Cadastro de Pedidos de Compra. Conferir sugestão, mínimo, máximo, agregação produto×filial, arredondamento/precisão, produtos compostos/grades, quantidade zero e duplicação de linhas. Confirmar se o Laravel mantém o contrato Delphi já fechado ou se há discrepância real na carga do Pedido, sem propor ainda a implementação.
