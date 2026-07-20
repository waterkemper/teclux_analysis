inherited dtmGerarGIAEmArquivo: TdtmGerarGIAEmArquivo
  Left = 283
  Top = 220
  Height = 144
  Width = 241
  object qryFiliais: TtecQuery
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
      'select codigo, '
      '          nome,'
      '          razao,'
      '          inscricaoestadual,'
      '          foneddd,'
      '          fonenumero,'
      '          porte,'
      '          simples,'
      '          regime'
      'from filiais')
    RequestLive = True
    Left = 35
    Top = 10
    object qryFiliaiscodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
    object qryFiliaisnome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 40
    end
    object qryFiliaisrazao: TStringField
      FieldName = 'razao'
      Size = 40
    end
    object qryFiliaisinscricaoestadual: TStringField
      FieldName = 'inscricaoestadual'
    end
    object qryFiliaisfoneddd: TIntegerField
      FieldName = 'foneddd'
      DisplayFormat = '0'
    end
    object qryFiliaisfonenumero: TIntegerField
      FieldName = 'fonenumero'
      DisplayFormat = '0'
    end
    object qryFiliaisporte: TStringField
      FieldName = 'porte'
      Size = 1
    end
    object qryFiliaissimples: TStringField
      FieldName = 'simples'
      Size = 1
    end
    object qryFiliaisregime: TIntegerField
      FieldName = 'regime'
      DisplayFormat = '0'
    end
  end
  object dsrFiliais: TtecDataSource
    DataSet = qryFiliais
    Left = 35
    Top = 60
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
      '         q.substressarcimentoICMS'
      'from quadrosgia q'
      'where (filial = :Filial) and'
      '          (periodo = :Data)')
    RequestLive = True
    Left = 150
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
    object qryQuadrosGIAfilial: TIntegerField
      FieldName = 'filial'
      Required = True
      DisplayFormat = '0'
    end
    object qryQuadrosGIAperiodo: TStringField
      Alignment = taCenter
      FieldName = 'periodo'
      Required = True
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
  end
end
