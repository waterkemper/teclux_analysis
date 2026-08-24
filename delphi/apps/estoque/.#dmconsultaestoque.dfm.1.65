inherited dtmConsultaEstoque: TdtmConsultaEstoque
  Left = 209
  Top = 224
  Height = 727
  Width = 1132
  object qryConsultaFilial: TtecQuery
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
      'SELECT codigo, nome'
      'FROM filiais'
      'ORDER BY UPPER(TO_ASCII(nome,'#39'latin1'#39'))')
    RequestLive = False
    Left = 301
    Top = 9
    object qryConsultaFilialnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaFilialcodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
  object qryProcuraFilial: TtecQuery
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
      'Select f.codigo,  '
      '           f.nome'
      'From   filiais f'
      'Where f.codigo =:codigo'
      '')
    RequestLive = False
    Left = 61
    Top = 17
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraFilialnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryProcuraFilialcodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object dsrProcuraFilial: TtecDataSource
    DataSet = qryProcuraFilial
    Left = 162
    Top = 17
  end
  object qryConsultaEstoques: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeOpen = qryConsultaEstoquesBeforeOpen
    AfterOpen = qryConsultaEstoquesAfterOpen
    AfterClose = qryConsultaEstoquesAfterScroll
    AfterPost = qryConsultaEstoquesAfterPost
    AfterCancel = BeforeDelete
    AfterScroll = qryConsultaEstoquesAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Classe'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Marcas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Modelos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Especificacoes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Grupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Item'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'produtos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Promocoes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LocalizacaoEstoque'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LotesProdutos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Atributos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'estoque'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ''
      '/* qryConsultaEstoques */'
      ''
      
        'insert into estoques_estatistica(produto, datahora, filialbase, ' +
        'usuario_logado)'
      ''
      '('
      '      Select distinct e.produto,'
      
        '/*             string_agg(cast(e.filial as varchar),'#39','#39') as fili' +
        'ais,*/'
      
        '             cast(:datahora as timestamp) as datahora, :filialba' +
        'se as filialbase, :usuario_logado as usuario_logado'
      ''
      
        '      From   estoques e ,filiais f, (produtos p left join promoc' +
        'oes pro on p.promocao = pro.codigo),'
      
        '             caracteristicas c, ipi i, grupos g, classes cl, mar' +
        'cas m'
      ''
      '      Where  (e.produto = p.codigo) and'
      '             (e.filial = f.codigo) and'
      '             (p.caracteristica = c.codigo) and'
      '             (i.codigo = c.ipi) and'
      '             (c.grupo = g.codigo) and'
      '             (c.classe = cl.codigo) and'
      '             (c.marca = m.codigo)'
      ''
      ''
      '      %Filial'
      '      %Classe'
      '      %Marcas'
      ''
      '      /* Modelos */'
      ''
      '      %Modelos'
      '      %Especificacoes'
      '      %Grupo'
      '      %Item'
      '      %Produto'
      '      %produtos'
      '      %Promocoes'
      '      %LocalizacaoEstoque'
      '      %LotesProdutos'
      '      %Atributos'
      '      %estoque'
      ''
      '/*      group by e.produto */'
      ');'
      ''
      ''
      ''
      '  ;'
      '  select *,'
      
        '         (select f.nome from fornecedores f where f.codigo = (se' +
        'lect np.fornecedor from notaspag np where np.codigo = codigonota' +
        'entrada)) as nomefornecedor,'
      
        '         (select pnp.incidencia from produtosnotaspag pnp where ' +
        'pnp.codigonota = codigonotaentrada and pnp.produto = temp.produt' +
        'o limit 1) as cst_nfentrada,'
      
        '         (select pnp.csosn from produtosnotaspag pnp where pnp.c' +
        'odigonota = codigonotaentrada and pnp.produto = temp.produto lim' +
        'it 1) as csosn_nfentrada,'
      
        '         (select pnp.cst_nf from produtosnotaspag pnp where pnp.' +
        'codigonota = codigonotaentrada and pnp.produto = temp.produto li' +
        'mit 1) as cst_nf,'
      
        '         (select pnp.csosn_nf from produtosnotaspag pnp where pn' +
        'p.codigonota = codigonotaentrada and pnp.produto = temp.produto ' +
        'limit 1) as csosn_nf,'
      
        '         case when (select f.nosimples from fornecedores f where' +
        ' f.codigo = (select np.fornecedor from notaspag np where np.codi' +
        'go = codigonotaentrada)) = null then False'
      
        '              else (select f.nosimples from fornecedores f where' +
        ' f.codigo = (select np.fornecedor from notaspag np where np.codi' +
        'go = codigonotaentrada)) end  as fornecedornosimples,'
      '         cast(null as varchar(20)) as nrlote,'
      '         cast(null as date) as validade     '
      '  from'
      ''
      '  ('
      '      Select e.produto,'
      '              p.codigovisual as produtovisual,'
      '              e.filial,'
      '              f.nome as nomefilial,'
      '              e.localizacao,'
      '              e.minimo,'
      '              e.maximo,'
      '              e.precosemicms,'
      '              e.precocomicms,'
      
        '              CASE WHEN c.csosn in ('#39'101'#39','#39'102'#39') THEN e.valorult' +
        'imacompra + (e.precocomicms-e.precosemicms) ELSE e.valorultimaco' +
        'mpra END as ultimacompra_com_icms,'
      '              e.financeiro,'
      
        '              case when (e.emestoque+e.reservado+e.reservaprevia' +
        '+e.transito+e.demonstracao+e.conserto+e.danificada) = 0  then 0'
      
        '                   else round(e.financeiro / (e.emestoque+e.rese' +
        'rvado+e.reservaprevia+e.transito+e.demonstracao+e.conserto+e.dan' +
        'ificada), 2)'
      '              end as customedio,'
      '              e.aliquotaipi,'
      '              e.datacompra,'
      '              e.qtdecompra,'
      '              e.ultimaentrada,'
      '              e.ultimavenda,'
      ''
      '              e.emestoque,'
      '              e.reservado,'
      '              e.reservaprevia,'
      '              e.demonstracao,'
      '              e.transito,'
      '              e.conserto,'
      '              e.danificada,'
      '              e.futuro,'
      '              (select max(np.codigo)'
      '               from notaspag np'
      '               where np.codigo in (select pn.codigonota'
      '                                   from produtosnotaspag pn'
      '                                   where pn.produto  = e.produto'
      
        '                                    and ehnotafiscalentradacompr' +
        'a(codigofiscal)) and np.tipofornecedor <> '#39'L'#39') as codigonotaentr' +
        'ada, '
      
        '              (select estoques_produtoempromocao(e.produto,e.fil' +
        'ial)) as produtoempromocao,'
      
        '              (select estoques_produtoinativo(e.produto)) as pro' +
        'dutoinativo,'
      
        '              (select estoques_produtoforalinha(e.produto)) as p' +
        'rodutoforalinha,'
      
        '              (e.emestoque + e.reservado+e.reservaprevia) as est' +
        'oquevenda,'
      
        '              (e.emestoque + e.reservado + e.reservaprevia + e.t' +
        'ransito + e.demonstracao + e.conserto + e.danificada) as estoque' +
        'total,'
      '              f.preconormal,'
      '              f.precopromocao,'
      '              p.caracteristica,'
      '              c.descricao as descricaocaracteristica,'
      
        '              (select ti.valor from tributosicms ti where ti.cod' +
        'igo = c.incidencia) as incidencia,'
      '              c.csosn,'
      '              p.preco,'
      '              p.descricao  as descproduto,'
      '              p.referencia,'
      
        '              (select m.descricao from marcas m where m.codigo =' +
        ' c.marca) as descmarca,'
      '              c.grade1,'
      '              c.grade2,'
      
        '              (select descricao from grades where grades.codigo ' +
        '= c.grade1) as linha,'
      
        '              (select descricao from grades where grades.codigo ' +
        '= c.grade2) as coluna,'
      '              p.valorgrade1,'
      '              p.valorgrade2,'
      '              e.estoquefisico,'
      
        '              case when e.filial = :FilialBase then 0 else e.fil' +
        'ial end as sequencia,'
      
        '              (SELECT descricao FROM unidades WHERE codigo = c.u' +
        'nidade) AS unidade,'
      '              CAST(CASE WHEN c.producaopropria THEN '#39'P'#39
      '                                               ELSE '#39'T'#39
      '                   END AS CHAR) as producaopropria,'
      '              CAST(CASE WHEN :arredondamento THEN '#39'A'#39
      '                        ELSE '#39'T'#39
      '                   END AS CHAR) AS arredondamento,'
      ''
      ''
      
        '              CAST(CASE WHEN c.incidencia = 5           THEN '#39'I'#39 +
        '  /* 40'#9'Isenta */'
      ''
      '      /*'
      '      codigo'#9'valor'#9'descricao'
      
        '      4'#9'     30'#9'Isenta ou n'#227'o tributada e com cobran'#231'a do ICMS p' +
        'or substitui'#231#227'o tribut'#225'ria'
      '      6'#9'     41'#9'N'#227'o tributada'
      '      7'#9'     50'#9'Suspens'#227'o'
      '      11'#9'   90'#9'Outros'
      '      */'
      '                        WHEN c.incidencia in (4,6,7,11) THEN '#39'N'#39
      '      /*'
      '      codigo'#9'valor'#9'descricao'
      
        '      2'#9'     10'#9'Tributada e com cobran'#231'a do ICMS por substitui'#231#227 +
        'o tribut'#225'ria'
      
        '      9'#9'     60'#9'ICMS cobrado anteriormente por substitui'#231#227'o trib' +
        'ut'#225'ria'
      
        '      10'#9'   70'#9'Com redu'#231#227'o de base de c'#225'lculo e cobran'#231'a do ICMS' +
        ' por substitui'#231#227'o tribut'#225'ria'
      '      */'
      '                        WHEN c.incidencia in (2,9,10)   THEN '#39'F'#39
      '      /*'
      '      codigo'#9'valor'#9'descricao'
      '      1'#9'00'#9'Tributada integralmente'
      '      3'#9'20'#9'Com redu'#231#227'o de base de c'#225'lculo'
      '      8'#9'51'#9'Diferimento'
      '      */'
      '                        WHEN c.incidencia in (1,3,8)    THEN '#39'T'#39
      '                   END AS CHAR) AS situacaotributaria,'
      ''
      '              CodigoBarras(e.produto) as codigobarras,'
      '              c.cest,'
      '              i.classificacaofiscal,'
      '              c.peso,'
      '              c.composto,'
      '              c.composto2,'
      '              estoques_preco(e.produto,e.filial) as preco_atual,'
      '              c.grupo,'
      '              g.descricao as descricaogrupo,'
      '              p.promocao,'
      '              pro.descricao as descricaopromocao ,'
      '              e.sublocalizacao,'
      '              c.tipocomissao as tipocomissao_produto,'
      '              c.comissao as comissao_produto,'
      '              g.tipocomissao as tipocomissao_grupo,'
      '              g.comissao as comissao_grupo,'
      ''
      '              /*'
      
        '              (select CAST(string_agg(CAST(coalesce(mo.descricao' +
        ','#39#39')||'#39': '#39'||coalesce(mo.especificacao,'#39#39') as varchar),'#39', '#39') as v' +
        'archar(500))'
      '               from modelos mo'
      '               where mo.codigo in (select mc.modelo'
      
        '                                   from modeloscaracteristicas m' +
        'c'
      
        '                                   where mc.caracteristica = c.c' +
        'odigo)) as modelos_agg,'
      '               */'
      ''
      
        '              (select CAST(string_agg( distinct mo.descricao,'#39', ' +
        #39') as varchar(500))'
      '               from modelos mo'
      '               where mo.codigo in (select mc.modelo'
      
        '                                   from modeloscaracteristicas m' +
        'c'
      
        '                                   where mc.caracteristica = c.c' +
        'odigo)'
      '                                   ) as modelos_agg,'
      ''
      
        '              (select CAST(string_agg( distinct mo.especificacao' +
        ', '#39', '#39') as varchar(500))'
      '               from modelos mo'
      '               where mo.codigo in (select mc.modelo'
      
        '                                   from modeloscaracteristicas m' +
        'c'
      
        '                                   where mc.caracteristica = c.c' +
        'odigo)'
      '                                   ) as especificacao_agg'
      ''
      ''
      ''
      
        '      From   estoques e ,filiais f, (produtos p left join promoc' +
        'oes pro on p.promocao = pro.codigo),'
      
        '             caracteristicas c, ipi i, grupos g, classes cl, mar' +
        'cas m'
      ''
      '      Where  (e.produto = p.codigo) and'
      '             (e.filial = f.codigo) and'
      '             (p.caracteristica = c.codigo) and'
      '             (i.codigo = c.ipi) and'
      '             (c.grupo = g.codigo) and'
      '             (c.classe = cl.codigo) and'
      '             (c.marca = m.codigo)'
      ''
      ''
      '      %Filial'
      '      %Classe'
      '      %Marcas'
      ''
      '      /* Modelos */'
      ''
      '      %Modelos'
      '      %Especificacoes'
      '      %Grupo'
      '      %Item'
      '      %Produto'
      '      %produtos'
      '      %Promocoes'
      '      %LocalizacaoEstoque'
      '      %LotesProdutos'
      '      %Atributos'
      '      %estoque'
      ''
      '      Order By UPPER(TO_ASCII(p.descricao,'#39'latin1'#39')), sequencia'
      '  ) as temp')
    RequestLive = True
    Left = 72
    Top = 273
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'datahora'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FilialBase'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftUnknown
        Name = 'usuario_logado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'arredondamento'
        ParamType = ptUnknown
      end>
    object qryConsultaEstoquesproduto: TLargeintField
      FieldName = 'produto'
      Required = True
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesprodutovisual: TStringField
      FieldName = 'produtovisual'
      Size = 30
    end
    object qryConsultaEstoquesfilial: TIntegerField
      FieldName = 'filial'
      Required = True
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesminimo: TFloatField
      FieldName = 'minimo'
      DisplayFormat = '0'
    end
    object qryConsultaEstoqueslocalizacao: TStringField
      DisplayWidth = 20
      FieldName = 'localizacao'
      Size = 40
    end
    object qryConsultaEstoquesmaximo: TFloatField
      FieldName = 'maximo'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquescaracteristica: TLargeintField
      FieldName = 'caracteristica'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquespreco: TIntegerField
      FieldName = 'preco'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesdescproduto: TStringField
      FieldName = 'descproduto'
      Required = True
      Size = 100
    end
    object qryConsultaEstoquesreferencia: TStringField
      DisplayWidth = 15
      FieldName = 'referencia'
      Size = 30
    end
    object qryConsultaEstoquesdescmarca: TStringField
      DisplayWidth = 15
      FieldName = 'descmarca'
      Size = 60
    end
    object qryConsultaEstoquesprecosemicms: TFloatField
      FieldName = 'precosemicms'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesprecocomicms: TFloatField
      FieldName = 'precocomicms'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesdatacompra: TDateField
      Alignment = taCenter
      FieldName = 'datacompra'
      EditMask = '99/99/9999;1; '
    end
    object qryConsultaEstoquesqtdecompra: TFloatField
      FieldName = 'qtdecompra'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesultimaentrada: TDateField
      Alignment = taCenter
      FieldName = 'ultimaentrada'
      EditMask = '99/99/9999;1; '
    end
    object qryConsultaEstoquesultimavenda: TDateField
      Alignment = taCenter
      FieldName = 'ultimavenda'
      EditMask = '99/99/9999;1; '
    end
    object qryConsultaEstoquespreconormal: TIntegerField
      FieldName = 'preconormal'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesprecopromocao: TIntegerField
      FieldName = 'precopromocao'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesemestoque: TFloatField
      FieldName = 'emestoque'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesreservado: TFloatField
      FieldName = 'reservado'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesdemonstracao: TFloatField
      FieldName = 'demonstracao'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquestransito: TFloatField
      FieldName = 'transito'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesconserto: TFloatField
      FieldName = 'conserto'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesdanificada: TFloatField
      FieldName = 'danificada'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesfuturo: TFloatField
      FieldName = 'futuro'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesestoquevenda: TFloatField
      FieldName = 'estoquevenda'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesestoquetotal: TFloatField
      FieldName = 'estoquetotal'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesprodutoempromocao: TBooleanField
      FieldName = 'produtoempromocao'
    end
    object qryConsultaEstoquesfinanceiro: TFloatField
      FieldName = 'financeiro'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquescustomedio: TFloatField
      FieldName = 'customedio'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesaliquotaipi: TFloatField
      FieldName = 'aliquotaipi'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoqueslinha: TStringField
      DisplayWidth = 10
      FieldName = 'linha'
      Size = 40
    end
    object qryConsultaEstoquescoluna: TStringField
      DisplayWidth = 10
      FieldName = 'coluna'
      Size = 40
    end
    object qryConsultaEstoquesgrade1: TIntegerField
      FieldName = 'grade1'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesgrade2: TIntegerField
      FieldName = 'grade2'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesvalorgrade1: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade1'
      Size = 50
    end
    object qryConsultaEstoquesvalorgrade2: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade2'
      Size = 50
    end
    object qryConsultaEstoquesdescricaocaracteristica: TStringField
      FieldName = 'descricaocaracteristica'
      Size = 100
    end
    object qryConsultaEstoquesnomefilial: TStringField
      DisplayWidth = 40
      FieldName = 'nomefilial'
      Size = 60
    end
    object qryConsultaEstoquesreservaprevia: TFloatField
      FieldName = 'reservaprevia'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesestoquefisico: TFloatField
      FieldName = 'estoquefisico'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesprodutoinativo: TBooleanField
      FieldName = 'produtoinativo'
    end
    object qryConsultaEstoquesprodutoforalinha: TBooleanField
      FieldName = 'produtoforalinha'
    end
    object qryConsultaEstoquesincidencia: TStringField
      FieldName = 'incidencia'
      Size = 2
    end
    object qryConsultaEstoquessequencia: TIntegerField
      FieldName = 'sequencia'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquescodigonotaentrada: TIntegerField
      FieldName = 'codigonotaentrada'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesnomefornecedor: TStringField
      DisplayWidth = 40
      FieldName = 'nomefornecedor'
      Size = 60
    end
    object qryConsultaEstoquesfornecedornosimples: TBooleanField
      FieldName = 'fornecedornosimples'
    end
    object qryConsultaEstoquesunidade: TStringField
      Alignment = taCenter
      DisplayLabel = 'Unidade'
      DisplayWidth = 7
      FieldName = 'unidade'
      Size = 30
    end
    object qryConsultaEstoquesproducaopropria: TStringField
      Alignment = taCenter
      DisplayLabel = 'IPPT'
      FieldName = 'producaopropria'
      Size = 1
    end
    object qryConsultaEstoquesarredondamento: TStringField
      Alignment = taCenter
      DisplayLabel = 'IAT'
      FieldName = 'arredondamento'
      Size = 1
    end
    object qryConsultaEstoquessituacaotributaria: TStringField
      Alignment = taCenter
      DisplayLabel = 'ST'
      FieldName = 'situacaotributaria'
      Size = 1
    end
    object qryConsultaEstoquescodigobarras: TStringField
      DisplayLabel = 'C'#243'digo Barras'
      DisplayWidth = 18
      FieldName = 'codigobarras'
      Size = 100
    end
    object qryConsultaEstoquespeso: TFloatField
      DisplayLabel = 'Peso do Produto'
      FieldName = 'peso'
      DisplayFormat = '###,##0.0000'
    end
    object qryConsultaEstoquescsosn: TStringField
      FieldName = 'csosn'
      Size = 3
    end
    object qryConsultaEstoquescst_nfentrada: TStringField
      FieldName = 'cst_nfentrada'
      Size = 2
    end
    object qryConsultaEstoquescsosn_nfentrada: TStringField
      FieldName = 'csosn_nfentrada'
      Size = 3
    end
    object qryConsultaEstoquescst_nf: TStringField
      FieldName = 'cst_nf'
      Size = 2
    end
    object qryConsultaEstoquescsosn_nf: TStringField
      FieldName = 'csosn_nf'
      Size = 3
    end
    object qryConsultaEstoquesultimacompra_com_icms: TFloatField
      FieldName = 'ultimacompra_com_icms'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquescomposto: TBooleanField
      FieldName = 'composto'
    end
    object qryConsultaEstoquescomposto2: TBooleanField
      FieldName = 'composto2'
    end
    object qryConsultaEstoquescest: TStringField
      FieldName = 'cest'
      Size = 9
    end
    object qryConsultaEstoquesclassificacaofiscal: TStringField
      FieldName = 'classificacaofiscal'
      Size = 8
    end
    object qryConsultaEstoquespreco_atual: TFloatField
      FieldName = 'preco_atual'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesgrupo: TStringField
      FieldName = 'grupo'
      Size = 4
    end
    object qryConsultaEstoquesdescricaogrupo: TStringField
      DisplayWidth = 30
      FieldName = 'descricaogrupo'
      Size = 100
    end
    object qryConsultaEstoquespromocao: TIntegerField
      FieldName = 'promocao'
    end
    object qryConsultaEstoquesdescricaopromocao: TStringField
      FieldName = 'descricaopromocao'
      Size = 100
    end
    object qryConsultaEstoquessublocalizacao: TStringField
      DisplayWidth = 20
      FieldName = 'sublocalizacao'
      Size = 40
    end
    object qryConsultaEstoquesmodelos_agg: TStringField
      FieldName = 'modelos_agg'
      Size = 500
    end
    object qryConsultaEstoquesespecificacao_agg: TStringField
      FieldName = 'especificacao_agg'
      Size = 500
    end
    object qryConsultaEstoquescomissao_grupo: TFloatField
      FieldName = 'comissao_grupo'
      OnGetText = qryConsultaEstoquescomissao_grupoGetText
    end
    object qryConsultaEstoquescomissao_produto: TFloatField
      FieldName = 'comissao_produto'
      OnGetText = qryConsultaEstoquescomissao_produtoGetText
    end
    object qryConsultaEstoquestipocomissao_produto: TStringField
      FieldName = 'tipocomissao_produto'
      Size = 1
    end
    object qryConsultaEstoquestipocomissao_grupo: TStringField
      FieldName = 'tipocomissao_grupo'
      Size = 1
    end
    object qryConsultaEstoquesnrlote: TStringField
      FieldName = 'nrlote'
    end
    object qryConsultaEstoquesvalidade: TDateField
      FieldName = 'validade'
    end
  end
  object dsrConsultaEstoques: TtecDataSource
    DataSet = qryConsultaEstoques
    Left = 154
    Top = 281
  end
  object qryVendasAcumuladas: TtecQuery
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
      'Select sum(case when substr(movimentos.operacao,13,1) = '#39'+'#39
      '                            then @ movimentos.quantidade'
      '                            else  -movimentos.quantidade'
      '                    end) as totalvenda,'
      
        '           cast(to_char(movimentos.data,'#39'mm/YYYY'#39') as varchar) a' +
        's mes,'
      
        '           cast(to_number(cast(movimentos.data as varchar),'#39'9999' +
        '999'#39') as integer) as ordem,'
      '           movimentos.filial'
      'From   movimentos'
      'Where movimentos.produto =:produto and'
      '           movimentos.filial = :filial             and'
      
        '           ((substr(movimentos.operacao,13,1)) = '#39'+'#39' or (substr(' +
        'movimentos.operacao,13,1) = '#39'-'#39'))'
      
        'Group By movimentos.filial, to_char(movimentos.data,'#39'mm/YYYY'#39'),o' +
        'rdem'
      'Order by ordem DESC')
    RequestLive = False
    Left = 70
    Top = 161
    ParamData = <
      item
        DataType = ftString
        Name = 'produto'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end>
    object qryVendasAcumuladasfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryVendasAcumuladastotalvenda: TFloatField
      FieldName = 'totalvenda'
    end
    object qryVendasAcumuladasmes: TStringField
      FieldName = 'mes'
      Size = 7
    end
  end
  object dsrVendasAcumuladas: TtecDataSource
    DataSet = qryVendasAcumuladas
    Left = 170
    Top = 161
  end
  object qryComprasAcumuladas: TtecQuery
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
      'Select sum(case when substr(movimentos.operacao,14,1) = '#39'+'#39
      '                            then   movimentos.quantidade'
      '                            else  - @movimentos.quantidade'
      '                    end) as totalcompra,'
      
        '           cast(to_char(movimentos.data,'#39'mm/YYYY'#39') as varchar) a' +
        's mes,'
      
        '           cast(to_number(cast(movimentos.data as varchar),'#39'9999' +
        '999'#39') as integer) as ordem,'
      '           movimentos.filial'
      'From   movimentos'
      'Where movimentos.produto =:produto and'
      '           movimentos.filial = :filial             and'
      
        '           ((substr(movimentos.operacao,14,1)) = '#39'+'#39' or (substr(' +
        'movimentos.operacao,14,1) = '#39'-'#39'))'
      
        'Group By movimentos.filial, to_char(movimentos.data,'#39'mm/YYYY'#39'),o' +
        'rdem'
      'Order by ordem DESC')
    RequestLive = False
    Left = 301
    Top = 465
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end>
    object qryComprasAcumuladastotalcompra: TFloatField
      FieldName = 'totalcompra'
    end
    object qryComprasAcumuladasfilial: TIntegerField
      FieldName = 'filial'
      Required = True
    end
    object qryComprasAcumuladasmes: TStringField
      FieldName = 'mes'
      Size = 7
    end
  end
  object dsrComprasAcumuladas: TtecDataSource
    DataSet = qryComprasAcumuladas
    Left = 448
    Top = 345
  end
  object qryProdutosPedidos: TtecQuery
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
      
        'Select pedidos_estoquepedido(:produto, cast(:filial as int2)) as' +
        ' quantidadefilial,'
      '       cast(null as numeric) as totalfiliais')
    RequestLive = True
    Left = 448
    Top = 13
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'filial'
        ParamType = ptUnknown
      end>
    object qryProdutosPedidosquantidadefilial: TFloatField
      FieldName = 'quantidadefilial'
    end
    object qryProdutosPedidostotalfiliais: TFloatField
      FieldName = 'totalfiliais'
    end
  end
  object dsrProdutosPedidos: TtecDataSource
    DataSet = qryProdutosPedidos
    Left = 448
    Top = 71
  end
  object qryPrecos: TtecQuery
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
      'Select  sum(precos.valornormal) as valornormal,'
      
        '        max(precos.alteracaopreconormal) as alteracaopreconormal' +
        ','
      '        sum(precos.valorpromocao) as valorpromocao,'
      '        max(precos.validade) as validade,'
      
        '       (SELECT p.descricao FROM precos p WHERE p.caracteristica ' +
        '= :caracteristica AND p.codigo = :preco) AS descricaopreco'
      'From    (SELECT (CASE WHEN (COALESCE(fpf.fator,0) > 0) then'
      
        '                                                    ROUND((cp.va' +
        'lor * fpf.fator),2)'
      '                                       ELSE cp.valor'
      '                             END) as valornormal,'
      
        '                             COALESCE(cp.alteracao,cp.data) as a' +
        'lteracaopreconormal,'
      '                             0 as valorpromocao,'
      '                             cp.validade'
      '             FROM colunasprecos cp,'
      
        '                         caracteristicas ca left join (SELECT fa' +
        'toresprecosfiliais.fator,'
      
        '                                                                ' +
        '                  fatoresprecosfiliais.fatorpreco'
      
        '                                                                ' +
        '   FROM   fatoresprecosfiliais'
      
        '                                                                ' +
        '   WHERE (fatoresprecosfiliais.filial =:filial)) fpf'
      
        '                                                      ON (ca.fat' +
        'orpreco = fpf.fatorpreco)'
      '             WHERE (ca.codigo =:caracteristica) AND'
      '                           (ca.codigo = cp.caracteristica) AND'
      '                           (cp.preco  =:preco) AND'
      '                           (cp.coluna =:colunanormal)'
      ''
      '              union'
      ''
      '              SELECT 0 as valornormal,'
      '                     NULL as alteracao,'
      
        '                            (CASE WHEN (COALESCE(fpf.fator,0) > ' +
        '0) then'
      
        '                                                    ROUND((cp.va' +
        'lor * fpf.fator),2)'
      '                                       ELSE cp.valor'
      '                             END) as valorpromocao,'
      '                             cp.validade'
      '             FROM colunasprecos cp,'
      
        '                         caracteristicas ca left join (SELECT fa' +
        'toresprecosfiliais.fator,'
      
        '                                                                ' +
        '                  fatoresprecosfiliais.fatorpreco'
      
        '                                                                ' +
        '   FROM   fatoresprecosfiliais'
      
        '                                                                ' +
        '   WHERE (fatoresprecosfiliais.filial =:filial)) fpf'
      
        '                                                      ON (ca.fat' +
        'orpreco = fpf.fatorpreco)'
      '              WHERE (ca.codigo =:caracteristica) AND'
      '                            (ca.codigo = cp.caracteristica) AND'
      '                            (cp.preco  =:preco) AND'
      '                            (cp.coluna =:colunapromocao) AND'
      '                            (cp.validade >= current_date)'
      '            ) as precos')
    RequestLive = False
    Left = 79
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'caracteristica'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'preco'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'colunanormal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'colunapromocao'
        ParamType = ptUnknown
      end>
    object qryPrecosvalornormal: TFloatField
      FieldName = 'valornormal'
    end
    object qryPrecosvalorpromocao: TFloatField
      FieldName = 'valorpromocao'
    end
    object qryPrecosvalidade: TDateField
      FieldName = 'validade'
    end
    object qryPrecosalteracaopreconormal: TDateField
      FieldName = 'alteracaopreconormal'
    end
    object qryPrecosdescricaopreco: TStringField
      FieldName = 'descricaopreco'
      Size = 50
    end
  end
  object dsrPrecos: TDataSource
    DataSet = qryPrecos
    Left = 153
    Top = 224
  end
  object qryConsultaEstoquesSimilares: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryConsultaEstoquesSimilaresAfterOpen
    AfterPost = qryConsultaEstoquesSimilaresAfterPost
    AfterCancel = BeforeDelete
    AfterScroll = qryConsultaEstoquesSimilaresAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'Filial'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';select *,'
      
        '       (select f.nome from fornecedores f where f.codigo = (sele' +
        'ct np.fornecedor from notaspag np where np.codigo = codigonotaen' +
        'trada)) as nomefornecedor,'
      
        '       (select pnp.incidencia from produtosnotaspag pnp where pn' +
        'p.codigonota = codigonotaentrada and pnp.produto = temp.produto ' +
        'limit 1) as cst_nfentrada,'
      
        '       (select pnp.csosn from produtosnotaspag pnp where pnp.cod' +
        'igonota = codigonotaentrada and pnp.produto = temp.produto limit' +
        ' 1) as csosn_nfentrada,'
      
        '       (select pnp.cst_nf from produtosnotaspag pnp where pnp.co' +
        'digonota = codigonotaentrada and pnp.produto = temp.produto limi' +
        't 1) as cst_nf,'
      
        '       (select pnp.csosn_nf from produtosnotaspag pnp where pnp.' +
        'codigonota = codigonotaentrada and pnp.produto = temp.produto li' +
        'mit 1) as csosn_nf,'
      
        '       case when (select f.nosimples from fornecedores f where f' +
        '.codigo = (select np.fornecedor from notaspag np where np.codigo' +
        ' = codigonotaentrada)) = null then False'
      
        '            else (select f.nosimples from fornecedores f where f' +
        '.codigo = (select np.fornecedor from notaspag np where np.codigo' +
        ' = codigonotaentrada)) end  as fornecedornosimples,'
      '       cast(null as varchar(20)) as nrlote,'
      '       cast(null as date) as validade     '
      'from'
      '(Select e.produto,'
      '        p.CodigoVisual as ProdutoVisual,'
      '        e.filial,'
      '        f.nome as nomefilial,'
      '        e.localizacao,'
      '        e.minimo,'
      '        e.maximo,'
      '        e.precosemicms,'
      '        e.precocomicms,'
      
        '        CASE WHEN c.csosn in ('#39'101'#39','#39'102'#39') THEN e.valorultimacom' +
        'pra + (e.precocomicms-e.precosemicms) ELSE e.valorultimacompra E' +
        'ND as ultimacompra_com_icms,'
      '        e.financeiro,'
      
        '        case when (e.emestoque+e.reservado+e.reservaprevia+e.tra' +
        'nsito+e.demonstracao+e.conserto+e.danificada) = 0  then 0'
      
        '                 else round(e.financeiro / (e.emestoque+e.reserv' +
        'ado+e.reservaprevia+e.transito+e.demonstracao+e.conserto+e.danif' +
        'icada), 2)'
      '        end as customedio,'
      '        e.aliquotaipi,'
      '        e.datacompra,'
      '        e.qtdecompra,'
      '        e.ultimaentrada,'
      '        e.ultimavenda,'
      '        e.emestoque,'
      '        e.reservado,'
      '        e.reservaprevia,'
      '        e.demonstracao,'
      '        e.transito,'
      '        e.conserto,'
      '        e.danificada,'
      '        e.futuro,'
      '        (select max(np.codigo)'
      '         from notaspag np'
      '         where np.codigo in (select pn.codigonota'
      '                             from produtosnotaspag pn'
      '                             where pn.produto  = e.produto'
      
        '                              and ehnotafiscalentradacompra(codi' +
        'gofiscal)) and np.tipofornecedor <> '#39'L'#39') as codigonotaentrada,'
      '        e.estoquefisico,'
      
        '        (select estoques_produtoempromocao(e.produto,e.filial)) ' +
        'as produtoempromocao,'
      
        '        (select estoques_produtoinativo(e.produto)) as produtoin' +
        'ativo,'
      
        '        (select estoques_produtoforalinha(e.produto)) as produto' +
        'foralinha,'
      
        '        (e.emestoque + e.reservado + e.reservaprevia) as estoque' +
        'venda,'
      
        '        (e.emestoque + e.reservado + e.reservaprevia + e.transit' +
        'o + e.demonstracao + e.conserto + e.danificada) as estoquetotal,'
      '        f.preconormal,'
      '        f.precopromocao,'
      '        p.caracteristica,'
      '        c.descricao as descricaocaracteristica,'
      '        p.preco,'
      '        p.descricao  as descproduto,'
      '        p.referencia,'
      '        m.descricao as descmarca,'
      '        p.promocao,'
      '        pro.descricao as descricaopromocao,'
      
        '        (select descricao from grades where grades.codigo = c.gr' +
        'ade1) as linha,'
      
        '        (select descricao from grades where grades.codigo = c.gr' +
        'ade2) as coluna,'
      '        p.valorgrade1,'
      '        p.valorgrade2,'
      '        c.peso,'
      '        c.csosn,'
      
        '       (select ti.valor from tributosicms ti where ti.codigo = c' +
        '.incidencia) as incidencia,'
      '        c.composto,'
      '        c.composto2,'
      '        c.grupo,'
      '        g.descricao as descricaogrupo,'
      '        i.classificacaofiscal,'
      ''
      '        /*'
      
        '        (select CAST(string_agg(CAST(coalesce(mo.descricao,'#39#39')||' +
        #39': '#39'||coalesce(mo.especificacao,'#39#39') as varchar),'#39', '#39') as varchar' +
        '(500))'
      '         from modelos mo'
      '         where mo.codigo in (select mc.modelo'
      '                             from modeloscaracteristicas mc'
      
        '                             where mc.caracteristica = c.codigo)' +
        ') as modelos_agg'
      '                             */'
      ''
      
        '        (select CAST(string_agg( DISTINCT mo.descricao,'#39', '#39') as ' +
        'varchar(500))'
      '         from modelos mo'
      '         where mo.codigo in (select mc.modelo'
      '                             from modeloscaracteristicas mc'
      
        '                             where mc.caracteristica = c.codigo)' +
        ') as modelos_agg,'
      ''
      
        '        (select CAST(string_agg( DISTINCT mo.especificacao,'#39', '#39')' +
        ' as varchar(500))'
      '         from modelos mo'
      '         where mo.codigo in (select mc.modelo'
      '                             from modeloscaracteristicas mc'
      
        '                             where mc.caracteristica = c.codigo)' +
        ') as especificacao_agg'
      ''
      ''
      ''
      'From ('
      '      (estoques e'
      '       join filiais f'
      '       on e.filial = f.codigo)'
      ''
      
        '       Join ((produtos p left join promocoes pro on p.promocao =' +
        ' pro.codigo)'
      '             join (((caracteristicas c'
      '                    join marcas m'
      '                    on c.marca = m.codigo)'
      ''
      '                    join grupos g'
      '                    on c.grupo = g.codigo)'
      ''
      '                    join ipi i'
      '                    on c.ipi = i.codigo)'
      ''
      '             on p.caracteristica = c.codigo)'
      '       on e.produto = p.codigo)'
      ''
      'Where e.produto = p.codigo'
      '                 '
      '  and p.codigo <> :produto'
      '       '
      '  and ((p.codigo in (select p1.codigo'
      '                   from produtos p1'
      
        '                   where p1.caracteristica in (select distinct s' +
        'imilares."similar"'
      '                                               from similares'
      
        '                                               where similares.c' +
        'aracteristica = (Select p2.caracteristica'
      
        '                                                                ' +
        '                  from produtos p2'
      
        '                                                                ' +
        '                  Where p2.codigo = :produto)'
      
        '                                               union all        ' +
        '                           '
      ''
      
        '                                              (Select p1.caracte' +
        'ristica'
      '                                               from produtos p1'
      
        '                                               Where p1.codigo =' +
        ' :produto))'
      '                                              )'
      
        '                                                                ' +
        '                  '
      
        '  and (case when (select coalesce(c2.agrupamentosimilares,'#39#39') = ' +
        #39'L'#39' and '
      '                                  c2.grade1 is not null and '
      '                                  p2.valorgrade1 is not null'
      '                           from caracteristicas c2'
      '                                join produtos p2'
      '                                on c2.codigo = p2.caracteristica'
      '                           where p2.codigo = :produto)'
      '                           '
      '                             and c.grade1 is not null '
      '                             and p.valorgrade1 is not null then'
      ''
      '                 (select p2.valorgrade1'
      '                  from produtos p2'
      
        '                  where p2.codigo = :produto) = p.valorgrade1 an' +
        'd'
      ''
      '                 (select c2.grade1'
      '                  from caracteristicas c2'
      '                  where c2.codigo = (select p2.caracteristica'
      '                                     from produtos p2'
      
        '                                     where p2.codigo = :produto)' +
        ') = c.grade1'
      ''
      
        '            when  (select coalesce(c2.agrupamentosimilares,'#39#39') =' +
        ' '#39'C'#39' and '
      '                                  c2.grade2 is not null and '
      '                                  p2.valorgrade2 is not null'
      '                           from caracteristicas c2'
      '                                join produtos p2'
      '                                on c2.codigo = p2.caracteristica'
      '                           where p2.codigo = :produto) '
      '                           '
      '                            and c.grade2 is not null '
      '                            and p.valorgrade2 is not null then'
      ''
      '                 (select p2.valorgrade2'
      '                  from produtos p2'
      
        '                  where p2.codigo = :produto) = p.valorgrade2 an' +
        'd'
      ''
      '                 (select c2.grade2'
      '                  from caracteristicas c2'
      '                  where c2.codigo = (select p2.caracteristica'
      '                                     from produtos p2'
      
        '                                     where p2.codigo = :produto)' +
        ') = c.grade2'
      ''
      '            else true'
      '       end))'
      '       '
      '       or p.codigo in (select ps."similar" '
      '                       from produtos_similares ps'
      '                       where ps.produto = :produto) )         '
      ''
      '%Filial'
      ''
      ''
      'Order By UPPER(TO_ASCII(p.descricao, '#39'latin1'#39')),e.filial'
      ') as temp')
    RequestLive = True
    Left = 74
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qryConsultaEstoquesSimilaresproduto: TLargeintField
      FieldName = 'produto'
      Visible = False
    end
    object qryConsultaEstoquesSimilaresprodutovisual: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'produtovisual'
      Size = 30
    end
    object qryConsultaEstoquesSimilaresfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesSimilareslocalizacao: TStringField
      FieldName = 'localizacao'
    end
    object qryConsultaEstoquesSimilaresminimo: TFloatField
      FieldName = 'minimo'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesSimilaresmaximo: TFloatField
      FieldName = 'maximo'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesSimilaresdatacompra: TDateField
      Alignment = taCenter
      FieldName = 'datacompra'
      EditMask = '99/99/9999;1; '
    end
    object qryConsultaEstoquesSimilaresqtdecompra: TFloatField
      FieldName = 'qtdecompra'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesSimilaresultimaentrada: TDateField
      Alignment = taCenter
      FieldName = 'ultimaentrada'
      EditMask = '99/99/9999;1; '
    end
    object qryConsultaEstoquesSimilaresultimavenda: TDateField
      Alignment = taCenter
      FieldName = 'ultimavenda'
      EditMask = '99/99/9999;1; '
    end
    object qryConsultaEstoquesSimilaresemestoque: TFloatField
      FieldName = 'emestoque'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesSimilaresreservado: TFloatField
      FieldName = 'reservado'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesSimilaresdemonstracao: TFloatField
      FieldName = 'demonstracao'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesSimilarestransito: TFloatField
      FieldName = 'transito'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesSimilaresconserto: TFloatField
      FieldName = 'conserto'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesSimilaresdanificada: TFloatField
      FieldName = 'danificada'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesSimilaresfuturo: TFloatField
      FieldName = 'futuro'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesSimilaresestoquevenda: TFloatField
      FieldName = 'estoquevenda'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesSimilaresestoquetotal: TFloatField
      FieldName = 'estoquetotal'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesSimilarespreconormal: TIntegerField
      FieldName = 'preconormal'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesSimilaresprecopromocao: TIntegerField
      FieldName = 'precopromocao'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesSimilarescaracteristica: TLargeintField
      FieldName = 'caracteristica'
    end
    object qryConsultaEstoquesSimilarespreco: TIntegerField
      FieldName = 'preco'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesSimilaresdescproduto: TStringField
      FieldName = 'descproduto'
      Size = 100
    end
    object qryConsultaEstoquesSimilaresreferencia: TStringField
      FieldName = 'referencia'
      Size = 15
    end
    object qryConsultaEstoquesSimilaresdescmarca: TStringField
      FieldName = 'descmarca'
      Size = 15
    end
    object qryConsultaEstoquesSimilaresprodutoempromocao: TBooleanField
      FieldName = 'produtoempromocao'
    end
    object qryConsultaEstoquesSimilareslinha: TStringField
      FieldName = 'linha'
      Size = 50
    end
    object qryConsultaEstoquesSimilarescoluna: TStringField
      FieldName = 'coluna'
      Size = 50
    end
    object qryConsultaEstoquesSimilaresvalorgrade1: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade1'
      Size = 30
    end
    object qryConsultaEstoquesSimilaresvalorgrade2: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade2'
      Size = 30
    end
    object qryConsultaEstoquesSimilaresreservaprevia: TFloatField
      FieldName = 'reservaprevia'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesSimilaresestoquefisico: TFloatField
      FieldName = 'estoquefisico'
      DisplayFormat = '0'
    end
    object qryConsultaEstoquesSimilaresprodutoinativo: TBooleanField
      FieldName = 'produtoinativo'
    end
    object qryConsultaEstoquesSimilaresprodutoforalinha: TBooleanField
      FieldName = 'produtoforalinha'
    end
    object qryConsultaEstoquesSimilaresnomefilial: TStringField
      FieldName = 'nomefilial'
      Size = 60
    end
    object qryConsultaEstoquesSimilaresprecosemicms: TFloatField
      FieldName = 'precosemicms'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesSimilaresprecocomicms: TFloatField
      FieldName = 'precocomicms'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesSimilaresfinanceiro: TFloatField
      FieldName = 'financeiro'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesSimilarescustomedio: TFloatField
      FieldName = 'customedio'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesSimilaresaliquotaipi: TFloatField
      FieldName = 'aliquotaipi'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesSimilaresdescricaocaracteristica: TStringField
      FieldName = 'descricaocaracteristica'
      Size = 100
    end
    object qryConsultaEstoquesSimilarespeso: TFloatField
      DisplayLabel = 'Peso do Produto'
      FieldName = 'peso'
      DisplayFormat = '###,##0.0000'
    end
    object qryConsultaEstoquesSimilarescsosn: TStringField
      FieldName = 'csosn'
      Size = 3
    end
    object qryConsultaEstoquesSimilaresincidencia: TStringField
      FieldName = 'incidencia'
      Size = 2
    end
    object qryConsultaEstoquesSimilarescodigonotaentrada: TIntegerField
      FieldName = 'codigonotaentrada'
    end
    object qryConsultaEstoquesSimilaresnomefornecedor: TStringField
      FieldName = 'nomefornecedor'
      Size = 60
    end
    object qryConsultaEstoquesSimilarescst_nfentrada: TStringField
      FieldName = 'cst_nfentrada'
      Size = 2
    end
    object qryConsultaEstoquesSimilarescsosn_nfentrada: TStringField
      FieldName = 'csosn_nfentrada'
      Size = 3
    end
    object qryConsultaEstoquesSimilarescst_nf: TStringField
      FieldName = 'cst_nf'
      Size = 2
    end
    object qryConsultaEstoquesSimilarescsosn_nf: TStringField
      FieldName = 'csosn_nf'
      Size = 3
    end
    object qryConsultaEstoquesSimilaresfornecedornosimples: TBooleanField
      FieldName = 'fornecedornosimples'
    end
    object qryConsultaEstoquesSimilaresultimacompra_com_icms: TFloatField
      FieldName = 'ultimacompra_com_icms'
    end
    object qryConsultaEstoquesSimilarescomposto: TBooleanField
      FieldName = 'composto'
    end
    object qryConsultaEstoquesSimilarescomposto2: TBooleanField
      FieldName = 'composto2'
    end
    object qryConsultaEstoquesSimilaresgrupo: TStringField
      FieldName = 'grupo'
      Size = 4
    end
    object qryConsultaEstoquesSimilaresdescricaogrupo: TStringField
      FieldName = 'descricaogrupo'
      Size = 30
    end
    object qryConsultaEstoquesSimilaresclassificacaofiscal: TStringField
      FieldName = 'classificacaofiscal'
      Size = 8
    end
    object qryConsultaEstoquesSimilarespromocao: TIntegerField
      FieldName = 'promocao'
    end
    object qryConsultaEstoquesSimilaresdescricaopromocao: TStringField
      FieldName = 'descricaopromocao'
      Size = 100
    end
    object qryConsultaEstoquesSimilaresmodelos_agg: TStringField
      FieldName = 'modelos_agg'
      Size = 500
    end
    object qryConsultaEstoquesSimilaresespecificacao_agg: TStringField
      FieldName = 'especificacao_agg'
      Size = 500
    end
    object qryConsultaEstoquesSimilaresnrlote: TStringField
      FieldName = 'nrlote'
    end
    object qryConsultaEstoquesSimilaresvalidade: TDateField
      FieldName = 'validade'
    end
  end
  object qryConsultaLinhaColuna: TtecQuery
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
      ' select '
      '         elementos.*,'
      '        caracteristicas.caracteristica,'
      '        caracteristicas.produto,'
      '        caracteristicas.filial,'
      '        caracteristicas.emestoque,'
      '        caracteristicas.estoquetotal,'
      #9'caracteristicas.produtoempromocao,'
      #9'(case when caracteristicas.produto is not null then'
      #9' (case when caracteristicas.produtoempromocao then'
      
        #9'     (SELECT (CASE WHEN (COALESCE(caracteristicas.fator,0) > 0)' +
        ' then'
      
        '                        ROUND((cp.valor * caracteristicas.fator)' +
        ',2)'
      '                      ELSE cp.valor'
      '                      END)'
      '              FROM colunasprecos cp'
      
        '              WHERE cp.caracteristica = caracteristicas.caracter' +
        'istica and'
      #9'           cp.preco = caracteristicas.preco AND'
      '                   cp.coluna = caracteristicas.precopromocao AND'
      '                   cp.validade >= current_date)'
      #9' else'
      
        '           (SELECT (CASE WHEN (COALESCE(caracteristicas.fator,0)' +
        ' > 0) then'
      '                     ROUND((cp.valor * caracteristicas.fator),2)'
      '                   ELSE cp.valor'
      '                   END)'
      '            FROM colunasprecos cp'
      
        '            WHERE cp.caracteristica = caracteristicas.caracteris' +
        'tica and'
      #9'         cp.preco = caracteristicas.preco AND'
      '                 cp.coluna = caracteristicas.preconormal)'
      '          end)'
      #9' else cast(null as numeric) end) as precoatual'
      ' from'
      ' ( select distinct'
      '    eg1.valor as valorgrade1,'
      '    eg2.valor as valorgrade2'
      '   from'
      
        '   (elementosgrades eg1 join grades g1 on eg1.grade = g1.codigo)' +
        ','
      '   (elementosgrades eg2 join grades g2 on eg2.grade = g2.codigo)'
      '   where'
      '         eg1.grade = :linha'
      '         and eg2.grade = :coluna'
      '  order by'
      '           eg1.valor,'
      '           eg2.valor'
      ' ) as elementos join'
      '  ('
      '    Select p.caracteristica,'
      '           p.preco,'
      #9'   f.preconormal,'
      #9'   f.precopromocao,'
      '           e.produto,'
      '           e.filial,'
      '           e.emestoque,'
      '        (select sum(e2.emestoque)'
      '         from estoques e2'
      '         where e2.produto = e.produto) as estoquetotal,'
      
        '        coalesce(p.valorgrade1, cast('#39#39' as varchar)) as valorgra' +
        'de1,'
      
        '        coalesce(p.valorgrade2, cast('#39#39' as varchar)) as valorgra' +
        'de2,'
      
        '       (select estoques_produtoempromocao(e.produto,e.filial)) a' +
        's produtoempromocao,'
      '       (SELECT fatoresprecosfiliais.fator'
      '        FROM   fatoresprecosfiliais'
      '        WHERE fatoresprecosfiliais.fatorpreco = c.fatorpreco and'
      #9'      fatoresprecosfiliais.filial = e.filial) as fator'
      ''
      '    From   estoques e,filiais f,produtos p,caracteristicas c'
      '    Where  (e.produto = p.codigo) and'
      '           (e.filial = f.codigo) and'
      '           (p.caracteristica = c.codigo) and'
      '     c.codigo = :caracteristica and'
      '     e.filial = :filial'
      '  ) as caracteristicas'
      ' on elementos.valorgrade1 =  caracteristicas.valorgrade1 '
      '    and elementos.valorgrade2 = caracteristicas.valorgrade2'
      ' order by elementos.valorgrade1,'
      '          elementos.valorgrade2 ')
    RequestLive = False
    Left = 301
    Top = 361
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'linha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'coluna'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'caracteristica'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end>
    object qryConsultaLinhaColunavalorgrade1: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade1'
      Size = 30
    end
    object qryConsultaLinhaColunavalorgrade2: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade2'
      Size = 30
    end
    object qryConsultaLinhaColunaproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryConsultaLinhaColunaemestoque: TFloatField
      FieldName = 'emestoque'
      DisplayFormat = '0'
    end
    object qryConsultaLinhaColunaestoquetotal: TFloatField
      FieldName = 'estoquetotal'
    end
    object qryConsultaLinhaColunaprodutoempromocao: TBooleanField
      FieldName = 'produtoempromocao'
    end
    object qryConsultaLinhaColunaprecoatual: TFloatField
      FieldName = 'precoatual'
      DisplayFormat = '0.00'
    end
    object qryConsultaLinhaColunacaracteristica: TLargeintField
      FieldName = 'caracteristica'
    end
    object qryConsultaLinhaColunafilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
  end
  object qryGrade: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryGradeAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select cast(null as varchar) as LinhaColuna')
    RequestLive = True
    Left = 448
    Top = 128
  end
  object dsrGrade: TtecDataSource
    DataSet = qryGrade
    Left = 448
    Top = 184
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
      'Select codigo from filiais')
    RequestLive = False
    Left = 448
    Top = 240
    object qryConsultaFiliaiscodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object dsrConsultaFiliais: TtecDataSource
    DataSet = qryConsultaFiliais
    Left = 448
    Top = 288
  end
  object qryPrecosCargos: TtecQuery
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
      'Select distinct c.codigo,'
      '       e.produto,'
      '       c.descricao,'
      ''
      '       estoques_preco(cast(e.produto as bigint),'
      '                      cast(e.filial as integer),'
      '                      cast((Select pc.markup'
      '                            from produtoscargos pc'
      '                            where pc.cargo = c.codigo'
      
        '                              and pc.produto = e.produto) as num' +
        'eric) ) as valorproduto'
      ''
      
        'from (estoques e join (produtoscargos pc join  cargos c on pc.ca' +
        'rgo = c.codigo) '
      
        '                                       on e.produto = pc.produto' +
        ')'
      'where e.produto = :produto and'
      '      e.filial = :FilialBase'
      'order by c.descricao, c.codigo      ')
    RequestLive = False
    Left = 544
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FilialBase'
        ParamType = ptUnknown
      end>
    object qryPrecosCargoscodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
    object qryPrecosCargosproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryPrecosCargosdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 100
    end
    object qryPrecosCargosvalorproduto: TFloatField
      FieldName = 'valorproduto'
      DisplayFormat = '0.00'
    end
  end
  object dsrPrecosCargos: TtecDataSource
    DataSet = qryPrecosCargos
    Left = 568
    Top = 40
  end
  object qryAjustarValorUltimaCompra: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterPost = qryAjustarValorUltimaCompraAfterPost
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select e.valorultimacompra'
      'from estoques e'
      'where e.produto = :produto'
      'and e.filial = :FilialBase')
    RequestLive = True
    Left = 688
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FilialBase'
        ParamType = ptUnknown
      end>
    object qryAjustarValorUltimaCompravalorultimacompra: TFloatField
      FieldName = 'valorultimacompra'
    end
  end
  object dsrAjustarValorUltimaCompra: TtecDataSource
    DataSet = qryAjustarValorUltimaCompra
    Left = 720
    Top = 40
  end
  object qryAtualizaValorUltimaCompra: TtecQuery
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
      'UPDATE estoques'
      'SET valorultimacompra = :valor'
      'WHERE produto = :produto')
    RequestLive = False
    Left = 872
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'valor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end>
  end
  object qryPrecosClientes: TtecQuery
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
      'select cp.produto,'
      '       cp.cliente,'
      
        '       (select cl.nome from clientes cl where cl.codigo = cp.cli' +
        'ente) as NomeCliente,'
      '       cp.produto_cliente,'
      '       cp.precocliente,'
      '       cp.valorultimavenda'
      'from clientesprodutos cp'
      'where cp.produto = :Produto')
    RequestLive = False
    Left = 544
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Produto'
        ParamType = ptUnknown
      end>
    object qryPrecosClientesproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryPrecosClientescliente: TIntegerField
      FieldName = 'cliente'
    end
    object qryPrecosClientesnomecliente: TStringField
      FieldName = 'nomecliente'
      Size = 50
    end
    object qryPrecosClientesproduto_cliente: TStringField
      FieldName = 'produto_cliente'
      Size = 30
    end
    object qryPrecosClientesprecocliente: TFloatField
      FieldName = 'precocliente'
    end
    object qryPrecosClientesvalorultimavenda: TFloatField
      FieldName = 'valorultimavenda'
    end
  end
  object dsrPrecosClientes: TtecDataSource
    DataSet = qryPrecosClientes
    Left = 568
    Top = 120
  end
  object qryModelosCaracteristicas: TtecQuery
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
      'select mc.*,'
      '          m.descricao as descricaomodelo,'
      '          m.especificacao,'
      '          m.observacao'
      
        'from modeloscaracteristicas mc join modelos m on mc.modelo = m.c' +
        'odigo'
      
        'where mc.caracteristica = (select p.caracteristica from produtos' +
        ' p where p.codigo = :codigo)'
      'order by m.descricao, m.especificacao')
    RequestLive = True
    Left = 616
    Top = 254
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryModelosCaracteristicascaracteristica: TLargeintField
      FieldName = 'caracteristica'
      ReadOnly = True
      Required = True
    end
    object qryModelosCaracteristicasmodelo: TIntegerField
      FieldName = 'modelo'
    end
    object qryModelosCaracteristicasdescricaomodelo: TStringField
      FieldName = 'descricaomodelo'
      Size = 50
    end
    object qryModelosCaracteristicasespecificacao: TStringField
      FieldName = 'especificacao'
      ReadOnly = True
      Size = 50
    end
    object qryModelosCaracteristicasobservacao: TStringField
      FieldName = 'observacao'
      ReadOnly = True
      Size = 100
    end
  end
  object dsrModelosCaracteristicas: TtecDataSource
    DataSet = qryModelosCaracteristicas
    Left = 632
    Top = 262
  end
  object qryConsultaProdutosPedidos: TtecQuery
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
      ';'
      'select * from'
      '('
      'SELECT pp.pedido,'
      '       pp.produto,'
      '       pp.quantidade,'
      '       coalesce(pp.dataentrega,p.entrega) as entrega,'
      '       p.filialentrega,'
      
        '       pedidos_estoquepedido_semnotaparcial(pp.produto,p.filiale' +
        'ntrega,pp.pedido) as quantidadependente'
      ''
      'FROM produtospedidos pp join pedidos p'
      '     ON pp.pedido = p.numero and p.situacao in ('#39'A'#39', '#39'P'#39')'
      ''
      ''
      'WHERE pp.produto = :produto'
      ') as selecao'
      'where selecao.quantidadependente >0')
    RequestLive = False
    Left = 62
    Top = 545
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qryConsultaProdutosPedidospedido: TIntegerField
      FieldName = 'pedido'
    end
    object qryConsultaProdutosPedidosproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryConsultaProdutosPedidosquantidade: TFloatField
      FieldName = 'quantidade'
    end
    object qryConsultaProdutosPedidosentrega: TDateField
      FieldName = 'entrega'
    end
    object qryConsultaProdutosPedidosquantidadependente: TFloatField
      FieldName = 'quantidadependente'
    end
    object qryConsultaProdutosPedidosfilialentrega: TIntegerField
      FieldName = 'filialentrega'
    end
  end
  object dsrConsultaProdutosPedidos: TtecDataSource
    DataSet = qryConsultaProdutosPedidos
    Left = 176
    Top = 544
  end
  object qryColunasPrecos: TtecQuery
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
      ';'
      'select * from'
      '('
      'select colunasprecos.caracteristica,'
      '         colunasprecos.preco,'
      '         colunasprecos.coluna,'
      '         colunasprecos.data,'
      '         colunasprecos.valor,'
      '         colunasprecos.validade,'
      '         colunasprecos.alteracao,'
      
        '         (select colunas.descricao from colunas where colunas.co' +
        'digo = colunasprecos.coluna) as colunasdescricao'
      'from colunasprecos'
      'where colunasprecos.caracteristica = :caracteristica and'
      '          colunasprecos.preco = :preco'
      ') as sel'
      'ORDER BY colunasdescricao')
    RequestLive = True
    Left = 312
    Top = 280
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'caracteristica'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'preco'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryColunasPrecoscaracteristica: TLargeintField
      DisplayLabel = 'Caracter'#237'stica'
      FieldName = 'caracteristica'
    end
    object qryColunasPrecospreco: TIntegerField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'preco'
    end
    object qryColunasPrecoscoluna: TIntegerField
      DisplayLabel = 'Coluna'
      FieldName = 'coluna'
      Required = True
    end
    object qryColunasPrecosdata: TDateField
      DisplayLabel = 'Data'
      FieldName = 'data'
    end
    object qryColunasPrecosvalor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'valor'
      Required = True
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryColunasPrecosvalidade: TDateField
      DisplayLabel = 'Validade'
      FieldName = 'validade'
    end
    object qryColunasPrecoscolunasdescricao: TStringField
      FieldName = 'colunasdescricao'
      Size = 15
    end
    object qryColunasPrecosalteracao: TDateField
      FieldName = 'alteracao'
    end
  end
  object dsrColunasPrecos: TtecDataSource
    DataSet = qryColunasPrecos
    Left = 328
    Top = 296
  end
  object qryConsultaEstoquesComponentes: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryConsultaEstoquesComponentesAfterOpen
    AfterScroll = qryConsultaEstoquesComponentesAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LotesProdutos'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';select *,'
      
        '       (select f.nome from fornecedores f where f.codigo = (sele' +
        'ct np.fornecedor from notaspag np where np.codigo = codigonotaen' +
        'trada)) as nomefornecedor,'
      
        '       (select pnp.incidencia from produtosnotaspag pnp where pn' +
        'p.codigonota = codigonotaentrada and pnp.produto = temp.produto ' +
        'limit 1) as cst_nfentrada,'
      
        '       (select pnp.csosn from produtosnotaspag pnp where pnp.cod' +
        'igonota = codigonotaentrada and pnp.produto = temp.produto limit' +
        ' 1) as csosn_nfentrada,'
      
        '       (select pnp.cst_nf from produtosnotaspag pnp where pnp.co' +
        'digonota = codigonotaentrada and pnp.produto = temp.produto limi' +
        't 1) as cst_nf,'
      
        '       (select pnp.csosn_nf from produtosnotaspag pnp where pnp.' +
        'codigonota = codigonotaentrada and pnp.produto = temp.produto li' +
        'mit 1) as csosn_nf,'
      
        '       case when (select f.nosimples from fornecedores f where f' +
        '.codigo = (select np.fornecedor from notaspag np where np.codigo' +
        ' = codigonotaentrada)) = null then False'
      
        '            else (select f.nosimples from fornecedores f where f' +
        '.codigo = (select np.fornecedor from notaspag np where np.codigo' +
        ' = codigonotaentrada)) end  as fornecedornosimples,'
      '       cast(null as date) as validade,     '
      '       cast(null as varchar(20)) as nrlote     '
      'from'
      '(Select  e.produto,'
      '        p.CodigoVisual as ProdutoVisual,'
      '        e.filial,'
      '        f.nome as nomefilial,'
      '        e.localizacao,'
      '        e.minimo,'
      '        e.maximo,'
      '        e.precosemicms,'
      '        e.precocomicms,'
      
        '        CASE WHEN c.csosn in ('#39'101'#39','#39'102'#39') THEN e.valorultimacom' +
        'pra + (e.precocomicms-e.precosemicms) ELSE e.valorultimacompra E' +
        'ND as ultimacompra_com_icms,'
      '        e.financeiro,'
      
        '        case when (e.emestoque+e.reservado+e.reservaprevia+e.tra' +
        'nsito+e.demonstracao+e.conserto+e.danificada) = 0  then 0'
      
        '                 else round(e.financeiro / (e.emestoque+e.reserv' +
        'ado+e.reservaprevia+e.transito+e.demonstracao+e.conserto+e.danif' +
        'icada), 2)'
      '        end as customedio,'
      '        e.aliquotaipi,'
      '        e.datacompra,'
      '        e.qtdecompra,'
      '        e.ultimaentrada,'
      '        e.ultimavenda,'
      '        e.emestoque,'
      '        e.reservado,'
      '        e.reservaprevia,'
      '        e.demonstracao,'
      '        e.transito,'
      '        e.conserto,'
      '        e.danificada,'
      '        e.futuro,'
      '        (select max(np.codigo)'
      '         from notaspag np'
      '         where np.codigo in (select pn.codigonota'
      '                             from produtosnotaspag pn'
      '                             where pn.produto  = e.produto'
      
        '                              and ehnotafiscalentradacompra(codi' +
        'gofiscal)) and np.tipofornecedor <> '#39'L'#39') as codigonotaentrada,'
      '        e.estoquefisico,'
      
        '        (select estoques_produtoempromocao(e.produto,e.filial)) ' +
        'as produtoempromocao,'
      
        '        (select estoques_produtoinativo(e.produto)) as produtoin' +
        'ativo,'
      
        '        (select estoques_produtoforalinha(e.produto)) as produto' +
        'foralinha,'
      
        '        (e.emestoque + e.reservado + e.reservaprevia) as estoque' +
        'venda,'
      
        '        (e.emestoque + e.reservado + e.reservaprevia + e.transit' +
        'o + e.demonstracao + e.conserto + e.danificada) as estoquetotal,'
      '        f.preconormal,'
      '        f.precopromocao,'
      '        p.caracteristica,'
      '        c.descricao as descricaocaracteristica,'
      '        p.preco,'
      '        p.descricao  as descproduto,'
      '        p.referencia,'
      '        m.descricao as descmarca,'
      '        p.promocao,'
      '        pro.descricao as descricaopromocao,'
      
        '        (select descricao from grades where grades.codigo = c.gr' +
        'ade1) as linha,'
      
        '        (select descricao from grades where grades.codigo = c.gr' +
        'ade2) as coluna,'
      '        p.valorgrade1,'
      '        p.valorgrade2,'
      '        c.peso,'
      '        pc.quantidade,'
      '        pc.unidade,'
      '        pc.preco,'
      '        (pc.quantidade * pc.preco) as total,'
      '        c.csosn,'
      
        '        (select ti.valor from tributosicms ti where ti.codigo = ' +
        'c.incidencia) as incidencia,'
      '        true as composto,'
      '        true as composto2,'
      '        c.grupo,'
      '        g.descricao as descricaogrupo,'
      '        i.classificacaofiscal,'
      ''
      '                       /*'
      
        '        (select CAST(string_agg(CAST(coalesce(mo.descricao,'#39#39')||' +
        #39': '#39'||coalesce(mo.especificacao,'#39#39') as varchar),'#39', '#39') as varchar' +
        '(500))'
      '         from modelos mo'
      '         where mo.codigo in (select mc.modelo'
      '                             from modeloscaracteristicas mc'
      
        '                             where mc.caracteristica = c.codigo)' +
        ') as modelos_agg */'
      ''
      
        '        (select CAST(string_agg(DISTINCT mo.descricao,'#39', '#39') as v' +
        'archar(500))'
      '         from modelos mo'
      '         where mo.codigo in (select mc.modelo'
      '                             from modeloscaracteristicas mc'
      
        '                             where mc.caracteristica = c.codigo)' +
        ') as modelos_agg,'
      ''
      
        '        (select CAST(string_agg(DISTINCT mo.especificacao,'#39', '#39') ' +
        'as varchar(500))'
      '         from modelos mo'
      '         where mo.codigo in (select mc.modelo'
      '                             from modeloscaracteristicas mc'
      
        '                             where mc.caracteristica = c.codigo)' +
        ') as especificacao_agg'
      ''
      ''
      'From  produtoscompostos pc'
      
        '      JOIN (produtos p left join promocoes pro on p.promocao = p' +
        'ro.codigo)'
      #9'       JOIN caracteristicas c'
      '              join marcas m'
      '              on c.marca = m.codigo'
      ''
      '              join grupos g'
      '              on c.grupo = g.codigo'
      ''
      '              join ipi i'
      '              on c.ipi = i.codigo'
      ''
      #9#9'   on p.caracteristica = c.codigo'
      #9'  on p.codigo = pc.componente'
      ''
      #9'  join estoques e'
      '           join filiais f'
      '           on e.filial = f.codigo'
      #9'  on pc.componente = e.produto'
      ''
      'WHERE pc.composto = :composto'
      ''
      '%Filial'
      '%LotesProdutos'
      ''
      'Order By UPPER(TO_ASCII(p.descricao, '#39'latin1'#39')),e.filial'
      ') as temp')
    RequestLive = True
    Left = 72
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'composto'
        ParamType = ptUnknown
      end>
    object qryConsultaEstoquesComponentesproduto: TLargeintField
      FieldName = 'produto'
      Required = True
    end
    object qryConsultaEstoquesComponentesprodutovisual: TStringField
      FieldName = 'produtovisual'
      Required = True
      Size = 30
    end
    object qryConsultaEstoquesComponentesfilial: TIntegerField
      FieldName = 'filial'
      Required = True
    end
    object qryConsultaEstoquesComponentesnomefilial: TStringField
      FieldName = 'nomefilial'
      Required = True
      Size = 60
    end
    object qryConsultaEstoquesComponenteslocalizacao: TStringField
      FieldName = 'localizacao'
    end
    object qryConsultaEstoquesComponentesminimo: TFloatField
      FieldName = 'minimo'
    end
    object qryConsultaEstoquesComponentesmaximo: TFloatField
      FieldName = 'maximo'
    end
    object qryConsultaEstoquesComponentesprecosemicms: TFloatField
      FieldName = 'precosemicms'
    end
    object qryConsultaEstoquesComponentesprecocomicms: TFloatField
      FieldName = 'precocomicms'
    end
    object qryConsultaEstoquesComponentesfinanceiro: TFloatField
      FieldName = 'financeiro'
    end
    object qryConsultaEstoquesComponentescustomedio: TFloatField
      FieldName = 'customedio'
    end
    object qryConsultaEstoquesComponentesaliquotaipi: TFloatField
      FieldName = 'aliquotaipi'
    end
    object qryConsultaEstoquesComponentesdatacompra: TDateField
      FieldName = 'datacompra'
    end
    object qryConsultaEstoquesComponentesqtdecompra: TFloatField
      FieldName = 'qtdecompra'
    end
    object qryConsultaEstoquesComponentesultimaentrada: TDateField
      FieldName = 'ultimaentrada'
    end
    object qryConsultaEstoquesComponentesultimavenda: TDateField
      FieldName = 'ultimavenda'
    end
    object qryConsultaEstoquesComponentesemestoque: TFloatField
      FieldName = 'emestoque'
      Required = True
    end
    object qryConsultaEstoquesComponentesreservado: TFloatField
      FieldName = 'reservado'
      Required = True
    end
    object qryConsultaEstoquesComponentesreservaprevia: TFloatField
      FieldName = 'reservaprevia'
      Required = True
    end
    object qryConsultaEstoquesComponentesdemonstracao: TFloatField
      FieldName = 'demonstracao'
      Required = True
    end
    object qryConsultaEstoquesComponentestransito: TFloatField
      FieldName = 'transito'
      Required = True
    end
    object qryConsultaEstoquesComponentesconserto: TFloatField
      FieldName = 'conserto'
      Required = True
    end
    object qryConsultaEstoquesComponentesdanificada: TFloatField
      FieldName = 'danificada'
      Required = True
    end
    object qryConsultaEstoquesComponentesfuturo: TFloatField
      FieldName = 'futuro'
      Required = True
    end
    object qryConsultaEstoquesComponentesestoquefisico: TFloatField
      FieldName = 'estoquefisico'
      Required = True
    end
    object qryConsultaEstoquesComponentesprodutoempromocao: TBooleanField
      FieldName = 'produtoempromocao'
    end
    object qryConsultaEstoquesComponentesprodutoinativo: TBooleanField
      FieldName = 'produtoinativo'
    end
    object qryConsultaEstoquesComponentesprodutoforalinha: TBooleanField
      FieldName = 'produtoforalinha'
    end
    object qryConsultaEstoquesComponentesestoquevenda: TFloatField
      FieldName = 'estoquevenda'
    end
    object qryConsultaEstoquesComponentesestoquetotal: TFloatField
      FieldName = 'estoquetotal'
    end
    object qryConsultaEstoquesComponentespreconormal: TIntegerField
      FieldName = 'preconormal'
      Required = True
    end
    object qryConsultaEstoquesComponentesprecopromocao: TIntegerField
      FieldName = 'precopromocao'
    end
    object qryConsultaEstoquesComponentescaracteristica: TLargeintField
      FieldName = 'caracteristica'
      Required = True
    end
    object qryConsultaEstoquesComponentesdescricaocaracteristica: TStringField
      FieldName = 'descricaocaracteristica'
      Required = True
      Size = 100
    end
    object qryConsultaEstoquesComponentespreco: TIntegerField
      FieldName = 'preco'
    end
    object qryConsultaEstoquesComponentesdescproduto: TStringField
      FieldName = 'descproduto'
      Required = True
      Size = 100
    end
    object qryConsultaEstoquesComponentesreferencia: TStringField
      FieldName = 'referencia'
      Size = 15
    end
    object qryConsultaEstoquesComponentesdescmarca: TStringField
      FieldName = 'descmarca'
      Size = 15
    end
    object qryConsultaEstoquesComponenteslinha: TStringField
      FieldName = 'linha'
      Size = 40
    end
    object qryConsultaEstoquesComponentescoluna: TStringField
      FieldName = 'coluna'
      Size = 40
    end
    object qryConsultaEstoquesComponentesvalorgrade1: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade1'
      Size = 30
    end
    object qryConsultaEstoquesComponentesvalorgrade2: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade2'
      Size = 30
    end
    object qryConsultaEstoquesComponentespeso: TFloatField
      FieldName = 'peso'
    end
    object qryConsultaEstoquesComponentesquantidade: TFloatField
      FieldName = 'quantidade'
    end
    object qryConsultaEstoquesComponentesunidade: TStringField
      FieldName = 'unidade'
      Size = 8
    end
    object qryConsultaEstoquesComponentespreco_1: TFloatField
      FieldName = 'preco_1'
    end
    object qryConsultaEstoquesComponentestotal: TFloatField
      FieldName = 'total'
    end
    object qryConsultaEstoquesComponentescsosn: TStringField
      FieldName = 'csosn'
      Size = 3
    end
    object qryConsultaEstoquesComponentesincidencia: TStringField
      FieldName = 'incidencia'
      Size = 2
    end
    object qryConsultaEstoquesComponentescodigonotaentrada: TIntegerField
      FieldName = 'codigonotaentrada'
    end
    object qryConsultaEstoquesComponentesnomefornecedor: TStringField
      FieldName = 'nomefornecedor'
      Size = 60
    end
    object qryConsultaEstoquesComponentescst_nfentrada: TStringField
      FieldName = 'cst_nfentrada'
      Size = 2
    end
    object qryConsultaEstoquesComponentescsosn_nfentrada: TStringField
      FieldName = 'csosn_nfentrada'
      Size = 3
    end
    object qryConsultaEstoquesComponentescst_nf: TStringField
      FieldName = 'cst_nf'
      Size = 2
    end
    object qryConsultaEstoquesComponentescsosn_nf: TStringField
      FieldName = 'csosn_nf'
      Size = 3
    end
    object qryConsultaEstoquesComponentesfornecedornosimples: TBooleanField
      FieldName = 'fornecedornosimples'
    end
    object qryConsultaEstoquesComponentesultimacompra_com_icms: TFloatField
      FieldName = 'ultimacompra_com_icms'
    end
    object qryConsultaEstoquesComponentescomposto: TBooleanField
      FieldName = 'composto'
    end
    object qryConsultaEstoquesComponentescomposto2: TBooleanField
      FieldName = 'composto2'
    end
    object qryConsultaEstoquesComponentesgrupo: TStringField
      FieldName = 'grupo'
      Size = 4
    end
    object qryConsultaEstoquesComponentesdescricaogrupo: TStringField
      FieldName = 'descricaogrupo'
      Size = 30
    end
    object qryConsultaEstoquesComponentesclassificacaofiscal: TStringField
      FieldName = 'classificacaofiscal'
      Size = 8
    end
    object qryConsultaEstoquesComponentespromocao: TIntegerField
      FieldName = 'promocao'
    end
    object qryConsultaEstoquesComponentesdescricaopromocao: TStringField
      FieldName = 'descricaopromocao'
      Size = 100
    end
    object qryConsultaEstoquesComponentesmodelos_agg: TStringField
      FieldName = 'modelos_agg'
      Size = 500
    end
    object qryConsultaEstoquesComponentesespecificacao_agg: TStringField
      FieldName = 'especificacao_agg'
      Size = 500
    end
    object qryConsultaEstoquesComponentesnrlote: TStringField
      FieldName = 'nrlote'
    end
    object qryConsultaEstoquesComponentesvalidade: TDateField
      FieldName = 'validade'
    end
  end
  object qryEstoque: TtecQuery
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
      'Select filial,'
      '           emestoque'
      'From   estoques'
      'Where (produto =:produto) and coalesce(emestoque,0)<>0 '
      
        '/*           and  (filial in (Select codigo  From filiais  Where' +
        ' (tipofilial = '#39'D'#39')))  */'
      'order by filial')
    RequestLive = False
    Left = 584
    Top = 400
    ParamData = <
      item
        DataType = ftString
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qryEstoquefilial: TIntegerField
      DisplayLabel = 'FILIAL'
      FieldName = 'filial'
    end
    object qryEstoqueemestoque: TFloatField
      DisplayLabel = 'EM ESTOQUE'
      FieldName = 'emestoque'
    end
  end
  object dsrEstoque: TtecDataSource
    DataSet = qryEstoque
    Left = 592
    Top = 416
  end
  object qryAtualizarEstoque: TtecQuery
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
      'UPDATE estoques'
      'SET /* localizacao = :localizacao, */'
      '    maximo = :maximo,'
      '    minimo = :minimo'
      'WHERE produto = :produto'
      '  and filial = :filial')
    RequestLive = False
    Left = 872
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'localizacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'maximo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'minimo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end>
  end
  object qryFornecedoresProdutos: TtecQuery
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
      '/* EXPLAIN (ANALYZE, COSTS, VERBOSE, BUFFERS, FORMAT JSON) */'
      ''
      'select nfp.*,'
      '       m.precocomicms AS precoultimaentrada,'
      
        '       (m.precocomicms + ((m.precocomicms * coalesce(m.aliquotai' +
        'pi, 0)) / 100)) as precoipiultimaentrada,'
      '       m.aliquotaipi AS ipiultimaentrada,'
      '       m.data AS dataultimaentrada'
      '       '
      'FROM'
      '('
      ' '
      'select fp.caracteristica,'
      '       fp.fornecedor,'
      '       fp.referencia,'
      '       fp.data,'
      '       fp.preco,'
      '       fp.ipi,'
      '       fp.observacao,'
      '       0.00 AS precocomipi,'
      '       f.razao,'
      '       fp.geradocadastro,'
      '       nfp.codigonota'
      '       '
      
        'from fornecedoresprodutos fp join fornecedores f on fp.fornecedo' +
        'r = f.codigo'
      '      left join'
      '      '
      '      ('
      '       select max(np.codigo) as codigonota, np.fornecedor '
      '       from notaspag np '
      '         join produtosnotaspag pnp'
      '              join produtos p'
      '              on pnp.produto = p.codigo'
      '              '
      '         on np.codigo = pnp.codigonota'
      '         '
      '         join fornecedoresprodutos fp'
      '         on p.caracteristica = fp.caracteristica'
      '         and np.fornecedor = fp.fornecedor'
      '               '
      '       where p.codigo = :produto'
      '         and fp.caracteristica = :caracteristica'
      '         and ehnotafiscalentradacompra(pnp.codigofiscal)'
      '       group by np.fornecedor'
      '      ) as nfp on nfp.fornecedor = fp.fornecedor'
      'where fp.caracteristica = :caracteristica'
      ') as nfp left join movimentos m '
      '    on m.produto = :produto'
      '   and (substr(m.operacao, 11, 1) <> '#39'*'#39')'
      '   and (m.codigonota = nfp.codigonota)'
      ''
      '')
    RequestLive = True
    Left = 272
    Top = 72
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftLargeint
        Name = 'Caracteristica'
        ParamType = ptUnknown
      end>
    object qryFornecedoresProdutoscaracteristica: TLargeintField
      DisplayLabel = 'Caracter'#237'stica'
      FieldName = 'caracteristica'
    end
    object qryFornecedoresProdutosfornecedor: TIntegerField
      DisplayLabel = 'Fornecedor'
      FieldName = 'fornecedor'
      Required = True
      DisplayFormat = '0'
    end
    object qryFornecedoresProdutosreferencia: TStringField
      DisplayLabel = 'Refer'#234'ncia'
      FieldName = 'referencia'
      Size = 15
    end
    object qryFornecedoresProdutosrazao: TStringField
      DisplayLabel = 'Raz'#227'o'
      DisplayWidth = 40
      FieldName = 'razao'
      Size = 60
    end
    object qryFornecedoresProdutosdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object qryFornecedoresProdutospreco: TFloatField
      FieldName = 'preco'
      DisplayFormat = '0.00'
    end
    object qryFornecedoresProdutosipi: TFloatField
      FieldName = 'ipi'
      DisplayFormat = '0.00'
    end
    object qryFornecedoresProdutosobservacao: TStringField
      FieldName = 'observacao'
      Size = 100
    end
    object qryFornecedoresProdutosprecocomipi: TFloatField
      FieldKind = fkCalculated
      FieldName = 'precocomipi'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryFornecedoresProdutosprecoultimaentrada: TFloatField
      FieldName = 'precoultimaentrada'
      DisplayFormat = '0.00'
    end
    object qryFornecedoresProdutosprecoipiultimaentrada: TFloatField
      FieldName = 'precoipiultimaentrada'
      DisplayFormat = '0.00'
    end
    object qryFornecedoresProdutosipiultimaentrada: TFloatField
      FieldName = 'ipiultimaentrada'
      DisplayFormat = '0.00'
    end
    object qryFornecedoresProdutosdataultimaentrada: TDateField
      Alignment = taCenter
      FieldName = 'dataultimaentrada'
      EditMask = '99/99/9999;1; '
    end
    object qryFornecedoresProdutosgeradocadastro: TBooleanField
      FieldName = 'geradocadastro'
    end
  end
  object dsrFornecedoresProdutos: TtecDataSource
    DataSet = qryFornecedoresProdutos
    Left = 288
    Top = 88
  end
  object qryFornecedoresProdutos_slow: TtecQuery
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
      'Select  fp.caracteristica,'
      '            fp.fornecedor,'
      '            fp.referencia,'
      '            fp.data,'
      '            fp.preco,'
      '            fp.ipi,'
      '            fp.observacao,'
      '            0.00 as precocomipi,'
      '            f.razao,'
      '            fp.geradocadastro,'
      '            (Select m.precocomicms From movimentos m '
      
        '                                                    Where (m.num' +
        'ero = (Select max(m1.numero) From movimentos m1, notaspag n'
      
        '                                                                ' +
        '                                                              Wh' +
        'ere (m1.produto =:produto) and'
      
        '                                                                ' +
        '                                                                ' +
        '         (substr(m1.operacao,11,1) <> '#39'*'#39') and'
      
        '                                                                ' +
        '                                                                ' +
        '         (m1.codigonota = n.codigo) and'
      
        '                                                                ' +
        '                                                                ' +
        '         (n.fornecedor = fp.fornecedor)))) as precoultimaentrada' +
        ','
      
        '            (Select (m.precocomicms + ((m.precocomicms * coalesc' +
        'e(m.aliquotaipi,0)) / 100)) From movimentos m '
      
        '                                                    Where (m.num' +
        'ero = (Select max(m1.numero) From movimentos m1, notaspag n'
      
        '                                                                ' +
        '                                                              Wh' +
        'ere (m1.produto =:produto) and'
      
        '                                                                ' +
        '                                                                ' +
        '         (substr(m1.operacao,11,1) <> '#39'*'#39') and'
      
        '                                                                ' +
        '                                                                ' +
        '         (m1.codigonota = n.codigo) and'
      
        '                                                                ' +
        '                                                                ' +
        '         (n.fornecedor = fp.fornecedor)))) as precoipiultimaentr' +
        'ada,'
      '            (Select m.aliquotaipi From movimentos m '
      
        '                                             Where (m.numero = (' +
        'Select max(m1.numero) From movimentos m1, notaspag n'
      
        '                                                                ' +
        '                                                       Where (m1' +
        '.produto =:produto) and'
      
        '                                                                ' +
        '                                                                ' +
        '   (substr(m1.operacao,11,1) <> '#39'*'#39') and'
      
        '                                                                ' +
        '                                                                ' +
        '   (m1.codigonota = n.codigo) and'
      
        '                                                                ' +
        '                                                                ' +
        '   (n.fornecedor = fp.fornecedor)))) as ipiultimaentrada,'
      '            (Select m.data From movimentos m '
      
        '                                    Where (m.numero = (Select ma' +
        'x(m1.numero) From movimentos m1, notaspag n'
      
        '                                                                ' +
        '                                              Where (m1.produto ' +
        '=:produto) and'
      
        '                                                                ' +
        '                                                         (substr' +
        '(m1.operacao,11,1) <> '#39'*'#39') and'
      
        '                                                                ' +
        '                                                         (m1.cod' +
        'igonota = n.codigo) and'
      
        '                                                                ' +
        '                                                         (n.forn' +
        'ecedor = fp.fornecedor)))) as dataultimaentrada'
      'From   fornecedoresprodutos fp, fornecedores f'
      'Where (fp.fornecedor = f.codigo)   and'
      '           (fp.caracteristica =: caracteristica)')
    RequestLive = True
    Left = 848
    Top = 432
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftLargeint
        Name = 'Caracteristica'
        ParamType = ptUnknown
      end>
    object LargeintField1: TLargeintField
      DisplayLabel = 'Caracter'#237'stica'
      FieldName = 'caracteristica'
    end
    object IntegerField1: TIntegerField
      DisplayLabel = 'Fornecedor'
      FieldName = 'fornecedor'
      Required = True
      DisplayFormat = '0'
    end
    object StringField1: TStringField
      DisplayLabel = 'Refer'#234'ncia'
      FieldName = 'referencia'
      Size = 15
    end
    object StringField2: TStringField
      DisplayLabel = 'Raz'#227'o'
      FieldName = 'razao'
      Size = 40
    end
    object DateField1: TDateField
      Alignment = taCenter
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object FloatField1: TFloatField
      FieldName = 'preco'
      DisplayFormat = '0.00'
    end
    object FloatField2: TFloatField
      FieldName = 'ipi'
      DisplayFormat = '0.00'
    end
    object StringField3: TStringField
      FieldName = 'observacao'
      Size = 100
    end
    object FloatField3: TFloatField
      FieldKind = fkCalculated
      FieldName = 'precocomipi'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object FloatField4: TFloatField
      FieldName = 'precoultimaentrada'
      DisplayFormat = '0.00'
    end
    object FloatField5: TFloatField
      FieldName = 'precoipiultimaentrada'
      DisplayFormat = '0.00'
    end
    object FloatField6: TFloatField
      FieldName = 'ipiultimaentrada'
      DisplayFormat = '0.00'
    end
    object DateField2: TDateField
      Alignment = taCenter
      FieldName = 'dataultimaentrada'
      EditMask = '99/99/9999;1; '
    end
    object BooleanField1: TBooleanField
      FieldName = 'geradocadastro'
    end
  end
  object dsrConsultaProdutosEntradaSefaz: TtecDataSource
    DataSet = qryConsultaProdutosEntradaSefaz
    Left = 408
    Top = 512
  end
  object qryConsultaProdutosEntradaSefaz: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select nsus.*'
      'from'
      '('
      
        'select distinct fi.codigo as filial, f.codigo as fornecedor, coa' +
        'lesce(f.nome,f.razao) as nomefornecedor,'
      
        '       cast(substring(nsus.chnfe from 23 for 3) as varchar(3)) a' +
        's serie,'
      
        '       cast(substring(nsus.chnfe from 26 for 9) as integer) as n' +
        'rnfe,'
      '       '
      ''
      
        '       case when nsus.cSitNFe = '#39'1'#39' then cast('#39'AUTORIZADA'#39' as va' +
        'rchar(10))'
      
        '            when nsus.cSitNFe = '#39'2'#39' then cast('#39'DENEGADA'#39' as varc' +
        'har(10))'
      
        '            when nsus.cSitNFe = '#39'3'#39' then cast('#39'CANCELADA'#39' as var' +
        'char(10))'
      '       end as nomecSifNFe,'
      '       '
      '       cast(nsus.dhemi as timestamp) as dhemi,'
      '       '
      '/*       '
      '       pf.produtovisual,'
      '       pf.descricaoproduto,'
      '       */'
      '       '
      '       nsus_prod.xprod as descricaoprodutonfe,'
      '       nsus_prod.ucom,'
      '       nsus_prod.qcom,'
      '       nsus_prod.vuncom,'
      '       nsus_prod.vfrete,'
      '       nsus_prod.vseg,'
      '       nsus_prod.vdesc,'
      '       nsus_prod.voutro,'
      '       '
      '       nsus.cSitNFe,'
      '       nsus.tipo,'
      '       nsus.chnfe,'
      '       nsus.nsu'
      '       '
      '      '
      ''
      'from (((nsus '
      '      join nsus_prod'
      '      on nsus.cnpj = nsus_prod.cnpj and'
      '         nsus.nsu = nsus_prod.nsu and'
      '         nsus.tipo = nsus_prod.tipo)'
      '      join fornecedores f'
      '      on nsus.cnpjemitente = f.pessoanumero)'
      '      join filiais fi'
      '      on nsus.cnpj = fi.cnpj),'
      '         '
      '      (select pf.produto, '
      '             p.codigovisual as produtovisual, '
      '             p.descricao as descricaoproduto, '
      '             pf.fornecedor,'
      '             pf.tipofornecedor,'
      '             pf.produtonofornecedor,'
      '             pf.descricaonofornecedor,'
      '             pf.infadprod'
      '      from produtosfornecedores pf'
      '           join produtos p'
      '           on pf.produto = p.codigo'
      '      where produto = :produto) as pf,'
      ''
      '      (select pcb.codigobarras'
      '       from produtoscodigobarras pcb'
      '       where pcb.produto = :produto) as pcb'
      '       '
      ''
      'where true'
      '  and nsus.tipoxmlretorno = '#39'resNFe'#39
      '  and nsus.tipo in ('#39'NFE'#39', '#39'NFCe'#39')'
      '  and nsus.xmlnfe is not null'
      
        '  and not exists (select np.chv_nfe from notaspag np where np.ch' +
        'v_nfe = nsus.chnfe) '
      '  and (nsus_prod.cprod = pf.produtonofornecedor or'
      '       nsus_prod.xprod = pf.descricaonofornecedor or'
      '       nsus_prod.infadprod = pf.infadprod or'
      '       nsus_prod.ceantrib = pcb.codigobarras)'
      ''
      '   and pf.fornecedor = coalesce(f.codigo, pf.fornecedor)'
      '   and pf.tipofornecedor = '#39'F'#39
      ''
      ''
      ') as nsus'
      'where'
      ''
      '      not /* cancelada */'
      '   '
      '      case when nsus.cSitNFe = '#39'3'#39' then true'
      '           when nsus.tipo='#39'NFE'#39' then'
      ''
      '            coalesce((select true'
      '             from nsus nsus_c'
      '             where nsus_c.chnfe = nsus.chnfe'
      '               and nsus_c.nsu <> nsus.nsu'
      '               and nsus_c.tipo = '#39'NFE'#39
      '               and nsus_c.tipoxmlretorno = '#39'resEvento'#39
      '               and nsus_c.xmleveciencia is not null'
      
        '               and cast(cast((xpath('#39'//infEvento:tpEvento/text()' +
        '="110111"'#39' , cast(nsus_c.xmleveciencia as xml), ARRAY[ARRAY['#39'inf' +
        'Evento'#39','#39'http://www.portalfiscal.inf.br/nfe'#39']]))[1] as text) as ' +
        'boolean)),false)'
      ''
      '          when nsus.tipo='#39'CTE'#39' then'
      ''
      '            coalesce((select true'
      '             from nsus nsus_c'
      '             where nsus_c.chnfe = nsus.chnfe'
      '               and nsus_c.nsu <> nsus.nsu'
      '               and nsus_c.tipoxmlretorno = '#39'resEvento'#39
      '               and nsus_c.tipo = '#39'CTE'#39
      '               and nsus_c.xmleveciencia is not null'
      
        '               and cast(cast((xpath('#39'//infEvento:tpEvento/text()' +
        '="110111"'#39' , cast(nsus_c.xmleveciencia as xml), ARRAY[ARRAY['#39'inf' +
        'Evento'#39','#39'http://www.portalfiscal.inf.br/cte'#39']]))[1] as text) as ' +
        'boolean)),false)'
      ''
      '      end'
      ''
      ''
      'order by nsus.dhemi'
      ''
      ''
      ''
      ''
      '')
    RequestLive = False
    Left = 520
    Top = 496
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qryConsultaProdutosEntradaSefazfilial: TIntegerField
      DisplayLabel = 'FILIAL'
      FieldName = 'filial'
    end
    object qryConsultaProdutosEntradaSefazfornecedor: TIntegerField
      DisplayLabel = 'FORNECEDOR'
      FieldName = 'fornecedor'
    end
    object qryConsultaProdutosEntradaSefaznomefornecedor: TStringField
      DisplayLabel = 'NOME FORNECEDOR'
      FieldName = 'nomefornecedor'
      Size = 60
    end
    object qryConsultaProdutosEntradaSefazserie: TStringField
      DisplayLabel = 'S'#201'RIE'
      FieldName = 'serie'
      Size = 3
    end
    object qryConsultaProdutosEntradaSefaznrnfe: TIntegerField
      DisplayLabel = 'NR'#176'NFe'
      FieldName = 'nrnfe'
    end
    object qryConsultaProdutosEntradaSefaznomecsifnfe: TStringField
      DisplayLabel = 'SITUA'#199#195'O'
      FieldName = 'nomecsifnfe'
      Size = 50
    end
    object qryConsultaProdutosEntradaSefazdescricaoprodutonfe: TStringField
      DisplayLabel = 'DESCRI'#199#195'O PRODUTO NFe'
      FieldName = 'descricaoprodutonfe'
      Size = 120
    end
    object qryConsultaProdutosEntradaSefazucom: TStringField
      DisplayLabel = 'UN'
      FieldName = 'ucom'
      Size = 6
    end
    object qryConsultaProdutosEntradaSefazqcom: TFloatField
      DisplayLabel = 'QTDADE'
      FieldName = 'qcom'
    end
    object qryConsultaProdutosEntradaSefazvuncom: TFloatField
      DisplayLabel = 'VALOR'
      FieldName = 'vuncom'
    end
    object qryConsultaProdutosEntradaSefazvfrete: TFloatField
      DisplayLabel = 'FRETE'
      FieldName = 'vfrete'
    end
    object qryConsultaProdutosEntradaSefazvseg: TFloatField
      DisplayLabel = 'SEGURO'
      FieldName = 'vseg'
    end
    object qryConsultaProdutosEntradaSefazvdesc: TFloatField
      DisplayLabel = 'DESCONTO'
      FieldName = 'vdesc'
    end
    object qryConsultaProdutosEntradaSefazvoutro: TFloatField
      DisplayLabel = 'OUTROS'
      FieldName = 'voutro'
    end
    object qryConsultaProdutosEntradaSefazdhemi: TDateTimeField
      FieldName = 'dhemi'
      DisplayFormat = 'dd/MM/yyyy hh:mm'
    end
  end
  object qryConsultaEstoquesLotes: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeOpen = qryConsultaEstoquesLotesBeforeOpen
    AfterOpen = qryConsultaEstoquesLotesAfterOpen
    AfterCancel = BeforeDelete
    AfterScroll = qryConsultaEstoquesLotesAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LotesProdutos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Atributos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'quantidadetotaldoestoquelote'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ''
      '/* qryConsultaEstoquesLotes */'
      ''
      ''
      '  ;'
      '  select *,'
      
        '         (select f.nome from fornecedores f where f.codigo = (se' +
        'lect np.fornecedor from notaspag np where np.codigo = codigonota' +
        'entrada)) as nomefornecedor,'
      
        '         (select pnp.incidencia from produtosnotaspag pnp where ' +
        'pnp.codigonota = codigonotaentrada and pnp.produto = temp.produt' +
        'o limit 1) as cst_nfentrada,'
      
        '         (select pnp.csosn from produtosnotaspag pnp where pnp.c' +
        'odigonota = codigonotaentrada and pnp.produto = temp.produto lim' +
        'it 1) as csosn_nfentrada,'
      
        '         (select pnp.cst_nf from produtosnotaspag pnp where pnp.' +
        'codigonota = codigonotaentrada and pnp.produto = temp.produto li' +
        'mit 1) as cst_nf,'
      
        '         (select pnp.csosn_nf from produtosnotaspag pnp where pn' +
        'p.codigonota = codigonotaentrada and pnp.produto = temp.produto ' +
        'limit 1) as csosn_nf,'
      
        '         case when (select f.nosimples from fornecedores f where' +
        ' f.codigo = (select np.fornecedor from notaspag np where np.codi' +
        'go = codigonotaentrada)) = null then False'
      
        '              else (select f.nosimples from fornecedores f where' +
        ' f.codigo = (select np.fornecedor from notaspag np where np.codi' +
        'go = codigonotaentrada)) end  as fornecedornosimples'
      '  from'
      ''
      '  ('
      '      Select e.produto,'
      '              p.codigovisual as produtovisual,'
      '              l.nrlote,'
      '              l.validade,'
      '              e.filial,'
      '              f.nome as nomefilial,'
      '              e.localizacao,'
      '              e.minimo,'
      '              e.maximo,'
      '              e.precosemicms,'
      '              e.precocomicms,'
      
        '              CASE WHEN c.csosn in ('#39'101'#39','#39'102'#39') THEN e.valorult' +
        'imacompra + (e.precocomicms-e.precosemicms) ELSE e.valorultimaco' +
        'mpra END as ultimacompra_com_icms,'
      '              e.financeiro,'
      
        '              case when (e.emestoque+e.reservado+e.reservaprevia' +
        '+e.transito+e.demonstracao+e.conserto+e.danificada) = 0  then 0'
      
        '                   else round(e.financeiro / (e.emestoque+e.rese' +
        'rvado+e.reservaprevia+e.transito+e.demonstracao+e.conserto+e.dan' +
        'ificada), 2)'
      '              end as customedio,'
      '              e.aliquotaipi,'
      '              e.datacompra,'
      '              e.qtdecompra,'
      '              e.ultimaentrada,'
      '              e.ultimavenda,'
      ''
      '              e.emestoque,'
      '              e.reservado,'
      '              e.reservaprevia,'
      '              e.demonstracao,'
      '              e.transito,'
      '              e.conserto,'
      '              e.danificada,'
      '              e.futuro,'
      '              (select max(np.codigo)'
      '               from notaspag np'
      '               where np.codigo in (select pn.codigonota'
      '                                   from produtosnotaspag pn'
      '                                   where pn.produto  = e.produto'
      
        '                                    and ehnotafiscalentradacompr' +
        'a(codigofiscal)) and np.tipofornecedor <> '#39'L'#39') as codigonotaentr' +
        'ada, '
      
        '              (select estoques_produtoempromocao(e.produto,e.fil' +
        'ial)) as produtoempromocao,'
      
        '              (select estoques_produtoinativo(e.produto)) as pro' +
        'dutoinativo,'
      
        '              (select estoques_produtoforalinha(e.produto)) as p' +
        'rodutoforalinha,'
      
        '              (e.emestoque + e.reservado+e.reservaprevia) as est' +
        'oquevenda,'
      
        '              (e.emestoque + e.reservado + e.reservaprevia + e.t' +
        'ransito + e.demonstracao + e.conserto + e.danificada) as estoque' +
        'total,'
      '              f.preconormal,'
      '              f.precopromocao,'
      '              p.caracteristica,'
      '              c.descricao as descricaocaracteristica,'
      
        '              (select ti.valor from tributosicms ti where ti.cod' +
        'igo = c.incidencia) as incidencia,'
      '              c.csosn,'
      '              p.preco,'
      '              p.descricao  as descproduto,'
      '              p.referencia,'
      
        '              (select m.descricao from marcas m where m.codigo =' +
        ' c.marca) as descmarca,'
      '              c.grade1,'
      '              c.grade2,'
      
        '              (select descricao from grades where grades.codigo ' +
        '= c.grade1) as linha,'
      
        '              (select descricao from grades where grades.codigo ' +
        '= c.grade2) as coluna,'
      '              p.valorgrade1,'
      '              p.valorgrade2,'
      '              e.estoquefisico,'
      
        '              case when e.filial = :FilialBase then 0 else e.fil' +
        'ial end as sequencia,'
      
        '              (SELECT descricao FROM unidades WHERE codigo = c.u' +
        'nidade) AS unidade,'
      '              CAST(CASE WHEN c.producaopropria THEN '#39'P'#39
      '                                               ELSE '#39'T'#39
      '                   END AS CHAR) as producaopropria,'
      '              CAST(CASE WHEN :arredondamento THEN '#39'A'#39
      '                        ELSE '#39'T'#39
      '                   END AS CHAR) AS arredondamento,'
      ''
      ''
      
        '              CAST(CASE WHEN c.incidencia = 5           THEN '#39'I'#39 +
        '  /* 40'#9'Isenta */'
      ''
      '      /*'
      '      codigo'#9'valor'#9'descricao'
      
        '      4'#9'     30'#9'Isenta ou n'#227'o tributada e com cobran'#231'a do ICMS p' +
        'or substitui'#231#227'o tribut'#225'ria'
      '      6'#9'     41'#9'N'#227'o tributada'
      '      7'#9'     50'#9'Suspens'#227'o'
      '      11'#9'   90'#9'Outros'
      '      */'
      '                        WHEN c.incidencia in (4,6,7,11) THEN '#39'N'#39
      '      /*'
      '      codigo'#9'valor'#9'descricao'
      
        '      2'#9'     10'#9'Tributada e com cobran'#231'a do ICMS por substitui'#231#227 +
        'o tribut'#225'ria'
      
        '      9'#9'     60'#9'ICMS cobrado anteriormente por substitui'#231#227'o trib' +
        'ut'#225'ria'
      
        '      10'#9'   70'#9'Com redu'#231#227'o de base de c'#225'lculo e cobran'#231'a do ICMS' +
        ' por substitui'#231#227'o tribut'#225'ria'
      '      */'
      '                        WHEN c.incidencia in (2,9,10)   THEN '#39'F'#39
      '      /*'
      '      codigo'#9'valor'#9'descricao'
      '      1'#9'00'#9'Tributada integralmente'
      '      3'#9'20'#9'Com redu'#231#227'o de base de c'#225'lculo'
      '      8'#9'51'#9'Diferimento'
      '      */'
      '                        WHEN c.incidencia in (1,3,8)    THEN '#39'T'#39
      '                   END AS CHAR) AS situacaotributaria,'
      ''
      '              CodigoBarras(e.produto) as codigobarras,'
      '              c.cest,'
      '              i.classificacaofiscal,'
      '              c.peso,'
      '              c.composto,'
      '              c.composto2,'
      '              estoques_preco(e.produto,e.filial) as preco_atual,'
      '              c.grupo,'
      '              g.descricao as descricaogrupo,'
      '              p.promocao,'
      '              pro.descricao as descricaopromocao ,'
      '              e.sublocalizacao,'
      '              c.tipocomissao as tipocomissao_produto,'
      '              c.comissao as comissao_produto,'
      '              g.tipocomissao as tipocomissao_grupo,'
      '              g.comissao as comissao_grupo,'
      ''
      '              /*'
      
        '              (select CAST(string_agg(CAST(coalesce(mo.descricao' +
        ','#39#39')||'#39': '#39'||coalesce(mo.especificacao,'#39#39') as varchar),'#39', '#39') as v' +
        'archar(500))'
      '               from modelos mo'
      '               where mo.codigo in (select mc.modelo'
      
        '                                   from modeloscaracteristicas m' +
        'c'
      
        '                                   where mc.caracteristica = c.c' +
        'odigo)) as modelos_agg,'
      '               */'
      ''
      
        '              (select CAST(string_agg( distinct mo.descricao,'#39', ' +
        #39') as varchar(500))'
      '               from modelos mo'
      '               where mo.codigo in (select mc.modelo'
      
        '                                   from modeloscaracteristicas m' +
        'c'
      
        '                                   where mc.caracteristica = c.c' +
        'odigo)'
      '                                   ) as modelos_agg,'
      ''
      
        '              (select CAST(string_agg( distinct mo.especificacao' +
        ', '#39', '#39') as varchar(500))'
      '               from modelos mo'
      '               where mo.codigo in (select mc.modelo'
      
        '                                   from modeloscaracteristicas m' +
        'c'
      
        '                                   where mc.caracteristica = c.c' +
        'odigo)'
      '                                   ) as especificacao_agg'
      ''
      ''
      ''
      
        '      From   (estoqueslotes e join lotes l on e.lote = l.lote),f' +
        'iliais f, (produtos p left join promocoes pro on p.promocao = pr' +
        'o.codigo),'
      
        '             caracteristicas c, ipi i, grupos g, classes cl, mar' +
        'cas m'
      ''
      '      Where  (e.produto = p.codigo) and'
      '             (e.filial = f.codigo) and'
      '             (p.caracteristica = c.codigo) and'
      '             (i.codigo = c.ipi) and'
      '             (c.grupo = g.codigo) and'
      '             (c.classe = cl.codigo) and'
      '             (c.marca = m.codigo)'
      ''
      '        and e.produto = :produto'
      ''
      '      %Filial'
      '      %LotesProdutos'
      '      %Atributos'
      '      %quantidadetotaldoestoquelote'
      ''
      '      Order By UPPER(TO_ASCII(p.descricao,'#39'latin1'#39')), sequencia'
      '  ) as temp')
    RequestLive = False
    Left = 72
    Top = 417
    ParamData = <
      item
        DataType = ftString
        Name = 'FilialBase'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftUnknown
        Name = 'arredondamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qryConsultaEstoquesLotesproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryConsultaEstoquesLotesprodutovisual: TStringField
      FieldName = 'produtovisual'
      Size = 30
    end
    object qryConsultaEstoquesLotesfilial: TIntegerField
      FieldName = 'filial'
    end
    object qryConsultaEstoquesLotesnrlote: TStringField
      FieldName = 'nrlote'
    end
    object qryConsultaEstoquesLotesvalidade: TDateField
      FieldName = 'validade'
    end
    object qryConsultaEstoquesLoteslocalizacao: TStringField
      FieldName = 'localizacao'
    end
    object qryConsultaEstoquesLotesminimo: TFloatField
      FieldName = 'minimo'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesLotesmaximo: TFloatField
      FieldName = 'maximo'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesLotesprecosemicms: TFloatField
      FieldName = 'precosemicms'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesLotesprecocomicms: TFloatField
      FieldName = 'precocomicms'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesLotesultimacompra_com_icms: TFloatField
      FieldName = 'ultimacompra_com_icms'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesLotesfinanceiro: TFloatField
      FieldName = 'financeiro'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesLotescustomedio: TFloatField
      FieldName = 'customedio'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesLotesaliquotaipi: TFloatField
      FieldName = 'aliquotaipi'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesLotesdatacompra: TDateField
      Alignment = taCenter
      FieldName = 'datacompra'
      EditMask = '99/99/9999;1; '
    end
    object qryConsultaEstoquesLotesqtdecompra: TFloatField
      FieldName = 'qtdecompra'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesLotesultimaentrada: TDateField
      Alignment = taCenter
      FieldName = 'ultimaentrada'
      EditMask = '99/99/9999;1; '
    end
    object qryConsultaEstoquesLotesultimavenda: TDateField
      Alignment = taCenter
      FieldName = 'ultimavenda'
      EditMask = '99/99/9999;1; '
    end
    object qryConsultaEstoquesLotesemestoque: TFloatField
      FieldName = 'emestoque'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesLotesreservado: TFloatField
      FieldName = 'reservado'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesLotesreservaprevia: TFloatField
      FieldName = 'reservaprevia'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesLotesdemonstracao: TFloatField
      FieldName = 'demonstracao'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesLotestransito: TFloatField
      FieldName = 'transito'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesLotesconserto: TFloatField
      FieldName = 'conserto'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesLotesdanificada: TFloatField
      FieldName = 'danificada'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesLotesfuturo: TFloatField
      FieldName = 'futuro'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesLotescodigonotaentrada: TIntegerField
      FieldName = 'codigonotaentrada'
    end
    object qryConsultaEstoquesLotesprodutoempromocao: TBooleanField
      FieldName = 'produtoempromocao'
    end
    object qryConsultaEstoquesLotesprodutoinativo: TBooleanField
      FieldName = 'produtoinativo'
    end
    object qryConsultaEstoquesLotesprodutoforalinha: TBooleanField
      FieldName = 'produtoforalinha'
    end
    object qryConsultaEstoquesLotesestoquevenda: TFloatField
      FieldName = 'estoquevenda'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesLotesestoquetotal: TFloatField
      FieldName = 'estoquetotal'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesLotespreconormal: TIntegerField
      FieldName = 'preconormal'
    end
    object qryConsultaEstoquesLotesprecopromocao: TIntegerField
      FieldName = 'precopromocao'
    end
    object qryConsultaEstoquesLotescaracteristica: TLargeintField
      FieldName = 'caracteristica'
    end
    object qryConsultaEstoquesLotesdescricaocaracteristica: TStringField
      FieldName = 'descricaocaracteristica'
      Size = 100
    end
    object qryConsultaEstoquesLotesincidencia: TStringField
      FieldName = 'incidencia'
      Size = 2
    end
    object qryConsultaEstoquesLotescsosn: TStringField
      FieldName = 'csosn'
      Size = 3
    end
    object qryConsultaEstoquesLotespreco: TIntegerField
      FieldName = 'preco'
    end
    object qryConsultaEstoquesLotesdescproduto: TStringField
      FieldName = 'descproduto'
      Size = 100
    end
    object qryConsultaEstoquesLotesnomefilial: TStringField
      FieldName = 'nomefilial'
      Size = 60
    end
    object qryConsultaEstoquesLotesreferencia: TStringField
      FieldName = 'referencia'
      Size = 50
    end
    object qryConsultaEstoquesLotesdescmarca: TStringField
      FieldName = 'descmarca'
      Size = 15
    end
    object qryConsultaEstoquesLotesgrade1: TIntegerField
      FieldName = 'grade1'
    end
    object qryConsultaEstoquesLotesgrade2: TIntegerField
      FieldName = 'grade2'
    end
    object qryConsultaEstoquesLoteslinha: TStringField
      FieldName = 'linha'
      Size = 40
    end
    object qryConsultaEstoquesLotescoluna: TStringField
      FieldName = 'coluna'
      Size = 40
    end
    object qryConsultaEstoquesLotesvalorgrade1: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade1'
      Size = 50
    end
    object qryConsultaEstoquesLotesvalorgrade2: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade2'
      Size = 50
    end
    object qryConsultaEstoquesLotesestoquefisico: TFloatField
      FieldName = 'estoquefisico'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesLotessequencia: TIntegerField
      FieldName = 'sequencia'
    end
    object qryConsultaEstoquesLotesunidade: TStringField
      FieldName = 'unidade'
      Size = 30
    end
    object qryConsultaEstoquesLotesproducaopropria: TStringField
      FieldName = 'producaopropria'
      Size = 1
    end
    object qryConsultaEstoquesLotesarredondamento: TStringField
      FieldName = 'arredondamento'
      Size = 1
    end
    object qryConsultaEstoquesLotessituacaotributaria: TStringField
      FieldName = 'situacaotributaria'
      Size = 1
    end
    object qryConsultaEstoquesLotescodigobarras: TStringField
      FieldName = 'codigobarras'
      Size = 6
    end
    object qryConsultaEstoquesLotescest: TStringField
      FieldName = 'cest'
      Size = 9
    end
    object qryConsultaEstoquesLotesclassificacaofiscal: TStringField
      FieldName = 'classificacaofiscal'
      Size = 8
    end
    object qryConsultaEstoquesLotespeso: TFloatField
      FieldName = 'peso'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesLotescomposto: TBooleanField
      FieldName = 'composto'
    end
    object qryConsultaEstoquesLotescomposto2: TBooleanField
      FieldName = 'composto2'
    end
    object qryConsultaEstoquesLotespreco_atual: TFloatField
      FieldName = 'preco_atual'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesLotesgrupo: TStringField
      FieldName = 'grupo'
      Size = 4
    end
    object qryConsultaEstoquesLotesdescricaogrupo: TStringField
      FieldName = 'descricaogrupo'
      Size = 30
    end
    object qryConsultaEstoquesLotespromocao: TIntegerField
      FieldName = 'promocao'
    end
    object qryConsultaEstoquesLotesdescricaopromocao: TStringField
      FieldName = 'descricaopromocao'
      Size = 100
    end
    object qryConsultaEstoquesLotessublocalizacao: TStringField
      FieldName = 'sublocalizacao'
    end
    object qryConsultaEstoquesLotestipocomissao_produto: TStringField
      FieldName = 'tipocomissao_produto'
      Size = 1
    end
    object qryConsultaEstoquesLotescomissao_produto: TFloatField
      FieldName = 'comissao_produto'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesLotestipocomissao_grupo: TStringField
      FieldName = 'tipocomissao_grupo'
      Size = 1
    end
    object qryConsultaEstoquesLotescomissao_grupo: TFloatField
      FieldName = 'comissao_grupo'
      DisplayFormat = '0.00'
    end
    object qryConsultaEstoquesLotesmodelos_agg: TStringField
      FieldName = 'modelos_agg'
      Size = 500
    end
    object qryConsultaEstoquesLotesespecificacao_agg: TStringField
      FieldName = 'especificacao_agg'
      Size = 500
    end
    object qryConsultaEstoquesLotesnomefornecedor: TStringField
      FieldName = 'nomefornecedor'
      Size = 60
    end
    object qryConsultaEstoquesLotescst_nfentrada: TStringField
      FieldName = 'cst_nfentrada'
      Size = 2
    end
    object qryConsultaEstoquesLotescsosn_nfentrada: TStringField
      FieldName = 'csosn_nfentrada'
      Size = 3
    end
    object qryConsultaEstoquesLotescst_nf: TStringField
      FieldName = 'cst_nf'
      Size = 2
    end
    object qryConsultaEstoquesLotescsosn_nf: TStringField
      FieldName = 'csosn_nf'
      Size = 3
    end
    object qryConsultaEstoquesLotesfornecedornosimples: TBooleanField
      FieldName = 'fornecedornosimples'
    end
  end
  object qryProdutos_Atributos: TtecQuery
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
      ';'
      'select a_p.nome,'
      ''
      '       cast(case when a_p.tipo = '#39'Sim/N'#227'o'#39' then'
      
        '         case when p.value = '#39'true'#39' then Cast('#39'Sim'#39' as Varchar(2' +
        '00))'
      
        '              when p.value = '#39'false'#39' then Cast('#39'N'#227'o'#39' as Varchar(' +
        '200))'
      '         else Cast(null as Varchar(200)) end'
      ''
      '            when a_p.tipo = '#39'Num'#233'rico'#39' then'
      '              replace(p.value,'#39'.'#39','#39','#39')'
      ''
      '       else'
      '         cast(p.value as varchar(200))'
      '       end as varchar(200)) as valor,'
      ''
      '       a_p.descricao, a_p.tipo, False as Todos'
      'from'
      '('
      'select '
      '        a_p.*  '
      'from'
      'json_to_recordset('
      ''
      ' (select  cast(a_p.atributos as json)'
      '  from atributos_produtos a_p'
      '  where a_p.codigo = (select p.atributos'
      '                      from produtos p'
      '                      where p.codigo = :produto))'
      ''
      
        ') as a_p(nome varchar(100), descricao varchar(200), tipo varchar' +
        '(20))'
      ''
      ') as a_p'
      ''
      'left join'
      ''
      '('
      'select p.*'
      'from json_each_text('
      ''
      '(select  cast(p.atributos_valores as json)'
      '  from produtos p '
      '  where p.codigo = :produto)'
      ') as p'
      ') as p'
      ''
      'on a_p.nome = p.key')
    RequestLive = True
    Left = 336
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qryProdutos_Atributosnome: TStringField
      FieldName = 'nome'
      Size = 100
    end
    object qryProdutos_Atributosvalor: TStringField
      FieldName = 'valor'
      Size = 200
    end
    object qryProdutos_Atributosdescricao: TStringField
      FieldName = 'descricao'
      Size = 200
    end
    object qryProdutos_Atributostipo: TStringField
      FieldName = 'tipo'
    end
    object qryProdutos_Atributostodos: TBooleanField
      FieldName = 'todos'
    end
  end
  object dsrProdutos_Atributos: TtecDataSource
    DataSet = qryProdutos_Atributos
    Left = 336
    Top = 200
  end
  object qryLicitacoesporProdutos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryLicitacoesporProdutosAfterOpen
    OnCalcFields = qryLicitacoesporProdutosCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'IntervaloLicitacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SituacaoLicitacao'
        ParamType = ptUnknown
        Value = 'and situacao_licitacao(l.numero) in ('#39'ABERTO'#39')'
      end
      item
        DataType = ftUnknown
        Name = 'ListaCondicionaldeClientes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaCondicionaldeVendedores'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select sel.*'
      'from'
      '('
      '  select l.numero,'
      '         lc.numero as numeroprodutolicitacao,'
      '         l.cliente,'
      '         situacao_licitacao(l.numero) as situacao_licitacao,'
      '         cl.nome as nomecliente,'
      '         l.datavenda,'
      '         l.vigencia,'
      '         p.codigovisual as produtovisual,'
      '         p.descricao as descricaoproduto,'
      '         lc.quantidade,'
      ''
      '         lc.quantidade -'
      
        '         (/*Nullif(produtos_licitacoes_orcados(lc.licitacao, lc.' +
        'produto, lc.numero),0) +'
      
        '          Nullif(produtos_licitacoes_reservados(lc.licitacao, lc' +
        '.produto, lc.numero),0) +'
      
        '          Nullif(produtos_licitacoes_faturados(lc.licitacao, lc.' +
        'produto, lc.numero),0) + */'
      
        '          produtos_licitacoes_entregues(lc.licitacao, lc.produto' +
        ', lc.numero) /*+'
      
        '          produtos_licitacoes_devolvidos(lc.licitacao, lc.produt' +
        'o, lc.numero)*/ ) as SaldoPendente,'
      ''
      '          l.prazo,'
      '          lc.preco,'
      ''
      '         (lc.quantidade * lc.preco) as TotalProduto,'
      ''
      ''
      
        '          /*1. O que falta entregar o c'#225'lculo '#233' feito pelo custo' +
        'medio atual */'
      '          ((lc.quantidade -'
      ''
      '           (select sum(pdf.quantidade)'
      '                          from produtosdadosfiscais pdf'
      '                               join dadosfiscais df'
      '                                    join contratos ct'
      '                                     on ct.numero = df.contrato'
      '                               on pdf.dadofiscal = df.numero'
      '                          where ct.licitacao = l.numero'
      '                            and df.situacao = '#39'N'#39
      '                            and pdf.produto = p.codigo)) *'
      ''
      
        '          coalesce(nullif(customedio(p.codigo, cast(1 as smallin' +
        't)),0),'
      '            (select e.valorultimacompra'
      '             from estoques e'
      '             where e.produto = p.codigo'
      '               and e.filial = f.codigo ))) +'
      
        '          /*2. O restante '#233' pego m.valor/m.quantidade do movimen' +
        'to RFV da sa'#237'da da nota fiscal */'
      ''
      '           (select sum(abs(m.valor))'
      '                          from produtosdadosfiscais pdf'
      '                               join dadosfiscais df'
      '                                    join contratos ct'
      '                                     on ct.numero = df.contrato'
      '                               on pdf.dadofiscal = df.numero'
      ''
      '                               join movimentos m'
      '                               on m.dadofiscal = df.numero'
      '                               and m.produto  = pdf.produto'
      '                               and m.tipomovimento = '#39'RFV'#39
      '                               and m.filial = f.codigo'
      ''
      '                          where ct.licitacao = l.numero'
      '                            and df.situacao = '#39'N'#39
      '                            and pdf.produto = p.codigo)'
      ''
      ''
      '                as customediototal,'
      ''
      ''
      ''
      
        '          Selecionar_AliquotaIcms(f.estado           /*as Estado' +
        'Origem*/,'
      
        '                                  cl.estado          /*as Estado' +
        'Destino*/,'
      
        '                                  cl.pessoatipo      /*as TipoPe' +
        'ssoa*/,'
      
        '                                  p.codigo           /*as produt' +
        'o*/,'
      
        '                                  false              /*as Aliquo' +
        'taInternadoEstadodeDestino*/,'
      
        '                                  f.contribicms      /*as pContr' +
        'ibuinteOrigem*/,'
      
        '                                  cl.contribicms     /*as pContr' +
        'ibuinteDestino*/,'
      
        '                                  cl.consumidorfinal /*as pVenda' +
        'ConsumidorFinal*/) as AliquotaIcms'
      ''
      '  from licitacoes l'
      '       join filiais f'
      '       on l.filialvenda = f.codigo'
      ''
      '       join usuarios u'
      '       on l.vendedor = u.codigo'
      ''
      '       join clientes cl'
      '       on l.cliente = cl.codigo'
      ''
      '       join vfornecedores vf'
      '       on l.cliente = vf.codigo'
      '       and vf.tipo = '#39'C'#39
      ''
      '       join licitacoesprodutos lc'
      '            join produtos p'
      '            on lc.produto = p.codigo'
      ''
      '       on lc.licitacao = l.numero'
      ''
      ''
      '  where true AND lc.produto = :produto'
      ''
      '  %IntervaloLicitacao'
      '  %SituacaoLicitacao'
      '  %ListaCondicionaldeClientes'
      '  %ListaCondicionaldeVendedores'
      ''
      '  /*'
      '  :DataInicial'
      '  :DataFinal'
      ''
      '  */'
      ''
      ''
      '  order by l.datavenda, l.numero'
      ') as sel'
      ''
      'where SaldoPendente > 0;'
      ''
      ''
      '')
    RequestLive = False
    Left = 768
    Top = 192
    ParamData = <
      item
        DataType = ftString
        Name = 'produto'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftUnknown
        Name = 'DataInicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataFinal'
        ParamType = ptUnknown
      end>
    object qryLicitacoesporProdutosnumero: TIntegerField
      FieldName = 'numero'
      Required = True
    end
    object qryLicitacoesporProdutoscliente: TIntegerField
      FieldName = 'cliente'
    end
    object qryLicitacoesporProdutossituacao_licitacao: TStringField
      DisplayWidth = 10
      FieldName = 'situacao_licitacao'
      Size = 8
    end
    object qryLicitacoesporProdutosnomecliente: TStringField
      FieldName = 'nomecliente'
      Required = True
      Size = 60
    end
    object qryLicitacoesporProdutosdatavenda: TDateField
      Alignment = taCenter
      FieldName = 'datavenda'
      EditMask = '99/99/9999;1; '
    end
    object qryLicitacoesporProdutosvigencia: TDateField
      Alignment = taCenter
      FieldName = 'vigencia'
      EditMask = '99/99/9999;1; '
    end
    object qryLicitacoesporProdutosprodutovisual: TStringField
      FieldName = 'produtovisual'
      Required = True
      Size = 30
    end
    object qryLicitacoesporProdutosdescricaoproduto: TStringField
      FieldName = 'descricaoproduto'
      Required = True
      Size = 100
    end
    object qryLicitacoesporProdutosquantidade: TFloatField
      FieldName = 'quantidade'
      DisplayFormat = '0.00'
    end
    object qryLicitacoesporProdutossaldopendente: TFloatField
      FieldName = 'saldopendente'
      DisplayFormat = '0.00'
    end
    object qryLicitacoesporProdutosTotalSaldoPendente: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TotalSaldoPendente'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryLicitacoesporProdutosprazo: TIntegerField
      FieldName = 'prazo'
    end
    object qryLicitacoesporProdutostotalproduto: TFloatField
      FieldName = 'totalproduto'
      DisplayFormat = '0.00'
    end
    object qryLicitacoesporProdutoscustomediototal: TFloatField
      FieldName = 'customediototal'
      DisplayFormat = '0.00'
    end
    object qryLicitacoesporProdutosaliquotaicms: TFloatField
      FieldName = 'aliquotaicms'
      DisplayFormat = '0.00'
    end
    object qryLicitacoesporProdutosnumeroprodutolicitacao: TIntegerField
      FieldName = 'numeroprodutolicitacao'
    end
    object qryLicitacoesporProdutospreco: TFloatField
      FieldName = 'preco'
      DisplayFormat = '0.00'
    end
  end
  object dsrLicitacoesporProdutos: TtecDataSource
    DataSet = qryLicitacoesporProdutos
    Left = 800
    Top = 200
  end
end
