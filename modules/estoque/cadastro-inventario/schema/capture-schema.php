<?php
declare(strict_types=1);

$output = $argv[1] ?? '';
if ($output === '') {
    fwrite(STDERR, "Usage: php capture-schema.php postgresql-authoritative-YYYY-MM-DD.json\n");
    exit(2);
}

$env = [];
foreach (file(dirname(__DIR__, 4).'\\laravel\\backend\\.env', FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES) as $line) {
    $line = trim($line);
    if ($line === '' || $line[0] === '#' || ! str_contains($line, '=')) {
        continue;
    }
    [$key, $value] = explode('=', $line, 2);
    $env[trim($key)] = trim($value, " \t\n\r\0\x0B\"'");
}

$pdo = new PDO(
    sprintf(
        'pgsql:host=%s;port=%s;dbname=%s',
        getenv('SCHEMA_CAPTURE_HOST') ?: '127.0.0.1',
        $env['DB_PORT'] ?? '5432',
        $env['DB_DATABASE'] ?? '',
    ),
    $env['DB_USERNAME'] ?? '',
    $env['DB_PASSWORD'] ?? '',
    [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC],
);

$relationNames = [
    'inventario', 'inventarioprodutos', 'inventarioprodutoslotes', 'produtos',
    'caracteristicas', 'classes', 'grupos', 'marcas', 'promocoes', 'filiais',
    'fornecedoresprodutos', 'estoques', 'estoqueslotes', 'movimentos',
    'movimentoslotes', 'lotes', 'grades', 'parametros', 'parametrosfiliais',
];
$functionNames = ['quantidadetotaldoestoque', 'parametros_valor'];

$pdo->beginTransaction();
$pdo->exec('SET TRANSACTION READ ONLY');

$meta = $pdo->query(
    "SELECT current_database() AS database_name, current_user AS database_user,
            current_schema() AS schema_name, version() AS server_version,
            current_setting('server_encoding') AS server_encoding,
            current_setting('client_encoding') AS client_encoding,
            current_setting('TimeZone') AS timezone"
)->fetch();

$relations = [];
$missingRelations = [];
$relationSql = "SELECT c.oid, n.nspname AS object_schema, c.relname AS name,
    c.relkind, CASE c.relkind WHEN 'r' THEN 'table' WHEN 'v' THEN 'view'
    WHEN 'm' THEN 'materialized_view' WHEN 'f' THEN 'foreign_table'
    WHEN 'p' THEN 'partitioned_table' ELSE c.relkind::text END AS kind,
    pg_get_userbyid(c.relowner) AS owner, c.reltuples::bigint AS estimated_rows,
    obj_description(c.oid, 'pg_class') AS comment
    FROM pg_class c JOIN pg_namespace n ON n.oid = c.relnamespace
    WHERE n.nspname = 'public' AND c.relname = :name
    AND c.relkind IN ('r','v','m','f','p')";
$columnSql = "SELECT a.attnum AS ordinal, a.attname AS name,
    pg_catalog.format_type(a.atttypid, a.atttypmod) AS data_type,
    a.attnotnull AS not_null, pg_get_expr(d.adbin, d.adrelid) AS default_expression,
    col_description(a.attrelid, a.attnum) AS comment
    FROM pg_attribute a LEFT JOIN pg_attrdef d
    ON d.adrelid = a.attrelid AND d.adnum = a.attnum
    WHERE a.attrelid = :oid AND a.attnum > 0 AND NOT a.attisdropped ORDER BY a.attnum";
$constraintSql = "SELECT conname AS name, contype AS type,
    pg_get_constraintdef(oid, true) AS definition, convalidated AS validated
    FROM pg_constraint WHERE conrelid = :oid ORDER BY conname";
$indexSql = "SELECT i.indexrelid::regclass::text AS name,
    i.indisprimary AS primary, i.indisunique AS unique,
    pg_get_indexdef(i.indexrelid) AS definition
    FROM pg_index i WHERE i.indrelid = :oid ORDER BY 1";
$triggerSql = "SELECT tgname AS name, tgenabled AS enabled,
    pg_get_triggerdef(oid, true) AS definition
    FROM pg_trigger WHERE tgrelid = :oid AND NOT tgisinternal ORDER BY tgname";

