## Destination

Um dossiê autocontido e uma sequência de prompts `/speckit.specify` em `modules/estoque/leitura-codigo-produto/`, prontos para o Cursor ajustar o Laravel para que as entradas de produto aceitem consistentemente `codigo` interno, `codigovisual` e código de barras, com a precedência, normalização, escopo e testes definidos.

## Notes

- Escopo: Laravel בלבד; não investigar nem alterar Delphi.
- Consultar `laravel/CONTEXT.md`, ADRs relevantes e os contratos existentes antes de propor nomes.
- A expressão de referência é a resolução exata por `p.codigovisual` ou por `produtoscodigobarras.produto`, preservando zeros à esquerda e sem converter texto em inteiro antes da busca.
- Distinguir lookup exato, filtros parciais, seleção de produto e validação final de comandos.
- O resultado é planejamento e prompts para execução posterior pelo Cursor/SpecKit; não implementar o Laravel nesta etapa.

## Decisions so far

- [07-consolidar-dossie-e-prompts-speckit.md](issues/07-consolidar-dossie-e-prompts-speckit.md) - dossie e prompts SpecKit consolidados em `modules/estoque/leitura-codigo-produto/`, sem investigacao Delphi.

- [01-definir-contrato-canonico-de-resolucao.md](issues/01-definir-contrato-canonico-de-resolucao.md) - entradas exatas aceitam PK, codigo visual e barcode; colisao abre tela de selecao, sem escolha silenciosa; Produto e Caracteristica sao contratos distintos.
- [02-auditar-ficha-produtos-e-entradas-de-estoque.md](issues/02-auditar-ficha-produtos-e-entradas-de-estoque.md) - Estoque possui resolucoes parciais divergentes e lacunas em lupa, prefill, paginacao e testes.
- [03-auditar-inclusao-de-itens-em-orcamentos.md](issues/03-auditar-inclusao-de-itens-em-orcamentos.md) - POST de Orcamentos ja resolve as tres fontes, mas a lupa nao cobre barcode e a precedencia nao estava documentada.
- [04-auditar-filtros-e-consultas-de-produtos.md](issues/04-auditar-filtros-e-consultas-de-produtos.md) - filtros e consultas precisam separar lookup exato de busca parcial, com atencao a SQL e indices.
- [06-definir-arquitetura-de-reuso-e-matriz-de-testes.md](issues/06-definir-arquitetura-de-reuso-e-matriz-de-testes.md) - resolvedor unico de Produto com `not_found`/`resolved`/`ambiguous`; UI sem SQL e filtros com primitive SQL equivalente.

<!-- Uma linha por ticket resolvido: link, título e síntese da resposta. -->

- [05-auditar-demais-componentes-de-digitacao.md](issues/05-auditar-demais-componentes-de-digitacao.md) — Compras, Listas e Venda Perdida precisam de resolucao exata; Lancamentos e Transferencia ja consultam barcode mas exigem alinhamento; Contratos sem entrada de Produto neste recorte. Dossie e prompts: `modules/estoque/leitura-codigo-produto/`.

## Not yet specified

- Se haverá um resolvedor compartilhado único ou contratos especializados sobre uma mesma primitive de resolução.
- Precedência quando o mesmo texto corresponde simultaneamente a `produtos.codigo`, `codigovisual` ou barcode de produtos diferentes.
- Política de comparação de caixa, acentos, espaços, padding e duplicidade de códigos de barras.
- Lista completa de componentes e endpoints Laravel que aceitam código digitado, além das superfícies já encontradas.
- Estratégia de compatibilidade para filtros parciais sem degradar índices nem mudar o significado de busca por descrição.

## Out of scope

- Investigar, alterar ou comparar com Delphi.
- Alterar o schema legado ou corrigir dados duplicados de `produtoscodigobarras`.
- Migrar a Busca Assistida semântica; somente seus pontos de entrada exata, se forem afetados.
- Implementar os ajustes no Laravel durante o Wayfinder.
