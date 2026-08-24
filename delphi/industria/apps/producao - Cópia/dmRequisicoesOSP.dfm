inherited dtmRequisicoesOSP: TdtmRequisicoesOSP
  OldCreateOrder = False
  Left = 908
  Top = 190
  Height = 401
  Width = 633
  object qryOSPLotes: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeOpen = qryOSPLotesBeforeOpen
    AfterScroll = qryOSPLotesAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'Ordenacao'
        ParamType = ptUnknown
        Value = 'ORDER BY osplotes.osp, osplotes.numero DESC LIMIT 1'
      end>
    Sql.Strings = (
      'select osplotes.osp,'
      '       osplotes.numero,'
      '       osplotes.quantidade as quantidadelote,'
      '       osplotes.excedente as excedentelote,'
      '       osplotes.produzida as produzidalote,'
      '       osp.entrega,'
      '       cast(null as date) as entrega_anterior,'
      '       osp.semana,'
      '       osp.ano,'
      '       osp.prioridade,'
      '       osp.observacoes,'
      '       osp.produto,'
      '       osp.data,'
      '       osp.cliente,'
      '       osp.tipocliente,'
      '       osp.pedidocliente,'
      '       osp.quantidade as quantidadeosp,'
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
      '       false as alterada'
      '       '
      'from osplotes '
      '     join (osp join (produtos p join caracteristicas c '
      '                     on p.caracteristica = c.codigo)'
      '               on osp.produto = p.codigo'
      '     '
      '               join clientes cl'
      '               on osp.cliente = cl.codigo)'
      '     on osplotes.osp = osp.numero               '
      ''
      'WHERE  osplotes.osp is not null'
      ''
      '   AND  (:Campo          = 0    AND'
      '         :Operacao       = 0    AND'
      #9'      osplotes.osp    = :osp AND'
      '         osplotes.numero = :numero)'
      ''
      '/* codigo */'
      '   OR ((:Campo =1) AND'
      '   '
      '       /* PRIMEIRO */'
      
        '        (     ((:Operacao = 1) AND ((osplotes.osp < :osp) or (:o' +
        'sp = 0) ))'
      ''
      '       /* ANTERIOR */'
      
        '           OR ((:Operacao = 2) AND (osplotes.osp = (case when :o' +
        'sp <> 0 then (SELECT MAX(osplotes.osp)'
      
        '                                                                ' +
        '              FROM osplotes '
      
        '                                                                ' +
        '              WHERE osplotes.osp < :osp)'
      
        '                                                                ' +
        '        else (select min(osplotes.osp)'
      
        '                                                                ' +
        '              from osplotes) end)))'
      '       /* PR'#211'XIMO */'
      
        '           OR ((:Operacao = 3) AND (osplotes.osp = (SELECT osplo' +
        'tes.osp'
      
        '                                                    FROM osplote' +
        's'
      
        '                                                    WHERE  osplo' +
        'tes.osp > :osp'
      
        '   '#9#9#9#9'                                     order by osplotes.os' +
        'p, osplotes.numero limit 1)))'
      '       /* '#218'LTIMO */'
      '           OR ((:Operacao = 4) AND (osplotes.osp > :osp))'
      '         )'
      '      )'
      ''
      '   OR ((:Campo =2) AND'
      '   '
      '       /* PRIMEIRO */'
      
        '        (     ((:Operacao = 1) AND ((osplotes.osp = :osp and osp' +
        'lotes.numero < :numero) or (:numero = 0) ))'
      '              '
      '       /* ANTERIOR */'
      
        '           OR ((:Operacao = 2) AND (osplotes.osp = :osp and ospl' +
        'otes.numero = (case when :numero <> 0 then (SELECT MAX(osplotes.' +
        'numero)'
      
        '                                                                ' +
        '                                            FROM osplotes '
      
        '                                                                ' +
        '                                            WHERE osplotes.osp =' +
        ' :osp'
      
        '                                                                ' +
        '                                              and osplotes.numer' +
        'o < :numero)'
      
        '                                                                ' +
        '                                      else (select min(osplotes.' +
        'numero)'
      
        '                                                                ' +
        '                                            from osplotes'
      
        '                                                                ' +
        '                                            where osplotes.osp =' +
        ' :osp) end)))'
      '       /* PR'#211'XIMO */'
      
        '           OR ((:Operacao = 3) AND (osplotes.osp = :osp and ospl' +
        'otes.numero = (SELECT osplotes.numero'
      
        '                                                                ' +
        '               FROM osplotes'
      
        '                                                                ' +
        '               WHERE osplotes.osp = :osp'
      
        '                                                                ' +
        '                 and osplotes.numero > :numero'
      
        '   '#9#9#9#9'                                                         ' +
        '       order by osplotes.numero limit 1)))'
      '       /* '#218'LTIMO */'
      
        '           OR ((:Operacao = 4) AND (osplotes.osp = :osp and ospl' +
        'otes.numero > :numero))'
      '         )'
      '      )'
      ''
      '%Ordenacao')
    RequestLive = True
    Left = 48
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Campo'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'Operacao'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'osp'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryOSPLotesosp: TIntegerField
      FieldName = 'osp'
      Required = True
      DisplayFormat = '0'
    end
    object qryOSPLotesnumero: TIntegerField
      FieldName = 'numero'
      Required = True
      DisplayFormat = '0'
    end
    object qryOSPLotesquantidadelote: TFloatField
      FieldName = 'quantidadelote'
      DisplayFormat = '0.00'
    end
    object qryOSPLotesexcedentelote: TFloatField
      FieldName = 'excedentelote'
      DisplayFormat = '0.00'
    end
    object qryOSPLotesproduzidalote: TFloatField
      FieldName = 'produzidalote'
      DisplayFormat = '0.00'
    end
    object qryOSPLotesentrega: TDateField
      Alignment = taCenter
      FieldName = 'entrega'
      EditMask = '99/99/9999;1; '
    end
    object qryOSPLotesentrega_anterior: TDateField
      Alignment = taCenter
      FieldName = 'entrega_anterior'
      EditMask = '99/99/9999;1; '
    end
    object qryOSPLotessemana: TIntegerField
      FieldName = 'semana'
      DisplayFormat = '0'
    end
    object qryOSPLotesano: TIntegerField
      FieldName = 'ano'
      DisplayFormat = '0'
    end
    object qryOSPLotesprioridade: TIntegerField
      FieldName = 'prioridade'
      DisplayFormat = '0'
    end
    object qryOSPLotesobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 300
    end
    object qryOSPLotesproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryOSPLotesdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object qryOSPLotescliente: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object qryOSPLotespedidocliente: TStringField
      FieldName = 'pedidocliente'
      Size = 15
    end
    object qryOSPLotesquantidadeosp: TFloatField
      FieldName = 'quantidadeosp'
      DisplayFormat = '0.00'
    end
    object qryOSPLotesquantidade_anterior: TFloatField
      FieldName = 'quantidade_anterior'
      DisplayFormat = '0.00'
    end
    object qryOSPLotespreco: TFloatField
      FieldName = 'preco'
      DisplayFormat = '0.00'
    end
    object qryOSPLotesprodutovisual: TStringField
      FieldName = 'produtovisual'
      Size = 30
    end
    object qryOSPLotescaracteristica: TLargeintField
      FieldName = 'caracteristica'
    end
    object qryOSPLotescaracteristicavisual: TStringField
      FieldName = 'caracteristicavisual'
      Size = 30
    end
    object qryOSPLotesqtdeentregue: TFloatField
      FieldName = 'qtdeentregue'
      DisplayFormat = '0.00'
    end
    object qryOSPLotescomplementoproduto: TStringField
      FieldName = 'complementoproduto'
      Size = 30
    end
    object qryOSPLotesunidade: TStringField
      FieldName = 'unidade'
      Size = 8
    end
    object qryOSPLotesapelido: TStringField
      FieldName = 'apelido'
    end
    object qryOSPLotesalterada: TBooleanField
      FieldName = 'alterada'
    end
    object qryOSPLotesTotal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Total'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryOSPLotesSaldo: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Saldo'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryOSPLotestipocliente: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
  end
  object dsrOSPLotes: TtecDataSource
    DataSet = qryOSPLotes
    Left = 104
    Top = 24
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
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT cp.cliente,'
      '       cp.tipocliente,'
      '       cp.produto,'
      '       cp.produto_cliente,'
      '       cp.finalidade,'
      '       cp.pn,'
      '       cp.origem,'
      '       cp.TamLoteProducao,'
      '       cp.excedentePermitido'
      ''
      'FROM clientesprodutos cp'
      'WHERE cp.cliente = :cliente'
      '       and cp.tipocliente = :tipocliente'
      '       and cp.produto = :produto')
    RequestLive = True
    Left = 248
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipocliente'
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
    object qryClientesProdutostamloteproducao: TIntegerField
      FieldName = 'tamloteproducao'
    end
    object qryClientesProdutosexcedentepermitido: TIntegerField
      FieldName = 'excedentepermitido'
    end
  end
  object dsrClientesProdutos: TtecDataSource
    DataSet = qryClientesProdutos
    Left = 288
    Top = 72
  end
  object qryRequisicoesOSP: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeOpen = qryRequisicoesOSPBeforeOpen
    AfterInsert = qryRequisicoesOSPAfterInsert
    AfterPost = qryRequisicoesOSPAfterPost
    AfterDelete = qryRequisicoesOSPAfterDelete
    AfterScroll = qryRequisicoesOSPAfterScroll
    OnCalcFields = qryRequisicoesOSPCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT rosp.*,'
      
        '      (SELECT p.Descricao    FROM Produtos p WHERE p.Codigo = ro' +
        'sp.Produto) AS Descricao,'
      
        '      (SELECT p.CodigoVisual FROM Produtos p WHERE p.Codigo = ro' +
        'sp.Produto) AS CodigoVisual,'
      ''
      '      CAST(CASE WHEN rosp.Tipo = '#39'O'#39' THEN '#39'KG'#39' /* fi[O]  */'
      '                WHEN rosp.Tipo = '#39'F'#39' THEN '#39'KG'#39' /* [F]ita */'
      '                ELSE (SELECT c.Unidade FROM Caracteristicas c'
      
        '                         WHERE c.Codigo = (SELECT p.Caracteristi' +
        'ca FROM Produtos p'
      
        '                                              WHERE p.Codigo = r' +
        'osp.Produto))'
      '            END AS VARCHAR(8)) AS Unidade,'
      ''
      '      (SELECT pcfi.Resistividade'
      '          FROM ProdutosCompostosFios pcfi'
      
        '        WHERE pcfi.Composto   = (SELECT osp.Produto FROM OSP WHE' +
        'RE osp.Numero = :OSP)'
      '          AND pcfi.Componente = rosp.Componente'
      '          AND pcfi.Ordem      = rosp.Numero) AS Resistividade,'
      ''
      '      (SELECT pcfi.tolerancia'
      '          FROM ProdutosCompostosFios pcfi'
      
        '        WHERE pcfi.Composto   = (SELECT osp.Produto FROM OSP WHE' +
        'RE osp.Numero = :OSP)'
      '          AND pcfi.Componente = rosp.Componente'
      '          AND pcfi.Ordem      = rosp.Numero) AS Tolerancia,'
      ''
      '      (SELECT pcfi.liga'
      '          FROM ProdutosCompostosFios pcfi'
      
        '        WHERE pcfi.Composto   = (SELECT osp.Produto FROM OSP WHE' +
        'RE osp.Numero = :OSP)'
      '          AND pcfi.Componente = rosp.Componente'
      '          AND pcfi.Ordem      = rosp.Numero) AS Liga,'
      ''
      
        '      (SELECT SUM(CASE WHEN m.TipoMovimento = '#39'PK-'#39' THEN  ABS(CO' +
        'ALESCE(m.Quantidade,0))'
      
        '                       WHEN m.TipoMovimento = '#39'PK+'#39' THEN -ABS(CO' +
        'ALESCE(m.Quantidade,0))'
      '                                                    ELSE 0'
      '                  END)'
      '          FROM Movimentos m'
      '          WHERE m.OSP            = rosp.OSP     AND'
      '                m.Lote           = rosp.Lote    AND'
      '                m.Produto        = rosp.Produto AND'
      '                m.NumeroControle = rosp.Numero  AND'
      
        '                m.TipoControle   = rosp.Tipo) AS QuantidadeLiber' +
        'ada,'
      ''
      '       CAST(NULL AS NUMERIC(12,8)) AS QuantidadeES,'
      ''
      '      (SELECT e.EmEstoque'
      '          FROM Estoques e'
      '          WHERE e.Produto = rosp.Produto AND'
      '                e.Filial  = :FilialBase) AS EmEstoque'
      ''
      'FROM requisicoesosp rosp'
      'WHERE rosp.OSP  = :OSP AND'
      '      rosp.Lote = :Lote'
      ''
      'ORDER BY CAST(rosp.Sequencia AS NUMERIC)'
      '')
    RequestLive = True
    Left = 48
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'osp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filialbase'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'lote'
        ParamType = ptUnknown
      end>
    object qryRequisicoesOSPosp: TIntegerField
      FieldName = 'osp'
      DisplayFormat = '0'
    end
    object qryRequisicoesOSPlote: TIntegerField
      FieldName = 'lote'
      DisplayFormat = '0'
    end
    object qryRequisicoesOSPtipo: TStringField
      FieldName = 'tipo'
      Size = 1
    end
    object qryRequisicoesOSPproduto: TLargeintField
      DisplayLabel = 'PRODUTO'
      FieldName = 'produto'
    end
    object qryRequisicoesOSPcomponente: TStringField
      FieldName = 'componente'
    end
    object qryRequisicoesOSPnumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryRequisicoesOSPdescricao: TStringField
      DisplayLabel = 'DESCRI'#199#195'O'
      FieldName = 'descricao'
      Size = 50
    end
    object qryRequisicoesOSPquantidade: TFloatField
      DisplayLabel = 'QUANTIDADE'
      FieldName = 'quantidade'
      DisplayFormat = '##,###,##0.000'
    end
    object qryRequisicoesOSPquantidade_c: TFloatField
      FieldKind = fkCalculated
      FieldName = 'quantidade_c'
      DisplayFormat = '##,###,##0.000'
      Calculated = True
    end
    object qryRequisicoesOSPOrigem: TStringField
      DisplayLabel = 'ORIGEM'
      FieldKind = fkCalculated
      FieldName = 'Origem'
      Size = 50
      Calculated = True
    end
    object qryRequisicoesOSPquantidadeliberada: TFloatField
      FieldName = 'quantidadeliberada'
      DisplayFormat = '##,###,##0.000'
    end
    object qryRequisicoesOSPsaldo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'saldo'
      DisplayFormat = '##,###,##0.000'
      Calculated = True
    end
    object qryRequisicoesOSPquantidadees: TFloatField
      FieldName = 'quantidadees'
      DisplayFormat = '##,###,##0.000'
    end
    object qryRequisicoesOSPemestoque: TFloatField
      FieldName = 'emestoque'
      DisplayFormat = '0.00'
    end
    object qryRequisicoesOSPcodigovisual: TStringField
      FieldName = 'codigovisual'
      Size = 50
    end
    object qryRequisicoesOSPobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 512
    end
    object qryRequisicoesOSPcomponente_c: TStringField
      FieldKind = fkCalculated
      FieldName = 'componente_c'
      Calculated = True
    end
    object qryRequisicoesOSPresistividade: TFloatField
      FieldName = 'resistividade'
      DisplayFormat = '0.00'
    end
    object qryRequisicoesOSPsequencia: TStringField
      FieldName = 'sequencia'
      Size = 6
    end
    object qryRequisicoesOSPcomponenteorigem: TStringField
      FieldName = 'componenteorigem'
    end
    object qryRequisicoesOSPnumeroorigem: TIntegerField
      FieldName = 'numeroorigem'
      DisplayFormat = '0'
    end
    object qryRequisicoesOSPTipoOrigem: TStringField
      FieldName = 'TipoOrigem'
      Size = 1
    end
    object qryRequisicoesOSPOC: TStringField
      FieldName = 'OC'
      Size = 50
    end
    object qryRequisicoesOSPOS: TStringField
      FieldName = 'OS'
      Size = 50
    end
    object qryRequisicoesOSPNF: TStringField
      FieldName = 'NF'
      Size = 50
    end
    object qryRequisicoesOSPchargecode: TStringField
      FieldName = 'chargecode'
      Size = 50
    end
    object qryRequisicoesOSPUnidade: TStringField
      FieldName = 'unidade'
      Size = 8
    end
    object qryRequisicoesOSPtolerancia: TIntegerField
      FieldName = 'tolerancia'
    end
    object qryRequisicoesOSPliga: TStringField
      FieldName = 'liga'
      Size = 50
    end
  end
  object dsrRequisicoesOSP: TtecDataSource
    DataSet = qryRequisicoesOSP
    OnDataChange = dsrRequisicoesOSPDataChange
    Left = 96
    Top = 176
  end
  object qryOSPLotesProdutos: TtecQuery
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
      ';'
      'SELECT Selecao.*'
      'FROM'
      ''
      '('
      ' SELECT pc.Componente AS Produto,'
      '        p.CodigoVisual,'
      '        p.Descricao,'
      '       (SELECT c.Unidade FROM Caracteristicas c'
      '           WHERE c.Codigo = p.Caracteristica) AS Unidade,'
      ''
      '        CAST(pc.Quantidade AS NUMERIC(12,8)) AS Quantidade,'
      '        CAST('#39'P'#39'  AS CHAR(1)) AS Tipo,'
      '        CAST(NULL AS INTEGER) AS Ordem,'
      '        CAST(NULL AS NUMERIC(12,3)) AS Resistividade,'
      '        cast(null as integer) as tolerancia,'
      '        cast(null as char(3)) as liga'
      '        '
      ''
      ' FROM ProdutosCompostos pc'
      '     JOIN Produtos p'
      '     ON pc.Componente = p.Codigo'
      ' WHERE pc.imprimirosp'
      '   and pc.Composto = :Produto /*1361500*/'
      ''
      ''
      ''
      ' UNION ALL'
      ''
      ' SELECT CAST(NULL AS BIGINT) AS Produto,'
      '        pcf.Componente AS CodigoVisual,'
      '       CAST(NULL AS VARCHAR(50)) AS Descricao,'
      '       CAST('#39'KG'#39' AS VARCHAR(8)) AS Unidade,'
      '       pcf.GramasPorPeca AS Quantidade,'
      '       CAST('#39'O'#39' AS CHAR(1)) AS Tipo,'
      '       pcf.Ordem,'
      '       pcf.Resistividade,'
      '       pcf.tolerancia,'
      '       pcf.liga'
      ''
      ' FROM ProdutosCompostosFios pcf'
      ' WHERE pcf.Composto = :Produto'
      ''
      ''
      ''
      ' UNION ALL'
      ''
      ' SELECT CAST(NULL AS BIGINT) AS Produto,'
      '        pcf.Componente AS CodigoVisual,'
      '        CAST(NULL AS VARCHAR(50)) AS Descricao,'
      '        CAST('#39'KG'#39' AS VARCHAR(8)) AS Unidade,'
      '        pcf.GramasPorPeca AS Quantidade,'
      '        CAST('#39'T'#39' AS CHAR(1)) AS Tipo,'
      '        pcf.Ordem,'
      '        CAST(NULL AS NUMERIC(12,3)) AS Resistividade,'
      '        cast(null as integer) as tolerancia,'
      '        cast(null as char(3)) as liga'
      ''
      ''
      ' FROM ProdutosCompostosFitas pcf'
      ' WHERE pcf.Composto = :Produto'
      ''
      ') AS Selecao'
      'ORDER BY Tipo, Produto')
    RequestLive = False
    Left = 272
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qryOSPLotesProdutosProduto: TLargeintField
      FieldName = 'produto'
    end
    object qryOSPLotesProdutoscodigoVisual: TStringField
      FieldName = 'codigovisual'
      Size = 50
    end
    object qryOSPLotesProdutosDescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
    object qryOSPLotesProdutosQuantidade: TFloatField
      FieldName = 'quantidade'
      DisplayFormat = '0.00'
    end
    object qryOSPLotesProdutosUnidade: TStringField
      FieldName = 'unidade'
      Size = 50
    end
    object qryOSPLotesProdutosTipo: TStringField
      FieldName = 'tipo'
      Size = 50
    end
    object qryOSPLotesProdutosOrdem: TIntegerField
      FieldName = 'ordem'
      DisplayFormat = '0'
    end
    object qryOSPLotesProdutosResistividade: TFloatField
      FieldName = 'resistividade'
      DisplayFormat = '0.00'
    end
    object qryOSPLotesProdutostolerancia: TIntegerField
      FieldName = 'tolerancia'
    end
    object qryOSPLotesProdutosliga: TStringField
      FieldName = 'liga'
      Size = 50
    end
  end
  object qryMovimentos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkFields = 'produto=produto;numero=numerocontrole;tipo=tipocontrole'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrRequisicoesOSP
    Constraints = <>
    OnCalcFields = qryMovimentosCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select m.*,'
      '       (select u.usename'
      '        from usuarios u'
      '        where u.codigo = m.usuariologado) as usename'
      'from movimentos m'
      'where m.osp = :osp'
      '    and m.lote = :lote')
    RequestLive = True
    Left = 152
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'osp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'lote'
        ParamType = ptUnknown
      end>
    object qryMovimentosnumero: TIntegerField
      FieldName = 'numero'
    end
    object qryMovimentosproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryMovimentosfilial: TIntegerField
      FieldName = 'filial'
    end
    object qryMovimentosdata: TDateField
      DisplayLabel = 'DATA'
      FieldName = 'data'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryMovimentoshora: TTimeField
      DisplayLabel = 'HORA'
      FieldName = 'hora'
      DisplayFormat = 'hh:mm'
    end
    object qryMovimentosquantidade: TFloatField
      DisplayLabel = 'QUANTIDADE'
      FieldName = 'quantidade'
    end
    object qryMovimentostipomovimento: TStringField
      FieldName = 'tipomovimento'
      Size = 3
    end
    object qryMovimentososp: TIntegerField
      FieldName = 'osp'
    end
    object qryMovimentoslote: TIntegerField
      FieldName = 'lote'
    end
    object qryMovimentosnumerocontrole: TIntegerField
      FieldName = 'numerocontrole'
    end
    object qryMovimentosreferencia: TStringField
      FieldName = 'referencia'
      Size = 60
    end
    object qryMovimentosquantidade_calc: TFloatField
      FieldKind = fkCalculated
      FieldName = 'quantidade_calc'
      DisplayFormat = '###,###,##0.000'
      Calculated = True
    end
    object qryMovimentostipocontrole: TStringField
      FieldName = 'tipocontrole'
      Size = 1
    end
    object qryMovimentosusename: TStringField
      FieldName = 'usename'
      Size = 50
    end
  end
  object dsrMovimentos: TtecDataSource
    DataSet = qryMovimentos
    Left = 192
    Top = 144
  end
end
