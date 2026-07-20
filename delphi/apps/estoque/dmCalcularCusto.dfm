inherited dtmCalcularCusto: TdtmCalcularCusto
  OldCreateOrder = False
  Left = 786
  Top = 240
  Height = 334
  Width = 621
  object qryCaracteristicaCusto: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT  c.codigo, c.codigovisual,'
      '        c.descricao,'
      
        '       (select gr.descricao from grades gr where gr.codigo = c.g' +
        'rade1) as linha,'
      
        '       (select gr.descricao from grades gr where gr.codigo = c.g' +
        'rade2) as coluna,'
      '        c.grade1,'
      '        c.grade2,'
      '        cast(0 as integer) as  codigopreco,'
      '       (select m1.valor'
      '        from estadosicms m1'
      '        where m1.icms = c.icms'
      '          and m1.estado =:estado) as icms,'
      '        c.icms as codigoicms,'
      
        '       (select ti.valor from tributosicms ti where ti.codigo = c' +
        '.incidencia) as incidencia,'
      '        c.csosn,'
      '       (select m1.valor from estadosicms m1'
      '        where m1.icms = c.icms'
      '          and m1.estado =:estado) as aliquotaicmscalculopreco,'
      '        c.ipi,'
      '       (select i.aliquota'
      '        from ipi i'
      '        where i.codigo = c.ipi) as aliquotaipi,'
      '        c.composto,'
      '        c.aliquotapis,'
      '        c.aliquotacofins,'
      '        c.markup as markup_produto,'
      '        g.markup as markup_grupo,'
      '        g.calcularpreco,'
      '       (select e.precocomicms'
      '        from estoques e'
      '        where e.produto = (select p.codigo'
      '                           from produtos p'
      
        '                           where p.caracteristica = c.codigo lim' +
        'it 1)'
      
        '                            and e.filial = :FilialBase) as  prec' +
        'o,'
      '        c.grupo,'
      '        c.classe,'
      '       (case when g.naoreplicar then true'
      '        else      cl.naoreplicar end) as naoreplicar'
      ''
      'FROM caracteristicas c, grupos g, classes cl'
      'WHERE c.grupo = g.codigo'
      '  and c.classe = cl.codigo'
      '  and c.codigo = :codigo'
      '')
    RequestLive = False
    Left = 96
    Top = 53
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'estado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FilialBase'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
  end
  object qryMultiplosProduto: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'Select c.multiplo,'
      '           g.multiplo as multiplo_grupo,'
      '           s.multiplo as multiplo_classe'
      'From   caracteristicas c, grupos g, classes s'
      'Where c.grupo = g.codigo'
      '  and c.classe = s.codigo'
      '  and c.codigo =:codigo')
    RequestLive = False
    Left = 216
    Top = 53
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryMultiplosProdutomultiplo: TFloatField
      FieldName = 'multiplo'
      DisplayFormat = '0.00'
    end
    object qryMultiplosProdutomultiplo_grupo: TFloatField
      FieldName = 'multiplo_grupo'
      DisplayFormat = '0.00'
    end
    object qryMultiplosProdutomultiplo_classe: TFloatField
      FieldName = 'multiplo_classe'
      DisplayFormat = '0.00'
    end
  end
  object qryProcuraColunaPreco: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'Select  caracteristica,'
      '            preco,'
      '            coluna,'
      '            valor'
      'From    colunasprecos'
      'Where caracteristica = :caracteristica '
      '   and preco  = :preco'
      '   and coluna = :coluna')
    RequestLive = False
    Left = 88
    Top = 117
    ParamData = <
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
        Name = 'coluna'
        ParamType = ptUnknown
      end>
    object qryProcuraColunaPrecocaracteristica: TLargeintField
      FieldName = 'caracteristica'
      Required = True
    end
    object qryProcuraColunaPrecopreco: TIntegerField
      FieldName = 'preco'
      Required = True
    end
    object qryProcuraColunaPrecocoluna: TIntegerField
      FieldName = 'coluna'
      Required = True
    end
    object qryProcuraColunaPrecovalor: TFloatField
      FieldName = 'valor'
      Required = True
    end
  end
  object qryProdutosAlteracao: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'Condicao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select codigo,'
      '           preco'
      'from produtos'
      '%Condicao')
    RequestLive = True
    Left = 400
    Top = 53
    object qryProdutosAlteracaocodigo: TLargeintField
      FieldName = 'codigo'
    end
    object qryProdutosAlteracaopreco: TIntegerField
      FieldName = 'preco'
    end
  end
  object qryColunasPrecos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AutoCalcFields = False
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'condicao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'Select  caracteristica,'
      '        preco,'
      '        coluna,'
      '        valor,'
      '        alteracao,'
      ''
      '       (select pr.descricao'
      '        from precos pr'
      '        where pr.caracteristica = colunasprecos.caracteristica'
      
        '          and pr.codigo = colunasprecos.preco) as descricaopreco' +
        'produto'
      ''
      ''
      'From    colunasprecos'
      '%condicao')
    RequestLive = True
    Left = 360
    Top = 133
    object qryColunasPrecoscaracteristica: TLargeintField
      FieldName = 'caracteristica'
    end
    object qryColunasPrecospreco: TIntegerField
      FieldName = 'preco'
      DisplayFormat = '0'
    end
    object qryColunasPrecoscoluna: TIntegerField
      FieldName = 'coluna'
      DisplayFormat = '0'
    end
    object qryColunasPrecosvalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '###,###,##0.00'
    end
    object qryColunasPrecosalteracao: TDateField
      Alignment = taCenter
      FieldName = 'alteracao'
      EditMask = '99/99/9999;1; '
    end
    object qryColunasPrecosdescricaoprecoproduto: TStringField
      FieldName = 'descricaoprecoproduto'
      Size = 30
    end
  end
  object spcPrecos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select precos_proximocodigo(:caracteristica) as codigo')
    RequestLive = False
    Left = 216
    Top = 149
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'caracteristica'
        ParamType = ptUnknown
      end>
    object spcPrecoscodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object qryPrecos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AutoCalcFields = False
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'Select  caracteristica,'
      '            codigo,'
      '            descricao,'
      '            avariado'
      'From    precos'
      'where caracteristica = :caracteristica'
      'order by codigo            ')
    RequestLive = True
    Left = 216
    Top = 221
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'caracteristica'
        ParamType = ptUnknown
      end>
    object qryPrecoscaracteristica: TLargeintField
      FieldName = 'caracteristica'
    end
    object qryPrecoscodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryPrecosdescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
    object qryPrecosavariado: TBooleanField
      FieldName = 'avariado'
    end
  end
  object qryAtualizar_ProdutosCompostos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select atualizar_produtoscompostos(:p_ListaProdutos, :p_Filial);')
    RequestLive = False
    Left = 344
    Top = 213
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_ListaProdutos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'p_Filial'
        ParamType = ptUnknown
      end>
  end
end
