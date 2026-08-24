# Definir seam do plano estruturado e da tool de busca

Type: grilling
Status: resolved
Blocked by: 01

## Question

Answer: separar Interpreter, PlanValidator e Executor.
- O Interpreter usa modelo barato com structured output e nao recebe tools.
- O PlanValidator valida preco, estoque, Filial, atributos, limites e confianca.
- O Executor executa a busca uma unica vez no servidor.
- BuscarProdutosTool vira adapter do executor, sem autoridade propria.
- HTTP e tool compartilham o mesmo servico de execucao.
Como o planner semantico deve entregar um plano estruturado para a busca principal, e como BuscarProdutosTool deve aplicar preco, emestoque, identificadores, atributos, filial, ordenacao e limites? Comparar retornar plano e executar uma unica busca no servidor versus manter tool executora, garantindo validacao server-side, uma resposta unica e nenhum bypass de autorizacao.
