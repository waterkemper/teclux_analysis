Type: task
Status: resolved
Blocked by:

## Question

Qual é o estado real do Laravel relevante à Busca Assistida de Produtos — Consulta de Estoques e sua lupa, filtros/lookups e componentes reutilizáveis, pesquisa por `produtos.busca`, campos do catálogo, SDK de IA e voz já usados, cache/filas, permissões, parâmetros, multiempresa, rotas, contratos e testes — e quais seams devem ser preservados?

## Answer

### Consulta de Estoques e ponto de integração

A página Inertia `Cadastros/Estoque/ConsultaEstoques/Index` recebe do controller parâmetros, capacidades, Filiais autorizadas, URLs nomeadas e catálogo de colunas. O filtro estruturado de Produto já abre uma lupa específica; ao selecionar uma linha, ela devolve `produto`, `codigovisual` e `descricao`, e a página transforma isso em `codigo eq <produto>`.

Esse é o seam correto para o MVP: uma ação irmã abre o painel de Busca Assistida e devolve o mesmo contrato mínimo de seleção. Ela não precisa conhecer a geração da consulta. O componente genérico `ErpTwoColumnCatalogLookup` oferece paginação, pesquisa/ordenação por coluna e grid configurável; o painel semântico pode reutilizar primitives e o contrato de seleção, mas precisa de UI própria para ditado, evidências, abstenção e feedback.

### Lupa atual e busca textual

O endpoint `estoque.consulta-estoques.lookups.produtos` chama service/repository exclusivos da Consulta de Estoques. O request valida pesquisa, campo, página, limite, ordenação, Filiais, situação e Cliente. O repository usa whitelists, pagina no servidor (máximo 100) e retorna `data/meta/columns`.

O campo virtual `avancado` serve exclusivamente para a busca full-text. No PostgreSQL:

```sql
p.busca @@ plainto_tsquery(converte_texto(?))
```

e a ordenação usa `ts_rank_cd(..., 32)`. Logo, `produtos.busca` é índice lexical `tsvector`, não embedding. A Busca Assistida terá endpoint, service/repository e storage próprios; poderá combinar a busca lexical, mas não mudará `avancado` nem seu contrato.

### Contexto comercial que deve ser reutilizado

A lupa já é a autoridade para:

- Filiais solicitadas ∩ autorizadas;
- Filiais independentes e Filial base;
- consolidação apenas sobre Filiais efetivas autorizadas;
- saldos, pedidos e preços por Produto+Filial;
- omissão server-side de preços e comissões sem capability;
- situação, grades, modelos, especificações, referência, código visual, barras, peso e mnemônico;
- código do Produto no Cliente quando parametrizado e com Cliente explícito.

A busca semântica deve recuperar IDs candidatos e depois passar pelo mesmo enriquecimento/autorização. Saldo, preço, pedidos, comissões e Filial não entram no embedding.

### Conteúdo de Produto visível hoje

Leitores atuais usam principalmente `produtos.descricao`, `caracteristicas.descricao`, códigos, referência, marca, grupo/classe, grades, modelos/especificações e observações de venda. O cadastro também trata `caracteristicas.observacao` e `observacoesvenda`, além de textos de grupo, classe e marca.

O leitor de Marketplace compõe Produto+Característica+Marca, mas seu payload é curto e orientado à integração externa; não é Documento Semântico pronto. Não foi encontrado consumo Laravel de `produtos.descricaocomplementar` nem do HTML `produtos.caracteristicas`. Também não existe normalizador HTML para eles: `EncodingSanitizer` corrige encoding de saída, não sanitiza HTML. Tipos, conteúdo, preenchimento e autoria ficam para **Auditar catálogo e infraestrutura vetorial**.

### Laravel AI SDK e voz

O projeto instala `laravel/ai` v0.3.2. `config/ai.php` já configura provider/modelo de embeddings; OpenAI usa por padrão `text-embedding-3-small`. Não existe service de embeddings, índice vetorial ou busca semântica de Produtos.

A voz oferece seams aproveitáveis:

- `SpeechTranscriberInterface` e adapter Laravel AI;
- transcrição em português, provider e timeout configuráveis;
- retry e erros seguros;
- upload autenticado, limite de arquivo e rate limiter por usuário;
- fakes e testes;
- componentes React para microfone/`MediaRecorder`.

O fluxo completo, porém, é específico do cadastro de Usuários: rotas, hooks e chat próprios, e interpretador por modelo de texto estruturado. A busca deve reutilizar gravação/transcrição e enviar o texto diretamente ao retrieval híbrido. Não deve chamar o agente NLU no caminho normal.

### Cache, filas, auditoria e custo

Redis é o padrão de cache e queue no ambiente de exemplo, com locks disponíveis. O job assíncrono de voz é apenas esqueleto. Marketplace já demonstra `content_hash` SHA-256 e detecção incremental por cursor/`updated_at`, padrões úteis para idempotência e backfill, mas a busca precisa de jobs/locks/estados próprios.

Não existem cache semântico, medição de custo de embeddings ou feedback de seleção. A auditoria de voz registra usuário, ação, intent, digest e metadata, mas não custo do provider.

### Permissões, parâmetros e isolamento

Consulta de Estoques usa `acessosmodulos`/`usuariosacessosmodulos`, com capabilities nomeadas e enforcement server-side. A Busca Assistida deve ter capability filha própria. Ao enriquecer resultados, preços e comissões continuam sujeitos às capabilities atuais.

Parâmetros são resolvidos por `ParameterService`, normalmente por Filial ativa/base. Ainda não há habilitação, limites ou retenção para a busca. Provider e credencial são configuração de infraestrutura; segredo não deve ser Parâmetro do Sistema.

Não foi encontrada tenancy genérica ou troca dinâmica de conexão. Há uma conexão padrão e escopo por Filial. Filial não é sinônimo de empresa/tenant. A identidade que particiona documentos, cache, limites e auditoria precisa ser decidida em **Decidir segurança, privacidade e governança**.

### Testes existentes e gaps

A Consulta possui testes Feature/Unit de acesso, Filiais, geração, cancelamento/timeout, filtros, lookup, capacidades, consolidação, detalhes e mutações. Voz possui testes de adapters, transcrição, falhas, abuso/rate, schema, auditoria, confirmação e fakes. Ainda não há testes de embeddings, pgvector, cache semântico, HTML, custo ou ranking.

### Seams obrigatórios

1. Manter a lupa e o significado de `avancado` intactos e sempre disponíveis.
2. Integrar por painel/endpoint irmão usando o contrato `produto/codigovisual/descricao`.
3. Reutilizar Filiais autorizadas, preço e enriquecimento dinâmico; não duplicá-los no índice.
4. Criar capability própria e preservar AuthZ server-side de preço/comissão.
5. Reutilizar microfone, transcrição, timeout, retry, rate limit e fakes; não o NLU de Usuários.
6. Usar jobs, locks e hash próprios; o job de voz não está pronto.
7. Criar Documento Semântico/storage próprios; não reutilizar `produtos.busca` nem o payload curto de Marketplace.
8. Normalizar HTML com mecanismo dedicado antes de embedding ou evidência.
9. Recalcular dados dinâmicos em toda consulta.
10. Definir identidade empresarial verificável; nunca usar Filial como tenant por suposição.
