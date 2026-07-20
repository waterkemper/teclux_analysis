inherited dtmImprimeContratoMatricial: TdtmImprimeContratoMatricial
  Left = 440
  Top = 164
  Height = 317
  Width = 568
  object qryModelosContratosMatriciais: TtecQuery
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
      'select configurar,'
      '         cabecalho,'
      '         vencimento,'
      '         venctoagrupados,'
      '         cabecalhoproduto,'
      '         produto,'
      '         servico,'
      '         obslegais,'
      '         semprodutos,'
      '         rodapeacrescimo,'
      '         rodapedesconto,'
      '         rodape,'
      '         rodapepagina,'
      '         canhoto'
      'from modeloscontratosmatriciais'
      'where codigo = :codigo')
    RequestLive = False
    Left = 337
    Top = 213
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryModelosContratosMatriciaiscabecalho: TStringField
      DisplayWidth = 1200
      FieldName = 'cabecalho'
      Required = True
      Size = 1200
    end
    object qryModelosContratosMatriciaisvencimento: TStringField
      DisplayWidth = 800
      FieldName = 'vencimento'
      Size = 800
    end
    object qryModelosContratosMatriciaisproduto: TStringField
      FieldName = 'produto'
      Required = True
      Size = 800
    end
    object qryModelosContratosMatriciaisservico: TStringField
      FieldName = 'servico'
      Size = 512
    end
    object qryModelosContratosMatriciaisrodape: TStringField
      FieldName = 'rodape'
      Required = True
      Size = 1800
    end
    object qryModelosContratosMatriciaiscanhoto: TStringField
      DisplayWidth = 512
      FieldName = 'canhoto'
      Size = 512
    end
    object qryModelosContratosMatriciaisrodapepagina: TStringField
      FieldName = 'rodapepagina'
      Size = 512
    end
    object qryModelosContratosMatriciaisconfigurar: TStringField
      FieldName = 'configurar'
      Size = 50
    end
    object qryModelosContratosMatriciaisrodapeacrescimo: TStringField
      FieldName = 'rodapeacrescimo'
      Size = 150
    end
    object qryModelosContratosMatriciaisrodapedesconto: TStringField
      FieldName = 'rodapedesconto'
      Size = 150
    end
    object qryModelosContratosMatriciaisvenctoagrupados: TStringField
      FieldName = 'venctoagrupados'
      Size = 200
    end
    object qryModelosContratosMatriciaisobslegais: TStringField
      FieldName = 'obslegais'
      Size = 100
    end
    object qryModelosContratosMatriciaissemprodutos: TStringField
      FieldName = 'semprodutos'
      Size = 100
    end
    object qryModelosContratosMatriciaiscabecalhoproduto: TStringField
      FieldName = 'cabecalhoproduto'
      Size = 100
    end
  end
  object qryContratos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnCalcFields = qryContratosCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select c.numero,'
      '       c.data,'
      '       c.faturamento,'
      '       c.avalista,'
      '       c.cliente,'
      '       c.tipocliente, c.dependente,'
      '       c.vendedor,'
      
        '       (select u.nome from usuarios u where u.codigo=c.vendedor)' +
        ' as nomevendedor,'
      '       c.filialvenda,'
      
        '       (select razao from filiais where codigo = c.filialvenda) ' +
        'as razaofilial,'
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
      
        '       (select p.descricao from planos p where p.codigo = c.plan' +
        'o) as descricaoplano,'
      '       c.consideracoes,'
      '       c.entrua,'
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
      '       cast (case when c.situacao = ''O'' then ''ORCADO'''
      '                        when c.situacao = ''R'' then ''RESERVADO'''
      '                        when c.situacao = ''F'' then ''FATURADO'''
      
        '                        when c.situacao = ''P'' then ''NOTA PARCIAL' +
        ''''
      '                        when c.situacao = ''N'' then ''NOTA FISCAL'''
      '                        when c.situacao = ''C'' then ''CANCELADO'''
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
      '       formatar_cpf_cnpj(c.pessoanumero) as pessoanumero,'
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
      '       c.conestado,'
      '       c.concidade,'
      '       c.conbairro,'
      '       c.concargo,'
      '       c.referencia,'
      '       c.reftipo,'
      '       c.refrua,'
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
      '        where  (c2.origem = c.numero)) as renegociado,'
      '       c.creditotroca,'
      
        '       (c.valorprazo - coalesce(c.creditotroca,0)) as totalgeral' +
        ','
      '       f.foneddd as fonedddfilialvenda,'
      '       f.fonenumero as fonenumerofilialvenda'
      'from contratos c join filiais f on c.filialvenda = f.codigo'
      'where c.numero =:numero and (os is NULL OR os=''false'')'
      '/*          NAO ALTERAR A ORDEM DOS CAMPOS   */'
      '')
    RequestLive = False
    Left = 336
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numero'
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
    object qryContratosavalista: TIntegerField
      FieldName = 'avalista'
      DisplayFormat = '0'
    end
    object qryContratoscliente: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object qryContratostipocliente: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
    object qryContratosdependente: TIntegerField
      FieldName = 'dependente'
      DisplayFormat = '0'
    end
    object qryContratosvendedor: TIntegerField
      FieldName = 'vendedor'
      DisplayFormat = '0'
    end
    object qryContratosnomevendedor: TStringField
      DisplayWidth = 40
      FieldName = 'nomevendedor'
      Size = 40
    end
    object qryContratosdescricaoplano: TStringField
      DisplayWidth = 20
      FieldName = 'descricaoplano'
    end
    object qryContratosfilialvenda: TIntegerField
      FieldName = 'filialvenda'
      DisplayFormat = '0'
    end
    object qryContratosvalorvista: TFloatField
      FieldName = 'valorvista'
      DisplayFormat = '0.00'
    end
    object qryContratosvalorprazo: TFloatField
      FieldName = 'valorprazo'
      DisplayFormat = '0.00'
    end
    object qryContratostotalprodutos: TFloatField
      FieldName = 'totalprodutos'
      DisplayFormat = '0.00'
    end
    object qryContratostotalservicos: TFloatField
      FieldName = 'totalservicos'
      DisplayFormat = '0.00'
    end
    object qryContratosdesconto: TFloatField
      FieldName = 'desconto'
      DisplayFormat = '0.00'
    end
    object qryContratosfrete: TFloatField
      FieldName = 'frete'
      DisplayFormat = '0.00'
    end
    object qryContratosseguro: TFloatField
      FieldName = 'seguro'
      DisplayFormat = '0.00'
    end
    object qryContratosagente: TIntegerField
      FieldName = 'agente'
      DisplayFormat = '0'
    end
    object qryContratosanalista: TIntegerField
      FieldName = 'analista'
      DisplayFormat = '0'
    end
    object qryContratosnomeanalista: TStringField
      FieldName = 'nomeanalista'
      Size = 50
    end
    object qryContratosorigem: TStringField
      FieldName = 'origem'
    end
    object qryContratostiporenegociacao: TStringField
      FieldName = 'tiporenegociacao'
      Size = 1
    end
    object qryContratostaxajuros: TFloatField
      FieldName = 'taxajuros'
      DisplayFormat = '0.00'
    end
    object qryContratosplano: TIntegerField
      FieldName = 'plano'
      DisplayFormat = '0'
    end
    object qryContratosconsideracoes: TStringField
      FieldName = 'consideracoes'
      Size = 500
    end
    object qryContratosentrua: TStringField
      FieldName = 'entrua'
      Size = 100
    end
    object qryContratosentestado: TStringField
      FieldName = 'entestado'
      Size = 2
    end
    object qryContratosentcidade: TIntegerField
      FieldName = 'entcidade'
      DisplayFormat = '0'
    end
    object qryContratosentbairro: TIntegerField
      FieldName = 'entbairro'
      DisplayFormat = '0'
    end
    object qryContratosentcep: TIntegerField
      FieldName = 'entcep'
      DisplayFormat = '0'
    end
    object qryContratosentfoneddd: TIntegerField
      FieldName = 'entfoneddd'
      DisplayFormat = '0'
    end
    object qryContratosentfonenumero: TIntegerField
      FieldName = 'entfonenumero'
      DisplayFormat = '0'
    end
    object qryContratosentfoneramal: TStringField
      FieldName = 'entfoneramal'
      Size = 10
    end
    object qryContratosmontagemobs: TStringField
      FieldName = 'montagemobs'
      Size = 250
    end
    object qryContratosmontagemfilial: TIntegerField
      FieldName = 'montagemfilial'
      DisplayFormat = '0'
    end
    object qryContratossituacao: TStringField
      DisplayWidth = 10
      FieldName = 'situacao'
      Size = 10
    end
    object qryContratosemitirnotadepoisde: TDateField
      Alignment = taCenter
      FieldName = 'emitirnotadepoisde'
      EditMask = '99/99/9999;1; '
    end
    object qryContratosnomesituacao: TStringField
      FieldName = 'nomesituacao'
      Size = 50
    end
    object qryContratosmotivo: TIntegerField
      FieldName = 'motivo'
      DisplayFormat = '0'
    end
    object qryContratosdescricaomotivo: TStringField
      FieldName = 'descricaomotivo'
      Size = 50
    end
    object qryContratosnomecidadeentrega: TStringField
      FieldName = 'nomecidadeentrega'
      Size = 50
    end
    object qryContratosnomebairroentrega: TStringField
      FieldName = 'nomebairroentrega'
      Size = 50
    end
    object qryContratosnomecidadenaturalidade: TStringField
      FieldName = 'nomecidadenaturalidade'
      Size = 50
    end
    object qryContratosnomecidade: TStringField
      FieldName = 'nomecidade'
      Size = 50
    end
    object qryContratosnomebairro: TStringField
      FieldName = 'nomebairro'
      Size = 50
    end
    object qryContratosnomecidadeempresa: TStringField
      FieldName = 'nomecidadeempresa'
      Size = 50
    end
    object qryContratosnomebairroempresa: TStringField
      FieldName = 'nomebairroempresa'
      Size = 50
    end
    object qryContratosnomecidadeconjuge: TStringField
      FieldName = 'nomecidadeconjuge'
      Size = 50
    end
    object qryContratosnomebairroconjuge: TStringField
      FieldName = 'nomebairroconjuge'
      Size = 50
    end
    object qryContratosnomecidadereferencia: TStringField
      FieldName = 'nomecidadereferencia'
      Size = 50
    end
    object qryContratosnomebairroreferencia: TStringField
      FieldName = 'nomebairroreferencia'
      Size = 50
    end
    object qryContratosnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryContratosnascto: TDateField
      Alignment = taCenter
      FieldName = 'nascto'
      EditMask = '99/99/9999;1; '
    end
    object qryContratosapelido: TStringField
      FieldName = 'apelido'
    end
    object qryContratossexo: TStringField
      FieldName = 'sexo'
      Size = 1
    end
    object qryContratoscivil: TStringField
      FieldName = 'civil'
      Size = 1
    end
    object qryContratoscivildata: TDateField
      Alignment = taCenter
      FieldName = 'civildata'
      EditMask = '99/99/9999;1; '
    end
    object qryContratosiddocumento: TStringField
      FieldName = 'iddocumento'
    end
    object qryContratosidorgao: TStringField
      FieldName = 'idorgao'
      Size = 5
    end
    object qryContratosiddata: TDateField
      Alignment = taCenter
      FieldName = 'iddata'
      EditMask = '99/99/9999;1; '
    end
    object qryContratosidestado: TStringField
      FieldName = 'idestado'
      Size = 2
    end
    object qryContratospessoatipo: TStringField
      FieldName = 'pessoatipo'
      Size = 1
    end
    object qryContratospessoanumero: TStringField
      FieldName = 'pessoanumero'
      Size = 14
    end
    object qryContratosmae: TStringField
      FieldName = 'mae'
      Size = 40
    end
    object qryContratospai: TStringField
      FieldName = 'pai'
      Size = 40
    end
    object qryContratosconceito: TIntegerField
      FieldName = 'conceito'
      DisplayFormat = '0'
    end
    object qryContratosnaturalcidade: TIntegerField
      FieldName = 'naturalcidade'
      DisplayFormat = '0'
    end
    object qryContratosnaturalestado: TStringField
      FieldName = 'naturalestado'
      Size = 2
    end
    object qryContratosrua: TStringField
      FieldName = 'rua'
      Size = 100
    end
    object qryContratosestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object qryContratoscidade: TIntegerField
      FieldName = 'cidade'
      DisplayFormat = '0'
    end
    object qryContratosbairro: TIntegerField
      FieldName = 'bairro'
      DisplayFormat = '0'
    end
    object qryContratoscep: TIntegerField
      FieldName = 'cep'
      DisplayFormat = '0'
    end
    object qryContratosfonetipo: TStringField
      FieldName = 'fonetipo'
      Size = 1
    end
    object qryContratosfoneddd: TIntegerField
      FieldName = 'foneddd'
      DisplayFormat = '0'
    end
    object qryContratosfonenumero: TIntegerField
      FieldName = 'fonenumero'
      DisplayFormat = '0'
    end
    object qryContratosfoneramal: TStringField
      FieldName = 'foneramal'
      Size = 10
    end
    object qryContratosfone2ddd: TIntegerField
      FieldName = 'fone2ddd'
      DisplayFormat = '0'
    end
    object qryContratosfone2numero: TIntegerField
      FieldName = 'fone2numero'
      DisplayFormat = '0'
    end
    object qryContratosfone2ramal: TStringField
      FieldName = 'fone2ramal'
      Size = 10
    end
    object qryContratosrestipo: TStringField
      FieldName = 'restipo'
      Size = 1
    end
    object qryContratosresonus: TFloatField
      FieldName = 'resonus'
      DisplayFormat = '0.00'
    end
    object qryContratosrestempo: TDateField
      Alignment = taCenter
      FieldName = 'restempo'
      EditMask = '99/99/9999;1; '
    end
    object qryContratosempresa: TStringField
      FieldName = 'empresa'
      Size = 40
    end
    object qryContratosempadmissao: TDateField
      Alignment = taCenter
      FieldName = 'empadmissao'
      EditMask = '99/99/9999;1; '
    end
    object qryContratosempcep: TIntegerField
      FieldName = 'empcep'
      DisplayFormat = '0'
    end
    object qryContratosempcomprovado: TBooleanField
      FieldName = 'empcomprovado'
    end
    object qryContratosempfoneddd: TIntegerField
      FieldName = 'empfoneddd'
      DisplayFormat = '0'
    end
    object qryContratosempfonenumero: TIntegerField
      FieldName = 'empfonenumero'
      DisplayFormat = '0'
    end
    object qryContratosempfoneramal: TStringField
      FieldName = 'empfoneramal'
      Size = 10
    end
    object qryContratosempoutrasdescricao: TStringField
      FieldName = 'empoutrasdescricao'
      Size = 40
    end
    object qryContratosempoutrasfaixa: TIntegerField
      FieldName = 'empoutrasfaixa'
      DisplayFormat = '0'
    end
    object qryContratosempoutrasvalor: TFloatField
      FieldName = 'empoutrasvalor'
      DisplayFormat = '0.00'
    end
    object qryContratosemprendafaixa: TIntegerField
      FieldName = 'emprendafaixa'
      DisplayFormat = '0'
    end
    object qryContratosemprendavalor: TFloatField
      FieldName = 'emprendavalor'
      DisplayFormat = '0.00'
    end
    object qryContratosemprua: TStringField
      FieldName = 'emprua'
      Size = 100
    end
    object qryContratosempestado: TStringField
      FieldName = 'empestado'
      Size = 2
    end
    object qryContratosempcidade: TIntegerField
      FieldName = 'empcidade'
      DisplayFormat = '0'
    end
    object qryContratosempbairro: TIntegerField
      FieldName = 'empbairro'
      DisplayFormat = '0'
    end
    object qryContratosempcargo: TIntegerField
      FieldName = 'empcargo'
      DisplayFormat = '0'
    end
    object qryContratosconjuge: TIntegerField
      FieldName = 'conjuge'
      DisplayFormat = '0'
    end
    object qryContratosconnome: TStringField
      FieldName = 'connome'
      Size = 40
    end
    object qryContratosconadmissao: TDateField
      Alignment = taCenter
      FieldName = 'conadmissao'
      EditMask = '99/99/9999;1; '
    end
    object qryContratosconcep: TIntegerField
      FieldName = 'concep'
      DisplayFormat = '0'
    end
    object qryContratosconempresa: TStringField
      FieldName = 'conempresa'
      Size = 40
    end
    object qryContratosconfoneddd: TIntegerField
      FieldName = 'confoneddd'
      DisplayFormat = '0'
    end
    object qryContratosconfonenumero: TIntegerField
      FieldName = 'confonenumero'
      DisplayFormat = '0'
    end
    object qryContratosconfoneramal: TStringField
      FieldName = 'confoneramal'
      Size = 10
    end
    object qryContratosconnascto: TDateField
      Alignment = taCenter
      FieldName = 'connascto'
      EditMask = '99/99/9999;1; '
    end
    object qryContratosconrendafaixa: TIntegerField
      FieldName = 'conrendafaixa'
      DisplayFormat = '0'
    end
    object qryContratosconrendavalor: TFloatField
      FieldName = 'conrendavalor'
      DisplayFormat = '0.00'
    end
    object qryContratosconrua: TStringField
      FieldName = 'conrua'
      Size = 100
    end
    object qryContratosconestado: TStringField
      FieldName = 'conestado'
      Size = 2
    end
    object qryContratosconcidade: TIntegerField
      FieldName = 'concidade'
      DisplayFormat = '0'
    end
    object qryContratosconbairro: TIntegerField
      FieldName = 'conbairro'
      DisplayFormat = '0'
    end
    object qryContratosconcargo: TIntegerField
      FieldName = 'concargo'
      DisplayFormat = '0'
    end
    object qryContratosreferencia: TStringField
      FieldName = 'referencia'
      Size = 40
    end
    object qryContratosreftipo: TStringField
      FieldName = 'reftipo'
      Size = 1
    end
    object qryContratosrefrua: TStringField
      FieldName = 'refrua'
      Size = 100
    end
    object qryContratosrefestado: TStringField
      FieldName = 'refestado'
      Size = 2
    end
    object qryContratosrefcidade: TIntegerField
      FieldName = 'refcidade'
      DisplayFormat = '0'
    end
    object qryContratosrefbairro: TIntegerField
      FieldName = 'refbairro'
      DisplayFormat = '0'
    end
    object qryContratosrefcep: TIntegerField
      FieldName = 'refcep'
      DisplayFormat = '0'
    end
    object qryContratosreffoneddd: TIntegerField
      FieldName = 'reffoneddd'
      DisplayFormat = '0'
    end
    object qryContratosreffonenumero: TIntegerField
      FieldName = 'reffonenumero'
      DisplayFormat = '0'
    end
    object qryContratosreffoneramal: TStringField
      FieldName = 'reffoneramal'
      Size = 10
    end
    object qryContratosreffone2ddd: TIntegerField
      FieldName = 'reffone2ddd'
      DisplayFormat = '0'
    end
    object qryContratosreffone2numero: TIntegerField
      FieldName = 'reffone2numero'
      DisplayFormat = '0'
    end
    object qryContratosreffone2ramal: TStringField
      FieldName = 'reffone2ramal'
      Size = 10
    end
    object qryContratosobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 512
    end
    object qryContratosemail: TStringField
      FieldName = 'email'
      Size = 128
    end
    object qryContratoslistacasamento: TIntegerField
      FieldName = 'listacasamento'
      DisplayFormat = '0'
    end
    object qryContratosautomovel: TBooleanField
      FieldName = 'automovel'
    end
    object qryContratoscartaocredito: TBooleanField
      FieldName = 'cartaocredito'
    end
    object qryContratoscartaoloja: TBooleanField
      FieldName = 'cartaoloja'
    end
    object qryContratoscheque: TBooleanField
      FieldName = 'cheque'
    end
    object qryContratoschequeespecial: TBooleanField
      FieldName = 'chequeespecial'
    end
    object qryContratosdependentes: TIntegerField
      FieldName = 'dependentes'
      DisplayFormat = '0'
    end
    object qryContratosonus: TFloatField
      FieldName = 'onus'
      DisplayFormat = '0.00'
    end
    object qryContratosprimogenito: TStringField
      FieldName = 'primogenito'
    end
    object qryContratospedidocliente: TStringField
      FieldName = 'pedidocliente'
      Size = 15
    end
    object qryContratosrenegociado: TStringField
      FieldName = 'renegociado'
      Size = 50
    end
    object qryContratoscreditotroca: TFloatField
      FieldName = 'creditotroca'
      DisplayFormat = '0.00'
    end
    object qryContratostotalgeral: TFloatField
      FieldName = 'totalgeral'
      DisplayFormat = '0.00'
    end
    object qryContratosdddfilialbase: TStringField
      FieldKind = fkCalculated
      FieldName = 'dddfilialbase'
      Size = 4
      Calculated = True
    end
    object qryContratosfonefilialbase: TStringField
      FieldKind = fkCalculated
      FieldName = 'fonefilialbase'
      Size = 10
      Calculated = True
    end
    object qryContratosrazaofilial: TStringField
      FieldName = 'razaofilial'
      Size = 50
    end
    object qryContratosendnumero: TIntegerField
      FieldName = 'endnumero'
    end
    object qryContratosendcomplemento: TStringField
      FieldName = 'endcomplemento'
      Size = 100
    end
    object qryContratosendereco: TStringField
      FieldKind = fkCalculated
      FieldName = 'endereco'
      Size = 48
      Calculated = True
    end
    object qryContratosfonedddfilialvenda: TIntegerField
      FieldName = 'fonedddfilialvenda'
    end
    object qryContratosfonenumerofilialvenda: TIntegerField
      FieldName = 'fonenumerofilialvenda'
    end
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
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT pc.contrato,'
      '       pc.quantidade,'
      '       pc.produto,'
      '       pc.filial,'
      '       pc.precovenda,'
      '       pc.precovenda * pc.quantidade as precototal,'
      ''
      
        '       cast(p.descricao||'' ''||coalesce(p.valorgrade1,'''')||'' ''||c' +
        'oalesce(p.valorgrade2,'''') as varchar) AS produtodescricao,'
      '       p.referencia,'
      '       c.unidade,'
      '       e.localizacao,'
      ''
      
        '      (select o.descricao from obslegais o where c.obslegal = o.' +
        'codigo) as obslegal,'
      '       c.origem,'
      
        '      (select t.valor from tributosicms t where c.incidencia = t' +
        '.codigo) as incidencia,'
      '       m.descricao AS marcadescricao'
      ''
      'FROM  produtoscontratos pc'
      '      JOIN produtos p        ON ( pc.produto = p.codigo )'
      
        '      JOIN estoques e        ON ((pc.produto = e.produto) and (p' +
        'c.filial = e.filial))'
      '      JOIN caracteristicas c ON ( p.caracteristica = c.codigo )'
      '      JOIN marcas m          ON  (c.marca = m.codigo)'
      ''
      'WHERE pc.contrato = :contrato')
    RequestLive = False
    Left = 336
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptUnknown
      end>
    object qryProdutosContratoscontrato: TStringField
      FieldName = 'contrato'
      Required = True
    end
    object qryProdutosContratosquantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
      DisplayFormat = '0'
    end
    object qryProdutosContratosproduto: TLargeintField
      FieldName = 'produto'
      Required = True
    end
    object qryProdutosContratosfilial: TIntegerField
      FieldName = 'filial'
      Required = True
      DisplayFormat = '0'
    end
    object qryProdutosContratosprecovenda: TFloatField
      FieldName = 'precovenda'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryProdutosContratosprecototal: TFloatField
      FieldName = 'precototal'
      DisplayFormat = '0.00'
    end
    object qryProdutosContratosprodutodescricao: TStringField
      DisplayWidth = 50
      FieldName = 'produtodescricao'
      Size = 100
    end
    object qryProdutosContratosreferencia: TStringField
      FieldName = 'referencia'
      Size = 15
    end
    object qryProdutosContratosunidade: TStringField
      FieldName = 'unidade'
      Size = 8
    end
    object qryProdutosContratoslocalizacao: TStringField
      FieldName = 'localizacao'
      Size = 10
    end
    object qryProdutosContratosobslegal: TStringField
      FieldName = 'obslegal'
      Size = 50
    end
    object qryProdutosContratosorigem: TIntegerField
      FieldName = 'origem'
      DisplayFormat = '0'
    end
    object qryProdutosContratosincidencia: TStringField
      FieldName = 'incidencia'
      Size = 50
    end
    object qryProdutosContratosmarcadescricao: TStringField
      FieldName = 'marcadescricao'
      Size = 15
    end
  end
  object qryParcelas: TtecQuery
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
      'select p.numero,'
      '       p.parcelaorigem,'
      '       p.datavencto,'
      '       p.valorvencto,'
      
        '       case when p.formapagamento = ''T'' then cast(''QT'' as varcha' +
        'r(02)) else cast(''  '' as varchar(02)) end as sinaltroca,'
      '       p.tiporecebimento,'
      '       (select tr.descricao'
      '        from tiposrecebimentos tr'
      
        '        where tr.codigo = p.tiporecebimento) as descricaotiporec' +
        'ebimento'
      ''
      'from parcelas p'
      'where (p.contrato = :contrato)'
      'order by datavencto')
    RequestLive = False
    Left = 336
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptUnknown
      end>
    object qryParcelasnumero: TIntegerField
      FieldName = 'numero'
      Required = True
      DisplayFormat = '0'
    end
    object qryParcelasparcelaorigem: TStringField
      FieldName = 'parcelaorigem'
      Required = True
      Size = 7
    end
    object qryParcelasdatavencto: TDateField
      Alignment = taCenter
      FieldName = 'datavencto'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasvalorvencto: TFloatField
      FieldName = 'valorvencto'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryParcelassinaltroca: TStringField
      FieldName = 'sinaltroca'
      Size = 2
    end
    object qryParcelastiporecebimento: TIntegerField
      FieldName = 'tiporecebimento'
    end
    object qryParcelasdescricaotiporecebimento: TStringField
      FieldName = 'descricaotiporecebimento'
      Size = 50
    end
  end
  object qryParcelasAgrupadas: TtecQuery
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
      'select count(*) as quant,'
      '       valorvencto,'
      '       min(datavencto) as data,'
      '       tiporecebimento as tiporecebimento_a,'
      '       (select tr.descricao'
      '        from tiposrecebimentos tr'
      
        '        where tr.codigo = parcelas.tiporecebimento) as descricao' +
        'tiporecebimento_a'
      ''
      ''
      'from parcelas'
      'where contrato=:contrato'
      'group by valorvencto, tiporecebimento')
    RequestLive = False
    Left = 336
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptUnknown
      end>
    object qryParcelasAgrupadasquant: TLargeintField
      FieldName = 'quant'
    end
    object qryParcelasAgrupadasvalorvencto: TFloatField
      FieldName = 'valorvencto'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryParcelasAgrupadasdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasAgrupadastiporecebimento_a: TIntegerField
      FieldName = 'tiporecebimento_a'
    end
    object qryParcelasAgrupadasdescricaotiporecebimento_a: TStringField
      FieldName = 'descricaotiporecebimento_a'
      Size = 50
    end
  end
end
