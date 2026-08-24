# Interpretacao tolerante de restricao de preco na Busca Assistida

Label: wayfinder:map

## Destination

Decidir o caminho seguro para a Busca Assistida interpretar erros comuns de vendedores em restricoes de preco, como "baixo de 200", e garantir que a restricao sobreviva ao fluxo deterministico e ao planner semantico nos dois hospedeiros.

## Notes

- Os dois specs ja foram implementados.
- Esta etapa e de analise e decisao; nao alterar producao sem decisao posterior.
- Preservar Produto Ativo, hard filters, preco resolvido pelo contexto, custo controlado e fallback tradicional.
- Skill de diagnostico: manter um repro red-capable e testes de regressao no seam correto.

## Decisions so far

- [Definir matriz de regressao e ambiente](issues/04-definir-matriz-de-regressao-e-ambiente-de-validacao.md) - cobrir Interpreter, validador, Executor e os dois hospedeiros; validar em PHP 8.5.
- [Definir seam do plano estruturado e da tool](issues/03-definir-seam-do-plano-estruturado-e-da-tool.md) - Interpreter sem tools, PlanValidator server-side e Executor unico compartilhado por HTTP e tool.
- [Definir limite de tolerancia](issues/02-definir-limite-de-tolerancia-deterministica.md) - IA para linguagem textual; servidor valida.
- [Auditar a regressao de interpretacao e propagacao do preco](issues/01-auditar-regressao-interpretacao-preco.md) - o parser nao reconhece "baixo de" e a tool/planner nao propagam os campos estruturados declarados no contrato.

## Not yet specified

Nenhuma decisao pendente para este mapa.

## Out of scope

- Alterar ranking semantico, embeddings, fotos, detalhe comercial ou regras de estoque.
- Permitir que o modelo escolha SQL, colunas, Filiais, permissoes ou regras comerciais.
- Implementar equivalentes, substitutos ou recomendacoes sem evidencia.
