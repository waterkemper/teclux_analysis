inherited dtmCadastroCodigosFiscais: TdtmCadastroCodigosFiscais
  Left = 641
  Top = 212
  Height = 337
  Width = 596
  object qryCodigosFiscais: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnNewRecord = qryCodigosFiscaisNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select *'
      'from codigosfiscais'
      'where codigo = :codigo')
    RequestLive = True
    Left = 58
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryCodigosFiscaiscodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
    object qryCodigosFiscaisdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 80
    end
    object qryCodigosFiscaisdetalhes: TStringField
      FieldName = 'detalhes'
      Required = True
      Size = 500
    end
    object qryCodigosFiscaisdebitoconta: TIntegerField
      FieldName = 'debitoconta'
      DisplayFormat = '0'
    end
    object qryCodigosFiscaiscreditoconta: TIntegerField
      FieldName = 'creditoconta'
      DisplayFormat = '0'
    end
    object qryCodigosFiscaistipo: TStringField
      FieldName = 'tipo'
      Required = True
      Size = 1
    end
    object qryCodigosFiscaisvalidoate: TDateField
      Alignment = taCenter
      FieldName = 'validoate'
      EditMask = '99/99/9999;1; '
    end
    object qryCodigosFiscaisvalidoapos: TDateField
      Alignment = taCenter
      FieldName = 'validoapos'
      EditMask = '99/99/9999;1; '
    end
    object qryCodigosFiscaisbasefaturamento: TBooleanField
      FieldName = 'basefaturamento'
    end
    object qryCodigosFiscaisbasepis: TBooleanField
      FieldName = 'basepis'
    end
    object qryCodigosFiscaisbasecofins: TBooleanField
      FieldName = 'basecofins'
    end
    object qryCodigosFiscaisbasecssl: TBooleanField
      FieldName = 'basecssl'
    end
    object qryCodigosFiscaishistorico: TIntegerField
      FieldName = 'historico'
      DisplayFormat = '0'
    end
    object qryCodigosFiscaisdestacaripi: TBooleanField
      FieldName = 'destacaripi'
    end
    object qryCodigosFiscaisdevolucaoretorno: TBooleanField
      FieldName = 'devolucaoretorno'
    end
    object qryCodigosFiscaisexigenotareferenciada: TBooleanField
      FieldName = 'exigenotareferenciada'
    end
    object qryCodigosFiscaisst: TBooleanField
      FieldName = 'st'
    end
    object qryCodigosFiscaisvendasoucompras: TBooleanField
      FieldName = 'vendasoucompras'
    end
    object qryCodigosFiscaisoutrassaidas: TBooleanField
      FieldName = 'outrassaidas'
    end
    object qryCodigosFiscaisusoouconsumo: TBooleanField
      FieldName = 'usoouconsumo'
    end
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
    Left = 61
    Top = 126
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
  object dsrCodigosFiscais: TtecDataSource
    DataSet = qryCodigosFiscais
    Left = 63
    Top = 72
  end
  object dsrConsultaCodigosFiscais: TtecDataSource
    DataSet = qryConsultaCodigosFiscais
    Left = 61
    Top = 182
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
    Left = 218
    Top = 13
    object qryConsultaHistoricodescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
    object qryConsultaHistoricocodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object dsrConsultaHistorico: TtecDataSource
    DataSet = qryConsultaHistorico
    Left = 218
    Top = 69
  end
  object qryProcuraHistorico: TtecQuery
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
      'select codigo,'
      '         descricao'
      'from historicos'
      'where (codigo = :codigo) and contabil'
      '         ')
    RequestLive = False
    Left = 367
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraHistoricocodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryProcuraHistoricodescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
  end
  object dsrProcuraHistorico: TtecDataSource
    DataSet = qryProcuraHistorico
    Left = 367
    Top = 64
  end
  object qryProcuraDebitar: TtecQuery
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
      
        'select codigo, cast(btrim(classificacao, '#39'. '#39') as varchar) as cl' +
        'assificacao, descricao'
      'from planocontas'
      'where codigo = :codigo'
      '  and codigo <> :contacredito'
      '  and tipo = '#39'A'#39
      '  and inativo is null')
    RequestLive = False
    Left = 214
    Top = 143
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
    object qryProcuraDebitarcodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
    object qryProcuraDebitarclassificacao: TStringField
      FieldName = 'classificacao'
    end
    object qryProcuraDebitardescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 50
    end
  end
  object dsrProcuraDebitar: TtecDataSource
    DataSet = qryProcuraDebitar
    Left = 238
    Top = 152
  end
  object qryProcuraCreditar: TtecQuery
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
      
        'select codigo, cast(btrim(classificacao, '#39'. '#39') as varchar) as cl' +
        'assificacao, descricao'
      'from planocontas'
      'where codigo = :codigo'
      '  and codigo <> :contadebito'
      '  and tipo = '#39'A'#39
      '  and inativo is null')
    RequestLive = False
    Left = 206
    Top = 199
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
    object StringField1: TStringField
      FieldName = 'classificacao'
    end
    object StringField2: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 50
    end
  end
  object dsrProcuraCreditar: TtecDataSource
    DataSet = qryProcuraCreditar
    Left = 238
    Top = 208
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
    Left = 385
    Top = 216
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
  object qryUpdateCodigosFiscais: TtecQuery
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
      
        'update codigosfiscais set devolucaoretorno = :devolucaoretorno w' +
        'here mod(codigo, 1000) = mod(:codigofiscal, 1000)')
    RequestLive = True
    Left = 368
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'devolucaoretorno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigofiscal'
        ParamType = ptUnknown
      end>
  end
end
