object fraConsultaContabil: TfraConsultaContabil
  Left = 0
  Top = 0
  Width = 520
  Height = 531
  TabOrder = 0
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
    Macros = <
      item
        DataType = ftUnknown
        Name = 'consulta'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select descricao, codigo'
      'from historicos'
      'where inativo is null'
      '%consulta'
      'order by UPPER(TO_ASCII(descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 89
    Top = 248
    object qryConsultaHistoricodescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 50
    end
    object qryConsultaHistoricocodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
  end
  object dsrProcuraHistorico: TtecDataSource
    DataSet = qryProcuraHistorico
    Left = 62
    Top = 232
  end
  object qryProcuraHistorico: TtecQuery
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
      'Select  descricao,'
      '        codigo'
      'From    historicos'
      'Where   codigo = :codigo'
      '  and   inativo is null')
    RequestLive = False
    Left = 30
    Top = 215
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraHistoricodescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
    object qryProcuraHistoricocodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
  object qryConsultaConta: TtecQuery
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
        Name = 'SQLListaTipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'inativo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SQLListaContaContabil'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      
        'SELECT   cast(repeat('#39' '#39', length(btrim(classificacao)))||Descric' +
        'ao as varchar) as DescricaoEdentada,'
      '         descricao,'
      '         classificacao,'
      '         Codigo,'
      '         tipo'
      'FROM     planocontas'
      'where codigo <> :codigo'
      '%SQLListaTipo'
      '%inativo'
      '%SQLListaContaContabil'
      
        'order by classificacao, UPPER(TO_ASCII(descricao,'#39'LATIN1'#39')), cod' +
        'igo')
    RequestLive = False
    Left = 33
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryConsultaContadescricaoedentada: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 70
      FieldName = 'descricaoedentada'
      Size = 70
    end
    object qryConsultaContadescricao: TStringField
      DisplayWidth = 70
      FieldName = 'descricao'
      Visible = False
      Size = 70
    end
    object qryConsultaContaclassificacao: TStringField
      DisplayLabel = 'Classifica'#231#227'o'
      FieldName = 'classificacao'
    end
    object qryConsultaContacodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
    object qryConsultaContatipo: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'tipo'
      Size = 1
    end
  end
  object dsrProcuraDebitar: TtecDataSource
    DataSet = qryProcuraDebitar
    Left = 86
    Top = 456
  end
  object qryProcuraDebitar: TtecQuery
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
        Name = 'SQLListaTipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'inativo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SQLListaContaContabil'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'SELECT Codigo,'
      
        '       CAST(BTRIM(Classificacao, '#39'. '#39') AS VARCHAR) as Classifica' +
        'cao,'
      '       Descricao, tipo'
      ''
      'FROM   planocontas'
      ''
      'WHERE  Codigo  = :Codigo'
      '  AND  Codigo <> :ContaCredito'
      '  %SQLListaTipo'
      '  %inativo'
      '  %SQLListaContaContabil'
      '')
    RequestLive = False
    Left = 48
    Top = 452
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'contacredito'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryProcuraDebitarcodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryProcuraDebitarclassificacao: TStringField
      FieldName = 'classificacao'
      Size = 50
    end
    object qryProcuraDebitardescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
    object qryProcuraDebitartipo: TStringField
      FieldName = 'tipo'
      Size = 1
    end
  end
  object qryProcuraCreditar: TtecQuery
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
        Name = 'SQLListaTipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'inativo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SQLListaContaContabil'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'SELECT Codigo,'
      
        '       CAST(BTRIM(Classificacao, '#39'. '#39') AS VARCHAR) as Classifica' +
        'cao,'
      '       Descricao, tipo'
      ''
      'FROM   planocontas'
      ''
      'WHERE  Codigo  = :Codigo'
      '  AND  Codigo <> :ContaDebito'
      '  %SQLListaTipo'
      '  %inativo'
      '  %SQLListaContaContabil'
      '')
    RequestLive = False
    Left = 54
    Top = 487
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'contadebito'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryProcuraCreditarcodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryProcuraCreditarclassificacao: TStringField
      FieldName = 'classificacao'
      Size = 50
    end
    object qryProcuraCreditardescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
    object qryProcuraCreditartipo: TStringField
      FieldName = 'tipo'
      Size = 1
    end
  end
  object dsrProcuraCreditar: TtecDataSource
    DataSet = qryProcuraCreditar
    Left = 86
    Top = 488
  end
  object qryProcuraEventos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeOpen = qryProcuraEventosBeforeOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'condicoes'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select'
      ' codigo,'
      ' classificacao,'
      ' descricao,'
      ' inativo,'
      ' tipo,'
      ' tipomovimentacao'
      'from eventos e'
      'where e.codigo = :codigo'
      '%condicoes')
    RequestLive = False
    Left = 32
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraEventoscodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryProcuraEventosclassificacao: TStringField
      FieldName = 'classificacao'
    end
    object qryProcuraEventosdescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
    object qryProcuraEventosinativo: TDateField
      Alignment = taCenter
      FieldName = 'inativo'
      EditMask = '99/99/9999;1; '
    end
    object qryProcuraEventostipo: TStringField
      FieldName = 'tipo'
      Size = 1
    end
    object qryProcuraEventostipomovimentacao: TStringField
      FieldName = 'tipomovimentacao'
      Size = 1
    end
  end
  object dsrProcuraEventos: TtecDataSource
    DataSet = qryProcuraEventos
    Left = 56
    Top = 104
  end
  object qryConsultaEventos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeOpen = qryConsultaEventosBeforeOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'condicoes'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select e.codigo,'
      '       e.classificacao,'
      '       e.descricao,'
      '       e.inativo,'
      '       CASE WHEN e.Tipo = '#39'S'#39' THEN Cast('#39' '#39' AS CHAR)'
      
        '                            ELSE Case WHEN (e.TipoMovimentacao i' +
        'n ('#39'S'#39','#39'T'#39')) THEN'
      '                                      Cast('#39'-'#39' as CHAR)'
      '                                 ELSE Cast('#39'+'#39' as CHAR) END'
      '       END as TipoEvento,'
      '       CASE WHEN Tipo = '#39'S'#39' THEN Cast('#39' '#39' AS CHAR)'
      '                            ELSE tipomovimentacao'
      '       END as tipomovimentacao,'
      '       tipo'
      'from eventos e'
      'where true'
      '%condicoes'
      'ORDER BY UPPER(TO_ASCII(e.Descricao, '#39'LATIN1'#39'))')
    RequestLive = False
    Left = 64
    Top = 80
    object qryConsultaEventosdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 50
    end
    object qryConsultaEventosclassificacao: TStringField
      DisplayLabel = 'Classifica'#231#227'o'
      DisplayWidth = 10
      FieldName = 'classificacao'
    end
    object qryConsultaEventoscodigo: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 4
      FieldName = 'codigo'
      DisplayFormat = '000'
    end
    object qryConsultaEventostipoevento: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tipo'
      DisplayWidth = 5
      FieldName = 'tipoevento'
      Size = 1
    end
    object qryConsultaEventostipo: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 5
      FieldName = 'tipo'
      Visible = False
      Size = 1
    end
    object qryConsultaEventosinativo: TDateField
      Alignment = taCenter
      FieldName = 'inativo'
      Visible = False
      EditMask = '99/99/9999;1; '
    end
    object qryConsultaEventostipomovimentacao: TStringField
      DisplayLabel = 'T'
      FieldName = 'tipomovimentacao'
      Size = 1
    end
  end
  object qryProcuraPlanoReferencial: TtecQuery
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
        Name = 'SQLListatipo'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select pr.*'
      'from PlanoReferencial pr'
      'where pr.codigo = :codigo'
      '%SQLListatipo')
    RequestLive = False
    Left = 64
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraPlanoReferencialdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 150
    end
    object qryProcuraPlanoReferencialcodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object qryProcuraPlanoReferencialclassificacao: TStringField
      FieldName = 'classificacao'
    end
    object qryProcuraPlanoReferencialtipo: TStringField
      FieldName = 'tipo'
      Required = True
      Size = 1
    end
    object qryProcuraPlanoReferencialvalidodesde: TDateField
      FieldName = 'validodesde'
    end
    object qryProcuraPlanoReferencialvalidoate: TDateField
      FieldName = 'validoate'
    end
  end
  object qryConsultaPlanoReferencial: TtecQuery
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
        Name = 'SQLListatipo'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      
        'SELECT cast(repeat('#39' '#39', length(btrim(pr.classificacao)))||pr.Des' +
        'cricao as varchar) as DescricaoEdentada,'
      '       pr.descricao,'
      '       pr.classificacao,'
      '       pr.Codigo,'
      '       pr.tipo'
      'from PlanoReferencial pr'
      'where pr.codigo is not null'
      '%SQLListatipo'
      'order by UPPER(TO_ASCII(pr.descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 32
    Top = 168
    object qryConsultaPlanoReferencialdescricaoedentada: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 52
      FieldName = 'descricaoedentada'
      Size = 200
    end
    object qryConsultaPlanoReferencialdescricao: TStringField
      FieldName = 'descricao'
      Visible = False
      Size = 150
    end
    object qryConsultaPlanoReferencialclassificacao: TStringField
      DisplayLabel = 'Classifica'#231#227'o'
      FieldName = 'classificacao'
    end
    object qryConsultaPlanoReferencialcodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
    object qryConsultaPlanoReferencialtipo: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'tipo'
      Size = 1
    end
  end
  object dsrProcuraPlanoReferencial: TtecDataSource
    DataSet = qryProcuraPlanoReferencial
    Left = 96
    Top = 184
  end
  object qryProcuraModeloDoctosFiscais: TtecQuery
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
      'select mdf.*'
      'from modelosdoctosfiscais mdf'
      'where mdf.codigo = :codigo')
    RequestLive = False
    Left = 24
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraModeloDoctosFiscaiscodigo: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Size = 2
    end
    object qryProcuraModeloDoctosFiscaisdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 60
    end
    object qryProcuraModeloDoctosFiscaismodelo: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'modelo'
      Size = 7
    end
  end
  object dsrProcuraModeloDoctosFiscais: TtecDataSource
    DataSet = qryProcuraModeloDoctosFiscais
    Left = 56
    Top = 280
  end
  object qryConsultaModeloDoctosFiscais: TtecQuery
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
      'select mdf.*'
      'from modelosdoctosfiscais mdf'
      'order by mdf.codigo')
    RequestLive = False
    Left = 88
    Top = 288
    object qryConsultaModeloDoctosFiscaiscodigo: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Size = 2
    end
    object qryConsultaModeloDoctosFiscaisdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 60
    end
    object qryConsultaModeloDoctosFiscaismodelo: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'modelo'
      Size = 7
    end
  end
  object qryProcuraICMSObrigacoes: TtecQuery
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
      'select *'
      'from ICMSObrigacoes'
      'where codigo = :codigo')
    RequestLive = False
    Left = 24
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraICMSObrigacoescodigo: TStringField
      FieldName = 'codigo'
      Required = True
      Size = 3
    end
    object qryProcuraICMSObrigacoesdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
  end
  object dsrProcuraICMSObrigacoes: TtecDataSource
    DataSet = qryProcuraICMSObrigacoes
    Left = 56
    Top = 312
  end
  object qryConsultaICMSObrigacoes: TtecQuery
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
      'select *'
      'from ICMSObrigacoes'
      'order by codigo')
    RequestLive = False
    Left = 88
    Top = 320
    object qryConsultaICMSObrigacoescodigo: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Size = 3
    end
    object qryConsultaICMSObrigacoesdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 100
    end
  end
  object qryProcuraAjusteICMS: TtecQuery
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
      'select *'
      'from tabelaajusteicms'
      'where codigo = :codigo')
    RequestLive = False
    Left = 24
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraAjusteICMScodigo: TStringField
      FieldName = 'codigo'
      Size = 8
    end
    object qryProcuraAjusteICMSdescricao: TStringField
      FieldName = 'descricao'
      Size = 200
    end
    object qryProcuraAjusteICMSvalidodesde: TDateField
      FieldName = 'validodesde'
    end
  end
  object dsrProcuraAjusteICMS: TtecDataSource
    DataSet = qryProcuraAjusteICMS
    Left = 56
    Top = 344
  end
  object qryConsultaAjusteICMS: TtecQuery
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
      'select *'
      'from tabelaajusteicms'
      'order by codigo')
    RequestLive = False
    Left = 88
    Top = 352
    object qryConsultaAjusteICMScodigo: TStringField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'codigo'
      Size = 8
    end
    object qryConsultaAjusteICMSdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 100
      FieldName = 'descricao'
      Size = 200
    end
    object qryConsultaAjusteICMSvalidodesde: TDateField
      DisplayLabel = 'V'#225'lido desde'
      FieldName = 'validodesde'
    end
  end
  object qryProcuraInstRespAdmCadastro: TtecQuery
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
      'select * from '
      'instrespadmcadastro'
      'where codigo = :codigo')
    RequestLive = False
    Left = 160
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraInstRespAdmCadastrocodigo: TStringField
      FieldName = 'codigo'
      Size = 2
    end
    object qryProcuraInstRespAdmCadastrodescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
  end
  object dsrProcuraInstRespAdmCadastro: TtecDataSource
    DataSet = qryProcuraInstRespAdmCadastro
    Left = 192
    Top = 288
  end
  object qryConsultaInstRespAdmCadastro: TtecQuery
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
      'select * from '
      'instrespadmcadastro'
      'order by codigo')
    RequestLive = False
    Left = 224
    Top = 296
    object qryConsultaInstRespAdmCadastrocodigo: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Size = 2
    end
    object qryConsultaInstRespAdmCadastrodescricao: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'descricao'
      Size = 100
    end
  end
  object qryProcuraQualificacao: TtecQuery
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
      'select * '
      'from qualificacao'
      'where codigo = :codigo')
    RequestLive = False
    Left = 224
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraQualificacaocodigo: TStringField
      FieldName = 'codigo'
      Size = 3
    end
    object qryProcuraQualificacaodescricao: TStringField
      FieldName = 'descricao'
      Size = 70
    end
  end
  object dsrProcuraQualificacao: TtecDataSource
    DataSet = qryProcuraQualificacao
    Left = 256
    Top = 392
  end
  object qryConsultaQualificacao: TtecQuery
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
      'select * '
      'from qualificacao'
      'order by codigo')
    RequestLive = False
    Left = 288
    Top = 400
    object qryConsultaQualificacaocodigo: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Size = 3
    end
    object qryConsultaQualificacaodescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 70
    end
  end
  object qryProcuraECD: TtecQuery
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
      'select *'
      'from ecd'
      'where filial = :filial'
      '  and exercicio = :exercicio')
    RequestLive = False
    Left = 160
    Top = 151
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end>
    object qryProcuraECDexercicio: TStringField
      FieldName = 'exercicio'
      Size = 4
    end
    object qryProcuraECDnomearquivo: TStringField
      FieldName = 'nomearquivo'
      Size = 100
    end
    object qryProcuraECDdata: TDateTimeField
      FieldName = 'data'
    end
    object qryProcuraECDsituacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
    object qryProcuraECDfilial: TIntegerField
      FieldName = 'filial'
    end
    object qryProcuraECDnum_ord: TIntegerField
      FieldName = 'num_ord'
    end
    object qryProcuraECDnatureza: TStringField
      FieldName = 'natureza'
      Size = 80
    end
  end
  object dsrProcuraECD: TtecDataSource
    DataSet = qryProcuraECD
    Left = 192
    Top = 159
  end
  object qryConsultaECD: TtecQuery
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
      'select *'
      'from ecd'
      'order by exercicio, filial')
    RequestLive = False
    Left = 224
    Top = 167
    object qryConsultaECDexercicio: TStringField
      DisplayLabel = 'Exerc'#237'cio'
      FieldName = 'exercicio'
      Size = 4
    end
    object qryConsultaECDfilial: TIntegerField
      DisplayLabel = 'Filial'
      DisplayWidth = 8
      FieldName = 'filial'
    end
    object qryConsultaECDdata: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 15
      FieldName = 'data'
      DisplayFormat = 'dd/mm/yy hh:mm'
    end
    object qryConsultaECDnomearquivo: TStringField
      DisplayLabel = 'Arquivo'
      DisplayWidth = 30
      FieldName = 'nomearquivo'
      Size = 100
    end
    object qryConsultaECDsituacao: TStringField
      DisplayLabel = 'Sit.'
      DisplayWidth = 5
      FieldName = 'situacao'
      Size = 1
    end
    object qryConsultaECDnum_ord: TIntegerField
      DisplayLabel = 'N. Ordem'
      FieldName = 'num_ord'
    end
    object qryConsultaECDnatureza: TStringField
      DisplayLabel = 'Natureza'
      DisplayWidth = 30
      FieldName = 'natureza'
      Size = 80
    end
  end
  object qryProcuraEFD: TtecQuery
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
      'select *'
      'from efd'
      'where filial = :filial'
      '  and periodo = :periodo')
    RequestLive = False
    Left = 160
    Top = 183
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'periodo'
        ParamType = ptUnknown
      end>
    object qryProcuraEFDperiodo: TStringField
      FieldName = 'periodo'
      Size = 7
    end
    object qryProcuraEFDnomearquivo: TStringField
      FieldName = 'nomearquivo'
      Size = 100
    end
    object qryProcuraEFDdata: TDateTimeField
      FieldName = 'data'
    end
    object qryProcuraEFDtipo: TStringField
      FieldName = 'tipo'
      Size = 1
    end
    object qryProcuraEFDfilial: TIntegerField
      FieldName = 'filial'
    end
    object qryProcuraEFDdatainventario: TDateField
      FieldName = 'datainventario'
    end
  end
  object dsrProcuraEFD: TtecDataSource
    DataSet = qryProcuraEFD
    Left = 192
    Top = 191
  end
  object qryConsultaEFD: TtecQuery
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
      'select *'
      'from efd'
      'order by periodo, filial')
    RequestLive = False
    Left = 224
    Top = 199
    object qryConsultaEFDperiodo: TStringField
      DisplayLabel = 'Per'#237'odo'
      FieldName = 'periodo'
      Size = 7
    end
    object qryConsultaEFDfilial: TIntegerField
      DisplayLabel = 'Filial'
      FieldName = 'filial'
    end
    object qryConsultaEFDdata: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'data'
      DisplayFormat = 'dd/mm/yy hh:mm'
    end
    object qryConsultaEFDnomearquivo: TStringField
      DisplayLabel = 'Arquivo'
      DisplayWidth = 30
      FieldName = 'nomearquivo'
      Size = 100
    end
    object qryConsultaEFDtipo: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 5
      FieldName = 'tipo'
      Size = 1
    end
    object qryConsultaEFDdatainventario: TDateField
      DisplayLabel = 'Inventario'
      FieldName = 'datainventario'
      DisplayFormat = 'dd/mm/yy'
    end
  end
  object qryConsultaAjusteIPI: TtecQuery
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
      'select *'
      'from tabelaajusteipi'
      'order by codigo')
    RequestLive = False
    Left = 88
    Top = 384
    object qryConsultaAjusteIPIcodigo: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Size = 3
    end
    object qryConsultaAjusteIPInatureza: TStringField
      DisplayLabel = 'Natureza'
      FieldName = 'natureza'
      Size = 1
    end
    object qryConsultaAjusteIPIdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 150
    end
  end
  object dsrProcuraAjusteIPI: TtecDataSource
    DataSet = qryProcuraAjusteIPI
    Left = 56
    Top = 376
  end
  object qryProcuraAjusteIPI: TtecQuery
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
      'select *'
      'from tabelaajusteipi'
      'where codigo = :codigo')
    RequestLive = False
    Left = 24
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraAjusteIPIcodigo: TStringField
      FieldName = 'codigo'
      Size = 3
    end
    object qryProcuraAjusteIPIdescricao: TStringField
      FieldName = 'descricao'
      Size = 200
    end
    object qryProcuraAjusteIPInatureza: TStringField
      FieldName = 'natureza'
      Size = 1
    end
  end
  object qryProcuraCSOSN: TtecQuery
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
      'select *'
      'from csosn'
      'where codigo = :codigo')
    RequestLive = False
    Left = 224
    Top = 432
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraCSOSNcodigo: TStringField
      FieldName = 'codigo'
      Size = 3
    end
    object qryProcuraCSOSNdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
  end
  object dsrProcuraCSOSN: TtecDataSource
    DataSet = qryProcuraCSOSN
    Left = 256
    Top = 440
  end
  object qryConsultaCSOSN: TtecQuery
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
      'select * from'
      'csosn '
      'order by codigo')
    RequestLive = False
    Left = 288
    Top = 448
    object qryConsultaCSOSNcodigo: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Size = 3
    end
    object qryConsultaCSOSNdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 100
    end
  end
  object qryProcuraCodigosFiscais: TtecQuery
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
      '         descricao,'
      '         detalhes,'
      '         historico,'
      '         debitoconta,'
      '         creditoconta,'
      '         tipo,'
      '         validoate,'
      '         validoapos,'
      '         basefaturamento,'
      '         basepis,'
      '         basecofins,'
      '         basecssl,'
      '         destacarIPI'
      'from codigosfiscais'
      'where codigo = :codigo')
    RequestLive = False
    Left = 328
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraCodigosFiscaiscodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryProcuraCodigosFiscaisdescricao: TStringField
      FieldName = 'descricao'
      Size = 80
    end
    object qryProcuraCodigosFiscaisdetalhes: TStringField
      FieldName = 'detalhes'
      Size = 500
    end
    object qryProcuraCodigosFiscaishistorico: TIntegerField
      FieldName = 'historico'
    end
    object qryProcuraCodigosFiscaisdebitoconta: TIntegerField
      FieldName = 'debitoconta'
    end
    object qryProcuraCodigosFiscaiscreditoconta: TIntegerField
      FieldName = 'creditoconta'
    end
    object qryProcuraCodigosFiscaistipo: TStringField
      FieldName = 'tipo'
      Size = 1
    end
    object qryProcuraCodigosFiscaisvalidoate: TDateField
      FieldName = 'validoate'
    end
    object qryProcuraCodigosFiscaisvalidoapos: TDateField
      FieldName = 'validoapos'
    end
    object qryProcuraCodigosFiscaisbasefaturamento: TBooleanField
      FieldName = 'basefaturamento'
    end
    object qryProcuraCodigosFiscaisbasepis: TBooleanField
      FieldName = 'basepis'
    end
    object qryProcuraCodigosFiscaisbasecofins: TBooleanField
      FieldName = 'basecofins'
    end
    object qryProcuraCodigosFiscaisbasecssl: TBooleanField
      FieldName = 'basecssl'
    end
    object qryProcuraCodigosFiscaisdestacaripi: TBooleanField
      FieldName = 'destacaripi'
    end
  end
  object dsrProcuraCodigosFiscais: TtecDataSource
    DataSet = qryProcuraCodigosFiscais
    Left = 360
    Top = 144
  end
  object qryConsultaCodigosFiscais: TtecQuery
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
      'from codigosfiscais'
      'order by UPPER(TO_ASCII(descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 397
    Top = 150
    object qryConsultaCodigosFiscaisdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 50
    end
    object qryConsultaCodigosFiscaiscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
  end
  object qryConsultaCentrodeCusto: TtecQuery
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
      'select descricao, codigo'
      'from centrodecusto'
      'order by UPPER(TO_ASCII(descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 393
    Top = 288
    object qryConsultaCentrodeCustodescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 100
    end
    object qryConsultaCentrodeCustocodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
  end
  object dsrProcuraCentrodeCusto: TtecDataSource
    DataSet = qryProcuraCentrodeCusto
    Left = 366
    Top = 272
  end
  object qryProcuraCentrodeCusto: TtecQuery
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
      'Select  descricao,'
      '        codigo'
      'From    centrodecusto'
      'Where   codigo = :codigo')
    RequestLive = False
    Left = 326
    Top = 255
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraCentrodeCustodescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object qryProcuraCentrodeCustocodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object qryProcuraDIPJ_IPI: TtecQuery
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
      'select *'
      'from dipj_ipi'
      'where filial = :filial'
      '  and exercicio = :exercicio')
    RequestLive = False
    Left = 160
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end>
    object qryProcuraDIPJ_IPIexercicio: TStringField
      FieldName = 'exercicio'
      Size = 4
    end
    object qryProcuraDIPJ_IPInomearquivo: TStringField
      FieldName = 'nomearquivo'
      Size = 100
    end
    object qryProcuraDIPJ_IPIdata: TDateTimeField
      FieldName = 'data'
    end
    object qryProcuraDIPJ_IPIfilial: TIntegerField
      FieldName = 'filial'
    end
  end
  object dsrProcuraDIPJ_IPI: TtecDataSource
    DataSet = qryProcuraDIPJ_IPI
    Left = 192
    Top = 128
  end
  object qryConsultaDIPJ_IPI: TtecQuery
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
      'select *'
      'from dipj_ipi'
      'order by exercicio, filial')
    RequestLive = False
    Left = 224
    Top = 136
    object qryConsultaDIPJ_IPIexercicio: TStringField
      DisplayLabel = 'Exerc'#237'cio'
      FieldName = 'exercicio'
      Size = 4
    end
    object qryConsultaDIPJ_IPIfilial: TIntegerField
      DisplayLabel = 'Filial'
      FieldName = 'filial'
    end
    object qryConsultaDIPJ_IPIdata: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'data'
    end
    object qryConsultaDIPJ_IPInomearquivo: TStringField
      DisplayLabel = 'Arquivo'
      FieldName = 'nomearquivo'
      Size = 70
    end
  end
  object qryProcuraClassificacaoIPI: TtecQuery
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
      'select *'
      'from classificacao_ipi'
      'where codigo = :codigo'
      'order by codigo')
    RequestLive = False
    Left = 160
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraClassificacaoIPIcodigo: TStringField
      FieldName = 'codigo'
      Size = 2
    end
    object qryProcuraClassificacaoIPIclassificacao: TStringField
      FieldName = 'classificacao'
      Size = 50
    end
    object qryProcuraClassificacaoIPItipo: TStringField
      FieldName = 'tipo'
      Size = 30
    end
  end
  object dsrProcuraClassificacaoIPI: TtecDataSource
    DataSet = qryProcuraClassificacaoIPI
    Left = 192
    Top = 96
  end
  object qryConsultaClassificacaoIPI: TtecQuery
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
      'select *'
      'from classificacao_ipi'
      'order by codigo')
    RequestLive = False
    Left = 224
    Top = 104
    object qryConsultaClassificacaoIPIcodigo: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Size = 2
    end
    object qryConsultaClassificacaoIPIclassificacao: TStringField
      DisplayLabel = 'Classifica'#231#227'o'
      FieldName = 'classificacao'
      Size = 50
    end
    object qryConsultaClassificacaoIPItipo: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'tipo'
      Size = 30
    end
  end
  object qryProcuraFCont: TtecQuery
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
      'select *'
      'from fcont'
      'where filial = :filial'
      '  and exercicio = :exercicio')
    RequestLive = False
    Left = 160
    Top = 215
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end>
    object qryProcuraFContexercicio: TStringField
      FieldName = 'exercicio'
      Size = 4
    end
    object qryProcuraFContnomearquivo: TStringField
      FieldName = 'nomearquivo'
      Size = 100
    end
    object qryProcuraFContdata: TDateTimeField
      FieldName = 'data'
    end
    object qryProcuraFContfilial: TIntegerField
      FieldName = 'filial'
    end
    object qryProcuraFContsituacao: TIntegerField
      FieldName = 'situacao'
    end
    object qryProcuraFContIND_SIT_INI_PER: TIntegerField
      FieldName = 'IND_SIT_INI_PER'
    end
    object qryProcuraFContnum_ord: TIntegerField
      FieldName = 'num_ord'
    end
    object qryProcuraFContnatureza: TStringField
      FieldName = 'natureza'
      Size = 80
    end
    object qryProcuraFContTIPO_ESCRIT: TIntegerField
      FieldName = 'TIPO_ESCRIT'
    end
    object qryProcuraFContNro_Rec_Anterior: TStringField
      FieldName = 'Nro_Rec_Anterior'
      Size = 41
    end
    object qryProcuraFContId_escr_Per_ant: TStringField
      FieldName = 'Id_escr_Per_ant'
      Size = 40
    end
    object qryProcuraFContsIT_sLD_PER_ANT: TStringField
      FieldName = 'sIT_sLD_PER_ANT'
      Size = 1
    end
    object qryProcuraFContInd_lcto_ini_sld: TIntegerField
      FieldName = 'Ind_lcto_ini_sld'
    end
  end
  object dsrProcuraFCont: TtecDataSource
    DataSet = qryProcuraFCont
    Left = 192
    Top = 223
  end
  object qryConsultaFCont: TtecQuery
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
      'select *'
      'from fcont'
      'order by exercicio, filial')
    RequestLive = False
    Left = 224
    Top = 231
    object qryConsultaFContexercicio: TStringField
      DisplayLabel = 'Exerc'#237'cio'
      FieldName = 'exercicio'
      Size = 4
    end
    object qryConsultaFContfilial: TIntegerField
      DisplayLabel = 'Filial'
      FieldName = 'filial'
    end
    object qryConsultaFContdata: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'data'
      DisplayFormat = 'dd/mm/yy hh:mm'
    end
    object qryConsultaFContnomearquivo: TStringField
      DisplayLabel = 'Arquivo'
      DisplayWidth = 30
      FieldName = 'nomearquivo'
      Size = 100
    end
    object qryConsultaFContsituacao: TIntegerField
      DisplayLabel = 'Sit.'
      FieldName = 'situacao'
    end
    object qryConsultaFContnum_ord: TIntegerField
      DisplayLabel = 'N. Ordem'
      FieldName = 'num_ord'
      Visible = False
    end
    object qryConsultaFContnatureza: TStringField
      DisplayLabel = 'Natureza'
      FieldName = 'natureza'
      Visible = False
      Size = 80
    end
  end
end
