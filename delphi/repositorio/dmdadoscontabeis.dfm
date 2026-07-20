inherited dtmDadosContabeis: TdtmDadosContabeis
  OldCreateOrder = False
  Left = 237
  Top = 205
  Height = 292
  Width = 549
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
    Left = 41
    Top = 16
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
    Left = 40
    Top = 68
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
  object dsrProcuraDebitar: TtecDataSource
    DataSet = qryProcuraDebitar
    Left = 70
    Top = 80
  end
  object dsrProcuraCreditar: TtecDataSource
    DataSet = qryProcuraCreditar
    Left = 70
    Top = 136
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
    Left = 38
    Top = 135
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
end
