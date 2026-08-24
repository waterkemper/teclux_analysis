# Definir matriz de regressao e ambiente de validacao

Type: task
Status: resolved
Blocked by: 02, 03

## Question

Answer: cobrir o plano inteiro nos dois hospedeiros.
- Unit: Interpreter fake, plano estruturado, validacao e Executor.
- Unit: preco, estoque, atributos, Filial e limites.
- Tool: campos declarados chegam ao Executor; nenhuma mutacao.
- Feature Estoques: consulta com limite de preco, inativos, estoque e fallback.
- Feature Orcamentos: mesmo caso com preco Cargo-aware e Filial Base.
- Contrato: uma chamada de IA, uma execucao e um envelope unico.
- Regressao: identificadores, busca tradicional, autorizacao e paridade de preco.
- Ambiente: PHP 8.5 no container; CLI local 8.2.21 e incompativel.
- Dockerfile usa php:8.5-fpm, mas o daemon Docker local esta inacessivel.
Qual matriz de testes deve provar a correcao nos dois hospedeiros e quais ajustes de ambiente sao necessarios para executar os testes reais? Cobrir parser, QueryPlan, tool estruturada, planner, Consulta de Estoques, Orcamentos, preco Cargo-aware, hard filters, fallback e ausencia de efeitos colaterais.
