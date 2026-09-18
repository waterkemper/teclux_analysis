# Qualidade da amostra dos dados — relatório de evidências

Status da medição: PENDENTE. Não há uma base de cliente conectada/executável neste workspace; portanto, nenhum número foi inventado. As consultas abaixo são um roteiro para executar em uma cópia somente leitura do PostgreSQL legado 9.5/9.6.

## Resumo

- CONFIRMADO: existem fontes de saldo atual, eventos de movimentação, documentos fiscais, vendas perdidas e requisições entre filiais.
- CONFIRMADO: o Delphi declara para qryMovimentos produto, filial, tipo de movimento, quantidade, operação, data e snapshots de estoque. Evidência: delphi/apps/estoque/dmconsultacompras.pas:203-224.
- CONFIRMADO: movimentos são tratados como eventos + snapshots e o saldo inicial deve usar o último snapshot anterior ao período. Evidência: laravel/docs/architecture/estoque/ficha-produtos-read-model.md:16-20.
- CONFIRMADO: o shape de teste de estoques possui emestoque, reservado, transito, demonstracao, futuro, estoquefisico, reservaprevia, minimo, maximo, ultimaentrada, ultimavenda e data_alteracao. Evidência: laravel/backend/database/migrations/2026_04_13_000001_estoques_legacy_shape_sqlite.php:26-60.
- CONFIRMADO: vendasperdidas registra produto, filial, data/hora, vendedor e observação, mas não possui quantidade perdida no shape observado. Evidência: laravel/backend/database/migrations/2026_07_14_180001_vendasperdidas_sqlite_stub.php:18-30.
- CONFIRMADO: pedidosfiliais registra requisitante, requisitada, quantidade pedida/recebida, situação, documento fiscal e datas. Evidência: laravel/backend/database/migrations/2026_07_21_220000_sqlite_pedidosfiliais_legacy_shape.php:26-41.
- INFERIDO: é possível reconstruir série diária por produto e filial, mas os sinais de cada código ainda precisam ser confirmados na base do cliente.
- NÃO LOCALIZADO: amostra de cliente, contagens, primeira/última data, nulidade, duplicidade, atraso de carga e cobertura real por produto × filial.
- NÃO LOCALIZADO: autoridade única para traduzir todos os códigos de tipomovimento, operacao, estorno e situação fiscal. A Consulta de Compras usa dadosfiscais.situacao = 'N' em filtros de documentos elegíveis; isso não documenta toda a taxonomia.

## Consultas reproduzíveis

As consultas assumem os nomes observados. Registrar o DDL real antes da execução e adaptar somente nomes comprovados. Executar em conexão read-only e guardar somente estatísticas agregadas.

### Cobertura temporal e volume

    select count(*) as registros, min(data) as primeira_data,
           max(data) as ultima_data,
           count(distinct produto) as produtos,
           count(distinct filial) as filiais
    from movimentos;

    select produto, filial, count(*) as registros,
           min(data) as primeira_data, max(data) as ultima_data
    from movimentos
    group by produto, filial
    order by registros asc;

### Nulos e duplicidades heurísticas

    select
      sum(case when produto is null then 1 else 0 end) as produto_nulo,
      sum(case when filial is null then 1 else 0 end) as filial_nula,
      sum(case when data is null then 1 else 0 end) as data_nula,
      sum(case when quantidade is null then 1 else 0 end) as quantidade_nula,
      sum(case when tipomovimento is null or btrim(tipomovimento) = '' then 1 else 0 end) as tipo_nulo,
      sum(case when operacao is null or btrim(operacao) = '' then 1 else 0 end) as operacao_nula
    from movimentos;

    select produto, filial, data, tipomovimento, quantidade,
           operacao, referencia, count(*) as ocorrencias
    from movimentos
    group by produto, filial, data, tipomovimento, quantidade,
             operacao, referencia
    having count(*) > 1
    order by ocorrencias desc;

Duplicidade verdadeira só pode ser concluída depois de identificar a chave oficial do movimento e a regra de estorno.

