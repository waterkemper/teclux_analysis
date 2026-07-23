# Investigar causa raiz do SKU/listing ID truncado na Magalu

Type: task
Status: open
Blocked by:

## Question

`MagaluSellerSkuResolver::lookupCandidates` reconstrói heuristicamente um sufixo `"00"` perdido (`$shortCandidate . '00'`) ao comparar `external_sku`/`external_listing_id` truncados com `produto_codigo`. Onde exatamente, no fluxo de publicação/atualização de catálogo Magalu, o `produto_codigo` perde esse sufixo antes de ser gravado como `external_sku`/`external_listing_id`? É um bug de truncamento de campo (tamanho de coluna, `substr` acidental, cast numérico perdendo zeros à direita), um problema do lado da API Magalu, ou um dado legado já truncado antes da migração? Quantos vínculos afetados existem hoje em produção (escala do problema)?
