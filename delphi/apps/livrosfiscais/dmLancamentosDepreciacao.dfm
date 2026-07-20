inherited dtmLancamentosDepreciacao: TdtmLancamentosDepreciacao
  OldCreateOrder = False
  Left = 382
  Top = 260
  Height = 289
  Width = 419
  object qryApagarLancamentosDepreciacao: TtecQuery
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
      'delete from lancamentos'
      'where exercicio = :exercicio'
      '  and data between :datainicial and :datafinal'
      'and origem = '#39'Z'#39)
    RequestLive = True
    Left = 48
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end>
  end
  object qryValorDepreciacao: TtecQuery
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
      'select ValorDepreciacao(:CodigoBem, :Data) as valor')
    RequestLive = False
    Left = 48
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodigoBem'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftDate
        Name = 'Data'
        ParamType = ptUnknown
      end>
    object qryValorDepreciacaovalor: TFloatField
      FieldName = 'valor'
    end
  end
  object qryImobilizado: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'ListadeBens'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select i.*, pc.descricao as descricaocontadobem'
      'from imobilizado i'
      '     join planocontas pc'
      '     on i.ccdobem = pc.codigo'
      ''
      'where true'
      '  and i.ccdepreciacaoacumulada is not null'
      '  and i.ccdepreciacao is not null'
      '%ListadeBens')
    RequestLive = False
    Left = 176
    Top = 120
    object qryImobilizadonumero: TIntegerField
      FieldName = 'numero'
    end
    object qryImobilizadodata_entrada: TDateField
      FieldName = 'data_entrada'
    end
    object qryImobilizadofilialcontribuinte: TIntegerField
      FieldName = 'filialcontribuinte'
    end
    object qryImobilizadocodigobem: TLargeintField
      FieldName = 'codigobem'
    end
    object qryImobilizadonumlre: TStringField
      FieldName = 'numlre'
      Size = 10
    end
    object qryImobilizadofolhalre: TStringField
      FieldName = 'folhalre'
      Size = 10
    end
    object qryImobilizadoicmsvalor: TFloatField
      FieldName = 'icmsvalor'
    end
    object qryImobilizadoicmsvalorst: TFloatField
      FieldName = 'icmsvalorst'
    end
    object qryImobilizadoicmsvalorfrt: TFloatField
      FieldName = 'icmsvalorfrt'
    end
    object qryImobilizadoicmsvalordif: TFloatField
      FieldName = 'icmsvalordif'
    end
    object qryImobilizadodata_saida: TDateField
      FieldName = 'data_saida'
    end
    object qryImobilizadonmeses: TIntegerField
      FieldName = 'nmeses'
    end
    object qryImobilizadotipomovimentosaida: TStringField
      FieldName = 'tipomovimentosaida'
      Size = 2
    end
    object qryImobilizadovalordobem: TFloatField
      FieldName = 'valordobem'
    end
    object qryImobilizadoidentificacao: TStringField
      FieldName = 'identificacao'
      Size = 50
    end
    object qryImobilizadoinfcomplementar: TStringField
      FieldName = 'infcomplementar'
      Size = 200
    end
    object qryImobilizadodatagarantia: TDateField
      FieldName = 'datagarantia'
    end
    object qryImobilizadotipoconta: TStringField
      FieldName = 'tipoconta'
      Size = 1
    end
    object qryImobilizadodepreciar: TStringField
      FieldName = 'depreciar'
      Size = 1
    end
    object qryImobilizadovalordepreciar: TFloatField
      FieldName = 'valordepreciar'
    end
    object qryImobilizadotaxadepreciacao: TFloatField
      FieldName = 'taxadepreciacao'
    end
    object qryImobilizadodepreciacaoacumulada: TFloatField
      FieldName = 'depreciacaoacumulada'
    end
    object qryImobilizadoobsdepreciacao: TStringField
      FieldName = 'obsdepreciacao'
      Size = 200
    end
    object qryImobilizadofuncaobemnaempresa: TStringField
      FieldName = 'funcaobemnaempresa'
      Size = 200
    end
    object qryImobilizadovidautil: TIntegerField
      FieldName = 'vidautil'
    end
    object qryImobilizadoiniciouso: TDateField
      FieldName = 'iniciouso'
    end
    object qryImobilizadocodigonota: TIntegerField
      FieldName = 'codigonota'
    end
    object qryImobilizadoccdobem: TIntegerField
      FieldName = 'ccdobem'
    end
    object qryImobilizadoccdepreciacaoacumulada: TIntegerField
      FieldName = 'ccdepreciacaoacumulada'
    end
    object qryImobilizadocccorrecaomonetaria: TIntegerField
      FieldName = 'cccorrecaomonetaria'
    end
    object qryImobilizadoccdepreciacao: TIntegerField
      FieldName = 'ccdepreciacao'
    end
    object qryImobilizadocentrodecusto: TIntegerField
      FieldName = 'centrodecusto'
    end
    object qryImobilizadodadofiscal: TIntegerField
      FieldName = 'dadofiscal'
    end
    object qryImobilizadovalorresidual: TFloatField
      FieldName = 'valorresidual'
    end
    object qryImobilizadodescricaocontadobem: TStringField
      FieldName = 'descricaocontadobem'
      Size = 50
    end
  end
  object qryLancamentos: TtecQuery
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
      'select l.*'
      'from lancamentos l'
      'where false')
    RequestLive = True
    Left = 48
    Top = 168
    object qryLancamentosexercicio: TIntegerField
      FieldName = 'exercicio'
    end
    object qryLancamentosnrlancto: TIntegerField
      FieldName = 'nrlancto'
    end
    object qryLancamentosfilial: TIntegerField
      FieldName = 'filial'
    end
    object qryLancamentosdata: TDateField
      FieldName = 'data'
    end
    object qryLancamentosorigem: TStringField
      FieldName = 'origem'
      Size = 1
    end
    object qryLancamentosnrorigem: TLargeintField
      FieldName = 'nrorigem'
    end
    object qryLancamentosdebitar: TIntegerField
      FieldName = 'debitar'
    end
    object qryLancamentoscreditar: TIntegerField
      FieldName = 'creditar'
    end
    object qryLancamentosvalor: TFloatField
      FieldName = 'valor'
    end
    object qryLancamentoshistorico: TIntegerField
      FieldName = 'historico'
    end
    object qryLancamentoscomplemento: TStringField
      FieldName = 'complemento'
      Size = 512
    end
    object qryLancamentosalteracao: TDateField
      FieldName = 'alteracao'
    end
  end
end
