# Decidir impressão e relatório da Consulta

Type: grilling
Status: resolved
Blocked by: 01, 02, 03

## Question

Qual deve ser o contrato Laravel do F12 — conteúdo, agrupamentos, cabeçalho da filial, filtros refletidos, formato de saída, preview/download e reúso da infraestrutura de relatórios — para preservar a finalidade do relatório Delphi sem copiar sua tecnologia?

## Answer

F12 gera no servidor o conjunto completo que corresponde à filial ativa/requisitante, ao período e à situação atuais, sem limitar o relatório à página carregada no navegador e sem aceitar as linhas do cliente como autoridade. O relatório usa somente os registros da aba Pedidos; não inclui o detalhe Confirmados.

O PDF abre `inline` em nova aba, em orientação paisagem, usando a infraestrutura Laravel existente: template Blade específico, `ErpReportLayoutService`, cabeçalho institucional resolvido pela filial ativa e geração PDF por Browsershot. O navegador fornece preview, impressão e download.

O cabeçalho identifica a filial ativa/requisitante, o período e a situação filtrados, além dos dados institucionais, data de emissão e paginação. O corpo agrupa por Filial Requisitada, mostrando o nome em negrito na primeira linha do grupo, e preserva a ordenação ascendente por filial requisitada e código do produto.

A análise de `relatorio.png` confirmou o contrato visual e as colunas exatas: **Filial Requisitada**, **Código**, **Descrição**, **Referência**, **ABC**, **Nº Lote**, **Solicitado**, **Confirmado** e **OK**. Grades de produto integram a descrição; Solicitado representa `qtdepedida` e Confirmado representa `qtderecebida`. Nº Lote fica vazio quando não houver lote. OK é uma caixa vazia por item para conferência manual no papel/PDF e não possui persistência.

O layout mantém linhas zebradas, descrição com quebra controlada e colunas quantitativas compactas. Não acrescenta estoques, reserva prévia, situação, observação ou data por linha, e não apresenta subtotais por filial nem total geral.
