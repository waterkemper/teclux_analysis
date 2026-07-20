inherited dtmLerRetornos: TdtmLerRetornos
  Left = 320
  Top = 213
  Height = 308
  Width = 622
  object qryBancos: TtecQuery
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
      'Select codigo,'
      '           nome,'
      '           sigla,'
      '           inativo,'
      '           modelocheque,'
      '           diasuteisremessa,'
      '           valorlimitecheque,'
      '           qtdechequevista,'
      '           qtdechequeprazo,'
      '           sequencial '
      'From   bancos'
      'Where codigo=:codigo')
    RequestLive = True
    Left = 21
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryBancoscodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
    object qryBancosnome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object qryBancossigla: TStringField
      FieldName = 'sigla'
      Size = 10
    end
    object qryBancosinativo: TDateField
      Alignment = taCenter
      FieldName = 'inativo'
      EditMask = '99/99/9999;1; '
    end
    object qryBancosmodelocheque: TIntegerField
      FieldName = 'modelocheque'
      DisplayFormat = '0'
    end
    object qryBancosdiasuteisremessa: TIntegerField
      FieldName = 'diasuteisremessa'
      DisplayFormat = '0'
    end
    object qryBancosvalorlimitecheque: TFloatField
      FieldName = 'valorlimitecheque'
      DisplayFormat = '0.00'
    end
    object qryBancosqtdechequevista: TIntegerField
      FieldName = 'qtdechequevista'
      DisplayFormat = '0'
    end
    object qryBancosqtdechequeprazo: TIntegerField
      FieldName = 'qtdechequeprazo'
      DisplayFormat = '0'
    end
    object qryBancossequencial: TIntegerField
      FieldName = 'sequencial'
      DisplayFormat = '0'
    end
  end
  object dsrBancos: TtecDataSource
    DataSet = qryBancos
    Left = 108
    Top = 72
  end
  object qryConsultaBancos: TtecQuery
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
      'Select sigla, '
      '           nome,'
      '           codigo '
      'from bancos'
      'order by nome')
    RequestLive = False
    Left = 210
    Top = 71
    object qryConsultaBancosnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 50
    end
    object qryConsultaBancossigla: TStringField
      DisplayLabel = 'Sigla'
      DisplayWidth = 15
      FieldName = 'sigla'
      Size = 15
    end
    object qryConsultaBancoscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
  end
  object dsrParcelas: TtecDataSource
    DataSet = qryParcelas
    Left = 338
    Top = 72
  end
  object qryParcelas: TtecQuery
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
      'Select p.contrato,'
      '       p.numero,'
      '       p.datavencto,'
      '       p.valorvencto,'
      '       p.datapagto,'
      '       p.valorpagto,'
      '       p.remessa,'
      '       ct.cliente,'
      '       ct.nome,'
      '       ct.filialvenda,'
      '       ct.faturamento,'
      '       ct.pessoatipo,'
      '       ct.iddocumento as documento,'
      '       ct.rua,'
      '       ct.pessoanumero as inscricao,  /* inscricao  estadual*/'
      '       ct.cep,'
      '       f.nome as nomefilial'
      'From clientes c, contratos ct, parcelas p, filiais f'
      'Where ct.numero = p.contrato  and c.codigo = ct.cliente'
      '      and ct.filialvenda = f.codigo'
      '      and p.datapagto is null'
      '      and ct.situacao in ('#39'F'#39','#39'N'#39','#39'P'#39')'
      '      and contratos_atual(ct.numero)'
      
        '      and p.datavencto between (:VenctoInicial) and (:VenctoFina' +
        'l)'
      '      /* Where DataVenda      */'
      '      /* Where Nota Fiscal    */'
      '      /* ct.Filial            */'
      '      /* ct.Cliente           */'
      '      /* p.gerados            */'
      'Order by ct.nome, p.contrato, p.datavencto'
      ''
      '')
    RequestLive = True
    Left = 337
    Top = 9
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'venctoinicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'venctofinal'
        ParamType = ptUnknown
      end>
    object qryParcelascontrato: TStringField
      FieldName = 'contrato'
      Required = True
    end
    object qryParcelasnumero: TIntegerField
      FieldName = 'numero'
      Required = True
    end
    object qryParcelasdatavencto: TDateField
      FieldName = 'datavencto'
      Required = True
    end
    object qryParcelasvalorvencto: TFloatField
      FieldName = 'valorvencto'
      Required = True
    end
    object qryParcelasdatapagto: TDateField
      FieldName = 'datapagto'
    end
    object qryParcelasvalorpagto: TFloatField
      FieldName = 'valorpagto'
    end
    object qryParcelasremessa: TStringField
      FieldName = 'remessa'
      Size = 8
    end
    object qryParcelascliente: TIntegerField
      FieldName = 'cliente'
    end
    object qryParcelasnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryParcelasfilialvenda: TIntegerField
      FieldName = 'filialvenda'
    end
    object qryParcelasfaturamento: TDateField
      FieldName = 'faturamento'
    end
    object qryParcelaspessoatipo: TStringField
      FieldName = 'pessoatipo'
      Size = 1
    end
    object qryParcelasdocumento: TStringField
      FieldName = 'documento'
    end
    object qryParcelasrua: TStringField
      FieldName = 'rua'
      Size = 100
    end
    object qryParcelasinscricao: TStringField
      FieldName = 'inscricao'
      Size = 14
    end
    object qryParcelascep: TIntegerField
      FieldName = 'cep'
    end
    object qryParcelasnomefilial: TStringField
      FieldName = 'nomefilial'
      Size = 40
    end
  end
  object qryAtualizarParcelas: TtecQuery
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
      'update parcelas set remessa=:remessa'
      '  Where contrato = : contrato and'
      '               numero = : numero'
      ' '
      '        ')
    RequestLive = True
    Left = 428
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'remessa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'contrato'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'numero'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object qryFiliais: TtecQuery
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
      'Select  codigo, '
      '            nome,'
      '            inscricaoestadual'
      'From    filiais'
      'Where codigo=:codigo')
    RequestLive = True
    Active = True
    Left = 20
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryFiliaiscodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryFiliaisnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryFiliaisinscricaoestadual: TStringField
      FieldName = 'inscricaoestadual'
    end
  end
  object dsrFiliais: TtecDataSource
    DataSet = qryFiliais
    Left = 107
    Top = 16
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
      'Select nome,'
      '           codigo'
      'From   filiais'
      'Order By nome')
    RequestLive = False
    Left = 208
    Top = 16
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
end
