inherited dtmExportacaoNotasTransferencia: TdtmExportacaoNotasTransferencia
  Left = 471
  Top = 242
  Height = 252
  Width = 240
  object qryNotas: TtecQuery
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
        DataType = ftUnknown
        Name = 'NUMERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FILIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SERIE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CFOP'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select dadosfiscais.numero as dadofiscal,'
      '       notas.filial,'
      '       notas.serie,'
      '       notas.numero,'
      '       dadosfiscais.data,'
      '       dadosfiscais.situacao,'
      '       dadosfiscais.manual,'
      '       dadosfiscais.filialvenda,'
      '       dadosfiscais.contrato,'
      '       dadosfiscais.valortotal,'
      '       dadosfiscais.valorvista,'
      '       dadosfiscais.desconto,'
      '       dadosfiscais.valorfrete,'
      '       dadosfiscais.seguro,'
      '       dadosfiscais.valoripi,'
      '       dadosfiscais.valorservicos,'
      '       dadosfiscais.valorprodutos,'
      '       dadosfiscais.despesasacessorias,'
      '       dadosfiscais.codigofiscal,'
      '       dadosfiscais.codigofiscalservico,'
      '       dadosfiscais.vendedor,'
      '       dadosfiscais.agente,'
      '       dadosfiscais.estadocfo,'
      '       dadosfiscais.filialemissao,'
      '       dadosfiscais.natureza,'
      '       dadosfiscais.codigonatureza,'
      '       dadosfiscais.descricaosemprodutos,'
      '       dadosfiscais.plano,'
      '       dadosfiscais.viatransporte,'
      '       dadosfiscais.datasaida,'
      '       dadosfiscais.fornecedortransporte,'
      '       dadosfiscais.frete,'
      '       dadosfiscais.cliente,'
      '       dadosfiscais.tipocliente,'
      '       dadosfiscais.estadoplaca,'
      '       dadosfiscais.placa,'
      '       dadosfiscais.nome,'
      '       dadosfiscais.rua,'
      '       dadosfiscais.endnumero,'
      '       dadosfiscais.endcomplemento,'
      '       dadosfiscais.bairro,'
      '       dadosfiscais.cidade,'
      '       dadosfiscais.estado,'
      '       dadosfiscais.cep,'
      '       dadosfiscais.pessoatipo,'
      '       dadosfiscais.pessoanumero,'
      '       dadosfiscais.fonenumero,'
      '       dadosfiscais.foneddd,'
      '       dadosfiscais.documento,'
      '       dadosfiscais.observacoes,'
      '       dadosfiscais.conceito,'
      '       dadosfiscais.Debitar,'
      '       dadosfiscais.Creditar,'
      '       dadosfiscais.Historico,'
      '       dadosfiscais.totalbaseicmsproprio,'
      '       dadosfiscais.totalvaloricmsproprio,'
      '       dadosfiscais.totalbaseicmssubstituicao,'
      '       dadosfiscais.totalvaloricmssubstituicao,'
      '       dadosfiscais.aliquotaicmsproprio,'
      '       dadosfiscais.anexotres,'
      '       dadosfiscais.acrescimofinanceiro,'
      '       dadosfiscais.acrescimoexcluido,'
      '       dadosfiscais.icmsexcluido,'
      '       dadosfiscais.irretido,'
      '       dadosfiscais.inssretido,'
      '       dadosfiscais.issretido,'
      '       dadosfiscais.cofinsretido,'
      '       dadosfiscais.pisretido,'
      '       dadosfiscais.csllretido,'
      '       dadosfiscais.baseicms,'
      '       dadosfiscais.valoricms,'
      '       dadosfiscais.valorissqn,'
      '       dadosfiscais.substituicaoIPI,'
      '       dadosfiscais.dadofiscalcomplementar,'
      '       dadosfiscais.observacoescomplementar,'
      '       dadosfiscais.obscliente,'
      '       dadosfiscais.obsclienteipisuspenso,'
      '       dadosfiscais.observacoesicmssubstituido,'
      '       dadosfiscais.numlotenfe,'
      '       dadosfiscais.numrecibonfe,'
      '       dadosfiscais.numprotocolonfe,'
      '       dadosfiscais.numcancelamentonfe,'
      '       dadosfiscais.email,'
      '       dadosfiscais.datacancelamento,'
      '       dadosfiscais.ModeloDocto,'
      '       dadosfiscais.LocalRetirada_Numero,'
      '       dadosfiscais.LocalEntrega_Numero,'
      '       dadosfiscais.SUFRAMA,'
      '       dadosfiscais.iesubsttributario,'
      '       dadosfiscais.datahoraemissao,'
      '       dadosfiscais.regimetributario,'
      '       false as selecionar'
      
        'from dadosfiscais join notas on dadosfiscais.numero = notas.dado' +
        'fiscal'
      'where dadosfiscais.situacao <> '#39'C'#39
      '%NUMERO'
      '%FILIAL'
      '%SERIE'
      '%DATA'
      '%CFOP'
      
        'order by dadosfiscais.data, notas.filial, notas.serie, notas.num' +
        'ero')
    RequestLive = True
    Left = 24
    Top = 8
    object qryNotasdadofiscal: TIntegerField
      FieldName = 'dadofiscal'
      DisplayFormat = '0'
    end
    object qryNotasfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryNotasserie: TStringField
      FieldName = 'serie'
      Size = 3
    end
    object qryNotasnumero: TIntegerField
      FieldName = 'numero'
      Required = True
      DisplayFormat = '0'
    end
    object qryNotasdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryNotassituacao: TStringField
      FieldName = 'situacao'
      Required = True
      Size = 1
    end
    object qryNotasmanual: TBooleanField
      FieldName = 'manual'
      Required = True
    end
    object qryNotasfilialvenda: TIntegerField
      FieldName = 'filialvenda'
      Required = True
      DisplayFormat = '0'
    end
    object qryNotascontrato: TStringField
      FieldName = 'contrato'
    end
    object qryNotasvalortotal: TFloatField
      FieldName = 'valortotal'
      Required = True
      DisplayFormat = '###.###.##0,00'
      EditFormat = '###.###.##0,00'
    end
    object qryNotasvalorvista: TFloatField
      FieldName = 'valorvista'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryNotasdesconto: TFloatField
      FieldName = 'desconto'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryNotasvalorfrete: TFloatField
      FieldName = 'valorfrete'
      DisplayFormat = '0.00'
    end
    object qryNotasseguro: TFloatField
      FieldName = 'seguro'
      DisplayFormat = '0.00'
    end
    object qryNotasvaloripi: TFloatField
      FieldName = 'valoripi'
      DisplayFormat = '###.###.##0,00'
      EditFormat = '###.###.##0,00'
    end
    object qryNotasvalorservicos: TFloatField
      FieldName = 'valorservicos'
      DisplayFormat = '0.00'
    end
    object qryNotasvalorprodutos: TFloatField
      FieldName = 'valorprodutos'
      DisplayFormat = '0.00'
    end
    object qryNotasdespesasacessorias: TFloatField
      FieldName = 'despesasacessorias'
      DisplayFormat = '0.00'
    end
    object qryNotascodigofiscal: TIntegerField
      FieldName = 'codigofiscal'
      Required = True
      DisplayFormat = '0'
    end
    object qryNotascodigofiscalservico: TIntegerField
      FieldName = 'codigofiscalservico'
      DisplayFormat = '0'
    end
    object qryNotasvendedor: TIntegerField
      FieldName = 'vendedor'
      DisplayFormat = '0'
    end
    object qryNotasagente: TIntegerField
      FieldName = 'agente'
      DisplayFormat = '0'
    end
    object qryNotasestadocfo: TStringField
      FieldName = 'estadocfo'
      Required = True
      Size = 2
    end
    object qryNotasfilialemissao: TIntegerField
      FieldName = 'filialemissao'
      Required = True
      DisplayFormat = '0'
    end
    object qryNotasnatureza: TStringField
      FieldName = 'natureza'
      Size = 80
    end
    object qryNotascodigonatureza: TIntegerField
      FieldName = 'codigonatureza'
      DisplayFormat = '0'
    end
    object qryNotasdescricaosemprodutos: TStringField
      FieldName = 'descricaosemprodutos'
      Size = 200
    end
    object qryNotasplano: TIntegerField
      FieldName = 'plano'
      DisplayFormat = '0'
    end
    object qryNotasviatransporte: TStringField
      FieldName = 'viatransporte'
      Required = True
      Size = 1
    end
    object qryNotasdatasaida: TDateField
      Alignment = taCenter
      FieldName = 'datasaida'
      EditMask = '99/99/9999;1; '
    end
    object qryNotasfornecedortransporte: TIntegerField
      FieldName = 'fornecedortransporte'
      DisplayFormat = '0'
    end
    object qryNotasfrete: TStringField
      FieldName = 'frete'
      Size = 1
    end
    object qryNotascliente: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object qryNotastipocliente: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
    object qryNotasestadoplaca: TStringField
      FieldName = 'estadoplaca'
      Size = 2
    end
    object qryNotasplaca: TStringField
      FieldName = 'placa'
      Size = 10
    end
    object qryNotasnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryNotasrua: TStringField
      FieldName = 'rua'
      Size = 100
    end
    object qryNotasendnumero: TIntegerField
      FieldName = 'endnumero'
      DisplayFormat = '0'
    end
    object qryNotasendcomplemento: TStringField
      FieldName = 'endcomplemento'
      Size = 100
    end
    object qryNotasbairro: TIntegerField
      FieldName = 'bairro'
      DisplayFormat = '0'
    end
    object qryNotascidade: TIntegerField
      FieldName = 'cidade'
      DisplayFormat = '0'
    end
    object qryNotasestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object qryNotascep: TIntegerField
      FieldName = 'cep'
      DisplayFormat = '0'
    end
    object qryNotaspessoatipo: TStringField
      FieldName = 'pessoatipo'
      Required = True
      Size = 1
    end
    object qryNotaspessoanumero: TStringField
      FieldName = 'pessoanumero'
      Size = 14
    end
    object qryNotasfonenumero: TIntegerField
      FieldName = 'fonenumero'
      DisplayFormat = '0'
    end
    object qryNotasfoneddd: TIntegerField
      FieldName = 'foneddd'
      DisplayFormat = '0'
    end
    object qryNotasdocumento: TStringField
      FieldName = 'documento'
    end
    object qryNotasobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 350
    end
    object qryNotasconceito: TIntegerField
      FieldName = 'conceito'
      DisplayFormat = '0'
    end
    object qryNotasdebitar: TIntegerField
      FieldName = 'debitar'
      DisplayFormat = '0'
    end
    object qryNotascreditar: TIntegerField
      FieldName = 'creditar'
      DisplayFormat = '0'
    end
    object qryNotashistorico: TIntegerField
      FieldName = 'historico'
      DisplayFormat = '0'
    end
    object qryNotastotalbaseicmsproprio: TFloatField
      FieldName = 'totalbaseicmsproprio'
      DisplayFormat = '0.00'
    end
    object qryNotastotalvaloricmsproprio: TFloatField
      FieldName = 'totalvaloricmsproprio'
      DisplayFormat = '0.00'
    end
    object qryNotastotalbaseicmssubstituicao: TFloatField
      FieldName = 'totalbaseicmssubstituicao'
      DisplayFormat = '0.00'
    end
    object qryNotastotalvaloricmssubstituicao: TFloatField
      FieldName = 'totalvaloricmssubstituicao'
      DisplayFormat = '0.00'
    end
    object qryNotasaliquotaicmsproprio: TFloatField
      FieldName = 'aliquotaicmsproprio'
      DisplayFormat = '0.00'
    end
    object qryNotasanexotres: TStringField
      FieldName = 'anexotres'
      Size = 100
    end
    object qryNotasacrescimofinanceiro: TFloatField
      FieldName = 'acrescimofinanceiro'
      DisplayFormat = '0.00'
    end
    object qryNotasacrescimoexcluido: TFloatField
      FieldName = 'acrescimoexcluido'
      DisplayFormat = '0.00'
    end
    object qryNotasicmsexcluido: TFloatField
      FieldName = 'icmsexcluido'
      DisplayFormat = '0.00'
    end
    object qryNotasirretido: TFloatField
      FieldName = 'irretido'
      DisplayFormat = '0.00'
    end
    object qryNotasinssretido: TFloatField
      FieldName = 'inssretido'
      DisplayFormat = '0.00'
    end
    object qryNotasissretido: TFloatField
      FieldName = 'issretido'
      DisplayFormat = '0.00'
    end
    object qryNotascofinsretido: TFloatField
      FieldName = 'cofinsretido'
      DisplayFormat = '0.00'
    end
    object qryNotaspisretido: TFloatField
      FieldName = 'pisretido'
      DisplayFormat = '0.00'
    end
    object qryNotascsllretido: TFloatField
      FieldName = 'csllretido'
      DisplayFormat = '0.00'
    end
    object qryNotasbaseicms: TFloatField
      FieldName = 'baseicms'
      DisplayFormat = '###.###.##0,00'
      EditFormat = '###.###.##0,00'
    end
    object qryNotasvaloricms: TFloatField
      FieldName = 'valoricms'
      DisplayFormat = '###.###.##0,00'
      EditFormat = '###.###.##0,00'
    end
    object qryNotasvalorissqn: TFloatField
      FieldName = 'valorissqn'
      DisplayFormat = '0.00'
    end
    object qryNotassubstituicaoipi: TBooleanField
      FieldName = 'substituicaoipi'
    end
    object qryNotasdadofiscalcomplementar: TIntegerField
      FieldName = 'dadofiscalcomplementar'
      DisplayFormat = '0'
    end
    object qryNotasobservacoescomplementar: TStringField
      FieldName = 'observacoescomplementar'
      Size = 500
    end
    object qryNotasobscliente: TStringField
      FieldName = 'obscliente'
      Size = 320
    end
    object qryNotasobsclienteipisuspenso: TStringField
      FieldName = 'obsclienteipisuspenso'
      Size = 320
    end
    object qryNotasobservacoesicmssubstituido: TStringField
      FieldName = 'observacoesicmssubstituido'
      Size = 500
    end
    object qryNotasnumlotenfe: TStringField
      FieldName = 'numlotenfe'
      Size = 15
    end
    object qryNotasnumrecibonfe: TStringField
      FieldName = 'numrecibonfe'
      Size = 15
    end
    object qryNotasnumprotocolonfe: TStringField
      FieldName = 'numprotocolonfe'
      Size = 15
    end
    object qryNotasnumcancelamentonfe: TStringField
      FieldName = 'numcancelamentonfe'
      Size = 15
    end
    object qryNotasemail: TStringField
      FieldName = 'email'
      Size = 128
    end
    object qryNotasdatacancelamento: TDateField
      Alignment = taCenter
      FieldName = 'datacancelamento'
      EditMask = '99/99/9999;1; '
    end
    object qryNotasmodelodocto: TStringField
      FieldName = 'modelodocto'
      Required = True
      Size = 2
    end
    object qryNotaslocalretirada_numero: TIntegerField
      FieldName = 'localretirada_numero'
      DisplayFormat = '0'
    end
    object qryNotaslocalentrega_numero: TIntegerField
      FieldName = 'localentrega_numero'
      DisplayFormat = '0'
    end
    object qryNotassuframa: TStringField
      FieldName = 'suframa'
      Size = 9
    end
    object qryNotasiesubsttributario: TStringField
      FieldName = 'iesubsttributario'
    end
    object qryNotasdatahoraemissao: TDateTimeField
      FieldName = 'datahoraemissao'
    end
    object qryNotasregimetributario: TIntegerField
      FieldName = 'regimetributario'
    end
    object qryNotasselecionar: TBooleanField
      FieldName = 'selecionar'
    end
  end
  object dsrNotas: TtecDataSource
    DataSet = qryNotas
    Left = 64
    Top = 24
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
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'DADOSFISCAIS'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'SELECT pdf.*'
      'FROM produtosdadosfiscais pdf'
      'WHERE true'
      '%DADOSFISCAIS'
      'ORDER BY pdf.dadofiscal, pdf.numero')
    RequestLive = False
    Left = 48
    Top = 72
    object qryProdutosDadosFiscaisdadofiscal: TIntegerField
      FieldName = 'dadofiscal'
      Required = True
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaisnumero: TIntegerField
      FieldName = 'numero'
      Required = True
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaisproduto: TLargeintField
      FieldName = 'produto'
      Required = True
    end
    object qryProdutosDadosFiscaisfilial: TIntegerField
      FieldName = 'filial'
      Required = True
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
      FieldName = 'precovenda'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisprecotabela: TFloatField
      FieldName = 'precotabela'
      Required = True
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
    object qryProdutosDadosFiscaispercentualreducaobase: TFloatField
      FieldName = 'percentualreducaobase'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisincidencia: TStringField
      FieldName = 'incidencia'
      Required = True
      Size = 2
    end
    object qryProdutosDadosFiscaisorigem: TIntegerField
      FieldName = 'origem'
      Required = True
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
      Size = 10
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
    object qryProdutosDadosFiscaisdespesasacessorias: TFloatField
      FieldName = 'despesasacessorias'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaissubstituicaoipi: TBooleanField
      FieldName = 'substituicaoipi'
    end
    object qryProdutosDadosFiscaisvalordescontoitem: TFloatField
      FieldName = 'valordescontoitem'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaiscodigofiscal: TIntegerField
      FieldName = 'codigofiscal'
      Required = True
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaisosp: TIntegerField
      FieldName = 'osp'
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaispn: TLargeintField
      FieldName = 'pn'
    end
    object qryProdutosDadosFiscaisaliquotaicmsst: TFloatField
      FieldName = 'aliquotaicmsst'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisicmsbasecalculost: TFloatField
      FieldName = 'icmsbasecalculost'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisicmsvalorst: TFloatField
      FieldName = 'icmsvalorst'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisind_mov_fisica: TIntegerField
      FieldName = 'ind_mov_fisica'
      DisplayFormat = '0'
    end
    object qryProdutosDadosFiscaislocalizacao: TStringField
      FieldName = 'localizacao'
      Size = 10
    end
    object qryProdutosDadosFiscaiscodigoean: TStringField
      FieldName = 'codigoean'
      Size = 14
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
    object qryProdutosDadosFiscaiscsosn: TStringField
      FieldName = 'csosn'
      Size = 3
    end
    object qryProdutosDadosFiscaispcredsn: TFloatField
      FieldName = 'pcredsn'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisvcredicmssn: TFloatField
      FieldName = 'vcredicmssn'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaispredbcst: TFloatField
      FieldName = 'predbcst'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisreducaobasest: TFloatField
      FieldName = 'reducaobasest'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisvbcstret: TFloatField
      FieldName = 'vbcstret'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisvicmsstret: TFloatField
      FieldName = 'vicmsstret'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisicmsisentas: TFloatField
      FieldName = 'icmsisentas'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisicmsoutras: TFloatField
      FieldName = 'icmsoutras'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisipioutras: TFloatField
      FieldName = 'ipioutras'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisipiisentas: TFloatField
      FieldName = 'ipiisentas'
      DisplayFormat = '0.00'
    end
    object qryProdutosDadosFiscaisvaloripidigitado: TBooleanField
      FieldName = 'valoripidigitado'
    end
    object qryProdutosDadosFiscaisvaloricmsdigitado: TBooleanField
      FieldName = 'valoricmsdigitado'
    end
    object qryProdutosDadosFiscaisvaloricmsstdigitado: TBooleanField
      FieldName = 'valoricmsstdigitado'
    end
    object qryProdutosDadosFiscaispercreducaomva: TFloatField
      FieldName = 'percreducaomva'
    end
  end
  object qryPedidosFiliais: TtecQuery
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
        Name = 'DADOSFISCAIS'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select pf.codigo,'
      '       pf.produto,'
      '       pf.data,'
      '       pf.hora,'
      '       pf.requisitante,'
      '       pf.requisitada,'
      '       pf.qtdepedida,'
      '       pf.qtderecebida,'
      '       pf.situacao,'
      '       pf.dadofiscal,'
      '       pf.observacao'
      'from pedidosfiliais pf'
      'where true'
      '%DADOSFISCAIS'
      'order by pf.dadofiscal, pf.codigo')
    RequestLive = False
    Left = 152
    Top = 24
    object qryPedidosFiliaiscodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
    object qryPedidosFiliaisproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryPedidosFiliaisdata: TDateTimeField
      FieldName = 'data'
    end
    object qryPedidosFiliaishora: TTimeField
      Alignment = taCenter
      FieldName = 'hora'
      EditMask = '99:99;1; '
    end
    object qryPedidosFiliaisrequisitante: TIntegerField
      FieldName = 'requisitante'
      DisplayFormat = '0'
    end
    object qryPedidosFiliaisrequisitada: TIntegerField
      FieldName = 'requisitada'
      DisplayFormat = '0'
    end
    object qryPedidosFiliaisqtdepedida: TFloatField
      FieldName = 'qtdepedida'
      DisplayFormat = '0.00'
    end
    object qryPedidosFiliaisqtderecebida: TFloatField
      FieldName = 'qtderecebida'
      DisplayFormat = '0.00'
    end
    object qryPedidosFiliaissituacao: TStringField
      FieldName = 'situacao'
      Required = True
      Size = 1
    end
    object qryPedidosFiliaisdadofiscal: TIntegerField
      FieldName = 'dadofiscal'
      DisplayFormat = '0'
    end
    object qryPedidosFiliaisobservacao: TStringField
      FieldName = 'observacao'
      Size = 150
    end
  end
  object qryMovimentos: TtecQuery
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
        Name = 'DADOSFISCAIS'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'SELECT m.numero,'
      '       m.produto,'
      '       m.filial,'
      '       m.data,'
      '       m.Lancto,'
      '       m.Hora,'
      '       m.tipomovimento,'
      '       m.operacao,'
      '       m.emestoque,'
      '       m.reservado,'
      '       m.transito,'
      '       m.demonstracao,'
      '       m.conserto,'
      '       m.futuro,'
      '       m.danificada,'
      '       m.estoquefisico,'
      '       m.reservaprevia,'
      '       m.quantidade,'
      '       m.financeiro,'
      '       m.valor,'
      '       m.precosemicms,'
      '       m.precocomicms,'
      '       m.aliquotaipi,'
      '       m.referencia,'
      '       m.trfproduto,'
      '       m.trffilial,'
      '       m.qtdenocomposto,'
      '       m.composto,'
      '       m.trfmovimento,'
      '       m.trfquantidade,'
      '       m.codigonota,'
      '       m.cliente,'
      '       m.tipocliente,'
      '       /*m.dadofiscal,*/'
      '       (select m2.dadofiscal'
      '        from movimentos m2'
      '        where m2.numero = m.trfmovimento) as dadofiscal,'
      '       m.contrato,'
      '       m.cmpmovimento,'
      '       m.negmovimento,'
      '       m.qtdenegativa,'
      '       m.numerotroca,'
      '       m.usuariologado,'
      '       m.usuarioautorizacao'
      'FROM movimentos m'
      'WHERE m.trfmovimento in (select m.numero'
      '                   from movimentos m'
      '                   where true'
      '                     and m.tipomovimento = '#39'SET'#39
      '                   %DADOSFISCAIS)'
      'ORDER BY m.dadofiscal, m.numero')
    RequestLive = False
    Left = 48
    Top = 128
    object qryMovimentosnumero: TIntegerField
      FieldName = 'numero'
      Required = True
      DisplayFormat = '0'
    end
    object qryMovimentosproduto: TLargeintField
      FieldName = 'produto'
      Required = True
    end
    object qryMovimentosfilial: TIntegerField
      FieldName = 'filial'
      Required = True
      DisplayFormat = '0'
    end
    object qryMovimentosdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryMovimentoslancto: TIntegerField
      FieldName = 'lancto'
      DisplayFormat = '0'
    end
    object qryMovimentoshora: TTimeField
      Alignment = taCenter
      FieldName = 'hora'
      EditMask = '99:99;1; '
    end
    object qryMovimentostipomovimento: TStringField
      FieldName = 'tipomovimento'
      Required = True
      Size = 3
    end
    object qryMovimentosoperacao: TStringField
      FieldName = 'operacao'
      Required = True
    end
    object qryMovimentosemestoque: TFloatField
      FieldName = 'emestoque'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryMovimentosreservado: TFloatField
      FieldName = 'reservado'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryMovimentostransito: TFloatField
      FieldName = 'transito'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryMovimentosdemonstracao: TFloatField
      FieldName = 'demonstracao'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryMovimentosconserto: TFloatField
      FieldName = 'conserto'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryMovimentosfuturo: TFloatField
      FieldName = 'futuro'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryMovimentosdanificada: TFloatField
      FieldName = 'danificada'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryMovimentosestoquefisico: TFloatField
      FieldName = 'estoquefisico'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryMovimentosreservaprevia: TFloatField
      FieldName = 'reservaprevia'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryMovimentosquantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryMovimentosfinanceiro: TFloatField
      FieldName = 'financeiro'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryMovimentosvalor: TFloatField
      FieldName = 'valor'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryMovimentosprecosemicms: TFloatField
      FieldName = 'precosemicms'
      DisplayFormat = '0.00'
    end
    object qryMovimentosprecocomicms: TFloatField
      FieldName = 'precocomicms'
      DisplayFormat = '0.00'
    end
    object qryMovimentosaliquotaipi: TFloatField
      FieldName = 'aliquotaipi'
      DisplayFormat = '0.00'
    end
    object qryMovimentosreferencia: TStringField
      FieldName = 'referencia'
      Size = 60
    end
    object qryMovimentostrfproduto: TLargeintField
      FieldName = 'trfproduto'
    end
    object qryMovimentostrffilial: TIntegerField
      FieldName = 'trffilial'
      DisplayFormat = '0'
    end
    object qryMovimentoscomposto: TLargeintField
      FieldName = 'composto'
    end
    object qryMovimentosqtdenocomposto: TFloatField
      FieldName = 'qtdenocomposto'
      DisplayFormat = '0.00'
    end
    object qryMovimentostrfquantidade: TFloatField
      FieldName = 'trfquantidade'
    end
    object qryMovimentoscodigonota: TIntegerField
      FieldName = 'codigonota'
      DisplayFormat = '0'
    end
    object qryMovimentoscliente: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object qryMovimentostipocliente: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
    object qryMovimentosdadofiscal: TIntegerField
      FieldName = 'dadofiscal'
      DisplayFormat = '0'
    end
    object qryMovimentoscontrato: TStringField
      FieldName = 'contrato'
    end
    object qryMovimentoscmpmovimento: TIntegerField
      FieldName = 'cmpmovimento'
      DisplayFormat = '0'
    end
    object qryMovimentosnegmovimento: TIntegerField
      FieldName = 'negmovimento'
      DisplayFormat = '0'
    end
    object qryMovimentosqtdenegativa: TFloatField
      FieldName = 'qtdenegativa'
      DisplayFormat = '0.00'
    end
    object qryMovimentosnumerotroca: TIntegerField
      FieldName = 'numerotroca'
      DisplayFormat = '0'
    end
    object qryMovimentosusuariologado: TIntegerField
      FieldName = 'usuariologado'
      DisplayFormat = '0'
    end
    object qryMovimentosusuarioautorizacao: TIntegerField
      FieldName = 'usuarioautorizacao'
      DisplayFormat = '0'
    end
  end
end
