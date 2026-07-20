inherited dtmimprimesaldocliente: Tdtmimprimesaldocliente
  OldCreateOrder = False
  Left = 373
  Top = 145
  Height = 137
  Width = 253
  object qryTrocas: TtecQuery
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
      'SELECT numero,'
      '        tipo,'
      '        data,'
      '        cliente,'
      '        tipocliente,'
      '        (select coalesce(razao,nome) as nome'
      '         from vfornecedores'
      '         where codigo = :cliente'
      '           and tipo =: tipocliente) as nome,'
      '        case when tipo = '#39'S'#39' then valor * (-1)'
      '                  else valor'
      '             end as valor,'
      '        saldo,'
      '        troca_referencia(numero) as referencia'
      'FROM produtostrocados'
      'WHERE cliente = :cliente'
      '  AND tipocliente = :tipocliente'
      'ORDER BY numero DESC limit 5')
    RequestLive = False
    Left = 32
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipocliente'
        ParamType = ptUnknown
      end>
    object qryTrocasnumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryTrocastipo: TStringField
      FieldName = 'tipo'
      Size = 1
    end
    object qryTrocasdata: TDateTimeField
      FieldName = 'data'
    end
    object qryTrocascliente: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object qryTrocasnome: TStringField
      FieldName = 'nome'
      Size = 28
    end
    object qryTrocastipocliente: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
    object qryTrocasvalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '0.00'
    end
    object qryTrocassaldo: TFloatField
      FieldName = 'saldo'
      DisplayFormat = '0.00'
    end
    object qryTrocasreferencia: TStringField
      DisplayWidth = 20
      FieldName = 'referencia'
    end
  end
end
