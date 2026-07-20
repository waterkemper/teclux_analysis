# Definir como a restrição de preço se aplica sem perder resultados por causa do corte de candidatos

Type: grilling
Status: resolved
Blocked by: 01

## Question

Dado que o preço só é conhecido depois do corte de `candidate_cap` (hoje 50) na recuperação, como aplicar a restrição de preço sem devolver menos resultados do que existem no catálogo: filtro pós-revalidação simples (barato, mas com perdas), aumentar o `candidate_cap` quando há restrição de preço detectada, ou empurrar a restrição para dentro da recuperação/SQL antes do corte (mais invasivo, toca `HybridProductRetrievalService` e os repositórios lexical/vetorial)? A restrição de preço deve ser registrada em `ProductFilterFieldOperatorRegistry` (reaproveitando `gt/gte/lt/lte` já existentes) e a Busca Assistida deve deixar de ser isolada desse mecanismo, ou continua bespoke como o filtro `item_produto.codigo` de hoje? Isso vale igualmente para Consulta de Estoques e para o preço Cargo-aware de Orçamentos?

## Answer

- **Pré-check antes do corte**: quando uma restrição de preço é detectada, uma consulta legada leve (só código+preço, não a revalidação completa) descarta os candidatos que não satisfazem a restrição **antes** da fusão/corte de `candidate_cap` — não depois. Preço nunca entra no embedding (é dado dinâmico), então a busca vetorial/lexical em si não muda; só se intercala uma checagem entre a recuperação e o corte. Motivo: a restrição de preço foi pedida explicitamente pelo vendedor, que quer tudo dentro do orçamento — um filtro pós-corte (barato, mas com perdas) poderia excluir produtos válidos e mais baratos que não estivessem entre os 50 mais relevantes por semântica.
- **Sem reaproveitar `ProductFilterFieldOperatorRegistry`**: o registro valida combinações de aba/campo/operador escolhidas por dropdown num filtro já buscado — mecanismo diferente do pré-check antes do corte, que vem de texto livre. Forçar unificação criaria uma junção artificial sem reaproveitar código real (só os nomes dos operadores são parecidos). A restrição de preço fica **bespoke**, documentada no dossiê, como o filtro `item_produto.codigo` já é hoje.
- Vale igualmente para os dois hospedeiros (Consulta de Estoques e o preço Cargo-aware de Orçamentos), já que ambos passam pelo mesmo ponto do pipeline (recuperação → corte → revalidação/preço).
