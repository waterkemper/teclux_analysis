inherited dtmRegistroSPC: TdtmRegistroSPC
  Left = 60
  Top = 224
  Height = 179
  Width = 480
  object qryConfirmadosSPC: TtecQuery
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
      'SELECT c.*, o.avalista'
      'FROM  cartas c'
      'JOIN  contratos o ON ( o.numero = c.contrato)'
      'WHERE ( c.tipocarta = 3 )'
      ' AND  ( c.confirmacao IS NOT NULL )'
      ' AND  NOT ( c.obsoleta )'
      ' AND  ( c.cliente IN ('
      '                      SELECT cliente'
      '                      FROM vatraso_contratos'
      '                      WHERE dias >= ('
      '                                      SELECT atraso'
      '                                      FROM  tiposcartas'
      '                                      WHERE codigo = 3'
      '                                     )'
      '                      )'
      '      )')
    RequestLive = False
    Left = 61
    Top = 61
    object qryConfirmadosSPCcliente: TIntegerField
      FieldName = 'cliente'
      Required = True
      DisplayFormat = '0'
    end
    object qryConfirmadosSPCdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryConfirmadosSPCtipocarta: TIntegerField
      FieldName = 'tipocarta'
      Required = True
      DisplayFormat = '0'
    end
    object qryConfirmadosSPCcontrato: TStringField
      FieldName = 'contrato'
    end
    object qryConfirmadosSPCobsoleta: TBooleanField
      FieldName = 'obsoleta'
      Required = True
    end
    object qryConfirmadosSPCvoltou: TDateField
      Alignment = taCenter
      FieldName = 'voltou'
      EditMask = '99/99/9999;1; '
    end
    object qryConfirmadosSPCconfirmacao: TDateField
      Alignment = taCenter
      FieldName = 'confirmacao'
      EditMask = '99/99/9999;1; '
    end
    object qryConfirmadosSPCavalista: TIntegerField
      FieldName = 'avalista'
    end
  end
  object qryFiltraConfirmados: TtecQuery
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
      'SELECT count(*) AS atende'
      'FROM  contratos c, clientes l, atendimentos a'
      'WHERE(c.numero = :numero )'
      'AND  (c.cliente   = l.codigo )'
      'AND  (a.cliente   = l.codigo )'
      'AND  (a.semspc < CURRENT_DATE )'
      'AND  (c.agente IN ('
      '                   SELECT  agente'
      '                   FROM     agentestiposcartas'
      '                   WHERE tipocarta = 3'
      '                  )'
      '      )'
      'AND   (l.conceito IN ('
      '                      SELECT conceito'
      '                      FROM     conceitostiposcartas'
      '                      WHERE  tipocarta = 3'
      '                      )'
      '      )  AND'
      '/* linhas adicionais incluidas em runtime */'
      ''
      '/* */')
    RequestLive = False
    Left = 213
    Top = 11
    ParamData = <
      item
        DataType = ftString
        Name = 'numero'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryFiltraConfirmadosatende: TIntegerField
      FieldName = 'atende'
    end
  end
  object qryDadosAvisoSPC: TtecQuery
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
      'SELECT filial, grupofilial'
      'FROM  tiposcartas'
      'WHERE codigo = 3')
    RequestLive = False
    Left = 61
    Top = 10
    object qryDadosAvisoSPCfilial: TIntegerField
      FieldName = 'filial'
    end
    object qryDadosAvisoSPCgrupofilial: TIntegerField
      FieldName = 'grupofilial'
    end
  end
  object qryCancelaSPC: TtecQuery
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
      
        'UPDATE spc SET datacancelamento = CURRENT_DATE WHERE numero = :n' +
        'umero')
    RequestLive = False
    Left = 213
    Top = 114
    ParamData = <
      item
        DataType = ftString
        Name = 'numero'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object qryRegistraSPC: TtecQuery
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
      'INSERT '
      
        'INTO  spc  (numero, cliente, contrato, dataregistro, avalista, v' +
        'alordivida, datavencto)'
      
        'VALUES    (:numero, :cliente, :contrato, CURRENT_DATE, :avalista' +
        ', :divida, :vencto) ')
    RequestLive = False
    Left = 213
    Top = 62
    ParamData = <
      item
        DataType = ftString
        Name = 'numero'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'cliente'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'contrato'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'avalista'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'divida'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'vencto'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object qryCanceladosSPC: TtecQuery
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
      'Select numero'
      'From spc'
      'Where (datacancelamento is null)'
      '     and (contrato in ('
      '                     Select numero'
      '                     From    vatraso_contratos'
      '                     Where  dias <=:atraso'
      '                    )'
      '      )')
    RequestLive = False
    Left = 61
    Top = 114
    ParamData = <
      item
        DataType = ftInteger
        Name = 'atraso'
        ParamType = ptUnknown
        Value = 5
      end>
    object qryCanceladosSPCnumero: TIntegerField
      FieldName = 'numero'
    end
  end
  object qryParcelasAtrasadas: TtecQuery
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
      'SELECT datavencto, valorvencto'
      'FROM   parcelas'
      'WHERE  contrato = :contrato')
    RequestLive = False
    Left = 365
    Top = 10
    ParamData = <
      item
        DataType = ftString
        Name = 'contrato'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryParcelasAtrasadasdatavencto: TDateField
      FieldName = 'datavencto'
    end
    object qryParcelasAtrasadasvalorvencto: TFloatField
      FieldName = 'valorvencto'
    end
  end
  object spcSpcProximo: TtecQuery
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
      'SELECT spc_proximonumero() AS numero')
    RequestLive = False
    Left = 365
    Top = 61
    object spcSpcProximonumero: TIntegerField
      FieldName = 'numero'
    end
  end
end
