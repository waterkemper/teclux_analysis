inherited dtmRelatorioVendasporSetores: TdtmRelatorioVendasporSetores
  OldCreateOrder = False
  Left = 377
  Top = 226
  Height = 521
  Width = 848
  object qryRelatorioVendasporSetores: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnCalcFields = qryRelatorioVendasporSetoresCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'df_Condicao_filiais'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pdf_Condicao_Vendedores'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pdf_Condicao_GruposVendedores'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Condicao_Produtos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Condicao_Caracteristicas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Condicao_grupos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Condicao_classes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Condicao_marcas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaCondicionalPromocoes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Condicao_clientes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ct_Condicao_filiais'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pc_Condicao_Vendedores'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pc_Condicao_GruposVendedores'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sc_Condicao_Vendedores'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sc_Condicao_GruposVendedores'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 's_Condicao_grupos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 's_Condicao_Produtos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 's_Condicao_Caracteristicas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 's_Condicao_classes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 's_Condicao_marcas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 's_ListaCondicionalPromocoes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'np_Condicao_filiais'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pnp_Condicao_Vendedores'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pnp_Condicao_GruposVendedores'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Condicao_Listacasamento'
        ParamType = ptUnknown
        Value = 
          'left join listascasamento lc on selecao.listacasamento = lc.codi' +
          'go'
      end
      item
        DataType = ftUnknown
        Name = 'Condicao_Setores'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Condicao_Listacasamento_semlista'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ordenacao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';'
      'select selecao.*,'
      
        '       (select u.nome from usuarios u where u.codigo = selecao.v' +
        'endedor) as nomevendedor,'
      
        '       (select sv.nome from setoresvenda sv where sv.codigo = se' +
        'lecao.setorvenda) as nomesetorvenda,'
      
        '       case when :comListadeCasamento then lc.nome_noiva else ca' +
        'st(null as varchar(60)) end as nome_noiva,'
      
        '       case when :comListadeCasamento then lc.nome_noivo else ca' +
        'st(null as varchar(60)) end as nome_noivo'
      'from'
      #9#9'  '
      ' ('
      ''
      #9#9'/* VENDAS NOTAS FISCAIS */'
      #9#9
      #9#9'('
      #9#9#9' '
      #9#9#9'   select df.filialvenda,'
      
        '             (select cl.filialcadastro from clientes cl where cl' +
        '.codigo = df.cliente and df.tipocliente = '#39'C'#39') as filialcadastro' +
        ','
      #9#9#9#9#9'   ct.faturamento as faturamento,'
      #9#9#9#9#9'   f.nome as nomefilialvenda,'#9
      #9#9#9#9#9'   df.contrato,'
      #9#9#9#9#9'   ct.situacao,'
      #9#9#9#9#9'   p.codigovisual as produtovisual,'#9#9#9#9'   '
      #9#9#9#9#9'   pdf.produto,'
      #9#9#9#9#9'   pdf.filial,'
      
        #9#9#9#9#9'   cast(trim(p.descricao || '#39' '#39' || coalesce(p.valorgrade1,'#39 +
        #39')||'#39' '#39'||coalesce(p.valorgrade2,'#39#39')) as varchar(162)) as descric' +
        'aoproduto,'
      #9#9#9#9#9'   p.referencia,'
      #9#9#9#9#9'   c.marca, m.descricao as descricaomarca,'
      #9#9#9#9#9'   c.grupo, g.descricao as descricaogrupo,'
      #9#9#9#9#9'   c.classe, cl.descricao as descricaoclasse,'
      #9#9#9#9#9'   '
      #9#9#9#9#9'   cast(pdf.quantidade as numeric(9,3)) as quantidade,'
      
        '             quantidadetotaldoestoque(pdf.produto, cast(pdf.fili' +
        'al as smallint)) as quantidadetotaldoestoque,'
      
        #9#9#9#9#9'   pdf.precovenda, pdf.precotabela, pdf.acrescimo, - (coale' +
        'sce(pdf.desconto,0) + coalesce(pdf.valordescontoitem,0)) as desc' +
        'onto,'
      ''
      ''
      
        '             (coalesce(ct.creditotroca,0) * ((pdf.quantidade * p' +
        'df.precovenda)-coalesce(pdf.valordescontoitem,0)))/'
      
        '                (select sum((pc2.quantidade * pc2.precovenda) - ' +
        'pc2.valordescontoitem)'
      '                 from produtoscontratos pc2'
      
        '                 where pc2.contrato = df.contrato) as creditotro' +
        'caproduto,'
      ''
      #9#9#9#9#9'   pc.listacasamento,'
      #9#9#9#9#9'   coalesce(pdf.vendedor, df.vendedor) as vendedor,'
      ''
      ''
      
        #9#9#9#9#9'   coalesce(pc.setorvenda, (select u.setorvenda from usuari' +
        'os u where u.codigo = coalesce(pdf.vendedor, df.vendedor))) as s' +
        'etorvenda,'
      
        '             cast('#39'Vendas com contrato'#39' as varchar(50)) as ident' +
        'ificacao,'
      '             cast(null as char(1)) as identificador,'
      '             c.codigo as caracteristica,'
      '             c.descricao as descricaocaracteristica'
      ''
      ''
      ''
      #9#9#9'   from (((((dadosfiscais df'
      #9#9#9'   '
      #9#9#9#9#9#9'   join vfornecedores vf'
      #9#9#9#9#9#9'on df.cliente = vf.codigo'
      #9#9#9#9#9#9'and df.tipocliente = vf.tipo)'
      #9#9#9
      #9#9#9#9#9#9#9'    join contratos ct'
      #9#9#9#9#9#9#9#9#9' on ct.numero = df.contrato)'
      ''
      #9#9#9#9#9#9#9'   join filiais f'
      #9#9#9#9#9#9#9'   on df.filialvenda = f.codigo)'
      ''
      #9#9#9#9#9#9#9'   join ( /* ( */ produtosdadosfiscais pdf'
      ''
      ''
      
        #9#9#9#9#9#9#9#9#9'   /* join movimentos mv on pdf.dadofiscal = mv.dadofis' +
        'cal and pdf.produto=mv.produto) */'
      ''
      
        #9#9#9#9#9#9#9#9#9'   join ((produtos p left join promocoes pro on p.promo' +
        'cao = pro.codigo)'
      
        #9#9#9#9#9#9#9#9#9#9#9'  join (((caracteristicas c join classes cl on c.clas' +
        'se=cl.codigo)'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9'   join grupos g on g.codigo=c.grupo)'
      #9#9#9#9#9#9#9#9#9#9'   join marcas m on c.marca=m.codigo)'
      ''
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9'on p.caracteristica=c.codigo)'
      #9#9#9#9#9#9#9#9#9#9#9#9#9'   on pdf.produto=p.codigo)'
      #9#9#9#9#9#9#9#9#9#9#9#9#9' on df.numero = pdf.dadofiscal)'
      
        '                join produtoscontratos pc on pc.contrato = df.co' +
        'ntrato and pc.produto = pdf.produto)'
      ''
      ''
      
        '               left join (usuarios u left join GruposUsuarios gu' +
        ' on u.grupo = gu.codigo)'
      '               on coalesce(pdf.vendedor, df.vendedor) = u.codigo'
      ''
      ''
      
        '               where ct.faturamento between :datainicial and :da' +
        'tafinal'
      ''
      
        #9#9#9#9' and case when ct.os then ct.tipoequipamento in (1,2) and no' +
        't (coalesce(ct.os_garantia,false) and ct.os_garantia_status='#39'A'#39')' +
        ' and not coalesce(ct.os_cortesia,false) else true end'
      #9#9#9#9' and ct.origem is null'
      #9#9#9#9' and not coalesce(pdf.brinde,false)'
      #9#9#9#9' AND (coalesce(ct.valorvista,0)<>0)'
      #9#9#9#9' and not coalesce(df.notavinculada,false)'
      
        '         and exists (select mv.numero from movimentos mv where m' +
        'v.dadofiscal = df.numero and mv.produto = pdf.produto)'
      ''
      #9#9#9#9' %df_Condicao_filiais'
      #9#9#9#9' %pdf_Condicao_Vendedores'
      '                                 %pdf_Condicao_GruposVendedores'
      ''
      '               %Condicao_Produtos'
      '               %Condicao_Caracteristicas'
      '  '#9#9'         %Condicao_grupos'
      '                 %Condicao_classes'
      '                 %Condicao_marcas'
      '                 %ListaCondicionalPromocoes'
      ''
      #9#9#9#9' %Condicao_clientes'
      ''
      #9#9#9#9' '
      #9#9')'
      ''
      '  /* VENDAS FRENTE DE CAIXA */'
      '  union all'
      '  '
      #9'  ('
      ''
      #9#9'select df.filialvenda,'
      
        '           (select cl.filialcadastro from clientes cl where cl.c' +
        'odigo = df.cliente and df.tipocliente = '#39'C'#39') as filialcadastro,'
      #9#9'       df.data as faturamento,'
      #9#9#9'   f.nome as nomefilialvenda,'
      #9#9#9'   '
      
        #9#9#9'   case when n.numero is not null then cast(cast('#39'NF '#39' as  va' +
        'rchar)||cast(n.numero as varchar) as varchar(20)) else'
      
        #9#9#9'     cast(cast('#39'CP '#39' as  varchar)||cast(n.numero as varchar) ' +
        'as varchar(20)) end as contrato,'
      #9#9#9#9' '
      #9#9#9'  df.situacao,'
      '              p.codigovisual as produtovisual,'
      #9#9#9'  '
      #9#9#9'  pdf.produto,'
      #9#9#9'  pdf.filial,'
      
        #9#9#9'  cast(trim(p.descricao || '#39' '#39' || coalesce(p.valorgrade1,'#39#39')|' +
        '|'#39' '#39'||coalesce(p.valorgrade2,'#39#39')) as varchar(162)) as descricaop' +
        'roduto,'
      '  '#9'          p.referencia,'
      '              c.marca, m.descricao as descricaomarca,'
      #9#9#9'  c.grupo, g.descricao as descricaogrupo,'
      #9#9#9'  c.classe, cl.descricao as descricaoclasse,'#9
      ''
      #9#9#9'  cast(pdf.quantidade as numeric(9,3)) as quantidade,'
      
        '        quantidadetotaldoestoque(pdf.produto, cast(pdf.filial as' +
        ' smallint)) as quantidadetotaldoestoque,'
      
        ' '#9#9'      pdf.precovenda, pdf.precotabela, pdf.acrescimo, - (coal' +
        'esce(pdf.desconto,0) + coalesce(pdf.valordescontoitem,0)) as des' +
        'conto,'
      ''
      
        '         (coalesce(df.creditotroca,0) * ((pdf.quantidade * pdf.p' +
        'recovenda)-coalesce(pdf.valordescontoitem,0)))/'
      
        '            (select sum((pdf2.quantidade * pdf2.precovenda) - pd' +
        'f2.valordescontoitem)'
      '             from produtosdadosfiscais pdf2'
      
        '             where pdf2.dadofiscal = df.numero) as creditotrocap' +
        'roduto,'
      ''
      ''
      #9#9#9'  df.listacasamento,'
      #9#9#9'  coalesce(pdf.vendedor, df.vendedor) as vendedor,'
      
        #9#9#9'  (select u.setorvenda from usuarios u where u.codigo = coale' +
        'sce(pdf.vendedor, df.vendedor)) as setorvenda,'
      ''
      
        '        cast('#39'Vendas sem contrato'#39' as varchar(50)) as identifica' +
        'cao,'
      '        cast(null as char(1)) as identificador,'
      '        c.codigo as caracteristica,'
      '             c.descricao as descricaocaracteristica'
      #9#9'  '
      ''
      ''
      #9#9'from (((((dadosfiscais df'
      ''
      #9#9#9#9' left join vfornecedores vf'
      #9#9#9#9#9#9'on df.cliente = vf.codigo'
      #9#9#9#9#9#9'and df.tipocliente = vf.tipo)'
      #9#9#9#9#9#9
      #9#9'         left join notas n on df.numero = n.dadofiscal) '
      #9#9#9#9' left join cupons cp on df.numero = cp.dadofiscal)'
      #9#9#9#9' '
      #9#9#9'join (produtosdadosfiscais pdf'
      
        #9#9#9#9'  join ((produtos p left join promocoes pro on p.promocao = ' +
        'pro.codigo)'
      #9#9#9#9#9#9'join (((caracteristicas c'
      #9#9#9#9#9#9#9#9'join classes cl on c.classe=cl.codigo)'
      #9#9#9#9#9#9#9#9'join grupos g on c.grupo=g.codigo)'
      #9#9#9#9#9#9#9#9'join marcas m on c.marca=m.codigo)'
      ''
      #9#9#9#9#9#9'on c.codigo = p.caracteristica)'
      #9#9#9#9'  on pdf.produto = p.codigo)'
      #9#9#9'on pdf.dadofiscal = df.numero)'
      #9#9#9
      #9#9#9'join filiais f'
      '  '#9#9'    on df.filialvenda = f.codigo)'
      ''
      
        '                   left join (usuarios u left join GruposUsuario' +
        's gu on u.grupo = gu.codigo)'
      
        '                   on coalesce(pdf.vendedor, df.vendedor) = u.co' +
        'digo'
      ''
      ''
      '        where df.data between :datainicial and :datafinal'
      ''
      #9#9'and df.contrato is null'
      #9#9'AND df.situacao not in ('#39'C'#39','#39'D'#39')'
      #9#9'AND (coalesce(df.valorvista,0)<>0)'
      ''
      
        '    and (eHNotaFiscalSaidaVenda(pdf.codigofiscal) or mod(pdf.cod' +
        'igofiscal,1000) in (929))'
      '    and not coalesce(df.notavinculada,false)'
      ''
      #9#9' %df_Condicao_filiais'
      #9#9' %pdf_Condicao_Vendedores'
      '                 %pdf_Condicao_GruposVendedores'
      ''
      '         %Condicao_Produtos'
      '         %Condicao_Caracteristicas'
      ''
      '  '#9'     %Condicao_grupos'
      '         %Condicao_classes'
      '         %Condicao_marcas'
      '         %ListaCondicionalPromocoes'
      #9#9' %Condicao_clientes'
      ''
      ''
      #9'  )'
      ''
      #9#9'/*INICIO TOTAL VENDAS FATURADAS*/'
      ''
      #9#9'union all'
      ''
      #9#9'('
      
        '  '#9#9'  select filialvenda, filialcadastro, faturamento, nomefilia' +
        'lvenda, vcontrato as contrato, situacao, produtovisual,'
      
        '                 vproduto as produto, vfilial as filial, descric' +
        'aoproduto, referencia, marca, descricaomarca, grupo, descricaogr' +
        'upo,'
      
        #9#9#9#9' classe, descricaoclasse, qtFaturada as quantidade, quantida' +
        'detotaldoestoque,'
      
        #9#9#9#9' precovenda, precotabela, acrescimo, - desconto as desconto,' +
        ' ((creditotrocaproduto/quantidade) * qtFaturada) as creditotroca' +
        'produto,'
      
        '         listacasamento, vendedor, setorvenda, identificacao, ca' +
        'st(null as char(1)) as identificador ,caracteristica,descricaoca' +
        'racteristica'
      ''
      #9#9'from'
      #9#9'('
      #9#9'select produtos.*,'
      
        #9#9#9'   (produtos.quantidade - coalesce(pd.quantidade,0)) as qtfat' +
        'urada'
      #9#9'from'
      #9#9'('
      #9#9' select ct.filialvenda,'
      
        '            (select cl.filialcadastro from clientes cl where cl.' +
        'codigo = ct.cliente and ct.tipocliente = '#39'C'#39') as filialcadastro,'
      #9#9'        ct.faturamento,'
      #9#9#9#9'f.nome as nomefilialvenda,'
      #9#9'        pc.contrato as vcontrato,'
      #9#9#9#9'ct.situacao,'
      ''
      #9#9#9#9'p.codigovisual as produtovisual,'
      #9#9#9#9'pc.produto as vproduto,'
      #9#9#9#9'pc.filial as vfilial,'
      ''
      
        #9#9#9#9'cast(trim(p.descricao || '#39' '#39' || coalesce(p.valorgrade1,'#39#39')||' +
        #39' '#39'||coalesce(p.valorgrade2,'#39#39')) as varchar(162)) as descricaopr' +
        'oduto,'
      '  '#9'            p.referencia,'
      '                c.marca, m.descricao as descricaomarca,'
      #9#9#9#9'c.grupo, g.descricao as descricaogrupo,'
      #9#9#9#9'c.classe, cl.descricao as descricaoclasse,'
      ''
      #9#9#9'    cast(pc.quantidade as numeric(9,3)) as quantidade,'
      
        '        quantidadetotaldoestoque(pc.produto, cast(pc.filial as s' +
        'mallint)) as quantidadetotaldoestoque,'
      
        #9#9#9#9'pc.precovenda, pc.precotabela, pc.acrescimo, (coalesce(pc.de' +
        'sconto,0) + coalesce(pc.valordescontoitem,0)) as desconto,'
      ''
      
        '       (coalesce(ct.creditotroca,0) * ((pc.quantidade * pc.preco' +
        'venda)-coalesce(pc.valordescontoitem,0)))/'
      
        '          (select sum((pc2.quantidade * pc2.precovenda) - pc2.va' +
        'lordescontoitem)'
      '           from produtoscontratos pc2'
      
        '           where pc2.contrato = ct.numero) as creditotrocaprodut' +
        'o,'
      ''
      #9#9#9#9'pc.listacasamento,'
      #9#9#9#9'coalesce(pc.vendedor, ct.vendedor) as vendedor,'
      
        #9#9#9#9'coalesce(pc.setorvenda, (select u.setorvenda from usuarios u' +
        ' where u.codigo = coalesce(pc.vendedor, ct.vendedor))) as setorv' +
        'enda,'
      ''
      
        '        cast('#39'Vendas faturadas'#39' as varchar(50)) as identificacao' +
        ','
      '             c.codigo as caracteristica,'
      '             c.descricao as descricaocaracteristica'
      ''
      ''
      ''
      #9#9' from (((contratos ct'
      #9#9#9#9' join vfornecedores vf'
      #9#9#9#9#9#9#9#9'on ct.cliente = vf.codigo'
      #9#9#9#9#9#9#9#9'and ct.tipocliente = vf.tipo)'
      #9#9#9#9#9#9
      #9#9#9'   join (produtoscontratos pc'
      
        #9#9#9#9#9'   join ((produtos p left join promocoes pro on p.promocao ' +
        '= pro.codigo)'
      
        #9#9#9#9#9#9#9'  join (((caracteristicas c join classes cl on c.classe=c' +
        'l.codigo)'
      #9#9#9#9#9#9#9#9#9#9#9#9#9'   join grupos g on g.codigo=c.grupo)'
      '                             join marcas m on c.marca=m.codigo)'
      #9#9#9#9#9#9#9#9#9#9'on p.caracteristica=c.codigo)'
      #9#9#9#9#9#9#9#9#9'   on pc.produto=p.codigo)'
      #9#9#9#9#9#9#9#9#9'on ct.numero = pc.contrato)'
      ''
      '               join filiais f'
      '  '#9#9'       on ct.filialvenda = f.codigo)'
      ''
      
        '               left join (usuarios u left join GruposUsuarios gu' +
        ' on u.grupo = gu.codigo)'
      '               on coalesce(pc.vendedor, ct.vendedor) = u.codigo'
      ''
      #9#9'where ct.faturamento between :datainicial and :datafinal'
      ''
      
        #9#9#9' and case when ct.os then ct.tipoequipamento in (1,2) and not' +
        ' (coalesce(ct.os_garantia,false) and ct.os_garantia_status='#39'A'#39') ' +
        'and not coalesce(ct.os_cortesia,false) else true end'
      #9#9#9' and ct.origem is null'
      #9#9#9' and not coalesce(pc.brinde,false)'
      #9#9#9' AND (coalesce(ct.valorvista,0)<>0)'
      ''
      #9#9#9'   and ((ct.situacao <> '#39'N'#39') or'
      #9#9#9#9#9'(ct.situacao = '#39'N'#39' and exists (select cd.contrato'
      #9#9#9#9#9#9#9#9#9#9#9'   from contratosdevolvidos cd'
      #9#9#9#9#9#9#9#9'   where cd.contrato = ct.numero'
      #9#9#9#9#9#9#9#9' and cd.produto = pc.produto'
      #9#9#9#9#9#9#9#9' and cd.filial = pc.filial'
      #9#9#9#9#9#9#9#9' and cd.tipo in ('#39'D'#39','#39'T'#39')'
      #9#9#9#9#9#9#9#9' and cd.situacao = '#39'F'#39')))'
      '             %ct_Condicao_filiais'
      '             %pc_Condicao_Vendedores'
      '             %pc_Condicao_GruposVendedores'
      ''
      ''
      '             %Condicao_Produtos'
      '             %Condicao_Caracteristicas'
      '    '#9#9'     %Condicao_grupos'
      '             %Condicao_classes'
      '             %Condicao_marcas'
      '             %ListaCondicionalPromocoes'
      ''
      #9#9#9' %Condicao_clientes'
      ''
      ''
      ''
      #9#9'order by pc.contrato, pc.produto, pc.filial'
      
        #9#9') as produtos left join (select df.contrato, pdf.produto, pdf.' +
        'filial,'
      #9#9#9#9#9#9#9#9'  coalesce(sum(pdf.quantidade),0) as quantidade'
      #9#9#9#9#9#9#9#9'  from ((((dadosfiscais df'
      #9#9#9#9#9#9#9#9#9#9#9'join vfornecedores vf'
      #9#9#9#9#9#9#9#9#9#9#9'on df.cliente = vf.codigo'
      #9#9#9#9#9#9#9#9#9#9#9'and df.tipocliente = vf.tipo)'
      #9#9#9#9#9#9#9#9#9#9'  join contratos ct on ct.numero = df.contrato)'
      #9#9#9#9#9#9#9#9#9#9'  join ( /*(*/ produtosdadosfiscais pdf'
      
        #9#9#9#9#9#9#9#9#9#9#9#9#9'  /* join movimentos mv on pdf.dadofiscal = mv.dado' +
        'fiscal and mv.produto=pdf.produto) */'
      
        #9#9#9#9#9#9#9#9#9#9#9#9#9'  join ((produtos p left join promocoes pro on p.pr' +
        'omocao = pro.codigo)'
      
        #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9'   join (((caracteristicas c join classes cl on c' +
        '.classe=cl.codigo)'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9' join grupos g on g.codigo=c.grupo)'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9' join marcas m on c.marca = m.codigo)'
      #9#9#9#9#9#9#9#9#9#9'on p.caracteristica=c.codigo)'
      #9#9#9#9#9#9#9#9#9'   on pdf.produto=p.codigo)'
      #9#9#9#9#9#9#9#9#9' on df.numero = pdf.dadofiscal'
      
        '                                                                ' +
        '         )'
      ''
      
        '                                                                ' +
        '         left join (usuarios u left join GruposUsuarios gu on u.' +
        'grupo = gu.codigo)'
      
        '                                                                ' +
        '         on coalesce(pdf.vendedor, df.vendedor) = u.codigo), pro' +
        'dutoscontratos pc'
      ''
      ''
      
        #9#9#9#9#9#9#9#9'   where ct.faturamento between :datainicial and :datafi' +
        'nal'
      ''
      #9#9#9#9#9#9#9#9'   and ct.numero = pc.contrato'
      #9#9#9#9#9#9#9#9#9#9#9#9'   and pc.produto = pdf.produto'
      #9#9#9#9#9#9#9#9#9#9#9#9'   and pc.filial = pdf.filial'
      ''
      #9#9#9#9#9#9#9#9#9#9#9#9'   and not coalesce(df.notavinculada,false)'
      #9#9#9#9#9#9#9#9#9#9#9#9'   and NOT pc.brinde'
      #9#9#9#9#9#9#9#9#9#9#9#9'   AND (coalesce(ct.valorvista,0)<>0)'
      #9#9#9#9#9#9#9#9#9#9#9#9'   and ct.origem IS NULL'
      
        #9#9#9#9#9#9#9#9#9#9#9#9'   and case when ct.os then ct.tipoequipamento in (1' +
        ',2) and not (coalesce(ct.os_garantia,false) and ct.os_garantia_s' +
        'tatus='#39'A'#39') and not coalesce(ct.os_cortesia,false) else true end'
      
        '                           and exists (select mv.numero from mov' +
        'imentos mv where mv.dadofiscal = df.numero and mv.produto = pdf.' +
        'produto)'
      ''
      '                                   %df_Condicao_filiais'
      '                                   %pdf_Condicao_Vendedores'
      
        '                                   %pdf_Condicao_GruposVendedore' +
        's'
      ''
      '                                   %Condicao_Produtos'
      '                                   %Condicao_Caracteristicas'
      '               '#9#9#9#9#9#9#9'       %Condicao_grupos'
      '                                   %Condicao_classes'
      '                                   %Condicao_marcas'
      '                                   %ListaCondicionalPromocoes'
      ''
      #9#9#9#9#9#9#9#9'   %Condicao_clientes'
      ''
      #9#9#9#9#9#9#9#9#9#9#9#9' group by df.contrato, pdf.produto, pdf.filial'
      #9#9#9#9#9#9#9#9#9#9#9'   ) pd on produtos.vcontrato = pd.contrato'
      #9#9#9#9#9#9#9#9#9#9#9#9'   and produtos.vproduto = pd.produto'
      #9#9#9#9#9#9#9#9#9#9#9#9'   and produtos.vfilial = pd.filial'
      #9#9') as produtos'
      #9#9'where qtfaturada<>0'
      ''
      #9#9')'
      ''
      '  union all'
      ''
      '/*SERVICOS*/'
      ''
      #9'  ('
      #9'   select ct.filialvenda,'
      
        '            (select cl.filialcadastro from clientes cl where cl.' +
        'codigo = ct.cliente and ct.tipocliente = '#39'C'#39') as filialcadastro,'
      
        '            ct.faturamento, f.nome as nomefilialvenda, sc.contra' +
        'to, ct.situacao,'
      #9'          cast(sc.servico as varchar(30))  produtovisual,'#9#9'  '
      #9#9#9'  sc.servico as produto,'
      #9#9#9'  ct.filialvenda as filial,'
      #9#9#9'  s.descricao as descricaoproduto,'
      #9#9#9'  cast('#39'SERVI'#199'OS'#39' as varchar(15)) as referencia,'
      ''
      #9#9#9'  cast(0 as integer) as marca,'
      #9#9#9'  cast('#39'SERVI'#199'OS'#39' as varchar(15)) as descricaomarca,'#9#9'  '
      #9#9#9'  '
      #9#9#9'  cast('#39'SERV'#39' as char(4)) as grupo,'
      #9#9#9'  cast('#39'SERVI'#199'OS'#39' as varchar(30)) as descricaogrupo,'
      #9#9#9'  '
      #9#9#9'  cast('#39'SE'#39' as char(4)) as classe,'
      #9#9#9'  cast('#39'SERVI'#199'OS'#39' as varchar(30)) as descricaoclasse,'
      #9#9#9'  '
      #9#9#9'  cast(sc.quantidade as numeric(9,3)) as quantidade,'
      '        cast(null as numeric(11,3)) as quantidadetotaldoestoque,'
      ' '#9#9#9'  sc.valorservico as precovenda, '
      #9#9#9'  sc.valorservico as precotabela,'
      #9#9#9'  0.00 as acrescimo,'
      #9#9#9'  0.00 as desconto,'
      '        0.00 as creditotrocaproduto,'
      ''
      #9#9#9'  cast(null as integer) as listacasamento,'
      #9#9#9'  coalesce(sc.vendedor, ct.vendedor) as vendedor,'
      
        #9#9#9'  (select u.setorvenda from usuarios u where u.codigo = coale' +
        'sce(sc.vendedor, ct.vendedor)) as setorvenda,'
      
        '        cast('#39'Vendas com contrato'#39' as varchar(50)) as identifica' +
        'cao,'
      '        cast(null as char(1)) as identificador,'
      '        cast(0 as bigint) as caracteristica ,'
      '        cast('#39#39' as varchar) as descricaocaracteristica'
      ''
      ''
      #9'   from (((contratos ct'
      '              join vfornecedores vf'
      #9#9#9#9#9#9'on ct.cliente = vf.codigo'
      #9#9#9#9#9#9'and ct.tipocliente = vf.tipo)'
      #9'          join'
      
        #9#9#9' (servicoscontratos sc join servicos s on sc.servico = s.codi' +
        'go)'
      #9#9#9' on ct.numero = sc.contrato)'
      ''
      #9#9#9' join filiais f'
      '  '#9#9'     on ct.filialvenda = f.codigo)'
      ''
      
        '               left join (usuarios u left join GruposUsuarios gu' +
        ' on u.grupo = gu.codigo)'
      '               on coalesce(sc.vendedor, ct.vendedor) = u.codigo'
      ''
      ''
      #9'   where ct.faturamento between :datainicial and :datafinal'
      ''
      
        #9'   and case when ct.os then ct.tipoequipamento in (1,2) and not' +
        ' (coalesce(ct.os_garantia,false) and ct.os_garantia_status='#39'A'#39') ' +
        'and not coalesce(ct.os_cortesia,false) else true end'
      ''
      #9'   %ct_Condicao_filiais'
      #9'   %sc_Condicao_Vendedores'
      '           %sc_Condicao_GruposVendedores'
      ''
      '       %s_Condicao_grupos'
      '       %s_Condicao_Produtos'
      '       %s_Condicao_Caracteristicas'
      '       %s_Condicao_classes'
      '       %s_Condicao_marcas'
      '       %s_ListaCondicionalPromocoes'
      #9'   '
      #9'   %Condicao_clientes'
      ''
      #9'  )'
      #9'  '
      '  union all'
      ''
      '/*DEVOLU'#199#213'ES*/'
      ''
      '  ('
      #9'   ('
      ''
      #9#9'select ct.filialvenda,'
      
        '           (select cl.filialcadastro from clientes cl where cl.c' +
        'odigo = ct.cliente and ct.tipocliente = '#39'C'#39') as filialcadastro,'
      
        '       cd.devolucao as faturamento, f.nome as nomefilialvenda, c' +
        'd.contrato, ct.situacao, p.codigovisual as produtovisual,'
      ''
      #9#9#9'  cd.produto,'
      #9#9#9'  cd.filial,'
      
        #9#9#9'  cast(trim(p.descricao || '#39' '#39' || coalesce(p.valorgrade1,'#39#39')|' +
        '|'#39' '#39'||coalesce(p.valorgrade2,'#39#39')) as varchar(162)) as descricaop' +
        'roduto,'
      #9'          p.referencia,'
      '              c.marca, m.descricao as descricaomarca,'
      #9#9#9'  c.grupo, g.descricao as descricaogrupo,'
      #9#9'      c.classe, cl.descricao as descricaoclasse,'
      #9#9#9'  - cast(cd.quantidade as numeric(9,3)) as quantidade,'
      
        '        quantidadetotaldoestoque(cd.produto, cast(pc.filial as s' +
        'mallint)) as quantidadetotaldoestoque,'
      ''
      
        #9#9'      pc.precovenda, pc.precotabela, - pc.acrescimo as acresci' +
        'mo, coalesce(cd.desconto,0) + coalesce(cd.valordescontoitem,0) a' +
        's desconto,'
      '          cd.creditotroca as creditotrocaproduto,'
      ''
      '  '#9#9'      pc.listacasamento,'
      '              coalesce(pc.vendedor, ct.vendedor) as vendedor,'
      
        '              coalesce(pc.setorvenda, (select u.setorvenda from ' +
        'usuarios u where u.codigo = coalesce(pc.vendedor, ct.vendedor)))' +
        ' as setorvenda,'
      ''
      
        '        cast('#39'Devolu'#231#227'o com contrato'#39' as varchar(50)) as identif' +
        'icacao,'
      '        cast('#39'D'#39' as char(1)) as identificador,'
      '        c.codigo as caracteristica ,'
      '             c.descricao as descricaocaracteristica'
      ''
      ''
      #9#9#9'from (((contratosdevolvidos cd'
      #9#9#9'        join ((contratos ct'
      #9#9#9#9#9'      join vfornecedores vf'
      #9#9#9#9#9#9'on ct.cliente = vf.codigo'
      #9#9#9#9#9#9'and ct.tipocliente = vf.tipo)'
      ''
      #9#9#9#9#9'     join filiais f'
      '  '#9#9'                  on ct.filialvenda = f.codigo)'
      #9#9#9#9#9'on cd.contrato=ct.numero)'
      
        #9#9#9#9#9#9#9#9#9#9'  join produtoscontratos pc on cd.contrato = pc.contra' +
        'to and cd.produto=pc.produto and cd.filial = pc.filial)'
      
        #9#9#9#9#9#9#9#9'  join ((produtos p left join promocoes pro on p.promoca' +
        'o = pro.codigo)'
      
        '                        join (((caracteristicas c join classes c' +
        'l on c.classe=cl.codigo)'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9' join grupos g on c.grupo=g.codigo)'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9' join marcas m on c.marca=m.codigo)'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9' on p.caracteristica=c.codigo)'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9'  on cd.produto=p.codigo)'
      
        '                       left join (usuarios u left join GruposUsu' +
        'arios gu on u.grupo = gu.codigo)'
      
        '                       on coalesce(pc.vendedor, ct.vendedor) = u' +
        '.codigo'
      ''
      ''
      #9#9#9' where cd.devolucao between :DataInicial and :DataFinal'
      
        #9#9#9'  and case when ct.os then ct.tipoequipamento in (1,2) and no' +
        't (coalesce(ct.os_garantia,false) and ct.os_garantia_status='#39'A'#39')' +
        ' and not coalesce(ct.os_cortesia,false) else true end'
      #9#9#9'  and cd.tipo = '#39'D'#39
      #9#9#9'   %ct_Condicao_filiais'
      #9#9#9'   %pc_Condicao_Vendedores'
      '                           %pc_Condicao_GruposVendedores'
      ''
      '         %Condicao_Produtos'
      '         %Condicao_Caracteristicas'
      ''
      ' '#9#9#9'   %Condicao_grupos'
      #9#9#9'   %Condicao_classes'
      #9#9#9'   %Condicao_marcas'
      '         %ListaCondicionalPromocoes'
      ''
      #9#9#9'   %Condicao_clientes'
      ''
      #9'   )'
      ''
      '   union all'
      ''
      #9'   ('
      ''
      #9#9'select ct.filialvenda,'
      
        '           (select cl.filialcadastro from clientes cl where cl.c' +
        'odigo = ct.cliente and ct.tipocliente = '#39'C'#39') as filialcadastro,'
      
        '          cd.devolucao as faturamento, f.nome as nomefilialvenda' +
        ', cd.contrato, ct.situacao, p.codigovisual as produtovisual,'
      ''
      #9#9#9'  cd.produto,'
      #9#9#9'  cd.filial,'
      
        #9#9#9'  cast(trim(p.descricao || '#39' '#39' || coalesce(p.valorgrade1,'#39#39')|' +
        '|'#39' '#39'||coalesce(p.valorgrade2,'#39#39')) as varchar(162)) as descricaop' +
        'roduto,'
      #9'          p.referencia,'
      '              c.marca, m.descricao as descricaomarca,'
      #9#9#9'  c.grupo, g.descricao as descricaogrupo,'
      #9#9'      c.classe, cl.descricao as descricaoclasse,'
      #9#9#9'  - cast(cd.quantidade as numeric(9,3)) as quantidade,'
      
        '        quantidadetotaldoestoque(cd.produto, cast(cd.filial as s' +
        'mallint)) as quantidadetotaldoestoque,'
      
        #9#9'      pc.precovenda, pc.precotabela, - pc.acrescimo as acresci' +
        'mo,'
      ''
      
        '          coalesce(cd.desconto,0) + coalesce(cd.valordescontoite' +
        'm,0) as desconto,'
      ''
      '          cd.creditotroca as creditotrocaproduto,'
      ''
      '  '#9#9'      pc.listacasamento,'
      '              coalesce(pc.vendedor, ct.vendedor) as vendedor,'
      
        '              coalesce(pc.setorvenda, (select u.setorvenda from ' +
        'usuarios u where u.codigo = coalesce(pc.vendedor, ct.vendedor)))' +
        ' as setorvenda,'
      ''
      
        '        cast('#39'Trocas com contrato'#39' as varchar(50)) as identifica' +
        'cao,'
      '        cast('#39'T'#39' as char(1)) as identificador,'
      '        c.codigo as caracteristica ,'
      '             c.descricao as descricaocaracteristica'
      ''
      ''
      #9#9#9'from (((contratosdevolvidos cd'
      #9#9#9'        join ((contratos ct'
      #9#9#9#9#9'      join vfornecedores vf'
      #9#9#9#9#9#9'on ct.cliente = vf.codigo'
      #9#9#9#9#9#9'and ct.tipocliente = vf.tipo)'
      ''
      #9#9#9#9#9'     join filiais f'
      '  '#9#9'                  on ct.filialvenda = f.codigo)'
      #9#9#9#9#9'on cd.contrato=ct.numero)'
      
        #9#9#9#9#9#9#9#9#9#9'  join produtoscontratos pc on cd.contrato = pc.contra' +
        'to and cd.produto=pc.produto and cd.filial = pc.filial)'
      
        #9#9#9#9#9#9#9#9'  join ((produtos p left join promocoes pro on p.promoca' +
        'o = pro.codigo)'
      
        '                       join (((caracteristicas c join classes cl' +
        ' on c.classe=cl.codigo)'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9' join grupos g on c.grupo=g.codigo)'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9' join marcas m on c.marca=m.codigo)'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9' on p.caracteristica=c.codigo)'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9'  on cd.produto=p.codigo)'
      ''
      
        '                       left join (usuarios u left join GruposUsu' +
        'arios gu on u.grupo = gu.codigo)'
      
        '                       on coalesce(pc.vendedor, ct.vendedor) = u' +
        '.codigo'
      ''
      #9#9#9' where cd.devolucao between :DataInicial and :DataFinal'
      
        #9#9#9'  and case when ct.os then ct.tipoequipamento in (1,2) and no' +
        't (coalesce(ct.os_garantia,false) and ct.os_garantia_status='#39'A'#39')' +
        ' and not coalesce(ct.os_cortesia,false) else true end'
      #9#9#9'  and cd.tipo = '#39'T'#39
      #9#9#9'   %ct_Condicao_filiais'
      #9#9#9'   %pc_Condicao_Vendedores'
      '                           %pc_Condicao_GruposVendedores'
      ''
      ''
      ''
      '         %Condicao_Produtos'
      '         %Condicao_Caracteristicas'
      ' '#9#9#9'   %Condicao_grupos'
      #9#9#9'   %Condicao_classes'
      #9#9#9'   %Condicao_marcas'
      '         %ListaCondicionalPromocoes'
      ''
      #9#9#9'   %Condicao_clientes'
      ''
      #9'   )'
      ''
      '   union all'
      ''
      #9#9'('
      #9#9'   select np.filial as filialvenda,'
      
        '              (select cl.filialcadastro from clientes cl where c' +
        'l.codigo = np.fornecedor and np.tipofornecedor = '#39'C'#39') as filialc' +
        'adastro,'
      '              np.data as faturamento, f.nome as nomefilialvenda,'
      
        #9#9'          cast(cast('#39'NE '#39' as  varchar)||cast(np.numero as varc' +
        'har) as varchar(20)) as contrato,'
      #9#9#9#9'  np.situacao,'
      #9#9#9#9'  p.codigovisual as produtovisual,'
      
        #9#9#9#9'  pnp.produto, np.filial, cast(trim(p.descricao || '#39' '#39' || co' +
        'alesce(p.valorgrade1,'#39#39')||'#39' '#39'||coalesce(p.valorgrade2,'#39#39')) as va' +
        'rchar(120)) as descricaoproduto,'
      #9#9#9#9'  p.referencia,'
      #9#9#9#9'  c.marca, m.descricao as descricaomarca,'
      #9#9#9#9'  c.grupo, g.descricao as descricaogrupo,'
      #9#9#9#9'  c.classe, cl.descricao as descricaoclasse,'
      ''
      #9#9#9#9'  - cast(pnp.quantidade as numeric(9,3)) as quantidade,'
      
        '          quantidadetotaldoestoque(pnp.produto, cast(np.filial a' +
        's smallint)) as quantidadetotaldoestoque,'
      
        #9#9#9#9'  pnp.precounitario as precovenda, pnp.precounitario as prec' +
        'otabela, - pnp.acrescimo as acrescimo,'
      
        '          coalesce(pnp.desconto,0) + coalesce(pnp.valordescontoi' +
        'tem,0) as desconto,'
      '          0.00 as creditotrocaproduto,'
      #9#9#9#9'  cast(null as integer) as listacasamento,'
      '          cast(null as integer) vendedor,'
      '          cast(null as integer) as setorvenda,'
      
        '          cast('#39'Devolu'#231#227'o sem contrato'#39' as varchar(50)) as ident' +
        'ificacao,'
      '          cast('#39'D'#39' as char(1)) as identificador,'
      '          c.codigo as caracteristica ,'
      '             c.descricao as descricaocaracteristica'
      ''
      #9#9'   FROM (((notaspag np'
      '                  join vfornecedores vf'
      #9#9#9#9#9#9'on np.fornecedor = vf.codigo'
      #9#9#9#9#9#9'and np.tipofornecedor = vf.tipo)'
      ''
      #9#9'          join filiais f'
      '  '#9#9'            on np.filial = f.codigo)'
      #9#9#9'   join (produtosnotaspag pnp'
      
        #9#9#9#9'join ((produtos p left join promocoes pro on p.promocao = pr' +
        'o.codigo)'
      
        '              join (((caracteristicas c join classes cl on c.cla' +
        'sse=cl.codigo)'
      #9#9#9#9#9#9#9#9'   join grupos g on g.codigo=c.grupo)'
      #9#9#9#9#9#9#9#9'   join marcas m on c.marca=m.codigo)'
      #9#9#9#9#9#9#9'on p.caracteristica=c.codigo)'
      #9#9#9#9'on pnp.produto = p.codigo)'
      ''
      #9#9#9'   on np.codigo = pnp.codigonota)'
      ''
      
        '              left join (usuarios u left join GruposUsuarios gu ' +
        'on u.grupo = gu.codigo)'
      '              on coalesce(pnp.vendedor, np.vendedor) = u.codigo'
      ''
      '            where np.data between :DataInicial and :DataFinal'
      ''
      #9#9#9' and ehnotafiscalentradadevolucao(np.codigofiscal)'
      #9#9#9' and np.contrato is null'
      '                         and np.situacao = '#39'N'#39
      ''
      #9#9#9' %np_Condicao_filiais'
      '    '#9' %pnp_Condicao_Vendedores'
      '         %pnp_Condicao_GruposVendedores'
      ''
      '       %Condicao_Produtos'
      '       %Condicao_Caracteristicas'
      ''
      ' '#9#9'   %Condicao_grupos'
      '       %Condicao_classes'
      '       %Condicao_marcas'
      '       %ListaCondicionalPromocoes'
      ''
      #9#9#9' %Condicao_clientes'
      ''
      #9#9')'
      ''
      '   union all'
      ''
      #9'   ('
      #9#9#9'select ct.filialvenda,'
      
        '             (select cl.filialcadastro from clientes cl where cl' +
        '.codigo = ct.cliente and ct.tipocliente = '#39'C'#39') as filialcadastro' +
        ','
      
        '           cancelados.datapagto as faturamento, f.nome as nomefi' +
        'lialvenda,'
      #9#9#9'        pc.contrato, ct.situacao,'
      #9#9#9#9#9'p.codigovisual as produtovisual,'
      #9#9#9#9#9'pc.produto,'
      #9#9#9#9'    pc.filial,'
      
        #9#9#9#9'    cast(trim(p.descricao || '#39' '#39' || coalesce(p.valorgrade1,'#39 +
        #39')||'#39' '#39'||coalesce(p.valorgrade2,'#39#39')) as varchar(162)) as descric' +
        'aoproduto,'
      ''
      #9#9#9#9'    p.referencia,'
      #9#9#9#9#9'c.marca, m.descricao as descricaomarca,'
      #9#9#9#9#9'c.grupo, g.descricao as descricaogrupo,'
      #9#9#9#9#9'c.classe, cl.descricao as descricaoclasse,'
      ''
      #9#9#9#9#9'- cast(pc.quantidade as numeric(9,3)) as quantidade,'
      
        '          quantidadetotaldoestoque(pc.produto, cast(pc.filial as' +
        ' smallint)) as quantidadetotaldoestoque,'
      
        #9#9#9#9#9'pc.precovenda, pc.precotabela, - pc.acrescimo as acrescimo,' +
        ' coalesce(pc.desconto,0) + coalesce(pc.valordescontoitem,0) as d' +
        'esconto,'
      ''
      
        '         (coalesce(ct.creditotroca,0) * ((pc.quantidade * pc.pre' +
        'covenda)-coalesce(pc.valordescontoitem,0)))/'
      
        '          (select sum((pc2.quantidade * pc2.precovenda) - pc2.va' +
        'lordescontoitem)'
      '           from produtoscontratos pc2'
      
        '           where pc2.contrato = ct.numero) as creditotrocaprodut' +
        'o,'
      ''
      #9#9#9#9#9'pc.listacasamento,'
      #9#9#9#9#9'coalesce(pc.vendedor, ct.vendedor) as vendedor,'
      
        #9#9#9#9#9'coalesce(pc.setorvenda, (select u.setorvenda from usuarios ' +
        'u where u.codigo = coalesce(pc.vendedor, ct.vendedor))) as setor' +
        'venda,'
      ''
      
        '          cast('#39'Cancelamento do contrato'#39' as varchar(50)) as ide' +
        'ntificacao,'
      '          cast(null as char(1)) as identificador ,'
      '          c.codigo as caracteristica,'
      '             c.descricao as descricaocaracteristica'
      ''
      #9#9#9'from (select distinct ct.numero, p.datapagto'
      #9#9#9#9'from contratos ct'
      #9'                 join vfornecedores vf'
      #9#9#9#9#9#9'on ct.cliente = vf.codigo'
      #9#9#9#9#9#9'and ct.tipocliente = vf.tipo'
      ''
      #9#9#9#9'     join parcelas p'
      #9#9#9#9#9' on ct.numero=p.contrato'
      #9#9#9#9'where ct.situacao='#39'C'#39
      
        #9#9#9#9'and case when ct.os then ct.tipoequipamento in (1,2) and not' +
        ' (coalesce(ct.os_garantia,false) and ct.os_garantia_status='#39'A'#39') ' +
        'and not coalesce(ct.os_cortesia,false) else true end'
      #9#9#9'and not exists (select p2.numero'
      #9#9#9#9#9#9'from parcelas p2'
      #9#9#9#9#9#9'where p2.contrato = ct.numero and'
      #9#9#9#9#9#9#9'p2.tipopagto<>'#39'E'#39')'
      ''
      #9#9#9'and p.datapagto  between :DataInicial and :DataFinal'
      #9#9#9'   and not exists (select cd.contrato'
      #9#9#9#9#9#9#9'   from contratosdevolvidos cd'
      '  '#9#9#9#9#9#9'       where cd.contrato = ct.numero and cd.tipo='#39'D'#39')'
      ''
      #9#9#9#9'%ct_Condicao_filiais'
      '               %Condicao_clientes'
      ''
      ''
      #9#9#9#9') as cancelados, ((contratos ct'
      #9#9#9#9'                  join filiais f'
      '  '#9#9'                          on ct.filialvenda = f.codigo)'
      ''
      #9#9#9#9'                  join (produtoscontratos pc join'
      
        #9#9#9#9#9#9'   ((produtos p left join promocoes pro on p.promocao = pr' +
        'o.codigo)'
      
        '               join (((caracteristicas c join classes cl on c.cl' +
        'asse = cl.codigo)'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9' join grupos g on c.grupo=g.codigo)'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9' join marcas m on c.marca=m.codigo)'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9'   on p.caracteristica = c.codigo)'
      #9#9#9#9#9#9#9#9#9'   on pc.produto=p.codigo)'
      #9#9#9#9#9#9#9'  on pc.contrato = ct.numero)'
      ''
      
        '               left join (usuarios u left join GruposUsuarios gu' +
        ' on u.grupo = gu.codigo)'
      '               on coalesce(pc.vendedor, ct.vendedor) = u.codigo'
      ''
      ''
      #9#9#9'where cancelados.numero = ct.numero'
      '  '#9#9#9'  %pc_Condicao_Vendedores'
      '                          %pc_Condicao_GruposVendedores'
      ''
      '               %Condicao_Produtos'
      '               %Condicao_Caracteristicas'
      '          '
      '              %Condicao_grupos'
      '              %Condicao_classes'
      '              %Condicao_marcas'
      '              %ListaCondicionalPromocoes'
      ''
      ''
      #9'   )'
      ''
      '  )'
      ' ) as selecao'
      ''
      
        '   %Condicao_Listacasamento /* left join listascasamento lc on s' +
        'elecao.listacasamento = lc.codigo */'
      ''
      ''
      'where true'
      ''
      '   %Condicao_Setores'
      '   %Condicao_Listacasamento_semlista'
      ''
      '%ordenacao'
      ''
      ''
      '')
    RequestLive = False
    Left = 88
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'comListadeCasamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'datainicial'
        ParamType = ptUnknown
        Value = #39'2015-01-01'#39
      end
      item
        DataType = ftString
        Name = 'datafinal'
        ParamType = ptUnknown
        Value = #39'2015-01-02'#39
      end>
    object qryRelatorioVendasporSetorescontrato: TStringField
      FieldName = 'contrato'
    end
    object qryRelatorioVendasporSetoresproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryRelatorioVendasporSetoresprodutovisual: TStringField
      FieldName = 'produtovisual'
    end
    object qryRelatorioVendasporSetoresfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryRelatorioVendasporSetoresdescricaoproduto: TStringField
      DisplayWidth = 50
      FieldName = 'descricaoproduto'
      Size = 50
    end
    object qryRelatorioVendasporSetoresquantidade: TFloatField
      FieldName = 'quantidade'
      DisplayFormat = '0.00'
    end
    object qryRelatorioVendasporSetoresquantidadetotaldoestoque: TFloatField
      FieldName = 'quantidadetotaldoestoque'
      DisplayFormat = '0.00'
    end
    object qryRelatorioVendasporSetoresprecovenda: TFloatField
      FieldName = 'precovenda'
      DisplayFormat = '0.00'
    end
    object qryRelatorioVendasporSetoresacrescimo: TFloatField
      FieldName = 'acrescimo'
      DisplayFormat = '0.00'
    end
    object qryRelatorioVendasporSetoresdesconto: TFloatField
      FieldName = 'desconto'
      DisplayFormat = '0.00'
    end
    object qryRelatorioVendasporSetoreslistacasamento: TIntegerField
      FieldName = 'listacasamento'
      DisplayFormat = '0'
    end
    object qryRelatorioVendasporSetoressetorvenda: TIntegerField
      FieldName = 'setorvenda'
      DisplayFormat = '0'
    end
    object qryRelatorioVendasporSetoresnomesetorvenda: TStringField
      FieldName = 'nomesetorvenda'
      Size = 100
    end
    object qryRelatorioVendasporSetoressituacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
    object qryRelatorioVendasporSetoresTotal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryRelatorioVendasporSetoresfilialvenda: TIntegerField
      FieldName = 'filialvenda'
      DisplayFormat = '0'
    end
    object qryRelatorioVendasporSetoresnomefilialvenda: TStringField
      FieldName = 'nomefilialvenda'
      Size = 60
    end
    object qryRelatorioVendasporSetoresmarca: TIntegerField
      FieldName = 'marca'
      DisplayFormat = '0'
    end
    object qryRelatorioVendasporSetoresfilialcadastro: TIntegerField
      FieldName = 'filialcadastro'
    end
    object qryRelatorioVendasporSetoresdescricaomarca: TStringField
      FieldName = 'descricaomarca'
      Size = 15
    end
    object qryRelatorioVendasporSetoresgrupo: TStringField
      FieldName = 'grupo'
      Size = 4
    end
    object qryRelatorioVendasporSetoresdescricaogrupo: TStringField
      FieldName = 'descricaogrupo'
      Size = 30
    end
    object qryRelatorioVendasporSetoresclasse: TStringField
      FieldName = 'classe'
      Size = 2
    end
    object qryRelatorioVendasporSetoresdescricaoclasse: TStringField
      FieldName = 'descricaoclasse'
      Size = 30
    end
    object qryRelatorioVendasporSetoresnome_noiva: TStringField
      FieldName = 'nome_noiva'
      Size = 60
    end
    object qryRelatorioVendasporSetoresnome_noivo: TStringField
      FieldName = 'nome_noivo'
      Size = 60
    end
    object qryRelatorioVendasporSetoresvendedor: TIntegerField
      FieldName = 'vendedor'
      DisplayFormat = '0'
    end
    object qryRelatorioVendasporSetoresnomevendedor: TStringField
      FieldName = 'nomevendedor'
      Size = 40
    end
    object qryRelatorioVendasporSetoresprecotabela: TFloatField
      FieldName = 'precotabela'
      DisplayFormat = '0.00'
    end
    object qryRelatorioVendasporSetoresTotalPauta: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalPauta'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryRelatorioVendasporSetoresDiferenca: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Diferenca'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryRelatorioVendasporSetoresfaturamento: TDateField
      Alignment = taCenter
      FieldName = 'faturamento'
      EditMask = '99/99/9999;1; '
    end
    object qryRelatorioVendasporSetoresreferencia: TStringField
      FieldName = 'referencia'
      Size = 15
    end
    object qryRelatorioVendasporSetorescreditotrocaproduto: TFloatField
      FieldName = 'creditotrocaproduto'
      DisplayFormat = '0.00'
    end
    object qryRelatorioVendasporSetoresidentificacao: TStringField
      FieldName = 'identificacao'
      Size = 50
    end
    object qryRelatorioVendasporSetoresidentificador: TStringField
      FieldName = 'identificador'
      Size = 1
    end
    object qryRelatorioVendasporSetorescaracteristica: TLargeintField
      FieldName = 'caracteristica'
    end
    object qryRelatorioVendasporSetoresdescricaocaracteristica: TStringField
      FieldName = 'descricaocaracteristica'
      Size = 50
    end
  end
  object dsrRelatorioVendasporSetores: TtecDataSource
    DataSet = qryRelatorioVendasporSetores
    Left = 152
    Top = 112
  end
  object qryGrupos: TtecQuery
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
      'Select g.codigo, '
      '           g.descricao'
      'From   grupos g'
      'Order by g.descricao')
    RequestLive = True
    Left = 555
    Top = 80
    object qryGruposdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 40
      FieldName = 'descricao'
      Size = 30
    end
    object qryGruposcodigo: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Size = 4
    end
  end
  object qrySetoresVenda: TtecQuery
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
      'Select sv.codigo, '
      '           sv.nome'
      'From   setoresvenda sv'
      'Order by sv.codigo')
    RequestLive = True
    Left = 587
    Top = 104
    object qrySetoresVendacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qrySetoresVendanome: TStringField
      FieldName = 'nome'
      Size = 100
    end
  end
  object qryClasses: TtecQuery
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
      'Select  c.descricao,'
      '            c.codigo'
      'From    classes c'
      'Order By UPPER(TO_ASCII(c.descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 597
    Top = 56
    object qryClassesdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
    object qryClassescodigo: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Size = 2
    end
  end
  object frpRelatorioVendasporSetores_: TfrxReport
    Version = '4.0.11'
    DataSet = qryRelatorioVendasporSetores__
    DataSetName = 'qryRelatorioVendasporSetores_'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40829.408948738400000000
    ReportOptions.LastChange = 44039.602594270800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '  vZebrar : boolean;'
      ''
      'procedure mmoZebradoOnBeforePrint(Sender: TfrxComponent);'
      'begin'
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
      'end;'
      ''
      'procedure rod8OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'begin'
      '  cab1.visible := <cabvisible1>;'
      '  cab2.visible := <cabvisible2>;'
      '  cab3.visible := <cabvisible3>;'
      '  cab4.visible := <cabvisible4>;'
      '  cab5.visible := <cabvisible5>;'
      '  cab6.visible := <cabvisible6>;'
      '  cab7.visible := <cabvisible7>;'
      '  cab8.visible := <cabvisible8>;'
      '  cab9.visible := <cabvisible9>;'
      '  cab10.visible := <cabvisible10>;'
      ''
      '  rod1.visible := <rodvisible1>;'
      '  rod2.visible := <rodvisible2>;'
      '  rod3.visible := <rodvisible3>;'
      '  rod4.visible := <rodvisible4>;'
      '  rod5.visible := <rodvisible5>;'
      '  rod6.visible := <rodvisible6>;'
      '  rod7.visible := <rodvisible7>;'
      '  rod8.visible := <rodvisible8>;'
      '  rod9.visible := <rodvisible9>;'
      '  rod10.visible := <rodvisible10>;'
      ''
      '  DadosMestre.visible := not <SomenteTotalizadores>;'
      ''
      'end.')
    OnGetValue = frpRelatorioVendasporSetores_GetValue
    Left = 200
    Top = 224
    Datasets = <
      item
        DataSet = qryRelatorioVendasporSetores_
        DataSetName = 'qryRelatorioVendasporSetores_'
      end>
    Variables = <
      item
        Name = ' Totais'
        Value = Null
      end
      item
        Name = 'RAZAOFILIALBASE'
        Value = #39'PRAIANA COMERCIO DE PRODUTOS HOSPITALARES LTDA EPP'#39
      end
      item
        Name = 'ENDERECO_BAIRRO'
        Value = #39'Rua Santa Marta, 281, LOTEAMENTO JAT  - Bela Vista'#39
      end
      item
        Name = 'CEP_CIDADE_UF'
        Value = #39'88132-712  Palho'#231'a  SC'#39
      end
      item
        Name = 'Outras'
        Value = ''
      end
      item
        Name = 'Titulo'
        Value = #39'VENDAS POR SETORES'#39
      end
      item
        Name = 'ListarVendedores'
        Value = Null
      end
      item
        Name = 'SaltarPagina'
        Value = Null
      end
      item
        Name = 'mascaraquantidade'
        Value = #39'#,###,##0.00'#39
      end
      item
        Name = 'subtitulo'
        Value = Null
      end
      item
        Name = 'CordoZebrado'
        Value = 'clYellow'
      end
      item
        Name = ' Agrupamento'
        Value = Null
      end
      item
        Name = 'AgruparFilial'
        Value = Null
      end
      item
        Name = 'AgruparClasse'
        Value = Null
      end
      item
        Name = 'ag1'
        Value = '<qryRelatorioVendasporSetores_."produto">'
      end
      item
        Name = 'ag2'
        Value = Null
      end
      item
        Name = 'ag3'
        Value = Null
      end
      item
        Name = 'labelag1'
        Value = Null
      end
      item
        Name = 'labelag2'
        Value = Null
      end
      item
        Name = 'labelag3'
        Value = Null
      end
      item
        Name = 'ag4'
        Value = Null
      end
      item
        Name = 'ag5'
        Value = Null
      end
      item
        Name = 'ag6'
        Value = Null
      end
      item
        Name = 'ag7'
        Value = Null
      end
      item
        Name = 'labelag4'
        Value = Null
      end
      item
        Name = 'labelag5'
        Value = Null
      end
      item
        Name = 'labelag6'
        Value = Null
      end
      item
        Name = 'labelag7'
        Value = Null
      end
      item
        Name = 'auxag1'
        Value = Null
      end
      item
        Name = 'Variable1'
        Value = Null
      end
      item
        Name = 'auxag2'
        Value = Null
      end
      item
        Name = 'auxag3'
        Value = Null
      end
      item
        Name = 'auxag4'
        Value = Null
      end
      item
        Name = 'auxag5'
        Value = Null
      end
      item
        Name = 'auxag6'
        Value = Null
      end
      item
        Name = 'auxag7'
        Value = Null
      end
      item
        Name = ' Auxiliaires'
        Value = Null
      end
      item
        Name = 'Linha'
        Value = Null
      end
      item
        Name = 'cabvisible1'
        Value = Null
      end
      item
        Name = 'cabvisible2'
        Value = Null
      end
      item
        Name = 'cabvisible3'
        Value = Null
      end
      item
        Name = 'cabvisible4'
        Value = Null
      end
      item
        Name = 'cabvisible5'
        Value = Null
      end
      item
        Name = 'cabvisible6'
        Value = Null
      end
      item
        Name = 'cabvisible7'
        Value = Null
      end
      item
        Name = 'rodvisible1'
        Value = Null
      end
      item
        Name = 'rodvisible2'
        Value = Null
      end
      item
        Name = 'rodvisible3'
        Value = Null
      end
      item
        Name = 'rodvisible4'
        Value = Null
      end
      item
        Name = 'rodvisible5'
        Value = Null
      end
      item
        Name = 'rodvisible6'
        Value = Null
      end
      item
        Name = 'rodvisible7'
        Value = Null
      end
      item
        Name = 'SomenteTotalizadores'
        Value = 'False'
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 5.000000000000000000
      TopMargin = 6.000000000000000000
      BottomMargin = 5.000000000000000000
      OnBeforePrint = 'Page1OnBeforePrint'
      object PageHeader1: TfrxPageHeader
        Height = 85.747990000000000000
        Top = 18.897650000000000000
        Width = 1103.622760000000000000
        object fpvLogo: TfrxPictureView
          Left = 8.000000000000000000
          Top = 10.102350000000000000
          Width = 115.000000000000000000
          Height = 39.000000000000000000
          Frame.Width = 0.500000000000000000
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
        object Memo9: TfrxMemoView
          Left = 625.858380000000000000
          Top = 56.763760000000000000
          Width = 43.000000000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'QTDADE')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 606.858380000000000000
          Top = 56.763760000000000000
          Width = 19.000000000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'FIL.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 453.267780000000000000
          Top = 56.763760000000000000
          Width = 57.000000000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'CONTRATO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 585.858380000000000000
          Top = 56.763760000000000000
          Width = 21.000000000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'SIT.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 668.858380000000000000
          Top = 56.763760000000000000
          Width = 55.881880000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'PRE'#195#8225'O'
            'VENDA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 880.637910000000000000
          Top = 56.763760000000000000
          Width = 66.220470000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'TOTAL VENDA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 5.779530000000000000
          Top = 56.763760000000000000
          Width = 89.000000000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'PRODUTO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 93.779530000000000000
          Top = 56.763760000000000000
          Width = 291.456710000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'DESCRI'#195#8225#195#402'O')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 723.740260000000000000
          Top = 56.763760000000000000
          Width = 55.881880000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'PRE'#195#8225'O'
            'PAUTA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 779.622140000000000000
          Top = 56.763760000000000000
          Width = 51.881880000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'JUROS/'
            'DESC.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 946.858380000000000000
          Top = 56.763760000000000000
          Width = 63.000000000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'TOTAL PAUTA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          Left = 1009.858380000000000000
          Top = 56.763760000000000000
          Width = 91.220470000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'DIFEREN'#195#8225'A'
            '%             R$')
          ParentFont = False
          VAlign = vaCenter
        end
        object fmvRua: TfrxMemoView
          Left = 128.504020000000000000
          Top = 11.338590000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[RAZAOFILIALBASE]')
          ParentFont = False
        end
        object fmvBairro: TfrxMemoView
          Left = 128.504020000000000000
          Top = 22.677180000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[ENDERECO_BAIRRO]')
          ParentFont = False
        end
        object fmvCidade: TfrxMemoView
          Left = 128.504020000000000000
          Top = 34.015770000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[CEP_CIDADE_UF]')
          ParentFont = False
        end
        object Memo236: TfrxMemoView
          Left = 1039.370750000000000000
          Top = 34.015770000000000000
          Width = 56.692950000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Page#]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo237: TfrxMemoView
          Left = 1001.575450000000000000
          Top = 34.015770000000000000
          Width = 34.015770000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'P'#195#129'G.:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo238: TfrxMemoView
          Left = 1001.575450000000000000
          Top = 18.897650000000000000
          Width = 34.015770000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'DATA:')
          ParentFont = False
        end
        object Memo239: TfrxMemoView
          Left = 1039.370750000000000000
          Top = 18.897650000000000000
          Width = 56.692950000000000000
          Height = 11.338582680000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[Date]')
          ParentFont = False
          VAlign = vaCenter
        end
        object mmoTitulo: TfrxMemoView
          ShiftMode = smDontShift
          Left = 415.748300000000000000
          Top = 7.559060000000000000
          Width = 377.953000000000000000
          Height = 22.677180000000000000
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
        end
        object Memo240: TfrxMemoView
          Left = 415.748300000000000000
          Top = 34.015770000000000000
          Width = 377.953000000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[Outras]')
          ParentFont = False
        end
        object Memo119: TfrxMemoView
          Left = 529.134200000000000000
          Top = 56.692950000000000000
          Width = 57.000000000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'DATA FAT.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo121: TfrxMemoView
          Left = 385.512060000000000000
          Top = 56.692950000000000000
          Width = 68.464440000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'REFER'#195#352'NCIA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo123: TfrxMemoView
          Left = 831.496600000000000000
          Top = 56.692950000000000000
          Width = 51.881880000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'CRED.'
            'TROCA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo213: TfrxMemoView
          Left = 510.236550000000000000
          Top = 56.692950000000000000
          Width = 19.000000000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'FC')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object fbvRodape: TfrxPageFooter
        Height = 16.000000000000000000
        Top = 1353.071740000000000000
        Width = 1103.622760000000000000
        object fmvHora: TfrxMemoView
          Left = 14.338590000000000000
          Top = 1.479900000000000000
          Width = 240.000000000000000000
          Height = 10.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          HideZeros = True
          Memo.UTF8 = (
            '[TIME #Thh:mm:ss]')
          ParentFont = False
          VAlign = vaCenter
        end
        object fmvDesenvolvedor: TfrxMemoView
          Left = 854.267780000000000000
          Top = 1.479900000000000000
          Width = 221.354360000000000000
          Height = 10.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            'tecSOFT - Tecnologia em Sistemas')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object DadosMestre: TfrxMasterData
        Height = 15.118110240000000000
        Top = 616.063390000000000000
        Width = 1103.622760000000000000
        OnBeforePrint = 'DadosMestreOnBeforePrint'
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = qryRelatorioVendasporSetores_
        DataSetName = 'qryRelatorioVendasporSetores_'
        RowCount = 0
        Stretched = True
        object mmoZebrado: TfrxMemoView
          Align = baClient
          Width = 1103.622760000000000000
          Height = 15.118110240000000000
          OnBeforePrint = 'mmoZebradoOnBeforePrint'
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
        object Memo1: TfrxMemoView
          Left = 4.070810000000000000
          Width = 86.929190000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[qryRelatorioVendasporSetores_."produtovisual"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 82.440940000000000000
          Width = 309.921460000000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataField = 'descricaoproduto'
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[qryRelatorioVendasporSetores_."descricaoproduto"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 457.354360000000000000
          Width = 56.692950000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[qryRelatorioVendasporSetores_."contrato"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 584.181200000000000000
          Width = 22.677180000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[IIF(((<qryRelatorioVendasporSetores_."identificador">='#39'T'#39') or (' +
              '<qryRelatorioVendasporSetores_."identificador">='#39'D'#39')),<qryRelato' +
              'rioVendasporSetores_."identificador">,<qryRelatorioVendasporSeto' +
              'res_."situacao">)]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 606.960730000000000000
          Width = 18.897650000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[qryRelatorioVendasporSetores_."filial"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 612.165430000000000000
          Width = 56.692950000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,<qryRelatorioVendasporSetores_.' +
              '"quantidade">)]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 700.252010000000000000
          Width = 79.370130000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[qryRelatorioVendasporSetores_."precotabela"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 645.370130000000000000
          Width = 79.370130000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',<qryRelatorioVendasporSetores_."precov' +
              'enda">)]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 752.133890000000000000
          Width = 79.370130000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF((<qryRelatorioVendasporSetores_."desconto"><>0) or (<qryRel' +
              'atorioVendasporSetores_."acrescimo"><>0),<qryRelatorioVendasporS' +
              'etores_."desconto">+<qryRelatorioVendasporSetores_."acrescimo">,' +
              #39#39')]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 867.488250000000000000
          Width = 79.370130000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[qryRelatorioVendasporSetores_."Total"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 930.488250000000000000
          Width = 79.370130000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[qryRelatorioVendasporSetores_."TotalPauta"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 1044.385900000000000000
          Width = 56.692950000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF(<qryRelatorioVendasporSetores_."Diferenca"><>0,formatfloat(' +
              #39'###,##0.00'#39',<qryRelatorioVendasporSetores_."Diferenca">),'#39#39')]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 1009.858380000000000000
          Width = 45.354360000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              '[iif(<qryRelatorioVendasporSetores_."Diferenca"><>0, formatfloat' +
              '('#39'##0.00%'#39',((1-(<qryRelatorioVendasporSetores_."Total">/<qryRela' +
              'torioVendasporSetores_."TotalPauta">))*100.00)), '#39#39')]')
          ParentFont = False
        end
        object Memo120: TfrxMemoView
          Left = 529.441250000000000000
          Width = 56.692950000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[qryRelatorioVendasporSetores_."faturamento"]')
          ParentFont = False
        end
        object Memo122: TfrxMemoView
          Left = 389.724490000000000000
          Width = 64.252010000000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[qryRelatorioVendasporSetores_."referencia"]')
          ParentFont = False
        end
        object Memo124: TfrxMemoView
          Left = 804.008350000000000000
          Width = 79.370130000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[qryRelatorioVendasporSetores_."creditotrocaproduto"]')
          ParentFont = False
        end
        object Memo221: TfrxMemoView
          Left = 510.236550000000000000
          Width = 18.897650000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[qryRelatorioVendasporSetores_."filialcadastro"]')
          ParentFont = False
        end
      end
      object TfrxFooter
        Height = 37.118120000000000000
        Top = 1254.803960000000000000
        Width = 1103.622760000000000000
        object Memo25: TfrxMemoView
          Left = 438.645950000000000000
          Top = 2.897340000000000000
          Width = 175.370130000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HideZeros = True
          Memo.UTF8 = (
            'TOTAL GERAL COM AS TROCAS')
          ParentFont = False
        end
        object Memo69: TfrxMemoView
          Left = 882.858380000000000000
          Top = 2.897340000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'tal">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo72: TfrxMemoView
          Left = 616.196970000000000000
          Top = 2.897340000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,sum(<qryRelatorioVendasporSetor' +
              'es_."quantidade">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo73: TfrxMemoView
          Left = 763.504020000000000000
          Top = 2.897340000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."de' +
              'sconto">+<qryRelatorioVendasporSetores_."acrescimo">,DadosMestre' +
              ',1))]')
          ParentFont = False
        end
        object Memo92: TfrxMemoView
          Left = 949.858380000000000000
          Top = 2.897340000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'talpauta">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo93: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 2.897340000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."di' +
              'ferenca">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 664.740260000000000000
          Top = 2.897340000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precovenda">,DadosMes' +
              'tre))]')
          ParentFont = False
        end
        object Memo104: TfrxMemoView
          Left = 719.622140000000000000
          Top = 2.897340000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precotabela">,DadosMe' +
              'stre))]')
          ParentFont = False
        end
        object Memo113: TfrxMemoView
          Left = 998.519826610000000000
          Top = 2.897340000000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(<qryRelatorioVendasporSetores_.' +
              '"totalpauta">,DadosMestre,1)<>0) and (sum(<qryRelatorioVendaspor' +
              'Setores_."total">,DadosMestre,1)<>0),(1-(sum(<qryRelatorioVendas' +
              'porSetores_."totalpauta">,DadosMestre,1)/sum(<qryRelatorioVendas' +
              'porSetores_."total">,DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo132: TfrxMemoView
          Left = 815.378480000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo210: TfrxMemoView
          Left = 438.645950000000000000
          Top = 18.897650000000000000
          Width = 173.858306770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'TOTAL GERAL SEM AS TROCAS')
          ParentFont = False
        end
        object Memo212: TfrxMemoView
          Left = 882.637910000000000000
          Top = 18.897650000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."total">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo214: TfrxMemoView
          Left = 763.283550000000000000
          Top = 18.897650000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."desconto">+<qryRelatorioVendasporSetores_."acrescimo">' +
              '),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo215: TfrxMemoView
          Left = 949.637910000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."totalpauta">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo216: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."diferenca">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo217: TfrxMemoView
          Left = 664.740260000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precovend' +
              'a">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo218: TfrxMemoView
          Left = 719.401670000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precotabe' +
              'la">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo219: TfrxMemoView
          Left = 998.519826610000000000
          Top = 18.897650000000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(IIF(<qryRelatorioVendasporSetor' +
              'es_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendas' +
              'porSetores_."diferenca">), DadosMestre,1)>0) and (sum(IIF(<qryRe' +
              'latorioVendasporSetores_."identificacao">='#39'Trocas com contrato'#39',' +
              '0,<qryRelatorioVendasporSetores_."total">), DadosMestre,1)>0), (' +
              '1-(sum(IIF(<qryRelatorioVendasporSetores_."identificacao">='#39'Troc' +
              'as com contrato'#39',0,<qryRelatorioVendasporSetores_."diferenca">),' +
              'DadosMestre) / sum(IIF(<qryRelatorioVendasporSetores_."identific' +
              'acao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendasporSetores_."t' +
              'otal">),DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo220: TfrxMemoView
          Left = 815.158010000000000000
          Top = 18.897650000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo147: TfrxMemoView
          Left = 616.196970000000000000
          Top = 18.897650000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,SUM(IIF(<qryRelatorioVendasporS' +
              'etores_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVe' +
              'ndasporSetores_."quantidade">),DadosMestre,1))]')
          ParentFont = False
        end
        object Line8: TfrxLineView
          Align = baBottom
          Left = 7.559060000000000000
          Top = 37.118120000000000000
          Width = 1560.945890000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
      end
      object cab1: TfrxGroupHeader
        Height = 22.000000000000000000
        Top = 166.299320000000000000
        Width = 1103.622760000000000000
        Condition = '<ag1>'
        object Memo33: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 1096.063626770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag1] [VarToStr(<ag1>) + IIF(<auxag1>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag1>)]')
          ParentFont = False
        end
      end
      object rod1: TfrxGroupFooter
        Height = 37.118120000000000000
        Top = 1194.331480000000000000
        Width = 1103.622760000000000000
        object Memo64: TfrxMemoView
          Left = 7.559055118110236000
          Top = 3.779530000000000000
          Width = 480.756030000000000000
          Height = 14.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HideZeros = True
          Memo.UTF8 = (
            
              '[labelag1] [VarToStr(<ag1>) + IIF(<auxag1>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag1>)]')
          ParentFont = False
          WordWrap = False
        end
        object Memo11: TfrxMemoView
          Left = 882.858380000000000000
          Top = 3.779530000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'tal">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 616.196970000000000000
          Top = 3.779530000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,sum(<qryRelatorioVendasporSetor' +
              'es_."quantidade">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 763.504020000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."de' +
              'sconto">+<qryRelatorioVendasporSetores_."acrescimo">,DadosMestre' +
              ',1))]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 949.858380000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'talpauta">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."di' +
              'ferenca">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 664.740260000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precovenda">,DadosMes' +
              'tre))]')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 719.622140000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precotabela">,DadosMe' +
              'stre))]')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 998.519826610000000000
          Top = 3.779530000000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(<qryRelatorioVendasporSetores_.' +
              '"totalpauta">,DadosMestre,1)<>0) and (sum(<qryRelatorioVendaspor' +
              'Setores_."total">,DadosMestre,1)<>0),(1-(sum(<qryRelatorioVendas' +
              'porSetores_."totalpauta">,DadosMestre,1)/sum(<qryRelatorioVendas' +
              'porSetores_."total">,DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo131: TfrxMemoView
          Left = 815.378480000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo200: TfrxMemoView
          Left = 7.559060000000000000
          Top = 18.897650000000000000
          Width = 480.756030000000000000
          Height = 14.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HideZeros = True
          Memo.UTF8 = (
            
              '[labelag1] [VarToStr(<ag1>) + IIF(<auxag1>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag1>)]')
          ParentFont = False
          WordWrap = False
        end
        object Memo135: TfrxMemoView
          Left = 882.504330000000000000
          Top = 18.897650000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."total">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo136: TfrxMemoView
          Left = 763.149970000000000000
          Top = 18.897650000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."desconto">+<qryRelatorioVendasporSetores_."acrescimo">' +
              '),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo137: TfrxMemoView
          Left = 949.504330000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."totalpauta">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo138: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."diferenca">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo139: TfrxMemoView
          Left = 664.740260000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precovend' +
              'a">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo140: TfrxMemoView
          Left = 719.268090000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precotabe' +
              'la">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo141: TfrxMemoView
          Left = 998.519826610000000000
          Top = 18.897650000000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(IIF(<qryRelatorioVendasporSetor' +
              'es_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendas' +
              'porSetores_."diferenca">), DadosMestre,1)>0) and (sum(IIF(<qryRe' +
              'latorioVendasporSetores_."identificacao">='#39'Trocas com contrato'#39',' +
              '0,<qryRelatorioVendasporSetores_."total">), DadosMestre,1)>0), (' +
              '1-(sum(IIF(<qryRelatorioVendasporSetores_."identificacao">='#39'Troc' +
              'as com contrato'#39',0,<qryRelatorioVendasporSetores_."diferenca">),' +
              'DadosMestre) / sum(IIF(<qryRelatorioVendasporSetores_."identific' +
              'acao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendasporSetores_."t' +
              'otal">),DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo142: TfrxMemoView
          Left = 815.024430000000000000
          Top = 18.897650000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo143: TfrxMemoView
          Left = 616.196970000000000000
          Top = 18.897650000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,SUM(IIF(<qryRelatorioVendasporS' +
              'etores_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVe' +
              'ndasporSetores_."quantidade">),DadosMestre,1))]')
          ParentFont = False
        end
        object Line7: TfrxLineView
          Align = baBottom
          Left = 7.559060000000000000
          Top = 37.118120000000000000
          Width = 1096.063700000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
        object Memo60: TfrxMemoView
          Left = 491.338900000000000000
          Top = 3.779530000000000000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL COM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          Left = 491.338900000000000000
          Top = 18.897650000000000000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL SEM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object cab2: TfrxGroupHeader
        Height = 22.000000000000000000
        Top = 211.653680000000000000
        Width = 1103.622760000000000000
        Condition = '<ag2>'
        object Memo41: TfrxMemoView
          Left = 15.118110240000000000
          Top = 3.779530000000000000
          Width = 1084.725036770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag2] [VarToStr(<ag2>) + IIF(<auxag2>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag2>)]')
          ParentFont = False
        end
      end
      object cab3: TfrxGroupHeader
        Height = 22.000000000000000000
        Top = 257.008040000000000000
        Width = 1103.622760000000000000
        Condition = '<ag3>'
        object Memo50: TfrxMemoView
          Left = 22.677165350000000000
          Top = 3.779530000000000000
          Width = 1073.386446770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag3] [VarToStr(<ag3>) + IIF(<auxag3>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag3>)]')
          ParentFont = False
        end
      end
      object rod2: TfrxGroupFooter
        Height = 37.118120000000000000
        Top = 1133.859000000000000000
        Width = 1103.622760000000000000
        object Memo49: TfrxMemoView
          Left = 15.118110240000000000
          Top = 3.779530000000000000
          Width = 473.196970000000000000
          Height = 14.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HideZeros = True
          Memo.UTF8 = (
            
              '[labelag2] [VarToStr(<ag2>) + IIF(<auxag2>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag2>)]')
          ParentFont = False
          WordWrap = False
        end
        object Memo110: TfrxMemoView
          Left = 882.858380000000000000
          Top = 3.779530000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'tal">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo111: TfrxMemoView
          Left = 616.196970000000000000
          Top = 3.779530000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,sum(<qryRelatorioVendasporSetor' +
              'es_."quantidade">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo112: TfrxMemoView
          Left = 763.504020000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."de' +
              'sconto">+<qryRelatorioVendasporSetores_."acrescimo">,DadosMestre' +
              ',1))]')
          ParentFont = False
        end
        object Memo114: TfrxMemoView
          Left = 949.858380000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'talpauta">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo115: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."di' +
              'ferenca">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo116: TfrxMemoView
          Left = 664.740260000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precovenda">,DadosMes' +
              'tre))]')
          ParentFont = False
        end
        object Memo117: TfrxMemoView
          Left = 719.622140000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precotabela">,DadosMe' +
              'stre))]')
          ParentFont = False
        end
        object Memo118: TfrxMemoView
          Left = 998.519826610000000000
          Top = 3.779530000000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(<qryRelatorioVendasporSetores_.' +
              '"totalpauta">,DadosMestre,1)<>0) and (sum(<qryRelatorioVendaspor' +
              'Setores_."total">,DadosMestre,1)<>0),(1-(sum(<qryRelatorioVendas' +
              'porSetores_."totalpauta">,DadosMestre,1)/sum(<qryRelatorioVendas' +
              'porSetores_."total">,DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo130: TfrxMemoView
          Left = 815.378480000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo189: TfrxMemoView
          Left = 15.118110240000000000
          Top = 18.897650000000000000
          Width = 473.196970000000000000
          Height = 14.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HideZeros = True
          Memo.UTF8 = (
            
              '[labelag2] [VarToStr(<ag2>) + IIF(<auxag2>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag2>)]')
          ParentFont = False
          WordWrap = False
        end
        object Memo146: TfrxMemoView
          Left = 882.504330000000000000
          Top = 18.897650000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."total">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo148: TfrxMemoView
          Left = 763.149970000000000000
          Top = 18.897650000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."desconto">+<qryRelatorioVendasporSetores_."acrescimo">' +
              '),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo149: TfrxMemoView
          Left = 949.504330000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."totalpauta">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo150: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."diferenca">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo151: TfrxMemoView
          Left = 664.740260000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precovend' +
              'a">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo152: TfrxMemoView
          Left = 719.268090000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precotabe' +
              'la">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo153: TfrxMemoView
          Left = 998.519826610000000000
          Top = 18.897650000000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(IIF(<qryRelatorioVendasporSetor' +
              'es_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendas' +
              'porSetores_."diferenca">), DadosMestre,1)>0) and (sum(IIF(<qryRe' +
              'latorioVendasporSetores_."identificacao">='#39'Trocas com contrato'#39',' +
              '0,<qryRelatorioVendasporSetores_."total">), DadosMestre,1)>0), (' +
              '1-(sum(IIF(<qryRelatorioVendasporSetores_."identificacao">='#39'Troc' +
              'as com contrato'#39',0,<qryRelatorioVendasporSetores_."diferenca">),' +
              'DadosMestre) / sum(IIF(<qryRelatorioVendasporSetores_."identific' +
              'acao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendasporSetores_."t' +
              'otal">),DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo154: TfrxMemoView
          Left = 815.024430000000000000
          Top = 18.897650000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo157: TfrxMemoView
          Left = 616.196970000000000000
          Top = 18.897650000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,SUM(IIF(<qryRelatorioVendasporS' +
              'etores_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVe' +
              'ndasporSetores_."quantidade">),DadosMestre,1))]')
          ParentFont = False
        end
        object Line6: TfrxLineView
          Align = baBottom
          Left = 18.897650000000000000
          Top = 37.118120000000000000
          Width = 1084.725110000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
        object Memo58: TfrxMemoView
          Left = 491.338900000000000000
          Top = 3.779530000000000000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL COM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          Left = 491.338900000000000000
          Top = 18.897650000000000000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL SEM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object rod3: TfrxGroupFooter
        Height = 37.118120000000000000
        Top = 1073.386520000000000000
        Width = 1103.622760000000000000
        object Memo45: TfrxMemoView
          Left = 22.677165350000000000
          Top = 3.779530000000000000
          Width = 461.858380000000000000
          Height = 14.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HideZeros = True
          Memo.UTF8 = (
            
              '[labelag3] [VarToStr(<ag3>) + IIF(<auxag3>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag3>)]')
          ParentFont = False
          WordWrap = False
        end
        object Memo101: TfrxMemoView
          Left = 882.858380000000000000
          Top = 3.779530000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'tal">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo102: TfrxMemoView
          Left = 616.196970000000000000
          Top = 3.779530000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,sum(<qryRelatorioVendasporSetor' +
              'es_."quantidade">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo103: TfrxMemoView
          Left = 763.504020000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."de' +
              'sconto">+<qryRelatorioVendasporSetores_."acrescimo">,DadosMestre' +
              ',1))]')
          ParentFont = False
        end
        object Memo105: TfrxMemoView
          Left = 949.858380000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'talpauta">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo106: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."di' +
              'ferenca">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo107: TfrxMemoView
          Left = 664.740260000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precovenda">,DadosMes' +
              'tre))]')
          ParentFont = False
        end
        object Memo108: TfrxMemoView
          Left = 719.622140000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precotabela">,DadosMe' +
              'stre))]')
          ParentFont = False
        end
        object Memo109: TfrxMemoView
          Left = 998.519826610000000000
          Top = 3.779530000000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(<qryRelatorioVendasporSetores_.' +
              '"totalpauta">,DadosMestre,1)<>0) and (sum(<qryRelatorioVendaspor' +
              'Setores_."total">,DadosMestre,1)<>0),(1-(sum(<qryRelatorioVendas' +
              'porSetores_."totalpauta">,DadosMestre,1)/sum(<qryRelatorioVendas' +
              'porSetores_."total">,DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo129: TfrxMemoView
          Left = 815.378480000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo178: TfrxMemoView
          Left = 22.677165350000000000
          Top = 18.897650000000000000
          Width = 461.858380000000000000
          Height = 14.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HideZeros = True
          Memo.UTF8 = (
            
              '[labelag3] [VarToStr(<ag3>) + IIF(<auxag3>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag3>)]')
          ParentFont = False
          WordWrap = False
        end
        object Memo158: TfrxMemoView
          Left = 882.504330000000000000
          Top = 18.897650000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."total">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo159: TfrxMemoView
          Left = 763.149970000000000000
          Top = 18.897650000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."desconto">+<qryRelatorioVendasporSetores_."acrescimo">' +
              '),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo160: TfrxMemoView
          Left = 949.504330000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."totalpauta">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo161: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."diferenca">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo162: TfrxMemoView
          Left = 664.740260000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precovend' +
              'a">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo163: TfrxMemoView
          Left = 719.268090000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precotabe' +
              'la">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo164: TfrxMemoView
          Left = 998.519826610000000000
          Top = 18.897650000000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(IIF(<qryRelatorioVendasporSetor' +
              'es_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendas' +
              'porSetores_."diferenca">), DadosMestre,1)>0) and (sum(IIF(<qryRe' +
              'latorioVendasporSetores_."identificacao">='#39'Trocas com contrato'#39',' +
              '0,<qryRelatorioVendasporSetores_."total">), DadosMestre,1)>0), (' +
              '1-(sum(IIF(<qryRelatorioVendasporSetores_."identificacao">='#39'Troc' +
              'as com contrato'#39',0,<qryRelatorioVendasporSetores_."diferenca">),' +
              'DadosMestre) / sum(IIF(<qryRelatorioVendasporSetores_."identific' +
              'acao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendasporSetores_."t' +
              'otal">),DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo165: TfrxMemoView
          Left = 815.024430000000000000
          Top = 18.897650000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo168: TfrxMemoView
          Left = 616.196970000000000000
          Top = 18.897650000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,SUM(IIF(<qryRelatorioVendasporS' +
              'etores_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVe' +
              'ndasporSetores_."quantidade">),DadosMestre,1))]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Align = baBottom
          Left = 30.236240000000000000
          Top = 37.118120000000000000
          Width = 1073.386520000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
        object Memo56: TfrxMemoView
          Left = 491.338900000000000000
          Top = 3.779530000000000000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL COM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo57: TfrxMemoView
          Left = 491.338900000000000000
          Top = 18.897650000000000000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL SEM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object cab4: TfrxGroupHeader
        Height = 22.000000000000000000
        Top = 302.362400000000000000
        Width = 1103.622760000000000000
        Condition = '<ag4>'
        object Memo51: TfrxMemoView
          Left = 30.236220470000000000
          Top = 3.779530000000000000
          Width = 1065.827386770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag4] [VarToStr(<ag4>) + IIF(<auxag4>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag4>)]')
          ParentFont = False
        end
      end
      object cab5: TfrxGroupHeader
        Height = 20.944650000000000000
        Top = 347.716760000000000000
        Width = 1103.622760000000000000
        Condition = '<ag5>'
        object Memo52: TfrxMemoView
          Left = 37.795275590000000000
          Width = 1058.268326770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag5] [VarToStr(<ag5>) + IIF(<auxag5>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag5>)]')
          ParentFont = False
        end
      end
      object cab6: TfrxGroupHeader
        Height = 22.692640000000000000
        Top = 393.071120000000000000
        Width = 1103.622760000000000000
        Condition = '<ag6>'
        object Memo53: TfrxMemoView
          Left = 45.354330710000000000
          Top = 3.779530000000000000
          Width = 1050.709266770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag6] [VarToStr(<ag6>) + IIF(<auxag6>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag6>)]')
          ParentFont = False
        end
      end
      object cab7: TfrxGroupHeader
        Height = 16.897340000000000000
        Top = 438.425480000000000000
        Width = 1103.622760000000000000
        Condition = '<ag7>'
        object Memo54: TfrxMemoView
          Left = 52.913385830000000000
          Width = 1043.150206770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag7] [VarToStr(<ag7>) + IIF(<auxag7>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag7>)]')
          ParentFont = False
        end
      end
      object rod4: TfrxGroupFooter
        Height = 33.338590000000000000
        Top = 1016.693570000000000000
        Width = 1103.622760000000000000
        object Memo42: TfrxMemoView
          Left = 30.236220470000000000
          Width = 458.078850000000000000
          Height = 14.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HideZeros = True
          Memo.UTF8 = (
            
              '[labelag4] [VarToStr(<ag4>) + IIF(<auxag4>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag4>)]')
          ParentFont = False
          WordWrap = False
        end
        object Memo91: TfrxMemoView
          Left = 882.858380000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'tal">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo94: TfrxMemoView
          Left = 616.196970000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,sum(<qryRelatorioVendasporSetor' +
              'es_."quantidade">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo95: TfrxMemoView
          Left = 763.504020000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."de' +
              'sconto">+<qryRelatorioVendasporSetores_."acrescimo">,DadosMestre' +
              ',1))]')
          ParentFont = False
        end
        object Memo96: TfrxMemoView
          Left = 949.858380000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'talpauta">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo97: TfrxMemoView
          Left = 1041.078850000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."di' +
              'ferenca">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo98: TfrxMemoView
          Left = 664.740260000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precovenda">,DadosMes' +
              'tre))]')
          ParentFont = False
        end
        object Memo99: TfrxMemoView
          Left = 719.622140000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precotabela">,DadosMe' +
              'stre))]')
          ParentFont = False
        end
        object Memo100: TfrxMemoView
          Left = 998.519826610000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(<qryRelatorioVendasporSetores_.' +
              '"totalpauta">,DadosMestre,1)<>0) and (sum(<qryRelatorioVendaspor' +
              'Setores_."total">,DadosMestre,1)<>0),(1-(sum(<qryRelatorioVendas' +
              'porSetores_."totalpauta">,DadosMestre,1)/sum(<qryRelatorioVendas' +
              'porSetores_."total">,DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo128: TfrxMemoView
          Left = 815.378480000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo167: TfrxMemoView
          Left = 30.236220470000000000
          Top = 15.118120000000000000
          Width = 458.078850000000000000
          Height = 14.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HideZeros = True
          Memo.UTF8 = (
            
              '[labelag4] [VarToStr(<ag4>) + IIF(<auxag4>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag4>)]')
          ParentFont = False
          WordWrap = False
        end
        object Memo202: TfrxMemoView
          Left = 882.504330000000000000
          Top = 15.118120000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."total">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo203: TfrxMemoView
          Left = 763.149970000000000000
          Top = 15.118120000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."desconto">+<qryRelatorioVendasporSetores_."acrescimo">' +
              '),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo204: TfrxMemoView
          Left = 949.504330000000000000
          Top = 15.118120000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."totalpauta">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo205: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 15.118120000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."diferenca">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo206: TfrxMemoView
          Left = 664.740260000000000000
          Top = 15.118120000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precovend' +
              'a">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo207: TfrxMemoView
          Left = 719.268090000000000000
          Top = 15.118120000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precotabe' +
              'la">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo208: TfrxMemoView
          Left = 998.519826610000000000
          Top = 15.118120000000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(IIF(<qryRelatorioVendasporSetor' +
              'es_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendas' +
              'porSetores_."diferenca">), DadosMestre,1)>0) and (sum(IIF(<qryRe' +
              'latorioVendasporSetores_."identificacao">='#39'Trocas com contrato'#39',' +
              '0,<qryRelatorioVendasporSetores_."total">), DadosMestre,1)>0), (' +
              '1-(sum(IIF(<qryRelatorioVendasporSetores_."identificacao">='#39'Troc' +
              'as com contrato'#39',0,<qryRelatorioVendasporSetores_."diferenca">),' +
              'DadosMestre) / sum(IIF(<qryRelatorioVendasporSetores_."identific' +
              'acao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendasporSetores_."t' +
              'otal">),DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo209: TfrxMemoView
          Left = 815.024430000000000000
          Top = 15.118120000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo211: TfrxMemoView
          Left = 616.196970000000000000
          Top = 15.118120000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,SUM(IIF(<qryRelatorioVendasporS' +
              'etores_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVe' +
              'ndasporSetores_."quantidade">),DadosMestre,1))]')
          ParentFont = False
        end
        object Line4: TfrxLineView
          Align = baBottom
          Left = 45.354360000000000000
          Top = 33.338590000000000000
          Width = 1058.268400000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
        object Memo44: TfrxMemoView
          Left = 491.338900000000000000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL COM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 491.338900000000000000
          Top = 15.118120000000000000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL SEM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object rod5: TfrxGroupFooter
        Height = 37.118120000000000000
        Top = 956.221090000000000000
        Width = 1103.622760000000000000
        object Memo40: TfrxMemoView
          Left = 37.795275590000000000
          Top = 3.779530000000000000
          Width = 450.519790000000000000
          Height = 14.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HideZeros = True
          Memo.UTF8 = (
            
              '[labelag5] [VarToStr(<ag5>) + IIF(<auxag5>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag5>)]')
          ParentFont = False
          WordWrap = False
        end
        object Memo83: TfrxMemoView
          Left = 882.858380000000000000
          Top = 3.779530000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'tal">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo84: TfrxMemoView
          Left = 616.196970000000000000
          Top = 3.779530000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,sum(<qryRelatorioVendasporSetor' +
              'es_."quantidade">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo85: TfrxMemoView
          Left = 763.504020000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."de' +
              'sconto">+<qryRelatorioVendasporSetores_."acrescimo">,DadosMestre' +
              ',1))]')
          ParentFont = False
        end
        object Memo86: TfrxMemoView
          Left = 949.858380000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'talpauta">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo87: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."di' +
              'ferenca">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo88: TfrxMemoView
          Left = 664.740260000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precovenda">,DadosMes' +
              'tre))]')
          ParentFont = False
        end
        object Memo89: TfrxMemoView
          Left = 719.622140000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precotabela">,DadosMe' +
              'stre))]')
          ParentFont = False
        end
        object Memo90: TfrxMemoView
          Left = 998.519826610000000000
          Top = 3.779530000000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(<qryRelatorioVendasporSetores_.' +
              '"totalpauta">,DadosMestre,1)<>0) and (sum(<qryRelatorioVendaspor' +
              'Setores_."total">,DadosMestre,1)<>0),(1-(sum(<qryRelatorioVendas' +
              'porSetores_."totalpauta">,DadosMestre,1)/sum(<qryRelatorioVendas' +
              'porSetores_."total">,DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo127: TfrxMemoView
          Left = 815.378480000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo169: TfrxMemoView
          Left = 882.504330000000000000
          Top = 18.897650000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."total">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo170: TfrxMemoView
          Left = 763.149970000000000000
          Top = 18.897650000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."desconto">+<qryRelatorioVendasporSetores_."acrescimo">' +
              '),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo171: TfrxMemoView
          Left = 949.504330000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."totalpauta">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo172: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."diferenca">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo173: TfrxMemoView
          Left = 664.740260000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precovend' +
              'a">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo174: TfrxMemoView
          Left = 719.268090000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precotabe' +
              'la">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo175: TfrxMemoView
          Left = 998.519826610000000000
          Top = 18.897650000000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(IIF(<qryRelatorioVendasporSetor' +
              'es_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendas' +
              'porSetores_."diferenca">), DadosMestre,1)>0) and (sum(IIF(<qryRe' +
              'latorioVendasporSetores_."identificacao">='#39'Trocas com contrato'#39',' +
              '0,<qryRelatorioVendasporSetores_."total">), DadosMestre,1)>0), (' +
              '1-(sum(IIF(<qryRelatorioVendasporSetores_."identificacao">='#39'Troc' +
              'as com contrato'#39',0,<qryRelatorioVendasporSetores_."diferenca">),' +
              'DadosMestre) / sum(IIF(<qryRelatorioVendasporSetores_."identific' +
              'acao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendasporSetores_."t' +
              'otal">),DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo176: TfrxMemoView
          Left = 815.024430000000000000
          Top = 18.897650000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo179: TfrxMemoView
          Left = 616.196970000000000000
          Top = 18.897650000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,SUM(IIF(<qryRelatorioVendasporS' +
              'etores_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVe' +
              'ndasporSetores_."quantidade">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo156: TfrxMemoView
          Left = 37.795275590000000000
          Top = 18.897650000000000000
          Width = 450.519790000000000000
          Height = 14.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HideZeros = True
          Memo.UTF8 = (
            
              '[labelag5] [VarToStr(<ag5>) + IIF(<auxag5>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag5>)]')
          ParentFont = False
          WordWrap = False
        end
        object Line3: TfrxLineView
          Align = baBottom
          Left = 56.692950000000000000
          Top = 37.118120000000000000
          Width = 1046.929810000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
        object Memo12: TfrxMemoView
          Left = 491.338900000000000000
          Top = 3.779530000000000000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL COM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 491.338900000000000000
          Top = 18.897650000000000000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL SEM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object rod6: TfrxGroupFooter
        Height = 37.039370080000000000
        Top = 895.748610000000000000
        Width = 1103.622760000000000000
        object Memo76: TfrxMemoView
          Left = 491.559370000000000000
          Top = 3.779530000000000000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL COM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo78: TfrxMemoView
          Left = 45.354330710000000000
          Top = 3.779530000000000000
          Width = 442.960730000000000000
          Height = 14.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HideZeros = True
          Memo.UTF8 = (
            
              '[labelag6] [VarToStr(<ag6>) + IIF(<auxag6>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag6>)]')
          ParentFont = False
          WordWrap = False
        end
        object Memo65: TfrxMemoView
          Left = 882.858380000000000000
          Top = 3.779530000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'tal">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo66: TfrxMemoView
          Left = 616.196970000000000000
          Top = 3.779530000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,sum(<qryRelatorioVendasporSetor' +
              'es_."quantidade">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          Left = 763.504020000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."de' +
              'sconto">+<qryRelatorioVendasporSetores_."acrescimo">,DadosMestre' +
              ',1))]')
          ParentFont = False
        end
        object Memo74: TfrxMemoView
          Left = 949.858380000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'talpauta">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo79: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."di' +
              'ferenca">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo80: TfrxMemoView
          Left = 664.740260000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precovenda">,DadosMes' +
              'tre))]')
          ParentFont = False
        end
        object Memo81: TfrxMemoView
          Left = 719.622140000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precotabela">,DadosMe' +
              'stre))]')
          ParentFont = False
        end
        object Memo82: TfrxMemoView
          Left = 998.519826610000000000
          Top = 3.779530000000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(<qryRelatorioVendasporSetores_.' +
              '"totalpauta">,DadosMestre,1)<>0) and (sum(<qryRelatorioVendaspor' +
              'Setores_."total">,DadosMestre,1)<>0),(1-(sum(<qryRelatorioVendas' +
              'porSetores_."totalpauta">,DadosMestre,1)/sum(<qryRelatorioVendas' +
              'porSetores_."total">,DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo126: TfrxMemoView
          Left = 815.378480000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo144: TfrxMemoView
          Left = 491.559370000000000000
          Top = 18.897650000000000000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL SEM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo145: TfrxMemoView
          Left = 45.354330710000000000
          Top = 18.897650000000000000
          Width = 442.960730000000000000
          Height = 14.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HideZeros = True
          Memo.UTF8 = (
            
              '[labelag6] [VarToStr(<ag6>) + IIF(<auxag6>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag6>)]')
          ParentFont = False
          WordWrap = False
        end
        object Memo180: TfrxMemoView
          Left = 882.504330000000000000
          Top = 18.897650000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."total">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo181: TfrxMemoView
          Left = 763.149970000000000000
          Top = 18.897650000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."desconto">+<qryRelatorioVendasporSetores_."acrescimo">' +
              '),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo182: TfrxMemoView
          Left = 949.504330000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."totalpauta">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo183: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."diferenca">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo184: TfrxMemoView
          Left = 664.740260000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precovend' +
              'a">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo185: TfrxMemoView
          Left = 719.268090000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precotabe' +
              'la">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo186: TfrxMemoView
          Left = 998.519826610000000000
          Top = 18.897650000000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(IIF(<qryRelatorioVendasporSetor' +
              'es_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendas' +
              'porSetores_."diferenca">), DadosMestre,1)>0) and (sum(IIF(<qryRe' +
              'latorioVendasporSetores_."identificacao">='#39'Trocas com contrato'#39',' +
              '0,<qryRelatorioVendasporSetores_."total">), DadosMestre,1)>0), (' +
              '1-(sum(IIF(<qryRelatorioVendasporSetores_."identificacao">='#39'Troc' +
              'as com contrato'#39',0,<qryRelatorioVendasporSetores_."diferenca">),' +
              'DadosMestre) / sum(IIF(<qryRelatorioVendasporSetores_."identific' +
              'acao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendasporSetores_."t' +
              'otal">),DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo187: TfrxMemoView
          Left = 815.024430000000000000
          Top = 18.897650000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo190: TfrxMemoView
          Left = 616.196970000000000000
          Top = 18.897650000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,SUM(IIF(<qryRelatorioVendasporS' +
              'etores_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVe' +
              'ndasporSetores_."quantidade">),DadosMestre,1))]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Align = baBottom
          Left = 71.811070000000000000
          Top = 37.039370080000000000
          Width = 1031.811690000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
      end
      object rod7: TfrxGroupFooter
        Height = 37.039370080000000000
        Top = 835.276130000000000000
        Width = 1103.622760000000000000
        object Memo68: TfrxMemoView
          Left = 491.559370000000000000
          Top = 3.779530000000000000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL COM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo77: TfrxMemoView
          Left = 52.913385830000000000
          Top = 3.779530000000000000
          Width = 435.401670000000000000
          Height = 14.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HideZeros = True
          Memo.UTF8 = (
            
              '[labelag7] [VarToStr(<ag7>) + IIF(<auxag7>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag7>)]')
          ParentFont = False
          WordWrap = False
        end
        object Memo37: TfrxMemoView
          Left = 882.858380000000000000
          Top = 3.779530000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'tal">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 616.196970000000000000
          Top = 3.779530000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,sum(<qryRelatorioVendasporSetor' +
              'es_."quantidade">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 763.504020000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."de' +
              'sconto">+<qryRelatorioVendasporSetores_."acrescimo">,DadosMestre' +
              ',1))]')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 949.858380000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'talpauta">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."di' +
              'ferenca">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 664.740260000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precovenda">,DadosMes' +
              'tre))]')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 719.622140000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precotabela">,DadosMe' +
              'stre))]')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          Left = 998.519826610000000000
          Top = 3.779530000000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(<qryRelatorioVendasporSetores_.' +
              '"totalpauta">,DadosMestre,1)<>0) and (sum(<qryRelatorioVendaspor' +
              'Setores_."total">,DadosMestre,1)<>0),(1-(sum(<qryRelatorioVendas' +
              'porSetores_."totalpauta">,DadosMestre,1)/sum(<qryRelatorioVendas' +
              'porSetores_."total">,DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo125: TfrxMemoView
          Left = 815.378480000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo133: TfrxMemoView
          Left = 491.559370000000000000
          Top = 18.897650000000000000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL SEM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo134: TfrxMemoView
          Left = 52.913385830000000000
          Top = 18.897650000000000000
          Width = 435.401670000000000000
          Height = 14.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HideZeros = True
          Memo.UTF8 = (
            
              '[labelag7] [VarToStr(<ag7>) + IIF(<auxag7>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag7>)]')
          ParentFont = False
          WordWrap = False
        end
        object Memo191: TfrxMemoView
          Left = 882.504330000000000000
          Top = 18.897650000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."total">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo192: TfrxMemoView
          Left = 763.149970000000000000
          Top = 18.897650000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."desconto">+<qryRelatorioVendasporSetores_."acrescimo">' +
              '),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo193: TfrxMemoView
          Left = 949.504330000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."totalpauta">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo194: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."diferenca">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo195: TfrxMemoView
          Left = 664.740260000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precovend' +
              'a">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo196: TfrxMemoView
          Left = 719.268090000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precotabe' +
              'la">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo197: TfrxMemoView
          Left = 998.519826610000000000
          Top = 18.897650000000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(IIF(<qryRelatorioVendasporSetor' +
              'es_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendas' +
              'porSetores_."diferenca">), DadosMestre,1)>0) and (sum(IIF(<qryRe' +
              'latorioVendasporSetores_."identificacao">='#39'Trocas com contrato'#39',' +
              '0,<qryRelatorioVendasporSetores_."total">), DadosMestre,1)>0), (' +
              '1-(sum(IIF(<qryRelatorioVendasporSetores_."identificacao">='#39'Troc' +
              'as com contrato'#39',0,<qryRelatorioVendasporSetores_."diferenca">),' +
              'DadosMestre) / sum(IIF(<qryRelatorioVendasporSetores_."identific' +
              'acao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendasporSetores_."t' +
              'otal">),DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo198: TfrxMemoView
          Left = 815.024430000000000000
          Top = 18.897650000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo201: TfrxMemoView
          Left = 616.196970000000000000
          Top = 18.897650000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,SUM(IIF(<qryRelatorioVendasporS' +
              'etores_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVe' +
              'ndasporSetores_."quantidade">),DadosMestre,1))]')
          ParentFont = False
        end
        object Line5: TfrxLineView
          Align = baBottom
          Left = 83.149660000000000000
          Top = 37.039370080000000000
          Width = 1016.693570000000000000
          Frame.Width = 0.100000000000000000
          Diagonal = True
        end
      end
      object cab8: TfrxGroupHeader
        Height = 22.000000000000000000
        Top = 480.000310000000000000
        Width = 1103.622760000000000000
        Condition = '<ag8>'
        object Memo222: TfrxMemoView
          Left = 60.472440940000000000
          Top = 3.779530000000000000
          Width = 1035.591146770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag8] [VarToStr(<ag8>) + IIF(<auxag8>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag8>)]')
          ParentFont = False
        end
      end
      object rod8: TfrxGroupFooter
        Height = 37.039370080000000000
        Top = 774.803650000000000000
        Width = 1103.622760000000000000
        object Memo251: TfrxMemoView
          Left = 60.472440940000000000
          Top = 3.779530000000000000
          Width = 427.086816770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag8] [VarToStr(<ag8>) + IIF(<auxag8>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag8>)]')
          ParentFont = False
        end
        object Memo224: TfrxMemoView
          Left = 491.559370000000000000
          Top = 3.779530000000000000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL COM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo226: TfrxMemoView
          Left = 882.858380000000000000
          Top = 3.779530000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'tal">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo227: TfrxMemoView
          Left = 616.196970000000000000
          Top = 3.779530000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,sum(<qryRelatorioVendasporSetor' +
              'es_."quantidade">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo228: TfrxMemoView
          Left = 763.504020000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."de' +
              'sconto">+<qryRelatorioVendasporSetores_."acrescimo">,DadosMestre' +
              ',1))]')
          ParentFont = False
        end
        object Memo229: TfrxMemoView
          Left = 949.858380000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'talpauta">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo230: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."di' +
              'ferenca">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo231: TfrxMemoView
          Left = 664.740260000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precovenda">,DadosMes' +
              'tre,1))]')
          ParentFont = False
        end
        object Memo232: TfrxMemoView
          Left = 719.622140000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precotabela">,DadosMe' +
              'stre))]')
          ParentFont = False
        end
        object Memo233: TfrxMemoView
          Left = 998.519826610000000000
          Top = 3.779530000000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(<qryRelatorioVendasporSetores_.' +
              '"totalpauta">,DadosMestre,1)<>0) and (sum(<qryRelatorioVendaspor' +
              'Setores_."total">,DadosMestre,1)<>0),(1-(sum(<qryRelatorioVendas' +
              'porSetores_."totalpauta">,DadosMestre,1)/sum(<qryRelatorioVendas' +
              'porSetores_."total">,DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo234: TfrxMemoView
          Left = 815.378480000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo235: TfrxMemoView
          Left = 491.559370000000000000
          Top = 18.897650000000000000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL SEM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo242: TfrxMemoView
          Left = 882.504330000000000000
          Top = 18.897650000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."total">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo243: TfrxMemoView
          Left = 763.149970000000000000
          Top = 18.897650000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."desconto">+<qryRelatorioVendasporSetores_."acrescimo">' +
              '),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo244: TfrxMemoView
          Left = 949.504330000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."totalpauta">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo245: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."diferenca">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo246: TfrxMemoView
          Left = 664.740260000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precovend' +
              'a">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo247: TfrxMemoView
          Left = 719.268090000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precotabe' +
              'la">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo248: TfrxMemoView
          Left = 998.519826610000000000
          Top = 18.897650000000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(IIF(<qryRelatorioVendasporSetor' +
              'es_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendas' +
              'porSetores_."diferenca">), DadosMestre,1)>0) and (sum(IIF(<qryRe' +
              'latorioVendasporSetores_."identificacao">='#39'Trocas com contrato'#39',' +
              '0,<qryRelatorioVendasporSetores_."total">), DadosMestre,1)>0), (' +
              '1-(sum(IIF(<qryRelatorioVendasporSetores_."identificacao">='#39'Troc' +
              'as com contrato'#39',0,<qryRelatorioVendasporSetores_."diferenca">),' +
              'DadosMestre) / sum(IIF(<qryRelatorioVendasporSetores_."identific' +
              'acao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendasporSetores_."t' +
              'otal">),DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo249: TfrxMemoView
          Left = 815.024430000000000000
          Top = 18.897650000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo250: TfrxMemoView
          Left = 616.196970000000000000
          Top = 18.897650000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,SUM(IIF(<qryRelatorioVendasporS' +
              'etores_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVe' +
              'ndasporSetores_."quantidade">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo252: TfrxMemoView
          Left = 60.472440940000000000
          Top = 18.897650000000000000
          Width = 427.086816770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag8] [VarToStr(<ag8>) + IIF(<auxag8>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag8>)]')
          ParentFont = False
        end
        object Line9: TfrxLineView
          Align = baBottom
          Left = 94.488250000000000000
          Top = 37.039370080000000000
          Width = 1005.354980000000000000
          Diagonal = True
        end
      end
      object cab9: TfrxGroupHeader
        Height = 22.000000000000000000
        Top = 525.354670000000000000
        Width = 1103.622760000000000000
        Condition = '<ag8>'
        object Memo63: TfrxMemoView
          Left = 68.031496060000000000
          Top = 3.779530000000000000
          Width = 1028.032086770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag9] [VarToStr(<ag9>) + IIF(<auxag9>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag9>)]')
          ParentFont = False
        end
      end
      object cab10: TfrxGroupHeader
        Height = 22.000000000000000000
        Top = 570.709030000000000000
        Width = 1103.622760000000000000
        Condition = '<ag8>'
        object Memo70: TfrxMemoView
          Left = 75.590551180000000000
          Top = 3.779530000000000000
          Width = 1020.473026770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag10] [VarToStr(<ag10>) + IIF(<auxag10>=null,'#39#39','#39' - '#39') + V' +
              'arToStr(<auxag10>)]')
          ParentFont = False
        end
      end
      object rod10: TfrxGroupFooter
        Height = 37.039370078740160000
        Top = 653.858690000000000000
        Width = 1103.622760000000000000
        object Memo155: TfrxMemoView
          Left = 75.590600000000000000
          Top = 3.779530000000000000
          Width = 411.968696770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag10] [VarToStr(<ag10>) + IIF(<auxag10>=null,'#39#39','#39' - '#39') + V' +
              'arToStr(<auxag10>)]')
          ParentFont = False
        end
        object Memo166: TfrxMemoView
          Left = 491.559370000000000000
          Top = 3.779530000000000000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL COM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo177: TfrxMemoView
          Left = 882.858380000000000000
          Top = 3.779530000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'tal">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo188: TfrxMemoView
          Left = 616.196970000000000000
          Top = 3.779530000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,sum(<qryRelatorioVendasporSetor' +
              'es_."quantidade">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo199: TfrxMemoView
          Left = 763.504020000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."de' +
              'sconto">+<qryRelatorioVendasporSetores_."acrescimo">,DadosMestre' +
              ',1))]')
          ParentFont = False
        end
        object Memo223: TfrxMemoView
          Left = 949.858380000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'talpauta">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo225: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."di' +
              'ferenca">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo241: TfrxMemoView
          Left = 664.740260000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precovenda">,DadosMes' +
              'tre,1))]')
          ParentFont = False
        end
        object Memo253: TfrxMemoView
          Left = 719.622140000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precotabela">,DadosMe' +
              'stre))]')
          ParentFont = False
        end
        object Memo254: TfrxMemoView
          Left = 998.519826610000000000
          Top = 3.779530000000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(<qryRelatorioVendasporSetores_.' +
              '"totalpauta">,DadosMestre,1)<>0) and (sum(<qryRelatorioVendaspor' +
              'Setores_."total">,DadosMestre,1)<>0),(1-(sum(<qryRelatorioVendas' +
              'porSetores_."totalpauta">,DadosMestre,1)/sum(<qryRelatorioVendas' +
              'porSetores_."total">,DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo255: TfrxMemoView
          Left = 815.378480000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo256: TfrxMemoView
          Left = 491.559370000000000000
          Top = 18.897650000000000000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL SEM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo257: TfrxMemoView
          Left = 882.504330000000000000
          Top = 18.897650000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."total">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo258: TfrxMemoView
          Left = 763.149970000000000000
          Top = 18.897650000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."desconto">+<qryRelatorioVendasporSetores_."acrescimo">' +
              '),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo259: TfrxMemoView
          Left = 949.504330000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."totalpauta">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo260: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."diferenca">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo261: TfrxMemoView
          Left = 664.740260000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precovend' +
              'a">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo262: TfrxMemoView
          Left = 719.268090000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precotabe' +
              'la">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo263: TfrxMemoView
          Left = 998.519826610000000000
          Top = 18.897650000000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(IIF(<qryRelatorioVendasporSetor' +
              'es_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendas' +
              'porSetores_."diferenca">), DadosMestre,1)>0) and (sum(IIF(<qryRe' +
              'latorioVendasporSetores_."identificacao">='#39'Trocas com contrato'#39',' +
              '0,<qryRelatorioVendasporSetores_."total">), DadosMestre,1)>0), (' +
              '1-(sum(IIF(<qryRelatorioVendasporSetores_."identificacao">='#39'Troc' +
              'as com contrato'#39',0,<qryRelatorioVendasporSetores_."diferenca">),' +
              'DadosMestre) / sum(IIF(<qryRelatorioVendasporSetores_."identific' +
              'acao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendasporSetores_."t' +
              'otal">),DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo264: TfrxMemoView
          Left = 815.024430000000000000
          Top = 18.897650000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo265: TfrxMemoView
          Left = 616.196970000000000000
          Top = 18.897650000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,SUM(IIF(<qryRelatorioVendasporS' +
              'etores_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVe' +
              'ndasporSetores_."quantidade">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo266: TfrxMemoView
          Left = 75.590600000000000000
          Top = 18.897650000000000000
          Width = 411.968696770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag10] [VarToStr(<ag10>) + IIF(<auxag10>=null,'#39#39','#39' - '#39') + V' +
              'arToStr(<auxag10>)]')
          ParentFont = False
        end
      end
      object rod9: TfrxGroupFooter
        Height = 37.039370080000000000
        Top = 714.331170000000000000
        Width = 1103.622760000000000000
        object Memo267: TfrxMemoView
          Left = 68.031540000000000000
          Top = 3.779530000000000000
          Width = 419.527756770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag9] [VarToStr(<ag9>) + IIF(<auxag9>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag9>)]')
          ParentFont = False
        end
        object Memo268: TfrxMemoView
          Left = 491.559370000000000000
          Top = 3.779530000000000000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL COM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo269: TfrxMemoView
          Left = 882.858380000000000000
          Top = 3.779530000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'tal">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo270: TfrxMemoView
          Left = 616.196970000000000000
          Top = 3.779530000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,sum(<qryRelatorioVendasporSetor' +
              'es_."quantidade">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo271: TfrxMemoView
          Left = 763.504020000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."de' +
              'sconto">+<qryRelatorioVendasporSetores_."acrescimo">,DadosMestre' +
              ',1))]')
          ParentFont = False
        end
        object Memo272: TfrxMemoView
          Left = 949.858380000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'talpauta">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo273: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."di' +
              'ferenca">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo274: TfrxMemoView
          Left = 664.740260000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precovenda">,DadosMes' +
              'tre,1))]')
          ParentFont = False
        end
        object Memo275: TfrxMemoView
          Left = 719.622140000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precotabela">,DadosMe' +
              'stre))]')
          ParentFont = False
        end
        object Memo276: TfrxMemoView
          Left = 998.519826610000000000
          Top = 3.779530000000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(<qryRelatorioVendasporSetores_.' +
              '"totalpauta">,DadosMestre,1)<>0) and (sum(<qryRelatorioVendaspor' +
              'Setores_."total">,DadosMestre,1)<>0),(1-(sum(<qryRelatorioVendas' +
              'porSetores_."totalpauta">,DadosMestre,1)/sum(<qryRelatorioVendas' +
              'porSetores_."total">,DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo277: TfrxMemoView
          Left = 815.378480000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo278: TfrxMemoView
          Left = 491.559370000000000000
          Top = 18.897650000000000000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL SEM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo279: TfrxMemoView
          Left = 882.504330000000000000
          Top = 18.897650000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."total">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo280: TfrxMemoView
          Left = 763.149970000000000000
          Top = 18.897650000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."desconto">+<qryRelatorioVendasporSetores_."acrescimo">' +
              '),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo281: TfrxMemoView
          Left = 949.504330000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."totalpauta">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo282: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."diferenca">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo283: TfrxMemoView
          Left = 664.740260000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precovend' +
              'a">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo284: TfrxMemoView
          Left = 719.268090000000000000
          Top = 18.897650000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precotabe' +
              'la">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo285: TfrxMemoView
          Left = 998.519826610000000000
          Top = 18.897650000000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(IIF(<qryRelatorioVendasporSetor' +
              'es_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendas' +
              'porSetores_."diferenca">), DadosMestre,1)>0) and (sum(IIF(<qryRe' +
              'latorioVendasporSetores_."identificacao">='#39'Trocas com contrato'#39',' +
              '0,<qryRelatorioVendasporSetores_."total">), DadosMestre,1)>0), (' +
              '1-(sum(IIF(<qryRelatorioVendasporSetores_."identificacao">='#39'Troc' +
              'as com contrato'#39',0,<qryRelatorioVendasporSetores_."diferenca">),' +
              'DadosMestre) / sum(IIF(<qryRelatorioVendasporSetores_."identific' +
              'acao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendasporSetores_."t' +
              'otal">),DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo286: TfrxMemoView
          Left = 815.024430000000000000
          Top = 18.897650000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo287: TfrxMemoView
          Left = 616.196970000000000000
          Top = 18.897650000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,SUM(IIF(<qryRelatorioVendasporS' +
              'etores_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVe' +
              'ndasporSetores_."quantidade">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo288: TfrxMemoView
          Left = 68.031540000000000000
          Top = 18.897650000000000000
          Width = 419.527756770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag9] [VarToStr(<ag9>) + IIF(<auxag9>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag9>)]')
          ParentFont = False
        end
      end
    end
  end
  object qryRelatorioVendasporSetores_: TfrxDBDataset
    UserName = 'qryRelatorioVendasporSetores_'
    CloseDataSource = False
    FieldAliases.Strings = (
      'contrato=contrato'
      'produto=produto'
      'produtovisual=produtovisual'
      'filial=filial'
      'descricaoproduto=descricaoproduto'
      'quantidade=quantidade'
      'precovenda=precovenda'
      'acrescimo=acrescimo'
      'desconto=desconto'
      'listacasamento=listacasamento'
      'setorvenda=setorvenda'
      'nomesetorvenda=nomesetorvenda'
      'situacao=situacao'
      'Total=Total'
      'filialvenda=filialvenda'
      'nomefilialvenda=nomefilialvenda'
      'marca=marca'
      'filialcadastro=filialcadastro'
      'descricaomarca=descricaomarca'
      'grupo=grupo'
      'descricaogrupo=descricaogrupo'
      'classe=classe'
      'descricaoclasse=descricaoclasse'
      'nome_noiva=nome_noiva'
      'nome_noivo=nome_noivo'
      'vendedor=vendedor'
      'nomevendedor=nomevendedor'
      'precotabela=precotabela'
      'TotalPauta=TotalPauta'
      'Diferenca=Diferenca'
      'faturamento=faturamento'
      'referencia=referencia'
      'creditotrocaproduto=creditotrocaproduto'
      'identificacao=identificacao'
      'identificador=identificador')
    DataSet = qryRelatorioVendasporSetores
    Left = 312
    Top = 288
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Background = False
    Creator = 'FastReport (http://www.fast-report.com)'
    HTMLTags = True
    Left = 672
    Top = 216
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    ShowProgress = True
    FixedWidth = True
    Background = False
    Centered = False
    EmptyLines = True
    Left = 672
    Top = 224
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 680
    Top = 240
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 696
    Top = 264
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    Left = 704
    Top = 288
  end
  object frxBMPExport1: TfrxBMPExport
    UseFileCache = True
    ShowProgress = True
    Left = 704
    Top = 288
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    ShowProgress = True
    Left = 688
    Top = 248
  end
  object frxTIFFExport1: TfrxTIFFExport
    UseFileCache = True
    ShowProgress = True
    Left = 688
    Top = 240
  end
  object frxGIFExport1: TfrxGIFExport
    UseFileCache = True
    ShowProgress = True
    Left = 728
    Top = 264
  end
  object frxSimpleTextExport1: TfrxSimpleTextExport
    UseFileCache = True
    ShowProgress = True
    Frames = False
    EmptyLines = False
    OEMCodepage = False
    Left = 704
    Top = 264
  end
  object frxCSVExport1: TfrxCSVExport
    UseFileCache = True
    ShowProgress = True
    Separator = ';'
    OEMCodepage = False
    Left = 680
    Top = 256
  end
  object frxMailExport1: TfrxMailExport
    UseFileCache = True
    ShowProgress = True
    ShowExportDialog = True
    SmtpPort = 25
    UseIniFile = True
    Left = 688
    Top = 280
  end
  object frxTXTExport1: TfrxTXTExport
    UseFileCache = True
    ShowProgress = True
    ScaleWidth = 1.000000000000000000
    ScaleHeight = 1.000000000000000000
    Borders = False
    Pseudogrpahic = False
    PageBreaks = True
    OEMCodepage = False
    EmptyLines = False
    LeadSpaces = False
    PrintAfter = False
    PrinterDialog = True
    UseSavedProps = True
    Left = 704
    Top = 264
  end
  object frxTXTExport2: TfrxTXTExport
    UseFileCache = True
    ShowProgress = True
    ScaleWidth = 1.000000000000000000
    ScaleHeight = 1.000000000000000000
    Borders = False
    Pseudogrpahic = False
    PageBreaks = True
    OEMCodepage = False
    EmptyLines = False
    LeadSpaces = False
    PrintAfter = False
    PrinterDialog = True
    UseSavedProps = True
    Left = 688
    Top = 256
  end
  object frxTXTExport3: TfrxTXTExport
    UseFileCache = True
    ShowProgress = True
    ScaleWidth = 1.000000000000000000
    ScaleHeight = 1.000000000000000000
    Borders = False
    Pseudogrpahic = False
    PageBreaks = True
    OEMCodepage = False
    EmptyLines = False
    LeadSpaces = False
    PrintAfter = False
    PrinterDialog = True
    UseSavedProps = True
    Left = 688
    Top = 264
  end
  object frxODSExport1: TfrxODSExport
    UseFileCache = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 680
    Top = 264
  end
  object frxODTExport1: TfrxODTExport
    UseFileCache = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 680
    Top = 264
  end
  object qryRelatorioVendasporSetores__: TfrxDBDataset
    UserName = 'qryRelatorioVendasporSetores_'
    CloseDataSource = False
    FieldAliases.Strings = (
      'contrato=contrato'
      'produto=produto'
      'produtovisual=produtovisual'
      'filial=filial'
      'descricaoproduto=descricaoproduto'
      'quantidade=quantidade'
      'precovenda=precovenda'
      'acrescimo=acrescimo'
      'desconto=desconto'
      'listacasamento=listacasamento'
      'setorvenda=setorvenda'
      'nomesetorvenda=nomesetorvenda'
      'situacao=situacao'
      'Total=Total'
      'filialvenda=filialvenda'
      'nomefilialvenda=nomefilialvenda'
      'marca=marca'
      'filialcadastro=filialcadastro'
      'descricaomarca=descricaomarca'
      'grupo=grupo'
      'descricaogrupo=descricaogrupo'
      'classe=classe'
      'descricaoclasse=descricaoclasse'
      'nome_noiva=nome_noiva'
      'nome_noivo=nome_noivo'
      'vendedor=vendedor'
      'nomevendedor=nomevendedor'
      'precotabela=precotabela'
      'TotalPauta=TotalPauta'
      'Diferenca=Diferenca'
      'faturamento=faturamento'
      'referencia=referencia'
      'creditotrocaproduto=creditotrocaproduto'
      'identificacao=identificacao'
      'identificador=identificador')
    DataSet = qryRelatorioVendasporSetores
    Left = 416
    Top = 312
  end
  object qryRelatorioVendasporSetores_Anterior: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnCalcFields = qryRelatorioVendasporSetoresCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'Condicao_filiais'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Condicao_Vendedores'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Condicao_grupos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Condicao_classes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Condicao_marcas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Condicao_clientes'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Condicao_Listacasamento'
        ParamType = ptUnknown
        Value = 
          'left join listascasamento lc on selecao.listacasamento = lc.codi' +
          'go'
      end
      item
        DataType = ftUnknown
        Name = 'Condicao_Setores'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Condicao_Listacasamento_semlista'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ordenacao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';'
      'select selecao.*,'
      
        '       (select u.nome from usuarios u where u.codigo = selecao.v' +
        'endedor) as nomevendedor,'
      
        '       (select sv.nome from setoresvenda sv where sv.codigo = se' +
        'lecao.setorvenda) as nomesetorvenda,'
      
        '       case when :comListadeCasamento then lc.nome_noiva else ca' +
        'st(null as varchar(60)) end as nome_noiva,'
      
        '       case when :comListadeCasamento then lc.nome_noivo else ca' +
        'st(null as varchar(60)) end as nome_noivo'
      'from'
      '('
      ''
      
        'select ct.filialvenda, ct.faturamento, f.nome as nomefilialvenda' +
        ', pc.contrato, ct.situacao, p.codigovisual as produtovisual, pc.' +
        'produto, pc.filial,'
      '       p.descricao as descricaoproduto,'
      '       p.referencia,'
      '       c.marca, m.descricao as descricaomarca,'
      '       c.grupo, g.descricao as descricaogrupo,'
      '       c.classe, cl.descricao as descricaoclasse,'
      
        '       pc.quantidade, pc.precovenda, pc.precotabela, pc.acrescim' +
        'o, pc.desconto,'
      '       pc.listacasamento,'
      '       coalesce(pc.vendedor, ct.vendedor) as vendedor,'
      
        '       coalesce(pc.setorvenda, (select u.setorvenda from usuario' +
        's u where u.codigo = coalesce(pc.vendedor, ct.vendedor))) as set' +
        'orvenda'
      ''
      'from ('
      '      (produtoscontratos pc'
      '       join (produtos p'
      '            join (((caracteristicas c'
      '                    join classes cl'
      '                    on c.classe=cl.codigo)'
      '                    join grupos g'
      '                    on g.codigo=c.grupo)'
      '                    join marcas m'
      '                    on c.marca = m.codigo)'
      '            on p.caracteristica=c.codigo)'
      '       on pc.produto = p.codigo)'
      ''
      '      join ((contratos ct'
      '            join filiais f'
      '            on ct.filialvenda = f.codigo)'
      '            join vfornecedores vf'
      '            on ct.cliente = vf.codigo'
      '            and ct.tipocliente = vf.tipo)'
      '      on pc.contrato = ct.numero)'
      ''
      'where ct.faturamento between :datainicial and :datafinal'
      '                    and c.classe=cl.codigo'
      '                    and g.codigo=c.grupo'
      '                    and c.marca = m.codigo'
      '            and p.caracteristica=c.codigo'
      '       and pc.produto = p.codigo'
      ''
      '      and ct.filialvenda = f.codigo'
      '      and pc.contrato = ct.numero'
      ''
      '      and ct.cliente = vf.codigo'
      '      and ct.tipocliente = vf.tipo'
      ''
      ''
      '  and ct.situacao in ('#39'F'#39','#39'N'#39','#39'P'#39')'
      
        '  and case when ct.os then ct.tipoequipamento in (1,2) and not (' +
        'coalesce(ct.os_garantia,false) and ct.os_garantia_status='#39'A'#39') an' +
        'd not coalesce(ct.os_cortesia,false) else true end'
      ''
      '  %Condicao_filiais'
      '  %Condicao_Vendedores'
      '  %Condicao_grupos'
      '  %Condicao_classes'
      '  %Condicao_marcas'
      '  %Condicao_clientes'
      ''
      ''
      ') as selecao'
      
        '  %Condicao_Listacasamento /* left join listascasamento lc on se' +
        'lecao.listacasamento = lc.codigo */'
      '  '
      ''
      'where true'
      '   %Condicao_Setores'
      '   %Condicao_Listacasamento_semlista'
      ''
      '%ordenacao')
    RequestLive = False
    Left = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'comListadeCasamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'datainicial'
        ParamType = ptUnknown
        Value = #39'2015-01-01'#39
      end
      item
        DataType = ftString
        Name = 'datafinal'
        ParamType = ptUnknown
        Value = #39'2015-01-02'#39
      end>
    object StringField1: TStringField
      FieldName = 'contrato'
    end
    object LargeintField1: TLargeintField
      FieldName = 'produto'
    end
    object StringField2: TStringField
      FieldName = 'produtovisual'
    end
    object IntegerField1: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object StringField3: TStringField
      DisplayWidth = 50
      FieldName = 'descricaoproduto'
      Size = 100
    end
    object FloatField1: TFloatField
      FieldName = 'quantidade'
      DisplayFormat = '0.00'
    end
    object FloatField2: TFloatField
      FieldName = 'precovenda'
      DisplayFormat = '0.00'
    end
    object FloatField3: TFloatField
      FieldName = 'acrescimo'
      DisplayFormat = '0.00'
    end
    object FloatField4: TFloatField
      FieldName = 'desconto'
      DisplayFormat = '0.00'
    end
    object IntegerField2: TIntegerField
      FieldName = 'listacasamento'
      DisplayFormat = '0'
    end
    object IntegerField3: TIntegerField
      FieldName = 'setorvenda'
      DisplayFormat = '0'
    end
    object StringField4: TStringField
      FieldName = 'nomesetorvenda'
      Size = 100
    end
    object StringField5: TStringField
      FieldName = 'situacao'
      Size = 1
    end
    object FloatField5: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object IntegerField4: TIntegerField
      FieldName = 'filialvenda'
      DisplayFormat = '0'
    end
    object StringField6: TStringField
      FieldName = 'nomefilialvenda'
      Size = 60
    end
    object IntegerField5: TIntegerField
      FieldName = 'marca'
      DisplayFormat = '0'
    end
    object StringField7: TStringField
      FieldName = 'descricaomarca'
      Size = 15
    end
    object StringField8: TStringField
      FieldName = 'grupo'
      Size = 4
    end
    object StringField9: TStringField
      FieldName = 'descricaogrupo'
      Size = 30
    end
    object StringField10: TStringField
      FieldName = 'classe'
      Size = 2
    end
    object StringField11: TStringField
      FieldName = 'descricaoclasse'
      Size = 30
    end
    object StringField12: TStringField
      FieldName = 'nome_noiva'
      Size = 60
    end
    object StringField13: TStringField
      FieldName = 'nome_noivo'
      Size = 60
    end
    object IntegerField6: TIntegerField
      FieldName = 'vendedor'
      DisplayFormat = '0'
    end
    object StringField14: TStringField
      FieldName = 'nomevendedor'
      Size = 40
    end
    object FloatField6: TFloatField
      FieldName = 'precotabela'
      DisplayFormat = '0.00'
    end
    object FloatField7: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalPauta'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object FloatField8: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Diferenca'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object DateField1: TDateField
      FieldName = 'faturamento'
    end
    object StringField15: TStringField
      FieldName = 'referencia'
      Size = 15
    end
  end
  object frpRelatorioVendasporSetores_ComasTrocas: TfrxReport
    Version = '4.0.11'
    DataSet = qryRelatorioVendasporSetores__
    DataSetName = 'qryRelatorioVendasporSetores_'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40829.408948738400000000
    ReportOptions.LastChange = 44039.653855833300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '  vZebrar : boolean;'
      ''
      'procedure mmoZebradoOnBeforePrint(Sender: TfrxComponent);'
      'begin'
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
      'end;'
      ''
      'procedure rod8OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'begin'
      '  cab1.visible := <cabvisible1>;'
      '  cab2.visible := <cabvisible2>;'
      '  cab3.visible := <cabvisible3>;'
      '  cab4.visible := <cabvisible4>;'
      '  cab5.visible := <cabvisible5>;'
      '  cab6.visible := <cabvisible6>;'
      '  cab7.visible := <cabvisible7>;'
      '  cab8.visible := <cabvisible8>;'
      '  cab9.visible := <cabvisible9>;'
      '  cab10.visible := <cabvisible10>;'
      ''
      '  rod1.visible := <rodvisible1>;'
      '  rod2.visible := <rodvisible2>;'
      '  rod3.visible := <rodvisible3>;'
      '  rod4.visible := <rodvisible4>;'
      '  rod5.visible := <rodvisible5>;'
      '  rod6.visible := <rodvisible6>;'
      '  rod7.visible := <rodvisible7>;'
      '  rod8.visible := <rodvisible8>;'
      '  rod9.visible := <rodvisible9>;'
      '  rod10.visible := <rodvisible10>;'
      ''
      ''
      '  DadosMestre.visible := not <SomenteTotalizadores>;'
      ''
      'end.')
    OnGetValue = frpRelatorioVendasporSetores_GetValue
    Left = 360
    Top = 120
    Datasets = <
      item
        DataSet = qryRelatorioVendasporSetores_
        DataSetName = 'qryRelatorioVendasporSetores_'
      end>
    Variables = <
      item
        Name = ' Totais'
        Value = Null
      end
      item
        Name = 'RAZAOFILIALBASE'
        Value = #39'PRAIANA COMERCIO DE PRODUTOS HOSPITALARES LTDA EPP'#39
      end
      item
        Name = 'ENDERECO_BAIRRO'
        Value = #39'Rua Santa Marta, 281, LOTEAMENTO JAT  - Bela Vista'#39
      end
      item
        Name = 'CEP_CIDADE_UF'
        Value = #39'88132-712  Palho'#231'a  SC'#39
      end
      item
        Name = 'Outras'
        Value = ''
      end
      item
        Name = 'Titulo'
        Value = #39'VENDAS POR SETORES'#39
      end
      item
        Name = 'ListarVendedores'
        Value = Null
      end
      item
        Name = 'SaltarPagina'
        Value = Null
      end
      item
        Name = 'mascaraquantidade'
        Value = #39'#,###,##0.00'#39
      end
      item
        Name = 'subtitulo'
        Value = Null
      end
      item
        Name = 'CordoZebrado'
        Value = 'clYellow'
      end
      item
        Name = ' Agrupamento'
        Value = Null
      end
      item
        Name = 'AgruparFilial'
        Value = Null
      end
      item
        Name = 'AgruparClasse'
        Value = Null
      end
      item
        Name = 'ag1'
        Value = '<qryRelatorioVendasporSetores_."produto">'
      end
      item
        Name = 'ag2'
        Value = Null
      end
      item
        Name = 'ag3'
        Value = Null
      end
      item
        Name = 'labelag1'
        Value = Null
      end
      item
        Name = 'labelag2'
        Value = Null
      end
      item
        Name = 'labelag3'
        Value = Null
      end
      item
        Name = 'ag4'
        Value = Null
      end
      item
        Name = 'ag5'
        Value = Null
      end
      item
        Name = 'ag6'
        Value = Null
      end
      item
        Name = 'ag7'
        Value = Null
      end
      item
        Name = 'labelag4'
        Value = Null
      end
      item
        Name = 'labelag5'
        Value = Null
      end
      item
        Name = 'labelag6'
        Value = Null
      end
      item
        Name = 'labelag7'
        Value = Null
      end
      item
        Name = 'auxag1'
        Value = Null
      end
      item
        Name = 'Variable1'
        Value = Null
      end
      item
        Name = 'auxag2'
        Value = Null
      end
      item
        Name = 'auxag3'
        Value = Null
      end
      item
        Name = 'auxag4'
        Value = Null
      end
      item
        Name = 'auxag5'
        Value = Null
      end
      item
        Name = 'auxag6'
        Value = Null
      end
      item
        Name = 'auxag7'
        Value = Null
      end
      item
        Name = ' Auxiliaires'
        Value = Null
      end
      item
        Name = 'Linha'
        Value = Null
      end
      item
        Name = 'cabvisible1'
        Value = Null
      end
      item
        Name = 'cabvisible2'
        Value = Null
      end
      item
        Name = 'cabvisible3'
        Value = Null
      end
      item
        Name = 'cabvisible4'
        Value = Null
      end
      item
        Name = 'cabvisible5'
        Value = Null
      end
      item
        Name = 'cabvisible6'
        Value = Null
      end
      item
        Name = 'cabvisible7'
        Value = Null
      end
      item
        Name = 'rodvisible1'
        Value = Null
      end
      item
        Name = 'rodvisible2'
        Value = Null
      end
      item
        Name = 'rodvisible3'
        Value = Null
      end
      item
        Name = 'rodvisible4'
        Value = Null
      end
      item
        Name = 'rodvisible5'
        Value = Null
      end
      item
        Name = 'rodvisible6'
        Value = Null
      end
      item
        Name = 'rodvisible7'
        Value = Null
      end
      item
        Name = 'SomenteTotalizadores'
        Value = 'False'
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 5.000000000000000000
      TopMargin = 6.000000000000000000
      BottomMargin = 5.000000000000000000
      OnBeforePrint = 'Page1OnBeforePrint'
      object PageHeader1: TfrxPageHeader
        Height = 85.747990000000000000
        Top = 18.897650000000000000
        Width = 1103.622760000000000000
        object fpvLogo: TfrxPictureView
          Left = 8.000000000000000000
          Top = 10.102350000000000000
          Width = 115.000000000000000000
          Height = 39.000000000000000000
          Frame.Width = 0.500000000000000000
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
        object Memo9: TfrxMemoView
          Left = 625.858380000000000000
          Top = 56.763760000000000000
          Width = 43.000000000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'QTDADE')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 606.858380000000000000
          Top = 56.763760000000000000
          Width = 19.000000000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'FIL.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 453.267780000000000000
          Top = 56.763760000000000000
          Width = 57.000000000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'CONTRATO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 585.858380000000000000
          Top = 56.763760000000000000
          Width = 21.000000000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'SIT.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 668.858380000000000000
          Top = 56.763760000000000000
          Width = 55.881880000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'PRE'#195#8225'O'
            'VENDA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 880.637910000000000000
          Top = 56.763760000000000000
          Width = 66.220470000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'TOTAL VENDA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 5.779530000000000000
          Top = 56.763760000000000000
          Width = 89.000000000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'PRODUTO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 93.779530000000000000
          Top = 56.763760000000000000
          Width = 291.456710000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'DESCRI'#195#8225#195#402'O')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 723.740260000000000000
          Top = 56.763760000000000000
          Width = 55.881880000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'PRE'#195#8225'O'
            'PAUTA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 779.622140000000000000
          Top = 56.763760000000000000
          Width = 51.881880000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'JUROS/'
            'DESC.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 946.858380000000000000
          Top = 56.763760000000000000
          Width = 63.000000000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'TOTAL PAUTA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          Left = 1009.858380000000000000
          Top = 56.763760000000000000
          Width = 91.220470000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'DIFEREN'#195#8225'A'
            '%             R$')
          ParentFont = False
          VAlign = vaCenter
        end
        object fmvRua: TfrxMemoView
          Left = 128.504020000000000000
          Top = 11.338590000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[RAZAOFILIALBASE]')
          ParentFont = False
        end
        object fmvBairro: TfrxMemoView
          Left = 128.504020000000000000
          Top = 22.677180000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[ENDERECO_BAIRRO]')
          ParentFont = False
        end
        object fmvCidade: TfrxMemoView
          Left = 128.504020000000000000
          Top = 34.015770000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[CEP_CIDADE_UF]')
          ParentFont = False
        end
        object Memo236: TfrxMemoView
          Left = 1039.370750000000000000
          Top = 34.015770000000000000
          Width = 56.692950000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Page#]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo237: TfrxMemoView
          Left = 1001.575450000000000000
          Top = 34.015770000000000000
          Width = 34.015770000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'P'#195#129'G.:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo238: TfrxMemoView
          Left = 1001.575450000000000000
          Top = 18.897650000000000000
          Width = 34.015770000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'DATA:')
          ParentFont = False
        end
        object Memo239: TfrxMemoView
          Left = 1039.370750000000000000
          Top = 18.897650000000000000
          Width = 56.692950000000000000
          Height = 11.338582680000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[Date]')
          ParentFont = False
          VAlign = vaCenter
        end
        object mmoTitulo: TfrxMemoView
          ShiftMode = smDontShift
          Left = 415.748300000000000000
          Top = 7.559060000000000000
          Width = 377.953000000000000000
          Height = 22.677180000000000000
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
        end
        object Memo240: TfrxMemoView
          Left = 415.748300000000000000
          Top = 34.015770000000000000
          Width = 377.953000000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[Outras]')
          ParentFont = False
        end
        object Memo119: TfrxMemoView
          Left = 529.134200000000000000
          Top = 56.692950000000000000
          Width = 57.000000000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'DATA FAT.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo121: TfrxMemoView
          Left = 385.512060000000000000
          Top = 56.692950000000000000
          Width = 68.464440000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'REFER'#195#352'NCIA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo123: TfrxMemoView
          Left = 831.496600000000000000
          Top = 56.692950000000000000
          Width = 51.881880000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'CRED.'
            'TROCA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo213: TfrxMemoView
          Left = 510.236550000000000000
          Top = 56.692950000000000000
          Width = 19.000000000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'FC')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object fbvRodape: TfrxPageFooter
        Height = 16.000000000000000000
        Top = 1186.772420000000000000
        Width = 1103.622760000000000000
        object fmvHora: TfrxMemoView
          Left = 14.338590000000000000
          Top = 1.479900000000000000
          Width = 240.000000000000000000
          Height = 10.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          HideZeros = True
          Memo.UTF8 = (
            '[TIME #Thh:mm:ss]')
          ParentFont = False
          VAlign = vaCenter
        end
        object fmvDesenvolvedor: TfrxMemoView
          Left = 854.267780000000000000
          Top = 1.479900000000000000
          Width = 221.354360000000000000
          Height = 10.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            'tecSOFT - Tecnologia em Sistemas')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object DadosMestre: TfrxMasterData
        Height = 15.118110240000000000
        Top = 616.063390000000000000
        Width = 1103.622760000000000000
        OnBeforePrint = 'DadosMestreOnBeforePrint'
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = qryRelatorioVendasporSetores_
        DataSetName = 'qryRelatorioVendasporSetores_'
        RowCount = 0
        Stretched = True
        object mmoZebrado: TfrxMemoView
          Align = baClient
          Width = 1103.622760000000000000
          Height = 15.118110240000000000
          OnBeforePrint = 'mmoZebradoOnBeforePrint'
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
        object Memo1: TfrxMemoView
          Left = 4.070810000000000000
          Width = 86.929190000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[qryRelatorioVendasporSetores_."produtovisual"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 82.440940000000000000
          Width = 309.921460000000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataField = 'descricaoproduto'
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[qryRelatorioVendasporSetores_."descricaoproduto"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 457.354360000000000000
          Width = 56.692950000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[qryRelatorioVendasporSetores_."contrato"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 584.181200000000000000
          Width = 22.677180000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[IIF(((<qryRelatorioVendasporSetores_."identificador">='#39'T'#39') or (' +
              '<qryRelatorioVendasporSetores_."identificador">='#39'D'#39')),<qryRelato' +
              'rioVendasporSetores_."identificador">,<qryRelatorioVendasporSeto' +
              'res_."situacao">)]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 606.960730000000000000
          Width = 18.897650000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[qryRelatorioVendasporSetores_."filial"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 612.165430000000000000
          Width = 56.692950000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,<qryRelatorioVendasporSetores_.' +
              '"quantidade">)]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 700.252010000000000000
          Width = 79.370130000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[qryRelatorioVendasporSetores_."precotabela"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 645.370130000000000000
          Width = 79.370130000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',<qryRelatorioVendasporSetores_."precov' +
              'enda">)]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 752.133890000000000000
          Width = 79.370130000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF((<qryRelatorioVendasporSetores_."desconto"><>0) or (<qryRel' +
              'atorioVendasporSetores_."acrescimo"><>0),<qryRelatorioVendasporS' +
              'etores_."desconto">+<qryRelatorioVendasporSetores_."acrescimo">,' +
              #39#39')]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 867.488250000000000000
          Width = 79.370130000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[qryRelatorioVendasporSetores_."Total"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 930.488250000000000000
          Width = 79.370130000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[qryRelatorioVendasporSetores_."TotalPauta"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 1044.385900000000000000
          Width = 56.692950000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF(<qryRelatorioVendasporSetores_."Diferenca"><>0,formatfloat(' +
              #39'###,##0.00'#39',<qryRelatorioVendasporSetores_."Diferenca">),'#39#39')]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 1009.858380000000000000
          Width = 45.354360000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              '[iif(<qryRelatorioVendasporSetores_."Diferenca"><>0, formatfloat' +
              '('#39'##0.00%'#39',((1-(<qryRelatorioVendasporSetores_."Total">/<qryRela' +
              'torioVendasporSetores_."TotalPauta">))*100.00)), '#39#39')]')
          ParentFont = False
        end
        object Memo120: TfrxMemoView
          Left = 529.441250000000000000
          Width = 56.692950000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[qryRelatorioVendasporSetores_."faturamento"]')
          ParentFont = False
        end
        object Memo122: TfrxMemoView
          Left = 389.724490000000000000
          Width = 64.252010000000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[qryRelatorioVendasporSetores_."referencia"]')
          ParentFont = False
        end
        object Memo124: TfrxMemoView
          Left = 804.008350000000000000
          Width = 79.370130000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[qryRelatorioVendasporSetores_."creditotrocaproduto"]')
          ParentFont = False
        end
        object Memo221: TfrxMemoView
          Left = 510.236550000000000000
          Width = 18.897650000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[qryRelatorioVendasporSetores_."filialcadastro"]')
          ParentFont = False
        end
      end
      object TfrxFooter
        Height = 22.000000000000000000
        Top = 1103.622760000000000000
        Width = 1103.622760000000000000
        object Memo25: TfrxMemoView
          Left = 438.645950000000000000
          Top = 2.897340000000000000
          Width = 175.370130000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HideZeros = True
          Memo.UTF8 = (
            'TOTAL GERAL COM AS TROCAS')
          ParentFont = False
        end
        object Memo69: TfrxMemoView
          Left = 882.858380000000000000
          Top = 2.897340000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'tal">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo72: TfrxMemoView
          Left = 616.196970000000000000
          Top = 2.897340000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,sum(<qryRelatorioVendasporSetor' +
              'es_."quantidade">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo73: TfrxMemoView
          Left = 763.504020000000000000
          Top = 2.897340000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."de' +
              'sconto">+<qryRelatorioVendasporSetores_."acrescimo">,DadosMestre' +
              ',1))]')
          ParentFont = False
        end
        object Memo92: TfrxMemoView
          Left = 949.858380000000000000
          Top = 2.897340000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'talpauta">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo93: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 2.897340000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."di' +
              'ferenca">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 664.740260000000000000
          Top = 2.897340000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precovenda">,DadosMes' +
              'tre))]')
          ParentFont = False
        end
        object Memo104: TfrxMemoView
          Left = 719.622140000000000000
          Top = 2.897340000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precotabela">,DadosMe' +
              'stre))]')
          ParentFont = False
        end
        object Memo113: TfrxMemoView
          Left = 998.519826610000000000
          Top = 2.897340000000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(<qryRelatorioVendasporSetores_.' +
              '"totalpauta">,DadosMestre,1)<>0) and (sum(<qryRelatorioVendaspor' +
              'Setores_."total">,DadosMestre,1)<>0),(1-(sum(<qryRelatorioVendas' +
              'porSetores_."totalpauta">,DadosMestre,1)/sum(<qryRelatorioVendas' +
              'porSetores_."total">,DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo132: TfrxMemoView
          Left = 815.378480000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Align = baBottom
          Left = 438.425480000000000000
          Top = 22.000000000000000000
          Width = 665.197280000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
      end
      object cab1: TfrxGroupHeader
        Height = 22.000000000000000000
        Top = 166.299320000000000000
        Width = 1103.622760000000000000
        Condition = '<ag1>'
        object Memo33: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 1096.063626770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag1] [VarToStr(<ag1>) + IIF(<auxag1>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag1>)]')
          ParentFont = False
        end
      end
      object rod1: TfrxGroupFooter
        Height = 22.000000000000000000
        Top = 1058.268400000000000000
        Width = 1103.622760000000000000
        object Memo64: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 480.756030000000000000
          Height = 14.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HideZeros = True
          Memo.UTF8 = (
            
              '[labelag1] [VarToStr(<ag1>) + IIF(<auxag1>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag1>)]')
          ParentFont = False
          WordWrap = False
        end
        object Memo11: TfrxMemoView
          Left = 882.858380000000000000
          Top = 3.779530000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'tal">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 616.196970000000000000
          Top = 3.779530000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,sum(<qryRelatorioVendasporSetor' +
              'es_."quantidade">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 763.504020000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."de' +
              'sconto">+<qryRelatorioVendasporSetores_."acrescimo">,DadosMestre' +
              ',1))]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 949.858380000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'talpauta">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."di' +
              'ferenca">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 664.740260000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precovenda">,DadosMes' +
              'tre))]')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 719.622140000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precotabela">,DadosMe' +
              'stre))]')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 998.519826610000000000
          Top = 3.779530000000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(<qryRelatorioVendasporSetores_.' +
              '"totalpauta">,DadosMestre,1)<>0) and (sum(<qryRelatorioVendaspor' +
              'Setores_."total">,DadosMestre,1)<>0),(1-(sum(<qryRelatorioVendas' +
              'porSetores_."totalpauta">,DadosMestre,1)/sum(<qryRelatorioVendas' +
              'porSetores_."total">,DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo131: TfrxMemoView
          Left = 815.378480000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          Left = 491.338900000000000000
          Top = 3.779530000000000000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL COM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          Align = baBottom
          Left = 7.559060000000000000
          Top = 22.000000000000000000
          Width = 1092.284170000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
      end
      object cab2: TfrxGroupHeader
        Height = 22.000000000000000000
        Top = 211.653680000000000000
        Width = 1103.622760000000000000
        Condition = '<ag2>'
        object Memo41: TfrxMemoView
          Left = 15.118120000000000000
          Top = 3.779530000000000000
          Width = 1084.725036770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag2] [VarToStr(<ag2>) + IIF(<auxag2>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag2>)]')
          ParentFont = False
        end
      end
      object cab3: TfrxGroupHeader
        Height = 22.000000000000000000
        Top = 257.008040000000000000
        Width = 1103.622760000000000000
        Condition = '<ag3>'
        object Memo50: TfrxMemoView
          Left = 22.677165354330700000
          Top = 3.779530000000000000
          Width = 1073.386446770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag3] [VarToStr(<ag3>) + IIF(<auxag3>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag3>)]')
          ParentFont = False
        end
      end
      object rod2: TfrxGroupFooter
        Height = 22.000000000000000000
        Top = 1012.914040000000000000
        Width = 1103.622760000000000000
        object Memo49: TfrxMemoView
          Left = 15.118120000000000000
          Top = 3.779530000000000000
          Width = 473.196970000000000000
          Height = 14.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HideZeros = True
          Memo.UTF8 = (
            
              '[labelag2] [VarToStr(<ag2>) + IIF(<auxag2>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag2>)]')
          ParentFont = False
          WordWrap = False
        end
        object Memo110: TfrxMemoView
          Left = 882.858380000000000000
          Top = 3.779530000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'tal">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo111: TfrxMemoView
          Left = 616.196970000000000000
          Top = 3.779530000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,sum(<qryRelatorioVendasporSetor' +
              'es_."quantidade">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo112: TfrxMemoView
          Left = 763.504020000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."de' +
              'sconto">+<qryRelatorioVendasporSetores_."acrescimo">,DadosMestre' +
              ',1))]')
          ParentFont = False
        end
        object Memo114: TfrxMemoView
          Left = 949.858380000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'talpauta">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo115: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."di' +
              'ferenca">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo116: TfrxMemoView
          Left = 664.740260000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precovenda">,DadosMes' +
              'tre))]')
          ParentFont = False
        end
        object Memo117: TfrxMemoView
          Left = 719.622140000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precotabela">,DadosMe' +
              'stre))]')
          ParentFont = False
        end
        object Memo118: TfrxMemoView
          Left = 998.519826610000000000
          Top = 3.779530000000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(<qryRelatorioVendasporSetores_.' +
              '"totalpauta">,DadosMestre,1)<>0) and (sum(<qryRelatorioVendaspor' +
              'Setores_."total">,DadosMestre,1)<>0),(1-(sum(<qryRelatorioVendas' +
              'porSetores_."totalpauta">,DadosMestre,1)/sum(<qryRelatorioVendas' +
              'porSetores_."total">,DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo130: TfrxMemoView
          Left = 815.378480000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Left = 491.338900000000000000
          Top = 3.779530000000000000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL COM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line3: TfrxLineView
          Align = baBottom
          Left = 18.897650000000000000
          Top = 22.000000000000000000
          Width = 1084.725110000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
      end
      object rod3: TfrxGroupFooter
        Height = 22.000000000000000000
        Top = 967.559680000000000000
        Width = 1103.622760000000000000
        object Memo45: TfrxMemoView
          Left = 22.677165350000000000
          Top = 3.779530000000000000
          Width = 465.637910000000000000
          Height = 14.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HideZeros = True
          Memo.UTF8 = (
            
              '[labelag3] [VarToStr(<ag3>) + IIF(<auxag3>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag3>)]')
          ParentFont = False
          WordWrap = False
        end
        object Memo101: TfrxMemoView
          Left = 882.858380000000000000
          Top = 3.779530000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'tal">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo102: TfrxMemoView
          Left = 616.196970000000000000
          Top = 3.779530000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,sum(<qryRelatorioVendasporSetor' +
              'es_."quantidade">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo103: TfrxMemoView
          Left = 763.504020000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."de' +
              'sconto">+<qryRelatorioVendasporSetores_."acrescimo">,DadosMestre' +
              ',1))]')
          ParentFont = False
        end
        object Memo105: TfrxMemoView
          Left = 949.858380000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'talpauta">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo106: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."di' +
              'ferenca">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo107: TfrxMemoView
          Left = 664.740260000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precovenda">,DadosMes' +
              'tre))]')
          ParentFont = False
        end
        object Memo108: TfrxMemoView
          Left = 719.622140000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precotabela">,DadosMe' +
              'stre))]')
          ParentFont = False
        end
        object Memo109: TfrxMemoView
          Left = 998.519826610000000000
          Top = 3.779530000000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(<qryRelatorioVendasporSetores_.' +
              '"totalpauta">,DadosMestre,1)<>0) and (sum(<qryRelatorioVendaspor' +
              'Setores_."total">,DadosMestre,1)<>0),(1-(sum(<qryRelatorioVendas' +
              'porSetores_."totalpauta">,DadosMestre,1)/sum(<qryRelatorioVendas' +
              'porSetores_."total">,DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo129: TfrxMemoView
          Left = 815.378480000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 491.338900000000000000
          Top = 3.779530000000000000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL COM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line4: TfrxLineView
          Align = baBottom
          Left = 30.236240000000000000
          Top = 22.000000000000000000
          Width = 1073.386520000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
      end
      object cab4: TfrxGroupHeader
        Height = 22.000000000000000000
        Top = 302.362400000000000000
        Width = 1103.622760000000000000
        Condition = '<ag4>'
        object Memo51: TfrxMemoView
          Left = 30.236240000000000000
          Top = 3.779530000000000000
          Width = 1069.606916770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag4] [VarToStr(<ag4>) + IIF(<auxag4>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag4>)]')
          ParentFont = False
        end
      end
      object cab5: TfrxGroupHeader
        Height = 20.944650000000000000
        Top = 347.716760000000000000
        Width = 1103.622760000000000000
        Condition = '<ag5>'
        object Memo52: TfrxMemoView
          Left = 37.795275590000000000
          Width = 1062.047856770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag5] [VarToStr(<ag5>) + IIF(<auxag5>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag5>)]')
          ParentFont = False
        end
      end
      object cab6: TfrxGroupHeader
        Height = 22.692640000000000000
        Top = 393.071120000000000000
        Width = 1103.622760000000000000
        Condition = '<ag6>'
        object Memo53: TfrxMemoView
          Left = 45.354330710000000000
          Top = 3.779530000000000000
          Width = 1050.709266770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag6] [VarToStr(<ag6>) + IIF(<auxag6>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag6>)]')
          ParentFont = False
        end
      end
      object cab7: TfrxGroupHeader
        Height = 16.897340000000000000
        Top = 438.425480000000000000
        Width = 1103.622760000000000000
        Condition = '<ag7>'
        object Memo54: TfrxMemoView
          Left = 52.913385830000000000
          Width = 1043.150206770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag7] [VarToStr(<ag7>) + IIF(<auxag7>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag7>)]')
          ParentFont = False
        end
      end
      object rod4: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 925.984850000000000000
        Width = 1103.622760000000000000
        object Memo42: TfrxMemoView
          Left = 30.236220470000000000
          Width = 458.078850000000000000
          Height = 14.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HideZeros = True
          Memo.UTF8 = (
            
              '[labelag4] [VarToStr(<ag4>) + IIF(<auxag4>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag4>)]')
          ParentFont = False
          WordWrap = False
        end
        object Memo91: TfrxMemoView
          Left = 882.858380000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'tal">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo94: TfrxMemoView
          Left = 616.196970000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,sum(<qryRelatorioVendasporSetor' +
              'es_."quantidade">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo95: TfrxMemoView
          Left = 763.504020000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."de' +
              'sconto">+<qryRelatorioVendasporSetores_."acrescimo">,DadosMestre' +
              ',1))]')
          ParentFont = False
        end
        object Memo96: TfrxMemoView
          Left = 949.858380000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'talpauta">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo97: TfrxMemoView
          Left = 1041.078850000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."di' +
              'ferenca">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo98: TfrxMemoView
          Left = 664.740260000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precovenda">,DadosMes' +
              'tre))]')
          ParentFont = False
        end
        object Memo99: TfrxMemoView
          Left = 719.622140000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precotabela">,DadosMe' +
              'stre))]')
          ParentFont = False
        end
        object Memo100: TfrxMemoView
          Left = 998.519826610000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(<qryRelatorioVendasporSetores_.' +
              '"totalpauta">,DadosMestre,1)<>0) and (sum(<qryRelatorioVendaspor' +
              'Setores_."total">,DadosMestre,1)<>0),(1-(sum(<qryRelatorioVendas' +
              'porSetores_."totalpauta">,DadosMestre,1)/sum(<qryRelatorioVendas' +
              'porSetores_."total">,DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo128: TfrxMemoView
          Left = 815.378480000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 491.338900000000000000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL COM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line5: TfrxLineView
          Align = baBottom
          Left = 45.354360000000000000
          Top = 18.897650000000000000
          Width = 1054.488870000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
      end
      object rod5: TfrxGroupFooter
        Height = 22.000000000000000000
        Top = 880.630490000000000000
        Width = 1103.622760000000000000
        object Memo40: TfrxMemoView
          Left = 37.795275590000000000
          Top = 3.779530000000000000
          Width = 454.299320000000000000
          Height = 14.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HideZeros = True
          Memo.UTF8 = (
            
              '[labelag5] [VarToStr(<ag5>) + IIF(<auxag5>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag5>)]')
          ParentFont = False
          WordWrap = False
        end
        object Memo83: TfrxMemoView
          Left = 882.858380000000000000
          Top = 3.779530000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'tal">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo84: TfrxMemoView
          Left = 616.196970000000000000
          Top = 3.779530000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,sum(<qryRelatorioVendasporSetor' +
              'es_."quantidade">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo85: TfrxMemoView
          Left = 763.504020000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."de' +
              'sconto">+<qryRelatorioVendasporSetores_."acrescimo">,DadosMestre' +
              ',1))]')
          ParentFont = False
        end
        object Memo86: TfrxMemoView
          Left = 949.858380000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'talpauta">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo87: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."di' +
              'ferenca">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo88: TfrxMemoView
          Left = 664.740260000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precovenda">,DadosMes' +
              'tre))]')
          ParentFont = False
        end
        object Memo89: TfrxMemoView
          Left = 719.622140000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precotabela">,DadosMe' +
              'stre))]')
          ParentFont = False
        end
        object Memo90: TfrxMemoView
          Left = 998.519826610000000000
          Top = 3.779530000000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(<qryRelatorioVendasporSetores_.' +
              '"totalpauta">,DadosMestre,1)<>0) and (sum(<qryRelatorioVendaspor' +
              'Setores_."total">,DadosMestre,1)<>0),(1-(sum(<qryRelatorioVendas' +
              'porSetores_."totalpauta">,DadosMestre,1)/sum(<qryRelatorioVendas' +
              'porSetores_."total">,DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo127: TfrxMemoView
          Left = 815.378480000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 491.338900000000000000
          Top = 3.779530000000000000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL COM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line6: TfrxLineView
          Align = baBottom
          Left = 56.692950000000000000
          Top = 22.000000000000000000
          Width = 1046.929810000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
      end
      object rod6: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 835.276130000000000000
        Width = 1103.622760000000000000
        object Memo76: TfrxMemoView
          Left = 491.559370000000000000
          Top = 3.779530000000000000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL COM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo78: TfrxMemoView
          Left = 45.354330710000000000
          Top = 3.779530000000000000
          Width = 442.960730000000000000
          Height = 14.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HideZeros = True
          Memo.UTF8 = (
            
              '[labelag6] [VarToStr(<ag6>) + IIF(<auxag6>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag6>)]')
          ParentFont = False
          WordWrap = False
        end
        object Memo65: TfrxMemoView
          Left = 882.858380000000000000
          Top = 3.779530000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'tal">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo66: TfrxMemoView
          Left = 616.196970000000000000
          Top = 3.779530000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,sum(<qryRelatorioVendasporSetor' +
              'es_."quantidade">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          Left = 763.504020000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."de' +
              'sconto">+<qryRelatorioVendasporSetores_."acrescimo">,DadosMestre' +
              ',1))]')
          ParentFont = False
        end
        object Memo74: TfrxMemoView
          Left = 949.858380000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'talpauta">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo79: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."di' +
              'ferenca">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo80: TfrxMemoView
          Left = 664.740260000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precovenda">,DadosMes' +
              'tre))]')
          ParentFont = False
        end
        object Memo81: TfrxMemoView
          Left = 719.622140000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precotabela">,DadosMe' +
              'stre))]')
          ParentFont = False
        end
        object Memo82: TfrxMemoView
          Left = 998.519826610000000000
          Top = 3.779530000000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(<qryRelatorioVendasporSetores_.' +
              '"totalpauta">,DadosMestre,1)<>0) and (sum(<qryRelatorioVendaspor' +
              'Setores_."total">,DadosMestre,1)<>0),(1-(sum(<qryRelatorioVendas' +
              'porSetores_."totalpauta">,DadosMestre,1)/sum(<qryRelatorioVendas' +
              'porSetores_."total">,DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo126: TfrxMemoView
          Left = 815.378480000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Line7: TfrxLineView
          Align = baBottom
          Left = 71.811070000000000000
          Top = 22.677180000000000000
          Width = 1028.032160000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
      end
      object rod7: TfrxGroupFooter
        Height = 21.921264720000000000
        Top = 789.921770000000000000
        Width = 1103.622760000000000000
        object Memo68: TfrxMemoView
          Left = 491.559370000000000000
          Top = 3.779530000000000000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL COM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo77: TfrxMemoView
          Left = 52.913385830000000000
          Top = 3.779530000000000000
          Width = 435.401670000000000000
          Height = 14.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HideZeros = True
          Memo.UTF8 = (
            
              '[labelag7] [VarToStr(<ag7>) + IIF(<auxag7>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag7>)]')
          ParentFont = False
          WordWrap = False
        end
        object Memo37: TfrxMemoView
          Left = 882.858380000000000000
          Top = 3.779530000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'tal">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 616.196970000000000000
          Top = 3.779530000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,sum(<qryRelatorioVendasporSetor' +
              'es_."quantidade">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 763.504020000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."de' +
              'sconto">+<qryRelatorioVendasporSetores_."acrescimo">,DadosMestre' +
              ',1))]')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 949.858380000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'talpauta">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."di' +
              'ferenca">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 664.740260000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precovenda">,DadosMes' +
              'tre))]')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 719.622140000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precotabela">,DadosMe' +
              'stre))]')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          Left = 998.519826610000000000
          Top = 3.779530000000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(<qryRelatorioVendasporSetores_.' +
              '"totalpauta">,DadosMestre,1)<>0) and (sum(<qryRelatorioVendaspor' +
              'Setores_."total">,DadosMestre,1)<>0),(1-(sum(<qryRelatorioVendas' +
              'porSetores_."totalpauta">,DadosMestre,1)/sum(<qryRelatorioVendas' +
              'porSetores_."total">,DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo125: TfrxMemoView
          Left = 815.378480000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Line8: TfrxLineView
          Align = baBottom
          Left = 83.149660000000000000
          Top = 21.921264720000000000
          Width = 1020.473100000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
      end
      object cab8: TfrxGroupHeader
        Height = 22.000000000000000000
        Top = 480.000310000000000000
        Width = 1103.622760000000000000
        Condition = '<ag8>'
        object Memo222: TfrxMemoView
          Left = 60.472440940000000000
          Top = 3.779530000000000000
          Width = 1035.591146770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag8] [VarToStr(<ag8>) + IIF(<auxag8>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag8>)]')
          ParentFont = False
        end
      end
      object rod8: TfrxGroupFooter
        Height = 21.921264720000000000
        Top = 744.567410000000000000
        Width = 1103.622760000000000000
        object Memo251: TfrxMemoView
          Left = 60.472440940000000000
          Top = 3.779530000000000000
          Width = 427.086816770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag8] [VarToStr(<ag8>) + IIF(<auxag8>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag8>)]')
          ParentFont = False
        end
        object Memo224: TfrxMemoView
          Left = 491.559370000000000000
          Top = 3.779530000000000000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL COM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo226: TfrxMemoView
          Left = 882.858380000000000000
          Top = 3.779530000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'tal">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo227: TfrxMemoView
          Left = 616.196970000000000000
          Top = 3.779530000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,sum(<qryRelatorioVendasporSetor' +
              'es_."quantidade">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo228: TfrxMemoView
          Left = 763.504020000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."de' +
              'sconto">+<qryRelatorioVendasporSetores_."acrescimo">,DadosMestre' +
              ',1))]')
          ParentFont = False
        end
        object Memo229: TfrxMemoView
          Left = 949.858380000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'talpauta">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo230: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."di' +
              'ferenca">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo231: TfrxMemoView
          Left = 664.740260000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precovenda">,DadosMes' +
              'tre,1))]')
          ParentFont = False
        end
        object Memo232: TfrxMemoView
          Left = 719.622140000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precotabela">,DadosMe' +
              'stre))]')
          ParentFont = False
        end
        object Memo233: TfrxMemoView
          Left = 998.519826610000000000
          Top = 3.779530000000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(<qryRelatorioVendasporSetores_.' +
              '"totalpauta">,DadosMestre,1)<>0) and (sum(<qryRelatorioVendaspor' +
              'Setores_."total">,DadosMestre,1)<>0),(1-(sum(<qryRelatorioVendas' +
              'porSetores_."totalpauta">,DadosMestre,1)/sum(<qryRelatorioVendas' +
              'porSetores_."total">,DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo234: TfrxMemoView
          Left = 815.378480000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Line9: TfrxLineView
          Align = baBottom
          Left = 94.488250000000000000
          Top = 21.921264720000000000
          Width = 1005.354980000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
        object Line10: TfrxLineView
          Align = baBottom
          Left = 370.393940000000000000
          Top = 21.921264720000000000
          Width = 1005.354980000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
      end
      object cab9: TfrxGroupHeader
        Height = 22.000000000000000000
        Top = 525.354670000000000000
        Width = 1103.622760000000000000
        Condition = '<ag8>'
        object Memo28: TfrxMemoView
          Left = 68.031496060000000000
          Top = 3.779530000000000000
          Width = 1028.032086770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag9] [VarToStr(<ag9>) + IIF(<auxag9>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag9>)]')
          ParentFont = False
        end
      end
      object cab10: TfrxGroupHeader
        Height = 22.000000000000000000
        Top = 570.709030000000000000
        Width = 1103.622760000000000000
        Condition = '<ag8>'
        object Memo55: TfrxMemoView
          Left = 75.590551180000000000
          Top = 3.779530000000000000
          Width = 1020.473026770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag10] [VarToStr(<ag10>) + IIF(<auxag10>=null,'#39#39','#39' - '#39') + V' +
              'arToStr(<auxag10>)]')
          ParentFont = False
        end
      end
      object rod9: TfrxGroupFooter
        Height = 21.921264720000000000
        Top = 699.213050000000000000
        Width = 1103.622760000000000000
        object Memo57: TfrxMemoView
          Left = 68.031496060000000000
          Top = 3.779530000000000000
          Width = 423.307286770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag9] [VarToStr(<ag9>) + IIF(<auxag9>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag9>)]')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Left = 491.559370000000000000
          Top = 3.779530000000000000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL COM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          Left = 882.858380000000000000
          Top = 3.779530000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'tal">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          Left = 616.196970000000000000
          Top = 3.779530000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,sum(<qryRelatorioVendasporSetor' +
              'es_."quantidade">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo70: TfrxMemoView
          Left = 763.504020000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."de' +
              'sconto">+<qryRelatorioVendasporSetores_."acrescimo">,DadosMestre' +
              ',1))]')
          ParentFont = False
        end
        object Memo133: TfrxMemoView
          Left = 949.858380000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'talpauta">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo134: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."di' +
              'ferenca">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo135: TfrxMemoView
          Left = 664.740260000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precovenda">,DadosMes' +
              'tre,1))]')
          ParentFont = False
        end
        object Memo136: TfrxMemoView
          Left = 719.622140000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precotabela">,DadosMe' +
              'stre))]')
          ParentFont = False
        end
        object Memo137: TfrxMemoView
          Left = 998.519826610000000000
          Top = 3.779530000000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(<qryRelatorioVendasporSetores_.' +
              '"totalpauta">,DadosMestre,1)<>0) and (sum(<qryRelatorioVendaspor' +
              'Setores_."total">,DadosMestre,1)<>0),(1-(sum(<qryRelatorioVendas' +
              'porSetores_."totalpauta">,DadosMestre,1)/sum(<qryRelatorioVendas' +
              'porSetores_."total">,DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo138: TfrxMemoView
          Left = 815.378480000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
      end
      object rod10: TfrxGroupFooter
        Height = 21.921264720000000000
        Top = 653.858690000000000000
        Width = 1103.622760000000000000
        object Memo139: TfrxMemoView
          Left = 75.590551180000000000
          Top = 3.779530000000000000
          Width = 411.968696770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag10] [VarToStr(<ag10>) + IIF(<auxag10>=null,'#39#39','#39' - '#39') + V' +
              'arToStr(<auxag10>)]')
          ParentFont = False
        end
        object Memo140: TfrxMemoView
          Left = 491.559370000000000000
          Top = 3.779530000000000000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL COM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo141: TfrxMemoView
          Left = 882.858380000000000000
          Top = 3.779530000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'tal">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo142: TfrxMemoView
          Left = 616.196970000000000000
          Top = 3.779530000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,sum(<qryRelatorioVendasporSetor' +
              'es_."quantidade">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo143: TfrxMemoView
          Left = 763.504020000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."de' +
              'sconto">+<qryRelatorioVendasporSetores_."acrescimo">,DadosMestre' +
              ',1))]')
          ParentFont = False
        end
        object Memo144: TfrxMemoView
          Left = 949.858380000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'talpauta">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo145: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."di' +
              'ferenca">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo146: TfrxMemoView
          Left = 664.740260000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precovenda">,DadosMes' +
              'tre,1))]')
          ParentFont = False
        end
        object Memo147: TfrxMemoView
          Left = 719.622140000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precotabela">,DadosMe' +
              'stre))]')
          ParentFont = False
        end
        object Memo148: TfrxMemoView
          Left = 998.519826610000000000
          Top = 3.779530000000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(<qryRelatorioVendasporSetores_.' +
              '"totalpauta">,DadosMestre,1)<>0) and (sum(<qryRelatorioVendaspor' +
              'Setores_."total">,DadosMestre,1)<>0),(1-(sum(<qryRelatorioVendas' +
              'porSetores_."totalpauta">,DadosMestre,1)/sum(<qryRelatorioVendas' +
              'porSetores_."total">,DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo149: TfrxMemoView
          Left = 815.378480000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
      end
    end
  end
  object frpRelatorioVendasporSetores_SemasTrocas: TfrxReport
    Version = '4.0.11'
    DataSet = qryRelatorioVendasporSetores__
    DataSetName = 'qryRelatorioVendasporSetores_'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40829.408948738400000000
    ReportOptions.LastChange = 44039.602594270800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '  vZebrar : boolean;'
      ''
      'procedure mmoZebradoOnBeforePrint(Sender: TfrxComponent);'
      'begin'
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
      'end;'
      ''
      'procedure rod8OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure rod8OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'begin'
      '  cab1.visible := <cabvisible1>;'
      '  cab2.visible := <cabvisible2>;'
      '  cab3.visible := <cabvisible3>;'
      '  cab4.visible := <cabvisible4>;'
      '  cab5.visible := <cabvisible5>;'
      '  cab6.visible := <cabvisible6>;'
      '  cab7.visible := <cabvisible7>;'
      '  cab8.visible := <cabvisible8>;'
      '  cab9.visible := <cabvisible9>;'
      '  cab10.visible := <cabvisible10>;'
      ''
      '  rod1.visible := <rodvisible1>;'
      '  rod2.visible := <rodvisible2>;'
      '  rod3.visible := <rodvisible3>;'
      '  rod4.visible := <rodvisible4>;'
      '  rod5.visible := <rodvisible5>;'
      '  rod6.visible := <rodvisible6>;'
      '  rod7.visible := <rodvisible7>;'
      '  rod8.visible := <rodvisible8>;'
      '  rod9.visible := <rodvisible9>;'
      '  rod10.visible := <rodvisible10>;'
      ''
      '  DadosMestre.visible := not <SomenteTotalizadores>;'
      ''
      'end.')
    OnGetValue = frpRelatorioVendasporSetores_GetValue
    Left = 360
    Top = 184
    Datasets = <
      item
        DataSet = qryRelatorioVendasporSetores_
        DataSetName = 'qryRelatorioVendasporSetores_'
      end>
    Variables = <
      item
        Name = ' Totais'
        Value = Null
      end
      item
        Name = 'RAZAOFILIALBASE'
        Value = #39'PRAIANA COMERCIO DE PRODUTOS HOSPITALARES LTDA EPP'#39
      end
      item
        Name = 'ENDERECO_BAIRRO'
        Value = #39'Rua Santa Marta, 281, LOTEAMENTO JAT  - Bela Vista'#39
      end
      item
        Name = 'CEP_CIDADE_UF'
        Value = #39'88132-712  Palho'#231'a  SC'#39
      end
      item
        Name = 'Outras'
        Value = ''
      end
      item
        Name = 'Titulo'
        Value = #39'VENDAS POR SETORES'#39
      end
      item
        Name = 'ListarVendedores'
        Value = Null
      end
      item
        Name = 'SaltarPagina'
        Value = Null
      end
      item
        Name = 'mascaraquantidade'
        Value = #39'#,###,##0.00'#39
      end
      item
        Name = 'subtitulo'
        Value = Null
      end
      item
        Name = 'CordoZebrado'
        Value = 'clYellow'
      end
      item
        Name = ' Agrupamento'
        Value = Null
      end
      item
        Name = 'AgruparFilial'
        Value = Null
      end
      item
        Name = 'AgruparClasse'
        Value = Null
      end
      item
        Name = 'ag1'
        Value = '<qryRelatorioVendasporSetores_."produto">'
      end
      item
        Name = 'ag2'
        Value = Null
      end
      item
        Name = 'ag3'
        Value = Null
      end
      item
        Name = 'labelag1'
        Value = Null
      end
      item
        Name = 'labelag2'
        Value = Null
      end
      item
        Name = 'labelag3'
        Value = Null
      end
      item
        Name = 'ag4'
        Value = Null
      end
      item
        Name = 'ag5'
        Value = Null
      end
      item
        Name = 'ag6'
        Value = Null
      end
      item
        Name = 'ag7'
        Value = Null
      end
      item
        Name = 'labelag4'
        Value = Null
      end
      item
        Name = 'labelag5'
        Value = Null
      end
      item
        Name = 'labelag6'
        Value = Null
      end
      item
        Name = 'labelag7'
        Value = Null
      end
      item
        Name = 'auxag1'
        Value = Null
      end
      item
        Name = 'Variable1'
        Value = Null
      end
      item
        Name = 'auxag2'
        Value = Null
      end
      item
        Name = 'auxag3'
        Value = Null
      end
      item
        Name = 'auxag4'
        Value = Null
      end
      item
        Name = 'auxag5'
        Value = Null
      end
      item
        Name = 'auxag6'
        Value = Null
      end
      item
        Name = 'auxag7'
        Value = Null
      end
      item
        Name = ' Auxiliaires'
        Value = Null
      end
      item
        Name = 'Linha'
        Value = Null
      end
      item
        Name = 'cabvisible1'
        Value = Null
      end
      item
        Name = 'cabvisible2'
        Value = Null
      end
      item
        Name = 'cabvisible3'
        Value = Null
      end
      item
        Name = 'cabvisible4'
        Value = Null
      end
      item
        Name = 'cabvisible5'
        Value = Null
      end
      item
        Name = 'cabvisible6'
        Value = Null
      end
      item
        Name = 'cabvisible7'
        Value = Null
      end
      item
        Name = 'rodvisible1'
        Value = Null
      end
      item
        Name = 'rodvisible2'
        Value = Null
      end
      item
        Name = 'rodvisible3'
        Value = Null
      end
      item
        Name = 'rodvisible4'
        Value = Null
      end
      item
        Name = 'rodvisible5'
        Value = Null
      end
      item
        Name = 'rodvisible6'
        Value = Null
      end
      item
        Name = 'rodvisible7'
        Value = Null
      end
      item
        Name = 'SomenteTotalizadores'
        Value = 'False'
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 5.000000000000000000
      TopMargin = 6.000000000000000000
      BottomMargin = 5.000000000000000000
      OnBeforePrint = 'Page1OnBeforePrint'
      object PageHeader1: TfrxPageHeader
        Height = 85.747990000000000000
        Top = 18.897650000000000000
        Width = 1103.622760000000000000
        object fpvLogo: TfrxPictureView
          Left = 8.000000000000000000
          Top = 10.102350000000000000
          Width = 115.000000000000000000
          Height = 39.000000000000000000
          Frame.Width = 0.500000000000000000
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
        object Memo9: TfrxMemoView
          Left = 625.858380000000000000
          Top = 56.763760000000000000
          Width = 43.000000000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'QTDADE')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 606.858380000000000000
          Top = 56.763760000000000000
          Width = 19.000000000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'FIL.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 453.267780000000000000
          Top = 56.763760000000000000
          Width = 57.000000000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'CONTRATO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 585.858380000000000000
          Top = 56.763760000000000000
          Width = 21.000000000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'SIT.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 668.858380000000000000
          Top = 56.763760000000000000
          Width = 55.881880000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'PRE'#195#8225'O'
            'VENDA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 880.637910000000000000
          Top = 56.763760000000000000
          Width = 66.220470000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'TOTAL VENDA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 5.779530000000000000
          Top = 56.763760000000000000
          Width = 89.000000000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'PRODUTO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 93.779530000000000000
          Top = 56.763760000000000000
          Width = 291.456710000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'DESCRI'#195#8225#195#402'O')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 723.740260000000000000
          Top = 56.763760000000000000
          Width = 55.881880000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'PRE'#195#8225'O'
            'PAUTA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 779.622140000000000000
          Top = 56.763760000000000000
          Width = 51.881880000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'JUROS/'
            'DESC.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 946.858380000000000000
          Top = 56.763760000000000000
          Width = 63.000000000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'TOTAL PAUTA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          Left = 1009.858380000000000000
          Top = 56.763760000000000000
          Width = 91.220470000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'DIFEREN'#195#8225'A'
            '%             R$')
          ParentFont = False
          VAlign = vaCenter
        end
        object fmvRua: TfrxMemoView
          Left = 128.504020000000000000
          Top = 11.338590000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[RAZAOFILIALBASE]')
          ParentFont = False
        end
        object fmvBairro: TfrxMemoView
          Left = 128.504020000000000000
          Top = 22.677180000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[ENDERECO_BAIRRO]')
          ParentFont = False
        end
        object fmvCidade: TfrxMemoView
          Left = 128.504020000000000000
          Top = 34.015770000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[CEP_CIDADE_UF]')
          ParentFont = False
        end
        object Memo236: TfrxMemoView
          Left = 1039.370750000000000000
          Top = 34.015770000000000000
          Width = 56.692950000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Page#]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo237: TfrxMemoView
          Left = 1001.575450000000000000
          Top = 34.015770000000000000
          Width = 34.015770000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'P'#195#129'G.:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo238: TfrxMemoView
          Left = 1001.575450000000000000
          Top = 18.897650000000000000
          Width = 34.015770000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'DATA:')
          ParentFont = False
        end
        object Memo239: TfrxMemoView
          Left = 1039.370750000000000000
          Top = 18.897650000000000000
          Width = 56.692950000000000000
          Height = 11.338582680000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[Date]')
          ParentFont = False
          VAlign = vaCenter
        end
        object mmoTitulo: TfrxMemoView
          ShiftMode = smDontShift
          Left = 415.748300000000000000
          Top = 7.559060000000000000
          Width = 377.953000000000000000
          Height = 22.677180000000000000
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
        end
        object Memo240: TfrxMemoView
          Left = 415.748300000000000000
          Top = 34.015770000000000000
          Width = 377.953000000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[Outras]')
          ParentFont = False
        end
        object Memo119: TfrxMemoView
          Left = 529.134200000000000000
          Top = 56.692950000000000000
          Width = 57.000000000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'DATA FAT.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo121: TfrxMemoView
          Left = 385.512060000000000000
          Top = 56.692950000000000000
          Width = 68.464440000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'REFER'#195#352'NCIA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo123: TfrxMemoView
          Left = 831.496600000000000000
          Top = 56.692950000000000000
          Width = 51.881880000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'CRED.'
            'TROCA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo213: TfrxMemoView
          Left = 510.236550000000000000
          Top = 56.692950000000000000
          Width = 19.000000000000000000
          Height = 23.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'FC')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object fbvRodape: TfrxPageFooter
        Height = 16.000000000000000000
        Top = 1186.772420000000000000
        Width = 1103.622760000000000000
        object fmvHora: TfrxMemoView
          Left = 14.338590000000000000
          Top = 1.479900000000000000
          Width = 240.000000000000000000
          Height = 10.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          HideZeros = True
          Memo.UTF8 = (
            '[TIME #Thh:mm:ss]')
          ParentFont = False
          VAlign = vaCenter
        end
        object fmvDesenvolvedor: TfrxMemoView
          Left = 854.267780000000000000
          Top = 1.479900000000000000
          Width = 221.354360000000000000
          Height = 10.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            'tecSOFT - Tecnologia em Sistemas')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object DadosMestre: TfrxMasterData
        Height = 15.118110240000000000
        Top = 616.063390000000000000
        Width = 1103.622760000000000000
        OnBeforePrint = 'DadosMestreOnBeforePrint'
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = qryRelatorioVendasporSetores_
        DataSetName = 'qryRelatorioVendasporSetores_'
        RowCount = 0
        Stretched = True
        object mmoZebrado: TfrxMemoView
          Align = baClient
          Width = 1103.622760000000000000
          Height = 15.118110240000000000
          OnBeforePrint = 'mmoZebradoOnBeforePrint'
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
        object Memo1: TfrxMemoView
          Left = 4.070810000000000000
          Width = 86.929190000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[qryRelatorioVendasporSetores_."produtovisual"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 82.440940000000000000
          Width = 309.921460000000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataField = 'descricaoproduto'
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[qryRelatorioVendasporSetores_."descricaoproduto"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 457.354360000000000000
          Width = 56.692950000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[qryRelatorioVendasporSetores_."contrato"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 584.181200000000000000
          Width = 22.677180000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[IIF(((<qryRelatorioVendasporSetores_."identificador">='#39'T'#39') or (' +
              '<qryRelatorioVendasporSetores_."identificador">='#39'D'#39')),<qryRelato' +
              'rioVendasporSetores_."identificador">,<qryRelatorioVendasporSeto' +
              'res_."situacao">)]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 606.960730000000000000
          Width = 18.897650000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[qryRelatorioVendasporSetores_."filial"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 612.165430000000000000
          Width = 56.692950000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,<qryRelatorioVendasporSetores_.' +
              '"quantidade">)]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 700.252010000000000000
          Width = 79.370130000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[qryRelatorioVendasporSetores_."precotabela"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 645.370130000000000000
          Width = 79.370130000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',<qryRelatorioVendasporSetores_."precov' +
              'enda">)]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 752.133890000000000000
          Width = 79.370130000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF((<qryRelatorioVendasporSetores_."desconto"><>0) or (<qryRel' +
              'atorioVendasporSetores_."acrescimo"><>0),<qryRelatorioVendasporS' +
              'etores_."desconto">+<qryRelatorioVendasporSetores_."acrescimo">,' +
              #39#39')]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 867.488250000000000000
          Width = 79.370130000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[qryRelatorioVendasporSetores_."Total"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 930.488250000000000000
          Width = 79.370130000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[qryRelatorioVendasporSetores_."TotalPauta"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 1044.385900000000000000
          Width = 56.692950000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF(<qryRelatorioVendasporSetores_."Diferenca"><>0,formatfloat(' +
              #39'###,##0.00'#39',<qryRelatorioVendasporSetores_."Diferenca">),'#39#39')]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 1009.858380000000000000
          Width = 45.354360000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              '[iif(<qryRelatorioVendasporSetores_."Diferenca"><>0, formatfloat' +
              '('#39'##0.00%'#39',((1-(<qryRelatorioVendasporSetores_."Total">/<qryRela' +
              'torioVendasporSetores_."TotalPauta">))*100.00)), '#39#39')]')
          ParentFont = False
        end
        object Memo120: TfrxMemoView
          Left = 529.441250000000000000
          Width = 56.692950000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[qryRelatorioVendasporSetores_."faturamento"]')
          ParentFont = False
        end
        object Memo122: TfrxMemoView
          Left = 389.724490000000000000
          Width = 64.252010000000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[qryRelatorioVendasporSetores_."referencia"]')
          ParentFont = False
        end
        object Memo124: TfrxMemoView
          Left = 804.008350000000000000
          Width = 79.370130000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[qryRelatorioVendasporSetores_."creditotrocaproduto"]')
          ParentFont = False
        end
        object Memo221: TfrxMemoView
          Left = 510.236550000000000000
          Width = 18.897650000000000000
          Height = 14.362204720000000000
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[qryRelatorioVendasporSetores_."filialcadastro"]')
          ParentFont = False
        end
      end
      object TfrxFooter
        Height = 22.000000000000000000
        Top = 1103.622760000000000000
        Width = 1103.622760000000000000
        object Memo210: TfrxMemoView
          Left = 438.645950000000000000
          Top = 3.779529999999999000
          Width = 173.858306770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'TOTAL GERAL SEM AS TROCAS')
          ParentFont = False
        end
        object Memo212: TfrxMemoView
          Left = 882.637910000000000000
          Top = 3.779529999999999000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."total">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo214: TfrxMemoView
          Left = 763.283550000000000000
          Top = 3.779529999999999000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."desconto">+<qryRelatorioVendasporSetores_."acrescimo">' +
              '),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo215: TfrxMemoView
          Left = 949.637910000000000000
          Top = 3.779529999999999000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."totalpauta">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo216: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 3.779529999999999000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."diferenca">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo217: TfrxMemoView
          Left = 664.740260000000000000
          Top = 3.779529999999999000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precovend' +
              'a">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo218: TfrxMemoView
          Left = 719.401670000000000000
          Top = 3.779529999999999000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precotabe' +
              'la">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo219: TfrxMemoView
          Left = 998.519826610000000000
          Top = 3.779529999999999000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(IIF(<qryRelatorioVendasporSetor' +
              'es_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendas' +
              'porSetores_."diferenca">), DadosMestre,1)>0) and (sum(IIF(<qryRe' +
              'latorioVendasporSetores_."identificacao">='#39'Trocas com contrato'#39',' +
              '0,<qryRelatorioVendasporSetores_."total">), DadosMestre,1)>0), (' +
              '1-(sum(IIF(<qryRelatorioVendasporSetores_."identificacao">='#39'Troc' +
              'as com contrato'#39',0,<qryRelatorioVendasporSetores_."diferenca">),' +
              'DadosMestre) / sum(IIF(<qryRelatorioVendasporSetores_."identific' +
              'acao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendasporSetores_."t' +
              'otal">),DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo220: TfrxMemoView
          Left = 815.158010000000000000
          Top = 3.779529999999999000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo147: TfrxMemoView
          Left = 616.196970000000000000
          Top = 3.779529999999999000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,SUM(IIF(<qryRelatorioVendasporS' +
              'etores_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVe' +
              'ndasporSetores_."quantidade">),DadosMestre,1))]')
          ParentFont = False
        end
        object Line8: TfrxLineView
          Align = baBottom
          Left = 7.559060000000000000
          Top = 22.000000000000000000
          Width = 1560.945890000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
      end
      object cab1: TfrxGroupHeader
        Height = 22.000000000000000000
        Top = 166.299320000000000000
        Width = 1103.622760000000000000
        Condition = '<ag1>'
        object Memo33: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 1096.063626770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag1] [VarToStr(<ag1>) + IIF(<auxag1>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag1>)]')
          ParentFont = False
        end
      end
      object rod1: TfrxGroupFooter
        Height = 22.000000000000000000
        Top = 1058.268400000000000000
        Width = 1103.622760000000000000
        object Memo200: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 480.756030000000000000
          Height = 14.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HideZeros = True
          Memo.UTF8 = (
            
              '[labelag1] [VarToStr(<ag1>) + IIF(<auxag1>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag1>)]')
          ParentFont = False
          WordWrap = False
        end
        object Memo135: TfrxMemoView
          Left = 882.504330000000000000
          Top = 3.779529999999999000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."total">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo136: TfrxMemoView
          Left = 763.149970000000000000
          Top = 3.779529999999999000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."desconto">+<qryRelatorioVendasporSetores_."acrescimo">' +
              '),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo137: TfrxMemoView
          Left = 949.504330000000000000
          Top = 3.779529999999999000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."totalpauta">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo138: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 3.779529999999999000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."diferenca">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo139: TfrxMemoView
          Left = 664.740260000000000000
          Top = 3.779529999999999000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precovend' +
              'a">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo140: TfrxMemoView
          Left = 719.268090000000000000
          Top = 3.779529999999999000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precotabe' +
              'la">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo141: TfrxMemoView
          Left = 998.519826610000000000
          Top = 3.779529999999999000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(IIF(<qryRelatorioVendasporSetor' +
              'es_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendas' +
              'porSetores_."diferenca">), DadosMestre,1)>0) and (sum(IIF(<qryRe' +
              'latorioVendasporSetores_."identificacao">='#39'Trocas com contrato'#39',' +
              '0,<qryRelatorioVendasporSetores_."total">), DadosMestre,1)>0), (' +
              '1-(sum(IIF(<qryRelatorioVendasporSetores_."identificacao">='#39'Troc' +
              'as com contrato'#39',0,<qryRelatorioVendasporSetores_."diferenca">),' +
              'DadosMestre) / sum(IIF(<qryRelatorioVendasporSetores_."identific' +
              'acao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendasporSetores_."t' +
              'otal">),DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo142: TfrxMemoView
          Left = 815.024430000000000000
          Top = 3.779529999999999000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo143: TfrxMemoView
          Left = 616.196970000000000000
          Top = 3.779529999999999000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,SUM(IIF(<qryRelatorioVendasporS' +
              'etores_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVe' +
              'ndasporSetores_."quantidade">),DadosMestre,1))]')
          ParentFont = False
        end
        object Line7: TfrxLineView
          Align = baBottom
          Left = 7.559060000000000000
          Top = 22.000000000000000000
          Width = 1096.063700000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
        object Memo61: TfrxMemoView
          Left = 491.338900000000000000
          Top = 3.779529999999999000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL SEM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object cab2: TfrxGroupHeader
        Height = 22.000000000000000000
        Top = 211.653680000000000000
        Width = 1103.622760000000000000
        Condition = '<ag2>'
        object Memo41: TfrxMemoView
          Left = 15.118110236220470000
          Top = 3.779530000000000000
          Width = 1084.725036770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag2] [VarToStr(<ag2>) + IIF(<auxag2>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag2>)]')
          ParentFont = False
        end
      end
      object cab3: TfrxGroupHeader
        Height = 22.000000000000000000
        Top = 257.008040000000000000
        Width = 1103.622760000000000000
        Condition = '<ag3>'
        object Memo50: TfrxMemoView
          Left = 22.677165354330710000
          Top = 3.779530000000000000
          Width = 1073.386446770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag3] [VarToStr(<ag3>) + IIF(<auxag3>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag3>)]')
          ParentFont = False
        end
      end
      object rod2: TfrxGroupFooter
        Height = 22.000000000000000000
        Top = 1012.914040000000000000
        Width = 1103.622760000000000000
        object Memo189: TfrxMemoView
          Left = 15.118110240000000000
          Top = 3.779530000000000000
          Width = 473.196970000000000000
          Height = 14.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HideZeros = True
          Memo.UTF8 = (
            
              '[labelag2] [VarToStr(<ag2>) + IIF(<auxag2>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag2>)]')
          ParentFont = False
          WordWrap = False
        end
        object Memo146: TfrxMemoView
          Left = 882.504330000000000000
          Top = 3.779529999999999000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."total">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo148: TfrxMemoView
          Left = 763.149970000000000000
          Top = 3.779529999999999000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."desconto">+<qryRelatorioVendasporSetores_."acrescimo">' +
              '),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo149: TfrxMemoView
          Left = 949.504330000000000000
          Top = 3.779529999999999000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."totalpauta">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo150: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 3.779529999999999000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."diferenca">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo151: TfrxMemoView
          Left = 664.740260000000000000
          Top = 3.779529999999999000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precovend' +
              'a">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo152: TfrxMemoView
          Left = 719.268090000000000000
          Top = 3.779529999999999000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precotabe' +
              'la">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo153: TfrxMemoView
          Left = 998.519826610000000000
          Top = 3.779529999999999000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(IIF(<qryRelatorioVendasporSetor' +
              'es_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendas' +
              'porSetores_."diferenca">), DadosMestre,1)>0) and (sum(IIF(<qryRe' +
              'latorioVendasporSetores_."identificacao">='#39'Trocas com contrato'#39',' +
              '0,<qryRelatorioVendasporSetores_."total">), DadosMestre,1)>0), (' +
              '1-(sum(IIF(<qryRelatorioVendasporSetores_."identificacao">='#39'Troc' +
              'as com contrato'#39',0,<qryRelatorioVendasporSetores_."diferenca">),' +
              'DadosMestre) / sum(IIF(<qryRelatorioVendasporSetores_."identific' +
              'acao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendasporSetores_."t' +
              'otal">),DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo154: TfrxMemoView
          Left = 815.024430000000000000
          Top = 3.779529999999999000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo157: TfrxMemoView
          Left = 616.196970000000000000
          Top = 3.779529999999999000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,SUM(IIF(<qryRelatorioVendasporS' +
              'etores_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVe' +
              'ndasporSetores_."quantidade">),DadosMestre,1))]')
          ParentFont = False
        end
        object Line6: TfrxLineView
          Align = baBottom
          Left = 18.897650000000000000
          Top = 22.000000000000000000
          Width = 1084.725110000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
        object Memo59: TfrxMemoView
          Left = 491.338900000000000000
          Top = 3.779529999999999000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL SEM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object rod3: TfrxGroupFooter
        Height = 22.000000000000000000
        Top = 967.559680000000000000
        Width = 1103.622760000000000000
        object Memo178: TfrxMemoView
          Left = 22.677165350000000000
          Top = 3.779530000000000000
          Width = 465.637910000000000000
          Height = 14.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HideZeros = True
          Memo.UTF8 = (
            
              '[labelag3] [VarToStr(<ag3>) + IIF(<auxag3>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag3>)]')
          ParentFont = False
          WordWrap = False
        end
        object Memo158: TfrxMemoView
          Left = 882.504330000000000000
          Top = 3.779529999999999000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."total">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo159: TfrxMemoView
          Left = 763.149970000000000000
          Top = 3.779529999999999000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."desconto">+<qryRelatorioVendasporSetores_."acrescimo">' +
              '),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo160: TfrxMemoView
          Left = 949.504330000000000000
          Top = 3.779529999999999000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."totalpauta">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo161: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 3.779529999999999000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."diferenca">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo162: TfrxMemoView
          Left = 664.740260000000000000
          Top = 3.779529999999999000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precovend' +
              'a">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo163: TfrxMemoView
          Left = 719.268090000000000000
          Top = 3.779529999999999000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precotabe' +
              'la">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo164: TfrxMemoView
          Left = 998.519826610000000000
          Top = 3.779529999999999000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(IIF(<qryRelatorioVendasporSetor' +
              'es_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendas' +
              'porSetores_."diferenca">), DadosMestre,1)>0) and (sum(IIF(<qryRe' +
              'latorioVendasporSetores_."identificacao">='#39'Trocas com contrato'#39',' +
              '0,<qryRelatorioVendasporSetores_."total">), DadosMestre,1)>0), (' +
              '1-(sum(IIF(<qryRelatorioVendasporSetores_."identificacao">='#39'Troc' +
              'as com contrato'#39',0,<qryRelatorioVendasporSetores_."diferenca">),' +
              'DadosMestre) / sum(IIF(<qryRelatorioVendasporSetores_."identific' +
              'acao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendasporSetores_."t' +
              'otal">),DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo165: TfrxMemoView
          Left = 815.024430000000000000
          Top = 3.779529999999999000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo168: TfrxMemoView
          Left = 616.196970000000000000
          Top = 3.779529999999999000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,SUM(IIF(<qryRelatorioVendasporS' +
              'etores_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVe' +
              'ndasporSetores_."quantidade">),DadosMestre,1))]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Align = baBottom
          Left = 30.236240000000000000
          Top = 22.000000000000000000
          Width = 1073.386520000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
        object Memo57: TfrxMemoView
          Left = 491.338900000000000000
          Top = 3.779529999999999000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL SEM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object cab4: TfrxGroupHeader
        Height = 22.000000000000000000
        Top = 302.362400000000000000
        Width = 1103.622760000000000000
        Condition = '<ag4>'
        object Memo51: TfrxMemoView
          Left = 30.236220472440940000
          Top = 3.779530000000000000
          Width = 1058.268326770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag4] [VarToStr(<ag4>) + IIF(<auxag4>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag4>)]')
          ParentFont = False
        end
      end
      object cab5: TfrxGroupHeader
        Height = 20.944650000000000000
        Top = 347.716760000000000000
        Width = 1103.622760000000000000
        Condition = '<ag5>'
        object Memo52: TfrxMemoView
          Left = 37.795275590551180000
          Width = 1046.929736770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag5] [VarToStr(<ag5>) + IIF(<auxag5>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag5>)]')
          ParentFont = False
        end
      end
      object cab6: TfrxGroupHeader
        Height = 22.692640000000000000
        Top = 393.071120000000000000
        Width = 1103.622760000000000000
        Condition = '<ag6>'
        object Memo53: TfrxMemoView
          Left = 45.354330708661420000
          Top = 3.779530000000000000
          Width = 1031.811616770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag6] [VarToStr(<ag6>) + IIF(<auxag6>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag6>)]')
          ParentFont = False
        end
      end
      object cab7: TfrxGroupHeader
        Height = 16.897340000000000000
        Top = 438.425480000000000000
        Width = 1103.622760000000000000
        Condition = '<ag7>'
        object Memo54: TfrxMemoView
          Left = 52.913385826771650000
          Width = 1020.473026770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag7] [VarToStr(<ag7>) + IIF(<auxag7>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag7>)]')
          ParentFont = False
        end
      end
      object rod4: TfrxGroupFooter
        Height = 18.220470000000000000
        Top = 925.984850000000000000
        Width = 1103.622760000000000000
        object Memo167: TfrxMemoView
          Left = 30.236220470000000000
          Width = 461.858380000000000000
          Height = 14.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HideZeros = True
          Memo.UTF8 = (
            
              '[labelag4] [VarToStr(<ag4>) + IIF(<auxag4>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag4>)]')
          ParentFont = False
          WordWrap = False
        end
        object Memo202: TfrxMemoView
          Left = 882.504330000000000000
          Top = -0.000000000000000833
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."total">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo203: TfrxMemoView
          Left = 763.149970000000000000
          Top = -0.000000000000000833
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."desconto">+<qryRelatorioVendasporSetores_."acrescimo">' +
              '),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo204: TfrxMemoView
          Left = 949.504330000000000000
          Top = -0.000000000000000833
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."totalpauta">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo205: TfrxMemoView
          Left = 1041.078850000000000000
          Top = -0.000000000000000833
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."diferenca">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo206: TfrxMemoView
          Left = 664.740260000000000000
          Top = -0.000000000000000833
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precovend' +
              'a">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo207: TfrxMemoView
          Left = 719.268090000000000000
          Top = -0.000000000000000833
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precotabe' +
              'la">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo208: TfrxMemoView
          Left = 998.519826610000000000
          Top = -0.000000000000000833
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(IIF(<qryRelatorioVendasporSetor' +
              'es_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendas' +
              'porSetores_."diferenca">), DadosMestre,1)>0) and (sum(IIF(<qryRe' +
              'latorioVendasporSetores_."identificacao">='#39'Trocas com contrato'#39',' +
              '0,<qryRelatorioVendasporSetores_."total">), DadosMestre,1)>0), (' +
              '1-(sum(IIF(<qryRelatorioVendasporSetores_."identificacao">='#39'Troc' +
              'as com contrato'#39',0,<qryRelatorioVendasporSetores_."diferenca">),' +
              'DadosMestre) / sum(IIF(<qryRelatorioVendasporSetores_."identific' +
              'acao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendasporSetores_."t' +
              'otal">),DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo209: TfrxMemoView
          Left = 815.024430000000000000
          Top = -0.000000000000000833
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo211: TfrxMemoView
          Left = 616.196970000000000000
          Top = -0.000000000000000833
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,SUM(IIF(<qryRelatorioVendasporS' +
              'etores_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVe' +
              'ndasporSetores_."quantidade">),DadosMestre,1))]')
          ParentFont = False
        end
        object Line4: TfrxLineView
          Align = baBottom
          Left = 45.354360000000000000
          Top = 18.220470000000000000
          Width = 1058.268400000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
        object Memo55: TfrxMemoView
          Left = 491.338900000000000000
          Top = -0.000000000000000833
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL SEM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object rod5: TfrxGroupFooter
        Height = 22.000000000000000000
        Top = 880.630490000000000000
        Width = 1103.622760000000000000
        object Memo169: TfrxMemoView
          Left = 882.504330000000000000
          Top = 3.779529999999999000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."total">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo170: TfrxMemoView
          Left = 763.149970000000000000
          Top = 3.779529999999999000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."desconto">+<qryRelatorioVendasporSetores_."acrescimo">' +
              '),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo171: TfrxMemoView
          Left = 949.504330000000000000
          Top = 3.779529999999999000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."totalpauta">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo172: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 3.779529999999999000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."diferenca">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo173: TfrxMemoView
          Left = 664.740260000000000000
          Top = 3.779529999999999000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precovend' +
              'a">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo174: TfrxMemoView
          Left = 719.268090000000000000
          Top = 3.779529999999999000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precotabe' +
              'la">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo175: TfrxMemoView
          Left = 998.519826610000000000
          Top = 3.779529999999999000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(IIF(<qryRelatorioVendasporSetor' +
              'es_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendas' +
              'porSetores_."diferenca">), DadosMestre,1)>0) and (sum(IIF(<qryRe' +
              'latorioVendasporSetores_."identificacao">='#39'Trocas com contrato'#39',' +
              '0,<qryRelatorioVendasporSetores_."total">), DadosMestre,1)>0), (' +
              '1-(sum(IIF(<qryRelatorioVendasporSetores_."identificacao">='#39'Troc' +
              'as com contrato'#39',0,<qryRelatorioVendasporSetores_."diferenca">),' +
              'DadosMestre) / sum(IIF(<qryRelatorioVendasporSetores_."identific' +
              'acao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendasporSetores_."t' +
              'otal">),DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo176: TfrxMemoView
          Left = 815.024430000000000000
          Top = 3.779529999999999000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo179: TfrxMemoView
          Left = 616.196970000000000000
          Top = 3.779529999999999000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,SUM(IIF(<qryRelatorioVendasporS' +
              'etores_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVe' +
              'ndasporSetores_."quantidade">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo156: TfrxMemoView
          Left = 37.795275590000000000
          Top = 3.779530000000000000
          Width = 454.299320000000000000
          Height = 14.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HideZeros = True
          Memo.UTF8 = (
            
              '[labelag5] [VarToStr(<ag5>) + IIF(<auxag5>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag5>)]')
          ParentFont = False
          WordWrap = False
        end
        object Line3: TfrxLineView
          Align = baBottom
          Left = 56.692950000000000000
          Top = 22.000000000000000000
          Width = 1046.929810000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
        object Memo28: TfrxMemoView
          Left = 491.338900000000000000
          Top = 3.779529999999999000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL SEM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object rod6: TfrxGroupFooter
        Height = 21.921250080000000000
        Top = 835.276130000000000000
        Width = 1103.622760000000000000
        object Memo144: TfrxMemoView
          Left = 491.559370000000000000
          Top = 3.779529999999999000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL SEM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo145: TfrxMemoView
          Left = 45.354330710000000000
          Top = 3.779530000000000000
          Width = 446.740260000000000000
          Height = 14.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HideZeros = True
          Memo.UTF8 = (
            
              '[labelag6] [VarToStr(<ag6>) + IIF(<auxag6>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag6>)]')
          ParentFont = False
          WordWrap = False
        end
        object Memo180: TfrxMemoView
          Left = 882.504330000000000000
          Top = 3.779529999999999000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."total">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo181: TfrxMemoView
          Left = 763.149970000000000000
          Top = 3.779529999999999000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."desconto">+<qryRelatorioVendasporSetores_."acrescimo">' +
              '),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo182: TfrxMemoView
          Left = 949.504330000000000000
          Top = 3.779529999999999000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."totalpauta">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo183: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 3.779529999999999000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."diferenca">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo184: TfrxMemoView
          Left = 664.740260000000000000
          Top = 3.779529999999999000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precovend' +
              'a">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo185: TfrxMemoView
          Left = 719.268090000000000000
          Top = 3.779529999999999000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precotabe' +
              'la">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo186: TfrxMemoView
          Left = 998.519826610000000000
          Top = 3.779529999999999000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(IIF(<qryRelatorioVendasporSetor' +
              'es_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendas' +
              'porSetores_."diferenca">), DadosMestre,1)>0) and (sum(IIF(<qryRe' +
              'latorioVendasporSetores_."identificacao">='#39'Trocas com contrato'#39',' +
              '0,<qryRelatorioVendasporSetores_."total">), DadosMestre,1)>0), (' +
              '1-(sum(IIF(<qryRelatorioVendasporSetores_."identificacao">='#39'Troc' +
              'as com contrato'#39',0,<qryRelatorioVendasporSetores_."diferenca">),' +
              'DadosMestre) / sum(IIF(<qryRelatorioVendasporSetores_."identific' +
              'acao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendasporSetores_."t' +
              'otal">),DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo187: TfrxMemoView
          Left = 815.024430000000000000
          Top = 3.779529999999999000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo190: TfrxMemoView
          Left = 616.196970000000000000
          Top = 3.779529999999999000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,SUM(IIF(<qryRelatorioVendasporS' +
              'etores_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVe' +
              'ndasporSetores_."quantidade">),DadosMestre,1))]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Align = baBottom
          Left = 71.811070000000000000
          Top = 21.921250080000000000
          Width = 1031.811690000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
      end
      object rod7: TfrxGroupFooter
        Height = 21.921250080000000000
        Top = 789.921770000000000000
        Width = 1103.622760000000000000
        object Memo133: TfrxMemoView
          Left = 491.559370000000000000
          Top = 3.779529999999999000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL SEM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo134: TfrxMemoView
          Left = 52.913385830000000000
          Top = 3.779530000000000000
          Width = 439.181200000000000000
          Height = 14.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HideZeros = True
          Memo.UTF8 = (
            
              '[labelag7] [VarToStr(<ag7>) + IIF(<auxag7>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag7>)]')
          ParentFont = False
          WordWrap = False
        end
        object Memo191: TfrxMemoView
          Left = 882.504330000000000000
          Top = 3.779529999999999000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."total">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo192: TfrxMemoView
          Left = 763.149970000000000000
          Top = 3.779529999999999000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."desconto">+<qryRelatorioVendasporSetores_."acrescimo">' +
              '),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo193: TfrxMemoView
          Left = 949.504330000000000000
          Top = 3.779529999999999000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."totalpauta">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo194: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 3.779529999999999000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."diferenca">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo195: TfrxMemoView
          Left = 664.740260000000000000
          Top = 3.779529999999999000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precovend' +
              'a">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo196: TfrxMemoView
          Left = 719.268090000000000000
          Top = 3.779529999999999000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precotabe' +
              'la">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo197: TfrxMemoView
          Left = 998.519826610000000000
          Top = 3.779529999999999000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(IIF(<qryRelatorioVendasporSetor' +
              'es_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendas' +
              'porSetores_."diferenca">), DadosMestre,1)>0) and (sum(IIF(<qryRe' +
              'latorioVendasporSetores_."identificacao">='#39'Trocas com contrato'#39',' +
              '0,<qryRelatorioVendasporSetores_."total">), DadosMestre,1)>0), (' +
              '1-(sum(IIF(<qryRelatorioVendasporSetores_."identificacao">='#39'Troc' +
              'as com contrato'#39',0,<qryRelatorioVendasporSetores_."diferenca">),' +
              'DadosMestre) / sum(IIF(<qryRelatorioVendasporSetores_."identific' +
              'acao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendasporSetores_."t' +
              'otal">),DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo198: TfrxMemoView
          Left = 815.024430000000000000
          Top = 3.779529999999999000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo201: TfrxMemoView
          Left = 616.196970000000000000
          Top = 3.779529999999999000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,SUM(IIF(<qryRelatorioVendasporS' +
              'etores_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVe' +
              'ndasporSetores_."quantidade">),DadosMestre,1))]')
          ParentFont = False
        end
        object Line5: TfrxLineView
          Align = baBottom
          Left = 83.149660000000000000
          Top = 21.921250080000000000
          Width = 1016.693570000000000000
          Frame.Width = 0.100000000000000000
          Diagonal = True
        end
      end
      object cab8: TfrxGroupHeader
        Height = 22.000000000000000000
        Top = 480.000310000000000000
        Width = 1103.622760000000000000
        Condition = '<ag8>'
        object Memo222: TfrxMemoView
          Left = 60.472440944881890000
          Top = 3.779530000000000000
          Width = 1009.134436770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag8] [VarToStr(<ag8>) + IIF(<auxag8>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag8>)]')
          ParentFont = False
        end
      end
      object rod8: TfrxGroupFooter
        Height = 21.921250080000000000
        Top = 744.567410000000000000
        Width = 1103.622760000000000000
        object Memo235: TfrxMemoView
          Left = 491.559370000000000000
          Top = 3.779529999999999000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL SEM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo242: TfrxMemoView
          Left = 882.504330000000000000
          Top = 3.779529999999999000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."total">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo243: TfrxMemoView
          Left = 763.149970000000000000
          Top = 3.779529999999999000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."desconto">+<qryRelatorioVendasporSetores_."acrescimo">' +
              '),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo244: TfrxMemoView
          Left = 949.504330000000000000
          Top = 3.779529999999999000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."totalpauta">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo245: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 3.779529999999999000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."diferenca">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo246: TfrxMemoView
          Left = 664.740260000000000000
          Top = 3.779529999999999000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precovend' +
              'a">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo247: TfrxMemoView
          Left = 719.268090000000000000
          Top = 3.779529999999999000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',SUM(IIF(<qryRelatorioVendasporSetores_' +
              '."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendaspor' +
              'Setores_."quantidade">*<qryRelatorioVendasporSetores_."precotabe' +
              'la">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo248: TfrxMemoView
          Left = 998.519826610000000000
          Top = 3.779529999999999000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(IIF(<qryRelatorioVendasporSetor' +
              'es_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendas' +
              'porSetores_."diferenca">), DadosMestre,1)>0) and (sum(IIF(<qryRe' +
              'latorioVendasporSetores_."identificacao">='#39'Trocas com contrato'#39',' +
              '0,<qryRelatorioVendasporSetores_."total">), DadosMestre,1)>0), (' +
              '1-(sum(IIF(<qryRelatorioVendasporSetores_."identificacao">='#39'Troc' +
              'as com contrato'#39',0,<qryRelatorioVendasporSetores_."diferenca">),' +
              'DadosMestre) / sum(IIF(<qryRelatorioVendasporSetores_."identific' +
              'acao">='#39'Trocas com contrato'#39',0,<qryRelatorioVendasporSetores_."t' +
              'otal">),DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo249: TfrxMemoView
          Left = 815.024430000000000000
          Top = 3.779529999999999000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo250: TfrxMemoView
          Left = 616.196970000000000000
          Top = 3.779529999999999000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,SUM(IIF(<qryRelatorioVendasporS' +
              'etores_."identificacao">='#39'Trocas com contrato'#39',0,<qryRelatorioVe' +
              'ndasporSetores_."quantidade">),DadosMestre,1))]')
          ParentFont = False
        end
        object Memo252: TfrxMemoView
          Left = 60.472440940000000000
          Top = 3.779530000000000000
          Width = 430.866346770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag8] [VarToStr(<ag8>) + IIF(<auxag8>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag8>)]')
          ParentFont = False
        end
        object Line9: TfrxLineView
          Align = baBottom
          Left = 94.488250000000000000
          Top = 21.921250080000000000
          Width = 1005.354980000000000000
          Diagonal = True
        end
      end
      object cab9: TfrxGroupHeader
        Height = 22.000000000000000000
        Top = 525.354670000000000000
        Width = 1103.622760000000000000
        Condition = '<ag8>'
        object Memo11: TfrxMemoView
          Left = 68.031496060000000000
          Top = 3.779530000000000000
          Width = 1028.032086770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag9] [VarToStr(<ag9>) + IIF(<auxag9>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag9>)]')
          ParentFont = False
        end
      end
      object cab10: TfrxGroupHeader
        Height = 22.000000000000000000
        Top = 570.709030000000000000
        Width = 1103.622760000000000000
        Condition = '<ag8>'
        object Memo12: TfrxMemoView
          Left = 75.590551180000000000
          Top = 3.779530000000000000
          Width = 1020.473026770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag10] [VarToStr(<ag10>) + IIF(<auxag10>=null,'#39#39','#39' - '#39') + V' +
              'arToStr(<auxag10>)]')
          ParentFont = False
        end
      end
      object rod10: TfrxGroupFooter
        Height = 21.921264720000000000
        Top = 653.858690000000000000
        Width = 1103.622760000000000000
        object Memo16: TfrxMemoView
          Left = 75.590551180000000000
          Top = 3.779530000000000000
          Width = 411.968696770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag10] [VarToStr(<ag10>) + IIF(<auxag10>=null,'#39#39','#39' - '#39') + V' +
              'arToStr(<auxag10>)]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 491.559370000000000000
          Top = 3.779530000000000000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL COM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 882.858380000000000000
          Top = 3.779530000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'tal">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 616.196970000000000000
          Top = 3.779530000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,sum(<qryRelatorioVendasporSetor' +
              'es_."quantidade">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 763.504020000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."de' +
              'sconto">+<qryRelatorioVendasporSetores_."acrescimo">,DadosMestre' +
              ',1))]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 949.858380000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'talpauta">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."di' +
              'ferenca">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 664.740260000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precovenda">,DadosMes' +
              'tre,1))]')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 719.622140000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precotabela">,DadosMe' +
              'stre))]')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 998.519826610000000000
          Top = 3.779530000000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(<qryRelatorioVendasporSetores_.' +
              '"totalpauta">,DadosMestre,1)<>0) and (sum(<qryRelatorioVendaspor' +
              'Setores_."total">,DadosMestre,1)<>0),(1-(sum(<qryRelatorioVendas' +
              'porSetores_."totalpauta">,DadosMestre,1)/sum(<qryRelatorioVendas' +
              'porSetores_."total">,DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 815.378480000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
      end
      object rod9: TfrxGroupFooter
        Height = 21.921264720000000000
        Top = 699.213050000000000000
        Width = 1103.622760000000000000
        object Memo39: TfrxMemoView
          Left = 68.031496060000000000
          Top = 3.779530000000000000
          Width = 423.307286770000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[labelag9] [VarToStr(<ag9>) + IIF(<auxag9>=null,'#39#39','#39' - '#39') + VarT' +
              'oStr(<auxag9>)]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 491.559370000000000000
          Top = 3.779530000000000000
          Width = 117.165337240000000000
          Height = 14.362204720000000000
          StretchMode = smActualHeight
          DataSet = qryRelatorioVendasporSetores_
          DataSetName = 'qryRelatorioVendasporSetores_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL COM AS TROCAS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 882.858380000000000000
          Top = 3.779530000000000000
          Width = 64.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'tal">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          Left = 616.196970000000000000
          Top = 3.779530000000000000
          Width = 52.661410000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat(<MascaraQuantidade>,sum(<qryRelatorioVendasporSetor' +
              'es_."quantidade">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo70: TfrxMemoView
          Left = 763.504020000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          GapX = 4.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."de' +
              'sconto">+<qryRelatorioVendasporSetores_."acrescimo">,DadosMestre' +
              ',1))]')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 949.858380000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."to' +
              'talpauta">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 1041.078850000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."di' +
              'ferenca">,DadosMestre,1))]')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 664.740260000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precovenda">,DadosMes' +
              'tre,1))]')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 719.622140000000000000
          Top = 3.779530000000000000
          Width = 60.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39',sum(<qryRelatorioVendasporSetores_."qu' +
              'antidade">*<qryRelatorioVendasporSetores_."precotabela">,DadosMe' +
              'stre))]')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 998.519826610000000000
          Top = 3.779530000000000000
          Width = 56.692913390000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[formatfloat('#39'##0.00%'#39', iif((sum(<qryRelatorioVendasporSetores_.' +
              '"totalpauta">,DadosMestre,1)<>0) and (sum(<qryRelatorioVendaspor' +
              'Setores_."total">,DadosMestre,1)<>0),(1-(sum(<qryRelatorioVendas' +
              'porSetores_."totalpauta">,DadosMestre,1)/sum(<qryRelatorioVendas' +
              'porSetores_."total">,DadosMestre,1)))*100.00, 0))]')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 815.378480000000000000
          Top = 3.779530000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,##0.00'#39', SUM(IIF(((<qryRelatorioVendasporSetor' +
              'es_."identificador">='#39'T'#39') or (<qryRelatorioVendasporSetores_."si' +
              'tuacao">='#39'C'#39')),0,<qryRelatorioVendasporSetores_."creditotrocapro' +
              'duto">),DadosMestre,1))]')
          ParentFont = False
        end
      end
    end
  end
end
