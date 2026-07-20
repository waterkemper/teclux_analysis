inherited dtmQuitacaoRequisicoesMontagens: TdtmQuitacaoRequisicoesMontagens
  OldCreateOrder = False
  Left = 381
  Top = 124
  Height = 590
  Width = 904
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
      'Order By UPPER(TO_ASCII(nome,''LATIN1''))')
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
      'Order By UPPER(TO_ASCII(descricao,''LATIN1''))')
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
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      ';SELECT * FROM'
      '('
      'select'
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
      '   df.contrato,'
      '   ct.data as emissaocontrato,'
      '   fc.nome as nomefilialvenda,'
      '   f.nome as nomefilialemissao, '
      '   df.data as emissaodadofiscal,'
      '   n.serie,'
      '   n.numero as NotaFiscal, '
      '   cp.maquina,'
      '   cp.intervensao,'
      '   cp.numero as CupomFiscal, '
      '   ri.produto,'
      '   p.descricao as descricaoproduto, '
      
        '   (select gr.descricao from grades gr where gr.codigo = c.grade' +
        '1) as linha,'
      
        '   (select gr.descricao from grades gr where gr.codigo = c.grade' +
        '2) as coluna,  '
      '   p.valorgrade1, '
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
      '   r.rua as entrua, r.endnumero, r.endcomplemento,'
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
      
        ' from ((requisicoesitens ri join (requisicoes r left join ((((da' +
        'dosfiscais df join (contratos ct join filiais fc on ct.filialven' +
        'da=fc.codigo)'
      
        '                                                                ' +
        '                                    on df.contrato=ct.numero)'
      
        '                                                                ' +
        '                               left join notas n on df.numero=n.' +
        'dadofiscal)'
      
        '                                                                ' +
        '                               left join cupons cp on df.numero=' +
        'cp.dadofiscal)'
      
        '                                                                ' +
        '                               join filiais f on df.filialemissa' +
        'o=f.codigo)  '
      
        '                                                                ' +
        '  on r.dadofiscal=df.numero)'
      
        '                                       on ri.requisicao=r.numero' +
        ')'
      
        '                                   join (produtos p join caracte' +
        'risticas c on p.caracteristica = c.codigo)'
      
        '                                                         on ri.p' +
        'roduto = p.codigo)   '
      '                                 '
      
        'where ri.datamontagem between (:datainicial) and (:datafinal) an' +
        'd'
      '          r.montador is not null and'
      '          r.filialmontagem is not null and'
      '          ri.datapagto is null'
      ''
      '         /* Where Filiais de Montagem */'
      '         /* Where Montadores */'
      ''
      ') AS m'
      
        'order by m.datamontagem, m.requisicao, UPPER(TO_ASCII(m.descrica' +
        'oproduto,''LATIN1'')), m.filial, m.valorgrade1, m.valorgrade2')
    RequestLive = True
    Left = 80
    Top = 272
    ParamData = <
      item
        DataType = ftDate
        Name = 'datainicial'
        ParamType = ptUnknown
        Value = '''01/01/2000'''
      end
      item
        DataType = ftDate
        Name = 'datafinal'
        ParamType = ptUnknown
        Value = '''14/05/2004'''
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
      FieldName = 'tipodemontagem'
      FixedChar = True
      Size = 1
    end
    object qryItensRequisicoesdatamontagem: TDateField
      Alignment = taCenter
      FieldName = 'datamontagem'
      EditMask = '99/99/9999;1; '
    end
    object qryItensRequisicoesobservacoes: TStringField
      DisplayWidth = 250
      FieldName = 'observacoes'
      Size = 250
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
    object qryItensRequisicoesendnumero: TIntegerField
      FieldName = 'endnumero'
    end
    object qryItensRequisicoesendcomplemento: TStringField
      FieldName = 'endcomplemento'
      Size = 100
    end
  end
  object dsrItensRequisicoes: TtecDataSource
    DataSet = qryItensRequisicoes
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
      'order by pc.numero'
      '')
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
      '       cast(case when tipo = ''F'' then ''Fornecedor'''
      '                       when tipo = ''U'' then ''Usuário'''
      '               end as varchar) as tipoorig'
      'From   vmontadores'
      'Order By UPPER(TO_ASCII(nome,''LATIN1''))')
    RequestLive = False
    Left = 388
    Top = 152
    object qryConsultaMontadornome: TStringField
      DisplayLabel = 'Montador'
      FieldName = 'nome'
      Size = 17
    end
    object qryConsultaMontadorcodigo: TIntegerField
      DisplayLabel = 'Código'
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
      '   ri.datapagto'
      ' from requisicoesitens ri'
      '/* preenchido em run time */ ')
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
    object qryRequisicoesItensdatapagto: TDateField
      FieldName = 'datapagto'
    end
  end
end
