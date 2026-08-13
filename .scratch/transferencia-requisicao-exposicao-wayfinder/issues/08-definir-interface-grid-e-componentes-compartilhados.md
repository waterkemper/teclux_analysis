# Definir interface, grid, atalhos e componentes compartilhados

Type: grilling
Status: resolved
Blocked by: 01, 04, 06, 07

## Conversation

O usuario confirmou que a grade principal permanece editavel como no Delphi somente para requisicoes abertas, permitindo quantidade recebida e observacao; a confirmacao continua exclusivamente no botao Confirmar F8, com validacao server-side.

O usuario confirmou a composicao dos filtros: Situacao em radio buttons, Curva ABC em selecao multipla, Requisitante pelo modal padrao F9 e Periodo com as validacoes do Delphi.

O usuario confirmou a barra de operacoes: Gravar F5 separado de Confirmar F8; Cancelar/Reabrir F6; Gerar F7; Confirmar F8; F9 no modal de Requisitante; F11 alternando Produto/Codigo de Barras; e Imprimir F12.

O usuario confirmou o catalogo da grade principal com as colunas operacionais do Delphi — produto, descricao, referencia, situacao/ABC, estoques, reserva, quantidades, lote, selecao, observacao e grades de produto quando habilitadas por parametro — usando ErpPreferenceDataGrid para ordenacao, exportacao e personalizacao. As grades de compras/filiais permanecem fora do escopo.

O usuario confirmou que a tela deve reutilizar exclusivamente o componente compartilhado `NfeAccessKey`/`NfeAccessKeyInput`, com chave canonica de 44 digitos e mascara apenas visual, promovendo-o como padrao transversal sem criar mascara local; emissao fiscal permanece fora do escopo.

O usuario confirmou que os indicadores de situacao devem preservar a semantica visual do Delphi com texto e icone sempre disponiveis, usando cor apenas como reforco para estados como aberta, parcial, confirmada, cancelada e fechada; a interface nao pode depender somente de cor.

O usuario confirmou que a lista de lotes deve filtrar a grade principal como no Delphi: nenhum lote selecionado significa sem filtro, a selecao usa checkbox e Gerar Lote/Conferir atuam sobre todas as linhas marcadas, habilitando-se quando existir qualquer linha marcada e nao apenas a linha corrente.

## Question

Como traduzir a jornada Delphi para a UX Laravel mantendo Breadcrumb, filtros com radio buttons, modal F9, botões com ícones e atalhos, estados busy/cancelável, mensagens e acessibilidade? Definir catálogo de colunas e preferências do grid, ordenação, exportação, personalização, detalhes, seleção de lotes, cores/indicadores de situação e uso transversal da máscara de chave NF-e, sem copiar limitações visuais do desktop e sem reintroduzir emissão fiscal ou venda entre filiais.

## Answer

Interface aprovada para paridade comportamental com o Delphi: filtros de Situacao por radio buttons, Curva ABC em selecao multipla, Requisitante no modal F9 e Periodo com validacao legada; grade principal sem paginacao, editavel apenas para requisicoes abertas nos campos quantidade recebida e observacao, com confirmacao exclusivamente no F8 server-side. A barra de operacoes preserva Gravar F5, Cancelar/Reabrir F6, Gerar F7, Confirmar F8, F9 Requisitante, F11 Produto/Codigo de Barras e Imprimir F12.

O grid usa `ErpPreferenceDataGrid` e o catalogo operacional Delphi (produto, descricao, referencia, situacao/ABC, estoques, reserva, quantidades, lote, selecao, observacao e grades condicionais por parametro), com ordenacao, exportacao e personalizacao. Grades de compras/filiais ficam excluidas. Estados usam texto e icone, com cor apenas como reforco. A selecao de lotes funciona como filtro sem selecao restritiva e as operacoes de lote processam todas as linhas marcadas. A chave NF-e reutiliza exclusivamente `NfeAccessKey`/`NfeAccessKeyInput`, sem mascara local; emissao fiscal continua fora do escopo.