foreach ($relationNames as $name) {
    $stmt = $pdo->prepare($relationSql);
    $stmt->execute(['name' => $name]);
    $relation = $stmt->fetch();
    if ($relation === false) {
        $missingRelations[] = $name;
        continue;
    }
    $oid = (int) $relation['oid'];
    $stmt = $pdo->prepare($columnSql);
    $stmt->execute(['oid' => $oid]);
    $relation['columns'] = $stmt->fetchAll();
    $stmt = $pdo->prepare($constraintSql);
    $stmt->execute(['oid' => $oid]);
    $relation['constraints'] = $stmt->fetchAll();
    $stmt = $pdo->prepare($indexSql);
    $stmt->execute(['oid' => $oid]);
    $relation['indexes'] = $stmt->fetchAll();
    $stmt = $pdo->prepare($triggerSql);
    $stmt->execute(['oid' => $oid]);
    $relation['triggers'] = $stmt->fetchAll();
    unset($relation['oid']);
    $relations[] = $relation;
}

$sequences = $pdo->query(
    "SELECT n.nspname AS object_schema, seq.relname AS name,
        pg_get_userbyid(seq.relowner) AS owner, tbl.relname AS owned_by_relation,
        att.attname AS owned_by_column
        FROM pg_class seq JOIN pg_namespace n ON n.oid = seq.relnamespace
        LEFT JOIN pg_depend dep ON dep.classid = 'pg_class'::regclass
        AND dep.objid = seq.oid AND dep.deptype = 'a'
        LEFT JOIN pg_class tbl ON tbl.oid = dep.refobjid
        LEFT JOIN pg_attribute att ON att.attrelid = tbl.oid
        AND att.attnum = dep.refobjsubid
        WHERE n.nspname = 'public' AND seq.relkind = 'S'
        AND (seq.relname = 'chave' OR tbl.relname = ANY(ARRAY['inventario',
        'inventarioprodutos','inventarioprodutoslotes','movimentos','movimentoslotes']))
        ORDER BY seq.relname"
)->fetchAll();

$functions = [];
$missingFunctions = [];
$functionStmt = $pdo->prepare(
    "SELECT n.nspname AS object_schema, p.proname AS name,
        pg_get_function_identity_arguments(p.oid) AS arguments,
        pg_get_function_result(p.oid) AS result_type,
        pg_get_functiondef(p.oid) AS definition
        FROM pg_proc p JOIN pg_namespace n ON n.oid = p.pronamespace
        WHERE n.nspname = 'public' AND lower(p.proname) = :name ORDER BY p.oid"
);
foreach ($functionNames as $name) {
    $functionStmt->execute(['name' => $name]);
    $rows = $functionStmt->fetchAll();
    if ($rows === []) {
        $missingFunctions[] = $name;
    } else {
        array_push($functions, ...$rows);
    }
}
$pdo->rollBack();

$payload = [
    'authority' => 'authoritative',
    'captured_at' => (new DateTimeImmutable())->format(DateTimeInterface::ATOM),
    'database' => $meta['database_name'],
    'schema' => $meta['schema_name'],
    'database_user' => $meta['database_user'],
    'server_version' => $meta['server_version'],
    'server_encoding' => $meta['server_encoding'],
    'client_encoding' => $meta['client_encoding'],
    'timezone' => $meta['timezone'],
    'collection_mode' => 'BEGIN; SET TRANSACTION READ ONLY; pg_catalog; ROLLBACK',
    'requested_relations' => $relationNames,
    'requested_functions' => $functionNames,
    'relations' => $relations,
    'sequences' => $sequences,
    'functions' => $functions,
    'missing_relations' => $missingRelations,
    'missing_functions' => $missingFunctions,
    'runtime_rules' => [
        'JSON is a specification and CI gate; business code must not introspect schema.',
        'Do not use hasTable, Schema::has*, information_schema or pg_catalog in business code.',
        'Missing objects block SQL specification; divergence requires a new dated capture.',
        'Choose INNER JOIN or LEFT JOIN from proven nullability, FK, cardinality and semantics.',
        'Do not reproduce MAX()+1 or sequence-state allocation.',
    ],
    'limitations' => [
        'reltuples is a structural estimate, not an EXPLAIN or benchmark.',
        'The capture covers the relations and functions named by the Inventory SQL evidence.',
    ],
];

$json = json_encode($payload, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_INVALID_UTF8_SUBSTITUTE);
if ($json === false) {
    throw new RuntimeException(json_last_error_msg());
}
file_put_contents(__DIR__.'/'.$output, $json.PHP_EOL);
fwrite(STDOUT, __DIR__.'/'.$output.PHP_EOL);
