inherited dtmCadastroPerguntas: TdtmCadastroPerguntas
  OldCreateOrder = True
  Left = 294
  Top = 235
  Height = 354
  Width = 351
  object qryPerguntas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeDelete = BeforeDelete
    AfterScroll = qryPerguntasAfterScroll
    OnNewRecord = qryPerguntasNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'Select  * From Perguntas'
      'where Codigo =:Codigo')
    RequestLive = True
    Left = 82
    Top = 17
    ParamData = <
      item
        DataType = ftString
        Name = 'Codigo'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryPerguntascodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
    object qryPerguntasenunciado: TStringField
      FieldName = 'enunciado'
      Required = True
      Size = 50
    end
    object qryPerguntascomplementos: TStringField
      FieldName = 'complementos'
      Size = 200
    end
    object qryPerguntasmaximo: TIntegerField
      FieldName = 'maximo'
      Required = True
      DisplayFormat = '0'
    end
    object qryPerguntasminimo: TIntegerField
      FieldName = 'minimo'
      Required = True
      DisplayFormat = '0'
    end
    object qryPerguntasordem: TIntegerField
      FieldName = 'ordem'
      Required = True
      DisplayFormat = '0'
    end
    object qryPerguntastipo: TStringField
      FieldName = 'tipo'
      Required = True
      Size = 1
    end
    object qryPerguntasvalida: TBooleanField
      FieldName = 'valida'
      Required = True
    end
  end
  object dsrPerguntas: TtecDataSource
    DataSet = qryPerguntas
    Left = 222
    Top = 17
  end
  object qryOpcoesPerguntas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeInsert = qryOpcoesPerguntasBeforeInsert
    BeforeDelete = qryOpcoesPerguntasBeforeDelete
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'Select pergunta,'
      '           codigo,'
      '           opcao'
      'From'
      '           opcoesperguntas'
      'where (pergunta =:pergunta)'
      'Order By Codigo')
    RequestLive = True
    Left = 82
    Top = 85
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pergunta'
        ParamType = ptUnknown
      end>
    object qryOpcoesPerguntaspergunta: TIntegerField
      FieldName = 'pergunta'
      Required = True
    end
    object qryOpcoesPerguntascodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0#'
    end
    object qryOpcoesPerguntasopcao: TStringField
      FieldName = 'opcao'
      Required = True
    end
  end
  object dsrOpcoesPerguntas: TtecDataSource
    DataSet = qryOpcoesPerguntas
    Left = 222
    Top = 85
  end
  object qryConsultaPerguntas: TtecQuery
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
      'Select  codigo,'
      '        enunciado'
      'From Perguntas'
      'order by UPPER(TO_ASCII(enunciado,''LATIN1''))')
    RequestLive = False
    Left = 82
    Top = 149
    object qryConsultaPerguntasenunciado: TStringField
      DisplayLabel = 'Enunciado'
      FieldName = 'enunciado'
      Size = 50
    end
    object qryConsultaPerguntascodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
  end
  object qryConsultaMaximoMinimo: TtecQuery
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
      'Select Maximo,'
      '           Minimo'
      'From   Perguntas'
      'Where (Codigo =:Codigo)')
    RequestLive = False
    Left = 82
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Codigo'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryConsultaMaximoMinimomaximo: TIntegerField
      FieldName = 'maximo'
      Required = True
    end
    object qryConsultaMaximoMinimominimo: TIntegerField
      FieldName = 'minimo'
      Required = True
    end
  end
  object qryCodigoProximaPergunta: TtecQuery
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
      'select perguntas_proximocodigo() as Codigo')
    RequestLive = False
    Left = 82
    Top = 285
    object qryCodigoProximaPerguntacodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object qryMaxNrOpcoes: TtecQuery
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
      'Select Max(Codigo) from opcoesperguntas'
      'where pergunta =:pergunta')
    RequestLive = False
    Left = 225
    Top = 149
    ParamData = <
      item
        DataType = ftString
        Name = 'pergunta'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryMaxNrOpcoesmax: TIntegerField
      FieldName = 'max'
    end
  end
end
