# Investigar causa raiz do erro "SKU já cadastrado" na Magalu

Type: task
Status: open
Blocked by:

## Question

`MagaluDuplicateSkuRecoveryService` reconcilia vínculos que falharam com "Produto já cadastrado com este SKU" na Magalu. Em que condição exata esse erro ocorre — é uma condição de corrida (duas contas/processos publicando o mesmo SKU simultaneamente), uma falha de idempotência no fluxo de inclusão (reenviar um produto já publicado como INSERT em vez de UPDATE), ou está relacionado ao mesmo problema de truncamento de SKU do ticket 01 (dois produtos diferentes cujo SKU trunca para o mesmo valor)? Com que frequência esse erro ocorre hoje em produção?
