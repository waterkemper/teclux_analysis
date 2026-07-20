inherited dtmEmissaoNotaComplementar: TdtmEmissaoNotaComplementar
  OldCreateOrder = False
  Left = 413
  Top = 225
  Height = 460
  Width = 647
  object qryDadosFiscais: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeInsert = qryDadosFiscaisBeforeInsert
    AfterCancel = qryDadosFiscaisAfterCancel
    AfterScroll = qryDadosFiscaisAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select n.filial,'
      '         n.serie,'
      '         n.numero as numeronota,'
      '         d.numero,'
      '         d.data,'
      '         d.situacao,'
      '         d.filialvenda,'
      '         d.valortotal,'
      '         d.valorvista,'
      '         d.desconto,'
      '         d.valorfrete,'
      '         d.seguro,           '
      '         d.valoripi,'
      '         d.despesasacessorias,'
      '         d.codigofiscal,'
      
        '         (select cf.descricao from codigosfiscais cf where cf.co' +
        'digo = d.codigofiscal) as descricaocfop,'
      '         d.estadocfo,'
      '         d.filialemissao,'
      '         d.natureza,'
      ''
      '         CAST(CASE WHEN d.CodigoNatureza IS NOT NULL'
      '                   THEN (SELECT na.Descricao'
      '                            FROM Naturezas na'
      
        '                            WHERE na.Codigo = d.Codigonatureza) ' +
        '|| '#39' - COMPLEMENTAR'#39
      '                   ELSE '#39'COMPLEMENTAR'#39
      '              END AS VARCHAR) AS DescricaoNatureza,'
      ''
      '         d.codigonatureza,'
      '         d.descricaosemprodutos,'
      '         d.datasaida,'
      '         d.fornecedortransporte,'
      '         d.frete,'
      '         d.cliente,'
      
        '         (select c.nome from clientes c where c.codigo = d.clien' +
        'te) as nomecliente,'
      
        '         (select c.credito from clientes c where c.codigo = d.cl' +
        'iente) as ClienteCredito,'
      
        '         (select c.debito from clientes c where c.codigo = d.cli' +
        'ente) as ClienteDebito,'
      '         d.tipocliente,'
      '         d.estadoplaca,'
      '         d.placa,'
      '         d.nome,'
      '         d.rua,'
      '         d.endnumero,'
      '         d.endcomplemento,'
      '         d.bairro,'
      '         (select b.nome'
      '          from bairros b'
      '          where (b.estado  = d.estado) and'
      '                    (b.cidade = d.cidade) and'
      '                    (b.codigo = d.bairro)'
      '         ) as nomebairro,'
      '         d.cidade,'
      '         (select c.nome'
      '          from cidades c'
      '          where (c.estado = d.estado) and'
      '                    (c.codigo = d.cidade)'
      '         ) as nomecidade,'
      '         d.estado,'
      '         d.cep,'
      '         d.pessoatipo,'
      '         formatar_cpf_cnpj(d.pessoanumero) as pessoanumero,'
      '         d.fonenumero,'
      '         d.foneddd,'
      '         d.documento,'
      '         d.observacoes,'
      '         d.contrato,'
      '         d.vendedor,'
      '         d.agente,'
      '         d.plano,'
      '         d.valorprodutos as produtos,'
      '         (cast(null as numeric(11,2))) as acrescimo,'
      '         d.baseicms,'
      '         d.valoricms,'
      '         d.valorissqn,'
      ''
      '         coalesce(d.valorprodutos,0) +'
      '         (coalesce(d.valortotal,0) -'
      '          coalesce(d.valorvista,0)) -'
      '         coalesce(d.desconto,0) as totalprodutos,'
      ''
      '         (cast(null as Numeric(9,3))) as totalqtdeprodutos,'
      '         d.debitar,'
      '         d.creditar,'
      '         d.historico,'
      '         d.valorservicos,'
      '         d.irretido,'
      '         d.inssretido,'
      '         d.issretido,'
      '         d.cofinsretido,'
      '         d.pisretido,'
      '         d.csllretido,'
      '         d.totalbaseicmssubstituicao,'
      '         false as ok,'
      '         d.observacoescomplementar,'
      '         d.totalvaloricmssubstituicao'
      'from dadosfiscais d, notas n'
      'where (n.dadofiscal = d.numero) and'
      '          (n.filial       = :filial) and'
      '          (n.serie     = :serie) and'
      '          (n.numero = :numero)')
    RequestLive = True
    Left = 48
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'serie'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptUnknown
      end>
    object qryDadosFiscaisfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisserie: TStringField
      FieldName = 'serie'
      Size = 3
    end
    object qryDadosFiscaisnumeronota: TIntegerField
      FieldName = 'numeronota'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisnumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object qryDadosFiscaissituacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
    object qryDadosFiscaisfilialvenda: TIntegerField
      FieldName = 'filialvenda'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisvalortotal: TFloatField
      FieldName = 'valortotal'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaisvalorvista: TFloatField
      FieldName = 'valorvista'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaisdesconto: TFloatField
      FieldName = 'desconto'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaisvalorfrete: TFloatField
      FieldName = 'valorfrete'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaisseguro: TFloatField
      FieldName = 'seguro'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaisvaloripi: TFloatField
      FieldName = 'valoripi'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaisdespesasacessorias: TFloatField
      FieldName = 'despesasacessorias'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaiscodigofiscal: TIntegerField
      FieldName = 'codigofiscal'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisdescricaocfop: TStringField
      FieldName = 'descricaocfop'
      Size = 50
    end
    object qryDadosFiscaisestadocfo: TStringField
      FieldName = 'estadocfo'
      Size = 2
    end
    object qryDadosFiscaisfilialemissao: TIntegerField
      FieldName = 'filialemissao'
      DisplayFormat = '0'
    end
    object qryDadosFiscaiscodigonatureza: TIntegerField
      FieldName = 'codigonatureza'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisdescricaosemprodutos: TStringField
      FieldName = 'descricaosemprodutos'
      Size = 200
    end
    object qryDadosFiscaisdatasaida: TDateField
      Alignment = taCenter
      FieldName = 'datasaida'
      EditMask = '99/99/9999;1; '
    end
    object qryDadosFiscaisfornecedortransporte: TIntegerField
      FieldName = 'fornecedortransporte'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisfrete: TStringField
      FieldName = 'frete'
      Size = 1
    end
    object qryDadosFiscaiscliente: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisnomecliente: TStringField
      FieldName = 'nomecliente'
      Size = 50
    end
    object qryDadosFiscaistipocliente: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
    object qryDadosFiscaisestadoplaca: TStringField
      FieldName = 'estadoplaca'
      Size = 2
    end
    object qryDadosFiscaisplaca: TStringField
      FieldName = 'placa'
      Size = 10
    end
    object qryDadosFiscaisnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryDadosFiscaisrua: TStringField
      FieldName = 'rua'
      Size = 100
    end
    object qryDadosFiscaisbairro: TIntegerField
      FieldName = 'bairro'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisnomebairro: TStringField
      FieldName = 'nomebairro'
      Size = 50
    end
    object qryDadosFiscaiscidade: TIntegerField
      FieldName = 'cidade'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisnomecidade: TStringField
      FieldName = 'nomecidade'
      Size = 50
    end
    object qryDadosFiscaisestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object qryDadosFiscaiscep: TIntegerField
      FieldName = 'cep'
      DisplayFormat = '0'
    end
    object qryDadosFiscaispessoatipo: TStringField
      FieldName = 'pessoatipo'
      Size = 1
    end
    object qryDadosFiscaispessoanumero: TStringField
      DisplayWidth = 18
      FieldName = 'pessoanumero'
      Size = 18
    end
    object qryDadosFiscaisfonenumero: TIntegerField
      FieldName = 'fonenumero'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisfoneddd: TIntegerField
      FieldName = 'foneddd'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisdocumento: TStringField
      FieldName = 'documento'
    end
    object qryDadosFiscaisobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 350
    end
    object qryDadosFiscaiscontrato: TStringField
      FieldName = 'contrato'
    end
    object qryDadosFiscaisvendedor: TIntegerField
      FieldName = 'vendedor'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisagente: TIntegerField
      FieldName = 'agente'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisplano: TIntegerField
      FieldName = 'plano'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisprodutos: TFloatField
      FieldName = 'produtos'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaisacrescimo: TFloatField
      FieldName = 'acrescimo'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaisbaseicms: TFloatField
      FieldName = 'baseicms'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaisvaloricms: TFloatField
      FieldName = 'valoricms'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaisvalorissqn: TFloatField
      FieldName = 'valorissqn'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaistotalprodutos: TFloatField
      FieldName = 'totalprodutos'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaistotalqtdeprodutos: TFloatField
      FieldName = 'totalqtdeprodutos'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaisdebitar: TIntegerField
      FieldName = 'debitar'
      DisplayFormat = '0'
    end
    object qryDadosFiscaiscreditar: TIntegerField
      FieldName = 'creditar'
      DisplayFormat = '0'
    end
    object qryDadosFiscaishistorico: TIntegerField
      FieldName = 'historico'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisvalorservicos: TFloatField
      FieldName = 'valorservicos'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaisirretido: TFloatField
      FieldName = 'irretido'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaisinssretido: TFloatField
      FieldName = 'inssretido'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaisissretido: TFloatField
      FieldName = 'issretido'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaiscofinsretido: TFloatField
      FieldName = 'cofinsretido'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaispisretido: TFloatField
      FieldName = 'pisretido'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaiscsllretido: TFloatField
      FieldName = 'csllretido'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaistotalbaseicmssubstituicao: TFloatField
      FieldName = 'totalbaseicmssubstituicao'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaisobservacoescomplementar: TStringField
      FieldName = 'observacoescomplementar'
      Size = 500
    end
    object qryDadosFiscaistotalvaloricmssubstituicao: TFloatField
      FieldName = 'totalvaloricmssubstituicao'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaisdescricaonatureza: TStringField
      FieldName = 'descricaonatureza'
      Size = 50
    end
    object qryDadosFiscaisnatureza: TStringField
      DisplayWidth = 80
      FieldName = 'natureza'
      Size = 80
    end
    object qryDadosFiscaisclientecredito: TIntegerField
      FieldName = 'clientecredito'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisclientedebito: TIntegerField
      FieldName = 'clientedebito'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisendnumero: TIntegerField
      FieldName = 'endnumero'
    end
    object qryDadosFiscaisendcomplemento: TStringField
      FieldName = 'endcomplemento'
      Size = 100
    end
  end
  object qryProdutos: TtecQuery
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
      'select pd.dadofiscal,'
      '         pd.numero,'
      '         pd.produto,'
      '         p.codigovisual as produtovisual,'
      '         pd.filial,'
      '         pd.Movimento,'
      '         c.unidade,'
      '         pd.quantidade, '
      '         pd.quantidade as quantidadeantesgravar,'
      '         pd.precovenda,'
      '         pd.precotabela,'
      '         pd.valordescontoitem,'
      '         pd.descricaoprecovenda,'
      '         pd.aliquotaicms,'
      
        '         cast((pd.precovenda *(pd.aliquotaicms/100))as numeric(1' +
        '1,2)) as valoricms,'
      '         pd.fatorsubstituicao,'
      '         pd.icms,'
      '         pd.incidencia,'
      '         pd.origem,'
      '         p.descricao,'
      
        '         (select gr.descricao from grades gr where gr.codigo = c' +
        '.grade1) as Linha,'
      
        '         (select gr.descricao from grades gr where gr.codigo = c' +
        '.grade2) as Coluna, '
      '         p.valorgrade1,'
      '         p.valorgrade2,'
      '         pd.ipi,'
      '         pd.aliquotaipi,'
      '         pd.valoripi,'
      '         pd.classificacaofiscal,'
      '         pd.baseicms,'
      '         pd.reducaobase,'
      '         pd.percentualreducaobase,'
      '        c.composto,'
      '        c.discriminarcomposto,'
      '        c.discriminarpreco,'
      '        0 as tipopreco,'
      '        pd.codigonota,'
      '        pd.codigofiscal,'
      
        '        (select np.serie from notaspag np where np.codigo = pd.c' +
        'odigonota) as SerieNotaFiscalEntrada,'
      
        '        (select np.numero from notaspag np where np.codigo = pd.' +
        'codigonota) as NumeroNotaFiscalEntrada,'
      '        round(pd.precovenda * pd.quantidade ,2) as produtototal,'
      '        0.00 as baseicmssubst,'
      '        0.00 as valoricmssubst,'
      '        True as ValorIPIDigitado,'
      '        True as ValorReducaoBasedigitada,'
      '        False as OK'
      'from produtosdadosfiscais pd, produtos p, caracteristicas c'
      'where (pd.dadofiscal = :dadofiscal) and'
      '           (pd.produto = p.codigo) and'
      '           (p.caracteristica = c.codigo)'
      'order by pd.numero')
    RequestLive = True
    Left = 48
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dadofiscal'
        ParamType = ptUnknown
      end>
    object qryProdutosdadofiscal: TIntegerField
      FieldName = 'dadofiscal'
      DisplayFormat = '0'
    end
    object qryProdutosnumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryProdutosproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryProdutosprodutovisual: TStringField
      FieldName = 'produtovisual'
      Size = 30
    end
    object qryProdutosfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryProdutosmovimento: TIntegerField
      FieldName = 'movimento'
      DisplayFormat = '0'
    end
    object qryProdutosunidade: TStringField
      FieldName = 'unidade'
      Size = 8
    end
    object qryProdutosquantidade: TFloatField
      FieldName = 'quantidade'
      DisplayFormat = '0.00'
    end
    object qryProdutosquantidadeantesgravar: TFloatField
      FieldName = 'quantidadeantesgravar'
      DisplayFormat = '0.00'
    end
    object qryProdutosprecovenda: TFloatField
      FieldName = 'precovenda'
      DisplayFormat = '0.00'
    end
    object qryProdutosprecotabela: TFloatField
      FieldName = 'precotabela'
      DisplayFormat = '0.00'
    end
    object qryProdutosdescricaoprecovenda: TStringField
      FieldName = 'descricaoprecovenda'
      Size = 40
    end
    object qryProdutosaliquotaicms: TFloatField
      FieldName = 'aliquotaicms'
      DisplayFormat = '0.00'
    end
    object qryProdutosfatorsubstituicao: TFloatField
      FieldName = 'fatorsubstituicao'
      DisplayFormat = '0.00'
    end
    object qryProdutosicms: TIntegerField
      FieldName = 'icms'
      DisplayFormat = '0'
    end
    object qryProdutosincidencia: TStringField
      FieldName = 'incidencia'
      Size = 2
    end
    object qryProdutosOrigem: TIntegerField
      FieldName = 'Origem'
    end
    object qryProdutosdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object qryProdutoslinha: TStringField
      FieldName = 'linha'
      Size = 50
    end
    object qryProdutoscoluna: TStringField
      FieldName = 'coluna'
      Size = 50
    end
    object qryProdutosvalorgrade1: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade1'
      Size = 30
    end
    object qryProdutosvalorgrade2: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade2'
      Size = 30
    end
    object qryProdutosipi: TIntegerField
      FieldName = 'ipi'
      DisplayFormat = '0'
    end
    object qryProdutosaliquotaipi: TFloatField
      FieldName = 'aliquotaipi'
      DisplayFormat = '0.00'
    end
    object qryProdutosvaloripi: TFloatField
      FieldName = 'valoripi'
      DisplayFormat = '0.00'
    end
    object qryProdutosclassificacaofiscal: TStringField
      FieldName = 'classificacaofiscal'
      Size = 10
    end
    object qryProdutosbaseicms: TFloatField
      FieldName = 'baseicms'
      DisplayFormat = '0.00'
    end
    object qryProdutosreducaobase: TFloatField
      FieldName = 'reducaobase'
      DisplayFormat = '0.00'
    end
    object qryProdutospercentualreducaobase: TFloatField
      FieldName = 'percentualreducaobase'
      DisplayFormat = '0.00'
    end
    object qryProdutoscomposto: TBooleanField
      FieldName = 'composto'
    end
    object qryProdutosdiscriminarcomposto: TStringField
      FieldName = 'discriminarcomposto'
      Size = 1
    end
    object qryProdutosdiscriminarpreco: TBooleanField
      FieldName = 'discriminarpreco'
    end
    object qryProdutostipopreco: TIntegerField
      FieldName = 'tipopreco'
      DisplayFormat = '0'
    end
    object qryProdutoscodigonota: TIntegerField
      FieldName = 'codigonota'
      DisplayFormat = '0'
    end
    object qryProdutosserienotafiscalentrada: TStringField
      FieldName = 'serienotafiscalentrada'
      Size = 50
    end
    object qryProdutosnumeronotafiscalentrada: TIntegerField
      FieldName = 'numeronotafiscalentrada'
      DisplayFormat = '0'
    end
    object qryProdutosprodutototal: TFloatField
      FieldName = 'produtototal'
      DisplayFormat = '0.00'
    end
    object qryProdutosbaseicmssubst: TFloatField
      FieldName = 'baseicmssubst'
      DisplayFormat = '0.00'
    end
    object qryProdutosvaloricmssubst: TFloatField
      FieldName = 'valoricmssubst'
      DisplayFormat = '0.00'
    end
    object qryProdutosvaloripidigitado: TBooleanField
      FieldName = 'valoripidigitado'
    end
    object qryProdutosvalorreducaobasedigitada: TBooleanField
      FieldName = 'valorreducaobasedigitada'
    end
    object qryProdutosvaloricms: TFloatField
      FieldName = 'valoricms'
      DisplayFormat = '0.00'
    end
    object qryProdutosok: TBooleanField
      FieldName = 'ok'
    end
    object qryProdutosvalordescontoitem: TFloatField
      FieldName = 'valordescontoitem'
      DisplayFormat = '0.00'
    end
    object qryProdutoscodigofiscal: TIntegerField
      FieldName = 'codigofiscal'
      DisplayFormat = '0'
    end
  end
  object dsrDadosFiscais: TtecDataSource
    DataSet = qryDadosFiscais
    OnDataChange = dsrDadosFiscaisDataChange
    Left = 48
    Top = 64
  end
  object dsrProdutos: TtecDataSource
    DataSet = qryProdutos
    Left = 48
    Top = 160
  end
  object qryConsultadadosFiscais: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryConsultadadosFiscaisAfterOpen
    AfterClose = qryConsultadadosFiscaisAfterClose
    BeforeInsert = qryConsultadadosFiscaisBeforeInsert
    AfterCancel = qryConsultadadosFiscaisAfterCancel
    AfterScroll = qryConsultadadosFiscaisAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select n.filial,'
      '         n.serie,'
      '         n.numero as numeronota,'
      '         d.numero,'
      '         d.data,'
      '         d.situacao,'
      '         d.filialvenda,'
      '         d.valortotal,'
      '         d.valorvista,'
      '         d.desconto,'
      '         d.valorfrete,'
      '         d.seguro,'
      '         d.valoripi,'
      '         d.despesasacessorias,'
      '         d.codigofiscal,'
      
        '         (select cf.descricao from codigosfiscais cf where cf.co' +
        'digo = d.codigofiscal) as descricaocfop,'
      '         d.estadocfo,'
      '         d.filialemissao,'
      '         d.natureza,'
      ''
      '         CAST(CASE WHEN d.CodigoNatureza IS NOT NULL'
      '                   THEN (SELECT na.Descricao'
      '                            FROM Naturezas na'
      
        '                            WHERE na.Codigo = d.Codigonatureza) ' +
        '|| '#39' - COMPLEMENTAR'#39
      '                   ELSE '#39'COMPLEMENTAR'#39
      '              END AS VARCHAR) AS DescricaoNatureza,'
      ''
      '         d.codigonatureza,'
      '         d.descricaosemprodutos,'
      '         d.datasaida,'
      '         d.fornecedortransporte,'
      '         d.frete,'
      '         d.cliente,'
      
        '         (select c.nome from clientes c where c.codigo = d.clien' +
        'te) as nomecliente,'
      
        '         (select c.credito from clientes c where c.codigo = d.cl' +
        'iente) as ClienteCredito,'
      
        '         (select c.debito from clientes c where c.codigo = d.cli' +
        'ente) as ClienteDebito,'
      '         d.tipocliente,'
      '         d.estadoplaca,'
      '         d.placa,'
      '         d.nome,'
      '         d.rua,'
      '         d.endnumero,'
      '         d.endcomplemento,'
      '         d.bairro,'
      '         (select b.nome'
      '          from bairros b'
      '          where (b.estado  = d.estado) and'
      '                    (b.cidade = d.cidade) and'
      '                    (b.codigo = d.bairro)'
      '         ) as nomebairro,'
      '         d.cidade,'
      '         (select c.nome'
      '          from cidades c'
      '          where (c.estado = d.estado) and'
      '                    (c.codigo = d.cidade)'
      '         ) as nomecidade,'
      '         d.estado,'
      '         d.cep,'
      '         d.pessoatipo,'
      '         formatar_cpf_cnpj(d.pessoanumero) as pessoanumero,'
      '         d.fonenumero,'
      '         d.foneddd,'
      '         d.documento,'
      '         d.observacoes,'
      '         d.contrato,'
      '         d.vendedor,'
      '         d.agente,'
      '         d.plano,'
      '         d.valorprodutos as produtos,'
      '         (cast(null as numeric(11,2))) as acrescimo,'
      '         d.baseicms,'
      '         d.valoricms,'
      '         d.valorissqn,'
      ''
      '         coalesce(d.valorprodutos,0) +'
      '         (coalesce(d.valortotal,0) -'
      '          coalesce(d.valorvista,0)) -'
      '         coalesce(d.desconto,0) as totalprodutos,'
      ''
      '         (cast(null as Numeric(9,3))) as totalqtdeprodutos,'
      '         d.debitar,'
      '         d.creditar,'
      '         d.historico,'
      '         d.valorservicos,'
      '         d.irretido,'
      '         d.inssretido,'
      '         d.issretido,'
      '         d.cofinsretido,'
      '         d.pisretido,'
      '         d.csllretido,'
      '         d.totalbaseicmssubstituicao,'
      '         false as ok,'
      '         d.observacoescomplementar,'
      '         d.totalvaloricmssubstituicao'
      'from dadosfiscais d, notas n'
      'where (n.dadofiscal = d.numero) and'
      '          (n.filial       = :filial) and'
      '          (n.serie     = :serie) and'
      '          (n.numero = :numero)')
    RequestLive = True
    Left = 152
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'serie'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptUnknown
      end>
    object qryConsultadadosFiscaisfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryConsultadadosFiscaisserie: TStringField
      FieldName = 'serie'
      Size = 3
    end
    object qryConsultadadosFiscaisnumeronota: TIntegerField
      FieldName = 'numeronota'
      DisplayFormat = '0'
    end
    object qryConsultadadosFiscaisnumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryConsultadadosFiscaisdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object qryConsultadadosFiscaissituacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
    object qryConsultadadosFiscaisfilialvenda: TIntegerField
      FieldName = 'filialvenda'
      DisplayFormat = '0'
    end
    object qryConsultadadosFiscaisvalortotal: TFloatField
      FieldName = 'valortotal'
      DisplayFormat = '0.00'
    end
    object qryConsultadadosFiscaisvalorvista: TFloatField
      FieldName = 'valorvista'
      DisplayFormat = '0.00'
    end
    object qryConsultadadosFiscaisdesconto: TFloatField
      FieldName = 'desconto'
      DisplayFormat = '0.00'
    end
    object qryConsultadadosFiscaisvalorfrete: TFloatField
      FieldName = 'valorfrete'
      DisplayFormat = '0.00'
    end
    object qryConsultadadosFiscaisseguro: TFloatField
      FieldName = 'seguro'
      DisplayFormat = '0.00'
    end
    object qryConsultadadosFiscaisvaloripi: TFloatField
      FieldName = 'valoripi'
      DisplayFormat = '0.00'
    end
    object qryConsultadadosFiscaisdespesasacessorias: TFloatField
      FieldName = 'despesasacessorias'
      DisplayFormat = '0.00'
    end
    object qryConsultadadosFiscaiscodigofiscal: TIntegerField
      FieldName = 'codigofiscal'
      DisplayFormat = '0'
    end
    object qryConsultadadosFiscaisdescricaocfop: TStringField
      FieldName = 'descricaocfop'
      Size = 50
    end
    object qryConsultadadosFiscaisestadocfo: TStringField
      FieldName = 'estadocfo'
      Size = 2
    end
    object qryConsultadadosFiscaisfilialemissao: TIntegerField
      FieldName = 'filialemissao'
      DisplayFormat = '0'
    end
    object qryConsultadadosFiscaiscodigonatureza: TIntegerField
      FieldName = 'codigonatureza'
      DisplayFormat = '0'
    end
    object qryConsultadadosFiscaisdescricaosemprodutos: TStringField
      FieldName = 'descricaosemprodutos'
      Size = 200
    end
    object qryConsultadadosFiscaisdatasaida: TDateField
      Alignment = taCenter
      FieldName = 'datasaida'
      EditMask = '99/99/9999;1; '
    end
    object qryConsultadadosFiscaisfornecedortransporte: TIntegerField
      FieldName = 'fornecedortransporte'
      DisplayFormat = '0'
    end
    object qryConsultadadosFiscaisfrete: TStringField
      FieldName = 'frete'
      Size = 1
    end
    object qryConsultadadosFiscaiscliente: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object qryConsultadadosFiscaisnomecliente: TStringField
      FieldName = 'nomecliente'
      Size = 50
    end
    object qryConsultadadosFiscaistipocliente: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
    object qryConsultadadosFiscaisestadoplaca: TStringField
      FieldName = 'estadoplaca'
      Size = 2
    end
    object qryConsultadadosFiscaisplaca: TStringField
      FieldName = 'placa'
      Size = 10
    end
    object qryConsultadadosFiscaisnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultadadosFiscaisrua: TStringField
      FieldName = 'rua'
      Size = 100
    end
    object qryConsultadadosFiscaisbairro: TIntegerField
      FieldName = 'bairro'
      DisplayFormat = '0'
    end
    object qryConsultadadosFiscaisnomebairro: TStringField
      FieldName = 'nomebairro'
      Size = 50
    end
    object qryConsultadadosFiscaiscidade: TIntegerField
      FieldName = 'cidade'
      DisplayFormat = '0'
    end
    object qryConsultadadosFiscaisnomecidade: TStringField
      FieldName = 'nomecidade'
      Size = 50
    end
    object qryConsultadadosFiscaisestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object qryConsultadadosFiscaiscep: TIntegerField
      FieldName = 'cep'
      DisplayFormat = '0'
    end
    object qryConsultadadosFiscaispessoatipo: TStringField
      FieldName = 'pessoatipo'
      Size = 1
    end
    object qryConsultadadosFiscaispessoanumero: TStringField
      DisplayWidth = 18
      FieldName = 'pessoanumero'
      Size = 18
    end
    object qryConsultadadosFiscaisfonenumero: TIntegerField
      FieldName = 'fonenumero'
      DisplayFormat = '0'
    end
    object qryConsultadadosFiscaisfoneddd: TIntegerField
      FieldName = 'foneddd'
      DisplayFormat = '0'
    end
    object qryConsultadadosFiscaisdocumento: TStringField
      FieldName = 'documento'
    end
    object qryConsultadadosFiscaisobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 350
    end
    object qryConsultadadosFiscaiscontrato: TStringField
      FieldName = 'contrato'
    end
    object qryConsultadadosFiscaisvendedor: TIntegerField
      FieldName = 'vendedor'
      DisplayFormat = '0'
    end
    object qryConsultadadosFiscaisagente: TIntegerField
      FieldName = 'agente'
      DisplayFormat = '0'
    end
    object qryConsultadadosFiscaisplano: TIntegerField
      FieldName = 'plano'
      DisplayFormat = '0'
    end
    object qryConsultadadosFiscaisprodutos: TFloatField
      FieldName = 'produtos'
      DisplayFormat = '0.00'
    end
    object qryConsultadadosFiscaisacrescimo: TFloatField
      FieldName = 'acrescimo'
      DisplayFormat = '0.00'
    end
    object qryConsultadadosFiscaisbaseicms: TFloatField
      FieldName = 'baseicms'
      DisplayFormat = '0.00'
    end
    object qryConsultadadosFiscaisvaloricms: TFloatField
      FieldName = 'valoricms'
      DisplayFormat = '0.00'
    end
    object qryConsultadadosFiscaisvalorissqn: TFloatField
      FieldName = 'valorissqn'
      DisplayFormat = '0.00'
    end
    object qryConsultadadosFiscaistotalprodutos: TFloatField
      FieldName = 'totalprodutos'
      DisplayFormat = '0.00'
    end
    object qryConsultadadosFiscaistotalqtdeprodutos: TFloatField
      FieldName = 'totalqtdeprodutos'
      DisplayFormat = '0.00'
    end
    object qryConsultadadosFiscaisdebitar: TIntegerField
      FieldName = 'debitar'
      DisplayFormat = '0'
    end
    object qryConsultadadosFiscaiscreditar: TIntegerField
      FieldName = 'creditar'
      DisplayFormat = '0'
    end
    object qryConsultadadosFiscaishistorico: TIntegerField
      FieldName = 'historico'
      DisplayFormat = '0'
    end
    object qryConsultadadosFiscaisvalorservicos: TFloatField
      FieldName = 'valorservicos'
      DisplayFormat = '0.00'
    end
    object qryConsultadadosFiscaisirretido: TFloatField
      FieldName = 'irretido'
      DisplayFormat = '0.00'
    end
    object qryConsultadadosFiscaisinssretido: TFloatField
      FieldName = 'inssretido'
      DisplayFormat = '0.00'
    end
    object qryConsultadadosFiscaisissretido: TFloatField
      FieldName = 'issretido'
      DisplayFormat = '0.00'
    end
    object qryConsultadadosFiscaiscofinsretido: TFloatField
      FieldName = 'cofinsretido'
      DisplayFormat = '0.00'
    end
    object qryConsultadadosFiscaispisretido: TFloatField
      FieldName = 'pisretido'
      DisplayFormat = '0.00'
    end
    object qryConsultadadosFiscaiscsllretido: TFloatField
      FieldName = 'csllretido'
      DisplayFormat = '0.00'
    end
    object qryConsultadadosFiscaistotalbaseicmssubstituicao: TFloatField
      FieldName = 'totalbaseicmssubstituicao'
      DisplayFormat = '0.00'
    end
    object qryConsultadadosFiscaisobservacoescomplementar: TStringField
      FieldName = 'observacoescomplementar'
      Size = 500
    end
    object qryConsultadadosFiscaistotalvaloricmssubstituicao: TFloatField
      FieldName = 'totalvaloricmssubstituicao'
      DisplayFormat = '0.00'
    end
    object qryConsultadadosFiscaisdescricaonatureza: TStringField
      FieldName = 'descricaonatureza'
      Size = 50
    end
    object qryConsultadadosFiscaisnatureza: TStringField
      FieldName = 'natureza'
      Size = 40
    end
    object qryConsultadadosFiscaisclientecredito: TIntegerField
      FieldName = 'clientecredito'
      DisplayFormat = '0'
    end
    object qryConsultadadosFiscaisclientedebito: TIntegerField
      FieldName = 'clientedebito'
      DisplayFormat = '0'
    end
    object qryConsultadadosFiscaisendnumero: TIntegerField
      FieldName = 'endnumero'
    end
    object qryConsultadadosFiscaisendcomplemento: TStringField
      FieldName = 'endcomplemento'
      Size = 100
    end
  end
  object qryConsultaProdutos: TtecQuery
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
      'select pd.dadofiscal,'
      '         pd.numero,'
      '         pd.produto,'
      '         p.codigovisual as produtovisual,'
      '         pd.filial,'
      '         pd.Movimento,'
      '         c.unidade,'
      '         pd.quantidade, '
      '         pd.quantidade as quantidadeantesgravar,'
      '         pd.precovenda,'
      '         pd.precotabela,'
      '         pd.descricaoprecovenda,'
      '         pd.valordescontoitem,'
      '         pd.aliquotaicms,'
      
        '         cast((pd.precovenda *(pd.aliquotaicms/100))as numeric(1' +
        '1,2)) as valoricms,'
      '         pd.fatorsubstituicao,'
      '         pd.icms,'
      '         pd.incidencia,'
      '         pd.origem,'
      '         p.descricao,'
      
        '         (select gr.descricao from grades gr where gr.codigo = c' +
        '.grade1) as Linha,'
      
        '         (select gr.descricao from grades gr where gr.codigo = c' +
        '.grade2) as Coluna, '
      '         p.valorgrade1,'
      '         p.valorgrade2,'
      '         pd.ipi,'
      '         pd.aliquotaipi,'
      '         pd.valoripi,'
      '         pd.classificacaofiscal,'
      '         pd.baseicms,'
      '         pd.reducaobase,'
      '         pd.percentualreducaobase,'
      '        c.composto,'
      '        c.discriminarcomposto,'
      '        c.discriminarpreco,'
      '        0 as tipopreco,'
      '        pd.codigonota,'
      '        pd.codigofiscal,'
      
        '        (select np.serie from notaspag np where np.codigo = pd.c' +
        'odigonota) as SerieNotaFiscalEntrada,'
      
        '        (select np.numero from notaspag np where np.codigo = pd.' +
        'codigonota) as NumeroNotaFiscalEntrada,'
      '        round(pd.precovenda * pd.quantidade ,2) as produtototal,'
      '        0.00 as baseicmssubst,'
      '        0.00 as valoricmssubst,'
      '        True as ValorIPIDigitado,'
      '        True as ValorReducaoBasedigitada,'
      '        False as OK'
      'from produtosdadosfiscais pd, produtos p, caracteristicas c'
      'where (pd.dadofiscal = :dadofiscal) and'
      '           (pd.produto = p.codigo) and'
      '           (p.caracteristica = c.codigo)'
      'order by pd.numero')
    RequestLive = True
    Left = 152
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dadofiscal'
        ParamType = ptUnknown
      end>
    object qryConsultaProdutosdadofiscal: TIntegerField
      FieldName = 'dadofiscal'
    end
    object qryConsultaProdutosnumero: TIntegerField
      FieldName = 'numero'
    end
    object qryConsultaProdutosproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryConsultaProdutosprodutovisual: TStringField
      FieldName = 'produtovisual'
      Size = 30
    end
    object qryConsultaProdutosfilial: TIntegerField
      FieldName = 'filial'
    end
    object qryConsultaProdutosmovimento: TIntegerField
      FieldName = 'movimento'
    end
    object qryConsultaProdutosunidade: TStringField
      FieldName = 'unidade'
      Size = 2
    end
    object qryConsultaProdutosquantidade: TFloatField
      FieldName = 'quantidade'
    end
    object qryConsultaProdutosquantidadeantesgravar: TFloatField
      FieldName = 'quantidadeantesgravar'
    end
    object qryConsultaProdutosprecovenda: TFloatField
      FieldName = 'precovenda'
    end
    object qryConsultaProdutosprecotabela: TFloatField
      FieldName = 'precotabela'
    end
    object qryConsultaProdutosdescricaoprecovenda: TStringField
      FieldName = 'descricaoprecovenda'
      Size = 40
    end
    object qryConsultaProdutosaliquotaicms: TFloatField
      FieldName = 'aliquotaicms'
    end
    object qryConsultaProdutosfatorsubstituicao: TFloatField
      FieldName = 'fatorsubstituicao'
    end
    object qryConsultaProdutosicms: TIntegerField
      FieldName = 'icms'
    end
    object qryConsultaProdutosincidencia: TStringField
      FieldName = 'incidencia'
      Size = 2
    end
    object qryConsultaProdutosdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object qryConsultaProdutoslinha: TStringField
      FieldName = 'linha'
      Size = 50
    end
    object qryConsultaProdutoscoluna: TStringField
      FieldName = 'coluna'
      Size = 50
    end
    object qryConsultaProdutosvalorgrade1: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade1'
      Size = 30
    end
    object qryConsultaProdutosvalorgrade2: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade2'
      Size = 30
    end
    object qryConsultaProdutosipi: TIntegerField
      FieldName = 'ipi'
    end
    object qryConsultaProdutosaliquotaipi: TFloatField
      FieldName = 'aliquotaipi'
    end
    object qryConsultaProdutosvaloripi: TFloatField
      FieldName = 'valoripi'
    end
    object qryConsultaProdutosclassificacaofiscal: TStringField
      FieldName = 'classificacaofiscal'
      Size = 10
    end
    object qryConsultaProdutosbaseicms: TFloatField
      FieldName = 'baseicms'
    end
    object qryConsultaProdutosreducaobase: TFloatField
      FieldName = 'reducaobase'
    end
    object qryConsultaProdutospercentualreducaobase: TFloatField
      FieldName = 'percentualreducaobase'
    end
    object qryConsultaProdutoscomposto: TBooleanField
      FieldName = 'composto'
    end
    object qryConsultaProdutosdiscriminarcomposto: TStringField
      FieldName = 'discriminarcomposto'
      Size = 1
    end
    object qryConsultaProdutosdiscriminarpreco: TBooleanField
      FieldName = 'discriminarpreco'
    end
    object qryConsultaProdutostipopreco: TIntegerField
      FieldName = 'tipopreco'
    end
    object qryConsultaProdutoscodigonota: TIntegerField
      FieldName = 'codigonota'
    end
    object qryConsultaProdutosserienotafiscalentrada: TStringField
      FieldName = 'serienotafiscalentrada'
      Size = 50
    end
    object qryConsultaProdutosnumeronotafiscalentrada: TIntegerField
      FieldName = 'numeronotafiscalentrada'
    end
    object qryConsultaProdutosprodutototal: TFloatField
      FieldName = 'produtototal'
    end
    object qryConsultaProdutosbaseicmssubst: TFloatField
      FieldName = 'baseicmssubst'
    end
    object qryConsultaProdutosvaloricmssubst: TFloatField
      FieldName = 'valoricmssubst'
    end
    object qryConsultaProdutosvaloripidigitado: TBooleanField
      FieldName = 'valoripidigitado'
    end
    object qryConsultaProdutosvalorreducaobasedigitada: TBooleanField
      FieldName = 'valorreducaobasedigitada'
    end
    object qryConsultaProdutosvaloricms: TFloatField
      FieldName = 'valoricms'
    end
    object qryConsultaProdutosok: TBooleanField
      FieldName = 'ok'
    end
    object qryConsultaProdutosvalordescontoitem: TFloatField
      FieldName = 'valordescontoitem'
    end
    object qryConsultaProdutoscodigofiscal: TIntegerField
      FieldName = 'codigofiscal'
    end
    object qryConsultaProdutosOrigem: TIntegerField
      FieldName = 'Origem'
    end
  end
  object dsrConsultaDadosFiscais: TtecDataSource
    DataSet = qryConsultadadosFiscais
    Left = 152
    Top = 64
  end
  object dsrConsultaProdutos: TtecDataSource
    DataSet = qryConsultaProdutos
    OnDataChange = dsrConsultaProdutosDataChange
    Left = 152
    Top = 160
  end
  object spcDadosFiscaisProximo: TtecQuery
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
      'select dadosfiscais_proximonumero() as numero')
    RequestLive = False
    Left = 392
    Top = 264
    object spcDadosFiscaisProximonumero: TIntegerField
      FieldName = 'numero'
    end
  end
  object qryNotas: TtecQuery
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
      'select n.filial,'
      '       n.serie,'
      '       n.numero,'
      '       n.dadofiscal'
      'from notas n'
      'where (n.filial  = :filial) and'
      '      (n.serie = :serie) and'
      '      (n.numero = :numero)')
    RequestLive = True
    Left = 48
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'serie'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end>
    object qryNotasfilial: TIntegerField
      FieldName = 'filial'
    end
    object qryNotasserie: TStringField
      FieldName = 'serie'
      Size = 3
    end
    object qryNotasnumero: TIntegerField
      FieldName = 'numero'
    end
    object qryNotasdadofiscal: TIntegerField
      FieldName = 'dadofiscal'
    end
  end
  object dsrNotas: TtecDataSource
    DataSet = qryNotas
    Left = 48
    Top = 272
  end
  object dsrCalculosDadosFiscais: TtecDataSource
    Left = 48
    Top = 328
  end
  object qrySeriesFiliais: TtecQuery
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
      'select   filial,'
      '         valor,'
      '         numeroinicial,'
      '         numerofinal,'
      '         modelonota'
      'from seriesfiliais'
      'where (filial = :filial) and'
      '          (valor = :Serie)')
    RequestLive = True
    Left = 152
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Serie'
        ParamType = ptUnknown
      end>
    object qrySeriesFiliaisfilial: TIntegerField
      FieldName = 'filial'
    end
    object qrySeriesFiliaisvalor: TStringField
      FieldName = 'valor'
      Size = 3
    end
    object qrySeriesFiliaisnumeroinicial: TIntegerField
      FieldName = 'numeroinicial'
      DisplayFormat = '0'
    end
    object qrySeriesFiliaisnumerofinal: TIntegerField
      FieldName = 'numerofinal'
      DisplayFormat = '0'
    end
    object qrySeriesFiliaismodelonota: TIntegerField
      FieldName = 'modelonota'
      DisplayFormat = '0'
    end
  end
  object qryProcurarNota: TtecQuery
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
      '('
      'select n.filial,'
      '       n.serie,'
      '       n.numero'
      'from notas n'
      'where (n.filial = :Filial) and'
      '      (n.serie  = :Serie) and'
      '      (n.numero = :Numero)'
      ')'
      'union'
      '('
      'select filial,'
      '       serie,'
      '       numero'
      'from notaspag'
      'where filial = :Filial'
      '  and serie  = :Serie'
      '  and numero = :Numero'
      '  and permitirimprimir'
      ')')
    RequestLive = False
    Left = 152
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Serie'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Numero'
        ParamType = ptUnknown
      end>
    object qryProcurarNotafilial: TIntegerField
      FieldName = 'filial'
    end
    object qryProcurarNotaserie: TStringField
      FieldName = 'serie'
      Size = 3
    end
    object qryProcurarNotanumero: TIntegerField
      FieldName = 'numero'
    end
  end
  object qryProcuraProduto: TtecQuery
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
      'select p.codigo'
      'from produtos p'
      
        'where (upper(to_ascii(codigovisual,'#39'latin1'#39')) = upper(to_ascii(:' +
        'codigovisual,'#39'latin1'#39')))')
    RequestLive = False
    Left = 152
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigovisual'
        ParamType = ptUnknown
      end>
    object qryProcuraProdutocodigo: TLargeintField
      FieldName = 'codigo'
      Required = True
    end
  end
end
