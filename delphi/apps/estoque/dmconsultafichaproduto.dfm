inherited dtmConsultaFichaProduto: TdtmConsultaFichaProduto
  Left = 457
  Top = 212
  Height = 492
  Width = 966
  object qryFichaProduto: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryFichaProdutoAfterOpen
    AfterInsert = qryFichaProdutoAfterInsert
    BeforePost = qryFichaProdutoBeforePost
    AfterScroll = qryFichaProdutoAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'Linha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CondicaoLote'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'Select m.numero,'
      '       m.lancto,'
      '       m.data,'
      '       m.processamento,'
      '       m.tipomovimento,'
      '       m.referencia,'
      '       m.quantidade,'
      '       m.filial,'
      '       m.contrato,'
      '       m.contrato,'
      '       m.emestoque,'
      '       m.reservado,'
      '       m.transito,'
      '       m.demonstracao,'
      '       m.conserto,'
      '       m.futuro,'
      '       m.danificada,'
      '       m.estoquefisico,'
      '       m.reservaprevia,'
      '       cast(substr(m.operacao,1,1) as varchar)  as est,'
      '       cast(substr(m.operacao,2,1) as varchar)  as res,'
      '       cast(substr(m.operacao,3,1) as varchar)  as tra,'
      '       cast(substr(m.operacao,4,1) as varchar)  as dem,'
      '       cast(substr(m.operacao,5,1) as varchar)  as con,'
      '       cast(substr(m.operacao,6,1) as varchar)  as fut,'
      '       cast(substr(m.operacao,7,1) as varchar)  as dan,'
      '       cast(substr(m.operacao,8,1) as varchar)  as fis,'
      '       cast(substr(m.operacao,9,1) as varchar)  as prev,'
      '       cast(substr(m.operacao,10,1) as varchar) as uent,'
      '       cast(substr(m.operacao,11,1) as varchar) as ucom,'
      '       cast(substr(m.operacao,12,1) as varchar) as fin,'
      '       cast(substr(m.operacao,13,1) as varchar) as tven,'
      '       cast(substr(m.operacao,14,1) as varchar) as tcom,'
      '       m.valor,'
      '       m.precocomicms,'
      '       m.precosemicms,'
      '       m.aliquotaipi,'
      '       m.financeiro,'
      '       m.usuariologado,'
      
        '       (select u.nome from usuarios  u where u.codigo = m.usuari' +
        'ologado) as nomeusuariologado,'
      '       m.usuarioautorizacao,'
      
        '       (select u.nome from usuarios  u where u.codigo = m.usuari' +
        'oautorizacao) as nomeusuarioautorizacao,'
      ''
      
        '       case when (m.emestoque+m.reservado+m.reservaprevia+m.tran' +
        'sito+m.demonstracao+m.conserto+m.danificada) = 0  then 0'
      
        #9#9'else round(m.financeiro / (m.emestoque+m.reservado+m.reservapr' +
        'evia+m.transito+m.demonstracao+m.conserto+m.danificada), 2)'
      '       end as customedio,'
      ''
      '       case when m.codigonota is null'
      '         then (select coalesce(v.razao,v.nome) as nome'
      '               from vfornecedores v'
      
        '               where (v.codigo = m.cliente) and (v.tipo = m.tipo' +
        'cliente)'
      '              )'
      '         else'
      '              (select coalesce(v.razao,v.nome) as nome'
      '               from vfornecedores v'
      
        '               where (v.codigo, v.tipo) in (select n.fornecedor,' +
        'n.tipofornecedor'
      '                                            from notaspag n'
      
        '                                             where n.codigo = m.' +
        'codigonota))'
      '        end as clientefornecedor,'
      '        m.naoprocessartriggers,'
      '        m.moeda,'
      '        m.valormoeda,'
      '        m.pedcotacao,'
      '        m.pedaberto,'
      '        l.nrlote,'
      '        m.loteproduto'
      ''
      ''
      'From   movimentos m'
      '       left join lotes l'
      '       on m.loteproduto = l.lote'
      ''
      'Where   (m.produto =:produto)'
      ''
      '%Linha'
      '%CondicaoLote'
      ''
      'Order By m.filial, cast(m.data as date), m.Lancto')
    RequestLive = True
    Left = 88
    Top = 17
    ParamData = <
      item
        DataType = ftString
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qryFichaProdutonumero: TIntegerField
      FieldName = 'numero'
      ReadOnly = True
      DisplayFormat = '0'
    end
    object qryFichaProdutodata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      ReadOnly = True
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryFichaProdutoprocessamento: TDateTimeField
      FieldName = 'processamento'
      ReadOnly = True
      DisplayFormat = 'dd/mm/yyyy hh:MM:ss'
    end
    object qryFichaProdutotipomovimento: TStringField
      FieldName = 'tipomovimento'
      ReadOnly = True
      Required = True
      Size = 3
    end
    object qryFichaProdutoreferencia: TStringField
      FieldName = 'referencia'
      ReadOnly = True
      Size = 60
    end
    object qryFichaProdutoquantidade: TFloatField
      FieldName = 'quantidade'
      ReadOnly = True
      Required = True
      DisplayFormat = '0'
    end
    object qryFichaProdutofilial: TIntegerField
      FieldName = 'filial'
      ReadOnly = True
      Required = True
      DisplayFormat = '00#'
    end
    object qryFichaProdutoemestoque: TFloatField
      FieldName = 'emestoque'
      ReadOnly = True
      DisplayFormat = '0'
    end
    object qryFichaProdutoreservado: TFloatField
      FieldName = 'reservado'
      ReadOnly = True
      Required = True
      DisplayFormat = '0'
    end
    object qryFichaProdutotransito: TFloatField
      FieldName = 'transito'
      ReadOnly = True
      Required = True
      DisplayFormat = '0'
    end
    object qryFichaProdutodemonstracao: TFloatField
      FieldName = 'demonstracao'
      ReadOnly = True
      Required = True
      DisplayFormat = '0'
    end
    object qryFichaProdutoconserto: TFloatField
      FieldName = 'conserto'
      ReadOnly = True
      Required = True
      DisplayFormat = '0'
    end
    object qryFichaProdutofuturo: TFloatField
      FieldName = 'futuro'
      ReadOnly = True
      Required = True
      DisplayFormat = '0'
    end
    object qryFichaProdutodanificada: TFloatField
      FieldName = 'danificada'
      ReadOnly = True
      Required = True
      DisplayFormat = '0'
    end
    object qryFichaProdutoestoquefisico: TFloatField
      FieldName = 'estoquefisico'
      ReadOnly = True
      DisplayFormat = '0'
    end
    object qryFichaProdutoreservaprevia: TFloatField
      FieldName = 'reservaprevia'
      ReadOnly = True
    end
    object qryFichaProdutoest: TStringField
      Alignment = taCenter
      FieldName = 'est'
      ReadOnly = True
      Size = 1
    end
    object qryFichaProdutores: TStringField
      Alignment = taCenter
      FieldName = 'res'
      ReadOnly = True
      Size = 1
    end
    object qryFichaProdutotra: TStringField
      Alignment = taCenter
      FieldName = 'tra'
      ReadOnly = True
      Size = 1
    end
    object qryFichaProdutodem: TStringField
      Alignment = taCenter
      FieldName = 'dem'
      ReadOnly = True
      Size = 1
    end
    object qryFichaProdutocon: TStringField
      Alignment = taCenter
      FieldName = 'con'
      ReadOnly = True
      Size = 1
    end
    object qryFichaProdutofut: TStringField
      Alignment = taCenter
      FieldName = 'fut'
      ReadOnly = True
      Size = 1
    end
    object qryFichaProdutodan: TStringField
      Alignment = taCenter
      FieldName = 'dan'
      ReadOnly = True
      Size = 1
    end
    object qryFichaProdutofis: TStringField
      Alignment = taCenter
      FieldName = 'fis'
      ReadOnly = True
      Size = 1
    end
    object qryFichaProdutoprev: TStringField
      FieldName = 'prev'
      ReadOnly = True
      Size = 1
    end
    object qryFichaProdutouent: TStringField
      Alignment = taCenter
      FieldName = 'uent'
      ReadOnly = True
      Size = 1
    end
    object qryFichaProdutoucom: TStringField
      Alignment = taCenter
      FieldName = 'ucom'
      ReadOnly = True
      Size = 1
    end
    object qryFichaProdutofin: TStringField
      Alignment = taCenter
      FieldName = 'fin'
      ReadOnly = True
      Size = 1
    end
    object qryFichaProdutotven: TStringField
      Alignment = taCenter
      FieldName = 'tven'
      ReadOnly = True
      Size = 1
    end
    object qryFichaProdutotcom: TStringField
      Alignment = taCenter
      FieldName = 'tcom'
      ReadOnly = True
      Size = 1
    end
    object qryFichaProdutovalor: TFloatField
      FieldName = 'valor'
      ReadOnly = True
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryFichaProdutoprecocomicms: TFloatField
      FieldName = 'precocomicms'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryFichaProdutoprecosemicms: TFloatField
      FieldName = 'precosemicms'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryFichaProdutoaliquotaipi: TFloatField
      FieldName = 'aliquotaipi'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object qryFichaProdutofinanceiro: TFloatField
      FieldName = 'financeiro'
      ReadOnly = True
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryFichaProdutoclientefornecedor: TStringField
      FieldName = 'clientefornecedor'
      ReadOnly = True
      Size = 60
    end
    object qryFichaProdutomoeda: TStringField
      FieldName = 'moeda'
      Size = 10
    end
    object qryFichaProdutovalormoeda: TFloatField
      FieldName = 'valormoeda'
      DisplayFormat = '###,##0.000000'
      EditFormat = '###,##0.000000'
    end
    object qryFichaProdutomoedaLookup: TStringField
      FieldKind = fkLookup
      FieldName = 'moedaLookup'
      LookupDataSet = qryMoedas
      LookupKeyFields = 'codigo'
      LookupResultField = 'descricao'
      KeyFields = 'moeda'
      Lookup = True
    end
    object qryFichaProdutonaoprocessartriggers: TBooleanField
      FieldName = 'naoprocessartriggers'
    end
    object qryFichaProdutocustomedio: TFloatField
      FieldName = 'customedio'
      ReadOnly = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryFichaProdutopedcotacao: TFloatField
      DisplayLabel = 'COTA'#199#195'O'
      FieldName = 'pedcotacao'
      DisplayFormat = '###,##0.00'
      EditFormat = '###,##0.00'
    end
    object qryFichaProdutopedaberto: TFloatField
      DisplayLabel = 'EM ABERTO'
      FieldName = 'pedaberto'
      DisplayFormat = '###,##0.000'
      EditFormat = '###,##0.000'
    end
    object qryFichaProdutousuariologado: TIntegerField
      FieldName = 'usuariologado'
    end
    object qryFichaProdutonomeusuariologado: TStringField
      FieldName = 'nomeusuariologado'
      Size = 50
    end
    object qryFichaProdutousuarioautorizacao: TIntegerField
      FieldName = 'usuarioautorizacao'
    end
    object qryFichaProdutonomeusuarioautorizacao: TStringField
      FieldName = 'nomeusuarioautorizacao'
      Size = 50
    end
    object qryFichaProdutocontrato: TStringField
      FieldName = 'contrato'
    end
    object qryFichaProdutonrlote: TStringField
      FieldName = 'nrlote'
    end
    object qryFichaProdutoloteproduto: TLargeintField
      FieldName = 'loteproduto'
    end
  end
  object dsrFichaProduto: TtecDataSource
    DataSet = qryFichaProduto
    Left = 86
    Top = 72
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
      'SELECT nome, codigo'
      'FROM filiais'
      'ORDER BY UPPER(TO_ASCII(nome,'#39'latin1'#39'))')
    RequestLive = False
    Left = 86
    Top = 285
    object qryConsultaFiliaisnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaFiliaiscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
  end
  object qryProcuraFiliais: TtecQuery
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
      'SELECT codigo, nome'
      'FROM filiais'
      'WHERE codigo = :codigo')
    RequestLive = False
    Left = 238
    Top = 135
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraFiliaiscodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryProcuraFiliaisnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
  end
  object dsrProcuraFiliais: TtecDataSource
    DataSet = qryProcuraFiliais
    Left = 238
    Top = 189
  end
  object qryProcuraTiposMovimentos: TtecQuery
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
      'SELECT codigo, descricao'
      'FROM tiposmovimentos'
      'WHERE codigo = :codigo')
    RequestLive = False
    Left = 406
    Top = 17
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraTiposMovimentoscodigo: TStringField
      FieldName = 'codigo'
      Size = 3
    end
    object qryProcuraTiposMovimentosdescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
  end
  object dsrProcuraTiposMovimentos: TtecDataSource
    DataSet = qryProcuraTiposMovimentos
    Left = 406
    Top = 72
  end
  object qryConsultaTiposMovimentos: TtecQuery
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
      'SELECT descricao, codigo'
      'FROM tiposmovimentos'
      'ORDER BY UPPER(TO_ASCII(descricao,'#39'latin1'#39'))')
    RequestLive = False
    Left = 86
    Top = 344
    object qryConsultaTiposMovimentosdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 70
    end
    object qryConsultaTiposMovimentoscodigo: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Size = 3
    end
  end
  object qryFichaProduto_Saldo: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'Linha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CondicaoLote'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'Select m.numero,'
      '       cast(null as timestamp) as data,'
      '       m.processamento,'
      '       m.data as data1,'
      '       cast(null as varchar) as tipomovimento,'
      '       cast('#39'SALDO ANTERIOR'#39' as varchar(60)) as referencia,'
      '       m.quantidade,'
      '       cast(null as integer) as filial,'
      '       m.emestoque,'
      '       m.reservado,'
      '       m.transito,'
      '       m.demonstracao,'
      '       m.conserto,'
      '       m.futuro,'
      '       m.danificada,'
      '       m.estoquefisico,'
      '       m.reservaprevia,'
      '       cast(substr(m.operacao,1,1) as varchar)  as est,'
      '       cast(substr(m.operacao,2,1) as varchar)  as res,'
      '       cast(substr(m.operacao,3,1) as varchar)  as tra,'
      '       cast(substr(m.operacao,4,1) as varchar)  as dem,'
      '       cast(substr(m.operacao,5,1) as varchar)  as con,'
      '       cast(substr(m.operacao,6,1) as varchar)  as fut,'
      '       cast(substr(m.operacao,7,1) as varchar)  as dan,'
      '       cast(substr(m.operacao,8,1) as varchar)  as fis,'
      '       cast(substr(m.operacao,9,1) as varchar)  as prev,'
      '       cast(substr(m.operacao,10,1) as varchar) as uent,'
      '       cast(substr(m.operacao,11,1) as varchar) as ucom,'
      '       cast(substr(m.operacao,12,1) as varchar) as fin,'
      '       cast(substr(m.operacao,13,1) as varchar) as tven,'
      '       cast(substr(m.operacao,14,1) as varchar) as tcom,'
      '       m.valor,'
      '       m.precocomicms,'
      '       m.precosemicms,'
      '       m.aliquotaipi,'
      '       m.financeiro,'
      '       case when m.codigonota is null'
      '         then (select coalesce(v.razao,v.nome) as nome'
      '               from vfornecedores v'
      
        '               where (v.codigo = m.cliente) and (v.tipo = m.tipo' +
        'cliente)'
      '              )'
      '         else'
      '              (select coalesce(v.razao,v.nome) as nome'
      '               from vfornecedores v'
      
        '               where (v.codigo, v.tipo) in (select n.fornecedor,' +
        'n.tipofornecedor'
      '                                            from notaspag n'
      
        '                                             where n.codigo = m.' +
        'codigonota))'
      '       end as clientefornecedor,'
      '       m.naoprocessartriggers,'
      '       m.moeda,'
      '       m.valormoeda'
      ''
      'From   movimentos m'
      'Where  m.produto =:produto'
      '  and cast(m.data as date) < :datainicial'
      ''
      '     %Linha'
      '     %CondicaoLote'
      ''
      'order by m.data desc, m.numero desc, m.lancto desc limit 1')
    RequestLive = False
    Left = 88
    Top = 129
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end>
    object qryFichaProduto_Saldonumero: TIntegerField
      FieldName = 'numero'
    end
    object qryFichaProduto_Saldodata: TDateTimeField
      FieldName = 'data'
    end
    object qryFichaProduto_Saldoprocessamento: TDateTimeField
      FieldName = 'processamento'
    end
    object qryFichaProduto_Saldotipomovimento: TStringField
      FieldName = 'tipomovimento'
      Size = 50
    end
    object qryFichaProduto_Saldoreferencia: TStringField
      FieldName = 'referencia'
      Size = 60
    end
    object qryFichaProduto_Saldoquantidade: TFloatField
      FieldName = 'quantidade'
    end
    object qryFichaProduto_Saldofilial: TIntegerField
      FieldName = 'filial'
    end
    object qryFichaProduto_Saldoemestoque: TFloatField
      FieldName = 'emestoque'
    end
    object qryFichaProduto_Saldoreservado: TFloatField
      FieldName = 'reservado'
    end
    object qryFichaProduto_Saldotransito: TFloatField
      FieldName = 'transito'
    end
    object qryFichaProduto_Saldodemonstracao: TFloatField
      FieldName = 'demonstracao'
    end
    object qryFichaProduto_Saldoconserto: TFloatField
      FieldName = 'conserto'
    end
    object qryFichaProduto_Saldofuturo: TFloatField
      FieldName = 'futuro'
    end
    object qryFichaProduto_Saldodanificada: TFloatField
      FieldName = 'danificada'
    end
    object qryFichaProduto_Saldoestoquefisico: TFloatField
      FieldName = 'estoquefisico'
    end
    object qryFichaProduto_Saldoreservaprevia: TFloatField
      FieldName = 'reservaprevia'
    end
    object qryFichaProduto_Saldoest: TStringField
      FieldName = 'est'
      Size = 50
    end
    object qryFichaProduto_Saldores: TStringField
      FieldName = 'res'
      Size = 50
    end
    object qryFichaProduto_Saldotra: TStringField
      FieldName = 'tra'
      Size = 50
    end
    object qryFichaProduto_Saldodem: TStringField
      FieldName = 'dem'
      Size = 50
    end
    object qryFichaProduto_Saldocon: TStringField
      FieldName = 'con'
      Size = 50
    end
    object qryFichaProduto_Saldofut: TStringField
      FieldName = 'fut'
      Size = 50
    end
    object qryFichaProduto_Saldodan: TStringField
      FieldName = 'dan'
      Size = 50
    end
    object qryFichaProduto_Saldofis: TStringField
      FieldName = 'fis'
      Size = 50
    end
    object qryFichaProduto_Saldoprev: TStringField
      FieldName = 'prev'
      Size = 50
    end
    object qryFichaProduto_Saldouent: TStringField
      FieldName = 'uent'
      Size = 50
    end
    object qryFichaProduto_Saldoucom: TStringField
      FieldName = 'ucom'
      Size = 50
    end
    object qryFichaProduto_Saldofin: TStringField
      FieldName = 'fin'
      Size = 50
    end
    object qryFichaProduto_Saldotven: TStringField
      FieldName = 'tven'
      Size = 50
    end
    object qryFichaProduto_Saldotcom: TStringField
      FieldName = 'tcom'
      Size = 50
    end
    object qryFichaProduto_Saldovalor: TFloatField
      FieldName = 'valor'
    end
    object qryFichaProduto_Saldoprecocomicms: TFloatField
      FieldName = 'precocomicms'
    end
    object qryFichaProduto_Saldoprecosemicms: TFloatField
      FieldName = 'precosemicms'
    end
    object qryFichaProduto_Saldoaliquotaipi: TFloatField
      FieldName = 'aliquotaipi'
    end
    object qryFichaProduto_Saldofinanceiro: TFloatField
      FieldName = 'financeiro'
    end
    object qryFichaProduto_Saldoclientefornecedor: TStringField
      FieldName = 'clientefornecedor'
      Size = 50
    end
    object qryFichaProduto_Saldomoeda: TStringField
      FieldName = 'moeda'
      Size = 10
    end
    object qryFichaProduto_Saldovalormoeda: TFloatField
      FieldName = 'valormoeda'
    end
    object qryFichaProduto_Saldonaoprocessartriggers: TBooleanField
      FieldName = 'naoprocessartriggers'
    end
  end
  object qryMoedas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryMoedasAfterOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      ';'
      'select cast(null as varchar(10)) as codigo,'
      '           cast(null as varchar(30)) as descricao'
      ''
      '         '
      ''
      'union all'
      ''
      'select codigo,descricao'
      'from moedas'
      'order by codigo')
    RequestLive = True
    Left = 240
    Top = 256
    object qryMoedascodigo: TStringField
      FieldName = 'codigo'
      Size = 10
    end
    object qryMoedasdescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
  end
  object qryFichaProduto_Contrato: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkFields = 'filial=filial;contrato=contrato'
    LinkOptions = []
    MasterSource = dsrFichaProduto
    Constraints = <>
    BeforeOpen = qryFichaProduto_ContratoBeforeOpen
    OnFilterRecord = qryFichaProduto_ContratoFilterRecord
    Filtered = True
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'ListadeContratos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Linha'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'Select m.numero,'
      '       m.lancto,'
      '       m.data,'
      '       m.processamento,'
      '       m.tipomovimento,'
      '       m.referencia,'
      '       m.quantidade,'
      '       m.filial,'
      '       m.contrato,'
      '       m.emestoque,'
      '       m.reservado,'
      '       m.transito,'
      '       m.demonstracao,'
      '       m.conserto,'
      '       m.futuro,'
      '       m.danificada,'
      '       m.estoquefisico,'
      '       m.reservaprevia,'
      '       cast(substr(m.operacao,1,1) as varchar)  as est,'
      '       cast(substr(m.operacao,2,1) as varchar)  as res,'
      '       cast(substr(m.operacao,3,1) as varchar)  as tra,'
      '       cast(substr(m.operacao,4,1) as varchar)  as dem,'
      '       cast(substr(m.operacao,5,1) as varchar)  as con,'
      '       cast(substr(m.operacao,6,1) as varchar)  as fut,'
      '       cast(substr(m.operacao,7,1) as varchar)  as dan,'
      '       cast(substr(m.operacao,8,1) as varchar)  as fis,'
      '       cast(substr(m.operacao,9,1) as varchar)  as prev,'
      '       cast(substr(m.operacao,10,1) as varchar) as uent,'
      '       cast(substr(m.operacao,11,1) as varchar) as ucom,'
      '       cast(substr(m.operacao,12,1) as varchar) as fin,'
      '       cast(substr(m.operacao,13,1) as varchar) as tven,'
      '       cast(substr(m.operacao,14,1) as varchar) as tcom,'
      '       m.valor,'
      '       m.precocomicms,'
      '       m.precosemicms,'
      '       m.aliquotaipi,'
      '       m.financeiro,'
      '       m.usuariologado,'
      
        '       (select u.nome from usuarios  u where u.codigo = m.usuari' +
        'ologado) as nomeusuariologado,'
      '       usuarioautorizacao,'
      
        '       (select u.nome from usuarios  u where u.codigo = m.usuari' +
        'oautorizacao) as nomeusuarioautorizacao,'
      ''
      
        '       case when (m.emestoque+m.reservado+m.reservaprevia+m.tran' +
        'sito+m.demonstracao+m.conserto+m.danificada) = 0  then 0'
      
        #9#9'else round(m.financeiro / (m.emestoque+m.reservado+m.reservapr' +
        'evia+m.transito+m.demonstracao+m.conserto+m.danificada), 2)'
      '       end as customedio,'
      ''
      '       case when m.codigonota is null'
      '         then (select coalesce(v.razao,v.nome) as nome'
      '               from vfornecedores v'
      
        '               where (v.codigo = m.cliente) and (v.tipo = m.tipo' +
        'cliente)'
      '              )'
      '         else'
      '              (select coalesce(v.razao,v.nome) as nome'
      '               from vfornecedores v'
      
        '               where (v.codigo, v.tipo) in (select n.fornecedor,' +
        'n.tipofornecedor'
      '                                            from notaspag n'
      
        '                                             where n.codigo = m.' +
        'codigonota))'
      '        end as clientefornecedor,'
      '        m.naoprocessartriggers,'
      '        m.moeda,'
      '        m.valormoeda,'
      '        m.pedcotacao,'
      '        m.pedaberto,'
      '        ct.situacao,'
      '        ct.data as datacontrato,'
      '        ct.datareservado,'
      '        ct.faturamento,'
      '        p.codigovisual as produtonocontrato,'
      '        pc.quantidade as quantidadecontrato,'
      
        '       (select sum(ctd.quantidade) from contratosdevolvidos ctd ' +
        'where ctd.contrato = pc.contrato and ctd.produto = pc.produto an' +
        'd ctd.tipo = '#39'D'#39') as devolvidos,'
      
        '       (select sum(ctd.quantidade) from contratosdevolvidos ctd ' +
        'where ctd.contrato = pc.contrato and ctd.produto = pc.produto an' +
        'd ctd.tipo = '#39'T'#39') as trocados'
      ''
      ''
      'From   movimentos m join (produtoscontratos pc'
      '                        join (produtos p'
      '                              join caracteristicas c'
      '                              on p.caracteristica = c.codigo)'
      '                        on pc.produto = p.codigo)'
      ''
      ''
      
        '      on m.produto = (case when coalesce(c.composto,false) then ' +
        '(select pco.componente'
      
        '                                                                ' +
        '          from produtoscompostos pco'
      
        '                                                                ' +
        '          where pco.composto = pc.produto'
      
        '                                                                ' +
        '            and pco.componente = m.produto) else  pc.produto end' +
        ')'
      '     and m.filial = pc.filial'
      '     and m.contrato = pc.contrato'
      ''
      '     join contratos ct'
      '     on pc.contrato = ct.numero'
      ''
      'Where  (m.produto =:produto)'
      '  and m.contrato in (%ListadeContratos)'
      ''
      '%Linha'
      ''
      'Order By m.filial, cast(m.data as date), Lancto')
    RequestLive = False
    Left = 198
    Top = 17
    ParamData = <
      item
        DataType = ftString
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qryFichaProduto_Contratonumero: TIntegerField
      FieldName = 'numero'
      Required = True
      Visible = False
    end
    object qryFichaProduto_Contratolancto: TIntegerField
      FieldName = 'lancto'
      Visible = False
    end
    object qryFichaProduto_Contratodata: TDateField
      FieldName = 'data'
      Required = True
      Visible = False
    end
    object qryFichaProduto_Contratoprocessamento: TDateTimeField
      FieldName = 'processamento'
      Visible = False
    end
    object qryFichaProduto_Contratotipomovimento: TStringField
      FieldName = 'tipomovimento'
      Required = True
      Visible = False
      Size = 3
    end
    object qryFichaProduto_Contratoreferencia: TStringField
      FieldName = 'referencia'
      Visible = False
      Size = 60
    end
    object qryFichaProduto_Contratoquantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
      Visible = False
    end
    object qryFichaProduto_Contratofilial: TIntegerField
      FieldName = 'filial'
      Required = True
      Visible = False
    end
    object qryFichaProduto_Contratocontrato: TStringField
      FieldName = 'contrato'
      Visible = False
    end
    object qryFichaProduto_Contratoemestoque: TFloatField
      FieldName = 'emestoque'
      Required = True
      Visible = False
    end
    object qryFichaProduto_Contratoreservado: TFloatField
      FieldName = 'reservado'
      Required = True
      Visible = False
    end
    object qryFichaProduto_Contratotransito: TFloatField
      FieldName = 'transito'
      Required = True
      Visible = False
    end
    object qryFichaProduto_Contratodemonstracao: TFloatField
      FieldName = 'demonstracao'
      Required = True
      Visible = False
    end
    object qryFichaProduto_Contratoconserto: TFloatField
      FieldName = 'conserto'
      Required = True
      Visible = False
    end
    object qryFichaProduto_Contratofuturo: TFloatField
      FieldName = 'futuro'
      Required = True
      Visible = False
    end
    object qryFichaProduto_Contratodanificada: TFloatField
      FieldName = 'danificada'
      Required = True
      Visible = False
    end
    object qryFichaProduto_Contratoestoquefisico: TFloatField
      FieldName = 'estoquefisico'
      Required = True
      Visible = False
    end
    object qryFichaProduto_Contratoreservaprevia: TFloatField
      FieldName = 'reservaprevia'
      Required = True
      Visible = False
    end
    object qryFichaProduto_Contratoest: TStringField
      FieldName = 'est'
      Visible = False
      Size = 50
    end
    object qryFichaProduto_Contratores: TStringField
      FieldName = 'res'
      Visible = False
      Size = 50
    end
    object qryFichaProduto_Contratotra: TStringField
      FieldName = 'tra'
      Visible = False
      Size = 50
    end
    object qryFichaProduto_Contratodem: TStringField
      FieldName = 'dem'
      Visible = False
      Size = 50
    end
    object qryFichaProduto_Contratocon: TStringField
      FieldName = 'con'
      Visible = False
      Size = 50
    end
    object qryFichaProduto_Contratofut: TStringField
      FieldName = 'fut'
      Visible = False
      Size = 50
    end
    object qryFichaProduto_Contratodan: TStringField
      FieldName = 'dan'
      Visible = False
      Size = 50
    end
    object qryFichaProduto_Contratofis: TStringField
      FieldName = 'fis'
      Visible = False
      Size = 50
    end
    object qryFichaProduto_Contratoprev: TStringField
      FieldName = 'prev'
      Visible = False
      Size = 50
    end
    object qryFichaProduto_Contratouent: TStringField
      FieldName = 'uent'
      Visible = False
      Size = 50
    end
    object qryFichaProduto_Contratoucom: TStringField
      FieldName = 'ucom'
      Visible = False
      Size = 50
    end
    object qryFichaProduto_Contratofin: TStringField
      FieldName = 'fin'
      Visible = False
      Size = 50
    end
    object qryFichaProduto_Contratotven: TStringField
      FieldName = 'tven'
      Visible = False
      Size = 50
    end
    object qryFichaProduto_Contratotcom: TStringField
      FieldName = 'tcom'
      Visible = False
      Size = 50
    end
    object qryFichaProduto_Contratovalor: TFloatField
      FieldName = 'valor'
      Required = True
      Visible = False
    end
    object qryFichaProduto_Contratoprecocomicms: TFloatField
      FieldName = 'precocomicms'
      Visible = False
    end
    object qryFichaProduto_Contratoprecosemicms: TFloatField
      FieldName = 'precosemicms'
      Visible = False
    end
    object qryFichaProduto_Contratoaliquotaipi: TFloatField
      FieldName = 'aliquotaipi'
      Visible = False
    end
    object qryFichaProduto_Contratofinanceiro: TFloatField
      FieldName = 'financeiro'
      Required = True
      Visible = False
    end
    object qryFichaProduto_Contratousuariologado: TIntegerField
      FieldName = 'usuariologado'
      Visible = False
    end
    object qryFichaProduto_Contratonomeusuariologado: TStringField
      FieldName = 'nomeusuariologado'
      Visible = False
      Size = 40
    end
    object qryFichaProduto_Contratousuarioautorizacao: TIntegerField
      FieldName = 'usuarioautorizacao'
      Visible = False
    end
    object qryFichaProduto_Contratonomeusuarioautorizacao: TStringField
      FieldName = 'nomeusuarioautorizacao'
      Visible = False
      Size = 40
    end
    object qryFichaProduto_Contratocustomedio: TFloatField
      FieldName = 'customedio'
      Visible = False
    end
    object qryFichaProduto_Contratoclientefornecedor: TStringField
      FieldName = 'clientefornecedor'
      Visible = False
      Size = 50
    end
    object qryFichaProduto_Contratonaoprocessartriggers: TBooleanField
      FieldName = 'naoprocessartriggers'
      Visible = False
    end
    object qryFichaProduto_Contratomoeda: TStringField
      FieldName = 'moeda'
      Visible = False
      Size = 10
    end
    object qryFichaProduto_Contratovalormoeda: TFloatField
      FieldName = 'valormoeda'
      Visible = False
    end
    object qryFichaProduto_Contratopedcotacao: TFloatField
      FieldName = 'pedcotacao'
      Visible = False
    end
    object qryFichaProduto_Contratopedaberto: TFloatField
      FieldName = 'pedaberto'
      Visible = False
    end
    object qryFichaProduto_Contratosituacao: TStringField
      FieldName = 'situacao'
      Required = True
      Visible = False
      Size = 1
    end
    object qryFichaProduto_Contratodatacontrato: TDateField
      FieldName = 'datacontrato'
      Required = True
      Visible = False
    end
    object qryFichaProduto_Contratodatareservado: TDateField
      FieldName = 'datareservado'
      Visible = False
    end
    object qryFichaProduto_Contratofaturamento: TDateField
      FieldName = 'faturamento'
      Visible = False
    end
    object qryFichaProduto_Contratoquantidadecontrato: TFloatField
      FieldName = 'quantidadecontrato'
      Required = True
      Visible = False
    end
    object qryFichaProduto_Contratodevolvidos: TFloatField
      FieldName = 'devolvidos'
      Visible = False
    end
    object qryFichaProduto_Contratotrocados: TFloatField
      FieldName = 'trocados'
      Visible = False
    end
    object qryFichaProduto_Contratoprodutonocontrato: TStringField
      FieldName = 'produtonocontrato'
      Size = 30
    end
  end
  object dsrFichaProduto_Contrato: TtecDataSource
    DataSet = qryFichaProduto_Contrato
    Left = 198
    Top = 72
  end
  object qryFichaProdutoLote: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkFields = 'loteproduto = loteproduto'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrFichaProduto
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'Linha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CondicaoLote'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'Select ml.numero,'
      '       ml.lancto,'
      '       ml.data,'
      '       ml.processamento,'
      '       ml.tipomovimento,'
      '       ml.referencia,'
      '       ml.quantidade,'
      '       ml.filial,'
      '       ml.contrato,'
      '       ml.contrato,'
      '       ml.emestoque,'
      '       ml.reservado,'
      '       ml.transito,'
      '       ml.demonstracao,'
      '       ml.conserto,'
      '       ml.futuro,'
      '       ml.danificada,'
      '       ml.estoquefisico,'
      '       ml.reservaprevia,'
      '       cast(substr(ml.operacao,1,1) as varchar)  as est,'
      '       cast(substr(ml.operacao,2,1) as varchar)  as res,'
      '       cast(substr(ml.operacao,3,1) as varchar)  as tra,'
      '       cast(substr(ml.operacao,4,1) as varchar)  as dem,'
      '       cast(substr(ml.operacao,5,1) as varchar)  as con,'
      '       cast(substr(ml.operacao,6,1) as varchar)  as fut,'
      '       cast(substr(ml.operacao,7,1) as varchar)  as dan,'
      '       cast(substr(ml.operacao,8,1) as varchar)  as fis,'
      '       cast(substr(ml.operacao,9,1) as varchar)  as prev,'
      '       cast(substr(ml.operacao,10,1) as varchar) as uent,'
      '       cast(substr(ml.operacao,11,1) as varchar) as ucom,'
      '       cast(substr(ml.operacao,12,1) as varchar) as fin,'
      '       cast(substr(ml.operacao,13,1) as varchar) as tven,'
      '       cast(substr(ml.operacao,14,1) as varchar) as tcom,'
      '       ml.valor,'
      '       ml.precocomicms,'
      '       ml.precosemicms,'
      '       ml.aliquotaipi,'
      '       ml.financeiro,'
      '       ml.usuariologado,'
      
        '       (select u.nome from usuarios  u where u.codigo = ml.usuar' +
        'iologado) as nomeusuariologado,'
      '        ml.usuarioautorizacao,'
      
        '       (select u.nome from usuarios  u where u.codigo = ml.usuar' +
        'ioautorizacao) as nomeusuarioautorizacao,'
      ''
      
        '       case when (ml.emestoque+ml.reservado+ml.reservaprevia+ml.' +
        'transito+ml.demonstracao+ml.conserto+ml.danificada) = 0  then 0'
      
        #9#9'else round(ml.financeiro / (ml.emestoque+ml.reservado+ml.reser' +
        'vaprevia+ml.transito+ml.demonstracao+ml.conserto+ml.danificada),' +
        ' 2)'
      '       end as customedio,'
      ''
      '       case when ml.codigonota is null'
      '         then (select coalesce(v.razao,v.nome) as nome'
      '               from vfornecedores v'
      
        '               where (v.codigo = ml.cliente) and (v.tipo = ml.ti' +
        'pocliente)'
      '              )'
      '         else'
      '              (select coalesce(v.razao,v.nome) as nome'
      '               from vfornecedores v'
      
        '               where (v.codigo, v.tipo) in (select n.fornecedor,' +
        'n.tipofornecedor'
      '                                            from notaspag n'
      
        '                                             where n.codigo = ml' +
        '.codigonota))'
      '        end as clientefornecedor,'
      '        ml.naoprocessartriggers,'
      '        ml.moeda,'
      '        ml.valormoeda,'
      '        ml.pedcotacao,'
      '        ml.pedaberto,'
      '        l.nrlote,'
      '        ml.movimento,'
      '        ml.loteproduto'
      ''
      ''
      'From   movimentos m'
      '       join lotes l'
      '       on m.loteproduto = l.lote'
      ''
      '       join movimentoslotes ml'
      '       on m.numero = ml.movimento'
      ''
      'Where  (m.produto =:produto)'
      ''
      '%Linha'
      '%CondicaoLote'
      ''
      'Order By ml.filial, cast(ml.data as date), ml.Lancto')
    RequestLive = True
    Left = 606
    Top = 17
    ParamData = <
      item
        DataType = ftString
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qryFichaProdutoLotenumero: TIntegerField
      FieldName = 'numero'
    end
    object qryFichaProdutoLotedata: TDateField
      FieldName = 'data'
    end
    object qryFichaProdutoLoteprocessamento: TDateTimeField
      FieldName = 'processamento'
    end
    object qryFichaProdutoLotetipomovimento: TStringField
      FieldName = 'tipomovimento'
      Size = 3
    end
    object qryFichaProdutoLotereferencia: TStringField
      FieldName = 'referencia'
      Size = 60
    end
    object qryFichaProdutoLotequantidade: TFloatField
      FieldName = 'quantidade'
    end
    object qryFichaProdutoLotefilial: TIntegerField
      FieldName = 'filial'
    end
    object qryFichaProdutoLoteemestoque: TFloatField
      FieldName = 'emestoque'
    end
    object qryFichaProdutoLotereservado: TFloatField
      FieldName = 'reservado'
    end
    object qryFichaProdutoLotetransito: TFloatField
      FieldName = 'transito'
    end
    object qryFichaProdutoLotedemonstracao: TFloatField
      FieldName = 'demonstracao'
    end
    object qryFichaProdutoLoteconserto: TFloatField
      FieldName = 'conserto'
    end
    object qryFichaProdutoLotefuturo: TFloatField
      FieldName = 'futuro'
    end
    object qryFichaProdutoLotedanificada: TFloatField
      FieldName = 'danificada'
    end
    object qryFichaProdutoLoteestoquefisico: TFloatField
      FieldName = 'estoquefisico'
    end
    object qryFichaProdutoLotereservaprevia: TFloatField
      FieldName = 'reservaprevia'
    end
    object qryFichaProdutoLoteest: TStringField
      FieldName = 'est'
      Size = 50
    end
    object qryFichaProdutoLoteres: TStringField
      FieldName = 'res'
      Size = 50
    end
    object qryFichaProdutoLotetra: TStringField
      FieldName = 'tra'
      Size = 50
    end
    object qryFichaProdutoLotedem: TStringField
      FieldName = 'dem'
      Size = 50
    end
    object qryFichaProdutoLotecon: TStringField
      FieldName = 'con'
      Size = 50
    end
    object qryFichaProdutoLotefut: TStringField
      FieldName = 'fut'
      Size = 50
    end
    object qryFichaProdutoLotedan: TStringField
      FieldName = 'dan'
      Size = 50
    end
    object qryFichaProdutoLotefis: TStringField
      FieldName = 'fis'
      Size = 50
    end
    object qryFichaProdutoLoteprev: TStringField
      FieldName = 'prev'
      Size = 50
    end
    object qryFichaProdutoLoteuent: TStringField
      FieldName = 'uent'
      Size = 50
    end
    object qryFichaProdutoLoteucom: TStringField
      FieldName = 'ucom'
      Size = 50
    end
    object qryFichaProdutoLotefin: TStringField
      FieldName = 'fin'
      Size = 50
    end
    object qryFichaProdutoLotetven: TStringField
      FieldName = 'tven'
      Size = 50
    end
    object qryFichaProdutoLotetcom: TStringField
      FieldName = 'tcom'
      Size = 50
    end
    object qryFichaProdutoLotevalor: TFloatField
      FieldName = 'valor'
    end
    object qryFichaProdutoLoteprecocomicms: TFloatField
      FieldName = 'precocomicms'
    end
    object qryFichaProdutoLoteprecosemicms: TFloatField
      FieldName = 'precosemicms'
    end
    object qryFichaProdutoLotealiquotaipi: TFloatField
      FieldName = 'aliquotaipi'
    end
    object qryFichaProdutoLotefinanceiro: TFloatField
      FieldName = 'financeiro'
    end
    object qryFichaProdutoLoteclientefornecedor: TStringField
      FieldName = 'clientefornecedor'
      Size = 50
    end
    object qryFichaProdutoLotemoeda: TStringField
      FieldName = 'moeda'
      Size = 10
    end
    object qryFichaProdutoLotevalormoeda: TFloatField
      FieldName = 'valormoeda'
    end
    object qryFichaProdutoLotenaoprocessartriggers: TBooleanField
      FieldName = 'naoprocessartriggers'
    end
    object qryFichaProdutoLoteloteproduto: TLargeintField
      FieldName = 'loteproduto'
    end
    object qryFichaProdutoLotecustomedio: TFloatField
      FieldName = 'customedio'
    end
    object qryFichaProdutoLotepedcotacao: TFloatField
      FieldName = 'pedcotacao'
    end
    object qryFichaProdutoLotepedaberto: TFloatField
      FieldName = 'pedaberto'
    end
    object qryFichaProdutoLoteusuariologado: TIntegerField
      FieldName = 'usuariologado'
    end
    object qryFichaProdutoLotenomeusuariologado: TStringField
      FieldName = 'nomeusuariologado'
      Size = 100
    end
    object qryFichaProdutoLoteusuarioautorizacao: TIntegerField
      FieldName = 'usuarioautorizacao'
    end
    object qryFichaProdutoLotenomeusuarioautorizacao: TStringField
      FieldName = 'nomeusuarioautorizacao'
      Size = 100
    end
    object qryFichaProdutoLotecontrato: TStringField
      FieldName = 'contrato'
    end
    object qryFichaProdutoLotenrlote: TStringField
      FieldName = 'nrlote'
    end
    object qryFichaProdutoLotemovimento: TIntegerField
      FieldName = 'movimento'
    end
  end
  object dsrFichaProdutoLote: TtecDataSource
    DataSet = qryFichaProdutoLote
    Left = 606
    Top = 72
  end
  object qryFichaProdutoLote_Contrato: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkFields = 'filial=filial;contrato=contrato'
    LinkOptions = []
    MasterSource = dsrFichaProdutoLote
    Constraints = <>
    OnFilterRecord = qryFichaProdutoLote_ContratoFilterRecord
    Filtered = True
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'ListadeContratos'
        ParamType = ptUnknown
        Value = #39'0'#39
      end>
    Sql.Strings = (
      'Select ml.numero,'
      '       ml.lancto,'
      '       ml.data,'
      '       ml.processamento,'
      '       ml.tipomovimento,'
      '       ml.referencia,'
      '       ml.quantidade,'
      '       ml.filial,'
      '       ml.contrato,'
      '       ml.emestoque,'
      '       ml.reservado,'
      '       ml.transito,'
      '       ml.demonstracao,'
      '       ml.conserto,'
      '       ml.futuro,'
      '       ml.danificada,'
      '       ml.estoquefisico,'
      '       ml.reservaprevia,'
      '       cast(substr(ml.operacao,1,1) as varchar)  as est,'
      '       cast(substr(ml.operacao,2,1) as varchar)  as res,'
      '       cast(substr(ml.operacao,3,1) as varchar)  as tra,'
      '       cast(substr(ml.operacao,4,1) as varchar)  as dem,'
      '       cast(substr(ml.operacao,5,1) as varchar)  as con,'
      '       cast(substr(ml.operacao,6,1) as varchar)  as fut,'
      '       cast(substr(ml.operacao,7,1) as varchar)  as dan,'
      '       cast(substr(ml.operacao,8,1) as varchar)  as fis,'
      '       cast(substr(ml.operacao,9,1) as varchar)  as prev,'
      '       cast(substr(ml.operacao,10,1) as varchar) as uent,'
      '       cast(substr(ml.operacao,11,1) as varchar) as ucom,'
      '       cast(substr(ml.operacao,12,1) as varchar) as fin,'
      '       cast(substr(ml.operacao,13,1) as varchar) as tven,'
      '       cast(substr(ml.operacao,14,1) as varchar) as tcom,'
      '       ml.valor,'
      '       ml.precocomicms,'
      '       ml.precosemicms,'
      '       ml.aliquotaipi,'
      '       ml.financeiro,'
      '       ml.usuariologado,'
      
        '       (select u.nome from usuarios  u where u.codigo = ml.usuar' +
        'iologado) as nomeusuariologado,'
      '       ml.usuarioautorizacao,'
      
        '       (select u.nome from usuarios  u where u.codigo = ml.usuar' +
        'ioautorizacao) as nomeusuarioautorizacao,'
      ''
      
        '       case when (ml.emestoque+ml.reservado+ml.reservaprevia+ml.' +
        'transito+ml.demonstracao+ml.conserto+ml.danificada) = 0  then 0'
      
        #9#9'else round(ml.financeiro / (ml.emestoque+ml.reservado+ml.reser' +
        'vaprevia+ml.transito+ml.demonstracao+ml.conserto+ml.danificada),' +
        ' 2)'
      '       end as customedio,'
      ''
      '       case when ml.codigonota is null'
      '         then (select coalesce(v.razao,v.nome) as nome'
      '               from vfornecedores v'
      
        '               where (v.codigo = ml.cliente) and (v.tipo = ml.ti' +
        'pocliente)'
      '              )'
      '         else'
      '              (select coalesce(v.razao,v.nome) as nome'
      '               from vfornecedores v'
      
        '               where (v.codigo, v.tipo) in (select n.fornecedor,' +
        'n.tipofornecedor'
      '                                            from notaspag n'
      
        '                                             where n.codigo = ml' +
        '.codigonota))'
      '        end as clientefornecedor,'
      '        ml.naoprocessartriggers,'
      '        ml.moeda,'
      '        ml.valormoeda,'
      '        ml.pedcotacao,'
      '        ml.pedaberto,'
      '        ct.situacao,'
      '        ct.data as datacontrato,'
      '        ct.datareservado,'
      '        ct.faturamento,'
      '        p.codigovisual as produtonocontrato,'
      '        pc.quantidade as quantidadecontrato,'
      
        '       (select sum(ctd.quantidade) from contratosdevolvidos ctd ' +
        'where ctd.contrato = pc.contrato and ctd.produto = pc.produto an' +
        'd ctd.tipo = '#39'D'#39') as devolvidos,'
      
        '       (select sum(ctd.quantidade) from contratosdevolvidos ctd ' +
        'where ctd.contrato = pc.contrato and ctd.produto = pc.produto an' +
        'd ctd.tipo = '#39'T'#39') as trocados'
      ''
      ''
      'From   movimentos m join (produtoscontratos pc'
      '                        join (produtos p'
      '                              join caracteristicas c'
      '                              on p.caracteristica = c.codigo)'
      '                        on pc.produto = p.codigo)'
      ''
      ''
      
        '      on m.produto = (case when coalesce(c.composto,false) then ' +
        '(select pco.componente'
      
        '                                                                ' +
        '          from produtoscompostos pco'
      
        '                                                                ' +
        '          where pco.composto = pc.produto'
      
        '                                                                ' +
        '            and pco.componente = m.produto) else  pc.produto end' +
        ')'
      '     and m.filial = pc.filial'
      '     and m.contrato = pc.contrato'
      ''
      '     join contratos ct'
      '     on pc.contrato = ct.numero'
      ''
      '     join movimentoslotes ml'
      '     on m.numero = ml.movimento'
      ''
      'Where  (m.produto =:produto)'
      '  and m.contrato in (%ListadeContratos)'
      ''
      'Order By ml.filial, cast(ml.data as date), ml.Lancto')
    RequestLive = False
    Left = 758
    Top = 17
    ParamData = <
      item
        DataType = ftString
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qryFichaProdutoLote_Contratonumero: TIntegerField
      FieldName = 'numero'
      Required = True
    end
    object qryFichaProdutoLote_Contratolancto: TIntegerField
      FieldName = 'lancto'
    end
    object qryFichaProdutoLote_Contratodata: TDateField
      FieldName = 'data'
      Required = True
    end
    object qryFichaProdutoLote_Contratoprocessamento: TDateTimeField
      FieldName = 'processamento'
    end
    object qryFichaProdutoLote_Contratotipomovimento: TStringField
      FieldName = 'tipomovimento'
      Required = True
      Size = 3
    end
    object qryFichaProdutoLote_Contratoreferencia: TStringField
      FieldName = 'referencia'
      Size = 60
    end
    object qryFichaProdutoLote_Contratoquantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
    end
    object qryFichaProdutoLote_Contratofilial: TIntegerField
      FieldName = 'filial'
      Required = True
    end
    object qryFichaProdutoLote_Contratocontrato: TStringField
      FieldName = 'contrato'
    end
    object qryFichaProdutoLote_Contratoemestoque: TFloatField
      FieldName = 'emestoque'
      Required = True
    end
    object qryFichaProdutoLote_Contratoreservado: TFloatField
      FieldName = 'reservado'
      Required = True
    end
    object qryFichaProdutoLote_Contratotransito: TFloatField
      FieldName = 'transito'
      Required = True
    end
    object qryFichaProdutoLote_Contratodemonstracao: TFloatField
      FieldName = 'demonstracao'
      Required = True
    end
    object qryFichaProdutoLote_Contratoconserto: TFloatField
      FieldName = 'conserto'
      Required = True
    end
    object qryFichaProdutoLote_Contratofuturo: TFloatField
      FieldName = 'futuro'
      Required = True
    end
    object qryFichaProdutoLote_Contratodanificada: TFloatField
      FieldName = 'danificada'
      Required = True
    end
    object qryFichaProdutoLote_Contratoestoquefisico: TFloatField
      FieldName = 'estoquefisico'
      Required = True
    end
    object qryFichaProdutoLote_Contratoreservaprevia: TFloatField
      FieldName = 'reservaprevia'
      Required = True
    end
    object qryFichaProdutoLote_Contratoest: TStringField
      FieldName = 'est'
      Size = 50
    end
    object qryFichaProdutoLote_Contratores: TStringField
      FieldName = 'res'
      Size = 50
    end
    object qryFichaProdutoLote_Contratotra: TStringField
      FieldName = 'tra'
      Size = 50
    end
    object qryFichaProdutoLote_Contratodem: TStringField
      FieldName = 'dem'
      Size = 50
    end
    object qryFichaProdutoLote_Contratocon: TStringField
      FieldName = 'con'
      Size = 50
    end
    object qryFichaProdutoLote_Contratofut: TStringField
      FieldName = 'fut'
      Size = 50
    end
    object qryFichaProdutoLote_Contratodan: TStringField
      FieldName = 'dan'
      Size = 50
    end
    object qryFichaProdutoLote_Contratofis: TStringField
      FieldName = 'fis'
      Size = 50
    end
    object qryFichaProdutoLote_Contratoprev: TStringField
      FieldName = 'prev'
      Size = 50
    end
    object qryFichaProdutoLote_Contratouent: TStringField
      FieldName = 'uent'
      Size = 50
    end
    object qryFichaProdutoLote_Contratoucom: TStringField
      FieldName = 'ucom'
      Size = 50
    end
    object qryFichaProdutoLote_Contratofin: TStringField
      FieldName = 'fin'
      Size = 50
    end
    object qryFichaProdutoLote_Contratotven: TStringField
      FieldName = 'tven'
      Size = 50
    end
    object qryFichaProdutoLote_Contratotcom: TStringField
      FieldName = 'tcom'
      Size = 50
    end
    object qryFichaProdutoLote_Contratovalor: TFloatField
      FieldName = 'valor'
      Required = True
    end
    object qryFichaProdutoLote_Contratoprecocomicms: TFloatField
      FieldName = 'precocomicms'
    end
    object qryFichaProdutoLote_Contratoprecosemicms: TFloatField
      FieldName = 'precosemicms'
    end
    object qryFichaProdutoLote_Contratoaliquotaipi: TFloatField
      FieldName = 'aliquotaipi'
    end
    object qryFichaProdutoLote_Contratofinanceiro: TFloatField
      FieldName = 'financeiro'
      Required = True
    end
    object qryFichaProdutoLote_Contratousuariologado: TIntegerField
      FieldName = 'usuariologado'
    end
    object qryFichaProdutoLote_Contratonomeusuariologado: TStringField
      FieldName = 'nomeusuariologado'
      Size = 100
    end
    object qryFichaProdutoLote_Contratousuarioautorizacao: TIntegerField
      FieldName = 'usuarioautorizacao'
    end
    object qryFichaProdutoLote_Contratonomeusuarioautorizacao: TStringField
      FieldName = 'nomeusuarioautorizacao'
      Size = 100
    end
    object qryFichaProdutoLote_Contratocustomedio: TFloatField
      FieldName = 'customedio'
    end
    object qryFichaProdutoLote_Contratoclientefornecedor: TStringField
      FieldName = 'clientefornecedor'
      Size = 50
    end
    object qryFichaProdutoLote_Contratonaoprocessartriggers: TBooleanField
      FieldName = 'naoprocessartriggers'
    end
    object qryFichaProdutoLote_Contratomoeda: TStringField
      FieldName = 'moeda'
      Size = 10
    end
    object qryFichaProdutoLote_Contratovalormoeda: TFloatField
      FieldName = 'valormoeda'
    end
    object qryFichaProdutoLote_Contratopedcotacao: TFloatField
      FieldName = 'pedcotacao'
    end
    object qryFichaProdutoLote_Contratopedaberto: TFloatField
      FieldName = 'pedaberto'
    end
    object qryFichaProdutoLote_Contratosituacao: TStringField
      FieldName = 'situacao'
      Required = True
      Size = 1
    end
    object qryFichaProdutoLote_Contratodatacontrato: TDateField
      FieldName = 'datacontrato'
      Required = True
    end
    object qryFichaProdutoLote_Contratodatareservado: TDateField
      FieldName = 'datareservado'
    end
    object qryFichaProdutoLote_Contratofaturamento: TDateField
      FieldName = 'faturamento'
    end
    object qryFichaProdutoLote_Contratoprodutonocontrato: TStringField
      FieldName = 'produtonocontrato'
      Size = 30
    end
    object qryFichaProdutoLote_Contratoquantidadecontrato: TFloatField
      FieldName = 'quantidadecontrato'
    end
    object qryFichaProdutoLote_Contratodevolvidos: TFloatField
      FieldName = 'devolvidos'
    end
    object qryFichaProdutoLote_Contratotrocados: TFloatField
      FieldName = 'trocados'
    end
  end
  object dsrFichaProdutoLote_Contrato: TtecDataSource
    DataSet = qryFichaProdutoLote_Contrato
    Left = 758
    Top = 72
  end
  object qryFichaProdutoLote_Saldo: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkFields = 'loteproduto = loteproduto'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrFichaProdutoLote
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'Linha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CondicaoLote'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'Select ml.numero,'
      '       ml.lancto,'
      '       ml.loteproduto,'
      '       '
      '       cast(null as timestamp) as data,       '
      '       ml.processamento,'
      '       ml.data as data1,'
      '       cast(null as varchar) as tipomovimento,'
      '       cast('#39'SALDO ANTERIOR'#39' as varchar(60)) as referencia,'
      '       ml.quantidade,'
      '       cast(null as integer) as filial,'
      '       ml.emestoque,'
      '       ml.reservado,'
      '       ml.transito,'
      '       ml.demonstracao,'
      '       ml.conserto,'
      '       ml.futuro,'
      '       ml.danificada,'
      '       ml.estoquefisico,'
      '       ml.reservaprevia,'
      '       cast(substr(ml.operacao,1,1) as varchar)  as est,'
      '       cast(substr(ml.operacao,2,1) as varchar)  as res,'
      '       cast(substr(ml.operacao,3,1) as varchar)  as tra,'
      '       cast(substr(ml.operacao,4,1) as varchar)  as dem,'
      '       cast(substr(ml.operacao,5,1) as varchar)  as con,'
      '       cast(substr(ml.operacao,6,1) as varchar)  as fut,'
      '       cast(substr(ml.operacao,7,1) as varchar)  as dan,'
      '       cast(substr(ml.operacao,8,1) as varchar)  as fis,'
      '       cast(substr(ml.operacao,9,1) as varchar)  as prev,'
      '       cast(substr(ml.operacao,10,1) as varchar) as uent,'
      '       cast(substr(ml.operacao,11,1) as varchar) as ucom,'
      '       cast(substr(ml.operacao,12,1) as varchar) as fin,'
      '       cast(substr(ml.operacao,13,1) as varchar) as tven,'
      '       cast(substr(ml.operacao,14,1) as varchar) as tcom,'
      '       ml.valor,'
      '       ml.precocomicms,'
      '       ml.precosemicms,'
      '       ml.aliquotaipi,'
      '       ml.financeiro,'
      '       case when ml.codigonota is null'
      '         then (select coalesce(v.razao,v.nome) as nome'
      '               from vfornecedores v'
      
        '               where (v.codigo = ml.cliente) and (v.tipo = ml.ti' +
        'pocliente)'
      '              )'
      '         else'
      '              (select coalesce(v.razao,v.nome) as nome'
      '               from vfornecedores v'
      
        '               where (v.codigo, v.tipo) in (select n.fornecedor,' +
        'n.tipofornecedor'
      '                                            from notaspag n'
      
        '                                             where n.codigo = ml' +
        '.codigonota))'
      '       end as clientefornecedor,'
      '       ml.naoprocessartriggers,'
      '       ml.moeda,'
      '       ml.valormoeda'
      ''
      'From   movimentos m'
      '       join movimentoslotes ml'
      '       on m.numero = ml.movimento'
      ''
      
        'Where (m.produto, m.loteproduto, ml.data, ml.numero, ml.lancto) ' +
        'in'
      '  '
      '  ('
      ' '
      '      select m.produto,'
      '             m.loteproduto,'
      '             MAX(ml.data) as data,'
      '             MAX(ml.numero) as numero,'
      '             max(ml.lancto) as lancto'
      ''
      '      from movimentos m '
      '           join movimentoslotes ml '
      '           on m.numero = ml.movimento'
      '      where cast(m.data as date) < :datainicial'
      ''
      '     '
      '       and (m.produto, m.loteproduto) in'
      '      (       '
      ''
      '      select distinct m.produto, m.loteproduto'
      '      from movimentos m '
      '           join movimentoslotes ml '
      '           on m.numero = ml.movimento'
      '           '
      '      where m.produto = :produto'
      '        '
      '        %Linha'
      '        %CondicaoLote'
      '        '
      '      )  '
      '      group by m.produto, m.loteproduto'
      '      '
      '  )'
      '  '
      'order by ml.data desc, ml.numero desc, ml.lancto desc '
      ''
      ''
      ''
      ''
      ''
      '')
    RequestLive = False
    Left = 608
    Top = 129
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object IntegerField6: TIntegerField
      FieldName = 'numero'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'data'
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'processamento'
    end
    object StringField24: TStringField
      FieldName = 'tipomovimento'
      Size = 50
    end
    object StringField25: TStringField
      FieldName = 'referencia'
      Size = 60
    end
    object FloatField23: TFloatField
      FieldName = 'quantidade'
    end
    object IntegerField7: TIntegerField
      FieldName = 'filial'
    end
    object FloatField24: TFloatField
      FieldName = 'emestoque'
    end
    object FloatField25: TFloatField
      FieldName = 'reservado'
    end
    object FloatField26: TFloatField
      FieldName = 'transito'
    end
    object FloatField27: TFloatField
      FieldName = 'demonstracao'
    end
    object FloatField28: TFloatField
      FieldName = 'conserto'
    end
    object FloatField29: TFloatField
      FieldName = 'futuro'
    end
    object FloatField30: TFloatField
      FieldName = 'danificada'
    end
    object FloatField31: TFloatField
      FieldName = 'estoquefisico'
    end
    object FloatField32: TFloatField
      FieldName = 'reservaprevia'
    end
    object StringField26: TStringField
      FieldName = 'est'
      Size = 50
    end
    object StringField27: TStringField
      FieldName = 'res'
      Size = 50
    end
    object StringField28: TStringField
      FieldName = 'tra'
      Size = 50
    end
    object StringField29: TStringField
      FieldName = 'dem'
      Size = 50
    end
    object StringField30: TStringField
      FieldName = 'con'
      Size = 50
    end
    object StringField31: TStringField
      FieldName = 'fut'
      Size = 50
    end
    object StringField32: TStringField
      FieldName = 'dan'
      Size = 50
    end
    object StringField33: TStringField
      FieldName = 'fis'
      Size = 50
    end
    object StringField34: TStringField
      FieldName = 'prev'
      Size = 50
    end
    object StringField35: TStringField
      FieldName = 'uent'
      Size = 50
    end
    object StringField36: TStringField
      FieldName = 'ucom'
      Size = 50
    end
    object StringField37: TStringField
      FieldName = 'fin'
      Size = 50
    end
    object StringField38: TStringField
      FieldName = 'tven'
      Size = 50
    end
    object StringField39: TStringField
      FieldName = 'tcom'
      Size = 50
    end
    object FloatField33: TFloatField
      FieldName = 'valor'
    end
    object FloatField34: TFloatField
      FieldName = 'precocomicms'
    end
    object FloatField35: TFloatField
      FieldName = 'precosemicms'
    end
    object FloatField36: TFloatField
      FieldName = 'aliquotaipi'
    end
    object FloatField37: TFloatField
      FieldName = 'financeiro'
    end
    object StringField40: TStringField
      FieldName = 'clientefornecedor'
      Size = 50
    end
    object StringField41: TStringField
      FieldName = 'moeda'
      Size = 10
    end
    object FloatField38: TFloatField
      FieldName = 'valormoeda'
    end
    object BooleanField2: TBooleanField
      FieldName = 'naoprocessartriggers'
    end
    object qryFichaProdutoLote_Saldoloteproduto: TLargeintField
      FieldName = 'loteproduto'
    end
  end
end
