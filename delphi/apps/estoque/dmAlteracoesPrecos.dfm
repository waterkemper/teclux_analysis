inherited dtmAlteracoesPrecos: TdtmAlteracoesPrecos
  OldCreateOrder = False
  Left = 427
  Top = 264
  Height = 474
  Width = 730
  object dsrAlteracoesPrecos: TtecDataSource
    DataSet = qryAlteracoesPrecos
    Left = 72
    Top = 40
  end
  object qryAlteracoesPrecos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AutoCalcFields = False
    OnCalcFields = qryAlteracoesPrecosCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'ListadeItemProdutos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListadeProdutos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListadeGrupos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListadeClasses'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListadeMarcas'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';'
      
        'select pnp.produto, pnp.produtovisual, pnp.descricao_produto, pn' +
        'p.data, pnp.preco,'
      
        '       pnp.descricao_preco, pnp.valor, pnp.markup, pnp.trigger_u' +
        'ser, pnp.cargo,'
      
        '       sum(estoques_preco_(pnp.produto, pnp.valor, pnp.markup)) ' +
        'as valorprodutocargo'
      '       '
      'from'
      '('
      'select pnp.*,'
      
        '       coalesce((select markup from t_produtoscargos_log(pnp.pro' +
        'duto, ca.codigo, pnp.data)),0) as markup,'
      
        '       (select trigger_user from t_produtoscargos_log(pnp.produt' +
        'o, ca.codigo, pnp.data)) as trigger_user,       '
      
        '       cast(cast(ca.codigo as varchar(10))||'#39' - '#39'||cast(ca.descr' +
        'icao as varchar(50)) as varchar(65)) as cargo'
      '       '
      'from'
      '('
      ''
      ''
      '  select pnp.*,'
      '         (select pr.descricao '
      '          from precos pr '
      '          where pr.caracteristica = (select p.caracteristica'
      '                                     from produtos p'
      
        '                                     where p.codigo = pnp.produt' +
        'o)'
      '            and pr.codigo = pnp.preco) as descricao_preco,'
      '            '
      
        '         (select valor from t_colunasprecos_log(pnp.produto, pnp' +
        '.preco, pnp.data)) as valor'
      '  from'
      '  ('
      '      select distinct cp_log.*,'
      
        '             (select preco from t_produtos_log(cp_log.produto, c' +
        'p_log.data)) as preco'
      '      from'
      '      ('
      ''
      '      select distinct p.codigo as produto,'
      '             p.codigovisual as produtovisual,'
      '             p.descricao as descricao_produto,'
      '             cp_log.data'
      ''
      ''
      '      from'
      '      ('
      '        select distinct cp_log.caracteristica,'
      '             cast(cp_log.trigger_changed as date) as data'
      '         from colunasprecos_log cp_log'
      
        '         where cast(cp_log.trigger_changed as date) between :Dat' +
        'aInicial and :DataFinal'
      
        '       order by cp_log.caracteristica, cast(cp_log.trigger_chang' +
        'ed as date)'
      '       ) as cp_log'
      '          join ((((caracteristicas c'
      '                join produtos p'
      '                on p.caracteristica = c.codigo)'
      ''
      '                           join grupos g'
      '                           on c.grupo = g.codigo)'
      ''
      '                           join classes cl'
      '                           on c.classe = cl.codigo)'
      ''
      '                           join marcas m'
      '                           on c.marca = m.codigo)'
      ''
      ''
      '          on cp_log.caracteristica = c.codigo'
      ''
      '      where true'
      ''
      '      %ListadeItemProdutos'
      ''
      '      %ListadeProdutos'
      ''
      '      %ListadeGrupos'
      ''
      '      %ListadeClasses'
      ''
      '      %ListadeMarcas'
      ''
      '      ) as cp_log'
      
        '      order by produto, produtovisual, DATA, preco, descricao_pr' +
        'oduto'
      '  ) as pnp'
      '  '
      '  '
      '  '
      '  '
      '  '
      ') as pnp, cargos ca'
      ''
      ') as pnp'
      ''
      
        'group by pnp.produto, pnp.produtovisual, pnp.descricao_produto, ' +
        'pnp.data, pnp.preco, pnp.descricao_preco, pnp.valor, pnp.markup,' +
        ' pnp.trigger_user, pnp.cargo'
      'order by 1,2,3,4,5,6,7,8,9')
    RequestLive = False
    Left = 112
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'DataInicial'
        ParamType = ptUnknown
        Value = #39'2020-01-01'#39
      end
      item
        DataType = ftString
        Name = 'DataFinal'
        ParamType = ptUnknown
        Value = #39'2020-04-06'#39
      end>
    object qryAlteracoesPrecosproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryAlteracoesPrecosprodutovisual: TStringField
      FieldName = 'produtovisual'
      Size = 30
    end
    object qryAlteracoesPrecosdescricao_produto: TStringField
      FieldName = 'descricao_produto'
      Size = 100
    end
    object qryAlteracoesPrecosdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object qryAlteracoesPrecospreco: TIntegerField
      FieldName = 'preco'
    end
    object qryAlteracoesPrecosdescricao_preco: TStringField
      FieldName = 'descricao_preco'
      Size = 30
    end
    object qryAlteracoesPrecosvalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '0.00'
    end
    object qryAlteracoesPrecosmarkup: TFloatField
      FieldName = 'markup'
      DisplayFormat = '0.00'
    end
    object qryAlteracoesPrecostrigger_user: TStringField
      FieldName = 'trigger_user'
      Size = 32
    end
    object qryAlteracoesPrecoscargo: TStringField
      FieldName = 'cargo'
      Size = 65
    end
    object qryAlteracoesPrecosvalorprodutocargo: TFloatField
      FieldName = 'valorprodutocargo'
      DisplayFormat = '0.00'
    end
    object qryAlteracoesPrecosprodutovisualdescricao: TStringField
      FieldKind = fkCalculated
      FieldName = 'produtovisualdescricao'
      Size = 130
      Calculated = True
    end
  end
  object qryAlteracoesPrecosCargos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AutoCalcFields = False
    AfterOpen = qryAlteracoesPrecosCargosAfterOpen
    AfterScroll = qryAlteracoesPrecosCargosAfterScroll
    OnCalcFields = qryAlteracoesPrecosCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'rollback;'
      'begin;'
      ''
      'SELECT dynamic_pivot_('
      ''
      #39
      'select cast( cast(pnp.produto as varchar) ||'
      '            cast(pnp.data as varchar) ||'
      '            cast(coalesce(pnp.preco,0) as varchar) ||'
      '            cast(coalesce(pnp.valor,0) as varchar) ||'
      '            cast(coalesce(pnp.markup,0) as varchar) ||'
      
        '            cast(coalesce(pnp.trigger_user,'#39#39#39#39') as varchar) as ' +
        'varchar(200)) as identificador,'
      ''
      
        '       cast(cast(pnp.produtovisual as varchar)||'#39#39' '#39#39'||cast(pnp.' +
        'descricao_produto as varchar) as varchar(150)) as produtovisuald' +
        'escricao,'
      ''
      '       pnp.produto, pnp.produtovisual,'
      '       pnp.descricao_produto, pnp.data, pnp.preco,'
      
        '       pnp.descricao_preco, pnp.valor, pnp.markup, pnp.trigger_u' +
        'ser, pnp.cargo,'
      
        '       sum(estoques_preco_(pnp.produto, pnp.valor, pnp.markup)) ' +
        'as valorprodutocargo'
      ''
      'from'
      '('
      'select pnp.*,'
      
        '       coalesce((select markup from t_produtoscargos_log(pnp.pro' +
        'duto, ca.codigo, pnp.data)),0) as markup,'
      
        '       (select trigger_user from t_produtoscargos_log(pnp.produt' +
        'o, ca.codigo, pnp.data)) as trigger_user,       '
      
        '       cast(cast(ca.codigo as varchar(10))||'#39#39' - '#39#39'||cast(ca.des' +
        'cricao as varchar(50)) as varchar(65)) as cargo'
      '       '
      'from'
      '('
      ''
      ''
      '  select pnp.*,'
      '         (select pr.descricao '
      '          from precos pr '
      '          where pr.caracteristica = (select p.caracteristica'
      '                                     from produtos p'
      
        '                                     where p.codigo = pnp.produt' +
        'o)'
      '            and pr.codigo = pnp.preco) as descricao_preco,'
      '            '
      
        '         (select valor from t_colunasprecos_log(pnp.produto, pnp' +
        '.preco, pnp.data)) as valor'
      '  from'
      '  ('
      '      select distinct cp_log.*,'
      
        '             (select preco from t_produtos_log(cp_log.produto, c' +
        'p_log.data)) as preco'
      '      from'
      '      ('
      ''
      '      select distinct p.codigo as produto,'
      '             p.codigovisual as produtovisual,'
      '             p.descricao as descricao_produto,'
      '             cp_log.data'
      ''
      ''
      '      from'
      '      ('
      '        select distinct cp_log.caracteristica,'
      '             cast(cp_log.trigger_changed as date) as data'
      '         from colunasprecos_log cp_log'
      '         where cast(cp_log.trigger_changed as date) between'
      ''
      '         '#39#39'2010-04-01'#39#39
      ''
      '         and'
      ''
      '         '#39#39'2010-04-30'#39#39
      '         '
      
        '       order by cp_log.caracteristica, cast(cp_log.trigger_chang' +
        'ed as date)'
      '       ) as cp_log'
      '          join ((((caracteristicas c'
      '                join produtos p'
      '                on p.caracteristica = c.codigo)'
      ''
      '                           join grupos g'
      '                           on c.grupo = g.codigo)'
      ''
      '                           join classes cl'
      '                           on c.classe = cl.codigo)'
      ''
      '                           join marcas m'
      '                           on c.marca = m.codigo)'
      ''
      ''
      '          on cp_log.caracteristica = c.codigo'
      ''
      '      where true'
      ''
      ''
      ''
      '      ) as cp_log'
      
        '      order by produto, produtovisual, DATA, preco, descricao_pr' +
        'oduto'
      '  ) as pnp'
      ''
      ') as pnp, cargos ca'
      ''
      ') as pnp'
      ''
      
        'group by pnp.produto, pnp.produtovisual, pnp.descricao_produto, ' +
        'pnp.data, pnp.preco, pnp.descricao_preco, pnp.valor, pnp.markup,' +
        ' pnp.trigger_user, pnp.cargo'
      'order by 1,2,3,4,5,6,7,8,9, 10'#39','
      ''
      
        #39'select cast(cast(ca.codigo as varchar(10))||'#39#39' - '#39#39'||cast(ca.de' +
        'scricao as varchar(50)) as varchar(65)) as cargo'
      ' from cargos ca '
      ' order by 1'#39', '
      ' '
      ' '#39'identificador'#39','
      ' '
      
        ' '#39', produtovisualdescricao, produto, produtovisual, descricao_pr' +
        'oduto, data, preco, descricao_preco, valor, markup, trigger_user' +
        #39','
      ''
      '  '#39'cargo'#39', '#39'valorprodutocargo'#39', '#39'curs'#39' '
      ''
      ') as cur ;'
      ''
      'fetch ALL in curs;')
    RequestLive = False
    Left = 80
    Top = 200
  end
  object dsrAlteracoesPrecosCargos: TtecDataSource
    DataSet = qryAlteracoesPrecosCargos
    Left = 72
    Top = 152
  end
  object qryAlteracoesPrecosCargos_Auxiliar: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AutoCalcFields = False
    OnCalcFields = qryAlteracoesPrecosCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'rollback;'
      'begin;'
      ''
      'SELECT dynamic_pivot_('
      ''
      #39
      '  select cast( cast(produto as varchar) ||'
      '               cast(coalesce(preco,0) as varchar) ||'
      
        '               cast(coalesce(cargo,0) as varchar) as varchar(200' +
        ')) as identificador,'
      ''
      
        '         produto, produtovisual, caracteristica, precoproduto, d' +
        'escricao_produto, preco, descricao_preco, cargo, descricao_cargo' +
        ','
      
        '         (select max(e.datacompra) from estoques e where e.produ' +
        'to = selecao.produto and e.datacompra is not null limit 1) as da' +
        'tacompra,'
      
        '         valoranterior, valoratual, trigger_user_preco_atual, va' +
        'loratual - valoranterior as diferenca, margematual, VariacaoPrec' +
        'oAtualeAnterior,'
      ''
      '         to_char(data, '#39#39'DD-MM-YYYY'#39#39') as data, valor'
      'from'
      '('
      ''
      ' select selecao.*,'
      ' '
      
        '         (case when coalesce(valoratual,0)<>0 and coalesce(valor' +
        'anterior,0)<>0 then'
      
        '         cast((((valoratual * 100)/valoranterior)-100) as numeri' +
        'c(11,2)) else cast(null as numeric(11,2)) end) as  VariacaoPreco' +
        'AtualeAnterior'
      ' '
      ' from'
      ' '
      '('
      ' '
      '('
      ''
      
        '      select produto, produtovisual, caracteristica, precoprodut' +
        'o, '
      
        '             trim(descricao||'#39#39' '#39#39'||coalesce(valorgrade1,'#39#39#39#39')||' +
        #39#39' '#39#39'||coalesce(valorgrade2,'#39#39#39#39'))  as descricao_produto,'
      '             preco,'
      '             '
      '         (select pr.descricao'
      '          from precos pr'
      '          where pr.caracteristica = (select p.caracteristica'
      '                                     from produtos p'
      
        '                                     where p.codigo = pnp.produt' +
        'o)'
      '            and pr.codigo = pnp.preco) as descricao_preco,'
      '            '
      '                     cast(null as integer) as cargo,'
      ''
      '            cast(null as varchar(50)) as descricao_cargo,'
      ''
      '            '
      '            data,'
      ''
      
        '         (select valor from t_colunasprecos_log(pnp.produto, pnp' +
        '.preco, pnp.data)) as valor,'
      ''
      
        '         (select valor from t_colunasprecos_log(pnp.produto, pnp' +
        '.preco,'
      ''
      '         cast('
      ''
      '           :DataAnterior'
      '           '
      '           as date)'
      ''
      '         )) as valoranterior,'
      '         '
      '         pnp.valoratual,'
      '         pnp.trigger_user_preco_atual,'
      '         '
      '         case when pnp.valoratual = 0 then 0 else'
      
        '         round((1 - pnp.valorultimacompra / pnp.valoratual) * 10' +
        '0,0) end as margematual'
      '             '
      '       from'
      '      '
      '       ('
      '         '
      '         select pnp.*,'
      '         '
      '               case when pnp.composto then'
      ''
      '                    ('
      
        '                      select sum(e.valorultimacompra*e.quantidad' +
        'e) as valorultimacompra'
      '                      from'
      '                      ('
      
        '                      select e.produto, pc.quantidade, max(e.dat' +
        'acompra) as datacompra, max(e.valorultimacompra) as valorultimac' +
        'ompra'
      '                      from estoques e'
      '                           join produtoscompostos pc'
      '                           on e.produto = pc.componente'
      '                      where pc.composto =  pnp.produto'
      '                      and (e.produto,e.datacompra) in'
      '                      ('
      
        '                      select e.produto, max(e.datacompra) as dat' +
        'acompra'
      '                       from estoques e'
      
        '                       where e.produto in (select pc.componente ' +
        'from produtoscompostos pc where pc.composto = pnp.produto)'
      '                         and e.datacompra is not null'
      '                      group by e.produto'
      '                      )'
      '                      group by e.produto, pc.quantidade'
      ''
      '                      ) as e'
      '                    )'
      '               '
      '               else'
      '               '
      '                   (select e.valorultimacompra'
      '                    from estoques e'
      '                    where e.produto = pnp.produto'
      '                      and e.datacompra is not null'
      '                    order by e.datacompra desc limit 1)'
      '                    '
      '               end as valorultimacompra,'
      '                '
      
        '               (select valor from t_colunasprecos_log(pnp.produt' +
        'o, pnp.preco, current_date)) as valoratual,'
      
        '               (select trigger_user from t_colunasprecos_log(pnp' +
        '.produto, pnp.preco, current_date)) as trigger_user_preco_atual'
      ''
      '         from'
      '         ('
      ''
      '          select p.codigo as produto, '
      
        '                 p.codigovisual as produtovisual,               ' +
        '  '
      
        '                 p.caracteristica, coalesce(c.composto, false) a' +
        's composto,'
      '                 p.preco as precoproduto,'
      '                 p.descricao,'
      '                 p.valorgrade1,'
      '                 p.valorgrade2,'
      '                 cp_log.data, '
      '                 cp_log.preco'
      ''
      ''
      '          from'
      '          '
      '          ('
      ''
      ''
      '          ('
      ''
      '            SELECT p.codigo AS produto,'
      
        '                  date(cp_log.trigger_changed AT TIME ZONE '#39#39'UTC' +
        #39#39') AS DATA,'
      '                  cp_log.preco'
      ''
      '            FROM colunasprecos_log cp_log'
      '            join (produtos p'
      '                    join ((((((caracteristicas c'
      '                               join tributosicms ti'
      '                               on ti.codigo = c.incidencia)'
      ''
      '                               left join csosn'
      '                               on csosn.codigo = c.csosn)'
      ''
      '                               join (precos pr left'
      '                                     join promocoes pro'
      
        '                                     on pr.promocao = pro.codigo' +
        ')'
      '                               on pr.caracteristica = c.codigo)'
      ''
      '                               join grupos g'
      '                               on c.grupo = g.codigo)'
      ''
      '                               join classes cl'
      '                               on c.classe = cl.codigo)'
      ''
      '                               join marcas m'
      '                               on c.marca = m.codigo)'
      ''
      '               on p.caracteristica = c.codigo)'
      '            ON cp_log.caracteristica = p.caracteristica'
      ''
      ''
      
        '            WHERE (((date(cp_log.trigger_changed AT TIME ZONE '#39#39 +
        'UTC'#39#39')) >='
      ''
      '            :DataInicial'
      '            ::date)'
      ''
      
        '               AND ((date(cp_log.trigger_changed AT TIME ZONE '#39#39 +
        'UTC'#39#39')) <='
      ''
      '               :Datafinal'
      '               ::date))'
      ''
      
        '               and case when p.preco = cp_log.preco then true EL' +
        'SE'
      
        '                    (select preco FROM t_produtos_log(p.codigo, ' +
        ' date(cp_log.trigger_changed AT TIME ZONE '#39#39'UTC'#39#39'))) = cp_log.pr' +
        'eco'
      '                   end'
      ''
      '            %CondicoesProdutos'
      ''
      '            %SomenteComEstoque'
      ''
      '            %Compostos'
      ''
      '            %ListadeItemProdutos'
      ''
      '            %ListadeProdutos'
      ''
      '            %ListadeGrupos'
      ''
      '            %ListadeClasses'
      ''
      '            %ListadeMarcas'
      ''
      '            %ListaCodigosPromocao'
      ''
      '            %ListaCST'
      ''
      '            %ListaCSOSN'
      ''
      '            %ParametroListasPadrao'
      ''
      '            %ListadeFornecedores'
      ''
      '            %ListaCondicionalNotasEntrada'
      ''
      '            %Movimentacao'
      ''
      ''
      
        '            GROUP BY p.codigo, date(cp_log.trigger_changed AT TI' +
        'ME ZONE '#39#39'UTC'#39#39'), cp_log.preco'
      ''
      '          )'
      ''
      '          union'
      ''
      '          ('
      ''
      
        '            select p_log.codigo as produto, p_log.trigger_date a' +
        's data, p_log.preco'
      '            from produtos_log p_log'
      ''
      '                 join (produtos p'
      '                    join ((((((caracteristicas c'
      '                               join tributosicms ti'
      '                               on ti.codigo = c.incidencia)'
      ''
      '                               left join csosn'
      '                               on csosn.codigo = c.csosn)'
      ''
      '                               join (precos pr left'
      '                                     join promocoes pro'
      
        '                                     on pr.promocao = pro.codigo' +
        ')'
      '                               on pr.caracteristica = c.codigo)'
      ''
      '                               join grupos g'
      '                               on c.grupo = g.codigo)'
      ''
      '                               join classes cl'
      '                               on c.classe = cl.codigo)'
      ''
      '                               join marcas m'
      '                               on c.marca = m.codigo)'
      ''
      '               on p.caracteristica = c.codigo)'
      ''
      '              on p_log.codigo = p.codigo'
      ''
      '            where  ((p_log.trigger_date >='
      '                      :DataInicial'
      '                      ::date) AND (p_log.trigger_date <='
      '                      :DataFinal'
      '                      ::date))'
      ''
      '            and exists (select p_log2.codigo'
      '                        from produtos_log p_log2'
      '                        where p_log2.codigo = p_log.codigo'
      
        '                          and p_log2.trigger_date = p_log.trigge' +
        'r_date'
      
        '                          and p_log2.trigger_user = p_log.trigge' +
        'r_user'
      '                          and p_log2.preco <> p_log.preco'
      '                          limit 1)'
      ''
      '            %CondicoesProdutos'
      ''
      '            %SomenteComEstoque'
      ''
      '            %Compostos'
      ''
      '            %ListadeItemProdutos'
      ''
      '            %ListadeProdutos'
      ''
      '            %ListadeGrupos'
      ''
      '            %ListadeClasses'
      ''
      '            %ListadeMarcas'
      ''
      '            %ListaCodigosPromocao'
      ''
      '            %ListaCST'
      ''
      '            %ListaCSOSN'
      ''
      '            %ParametroListasPadrao'
      ''
      '            %ListadeFornecedores'
      ''
      '            %ListaCondicionalNotasEntrada'
      ''
      '            %Movimentacao'
      ''
      
        '            group by p_log.codigo, p_log.trigger_date, p_log.pre' +
        'co'
      ''
      ''
      '          )'
      ''
      ''
      '      ) as cp_log'
      ''
      '                    join (produtos p'
      '                    join ((((((caracteristicas c'
      '                               join tributosicms ti'
      '                               on ti.codigo = c.incidencia)'
      ''
      '                               left join csosn'
      '                               on csosn.codigo = c.csosn)'
      ''
      '                               join (precos pr left'
      '                                     join promocoes pro'
      
        '                                     on pr.promocao = pro.codigo' +
        ')'
      '                               on pr.caracteristica = c.codigo)'
      ''
      '                               join grupos g'
      '                               on c.grupo = g.codigo)'
      ''
      '                               join classes cl'
      '                               on c.classe = cl.codigo)'
      ''
      '                               join marcas m'
      '                               on c.marca = m.codigo)'
      ''
      '               on p.caracteristica = c.codigo)'
      ''
      '              on cp_log.produto = p.codigo'
      ''
      'group by'
      ''
      ''
      '           p.codigo,'
      '                 p.codigovisual,'
      '                 p.caracteristica, c.composto,'
      '                 p.preco,'
      '                 p.descricao,'
      '                 p.valorgrade1,'
      '                 p.valorgrade2,'
      '                 cp_log.data, cp_log.preco'
      ''
      '     ) as pnp'
      '    ) as pnp'
      ''
      ''
      ')'
      ''
      ''
      'union all'
      ''
      ''
      '('
      ''
      
        'select pnp.produto, pnp.produtovisual, pnp.caracteristica, pnp.p' +
        'recoproduto, '
      '       pnp.descricao_produto, pnp.preco, descricao_preco,'
      '       pnp.cargo, pnp.descricao_cargo, pnp.data,'
      
        '       estoques_preco_(pnp.produto, pnp.valor, pnp.markup) as va' +
        'lor,'
      
        '       estoques_preco_(pnp.produto, pnp.valoranterior, pnp.marku' +
        'panterior) as valoranterior,'
      '       pnp.valoratual,'
      '       pnp.trigger_user_preco_atual,'
      '       case when pnp.valoratual = 0 then 0 else'
      
        '         round((1 - pnp.valorultimacompra / pnp.valoratual) * 10' +
        '0,0) end as margematual'
      '       '
      ''
      'from'
      '('
      
        '  select pnp.produto, pnp.produtovisual, pnp.caracteristica, pnp' +
        '.precoproduto, '
      '         pnp.descricao_produto, pnp.preco, descricao_preco,'
      
        '         pnp.cargo, pnp.descricao_cargo, pnp.data,  pnp.valor, p' +
        'np.markup,'
      
        '         pnp.valoranterior, pnp.markupanterior, pnp.valorultimac' +
        'ompra,'
      
        '         estoques_preco_(pnp.produto, pnp.valoratual, pnp.markup' +
        'atual) as valoratual,'
      '         pnp.trigger_user_preco_atual'
      ''
      '  from'
      '  '
      '  ('
      ''
      ''
      ''
      '      select cp_log.*,'
      
        '           coalesce((select markup from t_produtoscargos_log(cp_' +
        'log.produto, ca.codigo, cp_log.data)),0) as markup,'
      
        '           coalesce((select markup from t_produtoscargos_log(cp_' +
        'log.produto, ca.codigo,'
      ''
      '           :DataAnterior'
      ''
      '           )),0) as markupanterior,'
      '           '
      
        '           coalesce((select markup from produtoscargos pc where ' +
        'pc.produto = cp_log.produto and pc.cargo = ca.codigo),0) as mark' +
        'upatual,'
      '      '
      '           ca.codigo as cargo,'
      '           ca.descricao as descricao_cargo '
      '                   '
      ''
      '      from'
      '      '
      '      ('
      '      '
      
        '      select produto, produtovisual, caracteristica, precoprodut' +
        'o, '
      
        '             trim(descricao||'#39#39' '#39#39'||coalesce(valorgrade1,'#39#39#39#39')||' +
        #39#39' '#39#39'||coalesce(valorgrade2,'#39#39#39#39'))  as descricao_produto,'
      '             data, preco,'
      '             '
      '         (select pr.descricao'
      '          from precos pr'
      '          where pr.caracteristica = (select p.caracteristica'
      '                                     from produtos p'
      
        '                                     where p.codigo = pnp.produt' +
        'o)'
      '            and pr.codigo = pnp.preco) as descricao_preco,'
      ''
      
        '         (select valor from t_colunasprecos_log(pnp.produto, pnp' +
        '.preco, pnp.data)) as valor,'
      ''
      
        '         (select valor from t_colunasprecos_log(pnp.produto, pnp' +
        '.preco,'
      ''
      '         cast('
      ''
      '         :DataAnterior'
      ''
      '         as date)'
      ''
      '         )) as valoranterior,'
      ''
      
        '         (select valor from t_colunasprecos_log(pnp.produto, pnp' +
        '.preco, current_date)) as valoratual,'
      
        '         (select trigger_user from t_colunasprecos_log(pnp.produ' +
        'to, pnp.preco, current_date)) as trigger_user_preco_atual,'
      ''
      '                  '
      '          '
      '               case when pnp.composto then'
      ''
      '                    ('
      
        '                      select sum(e.valorultimacompra*e.quantidad' +
        'e) as valorultimacompra'
      '                      from'
      '                      ('
      
        '                      select e.produto, pc.quantidade, max(e.dat' +
        'acompra) as datacompra, max(e.valorultimacompra) as valorultimac' +
        'ompra'
      '                      from estoques e'
      '                           join produtoscompostos pc'
      '                           on e.produto = pc.componente'
      '                      where pc.composto =  pnp.produto'
      '                      and (e.produto,e.datacompra) in'
      '                      ('
      
        '                      select e.produto, max(e.datacompra) as dat' +
        'acompra'
      '                       from estoques e'
      
        '                       where e.produto in (select pc.componente ' +
        'from produtoscompostos pc where pc.composto = pnp.produto)'
      '                         and e.datacompra is not null'
      '                      group by e.produto'
      '                      )'
      '                      group by e.produto, pc.quantidade'
      ''
      '                      ) as e'
      '                    '
      '                    )'
      '               '
      '               else'
      '               '
      '                   (select e.valorultimacompra'
      '                    from estoques e'
      '                    where e.produto = pnp.produto'
      '                      and e.datacompra is not null'
      '                    order by e.datacompra desc limit 1)'
      '                    '
      '               end as valorultimacompra'
      '          '
      '             '
      '       from'
      '      '
      '       ('
      '       '
      ''
      '          select p.codigo as produto,'
      '                 p.codigovisual as produtovisual,'
      
        '                 p.caracteristica, coalesce(c.composto,false) as' +
        ' composto,'
      '                 p.preco as precoproduto,'
      '                 p.descricao,'
      '                 p.valorgrade1,'
      '                 p.valorgrade2,'
      '                 cp_log.data, '
      '                 cp_log.preco'
      ''
      ''
      '          from'
      '          '
      '          ('
      '          '
      '          '
      '          ('
      '            select p.codigo as produto,'
      
        '                   date(cp_log.trigger_changed at TIME ZONE '#39#39'UT' +
        'C'#39#39') as data,'
      '                 cp_log.preco'
      ''
      '            from colunasprecos_log cp_log'
      ''
      '                  join (produtos p'
      '                    join ((((((caracteristicas c'
      '                               join tributosicms ti'
      '                               on ti.codigo = c.incidencia)'
      ''
      '                               left join csosn'
      '                               on csosn.codigo = c.csosn)'
      ''
      '                               join (precos pr left'
      '                                     join promocoes pro'
      
        '                                     on pr.promocao = pro.codigo' +
        ')'
      '                               on pr.caracteristica = c.codigo)'
      ''
      '                               join grupos g'
      '                               on c.grupo = g.codigo)'
      ''
      '                               join classes cl'
      '                               on c.classe = cl.codigo)'
      ''
      '                               join marcas m'
      '                               on c.marca = m.codigo)'
      ''
      '                     on p.caracteristica = c.codigo)'
      ''
      '                 on cp_log.caracteristica = p.caracteristica'
      ''
      
        '            where  (((date(cp_log.trigger_changed at TIME ZONE '#39 +
        #39'UTC'#39#39')) >='
      ''
      '            :DataInicial'
      '            ::date)'
      ''
      
        '             and ((date(cp_log.trigger_changed at TIME ZONE '#39#39'UT' +
        'C'#39#39')) <='
      ''
      '            :Datafinal'
      '            ::date))'
      ''
      
        '               and case when p.preco = cp_log.preco then true EL' +
        'SE'
      
        '                    (select preco FROM t_produtos_log(p.codigo, ' +
        ' date(cp_log.trigger_changed AT TIME ZONE '#39#39'UTC'#39#39'))) = cp_log.pr' +
        'eco'
      '                   end'
      ''
      ''
      '            %CondicoesProdutos'
      ''
      '            %SomenteComEstoque'
      ''
      '            %Compostos                   '
      ''
      '            %ListadeItemProdutos'
      ''
      '            %ListadeProdutos'
      ''
      '            %ListadeGrupos'
      ''
      '            %ListadeClasses'
      ''
      '            %ListadeMarcas'
      ''
      '            %ListaCodigosPromocao'
      ''
      '            %ListaCST'
      ''
      '            %ListaCSOSN'
      ''
      '            %ParametroListasPadrao'
      ''
      '            %ListadeFornecedores'
      ''
      '            %ListaCondicionalNotasEntrada'
      ''
      '            %Movimentacao'
      #9#9#9
      '            %SomentePrecoNormal'
      ''
      ''
      
        '             group by p.codigo, date(cp_log.trigger_changed at T' +
        'IME ZONE '#39#39'UTC'#39#39'), cp_log.preco'
      ''
      ''
      '          )'
      ''
      '          union'
      ''
      '          ('
      ''
      
        '            select p_log.codigo as produto, p_log.trigger_date a' +
        's data, p_log.preco'
      '            from produtos_log p_log'
      ''
      '                 join (produtos p'
      '                    join ((((((caracteristicas c'
      '                               join tributosicms ti'
      '                               on ti.codigo = c.incidencia)'
      ''
      '                               left join csosn'
      '                               on csosn.codigo = c.csosn)'
      ''
      '                               join (precos pr left'
      '                                     join promocoes pro'
      
        '                                     on pr.promocao = pro.codigo' +
        ')'
      '                               on pr.caracteristica = c.codigo)'
      ''
      '                               join grupos g'
      '                               on c.grupo = g.codigo)'
      ''
      '                               join classes cl'
      '                               on c.classe = cl.codigo)'
      ''
      '                               join marcas m'
      '                               on c.marca = m.codigo)'
      ''
      '                   on p.caracteristica = c.codigo)'
      '                 on p_log.codigo = p.codigo'
      ''
      ''
      '            where  ((p_log.trigger_date >='
      '                      :DataInicial'
      '                      ::date) AND (p_log.trigger_date <='
      '                      :DataFinal'
      '                      ::date))'
      ''
      '            and exists (select p_log2.codigo'
      '                        from produtos_log p_log2'
      '                        where p_log2.codigo = p_log.codigo'
      
        '                          and p_log2.trigger_date = p_log.trigge' +
        'r_date'
      
        '                          and p_log2.trigger_user = p_log.trigge' +
        'r_user'
      '                          and p_log2.preco <> p_log.preco'
      '                          limit 1)'
      ''
      '            %CondicoesProdutos'
      ''
      '            %SomenteComEstoque'
      ''
      '            %Compostos'
      ''
      '            %ListadeItemProdutos'
      ''
      '            %ListadeProdutos'
      ''
      '            %ListadeGrupos'
      ''
      '            %ListadeClasses'
      ''
      '            %ListadeMarcas'
      ''
      '            %ListaCodigosPromocao'
      ''
      '            %ListaCST'
      ''
      '            %ListaCSOSN'
      ''
      '            %ParametroListasPadrao'
      ''
      '            %ListadeFornecedores'
      ''
      '            %ListaCondicionalNotasEntrada'
      ''
      '            %Movimentacao'
      #9#9#9
      #9'    %SomentePrecoNormal'
      ''
      
        '            group by p_log.codigo, p_log.trigger_date, p_log.pre' +
        'co'
      ''
      '          )'
      ''
      '          union'
      ''
      '         ('
      ''
      '            select pc_log.*,'
      '/*                cast(null as integer) as preco*/'
      
        '                (select preco from t_produtos_log(pc_log.produto' +
        ', pc_log.data)) as preco'
      '         from'
      ''
      ''
      '          ('
      ''
      '            select pc_log.produto,'
      
        '                   date(pc_log.trigger_changed at TIME ZONE '#39#39'UT' +
        'C'#39#39') as data'
      ''
      '            from produtoscargos_log pc_log'
      ''
      '                 join (produtos p'
      '                    join ((((((caracteristicas c'
      '                               join tributosicms ti'
      '                               on ti.codigo = c.incidencia)'
      ''
      '                               left join csosn'
      '                               on csosn.codigo = c.csosn)'
      ''
      '                               join (precos pr left'
      '                                     join promocoes pro'
      
        '                                     on pr.promocao = pro.codigo' +
        ')'
      '                               on pr.caracteristica = c.codigo)'
      ''
      '                               join grupos g'
      '                               on c.grupo = g.codigo)'
      ''
      '                               join classes cl'
      '                               on c.classe = cl.codigo)'
      ''
      '                               join marcas m'
      '                               on c.marca = m.codigo)'
      ''
      '                   on p.caracteristica = c.codigo)'
      '                 on pc_log.produto = p.codigo'
      ''
      
        '            where  (((date(pc_log.trigger_changed at TIME ZONE '#39 +
        #39'UTC'#39#39')) >='
      ''
      '            :DataInicial'
      '            ::date)'
      ''
      
        '             and ((date(pc_log.trigger_changed at TIME ZONE '#39#39'UT' +
        'C'#39#39')) <='
      ''
      '            :DataFinal'
      '            ::date))'
      ''
      ''
      '            %CondicoesProdutos'
      ''
      '            %SomenteComEstoque'
      ''
      '            %Compostos'
      '                        '
      '            %ListadeItemProdutos'
      ''
      '            %ListadeProdutos'
      ''
      '            %ListadeGrupos'
      ''
      '            %ListadeClasses'
      ''
      '            %ListadeMarcas'
      ''
      '            %ListaCodigosPromocao'
      ''
      '            %ListaCST'
      ''
      '            %ListaCSOSN'
      ''
      '            %ParametroListasPadrao'
      ''
      '            %ListadeFornecedores'
      ''
      '            %ListaCondicionalNotasEntrada'
      ''
      '            %Movimentacao'
      #9#9#9
      '  '#9'    %SomentePrecoNormal'
      ''
      '            group by'
      ''
      '             pc_log.produto,'
      '             date(pc_log.trigger_changed at TIME ZONE '#39#39'UTC'#39#39')'
      ''
      ''
      '          ) as pc_log'
      ''
      '         )'
      ''
      '      ) as cp_log'
      '      '
      '                    join (produtos p'
      '                    join ((((((caracteristicas c'
      '                               join tributosicms ti'
      '                               on ti.codigo = c.incidencia)'
      ''
      '                               left join csosn'
      '                               on csosn.codigo = c.csosn)'
      ''
      '                               join (precos pr left'
      '                                     join promocoes pro'
      
        '                                     on pr.promocao = pro.codigo' +
        ')'
      '                               on pr.caracteristica = c.codigo)'
      ''
      '                               join grupos g'
      '                               on c.grupo = g.codigo)'
      ''
      '                               join classes cl'
      '                               on c.classe = cl.codigo)'
      ''
      '                               join marcas m'
      '                               on c.marca = m.codigo)'
      ''
      '               on p.caracteristica = c.codigo)                '
      ''
      ''
      '              on cp_log.produto = p.codigo   '
      ''
      ''
      'group by'
      ''
      ''
      '           p.codigo,'
      '                 p.codigovisual,'
      '                 p.caracteristica, c.composto,'
      '                 p.preco,'
      '                 p.descricao,'
      '                 p.valorgrade1,'
      '                 p.valorgrade2,'
      '                 cp_log.data, cp_log.preco'
      '                 '
      '     ) as pnp    '
      '     '
      '   ) as cp_log, cargos ca'
      '   '
      ' ) as pnp'
      ') as pnp'
      ''
      'order by 1,2,3,4,5,6,7,8,9'
      ''
      ')'
      ''
      ') as selecao'
      ''
      ') as selecao'
      ''
      'where'
      ''
      ' case when ('
      ''
      ' :MargemAtual_1'
      ''
      ' = '#39#39#39#39') then true else COALESCE(margematual,0) <='
      ''
      ' :MargemAtual_2'
      ''
      ' end'
      ''
      ' and'
      ''
      ' case when ('
      ''
      ' :VariacaoPrecoAtualeAnterior_1'
      ''
      ' = '#39#39#39#39') then true else COALESCE(VariacaoPrecoAtualeAnterior,0)'
      ''
      ' :ComparisonOperator'
      ''
      ' :VariacaoPrecoAtualeAnterior_2'
      ''
      ' end'
      ''
      ''
      ' %ordenacao'
      ''
      ' '#39','
      ''
      ''
      '      '#39
      '      select to_char(cp_log.data, '#39#39'DD-MM-YYYY'#39#39') as data'
      ''
      '      from'
      '      ('
      ''
      ''
      '          ('
      '            select p.codigo as produto,'
      
        '                   date(cp_log.trigger_changed at TIME ZONE '#39#39'UT' +
        'C'#39#39') as data'
      ''
      '            from colunasprecos_log cp_log'
      ''
      '            join (produtos p'
      '                    join ((((((caracteristicas c'
      '                               join tributosicms ti'
      '                               on ti.codigo = c.incidencia)'
      ''
      '                               left join csosn'
      '                               on csosn.codigo = c.csosn)'
      ''
      '                               join (precos pr left'
      '                                     join promocoes pro'
      
        '                                     on pr.promocao = pro.codigo' +
        ')'
      '                               on pr.caracteristica = c.codigo)'
      ''
      '                               join grupos g'
      '                               on c.grupo = g.codigo)'
      ''
      '                               join classes cl'
      '                               on c.classe = cl.codigo)'
      ''
      '                               join marcas m'
      '                               on c.marca = m.codigo)'
      '                   on p.caracteristica = c.codigo)'
      ''
      '            on cp_log.caracteristica = p.caracteristica'
      ''
      
        '            where  (((date(cp_log.trigger_changed at TIME ZONE '#39 +
        #39'UTC'#39#39')) >='
      ''
      '            :DataInicial'
      '            ::date)'
      ''
      
        '             and ((date(cp_log.trigger_changed at TIME ZONE '#39#39'UT' +
        'C'#39#39')) <='
      ''
      '            :Datafinal'
      '            ::date))'
      ''
      
        '            and (select preco FROM t_produtos_log(p.codigo,  dat' +
        'e(cp_log.trigger_changed AT TIME ZONE '#39#39'UTC'#39#39'))) = cp_log.preco'
      ''
      '            %CondicoesProdutos'
      ''
      '            %SomenteComEstoque'
      ''
      '            %Compostos'
      ''
      '            %ListadeItemProdutos'
      ''
      '            %ListadeProdutos'
      ''
      '            %ListadeGrupos'
      ''
      '            %ListadeClasses'
      ''
      '            %ListadeMarcas'
      ''
      '            %ListaCodigosPromocao'
      ''
      '            %ListaCST'
      ''
      '            %ListaCSOSN'
      ''
      '            %ParametroListasPadrao'
      ''
      '            %ListadeFornecedores'
      ''
      '            %ListaCondicionalNotasEntrada'
      ''
      '            %Movimentacao'
      ''
      ''
      
        '             group by p.codigo, date(cp_log.trigger_changed at T' +
        'IME ZONE '#39#39'UTC'#39#39')'
      ''
      ''
      '          )'
      ''
      '          union'
      ''
      '          ('
      ''
      
        '            select p_log.codigo as produto, p_log.trigger_date a' +
        's data'
      '            from produtos_log p_log'
      ''
      '                 join (produtos p'
      '                    join ((((((caracteristicas c'
      '                               join tributosicms ti'
      '                               on ti.codigo = c.incidencia)'
      ''
      '                               left join csosn'
      '                               on csosn.codigo = c.csosn)'
      ''
      '                               join (precos pr left'
      '                                     join promocoes pro'
      
        '                                     on pr.promocao = pro.codigo' +
        ')'
      '                               on pr.caracteristica = c.codigo)'
      ''
      '                               join grupos g'
      '                               on c.grupo = g.codigo)'
      ''
      '                               join classes cl'
      '                               on c.classe = cl.codigo)'
      ''
      '                               join marcas m'
      '                               on c.marca = m.codigo)'
      '                   on p.caracteristica = c.codigo)'
      '                 on p_log.codigo = p.codigo'
      ''
      ''
      '            where  ((p_log.trigger_date >='
      '                      :DataInicial'
      '                      ::date) AND (p_log.trigger_date <='
      '                      :DataFinal'
      '                      ::date))'
      ''
      '            and exists (select p_log2.codigo'
      '                        from produtos_log p_log2'
      '                        where p_log2.codigo = p_log.codigo'
      
        '                          and p_log2.trigger_date = p_log.trigge' +
        'r_date'
      
        '                          and p_log2.trigger_user = p_log.trigge' +
        'r_user'
      '                          and p_log2.preco <> p_log.preco'
      '                          limit 1)'
      ''
      '            %CondicoesProdutos'
      ''
      '            %SomenteComEstoque'
      ''
      '            %Compostos'
      ''
      '            %ListadeItemProdutos'
      ''
      '            %ListadeProdutos'
      ''
      '            %ListadeGrupos'
      ''
      '            %ListadeClasses'
      ''
      '            %ListadeMarcas'
      ''
      '            %ListaCodigosPromocao'
      ''
      '            %ListaCST'
      ''
      '            %ListaCSOSN'
      ''
      '            %ParametroListasPadrao'
      ''
      '            %ListadeFornecedores'
      ''
      '            %ListaCondicionalNotasEntrada'
      ''
      '            %Movimentacao'
      ''
      '            group by p_log.codigo, p_log.trigger_date'
      ''
      '          )'
      ''
      '          union'
      ''
      '         ('
      ''
      '            select pc_log.produto,'
      
        '                   date(pc_log.trigger_changed at TIME ZONE '#39#39'UT' +
        'C'#39#39') as data'
      ''
      '            from produtoscargos_log pc_log'
      ''
      '                 join (produtos p'
      '                    join ((((((caracteristicas c'
      '                               join tributosicms ti'
      '                               on ti.codigo = c.incidencia)'
      ''
      '                               left join csosn'
      '                               on csosn.codigo = c.csosn)'
      ''
      '                               join (precos pr left'
      '                                     join promocoes pro'
      
        '                                     on pr.promocao = pro.codigo' +
        ')'
      '                               on pr.caracteristica = c.codigo)'
      ''
      '                               join grupos g'
      '                               on c.grupo = g.codigo)'
      ''
      '                               join classes cl'
      '                               on c.classe = cl.codigo)'
      ''
      '                               join marcas m'
      '                               on c.marca = m.codigo)'
      ''
      '                   on p.caracteristica = c.codigo)'
      ''
      '                 on pc_log.produto = p.codigo'
      ''
      
        '            where  (((date(pc_log.trigger_changed at TIME ZONE '#39 +
        #39'UTC'#39#39')) >='
      ''
      '            :DataInicial'
      '            ::date)'
      ''
      
        '             and ((date(pc_log.trigger_changed at TIME ZONE '#39#39'UT' +
        'C'#39#39')) <='
      ''
      '            :DataFinal'
      '            ::date))'
      ''
      '            %CondicoesProdutos'
      ''
      '            %SomenteComEstoque'
      ''
      '            %Compostos'
      ''
      '            %ListadeItemProdutos'
      ''
      '            %ListadeProdutos'
      ''
      '            %ListadeGrupos'
      ''
      '            %ListadeClasses'
      ''
      '            %ListadeMarcas'
      ''
      '            %ListaCodigosPromocao'
      ''
      '            %ListaCST'
      ''
      '            %ListaCSOSN'
      ''
      '            %ParametroListasPadrao'
      ''
      '            %ListadeFornecedores'
      ''
      '            %ListaCondicionalNotasEntrada'
      ''
      '            %Movimentacao'
      ''
      '     '#9'    %SomentePrecoNormal'
      ''
      '            group by'
      ''
      '             pc_log.produto,'
      '             date(pc_log.trigger_changed at TIME ZONE '#39#39'UTC'#39#39')'
      ''
      ''
      ''
      '         )'
      ''
      '      ) as cp_log'
      ''
      '                    join (produtos p'
      '                    join ((((((caracteristicas c'
      '                               join tributosicms ti'
      '                               on ti.codigo = c.incidencia)'
      ''
      '                               left join csosn'
      '                               on csosn.codigo = c.csosn)'
      ''
      '                               join (precos pr left'
      '                                     join promocoes pro'
      
        '                                     on pr.promocao = pro.codigo' +
        ')'
      '                               on pr.caracteristica = c.codigo)'
      ''
      '                               join grupos g'
      '                               on c.grupo = g.codigo)'
      ''
      '                               join classes cl'
      '                               on c.classe = cl.codigo)'
      ''
      '                               join marcas m'
      '                               on c.marca = m.codigo)'
      ''
      '               on p.caracteristica = c.codigo)'
      ''
      ''
      '              on cp_log.produto = p.codigo'
      ''
      ''
      '       group by cp_log.data'
      '       order by cp_log.data'#39','
      ''
      ''
      ' '#39'identificador'#39','
      ''
      
        ' '#39', produto, produtovisual, caracteristica, precoproduto, descri' +
        'cao_produto, preco, descricao_preco, cargo, descricao_cargo, dat' +
        'acompra, valoranterior, valoratual, trigger_user_preco_atual, di' +
        'ferenca, margematual, VariacaoPrecoAtualeAnterior'#39','
      ''
      '  '#39'data'#39', '#39'valor'#39', '#39'curs'#39
      ''
      ') as cur;'
      ''
      'fetch ALL in curs;')
    RequestLive = False
    Left = 320
    Top = 240
  end
  object qryAlteracoesPrecosCargos_Auxiliar_por_Cargo: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AutoCalcFields = False
    OnCalcFields = qryAlteracoesPrecosCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'rollback;'
      'begin;'
      ''
      'SELECT dynamic_pivot_('
      ''
      #39
      'select cast( cast(pnp.produto as varchar) ||'
      '            cast(pnp.data as varchar) ||'
      '            cast(coalesce(pnp.preco,0) as varchar) ||'
      '            cast(coalesce(pnp.valor,0) as varchar) ||'
      '            cast(coalesce(pnp.markup,0) as varchar) ||'
      
        '            cast(coalesce(pnp.trigger_user,'#39#39#39#39') as varchar) as ' +
        'varchar(200)) as identificador,'
      ''
      
        '       cast(cast(pnp.produtovisual as varchar)||'#39#39' - '#39#39'||cast(pn' +
        'p.descricao_produto as varchar) as varchar(150)) as produtovisua' +
        'ldescricao,'
      ''
      '       pnp.produto, pnp.produtovisual,'
      '       pnp.descricao_produto, pnp.data, pnp.preco,'
      
        '       pnp.descricao_preco, pnp.valor, pnp.markup, pnp.trigger_u' +
        'ser, pnp.cargo,'
      
        '       sum(estoques_preco_(pnp.produto, pnp.valor, pnp.markup)) ' +
        'as valorprodutocargo'
      ''
      'from'
      '('
      'select pnp.*,'
      
        '       coalesce((select markup from t_produtoscargos_log(pnp.pro' +
        'duto, ca.codigo, pnp.data)),0) as markup,'
      
        '       (select trigger_user from t_produtoscargos_log(pnp.produt' +
        'o, ca.codigo, pnp.data)) as trigger_user,       '
      
        '       cast(cast(ca.codigo as varchar(10))||'#39#39' - '#39#39'||cast(ca.des' +
        'cricao as varchar(50)) as varchar(65)) as cargo'
      '       '
      'from'
      '('
      ''
      ''
      '  select pnp.*,'
      '         (select pr.descricao '
      '          from precos pr '
      '          where pr.caracteristica = (select p.caracteristica'
      '                                     from produtos p'
      
        '                                     where p.codigo = pnp.produt' +
        'o)'
      '            and pr.codigo = pnp.preco) as descricao_preco,'
      '            '
      
        '         (select valor from t_colunasprecos_log(pnp.produto, pnp' +
        '.preco, pnp.data)) as valor'
      '  from'
      '  ('
      '      select distinct cp_log.*,'
      
        '             (select preco from t_produtos_log(cp_log.produto, c' +
        'p_log.data)) as preco'
      '      from'
      '      ('
      ''
      '      select distinct p.codigo as produto,'
      '             p.codigovisual as produtovisual,'
      '             p.descricao as descricao_produto,'
      '             cp_log.data'
      ''
      ''
      '      from'
      '      ('
      '        select distinct cp_log.caracteristica,'
      '             cast(cp_log.trigger_changed as date) as data'
      '         from colunasprecos_log cp_log'
      '         where cast(cp_log.trigger_changed as date) between'
      ''
      '         :DataInicial'
      ''
      '         and'
      ''
      '         :DataFinal'
      '         '
      
        '       order by cp_log.caracteristica, cast(cp_log.trigger_chang' +
        'ed as date)'
      '       ) as cp_log'
      '          join ((((caracteristicas c'
      '                join produtos p'
      '                on p.caracteristica = c.codigo)'
      ''
      '                           join grupos g'
      '                           on c.grupo = g.codigo)'
      ''
      '                           join classes cl'
      '                           on c.classe = cl.codigo)'
      ''
      '                           join marcas m'
      '                           on c.marca = m.codigo)'
      ''
      ''
      '          on cp_log.caracteristica = c.codigo'
      ''
      '      where true'
      ''
      '      %ListadeItemProdutos'
      ''
      '      %ListadeProdutos'
      ''
      '      %ListadeGrupos'
      ''
      '      %ListadeClasses'
      ''
      '      %ListadeMarcas'
      ''
      ''
      '      ) as cp_log'
      
        '      order by produto, produtovisual, DATA, preco, descricao_pr' +
        'oduto'
      '  ) as pnp'
      ''
      ') as pnp, cargos ca'
      ''
      ') as pnp'
      ''
      
        'group by pnp.produto, pnp.produtovisual, pnp.descricao_produto, ' +
        'pnp.data, pnp.preco, pnp.descricao_preco, pnp.valor, pnp.markup,' +
        ' pnp.trigger_user, pnp.cargo'
      'order by 1,2,3,4,5,6,7,8,9, 10'#39','
      ''
      
        #39'select cast(cast(ca.codigo as varchar(10))||'#39#39' - '#39#39'||cast(ca.de' +
        'scricao as varchar(50)) as varchar(65)) as cargo'
      ' from cargos ca '
      ' order by 1'#39', '
      ' '
      ' '#39'identificador'#39','
      ' '
      
        ' '#39', produtovisualdescricao, produto, produtovisual,  descricao_p' +
        'roduto, data, preco, descricao_preco, valor, markup, trigger_use' +
        'r'#39','
      ''
      '  '#39'cargo'#39', '#39'valorprodutocargo'#39', '#39'curs'#39' '
      ''
      ') as cur ;'
      ''
      'fetch ALL in curs;')
    RequestLive = False
    Left = 456
    Top = 16
  end
  object qryAlteracoesPrecosCargosVisaoParalela_Auxiliar: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrAlteracoesPrecos
    Constraints = <>
    AutoCalcFields = False
    OnCalcFields = qryAlteracoesPrecosCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'ListadeItemProdutos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListadeProdutos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListadeGrupos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListadeClasses'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListadeMarcas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SomentePrecoNormal'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      '  select cast( cast(produto as varchar) ||'
      '               cast(coalesce(preco,0) as varchar) ||'
      
        '               cast(coalesce(cargo,0) as varchar) as varchar(200' +
        ')) as identificador,'
      ''
      
        '         produto, preco, cargo,  to_char(data,'#39'DD-MM-YYYY'#39') as d' +
        'ata,'
      ''
      
        '         /*TO_char(cast(datahora as timestamp),'#39'DD-MM-YYYY HH:MI' +
        #39') as datahora,*/'
      '         cast(datahora as timestamp) as datahora,         '
      ''
      '         valor, markup, trigger_user, coluna'
      'from'
      '('
      ''
      '('
      ''
      '      select produto,'
      '             preco,'
      '             cast(null as integer) as cargo,'
      '             data, datahora,'
      
        '             (select valor from t_colunasprecos_log(pnp.produto,' +
        ' pnp.preco, cast(pnp.datahora as timestamp))) as valor,'
      '             markup, trigger_user, coluna'
      '         '
      ''
      '             '
      '       from'
      '      '
      '       ('
      '       '
      ''
      '          select p.codigo as produto,'
      '                 cp_log.data, cp_log.datahora,'
      '                 cp_log.preco,'
      '                 c.markup, cp_log.trigger_user, cp_log.coluna'
      ''
      ''
      '          from'
      '          '
      '          ('
      ''
      '          '
      '          ('
      '            select p.codigo as produto,'
      
        '                   date(cp_log.trigger_changed at TIME ZONE '#39'UTC' +
        #39') as data,'
      '                   cp_log.trigger_changed as datahora,'
      
        '                   cp_log.preco, cp_log.trigger_user, cp_log.col' +
        'una'
      ''
      '            from colunasprecos_log cp_log'
      ''
      '                  join (produtos p'
      ''
      '                    join (((caracteristicas c'
      ''
      '                               join grupos g'
      '                               on c.grupo = g.codigo)'
      ''
      '                               join classes cl'
      '                               on c.classe = cl.codigo)'
      ''
      '                               join marcas m'
      '                               on c.marca = m.codigo)'
      ''
      '                   on p.caracteristica = c.codigo)'
      ''
      '                 on cp_log.caracteristica = p.caracteristica'
      ''
      
        '            where  (((date(cp_log.trigger_changed at TIME ZONE '#39 +
        'UTC'#39')) >='
      '            :DataInicial )'
      
        '             and ((date(cp_log.trigger_changed at TIME ZONE '#39'UTC' +
        #39')) <='
      '            :Datafinal ))'
      ''
      
        '            and (cp_log.Trigger_Tuple = '#39'NEW'#39' or (cp_log.Trigger' +
        '_Tuple = '#39'OLD'#39' and Trigger_Mode='#39'DELETE'#39'))'
      ''
      ''
      '            %ListadeItemProdutos'
      ''
      '            %ListadeProdutos'
      ''
      '            %ListadeGrupos'
      ''
      '            %ListadeClasses'
      ''
      '            %ListadeMarcas'
      ''
      ''
      
        '             group by p.codigo, date(cp_log.trigger_changed at T' +
        'IME ZONE '#39'UTC'#39'),'
      
        '                      cp_log.trigger_changed, cp_log.preco, cp_l' +
        'og.trigger_user, cp_log.coluna'
      ''
      ''
      '          )'
      ''
      '          union'
      ''
      '          ('
      ''
      ''
      '            select p_log.codigo as produto,'
      '                   p_log.trigger_date as data,'
      '                   p_log.trigger_changed as datahora,'
      
        '                   p_log.preco, p_log.trigger_user, cast(null as' +
        ' smallint) as coluna'
      '            from produtos_log p_log'
      ''
      '                 join (produtos p'
      ''
      '                    join (((caracteristicas c'
      ''
      '                               join grupos g'
      '                               on c.grupo = g.codigo)'
      ''
      '                               join classes cl'
      '                               on c.classe = cl.codigo)'
      ''
      '                               join marcas m'
      '                               on c.marca = m.codigo)'
      ''
      '                       on p.caracteristica = c.codigo)'
      ''
      '                 on p_log.codigo = p.codigo'
      ''
      ''
      ''
      '            where  ((p_log.trigger_date >='
      '                      :DataInicial ) AND (p_log.trigger_date <='
      '                      :DataFinal ))'
      ''
      '            and exists (select p_log2.codigo'
      '                        from produtos_log p_log2'
      '                        where p_log2.codigo = p_log.codigo'
      
        '                          and p_log2.trigger_date = p_log.trigge' +
        'r_date'
      
        '                          and p_log2.trigger_user = p_log.trigge' +
        'r_user'
      '                          and p_log2.preco <> p_log.preco'
      '                          limit 1)'
      ''
      '            %ListadeItemProdutos'
      ''
      '            %ListadeProdutos'
      ''
      '            %ListadeGrupos'
      ''
      '            %ListadeClasses'
      ''
      '            %ListadeMarcas'
      ''
      
        '            group by p_log.codigo, p_log.trigger_date, p_log.tri' +
        'gger_changed, p_log.preco, p_log.trigger_user'
      ''
      ''
      '          )'
      ''
      ''
      '      ) as cp_log'
      ''
      '                    join (produtos p'
      ''
      '                    join (((caracteristicas c'
      ''
      '                               join grupos g'
      '                               on c.grupo = g.codigo)'
      ''
      '                               join classes cl'
      '                               on c.classe = cl.codigo)'
      ''
      '                               join marcas m'
      '                               on c.marca = m.codigo)'
      ''
      '               on p.caracteristica = c.codigo)'
      ''
      ''
      '              on cp_log.produto = p.codigo'
      ''
      ''
      'group by'
      ''
      ''
      '           p.codigo,'
      
        '                 cp_log.data, cp_log.datahora, cp_log.preco, c.m' +
        'arkup, cp_log.trigger_user, cp_log.coluna'
      ''
      '     ) as pnp'
      ''
      ''
      ')'
      ''
      ''
      'union all'
      ''
      ''
      '('
      ''
      'select pnp.produto, pnp.preco, '
      '       pnp.cargo, pnp.data, pnp.datahora,'
      
        '       estoques_preco_(pnp.produto, pnp.valor, pnp.markup) as va' +
        'lor, markup, trigger_user, coluna'
      ''
      'from'
      '('
      ''
      ''
      '      select cp_log.*,'
      
        '           coalesce((select markup from t_produtoscargos_log(cp_' +
        'log.produto, ca.codigo, cp_log.data)),0) as markup,'
      ''
      '           ca.codigo as cargo'
      '                   '
      ''
      '      from'
      '      '
      '      ('
      '      '
      '      select produto, '
      '             data, datahora, preco, trigger_user, coluna,'
      
        '             (select valor from t_colunasprecos_log(pnp.produto,' +
        ' pnp.preco, cast(pnp.datahora as timestamp))) as valor'
      '             '
      '       from'
      '      '
      '       ('
      '       '
      ''
      '          select p.codigo as produto,'
      '                 cp_log.data, cp_log.datahora,'
      
        '                 cp_log.preco, cp_log.trigger_user, cp_log.colun' +
        'a'
      ''
      ''
      '          from'
      '          '
      '          ('
      '          '
      '          '
      '          ('
      '            select p.codigo as produto,'
      
        '                   date(cp_log.trigger_changed at TIME ZONE '#39'UTC' +
        #39') as data,'
      '                   cp_log.trigger_changed as datahora,'
      
        '                 cp_log.preco, cp_log.trigger_user, cp_log.colun' +
        'a'
      ''
      '            from colunasprecos_log cp_log'
      ''
      '                 join (produtos p'
      ''
      '                    join (((caracteristicas c'
      ''
      '                               join grupos g'
      '                               on c.grupo = g.codigo)'
      ''
      '                               join classes cl'
      '                               on c.classe = cl.codigo)'
      ''
      '                               join marcas m'
      '                               on c.marca = m.codigo)'
      ''
      '                     on p.caracteristica = c.codigo)'
      ''
      '                 on cp_log.caracteristica = p.caracteristica'
      ''
      
        '            where  (((date(cp_log.trigger_changed at TIME ZONE '#39 +
        'UTC'#39')) >='
      ''
      '            :DataInicial )'
      
        '             and ((date(cp_log.trigger_changed at TIME ZONE '#39'UTC' +
        #39')) <='
      '            :Datafinal ))'
      ''
      ''
      '            %ListadeItemProdutos'
      ''
      '            %ListadeProdutos'
      ''
      '            %ListadeGrupos'
      ''
      '            %ListadeClasses'
      ''
      '            %ListadeMarcas'
      ''
      '            %SomentePrecoNormal'
      ''
      ''
      
        '             group by p.codigo, date(cp_log.trigger_changed at T' +
        'IME ZONE '#39'UTC'#39'),'
      
        '                     cp_log.trigger_changed, cp_log.preco, cp_lo' +
        'g.trigger_user, cp_log.coluna'
      ''
      ''
      '          )'
      ''
      '          union'
      ''
      '          ('
      ''
      '            select p_log.codigo as produto,'
      '                   p_log.trigger_date as data,'
      '                   p_log.trigger_changed as datahora,'
      
        '                   p_log.preco, p_log.trigger_user, cast(null as' +
        ' smallint) as coluna'
      '            from produtos_log p_log'
      ''
      '                 join (produtos p'
      ''
      '                    join (((caracteristicas c'
      ''
      '                               join grupos g'
      '                               on c.grupo = g.codigo)'
      ''
      '                               join classes cl'
      '                               on c.classe = cl.codigo)'
      ''
      '                               join marcas m'
      '                               on c.marca = m.codigo)'
      ''
      '                     on p.caracteristica = c.codigo)'
      ''
      ''
      '               on p_log.codigo = p.codigo'
      ''
      ''
      ''
      ''
      '            where  ((p_log.trigger_date >='
      '                      :DataInicial ) AND (p_log.trigger_date <='
      '                      :DataFinal ))'
      ''
      '            and exists (select p_log2.codigo'
      '                        from produtos_log p_log2'
      '                        where p_log2.codigo = p_log.codigo'
      
        '                          and p_log2.trigger_date = p_log.trigge' +
        'r_date'
      
        '                          and p_log2.trigger_user = p_log.trigge' +
        'r_user'
      '                          and p_log2.preco <> p_log.preco'
      '                          limit 1)'
      ''
      ''
      '            %ListadeItemProdutos'
      ''
      '            %ListadeProdutos'
      ''
      '            %ListadeGrupos'
      ''
      '            %ListadeClasses'
      ''
      '            %ListadeMarcas'
      #9#9#9
      '  '#9'    %SomentePrecoNormal'
      ''
      
        '            group by p_log.codigo, p_log.trigger_date, p_log.tri' +
        'gger_changed, p_log.preco, p_log.trigger_user'
      ''
      '          )'
      ''
      '          union'
      ''
      '         ('
      ''
      '            select pc_log.produto, pc_log.data, pc_log.datahora,'
      
        '                (select preco from t_produtos_log(pc_log.produto' +
        ', pc_log.data)) as preco, pc_log.trigger_user, pc_log.coluna'
      '         from'
      ''
      ''
      '          ('
      ''
      '            select pc_log.produto,'
      
        '                   date(pc_log.trigger_changed at TIME ZONE '#39'UTC' +
        #39') as data,'
      '                   pc_log.trigger_changed as datahora,'
      
        '                   pc_log.trigger_user, cast(null as smallint) a' +
        's coluna'
      ''
      ''
      '            from produtoscargos_log pc_log'
      ''
      '                    join (produtos p'
      ''
      '                    join (((caracteristicas c'
      ''
      '                               join grupos g'
      '                               on c.grupo = g.codigo)'
      ''
      '                               join classes cl'
      '                               on c.classe = cl.codigo)'
      ''
      '                               join marcas m'
      '                               on c.marca = m.codigo)'
      ''
      '               on p.caracteristica = c.codigo)'
      ''
      ''
      '              on pc_log.produto = p.codigo'
      ''
      ''
      ''
      ''
      
        '            where  (((date(pc_log.trigger_changed at TIME ZONE '#39 +
        'UTC'#39')) >='
      ''
      '            :DataInicial )'
      ''
      
        '             and ((date(pc_log.trigger_changed at TIME ZONE '#39'UTC' +
        #39')) <='
      ''
      '            :DataFinal ))'
      ''
      '            %ListadeItemProdutos'
      ''
      '            %ListadeProdutos'
      ''
      '            %ListadeGrupos'
      ''
      '            %ListadeClasses'
      ''
      '            %ListadeMarcas'
      #9#9#9
      ' '#9'    %SomentePrecoNormal'
      ''
      ''
      '            group by'
      ''
      '             pc_log.produto,'
      '             date(pc_log.trigger_changed at TIME ZONE '#39'UTC'#39'),'
      '             pc_log.trigger_changed,'
      '             pc_log.trigger_user'
      ''
      ''
      '          ) as pc_log'
      ''
      '         )'
      ''
      '      ) as cp_log'
      '      '
      '                    join (produtos p'
      ''
      '                    join (((caracteristicas c'
      ''
      '                               join grupos g'
      '                               on c.grupo = g.codigo)'
      ''
      '                               join classes cl'
      '                               on c.classe = cl.codigo)'
      ''
      '                               join marcas m'
      '                               on c.marca = m.codigo)'
      ''
      '               on p.caracteristica = c.codigo)'
      ''
      ''
      '              on cp_log.produto = p.codigo'
      ''
      ''
      'group by'
      ''
      ''
      '           p.codigo,'
      
        '                 cp_log.data, cp_log.datahora, cp_log.preco, cp_' +
        'log.trigger_user, cp_log.coluna'
      ''
      '     ) as pnp'
      ''
      '   ) as cp_log, cargos ca'
      ''
      ''
      ') as pnp'
      ''
      
        'order by produto, preco, cargo, data, datahora, valor, markup, t' +
        'rigger_user, coluna'
      ''
      ')'
      ''
      ') as selecao'
      
        'order by /*produto, preco, cargo,*/ cast(data as date), cast(dat' +
        'ahora as timestamp), valor, markup, trigger_user, coluna'
      '')
    RequestLive = False
    Left = 320
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DataInicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataFinal'
        ParamType = ptUnknown
      end>
  end
  object qryAlteracoesPrecosCargosVisaoParalela: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 'identificador=identificador'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrAlteracoesPrecosCargos
    Constraints = <>
    AutoCalcFields = False
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'rollback;'
      'begin;'
      ''
      'SELECT dynamic_pivot_('
      ''
      #39
      'select cast( cast(pnp.produto as varchar) ||'
      '            cast(pnp.data as varchar) ||'
      '            cast(coalesce(pnp.preco,0) as varchar) ||'
      '            cast(coalesce(pnp.valor,0) as varchar) ||'
      '            cast(coalesce(pnp.markup,0) as varchar) ||'
      
        '            cast(coalesce(pnp.trigger_user,'#39#39#39#39') as varchar) as ' +
        'varchar(200)) as identificador,'
      ''
      
        '       cast(cast(pnp.produtovisual as varchar)||'#39#39' '#39#39'||cast(pnp.' +
        'descricao_produto as varchar) as varchar(150)) as produtovisuald' +
        'escricao,'
      ''
      '       pnp.produto, pnp.produtovisual,'
      '       pnp.descricao_produto, pnp.data, pnp.preco,'
      
        '       pnp.descricao_preco, pnp.valor, pnp.markup, pnp.trigger_u' +
        'ser, pnp.cargo,'
      
        '       sum(estoques_preco_(pnp.produto, pnp.valor, pnp.markup)) ' +
        'as valorprodutocargo'
      ''
      'from'
      '('
      'select pnp.*,'
      
        '       coalesce((select markup from t_produtoscargos_log(pnp.pro' +
        'duto, ca.codigo, pnp.data)),0) as markup,'
      
        '       (select trigger_user from t_produtoscargos_log(pnp.produt' +
        'o, ca.codigo, pnp.data)) as trigger_user,       '
      
        '       cast(cast(ca.codigo as varchar(10))||'#39#39' - '#39#39'||cast(ca.des' +
        'cricao as varchar(50)) as varchar(65)) as cargo'
      '       '
      'from'
      '('
      ''
      ''
      '  select pnp.*,'
      '         (select pr.descricao '
      '          from precos pr '
      '          where pr.caracteristica = (select p.caracteristica'
      '                                     from produtos p'
      
        '                                     where p.codigo = pnp.produt' +
        'o)'
      '            and pr.codigo = pnp.preco) as descricao_preco,'
      '            '
      
        '         (select valor from t_colunasprecos_log(pnp.produto, pnp' +
        '.preco, pnp.data)) as valor'
      '  from'
      '  ('
      '      select distinct cp_log.*,'
      
        '             (select preco from t_produtos_log(cp_log.produto, c' +
        'p_log.data)) as preco'
      '      from'
      '      ('
      ''
      '      select distinct p.codigo as produto,'
      '             p.codigovisual as produtovisual,'
      '             p.descricao as descricao_produto,'
      '             cp_log.data'
      ''
      ''
      '      from'
      '      ('
      '        select distinct cp_log.caracteristica,'
      '             cast(cp_log.trigger_changed as date) as data'
      '         from colunasprecos_log cp_log'
      '         where cast(cp_log.trigger_changed as date) between'
      ''
      '         '#39#39'2010-04-01'#39#39
      ''
      '         and'
      ''
      '         '#39#39'2010-04-30'#39#39
      '         '
      
        '       order by cp_log.caracteristica, cast(cp_log.trigger_chang' +
        'ed as date)'
      '       ) as cp_log'
      '          join ((((caracteristicas c'
      '                join produtos p'
      '                on p.caracteristica = c.codigo)'
      ''
      '                           join grupos g'
      '                           on c.grupo = g.codigo)'
      ''
      '                           join classes cl'
      '                           on c.classe = cl.codigo)'
      ''
      '                           join marcas m'
      '                           on c.marca = m.codigo)'
      ''
      ''
      '          on cp_log.caracteristica = c.codigo'
      ''
      '      where true'
      ''
      ''
      ''
      '      ) as cp_log'
      
        '      order by produto, produtovisual, DATA, preco, descricao_pr' +
        'oduto'
      '  ) as pnp'
      ''
      ') as pnp, cargos ca'
      ''
      ') as pnp'
      ''
      
        'group by pnp.produto, pnp.produtovisual, pnp.descricao_produto, ' +
        'pnp.data, pnp.preco, pnp.descricao_preco, pnp.valor, pnp.markup,' +
        ' pnp.trigger_user, pnp.cargo'
      'order by 1,2,3,4,5,6,7,8,9, 10'#39','
      ''
      
        #39'select cast(cast(ca.codigo as varchar(10))||'#39#39' - '#39#39'||cast(ca.de' +
        'scricao as varchar(50)) as varchar(65)) as cargo'
      ' from cargos ca '
      ' order by 1'#39', '
      ' '
      ' '#39'identificador'#39','
      ' '
      
        ' '#39', produtovisualdescricao, produto, produtovisual, descricao_pr' +
        'oduto, data, preco, descricao_preco, valor, markup, trigger_user' +
        #39','
      ''
      '  '#39'cargo'#39', '#39'valorprodutocargo'#39', '#39'curs'#39' '
      ''
      ') as cur ;'
      ''
      'fetch ALL in curs;')
    RequestLive = False
    Left = 72
    Top = 320
  end
  object dsrAlteracoesPrecosCargosVisaoParalela: TtecDataSource
    DataSet = qryAlteracoesPrecosCargosVisaoParalela
    Left = 80
    Top = 264
  end
  object qryConsultaEstoques: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 'produto=produto'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrAlteracoesPrecosCargos
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Classe'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Marcas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Modelos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Grupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Item'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Promocoes'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';select *,'
      
        '       (select f.nome from fornecedores f where f.codigo = (sele' +
        'ct np.fornecedor from notaspag np where np.codigo = codigonotaen' +
        'trada)) as nomefornecedor,'
      
        '       (select pnp.incidencia from produtosnotaspag pnp where pn' +
        'p.codigonota = codigonotaentrada and pnp.produto = temp.produto ' +
        'limit 1) as cst_nfentrada,'
      
        '       (select pnp.csosn from produtosnotaspag pnp where pnp.cod' +
        'igonota = codigonotaentrada and pnp.produto = temp.produto limit' +
        ' 1) as csosn_nfentrada,'
      
        '       (select pnp.cst_nf from produtosnotaspag pnp where pnp.co' +
        'digonota = codigonotaentrada and pnp.produto = temp.produto limi' +
        't 1) as cst_nf,'
      
        '       (select pnp.csosn_nf from produtosnotaspag pnp where pnp.' +
        'codigonota = codigonotaentrada and pnp.produto = temp.produto li' +
        'mit 1) as csosn_nf,'
      
        '       case when (select f.nosimples from fornecedores f where f' +
        '.codigo = (select np.fornecedor from notaspag np where np.codigo' +
        ' = codigonotaentrada)) = null then False'
      
        '            else (select f.nosimples from fornecedores f where f' +
        '.codigo = (select np.fornecedor from notaspag np where np.codigo' +
        ' = codigonotaentrada)) end  as fornecedornosimples'
      'from'
      '(Select e.produto,'
      '        p.codigovisual as produtovisual,'
      '        e.filial,'
      '        f.nome as nomefilial,'
      '        e.localizacao,'
      '        e.minimo,'
      '        e.maximo,'
      '        e.precosemicms,'
      '        e.precocomicms,'
      
        '        CASE WHEN c.csosn in ('#39'101'#39','#39'102'#39') THEN e.valorultimacom' +
        'pra + (e.precocomicms-e.precosemicms) ELSE e.valorultimacompra E' +
        'ND as ultimacompra_com_icms,'
      '        e.valorultimacompra,'
      '        e.financeiro,'
      
        '        case when (e.emestoque+e.reservado+e.reservaprevia+e.tra' +
        'nsito+e.demonstracao+e.conserto+e.danificada) = 0  then 0'
      
        '             else round(e.financeiro / (e.emestoque+e.reservado+' +
        'e.reservaprevia+e.transito+e.demonstracao+e.conserto+e.danificad' +
        'a), 2)'
      '        end as customedio,'
      '        e.aliquotaipi,'
      '        e.datacompra,'
      '        e.qtdecompra,'
      '        e.ultimaentrada,'
      '        e.ultimavenda,'
      ''
      '        e.emestoque,'
      '        e.reservado,'
      '        e.reservaprevia,'
      '        e.demonstracao,'
      '        e.transito,'
      '        e.conserto,'
      '        e.danificada,'
      '        e.futuro,'
      '        (select max(np.codigo)'
      '         from notaspag np'
      '         where np.codigo in (select pn.codigonota'
      '                             from produtosnotaspag pn'
      '                             where pn.produto  = e.produto'
      
        '                              and ehnotafiscalentradacompra(codi' +
        'gofiscal)) and np.tipofornecedor <> '#39'L'#39') as codigonotaentrada, '
      
        '        (select estoques_produtoempromocao(e.produto,e.filial)) ' +
        'as produtoempromocao,'
      
        '        (select estoques_produtoinativo(e.produto)) as produtoin' +
        'ativo,'
      
        '        (select estoques_produtoforalinha(e.produto)) as produto' +
        'foralinha,'
      
        '        (e.emestoque + e.reservado+e.reservaprevia) as estoqueve' +
        'nda,'
      
        '        (e.emestoque + e.reservado + e.reservaprevia + e.transit' +
        'o + e.demonstracao + e.conserto + e.danificada) as estoquetotal,'
      '        f.preconormal,'
      '        f.precopromocao,'
      '        p.caracteristica,'
      '        c.descricao as descricaocaracteristica,'
      
        '        (select ti.valor from tributosicms ti where ti.codigo = ' +
        'c.incidencia) as incidencia,'
      '        c.csosn,'
      '        p.preco,'
      '        p.descricao  as descproduto,'
      '        p.referencia,'
      
        '        (select m.descricao from marcas m where m.codigo = c.mar' +
        'ca) as descmarca,'
      '        c.grade1,'
      '        c.grade2,'
      
        '        (select descricao from grades where grades.codigo = c.gr' +
        'ade1) as linha,'
      
        '        (select descricao from grades where grades.codigo = c.gr' +
        'ade2) as coluna,'
      '        p.valorgrade1,'
      '        p.valorgrade2,'
      '        e.estoquefisico,'
      
        '        case when e.filial = :FilialBase then 0 else e.filial en' +
        'd as sequencia,'
      
        '        (SELECT descricao FROM unidades WHERE codigo = c.unidade' +
        ') AS unidade,'
      '        CAST(CASE WHEN c.producaopropria THEN '#39'P'#39
      '                                         ELSE '#39'T'#39
      '             END AS CHAR) as producaopropria,'
      '        CAST(CASE WHEN :arredondamento THEN '#39'A'#39
      '                  ELSE '#39'T'#39
      '             END AS CHAR) AS arredondamento,'
      ''
      ''
      
        '        CAST(CASE WHEN c.incidencia = 5           THEN '#39'I'#39'  /* 4' +
        '0'#9'Isenta */'
      ''
      '/*'
      'codigo'#9'valor'#9'descricao'
      
        '4'#9'     30'#9'Isenta ou n'#227'o tributada e com cobran'#231'a do ICMS por sub' +
        'stitui'#231#227'o tribut'#225'ria'
      '6'#9'     41'#9'N'#227'o tributada'
      '7'#9'     50'#9'Suspens'#227'o'
      '11'#9'   90'#9'Outros'
      '*/'
      '                  WHEN c.incidencia in (4,6,7,11) THEN '#39'N'#39
      '/*'
      'codigo'#9'valor'#9'descricao'
      
        '2'#9'     10'#9'Tributada e com cobran'#231'a do ICMS por substitui'#231#227'o trib' +
        'ut'#225'ria'
      '9'#9'     60'#9'ICMS cobrado anteriormente por substitui'#231#227'o tribut'#225'ria'
      
        '10'#9'   70'#9'Com redu'#231#227'o de base de c'#225'lculo e cobran'#231'a do ICMS por s' +
        'ubstitui'#231#227'o tribut'#225'ria'
      '*/'
      '                  WHEN c.incidencia in (2,9,10)   THEN '#39'F'#39
      '/*'
      'codigo'#9'valor'#9'descricao'
      '1'#9'00'#9'Tributada integralmente'
      '3'#9'20'#9'Com redu'#231#227'o de base de c'#225'lculo'
      '8'#9'51'#9'Diferimento'
      '*/'
      '                  WHEN c.incidencia in (1,3,8)    THEN '#39'T'#39
      '             END AS CHAR) AS situacaotributaria,'
      ''
      '        CodigoBarras(e.produto) as codigobarras,'
      '        c.cest,'
      '        i.classificacaofiscal,'
      '        c.peso,'
      '        c.composto,'
      '        c.composto2,'
      '        estoques_preco(e.produto,e.filial) as preco_atual,'
      '        c.grupo,'
      '        g.descricao as descricaogrupo,'
      '        p.promocao,'
      '        pro.descricao as descricaopromocao ,'
      '        e.sublocalizacao,'
      ''
      
        '        (select CAST(string_agg(DISTINCT mo.descricao,'#39', '#39') as v' +
        'archar(500))'
      '         from modelos mo'
      '         where mo.codigo in (select mc.modelo'
      '                             from modeloscaracteristicas mc'
      
        '                             where mc.caracteristica = c.codigo)' +
        ') as modelos_agg'
      ''
      ''
      
        'From   estoques e ,filiais f, (produtos p left join promocoes pr' +
        'o on p.promocao = pro.codigo),'
      '       caracteristicas c, ipi i, grupos g, classes cl, marcas m'
      ''
      'Where  (e.produto = p.codigo) and'
      '       (e.filial = f.codigo) and'
      '       (p.caracteristica = c.codigo) and'
      '       (i.codigo = c.ipi) and'
      '       (c.grupo = g.codigo) and'
      '       (c.classe = cl.codigo) and'
      '       (c.marca = m.codigo)'
      ''
      ''
      '%Filial'
      '%Classe'
      '%Marcas'
      '%Modelos'
      '%Grupo'
      '%Item'
      '%Produto'
      '%Promocoes'
      'Order By UPPER(TO_ASCII(p.descricao,'#39'latin1'#39')), sequencia'
      ') as temp')
    RequestLive = True
    Left = 512
    Top = 129
    ParamData = <
      item
        DataType = ftString
        Name = 'FilialBase'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftUnknown
        Name = 'arredondamento'
        ParamType = ptUnknown
      end>
    object qryConsultaEstoquesproduto: TLargeintField
      FieldName = 'produto'
      Required = True
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesprodutovisual: TStringField
      FieldName = 'produtovisual'
      Size = 30
    end
    object qryConsultaEstoquesfilial: TIntegerField
      FieldName = 'filial'
      Required = True
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesminimo: TFloatField
      FieldName = 'minimo'
      DisplayFormat = '0'
    end
    object qryConsultaEstoqueslocalizacao: TStringField
      DisplayWidth = 20
      FieldName = 'localizacao'
      Size = 40
    end
    object qryConsultaEstoquesmaximo: TFloatField
      FieldName = 'maximo'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquescaracteristica: TLargeintField
      FieldName = 'caracteristica'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquespreco: TIntegerField
      FieldName = 'preco'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesdescproduto: TStringField
      FieldName = 'descproduto'
      Required = True
      Size = 100
    end
    object qryConsultaEstoquesreferencia: TStringField
      DisplayWidth = 15
      FieldName = 'referencia'
      Size = 30
    end
    object qryConsultaEstoquesdescmarca: TStringField
      DisplayWidth = 15
      FieldName = 'descmarca'
      Size = 60
    end
    object qryConsultaEstoquesprecosemicms: TFloatField
      FieldName = 'precosemicms'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesprecocomicms: TFloatField
      FieldName = 'precocomicms'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesdatacompra: TDateField
      Alignment = taCenter
      FieldName = 'datacompra'
      EditMask = '99/99/9999;1; '
    end
    object qryConsultaEstoquesqtdecompra: TFloatField
      FieldName = 'qtdecompra'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesultimaentrada: TDateField
      Alignment = taCenter
      FieldName = 'ultimaentrada'
      EditMask = '99/99/9999;1; '
    end
    object qryConsultaEstoquesultimavenda: TDateField
      Alignment = taCenter
      FieldName = 'ultimavenda'
      EditMask = '99/99/9999;1; '
    end
    object qryConsultaEstoquespreconormal: TIntegerField
      FieldName = 'preconormal'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesprecopromocao: TIntegerField
      FieldName = 'precopromocao'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesemestoque: TFloatField
      FieldName = 'emestoque'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesreservado: TFloatField
      FieldName = 'reservado'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesdemonstracao: TFloatField
      FieldName = 'demonstracao'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquestransito: TFloatField
      FieldName = 'transito'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesconserto: TFloatField
      FieldName = 'conserto'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesdanificada: TFloatField
      FieldName = 'danificada'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesfuturo: TFloatField
      FieldName = 'futuro'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesestoquevenda: TFloatField
      FieldName = 'estoquevenda'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesestoquetotal: TFloatField
      FieldName = 'estoquetotal'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesprodutoempromocao: TBooleanField
      FieldName = 'produtoempromocao'
    end
    object qryConsultaEstoquesfinanceiro: TFloatField
      FieldName = 'financeiro'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquescustomedio: TFloatField
      FieldName = 'customedio'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesaliquotaipi: TFloatField
      FieldName = 'aliquotaipi'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoqueslinha: TStringField
      DisplayWidth = 10
      FieldName = 'linha'
      Size = 40
    end
    object qryConsultaEstoquescoluna: TStringField
      DisplayWidth = 10
      FieldName = 'coluna'
      Size = 40
    end
    object qryConsultaEstoquesgrade1: TIntegerField
      FieldName = 'grade1'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesgrade2: TIntegerField
      FieldName = 'grade2'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesvalorgrade1: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade1'
      Size = 50
    end
    object qryConsultaEstoquesvalorgrade2: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade2'
      Size = 50
    end
    object qryConsultaEstoquesdescricaocaracteristica: TStringField
      FieldName = 'descricaocaracteristica'
      Size = 100
    end
    object qryConsultaEstoquesnomefilial: TStringField
      DisplayWidth = 40
      FieldName = 'nomefilial'
      Size = 60
    end
    object qryConsultaEstoquesreservaprevia: TFloatField
      FieldName = 'reservaprevia'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesestoquefisico: TFloatField
      FieldName = 'estoquefisico'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesprodutoinativo: TBooleanField
      FieldName = 'produtoinativo'
    end
    object qryConsultaEstoquesprodutoforalinha: TBooleanField
      FieldName = 'produtoforalinha'
    end
    object qryConsultaEstoquesincidencia: TStringField
      FieldName = 'incidencia'
      Size = 2
    end
    object qryConsultaEstoquessequencia: TIntegerField
      FieldName = 'sequencia'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquescodigonotaentrada: TIntegerField
      FieldName = 'codigonotaentrada'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesnomefornecedor: TStringField
      DisplayWidth = 40
      FieldName = 'nomefornecedor'
      Size = 60
    end
    object qryConsultaEstoquesfornecedornosimples: TBooleanField
      FieldName = 'fornecedornosimples'
    end
    object qryConsultaEstoquesunidade: TStringField
      Alignment = taCenter
      DisplayLabel = 'Unidade'
      DisplayWidth = 7
      FieldName = 'unidade'
      Size = 30
    end
    object qryConsultaEstoquesproducaopropria: TStringField
      Alignment = taCenter
      DisplayLabel = 'IPPT'
      FieldName = 'producaopropria'
      Size = 1
    end
    object qryConsultaEstoquesarredondamento: TStringField
      Alignment = taCenter
      DisplayLabel = 'IAT'
      FieldName = 'arredondamento'
      Size = 1
    end
    object qryConsultaEstoquessituacaotributaria: TStringField
      Alignment = taCenter
      DisplayLabel = 'ST'
      FieldName = 'situacaotributaria'
      Size = 1
    end
    object qryConsultaEstoquescodigobarras: TStringField
      DisplayLabel = 'C'#243'digo Barras'
      DisplayWidth = 18
      FieldName = 'codigobarras'
      Size = 100
    end
    object qryConsultaEstoquespeso: TFloatField
      DisplayLabel = 'Peso do Produto'
      FieldName = 'peso'
      DisplayFormat = '###,##0.0000'
    end
    object qryConsultaEstoquescsosn: TStringField
      FieldName = 'csosn'
      Size = 3
    end
    object qryConsultaEstoquescst_nfentrada: TStringField
      FieldName = 'cst_nfentrada'
      Size = 2
    end
    object qryConsultaEstoquescsosn_nfentrada: TStringField
      FieldName = 'csosn_nfentrada'
      Size = 3
    end
    object qryConsultaEstoquescst_nf: TStringField
      FieldName = 'cst_nf'
      Size = 2
    end
    object qryConsultaEstoquescsosn_nf: TStringField
      FieldName = 'csosn_nf'
      Size = 3
    end
    object qryConsultaEstoquesultimacompra_com_icms: TFloatField
      FieldName = 'ultimacompra_com_icms'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquescomposto: TBooleanField
      FieldName = 'composto'
    end
    object qryConsultaEstoquescomposto2: TBooleanField
      FieldName = 'composto2'
    end
    object qryConsultaEstoquescest: TStringField
      FieldName = 'cest'
      Size = 9
    end
    object qryConsultaEstoquesclassificacaofiscal: TStringField
      FieldName = 'classificacaofiscal'
      Size = 8
    end
    object qryConsultaEstoquespreco_atual: TFloatField
      FieldName = 'preco_atual'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesgrupo: TStringField
      FieldName = 'grupo'
      Size = 4
    end
    object qryConsultaEstoquesdescricaogrupo: TStringField
      DisplayWidth = 30
      FieldName = 'descricaogrupo'
      Size = 100
    end
    object qryConsultaEstoquespromocao: TIntegerField
      FieldName = 'promocao'
    end
    object qryConsultaEstoquesdescricaopromocao: TStringField
      FieldName = 'descricaopromocao'
      Size = 100
    end
    object qryConsultaEstoquessublocalizacao: TStringField
      DisplayWidth = 20
      FieldName = 'sublocalizacao'
      Size = 40
    end
    object qryConsultaEstoquesmodelos_agg: TStringField
      FieldName = 'modelos_agg'
      Size = 500
    end
    object qryConsultaEstoquesvalorultimacompra: TFloatField
      FieldName = 'valorultimacompra'
    end
  end
  object dsrConsultaEstoques: TtecDataSource
    DataSet = qryConsultaEstoques
    Left = 546
    Top = 145
  end
  object qryPrecos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 'caracteristica=caracteristica;preco=preco'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrAlteracoesPrecosCargos
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'ListaCaracteristicas_e_Preco'
        ParamType = ptUnknown
        Value = '(0,0)'
      end>
    Sql.Strings = (
      ''
      '/* qryPrecos */'
      ''
      'Select  precos.caracteristica, precos.preco,'
      ''
      '        sum(precos.valornormal) as valornormal,'
      
        '        max(precos.alteracaopreconormal) as alteracaopreconormal' +
        ','
      '        sum(precos.valorpromocao) as valorpromocao,'
      '        max(precos.validade) as validade,'
      '       (SELECT p.descricao '
      '        FROM precos p '
      
        '        WHERE p.caracteristica = precos.caracteristica AND p.cod' +
        'igo = precos.preco) AS descricaopreco'
      '       '
      'From '
      '   '
      '     ('
      ''
      '           ('
      '           '
      '                    SELECT   cp.caracteristica, cp.preco,'
      
        '                             (CASE WHEN (COALESCE(fpf.fator,0) >' +
        ' 0) then'
      
        '                                                                ' +
        'ROUND((cp.valor * fpf.fator),2)'
      '                                                   ELSE cp.valor'
      '                                         END) as valornormal,'
      
        '                                                                ' +
        '                  '
      
        '                              COALESCE(cp.alteracao,cp.data) as ' +
        'alteracaopreconormal,'
      '                              0 as valorpromocao,'
      '                              cp.validade'
      '                              '
      '                    FROM colunasprecos cp,'
      
        '                                     caracteristicas ca left joi' +
        'n (SELECT fatoresprecosfiliais.fator,'
      
        '                                                                ' +
        '                              fatoresprecosfiliais.fatorpreco'
      
        '                                                                ' +
        '               FROM   fatoresprecosfiliais'
      
        '                                                                ' +
        '               WHERE (fatoresprecosfiliais.filial =:filial)) fpf'
      
        '                                                                ' +
        '               '
      
        '                                                                ' +
        '               '
      
        '                                                                ' +
        '  ON (ca.fatorpreco = fpf.fatorpreco)'
      '                    WHERE /*(ca.codigo = :caracteristica) AND*/'
      
        '                                       (ca.codigo = cp.caracteri' +
        'stica) AND'
      
        '                                       /*(cp.preco  =:preco) AND' +
        '*/'
      
        '                                       (cp.coluna = :colunanorma' +
        'l)'
      '                                       '
      '                      %ListaCaracteristicas_e_Preco'
      '                           '
      '              )             '
      ''
      '              union'
      '              '
      '              ('
      '              '
      '                  SELECT cp.caracteristica, cp.preco,'
      '                         0 as valornormal,'
      '                         NULL as alteracao,'
      
        '                                (CASE WHEN (COALESCE(fpf.fator,0' +
        ') > 0) then'
      
        '                                                        ROUND((c' +
        'p.valor * fpf.fator),2)'
      '                                           ELSE cp.valor'
      '                                 END) as valorpromocao,'
      '                                 cp.validade'
      '                 FROM colunasprecos cp,'
      
        '                             caracteristicas ca left join (SELEC' +
        'T fatoresprecosfiliais.fator,'
      
        '                                                                ' +
        '                      fatoresprecosfiliais.fatorpreco'
      
        '                                                                ' +
        '       FROM   fatoresprecosfiliais'
      
        '                                                                ' +
        '       WHERE (fatoresprecosfiliais.filial =:filial)) fpf'
      
        '                                                          ON (ca' +
        '.fatorpreco = fpf.fatorpreco)'
      '                  WHERE /*(ca.codigo =:caracteristica) AND*/'
      
        '                                (ca.codigo = cp.caracteristica) ' +
        'AND'
      '                               /* (cp.preco  =:preco) AND  */'
      
        '                                (cp.coluna = :colunapromocao) AN' +
        'D'
      '                                (cp.validade >= current_date)'
      '                                '
      '                    %ListaCaracteristicas_e_Preco'
      ''
      '              )              '
      '                            '
      '                            '
      '       ) as precos'
      '       '
      'group by precos.caracteristica, precos.preco'
      '')
    RequestLive = False
    Left = 536
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'caracteristica'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'preco'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'colunanormal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'colunapromocao'
        ParamType = ptUnknown
      end>
    object qryPrecoscaracteristica: TLargeintField
      FieldName = 'caracteristica'
    end
    object qryPrecospreco: TIntegerField
      FieldName = 'preco'
    end
    object qryPrecosvalornormal: TFloatField
      FieldName = 'valornormal'
      DisplayFormat = '0.00'
    end
    object qryPrecosvalorpromocao: TFloatField
      FieldName = 'valorpromocao'
      DisplayFormat = '0.00'
    end
    object qryPrecosvalidade: TDateField
      Alignment = taCenter
      FieldName = 'validade'
      EditMask = '99/99/9999;1; '
    end
    object qryPrecosalteracaopreconormal: TDateField
      Alignment = taCenter
      FieldName = 'alteracaopreconormal'
      EditMask = '99/99/9999;1; '
    end
    object qryPrecosdescricaopreco: TStringField
      FieldName = 'descricaopreco'
      Size = 30
    end
  end
  object dsrPrecos: TDataSource
    DataSet = qryPrecos
    Left = 577
    Top = 232
  end
end
