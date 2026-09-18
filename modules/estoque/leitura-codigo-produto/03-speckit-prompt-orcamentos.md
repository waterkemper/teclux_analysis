# Prompt para `/speckit.specify`

```text
/speckit.specify

Com base em `.scratch/leitura-codigo-produto-wayfinder/research/03-auditoria-laravel-inclusao-orcamentos.md`, crie a especificação funcional e técnica para ajustar somente o Laravel do Cadastro de Orçamentos. O campo de produto do modal compartilhado deve aceitar código visual (`produtos.codigovisual`) e código de barras (`produtoscodigobarras.codigobarras`), preservando zeros à esquerda, antes de quantidade, preço, estoque, filial, elegibilidade e gravação.

Não investigar Delphi nem implementar nesta etapa. Use o código Laravel como fonte primária e cite arquivos/linhas. Defina normalização, precedência e colisões entre PK/visual/barcode, barcode inexistente ou múltiplo, separação PK técnica versus apresentação, pesquisa da lupa encontrando barcode e chegando ao mesmo lookup da digitação, ponto único de resolução e revalidação server-side de ativo, sistema, estoque da filial, preço > 0 e duplicata.

Preserve `replace`/`insert`/`increment`, edição sem duplicação, troca de código durante edição, quantidade sem estado residual, command gate, respostas stale, foco e fila de bipe. Entregue matriz de decisões e testes backend/frontend para visual numérico/alfanumérico, barcode com zeros à esquerda, inexistente, colisões, barcode duplicado, inativo, sem estoque, preço zero, duplicata, edição, lupa versus digitação, filial, quantidade e concorrência assíncrona. Não incluir Produto pela Busca Assistida/tool, não trocar PK por código visual/barcode e não criar rota nova sem justificar.
```
