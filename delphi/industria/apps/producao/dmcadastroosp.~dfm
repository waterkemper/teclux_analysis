inherited dtmCadastroOSP: TdtmCadastroOSP
  OldCreateOrder = False
  Left = 626
  Top = 133
  Height = 555
  Width = 925
  object qryOSP: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterClose = qryOSPAfterClose
    AfterScroll = qryOSPAfterScroll
    OnCalcFields = qryOSPCalcFields
    OnNewRecord = qryOSPNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'Ordenacao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select osp.numero,'
      '       osp.entrega,'
      '       cast(null as date) as entrega_anterior,'
      '       osp.semana,'
      '       osp.ano,'
      '       osp.prioridade,'
      '       osp.observacoes,'
      '       osp.produto,'
      '       osp.data,'
      '       osp.cliente,'
      '       osp.pedidocliente,'
      '       osp.quantidade,'
      '       cast(null as numeric(9,3)) as quantidade_anterior,'
      '       osp.preco,'
      '       '
      '       p.codigovisual as produtovisual,'
      '       p.caracteristica,'
      '       c.codigovisual as caracteristicavisual,'
      '      (select sum(pdf.quantidade)'
      
        '       from DadosFiscais df join produtosdadosfiscais pdf on df.' +
        'numero = pdf.dadofiscal'
      '       where df.situacao='#39'N'#39
      '         and pdf.osp = osp.numero) as qtdeentregue,'
      '       cast(null as varchar(30)) as complementoproduto,'
      '       c.unidade,'
      '       cl.apelido,'
      
        '       (select sum(ospl.quantidade) from osplotes ospl where osp' +
        'l.osp = osp.numero) as quantidade_lote,'
      
        '       (select sum(ospl.excedente) from osplotes ospl where ospl' +
        '.osp = osp.numero) as excedente_lote,'
      ''
      ''
      '       (select  sum((select'
      
        '                       (select sum(oou.quantidade - coalesce(oou' +
        '.retrabalho,0))'
      '                        from operacoesospusuario oou'
      '                        where oou.osp = oo.osp'
      '                          and oou.lote = oo.lote'
      '                          and oou.operacao = oo.operacao )   +'
      ''
      
        '                        (case when btrim(oo.tipooperacao) = '#39'A'#39' ' +
        'then'
      ''
      
        '                          (select sum(oou2.quantidade - coalesce' +
        '(oou2.retrabalho,0))'
      '                           from operacoesosp oo2'
      '                                join operacoesospusuario oou2'
      '                                on oo2.operacao = oou2.operacao'
      '                                and oo2.osp = oou2.osp'
      '                                and oo2.lote = oou2.lote'
      '                            where oo2.osp = oo.osp'
      '                              and oo2.lote = oo.lote'
      '                              and oou2.operacao <> oo.operacao'
      
        '                              and position(btrim(substring(oo.se' +
        'quencia,1, position('#39'.'#39' in oo.sequencia))) in'
      
        '                                  btrim(case when position('#39'.'#39' i' +
        'n oo2.sequencia)<> 0 then oo2.sequencia else cast(oo2.sequencia|' +
        '|cast('#39'.'#39' as varchar) as varchar) end))<>0'
      ''
      '                               )'
      '                         else 0'
      '                         end)  as produzida'
      '                from operacoesosp oo'
      '                where oo.osp = ospl.osp'
      '                  and oo.lote = ospl.numero'
      
        '                order by cast(oo.sequencia as numeric) desc limi' +
        't 1'
      '                )) as produzida'
      '        from osplotes ospl'
      '        where ospl.osp = osp.numero) as produzida_lote,'
      ''
      
        '       ((select count(*) from operacoesosp oosp where oosp.osp =' +
        ' osp.numero limit 1) > 0) as pcpiniciado,'
      '       osp.cancelado,'
      '       osp.semiacabado,'
      '       osp.tipocliente,'
      '       c.setorproducao,'
      
        '       (select descricao from setoresproducao where codigo = c.s' +
        'etorproducao) as descricaosetorproducao'
      ''
      'from osp'
      '      join (produtos p'
      
        '           join caracteristicas c on p.caracteristica = c.codigo' +
        ')'
      '      on osp.produto = p.codigo'
      '      join clientes cl'
      '      on osp.cliente = cl.codigo'
      ''
      'WHERE  osp.numero is not null'
      ''
      '   AND  ((:Campo = 0)     AND'
      '         (:Operacao = 0) AND'
      #9' (osp.numero  = :numero))'
      ''
      '/* codigo */'
      '   OR ((:Campo =1) AND'
      '               /* PRIMEIRO */'
      
        '              (((:Operacao = 1)   AND ((osp.numero < :numero) or' +
        ' (:numero=0)))'
      '               /* ANTERIOR */'
      '            OR ((:Operacao = 2) AND (osp.numero ='
      
        '                                       (case when :numero<>0 the' +
        'n'
      
        '                                               (SELECT MAX(osp.n' +
        'umero)'
      '                                               FROM osp'
      
        '                                               WHERE osp.numero ' +
        '< :numero)'
      
        '                                       else (select min(osp.nume' +
        'ro)'
      '                                               from osp) end)))'
      '               /* PR'#211'XIMO */'
      
        '            OR ((:Operacao = 3) AND (osp.numero = (SELECT osp.nu' +
        'mero'
      '                                               FROM osp'
      
        '                                               WHERE  osp.numero' +
        ' > :numero'
      '   '#9#9#9#9'               order by osp.numero limit 1)))'
      '               /* '#218'LTIMO */'
      '            OR ((:Operacao = 4) AND (osp.numero > :numero))))'
      ''
      '%Ordenacao')
    RequestLive = True
    Left = 32
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Campo'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'Operacao'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryOSPnumero: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'N'#250'mero OSP'
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryOSPentrega: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data Entrega'
      FieldName = 'entrega'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryOSPsemana: TIntegerField
      DisplayLabel = 'N'#186' da semana'
      FieldName = 'semana'
      Required = True
      DisplayFormat = '0'
    end
    object qryOSPprioridade: TIntegerField
      DisplayLabel = 'Prioridade'
      FieldName = 'prioridade'
      Required = True
      DisplayFormat = '0'
    end
    object qryOSPano: TIntegerField
      DisplayLabel = 'Ano de Entrega'
      FieldName = 'ano'
      Required = True
      DisplayFormat = '0'
    end
    object qryOSPobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 300
    end
    object qryOSPproduto: TLargeintField
      FieldName = 'produto'
      Required = True
    end
    object qryOSPprodutovisual: TStringField
      DisplayLabel = 'produto'
      FieldName = 'produtovisual'
      Size = 50
    end
    object qryOSPcaracteristica: TLargeintField
      FieldName = 'caracteristica'
    end
    object qryOSPcaracteristicavisual: TStringField
      DisplayLabel = 'caracteristica'
      FieldName = 'caracteristicavisual'
      Required = True
      Size = 30
    end
    object qryOSPcomplementoproduto: TStringField
      DisplayLabel = 'Complemento da fam'#237'lia'
      FieldName = 'complementoproduto'
      Size = 30
    end
    object qryOSPdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryOSPpedidocliente: TStringField
      FieldName = 'pedidocliente'
      Size = 15
    end
    object qryOSPcliente: TIntegerField
      FieldName = 'cliente'
      Required = True
      DisplayFormat = '0'
    end
    object qryOSPquantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
      DisplayFormat = '###.##0,000'
    end
    object qryOSPpreco: TFloatField
      DisplayLabel = 'pre'#231'o'
      FieldName = 'preco'
      Required = True
      DisplayFormat = '###,###,##0.00'
      currency = True
    end
    object qryOSPqtdeentregue: TFloatField
      FieldName = 'qtdeentregue'
      DisplayFormat = '###.##0,000'
    end
    object qryOSPsaldo: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'saldo'
      DisplayFormat = '###.##0,000'
      currency = False
      Calculated = True
    end
    object qryOSPtotal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'total'
      DisplayFormat = '###,###,##0.00'
      Calculated = True
    end
    object qryOSPunidade: TStringField
      FieldName = 'unidade'
      Size = 8
    end
    object qryOSPapelido: TStringField
      FieldName = 'apelido'
    end
    object qryOSPentrega_anterior: TDateField
      Alignment = taCenter
      FieldName = 'entrega_anterior'
      DisplayFormat = '###.##0,000'
      EditMask = '99/99/9999;1; '
    end
    object qryOSPquantidade_anterior: TFloatField
      FieldName = 'quantidade_anterior'
      DisplayFormat = '0.00'
    end
    object qryOSPquantidade_lote: TFloatField
      FieldName = 'quantidade_lote'
      DisplayFormat = '###.##0'
    end
    object qryOSPexcedente_lote: TFloatField
      FieldName = 'excedente_lote'
      DisplayFormat = '###.##0'
    end
    object qryOSPproduzida_lote: TFloatField
      FieldName = 'produzida_lote'
      DisplayFormat = '###.##0'
    end
    object qryOSPpcpiniciado: TBooleanField
      FieldName = 'pcpiniciado'
    end
    object qryOSPStatusCancelamento: TSmallintField
      FieldKind = fkCalculated
      FieldName = 'StatusCancelamento'
      Calculated = True
    end
    object qryOSPcancelado: TBooleanField
      FieldName = 'cancelado'
    end
    object qryOSPsemiacabado: TBooleanField
      FieldName = 'semiacabado'
    end
    object qryOSPtipocliente: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
    object qryOSPsetorproducao: TStringField
      FieldName = 'setorproducao'
      Size = 4
    end
    object qryOSPdescricaosetorproducao: TStringField
      FieldName = 'descricaosetorproducao'
      Size = 50
    end
  end
  object dsrOSP: TtecDataSource
    DataSet = qryOSP
    OnDataChange = dsrOSPDataChange
    Left = 88
    Top = 16
  end
  object qryOSPProximo: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      ';'
      'select coalesce(max(numero),0)+1 as numero'
      'from osp')
    RequestLive = True
    Left = 40
    Top = 72
    object qryOSPProximonumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
  end
  object qryClientesProdutos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterInsert = qryClientesProdutosAfterInsert
    AfterEdit = qryClientesProdutosAfterEdit
    AfterScroll = qryClientesProdutosAfterScroll
    OnNewRecord = qryClientesProdutosNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT cp.Cliente,'
      '       cp.TipoCliente,'
      '       cp.Produto,'
      '       cp.Produto_Cliente,'
      '       cp.Finalidade,'
      '       cp.PN,'
      '       cp.Origem,'
      '       cp.TamLoteProducao,'
      '       cp.ExcedentePermitido,'
      '       CP.tipoexcedente,'
      '       cp.Revisao'
      '       '
      'FROM clientesprodutos cp'
      '     JOIN Produtos p        ON p.Codigo = cp.Produto'
      '     JOIN Caracteristicas c ON c.Codigo = p.Caracteristica'
      ''
      'WHERE cp.Cliente = :Cliente'
      '  AND cp.TipoCliente = :TipoCliente'
      '  AND cp.Produto = :Produto '
      
        '  AND (c.Inativo IS NULL OR (c.Inativo IS NOT NULL AND c.Inativo' +
        ' >= CURRENT_DATE))'
      
        '  AND (p.Inativo IS NULL OR (p.Inativo IS NOT NULL AND p.Inativo' +
        ' >= CURRENT_DATE))'
      '')
    RequestLive = True
    Left = 240
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TipoCliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftLargeint
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qryClientesProdutoscliente: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object qryClientesProdutostipocliente: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
    object qryClientesProdutosproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryClientesProdutosproduto_cliente: TStringField
      FieldName = 'produto_cliente'
      ReadOnly = True
      Size = 30
    end
    object qryClientesProdutosfinalidade: TStringField
      FieldName = 'finalidade'
      Size = 30
    end
    object qryClientesProdutospn: TStringField
      FieldName = 'pn'
      Size = 10
    end
    object qryClientesProdutosorigem: TStringField
      FieldName = 'origem'
      Size = 1
    end
    object qryClientesProdutostamloteproducao: TIntegerField
      FieldName = 'tamloteproducao'
      DisplayFormat = '0'
    end
    object qryClientesProdutosexcedentepermitido: TIntegerField
      FieldName = 'excedentepermitido'
      DisplayFormat = '0'
    end
    object qryClientesProdutosrevisao: TStringField
      FieldName = 'revisao'
      Size = 5
    end
    object qryClientesProdutostipoexcedente: TStringField
      FieldName = 'tipoexcedente'
      Size = 1
    end
  end
  object dsrClientesProdutos: TtecDataSource
    DataSet = qryClientesProdutos
    OnDataChange = dsrClientesProdutosDataChange
    Left = 280
    Top = 144
  end
  object qryOSPUltimoPreco: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      '('
      
        'select cast('#39'OSP '#39'||cast(osp.numero as varchar)||'#39' '#39' as varchar)' +
        ' as origem,'
      '       osp.preco,'
      '       osp.data'
      'from osp'
      'where osp.cliente = :cliente'
      '  and osp.produto = :produto'
      'order by osp.data desc limit 1'
      ')'
      'union all'
      '('
      'select cast('#39'TABELA '#39' as varchar) as origem,'
      '       Valor,'
      '       ColunasPrecos.data'
      'FROM  Colunasprecos, Produtos'
      'WHERE Produtos.Codigo         = :produto'
      '  AND Produtos.Caracteristica = ColunasPrecos.Caracteristica'
      '  AND Produtos.Preco          = ColunasPrecos.Preco'
      '  AND ColunasPrecos.Coluna    = (SELECT PrecoNormal'
      '                                 FROM  Filiais'
      '                                 WHERE Codigo = :filialbase)'
      'order by ColunasPrecos.data desc limit 1'
      ')'
      '')
    RequestLive = False
    Left = 48
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftLargeint
        Name = 'produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filialbase'
        ParamType = ptUnknown
      end>
    object qryOSPUltimoPrecoorigem: TStringField
      FieldName = 'origem'
      Size = 50
    end
    object qryOSPUltimoPrecopreco: TFloatField
      FieldName = 'preco'
      DisplayFormat = '0.00'
    end
    object qryOSPUltimoPrecodata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
  end
  object dsrOSPUltimoPreco: TtecDataSource
    DataSet = qryOSPUltimoPreco
    Left = 80
    Top = 232
  end
  object qryProdutos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select'
      '  codigo,'
      '  descricao,'
      '  caracteristica,'
      '  preco,'
      '  codigovisual'
      'from produtos'
      
        'where (upper(to_ascii(codigovisual,'#39'latin1'#39')) = upper(to_ascii(:' +
        'codigovisual,'#39'latin1'#39')))')
    RequestLive = True
    Left = 400
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigovisual'
        ParamType = ptUnknown
      end>
    object qryProdutoscodigo: TLargeintField
      FieldName = 'codigo'
      Required = True
    end
    object qryProdutosdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 40
    end
    object qryProdutoscaracteristica: TLargeintField
      FieldName = 'caracteristica'
      Required = True
    end
    object qryProdutospreco: TIntegerField
      FieldName = 'preco'
      DisplayFormat = '0'
    end
    object qryProdutoscodigovisual: TStringField
      FieldName = 'codigovisual'
      Required = True
      Size = 30
    end
  end
  object qryProximoNumeroProdutoICE: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select ProximoNumeroProdutoICE(:caracteristicavisual) as numero')
    RequestLive = False
    Left = 240
    Top = 200
    ParamData = <
      item
        DataType = ftString
        Name = 'caracteristicavisual'
        ParamType = ptUnknown
      end>
    object qryProximoNumeroProdutoICEnumero: TLargeintField
      FieldName = 'numero'
    end
  end
  object qryPrecoProximoCodigo: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select precos_proximocodigo(:caracteristica) as numero')
    RequestLive = False
    Left = 248
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'caracteristica'
        ParamType = ptUnknown
      end>
    object qryPrecoProximoCodigonumero: TIntegerField
      FieldName = 'numero'
    end
  end
  object qryPrecos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select precos.codigo,'
      '         precos.caracteristica,'
      '         precos.descricao'
      'from precos'
      'where precos.caracteristica = :caracteristica')
    RequestLive = True
    Left = 400
    Top = 24
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'caracteristica'
        ParamType = ptUnknown
      end>
    object qryPrecoscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryPrecosdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Required = True
      Size = 30
    end
    object qryPrecoscaracteristica: TLargeintField
      DisplayLabel = 'Caracter'#237'stica'
      FieldName = 'caracteristica'
    end
  end
  object dsrPrecos: TtecDataSource
    DataSet = qryPrecos
    Left = 416
    Top = 40
  end
  object qryColunasPrecos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select caracteristica,'
      '       preco,'
      '       coluna,'
      '       data,'
      '       valor'
      'from colunasprecos'
      'where colunasprecos.caracteristica = :caracteristica and'
      '          colunasprecos.preco = :preco')
    RequestLive = True
    Left = 400
    Top = 96
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'caracteristica'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'preco'
        ParamType = ptUnknown
        Value = 0
      end>
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
    object qryColunasPrecosdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object qryColunasPrecosvalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '0.00'
    end
  end
  object dsrColunasPrecos: TtecDataSource
    DataSet = qryColunasPrecos
    Left = 416
    Top = 112
  end
  object qryEstoques: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnNewRecord = qryEstoquesNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select e.produto,'
      '           e.filial,'
      '           e.localizacao,'
      '           e.minimo,'
      '           e.maximo,'
      '           e.emestoque,'
      '           e.reservado,'
      '           e.transito,'
      '           e.demonstracao,'
      '           e.conserto,'
      '           e.futuro,'
      '           e.danificada,'
      '           e.estoquefisico,'
      
        '           (select f.nome from filiais f where f.codigo = e.fili' +
        'al) as descricaofilial'
      'from estoques e'
      'where (e.produto =:produto)  ')
    RequestLive = True
    Left = 496
    Top = 32
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qryEstoquesproduto: TLargeintField
      DisplayLabel = 'Produto'
      FieldName = 'produto'
    end
    object qryEstoquesfilial: TIntegerField
      DisplayLabel = 'Filial'
      FieldName = 'filial'
      Required = True
      DisplayFormat = '00#'
    end
    object qryEstoqueslocalizacao: TStringField
      DisplayLabel = 'Localiza'#231#227'o'
      FieldName = 'localizacao'
      Size = 10
    end
    object qryEstoquesminimo: TFloatField
      DisplayLabel = 'M'#237'nimo'
      FieldName = 'minimo'
    end
    object qryEstoquesmaximo: TFloatField
      DisplayLabel = 'M'#225'ximo'
      FieldName = 'maximo'
    end
    object qryEstoquesdescricaofilial: TStringField
      FieldName = 'descricaofilial'
      Size = 50
    end
    object qryEstoquesemestoque: TFloatField
      FieldName = 'emestoque'
    end
    object qryEstoquesreservado: TFloatField
      FieldName = 'reservado'
    end
    object qryEstoquestransito: TFloatField
      FieldName = 'transito'
    end
    object qryEstoquesdemonstracao: TFloatField
      FieldName = 'demonstracao'
    end
    object qryEstoquesconserto: TFloatField
      FieldName = 'conserto'
    end
    object qryEstoquesfuturo: TFloatField
      FieldName = 'futuro'
    end
    object qryEstoquesdanificada: TFloatField
      FieldName = 'danificada'
    end
    object qryEstoquesestoquefisico: TFloatField
      FieldName = 'estoquefisico'
    end
  end
  object dsrEstoques: TtecDataSource
    DataSet = qryEstoques
    Left = 528
    Top = 48
  end
  object qryConsultaFiliais: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select f.codigo,'
      '           f.nome, f.tipofilial'
      'from filiais f'
      '/*         Prenchido em RunTime   */'
      'order by UPPER(TO_ASCII(f.nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 512
    Top = 112
    object qryConsultaFiliaisnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaFiliaiscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
    object qryConsultaFiliaistipofilial: TStringField
      FieldName = 'tipofilial'
      Visible = False
      Size = 1
    end
  end
  object qrypnproduto: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterInsert = qryClientesProdutosAfterInsert
    AfterEdit = qryClientesProdutosAfterEdit
    OnNewRecord = qryClientesProdutosNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT cp.PN,'
      '       cp.Origem,'
      '       cp.finalidade,'
      '       cp.revisao,'
      '       cp.tamloteproducao,'
      '       cp.tipoexcedente'
      ''
      'FROM ClientesProdutos cp'
      '     JOIN Produtos p        ON p.Codigo = cp.Produto'
      '     JOIN Caracteristicas c ON c.Codigo = p.Caracteristica'
      ''
      'WHERE cp.Produto = :Produto'
      '  AND cp.PN IS NOT NULL'
      
        '  AND (c.Inativo IS NULL OR (c.Inativo IS NOT NULL AND c.Inativo' +
        ' >= CURRENT_DATE))'
      
        '  AND (p.Inativo IS NULL OR (p.inativo IS NOT NULL AND p.Inativo' +
        ' >= CURRENT_DATE))'
      ''
      'LIMIT 1'
      '')
    RequestLive = True
    Left = 392
    Top = 232
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qrypnprodutopn: TStringField
      FieldName = 'pn'
      Size = 10
    end
    object qrypnprodutoorigem: TStringField
      FieldName = 'origem'
      Size = 1
    end
    object qrypnprodutofinalidade: TStringField
      FieldName = 'finalidade'
      Size = 30
    end
    object qrypnprodutorevisao: TStringField
      FieldName = 'revisao'
      Size = 5
    end
    object qrypnprodutotamloteproducao: TIntegerField
      FieldName = 'tamloteproducao'
    end
    object qrypnprodutotipoexcedente: TStringField
      FieldName = 'tipoexcedente'
      Size = 1
    end
  end
  object qrypnFamilia: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterInsert = qryClientesProdutosAfterInsert
    AfterEdit = qryClientesProdutosAfterEdit
    OnNewRecord = qryClientesProdutosNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT cp.pn,'
      '       cp.Origem,'
      '       cp.finalidade,'
      '       cp.revisao,'
      '       cp.tamloteproducao,'
      '       cp.tipoexcedente'
      ''
      'FROM clientesprodutos cp'
      'WHERE cp.produto in (select p.codigo'
      '                     from produtos p'
      '                     where p.caracteristica = :caracteristica)'
      '  and cp.pn is not null'
      '  limit 1')
    RequestLive = True
    Left = 424
    Top = 248
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'caracteristica'
        ParamType = ptUnknown
      end>
    object qrypnFamiliapn: TStringField
      FieldName = 'pn'
      Size = 10
    end
    object qrypnFamiliaorigem: TStringField
      FieldName = 'origem'
      Size = 1
    end
    object qrypnFamiliafinalidade: TStringField
      FieldName = 'finalidade'
      Size = 30
    end
    object qrypnFamiliarevisao: TStringField
      FieldName = 'revisao'
      Size = 5
    end
    object qrypnFamiliatamloteproducao: TIntegerField
      FieldName = 'tamloteproducao'
    end
    object qrypnFamiliatipoexcedente: TStringField
      FieldName = 'tipoexcedente'
      Size = 1
    end
  end
  object qryOSPLotes: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterPost = qryOSPLotesAfterPost
    AfterDelete = qryOSPLotesAfterDelete
    AfterScroll = qryOSPLotesAfterScroll
    OnNewRecord = qryOSPLotesNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select  (select '
      
        '               (select sum(oou.quantidade - coalesce(oou.retraba' +
        'lho,0))'
      '                from operacoesospusuario oou'
      '                where oou.osp = oo.osp'
      '                  and oou.lote = oo.lote'
      '                  and oou.operacao = oo.operacao )   +'
      ''
      '                (case when btrim(oo.tipooperacao) = '#39'A'#39' then'
      ''
      
        '                  (select sum(oou2.quantidade - coalesce(oou2.re' +
        'trabalho,0))'
      '                   from operacoesosp oo2'
      '                        join operacoesospusuario oou2'
      '                        on oo2.operacao = oou2.operacao'
      '                        and oo2.osp = oou2.osp'
      '                        and oo2.lote = oou2.lote'
      '                    where oo2.osp = oo.osp'
      '                      and oo2.lote = oo.lote'
      '                      and oou2.operacao <> oo.operacao'
      
        '                      and position(btrim(substring(oo.sequencia,' +
        '1, position('#39'.'#39' in oo.sequencia))) in'
      
        '                          btrim(case when position('#39'.'#39' in oo2.se' +
        'quencia)<> 0 then oo2.sequencia else cast(oo2.sequencia||cast('#39'.' +
        #39' as varchar) as varchar) end))<>0'
      ''
      '                       )'
      '                 else 0'
      '                 end)  as produzida'
      '        from operacoesosp oo'
      '        where oo.osp = ospl.osp'
      '          and oo.lote = ospl.numero'
      '        order by cast(oo.sequencia as numeric) desc limit 1'
      '        ) as produzida,'
      ''
      '        ospl.*,'
      ''
      '       false as Imprimir'
      'from osplotes ospl'
      'where ospl.osp = :osp'
      'order by ospl.numero')
    RequestLive = True
    Left = 160
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'osp'
        ParamType = ptUnknown
      end>
    object qryOSPLotesosp: TIntegerField
      FieldName = 'osp'
      DisplayFormat = '0'
    end
    object qryOSPLotesnumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryOSPLotesquantidade: TFloatField
      FieldName = 'quantidade'
      DisplayFormat = '###,###'
      EditFormat = '###,###'
    end
    object qryOSPLotesexcedente: TFloatField
      FieldName = 'excedente'
      DisplayFormat = '###,###'
      EditFormat = '###,###'
    end
    object qryOSPLotesproduzida: TFloatField
      FieldName = 'produzida'
      DisplayFormat = '###,###'
      EditFormat = '###,###'
    end
    object qryOSPLotesjaimpresso: TBooleanField
      FieldName = 'jaimpresso'
      Required = True
    end
    object qryOSPLotesimprimir: TBooleanField
      FieldName = 'imprimir'
    end
  end
  object dsrOSPLotes: TtecDataSource
    DataSet = qryOSPLotes
    Left = 192
    Top = 40
  end
  object qrySetoresProducao: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select sp.*'
      'from setoresproducao sp'
      'where sp.codigo = :codigo')
    RequestLive = True
    Left = 72
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qrySetoresProducaocodigo: TStringField
      FieldName = 'codigo'
      Size = 4
    end
    object qrySetoresProducaodescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
    object qrySetoresProducaonumeropedidoosp: TIntegerField
      FieldName = 'numeropedidoosp'
    end
  end
  object qryUltimaOSPProduto: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select max(data) as data'
      'from osp'
      'where produto = :produto')
    RequestLive = False
    Left = 544
    Top = 224
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qryUltimaOSPProdutodata: TDateField
      FieldName = 'data'
    end
  end
  object qryAndamentoProducao: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryAndamentoProducaoAfterOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'Lotes'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'SELECT * FROM crosstab'
      '('
      #39
      ''
      
        'select sequencia, nome, c01, c02, c03, lote, sum(quantidade) as ' +
        'quantidade from'
      '('
      '('
      
        'select cast(oo.sequencia as numeric) as sequencia, o.nome, o.c01' +
        ', o.c02, o.c03, cast(oo.lote as varchar) as lote, sum(oou.quanti' +
        'dade) as quantidade'
      'from operacoesosp oo'
      '     left join operacoesospusuario oou'
      '     on oo.osp = oou.osp'
      '     and oo.lote = oou.lote'
      '     and oo.operacao = oou.operacao'
      ''
      '     join operacoes o'
      '     on oo.operacao = o.codigo'
      ''
      'where oo.osp ='
      ''
      '  /*osp1*/'
      ''
      
        'group by cast(oo.sequencia as numeric), o.nome, o.c01, o.c02, o.' +
        'c03, oo.lote'
      
        'order by cast(oo.sequencia as numeric), o.nome, o.c01, o.c02, o.' +
        'c03, oo.lote'
      ')'
      'union all'
      '('
      
        'select cast(oo.sequencia as numeric) as sequencia, o.nome, o.c01' +
        ', o.c02, o.c03, cast('#39#39'TOTAL'#39#39' as varchar) as lote, sum(oou.quan' +
        'tidade) as quantidade'
      'from operacoesosp oo'
      '     left join operacoesospusuario oou'
      '     on oo.osp = oou.osp'
      '     and oo.lote = oou.lote'
      '     and oo.operacao = oou.operacao'
      ''
      '     join operacoes o'
      '     on oo.operacao = o.codigo'
      ''
      'where oo.osp ='
      ''
      '  /*osp2*/'
      ''
      
        'group by cast(oo.sequencia as numeric), o.nome, o.c01, o.c02, o.' +
        'c03'
      
        'order by cast(oo.sequencia as numeric), o.nome, o.c01, o.c02, o.' +
        'c03'
      ')'
      ') as sel'
      'group by sequencia, nome, c01, c02, c03, lote'
      'order by sequencia, nome, c01, c02, c03, lote'
      ''
      ''
      #39','
      ''
      #39
      'select lotes.* from'
      '('
      '('
      ''
      'select cast(numero as varchar) as lote'
      'from osplotes'
      'where osp ='
      ''
      '  /*osp3*/'
      ''
      ''
      'order by numero'
      ')'
      'union all'
      '('
      'select cast('#39#39'TOTAL'#39#39' as varchar) as lote'
      ')'
      ') as lotes'
      #39
      ''
      ')'
      ''
      ''
      'AS'
      ' ( Sequencia numeric,'
      '   Operacao varchar(10),'
      '   C1 char(2),'
      '   C2 char(2),'
      '   C3 char(2),'
      ''
      
        '   %Lotes  /* Lote_1 integer,    Lote_2 integer,    Lote_3 integ' +
        'er,   Lote_4 integer,    Lote_5 integer, */'
      ''
      '   TOTAL integer'
      ''
      ''
      ')'
      'order by sequencia'
      '')
    RequestLive = False
    Left = 240
    Top = 376
  end
  object dsrAndamentoProducao: TtecDataSource
    DataSet = qryAndamentoProducao
    Left = 272
    Top = 392
  end
end
