# Lançamentos Avulsos — Detalhamento de Lookups, Grades e SQLs

Label: wayfinder:map

## Destination

Produzir um adendo funcional e técnico autocontido para **Estoques → Lançamentos Avulsos** que detalhe, sem ambiguidades, todos os lookups/resolvers que o Laravel deve disponibilizar, todas as grades e respectivas colunas/defaults/comportamentos, e os SQLs de leitura e escrita com parâmetros, filtros, ordenação, locks e fronteiras das triggers — pronto para corrigir a especificação existente sem nova investigação do Delphi.

## Notes

- Esta revisão aprofunda `modules/estoque/lancamentos-avulsos/dossie.md` e `09-speckit-prompt.md`; não reabre decisões já fixadas sobre inclusion-only, gravação síncrona, autorização sensível, idempotência, transação trigger-aware e proibição de escrita direta nas projeções.
- Investigar diretamente `fmlancamentosmanuais`/`dmlancamentosmanuais` e units/componentes auxiliares efetivamente usados no Delphi para obter contratos exatos de lookup, grade e SQL.
- Analisar sempre o Laravel atual, pois o módulo pode ter sido implementado depois do levantamento anterior; componentes, endpoints, repositories e testes existentes são o estado real de partida.
- Para cada lookup, separar: finalidade, dependências contextuais, campos pesquisáveis, colunas exibidas, valor canônico retornado, filtros obrigatórios, paginação, resolve exato, estado vazio/erro, autorização e invalidação quando o contexto muda.
- Para cada grade, separar: fonte, finalidade, colunas em ordem, rótulos, formatos, defaults, campos opcionais, ordem imutável/configurável, seleção, paginação, atualização após gravação, estado vazio e segurança financeira.
- Para cada SQL, registrar objetivo, tabela/fonte, SELECT/INSERT, joins, parâmetros, allowlists, filtros de Filial, Produto, Tipo e Lote, ordenação, cardinalidade, locks, transação, resultado e efeitos delegados às triggers.
- SQL extraído do Delphi é evidência de contrato, não código a copiar. Corrigir concatenação, vazamento de Filial, `MAX()+1`, N+1 e dependência de estado visual.
- A escrita Laravel continua limitada a uma única linha raiz em `movimentos`; triggers continuam autoridade para numeração, encadeamento, saldos, transferências, compostos, negativos e lotes.
- O adendo final deve ser autocontido e não mandar o futuro executor consultar Delphi, Wayfinder ou banco de pesquisa.

## Decisions so far

<!-- Uma linha por ticket resolvido. -->

- [Auditar lacunas da especificação atual](issues/01-auditar-lacunas-especificacao-atual.md) — confirma que a fronteira trigger-aware está sólida, mas lookups, contextos/grades e 14 classes de SQL carecem de campos, colunas, filtros, shapes, ordenação e contratos verificáveis.
- [Inventariar lookups e resolvers do Delphi](issues/02-inventariar-lookups-delphi.md) — identifica os cinco contratos efetivos, suas SQLs, colunas, identidades e efeitos, separando filtros reais das lupas das validações posteriores e das limitações legadas.
- [Inventariar grades do Delphi](issues/03-inventariar-grades-delphi.md) — confirma cinco grids: três visões dos mesmos dez Movimentos e dois snapshots de Produto/Lote, fixando colunas, formatos, cardinalidade, refresh e lacunas legadas.
- [Extrair e classificar SQLs do Delphi/PostgreSQL](issues/04-extrair-classificar-sqls-delphi-postgresql.md) — classifica lookup, contexto, histórico, pré-validação e INSERT, fixando parâmetros/cardinalidades e eliminando próximo número, cópia visual e UPDATE global de última compra.
- [Auditar o Laravel atual](issues/05-auditar-laravel-atual.md) — confirma módulo ainda ausente, mas identifica reuso seguro de Filiais, lookups, Tipo, histórico/grids, segurança financeira, prova sensível e Auditoria, delimitando os contratos novos.
- [Definir contratos finais no Laravel](issues/06-definir-contratos-laravel.md) — fixa lookups elegíveis, cinco visões, proteção financeira, contexto único, invalidação, preparação conservadora, INSERT raiz trigger-aware, recarga e SQL normativo por contrato.
- [Consolidar o adendo da especificação](issues/07-consolidar-adendo-especificacao.md) — publica o adendo autocontido com matrizes completas, SQLs parametrizados, critérios de aceite e testes, encerrando a rota até a especificação corrigida.

## Not yet specified


## Out of scope

- Implementar ou corrigir o Laravel durante o Wayfinder.
- Alterar triggers, funções PostgreSQL, tabelas ou dados existentes.
- Reabrir edição, exclusão ou estorno genérico de movimentos.
- Escrever diretamente em `estoques`, `estoqueslotes`, `movimentoslotes` ou movimentos derivados.
- Redesenhar autorização sensível, idempotência ou fluxo síncrono fora do necessário para detalhar lookups, grades e SQLs.
- Investigar emissão de notas avulsas ou outros módulos que não sejam Lançamentos Avulsos de estoque.
