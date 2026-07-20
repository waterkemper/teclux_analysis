inherited dtmParametrosCredito: TdtmParametrosCredito
  Left = 471
  Top = 160
  Height = 360
  Width = 648
  object qryIdade: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeInsert = qryIdadeBeforeInsert
    AfterInsert = qryIdadeAfterInsert
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select *,'
      '          0 as minimo'
      'from parametroscredito'
      'where tabela = 11'
      'order by valor1')
    RequestLive = True
    Left = 26
    Top = 136
    object qryIdadetabela: TIntegerField
      FieldName = 'tabela'
      Required = True
    end
    object qryIdadelinha: TIntegerField
      FieldName = 'linha'
      Required = True
    end
    object qryIdadedescricao: TStringField
      FieldName = 'descricao'
      ReadOnly = True
    end
    object qryIdadevalor1: TIntegerField
      FieldName = 'valor1'
      Required = True
      DisplayFormat = '0'
    end
    object qryIdadevalor2: TIntegerField
      DisplayLabel = 'Pontos'
      FieldName = 'valor2'
      Required = True
      DisplayFormat = '##0'
      EditFormat = '##0'
    end
    object qryIdademinimo: TIntegerField
      DisplayLabel = 'De'
      FieldName = 'minimo'
      Required = True
    end
  end
  object dsrIdade: TtecDataSource
    DataSet = qryIdade
    OnDataChange = dsrIdadeDataChange
    Left = 58
    Top = 149
  end
  object qryParametros: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterInsert = qryParametrosAfterInsert
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select *,'
      '       case when linha <> 3 then cast('#39'(Sim/N'#227'o)'#39' as varchar)'
      '               else cast('#39'(n/N'#227'o)'#39' as varchar)'
      '       end as simnao'
      'from parametroscredito'
      'where tabela = 1'
      'order by linha')
    RequestLive = True
    Left = 24
    Top = 8
    object qryParametrostabela: TIntegerField
      FieldName = 'tabela'
    end
    object qryParametroslinha: TIntegerField
      FieldName = 'linha'
    end
    object qryParametrosdescricao: TStringField
      FieldName = 'descricao'
      ReadOnly = True
      Size = 30
    end
    object qryParametrossimnao: TStringField
      FieldName = 'simnao'
      ReadOnly = True
      Size = 9
    end
    object qryParametrosvalor1: TIntegerField
      FieldName = 'valor1'
    end
    object qryParametrosvalor2: TIntegerField
      FieldName = 'valor2'
    end
  end
  object dsrParametros: TtecDataSource
    DataSet = qryParametros
    Left = 56
    Top = 21
  end
  object qryTelefone: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterInsert = qryTelefoneAfterInsert
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select *'
      'from parametroscredito'
      'where tabela = 7'
      'order by linha;')
    RequestLive = True
    Left = 227
    Top = 72
    object qryTelefonetabela: TIntegerField
      FieldName = 'tabela'
    end
    object qryTelefonelinha: TIntegerField
      FieldName = 'linha'
    end
    object qryTelefonedescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
    object qryTelefonevalor1: TIntegerField
      FieldName = 'valor1'
    end
    object qryTelefonevalor2: TIntegerField
      FieldName = 'valor2'
    end
  end
  object dsrTelefone: TtecDataSource
    DataSet = qryTelefone
    Left = 259
    Top = 86
  end
  object qryResidencia: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterInsert = qryResidenciaAfterInsert
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select *'
      'from parametroscredito'
      'where tabela = 5'
      'order by linha')
    RequestLive = True
    Left = 25
    Top = 72
    object qryResidenciatabela: TIntegerField
      FieldName = 'tabela'
      DisplayFormat = '0'
    end
    object qryResidencialinha: TIntegerField
      FieldName = 'linha'
      DisplayFormat = '0'
    end
    object qryResidenciadescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
    object qryResidenciavalor1: TIntegerField
      FieldName = 'valor1'
      DisplayFormat = '0'
    end
    object qryResidenciavalor2: TIntegerField
      FieldName = 'valor2'
      DisplayFormat = '0'
    end
  end
  object dsrResidencia: TtecDataSource
    DataSet = qryResidencia
    Left = 59
    Top = 86
  end
  object qryReferencia: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterInsert = qryReferenciaAfterInsert
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select *'
      'from parametroscredito'
      'where tabela = 6'
      'order by linha')
    RequestLive = True
    Left = 131
    Top = 72
    object qryReferenciatabela: TIntegerField
      FieldName = 'tabela'
    end
    object qryReferencialinha: TIntegerField
      FieldName = 'linha'
    end
    object qryReferenciadescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
    object qryReferenciavalor1: TIntegerField
      FieldName = 'valor1'
    end
    object qryReferenciavalor2: TIntegerField
      FieldName = 'valor2'
    end
  end
  object dsrReferencia: TtecDataSource
    DataSet = qryReferencia
    Left = 165
    Top = 86
  end
  object qryRendaConjuge: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeInsert = qryRendaConjugeBeforeInsert
    AfterInsert = qryRendaConjugeAfterInsert
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select *,'
      '          0 as minimo'
      'from parametroscredito'
      'where tabela = 15'
      'order by valor1')
    RequestLive = True
    Left = 469
    Top = 136
    object qryRendaConjugetabela: TIntegerField
      FieldName = 'tabela'
      DisplayFormat = '0'
    end
    object qryRendaConjugelinha: TIntegerField
      FieldName = 'linha'
      DisplayFormat = '0'
    end
    object qryRendaConjugedescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
    object qryRendaConjugevalor1: TIntegerField
      FieldName = 'valor1'
      Required = True
      DisplayFormat = '##,##0'
      EditFormat = '##,##0'
    end
    object qryRendaConjugevalor2: TIntegerField
      FieldName = 'valor2'
      Required = True
      DisplayFormat = '0'
      EditFormat = '0'
    end
    object qryRendaConjugeminimo: TIntegerField
      FieldName = 'minimo'
      Required = True
      DisplayFormat = '##,##0'
      EditFormat = '##,##0'
    end
  end
  object dsrRendaConjuge: TtecDataSource
    DataSet = qryRendaConjuge
    OnDataChange = dsrRendaConjugeDataChange
    Left = 501
    Top = 149
  end
  object qryTempoResidencia: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeInsert = qryTempoResidenciaBeforeInsert
    AfterInsert = qryTempoResidenciaAfterInsert
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select *,'
      '          0 as minimo'
      'from parametroscredito'
      'where tabela = 13'
      'order by valor1')
    RequestLive = True
    Left = 246
    Top = 136
    object qryTempoResidenciatabela: TIntegerField
      FieldName = 'tabela'
      Required = True
    end
    object qryTempoResidencialinha: TIntegerField
      FieldName = 'linha'
      Required = True
    end
    object qryTempoResidenciadescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
    object qryTempoResidenciavalor1: TIntegerField
      FieldName = 'valor1'
      Required = True
    end
    object qryTempoResidenciavalor2: TIntegerField
      FieldName = 'valor2'
      Required = True
    end
    object qryTempoResidenciaminimo: TIntegerField
      FieldName = 'minimo'
      Required = True
    end
  end
  object dsrTempoResidencia: TtecDataSource
    DataSet = qryTempoResidencia
    OnDataChange = dsrTempoResidenciaDataChange
    Left = 278
    Top = 149
  end
  object qryTempoServico: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeInsert = qryTempoServicoBeforeInsert
    AfterInsert = qryTempoServicoAfterInsert
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select *,'
      '          0 as minimo'
      'from parametroscredito'
      'where tabela = 14'
      'order by valor1')
    RequestLive = True
    Left = 357
    Top = 136
    object qryTempoServicotabela: TIntegerField
      FieldName = 'tabela'
    end
    object qryTempoServicolinha: TIntegerField
      FieldName = 'linha'
    end
    object qryTempoServicodescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
    object qryTempoServicovalor1: TIntegerField
      FieldName = 'valor1'
      Required = True
    end
    object qryTempoServicovalor2: TIntegerField
      FieldName = 'valor2'
      Required = True
    end
    object qryTempoServicominimo: TIntegerField
      FieldName = 'minimo'
      Required = True
    end
  end
  object dsrTempoServico: TtecDataSource
    DataSet = qryTempoServico
    OnDataChange = dsrTempoServicoDataChange
    Left = 389
    Top = 149
  end
  object qryMDA: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeInsert = qryMDABeforeInsert
    AfterInsert = qryMDAAfterInsert
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select *,'
      '          0 as minimo'
      'from parametroscredito'
      'where tabela = 16'
      'order by valor1')
    RequestLive = True
    Left = 565
    Top = 136
    object qryMDAtabela: TIntegerField
      FieldName = 'tabela'
    end
    object qryMDAlinha: TIntegerField
      FieldName = 'linha'
    end
    object qryMDAdescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
    object qryMDAvalor1: TIntegerField
      FieldName = 'valor1'
      Required = True
    end
    object qryMDAvalor2: TIntegerField
      FieldName = 'valor2'
      Required = True
    end
    object qryMDAminimo: TIntegerField
      FieldName = 'minimo'
      Required = True
    end
  end
  object dsrMDA: TtecDataSource
    DataSet = qryMDA
    OnDataChange = dsrMDADataChange
    Left = 597
    Top = 149
  end
  object qryPrestacoesPagas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeInsert = qryPrestacoesPagasBeforeInsert
    AfterInsert = qryPrestacoesPagasAfterInsert
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select *,'
      '          0 as minimo'
      'from parametroscredito'
      'where tabela = 17'
      'order by valor1')
    RequestLive = True
    Left = 43
    Top = 200
    object qryPrestacoesPagastabela: TIntegerField
      FieldName = 'tabela'
    end
    object qryPrestacoesPagaslinha: TIntegerField
      FieldName = 'linha'
    end
    object qryPrestacoesPagasdescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
    object qryPrestacoesPagasvalor1: TIntegerField
      FieldName = 'valor1'
      Required = True
    end
    object qryPrestacoesPagasvalor2: TIntegerField
      FieldName = 'valor2'
      Required = True
    end
    object qryPrestacoesPagasminimo: TIntegerField
      FieldName = 'minimo'
      Required = True
    end
  end
  object dsrPrestacoesPagas: TtecDataSource
    DataSet = qryPrestacoesPagas
    OnDataChange = dsrPrestacoesPagasDataChange
    Left = 75
    Top = 213
  end
  object qrySexo: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterInsert = qrySexoAfterInsert
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select *'
      'from parametroscredito'
      'where tabela = 8'
      'order by linha;')
    RequestLive = True
    Left = 315
    Top = 72
    object qrySexotabela: TIntegerField
      FieldName = 'tabela'
    end
    object qrySexolinha: TIntegerField
      FieldName = 'linha'
    end
    object qrySexodescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
    object qrySexovalor1: TIntegerField
      FieldName = 'valor1'
    end
    object qrySexovalor2: TIntegerField
      FieldName = 'valor2'
    end
  end
  object dsrSexo: TtecDataSource
    DataSet = qrySexo
    Left = 347
    Top = 86
  end
  object qryNaoInformado: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterInsert = qryNaoInformadoAfterInsert
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select *'
      'from parametroscredito'
      'where tabela = 9'
      'order by linha')
    RequestLive = True
    Left = 411
    Top = 72
    object qryNaoInformadotabela: TIntegerField
      FieldName = 'tabela'
    end
    object qryNaoInformadolinha: TIntegerField
      FieldName = 'linha'
    end
    object qryNaoInformadodescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
    object qryNaoInformadovalor1: TIntegerField
      FieldName = 'valor1'
    end
    object qryNaoInformadovalor2: TIntegerField
      FieldName = 'valor2'
    end
  end
  object dsrNaoInformado: TtecDataSource
    DataSet = qryNaoInformado
    Left = 451
    Top = 86
  end
  object qryEstadoCivil: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterInsert = qryEstadoCivilAfterInsert
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select *'
      'from parametroscredito'
      'where tabela = 10'
      'order by linha')
    RequestLive = True
    Left = 507
    Top = 72
    object qryEstadoCiviltabela: TIntegerField
      FieldName = 'tabela'
    end
    object qryEstadoCivillinha: TIntegerField
      FieldName = 'linha'
    end
    object qryEstadoCivildescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
    object qryEstadoCivilvalor1: TIntegerField
      FieldName = 'valor1'
    end
    object qryEstadoCivilvalor2: TIntegerField
      FieldName = 'valor2'
    end
  end
  object dsrEstadoCivil: TtecDataSource
    DataSet = qryEstadoCivil
    Left = 539
    Top = 86
  end
  object qryTempoCasamento: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeInsert = qryTempoCasamentoBeforeInsert
    AfterInsert = qryTempoCasamentoAfterInsert
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select *,'
      '          0 as minimo'
      'from parametroscredito'
      'where tabela = 12'
      'order by valor1')
    RequestLive = True
    Left = 134
    Top = 136
    object qryTempoCasamentotabela: TIntegerField
      FieldName = 'tabela'
    end
    object qryTempoCasamentolinha: TIntegerField
      FieldName = 'linha'
    end
    object qryTempoCasamentodescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
    object qryTempoCasamentovalor1: TIntegerField
      DisplayLabel = 'At'#233
      FieldName = 'valor1'
      Required = True
    end
    object qryTempoCasamentovalor2: TIntegerField
      DisplayLabel = 'Pontos'
      FieldName = 'valor2'
      Required = True
    end
    object qryTempoCasamentominimo: TIntegerField
      DisplayLabel = 'De'
      FieldName = 'minimo'
      Required = True
    end
  end
  object dsrTempoCasamento: TtecDataSource
    DataSet = qryTempoCasamento
    OnDataChange = dsrTempoCasamentoDataChange
    Left = 166
    Top = 149
  end
  object dsrParametrosUnicos: TtecDataSource
    DataSet = qryParametrosUnicos
    Left = 160
    Top = 21
  end
  object qryParametrosUnicos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterInsert = qryParametrosUnicosAfterInsert
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select *,'
      '          case when linha in (1,5) then cast('#39'dias'#39' as varchar)'
      
        '                    when linha in (3,4) then cast('#39'meses'#39' as var' +
        'char)'
      '                    else cast('#39'% renda'#39' as varchar)'
      '          end as descr'
      'from parametroscredito'
      'where tabela = 2'
      'order by linha')
    RequestLive = True
    Left = 128
    Top = 8
    object qryParametrosUnicoslinha: TIntegerField
      FieldName = 'linha'
      DisplayFormat = '0'
    end
    object qryParametrosUnicosdescricao: TStringField
      FieldName = 'descricao'
      Size = 35
    end
    object qryParametrosUnicosdescr: TStringField
      DisplayWidth = 8
      FieldName = 'descr'
      Size = 8
    end
    object qryParametrosUnicosvalor1: TIntegerField
      FieldName = 'valor1'
      DisplayFormat = '0'
    end
  end
  object qryParametrosLimites: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterInsert = qryParametrosLimitesAfterInsert
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select *'
      'from parametroscredito'
      'where tabela = 3'
      'order by linha')
    RequestLive = True
    Left = 264
    Top = 8
    object qryParametrosLimiteslinha: TIntegerField
      FieldName = 'linha'
    end
    object qryParametrosLimitesdescricao: TStringField
      FieldName = 'descricao'
      Size = 35
    end
    object qryParametrosLimiteslimite: TFloatField
      FieldName = 'limite'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object dsrParametrosLimites: TtecDataSource
    DataSet = qryParametrosLimites
    Left = 296
    Top = 21
  end
  object qryParametrosBooleanos: TtecQuery
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
      'select *'
      'from parametroscredito'
      'where tabela = 4'
      'order by linha')
    RequestLive = True
    Left = 400
    Top = 8
    object qryParametrosBooleanostabela: TIntegerField
      FieldName = 'tabela'
    end
    object qryParametrosBooleanoslinha: TIntegerField
      FieldName = 'linha'
    end
    object qryParametrosBooleanosdescricao: TStringField
      FieldName = 'descricao'
      Size = 35
    end
    object qryParametrosBooleanosvalor1: TIntegerField
      FieldName = 'valor1'
    end
    object qryParametrosBooleanosvalor2: TIntegerField
      FieldName = 'valor2'
    end
    object qryParametrosBooleanoslimite: TFloatField
      FieldName = 'limite'
    end
    object qryParametrosBooleanosbooleano: TBooleanField
      FieldName = 'booleano'
    end
  end
  object dsrParamentrosBooleanos: TtecDataSource
    DataSet = qryParametrosBooleanos
    Left = 432
    Top = 21
  end
  object dsrPontuacao: TtecDataSource
    DataSet = qryPontuacao
    OnDataChange = dsrPontuacaoDataChange
    Left = 190
    Top = 213
  end
  object qryPontuacao: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeInsert = qryPontuacaoBeforeInsert
    AfterInsert = qryPontuacaoAfterInsert
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select *,'
      '          0 as minimo'
      'from parametroscredito'
      'where tabela = 18'
      'order by valor1')
    RequestLive = True
    Left = 158
    Top = 200
    object qryPontuacaotabela: TIntegerField
      FieldName = 'tabela'
    end
    object qryPontuacaolinha: TIntegerField
      FieldName = 'linha'
    end
    object qryPontuacaodescricao: TStringField
      FieldName = 'descricao'
      Size = 35
    end
    object qryPontuacaovalor1: TIntegerField
      FieldName = 'valor1'
    end
    object qryPontuacaovalor2: TIntegerField
      FieldName = 'valor2'
    end
    object qryPontuacaominimo: TIntegerField
      FieldName = 'minimo'
    end
  end
end
