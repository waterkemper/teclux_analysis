inherited dtmConsultaVendas: TdtmConsultaVendas
  OldCreateOrder = False
  Left = 645
  Top = 246
  Height = 554
  Width = 570
  object qryVendas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkFields = 'cliente=cliente;tipocliente=tipocliente'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrVendasCliente
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      '')
    RequestLive = True
    Left = 64
    Top = 24
    object qryVendasprodutofilial: TStringField
      FieldName = 'produtofilial'
      Size = 250
    end
    object qryVendasproduto: TLargeintField
      DisplayLabel = 'Produto'
      FieldName = 'produto'
    end
    object qryVendasprodutovisual: TStringField
      FieldName = 'produtovisual'
    end
    object qryVendasfilial: TIntegerField
      DisplayLabel = 'Fil'
      DisplayWidth = 3
      FieldName = 'filial'
    end
    object qryVendasdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 50
      FieldName = 'descricao'
      Size = 100
    end
    object qryVendasgrupo: TStringField
      FieldName = 'grupo'
      Size = 4
    end
    object qryVendasdescricaogrupo: TStringField
      DisplayWidth = 50
      FieldName = 'descricaogrupo'
      Size = 100
    end
    object qryVendascliente: TIntegerField
      FieldName = 'cliente'
    end
    object qryVendastipocliente: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
    object qryVendasTotal: TCurrencyField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 12
      FieldName = 'Total'
      DisplayFormat = '########'
    end
  end
  object dsrVendas: TtecDataSource
    DataSet = qryVendas
    Left = 105
    Top = 38
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
    Left = 88
    Top = 192
  end
  object qryvendas_aux: TtecQuery
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
        Name = 'meses'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'SELECT * FROM crosstab'
      '('
      
        #39'select cast(descricao||cast(produto as varchar)||produtovisual|' +
        '|descricaogrupo||cast(grupo as varchar)||cast(filial as varchar)' +
        '||cast(cliente as varchar)||cast(tipocliente as varchar) as varc' +
        'har(250)) as produtofilial,'
      '          produto, produtovisual,'
      '          filial,'
      '          descricao,'
      '          grupo,'
      '          descricaogrupo,'
      '          cliente,'
      '          tipocliente,'
      '          0.00 as Total,'
      '          mes,'
      '          cast(sum(quantidade) as numeric(9,3)) as quantidade'
      '          from'
      ' ('
      ''
      #9#9'/* VENDAS NOTAS FISCAIS */'
      #9#9'('
      #9#9#9' '
      #9#9#9'select ct.cliente, ct.tipocliente,'
      ''
      '      pdf.produto, p.codigovisual as produtovisual,'
      '      pdf.filial,'
      '      p.descricao,'
      '      c.grupo,'
      '      g.descricao as descricaogrupo,'
      ''
      '      to_char(ct.faturamento, '#39#39'YYYY/MM'#39#39') as mes,'
      '      cast(sum(pdf.quantidade) as numeric(9,3)) as quantidade'
      ''
      #9#9#9'from ((dadosfiscais df'
      #9#9#9#9'   join contratos ct'
      #9#9#9#9#9#9' on ct.numero = df.contrato)'
      #9#9#9#9'   join (produtosdadosfiscais pdf'
      
        #9#9#9#9#9#9'   /*join movimentos mv on pdf.dadofiscal = mv.dadofiscal ' +
        'and pdf.produto=mv.produto)*/'
      #9#9#9#9#9#9'   join (produtos p'
      
        #9#9#9#9#9#9#9#9'  join (((caracteristicas c join classes cl on c.classe=' +
        'cl.codigo)'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9'   join grupos g on g.codigo=c.grupo)'
      
        '                               join marcas m on c.marca=m.codigo' +
        ')'
      ''
      #9#9#9#9#9#9#9#9#9#9#9'on p.caracteristica=c.codigo)'
      #9#9#9#9#9#9#9#9#9#9'   on pdf.produto=p.codigo)'
      #9#9#9#9#9#9#9#9#9#9' on df.numero = pdf.dadofiscal)'
      #9#9#9#9#9#9#9#9#9#9' '
      #9#9#9#9#9#9#9#9#9#9' '
      #9#9#9' %DataFaturamentoVendasProdutos'
      #9#9#9#9' '
      
        #9#9#9' and case when ct.os then ct.tipoequipamento in (1,2) and not' +
        ' (coalesce(ct.os_garantia,false) and ct.os_garantia_status='#39#39'A'#39#39 +
        ') and not coalesce(ct.os_cortesia,false) else true end'#9#9#9' '
      #9#9#9' and ct.origem is null'
      #9#9#9' and not coalesce(pdf.brinde,false)'
      '       AND df.situacao NOT IN ('#39#39'C'#39#39','#39#39'D'#39#39')'
      #9#9#9' AND (coalesce(ct.valorvista,0)<>0)'
      #9#9#9' and not coalesce(df.notavinculada,false)'
      ''
      #9#9#9' %FrentedeCaixaFiltroVendas'
      ''
      
        '       group by  pdf.produto, p.codigovisual, pdf.filial, p.desc' +
        'ricao, c.grupo, g.descricao, ct.cliente, ct.tipocliente, mes'
      #9#9#9#9#9#9#9#9#9#9' '
      #9#9#9
      #9#9')'
      ''
      ''
      '  /* VENDAS FRENTE DE CAIXA */'
      '  union all'
      '  '
      '  ('
      ''
      '    select'
      '      coalesce(df.cliente,0) as cliente,'
      
        '      coalesce(df.tipocliente, cast('#39#39'C'#39#39' as char(1))) as tipocl' +
        'iente,'
      '      pdf.produto, p.codigovisual as produtovisual,'
      '      pdf.filial,'
      '      p.descricao,'
      '      c.grupo,'
      '      g.descricao as descricaogrupo,'
      ''
      '      to_char(df.data, '#39#39'YYYY/MM'#39#39') as mes,'
      '      cast(sum(pdf.quantidade) as numeric(9,3)) as quantidade'
      ''
      ''
      '    from (dadosfiscais df'
      #9' '#9'join (produtosdadosfiscais pdf'
      #9#9#9'  join (produtos p'
      #9#9#9#9#9'join (((caracteristicas c'
      #9#9#9#9#9#9'    join classes cl on c.classe=cl.codigo)'
      #9#9#9#9#9#9'    join grupos g on c.grupo=g.codigo)'
      #9#9#9#9#9#9'    join marcas m on c.marca=m.codigo)'
      ''
      #9#9#9#9#9'on c.codigo = p.caracteristica)'
      #9#9#9'  on pdf.produto = p.codigo)'
      #9#9'on pdf.dadofiscal = df.numero)'
      ''
      ''
      '     %FrentedeCaixaDataFaturamentoVendasProdutos'
      '     /* df.data between(:DataInicial) and (:DataFinal) */'
      ''
      '    and df.contrato is null'
      '    AND df.situacao not in ('#39#39'C'#39#39','#39#39'D'#39#39')'
      '    AND (coalesce(df.valorvista,0)<>0)'
      '    /*'
      
        '    and ((EXISTS (SELECT vdf.dadofiscal FROM venctosdadosfiscais' +
        ' vdf WHERE vdf.dadofiscal=df.numero)) or'
      
        '                  (mod(df.codigofiscal,1000) in (102,103,104,105' +
        ',929)))'
      '*/'
      ''
      '    and ehnotafiscalsaidavenda(pdf.codigofiscal)'
      '    and not coalesce(df.notavinculada,false)'
      ''
      ''
      #9' %_2_FrentedeCaixaFiltroVendas'
      ''
      
        '    group by  pdf.produto, p.codigovisual, pdf.filial, p.descric' +
        'ao, c.grupo, g.descricao, coalesce(df.cliente,0), coalesce(df.ti' +
        'pocliente, cast('#39#39'C'#39#39' as char(1))), mes'
      ''
      '  )'
      ''
      ''
      ''
      #9#9'/*INICIO TOTAL VENDAS FATURADAS*/'
      ''
      #9#9'union all'
      ''
      #9#9'('
      
        '  '#9#9'  select cliente, tipocliente, vproduto as produto, vproduto' +
        'visual as produtovisual, vfilial as filial, descricao,'
      
        '               grupo, descricaogrupo, mes, qtFaturada as quantid' +
        'ade'
      ''
      #9#9'from'
      #9#9'('
      #9#9'select produtos.*,'
      
        #9#9#9'   (produtos.quantidade - coalesce(pd.quantidade,0)) as qtfat' +
        'urada'
      #9#9'from'
      #9#9'('
      #9#9' select pc.contrato as vcontrato,'
      #9#9#9#9'pc.produto as vproduto, p.codigovisual as vprodutovisual,'
      #9#9#9#9'pc.filial as vfilial,'
      ''
      #9#9#9#9'ct.cliente,'
      #9#9#9#9'ct.tipocliente,'
      #9#9#9#9'to_char(ct.faturamento, '#39#39'YYYY/MM'#39#39') as mes,'
      '        p.descricao,'
      '        c.grupo,'
      '        g.descricao as descricaogrupo,'
      ''
      #9#9#9#9'pc.quantidade'
      ''
      ''
      #9#9' from (contratos ct'
      #9#9#9'   join (produtoscontratos pc'
      #9#9#9#9#9'   join (produtos p'
      
        #9#9#9#9#9#9#9'  join (((caracteristicas c join classes cl on c.classe=c' +
        'l.codigo)'
      #9#9#9#9#9#9#9#9#9#9#9#9#9'   join grupos g on g.codigo=c.grupo)'
      '                             join marcas m on c.marca=m.codigo)'
      #9#9#9#9#9#9#9#9#9#9'on p.caracteristica=c.codigo)'
      #9#9#9#9#9#9#9#9#9'   on pc.produto=p.codigo)'
      #9#9#9#9#9#9#9#9#9'on ct.numero = pc.contrato)'
      ''
      #9#9#9' %_2_DataFaturamentoVendasProdutos'
      ''
      
        #9#9#9' and case when ct.os then ct.tipoequipamento in (1,2) and not' +
        ' (coalesce(ct.os_garantia,false) and ct.os_garantia_status='#39#39'A'#39#39 +
        ') and not coalesce(ct.os_cortesia,false) else true end'
      #9#9#9' and ct.origem is null'
      #9#9#9' and not coalesce(pc.brinde,false)'
      #9#9#9' AND (coalesce(ct.valorvista,0)<>0)'
      ''
      #9#9'   /*and ((ct.situacao <> '#39#39'N'#39#39') or'
      #9#9#9#9'(ct.situacao = '#39#39'N'#39#39' and exists (select cd.contrato'
      #9#9#9#9#9#9#9#9#9#9'   from contratosdevolvidos cd'
      #9#9#9#9#9#9#9'   where cd.contrato = ct.numero'
      #9#9#9#9#9#9#9' and cd.produto = pc.produto'
      #9#9#9#9#9#9#9' and cd.filial = pc.filial'
      #9#9#9#9#9#9#9' and cd.tipo='#39#39'D'#39#39
      #9#9#9#9#9#9#9' and cd.situacao = '#39#39'F'#39#39')))*/'
      ''
      ''
      #9#9#9' %_2_FiltroVendas'
      ''
      ''
      #9#9'order by pc.contrato, pc.produto, pc.filial'
      
        #9#9') as produtos left join (select df.contrato, pdf.produto, pdf.' +
        'filial,'
      #9#9#9#9#9#9#9#9'  coalesce(sum(pdf.quantidade),0) as quantidade'
      #9#9#9#9#9#9#9#9'  from ((dadosfiscais df'
      
        #9#9#9#9#9#9#9#9#9#9'  join contratos ct on ct.numero = df.contrato and df.' +
        'situacao='#39#39'N'#39#39')'
      #9#9#9#9#9#9#9#9#9#9'  join (produtosdadosfiscais pdf'
      
        #9#9#9#9#9#9#9#9#9#9#9#9#9'  /*join movimentos mv on pdf.dadofiscal = mv.dadof' +
        'iscal and mv.produto=pdf.produto)*/'
      #9#9#9#9#9#9#9#9#9#9#9#9#9'  join (produtos p'
      
        #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9'   join ((caracteristicas c join classes cl on c.' +
        'classe=cl.codigo)'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9' join grupos g on g.codigo=c.grupo'
      
        '                                   join marcas m on c.marca=m.co' +
        'digo)'
      #9#9#9#9#9#9#9#9#9#9'on p.caracteristica=c.codigo)'
      #9#9#9#9#9#9#9#9#9'   on pdf.produto=p.codigo)'
      #9#9#9#9#9#9#9#9#9' on df.numero = pdf.dadofiscal), produtoscontratos pc'
      ''
      ''
      '                   %_3_DataFaturamentoVendasProdutos'
      ''
      '                   and ct.numero = pc.contrato'
      #9#9#9#9#9#9#9#9'   and pc.produto = pdf.produto'
      #9#9#9#9#9#9#9#9'   and pc.filial = pdf.filial'
      ''
      ''
      #9#9#9#9#9#9#9#9'   and not coalesce(df.notavinculada,false)'
      #9#9#9#9#9#9#9#9'   and NOT pc.brinde'
      #9#9#9#9#9#9#9#9'   AND (coalesce(ct.valorvista,0)<>0)'
      #9#9#9#9#9#9#9#9'   and ct.origem IS NULL'
      
        #9#9#9#9#9#9#9#9'   and case when ct.os then ct.tipoequipamento in (1,2) ' +
        'and not (coalesce(ct.os_garantia,false) and ct.os_garantia_statu' +
        's='#39#39'A'#39#39') and not coalesce(ct.os_cortesia,false) else true end'
      '                   %_3_FiltroVendas'
      ''
      #9#9#9#9#9#9#9#9' group by df.contrato, pdf.produto, pdf.filial'
      #9#9#9#9#9#9#9'   ) pd on produtos.vcontrato = pd.contrato'
      #9#9#9#9#9#9#9#9'   and produtos.vproduto = pd.produto'
      #9#9#9#9#9#9#9#9'   and produtos.vfilial = pd.filial'
      #9#9') as produtos'
      #9#9'where qtfaturada<>0'
      ''
      #9#9')'
      ''
      '  union all'
      ''
      '/*SERVICOS*/'
      ''
      '  ('
      '   select'
      '       ct.cliente, ct.tipocliente,   '
      '      sc.servico as produto,'
      '      cast(sc.servico as varchar(20)) as produtovisual,'
      '      ct.filialvenda as filial,'
      '      s.descricao,'
      '      cast('#39#39'SERV'#39#39' as char(4)) as grupo,'
      '      cast('#39#39'SERVI'#199'OS'#39#39' as varchar(100)) as descricaogrupo,'
      ''
      '      to_char(ct.faturamento, '#39#39'YYYY/MM'#39#39') as mes,'
      '      cast(sum(sc.quantidade) as numeric(9,3)) as quantidade'
      ''
      '   from (contratos ct join'
      
        '         (servicoscontratos sc join servicos s on sc.servico = s' +
        '.codigo)'
      '         on ct.numero = sc.contrato)'
      ''
      '   %DataFaturamentoVendasServicos'
      '   /*ct.faturamento between(:DataInicial) and (:DataFinal)*/'
      '   '
      
        '   and case when ct.os then ct.tipoequipamento in (1,2) and not ' +
        '(coalesce(ct.os_garantia,false) and ct.os_garantia_status='#39#39'A'#39#39')' +
        ' and not coalesce(ct.os_cortesia,false) else true end'
      '   '
      '   %FiltroServicos'
      ''
      
        '   group by  sc.servico, ct.filialvenda, s.descricao, ct.cliente' +
        ', ct.tipocliente,  mes'
      '  )'
      '  union all'
      ''
      '/*DEVOLU'#199#213'ES*/'
      ''
      '  ('
      '   ('
      '    select ct.cliente, ct.tipocliente,'
      '      cd.produto, p.codigovisual as produtovisual,'
      '      cd.filial,'
      '      p.descricao,'
      '      c.grupo,'
      '      g.descricao as descricaogrupo,'
      ''
      '      to_char(cd.devolucao, '#39#39'YYYY/MM'#39#39') as mes,'
      '      - cast(sum(cd.quantidade) as numeric(9,3)) as quantidade'
      ''
      
        '    from (((contratosdevolvidos cd join contratos ct on cd.contr' +
        'ato=ct.numero)'
      
        '                                  join produtoscontratos pc on c' +
        'd.contrato = pc.contrato and cd.produto=pc.produto and cd.filial' +
        ' = pc.filial)'
      
        #9' '#9'                  join (produtos p join (((caracteristicas c ' +
        'join classes cl on c.classe=cl.codigo)'
      
        ' '#9#9#9#9'  '#9'                                     join grupos g on c.' +
        'grupo=g.codigo)'
      
        #9#9#9'                                                     join mar' +
        'cas m on c.marca=m.codigo)'
      
        '                                                                ' +
        '             on p.caracteristica=c.codigo)'
      
        '                                                  on cd.produto=' +
        'p.codigo)'
      ''
      '      %DataFaturamentoVendasDevolucoes'
      '      /*cd.devolucao between(:DataInicial) and (:DataFinal)*/'
      ''
      
        '          and case when ct.os then ct.tipoequipamento in (1,2) a' +
        'nd not (coalesce(ct.os_garantia,false) and ct.os_garantia_status' +
        '='#39#39'A'#39#39') and not coalesce(ct.os_cortesia,false) else true end'
      '      and cd.tipo = '#39#39'D'#39#39
      ''
      '      %FiltroDevolucoes'
      ''
      
        '    group by cd.produto, p.codigovisual, cd.filial, p.descricao,' +
        ' c.grupo, g.descricao, ct.cliente, ct.tipocliente, mes'
      ''
      '   )'
      '   union all'
      '    ('
      
        '       select np.fornecedor as cliente, np.tipofornecedor as tip' +
        'ocliente,'
      
        '              pnp.produto, p.codigovisual as produtovisual, np.f' +
        'ilial, p.descricao, c.grupo,'
      
        '              g.descricao as descricaogrupo,  to_char(np.data, '#39 +
        #39'YYYY/MM'#39#39') as mes,'
      '              - pnp.quantidade'
      ''
      '       FROM (notaspag np'
      '            join ((produtosnotaspag pnp'
      ''
      '                 left join (produtosdadosfiscais pdf'
      '                            join dadosfiscais df'
      '                            on pdf.dadofiscal  = df.numero)'
      ''
      '                 on pnp.dadofiscal = pdf.dadofiscal'
      '                 and pnp.numeroprodutotabela = pdf.numero)'
      ''
      
        '            join (produtos p join (((caracteristicas c join clas' +
        'ses cl on c.classe=cl.codigo)'
      
        '                               join grupos g on g.codigo=c.grupo' +
        ')'
      
        '                               join marcas m on c.marca=m.codigo' +
        ')'
      '                        on p.caracteristica=c.codigo)'
      '            on pnp.produto = p.codigo)'
      '           on np.codigo = pnp.codigonota)'
      ''
      '          %DataFaturamentoNotasPag'
      ''
      '         and ehnotafiscalentradadevolucao(np.codigofiscal)'
      '         and np.contrato is null'
      ''
      '         %FiltroNotasPag'
      ''
      '    )'
      ''
      '   union all'
      '   ('
      '      select        ct.cliente,  ct.tipocliente,'
      '                    pc.produto, p.codigovisual as produtovisual,'
      #9'       pc.filial,'
      '               p.descricao,'
      '      c.grupo,'
      '      g.descricao as descricaogrupo,'
      ''
      
        '               to_char(cancelados.datapagto, '#39#39'YYYY/MM'#39#39') as mes' +
        ','
      
        '              - cast(sum(pc.quantidade) as numeric(9,3)) as quan' +
        'tidade'
      ''
      #9'from (select distinct ct.numero, p.datapagto'
      #9#9'from contratos ct, parcelas p'
      #9#9'where ct.numero=p.contrato and'
      #9#9'ct.situacao='#39#39'C'#39#39
      
        '        and case when ct.os then ct.tipoequipamento in (1,2) and' +
        ' not (coalesce(ct.os_garantia,false) and ct.os_garantia_status='#39 +
        #39'A'#39#39') and not coalesce(ct.os_cortesia,false) else true end'
      '    and not exists (select p2.numero'
      #9#9#9#9'from parcelas p2'
      #9#9#9#9'where p2.contrato = ct.numero and'
      #9#9#9#9#9'p2.tipopagto<>'#39#39'E'#39#39')'
      ''
      '                                  %DataPagamentoCancelamento'
      #9#9'/*p.datapagto  between(:DataInicial) and (:DataFinal)*/'
      ''
      
        '                                       and not exists (select cd' +
        '.contrato'
      
        '                                                           from ' +
        'contratosdevolvidos cd'
      
        '                                                           where' +
        ' cd.contrato = ct.numero and cd.tipo='#39#39'D'#39#39')'
      #9#9') as cancelados, (contratos ct join'
      #9#9'                  (produtoscontratos pc join'
      
        #9#9#9#9'   (produtos p join (((caracteristicas c join classes cl on ' +
        'c.classe = cl.codigo)'
      
        ' '#9#9#9'  '#9'                                         join grupos g on' +
        ' c.grupo=g.codigo)'
      
        #9#9#9'                                                 join marcas ' +
        'm on c.marca=m.codigo)'
      
        #9#9#9#9#9'                               on p.caracteristica = c.codi' +
        'go)'
      #9#9#9#9'               on pc.produto=p.codigo)'
      #9#9#9'          on pc.contrato = ct.numero)'
      #9'where cancelados.numero = ct.numero'
      ''
      '              %FiltroCancelamentos'
      ''
      
        '        group by  pc.produto, p.codigovisual, pc.filial, p.descr' +
        'icao, c.grupo, g.descricao, ct.cliente, ct.tipocliente, mes'
      '   )'
      '  )'
      ' ) as temp'
      
        ' group by  produtofilial, produto, produtovisual, filial, descri' +
        'cao, grupo, descricaogrupo, cliente, tipocliente, mes'
      ' order by 1'#39','
      ''
      #39'select distinct to_char(cast('#39#39
      '%datainicial_1'
      
        #39#39' as date)  + s.a,'#39#39'YYYY/MM'#39#39') as mes from generate_series(1,ca' +
        'st('#39#39
      '%datafinal'
      #39#39' as date)-cast('#39#39
      '%datainicial_2'
      #39#39' as date)) as s(a) order by 1'#39
      ')'
      'AS'
      ' ( produtofilial varchar(250),'
      '   produto bigint,'
      '   produtovisual varchar(20),'
      '   filial int,'
      '   descricao varchar(100),'
      '   grupo char(4),'
      '   descricaogrupo varchar(100),'
      '   cliente int,'
      '   tipocliente char(1),'
      '   Total numeric(11,2),'
      '   '
      '   %meses'
      '   '
      ')')
    RequestLive = False
    Left = 248
    Top = 16
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
    Left = 232
    Top = 192
  end
  object qryVendasClientes: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryVendasClientesAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      '')
    RequestLive = True
    Left = 89
    Top = 258
    object qryVendasClientesClienteTipoCliente: TStringField
      FieldName = 'clientetipocliente'
      Visible = False
      Size = 60
    end
    object qryVendasClientesCliente: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'cliente'
    end
    object qryVendasClientesTipoCliente: TStringField
      DisplayLabel = 'T'
      FieldName = 'tipocliente'
      Size = 1
    end
    object qryVendasClientesNome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
    object qryVendasClientesTotal: TCurrencyField
      DisplayWidth = 15
      FieldName = 'Total'
      DisplayFormat = '####,###,##0.00'
    end
  end
  object qryVendasClientes_aux: TtecQuery
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
        Name = 'meses'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'SELECT * FROM crosstab'
      '('
      
        #39'select  cast(nome||cast(cliente as varchar)||tipocliente as var' +
        'char(60)) as clientetipocliente,'
      
        '         cliente,tipocliente,nome, 0.00 as Total, mes, cast(sum(' +
        'ValorTotal) as numeric(12,2)) as ValorTotal from'
      ' ('
      ''
      '  /*VENDAS*/'
      ''
      '  ('
      '   select cliente, tipocliente, nome, mes,'
      
        '          cast(sum(ValorBrutodoProduto-ValorDescontodoProduto+Va' +
        'lorAcrescProduto) as numeric(12,2)) as ValorTotal'
      '   from'
      '   ('
      '   '
      ''
      #9#9'/* VENDAS NOTAS FISCAIS */'
      #9#9'('
      #9#9#9' '
      #9#9#9'select ct.cliente, ct.tipocliente, vf.razao as nome,'
      #9#9#9'to_char(ct.faturamento, '#39#39'YYYY/MM'#39#39') as mes,'
      ''
      ''
      
        #9#9#9'(pdf.quantidade*pdf.precovenda) + coalesce(pdf.frete,0) + coa' +
        'lesce(pdf.seguro,0)  AS ValorBrutodoProduto,'
      ''
      #9#9#9'coalesce(pdf.desconto,0) as ValorDescontodoProduto,'
      #9#9#9'coalesce(pdf.acrescimo,0) as ValorAcrescProduto'
      #9#9#9' '
      ''
      #9#9#9'from ((dadosfiscais df'
      #9#9#9#9'   join (contratos ct '
      #9#9#9#9#9#9' join vfornecedores vf '
      #9#9#9#9#9#9' on ct.cliente = vf.codigo '
      #9#9#9#9#9#9' and ct.tipocliente = vf.tipo)'
      #9#9#9#9#9#9' on ct.numero = df.contrato)'
      #9#9#9#9'   join (produtosdadosfiscais pdf'
      
        #9#9#9#9#9#9'   /*join movimentos mv on pdf.dadofiscal = mv.dadofiscal ' +
        'and pdf.produto=mv.produto)*/ /* garantir a integridade em rela'#231 +
        #227'o a outros relatorios */'
      #9#9#9#9#9#9'   join (produtos p'
      
        #9#9#9#9#9#9#9#9'  join ((caracteristicas c join classes cl on c.classe=c' +
        'l.codigo)'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9'   join grupos g on g.codigo=c.grupo'
      
        '                               join marcas m on c.marca=m.codigo' +
        ')'
      #9#9#9#9#9#9#9#9#9#9#9'on p.caracteristica=c.codigo)'
      #9#9#9#9#9#9#9#9#9#9'   on pdf.produto=p.codigo)'
      #9#9#9#9#9#9#9#9#9#9' on df.numero = pdf.dadofiscal)'
      ''
      #9#9#9#9#9#9#9#9#9#9' '
      #9#9#9' %DataFaturamentoVendasProdutos'
      #9#9#9#9' '
      
        #9#9#9' and case when ct.os then ct.tipoequipamento in (1,2) and not' +
        ' (coalesce(ct.os_garantia,false) and ct.os_garantia_status='#39#39'A'#39#39 +
        ') and not coalesce(ct.os_cortesia,false) else true end'#9#9#9' '
      #9#9#9' and ct.origem is null'
      #9#9#9' and not coalesce(pdf.brinde,false)'
      '       AND df.situacao NOT IN ('#39#39'D'#39#39','#39#39'C'#39#39')'
      #9#9#9' AND (coalesce(ct.valorvista,0)<>0)'
      #9#9#9' and not coalesce(df.notavinculada,false)'
      ''
      #9#9#9' %FrentedeCaixaFiltroVendas'
      ''
      
        #9#9#9' order by ct.cliente, ct.tipocliente, UPPER(TO_ASCII(vf.razao' +
        ','#39#39'LATIN1'#39#39')), mes'#9#9#9#9#9#9#9#9#9' '
      #9#9#9#9#9#9#9#9#9#9' '
      #9#9#9
      #9#9')'
      #9
      #9
      '    /* VENDAS FRENTE DE CAIXA */'
      #9
      #9#9'union all'
      ''
      #9#9'('
      ''
      #9#9'  select coalesce(df.cliente,0) as cliente, '
      #9#9'         coalesce(df.tipocliente, '
      #9#9#9#9' cast('#39#39'C'#39#39' as char(1))) as tipocliente,  '
      
        #9#9#9#9' coalesce(vf.razao, cast('#39#39'FRENTE DE CAIXA'#39#39' as varchar(60))' +
        ') as nome,'
      #9#9'         to_char(df.data, '#39#39'YYYY/MM'#39#39') as mes,'
      ''
      #9#9#9#9'((pdf.quantidade*pdf.precovenda) +'
      #9#9#9#9'  coalesce(pdf.frete,0) +'
      #9#9#9#9'  coalesce(pdf.seguro,0)) as ValorBrutodoProduto,'
      ''
      #9#9#9#9'  coalesce(pdf.desconto,0) as ValorDescontodoProduto,'
      ''
      #9#9#9#9'  coalesce(pdf.acrescimo,0) as ValorAcrescProduto'
      #9#9'  from ((dadosfiscais df'
      #9#9#9#9'join (produtosdadosfiscais pdf'
      #9#9#9#9#9'  join (produtos p'
      #9#9#9#9#9#9#9'join (((caracteristicas c'
      #9#9#9#9#9#9#9#9'    join classes cl on c.classe=cl.codigo)'
      #9#9#9#9#9#9#9#9'    join grupos g on c.grupo=g.codigo)'
      #9#9#9#9#9#9#9#9'    join marcas m on c.marca=m.codigo)'
      ''
      #9#9#9#9#9#9#9'on c.codigo = p.caracteristica)'
      #9#9#9#9#9'  on pdf.produto = p.codigo)'
      #9#9#9#9'on pdf.dadofiscal = df.numero)'
      
        '        left join vfornecedores vf on df.cliente = vf.codigo and' +
        ' df.tipocliente = vf.tipo)'
      ''
      #9#9'  %FrentedeCaixaDataFaturamentoVendasProdutos'
      #9#9'  /* df.data between(:DataInicial) and (:DataFinal) */'
      ''
      '      and df.contrato is null'
      #9'  AND df.situacao not in ('#39#39'C'#39#39','#39#39'D'#39#39')'
      '      and not coalesce(pdf.brinde,false)'
      #9'  AND (coalesce(df.valorvista,0)<>0)'
      '/*'
      
        '      and ((EXISTS (SELECT vdf.dadofiscal FROM venctosdadosfisca' +
        'is vdf WHERE vdf.dadofiscal=df.numero)) or'
      
        '                    (mod(df.codigofiscal,1000) in (102,103,104,1' +
        '05,929)))'
      '*/'#9#9#9#9#9
      ''
      #9'  and ehnotafiscalsaidavenda(pdf.codigofiscal)'
      '      and not coalesce(df.notavinculada,false)'
      ''
      #9#9'  %_2_FrentedeCaixaFiltroVendas'
      '   '#9#9'  '
      
        #9#9'  order by df.cliente, df.tipocliente, UPPER(TO_ASCII(vf.razao' +
        ','#39#39'LATIN1'#39#39')), mes'
      ''
      #9#9')'
      #9'        '
      #9#9'/*INICIO TOTAL VENDAS FATURADAS*/'
      ''
      #9#9'union all'
      ''
      #9#9'('
      '  '#9#9'  select cliente, tipocliente, nome, mes,'
      ''
      ''
      
        #9#9#9#9' (qtfaturada*precovenda) + coalesce(frete,0) + coalesce(segu' +
        'ro,0)  AS ValorBrutodoProduto,'
      ''
      #9#9#9#9'  coalesce(produtos.desconto,0) as ValorDescontodoProduto,'
      #9#9#9#9'  coalesce(produtos.acrescimo,0) as ValorAcrescProduto'
      ''
      ''
      #9#9'from'
      #9#9'('
      #9#9'select produtos.*,'
      
        #9#9#9'   (produtos.quantidade - coalesce(pd.quantidade,0)) as qtfat' +
        'urada'
      #9#9'from'
      #9#9'('
      #9#9' select pc.contrato as vcontrato,'
      #9#9#9#9'pc.produto as vproduto,'
      #9#9#9#9'pc.filial as vfilial,'
      ''
      #9#9#9#9'ct.cliente,'
      #9#9#9#9'ct.tipocliente,'
      #9#9#9#9'vf.razao as nome,'
      #9#9#9#9'to_char(ct.faturamento, '#39#39'YYYY/MM'#39#39') as mes,'
      ''
      #9#9#9#9'pc.acrescimo,'
      ''
      #9#9#9#9'pc.quantidade,'
      ''
      #9#9#9'pc.precovenda,'
      ''
      #9#9#9'pc.frete,'
      #9#9#9'pc.seguro,'
      #9#9#9'pc.desconto'
      ''
      ''
      #9#9' from ((contratos ct'
      #9#9'       join vfornecedores vf'
      #9#9#9#9#9#9' on ct.cliente = vf.codigo'
      #9#9#9#9#9#9' and ct.tipocliente = vf.tipo)'
      #9#9#9'   join (produtoscontratos pc'
      #9#9#9#9#9'   join (produtos p'
      
        #9#9#9#9#9#9#9'  join ((caracteristicas c join classes cl on c.classe=cl' +
        '.codigo)'
      #9#9#9#9#9#9#9#9#9#9#9#9#9'   join grupos g on g.codigo=c.grupo'
      '                             join marcas m on c.marca=m.codigo)'
      #9#9#9#9#9#9#9#9#9#9'on p.caracteristica=c.codigo)'
      #9#9#9#9#9#9#9#9#9'   on pc.produto=p.codigo)'
      #9#9#9#9#9#9#9#9#9'on ct.numero = pc.contrato)'
      ''
      ''
      ''
      ''
      #9#9#9' %_2_DataFaturamentoVendasProdutos'
      ''
      
        #9#9#9' and case when ct.os then ct.tipoequipamento in (1,2) and not' +
        ' (coalesce(ct.os_garantia,false) and ct.os_garantia_status='#39#39'A'#39#39 +
        ') and not coalesce(ct.os_cortesia,false) else true end'
      #9#9#9' and ct.origem is null'
      #9#9#9' and not coalesce(pc.brinde,false)'
      #9#9#9' AND (coalesce(ct.valorvista,0)<>0)'
      ''
      #9#9'   /*and ((ct.situacao <> '#39#39'N'#39#39') or'
      #9#9#9#9'(ct.situacao = '#39#39'N'#39#39' and exists (select cd.contrato'
      #9#9#9#9#9#9#9#9#9#9'   from contratosdevolvidos cd'
      #9#9#9#9#9#9#9'   where cd.contrato = ct.numero'
      #9#9#9#9#9#9#9' and cd.produto = pc.produto'
      #9#9#9#9#9#9#9' and cd.filial = pc.filial'
      #9#9#9#9#9#9#9' and cd.tipo='#39#39'D'#39#39
      #9#9#9#9#9#9#9' and cd.situacao = '#39#39'F'#39#39')))*/'
      ''
      ''
      #9#9#9' %_2_FiltroVendas'
      ''
      ''
      #9#9'order by pc.contrato, pc.produto, pc.filial'
      #9#9') as produtos left join'
      '                (select df.contrato, pdf.produto, pdf.filial,'
      #9#9#9#9#9#9#9#9'  coalesce(sum(pdf.quantidade),0) as quantidade'
      #9#9#9#9#9#9#9#9'  from ((dadosfiscais df'
      
        #9#9#9#9#9#9#9#9#9#9'  join contratos ct on ct.numero = df.contrato and df.' +
        'situacao='#39#39'N'#39#39')'
      #9#9#9#9#9#9#9#9#9#9'  join (produtosdadosfiscais pdf'
      
        #9#9#9#9#9#9#9#9#9#9#9#9#9'  /*join movimentos mv on pdf.dadofiscal= mv.dadofi' +
        'scal and pdf.produto=mv.produto)*/'
      #9#9#9#9#9#9#9#9#9#9#9#9#9'  join (produtos p'
      
        #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9'   join ((caracteristicas c join classes cl on c.' +
        'classe=cl.codigo)'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9' join grupos g on g.codigo=c.grupo'
      
        '                                   join marcas m on c.marca=m.co' +
        'digo)'
      #9#9#9#9#9#9#9#9#9#9'on p.caracteristica=c.codigo)'
      #9#9#9#9#9#9#9#9#9'   on pdf.produto=p.codigo)'
      #9#9#9#9#9#9#9#9#9' on df.numero = pdf.dadofiscal),'
      ''
      '                                   produtoscontratos pc'
      ''
      #9#9#9#9#9#9#9#9' '
      #9#9#9#9#9#9#9#9'   %_3_DataFaturamentoVendasProdutos'#9#9#9#9#9#9#9#9' '
      #9#9#9#9#9#9#9#9' '
      #9#9#9#9#9#9#9#9'   AND ct.numero = pc.contrato'
      #9#9#9#9#9#9#9#9'   and pc.produto = pdf.produto'
      #9#9#9#9#9#9#9#9'   and pc.filial = pdf.filial'
      ''
      #9#9#9#9#9#9#9#9'   '
      ''
      #9#9#9#9#9#9#9#9'   and not coalesce(df.notavinculada,false)'
      #9#9#9#9#9#9#9#9'   and NOT pc.brinde'
      #9#9#9#9#9#9#9#9'   AND (coalesce(ct.valorvista,0)<>0)'
      #9#9#9#9#9#9#9#9'   and ct.origem IS NULL'
      
        #9#9#9#9#9#9#9#9'   and case when ct.os then ct.tipoequipamento in (1,2) ' +
        'and not (coalesce(ct.os_garantia,false) and ct.os_garantia_statu' +
        's='#39#39'A'#39#39') and not coalesce(ct.os_cortesia,false) else true end'
      ''
      '                   %_3_FiltroVendas'
      ''
      ''
      #9#9#9#9#9#9#9#9' group by df.contrato, pdf.produto, pdf.filial'
      #9#9#9#9#9#9#9'   ) pd on produtos.vcontrato = pd.contrato'
      #9#9#9#9#9#9#9#9'   and produtos.vproduto = pd.produto'
      #9#9#9#9#9#9#9#9'   and produtos.vfilial = pd.filial'
      #9#9') as produtos'
      #9#9'where qtfaturada<>0'
      
        #9#9'order by cliente, tipocliente, UPPER(TO_ASCII(nome,'#39#39'LATIN1'#39#39')' +
        '), mes'
      ''
      #9#9')'
      #9#9
      #9#9'/*FINAL TOTAL VENDAS FATURADAS*/'
      ''
      ''
      '   ) as vendas'
      '   group by  nome, cliente, tipocliente,  mes'
      '  )'
      '  union all'
      ''
      '/*SERVICOS*/'
      ''
      '  ('
      '   select ct.cliente, ct.tipocliente, vf.razao as nome,'
      '      to_char(ct.faturamento, '#39#39'YYYY/MM'#39#39') as mes,'
      
        '      cast(sum(coalesce(sc.quantidade,0)*coalesce(sc.valorservic' +
        'o,0)) as numeric(12,2)) as valorTotal'
      ''
      ''
      '   from ((contratos ct join'
      
        '         (servicoscontratos sc join servicos s on sc.servico = s' +
        '.codigo)'
      '         on ct.numero = sc.contrato)'
      
        '         join vfornecedores vf on ct.cliente = vf.codigo and ct.' +
        'tipocliente = vf.tipo)'
      ''
      '   %DataFaturamentoVendasServicos'
      '   /*ct.faturamento between(:DataInicial) and (:DataFinal)*/'
      
        '       and case when ct.os then ct.tipoequipamento in (1,2) and ' +
        'not (coalesce(ct.os_garantia,false) and ct.os_garantia_status='#39#39 +
        'A'#39#39') and not coalesce(ct.os_cortesia,false) else true end'
      ''
      '   %FiltroServicos'
      ''
      '   group by  vf.razao, ct.cliente, ct.tipocliente,  mes'
      '  )'
      '  '
      '  union all'
      ''
      '/*DEVOLU'#199#213'ES*/'
      ''
      '  (  '
      '   ('
      '    select ct.cliente, ct.tipocliente, vf.razao as nome,'
      '      to_char(cd.devolucao, '#39#39'YYYY/MM'#39#39') as mes,'
      #9'  '
      '      - cast(sum(cd.ValorPrazo) as numeric(12,2)) as ValorTotal'
      ''
      
        '    from (((contratosdevolvidos cd join (contratos ct join vforn' +
        'ecedores vf on ct.cliente = vf.codigo and ct.tipocliente = vf.ti' +
        'po) on cd.contrato=ct.numero)'
      
        '                                  join produtoscontratos pc on c' +
        'd.contrato = pc.contrato and cd.produto=pc.produto and cd.filial' +
        ' = pc.filial)'
      
        #9' '#9'                  join (produtos p join (((caracteristicas c ' +
        'join classes cl on c.classe=cl.codigo)'
      
        ' '#9#9#9#9'  '#9'                                     join grupos g on c.' +
        'grupo=g.codigo)'
      
        #9#9#9'                                                     join mar' +
        'cas m on c.marca=m.codigo)'
      
        '                                                                ' +
        '             on p.caracteristica=c.codigo)'
      
        '                                                  on cd.produto=' +
        'p.codigo)'
      '      %DataFaturamentoVendasDevolucoes'
      '      /*cd.devolucao between(:DataInicial) and (:DataFinal)*/'
      '      '
      
        '      and case when ct.os then ct.tipoequipamento in (1,2) and n' +
        'ot (coalesce(ct.os_garantia,false) and ct.os_garantia_status='#39#39'A' +
        #39#39') and not coalesce(ct.os_cortesia,false) else true end'
      '      and cd.tipo = '#39#39'D'#39#39
      '/*      and cd.situacao = '#39#39'N'#39#39'  */'
      ''
      '      %FiltroDevolucoes '
      #9'  '
      ''
      '    group by vf.razao, ct.cliente, ct.tipocliente, mes'
      ''
      '   )'
      '   '
      '   union all   '
      ''
      #9'('
      ''
      #9' select  cliente, tipocliente, nome, mes,'
      
        #9'         - (valorbrutodoproduto - Valordescontodoproduto + valo' +
        'racrescproduto) as ValorTotal'#9' '
      #9' from'
      #9' ('
      #9' '
      
        #9'  select np.fornecedor as cliente, np.tipofornecedor as tipocli' +
        'ente, vf.razao as nome,'
      '      to_char(np.data, '#39#39'YYYY/MM'#39#39') as mes,'
      ''
      
        #9#9' (pnp.quantidade * pnp.precounitario) + coalesce(pnp.frete,0) ' +
        '+ coalesce(pnp.seguro,0) as ValorBrutodoproduto,'
      
        #9#9' coalesce(pnp.desconto,0) + coalesce(pnp.valordescontoitem,0) ' +
        'as ValorDescontodoProduto,'
      #9#9' coalesce(pnp.acrescimo,0) as ValorAcrescProduto'
      ''
      '     FROM ((notaspag np'
      '            join ((produtosnotaspag pnp'
      ''
      '                 left join (produtosdadosfiscais pdf'
      '                            join dadosfiscais df'
      '                            on pdf.dadofiscal  = df.numero)'
      ''
      '                 on pnp.dadofiscal = pdf.dadofiscal'
      '                 and pnp.numeroprodutotabela = pdf.numero)'
      ''
      
        '            join (produtos p join (((caracteristicas c join clas' +
        'ses cl on c.classe=cl.codigo)'
      
        '                               join grupos g on g.codigo=c.grupo' +
        ')'
      
        '                               join marcas m on c.marca=m.codigo' +
        ')'
      '                        on p.caracteristica=c.codigo)'
      '            on pnp.produto = p.codigo)'
      '           on np.codigo = pnp.codigonota)'
      ''
      ''
      #9#9#9'   join vfornecedores vf'
      #9#9#9'   on np.fornecedor = vf.codigo'
      #9#9#9'   and np.tipofornecedor = vf.tipo)'
      ''
      ''
      #9#9'    %DataFaturamentoNotasPag'
      ''
      #9#9'   and ehnotafiscalentradadevolucao(np.codigofiscal)'
      #9#9'   and np.contrato is null'
      ''
      '       %FiltroNotasPag'
      #9#9'   '
      #9'  ) as devolucoes '
      #9')'
      #9
      #9'union all'
      '   '
      '   '
      '   '
      '   '
      '   ('
      '     select cliente, tipocliente, nome, mes,'
      
        '         - cast(sum(ValorBrutodoProduto-ValorDescontodoProduto+V' +
        'alorAcrescProduto) as numeric(12,2)) as ValorTotal'
      '     from'
      '     ('
      #9'select vf.razao as nome, ct.cliente, ct.tipocliente,'
      
        '               to_char(cancelados.datapagto, '#39#39'YYYY/MM'#39#39') as mes' +
        ','
      ''
      #9#9'((pc.quantidade*pc.precovenda) +'
      
        #9#9'(((coalesce(ct.frete,0)+coalesce(ct.seguro,0))*(pc.quantidade*' +
        'pc.precovenda))  /'
      
        #9#9'(COALESCE(NULLIF(((ct.valorvista+coalesce(ct.desconto,0)-coale' +
        'sce(ct.frete,0)-coalesce(ct.seguro,0)) -'
      
        '                                 coalesce((select  sum(sc.quanti' +
        'dade*coalesce(sc.valorservico,0))'
      #9#9#9'from servicoscontratos sc'
      #9#9#9'where sc.contrato = ct.numero),0)),0),1))'
      #9#9')) as ValorBrutodoProduto,'
      ''
      #9#9'((coalesce(ct.desconto,0)*(pc.quantidade*pc.precovenda))  /'
      
        #9#9'(COALESCE(NULLIF(((ct.valorvista+coalesce(ct.desconto,0)-coale' +
        'sce(ct.frete,0)-coalesce(ct.seguro,0)) -'
      
        #9#9'                 coalesce((select  sum(sc.quantidade*coalesce(' +
        'sc.valorservico,0))'
      #9#9#9'from servicoscontratos sc'
      #9#9#9'where sc.contrato = ct.numero),0)),0),1))'
      #9#9') as ValorDescontodoProduto,'
      ''
      #9#9'(((ValorPrazo-ValorVista)*(pc.quantidade*pc.precovenda))  /'
      
        #9#9'(COALESCE(NULLIF(((ct.valorvista+coalesce(ct.desconto,0)-coale' +
        'sce(ct.frete,0)-coalesce(ct.seguro,0)) -'
      
        #9#9'                 coalesce((select  sum(sc.quantidade*coalesce(' +
        'sc.valorservico,0))'
      #9#9#9'from servicoscontratos sc'
      #9#9#9'where sc.contrato = ct.numero),0)),0),1))'
      #9#9') as ValorAcrescProduto'
      ''
      #9'from (select distinct ct.numero, p.datapagto'
      #9#9'from contratos ct, parcelas p'
      #9#9'where ct.numero=p.contrato and'
      #9#9'ct.situacao='#39#39'C'#39#39
      
        '    and  case when ct.os then ct.tipoequipamento in (1,2) and no' +
        't (coalesce(ct.os_garantia,false) and ct.os_garantia_status='#39#39'A'#39 +
        #39') and not coalesce(ct.os_cortesia,false) else true end'
      '    and not exists (select p2.numero'
      #9#9#9#9'from parcelas p2'
      #9#9#9#9'where p2.contrato = ct.numero and'
      #9#9#9#9#9'p2.tipopagto<>'#39#39'E'#39#39')'
      ''
      '                                  %DataPagamentoCancelamento'
      #9#9'/*p.datapagto  between(:DataInicial) and (:DataFinal)*/'
      ''
      
        '                                       and not exists (select cd' +
        '.contrato'
      
        '                                                           from ' +
        'contratosdevolvidos cd'
      
        '                                                           where' +
        ' cd.contrato = ct.numero and cd.tipo='#39#39'D'#39#39')'
      
        #9#9') as cancelados, ((contratos ct join vfornecedores vf on ct.cl' +
        'iente = vf.codigo and ct.tipocliente = vf.tipo) join'
      #9#9'                  (produtoscontratos pc join'
      
        #9#9#9#9'   (produtos p join (((caracteristicas c join classes cl on ' +
        'c.classe = cl.codigo)'
      
        ' '#9#9#9'  '#9'                                         join grupos g on' +
        ' c.grupo=g.codigo)'
      
        #9#9#9'                                                 join marcas ' +
        'm on c.marca=m.codigo)'
      
        #9#9#9#9#9'                               on p.caracteristica = c.codi' +
        'go)'
      #9#9#9#9'               on pc.produto=p.codigo)'
      #9#9#9'          on pc.contrato = ct.numero)'
      #9'where cancelados.numero = ct.numero'
      
        '  and case when ct.os then ct.tipoequipamento in (1,2) and not (' +
        'coalesce(ct.os_garantia,false) and ct.os_garantia_status='#39#39'A'#39#39') ' +
        'and not coalesce(ct.os_cortesia,false) else true end'
      '  '
      '              %FiltroCancelamentos'
      ''
      
        '        order by UPPER(TO_ASCII(vf.razao,'#39#39'LATIN1'#39#39')), ct.client' +
        'e, ct.tipocliente, mes'
      '     ) as cancelamentos'
      '     group by  nome, cliente, tipocliente, mes'
      '   )'
      '  )'
      '  '
      ' ) as temp'
      ' group by  clientetipocliente, nome, cliente, tipocliente, mes'
      ' order by 1'#39','
      ''
      #39'select distinct to_char(cast('#39#39
      ''
      '        %datainicial_1'
      '        '
      
        '        '#39#39' as date)  + s.a,'#39#39'YYYY/MM'#39#39') as mes from generate_ser' +
        'ies(1,cast('#39#39
      ''
      '            %datafinal'
      ''
      '            '#39#39' as date)-cast('#39#39
      ''
      '              %datainicial_2'
      '              '
      '             '#39#39' as date)) as s(a) order by 1'#39
      ')'
      'AS'
      ' ('
      '   clientetipocliente varchar(60),'
      '   cliente int,'
      '   tipocliente char(1),'
      '   nome varchar(60),'
      '   Total numeric(11,2),'
      ''
      '   %meses'
      '   '
      ')'
      ''
      ''
      '')
    RequestLive = False
    Left = 264
    Top = 272
  end
  object dsrVendasCliente: TtecDataSource
    DataSet = qryVendasClientes
    Left = 152
    Top = 272
  end
  object dsrVendasTotais: TtecDataSource
    DataSet = qryVendasTotais
    Left = 128
    Top = 376
  end
  object qryVendasTotais: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'meses'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select'
      '   cast(null as varchar(10)) as clientetipocliente,'
      '   cast(null as integer) as cliente,'
      '   cast(null as varchar(1)) as tipocliente,'
      '   cast(null as varchar(60)) as nome,'
      '   %meses')
    RequestLive = True
    Left = 64
    Top = 356
    object qryVendasTotaisclientetipocliente: TStringField
      FieldName = 'clientetipocliente'
      Visible = False
      Size = 60
    end
    object IntegerField1: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'cliente'
      Visible = False
    end
    object StringField2: TStringField
      DisplayLabel = 'T'
      FieldName = 'tipocliente'
      Visible = False
      Size = 1
    end
    object StringField3: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
    object qryVendasTotaisTotal: TCurrencyField
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'Total'
      DisplayFormat = '####,###,##0.00'
      Calculated = True
    end
  end
  object qryVendasTotais_aux: TtecQuery
    Tag = -1
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'meses'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select'
      '   cast(null as varchar(10)) as clientetipocliente,'
      '   cast(null as integer) as cliente,'
      '   cast(null as varchar(1)) as tipocliente,'
      '   cast(null as varchar(60)) as nome,'
      '   %meses')
    RequestLive = False
    Left = 264
    Top = 376
  end
  object qryVendasQuantidades: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'meses'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select'
      '   cast(null as varchar(70)) as produtofilial,'
      '   cast(null as bigint) as produto,'
      '   cast(null as integer) as filial,'
      '   cast(null as varchar(100)) as descricao,'
      '   cast(null as integer) as cliente,'
      '   cast(null as varchar(1)) as tipocliente,'
      '   %meses'
      '   cast(null as numeric(11,2)) as Total')
    RequestLive = True
    Left = 72
    Top = 100
    object qryVendasQuantidadesprodutofilial: TStringField
      FieldName = 'produtofilial'
      Visible = False
      Size = 70
    end
    object qryVendasQuantidadesproduto: TLargeintField
      FieldName = 'produto'
      Visible = False
    end
    object qryVendasQuantidadesprodutovisual: TStringField
      FieldName = 'produtovisual'
    end
    object qryVendasQuantidadesfilial: TIntegerField
      FieldName = 'filial'
      Visible = False
    end
    object qryVendasQuantidadesdescricao: TStringField
      DisplayWidth = 50
      FieldName = 'descricao'
      Visible = False
      Size = 100
    end
    object qryVendasQuantidadesgrupo: TStringField
      FieldName = 'grupo'
      Visible = False
      Size = 4
    end
    object qryVendasQuantidadesdescricaogrupo: TStringField
      FieldName = 'descricaogrupo'
      Visible = False
      Size = 30
    end
    object qryVendasQuantidadescliente: TIntegerField
      FieldName = 'cliente'
      Visible = False
    end
    object qryVendasQuantidadestipocliente: TStringField
      FieldName = 'tipocliente'
      Visible = False
      Size = 1
    end
    object qryVendasQuantidadestotal: TFloatField
      FieldName = 'total'
      Visible = False
      DisplayFormat = '########'
      currency = True
    end
  end
  object dsrVendasQuantidades: TtecDataSource
    DataSet = qryVendasQuantidades
    Left = 128
    Top = 112
  end
  object qryVendasQuantidades_aux: TtecQuery
    Tag = -1
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'meses'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select'
      '   cast(null as varchar(70)) as produtofilial,'
      '   cast(null as bigint) as produto,'
      '   cast(null as varchar(20)) as produtovisual,'
      '   cast(null as integer) as filial,'
      '   cast(null as varchar(100)) as descricao,'
      '   cast(null as varchar(4)) as grupo,'
      '   cast(null as varchar(30)) as descricaogrupo,'
      '   cast(null as integer) as cliente,'
      '   cast(null as varchar(1)) as tipocliente,'
      '   %meses'
      '   cast(null as numeric(11,2)) as Total')
    RequestLive = False
    Left = 232
    Top = 96
  end
  object qryProcuraFornecedores: TtecQuery
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
      'FROM fornecedores'
      'WHERE codigo = :codigo')
    RequestLive = False
    Left = 433
    Top = 275
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryProcuraFornecedorescodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object qryProcuraFornecedoresnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
  end
  object dsrProcuraFornecedores: TtecDataSource
    DataSet = qryProcuraFornecedores
    Left = 433
    Top = 323
  end
  object qryProcuraCliente: TtecQuery
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
        Name = 'JaCadastrado'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'Select coalesce(vf.razao,vf.nome) as nome,'
      '       vf.codigo,'
      '       vf.tipo,'
      '       (case when vf.tipo='#39'C'#39' then'
      '          (select cl.vendedor'
      '           from clientes cl'
      '           where cl.codigo = vf.codigo)'
      '        else'
      '          cast(0 as integer) end) as vendedor,'
      '       vf.rua,'
      '       vf.numero,'
      '       vf.complemento,'
      '       vf.bairro,'
      ''
      '      (select b.nome'
      '       from bairros b'
      '       where b.estado = vf.estado'
      '         and b.cidade = vf.cidade'
      '         and b.codigo = vf.bairro) as NomeBairro,'
      ''
      '       vf.cidade,'
      ''
      '      (select c.nome'
      '       from cidades c'
      '       where c.estado = vf.estado'
      '         and c.codigo = vf.cidade) as NomeCidade,'
      ''
      ''
      '      (select c.CodigoIBGE'
      '       from cidades c'
      '       where c.estado = vf.estado'
      '         and c.codigo = vf.cidade) as CidadeIBGE,'
      ''
      '       vf.estado,'
      '       vf.cep,'
      ''
      '       (case when vf.tipo='#39'C'#39' then'
      '          (select cl.refrua'
      '           from clientes cl'
      '           where cl.codigo = vf.codigo)'
      '        else'
      '          cast(null as varchar(100)) end) as refrua,'
      ''
      '       (case when vf.tipo='#39'C'#39' then'
      '          (select cl.refNumero'
      '           from clientes cl'
      '           where cl.codigo = vf.codigo)'
      '        else'
      '          cast(null as integer) end) as refNumero,'
      ''
      '       (case when vf.tipo='#39'C'#39' then'
      '          (select cl.refComplemento'
      '           from clientes cl'
      '           where cl.codigo = vf.codigo)'
      '        else'
      '          cast(null as varchar(60)) end) as refComplemento,'
      ''
      '       (case when vf.tipo='#39'C'#39' then'
      '          (select cl.refBairro'
      '           from clientes cl'
      '           where cl.codigo = vf.codigo)'
      '        else'
      '          cast(null as integer) end) as refBairro,'
      ''
      '       (case when vf.tipo='#39'C'#39' then'
      '          (select b.nome'
      '           from bairros b'
      '           where (b.estado,b.cidade,b.codigo) in'
      '             (select cl.refestado,'
      '                     cl.refcidade,'
      '                     cl.refBairro'
      '              from clientes cl'
      '              where cl.codigo = vf.codigo))'
      '        else'
      '          cast(null as varchar(60)) end) as refNomeBairro,'
      ''
      '       (case when vf.tipo='#39'C'#39' then'
      '          (select cl.refCidade'
      '           from clientes cl'
      '           where cl.codigo = vf.codigo)'
      '        else'
      '          cast(null as integer) end) as refCidade,'
      ''
      '       (case when vf.tipo='#39'C'#39' then'
      '          (select cl.refCep'
      '           from clientes cl'
      '           where cl.codigo = vf.codigo)'
      '        else'
      '          cast(null as integer) end) as refCep,'
      ''
      '       (case when vf.tipo='#39'C'#39' then'
      '          (select c.nome'
      '           from cidades c'
      '           where (c.estado,c.codigo) in'
      '             (select cl.refestado,'
      '                     cl.refcidade'
      '              from clientes cl'
      '              where cl.codigo = vf.codigo))'
      '        else'
      '          cast(null as varchar(60)) end) as refNomeCidade,'
      ''
      '       (case when vf.tipo='#39'C'#39' then'
      '          (select c.CodigoIBGE'
      '           from cidades c'
      '           where (c.estado,c.codigo) in'
      '             (select cl.refestado,'
      '                     cl.refcidade'
      '              from clientes cl'
      '              where cl.codigo = vf.codigo))'
      '        else'
      '          cast(null as integer) end) as refCidadeIBGE,'
      ''
      '       (case when vf.tipo='#39'C'#39' then'
      '          (select cl.refestado'
      '           from clientes cl'
      '           where cl.codigo = vf.codigo)'
      '        else'
      '          cast(null as varchar(2)) end) as refestado,'
      ''
      '       vf.pessoatipo,'
      '       vf.pessoanumero,'
      '       vf.fonenumero,'
      '       vf.foneddd,'
      ''
      '       case when vf.tipo='#39'C'#39' then'
      '          (select cl.fone2ddd'
      '           from clientes cl'
      '           where cl.codigo = vf.codigo)'
      '       else'
      '         cast(null as smallint)'
      '       end as fone2ddd,'
      ''
      '       case when vf.tipo='#39'C'#39' then'
      '          (select cl.fone2numero'
      '           from clientes cl'
      '           where cl.codigo = vf.codigo)'
      '       else'
      '         cast(null as integer)'
      '       end as fone2numero,'
      ''
      ''
      '       vf.fonenumeroempresa,'
      '       vf.fonedddempresa,'
      ''
      '       vf.foneramal,'
      '       vf.inscricaoestadual,'
      '       vf.conceito,'
      '       vf.email,'
      ''
      '       (case when vf.tipo='#39'C'#39' then'
      '          (select cl.suframa'
      '           from clientes cl'
      '           where cl.codigo = vf.codigo)'
      '        else (case when vf.tipo='#39'F'#39' then'
      '               (select f.suframa'
      '                from fornecedores f'
      '                where f.codigo = vf.codigo)'
      '              end)'
      '        end) as suframa,'
      ''
      '       (case when vf.tipo='#39'C'#39' then'
      '          (select cl.obsnotafiscal'
      '           from clientes cl'
      '           where cl.codigo = vf.codigo)'
      '        else'
      '          cast(null as varchar) end) as obsnotafiscal,'
      ''
      '       (case when vf.tipo='#39'C'#39' then'
      '          (select cl.obsipisuspenso'
      '           from clientes cl'
      '           where cl.codigo = vf.codigo)'
      '        else'
      '          cast(null as varchar) end) as obsipisuspenso,'
      ''
      '       (case when vf.tipo='#39'C'#39' then'
      '          (select cl.ipisuspenso'
      '           from clientes cl'
      '           where cl.codigo = vf.codigo)'
      '        else'
      '          false end) as ipisuspenso,'
      ''
      '       (case when vf.tipo='#39'C'#39' then'
      '                  (select cl.apelido'
      '                   from clientes cl'
      '                   where cl.codigo = vf.codigo)'
      '             else vf.nome end) as apelido,'
      ''
      '       vf.debito,'
      '       vf.credito,'
      ''
      '       (case when vf.tipo='#39'C'#39' then'
      '          (select coalesce(cl.TagAdPedNFE,false)'
      '           from clientes cl'
      '           where cl.codigo = vf.codigo)'
      '        else'
      '          false end) as TagAdPedNFE,'
      ''
      '       (case when vf.tipo='#39'C'#39' then'
      '          (select coalesce(cl.recolhericmsst,false)'
      '           from clientes cl'
      '           where cl.codigo = vf.codigo)'
      '        else'
      '          false end) as recolhericmsst,'
      ''
      '       (case when vf.tipo='#39'C'#39' then'
      
        '          (select c.descricao from cargos c where c.codigo = (se' +
        'lect cl.empcargo from clientes cl where cl.codigo = vf.codigo))'
      '        else'
      '          cast(null as varchar(30))'
      '        end) as descricaocargo,'
      ''
      '        vf.contribicms'
      ''
      'From vfornecedores vf'
      'Where vf.codigo = :codigo'
      '  and (vf.tipo = :tipocliente or :NaoConsiderarTipoCliente)'
      ''
      '  /* and (vf.tipo     <> '#39'L'#39') */'
      ''
      '  %JaCadastrado'
      'Order By UPPER(TO_ASCII(coalesce(vf.razao,vf.nome),'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 420
    Top = 171
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipocliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftBoolean
        Name = 'NaoConsiderarTipoCliente'
        ParamType = ptUnknown
        Value = 'False'
      end>
    object qryProcuraClientenome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 50
    end
    object qryProcuraClientecodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryProcuraClientetipo: TStringField
      FieldName = 'tipo'
      Size = 1
    end
    object qryProcuraClientevendedor: TIntegerField
      FieldName = 'vendedor'
      DisplayFormat = '0'
    end
    object qryProcuraClienterua: TStringField
      FieldName = 'rua'
      Size = 100
    end
    object qryProcuraClientebairro: TIntegerField
      FieldName = 'bairro'
      DisplayFormat = '0'
    end
    object qryProcuraClientenomebairro: TStringField
      DisplayWidth = 50
      FieldName = 'nomebairro'
      Size = 80
    end
    object qryProcuraClientecidade: TIntegerField
      FieldName = 'cidade'
      DisplayFormat = '0'
    end
    object qryProcuraClientecep: TIntegerField
      FieldName = 'cep'
      DisplayFormat = '0'
    end
    object qryProcuraClientenomecidade: TStringField
      DisplayWidth = 50
      FieldName = 'nomecidade'
      Size = 72
    end
    object qryProcuraClientecidadeibge: TIntegerField
      FieldName = 'cidadeibge'
      DisplayFormat = '0'
    end
    object qryProcuraClienteestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object qryProcuraClientepessoatipo: TStringField
      FieldName = 'pessoatipo'
      Size = 1
    end
    object qryProcuraClientepessoanumero: TStringField
      FieldName = 'pessoanumero'
      Size = 14
    end
    object qryProcuraClientefonenumero: TIntegerField
      FieldName = 'fonenumero'
      DisplayFormat = '0'
    end
    object qryProcuraClientefoneddd: TIntegerField
      FieldName = 'foneddd'
      DisplayFormat = '0'
    end
    object qryProcuraClienteinscricaoestadual: TStringField
      FieldName = 'inscricaoestadual'
      Size = 50
    end
    object qryProcuraClienteconceito: TIntegerField
      FieldName = 'conceito'
      DisplayFormat = '0'
    end
    object qryProcuraClienteobsnotafiscal: TStringField
      FieldName = 'obsnotafiscal'
      Size = 50
    end
    object qryProcuraClienteobsipisuspenso: TStringField
      FieldName = 'obsipisuspenso'
      Size = 50
    end
    object qryProcuraClienteipisuspenso: TBooleanField
      FieldName = 'ipisuspenso'
    end
    object qryProcuraClientenumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryProcuraClientecomplemento: TStringField
      FieldName = 'complemento'
      Size = 100
    end
    object qryProcuraClienterefrua: TStringField
      DisplayWidth = 50
      FieldName = 'refrua'
      Size = 100
    end
    object qryProcuraClienterefnumero: TIntegerField
      FieldName = 'refnumero'
      DisplayFormat = '0'
    end
    object qryProcuraClienterefcomplemento: TStringField
      FieldName = 'refcomplemento'
      Size = 50
    end
    object qryProcuraClienterefbairro: TIntegerField
      FieldName = 'refbairro'
      DisplayFormat = '0'
    end
    object qryProcuraClienterefnomebairro: TStringField
      FieldName = 'refnomebairro'
      Size = 50
    end
    object qryProcuraClienterefcidade: TIntegerField
      FieldName = 'refcidade'
      DisplayFormat = '0'
    end
    object qryProcuraClienterefcep: TIntegerField
      FieldName = 'refcep'
      DisplayFormat = '0'
    end
    object qryProcuraClienterefnomecidade: TStringField
      FieldName = 'refnomecidade'
      Size = 50
    end
    object qryProcuraClienterefcidadeibge: TIntegerField
      FieldName = 'refcidadeibge'
      DisplayFormat = '0'
    end
    object qryProcuraClienterefestado: TStringField
      FieldName = 'refestado'
      Size = 50
    end
    object qryProcuraClientesuframa: TStringField
      FieldName = 'suframa'
      Size = 50
    end
    object qryProcuraClienteemail: TStringField
      FieldName = 'email'
      Size = 50
    end
    object qryProcuraClienteapelido: TStringField
      FieldName = 'apelido'
      Size = 50
    end
    object qryProcuraClientedebito: TIntegerField
      FieldName = 'debito'
      DisplayFormat = '0'
    end
    object qryProcuraClientecredito: TIntegerField
      FieldName = 'credito'
      DisplayFormat = '0'
    end
    object qryProcuraClientetagadpednfe: TBooleanField
      FieldName = 'tagadpednfe'
    end
    object qryProcuraClienterecolhericmsst: TBooleanField
      FieldName = 'recolhericmsst'
    end
    object qryProcuraClientefoneramal: TStringField
      FieldName = 'foneramal'
      Size = 50
    end
    object qryProcuraClientedescricaocargo: TStringField
      FieldName = 'descricaocargo'
      Size = 30
    end
    object qryProcuraClientecontribicms: TBooleanField
      FieldName = 'contribicms'
    end
    object qryProcuraClientefonenumeroempresa: TIntegerField
      FieldName = 'fonenumeroempresa'
    end
    object qryProcuraClientefonedddempresa: TIntegerField
      FieldName = 'fonedddempresa'
    end
    object qryProcuraClientefone2ddd: TIntegerField
      FieldName = 'fone2ddd'
    end
    object qryProcuraClientefone2numero: TIntegerField
      FieldName = 'fone2numero'
    end
  end
  object dsrProcuraCliente: TtecDataSource
    DataSet = qryProcuraCliente
    Left = 447
    Top = 185
  end
end
