Type: task
Status: resolved
Blocked by:

## Question

Qual é o volume e a qualidade reais do catálogo elegível — preenchimento, tamanho, HTML e duplicação dos campos comerciais —, qual mecanismo mantém `produtos.busca`, e a base PostgreSQL já dispõe de `pgvector` ou estrutura equivalente para armazenar e consultar embeddings com isolamento por empresa?

## Answer

### Base auditada

Levantamento somente leitura em `puxare`, `public`, PostgreSQL **9.5.25**. A instalação possui `pg_trgm`, `plpgsql`, `postgres_fdw` e `unaccent`. A extensão `vector`/pgvector não está instalada nem aparece em `pg_available_extensions`; apenas `cube` aparece disponível e não constitui substituto direto para embeddings modernos.

Não existe coluna vetorial, tabela de embeddings ou índice ANN no schema inspecionado. A base atual, portanto, não suporta a arquitetura pgvector pretendida sem mudança de infraestrutura/extensão. Também não há tenant empresarial no schema da aplicação: a conexão à base é a fronteira observável e Filial é somente escopo operacional.

### Volume e elegibilidade inicial

| Métrica | Quantidade |
|---|---:|
| Produtos totais | 19.176 |
| Produtos ativos e em linha | 3.131 |
| Ativos com descrição complementar rica | 993 |
| Ativos com características ricas | 773 |
| Ativos com ao menos um dos textos ricos | 994 |
| Ativos com `description` | 115 |
| Ativos com `busca` preenchida | 3.131 |
| Ativos com `busca` vazia | 0 |

Usando como aproximação somente `descricao + descricao_complementar_text + caracteristicas_text`, os 3.131 documentos ativos somam **871.118 caracteres**, média 278, mediana 55, p90 1.024, p99 1.391 e máximo 3.422. O catálogo elegível para o piloto é pequeno e permite backfill em lotes conservadores.

Todos os Produtos possuem `updated_at`, entre junho e julho de 2026. Como esse campo foi implantado/backfillado recentemente, ele serve para detectar mudanças futuras, mas não prova histórico anterior. `content_hash` continua sendo a identidade idempotente confiável.

### HTML e texto derivado

`produtos` contém:

- `descricaocomplementar varchar(20000)`;
- `caracteristicas varchar(100000)`;
- `descricao_complementar_text text`;
- `caracteristicas_text text`;
- `description text`;
- `busca tsvector`.

No catálogo total:

| Campo | Preenchidos | Média | P90 | Máximo |
|---|---:|---:|---:|---:|
| `descricao` | 19.176 | 45 | 63 | 100 |
| HTML complementar | 3.353 | 983 | 2.135 | 9.087 |
| Texto complementar derivado | 3.353 | 253 | 418 | 1.028 |
| HTML de características | 1.848 | 4.809 | 8.647 | 27.145 |
| Texto de características derivado | 1.846 | 497 | 874 | 2.848 |
| `description` | 168 | 117 | 143 | 279 |

Há trigger `trg_produtos_fill_derived_cols`, executada antes de insert ou atualização dos HTMLs. Ela chama `strip_html_tags`, que remove blocos `style`, `script`, comentários, tags restantes e normaliza espaços. Não é necessário enviar o HTML bruto ao provider quando o texto derivado estiver coerente.

Os dois HTMLs de características sem texto útil geram string vazia após limpeza; não representam falha de trigger. Mesmo assim, o Documento Semântico deve normalizar novamente no domínio da aplicação, versionar o normalizador e nunca confiar no HTML para evidência sem escaping/sanitização.

`descricao_complementar_text` tem 1.119 duplicações entre 3.353 linhas e `caracteristicas_text` tem 147 entre 1.846, algo esperado em variantes. Porém, quando a descrição do Produto é incluída na composição mínima dos 3.131 ativos, todos os hashes de documento são distintos. Assim, deduplicar apenas pelo documento completo não economiza o backfill atual; reutilização deve ocorrer quando o mesmo Produto/hash já tiver sido convertido.

### Manutenção de `produtos.busca`

`busca` é `tsvector`, nunca nula no catálogo, com índice GIN. A trigger `produtos_antesinseriratualizar` a recompõe em toda inclusão/alteração com pesos:

- peso A para `nome_site` e valores de grade, em configuração normal e `pt_no_stem` com `unaccent`;
- peso B para palavras-chave e Marca;
- peso C para hierarquia/menu de categorias;
- também códigos, referência e palavras de categorias na continuação da expressão.

A lupa usa `plainto_tsquery(converte_texto(?))` e `ts_rank_cd`. Os textos ricos HTML/texto não aparecem como fonte direta comprovada dessa atribuição. Portanto, a busca lexical e o futuro Documento Semântico têm coberturas complementares.

Foram encontrados dois índices GIN com definição idêntica sobre `busca` (`produtos_gidx` e, apesar do nome, `clientes_gidx`). Essa duplicidade é um achado de manutenção, mas removê-la está fora do destino deste mapa.

### Qualidade e implicações

1. O universo padrão do MVP pode ser Produto com `inativo IS NULL AND foralinha IS NULL`; estado e estoque ainda serão filtrados em tempo real.
2. Todo Produto ativo tem descrição curta e busca lexical; apenas 31,7% têm texto rico, logo o sistema deve funcionar com documentos curtos e se abster quando a evidência for fraca.
3. Preferir os campos `*_text` aos HTMLs reduz bytes e elimina markup antes do provider, mas o normalizador Laravel precisa produzir conteúdo canônico e hash próprio.
4. Campos rich text são muito menores após limpeza; não há motivo para vetorizar HTML.
5. `updated_at` pode alimentar varredura incremental, mas a decisão final de reconversão é `content_hash + normalizer_version + provider + model + dimensions`.
6. Não há isolamento multiempresa dentro dessa base além da própria conexão. Uma futura tabela local seria naturalmente isolada por banco; armazenamento externo precisará de chave de instalação/empresa explícita.
7. O PostgreSQL 9.5 sem pgvector torna a topologia do índice uma decisão obrigatória antes de definir SQL, dimensão, ANN, rollout e recuperação.