### Ausência de histórico e dias sem movimento

    select e.produto, e.filial
    from estoques e
    left join (select distinct produto, filial from movimentos) m
      on m.produto = e.produto and m.filial = e.filial
    where m.produto is null;

    with dias as (
      select generate_series(date '2025-01-01', date '2025-12-31',
                             interval '1 day')::date as dia
    ),
    pares as (
      select distinct produto, filial from movimentos
      where data between date '2025-01-01' and date '2025-12-31'
    )
    select p.produto, p.filial, count(*) as dias_sem_movimento
    from pares p cross join dias d
    left join movimentos m
      on m.produto = p.produto and m.filial = p.filial and m.data = d.dia
    where m.numero is null
    group by p.produto, p.filial
    order by dias_sem_movimento desc;

Dias sem movimento não são automaticamente demanda zero: cruzar com operação da filial, disponibilidade e situação do produto. Produtos inativol ficam fora de ambas as reposições; foralinhal continua válido para transferência, mas não para compra.

### Divergência entre snapshot e saldo atual

    with ultimo_movimento as (
      select distinct on (produto, filial)
             produto, filial, numero, data,
             emestoque, reservado, transito
      from movimentos
      order by produto, filial, data desc, numero desc
    )
    select u.produto, u.filial, u.data, u.numero,
           u.emestoque as snapshot_emestoque,
           e.emestoque as saldo_atual_emestoque,
           u.reservado as snapshot_reservado,
           e.reservado as saldo_atual_reservado,
           u.transito as snapshot_transito,
           e.transito as saldo_atual_transito
    from ultimo_movimento u
    join estoques e on e.produto = u.produto and e.filial = u.filial
    where abs(coalesce(u.emestoque, 0) - coalesce(e.emestoque, 0)) > 0.001
       or abs(coalesce(u.reservado, 0) - coalesce(e.reservado, 0)) > 0.001
       or abs(coalesce(u.transito, 0) - coalesce(e.transito, 0)) > 0.001;

Isso mede diferença de referência, não reconciliação contábil. A reconciliação exige a taxonomia dos sinais e confirmação de movimentos retroativos ou ajustes fora de movimentos.

### Taxonomia

    select tipomovimento, count(*) as quantidade,
           min(data) as primeira_data, max(data) as ultima_data
    from movimentos
    group by tipomovimento order by quantidade desc;

    select operacao, count(*) as quantidade,
           min(data) as primeira_data, max(data) as ultima_data
    from movimentos
    group by operacao order by quantidade desc;

    select situacao, count(*) as quantidade
    from dadosfiscais group by situacao order by quantidade desc;

Se a base possuir uma coluna explícita de estorno:

    select estorno, count(*) as quantidade
    from movimentos group by estorno order by quantidade desc;

A coluna estorno não foi confirmada no workspace. Não inferir estorno apenas pelo sinal da quantidade; localizar a relação oficial entre documento original, cancelamento e movimento reverso.

### Atraso de carga

Não foi localizado campo de ingestão confiável em movimentos. estoques.data_alteracao mede alteração do saldo, não necessariamente atraso de carga. Se houver data_carga ou watermark, medir:

    select
      percentile_cont(0.50) within group (order by (data_carga::date - data)) as p50_dias,
      percentile_cont(0.90) within group (order by (data_carga::date - data)) as p90_dias,
      max(data_carga::date - data) as max_dias
    from movimentos
    where data_carga is not null and data is not null;

Sem esse campo, o atraso é NÃO LOCALIZADO e deve ser tratado como risco de qualidade, não como zero.

## Medição por canal

- Transferência: medir pares origem/destino, pedidosfiliais, quantidade pedida/recebida, situação, tempo até recebimento e saldo residual da fonte.
- Compra: excluir foralinhal; cruzar necessidade residual com entradas de NF e documentos fiscais elegíveis. A Consulta de Compras usa produtosnotaspag, notaspag, dadosfiscais e movimentos em delphi/apps/estoque/dmconsultacompras.pas:1287-1369.
- Ambos: excluir inativol, ignorar vendas perdidas na primeira entrega e manter devoluções com a semântica atual da Consulta de Compras.

## Conclusão

Executar o roteiro em uma base representativa, com janela histórica, data de corte, DDL real, estatísticas por produto × filial e identificação dos códigos de venda, entrada, transferência, ajuste, cancelamento e estorno.

Até essa execução, usar apenas baselines e fallback ECC em modo exploratório; bloquear seleção definitiva de modelo por falta de evidência e não tratar ausência de movimento como venda zero.
