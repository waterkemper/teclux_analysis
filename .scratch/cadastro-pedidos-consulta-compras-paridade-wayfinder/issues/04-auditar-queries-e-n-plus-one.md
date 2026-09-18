# Auditar queries desnecessárias e N+1 no fluxo integrado Laravel

Type: research
Status: resolved

## Question

Inspecionar o fluxo Laravel da Consulta de Compras até o Cadastro de Pedidos para localizar queries redundantes, consultas repetidas por linha, lazy loading/N+1, joins ou projeções maiores que o contrato, chamadas duplicadas entre controller/serviço/repositório e recarregamentos evitáveis. Para cada achado, apontar arquivo/método, padrão observado, impacto provável, se a mudança é segura sem alterar o contrato e a alternativa set-based/eager loading/read model adequada. Não otimizar por hipótese nem alterar código nesta investigação.
## Answer

Auditoria concluida e registrada em [Auditoria de queries e N+1 no fluxo integrado](../docs/04-queries-n-plus-one.md).

- CONFIRMADO anti-N+1: loadDetalhes da Consulta de Compras deduplica pares e usa loaders batch por chunk.
- CONFIRMADO N+1: listarItensEnriquecidos carrega itens e chama resolve do produto por linha; o resolver faz consulta de cadastro e pode fazer consultas auxiliares.
- CONFIRMADO N+1: o handoff F10 chama resolve individualmente em mapItensMinimosParaRicos.
- CONFIRMADO: a gravacao chama resolverDescricaoProduto por item, cuja consulta de snapshot ocorre mesmo quando uma descricao historica ja foi recebida.
- OPORTUNIDADE: ha releituras do cabecalho no controller e na resposta da gravacao; as consultas de abas sao limitadas e condicionais, nao N+1.
- SEM PROVA: nao ha medicao runtime de contagem de queries; os prompts devem adicionar instrumentacao antes de fixar metas.

O proximo ticket deve transformar esses achados em decisao de prompts por modulo. Nenhum codigo de producao foi alterado.
