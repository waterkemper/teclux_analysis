inherited dtmEstornoRecebimentos: TdtmEstornoRecebimentos
  OldCreateOrder = False
  Left = 659
  Top = 249
  Height = 441
  Width = 558
  object qryParcelas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'DataVencto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataPagto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GrupoFilial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ContaBoleto'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'SELECT p.contrato,'
      
        '       cast((select string_agg(cast(n.numero as varchar(20)),'#39','#39 +
        ')'
      '        from notas n'
      '             join dadosfiscais df '
      '             on n.dadofiscal = df.numero'
      '        where df.contrato = p.contrato'
      '          and df.situacao = '#39'N'#39') as varchar(100)) as notas,'
      '       p.numero,'
      '       p.datavencto,'
      '       p.valorvencto,'
      '       p.datapagto,'
      '       p.valorpagto,'
      '       p.filialpagto,'
      '       p.parcelaorigem,'
      '       coalesce(p.descontosugerido,0.00) as descontosugerido,'
      '       p.usuarioextracaixa,'
      '       p.dataestorno,'
      '       p.usuarioestorno,'
      
        '       (select cliente from contratos where numero = p.contrato)' +
        ' as cliente,'
      
        '       (select nome from contratos where numero = p.contrato) as' +
        ' nomecliente,'
      '       p.tiporecebimento,'
      '       t.descricao,'
      '       p.transacao,'
      '       ( select count(*)'
      '         FROM recebimentos r,tiposrecebimentos tr'
      '         WHERE r.transacao=p.transacao'
      '         and tr.codigo=r.tiporecebimento'
      '         and confirmado=true'
      '         and situacao='#39'N'#39
      
        '         and not (tr.diasuteis=0 and tr.tiporecebimento='#39'D'#39')) as' +
        ' confirmados,'
      '       false as selecionar'
      ''
      
        'FROM parcelas p left join tiposrecebimentos t on (t.codigo=p.tip' +
        'orecebimento)'
      'WHERE datapagto is not null'
      '  AND valorpagto is not null'
      '  AND pagamentoextracaixa'
      '  %DataVencto'
      '  %DataPagto'
      '  %Cliente'
      '  %Filial'
      '  %GrupoFilial'
      '  %ContaBoleto')
    RequestLive = True
    Left = 40
    Top = 8
    object qryParcelascontrato: TStringField
      FieldName = 'contrato'
      Required = True
    end
    object qryParcelasnumero: TIntegerField
      FieldName = 'numero'
      Required = True
      DisplayFormat = '0'
    end
    object qryParcelasdatavencto: TDateField
      Alignment = taCenter
      FieldName = 'datavencto'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasvalorvencto: TFloatField
      FieldName = 'valorvencto'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryParcelasfilialpagto: TIntegerField
      FieldName = 'filialpagto'
      DisplayFormat = '0'
    end
    object qryParcelasparcelaorigem: TStringField
      FieldName = 'parcelaorigem'
      Size = 7
    end
    object qryParcelasdescontosugerido: TFloatField
      FieldName = 'descontosugerido'
      DisplayFormat = '###,###,##0.00'
    end
    object qryParcelasusuarioextracaixa: TStringField
      FieldName = 'usuarioextracaixa'
      Size = 50
    end
    object qryParcelasselecionar: TBooleanField
      FieldName = 'selecionar'
    end
    object qryParcelasdatapagto: TDateField
      Alignment = taCenter
      FieldName = 'datapagto'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasvalorpagto: TFloatField
      FieldName = 'valorpagto'
      DisplayFormat = '###,###,##0.00'
    end
    object qryParcelascliente: TIntegerField
      FieldName = 'cliente'
    end
    object qryParcelasnomecliente: TStringField
      FieldName = 'nomecliente'
      Size = 40
    end
    object qryParcelasdataestorno: TDateTimeField
      FieldName = 'dataestorno'
    end
    object qryParcelasusuarioestorno: TStringField
      FieldName = 'usuarioestorno'
      Size = 50
    end
    object qryParcelastiporecebimento: TIntegerField
      FieldName = 'tiporecebimento'
    end
    object qryParcelasdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object qryParcelasconfirmados: TLargeintField
      FieldName = 'confirmados'
    end
    object qryParcelastransacao: TIntegerField
      FieldName = 'transacao'
    end
    object qryParcelasnotas: TStringField
      FieldName = 'notas'
      Size = 100
    end
  end
  object dsrParcelas: TtecDataSource
    DataSet = qryParcelas
    Left = 56
    Top = 21
  end
  object qryFilial: TtecQuery
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
      'SELECT f.Codigo,'
      '       f.Nome'
      'FROM   filiais f'
      'WHERE  f.Codigo = :Codigo')
    RequestLive = True
    Left = 45
    Top = 79
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Codigo'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryFilialCodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      DisplayFormat = '0'
    end
    object qryFilialNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
  end
  object dsrFilial: TtecDataSource
    DataSet = qryFilial
    Left = 60
    Top = 91
  end
  object qryGrupoFiliais: TtecQuery
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
      'SELECT g.Codigo,'
      '       g.Descricao'
      'FROM   gruposfiliais g'
      'WHERE  g.Codigo = :Codigo')
    RequestLive = True
    Left = 45
    Top = 142
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Codigo'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryGrupoFiliaisCodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      DisplayFormat = '0'
    end
    object qryGrupoFiliaisDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Size = 30
    end
  end
  object dsrGrupoFiliais: TtecDataSource
    DataSet = qryGrupoFiliais
    Left = 63
    Top = 155
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
      'SELECT f.Nome,'
      '       f.Codigo'
      ''
      'FROM   filiais f'
      ''
      'ORDER BY UPPER(TO_ASCII(f.nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 175
    Top = 79
    object qryConsultaFiliaisNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object qryConsultaFiliaiscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      DisplayFormat = '0'
    end
  end
  object qryConsultaGrupoFiliais: TtecQuery
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
      'SELECT   g.Descricao,'
      '         g.Codigo'
      ''
      'FROM     gruposfiliais g'
      ''
      'ORDER BY UPPER(TO_ASCII(g.descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 175
    Top = 134
    object qryConsultaGrupoFiliaisDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Size = 30
    end
    object qryConsultaGrupoFiliaisCodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
    end
  end
  object qryConsultaContas: TtecQuery
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
    DataSource = dsrContas
    Sql.Strings = (
      'SELECT b.Sigla,'
      '       a.Nome,'
      '       c.Conta,'
      '       c.Digito,'
      '       c.Titular,'
      '       c.Banco,'
      '       c.Agencia'
      ''
      'FROM   Contas c JOIN Bancos b   ON c.Banco   = b.Codigo'
      '                JOIN Agencias a ON c.Banco   = a.Banco AND'
      '                                   c.Agencia = a.Codigo'
      ''
      
        'ORDER BY b.Sigla, UPPER(TO_ASCII(a.nome,'#39'LATIN1'#39')), UPPER(TO_ASC' +
        'II(c.titular,'#39'LATIN1'#39'))'
      '')
    RequestLive = True
    Left = 175
    Top = 281
    object qryConsultaContasSigla: TStringField
      FieldName = 'Sigla'
      Size = 10
    end
    object qryConsultaContasNome: TStringField
      DisplayLabel = 'Nome da Ag'#234'ncia'
      FieldName = 'Nome'
      Size = 30
    end
    object qryConsultaContasConta: TIntegerField
      FieldName = 'Conta'
      DisplayFormat = '0'
    end
    object qryConsultaContasDigito: TStringField
      Alignment = taCenter
      DisplayLabel = 'D'
      FieldName = 'Digito'
      Size = 2
    end
    object qryConsultaContasTitular: TStringField
      FieldName = 'Titular'
      Size = 50
    end
    object qryConsultaContasAgencia: TIntegerField
      FieldName = 'Agencia'
      Visible = False
      DisplayFormat = '0'
    end
    object qryConsultaContasBanco: TIntegerField
      FieldName = 'Banco'
      Visible = False
      DisplayFormat = '0'
    end
  end
  object qryContas: TtecQuery
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
      'SELECT c.Banco,'
      '       c.Agencia,'
      '       c.Conta,'
      '       c.Digito,'
      '       c.Titular,'
      '       b.Sigla,'
      '       a.Nome,'
      '       c.contacontabil '
      ''
      'FROM   Contas c JOIN Bancos b   ON c.Banco   = b.Codigo'
      '                JOIN Agencias a ON c.Banco   = a.Banco AND'
      '                                   c.Agencia = a.Codigo'
      ''
      'WHERE  c.Conta = :Conta'
      ''
      ''
      '')
    RequestLive = True
    Left = 48
    Top = 279
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Conta'
        ParamType = ptUnknown
      end>
    object qryContasBanco: TIntegerField
      FieldName = 'Banco'
      Required = True
      DisplayFormat = '0'
    end
    object qryContasAgencia: TIntegerField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'Agencia'
      Required = True
      DisplayFormat = '0'
    end
    object qryContasConta: TIntegerField
      FieldName = 'Conta'
      Required = True
      DisplayFormat = '0'
    end
    object qryContasDigito: TStringField
      DisplayLabel = 'D'#237'gito'
      FieldName = 'Digito'
      Required = True
      Size = 2
    end
    object qryContasTitular: TStringField
      FieldName = 'Titular'
      Size = 50
    end
    object qryContasSigla: TStringField
      FieldName = 'Sigla'
      Size = 10
    end
    object qryContasNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
    object qryContascontacontabil: TIntegerField
      FieldName = 'contacontabil'
    end
  end
  object dsrContas: TtecDataSource
    DataSet = qryContas
    Left = 60
    Top = 290
  end
  object qryEstornarParcelas: TtecQuery
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
      'SELECT p.contrato,'
      '       p.numero,'
      '       p.datapagto,'
      '       p.valorpagto,'
      '       p.filialpagto,'
      '       p.tipopagto,'
      '       p.parcelaorigem,'
      '       p.descontosugerido,'
      '       p.contaboleto,'
      '       p.observacaoboleto,'
      '       p.dataestorno,'
      '       p.usuarioestorno'
      'FROM parcelas p'
      'WHERE contrato = cast(:contrato as varchar)'
      '  AND numero = :numero')
    RequestLive = True
    Left = 175
    Top = 15
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end>
    object qryEstornarParcelascontrato: TStringField
      FieldName = 'contrato'
      Required = True
    end
    object qryEstornarParcelasnumero: TIntegerField
      FieldName = 'numero'
      Required = True
    end
    object qryEstornarParcelasdatapagto: TDateField
      FieldName = 'datapagto'
    end
    object qryEstornarParcelasvalorpagto: TFloatField
      FieldName = 'valorpagto'
      DisplayFormat = '###,###,##0.00'
    end
    object qryEstornarParcelasfilialpagto: TIntegerField
      FieldName = 'filialpagto'
    end
    object qryEstornarParcelastipopagto: TStringField
      FieldName = 'tipopagto'
      Size = 1
    end
    object qryEstornarParcelasparcelaorigem: TStringField
      FieldName = 'parcelaorigem'
      Required = True
      Size = 7
    end
    object qryEstornarParcelasdescontosugerido: TFloatField
      FieldName = 'descontosugerido'
      DisplayFormat = '###,###,##0.00'
    end
    object qryEstornarParcelascontaboleto: TIntegerField
      FieldName = 'contaboleto'
    end
    object qryEstornarParcelasobservacaoboleto: TStringField
      FieldName = 'observacaoboleto'
      Size = 500
    end
    object qryEstornarParcelasdataestorno: TDateTimeField
      FieldName = 'dataestorno'
    end
    object qryEstornarParcelasusuarioestorno: TStringField
      FieldName = 'usuarioestorno'
      Size = 50
    end
  end
  object qryAtualizaRecebimentos: TtecQuery
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
      'update recebimentos set situacao='#39'C'#39' where transacao=:transacao')
    RequestLive = False
    Left = 288
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'transacao'
        ParamType = ptUnknown
      end>
  end
end
