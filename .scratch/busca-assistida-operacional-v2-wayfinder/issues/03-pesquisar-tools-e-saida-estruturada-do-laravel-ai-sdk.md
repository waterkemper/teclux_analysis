Type: research
Status: resolved
Blocked by:

## Question

Considerando a versao instalada e a documentacao oficial atual do Laravel AI SDK, quais mecanismos de tools, saida estruturada, validacao de argumentos, encadeamento, limites, erros, retries e observabilidade sao adequados para um agente de consulta somente leitura no Laravel?

## Answer

A instalacao local usa laravel/ai v0.3.2 e Prism v0.99.22; a release oficial consultada e v0.10.3. A diferenca exige uma decisao de compatibilidade antes de adotar APIs atuais.

Para a busca somente leitura, o SDK deve ser usado como camada de interpretacao e despacho: tools PHP pequenas com description, schema e handle; schemas estruturados para o plano/resposta; validacao deterministica no backend para allowlist, autorizacao, Produto Ativo, filtros, limites e ordenacao. Schema do provedor nao substitui validacao de dominio nem permite SQL livre.

O loop de tools deve ter MaxSteps explicito, timeout, limite de tokens, limite de linhas e limite de filtros. Failover e retry devem distinguir falhas transitorias de argumentos invalidos, autorizacao ou consulta vazia; nao repetir chamadas semanticamente invalidas. Eventos de invocacao, resultado, duracao, modelo, uso e erro devem alimentar observabilidade com redaction.

O relatorio completo esta em [laravel-ai-sdk-tools.md](../research/laravel-ai-sdk-tools.md), com fontes oficiais e evidencias locais.
