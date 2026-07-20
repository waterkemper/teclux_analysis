inherited dtmLancamentosManuais: TdtmLancamentosManuais
  Left = 487
  Top = 233
  Height = 472
  Width = 905
  object qryMovimentosAnteriores: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'Select      m.emestoque,'
      '            m.reservado,'
      '            m.transito,'
      '            m.demonstracao,'
      '            m.futuro,'
      '            m.danificada,'
      '            m.conserto,'
      '            m.financeiro,'
      '            m.precosemicms,'
      '            m.precocomicms,'
      '            m.data,'
      '            m.tipomovimento,'
      '            m.referencia,'
      '            m.quantidade,'
      '            m.valor,'
      '            l.nrlote'
      ''
      ''
      'From  movimentos m'
      '      left join lotes l'
      '      on m.loteproduto = l.lote'
      ''
      'Where (m.produto = :produto) and'
      '      (m.filial = :filial)'
      ''
      'Order By m.numero desc'
      ''
      'Limit 10')
    RequestLive = True
    Left = 483
    Top = 12
    ParamData = <
      item
        DataType = ftString
        Name = 'produto'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'filial'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryMovimentosAnterioresemestoque: TFloatField
      FieldName = 'emestoque'
      DisplayFormat = '0'
    end
    object qryMovimentosAnterioresreservado: TFloatField
      FieldName = 'reservado'
      DisplayFormat = '0'
    end
    object qryMovimentosAnteriorestransito: TFloatField
      FieldName = 'transito'
      DisplayFormat = '0'
    end
    object qryMovimentosAnterioresdemonstracao: TFloatField
      FieldName = 'demonstracao'
      DisplayFormat = '0'
    end
    object qryMovimentosAnterioresfuturo: TFloatField
      FieldName = 'futuro'
      DisplayFormat = '0'
    end
    object qryMovimentosAnterioresdanificada: TFloatField
      FieldName = 'danificada'
      DisplayFormat = '0'
    end
    object qryMovimentosAnterioresconserto: TFloatField
      FieldName = 'conserto'
      DisplayFormat = '0'
    end
    object qryMovimentosAnterioresfinanceiro: TFloatField
      FieldName = 'financeiro'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryMovimentosAnterioresdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object qryMovimentosAnteriorestipomovimento: TStringField
      FieldName = 'tipomovimento'
      Size = 3
    end
    object qryMovimentosAnterioresreferencia: TStringField
      FieldName = 'referencia'
      Size = 60
    end
    object qryMovimentosAnterioresquantidade: TFloatField
      FieldName = 'quantidade'
      DisplayFormat = '0'
    end
    object qryMovimentosAnterioresvalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryMovimentosAnterioresprecosemicms: TFloatField
      FieldName = 'precosemicms'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryMovimentosAnterioresprecocomicms: TFloatField
      FieldName = 'precocomicms'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryMovimentosAnterioresnrlote: TStringField
      DisplayLabel = 'N'#186' Lote'
      FieldName = 'nrlote'
      Size = 30
    end
  end
  object dsrMovimentosAnteriores: TtecDataSource
    DataSet = qryMovimentosAnteriores
    Left = 649
    Top = 12
  end
  object dsrMovimentos: TtecDataSource
    DataSet = qryMovimentos
    OnDataChange = dsrMovimentosDataChange
    Left = 349
    Top = 12
  end
  object qryMovimentos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterInsert = qryMovimentosAfterInsert
    BeforeDelete = BeforeDelete
    OnDeleteError = PostError
    OnEditError = PostError
    OnPostError = PostError
    OnNewRecord = qryMovimentosNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'Select m.numero, '
      '           m.produto,'
      '           p.codigovisual as produtovisual,  '
      '           m.filial,'
      '           m.data,'
      '           m.tipomovimento,'
      '           m.quantidade,'
      '           m.valor,'
      '           m.precosemicms,'
      '           m.precocomicms,'
      '           m.aliquotaipi,'
      '           m.referencia,'
      '           m.usuariologado,'
      '           m.usuarioautorizacao,'
      '           m.trffilial as filialtrasnferencia,'
      '           m.valorultimacompra,'
      '           m.loteproduto,'
      '           l.nrlote,'
      '           l.fabricacao,'
      '           l.validade,'
      '           false as InsercaoCancelada'
      ''
      'From   movimentos m'
      '       join produtos p'
      '       on m.produto = p.codigo'
      ''
      '       left join lotes l'
      '       on m.loteproduto = l.lote'
      ''
      'Where m.numero = :numero')
    RequestLive = True
    Left = 64
    Top = 12
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryMovimentosnumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryMovimentosproduto: TLargeintField
      DisplayLabel = 'Produto'
      FieldName = 'produto'
      Required = True
      OnChange = qryMovimentosfilialChange
      DisplayFormat = '0'
    end
    object qryMovimentosprodutovisual: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'produtovisual'
      Required = True
      Size = 30
    end
    object qryMovimentosfilial: TIntegerField
      DisplayLabel = 'Filial'
      FieldName = 'filial'
      Required = True
      OnChange = qryMovimentosfilialChange
      DisplayFormat = '0'
    end
    object qryMovimentosdata: TDateField
      Alignment = taCenter
      DisplayLabel = 'DAta'
      FieldName = 'data'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryMovimentostipomovimento: TStringField
      DisplayLabel = 'Tipo Movimento'
      FieldName = 'tipomovimento'
      Required = True
      Size = 3
    end
    object qryMovimentosquantidade: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
      DisplayFormat = '0'
    end
    object qryMovimentosvalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryMovimentosreferencia: TStringField
      FieldName = 'referencia'
      Size = 60
    end
    object qryMovimentosfilialtrasnferencia: TIntegerField
      FieldName = 'filialtrasnferencia'
      DisplayFormat = '0'
    end
    object qryMovimentosprecosemicms: TFloatField
      FieldName = 'precosemicms'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryMovimentosprecocomicms: TFloatField
      FieldName = 'precocomicms'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryMovimentosaliquotaipi: TFloatField
      FieldName = 'aliquotaipi'
      DisplayFormat = '0.00'
    end
    object qryMovimentosusuariologado: TIntegerField
      FieldName = 'usuariologado'
      DisplayFormat = '0'
    end
    object qryMovimentosusuarioautorizacao: TIntegerField
      FieldName = 'usuarioautorizacao'
      DisplayFormat = '0'
    end
    object qryMovimentosvalorultimacompra: TFloatField
      FieldName = 'valorultimacompra'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryMovimentosinsercaocancelada: TBooleanField
      FieldName = 'insercaocancelada'
    end
    object qryMovimentosnrlote: TStringField
      DisplayLabel = 'N'#186' Lote'
      FieldName = 'nrlote'
      Size = 30
    end
    object qryMovimentosloteproduto: TLargeintField
      FieldName = 'loteproduto'
    end
    object qryMovimentosfabricacao: TDateField
      Alignment = taCenter
      FieldName = 'fabricacao'
      EditMask = '99/99/9999;1; '
    end
    object qryMovimentosvalidade: TDateField
      Alignment = taCenter
      FieldName = 'validade'
      EditMask = '99/99/9999;1; '
    end
  end
  object qryExisteEstoque: TtecQuery
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
      'Select e.emestoque,'
      '          e.reservado,'
      '          e.transito,'
      '          e.demonstracao,'
      '          e.conserto,'
      '          e.futuro,'
      '          e.danificada,'
      '          e.reservaprevia,'
      '          e.estoquefisico,'
      '          e.precocomicms,'
      '          e.precosemicms,e.financeiro,'
      
        '          Case when   (emestoque+reservado+transito+demonstracao' +
        '+conserto+danificada+reservaprevia) > 0 then'
      
        '                 (e.financeiro / (emestoque+reservado+transito+d' +
        'emonstracao+conserto+danificada+reservaprevia))'
      '               else'
      '                 0'
      '          end as customedio,'
      '          valorultimacompra'
      ''
      
        'From  estoques e/* left join movimentos m on e.produto=m.produto' +
        ' and e.filial=m.filial and'
      '                            m.numero = (Select max(m1.numero) '
      '                                       From movimentos m1'
      
        '                                       Where (m1.produto =m.prod' +
        'uto) and'
      
        '                                                 (m1.filial =m.f' +
        'ilial))*/'
      'where e.produto =:produto and'
      '          e.filial = :filial')
    RequestLive = False
    Left = 519
    Top = 267
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'filial'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryExisteEstoqueemestoque: TFloatField
      FieldName = 'emestoque'
      Required = True
      DisplayFormat = '0'
    end
    object qryExisteEstoquereservado: TFloatField
      FieldName = 'reservado'
      Required = True
      DisplayFormat = '0'
    end
    object qryExisteEstoquetransito: TFloatField
      FieldName = 'transito'
      Required = True
      DisplayFormat = '0'
    end
    object qryExisteEstoquedemonstracao: TFloatField
      FieldName = 'demonstracao'
      DisplayFormat = '0'
    end
    object qryExisteEstoqueconserto: TFloatField
      FieldName = 'conserto'
      Required = True
      DisplayFormat = '0'
    end
    object qryExisteEstoquefuturo: TFloatField
      FieldName = 'futuro'
      Required = True
      DisplayFormat = '0'
    end
    object qryExisteEstoquedanificada: TFloatField
      FieldName = 'danificada'
      DisplayFormat = '0'
    end
    object qryExisteEstoqueprecocomicms: TFloatField
      FieldName = 'precocomicms'
      DisplayFormat = '0.00'
    end
    object qryExisteEstoqueprecosemicms: TFloatField
      FieldName = 'precosemicms'
      DisplayFormat = '0.00'
    end
    object qryExisteEstoquecustomedio: TFloatField
      FieldName = 'customedio'
      DisplayFormat = '0.00'
    end
    object qryExisteEstoquefinanceiro: TFloatField
      FieldName = 'financeiro'
      DisplayFormat = '0.00'
    end
    object qryExisteEstoquereservaprevia: TFloatField
      FieldName = 'reservaprevia'
      Required = True
    end
    object qryExisteEstoqueestoquefisico: TFloatField
      FieldName = 'estoquefisico'
      Required = True
    end
    object qryExisteEstoquevalorultimacompra: TFloatField
      FieldName = 'valorultimacompra'
    end
  end
  object qryProcuraFiliais: TtecQuery
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
      'Select codigo, '
      '           nome'
      'From   filiais'
      'Where codigo = :codigo')
    RequestLive = True
    Left = 88
    Top = 138
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraFiliaiscodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryProcuraFiliaisnome: TStringField
      DisplayWidth = 40
      FieldName = 'nome'
      Size = 60
    end
  end
  object qryProcuraTiposMovimentos: TtecQuery
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
      'Select codigo, '
      '           descricao, '
      '           transferencia, '
      '           operacao'
      'From   tiposmovimentos'
      'Where (codigo = :codigo) and'
      '          not interno and'
      '          (operacao <> '#39'********************'#39')')
    RequestLive = True
    Left = 88
    Top = 202
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraTiposMovimentoscodigo: TStringField
      FieldName = 'codigo'
      Size = 3
    end
    object qryProcuraTiposMovimentosdescricao: TStringField
      FieldName = 'descricao'
      Size = 70
    end
    object qryProcuraTiposMovimentostransferencia: TStringField
      FieldName = 'transferencia'
      Size = 3
    end
    object qryProcuraTiposMovimentosoperacao: TStringField
      FieldName = 'operacao'
    end
  end
  object dsrProcuraFiliais: TtecDataSource
    DataSet = qryProcuraFiliais
    Left = 285
    Top = 138
  end
  object dsrProcuraTiposMovimentos: TtecDataSource
    DataSet = qryProcuraTiposMovimentos
    Left = 285
    Top = 202
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
      'Select codigo, '
      '           descricao'
      'From   tiposmovimentos'
      'Where not interno and'
      '          (operacao <> '#39'********************'#39')'
      'Order By UPPER(TO_ASCII(descricao,'#39'latin1'#39'))')
    RequestLive = False
    Left = 483
    Top = 202
    object qryConsultaTiposMovimentosdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 70
      FieldName = 'descricao'
      Size = 70
    end
    object qryConsultaTiposMovimentoscodigo: TStringField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'codigo'
      Size = 3
    end
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
      'Select codigo, '
      '           nome'
      'From   filiais'
      'Order By UPPER(TO_ASCII(nome,'#39'latin1'#39'))')
    RequestLive = False
    Left = 483
    Top = 138
    object qryConsultaFiliaisnome: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 50
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaFiliaiscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
  end
  object spcMovimentosProximo: TtecQuery
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
      'select movimentos_proximonumero() as numero')
    RequestLive = False
    Left = 653
    Top = 76
    object spcMovimentosProximonumero: TIntegerField
      FieldName = 'numero'
    end
  end
  object qryProcuraFiliaisTransferencia: TtecQuery
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
      'Select codigo, '
      '           nome'
      'From   filiais'
      'Where codigo = :codigo')
    RequestLive = True
    Left = 88
    Top = 267
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraFiliaisTransferenciacodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryProcuraFiliaisTransferencianome: TStringField
      DisplayWidth = 40
      FieldName = 'nome'
      Size = 60
    end
  end
  object dsrProcuraFiliaisTransferencia: TtecDataSource
    DataSet = qryProcuraFiliaisTransferencia
    Left = 285
    Top = 267
  end
  object dsrExisteEstoque: TtecDataSource
    DataSet = qryExisteEstoque
    Left = 616
    Top = 280
  end
  object qryAtualizaValorUltimaCompra: TtecQuery
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
      'UPDATE estoques'
      'SET valorultimacompra = :valor'
      'WHERE produto = :produto')
    RequestLive = False
    Left = 427
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'valor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end>
  end
  object qryMovimentosAux: TtecQuery
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
      
        'select round(m.financeiro / (m.emestoque+m.reservado+m.reservapr' +
        'evia+m.transito+m.demonstracao+m.conserto+m.danificada), 2) as c' +
        'ustomedio'
      'from movimentos m'
      'where m.produto = :produto'
      '  and m.filial = :filial'
      '  and m.data <= :data'
      
        '  and (m.emestoque+m.reservado+m.reservaprevia+m.transito+m.demo' +
        'nstracao+m.conserto+m.danificada) <> 0'
      '  and m.financeiro > 0'
      'order by  data desc, lancto desc limit 1')
    RequestLive = False
    Left = 56
    Top = 336
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'data'
        ParamType = ptUnknown
      end>
    object qryMovimentosAuxcustomedio: TFloatField
      FieldName = 'customedio'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
  end
  object qryMovimentos_Copia: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeDelete = BeforeDelete
    OnDeleteError = PostError
    OnEditError = PostError
    OnPostError = PostError
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'Select m.numero, '
      '           m.produto,'
      '           p.codigovisual as produtovisual,  '
      '           m.filial,'
      '           m.data,'
      '           m.tipomovimento,'
      '           m.quantidade,'
      '           m.valor,'
      '           m.precosemicms,'
      '           m.precocomicms,'
      '           m.aliquotaipi,'
      '           m.referencia,'
      '           m.usuariologado,'
      '           m.usuarioautorizacao,'
      '           m.trffilial as filialtrasnferencia,'
      '           m.valorultimacompra,'
      '           false as InsercaoCancelada'
      'From   movimentos m join produtos p on m.produto = p.codigo'
      'Where m.numero = 0')
    RequestLive = True
    Left = 200
    Top = 12
    object qryMovimentos_Copianumero: TIntegerField
      FieldName = 'numero'
    end
    object qryMovimentos_Copiaproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryMovimentos_Copiaprodutovisual: TStringField
      FieldName = 'produtovisual'
      Size = 30
    end
    object qryMovimentos_Copiafilial: TIntegerField
      FieldName = 'filial'
    end
    object qryMovimentos_Copiadata: TDateField
      FieldName = 'data'
    end
    object qryMovimentos_Copiatipomovimento: TStringField
      FieldName = 'tipomovimento'
      Size = 3
    end
    object qryMovimentos_Copiaquantidade: TFloatField
      FieldName = 'quantidade'
    end
    object qryMovimentos_Copiavalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryMovimentos_Copiareferencia: TStringField
      FieldName = 'referencia'
      Size = 60
    end
    object qryMovimentos_Copiafilialtrasnferencia: TIntegerField
      FieldName = 'filialtrasnferencia'
    end
    object qryMovimentos_Copiaprecosemicms: TFloatField
      FieldName = 'precosemicms'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryMovimentos_Copiaprecocomicms: TFloatField
      FieldName = 'precocomicms'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryMovimentos_Copiaaliquotaipi: TFloatField
      FieldName = 'aliquotaipi'
    end
    object qryMovimentos_Copiausuariologado: TIntegerField
      FieldName = 'usuariologado'
    end
    object qryMovimentos_Copiausuarioautorizacao: TIntegerField
      FieldName = 'usuarioautorizacao'
    end
    object qryMovimentos_Copiavalorultimacompra: TFloatField
      FieldName = 'valorultimacompra'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryMovimentos_Copiainsercaocancelada: TBooleanField
      FieldName = 'insercaocancelada'
    end
  end
  object qryExisteEstoqueLotes: TtecQuery
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
      'Select el.emestoque,'
      '       el.reservado,'
      '       el.transito,'
      '       el.demonstracao,'
      '       el.conserto,'
      '       el.futuro,'
      '       el.danificada,'
      '       el.reservaprevia,'
      '       el.estoquefisico,'
      '       el.precocomicms,'
      '       el.precosemicms,'
      '       el.financeiro,'
      ''
      '       Case when   (el.emestoque+'
      '                    el.reservado+'
      '                    el.transito+'
      '                    el.demonstracao+'
      '                    el.conserto+'
      '                    el.danificada+el.reservaprevia) > 0 then'
      ''
      '               (el.financeiro / (el.emestoque+'
      '                                 el.reservado+'
      '                                 el.transito+'
      '                                 el.demonstracao+'
      '                                 el.conserto+'
      '                                 el.danificada+'
      '                                 el.reservaprevia))'
      ''
      '               else'
      '                 0'
      '          end as customedio,'
      ''
      '          el.valorultimacompra'
      ''
      
        'From  estoqueslotes el   /* left join movimentos m on el.produto' +
        '=m.produto and el.filial=m.filial and'
      '                            m.numero = (Select max(m1.numero)'
      '                                       From movimentos m1'
      
        '                                       Where (m1.produto =m.prod' +
        'uto) and'
      
        '                                                 (m1.filial =m.f' +
        'ilial))*/'
      '                                                 '
      'where el.produto = :produto and'
      '      el.lote = :lote and'
      '      el.filial = :filial')
    RequestLive = False
    Left = 520
    Top = 323
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'lote'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'filial'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryExisteEstoqueLotesemestoque: TFloatField
      FieldName = 'emestoque'
    end
    object qryExisteEstoqueLotesreservado: TFloatField
      FieldName = 'reservado'
    end
    object qryExisteEstoqueLotestransito: TFloatField
      FieldName = 'transito'
    end
    object qryExisteEstoqueLotesdemonstracao: TFloatField
      FieldName = 'demonstracao'
    end
    object qryExisteEstoqueLotesconserto: TFloatField
      FieldName = 'conserto'
    end
    object qryExisteEstoqueLotesfuturo: TFloatField
      FieldName = 'futuro'
    end
    object qryExisteEstoqueLotesdanificada: TFloatField
      FieldName = 'danificada'
    end
    object qryExisteEstoqueLotesprecocomicms: TFloatField
      FieldName = 'precocomicms'
    end
    object qryExisteEstoqueLotesprecosemicms: TFloatField
      FieldName = 'precosemicms'
    end
    object qryExisteEstoqueLotescustomedio: TFloatField
      FieldName = 'customedio'
    end
    object qryExisteEstoqueLotesfinanceiro: TFloatField
      FieldName = 'financeiro'
    end
    object qryExisteEstoqueLotesreservaprevia: TFloatField
      FieldName = 'reservaprevia'
    end
    object qryExisteEstoqueLotesestoquefisico: TFloatField
      FieldName = 'estoquefisico'
    end
    object qryExisteEstoqueLotesvalorultimacompra: TFloatField
      FieldName = 'valorultimacompra'
    end
  end
  object dsrExisteEstoqueLotes: TtecDataSource
    DataSet = qryExisteEstoqueLotes
    Left = 620
    Top = 352
  end
end
