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
echo 'TABLES', PHP_EOL;
$tables = <<<'SQL'
SELECT table_name FROM information_schema.tables
WHERE table_schema = 'public' AND (
 table_name ~ '^(contratos|produtoscontratos|servicoscontratos|parcelas|impostosretidoscontratos|produtoscontratoslotes|produtoscontratosseries)(_log(_new)?)?$'
 OR table_name LIKE 'contatos%log%') ORDER BY table_name
SQL;
foreach ($pdo->query($tables) as $row) echo $row['table_name'], PHP_EOL;
echo 'TRIGGERS', PHP_EOL;
$triggers = <<<'SQL'
SELECT event_object_table, trigger_name, event_manipulation, action_timing, action_statement
FROM information_schema.triggers WHERE trigger_schema = 'public'
AND event_object_table IN ('contratos','produtoscontratos','servicoscontratos','parcelas','impostosretidoscontratos','produtoscontratoslotes','produtoscontratosseries','contatos','contatosvfornecedores')
ORDER BY event_object_table, trigger_name, event_manipulation
SQL;
foreach ($pdo->query($triggers) as $row) echo implode('|', [$row['event_object_table'],$row['trigger_name'],$row['event_manipulation'],$row['action_timing'],$row['action_statement']]), PHP_EOL;
echo 'LOG_COLUMNS', PHP_EOL;
$columns = <<<'SQL'
SELECT table_name, ordinal_position, column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_schema = 'public' AND table_name IN (
'contratos_log_new','produtoscontratos_log_new','produtoscontratoslotes_log_new',
'produtoscontratosseries_log_new','servicoscontratos_log_new','parcelas_log_new',
'impostosretidoscontratos_log_new','contatos_log_new','contatosvfornecedores_log_new')
ORDER BY table_name, ordinal_position
SQL;
foreach ($pdo->query($columns) as $row) echo implode('|', [$row['table_name'],$row['ordinal_position'],$row['column_name'],$row['data_type'],$row['is_nullable']]), PHP_EOL;
echo 'AUDIT_FUNCTION', PHP_EOL;
$function = <<<'SQL'
SELECT pg_get_functiondef(p.oid)
FROM pg_proc p JOIN pg_namespace n ON n.oid=p.pronamespace
WHERE n.nspname='public' AND p.proname='replicacao_audit_log_new_fn'
SQL;
foreach ($pdo->query($function) as $row) echo $row[0], PHP_EOL;
$pdo->rollBack();
