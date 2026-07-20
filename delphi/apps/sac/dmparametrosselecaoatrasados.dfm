inherited dtmParametrosSelecaoAtrasados: TdtmParametrosSelecaoAtrasados
  Left = 617
  Top = 149
  Height = 227
  Width = 340
  object qryConceitos: TtecQuery
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
      'Select Codigo,'
      '          Descricao'
      'From   Conceitos'
      'Where Codigo =:Codigo        ')
    RequestLive = False
    Left = 64
    Top = 85
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Codigo'
        ParamType = ptUnknown
      end>
    object qryConceitoscodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object qryConceitosdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 30
    end
  end
  object dsrConceitos: TtecDataSource
    DataSet = qryConceitos
    Left = 199
    Top = 85
  end
  object qryConsultaConceitos: TtecQuery
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
      'Select  Descricao,'
      '           Codigo'
      'From    Conceitos'
      'order by UPPER(TO_ASCII(descricao,''LATIN1''))')
    RequestLive = False
    Left = 64
    Top = 146
    object qryConsultaConceitosdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 30
    end
    object qryConsultaConceitoscodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
  end
  object dsrConsultaConceitos: TtecDataSource
    DataSet = qryConsultaConceitos
    Left = 200
    Top = 146
  end
  object qryConsultaAtrasados: TtecQuery
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
      '         nome'
      'from   (select distinct cliente'
      '          from    parcelas,'
      '                    contratos'
      '          where  (contratos.numero = parcelas.contrato) '
      '                     /*   data vencimento    */'
      '                     /* nenhum pagamento  */'
      
        '                    and contratos_atual(contratos.numero) and (c' +
        'ontratos.situacao = '#39'F'#39') ) as clientesOK, clientes'
      'where  (clientes.codigo = clientesOK.cliente)  '
      '/* telefone                  */'
      '/* conceito                 */'
      '/* atrasado                 */'
      '/* ocorrencia              */'
      '/* carencia                 */'
      'order by clientes.codigo          ')
    RequestLive = False
    Left = 56
    Top = 24
    object qryConsultaAtrasadoscodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryConsultaAtrasadosnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
  end
end
