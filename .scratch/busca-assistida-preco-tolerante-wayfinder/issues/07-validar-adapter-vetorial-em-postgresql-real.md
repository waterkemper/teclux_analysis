# Validar adapter vetorial em PostgreSQL/pgvector real

Type: task
Status: resolved
Blocked by:

## Question

Executar a validacao do adapter nativo no container PHP 8.5 e PostgreSQL moderno da conexao `ai`, usando fixture descartavel de `ba_embeddings`, `ba_document_parts` e `ba_product_documents`. Confirmar SQL executado, bindings, dimensao 1536, indice HNSW, `minSimilarity`, ordem/score, limite por lane, joins de evidencia, fallback quando pgvector esta indisponivel e ausencia de qualquer consulta ao legado nessa etapa. Comparar os IDs/resultados com `VectorSearchRepository` atual. Nao alterar migrations, producao, RRF, hard filters, preco/estoque ou contrato; se o container/daemon nao estiver disponivel, registrar o bloqueio e os comandos exatos que faltam.

## Answer

A validacao real nao foi executada porque o ambiente exigido nao estava disponivel:

- a CLI local e PHP 8.2.21, enquanto o projeto exige PHP 8.5;
- o Docker CLI retornou `permission denied while trying to connect to the docker API at npipe:////./pipe/dockerDesktopLinuxEngine`;
- `laravel/docker-compose.yml` define o servico PHP 8.5 e Redis, mas nao define PostgreSQL; a conexao `ai` depende de um PostgreSQL/pgvector externo configurado por `AI_DB_HOST`, `AI_DB_PORT` (padrao 5433), `AI_DB_DATABASE` e credenciais.

O trabalho foi convertido no handoff [16-speckit-prompt-adapter-query-builder-vetorial-laravel13.md](../../../modules/estoque/busca-assistida-produtos/16-speckit-prompt-adapter-query-builder-vetorial-laravel13.md), que define o gate de validacao e o plano de implementacao para o `speckit.specify`. Nenhuma migration, producao, RRF, filtro ou contrato foi alterado.

Para executar a validacao posteriormente, iniciar o Docker Desktop com o engine Linux e, em `C:\teclux_analysis\laravel`, executar `docker compose up -d --build php`; depois confirmar `docker compose exec -T php php -v` e a disponibilidade da conexao `ai`/pgvector. A CLI local PHP 8.2 nao deve ser usada como evidencia.
