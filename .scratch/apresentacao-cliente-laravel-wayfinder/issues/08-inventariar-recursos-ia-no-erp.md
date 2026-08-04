# Inventariar recursos de IA já existentes dentro do ERP para o usuário final

Type: task
Status: resolved
Blocked by:

## Question

Existe hoje, no Laravel, algum recurso de IA voltado ao usuário final operando o sistema (ex.: busca assistida, sugestões, autocompletar inteligente, algo em `busca-assistida-produtos*`)? Inspecionar o código e os mapas Wayfinder relacionados (ex.: `.scratch/busca-assistida-produtos-wayfinder/`, `.scratch/busca-assistida-produtos-experiencia-wayfinder/`) e produzir uma resposta factual do que é IA de verdade vs o que é só busca/filtro tradicional, para não fazer overclaim na apresentação.

## Answer

Sim — existe IA real (não é overclaim). Recurso principal: **Busca Assistida de Produtos**, com pipeline de busca híbrida por embeddings (`HybridProductRetrievalService`, `QueryEmbeddingService`, `PartEmbeddingService`, `VectorSearchRepository`) usando provedores reais configurados (`config/ai.php`: OpenAI para embeddings — `text-embedding-3-small` —, Anthropic, Gemini, Cohere para reranking). Não é busca textual disfarçada.

Já está **ativo em dois módulos**: Consulta de Estoques e Orçamentos (rotas `busca-assistida/search`, `/feedback`, `/transcribe`, `/produtos/{produto}/detalhe`), com painel administrativo de governança (`admin/busca-assistida`). O usuário pode **ditar por voz** (transcrição via Whisper/OpenAI) uma necessidade em linguagem natural, e o sistema retorna candidatos com "Evidência Comercial" extraída do próprio cadastro (não inventa benefício), respeitando autorização de preço/estoque por Filial — com abstenção calibrada quando não há evidência suficiente (não "inventa" resposta).

Outros dois recursos de IA real encontrados no repo, para citar se fizer sentido no roteiro: sugestão automática de categoria de marketplace (`MarketplaceCategorySuggestionAgent`) e um assistente de voz para comandos em Usuários (`VoiceAssistant/LaravelAi`).

**Frase para o slide:** "A busca por produtos já entende linguagem natural e até voz — o operador descreve o que precisa (por texto ou falando) e o sistema entende, sem precisar saber o código ou o nome exato do produto. Isso já está em uso em Estoque e Orçamentos."
