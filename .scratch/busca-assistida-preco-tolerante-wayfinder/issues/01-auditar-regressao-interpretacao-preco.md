# Auditar a regressao de interpretacao e propagacao do preco

Type: task
Status: resolved
Blocked by:

## Question

Por que a consulta "produtos para escaras, baixo de 200" nao produz uma restricao de preco depois da implementacao dos specs, e quais seams reais precisam ser corrigidos antes de discutir tolerancia adicional?

## Answer

### Reproducao

O parser isolado retorna:

- "produtos para escaras, baixo de 200" -> restricao null; texto residual preservado integralmente.
- "produtos para escaras, abaixo de 200" -> operador lt, valor 200; residual "produtos para escaras,".

O teste de PHPUnit nao pode ser executado neste workspace porque o vendor aponta para C:\\teclux_cloud e exige PHP >= 8.4.1, enquanto o CLI disponivel e PHP 8.2.21. A reproducao isolada das classes foi executada com PHP e confirmou o sintoma.

### Causa primaria confirmada

PriceRestrictionParser possui padroes para "abaixo de", "abaixo e", "menor que" e "menor de", mas nenhum para "baixo de". QueryNormalizer apenas trim e colapsa espacos; nao corrige palavras nem cria aliases. QueryPlanParser recebe a ausencia de restricao e envia a frase inteira para texto_busca.

### Falha estrutural adicional

BuscarProdutosTool declara preco, emestoque, identificadores, atributos, ordenacao, paginacao e limite no schema, mas handle so usa texto_busca e filial antes de chamar o servico. Os demais campos sao ignorados.

BuscaAssistidaOpenQueryPlanner executa agent->prompt($query), mas descarta o resultado do agente. O resultado estruturado do planner nao e incorporado ao QueryPlan da requisicao principal. A chamada de tool, quando ocorre, e portanto uma busca paralela sem efeito garantido sobre a resposta HTTP original.

Consequencia: mesmo que o modelo interprete "baixo de 200" como preco lt 200 e envie preco na tool, o filtro e perdido. Se enviar a frase corrigida em texto_busca, o parser ainda nao reconhece a forma original se ela permanecer no texto.

### Evidencia no codigo

- app/Support/BuscaAssistida/PriceRestrictionParser.php:31-44: allowlist de frases sem "baixo de".
- app/Ai/Tools/BuscaAssistida/BuscarProdutosTool.php:48-64: schema declara filtros estruturados.
- app/Ai/Tools/BuscaAssistida/BuscarProdutosTool.php:82-106: handle encaminha apenas texto e filial.
- app/Services/BuscaAssistida/BuscaAssistidaOpenQueryPlanner.php:50: retorno de agent->prompt e descartado.
- app/Services/BuscaAssistida/BuscaAssistidaSearchService.php:73-74: a restricao usada na resposta vem apenas de plan->preco.

### Decisao que fica para os proximos tickets

Nao basta adicionar um regex para "baixo de". E necessario decidir a fronteira entre aliases deterministico seguros e interpretacao semantica, e definir um unico seam para o plano estruturado ser validado no servidor e aplicado na busca principal.
