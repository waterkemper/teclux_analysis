Type: grilling
Status: resolved
Blocked by: 03

## Question

Qual versao alvo do Laravel AI SDK deve sustentar as novas tools e saidas estruturadas, e qual matriz de compatibilidade/migracao e necessaria entre o laravel/ai v0.3.2 instalado, o Prism atual e a API oficial mais recente antes de implementar?

## Answer

A especificacao deve exigir a atualizacao do Laravel AI SDK antes da implementacao das novas tools. A versao alvo sera a versao estavel mais recente verificada no momento da execucao; a pesquisa deste mapa consultou o laravel/ai v0.10.3 como referencia oficial e encontrou laravel/ai v0.3.2 e Prism v0.99.22 instalados localmente.

A migracao sera feita em duas etapas:

1. Atualizar dependencias e lockfile, validar a compatibilidade entre Laravel AI SDK, Prism, PHP e Laravel, e executar os fluxos atuais de busca assistida, consulta de estoque e orcamentos.
2. Somente depois de passar a validacao de compatibilidade e regressao, implementar as novas tools, schemas e regras da Busca Assistida operacional v2.

A matriz deve cobrir APIs de Tool, saida estruturada, loop e limites, erros, retry/failover, eventos de observabilidade, autorizacao e comportamento dos agentes existentes. A especificacao nao exige a alteracao do pacote durante este planejamento; exige uma etapa de migracao validada como gate antes das tools.
