inherited dtmImportacaoNotasTransferencia: TdtmImportacaoNotasTransferencia
  OldCreateOrder = False
  Left = 289
  Top = 221
  Height = 337
  Width = 505
  object qryDadosFiscais: TtecQuery
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
      'select dadosfiscais.numero,'
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
      '       dadosfiscais.regimetributario'
      'from dadosfiscais'
      'where dadosfiscais.numero = :dadofiscal')
    RequestLive = True
    Left = 48
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dadofiscal'
        ParamType = ptUnknown
      end>
    object qryDadosFiscaisnumero: TIntegerField
      FieldName = 'numero'
    end
    object qryDadosFiscaisdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryDadosFiscaissituacao: TStringField
      FieldName = 'situacao'
      Required = True
      Size = 1
    end
    object qryDadosFiscaismanual: TBooleanField
      FieldName = 'manual'
      Required = True
    end
    object qryDadosFiscaisfilialvenda: TIntegerField
      FieldName = 'filialvenda'
      Required = True
      DisplayFormat = '0'
    end
    object qryDadosFiscaiscontrato: TStringField
      FieldName = 'contrato'
    end
    object qryDadosFiscaisvalortotal: TFloatField
      FieldName = 'valortotal'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaisvalorvista: TFloatField
      FieldName = 'valorvista'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaisdesconto: TFloatField
      FieldName = 'desconto'
      Required = True
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
    object qryDadosFiscaisvalorservicos: TFloatField
      FieldName = 'valorservicos'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaisvalorprodutos: TFloatField
      FieldName = 'valorprodutos'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaisdespesasacessorias: TFloatField
      FieldName = 'despesasacessorias'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaiscodigofiscal: TIntegerField
      FieldName = 'codigofiscal'
      Required = True
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
      Required = True
      Size = 2
    end
    object qryDadosFiscaisfilialemissao: TIntegerField
      FieldName = 'filialemissao'
      Required = True
      DisplayFormat = '0'
    end
    object qryDadosFiscaisnatureza: TStringField
      FieldName = 'natureza'
      Size = 80
    end
    object qryDadosFiscaiscodigonatureza: TIntegerField
      FieldName = 'codigonatureza'
      DisplayFormat = '0'
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
      Required = True
      Size = 1
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
    object qryDadosFiscaisendnumero: TIntegerField
      FieldName = 'endnumero'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisendcomplemento: TStringField
      FieldName = 'endcomplemento'
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
      Required = True
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
    object qryDadosFiscaissubstituicaoipi: TBooleanField
      FieldName = 'substituicaoipi'
    end
    object qryDadosFiscaisdadofiscalcomplementar: TIntegerField
      FieldName = 'dadofiscalcomplementar'
      DisplayFormat = '0'
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
    object qryDadosFiscaisnumcancelamentonfe: TStringField
      FieldName = 'numcancelamentonfe'
      Size = 15
    end
    object qryDadosFiscaisemail: TStringField
      FieldName = 'email'
      Size = 128
    end
    object qryDadosFiscaisdatacancelamento: TDateField
      Alignment = taCenter
      FieldName = 'datacancelamento'
      EditMask = '99/99/9999;1; '
    end
    object qryDadosFiscaismodelodocto: TStringField
      FieldName = 'modelodocto'
      Required = True
      Size = 2
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
    object qryDadosFiscaisdatahoraemissao: TDateTimeField
      FieldName = 'datahoraemissao'
    end
    object qryDadosFiscaisregimetributario: TIntegerField
      FieldName = 'regimetributario'
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
      'select filial,'
      '       serie,'
      '       numero,'
      '       dadofiscal'
      'from notas'
      'where filial = :filial'
      '    and serie = :serie'
      '    and numero = :numero')
    RequestLive = True
    Left = 48
    Top = 80
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
  object qryMovimentos: TtecQuery
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
      '       m.dadofiscal,'
      '       m.contrato,'
      '       m.cmpmovimento,'
      '       m.negmovimento,'
      '       m.qtdenegativa,'
      '       m.numerotroca,'
      '       m.usuariologado,'
      '       m.usuarioautorizacao'
      'FROM movimentos m'
      'where m.numero = :movimento')
    RequestLive = True
    Left = 48
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'movimento'
        ParamType = ptUnknown
      end>
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
    object qryMovimentosqtdenocomposto: TFloatField
      FieldName = 'qtdenocomposto'
      DisplayFormat = '0.00'
    end
    object qryMovimentostrfquantidade: TFloatField
      FieldName = 'trfquantidade'
    end
    object qryMovimentoscomposto: TLargeintField
      FieldName = 'composto'
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
  object qryProdutosDadosFiscais: TtecQuery
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
      'SELECT pdf.*'
      'FROM produtosdadosfiscais pdf'
      'where pdf.dadofiscal = :dadofiscal')
    RequestLive = True
    Left = 176
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dadofiscal'
        ParamType = ptUnknown
      end>
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
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
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
      'where pf.codigo = :pedido')
    RequestLive = True
    Left = 295
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pedido'
        ParamType = ptUnknown
      end>
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
    Left = 176
    Top = 16
    object spcDadosFiscaisProximonumero: TIntegerField
      FieldName = 'numero'
    end
  end
  object spcPedidosTransferenciaProximo: TtecQuery
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
      'Select pedidosfiliais_proximocodigo() as codigo')
    RequestLive = False
    Left = 294
    Top = 93
    object spcPedidosTransferenciaProximocodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object spcMovimentosProximo: TtecQuery
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
      'select movimentos_proximonumero() as numero')
    RequestLive = False
    Left = 309
    Top = 143
    object spcMovimentosProximonumero: TIntegerField
      FieldName = 'numero'
    end
  end
  object qryNotasVerificacao: TtecQuery
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
      'select filial,'
      '       serie,'
      '       numero,'
      '       dadofiscal'
      'from notas'
      'where numero = :nota')
    RequestLive = True
    Left = 80
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nota'
        ParamType = ptUnknown
      end>
    object qryNotasVerificacaofilial: TIntegerField
      FieldName = 'filial'
    end
    object qryNotasVerificacaoserie: TStringField
      FieldName = 'serie'
      Size = 3
    end
    object qryNotasVerificacaonumero: TIntegerField
      FieldName = 'numero'
    end
    object qryNotasVerificacaodadofiscal: TIntegerField
      FieldName = 'dadofiscal'
    end
  end
end
