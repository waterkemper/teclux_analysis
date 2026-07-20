inherited dtmAnaliseestoques: TdtmAnaliseestoques
  OldCreateOrder = False
  Left = 602
  Top = 175
  Height = 574
  Width = 771
  object qryAnaliseEstoques: TtecQuery
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
      'select vendas.*,'
      '       case when coalesce(estoques_preconormal,0)<>0 then'
      
        '         round((((estoques_preconormal - precoultimaentrada) / e' +
        'stoques_preconormal) *100),0) '
      '       else 0 end as margem_uc,'
      '       '
      '       case when coalesce(estoques_preconormal,0)<>0 then  '
      
        '         round((((estoques_preconormal - custo_unitario_cmv) / e' +
        'stoques_preconormal) *100),0) '
      '       else 0 end as margem_cm       '
      '       '
      'from'
      '('
      'select vendas.*,'
      '       cmv.preco_prazo_cmv,'
      '       cmv.preco_custo_cmv,'
      '         '
      '       case when coalesce(cmv.preco_prazo_cmv,0)<>0 then '
      '         round((((cmv.preco_prazo_cmv -'
      '          cmv.preco_custo_cmv) / cmv.preco_prazo_cmv) *100),2) '
      '       ELSE 0.00 end as margem_cmv,'
      '        '
      
        '       estoques_preconormal(vendas.codigoproduto, :FilialBase ) ' +
        'as estoques_preconormal,'
      '       '
      '       case when coalesce(cmv.quantidade_cmv,0)<>0 then'
      '         round((cmv.preco_custo_cmv / cmv.quantidade_cmv),2) '
      '       else 0.00 end as custo_unitario_cmv'
      '       '
      '       '
      ''
      'from'
      '('
      'select vendas.*,'
      ''
      
        '       round((TOTAL_VENDAS_PERIODO / NMesesPeriodo)) as MEDIA_VE' +
        'NDAS_PERIODO,'
      '       '
      
        '       (SELECT SUM(case when substr(m.operacao,13,1) = '#39'+'#39' then ' +
        ' abs(m.quantidade) else -abs(m.quantidade) end)'
      
        '        FROM movimentos m join dadosfiscais df on m.dadofiscal =' +
        ' df.numero'
      
        '        WHERE m.data between (cast('#39'2018-11-01'#39' AS date) - inter' +
        'val'#39'6 months'#39') and '#39'2018-11-01'#39
      
        '         and (substr(m.operacao,13,1) = '#39'+'#39' or substr(m.operacao' +
        ',13,1) = '#39'-'#39')'
      
        '         AND m.produto = vendas.codigoproduto) as TOTAL_VENDAS_6' +
        '_MESE_ANTERIORES,'
      '         '
      '      case when coalesce(TOTAL_VENDAS_PERIODO,0)<>0 then'
      
        '        round((quantidade_total_estoque + quantidade_totao_pedid' +
        'os) /  (TOTAL_VENDAS_PERIODO / NDiasPeriodo),0) '
      '      else 0 end as DIAS_ESTOQUE,'
      '      '
      '      (select SUM(e.financeiro) '
      '       from estoques e '
      
        '       where e.produto = vendas.codigoproduto) as VALOR_EM_ESTOQ' +
        'UE,'
      '       '
      '       coalesce(compras.nomefornecedor, (select f.nome'
      
        '                                         from fornecedoresprodut' +
        'os fp'
      
        '                                              join fornecedores ' +
        'f on fp.fornecedor = f.codigo '
      
        '                                         where fp.caracteristica' +
        ' = vendas.caracteristica limit 1)) as nomefornecedor,'
      '       compras.precoultimaentrada,'
      '       compras.dataultimaentrada'
      '       '
      '       '
      '       '
      '       /*'
      '       (SELECT SUM(pdf.precovenda*abs(pdf.quantidade))'
      '        from movimentos m '
      '             join produtosdadosfiscais pdf '
      '              on m.dadofiscal = pdf.dadofiscal'
      '              and m.produto = pdf.produto'
      '                      '
      '        WHERE m.data between '#39'2018-11-01'#39' and '#39'2019-04-30'#39
      '         and (substr(m.operacao,13,1) = '#39'+'#39')'
      
        '         AND m.produto = vendas.codigoproduto)  as TOTAL_$_VENDA' +
        'S_PERIODO'
      '         */'
      '                 '
      '       '
      '    '
      '       '
      'from'
      '('
      ' '
      
        'select c.codigo as caracteristica, c.codigovisual as caracterist' +
        'icavisual, c.grupo, g.descricao as descricao_grupo,'
      '       p.resultadocurvaabc ,'
      '       p.codigovisual as produto,'
      '       p.codigo as codigoproduto,'
      '       p.descricao as descricao_produto,'
      
        '       quantidadetotaldoestoque(p.codigo) as quantidade_total_es' +
        'toque,'
      '       '
      
        '       pedidos_estoquepedido(p.codigo) as quantidade_totao_pedid' +
        'os,'
      '       '
      '       p.promocao,'
      '       pr.descricao as descricao_promocao,'
      '       '
      '       vendas.*,'
      '       '
      
        '       (SELECT SUM(case when substr(m.operacao,13,1) = '#39'+'#39' then ' +
        ' abs(m.quantidade) else -abs(m.quantidade) end)'
      
        '        FROM movimentos m join dadosfiscais df on m.dadofiscal =' +
        ' df.numero'
      '        WHERE m.data between '#39'2018-11-01'#39' and '#39'2019-04-30'#39
      
        '         and (substr(m.operacao,13,1) = '#39'+'#39' or substr(m.operacao' +
        ',13,1) = '#39'-'#39')'
      '         AND m.produto = p.codigo) as TOTAL_VENDAS_PERIODO,'
      '         '
      
        '         (select extract('#39'Month'#39' from age('#39'2019-04-30'#39', '#39'2018-11' +
        '-01'#39'))+1) as NMesesPeriodo,'
      
        '         (select cast('#39'2019-04-30'#39' as date) - cast('#39'2018-11-01'#39' ' +
        'as date)) as NDiasPeriodo'
      '      '
      '        '
      'from caracteristicas c'
      ''
      '     join produtos p'
      '          join promocoes pr'
      '          on p.promocao = pr.codigo'
      '           '
      '     on c.codigo = p.caracteristica'
      '     '
      '     join grupos g'
      '     on c.grupo = g.codigo'
      ''
      ''
      'join'
      ''
      '('
      ''
      ''
      'SELECT * FROM crosstab'
      '('
      #39'select   produto, mes,'
      '          cast(sum(quantidade) as numeric(9,3)) as quantidade '
      '          from'
      ' ('
      ''
      '             '
      '               SELECT m.produto,'
      
        '                      cast(to_char(m.data,'#39#39'YYYY/mm'#39#39') as char(7' +
        ')) AS mes,'
      
        '                      case when substr(m.operacao,13,1) = '#39#39'+'#39#39' ' +
        'then  abs(m.quantidade) else -abs(m.quantidade) end as quantidad' +
        'e'
      '                      '
      '                      '
      '                      '
      ''
      '               FROM movimentos m '
      '               '
      '                    join'
      '                    ('
      '                          Select p.codigo'
      '              from ((((caracteristicas c'
      '                          join marcas m'
      '                          on c.marca = m.codigo)'
      ''
      '                         join grupos g'
      '                         on c.grupo = g.codigo)'
      ''
      '                        join classes cl'
      '                        on c.classe = cl.codigo)'
      ''
      '                       join (produtos p'
      '                            left join promocoes pro'
      '                            on p.promocao = pro.codigo)'
      '                       on p.caracteristica = c.codigo)'
      ''
      '             where p.caracteristica = c.codigo'
      '               and c.marca = m.codigo'
      '               and c.grupo = g.codigo'
      '               and c.classe = cl.codigo'
      '               '
      '               and p.codigo in (1248200,1248100,1665800)'
      ''
      ''
      '                     )'
      
        '                     as p on m.produto = p.codigo, dadosfiscais ' +
        'fc'
      
        '               WHERE m.data between '#39#39'2018-11-01'#39#39' and '#39#39'2019-04' +
        '-30'#39#39
      '               AND fc.numero=m.dadofiscal'
      
        '               and (substr(m.operacao,13,1) = '#39#39'+'#39#39' or substr(m.' +
        'operacao,13,1) = '#39#39'-'#39#39')'
      '               order by m.produto, to_char(m.data,'#39#39'YYYY/mm'#39#39')'
      '                                         '
      '            '
      ''
      ''
      ''
      ' ) as temp'
      ' group by  produto, mes'
      ' order by 1,2'#39','
      ''
      #39'select distinct to_char(cast('#39#39
      ''
      '        2018-11-01'
      ''
      
        '        '#39#39' as date)  + s.a,'#39#39'YYYY/MM'#39#39') as mes from generate_ser' +
        'ies(1,cast('#39#39
      ''
      '            2019-04-30'
      '            '
      '            '#39#39' as date)-cast('#39#39
      ''
      '              2018-11-01'
      '              '
      '             '#39#39' as date)) as s(a) order by 1'#39
      ')'
      'AS'
      ' ( '
      '   produto bigint,'
      '   '
      '   '
      '   MES_11_2018 numeric(9,3),'
      '   MES_12_2018 numeric(9,3),'
      '   MES_01_2019 numeric(9,3),'
      '   MES_02_2019 numeric(9,3),'
      '   MES_03_2019 numeric(9,3),'
      '   MES_04_2019 numeric(9,3)'
      '   '
      '   '
      '   '
      ')'
      ''
      ') as vendas on p.codigo = vendas.produto'
      ''
      'where p.codigo in (1248200,1248100,1665800)'
      ''
      ') as vendas'
      ''
      '     left join     '
      '     '
      '     ('
      '     '
      '     select nfp.*,'
      
        '            COALESCE(m.precocomicms, nfp.precoultimaentrada_nota' +
        ')  AS precoultimaentrada,'
      
        '            coalesce(m.data, dataultimaentrada_nota) AS dataulti' +
        'maentrada'
      '               '
      '     FROM'
      '     ('
      '               '
      ''
      '        select nfp.*,'
      '               f.nome as nomefornecedor, '
      '               '
      '               (select max(numero)'
      '                from movimentos m'
      '                where m.codigonota = nfp.codigonota'
      '                 and m.produto = nfp.codigoproduto      '
      
        '                 and (substr(m.operacao, 11, 1) <> '#39'*'#39')) as nume' +
        'romovimento,'
      '               '
      
        '               (select pnp.precounitario / coalesce(pnp.fatorcon' +
        'versao,1)'
      '                from produtosnotaspag pnp'
      '                where pnp.codigonota = nfp.codigonota'
      '                  and pnp.produto = nfp.codigoproduto'
      
        '                  order by pnp.precounitario desc limit 1 )  as ' +
        'precoultimaentrada_nota,'
      '              '
      '               np.data AS dataultimaentrada_nota'
      ''
      '        from'
      '        '
      '        ('
      '        select distinct p.codigo as codigoproduto,'
      ''
      '               (select max(np.codigo)'
      '                from notaspag np'
      '                     join produtosnotaspag pnp'
      '                     on np.codigo = pnp.codigonota'
      '                where pnp.produto =  p.codigo  '
      '                  and np.tipofornecedor = '#39'F'#39
      
        '                  and ehnotafiscalentradacompra(pnp.codigofiscal' +
        ')'
      '                     '
      '                     ) as codigonota'
      '                                                       '
      '        from fornecedoresprodutos fp'
      '             join caracteristicas c '
      '                  join produtos p'
      '                  on c.codigo = p.caracteristica'
      '             on fp.caracteristica = c.codigo'
      '        where p.codigo in (1248200,1248100,1665800)     '
      '        order by p.codigo     '
      '        ) as nfp join notaspag np '
      
        '                      join fornecedores f on np.fornecedor = f.c' +
        'odigo and np.tipofornecedor = '#39'F'#39
      '                 on nfp.codigonota = np.codigo'
      '                     '
      '                 /* '
      '           left join movimentos m '
      '            on m.produto = nfp.codigoproduto'
      '           and (substr(m.operacao, 11, 1) <> '#39'*'#39')'
      '           and (m.codigonota = nfp.codigonota)'
      '           */'
      
        '       ) as nfp left join movimentos m on nfp.numeromovimento = ' +
        'm.numero    '
      '     '
      
        '     ) as compras on vendas.codigoproduto = compras.codigoprodut' +
        'o'
      ')  as vendas '
      '   left join '
      '   '
      ' ('
      ' '
      '  select cmv.produto, '
      '         sum(cmv.quantidade) as quantidade_cmv,'
      
        '         sum(cmv.quantidade * cmv.preco_prazo) as preco_prazo_cm' +
        'v,'
      
        '         sum(cmv.quantidade * cmv.preco_custo) as preco_custo_cm' +
        'v'
      '         '
      '        '
      '         '
      '  from'
      '  ('
      '  '
      '  ('
      '   SELECT ProdutosDadosFiscaisMovimentos.*,'
      '          u.nome AS nomevendedor,'
      '          p.descricao,'
      '          p.valorgrade1,'
      '          p.valorgrade2,'
      '          c.grupo,'
      '          g.descricao AS grupodescricao,'
      '          c.classe,'
      '          cl.descricao AS classegrupo,'
      '          f.nome AS nomefilialvenda,'
      ''
      '     (SELECT f2.nome'
      '      FROM filiais f2'
      
        '      WHERE f2.codigo = ProdutosDadosFiscaisMovimentos.filialemi' +
        'ssao) AS nomefilialemissao,'
      '          fgf.grupo AS grupofilialvenda,'
      '          gf.descricao AS nomegrupofilialvenda,'
      '          pl.descricao AS nomeplano,'
      '          CASE'
      
        '              WHEN preco_custo<>0 THEN (((Preco_Prazo/preco_cust' +
        'o)-1)*100)'
      '              ELSE cast(0 AS numeric)'
      '          END AS markup,'
      '          CASE'
      
        '              WHEN preco_prazo<>0 THEN (quantidade*(Preco_Prazo-' +
        'preco_custo))'
      '              ELSE cast(0 AS numeric)'
      '          END AS margem,'
      '          CASE'
      
        '              WHEN preco_prazo<>0 THEN (((Preco_Prazo-preco_cust' +
        'o)/Preco_Prazo)*100)'
      '              ELSE cast(0 AS numeric)'
      '          END AS pmargem,'
      '          cast('#39'V'#39' AS varchar) AS Tipo'
      '   FROM'
      '     (SELECT ProdutosDadosFiscaisMovimentosEncontrado.*,'
      '             CASE'
      
        '                 WHEN NOT coalesce(ProdutosDadosFiscaisMovimento' +
        'sEncontrado.composto, FALSE) THEN CASE'
      
        '                                                                ' +
        '                                      WHEN m.quantidade=0 THEN 0' +
        '.00'
      
        '                                                                ' +
        '                                      ELSE @(m.valor/m.quantidad' +
        'e)'
      
        '                                                                ' +
        '                                  END'
      '                 ELSE  CASE'
      
        '                                                                ' +
        '                                                     WHEN coales' +
        'ce(ProdutosDadosFiscaisMovimentosEncontrado.quantidade, 0)=0 THE' +
        'N 0.00'
      
        '                                                                ' +
        '                                                     ELSE'
      
        '                                                                ' +
        '                                                            (SEL' +
        'ECT @(sum(m1.valor))'
      
        '                                                                ' +
        '                                                             FRO' +
        'M movimentos m1'
      
        '                                                                ' +
        '                                                             WHE' +
        'RE m1.cmpmovimento=ProdutosDadosFiscaisMovimentosEncontrado.Nume' +
        'roMovimento)/ProdutosDadosFiscaisMovimentosEncontrado.quantidade'
      
        '                                                                ' +
        '                                                 END'
      '             END AS preco_custo,'
      
        '             coalesce((m.emestoque+m.reservado+m.transito+m.demo' +
        'nstracao+m.conserto+m.danificada),0) AS qtemestoque'
      '      FROM'
      
        '        (SELECT ProdutosDadosFiscais.*,  coalesce(produtosdadosf' +
        'iscais.movimento, COALESCE ('
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '          (SELECT m.numero'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '           FROM movimentos m'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '           WHERE m.dadofiscal=produtosdadosfiscais.dadofiscal'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '             AND m.produto=produtosdadosfiscais.produto'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '             AND m.filial=produtosdadosfiscais.filial'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '           LIMIT 1)),'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                (SELECT m.numero'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                 FROM movimentos m'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                 WHERE m.produto=produtosdadosfi' +
        'scais.produto'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                   AND m.filial=produtosdadosfis' +
        'cais.filial'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                   AND m.financeiro<>0'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                   AND m.data <= produtosdadosfi' +
        'scais.data'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                 ORDER BY m.data DESC, m.lancto ' +
        'DESC'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                 LIMIT 1)) AS numeromovimento'
      '         FROM'
      '           (SELECT df.nome,'
      
        '                   cast(cast(df.tipocliente AS varchar)||cast(df' +
        '.cliente AS varchar) AS varchar) AS cliente,'
      '                   df.conceito,'
      '                   cc.descricao AS descricaoconceito,'
      '                   df.vendedor,'
      '                   pdf.produto,'
      '                   pdf.filial,'
      '                   df.numero AS dadofiscal,'
      '                   n.serie,'
      '                   n.numero AS notafiscal,'
      '                   c.maquina,'
      '                   c.intervensao,'
      '                   c.numero AS cupomfiscal,'
      '                   df.data,'
      '                   df.filialvenda,'
      '                   df.filialemissao,'
      '                   pdf.quantidade,'
      '                   pdf.precotabela AS preco_pauta,'
      '                   pdf.precovenda AS preco_vista,'
      
        '                   (coalesce(pdf.desconto, 0)+coalesce(pdf.valor' +
        'descontoitem, 0))/pdf.quantidade AS desconto,'
      
        '                   coalesce(pdf.acrescimo, 0)/pdf.quantidade AS ' +
        'juros,'
      
        '                   pdf.precovenda + (-coalesce(pdf.desconto, 0) ' +
        '- coalesce(pdf.valordescontoitem, 0) + coalesce(pdf.acrescimo, 0' +
        '))/pdf.quantidade AS preco_prazo,'
      
        '                   pdf.frete, - ratearfrete_pago_dadosfiscais(df' +
        '.numero, pdf.produto) AS frete_pago,'
      
        '                                cast(DF.plano AS varchar) AS pla' +
        'no,'
      '                                pdf.icmsvalor,'
      '                                pdf.movimento,'
      
        '                                coalesce(pdf.composto, FALSE) AS' +
        ' composto'
      '            FROM (((((DadosFiscais DF'
      
        '                      JOIN ProdutosDadosFiscais PDF ON DF.numero' +
        '=PDF.dadofiscal)'
      
        '                     JOIN contratos ct ON ct.numero = df.contrat' +
        'o)'
      
        '                    LEFT JOIN conceitos cc ON df.conceito = cc.c' +
        'odigo)'
      '                   LEFT JOIN Notas N ON DF.numero=N.dadofiscal)'
      '                  LEFT JOIN Cupons C ON DF.numero=C.dadofiscal)'
      
        '            WHERE DF.data BETWEEN ('#39'01/11/2018'#39') AND ('#39'30/04/201' +
        '9'#39')'
      '              AND df.situacao NOT IN ('#39'C'#39','
      '                                      '#39'D'#39')'
      '              AND CASE'
      '                      WHEN ct.os THEN ct.tipoequipamento IN (1,'
      '                                                             2)'
      
        '                           AND NOT (coalesce(ct.os_garantia, FAL' +
        'SE)'
      
        '                                    AND ct.os_garantia_status='#39'A' +
        #39')'
      
        '                           AND NOT coalesce(ct.os_cortesia, FALS' +
        'E)'
      '                      ELSE TRUE'
      '                  END'
      '              AND (eHNotaFiscalSaidaVenda(df.codigofiscal)'
      '                   OR mod(df.codigofiscal, 1000) IN (929))'
      '              AND NOT coalesce(df.notavinculada, FALSE)'
      '              '
      '              AND (pdf.produto IN'
      '                     (SELECT p.codigo'
      '                      FROM produtos p'
      
        '                      WHERE p.codigo in (1248200,1248100,1665800' +
        ')))  ) AS ProdutosDadosFiscais) AS ProdutosDadosFiscaisMovimento' +
        'sEncontrado'
      
        '      LEFT JOIN movimentos m ON ProdutosDadosFiscaisMovimentosEn' +
        'contrado.numeromovimento=m.numero) AS ProdutosDadosFiscaisMovime' +
        'ntos'
      '   JOIN (filiais f'
      '         LEFT JOIN (filiaisgruposfiliais fgf'
      
        '                    JOIN gruposfiliais gf ON fgf.grupo=gf.codigo' +
        ') ON f.codigo=fgf.filial) ON ProdutosDadosFiscaisMovimentos.fili' +
        'alvenda=f.codigo'
      
        '   LEFT JOIN planos pl ON cast(ProdutosDadosFiscaisMovimentos.pl' +
        'ano AS integer)=pl.codigo'
      
        '   LEFT JOIN usuarios u ON ProdutosDadosFiscaisMovimentos.vended' +
        'or=u.codigo'
      '   JOIN (estoques e'
      '         JOIN (produtos p'
      '               JOIN ((caracteristicas c'
      '                      JOIN grupos g ON c.grupo = g.codigo)'
      
        '                     JOIN classes cl ON c.classe=cl.codigo) ON p' +
        '.caracteristica = c.codigo) ON e.produto = p.codigo) ON Produtos' +
        'DadosFiscaisMovimentos.produto=e.produto'
      '   AND ProdutosDadosFiscaisMovimentos.filial=e.filial'
      '   WHERE TRUE )'
      'UNION ALL'
      '  (SELECT ProdutosDadosFiscaisMovimentos.*,'
      '          u.nome AS nomevendedor,'
      '          p.descricao,'
      '          p.valorgrade1,'
      '          p.valorgrade2,'
      '          c.grupo,'
      '          g.descricao AS grupodescricao,'
      '          c.classe,'
      '          cl.descricao AS classegrupo,'
      '          f.nome AS nomefilialvenda,'
      ''
      '     (SELECT f2.nome'
      '      FROM filiais f2'
      
        '      WHERE f2.codigo = ProdutosDadosFiscaisMovimentos.filialemi' +
        'ssao) AS nomefilialemissao,'
      '          fgf.grupo AS grupofilialvenda,'
      '          gf.descricao AS nomegrupofilialvenda,'
      '          pl.descricao AS nomeplano,'
      '          CASE'
      
        '              WHEN preco_custo<>0 THEN (((Preco_Prazo/preco_cust' +
        'o)-1)*100)'
      '              ELSE cast(0 AS numeric)'
      '          END AS markup,'
      '          CASE'
      
        '              WHEN preco_prazo<>0 THEN (quantidade*(Preco_Prazo-' +
        'preco_custo))'
      '              ELSE cast(0 AS numeric)'
      '          END AS margem,'
      '          CASE'
      
        '              WHEN preco_prazo<>0 THEN (((Preco_Prazo-preco_cust' +
        'o)/Preco_Prazo)*100)'
      '              ELSE cast(0 AS numeric)'
      '          END AS pmargem,'
      '          cast('#39'V'#39' AS varchar) AS Tipo'
      '   FROM'
      '     (SELECT ProdutosDadosFiscaisMovimentosEncontrado.*,'
      '             CASE'
      
        '                 WHEN NOT coalesce(ProdutosDadosFiscaisMovimento' +
        'sEncontrado.composto, FALSE) THEN CASE'
      
        '                                                                ' +
        '                                      WHEN m.quantidade=0 THEN 0' +
        '.00'
      
        '                                                                ' +
        '                                      ELSE @(m.valor/m.quantidad' +
        'e)'
      
        '                                                                ' +
        '                                  END'
      '                 ELSE CASE'
      
        '                                                                ' +
        '                                                     WHEN coales' +
        'ce(ProdutosDadosFiscaisMovimentosEncontrado.quantidade, 0)=0 THE' +
        'N 0.00'
      
        '                                                                ' +
        '                                                     ELSE'
      
        '                                                                ' +
        '                                                            (SEL' +
        'ECT @(sum(m1.valor))'
      
        '                                                                ' +
        '                                                             FRO' +
        'M movimentos m1'
      
        '                                                                ' +
        '                                                             WHE' +
        'RE m1.cmpmovimento=ProdutosDadosFiscaisMovimentosEncontrado.Nume' +
        'roMovimento)/ProdutosDadosFiscaisMovimentosEncontrado.quantidade'
      
        '                                                                ' +
        '                                                 END'
      '             END AS preco_custo,'
      
        '             coalesce((m.emestoque+m.reservado+m.transito+m.demo' +
        'nstracao+m.conserto+m.danificada),0) AS qtemestoque'
      '      FROM'
      
        '        (SELECT ProdutosDadosFiscais.*,  coalesce(produtosdadosf' +
        'iscais.movimento, COALESCE ('
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '        (SELECT m.numero'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '         FROM movimentos m'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '         WHERE m.dadofiscal=produtosdadosfiscais.dadofiscal'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '           AND m.produto=produtosdadosfiscais.produto'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '           AND m.filial=produtosdadosfiscais.filial'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '         LIMIT 1)),'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                              (SELECT m.numero'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                               FROM movimentos m'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                               WHERE m.produto=produtosdadosfisc' +
        'ais.produto'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                 AND m.filial=produtosdadosfisca' +
        'is.filial'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                 AND m.financeiro<>0'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                 AND m.data <= produtosdadosfisc' +
        'ais.data'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                               ORDER BY m.data DESC, m.lancto DE' +
        'SC'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                               LIMIT 1)) AS numeromovimento'
      '         FROM'
      '           (SELECT df.nome,'
      
        '                   cast(cast(df.tipocliente AS varchar)||cast(df' +
        '.cliente AS varchar) AS varchar) AS cliente,'
      '                   df.conceito,'
      '                   cc.descricao AS descricaoconceito,'
      '                   df.vendedor,'
      '                   pdf.produto,'
      '                   pdf.filial,'
      '                   df.numero AS dadofiscal,'
      '                   n.serie,'
      '                   n.numero AS notafiscal,'
      '                   c.maquina,'
      '                   c.intervensao,'
      '                   c.numero AS cupomfiscal,'
      '                   df.data,'
      '                   df.filialvenda,'
      '                   df.filialemissao,'
      '                   pdf.quantidade,'
      '                   pdf.precotabela AS preco_pauta,'
      '                   pdf.precovenda AS preco_vista,'
      
        '                   (coalesce(pdf.desconto, 0) + coalesce(pdf.val' +
        'ordescontoitem, 0))/pdf.quantidade AS desconto,'
      
        '                   coalesce(pdf.acrescimo, 0)/pdf.quantidade AS ' +
        'juros,'
      
        '                   pdf.precovenda + (- coalesce(pdf.desconto, 0)' +
        ' - coalesce(pdf.valordescontoitem, 0) + coalesce(pdf.acrescimo, ' +
        '0))/pdf.quantidade AS preco_prazo,'
      
        '                   pdf.frete, - ratearfrete_pago_dadosfiscais(df' +
        '.numero, pdf.produto) AS frete_pago,'
      
        '                                cast(DF.plano AS varchar) AS pla' +
        'no,'
      '                                pdf.icmsvalor,'
      '                                pdf.movimento,'
      
        '                                coalesce(pdf.composto, FALSE) AS' +
        ' composto'
      '            FROM ((((DadosFiscais DF'
      
        '                     JOIN ProdutosDadosFiscais PDF ON DF.numero=' +
        'PDF.dadofiscal)'
      
        '                    LEFT JOIN conceitos cc ON df.conceito = cc.c' +
        'odigo)'
      '                   LEFT JOIN Notas N ON DF.numero=N.dadofiscal)'
      '                  LEFT JOIN Cupons C ON DF.numero=C.dadofiscal)'
      '            WHERE df.numero = pdf.dadofiscal'
      '              AND df.data BETWEEN '#39'01/11/2018'#39' AND '#39'30/04/2019'#39
      '              AND df.situacao NOT IN ('#39'C'#39','
      '                                      '#39'D'#39')'
      '              AND (eHNotaFiscalSaidaVenda(pdf.codigofiscal)'
      '                   OR mod(pdf.codigofiscal, 1000) IN (929))'
      '              AND NOT coalesce(df.notavinculada, FALSE)'
      '              AND df.contrato IS NULL'
      '              AND (pdf.produto IN'
      '                     (SELECT p.codigo'
      '                      FROM produtos p'
      
        '                      WHERE p.codigo in (1248200,1248100,1665800' +
        ')))  ) AS ProdutosDadosFiscais) AS ProdutosDadosFiscaisMovimento' +
        'sEncontrado'
      
        '      LEFT JOIN movimentos m ON ProdutosDadosFiscaisMovimentosEn' +
        'contrado.numeromovimento=m.numero) AS ProdutosDadosFiscaisMovime' +
        'ntos'
      '   JOIN (filiais f'
      '         LEFT JOIN (filiaisgruposfiliais fgf'
      
        '                    JOIN gruposfiliais gf ON fgf.grupo=gf.codigo' +
        ') ON f.codigo=fgf.filial) ON ProdutosDadosFiscaisMovimentos.fili' +
        'alvenda=f.codigo'
      
        '   LEFT JOIN planos pl ON cast(ProdutosDadosFiscaisMovimentos.pl' +
        'ano AS integer)=pl.codigo'
      
        '   LEFT JOIN usuarios u ON ProdutosDadosFiscaisMovimentos.vended' +
        'or=u.codigo'
      '   JOIN (estoques e'
      '         JOIN (produtos p'
      '               JOIN ((caracteristicas c'
      '                      JOIN grupos g ON c.grupo=g.codigo)'
      
        '                     JOIN classes cl ON c.classe=cl.codigo) ON p' +
        '.caracteristica=c.codigo) ON e.produto=p.codigo) ON ProdutosDado' +
        'sFiscaisMovimentos.produto=e.produto'
      '   AND ProdutosDadosFiscaisMovimentos.filial=e.filial'
      '   WHERE TRUE )'
      'UNION ALL'
      '  (SELECT ProdutosDadosFiscaisMovimentos.*,'
      ''
      '     (SELECT u.nome'
      '      FROM usuarios u'
      
        '      WHERE u.codigo = ProdutosDadosFiscaisMovimentos.vendedor) ' +
        'AS nomevendedor,'
      '          p.descricao,'
      '          p.valorgrade1,'
      '          p.valorgrade2,'
      '          c.grupo,'
      '          g.descricao AS grupodescricao,'
      '          c.classe,'
      '          cl.descricao AS classegrupo,'
      '          f.nome AS nomefilialvenda,'
      '          cast('#39'DEVOLUCOES'#39' AS varchar) AS nomefilialemissao,'
      '          fgf.grupo AS grupofilialvenda,'
      '          gf.descricao AS nomegrupofilialvenda,'
      '          cast(NULL AS varchar) AS nomeplano, - CASE'
      
        '                                                    WHEN preco_c' +
        'usto<>0 THEN (((Preco_Prazo/preco_custo)-1)*100)'
      
        '                                                    ELSE cast(0 ' +
        'AS numeric)'
      '                                                END AS markup,'
      '                                                CASE'
      
        '                                                    WHEN preco_p' +
        'razo<>0 THEN (quantidade*(Preco_Prazo-preco_custo))'
      
        '                                                    ELSE cast(0 ' +
        'AS numeric)'
      
        '                                                END AS margem, -' +
        ' CASE'
      
        '                                                                ' +
        '     WHEN preco_prazo<>0 THEN (((Preco_Prazo-preco_custo)/Preco_' +
        'Prazo)*100)'
      
        '                                                                ' +
        '     ELSE cast(0 AS numeric)'
      
        '                                                                ' +
        ' END AS pmargem,'
      
        '                                                                ' +
        ' cast('#39'D'#39' AS varchar) AS Tipo'
      '   FROM'
      '     (SELECT'
      '        (SELECT coalesce(vf.razao, vf.nome)'
      '         FROM vfornecedores vf'
      '         WHERE vf.codigo = pnmcd.fornecedor'
      '           AND vf.tipo = pnmcd.tipofornecedor) AS nome,'
      
        '             cast(cast(pnmcd.tipofornecedor AS varchar)||cast(pn' +
        'mcd.fornecedor AS varchar) AS varchar) AS cliente,'
      '             pnmcd.conceito,'
      '             pnmcd.descricaoconceito,'
      '             coalesce(coalesce('
      '                                 (SELECT pdf.vendedor'
      '                                  FROM produtosdadosfiscais pdf'
      
        '                                  WHERE pdf.dadofiscal = pnmcd.d' +
        'adofiscal'
      
        '                                    AND pdf.produto = pnmcd.prod' +
        'uto'
      
        '                                    AND pdf.filial = pnmcd.filia' +
        'l),df.vendedor), pnmcd.vendedor) AS vendedor,'
      '             pnmcd.produto,'
      '             pnmcd.filial,'
      '             pnmcd.codigo AS dadofiscal,'
      '             pnmcd.serie,'
      '             pnmcd.numero AS notafiscal,'
      '             cast(NULL AS integer) AS maquina,'
      '             cast(NULL AS integer) AS intervensao,'
      '             cast(NULL AS integer) AS cupomfiscal,'
      '             pnmcd.data,'
      '             pnmcd.filialdevolucao AS filialvenda,'
      
        '             cast(0 AS integer) AS filialemissao, - pnmcd.quanti' +
        'dade AS quantidade,'
      
        '                                                    pnmcd.preco_' +
        'pauta AS preco_pauta,'
      
        '                                                    pnmcd.preco_' +
        'vista AS preco_vista,'
      
        '                                                    (coalesce(pn' +
        'mcd.desconto, 0) + coalesce(pnmcd.valordescontoitem, 0))/pnmcd.q' +
        'uantidade AS desconto,'
      
        '                                                    coalesce(pnm' +
        'cd.acrescimo, 0)/pnmcd.quantidade AS juros,'
      
        '                                                    pnmcd.preco_' +
        'vista + (-coalesce(pnmcd.desconto, 0) - coalesce(pnmcd.valordesc' +
        'ontoitem, 0) + coalesce(pnmcd.acrescimo, 0))/pnmcd.quantidade AS' +
        ' preco_prazo, - pnmcd.frete,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                ratearfrete_pago_dadosfiscais(pnmcd.dadofiscal, ' +
        'pnmcd.produto) AS frete_pago,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                cast(DF.plano AS varchar) AS plano, - pnmcd.icms' +
        'valor AS icmsvalor,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                      cast(NULL ' +
        'AS integer) AS movimento,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                      pnmcd.comp' +
        'osto,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                      cast(NULL ' +
        'AS integer) AS numeromovimento,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                      pnmcd.prec' +
        'o_custo AS preco_custo,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                      cast(NULL ' +
        'AS Numeric(9, 3)) AS qtemestoque'
      '      FROM'
      '        (SELECT pnmc.*,'
      ''
      '           (SELECT pdf.precotabela'
      '            FROM produtosdadosfiscais pdf'
      '            WHERE pdf.dadofiscal = pnmc.dadofiscal'
      '              AND pdf.produto = pnmc.produto) AS preco_pauta,'
      ''
      '           (SELECT pdf.precovenda'
      '            FROM produtosdadosfiscais pdf'
      '            WHERE pdf.dadofiscal = pnmc.dadofiscal'
      '              AND pdf.produto = pnmc.produto) AS preco_vista,'
      ''
      '           (SELECT pdf.desconto'
      '            FROM produtosdadosfiscais pdf'
      '            WHERE pdf.dadofiscal = pnmc.dadofiscal'
      '              AND pdf.produto = pnmc.produto) AS desconto,'
      ''
      '           (SELECT pdf.valordescontoitem'
      '            FROM produtosdadosfiscais pdf'
      '            WHERE pdf.dadofiscal = pnmc.dadofiscal'
      
        '              AND pdf.produto = pnmc.produto) AS valordescontoit' +
        'em,'
      ''
      '           (SELECT pdf.acrescimo'
      '            FROM produtosdadosfiscais pdf'
      '            WHERE pdf.dadofiscal = pnmc.dadofiscal'
      '              AND pdf.produto = pnmc.produto) AS acrescimo'
      '         FROM'
      '           (SELECT pnm.*,'
      '                   ct.vendedor,'
      '                   cc.codigo AS conceito,'
      '                   cc.descricao AS descricaoconceito'
      '            FROM'
      '              (SELECT np.data,'
      '                      np.serie,'
      '                      np.numero,'
      '                      np.filial AS filialdevolucao,'
      '                      np.codigo,'
      '                      np.fornecedor,'
      '                      np.tipofornecedor,'
      '                      m.produto,'
      '                      m.filial,'
      '                      m.quantidade,'
      '                      m.valor,'
      '                      pnp.frete,'
      '                      CASE'
      
        '                          WHEN NOT coalesce(c.composto, FALSE) T' +
        'HEN CASE'
      
        '                                                                ' +
        '        WHEN (m.quantidade=0'
      
        '                                                                ' +
        '              OR coalesce(m.valor/m.quantidade, 0)=0) THEN'
      
        '                                                                ' +
        '               (SELECT CASE'
      
        '                                                                ' +
        '                           WHEN m1.quantidade=0 THEN 0'
      
        '                                                                ' +
        '                           ELSE @(m1.valor/m1.quantidade)'
      
        '                                                                ' +
        '                       END'
      
        '                                                                ' +
        '                FROM movimentos m1'
      
        '                                                                ' +
        '                WHERE m1.tipomovimento='#39'RFV'#39
      
        '                                                                ' +
        '                  AND m1.contrato=np.contrato'
      
        '                                                                ' +
        '                  AND m1.produto=m.produto'
      
        '                                                                ' +
        '                LIMIT 1)'
      
        '                                                                ' +
        '        ELSE @(m.valor/m.quantidade)'
      
        '                                                                ' +
        '    END'
      '                          ELSE CASE'
      
        '                                   WHEN coalesce(m.quantidade, 0' +
        ')=0 THEN 0'
      '                                   ELSE'
      
        '                                          (SELECT @(sum(m1.valor' +
        '))'
      '                                           FROM movimentos m1'
      
        '                                           WHERE m1.cmpmovimento' +
        '=m.numero)/m.quantidade'
      '                               END'
      '                      END AS preco_custo,'
      '                      np.contrato,'
      '                      pnp.icmsvalor,'
      '                      pnp.dadofiscal,'
      '                      coalesce(c.composto, FALSE) AS composto'
      '               FROM (notaspag np'
      '                     JOIN (produtosnotaspag pnp'
      '                           JOIN produtos p'
      
        '                           JOIN caracteristicas c ON p.caracteri' +
        'stica = c.codigo ON pnp.produto = p.codigo'
      
        '                           JOIN movimentos m ON m.codigonota = p' +
        'np.codigonota'
      '                           AND m.numerocontrole = pnp.numero'
      
        '                           AND m.produto = pnp.produto) ON np.co' +
        'digo = pnp.codigonota)'
      
        '               WHERE np.data BETWEEN ('#39'01/11/2018'#39') AND ('#39'30/04/' +
        '2019'#39')'
      
        '                 AND ehnotafiscalentradadevolucao(pnp.codigofisc' +
        'al)'
      '                 AND np.contrato IS NOT NULL ) AS pnm'
      '            JOIN (contratos ct'
      
        '                  LEFT JOIN conceitos cc ON ct.conceito = cc.cod' +
        'igo) ON ct.numero = pnm.contrato'
      '            WHERE TRUE'
      '              AND CASE'
      '                      WHEN ct.os THEN ct.tipoequipamento IN (1,'
      '                                                             2)'
      
        '                           AND NOT (coalesce(ct.os_garantia, FAL' +
        'SE)'
      
        '                                    AND ct.os_garantia_status='#39'A' +
        #39')'
      
        '                           AND NOT coalesce(ct.os_cortesia, FALS' +
        'E)'
      '                      ELSE TRUE'
      '                  END'
      '              AND (pnm.produto IN'
      '                     (SELECT p.codigo'
      '                      FROM produtos p'
      
        '                      WHERE p.codigo in (1248200,1248100,1665800' +
        ')))  ) AS pnmc) AS pnmcd'
      '                      '
      
        '      JOIN dadosfiscais df ON pnmcd.dadofiscal = df.numero) AS P' +
        'rodutosDadosFiscaisMovimentos'
      '   JOIN (filiais f'
      '         LEFT JOIN (filiaisgruposfiliais fgf'
      
        '                    JOIN gruposfiliais gf ON fgf.grupo=gf.codigo' +
        ') ON f.codigo=fgf.filial) ON ProdutosDadosFiscaisMovimentos.fili' +
        'alvenda = f.codigo'
      '   JOIN (estoques e'
      '         JOIN (produtos p'
      '               JOIN ((caracteristicas c'
      '                      JOIN grupos g ON c.grupo=g.codigo)'
      
        '                     JOIN classes cl ON c.classe=cl.codigo) ON p' +
        '.caracteristica=c.codigo) ON e.produto=p.codigo) ON ProdutosDado' +
        'sFiscaisMovimentos.produto=e.produto'
      '   AND ProdutosDadosFiscaisMovimentos.filial=e.filial'
      '   WHERE TRUE )'
      '   '
      'UNION ALL'
      ''
      '  (SELECT pnmc.*, - CASE'
      
        '                        WHEN preco_custo<>0 THEN (((Preco_Prazo/' +
        'preco_custo)-1)*100)'
      '                        ELSE cast(0 AS numeric)'
      '                    END AS markup,'
      '                    CASE'
      
        '                        WHEN preco_prazo<>0 THEN (quantidade*(Pr' +
        'eco_Prazo-preco_custo))'
      '                        ELSE cast(0 AS numeric)'
      '                    END AS margem, - CASE'
      
        '                                         WHEN preco_prazo<>0 THE' +
        'N (((Preco_Prazo-preco_custo)/Preco_Prazo)*100)'
      '                                         ELSE cast(0 AS numeric)'
      '                                     END AS pmargem,'
      
        '                                     cast('#39'D'#39' AS varchar) AS Tip' +
        'o'
      '   FROM'
      '     (SELECT'
      '        (SELECT coalesce(vf.razao, vf.nome)'
      '         FROM vfornecedores vf'
      '         WHERE vf.codigo = pnm.fornecedor'
      '           AND vf.tipo = pnm.tipofornecedor) AS nome,'
      
        '             cast(cast(pnm.tipofornecedor AS varchar)||cast(pnm.' +
        'fornecedor AS varchar) AS varchar) AS cliente,'
      '             pnm.conceito,'
      '             pnm.descricaoconceito,'
      '             cast(NULL AS integer) AS vendedor,'
      '             pnm.produto,'
      '             pnm.filial,'
      '             cast(NULL AS integer) AS dadofiscal,'
      '             pnm.serie,'
      '             pnm.numero AS notafiscal,'
      '             cast(NULL AS integer) AS maquina,'
      '             cast(NULL AS integer) AS intervensao,'
      '             cast(NULL AS integer) AS cupomfiscal,'
      '             pnm.data,'
      '             pnm.filialvenda,'
      
        '             cast(0 AS integer) AS filialemissao, - pnm.quantida' +
        'de AS quantidade,'
      
        '                                                    pnm.precouni' +
        'tario AS preco_pauta,'
      
        '                                                    pnm.precouni' +
        'tario AS preco_vista,'
      
        '                                                    pnm.desconto' +
        ','
      
        '                                                    pnm.acrescim' +
        'o AS juros,'
      
        '                                                    pnm.precouni' +
        'tario + (-coalesce(pnm.desconto, 0) + coalesce(pnm.acrescimo, 0)' +
        ') AS preco_prazo, - pnm.frete, /*ratearfrete_pago_dadosfiscais(p' +
        'nm.contrato, pnm.produto)*/ 0.00 AS frete_pago,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                            cast(NULL AS varchar) AS plano, - pn' +
        'm.icmsvalor AS icmsvalor,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              ca' +
        'st(NULL AS integer) AS movimento,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              co' +
        'alesce(c.composto, FALSE) AS composto,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              ca' +
        'st(NULL AS integer) AS numeromovimento,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              pn' +
        'm.preco_custo,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              ca' +
        'st(NULL AS Numeric(9, 3)) AS qtemestoque,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              ca' +
        'st(NULL AS varchar(40)) AS nomevendedor,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              p.' +
        'descricao,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              p.' +
        'valorgrade1,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              p.' +
        'valorgrade2,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              c.' +
        'grupo,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              g.' +
        'descricao AS grupodescricao,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              c.' +
        'classe,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              cl' +
        '.descricao AS classegrupo,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              f.' +
        'nome AS nomefilialvenda,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              ca' +
        'st('#39'DEVOLUCOES'#39' AS varchar) AS nomefilialemissao,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              fg' +
        'f.grupo AS grupofilialvenda,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              gf' +
        '.descricao AS nomegrupofilialvenda,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              ca' +
        'st(NULL AS varchar) AS nomeplano'
      '      FROM'
      '        (SELECT np.data,'
      '                np.serie,'
      '                np.numero,'
      '                np.filial AS filialvenda,'
      '                np.codigo,'
      '                np.fornecedor,'
      '                np.tipofornecedor,'
      '                vf.conceito,'
      '                cc.descricao AS descricaoconceito,'
      '                m.produto,'
      '                m.filial,'
      '                m.quantidade,'
      '                pnp.precounitario,'
      '                pnp.frete,'
      
        '                (coalesce(pnp.desconto, 0)+coalesce(pnp.valordes' +
        'contoitem, 0))/pnp.quantidade AS desconto, coalesce(pnp.seguro, ' +
        '0)/pnp.quantidade AS seguro,'
      
        '                                                                ' +
        '                                                                ' +
        '                               coalesce(pnp.acrescimo, 0)/pnp.qu' +
        'antidade AS acrescimo,'
      
        '                                                                ' +
        '                                                                ' +
        '                               m.valor,'
      
        '                                                                ' +
        '                                                                ' +
        '                               CASE'
      
        '                                                                ' +
        '                                                                ' +
        '                                   WHEN NOT coalesce(c.composto,' +
        ' FALSE) THEN (@(CASE'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                    WHEN m.quantidade=0 THEN 0.00'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                    ELSE m.valor/m.quantidade'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                END))'
      
        '                                                                ' +
        '                                                                ' +
        '                                   ELSE CASE'
      
        '                                                                ' +
        '                                                                ' +
        '                                            WHEN coalesce(m.quan' +
        'tidade, 0)=0 THEN 0.00'
      
        '                                                                ' +
        '                                                                ' +
        '                                            ELSE'
      
        '                                                                ' +
        '                                                                ' +
        '                                                   (SELECT @(sum' +
        '(m1.valor))'
      
        '                                                                ' +
        '                                                                ' +
        '                                                    FROM movimen' +
        'tos m1'
      
        '                                                                ' +
        '                                                                ' +
        '                                                    WHERE m1.cmp' +
        'movimento=m.numero)/m.quantidade'
      
        '                                                                ' +
        '                                                                ' +
        '                                        END'
      
        '                                                                ' +
        '                                                                ' +
        '                               END AS preco_custo,'
      
        '                                                                ' +
        '                                                                ' +
        '                               np.contrato,'
      
        '                                                                ' +
        '                                                                ' +
        '                               pnp.icmsvalor'
      '         FROM notaspag np'
      '         JOIN produtosnotaspag pnp'
      '         JOIN produtos p'
      
        '         JOIN caracteristicas c ON p.caracteristica = c.codigo O' +
        'N pnp.produto = p.codigo'
      '         JOIN movimentos m ON pnp.codigonota = m.codigonota'
      '         AND pnp.produto = m.produto'
      
        '         AND pnp.numero = m.numerocontrole ON np.codigo = pnp.co' +
        'digonota'
      '         JOIN (vfornecedores vf'
      
        '               LEFT JOIN conceitos cc ON vf.conceito = cc.codigo' +
        ') ON np.fornecedor = vf.codigo'
      '         AND np.tipofornecedor = vf.tipo'
      '         WHERE np.data BETWEEN ('#39'01/11/2018'#39') AND ('#39'30/04/2019'#39')'
      '           AND ehnotafiscalentradadevolucao(np.codigofiscal)'
      '           AND np.contrato IS NULL ) AS pnm'
      '      JOIN (filiais f'
      '            LEFT JOIN (filiaisgruposfiliais fgf'
      
        '                       JOIN gruposfiliais gf ON fgf.grupo=gf.cod' +
        'igo) ON f.codigo=fgf.filial) ON pnm.filialvenda = f.codigo'
      '      JOIN (estoques e'
      '            JOIN (produtos p'
      '                  JOIN ((caracteristicas c'
      '                         JOIN grupos g ON c.grupo=g.codigo)'
      
        '                        JOIN classes cl ON c.classe = cl.codigo)' +
        ' ON p.caracteristica=c.codigo) ON e.produto=p.codigo) ON pnm.pro' +
        'duto = e.produto'
      '      AND pnm.filial = e.filial'
      '      '
      '      WHERE TRUE'
      '        AND (pnm.produto IN'
      '               (SELECT p.codigo'
      '                FROM produtos p'
      
        '                WHERE p.codigo in (1248200,1248100,1665800)))  )' +
        ' AS pnmc)'
      'ORDER BY classe,'
      '         grupo,'
      '         descricao,'
      '         valorgrade1,'
      '         valorgrade2,'
      '         DATA,'
      '         serie,'
      '         notafiscal,'
      '         maquina,'
      '         intervensao,'
      '         cupomfiscal'
      ') as cmv'
      'group by produto'
      '          '
      ' '
      ' ) as cmv'
      ' on vendas.codigoproduto = cmv.produto'
      ''
      ') as vendas')
    RequestLive = False
    Left = 160
    Top = 32
    ParamData = <
      item
        DataType = ftString
        Name = 'FilialBase'
        ParamType = ptUnknown
        Value = '9'
      end>
    object qryAnaliseEstoquesproduto: TStringField
      DisplayLabel = 'ITEM'
      DisplayWidth = 20
      FieldName = 'produto'
      Size = 30
    end
    object qryAnaliseEstoquesdescricao_produto: TStringField
      DisplayLabel = 'DESCRI'#199#195'O DO PRODUTO'
      DisplayWidth = 50
      FieldName = 'descricao_produto'
      Size = 100
    end
    object qryAnaliseEstoquescaracteristicavisual: TStringField
      DisplayLabel = 'PRODUTO'
      DisplayWidth = 20
      FieldName = 'caracteristicavisual'
      Size = 30
    end
    object qryAnaliseEstoquesgrupo: TStringField
      DisplayLabel = 'GRUPO'
      DisplayWidth = 6
      FieldName = 'grupo'
      Size = 4
    end
    object qryAnaliseEstoquesdescricao_grupo: TStringField
      DisplayLabel = 'DESCRI'#199#195'O DO GRUPO'
      DisplayWidth = 20
      FieldName = 'descricao_grupo'
      Size = 30
    end
    object qryAnaliseEstoquesmarca: TIntegerField
      DisplayLabel = 'MARCA'
      FieldName = 'marca'
    end
    object qryAnaliseEstoquesdescricao_marca: TStringField
      DisplayLabel = 'DESCRI'#199#195'O DA MARCA'
      FieldName = 'descricao_marca'
      Size = 60
    end
    object qryAnaliseEstoquescomposto: TBooleanField
      DisplayLabel = 'COMPOSTO'
      FieldName = 'composto'
    end
    object qryAnaliseEstoquesresultadocurvaabc: TStringField
      DisplayLabel = 'ABC'
      DisplayWidth = 5
      FieldName = 'resultadocurvaabc'
      Size = 1
    end
    object qryAnaliseEstoquesquantidade_total_estoque: TFloatField
      DisplayLabel = 'QTDE TOTAL ESTOQUE'
      DisplayWidth = 23
      FieldName = 'quantidade_total_estoque'
      DisplayFormat = '#########'
    end
    object qryAnaliseEstoquesquantidade_totao_pedidos: TFloatField
      DisplayLabel = 'QTDE TOTAL PEDIDO'
      DisplayWidth = 23
      FieldName = 'quantidade_totao_pedidos'
      DisplayFormat = '#########'
    end
    object qryAnaliseEstoquespromocao: TIntegerField
      DisplayLabel = 'PROMO'#199#195'O'
      FieldName = 'promocao'
    end
    object qryAnaliseEstoquesdescricao_promocao: TStringField
      DisplayLabel = 'DESCRI'#199#195'O DA PROMO'#199#195'O'
      DisplayWidth = 50
      FieldName = 'descricao_promocao'
      Size = 100
    end
    object qryAnaliseEstoquesmes_11_2018: TFloatField
      FieldName = 'mes_11_2018'
    end
    object qryAnaliseEstoquesmes_12_2018: TFloatField
      FieldName = 'mes_12_2018'
    end
    object qryAnaliseEstoquesmes_01_2019: TFloatField
      FieldName = 'mes_01_2019'
    end
    object qryAnaliseEstoquesmes_02_2019: TFloatField
      FieldName = 'mes_02_2019'
    end
    object qryAnaliseEstoquesmes_03_2019: TFloatField
      FieldName = 'mes_03_2019'
    end
    object qryAnaliseEstoquesmes_04_2019: TFloatField
      FieldName = 'mes_04_2019'
    end
    object qryAnaliseEstoquestotal_vendas_periodo: TFloatField
      DisplayLabel = 'T.VENDAS PER'#205'ODO'
      DisplayWidth = 13
      FieldName = 'total_vendas_periodo'
      DisplayFormat = '#######'
    end
    object qryAnaliseEstoquesnmesesperiodo: TFloatField
      DisplayLabel = 'N.MESES'
      FieldName = 'nmesesperiodo'
      DisplayFormat = '###'
    end
    object qryAnaliseEstoquesndiasperiodo: TIntegerField
      DisplayLabel = 'N.DIAS'
      FieldName = 'ndiasperiodo'
      DisplayFormat = '###'
    end
    object qryAnaliseEstoquesmedia_vendas_periodo: TFloatField
      DisplayLabel = 'M'#201'DIA VENDA DO PER'#205'ODO'
      DisplayWidth = 13
      FieldName = 'media_vendas_periodo'
      DisplayFormat = '#,###,##0.00'
    end
    object qryAnaliseEstoquestotal_vendas_6_mese_anteriores: TFloatField
      DisplayLabel = 'VENDAS 6 MESES ANT.'
      DisplayWidth = 13
      FieldName = 'total_vendas_6_mese_anteriores'
      DisplayFormat = '#,###,##0.00'
    end
    object qryAnaliseEstoquesdias_estoque: TFloatField
      DisplayLabel = 'DIAS ESTOQE'
      FieldName = 'dias_estoque'
      DisplayFormat = '###'
    end
    object qryAnaliseEstoquesvalor_em_estoque: TFloatField
      DisplayLabel = 'VLR EM ESTOQE'
      DisplayWidth = 13
      FieldName = 'valor_em_estoque'
      DisplayFormat = '#,###,##0.00'
    end
    object qryAnaliseEstoquesnomefornecedor: TStringField
      DisplayLabel = 'NOME DO FORNECEDOR'
      FieldName = 'nomefornecedor'
      Size = 60
    end
    object qryAnaliseEstoquesprecoultimaentrada: TFloatField
      DisplayLabel = '$ ULTIMA ENTRADA'
      DisplayWidth = 13
      FieldName = 'precoultimaentrada'
      DisplayFormat = '#,###,##0.00'
    end
    object qryAnaliseEstoquesdataultimaentrada: TDateField
      DisplayLabel = 'DATA '#218'LTIMA ENTRADA'
      FieldName = 'dataultimaentrada'
    end
    object qryAnaliseEstoquespreco_prazo_cmv: TFloatField
      DisplayLabel = 'PRE'#199'O PRAZO CMV'
      DisplayWidth = 13
      FieldName = 'preco_prazo_cmv'
      DisplayFormat = '#,###,##0.00'
    end
    object qryAnaliseEstoquespreco_custo_cmv: TFloatField
      DisplayLabel = 'PRE'#199'O CUSTO CMV'
      DisplayWidth = 13
      FieldName = 'preco_custo_cmv'
      DisplayFormat = '#,###,##0.00'
    end
    object qryAnaliseEstoquesmargem_cmv: TFloatField
      DisplayLabel = 'MARGEM CMV'
      FieldName = 'margem_cmv'
      DisplayFormat = '###'
    end
    object qryAnaliseEstoquesestoques_preconormal: TFloatField
      DisplayLabel = 'PRE'#199'O NORMAL'
      DisplayWidth = 13
      FieldName = 'estoques_preconormal'
      DisplayFormat = '#,###,##0.00'
    end
    object qryAnaliseEstoquescusto_unitario_cmv: TFloatField
      DisplayLabel = 'CUSTO UNIT. CMV'
      DisplayWidth = 13
      FieldName = 'custo_unitario_cmv'
      DisplayFormat = '#,###,##0.00'
    end
    object qryAnaliseEstoquesmargem_uc: TFloatField
      DisplayLabel = 'MARGEM UC'
      DisplayWidth = 10
      FieldName = 'margem_uc'
      DisplayFormat = '###'
    end
    object qryAnaliseEstoquesmargem_cm: TFloatField
      DisplayLabel = 'MARGEM CMV'
      DisplayWidth = 10
      FieldName = 'margem_cm'
      DisplayFormat = '###'
    end
  end
  object dsrAnaliseEstoques: TtecDataSource
    DataSet = qryAnaliseEstoques
    Left = 344
    Top = 120
  end
  object qryAnaliseEstoques_aux: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnCalcFields = qryAnaliseEstoques_auxCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'ListadeFiliaisMovimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListadeFiliaisEstoques'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'meses'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListadeItemProdutos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListadeProdutos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CondicaoCompostos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListadeGrupos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListadeClasses'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListadeMarcas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaCondicionalPromocoes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListadeFornecedores'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaGruposFornecedores'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListadeFiliaisNotasPag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListadeFiliaisDadosFiscais'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select vendas.*,'
      '       case when coalesce(estoques_preconormal,0)<>0 then'
      
        '         round((((estoques_preconormal - precoultimaentrada) / e' +
        'stoques_preconormal) *100),0) '
      '       else 0 end as margem_uc,'
      '       '
      '       case when coalesce(estoques_preconormal,0)<>0 then  '
      
        '         round((((estoques_preconormal - custo_unitario_cmv) / e' +
        'stoques_preconormal) *100),0) '
      '       else 0 end as margem_cm       '
      '       '
      'from'
      '('
      'select vendas.*,'
      '       cmv.preco_prazo_cmv,'
      '       cmv.preco_custo_cmv,'
      '         '
      '       case when coalesce(cmv.preco_prazo_cmv,0)<>0 then '
      '         round((((cmv.preco_prazo_cmv -'
      '          cmv.preco_custo_cmv) / cmv.preco_prazo_cmv) *100),2) '
      '       ELSE 0.00 end as margem_cmv,'
      '        '
      
        '       estoques_preconormal(vendas.codigoproduto, :FilialBase ) ' +
        'as estoques_preconormal,'
      '       '
      '       case when coalesce(cmv.quantidade_cmv,0)<>0 then'
      '         round((cmv.preco_custo_cmv / cmv.quantidade_cmv),2) '
      '       else 0.00 end as custo_unitario_cmv'
      ''
      ''
      'from'
      '('
      'select vendas.*,'
      ''
      
        '       round((TOTAL_VENDAS_PERIODO / NMesesPeriodo)) as MEDIA_VE' +
        'NDAS_PERIODO,'
      '       '
      
        '       (SELECT SUM(case when substr(m.operacao,13,1) = '#39'+'#39' then ' +
        ' abs(m.quantidade) else -abs(m.quantidade) end)'
      
        '        FROM movimentos m join dadosfiscais df on m.dadofiscal =' +
        ' df.numero'
      
        '        WHERE m.data between (cast(:DataInicial AS date) - inter' +
        'val'#39'6 months'#39') and :DataInicial'
      
        '         and (substr(m.operacao,13,1) = '#39'+'#39' or substr(m.operacao' +
        ',13,1) = '#39'-'#39')'
      '         AND m.produto = vendas.codigoproduto'
      '         %ListadeFiliaisMovimento'
      '         ) as TOTAL_VENDAS_6_MESE_ANTERIORES,'
      ''
      '      case when coalesce(TOTAL_VENDAS_PERIODO,0)<>0 then'
      
        '        round((quantidade_total_estoque + quantidade_totao_pedid' +
        'os) /  (TOTAL_VENDAS_PERIODO / NDiasPeriodo),0)'
      '      else 0 end as DIAS_ESTOQUE,'
      ''
      '      (select SUM(e.financeiro)'
      '       from estoques e'
      '       where e.produto = vendas.codigoproduto'
      '         %ListadeFiliaisEstoques) as VALOR_EM_ESTOQUE,'
      ''
      '       coalesce(compras.nomefornecedor, (select f.nome'
      
        '                                         from fornecedoresprodut' +
        'os fp'
      
        '                                              join fornecedores ' +
        'f on fp.fornecedor = f.codigo'
      
        '                                         where fp.caracteristica' +
        ' = vendas.caracteristica limit 1)) as nomefornecedor,'
      '       compras.precoultimaentrada,'
      '       compras.dataultimaentrada'
      ''
      '       /*'
      ''
      '       (SELECT SUM(pdf.precovenda*abs(pdf.quantidade))'
      '        from movimentos m'
      '             join produtosdadosfiscais pdf'
      '              on m.dadofiscal = pdf.dadofiscal'
      '              and m.produto = pdf.produto'
      ''
      '        WHERE m.data between :DataInicial and :DataFinal'
      '         and (substr(m.operacao,13,1) = '#39'+'#39')'
      
        '         AND m.produto = vendas.codigoproduto)  as TOTAL_$_VENDA' +
        'S_PERIODO'
      ''
      '       */'
      ''
      'from'
      '('
      ''
      
        'select c.codigo as caracteristica, c.codigovisual as caracterist' +
        'icavisual,'
      '       c.grupo, g.descricao as descricao_grupo,'
      '       c.marca, c.descricao as descricao_marca,'
      '       c.composto,'
      '       p.resultadocurvaabc ,'
      '       p.codigovisual as produto,'
      '       p.codigo as codigoproduto,'
      '       p.descricao as descricao_produto,'
      
        '       quantidadetotaldoestoque(p.codigo, :ListadeFiliais) as qu' +
        'antidade_total_estoque, /*  */'
      
        '       pedidos_estoquepedido(p.codigo, :ListadeFiliais) as quant' +
        'idade_totao_pedidos,'
      ''
      '       p.promocao,'
      '       pro.descricao as descricao_promocao,'
      ''
      '       vendas.*,'
      ''
      
        '       (SELECT SUM(case when substr(m.operacao,13,1) = '#39'+'#39' then ' +
        ' abs(m.quantidade) else -abs(m.quantidade) end)'
      
        '        FROM movimentos m join dadosfiscais df on m.dadofiscal =' +
        ' df.numero'
      '        WHERE m.data between :DataInicial and :DataFinal'
      
        '         and (substr(m.operacao,13,1) = '#39'+'#39' or substr(m.operacao' +
        ',13,1) = '#39'-'#39')'
      '         AND m.produto = p.codigo'
      '         %ListadeFiliaisMovimento'
      '         ) as TOTAL_VENDAS_PERIODO,'
      '         '
      
        '         (select extract('#39'Month'#39' from age(:DataFinal, :DataInici' +
        'al))+1) as NMesesPeriodo,'
      
        '         (select cast(:DataFinal as date) - cast(:DataInicial as' +
        ' date)) as NDiasPeriodo'
      '      '
      ''
      'from caracteristicas c'
      ''
      '     join (produtos p'
      '           left join promocoes pro'
      '           on p.promocao = pro.codigo)'
      '           '
      '     on c.codigo = p.caracteristica'
      '     '
      '     join grupos g'
      '     on c.grupo = g.codigo'
      '     '
      '     join classes cl'
      '     on c.classe = cl.codigo'
      '     '
      '     join marcas m'
      '     on c.marca = m.codigo'
      ''
      ''
      'join'
      ''
      '('
      ''
      ''
      'SELECT * FROM crosstab'
      '('
      #39'select   produto, mes,'
      '          cast(sum(quantidade) as numeric(9,3)) as quantidade '
      '          from'
      ' ('
      ''
      '             '
      '               SELECT m.produto,'
      
        '                      cast(to_char(m.data,'#39#39'YYYY/mm'#39#39') as char(7' +
        ')) AS mes,'
      
        '                      case when substr(m.operacao,13,1) = '#39#39'+'#39#39' ' +
        'then  abs(m.quantidade) else -abs(m.quantidade) end as quantidad' +
        'e'
      '                      '
      '                      '
      '                      '
      ''
      '               FROM movimentos m '
      '               '
      '                    join'
      '                    ('
      '                          Select p.codigo'
      '              from ((((caracteristicas c'
      '                          join marcas m'
      '                          on c.marca = m.codigo)'
      ''
      '                         join grupos g'
      '                         on c.grupo = g.codigo)'
      ''
      '                        join classes cl'
      '                        on c.classe = cl.codigo)'
      ''
      '                       join (produtos p'
      '                            left join promocoes pro'
      '                            on p.promocao = pro.codigo)'
      '                       on p.caracteristica = c.codigo)'
      ''
      '             where p.caracteristica = c.codigo'
      '               and c.marca = m.codigo'
      '               and c.grupo = g.codigo'
      '               and c.classe = cl.codigo'
      ''
      '               /* %ListadeItemProdutosCrossTab */'
      '               /*   %ListadeProdutosCrossTab */'
      '               /*   %CondicaoCompostosCrossTab */'
      '               /*   %ListadeGruposCrossTab */  '
      '               /*   %ListadeClassesCrossTab */'
      '               /*   %ListadeMarcasCrossTab */'
      '               /*   %ListaCondicionalPromocoesCrossTab */'
      ''
      '               /*  %ListadeFornecedoresCrossTab */'
      '               /*  %ListaGruposFornecedoresCrossTab */'
      ''
      '               '
      '               '
      '               /*and p.codigo in (1248200,1248100,1665800)*/'
      ''
      ''
      '                     )'
      
        '                     as p on m.produto = p.codigo, dadosfiscais ' +
        'fc'
      '               WHERE true'
      ''
      ''
      
        '               /*   m.data between :DataInicial and :DataFinal *' +
        '/'
      '                 /*%IntervaloPeriodoCrossTab*/'
      '                 '
      '                 /*%ListadeFiliaisMovimentoCrossTab*/'
      ''
      ''
      '               AND fc.numero=m.dadofiscal'
      
        '               and (substr(m.operacao,13,1) = '#39#39'+'#39#39' or substr(m.' +
        'operacao,13,1) = '#39#39'-'#39#39')'
      '               order by m.produto, to_char(m.data,'#39#39'YYYY/mm'#39#39')'
      '                                         '
      '            '
      ''
      ''
      ''
      ' ) as temp'
      ' group by  produto, mes'
      ' order by 1,2'#39','
      ''
      #39'select distinct to_char(cast('#39#39
      ''
      '        %datainicial_1'
      ''
      
        '        '#39#39' as date)  + s.a,'#39#39'YYYY/MM'#39#39') as mes from generate_ser' +
        'ies(1,cast('#39#39
      ''
      '            %datafinal'
      '            '
      '            '#39#39' as date)-cast('#39#39
      ''
      '              %datainicial_2'
      '              '
      '             '#39#39' as date)) as s(a) order by 1'#39
      ')'
      'AS'
      ' ( '
      '   produto bigint,'
      '   '
      '   %meses'
      ''
      '   /*'
      '   MES_11_2018 numeric(9,3),'
      '   MES_12_2018 numeric(9,3),'
      '   MES_01_2019 numeric(9,3),'
      '   MES_02_2019 numeric(9,3),'
      '   MES_03_2019 numeric(9,3),'
      '   MES_04_2019 numeric(9,3)'
      '   */   '
      '   '
      '   '
      ')'
      ''
      ') as vendas on p.codigo = vendas.produto'
      ''
      'where true'
      '  %ListadeItemProdutos'
      '  %ListadeProdutos'
      '  %CondicaoCompostos'
      '  %ListadeGrupos '
      '  %ListadeClasses'
      '  %ListadeMarcas'
      '  %ListaCondicionalPromocoes'
      ''
      '  %ListadeFornecedores'
      '  %ListaGruposFornecedores'
      ''
      '  /*and p.codigo in (1248200,1248100,1665800)*/'
      ''
      ') as vendas'
      ''
      '     left join     '
      '     '
      '     ('
      '     '
      '     select nfp.*,'
      
        '            COALESCE(m.precocomicms, nfp.precoultimaentrada_nota' +
        ')  AS precoultimaentrada,'
      
        '            coalesce(m.data, dataultimaentrada_nota) AS dataulti' +
        'maentrada'
      '               '
      '     FROM'
      '     ('
      '               '
      ''
      '        select nfp.*,'
      '               f.nome as nomefornecedor, '
      '               '
      '               (select max(numero)'
      '                from movimentos m'
      '                where m.codigonota = nfp.codigonota'
      '                 and m.produto = nfp.codigoproduto      '
      
        '                 and (substr(m.operacao, 11, 1) <> '#39'*'#39')) as nume' +
        'romovimento,'
      '               '
      
        '               (select pnp.precounitario / coalesce(pnp.fatorcon' +
        'versao,1)'
      '                from produtosnotaspag pnp'
      '                where pnp.codigonota = nfp.codigonota'
      '                  and pnp.produto = nfp.codigoproduto'
      
        '                  order by pnp.precounitario desc limit 1 )  as ' +
        'precoultimaentrada_nota,'
      '              '
      '               np.data AS dataultimaentrada_nota'
      ''
      '        from'
      '        '
      '        ('
      '        select distinct p.codigo as codigoproduto,'
      ''
      '               (select max(np.codigo)'
      '                from notaspag np'
      '                     join produtosnotaspag pnp'
      ''
      '                     on np.codigo = pnp.codigonota'
      '                where pnp.produto =  p.codigo'
      '                  and np.tipofornecedor = '#39'F'#39
      
        '                  and ehnotafiscalentradacompra(pnp.codigofiscal' +
        ')'
      ''
      '                  %ListadeFiliaisNotasPag'
      ''
      ''
      ''
      '                     ) as codigonota'
      ''
      '        from fornecedoresprodutos fp'
      '             join ((((caracteristicas c'
      '                     join marcas m'
      '                     on c.marca = m.codigo)'
      ''
      '                     join grupos g'
      '                     on c.grupo = g.codigo)'
      ''
      '                     join classes cl'
      '                     on c.classe = cl.codigo)'
      ''
      '                     join (produtos p'
      '                           left join promocoes pro'
      '                            on p.promocao = pro.codigo)'
      '                     on p.caracteristica = c.codigo)'
      '            on fp.caracteristica = c.codigo'
      ''
      ''
      '        where true'
      ''
      '          %ListadeItemProdutos'
      '          %ListadeProdutos'
      '          %CondicaoCompostos'
      '          %ListadeGrupos '
      '          %ListadeClasses'
      '          %ListadeMarcas'
      '          %ListaCondicionalPromocoes'
      ''
      '          %ListadeFornecedores'
      '          %ListaGruposFornecedores'
      ''
      ''
      ''
      '        /*where p.codigo in (1248200,1248100,1665800)     */'
      ''
      '        order by p.codigo     '
      '        ) as nfp join notaspag np '
      
        '                      join fornecedores f on np.fornecedor = f.c' +
        'odigo and np.tipofornecedor = '#39'F'#39
      '                 on nfp.codigonota = np.codigo'
      '                     '
      '                 /* '
      '           left join movimentos m '
      '            on m.produto = nfp.codigoproduto'
      '           and (substr(m.operacao, 11, 1) <> '#39'*'#39')'
      '           and (m.codigonota = nfp.codigonota)'
      '           */'
      
        '       ) as nfp left join movimentos m on nfp.numeromovimento = ' +
        'm.numero    '
      '     '
      
        '     ) as compras on vendas.codigoproduto = compras.codigoprodut' +
        'o'
      ')  as vendas '
      '   left join '
      '   '
      ' ('
      ' '
      '  select cmv.produto, '
      '         sum(cmv.quantidade) as quantidade_cmv,'
      
        '         sum(cmv.quantidade * cmv.preco_prazo) as preco_prazo_cm' +
        'v,'
      
        '         sum(cmv.quantidade * cmv.preco_custo) as preco_custo_cm' +
        'v'
      '         '
      '        '
      '         '
      '  from'
      '  ('
      '  '
      '  ('
      '   SELECT ProdutosDadosFiscaisMovimentos.*,'
      '          u.nome AS nomevendedor,'
      '          p.descricao,'
      '          p.valorgrade1,'
      '          p.valorgrade2,'
      '          c.grupo,'
      '          g.descricao AS grupodescricao,'
      '          c.classe,'
      '          cl.descricao AS classegrupo,'
      '          f.nome AS nomefilialvenda,'
      ''
      '     (SELECT f2.nome'
      '      FROM filiais f2'
      
        '      WHERE f2.codigo = ProdutosDadosFiscaisMovimentos.filialemi' +
        'ssao) AS nomefilialemissao,'
      '          fgf.grupo AS grupofilialvenda,'
      '          gf.descricao AS nomegrupofilialvenda,'
      '          pl.descricao AS nomeplano,'
      '          CASE'
      
        '              WHEN preco_custo<>0 THEN (((Preco_Prazo/preco_cust' +
        'o)-1)*100)'
      '              ELSE cast(0 AS numeric)'
      '          END AS markup,'
      '          CASE'
      
        '              WHEN preco_prazo<>0 THEN (quantidade*(Preco_Prazo-' +
        'preco_custo))'
      '              ELSE cast(0 AS numeric)'
      '          END AS margem,'
      '          CASE'
      
        '              WHEN preco_prazo<>0 THEN (((Preco_Prazo-preco_cust' +
        'o)/Preco_Prazo)*100)'
      '              ELSE cast(0 AS numeric)'
      '          END AS pmargem,'
      '          cast('#39'V'#39' AS varchar) AS Tipo'
      '   FROM'
      '     (SELECT ProdutosDadosFiscaisMovimentosEncontrado.*,'
      '             CASE'
      
        '                 WHEN NOT coalesce(ProdutosDadosFiscaisMovimento' +
        'sEncontrado.composto, FALSE) THEN CASE'
      
        '                                                                ' +
        '                                      WHEN m.quantidade=0 THEN 0' +
        '.00'
      
        '                                                                ' +
        '                                      ELSE @(m.valor/m.quantidad' +
        'e)'
      
        '                                                                ' +
        '                                  END'
      '                 ELSE  CASE'
      
        '                                                                ' +
        '                                                     WHEN coales' +
        'ce(ProdutosDadosFiscaisMovimentosEncontrado.quantidade, 0)=0 THE' +
        'N 0.00'
      
        '                                                                ' +
        '                                                     ELSE'
      
        '                                                                ' +
        '                                                            (SEL' +
        'ECT @(sum(m1.valor))'
      
        '                                                                ' +
        '                                                             FRO' +
        'M movimentos m1'
      
        '                                                                ' +
        '                                                             WHE' +
        'RE m1.cmpmovimento=ProdutosDadosFiscaisMovimentosEncontrado.Nume' +
        'roMovimento)/ProdutosDadosFiscaisMovimentosEncontrado.quantidade'
      
        '                                                                ' +
        '                                                 END'
      '             END AS preco_custo,'
      
        '             coalesce((m.emestoque+m.reservado+m.transito+m.demo' +
        'nstracao+m.conserto+m.danificada),0) AS qtemestoque'
      '      FROM'
      
        '        (SELECT ProdutosDadosFiscais.*,  coalesce(produtosdadosf' +
        'iscais.movimento, COALESCE ('
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '          (SELECT m.numero'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '           FROM movimentos m'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '           WHERE m.dadofiscal=produtosdadosfiscais.dadofiscal'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '             AND m.produto=produtosdadosfiscais.produto'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '             AND m.filial=produtosdadosfiscais.filial'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '           LIMIT 1)),'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                (SELECT m.numero'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                 FROM movimentos m'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                 WHERE m.produto=produtosdadosfi' +
        'scais.produto'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                   AND m.filial=produtosdadosfis' +
        'cais.filial'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                   AND m.financeiro<>0'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                   AND m.data <= produtosdadosfi' +
        'scais.data'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                 ORDER BY m.data DESC, m.lancto ' +
        'DESC'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                 LIMIT 1)) AS numeromovimento'
      '         FROM'
      '           (SELECT df.nome,'
      
        '                   cast(cast(df.tipocliente AS varchar)||cast(df' +
        '.cliente AS varchar) AS varchar) AS cliente,'
      '                   df.conceito,'
      '                   cc.descricao AS descricaoconceito,'
      '                   df.vendedor,'
      '                   pdf.produto,'
      '                   pdf.filial,'
      '                   df.numero AS dadofiscal,'
      '                   n.serie,'
      '                   n.numero AS notafiscal,'
      '                   cp.maquina,'
      '                   cp.intervensao,'
      '                   cp.numero AS cupomfiscal,'
      '                   df.data,'
      '                   df.filialvenda,'
      '                   df.filialemissao,'
      '                   pdf.quantidade,'
      '                   pdf.precotabela AS preco_pauta,'
      '                   pdf.precovenda AS preco_vista,'
      
        '                   (coalesce(pdf.desconto, 0)+coalesce(pdf.valor' +
        'descontoitem, 0))/pdf.quantidade AS desconto,'
      
        '                   coalesce(pdf.acrescimo, 0)/pdf.quantidade AS ' +
        'juros,'
      
        '                   pdf.precovenda + (-coalesce(pdf.desconto, 0) ' +
        '- coalesce(pdf.valordescontoitem, 0) + coalesce(pdf.acrescimo, 0' +
        '))/pdf.quantidade AS preco_prazo,'
      
        '                   pdf.frete, - ratearfrete_pago_dadosfiscais(df' +
        '.numero, pdf.produto) AS frete_pago,'
      
        '                                cast(DF.plano AS varchar) AS pla' +
        'no,'
      '                                pdf.icmsvalor,'
      '                                pdf.movimento,'
      
        '                                coalesce(pdf.composto, FALSE) AS' +
        ' composto'
      '            FROM (((((DadosFiscais DF'
      '                      JOIN (ProdutosDadosFiscais PDF '
      ''
      '                             join ((produtos p'
      '                                   left join promocoes pro'
      '                                   on p.promocao = pro.codigo)'
      '                                   '
      '                                   join (((caracteristicas c'
      '                                         join grupos g'
      '                                         on c.grupo = g.codigo)'
      '                                         '
      '                                         join classes cl'
      
        '                                         on c.classe = cl.codigo' +
        ')'
      '                                         '
      '                                         join marcas m'
      '                                         on c.marca = m.codigo)'
      
        '                                                                ' +
        '      '
      
        '                                   on c.codigo = p.caracteristic' +
        'a)'
      '                           on pdf.produto = p.codigo)        '
      '                             '
      '                      ON DF.numero=PDF.dadofiscal)'
      
        '                     JOIN contratos ct ON ct.numero = df.contrat' +
        'o)'
      
        '                    LEFT JOIN conceitos cc ON df.conceito = cc.c' +
        'odigo)'
      '                   LEFT JOIN Notas N ON DF.numero=N.dadofiscal)'
      
        '                  LEFT JOIN Cupons cp ON DF.numero=cp.dadofiscal' +
        ')'
      
        '            WHERE DF.data BETWEEN (:DataInicial) AND (:DataFinal' +
        ')'
      '              AND df.situacao NOT IN ('#39'C'#39','
      '                                      '#39'D'#39')'
      '              AND CASE'
      '                      WHEN ct.os THEN ct.tipoequipamento IN (1,'
      '                                                             2)'
      
        '                           AND NOT (coalesce(ct.os_garantia, FAL' +
        'SE)'
      
        '                                    AND ct.os_garantia_status='#39'A' +
        #39')'
      
        '                           AND NOT coalesce(ct.os_cortesia, FALS' +
        'E)'
      '                      ELSE TRUE'
      '                  END'
      '              AND (eHNotaFiscalSaidaVenda(df.codigofiscal)'
      '                   OR mod(df.codigofiscal, 1000) IN (929))'
      '              AND NOT coalesce(df.notavinculada, FALSE)'
      ''
      '              %ListadeFiliaisDadosFiscais'
      '              %ListadeItemProdutos'
      '              %ListadeProdutos'
      '              %CondicaoCompostos'
      '              %ListadeGrupos '
      '              %ListadeClasses'
      '              %ListadeMarcas'
      '              %ListaCondicionalPromocoes'
      '              '
      '              %ListadeFornecedores'
      '              %ListaGruposFornecedores'
      ''
      '              '
      '              '
      '              /*'
      '              AND (pdf.produto IN'
      '                     (SELECT p.codigo'
      '                      FROM produtos p'
      
        '                      WHERE p.codigo in (1248200,1248100,1665800' +
        '))) */ ) AS ProdutosDadosFiscais) AS ProdutosDadosFiscaisMovimen' +
        'tosEncontrado'
      
        '      LEFT JOIN movimentos m ON ProdutosDadosFiscaisMovimentosEn' +
        'contrado.numeromovimento=m.numero) AS ProdutosDadosFiscaisMovime' +
        'ntos'
      '   JOIN (filiais f'
      '         LEFT JOIN (filiaisgruposfiliais fgf'
      
        '                    JOIN gruposfiliais gf ON fgf.grupo=gf.codigo' +
        ') ON f.codigo=fgf.filial) ON ProdutosDadosFiscaisMovimentos.fili' +
        'alvenda=f.codigo'
      
        '   LEFT JOIN planos pl ON cast(ProdutosDadosFiscaisMovimentos.pl' +
        'ano AS integer)=pl.codigo'
      
        '   LEFT JOIN usuarios u ON ProdutosDadosFiscaisMovimentos.vended' +
        'or=u.codigo'
      '   JOIN (estoques e'
      '         JOIN ((produtos p left join promocoes pro'
      '                                   on p.promocao = pro.codigo)'
      '               JOIN (((caracteristicas c'
      '                      JOIN grupos g ON c.grupo = g.codigo)'
      '                     JOIN classes cl ON c.classe=cl.codigo)'
      '                     join marcas m on c.marca = m.codigo)'
      '                     ON p.caracteristica = c.codigo)'
      
        '                     ON e.produto = p.codigo) ON ProdutosDadosFi' +
        'scaisMovimentos.produto=e.produto'
      '   AND ProdutosDadosFiscaisMovimentos.filial=e.filial'
      '   WHERE TRUE )'
      'UNION ALL'
      '  (SELECT ProdutosDadosFiscaisMovimentos.*,'
      '          u.nome AS nomevendedor,'
      '          p.descricao,'
      '          p.valorgrade1,'
      '          p.valorgrade2,'
      '          c.grupo,'
      '          g.descricao AS grupodescricao,'
      '          c.classe,'
      '          cl.descricao AS classegrupo,'
      '          f.nome AS nomefilialvenda,'
      ''
      '     (SELECT f2.nome'
      '      FROM filiais f2'
      
        '      WHERE f2.codigo = ProdutosDadosFiscaisMovimentos.filialemi' +
        'ssao) AS nomefilialemissao,'
      '          fgf.grupo AS grupofilialvenda,'
      '          gf.descricao AS nomegrupofilialvenda,'
      '          pl.descricao AS nomeplano,'
      '          CASE'
      
        '              WHEN preco_custo<>0 THEN (((Preco_Prazo/preco_cust' +
        'o)-1)*100)'
      '              ELSE cast(0 AS numeric)'
      '          END AS markup,'
      '          CASE'
      
        '              WHEN preco_prazo<>0 THEN (quantidade*(Preco_Prazo-' +
        'preco_custo))'
      '              ELSE cast(0 AS numeric)'
      '          END AS margem,'
      '          CASE'
      
        '              WHEN preco_prazo<>0 THEN (((Preco_Prazo-preco_cust' +
        'o)/Preco_Prazo)*100)'
      '              ELSE cast(0 AS numeric)'
      '          END AS pmargem,'
      '          cast('#39'V'#39' AS varchar) AS Tipo'
      '   FROM'
      '     (SELECT ProdutosDadosFiscaisMovimentosEncontrado.*,'
      '             CASE'
      
        '                 WHEN NOT coalesce(ProdutosDadosFiscaisMovimento' +
        'sEncontrado.composto, FALSE) THEN CASE'
      
        '                                                                ' +
        '                                      WHEN m.quantidade=0 THEN 0' +
        '.00'
      
        '                                                                ' +
        '                                      ELSE @(m.valor/m.quantidad' +
        'e)'
      
        '                                                                ' +
        '                                  END'
      '                 ELSE CASE'
      
        '                                                                ' +
        '                                                     WHEN coales' +
        'ce(ProdutosDadosFiscaisMovimentosEncontrado.quantidade, 0)=0 THE' +
        'N 0.00'
      
        '                                                                ' +
        '                                                     ELSE'
      
        '                                                                ' +
        '                                                            (SEL' +
        'ECT @(sum(m1.valor))'
      
        '                                                                ' +
        '                                                             FRO' +
        'M movimentos m1'
      
        '                                                                ' +
        '                                                             WHE' +
        'RE m1.cmpmovimento=ProdutosDadosFiscaisMovimentosEncontrado.Nume' +
        'roMovimento)/ProdutosDadosFiscaisMovimentosEncontrado.quantidade'
      
        '                                                                ' +
        '                                                 END'
      '             END AS preco_custo,'
      
        '             coalesce((m.emestoque+m.reservado+m.transito+m.demo' +
        'nstracao+m.conserto+m.danificada),0) AS qtemestoque'
      '      FROM'
      
        '        (SELECT ProdutosDadosFiscais.*,  coalesce(produtosdadosf' +
        'iscais.movimento, COALESCE ('
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '        (SELECT m.numero'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '         FROM movimentos m'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '         WHERE m.dadofiscal=produtosdadosfiscais.dadofiscal'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '           AND m.produto=produtosdadosfiscais.produto'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '           AND m.filial=produtosdadosfiscais.filial'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '         LIMIT 1)),'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                              (SELECT m.numero'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                               FROM movimentos m'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                               WHERE m.produto=produtosdadosfisc' +
        'ais.produto'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                 AND m.filial=produtosdadosfisca' +
        'is.filial'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                 AND m.financeiro<>0'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                 AND m.data <= produtosdadosfisc' +
        'ais.data'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                               ORDER BY m.data DESC, m.lancto DE' +
        'SC'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                               LIMIT 1)) AS numeromovimento'
      '         FROM'
      '           (SELECT df.nome,'
      
        '                   cast(cast(df.tipocliente AS varchar)||cast(df' +
        '.cliente AS varchar) AS varchar) AS cliente,'
      '                   df.conceito,'
      '                   cc.descricao AS descricaoconceito,'
      '                   df.vendedor,'
      '                   pdf.produto,'
      '                   pdf.filial,'
      '                   df.numero AS dadofiscal,'
      '                   n.serie,'
      '                   n.numero AS notafiscal,'
      '                   cp.maquina,'
      '                   cp.intervensao,'
      '                   cp.numero AS cupomfiscal,'
      '                   df.data,'
      '                   df.filialvenda,'
      '                   df.filialemissao,'
      '                   pdf.quantidade,'
      '                   pdf.precotabela AS preco_pauta,'
      '                   pdf.precovenda AS preco_vista,'
      
        '                   (coalesce(pdf.desconto, 0) + coalesce(pdf.val' +
        'ordescontoitem, 0))/pdf.quantidade AS desconto,'
      
        '                   coalesce(pdf.acrescimo, 0)/pdf.quantidade AS ' +
        'juros,'
      
        '                   pdf.precovenda + (- coalesce(pdf.desconto, 0)' +
        ' - coalesce(pdf.valordescontoitem, 0) + coalesce(pdf.acrescimo, ' +
        '0))/pdf.quantidade AS preco_prazo,'
      
        '                   pdf.frete, - ratearfrete_pago_dadosfiscais(df' +
        '.numero, pdf.produto) AS frete_pago,'
      
        '                                cast(DF.plano AS varchar) AS pla' +
        'no,'
      '                                pdf.icmsvalor,'
      '                                pdf.movimento,'
      
        '                                coalesce(pdf.composto, FALSE) AS' +
        ' composto'
      '            FROM ((((DadosFiscais DF'
      '                     JOIN (ProdutosDadosFiscais PDF '
      '                     '
      '                             join ((produtos p'
      '                                   left join promocoes pro'
      '                                   on p.promocao = pro.codigo)'
      '                                   '
      '                                   join (((caracteristicas c'
      '                                         join grupos g'
      '                                         on c.grupo = g.codigo)'
      '                                         '
      '                                         join classes cl'
      
        '                                         on c.classe = cl.codigo' +
        ')'
      '                                         '
      '                                         join marcas m'
      '                                         on c.marca = m.codigo)'
      '                                   '
      ''
      '                                   '
      
        '                                   on c.codigo = p.caracteristic' +
        'a)'
      '                           on pdf.produto = p.codigo)        '
      '                     '
      '                     '
      '                     '
      '                     ON DF.numero=PDF.dadofiscal)'
      
        '                    LEFT JOIN conceitos cc ON df.conceito = cc.c' +
        'odigo)'
      '                   LEFT JOIN Notas N ON DF.numero=N.dadofiscal)'
      
        '                  LEFT JOIN Cupons cp ON DF.numero=cp.dadofiscal' +
        ')'
      '            WHERE df.numero = pdf.dadofiscal'
      '              AND df.data BETWEEN :DataInicial AND :DataFinal'
      '              AND df.situacao NOT IN ('#39'C'#39','
      '                                      '#39'D'#39')'
      '              AND (eHNotaFiscalSaidaVenda(pdf.codigofiscal)'
      '                   OR mod(pdf.codigofiscal, 1000) IN (929))'
      '              AND NOT coalesce(df.notavinculada, FALSE)'
      '              AND df.contrato IS NULL'
      ''
      '              %ListadeFiliaisDadosFiscais'
      '              %ListadeItemProdutos'
      '              %ListadeProdutos'
      '              %CondicaoCompostos'
      '              %ListadeGrupos '
      '              %ListadeClasses'
      '              %ListadeMarcas'
      '              %ListaCondicionalPromocoes'
      ''
      '              %ListadeFornecedores'
      '              %ListaGruposFornecedores'
      ''
      '              '
      ''
      '              /*'
      '              AND (pdf.produto IN'
      '                     (SELECT p.codigo'
      '                      FROM produtos p'
      
        '                      WHERE p.codigo in (1248200,1248100,1665800' +
        '))) */ ) AS ProdutosDadosFiscais) AS ProdutosDadosFiscaisMovimen' +
        'tosEncontrado'
      
        '      LEFT JOIN movimentos m ON ProdutosDadosFiscaisMovimentosEn' +
        'contrado.numeromovimento=m.numero) AS ProdutosDadosFiscaisMovime' +
        'ntos'
      '   JOIN (filiais f'
      '         LEFT JOIN (filiaisgruposfiliais fgf'
      
        '                    JOIN gruposfiliais gf ON fgf.grupo=gf.codigo' +
        ') ON f.codigo=fgf.filial) ON ProdutosDadosFiscaisMovimentos.fili' +
        'alvenda=f.codigo'
      
        '   LEFT JOIN planos pl ON cast(ProdutosDadosFiscaisMovimentos.pl' +
        'ano AS integer)=pl.codigo'
      
        '   LEFT JOIN usuarios u ON ProdutosDadosFiscaisMovimentos.vended' +
        'or=u.codigo'
      '   JOIN (estoques e'
      '         JOIN ((produtos p left join promocoes pro'
      '                                   on p.promocao = pro.codigo)'
      '               JOIN (((caracteristicas c'
      '                      JOIN grupos g ON c.grupo=g.codigo)'
      '                     JOIN classes cl ON c.classe=cl.codigo)'
      '                     join marcas m on c.marca = m.codigo)'
      ''
      
        '                     ON p.caracteristica=c.codigo) ON e.produto=' +
        'p.codigo) ON ProdutosDadosFiscaisMovimentos.produto=e.produto'
      '   AND ProdutosDadosFiscaisMovimentos.filial=e.filial'
      '   WHERE TRUE )'
      'UNION ALL'
      '  (SELECT ProdutosDadosFiscaisMovimentos.*,'
      ''
      '     (SELECT u.nome'
      '      FROM usuarios u'
      
        '      WHERE u.codigo = ProdutosDadosFiscaisMovimentos.vendedor) ' +
        'AS nomevendedor,'
      '          p.descricao,'
      '          p.valorgrade1,'
      '          p.valorgrade2,'
      '          c.grupo,'
      '          g.descricao AS grupodescricao,'
      '          c.classe,'
      '          cl.descricao AS classegrupo,'
      '          f.nome AS nomefilialvenda,'
      '          cast('#39'DEVOLUCOES'#39' AS varchar) AS nomefilialemissao,'
      '          fgf.grupo AS grupofilialvenda,'
      '          gf.descricao AS nomegrupofilialvenda,'
      '          cast(NULL AS varchar) AS nomeplano, - CASE'
      
        '                                                    WHEN preco_c' +
        'usto<>0 THEN (((Preco_Prazo/preco_custo)-1)*100)'
      
        '                                                    ELSE cast(0 ' +
        'AS numeric)'
      '                                                END AS markup,'
      '                                                CASE'
      
        '                                                    WHEN preco_p' +
        'razo<>0 THEN (quantidade*(Preco_Prazo-preco_custo))'
      
        '                                                    ELSE cast(0 ' +
        'AS numeric)'
      
        '                                                END AS margem, -' +
        ' CASE'
      
        '                                                                ' +
        '     WHEN preco_prazo<>0 THEN (((Preco_Prazo-preco_custo)/Preco_' +
        'Prazo)*100)'
      
        '                                                                ' +
        '     ELSE cast(0 AS numeric)'
      
        '                                                                ' +
        ' END AS pmargem,'
      
        '                                                                ' +
        ' cast('#39'D'#39' AS varchar) AS Tipo'
      '   FROM'
      '     (SELECT'
      '        (SELECT coalesce(vf.razao, vf.nome)'
      '         FROM vfornecedores vf'
      '         WHERE vf.codigo = pnmcd.fornecedor'
      '           AND vf.tipo = pnmcd.tipofornecedor) AS nome,'
      
        '             cast(cast(pnmcd.tipofornecedor AS varchar)||cast(pn' +
        'mcd.fornecedor AS varchar) AS varchar) AS cliente,'
      '             pnmcd.conceito,'
      '             pnmcd.descricaoconceito,'
      '             coalesce(coalesce('
      '                                 (SELECT pdf.vendedor'
      '                                  FROM produtosdadosfiscais pdf'
      
        '                                  WHERE pdf.dadofiscal = pnmcd.d' +
        'adofiscal'
      
        '                                    AND pdf.produto = pnmcd.prod' +
        'uto'
      
        '                                    AND pdf.filial = pnmcd.filia' +
        'l),df.vendedor), pnmcd.vendedor) AS vendedor,'
      '             pnmcd.produto,'
      '             pnmcd.filial,'
      '             pnmcd.codigo AS dadofiscal,'
      '             pnmcd.serie,'
      '             pnmcd.numero AS notafiscal,'
      '             cast(NULL AS integer) AS maquina,'
      '             cast(NULL AS integer) AS intervensao,'
      '             cast(NULL AS integer) AS cupomfiscal,'
      '             pnmcd.data,'
      '             pnmcd.filialdevolucao AS filialvenda,'
      
        '             cast(0 AS integer) AS filialemissao, - pnmcd.quanti' +
        'dade AS quantidade,'
      
        '                                                    pnmcd.preco_' +
        'pauta AS preco_pauta,'
      
        '                                                    pnmcd.preco_' +
        'vista AS preco_vista,'
      
        '                                                    (coalesce(pn' +
        'mcd.desconto, 0) + coalesce(pnmcd.valordescontoitem, 0))/pnmcd.q' +
        'uantidade AS desconto,'
      
        '                                                    coalesce(pnm' +
        'cd.acrescimo, 0)/pnmcd.quantidade AS juros,'
      
        '                                                    pnmcd.preco_' +
        'vista + (-coalesce(pnmcd.desconto, 0) - coalesce(pnmcd.valordesc' +
        'ontoitem, 0) + coalesce(pnmcd.acrescimo, 0))/pnmcd.quantidade AS' +
        ' preco_prazo, - pnmcd.frete,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                ratearfrete_pago_dadosfiscais(pnmcd.dadofiscal, ' +
        'pnmcd.produto) AS frete_pago,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                cast(DF.plano AS varchar) AS plano, - pnmcd.icms' +
        'valor AS icmsvalor,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                      cast(NULL ' +
        'AS integer) AS movimento,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                      pnmcd.comp' +
        'osto,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                      cast(NULL ' +
        'AS integer) AS numeromovimento,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                      pnmcd.prec' +
        'o_custo AS preco_custo,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                      cast(NULL ' +
        'AS Numeric(9, 3)) AS qtemestoque'
      '      FROM'
      '        (SELECT pnmc.*,'
      ''
      '           (SELECT pdf.precotabela'
      '            FROM produtosdadosfiscais pdf'
      '            WHERE pdf.dadofiscal = pnmc.dadofiscal'
      '              AND pdf.produto = pnmc.produto) AS preco_pauta,'
      ''
      '           (SELECT pdf.precovenda'
      '            FROM produtosdadosfiscais pdf'
      '            WHERE pdf.dadofiscal = pnmc.dadofiscal'
      '              AND pdf.produto = pnmc.produto) AS preco_vista,'
      ''
      '           (SELECT pdf.desconto'
      '            FROM produtosdadosfiscais pdf'
      '            WHERE pdf.dadofiscal = pnmc.dadofiscal'
      '              AND pdf.produto = pnmc.produto) AS desconto,'
      ''
      '           (SELECT pdf.valordescontoitem'
      '            FROM produtosdadosfiscais pdf'
      '            WHERE pdf.dadofiscal = pnmc.dadofiscal'
      
        '              AND pdf.produto = pnmc.produto) AS valordescontoit' +
        'em,'
      ''
      '           (SELECT pdf.acrescimo'
      '            FROM produtosdadosfiscais pdf'
      '            WHERE pdf.dadofiscal = pnmc.dadofiscal'
      '              AND pdf.produto = pnmc.produto) AS acrescimo'
      '         FROM'
      '           (SELECT pnm.*,'
      '                   ct.vendedor,'
      '                   cc.codigo AS conceito,'
      '                   cc.descricao AS descricaoconceito'
      '            FROM'
      '              (SELECT np.data,'
      '                      np.serie,'
      '                      np.numero,'
      '                      np.filial AS filialdevolucao,'
      '                      np.codigo,'
      '                      np.fornecedor,'
      '                      np.tipofornecedor,'
      '                      mo.produto,'
      '                      mo.filial,'
      '                      mo.quantidade,'
      '                      mo.valor,'
      '                      pnp.frete,'
      '                      CASE'
      
        '                          WHEN NOT coalesce(c.composto, FALSE) T' +
        'HEN CASE'
      
        '                                                                ' +
        '        WHEN (mo.quantidade=0'
      
        '                                                                ' +
        '              OR coalesce(mo.valor/mo.quantidade, 0)=0) THEN'
      
        '                                                                ' +
        '               (SELECT CASE'
      
        '                                                                ' +
        '                           WHEN m1.quantidade=0 THEN 0'
      
        '                                                                ' +
        '                           ELSE @(m1.valor/m1.quantidade)'
      
        '                                                                ' +
        '                       END'
      
        '                                                                ' +
        '                FROM movimentos m1'
      
        '                                                                ' +
        '                WHERE m1.tipomovimento='#39'RFV'#39
      
        '                                                                ' +
        '                  AND m1.contrato=np.contrato'
      
        '                                                                ' +
        '                  AND m1.produto=mo.produto'
      
        '                                                                ' +
        '                LIMIT 1)'
      
        '                                                                ' +
        '        ELSE @(mo.valor/mo.quantidade)'
      
        '                                                                ' +
        '    END'
      '                          ELSE CASE'
      
        '                                   WHEN coalesce(mo.quantidade, ' +
        '0)=0 THEN 0'
      '                                   ELSE'
      
        '                                          (SELECT @(sum(m1.valor' +
        '))'
      '                                           FROM movimentos m1'
      
        '                                           WHERE m1.cmpmovimento' +
        '=mo.numero)/mo.quantidade'
      '                               END'
      '                      END AS preco_custo,'
      '                      np.contrato,'
      '                      pnp.icmsvalor,'
      '                      pnp.dadofiscal,'
      '                      coalesce(c.composto, FALSE) AS composto'
      '               FROM (notaspag np'
      '                     JOIN ((produtosnotaspag pnp'
      '                           JOIN ((produtos p '
      '                                   left join promocoes pro'
      '                                   on p.promocao = pro.codigo)'
      '                                   '
      '                                   join (((caracteristicas c'
      '                                         join grupos g'
      '                                         on c.grupo = g.codigo)'
      '                                         '
      '                                         join classes cl'
      
        '                                         on c.classe = cl.codigo' +
        ')'
      '                                         '
      '                                         join marcas m'
      '                                         on c.marca = m.codigo)'
      
        '                                                                ' +
        '     '
      
        '                                   on c.codigo = p.caracteristic' +
        'a)'
      '                           on pnp.produto = p.codigo)        '
      '                           '
      
        '                           JOIN movimentos mo ON mo.codigonota =' +
        ' pnp.codigonota'
      '                           AND mo.numerocontrole = pnp.numero'
      '                           AND mo.produto = pnp.produto) '
      '                           '
      '                           ON np.codigo = pnp.codigonota)'
      '                           '
      
        '               WHERE np.data BETWEEN (:DataInicial) AND (:DataFi' +
        'nal)'
      
        '                 AND ehnotafiscalentradadevolucao(pnp.codigofisc' +
        'al)'
      '                 AND np.contrato IS NOT NULL '
      '                 '
      '                  %ListadeFiliaisNotasPag                 '
      '                  %ListadeItemProdutos'
      '                  %ListadeProdutos'
      '                  %CondicaoCompostos'
      '                  %ListadeGrupos '
      '                  %ListadeClasses'
      '                  %ListadeMarcas'
      '                  %ListaCondicionalPromocoes'
      ''
      '                  %ListadeFornecedores'
      '                  %ListaGruposFornecedores'
      ''
      '                 '
      '                 '
      '                 ) AS pnm'
      '            JOIN (contratos ct'
      
        '                  LEFT JOIN conceitos cc ON ct.conceito = cc.cod' +
        'igo) ON ct.numero = pnm.contrato'
      '            WHERE TRUE'
      '              AND CASE'
      '                      WHEN ct.os THEN ct.tipoequipamento IN (1,'
      '                                                             2)'
      
        '                           AND NOT (coalesce(ct.os_garantia, FAL' +
        'SE)'
      
        '                                    AND ct.os_garantia_status='#39'A' +
        #39')'
      
        '                           AND NOT coalesce(ct.os_cortesia, FALS' +
        'E)'
      '                      ELSE TRUE'
      '                  END'
      ''
      '                  /*'
      '              AND (pnm.produto IN'
      '                     (SELECT p.codigo'
      '                      FROM produtos p'
      
        '                      WHERE p.codigo in (1248200,1248100,1665800' +
        '))) */ ) AS pnmc) AS pnmcd'
      '                      '
      
        '      JOIN dadosfiscais df ON pnmcd.dadofiscal = df.numero) AS P' +
        'rodutosDadosFiscaisMovimentos'
      '   JOIN (filiais f'
      '         LEFT JOIN (filiaisgruposfiliais fgf'
      
        '                    JOIN gruposfiliais gf ON fgf.grupo=gf.codigo' +
        ') ON f.codigo=fgf.filial) ON ProdutosDadosFiscaisMovimentos.fili' +
        'alvenda = f.codigo'
      '   JOIN (estoques e'
      '         JOIN ((produtos p left join promocoes pro'
      '                                   on p.promocao = pro.codigo)'
      '               JOIN (((caracteristicas c'
      '                      JOIN grupos g ON c.grupo=g.codigo)'
      '                     JOIN classes cl ON c.classe=cl.codigo)'
      '                     join marcas m on c.marca = m.codigo)'
      ''
      
        '                     ON p.caracteristica=c.codigo) ON e.produto=' +
        'p.codigo) ON ProdutosDadosFiscaisMovimentos.produto=e.produto'
      '   AND ProdutosDadosFiscaisMovimentos.filial=e.filial'
      '   WHERE TRUE )'
      '   '
      'UNION ALL'
      ''
      '  (SELECT pnmc.*, - CASE'
      
        '                        WHEN preco_custo<>0 THEN (((Preco_Prazo/' +
        'preco_custo)-1)*100)'
      '                        ELSE cast(0 AS numeric)'
      '                    END AS markup,'
      '                    CASE'
      
        '                        WHEN preco_prazo<>0 THEN (quantidade*(Pr' +
        'eco_Prazo-preco_custo))'
      '                        ELSE cast(0 AS numeric)'
      '                    END AS margem, - CASE'
      
        '                                         WHEN preco_prazo<>0 THE' +
        'N (((Preco_Prazo-preco_custo)/Preco_Prazo)*100)'
      '                                         ELSE cast(0 AS numeric)'
      '                                     END AS pmargem,'
      
        '                                     cast('#39'D'#39' AS varchar) AS Tip' +
        'o'
      '   FROM'
      '     (SELECT'
      '        (SELECT coalesce(vf.razao, vf.nome)'
      '         FROM vfornecedores vf'
      '         WHERE vf.codigo = pnm.fornecedor'
      '           AND vf.tipo = pnm.tipofornecedor) AS nome,'
      
        '             cast(cast(pnm.tipofornecedor AS varchar)||cast(pnm.' +
        'fornecedor AS varchar) AS varchar) AS cliente,'
      '             pnm.conceito,'
      '             pnm.descricaoconceito,'
      '             cast(NULL AS integer) AS vendedor,'
      '             pnm.produto,'
      '             pnm.filial,'
      '             cast(NULL AS integer) AS dadofiscal,'
      '             pnm.serie,'
      '             pnm.numero AS notafiscal,'
      '             cast(NULL AS integer) AS maquina,'
      '             cast(NULL AS integer) AS intervensao,'
      '             cast(NULL AS integer) AS cupomfiscal,'
      '             pnm.data,'
      '             pnm.filialvenda,'
      
        '             cast(0 AS integer) AS filialemissao, - pnm.quantida' +
        'de AS quantidade,'
      
        '                                                    pnm.precouni' +
        'tario AS preco_pauta,'
      
        '                                                    pnm.precouni' +
        'tario AS preco_vista,'
      
        '                                                    pnm.desconto' +
        ','
      
        '                                                    pnm.acrescim' +
        'o AS juros,'
      
        '                                                    pnm.precouni' +
        'tario + (-coalesce(pnm.desconto, 0) + coalesce(pnm.acrescimo, 0)' +
        ') AS preco_prazo, - pnm.frete, /*ratearfrete_pago_dadosfiscais(p' +
        'nm.contrato, pnm.produto)*/ 0.00 AS frete_pago,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                            cast(NULL AS varchar) AS plano, - pn' +
        'm.icmsvalor AS icmsvalor,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              ca' +
        'st(NULL AS integer) AS movimento,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              co' +
        'alesce(c.composto, FALSE) AS composto,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              ca' +
        'st(NULL AS integer) AS numeromovimento,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              pn' +
        'm.preco_custo,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              ca' +
        'st(NULL AS Numeric(9, 3)) AS qtemestoque,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              ca' +
        'st(NULL AS varchar(40)) AS nomevendedor,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              p.' +
        'descricao,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              p.' +
        'valorgrade1,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              p.' +
        'valorgrade2,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              c.' +
        'grupo,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              g.' +
        'descricao AS grupodescricao,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              c.' +
        'classe,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              cl' +
        '.descricao AS classegrupo,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              f.' +
        'nome AS nomefilialvenda,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              ca' +
        'st('#39'DEVOLUCOES'#39' AS varchar) AS nomefilialemissao,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              fg' +
        'f.grupo AS grupofilialvenda,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              gf' +
        '.descricao AS nomegrupofilialvenda,'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                              ca' +
        'st(NULL AS varchar) AS nomeplano'
      '      FROM'
      '        (SELECT np.data,'
      '                np.serie,'
      '                np.numero,'
      '                np.filial AS filialvenda,'
      '                np.codigo,'
      '                np.fornecedor,'
      '                np.tipofornecedor,'
      '                vf.conceito,'
      '                cc.descricao AS descricaoconceito,'
      '                mo.produto,'
      '                mo.filial,'
      '                mo.quantidade,'
      '                pnp.precounitario,'
      '                pnp.frete,'
      
        '                (coalesce(pnp.desconto, 0)+coalesce(pnp.valordes' +
        'contoitem, 0))/pnp.quantidade AS desconto, coalesce(pnp.seguro, ' +
        '0)/pnp.quantidade AS seguro,'
      
        '                                                                ' +
        '                                                                ' +
        '                               coalesce(pnp.acrescimo, 0)/pnp.qu' +
        'antidade AS acrescimo,'
      
        '                                                                ' +
        '                                                                ' +
        '                               mo.valor,'
      
        '                                                                ' +
        '                                                                ' +
        '                               CASE'
      
        '                                                                ' +
        '                                                                ' +
        '                                   WHEN NOT coalesce(c.composto,' +
        ' FALSE) THEN (@(CASE'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                    WHEN mo.quantidade=0 THEN 0.00'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                    ELSE mo.valor/mo.quantidade'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                END))'
      
        '                                                                ' +
        '                                                                ' +
        '                                   ELSE CASE'
      
        '                                                                ' +
        '                                                                ' +
        '                                            WHEN coalesce(mo.qua' +
        'ntidade, 0)=0 THEN 0.00'
      
        '                                                                ' +
        '                                                                ' +
        '                                            ELSE'
      
        '                                                                ' +
        '                                                                ' +
        '                                                   (SELECT @(sum' +
        '(m1.valor))'
      
        '                                                                ' +
        '                                                                ' +
        '                                                    FROM movimen' +
        'tos m1'
      
        '                                                                ' +
        '                                                                ' +
        '                                                    WHERE m1.cmp' +
        'movimento=mo.numero)/mo.quantidade'
      
        '                                                                ' +
        '                                                                ' +
        '                                        END'
      
        '                                                                ' +
        '                                                                ' +
        '                               END AS preco_custo,'
      
        '                                                                ' +
        '                                                                ' +
        '                               np.contrato,'
      
        '                                                                ' +
        '                                                                ' +
        '                               pnp.icmsvalor'
      '         FROM notaspag np'
      '         JOIN produtosnotaspag pnp  '
      '         JOIN (produtos p left join promocoes pro'
      '                                   on p.promocao = pro.codigo)'
      '           JOIN (((caracteristicas c'
      '                         JOIN grupos g ON c.grupo=g.codigo)'
      '                        JOIN classes cl ON c.classe = cl.codigo)'
      '                        join marcas m on c.marca = m.codigo)'
      '           ON p.caracteristica = c.codigo'
      '         ON pnp.produto = p.codigo'
      '         JOIN movimentos mo ON pnp.codigonota = mo.codigonota'
      '         AND pnp.produto = mo.produto'
      
        '         AND pnp.numero = mo.numerocontrole ON np.codigo = pnp.c' +
        'odigonota'
      '         JOIN (vfornecedores vf'
      
        '               LEFT JOIN conceitos cc ON vf.conceito = cc.codigo' +
        ') ON np.fornecedor = vf.codigo'
      '         AND np.tipofornecedor = vf.tipo'
      '         WHERE np.data BETWEEN (:DataInicial) AND (:DataFinal)'
      '           AND ehnotafiscalentradadevolucao(np.codigofiscal)'
      '           AND np.contrato IS NULL '
      '           '
      '                  %ListadeFiliaisNotasPag                 '
      '                  %ListadeItemProdutos'
      '                  %ListadeProdutos'
      '                  %CondicaoCompostos'
      '                  %ListadeGrupos '
      '                  %ListadeClasses'
      '                  %ListadeMarcas'
      '                  %ListaCondicionalPromocoes'
      ''
      '                  %ListadeFornecedores'
      '                  %ListaGruposFornecedores'
      ''
      '           '
      '           '
      '           ) AS pnm'
      '           '
      '      JOIN (filiais f'
      '            LEFT JOIN (filiaisgruposfiliais fgf'
      
        '                       JOIN gruposfiliais gf ON fgf.grupo=gf.cod' +
        'igo) ON f.codigo=fgf.filial) ON pnm.filialvenda = f.codigo'
      '      JOIN (estoques e'
      '            JOIN ((produtos p left join promocoes pro'
      '                                   on p.promocao = pro.codigo)'
      '                  JOIN (((caracteristicas c'
      '                         JOIN grupos g ON c.grupo=g.codigo)'
      '                        JOIN classes cl ON c.classe = cl.codigo)'
      '                        join marcas m on c.marca = m.codigo)'
      '                        ON p.caracteristica=c.codigo)'
      
        '                        ON e.produto=p.codigo) ON pnm.produto = ' +
        'e.produto'
      '      AND pnm.filial = e.filial'
      '      '
      '      WHERE TRUE'
      '      '
      '      /*'
      '        AND (pnm.produto IN'
      '               (SELECT p.codigo'
      '                FROM produtos p'
      
        '                WHERE p.codigo in (1248200,1248100,1665800))) */' +
        ' ) AS pnmc)'
      'ORDER BY classe,'
      '         grupo,'
      '         descricao,'
      '         valorgrade1,'
      '         valorgrade2,'
      '         DATA,'
      '         serie,'
      '         notafiscal,'
      '         maquina,'
      '         intervensao,'
      '         cupomfiscal'
      ') as cmv'
      'group by produto'
      '          '
      ' '
      ' ) as cmv'
      ' on vendas.codigoproduto = cmv.produto'
      ''
      ') as vendas')
    RequestLive = False
    Left = 264
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FilialBase'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicial'
        ParamType = ptUnknown
        Value = #39'2016-09-01'#39
      end
      item
        DataType = ftString
        Name = 'DataFinal'
        ParamType = ptUnknown
        Value = #39'2017-01-31'#39
      end
      item
        DataType = ftUnknown
        Name = 'ListadeFiliais'
        ParamType = ptUnknown
      end>
    object qryAnaliseEstoques_auxanomes: TStringField
      FieldName = 'anomes'
      Size = 7
    end
    object qryAnaliseEstoques_auxMesAnoExtenso: TStringField
      FieldKind = fkCalculated
      FieldName = 'MesAnoExtenso'
      Size = 15
      Calculated = True
    end
  end
  object qrynMeses: TtecQuery
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
      'select distinct to_char(cast('#39
      '        %datainicial_1'
      
        '        '#39' as date)  + s.a,'#39'YYYY/MM'#39') as mes from generate_series' +
        '(1,cast('#39
      '            %datafinal'
      '            '#39' as date)-cast('#39
      '              %datainicial_2'
      '             '#39' as date)) as s(a) order by 1')
    RequestLive = False
    Left = 136
    Top = 344
  end
  object qrynmeses_aux: TtecQuery
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
      'select distinct to_char(cast('#39
      '        %datainicial_1'
      
        '        '#39' as date)  + s.a,'#39'YYYY/MM'#39') as mes from generate_series' +
        '(1,cast('#39
      '            %datafinal'
      '            '#39' as date)-cast('#39
      '              %datainicial_2'
      '             '#39' as date)) as s(a) order by 1')
    RequestLive = False
    Left = 280
    Top = 344
  end
end
