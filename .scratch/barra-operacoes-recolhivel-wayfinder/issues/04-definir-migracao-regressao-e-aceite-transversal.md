# Definir migração, regressão e aceite transversal

Type: grilling
Status: open
Blocked by: 01, 02, 03

## Question

Qual é a menor mudança no seam compartilhado que cobre os consumidores inventariados, e quais exceções realmente exigem adaptação local? Definir testes unitários dos componentes/hooks, testes de integração do shell com scroll e uma matriz de smoke/visual/a11y para representantes de cadastro, consulta, grid, operação longa, modal e `trailingActions`.

O aceite deve provar que campos não ficam encobertos no estado recolhido, que a reexibição funciona, que nenhuma ação desaparece, que atalhos e disabled/busy permanecem iguais e que telas com `enableCompactRail={false}` continuam explícitas.
