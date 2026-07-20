inherited dtmConfirmarromaneiosTransferencia: TdtmConfirmarromaneiosTransferencia
  Left = 572
  Top = 197
  Height = 562
  Width = 1002
  object qryromaneiosTransferencias: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryromaneiosTransferenciasAfterOpen
    AfterScroll = qryromaneiosTransferenciasAfterScroll
    OnFilterRecord = qryromaneiosTransferenciasFilterRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    MacroChar = '$'
    Macros = <
      item
        DataType = ftUnknown
        Name = 'SQL'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';select sel.*,'
      
        '        cast(sum(somavolumes) OVER (partition by vpartition) AS ' +
        'bigint) AS totalsomavolumes,'
      ''
      
        '       case when situacaoromaneioentrada = '#39'CONFIRMADA'#39' then tru' +
        'e else false end as selecionar'
      'from'
      '('
      'Select   cast(0 as integer) as vpartition,'
      '         rn.romaneio,'
      ''
      '         (select vodf.volumes'
      '          from volumesdadosfiscais vodf'
      '          where vodf.dadofiscal = df.numero'
      '          order by vodf.codigo limit 1) as volumes,'
      ''
      '         cast((select sum(vodf.volumes)'
      '          from volumesdadosfiscais vodf'
      
        '          where vodf.dadofiscal = df.numero) as bigint) as somav' +
        'olumes,'
      ''
      ''
      '         (select count(*)'
      '          from volumesdadosfiscaisconferencia vdfc'
      '          where vdfc.tipo = '#39'ROE'#39
      '            and vdfc.codigo = cast(r.numero as varchar)'
      '            and vdfc.dadofiscal = df.numero'
      '            and coalesce(vdfc.conferido,false)'
      '          ) as Lidos,'
      ''
      '         (select sum(coalesce(vodf.volumes,1))'
      '          from volumesdadosfiscais vodf'
      '          where vodf.dadofiscal in ( select rn2.dadofiscal'
      '                                     from romaneiosnotas rn2'
      
        '                                     where rn2.romaneio = r.nume' +
        'ro)) as aLer,'
      ''
      
        '          situacao_romaneio_entrada(r.numero) as situacaoromanei' +
        'oentrada,'
      
        '          situacao_romaneio_entrada(r.numero, rn.dadofiscal) as ' +
        'sit_romaneio_df_entr,'
      ''
      '         df.numero as dadofiscal,'
      '         df.filialemissao,'
      '         df.data,'
      '         df.valortotal,'
      '         df.observacoes,'
      '         n.serie,'
      '         n.numero,'
      '         df.chv_nfe,'
      '         f.nome,'
      '         df.codigofiscal,'
      '         df.vendatransferencia,'
      '         r.tipo as tiporomaneio,'
      
        '         case when r.situacao_romaneio='#39'PASSAGEM'#39' then true else' +
        ' false end as RomaneioPassagem,'
      '         df.cliente,'
      '         r.situacao_romaneio'
      ''
      ''
      'From     (romaneios r'
      '         join (romaneiosnotas rn'
      '               join ((dadosfiscais df'
      '                      join notas n'
      '                      on df.numero = n.dadofiscal)'
      ''
      '                     join filiais f'
      '                     on df.filialemissao = f.codigo)'
      ''
      '               on rn.dadofiscal = df.numero)'
      '         on r.numero = rn.romaneio)'
      ''
      
        'Where        /* ATEN'#199#195'O FALTA ALTERAR  N'#195'O PERMITIR SELECIONAR N' +
        'OTAS QUE J'#193' CASARAM SAIDA (DADOFISCAL) COM ENTRADA (NOTASPAG)*/'
      '            $SQL'
      '            ('
      '             (df.cliente = :cliente) or'
      ''
      '              (case when r.situacao_romaneio = '#39'PASSAGEM'#39' then'
      ''
      '                  df.numero in (select distinct vdfc.dadofiscal'
      
        '                                 from volumesdadosfiscaisconfere' +
        'ncia vdfc'
      '                                 where vdfc.tipo='#39'ROP'#39
      
        '                                   and vdfc.codigo = cast(r.nume' +
        'ro as varchar(20))'
      
        '                                   and coalesce(vdfc.conferido,f' +
        'alse))'
      '                   '
      '               else false end'
      '               )'
      ''
      '             ) and'
      '             '
      '            (df.tipocliente = '#39'L'#39')              and'
      
        '            ((df.codigofiscal % 1000) in (150,151,152,155,156,40' +
        '8,409,552,557)  or df.vendatransferencia or eHNotaFiscalSaidaDev' +
        'olucao(df.codigofiscal) ) and'
      '            (df.situacao = '#39'N'#39') and'
      
        '            ((r.situacao_romaneio = '#39'EM TR'#194'NSITO'#39')  or /* (r.tip' +
        'o = '#39'T'#39') and */'
      '             (r.situacao_romaneio = '#39'PASSAGEM'#39') or'
      '             (r.situacao_romaneio = '#39'ENTREGUE PARCIAL'#39'))  AND'
      ''
      
        '            not exists (select np.numero from notaspag np where ' +
        'np.dadofiscalreferenciado = df.numero and coalesce(np.vendatrans' +
        'ferencia,false)) and'
      ''
      ''
      '            ('
      ''
      '                (('#9'select count(*)'
      #9#9#9'            from'
      ''
      
        #9#9#9'            (SELECT sum(pd.quantidade) as quantidade,pd.produ' +
        'to'
      #9#9#9'             FROM produtosdadosfiscais pd'
      #9#9#9'             WHERE (pd.dadofiscal = df.numero)'
      #9#9#9'             group by pd.produto) as pd,'
      ''
      
        #9#9#9'            (SELECT sum(pf.qtderecebida) as qtderecebida,pf.p' +
        'roduto'
      #9#9#9'             FROM pedidosfiliais pf'
      #9#9#9'             WHERE (pf.dadofiscal = df.numero)'
      '                   and pf.situacao='#39'F'#39
      #9#9#9'             group by pf.produto) as pf'
      ''
      #9#9#9'             where pf.produto=pd.produto'
      #9#9#9'              and pf.qtderecebida<>pd.quantidade'
      
        #9#9'            ) =0 )  and exists(select pf.produto from pedidosf' +
        'iliais pf where pf.dadofiscal=df.numero and pf.situacao='#39'F'#39')'
      ''
      '              )'
      ')  as sel'
      ''
      'order by romaneio, dadofiscal'
      '')
    RequestLive = True
    Left = 82
    Top = 30
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente'
        ParamType = ptUnknown
      end>
    object qryromaneiosTransferenciasdadofiscal: TIntegerField
      FieldName = 'dadofiscal'
      DisplayFormat = '0'
    end
    object qryromaneiosTransferenciasfilialemissao: TIntegerField
      FieldName = 'filialemissao'
      Required = True
      DisplayFormat = '0'
    end
    object qryromaneiosTransferenciasdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryromaneiosTransferenciasvalortotal: TFloatField
      FieldName = 'valortotal'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryromaneiosTransferenciasobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 350
    end
    object qryromaneiosTransferenciasserie: TStringField
      FieldName = 'serie'
      Required = True
      Size = 3
    end
    object qryromaneiosTransferenciasnumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryromaneiosTransferenciasnome: TStringField
      DisplayWidth = 40
      FieldName = 'nome'
      Required = True
      Size = 60
    end
    object qryromaneiosTransferenciasselecionar: TBooleanField
      FieldName = 'selecionar'
    end
    object qryromaneiosTransferenciascodigofiscal: TIntegerField
      FieldName = 'codigofiscal'
    end
    object qryromaneiosTransferenciasvendatransferencia: TBooleanField
      FieldName = 'vendatransferencia'
    end
    object qryromaneiosTransferenciaschv_nfe: TStringField
      DisplayWidth = 44
      FieldName = 'chv_nfe'
      EditMask = '99\-9999\-99999999999999\-99\-999\-999999999\-9\-99999999\-9;0;_'
      Size = 44
    end
    object qryromaneiosTransferenciasromaneio: TIntegerField
      FieldName = 'romaneio'
    end
    object qryromaneiosTransferenciasvolumes: TIntegerField
      FieldName = 'volumes'
    end
    object qryromaneiosTransferenciassituacaoromaneioentrada: TStringField
      FieldName = 'situacaoromaneioentrada'
      Size = 50
    end
    object qryromaneiosTransferenciaslidos: TLargeintField
      FieldName = 'lidos'
    end
    object qryromaneiosTransferenciasaler: TLargeintField
      FieldName = 'aler'
    end
    object qryromaneiosTransferenciassit_romaneio_df_entr: TStringField
      FieldName = 'sit_romaneio_df_entr'
      Size = 50
    end
    object qryromaneiosTransferenciastiporomaneio: TStringField
      FieldName = 'tiporomaneio'
      Size = 1
    end
    object qryromaneiosTransferenciasromaneiopassagem: TBooleanField
      FieldName = 'romaneiopassagem'
    end
    object qryromaneiosTransferenciascliente: TIntegerField
      FieldName = 'cliente'
    end
    object qryromaneiosTransferenciassituacao_romaneio: TStringField
      FieldName = 'situacao_romaneio'
    end
    object qryromaneiosTransferenciassomavolumes: TLargeintField
      FieldName = 'somavolumes'
    end
    object qryromaneiosTransferenciastotalsomavolumes: TLargeintField
      FieldName = 'totalsomavolumes'
    end
  end
  object dsrromaneiosTransferencias: TtecDataSource
    DataSet = qryromaneiosTransferencias
    Left = 255
    Top = 30
  end
  object qryProdutosTransferencia: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryProdutosTransferenciaAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'Select pn.numero,'
      '           pn.produto,'
      '           p.codigovisual as produtovisual,'
      '           p.descricao as descricaoproduto,          '
      '           pn.quantidade,'
      '           pn.precovenda,'
      '           p.descricao,'
      
        '           (select gr.descricao from grades gr where gr.codigo =' +
        ' c.grade1) as linha,'
      
        '           (select gr.descricao from grades gr where gr.codigo =' +
        ' c.grade2) as coluna, '
      '           p.valorgrade1,'
      '           p.valorgrade2'
      'From   produtosdadosfiscais pn, produtos p, caracteristicas c'
      'Where (pn.dadofiscal =:dadofiscal) and'
      '           (pn.produto = p.codigo) and'
      '           (p.caracteristica = c.codigo) '
      'Order By pn.numero')
    RequestLive = False
    Left = 82
    Top = 92
    ParamData = <
      item
        DataType = ftInteger
        Name = 'dadofiscal'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryProdutosTransferencianumero: TIntegerField
      FieldName = 'numero'
    end
    object qryProdutosTransferenciaproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryProdutosTransferenciaprodutovisual: TStringField
      FieldName = 'produtovisual'
      Size = 30
    end
    object qryProdutosTransferenciaquantidade: TFloatField
      FieldName = 'quantidade'
      DisplayFormat = '0.00'
    end
    object qryProdutosTransferenciadescricao: TStringField
      DisplayWidth = 50
      FieldName = 'descricao'
      Size = 100
    end
    object qryProdutosTransferenciaprecovenda: TFloatField
      FieldName = 'precovenda'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryProdutosTransferencialinha: TStringField
      FieldName = 'linha'
      Size = 40
    end
    object qryProdutosTransferenciacoluna: TStringField
      FieldName = 'coluna'
      Size = 40
    end
    object qryProdutosTransferenciavalorgrade1: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade1'
      Size = 50
    end
    object qryProdutosTransferenciavalorgrade2: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade2'
      Size = 50
    end
    object qryProdutosTransferenciadescricaoproduto: TStringField
      FieldName = 'descricaoproduto'
      Size = 100
    end
  end
  object dsrProdutosNotas: TtecDataSource
    DataSet = qryProdutosTransferencia
    Left = 255
    Top = 91
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
      'Select n.*,'
      '        (select sum(round(pn.quantidade * pn.precounitario,2))'
      '                from produtosnotaspag pn'
      
        '                where pn.codigonota = n.codigo) - coalesce(n.des' +
        'conto,0) + coalesce(n.acrescimo,0) as totalprodutos,'
      '       0.00 as valorvista,'
      
        '      (select sum(pnp.vCredICMSSN) from produtosnotaspag pnp whe' +
        're pnp.codigonota = n.codigo) as vCredICMSSN,'
      
        '      (select sum(pnp.vICMSSTRet) from produtosnotaspag pnp wher' +
        'e pnp.codigonota = n.codigo) as vICMSSTRet,'
      
        '      (select sum(pnp.vbcstret) from produtosnotaspag pnp where ' +
        'pnp.codigonota = n.codigo) as vbcstret'
      ''
      ''
      'From   notaspag n'
      'Where  n.codigo = 0')
    RequestLive = True
    Left = 427
    Top = 30
    object qryNotasPagcodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryNotasPagfornecedor: TIntegerField
      FieldName = 'fornecedor'
      DisplayFormat = '0'
    end
    object qryNotasPagserie: TStringField
      FieldName = 'serie'
      Size = 3
    end
    object qryNotasPagnumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryNotasPagtipofornecedor: TStringField
      FieldName = 'tipofornecedor'
      Size = 1
    end
    object qryNotasPagfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryNotasPagcodigofiscal: TIntegerField
      FieldName = 'codigofiscal'
      DisplayFormat = '0'
    end
    object qryNotasPagcodigonatureza: TIntegerField
      FieldName = 'codigonatureza'
      DisplayFormat = '0'
    end
    object qryNotasPagsituacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
    object qryNotasPagnatureza: TStringField
      FieldName = 'natureza'
      Size = 80
    end
    object qryNotasPagdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object qryNotasPagemissao: TDateField
      Alignment = taCenter
      FieldName = 'emissao'
      EditMask = '99/99/9999;1; '
    end
    object qryNotasPagestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object qryNotasPagvalornota: TFloatField
      FieldName = 'valornota'
      DisplayFormat = '0.00'
    end
    object qryNotasPagcontrato: TStringField
      FieldName = 'contrato'
    end
    object qryNotasPagfreteexterno: TFloatField
      FieldName = 'freteexterno'
      DisplayFormat = '0.00'
    end
    object qryNotasPagfreteinterno: TFloatField
      FieldName = 'freteinterno'
      DisplayFormat = '0.00'
    end
    object qryNotasPagdesconto: TFloatField
      FieldName = 'desconto'
      DisplayFormat = '0.00'
    end
    object qryNotasPagacrescimo: TFloatField
      FieldName = 'acrescimo'
      DisplayFormat = '0.00'
    end
    object qryNotasPagseguro: TFloatField
      FieldName = 'seguro'
      DisplayFormat = '0.00'
    end
    object qryNotasPagdespesasacessorias: TFloatField
      FieldName = 'despesasacessorias'
      DisplayFormat = '0.00'
    end
    object qryNotasPagbaseicmssubstituicao: TFloatField
      FieldName = 'baseicmssubstituicao'
      DisplayFormat = '0.00'
    end
    object qryNotasPagvaloricmssubstituicao: TFloatField
      FieldName = 'valoricmssubstituicao'
      DisplayFormat = '0.00'
    end
    object qryNotasPagvaloripi: TFloatField
      FieldName = 'valoripi'
      DisplayFormat = '0.00'
    end
    object qryNotasPagvalorservicos: TFloatField
      FieldName = 'valorservicos'
      DisplayFormat = '0.00'
    end
    object qryNotasPagdocumentopag: TIntegerField
      FieldName = 'documentopag'
      DisplayFormat = '0'
    end
    object qryNotasPagcnpj: TStringField
      FieldName = 'cnpj'
      Size = 14
    end
    object qryNotasPaginscricaoestadual: TStringField
      FieldName = 'inscricaoestadual'
    end
    object qryNotasPagobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 350
    end
    object qryNotasPagfrete: TStringField
      FieldName = 'frete'
      Size = 1
    end
    object qryNotasPagclientecontribicms: TBooleanField
      FieldName = 'clientecontribicms'
    end
    object qryNotasPagtotalvalorpis: TFloatField
      FieldName = 'totalvalorpis'
      DisplayFormat = '0.00'
    end
    object qryNotasPagtotalvalorcofins: TFloatField
      FieldName = 'totalvalorcofins'
      DisplayFormat = '0.00'
    end
    object qryNotasPagchv_nfe: TStringField
      FieldName = 'chv_nfe'
      Size = 44
    end
    object qryNotasPagvalorpis: TFloatField
      FieldName = 'valorpis'
      DisplayFormat = '0.00'
    end
    object qryNotasPagvalorcofins: TFloatField
      FieldName = 'valorcofins'
      DisplayFormat = '0.00'
    end
    object qryNotasPagbaseicmscalculada: TFloatField
      FieldName = 'baseicmscalculada'
      DisplayFormat = '0.00'
    end
    object qryNotasPagvaloricmscalculada: TFloatField
      FieldName = 'valoricmscalculada'
      DisplayFormat = '0.00'
    end
    object qryNotasPagbaseicmssubstituicaocalculada: TFloatField
      FieldName = 'baseicmssubstituicaocalculada'
      DisplayFormat = '0.00'
    end
    object qryNotasPagvaloricmssubstituicaocalculada: TFloatField
      FieldName = 'valoricmssubstituicaocalculada'
      DisplayFormat = '0.00'
    end
    object qryNotasPagvaloripicalculada: TFloatField
      FieldName = 'valoripicalculada'
      DisplayFormat = '0.00'
    end
    object qryNotasPagvalornotacalculada: TFloatField
      FieldName = 'valornotacalculada'
      DisplayFormat = '0.00'
    end
    object qryNotasPagvalorprodutos: TFloatField
      FieldName = 'valorprodutos'
      DisplayFormat = '0.00'
    end
    object qryNotasPagvbcstretdesp: TFloatField
      FieldName = 'vbcstretdesp'
      DisplayFormat = '0.00'
    end
    object qryNotasPagvicmsstretdesp: TFloatField
      FieldName = 'vicmsstretdesp'
      DisplayFormat = '0.00'
    end
    object qryNotasPagicmsbasecalculo_dev: TFloatField
      FieldName = 'icmsbasecalculo_dev'
      DisplayFormat = '0.00'
    end
    object qryNotasPagicmsvalor_dev: TFloatField
      FieldName = 'icmsvalor_dev'
      DisplayFormat = '0.00'
    end
    object qryNotasPagnaoutilizarobsautomaticas: TBooleanField
      FieldName = 'naoutilizarobsautomaticas'
    end
    object qryNotasPagbaseicmsstretantcalculada: TFloatField
      FieldName = 'baseicmsstretantcalculada'
      DisplayFormat = '0.00'
    end
    object qryNotasPagvaloricmsstretantcalculada: TFloatField
      FieldName = 'valoricmsstretantcalculada'
      DisplayFormat = '0.00'
    end
    object qryNotasPagmodelodocto: TStringField
      FieldName = 'modelodocto'
      Size = 2
    end
    object qryNotasPagbaseicms: TFloatField
      FieldName = 'baseicms'
      DisplayFormat = '0.00'
    end
    object qryNotasPagvaloricms: TFloatField
      FieldName = 'valoricms'
      DisplayFormat = '0.00'
    end
    object qryNotasPagtotalprodutos: TFloatField
      FieldName = 'totalprodutos'
      DisplayFormat = '0.00'
    end
    object qryNotasPagvalorvista: TFloatField
      FieldName = 'valorvista'
      DisplayFormat = '0.00'
    end
    object qryNotasPagvcredicmssn: TFloatField
      FieldName = 'vcredicmssn'
      DisplayFormat = '0.00'
    end
    object qryNotasPagvicmsstret: TFloatField
      FieldName = 'vicmsstret'
      DisplayFormat = '0.00'
    end
    object qryNotasPagvbcstret: TFloatField
      FieldName = 'vbcstret'
      DisplayFormat = '0.00'
    end
    object qryNotasPaginfcomplementar: TStringField
      FieldName = 'infcomplementar'
      Size = 512
    end
    object qryNotasPagcrt: TIntegerField
      FieldName = 'crt'
      DisplayFormat = '0'
    end
    object qryNotasPagvendatransferencia: TBooleanField
      FieldName = 'vendatransferencia'
    end
    object qryNotasPagdadofiscalreferenciado: TIntegerField
      FieldName = 'dadofiscalreferenciado'
    end
    object qryNotasPagvfcp: TFloatField
      FieldName = 'vfcp'
    end
    object qryNotasPagvfcpst: TFloatField
      FieldName = 'vfcpst'
    end
    object qryNotasPagvfcpstret: TFloatField
      FieldName = 'vfcpstret'
    end
  end
  object qryProdutosNotasPag: TtecQuery
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
      'Select pnp.*,'
      
        '       p.codigovisual,CASE WHEN f.tipofilial='#39'V'#39' THEN COALESCE(f' +
        '.filial_estoque,f.codigo) ELSE f.codigo END as filial_estoque,'
      '       false as composto ,'
      '      cast(null as date) as validade,'
      ' cast (null as date) as fabricacao,'
      ' cast (null as varchar(20) ) as nrlote'
      ''
      'From   produtosnotaspag pnp, produtos p,filiais f'
      'Where pnp.produto = p.codigo and pnp.filial=f.codigo'
      '  and pnp.codigonota = 0')
    RequestLive = True
    Left = 427
    Top = 91
  end
  object spcNotasPagProximo: TtecQuery
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
      'Select notaspag_proximocodigo() as codigo')
    RequestLive = False
    Left = 429
    Top = 233
    object spcNotasPagProximocodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object qryEstoqueBloqueio: TtecQuery
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
      'Select     e.produto,'
      
        '           CASE WHEN f.tipofilial='#39'V'#39' THEN COALESCE(f.filial_est' +
        'oque,f.codigo) ELSE f.codigo END AS filial,'
      '           e.emestoque,'
      '           e.futuro'
      'From   estoques e,filiais f'
      'Where'
      '/*Preenchido em runtime. n'#227'o apague*/ False'
      'and f.codigo=e.filial'
      'for update')
    RequestLive = True
    Left = 618
    Top = 30
    object qryEstoqueBloqueioproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryEstoqueBloqueiofilial: TIntegerField
      FieldName = 'filial'
    end
    object qryEstoqueBloqueioemestoque: TFloatField
      FieldName = 'emestoque'
    end
    object qryEstoqueBloqueiofuturo: TFloatField
      FieldName = 'futuro'
      Required = True
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
      'select m.numero,'
      '       m.produto,'
      '       m.filial,'
      '       m.data,'
      '       m.tipomovimento,'
      '       m.quantidade,'
      '       m.referencia,'
      '       m.operacao,'
      '       m.emestoque,'
      '       m.reservado,'
      '       m.transito,'
      '       m.demonstracao,'
      '       m.conserto,'
      '       m.futuro,'
      '       m.danificada,'
      '       m.financeiro,'
      '       m.valor,'
      '       m.trfproduto,'
      '       m.trffilial,'
      '       m.codigonota,'
      '       m.cliente,'
      '       m.tipocliente,'
      '       m.numerocontrole'
      'from movimentos m'
      'where m.numero = 0'
      '')
    RequestLive = True
    Left = 618
    Top = 91
    object qryMovimentosnumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryMovimentosproduto: TLargeintField
      FieldName = 'produto'
      DisplayFormat = '0'
    end
    object qryMovimentosfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryMovimentostipomovimento: TStringField
      FieldName = 'tipomovimento'
      Size = 3
    end
    object qryMovimentosquantidade: TFloatField
      FieldName = 'quantidade'
      DisplayFormat = '0'
    end
    object qryMovimentosreferencia: TStringField
      FieldName = 'referencia'
      Size = 60
    end
    object qryMovimentosoperacao: TStringField
      FieldName = 'operacao'
    end
    object qryMovimentosemestoque: TFloatField
      FieldName = 'emestoque'
      Required = True
      DisplayFormat = '0'
    end
    object qryMovimentosreservado: TFloatField
      FieldName = 'reservado'
      Required = True
      DisplayFormat = '0'
    end
    object qryMovimentostransito: TFloatField
      FieldName = 'transito'
      Required = True
      DisplayFormat = '0'
    end
    object qryMovimentosdemonstracao: TFloatField
      FieldName = 'demonstracao'
      Required = True
      DisplayFormat = '0'
    end
    object qryMovimentosconserto: TFloatField
      FieldName = 'conserto'
      Required = True
      DisplayFormat = '0'
    end
    object qryMovimentosfuturo: TFloatField
      FieldName = 'futuro'
      Required = True
      DisplayFormat = '0'
    end
    object qryMovimentosdanificada: TFloatField
      FieldName = 'danificada'
      DisplayFormat = '0'
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
    object qryMovimentosdata: TDateField
      FieldName = 'data'
    end
    object qryMovimentostrfproduto: TLargeintField
      FieldName = 'trfproduto'
    end
    object qryMovimentostrffilial: TIntegerField
      FieldName = 'trffilial'
    end
    object qryMovimentoscodigonota: TIntegerField
      FieldName = 'codigonota'
    end
    object qryMovimentoscliente: TIntegerField
      FieldName = 'cliente'
    end
    object qryMovimentostipocliente: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
    object qryMovimentosnumerocontrole: TIntegerField
      FieldName = 'numerocontrole'
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
    Left = 618
    Top = 155
    object spcMovimentosProximonumero: TIntegerField
      FieldName = 'numero'
    end
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
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'Select d.*, n.filial, n.serie, n.numero as numeronota,'
      
        '       (SELECT estado FROM filiais WHERE codigo=d.filialvenda) a' +
        's estadofilial'
      '      '
      ''
      'From   dadosfiscais d, notas n'
      'Where (d.numero = n.dadofiscal) and'
      '           (d.numero =:dadofiscal)')
    RequestLive = True
    Left = 82
    Top = 156
    ParamData = <
      item
        DataType = ftInteger
        Name = 'dadofiscal'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryDadosFiscaisnumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object qryDadosFiscaisvalortotal: TFloatField
      FieldName = 'valortotal'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaiscodigofiscal: TIntegerField
      FieldName = 'codigofiscal'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisestadocfo: TStringField
      FieldName = 'estadocfo'
      Size = 2
    end
    object qryDadosFiscaisnatureza: TStringField
      FieldName = 'natureza'
      Size = 40
    end
    object qryDadosFiscaiscliente: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object qryDadosFiscaistipocliente: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
    object qryDadosFiscaispessoanumero: TStringField
      FieldName = 'pessoanumero'
      Size = 14
    end
    object qryDadosFiscaisdocumento: TStringField
      FieldName = 'documento'
    end
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
    object qryDadosFiscaisestadofilial: TStringField
      FieldName = 'estadofilial'
      Size = 50
    end
    object qryDadosFiscaiscodigonatureza: TIntegerField
      FieldName = 'codigonatureza'
      DisplayFormat = '0'
    end
    object qryDadosFiscaisbaseicms: TFloatField
      FieldName = 'baseicms'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaisvaloricms: TFloatField
      FieldName = 'valoricms'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaismodelodocto: TStringField
      FieldName = 'modelodocto'
      Size = 2
    end
    object qryDadosFiscaistotalbaseicmssubstituicao: TFloatField
      FieldName = 'totalbaseicmssubstituicao'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaistotalvaloricmssubstituicao: TFloatField
      FieldName = 'totalvaloricmssubstituicao'
      DisplayFormat = '0.00'
    end
    object qryDadosFiscaischv_nfe: TStringField
      FieldName = 'chv_nfe'
      Size = 44
    end
    object qryDadosFiscaisvendatransferencia: TBooleanField
      FieldName = 'vendatransferencia'
    end
    object qryDadosFiscaisregimetributario: TIntegerField
      FieldName = 'regimetributario'
    end
    object qryDadosFiscaisobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 350
    end
    object qryDadosFiscaisvfcp: TFloatField
      FieldName = 'vfcp'
    end
    object qryDadosFiscaisvfcpst: TFloatField
      FieldName = 'vfcpst'
    end
    object qryDadosFiscaisvfcpstret: TFloatField
      FieldName = 'vfcpstret'
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
      'select pd.*'
      'from   produtosdadosfiscais pd'
      'where (pd.dadofiscal =:dadofiscal)')
    RequestLive = True
    Left = 82
    Top = 225
    ParamData = <
      item
        DataType = ftInteger
        Name = 'dadofiscal'
        ParamType = ptUnknown
      end>
    object qryProdutosDadosFiscaisdadofiscal: TIntegerField
      FieldName = 'dadofiscal'
    end
    object qryProdutosDadosFiscaisnumero: TIntegerField
      FieldName = 'numero'
    end
    object qryProdutosDadosFiscaisproduto: TLargeintField
      FieldName = 'produto'
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
      'Select     codigo, '
      '               produto,'
      '               requisitante,'
      '               requisitada,'
      '               situacao,'
      '               qtderecebida'
      'From       pedidosfiliais'
      'Where    (dadofiscal =:dadofiscal)  and '
      '              (situacao = '#39'F'#39')')
    RequestLive = True
    Left = 255
    Top = 156
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dadofiscal'
        ParamType = ptUnknown
      end>
    object qryPedidosFiliaiscodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object qryPedidosFiliaisproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryPedidosFiliaisrequisitante: TIntegerField
      FieldName = 'requisitante'
    end
    object qryPedidosFiliaisrequisitada: TIntegerField
      FieldName = 'requisitada'
    end
    object qryPedidosFiliaissituacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
    object qryPedidosFiliaisqtderecebida: TFloatField
      FieldName = 'qtderecebida'
    end
  end
  object qryFilialOrigem: TtecQuery
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
      'Select cnpj,'
      '           inscricaoestadual, '
      '           contribicms'
      'From   filiais'
      'Where codigo =:origem'
      '           ')
    RequestLive = False
    Left = 619
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'origem'
        ParamType = ptUnknown
      end>
    object qryFilialOrigemcnpj: TStringField
      FieldName = 'cnpj'
      Size = 14
    end
    object qryFilialOrigeminscricaoestadual: TStringField
      FieldName = 'inscricaoestadual'
    end
    object qryFilialOrigemcontribicms: TBooleanField
      FieldName = 'contribicms'
    end
  end
  object qryNaturezasPadrao: TtecQuery
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
      'select np.*,'
      '       n.codigofiscal,'
      '       n.descricao as descricaonatureza,'
      '       n.piscst,'
      '       n.cofinscst,'
      '       n.ipicst,'
      '       n.icmscst'
      
        'from naturezaspadrao np join naturezas n on np.natureza = n.codi' +
        'go'
      'order by np.descricao')
    RequestLive = False
    Left = 528
    Top = 240
    object qryNaturezasPadraodescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
    object qryNaturezasPadraonatureza: TIntegerField
      FieldName = 'natureza'
      DisplayFormat = '0'
    end
    object qryNaturezasPadraocodigofiscal: TIntegerField
      FieldName = 'codigofiscal'
    end
    object qryNaturezasPadraodescricaonatureza: TStringField
      FieldName = 'descricaonatureza'
      Size = 70
    end
    object qryNaturezasPadraopiscst: TStringField
      FieldName = 'piscst'
      Size = 2
    end
    object qryNaturezasPadraocofinscst: TStringField
      FieldName = 'cofinscst'
      Size = 2
    end
    object qryNaturezasPadraoipicst: TStringField
      FieldName = 'ipicst'
      Size = 2
    end
    object qryNaturezasPadraoicmscst: TStringField
      FieldName = 'icmscst'
      Size = 2
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
      'select vdf.*'
      'from   venctosdadosfiscais vdf'
      'where vdf.dadofiscal = :dadofiscal')
    RequestLive = True
    Left = 82
    Top = 281
    ParamData = <
      item
        DataType = ftInteger
        Name = 'dadofiscal'
        ParamType = ptUnknown
      end>
    object qryVenctosDadosFiscaisnumero: TIntegerField
      FieldName = 'numero'
    end
    object qryVenctosDadosFiscaisdatavencto: TDateField
      FieldName = 'datavencto'
    end
    object qryVenctosDadosFiscaisvalorvencto: TFloatField
      FieldName = 'valorvencto'
    end
    object qryVenctosDadosFiscaistiporecebimento: TIntegerField
      FieldName = 'tiporecebimento'
    end
    object qryVenctosDadosFiscaisformapagamento: TStringField
      FieldName = 'formapagamento'
      Size = 1
    end
  end
  object qryDocumentosPag: TtecQuery
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
      'Select dp.*'
      'From   documentospag dp'
      'Where  dp.numero = 0')
    RequestLive = True
    Left = 427
    Top = 158
    object qryDocumentosPagnumero: TIntegerField
      FieldName = 'numero'
    end
    object qryDocumentosPagfornecedor: TIntegerField
      FieldName = 'fornecedor'
    end
    object qryDocumentosPagemissao: TDateField
      FieldName = 'emissao'
    end
    object qryDocumentosPagdatalancto: TDateField
      FieldName = 'datalancto'
    end
    object qryDocumentosPagcomplemento: TStringField
      FieldName = 'complemento'
      Size = 15
    end
    object qryDocumentosPagfilialemissao: TIntegerField
      FieldName = 'filialemissao'
    end
    object qryDocumentosPagpedido: TIntegerField
      FieldName = 'pedido'
    end
    object qryDocumentosPagevento: TIntegerField
      FieldName = 'evento'
    end
    object qryDocumentosPagprevisao: TBooleanField
      FieldName = 'previsao'
    end
    object qryDocumentosPagreferencia: TStringField
      FieldName = 'referencia'
      Size = 100
    end
    object qryDocumentosPagvalor: TFloatField
      FieldName = 'valor'
    end
    object qryDocumentosPagirretido: TFloatField
      FieldName = 'irretido'
    end
    object qryDocumentosPaginssretido: TFloatField
      FieldName = 'inssretido'
    end
    object qryDocumentosPagissretido: TFloatField
      FieldName = 'issretido'
    end
    object qryDocumentosPagcofinsretido: TFloatField
      FieldName = 'cofinsretido'
    end
    object qryDocumentosPagpisretido: TFloatField
      FieldName = 'pisretido'
    end
    object qryDocumentosPagcsllretido: TFloatField
      FieldName = 'csllretido'
    end
    object qryDocumentosPagtipofornecedor: TStringField
      FieldName = 'tipofornecedor'
      Size = 1
    end
    object qryDocumentosPagcreditar: TIntegerField
      FieldName = 'creditar'
    end
    object qryDocumentosPaghistorico: TIntegerField
      FieldName = 'historico'
    end
    object qryDocumentosPagdocumentopagorigem: TIntegerField
      FieldName = 'documentopagorigem'
    end
    object qryDocumentosPagdatavenctoorigem: TDateField
      FieldName = 'datavenctoorigem'
    end
    object qryDocumentosPagnumeroorigem: TIntegerField
      FieldName = 'numeroorigem'
    end
    object qryDocumentosPagadministrador: TBooleanField
      FieldName = 'administrador'
    end
    object qryDocumentosPagfornecedorparaiss: TIntegerField
      FieldName = 'fornecedorparaiss'
    end
    object qryDocumentosPagfatogerador: TStringField
      FieldName = 'fatogerador'
      Size = 30
    end
    object qryDocumentosPagpiscofinscsllretido: TFloatField
      FieldName = 'piscofinscsllretido'
    end
    object qryDocumentosPagadiantamento: TBooleanField
      FieldName = 'adiantamento'
    end
    object qryDocumentosPagdebitar: TIntegerField
      FieldName = 'debitar'
    end
    object qryDocumentosPagtipopagamento: TIntegerField
      FieldName = 'tipopagamento'
    end
    object qryDocumentosPagcontapagto: TIntegerField
      FieldName = 'contapagto'
    end
    object qryDocumentosPagchequepagto: TIntegerField
      FieldName = 'chequepagto'
    end
    object qryDocumentosPagsequencia: TIntegerField
      FieldName = 'sequencia'
    end
    object qryDocumentosPagfilialcontabil: TIntegerField
      FieldName = 'filialcontabil'
    end
    object qryDocumentosPagpiscst: TStringField
      FieldName = 'piscst'
      Size = 2
    end
    object qryDocumentosPagpisbasecalculo: TFloatField
      FieldName = 'pisbasecalculo'
    end
    object qryDocumentosPagpisaliquota: TFloatField
      FieldName = 'pisaliquota'
    end
    object qryDocumentosPagpisvalor: TFloatField
      FieldName = 'pisvalor'
    end
    object qryDocumentosPagcofinscst: TStringField
      FieldName = 'cofinscst'
      Size = 2
    end
    object qryDocumentosPagcofinsbasecalculo: TFloatField
      FieldName = 'cofinsbasecalculo'
    end
    object qryDocumentosPagcofinsaliquota: TFloatField
      FieldName = 'cofinsaliquota'
    end
    object qryDocumentosPagcofinsvalor: TFloatField
      FieldName = 'cofinsvalor'
    end
    object qryDocumentosPagnat_bc_cred: TStringField
      FieldName = 'nat_bc_cred'
      Size = 2
    end
    object qryDocumentosPagregimedecaixa: TBooleanField
      FieldName = 'regimedecaixa'
    end
  end
  object qryDuplicatas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 'numero=documentopag'
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select d.*'
      'FROM duplicatas d'
      'WHERE false')
    RequestLive = True
    Left = 464
    Top = 176
    object qryDuplicatasdocumentopag: TIntegerField
      FieldName = 'documentopag'
      Required = True
    end
    object qryDuplicatasnumero: TIntegerField
      FieldName = 'numero'
      Required = True
    end
    object qryDuplicatasdatavencto: TDateField
      FieldName = 'datavencto'
      Required = True
    end
    object qryDuplicatasvalorvencto: TFloatField
      FieldName = 'valorvencto'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryDuplicatasvalordesconto: TFloatField
      FieldName = 'valordesconto'
      DisplayFormat = '###,###,##0.00'
    end
    object qryDuplicatasjuros: TFloatField
      FieldName = 'juros'
      DisplayFormat = '###,###,##0.00'
    end
    object qryDuplicatastipojuros: TStringField
      FieldName = 'tipojuros'
      Required = True
      Size = 1
    end
    object qryDuplicatasmulta: TFloatField
      FieldName = 'multa'
      DisplayFormat = '###,###,##0.00'
    end
    object qryDuplicatastipomulta: TStringField
      FieldName = 'tipomulta'
      Required = True
      Size = 1
    end
    object qryDuplicatasobservacao: TStringField
      FieldName = 'observacao'
      Size = 512
    end
    object qryDuplicatasdatapagto: TDateField
      FieldName = 'datapagto'
    end
    object qryDuplicatasvalorpagto: TFloatField
      FieldName = 'valorpagto'
      DisplayFormat = '###,###,##0.00'
    end
    object qryDuplicataschequepagto: TIntegerField
      FieldName = 'chequepagto'
    end
    object qryDuplicatasbancocobranca: TIntegerField
      FieldName = 'bancocobranca'
    end
    object qryDuplicatascontacredito: TIntegerField
      FieldName = 'contacredito'
    end
    object qryDuplicatasautorizado: TBooleanField
      FieldName = 'autorizado'
      Required = True
    end
    object qryDuplicatasfilialpagto: TIntegerField
      FieldName = 'filialpagto'
    end
    object qryDuplicatasusuario: TIntegerField
      FieldName = 'usuario'
    end
    object qryDuplicatastipopagamento: TIntegerField
      FieldName = 'tipopagamento'
    end
    object qryDuplicatascontapagto: TIntegerField
      FieldName = 'contapagto'
    end
    object qryDuplicatassequencia: TIntegerField
      FieldName = 'sequencia'
    end
    object qryDuplicatasevento: TIntegerField
      FieldName = 'evento'
    end
    object qryDuplicatasdataautorizacaopagto: TDateField
      FieldName = 'dataautorizacaopagto'
    end
    object qryDuplicatasnrlotecontabil: TLargeintField
      FieldName = 'nrlotecontabil'
    end
    object qryDuplicatassequenciaevento: TIntegerField
      FieldName = 'sequenciaevento'
    end
  end
  object spcDocumentosPagProximo: TtecQuery
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
      'Select documentospag_proximonumero() as codigo')
    RequestLive = False
    Left = 494
    Top = 142
    object spcDocumentosPagProximocodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object qryRomaneios: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryromaneiosTransferenciasAfterOpen
    AfterScroll = qryromaneiosTransferenciasAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    MacroChar = '$'
    Macros = <>
    Sql.Strings = (
      'Select r.numero,'
      '       r.situacao_romaneio'
      'From  romaneios r'
      'where r.numero in (%ListaRomaneios)')
    RequestLive = True
    Left = 250
    Top = 222
    object IntegerField1: TIntegerField
      FieldName = 'dadofiscal'
      DisplayFormat = '0'
    end
    object IntegerField2: TIntegerField
      FieldName = 'filialemissao'
      Required = True
      DisplayFormat = '0'
    end
    object DateField1: TDateField
      Alignment = taCenter
      FieldName = 'data'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object FloatField1: TFloatField
      FieldName = 'valortotal'
      Required = True
      DisplayFormat = '0.00'
    end
    object StringField1: TStringField
      FieldName = 'observacoes'
      Size = 350
    end
    object StringField2: TStringField
      FieldName = 'serie'
      Required = True
      Size = 3
    end
    object IntegerField3: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object StringField3: TStringField
      DisplayWidth = 40
      FieldName = 'nome'
      Required = True
      Size = 60
    end
    object BooleanField1: TBooleanField
      FieldName = 'selecionar'
    end
    object IntegerField4: TIntegerField
      FieldName = 'codigofiscal'
    end
    object BooleanField2: TBooleanField
      FieldName = 'vendatransferencia'
    end
    object StringField4: TStringField
      DisplayWidth = 44
      FieldName = 'chv_nfe'
      EditMask = '99\-9999\-99999999999999\-99\-999\-999999999\-9\-99999999\-9;0;_'
      Size = 44
    end
    object IntegerField5: TIntegerField
      FieldName = 'romaneio'
    end
    object IntegerField6: TIntegerField
      FieldName = 'volumes'
    end
    object StringField5: TStringField
      FieldName = 'situacaoromaneioentrada'
      Size = 50
    end
    object LargeintField1: TLargeintField
      FieldName = 'lidos'
    end
    object LargeintField2: TLargeintField
      FieldName = 'aler'
    end
    object StringField6: TStringField
      FieldName = 'sit_romaneio_df_entr'
      Size = 50
    end
  end
  object qryAtualizarSituacaoRomaneio: TtecQuery
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
      'select Atualizar_situacao_romaneio(:romaneio)')
    RequestLive = True
    Left = 248
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'romaneio'
        ParamType = ptUnknown
      end>
  end
  object qryromaneiosPassagem: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    MacroChar = '$'
    Macros = <
      item
        DataType = ftString
        Name = 'SQL'
        ParamType = ptUnknown
        Value = 'false'
      end>
    Sql.Strings = (
      ';select sel.*,'
      
        '       case when situacaoromaneioentrada = '#39'CONFIRMADA'#39' then tru' +
        'e else false end as selecionar'
      'from'
      '('
      'Select   rn.romaneio,'
      ''
      '         (select vodf.volumes'
      '          from volumesdadosfiscais vodf'
      '          where vodf.dadofiscal = df.numero'
      '          order by vodf.codigo limit 1) as volumes,'
      ''
      '         (select count(*)'
      '          from volumesdadosfiscaisconferencia vdfc'
      '          where vdfc.tipo = '#39'ROE'#39
      '            and vdfc.codigo = cast(r.numero as varchar)'
      '            and vdfc.dadofiscal = df.numero'
      '            and coalesce(vdfc.conferido,false)'
      '          ) as Lidos,'
      ''
      '         (select sum(coalesce(vodf.volumes,1))'
      '          from volumesdadosfiscais vodf'
      '          where vodf.dadofiscal in ( select rn2.dadofiscal'
      '                                     from romaneiosnotas rn2'
      
        '                                     where rn2.romaneio = r.nume' +
        'ro)) as aLer,'
      ''
      
        '          situacao_romaneio_entrada(r.numero) as situacaoromanei' +
        'oentrada,'
      
        '          situacao_romaneio_entrada(r.numero, rn.dadofiscal) as ' +
        'sit_romaneio_df_entr,'
      ''
      '         df.numero as dadofiscal,'
      '         df.filialemissao,'
      '         df.data,'
      '         df.valortotal,'
      '         df.observacoes,'
      '         n.serie,'
      '         n.numero,'
      '         df.chv_nfe,'
      '         f.nome,'
      '         df.codigofiscal,'
      '         df.vendatransferencia,'
      '         r.tipo as tiporomaneio,'
      '         (df.cliente <> :cliente) as RomaneioPassagem,'
      '         df.cliente,'
      '         r.situacao_romaneio'
      ''
      'From     (romaneios r'
      '         join (romaneiosnotas rn'
      '               join ((dadosfiscais df'
      '                      join notas n'
      '                      on df.numero = n.dadofiscal)'
      ''
      '                     join filiais f'
      '                     on df.filialemissao = f.codigo)'
      ''
      '               on rn.dadofiscal = df.numero)'
      '         on r.numero = rn.romaneio)'
      ''
      
        'Where        /* ATEN'#199#195'O FALTA ALTERAR  N'#195'O PERMITIR SELECIONAR N' +
        'OTAS QUE J'#193' CASARAM SAIDA (DADOFISCAL) COM ENTRADA (NOTASPAG)*/'
      '            $SQL'
      '            /*(df.cliente = :cliente)             and*/'
      '            (df.tipocliente = '#39'L'#39')              and'
      
        '            ((df.codigofiscal % 1000) in (150,151,152,155,156,40' +
        '8,409,552,557)  or df.vendatransferencia or eHNotaFiscalSaidaDev' +
        'olucao(df.codigofiscal) ) and'
      '            (df.situacao = '#39'N'#39') and'
      
        '            ((r.situacao_romaneio = '#39'EM TR'#194'NSITO'#39')  or /* (r.tip' +
        'o = '#39'T'#39') and */'
      '             (r.situacao_romaneio = '#39'PASSAGEM'#39')  or'
      '             (r.situacao_romaneio = '#39'ENTREGUE PARCIAL'#39'))  AND'
      ''
      
        '            not exists (select np.numero from notaspag np where ' +
        'np.dadofiscalreferenciado = df.numero and coalesce(np.vendatrans' +
        'ferencia,false)) and'
      ''
      ''
      '            ('
      ''
      '                (('#9'select count(*)'
      #9#9#9'            from'
      ''
      
        #9#9#9'            (SELECT sum(pd.quantidade) as quantidade,pd.produ' +
        'to'
      #9#9#9'             FROM produtosdadosfiscais pd'
      #9#9#9'             WHERE (pd.dadofiscal = df.numero)'
      #9#9#9'             group by pd.produto) as pd,'
      ''
      
        #9#9#9'            (SELECT sum(pf.qtderecebida) as qtderecebida,pf.p' +
        'roduto'
      #9#9#9'             FROM pedidosfiliais pf'
      #9#9#9'             WHERE (pf.dadofiscal = df.numero)'
      '                   and pf.situacao='#39'F'#39
      #9#9#9'             group by pf.produto) as pf'
      ''
      #9#9#9'             where pf.produto=pd.produto'
      #9#9#9'              and pf.qtderecebida<>pd.quantidade'
      
        #9#9'            ) =0 )  and exists(select pf.produto from pedidosf' +
        'iliais pf where pf.dadofiscal=df.numero and pf.situacao='#39'F'#39')'
      ''
      '              )'
      ')  as sel'
      ''
      '/* where  situacaoromaneioentrada <> '#39'CONFIRMADA'#39' */'
      ''
      'order by romaneio, dadofiscal'
      '')
    RequestLive = True
    Left = 434
    Top = 310
    ParamData = <
      item
        DataType = ftString
        Name = 'cliente'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryromaneiosPassagemdadofiscal: TIntegerField
      FieldName = 'dadofiscal'
    end
    object qryromaneiosPassagemfilialemissao: TIntegerField
      FieldName = 'filialemissao'
    end
    object qryromaneiosPassagemdata: TDateField
      FieldName = 'data'
    end
    object qryromaneiosPassagemvalortotal: TFloatField
      FieldName = 'valortotal'
    end
    object qryromaneiosPassagemobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 350
    end
    object qryromaneiosPassagemserie: TStringField
      FieldName = 'serie'
      Size = 3
    end
    object qryromaneiosPassagemnumero: TIntegerField
      FieldName = 'numero'
    end
    object qryromaneiosPassagemnome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object qryromaneiosPassagemselecionar: TBooleanField
      FieldName = 'selecionar'
    end
    object qryromaneiosPassagemcodigofiscal: TIntegerField
      FieldName = 'codigofiscal'
    end
    object qryromaneiosPassagemvendatransferencia: TBooleanField
      FieldName = 'vendatransferencia'
    end
    object qryromaneiosPassagemchv_nfe: TStringField
      FieldName = 'chv_nfe'
      Size = 44
    end
    object qryromaneiosPassagemromaneio: TIntegerField
      FieldName = 'romaneio'
    end
    object qryromaneiosPassagemvolumes: TIntegerField
      FieldName = 'volumes'
    end
    object qryromaneiosPassagemsituacaoromaneioentrada: TStringField
      FieldName = 'situacaoromaneioentrada'
      Size = 50
    end
    object qryromaneiosPassagemlidos: TLargeintField
      FieldName = 'lidos'
    end
    object qryromaneiosPassagemaler: TLargeintField
      FieldName = 'aler'
    end
    object qryromaneiosPassagemsit_romaneio_df_entr: TStringField
      FieldName = 'sit_romaneio_df_entr'
      Size = 50
    end
    object qryromaneiosPassagemtiporomaneio: TStringField
      FieldName = 'tiporomaneio'
      Size = 1
    end
    object qryromaneiosPassagemromaneiopassagem: TBooleanField
      FieldName = 'romaneiopassagem'
    end
    object qryromaneiosPassagemcliente: TIntegerField
      FieldName = 'cliente'
    end
    object qryromaneiosPassagemsituacao_romaneio: TStringField
      FieldName = 'situacao_romaneio'
    end
  end
end
