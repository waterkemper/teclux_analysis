inherited dtmImprimeNotaEntrada: TdtmImprimeNotaEntrada
  Left = 438
  Top = 223
  Height = 364
  Width = 701
  object qryProdutos: TtecQuery
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
      'Select pn.codigonota,'
      '       pn.numero,'
      '       p.codigovisual,'
      '       null as sequenciaipi,'
      '           pn.produto,'
      
        '           coalesce(cast(substring(pn.descricaoproduto,1,40) as ' +
        'char(40)),p.descricao) as produtodescricao,'
      '           p.referencia,'
      '           pn.filial,'
      '           pn.origem,'
      '           pn.incidencia,'
      '           '#39' '#39' as localizacao,'
      '           c.unidade,'
      '           pn.quantidade,'
      '           pn.precounitario as precovenda,'
      '           pn.precounitario * pn.quantidade as precototal,'
      '           pn.aliquotaicms,'
      '           pn.codigofiscal,'
      '           '#39#39' as classificacaofiscal,'
      '           '#39#39' as ipi,'
      '           pn.valoripi,'
      '           cast(pn.produto as varchar) as produtocliente,'
      
        '           (select ipi.aliquota from ipi where ipi.codigo = c.ip' +
        'i) as aliquotaipi'
      
        'From   produtosnotaspag pn join produtos p on ( pn.produto = p.c' +
        'odigo )'
      
        '           join caracteristicas c on ( p.caracteristica = c.codi' +
        'go )'
      '           join  marcas m on  (c.marca = m.codigo)'
      'Where (pn.codigonota =:codigo)'
      'Order By pn.numero')
    RequestLive = False
    Left = 50
    Top = 73
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProdutoscodigonota: TIntegerField
      FieldName = 'codigonota'
      DisplayFormat = '0'
    end
    object qryProdutosproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryProdutosprodutodescricao: TStringField
      DisplayWidth = 50
      FieldName = 'produtodescricao'
      Size = 100
    end
    object qryProdutosfilial: TIntegerField
      FieldName = 'filial'
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
    object qryProdutosprecovenda: TFloatField
      FieldName = 'precovenda'
      DisplayFormat = '0.00'
    end
    object qryProdutosprecototal: TFloatField
      FieldName = 'precototal'
      DisplayFormat = '0.00'
    end
    object qryProdutosaliquotaicms: TFloatField
      FieldName = 'aliquotaicms'
      DisplayFormat = '0.00'
    end
    object qryProdutosreferencia: TStringField
      FieldName = 'referencia'
    end
    object qryProdutoslocalizacao: TStringField
      FieldName = 'localizacao'
      Size = 50
    end
    object qryProdutosclassificacaofiscal: TStringField
      FieldName = 'classificacaofiscal'
      Size = 50
    end
    object qryProdutosipi: TStringField
      FieldName = 'ipi'
      Size = 50
    end
    object qryProdutosvaloripi: TFloatField
      FieldName = 'valoripi'
      DisplayFormat = '0.00'
    end
    object qryProdutosprodutocliente: TStringField
      FieldName = 'produtocliente'
      Size = 50
    end
    object qryProdutoscodigofiscal: TIntegerField
      FieldName = 'codigofiscal'
      Required = True
      DisplayFormat = '0'
    end
    object qryProdutosnumero: TIntegerField
      FieldName = 'numero'
      Required = True
      DisplayFormat = '0'
    end
    object qryProdutoscodigovisual: TStringField
      FieldName = 'codigovisual'
      Required = True
      Size = 30
    end
    object qryProdutossequenciaipi: TStringField
      FieldName = 'sequenciaipi'
      Size = 50
    end
    object qryProdutosaliquotaipi: TFloatField
      FieldName = 'aliquotaipi'
      DisplayFormat = '0.00'
    end
    object qryProdutosorigem: TIntegerField
      FieldName = 'origem'
    end
    object qryProdutosincidencia: TStringField
      FieldName = 'incidencia'
      Size = 2
    end
  end
  object qryNotasPag: TtecQuery
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
      'Select n.codigo,'
      '           n.tipofornecedor,'
      '           n.serie,'
      '           n.numero as numeronota,'
      '           n.filial,'
      '           f.rua as ruafilial,'
      
        '           (Select c1.nome  From cidades c1 Where f.estado = c1.' +
        'estado and f.cidade = c1.codigo) as cidadefilial,'
      
        '           (Select b1.nome  From bairros b1 Where f.estado = b1.' +
        'estado and f.cidade = b1.cidade and f.bairro = b1.codigo) as bai' +
        'rrofilial,'
      
        '           cast(substr(f.cep,1,5) || '#39'-'#39' || substr(f.cep,6,3) as' +
        ' varchar) as cepfilial,'
      '           f.estado as estadofilial,'
      
        '           cast(case when (coalesce(f.foneddd,0) > 0) then '#39'('#39' |' +
        '| f.foneddd || '#39')'#39' else '#39'(  )'#39' end as varchar) as dddfilial,'
      
        '           cast(case when length(f.fonenumero) = 7 then substr(f' +
        '.fonenumero,1,3) || '#39'-'#39' || substr(f.fonenumero,4,4)'
      
        '                          when length(f.fonenumero) = 8 then sub' +
        'str(f.fonenumero,1,4) || '#39'-'#39' || substr(f.fonenumero,5,4)'
      '                          else   to_char(f.fonenumero,'#39#39')'
      '                   end as varchar) as fonefilial,'
      
        '           cast(case when (coalesce(f.faxddd,0) > 0) then '#39'('#39' ||' +
        ' f.faxddd || '#39')'#39' else '#39'(  )'#39' end as varchar) as dddfaxfilial,'
      
        '           cast(case when length(f.faxnumero) = 7 then substr(f.' +
        'faxnumero,1,3) || '#39'-'#39' || substr(f.faxnumero,4,4)'
      
        '                          when length(f.faxnumero) = 8 then subs' +
        'tr(f.faxnumero,1,4) || '#39'-'#39' || substr(f.faxnumero,5,4)'
      '                          else   to_char(f.faxnumero,'#39#39')'
      '                   end as varchar) as fonefaxfilial,'
      '           formatar_cpf_cnpj(f.cnpj) as  cnpjfilial,'
      '           n.natureza,'
      '           n.codigofiscal,'
      '           f.inscricaoestadual as inscricaoestadualfilial,'
      '           coalesce(v.razao,v.nome) as nome,'
      '           n.fornecedor as cliente,'
      '           formatar_cpf_cnpj(v.pessoanumero) as pessoanumero,'
      '           n.data,'
      '           v.rua,'
      '           b.nome as bairronome,'
      
        '           cast(substr(v.cep,1,5) || '#39'-'#39' || substr(v.cep,6,3) as' +
        ' varchar) as cep,'
      '           n.emissao as datasaida,'
      '           c.nome as cidadenome,'
      
        '           cast(case when (coalesce(v.foneddd,0) > 0) then '#39'('#39' |' +
        '| v.foneddd || '#39')'#39' else '#39'(  )'#39' end as varchar) as foneddd,'
      
        '           cast(case when length(v.fonenumero) = 7 then substr(v' +
        '.fonenumero,1,3) || '#39'-'#39' || substr(v.fonenumero,4,4)'
      
        '                          when length(v.fonenumero) = 8 then sub' +
        'str(v.fonenumero,1,4) || '#39'-'#39' || substr(v.fonenumero,5,4)'
      '                          else   to_char(v.fonenumero,'#39#39')'
      '                   end as varchar) as fonenumero,'
      '           v.estado,'
      '           v.inscricaoestadual as documento,'
      '           (select sum(base)'
      '            from calculosnotaspag cn'
      
        '            where (cn.codigonota = n.codigo) and tipo='#39'M'#39') as ba' +
        'seicms,'
      '           (select sum(valor)'
      '            from calculosnotaspag cn'
      
        '            where (cn.codigonota = n.codigo) AND tipo='#39'M'#39') as va' +
        'loricms,'
      
        '           ((select sum(pn.quantidade * pn.precounitario) from p' +
        'rodutosnotaspag pn'
      
        '                   where (pn.codigonota = n.codigo)) - coalesce(' +
        'n.desconto,0) + coalesce(n.acrescimo,0))'
      '                          as valorvista,'
      '           n.freteinterno as valorfrete,'
      '           n.desconto,'
      '           cast(0 as numeric(11,2)) as valoripi,'
      '           cast(0 as numeric(11,2)) as despesasacessorias,'
      '           n.seguro,'
      '           n.acrescimo,'
      '           n.valornota as valortotal,'
      '           cast(0 as numeric(11,2)) as baseissqn,'
      '           cast(0 as numeric(11,2)) as valorissqn,'
      '           cast(0 as numeric(11,2)) as totalservico,'
      '           '#39' '#39' as razaofornecedor,'
      '           '#39' '#39' as frete,'
      '           '#39' '#39' as placa,'
      '           '#39' '#39' as estadoplaca,'
      '           '#39' '#39' as numerofornecedor,'
      '           '#39' '#39' as ruafornecedor,'
      '           '#39' '#39' as cidadefornecedor,'
      '           '#39' '#39' as estadofornecedor,'
      '           '#39' '#39' as inscricaoestadualfornecedor,'
      '           '#39' '#39' as volumes,'
      '           '#39' '#39' as especietransporte,'
      '           '#39' '#39' as marca,'
      '           '#39' '#39' as numeracao,'
      '           '#39' '#39' as pesobruto,'
      '           '#39' '#39' as pesoliquido,'
      '           '#39' '#39' as vendedor,'
      '           '#39' '#39' as nomevendedor,'
      '           n.contrato,'
      
        '           (select ct.avalista from contratos ct where ct.numero' +
        ' = cast(n.contrato as char(20))) as avalista,'
      '           observacoes,'
      '           '#39' '#39' as cupomfiscal,'
      '           '#39#39' as baseicmsproprio,'
      '           '#39#39' as basesubstituicao,'
      '           '#39#39' as valoricmsproprio,'
      '           '#39#39' as valorsubstituicao,'
      '           cast(f.rua||'#39' - '#39'||(select bairros.nome'
      '                               from bairros'
      '                               where bairros.estado = f.estado'
      '                                 and bairros.cidade = f.cidade'
      '                                 and bairros.codigo = f.bairro'
      '                               )as varchar) as ruabairrofilial,'
      '           cast((select cidades.nome'
      '                 from cidades'
      
        '                 where cidades.codigo = f.cidade and cidades.est' +
        'ado=f.estado'
      
        '                 )||'#39' - '#39'||f.estado as varchar) as cidadeestadof' +
        'ilial,'
      
        '           '#39#39' as impostoretido1, '#39#39' as impostoretido2, '#39#39' as imp' +
        'ostoretido3, '#39#39' as impostoretido4,'
      '           '#39#39' as cfps, '#39#39' as anexotres, '#39#39' as filialvendanome,'
      '           '#39#39' as totalbaseicmssubstituicao,'
      '           '#39#39' as cfopnota,'
      '           '#39#39' as totalvaloricmssubstituicao'
      'From  notaspag n'
      '          left join filiais f on (n.filial = f.codigo)'
      
        '          left join vfornecedores v on ( (n.fornecedor = v.codig' +
        'o) and (n.tipofornecedor = v.tipo) )'
      
        '          left join cidades c on ( (v.estado = c.estado) and (v.' +
        'cidade = c.codigo) )'
      
        '          left join bairros b  on ((v.estado = b.estado) and (v.' +
        'cidade = b.cidade) and (v.bairro = b.codigo))'
      'Where (n.codigo =:codigo)'
      ''
      
        '/*          ((select sum(pn.quantidade * pn.precounitario) from ' +
        'produtosnotaspag pn'
      
        '            where (pn.codigonota = n.codigo)) - coalesce(n.desco' +
        'nto,0) + coalesce(n.seguro,0)) as valorvista,'
      '*/')
    RequestLive = True
    Left = 50
    Top = 17
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryNotasPagcodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object qryNotasPagtipofornecedor: TStringField
      FieldName = 'tipofornecedor'
      Size = 1
    end
    object qryNotasPagserie: TStringField
      FieldName = 'serie'
      Required = True
      Size = 3
    end
    object qryNotasPagnumeronota: TIntegerField
      FieldName = 'numeronota'
      Required = True
      DisplayFormat = '0'
    end
    object qryNotasPagfilial: TIntegerField
      FieldName = 'filial'
      Required = True
      DisplayFormat = '0'
    end
    object qryNotasPagruafilial: TStringField
      FieldName = 'ruafilial'
      Required = True
      Size = 100
    end
    object qryNotasPagcidadefilial: TStringField
      FieldName = 'cidadefilial'
      Size = 50
    end
    object qryNotasPagbairrofilial: TStringField
      FieldName = 'bairrofilial'
      Size = 50
    end
    object qryNotasPagcepfilial: TStringField
      FieldName = 'cepfilial'
    end
    object qryNotasPagestadofilial: TStringField
      FieldName = 'estadofilial'
      Required = True
      Size = 2
    end
    object qryNotasPagdddfilial: TStringField
      FieldName = 'dddfilial'
    end
    object qryNotasPagfonefilial: TStringField
      FieldName = 'fonefilial'
    end
    object qryNotasPagdddfaxfilial: TStringField
      FieldName = 'dddfaxfilial'
    end
    object qryNotasPagfonefaxfilial: TStringField
      FieldName = 'fonefaxfilial'
    end
    object qryNotasPagcnpjfilial: TStringField
      FieldName = 'cnpjfilial'
      Size = 18
    end
    object qryNotasPagnatureza: TStringField
      FieldName = 'natureza'
      Size = 50
    end
    object qryNotasPagcodigofiscal: TIntegerField
      FieldName = 'codigofiscal'
      Required = True
      DisplayFormat = '0'
    end
    object qryNotasPaginscricaoestadualfilial: TStringField
      FieldName = 'inscricaoestadualfilial'
    end
    object qryNotasPagnome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object qryNotasPagcliente: TIntegerField
      FieldName = 'cliente'
      Required = True
      DisplayFormat = '0'
    end
    object qryNotasPagpessoanumero: TStringField
      FieldName = 'pessoanumero'
      Size = 18
    end
    object qryNotasPagdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryNotasPagrua: TStringField
      FieldName = 'rua'
      Size = 50
    end
    object qryNotasPagbairronome: TStringField
      FieldName = 'bairronome'
      Required = True
      Size = 30
    end
    object qryNotasPagcep: TStringField
      FieldName = 'cep'
    end
    object qryNotasPagdatasaida: TDateField
      Alignment = taCenter
      FieldName = 'datasaida'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryNotasPagcidadenome: TStringField
      FieldName = 'cidadenome'
      Required = True
      Size = 30
    end
    object qryNotasPagfoneddd: TStringField
      FieldName = 'foneddd'
    end
    object qryNotasPagfonenumero: TStringField
      FieldName = 'fonenumero'
    end
    object qryNotasPagestado: TStringField
      FieldName = 'estado'
      Size = 50
    end
    object qryNotasPagdocumento: TStringField
      FieldName = 'documento'
      Size = 50
    end
    object qryNotasPagbaseicms: TFloatField
      FieldName = 'baseicms'
      DisplayFormat = '0.00'
    end
    object qryNotasPagvaloricms: TFloatField
      FieldName = 'valoricms'
      DisplayFormat = '0.00'
    end
    object qryNotasPagvalorfrete: TFloatField
      FieldName = 'valorfrete'
      DisplayFormat = '0.00'
    end
    object qryNotasPagacrescimo: TFloatField
      FieldName = 'acrescimo'
      DisplayFormat = '0.00'
    end
    object qryNotasPagdesconto: TFloatField
      FieldName = 'desconto'
      DisplayFormat = '0.00'
    end
    object qryNotasPagvalorvista: TFloatField
      FieldName = 'valorvista'
      DisplayFormat = '0.00'
    end
    object qryNotasPagseguro: TFloatField
      FieldName = 'seguro'
      DisplayFormat = '0.00'
    end
    object qryNotasPagvalortotal: TFloatField
      FieldName = 'valortotal'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryNotasPagrazaofornecedor: TStringField
      FieldName = 'razaofornecedor'
      Size = 50
    end
    object qryNotasPagfrete: TStringField
      FieldName = 'frete'
      Size = 50
    end
    object qryNotasPagplaca: TStringField
      FieldName = 'placa'
      Size = 50
    end
    object qryNotasPagestadoplaca: TStringField
      FieldName = 'estadoplaca'
      Size = 50
    end
    object qryNotasPagnumerofornecedor: TStringField
      FieldName = 'numerofornecedor'
      Size = 50
    end
    object qryNotasPagruafornecedor: TStringField
      FieldName = 'ruafornecedor'
      Size = 50
    end
    object qryNotasPagcidadefornecedor: TStringField
      FieldName = 'cidadefornecedor'
      Size = 50
    end
    object qryNotasPagestadofornecedor: TStringField
      FieldName = 'estadofornecedor'
      Size = 50
    end
    object qryNotasPaginscricaoestadualfornecedor: TStringField
      FieldName = 'inscricaoestadualfornecedor'
      Size = 50
    end
    object qryNotasPagespecietransporte: TStringField
      FieldName = 'especietransporte'
      Size = 50
    end
    object qryNotasPagvolumes: TStringField
      FieldName = 'volumes'
      Size = 50
    end
    object qryNotasPagnumeracao: TStringField
      FieldName = 'numeracao'
      Size = 50
    end
    object qryNotasPagmarca: TStringField
      FieldName = 'marca'
      Size = 50
    end
    object qryNotasPagpesobruto: TStringField
      FieldName = 'pesobruto'
      Size = 50
    end
    object qryNotasPagpesoliquido: TStringField
      FieldName = 'pesoliquido'
      Size = 50
    end
    object qryNotasPagvendedor: TStringField
      FieldName = 'vendedor'
      Size = 50
    end
    object qryNotasPagnomevendedor: TStringField
      FieldName = 'nomevendedor'
      Size = 50
    end
    object qryNotasPagcontrato: TStringField
      FieldName = 'contrato'
    end
    object qryNotasPagcupomfiscal: TStringField
      FieldName = 'cupomfiscal'
      Size = 50
    end
    object qryNotasPagobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 350
    end
    object qryNotasPagavalista: TIntegerField
      FieldName = 'avalista'
      DisplayFormat = '0'
    end
    object qryNotasPagbaseissqn: TFloatField
      FieldName = 'baseissqn'
      DisplayFormat = '0.00'
    end
    object qryNotasPagvalorissqn: TFloatField
      FieldName = 'valorissqn'
      DisplayFormat = '0.00'
    end
    object qryNotasPagtotalservico: TFloatField
      FieldName = 'totalservico'
      DisplayFormat = '0.00'
    end
    object qryNotasPagvaloripi: TFloatField
      FieldName = 'valoripi'
    end
    object qryNotasPagdespesasacessorias: TFloatField
      FieldName = 'despesasacessorias'
    end
    object qryNotasPagbaseicmsproprio: TStringField
      FieldName = 'baseicmsproprio'
      Size = 50
    end
    object qryNotasPagbasesubstituicao: TStringField
      FieldName = 'basesubstituicao'
      Size = 50
    end
    object qryNotasPagvalorsubstituicao: TStringField
      FieldName = 'valorsubstituicao'
      Size = 50
    end
    object qryNotasPagruabairrofilial: TStringField
      FieldName = 'ruabairrofilial'
      Size = 50
    end
    object qryNotasPagcidadeestadofilial: TStringField
      FieldName = 'cidadeestadofilial'
      Size = 50
    end
    object qryNotasPagimpostoretido1: TStringField
      FieldName = 'impostoretido1'
      Size = 50
    end
    object qryNotasPagimpostoretido2: TStringField
      FieldName = 'impostoretido2'
      Size = 50
    end
    object qryNotasPagimpostoretido3: TStringField
      FieldName = 'impostoretido3'
      Size = 50
    end
    object qryNotasPagimpostoretido4: TStringField
      FieldName = 'impostoretido4'
      Size = 50
    end
    object qryNotasPagvaloricmsproprio: TStringField
      FieldName = 'valoricmsproprio'
      Size = 50
    end
    object qryNotasPagcfps: TStringField
      FieldName = 'cfps'
      Size = 50
    end
    object qryNotasPaganexotres: TStringField
      FieldName = 'anexotres'
      Size = 50
    end
    object qryNotasPagfilialvendanome: TStringField
      FieldName = 'filialvendanome'
      Size = 50
    end
    object qryNotasPagtotalbaseicmssubstituicao: TStringField
      FieldName = 'totalbaseicmssubstituicao'
      Size = 50
    end
    object qryNotasPagtotalvaloricmssubstituicao: TStringField
      FieldName = 'totalvaloricmssubstituicao'
      Size = 50
    end
    object qryNotasPagcfopnota: TStringField
      FieldName = 'cfopnota'
      Size = 50
    end
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
      'SELECT *'
      'FROM seriesfiliais'
      'WHERE (filial = :filial) and'
      '             (valor = :serie)')
    RequestLive = True
    Left = 161
    Top = 17
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
    end
    object qrySeriesFiliaisnumerofinal: TIntegerField
      FieldName = 'numerofinal'
    end
    object qrySeriesFiliaismodelonota: TIntegerField
      FieldName = 'modelonota'
    end
  end
  object qryModelosNotas: TtecQuery
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
      'select cabecalho,'
      '         vencimento,'
      '         produto,'
      '         rodape,'
      '         canhoto,'
      '         configurar,'
      '         rodapedesconto,'
      '         rodapeacrescimo,'
      '         rodapepagina'
      'from modelosnotasfiscais'
      'where codigo = :codigo')
    RequestLive = False
    Left = 161
    Top = 73
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryModelosNotascabecalho: TStringField
      DisplayWidth = 1200
      FieldName = 'cabecalho'
      Required = True
      Size = 1200
    end
    object qryModelosNotasvencimento: TStringField
      DisplayWidth = 800
      FieldName = 'vencimento'
      Size = 800
    end
    object qryModelosNotasproduto: TStringField
      FieldName = 'produto'
      Required = True
      Size = 800
    end
    object qryModelosNotasrodape: TStringField
      FieldName = 'rodape'
      Required = True
      Size = 1800
    end
    object qryModelosNotascanhoto: TStringField
      FieldName = 'canhoto'
      Size = 512
    end
    object qryModelosNotasconfigurar: TStringField
      FieldName = 'configurar'
      Size = 50
    end
    object qryModelosNotasrodapedesconto: TStringField
      FieldName = 'rodapedesconto'
      Size = 150
    end
    object qryModelosNotasrodapeacrescimo: TStringField
      FieldName = 'rodapeacrescimo'
      Size = 150
    end
    object qryModelosNotasrodapepagina: TStringField
      FieldName = 'rodapepagina'
      Size = 512
    end
  end
  object qryCodigosFiscais: TtecQuery
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
      'select distinct codigofiscal from produtosnotaspag'
      'where'
      'codigonota =:codigo')
    RequestLive = False
    Left = 256
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryCodigosFiscaiscodigofiscal: TIntegerField
      FieldName = 'codigofiscal'
      Required = True
    end
  end
  object qryProdutosporLocalizacao: TtecQuery
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
        Name = 'Situacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Vendedor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Futuro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListasdeNotas'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';'
      
        'select pnp.localizacao, pnp.sublocalizacao, pnp.produtovisual, p' +
        'np.descricao, pnp.filial,'
      
        '       pnp.valorgrade1, pnp.valorgrade2, pnp.vendedor, u.nome as' +
        ' nomevendedor,'
      
        '       array_to_string(array_agg(pnp.numero),chr(13)) as ListaNo' +
        'tas,'
      '       sum(pnp.quantidade) as quantidade'
      'from'
      '('
      'select  pnp.numero,'
      '        p.descricao,  pnp.filial,'
      '        p.valorgrade1,'
      '        p.valorgrade2,'
      '        pnp.vendedor,'
      ''
      '       (select e.localizacao'
      '        from estoques e'
      '        where e.produto = pnp.produto'
      '          and e.filial = pnp.filial) as localizacao,'
      ''
      '       (select e.sublocalizacao'
      '        from estoques e'
      '        where e.produto = pnp.produto'
      '          and e.filial = pnp.filial) as sublocalizacao,'
      ''
      ''
      '       p.codigovisual as produtovisual,'
      ''
      '       pnp.quantidade'
      ''
      'from'
      '('
      ''
      '  Select np.fornecedor, np.tipofornecedor, np.serie, np.numero,'
      '         pnp.codigonota,'
      '         pnp.produto,'
      '         pnp.produto as composto,'
      '         pnp.vendedor,'
      '         pnp.filial,'
      '         sum(pnp.quantidade)  as quantidade'
      ''
      '  from (notaspag np'
      '        join produtosnotaspag pnp'
      '             join produtos p'
      '                  join caracteristicas c'
      '                  on p.caracteristica = c.codigo'
      '             on pnp.produto = p.codigo'
      '        on np.codigo = pnp.codigonota)'
      ''
      '  where np.codigo = pnp.codigonota'
      '    '
      '    %Situacao'
      '    %Filial'
      '    %Vendedor'
      '    %Futuro'
      ''
      '    %ListasdeNotas'
      ''
      
        '  group by np.fornecedor, np.tipofornecedor, np.serie, np.numero' +
        ', pnp.codigonota, pnp.produto, pnp.vendedor, pnp.filial'
      ''
      ''
      ') pnp join produtos p'
      '          join caracteristicas c'
      '          on p.caracteristica = c.codigo'
      '  on pnp.produto = p.codigo'
      ''
      ''
      ') as pnp  left join usuarios u on pnp.vendedor = u.codigo'
      ''
      
        'group by pnp.localizacao, pnp.sublocalizacao, pnp.produtovisual,' +
        ' pnp.descricao, pnp.valorgrade1, pnp.valorgrade2, pnp.filial, pn' +
        'p.vendedor, u.nome'
      
        'order by pnp.localizacao, pnp.sublocalizacao, pnp.produtovisual,' +
        ' pnp.descricao, pnp.valorgrade1, pnp.valorgrade2, pnp.filial, pn' +
        'p.vendedor, u.nome'
      ''
      '')
    RequestLive = False
    Left = 304
    Top = 112
    object qryProdutosporLocalizacaolocalizacao: TStringField
      FieldName = 'localizacao'
      Size = 40
    end
    object qryProdutosporLocalizacaosublocalizacao: TStringField
      FieldName = 'sublocalizacao'
      Size = 40
    end
    object qryProdutosporLocalizacaoprodutovisual: TStringField
      FieldName = 'produtovisual'
      Size = 30
    end
    object qryProdutosporLocalizacaodescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object qryProdutosporLocalizacaofilial: TIntegerField
      FieldName = 'filial'
    end
    object qryProdutosporLocalizacaovalorgrade1: TStringField
      FieldName = 'valorgrade1'
      Size = 50
    end
    object qryProdutosporLocalizacaovalorgrade2: TStringField
      FieldName = 'valorgrade2'
      Size = 50
    end
    object qryProdutosporLocalizacaovendedor: TIntegerField
      FieldName = 'vendedor'
    end
    object qryProdutosporLocalizacaonomevendedor: TStringField
      FieldName = 'nomevendedor'
      Size = 40
    end
    object qryProdutosporLocalizacaolistanotas: TMemoField
      FieldName = 'listanotas'
      BlobType = ftMemo
    end
    object qryProdutosporLocalizacaoquantidade: TFloatField
      FieldName = 'quantidade'
    end
  end
  object frpProdutosPorLocalizacao: TfrxReport
    Version = '4.0.11'
    DataSet = frxDBProdutosPorLocalizacao_
    DataSetName = 'frxDBProdutosPorLocalizacao_'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.AllowEdit = False
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'PDFCreator'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42460.379363900500000000
    ReportOptions.LastChange = 43796.524290185200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      ' vZebrar, vZebrar2 : boolean;'
      ' LINHA : INTEGER;'
      ''
      'procedure VendasOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  LINHA := LINHA+1;'
      ''
      '  if vZebrar then'
      '  begin'
      '    mmoZebrado.color := <CordoZebrado>;'
      '    vZebrar := false;'
      '  end'
      '  else'
      '  begin'
      '    mmoZebrado.color := clwhite;'
      '    vZebrar := true;'
      '  end;'
      ''
      'end;'
      ''
      'begin'
      'end.')
    Left = 304
    Top = 168
    Datasets = <
      item
        DataSet = frxDBProdutosPorLocalizacao
        DataSetName = 'frxDBProdutosPorLocalizacao'
      end>
    Variables = <
      item
        Name = ' Relatorio'
        Value = Null
      end
      item
        Name = 'ENDERECO_BAIRRO'
        Value = #39'Avenida Prefeito Osmar Cunha, 183, Sala 27 - Centro'#39
      end
      item
        Name = 'RAZAOFILIALBASE'
        Value = #39'W&D COM. PRODUTOS M'#201'DICOS HOSPITALARES e PODOLOGIA LTDA-EPP'#39
      end
      item
        Name = 'CEP_CIDADE_UF'
        Value = #39'88015-100  Florian'#243'polis  SC'#39
      end
      item
        Name = 'TITULO'
        Value = #39'PRODUTOS POR LOCALIZA'#199#195'O'#39
      end
      item
        Name = 'SUBTITULO'
        Value = #39#39
      end
      item
        Name = 'OUTRAS'
        Value = #39' Filiais: '#39#39'4'#39#39'Entre: 01/01/2015 e 02/01/2015'#39
      end
      item
        Name = 'DATA'
        Value = Null
      end
      item
        Name = 'CordoZebrado'
        Value = '$00B3D9FF'
      end
      item
        Name = 'AgruparGrupoFilial'
        Value = 'False'
      end
      item
        Name = 'AgruparFilial'
        Value = 'False'
      end
      item
        Name = 'AgruparConceito'
        Value = 'False'
      end
      item
        Name = 'AgruparCliente'
        Value = 'False'
      end
      item
        Name = 'Ordenacao'
        Value = '0'
      end
      item
        Name = 'MascaraQuantidade'
        Value = #39'###,##0.000'#39
      end
      item
        Name = 'ImprimirPlano'
        Value = 'True'
      end
      item
        Name = 'Totalizacao'
        Value = '0'
      end
      item
        Name = 'DATASITUACAO'
        Value = #39'30/04/2015'#39
      end
      item
        Name = 'QuebrarPaginaporCliente'
        Value = 'False'
      end
      item
        Name = 'Pagina1'
        Value = Null
      end
      item
        Name = 'Pagina2'
        Value = Null
      end
      item
        Name = 'CondicaoTotalizacao'
        Value = 
          'IIF((<Totalizacao>=0) and ((<Ordenacao>=1) or (<Ordenacao>=2)),<' +
          'frxDBcustomercvendidas_."grupo">,IIF((<Totalizacao>=1),<frxDBcus' +
          'tomercvendidas_."grupo">+formatdatetime('#39'dd/mm/yyyy'#39',<frxDBcusto' +
          'mercvendidas_."data">),IIF((<Totalizacao>=2),<frxDBcustomercvend' +
          'idas_."classe">+formatdatetime('#39'dd/mm/yyyy'#39',<frxDBcustomercvendi' +
          'das_."data">),IIF((<Totalizacao>=3),<frxDBcustomercvendidas_."no' +
          'tafiscal">+<frxDBcustomercvendidas_."cupomfiscal">,'#39#39'))))'
      end
      item
        Name = ' Cabecalho'
        Value = Null
      end
      item
        Name = 'EmLinha'
        Value = 'True'
      end
      item
        Name = 'ForadeLinha'
        Value = 'False'
      end
      item
        Name = 'ComMontagem'
        Value = 'True'
      end
      item
        Name = 'SemMontagem'
        Value = 'True'
      end
      item
        Name = 'Brinde'
        Value = 'True'
      end
      item
        Name = 'NaoBrinde'
        Value = 'True'
      end
      item
        Name = 'Ativo'
        Value = 'True'
      end
      item
        Name = 'Inativo'
        Value = 'False'
      end
      item
        Name = 'Composto'
        Value = 'True'
      end
      item
        Name = 'NaoComposto'
        Value = 'True'
      end
      item
        Name = 'Vendas'
        Value = 'True'
      end
      item
        Name = 'Devolucoes'
        Value = 'True'
      end
      item
        Name = 'TipodeResumo'
        Value = '0'
      end>
    Style = <
      item
        Name = 'Style1'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 2.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object MasterData: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        Height = 14.362204720000000000
        ParentFont = False
        Top = 181.417440000000000000
        Width = 1114.961350000000000000
        OnBeforePrint = 'VendasOnBeforePrint'
        AllowSplit = True
        DataSet = frxDBProdutosPorLocalizacao
        DataSetName = 'frxDBProdutosPorLocalizacao'
        RowCount = 0
        Stretched = True
        object mmoZebrado: TfrxMemoView
          Left = 18.897650000000000000
          Width = 1028.032160000000000000
          Height = 14.362204720000000000
          StretchMode = smMaxHeight
          AllowExpressions = False
          Clipped = False
          Color = 11786751
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          WordWrap = False
          Wysiwyg = False
        end
        object Memo2: TfrxMemoView
          Left = 347.716760000000000000
          Width = 102.047310000000000000
          Height = 12.850393700000000000
          DataSet = frxDBProdutosPorLocalizacao
          DataSetName = 'frxDBProdutosPorLocalizacao'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBProdutosPorLocalizacao."produtovisual"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo4: TfrxMemoView
          Left = 453.543600000000000000
          Width = 317.480520000000000000
          Height = 12.850393700000000000
          StretchMode = smActualHeight
          DataSet = frxDBProdutosPorLocalizacao
          DataSetName = 'frxDBProdutosPorLocalizacao'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '[frxDBProdutosPorLocalizacao."descricao"] [frxDBProdutosPorLocal' +
              'izacao."valorgrade1"] [frxDBProdutosPorLocalizacao."valorgrade2"' +
              ']')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 929.764380000000000000
          Width = 52.913420000000000000
          Height = 12.850393700000000000
          DataSet = frxDBProdutosPorLocalizacao
          DataSetName = 'frxDBProdutosPorLocalizacao'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBProdutosPorLocalizacao."quantidade"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo1: TfrxMemoView
          ShiftMode = smDontShift
          Left = 990.236860000000000000
          Width = 52.913420000000000000
          Height = 12.850393700000000000
          StretchMode = smActualHeight
          DataSet = frxDBProdutosPorLocalizacao
          DataSetName = 'frxDBProdutosPorLocalizacao'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBProdutosPorLocalizacao."listanotas"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 18.897650000000000000
          Width = 166.299320000000000000
          Height = 12.850393700000000000
          DataSet = frxDBProdutosPorLocalizacao
          DataSetName = 'frxDBProdutosPorLocalizacao'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBProdutosPorLocalizacao."localizacao"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 185.196970000000000000
          Width = 162.519790000000000000
          Height = 12.850393700000000000
          DataSet = frxDBProdutosPorLocalizacao
          DataSetName = 'frxDBProdutosPorLocalizacao'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBProdutosPorLocalizacao."sublocalizacao"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 771.024120000000000000
          Width = 34.015770000000000000
          Height = 12.850393700000000000
          StretchMode = smActualHeight
          DataSet = frxDBProdutosPorLocalizacao
          DataSetName = 'frxDBProdutosPorLocalizacao'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBProdutosPorLocalizacao."vendedor"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 805.039890000000000000
          Width = 124.724490000000000000
          Height = 12.850393700000000000
          StretchMode = smActualHeight
          DataSet = frxDBProdutosPorLocalizacao
          DataSetName = 'frxDBProdutosPorLocalizacao'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBProdutosPorLocalizacao."nomevendedor"]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 80.881933700000000000
        Top = 18.897650000000000000
        Width = 1114.961350000000000000
        object Memo18: TfrxMemoView
          Left = 347.716760000000000000
          Top = 64.252010000000000000
          Width = 105.826840000000000000
          Height = 12.850393700000000000
          DataSet = frxDBProdutosPorLocalizacao
          DataSetName = 'frxDBProdutosPorLocalizacao'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'PRODUTO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 453.543600000000000000
          Top = 64.252010000000000000
          Width = 317.480520000000000000
          Height = 12.850393700000000000
          StretchMode = smActualHeight
          DataSet = frxDBProdutosPorLocalizacao
          DataSetName = 'frxDBProdutosPorLocalizacao'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'DESCRI'#195#8225#195#402'O')
          ParentFont = False
          VAlign = vaCenter
        end
        object fmvRua: TfrxMemoView
          Left = 147.401670000000000000
          Top = 3.779530000000000000
          Width = 222.992270000000000000
          Height = 60.472480000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[RAZAOFILIALBASE]'
            '[ENDERECO_BAIRRO]'
            '[CEP_CIDADE_UF]')
          ParentFont = False
        end
        object fpvLogo: TfrxPictureView
          Left = 18.897650000000000000
          Top = 3.779530000000000000
          Width = 120.944960000000000000
          Height = 45.354360000000000000
          Picture.Data = {
            07544269746D617016110000424D161100000000000036000000280000004800
            0000140000000100180000000000E0100000C40E0000C40E0000000000000000
            0000FFFFFFFFFFFFFCFCFCCECDCDFFFFFFE3E3E3CFCFD0FFFFFFF1F1F1CDCDCD
            FAFAFADDDDDDFFFFFFE4E3E3FFFFFFE4E4E4DBDCDCFFFFFFECECECFBFBFBFCFC
            FCCECECDF9F9F9FFFFFFB5B5B58D8D8E9E9E9DF8F8F8F4F4F4FAFAFAD0D0D0D3
            D3D4FEFEFEFFFFFFFFFFFFD7D7D8DBDADAFDFDFDF2F2F2DDDDDDFEFEFEE9E9E9
            FFFFFFFEFEFECFCFD0CFCFCFFAFAFAF0F0F1FAFAFADADADACECECEEEEEEEFFFF
            FFE7E7E7ECECECFEFEFED0D0D1E9E9E9F1F1F1FBFBFBE1E1E1FBFBFBF4F4F4FA
            FAFACFCFCFD4D4D5FFFFFFCECECECECECEFAFAFAFFFFFFFFFFFFFFFFFFFFFFFF
            A9A8A8D2D2D2DCDCDC999999DFDFDFF7F7F7585859F1F1F1FDFDFD3C3A3AFFFF
            FF545453ECECEC969696C7C7C7B2B2B2999A9AEBEBEB424140EDEDED414141FA
            FAF9585757E7E7E7868686D9D9D9C0C0C06F6F6FDDDDDD696969F9F9F9FFFFFF
            929394D0D0D0E7E7E7EFEFEFB3B3B23E3E3FF9F9F97B7B7AFFFFFFFFFFFFE0E0
            E0C7C7C68C8C8CAFAEAEDFDFDFECECECD8D7D73F3F3FFEFEFE4C4D4EF9F9F946
            4646DFDFDFF1F1F1A8A7A7E7E7E7484747DEDEDEBCBCBC545352E1E1E15A5A5A
            FFFFFFE0E0E0D3D3D37E7D7EFFFFFFFFFFFFFFFFFFFFFFFFABABABE2E2E1DADA
            DA7A7A79B9B9B9F6F6F668686AFEFEFEFFFFFF3E3D3DFEFEFE565658E8E8E8B0
            B0AFD8D8D8A5A5A4999A9AEBEBEB403F3EFCFCFB464646F8F8F8616161F2F2F2
            868686D9D9D9C0C0C0F3F3F3B3B3B3484949FAFAFAFFFFFF8E8F90AAAAA9C9C9
            C8EFEFEFB7B7B73E4043F1F1F1848485FFFFFFF9F9F94D4D4DC5C5C5F6F6F6B1
            B0B0DFDFDF4B4B4DC3C3C3E4E4E4FDFDFD555656FEFEFE40403FB9B9B9E1E1E1
            A8A8A8E6E6E64B4A4ADADADAC0C1C2F2F2F2B3B3B33F3F3FFFFFFF404040C4C4
            C4F5F5F5FFFFFFFFFFFFFFFFFFFFFFFF7474749C9B9AFFFFFFE2E2E2AFAFB0FE
            FEFEF0F0F0AEAEADF5F6F6C0BFBEB3B3B2FCFCFCFFFFFFD7D7D8C6C6C6FFFFFF
            989999EAEBEBFCFCFCAFAFAFF6F6F6FFFFFFEDEDEDB0B0AFE1E1E0F0F0F0E7E7
            E7D9D9D9AFAEAEDCDDDDFFFFFFFFFFFFFFFFFFC9C9C9C2C2C2FCFCFCB0B0AFB7
            B7B7B7B6B5FCFCFCFFFFFFFFFFFFD6D7D7AEAEADE7E7E5E0E0E0F2F2F2F2F2F2
            B0AFAFC2C2C2E6E6E63B3A3ADDDEDEFFFFFFB6B6B6DDDDDDE9E9E9B0AFAFB7B7
            B7BEBEBEFFFFFFD1D1D1AFAEAEE0E0E0FFFFFFDADADAAFAEAEE1E1E1FFFFFFFF
            FFFFFFFFFFFFFFFFEAEAEAF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9FAFAF9FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F3DDDAB6ECE9C4ECE9C4FD
            FDF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEAF7F7F7FFFFFFFFFFFFFFFFFFFFFF
            FFD6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFEFEFECDCDCEB2B2B1ADAEB0BABCBDFFFFFFFFFFFFFFFFFFF8F8F9CACB
            CCB3B4B4ADAEB0ADAEB0ADAEB0C6C7C8FFFFFFFFFFFFFFFFFFFEFEFED1D2D3B7
            B7B7B6B7B8FFFFFFFFFFFFFCFCF6ACA205ADA400ADA400F6F5E5FFFFFFFFFFFF
            EAE7BFE3DFA6E3DFA6E3DFA6E3DFA6E3DFA6E3DFA6E3DFA6E5E1AEECE9C5FCFC
            F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDECEBC6E4E0ABECE9C3FDFCF9FF
            FFFFFFFFFFFFFFFFFFFFFFFEFEFCE6E3B1E6E3B1EDEAC7FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFF7F6E6E8E7BAE6E3B1E6E3B1FFFFFFFFFFFFF3F3F41B1E231619
            20171A20171A203F4045FFFFFFFDFDFD8183850F1218161920171A20171A2017
            1A20171A205C5D61FFFFFFFFFFFF9FA0A10F1218161920171A20313337FFFFFF
            FFFFFFFCFCF6ACA205ADA400ADA400F6F5E5FFFFFFFFFFFFC2BA43ADA400ADA4
            00ADA400ADA400ADA400ADA400ADA400ADA400ADA400ABA104F9F8EFFFFFFFFF
            FFFFFFFEFCCDC869ACA104ADA400ADA400ADA400ACA103C8C156FEFEFBFFFFFF
            FFFFFFFAFAEFABA100ADA400C2BA45FFFFFFFFFFFFFFFFFFFFFFFFC1B944ACA3
            00ADA400ADA400ADA400FFFFFFFFFFFF838586171A20181B2111151B3C3E4160
            6265FFFFFF71737616191F181B210F13193034383D3F443D40443D4044797A7B
            FFFFFFBEBFC113161C181B2114181D1C20244D4F4CEEECCBEEECCBEDEAC7BCB5
            36BCB635BCB635E5E2B0E8E6BBE8E6BBC8C45ABDB63FBDB63FBDB63FBDB63FBD
            B63FBDB63FBDB640BBB438ADA400ADA400B9AF26FFFFFFFEFEFDBCB334ADA400
            ADA400ABA101AEA404ABA101ADA400ADA400B7AE26FEFEFAFFFFFFFAFAEFABA1
            00ADA400C2BA45FFFFFFFFFFFFFFFFFFF4F1DCACA300ADA400ADA400B0A608B1
            A811FFFFFFFFFFFF35383C181B2111151AE8E8E8FFFFFFFFFFFFF7F7F70E1217
            181B211C1F24F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD1F2227181B
            2115181EB6B7B9FFFFFFF2EFD4ACA300ADA400AFA409FEFDFAFFFFFFFFFFFFB1
            A810ADA400ADA400E5E2AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFB0A611ADA400AEA504FDFDF8D3CD78ACA300ADA400DCD791FFFFFFFFFF
            FFFFFFFFDFDC9EACA202ADA400CAC35BFFFFFFFAFAEFABA100ADA400C2BA45FF
            FFFFFFFFFFFFFFFFD4D07BADA400ADA400D3CD77FFFFFFFFFFFFFFFFFFFFFFFF
            282A2C181B2112151BF0F1F1FFFFFFFFFFFFB6B7B8181B21181B212F32368081
            857F80857F80857F80857F8085A6A7A8E6E6E613161C181B2124272CFFFFFFFF
            FFFFF2EFD4ACA300ADA400B0A709FEFDFAFFFFFFFFFFFFB1A810ADA400ADA400
            E5E2AFFFFFFFFFFFFFFEFEFEFDFDFBFBFAF3FBFAF3F9F9F0E9E6BCADA403ADA4
            00B0A707FEFDF9ACA202ADA400CDC767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4
            CF7BADA400ABA100FFFFFFFAFAEFABA100ADA400C2BA45FFFFFFFFFFFFFFFFFF
            CEC763ADA400ADA400E4E1ABFFFFFFFFFFFFFFFFFFFFFFFF292C31181B211216
            1BF1F1F2FFFFFFFFFFFF9A9C9E181B21181B21181B21181B21181B21181B2118
            1B21181B215D5E62DBDCDC11141A181B21494B4EFFFFFFFFFFFFF3F2DBB9B02A
            B9B02BBAB230D7D7D7D7D7D7D7D7D7BDB53EBEB53BBEB53BEBE8BEFFFFFFECE9
            C5ADA307ACA200ADA400ADA400ADA400ADA400ADA400ADA400CCC661FFFFFFAB
            A100ADA400EEECC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F5E5ACA300ADA400
            FBFAF2FAFAEFABA100ADA400C2BA45FFFFFFFFFFFFFFFFFFCEC762ADA400ADA4
            00E7E4B5FFFFFFFFFFFFFFFFFFFFFFFF292C31181B2112161BF1F1F2FFFFFFFF
            FFFFABABAB181B21181B21171A2014171C14171C14171C14171C14171C5C5E62
            E2E3E313161C181B21373A3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7171A
            1F13161B13161BE7E8EAFFFFFFFFFFFFFFFFFFFFFFFEA99E02ADA400ADA400B1
            A610B3A918B3A919B3A91ABBB32EE5E2AFFFFFFFFFFFFFABA100ADA400E5E1AD
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEBCAADA400ABA000FFFFFEFAFAEFABA1
            00ADA400C2BA45FFFFFFFFFFFFFFFFFFCEC762ADA400ADA400E7E4B5FFFFFFFF
            FFFFFFFFFFFFFFFF292C31181B2112161BF1F1F2FFFFFFFFFFFFDFDFDF14171D
            181B213C3E42F1F1F2F0F0F1F0F0F1F0F0F1F0F0F1F5F5F5F8F8F8171A1F181B
            210C0F15FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7171A1F181B21181B21E7
            E8E9FFFFFFFFFFFFFFFFFFF3F1D7ADA400ADA400B8B023FEFEFDFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3AA15ADA400B8B023FEFEFBFFFFFFFFFF
            FFFFFFFFFFFFFFBCB330ADA400AFA405FFFFFFFAFAEFABA100ADA400C2BA45FF
            FFFFFFFFFFFFFFFFCEC762ADA400ADA400E7E4B5FFFFFFFFFFFFEEEEEEE8E8E8
            272A2F181B2113171CDFDFDFE8E8E8ECECECFFFFFF111319181B21171A20ADAE
            B0E2E2E3E8E8E8E8E8E8E8E8E8EFEFEFFFFFFF4D4F52181B21181B2147494ECF
            D0D1E3E3E4E4E4E5E4E4E5DEDFDF27292D272B2F272B2FDADADAE6E7E7E6E7E7
            F5F5F5F5F3E0ADA400ADA400B0A70FF1EFD4F2F0D6F2F0D6F1F0D4F1F0D4F1F0
            D4F7F5E5FFFFFFF1EFD3ACA202ADA400AEA503DED999EDEAC5E1DEA1B0A70AAD
            A400ACA300E8E5B7F1EFD4EEEDCCACA200ADA400BFB73BF1EFD4F1EFD4FAF9EE
            CEC762ADA400ADA400DDD996F1EFD4F1EFD4595B5E15181E181B21181B21181B
            2115181E15181E3D3E43FFFFFFC7C7C90E1117181B2115191E15181E15181E15
            181E15181E5B5C5FFFFFFFF0F0F10A0E13181B21181B2115181E15181E15181E
            15181E16191EFAFAFAFFFFFFFFFFFF25292D15181E15181E9D9EA0FFFFFFABA0
            00ADA400ADA400ACA300ACA300ACA300ACA300ACA300ACA300CAC55CFFFFFFFF
            FFFFE4E1ADABA200ADA400ADA400ACA300ADA400ADA400ABA200DEDA99D2CD73
            ACA300ACA300ADA400ADA400ADA400ACA300ACA300E0DD9ECEC762ADA400ADA4
            00ADA400ACA300ACA3005A5D6015181D181B21181B21181B2116191E15181D3E
            4044FFFFFFFFFFFFE0E0E1494C4F212429171A1F15181D15181D15181D5C5F62
            FFFFFFFFFFFFF0F1F16B6D70282C301B1E2215181D15181D15181D161A1FF9F9
            F9FFFFFFFFFFFF272B2F181B21181B219E9FA2FFFFFFF9F9EDBEB83DAFA60BAD
            A403ADA403ADA403ADA403ADA403ADA403CBC55EFFFFFFFFFFFFFFFFFFFAF9EF
            CDC865B5AB1BAEA406B3AA18CBC562F9F7E9FFFFFFD2CD75AFA605AFA605ADA4
            00ADA400ADA400AFA605AFA605E0DCA0CEC762ADA400ADA400AEA502AFA605AF
            A605FDFDFDFCFCFC292C31181B2112161BF0F0F0FCFCFCFDFDFDFFFFFFFFFFFF
            FFFFFFFFFFFFFEFEFEFCFCFCFCFCFCFCFCFCFCFCFCFDFDFDFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFDFDFDFCFCFCFCFCFCFCFCFCFCFCFCFFFFFFFFFFFFFFFFFF2A
            2C2F15191E15191EA0A0A0FFFFFFFFFFFFFFFFFFFEFEFDFEFEFCFEFEFCFEFEFC
            FEFEFCFEFEFCFEFEFCFEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
            FDFFFFFEFFFFFFFFFFFFFFFFFFFFFEFEFEFEFDFBFBF3ABA100ADA400BEB639FE
            FEFDFEFEFDFFFFFECEC762ADA400ADA400E6E3B3FEFEFDFEFEFDFFFFFFFFFFFF
            292C31181B2112161BF1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFDFDF8AAA000ADA400ADA400C4BC4BC7C152ECE9C1
            CEC762ADA400ADA400E7E4B5FFFFFFFFFFFFFFFFFFFFFFFF292C31181B211216
            1BF1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFBFB740ACA200ADA400ADA400ADA400E2DEA3CEC762ADA400ADA4
            00E7E4B5FFFFFFFFFFFFFFFFFFFFFFFF67696B5A5C60585A5EF5F5F5FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
            FCE6E3B1CBC55DC5C34EC5C34EEAE7BEDDD893C5C34EC5C34EEEECCAFFFFFFFF
            FFFF}
        end
        object Memo236: TfrxMemoView
          Left = 982.677800000000000000
          Top = 26.456710000000000000
          Width = 60.472480000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Page#]')
          ParentFont = False
        end
        object Memo237: TfrxMemoView
          Left = 944.882500000000000000
          Top = 26.456710000000000000
          Width = 34.015770000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'P'#195#129'GINA')
          ParentFont = False
        end
        object Memo238: TfrxMemoView
          Left = 944.882500000000000000
          Top = 11.338590000000000000
          Width = 34.015770000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'DATA')
          ParentFont = False
        end
        object Memo239: TfrxMemoView
          Left = 982.677800000000000000
          Top = 11.338590000000000000
          Width = 60.472480000000000000
          Height = 11.338582680000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[Date]')
          ParentFont = False
        end
        object mmoTitulo: TfrxMemoView
          ShiftMode = smDontShift
          Left = 374.173470000000000000
          Top = 7.559060000000000000
          Width = 283.464750000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[TITULO]')
          ParentFont = False
          WordWrap = False
        end
        object Memo240: TfrxMemoView
          ShiftMode = smDontShift
          Left = 374.173470000000000000
          Top = 26.456710000000000000
          Width = 283.464750000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUBTITULO]')
          ParentFont = False
          WordWrap = False
        end
        object Memo3: TfrxMemoView
          Left = 990.236860000000000000
          Top = 64.252010000000000000
          Width = 52.913420000000000000
          Height = 12.850393700000000000
          DataSet = frxDBProdutosPorLocalizacao
          DataSetName = 'frxDBProdutosPorLocalizacao'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'NOTAS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 929.764380000000000000
          Top = 64.252010000000000000
          Width = 60.472480000000000000
          Height = 12.850393700000000000
          DataSet = frxDBProdutosPorLocalizacao
          DataSetName = 'frxDBProdutosPorLocalizacao'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'QUANTIDADE')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 18.897650000000000000
          Top = 64.252010000000000000
          Width = 166.299320000000000000
          Height = 12.850393700000000000
          DataSet = frxDBProdutosPorLocalizacao
          DataSetName = 'frxDBProdutosPorLocalizacao'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'LOCALIZA'#195#8225#195#402'O')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 185.196970000000000000
          Top = 64.252010000000000000
          Width = 162.519790000000000000
          Height = 12.850393700000000000
          DataSet = frxDBProdutosPorLocalizacao
          DataSetName = 'frxDBProdutosPorLocalizacao'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'SUBLOCALIZA'#195#8225#195#402'O')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 771.024120000000000000
          Top = 64.252010000000000000
          Width = 52.913420000000000000
          Height = 12.850393700000000000
          StretchMode = smActualHeight
          DataSet = frxDBProdutosPorLocalizacao
          DataSetName = 'frxDBProdutosPorLocalizacao'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'VENDEDOR')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 823.937540000000000000
          Top = 64.252010000000000000
          Width = 105.826840000000000000
          Height = 12.850393700000000000
          StretchMode = smActualHeight
          DataSet = frxDBProdutosPorLocalizacao
          DataSetName = 'frxDBProdutosPorLocalizacao'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'NOME DO VENDEDOR')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 219.212740000000000000
        Width = 1114.961350000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 929.764380000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBProdutosPorLocalizacao."quantidade">,MasterData)]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 865.512370000000000000
          Width = 68.031540000000000000
          Height = 16.629923700000000000
          DataSet = frxDBProdutosPorLocalizacao
          DataSetName = 'frxDBProdutosPorLocalizacao'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            'Quantidade Total')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Left = 18.897650000000000000
          Top = 18.897650000000000000
          Width = 1028.032160000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Top = 158.740260000000000000
        Width = 1114.961350000000000000
        Condition = '<frxDBProdutosPorLocalizacao."produtovisual">'
      end
    end
  end
  object frxDBProdutosPorLocalizacao: TfrxDBDataset
    UserName = 'frxDBProdutosPorLocalizacao'
    CloseDataSource = False
    FieldAliases.Strings = (
      'localizacao=localizacao'
      'sublocalizacao=sublocalizacao'
      'produtovisual=produtovisual'
      'descricao=descricao'
      'filial=filial'
      'valorgrade1=valorgrade1'
      'valorgrade2=valorgrade2'
      'vendedor=vendedor'
      'nomevendedor=nomevendedor'
      'listanotas=listanotas'
      'quantidade=quantidade')
    OpenDataSource = False
    DataSet = qryProdutosporLocalizacao
    Left = 472
    Top = 120
  end
  object frxDBProdutosPorLocalizacao_: TfrxDBDataset
    UserName = 'frxDBProdutosPorLocalizacao_'
    CloseDataSource = False
    FieldAliases.Strings = (
      'localizacao=localizacao'
      'sublocalizacao=sublocalizacao'
      'produtovisual=produtovisual'
      'descricao=descricao'
      'filial=filial'
      'valorgrade1=valorgrade1'
      'valorgrade2=valorgrade2'
      'vendedor=vendedor'
      'nomevendedor=nomevendedor'
      'listanotas=listanotas'
      'quantidade=quantidade')
    OpenDataSource = False
    DataSet = qryProdutosporLocalizacao
    Left = 472
    Top = 160
  end
end
