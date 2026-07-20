inherited dtmTiposMovimentosDoEstoque: TdtmTiposMovimentosDoEstoque
  OldCreateOrder = False
  Left = 246
  Top = 113
  Height = 386
  Width = 498
  object dsrMovimentos: TtecDataSource
    DataSet = qryMovimentos
    Left = 57
    Top = 68
  end
  object qryMovimentos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryMovimentosAfterOpen
    AfterCancel = qryMovimentosAfterCancel
    OnNewRecord = qryMovimentosNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select *'
      'from tiposmovimentos'
      'where tiposmovimentos.codigo = :codigo')
    RequestLive = True
    Left = 57
    Top = 20
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
        Value = ''
      end>
    object qryMovimentoscodigo: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Required = True
      Size = 3
    end
    object qryMovimentosdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 70
    end
    object qryMovimentosinativo: TDateField
      DisplayLabel = 'Inativo'
      FieldName = 'inativo'
    end
    object qryMovimentostransferencia: TStringField
      DisplayLabel = 'Transfer'#234'ncia'
      FieldName = 'transferencia'
      Size = 3
    end
    object qryMovimentosoperacao: TStringField
      DisplayLabel = 'Opera'#231#227'o'
      FieldName = 'operacao'
      Required = True
    end
    object qryMovimentosinterno: TBooleanField
      FieldName = 'interno'
    end
  end
  object qryProcuraTransferencias: TtecQuery
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
      'select codigo,'
      '       descricao'
      'from tiposmovimentos'
      'where codigo = :codigo'
      '')
    RequestLive = False
    Left = 195
    Top = 69
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
        Value = ''
      end>
    object qryProcuraTransferenciascodigo: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Size = 3
    end
    object qryProcuraTransferenciasdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
  end
  object dsrProcuraTransferencias: TtecDataSource
    DataSet = qryProcuraTransferencias
    Left = 195
    Top = 118
  end
  object qryConsultaMovimentos: TtecQuery
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
      'Select codigo, '
      '           descricao'
      'From   tiposmovimentos '
      'Order By UPPER(TO_ASCII(descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 57
    Top = 118
    object qryConsultaMovimentosdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 70
      FieldName = 'descricao'
      Size = 70
    end
    object qryConsultaMovimentoscodigo: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Size = 3
    end
  end
end
