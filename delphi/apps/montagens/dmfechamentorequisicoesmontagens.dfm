inherited dtmFechamentoRequisicoesMontagens: TdtmFechamentoRequisicoesMontagens
  OldCreateOrder = False
  Left = 463
  Top = 129
  Height = 457
  Width = 675
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
    Left = 92
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
  object dsrFilialMontagem: TtecDataSource
    DataSet = qryFilialMontagem
    Left = 243
    Top = 16
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
    Left = 92
    Top = 87
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
  object dsrGrupoFiliaisMontagem: TtecDataSource
    DataSet = qryGrupoFiliaisMontagem
    Left = 243
    Top = 87
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
    Left = 391
    Top = 16
    object qryConsultaFiliaisnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaFiliaiscodigo: TIntegerField
      FieldName = 'codigo'
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
    Left = 391
    Top = 87
    object qryConsultaGrupoFiliaisdescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
    object qryConsultaGrupoFiliaiscodigo: TIntegerField
      FieldName = 'codigo'
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
    OnCalcFields = qryItensRequisicoesCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      ';select rdf.*,'
      '     ct.data as emissaocontrato,'
      '     fc.nome as nomefilialvenda,'
      '      n.serie,'
      '      n.numero as NotaFiscal, '
      '      cp.maquina,'
      '      cp.intervensao,'
      '      cp.numero as CupomFiscal'
      'from'
      '('
      'select r.*,'
      '      df.contrato, '
      '      df.numero,'
      '      f.nome as nomefilialemissao, '
      '      df.data as emissaodadofiscal'
      'from'
      '('
      'select '
      '   r.abertura,'
      '   r.datahora,'
      '   ri.requisicao, '
      '   r.dadofiscal,'
      '   r.filialmontagem,'
      
        '   (select f.nome from filiais f where f.codigo=r.filialmontagem' +
        ') as nomefilialmontagem, '
      '   r.montador,'
      
        '   (select vm.nome from vmontadores vm where vm.codigo=r.montado' +
        'r and vm.tipo=r.tipomontador) as nomemontador,'
      '   r.vendedor,'
      
        '   (select u.nome from usuarios u where u.codigo=r.vendedor) as ' +
        'nomevendedor,'
      '   ri.produto,'
      '   p.descricao as descricaoproduto,'
      
        '   (select gr.descricao from grades gr where gr.codigo = c.grade' +
        '1) as linha,'
      
        '   (select gr.descricao from grades gr where gr.codigo = c.grade' +
        '2) as coluna,'
      '   p.valorgrade1,'
      '   p.valorgrade2,'
      '   ri.filial,'
      
        '   (select f.nome from filiais f where f.codigo=ri.filial) as fi' +
        'lialproduto,'
      '   ri.quantidade,'
      '   ri.montagem,'
      
        '   (select tm.descricao from tabelademontagens tm where tm.codig' +
        'o=ri.montagem) as descricaomontagem,'
      '   ri.tipodemontagem,'
      '   ri.datamontagem,'
      '   ri.valorpagto,'
      '   ri.datapagto,'
      '   ri.observacoes,'
      
        '   r.rua as entrua, r.endnumero as entnumero, r.endcomplemento a' +
        's entcomplemento,'
      '   r.cidade as entcidade,'
      
        '   (select ci.nome from cidades ci where ci.estado=r.estado and ' +
        'ci.codigo=r.cidade) as cidade,'
      '   r.estado as entestado,'
      '   r.bairro as entbairro, '
      
        '   (select b.nome from bairros b where b.estado=r.estado and b.c' +
        'idade=r.cidade and  b.codigo=r.bairro) as bairro,'
      '   r.cep as entcep,'
      '   r.foneddd as entfoneddd,'
      '   r.fonenumero as entfonenumero,'
      '   r.foneramal as entfoneramal,'
      '   r.cliente,'
      '   r.tipocliente,'
      '   false as Marcar, cast(0 as float) as valor'
      ''
      
        ' from  (requisicoes r join (requisicoesitens ri join (produtos p' +
        ' join caracteristicas c on p.caracteristica = c.codigo)'
      
        '                                                                ' +
        ' on ri.produto = p.codigo)'
      
        '                                                     on r.numero' +
        ' = ri.requisicao)'
      'where r.abertura between (:datainicial) and (:datafinal)  and'
      '          r.montador is not null and'
      '          r.filialmontagem is not null and'
      '          ri.datamontagem is null'
      ''
      '         /* Where Filiais de Montagem */'
      '         /* Where Montadores */'
      ''
      
        ') as r left join (dadosfiscais df join filiais f on df.filialemi' +
        'ssao=f.codigo) on r.dadofiscal=df.numero'
      
        ') as rdf left join (contratos ct join filiais fc on ct.filialven' +
        'da=fc.codigo) on rdf.contrato=ct.numero'
      '         left join notas n on rdf.numero=n.dadofiscal'
      '         left join cupons cp on rdf.numero=cp.dadofiscal'
      ''
      
        'order by abertura, requisicao, UPPER(TO_ASCII(Descricaoproduto,'#39 +
        'LATIN1'#39')), valorgrade1, valorgrade2, filial')
    RequestLive = True
    Left = 80
    Top = 272
    ParamData = <
      item
        DataType = ftDate
        Name = 'datainicial'
        ParamType = ptUnknown
        Value = #39'01/01/2000'#39
      end
      item
        DataType = ftDate
        Name = 'datafinal'
        ParamType = ptUnknown
        Value = #39'14/05/2004'#39
      end>
    object qryItensRequisicoesabertura: TDateField
      Alignment = taCenter
      FieldName = 'abertura'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryItensRequisicoesrequisicao: TIntegerField
      FieldName = 'requisicao'
      Required = True
      DisplayFormat = '0'
    end
    object qryItensRequisicoesdadofiscal: TIntegerField
      FieldName = 'dadofiscal'
      DisplayFormat = '0'
    end
    object qryItensRequisicoesproduto: TLargeintField
      FieldName = 'produto'
      Required = True
    end
    object qryItensRequisicoesfilial: TIntegerField
      FieldName = 'filial'
      Required = True
      DisplayFormat = '0'
    end
    object qryItensRequisicoesdescricaoproduto: TStringField
      DisplayWidth = 50
      FieldName = 'descricaoproduto'
      Size = 100
    end
    object qryItensRequisicoesquantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
      DisplayFormat = '0'
    end
    object qryItensRequisicoesmontagem: TIntegerField
      DisplayLabel = 'Tabela de Montagem'
      FieldName = 'montagem'
      KeyFields = 'montagem'
      DisplayFormat = '0'
    end
    object qryItensRequisicoesdescricaomontagem: TStringField
      FieldName = 'descricaomontagem'
      KeyFields = 'montagem'
      FixedChar = True
      Size = 50
    end
    object qryItensRequisicoestipodemontagem: TStringField
      DisplayLabel = 'Tipo de Montagem'
      FieldName = 'tipodemontagem'
      FixedChar = True
      Size = 1
    end
    object qryItensRequisicoesdatamontagem: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data de Montagem'
      FieldName = 'datamontagem'
      EditMask = '99/99/9999;1; '
    end
    object qryItensRequisicoesobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 100
    end
    object qryItensRequisicoesmarcar: TBooleanField
      FieldName = 'marcar'
    end
    object qryItensRequisicoesentrua: TStringField
      FieldName = 'entrua'
      Size = 100
    end
    object qryItensRequisicoesentcidade: TIntegerField
      FieldName = 'entcidade'
      DisplayFormat = '0'
    end
    object qryItensRequisicoescidade: TStringField
      FieldName = 'cidade'
      Size = 50
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
      Size = 50
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
    object qryItensRequisicoescontrato: TStringField
      FieldName = 'contrato'
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
    object qryItensRequisicoescliente: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object qryItensRequisicoestipocliente: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
    object qryItensRequisicoesfilialproduto: TStringField
      FieldName = 'filialproduto'
      Size = 50
    end
    object qryItensRequisicoesvalorpagto: TFloatField
      FieldName = 'valorpagto'
      DisplayFormat = '0.00'
    end
    object qryItensRequisicoesdatapagto: TDateField
      Alignment = taCenter
      FieldName = 'datapagto'
      EditMask = '99/99/9999;1; '
    end
    object qryItensRequisicoesdatahora: TDateTimeField
      FieldName = 'datahora'
    end
    object qryItensRequisicoesfilialmontagem: TIntegerField
      FieldName = 'filialmontagem'
      DisplayFormat = '0'
    end
    object qryItensRequisicoesnomefilialmontagem: TStringField
      FieldName = 'nomefilialmontagem'
      Size = 50
    end
    object qryItensRequisicoesmontador: TIntegerField
      FieldName = 'montador'
      DisplayFormat = '0'
    end
    object qryItensRequisicoesnomemontador: TStringField
      FieldName = 'nomemontador'
      Size = 50
    end
    object qryItensRequisicoesvendedor: TIntegerField
      FieldName = 'vendedor'
      DisplayFormat = '0'
    end
    object qryItensRequisicoesnomevendedor: TStringField
      FieldName = 'nomevendedor'
      Size = 50
    end
    object qryItensRequisicoesvalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '0.00'
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
    object qryItensRequisicoesdescricaoprodutolc: TStringField
      FieldKind = fkCalculated
      FieldName = 'descricaoprodutolc'
      Size = 62
      Calculated = True
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
    OnDataChange = dsrItensRequisicoesDataChange
    Left = 240
    Top = 272
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
    AfterClose = qryProdutosContratosAfterScroll
    AfterScroll = qryProdutosContratosAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select '
      '       pc.filial,'
      '       pc.produto,'
      '       p.descricao,'
      
        '       (select gr.descricao from grades gr where gr.codigo = c.g' +
        'rade1) as linha,'
      
        '       (select gr.descricao from grades gr where gr.codigo = c.g' +
        'rade1) as coluna,'
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
      'where (contrato = :contrato) and'
      '          pc.produto = p.codigo and'
      '          p.caracteristica = c.codigo'
      'order by pc.numero')
    RequestLive = False
    Left = 80
    Top = 334
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
    Left = 240
    Top = 336
  end
  object dsrProdutosDadosFiscais: TtecDataSource
    DataSet = qryProdutosDadosFiscais
    Left = 239
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
    AfterClose = qryProdutosDadosFiscaisAfterScroll
    AfterScroll = qryProdutosDadosFiscaisAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'Select   pdf.dadofiscal,'
      '            pdf.quantidade, '
      '            pdf.aliquotaicms, '
      '            pdf.produto, '
      '            pdf.filial,'
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
      'order by pdf.dadofiscal, pdf.numero'
      ''
      ''
      '')
    RequestLive = False
    Left = 83
    Top = 392
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
    object qryProdutosDadosFiscaisdadofiscal: TIntegerField
      FieldName = 'dadofiscal'
    end
    object qryProdutosDadosFiscaisfilial: TIntegerField
      FieldName = 'filial'
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
    Left = 82
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
    Left = 239
    Top = 453
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
    Left = 90
    Top = 149
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
    Left = 247
    Top = 150
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
      'Select Nome,'
      '          Codigo,'
      '        tipo,'
      '       cast(case when tipo = '#39'F'#39' then '#39'Fornecedor'#39
      '                       when tipo = '#39'U'#39' then '#39'Usu'#225'rio'#39
      '               end as varchar) as tipoorig'
      'From   vmontadores'
      'Order By UPPER(TO_ASCII(nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 388
    Top = 152
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
  object qryConsultaTabeladeMontagem: TtecQuery
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
      'select tm.descricao,'
      '         tm.codigo'
      'from tabelademontagens tm'
      'order by UPPER(TO_ASCII(tm.Descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 448
    Top = 504
    object qryConsultaTabeladeMontagemdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
    object qryConsultaTabeladeMontagemcodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
  end
  object qryProcuraTabeladeMontagem: TtecQuery
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
      'select tm.codigo,'
      '         tm.descricao,'
      '         tm.valorloja,'
      '         tm.valordentro,'
      '         tm.valorfora,'
      '         tm.tipovalor   '
      'from tabelademontagens tm'
      'where codigo=:codigo')
    RequestLive = False
    Left = 80
    Top = 503
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraTabeladeMontagemcodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryProcuraTabeladeMontagemdescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
    object qryProcuraTabeladeMontagemvalorloja: TFloatField
      FieldName = 'valorloja'
    end
    object qryProcuraTabeladeMontagemvalordentro: TFloatField
      FieldName = 'valordentro'
    end
    object qryProcuraTabeladeMontagemvalorfora: TFloatField
      FieldName = 'valorfora'
    end
    object qryProcuraTabeladeMontagemtipovalor: TStringField
      FieldName = 'tipovalor'
      Size = 1
    end
  end
  object dsrProcuraTabeladeMontagem: TtecDataSource
    DataSet = qryProcuraTabeladeMontagem
    Left = 256
    Top = 504
  end
  object qryRequisicoesItens: TtecQuery
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
      'select '
      '   ri.requisicao, '
      '   ri.produto,'
      '   ri.filial,'
      '   ri.montagem,'
      '   ri.tipodemontagem,'
      '   ri.datamontagem,'
      '   ri.valorpagto'
      ' from requisicoesitens ri'
      '/* preenchido em run time */       ')
    RequestLive = True
    Left = 80
    Top = 224
    object qryRequisicoesItensrequisicao: TIntegerField
      FieldName = 'requisicao'
    end
    object qryRequisicoesItensproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryRequisicoesItensfilial: TIntegerField
      FieldName = 'filial'
    end
    object qryRequisicoesItensmontagem: TIntegerField
      FieldName = 'montagem'
    end
    object qryRequisicoesItenstipodemontagem: TStringField
      FieldName = 'tipodemontagem'
      Size = 1
    end
    object qryRequisicoesItensdatamontagem: TDateField
      FieldName = 'datamontagem'
    end
    object qryRequisicoesItensvalorpagto: TFloatField
      FieldName = 'valorpagto'
    end
  end
  object qryProcuraProdutos: TtecQuery
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
      'select p.descricao,'
      '       p.codigo,'
      '       e.filial,'
      '       estoques_preco(p.codigo, e.filial) as preco'
      'from produtos p, estoques e'
      'where (p.codigo = :codigo) and'
      '          (p.codigo = e.produto) and'
      '          (e.filial = :filial) and'
      '          (p.inativo is null)'
      '')
    RequestLive = False
    Left = 80
    Top = 565
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end>
    object qryProcuraProdutosdescricao: TStringField
      DisplayWidth = 50
      FieldName = 'descricao'
      Size = 100
    end
    object qryProcuraProdutoscodigo: TLargeintField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryProcuraProdutosfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryProcuraProdutospreco: TFloatField
      FieldName = 'preco'
    end
  end
  object dsrProcuraProdutos: TtecDataSource
    DataSet = qryProcuraProdutos
    Left = 248
    Top = 558
  end
end
