# Definir limite de tolerancia deterministica para restricao de preco

Type: grilling
Status: resolved
Blocked by: 01
Answer: usar IA para interpretar linguagem natural.
- Nao acumular aliases nem usar fuzzy especulativo no parser.
- Codigo e referencia exatos podem seguir sem IA.
- Toda consulta textual usa modelo barato com saida estruturada.
- O servidor valida e executa o plano.
- Falha ou baixa confianca pede clarificacao ou fallback explicito.

## Question

Quais erros de digitacao, voz ou variacao coloquial devem ser aceitos como aliases deterministas da Restricao de Preco, sem transformar o parser em uma correcao especulativa? Avaliar no minimo "baixo de", "abaixo e", "menos de", "por menos de", acentos ausentes, pontuacao e numeros brasileiros. Definir quando preservar a consulta sem filtro e quando pedir clarificacao.
