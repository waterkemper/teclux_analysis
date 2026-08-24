inherited dtmGeracaoRequisicoesMontagens: TdtmGeracaoRequisicoesMontagens
  Left = 228
  Top = 202
  Height = 708
  Width = 1024
  object qryFilialMontagem: TtecQuery
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
      '            nome'
      'From    filiais'
      'Where codigo=:codigo')
    RequestLive = True
    Left = 60
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryFilialMontagemcodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryFilialMontagemnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
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
    Left = 359
    Top = 16
    object qryConsultaFiliaisnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaFiliaiscodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object qryGrupoFiliaisVenda: TtecQuery
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
      'Select codigo, '
      '           descricao'
      'From   gruposfiliais'
      'Where codigo=:codigo')
    RequestLive = True
    Left = 60
    Top = 159
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryGrupoFiliaisVendacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryGrupoFiliaisVendadescricao: TStringField
      FieldName = 'descricao'
      Size = 30
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
      'Select descricao,'
      '           codigo'
      'From   gruposfiliais'
      'Order By UPPER(TO_ASCII(descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 359
    Top = 111
    object qryConsultaGrupoFiliaisdescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
    object qryConsultaGrupoFiliaiscodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object dsrFilialMontagem: TtecDataSource
    DataSet = qryFilialMontagem
    Left = 211
    Top = 16
  end
  object dsrGrupoFiliaisVenda: TtecDataSource
    DataSet = qryGrupoFiliaisVenda
    Left = 211
    Top = 159
  end
  object qryFilialVenda: TtecQuery
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
      '            nome'
      'From    filiais'
      'Where codigo=:codigo')
    RequestLive = True
    Left = 60
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryFilialVendacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryFilialVendanome: TStringField
      FieldName = 'nome'
      Size = 40
    end
  end
  object dsrFilialVenda: TtecDataSource
    DataSet = qryFilialVenda
    Left = 211
    Top = 64
  end
  object qryCliente: TtecQuery
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
      'Select vf.Codigo,'
      '          vf.tipo,'
      '          coalesce(vf.razao,vf.nome) as nome         '
      'From   vfornecedores vf'
      'where (vf.codigo = :codigo)  and'
      '          (vf.tipo     = :tipocliente) '
      'Order By Codigo, tipo')
    RequestLive = False
    Left = 58
    Top = 204
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'tipocliente'
        ParamType = ptUnknown
      end>
    object qryClientecodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryClientenome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object qryClientetipo: TStringField
      FieldName = 'tipo'
      Size = 50
    end
  end
  object dsrCliente: TtecDataSource
    DataSet = qryCliente
    Left = 215
    Top = 205
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
      'Select Nome,'
      '       pessoanumero,'
      '       Codigo,'
      '       tipo,'
      '       cast(case when tipo = '#39'F'#39' then '#39'Fornecedor'#39
      '                       when tipo = '#39'C'#39' then '#39'Cliente'#39
      '               end as varchar) as tipoorig'
      'From   vfornecedores'
      ''
      '/* editado em run time */'
      'Order By UPPER(TO_ASCII(nome,'#39'LATIN1'#39'))'
      '')
    RequestLive = False
    Left = 356
    Top = 203
    object qryConsultaClientesnome: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaClientespessoanumero: TStringField
      DisplayLabel = 'CPF/CGC'
      FieldName = 'pessoanumero'
      Size = 14
    end
    object qryConsultaClientescodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryConsultaClientestipo: TStringField
      DisplayLabel = 'Tipo Cliente'
      FieldName = 'tipo'
      Visible = False
      Size = 10
    end
    object qryConsultaClientestipoorig: TStringField
      FieldName = 'tipoorig'
      Visible = False
      Size = 1
    end
  end
  object qryItensRequisicoes: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryItensRequisicoesAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      '')
    RequestLive = True
    Left = 56
    Top = 304
    object qryItensRequisicoescontrato: TStringField
      FieldName = 'contrato'
    end
    object qryItensRequisicoesdadofiscal: TIntegerField
      FieldName = 'dadofiscal'
      DisplayFormat = '0'
    end
    object qryItensRequisicoesfilialemissao: TIntegerField
      FieldName = 'filialemissao'
      DisplayFormat = '0'
    end
    object qryItensRequisicoesnomefilialemissao: TStringField
      FieldName = 'nomefilialemissao'
      Size = 40
    end
    object qryItensRequisicoesemissaodadofiscal: TDateField
      Alignment = taCenter
      FieldName = 'emissaodadofiscal'
      EditMask = '99/99/9999;1; '
    end
    object qryItensRequisicoesserie: TStringField
      FieldName = 'serie'
      Size = 3
    end
    object qryItensRequisicoesnotafiscal: TIntegerField
      FieldName = 'notafiscal'
      DisplayFormat = '0'
    end
    object qryItensRequisicoesmaquina: TIntegerField
      FieldName = 'maquina'
      DisplayFormat = '0'
    end
    object qryItensRequisicoesintervensao: TIntegerField
      FieldName = 'intervensao'
      DisplayFormat = '0'
    end
    object qryItensRequisicoescupomfiscal: TIntegerField
      FieldName = 'cupomfiscal'
      DisplayFormat = '0'
    end
    object qryItensRequisicoesvendedor: TIntegerField
      FieldName = 'vendedor'
      DisplayFormat = '0'
    end
    object qryItensRequisicoesmontagemfilial: TIntegerField
      FieldName = 'montagemfilial'
      DisplayFormat = '0'
    end
    object qryItensRequisicoesmontagemobs: TStringField
      DisplayWidth = 250
      FieldName = 'montagemobs'
      Size = 250
    end
    object qryItensRequisicoesemissaocontrato: TDateField
      Alignment = taCenter
      FieldName = 'emissaocontrato'
      EditMask = '99/99/9999;1; '
    end
    object qryItensRequisicoesnomefilialvenda: TStringField
      FieldName = 'nomefilialvenda'
      Size = 40
    end
    object qryItensRequisicoesproduto: TLargeintField
      FieldName = 'produto'
      DisplayFormat = '0'
    end
    object qryItensRequisicoesfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryItensRequisicoesdescricaoproduto: TStringField
      FieldName = 'descricaoproduto'
      Size = 40
    end
    object qryItensRequisicoesquantidade: TFloatField
      FieldName = 'quantidade'
      DisplayFormat = '0'
    end
    object qryItensRequisicoescliente: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object qryItensRequisicoestipocliente: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
    object qryItensRequisicoesentrua: TStringField
      DisplayWidth = 100
      FieldName = 'entrua'
      Size = 100
    end
    object qryItensRequisicoesentcidade: TIntegerField
      FieldName = 'entcidade'
      DisplayFormat = '0'
    end
    object qryItensRequisicoescidade: TStringField
      FieldName = 'cidade'
      Size = 13
    end
    object qryItensRequisicoesentestado: TStringField
      FieldName = 'entestado'
      Size = 2
    end
    object qryItensRequisicoesentbairro: TIntegerField
      FieldName = 'entbairro'
      DisplayFormat = '0'
    end
    object qryItensRequisicoesbairro: TStringField
      FieldName = 'bairro'
      Size = 16
    end
    object qryItensRequisicoesentcep: TIntegerField
      FieldName = 'entcep'
      DisplayFormat = '0'
    end
    object qryItensRequisicoesentfoneddd: TIntegerField
      FieldName = 'entfoneddd'
      DisplayFormat = '0'
    end
    object qryItensRequisicoesentfonenumero: TIntegerField
      FieldName = 'entfonenumero'
      DisplayFormat = '0'
    end
    object qryItensRequisicoesentfoneramal: TStringField
      FieldName = 'entfoneramal'
      Size = 10
    end
    object qryItensRequisicoesmarcar: TBooleanField
      FieldName = 'marcar'
    end
    object qryItensRequisicoesvalor: TFloatField
      FieldName = 'valor'
    end
    object qryItensRequisicoeslinha: TStringField
      FieldName = 'linha'
      Size = 50
    end
    object qryItensRequisicoescoluna: TStringField
      FieldName = 'coluna'
      Size = 50
    end
    object qryItensRequisicoesvalorgrade1: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade1'
      Size = 30
    end
    object qryItensRequisicoesvalorgrade2: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade2'
      Size = 30
    end
    object qryItensRequisicoesentnumero: TIntegerField
      FieldName = 'entnumero'
    end
    object qryItensRequisicoesentcomplemento: TStringField
      FieldName = 'entcomplemento'
      Size = 100
    end
  end
  object dsrItensRequisicoes: TtecDataSource
    DataSet = qryItensRequisicoes
    Left = 216
    Top = 304
  end
  object qryGrupoFiliaisMontagem: TtecQuery
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
      'Select codigo, '
      '           descricao'
      'From   gruposfiliais'
      'Where codigo=:codigo')
    RequestLive = True
    Left = 60
    Top = 111
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryGrupoFiliaisMontagemcodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryGrupoFiliaisMontagemdescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
  end
  object dstGrupoFiliaisMontagem: TtecDataSource
    DataSet = qryGrupoFiliaisMontagem
    Left = 211
    Top = 111
  end
  object qryProdutosContratos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryProdutosContratosAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select '
      '       pc.filial,'
      '       pc.produto,'
      '       p.descricao as descricao,'
      
        '       (select gr.descricao from grades gr where gr.codigo = c.g' +
        'rade1) as linha,'
      
        '       (select gr.descricao from grades gr where gr.codigo = c.g' +
        'rade2) as coluna,'
      '       p.valorgrade1,'
      '       p.valorgrade2,'
      '       pc.quantidade,'
      '       pc.cancelado,'
      '       pc.precovenda,'
      '       pc.reserva,'
      '       pc.montagem,'
      '       pc.entrega,'
      '       pc.brinde'
      'from produtoscontratos pc, produtos p, caracteristicas c'
      'where (pc.contrato = :contrato) and'
      '          pc.produto = p.codigo and'
      '          p.caracteristica = c.codigo'
      'order by pc.numero')
    RequestLive = False
    Left = 56
    Top = 350
    ParamData = <
      item
        DataType = ftString
        Name = 'contrato'
        ParamType = ptUnknown
      end>
    object qryProdutosContratosfilial: TIntegerField
      FieldName = 'filial'
      Required = True
    end
    object qryProdutosContratosproduto: TLargeintField
      FieldName = 'produto'
      Required = True
    end
    object qryProdutosContratosdescricao: TStringField
      DisplayWidth = 50
      FieldName = 'descricao'
      Size = 100
    end
    object qryProdutosContratosquantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
    end
    object qryProdutosContratoscancelado: TFloatField
      FieldName = 'cancelado'
    end
    object qryProdutosContratosprecovenda: TFloatField
      FieldName = 'precovenda'
      Required = True
    end
    object qryProdutosContratosreserva: TIntegerField
      FieldName = 'reserva'
    end
    object qryProdutosContratosmontagem: TStringField
      FieldName = 'montagem'
      Required = True
      Size = 1
    end
    object qryProdutosContratosentrega: TStringField
      FieldName = 'entrega'
      Required = True
      Size = 1
    end
    object qryProdutosContratosbrinde: TBooleanField
      FieldName = 'brinde'
    end
    object qryProdutosContratoslinha: TStringField
      FieldName = 'linha'
      Size = 50
    end
    object qryProdutosContratoscoluna: TStringField
      FieldName = 'coluna'
      Size = 50
    end
    object qryProdutosContratosvalorgrade1: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade1'
      Size = 30
    end
    object qryProdutosContratosvalorgrade2: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade2'
      Size = 30
    end
  end
  object dsrProdutosContratos: TtecDataSource
    DataSet = qryProdutosContratos
    Left = 216
    Top = 352
  end
  object dsrProdutosDadosFiscais: TtecDataSource
    DataSet = qryProdutosDadosFiscais
    Left = 215
    Top = 400
  end
  object qryProdutosDadosFiscais: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryProdutosDadosFiscaisAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'Select  pdf.quantidade, '
      '            pdf.aliquotaicms, '
      '            pdf.produto, '
      '            pdf.precovenda,'
      '           (pdf.quantidade * pdf.precovenda) as precototal,'
      '            p.preco, '
      '            p.descricao as produtodescricao, '
      
        '            (select gr.descricao from grades gr where gr.codigo ' +
        '= c.grade1) as linha,'
      
        '            (select gr.descricao from grades gr where gr.codigo ' +
        '= c.grade2) as coluna,'
      '            p.valorgrade1,'
      '            p.valorgrade2,'
      '            m.descricao as marcadescricao'
      
        'From  produtosdadosfiscais pdf join produtos p on ( pdf.produto ' +
        '= p.codigo )'
      
        '                                                join caracterist' +
        'icas c on ( p.caracteristica = c.codigo )'
      
        '                                                join  marcas m o' +
        'n  (c.marca = m.codigo) '
      'Where  pdf.dadofiscal = :dadofiscal '
      ''
      '')
    RequestLive = False
    Left = 59
    Top = 400
    ParamData = <
      item
        DataType = ftString
        Name = 'dadofiscal'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryProdutosDadosFiscaisquantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
    end
    object qryProdutosDadosFiscaisaliquotaicms: TFloatField
      FieldName = 'aliquotaicms'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisproduto: TLargeintField
      FieldName = 'produto'
      Required = True
    end
    object qryProdutosDadosFiscaispreco: TIntegerField
      FieldName = 'preco'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisprecovenda: TFloatField
      FieldName = 'precovenda'
    end
    object qryProdutosDadosFiscaisprodutodescricao: TStringField
      DisplayWidth = 50
      FieldName = 'produtodescricao'
      Size = 100
    end
    object qryProdutosDadosFiscaismarcadescricao: TStringField
      FieldName = 'marcadescricao'
      Size = 15
    end
    object qryProdutosDadosFiscaisprecototal: TFloatField
      FieldName = 'precototal'
    end
    object qryProdutosDadosFiscaislinha: TStringField
      FieldName = 'linha'
      Size = 50
    end
    object qryProdutosDadosFiscaiscoluna: TStringField
      FieldName = 'coluna'
      Size = 50
    end
    object qryProdutosDadosFiscaisvalorgrade1: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade1'
      Size = 30
    end
    object qryProdutosDadosFiscaisvalorgrade2: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade2'
      Size = 30
    end
  end
  object qryClientesRequisicoes: TtecQuery
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
      'Select vf.Codigo,'
      '          vf.tipo,'
      '          coalesce(vf.razao,vf.nome) as nome,'
      '          vf.pessoanumero,'
      '          vf.cnpj,'
      '          vf.inscricaoestadual,'
      '          vf.rua,'
      '          vf.numero,'
      '          vf.complemento,'
      '          vf.cidade,'
      
        '          (select ci.nome from cidades ci where ci.estado=vf.est' +
        'ado and ci.codigo=vf.cidade) as nomecidade,'
      '          vf.bairro,'
      
        '          (select b.nome from bairros b where b.estado=vf.estado' +
        ' and b.cidade=vf.cidade and  b.codigo=vf.bairro) as nomebairro,'
      '          vf.estado,'
      '          vf.cep,'
      '          vf.fonenumero,'
      '          vf.foneddd,'
      '          vf.foneramal,'
      '          vf.fonenumeroempresa,'
      '          vf.fonedddempresa,'
      '          vf.foneramalempresa'
      '         '
      'From   vfornecedores vf'
      'where (vf.codigo = :codigo)  and'
      '          (vf.tipo     = :tipocliente) '
      'Order By Codigo, tipo')
    RequestLive = False
    Left = 58
    Top = 452
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'tipocliente'
        ParamType = ptUnknown
      end>
    object qryClientesRequisicoescodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryClientesRequisicoestipo: TStringField
      FieldName = 'tipo'
      Size = 50
    end
    object qryClientesRequisicoesnome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object qryClientesRequisicoespessoanumero: TStringField
      FieldName = 'pessoanumero'
      Size = 50
    end
    object qryClientesRequisicoescnpj: TStringField
      FieldName = 'cnpj'
      Size = 50
    end
    object qryClientesRequisicoesinscricaoestadual: TStringField
      FieldName = 'inscricaoestadual'
      Size = 50
    end
    object qryClientesRequisicoesrua: TStringField
      FieldName = 'rua'
      Size = 50
    end
    object qryClientesRequisicoescidade: TIntegerField
      FieldName = 'cidade'
    end
    object qryClientesRequisicoesbairro: TIntegerField
      FieldName = 'bairro'
    end
    object qryClientesRequisicoesestado: TStringField
      FieldName = 'estado'
      Size = 50
    end
    object qryClientesRequisicoescep: TIntegerField
      FieldName = 'cep'
    end
    object qryClientesRequisicoesfonenumero: TIntegerField
      FieldName = 'fonenumero'
    end
    object qryClientesRequisicoesfoneddd: TIntegerField
      FieldName = 'foneddd'
    end
    object qryClientesRequisicoesfoneramal: TStringField
      FieldName = 'foneramal'
      Size = 50
    end
    object qryClientesRequisicoesfonenumeroempresa: TIntegerField
      FieldName = 'fonenumeroempresa'
    end
    object qryClientesRequisicoesfonedddempresa: TIntegerField
      FieldName = 'fonedddempresa'
    end
    object qryClientesRequisicoesfoneramalempresa: TStringField
      FieldName = 'foneramalempresa'
      Size = 50
    end
    object qryClientesRequisicoesnomecidade: TStringField
      FieldName = 'nomecidade'
      Size = 50
    end
    object qryClientesRequisicoesnomebairro: TStringField
      FieldName = 'nomebairro'
      Size = 50
    end
    object qryClientesRequisicoesnumero: TIntegerField
      FieldName = 'numero'
    end
    object qryClientesRequisicoescomplemento: TStringField
      FieldName = 'complemento'
      Size = 100
    end
  end
  object dsrClientesRequisicoes: TtecDataSource
    DataSet = qryClientesRequisicoes
    Left = 215
    Top = 453
  end
  object qryGerarRequisicoes: TtecQuery
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
      '/* Preenchido em RunTime  */')
    RequestLive = True
    Left = 411
    Top = 295
  end
  object spcRequisicoesProximoCodigo: TtecQuery
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
      'SELECT requisicoes_proximonumero() as numero')
    RequestLive = False
    Left = 526
    Top = 35
    object spcRequisicoesProximoCodigonumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
  end
  object qryRequisicoes: TtecQuery
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
        Name = 'DADOFISCAL'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';SELECT * FROM'
      '(Select  df.numero as dadofiscal,'
      '          df.contrato,'
      '          c.montagemfilial,'
      '          c.vendedor,'
      '          c.montagemobs,'
      '          df.cliente,'
      '          df.tipocliente,'
      
        '          case when c.entrua is not null then c.entrua          ' +
        '  else vf.rua end as entrua,'
      
        '          case when c.entrua is not null then c.entcidade       ' +
        'else vf.cidade end as entcidade,'
      
        '          case when c.entrua is not null then (select ci.nome fr' +
        'om cidades ci where ci.estado=c.entestado and ci.codigo=c.entcid' +
        'ade) else'
      
        '                                                                ' +
        '             (select ci.nome from cidades ci where ci.estado=vf.' +
        'estado and ci.codigo=vf.cidade) end as cidade,'
      
        '          case when c.entrua is not null then c.entestado       ' +
        ' else vf.estado end as entestado,'
      
        '          case when c.entrua is not null then c.entbairro       ' +
        '  else vf.bairro end as entbairro,'
      
        '          case when c.entrua is not null then (select b.nome fro' +
        'm bairros b where b.estado=c.entestado and b.cidade=c.entcidade ' +
        'and  b.codigo=c.entbairro) else'
      
        '                                                                ' +
        '             (select b.nome from bairros b where b.estado=vf.est' +
        'ado and b.cidade=vf.cidade and b.codigo=vf.bairro) end as bairro' +
        ','
      
        '          case when c.entrua is not null then c.entcep          ' +
        '  else vf.cep end as entcep,'
      
        '          case when c.entrua is not null then c.entfoneddd      ' +
        'else vf.foneddd end as entfoneddd,'
      
        '          case when c.entrua is not null then c.entfonenumero el' +
        'se vf.fonenumero end as entfonenumero,'
      
        '          case when c.entrua is not null then c.entfoneramal    ' +
        'else vf.foneramal end as entfoneramal'
      
        'from ((dadosfiscais df  left join contratos c on df.contrato=c.n' +
        'umero)'
      
        '                               left join vfornecedores vf on df.' +
        'cliente=vf.codigo and df.tipocliente=vf.tipo)'
      '%DADOFISCAL'
      ') AS r'
      
        'order by UPPER(TO_ASCII(r.cidade,'#39'LATIN1'#39')), UPPER(TO_ASCII(r.ba' +
        'irro,'#39'LATIN1'#39')), r.DadoFiscal'
      '')
    RequestLive = True
    Left = 56
    Top = 256
    object qryRequisicoesdadofiscal: TIntegerField
      FieldName = 'dadofiscal'
    end
    object qryRequisicoescontrato: TStringField
      FieldName = 'contrato'
    end
    object qryRequisicoesmontagemfilial: TIntegerField
      FieldName = 'montagemfilial'
    end
    object qryRequisicoesvendedor: TIntegerField
      FieldName = 'vendedor'
    end
    object qryRequisicoescliente: TIntegerField
      FieldName = 'cliente'
    end
    object qryRequisicoestipocliente: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
    object qryRequisicoesentrua: TStringField
      DisplayWidth = 100
      FieldName = 'entrua'
      Size = 100
    end
    object qryRequisicoesentcidade: TIntegerField
      FieldName = 'entcidade'
    end
    object qryRequisicoescidade: TStringField
      FieldName = 'cidade'
      Size = 13
    end
    object qryRequisicoesentestado: TStringField
      FieldName = 'entestado'
      Size = 2
    end
    object qryRequisicoesentbairro: TIntegerField
      FieldName = 'entbairro'
    end
    object qryRequisicoesbairro: TStringField
      FieldName = 'bairro'
      Size = 16
    end
    object qryRequisicoesentcep: TIntegerField
      FieldName = 'entcep'
    end
    object qryRequisicoesentfoneddd: TIntegerField
      FieldName = 'entfoneddd'
    end
    object qryRequisicoesentfonenumero: TIntegerField
      FieldName = 'entfonenumero'
    end
    object qryRequisicoesentfoneramal: TStringField
      FieldName = 'entfoneramal'
      Size = 10
    end
    object qryRequisicoesmontagemobs: TStringField
      FieldName = 'montagemobs'
      Size = 250
    end
  end
  object qryMontador: TtecQuery
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
      'Select Codigo,'
      '          Nome,'
      '          tipo'
      'From   vmontadores'
      'where (codigo = :codigo) and'
      '          (tipo     = :tipomontador)'
      'Order By Codigo, tipo')
    RequestLive = False
    Left = 58
    Top = 501
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'tipomontador'
        ParamType = ptUnknown
      end>
    object qryMontadorcodigo: TIntegerField
      DisplayLabel = 'C'#243'digo do Montador'
      FieldName = 'codigo'
    end
    object qryMontadornome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object qryMontadortipo: TStringField
      FieldName = 'tipo'
      Size = 50
    end
  end
  object dsrMontador: TtecDataSource
    DataSet = qryMontador
    Left = 167
    Top = 502
  end
  object qryConsultaMontador: TtecQuery
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
      'SELECT Nome,'
      '       Codigo,'
      '       Tipo,'
      '       cast(case when tipo = '#39'F'#39' then '#39'Fornecedor'#39
      '                 when tipo = '#39'U'#39' then '#39'Usu'#225'rio'#39
      '             end as varchar) as tipoorig'
      'From   vmontadores'
      'Order By UPPER(TO_ASCII(nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 324
    Top = 496
    object qryConsultaMontadornome: TStringField
      DisplayLabel = 'Montador'
      FieldName = 'nome'
      Size = 17
    end
    object qryConsultaMontadorcodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryConsultaMontadortipo: TStringField
      FieldName = 'tipo'
      Visible = False
      Size = 1
    end
    object qryConsultaMontadortipoorig: TStringField
      DisplayLabel = 'Tipo de Montador'
      FieldName = 'tipoorig'
      Size = 10
    end
  end
  object qryItensRequisicoes_Romaneio: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryItensRequisicoesAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'WhereFiliaisMontagem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WhereFiliaisVenda'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WhereCliente'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';'
      'select rn.*,'
      '       n.serie,'
      '       n.numero as NotaFiscal,'
      '       cp.maquina,'
      '       cp.intervensao,'
      '       cp.numero as CupomFiscal,'
      '       false as Marcar,'
      '       cast(0 as float) as valor'
      'from'
      '('
      ''
      ' SELECT rn.*,'
      '       p.descricao as descricaoproduto,'
      
        '      (select gr.descricao from grades gr where gr.codigo = c.gr' +
        'ade1) as linha,'
      
        '      (select gr.descricao from grades gr where gr.codigo = c.gr' +
        'ade2) as coluna,'
      '       p.valorgrade1,'
      '       p.valorgrade2'
      ' FROM'
      ' ('
      ' select'
      '   rn.*,'
      '   df.contrato,'
      '   df.filialemissao,'
      '   df.data as emissaodadofiscal,'
      '   df.cliente,'
      '   df.tipocliente,'
      
        '   case when ct.entrua is not null then ct.entrua else vf.rua en' +
        'd as entrua,'
      
        '   case when ct.entrua is not null then ct.entnumero else vf.num' +
        'ero end as entnumero,'
      
        '   case when ct.entrua is not null then ct.entcomplemento else v' +
        'f.complemento end as entcomplemento,'
      
        '   case when ct.entrua is not null then ct.entcidade else vf.cid' +
        'ade end as entcidade,'
      
        '   case when ct.entrua is not null then (select ci.nome from cid' +
        'ades ci where ci.estado=ct.entestado and ci.codigo=ct.entcidade)' +
        ' else'
      
        '   (select ci.nome from cidades ci where ci.estado=vf.estado and' +
        ' ci.codigo=vf.cidade) end as cidade,'
      
        '   case when ct.entrua is not null then ct.entestado else vf.est' +
        'ado end as entestado,'
      
        '   case when ct.entrua is not null then ct.entbairro else vf.bai' +
        'rro end as entbairro,'
      
        '   case when ct.entrua is not null then (select b.nome from bair' +
        'ros b where b.estado=ct.entestado and b.cidade=ct.entcidade and ' +
        'b.codigo=ct.entbairro) else'
      
        '   (select b.nome from bairros b where b.estado=vf.estado and b.' +
        'cidade=vf.cidade and b.codigo=vf.bairro) end as bairro,'
      
        '   case when ct.entrua is not null then ct.entcep else vf.cep en' +
        'd as entcep,'
      
        '   case when ct.entrua is not null then ct.entfoneddd else vf.fo' +
        'neddd end as entfoneddd,'
      
        '   case when ct.entrua is not null then ct.entfonenumero else vf' +
        '.fonenumero end as entfonenumero,'
      
        '   case when ct.entrua is not null then ct.entfoneramal else vf.' +
        'foneramal end as entfoneramal,'
      '   fc.nome as nomefilialvenda,'
      '   ct.vendedor,'
      '   ct.montagemfilial,'
      '   ct.montagemobs,'
      '   ct.data as emissaocontrato,'
      '   pdf.produto,'
      '   pdf.filial,'
      '   pdf.quantidade,'
      '   f.nome as nomefilialemissao'
      ''
      ' from'
      ' ('
      '  select rn.dadofiscal'
      '  from romaneiosnotas rn'
      '  where rn.entrega between :datainicial and :datafinal'
      '    and rn.cancelado = false'
      '  ) as rn'
      '      join dadosfiscais df on df.numero = rn.dadofiscal'
      
        '           join produtosdadosfiscais pdf on pdf.dadofiscal = df.' +
        'numero'
      ''
      '           join vfornecedores vf'
      '            on df.cliente=vf.codigo and df.tipocliente=vf.tipo'
      ''
      '           join (contratos ct'
      
        '                     join filiais fc on ct.filialvenda=fc.codigo' +
        ')'
      '           on df.contrato=ct.numero'
      ''
      '           join filiais f on df.filialemissao=f.codigo'
      ''
      '  where (pdf.produto,pdf.filial) not in'
      '        (select ri.produto,ri.filial'
      '         from requisicoesitens ri'
      '         where ri.requisicao in (select r.numero'
      '                                 from requisicoes r'
      '                                 where r.dadofiscal=df.numero))'
      '    and ct.montagemfilial is not null'
      '    and df.situacao<>'#39'C'#39
      '    and (select pc.montagem'
      '         from produtoscontratos pc'
      '         where pc.contrato = ct.numero'
      '           and pc.produto = pdf.produto'
      '           and pc.filial = pdf.filial)='#39'S'#39
      ''
      '    %WhereFiliaisMontagem'
      '    %WhereFiliaisVenda'
      '    %WhereCliente'
      ''
      '  ) as rn'
      '       join produtos p'
      '            join caracteristicas c'
      '            on p.caracteristica = c.codigo'
      '       on rn.produto=p.codigo'
      ' ) as rn'
      '     left join notas n'
      '     on rn.dadofiscal=n.dadofiscal'
      ''
      '     left join cupons cp'
      '     on rn.dadofiscal=cp.dadofiscal'
      ''
      
        'ORDER BY UPPER(TO_ASCII(rn.cidade,'#39'LATIN1'#39')), UPPER(TO_ASCII(rn.' +
        'bairro,'#39'LATIN1'#39')), rn.DadoFiscal')
    RequestLive = True
    Left = 544
    Top = 440
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end>
  end
  object qryItensRequisicoes_Notas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryItensRequisicoesAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'WhereFiliaisMontagem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WhereFiliaisVenda'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WhereCliente'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';'
      'select rn.*,'
      '       n.serie,'
      '       n.numero as NotaFiscal, '
      '       cp.maquina,'
      '       cp.intervensao,'
      '       cp.numero as CupomFiscal,'
      '       false as Marcar, '
      '       cast(0 as float) as valor'
      'from'
      '('
      ''
      ' SELECT rn.*,'
      '       p.descricao as descricaoproduto, '
      
        '      (select gr.descricao from grades gr where gr.codigo = c.gr' +
        'ade1) as linha,'
      
        '      (select gr.descricao from grades gr where gr.codigo = c.gr' +
        'ade2) as coluna, '
      '       p.valorgrade1,'
      '       p.valorgrade2'
      ' FROM'
      ' ('
      ' select'
      '   df.numero as dadofiscal, '
      '   df.contrato,'
      '   df.filialemissao,'
      '   df.data as emissaodadofiscal,'
      '   df.cliente,'
      '   df.tipocliente,'
      
        '   case when ct.entrua is not null then ct.entrua else vf.rua en' +
        'd as entrua,'
      
        '   case when ct.entrua is not null then ct.entnumero else vf.num' +
        'ero end as entnumero,'
      
        '   case when ct.entrua is not null then ct.entcomplemento else v' +
        'f.complemento end as entcomplemento,'
      
        '   case when ct.entrua is not null then ct.entcidade else vf.cid' +
        'ade end as entcidade,'
      
        '   case when ct.entrua is not null then (select ci.nome from cid' +
        'ades ci where ci.estado=ct.entestado and ci.codigo=ct.entcidade)' +
        ' else'
      
        '   (select ci.nome from cidades ci where ci.estado=vf.estado and' +
        ' ci.codigo=vf.cidade) end as cidade,'
      
        '   case when ct.entrua is not null then ct.entestado else vf.est' +
        'ado end as entestado,'
      
        '   case when ct.entrua is not null then ct.entbairro else vf.bai' +
        'rro end as entbairro,'
      
        '   case when ct.entrua is not null then (select b.nome from bair' +
        'ros b where b.estado=ct.entestado and b.cidade=ct.entcidade and ' +
        'b.codigo=ct.entbairro) else'
      
        '   (select b.nome from bairros b where b.estado=vf.estado and b.' +
        'cidade=vf.cidade and b.codigo=vf.bairro) end as bairro,'
      
        '   case when ct.entrua is not null then ct.entcep else vf.cep en' +
        'd as entcep,'
      
        '   case when ct.entrua is not null then ct.entfoneddd else vf.fo' +
        'neddd end as entfoneddd,'
      
        '   case when ct.entrua is not null then ct.entfonenumero else vf' +
        '.fonenumero end as entfonenumero,'
      
        '   case when ct.entrua is not null then ct.entfoneramal else vf.' +
        'foneramal end as entfoneramal,'
      '   fc.nome as nomefilialvenda,'
      '   ct.vendedor,'
      '   ct.montagemfilial,'
      '   ct.montagemobs,'
      '   ct.data as emissaocontrato,'
      '   pdf.produto,'
      '   pdf.filial,'
      '   pdf.quantidade,'
      '   f.nome as nomefilialemissao'
      ''
      ' from  '
      '      dadosfiscais df '
      
        '           join produtosdadosfiscais pdf on pdf.dadofiscal = df.' +
        'numero'
      ''
      '           join vfornecedores vf '
      '            on df.cliente=vf.codigo and df.tipocliente=vf.tipo'
      ''
      '           join (contratos ct '
      
        '                     join filiais fc on ct.filialvenda=fc.codigo' +
        ')'
      '           on df.contrato=ct.numero'
      ''
      '           join filiais f on df.filialemissao=f.codigo'
      '                       '
      '  where df.data between :datainicial and :datafinal'
      '     and (pdf.produto,pdf.filial) not in '
      '        (select ri.produto,ri.filial '
      '         from requisicoesitens ri '
      '         where ri.requisicao in (select r.numero '
      '                                 from requisicoes r '
      '                                 where r.dadofiscal=df.numero))'
      '    and ct.montagemfilial is not null '
      '    and df.situacao<>'#39'C'#39
      '    and (select pc.montagem'
      '         from produtoscontratos pc '
      '         where pc.contrato = ct.numero'
      '           and pc.produto = pdf.produto'
      '           and pc.filial = pdf.filial)='#39'S'#39
      ''
      '    %WhereFiliaisMontagem'
      '    %WhereFiliaisVenda'
      '    %WhereCliente'
      ''
      '  ) as rn '
      '       join produtos p '
      '            join caracteristicas c '
      '            on p.caracteristica = c.codigo '
      '       on rn.produto=p.codigo'
      ' ) as rn'
      '     left join notas n '
      '     on rn.dadofiscal=n.dadofiscal'
      '            '
      '     left join cupons cp '
      '     on rn.dadofiscal=cp.dadofiscal'
      ''
      
        'ORDER BY UPPER(TO_ASCII(rn.cidade,'#39'LATIN1'#39')), UPPER(TO_ASCII(rn.' +
        'bairro,'#39'LATIN1'#39')), rn.DadoFiscal'
      '')
    RequestLive = True
    Left = 544
    Top = 488
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end>
  end
end
