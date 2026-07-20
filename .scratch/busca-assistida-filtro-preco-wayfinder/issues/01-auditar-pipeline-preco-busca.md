# Auditar o pipeline atual de preço e filtros da Busca Assistida

Type: task
Status: resolved
Blocked by:

## Question

Onde e como o preço entra hoje no pipeline de busca (recuperação, corte de candidatos, revalidação), qual mecanismo de filtro já existe (bespoke vs. registry compartilhado), e que precedente de parsing de frases de comparação em português existe no app?

## Answer

### Normalização da consulta hoje

`QueryNormalizer::normalize()` só colapsa espaços e faz trim — nenhuma tokenização, extração de número/moeda ou reconhecimento de comparação ("abaixo de", "até", "acima de") em lugar nenhum do pipeline. `DocumentNormalizer` é outra classe, atua sobre o texto do Produto/evidência, não sobre a consulta do usuário.

`ExactIdentifierMatcher` (código/código visual/referência/código de barras) trata a consulta inteira como um único valor exato via lookup no banco — não é um modelo de "extrair um trecho numérico de dentro de uma frase maior"; uma extração de preço é uma operação de formato diferente, precisa ser construída do zero.

### Ordem de operações e o problema do corte de candidatos

Pipeline confirmado (`HybridProductRetrievalService::retrieve` + `BuscaAssistidaSearchService::search`):

1. Recuperação: exata + lexical + vetorial (cada uma capada em 50) → Reciprocal Rank Fusion.
2. Consolidação e corte para `candidate_cap` (config `busca_assistida.candidate_cap`, hoje 50) — **nenhum preço existe ainda neste ponto**.
3. Revalidação em lote (`LegacyBuscaAssistidaRevalidationRepository::revalidate`) — **primeiro e único ponto onde o preço é calculado**, para os candidatos já cortados.
4. Mapeamento dos itens, evidência/abstenção, filtros (`applyProductFilters`), fotos.

`OrcamentoBuscaAssistidaSearchService` (já existe — implementação do mapa anterior) segue a mesma ordem, só que calcula preço por item via `OrcamentoCargoPriceResolver::resolvePrecoVendaParaCliente` dentro do laço de mapeamento, também depois do corte.

**Implicação central**: como o preço só é conhecido depois do corte de 50, filtrar por preço só depois da revalidação (caminho barato, mesma posição do filtro `item_produto.codigo` de hoje) é **funcionalmente correto mas com perdas** — pode devolver menos resultados do que existem no catálogo se mais de 50 candidatos relevantes existirem e só parte deles couber na faixa de preço pedida. Levar essa decisão ao ticket de aplicação no pipeline.

### Mecanismo de filtro existente

`ProductFilterFieldOperatorRegistry` já define um vocabulário `eq/neq/gt/gte/lt/lte/contains` usado em outras telas (datas de lote, faixas numéricas em Consulta de Contratos) — mas **nenhum campo de preço existe no registro hoje**, para nenhuma aba. E mais importante: `BuscaAssistidaSearchService::applyProductFilters` (e seu gêmeo em Orçamentos) é **bespoke e isolado** desse registro — reconhece só `item_produto.codigo eq/neq` manualmente, sem validar contra o registro compartilhado. `BuscaAssistidaSearchRequest` também não valida `tab`/`field`/`op`.

### Precedente de parsing de frases em português

**Não existe nenhum parser de frase de comparação em português no app.** O que existe é vocabulário de operador já **estruturado** (dropdown com rótulos como "Maior que"/"Menor que", ou payloads `{op, valor}` já montados por formulário) — nunca extração de texto livre. Qualquer parser de "abaixo de X" precisa ser construído do zero.

### Nomenclatura

`CONTEXT.md` já reserva "Faixa de Preço" para outro conceito (seleção de faixa de preço do Produto dentro de sua Característica) — não pode ser reaproveitado para nomear "uma restrição de preço digitada na busca". Precisa de termo novo, via `/domain-modeling`.