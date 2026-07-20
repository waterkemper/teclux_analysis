Type: grilling
Status: resolved
Blocked by: 02, 03, 04, 05, 06, 07, 08, 09, 10, 11, 12

## Question

Quais casos dourados comprovam filtros, cálculo, Promoções, Cargo, operações em lote, autorização, concorrência, Auditoria e efeitos em Vendas; qual é a ordem incremental de $to-spec; quais fatias podem avançar em paralelo; e quais critérios objetivos liberam a Manutenção de Preços interna para Usuários?

Consolidar sem produzir um spec monolítico e manter Marketplace fora do rollout.

## Answer

### Estratégia de liberação

- **DECISÃO NOVA** — consulta F6, simulação e gravação F8 serão liberadas juntas. Não haverá etapa intermediária somente leitura.
- **DECISÃO NOVA** — a liberação será para todos os Usuários que já possuam acesso ao módulo, sem lista paralela de pilotos ou chave de feature.
- **DECISÃO NOVA** — o F8 continua exigindo a autorização de Gerente de Estoque definida em “Mapear permissões, parâmetros e autorizações sensíveis”.
- **DECISÃO NOVA** — Marketplace não participa do rollout, não recebe alteração de escopo e não é critério de disponibilidade da manutenção interna.

### Ordem incremental de specs

#### Spec 1 — Motor oficial e casos dourados de cálculo

Escopo: Resolvedor de Preço Corrente, Filial efetiva, Característica + Faixa + Coluna, preço normal/promocional, validade, Cliente, Cargo, múltiplos, arredondamento e comparação com os oráculos PostgreSQL/Delphi.

Bloqueia todos os demais specs. Deve estabilizar contratos de entrada, resultado, origem do preço e casos dourados antes da construção da tela.

Comando futuro recomendado:

$to-spec Motor oficial e casos dourados da Manutenção de Preços interna, usando as decisões 02, 05, 06, 07, 11, 12 e 13 deste mapa.

#### Spec 2 — Consulta F6, filtros, três grids e exportação

Escopo: filtros internos, consulta integral sem paginação, três grids sincronizados, virtualização, fotos, preferências, exportação e desempenho.

Depende do Spec 1. Após o contrato do motor estar estável, pode avançar em paralelo com a fundação transacional do Spec 4.

Comando futuro recomendado:

$to-spec Consulta F6, filtros, três grids e exportação da Manutenção de Preços interna, usando as decisões 01, 03, 04, 10, 12 e 13 deste mapa.

#### Spec 3 — Operações locais, simulação e modal F8

Escopo: seleção, edição direta, copiar, ajustar, limpar, recalcular, composição de operações, histórico/desfazer, prévia explicável, validações e produção do comando canônico.

Depende dos contratos de dados do Spec 2 e do motor do Spec 1.

Comando futuro recomendado:

$to-spec Operações locais, simulação, histórico e modal F8 da Manutenção de Preços interna, usando as decisões 05, 06, 07, 08, 10, 12 e 13 deste mapa.

#### Spec 4 — Commit atômico, concorrência, idempotência e auditoria

Escopo: autorização sensível, comando canônico, revisões, bloqueios, política tudo-ou-nada, request_id, cabeçalho funcional, triggers, Promoções, Cargo e ausência de publicação Marketplace.

A fundação transacional pode avançar em paralelo ao Spec 2 depois do Spec 1. A integração final aguarda o comando canônico produzido pelo Spec 3.

Comando futuro recomendado:

$to-spec Commit F8 atômico, concorrência, idempotência e auditoria da Manutenção de Preços interna, usando as decisões 04, 06, 07, 08, 09, 11, 12 e 13 deste mapa.

### Grafo de dependências

1. Spec 1 é a fundação e bloqueia Specs 2, 3 e 4.
2. Após Spec 1, Spec 2 e a fundação backend do Spec 4 podem avançar em paralelo.
3. Spec 3 inicia quando os contratos do Spec 2 estiverem estáveis.
4. A integração final do Spec 4 ocorre após o Spec 3.
5. Nenhum spec depende de implementação ou publicação Marketplace.

### Critério de paridade dos cálculos

- **DECISÃO NOVA** — exigir igualdade no centavo com PostgreSQL/Delphi. Uma divergência de R$ 0,01 reprova o caso.
- **DECISÃO NOVA** — exigir a mesma escolha entre normal e promocional, mesma validade, mesmo resultado para Cliente/Cargo, múltiplos e arredondamento.
- **DECISÃO NOVA** — não adotar tolerância percentual nem normalizar divergência como melhoria sem decisão explícita.

