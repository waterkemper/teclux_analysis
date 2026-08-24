inherited dtmAlteracoesPrecos: TdtmAlteracoesPrecos
  OldCreateOrder = False
  Left = 471
  Top = 275
  Height = 403
  Width = 617
  object dsrAlteracoesPrecos: TtecDataSource
    DataSet = qryAlteracoesPrecos
    Left = 56
    Top = 80
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
      '  (       '
      '    select pnp.produto, p.codigovisual as produtovisual,'
      
        '           (select p.descricao from produtos p where p.codigo = ' +
        'pnp.produto) as descricao_produto,'
      '           np.data,            '
      
        '           (select preco from t_produtos_log(pnp.produto, np.dat' +
        'a)) as preco'
      '    from notaspag np '
      '         join produtosnotaspag pnp    '
      '              join produtos p '
      '                   join caracteristicas c'
      ''
      '                     join grupos g'
      '                     on c.grupo = g.codigo'
      ''
      '                     join classes cl'
      '                     on c.classe = cl.codigo'
      ''
      '                     join marcas m'
      '                     on c.marca = m.codigo'
      ''
      '                   on p.caracteristica = c.codigo'
      '              on pnp.produto = p.codigo'
      '         on np.codigo = pnp.codigonota'
      ''
      '    where'
      ''
      '       np.data between :DataInicial and :DataFinal'
      '      and ehnotafiscalentradacompra(np.codigofiscal)'
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
      '  ) as pnp '
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
    Left = 120
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'DataInicial'
        ParamType = ptUnknown
        Value = #39'2010-04-06'#39
      end
      item
        DataType = ftString
        Name = 'DataFinal'
        ParamType = ptUnknown
        Value = #39'2010-04-06'#39
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
  object prvAlteracoesPrecos: TDataSetProvider
    DataSet = qryAlteracoesPrecos
    Left = 216
    Top = 168
  end
  object AlteracoesPrecos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvAlteracoesPrecos'
    Left = 360
    Top = 184
    object AlteracoesPrecosproduto: TLargeintField
      FieldName = 'produto'
    end
    object AlteracoesPrecosdescricao_produto: TStringField
      FieldName = 'descricao_produto'
      Size = 100
    end
    object AlteracoesPrecosdata: TDateField
      FieldName = 'data'
    end
    object AlteracoesPrecospreco: TIntegerField
      FieldName = 'preco'
    end
    object AlteracoesPrecosdescricao_preco: TStringField
      FieldName = 'descricao_preco'
      Size = 30
    end
    object AlteracoesPrecosvalor: TFloatField
      FieldName = 'valor'
    end
    object AlteracoesPrecosmarkup: TFloatField
      FieldName = 'markup'
    end
    object AlteracoesPrecoscargo: TStringField
      FieldName = 'cargo'
      Size = 65
    end
    object AlteracoesPrecosvalorprodutocargo: TFloatField
      FieldName = 'valorprodutocargo'
    end
  end
end
