inherited dtmCadastroNotasFiscaisAuxiliar: TdtmCadastroNotasFiscaisAuxiliar
  OldCreateOrder = False
  Left = 580
  Top = 272
  Height = 350
  Width = 742
  object qryProcuraProdutoNotaFiscal_PEDIDO: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'SQLPedidoAtual'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SQLListas'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'SELECT p.codigo as produto,'
      '       p.codigovisual as produtovisual,'
      '       p.descricao,'
      '       p.valorgrade1,'
      '       p.valorgrade2,'
      
        '      (select ti.valor from tributosicms ti where ti.codigo = c.' +
        'incidencia) as incidencia,'
      '       c.csosn,'
      '       c.ipicst,'
      '       c.piscst,'
      '       c.cofinscst,'
      '       pp.valoripi as aliquotaipi,'
      '       pp.pedido as NumeroDocumentoTabela,'
      '       pp.numero as NumeroProdutoTabela,'
      '       c.unidade,'
      '       g.observacoesentrada,'
      '       c.gerenciarloteevalidade'
      '       '
      ''
      'FROM produtospedidos pp'
      '     join produtos p'
      '          join caracteristicas c'
      '               join grupos g'
      '               on c.grupo = g.codigo'
      '               '
      '          on p.caracteristica = c.codigo'
      '     on pp.produto = p.codigo'
      ''
      
        'WHERE pp.pedido = :pedido and (pp.numero = :numeroproduto or :nu' +
        'meroproduto is null)'
      ''
      
        '  AND ( upper(to_ascii(p.codigovisual,'#39'latin1'#39')) = upper(to_asci' +
        'i(:produtovisual,'#39'latin1'#39')) or'
      ''
      #9#9'p.codigo in (select pcb.produto'
      '                      from produtoscodigobarras pcb'
      '                      where pcb.codigobarras = :produtovisual)'
      
        '    or (p.caracteristica = :caracteristica and p.valorgrade1 = :' +
        'valorgrade1 and p.valorgrade2 = :valorgrade2)'
      ''
      #9'   )'
      '  AND ('
      ''
      '       %SQLPedidoAtual'
      ''
      '       (pp.produto, pp.numero) IN ('
      '                     SELECT pp2.produto, pp2.numero'
      '                     FROM produtospedidos pp2'
      '                     WHERE pp2.pedido = pp.pedido'
      
        '                     GROUP BY pp2.pedido, pp2.produto, pp2.numer' +
        'o'
      '                     HAVING sum(pp2.quantidade) > ('
      
        #9#9#9#9#9'                                SELECT coalesce(sum(pnp.qua' +
        'ntidade),0)'
      
        '                                                    FROM produto' +
        'snotaspag pnp'
      
        '                                                         join no' +
        'taspag np'
      
        '                                                         on pnp.' +
        'codigonota = np.codigo'
      
        '                                                    WHERE pnp.pe' +
        'dido = pp2.pedido AND'
      
        '                                                          pnp.nu' +
        'mero = pp2.numero and'
      
        '                                                          pnp.pr' +
        'oduto = pp2.produto and'
      
        '                                                          np.sit' +
        'uacao <> '#39'C'#39
      '                                                  )'
      '                     )'
      '      )'
      '%SQLListas'
      ''
      '/*'
      ':dadofiscal'
      '*/')
    RequestLive = False
    Left = 136
    Top = 101
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pedido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numeroproduto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'produtovisual'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'caracteristica'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'valorgrade1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'valorgrade2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dadofiscal'
        ParamType = ptUnknown
      end>
  end
  object qryProcuraProdutoNotaFiscal_NOTASAIDA: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'SQLListas'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select p.codigo as produto,'
      '       p.CodigoVisual as produtovisual,'
      '       p.descricao,'
      '       p.valorgrade1,'
      '       p.valorgrade2,'
      
        '      (select ti.valor from tributosicms ti where ti.codigo = c.' +
        'incidencia) as incidencia,'
      '       c.csosn,'
      
        '      (select i.aliquota from ipi i where i.codigo = c.ipi) as a' +
        'liquotaipi,'
      '       c.ipicst,'
      '       c.piscst,'
      '       c.cofinscst,'
      '       pdf.dadofiscal as NumeroDocumentoTabela,'
      '       pdf.numero as NumeroProdutoTabela,'
      '       c.unidade,'
      '       g.observacoesentrada,'
      '       c.gerenciarloteevalidade'
      ''
      'from produtosdadosfiscais pdf'
      '     join (produtos p'
      '           left join precos pr'
      '           on p.caracteristica = pr.caracteristica'
      '           and p.preco = pr.codigo)'
      ''
      '         join caracteristicas c'
      '              join grupos g'
      '              on c.grupo = g.codigo'
      ''
      '         on p.caracteristica = c.codigo'
      '     on pdf.produto = p.codigo'
      ''
      
        'where pdf.dadofiscal = :dadofiscal  and (pdf.numero = :numeropro' +
        'duto or :numeroproduto is null)'
      ''
      
        '  AND ( upper(to_ascii(p.codigovisual,'#39'latin1'#39')) = upper(to_asci' +
        'i(:produtovisual,'#39'latin1'#39')) or'
      ''
      #9#9'p.codigo in (select pcb.produto'
      '                      from produtoscodigobarras pcb'
      '                      where pcb.codigobarras = :produtovisual)'
      
        '    or (p.caracteristica = :caracteristica and p.valorgrade1 = :' +
        'valorgrade1 and p.valorgrade2 = :valorgrade2)'
      '                          '
      #9'   )'
      ''
      ''
      '  %SQLListas'
      ''
      ''
      '/*'
      ''
      ':pedido'
      ''
      '*/')
    RequestLive = False
    Left = 168
    Top = 122
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dadofiscal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numeroproduto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'produtovisual'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'caracteristica'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'valorgrade1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'valorgrade2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pedido'
        ParamType = ptUnknown
      end>
  end
  object qryProcuraProdutoNotaFiscal_NORMAL: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'SQLListas'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'SELECT  p.codigo as produto,'
      '      p.codigovisual as produtovisual,'
      '      p.descricao,'
      '      p.valorgrade1,'
      '      p.valorgrade2,'
      
        '     (select ti.valor from tributosicms ti where ti.codigo = c.i' +
        'ncidencia) as incidencia,'
      '     c.csosn,'
      
        '     (select i.aliquota from ipi i where i.codigo = c.ipi) as al' +
        'iquotaipi,'
      '      c.ipicst,'
      '      c.piscst,'
      '      c.cofinscst,'
      '      cast(null as integer) as NumeroDocumentoTabela,'
      '      cast(null as integer) as NumeroProdutoTabela,'
      '      c.unidade,'
      '      g.observacoesentrada,'
      '      c.gerenciarloteevalidade'
      ' '
      'FROM  caracteristicas c, grupos g, classes cl,'
      ''
      '      (produtos p'
      '       left join precos pr'
      '       on p.caracteristica = pr.caracteristica'
      '       and p.preco = pr.codigo)'
      ''
      ''
      'WHERE ( p.caracteristica = c.codigo )'
      '  AND (c.grupo = g.codigo)'
      '  AND (c.classe = cl.codigo)'
      
        '  AND ( upper(to_ascii(p.codigovisual,'#39'latin1'#39')) = upper(to_asci' +
        'i(:produtovisual,'#39'latin1'#39')) or'
      ''
      #9#9'p.codigo in (select pcb.produto'
      '                      from produtoscodigobarras pcb'
      '                      where pcb.codigobarras = :produtovisual)'
      '                      '
      
        '    or (p.caracteristica = :caracteristica and p.valorgrade1 = :' +
        'valorgrade1 and p.valorgrade2 = :valorgrade2)'
      ''
      #9'   )'
      ''
      ''
      '  %SQLListas'
      ''
      ''
      '/*'
      '   :pedido'
      '   :dadofiscal'
      '   :numeroproduto'
      ''
      '*/')
    RequestLive = False
    Left = 208
    Top = 135
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'produtovisual'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'caracteristica'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'valorgrade1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'valorgrade2'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pedido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dadofiscal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numeroproduto'
        ParamType = ptUnknown
      end>
  end
  object qryConsultaProdutosNotaFiscal_NORMAL: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'SQLProduto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SQLDetalhes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SQLListas'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select p.codigo,'
      '       p.CodigoVisual,'
      '       p.referencia,'
      '       p.descricao,'
      '       p.valorgrade1,'
      '       p.valorgrade2,'
      '       p.preco as codigopreco,'
      '       pr.descricao as descricaoprecoproduto,'
      
        #9'   (select e.precocomicms from estoques e where (e.produto = p.' +
        'codigo) and (e.filial = :filial)) as preco,'
      '       c.classe,'
      '       cast(null as integer) as NumeroDocumentoTabela,'
      '       cast(null as integer) as NumeroProdutoTabela,'
      '       cast(null as numeric(11,3)) as quantidade'
      ''
      'from produtos p'
      '     join precos pr'
      '     on p.caracteristica = pr.caracteristica'
      '     and p.preco = pr.codigo'
      ''
      '     join caracteristicas c'
      '     on p.caracteristica = c.codigo'
      ''
      'where (p.inativo IS NULL)'
      ''
      '%SQLProduto'
      '%SQLDetalhes'
      '%SQLListas'
      ''
      
        'order by UPPER(TO_ASCII(p.descricao,'#39'LATIN1'#39')), valorgrade1, val' +
        'orgrade2'
      ''
      '/*'
      ''
      ':dadofiscal'
      ''
      '*/'
      ''
      '')
    RequestLive = False
    Left = 448
    Top = 101
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dadofiscal'
        ParamType = ptUnknown
      end>
  end
  object qryConsultaProdutosNotaFiscal_NOTASAIDA: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'SQLProduto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SQLDetalhes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SQLListas'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select p.codigo,'
      '       p.CodigoVisual,'
      '       p.referencia,'
      '       p.descricao,'
      '       p.valorgrade1,'
      '       p.valorgrade2,'
      '       p.preco as codigopreco,'
      '       pr.descricao as descricaoprecoproduto,'
      '       pdf.precovenda as preco,'
      '       c.classe,'
      '       pdf.dadofiscal as NumeroDocumentoTabela,'
      '       pdf.numero as NumeroProdutoTabela,'
      '       pdf.quantidade'
      '       '
      'from produtosdadosfiscais pdf'
      '     join produtos p'
      '         join precos pr'
      '         on p.caracteristica = pr.caracteristica'
      '         and p.preco = pr.codigo'
      ''
      '         join caracteristicas c'
      '         on p.caracteristica = c.codigo'
      '     on pdf.produto = p.codigo'
      ''
      'where pdf.dadofiscal = :dadofiscal'
      ''
      '%SQLProduto'
      '%SQLDetalhes'
      '%SQLListas'
      ''
      
        'order by pdf.numero, UPPER(TO_ASCII(p.descricao,'#39'LATIN1'#39')), valo' +
        'rgrade1, valorgrade2'
      ''
      ''
      '/*'
      ''
      ':filial'
      ''
      '*/')
    RequestLive = False
    Left = 416
    Top = 85
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dadofiscal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end>
  end
  object qryConsultaProdutosNotaFiscal_PEDIDO: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'SQLDetalhes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SQLPedidoAtual'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SQLProduto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SQLListas'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select p.codigo,'
      '       p.CodigoVisual,'
      '       p.referencia,'
      '       p.descricao,'
      '       p.valorgrade1,'
      '       p.valorgrade2,'
      '       p.preco as codigopreco,'
      '       pr.descricao as descricaoprecoproduto,'
      
        '       pp.preco * (100 - coalesce(pp.desconto,0)) / 100 as preco' +
        ','
      '       c.classe,'
      '       pp.pedido as NumeroDocumentoTabela,'
      '       pp.numero as NumeroProdutoTabela,'
      '       pp.quantidade'
      ''
      'from produtospedidos pp'
      '     join produtos p'
      '           join precos pr'
      '           on p.caracteristica = pr.caracteristica'
      '           and p.preco = pr.codigo'
      ''
      '           join caracteristicas c'
      '           on p.caracteristica = c.codigo'
      '     on pp.produto = p.codigo'
      ''
      'where pp.pedido in (%SQLDetalhes)'
      '  and p.inativo IS NULL'
      '  AND ('
      '       %SQLPedidoAtual'
      '      (pp.produto, pp.numero) IN ('
      '                      SELECT pp2.produto, pp2.numero'
      '                      FROM produtospedidos pp2'
      '                      WHERE pp2.pedido = pp.pedido'
      
        '                      GROUP BY pp2.pedido, pp2.produto, pp2.nume' +
        'ro'
      
        '                      HAVING sum(pp2.quantidade) > (SELECT coale' +
        'sce(sum(pnp.quantidade),0)'
      
        '                                                   FROM produtos' +
        'notaspag pnp'
      
        '                                                        join not' +
        'aspag np'
      
        '                                                        on pnp.c' +
        'odigonota = np.codigo'
      
        '                                                   WHERE pnp.ped' +
        'ido = pp2.pedido'
      
        '                                                     AND pnp.pro' +
        'duto = pp2.produto'
      
        '                                                     and pnp.num' +
        'eroprodutotabela = pp2.numero'
      
        '                                                     and np.situ' +
        'acao <> '#39'C'#39
      '                                                   )'
      '                     )'
      '      )'
      ''
      ''
      '%SQLProduto'
      '%SQLListas'
      ''
      
        'order by pp.numero, UPPER(TO_ASCII(p.descricao,'#39'LATIN1'#39')), valor' +
        'grade1, valorgrade2'
      ''
      '/*'
      ''
      ':dadofiscal'
      ':filial'
      ''
      '*/')
    RequestLive = False
    Left = 384
    Top = 69
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dadofiscal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end>
  end
  object qryEstadosIPI: TtecQuery
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
      'Select distinct i.codigo as ipi, '
      '       n.codigotipi, '
      '       ei.estado,'
      '       ei.fatorsubstituicao '
      
        'from ipi i join ncmtabela n on i.classificacaofiscal = n.codigot' +
        'ipi'
      '           join estadosipi ei on ei.ipi = i.codigo'
      'Where i.codigo = :ipi and'
      '      ei.estado = :Estado')
    RequestLive = False
    Left = 424
    Top = 293
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ipi'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Estado'
        ParamType = ptUnknown
      end>
    object qryEstadosIPIipi: TIntegerField
      FieldName = 'ipi'
    end
    object qryEstadosIPIcodigotipi: TStringField
      FieldName = 'codigotipi'
      Size = 8
    end
    object qryEstadosIPIestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object qryEstadosIPIfatorsubstituicao: TFloatField
      FieldName = 'fatorsubstituicao'
    end
  end
  object dsrEstadosIPI: TtecDataSource
    DataSet = qryEstadosIPI
    Left = 440
    Top = 317
  end
  object qryCalculoICMSST: TtecQuery
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
      ';SELECT *,'
      '       trunc(baseicmstotal * correcaoicms,2) as baseicmstotal2,'
      
        '       trunc((baseicmstotal * (aliquotadentro/100) * correcaoicm' +
        's),2) - icmsproprio as valorsubstituicao'
      'FROM'
      '('
      'SELECT *,'
      '       trunc(valortotal * fator,2) as baseicmstotal,'
      
        '       trunc(valortotalsemipi * aliquotaprodutonota/100 *(1-perc' +
        'reducaobase/100),2) as icmsproprio,'
      '       CASE WHEN icmscaracteristica is null then 0.00'
      
        '            ELSE trunc(valortotal * (Select ei.valor from estado' +
        'sicms ei where ei.icms = icmscaracteristica and ei.estado = :Est' +
        'adoFilial)/100,2) end as icmsdentro,'
      ''
      
        '       CASE WHEN (select c.icms from produtos p join caracterist' +
        'icas c on c.codigo = p.caracteristica and p.codigo = produto) is' +
        ' null'
      '            THEN 0.00'
      
        '            ELSE trunc(valortotal * (CASE WHEN :EstadoProduto = ' +
        ':EstadoFilial'
      
        '                                          THEN ((Select ei.valor' +
        ' from estadosicms ei where ei.estado = :EstadoProduto and ei.icm' +
        's = icmscaracteristica)/100)'
      
        '                                          ELSE ((Select ei.valor' +
        'fora from estadosicms ei where ei.estado = :EstadoProduto and ei' +
        '.icms = icmscaracteristica)/100)'
      '                                     END),2)'
      '       END AS icmsfora                     '
      'FROM'
      '('
      'SELECT *,'
      '        CASE WHEN :EstadoProduto = :EstadoFilial then 1'
      
        '             ELSE(1 - aliquotaprodutonota/100) / (1 -aliquotaden' +
        'tro/100)'
      '        END as correcaoicms,'
      
        '        trunc((quantidade * precounitario),2) as valortotalsemip' +
        'i,'
      
        '        trunc((quantidade * precounitario)*(1+(aliquotaipi/100))' +
        ',2) as valortotal'
      ' FROM'
      ' (select p.codigo as produto,'
      '        c.descricao as nomeproduto,'
      '        c.codigo as codigocaracteristica,'
      '        c.icms as icmscaracteristica,'
      '        coalesce(c.percreducaobase,0) as percreducaobase,'
      '        cast(:Quantidade as numeric) as Quantidade,'
      '        cast(:Preco as numeric) as PrecoUnitario,'
      
        '        coalesce((select i.aliquota from ipi i where i.codigo = ' +
        'c.ipi),0) as aliquotaipi,'
      
        '        (select c.incidencia from produtos p join caracteristica' +
        's c on c.codigo = p.caracteristica limit 1) as incidencia,'
      '        case when (null is null) or (null = 0)'
      
        '             then (Select ei.valor from estadosicms ei where ei.' +
        'estado = :EstadoProduto and ei.icms = c.icms)'
      '             else null'
      '        end as aliquotaprodutonota,'
      
        '        (Select ei.valor from estadosicms ei where ei.icms = c.i' +
        'cms and ei.estado = :EstadoFilial limit 1) as aliquotadentro,'
      
        '        (Select distinct ei.fatorsubstituicao from caracteristic' +
        'as c join produtos pt on pt.caracteristica = c.codigo'
      
        '                                                                ' +
        '     join (ipi i join estadosipi ei on i.codigo = ei.ipi and ei.' +
        'estado = :EstadoFilial) on c.ipi = i.codigo'
      
        '                                              Where pt.codigo = ' +
        'p.codigo limit 1) as fator'
      
        'from produtos p join caracteristicas c on p.caracteristica = c.c' +
        'odigo'
      'where p.codigo  = :Produto'
      ') as g'
      ') as a'
      ') as B')
    RequestLive = False
    Left = 592
    Top = 285
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'EstadoFilial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EstadoProduto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantidade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Preco'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Produto'
        ParamType = ptUnknown
      end>
    object qryCalculoICMSSTproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryCalculoICMSSTnomeproduto: TStringField
      FieldName = 'nomeproduto'
      Size = 100
    end
    object qryCalculoICMSSTcodigocaracteristica: TLargeintField
      FieldName = 'codigocaracteristica'
    end
    object qryCalculoICMSSTicmscaracteristica: TIntegerField
      FieldName = 'icmscaracteristica'
      DisplayFormat = '0'
    end
    object qryCalculoICMSSTpercreducaobase: TFloatField
      FieldName = 'percreducaobase'
      DisplayFormat = '0.00'
    end
    object qryCalculoICMSSTquantidade: TFloatField
      FieldName = 'quantidade'
      DisplayFormat = '0.00'
    end
    object qryCalculoICMSSTprecounitario: TFloatField
      FieldName = 'precounitario'
      DisplayFormat = '0.00'
    end
    object qryCalculoICMSSTaliquotaipi: TFloatField
      FieldName = 'aliquotaipi'
      DisplayFormat = '0.00'
    end
    object qryCalculoICMSSTincidencia: TIntegerField
      FieldName = 'incidencia'
      DisplayFormat = '0'
    end
    object qryCalculoICMSSTaliquotaprodutonota: TFloatField
      FieldName = 'aliquotaprodutonota'
      DisplayFormat = '0.00'
    end
    object qryCalculoICMSSTaliquotadentro: TFloatField
      FieldName = 'aliquotadentro'
      DisplayFormat = '0.00'
    end
    object qryCalculoICMSSTfator: TFloatField
      FieldName = 'fator'
      DisplayFormat = '0.00'
    end
    object qryCalculoICMSSTcorrecaoicms: TFloatField
      FieldName = 'correcaoicms'
      DisplayFormat = '0.00'
    end
    object qryCalculoICMSSTvalortotalsemipi: TFloatField
      FieldName = 'valortotalsemipi'
      DisplayFormat = '0.00'
    end
    object qryCalculoICMSSTvalortotal: TFloatField
      FieldName = 'valortotal'
      DisplayFormat = '0.00'
    end
    object qryCalculoICMSSTbaseicmstotal: TFloatField
      FieldName = 'baseicmstotal'
      DisplayFormat = '0.00'
    end
    object qryCalculoICMSSTicmsproprio: TFloatField
      FieldName = 'icmsproprio'
      DisplayFormat = '0.00'
    end
    object qryCalculoICMSSTicmsdentro: TFloatField
      FieldName = 'icmsdentro'
      DisplayFormat = '0.00'
    end
    object qryCalculoICMSSTicmsfora: TFloatField
      FieldName = 'icmsfora'
      DisplayFormat = '0.00'
    end
    object qryCalculoICMSSTbaseicmstotal2: TFloatField
      FieldName = 'baseicmstotal2'
      DisplayFormat = '0.00'
    end
    object qryCalculoICMSSTvalorsubstituicao: TFloatField
      FieldName = 'valorsubstituicao'
      DisplayFormat = '0.00'
    end
  end
  object dsrCalculoICMSST: TtecDataSource
    DataSet = qryCalculoICMSST
    Left = 616
    Top = 309
  end
end
