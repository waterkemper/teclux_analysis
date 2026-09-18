# Inventariar interface e fluxo Delphi do Controle de Recebimentos

Type: research
Status: resolved
Blocked by:

## Question

Quais são os controles, abas, frames, datasets, estados e fluxos observáveis de `fmcontrolerecebimentos.pas/.dfm` e `dmcontrolerecebimentos.pas/.dfm`? Extrair filtros/defaults/validações, F6, F9, Enter/Esc e demais atalhos, botões e operações, relatórios, grids, seleção, ordenação, edição, cores/estados, totalizadores e mensagens. Mapear eventos para métodos e SQL/datasets sem perder a ordem temporal e registrar evidências com arquivo e linha.

O resultado deve ser um artefato de pesquisa em `modules/caixa/controle-recebimentos/`, incluindo o que não foi localizado e possíveis bugs legados. Não decidir ainda o contrato Laravel nem implementar.

## Answer

Pesquisa concluída em [pesquisa-interface-fluxo-delphi.md](../../modules/caixa/controle-recebimentos/pesquisa-interface-fluxo-delphi.md).

- A tela possui as abas Parâmetros e Registros Selecionados, três operações por radio group — alterar tipo, confirmar e estornar — e filtros de Filiais, Cliente, três intervalos de datas, tipos de recebimento, meios, TEF/POS e situação.
- F6 gera a consulta e F5 grava; Esc retorna aos parâmetros; Enter é herdado; F9 é herdado e não possui janela própria, enquanto o Cliente usa o modal padrão do frame de pesquisa.
- O grid é editável de forma condicionada por operação/estado. Foram identificadas colunas, seleção por duplo clique/Ctrl+Space, confirmação em lote, totalizadores, cores e dados auxiliares de cheque/TEF.
- A gravação exige autorização de Analista de Crédito e pode envolver recebimentos, documentos a pagar, duplicatas e integração bancária; inserção/exclusão livre no grid são abortadas.
- Foram registradas divergências e lacunas sobre relatório, Cancelar/F6, F9, schema, menu/acessosmodulos, máscara NF-e, TEF/POS, tipos inicialmente marcados, `valorlancto` e F5 na operação 0.

A evidência também registra o SQL/datasets observados apenas para orientar os tickets específicos de SQL/schema e não substitui suas análises. Nenhum código foi implementado.