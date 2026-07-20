# Prototipar resultados e detalhe comercial rico

Type: prototype
Status: resolved
Blocked by: 01, 03

## Question

Qual leiaute responsivo e reutilizável deve organizar lista de resultados, multisseleção, evidências, ação “Visualizar mais detalhes” e uma visão rica com galeria de fotos, descrição complementar, características em HTML sanitizado, preço permitido e estoque por Filial, mantendo contexto e seleção ao abrir/fechar o detalhe?

## Answer

Protótipo descartável com 3 variantes estruturalmente diferentes, comparadas lado a lado via `?variant=`: [`prototype-resultados-detalhe/index.html`](prototype-resultados-detalhe/index.html) — arquivo HTML autônomo, sem backend, seguindo o mesmo padrão já usado em outros protótipos deste repositório (`.scratch/manutencao-precos-estoque-wayfinder/prototype-shell-grid/index.html`). Cores e estilos do protótipo são inventados/aproximados, sem relação com o design system real do Laravel; servem só para julgar leiaute e comportamento.

Variante escolhida: **C — Modal sobreposto aos resultados**. "Ver mais detalhes" abre uma janela centralizada por cima da lista (mesma linguagem da galeria de fotos já usada em outras telas do módulo), com a lista congelada atrás de um backdrop; fechar (✕, clique no backdrop) retorna exatamente ao mesmo estado de rolagem e seleção, sem desmontar a lista por baixo.

Decisões de leiaute fixadas pelo protótipo, válidas para as três variantes e mantidas na escolhida:

- A faixa de seleção (contador, chips removíveis, “Limpar seleção”, “Aplicar seleção”) fica sempre visível acima da lista de resultados, independente do detalhe estar aberto ou fechado.
- Marcar/desmarcar o checkbox de um cartão nunca abre o detalhe nem fecha o painel; abrir o detalhe nunca altera a seleção.
- Cada cartão de resultado mostra thumbnail, código, descrição, evidência, preço permitido, estoque total e as duas ações lado a lado (checkbox “Selecionar” e botão “Ver mais detalhes”).
- O detalhe rico é organizado em blocos verticais, nesta ordem: galeria (foto principal + tira de miniaturas clicáveis), descrição complementar em HTML pré-sanitizado (com nota indicando que a sanitização ocorre no servidor), características em lista de pares chave/valor, preço permitido em destaque, e uma tabela de estoque por Filial (Filial / Estoque / Reservado).
- Na variante C especificamente: o modal fecha só por ação explícita (✕ ou clique fora); nunca fecha sozinho ao clicar em algo dentro dele.

## Assets

- [`prototype-resultados-detalhe/index.html`](prototype-resultados-detalhe/index.html) — as 3 variantes completas (A, B, C) ficam preservadas no arquivo como fonte primária da exploração, mesmo com C escolhida; não há branch git dedicada porque este repositório ainda não tem nenhum commit (histórico vazio) — o arquivo em `.scratch/` já é o registro persistente, seguindo o mesmo padrão dos protótipos anteriores no repositório.
