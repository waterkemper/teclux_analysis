inherited dtmAcertarCarnesRenegociado: TdtmAcertarCarnesRenegociado
  OldCreateOrder = False
  Left = 397
  Top = 55
  Height = 566
  Width = 579
  object qryParcelas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnNewRecord = qryParcelasNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT p.Contrato,'
      '       p.Numero,'
      '       p.DataVencto,'
      '       p.ValorVencto,'
      '       p.DescontoSugerido,'
      '      (p.valorvencto - p.descontosugerido) as liquido,'
      ''
      '       p.DataPagto,'
      '       p.ValorPagto,'
      '       p.TipoPagto,'
      '      (CASE WHEN p.DataPagto IS NOT NULL'
      
        '            THEN (p.ValorPagto - (p.ValorVencto - COALESCE(p.Des' +
        'contoSugerido,0)))'
      '            ELSE NULL'
      '       END) as JurosDesctos,'
      ''
      '       p.ContaBoleto,'
      ''
      '      (SELECT c.Digito FROM  Contas c'
      
        '                            WHERE c.Conta = p.ContaBoleto) as Di' +
        'gito,'
      ''
      '      (SELECT b.Sigla FROM  Bancos b'
      
        '                      WHERE b.Codigo = (SELECT c.Banco FROM  Con' +
        'tas c'
      
        '                                                     WHERE c.Con' +
        'ta = p.ContaBoleto)) as SiglaBanco,'
      ''
      '      (SELECT a.Nome  FROM  Agencias a'
      
        '                      WHERE a.Banco  = (SELECT c.Banco   FROM  C' +
        'ontas c'
      
        '                                                         WHERE c' +
        '.Conta = p.ContaBoleto)'
      
        '                        AND a.Codigo = (SELECT c.Agencia FROM  C' +
        'ontas c'
      
        '                                                         WHERE c' +
        '.Conta = p.ContaBoleto)) as NomeAgencia,'
      ''
      ''
      '       p.ObservacaoBoleto,'
      '       p.CartaCliente,'
      '       p.SPCCliente,'
      '       p.CartaAvalista,'
      '       p.SPCAvalista,'
      '       p.ParcelaOrigem,'
      '       p.ParcelaAdicional,'
      '       p.PagamentoExtraCaixa,'
      '       p.FilialPagto,'
      ''
      '      (CASE WHEN p.DataPagto IS NOT NULL'
      '            THEN true'
      '            ELSE false'
      '       END) as quitado,'
      ''
      '       false as PodeQuitar'
      ''
      'FROM   parcelas p'
      ''
      'WHERE  p.Contrato = cast(:Contrato as varchar)'
      ''
      'ORDER BY p.DataVencto, p.Numero')
    RequestLive = True
    Left = 52
    Top = 86
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
    object qryParcelasdatavencto: TDateField
      Alignment = taCenter
      FieldName = 'datavencto'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasvalorvencto: TFloatField
      FieldName = 'valorvencto'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryParcelasContaBoleto: TIntegerField
      FieldName = 'ContaBoleto'
      DisplayFormat = '#,###,##0'
    end
    object qryParcelasDigito: TStringField
      DisplayLabel = 'D'#237'gito'
      FieldName = 'Digito'
      Size = 50
    end
    object qryParcelasSiglaBanco: TStringField
      FieldName = 'SiglaBanco'
      Size = 50
    end
    object qryParcelasNomeAgencia: TStringField
      FieldName = 'NomeAgencia'
      Size = 50
    end
  end
  object dsrParcelas: TtecDataSource
    DataSet = qryParcelas
    Left = 180
    Top = 85
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
    Macros = <>
    Sql.Strings = (
      'Select  v.codigo,'
      '            coalesce(v.razao,v.nome) as nome,'
      '            v.tipo,'
      '            descricao_tipocliente(v.tipo) as tipocliente,'
      '            formatar_cpf_cnpj(v.pessoanumero) as pessoanumero,'
      '            v.estado,'
      '           c.nome as nomecidade'
      'From   vfornecedores v, cidades c'
      'Where  False'
      '    and (v.estado = c.estado)'
      '    and (v.cidade = c.codigo)'
      'Order By UPPER(TO_ASCII(v.nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 304
    Top = 18
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
    Left = 180
    Top = 18
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
      'Select  v.codigo,'
      '            coalesce(v.razao,v.nome) as nome,'
      '            v.tipo'
      'From    vfornecedores v'
      'Where  (v.codigo =:codigo) and'
      '            (v.tipo =:tipo)')
    RequestLive = False
    Left = 52
    Top = 18
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
      '          (v.situacao in ('#39'F'#39','#39'N'#39','#39'P'#39')) '
      'order by v.data desc')
    RequestLive = True
    Left = 52
    Top = 153
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
    Left = 180
    Top = 153
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
    Top = 224
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
    object qryContasModeloCheque: TIntegerField
      FieldName = 'ModeloCheque'
      DisplayFormat = '0'
    end
  end
  object dsrContas: TtecDataSource
    DataSet = qryContas
    Left = 180
    Top = 222
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
    Left = 304
    Top = 225
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
end