### Matriz mínima de casos dourados

#### Preço, Promoção e Filial

1. Preço normal válido.
2. Promoção vigente.
3. Promoção vencida.
4. Promoção sem validade.
5. Coluna promocional sem valor.
6. Coluna inexistente.
7. Valor zero.
8. Produto usando Faixa diferente.
9. Filiais com colunas normal e promocional diferentes.
10. Produto sem custo ou sem preço calculável.

#### Cliente, Cargo e cálculo

11. Markup específico do Cliente.
12. Desconto por Cargo.
13. Cliente com Cargo, mas Produto sem registro em produtoscargos.
14. Cargo padrão quando não houver Cliente, conforme parâmetro.
15. Múltiplo exato, arredondamento para cima/baixo e bordas monetárias.
16. Precedência Cliente → Cargo → preço normal/promocional.

#### Operações e identidades compartilhadas

17. Edição direta.
18. Cópia de coluna.
19. Ajuste percentual positivo e negativo.
20. Limpeza/valor zero.
21. Recálculo.
22. Operações cumulativas em ordem.
23. Desfazer e refazer.
24. Seleção parcial.
25. Vários Produtos compartilhando Característica + Faixa.
26. Propagação de Cargo por Característica + Faixa.
27. Prévia consolidando múltiplas operações no mesmo alvo físico.

#### Persistência e segurança

28. Usuário Gerente autorizando a própria gravação.
29. Usuário comum com Gerente autorizador.
30. Prova ausente, expirada, reutilizada ou vinculada a outra Filial/lote.
31. Concorrência Laravel × Laravel.
32. Concorrência Delphi × Laravel.
33. Conflitos múltiplos retornados juntos, sem escrita parcial.
34. Falha induzida no início, meio e fim comprovando rollback total.
35. Repetição idempotente do mesmo request_id e payload.
36. Mesmo request_id com payload diferente.
37. Auditoria reconstruindo Operador, Autorizador, Filial, filtros, lote e diffs.
38. Confirmação de que nenhum serviço, job ou publicação Marketplace foi chamado.

#### Consumidores de Vendas

39. Nova pesquisa e inclusão em Orçamento usando preço corrente.
40. Orçamento já gravado preservando precovenda e precotabela.
41. Contrato originado copiando a fotografia do Orçamento.
42. Contrato existente preservando preços.
43. Consulta futura de Frente de Caixa usando preço corrente.
44. Promoção vencendo após a fotografia sem alterar documento existente.

### Critérios objetivos de liberação

- **DECISÃO NOVA** — 100% da matriz de casos dourados aprovada.
- **DECISÃO NOVA** — nenhuma sobrescrita silenciosa em testes de concorrência.
- **DECISÃO NOVA** — atomicidade e idempotência comprovadas por testes de falha e repetição.
- **DECISÃO NOVA** — auditoria permite reconstruir lote, Operador, Autorizador, Filial e todos os diffs.
- **DECISÃO NOVA** — nenhuma chamada, fila, job ou publicação Marketplace.
- **DECISÃO NOVA** — homologação manual de pelo menos um lote real por Usuário de Estoque antes da liberação.
- **DECISÃO NOVA** — após homologação, liberar a funcionalidade completa de uma vez a todos com acesso, mantendo a autorização no F8.

### Orçamento de desempenho obrigatório

- **DECISÃO NOVA** — medir com o maior conjunto real encontrado em produção.
- **DECISÃO NOVA** — F6 completo em até 10 segundos.
- **DECISÃO NOVA** — primeira renderização utilizável em até 2 segundos após a resposta.
- **DECISÃO NOVA** — rolagem e navegação entre os três grids sem travamentos perceptíveis.
- **DECISÃO NOVA** — pré-validação e gravação F8 em até 15 segundos, exceto quando houver bloqueio concorrente explicitamente informado.
- **DECISÃO NOVA** — exportação permanece fora do caminho crítico da interação principal.

### Encerramento do mapa

Todas as áreas previstas foram investigadas e não restou fog de guerra que exija novo ticket. O caminho até os quatro specs incrementais está definido. Este mapa está concluído e o próximo passo é executar os comandos $to-spec na ordem registrada.
