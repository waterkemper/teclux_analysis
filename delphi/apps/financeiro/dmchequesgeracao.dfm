inherited dtmChequesGeracao: TdtmChequesGeracao
  Left = 274
  Top = 226
  Height = 184
  Width = 276
  object qryCheques: TtecQuery
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
      'select cast(SubString(numero,1,3) as varchar) as banco,'
      '       cast(SubString(numero,4,4) as varchar) as agencia,'
      '       cast(SubString(numero,8,1) as varchar) as digito2,'
      '       cast(SubString(numero,9,3) as varchar) as compensacao,'
      '       cast(SubString(numero,12,6) as varchar) as cheque,'
      '       cast(SubString(numero,18,1) as varchar) as tipificacao,'
      '       cast(SubString(numero,19,1) as varchar) as digito1,'
      '       cast(SubString(numero,20,10) as varchar) as conta,'
      '       cast(SubString(numero,30,1) as varchar) as digito3,'
      '       valor'
      'from cheques'
      '/*                    TipoCheque                   */'
      '/*                    DataRemessa                 */'
      '/*                    NumeroRemessa            */'
      '/*                    Periodo                          */'
      ''
      ''
      ''
      ''
      ''
      '')
    RequestLive = False
    Left = 38
    Top = 12
    object qryChequesbanco: TStringField
      FieldName = 'banco'
      Size = 3
    end
    object qryChequesagencia: TStringField
      FieldName = 'agencia'
      Size = 4
    end
    object qryChequesdigito2: TStringField
      FieldName = 'digito2'
      Size = 1
    end
    object qryChequescompensacao: TStringField
      FieldName = 'compensacao'
      Size = 3
    end
    object qryChequescheque: TStringField
      FieldName = 'cheque'
      Size = 6
    end
    object qryChequestipificacao: TStringField
      FieldName = 'tipificacao'
      Size = 1
    end
    object qryChequesdigito1: TStringField
      FieldName = 'digito1'
      Size = 1
    end
    object qryChequesconta: TStringField
      FieldName = 'conta'
      Size = 10
    end
    object qryChequesdigito3: TStringField
      FieldName = 'digito3'
      Size = 1
    end
    object qryChequesvalor: TFloatField
      FieldName = 'valor'
    end
  end
  object qryCabecalho: TtecQuery
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
      'Select  Sum(valor) as total'
      'from cheques'
      '/*                TipoCheque                 */'
      '/*                DataRemessa               */'
      '/*                NumeroRemessa          */'
      '/*                Periodo                        */')
    RequestLive = False
    Left = 114
    Top = 12
    object qryCabecalhototal: TFloatField
      FieldName = 'total'
    end
  end
end
