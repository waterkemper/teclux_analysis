# Inventariar a interface e o fluxo do Estorno do Pagamento no Delphi

Type: research
Status: resolved

## Question

Qual jornada alcançável, filtros, campos, seleção, validações, confirmações, motivo obrigatório, permissões, mensagens e estados de interface são definidos por `fmcancelamentoquitacao.pas/.dfm` e pelas chamadas relacionadas no Cadastro de Contas a Pagar, e quais deles devem orientar uma experiência em lote simétrica à Quitação em Lote?

## Answer

A jornada Delphi dedicada é `Parâmetros -> Gerar/F6 -> Registros Selecionados -> marcação -> Confirma/F5 -> autorização -> processamento/recarga`, com filtros por período de pagamento, Filial ou Grupo, Parte Fornecedora, Conta e ordenação; grid detalhado, marcação individual/todos e totais pesquisados/marcados. O Cadastro fornece a confirmação unitária e a mesma rotina profunda de cancelamento. Quem tem perfil de pagamento pode desquitar; sem ele, exige Autorizador com esse perfil.

Para a experiência nova, preservar pesquisa/seleção e equivalência de permissão, corrigindo as limitações legadas: motivo obrigatório e auditável, preview/revisão final, operação atômica, estados explícitos e reconstrução de `SINGLE_CHECK` sem forçar outras Duplicatas. As units indicadas não demonstram campo específico de motivo obrigatório; há somente observação genérica da Duplicata, portanto o motivo é requisito decidido, não paridade comprovada desta revisão Delphi.

Pesquisa detalhada e referências: [Interface e fluxo Delphi do Estorno do Pagamento](../../../modules/financeiro/contas-pagar/estorno-pagamento-em-lote/pesquisa-interface-fluxo-delphi.md).
