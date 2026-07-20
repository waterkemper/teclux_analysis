# Definir multisseleção e contrato com o hospedeiro

Type: grilling
Status: resolved
Blocked by: 01

## Question

Como o painel reutilizável deve representar seleção zero, única ou múltipla, preservar seleção entre paginação/refinamento e devolver Produtos ao módulo hospedeiro sem conhecer suas regras; e qual adaptador da Consulta de Estoques deve converter a seleção em filtros existentes, incluindo deduplicação, limites, remoção, revalidação e execução explícita da consulta?

## Answer

### Representação da seleção (zero/única/múltipla)

- O painel opera sempre em modo multisseleção: checkbox em cada cartão de resultado, sem alternância para um modo de seleção rápida separado.
- A seleção é um conjunto mantido à parte da lista de resultados atual, chaveado por `produto`, exibido como uma faixa/chips persistente ("N selecionados") com remoção individual (×) e ação "Limpar seleção".
- Uma nova busca ou refinamento nunca limpa a seleção implicitamente; só uma ação explícita do usuário limpa.
- Limite de 15 seleções simultâneas, como constante fixa no painel por enquanto (não configurável por hospedeiro nesta entrega).

### Contrato com o hospedeiro

- `onSelect` (disparado a cada clique em cartão) é substituído por um único `onApply(selections: BuscaAssistidaSelection[])`, disparado somente quando o usuário clica em "Aplicar seleção"; marcar/desmarcar checkbox nunca chama o hospedeiro.
- O painel continua sem se fechar sozinho; fechar continua sendo decisão do hospedeiro/usuário (X, Esc, overlay). Aplicar não fecha o painel automaticamente, permitindo continuar buscando e aplicando em lote.
- `currentSelection` é ampliado para array: o hospedeiro passa ao abrir o painel o conjunto de produtos já presentes nos filtros atuais (de qualquer origem), e o painel pré-marca esses itens na faixa de seleção. Isso torna Aplicar um full-sync, não um merge cego.
- `renderFilterSlot` permanece como está, fora do escopo deste ticket — cabe a um ticket futuro decidir seu uso.

### Adaptador da Consulta de Estoques

- Ao Aplicar, o adaptador faz full sync: substitui exatamente as linhas `item_produto.codigo eq` existentes (qualquer origem — lupa tradicional ou aplicação anterior da Busca Assistida) pelo conjunto atual do painel, encadeadas por `with_next: 'or'`; todas as demais linhas e abas permanecem intocadas.
- Isso resolve deduplicação e remoção por construção (é substituição, não soma) — nenhuma lógica extra de dedup é necessária.
- Seleção vazia mais Aplicar é válida e significa "limpar todas as linhas `item_produto.codigo eq`"; Aplicar permanece habilitado com zero selecionados.
- Nenhuma revalidação extra no momento de Aplicar: o código do produto é identificador estável, a busca já revalida Produto/Estoque no legado, e o Gerar da Consulta de Estoques sempre roda uma consulta fresca — o flag `dirty` já existente cobre a necessidade de rodar Gerar novamente.
- A execução da consulta (Gerar) permanece ação explícita e separada, inalterada por este ticket.
- Observação preexistente e preservada (não é decisão nova): a lupa tradicional continua sobrescrevendo por índice de linha (`itemProdutoLookupLine`); convive com o full-sync da Busca Assistida porque `currentSelection` reflete o estado real das linhas, de qualquer origem.
