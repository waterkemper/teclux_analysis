## Destination

Um dossiê funcional e técnico, baseado no Delphi e confrontado com o estado atual do Laravel, que torne inequívoca a migração de **Estoques → Ficha de Produtos** e esteja pronto para ser transformado via `$to-spec` em uma especificação e em um prompt SpecKit autocontido.

## Notes

- O núcleo Delphi conhecido é `fmConsultaFichaProduto.pas/.dfm` e `dmConsultaFichaProduto.pas/.dfm`; ancestrais, units compartilhadas, consultas auxiliares e objetos de banco devem ser inspecionados somente quando influenciarem o comportamento observado.
- Não confundir **Ficha de Produtos** com **Cadastro de Produtos** nem com **Consulta de Estoques**. Registrar explicitamente as fronteiras e os pontos de integração entre esses módulos.
- O levantamento deve cobrir interface, filtros, valores padrão, validações, atalhos, abas, estados, operações, permissões, parâmetros, configurações, lookups, consultas SQL, cálculos, saldos, movimentos, lotes e contratos.
- Investigar especialmente as variantes de datasets de ficha/saldo/contrato para produto e lote, efeitos por dimensão de estoque, custo e financeiro, moedas, auditoria/autorização, lançamentos avulsos, supressão de triggers e a grade de produtos por contrato.
- O Delphi é a referência do comportamento legado, não um desenho obrigatório para a nova interface. Inconsistências ou bugs devem ser documentados e submetidos a decisão, nunca reproduzidos ou corrigidos silenciosamente.
- Em cada frente, confrontar o achado com o Laravel atual: componentes de filtros e grade, lookups, cadastro de produtos, filiais autorizadas, movimentos, lotes, contratos, permissões, auditoria, serviços, repositórios e convenções já existentes. Priorizar reuso e apontar lacunas reais.
- Nas integrações, descrever o contrato observado na fronteira; não expandir a investigação para a migração interna de módulos dependentes.
- Classificar cada requisito como: paridade obrigatória, adaptação recomendada, reuso Laravel, lacuna Laravel, dúvida ou comportamento legado a não reproduzir.
- Consolidar vocabulário de domínio suficiente para eliminar ambiguidades entre movimento, efeito de estoque, saldo, reservado, trânsito, demonstração, conserto, futuro, danificado, físico, reserva prévia, lote e contrato.
- O `$to-spec` posterior deverá produzir um prompt integralmente autocontido em `modules/estoque/ficha-produtos/09-speckit-prompt.md`. O Cursor/SpecKit não terá acesso ao Delphi e o prompt não poderá mandar o executor investigá-lo.

## Decisions so far

<!-- Uma linha por ticket resolvido: link, título e síntese da resposta. -->

- [Inventariar interface, filtros e fluxo Delphi](issues/01-inventariar-interface-filtros-fluxo-delphi.md) — definiu a ficha como consulta mestre-detalhe de Movimentos/Lotes com saldo anterior, produto–lote dependentes, detalhe por contrato, visões alternáveis e edição financeira restrita a gerente, registrando inconsistências legadas a não copiar.
- [Inventariar datasets, SQL, saldos e cálculos Delphi](issues/02-inventariar-datasets-sql-saldos-calculos-delphi.md) — estabeleceu que movimentos guardam snapshots acumulados, mapeou os seis datasets e a operação de 14 posições, fixou custo médio e saldo anterior e identificou SQL contraditório por lote e recorte contratual divergente.
- [Inventariar permissões, parâmetros e configurações Delphi](issues/03-inventariar-permissoes-parametros-configuracoes-delphi.md) — separou acesso ao módulo, filiais, sigilo financeiro, correção e autorização de avulsos; recomendou filiais autorizadas, consulta inicial somente leitura e não exposição da supressão de triggers.
- [Inventariar resultados, operações e integrações Delphi](issues/04-inventariar-resultados-operacoes-integracoes-delphi.md) — fechou a Ficha como consulta histórica somente leitura de deltas + snapshots, com opening balance, perspectivas Movimentos/Lotes, detalhe contratual, invariantes, erros e fronteiras de integração.
- [Mapear capacidades Laravel existentes](issues/05-mapear-capacidades-laravel-existentes.md) — confirmou ausência da Ficha e amplo reuso de shell, grade, lookups, filiais e infraestrutura de consultas, delimitando como lacunas o read model histórico, opening balance, movimentos por lote, projeção contratual e sigilo financeiro.
- [Construir matriz de paridade Delphi × Laravel](issues/06-construir-matriz-paridade-reuso-lacunas.md) — classificou item a item paridade, adaptação, reuso, lacunas e legado rejeitado, fechando critérios de aceite e decisões de filial, lote, opening balance, avulsos, contratos, segurança financeira e execução.
- [Consolidar dossiê para `$to-spec`](issues/07-consolidar-dossie-to-spec.md) — publicou o [dossiê autocontido](dossie.md) com contrato funcional e técnico, arquitetura de reuso, segurança, critérios de aceite e instrução de geração do prompt sem acesso ao Delphi.

## Not yet specified

<!-- A matriz de paridade resolveu a névoa restante; o ticket de consolidação já está especificado. -->

## Out of scope

- Implementar a funcionalidade no Laravel durante este esforço.
- Alterar o Delphi ou corrigir dados legados.
- Migrar internamente Cadastro de Produtos, contratos, lotes ou outros módulos apenas porque são dependências da consulta.
- Copiar literalmente o layout visual Delphi quando o comportamento puder ser preservado pelas convenções atuais do Laravel.
- Gerar a especificação ou o prompt SpecKit antes da consolidação do dossiê; essa publicação pertence à etapa posterior com `$to-spec`.
