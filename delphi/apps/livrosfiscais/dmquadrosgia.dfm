inherited dtmQuadrosGIA: TdtmQuadrosGIA
  Left = 262
  Top = 210
  Height = 334
  Width = 685
  object qryProcuraFilial: TtecQuery
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
      '         nome,'
      '         regime'
      'from filiais'
      'where codigo = :codigo')
    RequestLive = False
    Left = 530
    Top = 12
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraFilialcodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryProcuraFilialnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryProcuraFilialregime: TIntegerField
      FieldName = 'regime'
      DisplayFormat = '0'
    end
  end
  object dsrProcuraFilial: TtecDataSource
    DataSet = qryProcuraFilial
    Left = 530
    Top = 61
  end
  object qryQuadrosGIA: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeClose = qryQuadrosGIABeforeClose
    AfterScroll = qryQuadrosGIAAfterScroll
    OnCalcFields = qryQuadrosGIACalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select q.filial,'
      '         q.periodo,'
      '         q.faturamento,'
      '         q.qtdadeempregados,'
      '         q.acrescimofinanceiro,'
      '         q.despesamensalpessoal,'
      '         q.debdiferencialaliquota,'
      '         q.debtransferencia,'
      '         q.debestornocredito,'
      '         q.debestornoativoimobilizado,'
      '         q.outrosdebitos,'
      '         q.debapuracaoconsolidada,'
      '         q.creddifaliquotaativoimobil,'
      '         q.creddifaliquotamaterialconsumo,'
      '         q.credtransferencia,'
      '         q.credpresumidos,'
      '         q.credincetivosfiscais,'
      '         q.credpagtoocasiaofatogerador,'
      '         q.credapuracaoconsolidada,'
      '         q.outroscreditos,'
      '         q.substbasecalculo,'
      '         q.substimpostoretido,'
      '         q.substcreditos,'
      '         q.substressarcimentoICMS,'
      '         q.observacao,'
      '         q.numeroguia1, '
      '         q.dataguia1,'
      '         q.valorguia1,'
      '         q.orgaoguia1,'
      '         q.numeroguia2,'
      '         q.dataguia2,'
      '         q.valorguia2,'
      '         q.orgaoguia2,'
      '         q.numeroguia3,'
      '         q.dataguia3,'
      '         q.valorguia3,'
      '         q.orgaoguia3,'
      '         q.numeroguia4,'
      '         q.dataguia4,'
      '         q.valorguia4,'
      '         q.orgaoguia4'
      'from quadrosgia q'
      'where (filial = :Filial) and'
      '          (periodo = :Data)')
    RequestLive = True
    Left = 50
    Top = 13
    ParamData = <
      item
        DataType = ftString
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Data'
        ParamType = ptUnknown
      end>
    object qryquadrosgiafilial: TIntegerField
      FieldName = 'filial'
      Required = True
      DisplayFormat = '0'
    end
    object qryQuadrosGIAperiodo: TStringField
      Alignment = taCenter
      FieldName = 'periodo'
      Required = True
      EditMask = '00/0000;1;_'
    end
    object qryQuadrosGIAfaturamento: TFloatField
      FieldName = 'faturamento'
      DisplayFormat = '0.00'
    end
    object qryQuadrosGIAqtdadeempregados: TIntegerField
      FieldName = 'qtdadeempregados'
      DisplayFormat = '0'
    end
    object qryQuadrosGIAacrescimofinanceiro: TFloatField
      FieldName = 'acrescimofinanceiro'
      DisplayFormat = '0.00'
    end
    object qryQuadrosGIAdespesamensalpessoal: TFloatField
      FieldName = 'despesamensalpessoal'
      DisplayFormat = '0.00'
    end
    object qryQuadrosGIAdebdiferencialaliquota: TFloatField
      FieldName = 'debdiferencialaliquota'
      DisplayFormat = '0.00'
    end
    object qryQuadrosGIAdebtransferencia: TFloatField
      FieldName = 'debtransferencia'
      DisplayFormat = '0.00'
    end
    object qryQuadrosGIAdebestornocredito: TFloatField
      FieldName = 'debestornocredito'
      DisplayFormat = '0.00'
    end
    object qryQuadrosGIAdebestornoativoimobilizado: TFloatField
      FieldName = 'debestornoativoimobilizado'
      DisplayFormat = '0.00'
    end
    object qryQuadrosGIAdebapuracaoconsolidada: TFloatField
      FieldName = 'debapuracaoconsolidada'
      DisplayFormat = '0.00'
    end
    object qryQuadrosGIAoutrosdebitos: TFloatField
      FieldName = 'outrosdebitos'
      DisplayFormat = '0.00'
    end
    object qryQuadrosGIAcreddifaliquotaativoimobil: TFloatField
      FieldName = 'creddifaliquotaativoimobil'
      DisplayFormat = '0.00'
    end
    object qryQuadrosGIAcreddifaliquotamaterialconsumo: TFloatField
      FieldName = 'creddifaliquotamaterialconsumo'
      DisplayFormat = '0.00'
    end
    object qryQuadrosGIAcredtransferencia: TFloatField
      FieldName = 'credtransferencia'
      DisplayFormat = '0.00'
    end
    object qryQuadrosGIAcredpresumidos: TFloatField
      FieldName = 'credpresumidos'
      DisplayFormat = '0.00'
    end
    object qryQuadrosGIAcredincetivosfiscais: TFloatField
      FieldName = 'credincetivosfiscais'
      DisplayFormat = '0.00'
    end
    object qryQuadrosGIAcredpagtoocasiaofatogerador: TFloatField
      FieldName = 'credpagtoocasiaofatogerador'
      DisplayFormat = '0.00'
    end
    object qryQuadrosGIAcredapuracaoconsolidada: TFloatField
      FieldName = 'credapuracaoconsolidada'
      DisplayFormat = '0.00'
    end
    object qryQuadrosGIAoutroscreditos: TFloatField
      FieldName = 'outroscreditos'
      DisplayFormat = '0.00'
    end
    object qryQuadrosGIAsubstbasecalculo: TFloatField
      FieldName = 'substbasecalculo'
      DisplayFormat = '0.00'
    end
    object qryQuadrosGIAsubstimpostoretido: TFloatField
      FieldName = 'substimpostoretido'
      DisplayFormat = '0.00'
    end
    object qryQuadrosGIAsubstcreditos: TFloatField
      FieldName = 'substcreditos'
      DisplayFormat = '0.00'
    end
    object qryQuadrosGIAsubstressarcimentoicms: TFloatField
      FieldName = 'substressarcimentoicms'
      DisplayFormat = '0.00'
    end
    object qryQuadrosGIAimpostorecolher: TFloatField
      FieldKind = fkCalculated
      FieldName = 'impostorecolher'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosGIAtotaldebitos: TFloatField
      FieldKind = fkCalculated
      FieldName = 'totaldebitos'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosGIAtotalcreditos: TFloatField
      FieldKind = fkCalculated
      FieldName = 'totalcreditos'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosGIAsubtotaldebitos: TFloatField
      FieldKind = fkCalculated
      FieldName = 'subtotaldebitos'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosGIAsubtotalcreditos: TFloatField
      FieldKind = fkCalculated
      FieldName = 'subtotalcreditos'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosGIAsaldocredoparaperiodoseguinte: TFloatField
      FieldKind = fkCalculated
      FieldName = 'saldocredoparaperiodoseguinte'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosGIAsubstsaldocredorperiodosequinte: TFloatField
      FieldKind = fkCalculated
      FieldName = 'substsaldocredorperiodosequinte'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosGIAdebitopelassaidas: TFloatField
      FieldKind = fkCalculated
      FieldName = 'debitopelassaidas'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosGIAsubstsubsaldocredor: TFloatField
      FieldKind = fkCalculated
      FieldName = 'substsubsaldocredor'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosGIAsubstsubsaldodebitos: TFloatField
      FieldKind = fkCalculated
      FieldName = 'substsubsaldodebitos'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosGIAsubstimpostorecolher: TFloatField
      FieldKind = fkCalculated
      FieldName = 'substimpostorecolher'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosGIAsubsttotaldebitos: TFloatField
      FieldKind = fkCalculated
      FieldName = 'substtotaldebitos'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosGIAsubsttotalcreditos: TFloatField
      FieldKind = fkCalculated
      FieldName = 'substtotalcreditos'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosGIAobservacao: TStringField
      FieldName = 'observacao'
      Size = 200
    end
    object qryQuadrosGIAnumeroguia1: TStringField
      FieldName = 'numeroguia1'
      Size = 10
    end
    object qryQuadrosGIAdataguia1: TDateField
      Alignment = taCenter
      FieldName = 'dataguia1'
      EditMask = '99/99/9999;1; '
    end
    object qryQuadrosGIAvalorguia1: TFloatField
      FieldName = 'valorguia1'
      DisplayFormat = '0.00'
    end
    object qryQuadrosGIAorgaoguia1: TStringField
      FieldName = 'orgaoguia1'
    end
    object qryQuadrosGIAnumeroguia2: TStringField
      FieldName = 'numeroguia2'
      Size = 10
    end
    object qryQuadrosGIAdataguia2: TDateField
      Alignment = taCenter
      FieldName = 'dataguia2'
      EditMask = '99/99/9999;1; '
    end
    object qryQuadrosGIAvalorguia2: TFloatField
      FieldName = 'valorguia2'
      DisplayFormat = '0.00'
    end
    object qryQuadrosGIAorgaoguia2: TStringField
      FieldName = 'orgaoguia2'
    end
    object qryQuadrosGIAnumeroguia3: TStringField
      FieldName = 'numeroguia3'
      Size = 10
    end
    object qryQuadrosGIAdataguia3: TDateField
      Alignment = taCenter
      FieldName = 'dataguia3'
      EditMask = '99/99/9999;1; '
    end
    object qryQuadrosGIAvalorguia3: TFloatField
      FieldName = 'valorguia3'
      DisplayFormat = '0.00'
    end
    object qryQuadrosGIAorgaoguia3: TStringField
      FieldName = 'orgaoguia3'
    end
    object qryQuadrosGIAnumeroguia4: TStringField
      FieldName = 'numeroguia4'
      Size = 10
    end
    object qryQuadrosGIAdataguia4: TDateField
      Alignment = taCenter
      FieldName = 'dataguia4'
      EditMask = '99/99/9999;1; '
    end
    object qryQuadrosGIAvalorguia4: TFloatField
      FieldName = 'valorguia4'
      DisplayFormat = '0.00'
    end
    object qryQuadrosGIAorgaoguia4: TStringField
      FieldName = 'orgaoguia4'
    end
  end
  object dsrQuadrosGIA: TtecDataSource
    DataSet = qryQuadrosGIA
    Left = 50
    Top = 62
  end
  object qryImpostosPagar: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnNewRecord = qryImpostosPagarNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select filial,'
      '         periodo,'
      '         receitatributaria,'
      '         (select rt.descricao '
      '          from receitastributarias rt'
      '          where rt.codigo = receitatributaria'
      '         ) as descricaoreceitatributaria,'
      '         vencto,'
      '         valor,'
      '         classepagto,'
      '         (select cp.descricao'
      '          from classespagto cp'
      '          where cp.codigo = classepagto'
      '         ) as descricaoclassepagto'
      'from giaimpostopagar'
      'where (filial = :filial) and'
      '          (periodo = :Data)')
    RequestLive = True
    Left = 188
    Top = 212
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Data'
        ParamType = ptUnknown
      end>
    object qryImpostosPagarfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryImpostosPagarreceitatributaria: TIntegerField
      FieldName = 'receitatributaria'
      Required = True
      DisplayFormat = '0'
    end
    object qryImpostosPagarvencto: TDateField
      Alignment = taCenter
      FieldName = 'vencto'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryImpostosPagarvalor: TFloatField
      FieldName = 'valor'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryImpostosPagarclassepagto: TIntegerField
      FieldName = 'classepagto'
      Required = True
      DisplayFormat = '0'
    end
    object qryImpostosPagardescricaoreceitatributaria: TStringField
      FieldName = 'descricaoreceitatributaria'
      Size = 50
    end
    object qryImpostosPagardescricaoclassepagto: TStringField
      FieldName = 'descricaoclassepagto'
      Size = 50
    end
    object qryImpostosPagarperiodo: TStringField
      FieldName = 'periodo'
      Size = 7
    end
  end
  object dsrImpostosPagar: TtecDataSource
    DataSet = qryImpostosPagar
    OnDataChange = dsrImpostosPagarDataChange
    Left = 188
    Top = 262
  end
  object qryTotaisSaidas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = '1000'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';'
      'SELECT CAST(SUM(valorcontabil) AS NUMERIC) as valorcontabil,'
      '            CAST(SUM(base) AS NUMERIC) as base,'
      '            CAST(SUM(valor) AS NUMERIC) as valor, '
      '            CAST(SUM(isentas) AS NUMERIC) as isentas,'
      '            CAST(SUM(outras) AS NUMERIC) as outras'
      'FROM'
      '('
      '('
      'SELECT'
      '  (cdf.base + cdf.isentas + cdf.outras) as valorcontabil,    '
      
        '  case When df.CodigoFiscal=5929 then 0 else cdf.base end as bas' +
        'e,'
      
        '  case When df.CodigoFiscal=5929 then 0 else cdf.valor end as va' +
        'lor,'
      
        '  case When df.CodigoFiscal=5929 then 0 else cdf.isentas end as ' +
        'isentas,'
      
        '  case When df.CodigoFiscal=5929 then (cdf.base+cdf.isentas+cdf.' +
        'outras) else cdf.outras end as outras'
      'FROM ((dadosfiscais df join notas n on df.numero = n.dadofiscal)'
      
        '                                  join calculosdadosfiscais cdf ' +
        'on df.numero=cdf.dadofiscal)'
      'Where cdf.tipo='#39'M'#39' and '
      '          df.situacao='#39'N'#39' and'
      '          (not ((df.codigofiscal % 1000) in (602, 605))) and'
      '          (df.filialemissao = :Filial) and'
      '          (to_char(df.data, '#39'mm/yyyy'#39') = :Data)'
      ')'
      'union all'
      '('
      'SELECT'
      '  (cdf.base + cdf.isentas + cdf.outras) as valorcontabil,    '
      '  cdf.base,'
      '  cdf.valor,'
      '  cdf.isentas,'
      '  cdf.outras'
      
        'FROM ((dadosfiscais df join cupons c on df.numero = c.dadofiscal' +
        ')'
      
        '                                   join calculosdadosfiscais cdf' +
        ' on df.numero=cdf.dadofiscal)'
      'Where cdf.tipo='#39'M'#39' and '
      '          df.situacao='#39'N'#39' and'
      '          (not ((df.codigofiscal % 1000) in (602, 605))) and'
      '          (df.filialemissao = :Filial) and'
      '          (to_char(df.data, '#39'mm/yyyy'#39') = :Data)'
      ')'
      ') as temp')
    RequestLive = False
    Left = 188
    Top = 12
    ParamData = <
      item
        DataType = ftString
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Data'
        ParamType = ptUnknown
      end>
    object qryTotaisSaidasvalorcontabil: TFloatField
      FieldName = 'valorcontabil'
      DisplayFormat = '0.00'
    end
    object qryTotaisSaidasbase: TFloatField
      FieldName = 'base'
      DisplayFormat = '0.00'
    end
    object qryTotaisSaidasvalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '0.00'
    end
    object qryTotaisSaidasisentas: TFloatField
      FieldName = 'isentas'
      DisplayFormat = '0.00'
    end
    object qryTotaisSaidasoutras: TFloatField
      FieldName = 'outras'
      DisplayFormat = '0.00'
    end
  end
  object dsrTotaisSaidas: TtecDataSource
    DataSet = qryTotaisSaidas
    Left = 188
    Top = 61
  end
  object qrySaidas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = '1000'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';'
      'SELECT CAST(codigofiscal AS INTEGER),'
      
        '            CAST(SUM(valorcontabil) AS NUMERIC) as valorcontabil' +
        ','
      '            CAST(SUM(base) AS NUMERIC) as base,'
      '            CAST(SUM(valor) AS NUMERIC) as valor, '
      '            CAST(SUM(isentas) AS NUMERIC) as isentas,'
      '            CAST(SUM(outras) AS NUMERIC) as outras'
      'FROM'
      '('
      '('
      'SELECT'
      '  df.codigofiscal,'
      '  (cdf.base + cdf.isentas + cdf.outras) as valorcontabil,    '
      
        '  case When df.CodigoFiscal=5929 then 0 else cdf.base end as bas' +
        'e,'
      
        '  case When df.CodigoFiscal=5929 then 0 else cdf.valor end as va' +
        'lor,'
      
        '  case When df.CodigoFiscal=5929 then 0 else cdf.isentas end as ' +
        'isentas,'
      
        '  case When df.CodigoFiscal=5929 then (cdf.base+cdf.isentas+cdf.' +
        'outras) else cdf.outras end as outras'
      'FROM ((dadosfiscais df join notas n on df.numero = n.dadofiscal)'
      
        '                                  join calculosdadosfiscais cdf ' +
        'on df.numero=cdf.dadofiscal)'
      'Where cdf.tipo='#39'M'#39' and '
      '          df.situacao='#39'N'#39' and'
      '          (not ((df.codigofiscal % 1000) in (602, 605))) and'
      '          (df.filialemissao = :Filial) and'
      '          (to_char(df.data, '#39'mm/yyyy'#39') = :Data)'
      ')'
      'union all'
      '('
      'SELECT'
      '  5102 as codigofiscal,'
      '  (cdf.base + cdf.isentas + cdf.outras) as valorcontabil,    '
      '  cdf.base,'
      '  cdf.valor,'
      '  cdf.isentas,'
      '  cdf.outras'
      
        'FROM ((dadosfiscais df join cupons c on df.numero = c.dadofiscal' +
        ')'
      
        '                                   join calculosdadosfiscais cdf' +
        ' on df.numero=cdf.dadofiscal)'
      'Where cdf.tipo='#39'M'#39' and '
      '          df.situacao='#39'N'#39' and'
      '          (not ((df.codigofiscal % 1000) in (602, 605))) and'
      '          (df.filialemissao = :Filial) and'
      '          (to_char(df.data, '#39'mm/yyyy'#39') = :Data)'
      ')'
      ') as temp'
      'group by codigofiscal'
      'order by codigofiscal')
    RequestLive = False
    Left = 50
    Top = 112
    ParamData = <
      item
        DataType = ftString
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Data'
        ParamType = ptUnknown
      end>
    object qrySaidascodigofiscal: TIntegerField
      FieldName = 'codigofiscal'
      DisplayFormat = '0'
    end
    object qrySaidasvalorcontabil: TFloatField
      FieldName = 'valorcontabil'
      DisplayFormat = '0.00'
    end
    object qrySaidasbase: TFloatField
      FieldName = 'base'
      DisplayFormat = '0.00'
    end
    object qrySaidasvalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '0.00'
    end
    object qrySaidasisentas: TFloatField
      FieldName = 'isentas'
      DisplayFormat = '0.00'
    end
    object qrySaidasoutras: TFloatField
      FieldName = 'outras'
      DisplayFormat = '0.00'
    end
  end
  object dsrSaidas: TtecDataSource
    DataSet = qrySaidas
    Left = 50
    Top = 161
  end
  object qryEntradas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = '1000'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select codigofiscal,'
      
        '         sum(cnp.base + cnp.isentas + cnp.outras) as valorcontab' +
        'il,'
      '         sum(cnp.base) as base,'
      '         sum(cnp.isentas) as isentas,'
      '         sum(cnp.outras) as outras,'
      '         sum(cnp.valor) as valor'
      'from calculosnotaspag cnp, notaspag p'
      'where (p.codigo = cnp.codigonota) and'
      '          (cnp.tipo = '#39'M'#39') and'
      '          (not ((p.codigofiscal % 1000) in (602, 605))) and'
      '          (p.filial = :Filial) and'
      '          (to_char(p.data, '#39'mm/yyyy'#39') = :Data)'
      'group by p.codigofiscal'
      'order by codigofiscal')
    RequestLive = False
    Left = 50
    Top = 213
    ParamData = <
      item
        DataType = ftString
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Data'
        ParamType = ptUnknown
      end>
    object qryEntradascodigofiscal: TIntegerField
      FieldName = 'codigofiscal'
      DisplayFormat = '0'
    end
    object qryEntradasvalorcontabil: TFloatField
      FieldName = 'valorcontabil'
      DisplayFormat = '0.00'
    end
    object qryEntradasbase: TFloatField
      FieldName = 'base'
      DisplayFormat = '0.00'
    end
    object qryEntradasisentas: TFloatField
      FieldName = 'isentas'
      DisplayFormat = '0.00'
    end
    object qryEntradasoutras: TFloatField
      FieldName = 'outras'
      DisplayFormat = '0.00'
    end
    object qryEntradasvalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '0.00'
    end
  end
  object dsrEntradas: TtecDataSource
    DataSet = qryEntradas
    Left = 50
    Top = 262
  end
  object qryTotalEntradas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = '1000'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      
        'select sum(cnp.base + cnp.isentas + cnp.outras) as valorcontabil' +
        ','
      '         sum(cnp.base) as base,'
      '         sum(cnp.isentas) as isentas,'
      '         sum(cnp.outras) as outras,'
      '         sum(cnp.valor) as valor'
      'from calculosnotaspag cnp, notaspag p'
      'where (p.codigo = cnp.codigonota) and'
      '          (cnp.tipo = '#39'M'#39') and'
      '          (not ((p.codigofiscal % 1000) in (602, 605))) and'
      '          (p.filial = :Filial) and'
      '          (to_char(p.data, '#39'mm/yyyy'#39') = :Data)')
    RequestLive = False
    Left = 188
    Top = 111
    ParamData = <
      item
        DataType = ftString
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Data'
        ParamType = ptUnknown
      end>
    object qryTotalEntradasvalorcontabil: TFloatField
      FieldName = 'valorcontabil'
      DisplayFormat = '0.00'
    end
    object qryTotalEntradasbase: TFloatField
      FieldName = 'base'
      DisplayFormat = '0.00'
    end
    object qryTotalEntradasisentas: TFloatField
      FieldName = 'isentas'
      DisplayFormat = '0.00'
    end
    object qryTotalEntradasoutras: TFloatField
      FieldName = 'outras'
      DisplayFormat = '0.00'
    end
    object qryTotalEntradasvalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '0.00'
    end
  end
  object dsrTotalEntradas: TtecDataSource
    DataSet = qryTotalEntradas
    Left = 188
    Top = 160
  end
  object qryConsultaFiliais: TtecQuery
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
      'from filiais'
      'order by UPPER(TO_ASCII(nome,''LATIN1''))')
    RequestLive = False
    Left = 422
    Top = 12
    object qryConsultaFiliaisnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaFiliaiscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
  object qrySaldoMesAnterior: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnCalcFields = qrySaldoMesAnteriorCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = '1000'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select q.filial,'
      
        '         sum(q.debdiferencialaliquota) as debdiferencialaliquota' +
        ','
      '         sum(q.debtransferencia) as debtransferencia,'
      '         sum(q.debestornocredito) as debestornocredito,'
      
        '         sum(q.debestornoativoimobilizado) as debestornoativoimo' +
        'bilizado,'
      '         sum(q.outrosdebitos) as outrosdebitos,'
      
        '         sum(q.debapuracaoconsolidada) as debapuracaoconsolidada' +
        ','
      
        '         sum(q.creddifaliquotaativoimobil) as creddifaliquotaati' +
        'voimobil,'
      
        '         sum(q.creddifaliquotamaterialconsumo) as creddifaliquot' +
        'amaterialconsumo,'
      '         sum(q.credtransferencia) as credtransferencia,'
      '         sum(q.credpresumidos) as credpresumidos,'
      '         sum(q.credincetivosfiscais) as credincetivosfiscais,'
      
        '         sum(q.credpagtoocasiaofatogerador) as credpagtoocasiaof' +
        'atogerador,'
      
        '         sum(q.credapuracaoconsolidada) as credapuracaoconsolida' +
        'da, '
      '         sum(q.outroscreditos) as outroscreditos,'
      '         sum(q.substbasecalculo) as substbasecalculo,'
      '         sum(q.substimpostoretido) as substimpostoretido,'
      '         sum(q.substcreditos) as substcreditos,'
      
        '         sum(q.substressarcimentoICMS) as substressarcimentoICMS' +
        ','
      '         (select sum(cdf.valor)'
      '          from calculosdadosfiscais cdf, dadosfiscais d'
      '          where (d.numero = cdf.dadofiscal) and'
      '                (cdf.tipo = '#39'M'#39') and'
      '                (d.situacao='#39'N'#39') and'
      '                (d.filialemissao = q.filial) and'
      
        '                (not ((d.codigofiscal % 1000) in (602, 605))) an' +
        'd'
      '                (to_char(d.data, '#39'mm/yyyy'#39') <= :Data)'
      '         ) as debitospelasaida,'
      ''
      '         (select sum(cnp.valor)'
      '          from calculosnotaspag cnp, notaspag p'
      '          where (p.codigo = cnp.codigonota) and'
      '                (cnp.tipo = '#39'M'#39') and'
      '                (p.filial = q.filial) and'
      
        '                (not ((p.codigofiscal % 1000) in (602, 605))) an' +
        'd'
      '                (to_char(p.data, '#39'mm/yyyy'#39') <= :Data)'
      '          ) as creditopelasentradas'
      'from quadrosgia q'
      'where (q.filial = :Filial) and'
      '      (q.periodo <= :Data)'
      'group by q.filial')
    RequestLive = False
    Left = 308
    Top = 12
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Data'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Filial'
        ParamType = ptUnknown
      end>
    object qrySaldoMesAnteriorfilial: TIntegerField
      FieldName = 'filial'
      Required = True
      DisplayFormat = '0'
    end
    object qrySaldoMesAnteriordebdiferencialaliquota: TFloatField
      FieldName = 'debdiferencialaliquota'
      DisplayFormat = '0.00'
    end
    object qrySaldoMesAnteriordebtransferencia: TFloatField
      FieldName = 'debtransferencia'
      DisplayFormat = '0.00'
    end
    object qrySaldoMesAnteriordebestornocredito: TFloatField
      FieldName = 'debestornocredito'
      DisplayFormat = '0.00'
    end
    object qrySaldoMesAnteriordebestornoativoimobilizado: TFloatField
      FieldName = 'debestornoativoimobilizado'
      DisplayFormat = '0.00'
    end
    object qrySaldoMesAnterioroutrosdebitos: TFloatField
      FieldName = 'outrosdebitos'
      DisplayFormat = '0.00'
    end
    object qrySaldoMesAnteriordebapuracaoconsolidada: TFloatField
      FieldName = 'debapuracaoconsolidada'
      DisplayFormat = '0.00'
    end
    object qrySaldoMesAnteriorcreddifaliquotaativoimobil: TFloatField
      FieldName = 'creddifaliquotaativoimobil'
      DisplayFormat = '0.00'
    end
    object qrySaldoMesAnteriorcreddifaliquotamaterialconsumo: TFloatField
      FieldName = 'creddifaliquotamaterialconsumo'
      DisplayFormat = '0.00'
    end
    object qrySaldoMesAnteriorcredtransferencia: TFloatField
      FieldName = 'credtransferencia'
      DisplayFormat = '0.00'
    end
    object qrySaldoMesAnteriorcredpresumidos: TFloatField
      FieldName = 'credpresumidos'
      DisplayFormat = '0.00'
    end
    object qrySaldoMesAnteriorcredincetivosfiscais: TFloatField
      FieldName = 'credincetivosfiscais'
      DisplayFormat = '0.00'
    end
    object qrySaldoMesAnteriorcredpagtoocasiaofatogerador: TFloatField
      FieldName = 'credpagtoocasiaofatogerador'
      DisplayFormat = '0.00'
    end
    object qrySaldoMesAnteriorcredapuracaoconsolidada: TFloatField
      FieldName = 'credapuracaoconsolidada'
      DisplayFormat = '0.00'
    end
    object qrySaldoMesAnterioroutroscreditos: TFloatField
      FieldName = 'outroscreditos'
      DisplayFormat = '0.00'
    end
    object qrySaldoMesAnteriorsubstbasecalculo: TFloatField
      FieldName = 'substbasecalculo'
      DisplayFormat = '0.00'
    end
    object qrySaldoMesAnteriorsubstimpostoretido: TFloatField
      FieldName = 'substimpostoretido'
      DisplayFormat = '0.00'
    end
    object qrySaldoMesAnteriorsubstcreditos: TFloatField
      FieldName = 'substcreditos'
      DisplayFormat = '0.00'
    end
    object qrySaldoMesAnteriorsubstressarcimentoicms: TFloatField
      FieldName = 'substressarcimentoicms'
      DisplayFormat = '0.00'
    end
    object qrySaldoMesAnteriordebitospelasaida: TFloatField
      FieldName = 'debitospelasaida'
      DisplayFormat = '0.00'
    end
    object qrySaldoMesAnteriorcreditopelasentradas: TFloatField
      FieldName = 'creditopelasentradas'
      DisplayFormat = '0.00'
    end
    object qrySaldoMesAnteriorsaldoperiodoanterior: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'saldoperiodoanterior'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qrySaldoMesAnteriorsubstsaldoperiodoanterior: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'substsaldoperiodoanterior'
      DisplayFormat = '0.00'
      Calculated = True
    end
  end
  object dsrSaldoMesAnterior: TtecDataSource
    DataSet = qrySaldoMesAnterior
    Left = 308
    Top = 61
  end
  object qryCodigosComplementares: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterInsert = qryCodigosComplementaresCancel
    BeforeEdit = qryCodigosComplementaresBeforeEdit
    BeforeDelete = qryCodigosComplementaresCancel
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select c.codigo,'
      '       c.descricao,'
      '       g.valor'
      
        'from codigoscomplementares c left join giainformacoescomplementa' +
        'res g on ('
      '(c.codigo = g.codigo) and'
      '(g.filial = :Filial) and'
      '(g.periodo = :Data))'
      '/* Preenchido em runtime */')
    RequestLive = True
    Left = 308
    Top = 111
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Data'
        ParamType = ptUnknown
      end>
    object qryCodigosComplementarescodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryCodigosComplementaresdescricao: TStringField
      FieldName = 'descricao'
      Size = 150
    end
    object qryCodigosComplementaresvalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '0.00'
    end
  end
  object dsrCodigosComplementares: TtecDataSource
    DataSet = qryCodigosComplementares
    OnDataChange = dsrCodigosComplementaresDataChange
    Left = 308
    Top = 160
  end
  object qryComplementares: TtecQuery
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
      'select filial,'
      '         periodo,'
      '         codigo,'
      '         valor'
      'from giainformacoescomplementares'
      'where (filial = :Filial) and'
      '          (periodo = :Data)')
    RequestLive = True
    Left = 310
    Top = 212
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Data'
        ParamType = ptUnknown
      end>
    object qryComplementaresfilial: TIntegerField
      FieldName = 'filial'
      Required = True
      DisplayFormat = '0'
    end
    object qryComplementaresperiodo: TStringField
      FieldName = 'periodo'
      Required = True
      Size = 7
    end
    object qryComplementarescodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
    object qryComplementaresvalor: TFloatField
      FieldName = 'valor'
      Required = True
      DisplayFormat = '0.00'
    end
  end
  object qryConsultaReceitasTributarias: TtecQuery
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
      'from receitastributarias')
    RequestLive = False
    Left = 423
    Top = 61
    object qryConsultaReceitasTributariasdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 40
    end
    object qryConsultaReceitasTributariascodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
  object qryProcuraReceitasTributarias: TtecQuery
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
      'from receitastributarias'
      'where codigo = :codigo')
    RequestLive = False
    Left = 533
    Top = 110
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraReceitasTributariascodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryProcuraReceitasTributariasdescricao: TStringField
      FieldName = 'descricao'
      Size = 40
    end
  end
  object dsrProcuraReceitasTributarias: TtecDataSource
    DataSet = qryProcuraReceitasTributarias
    Left = 536
    Top = 160
  end
  object qryConsultaClassesPagto: TtecQuery
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
      'from classespagto')
    RequestLive = False
    Left = 423
    Top = 110
    object qryConsultaClassesPagtodescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 80
    end
    object qryConsultaClassesPagtocodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
  object qryProcuraClassePagto: TtecQuery
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
      'from classespagto'
      'where codigo = :codigo')
    RequestLive = False
    Left = 537
    Top = 209
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraClassePagtocodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryProcuraClassePagtodescricao: TStringField
      FieldName = 'descricao'
      Size = 80
    end
  end
  object dsrProcuraClassePagto: TtecDataSource
    DataSet = qryProcuraClassePagto
    Left = 540
    Top = 259
  end
  object qryConsultaQuadroGia: TtecQuery
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
      'select q.filial,'
      '         (select f.nome '
      '          from filiais f '
      '          where q.filial = f.codigo'
      '         ) as NomeFilial,'
      '         q.periodo'
      'from quadrosgia q')
    RequestLive = True
    Left = 426
    Top = 160
    object qryConsultaQuadroGiafilial: TIntegerField
      DisplayLabel = 'Filial'
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryConsultaQuadroGianomefilial: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 40
      FieldName = 'nomefilial'
      Size = 40
    end
    object qryConsultaQuadroGiaperiodo: TStringField
      DisplayLabel = 'Per'#237'odo'
      FieldName = 'periodo'
      Size = 7
    end
  end
end
