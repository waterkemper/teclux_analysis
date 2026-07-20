# Busca Assistida de Produtos

Label: wayfinder:map

## Destination

Produzir um dossiê de arquitetura e um prompt SpecKit autocontido para implementar, inicialmente na Consulta de Estoques, uma Busca Assistida de Produtos reutilizável, híbrida, econômica e segura, que interprete texto ou ditado, recupere produtos com evidências do cadastro e preserve integralmente a lupa tradicional.

## Notes

- Consultar `CONTEXT.md` e usar `/domain-modeling` ao resolver decisões de linguagem ou fronteiras do domínio.
- O Laravel atual é o estado real de partida: inventariar Consulta de Estoques, lupa, componentes reutilizáveis, filtros, Laravel AI SDK, experiência de voz em Usuários, permissões, parâmetros, filas, cache e testes antes de propor novos seams.
- `produtos.busca` permanece responsável pela pesquisa textual PostgreSQL existente; não convertê-lo nem substituí-lo por embeddings.
- O índice semântico será separado, versionado e incremental. Reutilizar conteúdo já convertido quando conteúdo normalizado, versão do documento e modelo forem iguais.
- O Documento Semântico do Produto usa conteúdo comercial relativamente estável do cadastro, incluindo descrição, descrição complementar e características sem HTML e metadados úteis. Estoque, preço e Filial são consultados em tempo real e não entram no embedding.
- O fluxo padrão não chama modelo de chat: normaliza a consulta, reutiliza ou gera seu embedding, combina busca semântica e textual, aplica autorização/filtros dinâmicos e monta resultados no Laravel. Chat é opcional e explícito.
- A Busca Assistida pode se abster e nunca inventa benefícios, diagnóstico, prescrição ou indicação sem evidência no cadastro.
- O painel será reutilizável e inicialmente aberto pela Consulta de Estoques sem substituir a lupa; texto e ditado convergem para o mesmo fluxo.
- Não armazenar áudio nem vincular consulta ao Cliente/documento. Sanitizar identificadores, separar cache por empresa, reter dados operacionais por 90 dias e permitir limpeza administrativa.
- Habilitação exige parâmetro da empresa e permissão específica. Medir e limitar transcrição, embeddings de catálogo, embeddings de consulta e chat opcional.
- Falha, desativação, limite ou indisponibilidade da IA nunca pode bloquear nem degradar a lupa tradicional.
- Este mapa planeja e especifica; não implementa a funcionalidade.

## Decisions so far

<!-- Uma linha por ticket resolvido. -->

- [Pesquisar Laravel AI e embeddings](issues/02-pesquisar-laravel-ai-e-embeddings.md) — o v0.3.2 serve como gateway, mas cacheia lotes inteiros e não gerencia índice, chunking, custos ou retries; persistir por Produto um índice versionado por hash/provider/modelo/dimensão e processar somente ausentes ou alterados.

- [Inventariar estado atual do Laravel](issues/01-inventariar-estado-atual-laravel.md) — preserva a lupa `tsvector` e seu AuthZ dinâmico, integra a busca por painel/endpoint irmão com o mesmo contrato de seleção, reutiliza transcrição sem o NLU de Usuários e exige identidade empresarial explícita porque Filial não é tenant.

- [Auditar catálogo e infraestrutura vetorial](issues/03-auditar-catalogo-e-infraestrutura-vetorial.md) — encontrou 3.131 Produtos ativos, 994 com texto rico já derivado do HTML, `busca` lexical integralmente mantida por trigger e GIN, mas PostgreSQL 9.5 sem pgvector, tornando obrigatória a decisão de topologia do índice.

- [Decidir documento semântico e elegibilidade](issues/04-decidir-documento-semantico-e-elegibilidade.md) — indexa Produtos ativos/em linha com fontes comerciais em precedência explícita, normalização e divisão orientadas ao limite de tokens, hashes por parte, bloqueio individual e Evidências Comerciais literais, permitindo associação indireta neutra e abstenção.

- [Decidir segurança, privacidade e governança](issues/08-decidir-seguranca-privacidade-e-governanca.md) — usa a implantação isolada por cliente, um único Parâmetro e acesso herdado da Consulta, cache por HMAC sem texto por 90 dias, e uma administração de IA transversal com consumo por capacidade, cotas/alertas, Auditoria e falha isolada com lupa independente.

- [Decidir topologia do índice semântico](issues/10-decidir-topologia-indice-semantico.md) — mantém PostgreSQL 9.5 como autoridade e adiciona no mesmo servidor um serviço PostgreSQL moderno/pgvector isolado, com projeção assíncrona, geração OpenAI 1.536D versionada, HNSW e busca exata de referência.

- [Decidir recuperação híbrida e avaliação](issues/05-decidir-recuperacao-hibrida-e-avaliacao.md) — combina identificadores exatos, lexical e pgvector por fusão de posições, aplica filtros dinâmicos e diversidade por Característica, exige Evidência/abstenção calibrada e ativa versões somente após avaliação humana e gates mensuráveis.

- [Decidir indexação, cache e controle de custos](issues/06-decidir-indexacao-cache-e-controle-de-custos.md) — faz backfill aprovado e incremental por hash com reconciliação diária, lotes idempotentes, cache HMAC/single-flight, retenção versionada e reserva atômica de orçamento antes de qualquer chamada.

- [Prototipar painel reutilizável](issues/07-prototipar-painel-reutilizavel.md) — adota painel lateral contextual, com texto/ditado convergentes, filtros herdados, evidência detalhada, seleção desacoplada e retorno independente à lupa.

- [Consolidar dossiê e prompt SpecKit](issues/09-consolidar-dossie-e-prompt-speckit.md) — publica dossiê técnico e prompt autocontido para o Laravel, cobrindo arquitetura, UX, segurança, custos, rollout e testes sem dependência do Delphi.

## Not yet specified

Nenhuma névoa restante; a rota até o destino está definida.

## Out of scope

- Implementar a Busca Assistida durante o Wayfinder.
- Substituir ou tornar a lupa tradicional dependente de IA.
- Diagnosticar doenças, prescrever tratamento ou apresentar aconselhamento médico.
- Inserir automaticamente produtos em Orçamentos ou Contratos no MVP.
- Gerar ou reescrever automaticamente o conteúdo comercial dos Produtos.
- Vetorizar saldo, preço, Filial ou outros dados comerciais dinâmicos.
