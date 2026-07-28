# Inventariar as regras e os efeitos do Estorno do Pagamento no Delphi

Type: research
Status: resolved

## Question

Quais pré-condições, parâmetros, transações e efeitos exatos `dmcancelamentoquitacao.pas/.dfm` e as units relacionadas aplicam ao estornar uma Quitação, incluindo Duplicata, autorização, pagamento parcial/residual/desconto, banco/cheque, eventos, Contabilidade, tributos, Auditoria e comportamento diante de efeitos compartilhados ou falhas?

## Answer

O inventário detalhado, com referências exatas às fontes Delphi, está em [Inventário Delphi do estorno de pagamento](../../../modules/financeiro/contas-pagar/estorno-pagamento-em-lote/inventario-delphi.md).

Síntese: o legado autoriza com a mesma permissão de pagamento; bloqueia impostos retidos pagos fora do conjunto; limpa os campos de quitação e reautoriza a duplicata com nova data; preserva desconto; reconstrói movimentos bancários, eventos e lançamentos contábeis compartilhados ao remover só uma duplicata. Porém, a tela em lote perpetra uma duplicata por vez, ignora retornos falsos e não garante atomicidade global. Não há motivo/auditoria explícitos nas units inspecionadas, e a recomposição de pagamento parcial/residual não aparece como operação própria no caminho de estorno.
