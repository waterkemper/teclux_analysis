inherited dtmVisualizarSaldocashback: TdtmVisualizarSaldocashback
  OldCreateOrder = False
  Left = 573
  Top = 126
  Height = 320
  Width = 752
  object dsrcashback_saldos: TtecDataSource
    DataSet = qrycashback_saldos
    Left = 64
    Top = 32
  end
  object qrycashback_saldos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qrycashback_saldosAfterOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'Filtro'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select cb_s.*, cb.descricao'
      'from getcashback_saldos(cast(:cliente as integer),'
      '                        cast(:tipocliente as char(1)) ) cb_s'
      '     left join cashback cb'
      '     on cb.codigo = cb_s.cashback'
      ''
      'where true'
      '  %Filtro     ')
    RequestLive = False
    Left = 136
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'cliente'
        ParamType = ptUnknown
        Value = '44223'
      end
      item
        DataType = ftString
        Name = 'tipocliente'
        ParamType = ptUnknown
        Value = 'C'
      end>
    object qrycashback_saldoscodigo: TIntegerField
      DisplayLabel = 'N'#176
      FieldName = 'codigo'
    end
    object qrycashback_saldoscashback: TIntegerField
      FieldName = 'cashback'
    end
    object qrycashback_saldosdata_hora: TDateTimeField
      Alignment = taCenter
      FieldName = 'data_hora'
      DisplayFormat = 'dd/MM/yy hh:mm'
      EditMask = '99/99/99 99:99;1; '
    end
    object qrycashback_saldosdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object qrycashback_saldoscliente: TIntegerField
      FieldName = 'cliente'
    end
    object qrycashback_saldostipo_cliente: TStringField
      FieldName = 'tipo_cliente'
      Size = 50
    end
    object qrycashback_saldosvalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '0.00'
    end
    object qrycashback_saldosvalidade: TDateTimeField
      Alignment = taCenter
      FieldName = 'validade'
      DisplayFormat = 'dd/MM/yy hh:mm'
      EditMask = '99/99/99 99:99;1; '
    end
    object qrycashback_saldosstatus: TStringField
      FieldName = 'status'
      Size = 50
    end
    object qrycashback_saldoscontrato: TStringField
      FieldName = 'contrato'
      Size = 50
    end
    object qrycashback_saldosparcela: TIntegerField
      FieldName = 'parcela'
    end
    object qrycashback_saldossaldo: TFloatField
      FieldName = 'saldo'
      DisplayFormat = '0.00'
    end
    object qrycashback_saldosproduto: TLargeintField
      FieldName = 'produto'
    end
    object qrycashback_saldoscodigo_saldo_origem: TIntegerField
      FieldName = 'codigo_saldo_origem'
    end
    object qrycashback_saldoscancelamento: TIntegerField
      FieldName = 'cancelamento'
    end
    object qrycashback_saldossaldofinal: TFloatField
      FieldName = 'saldofinal'
    end
  end
end
