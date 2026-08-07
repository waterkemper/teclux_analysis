# Inventariar o reaproveitamento do Relatório de Contas a Pagar no Laravel

Type: research
Status: resolved

## Question

Quais artefatos já implementados ou especificados do Relatório de Contas a Pagar e da infraestrutura Laravel podem ser reutilizados diretamente para filtros, read model, geração, Fotografia de Relatório, autorização, histórico, HTML, PDF, impressão e testes, e quais lacunas específicas permanecem para Situação dos Fornecedores?

## Answer

O checkout atual já implementa o pipeline completo do Relatório de Contas a Pagar: página/filtros, geração assíncrona, estados, cancel/retry, envelope persistente, fotografia JSON e PDF privados, integridade, retenção, histórico, Auditoria, revalidação de ability/Filiais, HTML e impressão pelo navegador. Esses componentes devem ser reutilizados diretamente para Situação dos Fornecedores.

A lacuna funcional mínima é uma estratégia/read model histórico próprio. O repositório atual tem granularidade de Duplicata/Adiantamento e decide aberto/pago pelo estado presente; ele não calcula o Saldo Devedor na Data de Situação nem representa Documento como cabeçalho com vencimentos filhos. O pipeline também precisa distinguir o tipo de relatório para selecionar materializador, histórico e template sem sobrecarregar as modalidades atuais. Recomenda-se acrescentar somente um discriminador/estratégia por `report_type`, mantendo a mesma infraestrutura de geração, storage, autorização, histórico e renderização.

Pesquisa completa com referências exatas: [Reuso Laravel para o Relatório de Situação dos Fornecedores](../../../modules/financeiro/contas-pagar/relatorio-situacao-fornecedores/pesquisa-reuso-relatorios-laravel.md).
