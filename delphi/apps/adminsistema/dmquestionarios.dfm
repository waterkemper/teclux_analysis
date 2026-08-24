inherited dtmQuestionarios: TdtmQuestionarios
  OldCreateOrder = False
  Left = 503
  Top = 217
  Height = 250
  Width = 334
  object dsrQuestionarios: TtecDataSource
    DataSet = qryQuestionarios
    Left = 112
    Top = 32
  end
  object qryQuestionarios: TtecQuery
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
      'select q.*'
      'from questionarios q'
      'where q.codigo =:codigo')
    RequestLive = True
    Left = 104
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryQuestionarioscodigo: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'codigo'
    end
    object qryQuestionariosdescricao: TStringField
      FieldName = 'descricao'
      Size = 255
    end
    object qryQuestionariosdata_inicio: TDateTimeField
      FieldName = 'data_inicio'
    end
    object qryQuestionariosdata_fim: TDateTimeField
      FieldName = 'data_fim'
    end
    object qryQuestionariosdisponivel: TBooleanField
      FieldName = 'disponivel'
    end
    object qryQuestionariosdata_inativo: TDateTimeField
      FieldName = 'data_inativo'
    end
    object qryQuestionariosdescricao_text: TStringField
      FieldName = 'descricao_text'
      Size = 1000
    end
    object qryQuestionariosrespondermaisdeumavez: TBooleanField
      FieldName = 'respondermaisdeumavez'
    end
  end
end
