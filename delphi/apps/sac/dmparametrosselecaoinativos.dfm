inherited dtmParametrosSelecaoInativos: TdtmParametrosSelecaoInativos
  OldCreateOrder = True
  Left = 358
  Top = 411
  Height = 244
  Width = 567
  object qryConsultaInativos: TtecQuery
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
      'set datestyle = iso, european;'
      'select codigo,'
      '         nome,'
      '         estado'
      'from   (select distinct cliente'
      '          from    parcelas,'
      '                    contratos'
      '          where  (contratos.numero = parcelas.contrato) '
      '                     /*  data pagamento  */'
      '                    /* faixa valor          */'
      
        '                    and (contratos.origem is null) and (contrato' +
        's.situacao = '#39'F'#39' ) and not contratos_estornado(contratos.numero)' +
        ' ) as clientesOK, clientes'
      'where  (clientes.codigo = clientesOK.cliente)'
      '/* clientes inativos  */'
      '/* renegociado       */'
      '/* telefone             */'
      '/* conceito            */'
      '/* dias atraso         */'
      '/* estado               */'
      'order by codigo          ')
    RequestLive = True
    Left = 72
    Top = 24
    object qryConsultaInativoscodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryConsultaInativosnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaInativosestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
  end
  object qryConceito: TtecQuery
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
      '         descricao'
      'from conceitos'
      'where codigo = :codigo')
    RequestLive = True
    Left = 72
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryConceitocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryConceitodescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
  end
  object qryConsultaConceito: TtecQuery
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
      'select descricao,'
      '         codigo'
      'from conceitos'
      'order by UPPER(TO_ASCII(descricao,''LATIN1''))')
    RequestLive = True
    Left = 192
    Top = 88
    object qryConsultaConceitodescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
    object qryConsultaConceitocodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object dsrConceito: TtecDataSource
    DataSet = qryConceito
    Left = 72
    Top = 144
  end
  object dsrConsultaConceito: TtecDataSource
    DataSet = qryConsultaConceito
    Left = 192
    Top = 144
  end
  object qryEstado: TtecQuery
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
      '         nome'
      'from estados'
      'where codigo = :codigo')
    RequestLive = True
    Left = 336
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryEstadocodigo: TStringField
      FieldName = 'codigo'
      Size = 2
    end
    object qryEstadonome: TStringField
      FieldName = 'nome'
      Size = 30
    end
  end
  object qryConsultaEstado: TtecQuery
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
      'select nome,'
      '         codigo'
      'from estados'
      'order by UPPER(TO_ASCII(nome,''LATIN1''))'
      '')
    RequestLive = True
    Left = 456
    Top = 88
    object qryConsultaEstadonome: TStringField
      FieldName = 'nome'
      Size = 30
    end
    object qryConsultaEstadocodigo: TStringField
      FieldName = 'codigo'
      Size = 2
    end
  end
  object dsrEstado: TtecDataSource
    DataSet = qryEstado
    Left = 336
    Top = 144
  end
  object dsrConsultaEstado: TtecDataSource
    DataSet = qryConsultaEstado
    Left = 456
    Top = 144
  end
end
