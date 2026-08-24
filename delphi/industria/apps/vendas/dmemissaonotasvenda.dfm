inherited dtmEmissaoNotasVenda: TdtmEmissaoNotasVenda
  OldCreateOrder = False
  Left = 501
  Top = 205
  Height = 655
  Width = 939
  object qryProdutosDadosFiscais: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterInsert = qryProdutosDadosFiscaisAfterInsert
    AfterPost = qryProdutosDadosFiscaisAfterPost
    AfterDelete = qryProdutosDadosFiscaisAfterDelete
    OnCalcFields = qryProdutosDadosFiscaisCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select pdf.*,'
      '       '#39#39' as codigovisual,'
      '       '#39#39' as pedidocliente,'
      '       '#39#39' as produtocliente,'
      '       cast(null as numeric(11,3)) as pedida,'
      '       cast(null as numeric(11,3)) as entregue,'
      '       cast('#39' '#39' as char(1)) as origemproduto'
      'from produtosdadosfiscais pdf'
      'where pdf.dadofiscal = :dadofiscal'
      'order by pdf.numero')
    RequestLive = True
    Left = 144
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dadofiscal'
        ParamType = ptUnknown
      end>
    object qryProdutosDadosFiscaisdadofiscal: TIntegerField
      FieldName = 'dadofiscal'
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaisnumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaisproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryProdutosDadosFiscaisfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaisvendedor: TIntegerField
      FieldName = 'vendedor'
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaisentregar: TBooleanField
      FieldName = 'entregar'
    end
    object qryProdutosDadosFiscaisquantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisprecovenda: TFloatField
      DisplayLabel = 'pre'#231'o de venda'
      FieldName = 'precovenda'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisprecotabela: TFloatField
      FieldName = 'precotabela'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisdescricaoprecovenda: TStringField
      FieldName = 'descricaoprecovenda'
      Size = 40
    end
    object qryProdutosDadosFiscaisreserva: TIntegerField
      FieldName = 'reserva'
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaisaliquotaicms: TFloatField
      FieldName = 'aliquotaicms'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisreducaobase: TFloatField
      FieldName = 'reducaobase'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisincidencia: TStringField
      FieldName = 'incidencia'
      Size = 2
    end
    object qryProdutosDadosFiscaisorigem: TIntegerField
      FieldName = 'origem'
    end
    object qryProdutosDadosFiscaisicms: TIntegerField
      FieldName = 'icms'
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaismovimento: TIntegerField
      FieldName = 'movimento'
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaisbaseicms: TFloatField
      FieldName = 'baseicms'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisaliquotaipi: TFloatField
      FieldName = 'aliquotaipi'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisvaloripi: TFloatField
      FieldName = 'valoripi'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisclassificacaofiscal: TStringField
      FieldName = 'classificacaofiscal'
      Size = 8
    end
    object qryProdutosDadosFiscaisipi: TIntegerField
      FieldName = 'ipi'
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaiscomposto: TBooleanField
      FieldName = 'composto'
    end
    object qryProdutosDadosFiscaisdiscriminarcomposto: TStringField
      FieldName = 'discriminarcomposto'
      Size = 1
    end
    object qryProdutosDadosFiscaisdiscriminarpreco: TBooleanField
      FieldName = 'discriminarpreco'
    end
    object qryProdutosDadosFiscaisfatorsubstituicao: TFloatField
      FieldName = 'fatorsubstituicao'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaispercentualreducaobase: TFloatField
      FieldName = 'percentualreducaobase'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaiscodigonota: TIntegerField
      FieldName = 'codigonota'
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaisbrinde: TBooleanField
      FieldName = 'brinde'
    end
    object qryProdutosDadosFiscaisacrescimo: TFloatField
      FieldName = 'acrescimo'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisdesconto: TFloatField
      FieldName = 'desconto'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisfrete: TFloatField
      FieldName = 'frete'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisseguro: TFloatField
      FieldName = 'seguro'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaissubstituicaoipi: TBooleanField
      FieldName = 'substituicaoipi'
    end
    object qryProdutosDadosFiscaisdespesasacessorias: TFloatField
      FieldName = 'despesasacessorias'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisvalordescontoitem: TFloatField
      FieldName = 'valordescontoitem'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisnatureza: TIntegerField
      FieldName = 'natureza'
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaiscodigofiscal: TIntegerField
      FieldName = 'codigofiscal'
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaisosp: TIntegerField
      FieldName = 'osp'
      Required = True
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaisccf: TIntegerField
      FieldName = 'ccf'
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaiscst: TIntegerField
      FieldName = 'cst'
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaissequenciaipi: TIntegerField
      FieldName = 'sequenciaipi'
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaisdescricaoproduto: TStringField
      FieldName = 'descricaoproduto'
      Size = 162
    end
    object qryProdutosDadosFiscaisgenero: TIntegerField
      FieldName = 'genero'
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaisextipi: TStringField
      FieldName = 'extipi'
      Size = 3
    end
    object qryProdutosDadosFiscaisicmsmodalidade: TIntegerField
      FieldName = 'icmsmodalidade'
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaisicmsmodsubst: TIntegerField
      FieldName = 'icmsmodsubst'
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaistribcodigoean: TStringField
      FieldName = 'tribcodigoean'
      Size = 14
    end
    object qryProdutosDadosFiscaistribunidade: TStringField
      FieldName = 'tribunidade'
      Size = 6
    end
    object qryProdutosDadosFiscaistribquantidade: TFloatField
      FieldName = 'tribquantidade'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaistribunitario: TFloatField
      FieldName = 'tribunitario'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisenquadramento: TIntegerField
      FieldName = 'enquadramento'
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaisipicst: TStringField
      FieldName = 'ipicst'
      Size = 2
    end
    object qryProdutosDadosFiscaisipibasecalculo: TFloatField
      FieldName = 'ipibasecalculo'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisiibasecalculo: TFloatField
      FieldName = 'iibasecalculo'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisiidespaduaneira: TFloatField
      FieldName = 'iidespaduaneira'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisiivalor: TFloatField
      FieldName = 'iivalor'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisiiiof: TFloatField
      FieldName = 'iiiof'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaispiscst: TStringField
      FieldName = 'piscst'
      Size = 2
    end
    object qryProdutosDadosFiscaispisbasecalculo: TFloatField
      FieldName = 'pisbasecalculo'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaispisaliquota: TFloatField
      FieldName = 'pisaliquota'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaispisvalor: TFloatField
      FieldName = 'pisvalor'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaiscofinscst: TStringField
      FieldName = 'cofinscst'
      Size = 2
    end
    object qryProdutosDadosFiscaiscofinsbasecalculo: TFloatField
      FieldName = 'cofinsbasecalculo'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaiscofinsaliquota: TFloatField
      FieldName = 'cofinsaliquota'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaiscofinsvalor: TFloatField
      FieldName = 'cofinsvalor'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisicmsvalor: TFloatField
      FieldName = 'icmsvalor'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisunidade: TStringField
      FieldName = 'unidade'
      Size = 6
    end
    object qryProdutosDadosFiscaisicmsbasecalculo: TFloatField
      FieldName = 'icmsbasecalculo'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaispedidocliente: TStringField
      FieldName = 'pedidocliente'
      Size = 50
    end
    object qryProdutosDadosFiscaisprodutocliente: TStringField
      FieldName = 'produtocliente'
      Size = 50
    end
    object qryProdutosDadosFiscaispedida: TFloatField
      FieldName = 'pedida'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisentregue: TFloatField
      FieldName = 'entregue'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisorigemproduto: TStringField
      FieldName = 'origemproduto'
      Size = 1
    end
    object qryProdutosDadosFiscaiscodigovisual: TStringField
      FieldName = 'codigovisual'
      Size = 50
    end
    object qryProdutosDadosFiscaissaldo: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'saldo'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryProdutosDadosFiscaispn: TLargeintField
      FieldName = 'pn'
    end
    object qryProdutosDadosFiscaisaliquotaicmsst: TFloatField
      FieldName = 'aliquotaicmsst'
    end
    object qryProdutosDadosFiscaisicmsbasecalculost: TFloatField
      FieldName = 'icmsbasecalculost'
    end
    object qryProdutosDadosFiscaisicmsvalorst: TFloatField
      FieldName = 'icmsvalorst'
    end
    object qryProdutosDadosFiscaiscsosn: TStringField
      FieldName = 'csosn'
      Size = 3
    end
    object qryProdutosDadosFiscaispcredsn: TFloatField
      FieldName = 'pcredsn'
    end
    object qryProdutosDadosFiscaisvcredicmssn: TFloatField
      FieldName = 'vcredicmssn'
    end
    object qryProdutosDadosFiscaispredbcst: TFloatField
      FieldName = 'predbcst'
    end
    object qryProdutosDadosFiscaisreducaobasest: TFloatField
      FieldName = 'reducaobasest'
    end
    object qryProdutosDadosFiscaisvbcstret: TFloatField
      FieldName = 'vbcstret'
    end
    object qryProdutosDadosFiscaisvicmsstret: TFloatField
      FieldName = 'vicmsstret'
    end
    object qryProdutosDadosFiscaisicmsisentas: TFloatField
      FieldName = 'icmsisentas'
    end
    object qryProdutosDadosFiscaisicmsoutras: TFloatField
      FieldName = 'icmsoutras'
    end
    object qryProdutosDadosFiscaisipioutras: TFloatField
      FieldName = 'ipioutras'
    end
    object qryProdutosDadosFiscaisipiisentas: TFloatField
      FieldName = 'ipiisentas'
    end
    object qryProdutosDadosFiscaisnaogerardebitoicms: TBooleanField
      FieldName = 'naogerardebitoicms'
    end
    object qryProdutosDadosFiscaisnaogerardebitoipi: TBooleanField
      FieldName = 'naogerardebitoipi'
    end
    object qryProdutosDadosFiscaisnaocalcularipisobrefrete: TBooleanField
      FieldName = 'naocalcularipisobrefrete'
    end
    object qryProdutosDadosFiscaisvalorparcelaimportada: TFloatField
      FieldName = 'valorparcelaimportada'
    end
    object qryProdutosDadosFiscaiscodigo_fci: TStringField
      FieldName = 'codigo_fci'
      Size = 36
    end
    object qryProdutosDadosFiscaisaliqnacional: TFloatField
      FieldName = 'aliqnacional'
    end
    object qryProdutosDadosFiscaisvalorimpostonacional: TFloatField
      FieldName = 'valorimpostonacional'
    end
    object qryProdutosDadosFiscaisaliqimportado: TFloatField
      FieldName = 'aliqimportado'
    end
    object qryProdutosDadosFiscaisvalorimpostoimportado: TFloatField
      FieldName = 'valorimpostoimportado'
    end
    object qryProdutosDadosFiscaisnaocalcularvaloresicmsdiferimento: TBooleanField
      FieldName = 'naocalcularvaloresicmsdiferimento'
    end
    object qryProdutosDadosFiscaisfci: TStringField
      FieldName = 'fci'
      Size = 36
    end
  end
  object dsrProdutosDadosFiscais: TtecDataSource
    DataSet = qryProdutosDadosFiscais
    Left = 184
    Top = 88
  end
  object qryDadosFiscais: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterInsert = qryDadosFiscaisAfterInsert
    AfterCancel = qryDadosFiscaisAfterCancel
    OnNewRecord = qryDadosFiscaisNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select df.numero,'
      '        df.data,'
      '        df.situacao,'
      '        df.manual,'
      '        df.filialvenda,'
      '        df.contrato,'
      '        df.valortotal,'
      '        df.valorvista,'
      '        df.desconto,'
      '        df.valorfrete,'
      '        df.seguro,'
      '        df.valoripi,'
      '        df.despesasacessorias,'
      '        df.codigofiscal,'
      '        df.codigofiscalservico,'
      '        df.vendedor,'
      '        df.agente,'
      '        df.estadocfo,'
      '        df.filialemissao,'
      '        df.natureza,'
      '        df.descricaosemprodutos,'
      '        df.plano,'
      '        df.viatransporte,'
      '        df.datasaida,'
      '        df.fornecedortransporte,'
      '        df.frete,'
      '        df.cliente,'
      '        df.tipocliente,'
      '        df.estadoplaca,'
      '        df.placa,'
      '        df.nome,'
      '        df.rua,'
      '        df.bairro,'
      '        df.cidade,'
      '        df.estado,'
      '        df.cep,'
      '        df.pessoatipo,'
      '        df.pessoanumero,'
      '        df.fonenumero,'
      '        df.foneddd,'
      '        df.documento,'
      '        df.observacoes,'
      '        df.conceito,'
      '        df.debitar,'
      '        df.creditar,'
      '        df.historico,'
      '        df.totalbaseicmsproprio,'
      '        df.totalvaloricmsproprio,'
      '        df.totalbaseicmssubstituicao,'
      '        df.totalvaloricmssubstituicao,'
      '        df.aliquotaicmsproprio,'
      '        df.anexotres,'
      '        df.acrescimofinanceiro,'
      '        df.acrescimoexcluido,'
      '        df.icmsexcluido,'
      '        df.codigonatureza,'
      '        df.valorservicos,'
      '        df.irretido,'
      '        df.inssretido,'
      '        df.issretido,'
      '        df.cofinsretido,'
      '        df.pisretido,'
      '        df.csllretido,'
      '        df.baseicms,'
      '        df.valoricms,'
      '        df.valorissqn,'
      '        df.valorprodutos,'
      '        df.substituicaoipi,'
      '        df.observacoescomplementar,'
      '        df.obscliente,'
      '        df.obsclienteipisuspenso,'
      '        df.observacoesicmssubstituido,'
      '        df.dadofiscalcomplementar,'
      '        df.versaolayout,'
      '        df.modelodocto,'
      '        df.nrdocumento,'
      '        df.codaleatorio,'
      '        df.formapagto,'
      '        df.formatodanfe,'
      '        df.formaemissao,'
      '        df.digchaveacesso,'
      '        df.chv_nfe,'
      '        df.ambiente,'
      '        df.finalidadenf,'
      '        df.procemissao,'
      '        df.versaoteclux,'
      '        df.totalimportacao,'
      '        df.totalvalorpis,'
      '        df.totalvalorcofins,'
      '        df.nomebairro,'
      '        df.nomecidade,'
      '        df.cidadeibge,'
      '        df.pais,'
      '        df.nomepais,'
      '        df.localretirada_cnpj,'
      '        df.localretirada_rua,'
      '        df.localretirada_complemento,'
      '        df.localretirada_bairro,'
      '        df.localretirada_nomebairro,'
      '        df.localretirada_cidade,'
      '        df.localretirada_nomecidade,'
      '        df.localretirada_cidadeibge,'
      '        df.localretirada_estado,'
      '        df.localentrega_cnpj,'
      '        df.localentrega_rua,'
      '        df.localentrega_complemento,'
      '        df.localentrega_bairro,'
      '        df.localentrega_nomebairro,'
      '        df.localentrega_cidade,'
      '        df.localentrega_nomecidade,'
      '        df.localentrega_cidadeibge,'
      '        df.localentrega_estado,'
      '        df.transportadora_cnpj,'
      '        df.transportadora_nome,'
      '        df.transportadora_rua,'
      '        df.transportadora_bairro,'
      '        df.transportadora_nomebairro,'
      '        df.transportadora_cidade,'
      '        df.transportadora_nomecidade,'
      '        df.transportadora_cidadeibge,'
      '        df.transportadora_estado,'
      '        df.transportadora_rntc,'
      '        df.infcomplementar,'
      '        df.exportacoes_ufembarque,'
      '        df.exportacoes_localembarque,'
      '        df.endnumero,'
      '        df.endcomplemento,'
      '        df.localretirada_cep,'
      '        df.localentrega_cep,'
      '        df.transportadora_ie,'
      '        df.numlotenfe,'
      '        df.numrecibonfe,'
      '        df.numprotocolonfe,'
      '        df.localretirada_numero,'
      '        df.localentrega_numero,'
      '        df.suframa,'
      '        df.iesubsttributario,'
      '        df.complementarnota,'
      '        df.transportadora_lacres,'
      '        df.pesobruto,'
      '        df.pesoliquido,'
      '        df.volumes,'
      '        df.especie,'
      '        df.marca,'
      '        df.numeracao,'
      '        df.especietransporte,'
      '        df.email,'
      '        df.regimetributario,'
      '        df.ValorTotalImpostoIBT,'
      '       df.dhProcNFe,'
      '       df.datahoraemissao,'
      '       cast(null as varchar(20)) as apelido,'
      '       cast(null as integer) as numeronfcomplementar,'
      '       cast(null as numeric(5,2)) as taxajuros,'
      '       false as ipisuspenso,'
      ''
      '       coalesce(df.valorprodutos,0) +'
      '       (coalesce(df.valortotal,0) -'
      '        coalesce(df.valorvista,0)) -'
      '       coalesce(df.desconto,0) as totalprodutos,'
      ''
      
        '       (select sum(pdf.vCredICMSSN) from produtosdadosfiscais pd' +
        'f where pdf.dadofiscal = df.numero) as vCredICMSSN,'
      
        '       (select sum(pdf.vICMSSTRet) from produtosdadosfiscais pdf' +
        ' where pdf.dadofiscal = df.numero) as vICMSSTRet,'
      '       false as TagAdPedNFE,'
      '       df.hSaiEnt,'
      '       df.clientecontribicms,'
      '       false as recolhericmsst'
      ''
      'from dadosfiscais df'
      'where df.numero = :numero'
      '')
    RequestLive = True
    Left = 40
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end>
    object qryDadosFiscaisnumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryDadosFiscaissituacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
    object qryDadosFiscaismanual: TBooleanField
      FieldName = 'manual'
    end
    object qryDadosFiscaisfilialvenda: TIntegerField
      FieldName = 'filialvenda'
      DisplayFormat = '0'
    end
    object qryDadosFiscaiscontrato: TStringField
      FieldName = 'contrato'
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
    object qryDadosFiscaiscodigofiscalservico: TIntegerField
      FieldName = 'codigofiscalservico'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisvendedor: TIntegerField
      FieldName = 'vendedor'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisagente: TIntegerField
      FieldName = 'agente'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisestadocfo: TStringField
      FieldName = 'estadocfo'
      Size = 2
    end
    object qryDadosFiscaisfilialemissao: TIntegerField
      FieldName = 'filialemissao'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisnatureza: TStringField
      FieldName = 'natureza'
      Size = 80
    end
    object qryDadosFiscaisdescricaosemprodutos: TStringField
      FieldName = 'descricaosemprodutos'
      Size = 200
    end
    object qryDadosFiscaisplano: TIntegerField
      FieldName = 'plano'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisviatransporte: TStringField
      FieldName = 'viatransporte'
      Size = 1
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
      EditMask = 'LLL0000;0;_'
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
    object qryDadosFiscaiscidade: TIntegerField
      FieldName = 'cidade'
      DisplayFormat = '0'
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
      FieldName = 'pessoanumero'
      Size = 14
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
    object qryDadosFiscaisconceito: TIntegerField
      FieldName = 'conceito'
      DisplayFormat = '0'
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
    object qryDadosFiscaistotalbaseicmsproprio: TFloatField
      FieldName = 'totalbaseicmsproprio'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaistotalvaloricmsproprio: TFloatField
      FieldName = 'totalvaloricmsproprio'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaistotalbaseicmssubstituicao: TFloatField
      FieldName = 'totalbaseicmssubstituicao'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaistotalvaloricmssubstituicao: TFloatField
      FieldName = 'totalvaloricmssubstituicao'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaisaliquotaicmsproprio: TFloatField
      FieldName = 'aliquotaicmsproprio'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaisanexotres: TStringField
      FieldName = 'anexotres'
      Size = 100
    end
    object qryDadosFiscaisacrescimofinanceiro: TFloatField
      FieldName = 'acrescimofinanceiro'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaisacrescimoexcluido: TFloatField
      FieldName = 'acrescimoexcluido'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaisicmsexcluido: TFloatField
      FieldName = 'icmsexcluido'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaiscodigonatureza: TIntegerField
      FieldName = 'codigonatureza'
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
    object qryDadosFiscaisvalorprodutos: TFloatField
      FieldName = 'valorprodutos'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaissubstituicaoipi: TBooleanField
      FieldName = 'substituicaoipi'
    end
    object qryDadosFiscaisobservacoescomplementar: TStringField
      FieldName = 'observacoescomplementar'
      Size = 500
    end
    object qryDadosFiscaisobscliente: TStringField
      FieldName = 'obscliente'
      Size = 320
    end
    object qryDadosFiscaisobsclienteipisuspenso: TStringField
      FieldName = 'obsclienteipisuspenso'
      Size = 320
    end
    object qryDadosFiscaisobservacoesicmssubstituido: TStringField
      FieldName = 'observacoesicmssubstituido'
      Size = 500
    end
    object qryDadosFiscaisdadofiscalcomplementar: TIntegerField
      FieldName = 'dadofiscalcomplementar'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisversaolayout: TFloatField
      FieldName = 'versaolayout'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaismodelodocto: TStringField
      DisplayLabel = 'Modelo Docto Fiscal'
      FieldName = 'modelodocto'
      Required = True
      Size = 2
    end
    object qryDadosFiscaisnrdocumento: TIntegerField
      FieldName = 'nrdocumento'
      DisplayFormat = '0'
    end
    object qryDadosFiscaiscodaleatorio: TIntegerField
      FieldName = 'codaleatorio'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisformapagto: TIntegerField
      FieldName = 'formapagto'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisformatodanfe: TIntegerField
      FieldName = 'formatodanfe'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisformaemissao: TIntegerField
      FieldName = 'formaemissao'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisdigchaveacesso: TIntegerField
      FieldName = 'digchaveacesso'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisambiente: TIntegerField
      FieldName = 'ambiente'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisfinalidadenf: TIntegerField
      FieldName = 'finalidadenf'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisprocemissao: TIntegerField
      FieldName = 'procemissao'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisversaoteclux: TStringField
      FieldName = 'versaoteclux'
      Size = 8
    end
    object qryDadosFiscaistotalimportacao: TFloatField
      FieldName = 'totalimportacao'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaistotalvalorpis: TFloatField
      FieldName = 'totalvalorpis'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaistotalvalorcofins: TFloatField
      FieldName = 'totalvalorcofins'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaisnomebairro: TStringField
      FieldName = 'nomebairro'
      Size = 60
    end
    object qryDadosFiscaisnomecidade: TStringField
      FieldName = 'nomecidade'
      Size = 60
    end
    object qryDadosFiscaiscidadeibge: TIntegerField
      FieldName = 'cidadeibge'
      DisplayFormat = '0'
    end
    object qryDadosFiscaispais: TIntegerField
      FieldName = 'pais'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisnomepais: TStringField
      FieldName = 'nomepais'
      Size = 60
    end
    object qryDadosFiscaislocalretirada_cnpj: TStringField
      FieldName = 'localretirada_cnpj'
      Size = 14
    end
    object qryDadosFiscaislocalretirada_rua: TStringField
      FieldName = 'localretirada_rua'
      Size = 100
    end
    object qryDadosFiscaislocalretirada_complemento: TStringField
      FieldName = 'localretirada_complemento'
      Size = 60
    end
    object qryDadosFiscaislocalretirada_bairro: TIntegerField
      FieldName = 'localretirada_bairro'
      DisplayFormat = '0'
    end
    object qryDadosFiscaislocalretirada_nomebairro: TStringField
      FieldName = 'localretirada_nomebairro'
      Size = 60
    end
    object qryDadosFiscaislocalretirada_cidade: TIntegerField
      FieldName = 'localretirada_cidade'
      DisplayFormat = '0'
    end
    object qryDadosFiscaislocalretirada_nomecidade: TStringField
      FieldName = 'localretirada_nomecidade'
      Size = 60
    end
    object qryDadosFiscaislocalretirada_cidadeibge: TIntegerField
      FieldName = 'localretirada_cidadeibge'
      DisplayFormat = '0'
    end
    object qryDadosFiscaislocalretirada_estado: TStringField
      FieldName = 'localretirada_estado'
      Size = 2
    end
    object qryDadosFiscaislocalentrega_cnpj: TStringField
      FieldName = 'localentrega_cnpj'
      Size = 14
    end
    object qryDadosFiscaislocalentrega_rua: TStringField
      FieldName = 'localentrega_rua'
      Size = 100
    end
    object qryDadosFiscaislocalentrega_complemento: TStringField
      FieldName = 'localentrega_complemento'
      Size = 60
    end
    object qryDadosFiscaislocalentrega_bairro: TIntegerField
      FieldName = 'localentrega_bairro'
      DisplayFormat = '0'
    end
    object qryDadosFiscaislocalentrega_nomebairro: TStringField
      FieldName = 'localentrega_nomebairro'
      Size = 60
    end
    object qryDadosFiscaislocalentrega_cidade: TIntegerField
      FieldName = 'localentrega_cidade'
      DisplayFormat = '0'
    end
    object qryDadosFiscaislocalentrega_nomecidade: TStringField
      FieldName = 'localentrega_nomecidade'
      Size = 60
    end
    object qryDadosFiscaislocalentrega_cidadeibge: TIntegerField
      FieldName = 'localentrega_cidadeibge'
      DisplayFormat = '0'
    end
    object qryDadosFiscaislocalentrega_estado: TStringField
      FieldName = 'localentrega_estado'
      Size = 2
    end
    object qryDadosFiscaistransportadora_cnpj: TStringField
      FieldName = 'transportadora_cnpj'
      Size = 14
    end
    object qryDadosFiscaistransportadora_nome: TStringField
      FieldName = 'transportadora_nome'
      Size = 60
    end
    object qryDadosFiscaistransportadora_rua: TStringField
      FieldName = 'transportadora_rua'
      Size = 60
    end
    object qryDadosFiscaistransportadora_bairro: TIntegerField
      FieldName = 'transportadora_bairro'
      DisplayFormat = '0'
    end
    object qryDadosFiscaistransportadora_nomebairro: TStringField
      FieldName = 'transportadora_nomebairro'
      Size = 60
    end
    object qryDadosFiscaistransportadora_cidade: TIntegerField
      FieldName = 'transportadora_cidade'
      DisplayFormat = '0'
    end
    object qryDadosFiscaistransportadora_nomecidade: TStringField
      FieldName = 'transportadora_nomecidade'
      Size = 60
    end
    object qryDadosFiscaistransportadora_cidadeibge: TIntegerField
      FieldName = 'transportadora_cidadeibge'
      DisplayFormat = '0'
    end
    object qryDadosFiscaistransportadora_estado: TStringField
      FieldName = 'transportadora_estado'
      Size = 2
    end
    object qryDadosFiscaistransportadora_rntc: TStringField
      FieldName = 'transportadora_rntc'
    end
    object qryDadosFiscaisinfcomplementar: TStringField
      FieldName = 'infcomplementar'
      Size = 512
    end
    object qryDadosFiscaisexportacoes_ufembarque: TStringField
      FieldName = 'exportacoes_ufembarque'
      Size = 2
    end
    object qryDadosFiscaisexportacoes_localembarque: TStringField
      FieldName = 'exportacoes_localembarque'
      Size = 60
    end
    object qryDadosFiscaisendnumero: TIntegerField
      FieldName = 'endnumero'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisendcomplemento: TStringField
      FieldName = 'endcomplemento'
      Size = 100
    end
    object qryDadosFiscaislocalretirada_cep: TIntegerField
      FieldName = 'localretirada_cep'
      DisplayFormat = '0'
    end
    object qryDadosFiscaislocalentrega_cep: TIntegerField
      FieldName = 'localentrega_cep'
      DisplayFormat = '0'
    end
    object qryDadosFiscaistransportadora_ie: TStringField
      FieldName = 'transportadora_ie'
    end
    object qryDadosFiscaisnumlotenfe: TStringField
      FieldName = 'numlotenfe'
      Size = 15
    end
    object qryDadosFiscaisnumrecibonfe: TStringField
      FieldName = 'numrecibonfe'
      Size = 15
    end
    object qryDadosFiscaisnumprotocolonfe: TStringField
      FieldName = 'numprotocolonfe'
      Size = 15
    end
    object qryDadosFiscaislocalretirada_numero: TIntegerField
      FieldName = 'localretirada_numero'
      DisplayFormat = '0'
    end
    object qryDadosFiscaislocalentrega_numero: TIntegerField
      FieldName = 'localentrega_numero'
      DisplayFormat = '0'
    end
    object qryDadosFiscaissuframa: TStringField
      FieldName = 'suframa'
      Size = 9
    end
    object qryDadosFiscaisiesubsttributario: TStringField
      FieldName = 'iesubsttributario'
    end
    object qryDadosFiscaiscomplementarnota: TBooleanField
      FieldName = 'complementarnota'
    end
    object qryDadosFiscaistransportadora_lacres: TStringField
      FieldName = 'transportadora_lacres'
      Size = 100
    end
    object qryDadosFiscaispesobruto: TFloatField
      FieldName = 'pesobruto'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaispesoliquido: TFloatField
      FieldName = 'pesoliquido'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaisvolumes: TIntegerField
      FieldName = 'volumes'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisespecie: TStringField
      FieldName = 'especie'
      Size = 60
    end
    object qryDadosFiscaismarca: TStringField
      FieldName = 'marca'
      Size = 60
    end
    object qryDadosFiscaisnumeracao: TStringField
      FieldName = 'numeracao'
      Size = 60
    end
    object qryDadosFiscaisespecietransporte: TStringField
      FieldName = 'especietransporte'
      Size = 60
    end
    object qryDadosFiscaisemail: TStringField
      FieldName = 'email'
      Size = 128
    end
    object qryDadosFiscaisapelido: TStringField
      FieldName = 'apelido'
    end
    object qryDadosFiscaisnumeronfcomplementar: TIntegerField
      FieldName = 'numeronfcomplementar'
      DisplayFormat = '0'
    end
    object qryDadosFiscaistaxajuros: TFloatField
      FieldName = 'taxajuros'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaisipisuspenso: TBooleanField
      FieldName = 'ipisuspenso'
    end
    object qryDadosFiscaisdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object qryDadosFiscaisdatasaida: TDateField
      Alignment = taCenter
      FieldName = 'datasaida'
      EditMask = '99/99/9999;1; '
    end
    object qryDadosFiscaischv_nfe: TStringField
      FieldName = 'chv_nfe'
      Size = 44
    end
    object qryDadosFiscaistotalprodutos: TFloatField
      FieldName = 'totalprodutos'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaisvcredicmssn: TFloatField
      FieldName = 'vcredicmssn'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaisvicmsstret: TFloatField
      FieldName = 'vicmsstret'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaisregimetributario: TIntegerField
      FieldName = 'regimetributario'
      DisplayFormat = '0'
    end
    object qryDadosFiscaistagadpednfe: TBooleanField
      FieldName = 'tagadpednfe'
    end
    object qryDadosFiscaisdhprocnfe: TDateTimeField
      FieldName = 'dhprocnfe'
    end
    object qryDadosFiscaishsaient: TDateTimeField
      FieldName = 'hsaient'
    end
    object qryDadosFiscaisrecolhericmsst: TBooleanField
      FieldName = 'recolhericmsst'
    end
    object qryDadosFiscaisvalortotalimpostoibt: TFloatField
      FieldName = 'valortotalimpostoibt'
    end
    object qryDadosFiscaisdatahoraemissao: TDateTimeField
      FieldName = 'datahoraemissao'
    end
    object qryDadosFiscaisclientecontribicms: TBooleanField
      FieldName = 'clientecontribicms'
    end
  end
  object dsrDadosFiscais: TtecDataSource
    DataSet = qryDadosFiscais
    OnDataChange = dsrDadosFiscaisDataChange
    Left = 56
    Top = 88
  end
  object spcDadosFiscaisProximo: TtecQuery
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
      'select dadosfiscais_proximonumero() as numero')
    RequestLive = True
    Left = 152
    Top = 152
    object spcDadosFiscaisProximonumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
  end
  object spcNotasProximo: TtecQuery
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
      ';'
      'select coalesce(max(numero),0)+1 as numero'
      'from notas'
      'where filial = :filial'
      '  and serie  = :serie')
    RequestLive = True
    Left = 40
    Top = 152
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
      end>
    object spcNotasProximonumero: TIntegerField
      FieldName = 'numero'
    end
  end
  object qryVenctosDadosFiscais: TtecQuery
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
      'select  vdf.dadofiscal,'
      '        vdf.numero,'
      '        vdf.datavencto,'
      '        vdf.valorvencto'
      'from venctosdadosfiscais vdf'
      'where vdf.dadofiscal = :dadofiscal'
      'order by vdf.numero')
    RequestLive = True
    Left = 304
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dadofiscal'
        ParamType = ptUnknown
      end>
    object qryVenctosDadosFiscaisdadofiscal: TIntegerField
      FieldName = 'dadofiscal'
    end
    object qryVenctosDadosFiscaisnumero: TIntegerField
      FieldName = 'numero'
    end
    object qryVenctosDadosFiscaisdatavencto: TDateField
      FieldName = 'datavencto'
    end
    object qryVenctosDadosFiscaisvalorvencto: TFloatField
      FieldName = 'valorvencto'
      DisplayFormat = '0.00'
    end
  end
  object dsrVenctosDadosFiscais: TtecDataSource
    DataSet = qryVenctosDadosFiscais
    Left = 320
    Top = 88
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
      'select numero,'
      '       filial,'
      '       serie,'
      '       dadofiscal'
      'from notas'
      'where dadofiscal = -1')
    RequestLive = True
    Left = 304
    Top = 144
    object qryNotasnumero: TIntegerField
      FieldName = 'numero'
      Required = True
    end
    object qryNotasfilial: TIntegerField
      FieldName = 'filial'
      Required = True
    end
    object qryNotasserie: TStringField
      FieldName = 'serie'
      Required = True
      Size = 3
    end
    object qryNotasdadofiscal: TIntegerField
      FieldName = 'dadofiscal'
      Required = True
    end
  end
  object dsrNotas: TtecDataSource
    DataSet = qryNotas
    Left = 320
    Top = 160
  end
  object qryLinhasNotasFiscais: TtecQuery
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
      'select lnf.dadofiscal,'
      '       lnf.linha,'
      '       lnf.produtodadofiscal,'
      '       lnf.texto'
      'from linhasnotasfiscais lnf'
      'where lnf.dadofiscal = :dadofiscal')
    RequestLive = True
    Left = 304
    Top = 212
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dadofiscal'
        ParamType = ptUnknown
      end>
    object qryLinhasNotasFiscaisdadofiscal: TIntegerField
      FieldName = 'dadofiscal'
    end
    object qryLinhasNotasFiscaislinha: TIntegerField
      FieldName = 'linha'
    end
    object qryLinhasNotasFiscaisprodutodadofiscal: TIntegerField
      FieldName = 'produtodadofiscal'
    end
    object qryLinhasNotasFiscaistexto: TStringField
      FieldName = 'texto'
      Size = 200
    end
  end
  object qryTecContrato: TtecQuery
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
      '       c.data,'
      '       c.faturamento,'
      '       c.avalista,'
      '       c.cliente,'
      '       c.tipocliente,'
      '       c.vendedor,'
      '       c.filialvenda,'
      '       c.valorvista,'
      '       c.valorprazo,'
      '       cast(0 as numeric(11,2)) as TotalProdutos,'
      '       cast(0 as numeric(11,2)) as TotalServicos,'
      '       c.desconto,'
      '       c.frete,'
      '       c.seguro,'
      '       c.agente,'
      '       c.analista,'
      '       (select u.nome'
      '        from usuarios u'
      '        where u.codigo = c.analista) as NomeAnalista,'
      '       c.origem,'
      '       c.tiporenegociacao,'
      '       c.taxajuros,'
      '       c.plano,'
      '       c.consideracoes,'
      '       c.entrua,'
      '       c.entnumero,'
      '       c.entcomplemento,'
      '       c.entestado,'
      '       c.entcidade,'
      '       c.entbairro,'
      '       c.entcep,'
      '       c.entfoneddd,'
      '       c.entfonenumero,'
      '       c.entfoneramal,'
      '       c.montagemobs,'
      '       c.montagemfilial,'
      '       c.situacao,'
      '       c.emitirnotadepoisde,'
      '       cast (case when c.situacao = '#39'O'#39' then '#39'OR'#199'ADO'#39
      '                        when c.situacao = '#39'R'#39' then '#39'RESERVADO'#39
      '                        when c.situacao = '#39'F'#39' then '#39'FATURADO'#39
      
        '                        when c.situacao = '#39'P'#39' then '#39'NOTA PARCIAL' +
        #39
      '                        when c.situacao = '#39'N'#39' then '#39'NOTA FISCAL'#39
      '                        when c.situacao = '#39'C'#39' then '#39'CANCELADO'#39
      '             end as varchar) as NomeSituacao,'
      '       c.motivo,'
      ''
      '       (select m.descricao'
      '        from motivos m'
      '        where m.codigo = c.motivo'
      '       ) as descricaomotivo,'
      ''
      '       (select d.nome'
      '        from cidades d'
      '        where (d.estado = c.entestado) and'
      '              (d.codigo = c.entcidade)'
      '       ) as nomecidadeentrega,'
      ''
      '       (select b.nome'
      '        from bairros b'
      '        where (b.estado = c.entestado) and'
      '              (b.cidade = c.entcidade) and'
      '              (b.codigo = c.entbairro)'
      '       ) as nomebairroentrega,'
      ''
      '       (select d1.nome'
      '        from cidades d1'
      '        where (d1.estado = c.naturalestado) and'
      '              (d1.codigo = c.naturalcidade)'
      '       ) as nomecidadenaturalidade,'
      ''
      '       (select d2.nome'
      '        from cidades d2'
      '        where (d2.estado = c.estado) and'
      '              (d2.codigo = c.cidade)'
      '       ) as nomecidade,'
      ''
      '       (select b1.nome'
      '        from bairros b1'
      '        where (b1.estado = c.estado) and'
      '              (b1.cidade = c.cidade) and'
      '              (b1.codigo = c.bairro)'
      '       ) as nomebairro,'
      ''
      '       (select d3.nome'
      '        from cidades d3'
      '        where (d3.estado = c.empestado) and'
      '              (d3.codigo = c.empcidade)'
      '       ) as nomecidadeempresa,'
      ''
      '       (select b2.nome'
      '        from bairros b2'
      '        where (b2.estado = c.empestado) and'
      '              (b2.cidade = c.empcidade) and'
      '              (b2.codigo = c.empbairro)'
      '       ) as nomebairroempresa,'
      ''
      '       (select d4.nome'
      '        from cidades d4'
      '        where (d4.estado = c.conestado) and'
      '              (d4.codigo = c.concidade)'
      '       ) as nomecidadeconjuge,'
      ''
      '       (select b3.nome'
      '        from bairros b3'
      '        where (b3.estado = c.conestado) and'
      '              (b3.cidade = c.concidade) and'
      '              (b3.codigo = c.conbairro)'
      '       ) as nomebairroconjuge,'
      ''
      '       (select d5.nome'
      '        from cidades d5'
      '        where (d5.estado = c.refestado) and'
      '              (d5.codigo = c.refcidade)'
      '       ) as nomecidadereferencia,'
      ''
      '       (select b4.nome'
      '        from bairros b4'
      '        where (b4.estado = c.refestado) and'
      '              (b4.cidade = c.refcidade) and'
      '              (b4.codigo = c.refbairro)'
      '       ) as nomebairroreferencia,'
      ''
      '       c.nome,'
      '       c.nascto,'
      '       c.apelido,'
      '       c.sexo,'
      '       c.civil,'
      '       c.civildata,'
      '       c.iddocumento,'
      '       c.idorgao,'
      '       c.iddata,'
      '       c.idestado,'
      '       c.pessoatipo,'
      '       c.pessoanumero,'
      '       c.mae,'
      '       c.pai,'
      '       c.conceito,'
      '       c.naturalcidade,'
      '       c.naturalestado,'
      '       c.rua,'
      '       c.endnumero,'
      '       c.endcomplemento,'
      '       c.estado,'
      '       c.cidade,'
      '       c.bairro,'
      '       c.cep,'
      '       c.fonetipo,'
      '       c.foneddd,'
      '       c.fonenumero,'
      '       c.foneramal,'
      '       c.fone2ddd,'
      '       c.fone2numero,'
      '       c.fone2ramal,'
      '       c.restipo,'
      '       c.resonus,'
      '       c.restempo,'
      '       c.empresa,'
      '       c.empadmissao,'
      '       c.empcep,'
      '       c.empcomprovado,'
      '       c.empfoneddd,'
      '       c.empfonenumero,'
      '       c.empfoneramal,'
      '       c.empoutrasdescricao,'
      '       c.empoutrasfaixa,'
      '       c.empoutrasvalor,'
      '       c.emprendafaixa,'
      '       c.emprendavalor,'
      '       c.emprua,'
      '       c.empnumero,'
      '       c.empcomplemento,'
      '       c.empestado,'
      '       c.empcidade,'
      '       c.empbairro,'
      '       c.empcargo,'
      '       c.conjuge,'
      '       c.connome,'
      '       c.conadmissao,'
      '       c.concep,'
      '       c.conempresa,'
      '       c.confoneddd,'
      '       c.confonenumero,'
      '       c.confoneramal,'
      '       c.connascto,'
      '       c.conrendafaixa,'
      '       c.conrendavalor,'
      '       c.conrua,'
      '       c.connumero,'
      '       c.concomplemento,'
      '       c.conestado,'
      '       c.concidade,'
      '       c.conbairro,'
      '       c.concargo,'
      '       c.referencia,'
      '       c.reftipo,'
      '       c.refrua,'
      '       c.refnumero,'
      '       c.refcomplemento,'
      '       c.refestado,'
      '       c.refcidade,'
      '       c.refbairro,'
      '       c.refcep,'
      '       c.reffoneddd,'
      '       c.reffonenumero,'
      '       c.reffoneramal,'
      '       c.reffone2ddd,'
      '       c.reffone2numero,'
      '       c.reffone2ramal,'
      '       c.observacoes,'
      '       c.email,'
      '       c.listacasamento,'
      '       c.automovel,'
      '       c.cartaocredito,'
      '       c.cartaoloja,'
      '       c.cheque,'
      '       c.chequeespecial,'
      '       c.dependentes,'
      '       c.onus,'
      '       c.primogenito,'
      '       c.pedidocliente,'
      '       (select c2.numero'
      '        from   contratos c2'
      '        where  (c2.origem = c.numero)) as renegociado'
      'from contratos c'
      'where c.numero =:numero'
      '/*          NAO ALTERAR A ORDEM DOS CAMPOS   */')
    RequestLive = True
    Left = 437
    Top = 91
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end>
    object qryTecContratonumero: TStringField
      FieldName = 'numero'
      Required = True
    end
    object qryTecContratodata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryTecContratofaturamento: TDateField
      Alignment = taCenter
      FieldName = 'faturamento'
      EditMask = '99/99/9999;1; '
    end
    object qryTecContratoavalista: TIntegerField
      FieldName = 'avalista'
      DisplayFormat = '0'
    end
    object qryTecContratocliente: TIntegerField
      FieldName = 'cliente'
      Required = True
      DisplayFormat = '0'
    end
    object qryTecContratotipocliente: TStringField
      FieldName = 'tipocliente'
      Required = True
      Size = 1
    end
    object qryTecContratovendedor: TIntegerField
      FieldName = 'vendedor'
      Required = True
      DisplayFormat = '0'
    end
    object qryTecContratofilialvenda: TIntegerField
      FieldName = 'filialvenda'
      Required = True
      DisplayFormat = '0'
    end
    object qryTecContratovalorvista: TFloatField
      FieldName = 'valorvista'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryTecContratovalorprazo: TFloatField
      FieldName = 'valorprazo'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryTecContratototalprodutos: TFloatField
      FieldName = 'totalprodutos'
      DisplayFormat = '0.00'
    end
    object qryTecContratototalservicos: TFloatField
      FieldName = 'totalservicos'
      DisplayFormat = '0.00'
    end
    object qryTecContratodesconto: TFloatField
      FieldName = 'desconto'
      DisplayFormat = '0.00'
    end
    object qryTecContratofrete: TFloatField
      FieldName = 'frete'
      DisplayFormat = '0.00'
    end
    object qryTecContratoseguro: TFloatField
      FieldName = 'seguro'
      DisplayFormat = '0.00'
    end
    object qryTecContratoagente: TIntegerField
      FieldName = 'agente'
      Required = True
      DisplayFormat = '0'
    end
    object qryTecContratoanalista: TIntegerField
      FieldName = 'analista'
      DisplayFormat = '0'
    end
    object qryTecContratonomeanalista: TStringField
      FieldName = 'nomeanalista'
      Size = 50
    end
    object qryTecContratoorigem: TStringField
      FieldName = 'origem'
    end
    object qryTecContratotiporenegociacao: TStringField
      FieldName = 'tiporenegociacao'
      Size = 1
    end
    object qryTecContratotaxajuros: TFloatField
      FieldName = 'taxajuros'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryTecContratoplano: TIntegerField
      FieldName = 'plano'
      Required = True
      DisplayFormat = '0'
    end
    object qryTecContratoconsideracoes: TStringField
      FieldName = 'consideracoes'
      Size = 500
    end
    object qryTecContratoentrua: TStringField
      FieldName = 'entrua'
      Size = 100
    end
    object qryTecContratoentestado: TStringField
      FieldName = 'entestado'
      Size = 2
    end
    object qryTecContratoentcidade: TIntegerField
      FieldName = 'entcidade'
      DisplayFormat = '0'
    end
    object qryTecContratoentbairro: TIntegerField
      FieldName = 'entbairro'
      DisplayFormat = '0'
    end
    object qryTecContratoentcep: TIntegerField
      FieldName = 'entcep'
      DisplayFormat = '0'
    end
    object qryTecContratoentfoneddd: TIntegerField
      FieldName = 'entfoneddd'
      DisplayFormat = '0'
    end
    object qryTecContratoentfonenumero: TIntegerField
      FieldName = 'entfonenumero'
      DisplayFormat = '0'
    end
    object qryTecContratoentfoneramal: TStringField
      FieldName = 'entfoneramal'
      Size = 10
    end
    object qryTecContratomontagemobs: TStringField
      FieldName = 'montagemobs'
      Size = 250
    end
    object qryTecContratomontagemfilial: TIntegerField
      FieldName = 'montagemfilial'
      DisplayFormat = '0'
    end
    object qryTecContratosituacao: TStringField
      FieldName = 'situacao'
      Required = True
      Size = 1
    end
    object qryTecContratoemitirnotadepoisde: TDateField
      Alignment = taCenter
      FieldName = 'emitirnotadepoisde'
      EditMask = '99/99/9999;1; '
    end
    object qryTecContratonomesituacao: TStringField
      FieldName = 'nomesituacao'
      Size = 50
    end
    object qryTecContratomotivo: TIntegerField
      FieldName = 'motivo'
      DisplayFormat = '0'
    end
    object qryTecContratodescricaomotivo: TStringField
      FieldName = 'descricaomotivo'
      Size = 50
    end
    object qryTecContratonomecidadeentrega: TStringField
      FieldName = 'nomecidadeentrega'
      Size = 50
    end
    object qryTecContratonomebairroentrega: TStringField
      FieldName = 'nomebairroentrega'
      Size = 50
    end
    object qryTecContratonomecidadenaturalidade: TStringField
      FieldName = 'nomecidadenaturalidade'
      Size = 50
    end
    object qryTecContratonomecidade: TStringField
      FieldName = 'nomecidade'
      Size = 50
    end
    object qryTecContratonomebairro: TStringField
      FieldName = 'nomebairro'
      Size = 50
    end
    object qryTecContratonomecidadeempresa: TStringField
      FieldName = 'nomecidadeempresa'
      Size = 50
    end
    object qryTecContratonomebairroempresa: TStringField
      FieldName = 'nomebairroempresa'
      Size = 50
    end
    object qryTecContratonomecidadeconjuge: TStringField
      FieldName = 'nomecidadeconjuge'
      Size = 50
    end
    object qryTecContratonomebairroconjuge: TStringField
      FieldName = 'nomebairroconjuge'
      Size = 50
    end
    object qryTecContratonomecidadereferencia: TStringField
      FieldName = 'nomecidadereferencia'
      Size = 50
    end
    object qryTecContratonomebairroreferencia: TStringField
      FieldName = 'nomebairroreferencia'
      Size = 50
    end
    object qryTecContratonome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryTecContratonascto: TDateField
      Alignment = taCenter
      FieldName = 'nascto'
      EditMask = '99/99/9999;1; '
    end
    object qryTecContratoapelido: TStringField
      FieldName = 'apelido'
    end
    object qryTecContratosexo: TStringField
      FieldName = 'sexo'
      Size = 1
    end
    object qryTecContratocivil: TStringField
      FieldName = 'civil'
      Size = 1
    end
    object qryTecContratocivildata: TDateField
      Alignment = taCenter
      FieldName = 'civildata'
      EditMask = '99/99/9999;1; '
    end
    object qryTecContratoiddocumento: TStringField
      FieldName = 'iddocumento'
    end
    object qryTecContratoidorgao: TStringField
      FieldName = 'idorgao'
      Size = 5
    end
    object qryTecContratoiddata: TDateField
      Alignment = taCenter
      FieldName = 'iddata'
      EditMask = '99/99/9999;1; '
    end
    object qryTecContratoidestado: TStringField
      FieldName = 'idestado'
      Size = 2
    end
    object qryTecContratopessoatipo: TStringField
      FieldName = 'pessoatipo'
      Size = 1
    end
    object qryTecContratopessoanumero: TStringField
      FieldName = 'pessoanumero'
      Size = 14
    end
    object qryTecContratomae: TStringField
      FieldName = 'mae'
      Size = 40
    end
    object qryTecContratopai: TStringField
      FieldName = 'pai'
      Size = 40
    end
    object qryTecContratoconceito: TIntegerField
      FieldName = 'conceito'
      DisplayFormat = '0'
    end
    object qryTecContratonaturalcidade: TIntegerField
      FieldName = 'naturalcidade'
      DisplayFormat = '0'
    end
    object qryTecContratonaturalestado: TStringField
      FieldName = 'naturalestado'
      Size = 2
    end
    object qryTecContratorua: TStringField
      FieldName = 'rua'
      Size = 100
    end
    object qryTecContratoestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object qryTecContratocidade: TIntegerField
      FieldName = 'cidade'
      DisplayFormat = '0'
    end
    object qryTecContratobairro: TIntegerField
      FieldName = 'bairro'
      DisplayFormat = '0'
    end
    object qryTecContratocep: TIntegerField
      FieldName = 'cep'
      DisplayFormat = '0'
    end
    object qryTecContratofonetipo: TStringField
      FieldName = 'fonetipo'
      Size = 1
    end
    object qryTecContratofoneddd: TIntegerField
      FieldName = 'foneddd'
      DisplayFormat = '0'
    end
    object qryTecContratofonenumero: TIntegerField
      FieldName = 'fonenumero'
      DisplayFormat = '0'
    end
    object qryTecContratofoneramal: TStringField
      FieldName = 'foneramal'
      Size = 10
    end
    object qryTecContratofone2ddd: TIntegerField
      FieldName = 'fone2ddd'
      DisplayFormat = '0'
    end
    object qryTecContratofone2numero: TIntegerField
      FieldName = 'fone2numero'
      DisplayFormat = '0'
    end
    object qryTecContratofone2ramal: TStringField
      FieldName = 'fone2ramal'
      Size = 10
    end
    object qryTecContratorestipo: TStringField
      FieldName = 'restipo'
      Size = 1
    end
    object qryTecContratoresonus: TFloatField
      FieldName = 'resonus'
      DisplayFormat = '0.00'
    end
    object qryTecContratorestempo: TDateField
      Alignment = taCenter
      FieldName = 'restempo'
      EditMask = '99/99/9999;1; '
    end
    object qryTecContratoempresa: TStringField
      FieldName = 'empresa'
      Size = 40
    end
    object qryTecContratoempadmissao: TDateField
      Alignment = taCenter
      FieldName = 'empadmissao'
      EditMask = '99/99/9999;1; '
    end
    object qryTecContratoempcep: TIntegerField
      FieldName = 'empcep'
      DisplayFormat = '0'
    end
    object qryTecContratoempcomprovado: TBooleanField
      FieldName = 'empcomprovado'
    end
    object qryTecContratoempfoneddd: TIntegerField
      FieldName = 'empfoneddd'
      DisplayFormat = '0'
    end
    object qryTecContratoempfonenumero: TIntegerField
      FieldName = 'empfonenumero'
      DisplayFormat = '0'
    end
    object qryTecContratoempfoneramal: TStringField
      FieldName = 'empfoneramal'
      Size = 10
    end
    object qryTecContratoempoutrasdescricao: TStringField
      FieldName = 'empoutrasdescricao'
      Size = 40
    end
    object qryTecContratoempoutrasfaixa: TIntegerField
      FieldName = 'empoutrasfaixa'
      DisplayFormat = '0'
    end
    object qryTecContratoempoutrasvalor: TFloatField
      FieldName = 'empoutrasvalor'
      DisplayFormat = '0.00'
    end
    object qryTecContratoemprendafaixa: TIntegerField
      FieldName = 'emprendafaixa'
      DisplayFormat = '0'
    end
    object qryTecContratoemprendavalor: TFloatField
      FieldName = 'emprendavalor'
      DisplayFormat = '0.00'
    end
    object qryTecContratoemprua: TStringField
      FieldName = 'emprua'
      Size = 100
    end
    object qryTecContratoempestado: TStringField
      FieldName = 'empestado'
      Size = 2
    end
    object qryTecContratoempcidade: TIntegerField
      FieldName = 'empcidade'
      DisplayFormat = '0'
    end
    object qryTecContratoempbairro: TIntegerField
      FieldName = 'empbairro'
      DisplayFormat = '0'
    end
    object qryTecContratoempcargo: TIntegerField
      FieldName = 'empcargo'
      DisplayFormat = '0'
    end
    object qryTecContratoconjuge: TIntegerField
      FieldName = 'conjuge'
      DisplayFormat = '0'
    end
    object qryTecContratoconnome: TStringField
      FieldName = 'connome'
      Size = 40
    end
    object qryTecContratoconadmissao: TDateField
      Alignment = taCenter
      FieldName = 'conadmissao'
      EditMask = '99/99/9999;1; '
    end
    object qryTecContratoconcep: TIntegerField
      FieldName = 'concep'
      DisplayFormat = '0'
    end
    object qryTecContratoconempresa: TStringField
      FieldName = 'conempresa'
      Size = 40
    end
    object qryTecContratoconfoneddd: TIntegerField
      FieldName = 'confoneddd'
      DisplayFormat = '0'
    end
    object qryTecContratoconfonenumero: TIntegerField
      FieldName = 'confonenumero'
      DisplayFormat = '0'
    end
    object qryTecContratoconfoneramal: TStringField
      FieldName = 'confoneramal'
      Size = 10
    end
    object qryTecContratoconnascto: TDateField
      Alignment = taCenter
      FieldName = 'connascto'
      EditMask = '99/99/9999;1; '
    end
    object qryTecContratoconrendafaixa: TIntegerField
      FieldName = 'conrendafaixa'
      DisplayFormat = '0'
    end
    object qryTecContratoconrendavalor: TFloatField
      FieldName = 'conrendavalor'
      DisplayFormat = '0.00'
    end
    object qryTecContratoconrua: TStringField
      FieldName = 'conrua'
      Size = 100
    end
    object qryTecContratoconestado: TStringField
      FieldName = 'conestado'
      Size = 2
    end
    object qryTecContratoconcidade: TIntegerField
      FieldName = 'concidade'
      DisplayFormat = '0'
    end
    object qryTecContratoconbairro: TIntegerField
      FieldName = 'conbairro'
      DisplayFormat = '0'
    end
    object qryTecContratoconcargo: TIntegerField
      FieldName = 'concargo'
      DisplayFormat = '0'
    end
    object qryTecContratoreferencia: TStringField
      FieldName = 'referencia'
      Size = 40
    end
    object qryTecContratoreftipo: TStringField
      FieldName = 'reftipo'
      Size = 1
    end
    object qryTecContratorefrua: TStringField
      FieldName = 'refrua'
      Size = 100
    end
    object qryTecContratorefestado: TStringField
      FieldName = 'refestado'
      Size = 2
    end
    object qryTecContratorefcidade: TIntegerField
      FieldName = 'refcidade'
      DisplayFormat = '0'
    end
    object qryTecContratorefbairro: TIntegerField
      FieldName = 'refbairro'
      DisplayFormat = '0'
    end
    object qryTecContratorefcep: TIntegerField
      FieldName = 'refcep'
      DisplayFormat = '0'
    end
    object qryTecContratoreffoneddd: TIntegerField
      FieldName = 'reffoneddd'
      DisplayFormat = '0'
    end
    object qryTecContratoreffonenumero: TIntegerField
      FieldName = 'reffonenumero'
      DisplayFormat = '0'
    end
    object qryTecContratoreffoneramal: TStringField
      FieldName = 'reffoneramal'
      Size = 10
    end
    object qryTecContratoreffone2ddd: TIntegerField
      FieldName = 'reffone2ddd'
      DisplayFormat = '0'
    end
    object qryTecContratoreffone2numero: TIntegerField
      FieldName = 'reffone2numero'
      DisplayFormat = '0'
    end
    object qryTecContratoreffone2ramal: TStringField
      FieldName = 'reffone2ramal'
      Size = 10
    end
    object qryTecContratoobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 512
    end
    object qryTecContratoemail: TStringField
      FieldName = 'email'
      Size = 128
    end
    object qryTecContratolistacasamento: TIntegerField
      FieldName = 'listacasamento'
      DisplayFormat = '0'
    end
    object qryTecContratoautomovel: TBooleanField
      FieldName = 'automovel'
    end
    object qryTecContratocartaocredito: TBooleanField
      FieldName = 'cartaocredito'
    end
    object qryTecContratocartaoloja: TBooleanField
      FieldName = 'cartaoloja'
    end
    object qryTecContratocheque: TBooleanField
      FieldName = 'cheque'
    end
    object qryTecContratochequeespecial: TBooleanField
      FieldName = 'chequeespecial'
    end
    object qryTecContratodependentes: TIntegerField
      FieldName = 'dependentes'
      DisplayFormat = '0'
    end
    object qryTecContratoonus: TFloatField
      FieldName = 'onus'
      DisplayFormat = '0.00'
    end
    object qryTecContratoprimogenito: TStringField
      FieldName = 'primogenito'
    end
    object qryTecContratopedidocliente: TStringField
      FieldName = 'pedidocliente'
      Size = 15
    end
    object qryTecContratorenegociado: TStringField
      FieldName = 'renegociado'
      Size = 50
    end
    object qryTecContratoentnumero: TIntegerField
      FieldName = 'entnumero'
    end
    object qryTecContratoentcomplemento: TStringField
      FieldName = 'entcomplemento'
      Size = 100
    end
    object qryTecContratoendnumero: TIntegerField
      FieldName = 'endnumero'
    end
    object qryTecContratoendcomplemento: TStringField
      FieldName = 'endcomplemento'
      Size = 100
    end
    object qryTecContratoempnumero: TIntegerField
      FieldName = 'empnumero'
    end
    object qryTecContratoempcomplemento: TStringField
      FieldName = 'empcomplemento'
      Size = 100
    end
    object qryTecContratoconnumero: TIntegerField
      FieldName = 'connumero'
    end
    object qryTecContratoconcomplemento: TStringField
      FieldName = 'concomplemento'
      Size = 100
    end
    object qryTecContratorefnumero: TIntegerField
      FieldName = 'refnumero'
    end
    object qryTecContratorefcomplemento: TStringField
      FieldName = 'refcomplemento'
      Size = 100
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
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select p.contrato,'
      '       p.numero,'
      '       p.parcelaorigem,'
      '       p.datavencto,'
      '       p.valorvencto,'
      '       p.parcelaadicional,'
      '       p.pagamentoextracaixa,'
      '       p.formapagamento,'
      '       cast(case when p.tipopagto = '#39'E'#39' then '#39'Estornado'#39
      '            when tipopagto = '#39'J'#39' then '#39'Perdas judiciais'#39
      '            when tipopagto = '#39'D'#39' then '#39'a Devolver'#39
      '            when tipopagto = '#39'C'#39' then '#39'Devolvido'#39
      '            when tipopagto = '#39'P'#39' then '#39'Pagto estornado'#39
      '            when tipopagto = '#39'X'#39' then '#39'Estorno devolvido'#39
      
        '            else case when p.datapagto is not null then '#39'Quitada' +
        #39' else '#39#39' end'
      '       end as varchar) as tipopagto,'
      '       p.datapagto,'
      '       cast(False as Boolean) as Selecionado '
      'from parcelas p'
      'where (p.contrato = :contrato)'
      'order by p.contrato, datavencto'
      '')
    RequestLive = True
    Left = 442
    Top = 143
    ParamData = <
      item
        DataType = ftString
        Name = 'contrato'
        ParamType = ptUnknown
      end>
    object qryParcelascontrato: TStringField
      FieldName = 'contrato'
      Visible = False
    end
    object qryParcelasdatavencto: TDateField
      Alignment = taCenter
      DisplayLabel = 'Vencimento'
      DisplayWidth = 12
      FieldName = 'datavencto'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasvalorvencto: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 15
      FieldName = 'valorvencto'
      DisplayFormat = '0.00'
    end
    object qryParcelasnumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryParcelastipopagto: TStringField
      FieldName = 'tipopagto'
    end
    object qryParcelasformapagamento: TStringField
      FieldName = 'formapagamento'
      Size = 1
    end
    object qryParcelasselecionado: TBooleanField
      FieldName = 'selecionado'
    end
    object qryParcelasdatapagto: TDateField
      Alignment = taCenter
      FieldName = 'datapagto'
      Visible = False
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasparcelaorigem: TStringField
      FieldName = 'parcelaorigem'
      Size = 7
    end
    object qryParcelasparcelaadicional: TBooleanField
      FieldName = 'parcelaadicional'
    end
    object qryParcelaspagamentoextracaixa: TBooleanField
      FieldName = 'pagamentoextracaixa'
    end
  end
  object qryProdutosContratos: TtecQuery
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
      'select pc.contrato,'
      '       pc.produto,'
      '       pc.filial,'
      '       pc.numero,'
      '       pc.quantidade,'
      '       pc.cancelado,'
      '       pc.precovenda,'
      '       pc.precotabela,'
      '       pc.descricaoprecovenda,'
      '       pc.montagem,'
      '       pc.entrega,'
      '       pc.produtolista,'
      '       coalesce((select m.emestoque'
      '                 from movimentos m'
      '                 where m.numero = (select max(m2.numero)'
      '                                   from movimentos m2'
      
        '                                   where (m2.produto = pc.produt' +
        'o) and'
      '                                         (m2.filial = pc.filial)'
      '                                  )'
      '               ),0)'
      '       as emestoque,'
      '       coalesce((select m.reservado'
      '                 from movimentos m'
      '                 where m.numero = (select max(m2.numero)'
      '                                   from movimentos m2'
      
        '                                   where (m2.produto = pc.produt' +
        'o) and'
      '                                         (m2.filial = pc.filial)'
      '                                  )'
      '               ),0)'
      '       as reservado,'
      '       coalesce((select m.futuro'
      '                 from movimentos m'
      '                 where m.numero = (select max(m2.numero)'
      '                                   from movimentos m2'
      
        '                                   where (m2.produto = pc.produt' +
        'o) and'
      '                                         (m2.filial = pc.filial)'
      '                                  )'
      '               ),0)'
      '       as futuro,'
      '       (select p.descricao'
      '        from produtos p'
      '        where p.codigo = pc.produto) as descricao,'
      '       (select c.unidade'
      '        from caracteristicas c'
      '        where c.codigo = p.caracteristica) as unidade,'
      '       (select c.vendanegativa'
      '        from caracteristicas c'
      '        where c.codigo = p.caracteristica) as vendasemestoque,'
      '       (select ei.valor'
      '        from estadosicms ei'
      '        where (ei.estado = :estado) and'
      '                   (ei.icms = (select c2.icms'
      '                                     from caracteristicas c2'
      
        '                                     where c2.codigo = p.caracte' +
        'ristica))'
      '       ) as aliquotaicms,'
      '       (select c1.icms'
      '        from caracteristicas c1'
      '        where c1.codigo = p.caracteristica) as icms,'
      '       (select i.aliquota'
      '        from ipi i'
      '        where i.codigo = (select c.ipi'
      '                                     from caracteristicas c'
      
        '                                     where c.codigo = p.caracter' +
        'istica)'
      '       ) as aliquotaipi,'
      ''
      '       (select c.origem'
      '           from caracteristicas c'
      '           where c.codigo = p.caracteristica) as origem,'
      '           '
      '       (select t.valor'
      '        from tributosicms t'
      '        where t.codigo = (select c4.incidencia'
      '                          from caracteristicas c4'
      
        '                          where c4.codigo = p.caracteristica)) a' +
        's incidencia,'
      '       (select f.transfautomatica'
      '        from filiais f'
      '        where f.codigo = pc.filial'
      '       ) as transfautomatica,'
      '       (select c.montagem'
      '        from caracteristicas c'
      '        where c.codigo = p.caracteristica) as montagemoriginal,'
      '       (select c.percreducaobase'
      '        from caracteristicas c'
      '        where c.codigo = p.caracteristica) as percreducaobase,'
      '       pc.reserva,'
      '       pc.brinde,'
      '       pc.vendedor,'
      '       pc.movimento,'
      '       pc.classificacaofiscal,'
      '       pc.ipi,'
      '       pc.desconto,'
      '       0 as qtdecopiar,'
      '       (select pr.quantidade'
      '        from produtosreservas pr'
      '        where (pc.produto = pr.produto) and'
      '                   (pc.filial = pr.filial) and'
      '                   (pc.reserva = pr.reserva)'
      '       ) as qtdereservaprevia,'
      '       false as incluirnanotafiscal,'
      '       false as incluirnalistacasamento,'
      '       false as promocao,'
      
        '       (select g.descricao from grades g, caracteristicas c wher' +
        'e c.codigo = p.caracteristica and g.codigo = c.grade1) as linha,'
      
        '       (select g.descricao from grades g, caracteristicas c wher' +
        'e c.codigo = p.caracteristica and g.codigo = c.grade2) as coluna' +
        ','
      '       p.valorgrade1,'
      '       p.valorgrade2'
      'from produtoscontratos pc, produtos p'
      'where (p.codigo = pc.produto) and'
      '          (contrato = :contrato)'
      'Order By pc.numero')
    RequestLive = True
    Left = 532
    Top = 145
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'estado'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'contrato'
        ParamType = ptUnknown
      end>
    object qryProdutosContratosfilial: TIntegerField
      DisplayLabel = 'Filial'
      DisplayWidth = 3
      FieldName = 'filial'
      Required = True
      DisplayFormat = '0'
    end
    object qryProdutosContratoscontrato: TStringField
      FieldName = 'contrato'
      Visible = False
    end
    object qryProdutosContratosproduto: TLargeintField
      DisplayLabel = 'Itens'
      DisplayWidth = 7
      FieldName = 'produto'
      Required = True
      DisplayFormat = '0'
    end
    object qryProdutosContratosdescricao: TStringField
      DisplayWidth = 62
      FieldName = 'descricao'
      Size = 50
    end
    object qryProdutosContratosunidade: TStringField
      DisplayLabel = 'UN'
      DisplayWidth = 8
      FieldName = 'unidade'
      Visible = False
      Size = 8
    end
    object qryProdutosContratosicms: TIntegerField
      FieldName = 'icms'
      Visible = False
      DisplayFormat = '0'
    end
    object qryProdutosContratosaliquotaicms: TFloatField
      FieldName = 'aliquotaicms'
      Visible = False
      DisplayFormat = '0.00'
    end
    object qryProdutosContratosquantidade: TFloatField
      DisplayLabel = 'Qtdade'
      DisplayWidth = 6
      FieldName = 'quantidade'
      Required = True
      DisplayFormat = '0'
    end
    object qryProdutosContratoscancelado: TFloatField
      DisplayLabel = 'Canc'
      DisplayWidth = 4
      FieldName = 'cancelado'
      DisplayFormat = '0'
    end
    object qryProdutosContratosprecotabela: TFloatField
      FieldName = 'precotabela'
      Required = True
      Visible = False
      DisplayFormat = '0.00'
    end
    object qryProdutosContratosprecovenda: TFloatField
      DisplayWidth = 7
      FieldName = 'precovenda'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryProdutosContratosreserva: TIntegerField
      FieldName = 'reserva'
      DisplayFormat = '0'
    end
    object qryProdutosContratosmontagem: TStringField
      DisplayLabel = 'Montar'
      DisplayWidth = 5
      FieldName = 'montagem'
      Required = True
      Size = 1
    end
    object qryProdutosContratosbrinde: TBooleanField
      FieldName = 'brinde'
    end
    object qryProdutosContratosentrega: TStringField
      DisplayLabel = 'Entregar'
      DisplayWidth = 4
      FieldName = 'entrega'
      Required = True
      Size = 1
    end
    object qryProdutosContratosmovimento: TIntegerField
      FieldName = 'movimento'
      Visible = False
      DisplayFormat = '0'
    end
    object qryProdutosContratosvendasemestoque: TStringField
      FieldName = 'vendasemestoque'
      Visible = False
      Size = 50
    end
    object qryProdutosContratostransfautomatica: TBooleanField
      FieldName = 'transfautomatica'
      Visible = False
    end
    object qryProdutosContratosdescricaoprecovenda: TStringField
      FieldName = 'descricaoprecovenda'
      Visible = False
      Size = 40
    end
    object qryProdutosContratosmontagemoriginal: TBooleanField
      FieldName = 'montagemoriginal'
    end
    object qryProdutosContratosvendedor: TIntegerField
      FieldName = 'vendedor'
      Required = True
      DisplayFormat = '0'
    end
    object qryProdutosContratosincluirnanotafiscal: TBooleanField
      FieldName = 'incluirnanotafiscal'
    end
    object qryProdutosContratosincluirnalistacasamento: TBooleanField
      FieldName = 'incluirnalistacasamento'
    end
    object qryProdutosContratosprodutolista: TBooleanField
      FieldName = 'produtolista'
    end
    object qryProdutosContratosorigem: TIntegerField
      FieldName = 'origem'
      DisplayFormat = '0'
    end
    object qryProdutosContratosincidencia: TStringField
      FieldName = 'incidencia'
      Size = 50
    end
    object qryProdutosContratospercreducaobase: TFloatField
      FieldName = 'percreducaobase'
      DisplayFormat = '0.00'
    end
    object qryProdutosContratosemestoque: TFloatField
      FieldName = 'emestoque'
      DisplayFormat = '0'
    end
    object qryProdutosContratosreservado: TFloatField
      FieldName = 'reservado'
      DisplayFormat = '0'
    end
    object qryProdutosContratosfuturo: TFloatField
      FieldName = 'futuro'
      DisplayFormat = '0'
    end
    object qryProdutosContratosqtdecopiar: TIntegerField
      FieldName = 'qtdecopiar'
      DisplayFormat = '0'
    end
    object qryProdutosContratosnumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryProdutosContratospromocao: TBooleanField
      FieldName = 'promocao'
    end
    object qryProdutosContratosaliquotaipi: TFloatField
      FieldName = 'aliquotaipi'
      DisplayFormat = '0.00'
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
    object qryProdutosContratoslinha: TStringField
      FieldName = 'linha'
      Size = 50
    end
    object qryProdutosContratoscoluna: TStringField
      FieldName = 'coluna'
      Size = 50
    end
    object qryProdutosContratosqtdereservaprevia: TFloatField
      FieldName = 'qtdereservaprevia'
      DisplayFormat = '0.00'
    end
    object qryProdutosContratosclassificacaofiscal: TStringField
      FieldName = 'classificacaofiscal'
      Size = 10
    end
    object qryProdutosContratosipi: TIntegerField
      FieldName = 'ipi'
      DisplayFormat = '0'
    end
    object qryProdutosContratosdesconto: TFloatField
      FieldName = 'desconto'
      DisplayFormat = '0.00'
    end
  end
  object spcContratosProximo: TtecQuery
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
      'select contratos_proximonumero() as numero')
    RequestLive = False
    Left = 499
    Top = 80
    object spcContratosProximonumero: TStringField
      FieldName = 'numero'
    end
  end
  object qryCliente: TtecQuery
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
      'select c.*,'
      '          (select b.nome'
      '           from bairros b'
      '           where b.estado = c.estado and'
      '                 b.cidade = c.cidade and'
      '                 b.codigo = c.bairro'
      '          ) as nomebairro,'
      '          (select d.nome'
      '           from cidades d'
      '           where d.estado = c.estado and'
      '                 d.codigo = c.cidade'
      '          ) as nomecidade'
      'from clientes c'
      'where c.codigo  = :codigo ')
    RequestLive = True
    Left = 531
    Top = 29
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryClientecodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryClientenome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryClientepessoatipo: TStringField
      FieldName = 'pessoatipo'
      Size = 1
    end
    object qryClientepessoanumero: TStringField
      FieldName = 'pessoanumero'
      Size = 14
    end
    object qryClienterua: TStringField
      FieldName = 'rua'
      Size = 100
    end
    object qryClienteestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object qryClientecidade: TIntegerField
      FieldName = 'cidade'
    end
    object qryClientebairro: TIntegerField
      FieldName = 'bairro'
    end
    object qryClientecep: TIntegerField
      FieldName = 'cep'
    end
    object qryClientefoneddd: TIntegerField
      FieldName = 'foneddd'
    end
    object qryClientefonenumero: TIntegerField
      FieldName = 'fonenumero'
    end
    object qryClientefoneramal: TStringField
      FieldName = 'foneramal'
      Size = 10
    end
    object qryClientenomebairro: TStringField
      FieldName = 'nomebairro'
      Size = 50
    end
    object qryClientenomecidade: TStringField
      FieldName = 'nomecidade'
      Size = 50
    end
    object qryClientenascto: TDateField
      FieldName = 'nascto'
    end
    object qryClienteapelido: TStringField
      FieldName = 'apelido'
    end
    object qryClientesexo: TStringField
      FieldName = 'sexo'
      Size = 1
    end
    object qryClientecivil: TStringField
      FieldName = 'civil'
      Size = 1
    end
    object qryClientecivildata: TDateField
      FieldName = 'civildata'
    end
    object qryClienteiddocumento: TStringField
      FieldName = 'iddocumento'
    end
    object qryClienteidorgao: TStringField
      FieldName = 'idorgao'
      Size = 5
    end
    object qryClienteiddata: TDateField
      FieldName = 'iddata'
    end
    object qryClienteidestado: TStringField
      FieldName = 'idestado'
      Size = 2
    end
    object qryClientemae: TStringField
      FieldName = 'mae'
      Size = 40
    end
    object qryClientepai: TStringField
      FieldName = 'pai'
      Size = 40
    end
    object qryClienteconceito: TIntegerField
      FieldName = 'conceito'
    end
    object qryClientenaturalcidade: TIntegerField
      FieldName = 'naturalcidade'
    end
    object qryClientenaturalestado: TStringField
      FieldName = 'naturalestado'
      Size = 2
    end
    object qryClientefonetipo: TStringField
      FieldName = 'fonetipo'
      Size = 1
    end
    object qryClientefone2ddd: TIntegerField
      FieldName = 'fone2ddd'
    end
    object qryClientefone2numero: TIntegerField
      FieldName = 'fone2numero'
    end
    object qryClientefone2ramal: TStringField
      FieldName = 'fone2ramal'
      Size = 10
    end
    object qryClienterestipo: TStringField
      FieldName = 'restipo'
      Size = 1
    end
    object qryClienteresonus: TFloatField
      FieldName = 'resonus'
    end
    object qryClienterestempo: TDateField
      FieldName = 'restempo'
    end
    object qryClienteempresa: TStringField
      FieldName = 'empresa'
      Size = 40
    end
    object qryClienteempadmissao: TDateField
      FieldName = 'empadmissao'
    end
    object qryClienteempcep: TIntegerField
      FieldName = 'empcep'
    end
    object qryClienteempcomprovado: TBooleanField
      FieldName = 'empcomprovado'
    end
    object qryClienteempfoneddd: TIntegerField
      FieldName = 'empfoneddd'
    end
    object qryClienteempfonenumero: TIntegerField
      FieldName = 'empfonenumero'
    end
    object qryClienteempfoneramal: TStringField
      FieldName = 'empfoneramal'
      Size = 10
    end
    object qryClienteempoutrasdescricao: TStringField
      FieldName = 'empoutrasdescricao'
      Size = 40
    end
    object qryClienteempoutrasfaixa: TIntegerField
      FieldName = 'empoutrasfaixa'
    end
    object qryClienteempoutrasvalor: TFloatField
      FieldName = 'empoutrasvalor'
    end
    object qryClienteemprendafaixa: TIntegerField
      FieldName = 'emprendafaixa'
    end
    object qryClienteemprendavalor: TFloatField
      FieldName = 'emprendavalor'
    end
    object qryClienteemprua: TStringField
      FieldName = 'emprua'
      Size = 100
    end
    object qryClienteempestado: TStringField
      FieldName = 'empestado'
      Size = 2
    end
    object qryClienteempcidade: TIntegerField
      FieldName = 'empcidade'
    end
    object qryClienteempbairro: TIntegerField
      FieldName = 'empbairro'
    end
    object qryClienteempcargo: TIntegerField
      FieldName = 'empcargo'
    end
    object qryClienteconjuge: TIntegerField
      FieldName = 'conjuge'
    end
    object qryClienteconnome: TStringField
      FieldName = 'connome'
      Size = 40
    end
    object qryClienteconadmissao: TDateField
      FieldName = 'conadmissao'
    end
    object qryClienteconcep: TIntegerField
      FieldName = 'concep'
    end
    object qryClienteconempresa: TStringField
      FieldName = 'conempresa'
      Size = 40
    end
    object qryClienteconfoneddd: TIntegerField
      FieldName = 'confoneddd'
    end
    object qryClienteconfonenumero: TIntegerField
      FieldName = 'confonenumero'
    end
    object qryClienteconfoneramal: TStringField
      FieldName = 'confoneramal'
      Size = 10
    end
    object qryClienteconnascto: TDateField
      FieldName = 'connascto'
    end
    object qryClienteconrendafaixa: TIntegerField
      FieldName = 'conrendafaixa'
    end
    object qryClienteconrendavalor: TFloatField
      FieldName = 'conrendavalor'
    end
    object qryClienteconrua: TStringField
      FieldName = 'conrua'
      Size = 100
    end
    object qryClienteconestado: TStringField
      FieldName = 'conestado'
      Size = 2
    end
    object qryClienteconcidade: TIntegerField
      FieldName = 'concidade'
    end
    object qryClienteconbairro: TIntegerField
      FieldName = 'conbairro'
    end
    object qryClienteconcargo: TIntegerField
      FieldName = 'concargo'
    end
    object qryClientereferencia: TStringField
      FieldName = 'referencia'
      Size = 40
    end
    object qryClientereftipo: TStringField
      FieldName = 'reftipo'
      Size = 1
    end
    object qryClienterefrua: TStringField
      FieldName = 'refrua'
      Size = 100
    end
    object qryClienterefestado: TStringField
      FieldName = 'refestado'
      Size = 2
    end
    object qryClienterefcidade: TIntegerField
      FieldName = 'refcidade'
    end
    object qryClienterefbairro: TIntegerField
      FieldName = 'refbairro'
    end
    object qryClienterefcep: TIntegerField
      FieldName = 'refcep'
    end
    object qryClientereffoneddd: TIntegerField
      FieldName = 'reffoneddd'
    end
    object qryClientereffonenumero: TIntegerField
      FieldName = 'reffonenumero'
    end
    object qryClientereffoneramal: TStringField
      FieldName = 'reffoneramal'
      Size = 10
    end
    object qryClientereffone2ddd: TIntegerField
      FieldName = 'reffone2ddd'
    end
    object qryClientereffone2numero: TIntegerField
      FieldName = 'reffone2numero'
    end
    object qryClientereffone2ramal: TStringField
      FieldName = 'reffone2ramal'
      Size = 10
    end
    object qryClienteobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 512
    end
    object qryClienteemail: TStringField
      FieldName = 'email'
      Size = 128
    end
    object qryClienteautomovel: TBooleanField
      FieldName = 'automovel'
    end
    object qryClientecartaocredito: TBooleanField
      FieldName = 'cartaocredito'
    end
    object qryClientecartaoloja: TBooleanField
      FieldName = 'cartaoloja'
    end
    object qryClientecheque: TBooleanField
      FieldName = 'cheque'
    end
    object qryClientechequeespecial: TBooleanField
      FieldName = 'chequeespecial'
    end
    object qryClientedependentes: TIntegerField
      FieldName = 'dependentes'
    end
    object qryClienteonus: TFloatField
      FieldName = 'onus'
    end
    object qryClienteenderecoalterado: TDateField
      FieldName = 'enderecoalterado'
    end
    object qryClientefilialcadastro: TIntegerField
      FieldName = 'filialcadastro'
    end
    object qryClientenumero: TIntegerField
      FieldName = 'numero'
    end
    object qryClientecomplemento: TStringField
      FieldName = 'complemento'
      Size = 100
    end
    object qryClienteempnumero: TIntegerField
      FieldName = 'empnumero'
    end
    object qryClienteempcomplemento: TStringField
      FieldName = 'empcomplemento'
      Size = 100
    end
    object qryClienteconnumero: TIntegerField
      FieldName = 'connumero'
    end
    object qryClienteconcomplemento: TStringField
      FieldName = 'concomplemento'
      Size = 100
    end
    object qryClienterefnumero: TIntegerField
      FieldName = 'refnumero'
    end
    object qryClienterefcomplemento: TStringField
      FieldName = 'refcomplemento'
      Size = 100
    end
    object qryClientedebito: TIntegerField
      FieldName = 'debito'
    end
    object qryClientecredito: TIntegerField
      FieldName = 'credito'
    end
  end
  object dsrCliente: TtecDataSource
    DataSet = qryCliente
    Left = 545
    Top = 45
  end
  object qryProdutosDadosFiscaisComplementar: TtecQuery
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
      'select pdf.*,'
      '       pdf.quantidade as entregue,'
      '       osp.pedidocliente,'
      '       cp.produto_cliente as produtocliente,'
      '       osp.quantidade as pedida,'
      '       cp.origem as origemproduto'
      ''
      'from produtosdadosfiscais pdf'
      '     join produtos p'
      '          join caracteristicas c'
      '          on p.caracteristica = c.codigo'
      '     on pdf.produto = p.codigo'
      '     join osp'
      '          join clientesprodutos cp'
      '          on osp.cliente = cp.cliente'
      '          and osp.produto = cp.produto'
      '          and cp.tipocliente = '#39'C'#39
      '     on pdf.osp = osp.numero'
      'where pdf.dadofiscal = :dadofiscal')
    RequestLive = True
    Left = 160
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dadofiscal'
        ParamType = ptUnknown
      end>
    object qryProdutosDadosFiscaisComplementardadofiscal: TIntegerField
      FieldName = 'dadofiscal'
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaisComplementarnumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaisComplementarproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryProdutosDadosFiscaisComplementarfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaisComplementarvendedor: TIntegerField
      FieldName = 'vendedor'
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaisComplementarentregar: TBooleanField
      FieldName = 'entregar'
    end
    object qryProdutosDadosFiscaisComplementarquantidade: TFloatField
      FieldName = 'quantidade'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisComplementarprecovenda: TFloatField
      FieldName = 'precovenda'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisComplementarprecotabela: TFloatField
      FieldName = 'precotabela'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisComplementardescricaoprecovenda: TStringField
      FieldName = 'descricaoprecovenda'
      Size = 40
    end
    object qryProdutosDadosFiscaisComplementarreserva: TIntegerField
      FieldName = 'reserva'
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaisComplementaraliquotaicms: TFloatField
      FieldName = 'aliquotaicms'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisComplementarreducaobase: TFloatField
      FieldName = 'reducaobase'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisComplementarincidencia: TStringField
      FieldName = 'incidencia'
      Size = 2
    end
    object qryProdutosDadosFiscaisComplementarorigem: TIntegerField
      FieldName = 'origem'
    end
    object qryProdutosDadosFiscaisComplementaricms: TIntegerField
      FieldName = 'icms'
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaisComplementarmovimento: TIntegerField
      FieldName = 'movimento'
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaisComplementarbaseicms: TFloatField
      FieldName = 'baseicms'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisComplementaraliquotaipi: TFloatField
      FieldName = 'aliquotaipi'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisComplementarvaloripi: TFloatField
      FieldName = 'valoripi'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisComplementarclassificacaofiscal: TStringField
      FieldName = 'classificacaofiscal'
      Size = 10
    end
    object qryProdutosDadosFiscaisComplementaripi: TIntegerField
      FieldName = 'ipi'
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaisComplementarcomposto: TBooleanField
      FieldName = 'composto'
    end
    object qryProdutosDadosFiscaisComplementardiscriminarcomposto: TStringField
      FieldName = 'discriminarcomposto'
      Size = 1
    end
    object qryProdutosDadosFiscaisComplementardiscriminarpreco: TBooleanField
      FieldName = 'discriminarpreco'
    end
    object qryProdutosDadosFiscaisComplementarfatorsubstituicao: TFloatField
      FieldName = 'fatorsubstituicao'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisComplementarpercentualreducaobase: TFloatField
      FieldName = 'percentualreducaobase'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisComplementarcodigonota: TIntegerField
      FieldName = 'codigonota'
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaisComplementarbrinde: TBooleanField
      FieldName = 'brinde'
    end
    object qryProdutosDadosFiscaisComplementaracrescimo: TFloatField
      FieldName = 'acrescimo'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisComplementardesconto: TFloatField
      FieldName = 'desconto'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisComplementarfrete: TFloatField
      FieldName = 'frete'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisComplementarseguro: TFloatField
      FieldName = 'seguro'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisComplementarsubstituicaoipi: TBooleanField
      FieldName = 'substituicaoipi'
    end
    object qryProdutosDadosFiscaisComplementardespesasacessorias: TFloatField
      FieldName = 'despesasacessorias'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisComplementarvalordescontoitem: TFloatField
      FieldName = 'valordescontoitem'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisComplementarnatureza: TIntegerField
      FieldName = 'natureza'
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaisComplementarcodigofiscal: TIntegerField
      FieldName = 'codigofiscal'
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaisComplementarosp: TIntegerField
      FieldName = 'osp'
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaisComplementarccf: TIntegerField
      FieldName = 'ccf'
    end
    object qryProdutosDadosFiscaisComplementarcst: TIntegerField
      FieldName = 'cst'
    end
    object qryProdutosDadosFiscaisComplementarsequenciaipi: TIntegerField
      FieldName = 'sequenciaipi'
    end
    object qryProdutosDadosFiscaisComplementardescricaoproduto: TStringField
      FieldName = 'descricaoproduto'
      Size = 162
    end
    object qryProdutosDadosFiscaisComplementargenero: TIntegerField
      FieldName = 'genero'
    end
    object qryProdutosDadosFiscaisComplementarextipi: TStringField
      FieldName = 'extipi'
      Size = 3
    end
    object qryProdutosDadosFiscaisComplementaricmsmodalidade: TIntegerField
      FieldName = 'icmsmodalidade'
    end
    object qryProdutosDadosFiscaisComplementaricmsmodsubst: TIntegerField
      FieldName = 'icmsmodsubst'
    end
    object qryProdutosDadosFiscaisComplementartribcodigoean: TStringField
      FieldName = 'tribcodigoean'
      Size = 14
    end
    object qryProdutosDadosFiscaisComplementartribunidade: TStringField
      FieldName = 'tribunidade'
      Size = 6
    end
    object qryProdutosDadosFiscaisComplementartribquantidade: TFloatField
      FieldName = 'tribquantidade'
    end
    object qryProdutosDadosFiscaisComplementartribunitario: TFloatField
      FieldName = 'tribunitario'
    end
    object qryProdutosDadosFiscaisComplementarenquadramento: TIntegerField
      FieldName = 'enquadramento'
    end
    object qryProdutosDadosFiscaisComplementaripicst: TStringField
      FieldName = 'ipicst'
      Size = 2
    end
    object qryProdutosDadosFiscaisComplementaripibasecalculo: TFloatField
      FieldName = 'ipibasecalculo'
    end
    object qryProdutosDadosFiscaisComplementariibasecalculo: TFloatField
      FieldName = 'iibasecalculo'
    end
    object qryProdutosDadosFiscaisComplementariidespaduaneira: TFloatField
      FieldName = 'iidespaduaneira'
    end
    object qryProdutosDadosFiscaisComplementariivalor: TFloatField
      FieldName = 'iivalor'
    end
    object qryProdutosDadosFiscaisComplementariiiof: TFloatField
      FieldName = 'iiiof'
    end
    object qryProdutosDadosFiscaisComplementarpiscst: TStringField
      FieldName = 'piscst'
      Size = 2
    end
    object qryProdutosDadosFiscaisComplementarpisbasecalculo: TFloatField
      FieldName = 'pisbasecalculo'
    end
    object qryProdutosDadosFiscaisComplementarpisaliquota: TFloatField
      FieldName = 'pisaliquota'
    end
    object qryProdutosDadosFiscaisComplementarpisvalor: TFloatField
      FieldName = 'pisvalor'
    end
    object qryProdutosDadosFiscaisComplementarcofinscst: TStringField
      FieldName = 'cofinscst'
      Size = 2
    end
    object qryProdutosDadosFiscaisComplementarcofinsbasecalculo: TFloatField
      FieldName = 'cofinsbasecalculo'
    end
    object qryProdutosDadosFiscaisComplementarcofinsaliquota: TFloatField
      FieldName = 'cofinsaliquota'
    end
    object qryProdutosDadosFiscaisComplementarcofinsvalor: TFloatField
      FieldName = 'cofinsvalor'
    end
    object qryProdutosDadosFiscaisComplementaricmsvalor: TFloatField
      FieldName = 'icmsvalor'
    end
    object qryProdutosDadosFiscaisComplementarunidade: TStringField
      FieldName = 'unidade'
      Size = 50
    end
    object qryProdutosDadosFiscaisComplementaricmsbasecalculo: TFloatField
      FieldName = 'icmsbasecalculo'
    end
    object qryProdutosDadosFiscaisComplementarpedidocliente: TStringField
      FieldName = 'pedidocliente'
      Size = 50
    end
    object qryProdutosDadosFiscaisComplementarprodutocliente: TStringField
      FieldName = 'produtocliente'
      Size = 50
    end
    object qryProdutosDadosFiscaisComplementarpedida: TFloatField
      FieldName = 'pedida'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisComplementarentregue: TFloatField
      FieldName = 'entregue'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisComplementarpn: TStringField
      FieldName = 'pn'
      Size = 10
    end
    object qryProdutosDadosFiscaisComplementarorigemproduto: TStringField
      FieldName = 'origemproduto'
      Size = 1
    end
    object qryProdutosDadosFiscaisComplementarcodigovisual: TStringField
      FieldName = 'codigovisual'
      Size = 50
    end
  end
  object dsrProdutosDadosFiscaisComplementar: TtecDataSource
    DataSet = qryProdutosDadosFiscaisComplementar
    Left = 176
    Top = 32
  end
  object qryVolumesDadosFiscais: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterInsert = qryVolumesDadosFiscaisAfterInsert
    BeforeDelete = qryVolumesDadosFiscaisBeforeDelete
    AfterDelete = qryVolumesDadosFiscaisAfterDelete
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select vdf.*'
      'from volumesdadosfiscais vdf'
      'where vdf.dadofiscal = :dadofiscal')
    RequestLive = True
    Left = 40
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dadofiscal'
        ParamType = ptUnknown
      end>
    object qryVolumesDadosFiscaisdadofiscal: TIntegerField
      FieldName = 'dadofiscal'
      DisplayFormat = '0'
    end
    object qryVolumesDadosFiscaiscodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryVolumesDadosFiscaisvolumes: TIntegerField
      DisplayLabel = 'VOLUMES'
      FieldName = 'volumes'
      DisplayFormat = '0'
    end
    object qryVolumesDadosFiscaisnumeracao: TStringField
      DisplayLabel = 'NUMERA'#199#195'O'
      FieldName = 'numeracao'
      Size = 9
    end
    object qryVolumesDadosFiscaismarca: TStringField
      DisplayLabel = 'MARCA'
      FieldName = 'marca'
      Size = 60
    end
    object qryVolumesDadosFiscaispesobruto: TFloatField
      DisplayLabel = 'PESO BRUTO'
      FieldName = 'pesobruto'
      DisplayFormat = '0.00'
    end
    object qryVolumesDadosFiscaispesoliquido: TFloatField
      DisplayLabel = 'PESO L'#205'QUIDO'
      FieldName = 'pesoliquido'
      DisplayFormat = '0.00'
    end
    object qryVolumesDadosFiscaisespecietransporte: TStringField
      DisplayLabel = 'ESP'#201'CIE TRANSPORTE'
      FieldName = 'especietransporte'
      Size = 60
    end
  end
  object dsrVolumesDadosFiscais: TtecDataSource
    DataSet = qryVolumesDadosFiscais
    Left = 72
    Top = 232
  end
  object qryLacresVolumesDadosFiscais: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkFields = 'codigo=codigovolume'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrVolumesDadosFiscais
    Constraints = <>
    AfterInsert = qryLacresVolumesDadosFiscaisAfterInsert
    AfterPost = qryLacresVolumesDadosFiscaisAfterPost
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select lvdf.*'
      'from lacresvolumesdadosfiscais lvdf'
      'where lvdf.dadofiscal = :dadofiscal')
    RequestLive = True
    Left = 176
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dadofiscal'
        ParamType = ptUnknown
      end>
    object qryLacresVolumesDadosFiscaisdadofiscal: TIntegerField
      FieldName = 'dadofiscal'
    end
    object qryLacresVolumesDadosFiscaiscodigovolume: TIntegerField
      FieldName = 'codigovolume'
    end
    object qryLacresVolumesDadosFiscaislacre: TStringField
      FieldName = 'lacre'
      Size = 60
    end
  end
  object dsrLacresVolumesDadosFiscais: TtecDataSource
    DataSet = qryLacresVolumesDadosFiscais
    Left = 208
    Top = 256
  end
  object qryConsultaNaturezasCFOP: TtecQuery
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
        Name = 'CodigoFiscal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaVendas'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select n.codigo, n.descricao,'
      '         case when '#39'F'#39' = :local then n.codigofiscal + 1000'
      '                 when '#39'E'#39' = :local then n.codigofiscal + 2000'
      '                 else  n.codigofiscal'
      '         end as codigofiscal'
      'from naturezas n'
      'where (n.inativo is null) '
      '/*   and (Not n.gerarpagamento or (n.gerarpagamento is null)) */'
      '   and (n.tipo = '#39'S'#39') '
      '   %CodigoFiscal'
      '   and (((mod(n.codigofiscal,1000)) in ('
      '   %ListaVendas'
      '          )))'
      'order by UPPER(TO_ASCII(n.descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 408
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'local'
        ParamType = ptUnknown
      end>
    object qryConsultaNaturezasCFOPcodigofiscal: TIntegerField
      DisplayLabel = 'C'#243'digo Fiscal'
      FieldName = 'codigofiscal'
    end
    object qryConsultaNaturezasCFOPdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 70
    end
    object qryConsultaNaturezasCFOPcodigo: TIntegerField
      FieldName = 'codigo'
      Visible = False
    end
  end
  object qryProcuraNaturezasCFOP: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeOpen = qryProcuraNaturezasCFOPBeforeOpen
    AfterOpen = qryProcuraNaturezasCFOPAfterOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'codigoconsulta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaVendas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigonatureza'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select (select cf.descricao'
      '        from codigosfiscais cf'
      '        where cf.codigo = :codigofiscal) as descricao,'
      ''
      '         case when '#39'F'#39' = :local then n.codigofiscal + 1000'
      '                 when '#39'E'#39' = :local then n.codigofiscal + 2000'
      '                 else  n.codigofiscal'
      '         end as codigofiscal,'
      '         n.tipomovimento,'
      ''
      '         (select t.operacao'
      '          from tiposmovimentos t'
      '          where t.codigo = n.tipomovimento'
      '         ) as operacao,'
      ''
      '         (select t.transferencia'
      '          from tiposmovimentos t'
      '          where t.codigo = n.tipomovimento'
      '         ) as transferencia,'
      '         n.debitar,'
      '         n.creditar,'
      '         n.historico,'
      '         n.gerarpagamento,'
      '         n.descricao as descricaonatureza,'
      '         n.codigo as codigonatureza,'
      '         n.destacaripi,'
      '         n.tipo,'
      '         n.icmscst,'
      '         n.csosn,'
      '         n.ipicst,'
      '         n.piscst,'
      
        '         n.cofinscst, n.credbigualvalornota, n.gravarsemlanctos,' +
        ' n.naogerardebitoicms, n.naogerardebitoipi, n.naoCalcularIPISobr' +
        'eFrete, n.naocalcularvaloresicmsdiferimento'
      'from naturezas n'
      'where (n.inativo is null)'
      '/*   and (Not n.gerarpagamento or (n.gerarpagamento is null))*/'
      '   and (n.tipo in ('#39'S'#39','#39'R'#39'))'
      '   %codigoconsulta'
      '   and (mod(n.codigofiscal,1000)) = (select mod(cf.codigo,1000)'
      
        '                                                  from codigosfi' +
        'scais cf'
      
        '                                                  where cf.codig' +
        'o = :codigofiscal)'
      '   and (((mod(n.codigofiscal,1000)) in ('
      '          %ListaVendas '
      '          )))'
      '   %codigonatureza /* and (n.codigo = :codigonatureza) */')
    RequestLive = False
    Left = 349
    Top = 12
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigofiscal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'local'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigonatureza'
        ParamType = ptUnknown
      end>
    object qryProcuraNaturezasCFOPdescricao: TStringField
      FieldName = 'descricao'
      Size = 70
    end
    object qryProcuraNaturezasCFOPcodigofiscal: TIntegerField
      FieldName = 'codigofiscal'
    end
    object qryProcuraNaturezasCFOPtipomovimento: TStringField
      FieldName = 'tipomovimento'
      Size = 3
    end
    object qryProcuraNaturezasCFOPoperacao: TStringField
      FieldName = 'operacao'
      Size = 50
    end
    object qryProcuraNaturezasCFOPtransferencia: TStringField
      FieldName = 'transferencia'
      Size = 50
    end
    object qryProcuraNaturezasCFOPdebitar: TIntegerField
      FieldName = 'debitar'
    end
    object qryProcuraNaturezasCFOPcreditar: TIntegerField
      FieldName = 'creditar'
    end
    object qryProcuraNaturezasCFOPhistorico: TIntegerField
      FieldName = 'historico'
    end
    object qryProcuraNaturezasCFOPgerarpagamento: TBooleanField
      FieldName = 'gerarpagamento'
    end
    object qryProcuraNaturezasCFOPdescricaonatureza: TStringField
      FieldName = 'descricaonatureza'
      Size = 70
    end
    object qryProcuraNaturezasCFOPcodigonatureza: TIntegerField
      FieldName = 'codigonatureza'
    end
    object qryProcuraNaturezasCFOPdestacaripi: TBooleanField
      FieldName = 'destacaripi'
    end
    object qryProcuraNaturezasCFOPtipo: TStringField
      FieldName = 'tipo'
      Size = 1
    end
    object qryProcuraNaturezasCFOPicmscst: TStringField
      FieldName = 'icmscst'
      Size = 2
    end
    object qryProcuraNaturezasCFOPipicst: TStringField
      FieldName = 'ipicst'
      Size = 2
    end
    object qryProcuraNaturezasCFOPpiscst: TStringField
      FieldName = 'piscst'
      Size = 2
    end
    object qryProcuraNaturezasCFOPcofinscst: TStringField
      FieldName = 'cofinscst'
      Size = 2
    end
    object qryProcuraNaturezasCFOPcredbigualvalornota: TBooleanField
      FieldName = 'credbigualvalornota'
    end
    object qryProcuraNaturezasCFOPgravarsemlanctos: TBooleanField
      FieldName = 'gravarsemlanctos'
    end
    object qryProcuraNaturezasCFOPcsosn: TStringField
      FieldName = 'csosn'
      Size = 3
    end
    object qryProcuraNaturezasCFOPnaoGerarDebitoICMS: TBooleanField
      FieldName = 'naoGerarDebitoICMS'
    end
    object qryProcuraNaturezasCFOPnaoGerarDebitoIPI: TBooleanField
      FieldName = 'naoGerarDebitoIPI'
    end
    object qryProcuraNaturezasCFOPnaoCalcularIPISobreFrete: TBooleanField
      FieldName = 'naoCalcularIPISobreFrete'
    end
    object qryProcuraNaturezasCFOPnaocalcularvaloresicmsdiferimento: TBooleanField
      FieldName = 'naocalcularvaloresicmsdiferimento'
    end
  end
  object dsrProcuraNaturezasCFOP: TtecDataSource
    DataSet = qryProcuraNaturezasCFOP
    Left = 376
    Top = 24
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
      '          (valor = :serie)'
      'for update')
    RequestLive = True
    Left = 440
    Top = 202
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
end
