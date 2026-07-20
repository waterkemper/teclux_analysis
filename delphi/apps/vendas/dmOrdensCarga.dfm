inherited dtmOrdensCarga: TdtmOrdensCarga
  OldCreateOrder = False
  Left = 356
  Top = 124
  Height = 431
  Width = 631
  object qryOrdensCarga: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryOrdensCargaAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select oc.*'
      'from ordemdecarga oc'
      'where oc.numero = :numero')
    RequestLive = True
    Left = 40
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end>
    object qryOrdensCarganumero: TIntegerField
      FieldName = 'numero'
    end
    object qryOrdensCargadata: TDateField
      FieldName = 'data'
    end
  end
  object dsrOrdensCarga: TtecDataSource
    DataSet = qryOrdensCarga
    Left = 80
    Top = 104
  end
  object qryOrdemdeCargaRegioes: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryOrdemdeCargaRegioesAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select distinct'
      '       e.ordemcarga,'
      '       coalesce(b.regiao,c.regiao) as regiao,'
      
        '       coalesce((select r.nome from regioes r where r.codigo = c' +
        'oalesce(b.regiao,c.regiao)), cast('#39'REGI'#195'O N'#195'O CADASTRADA'#39' as var' +
        'char(30))) as nomeregiao,'
      '       cast(null as varchar(100)) as responsavelentrega'
      'from entrega e'
      '     join clienteslocaisentrega cle'
      '          join bairros b'
      '          on cle.cidade = b.cidade'
      '          and cle.estado = b.estado'
      '          and cle.bairro = b.codigo'
      ''
      '          join cidades c'
      '          on cle.cidade = c.codigo'
      '          and cle.estado = b.estado'
      ''
      '     on cle.cliente = e.cliente'
      '     and cle.numero = e.localentrega'
      ''
      'where e.ordemcarga = :ordemcarga')
    RequestLive = True
    Left = 56
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ordemcarga'
        ParamType = ptUnknown
      end>
    object qryOrdemdeCargaRegioesordemcarga: TIntegerField
      FieldName = 'ordemcarga'
    end
    object qryOrdemdeCargaRegioesregiao: TStringField
      FieldName = 'regiao'
      Size = 10
    end
    object qryOrdemdeCargaRegioesnomeregiao: TStringField
      FieldName = 'nomeregiao'
      Size = 50
    end
    object qryOrdemdeCargaRegioesresponsavelentrega: TStringField
      FieldName = 'responsavelentrega'
      Size = 100
    end
  end
  object dsrOrdemdeCargaRegioes: TtecDataSource
    DataSet = qryOrdemdeCargaRegioes
    Left = 104
    Top = 192
  end
  object qryOrdemdeCargaProdutos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryOrdemdeCargaProdutosAfterOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT * FROM crosstab'
      '('
      #39
      
        'select e.numero, c.nome as nomecliente, cid.nome as nomecidade, ' +
        'ba.nome as nomebairro, cle.rua as localentrega,'
      
        '       case when coalesce(cle.foneddd,0)<>0 then '#39#39'('#39#39'||cast(cle' +
        '.foneddd as varchar)||'#39#39') '#39#39'||cast(cle.fonenumero as varchar) el' +
        'se'
      '       cast(cle.fonenumero as varchar) end as telefone,'
      '       cle.contato, cast(null as integer) as nrnota,'
      '       cle.observacoes,'
      '       pr.descricao as descricaoproduto,'
      '       ep.quantidade'
      '       '
      '       '
      'from entrega e'
      '     join entregaprodutos ep'
      '          join produtos pr'
      '          on ep.produto = pr.codigo'
      '          '
      '     on e.numero = ep.nrentrega'
      ''
      '     join clientes c'
      '     on c.codigo = e.cliente'
      ''
      '     join clienteslocaisentrega cle'
      '          join cidades cid'
      '          on cle.cidade = cid.codigo'
      '          and cle.estado = cid.estado'
      ''
      '          join bairros ba'
      '          on cle.cidade = ba.cidade'
      '          and cle.estado = ba.estado'
      '          and cle.bairro = ba.codigo'
      ''
      '     on cle.cliente = e.cliente'
      '     and cle.numero = e.localentrega'
      ''
      '/* %ordemcarga_1 */'
      ''
      ''
      'order by e.numero, c.nome, pr.descricao'
      #39','
      ''
      #39
      'select distinct pr.descricao as descricaoproduto'
      'from entrega e'
      '     join entregaprodutos ep'
      '          join produtos pr'
      '          on ep.produto = pr.codigo'
      ''
      '     on e.numero = ep.nrentrega'
      ''
      '     join clientes c'
      '     on c.codigo = e.cliente'
      ''
      '     join clienteslocaisentrega cle'
      '          join cidades cid'
      '          on cle.cidade = cid.codigo'
      '          and cle.estado = cid.estado'
      ''
      '          join bairros ba'
      '          on cle.cidade = ba.cidade'
      '          and cle.estado = ba.estado'
      '          and cle.bairro = ba.codigo'
      ''
      '     on cle.cliente = e.cliente'
      '     and cle.numero = e.localentrega'
      ''
      '/* %ordemcarga_2 */'
      ''
      ''
      'order by pr.descricao'#39
      ')'
      ''
      'AS'
      ' (  NrEntrega integer,'
      '    nomecliente varchar(60),'
      '    nomecidade varchar(40),'
      '    nomebairro varchar(80),'
      '    localentrega varchar(100),'
      '    telefone varchar(50),'
      '    contato varchar(50),'
      '    nrnota integer,'
      '    observacoes varchar(100),'
      '    _001 numeric(11,3),'
      '    _002 numeric(11,3),'
      '    _003 numeric(11,3),'
      '    _004 numeric(11,3),'
      '    _005 numeric(11,3),'
      '    _010 numeric(11,3),'
      '    _013 numeric(11,3),'
      '    _014 numeric(11,3),'
      '    _024_12  numeric(11,3),'
      '    _10 numeric(11,3),'
      '    _15 numeric(11,3),'
      '    _24_12 numeric(11,3),'
      '    _5 numeric(11,3),'
      '    _7 numeric(11,3)'
      ')'
      ''
      ''
      'union all'
      ''
      ''
      'SELECT * FROM crosstab'
      '('
      #39
      'select e.ordemcarga as numero,'
      '       cast('#39#39'TOTAIS'#39#39' as varchar(60)) as nomecliente,'
      '       cast(null as varchar) as nomecidade,'
      '       cast(null as varchar) as nomebairro,'
      '       cast(null as varchar) as localentrega,'
      '       cast(null as varchar) as telefone,'
      '       cast(null as varchar) as contato,'
      '       cast(null as integer) as nrnota,'
      '       cast(null as varchar) as observacoes,'
      '       pr.descricao as descricaoproduto,'
      '       sum(ep.quantidade) as quantidade'
      ''
      ''
      'from entrega e'
      '     join entregaprodutos ep'
      '          join produtos pr'
      '          on ep.produto = pr.codigo'
      ''
      '     on e.numero = ep.nrentrega'
      ''
      '     join clientes c'
      '     on c.codigo = e.cliente'
      ''
      '     join clienteslocaisentrega cle'
      '          join cidades cid'
      '          on cle.cidade = cid.codigo'
      '          and cle.estado = cid.estado'
      ''
      '          join bairros ba'
      '          on cle.cidade = ba.cidade'
      '          and cle.estado = ba.estado'
      '          and cle.bairro = ba.codigo'
      ''
      '     on cle.cliente = e.cliente'
      '     and cle.numero = e.localentrega'
      '     '
      ''
      '/* %ordemcarga_3 */'
      ''
      'group by e.ordemcarga, pr.descricao'
      'order by e.ordemcarga, pr.descricao'
      ''
      ''
      #39','
      ''
      #39
      'select distinct pr.descricao as descricaoproduto'
      'from entrega e'
      '     join entregaprodutos ep'
      '          join produtos pr'
      '          on ep.produto = pr.codigo'
      ''
      '     on e.numero = ep.nrentrega'
      ''
      '     join clientes c'
      '     on c.codigo = e.cliente'
      ''
      '     join clienteslocaisentrega cle'
      '          join cidades cid'
      '          on cle.cidade = cid.codigo'
      '          and cle.estado = cid.estado'
      ''
      '          join bairros ba'
      '          on cle.cidade = ba.cidade'
      '          and cle.estado = ba.estado'
      '          and cle.bairro = ba.codigo'
      ''
      '     on cle.cliente = e.cliente'
      '     and cle.numero = e.localentrega'
      ''
      '/* %ordemcarga_4 */'
      ''
      ''
      'order by pr.descricao'#39
      ')'
      ''
      'AS'
      ' (  NrEntrega integer,'
      '    nomecliente varchar(60),'
      '    nomecidade varchar(40),'
      '    nomebairro varchar(80),'
      '    localentrega varchar(100),'
      '    telefone varchar(50),'
      '    contato varchar(50),'
      '    nrnota integer,'
      '    observacoes varchar(100),'
      '    _001 numeric(11,3),'
      '    _002 numeric(11,3),'
      '    _003 numeric(11,3),'
      '    _004 numeric(11,3),'
      '    _005 numeric(11,3),'
      '    _010 numeric(11,3),'
      '    _013 numeric(11,3),'
      '    _014 numeric(11,3),'
      '    _024_12  numeric(11,3),'
      '    _10 numeric(11,3),'
      '    _15 numeric(11,3),'
      '    _24_12 numeric(11,3),'
      '    _5 numeric(11,3),'
      '    _7 numeric(11,3)'
      ')'
      ''
      ''
      '')
    RequestLive = True
    Left = 48
    Top = 272
    object qryOrdemdeCargaProdutosnrentrega: TIntegerField
      FieldName = 'nrentrega'
      Visible = False
    end
    object qryOrdemdeCargaProdutosnomecliente: TStringField
      DisplayLabel = 'NOME DO CLIENTE'
      FieldName = 'nomecliente'
      Size = 60
    end
    object qryOrdemdeCargaProdutosnomecidade: TStringField
      DisplayLabel = 'CIDADE'
      FieldName = 'nomecidade'
      Size = 40
    end
    object qryOrdemdeCargaProdutosnomebairro: TStringField
      DisplayLabel = 'BAIRRO'
      FieldName = 'nomebairro'
      Size = 80
    end
    object qryOrdemdeCargaProdutoslocalentrega: TStringField
      DisplayLabel = 'LOCAL ENTREGA'
      FieldName = 'localentrega'
      Size = 100
    end
    object qryOrdemdeCargaProdutostelefone: TStringField
      DisplayLabel = 'TELEFONE'
      FieldName = 'telefone'
      Size = 50
    end
    object qryOrdemdeCargaProdutoscontato: TStringField
      DisplayLabel = 'CONTATO'
      FieldName = 'contato'
      Size = 50
    end
    object qryOrdemdeCargaProdutosnrnota: TIntegerField
      DisplayLabel = 'NR NOTA'
      FieldName = 'nrnota'
    end
    object qryOrdemdeCargaProdutosobservacoes: TStringField
      DisplayLabel = 'OBSERVA'#199#213'ES'
      FieldName = 'observacoes'
      Size = 100
    end
    object qryOrdemdeCargaProdutos_001: TFloatField
      DisplayLabel = '001'
      FieldName = '_001'
      DisplayFormat = '0'
    end
    object qryOrdemdeCargaProdutos_002: TFloatField
      DisplayLabel = '002'
      FieldName = '_002'
      DisplayFormat = '0'
    end
    object qryOrdemdeCargaProdutos_003: TFloatField
      DisplayLabel = '003'
      FieldName = '_003'
      DisplayFormat = '0'
    end
    object qryOrdemdeCargaProdutos_004: TFloatField
      DisplayLabel = '004'
      FieldName = '_004'
      DisplayFormat = '0'
    end
    object qryOrdemdeCargaProdutos_005: TFloatField
      DisplayLabel = '005'
      FieldName = '_005'
      DisplayFormat = '0'
    end
    object qryOrdemdeCargaProdutos_010: TFloatField
      DisplayLabel = '010'
      FieldName = '_010'
      DisplayFormat = '0'
    end
    object qryOrdemdeCargaProdutos_013: TFloatField
      DisplayLabel = '013'
      FieldName = '_013'
      DisplayFormat = '0'
    end
    object qryOrdemdeCargaProdutos_014: TFloatField
      DisplayLabel = '014'
      FieldName = '_014'
      DisplayFormat = '0'
    end
    object qryOrdemdeCargaProdutos_024_12: TFloatField
      DisplayLabel = '024 12'
      FieldName = '_024_12'
      DisplayFormat = '0'
    end
    object qryOrdemdeCargaProdutos_10: TFloatField
      DisplayLabel = '10'
      FieldName = '_10'
      DisplayFormat = '0'
    end
    object qryOrdemdeCargaProdutos_15: TFloatField
      DisplayLabel = '15'
      FieldName = '_15'
      DisplayFormat = '0'
    end
    object qryOrdemdeCargaProdutos_24_12: TFloatField
      DisplayLabel = '24 12'
      FieldName = '_24_12'
      DisplayFormat = '0'
    end
    object qryOrdemdeCargaProdutos_5: TFloatField
      DisplayLabel = '5'
      FieldName = '_5'
      DisplayFormat = '0'
    end
    object qryOrdemdeCargaProdutos_7: TFloatField
      DisplayLabel = '7'
      FieldName = '_7'
      DisplayFormat = '0'
    end
  end
  object dsrOrdemdeCargaProdutos: TtecDataSource
    DataSet = qryOrdemdeCargaProdutos
    Left = 120
    Top = 288
  end
end
