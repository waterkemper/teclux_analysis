# Definir a regua de conversao e estado do projeto

Type: grilling
Status: resolved
Blocked by: 01

## Question

Como a apresentacao mostrara, de forma honesta e util, a conversao Delphi para Laravel: o que ja esta disponivel, o que esta em preparacao, o que foi especificado e o que ainda nao entrou no projeto?

Recomendacao inicial: organizar o estado por evidencias e impacto operacional, usando quatro estados fixos — disponivel, em conversao, especificado e fora do recorte atual — e mostrar a mudanca correspondente para quem hoje trabalha no Delphi.

## Answer

A apresentacao usara quatro estados fixos, sempre acompanhados da evidencia que sustenta a classificacao:

1. Disponivel no Laravel — existe e pode ser demonstrado no produto.
2. Em conversao ou implantacao — esta sendo levado para a operacao Laravel, com o limite explicitado.
3. Especificado para evolucao — o comportamento foi levantado e decidido, mas ainda nao deve ser apresentado como pronto.
4. Fora do recorte atual — nao faz parte desta conversa ou ainda nao foi assumido como frente do projeto.

Essa regua evita misturar tela pronta, levantamento concluido e ideia futura. O estado sera apresentado junto da mudanca operacional correspondente, nao como uma lista abstrata de progresso.
