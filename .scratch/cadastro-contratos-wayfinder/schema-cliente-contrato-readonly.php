<?php
$env = [];
foreach (file('/var/www/html/.env', FILE_IGNORE_NEW_LINES) as $line) {
    $line = trim($line);
    if ($line === '' || str_starts_with($line, '#') || !str_contains($line, '=')) continue;
    [$key, $value] = explode('=', $line, 2);
    $env[trim($key)] = trim($value);
}
$dsn = 'pgsql:host='.$env['DB_HOST'].';port='.$env['DB_PORT'].';dbname='.$env['DB_DATABASE'];
$pdo = new PDO($dsn, $env['DB_USERNAME'], $env['DB_PASSWORD'], [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
$pdo->beginTransaction();
$pdo->exec('SET TRANSACTION READ ONLY');
echo 'SOURCE_TRIGGERS', PHP_EOL;
$sql = <<<'SQL'
SELECT event_object_table, trigger_name, event_manipulation, action_timing, action_statement
FROM information_schema.triggers
WHERE trigger_schema='public'
  AND event_object_table IN ('clientes','fornecedores','filiais','vfornecedores')
ORDER BY event_object_table, trigger_name, event_manipulation
SQL;
foreach ($pdo->query($sql) as $r) echo implode('|', [$r['event_object_table'],$r['trigger_name'],$r['event_manipulation'],$r['action_timing'],$r['action_statement']]), PHP_EOL;
echo 'FUNCTIONS_REFERENCING_CONTRATOS', PHP_EOL;
$sql = <<<'SQL'
SELECT p.proname, pg_get_functiondef(p.oid) AS definition
FROM pg_proc p JOIN pg_namespace n ON n.oid=p.pronamespace
WHERE n.nspname='public'
  AND p.proname IN ('filiais_depoisatualizar','filiais_antesatualizar','replicacao_set_timestamps_fn')
ORDER BY p.proname
SQL;
foreach ($pdo->query($sql) as $r) echo 'FUNCTION|',$r['proname'],PHP_EOL,$r['definition'],PHP_EOL;
$pdo->rollBack();
