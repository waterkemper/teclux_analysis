# PROTOTIPO DESCARTAVEL

Este artefato responde somente se as primitives vetoriais do Laravel 13.x preservam a forma do `VectorSearchRepository`. Ele nao acessa banco, nao grava dados e nao altera producao.

Execute com:

```text
php .scratch/busca-assistida-preco-tolerante-wayfinder/prototype/VectorSearchRepositoryPrototype.php
```

O SQL exibido e conceitual. A validacao de SQL executado, score, dimensao e plano de consulta depende do container PHP 8.5 com PostgreSQL/pgvector; este prototipo nao declara essa suite verde.
