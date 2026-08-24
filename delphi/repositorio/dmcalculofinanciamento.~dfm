inherited dtmCalculoFinanciamento: TdtmCalculoFinanciamento
  Left = 886
  Top = 280
  Height = 482
  Width = 891
  object qryPlanosPagamento: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      
        'Select planos.*,((power((planos.taxamensaljuros/100)+1,12))-1)*1' +
        '00 as taxaanualjuros, tr.descricao as descricaotiporecebimento,'
      'tr.numerorecebimentos, tr.intervalorecebimentos'
      
        'From    planos left join tiposrecebimentos tr on planos.tiporece' +
        'bimento = tr.codigo'
      'Where (planos.codigo =:codigo) and'
      '      ((current_date >= planos.validadeinicial) and'
      '       (current_date <= planos.validadefinal)) and'
      
        '      (planos.compraminima is null or ((planos.compraminima is n' +
        'ot null) and (coalesce(planos.compraminima, 0) <=:valor))) and'
      
        '      (planos.compramaxima is null or ((planos.compramaxima is n' +
        'ot null) and (coalesce(planos.compramaxima, 0) >=:valor)))'
      '/* Preenchido em runtime */'
      '/* Preenchido em runtime */')
    RequestLive = True
    Left = 231
    Top = 15
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftUnknown
        Name = 'valor'
        ParamType = ptUnknown
      end>
    object qryPlanosPagamentocodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
    object qryPlanosPagamentodescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 30
    end
    object qryPlanosPagamentovalidadeinicial: TDateField
      Alignment = taCenter
      FieldName = 'validadeinicial'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryPlanosPagamentovalidadefinal: TDateField
      Alignment = taCenter
      FieldName = 'validadefinal'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryPlanosPagamentoquantidadeparcelas: TIntegerField
      FieldName = 'quantidadeparcelas'
      Required = True
      DisplayFormat = '0'
    end
    object qryPlanosPagamentoalterarvencimento: TBooleanField
      FieldName = 'alterarvencimento'
      Required = True
    end
    object qryPlanosPagamentoalterarvalor: TBooleanField
      FieldName = 'alterarvalor'
      Required = True
    end
    object qryPlanosPagamentoagente: TIntegerField
      FieldName = 'agente'
      DisplayFormat = '0'
    end
    object qryPlanosPagamentotipoplano: TIntegerField
      FieldName = 'tipoplano'
      Required = True
      DisplayFormat = '0'
    end
    object qryPlanosPagamentotipocomissao: TStringField
      FieldName = 'tipocomissao'
      Required = True
      Size = 1
    end
    object qryPlanosPagamentocomissao: TFloatField
      FieldName = 'comissao'
      DisplayFormat = '0.00'
    end
    object qryPlanosPagamentotaxamensaljuros: TFloatField
      FieldName = 'taxamensaljuros'
      DisplayFormat = '0.00'
    end
    object qryPlanosPagamentointervaloparcelas: TIntegerField
      FieldName = 'intervaloparcelas'
      DisplayFormat = '0'
    end
    object qryPlanosPagamentodiavenctoentrada: TDateField
      Alignment = taCenter
      FieldName = 'diavenctoentrada'
      EditMask = '99/99/9999;1; '
    end
    object qryPlanosPagamentoporcentagementrada: TFloatField
      FieldName = 'porcentagementrada'
    end
    object qryPlanosPagamentoprazovenctoentrada: TIntegerField
      FieldName = 'prazovenctoentrada'
      DisplayFormat = '0'
    end
    object qryPlanosPagamentotoleranciaentrada: TIntegerField
      FieldName = 'toleranciaentrada'
      DisplayFormat = '0'
    end
    object qryPlanosPagamentocompraminima: TFloatField
      FieldName = 'compraminima'
      DisplayFormat = '0.00'
    end
    object qryPlanosPagamentocompramaxima: TFloatField
      FieldName = 'compramaxima'
      DisplayFormat = '0.00'
    end
    object qryPlanosPagamentovalorminimoparcela: TFloatField
      FieldName = 'valorminimoparcela'
      DisplayFormat = '0.00'
    end
    object qryPlanosPagamentodescontomaximo: TFloatField
      FieldName = 'descontomaximo'
      DisplayFormat = '0.00'
    end
    object qryPlanosPagamentodiabase: TIntegerField
      FieldName = 'diabase'
      DisplayFormat = '0'
    end
    object qryPlanosPagamentoaposdia: TIntegerField
      FieldName = 'aposdia'
      DisplayFormat = '0'
    end
    object qryPlanosPagamentoimprparcelacarne: TBooleanField
      FieldName = 'imprparcelacarne'
    end
    object qryPlanosPagamentoenderecocompleto: TBooleanField
      FieldName = 'enderecocompleto'
    end
    object qryPlanosPagamentomestrintadias: TBooleanField
      FieldName = 'mestrintadias'
    end
    object qryPlanosPagamentomultiplo: TFloatField
      FieldName = 'multiplo'
    end
    object qryPlanosPagamentotoleranciaentreparcelas: TIntegerField
      FieldName = 'toleranciaentreparcelas'
    end
    object qryPlanosPagamentotaxaanualjuros: TFloatField
      FieldName = 'taxaanualjuros'
    end
    object qryPlanosPagamentotiporecebimento: TIntegerField
      FieldName = 'tiporecebimento'
    end
    object qryPlanosPagamentoalterartiporecebimento: TBooleanField
      FieldName = 'alterartiporecebimento'
    end
    object qryPlanosPagamentoDescricaoTipoRecebimento: TStringField
      FieldName = 'DescricaoTipoRecebimento'
      Size = 100
    end
    object qryPlanosPagamentominimoparcelaaotipodereceb: TBooleanField
      FieldName = 'minimoparcelaaotipodereceb'
    end
    object qryPlanosPagamentonumerorecebimentos: TIntegerField
      FieldName = 'numerorecebimentos'
    end
    object qryPlanosPagamentointervalorecebimentos: TIntegerField
      FieldName = 'intervalorecebimentos'
    end
  end
  object dsrPlanosPagamento: TtecDataSource
    DataSet = qryPlanosPagamento
    Left = 231
    Top = 74
  end
  object qryConsultaPlanosPagamento: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'condicao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'Select codigo,'
      '       descricao'
      'From   planos'
      'Where ((current_date >= validadeinicial) and'
      '       (current_date <= validadefinal))  and'
      
        '      (compraminima is null or ((compraminima is not null) and (' +
        'coalesce(compraminima, 0) <=:valor))) and'
      
        '      (compramaxima is null or ((compramaxima is not null) and (' +
        'coalesce(compramaxima, 0) >=:valor)))'
      ''
      '%condicao'
      ''
      'order by UPPER(TO_ASCII(descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 231
    Top = 135
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'valor'
        ParamType = ptUnknown
      end>
    object qryConsultaPlanosPagamentodescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
    object qryConsultaPlanosPagamentocodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
  object dsrCalculoFinanciamento: TtecDataSource
    DataSet = qryCalculoFinanciamento
    OnDataChange = dsrCalculoFinanciamentoDataChange
    Left = 400
    Top = 74
  end
  object qryCalculoFinanciamento: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryCalculoFinanciamentoAfterOpen
    BeforeInsert = qryCalculoFinanciamentoBeforeInsert
    AfterInsert = qryCalculoFinanciamentoAfterInsert
    BeforeEdit = qryCalculoFinanciamentoBeforeEdit
    OnCalcFields = qryCalculoFinanciamentoCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'Select  0 as parcela,'
      '        0 as prestacao,'
      '        datavencto,'
      '        valorvencto,'
      '        0.00 as valorsubstituicao,'
      '        tiporecebimento,'
      '        false as st,'
      '        cast(null as smallint) as numerorecebimentos'
      'From parcelas'
      'Where contrato =:contrato'
      '')
    RequestLive = True
    Left = 400
    Top = 15
    ParamData = <
      item
        DataType = ftString
        Name = 'contrato'
        ParamType = ptUnknown
      end>
    object qryCalculoFinanciamentoparcela: TIntegerField
      FieldName = 'parcela'
      DisplayFormat = '0'
    end
    object qryCalculoFinanciamentoprestacao: TIntegerField
      FieldName = 'prestacao'
      DisplayFormat = '0'
    end
    object qryCalculoFinanciamentodatavencto: TDateField
      Alignment = taCenter
      FieldName = 'datavencto'
      EditMask = '99/99/9999;1; '
    end
    object qryCalculoFinanciamentovalorvencto: TFloatField
      FieldName = 'valorvencto'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryCalculoFinanciamentotiporecebimento: TIntegerField
      FieldName = 'tiporecebimento'
    end
    object qryCalculoFinanciamentotiporeceb: TStringField
      DisplayLabel = 'Tipo de Recebimento'
      FieldKind = fkLookup
      FieldName = 'tiporeceb'
      LookupDataSet = qryTiposRecebimentos
      LookupKeyFields = 'codigo'
      LookupResultField = 'descricao'
      KeyFields = 'tiporecebimento'
      Required = True
      Size = 100
      Lookup = True
    end
    object qryCalculoFinanciamentoformapagamento: TStringField
      FieldKind = fkLookup
      FieldName = 'formapagamento'
      LookupDataSet = qryTiposRecebimentos
      LookupKeyFields = 'codigo'
      LookupResultField = 'tiporecebimento'
      KeyFields = 'tiporecebimento'
      Size = 50
      Lookup = True
    end
    object qryCalculoFinanciamentost: TBooleanField
      FieldName = 'st'
    end
    object qryCalculoFinanciamentovalorvenctocomst: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'valorvenctocomst'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Calculated = True
    end
    object qryCalculoFinanciamentovalorsubstituicao: TFloatField
      FieldName = 'valorsubstituicao'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryCalculoFinanciamentonumerorecebimentos: TSmallintField
      FieldKind = fkCalculated
      FieldName = 'numerorecebimentos'
      Calculated = True
    end
    object qryCalculoFinanciamentovalornumerorecebimentos: TFloatField
      FieldKind = fkCalculated
      FieldName = 'valornumerorecebimentos'
      Calculated = True
    end
  end
  object qryPlanosComEntrada: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterInsert = qryPlanosComEntradaAfterInsert
    AfterScroll = qryPlanosComEntradaAfterScroll
    OnCalcFields = qryPlanosComEntradaCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'condicao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'Select codigo,'
      '           descricao,'
      '           validadeinicial,'
      '           validadefinal,'
      '           quantidadeparcelas,'
      '           alterarvencimento,'
      '           alterarvalor,'
      '           agente,'
      '           tipoplano,'
      '           tipocomissao, tiporecebimento,'
      '           comissao,'
      '           taxamensaljuros,'
      '           intervaloparcelas,'
      '           diavenctoentrada,'
      '           prazovenctoentrada,'
      '           toleranciaentrada,'
      '           porcentagementrada,'
      '           compraminima,'
      '           compramaxima,'
      '           valorminimoparcela,'
      '           descontomaximo,'
      '           diabase,'
      '           aposdia,'
      '           multiplo,'
      '           imprparcelacarne,'
      '           enderecocompleto,'
      '           cast(0 as numeric) as valorparcela,'
      
        '           cast(null as date) as vencimento, ((power((taxamensal' +
        'juros/100)+1,12))-1)*100 as taxaanualjuros,'
      
        '          (select tr.numerorecebimentos from tiposrecebimentos t' +
        'r where tr.codigo = planos.tiporecebimento) as numerorecebimento' +
        's,'
      
        '          (select tr.intervalorecebimentos from tiposrecebimento' +
        's tr where tr.codigo = planos.tiporecebimento) as intervaloreceb' +
        'imentos,'
      '           minimoparcelaaotipodereceb,'
      '           cast(0 as numeric) as valornumerorecebimentos'
      ''
      'From planos'
      
        'Where ((coalesce(prazovenctoentrada, 0) = 0) or (coalesce(prazov' +
        'enctoentrada, 0) <= coalesce(toleranciaentrada, 0)))'
      '      and (diavenctoentrada is null)'
      
        '      and (compraminima is null or ((compraminima is not null) a' +
        'nd (coalesce(compraminima, 0) <=:valor)))'
      
        '      and (compramaxima is null or ((compramaxima is not null) a' +
        'nd (coalesce(compramaxima, 0) >=:valor)))'
      
        '      and ((current_date >= validadeinicial) and  (current_date ' +
        '<= validadefinal))'
      ''
      '%condicao'
      ''
      'Order By codigo')
    RequestLive = True
    Left = 231
    Top = 208
    ParamData = <
      item
        DataType = ftCurrency
        Name = 'valor'
        ParamType = ptUnknown
        Value = 0c
      end>
    object qryPlanosComEntradacodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
    object qryPlanosComEntradadescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 30
    end
    object qryPlanosComEntradavalorparcela: TFloatField
      FieldName = 'valorparcela'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryPlanosComEntradavencimento: TDateField
      Alignment = taCenter
      FieldName = 'vencimento'
      EditMask = '99/99/9999;1; '
    end
    object qryPlanosComEntradavalidadeinicial: TDateField
      Alignment = taCenter
      FieldName = 'validadeinicial'
      EditMask = '99/99/9999;1; '
    end
    object qryPlanosComEntradavalidadefinal: TDateField
      Alignment = taCenter
      FieldName = 'validadefinal'
      EditMask = '99/99/9999;1; '
    end
    object qryPlanosComEntradaquantidadeparcelas: TIntegerField
      FieldName = 'quantidadeparcelas'
      DisplayFormat = '0'
    end
    object qryPlanosComEntradaalterarvencimento: TBooleanField
      FieldName = 'alterarvencimento'
    end
    object qryPlanosComEntradaalterarvalor: TBooleanField
      FieldName = 'alterarvalor'
    end
    object qryPlanosComEntradaagente: TIntegerField
      FieldName = 'agente'
      DisplayFormat = '0'
    end
    object qryPlanosComEntradatipoplano: TIntegerField
      FieldName = 'tipoplano'
      DisplayFormat = '0'
    end
    object qryPlanosComEntradatipocomissao: TStringField
      FieldName = 'tipocomissao'
      Size = 1
    end
    object qryPlanosComEntradacomissao: TFloatField
      FieldName = 'comissao'
      DisplayFormat = '0.00'
    end
    object qryPlanosComEntradataxamensaljuros: TFloatField
      FieldName = 'taxamensaljuros'
      DisplayFormat = '0.00'
    end
    object qryPlanosComEntradaintervaloparcelas: TIntegerField
      FieldName = 'intervaloparcelas'
      DisplayFormat = '0'
    end
    object qryPlanosComEntradadiavenctoentrada: TDateField
      Alignment = taCenter
      FieldName = 'diavenctoentrada'
      EditMask = '99/99/9999;1; '
    end
    object qryPlanosComEntradaprazovenctoentrada: TIntegerField
      FieldName = 'prazovenctoentrada'
      DisplayFormat = '0'
    end
    object qryPlanosComEntradatoleranciaentrada: TIntegerField
      FieldName = 'toleranciaentrada'
      DisplayFormat = '0'
    end
    object qryPlanosComEntradaporcentagementrada: TFloatField
      FieldName = 'porcentagementrada'
      DisplayFormat = '0'
    end
    object qryPlanosComEntradacompraminima: TFloatField
      FieldName = 'compraminima'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryPlanosComEntradacompramaxima: TFloatField
      DisplayLabel = '###,###,##0.00'
      FieldName = 'compramaxima'
      DisplayFormat = '0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryPlanosComEntradavalorminimoparcela: TFloatField
      FieldName = 'valorminimoparcela'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryPlanosComEntradadescontomaximo: TFloatField
      DisplayLabel = '###,###,##0.00'
      FieldName = 'descontomaximo'
      DisplayFormat = '0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryPlanosComEntradadiabase: TIntegerField
      FieldName = 'diabase'
      DisplayFormat = '0'
    end
    object qryPlanosComEntradaaposdia: TIntegerField
      FieldName = 'aposdia'
      DisplayFormat = '0'
    end
    object qryPlanosComEntradaimprparcelacarne: TBooleanField
      FieldName = 'imprparcelacarne'
    end
    object qryPlanosComEntradaenderecocompleto: TBooleanField
      FieldName = 'enderecocompleto'
    end
    object qryPlanosComEntradamultiplo: TFloatField
      FieldName = 'multiplo'
      DisplayFormat = '0.00'
    end
    object qryPlanosComEntradataxaanualjuros: TFloatField
      FieldName = 'taxaanualjuros'
      DisplayFormat = '0.00'
    end
    object qryPlanosComEntradatiporecebimento: TIntegerField
      FieldName = 'tiporecebimento'
    end
    object qryPlanosComEntradanumerorecebimentos: TIntegerField
      FieldName = 'numerorecebimentos'
    end
    object qryPlanosComEntradaintervalorecebimentos: TIntegerField
      FieldName = 'intervalorecebimentos'
    end
    object qryPlanosComEntradavalornumerorecebimentos: TFloatField
      FieldKind = fkCalculated
      FieldName = 'valornumerorecebimentos'
      DisplayFormat = '###,###,##0.00'
      currency = True
      Calculated = True
    end
    object qryPlanosComEntradaminimoparcelaaotipodereceb: TBooleanField
      FieldName = 'minimoparcelaaotipodereceb'
    end
  end
  object dsrPlanosComEntrada: TtecDataSource
    DataSet = qryPlanosComEntrada
    Left = 400
    Top = 192
  end
  object qryPlanosSemEntrada: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterInsert = qryPlanosSemEntradaAfterInsert
    AfterScroll = qryPlanosSemEntradaAfterScroll
    OnCalcFields = qryPlanosSemEntradaCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'condicao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      '/* qryPlanosSemEntrada */'
      ''
      'Select codigo,'
      '           descricao,'
      '           validadeinicial,'
      '           validadefinal,'
      '           quantidadeparcelas,'
      '           alterarvencimento,'
      '           alterarvalor,'
      '           agente,'
      '           tipoplano,'
      '           tipocomissao, tiporecebimento,'
      '           comissao,'
      '           taxamensaljuros,'
      '           intervaloparcelas,'
      '           diavenctoentrada,'
      '           prazovenctoentrada,'
      '           toleranciaentrada,'
      '           porcentagementrada,'
      '           compraminima,'
      '           compramaxima,'
      '           valorminimoparcela,'
      '           descontomaximo,'
      '           diabase,'
      '           aposdia,'
      '           multiplo,'
      '           imprparcelacarne,'
      '           enderecocompleto,'
      '           cast(0 as numeric) as valorparcela,'
      
        '           cast(null as date) as vencimento, ((power((taxamensal' +
        'juros/100)+1,12))-1)*100 as taxaanualjuros,'
      
        '           (select tr.numerorecebimentos from tiposrecebimentos ' +
        'tr where tr.codigo = planos.tiporecebimento) as numerorecebiment' +
        'os,'
      
        '           (select tr.intervalorecebimentos from tiposrecebiment' +
        'os tr where tr.codigo = planos.tiporecebimento) as intervalorece' +
        'bimentos,'
      '            minimoparcelaaotipodereceb,'
      '           cast(0 as numeric) as valornumerorecebimentos'
      ''
      'From planos'
      
        'Where ((coalesce(prazovenctoentrada, 0) >  coalesce(toleranciaen' +
        'trada, 0)) or  (diavenctoentrada is not null))'
      
        '      and (compraminima is null or ((compraminima is not null) a' +
        'nd (coalesce(compraminima, 0) <=:valor)))'
      
        '      and (compramaxima is null or ((compramaxima is not null) a' +
        'nd (coalesce(compramaxima, 0) >=:valor)))'
      
        '      and ((current_date >= validadeinicial) and  (current_date ' +
        '<= validadefinal))'
      ''
      '%condicao'
      ''
      ''
      'Order By codigo'
      #9)
    RequestLive = True
    Left = 239
    Top = 248
    ParamData = <
      item
        DataType = ftCurrency
        Name = 'valor'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryPlanosSemEntradacodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
    object qryPlanosSemEntradadescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 30
    end
    object qryPlanosSemEntradavalorparcela: TFloatField
      FieldName = 'valorparcela'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryPlanosSemEntradavencimento: TDateField
      Alignment = taCenter
      FieldName = 'vencimento'
      EditMask = '99/99/9999;1; '
    end
    object qryPlanosSemEntradavalidadeinicial: TDateField
      Alignment = taCenter
      FieldName = 'validadeinicial'
      EditMask = '99/99/9999;1; '
    end
    object qryPlanosSemEntradavalidadefinal: TDateField
      Alignment = taCenter
      FieldName = 'validadefinal'
      EditMask = '99/99/9999;1; '
    end
    object qryPlanosSemEntradaquantidadeparcelas: TIntegerField
      FieldName = 'quantidadeparcelas'
      DisplayFormat = '0'
    end
    object qryPlanosSemEntradaalterarvencimento: TBooleanField
      FieldName = 'alterarvencimento'
    end
    object qryPlanosSemEntradaalterarvalor: TBooleanField
      FieldName = 'alterarvalor'
    end
    object qryPlanosSemEntradaagente: TIntegerField
      FieldName = 'agente'
      DisplayFormat = '0'
    end
    object qryPlanosSemEntradatipoplano: TIntegerField
      FieldName = 'tipoplano'
      DisplayFormat = '0'
    end
    object qryPlanosSemEntradatipocomissao: TStringField
      FieldName = 'tipocomissao'
      Size = 1
    end
    object qryPlanosSemEntradacomissao: TFloatField
      FieldName = 'comissao'
      DisplayFormat = '0.00'
    end
    object qryPlanosSemEntradataxamensaljuros: TFloatField
      FieldName = 'taxamensaljuros'
      DisplayFormat = '0.00'
    end
    object qryPlanosSemEntradaintervaloparcelas: TIntegerField
      FieldName = 'intervaloparcelas'
      DisplayFormat = '0'
    end
    object qryPlanosSemEntradadiavenctoentrada: TDateField
      Alignment = taCenter
      FieldName = 'diavenctoentrada'
      EditMask = '99/99/9999;1; '
    end
    object qryPlanosSemEntradaprazovenctoentrada: TIntegerField
      FieldName = 'prazovenctoentrada'
      DisplayFormat = '0'
    end
    object qryPlanosSemEntradatoleranciaentrada: TIntegerField
      FieldName = 'toleranciaentrada'
      DisplayFormat = '0'
    end
    object qryPlanosSemEntradaporcentagementrada: TFloatField
      FieldName = 'porcentagementrada'
      DisplayFormat = '0.00'
    end
    object qryPlanosSemEntradacompraminima: TFloatField
      FieldName = 'compraminima'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryPlanosSemEntradacompramaxima: TFloatField
      FieldName = 'compramaxima'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryPlanosSemEntradavalorminimoparcela: TFloatField
      FieldName = 'valorminimoparcela'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryPlanosSemEntradadescontomaximo: TFloatField
      FieldName = 'descontomaximo'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryPlanosSemEntradadiabase: TIntegerField
      FieldName = 'diabase'
      DisplayFormat = '0'
    end
    object qryPlanosSemEntradaaposdia: TIntegerField
      FieldName = 'aposdia'
      DisplayFormat = '0'
    end
    object qryPlanosSemEntradaimprparcelacarne: TBooleanField
      FieldName = 'imprparcelacarne'
    end
    object qryPlanosSemEntradaenderecocompleto: TBooleanField
      FieldName = 'enderecocompleto'
    end
    object qryPlanosSemEntradamultiplo: TFloatField
      FieldName = 'multiplo'
    end
    object qryPlanosSemEntradataxaanualjuros: TFloatField
      FieldName = 'taxaanualjuros'
    end
    object qryPlanosSemEntradatiporecebimento: TIntegerField
      FieldName = 'tiporecebimento'
    end
    object qryPlanosSemEntradanumerorecebimentos: TIntegerField
      FieldName = 'numerorecebimentos'
    end
    object qryPlanosSemEntradaintervalorecebimentos: TIntegerField
      FieldName = 'intervalorecebimentos'
    end
    object qryPlanosSemEntradavalornumerorecebimentos: TFloatField
      FieldKind = fkCalculated
      FieldName = 'valornumerorecebimentos'
      DisplayFormat = '###,###,##0.00'
      Calculated = True
    end
    object qryPlanosSemEntradaminimoparcelaaotipodereceb: TBooleanField
      FieldName = 'minimoparcelaaotipodereceb'
    end
  end
  object dsrPlanosSemEntrada: TtecDataSource
    DataSet = qryPlanosSemEntrada
    Left = 400
    Top = 248
  end
  object qryGruposPlanos: TtecQuery
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
      'select plano, grupo'
      'from planosgrupos'
      'where grupo in ('
      '/* Preenchido em runtime */ '#39#39
      ')'
      'order by plano, grupo')
    RequestLive = False
    Left = 70
    Top = 220
    object qryGruposPlanosplano: TIntegerField
      FieldName = 'plano'
    end
    object qryGruposPlanosgrupo: TStringField
      FieldName = 'grupo'
      Size = 4
    end
  end
  object qryClassesPlanos: TtecQuery
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
      'select plano, classe'
      'from planosclasses'
      'where classe in ('
      '/* Preenchido em runtime */ '#39#39
      '                   )'
      'order by plano, classe')
    RequestLive = False
    Left = 70
    Top = 150
    object qryClassesPlanosplano: TIntegerField
      FieldName = 'plano'
    end
    object qryClassesPlanosclasse: TStringField
      FieldName = 'classe'
      Size = 2
    end
  end
  object qryTiposRecebimentos: TtecQuery
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
      'select selecao.* from'
      '('
      '  select codigo,'
      '         descricao,'
      '         tiporecebimento,'
      '         numerorecebimentos'
      ''
      '  from tiposrecebimentos'
      '  where inativo is null'
      '    and coalesce(permitirselecionar,false)'
      ''
      '  union all'
      '  select 0 as codigo,'
      '         '#39#39' as descricao,'
      '         '#39#39' as tiporecebimento,'
      '         cast(null as smallint) as numerorecebimentos'
      ') as selecao'
      'order by selecao.descricao')
    RequestLive = False
    Left = 400
    Top = 131
    object qryTiposRecebimentoscodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryTiposRecebimentosdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object qryTiposRecebimentostiporecebimento: TStringField
      FieldName = 'tiporecebimento'
      Size = 1
    end
    object qryTiposRecebimentosnumerorecebimentos: TIntegerField
      FieldName = 'numerorecebimentos'
    end
  end
  object qryDiaCobrancaSubstituicao: TtecQuery
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
      'select diacobrancasubstituicao(:filialbase, :data) as dia')
    RequestLive = False
    Left = 72
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filialbase'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'data'
        ParamType = ptUnknown
      end>
    object qryDiaCobrancaSubstituicaodia: TDateField
      Alignment = taCenter
      FieldName = 'dia'
      EditMask = '99/99/9999;1; '
    end
  end
end
