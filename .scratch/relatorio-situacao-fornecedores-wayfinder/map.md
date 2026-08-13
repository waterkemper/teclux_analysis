# Relatório de Situação dos Fornecedores

Label: wayfinder:map

## Destination

Produzir, em `modules/financeiro/contas-pagar/relatorio-situacao-fornecedores/`, um dossiê rastreável e um prompt `/speckit.specify` autocontido para implementar no Laravel o Relatório de Situação dos Fornecedores, com paridade funcional deliberada às units Delphi e reutilização estrita dos padrões do Relatório de Contas a Pagar.

## Notes

- Fontes Delphi principais: `C:/projetos.vcl/apps/contaspagar/dmrelatoriosituacaofornecedores.pas/.dfm` e `fmrelatoriosituacaofornecedores.pas/.dfm`; seguir somente dependências alcançáveis e necessárias.
- O Delphi é a autoridade para regras funcionais, datas, filtros, cálculos, agrupamentos, ordenação e composição do documento.
- O Relatório de Contas a Pagar Laravel e seu dossiê são a autoridade para arquitetura, componentes, geração assíncrona, Fotografia de Relatório, histórico, autorização, layout, PDF, impressão e testes.
- O documento principal deve ser o cabeçalho, com valor total e Saldo Devedor na Data de Situação; seus vencimentos aparecem como detalhe.
- Considerar somente Documentos a Pagar cuja entrada/lançamento esteja no intervalo inclusivo entre a data inicial e a data de situação; esta última também é o corte financeiro.
- Não criar estruturas novas quando houver seam equivalente; divergências ou fragilidades legadas devem ser decididas, não copiadas automaticamente.
- Classificar evidências como `CONFIRMADO`, `INFERIDO`, `DÚVIDA`, `NÃO LOCALIZADO`, `DIVERGENTE`, `POSSÍVEL BUG LEGADO` ou `OPORTUNIDADE`.
- Este mapa planeja e especifica; não altera Delphi nem implementa Laravel.

## Decisions so far

<!-- Uma linha por ticket resolvido: link, título e síntese. -->

- [Inventariar a interface e os filtros do Relatório de Situação dos Fornecedores no Delphi](issues/01-inventariar-interface-filtros-delphi.md) — confirmou datas/defaults, filtros, validações e preview; a data de situação é limite do intervalo e corte histórico, e “somente documentos com notas” contém bug que zera a consulta.
- [Inventariar dados, cálculos e layout do Relatório de Situação dos Fornecedores no Delphi](issues/02-inventariar-dados-calculos-layout-delphi.md) — fixou a relação mestre Documento/detalhe Duplicatas, saldo nominal no corte, distinção entre valor do Documento e vencimentos, agrupamentos/totais e anomalias que não devem ser copiadas.
- [Inventariar o reaproveitamento do Relatório de Contas a Pagar no Laravel](issues/03-inventariar-reuso-relatorios-laravel.md) — confirmou pipeline ponta a ponta já implementado e limitou a lacuna a `report_type`, estratégia/read model histórico e renderização Documento/vencimentos, com testes PostgreSQL ainda necessários.
- [Definir o contrato de dados e do saldo histórico do Relatório de Situação dos Fornecedores](issues/04-definir-contrato-dados-saldo-historico.md) — definiu intervalo/corte, Partes `C/F/L`, Documento e vencimentos, medidas e saldo não apurável, filtros corrigidos, hierarquia/totais e reuso do pipeline por `SUPPLIER_SITUATION` sem duplicação.
- [Definir a UX, a segurança e os testes do Relatório de Situação dos Fornecedores](issues/05-definir-ux-seguranca-testes.md) — definiu página própria sobre componentes compartilhados, layout hierárquico e acessível, chave `vfornecedores.codigo+tipo`, segurança/histórico discriminados, testes PostgreSQL/imutabilidade/desempenho e gates por feature flag.
- [Consolidar o dossiê e o prompt Speck/Specify do Relatório de Situação dos Fornecedores](issues/06-consolidar-dossie-prompt-speckit.md) — consolidou evidências e decisões num dossiê rastreável e num prompt `/speckit.specify` autocontido, restrito às mudanças mínimas sobre o pipeline compartilhado.

## Not yet specified

- Nenhuma decisão permanece aberta; o caminho até a especificação está consolidado.

## Out of scope

- Alterar as units Delphi.
- Implementar o Laravel durante o Wayfinder.
- Exportar Excel/CSV ou criar formatos não existentes no padrão reutilizado.
- Criar ou alterar Documentos a Pagar, Duplicatas, Quitações ou outros fatos financeiros.
- Redesenhar genericamente a infraestrutura de relatórios além do seam mínimo exigido por este relatório.
