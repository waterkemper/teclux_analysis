inherited dtmCadastroTabelaMontagem: TdtmCadastroTabelaMontagem
  Left = 408
  Top = 117
  Height = 413
  Width = 796
  object qryTabelaMontagem: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnDeleteError = PostError
    OnEditError = PostError
    OnPostError = PostError
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select * from tabelademontagens'
      'where codigo=:codigo')
    RequestLive = True
    Left = 92
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryTabelaMontagemdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 30
    end
    object qryTabelaMontagemcodigo: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'codigo'
    end
    object qryTabelaMontagemobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 200
    end
    object qryTabelaMontagemvalorloja: TFloatField
      FieldName = 'valorloja'
    end
    object qryTabelaMontagemvalordentro: TFloatField
      FieldName = 'valordentro'
    end
    object qryTabelaMontagemvalorfora: TFloatField
      FieldName = 'valorfora'
    end
    object qryTabelaMontagemtipovalor: TStringField
      FieldName = 'tipovalor'
      Required = True
      Size = 1
    end
  end
  object qryConsultaTabelaMontagem: TtecQuery
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
      'select codigo, descricao from tabelademontagens'
      'order by UPPER(TO_ASCII(descricao,''LATIN1''))')
    RequestLive = False
    Left = 92
    Top = 144
    object qryConsultaTabelaMontagemdescricao: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'descricao'
      Required = True
      Size = 30
    end
    object qryConsultaTabelaMontagemcodigo: TIntegerField
      DisplayLabel = 'Código'
      FieldName = 'codigo'
      Required = True
    end
  end
  object dsrTabelaMontagem: TtecDataSource
    DataSet = qryTabelaMontagem
    Left = 92
    Top = 80
  end
  object spcTabelaMontagemProximoCodigo: TtecQuery
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
      'select tabelademontagens_proximocodigo() as codigo')
    RequestLive = False
    Left = 290
    Top = 80
    object spcTabelaMontagemProximoCodigocodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
end
