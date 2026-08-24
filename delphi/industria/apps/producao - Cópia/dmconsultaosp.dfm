inherited dtmConsultaOsp: TdtmConsultaOsp
  OldCreateOrder = False
  Left = 595
  Height = 306
  Width = 493
  object qryOsp: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryOspAfterOpen
    AfterScroll = qryOspAfterScroll
    OnCalcFields = qryOspCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'Numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SemanaEntrada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SemanaEntrega'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cliente'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select osp.numero,'
      '       osp.entrega,'
      
        '       CAST(TRIM(TO_CHAR(OSP.Semana, '#39'00'#39')) AS VARCHAR) as Seman' +
        'a,'
      '       (select extract(week from osp.data)) as semanafabr,'
      
        '       cast(substring(to_char(osp.data,'#39'yyyy'#39'),3,2)as varchar) a' +
        's anofabr,'
      '       cast(osp.ano as varchar) as ano,'
      '       osp.prioridade,'
      '       osp.observacoes,'
      '       cp.Carimbo as dadosmarcacao,'
      '       osp.produto,'
      '       osp.data,'
      '       osp.cliente,'
      '       cl.nome as nomecliente,'
      '       osp.pedidocliente,'
      '       osp.quantidade,'
      '       cast(null as numeric(9,3)) as quantidade_anterior,'
      '       osp.preco,'
      '       p.codigovisual as produtovisual,'
      '       p.caracteristica,'
      '       c.codigovisual as caracteristicavisual,'
      '       cast(cp.pn||'#39'.'#39'||cp.origem as varchar) as partnumber,'
      '       cp.produto_cliente,'
      '      (select sum(pdf.quantidade)'
      
        '       from DadosFiscais df join produtosdadosfiscais pdf on df.' +
        'numero = pdf.dadofiscal'
      '       where df.situacao='#39'N'#39
      '         and pdf.osp = osp.numero) as qtdeentregue,'
      '       cp.fluxograma,'
      '       cp.tamloteproducao as loteproducao,'
      '       c.unidade,'
      '       cl.apelido,'
      '       ospl.Jaimpresso,'
      '       False as Imprimir,'
      '       ospl.numero as numerolote'
      'from (osplotes ospl'
      '     join (((osp'
      '             join (produtos p'
      '                   join caracteristicas c'
      '                   on p.caracteristica = c.codigo)'
      ''
      '             on osp.produto = p.codigo)'
      ''
      '             join clientes cl'
      '             on osp.cliente = cl.codigo)'
      ''
      '             join clientesprodutos cp'
      '             on osp.cliente = cp.cliente and '
      #9#9'        osp.produto = cp.produto)'
      ''
      '     on ospl.osp = osp.numero)'
      '      '
      'where true'
      ''
      '%Numero'
      '%SemanaEntrada'
      '%SemanaEntrega'
      '%Cliente'
      ''
      'ORDER BY OSP.Numero, NumeroLote')
    RequestLive = True
    Left = 48
    Top = 16
    object qryOspnumero: TIntegerField
      FieldName = 'numero'
      Required = True
      DisplayFormat = '###,##0'
    end
    object qryOspentrega: TDateField
      Alignment = taCenter
      FieldName = 'entrega'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryOspsemana: TStringField
      FieldName = 'semana'
      Size = 2
    end
    object qryOspsemanafabr: TFloatField
      FieldName = 'semanafabr'
      DisplayFormat = '0.00'
    end
    object qryOspanofabr: TStringField
      FieldName = 'anofabr'
      Size = 50
    end
    object qryOspano: TStringField
      FieldName = 'ano'
      Size = 50
    end
    object qryOspprioridade: TIntegerField
      FieldName = 'prioridade'
      Required = True
      DisplayFormat = '0'
    end
    object qryOspobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 300
    end
    object qryOspdadosmarcacao: TStringField
      FieldName = 'dadosmarcacao'
      Size = 300
    end
    object qryOspproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryOspdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object qryOspcliente: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object qryOspnomecliente: TStringField
      FieldName = 'nomecliente'
      Required = True
      Size = 40
    end
    object qryOsppedidocliente: TStringField
      FieldName = 'pedidocliente'
      Size = 15
    end
    object qryOspquantidade: TFloatField
      FieldName = 'quantidade'
      DisplayFormat = '###,##0.000'
    end
    object qryOspquantidade_anterior: TFloatField
      FieldName = 'quantidade_anterior'
      DisplayFormat = '###,##0.000'
    end
    object qryOsppreco: TFloatField
      FieldName = 'preco'
      DisplayFormat = '0.00'
    end
    object qryOspprodutovisual: TStringField
      FieldName = 'produtovisual'
      Size = 30
    end
    object qryOspcaracteristica: TLargeintField
      FieldName = 'caracteristica'
    end
    object qryOspcaracteristicavisual: TStringField
      FieldName = 'caracteristicavisual'
      Size = 30
    end
    object qryOsppartnumber: TStringField
      FieldName = 'partnumber'
      Size = 50
    end
    object qryOspproduto_cliente: TStringField
      FieldName = 'produto_cliente'
      Size = 30
    end
    object qryOspfluxograma: TIntegerField
      FieldName = 'fluxograma'
      DisplayFormat = '0'
    end
    object qryOsploteproducao: TIntegerField
      FieldName = 'loteproducao'
      DisplayFormat = '0'
    end
    object qryOspunidade: TStringField
      FieldName = 'unidade'
      Size = 8
    end
    object qryOspapelido: TStringField
      FieldName = 'apelido'
    end
    object qryOspqtdeentregue: TFloatField
      FieldName = 'qtdeentregue'
      DisplayFormat = '###,##0.000'
    end
    object qryOspsaldo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'saldo'
      DisplayFormat = '###,##0.000'
      Calculated = True
    end
    object qryOsptotal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'total'
      DisplayFormat = '###,###,##0.00'
      Calculated = True
    end
    object qryOspjaimpresso: TBooleanField
      FieldName = 'jaimpresso'
    end
    object qryOspimprimir: TBooleanField
      FieldName = 'imprimir'
    end
    object qryOspnumerolote: TIntegerField
      FieldName = 'numerolote'
      DisplayFormat = '0'
    end
  end
  object dsrOsp: TtecDataSource
    DataSet = qryOsp
    Left = 48
    Top = 64
  end
  object qryProdutosCompostos: TtecQuery
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
      'SELECT pc.Ordem,'
      '       pc.quantidade,'
      ''
      '       CAST(CASE WHEN c.Unidade = '#39'MIL'#39' THEN '#39'PC'#39
      '                 WHEN c.Unidade = '#39'CT'#39'  THEN '#39'PC'#39
      '                                   ELSE c.Unidade'
      '            END AS VARCHAR) AS Unidade,'
      ''
      '      (SELECT CodigoVisual FROM Produtos'
      '          WHERE Codigo = pc.Componente) AS CodigoVisual,'
      '        p.descricao'
      ''
      'FROM produtoscompostos pc'
      '     JOIN produtos p        ON p.Codigo = pc.Componente'
      '     JOIN caracteristicas c ON c.Codigo = p.Caracteristica'
      ''
      'WHERE pc.Composto = :Composto'
      ''
      'ORDER BY pc.Ordem')
    RequestLive = False
    Left = 168
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'composto'
        ParamType = ptUnknown
      end>
    object qryProdutosCompostosunidade: TStringField
      FieldName = 'unidade'
      Size = 50
    end
    object qryProdutosCompostosquantidade: TFloatField
      FieldName = 'quantidade'
      DisplayFormat = '0.00'
    end
    object qryProdutosCompostoscodigovisual: TStringField
      FieldName = 'codigovisual'
      Size = 50
    end
    object qryProdutosCompostosdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 50
    end
  end
  object dsrProdutosCompostos: TtecDataSource
    DataSet = qryProdutosCompostos
    Left = 168
    Top = 64
  end
  object qryClientesProdutos: TtecQuery
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
      'SELECT cp.cliente,'
      '       cp.tipocliente,'
      '       cp.produto,'
      '       cp.produto_cliente,'
      '       cp.finalidade,'
      '       cp.pn,'
      '       origem'
      'FROM clientesprodutos cp'
      'WHERE cp.cliente = :cliente'
      '       and cp.tipocliente = '#39'C'#39
      '       and cp.produto = :produto')
    RequestLive = False
    Left = 48
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
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
  end
  object dsrClientesProdutos: TtecDataSource
    DataSet = qryClientesProdutos
    Left = 48
    Top = 200
  end
  object qryFluxogramasOperacoes: TtecQuery
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
      'SELECT fo.Sequencia,'
      '       o.Nome, o.C01, o.C02, o.C03, o.Descricao,'
      '       fo.TipoOperacao,'
      '       TempoPadrao(o.Codigo, CURRENT_DATE) AS TempoPadrao,'
      ''
      '       CAST(CASE WHEN o.SetUp = '#39't'#39' THEN '#39'S'#39
      '                                    ELSE '#39'N'#39
      '            END AS VARCHAR) AS SetUp,'
      ''
      '       CAST(CASE WHEN o.PlanoControle = '#39't'#39' THEN '#39'S'#39
      '                                            ELSE '#39'N'#39
      '            END AS VARCHAR) AS PlanoControle'
      ''
      'FROM fluxogramasoperacoes fo '
      '     JOIN operacoes o ON fo.Operacao = o.Codigo'
      ''
      'WHERE fo.Fluxograma = :Ffluxograma'
      ''
      'ORDER BY CAST(fo.Sequencia AS NUMERIC);'
      '')
    RequestLive = False
    Left = 168
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Ffluxograma'
        ParamType = ptUnknown
      end>
    object qryFluxogramasOperacoessequencia: TStringField
      FieldName = 'sequencia'
      Required = True
      Size = 6
    end
    object qryFluxogramasOperacoesnome: TStringField
      FieldName = 'nome'
      Size = 10
    end
    object qryFluxogramasOperacoesc01: TStringField
      FieldName = 'c01'
      Size = 2
    end
    object qryFluxogramasOperacoesc02: TStringField
      FieldName = 'c02'
      Size = 2
    end
    object qryFluxogramasOperacoesc03: TStringField
      FieldName = 'c03'
      Size = 2
    end
    object qryFluxogramasOperacoesdescricao: TStringField
      FieldName = 'descricao'
      Size = 60
    end
    object qryFluxogramasOperacoestipooperacao: TStringField
      FieldName = 'tipooperacao'
      Required = True
      Size = 1
    end
    object qryFluxogramasOperacoestempopadrao: TFloatField
      FieldName = 'tempopadrao'
      DisplayFormat = '0.00'
    end
    object qryFluxogramasOperacoessetup: TStringField
      FieldName = 'setup'
      Size = 50
    end
    object qryFluxogramasOperacoesplanocontrole: TStringField
      FieldName = 'planocontrole'
      Size = 50
    end
  end
  object dsrFluxogramasOperacoes: TtecDataSource
    DataSet = qryFluxogramasOperacoes
    Left = 168
    Top = 200
  end
  object qryUpdateOSPLotes: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'ListaOSPLote'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'update osplotes set jaimpresso = true'
      'where (osp,numero) in (%ListaOSPLote)')
    RequestLive = True
    Left = 336
    Top = 136
  end
end
