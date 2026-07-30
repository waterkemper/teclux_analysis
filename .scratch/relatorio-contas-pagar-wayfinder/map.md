# Relatório de Contas a Pagar

Label: wayfinder:map

## Destination

Produzir, em `modules/financeiro/contas-pagar/relatorio/`, um dossiê específico e um prompt `/speckit.specify` autocontido para implementar no Laravel uma página completa de Relatório de Contas a Pagar, com paridade funcional às units Delphi e geração consistente para visualização, PDF e impressão.

## Notes

- Fontes Delphi principais: `C:/projetos.vcl/apps/contaspagar/dmrelatorioduplicatas.pas/.dfm` e `fmrelatorioduplicatas.pas/.dfm`; seguir dependências somente quando alcançáveis e necessárias.
- A página reúne três modalidades: Contas a Pagar, Contas por Competência e Pagamentos Efetuados.
- Preservar filtros, regras, campos, agrupamentos, quebras, subtotais, totais, parâmetros impressos e ordenação; não reproduzir FastReport pixel a pixel.
- Usar o padrão atual de relatórios Laravel, com cabeçalho de Filial, paginação, data/hora e identidade do Operador.
- Cada geração cria uma fotografia imutável; preview, PDF e impressão da mesma geração usam conteúdo idêntico.
- Exportação Excel/CSV fica fora de escopo.
- Classificar evidências como `CONFIRMADO`, `INFERIDO`, `DÚVIDA`, `NÃO LOCALIZADO`, `DIVERGENTE`, `POSSÍVEL BUG LEGADO` ou `OPORTUNIDADE`.
- Este mapa produz planejamento e especificação; não altera Delphi nem implementa Laravel.

## Decisions so far

<!-- Uma linha por ticket resolvido: link, título e síntese. -->

- [Inventariar a interface e os parâmetros do Relatório de Contas a Pagar no Delphi](issues/01-inventariar-interface-parametros-delphi.md) — confirmou três modalidades na mesma tela, período por vencimento/lançamento/pagamento e a matriz de filtros, agrupamentos, resumo e preview, sem atalho concreto local.
- [Inventariar dados, layouts e cálculos do Relatório de Contas a Pagar no Delphi](issues/02-inventariar-dados-layout-calculos-delphi.md) — fixou query unificada de Duplicatas/Adiantamentos, cinco medidas financeiras, regime de caixa, templates detalhe/resumo e fragilidades legadas que não devem ser copiadas.
- [Inventariar a infraestrutura de relatórios e Contas a Pagar no Laravel](issues/03-inventariar-infraestrutura-relatorios-laravel.md) — encontrou shell/Blade/Browsershot, Policies e read models reutilizáveis, mas revelou que HTML/PDF reconsultam separadamente e exigem fotografia persistente/autorizável comum.
- [Definir o contrato de dados e da fotografia do Relatório de Contas a Pagar](issues/04-definir-contrato-dados-fotografia.md) — fixou modalidades/temporalidade, filtros tipados, medidas e agrupamentos, além de geração assíncrona sobre snapshot consistente e fotografia autorizável de 7 dias comum ao HTML/PDF/impressão.
- [Definir a UX, o layout, a segurança e os testes do Relatório de Contas a Pagar](issues/05-definir-ux-layout-seguranca-testes.md) — definiu página e histórico de gerações assíncronas, ciclo com cancelamento e nova tentativa, documento responsivo a detalhe/resumo, autorização por todas as Filiais, auditoria, acessibilidade e uma matriz de testes independente do renderizador.
- [Consolidar o dossiê e o prompt Speck/Specify do Relatório de Contas a Pagar](issues/06-consolidar-dossie-prompt-speckit.md) — consolidou evidências e decisões no dossiê rastreável e em um prompt `/speckit.specify` autocontido, com contratos, matrizes, testes, fases, gates e proibições.

## Not yet specified

- Nenhuma decisão permanece aberta; o caminho até a especificação está consolidado.

## Out of scope

- Alterar Delphi ou reproduzir FastReport pixel a pixel.
- Exportar Excel/CSV.
- Criar ou alterar fatos financeiros; o relatório é estritamente somente leitura.
