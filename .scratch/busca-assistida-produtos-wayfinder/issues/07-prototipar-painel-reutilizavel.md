Type: prototype
Status: resolved
Blocked by: 01, 05

## Question

Como deve funcionar o painel reutilizável de Busca Assistida na Consulta de Estoques — texto, ditado, filtros, carregamento, resultados, evidências, estoque/preço, abstenção, feedback, seleção e retorno à lupa — para depois ser consumido por Orçamentos e Contratos sem acoplamento ao módulo inicial?

## Answer

Escolhida a variante **B — Painel lateral contextual**. A Consulta de Estoques permanece visível; o painel reduz troca de tela e poderá ser hospedado por Orçamentos e Contratos.

O componente recebe filtros, Filiais autorizadas, capacidade de exibir preços e callback de seleção. Não conhece rotas, grids, formulários nem gravações do hospedeiro. A Busca Assistida nunca grava Orçamento, Contrato ou estoque.

Texto e **Ditar** convergem para consulta editável; áudio não é persistido. **Buscar** é explícito e cancelável. A lista mostra código, descrição, aderência, disponibilidade e preço permitido. O detalhe apresenta Característica, Evidência Comercial literal e fonte. Estoque, Filial e preço são confirmados ao vivo no legado com as autorizações atuais. **Selecionar produto** chama o callback e fechar preserva o hospedeiro.

Identificadores exatos têm precedência. A linguagem usa alta aderência, possível opção ou aproximação. Exibir inicialmente no máximo duas variantes da mesma Característica. Evidência insuficiente gera abstenção; cobertura parcial é informada.

Falha, cota, timeout, parâmetro desligado ou índice indisponível afetam somente o painel. **Abrir lupa tradicional** fecha-o e aciona o fluxo lexical existente sem IA.

Feedback oferece **Ajudou**, **Não ajudou** e **Sugestão inadequada**, persistindo somente HMAC, Produtos apresentados/selecionados e sinal, sem consulta, áudio ou identidade.

Testes cobrem estados, foco/teclado, responsividade, cancelamento, autorizações, evidência literal, dados dinâmicos, callback desacoplado e independência da lupa.
