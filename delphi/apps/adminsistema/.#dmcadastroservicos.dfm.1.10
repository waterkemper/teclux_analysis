inherited dtmCadastroServicos: TdtmCadastroServicos
  Left = 258
  Top = 175
  Height = 452
  Width = 748
  object qryServicos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryServicosAfterScroll
    OnNewRecord = qryServicosNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select  codigo,'
      '        descricao,'
      '        cnae,'
      '        codigolcp116,'
      '        aliquotaissqn,'
      '        valor,'
      '        comissao,'
      '        comissaoindicador,'
      '        debitarvendaavista,'
      '        debitarvendaaprazo,'
      '        debitarabatimentos,'
      '        debitardevolucoes,'
      '        creditarvendaavista,'
      '        creditarvendaaprazo,'
      '        creditarabatimentos,'
      '        creditardevolucoes,'
      '        historicovendaavista,'
      '        historicovendaaprazo,'
      '        historicoabatimentos,'
      '        historicodevolucoes,'
      '        tipocomissao,'
      '        tipocomissaoindicador,'
      '        PISCST,        PISAliquota,'
      '        COFINSCST, COFINSAliquota,'
      '        cstissqn'
      'from servicos'
      'where codigo = :codigo')
    RequestLive = True
    Left = 100
    Top = 14
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryServicoscodigo: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryServicosdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Required = True
      Size = 70
    end
    object qryServicoscnae: TIntegerField
      DisplayLabel = 'CNAE'
      FieldName = 'cnae'
      Required = True
      DisplayFormat = '0'
    end
    object qryServicoscodigolcp116: TStringField
      FieldName = 'codigolcp116'
      Size = 6
    end
    object qryServicosaliquotaissqn: TFloatField
      DisplayLabel = 'Al'#237'quota ISSQN'
      FieldName = 'aliquotaissqn'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryServicoscomissao: TFloatField
      FieldName = 'comissao'
      DisplayFormat = '0.00'
    end
    object qryServicostipocomissao: TStringField
      FieldName = 'tipocomissao'
      Size = 1
    end
    object qryServicosvalor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'valor'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryServicosdebitarvendaavista: TIntegerField
      FieldName = 'debitarvendaavista'
      DisplayFormat = '0'
    end
    object qryServicosdebitarvendaaprazo: TIntegerField
      FieldName = 'debitarvendaaprazo'
      DisplayFormat = '0'
    end
    object qryServicosdebitarabatimentos: TIntegerField
      FieldName = 'debitarabatimentos'
      DisplayFormat = '0'
    end
    object qryServicosdebitardevolucoes: TIntegerField
      FieldName = 'debitardevolucoes'
      DisplayFormat = '0'
    end
    object qryServicoscreditarvendaavista: TIntegerField
      FieldName = 'creditarvendaavista'
      DisplayFormat = '0'
    end
    object qryServicoscreditarvendaaprazo: TIntegerField
      FieldName = 'creditarvendaaprazo'
      DisplayFormat = '0'
    end
    object qryServicoscreditarabatimentos: TIntegerField
      FieldName = 'creditarabatimentos'
      DisplayFormat = '0'
    end
    object qryServicoscreditardevolucoes: TIntegerField
      FieldName = 'creditardevolucoes'
      DisplayFormat = '0'
    end
    object qryServicoshistoricovendaavista: TIntegerField
      FieldName = 'historicovendaavista'
      DisplayFormat = '0'
    end
    object qryServicoshistoricovendaaprazo: TIntegerField
      FieldName = 'historicovendaaprazo'
      DisplayFormat = '0'
    end
    object qryServicoshistoricoabatimentos: TIntegerField
      FieldName = 'historicoabatimentos'
      DisplayFormat = '0'
    end
    object qryServicoshistoricodevolucoes: TIntegerField
      FieldName = 'historicodevolucoes'
      DisplayFormat = '0'
    end
    object qryServicospiscst: TStringField
      FieldName = 'piscst'
      Size = 2
    end
    object qryServicospisaliquota: TFloatField
      FieldName = 'pisaliquota'
      DisplayFormat = '0.00'
    end
    object qryServicoscofinscst: TStringField
      FieldName = 'cofinscst'
      Size = 2
    end
    object qryServicoscofinsaliquota: TFloatField
      FieldName = 'cofinsaliquota'
      DisplayFormat = '0.00'
    end
    object qryServicoscstissqn: TIntegerField
      DisplayLabel = 'CST ISSQN'
      FieldName = 'cstissqn'
      Required = True
    end
    object qryServicoscomissaoindicador: TFloatField
      FieldName = 'comissaoindicador'
      DisplayFormat = '0.00'
    end
    object qryServicostipocomissaoindicador: TStringField
      FieldName = 'tipocomissaoindicador'
      Size = 1
    end
  end
  object qryConsultaServicos: TtecQuery
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
      'select descricao,'
      '          codigo'
      'from servicos'
      'order by UPPER(TO_ASCII(descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 100
    Top = 131
    object qryConsultaServicosdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 70
    end
    object qryConsultaServicoscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
  object dsrServicos: TtecDataSource
    DataSet = qryServicos
    OnDataChange = dsrServicosDataChange
    Left = 100
    Top = 70
  end
  object spcServicosProximoCodigo: TtecQuery
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
      'Select servicos_proximocodigo() as codigo')
    RequestLive = False
    Left = 102
    Top = 192
    object spcServicosProximoCodigocodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
  object qryProcuraCNAE: TtecQuery
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
      'Select codigo,'
      '       descricao, denominacao,'
      '       codigoatividade'
      'From atividadeseconomicas'
      'Where codigo =:codigo')
    RequestLive = False
    Left = 280
    Top = 12
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraCNAEcodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryProcuraCNAEdescricao: TStringField
      FieldName = 'descricao'
      Size = 1000
    end
    object qryProcuraCNAEcodigoatividade: TIntegerField
      FieldName = 'codigoatividade'
      DisplayFormat = '####-#/##'
      EditFormat = '0000-0/00;0;_'
    end
    object qryProcuraCNAEdenominacao: TStringField
      FieldName = 'denominacao'
      Size = 200
    end
  end
  object dsrProcuraCNAE: TtecDataSource
    DataSet = qryProcuraCNAE
    Left = 282
    Top = 69
  end
  object qryConsultaCNAE: TtecQuery
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
      'Select descricao,'
      '       codigoatividade,'
      '       codigo'
      'From atividadeseconomicas'
      'Order By UPPER(TO_ASCII(descricao,'#39'LATIN1'#39'))'
      '           ')
    RequestLive = False
    Left = 284
    Top = 128
    object qryConsultaCNAEdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 80
      FieldName = 'descricao'
      Size = 1000
    end
    object qryConsultaCNAEcodigoatividade: TIntegerField
      DisplayLabel = 'C'#243'd. Atividade'
      FieldName = 'codigoatividade'
      DisplayFormat = '####-#/##'
      EditFormat = '0000-0/00;0;_'
    end
    object qryConsultaCNAEcodigo: TIntegerField
      FieldName = 'codigo'
      Visible = False
    end
  end
  object qryProcuraDebitaraVista: TtecQuery
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
      
        'select codigo, cast(btrim(classificacao, '#39'. '#39') as varchar) as cl' +
        'assificacao, descricao'
      'from planocontas'
      'where codigo = :codigo'
      '  and codigo <> :contacredito'
      '  and tipo = '#39'A'#39
      '  and inativo is null')
    RequestLive = False
    Left = 326
    Top = 263
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'contacredito'
        ParamType = ptUnknown
      end>
    object qryProcuraDebitaraVistacodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
    object qryProcuraDebitaraVistaclassificacao: TStringField
      FieldName = 'classificacao'
    end
    object qryProcuraDebitaraVistadescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 50
    end
  end
  object dsrProcuraDebitaraVista: TtecDataSource
    DataSet = qryProcuraDebitaraVista
    Left = 350
    Top = 272
  end
  object qryProcuraCreditaraVista: TtecQuery
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
      
        'select codigo, cast(btrim(classificacao, '#39'. '#39') as varchar) as cl' +
        'assificacao, descricao'
      'from planocontas'
      'where codigo = :codigo'
      '  and codigo <> :contadebito'
      '  and tipo = '#39'A'#39
      '  and inativo is null')
    RequestLive = False
    Left = 558
    Top = 255
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'contadebito'
        ParamType = ptUnknown
      end>
    object IntegerField3: TIntegerField
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
    object StringField6: TStringField
      FieldName = 'classificacao'
    end
    object StringField1: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 50
    end
  end
  object dsrProcuraCreditaraVista: TtecDataSource
    DataSet = qryProcuraCreditaraVista
    Left = 582
    Top = 264
  end
  object qryConsultaContaContabil: TtecQuery
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
        Name = 'consulta'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      
        'SELECT   cast(repeat('#39' '#39', length(btrim(p.classificacao)))||p.Des' +
        'cricao as varchar) as DescricaoEdentada,'
      '         p.descricao,'
      '         p.classificacao,'
      '         p.Codigo,'
      '         p.tipo'
      'FROM     planocontas p'
      'WHERE    p.Inativo IS NULL'
      '%consulta'
      
        'order by p.classificacao, UPPER(TO_ASCII(p.descricao,'#39'LATIN1'#39')),' +
        ' p.codigo')
    RequestLive = True
    Left = 569
    Top = 336
    object qryConsultaContaContabildescricaoedentada: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricaoedentada'
      Size = 52
    end
    object qryConsultaContaContabildescricao: TStringField
      FieldName = 'descricao'
      Visible = False
      Size = 50
    end
    object qryConsultaContaContabilclassificacao: TStringField
      DisplayLabel = 'Classifica'#231#227'o'
      FieldName = 'classificacao'
    end
    object qryConsultaContaContabilcodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
    object qryConsultaContaContabiltipo: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'tipo'
      Size = 1
    end
  end
  object qryProcuraHistoricoVendaaVista: TtecQuery
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
      'select codigo,'
      '         descricao'
      'from historicos'
      'where (codigo = :codigo) and contabil'
      '         ')
    RequestLive = False
    Left = 103
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraHistoricoVendaaVistacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryProcuraHistoricoVendaaVistadescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
  end
  object dsrProcuraHistoricoVendaaVista: TtecDataSource
    DataSet = qryProcuraHistoricoVendaaVista
    Left = 127
    Top = 272
  end
  object qryConsultaHistorico: TtecQuery
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
      'select descricao,'
      '         codigo'
      'from historicos'
      'where contabil'
      'order by UPPER(TO_ASCII(descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 114
    Top = 341
    object qryConsultaHistoricodescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
    object qryConsultaHistoricocodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object qryProcuraDebitaraPrazo: TtecQuery
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
      
        'select codigo, cast(btrim(classificacao, '#39'. '#39') as varchar) as cl' +
        'assificacao, descricao'
      'from planocontas'
      'where codigo = :codigo'
      '  and codigo <> :contacredito'
      '  and tipo = '#39'A'#39
      '  and inativo is null')
    RequestLive = False
    Left = 326
    Top = 271
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'contacredito'
        ParamType = ptUnknown
      end>
    object qryProcuraDebitaraPrazocodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
    object qryProcuraDebitaraPrazoclassificacao: TStringField
      FieldName = 'classificacao'
    end
    object qryProcuraDebitaraPrazodescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 50
    end
  end
  object dsrProcuraDebitaraPrazo: TtecDataSource
    DataSet = qryProcuraDebitaraPrazo
    Left = 350
    Top = 280
  end
  object qryProcuraCreditaraPrazo: TtecQuery
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
      
        'select codigo, cast(btrim(classificacao, '#39'. '#39') as varchar) as cl' +
        'assificacao, descricao'
      'from planocontas'
      'where codigo = :codigo'
      '  and codigo <> :contadebito'
      '  and tipo = '#39'A'#39
      '  and inativo is null')
    RequestLive = False
    Left = 558
    Top = 263
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'contadebito'
        ParamType = ptUnknown
      end>
    object IntegerField1: TIntegerField
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
    object StringField2: TStringField
      FieldName = 'classificacao'
    end
    object StringField3: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 50
    end
  end
  object dsrProcuraCreditaraPrazo: TtecDataSource
    DataSet = qryProcuraCreditaraPrazo
    Left = 582
    Top = 272
  end
  object qryProcuraHistoricoVendaaPrazo: TtecQuery
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
      'select codigo,'
      '         descricao'
      'from historicos'
      'where (codigo = :codigo) and contabil'
      '         ')
    RequestLive = False
    Left = 103
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraHistoricoVendaaPrazocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryProcuraHistoricoVendaaPrazodescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
  end
  object dsrProcuraHistoricoVendaaPrazo: TtecDataSource
    DataSet = qryProcuraHistoricoVendaaPrazo
    Left = 127
    Top = 280
  end
  object qryProcuraDebitarAbatimentos: TtecQuery
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
      
        'select codigo, cast(btrim(classificacao, '#39'. '#39') as varchar) as cl' +
        'assificacao, descricao'
      'from planocontas'
      'where codigo = :codigo'
      '  and codigo <> :contacredito'
      '  and tipo = '#39'A'#39
      '  and inativo is null')
    RequestLive = False
    Left = 326
    Top = 287
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'contacredito'
        ParamType = ptUnknown
      end>
    object qryProcuraDebitarAbatimentoscodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
    object qryProcuraDebitarAbatimentosclassificacao: TStringField
      FieldName = 'classificacao'
    end
    object qryProcuraDebitarAbatimentosdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 50
    end
  end
  object dsrProcuraDebitarAbatimentos: TtecDataSource
    DataSet = qryProcuraDebitarAbatimentos
    Left = 350
    Top = 296
  end
  object qryProcuraCreditarAbatimentos: TtecQuery
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
      
        'select codigo, cast(btrim(classificacao, '#39'. '#39') as varchar) as cl' +
        'assificacao, descricao'
      'from planocontas'
      'where codigo = :codigo'
      '  and codigo <> :contadebito'
      '  and tipo = '#39'A'#39
      '  and inativo is null')
    RequestLive = False
    Left = 558
    Top = 271
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'contadebito'
        ParamType = ptUnknown
      end>
    object IntegerField2: TIntegerField
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
    object StringField4: TStringField
      FieldName = 'classificacao'
    end
    object StringField5: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 50
    end
  end
  object dsrProcuraCreditarAbatimentos: TtecDataSource
    DataSet = qryProcuraCreditarAbatimentos
    Left = 582
    Top = 280
  end
  object qryProcuraHistoricoAbatimentos: TtecQuery
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
      'select codigo,'
      '         descricao'
      'from historicos'
      'where (codigo = :codigo) and contabil'
      '         ')
    RequestLive = False
    Left = 103
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraHistoricoAbatimentoscodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryProcuraHistoricoAbatimentosdescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
  end
  object dsrProcuraHistoricoAbatimentos: TtecDataSource
    DataSet = qryProcuraHistoricoAbatimentos
    Left = 127
    Top = 288
  end
  object qryProcuraDebitarDevolucoes: TtecQuery
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
      
        'select codigo, cast(btrim(classificacao, '#39'. '#39') as varchar) as cl' +
        'assificacao, descricao'
      'from planocontas'
      'where codigo = :codigo'
      '  and codigo <> :contacredito'
      '  and tipo = '#39'A'#39
      '  and inativo is null')
    RequestLive = False
    Left = 326
    Top = 295
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'contacredito'
        ParamType = ptUnknown
      end>
    object qryProcuraDebitarDevolucoescodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
    object qryProcuraDebitarDevolucoesclassificacao: TStringField
      FieldName = 'classificacao'
    end
    object qryProcuraDebitarDevolucoesdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 50
    end
  end
  object dsrProcuraDebitarDevolucoes: TtecDataSource
    DataSet = qryProcuraDebitarDevolucoes
    Left = 350
    Top = 304
  end
  object qryProcuraCreditarDevolucoes: TtecQuery
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
      
        'select codigo, cast(btrim(classificacao, '#39'. '#39') as varchar) as cl' +
        'assificacao, descricao'
      'from planocontas'
      'where codigo = :codigo'
      '  and codigo <> :contadebito'
      '  and tipo = '#39'A'#39
      '  and inativo is null')
    RequestLive = False
    Left = 558
    Top = 279
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'contadebito'
        ParamType = ptUnknown
      end>
    object IntegerField4: TIntegerField
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
    object StringField8: TStringField
      FieldName = 'classificacao'
    end
    object StringField9: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 50
    end
  end
  object dsrProcuraCreditarDevolucoes: TtecDataSource
    DataSet = qryProcuraCreditarDevolucoes
    Left = 582
    Top = 288
  end
  object qryProcuraHistoricoDevolucoes: TtecQuery
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
      'select codigo,'
      '         descricao'
      'from historicos'
      'where (codigo = :codigo) and contabil'
      '         ')
    RequestLive = False
    Left = 103
    Top = 296
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
        Value = 'FLK'
      end>
    object qryProcuraHistoricoDevolucoescodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryProcuraHistoricoDevolucoesdescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
  end
  object dsrProcuraHistoricoDevolucoes: TtecDataSource
    DataSet = qryProcuraHistoricoDevolucoes
    Left = 127
    Top = 304
  end
  object qryParametrosContas: TtecQuery
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
      'select * '
      'from parametroscontas'
      'where tipo='#39'S'#39)
    RequestLive = True
    Left = 392
    Top = 80
    object qryParametrosContasdebitarvendaavista: TIntegerField
      FieldName = 'debitarvendaavista'
    end
    object qryParametrosContasdebitarvendaaprazo: TIntegerField
      FieldName = 'debitarvendaaprazo'
    end
    object qryParametrosContasdebitarabatimentos: TIntegerField
      FieldName = 'debitarabatimentos'
    end
    object qryParametrosContasdebitardevolucoes: TIntegerField
      FieldName = 'debitardevolucoes'
    end
    object qryParametrosContascreditarvendaavista: TIntegerField
      FieldName = 'creditarvendaavista'
    end
    object qryParametrosContascreditarvendaaprazo: TIntegerField
      FieldName = 'creditarvendaaprazo'
    end
    object qryParametrosContascreditarabatimentos: TIntegerField
      FieldName = 'creditarabatimentos'
    end
    object qryParametrosContascreditardevolucoes: TIntegerField
      FieldName = 'creditardevolucoes'
    end
    object qryParametrosContashistoricovendaavista: TIntegerField
      FieldName = 'historicovendaavista'
    end
    object qryParametrosContashistoricovendaaprazo: TIntegerField
      FieldName = 'historicovendaaprazo'
    end
    object qryParametrosContashistoricoabatimentos: TIntegerField
      FieldName = 'historicoabatimentos'
    end
    object qryParametrosContashistoricodevolucoes: TIntegerField
      FieldName = 'historicodevolucoes'
    end
  end
  object dsrParametrosContas: TtecDataSource
    DataSet = qryParametrosContas
    Left = 424
    Top = 96
  end
  object qryListaAtividadesEconomicasMunicipios: TtecQuery
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
      ' select ae.codigo,'
      '       ae_m.codigoatividademunicipio,'
      '       ae_m.idcnae,'
      '       ae_m.cidadeibge,'
      '       c.nome,'
      '       ae_m.aliquota,'
      '       ae_m.descricao,'
      '       ae_m.dtcancelamento,'
      '       (select true '
      '        from servicosatividadeseconomicasmunicipios saem'
      '        where saem.servico = :servico'
      '          and saem.atividade = ae.codigo'
      
        '          and saem.codigoatividademunicipio = ae_m.codigoativida' +
        'demunicipio) as ativo'
      ''
      'from atividadeseconomicas_municipios  ae_m'
      '     join atividadeseconomicas ae'
      '     on ae_m.subclasse = ae.codigoatividade'
      '     and ae_m.item = ae.item'
      '     and ae_m.subitem = ae.subitem'
      ''
      '     join cidades c on (c.estado, c.codigo) in'
      '     (select c2.estado, c2.codigo'
      '      from cidades c2'
      '      where c2.codigoibge = ae_m.cidadeibge'
      '      order by c2.codigo desc limit 1)'
      '     '
      'where ae.codigo = :codigo     '
      'order by c.nome, ativo, ae_m.descricao'
      '')
    RequestLive = True
    Left = 528
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'servico'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryListaAtividadesEconomicasMunicipioscodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryListaAtividadesEconomicasMunicipioscodigoatividademunicipio: TIntegerField
      FieldName = 'codigoatividademunicipio'
    end
    object qryListaAtividadesEconomicasMunicipioscidadeibge: TIntegerField
      FieldName = 'cidadeibge'
    end
    object qryListaAtividadesEconomicasMunicipiosnome: TStringField
      FieldName = 'nome'
      Size = 72
    end
    object qryListaAtividadesEconomicasMunicipiosaliquota: TFloatField
      FieldName = 'aliquota'
    end
    object qryListaAtividadesEconomicasMunicipiosdescricao: TStringField
      FieldName = 'descricao'
      Size = 512
    end
    object qryListaAtividadesEconomicasMunicipiosdtcancelamento: TDateField
      FieldName = 'dtcancelamento'
    end
    object qryListaAtividadesEconomicasMunicipiosativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryListaAtividadesEconomicasMunicipiosidcnae: TIntegerField
      FieldName = 'idcnae'
    end
  end
  object dsrListaAtividadesEconomicasMunicipios: TtecDataSource
    DataSet = qryListaAtividadesEconomicasMunicipios
    Left = 536
    Top = 120
  end
  object qryservicosAtividadesEconomicasMunicipios: TtecQuery
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
      'select saem.*,'
      '       (select ae_m.cidadeibge'
      '        from atividadeseconomicas_municipios ae_m'
      
        '        where ae_m.codigoatividademunicipio = saem.codigoativida' +
        'demunicipio) as cidadeibge'
      'from servicosatividadeseconomicasmunicipios saem'
      'where saem.servico = :servico'
      '  and saem.atividade = :atividade'
      '')
    RequestLive = True
    Left = 528
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'servico'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'atividade'
        ParamType = ptUnknown
      end>
    object qryservicosAtividadesEconomicasMunicipiosatividade: TIntegerField
      FieldName = 'atividade'
      Required = True
    end
    object qryservicosAtividadesEconomicasMunicipioscodigoatividademunicipio: TIntegerField
      FieldName = 'codigoatividademunicipio'
      Required = True
    end
    object qryservicosAtividadesEconomicasMunicipioscidadeibge: TIntegerField
      FieldName = 'cidadeibge'
    end
    object qryservicosAtividadesEconomicasMunicipiosservico: TIntegerField
      FieldName = 'servico'
    end
  end
end
