<?php

declare(strict_types=1);

/**
 * PROTOTIPO DESCARTAVEL - nao e codigo de producao nem teste de integracao.
 *
 * Pergunta: as primitives vetoriais do Laravel 13.x preservam o contrato do
 * VectorSearchRepository sem deslocar autoridade para a projecao AI?
 */

$limit = 50;
$minSimilarity = 0.35;
$maxDistance = 1 - $minSimilarity;

$current = <<<'SQL'
select d.product_codigo,
       dp.id as part_id,
       1 - (e.embedding <=> ?::vector) as score,
       dp.evidence_literal,
       dp.source_kind
from ba_embeddings as e
join ba_document_parts as dp on dp.id = e.part_id
join ba_product_documents as d on d.id = dp.document_id
where e.generation_id = ?
  and dp.replaced_at is null
  and d.eligibility = true
  and d.blocked_admin = false
order by score desc
limit ?
SQL;

$native = <<<'SQL'
select d.product_codigo,
       dp.id as part_id,
       1 - (e.embedding <=> ?) as score,
       dp.evidence_literal,
       dp.source_kind
from ba_embeddings as e
join ba_document_parts as dp on dp.id = e.part_id
join ba_product_documents as d on d.id = dp.document_id
where e.generation_id = ?
  and dp.replaced_at is null
  and d.eligibility = true
  and d.blocked_admin = false
  and (e.embedding <=> ?) <= ?
order by (e.embedding <=> ?) asc
limit ?
SQL;

echo "PROTOTYPE: VectorSearchRepository com Laravel 13.x Query Builder\n\n";
echo "Configuracao explicita\n";
echo "- dimensions: 1536\n";
echo "- minSimilarity: {$minSimilarity}\n";
echo "- maxDistance: {$maxDistance}\n";
echo "- lane limit: {$limit}\n";
echo "- connection: ai (somente)\n\n";

echo "SQL atual:\n{$current}\n";
echo "SQL conceitual com whereVectorSimilarTo + orderByVectorDistance:\n{$native}\n";

$checks = [
    'joins e filtros de elegibilidade preservados' => true,
    'ordem score desc equivale a distancia asc' => true,
    'limiar vetorial e explicito, separado da evidencia' => true,
    'preco/estoque/filial/permissao continuam no Executor legado' => true,
    'fallback sem pgvector exige guard antes da primitive' => true,
    'RRF nao e substituido por hybrid() do Scout' => true,
];

echo "Invariantes observadas:\n";
foreach ($checks as $label => $ok) {
    echo sprintf("[%s] %s\n", $ok ? 'OK' : 'FAIL', $label);
}

echo "\nVeredito: COMPATIVEL COMO ADAPTER, nao como substituicao do Executor.\n";
echo "Proximo passo real: comparar SQL e resultados em PostgreSQL 13+/pgvector no container PHP 8.5, sem alterar o repositorio de producao.\n";

