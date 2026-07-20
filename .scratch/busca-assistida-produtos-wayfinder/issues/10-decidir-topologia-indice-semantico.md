Type: grilling
Status: resolved
Blocked by: 02, 03

## Question

Considerando PostgreSQL legado 9.5 sem pgvector, catálogo inicial de 3.131 Produtos e Laravel AI v0.3.2, onde e como devem ser persistidos e consultados os embeddings — modernização/extensão da base ERP, PostgreSQL vetorial separado, serviço vetorial ou busca exata controlada no piloto — e qual identidade de instalação/empresa, modelo, dimensão, disponibilidade, backup e fallback cada opção exige?

## Answer

### Topologia escolhida

Cada cliente executará, no mesmo servidor da implantação, dois serviços PostgreSQL independentes:

1. PostgreSQL legado 9.5, preservado como fonte de verdade do ERP.
2. PostgreSQL moderno com pgvector, dedicado às projeções e à administração transversal de IA.

Não será feita modernização da base legada por causa da Busca Assistida. Vetores não serão armazenados como JSON/array no PostgreSQL 9.5, calculados em PHP nem enviados inicialmente a serviço vetorial SaaS.

Os dois serviços têm porta, diretório de dados, serviço, usuário, limites de recursos, migrations e backups próprios. O PostgreSQL de IA fica na rede privada do Laravel e nunca é exposto diretamente à internet. Nenhuma migration ou extensão de IA roda no legado.

Decisão arquitetural: [Separate PostgreSQL with pgvector for AI projections](../../../docs/adr/0001-separate-postgresql-pgvector-for-ai.md).

### Autoridade e consistência

O legado é a única autoridade de Produto. A base de IA é uma projeção eventualmente consistente:

- jobs Laravel leem alterações, montam Documento Semântico, calculam hashes e atualizam pgvector;
- não há trigger entre bases, escrita reversa nem transação distribuída;
- antes de exibir, o Laravel confirma no legado que o Produto continua ativo/em linha;
- Filial, saldo, disponibilidade, preço e Permissões são resolvidos ao vivo no legado;
- Produto inativado ainda presente no vetor nunca pode aparecer após a validação final;
- administração mostra cobertura, atraso e última sincronização;
- falha da projeção não afeta Cadastro, Consulta ou lupa.

### Conteúdo da base de IA

Persistir:

- documentos normalizados, partes, fontes e hashes;
- provider, modelo, dimensão, versão do normalizador e embeddings;
- gerações e estado de ativação;
- jobs, cobertura e falhas;
- cache HMAC de consultas;
- métricas agregadas, consumo e feedback sem identidade;
- bloqueios administrativos de Produtos;
- Auditoria da administração de IA.

Documento, vetor e cache são reconstruíveis. Feedback, bloqueios, consumo e Auditoria não são, portanto a base possui backup regular e restauração coordenada com a implantação. Perda sem backup desabilita toda a Busca Assistida até restauração ou reconstrução aprovada; não libera bloqueios desconhecidos.

### Primeira geração do índice

- Provider: OpenAI.
- Modelo: `text-embedding-3-small`.
- Dimensão: 1.536.
- Métrica: cosseno.
- Identidade da geração: provider + modelo + dimensão + `normalizer_version`.

Gerações incompatíveis nunca se misturam. Troca de modelo/dimensão cria geração paralela; a anterior atende até a nova atingir cobertura mínima e ser ativada administrativamente. Rollback troca a geração ativa. Não haverá redução inicial de dimensões antes da avaliação de qualidade.

### Consulta vetorial

O caminho normal usa índice HNSW para distância cosseno. Busca exata fica disponível somente em testes, calibração e diagnóstico administrativo. Avaliações comparam HNSW à referência exata para medir recall.

Quando um Produto tiver várias partes:

- HNSW recupera partes candidatas;
- partes são consolidadas em um único Produto pelo melhor resultado;
- candidatos são limitados antes de consultar dados dinâmicos no legado.

Parâmetros HNSW são configuração técnica versionada e começam conservadores; pesos híbridos e limiares pertencem à decisão de recuperação.

### Operação e isolamento de recursos

- Laravel possui conexão `ai` distinta.
- Migrations são direcionadas explicitamente à conexão `ai`.
- Deploy fixa e valida versões compatíveis de PostgreSQL e pgvector.
- Health check cobre conexão, extensão, versão, geração ativa e índice.
- Usuário da aplicação possui privilégios mínimos.
- Timeout e pool/conexões são independentes do legado.
- Backfill usa baixa prioridade, lotes controlados e pode ser pausado.
- Limites de memória, conexões e manutenção impedem competição prejudicial com o ERP.
- Reinício/falha do serviço de IA não interfere no PostgreSQL legado.

### Disponibilidade e fallback

Indisponibilidade da conexão `ai`, ausência da extensão, geração incompleta ou índice inválido desabilita somente a Busca Assistida e aciona a governança já decidida. Não há scan em PHP, fallback para SaaS, provider mais caro ou alteração silenciosa da lupa.

### Consequências verificáveis

Testes/deploy devem comprovar conexões separadas, migrations no destino correto, ausência de escrita no legado, validação dinâmica do Produto, gerações incompatíveis isoladas, ativação/rollback, HNSW versus exato, consolidação por Produto, health check, backup/restore, resource limits e funcionamento integral da lupa com o serviço de IA parado.
