inherited dtmImprimirDuplicatas: TdtmImprimirDuplicatas
  OnDestroy = DataModuleDestroy
  Left = 125
  Top = 84
  Height = 619
  Width = 891
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
      '            inscricaoestadual,'
      '            cnpj'
      'From    filiais'
      'Where codigo=:codigo')
    RequestLive = True
    Left = 26
    Top = 8
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
      DisplayWidth = 60
      FieldName = 'nome'
      Size = 60
    end
    object qryFiliaisinscricaoestadual: TStringField
      FieldName = 'inscricaoestadual'
    end
    object qryFiliaiscnpj: TStringField
      FieldName = 'cnpj'
      Size = 14
    end
  end
  object dsrFiliais: TtecDataSource
    DataSet = qryFiliais
    Left = 99
    Top = 8
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
      'Order By UPPER(TO_ASCII(nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 190
    Top = 8
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
  object qryClientes: TtecQuery
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
      'SELECT coalesce(v.razao,v.nome) as nome ,'
      '       v.Codigo,'
      '       v.Tipo,'
      '       Formatar_CPF_CNPJ(v.PessoaNumero) as PessoaNumero,'
      '       Descricao_TipoCliente(v.Tipo) as TipoCliente,'
      '       v.Estado,'
      '       c.nome as NomeCidade'
      ''
      'FROM   vfornecedores v, cidades c'
      ''
      'WHERE  v.Codigo = :Codigo  AND'
      '       v.tipo   = :Tipo    AND'
      ''
      '       v.Estado = c.Estado AND'
      '       v.Cidade = c.Codigo'
      ''
      'ORDER BY UPPER(TO_ASCII(coalesce(v.razao,v.nome),'#39'LATIN1'#39'))'
      '')
    RequestLive = True
    Left = 26
    Top = 68
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Tipo'
        ParamType = ptUnknown
      end>
    object qryClientesNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object qryClientesCodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
    end
    object qryClientesTipo: TStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object qryClientesPessoaNumero: TStringField
      DisplayLabel = 'CPF ou CNPJ'
      FieldName = 'PessoaNumero'
      Size = 50
    end
    object qryClientesTipoCliente: TStringField
      FieldName = 'TipoCliente'
      Size = 50
    end
    object qryClientesEstado: TStringField
      FieldName = 'Estado'
      Size = 2
    end
    object qryClientesNomeCidade: TStringField
      FieldName = 'NomeCidade'
      Required = True
      Size = 80
    end
  end
  object dsrClientes: TtecDataSource
    DataSet = qryClientes
    Left = 99
    Top = 68
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
      'SELECT  coalesce(v.razao,v.nome) as nome ,'
      '        v.Codigo,'
      '        v.Tipo,'
      '        Formatar_CPF_CNPJ(v.PessoaNumero) as PessoaNumero,'
      '        Descricao_TipoCliente(v.Tipo) as TipoCliente,'
      '        v.Estado,'
      '        c.Nome as NomeCidade'
      ''
      'FROM    vfornecedores v, cidades c'
      ''
      '%ClausulaWHERE'
      '    AND v.Estado = c.Estado'
      '    AND v.Cidade = c.Codigo'
      ''
      'ORDER BY UPPER(TO_ASCII(coalesce(v.razao,v.nome),'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 190
    Top = 68
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
      DisplayFormat = '0'
    end
    object qryConsultaClientestipocliente: TStringField
      DisplayLabel = 'Tipo cliente'
      FieldName = 'tipocliente'
      Size = 14
    end
    object qryConsultaClientestipo: TStringField
      FieldName = 'tipo'
      Visible = False
      Size = 1
    end
  end
  object qryParcelas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnFilterRecord = qryParcelasFilterRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'dataVencto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataVenda'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'notaFiscal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cobrancaemcarteira'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'SELECT p.Contrato,'
      '       p.Numero,'
      '       cast(null as integer) as nrdocumento,'
      '       p.DataVencto,'
      '       p.ValorVencto,'
      '       p.ContaBoleto,'
      '       p.Remessa,'
      '       false as Selecionar,'
      ''
      '       ct.Cliente,'
      '       ct.Estado,'
      '       ct.Nome,'
      '       ct.FilialVenda,'
      '       ct.Faturamento,'
      '       ct.PessoaTipo,'
      '       b.Nome as NomeBairro,'
      '       cd.Nome as NomeCidade,'
      '       ct.IDDocumento as Documento,'
      '       ct.Rua,'
      '       ct.PessoaNumero as Inscricao,  /* inscricao  estadual*/'
      '       ct.CEP,'
      '       f.Nome as Nomefilial,'
      '       f.CNPJ,'
      '       formatar_cpf_cnpj(ct.PessoaNumero) as cnpjformatado'
      ''
      
        'FROM   clientes c, contratos ct, parcelas p, filiais f, bairros ' +
        'b, cidades cd'
      ''
      'WHERE  ct.Numero = p.Contrato AND ct.Cliente     = c.Codigo  AND'
      '       ct.Bairro = b.Codigo   AND ct.Cidade      = b.Cidade  AND'
      '       ct.Estado = b.Estado   AND ct.Cidade      = cd.Codigo AND'
      '       ct.Estado = cd.Estado  AND ct.FilialVenda = f.Codigo  AND'
      '       ct.tipocliente = '#39'C'#39' AND'
      '       not coalesce(c.cobrancaemcarteira, false) AND'
      ''
      '       p.DataPagto is null AND ct.situacao in ('#39'F'#39','#39'N'#39','#39'P'#39')'
      '                           AND contratos_atual(ct.numero)'
      ''
      '%dataVencto'
      '%dataVenda'
      '%notaFiscal'
      '%filial'
      '%cliente'
      '%cobrancaemcarteira'
      ''
      
        'ORDER BY UPPER(TO_ASCII(ct.nome,'#39'LATIN1'#39')), p.Contrato, p.DataVe' +
        'ncto'
      ''
      ''
      ''
      '/* PARAMETROS -> NOTA INICIAL -> :NOTAINICIAL'
      '                 NOTA FINAL   -> :NOTAFINAL'
      '                 VENCTO INICIAL -> :VenctoInicial'
      '                 VENCTO FINAL -> :VenctoFinal'
      '                 */')
    RequestLive = True
    Left = 26
    Top = 132
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NOTAINICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NOTAFINAL'
        ParamType = ptUnknown
      end
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
    object qryParcelasContrato: TStringField
      FieldName = 'Contrato'
    end
    object qryParcelasNumero: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'Numero'
      DisplayFormat = '0'
    end
    object qryParcelasDataVencto: TDateField
      Alignment = taCenter
      DisplayLabel = 'Vencto'
      FieldName = 'DataVencto'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasValorVencto: TFloatField
      FieldName = 'ValorVencto'
      DisplayFormat = '#,###,##0.00'
      EditFormat = '#,###,##0.00'
    end
    object qryParcelasContaBoleto: TIntegerField
      FieldName = 'ContaBoleto'
      DisplayFormat = '0'
    end
    object qryParcelasRemessa: TStringField
      FieldName = 'Remessa'
      Size = 8
    end
    object qryParcelasSelecionar: TBooleanField
      DisplayLabel = 'OK'
      FieldName = 'Selecionar'
    end
    object qryParcelasCliente: TIntegerField
      FieldName = 'Cliente'
      DisplayFormat = '#,###,##0'
      EditFormat = '#,###,##0'
    end
    object qryParcelasEstado: TStringField
      FieldName = 'Estado'
      Size = 2
    end
    object qryParcelasNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object qryParcelasFilialVenda: TIntegerField
      FieldName = 'FilialVenda'
      DisplayFormat = '0'
    end
    object qryParcelasFaturamento: TDateField
      Alignment = taCenter
      FieldName = 'Faturamento'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelaspessoatipo: TStringField
      FieldName = 'pessoatipo'
      Size = 1
    end
    object qryParcelasnomebairro: TStringField
      FieldName = 'nomebairro'
      Size = 80
    end
    object qryParcelasnomecidade: TStringField
      FieldName = 'nomecidade'
      Size = 80
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
      DisplayFormat = '0'
    end
    object qryParcelasnomefilial: TStringField
      FieldName = 'nomefilial'
      Size = 40
    end
    object qryParcelascnpj: TStringField
      FieldName = 'cnpj'
      Size = 14
    end
    object qryParcelascnpjformatado: TStringField
      FieldName = 'cnpjformatado'
      Size = 18
    end
    object qryParcelasnrdocumento: TIntegerField
      FieldName = 'nrdocumento'
    end
  end
  object dsrParcelas: TtecDataSource
    DataSet = qryParcelas
    Left = 107
    Top = 132
  end
  object qryAtualizarParcelas: TtecQuery
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
      'UPDATE parcelas SET'
      '       remessa     = :remessa,'
      '       contaboleto = :contaboleto'
      'WHERE contrato = :contrato AND'
      '      numero   = :numero'
      ' '
      '        ')
    RequestLive = False
    Left = 190
    Top = 132
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'remessa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ContaBoleto'
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
      '       c.Sequencial,'
      '       b.Sigla,'
      '       a.Nome,'
      '       c.carteira'
      'FROM   contas c JOIN Bancos b   ON c.Banco   = b.Codigo'
      '                JOIN Agencias a ON c.Banco   = a.Banco AND'
      '                                   c.Agencia = a.Codigo'
      ''
      'WHERE  c.Conta = :Conta'
      '')
    RequestLive = True
    Left = 26
    Top = 201
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
    object qryContasSigla: TStringField
      FieldName = 'Sigla'
      Size = 10
    end
    object qryContasNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
    object qryContasSequencial: TIntegerField
      FieldName = 'Sequencial'
    end
    object qryContascarteira: TStringField
      FieldName = 'carteira'
    end
  end
  object dsrContas: TtecDataSource
    DataSet = qryContas
    Left = 99
    Top = 201
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
      '       c.Agencia,'
      '       b.ModeloCheque'
      ''
      'FROM   Contas c JOIN Bancos b   ON c.Banco   = b.Codigo'
      '                JOIN Agencias a ON c.Banco   = a.Banco AND'
      '                                   c.Agencia = a.Codigo'
      ''
      
        'ORDER BY b.Sigla, UPPER(TO_ASCII(a.nome,'#39'LATIN1'#39')), UPPER(TO_ASC' +
        'II(c.titular,'#39'LATIN1'#39'))'
      '')
    RequestLive = True
    Left = 190
    Top = 201
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
  object qryParcelas_CLIENTE_USA_CONTRATO: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnFilterRecord = qryParcelasFilterRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'dataVencto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataVenda'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'notaFiscal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cobrancaemcarteira'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'SELECT p.Contrato,'
      '       p.Numero,'
      '       cast(null as integer) as nrdocumento,'
      '       p.DataVencto,'
      '       p.ValorVencto,'
      '       p.ContaBoleto,'
      '       p.Remessa,'
      '       false as Selecionar,'
      ''
      '       ct.Cliente,'
      '       ct.Estado,'
      '       ct.Nome,'
      '       ct.FilialVenda,'
      '       ct.Faturamento,'
      '       ct.PessoaTipo,'
      '       b.Nome as NomeBairro,'
      '       cd.Nome as NomeCidade,'
      '       ct.IDDocumento as Documento,'
      '       ct.Rua,'
      '       ct.PessoaNumero as Inscricao,  /* inscricao  estadual*/'
      '       ct.CEP,'
      '       f.Nome as Nomefilial,'
      '       f.CNPJ,'
      '       formatar_cpf_cnpj(ct.PessoaNumero) as cnpjformatado'
      ''
      
        'FROM   clientes c, contratos ct, parcelas p, filiais f, bairros ' +
        'b, cidades cd'
      ''
      'WHERE  ct.Numero = p.Contrato AND ct.Cliente     = c.Codigo  AND'
      '       ct.Bairro = b.Codigo   AND ct.Cidade      = b.Cidade  AND'
      '       ct.Estado = b.Estado   AND ct.Cidade      = cd.Codigo AND'
      '       ct.Estado = cd.Estado  AND ct.FilialVenda = f.Codigo  AND'
      '       ct.tipocliente = '#39'C'#39' AND'
      '       p.DataPagto is null AND ct.situacao in ('#39'F'#39','#39'N'#39','#39'P'#39')'
      '                           AND contratos_atual(ct.numero)'
      ''
      '%dataVencto'
      '%dataVenda'
      '%notaFiscal'
      '%filial'
      '%cliente'
      '%cobrancaemcarteira'
      ''
      
        'ORDER BY UPPER(TO_ASCII(ct.nome,'#39'LATIN1'#39')), p.Contrato, p.DataVe' +
        'ncto'
      ''
      ''
      ''
      '/* PARAMETROS -> NOTA INICIAL -> :NOTAINICIAL'
      '                 NOTA FINAL   -> :NOTAFINAL'
      '                 VENCTO INICIAL -> :VenctoInicial'
      '                 VENCTO FINAL -> :VenctoFinal'
      '                 */')
    RequestLive = True
    Left = 362
    Top = 12
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NOTAINICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NOTAFINAL'
        ParamType = ptUnknown
      end
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
  end
  object qryParcelas_CLIENTE_NFE_NAO_USA_CONTRATO: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnFilterRecord = qryParcelasFilterRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'dataVencto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataVenda'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'notaFiscal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cobrancaemcarteira'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'SELECT p.Contrato,'
      '       p.Numero,'
      '       n.numero as nrdocumento,'
      '       p.DataVencto,'
      '       p.ValorVencto,'
      '       p.ContaBoleto,'
      '       p.Remessa,'
      '       false as Selecionar,'
      ''
      '       ct.Cliente,'
      '       ct.Estado,'
      '       ct.Nome,'
      '       ct.FilialVenda,'
      '       ct.Faturamento,'
      '       ct.PessoaTipo,'
      '       b.Nome as NomeBairro,'
      '       cd.Nome as NomeCidade,'
      '       ct.IDDocumento as Documento,'
      '       ct.Rua,'
      '       ct.PessoaNumero as Inscricao,  /* inscricao  estadual*/'
      '       ct.CEP,'
      '       f.Nome as Nomefilial,'
      '       f.CNPJ,'
      '       formatar_cpf_cnpj(ct.PessoaNumero) as cnpjformatado'
      ''
      
        'FROM   clientes c, contratos ct, dadosfiscais df, notas n, parce' +
        'las p, filiais f, bairros b, cidades cd'
      ''
      'WHERE  ct.Numero = p.Contrato AND ct.Cliente     = c.Codigo  AND'
      '       ct.Bairro = b.Codigo   AND ct.Cidade      = b.Cidade  AND'
      '       ct.Estado = b.Estado   AND ct.Cidade      = cd.Codigo AND'
      '       ct.Estado = cd.Estado  AND ct.FilialVenda = f.Codigo  AND'
      '       ct.numero = df.contrato AND'
      '       df.numero = n.dadofiscal and'
      '       ct.tipocliente = '#39'C'#39' AND'
      '       p.DataPagto is null AND ct.situacao in ('#39'F'#39','#39'N'#39','#39'P'#39')'
      '                           AND contratos_atual(ct.numero)'
      ''
      '%dataVencto'
      '%dataVenda'
      '%notaFiscal'
      '%filial'
      '%cliente'
      '%cobrancaemcarteira'
      ''
      
        'ORDER BY UPPER(TO_ASCII(ct.nome,'#39'LATIN1'#39')), nrdocumento, p.DataV' +
        'encto'
      ''
      ''
      ''
      '/* PARAMETROS -> NOTA INICIAL -> :NOTAINICIAL'
      '                 NOTA FINAL   -> :NOTAFINAL'
      '                 VENCTO INICIAL -> :VenctoInicial'
      '                 VENCTO FINAL -> :VenctoFinal'
      '                 */')
    RequestLive = True
    Left = 394
    Top = 28
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NOTAINICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NOTAFINAL'
        ParamType = ptUnknown
      end
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
  end
end
