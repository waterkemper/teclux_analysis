inherited dtmVisualizarSaldoTroca: TdtmVisualizarSaldoTroca
  OldCreateOrder = False
  Left = 314
  Top = 123
  Height = 214
  Width = 345
  object dsrSaldoTroca: TtecDataSource
    DataSet = qrySaldoTroca
    Left = 64
    Top = 32
  end
  object qrySaldoTroca: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'Filtro'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select'
      ' pt.tipo,'
      ' pt.data,'
      ' coalesce(pt.referencia,'
      ' (case when pt.tipo = '#39'E'#39' then'
      
        '   (case when pt.produto is not null then (select p.descricao fr' +
        'om produtos p where p.codigo = pt.produto) else'
      '      (case when pt.contrato is not null then'
      
        '        cast('#39'ENTRADA CANCELAMENTO CONTRATO '#39'||pt.contrato as va' +
        'rchar) end) end)'
      ' else '
      
        '   (case when pt.produto is not null then (select p.descricao fr' +
        'om produtos p where p.codigo = pt.produto) else'
      '    (case when pt.contrato is not null then'
      
        '      cast('#39'SAIDA NO CONTRATO '#39'||coalesce(pt.contrato,'#39#39') as var' +
        'char) end) end)'
      ' end)) as descricao,'
      ' pt.valor,'
      ' pt.saldo'
      'from produtostrocados pt'
      'where pt.cliente = :cliente and pt.tipocliente=:tipocliente'
      '%Filtro'
      'order by pt.numero,pt.data,pt.tipo')
    RequestLive = True
    Left = 96
    Top = 48
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
    object qrySaldoTrocatipo: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'tipo'
      Size = 1
    end
    object qrySaldoTrocadata: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'data'
      DisplayFormat = 'dd/mm/yy hh:mm'
    end
    object qrySaldoTrocadescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 50
    end
    object qrySaldoTrocavalor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'valor'
      DisplayFormat = '0.00'
    end
    object qrySaldoTrocasaldo: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'saldo'
      DisplayFormat = '0.00'
    end
  end
  object qrySaldoAtual: TtecQuery
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
      'Select 0.00 as valor')
    RequestLive = True
    Left = 128
    Top = 64
    object qrySaldoAtualvalor: TFloatField
      FieldName = 'valor'
    end
  end
  object dsrSaldoAtual: TtecDataSource
    DataSet = qrySaldoAtual
    Left = 160
    Top = 80
  end
end
