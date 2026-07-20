inherited dtmQuitacaoExtraCaixa: TdtmQuitacaoExtraCaixa
  OldCreateOrder = False
  Left = 194
  Top = 85
  Height = 514
  Width = 686
  object qryParcelas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeScroll = qryParcelasBeforeScroll
    AfterScroll = qryParcelasAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT p.Contrato,'
      '       p.Numero,'
      '       p.DataVencto,'
      '       p.ValorVencto,'
      '       p.DescontoSugerido,'
      '      (p.valorvencto - p.descontosugerido) as Liquido,'
      '       p.DataPagto,'
      '       p.ValorPagto,'
      '       p.TipoPagto,'
      '      (CASE WHEN p.DataPagto IS NOT NULL'
      
        '            THEN (p.ValorPagto - (p.ValorVencto - COALESCE(p.Des' +
        'contoSugerido,0)))'
      '            ELSE NULL'
      '       END) as JurosDesctos,'
      '       p.ContaBoleto,'
      '        p.ObservacaoBoleto,'
      '       p.CartaCliente,'
      '       p.SPCCliente,'
      '       p.CartaAvalista,'
      '       p.SPCAvalista,'
      '       p.ParcelaOrigem,'
      '       p.ParcelaAdicional,'
      '       p.PagamentoExtraCaixa,'
      '       p.FilialPagto,'
      '       p.usuarioextracaixa,'
      '       p.evento,'
      '      (CASE WHEN p.DataPagto IS NOT NULL'
      '            THEN true'
      '            ELSE false'
      '       END) as Quitado,'
      '       false as PodeQuitar,'
      '       false as Alterada'
      'FROM   parcelas p'
      'WHERE  p.Contrato = :Contrato'
      'ORDER BY p.DataVencto, p.Numero')
    RequestLive = True
    Left = 212
    Top = 94
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptUnknown
      end>
    object qryParcelascontrato: TStringField
      FieldName = 'contrato'
    end
    object qryParcelasnumero: TIntegerField
      FieldName = 'numero'
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
      EditFormat = '###,###,##0.00'
    end
    object qryParcelasdatapagto: TDateField
      Alignment = taCenter
      FieldName = 'datapagto'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasvalorpagto: TFloatField
      FieldName = 'valorpagto'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryParcelastipopagto: TStringField
      FieldName = 'tipopagto'
      Size = 1
    end
    object qryParcelasobservacaoboleto: TStringField
      FieldName = 'observacaoboleto'
      Size = 500
    end
    object qryParcelasquitado: TBooleanField
      FieldName = 'quitado'
    end
    object qryParcelaspodequitar: TBooleanField
      FieldName = 'podequitar'
    end
    object qryParcelasparcelaorigem: TStringField
      FieldName = 'parcelaorigem'
      Size = 7
    end
    object qryParcelascartacliente: TIntegerField
      FieldName = 'cartacliente'
      DisplayFormat = '0'
    end
    object qryParcelasspccliente: TIntegerField
      FieldName = 'spccliente'
      DisplayFormat = '0'
    end
    object qryParcelascartaavalista: TIntegerField
      FieldName = 'cartaavalista'
      DisplayFormat = '0'
    end
    object qryParcelasspcavalista: TIntegerField
      FieldName = 'spcavalista'
      DisplayFormat = '0'
    end
    object qryParcelasdescontosugerido: TFloatField
      FieldName = 'descontosugerido'
      DisplayFormat = '###,##0.00'
      EditFormat = '###,##0.00'
    end
    object qryParcelaspagamentoextracaixa: TBooleanField
      DefaultExpression = 'False'
      FieldName = 'pagamentoextracaixa'
    end
    object qryParcelasfilialpagto: TIntegerField
      FieldName = 'filialpagto'
      DisplayFormat = '0'
    end
    object qryParcelasparcelaadicional: TBooleanField
      DefaultExpression = 'False'
      FieldName = 'parcelaadicional'
    end
    object qryParcelasliquido: TFloatField
      FieldName = 'liquido'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryParcelasjurosdesctos: TFloatField
      FieldName = 'jurosdesctos'
      DisplayFormat = '###,##0.00'
      EditFormat = '###,##0.00'
    end
    object qryParcelasusuarioextracaixa: TStringField
      FieldName = 'usuarioextracaixa'
      Size = 50
    end
    object qryParcelasalterada: TBooleanField
      FieldName = 'alterada'
    end
    object qryParcelasContaBoleto: TIntegerField
      FieldName = 'ContaBoleto'
      DisplayFormat = '0'
    end
    object qryParcelasevento: TIntegerField
      FieldName = 'evento'
    end
  end
  object dsrParcelas: TtecDataSource
    DataSet = qryParcelas
    OnDataChange = dsrParcelasDataChange
    Left = 228
    Top = 110
  end
  object qryConsultaClientes: TtecQuery
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
        Name = 'ClausulaWHERE'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'SELECT   v.Codigo,'
      '         coalesce(v.razao,v.Nome) as nome,'
      '         v.Tipo,'
      '         Descricao_TipoCliente(v.Tipo) as TipoCliente,'
      '         Formatar_CPF_CNPJ(v.PessoaNumero) as PessoaNumero,'
      '         v.Estado,'
      '         c.Nome as NomeCidade'
      ''
      'FROM     vfornecedores v, cidades c'
      ''
      '%ClausulaWHERE'
      '    AND v.Estado = c.Estado'
      '    AND v.Cidade = c.Codigo'
      ''
      'ORDER BY UPPER(TO_ASCII(v.nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 88
    Top = 54
    object qryConsultaClientesnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaClientespessoanumero: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'pessoanumero'
      Size = 18
    end
    object qryConsultaClientesnomecidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'nomecidade'
      Size = 30
    end
    object qryConsultaClientesestado: TStringField
      DisplayLabel = 'UF'
      FieldName = 'estado'
      Size = 2
    end
    object qryConsultaClientescodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
    object qryConsultaClientestipocliente: TStringField
      DisplayLabel = 'Tipo cliente'
      FieldName = 'tipocliente'
      Size = 14
    end
    object qryConsultaClientestipo: TStringField
      DisplayLabel = 'TP'
      FieldName = 'tipo'
      Visible = False
      Size = 2
    end
  end
  object dsrClientes: TtecDataSource
    DataSet = qryClientes
    Left = 68
    Top = 41
  end
  object qryClientes: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryClientesAfterOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT v.Codigo,'
      '       v.Nome,'
      '       v.Tipo'
      ''
      'FROM   vfornecedores v'
      'WHERE  v.Codigo = :Codigo AND'
      '       v.Tipo   = :tipo')
    RequestLive = False
    Left = 52
    Top = 25
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'tipo'
        ParamType = ptUnknown
      end>
    object qryClientescodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryClientesnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryClientestipo: TStringField
      FieldName = 'tipo'
      Size = 1
    end
  end
  object qryContratosPorCliente: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterClose = qryContratosPorClienteAfterClose
    AfterScroll = qryContratosPorClienteAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select v.numero,'
      '          v.data,'
      '          v.valor,'
      '          v.situacaocontrato,'
      '          v.nome,'
      '          v.plano'
      'from vficha v'
      'where (v.cliente =:cliente)  and'
      '          (v.tipocliente =:tipo) and'
      '          (v.situacao in ('#39'F'#39','#39'N'#39','#39'P'#39')) and'
      
        '          (0 = coalesce((select count(*) from contratos c1 where' +
        ' c1.origem = v.numero),0)) '
      'order by v.data desc')
    RequestLive = True
    Left = 212
    Top = 22
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end>
    object qryContratosPorClientenumero: TStringField
      FieldName = 'numero'
    end
    object qryContratosPorClientedata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object qryContratosPorClientevalor: TFloatField
      FieldName = 'valor'
    end
    object qryContratosPorClientesituacaocontrato: TStringField
      FieldName = 'situacaocontrato'
      Size = 50
    end
    object qryContratosPorClientenome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryContratosPorClienteplano: TStringField
      FieldName = 'plano'
      Size = 50
    end
  end
  object dsrContratosPorCliente: TtecDataSource
    DataSet = qryContratosPorCliente
    Left = 228
    Top = 39
  end
  object qryNotas: TtecQuery
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
      'Select  n.filial, '
      '            n.serie, '
      '            n.numero'
      'From    notas n, dadosfiscais d'
      'Where (n.dadofiscal = d.numero) '
      '    and (d.contrato =:contrato)'
      '    and not coalesce(d.notavinculada,false)')
    RequestLive = False
    Left = 212
    Top = 164
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Contrato'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryNotasfilial: TIntegerField
      FieldName = 'filial'
      Required = True
      DisplayFormat = '00#'
    end
    object qryNotasserie: TStringField
      FieldName = 'serie'
      Required = True
      Size = 3
    end
    object qryNotasnumero: TIntegerField
      FieldName = 'numero'
      Required = True
    end
  end
  object dsrNotas: TtecDataSource
    DataSet = qryNotas
    Left = 228
    Top = 180
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
      '       b.ModeloCheque,'
      '       a.Nome'
      ''
      ''
      'FROM   Contas c JOIN Bancos b   ON c.Banco   = b.Codigo'
      '                JOIN Agencias a ON c.Banco   = a.Banco AND'
      '                                   c.Agencia = a.Codigo'
      ''
      'WHERE  c.Conta = :Conta'
      '')
    RequestLive = True
    Left = 52
    Top = 104
    ParamData = <
      item
        DataType = ftString
        Name = 'Conta'
        ParamType = ptUnknown
        Value = '0'
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
    object qryContasModeloCheque: TIntegerField
      FieldName = 'ModeloCheque'
      DisplayFormat = '0'
    end
  end
  object dsrContas: TtecDataSource
    DataSet = qryContas
    Left = 68
    Top = 118
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
    Macros = <
      item
        DataType = ftUnknown
        Name = 'SoComModeloCheque'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'SELECT b.Sigla,'
      '       a.Nome,'
      '       c.Conta,'
      '       c.Digito,'
      '       c.Titular,'
      '       c.Banco,'
      '       c.Agencia,'
      '       b.ModeloCheque'
      ''
      'FROM   Contas c JOIN Bancos b   ON c.Banco   = b.Codigo'
      '                JOIN Agencias a ON c.Banco   = a.Banco AND'
      '                                   c.Agencia = a.Codigo'
      '%SoComModeloCheque'
      ''
      
        'ORDER BY b.Sigla, UPPER(TO_ASCII(a.nome,'#39'LATIN1'#39')), UPPER(TO_ASC' +
        'II(c.titular,'#39'LATIN1'#39'))'
      '')
    RequestLive = True
    Left = 80
    Top = 137
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
  object qryEventos: TtecQuery
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
      'SELECT e.Codigo,'
      '       e.Descricao'
      'FROM   eventos e'
      'WHERE  e.Codigo = :Codigo'
      '  AND  e.TipoMovimentacao = '#39'E'#39
      '  AND  ((e.Inativo IS NULL) OR (e.inativo > current_date))'
      '')
    RequestLive = True
    Left = 55
    Top = 190
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryEventosCodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      DisplayFormat = '0'
    end
    object qryEventosDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Size = 50
    end
  end
  object dsrEvento: TtecDataSource
    DataSet = qryEventos
    Left = 73
    Top = 206
  end
  object qryConsultaEventos: TtecQuery
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
      'SELECT e.Descricao,'
      '       e.Codigo'
      'FROM   eventos e                                         '
      'WHERE  e.TipoMovimentacao='#39'E'#39
      '  AND  ((e.Inativo IS NULL) OR (e.inativo > current_date))'
      'ORDER BY UPPER(TO_ASCII(e.descricao,'#39'LATIN1'#39'))'
      '')
    RequestLive = False
    Left = 89
    Top = 222
    object qryConsultaEventosDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 30
      FieldName = 'Descricao'
      Size = 50
    end
    object qryConsultaEventosCodigo: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      DisplayFormat = '##0'
    end
  end
end
