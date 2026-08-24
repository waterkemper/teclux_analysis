inherited dtmConsultaContratos: TdtmConsultaContratos
  Left = 310
  Top = 208
  Height = 700
  Width = 1054
  object qryFiliais: TtecQuery
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
      'select codigo, nome'
      'from filiais'
      'where codigo =: codigo')
    RequestLive = False
    Left = 40
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryFiliaiscodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryFiliaisnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
  end
  object dsrFiliais: TtecDataSource
    DataSet = qryFiliais
    Left = 128
    Top = 8
  end
  object qryVendedores: TtecQuery
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
      'Select u.codigo,  '
      '           u.nome'
      'From  usuarios u'
      'Where (u.codigo =:codigo)'
      '')
    RequestLive = False
    Left = 40
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryVendedorescodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryVendedoresnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
  end
  object dsrVendedores: TtecDataSource
    DataSet = qryVendedores
    Left = 128
    Top = 56
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
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'Select  codigo,'
      '            coalesce(razao,nome) as nome,'
      '            tipo'
      'From    vfornecedores'
      'Where (tipo =:tipo) and'
      '            (codigo =:codigo)')
    RequestLive = False
    Left = 40
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigo'
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
  object dsrClientes: TtecDataSource
    DataSet = qryClientes
    Left = 128
    Top = 152
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
      'select codigo, nome'
      'from filiais'
      'order by UPPER(TO_ASCII(nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 224
    Top = 8
    object qryConsultaFiliaisnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Required = True
      Size = 40
    end
    object qryConsultaFiliaiscodigo: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'codigo'
      Required = True
    end
  end
  object qryConsultaVendedores: TtecQuery
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
      'select u.codigo, u.nome'
      'from usuarios u'
      'order by UPPER(TO_ASCII(u.nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 224
    Top = 56
    object qryConsultaVendedoresnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaVendedorescodigo: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
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
      'Select  coalesce(v.razao,v.nome) as nome,'
      '            v.codigo,'
      '            formatar_cpf_cnpj(v.pessoanumero) as pessoanumero,'
      '            cast(v.tipo as varchar) as tipo,'
      '            cast(case when v.tipo = '#39'F'#39'  then '#39'F - Fornecedor'#39
      
        '                            when v.tipo = '#39'C'#39'  then '#39'C - Cliente' +
        #39
      '                            when v.tipo = '#39'L'#39'  then '#39'L - Filial'#39
      '                    end  as varchar) as tipopessoa,'
      '            v.estado,'
      '            c.nome as nomecidade '
      'From    vfornecedores v, cidades c'
      'Where false   /* Alterado em RumTime  */     '
      '    and (v.estado = c.estado)'
      '    and (v.cidade = c.codigo)'
      'Order By UPPER(TO_ASCII(coalesce(v.razao,v.nome),'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 224
    Top = 152
    object qryConsultaClientesnome: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 40
      FieldName = 'nome'
      Size = 30
    end
    object qryConsultaClientespessoanumero: TStringField
      DisplayLabel = 'CPF/CNPJ'
      DisplayWidth = 14
      FieldName = 'pessoanumero'
      Size = 14
    end
    object qryConsultaClientesnomecidade: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 20
      FieldName = 'nomecidade'
      Required = True
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
    object qryConsultaClientestipopessoa: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 14
      FieldName = 'tipopessoa'
      Size = 14
    end
    object qryConsultaClientestipo: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 1
      FieldName = 'tipo'
      Visible = False
      Size = 5
    end
  end
  object qryContratos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeOpen = qryContratosBeforeOpen
    AfterScroll = qryContratosAfterScroll
    OnCalcFields = qryContratosCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'Situacao'
        ParamType = ptUnknown
        Value = 'where false'
      end
      item
        DataType = ftUnknown
        Name = 'Emaberto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quitado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Renegociado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EmAtraso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Abertura'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fechamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Plano'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Reservado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Vendedor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GruposUsuarios'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaItemProdutos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaProdutos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaGrupos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaClasses'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaMarcas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaCondicionalPromocoes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Equipamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fornecedor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SQLIntervaloComprasProdutos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Pedidocliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'XPed'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigo_pedido_marketplace'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TipoContrato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TipoEqptoOrdemServico'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Atendimentos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'StatusAtendimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EntreganaLoja'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Ordenacao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select distinct'
      '       ct.numero,'
      '       ct.data,'
      '       ct.datareservado, ct.faturamento, ct.pedidocliente,'
      '       ct.cliente,'
      '       ct.tipocliente,'
      '       cast(0 as numeric(11,2)) as TotalProdutos,'
      '       formatar_cpf_cnpj(ct.pessoanumero) as pessoanumero,'
      
        '       cast(cast(ct.cliente as varchar)||'#39' - '#39'||ct.nome as varch' +
        'ar) as clientenome,'
      '       ct.estado,'
      '       ct.situacao,'
      '       cast (case when ct.situacao = '#39'O'#39' then '#39'OR'#199'ADO'#39
      '                        when ct.situacao = '#39'R'#39' then '#39'RESERVADO'#39
      '                        when ct.situacao = '#39'F'#39' then '#39'FATURADO'#39
      
        '                        when ct.situacao = '#39'P'#39' then '#39'NOTA PARCIA' +
        'L'#39
      
        '                        when ct.situacao = '#39'N'#39' then '#39'NOTA FISCAL' +
        #39
      '                        when ct.situacao = '#39'C'#39' then '#39'CANCELADO'#39
      '             end as varchar) as NomeSituacao,'
      '       vficha_situacaocontrato(ct.numero) as situacaocontrato,'
      '       contratos_emaberto(ct.numero) as aberto,'
      '       contratos_quitado(ct.numero) as quitado,'
      '       (select c2.numero'
      '        from contratos c2'
      '        where c2.origem = ct.numero) as renegociado,'
      '       pl.descricao as plano,'
      '       ct.vendedor,'
      
        '       cast(cast(ct.vendedor as varchar)||'#39' - '#39'||(select u.nome ' +
        'from usuarios u where u.codigo = ct.vendedor) as varchar) as ven' +
        'dedornome,'
      '       ct.valorprazo,'
      '       ct.valorvista,'
      '       ct.desconto,'
      '       ct.frete,'
      '       ct.seguro,'
      '       ct.valoricmssubstituicao,'
      '       ct.creditotroca,'
      
        '       (select sum(pc1.quantidade*pc1.precovenda) from produtosc' +
        'ontratos pc1 where pc1.contrato = ct.numero) as totalItens,'
      '       ct.nome,'
      '       ct.emitirnotadepoisde,'
      '       upper(to_ascii(ct.nome,'#39'latin1'#39')) as auxNome,'
      '       cast(ct.numero as bigint) as auxnumero,'
      '       (select contrato_atual(ct.numero)) as contrato_atual,'
      '       ct.consideracoes,'
      '       coalesce(ct.os,false) as os,'
      ''
      '       (select ps.codigo_pedido_marketplace'
      '        from pedidos_site ps'
      
        '        where ps.contrato = ct.numero) as codigo_pedido_marketpl' +
        'ace,'
      ''
      ''
      '       EntreganaLoja(ct.numero),'
      ''
      ''
      '       ct.definirdadosentregaparatodos,'
      '       ct.entrega,'
      '       ct.dataentrega,'
      '       ct.horaentrega,'
      ''
      ''
      '       false as selecionar'
      ''
      'from ((contratos ct'
      '             left join (usuarios u'
      '                        left join GruposUsuarios gu'
      '                        on u.grupo = gu.codigo)'
      '             on ct.vendedor = u.codigo)'
      ''
      'left join (produtoscontratos pc'
      
        '          join (produtos p left join promocoes pro on p.promocao' +
        ' = pro.codigo)'
      '               join (((caracteristicas c'
      '                    join grupos g'
      '                    on g.codigo = c.grupo)'
      '                    join classes cl'
      '                    on cl.codigo = c.classe)'
      '                    join marcas m'
      '                    on m.codigo = c.marca)'
      '               on p.caracteristica = c.codigo'
      '          on pc.produto = p.codigo)'
      '     on ct.numero = pc.contrato)'
      ''
      '     left join'
      '     planos pl'
      '     on ct.plano = pl.codigo   '
      ''
      '%Situacao'
      '%Emaberto'
      '%Quitado'
      '%Renegociado'
      '%EmAtraso'
      '%Abertura'
      '%Fechamento'
      '%Cliente'
      '%Plano'
      '%Filial'
      '%Reservado'
      '%Vendedor'
      '%GruposUsuarios'
      ''
      '%ListaItemProdutos'
      '%ListaProdutos'
      '%ListaGrupos'
      '%ListaClasses'
      '%ListaMarcas'
      '%ListaCondicionalPromocoes'
      ''
      '%Equipamento'
      ''
      '%Fornecedor'
      '%SQLIntervaloComprasProdutos'
      ''
      '%Pedidocliente'
      '%Contrato'
      '%XPed'
      '%codigo_pedido_marketplace'
      '%TipoContrato'
      '%TipoEqptoOrdemServico'
      '%Atendimentos'
      '%StatusAtendimento'
      '%EntreganaLoja'
      ''
      ''
      ''
      '%Ordenacao'
      ''
      ''
      ''
      ''
      '/*'
      ''
      ':DataCompraProdutoInicial'
      ':DataCompraProdutoFinal'
      ''
      '*/')
    RequestLive = True
    Left = 328
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DataCompraProdutoInicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataCompraProdutoFinal'
        ParamType = ptUnknown
      end>
    object qryContratosnumero: TStringField
      FieldName = 'numero'
    end
    object qryContratosdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object qryContratosfaturamento: TDateField
      Alignment = taCenter
      FieldName = 'faturamento'
      EditMask = '99/99/9999;1; '
    end
    object qryContratospessoanumero: TStringField
      FieldName = 'pessoanumero'
      Size = 50
    end
    object qryContratoscliente: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object qryContratosclientenome: TStringField
      FieldName = 'clientenome'
      Size = 50
    end
    object qryContratosestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object qryContratossituacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
    object qryContratosnomesituacao: TStringField
      FieldName = 'nomesituacao'
      Size = 50
    end
    object qryContratossituacaocontrato: TStringField
      DisplayWidth = 10
      FieldName = 'situacaocontrato'
      Size = 50
    end
    object qryContratosaberto: TBooleanField
      FieldName = 'aberto'
    end
    object qryContratosrenegociado: TStringField
      FieldName = 'renegociado'
    end
    object qryContratosplano: TStringField
      FieldName = 'plano'
      Size = 30
    end
    object qryContratosvendedor: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'vendedor'
      Required = True
      DisplayFormat = '0'
    end
    object qryContratosvendedornome: TStringField
      FieldName = 'vendedornome'
      Size = 50
    end
    object qryContratospedidocliente: TStringField
      DisplayWidth = 15
      FieldName = 'pedidocliente'
      Size = 35
    end
    object qryContratosselecionar: TBooleanField
      FieldName = 'selecionar'
    end
    object qryContratosnome: TStringField
      DisplayWidth = 40
      FieldName = 'nome'
      Size = 60
    end
    object qryContratosdatareservado: TDateField
      Alignment = taCenter
      FieldName = 'datareservado'
      EditMask = '99/99/9999;1; '
    end
    object qryContratosvalorvista: TFloatField
      FieldName = 'valorvista'
      DisplayFormat = '0.00'
    end
    object qryContratosdesconto: TFloatField
      FieldName = 'desconto'
      DisplayFormat = '0.00'
    end
    object qryContratostotalprodutos: TFloatField
      FieldName = 'totalprodutos'
      DisplayFormat = '0.00'
    end
    object qryContratosvalorprazo: TFloatField
      FieldName = 'valorprazo'
      DisplayFormat = '0.00'
    end
    object qryContratostotalitens: TFloatField
      FieldName = 'totalitens'
      DisplayFormat = '0.00'
    end
    object qryContratosacrescimo: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'acrescimo'
      DisplayFormat = '0.00'
      currency = False
      Calculated = True
    end
    object qryContratossubtotal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'subtotal'
      DisplayFormat = '0.00'
      currency = False
      Calculated = True
    end
    object qryContratosfrete: TFloatField
      FieldName = 'frete'
      OnGetText = qryContratosfreteGetText
      DisplayFormat = '0.00'
    end
    object qryContratosseguro: TFloatField
      FieldName = 'seguro'
      DisplayFormat = '0.00'
    end
    object qryContratosvaloricmssubstituicao: TFloatField
      DefaultExpression = '0,00'
      FieldName = 'valoricmssubstituicao'
      DisplayFormat = '0.00'
    end
    object qryContratoscreditotroca: TFloatField
      FieldName = 'creditotroca'
      DisplayFormat = '0.00'
    end
    object qryContratosquitado: TBooleanField
      FieldName = 'quitado'
    end
    object qryContratosemitirnotadepoisde: TDateField
      Alignment = taCenter
      FieldName = 'emitirnotadepoisde'
      EditMask = '99/99/9999;1; '
    end
    object qryContratostipocliente: TStringField
      FieldName = 'tipocliente'
      Required = True
      Size = 1
    end
    object qryContratoscontrato_atual: TStringField
      DisplayWidth = 20
      FieldName = 'contrato_atual'
      Size = 50
    end
    object qryContratosconsideracoes: TStringField
      FieldName = 'consideracoes'
      Size = 1000
    end
    object qryContratosos: TBooleanField
      FieldName = 'os'
    end
    object qryContratoscodigo_pedido_marketplace: TStringField
      FieldName = 'codigo_pedido_marketplace'
      Size = 100
    end
    object qryContratosentreganaloja: TStringField
      FieldName = 'entreganaloja'
      Size = 10
    end
    object qryContratosdefinirdadosentregaparatodos: TBooleanField
      FieldName = 'definirdadosentregaparatodos'
    end
    object qryContratosentrega: TStringField
      FieldName = 'entrega'
      Size = 1
    end
    object qryContratosdataentrega: TDateField
      FieldName = 'dataentrega'
    end
    object qryContratoshoraentrega: TTimeField
      FieldName = 'horaentrega'
    end
  end
  object qryFornecedores: TtecQuery
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
      'Select f.codigo, f.nome'
      'From fornecedores f'
      'Where f.codigo =: codigo')
    RequestLive = False
    Left = 328
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryFornecedorescodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
    object qryFornecedoresnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Required = True
      Size = 40
    end
  end
  object dsrFornecedores: TtecDataSource
    DataSet = qryFornecedores
    Left = 416
    Top = 152
  end
  object qryConsultaFornecedores: TtecQuery
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
      'Select  f.nome,'
      '            f.codigo,'
      '            formatar_cpf_cnpj(f.pessoanumero) as pessoanumero,'
      '            f.estado,'
      '            c.nome as nomecidade '
      'From    fornecedores f, cidades c'
      'Where false   /* Alterado em RumTime  */     '
      '    and (f.estado = c.estado)'
      '    and (f.cidade = c.codigo)'
      'Order By UPPER(TO_ASCII(f.nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 520
    Top = 152
    object qryConsultaFornecedoresnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Required = True
      Size = 40
    end
    object qryConsultaFornecedorespessoanumero: TStringField
      DisplayLabel = 'CPF/CNPJ'
      DisplayWidth = 14
      FieldName = 'pessoanumero'
      Size = 14
    end
    object qryConsultaFornecedoresnomecidade: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 20
      FieldName = 'nomecidade'
      Required = True
    end
    object qryConsultaFornecedoresestado: TStringField
      DisplayLabel = 'UF'
      FieldName = 'estado'
      Required = True
      Size = 2
    end
    object qryConsultaFornecedorescodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
  end
  object dsrContratos: TtecDataSource
    DataSet = qryContratos
    Left = 416
    Top = 200
  end
  object qryProdutosContratos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkFields = 'numero=contrato'
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeInsert = qryProdutosContratosBeforeInsert
    AfterInsert = qryProdutosContratosAfterInsert
    AfterPost = qryProdutosContratosAfterPost
    AfterScroll = qryProdutosContratosAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'contrato'
        ParamType = ptUnknown
        Value = 'and false'
      end>
    Sql.Strings = (
      'select pc.contrato,'
      '       pc.produto,'
      '       p.codigovisual as produtovisual,'
      '       p.descricao,'
      '       pc.quantidade,'
      
        '       produtos_pendentes(pc.contrato, pc.produto) as quantidade' +
        '_pendente,'
      '       pc.filial,'
      '       pc.precovenda,'
      '       (pc.quantidade * pc.precovenda) as total,'
      '       pc.entrega,'
      '       pc.dataentrega,'
      '       pc.horaentrega,'
      '       pc.periodoentrega,'
      '       pe.descricao as descricaoperiodoentrega,'
      '       '
      '       pc.dias,'
      '       '
      '       (select ei.valor'
      '        from estadosicms ei'
      '        where (ei.estado = :estado) and'
      '                   (ei.icms = (select c2.icms'
      '                                     from caracteristicas c2'
      
        '                                     where c2.codigo = p.caracte' +
        'ristica))'
      '       ) as aliquotaicms,'
      '       (select i.aliquota'
      '        from ipi i'
      '        where i.codigo = (select c1.ipi'
      '                                     from caracteristicas c1'
      
        '                                     where c1.codigo = p.caracte' +
        'ristica)'
      '       ) as aliquotaipi,'
      
        '       (select g.descricao from grades g, caracteristicas c wher' +
        'e c.codigo = p.caracteristica and g.codigo = c.grade1) as linha,'
      
        '       (select g.descricao from grades g, caracteristicas c wher' +
        'e c.codigo = p.caracteristica and g.codigo = c.grade2) as coluna' +
        ','
      '       p.valorgrade1,'
      '       p.valorgrade2,'
      '       pedidos_estoquepedido(pc.produto,pc.filial) as pedido,'
      '       e.emestoque,'
      '       e.reservado,'
      '       e.futuro,'
      '       pc.xped,'
      '       pc.vendedor,'
      
        '       (select u.nome from usuarios u where u.codigo = pc.vended' +
        'or) as nomevendedor,'
      '       pc.usuariologadoalteracao,'
      '       pc.usuarioalteracao,'
      '       pc.datahoraalteracaousuario,'
      '       pc.nitemped,'
      '       c.produto_cliente,'
      '       false as dadosentregaalterados,'
      '       false as vendedoralterado'
      ''
      'from produtoscontratos pc'
      
        '     left join  clientesprodutos c on (c.produto=pc.produto %cli' +
        'ente )'
      ''
      '     left join periodosentrega pe'
      '     on pc.periodoentrega = pe.codigo'
      ''
      ', produtos p, estoques e'
      ''
      'where p.codigo = pc.produto'
      'and e.filial=pc.filial'
      'and e.produto=pc.produto'
      'and e.produto=p.codigo'
      '%contrato')
    RequestLive = True
    Left = 40
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'estado'
        ParamType = ptUnknown
      end>
    object qryProdutosContratosproduto: TLargeintField
      FieldName = 'produto'
      Required = True
    end
    object qryProdutosContratosprodutovisual: TStringField
      FieldName = 'produtovisual'
      Size = 30
    end
    object qryProdutosContratosdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 100
    end
    object qryProdutosContratosfilial: TIntegerField
      FieldName = 'filial'
      Required = True
      DisplayFormat = '0'
    end
    object qryProdutosContratosvalorgrade1: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade1'
      Size = 50
    end
    object qryProdutosContratosvalorgrade2: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade2'
      Size = 50
    end
    object qryProdutosContratosquantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
      DisplayFormat = '0'
    end
    object qryProdutosContratosprecovenda: TFloatField
      FieldName = 'precovenda'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryProdutosContratostotal: TFloatField
      FieldName = 'total'
      DisplayFormat = '0.00'
    end
    object qryProdutosContratosaliquotaicms: TFloatField
      FieldName = 'aliquotaicms'
      DisplayFormat = '0.00'
    end
    object qryProdutosContratosaliquotaipi: TFloatField
      FieldName = 'aliquotaipi'
      DisplayFormat = '0.00'
    end
    object qryProdutosContratoslinha: TStringField
      FieldName = 'linha'
      Size = 40
    end
    object qryProdutosContratoscoluna: TStringField
      FieldName = 'coluna'
      Size = 40
    end
    object qryProdutosContratospedido: TFloatField
      FieldName = 'pedido'
      DisplayFormat = '0'
    end
    object qryProdutosContratoscontrato: TStringField
      FieldName = 'contrato'
    end
    object qryProdutosContratosentrega: TStringField
      FieldName = 'entrega'
      Required = True
      Size = 1
    end
    object qryProdutosContratosdias: TIntegerField
      FieldName = 'dias'
      DisplayFormat = '0'
    end
    object qryProdutosContratosemestoque: TFloatField
      FieldName = 'emestoque'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryProdutosContratosreservado: TFloatField
      FieldName = 'reservado'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryProdutosContratosxped: TStringField
      FieldName = 'xped'
      Size = 15
    end
    object qryProdutosContratosvendedor: TIntegerField
      FieldName = 'vendedor'
      DisplayFormat = '0'
    end
    object qryProdutosContratosusuariologadoalteracao: TIntegerField
      FieldName = 'usuariologadoalteracao'
      DisplayFormat = '0'
    end
    object qryProdutosContratosusuarioalteracao: TIntegerField
      FieldName = 'usuarioalteracao'
      DisplayFormat = '0'
    end
    object qryProdutosContratosdatahoraalteracaousuario: TDateTimeField
      Alignment = taCenter
      FieldName = 'datahoraalteracaousuario'
      DisplayFormat = 'dd/MM/yy hh:mm'
      EditMask = '99/99/99 99:99;1; '
    end
    object qryProdutosContratosvendedoralterado: TBooleanField
      FieldName = 'vendedoralterado'
    end
    object qryProdutosContratosnomevendedor: TStringField
      FieldName = 'nomevendedor'
      Size = 40
    end
    object qryProdutosContratosnitemped: TIntegerField
      FieldName = 'nitemped'
      DisplayFormat = '0'
    end
    object qryProdutosContratosproduto_cliente: TStringField
      FieldName = 'produto_cliente'
      Size = 30
    end
    object qryProdutosContratosquantidade_pendente: TFloatField
      FieldName = 'quantidade_pendente'
    end
    object qryProdutosContratosdataentrega: TDateField
      FieldName = 'dataentrega'
    end
    object qryProdutosContratoshoraentrega: TTimeField
      FieldName = 'horaentrega'
    end
    object qryProdutosContratosperiodoentrega: TIntegerField
      FieldName = 'periodoentrega'
    end
    object qryProdutosContratosdescricaoperiodoentrega: TStringField
      FieldName = 'descricaoperiodoentrega'
      Size = 30
    end
    object qryProdutosContratosdadosentregaalterados: TBooleanField
      FieldName = 'dadosentregaalterados'
    end
    object qryProdutosContratosfuturo: TFloatField
      FieldName = 'futuro'
    end
  end
  object dsrProdutosContratos: TtecDataSource
    DataSet = qryProdutosContratos
    OnDataChange = dsrProdutosContratosDataChange
    Left = 104
    Top = 240
  end
  object qryProdutosSimilares: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryProdutosSimilaresAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      '/* EXPLAIN (FORMAT JSON)*/'
      ''
      ''
      
        'select distinct case when pssel.codigo = :produto then 0 else 1 ' +
        'end as ordenacaoproduto, pssel.*,'
      
        '    /* Para a verifica'#231#227'o da qtidade de similar do similar relac' +
        'ionado ao selecionado faz-se igual a selecao do selecionado */'
      '    '
      '    '
      '                 case when pssel.grade1 is not null then'
      
        '                   (select g.descricao from grades g where g.cod' +
        'igo = pssel.grade1)'
      '                 else'
      '                   cast(null as varchar(40)) end as linha,'
      '                   '
      '                 case when pssel.grade2 is not null then'
      
        '                   (select g.descricao from grades g where g.cod' +
        'igo = pssel.grade2)'
      '                 else'
      '                   cast(null as varchar(40)) end as coluna,'
      ''
      ''
      '    '
      ''
      '     ('
      '      select count(*) from'
      '         ( '
      '      '
      '           ('
      '             '
      '             select ps.codigo as ps_codigo'
      '                    '
      '                    '
      '             from (produtos ps '
      '                   join caracteristicas cs '
      '                   on ps.caracteristica = cs.codigo),'
      '             '
      '             ('
      '             '
      '               select distinct'
      '                     psel.codigo as psel_codigo,'
      '                     psel.caracteristica as psel_caracteristica,'
      
        '                     psel.agrupamentosimilares as psel_agrupamen' +
        'tosimilares,'
      '                     psel.grade1 as psel_grade1,'
      '                     psel.grade2 as psel_grade2,'
      '                     psel.valorgrade1 as psel_valorgrade1,'
      '                     psel.valorgrade2 as psel_valorgrade2,'
      '                     s."similar"'
      '                   '
      '               from similares s right outer join'
      '                '
      '                     ('
      '                     select p.codigo, '
      '                            p.caracteristica, '
      '                            c.agrupamentosimilares,'
      '                            c.grade1,'
      '                            c.grade2,'
      '                            p.valorgrade1,'
      '                            p.valorgrade2'
      '                            '
      '                     from produtos p '
      '                          join caracteristicas c'
      '                           on p.caracteristica = c.codigo'
      '                     where p.codigo = pssel.codigo '
      '                     ) as psel'
      '                     '
      '               on s.caracteristica = psel.caracteristica'
      '             ) as psel_similar'
      ''
      '            where (ps.caracteristica = psel_similar.similar or '
      
        '                   ps.caracteristica  = psel_similar.psel_caract' +
        'eristica)'
      '                  '
      '              /*and ps.codigo <> psel_similar.psel_codigo*/'
      '              '
      '              and ((ps.inativo IS NULL) OR '
      '                   (ps.inativo>CURRENT_DATE))'
      '                   '
      
        '              and case when coalesce(psel_agrupamentosimilares, ' +
        #39#39') = '#39'L'#39
      '                           AND psel_grade1 IS NOT NULL'
      
        '                           AND psel_valorgrade1 IS NOT NULL  the' +
        'n '
      '                           '
      '                              ps.valorgrade1 = psel_valorgrade1'
      '                              and cs.grade1 = psel_grade1'
      '                           '
      '                           '
      
        '                       when coalesce(psel_agrupamentosimilares, ' +
        #39#39') = '#39'C'#39
      '                           AND psel_grade2 IS NOT NULL'
      
        '                           AND psel_valorgrade2 IS NOT NULL  the' +
        'n  '
      '                           '
      '                             ps.valorgrade2 = psel_valorgrade2'
      '                             and cs.grade2 = psel_grade2'
      '                           '
      '                  else true end     '
      '              '
      '             )'
      ''
      '              union all'
      '              '
      '             ('
      '               SELECT ps."similar" as ps_codigo'
      '               FROM produtos_similares ps'
      '               WHERE ps.produto = pssel.codigo'
      '             '
      '              )'
      '              '
      '            ) as ps'
      '           ) as similares'
      '           '
      '           '
      '  from'
      '  (  '
      ''
      ''
      '    select pssel.*,'
      '    '
      '          CASE'
      '              WHEN coalesce(valorpromocao, 0)=0 THEN'
      '                     (SELECT valor'
      '                      FROM colunasprecos'
      
        '                      WHERE (colunasprecos.caracteristica = psse' +
        'l.caracteristica)'
      '                        AND (colunasprecos.preco = pssel.preco)'
      
        '                        AND (colunasprecos.coluna = pssel.precon' +
        'ormal))'
      '              ELSE coalesce(pssel.valorpromocao, 0)'
      '          END AS valorproduto,'
      ''
      '          pedidos_estoquepedido(codigo,filial) as pedido'
      '    '
      '   '
      '    from'
      '    ('
      '        select ps.*,'
      '                 e.filial,'
      '                 e.emestoque,'
      '                 e.reservado,'
      '                 e.futuro,'
      '                 f.preconormal,'
      '                 '
      '                 CASE'
      '                     WHEN f.precopromocao IS NOT NULL THEN'
      '                            (SELECT valor'
      '                             FROM colunasprecos'
      
        '                             WHERE (colunasprecos.caracteristica' +
        ' = ps.caracteristica)'
      
        '                               AND (colunasprecos.preco = ps.pre' +
        'co)'
      
        '                               AND (colunasprecos.coluna = f.pre' +
        'copromocao)'
      
        '                               AND (colunasprecos.validade >= no' +
        'w()))'
      '                 END AS valorpromocao'
      '                 '
      '                 '
      '                 '
      '        from'
      '        ('
      '         '
      '         '
      '          SELECT p.descricao,'
      '                 p.valorgrade1,'
      '                 p.valorgrade2,'
      '                 c.grade1,'
      '                 c.grade2,'
      '                 '
      '                '
      '                 p.codigo,'
      '                 p.codigovisual,'
      '                 p.caracteristica,'
      '                 p.preco,'
      '                 '
      '                 '
      '                 c.unidade,'
      '                 c.brinde,'
      '                 c.agrupamentosimilares as agrupamentosimilares'
      '                 '
      '         '
      '         from'
      '         ('
      '      '
      '           ('
      '             '
      '             select ps.codigo as ps_codigo'
      '                    '
      '                    '
      '             from (produtos ps '
      '                   join caracteristicas cs '
      '                   on ps.caracteristica = cs.codigo),'
      '             '
      '             ('
      '             '
      '               select distinct'
      '                     psel.codigo as psel_codigo,'
      '                     psel.caracteristica as psel_caracteristica,'
      
        '                     psel.agrupamentosimilares as psel_agrupamen' +
        'tosimilares,'
      '                     psel.grade1 as psel_grade1,'
      '                     psel.grade2 as psel_grade2,'
      '                     psel.valorgrade1 as psel_valorgrade1,'
      '                     psel.valorgrade2 as psel_valorgrade2,'
      '                     s."similar"'
      '                   '
      '              from similares s right outer join'
      '                '
      '                     ('
      '                     select p.codigo, '
      '                            p.caracteristica, '
      '                            c.agrupamentosimilares,'
      '                            c.grade1,'
      '                            c.grade2,'
      '                            p.valorgrade1,'
      '                            p.valorgrade2'
      '                            '
      '                     from produtos p '
      '                          join caracteristicas c'
      '                           on p.caracteristica = c.codigo'
      '                     where p.codigo =  :produto'
      '                     ) as psel'
      '                     '
      '               on s.caracteristica = psel.caracteristica'
      '             ) as psel_similar'
      '              '
      '            where (ps.caracteristica = psel_similar.similar or '
      
        '                   ps.caracteristica  = psel_similar.psel_caract' +
        'eristica)'
      '                  '
      '              /* and ps.codigo <> psel_similar.psel_codigo */'
      '              '
      '              and ((ps.inativo IS NULL) OR '
      '                   (ps.inativo>CURRENT_DATE))'
      '                   '
      
        '              and case when coalesce(psel_agrupamentosimilares, ' +
        #39#39') = '#39'L'#39
      '                           AND psel_grade1 IS NOT NULL'
      
        '                           AND psel_valorgrade1 IS NOT NULL  the' +
        'n '
      '                           '
      '                              ps.valorgrade1 = psel_valorgrade1'
      '                              and cs.grade1 = psel_grade1'
      '                           '
      '                           '
      
        '                       when coalesce(psel_agrupamentosimilares, ' +
        #39#39') = '#39'C'#39
      '                           AND psel_grade2 IS NOT NULL'
      
        '                           AND psel_valorgrade2 IS NOT NULL  the' +
        'n  '
      '                           '
      '                             ps.valorgrade2 = psel_valorgrade2'
      '                             and cs.grade2 = psel_grade2'
      '                           '
      '                  else true end     '
      '              '
      '             )'
      ''
      '              union all'
      '              '
      '             ('
      '               SELECT ps."similar" as ps_codigo'
      '               FROM produtos_similares ps'
      '               WHERE ps.produto = :produto'
      '             '
      '              )'
      '              '
      
        '            ) as ps, produtos p, /*((*/ caracteristicas c  /*lef' +
        't join grades g1 on c.grade1 = g1.codigo)'
      
        '                                                      left join ' +
        'grades g2 on c.grade2 = g2.codigo) */'
      '                                                      '
      ''
      '        where  ps.ps_codigo = p.codigo'
      '          and p.caracteristica = c.codigo'
      '          '
      '          '
      '        ) as ps,  estoques e, filiais f   '
      '        where e.produto = ps.codigo      '
      '          and e.filial = f.codigo'
      
        '          and case when parametros_valor('#39'Mostrar Estoque Filiai' +
        's Similares'#39', e.filial)='#39'True'#39
      '                   then true'
      '                   else f.codigo = :filialbase'
      '                   end'
      '          '
      '    )  as pssel'
      ''
      '  ) as pssel'
      ''
      'WHERE (valorproduto > 0)'
      'ORDER BY 1, valorproduto'
      ''
      ''
      ''
      ''
      '')
    RequestLive = False
    Left = 328
    Top = 248
    ParamData = <
      item
        DataType = ftString
        Name = 'produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FilialBase'
        ParamType = ptUnknown
      end>
    object qryProdutosSimilaresdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object qryProdutosSimilaresvalorgrade1: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade1'
      Size = 30
    end
    object qryProdutosSimilaresvalorgrade2: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade2'
      Size = 30
    end
    object qryProdutosSimilarescodigo: TLargeintField
      FieldName = 'codigo'
    end
    object qryProdutosSimilarescodigovisual: TStringField
      FieldName = 'codigovisual'
      Size = 30
    end
    object qryProdutosSimilaresfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryProdutosSimilarescaracteristica: TLargeintField
      FieldName = 'caracteristica'
    end
    object qryProdutosSimilaresemestoque: TFloatField
      FieldName = 'emestoque'
      DisplayFormat = '0'
    end
    object qryProdutosSimilaresreservado: TFloatField
      FieldName = 'reservado'
      DisplayFormat = '0'
    end
    object qryProdutosSimilaresfuturo: TFloatField
      FieldName = 'futuro'
    end
    object qryProdutosSimilaresunidade: TStringField
      FieldName = 'unidade'
      Size = 8
    end
    object qryProdutosSimilaresbrinde: TBooleanField
      FieldName = 'brinde'
    end
    object qryProdutosSimilaresvalorproduto: TFloatField
      FieldName = 'valorproduto'
      DisplayFormat = '0.00'
    end
    object qryProdutosSimilareslinha: TStringField
      FieldName = 'linha'
      Size = 40
    end
    object qryProdutosSimilarescoluna: TStringField
      FieldName = 'coluna'
      Size = 40
    end
    object qryProdutosSimilaressimilares: TLargeintField
      FieldName = 'similares'
    end
    object qryProdutosSimilarespedido: TFloatField
      FieldName = 'pedido'
      DisplayFormat = '0.00'
    end
  end
  object dsrProdutosSimilares: TtecDataSource
    DataSet = qryProdutosSimilares
    Left = 416
    Top = 256
  end
  object frpImprimirContratos: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 448
    Top = 336
    ReportForm = {
      190000009C64000019FFFF00000A0050444643726561746F7200FFFFFFFFFF00
      000000340800009A0B0000000000000000000000000000000000000100040000
      FFFFFFFF000000000000000000000000030400466F726D00FEFFFFFFDC000000
      780000007C0100002C01000004000000FFFFFFFFFF00000000340800009A0B00
      00000000000000000000000000000000000100040000FFFFFFFF000000000000
      000000000000030400466F726D00FEFFFFFFDC000000780000007C0100002C01
      000004000000FFFFFFFFFF00000000340800009A0B0000000000000000000000
      000000000000000100040000FFFFFFFF00000000000000000000000003040046
      6F726D00FEFFFFFFDC000000780000007C0100002C01000004000000FFFFFFFF
      FF00000000340800009A0B000000000000000000000000000000000000010004
      0000FFFFFFFF000000000000000000000000030400466F726D00FEFFFFFFDC00
      0000780000007C0100002C010000040000000200D30100000900666276526F64
      61706500020100000000420100002F0400000E00000030000300010000000000
      00000000FFFFFF1F00000000000000000000000000FFFF000000000002000000
      010000000000000001000000C800000014000000010000000000000200C00200
      000B00506167654865616465723100020100000000300000002F0400004A0000
      003000020001000000000000000000FFFFFF1F00000000000000000000050005
      00626567696E0D4300202069662028636C69656E74653D3029206F722028636C
      69656E74653D5B717279496D7072696D6972436F6E747261746F732E22636C69
      656E7465225D29207468656E0D1500202020506167696E61203A3D2050616769
      6E612B310D14002020656C736520506167696E61203A3D20313B200D0300656E
      6400FFFF000000000002000000010000000000000001000000C8000000140000
      000100000000000002006E03000011004361626563616C686F434F4E54524154
      4F000201000000009F0000002F0400000F000000300010000100000000000000
      0000FFFFFF1F0000000034005B64746D436F6E73756C7461436F6E747261746F
      732E717279496D7072696D6972436F6E747261746F732E226E756D65726F225D
      00000000000000FFFF000000000002000000010000000000000001000000C800
      000014000000010000000900436F6E747261746F73000200290400000900436F
      6E747261746F7300020100000000C30000002F04000018000000300005000100
      0000000000000000FFFFFF1F000000001400666462496D7072696D6972436F6E
      747261746F730000000003000500626567696E0D2E002020636C69656E746520
      3A3D205B717279496D7072696D6972436F6E747261746F732E22636C69656E74
      65225D3B0D0300656E6400010000000000000200000001000000000000000100
      0000C800000014000000010000000000000200C2040000100043616265E7616C
      686F434C49454E544500020100000000880000002F0400000600000032001000
      01000000000000000000FFFFFF1F0000000020005B717279496D7072696D6972
      436F6E747261746F732E22636C69656E7465225D00000000000000FFFF000000
      000002000000010000000000000001000000C800000014000000010000000900
      436F6E747261746F730002002F0500000D00526F64617065436C69656E746500
      020100000000180100002F0400000F0000003000110001000000000000000000
      FFFFFF1F00000000000000000000000000FFFF00000000000200000001000000
      0000000001000000C8000000140000000100000000000002009D0500000E0052
      6F64617065436F6E747261746F00020100000000F30000002F04000006000000
      3000110001000000000000000000FFFFFF1F00000000000000000000000000FF
      FF000000000002000000010000000000000001000000C8000000140000000100
      000000000000002706000005004D656D6F380002006E0300005F0000007E0000
      000D00000043000F00F4010000000000000000FFFFFF1F2C0200000000000100
      08005155495441C7C34F00000000FFFF00000000000200000001000000000900
      68656C7665746963610007000000000000000000020000000100020000000000
      FFFFFF0000000002000000000000000000B206000005004D656D6F36000200C2
      0200005F000000AC0000000D00000043000F00F4010000000000000000FFFFFF
      1F2C02000000000001000900505245535441C7C34F00000000FFFF0000000000
      020000000100000000090068656C76657469636100070000000000000000000A
      0000000100020000000000FFFFFF0000000002000000000000000100A1300000
      09006670764C6F676F5F500002001E0000003300000073000000270000000500
      0000F4010000000000000000FFFFFF1F2C020000000000000000000000FFFF00
      000000000200000001000000000100A1300000424D9629000000000000360400
      0028000000B800000034000000010008000000000060250000120B0000120B00
      00000100000001000000000000E6E3AF00AA9F0000A2960000ABAAA90034373B
      0085878A00BFB73A0066666600D7D38300FBFAF200181B2100D5CF7B00B6AD1A
      00DBD78F00EFEFEF0052545800DEDA97001F222800DEDEDE00CBC45A00B8B8BA
      00E6E6E6000C0B0A0099999900D8D9DB00D6D6D60044474A0076787B00EDEBC7
      00ADA4000003070D00F5F3DF00CCCCCC00CCCC6600AEA4070012151A00C5BE4A
      005D606300B0B1B300B8B02600A0A2A3001B1E23002B2E3300F9F8ED0001050A
      004C4F5300868776003B3E4200CDC77C00FFFFFF0092929100C1C2C200090D12
      00E3DEA5005A5A59001615140010131900CCCC6600B3A905006E707300F1EFD5
      00C8C25300C1BA4000E9E7BD002221210029292900F1F0E9005B5D6300BDB531
      00F7F7F700A7A8AA00E1DEA3008A898800D3CE7400403F3E00B2A80B00F5F3D8
      00B7AE210061605F004A4C50001D1C1C009F9FA200FDFDF700080809003A3A3A
      008C8C8B0010101000C9C357004F4F4E0026252400AFB0B2003F424600292B30
      00EBE8BF0047464500BDBDBD00070A10007F8183006B6D7000A2A1A000E5E1AD
      007473730000020700C6BE4F00B2B1B100A59B0000DCDDE6007C7D8000F5F4DF
      00393B40005A5A520008101900424241004A4A49005F5E5D0024272B00C7C26C
      00A5A5A500ADADAD00D7D1810066666600CCC56300E7E4B50084848400525A5A
      00B9B22500BDB54200F0EECF00DFDB9B00D1CC7200DED99900807F7F00BCB32A
      0090909200B5B5B500333333008F919300F7F6E600B1A80F00474545001A1918
      0052525100C5C5C500B4AA1200B0A71000D6DEDE0021211900EDEAC600292921
      00B5BDBD00EFEFF700E6DEDE00948C8C00BDB5B500A5ADA500524A4A00C4BC43
      00C5BDBD007B7B7B00999999002E2D2C0074767900F7F7D600423A3A00DCD893
      00DEDBAF001010080087898B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000003232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232329F5F591084163232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      323232323232323232323232323232323232323232323232323232323232189F
      0606557132323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      323232323232323232323232323232323232323232323232323232323232320F
      04331A323232605218520F323232217618331332326921323216040F32323216
      47335B463232321647163232320F7733040F323232323221040473570F323234
      343232321647181852770F32323232323232605218640F324677193246761332
      46771A32323232320F5218181876163232465B1A32328F331818186032323232
      466933213232328F521818163232872132325B1A323215213232321964181852
      1532321318181818040F3232323232323232323232323259545A773246375788
      555F1332329F57554BA18F320F383C323287008F32326038418851A113323260
      003432321A5A51885A41213232324F578871428D16323271553232195A414B4B
      5A001332323232324659578855721632135456321600643216547C3232323232
      195F55715557550F3216579F323256887171A1541832323208545A1832320857
      88557121324651083232176632465A3732328757A14B4B5741323234554B4B55
      173732323232323232323232323216387C323232040021323232323221008632
      323232320F419F323215178F32464255463216518E323234548F32325F5A0F32
      4655885332690004323204541632325972323233000F32328F00133232323232
      52001A3232323232163833320F0076320F385632323232323232323232040021
      320F517C32323232323232558C3232465A63323232600087323232323246A166
      3232519F3246880832328E5A3232327C413232323232323249540F3232323232
      323232323232168D333232329F57333356330F3233000F32323232320F419F32
      3215578F321300773232329F8D0F3234548F32461756323232521713329F3832
      32326417163232597232326000A2760466541332323232323C57183356180F32
      168D33320F6776320F3856323232323232216373735A3816320F417C32324633
      73738E003C32320F429F323232565449333333163246A1663232519F32468808
      323249678647475942323232150873738DA1463232323232323232323232168D
      863232329F005972718E133252000F32323232320F419F323260178F32130004
      3232321C8D0F3234548F32465749323232181719324957463232641716323259
      72323232185555554257133232323232660059728C8E1632168D18320F677632
      0F385632323232321651417308636032320F417C32328600590808060F323246
      421C32323256005F728C721A3246A16632325184323288083232469F8855558D
      A132322154884F0866213232323232323232323232320F513332323215006032
      323232321A671832323232320F418432323367133246884B323216515F323234
      548F32328E5A0F324655A1463234004732327654163232597232323232323232
      29001632323232325B008F3232323232168D18320F6704321A54523232323232
      8F00603232323232320F417C323210A13232323232323246429F323232210047
      323232323246A16632325184320F381C32323232323232084232327600163232
      323232323232323232323232328F7257888E1532326654718E4F16323249544B
      375921320F41414F72004F3232328F3842378D411A323234548F323219515137
      5A38343232320800717388541632328C4B3232138E37378E1759323232323232
      32635471104F16321657424F8E0055378D411332323232320F88513737596646
      32163884323277675F37375915321A8E57A18E76323249175510371A32464251
      73370042734217213232605937375F006232321351A137375949323232323232
      3232323232199F5759492132323221187C860F3232321A52497C193246045649
      33604632323232165284760F32323234548F3232320F4784521632323232328F
      184956644632328F343232167C4949565B46323232323232323221187C330F32
      46765649491886566416323232323232320F2949497C52533246871A32323221
      8649497C2132167C8D7149343232321A18495616323277864949183356181A32
      3232217C4949336032323232161849497C773232323232323232323232320F57
      3332323232323232323232323232323232323232323232323232323232323232
      3232323232323234003432323232323232323232323232323232323232323204
      0432323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232463334323232323232323232323232
      411C323232323232323232323232323232323232323232323232323232323232
      32323232323232323232323232323232323232323232164B6432323232323232
      3232323232323232323232323232323232323232323232323232323232323221
      A1213232323232323232323232323232323232323232324F4F32323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232320F88863232323232323232323232467256323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232320F46323232323232323232323232323232
      3232323232323232323232323232323232323232323232320F53323232323232
      32323232323232323232323232323243A67B7B7B7B7B7B7B0A32323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      32320F463232323232323232323232320F463232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      323232323232324D3B6A0202020202023D323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      323232323232323232323232323232323232323232323232323232323232323D
      8B021E1E1E1E1E1E3D3232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      323232323232323232323232323232323232323232323232323213476C083710
      101010260F323232323232323232195B0663087D10101010101010101B153232
      32323232323232321927066608441B56323232323232323D8B021E1E1E1E1E1E
      3D32323232323232823F9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D68147A78
      7B20323232323232323232323232323232323D814A142558820E800A32323232
      3232323232323232324A1414141414146532323232323232323232323232531D
      114A22141414141481323232323232320FA22A613535353535351F2A16323232
      3232323227100B6135353535353535353535353500183232323232323232181B
      2461353535350044323232323232323D8B021E1E1E1E1E1E3D32323232323232
      456A020202020202020202020202020202020202020202020223825332323232
      323232323232320A0E071E0202020202020202854A8A32323232323232323232
      530D6A0202020203823232323232323232323232328145020202020202020202
      583232323232320F1B2D240B0B0B0B0B0B0B245D16323232323216263961240B
      0B0B0B0B0B0B0B0B0B0B0B0B615232323232323213506161240B0B0B0B0B1F08
      323232323232323D8B021E1E1E1E1E1E3D3232323232323207021E1E1E1E1E1E
      1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E6A58323232323232323232324828
      02021E1E1E1E1E1E1E1E1E02029078533232323232323232537E021E1E1E1E02
      0C32323232323232323232328202021E1E1E1E1E1E1E1E1E7A3232323232323C
      2D0B0B0B0B0B0B0B0B0B245D16323232321A881F240B0B0B0B0B0B0B0B0B0B0B
      0B0B0B0B615232323232321A2B610B0B0B0B0B0B0B0B1F08323232323232323D
      8B021E1E1E1E1E1E3D3232323232323207021E1E1E1E1E1E1E1E1E1E1E1E1E1E
      1E1E1E1E1E1E1E1E1E1E1E6A78323232323232320A7A02021E1E1E1E1E1E1E1E
      1E1E1E1E1E1E6A3F2032323232323232537E021E1E1E1E020C32323232323232
      32323283021E1E1E1E1E1E1E1E1E1E1E7A3232323232132A390B0B0B0B0B0B39
      61612D0B163232321388610B0B0B0B0B0B242435616161616161616100183232
      32320F05610B0B0B0B0B0B0B2424004432323232323232201E6A02020202026A
      8A3232323232323245036A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A1E1E
      1E1E1E1E4C2032323232320A076A1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E02
      0D3D323232323232537E021E1E1E1E020C3232323232323232320A4E021E1E1E
      1E1E1E1E1E020202143232323232291F0B0B0B0B0B0B3505372626630F323232
      441F0B0B0B0B0B3961125C2E4426262626262626106032323232631F0B0B0B0B
      0B0B3535745C5C2F6565656565656548583E3E3E3E3E3E250983A5A5A5A5A5A5
      227A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A8282071E1E1E1E1E1E02093232
      32325368021E1E1E1E1E02020202231E0202021E1E1E1E1E02288A3232323232
      537E021E1E1E1E020C32323232323232323240021E1E1E1E1E1E1E024C0D0D0D
      82323232323266350B0B0B0B0B0B330F3232323232323227350B0B0B0B0B395D
      29134632323232323232323232323232328F39390B0B0B0B0B616E0416463236
      6A0202020202024E32323232323232534C036A6A6A6A6A6A5E32323232323232
      32323232323232323232323232327A021E1E1E1E023F323232324A6A1E1E1E1E
      1E020D22013D3D3D400C8502021E1E1E1E6A9D3232323232537E021E1E1E1E02
      0C32323232323232323209021E1E1E1E1E1E4E36208A8A8A0A32323232322E35
      0B0B0B0B350832323232323232323250350B0B0B0B24121A3232323232323232
      32323232323232323226610B0B0B0B0B35260F32323232366A1E1E1E1E1E0285
      0A3232323232322C0D021E1E1E1E1E1E7B323232323232323232323232323232
      32323232323294021E1E1E1E1E0D2C32323D23021E1E1E1E1E4A2C3232323232
      323253A58B021E1E1E1E023632323232537E021E1E1E1E020C32323232323232
      32323E021E1E1E1E1E238032323232323232323232325C390B0B0B0B2D183232
      3232323232321A2A390B0B0B0B616C3232323232323232323232323232323232
      162A240B0B0B0B355C463232323232366A1E1E1E1E1E1E850A3232323232322C
      0D021E1E1E1E1E1E7B3232323232323232323232323232323232323232327B02
      1E1E1E1E1E1E8A32323E021E1E1E1E1E4832323232323232323232321D90021E
      1E1E1E7E53323232537E021E1E1E1E020C3232323232323232323F021E1E1E1E
      1E0732323232323232323232323205390B0B0B0B1F293232323232323232291F
      0B0B0B0B0B0B60323232323232323232323232323232323227390B0B0B0B0B35
      15323232323232366A1E1E1E1E1E1E850A3232323232322C0D021E1E1E1E1E1E
      7B3232323232323232323232323232323232323232327A021E1E1E1E1E4C8A32
      8A8B021E1E1E027832323232323232323232323232011E1E1E1E1E1E7B323232
      537E021E1E1E1E020C32323232323232323245021E1E1E1E023E323232323232
      32323232323288390B0B0B0B357732323232323232321C610B0B0B0B0B0B2E26
      4444444444444444444444441060323284350B0B0B0B39050F32323232323236
      6A1E1E1E1E1E1E850A3232323232322C0D021E1E1E1E1E1E7B32323232323232
      323232530A0A0A0A0A0A2C8A8078231E1E1E1E1E1E7E0A3281021E1E1E1E4E53
      323232323232323232323232323268021E1E1E027A323232537E021E1E1E1E02
      0C32323232323232323285021E1E1E1E027A3232323232323232323232320539
      0B0B0B0B3527323232323232323244350B0B0B0B0B0B35616161616161616161
      616161610018323263610B0B0B0B611032323232323232366A1E1E1E1E1E1E85
      0A3232323232322C0D021E1E1E1E1E1E7B323232323232534814450D904C4C4C
      4C4C4C4C23021E1E1E1E1E1E6A7A323222021E1E1E0282323232323232323232
      32323232323236021E1E1E0245323232537E021E1E1E1E020C32323232323232
      323285021E1E1E1E022232323232323232323232323205390B0B0B0B35273232
      3232323232322E350B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B61523232
      441F0B0B0B0B1F263232323232323248030202020202024E3232323232323232
      4C6A0202020202020132323232325E850202021E1E1E1E1E1E1E1E1E1E1E1E1E
      1E1E1E1E1E1D32323E021E1E1E1E813232323232323232323232323232328023
      1E1E1E1E7E0A3232537E021E1E1E1E020C32323232323232323285021E1E1E1E
      028232323232323232323232323205390B0B0B0B352732323232323232322E39
      0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B61523232371F0B0B0B0B1F08
      32323232323232943E141414141414757777777777777776310C0C0C0C0C0C0C
      4D323232324023021E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E0209323232
      07021E1E1E1E7B3232323232323232323232323232322090021E1E1E0D6D3232
      537E021E1E1E1E020C32323232323232323285021E1E1E1E0282323232323232
      32323232323205390B0B0B0B3527323232323232323237350B0B0B0B0B0B0B0B
      0B0B0B0B0B0B0B0B0B0B0B0B6152323263610B0B0B0B61443232323232323232
      323232323232321912353939393939356B32323232323232323232328A0D021E
      1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E020202910E3232323225021E1E1E1E3632
      32323232323232323232323232323D8B021E1E1E4E8A3232537E021E1E1E1E02
      0C32323232323232323285021E1E1E1E02823232323232323232323232320539
      0B0B0B0B3527323232323232323208350B0B0B0B0B0B24242424242424242424
      242424241F5232321C350B0B0B0B355032323232323232323232323232323219
      7439242424242424193232323232323232323232826A1E1E1E1E1E1E1E020202
      020202020202028B854A2032323232327A021E1E1E0278323232323232323232
      3232323232327B1E1E1E1E0245323232537E021E1E1E1E020C32323232323232
      323285021E1E1E1E028232323232323232323232323205390B0B0B0B35273232
      323232323232A81F0B0B0B0B0B0B2A2A2A2A2A2A2A2A2A2A2A2A2A2A35293232
      86350B0B0B0B392B1632323232323232323232323232321974390B0B0B0B0B39
      19323232323232323232320A4E021E1E1E1E1E1E850C1111363636363665403D
      323232323232323209021E1E1E02073232323232323232323232323232328202
      1E1E1E0225323232537E021E1E1E1E020C32323232323232323285021E1E1E1E
      028232323232323232323232323205390B0B0B0B35273232323232323232771F
      0B0B0B0B0B0B76131919191919191919191919191A0F323234390B0B0B0B0B35
      2132323232323232323232323232321974390B0B0B0B0B391932323232323232
      3232321D021E1E1E1E1E1E072C32323232323232323232323232323232323232
      1D1E1E1E1E1E1E7B323232323232323232323232326D901E1E1E1E0211323232
      537E021E1E1E1E020C32323232323232323285021E1E1E1E0282323232323232
      32323232323205390B0B0B0B352732323232323232321A12390B0B0B0B352932
      323232323232323232323232323232320F74240B0B0B0B616232323232323232
      323232323232321974390B0B0B0B0B39193232323232323232323201021E1E1E
      1E1E1E1132323232323232323232323232323232323232323245021E1E1E1E4E
      6D3232323232323232323232329D021E1E1E1E4C8A323232537E021E1E1E1E02
      0C32323232323232323285021E1E1E1E02823232323232323232323232320539
      0B0B0B0B35273232323232323232321B350B0B0B0B3510323232323232323232
      3232323232323232327D350B0B0B0B24121A3232323232323232323232323219
      74390B0B0B0B0B39193232323232323232323236021E1E1E1E1E1E1132323232
      323232323232323232323232323232323236021E1E1E1E02285E323232323232
      3232324D9D021E1E1E1E024A32323232537E021E1E1E1E020C32323232323232
      323285021E1E1E1E028232323232323232323232323205390B0B0B0B35153232
      32323232323232861F0B0B0B0B0B398932323232323232323232323232323232
      3252610B0B0B0B0B392B5B323232323232323232323232130B2D35353535352D
      163232323232323232323240021E1E1E1E1E0225323232323232323232323232
      323232323232323232323F6A1E1E1E1E021E7A400A323232321D0C90021E1E1E
      1E020D53323232323285021E1E1E1E027832323232323232323285021E1E1E1E
      02823232323232323221878787875D240B0B0B0B396260878787871546323216
      5D390B0B0B0B0B391B6C185B87878787878787875B133232320F88350B0B0B0B
      0B3939306389524747474747474747293C08636363636308765B5B5B5B5B5B04
      133232204C1E1E1E1E1E1E1E580C0C0C0C0C0C0C4A4A4A4A4A4A4A4AA5323232
      32323D90021E1E1E1E1E02024E079D078523021E1E1E1E1E1E1E013682828282
      82901E1E1E1E1E1E454A828282828201323285021E1E1E1E1E454A8282828282
      3608353535350B0B0B0B0B0B0B39353535351F0B16323232181F240B0B0B0B0B
      353535353535353535353535001832323232521F0B0B0B0B0B0B0B3535353535
      353535353535670532323232323232320567353535353567183232329D021E1E
      1E1E1E1E0202020202020202020202020202026A7E323232323232948B021E1E
      1E1E1E1E02020202021E1E1E1E1E1E1E028132076A020202021E1E1E1E1E1E1E
      1E02020202026A82323285021E1E1E1E1E1E020202020202583C0B0B0B0B0B0B
      0B0B0B0B0B0B0B0B0B0B245D1632323232632D240B0B0B0B0B0B0B0B0B0B0B0B
      0B0B0B0B61523232323232262D240B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B3930
      0F3232323232323230350B0B0B0B0B35523232327B021E1E1E1E1E1E1E1E1E1E
      1E1E1E1E1E1E1E1E1E1E1E1E4532323232323232400D021E1E1E1E1E1E1E1E1E
      1E1E1E1E1E1E02238132329D021E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E024A
      323285021E1E1E1E1E1E1E1E1E1E1E1E7A3C0B0B0B0B0B0B0B0B0B0B0B0B0B0B
      0B0B245D1632323232326361390B0B0B0B0B0B0B0B0B0B0B0B0B0B0B61523232
      32323246086139390B0B0B0B0B0B0B0B0B0B0B0B0B0B39300F32323232323232
      30350B0B0B0B0B355232323232826A1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
      1E1E1E1E4532323232323232328A6802021E1E1E1E1E1E1E1E1E1E1E1E024594
      3232329D021E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E024A323285021E1E1E1E
      1E1E1E1E1E1E1E1E7A3C242424240B0B0B0B0B0B0B2424242424247416323232
      3232324705351F353539242424242424242424241F5232323232323232470539
      1F61393924242424242424242424356E0F3232323232323230350B0B0B0B0B35
      52323232323222020202021E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E0245323232
      323232323232327B3F1E02020202020202020202858153323232323F021E1E1E
      1E1E1E1E1E1E1E1E1E1E1E1E1E1E6A82323285021E1E1E1E1E1E1E1E1E1E1E1E
      143C0B0B0B0B0B0B0B0B0B0B0B0B2A0B0B0B0B5D163232323232323246473C50
      6E2B120B0B0B0B0B0B0B0B0B352932323232323232323215A27D302B74120B0B
      0B0B0B0B0B0B395C0F3232323232323230350B0B0B0B0B355232323232323240
      22070D8B23232323232323232323232323232302453232323232323232323232
      321D7825850D4C907E3F4A405332323232323225234C4C4C4C1E1E1E1E1E1E1E
      1E4C4C4C4C4C230C323285021E1E1E1E1E1E4C4C4C4C4C4C2216131313132B39
      0B0B0B0B39181313131313135332323232323232323232320F0F131313131313
      13131313190F3232323232323232323232320F16161313131313131313131913
      323232323232323230350B0B0B0B0B35523232323232323232328A6D4D4D4D4D
      4D4D4D4D4D4D4D4D4D4D4D4D6D3232323232323232323232323232320A8A2020
      2C323232323232323232328A4D2020203D4E021E1E1E1E02222020202020202C
      323285021E1E1E1E02142020202020202C323232323205390B0B0B0B35153232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      2B001F1F1F1F1F00183232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      32323232323232323285021E1E1E1E028232323232323232323285021E1E1E1E
      028232323232323232323232323205390B0B0B0B352732323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      32323232323232323232323232323232323232323232323206083C3C3C3C3C63
      3432323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3245021E1E1E1E1E8553323232323232323285021E1E1E1E0282323232323232
      32323232323205390B0B0B0B3527323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323225021E1E1E1E1E
      1E9D403D3D3D3D2C323285021E1E1E1E02823232323232323232323232320539
      0B0B0B0B35273232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      32323232323232323232323232323232324A6A1E1E1E1E1E1E1E021E1E1E020C
      323285021E1E1E1E028232323232323232323232323205390B0B0B0B35273232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      32323232323232323240021E1E1E1E1E1E1E1E1E1E1E024A323285021E1E1E1E
      028232323232323232323232323205390B0B0B0B352732323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      32323F6A1E1E1E1E1E1E1E1E1E1E020C323285021E1E1E1E0282323232323232
      32323232323205390B0B0B0B3527323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      323232323232323232323232323232323232323232323232323220286A021E1E
      1E1E1E1E1E1E020C323285021E1E1E1E02823232323232323232323232320539
      0B0B0B0B35273232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      323232323232323232323232323232323232328A824E1E1E1E1E1E1E1E1E020C
      323285021E1E1E1E028232323232323232323232323262633C3C3C3C63213232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      32323232323232323232323232206509827A222222227A653232787A22222222
      7A36323232323232320000303100000900666D76546974756C6F0002006D0100
      0033000000200200001200000043000000F4010000000000000000FFFFFF1F2C
      020000000000010009005B546974756C6F5D2000000000FFFF00000000000200
      00000100000000090068656C7665746963610009000000020000000000020000
      000000020000000000FFFFFF0000000002000000000000000000C33100000F00
      6D6D6F524F54554C4F444154415F50000200A2030000330000001A0000000D00
      000041000000F4010000000000000000FFFFFF1F2C0200000000000100070044
      617461203A2000000000FFFF0000000000020000000100000000090068656C76
      65746963610007000000000000000000000000000100020000000000FFFFFF00
      000000020000000000000000005832000011006D6D6F524F54554C4F50414749
      4E415F50000200A203000042000000220000000D00000043000000F401000000
      0000000000FFFFFF1F2C0200000000000100070050E167696E613A00000000FF
      FF0000000000020000000100000000090068656C766574696361000700000000
      0000000000080000000100020000000000FFFFFF000000000200000000000000
      0000F53200000F006D6D6F524F44415045484F52415F500002001C0000004201
      0000580000000A00000043000000F4010000000000000000FFFFFF1F2C020000
      000000010011005B54494D4520235468683A6D6D3A73735D00000000FFFF0000
      000000020000000100000000090068656C766574696361000700000000000000
      0000100000000100020000000000FFFFFF0000000002000000000000000000A4
      33000012006D6D6F524F44415045544543534F46545F50000200000300004301
      0000EC0000000A00000043000000F4010000000000000000FFFFFF1F2C020000
      00000001002000746563534F4654202D205465636E6F6C6F67696120656D2053
      697374656D617300000000FFFF0000000000020000000100000000090068656C
      7665746963610007000000000000000000110000000100020000000000FFFFFF
      00000000020000000000000000002D34000005004D656D6F310002006D000000
      6C000000C70000000E00000043000F00F4010000000000000000FFFFFF1F2C02
      00000000000100070050524F4455544F00000000FFFF00000000000200000001
      00000000090068656C76657469636100070000000000000000000A0000000100
      020000000000FFFFFF0000000002000000000000000000B534000005004D656D
      6F320002001D0000006C000000500000000E00000043000F00F4010000000000
      000000FFFFFF1F2C0200000000000100060043D34449474F00000000FFFF0000
      000000020000000100000000090068656C766574696361000700000000000000
      00000A0000000100020000000000FFFFFF000000000200000000000000000039
      35000005004D656D6F37000200C20200006C000000130000000E00000043000F
      00F4010000000000000000FFFFFF1F2C020000000000010002004E5000000000
      FFFF0000000000020000000100000000090068656C7665746963610007000000
      0000000000000A0000000100020000000000FFFFFF0000000002000000000000
      000000C035000005004D656D6F33000200240300006C0000004A0000000E0000
      0043000F00F4010000000000000000FFFFFF1F2C020000000000010005005641
      4C4F5200000000FFFF0000000000020000000100000000090068656C76657469
      636100070000000000000000000A0000000100020000000000FFFFFF00000000
      020000000000000000004836000005004D656D6F34000200F00200006C000000
      340000000E00000043000F00F4010000000000000000FFFFFF1F2C0200000000
      000100060056454E43544F00000000FFFF000000000002000000010000000009
      0068656C76657469636100070000000000000000000A00000001000200000000
      00FFFFFF0000000002000000000000000000D036000006004D656D6F31320002
      00A20300006C0000004A0000000E00000043000F00F4010000000000000000FF
      FFFF1F2C0200000000000100050056414C4F5200000000FFFF00000000000200
      00000100000000090068656C7665746963610007000000000000000000120000
      000100020000000000FFFFFF0000000002000000000000000000923700000600
      4D656D6F31380002001E0000009F0000008E0000000F00000041000000F40100
      00000000000000FFFFFF1F2C02000000000001003F00434F4E545241544F3A20
      205B64746D436F6E73756C7461436F6E747261746F732E717279496D7072696D
      6972436F6E747261746F732E226E756D65726F225D00000000FFFF0000000000
      020000000100000000090068656C766574696361000700000006000000000008
      0000000100020000000000FFFFFF000000000200000000000000000019380000
      06004D656D6F34360002008F0100006C000000200000000E00000043000F00F4
      010000000000000000FFFFFF1F2C0200000000000100040043D3442E00000000
      FFFF0000000000020000000100000000090068656C7665746963610007000000
      0000000000000A0000000100020000000000FFFFFF0000000002000000000000
      0000009F38000005004D656D6F39000200340100006C000000270000000E0000
      0043000F00F4010000000000000000FFFFFF1F2C020000000000010004005154
      444500000000FFFF0000000000020000000100000000090068656C7665746963
      6100070000000000000000000A0000000100020000000000FFFFFF0000000002
      0000000000000000002939000006004D656D6F3130000200AF0100006C000000
      C40000000E00000043000F00F4010000000000000000FFFFFF1F2C0200000000
      00010007005345525649C74F00000000FFFF0000000000020000000100000000
      090068656C76657469636100070000000000000000000A000000010002000000
      0000FFFFFF0000000002000000000000000000B039000006004D656D6F333000
      02006E0300006C000000340000000E00000043000F00F4010000000000000000
      FFFFFF1F2C020000000000010004004441544100000000FFFF00000000000200
      00000100000000090068656C76657469636100070000000000000000000A0000
      000100020000000000FFFFFF00000000020000000000000000007F3A00000600
      4D656D6F3237000200AE0000009F0000006E0000000F00000041000000F40100
      00000000000000FFFFFF1F2C02000000000001004C0056414C4F523A20205B46
      6F726D6174466C6F617428272323232C2323232C2323302E3030272C205B7172
      79496D7072696D6972436F6E747261746F732E2276616C6F727072617A6F225D
      295D00000000FFFF0000000000020000000100000000090068656C7665746963
      610007000000060000000000090000000100020000000000FFFFFF0000000002
      0000000000000000002B3B00000900666D7642616972726F000200940000003E
      000000D70000000A00000043000000F4010000000000000000FFFFFF1F2C0200
      00000000010026005B52554146494C49414C424153455D20202D20205B424149
      52524F46494C49414C424153455D00000000FFFF000000000002000000010000
      0000090068656C76657469636100070000000000000000001000000001000200
      00000000FFFFFF0000000002000000000000000000EE3B00000900666D764369
      646164650002009400000049000000D70000000A00000043000000F401000000
      0000000000FFFFFF1F2C02000000000001003D005B43455046494C49414C4241
      53455D20202D20205B43494441444546494C49414C424153455D20202D20205B
      45535441444F46494C49414C424153455D00000000FFFF000000000002000000
      0100000000090068656C76657469636100070000000000000000001000000001
      00020000000000FFFFFF0000000002000000000000000000823C00000600666D
      765275610002009400000033000000D70000000A00000043000000F401000000
      0000000000FFFFFF1F2C020000000000010011005B52415A414F46494C49414C
      424153455D00000000FFFF0000000000020000000100000000090068656C7665
      746963610007000000000000000000100000000100020000000000FFFFFF0000
      000002000000000000000000093D000006004D656D6F3231000200730200006C
      0000001B0000000E00000043000F00F4010000000000000000FFFFFF1F2C0200
      00000000010004005154444500000000FFFF0000000000020000000100000000
      090068656C76657469636100070000000000000000000A000000010002000000
      0000FFFFFF0000000002000000000000000000913D000006004D656D6F343300
      02008E0200006C000000340000000E00000043000F00F4010000000000000000
      FFFFFF1F2C02000000000001000500544F54414C00000000FFFF000000000002
      0000000100000000090068656C76657469636100070000000000000000000A00
      00000100020000000000FFFFFF0000000002000000000000000300E93D00000A
      005375625265706F7274310002001D000000C40000006C010000140000000100
      000001000000000000000000FFFFFF1F2C020000000000000000000000FFFF00
      00000000020000000100000000010000000300413E00000A005375625265706F
      72743200020090010000C4000000140100001400000001000000010000000000
      00000000FFFFFF1F2C020000000000000000000000FFFF000000000002000000
      0100000000020000000300993E00000A005375625265706F727433000200A702
      0000C40000002A010000140000000100000001000000000000000000FFFFFF1F
      2C020000000000000000000000FFFF0000000000020000000100000000030000
      000000213F000006004D656D6F31310002005B0100006C000000340000000E00
      000043000F00F4010000000000000000FFFFFF1F2C0200000000000100050054
      4F54414C00000000FFFF0000000000020000000100000000090068656C766574
      69636100070000000000000000000A0000000100020000000000FFFFFF000000
      00020000000000000000007640000006004D656D6F33350002006D0100004800
      0000200200001000000043000000F4010000000000000000FFFFFF1F2C020000
      0000000100D2005B64746D436F6E73756C7461436F6E747261746F732E717279
      496D7072696D6972436F6E747261746F732E22636C69656E7465225D202D205B
      64746D436F6E73756C7461436F6E747261746F732E717279496D7072696D6972
      436F6E747261746F732E226E6F6D65225D202D205B4946285B717279496D7072
      696D6972436F6E747261746F732E22706573736F617469706F225D203D202746
      272C2027435046272C2027434E504A27295D3A205B717279496D7072696D6972
      436F6E747261746F732E22706573736F616E756D65726F225D00000000FFFF00
      00000000020000000100000000090068656C7665746963610009000000020000
      0000000A0000000100020000000000FFFFFF0000000002000000000000000000
      6E41000006004D656D6F343400020045020000A0000000580000000F00000043
      000000F4010000000000000000FFFFFF1F2C0200000000000000000500050062
      6567696E0D3200206966205B717279496D7072696D6972436F6E747261746F73
      2E226372656469746F74726F6361225D203E2030207468656E0D1E002020206D
      656D6F203A3D20274352454449544F2044452054524F43413A270D110020656C
      7365206D656D6F203A3D2027273B0D0300656E6400FFFF000000000002000000
      0100000000090068656C76657469636100070000000600000000000800000001
      00020000000000FFFFFF0000000002000000000000000000A142000006004D65
      6D6F34380002009D020000A0000000540000000F00000043000000F401000000
      0000000000FFFFFF1F2C020000000000010000000006000500626567696E0D33
      0020206966205B717279496D7072696D6972436F6E747261746F732E22637265
      6469746F74726F6361225D203E2030207468656E0D4F00202020204D656D6F20
      3A3D20466F726D6174466C6F617428272323232C2323232C2323302E3030272C
      5B717279496D7072696D6972436F6E747261746F732E226372656469746F7472
      6F6361225D290D06002020656C73650D0F00202020204D656D6F203A3D202727
      3B0D0300656E6400FFFF0000000000020000000100000000090068656C766574
      6963610007000000060000000000090000000100020000000000FFFFFF000000
      00020000000000000000009643000006004D656D6F3238000200A80100009F00
      0000540000000F00000041000000F4010000000000000000FFFFFF1F2C020000
      00000000000005000500626567696E0D320020204946205B717279496D707269
      6D6972436F6E747261746F732E226661747572616D656E746F225D203E203020
      5448454E0D1A00202020204D656D6F203A3D20274641545552414D454E544F3A
      270D12002020454C5345204D656D6F203A3D2027273B0D0300656E6400FFFF00
      00000000020000000100000000090068656C7665746963610007000000060000
      0000000A0000000100020000000000FFFFFF0000000002000000000000000000
      1744000006004D656D6F35340002001D00000018010000D00300000F00000043
      000F00F4010000000000000000FFFFFF1F2C020000000000000000000000FFFF
      0000000000020000000100000000090068656C76657469636100080000000200
      000000000A0000000100020000000000FFFFFF00000000020000000000000000
      00DB44000006004D656D6F353500020035030000180100003C0000000F000000
      43000000F4010000000000000000FFFFFF1F2C020000000000010041005B464F
      524D4154464C4F415428272323232C2323232C2323302E3030272C205B53554D
      285B717279546F746169732E22746F74616C61626572746F225D295D295D0000
      0000FFFF0000000000020000000100000000090068656C766574696361000800
      0000020000000000090000000100020000000000FFFFFF000000000200000000
      00000000009D45000006004D656D6F3536000200AE030000180100003E000000
      0F00000043000000F4010000000000000000FFFFFF1F2C02000000000001003F
      005B464F524D4154464C4F415428272323232C2323232C2323302E3030272C20
      5B53554D285B717279546F746169732E22746F74616C7061676F225D295D295D
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      08000000020000000000090000000100020000000000FFFFFF00000000020000
      000000000000006B46000006004D656D6F3537000200D3000000180100004A00
      00000F00000043000000F4010000000000000000FFFFFF1F2C02000000000001
      004B005B464F524D4154464C4F415428272323232C2323232C2323302E303027
      2C205B53554D285B717279496D7072696D6972436F6E747261746F732E227661
      6C6F727072617A6F225D295D295D00000000FFFF000000000002000000010000
      0000090068656C76657469636100080000000200000000000900000001000200
      00000000FFFFFF0000000002000000000000000000F446000006004D656D6F35
      380002001D00000018010000380000000F00000041000000F401000000000000
      0000FFFFFF1F2C02000000000001000600544F5441495300000000FFFF000000
      0000020000000100000000090068656C76657469636100080000000200000000
      00080000000100020000000000FFFFFF00000000020000000000000000008147
      000006004D656D6F3539000200CA02000018010000680000000F000000410000
      00F4010000000000000000FFFFFF1F2C02000000000001000A00454D20414245
      52544F3A00000000FFFF0000000000020000000100000000090068656C766574
      6963610008000000020000000000090000000100020000000000FFFFFF000000
      00020000000000000000000C48000006004D656D6F3630000200740300001801
      00003C0000000F00000041000000F4010000000000000000FFFFFF1F2C020000
      000000010008005155495441444F3A00000000FFFF0000000000020000000100
      000000090068656C766574696361000800000002000000000009000000010002
      0000000000FFFFFF00000000020000000000000000009248000006004D656D6F
      3336000200D50200006C0000001B0000000E00000043000F00F4010000000000
      000000FFFFFF1F2C0200000000000100030042434F00000000FFFF0000000000
      020000000100000000090068656C76657469636100070000000000000000000A
      0000000100020000000000FFFFFF00000000020000000000000000009D490000
      06004D656D6F3337000200230100009F0000007D0000000F00000041000000F4
      010000000000000000FFFFFF1F2C020000000000010000000005000500626567
      696E0D2E0020204946205B717279496D7072696D6972436F6E747261746F732E
      226E6F746173225D203C3E202727205448454E0D3300202020204D656D6F203A
      3D20274E2E462E3A20205B717279496D7072696D6972436F6E747261746F732E
      226E6F746173225D270D11002020454C5345204D656D6F203A3D2027270D0300
      656E6400FFFF0000000000020000000100000000090068656C76657469636100
      07000000060000000000080000000100020000000000FFFFFF00000000020000
      00000000000000C84A000006004D656D6F3338000200FC0100009F0000003800
      00000F00000041000000F4010000000000000000FFFFFF1F2C02000000000000
      000005000500626567696E0D320020204946205B717279496D7072696D697243
      6F6E747261746F732E226661747572616D656E746F225D203E2030205448454E
      0D5000202020204D656D6F203A3D205B464F524D41544441544554494D452827
      64642F6D6D2F79797979272C205B717279496D7072696D6972436F6E74726174
      6F732E226661747572616D656E746F225D295D0D12002020454C5345204D656D
      6F203A3D2027273B0D0300656E6400FFFF000000000002000000010000000009
      0068656C76657469636100070000000600000000000A00000001000200000000
      00FFFFFF0000000002000000000000000000584B00000B006D6D6F504147494E
      415F50000200C403000042000000280000000D00000043000000F40100000000
      00000000FFFFFF1F2C020000000000010008005B506167696E615D00000000FF
      FF0000000000020000000100000000090068656C766574696361000700000000
      0000000000090000000100020000000000FFFFFF000000000200000000000000
      0000F14B000009006D6D6F444154415F50000200BC0300003300000030000000
      0D00000041000000F4010000000000000000FFFFFF1F2C020000000000010013
      005B4441544520234464642F6D6D2F797979795D00000000FFFF000000000002
      0000000100000000090068656C76657469636100070000000000000000000100
      00000100020000000000FFFFFF00000000020000000000000000007E4C000006
      004D656D6F31330002008000000018010000500000000F00000041000000F401
      0000000000000000FFFFFF1F2C02000000000001000A00434F4E545241544F53
      3A00000000FFFF0000000000020000000100000000090068656C766574696361
      0008000000020000000000090000000100020000000000FFFFFF000000000200
      0000000000000201FF4C00000D004461646F7350726F6475746F730002010000
      00002C0000002F0400000B0000003000050001000000000000000000FFFFFF1F
      00000000140066646250726F6475746F73436F6E747261746F73000000000000
      00FFFF000000000002000000010000000000000001000000C800000014000000
      0100000000000002016D4D00000E00526F6461706550726F6475746F73000201
      00000000500000002F0400000D0000003000060001000000000000000000FFFF
      FF1F00000000000000000000000000FFFF000000000002000000010000000000
      000001000000C8000000140000000100000000000000018B4E000005004D656D
      6F350002002001000050000000540000000D0000004300000001000000000000
      000000FFFFFF1F2C020101000000010000000005000500626567696E0D290020
      206966205B717279546F746169732E22746F74616C70726F6475746F73225D20
      3E2030207468656E0D4700202020202020204D656D6F3A3D20466F726D617446
      6C6F617428272323232C2323232C2323302E3030272C5B717279546F74616973
      2E22746F74616C70726F6475746F73225D290D16002020656C7365204D656D6F
      3A3D2027302E3030273B200D0300656E6400FFFF000000000002000000010000
      0000090068656C76657469636100070000000200000000000900000001000200
      00000000FFFFFF0000000002000000000000000001204F000006004D656D6F31
      350002004000000050000000840000000D000000410000000100000000000000
      0000FFFFFF1F2C02000000000001001200544F54414C20444F532050524F4455
      544F5300000000FFFF0000000000020000000100000000090068656C76657469
      63610007000000020000000000080000000100020000000000FFFFFF00000000
      02000000000000000001A54F00000A006D6D6F5A65627261646F000200000000
      002C000000740100000B00000003000000F4010000000000000000FFFFFF1F2C
      020000000000000000000000FFFF000000000002000000010000000609006865
      6C766574696361000A000000000000000000080000000100020000000000FFFF
      FF00000000020000000000000000015D50000006004D656D6F3430000200FFFF
      FFFF2C000000520000000B0000004100000001000000000000000000FFFFFF1F
      2C020000000000010035005B64746D436F6E73756C7461436F6E747261746F73
      2E71727950726F6475746F73436F6E747261746F732E2270726F6475746F225D
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      07000000000000000000090000000100020000000000FFFFFF00000000020000
      000000000000018B51000006004D656D6F3431000200520000002C000000C600
      00000B00000041000000F4010000000000000000FFFFFF1F2C02000000000001
      00AB005B64746D436F6E73756C7461436F6E747261746F732E71727950726F64
      75746F73436F6E747261746F732E2264657363726963616F225D205B64746D43
      6F6E73756C7461436F6E747261746F732E71727950726F6475746F73436F6E74
      7261746F732E2276616C6F72677261646531225D205B64746D436F6E73756C74
      61436F6E747261746F732E71727950726F6475746F73436F6E747261746F732E
      2276616C6F72677261646532225D00000000FFFF000000000002000000010000
      0000090068656C76657469636100070000000000000000000800000001000200
      00000000FFFFFF00000000020000000000000000016952000006004D656D6F35
      310002001A0100002C000000250000000B000000410000000100000000000000
      0000FFFFFF1F2C02000000000001005B005B466F726D6174466C6F6174285B4D
      6173636172615175616E7469646164655D2C5B64746D436F6E73756C7461436F
      6E747261746F732E71727950726F6475746F73436F6E747261746F732E227175
      616E746964616465225D295D00000000FFFF0000000000020000000100000000
      090068656C766574696361000700000000000000000009000000010002000000
      0000FFFFFF00000000020000000000000000012A53000006004D656D6F353200
      0200410100002C000000320000000B0000004100000001000000000000000000
      FFFFFF1F2C02010100000001003E005B466F726D6174466C6F61742827232323
      2C2323232C2323302E3030272C5B71727950726F6475746F73436F6E74726174
      6F732E22746F74616C225D295D00000000FFFF00000000000200000001000000
      00090068656C7665746963610007000000000000000000090000000100020000
      000000FFFFFF0000000002000000000000000202AB5300000D004461646F7353
      65727669636F7300020100000000300000002F0400000B000000300005000100
      0000000000000000FFFFFF1F0000000014006664625365727669636F73436F6E
      747261746F7300000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000202195400000E00526F646170
      655365727669636F7300020100000000500000002F0400000D00000030000600
      01000000000000000000FFFFFF1F00000000000000000000000000FFFF000000
      000002000000010000000000000001000000C800000014000000010000000000
      0000023655000006004D656D6F3134000200D400000050000000600000000D00
      00004300000001000000000000000000FFFFFF1F2C0201010000000000000500
      0500626567696E0D290020206966205B717279546F746169732E22746F74616C
      7365727669636F73225D203E2030207468656E0D4700202020202020204D656D
      6F3A3D20466F726D6174466C6F617428272323232C2323232C2323302E303027
      2C5B717279546F746169732E22746F74616C7365727669636F73225D290D1600
      2020656C7365204D656D6F3A3D2027302E3030273B200D0300656E6400FFFF00
      00000000020000000100000000090068656C7665746963610007000000020000
      000000090000000100020000000000FFFFFF0000000002000000000000000002
      CB55000006004D656D6F32320002002C00000050000000980000000D00000041
      00000001000000000000000000FFFFFF1F2C02000000000001001200544F5441
      4C20444F53205345525649434F5300000000FFFF000000000002000000010000
      0000090068656C76657469636100070000000200000000000800000001000200
      00000000FFFFFF0000000002000000000000000002535600000D006D6D6F5A65
      627261646F5375620002000100000030000000340100000B00000003000000F4
      010000000000000000FFFFFF1F2C020000000000000000000000FFFF00000000
      00020000000100000006090068656C766574696361000A000000000000000000
      000000000100020000000000FFFFFF00000000020000000000000000020B5700
      0006004D656D6F313700020002000000300000001C0000000B00000041000000
      01000000000000000000FFFFFF1F2C020000000000010035005B64746D436F6E
      73756C7461436F6E747261746F732E7172795365727669636F73436F6E747261
      746F732E227365727669636F225D00000000FFFF000000000002000000010000
      0000090068656C76657469636100070000000000000000000900000001000200
      00000000FFFFFF0000000002000000000000000002C557000006004D656D6F32
      300002002000000030000000C60000000B000000410000000100000000000000
      0000FFFFFF1F2C020000000000010037005B64746D436F6E73756C7461436F6E
      747261746F732E7172795365727669636F73436F6E747261746F732E22646573
      63726963616F225D00000000FFFF000000000002000000010000000009006865
      6C7665746963610007000000000000000000080000000100020000000000FFFF
      FF00000000020000000000000000028058000006004D656D6F3234000200E700
      000030000000190000000B0000004100000001000000000000000000FFFFFF1F
      2C020000000000010038005B64746D436F6E73756C7461436F6E747261746F73
      2E7172795365727669636F73436F6E747261746F732E227175616E7469646164
      65225D00000000FFFF0000000000020000000100000000090068656C76657469
      63610007000000000000000000090000000100020000000000FFFFFF00000000
      020000000000000000029859000006004D656D6F323900020001010000300000
      00320000000B0000004100000001000000000000000000FFFFFF1F2C02010100
      0000010095005B466F726D6174466C6F617428272323232C2323232C2323302E
      3030272C5B5B64746D436F6E73756C7461436F6E747261746F732E7172795365
      727669636F73436F6E747261746F732E2276616C6F727365727669636F225D2A
      205B64746D436F6E73756C7461436F6E747261746F732E717279536572766963
      6F73436F6E747261746F732E227175616E746964616465225D295D00000000FF
      FF0000000000020000000100000000090068656C766574696361000700000000
      0000000000090000000100020000000000FFFFFF000000000200000000000000
      0203105A00000D004461646F7350617263656C6173000201000000002C000000
      2F0400000C0000003000050001000000000000000000FFFFFF1F000000000B00
      66646250617263656C617300000000000000FFFF000000000002000000010000
      000000000001000000C8000000140000000100000000000002037E5A00000E00
      526F6461706550617263656C6173000201000000004C0000002F0400000D0000
      003000060001000000000000000000FFFFFF1F00000000000000000000000000
      FFFF000000000002000000010000000000000001000000C80000001400000001
      00000000000000030A5B000006004D656D6F3233000200300000004C0000004E
      0000000D0000004100000001000000000000000000FFFFFF1F2C020000000000
      01000900454D2041424552544F00000000FFFF00000000000200000001000000
      00090068656C7665746963610007000000020000000000090000000100020000
      000000FFFFFF0000000002000000000000000003C75B000006004D656D6F3235
      0002007F0000004C0000004A0000000D00000041000000010000000000000000
      00FFFFFF1F2C02000000000001003A005B464F524D4154464C4F415428272323
      232C2323232C2323302E3030272C205B717279546F746169732E22746F74616C
      41424552544F225D295D00000000FFFF00000000000200000001000000000900
      68656C7665746963610007000000020000000000090000000100020000000000
      FFFFFF0000000002000000000000000003AD5C000006004D656D6F3236000200
      CB0000004C0000003A0000000D0000004100000001000000000000000000FFFF
      FF1F2C020000000000010000000005000500626567696E0D250020206966205B
      717279546F746169732E22746F74616C7061676F225D203E2030207468656E0D
      1500202020204D656D6F203A3D20275155495441444F270D13002020656C7365
      204D656D6F203A3D20272720200D0300656E6400FFFF00000000000200000001
      00000000090068656C7665746963610007000000020000000000090000000100
      020000000000FFFFFF0000000002000000000000000003C05D000006004D656D
      6F3339000200070100004C000000400000000D00000041000000010000000000
      00000000FFFFFF1F2C020000000000010000000005000500626567696E0D2500
      20206966205B717279546F746169732E22746F74616C7061676F225D203E2030
      207468656E0D4200202020204D656D6F203A3D20464F524D4154464C4F415428
      272323232C2323232C2323302E3030272C205B717279546F746169732E22746F
      74616C7061676F225D290D13002020656C7365204D656D6F203A3D2027272020
      0D0300656E6400FFFF0000000000020000000100000000090068656C76657469
      63610007000000020000000000090000000100020000000000FFFFFF00000000
      020000000000000000034B5E000010006D6D6F5A65627261646F537562537562
      0002001C0000002C0000002A0100000B00000003000000F40100000000000000
      00FFFFFF1F2C020000000000000000000000FFFF000000000002000000010000
      0006090068656C766574696361000A0000000000000000000000000001000200
      00000000FFFFFF0000000002000000000000000003F95E000006004D656D6F33
      310002001D0000002C000000130000000B000000410000000100000000000000
      0000FFFFFF1F2C02000000000001002B005B64746D436F6E73756C7461436F6E
      747261746F732E71727950617263656C61732E226E756D65726F225D00000000
      FFFF0000000000020000000100000000090068656C7665746963610007000000
      000000000000090000000100020000000000FFFFFF0000000002000000000000
      000003BE5F000006004D656D6F33320002004C0000002C000000340000000B00
      00004100000001000000000000000000FFFFFF1F2C000000080064642F6D6D2F
      79790001003A005B464F524D41544441544554494D45282764642F6D6D2F7979
      7979272C205B71727950617263656C61732E226461746176656E63746F225D29
      5D00000000FFFF0000000000020000000100000000090068656C766574696361
      00070000000000000000000A0000000100020000000000FFFFFF000000000200
      00000000000000039260000006004D656D6F3333000200820000002C00000046
      0000000B0000000100000001000000000000000000FFFFFF1F2C020101000000
      010051005B464F524D4154464C4F415428272323232C2323232C2323302E3030
      272C205B64746D436F6E73756C7461436F6E747261746F732E71727950617263
      656C61732E2276616C6F7276656E63746F225D295D00000000FFFF0000000000
      020000000100000000090068656C766574696361000700000000000000000009
      0000000100020000000000FFFFFF0000000002000000000000000003B2610000
      06004D656D6F3334000200CA0000002C000000340000000B0000004100000001
      000000000000000000FFFFFF1F2C000000080064642F6D6D2F79790001000000
      0006000500626567696E0D270020206966205B71727950617263656C61732E22
      64617461706167746F225D3C3E2030207468656E0D4300202020206D656D6F3A
      3D5B464F524D41544441544554494D45282764642F6D6D2F79797979272C205B
      71727950617263656C61732E2264617461706167746F225D295D0D0600202065
      6C73650D0C00202020206D656D6F3A3D27270D0300656E6400FFFF0000000000
      020000000100000000090068656C76657469636100070000000000000000000A
      0000000100020000000000FFFFFF0000000002000000000000000003C7620000
      06004D656D6F3533000200000100002C000000450000000B0000000100000001
      000000000000000000FFFFFF1F2C00000000000000000005000500626567696E
      0D280020206966205B71727950617263656C61732E2276616C6F72706167746F
      225D203E2030207468656E0D4500202020204D656D6F203A3D20464F524D4154
      464C4F415428272323232C2323232C2323302E3030272C205B71727950617263
      656C61732E2276616C6F72706167746F225D290D11002020656C7365204D656D
      6F203A3D2027270D0300656E6400FFFF00000000000200000001000000000900
      68656C7665746963610007000000000000000000090000000100020000000000
      FFFFFF0000000002000000000000000003E063000006004D656D6F3432000200
      310000002C0000001B0000000B0000004100000001000000000000000000FFFF
      FF1F2C020000000000010000000005000500626567696E0D380020204946205B
      64746D436F6E73756C7461436F6E747261746F732E71727950617263656C6173
      2E2262616E636F225D203E2030205448454E0D3600202020204D656D6F203A3D
      205B64746D436F6E73756C7461436F6E747261746F732E71727950617263656C
      61732E2262616E636F225D0D12002020454C5345204D656D6F203A3D2027273B
      0D0300656E6400FFFF0000000000020000000100000000090068656C76657469
      63610007000000000000000000090000000100020000000000FFFFFF00000000
      0200000000000000FEFEFF030000000A002043617465676F7279310000000006
      00506167696E6100010030000700636C69656E74650001003000000000000400
      00001400666462496D7072696D6972436F6E747261746F73000000000B006664
      6250617263656C617300000000140066646250726F6475746F73436F6E747261
      746F730000000014006664625365727669636F73436F6E747261746F73000000
      00FC00000000000000000000000000000000580023045BDE6D89E3401C274A48
      4E60E640}
  end
  object fdbImprimirContratos: TfrDBDataSet
    DataSet = qryImprimirContratos
    Left = 792
    Top = 272
  end
  object qryServicosContratos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 'numero=contrato'
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'contrato'
        ParamType = ptUnknown
        Value = 'and contrato = '#39'0'#39
      end>
    Sql.Strings = (
      'select sc.contrato,'
      '          sc.servico,'
      '          sc.quantidade,'
      '          sc.valorservico,'
      '          sc.aliquotaissqn,'
      '          s.descricao,'
      '          sc.equipamento,'
      '          sc.complementoservico,'
      '          (select e.descricao'
      '           from equipamentos e'
      
        '           where e.codigo = sc.equipamento) as descricaoequipame' +
        'nto,'
      ''
      '          (select e.referencia'
      '           from equipamentos e'
      '           where e.codigo = sc.equipamento) as referencia,'
      ''
      '       sc.vendedor,'
      
        '      (select u.nome from usuarios u where u.codigo = sc.vendedo' +
        'r) as nomevendedor,'
      '      '
      '      false as vendedoralterado'
      ''
      ''
      'from servicoscontratos sc, servicos s'
      'where s.codigo = sc.servico'
      '%contrato'
      ''
      '')
    RequestLive = True
    Left = 40
    Top = 312
    object qryServicosContratoscontrato: TStringField
      FieldName = 'contrato'
    end
    object qryServicosContratosservico: TIntegerField
      FieldName = 'servico'
      DisplayFormat = '0'
    end
    object qryServicosContratosquantidade: TIntegerField
      FieldName = 'quantidade'
      DisplayFormat = '0'
    end
    object qryServicosContratosvalorservico: TFloatField
      FieldName = 'valorservico'
      DisplayFormat = '0.00'
    end
    object qryServicosContratosdescricao: TStringField
      FieldName = 'descricao'
      Size = 70
    end
    object qryServicosContratosaliquotaissqn: TFloatField
      FieldName = 'aliquotaissqn'
      DisplayFormat = '0.00'
    end
    object qryServicosContratosequipamento: TStringField
      FieldName = 'equipamento'
      Size = 10
    end
    object qryServicosContratosdescricaoequipamento: TStringField
      FieldName = 'descricaoequipamento'
      Size = 50
    end
    object qryServicosContratosreferencia: TStringField
      FieldName = 'referencia'
    end
    object qryServicosContratoscomplementoservico: TStringField
      FieldName = 'complementoservico'
      Size = 1000
    end
    object qryServicosContratosvendedor: TIntegerField
      FieldName = 'vendedor'
    end
    object qryServicosContratosnomevendedor: TStringField
      FieldName = 'nomevendedor'
      Size = 40
    end
    object qryServicosContratosvendedoralterado: TBooleanField
      FieldName = 'vendedoralterado'
    end
  end
  object qryParcelas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkFields = 'numero=contrato'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrImprimirContratos
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'where'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select numero,'
      '          contrato,'
      '          datavencto,'
      '          valorvencto,'
      '          datapagto,'
      '          valorpagto,'
      
        '          (select banco from contas where conta = contaboleto li' +
        'mit 1) as banco'
      'from parcelas'
      '%where'
      'order by numero, datavencto')
    RequestLive = False
    Left = 40
    Top = 368
    object qryParcelasnumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryParcelascontrato: TStringField
      FieldName = 'contrato'
    end
    object qryParcelasdatavencto: TDateField
      Alignment = taCenter
      FieldName = 'datavencto'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasvalorvencto: TFloatField
      FieldName = 'valorvencto'
      DisplayFormat = '0.00'
    end
    object qryParcelasdatapagto: TDateField
      Alignment = taCenter
      FieldName = 'datapagto'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasvalorpagto: TFloatField
      FieldName = 'valorpagto'
      DisplayFormat = '0.00'
    end
    object qryParcelasbanco: TIntegerField
      FieldName = 'banco'
      DisplayFormat = '0'
    end
  end
  object qryImprimirContratos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'where'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select numero,'
      '           cliente,'
      '           nome,'
      '           pessoatipo,'
      '           formatar_cpf_cnpj(pessoanumero) as pessoanumero,'
      '           faturamento,'
      '           valorprazo,'
      '           creditotroca,'
      '           notas_notasdocontrato(numero) as notas'
      'from contratos'
      '%where'
      'order by cliente')
    RequestLive = False
    Left = 268
    Top = 307
    object qryImprimirContratosnumero: TStringField
      FieldName = 'numero'
    end
    object qryImprimirContratoscliente: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object qryImprimirContratosnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryImprimirContratospessoanumero: TStringField
      FieldName = 'pessoanumero'
      Size = 18
    end
    object qryImprimirContratosfaturamento: TDateField
      Alignment = taCenter
      FieldName = 'faturamento'
      EditMask = '99/99/9999;1; '
    end
    object qryImprimirContratospessoatipo: TStringField
      FieldName = 'pessoatipo'
      Size = 1
    end
    object qryImprimirContratosvalorprazo: TFloatField
      FieldName = 'valorprazo'
      DisplayFormat = '0.00'
    end
    object qryImprimirContratoscreditotroca: TFloatField
      FieldName = 'creditotroca'
      DisplayFormat = '0.00'
    end
    object qryImprimirContratosnotas: TStringField
      FieldName = 'notas'
      Size = 14
    end
  end
  object fdbProdutosContratos: TfrDBDataSet
    DataSet = qryProdutosContratos
    Left = 624
    Top = 472
  end
  object fdbServicosContratos: TfrDBDataSet
    DataSet = qryServicosContratos
    Left = 784
    Top = 472
  end
  object fdbParcelas: TfrDBDataSet
    DataSet = qryParcelas
    Left = 808
    Top = 544
  end
  object qryTotais: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkFields = 'numero=numero'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrImprimirContratos
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'where'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select c.numero,'
      
        '(select sum(pc1.quantidade*pc1.precovenda) from produtoscontrato' +
        's pc1 where pc1.contrato = c.numero) as totalprodutos,'
      
        '(select sum(sc1.quantidade*sc1.valorservico) from servicoscontra' +
        'tos sc1 where sc1.contrato = c.numero) as totalservicos,'
      
        '(select sum(p.valorvencto) from parcelas p where p.contrato = c.' +
        'numero and p.datapagto is null) as totalaberto,'
      
        '(select sum(p.valorpagto) from parcelas p where p.contrato = c.n' +
        'umero and p.datapagto is not null) as totalpago'
      'from contratos c'
      '%where'
      'group by c.numero'
      'order by c.numero')
    RequestLive = False
    Left = 40
    Top = 432
    object qryTotaistotalprodutos: TFloatField
      FieldName = 'totalprodutos'
      DisplayFormat = '0.00'
    end
    object qryTotaistotalservicos: TFloatField
      FieldName = 'totalservicos'
      DisplayFormat = '0.00'
    end
    object qryTotaistotalaberto: TFloatField
      FieldName = 'totalaberto'
      DisplayFormat = '0.00'
    end
    object qryTotaistotalpago: TFloatField
      FieldName = 'totalpago'
      DisplayFormat = '0.00'
    end
    object qryTotaisnumero: TStringField
      FieldName = 'numero'
    end
  end
  object dsrImprimirContratos: TtecDataSource
    DataSet = qryImprimirContratos
    Left = 352
    Top = 320
  end
  object qryImprimirContratos_Lista: TtecQuery
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
        DataType = ftString
        Name = 'where'
        ParamType = ptUnknown
        Value = 'Where False'
      end
      item
        DataType = ftUnknown
        Name = 'order'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select  situacao,'
      '           numero,'
      
        '           cast (cliente as varchar) || '#39' - '#39' || nome as cliente' +
        ','
      '           data,'
      '           datareservado,'
      '           faturamento,'
      '           can_data,'
      
        '           cast(can_usuariologado as varchar)  || '#39' - '#39' || (SELE' +
        'CT nome FROM usuarios WHERE codigo=can_usuariologado) as usuario' +
        'logado,'
      
        '           cast(can_usuarioautorizacao  as varchar) || '#39' - '#39' || ' +
        '(SELECT nome FROM usuarios WHERE codigo=can_usuarioautorizacao) ' +
        'as usuarioautorizacao,'
      '           filialvenda,'
      '           foneddd,'
      '           fonenumero,'
      '           fone2ddd,'
      '           fone2numero,'
      '           consideracoes,'
      
        '           cast(vendedor as varchar)  || '#39' - '#39' || (SELECT nome F' +
        'ROM usuarios WHERE codigo=vendedor) as vendedor'
      ''
      ''
      'from contratos ct'
      '%where'
      '%order')
    RequestLive = False
    Left = 252
    Top = 387
    object qryImprimirContratos_Listasituacao: TStringField
      FieldName = 'situacao'
      Required = True
      Size = 1
    end
    object qryImprimirContratos_Listanumero: TStringField
      FieldName = 'numero'
      Required = True
    end
    object qryImprimirContratos_Listacliente: TMemoField
      FieldName = 'cliente'
      BlobType = ftMemo
    end
    object qryImprimirContratos_Listadata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryImprimirContratos_Listadatareservado: TDateField
      Alignment = taCenter
      FieldName = 'datareservado'
      EditMask = '99/99/9999;1; '
    end
    object qryImprimirContratos_Listafaturamento: TDateField
      Alignment = taCenter
      FieldName = 'faturamento'
      EditMask = '99/99/9999;1; '
    end
    object qryImprimirContratos_Listacan_data: TDateField
      Alignment = taCenter
      FieldName = 'can_data'
      EditMask = '99/99/9999;1; '
    end
    object qryImprimirContratos_Listausuariologado: TMemoField
      FieldName = 'usuariologado'
      BlobType = ftMemo
    end
    object qryImprimirContratos_Listausuarioautorizacao: TMemoField
      FieldName = 'usuarioautorizacao'
      BlobType = ftMemo
    end
    object qryImprimirContratos_Listafilialvenda: TIntegerField
      FieldName = 'filialvenda'
      Required = True
    end
    object qryImprimirContratos_Listaconsideracoes: TStringField
      FieldName = 'consideracoes'
      Size = 1000
    end
    object qryImprimirContratos_Listafoneddd: TIntegerField
      FieldName = 'foneddd'
    end
    object qryImprimirContratos_Listafone2ddd: TIntegerField
      FieldName = 'fone2ddd'
    end
    object qryImprimirContratos_Listafone2numero: TIntegerField
      FieldName = 'fone2numero'
    end
    object qryImprimirContratos_Listafonenumero: TIntegerField
      FieldName = 'fonenumero'
    end
    object qryImprimirContratos_Listavendedor: TMemoField
      FieldName = 'vendedor'
      BlobType = ftMemo
    end
  end
  object dsrImprimirContratos_Lista: TtecDataSource
    DataSet = qryImprimirContratos_Lista
    Left = 336
    Top = 400
  end
  object fdbImprimirContratos_Lista: TfrDBDataSet
    DataSet = qryImprimirContratos_Lista
    Left = 608
    Top = 424
  end
  object qryNotasContrato: TtecQuery
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
      '        n.serie,'
      '        n.numero,'
      '        df.datasaida,'
      '        df.situacao'
      'From    notas n, dadosfiscais df'
      'Where (n.dadofiscal = df.numero) '
      '     and (df.contrato =: contrato)'
      '     and df.situacao='#39'N'#39
      '')
    RequestLive = False
    Left = 520
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptUnknown
      end>
    object qryNotasContratofilial: TIntegerField
      FieldName = 'filial'
      Required = True
      DisplayFormat = '0'
    end
    object qryNotasContratoserie: TStringField
      FieldName = 'serie'
      Required = True
      Size = 3
    end
    object qryNotasContratonumero: TIntegerField
      FieldName = 'numero'
      Required = True
      DisplayFormat = '0'
    end
    object qryNotasContratodatasaida: TDateField
      FieldName = 'datasaida'
    end
    object qryNotasContratosituacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
  end
  object dsrNotasContratos: TDataSource
    DataSet = qryNotasContrato
    Left = 520
    Top = 256
  end
  object qryContratosAlteracao: TtecQuery
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
      'select c.numero,'
      '       c.vendedor,'
      '       c.usuariologadoalteracao,'
      '       c.usuarioalteracao,'
      '       c.datahoraalteracaousuario,'
      '       c.filialvenda,'
      '       c.frete_pago,'
      '       c.consideracoes,'
      '       c.montagemobs,'
      '       c.localizacao,'
      ''
      '       c.usuarioentregaloja,'
      ''
      '       (select u.nome'
      '        from usuarios u'
      
        '        where u.codigo = c.usuarioentregaloja) as nomeusuarioent' +
        'regaloja,'
      ''
      ''
      '       c.definirdadosentregaparatodos,'
      '       c.entrega,'
      '       c.dataentrega,'
      '       c.horaentrega,'
      '       c.periodoentrega,'
      '       c.data'
      ''
      'from contratos c'
      'where c.numero = :numero'
      '')
    RequestLive = True
    Left = 136
    Top = 472
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end>
    object qryContratosAlteracaonumero: TStringField
      FieldName = 'numero'
    end
    object qryContratosAlteracaovendedor: TIntegerField
      FieldName = 'vendedor'
      Required = True
      OnChange = qryContratosAlteracaovendedorChange
    end
    object qryContratosAlteracaousuariologadoalteracao: TIntegerField
      FieldName = 'usuariologadoalteracao'
    end
    object qryContratosAlteracaousuarioalteracao: TIntegerField
      FieldName = 'usuarioalteracao'
    end
    object qryContratosAlteracaodatahoraalteracaousuario: TDateTimeField
      FieldName = 'datahoraalteracaousuario'
    end
    object qryContratosAlteracaofilialvenda: TIntegerField
      FieldName = 'filialvenda'
      Required = True
    end
    object qryContratosAlteracaofrete_pago: TFloatField
      FieldName = 'frete_pago'
    end
    object qryContratosAlteracaoconsideracoes: TStringField
      FieldName = 'consideracoes'
      Size = 1000
    end
    object qryContratosAlteracaomontagemobs: TStringField
      FieldName = 'montagemobs'
      Size = 1000
    end
    object qryContratosAlteracaolocalizacao: TStringField
      FieldName = 'localizacao'
    end
    object qryContratosAlteracaousuarioentregaloja: TIntegerField
      FieldName = 'usuarioentregaloja'
    end
    object qryContratosAlteracaonomeusuarioentregaloja: TStringField
      FieldName = 'nomeusuarioentregaloja'
      Size = 100
    end
    object qryContratosAlteracaodefinirdadosentregaparatodos: TBooleanField
      FieldName = 'definirdadosentregaparatodos'
    end
    object qryContratosAlteracaoentrega: TStringField
      FieldName = 'entrega'
      Size = 1
    end
    object qryContratosAlteracaodataentrega: TDateField
      FieldName = 'dataentrega'
    end
    object qryContratosAlteracaohoraentrega: TTimeField
      FieldName = 'horaentrega'
    end
    object qryContratosAlteracaoperiodoentrega: TIntegerField
      FieldName = 'periodoentrega'
    end
    object qryContratosAlteracaodata: TDateField
      FieldName = 'data'
    end
  end
  object dsrContratosAlteracao: TtecDataSource
    DataSet = qryContratosAlteracao
    OnDataChange = dsrContratosAlteracaoDataChange
    Left = 304
    Top = 472
  end
  object qryDadosFiscaisAlteracao: TtecQuery
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
      'select df.numero,'
      '       df.vendedor,'
      '       df.usuariologadoalteracao,'
      '       df.usuarioalteracao,'
      '       df.datahoraalteracaousuario,'
      '       df.filialvenda'
      'from dadosfiscais df'
      'where df.contrato = :contrato'
      ''
      ''
      '')
    RequestLive = True
    Left = 128
    Top = 520
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptUnknown
      end>
    object qryDadosFiscaisAlteracaonumero: TIntegerField
      FieldName = 'numero'
    end
    object qryDadosFiscaisAlteracaovendedor: TIntegerField
      FieldName = 'vendedor'
    end
    object qryDadosFiscaisAlteracaousuariologadoalteracao: TIntegerField
      FieldName = 'usuariologadoalteracao'
    end
    object qryDadosFiscaisAlteracaousuarioalteracao: TIntegerField
      FieldName = 'usuarioalteracao'
    end
    object qryDadosFiscaisAlteracaodatahoraalteracaousuario: TDateTimeField
      FieldName = 'datahoraalteracaousuario'
    end
    object qryDadosFiscaisAlteracaofilialvenda: TIntegerField
      FieldName = 'filialvenda'
    end
  end
  object dsrDadosFiscaisAlteracao: TtecDataSource
    DataSet = qryDadosFiscaisAlteracao
    Left = 304
    Top = 520
  end
  object qryProdutosDadosFiscaisAlteracao: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'ListaProdutos'
        ParamType = ptUnknown
        Value = '(0,0)'
      end>
    Sql.Strings = (
      'select pdf.dadofiscal,'
      '       pdf.produto,'
      '       pdf.filial,'
      '       pdf.numero,'
      '       pdf.vendedor,'
      '       pdf.usuariologadoalteracao,'
      '       pdf.usuarioalteracao,'
      '       pdf.datahoraalteracaousuario,'
      '       pdf.entrega,'
      '       pdf.periodoentrega,'
      '       pdf.dataentrega,'
      '       pdf.horaentrega'
      ''
      'from produtosdadosfiscais pdf, dadosfiscais df'
      'where pdf.dadofiscal = df.numero'
      '   and df.contrato = :contrato'
      '   and (pdf.produto,pdf.filial) in (%ListaProdutos)'
      ''
      ''
      ''
      '')
    RequestLive = True
    Left = 128
    Top = 576
    ParamData = <
      item
        DataType = ftString
        Name = 'contrato'
        ParamType = ptUnknown
        Value = #39'0'#39
      end>
    object qryProdutosDadosFiscaisAlteracaodadofiscal: TIntegerField
      FieldName = 'dadofiscal'
    end
    object qryProdutosDadosFiscaisAlteracaonumero: TIntegerField
      FieldName = 'numero'
    end
    object qryProdutosDadosFiscaisAlteracaoproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryProdutosDadosFiscaisAlteracaofilial: TIntegerField
      FieldName = 'filial'
    end
    object qryProdutosDadosFiscaisAlteracaovendedor: TIntegerField
      FieldName = 'vendedor'
    end
    object qryProdutosDadosFiscaisAlteracaousuariologadoalteracao: TIntegerField
      FieldName = 'usuariologadoalteracao'
    end
    object qryProdutosDadosFiscaisAlteracaousuarioalteracao: TIntegerField
      FieldName = 'usuarioalteracao'
    end
    object qryProdutosDadosFiscaisAlteracaodatahoraalteracaousuario: TDateTimeField
      Alignment = taCenter
      FieldName = 'datahoraalteracaousuario'
      DisplayFormat = 'dd/MM/yy hh:mm'
      EditMask = '99/99/99 99:99;1; '
    end
    object qryProdutosDadosFiscaisAlteracaoentrega: TStringField
      FieldName = 'entrega'
      Required = True
      Size = 1
    end
    object qryProdutosDadosFiscaisAlteracaoperiodoentrega: TIntegerField
      FieldName = 'periodoentrega'
    end
    object qryProdutosDadosFiscaisAlteracaodataentrega: TDateField
      FieldName = 'dataentrega'
    end
    object qryProdutosDadosFiscaisAlteracaohoraentrega: TTimeField
      FieldName = 'horaentrega'
    end
  end
  object dsrProdutosDadosFiscaisAlteracao: TtecDataSource
    DataSet = qryProdutosDadosFiscaisAlteracao
    Left = 304
    Top = 568
  end
  object dsrServicosContratos: TtecDataSource
    DataSet = qryServicosContratos
    Left = 136
    Top = 296
  end
  object frpImprimirContratos_Lista_Produtos: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnBeforePrint = frpImprimirContratos_Lista_ProdutosBeforePrint
    Left = 448
    Top = 432
    ReportForm = {
      19000000B044000019FFFF00000A0050444643726561746F7200FFFFFFFFFF00
      000000340800009A0B0000000000000000000000000000000000000100040000
      0000FFFF000000000000000000000000030400466F726D00FEFFFFFFDC000000
      780000007C0100002C01000004000000FFFFFFFFFF00000000340800009A0B00
      000000000000000000000000000000000001000400000000FFFF000000000000
      000000000000030400466F726D00FEFFFFFFDC000000780000007C0100002C01
      000004000000FFFFFFFFFF00000000340800009A0B0000000000000000000000
      0000000000000001000400000000FFFF00000000000000000000000003040046
      6F726D00FEFFFFFFDC000000780000007C0100002C0100000400000002007D01
      00000900726470506167696E6100020100000000DC0100002F0400000D000000
      3000030001000000000000000000FFFFFF1F00000000000000000000000000FF
      FF000000000002000000010000000000000001000000C8000000140000000100
      0000000000020023020000080050726F6475746F730002010000000006010000
      2F040000200000003100050001000000000000000000FFFFFF1F000000001A00
      666462496D7072696D6972436F6E747261746F735F4C69737461000000000400
      0500626567696E0D1100204C696E6861203A3D205B4C494E45235D0D0300656E
      640D000000005B000000000002000000010000000000000001000000C8000000
      140000000100000000000002008C0200000900636162506167696E6100020100
      000000010000002F040000440000003000020001000000000000000000FFFFFF
      1F00000000000000000000000000FFFF00000000000200000001000000000000
      0001000000C80000001400000001000000000000020000030000140053756DE1
      72696F446F2052656C6174F372696F3100020100000000B30100002F04000014
      0000003000010001000000000000000000FFFFFF1F0000000000000000000000
      0000FFFF000000000002000000010000000000000001000000C8000000140000
      00010000000000000300580300000A005375625265706F727431000200510200
      0009010000D4000000120000000100000001000000000000000000FFFFFF1F2C
      020000000000000000000000FFFF000000000002000000010000000001000000
      0000FA03000005004D656D6F350002002F000000DE010000C40000000B000000
      43000000F4010000000000000000FFFFFF1F2C020000000000010020005B4461
      746520237464642F64642F79795D205B54494D4520235468683A6D6D5D000000
      00FFFF0000000000070000000100000000090068656C76657469636100070000
      00000000000000100000000100020000000000FFFFFF00000000020000000000
      000000008404000009004D656D6F4D617263610002000C010000350000002A00
      00001000000043000F00F4010000000000000000FFFFFF1F2C02010100000001
      0004004441544100000000015B0000000000020000000100000000090068656C
      76657469636100060000000000000000000A0000001700020000000000FFFFFF
      00000000020000000000000000000C05000006004D656D6F3134000200C60100
      00350000002B0000001000000041000F00F4010000000000000000FFFFFF1F2C
      0200000000000100050043414E432E00000000015B0000000000020000000100
      000000090068656C76657469636100060000000000000000000A000000170002
      0000000000FFFFFF00000000020000000000000000009A05000009004D656D6F
      546F74616C00020022020000350000002F0000001000000043000F00F4010000
      000000000000FFFFFF1F2C020000000000010008004155544F52495A2E000000
      00FFFF0000000000020000000100000000090068656C76657469636100060000
      000000000000000A0000001700020000000000FFFFFF00000000020000000000
      00000000210600000A004D656D6F436F6469676F0002002F0000003500000010
      0000001000000043000F00F4010000000000000000FFFFFF1F2C020000000000
      0100040046494C2E00000000005B000000000002000000010000000005004172
      69616C00060000000000000000000A0000000100020000000000FFFFFF000000
      0002000000000000000100461E000007006670764C6F676F0002002F00000001
      000000740000002A00000005000000F4010000000000000000FFFFFF1F2C0200
      00000000000000000000FFFF00000000000200000001000000060100461E0000
      424DCE1700000000000036040000280000008300000026000000010008000000
      000098130000120B0000120B0000000100000001000000000000E8E5A800AA9E
      000099990000ADADAD003A3C4100A3970000BFB73700D8D48600FBFAF000A5A5
      A5001E1D1C00D8D9DA0054575A00D6D6D500E7E8F20012161B00B6AD1900CBC5
      5B008C8D9200BEC0C500E1E2E40085878A005E606300494C4F00090D12002C2E
      3300DEDB98007D7F8100EFEDCB00B9BABB00AEA400007C7B7B00C5BE44006666
      6600D1CC6F00CDC9810048484600F7F6E600AFA5080004080D00F9F8ED00B8AF
      2700DBD68C00999999001B1A1900C6BF5100131312003B3A3A00FFFFFF00EAE8
      BE00CCCCCC0023262A00E2DEA400F1EFD600B0B1B300D3CD7500B1A81000CCCC
      660072727200535252004342420001060A00ECE9C3008C8C8B00F5F4DF004A4A
      4A0057575600B6AC1F00282B3000C7C05C0061615F00F7F7F70088888700DDD8
      9300E3E0A600FDFCF70021242900070A1000BDB53100C5BE4A00E3E3E200A69C
      000099999900BABAB900DEDEDE00525458002A292800D9D58A005F5E5D00C7C5
      95001B1E2300E8E5B60000000700B5AB1300D5D07B00C6C6C500B2A80B002120
      2000B9B12400504F4E00666666006B6D7000B5B5BD0084848400E0DC9E00BCB4
      2C00F7EFD6005B5B5A00EFEFEF0087898B00DEDEE6003E3D3C0014181E00C8C2
      5300CCC55F00A8A9AC00BDBDBC00E5E1AC0075767900181B2000E6E6E6000E11
      17000810190033333300929191002D2C2B00B5B5B40000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31543D42470E3131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313152313131313148
      6D3131316D6D4C3131316D6D313131313131313131316D483131313131313131
      6D6D3131316D040A6C6C313131313131486D6D4C3131313131316D6D4C313131
      313131313131313131486D6D6D313131313131486D6D48313131316D48313131
      6D6D3131313131313131313131316D6D6D3131486D6D6D313131313131523131
      31317F7E6631554225256031603D42647931420C313B7D316D6C3D7040313166
      2C316D593D7068313133646C702531484255312C70643059313131310C252542
      0E31477431420E4825793131315442433D474C4C640E3120423C300A3131207E
      2C317F70254748484251512531603C316D59253C620A312C2543306831313131
      3152313131316C2031315959313131317C7D4C4C31487C0E3159683177424C51
      347531434031203D487957543130494C7F3D31487C0C310B37317F7031313131
      3C6631313131642C317C33487E51313131313179602F55317C3331316D793B70
      31487E14314857043131316D7C55557E311E3031542D4C314340313148790A0B
      4C313131315231313131477D313125306C64334C5779313131487C0E31224931
      422C31314340316C7D313C7D3131594931570C31543D31487C0C316870593025
      3131313170706C3C0E313C0A313033317C513131310C702570474C4C3033312C
      7C64300A3148300E31796243432248483051517C31603D316D6464590B2C3154
      7C42301C313131313152313131314749313166420C5548313D2C484831487C0E
      48302C311C4248516275316C7D31493D4879627F31256848373031487C0E3131
      550E207031313131473C0C554831642C4C7E330C62793131316830796D313148
      7C3331577D6D6D313148303331487C49555131487C0C0C7E4C2C703131480C0E
      7C2C313C476D6D31313131313152313131040B7E20316D473C6C33310E3D3C6C
      7931254264646D31486C42706831316C7D31484742702031310E3D433D6C3148
      4355314043473D0A31313131796C3C6C0E316670597E3C3D20313131310E256C
      6C7731316C0E312C3D47430431772F3D0A3133424366484825643C7E6C7C7431
      6D225943425531543D59437D3131313131523131316D643B6D3131316D514831
      313179514C316D51793131313131796D3131313C40313131796D313131313179
      794831317F6D316D15154831313131313131795148314879516D796D31313131
      31313151517931317F6D31316D51516D3151577F6D313131797931316D51516D
      5148313131515151313131314851516D31313131315231313131400431313131
      3131313131313131313131313131313131313131313131680431313131313131
      3131313131313148660F31313131313131313131313131313131313131313131
      313131313131313131313131220E313131313131313166553131313131313131
      3131313131313131313131313131313131313131313131313152313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131315C46121212463F31313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131523131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131315F06020202061B313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31523131313131310E40173C18183D6E3131313131310C2C666C3C1818181818
      05683131313131316D3768220D0516313131313108021F1F1F52353131313131
      72070707070707070707070707070750732B3631313131313131313131362B73
      212112081D31313131313131313123505050504B3131313131313131313F0812
      2E505050085231313131312C103E191919195D17313131317966713E4E191919
      191919195D0D31313131312C34282819190017313131313108021F1F1F523531
      313131311152020202020202020202020202020202022776313131313131313F
      501F02020202020202075C313131313131316A060202065F313131313131314C
      120202020202020221523131313175287A78787878784E223131310E1A3E1078
      7871717171717171281731313131773E7A717171712822313131313108021F1F
      1F5235313131313144021F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1D313131
      31310802021F1F1F1F1F1F1F1F02022331313131313107021F1F020831313131
      3131313A521F1F1F1F1F1F1F5052313131310D4E7878787A7A71282231316D7C
      4E7878784E4E7A717171717128173131312C3E7171717119195D223131313131
      08021F1F1F5269314C4C4C4C631F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F52
      503131313138521F1F1F0202020202021F1F1F5212313131313107021F1F0208
      313131313131361F1F1F1F1F0202020221523131316D457A78787A3D370E0E51
      31313B3E7878787A2274140E0E0E0E0E0E15313115787A787871190D0A145A2A
      6A6A6A2A5F36363636365044111111113226262626262626262626262626264A
      1F1F1F1F612631311B521F1F1F02443A08082363021F1F1F525F313131310702
      1F1F02083131313131311B021F1F1F1F6A2B353532523131310E71717171710C
      313131313115781078784E683131313131313131313131311C287878787A2C31
      31310106020202025F3131313131505202020202363131313131313131313131
      3131313144021F1F1F32312639021F1F1F584C31313131311B27021F1F1F3631
      313107021F1F020831313131313123021F1F1F11093131313152313131337A71
      7171454831313131312C28787810344C313131313131313131313131057A7878
      4E663131313135021F1F1F025F313131313150021F1F1F1F3631313131313131
      313131313131314C5E021F1F0276315F521F1F1F4B313131313131313132271F
      1F527331313107021F1F020831313131313112021F1F02723131313131523131
      31601978787A7C4C3131313131662878781045166E6E6E6E6E6E6E6E1C043155
      5B1078717A603131313135021F1F1F025F313131313150021F1F1F1F36313131
      313131314C0909090909363A021F1F1F1F3F314F021F02723131313131313131
      313123021F1F1109313107021F1F02083131313131312E021F1F027331313131
      3152313131601978787A054C3131313131561978787871282828282828282828
      005631337A717171346D313131313552020202025F3131313131210602020202
      3631313131762E635E61616161611F1F1F1F1F1F114C26611F1F027631313131
      3131313131311D1F1F1F1F1D313107021F1F02083131313131312E021F1F023A
      313131313152313131601978787A054C31313131311819787878787878787878
      787878784E1731141978787A454831313131764444444444241551515151464F
      4F4F4F4F413131313A0202021F1F1F1F1F1F1F1F1F1F1F521B311D1F1F1F1F36
      3131313131313131313126391F1F1F5C313107021F1F02083131313131312E02
      1F1F023A313131313152313131601978787A054C313131313156197878787878
      78787878787878784E1731337A717171346D313131313109090909097D713434
      347A37313131313131313158521F1F1F1F1F0202020202020202275831311D1F
      1F1F1F1D3131313131313131313126391F1F1F5C313107021F1F020831313131
      31312E021F1F023A313131313152313131601978787A054C3131313131224E78
      7878784E28282828282828280056310C787171715B0C31313131313131313131
      133E1010105D74313131313131312939021F1F1F1F3911636363636A50083631
      313126611F1F024B313131313131313131313F021F1F1F36313107021F1F0208
      3131313131312E021F1F023A313131313152313131601978787A054C31313131
      3116287878101A2C2C2C2C2C2C2C2C2C7D1E316D1A7A7878197F313131313131
      31313131134E78787828743131313131313176021F1F1F1F2326313131313131
      3131313131313107021F02213131313131313131313173021F1F444C31310702
      1F1F02083131313131312E021F1F023A313131313152313131601978787A054C
      31313131317F197171713448313131313131313131313131561978784E663131
      3131313131313131134E7878782874313131313131312B521F1F1F6129313131
      313131313131313131313158521F1F024A31313131313131317602021F522331
      313107021F1F02083131313131312E021F1F023A313131313152313131331978
      787A053131313131316D347A78784E133131313131313131313131317D287878
      71710431313131313131313113001919190004313131313131312B521F1F1F27
      4131313131313131313131313131310911021F1F1F232631313131295F1F1F1F
      1F612931313107021F1F022B3131313131312E021F1F52233131313131520E14
      602C7A78787A7C141414140C3131203E78787171660A1E6014141414140E3131
      155B107878107A567D371E1E1E1E1E1E13566C6C6C182C75757575756D315C02
      1F1F1F1F211B1B1B1B1B1B4A4A4A4A4A3631313176021F1F1F0261502323725E
      021F1F1F0258762B2B4A44021F1F1F504A4A4A2B1D312E021F1F1F074A4A4A4A
      5C520D7A7A7A78787878787A7A7A5D1731317945197878784E4E7A7A7A7A7A7A
      5D6C313131165D7171717119191919191919195D6E313131313166007A7A7A4E
      1431295E021F1F1F0202020202020202020202062B313131315802021F1F1F02
      0202021F1F1F1F52384C395252521F1F1F1F1F020202020608312E021F1F1F1F
      0202020221521771717878787878787171714E22313131335B28717878787871
      717171714E1731313131173E7A717878787878787878784E6E31313131316628
      7171717A6031314A521F1F1F1F1F1F1F1F1F1F1F1F1F1F524A31313131316939
      521F1F1F1F1F1F1F1F020258310911021F1F1F1F1F1F1F1F1F1F1F022B312E02
      1F1F1F1F1F1F1F1F50520D19191978787878781919190017313131310C0D1028
      4E4E191919191919000D31313131317D1A4E4E4E19191919191919001C313131
      3131662878787810603131315F0202020202020202020202020202062B313131
      31313136733902020202020261721D313129615252521F1F1F1F1F0202020206
      08312E021F1F1F1F0202020221527D17173C107878714D1717170D2C31313131
      31310E0A1C3B2217171717170D7D31313131313148757D77661717171717170D
      0431313131316628787878106031313131364A3A727272727272727272727250
      5C3131313131313131264B5F737338354131313131093A7272725E1F1F1F1F4F
      1212122E5C312E021F1F1F631212121258523131310E1978787A053131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313117003E3E3E5D75313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131310702
      1F1F52583131313131312E021F1F0223313131313152313131601978787A054C
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131317F686E6E6E6E153131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313121021F1F02073131313131312E021F1F023A313131313152313131601978
      787A054C31313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313173021F1F1F1F4F3A233A32312E021F1F023A3131313131523131
      31601978787A054C313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313169521F1F1F1F0202020608312E021F1F023A31313131
      3152313131601978787A054C3131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131310963521F1F1F1F1F1F024A312E021F1F023A
      313131313152313131601971717A054C31313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131313131314150611F1F1F1F1F024A315002
      1F1F023A3131313131523131310C0D17176C774C313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131313131313131313131315C387272727272
      5C31082E2E2E2E1B3131313131520000D41E000009006D6D6F544954554C4F00
      0200B001000001000000DE0100001A00000043000000F4010000000000000000
      FFFFFF1F2C020000000000010008005B746974756C6F5D00000000FFFF000000
      0000020000000100000006090068656C766574696361000A0000000200000000
      00020000000100020000000000FFFFFF0000000002000000000000000000771F
      000006004D656D6F313200020029020000DE0100009A0000000A000000430000
      00F4010000000000000000FFFFFF1F2C02000000000001002000746563534F46
      54202D205465636E6F6C6F67696120656D2053697374656D617300000000FFFF
      0000000000020000000100000000090068656C76657469636100070000000000
      00000000110000000100020000000000FFFFFF00000000020000000000000000
      00FE1F000006004D656D6F554E0002003F000000350000003700000010000000
      43000F00F4010000000000000000FFFFFF1F2C02000000000001000800434F4E
      545241544F00000000015B00000000000200000001000000000500417269616C
      00060000000000000000000A0000000100020000000000FFFFFF000000000200
      00000000000000008820000006004D656D6F3330000200360100003500000029
      0000001000000043000F00F4010000000000000000FFFFFF1F2C020101000000
      010007005245534552562E00000000015B000000000002000000010000000009
      0068656C76657469636100060000000000000000000A00000017000200000000
      00FFFFFF00000000020000000000000000001421000009004D656D6F43757374
      6F000200F101000035000000310000001000000043000F00F401000000000000
      0000FFFFFF1F2C020000000000010006004C4F4741444F00000000015B000000
      0000020000000100000000090068656C76657469636100060000000000000000
      000A0000001700020000000000FFFFFF00000000020000000000000000009B21
      000006004D656D6F32390002005F01000035000000290000001000000043000F
      00F4010000000000000000FFFFFF1F2C020101000000010004004641542E0000
      0000015B0000000000020000000100000000090068656C766574696361000600
      00000000000000000A0000001700020000000000FFFFFF000000000200000000
      00000000007A22000008006D6D6F52617A616F000200A8000000050000000601
      00002E00000043000000F4010000000000000000FFFFFF1F2C02000000000003
      0007005B52617A616F5D0D3100434E504A3A205B464F524D4154544558542827
      23232E2323232E2323232F232323232D2323272C205B434E504A5D295D200D1C
      00492E4553542E3A5B496E7363726963616F457374616475616C5D2020000000
      00FFFF0000000000020000000100000000090068656C76657469636100070000
      00000000000000100000000100020000000000FFFFFF00000000020000000000
      00000000FC22000005004D656D6F310002007600000035000000120000001000
      000043000F00F4010000000000000000FFFFFF1F2C0200000000000100040053
      49542E00000000005B00000000000200000001000000000500417269616C0006
      0000000000000000000A0000000100020000000000FFFFFF0000000002000000
      0000000000008F2300000F006D6D6F524F54554C4F444154415F50000200C903
      0000040000001A0000000D00000041000000F4010000000000000000FFFFFF1F
      2C0200000000000100070044617461203A2000000000FFFF0000000000020000
      000100000000090068656C766574696361000700000000000000000000000000
      0100020000000000FFFFFF00000000020000000000000000002824000009006D
      6D6F444154415F50000200E603000004000000300000000D00000041000000F4
      010000000000000000FFFFFF1F2C020000000000010013005B44415445202344
      64642F6D6D2F797979795D00000000FFFF000000000002000000010000000009
      0068656C76657469636100070000000000000000000100000001000200000000
      00FFFFFF0000000002000000000000000000BB2400000900666D76506167696E
      61000200C9030000140000004A0000000F00000043000000F401000000000000
      0000FFFFFF1F2C02000000000001000D00506167203A205B50414745235D0000
      0000FFFF0000000000020000000100000000090068656C766574696361000700
      0000000000000000000000000100020000000000FFFFFF000000000200000000
      00000000004A2500000B004D656D6F50726F6475746F00020088000000350000
      00840000001000000043000F00F4010000000000000000FFFFFF1F2C02000000
      000001000700434C49454E544500000000015B00000000000200000001000000
      00090068656C76657469636100060000000000000000000A0000000100020000
      000000FFFFFF0000000002000000000000000000D325000005004D656D6F3700
      02005102000035000000420000001000000043000F00F4010000000000000000
      FFFFFF1F2C0200000000000100070050524F4455544F00000000FFFF00000000
      00020000000100000000090068656C7665746963610006000000000000000000
      0A0000001700020000000000FFFFFF00000000020000000000000000005F2600
      0006004D656D6F31310002009302000035000000AD0000001000000043000F00
      F4010000000000000000FFFFFF1F2C02000000000001000900444553435249C7
      C34F00000000FFFF0000000000020000000100000000090068656C7665746963
      6100060000000000000000000A0000001700020000000000FFFFFF0000000002
      000000000000000000E826000006004D656D6F31350002004003000035000000
      270000001000000043000F00F4010000000000000000FFFFFF1F2C0200000000
      000100060051544441444500000000FFFF000000000002000000010000000009
      0068656C76657469636100060000000000000000000A00000017000200000000
      00FFFFFF00000000020000000000000000007027000006004D656D6F31380002
      0095030000350000002F0000001000000043000F00F4010000000000000000FF
      FFFF1F2C02000000000001000500544F54414C00000000FFFF00000000000200
      00000100000000090068656C76657469636100060000000000000000000A0000
      001700020000000000FFFFFF0000000002000000000000000000022800000A00
      6D6D6F5A65627261646F0002002F0000000A010000220200000C000000430000
      0001000000FFFFFF1F0000FFFFFF1F2C02000000000000000002000500626567
      696E0D0300656E6400FFFF0000000000020000000100000000090068656C7665
      74696361000A000000000000000000000000000100020000000000FFFFFF1F00
      000002000000000000000000AE28000005004D656D6F320002002A0000000B01
      0000150000000B00000000000000F4010000000000000000FFFFFF1F2C020000
      00000001002A005B717279496D7072696D6972436F6E747261746F735F4C6973
      74612E2266696C69616C76656E6461225D00000000FFFF000000000002000000
      0100000000090068656C76657469636100070000000000000000001100000017
      00020000000000FFFFFF00000000020000000000000000008329000006004D65
      6D6F3133000200760000000B010000120000000B00000000000000F401000000
      0000000000FFFFFF1F2C020000000000010027005B717279496D7072696D6972
      436F6E747261746F735F4C697374612E22736974756163616F225D00000000FF
      FF0000000000020000000100000000090068656C766574696361000700000000
      00000000001200000017000000FF000000FFFFFF1F2B005B717279496D707269
      6D6972436F6E747261746F735F4C697374612E22736974756163616F225D3D27
      432700020000000000000000002B2A000005004D656D6F34000200880000000B
      010000840000000B00000000000000F4010000000000000000FFFFFF1F2C0200
      00000000010026005B717279496D7072696D6972436F6E747261746F735F4C49
      7374612E22636C69656E7465225D00000000FFFF000000000002000000010000
      0000090068656C76657469636100070000000000000000001000000017000200
      00000000FFFFFF00000000020000000000000000002A2B000005004D656D6F38
      0002005F0100000B010000270000000B00000040000000F40100000000000000
      00FFFFFF1F2C02000000000001007D005B4946285B717279496D7072696D6972
      436F6E747261746F735F4C697374612E226661747572616D656E746F225D3D30
      2C27272C5B464F524D41544441544554494D45282764642F6D6D2F7979272C5B
      717279496D7072696D6972436F6E747261746F735F4C697374612E2266617475
      72616D656E746F225D295D295D00000000FFFF00000000000200000001000000
      00090068656C7665746963610007000000000000000000120000001700020000
      000000FFFFFF0000000002000000000000000000FD2B000006004D656D6F3136
      0002003F0000000B010000370000000B00000000000000F40100000000000000
      00FFFFFF1F2C020000000000010025005B717279496D7072696D6972436F6E74
      7261746F735F4C697374612E226E756D65726F225D00000000FFFF0000000000
      020000000100000000090068656C766574696361000700000000000000000011
      00000017000000FF020200FFFFFF1F2B005B717279496D7072696D6972436F6E
      747261746F735F4C697374612E22736974756163616F225D3D27432700020000
      00000000000000C12C000006004D656D6F33310002000C0100000B0100002A00
      00000B00000000000000F4010000000000000000FFFFFF1F2C02000000000001
      0041005B464F524D41544441544554494D4528202764642F6D6D2F7979272C5B
      717279496D7072696D6972436F6E747261746F735F4C697374612E2264617461
      225D295D00000000FFFF0000000000020000000100000000090068656C766574
      6963610007000000000000000000120000001700020000000000FFFFFF000000
      0002000000000000000000C52D000006004D656D6F3333000200360100000B01
      0000290000000B00000000000000F4010000000000000000FFFFFF1F2C020000
      000000010081005B4946285B717279496D7072696D6972436F6E747261746F73
      5F4C697374612E226461746172657365727661646F225D3D302C27272C5B464F
      524D41544441544554494D45282764642F6D6D2F7979272C5B717279496D7072
      696D6972436F6E747261746F735F4C697374612E226461746172657365727661
      646F225D295D295D00000000FFFF000000000002000000010000000009006865
      6C7665746963610007000000000000000000120000001700020000000000FFFF
      FF0000000002000000000000000000BF2E000006004D656D6F3137000200C601
      00000B0100002B0000000B00000040000000F4010000000000000000FFFFFF1F
      2C000000000000010077005B4946285B717279496D7072696D6972436F6E7472
      61746F735F4C697374612E2263616E5F64617461225D3D302C27272C5B464F52
      4D41544441544554494D45282764642F6D6D2F7979272C5B717279496D707269
      6D6972436F6E747261746F735F4C697374612E2263616E5F64617461225D295D
      295D00000000FFFF0000000000020000000100000000090068656C7665746963
      610007000000000000000000120000001700020000000000FFFFFF0000000002
      0000000000000000006D2F000005004D656D6F33000200F10100000B01000031
      0000000B00000000000000F4010000000000000000FFFFFF1F2C020000000000
      01002C005B717279496D7072696D6972436F6E747261746F735F4C497374612E
      227573756172696F6C6F6761646F225D00000000FFFF00000000000200000001
      00000000090068656C7665746963610007000000000000000000100000001700
      020000000000FFFFFF00000000020000000000000000002030000005004D656D
      6F36000200220200000B0100002E0000000B00000000000000F4010000000000
      000000FFFFFF1F2C020000000000010031005B717279496D7072696D6972436F
      6E747261746F735F4C497374612E227573756172696F6175746F72697A616361
      6F225D00000000FFFF0000000000020000000100000000090068656C76657469
      63610007000000000000000000100000001700020000000000FFFFFF00000000
      02000000000000000000CF30000006004D656D6F31300002000B010000190100
      00660100000B00000003000000F4010000000000000000FFFFFF1F2C02000000
      000001002C005B717279496D7072696D6972436F6E747261746F735F4C697374
      612E22636F6E736964657261636F6573225D00000000FFFF0000000000020000
      000100000000090068656C766574696361000700000000000000000010000000
      1700020000000000FFFFFF00000000020000000000000004001E31000005004C
      696E65310002002F00000006010000E803000000000000010008006400000000
      0000000000FFFFFF002C020000000000000000000000FFFF0000000000020000
      0001000000060000A731000006004D656D6F34340002002C000000190100001F
      0000000B00000043000000F4010000000000000000FFFFFF1F2C020000000000
      01000600466F6E65203A00000000FFFF00000000000200000001000000000900
      68656C7665746963610007000000000000000000110000000100020000000000
      FFFFFF0000000002000000000000000000E734000006004D656D6F3435000200
      4D000000190100005A0000000B00000043000000F4010000000000000000FFFF
      FF1F2C0200000000000100010020000D000500626567696E0D3D002020696620
      5B717279496D7072696D6972436F6E747261746F735F4C697374612E22666F6E
      656E756D65726F225D203E2030207468656E20626567696E0D36002020202069
      66205B717279496D7072696D6972436F6E747261746F735F4C697374612E2266
      6F6E65646464225D203D2030207468656E0D1700202020202020202020546578
      743A3D20272820202920270D490020202020656C736520546578743A3D202728
      27202B20537472285B717279496D7072696D6972436F6E747261746F735F4C69
      7374612E22666F6E65646464225D29202B20272920273B0D4100202020206966
      204C656E677468285B717279496D7072696D6972436F6E747261746F735F4C69
      7374612E22666F6E656E756D65726F225D29203D2037207468656E0D50002020
      202020204D656D6F3A3D2054657874202B20436F7079285B717279496D707269
      6D6972436F6E747261746F735F4C697374612E22666F6E656E756D65726F225D
      2C312C3329202B20272D27202B200D4700202020202020202020202020202020
      2020202020436F7079285B717279496D7072696D6972436F6E747261746F735F
      4C697374612E22666F6E656E756D65726F225D2C342C34290D46002020202065
      6C7365206966204C656E677468285B717279496D7072696D6972436F6E747261
      746F735F4C697374612E22666F6E656E756D65726F225D29203D203820746865
      6E0D4F002020202020204D656D6F3A3D2054657874202B20436F7079285B7172
      79496D7072696D6972436F6E747261746F735F4C697374612E22666F6E656E75
      6D65726F225D2C312C3429202B20272D27202B0D480020202020202020202020
      20202020202020202020436F7079285B717279496D7072696D6972436F6E7472
      61746F735F4C697374612E22666F6E656E756D65726F225D2C352C34293B0D06
      002020656E643B0D0300656E6400FFFF00000000000200000001000000000900
      68656C7665746963610007000000000000000000100000000100020000000000
      FFFFFF00000000020000000000000000003038000006004D656D6F3537000200
      AC000000190100005A0000000B00000043000000F4010000000000000000FFFF
      FF1F2C0200000000000100010020000D000500626567696E0D3E002020696620
      5B717279496D7072696D6972436F6E747261746F735F4C697374612E22666F6E
      65326E756D65726F225D203E2030207468656E20626567696E0D370020202020
      6966205B717279496D7072696D6972436F6E747261746F735F4C697374612E22
      666F6E6532646464225D203D2030207468656E0D170020202020202020202054
      6578743A3D20272820202920270D4A0020202020656C736520546578743A3D20
      272827202B20537472285B717279496D7072696D6972436F6E747261746F735F
      4C697374612E22666F6E6532646464225D29202B20272920273B0D4200202020
      206966204C656E677468285B717279496D7072696D6972436F6E747261746F73
      5F4C697374612E22666F6E65326E756D65726F225D29203D2037207468656E0D
      51002020202020204D656D6F3A3D2054657874202B20436F7079285B71727949
      6D7072696D6972436F6E747261746F735F4C697374612E22666F6E65326E756D
      65726F225D2C312C3329202B20272D27202B200D480020202020202020202020
      20202020202020202020436F7079285B717279496D7072696D6972436F6E7472
      61746F735F4C697374612E22666F6E65326E756D65726F225D2C342C34290D47
      0020202020656C7365206966204C656E677468285B717279496D7072696D6972
      436F6E747261746F735F4C697374612E22666F6E65326E756D65726F225D2920
      3D2038207468656E0D50002020202020204D656D6F3A3D2054657874202B2043
      6F7079285B717279496D7072696D6972436F6E747261746F735F4C697374612E
      22666F6E65326E756D65726F225D2C312C3429202B20272D27202B0D49002020
      202020202020202020202020202020202020436F7079285B717279496D707269
      6D6972436F6E747261746F735F4C697374612E22666F6E65326E756D65726F22
      5D2C352C34293B0D06002020656E643B0D0300656E6400FFFF00000000000200
      00000100000000090068656C7665746963610007000000000000000000100000
      000100020000000000FFFFFF0000000002000000000000000000BB3800000600
      4D656D6F313900020067030000350000002E0000001000000043000F00F40100
      00000000000000FFFFFF1F2C0200000000000100080050454E44454E54450000
      0000FFFF0000000000020000000100000000090068656C766574696361000600
      00000000000000000A0000001700020000000000FFFFFF000000000200000000
      00000000004639000006004D656D6F3230000200C4030000350000002E000000
      1000000043000F00F4010000000000000000FFFFFF1F2C020000000000010008
      00505245564953C34F00000000FFFF0000000000020000000100000000090068
      656C76657469636100060000000000000000000A0000001700020000000000FF
      FFFF0000000002000000000000000000CF39000006004D656D6F3231000200F2
      03000035000000270000001000000043000F00F4010000000000000000FFFFFF
      1F2C0200000000000100060051544441444500000000FFFF0000000000020000
      000100000000090068656C76657469636100060000000000000000000A000000
      1700020000000000FFFFFF0000000002000000000000000000613A000006004D
      656D6F3232000200C403000029000000550000000C00000043000F00F4010000
      000000000000FFFFFF1F2C02000000000001000F0050454449444F5320414245
      52544F5300000000FFFF0000000000020000000100000000090068656C766574
      69636100060000000000000000000A0000001700020000000000FFFFFF000000
      0002000000000000000000EC3A000006004D656D6F3235000200880100003500
      00003E0000001000000043000F00F4010000000000000000FFFFFF1F2C020000
      0000000100080056454E4445444F5200000000015B0000000000020000000100
      000000090068656C76657469636100060000000000000000000A000000170002
      0000000000FFFFFF0000000002000000000000000000963B000006004D656D6F
      3236000200880100000B010000390000000B00000000000000F4010000000000
      000000FFFFFF1F2C020000000000010027005B717279496D7072696D6972436F
      6E747261746F735F4C497374612E2276656E6465646F72225D00000000FFFF00
      00000000020000000100000000090068656C7665746963610007000000000000
      000000100000001700020000000000FFFFFF0000000002000000000000000201
      173C00000D004461646F7350726F6475746F73000201000000005C0000002F04
      00000B0000003100050001000000000000000000FFFFFF1F0000000014006664
      6250726F6475746F73436F6E747261746F7300000000000000FFFF0000000000
      02000000010000000000000001000000C8000000000000000100000000000000
      01AC3C00000D006D6D6F5A65627261646F537562000200000000005C00000073
      0100000B0000004300000001000000FFFFFF1F0000FFFFFF1F2C020000000000
      00000002000500626567696E0D0300656E6400FFFF0000000000020000000100
      000006090068656C766574696361000A00000000000000000000000000010002
      0000000000FFFFFF1F00000002000000000000000001753D000006004D656D6F
      3531000200ED0000005C000000250000000B0000004100000001000000000000
      000000FFFFFF1F2C020000000000010046005B466F726D6174466C6F6174285B
      4D6173636172615175616E7469646164655D2C5B71727950726F6475746F7343
      6F6E747261746F732E227175616E746964616465225D295D00000000FFFF0000
      000000020000000100000000090068656C766574696361000700000000000000
      0000010000000100020000000000FFFFFF000000000200000000000000000136
      3E000006004D656D6F35320002003C0100005C000000320000000B0000004100
      000001000000000000000000FFFFFF1F2C02030100000001003E005B466F726D
      6174466C6F617428272323232C2323232C2323302E3030272C5B71727950726F
      6475746F73436F6E747261746F732E22746F74616C225D295D00000000FFFF00
      00000000020000000100000000090068656C7665746963610007000000000000
      000000010000000100020000000000FFFFFF0000000002000000000000000001
      823F000005004D656D6F39000200140100005C000000250000000B0000004100
      000001000000000000000000FFFFFF1F2C020000000000010000000008000500
      626567696E0D3A00204946205B71727950726F6475746F73436F6E747261746F
      732E227175616E7469646164655F70656E64656E7465225D203C3E2030205448
      454E0D5A002020206D656D6F203A3D205B466F726D6174466C6F6174285B4D61
      73636172615175616E7469646164655D2C5B71727950726F6475746F73436F6E
      747261746F732E227175616E7469646164655F70656E64656E7465225D295D0D
      060020454C5345200D10002020206D656D6F203A3D2027273B20200D00000D01
      00200D0300656E6400FFFF0000000000020000000100000000090068656C7665
      746963610007000000000000000000010000000100020000000000FFFFFF0000
      0000020000000000000000017140000006004D656D6F3431000200400000005C
      000000AC0000000B00000043000000F4010000000000000000FFFFFF1F2C0200
      0000000001006C005B71727950726F6475746F73436F6E747261746F732E2264
      657363726963616F225D205B71727950726F6475746F73436F6E747261746F73
      2E2276616C6F72677261646531225D205B71727950726F6475746F73436F6E74
      7261746F732E2276616C6F72677261646532225D00000000FFFF000000000002
      0000000100000000090068656C76657469636100070000000000000000000000
      00000100020000000000FFFFFF00000000020000000000000000011A41000006
      004D656D6F3430000200000000005C000000400000000B000000410000000100
      0000000000000000FFFFFF1F2C020000000000010026005B71727950726F6475
      746F73436F6E747261746F732E2270726F6475746F76697375616C225D000000
      00FFFF0000000000020000000100000000090068656C76657469636100070000
      00000000000000010000000100020000000000FFFFFF00000000020000000000
      00000301724100000A005375625265706F727432000200740100005C0000008C
      000000120000000100000001000000000000000000FFFFFF1F2C020000000000
      000000000000FFFF0000000000020000000100000000020000000202F8410000
      0C004461646F734D65737472653100020100000000A80000002F0400000B0000
      003100050001000000000000000000FFFFFF1F000000001A0066444250726F64
      75746F7350656469646F73507265766973616F00000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      00029042000010006D6D6F5A65627261646F537562537562000200FFFFFFFFA8
      000000540000000B0000004300000001000000FFFFFF1F0000FFFFFF1F2C0200
      0000000000000002000500626567696E0D0300656E6400FFFF00000000000200
      00000100000000090068656C766574696361000A000000000000000000000000
      000100020000000000FFFFFF1F000000020000000000000000025F4300000600
      4D656D6F32340002002C000000A8000000250000000B00000041000000010000
      00000000000000FFFFFF1F2C02000000000001004C005B466F726D6174466C6F
      6174285B4D6173636172615175616E7469646164655D2C5B71727950726F6475
      746F7350656469646F73507265766973616F2E227175616E746964616465225D
      295D00000000FFFF0000000000020000000100000000090068656C7665746963
      610007000000000000000000110000000100020000000000FFFFFF0000000002
      0000000000000000022444000006004D656D6F323700020000000000A8000000
      290000000B0000004100000001000000000000000000FFFFFF1F2C0200000000
      00010042005B464F524D41544441544554494D4528202764642F6D6D2F797927
      2C5B71727950726F6475746F7350656469646F73507265766973616F2E226461
      7461225D295D2000000000FFFF0000000000020000000100000000090068656C
      7665746963610007000000000000000000110000000100020000000000FFFFFF
      000000000200000000000000FEFEFF0000000000000000030000001A00666462
      496D7072696D6972436F6E747261746F735F4C69737461000000001400666462
      50726F6475746F73436F6E747261746F73000000001A0066444250726F647574
      6F7350656469646F73507265766973616F00000000FC00000000000000000000
      000000000000580023045BDE6D89E34089334A484E60E640}
  end
  object qryTotais_: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select cast(null as integer) as RegistrosSelecionados,'
      
        '       cast(null as numeric(11,2)) as TotalRegistrosSelecionados' +
        ','
      '       cast(null as integer) as RegistrosMarcados,'
      '       cast(null as numeric(11,2)) as TotalRegistrosMarcados'
      '        ')
    RequestLive = True
    Left = 648
    Top = 48
    object qryTotais_registrosselecionados: TIntegerField
      FieldName = 'registrosselecionados'
    end
    object qryTotais_totalregistrosselecionados: TFloatField
      FieldName = 'totalregistrosselecionados'
    end
    object qryTotais_registrosmarcados: TIntegerField
      FieldName = 'registrosmarcados'
    end
    object qryTotais_totalregistrosmarcados: TFloatField
      FieldName = 'totalregistrosmarcados'
    end
  end
  object dsrTotais_: TtecDataSource
    DataSet = qryTotais_
    Left = 608
    Top = 24
  end
  object qryProdutosPedidosPrevisao: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select p.numero,'
      '       p.entrega as data,'
      '       pp.quantidade'
      ''
      'from pedidos p'
      '     join produtospedidos pp'
      '     on p.numero = pp.pedido'
      ''
      'where p.situacao IN ('#39'A'#39','#39'P'#39')'
      '  and pp.produto = :produto'
      '  and pedidos_estoquepedido(:produto)>0')
    RequestLive = False
    Left = 624
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qryProdutosPedidosPrevisaonumero: TIntegerField
      FieldName = 'numero'
      Required = True
    end
    object qryProdutosPedidosPrevisaodata: TDateField
      FieldName = 'data'
    end
    object qryProdutosPedidosPrevisaoquantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
    end
  end
  object fDBProdutosPedidosPrevisao: TfrDBDataSet
    DataSet = qryProdutosPedidosPrevisao
    Left = 632
    Top = 536
  end
  object qryContratosVendedores: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterPost = qryContratosVendedoresAfterPost
    AfterDelete = qryContratosVendedoresAfterDelete
    OnNewRecord = qryContratosVendedoresNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select cv.*, u.nome as nomevendedor'
      'from contratosvendedores cv'
      '     join usuarios u'
      '     on cv.vendedor = u.codigo'
      'where cv.contrato = :contrato'
      'order by cv.vendedor')
    RequestLive = True
    Left = 440
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptUnknown
      end>
    object qryContratosVendedorescontrato: TStringField
      FieldName = 'contrato'
    end
    object qryContratosVendedoresvendedor: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'vendedor'
      Required = True
    end
    object qryContratosVendedoresperccomissao: TFloatField
      FieldName = 'perccomissao'
      DisplayFormat = '0.00'
    end
    object qryContratosVendedoresnomevendedor: TStringField
      FieldName = 'nomevendedor'
      Required = True
      Size = 40
    end
  end
  object dsrContratosVendedores: TtecDataSource
    DataSet = qryContratosVendedores
    Left = 480
    Top = 80
  end
  object qryPeriodosEntrega: TtecQuery
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
      'select pe.*,'
      '       false as marcar'
      'from periodosentrega pe'
      'order by pe.codigo')
    RequestLive = True
    Left = 672
    Top = 136
    object qryPeriodosEntregacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryPeriodosEntregadescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
    object qryPeriodosEntregahorapadrao: TTimeField
      Alignment = taCenter
      FieldName = 'horapadrao'
      EditMask = '99:99;1; '
    end
    object qryPeriodosEntregainativo: TDateField
      Alignment = taCenter
      FieldName = 'inativo'
      EditMask = '99/99/9999;1; '
    end
    object qryPeriodosEntregainicio: TTimeField
      Alignment = taCenter
      FieldName = 'inicio'
      DisplayFormat = 'HH:mm'
      EditMask = '99:99;1; '
    end
    object qryPeriodosEntregafim: TTimeField
      Alignment = taCenter
      FieldName = 'fim'
      DisplayFormat = 'HH:mm'
      EditMask = '99:99;1; '
    end
    object qryPeriodosEntregamarcar: TBooleanField
      FieldName = 'marcar'
    end
  end
  object dsrPeriodosEntrega: TtecDataSource
    DataSet = qryPeriodosEntrega
    Left = 704
    Top = 152
  end
  object qryUpdateProdutosDadosFiscais: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'ListaProdutos'
        ParamType = ptUnknown
        Value = '(0,0)'
      end>
    Sql.Strings = (
      
        'update produtosdadosfiscais set usuariologadoalteracao = :usuari' +
        'ologadoalteracao,'
      
        '                                usuarioalteracao = :usuarioalter' +
        'acao,'
      
        '                                datahoraalteracaousuario = :data' +
        'horaalteracaousuario,'
      '                                entrega = :entrega,'
      '                                entregar = :entregar,'
      
        '                                periodoentrega = :periodoentrega' +
        ','
      '                                dataentrega = :dataentrega,'
      '                                horaentrega = :horaentrega'
      'where (dadofiscal, numero, produto)'
      'in'
      ''
      '   ('
      '      select pdf.dadofiscal, pdf.numero, pdf.produto'
      '      from produtosdadosfiscais pdf, dadosfiscais df'
      '      where pdf.dadofiscal = df.numero'
      '        and df.contrato = :contrato'
      '        and (pdf.produto,pdf.filial) in (%ListaProdutos)'
      ''
      '        and df.situacao = '#39'N'#39
      ''
      '        and  (pdf.quantidade -'
      '              coalesce((select sum(ctd.quantidade)'
      '                        from contratosdevolvidos ctd'
      '                        where ctd.contrato = df.contrato'
      '                          and ctd.produto = pdf.produto'
      '                          and ctd.situacao = '#39'N'#39'),0)  > 0)'
      ''
      '        and not exists (select rn.dadofiscal'
      '                        from romaneiosnotas rn'
      '                        where rn.dadofiscal = df.numero'
      
        '                          and rn.data_hora_recebimento is not nu' +
        'll'
      '                          and rn.justificativa_entrega is null)'
      '    )'
      ''
      ''
      ''
      ''
      '')
    RequestLive = True
    Left = 496
    Top = 568
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'usuariologadoalteracao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'usuarioalteracao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datahoraalteracaousuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'entrega'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'entregar'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'periodoentrega'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataentrega'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'horaentrega'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'contrato'
        ParamType = ptUnknown
        Value = #39'0'#39
      end>
    object IntegerField1: TIntegerField
      FieldName = 'dadofiscal'
    end
    object IntegerField2: TIntegerField
      FieldName = 'numero'
    end
    object LargeintField1: TLargeintField
      FieldName = 'produto'
    end
    object IntegerField3: TIntegerField
      FieldName = 'filial'
    end
    object IntegerField4: TIntegerField
      FieldName = 'vendedor'
    end
    object IntegerField5: TIntegerField
      FieldName = 'usuariologadoalteracao'
    end
    object IntegerField6: TIntegerField
      FieldName = 'usuarioalteracao'
    end
    object DateTimeField1: TDateTimeField
      Alignment = taCenter
      FieldName = 'datahoraalteracaousuario'
      DisplayFormat = 'dd/MM/yy hh:mm'
      EditMask = '99/99/99 99:99;1; '
    end
    object StringField1: TStringField
      FieldName = 'entrega'
      Required = True
      Size = 1
    end
    object IntegerField7: TIntegerField
      FieldName = 'periodoentrega'
    end
    object DateField1: TDateField
      FieldName = 'dataentrega'
    end
    object TimeField1: TTimeField
      FieldName = 'horaentrega'
    end
  end
  object frxReport1: TfrxReport
    Version = '4.0.11'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45576.447252500000000000
    ReportOptions.LastChange = 45576.447252500000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 672
    Top = 400
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
    end
  end
  object frpOrcamento: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 536
    Top = 330
    ReportForm = {
      190000008A65000019FFFF00000A0050444643726561746F7200FFFFFFFFFF00
      000000340800009A0B000024000000120000000E000000120000000000040000
      FFFFFFFF000000000000000000000000030400466F726D00FEFFFFFFDC000000
      780000007C0100002C010000040000000200D10000000900666276526F646170
      65000201000000009D030000F50200000D000000300003000100000000000000
      0000FFFFFF1F00000000000000000000000000FFFF0000000000020000000100
      00000000000001000000C8000000140000000100000000000002004401000013
      0043616265E7616C686F44652050E167696E61310002010000000014000000F5
      0200003E0000003000020001000000000000000000FFFFFF1F00000000000000
      000000000000FFFF000000000002000000010000000000000001000000C80000
      0014000000010000000000000200BC0100000C004461646F734D657374726531
      0002010000000070000000F50200007F00000032000500010000000000000000
      00FFFFFF1F000000000C006664624F7263616D656E746F00000000000000FFFF
      000000000002000000010000000000000001000000C800000014000000010000
      000000000200D50200000F00446574616C686550726F6475746F730002010000
      0000AC010000F50200000F0000003100080001000000000000000000FFFFFF1F
      00000000150066646250726F6475746F734F7263616D656E746F730000000007
      000500626567696E0D350020206966205B71727950726F6475746F734F726361
      6D656E746F732E22636F6D706C656D656E746F225D203C3E202727207468656E
      0D1A002020202046696C6861312E76697369626C65203A3D20747275650D0600
      2020656C73650D1C002020202046696C6861312E76697369626C65203A3D2066
      616C73653B0D020020200D0300656E6400FFFF00000000000200000001000000
      00060046696C6861310001000000C8000000140000000100000000000002005B
      0300000B004461646F73506C616E6F73000201000000009C020000F50200000E
      0000003000080001000000000000000000FFFFFF1F000000001B006664625061
      7263656C6173506C616E6F734F7263616D656E746F7300000000000000FFFF00
      0000000002000000010000000000000004000000980000001F00000001000000
      0000000200FD030000120043616265E7616C686F446520477275706F31000201
      0000000074020000F5020000170000003000100001000000000000000000FFFF
      FF1F0000000025005B71727950617263656C6173506C616E6F734F7263616D65
      6E746F732E22706C616E6F225D00000000000000FFFF00000000000200000001
      0000000000000001000000C800000014000000010000000B004461646F73506C
      616E6F730002006E0400001100526F646170E9446520446574616C6865310002
      010000000020020000F50200004E0000003000090001000000000000000000FF
      FFFF1F00000000000000000000000000FFFF0000000000020000000100000000
      00000001000000C800000014000000010000000000000200E30400000F00526F
      646170E9446520477275706F3100020100000000C0020000F502000046000000
      3000110001000000000000000000FFFFFF1F00000000000000000000000000FF
      FF0000000000020000000100000000060046696C6861320001000000C8000000
      140000000100000000000002005B05000018004361626563616C686F44657461
      6C686550726F6475746F730002010000000070010000F50200002F0000003000
      070001000000000000000000FFFFFF1F00000000000000000000000000FFFF00
      0000000002000000010000000000000001000000C80000001400000001000000
      0000000200D305000018004361626563616C686F446574616C68655365727669
      636F7300020100000000F8000000F50200003600000030000700010000000000
      00000000FFFFFF1F00000000000000000000000000FFFF000000000002000000
      010000000000000001000000C800000014000000010000000000000200560600
      000F00446574616C68655365727669636F730002010000000040010000F50200
      000F0000003000080001000000000000000000FFFFFF1F000000001400666462
      5365727669636F734F7263616D656E746F00000000000000FFFF000000000002
      000000010000000000000001000000C800000014000000010000000000000200
      C70600001100526F646170E9446520446574616C686532000201000000005001
      0000F5020000160000003000090001000000000000000000FFFFFF1F00000000
      000000000000000000FFFF000000000002000000010000000000000001000000
      C8000000140000000100000000000002002D070000060046696C686131000201
      00000000F8010000F502000020000000B100150001000000000000000000FFFF
      FF1F00000000000000000000000000FFFF000000000002000000010000000000
      000001000000C80000001400000001000000000000020093070000060046696C
      6861320002010000000018030000F50200006E00000030001500010000000000
      00000000FFFFFF1F00000000000000000000000000FFFF000000000002000000
      010000000000000001000000C800000014000000010000000000000000100800
      0006004D656D6F37360002002400000078020000C20200001200000043000F00
      64000000000000000000FFFFFF1F2C020000000000000000000000FFFF000000
      00000200000001000000000500417269616C000A000000000000000000000000
      000100020000000000FFFFFF0000000002000000000000000000A50800000700
      666D76486F7261000200260000009D030000580000000B00000043000000F401
      0000000000000000FFFFFF1F2C020000000000010011005B54494D4520235468
      683A6D6D3A73735D00000000FFFF000000000002000000010000000009006865
      6C7665746963610007000000000000000000100000000100020000000000FFFF
      FF0000000002000000000000000000520900001000666D76446573656E766F6C
      7665646F720002000A0200009D030000D80000000B00000043000000F4010000
      000000000000FFFFFF1F2C02000000000001002000746563534F4654202D2054
      65636E6F6C6F67696120656D2053697374656D617300000000FFFF0000000000
      020000000100000000090068656C766574696361000700000000000000000011
      0000000100020000000000FFFFFF000000000200000000000000010077210000
      07006670764C6F676F0002002400000014000000730000002700000005000000
      F4010000000000000000FFFFFF1F2C020000000000000000000000FFFF000000
      0000020000000100000006010077210000424DCE170000000000003604000028
      0000008300000026000000010008000000000098130000120B0000120B000000
      0100000001000000000000E8E5A800AA9E000099990000ADADAD003A3C4100A3
      970000BFB73700D8D48600FBFAF000A5A5A5001E1D1C00D8D9DA0054575A00D6
      D6D500E7E8F20012161B00B6AD1900CBC55B008C8D9200BEC0C500E1E2E40085
      878A005E606300494C4F00090D12002C2E3300DEDB98007D7F8100EFEDCB00B9
      BABB00AEA400007C7B7B00C5BE440066666600D1CC6F00CDC9810048484600F7
      F6E600AFA5080004080D00F9F8ED00B8AF2700DBD68C00999999001B1A1900C6
      BF5100131312003B3A3A00FFFFFF00EAE8BE00CCCCCC0023262A00E2DEA400F1
      EFD600B0B1B300D3CD7500B1A81000CCCC660072727200535252004342420001
      060A00ECE9C3008C8C8B00F5F4DF004A4A4A0057575600B6AC1F00282B3000C7
      C05C0061615F00F7F7F70088888700DDD89300E3E0A600FDFCF7002124290007
      0A1000BDB53100C5BE4A00E3E3E200A69C000099999900BABAB900DEDEDE0052
      5458002A292800D9D58A005F5E5D00C7C595001B1E2300E8E5B60000000700B5
      AB1300D5D07B00C6C6C500B2A80B0021202000B9B12400504F4E00666666006B
      6D7000B5B5BD0084848400E0DC9E00BCB42C00F7EFD6005B5B5A00EFEFEF0087
      898B00DEDEE6003E3D3C0014181E00C8C25300CCC55F00A8A9AC00BDBDBC00E5
      E1AC0075767900181B2000E6E6E6000E1117000810190033333300929191002D
      2C2B00B5B5B40000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000031313131313131313131313131313131313131313131313131
      313131313131313131313131313131313131543D42470E313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131523131313131486D3131316D6D4C3131316D6D313131
      313131313131316D4831313131313131316D6D3131316D040A6C6C3131313131
      31486D6D4C3131313131316D6D4C313131313131313131313131486D6D6D3131
      31313131486D6D48313131316D483131316D6D3131313131313131313131316D
      6D6D3131486D6D6D31313131313152313131317F7E6631554225256031603D42
      647931420C313B7D316D6C3D70403131662C316D593D7068313133646C702531
      484255312C70643059313131310C2525420E31477431420E4825793131315442
      433D474C4C640E3120423C300A3131207E2C317F70254748484251512531603C
      316D59253C620A312C25433068313131313152313131316C2031315959313131
      317C7D4C4C31487C0E3159683177424C51347531434031203D48795754313049
      4C7F3D31487C0C310B37317F70313131313C6631313131642C317C33487E5131
      3131313179602F55317C3331316D793B7031487E14314857043131316D7C5555
      7E311E3031542D4C314340313148790A0B4C313131315231313131477D313125
      306C64334C5779313131487C0E31224931422C31314340316C7D313C7D313159
      4931570C31543D31487C0C3168705930253131313170706C3C0E313C0A313033
      317C513131310C702570474C4C3033312C7C64300A3148300E31796243432248
      483051517C31603D316D6464590B2C31547C42301C3131313131523131313147
      49313166420C5548313D2C484831487C0E48302C311C4248516275316C7D3149
      3D4879627F31256848373031487C0E3131550E207031313131473C0C55483164
      2C4C7E330C62793131316830796D3131487C3331577D6D6D313148303331487C
      49555131487C0C0C7E4C2C703131480C0E7C2C313C476D6D3131313131315231
      3131040B7E20316D473C6C33310E3D3C6C7931254264646D31486C4270683131
      6C7D31484742702031310E3D433D6C31484355314043473D0A31313131796C3C
      6C0E316670597E3C3D20313131310E256C6C7731316C0E312C3D47430431772F
      3D0A3133424366484825643C7E6C7C74316D225943425531543D59437D313131
      3131523131316D643B6D3131316D514831313179514C316D5179313131313179
      6D3131313C40313131796D313131313179794831317F6D316D15154831313131
      313131795148314879516D796D3131313131313151517931317F6D31316D5151
      6D3151577F6D313131797931316D51516D514831313151515131313131485151
      6D31313131315231313131400431313131313131313131313131313131313131
      31313131313131316804313131313131313131313131313148660F3131313131
      3131313131313131313131313131313131313131313131313131313131220E31
      3131313131313166553131313131313131313131313131313131313131313131
      3131313131313131313152313131313131313131313131313131313131313131
      31313131313131313131313131313131313131313131313131313131315C4612
      1212463F31313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131523131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      315F06020202061B313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131313131523131313131310E40173C18183D
      6E3131313131310C2C666C3C181818181805683131313131316D3768220D0516
      313131313108021F1F1F52353131313131720707070707070707070707070707
      50732B3631313131313131313131362B73212112081D31313131313131313123
      505050504B3131313131313131313F08122E505050085231313131312C103E19
      1919195D17313131317966713E4E191919191919195D0D31313131312C342828
      19190017313131313108021F1F1F523531313131311152020202020202020202
      020202020202022776313131313131313F501F02020202020202075C31313131
      3131316A060202065F313131313131314C120202020202020221523131313175
      287A78787878784E223131310E1A3E1078787171717171717128173131313177
      3E7A717171712822313131313108021F1F1F5235313131313144021F1F1F1F1F
      1F1F1F1F1F1F1F1F1F1F1F1F1F1D31313131310802021F1F1F1F1F1F1F1F0202
      2331313131313107021F1F0208313131313131313A521F1F1F1F1F1F1F505231
      3131310D4E7878787A7A71282231316D7C4E7878784E4E7A7171717171281731
      31312C3E7171717119195D22313131313108021F1F1F5269314C4C4C4C631F1F
      1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F52503131313138521F1F1F0202020202
      021F1F1F5212313131313107021F1F0208313131313131361F1F1F1F1F020202
      0221523131316D457A78787A3D370E0E5131313B3E7878787A2274140E0E0E0E
      0E0E15313115787A787871190D0A145A2A6A6A6A2A5F36363636365044111111
      113226262626262626262626262626264A1F1F1F1F612631311B521F1F1F0244
      3A08082363021F1F1F525F3131313107021F1F02083131313131311B021F1F1F
      1F6A2B353532523131310E71717171710C313131313115781078784E68313131
      3131313131313131311C287878787A2C3131310106020202025F313131313150
      52020202023631313131313131313131313131313144021F1F1F32312639021F
      1F1F584C31313131311B27021F1F1F3631313107021F1F020831313131313123
      021F1F1F11093131313152313131337A717171454831313131312C2878781034
      4C313131313131313131313131057A78784E663131313135021F1F1F025F3131
      31313150021F1F1F1F3631313131313131313131313131314C5E021F1F027631
      5F521F1F1F4B313131313131313132271F1F527331313107021F1F0208313131
      31313112021F1F0272313131313152313131601978787A7C4C31313131316628
      78781045166E6E6E6E6E6E6E6E1C0431555B1078717A603131313135021F1F1F
      025F313131313150021F1F1F1F36313131313131314C0909090909363A021F1F
      1F1F3F314F021F02723131313131313131313123021F1F1109313107021F1F02
      083131313131312E021F1F0273313131313152313131601978787A054C313131
      3131561978787871282828282828282828005631337A717171346D3131313135
      52020202025F31313131312106020202023631313131762E635E61616161611F
      1F1F1F1F1F114C26611F1F0276313131313131313131311D1F1F1F1F1D313107
      021F1F02083131313131312E021F1F023A313131313152313131601978787A05
      4C31313131311819787878787878787878787878784E1731141978787A454831
      313131764444444444241551515151464F4F4F4F4F413131313A0202021F1F1F
      1F1F1F1F1F1F1F1F521B311D1F1F1F1F363131313131313131313126391F1F1F
      5C313107021F1F02083131313131312E021F1F023A3131313131523131316019
      78787A054C31313131315619787878787878787878787878784E1731337A7171
      71346D313131313109090909097D713434347A37313131313131313158521F1F
      1F1F1F0202020202020202275831311D1F1F1F1F1D3131313131313131313126
      391F1F1F5C313107021F1F02083131313131312E021F1F023A31313131315231
      3131601978787A054C3131313131224E787878784E2828282828282828005631
      0C787171715B0C31313131313131313131133E1010105D743131313131313129
      39021F1F1F1F3911636363636A50083631313126611F1F024B31313131313131
      3131313F021F1F1F36313107021F1F02083131313131312E021F1F023A313131
      313152313131601978787A054C313131313116287878101A2C2C2C2C2C2C2C2C
      2C7D1E316D1A7A7878197F31313131313131313131134E787878287431313131
      31313176021F1F1F1F23263131313131313131313131313107021F0221313131
      3131313131313173021F1F444C313107021F1F02083131313131312E021F1F02
      3A313131313152313131601978787A054C31313131317F197171713448313131
      313131313131313131561978784E6631313131313131313131134E7878782874
      313131313131312B521F1F1F6129313131313131313131313131313158521F1F
      024A31313131313131317602021F522331313107021F1F02083131313131312E
      021F1F023A313131313152313131331978787A053131313131316D347A78784E
      133131313131313131313131317D287878717104313131313131313131130019
      19190004313131313131312B521F1F1F27413131313131313131313131313131
      0911021F1F1F232631313131295F1F1F1F1F612931313107021F1F022B313131
      3131312E021F1F52233131313131520E14602C7A78787A7C141414140C313120
      3E78787171660A1E6014141414140E3131155B107878107A567D371E1E1E1E1E
      1E13566C6C6C182C75757575756D315C021F1F1F1F211B1B1B1B1B1B4A4A4A4A
      4A3631313176021F1F1F0261502323725E021F1F1F0258762B2B4A44021F1F1F
      504A4A4A2B1D312E021F1F1F074A4A4A4A5C520D7A7A7A78787878787A7A7A5D
      1731317945197878784E4E7A7A7A7A7A7A5D6C313131165D7171717119191919
      191919195D6E313131313166007A7A7A4E1431295E021F1F1F02020202020202
      02020202062B313131315802021F1F1F020202021F1F1F1F52384C395252521F
      1F1F1F1F020202020608312E021F1F1F1F020202022152177171787878787878
      7171714E22313131335B28717878787871717171714E1731313131173E7A7178
      78787878787878784E6E313131313166287171717A6031314A521F1F1F1F1F1F
      1F1F1F1F1F1F1F1F524A31313131316939521F1F1F1F1F1F1F1F020258310911
      021F1F1F1F1F1F1F1F1F1F1F022B312E021F1F1F1F1F1F1F1F50520D19191978
      787878781919190017313131310C0D10284E4E191919191919000D3131313131
      7D1A4E4E4E19191919191919001C3131313131662878787810603131315F0202
      020202020202020202020202062B31313131313136733902020202020261721D
      313129615252521F1F1F1F1F020202020608312E021F1F1F1F0202020221527D
      17173C107878714D1717170D2C3131313131310E0A1C3B2217171717170D7D31
      313131313148757D77661717171717170D043131313131662878787810603131
      3131364A3A7272727272727272727272505C3131313131313131264B5F737338
      354131313131093A7272725E1F1F1F1F4F1212122E5C312E021F1F1F63121212
      1258523131310E1978787A053131313131313131313131313131313131313131
      31313131313131313131313131313131313131313131313131313117003E3E3E
      5D75313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131313107021F1F52583131313131312E021F1F02
      23313131313152313131601978787A054C313131313131313131313131313131
      313131313131313131313131313131313131313131313131313131313131317F
      686E6E6E6E153131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313121021F1F02073131313131312E
      021F1F023A313131313152313131601978787A054C3131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131313131313131313173021F1F1F1F4F3A23
      3A32312E021F1F023A313131313152313131601978787A054C31313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131313131313131313131313131313169521F1F1F
      1F0202020608312E021F1F023A313131313152313131601978787A054C313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313109
      63521F1F1F1F1F1F024A312E021F1F023A313131313152313131601971717A05
      4C31313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131314150611F1F1F1F1F024A3150021F1F023A3131313131523131310C0D
      17176C774C313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131315C3872727272725C31082E2E2E2E1B31313131315200
      00222200000900666D76546974756C6F0002005A010000140000001B0100002A
      00000043000000F4010000000000000000FFFFFF1F2C02000000000001002500
      4F52C7414D454E544F204EB0205B7172794F7263616D656E746F732E22636F64
      69676F225D00000000FFFF0000000000020000000100000006090068656C7665
      74696361000C0000000200000000000A0000000000020000000000FFFFFF0000
      000002000000000000000000B92200000700666D7644617461000200A6020000
      140000003E0000000E00000043000000F4010000000000000000FFFFFF1F2C02
      0000000000010013005B4441544520234464642F6D6D2F797979795D00000000
      FFFF0000000000020000000100000006090068656C7665746963610008000000
      000000000000010000000100020000000000FFFFFF0000000002000000000000
      000000462300000900666D76506167696E61000200BA020000230000002A0000
      000F00000043000000F4010000000000000000FFFFFF1F2C0200000000000100
      07005B50414745235D00000000FFFF0000000000020000000100000000090068
      656C7665746963610008000000000000000000010000000100020000000000FF
      FFFF0000000002000000000000000000CD23000005004D656D6F310002008602
      000014000000200000000E0000004300000001000000000000000000FFFFFF1F
      2C02000000000001000500446174613A00000000FFFF00000000000200000001
      00000000090068656C7665746963610008000000000000000000010000000100
      020000000000FFFFFF00000000020000000000000000005624000005004D656D
      6F320002008602000023000000280000000E0000004300000001000000000000
      000000FFFFFF1F2C0200000000000100070050E167696E613A00000000FFFF00
      00000000020000000100000000090068656C7665746963610008000000000000
      000000010000000100020000000000FFFFFF0000000002000000000000000000
      ED24000006004D656D6F31380002006400000089010000200100001000000043
      00000001000000000000000000FFFFFF1F2C0200000000000100140044657363
      7269E7E36F20646F2070726F6475746F00000000FFFF00000000000200000001
      00000000090068656C766574696361000A000000020000000000080000000100
      020000000000FFFFFF00000000020000000000000000007425000006004D656D
      6F31390002008601000089010000190000001000000043000000010000000000
      00000000FFFFFF1F2C0200000000000100040046696C2E00000000FFFF000000
      0000020000000100000000090068656C766574696361000A0000000200000000
      000A0000000100020000000000FFFFFF0000000002000000000000000000FC25
      000006004D656D6F323100020026020000890100003C00000010000000430000
      0001000000000000000000FFFFFF1F2C02000000000001000500507265E76F00
      000000FFFF0000000000020000000100000000090068656C766574696361000A
      0000000200000000000A0000000100020000000000FFFFFF0000000002000000
      0000000000008426000006004D656D6F3232000200A402000089010000420000
      00100000004300000001000000000000000000FFFFFF1F2C0200000000000100
      0500546F74616C00000000FFFF0000000000020000000100000000090068656C
      766574696361000A0000000200000000000A0000000100020000000000FFFFFF
      00000000020000000000000000002E27000006004D656D6F3230000200240000
      00AC0100003E0000000E0000004300000001000000000000000000FFFFFF1F2C
      020000000000010027005B71727950726F6475746F734F7263616D656E746F73
      2E2270726F6475746F76697375616C225D00000000FFFF000000000002000000
      0100000000090068656C76657469636100080000000000000000000100000001
      00020000000000FFFFFF0000000002000000000000000000D627000006004D65
      6D6F323300020064000000AC010000200100000E000000430000000100000000
      0000000000FFFFFF1F2C020000000000010025005B71727950726F6475746F73
      4F7263616D656E746F732E2264657363726963616F6C63225D00000000FFFF00
      00000000020000000100000000090068656C7665746963610008000000000000
      000000000000000100020000000000FFFFFF0000000002000000000000000000
      7928000006004D656D6F323400020086010000AC0100001A0000000E00000043
      00000001000000000000000000FFFFFF1F2C020000000000010020005B717279
      50726F6475746F734F7263616D656E746F732E2266696C69616C225D00000000
      FFFF0000000000020000000100000000090068656C7665746963610008000000
      000000000000010000000100020000000000FFFFFF0000000002000000000000
      0000004329000006004D656D6F3235000200C0010000AC010000280000000E00
      00004300000001000000000000000000FFFFFF1F2C020000000000010047005B
      466F726D6174466C6F6174285B4D6173636172615175616E7469646164655D2C
      5B71727950726F6475746F734F7263616D656E746F732E227175616E74696461
      6465225D295D00000000FFFF0000000000020000000100000000090068656C76
      65746963610008000000000000000000010000000100020000000000FFFFFF00
      000000020000000000000000006F2A000006004D656D6F323600020028020000
      AC0100003C0000000E0000004300000001000000000000000000FFFFFF1F2C02
      0000000000010000000005000500626567696E0D320020206966205B71727950
      726F6475746F734F7263616D656E746F732E22707265636F76656E6461225D20
      3E2030207468656E0D5000202020202020204D656D6F3A3D20466F726D617446
      6C6F617428272323232C2323232C2323302E3030272C5B71727950726F647574
      6F734F7263616D656E746F732E22707265636F76656E6461225D290D11002020
      656C7365204D656D6F3A3D2027273B0D0300656E6400FFFF0000000000020000
      000100000000090068656C766574696361000800000000000000000001000000
      0100020000000000FFFFFF0000000002000000000000000000912B000006004D
      656D6F3237000200A4020000AC010000400000000E0000004300000001000000
      000000000000FFFFFF1F2C020000000000010000000005000500626567696E0D
      2D0020206966205B71727950726F6475746F734F7263616D656E746F732E2274
      6F74616C225D203E2030207468656E0D4B00202020202020204D656D6F3A3D20
      466F726D6174466C6F617428272323232C2323232C2323302E3030272C5B7172
      7950726F6475746F734F7263616D656E746F732E22746F74616C225D290D1100
      2020656C7365204D656D6F3A3D2027273B0D0300656E6400FFFF000000000002
      0000000100000000090068656C76657469636100080000000000000000000100
      00000100020000000000FFFFFF0000000002000000000000000000192C000006
      004D656D6F3238000200BF010000890100002800000010000000430000000100
      0000000000000000FFFFFF1F2C02000000000001000500517464652E00000000
      FFFF0000000000020000000100000000090068656C766574696361000A000000
      0200000000000A0000000100020000000000FFFFFF0000000002000000000000
      000000CD2C000006004D656D6F3339000200280000009C020000410000000E00
      00004300000001000000000000000000FFFFFF1F2C020000000000010031005B
      71727950617263656C6173506C616E6F734F7263616D656E746F732E22646174
      612220234464642F6D6D2F797979795D00000000FFFF00000000000200000001
      00000000090068656C7665746963610009000000000000000000120000000100
      020000000000FFFFFF0000000002000000000000000000FF2D000006004D656D
      6F3430000200670000009C020000520000000E00000043000000010000000000
      00000000FFFFFF1F2C020000000000010000000005000500626567696E0D3300
      20206966205B71727950617263656C6173506C616E6F734F7263616D656E746F
      732E2276616C6F72225D203E2030207468656E0D5100202020202020204D656D
      6F3A3D20466F726D6174466C6F617428272323232C2323232C2323302E303027
      2C5B71727950617263656C6173506C616E6F734F7263616D656E746F732E2276
      616C6F72225D290D15002020656C7365204D656D6F3A3D2027302E3030273B0D
      0300656E6400FFFF0000000000020000000100000000090068656C7665746963
      610009000000000000000000110000000100020000000000FFFFFF0000000002
      000000000000000000AB2E000006004D656D6F3431000200280000007A020000
      000100000E0000000300000001000000000000000000FFFFFF1F2C0200000000
      00010029005B71727950617263656C6173506C616E6F734F7263616D656E746F
      732E2264657363726963616F225D00000000FFFF000000000005000000010000
      0000090068656C766574696361000A0000000200000000000800000001000200
      00000000FFFFFF0000000002000000000000000000442F000006004D656D6F34
      32000200330100004D020000CC00000010000000430000000100000000000000
      0000FFFFFF1F2C02000000000001001600434F4E4449C7D54553204445205041
      47414D454E544F00000000FFFF0000000000020000000100000000090068656C
      766574696361000A000000020000000000020000000100020000000000FFFFFF
      0000000002000000000000000000E32F000006004D656D6F3433000200240000
      002E030000C3020000560000004B000F0001000000000000000000FFFFFF1F2C
      02000000000001001C005B7172794F7263616D656E746F732E226F6273657276
      6163616F225D00000000FFFF0000000000020000000100000004090068656C76
      65746963610009000000000000000000000000000100020000000000FFFFFF00
      000000020000000000000000007430000006004D656D6F343400020018020000
      3602000078000000100000004300000001000000000000000000FFFFFF1F2C02
      000000000001000E00546F74616C2070726F6475746F7300000000FFFF000000
      0000020000000100000000090068656C76657469636100090000000200000000
      00090000000100020000000000FFFFFF0000000002000000000000000000FC30
      000006004D656D6F343500020018020000470200007800000010000000430000
      0001000000000000000000FFFFFF1F2C02000000000001000500467265746500
      000000FFFF0000000000020000000100000000090068656C7665746963610009
      000000020000000000090000000100020000000000FFFFFF0000000002000000
      0000000000008531000006004D656D6F34360002001802000058020000780000
      00100000004300000001000000000000000000FFFFFF1F2C0200000000000100
      060053656775726F00000000FFFF000000000002000000010000000009006865
      6C7665746963610009000000020000000000090000000100020000000000FFFF
      FF00000000020000000000000000001B32000006004D656D6F34370002001402
      0000C50200007C000000100000004300000001000000000000000000FFFFFF1F
      2C02000000000001001300446573636F6E746F2046696E616E636569726F0000
      0000FFFF0000000000020000000100000000090068656C766574696361000900
      0000020000000000090000000100020000000000FFFFFF000000000200000000
      00000000004133000006004D656D6F3530000200920200003602000050000000
      100000000300000001000000000000000000FFFFFF1F2C020000000000010000
      000005000500626567696E0D2D0020206966205B7172794F7263616D656E746F
      732E22546F74616C50726F6475746F73225D203E2030207468656E0D4B002020
      20202020204D656D6F3A3D20466F726D6174466C6F617428272323232C232323
      2C2323302E3030272C5B7172794F7263616D656E746F732E22546F74616C5072
      6F6475746F73225D290D15002020656C7365204D656D6F3A3D2027302E303027
      3B0D0300656E6400FFFF0000000000020000000100000000090068656C766574
      6963610009000000020000000000090000000100020000000000FFFFFF000000
      00020000000000000000005634000006004D656D6F3531000200920200004702
      000050000000100000000300000001000000000000000000FFFFFF1F2C020000
      000000010000000005000500626567696E0D250020206966205B7172794F7263
      616D656E746F732E226672657465225D203E2030207468656E0D430020202020
      2020204D656D6F3A3D20466F726D6174466C6F617428272323232C2323232C23
      23302E3030272C5B7172794F7263616D656E746F732E226672657465225D290D
      14002020656C7365204D656D6F3A3D2027302E3030270D0300656E6400FFFF00
      00000000020000000100000000090068656C7665746963610009000000020000
      000000090000000100020000000000FFFFFF0000000002000000000000000000
      6E35000006004D656D6F35320002009202000058020000500000001000000003
      00000001000000000000000000FFFFFF1F2C0200000000000100000000050005
      00626567696E0D260020206966205B7172794F7263616D656E746F732E227365
      6775726F225D203E2030207468656E0D4400202020202020204D656D6F3A3D20
      466F726D6174466C6F617428272323232C2323232C2323302E3030272C5B7172
      794F7263616D656E746F732E2273656775726F225D290D15002020656C736520
      4D656D6F3A3D2027302E3030273B0D0300656E6400FFFF000000000002000000
      0100000000090068656C76657469636100090000000200000000000900000001
      00020000000000FFFFFF0000000002000000000000000000F835000006004D65
      6D6F343900020014020000E70200007C00000010000000430000000100000000
      0000000000FFFFFF1F2C0200000000000100070041207072617A6F00000000FF
      FF0000000000020000000100000000090068656C766574696361000900000002
      0000000000110000000100020000000000FFFFFF000000000200000000000000
      00005237000006004D656D6F353300020092020000E702000050000000100000
      000300000001000000000000000000FFFFFF1F2C020000000000010000000005
      000500626567696E0D470020206966205B53554D285B71727950617263656C61
      73506C616E6F734F7263616D656E746F732E2276616C6F72225D2C204461646F
      73506C616E6F73295D203E2030207468656E0D6500202020202020204D656D6F
      3A3D20466F726D6174466C6F617428272323232C2323232C2323302E3030272C
      5B53554D285B71727950617263656C6173506C616E6F734F7263616D656E746F
      732E2276616C6F72225D2C204461646F73506C616E6F73295D290D1500202065
      6C7365204D656D6F3A3D2027302E3030273B0D0300656E6400FFFF0000000000
      020000000100000000090068656C766574696361000900000002000000000011
      0000000100020000000000FFFFFF00000000020000000000000000008A380000
      06004D656D6F353400020092020000C502000050000000100000000300000001
      000000000000000000FFFFFF1F2C020000000000010000000005000500626567
      696E0D360020206966205B71727950617263656C6173506C616E6F734F726361
      6D656E746F732E22646573636F6E746F225D203E2030207468656E0D54002020
      20202020204D656D6F3A3D20466F726D6174466C6F617428272323232C232323
      2C2323302E3030272C5B71727950617263656C6173506C616E6F734F7263616D
      656E746F732E22646573636F6E746F225D290D15002020656C7365204D656D6F
      3A3D2027302E3030273B0D0300656E6400FFFF00000000000200000001000000
      00090068656C7665746963610009000000020000000000110000000100020000
      000000FFFFFF00000000020000000000000000001739000006004D656D6F3438
      000200260000001C0300004C0000001000000043000000010000000000000000
      00FFFFFF1F2C02000000000001000A004F627365727661E7E36F00000000FFFF
      0000000000020000000100000000090068656C76657469636100090000000000
      00000000000000000100020000000000FFFFFF00000000020000000000000000
      00B139000005004D656D6F340002005C00000086000000380100001000000043
      00000001000000000000000000FFFFFF1F2C020000000000010018005B5B7172
      794F7263616D656E746F732E226E6F6D65225D5D00000000FFFF000000000002
      0000000100000000090068656C76657469636100090000000000000000000000
      00000100020000000000FFFFFF00000000020000000000000000003B3A000005
      004D656D6F330002002500000086000000360000001000000043000000010000
      00000000000000FFFFFF1F2C02000000000001000800436C69656E74653A0000
      0000FFFF0000000000020000000100000000090068656C766574696361000900
      0000000000000000010000000100020000000000FFFFFF000000000200000000
      0000000000323B000005004D656D6F3600020098010000860000003C00000010
      0000000000000001000000000000000000FFFFFF1F2C02000000000001000000
      0005000500626567696E0D270020206966205B7172794F7263616D656E746F73
      2E22636C69656E7465225D203E2030207468656E0D2700202020202020204D65
      6D6F3A3D205B7172794F7263616D656E746F732E22636C69656E7465225D0D11
      002020656C7365204D656D6F3A3D2027273B0D0300656E6400FFFF0000000000
      020000000100000000090068656C766574696361000900000000000000000000
      0000000100020000000000FFFFFF0000000002000000000000000000BB3B0000
      05004D656D6F3800020025000000DC0000003600000010000000430000000100
      0000000000000000FFFFFF1F2C02000000000001000700466F6E6520313A0000
      0000FFFF0000000000020000000100000000090068656C766574696361000900
      0000000000000000010000000100020000000000FFFFFF000000000200000000
      0000000000533C000005004D656D6F390002005C000000DC000000A500000010
      0000004300000001000000000000000000FFFFFF1F2C02000000000001001600
      5B7172794F7263616D656E746F732E22666F6E65225D00000000FFFF00000000
      00020000000100000000090068656C7665746963610009000000000000000000
      000000000100020000000000FFFFFF0000000002000000000000000000DD3C00
      0006004D656D6F31300002003C010000DC0000002F0000001000000043000000
      01000000000000000000FFFFFF1F2C02000000000001000700466F6E6520323A
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      09000000000000000000000000000100020000000000FFFFFF00000000020000
      00000000000000773D000006004D656D6F31310002006C010000DC000000A500
      0000100000004300000001000000000000000000FFFFFF1F2C02000000000001
      0017005B7172794F7263616D656E746F732E22666F6E6532225D00000000FFFF
      0000000000020000000100000000090068656C76657469636100090000000000
      00000000000000000100020000000000FFFFFF00000000020000000000000000
      00023E000006004D656D6F313200020025000000740000003600000010000000
      4300000001000000000000000000FFFFFF1F2C02000000000001000800456D69
      7373E36F3A00000000FFFF0000000000020000000100000000090068656C7665
      746963610009000000000000000000020000000100020000000000FFFFFF0000
      000002000000000000000000B13E000006004D656D6F31330002005C00000074
      00000069000000100000004300000001000000000000000000FFFFFF1F2C0200
      0000000001002C005B7172794F7263616D656E746F732E22656D697373616F22
      20234464642F4D4D2F797979792068683A6D6D5D00000000FFFF000000000002
      0000000100000000090068656C76657469636100090000000000000000000000
      00000100020000000000FFFFFF00000000020000000000000000003D3F000006
      004D656D6F3134000200EC000000740000004C00000010000000430000000100
      0000000000000000FFFFFF1F2C0200000000000100090056616C69646164653A
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      09000000020000000000010000000100020000000000FFFFFF00000000020000
      00000000000000E73F000006004D656D6F313500020038010000740000006100
      0000100000004300000001000000000000000000FFFFFF1F2C02000000000001
      0027005B7172794F7263616D656E746F732E2276616C69646164652220234464
      642F6D6D2F797979795D00000000FFFF00000000000200000001000000000900
      68656C7665746963610009000000020000000000000000000100020000000000
      FFFFFF00000000020000000000000000006E40000006004D656D6F3239000200
      25000000A800000036000000100000004300000001000000000000000000FFFF
      FF1F2C020000000000010004005275613A00000000FFFF000000000002000000
      0100000000090068656C76657469636100090000000000000000000100000001
      00020000000000FFFFFF00000000020000000000000000005B42000006004D65
      6D6F33300002005C000000A80000008802000010000000420000000100000000
      0000000000FFFFFF1F2C02000000000000000008000500626567696E0D530020
      2069662028285B7172794F7263616D656E746F732E226E756D65726F225D203E
      20302920616E6420285B7172794F7263616D656E746F732E22636F6D706C656D
      656E746F225D3C3E27272929207468656E200D6500202020204D656D6F3A3D5B
      7172794F7263616D656E746F732E22727561225D2B272C272B5B737472287172
      794F7263616D656E746F732E226E756D65726F22295D2B27202D20272B5B7172
      794F7263616D656E746F732E22636F6D706C656D656E746F225D0D2E00202065
      6C736520696620285B7172794F7263616D656E746F732E226E756D65726F225D
      203E203029207468656E200D4100202020204D656D6F3A3D5B7172794F726361
      6D656E746F732E22727561225D2B272C272B5B737472287172794F7263616D65
      6E746F732E226E756D65726F22295D0D07002020656C7365200D1F0020202020
      4D656D6F3A3D5B7172794F7263616D656E746F732E22727561225D0D0300656E
      6400FFFF0000000000020000000100000000090068656C766574696361000900
      0000000000000000000000000100020000000000FFFFFF000000000200000000
      0000000000E542000006004D656D6F333100020025000000BA00000036000000
      100000004300000001000000000000000000FFFFFF1F2C020000000000010007
      0042616972726F3A00000000FFFF000000000002000000010000000009006865
      6C7665746963610009000000000000000000010000000100020000000000FFFF
      FF00000000020000000000000000008443000006004D656D6F33320002005C00
      0000BA000000D8000000100000004300000001000000000000000000FFFFFF1F
      2C02000000000001001C005B7172794F7263616D656E746F732E226E6F6D6562
      616972726F225D00000000FFFF0000000000020000000100000000090068656C
      7665746963610009000000000000000000000000000100020000000000FFFFFF
      00000000020000000000000000000E44000006004D656D6F3333000200250000
      00CB00000036000000100000004300000001000000000000000000FFFFFF1F2C
      020000000000010007004369646164653A00000000FFFF000000000002000000
      0100000000090068656C76657469636100090000000000000000000100000001
      00020000000000FFFFFF0000000002000000000000000000AD44000006004D65
      6D6F33340002005C000000CB000000D800000010000000430000000100000000
      0000000000FFFFFF1F2C02000000000001001C005B7172794F7263616D656E74
      6F732E226E6F6D65636964616465225D00000000FFFF00000000000200000001
      00000000090068656C7665746963610009000000000000000000000000000100
      020000000000FFFFFF00000000020000000000000000003345000006004D656D
      6F33350002003C010000CB000000180000001000000043000000010000000000
      00000000FFFFFF1F2C0200000000000100030055463A00000000FFFF00000000
      00020000000100000000090068656C7665746963610009000000000000000000
      000000000100020000000000FFFFFF0000000002000000000000000000CE4500
      0006004D656D6F333600020055010000CB0000001C0000001000000043000000
      01000000000000000000FFFFFF1F2C020000000000010018005B7172794F7263
      616D656E746F732E2265737461646F225D00000000FFFF000000000002000000
      0100000000090068656C76657469636100090000000000000000000000000001
      00020000000000FFFFFF00000000020000000000000000005546000006004D65
      6D6F333700020074010000CB0000002000000010000000430000000100000000
      0000000000FFFFFF1F2C020000000000010004004345503A00000000FFFF0000
      000000020000000100000000090068656C766574696361000900000000000000
      0000010000000100020000000000FFFFFF000000000200000000000000000045
      47000006004D656D6F333800020094010000CB00000040000000100000004300
      000001000000000000000000FFFFFF1F2C020000000000010000000005000500
      626567696E0D230020206966205B7172794F7263616D656E746F732E22636570
      225D203E2030207468656E0D2300202020202020204D656D6F3A3D205B717279
      4F7263616D656E746F732E22636570225D0D11002020656C7365204D656D6F3A
      3D2027273B0D0300656E6400FFFF000000000002000000010000000009006865
      6C7665746963610009000000000000000000000000000100020000000000FFFF
      FF00000000020000000000000004009447000005004C696E6531000200240000
      0072000000C2020000000000000100080001000000000000000000FFFFFF1F2C
      020000000000000000000000FFFF00000000000200000001000000000400E347
      000005004C696E65320002002400000072000000000000007C00000001000400
      01000000000000000000FFFFFF1F2C020000000000000000000000FFFF000000
      000002000000010000000004003248000005004C696E6533000200250000009B
      010000C1020000000000000100080001000000000000000000FFFFFF1F2C0200
      00000000000000000000FFFF0000000000020000000100000000040081480000
      05004C696E6534000200E602000071000000000000007C000000010004000100
      0000000000000000FFFFFF1F2C020000000000000000000000FFFF0000000000
      0200000001000000000400D148000006004C696E653133000200260000002002
      0000C0020000000000000100080001000000000000000000FFFFFF1F2C020000
      000000000000000000FFFF000000000002000000010000000604002149000006
      004C696E653134000200E6020000220200000000000048000000010004000100
      0000000000000000FFFFFF1F2C020000000000000000000000FFFF0000000000
      02000000010000000004007149000006004C696E6531350002000B0200002202
      000000000000490000000100040001000000000000000000FFFFFF1F2C020000
      000000000000000000FFFF00000000000200000001000000000400C149000006
      004C696E6531360002000B0200006C020000DB00000000000000010008000100
      0000000000000000FFFFFF1F2C020000000000000000000000FFFF0000000000
      0200000001000000000400114A000006004C696E65313700020024000000FB00
      0000C2020000000000000100080001000000000000000000FFFFFF1F2C020000
      000000000000000000FFFF000000000002000000010000000000009A4A000006
      004D656D6F313700020024000000890100003D00000010000000430000000100
      0000000000000000FFFFFF1F2C0200000000000100060043F36469676F000000
      00FFFF0000000000020000000100000000090068656C766574696361000A0000
      000200000000000A0000000100020000000000FFFFFF00000000020000000000
      00000400EA4A000006004C696E653330000200E60200009C020000000000000E
      0000000100040001000000000000000000FFFFFF1F2C02000000000000000000
      0000FFFF000000000002000000010000000004003A4B000006004C696E653236
      00020024000000C0020000000000003C00000001000400010000000000000000
      00FFFFFF1F2C020000000000000000000000FFFF000000000002000000010000
      000004008A4B000006004C696E65323700020024000000FC020000C002000000
      0000000100080001000000000000000000FFFFFF1F2C02000000000000000000
      0000FFFF00000000000200000001000000000400DA4B000006004C696E653238
      000200E6020000C0020000000000003C00000001000400010000000000000000
      00FFFFFF1F2C020000000000000000000000FFFF000000000002000000010000
      00000000634C000005004D656D6F3500020014020000D60200007C0000001000
      00004300000001000000000000000000FFFFFF1F2C0200000000000100070041
      20766973746100000000FFFF0000000000020000000100000000090068656C76
      65746963610009000000020000000000110000000100020000000000FFFFFF00
      000000020000000000000000009E4D000005004D656D6F3700020092020000D6
      02000050000000100000000300000001000000000000000000FFFFFF1F2C0200
      00000000010000000005000500626567696E0D380020206966205B7172795061
      7263656C6173506C616E6F734F7263616D656E746F732E2276616C6F72766973
      7461225D203E2030207468656E0D5600202020202020204D656D6F3A3D20466F
      726D6174466C6F617428272323232C2323232C2323302E3030272C5B71727950
      617263656C6173506C616E6F734F7263616D656E746F732E2276616C6F727669
      737461225D290D15002020656C7365204D656D6F3A3D2027302E3030273B0D03
      00656E6400FFFF0000000000020000000100000000090068656C766574696361
      0009000000020000000000110000000100020000000000FFFFFF000000000200
      0000000000000400EE4D000006004C696E653235000200240000009C02000000
      0000000E0000000100040001000000000000000000FFFFFF1F2C020000000000
      000000000000FFFF000000000002000000010000000000009B4E000006004D65
      6D6F31360002009C0100003F0000004901000010000000430000000100000000
      0000000000FFFFFF1F2C02000000000001002A0056656E6465646F72203A2020
      5B7172794F7263616D656E746F732E226E6F6D6576656E6465646F72225D0000
      0000FFFF0000000000020000000100000000090068656C766574696361000900
      0000020000000000010000000100020000000000FFFFFF000000000200000000
      0000000000474F000006004D656D6F3535000200840000004001000088010000
      0E0000004300000001000000000000000000FFFFFF1F2C020000000000010029
      005B7172795365727669636F734F7263616D656E746F2E226465736372696361
      6F7365727669636F225D00000000FFFF00000000000200000001000000000900
      68656C7665746963610008000000000000000000000000000100020000000000
      FFFFFF0000000002000000000000000000EA4F000006004D656D6F3536000200
      24000000400100005C0000000E0000004300000001000000000000000000FFFF
      FF1F2C020000000000010020005B7172795365727669636F734F7263616D656E
      746F2E227365727669636F225D00000000FFFF00000000000200000001000000
      00090068656C7665746963610008000000000000000000110000000100020000
      000000FFFFFF00000000020000000000000000009050000006004D656D6F3537
      0002001402000040010000280000000E00000043000000010000000000000000
      00FFFFFF1F2C020000000000010023005B7172795365727669636F734F726361
      6D656E746F2E227175616E746964616465225D00000000FFFF00000000000200
      00000100000000090068656C7665746963610008000000000000000000010000
      000100020000000000FFFFFF0000000002000000000000000000BE5100000600
      4D656D6F35380002004002000040010000540000000E00000003000000010000
      00000000000000FFFFFF1F2C02000000000000000005000500626567696E0D33
      0020206966205B7172795365727669636F734F7263616D656E746F2E2276616C
      6F727365727669636F225D203E2030207468656E0D5100202020202020204D65
      6D6F3A3D20466F726D6174466C6F617428272323232C2323232C2323302E3030
      272C5B7172795365727669636F734F7263616D656E746F2E2276616C6F727365
      727669636F225D290D13002020656C7365204D656D6F3A3D2027273B20200D03
      00656E6400FFFF0000000000020000000100000000090068656C766574696361
      0008000000000000000000010000000100020000000000FFFFFF000000000200
      00000000000000000F53000006004D656D6F3539000200940200004001000050
      0000000E0000004300000001000000000000000000FFFFFF1F2C020000000000
      010000000005000500626567696E0D320020206966205B717279536572766963
      6F734F7263616D656E746F2E2276616C6F727365727669636F225D3E20302074
      68656E0D7500202020202020204D656D6F3A3D20466F726D6174466C6F617428
      272323232C2323232C2323302E3030272C5B7172795365727669636F734F7263
      616D656E746F2E227175616E746964616465225D2A5B7172795365727669636F
      734F7263616D656E746F2E2276616C6F727365727669636F225D290D11002020
      656C7365204D656D6F3A3D2027273B0D0300656E6400FFFF0000000000020000
      000100000000090068656C766574696361000800000000000000000011000000
      0100020000000000FFFFFF0000000002000000000000000000A653000006004D
      656D6F36300002008000000014010000F4000000100000004300000001000000
      000000000000FFFFFF1F2C02000000000001001400446573637269E7E36F2064
      6F207365727669E76F00000000FFFF0000000000020000000100000000090068
      656C766574696361000A000000020000000000080000000100020000000000FF
      FFFF00000000020000000000000000002E54000006004D656D6F36310002003E
      0200001401000050000000100000004300000001000000000000000000FFFFFF
      1F2C02000000000001000500507265E76F00000000FFFF000000000002000000
      0100000000090068656C766574696361000A0000000200000000000A00000001
      00020000000000FFFFFF0000000002000000000000000000B654000006004D65
      6D6F363200020094020000140100004E00000010000000430000000100000000
      0000000000FFFFFF1F2C02000000000001000500546F74616C00000000FFFF00
      00000000020000000100000000090068656C766574696361000A000000020000
      0000000A0000000100020000000000FFFFFF0000000002000000000000000000
      3E55000006004D656D6F36330002001302000014010000280000001000000043
      00000001000000000000000000FFFFFF1F2C0200000000000100050051746465
      2E00000000FFFF0000000000020000000100000000090068656C766574696361
      000A000000020000000000090000000100020000000000FFFFFF000000000200
      0000000000000000C755000006004D656D6F363400020024000000140100003D
      000000100000004300000001000000000000000000FFFFFF1F2C020000000000
      0100060043F36469676F00000000FFFF00000000000200000001000000000900
      68656C766574696361000A0000000200000000000A0000000100020000000000
      FFFFFF00000000020000000000000004001756000006004C696E653239000200
      2400000028010000C3020000000000000100080064000000000000000000FFFF
      FF1F2C020000000000000000000000FFFF000000000002000000010000000400
      00A256000006004D656D6F36350002001C01000074010000CC00000010000000
      4300000001000000000000000000FFFFFF1F2C0200000000000100080050524F
      4455544F5300000000FFFF0000000000020000000100000000090068656C7665
      74696361000A000000020000000000020000000100020000000000FFFFFF0000
      0000020000000000000000002D57000006004D656D6F36360002001C01000000
      010000CC000000100000004300000001000000000000000000FFFFFF1F2C0200
      00000000010008005345525649C74F5300000000FFFF00000000000200000001
      00000000090068656C766574696361000A000000020000000000020000000100
      020000000000FFFFFF0000000002000000000000000000BE57000006004D656D
      6F36370002002E02000054010000600000001000000043000000010000000000
      00000000FFFFFF1F2C02000000000001000E00546F74616C207365727669E76F
      7300000000FFFF0000000000020000000100000000090068656C766574696361
      0009000000020000000000090000000100020000000000FFFFFF000000000200
      0000000000000000E458000006004D656D6F3638000200940200005401000050
      000000100000000300000001000000000000000000FFFFFF1F2C020000000000
      010000000005000500626567696E0D2D0020206966205B7172794F7263616D65
      6E746F732E22546F74616C5365727669636F73225D203E2030207468656E0D4B
      00202020202020204D656D6F3A3D20466F726D6174466C6F617428272323232C
      2323232C2323302E3030272C5B7172794F7263616D656E746F732E22546F7461
      6C5365727669636F73225D290D15002020656C7365204D656D6F3A3D2027302E
      3030273B0D0300656E6400FFFF0000000000020000000100000000090068656C
      7665746963610009000000020000000000090000000100020000000000FFFFFF
      00000000020000000000000004003359000005004C696E653500020024000000
      50010000C3020000000000000100080001000000000000000000FFFFFF1F2C02
      0000000000000000000000FFFF00000000000200000001000000000000BE5900
      0006004D656D6F3639000200E7010000890100003C0000001000000043000000
      01000000000000000000FFFFFF1F2C02000000000001000800507265766973E3
      6F00000000FFFF0000000000020000000100000000090068656C766574696361
      000A0000000200000000000A0000000100020000000000FFFFFF000000000200
      0000000000000000E65A000006004D656D6F3730000200EB010000AC01000039
      0000000E0000004300000001000000000000000000FFFFFF1F2C020000000000
      010000000006000500626567696E0D300020206966205B71727950726F647574
      6F734F7263616D656E746F732E22707265766973616F225D3C3E203020746865
      6E0D4A00202020206D656D6F3A3D5B464F524D41544441544554494D45282764
      642F6D6D2F7979272C205B71727950726F6475746F734F7263616D656E746F73
      2E22707265766973616F225D295D0D06002020656C73650D0C00202020206D65
      6D6F3A3D27270D0300656E6400FFFF0000000000020000000100000000090068
      656C7665746963610009000000000000000000000000000100020000000000FF
      FFFF0000000002000000000000000000725B000006004D656D6F373100020034
      020000740000004C000000100000004300000001000000000000000000FFFFFF
      1F2C02000000000001000900436F6E747261746F3A00000000FFFF0000000000
      020000000100000000090068656C766574696361000900000002000000000001
      0000000100020000000000FFFFFF00000000020000000000000000000F5C0000
      06004D656D6F373200020084020000740000005D000000100000004300000001
      000000000000000000FFFFFF1F0000000000000001001A005B7172794F726361
      6D656E746F732E22636F6E747261746F225D00000000FFFF0000000000020000
      000100000000090068656C766574696361000900000002000000000000000000
      0100020000000000FFFFFF0000000002000000000000000000965C000006004D
      656D6F3733000200A20100008901000019000000100000004300000001000000
      000000000000FFFFFF1F2C020000000000010004005369742E00000000FFFF00
      00000000020000000100000000090068656C766574696361000A000000020000
      0000000A0000000100020000000000FFFFFF0000000002000000000000000000
      435D000006004D656D6F3734000200A4010000AC010000180000000E00000043
      00000001000000000000000000FFFFFF1F2C02000000000001002A005B717279
      50726F6475746F734F7263616D656E746F732E22736974756163616F5F70726F
      6475746F225D00000000FFFF0000000000020000000100000000090068656C76
      65746963610008000000000000000000010000000100020000000000FFFFFF00
      00000002000000000000000000E85D000006004D656D6F373500020024000000
      F8010000C20200001E00000047000F0064000000000000000000FFFFFF1F2C02
      0000000000010026005B71727950726F6475746F734F7263616D656E746F732E
      22636F6D706C656D656E746F225D2000000000FFFF0000000000020000000100
      0000060500417269616C00070000000000000000000000000001000200000000
      00FFFFFF0000000002000000000000000000D05E000006004D656D6F37370002
      009C00000014000000B6000000360000004B00000001000000000000000000FF
      FFFF1F2C0200000000000A0011005B52617A616F46696C69616C426173655D0D
      1600434E504A3A205B434E504A46696C69616C426173655D0D0A005275613A20
      5B5275615D0D09005B42616972726F5D200D08005B4369646164655D0D0C0046
      6F6E653A205B466F6E655D0D00000D00000D00000D000000000000FFFF000000
      00000200000001000000000500417269616C0005000000000000000000000000
      000100020000000000FFFFFF00000000020000000000000000005C5F00000600
      4D656D6F37380002002500000097000000380000001000000043000000F40100
      00000000000000FFFFFF1F2C020000000000010009004350462F434E504A3A00
      000000FFFF0000000000020000000100000000090068656C7665746963610008
      000000000000000000020000000100020000000000FFFFFF0000000002000000
      0000000000002361000006004D656D6F37390002005C000000970000007A0100
      001000000043000000F4010000000000000000FFFFFF1F2C0200000000000000
      000A000500626567696E0D350020206966205B7172794F7263616D656E746F73
      2E22706573736F616E756D65726F22205D203C3E202727207468656E20626567
      696E0D3000202020206966205B7172794F7263616D656E746F732E2270657373
      6F617469706F22205D203D20274627207468656E200D4A002020202020204D65
      6D6F3A3D205B464F524D41545445585428272323232E2323232E2323232D2323
      272C5B7172794F7263616D656E746F732E22706573736F616E756D65726F225D
      295D0D090020202020656C7365200D4E002020202020204D656D6F3A3D205B46
      4F524D415454455854282723232E2323232E2323232F232323232D2323272C5B
      7172794F7263616D656E746F732E22706573736F616E756D65726F225D295D0D
      07002020656E6420200D06002020656C73650D0E00202020204D656D6F3A3D20
      27273B0D0300656E6400FFFF0000000000020000000100000000090068656C76
      65746963610008000000000000000000100000000100020000000000FFFFFF00
      00000002000000000000000000AE61000006004D656D6F383000020064020000
      890100003C000000100000004300000001000000000000000000FFFFFF1F2C02
      000000000001000800446573636F6E746F00000000FFFF000000000002000000
      0100000000090068656C766574696361000A0000000200000000000A00000001
      00020000000000FFFFFF0000000002000000000000000000D662000006004D65
      6D6F383100020064020000AC010000400000000E000000430000000100000000
      0000000000FFFFFF1F2C020000000000010000000005000500626567696E0D30
      0020206966205B71727950726F6475746F734F7263616D656E746F732E226465
      73636F6E746F225D203E2030207468656E0D4E00202020202020204D656D6F3A
      3D20466F726D6174466C6F617428272323232C2323232C2323302E3030272C5B
      71727950726F6475746F734F7263616D656E746F732E22646573636F6E746F22
      5D290D11002020656C7365204D656D6F3A3D2027273B0D0300656E6400FFFF00
      00000000020000000100000000090068656C7665746963610008000000000000
      000000010000000100020000000000FFFFFF0000000002000000000000000000
      6A63000006004D656D6F38320002001802000025020000780000001000000043
      00000001000000000000000000FFFFFF1F2C0200000000000100110044657363
      6F6E746F2070726F6475746F7300000000FFFF00000000000200000001000000
      00090068656C7665746963610009000000020000000000090000000100020000
      000000FFFFFF0000000002000000000000000000A064000006004D656D6F3833
      0002009202000025020000500000001000000003000000010000000000000000
      00FFFFFF1F2C020000000000010000000005000500626567696E0D3500202069
      66205B7172794F7263616D656E746F732E22746F74616C646573636F6E746F70
      726F6475746F73225D203E2030207468656E0D5300202020202020204D656D6F
      3A3D20466F726D6174466C6F617428272323232C2323232C2323302E3030272C
      5B7172794F7263616D656E746F732E22746F74616C646573636F6E746F70726F
      6475746F73225D290D15002020656C7365204D656D6F3A3D2027302E3030273B
      0D0300656E6400FFFF0000000000020000000100000000090068656C76657469
      63610009000000020000000000090000000100020000000000FFFFFF00000000
      02000000000000000400EF64000005004C696E65360002002400000070010000
      C2020000000000000100080001000000000000000000FFFFFF1F2C0200000000
      00000000000000FFFF0000000000020000000100000000FEFEFF080000000700
      20546F7461697300000000030052756100000000060043696461646500000000
      0400466F6E65000000000600546974756C6F00000000060042616972726F0000
      0000080020496D6167656E73000000001100696D6750726F6475637450696374
      757265000000000000000000000000FC00000000000000000000000000000000
      5800ADC171050F53E440F73F4A484E60E640}
  end
end
