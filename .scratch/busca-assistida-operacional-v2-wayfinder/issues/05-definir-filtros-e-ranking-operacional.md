Type: grilling
Status: resolved
Blocked by: 01, 02, 10

## Question

Como filtros explicitos de Preco, Estoque Fisico Disponivel, Filial e Atributos Comerciais Evidenciados se combinam com identificadores, busca lexical/semantica e sinais secundarios para produzir um ranking previsivel, completo e util ao vendedor?

## Answer

Produto Ativo, identificadores e filtros explicitos sao hard filters e devem ser aplicados antes do ranking e do candidate cap. A ordem e: Produto Ativo; identificador exato; filtros de Preco, Estoque, Filial e Atributos evidenciados; recuperacao lexical/semantica; ranking final.

O ranking v2 e deterministico e explicavel: identificador exato; coincidencia textual forte em codigo, referencia, marca, modelo e descricao; atendimento dos atributos e filtros; relevancia semantica; desempate por ordenacao explicitamente escolhida pelo vendedor (relevancia, menor Preco ou maior emestoque); e, por fim, codigo do Produto como criterio estavel. Margem, popularidade, giro e historico comercial ficam fora da primeira versao.

O parser de Preco existente e a base da v2. Ele ja reconhece abaixo de, menor que, ate, no maximo, acima de, a partir de, no minimo e entre, com valores BRL nos formatos brasileiros. A avaliacao e inclusiva em ate, a partir de e nos dois limites de entre; abaixo e acima permanecem exclusivos. O filtro usa Preco Efetivo: promocao valida na Consulta de Estoques e Preco da Filial Base no Orcamento. A v2 deve combinar esse filtro com os demais antes do corte.

Estoque usa somente emestoque: com estoque significa maior que zero; pelo menos N significa maior ou igual a N; sem estoque significa zero, incluindo ausencia de linha; maior estoque so ordena quando solicitado. Consulta com Filial explicita usa aquela Filial. Orcamento usa o total de emestoque de todas as Filiais, sem composicao.

Atributos diferentes combinam com E; valores alternativos do mesmo atributo combinam com OU. Valor estruturado tem prioridade; sinonimos so sao aceitos quando mapeados no catalogo. Ambiguidade nao vira filtro inventado: pede clarificacao ou permanece sinal de ranking.

A busca semantica usa roteamento por custo: codigo, Preco, Estoque e Filial seguem interpretacao deterministica; necessidades abertas acionam uma saida estruturada com intencao, atributos e confianca; baixa confianca ou conflito pede uma clarificacao unica. Nenhuma camada de IA pode alterar regras de servidor.

Para candidatos, a v2 combina identificador exato, lexical/BM25 e vetorial, funde as listas por RRF e aplica reranker somente depois dos hard filters, sobre aproximadamente 30 a 50 candidatos. O reranker usa consulta, descricao, marca, modelo e caracteristicas evidenciadas; nao recebe margem, dados sensiveis, Preco ou Estoque. Se falhar ou exceder o tempo, o ranking RRF permanece como fallback. Produto inativo ou que viole filtro nunca retorna ao resultado.

Para manter custo controlado, embeddings continuam em cache por HMAC e versao de normalizacao/modelo; plano semantico, candidatos e reranking podem ter caches por versao e TTL adequado. Preco e Estoque sao sempre revalidados ao vivo ou com TTL muito curto e contexto correto. Locks/single-flight evitam chamadas duplicadas, e consultas simples nao chamam LLM nem reranker.
