# Inventariar a infraestrutura de relatórios e Contas a Pagar no Laravel

Type: research
Status: resolved

## Question

Quais páginas, read models, componentes de filtros, geradores PDF, shells de impressão, políticas por Filial, jobs, armazenamento de fotografias e testes o Laravel atual oferece, e quais seams devem ser preservados ou aprofundados para o Relatório de Contas a Pagar?

## Answer

O Laravel já possui os principais seams de apresentação e consulta: página Inertia no hub de Contas a Pagar, autorização modular/Policies, read models legados para Duplicatas abertas e pagas com defesa de Filiais, shell corporativo `ErpReportLayoutService`, Blade padrão e PDF via Browsershot. O Relatório de Movimentação Diária é a referência mais completa para filtros, read model, agrupamento/totais e HTML/PDF pelo mesmo template.

A lacuna central é a fotografia imutável: HTML e PDF atuais consultam e montam seus view models separadamente, enquanto `GerarJobStore` guarda resultados somente em cache temporário. O novo relatório deve aprofundar essa base com read model próprio para as três modalidades, envelope persistente/autorizável de geração e endpoints HTML/PDF que consumam a mesma fotografia. Também requer abilities próprias e testes de imutabilidade, paridade, Filiais e PostgreSQL que não dependam apenas de smoke Browsershot passível de skip.

Pesquisa completa com referências exatas: [Infraestrutura Laravel para o Relatório de Contas a Pagar](../../../modules/financeiro/contas-pagar/relatorio/pesquisa-infraestrutura-laravel.md).
