Type: grilling
Status: resolved
Blocked by: 01, 02, 03, 04, 10

## Question

Qual deve ser o ciclo de backfill e atualização incremental dos embeddings, a identidade de cache de documentos e consultas, invalidação, concorrência, filas, retenção, limites, fallback e observabilidade para evitar reconversões e controlar custo sem servir dados dinâmicos obsoletos?

## Answer

### Backfill inicial

1. Manter o Parâmetro da Busca Assistida desligado.
2. Executar prévia local sem provider: elegíveis, documentos/partes, tokens, hashes existentes, custo e espaço estimados.
3. Exigir aprovação administrativa.
4. Enfileirar somente partes ausentes na geração.
5. Processar lotes pequenos, baixa prioridade e cota exclusiva de indexação.
6. Proteger cada Produto/geração com lock e job idempotente.
7. Persistir sucessos parciais; retomada continua dos pendentes.
8. Pausar por cota, erro repetido ou ação administrativa.
9. Após cobertura, construir/validar HNSW e executar avaliação.
10. Ativar geração e depois habilitar o Parâmetro somente após todos os gates.

Backfill nunca compete com a reserva das consultas e pode ser pausado sem perder trabalho.

### Detecção incremental e reconciliação

Usar dois mecanismos:

- incremental frequente, configurável, por `updated_at`, logs e cursores das fontes relacionadas;
- reconciliação completa diária em horário de menor uso, remontando todos os documentos elegíveis e comparando hashes localmente.

A reconciliação cobre mudanças indiretas em Característica, Modelo, Marca, Grupo ou Classe que não atualizem `produtos.updated_at`.

- hash igual: zero chamada e zero escrita vetorial;
- hash novo: enfileirar somente partes novas/alteradas;
- parte removida: retirar após persistência atômica do novo documento;
- inativado, fora de linha ou bloqueado: inelegível imediatamente;
- reativado: reutilizar hashes ainda existentes;
- varredura retoma por cursor;
- locks e upserts impedem duplicação.

### Lotes e falhas por item

Laravel AI SDK é transporte, não cache autoritativo:

- selecionar somente hashes ausentes;
- formar lotes por máximo de inputs e orçamento de tokens configuráveis;
- não misturar provider/modelo/dimensão/geração;
- mapear resposta a cada hash;
- persistir cada sucesso individualmente;
- subdividir lote falho para isolar entrada problemática;
- retry/backoff somente em falha transitória;
- falha permanente marca a parte, sem invalidar sucessos;
- antes da chamada, consultar novamente o índice para evitar corrida/cobrança dupla;
- não depender do cache agregado do SDK.

### Cache de consulta

O normalizador de consulta é versionado e normaliza Unicode, espaços, caixa e pontuação periférica, preservando números e termos significativos. Texto e transcrição equivalentes produzem a mesma forma.

Chave:

```text
HMAC(normalized_query + query_normalizer_version + provider + model + dimensions)
```

Persistir somente embedding, metadados técnicos, uso e expiração de 90 dias. Rotação do segredo invalida cache anterior. Filial, preço e disponibilidade não pertencem à chave.

Candidatos semânticos podem ter cache curto, sempre vinculado à geração ativa. Resultado final nunca é cacheado. Produto, estado, bloqueio, Filial, saldo, preço e Permissões são revalidados; lexical consulta o legado atual.

### Concorrência single flight

Cache miss adquire lock distribuído pelo HMAC. Requisições iguais aguardam brevemente o primeiro preenchimento e reutilizam o vetor. Expiração permite somente um novo dono; timeout não dispara rajada de chamadas. Lock não envolve busca lexical nem dados dinâmicos.

O mesmo contrato usa hash + geração para partes de catálogo. Métricas distinguem hit, miss, espera compartilhada e chamada real.

### Retenção

- manter geração ativa e anterior para rollback;
- após 30 dias estáveis, anterior pode ser arquivada/removida administrativamente;
- experimental nunca ativada expira após 30 dias sem atividade;
- embeddings de Produto inelegível permanecem na geração suportada para reativação sem custo;
- partes substituídas permanecem 90 dias;
- cache de consultas permanece 90 dias;
- Auditoria segue backup/retenção próprios;
- administração mostra espaço recuperável e exige confirmação para remover geração.

### Reserva atômica de orçamento

Antes de chamada:

1. estimar tokens/custo;
2. reservar atomicamente na categoria indexação, consulta ou transcrição;
3. negar/pausar se exceder;
4. reconciliar após resposta com consumo real;
5. falha com cobrança desconhecida fica pendente de reconciliação, sem liberação silenciosa.

Consultas interativas possuem reserva protegida. Backfill usa sua cota. Alertas de 80%, 95% e 100% consideram confirmado + reservado. Métricas separam estimado, reservado, confirmado, economia por cache e falhas.

### Estados e observabilidade

Produto/parte: pendente, processando, indexado, falho, inelegível ou bloqueado. Job registra tentativas, categoria segura de erro, timestamps e geração, sem conteúdo.

Expor por capacidade:

- cobertura e atraso;
- fila, throughput e falhas;
- tokens/custo estimado, reservado e confirmado;
- cache hit/miss/single-flight;
- geração ativa/anterior;
- HNSW e última reconciliação;
- alertas e circuit breaker.

Falha, cota ou atraso afeta somente IA; não há fallback para scan PHP, modelo caro ou lupa.

### Testes verificáveis

Cobrir dry-run sem provider, aprovação, retomada, hashes estáveis, mudanças diretas/indiretas, reconciliação, lotes/subdivisão, retry, upsert/locks, cache/HMAC/rotação, single flight, dados dinâmicos atuais, retenção/GC/rollback, reserva concorrente de orçamento, reconciliação de consumo, alertas e independência da lupa.
