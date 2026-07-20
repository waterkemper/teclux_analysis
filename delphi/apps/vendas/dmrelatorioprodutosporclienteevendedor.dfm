inherited dtmRelatorioProdutosporClienteeVendedor: TdtmRelatorioProdutosporClienteeVendedor
  Left = 176
  Top = 94
  Height = 612
  Width = 1048
  object qryProcuraVendedores: TtecQuery
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
      'Select u.codigo,'
      '              u.nome'
      
        'From  (usuarios u left join gruposusuarios gu on u.grupo=gu.codi' +
        'go)'
      'WHERE u.codigo = :codigo'
      '')
    RequestLive = False
    Left = 529
    Top = 188
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraVendedorescodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryProcuraVendedoresnome: TStringField
      FieldName = 'nome'
      Size = 100
    end
  end
  object dsrProcuraVendedores: TtecDataSource
    DataSet = qryProcuraVendedores
    Left = 539
    Top = 244
  end
  object qryConsultaVendedores: TtecQuery
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
      'Select u.nome,'
      '           u.codigo'
      
        'From  (usuarios  u left join gruposusuarios gu on u.grupo=gu.cod' +
        'igo)'
      'Order By UPPER(TO_ASCII(u.nome,'#39'LATIN1'#39'))'
      '')
    RequestLive = False
    Left = 531
    Top = 296
    object qryConsultaVendedoresnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaVendedorescodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
  end
  object qryProcuraGrupoProdutos: TtecQuery
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
      'select codigo, '
      '         descricao'
      'from grupos'
      'where codigo=:codigo')
    RequestLive = True
    Left = 531
    Top = 15
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraGrupoProdutoscodigo: TStringField
      FieldName = 'codigo'
      Size = 4
    end
    object qryProcuraGrupoProdutosdescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
  end
  object dsrProcuraGrupoProdutos: TtecDataSource
    DataSet = qryProcuraGrupoProdutos
    Left = 531
    Top = 64
  end
  object qryProcuraClasses: TtecQuery
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
      'select codigo, '
      '         descricao'
      'from classes'
      'where codigo=:codigo')
    RequestLive = True
    Left = 683
    Top = 15
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraClassescodigo: TStringField
      FieldName = 'codigo'
      Size = 2
    end
    object qryProcuraClassesdescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
  end
  object dsrProcuraClasses: TtecDataSource
    DataSet = qryProcuraClasses
    Left = 683
    Top = 64
  end
  object qryConsultaGrupoProdutos: TtecQuery
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
      'select codigo,descricao'
      'from grupos'
      'order by codigo')
    RequestLive = False
    Left = 531
    Top = 121
    object qryConsultaGrupoProdutoscodigo: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Size = 4
    end
    object qryConsultaGrupoProdutosdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
  end
  object qryConsultaClasses: TtecQuery
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
      'select codigo,descricao'
      'from classes'
      'order by codigo')
    RequestLive = False
    Left = 683
    Top = 113
    object qryConsultaClassescodigo: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Size = 2
    end
    object qryConsultaClassesdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
  end
  object qryProcuraMarca: TtecQuery
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
      'SELECT codigo, descricao'
      'FROM marcas'
      'WHERE codigo = :codigo')
    RequestLive = False
    Left = 193
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryProcuraMarcacodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryProcuraMarcadescricao: TStringField
      FieldName = 'descricao'
      Size = 15
    end
  end
  object dsrProcuraMarca: TtecDataSource
    DataSet = qryProcuraMarca
    Left = 193
    Top = 234
  end
  object qryConsultaMarcas: TtecQuery
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
      'SELECT descricao,codigo'
      'FROM marcas'
      'ORDER BY UPPER(TO_ASCII(descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 188
    Top = 287
    object qryConsultaMarcasdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 15
    end
    object qryConsultaMarcascodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
  object qryRelatorioProdutosClientes: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkFields = 'cliente=cliente;tipocliente=tipocliente'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrEnderecoCliente
    Constraints = <>
    BeforeOpen = qryRelatorioProdutosClientesBeforeOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'DadosFiscais'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NCMIsentoPISCOFINS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DadosFiscais_Servicos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NCMIsentoPISCOFINS_Servicos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contratos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ProdutosComNFEmitida_Faturados'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contratos_Servicos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DadosFiscais_FrentedeCaixa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Devolucoes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ProdutosComNFEmitida_Devolvido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Devolucoes_Servicos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Devolucoes_np'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Ordenacao'
        ParamType = ptUnknown
        Value = 'cliente'
      end>
    Sql.Strings = (
      ';SELECT * FROM'
      '('
      'select produtosclientes.*,'
      '       vf.rua,'
      '       (select b.nome'
      '        from bairros b'
      '        where b.estado = vf.estado and'
      '              b.cidade = vf.cidade and'
      '              b.codigo = vf.bairro) as bairro,'
      '       vf.cep,'
      '       (select c.nome'
      '        from cidades c'
      '        where c.estado = vf.estado and'
      '              c.codigo = vf.cidade) as cidade,'
      '       vf.pessoanumero,'
      
        '       coalesce(formatar_fone_fax(vf.foneddd, vf.fonenumero, vf.' +
        'foneramal)) as fone'
      'from'
      '('
      ''
      ''
      '  /* Produtos com notas/cupons emitidos */'
      '  ('
      '   select vendas.*,'
      '          cp.produto_cliente'
      '   from'
      '   ('
      '    select vendas.*,'
      '           n.serie,'
      '           n.numero as numeronota'
      '    from'
      '    ('
      '     select vendas.*,'
      '            cp.maquina,'
      '            cp.intervensao,'
      '            cp.numero as numerocupom'
      '     from'
      '     ('
      '      select ct.cliente,'
      '             ct.tipocliente,'
      '             ct.nome as nomecliente,'
      '             '
      '             ct.numero as contrato,'
      '             ct.pedidocliente,'
      '             ct.situacao,'
      '             ct.faturamento,'
      '             df.filialvenda,'
      '             pdf.dadofiscal,'
      '             df.data,'
      '             pdf.quantidade,'
      
        '             - ratearcreditotroca_dadosfiscais(pdf.dadofiscal, p' +
        'df.produto) as creditotroca,'
      '             pdf.produto,'
      '             p.codigovisual as produtovisual,'
      '             pdf.filial,'
      
        '             cast(btrim(p.descricao ||'#39' '#39'||coalesce(p.valorgrade' +
        '1,'#39#39')||'#39' '#39'||coalesce(p.valorgrade2,'#39#39')) as varchar(162)) as desc' +
        'ricao,'
      '             pdf.precovenda,'
      '             pdf.precotabela,'
      '             pdf.quantidade*pdf.precovenda as totalprecovenda,'
      '             pdf.quantidade*pdf.precotabela as totalprecotabela,'
      '             cast(null as date) as devolucao,'
      ''
      '             -((coalesce(pdf.desconto,0)+'
      '                coalesce(pdf.valordescontoitem,0)) -'
      '               coalesce(pdf.acrescimo,0)'
      '               ) as desconto,'
      ''
      ''
      '             cast('#39'V'#39' as char) as registro,'
      
        '             (select ipi.classificacaofiscal from ipi where ipi.' +
        'codigo = c.ipi) as ncm'
      ''
      '             '
      '      from (contratos ct'
      '            join (dadosfiscais df'
      '                  join (produtosdadosfiscais pdf'
      
        '                        join ((produtos p left join promocoes pr' +
        'o on p.promocao = pro.codigo)'
      '                              join (((caracteristicas c'
      '                                      join grupos g'
      '                                      on c.grupo = g.codigo)'
      ''
      '                                      join classes cl'
      '                                      on c.classe = cl.codigo)'
      ''
      '                                      join marcas m'
      '                                      on c.marca = m.codigo)'
      ''
      '                              on c.codigo = p.caracteristica)'
      '                        on pdf.produto = p.codigo)'
      '                  on pdf.dadofiscal = df.numero)'
      '            on df.contrato = ct.numero)'
      ''
      
        '      where ct.faturamento between (:datainicial) and (:datafina' +
        'l)'
      '        and ct.numero = df.contrato'
      '        and not coalesce(pdf.brinde,false)'
      '        and (coalesce(ct.valorvista,0)<>0)'
      '        and not coalesce(df.notavinculada,false)'
      
        '        and (eHNotaFiscalSaidaVenda(df.codigofiscal) or mod(df.c' +
        'odigofiscal,1000) in (929))'
      '        and ct.origem IS NULL'
      
        '        and case when ct.os then ct.tipoequipamento in (1,2) and' +
        ' not (coalesce(ct.os_garantia,false) and ct.os_garantia_status='#39 +
        'A'#39') and not coalesce(ct.os_cortesia,false) else true end'
      ''
      
        '            /*   ct.situacao in ('#39'N'#39','#39'P'#39') and - Rel vendas n'#227'o p' +
        'ossui esta restri'#231#227'o */'
      '            /*   df.situacao='#39'N'#39' and */'
      ''
      '         and case when ct.situacao = '#39'N'#39' then'
      '                  ct.situacao = df.situacao'
      #9'   else (case when ct.situacao='#39'C'#39' then'
      
        #9'         (case when coalesce((select sum(p.valorpagto) from par' +
        'celas p where p.contrato = ct.numero and p.tipopagto='#39'E'#39'),0) = c' +
        't.valorprazo then'
      
        #9#9#9'    df.numero = (select max(df2.numero) from dadosfiscais df2' +
        ' where df2.contrato = ct.numero)'
      #9#9' '#9' else df.situacao='#39'N'#39' end) else true end) end'
      ''
      '      %DadosFiscais'
      ''
      '      %NCMIsentoPISCOFINS'
      ''
      ''
      
        '     ) as vendas left join cupons cp on vendas.dadofiscal = cp.d' +
        'adofiscal'
      
        '    ) as vendas left join notas n on vendas.dadofiscal = n.dadof' +
        'iscal'
      
        '   ) as vendas left join clientesprodutos cp on vendas.cliente =' +
        ' cp.cliente'
      
        '                                            and vendas.tipoclien' +
        'te = cp.tipocliente'
      '  '#9#9#9#9#9'  and vendas.produto = cp.produto'
      ' )'
      ' '
      ' union all'
      ' '
      ' '
      '  /* Servi'#231'os com notas/cupons emitidos */'
      '  '
      '  ('
      '   select vendas.*,'
      '          cast(null as varchar(30)) as produto_cliente'
      '   from'
      '   ('
      '    select vendas.*,'
      '           n.serie,'
      '           n.numero as numeronota'
      '    from'
      '    ('
      '     select vendas.*,'
      '            cp.maquina,'
      '            cp.intervensao,'
      '            cp.numero as numerocupom'
      '     from'
      '     ('
      '      select ct.cliente,'
      '             ct.tipocliente,'
      '             ct.nome as nomecliente,'
      '             ct.numero as contrato,'
      '             ct.pedidocliente,'
      '             ct.situacao,'
      '             ct.faturamento,'
      '             df.filialvenda,'
      '             df.numero as dadofiscal,'
      '             df.data,'
      '             sdf.quantidade,'
      '             cast(null as numeric(11,2)) as creditotroca,'
      '             cast(sdf.servico as bigint) as produto,'
      '             cast(sdf.servico as varchar(30)) as produtovisual,'
      '             df.filialvenda as filial,'
      '             cast(s.descricao as varchar(162)) as descricao,'
      '             sdf.valorservico as precovenda,'
      '             s.valor as precotabela,'
      '             sdf.quantidade*sdf.valorservico as totalprecovenda,'
      '             sdf.quantidade*s.valor as totalprecotabela,'
      '             cast(null as date) as devolucao,'
      '             0.00 as desconto,'
      '             cast('#39'V'#39' as char) as registro,'
      '             cast(null as varchar(8)) as ncm'
      ''
      '             '
      '      from (contratos ct'
      '            join (dadosfiscais df'
      '                  join (Servicosdadosfiscais sdf'
      '                        join servicos s '
      '                        on sdf.produto = s.codigo)'
      '                  on sdf.dadofiscal = df.numero)'
      '            on df.contrato = ct.numero)'
      '            '
      '            join servicoscontratos sc'
      '            on ct.numero = sc.contrato'
      '            and sc.servico = sdf.servico'
      ''
      
        '      where ct.faturamento between (:Datainicial) and (:DataFina' +
        'l) and'
      '            ct.numero = df.contrato  and'
      
        '/*            ct.situacao in ('#39'N'#39','#39'P'#39') and - Rel vendas n'#227'o poss' +
        'ui esta restri'#231#227'o */'
      
        '            df.situacao='#39'N'#39' and not coalesce(df.notavinculada,fa' +
        'lse)'
      
        '            and (eHNotaFiscalSaidaVenda(df.codigofiscal) or mod(' +
        'df.codigofiscal,1000) in (929))'
      
        '            and case when ct.os then ct.tipoequipamento in (1,2)' +
        ' and not (coalesce(ct.os_garantia,false) and ct.os_garantia_stat' +
        'us='#39'A'#39') and not coalesce(ct.os_cortesia,false) else true end'
      ''
      '            %DadosFiscais_Servicos'
      ''
      '            %NCMIsentoPISCOFINS_Servicos'
      ''
      
        '     ) as vendas left join cupons cp on vendas.dadofiscal = cp.d' +
        'adofiscal'
      
        '    ) as vendas left join notas n on vendas.dadofiscal = n.dadof' +
        'iscal'
      '   ) as vendas '
      ' )'
      ' '
      ' '
      '  union all'
      '  '
      '  /*  Produtos contratos em situa'#231#227'o Parcial ou Faturado */'
      ' ('
      '  select produtos.cliente,'
      '         produtos.tipocliente,'
      '         produtos.nomecliente,'
      '         produtos.contrato,'
      '         produtos.pedidocliente,'
      '         produtos.situacao,'
      '         produtos.faturamento,'
      '         produtos.filialvenda,'
      '         cast(null as integer) as dadofiscal,'
      '         cast(null as date) as data,'
      
        '         produtos.quantidade - produtos.quantidade_entregue as q' +
        'uantidade,'
      
        '         ((produtos.creditotroca / produtos.quantidade) * (produ' +
        'tos.quantidade - produtos.quantidade_entregue)) as creditotroca,'
      '         produtos.produto,'
      '         produtos.produtovisual,'
      '         produtos.filial,'
      '         produtos.descricao,                  '
      '         produtos.precovenda,'
      '         produtos.precotabela,'
      
        '         (produtos.quantidade - produtos.quantidade_entregue) * ' +
        'produtos.precovenda as totalprecovenda,'
      
        '         (produtos.quantidade - produtos.quantidade_entregue) * ' +
        'produtos.precotabela as totalprecotabela,'
      '         cast(null as date) as devolucao,'
      '         produtos.desconto,'
      '         produtos.registro,'
      '         produtos.ncm,'
      '         cast(null as integer) as maquina,'
      '         cast(null as integer) as intervensao,'
      '         cast(null as integer) as numerocupom,'
      '         cast(null as varchar(3)) as serie,'
      '         cast(null as integer) as numeronota,'
      '         cp.produto_cliente'
      '  from'
      '  ('
      '    select produtos.*'
      '    from'
      '    ('
      '     select ct.cliente,'
      '            ct.tipocliente,'
      '            ct.nome as nomecliente,'
      '            ct.numero as contrato,'
      '            ct.pedidocliente,'
      '            ct.situacao,'
      '            ct.faturamento,'
      '            ct.filialvenda,'
      '            pc.quantidade,'
      
        '            - ratearcreditotroca_contratos(pc.contrato, pc.produ' +
        'to) as creditotroca,'
      '            case when ct.situacao = '#39'P'#39' then'
      
        '              produtoscontratos_qtdeentregue(coalesce(ct.primoge' +
        'nito, ct.numero),pc.produto,pc.filial)'
      
        '            else cast(0 as Numeric(9,3)) end as quantidade_entre' +
        'gue,'
      '            pc.produto,'
      '            p.codigovisual as produtovisual,'
      '            pc.filial,'
      
        '            cast(btrim(p.descricao ||'#39' '#39'||coalesce(p.valorgrade1' +
        ','#39#39')||'#39' '#39'||coalesce(p.valorgrade2,'#39#39')) as varchar(162)) as descr' +
        'icao,'
      '            pc.precovenda,'
      '            pc.precotabela,'
      ''
      
        '/*            - (rateardesconto(ct.numero, cast(pc.produto as bi' +
        'gint)) + coalesce(pc.valordescontoitem,0)) as desconto,*/'
      ''
      '            - ((coalesce(pc.desconto) +'
      '                coalesce(pc.valordescontoitem,0)) -'
      '                coalesce(pc.acrescimo,0)) as desconto,'
      ''
      '  '#9'  cast('#39'V'#39' as char) as registro,'
      
        '           (select ipi.classificacaofiscal from ipi where ipi.co' +
        'digo = c.ipi) as ncm'
      ''
      '     from (contratos ct'
      '           join (produtoscontratos pc'
      
        '                 join ((produtos p left join promocoes pro on p.' +
        'promocao = pro.codigo)'
      '                       join (((caracteristicas c'
      '                               join grupos g'
      '                               on c.grupo = g.codigo)'
      ''
      '                               join classes cl'
      '                               on c.classe = cl.codigo)'
      ''
      '                               join marcas m'
      '                               on c.marca = m.codigo)'
      ''
      '                       on c.codigo = p.caracteristica)'
      '                 on p.codigo = pc.produto)'
      '           on pc.contrato = ct.numero)'
      ''
      
        '     where ct.faturamento between (:DataInicial) and (:DataFinal' +
        ') and'
      ''
      '           ct.situacao in ('#39'P'#39','#39'F'#39','#39'C'#39')'
      
        '           and case when ct.os then ct.tipoequipamento in (1,2) ' +
        'and not (coalesce(ct.os_garantia,false) and ct.os_garantia_statu' +
        's='#39'A'#39') and not coalesce(ct.os_cortesia,false) else true end'
      '           and case when ct.situacao = '#39'C'#39' then'
      '             not exists (select df2.contrato'
      '                         from dadosfiscais df2'
      
        '                         where df2.contrato = ct.numero) else tr' +
        'ue end'
      ''
      ''
      '          %Contratos'
      ''
      '          %NCMIsentoPISCOFINS'
      ''
      '          %ProdutosComNFEmitida_Faturados'
      ''
      '    ) as produtos'
      '    where (quantidade-quantidade_entregue)<>0'
      
        '  ) as produtos left join clientesprodutos cp on produtos.client' +
        'e = cp.cliente'
      
        '                                             and produtos.tipocl' +
        'iente = cp.tipocliente'
      '  '#9#9#9#9#9'     and produtos.produto = cp.produto'
      ' )'
      ' '
      ' union all'
      ' '
      '  '
      
        '  /*  Servi'#231'os contratos em situa'#231#227'o Parcial (n'#227'o existe) ou Fat' +
        'urado */'
      ' ('
      ' '
      '  select produtos.cliente,'
      '         produtos.tipocliente,'
      '         produtos.nomecliente,'
      '         produtos.contrato,'
      '         produtos.pedidocliente,'
      '         produtos.situacao,'
      '         produtos.faturamento,'
      '         produtos.filialvenda,'
      '         cast(null as integer) as dadofiscal,'
      '         cast(null as date) as data,'
      '         produtos.quantidade,'
      '         cast(null as numeric(11,2)) as creditotroca,'
      '         cast(produtos.servico as bigint) as produto,'
      '         cast(produtos.servico as varchar(30)) as produtovisual,'
      '         produtos.filial,'
      '         produtos.descricao,                  '
      '         produtos.precovenda,'
      '         produtos.precotabela,'
      '         produtos.totalprecovenda,'
      '         produtos.totalprecotabela,'
      '         cast(null as date) as devolucao,'
      '         produtos.desconto,'
      '         produtos.registro,'
      '         produtos.ncm,'
      '         cast(null as integer) as maquina,'
      '         cast(null as integer) as intervensao,'
      '         cast(null as integer) as numerocupom,'
      '         cast(null as varchar(3)) as serie,'
      '         cast(null as integer) as numeronota,'
      '         cast(null as varchar(30)) as produto_cliente'
      '  from'
      '  ('
      '     select ct.cliente,'
      '            ct.tipocliente,'
      '            ct.nome as nomecliente,'
      '            ct.numero as contrato,'
      '            ct.pedidocliente,'
      '            ct.situacao,'
      '            ct.faturamento,'
      '            ct.filialvenda,'
      '            sc.quantidade,'
      '            sc.servico,'
      '            ct.filialvenda as filial,'
      '            s.descricao,'
      '            '
      '            sc.valorservico as precovenda,'
      '            s.valor as precotabela,'
      '            sc.quantidade*sc.valorservico as totalprecovenda,'
      '            sc.quantidade*s.valor as totalprecotabela,'
      '            '
      '            0.00 as desconto,'
      '  '#9'        cast('#39'V'#39' as char) as registro,'
      ''
      '            cast(null as varchar(8)) as ncm'
      ''
      ''
      '     from (contratos ct'
      '           join (servicoscontratos sc'
      '                 join servicos s'
      '                 on s.codigo = sc.servico)'
      '           on sc.contrato = ct.numero)'
      ''
      
        '     where ct.faturamento between (:DataInicial) and (:DataFinal' +
        ') and'
      '           ct.situacao in (/*'#39'P'#39',*/'#39'F'#39')'
      
        '           and case when ct.os then ct.tipoequipamento in (1,2) ' +
        'and not (coalesce(ct.os_garantia,false) and ct.os_garantia_statu' +
        's='#39'A'#39') and not coalesce(ct.os_cortesia,false) else true end'
      ''
      '          %Contratos_Servicos'
      ''
      '          %NCMIsentoPISCOFINS_Servicos'
      ''
      '          %ProdutosComNFEmitida_Faturados'
      ''
      '  ) as produtos'
      ' )'
      ''
      '  '
      ' union all'
      ' '
      ' /* produtos com vendas sem contrato */'
      ' '
      ' ('
      '   select vendas.*,'
      '          cp.produto_cliente'
      '   from'
      '   ('
      '    select vendas.*,'
      '           n.serie,'
      '           n.numero as numeronota'
      '    from'
      '    ('
      '     select vendas.*,'
      '            cp.maquina,'
      '            cp.intervensao,'
      '            cp.numero as numerocupom'
      '     from'
      '     ('
      '      select df.cliente,'
      '             df.tipocliente,'
      '             df.nome as nomecliente,'
      '             df.contrato,'
      '             cast(null as varchar(35)) as pedidocliente,'
      '             cast(null as char(1)) as situacao,'
      '             df.data as faturamento,'
      '             df.filialvenda,'
      '             pdf.dadofiscal,'
      '             df.data,'
      '             pdf.quantidade,'
      
        '             - ratearcreditotroca_dadosfiscais(pdf.dadofiscal, p' +
        'df.produto) as creditotroca,'
      '             pdf.produto,'
      '             p.codigovisual as produtovisual,'
      '             pdf.filial,'
      
        '             cast(btrim(p.descricao ||'#39' '#39'||coalesce(p.valorgrade' +
        '1,'#39#39')||'#39' '#39'||coalesce(p.valorgrade2,'#39#39')) as varchar(162)) as desc' +
        'ricao,'
      '             pdf.precovenda,'
      '             pdf.precotabela,'
      '             pdf.quantidade*pdf.precovenda as totalprecovenda,'
      '             pdf.quantidade*pdf.precotabela as totalprecotabela,'
      '             cast(null as date) as devolucao,'
      ''
      ''
      '             -((coalesce(pdf.desconto,0)+'
      '                coalesce(pdf.valordescontoitem,0)) -'
      '               coalesce(pdf.acrescimo,0)'
      '               ) as desconto,'
      ''
      ''
      '             cast('#39'V'#39' as char) as registro,'
      
        '             (select ipi.classificacaofiscal from ipi where ipi.' +
        'codigo = c.ipi) as ncm'
      ''
      '      from (dadosfiscais df'
      #9'    join (produtosdadosfiscais pdf'
      
        #9#9'  join ((produtos p left join promocoes pro on p.promocao = pr' +
        'o.codigo)'
      #9#9#9'join (((caracteristicas c'
      '                                join grupos g'
      '                                on c.grupo = g.codigo)'
      ''
      '                                join classes cl'
      '                                on c.classe = cl.codigo)'
      ''
      '                                join marcas m'
      '                                on c.marca = m.codigo)'
      ''
      #9#9#9'on c.codigo = p.caracteristica)'
      '                  on pdf.produto = p.codigo)'
      '            on pdf.dadofiscal = df.numero)'
      ''
      '      where df.data between :Datainicial and :DataFinal'
      #9'    and df.contrato is null'
      #9#9'and df.situacao='#39'N'#39
      #9#9'and not coalesce(df.notavinculada,false)'
      ''
      
        '    and (eHNotaFiscalSaidaVenda(df.codigofiscal) or mod(df.codig' +
        'ofiscal,1000) in (929))'
      ''
      '            %DadosFiscais_FrentedeCaixa'
      ''
      '            %NCMIsentoPISCOFINS'
      ''
      
        '     ) as vendas left join cupons cp on vendas.dadofiscal = cp.d' +
        'adofiscal'
      
        '    ) as vendas left join notas n on vendas.dadofiscal = n.dadof' +
        'iscal'
      
        '   ) as vendas left join clientesprodutos cp on vendas.cliente =' +
        ' cp.cliente'
      
        '                                            and vendas.tipoclien' +
        'te = cp.tipocliente'
      '  '#9#9#9#9#9'  and vendas.produto = cp.produto'
      ' )'
      ''
      ''
      ' union all'
      ' '
      ' /* produtos com devolu'#231#227'o em contratosdevolvidos */'
      ' '
      ' ('
      '  select devolucoes.*,'
      '       cast(null as integer) as maquina,'
      '       cast(null as integer) as intervensao,'
      '       cast(null as integer) as numerocupom,'
      '       cast(null as varchar(3)) as serie,'
      '       cast(null as integer) as numeronota,'
      '       cp.produto_cliente'
      '  from'
      '  ('
      '   select ct.cliente,'
      '          ct.tipocliente,'
      '          ct.nome as nomecliente,'
      '          ct.numero as contrato,'
      '          ct.pedidocliente,'
      '          cd.situacao,'
      '          ct.faturamento,'
      '          ct.filialvenda,'
      #9'      cast(null as integer) as dadofiscal,'
      #9'      cast(null as date) as data,'
      '          -cd.quantidade as quantidade,'
      '          cd.creditotroca,'
      '          cd.produto,'
      '          p.codigovisual as produtovisual,'
      '          cd.filial,'
      
        '          cast(btrim(p.descricao ||'#39' '#39'||coalesce(p.valorgrade1,'#39 +
        #39')||'#39' '#39'||coalesce(p.valorgrade2,'#39#39')) as varchar(162)) as descric' +
        'ao,'
      
        '          -((cd.valorvista-cd.frete-cd.seguro+cd.desconto+cd.val' +
        'ordescontoitem)/cd.quantidade) as precovenda,'
      '          cast(null as numeric(15,2)) as precotabela,'
      ''
      
        '          -(cd.valorvista-cd.frete-cd.seguro+cd.desconto+cd.valo' +
        'rdescontoitem) as totalprecovenda,'
      ''
      '          cast(null as numeric(15,2)) as totalprecotabela,'
      '          cd.devolucao,'
      ''
      '          ((coalesce(cd.desconto,0)+'
      '              coalesce(cd.valordescontoitem,0)) -'
      '             (cd.valorvista - cd.valorprazo)) as desconto,'
      ''
      ''
      '          cast('#39'D'#39' as char) as registro,'
      
        '          (select ipi.classificacaofiscal from ipi where ipi.cod' +
        'igo = c.ipi) as ncm'
      ''
      '   from (contratos ct'
      '         join (contratosdevolvidos cd'
      
        '               join ((produtos p left join promocoes pro on p.pr' +
        'omocao = pro.codigo)'
      '                     join (((caracteristicas c'
      '                             join grupos g'
      '                             on c.grupo = g.codigo)'
      ''
      '                             join classes cl'
      '                             on c.classe = cl.codigo)'
      ''
      '                             join marcas m'
      '                             on c.marca = m.codigo)'
      ''
      '                     on c.codigo = p.caracteristica)'
      '               on p.codigo = cd.produto)'
      '         on ct.numero = cd.contrato)'
      ''
      '   where :IncluirDevolucoes'
      '     and ct.situacao in ('#39'N'#39','#39'P'#39','#39'F'#39','#39'C'#39') '
      '     and cd.devolucao between (:DataInicial) and (:DataFinal)'
      '     and cd.tipo = '#39'D'#39
      
        '     and case when ct.os then ct.tipoequipamento in (1,2) and no' +
        't (coalesce(ct.os_garantia,false) and ct.os_garantia_status='#39'A'#39')' +
        ' and not coalesce(ct.os_cortesia,false) else true end'
      ''
      '             %Devolucoes'
      ''
      '             %NCMIsentoPISCOFINS'
      ''
      '             %ProdutosComNFEmitida_Devolvido'
      ''
      
        '   ) as devolucoes left join clientesprodutos cp on devolucoes.c' +
        'liente = cp.cliente'
      
        '                                             and devolucoes.tipo' +
        'cliente = cp.tipocliente'
      '  '#9#9#9#9#9'     and devolucoes.produto = cp.produto'
      '  )'
      ''
      ''
      '    union all'
      ''
      '  /* Produtos contratos cancelados */'
      ''
      '    ('
      ''
      ''
      '        SELECT produtos.*'
      '        from'
      '        ('
      '        select produtos.*'
      '         from'
      '        ('
      ''
      '         select ct.cliente,'
      '                ct.tipocliente,'
      '                ct.nome as nomecliente,'
      '                ct.numero as contrato,'
      '                ct.pedidocliente,'
      '                ct.situacao,'
      '                ct.faturamento,'
      '                ct.filialvenda,'
      '                cast(null as integer) as dadofiscal,'
      '                cast(null as date) as data,'
      '                -pc.quantidade,'
      
        '                ratearcreditotroca_contratos(pc.contrato, pc.pro' +
        'duto) as creditotroca,'
      '                pc.produto,'
      '                p.codigovisual as produtovisual,'
      '                pc.filial,'
      
        '                cast(btrim(p.descricao ||'#39' '#39'||coalesce(p.valorgr' +
        'ade1,'#39#39')||'#39' '#39'||coalesce(p.valorgrade2,'#39#39')) as varchar(162)) as d' +
        'escricao,'
      '                - pc.precovenda,'
      '                cast(null as numeric(15,2)) as precotabela,'
      ''
      
        '                - (pc.quantidade*pc.precovenda) as totalprecoven' +
        'da,'
      ''
      '                cast(null as numeric(15,2)) as totalprecotabela,'
      '                cancelados.datapagto as devolucao,'
      ''
      '              ((coalesce(pc.desconto,0)+'
      '              coalesce(pc.valordescontoitem,0)) -'
      '                coalesce(pc.acrescimo,0)) as desconto,'
      ''
      '              cast('#39'D'#39' as char) as registro,'
      ''
      
        '             (select ipi.classificacaofiscal from ipi where ipi.' +
        'codigo = c.ipi) as ncm,'
      ''
      '       cast(null as integer) as maquina,'
      '       cast(null as integer) as intervensao,'
      '       cast(null as integer) as numerocupom,'
      '       cast(null as varchar(3)) as serie,'
      '       cast(null as integer) as numeronota,'
      '             '
      ''
      '             (select cp.produto_cliente'
      '              from clientesprodutos cp'
      '              where cp.cliente = ct.cliente'
      '                and cp.tipocliente = ct.tipocliente'
      '                and cp.produto = pc.produto) as produto_cliente'
      ''
      ''
      '          from'
      ''
      '        ('
      '        select distinct p.*'
      '        from'
      '        (select p.contrato, p.datapagto'
      '         from parcelas p'
      '         where p.datapagto between :datainicial and :datafinal'
      
        '          and p.tipopagto='#39'E'#39') as p join contratos ct on p.contr' +
        'ato = ct.numero'
      '        where ct.situacao='#39'C'#39
      '          AND (coalesce(ct.valorvista,0)<>0)'
      '          and ct.origem is NULL'
      
        '          and case when ct.os then ct.tipoequipamento in (1,2) a' +
        'nd not (coalesce(ct.os_garantia,false) and ct.os_garantia_status' +
        '='#39'A'#39') and not coalesce(ct.os_cortesia,false) else true end'
      '          and not exists (select cd.contrato'
      '                          from contratosdevolvidos cd'
      '                           where cd.contrato = ct.numero'
      '                             and cd.tipo='#39'D'#39')'
      '        ) as cancelados, (contratos ct join'
      '                                   (produtoscontratos pc'
      '                                        join (produtos p'
      
        '                                                join (((caracter' +
        'isticas c join marcas m on c.marca = m.codigo)'
      
        '                                                                ' +
        '         join classes cl'#9'on c.classe = cl.codigo)'
      
        '                                                                ' +
        '         join grupos g on g.codigo=c.grupo)'
      
        '                                                on p.caracterist' +
        'ica = c.codigo)'
      '                                        on pc.produto=p.codigo)'
      '                                on pc.contrato = ct.numero)'
      '         where cancelados.contrato = ct.numero'
      ''
      '     %Contratos'
      ''
      '     %NCMIsentoPISCOFINS'
      ''
      '     %ProdutosComNFEmitida_Faturados'
      ''
      ''
      ''
      '        order by pc.contrato, pc.produto, pc.filial'
      '        ) as produtos /* left join (SELECT sc.contrato,'
      
        '                                        coalesce(SUM(sc.quantida' +
        'de*sc.valorservico),0) as totalservico'
      
        '                                 FROM contratos ct, servicoscont' +
        'ratos sc'
      '                                 WHERE sc.contrato = ct.numero'
      
        '                                   AND ct.faturamento BETWEEN(:D' +
        'ataInicial) and (:DataFinal)'
      
        '                                   AND (coalesce(ct.valorvista,0' +
        ')<>0)'
      '                                   and ct.origem IS NULL'
      
        '                                   and case when ct.os then ct.t' +
        'ipoequipamento in (1,2) and not (coalesce(ct.os_garantia,false) ' +
        'and ct.os_garantia_status='#39'A'#39') and not coalesce(ct.os_cortesia,f' +
        'alse) else true end'
      ''
      
        '                                 group by sc.contrato) as sc on ' +
        'sc.contrato = produtos.vcontrato */'
      
        '        ) as produtos /*, movimentos WHERE numero=(SELECT max(nu' +
        'mero)'
      '                                                FROM movimentos'
      
        '                                                WHERE produto=vP' +
        'roduto'
      
        '                                                  AND   filial=v' +
        'Filial'
      
        '                                                  AND   cast(dat' +
        'a as date)=vfaturamento)*/'
      ''
      '    )'
      ''
      ''
      ' union all'
      ''
      ''
      ' /* servi'#231'os com devolu'#231#227'o em contratosdevolvidos */'
      ''
      ' ('
      '  select devolucoes.*,'
      '       cast(null as integer) as maquina,'
      '       cast(null as integer) as intervensao,'
      '       cast(null as integer) as numerocupom,'
      '       cast(null as varchar(3)) as serie,'
      '       cast(null as integer) as numeronota,'
      '       cast(null as varchar(30)) as produto_cliente'
      '  from'
      '  ('
      '   select ct.cliente,'
      '          ct.tipocliente,'
      '          ct.nome as nomecliente,'
      '          '
      '          ct.numero as contrato,'
      '          ct.pedidocliente,'
      '          cd.situacao,'
      '          ct.faturamento,'
      '          ct.filialvenda,'
      #9'      cast(null as integer) as dadofiscal,'
      #9'      cast(null as date) as data,'
      '          -cd.quantidade as quantidade,'
      '          cast(null as numeric(12,2)) as creditotroca,'
      '          cast(cd.servico as bigint) as produto,'
      '          cast(cd.servico as varchar(30)) as produtovisual,'
      '          cd.filial,'
      '          s.descricao,'
      
        '          -((cd.valorvista-cd.frete-cd.seguro+cd.desconto+cd.val' +
        'ordescontoitem)/cd.quantidade) as precovenda,'
      '          cast(null as numeric(15,2)) as precotabela,'
      
        '          -(cd.valorvista-cd.frete-cd.seguro+cd.desconto+cd.valo' +
        'rdescontoitem) as totalprecovenda,'
      '          cast(null as numeric(15,2)) as totalprecotabela,'
      '          cd.devolucao,'
      '    '#9'  0.00 as desconto,'
      '          cast('#39'D'#39' as char) as registro,'
      '          cast(null as varchar(8)) as ncm          '
      ''
      '   from (contratos ct'
      '         join (contratosdevolvidos cd'
      '               join servicos s'
      '               on s.codigo = cd.servico)'
      '         on ct.numero = cd.contrato)'
      ''
      '   where :IncluirDevolucoes'
      '     and ct.situacao in ('#39'N'#39','#39'P'#39','#39'F'#39','#39'C'#39') '
      '     and cd.devolucao between (:DataInicial) and (:DataFinal)'
      '     and cd.tipo = '#39'D'#39
      
        '     and case when ct.os then ct.tipoequipamento in (1,2) and no' +
        't (coalesce(ct.os_garantia,false) and ct.os_garantia_status='#39'A'#39')' +
        ' and not coalesce(ct.os_cortesia,false) else true end'
      ''
      '             %Devolucoes_Servicos'
      ''
      '             %NCMIsentoPISCOFINS_Servicos'
      ''
      '             %ProdutosComNFEmitida_Devolvido'
      ''
      '   ) as devolucoes'
      '  )'
      ' '
      ''
      ' union all'
      ''
      ' ('
      '  select devolucoes.*,'
      '       cast(null as integer) as maquina,'
      '       cast(null as integer) as intervensao,'
      '       cast(null as integer) as numerocupom,'
      '       cast(null as varchar(3)) as serie,'
      '       cast(null as integer) as numeronota,'
      '       cp.produto_cliente'
      '  from'
      '  ('
      '   select np.fornecedor as cliente,'
      '          np.tipofornecedor as tipocliente,'
      '          vf.nome as nomecliente,'
      '          np.contrato,'
      '          cast(null as varchar(35)) as pedidocliente,'
      '          np.situacao,'
      '          np.data as faturamento,'
      '          np.filial as filialvenda,'
      #9'      cast(null as integer) as dadofiscal,'
      #9'      cast(null as date) as data,'
      '          -pnp.quantidade as quantidade,'
      '          cast(null as numeric(12,2)) as creditotroca,'
      '          pnp.produto,'
      '          p.codigovisual as produtovisual,'
      '          np.filial,'
      
        '          cast(btrim(p.descricao ||'#39' '#39'||coalesce(p.valorgrade1,'#39 +
        #39')||'#39' '#39'||coalesce(p.valorgrade2,'#39#39')) as varchar(162)) as descric' +
        'ao,'
      '          -pnp.precounitario as precovenda,'
      '          cast(null as numeric(15,2)) as precotabela,'
      
        '          -pnp.precounitario * pnp.quantidade as totalprecovenda' +
        ','
      '          cast(null as numeric(15,2)) as totalprecotabela,'
      '          np.data as devolucao,'
      ''
      '          (coalesce(pnp.valordescontoitem,0) +'
      '           coalesce(pnp.desconto,0)) -'
      '           coalesce(pnp.acrescimo,0) as desconto,'
      ''
      ''
      '          cast('#39'D'#39' as char) as registro,'
      
        '          (select ipi.classificacaofiscal from ipi where ipi.cod' +
        'igo = c.ipi) as ncm'
      ''
      '            '
      '     from ((notaspag np'
      '           join vfornecedores vf'
      '           on np.fornecedor = vf.codigo and'
      '              np.tipofornecedor = vf.tipo)'
      ''
      '           join (produtosnotaspag pnp'
      
        #9#9' join ((produtos p left join promocoes pro on p.promocao = pro' +
        '.codigo)'
      #9#9'       join (((caracteristicas c'
      '                               join grupos g'
      '                               on c.grupo = g.codigo)'
      ''
      '                               join classes cl'
      '                               on c.classe = cl.codigo)'
      ''
      '                               join marcas m'
      '                               on c.marca = m.codigo)'
      ''
      '              '#9'       on c.codigo = p.caracteristica)'
      '                 on pnp.produto = p.codigo)'
      '           on pnp.codigonota = np.codigo)'
      ''
      ''
      '     Where :IncluirDevolucoes'
      
        '       and (np.data between (:DataInicial) and (:DataFinal) and ' +
        'np.situacao='#39'N'#39')'
      '       and np.contrato is null'
      '       and ehnotafiscalentradadevolucao(np.codigofiscal)'
      '       and :IncluirDevolucoesSemContrato'
      ''
      '             %Devolucoes_np'
      ''
      '             %NCMIsentoPISCOFINS'
      ''
      
        '   ) as devolucoes left join clientesprodutos cp on devolucoes.c' +
        'liente = cp.cliente'
      
        '                                             and devolucoes.tipo' +
        'cliente = cp.tipocliente'
      '  '#9#9#9#9#9'     and devolucoes.produto = cp.produto'
      '  )'
      '  '
      ''
      ''
      
        ' ) as produtosclientes  left join vfornecedores vf on produtoscl' +
        'ientes.cliente = vf.codigo and'
      
        '                                               produtosclientes.' +
        'tipocliente = vf.tipo'
      ''
      ') AS rpc'
      ''
      'ORDER BY UPPER(TO_ASCII(NomeCliente,'#39'LATIN1'#39')),'
      '         cliente,tipocliente,'
      '         '
      '         %Ordenacao')
    RequestLive = False
    Left = 264
    Top = 352
    ParamData = <
      item
        DataType = ftString
        Name = 'Datainicial'
        ParamType = ptUnknown
        Value = #39'2008-01-01'#39
      end
      item
        DataType = ftString
        Name = 'DataFinal'
        ParamType = ptUnknown
        Value = #39'2008-01-15'#39
      end
      item
        DataType = ftUnknown
        Name = 'IncluirDevolucoes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IncluirDevolucoesSemContrato'
        ParamType = ptUnknown
      end>
    object qryRelatorioProdutosClientescliente: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object qryRelatorioProdutosClientestipocliente: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
    object qryRelatorioProdutosClientesnomecliente: TStringField
      FieldName = 'nomecliente'
      Size = 40
    end
    object qryRelatorioProdutosClientesfone: TStringField
      FieldName = 'fone'
      Size = 50
    end
    object qryRelatorioProdutosClientescontrato: TStringField
      FieldName = 'contrato'
    end
    object qryRelatorioProdutosClientesfaturamento: TDateField
      Alignment = taCenter
      FieldName = 'faturamento'
      EditMask = '99/99/9999;1; '
    end
    object qryRelatorioProdutosClientesfilialvenda: TIntegerField
      FieldName = 'filialvenda'
      DisplayFormat = '0'
    end
    object qryRelatorioProdutosClientesserie: TStringField
      FieldName = 'serie'
      Size = 3
    end
    object qryRelatorioProdutosClientesnumeronota: TIntegerField
      FieldName = 'numeronota'
      DisplayFormat = '0'
    end
    object qryRelatorioProdutosClientesmaquina: TIntegerField
      FieldName = 'maquina'
      DisplayFormat = '0'
    end
    object qryRelatorioProdutosClientesintervensao: TIntegerField
      FieldName = 'intervensao'
      DisplayFormat = '0'
    end
    object qryRelatorioProdutosClientesnumerocupom: TIntegerField
      FieldName = 'numerocupom'
      DisplayFormat = '0'
    end
    object qryRelatorioProdutosClientesdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object qryRelatorioProdutosClientesquantidade: TFloatField
      FieldName = 'quantidade'
      DisplayFormat = '0'
    end
    object qryRelatorioProdutosClientesproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryRelatorioProdutosClientesprodutovisual: TStringField
      FieldName = 'produtovisual'
      Size = 30
    end
    object qryRelatorioProdutosClientesfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryRelatorioProdutosClientesdescricao: TStringField
      DisplayWidth = 122
      FieldName = 'descricao'
      Size = 162
    end
    object qryRelatorioProdutosClientesprecovenda: TFloatField
      FieldName = 'precovenda'
      DisplayFormat = '0.00'
    end
    object qryRelatorioProdutosClientesrua: TStringField
      FieldName = 'rua'
      Size = 100
    end
    object qryRelatorioProdutosClientesbairro: TStringField
      FieldName = 'bairro'
      Size = 80
    end
    object qryRelatorioProdutosClientescep: TIntegerField
      FieldName = 'cep'
      DisplayFormat = '0'
    end
    object qryRelatorioProdutosClientescidade: TStringField
      FieldName = 'cidade'
      Size = 80
    end
    object qryRelatorioProdutosClientespessoanumero: TStringField
      FieldName = 'pessoanumero'
      Size = 11
    end
    object qryRelatorioProdutosClientessituacao: TStringField
      FieldName = 'situacao'
      Size = 50
    end
    object qryRelatorioProdutosClientesdevolucao: TDateField
      Alignment = taCenter
      FieldName = 'devolucao'
      EditMask = '99/99/9999;1; '
    end
    object qryRelatorioProdutosClientesregistro: TStringField
      FieldName = 'registro'
      Size = 1
    end
    object qryRelatorioProdutosClientesdesconto: TFloatField
      FieldName = 'desconto'
      DisplayFormat = '0.00'
    end
    object qryRelatorioProdutosClientespedidocliente: TStringField
      FieldName = 'pedidocliente'
      Size = 50
    end
    object qryRelatorioProdutosClientesproduto_cliente: TStringField
      FieldName = 'produto_cliente'
      Size = 50
    end
    object qryRelatorioProdutosClientesprecotabela: TFloatField
      FieldName = 'precotabela'
      DisplayFormat = '0.00'
    end
    object qryRelatorioProdutosClientestotalprecovenda: TFloatField
      FieldName = 'totalprecovenda'
      DisplayFormat = '0.00'
    end
    object qryRelatorioProdutosClientestotalprecotabela: TFloatField
      FieldName = 'totalprecotabela'
      DisplayFormat = '0.00'
    end
    object qryRelatorioProdutosClientesncm: TStringField
      FieldName = 'ncm'
      Size = 50
    end
    object qryRelatorioProdutosClientescreditotroca: TFloatField
      FieldName = 'creditotroca'
    end
  end
  object qryEnderecoCliente: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeOpen = qryEnderecoClienteBeforeOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'DadosFiscais'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NCMIsentoPISCOFINS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DadosFiscais_Servicos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NCMIsentoPISCOFINS_Servicos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contratos_Servicos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ProdutosComNFEmitida_Faturados'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contratos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DadosFiscais_FrentedeCaixa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Devolucoes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ProdutosComNFEmitida_Devolvido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Devolucoes_Servicos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Devolucoes_np'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';SELECT * FROM'
      '('
      'select distinct produtosclientes.*,'
      '       vf.nome as nomecliente,'
      
        '       coalesce(formatar_fone_fax(vf.foneddd, vf.fonenumero, vf.' +
        'foneramal)) as fone,'
      '       vf.rua,'
      '       (select b.nome'
      '        from bairros b'
      '        where b.estado = vf.estado and'
      '              b.cidade = vf.cidade and'
      '              b.codigo = vf.bairro) as bairro,'
      '       vf.cep,'
      '       (select c.nome'
      '        from cidades c'
      '        where c.estado = vf.estado and'
      '              c.codigo = vf.cidade) as cidade,'
      '       vf.pessoanumero'
      'from'
      '('
      ' ('
      ''
      ' /* Produtos com notas/cupons emitidos */'
      ' '
      '  ('
      '  select distinct ct.cliente,'
      '                  ct.tipocliente'
      
        '  from (((contratos ct join vfornecedores vf on ct.cliente = vf.' +
        'codigo and ct.tipocliente = vf.tipo)'
      '         join (dadosfiscais df '
      #9#9'       join (produtosdadosfiscais pdf'
      
        '                     join ((produtos p left join promocoes pro o' +
        'n p.promocao = pro.codigo)'
      '                              join (((caracteristicas c'
      '                                      join grupos g'
      '                                      on c.grupo = g.codigo)'
      ''
      '                                      join classes cl'
      '                                      on c.classe = cl.codigo)'
      ''
      '                                      join marcas m'
      '                                      on c.marca = m.codigo) '
      #9#9#9#9#9#9'   on c.codigo = p.caracteristica) '
      #9#9#9#9'     on pdf.produto = p.codigo)'
      '               on pdf.dadofiscal = df.numero) '
      #9#9' on df.contrato = ct.numero))'
      ''
      
        '      where ct.faturamento between (:datainicial) and (:datafina' +
        'l)'
      '        and ct.numero = df.contrato'
      '        and not coalesce(pdf.brinde,false)'
      '        and (coalesce(ct.valorvista,0)<>0)'
      '        and not coalesce(df.notavinculada,false)'
      
        '        and (eHNotaFiscalSaidaVenda(df.codigofiscal) or mod(df.c' +
        'odigofiscal,1000) in (929))'
      '        and ct.origem IS NULL'
      
        '        and case when ct.os then ct.tipoequipamento in (1,2) and' +
        ' not (coalesce(ct.os_garantia,false) and ct.os_garantia_status='#39 +
        'A'#39') and not coalesce(ct.os_cortesia,false) else true end'
      ''
      
        '            /*   ct.situacao in ('#39'N'#39','#39'P'#39') and - Rel vendas n'#227'o p' +
        'ossui esta restri'#231#227'o */'
      '            /*   df.situacao='#39'N'#39' and */'
      ''
      '         and case when ct.situacao = '#39'N'#39' then'
      '                  ct.situacao = df.situacao'
      #9'   else (case when ct.situacao='#39'C'#39' then'
      
        #9'         (case when coalesce((select sum(p.valorpagto) from par' +
        'celas p where p.contrato = ct.numero and p.tipopagto='#39'E'#39'),0) = c' +
        't.valorprazo then'
      
        #9#9#9'    df.numero = (select max(df2.numero) from dadosfiscais df2' +
        ' where df2.contrato = ct.numero)'
      #9#9' '#9' else df.situacao='#39'N'#39' end) else true end) end'
      ''
      '      %DadosFiscais'
      ''
      '      %NCMIsentoPISCOFINS'
      ''
      ''
      '   )          '
      '            '
      '  union '
      '  '
      '  /* Servi'#231'os com notas/cupons emitidos */'
      '  '
      '  '
      '   ('
      '         select distinct vendas.cliente, vendas.tipocliente'
      '         from'
      '         ('
      '          select ct.cliente,'
      '                 ct.tipocliente,'
      '                 ct.nome as nomecliente,'
      '                 ct.numero as contrato,'
      '                 ct.pedidocliente,'
      '                 ct.situacao,'
      '                 ct.faturamento,'
      '                 df.filialvenda,'
      '                 df.numero as dadofiscal,'
      '                 df.data,'
      '                 sdf.quantidade,'
      '                 cast(sdf.servico as bigint) as produto,'
      
        '                 cast(sdf.servico as varchar(30)) as produtovisu' +
        'al,'
      '                 df.filialvenda as filial,'
      '                 cast(s.descricao as varchar(162)) as descricao,'
      '                 sdf.valorservico as precovenda,'
      '                 s.valor as precotabela,'
      
        '                 sdf.quantidade*sdf.valorservico as totalprecove' +
        'nda,'
      '                 sdf.quantidade*s.valor as totalprecotabela,'
      '                 cast(null as date) as devolucao,'
      '                 0.00 as desconto,'
      '                 cast('#39'V'#39' as char) as registro,'
      '                 cast(null as varchar(8)) as ncm'
      ''
      '                 '
      '          from (contratos ct'
      '                join (dadosfiscais df'
      '                      join (Servicosdadosfiscais sdf'
      '                            join servicos s '
      '                            on sdf.produto = s.codigo)'
      '                      on sdf.dadofiscal = df.numero)'
      '                on df.contrato = ct.numero)'
      '                '
      '                join servicoscontratos sc'
      '                on ct.numero = sc.contrato'
      '                and sc.servico = sdf.servico'
      ''
      
        '          where ct.faturamento between (:Datainicial) and (:Data' +
        'Final) and'
      '                ct.numero = df.contrato  and'
      
        '/*            ct.situacao in ('#39'N'#39','#39'P'#39') and - Rel vendas n'#227'o poss' +
        'ui esta restri'#231#227'o */'
      
        '                df.situacao='#39'N'#39' and not coalesce(df.notavinculad' +
        'a,false)'
      
        '                and case when ct.os then ct.tipoequipamento in (' +
        '1,2) and not (coalesce(ct.os_garantia,false) and ct.os_garantia_' +
        'status='#39'A'#39') and not coalesce(ct.os_cortesia,false) else true end'
      ''
      '                %DadosFiscais_Servicos'
      ''
      '                %NCMIsentoPISCOFINS_Servicos'
      ''
      '         ) as vendas '
      '     )'
      '     '
      '  union '
      '   '
      '  ('
      '     '
      '      select distinct produtos.cliente,'
      '             produtos.tipocliente'
      '      from'
      '      ('
      '         select ct.cliente,'
      '                ct.tipocliente,'
      '                ct.nome as nomecliente,'
      '                ct.numero as contrato,'
      '                ct.pedidocliente,'
      '                ct.situacao,'
      '                ct.faturamento,'
      '                ct.filialvenda,'
      '                sc.quantidade,'
      '                sc.servico,'
      '                ct.filialvenda,'
      '                s.descricao,'
      '                '
      '                sc.valorservico as precovenda,'
      '                s.valor as precotabela,'
      
        '                sc.quantidade*sc.valorservico as totalprecovenda' +
        ','
      '                sc.quantidade*s.valor as totalprecotabela,'
      '                '
      '                0.00 as desconto,'
      '                cast('#39'V'#39' as char) as registro,'
      ''
      ''
      '                cast(null as varchar(8)) as ncm'
      ''
      ''
      '         from (contratos ct'
      '               join (servicoscontratos sc'
      '                     join servicos s'
      '                     on s.codigo = sc.servico)'
      '               on sc.contrato = ct.numero)'
      ''
      
        '         where ct.faturamento between (:DataInicial) and (:DataF' +
        'inal) and'
      '               ct.situacao in (/*'#39'P'#39',*/'#39'F'#39')'
      
        '               and case when ct.os then ct.tipoequipamento in (1' +
        ',2) and not (coalesce(ct.os_garantia,false) and ct.os_garantia_s' +
        'tatus='#39'A'#39') and not coalesce(ct.os_cortesia,false) else true end'
      ''
      '              %Contratos_Servicos'
      ''
      '              %NCMIsentoPISCOFINS_Servicos'
      ''
      '              %ProdutosComNFEmitida_Faturados'
      ''
      '      ) as produtos'
      '  )  '
      '            '
      ''
      '  union'
      '  '
      '  /*  Produtos contratos em situa'#231#227'o Parcial ou Faturado */'
      '  '
      '  ('
      ''
      '      select distinct cliente, tipocliente'
      '      from'
      '      ('
      '       select ct.cliente,'
      '              ct.tipocliente,'
      '              vf.nome as nomecliente,'
      '              pc.quantidade,'
      '              case when ct.situacao = '#39'P'#39' then'
      
        '                produtoscontratos_qtdeentregue(coalesce(ct.primo' +
        'genito, ct.numero),pc.produto,pc.filial)'
      
        '              else cast(0 as Numeric(9,3)) end as quantidade_ent' +
        'regue'
      
        '       from ((contratos ct join vfornecedores vf on ct.cliente =' +
        ' vf.codigo and ct.tipocliente = vf.tipo)'
      
        '             join (produtoscontratos pc join ((produtos p left j' +
        'oin promocoes pro on p.promocao = pro.codigo)'
      '                                  join (((caracteristicas c'
      '                                          join grupos g'
      '                                          on c.grupo = g.codigo)'
      ''
      '                                          join classes cl'
      
        '                                          on c.classe = cl.codig' +
        'o)'
      ''
      '                                          join marcas m'
      
        '                                          on c.marca = m.codigo)' +
        ' on c.codigo = p.caracteristica)'
      
        '                                                                ' +
        '                                      on p.codigo = pc.produto)'
      
        '                                                 on pc.contrato ' +
        '= ct.numero)'
      
        '       where  ct.faturamento between (:DataInicial) and (:DataFi' +
        'nal)'
      '           and ct.situacao in ('#39'P'#39','#39'F'#39','#39'C'#39')'
      
        '           and case when ct.os then ct.tipoequipamento in (1,2) ' +
        'and not (coalesce(ct.os_garantia,false) and ct.os_garantia_statu' +
        's='#39'A'#39') and not coalesce(ct.os_cortesia,false) else true end'
      '           and case when ct.situacao = '#39'C'#39' then'
      '             not exists (select df2.contrato'
      '                         from dadosfiscais df2'
      
        '                         where df2.contrato = ct.numero) else tr' +
        'ue end'
      ''
      ''
      '                   %Contratos'
      ''
      '                   %NCMIsentoPISCOFINS'
      ''
      '                   %ProdutosComNFEmitida_Faturados'
      ''
      '      ) as produtos'
      '      where (quantidade-quantidade_entregue)<>0'
      '  '
      '  )'
      '  '
      '  union all'
      ''
      
        '    /*  Servi'#231'os contratos em situa'#231#227'o Parcial n'#227'o existe ou Fat' +
        'urado */'
      ''
      ' ('
      ' '
      '  select distinct produtos.cliente,'
      '         produtos.tipocliente'
      '  from'
      '  ('
      '     select ct.cliente,'
      '            ct.tipocliente,'
      '            ct.nome as nomecliente,'
      '            ct.numero as contrato,'
      '            ct.pedidocliente,'
      '            ct.situacao,'
      '            ct.faturamento,'
      '            ct.filialvenda,'
      '            sc.quantidade,'
      '            sc.servico,'
      '            ct.filialvenda,'
      '            s.descricao,'
      '            '
      '            sc.valorservico as precovenda,'
      '            s.valor as precotabela,'
      '            sc.quantidade*sc.valorservico as totalprecovenda,'
      '            sc.quantidade*s.valor as totalprecotabela,'
      '            '
      '            0.00 as desconto,'
      '  '#9'        cast('#39'V'#39' as char) as registro,'
      ''
      '            cast(null as varchar(8)) as ncm'
      ''
      ''
      '     from (contratos ct'
      '           join (servicoscontratos sc'
      '                 join servicos s'
      '                 on s.codigo = sc.servico)'
      '           on sc.contrato = ct.numero)'
      ''
      
        '     where ct.faturamento between (:DataInicial) and (:DataFinal' +
        ') and'
      '           ct.situacao in (/*'#39'P'#39',*/'#39'F'#39')'
      
        '           and case when ct.os then ct.tipoequipamento in (1,2) ' +
        'and not (coalesce(ct.os_garantia,false) and ct.os_garantia_statu' +
        's='#39'A'#39') and not coalesce(ct.os_cortesia,false) else true end'
      ''
      '          %Contratos_Servicos'
      ''
      '          %NCMIsentoPISCOFINS_Servicos'
      ''
      '          %ProdutosComNFEmitida_Faturados'
      ''
      '  ) as produtos'
      ' )'
      ''
      '  '
      '  union '
      '  '
      '  /* produtos com vendas sem contrato */'
      '  '
      '  ('
      '  '
      '      select distinct df.cliente, df.tipocliente'
      
        '      from ((dadosfiscais df left join vfornecedores vf on df.cl' +
        'iente = vf.codigo and df.tipocliente = vf.tipo)'
      '            join (produtosdadosfiscais pdf'
      
        '                  join ((produtos p left join promocoes pro on p' +
        '.promocao = pro.codigo)'
      '                                  join (((caracteristicas c'
      '                                          join grupos g'
      '                                          on c.grupo = g.codigo)'
      ''
      '                                          join classes cl'
      
        '                                          on c.classe = cl.codig' +
        'o)'
      ''
      '                                          join marcas m'
      '                                          on c.marca = m.codigo)'
      '                        on c.codigo = p.caracteristica)'
      '                  on pdf.produto = p.codigo)'
      '            on pdf.dadofiscal = df.numero)'
      ''
      '      where df.data between :Datainicial and :DataFinal'
      '        and df.contrato is null'
      '        and df.situacao='#39'N'#39
      '        and not coalesce(df.notavinculada,false)'
      '        '
      ''
      
        '        and (eHNotaFiscalSaidaVenda(df.codigofiscal) or mod(df.c' +
        'odigofiscal,1000) in (929))       '
      ''
      '                %DadosFiscais_FrentedeCaixa'
      ''
      '                %NCMIsentoPISCOFINS'
      ''
      '  )'
      '  '
      'union'
      ''
      '/* produtos com devolu'#231#227'o em contratosdevolvidos */'
      ''
      '  ('
      '   select distinct ct.cliente,'
      '             ct.tipocliente'
      
        '   from ((contratos ct join vfornecedores vf on ct.cliente = vf.' +
        'codigo and ct.tipocliente = vf.tipo)'
      
        '   join (contratosdevolvidos cd join ((produtos p left join prom' +
        'ocoes pro on p.promocao = pro.codigo)'
      '                              join (((caracteristicas c'
      '                                      join grupos g'
      '                                      on c.grupo = g.codigo)'
      ''
      '                                      join classes cl'
      '                                      on c.classe = cl.codigo)'
      ''
      '                                      join marcas m'
      
        '                                      on c.marca = m.codigo) on ' +
        'c.codigo = p.caracteristica)'
      '   '#9#9#9#9#9#9#9#9#9'on p.codigo = cd.produto)'
      '  '#9#9#9#9'on cd.contrato = ct.numero)'
      '   where :IncluirDevolucoes '
      '     and ct.situacao in ('#39'F'#39','#39'P'#39','#39'N'#39','#39'C'#39') and'
      ' '#9' cd.devolucao between (:DataInicial) and (:DataFinal)'
      '         and cd.tipo = '#39'D'#39
      
        '        and case when ct.os then ct.tipoequipamento in (1,2) and' +
        ' not (coalesce(ct.os_garantia,false) and ct.os_garantia_status='#39 +
        'A'#39') and not coalesce(ct.os_cortesia,false) else true end'
      ''
      '      '#9'%Devolucoes'
      ''
      '        %NCMIsentoPISCOFINS'
      ''
      '        %ProdutosComNFEmitida_Devolvido'
      '   )'
      '   '
      'union'
      ''
      ''
      ''
      '  /* Produtos contratos cancelados */'
      ''
      '    ('
      ''
      ''
      '        SELECT distinct produtos.cliente, produtos.tipocliente'
      '        from'
      '        ('
      '        select produtos.*'
      '         from'
      '        ('
      ''
      '         select ct.cliente,'
      '                ct.tipocliente,'
      '                ct.nome as nomecliente,'
      '                ct.numero as contrato,'
      '                ct.pedidocliente,'
      '                ct.situacao,'
      '                ct.faturamento,'
      '                ct.filialvenda,'
      '                cast(null as integer) as dadofiscal,'
      '                cast(null as date) as data,'
      '                -pc.quantidade,'
      
        '                ratearcreditotroca_contratos(pc.contrato, pc.pro' +
        'duto) as creditotroca,'
      '                pc.produto,'
      '                p.codigovisual as produtovisual,'
      '                pc.filial,'
      
        '                cast(btrim(p.descricao ||'#39' '#39'||coalesce(p.valorgr' +
        'ade1,'#39#39')||'#39' '#39'||coalesce(p.valorgrade2,'#39#39')) as varchar(162)) as d' +
        'escricao,'
      '                - pc.precovenda,'
      '                cast(null as numeric(15,2)) as precotabela,'
      ''
      
        '                - (pc.quantidade*pc.precovenda) as totalprecoven' +
        'da,'
      ''
      '                cast(null as numeric(15,2)) as totalprecotabela,'
      '                cancelados.datapagto as devolucao,'
      ''
      '              ((coalesce(pc.desconto,0)+'
      '              coalesce(pc.valordescontoitem,0)) -'
      '                coalesce(pc.acrescimo,0)) as desconto,'
      ''
      '              cast('#39'D'#39' as char) as registro,'
      ''
      
        '             (select ipi.classificacaofiscal from ipi where ipi.' +
        'codigo = c.ipi) as ncm,'
      ''
      '             (select cp.produto_cliente'
      '              from clientesprodutos cp'
      '              where cp.cliente = ct.cliente'
      '                and cp.tipocliente = ct.tipocliente'
      '                and cp.produto = pc.produto) as produto_cliente'
      ''
      ''
      '          from'
      ''
      '        ('
      '        select distinct p.*'
      '        from'
      '        (select p.contrato, p.datapagto'
      '         from parcelas p'
      '         where p.datapagto between :datainicial and :datafinal'
      
        '          and p.tipopagto='#39'E'#39') as p join contratos ct on p.contr' +
        'ato = ct.numero'
      '        where ct.situacao='#39'C'#39
      '          AND (coalesce(ct.valorvista,0)<>0)'
      '          and ct.origem is NULL'
      
        '          and case when ct.os then ct.tipoequipamento in (1,2) a' +
        'nd not (coalesce(ct.os_garantia,false) and ct.os_garantia_status' +
        '='#39'A'#39') and not coalesce(ct.os_cortesia,false) else true end'
      '          and not exists (select cd.contrato'
      '                          from contratosdevolvidos cd'
      '                           where cd.contrato = ct.numero'
      '                             and cd.tipo='#39'D'#39')'
      '        ) as cancelados, (contratos ct join'
      '                                   (produtoscontratos pc'
      '                                        join (produtos p'
      
        '                                                join (((caracter' +
        'isticas c'
      
        '                                                        join mar' +
        'cas m'
      
        '                                                        on c.mar' +
        'ca = m.codigo)'
      ''
      
        '                                                       join clas' +
        'ses cl'
      
        '                                                       on c.clas' +
        'se = cl.codigo)'
      ''
      
        '                                                       join grup' +
        'os g'
      
        '                                                       on g.codi' +
        'go=c.grupo)'
      
        '                                                on p.caracterist' +
        'ica = c.codigo)'
      '                                        on pc.produto=p.codigo)'
      '                                on pc.contrato = ct.numero)'
      '         where cancelados.contrato = ct.numero'
      ''
      '     %Contratos'
      ''
      '     %NCMIsentoPISCOFINS'
      ''
      '     %ProdutosComNFEmitida_Faturados'
      ''
      ''
      ''
      '        order by pc.contrato, pc.produto, pc.filial'
      '        ) as produtos /* left join (SELECT sc.contrato,'
      
        '                                        coalesce(SUM(sc.quantida' +
        'de*sc.valorservico),0) as totalservico'
      
        '                                 FROM contratos ct, servicoscont' +
        'ratos sc'
      '                                 WHERE sc.contrato = ct.numero'
      
        '                                   AND ct.faturamento BETWEEN(:D' +
        'ataInicial) and (:DataFinal)'
      
        '                                   AND (coalesce(ct.valorvista,0' +
        ')<>0)'
      '                                   and ct.origem IS NULL'
      
        '                                   and case when ct.os then ct.t' +
        'ipoequipamento in (1,2) and not (coalesce(ct.os_garantia,false) ' +
        'and ct.os_garantia_status='#39'A'#39') and not coalesce(ct.os_cortesia,f' +
        'alse) else true end'
      ''
      
        '                                 group by sc.contrato) as sc on ' +
        'sc.contrato = produtos.vcontrato */'
      
        '        ) as produtos /*, movimentos WHERE numero=(SELECT max(nu' +
        'mero)'
      '                                                FROM movimentos'
      
        '                                                WHERE produto=vP' +
        'roduto'
      
        '                                                  AND   filial=v' +
        'Filial'
      
        '                                                  AND   cast(dat' +
        'a as date)=vfaturamento)*/'
      ''
      '    )'
      ''
      ''
      ' union all'
      ''
      ''
      ' /* servi'#231'os com devolu'#231#227'o em contratosdevolvidos */'
      ' '
      ' ('
      '  select distinct devolucoes.cliente, devolucoes.tipocliente'
      '  from'
      '  ('
      '   select ct.cliente,'
      '          ct.tipocliente,'
      '          ct.nome as nomecliente,'
      '          ct.numero as contrato,'
      '          ct.pedidocliente,'
      '          cd.situacao,'
      '          ct.faturamento,'
      '          ct.filialvenda,'
      #9'      cast(null as integer) as dadofiscal,'
      #9'      cast(null as date) as data,'
      '          -cd.quantidade as quantidade,'
      '          cast(cd.servico as bigint) as produto,'
      '          cast(cd.servico as varchar(30)) as produtovisual,'
      '          cd.filial,'
      '          s.descricao,'
      
        '          -((cd.valorvista-cd.frete-cd.seguro+cd.desconto+cd.val' +
        'ordescontoitem)/cd.quantidade) as precovenda,'
      '          cast(null as numeric(15,2)) as precotabela,'
      
        '          -(cd.valorvista-cd.frete-cd.seguro+cd.desconto+cd.valo' +
        'rdescontoitem) as totalprecovenda,'
      '          cast(null as numeric(15,2)) as totalprecotabela,'
      '          cd.devolucao,'
      '    '#9'  0.00 as desconto,'
      '          cast('#39'D'#39' as char) as registro,'
      '          cast(null as varchar(8)) as ncm          '
      ''
      '   from (contratos ct'
      '         join (contratosdevolvidos cd'
      '               join servicos s'
      '               on s.codigo = cd.servico)'
      '         on ct.numero = cd.contrato)'
      ''
      '   where :IncluirDevolucoes'
      '     and ct.situacao in ('#39'N'#39','#39'P'#39','#39'F'#39','#39'C'#39') '
      '     and cd.devolucao between (:DataInicial) and (:DataFinal)'
      '     and cd.tipo = '#39'D'#39
      
        '     and case when ct.os then ct.tipoequipamento in (1,2) and no' +
        't (coalesce(ct.os_garantia,false) and ct.os_garantia_status='#39'A'#39')' +
        ' and not coalesce(ct.os_cortesia,false) else true end'
      ''
      '             %Devolucoes_Servicos'
      ''
      '             %NCMIsentoPISCOFINS_Servicos'
      ''
      '             %ProdutosComNFEmitida_Devolvido'
      ''
      '   ) as devolucoes'
      '  )'
      '   '
      '   '
      'union'
      '  /*  Produtos com devolu'#231#227'o em notas de entrada em contrato */'
      ' ('
      '  select distinct np.fornecedor as cliente,'
      '                  np.tipofornecedor as tipocliente'
      ''
      '     from ((notaspag np'
      '           join vfornecedores vf'
      '           on np.fornecedor = vf.codigo and'
      '              np.tipofornecedor = vf.tipo)'
      ''
      '           join (produtosnotaspag pnp'
      
        #9#9'             join ((produtos p left join promocoes pro on p.pr' +
        'omocao = pro.codigo)'
      '                              join (((caracteristicas c'
      '                                      join grupos g'
      '                                      on c.grupo = g.codigo)'
      ''
      '                                      join classes cl'
      '                                      on c.classe = cl.codigo)'
      ''
      '                                      join marcas m'
      '                                      on c.marca = m.codigo)'
      '              '#9#9#9#9' on c.codigo = p.caracteristica)'
      '                       on pnp.produto = p.codigo)'
      '                 on pnp.codigonota = np.codigo)'
      ''
      '     Where :IncluirDevolucoes '
      
        '       and (np.data between (:DataInicial) and (:DataFinal) and ' +
        'np.situacao='#39'N'#39')'
      '       and np.contrato is null'
      '       and ehnotafiscalentradadevolucao(np.codigofiscal)'
      '       and :IncluirDevolucoesSemContrato'
      ''
      '     %Devolucoes_np'
      ''
      '     %NCMIsentoPISCOFINS'
      '     '
      '   )  '
      ''
      ')'
      ''
      
        ') as produtosclientes left join vfornecedores vf on produtosclie' +
        'ntes.cliente = vf.codigo and'
      
        '                                               produtosclientes.' +
        'tipocliente = vf.tipo'
      ''
      ') AS ec'
      ''
      'ORDER BY UPPER(TO_ASCII(ec.NomeCliente,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 56
    Top = 344
    ParamData = <
      item
        DataType = ftString
        Name = 'datainicial'
        ParamType = ptUnknown
        Value = #39'2008-01-01'#39
      end
      item
        DataType = ftString
        Name = 'datafinal'
        ParamType = ptUnknown
        Value = #39'2008-01-15'#39
      end
      item
        DataType = ftUnknown
        Name = 'IncluirDevolucoes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IncluirDevolucoesSemContrato'
        ParamType = ptUnknown
      end>
    object qryEnderecoClientecliente: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object qryEnderecoClientetipocliente: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
    object qryEnderecoClientenomecliente: TStringField
      FieldName = 'nomecliente'
      Size = 40
    end
    object qryEnderecoClienterua: TStringField
      FieldName = 'rua'
      Size = 100
    end
    object qryEnderecoClientebairro: TStringField
      FieldName = 'bairro'
      Size = 80
    end
    object qryEnderecoClientecep: TIntegerField
      FieldName = 'cep'
      DisplayFormat = '0'
    end
    object qryEnderecoClientecidade: TStringField
      FieldName = 'cidade'
      Size = 80
    end
    object qryEnderecoClientepessoanumero: TStringField
      FieldName = 'pessoanumero'
      Size = 50
    end
    object qryEnderecoClientefone: TStringField
      FieldName = 'fone'
      Size = 50
    end
  end
  object fdsEnderecoCliente: TfrDBDataSet
    DataSet = qryEnderecoCliente
    OpenDataSource = False
    Left = 120
    Top = 376
  end
  object dsrEnderecoCliente: TtecDataSource
    DataSet = qryEnderecoCliente
    Left = 80
    Top = 376
  end
  object fdsRelatorioProdutosClientes: TfrDBDataSet
    DataSet = qryRelatorioProdutosClientes
    OpenDataSource = False
    Left = 288
    Top = 368
  end
  object qryRelatorioProdutosVendedores: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeOpen = qryRelatorioProdutosVendedoresBeforeOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'DadosFiscais'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NCMIsentoPISCOFINS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DadosFiscais_Servicos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NCMIsentoPISCOFINS_Servicos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contratos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ProdutosComNFEmitida_Faturados'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contratos_Servicos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DadosFiscais_FrentedeCaixa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Devolucoes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ProdutosComNFEmitida_Devolvido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Devolucoes_Servicos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Devolucoes_np'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Ordenacao'
        ParamType = ptUnknown
        Value = 'vendedor'
      end>
    Sql.Strings = (
      ';SELECT * FROM'
      '('
      'select produtosvendedores.*,'
      '       u.nome as nomevendedor,'
      ''
      ''
      '            case when'
      '            first_value(produto)'
      ''
      '            OVER('
      ''
      
        '                PARTITION BY coalesce(contrato,cast(dadofiscal a' +
        's varchar(20))), categoria'
      ''
      
        '                    ORDER BY coalesce(contrato,cast(dadofiscal a' +
        's varchar(20))), categoria, produto desc'
      ''
      
        '                ) = produto then case when quantidade>0 then 1 e' +
        'lse -1 end else cast(null as integer) end as ticket_count'
      ''
      'from'
      '('
      ''
      ''
      '/* Produtos com notas/cupons emitidos */'
      ''
      '  ('
      '    select vendas.*,'
      '           n.serie,'
      '           n.numero as numeronota'
      '    from'
      '    ('
      '     select vendas.*,'
      '            cp.maquina,'
      '            cp.intervensao,'
      '            cp.numero as numerocupom'
      '     from'
      '     ('
      '      select'
      '             coalesce(pdf.vendedor,df.vendedor) as vendedor,'
      '             ct.numero as contrato,'
      '             cast('#39'Notas Produtos'#39' as varchar(20)) as categoria,'
      '             ct.pedidocliente,'
      '     '#9'     ct.situacao,'
      '             ct.faturamento,'
      '             df.filialvenda,'
      '     '#9'     pdf.dadofiscal,'
      '             df.data,'
      '             pdf.quantidade,'
      
        '             - ratearcreditotroca_dadosfiscais(pdf.dadofiscal, p' +
        'df.produto) as creditotroca,'
      '             pdf.produto,'
      '             p.codigovisual as produtovisual,'
      '             pdf.filial,'
      '             p.descricao,'
      '             pdf.precovenda,'
      '             pdf.precotabela,'
      '             pdf.quantidade*pdf.precovenda as totalprecovenda,'
      '             pdf.quantidade*pdf.precotabela as totalprecotabela,'
      ''
      '             cast(null as date) as devolucao,'
      ''
      '             -((coalesce(pdf.desconto,0)+'
      '                coalesce(pdf.valordescontoitem,0)) -'
      '               coalesce(pdf.acrescimo,0)'
      '               ) as desconto,'
      ''
      '             cast('#39'V'#39'  as char) as registro,'
      ''
      
        '             (select ipi.classificacaofiscal from ipi where ipi.' +
        'codigo = c.ipi) as ncm,'
      ''
      '             (select cp.produto_cliente'
      '              from clientesprodutos cp'
      '              where cp.cliente = ct.cliente'
      '                and cp.tipocliente = ct.tipocliente'
      '                and cp.produto = pdf.produto) as produto_cliente'
      ''
      '      from (contratos ct'
      '            join (dadosfiscais df'
      '                  join (produtosdadosfiscais pdf'
      
        '                        join ((produtos p left join promocoes pr' +
        'o on p.promocao = pro.codigo)'
      '                              join (((caracteristicas c'
      '                                      join grupos g'
      '                                      on c.grupo = g.codigo)'
      ''
      '                                      join classes cl'
      '                                      on c.classe = cl.codigo)'
      ''
      '                                      join marcas m'
      '                                      on c.marca = m.codigo)'
      ''
      '                              on c.codigo = p.caracteristica)'
      '                        on pdf.produto = p.codigo)'
      '                   on pdf.dadofiscal = df.numero)'
      '            on df.contrato = ct.numero)'
      ''
      
        '      where ct.faturamento between (:datainicial) and (:datafina' +
        'l)'
      '        and ct.numero = df.contrato'
      '        and not coalesce(pdf.brinde,false)'
      '        and (coalesce(ct.valorvista,0)<>0)'
      '        and not coalesce(df.notavinculada,false)'
      
        '        and (eHNotaFiscalSaidaVenda(df.codigofiscal) or mod(df.c' +
        'odigofiscal,1000) in (929))'
      '        and ct.origem IS NULL'
      
        '        and case when ct.os then ct.tipoequipamento in (1,2) and' +
        ' not (coalesce(ct.os_garantia,false) and ct.os_garantia_status='#39 +
        'A'#39') and not coalesce(ct.os_cortesia,false) else true end'
      ''
      
        '            /*   ct.situacao in ('#39'N'#39','#39'P'#39') and - Rel vendas n'#227'o p' +
        'ossui esta restri'#231#227'o */'
      '            /*   df.situacao='#39'N'#39' and */'
      ''
      '         and case when ct.situacao = '#39'N'#39' then'
      '                  ct.situacao = df.situacao'
      #9'   else (case when ct.situacao='#39'C'#39' then'
      #9'         (case when coalesce((select sum(p.valorpagto)'
      '                                      from parcelas p'
      
        '                                      where p.contrato = ct.nume' +
        'ro'
      
        '                                      and p.tipopagto='#39'E'#39'),0) = ' +
        'ct.valorprazo then'
      ''
      
        #9#9#9'    df.numero = (select max(df2.numero) from dadosfiscais df2' +
        ' where df2.contrato = ct.numero)'
      ''
      #9#9' '#9' else df.situacao='#39'N'#39' end) else true end) end'
      ''
      '      %DadosFiscais'
      ''
      '      %NCMIsentoPISCOFINS'
      ''
      
        '     ) as vendas left join cupons cp on vendas.dadofiscal = cp.d' +
        'adofiscal'
      
        '    ) as vendas left join notas n on vendas.dadofiscal = n.dadof' +
        'iscal'
      ''
      ''
      ' )'
      ' '
      ' union all'
      ''
      ' /* Servi'#231'os com notas/cupons emitidos */'
      '  '
      '  ('
      '    select vendas.*,'
      '           n.serie,'
      '           n.numero as numeronota'
      '    from'
      '    ('
      '     select vendas.*,'
      '            cp.maquina,'
      '            cp.intervensao,'
      '            cp.numero as numerocupom'
      '     from'
      '     ('
      '      select coalesce(sc.vendedor,df.vendedor) as vendedor,'
      '             ct.numero as contrato,'
      #9#9#9' cast('#39'Notas Servi'#231'os'#39' as varchar(20)) as categoria,'
      '             ct.pedidocliente,'
      '             ct.situacao,'
      '             ct.faturamento,'
      '             df.filialvenda,'
      '             df.numero as dadofiscal,'
      '             df.data,'
      '             sdf.quantidade,'
      '             cast(null as numeric(11,2)) as creditotroca,'
      '             cast(sdf.servico as bigint) as produto,'
      '             cast(sdf.servico as varchar(30)) as produtovisual,'
      '             df.filialvenda as filial,'
      '             cast(s.descricao as varchar(162)) as descricao,'
      '             sdf.valorservico as precovenda,'
      '             s.valor as precotabela,'
      '             sdf.quantidade*sdf.valorservico as totalprecovenda,'
      '             sdf.quantidade*s.valor as totalprecotabela,'
      '             cast(null as date) as devolucao,'
      '             0.00 as desconto,'
      '             cast('#39'V'#39' as char) as registro,'
      '             cast(null as varchar(8)) as ncm,'
      '             cast(null as varchar(30)) as produto_cliente'
      ''
      '             '
      '      from (contratos ct'
      '            join (dadosfiscais df'
      '                  join (Servicosdadosfiscais sdf'
      '                        join servicos s '
      '                        on sdf.produto = s.codigo)'
      '                  on sdf.dadofiscal = df.numero)'
      '            on df.contrato = ct.numero)'
      '            '
      '            join servicoscontratos sc'
      '            on ct.numero = sc.contrato'
      '            and sc.servico = sdf.servico'
      ''
      
        '      where ct.faturamento between (:Datainicial) and (:DataFina' +
        'l) and'
      '            ct.numero = df.contrato  and'
      ''
      
        '/*          ct.situacao in ('#39'N'#39','#39'P'#39') and - Rel vendas n'#227'o possui' +
        ' esta restri'#231#227'o */'
      ''
      
        '            df.situacao='#39'N'#39' and not coalesce(df.notavinculada,fa' +
        'lse)'
      
        '            and case when ct.os then ct.tipoequipamento in (1,2)' +
        ' and not (coalesce(ct.os_garantia,false) and ct.os_garantia_stat' +
        'us='#39'A'#39') and not coalesce(ct.os_cortesia,false) else true end'
      ''
      '            %DadosFiscais_Servicos'
      ''
      '            %NCMIsentoPISCOFINS_Servicos'
      ''
      
        '     ) as vendas left join cupons cp on vendas.dadofiscal = cp.d' +
        'adofiscal'
      
        '    ) as vendas left join notas n on vendas.dadofiscal = n.dadof' +
        'iscal'
      '   '
      ' )'
      ' '
      ' /*  Produtos contratos em situa'#231#227'o Parcial ou Faturado */'
      ' '
      '  union all'
      '  '
      ' ('
      '  select produtos.vendedor,'
      '         produtos.contrato,'
      #9#9' cast('#39'Faturados Produtos'#39' as varchar(20)) as categoria,'
      '         produtos.pedidocliente,'
      '         produtos.situacao,'
      '         produtos.faturamento,'
      '         produtos.filialvenda,'
      '         cast(null as integer) as dadofiscal,'
      '         cast(null as date) as data,'
      
        '         produtos.quantidade - produtos.quantidade_entregue as q' +
        'uantidade,'
      
        '         ((produtos.creditotroca / produtos.quantidade) * (produ' +
        'tos.quantidade - produtos.quantidade_entregue)) as creditotroca,'
      '         produtos.produto,'
      '         produtos.produtovisual,'
      '         produtos.filial,'
      '         produtos.descricao,'
      '         produtos.precovenda,'
      '         produtos.precotabela,'
      
        '         ((produtos.quantidade - produtos.quantidade_entregue) *' +
        ' produtos.precovenda) as totalprecovenda,'
      
        '         ((produtos.quantidade - produtos.quantidade_entregue) *' +
        ' produtos.precotabela) as totalprecotabela,'
      ''
      '         cast(null as date) as devolucao,'
      '         produtos.desconto,'
      '         produtos.registro,'
      ''
      '         produtos.ncm,'
      ''
      '         produtos.produto_cliente,'
      '       cast(null as integer) as maquina,'
      '       cast(null as integer) as intervensao,'
      '       cast(null as integer) as numerocupom,'
      '       cast(null as varchar(3)) as serie,'
      '       cast(null as integer) as numeronota'
      '  from'
      '  ('
      '     select pc.vendedor,'
      '            ct.numero as contrato,'
      '            ct.pedidocliente,'
      '  '#9'  ct.situacao,'
      '            ct.faturamento,'
      '            ct.filialvenda,'
      '            pc.quantidade,'
      
        '            - ratearcreditotroca_contratos(pc.contrato, pc.produ' +
        'to) as creditotroca,'
      '            case when ct.situacao = '#39'P'#39' then'
      
        '              produtoscontratos_qtdeentregue(coalesce(ct.primoge' +
        'nito, ct.numero),pc.produto,pc.filial)'
      
        '            else cast(0 as Numeric(9,3)) end as quantidade_entre' +
        'gue,'
      '            pc.produto,'
      '            p.codigovisual as produtovisual,'
      '            pc.filial,'
      
        '            cast(btrim(p.descricao ||'#39' '#39'||coalesce(p.valorgrade1' +
        ','#39#39')||'#39' '#39'||coalesce(p.valorgrade2,'#39#39')) as varchar(162)) as descr' +
        'icao,'
      '            pc.precovenda,'
      '            pc.precotabela,'
      ''
      
        '/*            - (rateardesconto(ct.numero, cast(pc.produto as bi' +
        'gint)) + coalesce(pc.valordescontoitem,0)) as desconto, */'
      ''
      '            - ((coalesce(pc.desconto) +'
      '                coalesce(pc.valordescontoitem,0)) -'
      '                coalesce(pc.acrescimo,0)) as desconto,'
      ''
      '    '#9'    cast('#39'V'#39' as char) as registro,'
      ''
      
        '            (select ipi.classificacaofiscal from ipi where ipi.c' +
        'odigo = c.ipi) as ncm,'
      ''
      '             (select cp.produto_cliente'
      '              from clientesprodutos cp'
      '              where cp.cliente = ct.cliente'
      '                and cp.tipocliente = ct.tipocliente'
      '                and cp.produto = pc.produto) as produto_cliente'
      ''
      '     from (contratos ct'
      '           join (produtoscontratos pc'
      
        '                 join ((produtos p left join promocoes pro on p.' +
        'promocao = pro.codigo)'
      '                       join (((caracteristicas c'
      '                                      join grupos g'
      '                                      on c.grupo = g.codigo)'
      ''
      '                                      join classes cl'
      '                                      on c.classe = cl.codigo)'
      ''
      '                                      join marcas m'
      '                                      on c.marca = m.codigo)'
      ''
      '                       on c.codigo = p.caracteristica)'
      '                 on p.codigo = pc.produto)'
      '           on pc.contrato = ct.numero)'
      ''
      
        '     where ct.faturamento between (:datainicial) and (:datafinal' +
        ') and'
      '           ct.situacao in ('#39'P'#39','#39'F'#39','#39'C'#39')'
      
        '           and case when ct.os then ct.tipoequipamento in (1,2) ' +
        'and not (coalesce(ct.os_garantia,false) and ct.os_garantia_statu' +
        's='#39'A'#39') and not coalesce(ct.os_cortesia,false) else true end'
      '           and case when ct.situacao = '#39'C'#39' then'
      '             not exists (select df2.contrato'
      '                         from dadosfiscais df2'
      
        '                         where df2.contrato = ct.numero) else tr' +
        'ue end '
      ''
      ''
      '     %Contratos'
      ''
      '     %NCMIsentoPISCOFINS'
      ''
      '     %ProdutosComNFEmitida_Faturados'
      ''
      ''
      '    ) as produtos'
      '    where (quantidade-quantidade_entregue)<>0'
      ''
      ' )'
      ''
      ''
      ' union all'
      ''
      ''
      
        '   /* Servi'#231'os contratos em situa'#231#227'o Parcial n'#227'o existe ou Fatur' +
        'ado */'
      ''
      ''
      ''
      ' ('
      ' '
      '  select produtos.vendedor,'
      '         produtos.contrato,'
      #9#9' cast('#39'Faturados Servi'#231'os'#39' as varchar(20)) as categoria,'
      '         produtos.pedidocliente,'
      '         produtos.situacao,'
      '         produtos.faturamento,'
      '         produtos.filialvenda,'
      '         cast(null as integer) as dadofiscal,'
      '         cast(null as date) as data,'
      '         produtos.quantidade,'
      '         cast(null as numeric(11,2)) as creditotroca,'
      '         cast(produtos.servico as bigint) as produto,'
      '         cast(produtos.servico as varchar(30)) as produtovisual,'
      '         produtos.filial,'
      '         produtos.descricao,                  '
      '         produtos.precovenda,'
      '         produtos.precotabela,'
      '         produtos.totalprecovenda,'
      '         produtos.totalprecotabela,'
      '         cast(null as date) as devolucao,'
      '         produtos.desconto,'
      '         produtos.registro,'
      '         produtos.ncm,'
      '         cast(null as varchar(30)) as produto_cliente,'
      '         cast(null as integer) as maquina,'
      '         cast(null as integer) as intervensao,'
      '         cast(null as integer) as numerocupom,'
      '         cast(null as varchar(3)) as serie,'
      '         cast(null as integer) as numeronota'
      '  from'
      '  ('
      '     select coalesce(sc.vendedor,ct.vendedor) as vendedor,'
      '            ct.numero as contrato,'
      '            ct.pedidocliente,'
      '            ct.situacao,'
      '            ct.faturamento,'
      '            ct.filialvenda,'
      '            sc.quantidade,'
      '            sc.servico,'
      '            ct.filialvenda as filial,'
      '            s.descricao,'
      '            '
      '            sc.valorservico as precovenda,'
      '            s.valor as precotabela,'
      '            sc.quantidade*sc.valorservico as totalprecovenda,'
      '            sc.quantidade*s.valor as totalprecotabela,'
      '            '
      '            0.00 as desconto,'
      '  '#9'        cast('#39'V'#39' as char) as registro,'
      '            '
      '            cast(null as varchar(8)) as ncm'
      ''
      ''
      '     from (contratos ct'
      '           join (servicoscontratos sc'
      '                 join servicos s'
      '                 on s.codigo = sc.servico)'
      '           on sc.contrato = ct.numero)'
      ''
      
        '     where ct.faturamento between (:DataInicial) and (:DataFinal' +
        ') and'
      '           ct.situacao in (/*'#39'P'#39',*/'#39'F'#39')'
      
        '           and case when ct.os then ct.tipoequipamento in (1,2) ' +
        'and not (coalesce(ct.os_garantia,false) and ct.os_garantia_statu' +
        's='#39'A'#39') and not coalesce(ct.os_cortesia,false) else true end'
      ''
      '          %Contratos_Servicos'
      ''
      '          %NCMIsentoPISCOFINS_Servicos'
      ''
      '          %ProdutosComNFEmitida_Faturados'
      ''
      '  ) as produtos'
      ' )'
      ' '
      ' '
      ''
      ' union all'
      ' '
      ' /* produtos com vendas sem contrato */'
      ' '
      '   ('
      '    select vendas.*,'
      '           n.serie,'
      '           n.numero as numeronota'
      '    from'
      '    ('
      '     select vendas.*,'
      '            cp.maquina,'
      '            cp.intervensao,'
      '            cp.numero as numerocupom'
      '     from'
      '     ('
      '      select'
      '             coalesce(pdf.vendedor,df.vendedor) as vendedor,'
      '             df.contrato,'
      
        #9#9#9' cast('#39'Notas Produtos sem contrato'#39' as varchar(20)) as catego' +
        'ria,'
      '             cast(null as varchar(35)) as pedidocliente,'
      #9#9#9' cast(null as char(1)) as situacao,'
      '             df.data as faturamento,'
      '             df.filialvenda,'
      '     '#9'     pdf.dadofiscal,'
      '             df.data,'
      '             pdf.quantidade,'
      
        '             - ratearcreditotroca_dadosfiscais(pdf.dadofiscal, p' +
        'df.produto) as creditotroca,'
      '             pdf.produto,'
      '             p.codigovisual as produtovisual,'
      '             pdf.filial,'
      
        '             cast(btrim(p.descricao ||'#39' '#39'||coalesce(p.valorgrade' +
        '1,'#39#39')||'#39' '#39'||coalesce(p.valorgrade2,'#39#39')) as varchar(162)) as desc' +
        'ricao,'
      '             pdf.precovenda,'
      '             pdf.precotabela,'
      '             pdf.quantidade*pdf.precovenda as totalprecovenda,'
      '             pdf.quantidade*pdf.precotabela as totalprecotabela,'
      ''
      '             cast(null as date) as devolucao,'
      ''
      '             -((coalesce(pdf.desconto,0)+'
      '                coalesce(pdf.valordescontoitem,0)) -'
      '               coalesce(pdf.acrescimo,0)'
      '               ) as desconto,'
      ''
      ''
      '             cast('#39'V'#39'  as char) as registro,'
      ''
      
        '             (select ipi.classificacaofiscal from ipi where ipi.' +
        'codigo = c.ipi) as ncm,'
      ''
      '             (select cp.produto_cliente'
      '              from clientesprodutos cp'
      '              where cp.cliente = df.cliente'
      '                and cp.tipocliente = df.tipocliente'
      '                and cp.produto = pdf.produto) as produto_cliente'
      ''
      '      from (dadosfiscais df'
      #9'        join (produtosdadosfiscais pdf'
      
        #9#9#9'      join ((produtos p left join promocoes pro on p.promocao' +
        ' = pro.codigo)'
      #9#9#9#9'    join (((caracteristicas c'
      '                                      join grupos g'
      '                                      on c.grupo = g.codigo)'
      ''
      '                                      join classes cl'
      '                                      on c.classe = cl.codigo)'
      ''
      '                                      join marcas m'
      '                                      on c.marca = m.codigo)'
      ''
      #9#9#9#9#9#9'on c.codigo = p.caracteristica)'
      '                  on pdf.produto = p.codigo)'
      '            on pdf.dadofiscal = df.numero)'
      ''
      '      where df.data between :Datainicial and :DataFinal'
      '        and df.contrato is null'
      '        and df.situacao='#39'N'#39
      #9'    and not coalesce(df.notavinculada,false)'
      
        '      and (eHNotaFiscalSaidaVenda(df.codigofiscal) or mod(df.cod' +
        'igofiscal,1000) in (929))'
      ''
      ''
      '      %DadosFiscais_FrentedeCaixa'
      ''
      '      %NCMIsentoPISCOFINS'
      #9'  '
      
        '     ) as vendas left join cupons cp on vendas.dadofiscal = cp.d' +
        'adofiscal'
      
        '    ) as vendas left join notas n on vendas.dadofiscal = n.dadof' +
        'iscal'
      ' )'
      ''
      ''
      ' union all'
      ' '
      ''
      ' '
      ' ('
      '  select devolucoes.*,'
      '       cast(null as integer) as maquina,'
      '       cast(null as integer) as intervensao,'
      '       cast(null as integer) as numerocupom,'
      '       cast(null as varchar(3)) as serie,'
      '       cast(null as integer) as numeronota'
      '  from'
      '  ('
      '  '
      '  /* produtos com devolu'#231#227'o em contratosdevolvidos */'
      '  '
      '   ('
      ''
      '   select (select pc.vendedor'
      '           from produtoscontratos pc'
      '           where pc.contrato = ct.numero'
      '             and pc.produto = cd.produto'
      '             and pc.filial = cd.filial limit 1) as vendedor,'
      ''
      '          ct.numero as contrato,'
      #9#9'  cast('#39'Devolu'#231#245'es Produtos'#39' as varchar(20)) as categoria,'
      '          ct.pedidocliente,'
      '          cd.situacao,'
      '          ct.faturamento,'
      '          ct.filialvenda,'
      #9'      cast(null as integer) as dadofiscal,'
      #9'      cast(null as date) as data,'
      '          -cd.quantidade as quantidade,'
      '          cd.creditotroca,'
      '          cd.produto,'
      '          p.codigovisual as produtovisual,'
      '          cd.filial,'
      
        '          cast(btrim(p.descricao ||'#39' '#39'||coalesce(p.valorgrade1,'#39 +
        #39')||'#39' '#39'||coalesce(p.valorgrade2,'#39#39')) as varchar(162)) as descric' +
        'ao,'
      
        '          - ((cd.valorvista-cd.frete-cd.seguro+cd.desconto+cd.va' +
        'lordescontoitem)/cd.quantidade) as precovenda,'
      ''
      '          cast(null as numeric(15,2)) as precotabela,'
      ''
      '          /* -cd.valorprazo as totalprecovenda, */'
      ''
      
        '          -(cd.valorvista-cd.frete-cd.seguro+cd.desconto+cd.valo' +
        'rdescontoitem) as totalprecovenda,'
      ''
      '          cast(null as numeric(15,2)) as totalprecotabela,'
      '          cd.devolucao,'
      ''
      '          ((coalesce(cd.desconto,0)+'
      '              coalesce(cd.valordescontoitem,0)) -'
      '             (cd.valorvista - cd.valorprazo)) as desconto,'
      ''
      '          cast('#39'D'#39' as char) as registro,'
      ''
      
        '          (select ipi.classificacaofiscal from ipi where ipi.cod' +
        'igo = c.ipi) as ncm,'
      ''
      '             (select cp.produto_cliente'
      '              from clientesprodutos cp'
      '              where cp.cliente = ct.cliente'
      '                and cp.tipocliente = ct.tipocliente'
      '                and cp.produto = cd.produto) as produto_cliente'
      ''
      '   from (contratos ct'
      '         join (contratosdevolvidos cd'
      
        '               join ((produtos p left join promocoes pro on p.pr' +
        'omocao = pro.codigo)'
      '                     join (((caracteristicas c'
      '                                      join grupos g'
      '                                      on c.grupo = g.codigo)'
      ''
      '                                      join classes cl'
      '                                      on c.classe = cl.codigo)'
      ''
      '                                      join marcas m'
      '                                      on c.marca = m.codigo)'
      '                     on c.codigo = p.caracteristica)'
      '               on p.codigo = cd.produto)'
      '         on ct.numero = cd.contrato)'
      ''
      '   where :IncluirDevolucoes'
      '     and ct.situacao in ('#39'N'#39','#39'P'#39','#39'F'#39','#39'C'#39') and'
      
        '             cd.devolucao between (:DataInicial) and (:DataFinal' +
        ')'
      '             and cd.tipo = '#39'D'#39
      
        '             and case when ct.os then ct.tipoequipamento in (1,2' +
        ') and not (coalesce(ct.os_garantia,false) and ct.os_garantia_sta' +
        'tus='#39'A'#39') and not coalesce(ct.os_cortesia,false) else true end'
      ''
      '             %Devolucoes'
      ''
      '             %NCMIsentoPISCOFINS'
      ''
      '             %ProdutosComNFEmitida_Devolvido'
      ''
      '    )'
      ''
      '    union all'
      ''
      '  /* Produtos contratos cancelados */'
      ''
      '    ('
      ''
      ''
      '        SELECT produtos.*'
      '        from'
      '        ('
      '        select produtos.*'
      '         from'
      '        ('
      '         select coalesce(pc.vendedor, ct.vendedor) as vendedor,'
      #9#9'        ct.numero as contrato,'
      #9#9#9#9'cast('#39'Cancelamentos Produtos'#39' as varchar(20)) as categoria,'
      '                ct.pedidocliente,'
      '                ct.situacao,'
      '                ct.faturamento,'
      '                ct.filialvenda,'
      #9'            cast(null as integer) as dadofiscal,'
      #9'            cast(null as date) as data,'
      '                -pc.quantidade as quantidade,'
      
        #9#9#9#9'ratearcreditotroca_contratos(pc.contrato, pc.produto) as cre' +
        'ditotroca,'
      '                pc.produto,'
      '                p.codigovisual as produtovisual,'
      '                pc.filial,'
      
        '                cast(btrim(p.descricao ||'#39' '#39'||coalesce(p.valorgr' +
        'ade1,'#39#39')||'#39' '#39'||coalesce(p.valorgrade2,'#39#39')) as varchar(162)) as d' +
        'escricao,'
      '                - pc.precovenda,'
      '                cast(null as numeric(15,2)) as precotabela,'
      ''
      
        '                - (pc.quantidade*pc.precovenda) as totalprecoven' +
        'da,'
      ''
      '                cast(null as numeric(15,2)) as totalprecotabela,'
      '                cancelados.datapagto as devolucao,'
      ''
      '              ((coalesce(pc.desconto,0)+'
      '              coalesce(pc.valordescontoitem,0)) -'
      '                coalesce(pc.acrescimo,0)) as desconto,'
      ''
      '              cast('#39'D'#39' as char) as registro,'
      ''
      
        '             (select ipi.classificacaofiscal from ipi where ipi.' +
        'codigo = c.ipi) as ncm,'
      ''
      '             (select cp.produto_cliente'
      '              from clientesprodutos cp'
      '              where cp.cliente = ct.cliente'
      '                and cp.tipocliente = ct.tipocliente'
      '                and cp.produto = pc.produto) as produto_cliente'
      ''
      ''
      '                from'
      ''
      '        ('
      '        select distinct p.*'
      '        from'
      '        (select p.contrato, p.datapagto'
      '         from parcelas p'
      '         where p.datapagto between :datainicial and :datafinal'
      
        '          and p.tipopagto='#39'E'#39') as p join contratos ct on p.contr' +
        'ato = ct.numero'
      '        where ct.situacao='#39'C'#39
      '          AND (coalesce(ct.valorvista,0)<>0)'
      '          and ct.origem is NULL'
      
        '          and case when ct.os then ct.tipoequipamento in (1,2) a' +
        'nd not (coalesce(ct.os_garantia,false) and ct.os_garantia_status' +
        '='#39'A'#39') and not coalesce(ct.os_cortesia,false) else true end'
      '          and not exists (select cd.contrato'
      '                          from contratosdevolvidos cd'
      '                           where cd.contrato = ct.numero'
      '                             and cd.tipo='#39'D'#39')'
      '        ) as cancelados, (contratos ct join'
      '                                   (produtoscontratos pc'
      '                                        join (produtos p'
      
        '                                                join (((caracter' +
        'isticas c join marcas m on c.marca = m.codigo)'
      
        '                                                                ' +
        '         join classes cl'#9'on c.classe = cl.codigo)'
      
        '                                                                ' +
        '         join grupos g on g.codigo=c.grupo)'
      
        '                                                on p.caracterist' +
        'ica = c.codigo)'
      '                                        on pc.produto=p.codigo)'
      '                                on pc.contrato = ct.numero)'
      '         where cancelados.contrato = ct.numero'
      ''
      '     %Contratos'
      ''
      '     %NCMIsentoPISCOFINS'
      ''
      '     %ProdutosComNFEmitida_Faturados'
      ''
      ''
      ''
      '        order by pc.contrato, pc.produto, pc.filial'
      '        ) as produtos /* left join (SELECT sc.contrato,'
      
        '                                        coalesce(SUM(sc.quantida' +
        'de*sc.valorservico),0) as totalservico'
      
        '                                 FROM contratos ct, servicoscont' +
        'ratos sc'
      '                                 WHERE sc.contrato = ct.numero'
      
        '                                   AND ct.faturamento BETWEEN(:D' +
        'ataInicial) and (:DataFinal)'
      
        '                                   AND (coalesce(ct.valorvista,0' +
        ')<>0)'
      '                                   and ct.origem IS NULL'
      
        '                                   and case when ct.os then ct.t' +
        'ipoequipamento in (1,2) and not (coalesce(ct.os_garantia,false) ' +
        'and ct.os_garantia_status='#39'A'#39') and not coalesce(ct.os_cortesia,f' +
        'alse) else true end'
      ''
      
        '                                 group by sc.contrato) as sc on ' +
        'sc.contrato = produtos.vcontrato */'
      
        '        ) as produtos /*, movimentos WHERE numero=(SELECT max(nu' +
        'mero)'
      '                                                FROM movimentos'
      
        '                                                WHERE produto=vP' +
        'roduto'
      
        '                                                  AND   filial=v' +
        'Filial'
      
        '                                                  AND   cast(dat' +
        'a as date)=vfaturamento)*/'
      ''
      '    )'
      ''
      '    union all'
      ''
      ''
      ' /* servi'#231'os com devolu'#231#227'o em contratosdevolvidos */'
      ''
      '     ('
      '      select devolucoes.*'
      '      from'
      '      ('
      '       select '
      '       '
      '             (select sc.vendedor'
      '              from servicoscontratos sc'
      '              where sc.contrato = ct.numero'
      
        '                and sc.servico = cd.servico limit 1) as vendedor' +
        ','
      '              '
      '              ct.numero as contrato,'
      #9#9#9'  cast('#39'Devolu'#231#245'es Servi'#231'os'#39' as varchar(20)) as categoria,'
      '              ct.pedidocliente,'
      '              cd.situacao,'
      '              ct.faturamento,'
      '              ct.filialvenda,'
      '              cast(null as integer) as dadofiscal,'
      '              cast(null as date) as data,'
      '              -cd.quantidade as quantidade,'
      '              cast(null as numeric(12,2)) as creditotroca,'
      '              cast(cd.servico as bigint) as produto,'
      '              cast(cd.servico as varchar(30)) as produtovisual,'
      '              cd.filial,'
      '              s.descricao,'
      
        '              -((cd.valorvista-cd.frete-cd.seguro+cd.desconto+cd' +
        '.valordescontoitem)/cd.quantidade) as precovenda,'
      '              cast(null as numeric(15,2)) as precotabela,'
      
        '              -(cd.valorvista-cd.frete-cd.seguro+cd.desconto+cd.' +
        'valordescontoitem) as totalprecovenda,'
      '              cast(null as numeric(15,2)) as totalprecotabela,'
      '              cd.devolucao,'
      '              0.00 as desconto,'
      '              cast('#39'D'#39' as char) as registro,'
      '              cast(null as varchar(8)) as ncm,'
      '              cast(null as varchar(30)) as produto_cliente'
      ''
      '       from (contratos ct'
      '             join (contratosdevolvidos cd'
      '                   join servicos s'
      '                   on s.codigo = cd.servico)'
      '             on ct.numero = cd.contrato)'
      ''
      '       where :IncluirDevolucoes'
      '         and ct.situacao in ('#39'N'#39','#39'P'#39','#39'F'#39','#39'C'#39') '
      
        '         and cd.devolucao between (:DataInicial) and (:DataFinal' +
        ')'
      '         and cd.tipo = '#39'D'#39
      
        '         and case when ct.os then ct.tipoequipamento in (1,2) an' +
        'd not (coalesce(ct.os_garantia,false) and ct.os_garantia_status=' +
        #39'A'#39') and not coalesce(ct.os_cortesia,false) else true end'
      ''
      '                 %Devolucoes_Servicos'
      ''
      '                 %NCMIsentoPISCOFINS_Servicos'
      ''
      '                 %ProdutosComNFEmitida_Devolvido'
      ''
      '       ) as devolucoes'
      '      )'
      '    '
      '    '
      '    '
      ''
      '    union all'
      '    '
      
        '    /*  Produtos com devolu'#231#227'o em notas de entrada em contrato *' +
        '/'
      '    '
      '    ('
      ''
      '        select coalesce(pnp.vendedor,np.vendedor) as vendedor,'
      
        '          cast('#39'NP'#39'||cast(np.codigo as varchar(20)) as varchar(2' +
        '0)) as contrato,'
      #9#9'  cast('#39'NotasPag sem Contrato'#39' as varchar(20)) as categoria,'
      '          cast(null as varchar(35)) as pedidocliente,'
      '          np.situacao,'
      '          np.data as faturamento,'
      '          np.filial as filialvenda,'
      #9'      cast(null as integer) as dadofiscal,'
      #9'      cast(null as date) as data,'
      '          -pnp.quantidade as quantidade,'
      '          cast(null as numeric(12,2)) as creditotroca,'
      '          pnp.produto,'
      '          p.codigovisual as produtovisual,'
      '          np.filial,'
      
        '          cast(btrim(p.descricao ||'#39' '#39'||coalesce(p.valorgrade1,'#39 +
        #39')||'#39' '#39'||coalesce(p.valorgrade2,'#39#39')) as varchar(162)) as descric' +
        'ao,'
      '          -pnp.precounitario as precovenda,'
      '          cast(null as numeric(15,2)) as precotabela,'
      
        '          -(pnp.precounitario * pnp.quantidade) as totalprecoven' +
        'da,'
      '          cast(null as numeric(15,2)) as totalprecotabela,'
      '          np.data as devolucao,'
      ''
      '          (coalesce(pnp.valordescontoitem,0) +'
      '           coalesce(pnp.desconto,0)) -'
      '           coalesce(pnp.acrescimo,0) as desconto,'
      ''
      '          cast('#39'D'#39' as char) as registro,'
      
        '          (select ipi.classificacaofiscal from ipi where ipi.cod' +
        'igo = c.ipi) as ncm,'
      '          '
      '          (select cp.produto_cliente'
      '           from clientesprodutos cp'
      '           where cp.cliente = np.fornecedor'
      '             and cp.tipocliente = np.tipofornecedor'
      '             and cp.produto = pnp.produto) as produto_cliente'
      ''
      '     from (notaspag np'
      ''
      '           join (produtosnotaspag pnp'
      
        #9#9'             join ((produtos p left join promocoes pro on p.pr' +
        'omocao = pro.codigo)'
      #9#9#9'                 join (((caracteristicas c'
      '                                      join grupos g'
      '                                      on c.grupo = g.codigo)'
      ''
      '                                      join classes cl'
      '                                      on c.classe = cl.codigo)'
      ''
      '                                      join marcas m'
      '                                      on c.marca = m.codigo)'
      '              '#9#9#9#9' on c.codigo = p.caracteristica)'
      '                       on pnp.produto = p.codigo)'
      '                 on pnp.codigonota = np.codigo)'
      ''
      ''
      '     Where :IncluirDevolucoes'
      
        '       and (np.data between (:DataInicial) and (:DataFinal) and ' +
        'situacao='#39'N'#39')'
      '       and np.contrato is null'
      '       and ehnotafiscalentradadevolucao(np.codigofiscal)'
      '       and :IncluirDevolucoesSemContrato'
      '       '
      '             %Devolucoes_np'
      ''
      '             %NCMIsentoPISCOFINS'
      '    )'
      '   ) as devolucoes'
      '  )'
      '  '
      ''
      
        ') as produtosvendedores join usuarios u on produtosvendedores.ve' +
        'ndedor = u.codigo'
      ''
      ') AS rpv'
      '/*  where contrato in ('#39'3633'#39','#39'3634'#39','#39'3635'#39')*/   '
      ''
      'ORDER BY UPPER(TO_ASCII(nomevendedor,'#39'LATIN1'#39')),'
      '         Vendedor,'
      '         '
      '         %Ordenacao')
    RequestLive = False
    Left = 512
    Top = 366
    ParamData = <
      item
        DataType = ftString
        Name = 'datainicial'
        ParamType = ptUnknown
        Value = #39'2009-01-01'#39
      end
      item
        DataType = ftString
        Name = 'datafinal'
        ParamType = ptUnknown
        Value = #39'2009-01-31'#39
      end
      item
        DataType = ftUnknown
        Name = 'IncluirDevolucoes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IncluirDevolucoesSemContrato'
        ParamType = ptUnknown
      end>
    object qryRelatorioProdutosVendedoresvendedor: TIntegerField
      FieldName = 'vendedor'
      DisplayFormat = '0'
    end
    object qryRelatorioProdutosVendedorescontrato: TStringField
      FieldName = 'contrato'
    end
    object qryRelatorioProdutosVendedoressituacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
    object qryRelatorioProdutosVendedoresfaturamento: TDateField
      Alignment = taCenter
      FieldName = 'faturamento'
      EditMask = '99/99/9999;1; '
    end
    object qryRelatorioProdutosVendedoresfilialvenda: TIntegerField
      FieldName = 'filialvenda'
      DisplayFormat = '0'
    end
    object qryRelatorioProdutosVendedoresserie: TStringField
      FieldName = 'serie'
      Size = 50
    end
    object qryRelatorioProdutosVendedoresnumeronota: TIntegerField
      FieldName = 'numeronota'
      DisplayFormat = '0'
    end
    object qryRelatorioProdutosVendedoresmaquina: TIntegerField
      FieldName = 'maquina'
      DisplayFormat = '0'
    end
    object qryRelatorioProdutosVendedoresintervensao: TIntegerField
      FieldName = 'intervensao'
      DisplayFormat = '0'
    end
    object qryRelatorioProdutosVendedoresnumerocupom: TIntegerField
      FieldName = 'numerocupom'
      DisplayFormat = '0'
    end
    object qryRelatorioProdutosVendedoresdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object qryRelatorioProdutosVendedoresquantidade: TFloatField
      FieldName = 'quantidade'
      DisplayFormat = '0'
    end
    object qryRelatorioProdutosVendedoresproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryRelatorioProdutosVendedoresprodutovisual: TStringField
      FieldName = 'produtovisual'
      Size = 30
    end
    object qryRelatorioProdutosVendedoresfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryRelatorioProdutosVendedoresdescricao: TStringField
      DisplayWidth = 122
      FieldName = 'descricao'
      Size = 50
    end
    object qryRelatorioProdutosVendedoresprecovenda: TFloatField
      FieldName = 'precovenda'
      DisplayFormat = '0.00'
    end
    object qryRelatorioProdutosVendedoresnomevendedor: TStringField
      DisplayWidth = 40
      FieldName = 'nomevendedor'
      Size = 100
    end
    object qryRelatorioProdutosVendedorespedidocliente: TStringField
      FieldName = 'pedidocliente'
      Size = 35
    end
    object qryRelatorioProdutosVendedoresdevolucao: TDateField
      Alignment = taCenter
      FieldName = 'devolucao'
      EditMask = '99/99/9999;1; '
    end
    object qryRelatorioProdutosVendedoresdesconto: TFloatField
      FieldName = 'desconto'
      DisplayFormat = '0.00'
    end
    object qryRelatorioProdutosVendedoresregistro: TStringField
      FieldName = 'registro'
      Size = 1
    end
    object qryRelatorioProdutosVendedoresproduto_cliente: TStringField
      FieldName = 'produto_cliente'
      Size = 30
    end
    object qryRelatorioProdutosVendedoresdadofiscal: TIntegerField
      FieldName = 'dadofiscal'
      DisplayFormat = '0'
    end
    object qryRelatorioProdutosVendedorestotalprecovenda: TFloatField
      FieldName = 'totalprecovenda'
      DisplayFormat = '0.00'
    end
    object qryRelatorioProdutosVendedoresprecotabela: TFloatField
      FieldName = 'precotabela'
      DisplayFormat = '0.00'
    end
    object qryRelatorioProdutosVendedorestotalprecotabela: TFloatField
      FieldName = 'totalprecotabela'
      DisplayFormat = '0.00'
    end
    object qryRelatorioProdutosVendedoresncm: TStringField
      FieldName = 'ncm'
      Size = 8
    end
    object qryRelatorioProdutosVendedoresticket_count: TIntegerField
      FieldName = 'ticket_count'
    end
    object qryRelatorioProdutosVendedorescreditotroca: TFloatField
      FieldName = 'creditotroca'
    end
  end
  object fdsRelatorioProdutosVendedores: TfrDBDataSet
    DataSet = qryRelatorioProdutosVendedores
    Left = 560
    Top = 390
  end
  object frpRelatorioProdutosVendedores: TfrReport
    Dataset = fdsRelatorioProdutosVendedores
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit, pbPageSetup]
    ReportType = rtMultiple
    StoreInDFM = True
    RebuildPrinter = False
    OnBeforePrint = frpRelatorioProdutosVendedoresBeforePrint
    Left = 618
    Top = 390
    ReportForm = {
      190000004D56000019FFFF00000A0050444643726561746F7200FFFFFFFFFF00
      000000340800009A0B0000040000002400000004000000120000000100040000
      0000FFFF000000000000000000000000030400466F726D00FEFFFFFFDC000000
      780000007C0100002C0100000405000500626567696E0D00000D1000544F5441
      4C474552414C203A3D20303B0D00000D0300656E64000200F700000009006662
      76526F6461706500020100000000CC0200002F0400000F000000300003000100
      0000000000000000FFFFFF1F00000000000000000000000000FFFF0000000000
      02000000010000000000000001000000C8000000140000000100000000000002
      00620100000B00506167654865616465723100020100000000480000002F0400
      004A0000003000020001000000000000000000FFFFFF1F000000000000000000
      00000000FFFF000000000002000000010000000000000001000000C800000014
      000000010000000000000200E6010000060056656E64617300020100000000E3
      0000002F0400000F0000003500050001000000000000000000FFFFFF1F000000
      001E0066647352656C61746F72696F50726F6475746F7356656E6465646F7265
      73000000000000000100000000000002000000010000000000000001000000C8
      000000140000000100000000000002005A020000140053756DE172696F446F20
      52656C6174F372696F3100020100000000780100002F04000029000000300001
      0001000000000000000000FFFFFF1F00000000000000000000000000FFFF0000
      00000002000000010000000000000001000000C8000000140000000100000000
      00000200F7020000120043616265E7616C686F446520477275706F3100020100
      000000AC0000002F040000000000003000100001000000000000000000FFFFFF
      1F000000002B005B71727952656C61746F72696F50726F6475746F7356656E64
      65646F7265732E2276656E6465646F72225D00000000000000FFFF0000000000
      02000000010000000000000001000000C8000000140000000100000000000002
      00660300000F00526F646170E9446520477275706F31000201000000003C0100
      002F040000290000003000110001000000000000000000FFFFFF1F0000000000
      0000000000000000FFFF000000000002000000010000000000000001000000C8
      000000140000000100000000000001008B1B000007006670764C6F676F000200
      0800000048000000730000002700000005000000F4010000000000000000FFFF
      FF1F2C020000000000000000000000FFFF000000000002000000010000000601
      008B1B0000424DCE170000000000003604000028000000830000002600000001
      0008000000000098130000120B0000120B0000000100000001000000000000E8
      E5A800AA9E000099990000ADADAD003A3C4100A3970000BFB73700D8D48600FB
      FAF000A5A5A5001E1D1C00D8D9DA0054575A00D6D6D500E7E8F20012161B00B6
      AD1900CBC55B008C8D9200BEC0C500E1E2E40085878A005E606300494C4F0009
      0D12002C2E3300DEDB98007D7F8100EFEDCB00B9BABB00AEA400007C7B7B00C5
      BE440066666600D1CC6F00CDC9810048484600F7F6E600AFA5080004080D00F9
      F8ED00B8AF2700DBD68C00999999001B1A1900C6BF5100131312003B3A3A00FF
      FFFF00EAE8BE00CCCCCC0023262A00E2DEA400F1EFD600B0B1B300D3CD7500B1
      A81000CCCC660072727200535252004342420001060A00ECE9C3008C8C8B00F5
      F4DF004A4A4A0057575600B6AC1F00282B3000C7C05C0061615F00F7F7F70088
      888700DDD89300E3E0A600FDFCF70021242900070A1000BDB53100C5BE4A00E3
      E3E200A69C000099999900BABAB900DEDEDE00525458002A292800D9D58A005F
      5E5D00C7C595001B1E2300E8E5B60000000700B5AB1300D5D07B00C6C6C500B2
      A80B0021202000B9B12400504F4E00666666006B6D7000B5B5BD0084848400E0
      DC9E00BCB42C00F7EFD6005B5B5A00EFEFEF0087898B00DEDEE6003E3D3C0014
      181E00C8C25300CCC55F00A8A9AC00BDBDBC00E5E1AC0075767900181B2000E6
      E6E6000E1117000810190033333300929191002D2C2B00B5B5B4000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000003131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131543D42470E313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131315231
      31313131486D3131316D6D4C3131316D6D313131313131313131316D48313131
      31313131316D6D3131316D040A6C6C313131313131486D6D4C3131313131316D
      6D4C313131313131313131313131486D6D6D313131313131486D6D4831313131
      6D483131316D6D3131313131313131313131316D6D6D3131486D6D6D31313131
      313152313131317F7E6631554225256031603D42647931420C313B7D316D6C3D
      70403131662C316D593D7068313133646C702531484255312C70643059313131
      310C2525420E31477431420E4825793131315442433D474C4C640E3120423C30
      0A3131207E2C317F70254748484251512531603C316D59253C620A312C254330
      68313131313152313131316C2031315959313131317C7D4C4C31487C0E315968
      3177424C51347531434031203D487957543130494C7F3D31487C0C310B37317F
      70313131313C6631313131642C317C33487E51313131313179602F55317C3331
      316D793B7031487E14314857043131316D7C55557E311E3031542D4C31434031
      3148790A0B4C313131315231313131477D313125306C64334C5779313131487C
      0E31224931422C31314340316C7D313C7D3131594931570C31543D31487C0C31
      68705930253131313170706C3C0E313C0A313033317C513131310C702570474C
      4C3033312C7C64300A3148300E31796243432248483051517C31603D316D6464
      590B2C31547C42301C313131313152313131314749313166420C5548313D2C48
      4831487C0E48302C311C4248516275316C7D31493D4879627F31256848373031
      487C0E3131550E207031313131473C0C554831642C4C7E330C62793131316830
      796D3131487C3331577D6D6D313148303331487C49555131487C0C0C7E4C2C70
      3131480C0E7C2C313C476D6D31313131313152313131040B7E20316D473C6C33
      310E3D3C6C7931254264646D31486C42706831316C7D31484742702031310E3D
      433D6C31484355314043473D0A31313131796C3C6C0E316670597E3C3D203131
      31310E256C6C7731316C0E312C3D47430431772F3D0A3133424366484825643C
      7E6C7C74316D225943425531543D59437D3131313131523131316D643B6D3131
      316D514831313179514C316D51793131313131796D3131313C40313131796D31
      3131313179794831317F6D316D15154831313131313131795148314879516D79
      6D3131313131313151517931317F6D31316D51516D3151577F6D313131797931
      316D51516D5148313131515151313131314851516D3131313131523131313140
      0431313131313131313131313131313131313131313131313131313168043131
      31313131313131313131313148660F3131313131313131313131313131313131
      3131313131313131313131313131313131220E31313131313131316655313131
      3131313131313131313131313131313131313131313131313131313131315231
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131313131315C46121212463F3131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131523131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131315F06020202061B31313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131523131313131310E40173C18183D6E3131313131310C2C666C3C
      181818181805683131313131316D3768220D0516313131313108021F1F1F5235
      313131313172070707070707070707070707070750732B363131313131313131
      3131362B73212112081D31313131313131313123505050504B31313131313131
      31313F08122E505050085231313131312C103E191919195D1731313131796671
      3E4E191919191919195D0D31313131312C34282819190017313131313108021F
      1F1F523531313131311152020202020202020202020202020202022776313131
      313131313F501F02020202020202075C313131313131316A060202065F313131
      313131314C120202020202020221523131313175287A78787878784E22313131
      0E1A3E10787871717171717171281731313131773E7A71717171282231313131
      3108021F1F1F5235313131313144021F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
      1F1D31313131310802021F1F1F1F1F1F1F1F02022331313131313107021F1F02
      08313131313131313A521F1F1F1F1F1F1F5052313131310D4E7878787A7A7128
      2231316D7C4E7878784E4E7A717171717128173131312C3E7171717119195D22
      313131313108021F1F1F5269314C4C4C4C631F1F1F1F1F1F1F1F1F1F1F1F1F1F
      1F1F1F1F52503131313138521F1F1F0202020202021F1F1F5212313131313107
      021F1F0208313131313131361F1F1F1F1F0202020221523131316D457A78787A
      3D370E0E5131313B3E7878787A2274140E0E0E0E0E0E15313115787A78787119
      0D0A145A2A6A6A6A2A5F36363636365044111111113226262626262626262626
      262626264A1F1F1F1F612631311B521F1F1F02443A08082363021F1F1F525F31
      31313107021F1F02083131313131311B021F1F1F1F6A2B353532523131310E71
      717171710C313131313115781078784E683131313131313131313131311C2878
      78787A2C3131310106020202025F313131313150520202020236313131313131
      31313131313131313144021F1F1F32312639021F1F1F584C31313131311B2702
      1F1F1F3631313107021F1F020831313131313123021F1F1F1109313131315231
      3131337A717171454831313131312C28787810344C3131313131313131313131
      31057A78784E663131313135021F1F1F025F313131313150021F1F1F1F363131
      3131313131313131313131314C5E021F1F0276315F521F1F1F4B313131313131
      313132271F1F527331313107021F1F020831313131313112021F1F0272313131
      313152313131601978787A7C4C3131313131662878781045166E6E6E6E6E6E6E
      6E1C0431555B1078717A603131313135021F1F1F025F313131313150021F1F1F
      1F36313131313131314C0909090909363A021F1F1F1F3F314F021F0272313131
      3131313131313123021F1F1109313107021F1F02083131313131312E021F1F02
      73313131313152313131601978787A054C313131313156197878787128282828
      2828282828005631337A717171346D313131313552020202025F313131313121
      06020202023631313131762E635E61616161611F1F1F1F1F1F114C26611F1F02
      76313131313131313131311D1F1F1F1F1D313107021F1F02083131313131312E
      021F1F023A313131313152313131601978787A054C3131313131181978787878
      7878787878787878784E1731141978787A454831313131764444444444241551
      515151464F4F4F4F4F413131313A0202021F1F1F1F1F1F1F1F1F1F1F521B311D
      1F1F1F1F363131313131313131313126391F1F1F5C313107021F1F0208313131
      3131312E021F1F023A313131313152313131601978787A054C31313131315619
      787878787878787878787878784E1731337A717171346D313131313109090909
      097D713434347A37313131313131313158521F1F1F1F1F020202020202020227
      5831311D1F1F1F1F1D3131313131313131313126391F1F1F5C313107021F1F02
      083131313131312E021F1F023A313131313152313131601978787A054C313131
      3131224E787878784E28282828282828280056310C787171715B0C3131313131
      3131313131133E1010105D74313131313131312939021F1F1F1F391163636363
      6A50083631313126611F1F024B313131313131313131313F021F1F1F36313107
      021F1F02083131313131312E021F1F023A313131313152313131601978787A05
      4C313131313116287878101A2C2C2C2C2C2C2C2C2C7D1E316D1A7A7878197F31
      313131313131313131134E78787828743131313131313176021F1F1F1F232631
      31313131313131313131313107021F02213131313131313131313173021F1F44
      4C313107021F1F02083131313131312E021F1F023A3131313131523131316019
      78787A054C31313131317F197171713448313131313131313131313131561978
      784E6631313131313131313131134E7878782874313131313131312B521F1F1F
      6129313131313131313131313131313158521F1F024A31313131313131317602
      021F522331313107021F1F02083131313131312E021F1F023A31313131315231
      3131331978787A053131313131316D347A78784E133131313131313131313131
      317D28787871710431313131313131313113001919190004313131313131312B
      521F1F1F274131313131313131313131313131310911021F1F1F232631313131
      295F1F1F1F1F612931313107021F1F022B3131313131312E021F1F5223313131
      3131520E14602C7A78787A7C141414140C3131203E78787171660A1E60141414
      14140E3131155B107878107A567D371E1E1E1E1E1E13566C6C6C182C75757575
      756D315C021F1F1F1F211B1B1B1B1B1B4A4A4A4A4A3631313176021F1F1F0261
      502323725E021F1F1F0258762B2B4A44021F1F1F504A4A4A2B1D312E021F1F1F
      074A4A4A4A5C520D7A7A7A78787878787A7A7A5D1731317945197878784E4E7A
      7A7A7A7A7A5D6C313131165D7171717119191919191919195D6E313131313166
      007A7A7A4E1431295E021F1F1F0202020202020202020202062B313131315802
      021F1F1F020202021F1F1F1F52384C395252521F1F1F1F1F020202020608312E
      021F1F1F1F0202020221521771717878787878787171714E22313131335B2871
      7878787871717171714E1731313131173E7A717878787878787878784E6E3131
      31313166287171717A6031314A521F1F1F1F1F1F1F1F1F1F1F1F1F1F524A3131
      3131316939521F1F1F1F1F1F1F1F020258310911021F1F1F1F1F1F1F1F1F1F1F
      022B312E021F1F1F1F1F1F1F1F50520D19191978787878781919190017313131
      310C0D10284E4E191919191919000D31313131317D1A4E4E4E19191919191919
      001C3131313131662878787810603131315F0202020202020202020202020202
      062B31313131313136733902020202020261721D313129615252521F1F1F1F1F
      020202020608312E021F1F1F1F0202020221527D17173C107878714D1717170D
      2C3131313131310E0A1C3B2217171717170D7D31313131313148757D77661717
      171717170D0431313131316628787878106031313131364A3A72727272727272
      72727272505C3131313131313131264B5F737338354131313131093A7272725E
      1F1F1F1F4F1212122E5C312E021F1F1F631212121258523131310E1978787A05
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131313117003E3E3E5D7531313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313107021F1F52583131313131312E021F1F02233131313131523131316019
      78787A054C313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131313131317F686E6E6E6E15313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313121021F1F02073131313131312E021F1F023A31313131315231
      3131601978787A054C3131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313173021F1F1F1F4F3A233A32312E021F1F023A313131
      313152313131601978787A054C31313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131313169521F1F1F1F0202020608312E021F1F02
      3A313131313152313131601978787A054C313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131313131310963521F1F1F1F1F1F024A312E
      021F1F023A313131313152313131601971717A054C3131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131314150611F1F1F1F1F
      024A3150021F1F023A3131313131523131310C0D17176C774C31313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131315C38
      72727272725C31082E2E2E2E1B3131313131520000161C00000900666D765469
      74756C6F0002006801000048000000430200001200000043000000F401000000
      0000000000FFFFFF1F2C020000000000010009005B546974756C6F5D20000000
      00FFFF00000000000200000001000000000500417269616C000B000000020000
      000000020000000000020000000000FFFFFF0000000002000000000000000000
      AD1C00000700666D7644617461000200B90300004C0000005A0000000D000000
      43000000F4010000000000000000FFFFFF1F2C020000000000010013005B4441
      544520234464642F6D6D2F797979795D00000000FFFF00000000000200000001
      00000000090068656C7665746963610008000000000000000000010000000100
      020000000000FFFFFF00000000020000000000000000003A1D00000900666D76
      506167696E61000200C90300005C0000004A0000000F00000043000000F40100
      00000000000000FFFFFF1F2C020000000000010007005B50414745235D000000
      00FFFF0000000000020000000100000000090068656C76657469636100080000
      00000000000000010000000100020000000000FFFFFF00000000020000000000
      00000000CF1D00000700666D76486F726100020021000000CC02000058000000
      0A00000043000000F4010000000000000000FFFFFF1F2C020000000000010011
      005B54494D4520235468683A6D6D3A73735D00000000FFFF0000000000020000
      000100000000090068656C766574696361000700000000000000000010000000
      0100020000000000FFFFFF00000000020000000000000000007C1E0000100066
      6D76446573656E766F6C7665646F7200020041030000CD020000CC0000000A00
      000043000000F4010000000000000000FFFFFF1F2C0200000000000100200074
      6563534F4654202D205465636E6F6C6F67696120656D2053697374656D617300
      000000FFFF0000000000020000000100000000090068656C7665746963610007
      000000000000000000110000000100020000000000FFFFFF0000000002000000
      000000000000071F00000900666D764F75747261730002006801000060000000
      410200001A00000043000000F4010000000000000000FFFFFF1F2C0200000000
      00010009005B4F75747261735D2000000000FFFF000000000002000000010000
      00000500417269616C0007000000000000000000020000000000020000000000
      FFFFFF00000000020000000000000000007620000006004D656D6F3130000200
      88000000E3000000770000000D00000060000000F4010000000000000000FFFF
      FF1F2C0200000000000100EC005B4946285B6E636D6973656E746F706973636F
      66696E735D3D46616C73652C5B71727952656C61746F72696F50726F6475746F
      7356656E6465646F7265732E22636F6E747261746F225D2C5B71727952656C61
      746F72696F50726F6475746F7356656E6465646F7265732E226E636D225D295D
      205B71727952656C61746F72696F50726F6475746F7356656E6465646F726573
      2E22736974756163616F225D205B464F524D41544441544554494D4528276464
      2F6D6D2F7979272C205B71727952656C61746F72696F50726F6475746F735665
      6E6465646F7265732E226661747572616D656E746F225D295D00000000FFFF00
      00000000020000000100000006090068656C7665746963610007000000000000
      000000010000000100020000000000FFFFFF0000000002000000000000000000
      5121000006004D656D6F31360002004A020000E3000000200000000D00000000
      00000001000000000000000000FFFFFF1F2C000000080064642F6D6D2F797900
      010050005B466F726D6174466C6F6174285B4D6173636172615175616E746964
      6164655D2C5B71727952656C61746F72696F50726F6475746F7356656E646564
      6F7265732E227175616E746964616465225D295D00000000FFFF000000000002
      0000000100000006090068656C76657469636100070000000000000000000100
      00000100020000000000FFFFFF00000000020000000000000000000C22000006
      004D656D6F313700020044010000E3000000410000000D000000000000000100
      0000000000000000FFFFFF1F2C000000080064642F6D6D2F797900010030005B
      71727952656C61746F72696F50726F6475746F7356656E6465646F7265732E22
      70726F6475746F76697375616C225D00000000FFFF0000000000020000000100
      000006090068656C766574696361000700000000000000000001000000010002
      0000000000FFFFFF0000000002000000000000000000C522000006004D656D6F
      313800020087010000E3000000140000000D0000000000000001000000000000
      000000FFFFFF1F2C000000080064642F6D6D2F79790001002E005B7172795265
      6C61746F72696F50726F6475746F7356656E6465646F7265732E2266696C6961
      6C76656E6461225D00000000FFFF000000000002000000010000000609006865
      6C7665746963610007000000000000000000020000000100020000000000FFFF
      FF00000000020000000000000000007C23000006004D656D6F31390002009B01
      0000E3000000C60000000D0000000B00000001000000000000000000FFFFFF1F
      2C000000080064642F6D6D2F79790001002C005B71727952656C61746F72696F
      50726F6475746F7356656E6465646F7265732E2264657363726963616F225D00
      000000FFFF0000000000020000000100000006090068656C7665746963610007
      000000000000000000000000000100020000000000FFFFFF0000000002000000
      0000000000005C24000006004D656D6F32300002000B030000E30000003C0000
      000D0000000000000001000000000000000000FFFFFF1F2C000000080064642F
      6D6D2F797900010055005B464F524D4154464C4F415428272323232C2323232C
      2323302E3030272C20285B71727952656C61746F72696F50726F6475746F7356
      656E6465646F7265732E22746F74616C707265636F76656E6461225D29295D00
      000000FFFF0000000000020000000100000006090068656C7665746963610007
      000000000000000000010000000100020000000000FFFFFF0000000002000000
      0000000000003C25000006004D656D6F323200020008000000E30000007F0000
      000D00000060000000F4010000000000000000FFFFFF1F2C0200000000000100
      61005B71727952656C61746F72696F50726F6475746F7356656E6465646F7265
      732E2276656E6465646F72225D205B272D275D205B71727952656C61746F7269
      6F50726F6475746F7356656E6465646F7265732E226E6F6D6576656E6465646F
      72225D00000000FFFF00000000000200000001000000060500417269616C0007
      000000020000000000000000000000020000000000FFFFFF0000000002000000
      000000000000F725000007004D656D6F3135360002007E00000048000000D700
      00002E0000004B000000F4010000000000000000FFFFFF1F2C02000000000003
      0011005B52415A414F46494C49414C424153455D0D0F005B4345505F43494441
      44455F55465D0D11005B454E44455245434F5F42414952524F5D00000000FFFF
      0000000000020000000100000000090068656C76657469636100070000000000
      00000000000000000100020000000000FFFFFF00000000020000000000000000
      008326000005004D656D6F38000200FF00000078000000450000001800000043
      000B00F4010000000000000000FFFFFF1F2C02000000000001000A004E4F5441
      2F4355504F4D00000000FFFF0000000000020000000100000000090068656C76
      657469636100070000000000000000000A0000000100020000000000FFFFFF00
      000000020000000000000000000E27000005004D656D6F350002009B01000078
      000000AE0000001800000043000A00F4010000000000000000FFFFFF1F2C0200
      0000000001000900444553435249C7C34F00000000FFFF000000000002000000
      0100000000090068656C76657469636100070000000000000000000A00000001
      00020000000000FFFFFF0000000002000000000000000000C327000006004D65
      6D6F343600020087000000780000003B0000001800000043000A00F401000000
      0000000000FFFFFF1F2C020000000000010032005B4946285B6E636D6973656E
      746F706973636F66696E735D3D46616C73652C2027434F4E545241544F272C27
      4E434D27295D00000000FFFF0000000000020000000100000000090068656C76
      657469636100070000000000000000000A0000000100020000000000FFFFFF00
      000000020000000000000000005828000006004D656D6F353700020044010000
      78000000410000001800000043000E00F4010000000000000000FFFFFF1F2C02
      00000000000200080050524F4455544F2F0D07005345525649C74F00000000FF
      FF0000000000020000000100000000090068656C766574696361000700000000
      00000000000A0000000100020000000000FFFFFF000000000200000000000000
      0000DE28000005004D656D6F32000200C2000000780000001300000018000000
      43000A00F4010000000000000000FFFFFF1F2C02000000000001000400534954
      2E00000000FFFF0000000000020000000100000000090068656C766574696361
      00070000000000000000000A0000000100020000000000FFFFFF000000000200
      00000000000000006329000005004D656D6F3400020086010000780000001500
      00001800000043000F00F4010000000000000000FFFFFF1F2C02000000000001
      00030046494C00000000FFFF0000000000020000000100000000090068656C76
      657469636100070000000000000000000A0000000100020000000000FFFFFF00
      00000002000000000000000000EB29000005004D656D6F370002007803000078
      000000300000001800000043000E00F4010000000000000000FFFFFF1F2C0200
      000000000100060044455343544F00000000FFFF000000000002000000010000
      0000090068656C76657469636100070000000000000000000A00000001000200
      00000000FFFFFF0000000002000000000000000000722A000006004D656D6F31
      310002004B020000780000001F0000001800000043000E00F401000000000000
      0000FFFFFF1F2C020000000000010004005154444500000000FFFF0000000000
      020000000100000000090068656C76657469636100070000000000000000000A
      0000000100020000000000FFFFFF0000000002000000000000000000FD2A0000
      06004D656D6F32380002000B000000780000007C0000001800000043000F00F4
      010000000000000000FFFFFF1F2C0200000000000100080056454E4445444F52
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      070000000000000000000A0000000100020000000000FFFFFF00000000020000
      00000000000000862B000006004D656D6F3239000200D5000000780000002A00
      00001800000043000F00F4010000000000000000FFFFFF1F2C02000000000001
      00060046415455524100000000FFFF0000000000020000000100000000090068
      656C76657469636100070000000000000000000A0000000100020000000000FF
      FFFF0000000002000000000000000000972C000006004D656D6F333100020070
      030000E3000000380000000D0000004000000001000000000000000000FFFFFF
      1F2C000000080064642F6D6D2F797900010086005B4946285B71727952656C61
      746F72696F50726F6475746F7356656E6465646F7265732E22646573636F6E74
      6F225D203C3E20302C20464F524D4154464C4F415428272323232C2323232C23
      23302E3030272C205B71727952656C61746F72696F50726F6475746F7356656E
      6465646F7265732E22646573636F6E746F225D292C202727295D00000000FFFF
      0000000000020000000100000006090068656C76657469636100070000000000
      00000000010000000100020000000000FFFFFF00000000020000000000000000
      00702D000006004D656D6F3334000200DB020000E3000000340000000D000000
      0000000001000000000000000000FFFFFF1F2C000000080064642F6D6D2F7979
      0001004E005B464F524D4154464C4F415428272323232C2323232C2323302E30
      30272C205B71727952656C61746F72696F50726F6475746F7356656E6465646F
      7265732E22707265636F76656E6461225D295D00000000FFFF00000000000200
      00000100000006090068656C7665746963610007000000000000000000010000
      000100020000000000FFFFFF0000000002000000000000000000FA2D00000500
      4D656D6F310002006902000084000000370000000C00000043000E00F4010000
      000000000000FFFFFF1F2C02000000000001000800554E4954C152494F000000
      00FFFF0000000000020000000100000000090068656C76657469636100070000
      000000000000000A0000000100020000000000FFFFFF00000000020000000000
      00000000812E000005004D656D6F330002009F02000084000000390000000C00
      000043000F00F4010000000000000000FFFFFF1F2C0200000000000100050054
      4F54414C00000000FFFF0000000000020000000100000000090068656C766574
      69636100070000000000000000000A0000000100020000000000FFFFFF000000
      00020000000000000000000C2F000006004D656D6F3237000200D80200008400
      0000370000000C00000043000E00F4010000000000000000FFFFFF1F2C020000
      00000001000800554E4954C152494F00000000FFFF0000000000020000000100
      000000090068656C76657469636100070000000000000000000A000000010002
      0000000000FFFFFF00000000020000000000000000009D2F000006004D656D6F
      333600020069020000780000006F0000000C00000043000E00F4010000000000
      000000FFFFFF1F2C02000000000001000E00505245C74F204445205041555441
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      070000000000000000000A0000000100020000000000FFFFFF00000000020000
      000000000000002E30000006004D656D6F3337000200D8020000780000006F00
      00000C00000043000F00F4010000000000000000FFFFFF1F2C02000000000001
      000E00505245C74F2044452056454E444100000000FFFF000000000002000000
      0100000000090068656C76657469636100070000000000000000000A00000001
      00020000000000FFFFFF0000000002000000000000000000B630000006004D65
      6D6F33350002000E03000084000000390000000C00000043000F00F401000000
      0000000000FFFFFF1F2C02000000000001000500544F54414C00000000FFFF00
      00000000020000000100000000090068656C7665746963610007000000000000
      0000000A0000000100020000000000FFFFFF0000000002000000000000000000
      AC31000006004D656D6F31320002000800000040010000240100002500000043
      00000001000000000000000000FFFFFF1F2C02000000000002000F00544F5441
      4C2056454E4445444F523A0D61005B71727952656C61746F72696F50726F6475
      746F7356656E6465646F7265732E2276656E6465646F72225D205B272D275D20
      5B71727952656C61746F72696F50726F6475746F7356656E6465646F7265732E
      226E6F6D6576656E6465646F72225D00000000FFFF0000000000020000000100
      000000090068656C766574696361000800000002000000000000000000170002
      0000000000FFFFFF00000000020000000000000000009732000006004D656D6F
      3134000200F302000040010000540000000D00000000000000F0030000000000
      000000FFFFFF1F2C000000080064642F6D6D2F797900010060005B464F524D41
      54464C4F415428272323232C2323232C2323302E3030272C53554D285B717279
      52656C61746F72696F50726F6475746F7356656E6465646F7265732E22746F74
      616C707265636F76656E6461225D2C56656E6461732C3029295D00000000FFFF
      0000000000020000000100000000090068656C76657469636100080000000200
      00000000010000001700020000000000FFFFFF00000000020000000000000000
      00B433000006004D656D6F32330002003C030000400100003C0000000D000000
      00000000F0030000000000000000FFFFFF1F2C000000080064642F6D6D2F7979
      00010092005B464F524D4154464C4F415428272323232C2323232C2323302E30
      30272C53554D285B71727952656C61746F72696F50726F6475746F7356656E64
      65646F7265732E22746F74616C707265636F76656E6461222D71727952656C61
      746F72696F50726F6475746F7356656E6465646F7265732E22746F74616C7072
      65636F746162656C61225D2C56656E6461732C3029295D00000000FFFF000000
      0000020000000100000000090068656C76657469636100080000000200000000
      00010000001700020000000000FFFFFF0000000002000000000000000000A034
      000006004D656D6F33390002008402000040010000540000000D000000000000
      00F0030000000000000000FFFFFF1F2C000000080064642F6D6D2F7979000100
      61005B464F524D4154464C4F415428272323232C2323232C2323302E3030272C
      53554D285B71727952656C61746F72696F50726F6475746F7356656E6465646F
      7265732E22746F74616C707265636F746162656C61225D2C56656E6461732C30
      29295D00000000FFFF0000000000020000000100000000090068656C76657469
      63610008000000020000000000010000001700020000000000FFFFFF00000000
      020000000000000000008A35000005004D656D6F36000200F70200007C010000
      540000000D00000000000000F0030000000000000000FFFFFF1F2C0000000800
      64642F6D6D2F797900010060005B464F524D4154464C4F415428272323232C23
      23232C2323302E3030272C53554D285B71727952656C61746F72696F50726F64
      75746F7356656E6465646F7265732E22746F74616C707265636F76656E646122
      5D2C56656E6461732C3029295D00000000FFFF00000000000200000001000000
      00090068656C7665746963610008000000020000000000010000001700020000
      000000FFFFFF00000000020000000000000000001F36000005004D656D6F3900
      0200080000007C010000240100000D0000000000000001000000000000000000
      FFFFFF1F2C000000080064642F6D6D2F79790001000B00544F54414C20474552
      414C00000000FFFF0000000000020000000100000000090068656C7665746963
      610008000000020000000000000000000100020000000000FFFFFF0000000002
      0000000000000000003C37000006004D656D6F3234000200400300007C010000
      3C0000000D00000000000000F0030000000000000000FFFFFF1F2C0000000800
      64642F6D6D2F797900010092005B464F524D4154464C4F415428272323232C23
      23232C2323302E3030272C53554D285B71727952656C61746F72696F50726F64
      75746F7356656E6465646F7265732E22746F74616C707265636F76656E646122
      2D71727952656C61746F72696F50726F6475746F7356656E6465646F7265732E
      22746F74616C707265636F746162656C61225D2C56656E6461732C3029295D00
      000000FFFF0000000000020000000100000000090068656C7665746963610008
      000000020000000000010000001700020000000000FFFFFF0000000002000000
      0000000000002838000006004D656D6F3235000200880200007C010000540000
      000D00000000000000F0030000000000000000FFFFFF1F2C000000080064642F
      6D6D2F797900010061005B464F524D4154464C4F415428272323232C2323232C
      2323302E3030272C53554D285B71727952656C61746F72696F50726F6475746F
      7356656E6465646F7265732E22746F74616C707265636F746162656C61225D2C
      56656E6461732C3029295D00000000FFFF000000000002000000010000000009
      0068656C76657469636100080000000200000000000100000017000200000000
      00FFFFFF00000000020000000000000000000939000006004D656D6F31350002
      009C020000E30000003C0000000D0000000000000001000000000000000000FF
      FFFF1F2C000000080064642F6D6D2F797900010056005B464F524D4154464C4F
      415428272323232C2323232C2323302E3030272C20285B71727952656C61746F
      72696F50726F6475746F7356656E6465646F7265732E22746F74616C70726563
      6F746162656C61225D29295D00000000FFFF0000000000020000000100000006
      090068656C766574696361000700000000000000000001000000010002000000
      0000FFFFFF0000000002000000000000000000E339000006004D656D6F323600
      02006C020000E3000000340000000D0000000000000001000000000000000000
      FFFFFF1F2C000000080064642F6D6D2F79790001004F005B464F524D4154464C
      4F415428272323232C2323232C2323302E3030272C205B71727952656C61746F
      72696F50726F6475746F7356656E6465646F7265732E22707265636F74616265
      6C61225D295D00000000FFFF0000000000020000000100000006090068656C76
      65746963610007000000000000000000010000000100020000000000FFFFFF00
      00000002000000000000000000723A000006004D656D6F333200020047030000
      78000000310000001800000043000F00F4010000000000000000FFFFFF1F2C02
      000000000002000400444946450D050052454EC74100000000FFFF0000000000
      020000000100000000090068656C76657469636100070000000000000000000A
      0000000100020000000000FFFFFF0000000002000000000000000000F43B0000
      06004D656D6F333300020044030000E3000000340000000D0000000000000001
      000000000000000000FFFFFF1F2C000000080064642F6D6D2F7979000100F700
      5B4946285B71727952656C61746F72696F50726F6475746F7356656E6465646F
      7265732E22746F74616C707265636F76656E6461222D71727952656C61746F72
      696F50726F6475746F7356656E6465646F7265732E22746F74616C707265636F
      746162656C61225D3C3E20302C20464F524D4154464C4F415428272323232C23
      23232C2323302E3030272C205B71727952656C61746F72696F50726F6475746F
      7356656E6465646F7265732E22746F74616C707265636F76656E6461222D7172
      7952656C61746F72696F50726F6475746F7356656E6465646F7265732E22746F
      74616C707265636F746162656C61225D292C202727295D00000000FFFF000000
      0000020000000100000006090068656C76657469636100070000000000000000
      00010000000100020000000000FFFFFF0000000002000000000000000000423E
      000006004D656D6F313300020001010000E3000000430000000D000000200000
      0001000000000000000000FFFFFF1F2C0200000000000200C8015B7172795265
      6C61746F72696F50726F6475746F7356656E6465646F7265732E227365726965
      225D20205B4946285B71727952656C61746F72696F50726F6475746F7356656E
      6465646F7265732E224E554D45524F4E4F5441225D3D302C27272C5B71727952
      656C61746F72696F50726F6475746F7356656E6465646F7265732E224E554D45
      524F4E4F5441225D295D205B4946285B71727952656C61746F72696F50726F64
      75746F7356656E6465646F7265732E226D617175696E61225D3D302C27272C5B
      71727952656C61746F72696F50726F6475746F7356656E6465646F7265732E22
      6D617175696E61225D295D2020205B4946285B71727952656C61746F72696F50
      726F6475746F7356656E6465646F7265732E22494E54455256454E53414F225D
      3D302C27272C5B71727952656C61746F72696F50726F6475746F7356656E6465
      646F7265732E22494E54455256454E53414F225D295D20205B4946285B717279
      52656C61746F72696F50726F6475746F7356656E6465646F7265732E224E554D
      45524F4355504F4D225D3D302C27272C5B71727952656C61746F72696F50726F
      6475746F7356656E6465646F7265732E224E554D45524F4355504F4D225D295D
      20200D000000000000FFFF0000000000020000000100000006090068656C7665
      746963610007000000000000000000000000000100020000000000FFFFFF0000
      000002000000000000000000CB3F000006004D656D6F34300002008101000040
      010000540000000D00000000000000F0030000000000000000FFFFFF1F2C0000
      00080064642F6D6D2F7979000100FE005B464F524D4154464C4F415428272323
      232C2323232C2323302E3030272C5B53554D285B71727952656C61746F72696F
      50726F6475746F7356656E6465646F7265732E22746F74616C707265636F7665
      6E6461225D2B5B71727952656C61746F72696F50726F6475746F7356656E6465
      646F7265732E22646573636F6E746F225D2B5B71727952656C61746F72696F50
      726F6475746F7356656E6465646F7265732E226372656469746F74726F636122
      5D2C56656E6461732C30295D2F5B53554D285B71727952656C61746F72696F50
      726F6475746F7356656E6465646F7265732E227469636B65745F636F756E7422
      5D2C56656E6461732C30295D295D00000000FFFF000000000002000000010000
      0000090068656C76657469636100080000000200000000000100000017000200
      00000000FFFFFF00000000020000000000000000005A40000006004D656D6F34
      3100020031010000400100004C0000000D000000430000000100000000000000
      0000FFFFFF1F2C02000000000001000C005469636B6574204DE964696F000000
      00FFFF0000000000020000000100000000090068656C76657469636100080000
      00020000000000010000001700020000000000FFFFFF00000000020000000000
      00000000E341000006004D656D6F3432000200850100007C010000540000000D
      00000000000000F0030000000000000000FFFFFF1F2C000000080064642F6D6D
      2F7979000100FE005B464F524D4154464C4F415428272323232C2323232C2323
      302E3030272C5B53554D285B71727952656C61746F72696F50726F6475746F73
      56656E6465646F7265732E22746F74616C707265636F76656E6461225D2B5B71
      727952656C61746F72696F50726F6475746F7356656E6465646F7265732E2264
      6573636F6E746F225D2B5B71727952656C61746F72696F50726F6475746F7356
      656E6465646F7265732E226372656469746F74726F6361225D2C56656E646173
      2C30295D2F5B53554D285B71727952656C61746F72696F50726F6475746F7356
      656E6465646F7265732E227469636B65745F636F756E74225D2C56656E646173
      2C30295D295D00000000FFFF0000000000020000000100000000090068656C76
      65746963610008000000020000000000010000001700020000000000FFFFFF00
      000000020000000000000000007242000006004D656D6F343300020035010000
      7C0100004C0000000D0000004300000001000000000000000000FFFFFF1F2C02
      000000000001000C005469636B6574204DE964696F00000000FFFF0000000000
      020000000100000000090068656C766574696361000800000002000000000001
      0000001700020000000000FFFFFF000000000200000000000000000056430000
      06004D656D6F34340002007003000040010000380000000D00000000000000F0
      030000000000000000FFFFFF1F2C000000080064642F6D6D2F79790001005900
      5B464F524D4154464C4F415428272323232C2323232C2323302E3030272C5355
      4D285B71727952656C61746F72696F50726F6475746F7356656E6465646F7265
      732E22646573636F6E746F225D2C56656E6461732C3029295D00000000FFFF00
      00000000020000000100000000090068656C7665746963610008000000020000
      000000010000001700020000000000FFFFFF0000000002000000000000000000
      3A44000006004D656D6F3435000200740300007C010000380000000D00000000
      000000F0030000000000000000FFFFFF1F2C000000080064642F6D6D2F797900
      010059005B464F524D4154464C4F415428272323232C2323232C2323302E3030
      272C53554D285B71727952656C61746F72696F50726F6475746F7356656E6465
      646F7265732E22646573636F6E746F225D2C56656E6461732C3029295D000000
      00FFFF0000000000020000000100000000090068656C76657469636100080000
      00020000000000010000001700020000000000FFFFFF00000000020000000000
      00000000C444000006004D656D6F3437000200A8030000780000003600000018
      00000043000F00F4010000000000000000FFFFFF1F2C02000000000001000700
      4CCD515549444F00000000FFFF0000000000020000000100000000090068656C
      76657469636100070000000000000000000A0000000100020000000000FFFFFF
      0000000002000000000000000000D045000006004D656D6F3438000200A50300
      00E30000003C0000000D0000000000000001000000000000000000FFFFFF1F2C
      000000080064642F6D6D2F797900010081005B464F524D4154464C4F41542827
      2323232C2323232C2323302E3030272C20285B71727952656C61746F72696F50
      726F6475746F7356656E6465646F7265732E22746F74616C707265636F76656E
      6461225D2B5B71727952656C61746F72696F50726F6475746F7356656E646564
      6F7265732E22646573636F6E746F225D29295D00000000FFFF00000000000200
      00000100000006090068656C7665746963610007000000000000000000010000
      000100020000000000FFFFFF0000000002000000000000000000E74600000600
      4D656D6F3439000200A903000040010000380000000D00000000000000F00300
      00000000000000FFFFFF1F2C000000080064642F6D6D2F79790001008C005B46
      4F524D4154464C4F415428272323232C2323232C2323302E3030272C53554D28
      5B71727952656C61746F72696F50726F6475746F7356656E6465646F7265732E
      22746F74616C707265636F76656E6461225D2B5B71727952656C61746F72696F
      50726F6475746F7356656E6465646F7265732E22646573636F6E746F225D2C56
      656E6461732C3029295D00000000FFFF00000000000200000001000000000900
      68656C7665746963610008000000020000000000010000001700020000000000
      FFFFFF0000000002000000000000000000FE47000006004D656D6F3530000200
      AD0300007C010000380000000D00000000000000F0030000000000000000FFFF
      FF1F2C000000080064642F6D6D2F79790001008C005B464F524D4154464C4F41
      5428272323232C2323232C2323302E3030272C53554D285B71727952656C6174
      6F72696F50726F6475746F7356656E6465646F7265732E22746F74616C707265
      636F76656E6461225D2B5B71727952656C61746F72696F50726F6475746F7356
      656E6465646F7265732E22646573636F6E746F225D2C56656E6461732C302929
      5D00000000FFFF0000000000020000000100000000090068656C766574696361
      0008000000020000000000010000001700020000000000FFFFFF000000000200
      00000000000000009248000006004D656D6F3231000200DE0300007800000036
      0000001800000043000F00F4010000000000000000FFFFFF1F2C020000000000
      0100110044C94249544F206F75204352C94449544F00000000FFFF0000000000
      020000000100000000090068656C76657469636100070000000000000000000A
      0000000100020000000000FFFFFF0000000002000000000000000000AB490000
      06004D656D6F3330000200E0030000E3000000340000000D0000000000000001
      000000000000000000FFFFFF1F2C000000080064642F6D6D2F79790001008E00
      5B4946285B71727952656C61746F72696F50726F6475746F7356656E6465646F
      7265732E226372656469746F74726F6361225D203C3E20302C20464F524D4154
      464C4F415428272323232C2323232C2323302E3030272C205B71727952656C61
      746F72696F50726F6475746F7356656E6465646F7265732E226372656469746F
      74726F6361225D292C202727295D00000000FFFF000000000002000000010000
      0006090068656C76657469636100070000000000000000000100000001000200
      00000000FFFFFF0000000002000000000000000000934A000006004D656D6F33
      38000200E003000040010000340000000D00000000000000F003000000000000
      0000FFFFFF1F2C000000080064642F6D6D2F79790001005D005B464F524D4154
      464C4F415428272323232C2323232C2323302E3030272C53554D285B71727952
      656C61746F72696F50726F6475746F7356656E6465646F7265732E2263726564
      69746F74726F6361225D2C56656E6461732C3029295D00000000FFFF00000000
      00020000000100000000090068656C7665746963610008000000020000000000
      010000001700020000000000FFFFFF00000000020000000000000000007B4B00
      0006004D656D6F3531000200E40300007C010000340000000D00000000000000
      F0030000000000000000FFFFFF1F2C000000080064642F6D6D2F79790001005D
      005B464F524D4154464C4F415428272323232C2323232C2323302E3030272C53
      554D285B71727952656C61746F72696F50726F6475746F7356656E6465646F72
      65732E226372656469746F74726F6361225D2C56656E6461732C3029295D0000
      0000FFFF0000000000020000000100000000090068656C766574696361000800
      0000020000000000010000001700020000000000FFFFFF000000000200000000
      0000000000214C000006004D656D6F3532000200840200005401000014010000
      0D0000004300000001000000000000000000FFFFFF1F2C020000000000010023
      0056616C6F7220546F74616C202D204465622E2F437265642E20646F20436C69
      656E746500000000FFFF0000000000020000000100000000090068656C766574
      6963610008000000020000000000010000001700020000000000FFFFFF000000
      0002000000000000000000684D000006004D656D6F3533000200A90300005401
      0000380000000D00000000000000F0030000000000000000FFFFFF1F2C000000
      080064642F6D6D2F7979000100BC005B464F524D4154464C4F41542827232323
      2C2323232C2323302E3030272C53554D285B71727952656C61746F72696F5072
      6F6475746F7356656E6465646F7265732E22746F74616C707265636F76656E64
      61225D2B5B71727952656C61746F72696F50726F6475746F7356656E6465646F
      7265732E22646573636F6E746F225D2B5B71727952656C61746F72696F50726F
      6475746F7356656E6465646F7265732E226372656469746F74726F6361225D2C
      56656E6461732C3029295D00000000FFFF000000000002000000010000000009
      0068656C76657469636100080000000200000000000100000017000200000000
      00FFFFFF00000000020000000000000000000E4E000006004D656D6F35340002
      008802000090010000140100000D0000004300000001000000000000000000FF
      FFFF1F2C0200000000000100230056616C6F7220546F74616C202D204465622E
      2F437265642E20646F20436C69656E746500000000FFFF000000000002000000
      0100000000090068656C76657469636100080000000200000000000100000017
      00020000000000FFFFFF0000000002000000000000000000554F000006004D65
      6D6F3535000200AD03000090010000380000000D00000000000000F003000000
      0000000000FFFFFF1F2C000000080064642F6D6D2F7979000100BC005B464F52
      4D4154464C4F415428272323232C2323232C2323302E3030272C53554D285B71
      727952656C61746F72696F50726F6475746F7356656E6465646F7265732E2274
      6F74616C707265636F76656E6461225D2B5B71727952656C61746F72696F5072
      6F6475746F7356656E6465646F7265732E22646573636F6E746F225D2B5B7172
      7952656C61746F72696F50726F6475746F7356656E6465646F7265732E226372
      656469746F74726F6361225D2C56656E6461732C3029295D00000000FFFF0000
      000000020000000100000000090068656C766574696361000800000002000000
      0000010000001700020000000000FFFFFF000000000200000000000000000040
      50000006004D656D6F35360002003E020000400100002C0000000D0000000000
      0000F0030000000000000000FFFFFF1F2C000000080064642F6D6D2F79790001
      0060005B466F726D6174466C6F6174285B4D6173636172615175616E74696461
      64655D2C5B53554D285B71727952656C61746F72696F50726F6475746F735665
      6E6465646F7265732E227175616E746964616465225D2C56656E6461732C3029
      5D295D00000000FFFF0000000000020000000100000000090068656C76657469
      63610008000000020000000000010000001700020000000000FFFFFF00000000
      020000000000000000002C51000006004D656D6F3538000200420200007C0100
      002C0000000D00000000000000F0030000000000000000FFFFFF1F2C00000008
      0064642F6D6D2F797900010061005B466F726D6174466C6F6174285B4D617363
      6172615175616E7469646164655D2C5B53554D285B71727952656C61746F7269
      6F50726F6475746F7356656E6465646F7265732E227175616E74696461646522
      5D2C56656E6461732C30295D295D2000000000FFFF0000000000020000000100
      000000090068656C766574696361000800000002000000000001000000170002
      0000000000FFFFFF00000000020000000000000000006152000006004D656D6F
      353900020000020000400100002C0000000D00000000000000F0030000000000
      000000FFFFFF1F2C000000080064642F6D6D2F7979000300A4005B466F726D61
      74466C6F6174285B4D6173636172615175616E7469646164655D2C5B5B53554D
      285B71727952656C61746F72696F50726F6475746F7356656E6465646F726573
      2E227175616E746964616465225D2C56656E6461732C30295D2F5B53554D285B
      71727952656C61746F72696F50726F6475746F7356656E6465646F7265732E22
      7469636B65745F636F756E74225D2C56656E6461732C30295D5D295D20200D00
      000D000000000000FFFF0000000000020000000100000000090068656C766574
      6963610008000000020000000000010000001700020000000000FFFFFF000000
      0002000000000000000000E852000006004D656D6F3630000200DC0100004001
      0000200000000D0000004300000001000000000000000000FFFFFF1F2C020000
      00000001000400502E412E00000000FFFF000000000002000000010000000009
      0068656C76657469636100080000000200000000000100000017000200000000
      00FFFFFF00000000020000000000000000001754000006004D656D6F36310002
      00040200007C0100002C0000000D00000000000000F0030000000000000000FF
      FFFF1F2C000000080064642F6D6D2F7979000100A4005B466F726D6174466C6F
      6174285B4D6173636172615175616E7469646164655D2C5B5B53554D285B7172
      7952656C61746F72696F50726F6475746F7356656E6465646F7265732E227175
      616E746964616465225D2C56656E6461732C30295D2F5B53554D285B71727952
      656C61746F72696F50726F6475746F7356656E6465646F7265732E227469636B
      65745F636F756E74225D2C56656E6461732C30295D5D295D202000000000FFFF
      0000000000020000000100000000090068656C76657469636100080000000200
      00000000010000001700020000000000FFFFFF00000000020000000000000000
      009E54000006004D656D6F3632000200E00100007C010000200000000D000000
      4300000001000000000000000000FFFFFF1F2C02000000000001000400502E41
      2E00000000FFFF0000000000020000000100000000090068656C766574696361
      0008000000020000000000010000001700020000000000FFFFFF000000000200
      000000000000FEFEFF110000000A00204361626563616C686F000000000F0052
      415A414F46494C49414C42415345000000000F00454E44455245434F5F424149
      52524F000000000D004345505F4349444144455F554600000000060054495455
      4C4F000100300006004F5554524153000100300011004D415343415241515541
      4E54494441444500080027232323232323270012006E636D6973656E746F7069
      73636F66696E7300050046616C7365000C00204167727570616D656E746F0000
      0000120041677275706172477275706F46696C69616C00050046616C7365000D
      004167727570617246696C69616C00050046616C736500100041677275706172
      4461746156656E646100050046616C7365000C0020544F54414C495A4143414F
      000000000F00544F54414C505245434F504155544100010030000F00544F5441
      4C505245434F56454E444100010030001600544F54414C505245434F50415554
      41434C49454E544500010030001600544F54414C505245434F56454E4441434C
      49454E544500010030000000000000000000FC00000000000000000000000000
      000000580042C995683481E3400E6AD3100C22E640}
  end
  object qryProcuraClientes: TtecQuery
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
      'SELECT codigo, nome, tipo'
      'FROM vfornecedores'
      'WHERE codigo = :codigo'
      '  AND tipo = :tipocliente')
    RequestLive = False
    Left = 681
    Top = 179
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftUnknown
        Name = 'tipocliente'
        ParamType = ptUnknown
      end>
    object qryProcuraClientescodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryProcuraClientesnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryProcuraClientestipo: TStringField
      FieldName = 'tipo'
      Size = 1
    end
  end
  object dsrProcuraClientes: TtecDataSource
    DataSet = qryProcuraClientes
    Left = 681
    Top = 227
  end
  object qryConsultaClientes: TtecQuery
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
      'Select v.codigo,'
      '       v.nome,'
      '       formatar_cpf_cnpj(v.pessoanumero) as pessoanumero,'
      '       v.tipo as tipoorig,'
      '       descricao_tipocliente(v.tipo) as tipo,'
      '       v.estado,'
      '       c.nome as nomecidade'
      'From    vfornecedores v, cidades c'
      'Where (v.codigo = 0) '
      '   and  (v.estado = c.estado)'
      '   and (v.cidade = c.codigo)'
      'Order By UPPER(TO_ASCII(v.nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 679
    Top = 279
    object qryConsultaClientesnome: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaClientespessoanumero: TStringField
      DisplayLabel = 'CPF/CNPJ'
      DisplayWidth = 18
      FieldName = 'pessoanumero'
      Size = 50
    end
    object qryConsultaClientesnomecidade: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 30
      FieldName = 'nomecidade'
      Required = True
      Size = 80
    end
    object qryConsultaClientesestado: TStringField
      DisplayLabel = 'UF'
      FieldName = 'estado'
      Size = 2
    end
    object qryConsultaClientescodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
    object qryConsultaClientestipo: TStringField
      DisplayLabel = 'TipoCliente'
      DisplayWidth = 10
      FieldName = 'tipo'
      Size = 50
    end
    object qryConsultaClientestipoorig: TStringField
      FieldName = 'tipoorig'
      Visible = False
      Size = 1
    end
  end
  object frpRelatorioProdutosClientes_SemValores: TfrReport
    Dataset = fdsRelatorioProdutosClientes_
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnBeforePrint = frpRelatorioProdutosClientes_BeforePrint
    Left = 423
    Top = 424
    ReportForm = {
      19000000A33B000019FFFF00000A0050444643726561746F7200FFFFFFFFFF00
      000000340800009A0B0000000000002400000000000000120000000100040000
      0000FFFF000000000000000000000000030400466F726D00FEFFFFFFDC000000
      780000007C0100002C0100000406000500626567696E0D17002020544F54414C
      50524F4455544F532020203A3D20303B0D1B002020544F54414C474552414C20
      2020202020202020203A3D20303B0D17002020544F54414C50524F434C49454E
      5445203A3D20303B0D0D002020434F554E54203A3D20303B0D0300656E6400FF
      FFFFFFFF00000000340800009A0B000000000000000000000000000000000000
      01000400000000FFFF000000000000000000000000030400466F726D00FEFFFF
      FFDC000000780000007C0100002C010000040000000200960100000900666276
      526F6461706500020100000000CC0200002F0400000F00000030000300010000
      00000000000000FFFFFF1F00000000000000000000000000FFFF000000000002
      000000010000000000000001000000C800000014000000010000000000000200
      010200000B00506167654865616465723100020100000000480000002F040000
      4A0000003000020001000000000000000000FFFFFF1F00000000000000000000
      000000FFFF000000000002000000010000000000000001000000C80000001400
      0000010000000000000200A7020000060056656E64617300020100000000C300
      00002F0400005E0000003400050001000000000000000000FFFFFF1F00000000
      1200666473456E64657265636F436C69656E7465000000000300050062656769
      6E0D1800202020544F54414C50524F434C49454E5445203A3D20303B0D030065
      6E640001000000000000020000000100000000060046696C6861310001000000
      C8000000140000000100000000000002000D030000060046696C686131000201
      00000000300100002F0400000A0000003000150001000000000000000000FFFF
      FF1F00000000000000000000000000FFFF000000000002000000010000000000
      000001000000C80000001400000001000000000000020081030000140053756D
      E172696F446F2052656C6174F372696F31000201000000006C0100002F040000
      160000003000010001000000000000000000FFFFFF1F00000000000000000000
      000000FFFF000000000002000000010000000000000001000000C80000001400
      0000010000000000000100A61B000007006670764C6F676F0002001A00000048
      000000730000002700000005000000F4010000000000000000FFFFFF1F2C0200
      00000000000000000000FFFF00000000000200000001000000060100A61B0000
      424DCE1700000000000036040000280000008300000026000000010008000000
      000098130000120B0000120B0000000100000001000000000000E8E5A800AA9E
      000099990000ADADAD003A3C4100A3970000BFB73700D8D48600FBFAF000A5A5
      A5001E1D1C00D8D9DA0054575A00D6D6D500E7E8F20012161B00B6AD1900CBC5
      5B008C8D9200BEC0C500E1E2E40085878A005E606300494C4F00090D12002C2E
      3300DEDB98007D7F8100EFEDCB00B9BABB00AEA400007C7B7B00C5BE44006666
      6600D1CC6F00CDC9810048484600F7F6E600AFA5080004080D00F9F8ED00B8AF
      2700DBD68C00999999001B1A1900C6BF5100131312003B3A3A00FFFFFF00EAE8
      BE00CCCCCC0023262A00E2DEA400F1EFD600B0B1B300D3CD7500B1A81000CCCC
      660072727200535252004342420001060A00ECE9C3008C8C8B00F5F4DF004A4A
      4A0057575600B6AC1F00282B3000C7C05C0061615F00F7F7F70088888700DDD8
      9300E3E0A600FDFCF70021242900070A1000BDB53100C5BE4A00E3E3E200A69C
      000099999900BABAB900DEDEDE00525458002A292800D9D58A005F5E5D00C7C5
      95001B1E2300E8E5B60000000700B5AB1300D5D07B00C6C6C500B2A80B002120
      2000B9B12400504F4E00666666006B6D7000B5B5BD0084848400E0DC9E00BCB4
      2C00F7EFD6005B5B5A00EFEFEF0087898B00DEDEE6003E3D3C0014181E00C8C2
      5300CCC55F00A8A9AC00BDBDBC00E5E1AC0075767900181B2000E6E6E6000E11
      17000810190033333300929191002D2C2B00B5B5B40000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31543D42470E3131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313152313131313148
      6D3131316D6D4C3131316D6D313131313131313131316D483131313131313131
      6D6D3131316D040A6C6C313131313131486D6D4C3131313131316D6D4C313131
      313131313131313131486D6D6D313131313131486D6D48313131316D48313131
      6D6D3131313131313131313131316D6D6D3131486D6D6D313131313131523131
      31317F7E6631554225256031603D42647931420C313B7D316D6C3D7040313166
      2C316D593D7068313133646C702531484255312C70643059313131310C252542
      0E31477431420E4825793131315442433D474C4C640E3120423C300A3131207E
      2C317F70254748484251512531603C316D59253C620A312C2543306831313131
      3152313131316C2031315959313131317C7D4C4C31487C0E3159683177424C51
      347531434031203D487957543130494C7F3D31487C0C310B37317F7031313131
      3C6631313131642C317C33487E51313131313179602F55317C3331316D793B70
      31487E14314857043131316D7C55557E311E3031542D4C314340313148790A0B
      4C313131315231313131477D313125306C64334C5779313131487C0E31224931
      422C31314340316C7D313C7D3131594931570C31543D31487C0C316870593025
      3131313170706C3C0E313C0A313033317C513131310C702570474C4C3033312C
      7C64300A3148300E31796243432248483051517C31603D316D6464590B2C3154
      7C42301C313131313152313131314749313166420C5548313D2C484831487C0E
      48302C311C4248516275316C7D31493D4879627F31256848373031487C0E3131
      550E207031313131473C0C554831642C4C7E330C62793131316830796D313148
      7C3331577D6D6D313148303331487C49555131487C0C0C7E4C2C703131480C0E
      7C2C313C476D6D31313131313152313131040B7E20316D473C6C33310E3D3C6C
      7931254264646D31486C42706831316C7D31484742702031310E3D433D6C3148
      4355314043473D0A31313131796C3C6C0E316670597E3C3D20313131310E256C
      6C7731316C0E312C3D47430431772F3D0A3133424366484825643C7E6C7C7431
      6D225943425531543D59437D3131313131523131316D643B6D3131316D514831
      313179514C316D51793131313131796D3131313C40313131796D313131313179
      794831317F6D316D15154831313131313131795148314879516D796D31313131
      31313151517931317F6D31316D51516D3151577F6D313131797931316D51516D
      5148313131515151313131314851516D31313131315231313131400431313131
      3131313131313131313131313131313131313131313131680431313131313131
      3131313131313148660F31313131313131313131313131313131313131313131
      313131313131313131313131220E313131313131313166553131313131313131
      3131313131313131313131313131313131313131313131313152313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131315C46121212463F31313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131523131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131315F06020202061B313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31523131313131310E40173C18183D6E3131313131310C2C666C3C1818181818
      05683131313131316D3768220D0516313131313108021F1F1F52353131313131
      72070707070707070707070707070750732B3631313131313131313131362B73
      212112081D31313131313131313123505050504B3131313131313131313F0812
      2E505050085231313131312C103E191919195D17313131317966713E4E191919
      191919195D0D31313131312C34282819190017313131313108021F1F1F523531
      313131311152020202020202020202020202020202022776313131313131313F
      501F02020202020202075C313131313131316A060202065F313131313131314C
      120202020202020221523131313175287A78787878784E223131310E1A3E1078
      7871717171717171281731313131773E7A717171712822313131313108021F1F
      1F5235313131313144021F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1D313131
      31310802021F1F1F1F1F1F1F1F02022331313131313107021F1F020831313131
      3131313A521F1F1F1F1F1F1F5052313131310D4E7878787A7A71282231316D7C
      4E7878784E4E7A717171717128173131312C3E7171717119195D223131313131
      08021F1F1F5269314C4C4C4C631F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F52
      503131313138521F1F1F0202020202021F1F1F5212313131313107021F1F0208
      313131313131361F1F1F1F1F0202020221523131316D457A78787A3D370E0E51
      31313B3E7878787A2274140E0E0E0E0E0E15313115787A787871190D0A145A2A
      6A6A6A2A5F36363636365044111111113226262626262626262626262626264A
      1F1F1F1F612631311B521F1F1F02443A08082363021F1F1F525F313131310702
      1F1F02083131313131311B021F1F1F1F6A2B353532523131310E71717171710C
      313131313115781078784E683131313131313131313131311C287878787A2C31
      31310106020202025F3131313131505202020202363131313131313131313131
      3131313144021F1F1F32312639021F1F1F584C31313131311B27021F1F1F3631
      313107021F1F020831313131313123021F1F1F11093131313152313131337A71
      7171454831313131312C28787810344C313131313131313131313131057A7878
      4E663131313135021F1F1F025F313131313150021F1F1F1F3631313131313131
      313131313131314C5E021F1F0276315F521F1F1F4B313131313131313132271F
      1F527331313107021F1F020831313131313112021F1F02723131313131523131
      31601978787A7C4C3131313131662878781045166E6E6E6E6E6E6E6E1C043155
      5B1078717A603131313135021F1F1F025F313131313150021F1F1F1F36313131
      313131314C0909090909363A021F1F1F1F3F314F021F02723131313131313131
      313123021F1F1109313107021F1F02083131313131312E021F1F027331313131
      3152313131601978787A054C3131313131561978787871282828282828282828
      005631337A717171346D313131313552020202025F3131313131210602020202
      3631313131762E635E61616161611F1F1F1F1F1F114C26611F1F027631313131
      3131313131311D1F1F1F1F1D313107021F1F02083131313131312E021F1F023A
      313131313152313131601978787A054C31313131311819787878787878787878
      787878784E1731141978787A454831313131764444444444241551515151464F
      4F4F4F4F413131313A0202021F1F1F1F1F1F1F1F1F1F1F521B311D1F1F1F1F36
      3131313131313131313126391F1F1F5C313107021F1F02083131313131312E02
      1F1F023A313131313152313131601978787A054C313131313156197878787878
      78787878787878784E1731337A717171346D313131313109090909097D713434
      347A37313131313131313158521F1F1F1F1F0202020202020202275831311D1F
      1F1F1F1D3131313131313131313126391F1F1F5C313107021F1F020831313131
      31312E021F1F023A313131313152313131601978787A054C3131313131224E78
      7878784E28282828282828280056310C787171715B0C31313131313131313131
      133E1010105D74313131313131312939021F1F1F1F3911636363636A50083631
      313126611F1F024B313131313131313131313F021F1F1F36313107021F1F0208
      3131313131312E021F1F023A313131313152313131601978787A054C31313131
      3116287878101A2C2C2C2C2C2C2C2C2C7D1E316D1A7A7878197F313131313131
      31313131134E78787828743131313131313176021F1F1F1F2326313131313131
      3131313131313107021F02213131313131313131313173021F1F444C31310702
      1F1F02083131313131312E021F1F023A313131313152313131601978787A054C
      31313131317F197171713448313131313131313131313131561978784E663131
      3131313131313131134E7878782874313131313131312B521F1F1F6129313131
      313131313131313131313158521F1F024A31313131313131317602021F522331
      313107021F1F02083131313131312E021F1F023A313131313152313131331978
      787A053131313131316D347A78784E133131313131313131313131317D287878
      71710431313131313131313113001919190004313131313131312B521F1F1F27
      4131313131313131313131313131310911021F1F1F232631313131295F1F1F1F
      1F612931313107021F1F022B3131313131312E021F1F52233131313131520E14
      602C7A78787A7C141414140C3131203E78787171660A1E6014141414140E3131
      155B107878107A567D371E1E1E1E1E1E13566C6C6C182C75757575756D315C02
      1F1F1F1F211B1B1B1B1B1B4A4A4A4A4A3631313176021F1F1F0261502323725E
      021F1F1F0258762B2B4A44021F1F1F504A4A4A2B1D312E021F1F1F074A4A4A4A
      5C520D7A7A7A78787878787A7A7A5D1731317945197878784E4E7A7A7A7A7A7A
      5D6C313131165D7171717119191919191919195D6E313131313166007A7A7A4E
      1431295E021F1F1F0202020202020202020202062B313131315802021F1F1F02
      0202021F1F1F1F52384C395252521F1F1F1F1F020202020608312E021F1F1F1F
      0202020221521771717878787878787171714E22313131335B28717878787871
      717171714E1731313131173E7A717878787878787878784E6E31313131316628
      7171717A6031314A521F1F1F1F1F1F1F1F1F1F1F1F1F1F524A31313131316939
      521F1F1F1F1F1F1F1F020258310911021F1F1F1F1F1F1F1F1F1F1F022B312E02
      1F1F1F1F1F1F1F1F50520D19191978787878781919190017313131310C0D1028
      4E4E191919191919000D31313131317D1A4E4E4E19191919191919001C313131
      3131662878787810603131315F0202020202020202020202020202062B313131
      31313136733902020202020261721D313129615252521F1F1F1F1F0202020206
      08312E021F1F1F1F0202020221527D17173C107878714D1717170D2C31313131
      31310E0A1C3B2217171717170D7D31313131313148757D77661717171717170D
      0431313131316628787878106031313131364A3A727272727272727272727250
      5C3131313131313131264B5F737338354131313131093A7272725E1F1F1F1F4F
      1212122E5C312E021F1F1F631212121258523131310E1978787A053131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313117003E3E3E5D75313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131310702
      1F1F52583131313131312E021F1F0223313131313152313131601978787A054C
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131317F686E6E6E6E153131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313121021F1F02073131313131312E021F1F023A313131313152313131601978
      787A054C31313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313173021F1F1F1F4F3A233A32312E021F1F023A3131313131523131
      31601978787A054C313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313169521F1F1F1F0202020608312E021F1F023A31313131
      3152313131601978787A054C3131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131310963521F1F1F1F1F1F024A312E021F1F023A
      313131313152313131601971717A054C31313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131313131314150611F1F1F1F1F024A315002
      1F1F023A3131313131523131310C0D17176C774C313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131313131313131313131315C387272727272
      5C31082E2E2E2E1B3131313131520000351C00000900666D76546974756C6F00
      0200680100004C000000380200001200000043000000F4010000000000000000
      FFFFFF1F2C020000000000010009005B546974756C6F5D2000000000FFFF0000
      000000020000000100000000090068656C766574696361000B00000002000000
      0000020000000000020000000000FFFFFF0000000002000000000000000000CC
      1C00000700666D7644617461000200A50300004C0000005A0000000D00000043
      000000F4010000000000000000FFFFFF1F2C020000000000010013005B444154
      4520234464642F6D6D2F797979795D00000000FFFF0000000000020000000100
      000000090068656C766574696361000800000000000000000001000000010002
      0000000000FFFFFF0000000002000000000000000000591D00000900666D7650
      6167696E61000200B50300005C0000004A0000000F00000043000000F4010000
      000000000000FFFFFF1F2C020000000000010007005B50414745235D00000000
      FFFF0000000000020000000100000000090068656C7665746963610008000000
      000000000000010000000100020000000000FFFFFF0000000002000000000000
      000000EE1D00000700666D76486F726100020024000000CC020000580000000A
      00000043000000F4010000000000000000FFFFFF1F2C02000000000001001100
      5B54494D4520235468683A6D6D3A73735D00000000FFFF000000000002000000
      0100000000090068656C76657469636100070000000000000000001000000001
      00020000000000FFFFFF00000000020000000000000000009B1E00001000666D
      76446573656E766F6C7665646F7200020033030000CD020000CC0000000A0000
      0043000000F4010000000000000000FFFFFF1F2C020000000000010020007465
      63534F4654202D205465636E6F6C6F67696120656D2053697374656D61730000
      0000FFFF0000000000020000000100000000090068656C766574696361000700
      0000000000000000110000000100020000000000FFFFFF000000000200000000
      0000000000261F00000900666D764F7574726173000200680100006000000039
      0200001600000043000000F4010000000000000000FFFFFF1F2C020000000000
      010009005B4F75747261735D2000000000FFFF00000000000200000001000000
      000500417269616C0007000000000000000000020000000000020000000000FF
      FFFF0000000002000000000000000000B11F000005004D656D6F350002009302
      000078000000370100001800000043000A00F4010000000000000000FFFFFF1F
      2C02000000000001000900444553435249C7C34F00000000FFFF000000000002
      0000000100000000090068656C76657469636100070000000000000000000A00
      00000100020000000000FFFFFF00000000020000000000000000005620000006
      004D656D6F323000020019000000C3000000F70000000D00000060000000F401
      0000000000000000FFFFFF1F2C020000000000010022005B717279456E646572
      65636F436C69656E74652E226E6F6D65636C69656E7465225D00000000FFFF00
      00000000020000000100000006090068656C7665746963610008000000000000
      000000000000000100020000000000FFFFFF0000000002000000000000000000
      0B21000006004D656D6F34360002001501000078000000430000001800000043
      000A00F4010000000000000000FFFFFF1F2C020000000000010032005B494628
      5B6E636D6973656E746F706973636F66696E735D3D46616C73652C2027434F4E
      545241544F272C274E434D27295D00000000FFFF000000000002000000010000
      0000090068656C76657469636100070000000000000000000A00000001000200
      00000000FFFFFF0000000002000000000000000000A021000006004D656D6F35
      37000200FB01000078000000830000001800000043000E00F401000000000000
      0000FFFFFF1F2C0200000000000200080050524F4455544F2F0D070053455256
      49C74F00000000FFFF0000000000020000000100000000090068656C76657469
      636100070000000000000000000A0000000100020000000000FFFFFF00000000
      02000000000000000300F82100000A005375625265706F727431000200180100
      00C3000000EC020000120000000100000001000000000000000000FFFFFF1F2C
      020000000000000000000000FFFF000000000002000000010000000001000000
      00001423000006004D656D6F313000020019000000FA000000D7010000220000
      0043000000F4010000000000000000FFFFFF1F2C02000000000003001A005B71
      7279456E64657265636F436C69656E74652E22727561225D0D25004241495252
      4F3A205B717279456E64657265636F436C69656E74652E2262616972726F225D
      0D54005B464F524D415454455854282723232E2323232D232323272C205B7172
      79456E64657265636F436C69656E74652E22636570225D295D205B717279456E
      64657265636F436C69656E74652E22636964616465225D00000000FFFF000000
      0000020000000100000000090068656C76657469636100070000000000000000
      00000000000100020000000000FFFFFF0000000002000000000000000000BF23
      000006004D656D6F323100020019000000DF000000B30000000D000000400000
      00F4010000000000000000FFFFFF1F2C020000000000010028004350463A205B
      717279456E64657265636F436C69656E74652E22706573736F616E756D65726F
      225D00000000FFFF0000000000020000000100000000090068656C7665746963
      610008000000000000000000000000000100020000000000FFFFFF0000000002
      0000000000000004000E24000005004C696E65310002001C0000003A010000FB
      030000000000000100080064000000000000000000FFFFFF1F2C020000000000
      000000000000FFFF000000000002000000010000000000009424000005004D65
      6D6F320002005701000078000000150000001800000043000E00F40100000000
      00000000FFFFFF1F2C020000000000010004005349542E00000000FFFF000000
      0000020000000100000000090068656C76657469636100070000000000000000
      000A0000000100020000000000FFFFFF00000000020000000000000000002925
      000005004D656D6F390002006A030000700100005C0000000D00000000000000
      01000000000000000000FFFFFF1F2C000000080064642F6D6D2F79790001000B
      00544F54414C20474552414C00000000FFFF0000000000020000000100000000
      090068656C766574696361000800000002000000000001000000010002000000
      0000FFFFFF0000000002000000000000000000BB25000006004D656D6F313100
      0200D1030000700100002E0000000D00000000000000F0030000000000000000
      FFFFFF1F2C02000000000001000F005B544F54414C50524F4455544F535D0000
      0000FFFF0000000000020000000100000000090068656C766574696361000800
      0000020000000000010000001700020000000000FFFFFF000000000200000000
      00000000005F26000006004D656D6F313600020019000000ED000000B3000000
      0D00000048000000F4010000000000000000FFFFFF1F2C020000000000010021
      00464F4E453A205B717279456E64657265636F436C69656E74652E22666F6E65
      225D00000000FFFF0000000000020000000100000000090068656C7665746963
      610008000000000000000000000000000100020000000000FFFFFF0000000002
      000000000000000000E426000005004D656D6F340002007B0200007800000019
      0000001800000043000F00F4010000000000000000FFFFFF1F2C020000000000
      0100030046494C00000000FFFF0000000000020000000100000000090068656C
      76657469636100070000000000000000000A0000000100020000000000FFFFFF
      00000000020000000000000000006A27000005004D656D6F33000200CA030000
      78000000350000001800000043000F00F4010000000000000000FFFFFF1F2C02
      0000000000010004005154444500000000FFFF00000000000200000001000000
      00090068656C76657469636100070000000000000000000A0000000100020000
      000000FFFFFF0000000002000000000000000000F327000005004D656D6F3100
      02001900000078000000FC0000001800000043000F00F4010000000000000000
      FFFFFF1F2C02000000000001000700434C49454E544500000000FFFF00000000
      00020000000100000000090068656C7665746963610007000000000000000000
      0A0000000100020000000000FFFFFF00000000020000000000000000007D2800
      0005004D656D6F370002006C01000078000000380000001800000043000F00F4
      010000000000000000FFFFFF1F2C02000000000001000800464154555241444F
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      070000000000000000000A0000000100020000000000FFFFFF00000000020000
      000000000000003829000007004D656D6F3135360002009000000048000000D7
      0000002E0000004B000000F4010000000000000000FFFFFF1F2C020000000000
      030011005B52415A414F46494C49414C424153455D0D0F005B4345505F434944
      4144455F55465D0D11005B454E44455245434F5F42414952524F5D00000000FF
      FF0000000000020000000100000000090068656C766574696361000700000000
      0000000000000000000100020000000000FFFFFF000000000200000000000000
      0000C629000005004D656D6F38000200A6010000780000005800000018000000
      43000B00F4010000000000000000FFFFFF1F2C02000000000001000C004E4F54
      41202F204355504F4D00000000FFFF0000000000020000000100000000090068
      656C76657469636100070000000000000000000A0000000100020000000000FF
      FFFF0000000002000000000000000000962A000006004D656D6F343200020019
      000000D1000000AB0000000D00000060000000F4010000000000000000FFFFFF
      1F2C02000000000001004D0043D34449474F3A205B717279456E64657265636F
      436C69656E74652E227469706F636C69656E7465225D5B272D275D5B71727945
      6E64657265636F436C69656E74652E22636C69656E7465225D00000000FFFF00
      00000000020000000100000000090068656C7665746963610008000000000000
      000000000000000100020000000000FFFFFF0000000002000000000000000201
      5F2B00000C004461646F734D65737472653100020100000000500000002F0400
      00000000003100050001000000000000000000FFFFFF1F000000001C00666473
      52656C61746F72696F50726F6475746F73436C69656E74657300000000040005
      00626567696E0D17002020544F54414C50524F434C49454E5445203A3D20303B
      0D17002020544F54414C434C49454E5445202020203A3D20303B0D0300656E64
      00FFFF000000000002000000010000000000000001000000C800000014000000
      010000000000000201902D00000E004461646F734465446574616C6865000201
      00000000740000002F0400000D0000003100080001000000000000000000FFFF
      FF1F000000001C0066647352656C61746F72696F50726F6475746F73436C6965
      6E7465730000000007000500626567696E0D390020204946205B71727952656C
      61746F72696F50726F6475746F73436C69656E7465732E22707265636F76656E
      6461225D203C2030205448454E0D7C0020202020544F54414C434C49454E5445
      203A3D20544F54414C434C49454E5445202D205B71727952656C61746F72696F
      50726F6475746F73436C69656E7465732E227175616E746964616465225D202A
      205B71727952656C61746F72696F50726F6475746F73436C69656E7465732E22
      707265636F76656E6461225D0D06002020454C53450D7D0020202020544F5441
      4C434C49454E5445203A3D20544F54414C434C49454E5445202B205B71727952
      656C61746F72696F50726F6475746F73436C69656E7465732E227175616E7469
      64616465225D202A205B71727952656C61746F72696F50726F6475746F73436C
      69656E7465732E22707265636F76656E6461225D3B0D53002020544F54414C50
      524F434C49454E5445203A3D20544F54414C50524F434C49454E5445202B205B
      71727952656C61746F72696F50726F6475746F73436C69656E7465732E227175
      616E746964616465225D3B0D0300656E6400FFFF000000000002000000010000
      000000000001000000C800000014000000010000000000000201702F00000D00
      526F64617065446574616C686500020100000000DA0000002F04000017000000
      3100090001000000000000000000FFFFFF1F000000000000000000000E000500
      626567696E0D220020494620434F554E54284461646F734465446574616C6865
      293D2031207468656E200D0F00202020686569676874203A3D2034330D270020
      656C736520494620434F554E54284461646F734465446574616C686529203D20
      32207468656E0D1400202020686569676874203A3D203433202D2031330D2800
      20656C736520494620434F554E54284461646F734465446574616C686529203D
      2033207468656E200D1400202020686569676874203A3D203433202D2032360D
      280020656C736520494620434F554E54284461646F734465446574616C686529
      203D2034207468656E200D1400202020686569676874203A3D203433202D2033
      390D130020656C73652020686569676874203A3D20303B0D00000D3200204946
      20284C454E475448285B717279456E64657265636F436C69656E74652E227275
      61225D29203E20343129205448454E0D19002020686569676874203A3D206865
      69676874202B2031333B200D0300656E640000EA000000000002000000010000
      000000000001000000C800000014000000010000000000000001833100000600
      4D656D6F323600020002000000740000007D0000000D00000060000000F40100
      00000000000000FFFFFF1F2C020000000000010061015B4946285B6E636D6973
      656E746F706973636F66696E735D3D46616C73652C5B71727952656C61746F72
      696F50726F6475746F73436C69656E7465732E22636F6E747261746F225D2C5B
      71727952656C61746F72696F50726F6475746F73436C69656E7465732E226E63
      6D225D295D205B71727952656C61746F72696F50726F6475746F73436C69656E
      7465732E22736974756163616F225D205B4946285B71727952656C61746F7269
      6F50726F6475746F73436C69656E7465732E22726567697374726F225D203D20
      2756272C20464F524D41544441544554494D45282744442F4D4D2F5959272C20
      5B71727952656C61746F72696F50726F6475746F73436C69656E7465732E2266
      61747572616D656E746F225D292C20464F524D41544441544554494D45282744
      442F4D4D2F5959272C205B71727952656C61746F72696F50726F6475746F7343
      6C69656E7465732E226465766F6C7563616F225D29295D00000000FFFF000000
      0000020000000100000006090068656C76657469636100080000000000000000
      000100000001000000FF000000FFFFFF1F2F005B71727952656C61746F72696F
      50726F6475746F73436C69656E7465732E22726567697374726F225D203D2027
      44270002000000000000000001C032000006004D656D6F32380002007F000000
      74000000350000000D0000002000000001000000000000000000FFFFFF1F2C02
      000000000001008B005B71727952656C61746F72696F50726F6475746F73436C
      69656E7465732E227365726965225D20205B4946285B71727952656C61746F72
      696F50726F6475746F73436C69656E7465732E224E554D45524F4E4F5441225D
      3D302C27272C5B71727952656C61746F72696F50726F6475746F73436C69656E
      7465732E224E554D45524F4E4F5441225D295D2000000000FFFF000000000002
      0000000100000006090068656C76657469636100080000000000000000000100
      000001000000FF000000FFFFFF1F2F005B71727952656C61746F72696F50726F
      6475746F73436C69656E7465732E22726567697374726F225D203D2027442700
      020000000000000000019B34000006004D656D6F3239000200B5000000740000
      00320000000D0000002000000001000000000000000000FFFFFF1F2C02000000
      0000010029015B4946285B71727952656C61746F72696F50726F6475746F7343
      6C69656E7465732E226D617175696E61225D3D302C27272C5B71727952656C61
      746F72696F50726F6475746F73436C69656E7465732E226D617175696E61225D
      295D20205B4946285B71727952656C61746F72696F50726F6475746F73436C69
      656E7465732E22494E54455256454E53414F225D3D302C27272C5B7172795265
      6C61746F72696F50726F6475746F73436C69656E7465732E22494E5445525645
      4E53414F225D295D20205B4946285B71727952656C61746F72696F50726F6475
      746F73436C69656E7465732E224E554D45524F4355504F4D225D3D302C27272C
      5B71727952656C61746F72696F50726F6475746F73436C69656E7465732E224E
      554D45524F4355504F4D225D295D2000000000FFFF0000000000020000000100
      000006090068656C766574696361000800000000000000000001000000010000
      00FF000000FFFFFF1F2F005B71727952656C61746F72696F50726F6475746F73
      436C69656E7465732E22726567697374726F225D203D20274427000200000000
      00000000018335000006004D656D6F3332000200EA0000007400000078000000
      0D0000000000000001000000000000000000FFFFFF1F2C000000080064642F6D
      6D2F79790001002E005B71727952656C61746F72696F50726F6475746F73436C
      69656E7465732E2270726F6475746F76697375616C225D00000000FFFF000000
      0000020000000100000006090068656C76657469636100080000000000000000
      000100000001000000FF000000FFFFFF1F2F005B71727952656C61746F72696F
      50726F6475746F73436C69656E7465732E22726567697374726F225D203D2027
      442700020000000000000000016936000006004D656D6F333300020064010000
      74000000140000000D0000000000000001000000000000000000FFFFFF1F2C00
      0000080064642F6D6D2F79790001002C005B71727952656C61746F72696F5072
      6F6475746F73436C69656E7465732E2266696C69616C76656E6461225D000000
      00FFFF0000000000020000000100000006090068656C76657469636100080000
      000000000000000100000001000000FF000000FFFFFF1F2F005B71727952656C
      61746F72696F50726F6475746F73436C69656E7465732E22726567697374726F
      225D203D2027442700020000000000000000014D37000006004D656D6F333400
      02007A01000074000000390100000D0000000B00000001000000000000000000
      FFFFFF1F2C000000080064642F6D6D2F79790001002A005B71727952656C6174
      6F72696F50726F6475746F73436C69656E7465732E2264657363726963616F22
      5D00000000FFFF0000000000020000000100000006090068656C766574696361
      00080000000000000000000000000001000000FF000000FFFFFF1F2F005B7172
      7952656C61746F72696F50726F6475746F73436C69656E7465732E2272656769
      7374726F225D203D202744270002000000000000000001DD37000006004D656D
      6F31330002003A020000DA000000600000000D00000043000000010000000000
      00000000FFFFFF1F2C02000000000001000D00546F74616C20436C69656E7465
      00000000FFFF0000000000020000000100000006090068656C76657469636100
      08000000020000000000010000001700020000000000FFFFFF00000000020000
      000000000000019438000006004D656D6F3137000200A4020000DA0000004400
      00000D0000000000000001000000000000000000FFFFFF1F2C02000000000001
      0034005B466F726D6174466C6F6174285B4D6173636172615175616E74696461
      64655D2C5B544F54414C50524F434C49454E54455D295D00000000FFFF000000
      0000020000000100000006090068656C76657469636100080000000200000000
      00010000001700020000000000FFFFFF0000000002000000000000000001FD39
      000006004D656D6F3139000200B702000074000000310000000D000000000000
      0001000000000000000000FFFFFF1F2C000000080064642F6D6D2F7979000100
      4E005B466F726D6174466C6F6174285B4D6173636172615175616E7469646164
      655D2C5B71727952656C61746F72696F50726F6475746F73436C69656E746573
      2E227175616E746964616465225D295D0003000500626567696E0D5100202054
      4F54414C50524F4455544F53203A3D20544F54414C50524F4455544F53202B20
      285B71727952656C61746F72696F50726F6475746F73436C69656E7465732E22
      7175616E746964616465225D293B0D0300656E6400FFFF000000000002000000
      0100000006090068656C76657469636100080000000000000000000100000001
      000000FF000000FFFFFF1F2F005B71727952656C61746F72696F50726F647574
      6F73436C69656E7465732E22726567697374726F225D203D2027442700020000
      0000000000FEFEFF120000000A00204361626563616C686F000000000F005241
      5A414F46494C49414C42415345000000000F00454E44455245434F5F42414952
      524F000000000D004345505F4349444144455F5546000000000600544954554C
      4F000100300006004F5554524153000100300011004D4153434152415155414E
      544944414445000700272323232323270012006E636D6973656E746F70697363
      6F66696E7300050046616C7365000C00204167727570616D656E746F00000000
      120041677275706172477275706F46696C69616C00050046616C7365000D0041
      67727570617246696C69616C00050046616C7365001000416772757061724461
      746156656E646100050046616C7365000C0020544F54414C495A4143414F0000
      00000A00544F54414C474552414C00010030000D00544F54414C50524F445554
      4F5300010030000F00544F54414C50524F434C49454E544500010030000C0054
      4F54414C434C49454E5445000100300009005661726961626C65310001003000
      0000000000000000FC00000000000000000000000000000000580042C9956834
      81E3400E6AD3100C22E640}
  end
  object frpRelatorioProdutosVendedores_SemValores: TfrReport
    Dataset = fdsRelatorioProdutosVendedores
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit, pbPageSetup]
    ReportType = rtMultiple
    StoreInDFM = True
    RebuildPrinter = False
    OnBeforePrint = frpRelatorioProdutosVendedoresBeforePrint
    Left = 690
    Top = 430
    ReportForm = {
      190000003032000019FFFF00000A0050444643726561746F7200FFFFFFFFFF00
      000000340800009A0B0000000000002400000000000000120000000100040000
      0000FFFF000000000000000000000000030400466F726D00FEFFFFFFDC000000
      780000007C0100002C0100000405000500626567696E0D00000D1000544F5441
      4C474552414C203A3D20303B0D00000D0300656E64000200F700000009006662
      76526F6461706500020100000000CC0200002F0400000F000000300003000100
      0000000000000000FFFFFF1F00000000000000000000000000FFFF0000000000
      02000000010000000000000001000000C8000000140000000100000000000002
      00620100000B00506167654865616465723100020100000000480000002F0400
      00510000003000020001000000000000000000FFFFFF1F000000000000000000
      00000000FFFF000000000002000000010000000000000001000000C800000014
      000000010000000000000200E6010000060056656E64617300020100000000CB
      0000002F0400000F0000003500050001000000000000000000FFFFFF1F000000
      001E0066647352656C61746F72696F50726F6475746F7356656E6465646F7265
      73000000000000000100000000000002000000010000000000000001000000C8
      000000140000000100000000000002005A020000140053756DE172696F446F20
      52656C6174F372696F31000201000000006C0100002F04000016000000300001
      0001000000000000000000FFFFFF1F00000000000000000000000000FFFF0000
      00000002000000010000000000000001000000C8000000140000000100000000
      00000200FA020000120043616265E7616C686F446520477275706F3100020100
      000000AE0000002F040000000000003000100001000000000000000000FFFFFF
      1F000000002E005B71727952656C61746F72696F50726F6475746F7356656E64
      65646F7265732E2276656E6465646F72225D20202000000000000000FFFF0000
      00000002000000010000000000000001000000C8000000140000000100000000
      00000200690300000F00526F646170E9446520477275706F3100020100000000
      F00000002F040000160000003000110001000000000000000000FFFFFF1F0000
      0000000000000000000000FFFF00000000000200000001000000000000000100
      0000C8000000140000000100000000000001008E1B000007006670764C6F676F
      0002001B00000048000000730000002700000005000000F40100000000000000
      00FFFFFF1F2C020000000000000000000000FFFF000000000002000000010000
      000601008E1B0000424DCE170000000000003604000028000000830000002600
      0000010008000000000098130000120B0000120B000000010000000100000000
      0000E8E5A800AA9E000099990000ADADAD003A3C4100A3970000BFB73700D8D4
      8600FBFAF000A5A5A5001E1D1C00D8D9DA0054575A00D6D6D500E7E8F2001216
      1B00B6AD1900CBC55B008C8D9200BEC0C500E1E2E40085878A005E606300494C
      4F00090D12002C2E3300DEDB98007D7F8100EFEDCB00B9BABB00AEA400007C7B
      7B00C5BE440066666600D1CC6F00CDC9810048484600F7F6E600AFA508000408
      0D00F9F8ED00B8AF2700DBD68C00999999001B1A1900C6BF5100131312003B3A
      3A00FFFFFF00EAE8BE00CCCCCC0023262A00E2DEA400F1EFD600B0B1B300D3CD
      7500B1A81000CCCC660072727200535252004342420001060A00ECE9C3008C8C
      8B00F5F4DF004A4A4A0057575600B6AC1F00282B3000C7C05C0061615F00F7F7
      F70088888700DDD89300E3E0A600FDFCF70021242900070A1000BDB53100C5BE
      4A00E3E3E200A69C000099999900BABAB900DEDEDE00525458002A292800D9D5
      8A005F5E5D00C7C595001B1E2300E8E5B60000000700B5AB1300D5D07B00C6C6
      C500B2A80B0021202000B9B12400504F4E00666666006B6D7000B5B5BD008484
      8400E0DC9E00BCB42C00F7EFD6005B5B5A00EFEFEF0087898B00DEDEE6003E3D
      3C0014181E00C8C25300CCC55F00A8A9AC00BDBDBC00E5E1AC0075767900181B
      2000E6E6E6000E1117000810190033333300929191002D2C2B00B5B5B4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131543D42470E313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31523131313131486D3131316D6D4C3131316D6D313131313131313131316D48
      31313131313131316D6D3131316D040A6C6C313131313131486D6D4C31313131
      31316D6D4C313131313131313131313131486D6D6D313131313131486D6D4831
      3131316D483131316D6D3131313131313131313131316D6D6D3131486D6D6D31
      313131313152313131317F7E6631554225256031603D42647931420C313B7D31
      6D6C3D70403131662C316D593D7068313133646C702531484255312C70643059
      313131310C2525420E31477431420E4825793131315442433D474C4C640E3120
      423C300A3131207E2C317F70254748484251512531603C316D59253C620A312C
      25433068313131313152313131316C2031315959313131317C7D4C4C31487C0E
      3159683177424C51347531434031203D487957543130494C7F3D31487C0C310B
      37317F70313131313C6631313131642C317C33487E51313131313179602F5531
      7C3331316D793B7031487E14314857043131316D7C55557E311E3031542D4C31
      4340313148790A0B4C313131315231313131477D313125306C64334C57793131
      31487C0E31224931422C31314340316C7D313C7D3131594931570C31543D3148
      7C0C3168705930253131313170706C3C0E313C0A313033317C513131310C7025
      70474C4C3033312C7C64300A3148300E31796243432248483051517C31603D31
      6D6464590B2C31547C42301C313131313152313131314749313166420C554831
      3D2C484831487C0E48302C311C4248516275316C7D31493D4879627F31256848
      373031487C0E3131550E207031313131473C0C554831642C4C7E330C62793131
      316830796D3131487C3331577D6D6D313148303331487C49555131487C0C0C7E
      4C2C703131480C0E7C2C313C476D6D31313131313152313131040B7E20316D47
      3C6C33310E3D3C6C7931254264646D31486C42706831316C7D31484742702031
      310E3D433D6C31484355314043473D0A31313131796C3C6C0E316670597E3C3D
      20313131310E256C6C7731316C0E312C3D47430431772F3D0A31334243664848
      25643C7E6C7C74316D225943425531543D59437D3131313131523131316D643B
      6D3131316D514831313179514C316D51793131313131796D3131313C40313131
      796D313131313179794831317F6D316D15154831313131313131795148314879
      516D796D3131313131313151517931317F6D31316D51516D3151577F6D313131
      797931316D51516D5148313131515151313131314851516D3131313131523131
      3131400431313131313131313131313131313131313131313131313131313168
      04313131313131313131313131313148660F3131313131313131313131313131
      3131313131313131313131313131313131313131220E31313131313131316655
      3131313131313131313131313131313131313131313131313131313131313131
      3152313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131313131313131315C46121212463F3131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131523131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131315F06020202061B31
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131523131313131310E40173C18183D6E3131313131310C2C
      666C3C181818181805683131313131316D3768220D0516313131313108021F1F
      1F5235313131313172070707070707070707070707070750732B363131313131
      3131313131362B73212112081D31313131313131313123505050504B31313131
      31313131313F08122E505050085231313131312C103E191919195D1731313131
      7966713E4E191919191919195D0D31313131312C342828191900173131313131
      08021F1F1F523531313131311152020202020202020202020202020202022776
      313131313131313F501F02020202020202075C313131313131316A060202065F
      313131313131314C120202020202020221523131313175287A78787878784E22
      3131310E1A3E10787871717171717171281731313131773E7A71717171282231
      3131313108021F1F1F5235313131313144021F1F1F1F1F1F1F1F1F1F1F1F1F1F
      1F1F1F1F1D31313131310802021F1F1F1F1F1F1F1F0202233131313131310702
      1F1F0208313131313131313A521F1F1F1F1F1F1F5052313131310D4E7878787A
      7A71282231316D7C4E7878784E4E7A717171717128173131312C3E7171717119
      195D22313131313108021F1F1F5269314C4C4C4C631F1F1F1F1F1F1F1F1F1F1F
      1F1F1F1F1F1F1F52503131313138521F1F1F0202020202021F1F1F5212313131
      313107021F1F0208313131313131361F1F1F1F1F0202020221523131316D457A
      78787A3D370E0E5131313B3E7878787A2274140E0E0E0E0E0E15313115787A78
      7871190D0A145A2A6A6A6A2A5F36363636365044111111113226262626262626
      262626262626264A1F1F1F1F612631311B521F1F1F02443A08082363021F1F1F
      525F3131313107021F1F02083131313131311B021F1F1F1F6A2B353532523131
      310E71717171710C313131313115781078784E68313131313131313131313131
      1C287878787A2C3131310106020202025F313131313150520202020236313131
      31313131313131313131313144021F1F1F32312639021F1F1F584C3131313131
      1B27021F1F1F3631313107021F1F020831313131313123021F1F1F1109313131
      3152313131337A717171454831313131312C28787810344C3131313131313131
      31313131057A78784E663131313135021F1F1F025F313131313150021F1F1F1F
      3631313131313131313131313131314C5E021F1F0276315F521F1F1F4B313131
      313131313132271F1F527331313107021F1F020831313131313112021F1F0272
      313131313152313131601978787A7C4C3131313131662878781045166E6E6E6E
      6E6E6E6E1C0431555B1078717A603131313135021F1F1F025F31313131315002
      1F1F1F1F36313131313131314C0909090909363A021F1F1F1F3F314F021F0272
      3131313131313131313123021F1F1109313107021F1F02083131313131312E02
      1F1F0273313131313152313131601978787A054C313131313156197878787128
      2828282828282828005631337A717171346D313131313552020202025F313131
      31312106020202023631313131762E635E61616161611F1F1F1F1F1F114C2661
      1F1F0276313131313131313131311D1F1F1F1F1D313107021F1F020831313131
      31312E021F1F023A313131313152313131601978787A054C3131313131181978
      7878787878787878787878784E1731141978787A454831313131764444444444
      241551515151464F4F4F4F4F413131313A0202021F1F1F1F1F1F1F1F1F1F1F52
      1B311D1F1F1F1F363131313131313131313126391F1F1F5C313107021F1F0208
      3131313131312E021F1F023A313131313152313131601978787A054C31313131
      315619787878787878787878787878784E1731337A717171346D313131313109
      090909097D713434347A37313131313131313158521F1F1F1F1F020202020202
      0202275831311D1F1F1F1F1D3131313131313131313126391F1F1F5C31310702
      1F1F02083131313131312E021F1F023A313131313152313131601978787A054C
      3131313131224E787878784E28282828282828280056310C787171715B0C3131
      3131313131313131133E1010105D74313131313131312939021F1F1F1F391163
      6363636A50083631313126611F1F024B313131313131313131313F021F1F1F36
      313107021F1F02083131313131312E021F1F023A313131313152313131601978
      787A054C313131313116287878101A2C2C2C2C2C2C2C2C2C7D1E316D1A7A7878
      197F31313131313131313131134E78787828743131313131313176021F1F1F1F
      23263131313131313131313131313107021F0221313131313131313131317302
      1F1F444C313107021F1F02083131313131312E021F1F023A3131313131523131
      31601978787A054C31313131317F197171713448313131313131313131313131
      561978784E6631313131313131313131134E7878782874313131313131312B52
      1F1F1F6129313131313131313131313131313158521F1F024A31313131313131
      317602021F522331313107021F1F02083131313131312E021F1F023A31313131
      3152313131331978787A053131313131316D347A78784E133131313131313131
      313131317D287878717104313131313131313131130019191900043131313131
      31312B521F1F1F274131313131313131313131313131310911021F1F1F232631
      313131295F1F1F1F1F612931313107021F1F022B3131313131312E021F1F5223
      3131313131520E14602C7A78787A7C141414140C3131203E78787171660A1E60
      14141414140E3131155B107878107A567D371E1E1E1E1E1E13566C6C6C182C75
      757575756D315C021F1F1F1F211B1B1B1B1B1B4A4A4A4A4A3631313176021F1F
      1F0261502323725E021F1F1F0258762B2B4A44021F1F1F504A4A4A2B1D312E02
      1F1F1F074A4A4A4A5C520D7A7A7A78787878787A7A7A5D173131794519787878
      4E4E7A7A7A7A7A7A5D6C313131165D7171717119191919191919195D6E313131
      313166007A7A7A4E1431295E021F1F1F0202020202020202020202062B313131
      315802021F1F1F020202021F1F1F1F52384C395252521F1F1F1F1F0202020206
      08312E021F1F1F1F0202020221521771717878787878787171714E2231313133
      5B28717878787871717171714E1731313131173E7A717878787878787878784E
      6E313131313166287171717A6031314A521F1F1F1F1F1F1F1F1F1F1F1F1F1F52
      4A31313131316939521F1F1F1F1F1F1F1F020258310911021F1F1F1F1F1F1F1F
      1F1F1F022B312E021F1F1F1F1F1F1F1F50520D19191978787878781919190017
      313131310C0D10284E4E191919191919000D31313131317D1A4E4E4E19191919
      191919001C3131313131662878787810603131315F0202020202020202020202
      020202062B31313131313136733902020202020261721D313129615252521F1F
      1F1F1F020202020608312E021F1F1F1F0202020221527D17173C107878714D17
      17170D2C3131313131310E0A1C3B2217171717170D7D31313131313148757D77
      661717171717170D0431313131316628787878106031313131364A3A72727272
      72727272727272505C3131313131313131264B5F737338354131313131093A72
      72725E1F1F1F1F4F1212122E5C312E021F1F1F631212121258523131310E1978
      787A053131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131313131313117003E3E3E5D7531313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313107021F1F52583131313131312E021F1F02233131313131523131
      31601978787A054C313131313131313131313131313131313131313131313131
      313131313131313131313131313131313131313131317F686E6E6E6E15313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313121021F1F02073131313131312E021F1F023A31313131
      3152313131601978787A054C3131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313173021F1F1F1F4F3A233A32312E021F1F023A
      313131313152313131601978787A054C31313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131313131313169521F1F1F1F0202020608312E02
      1F1F023A313131313152313131601978787A054C313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131313131313131310963521F1F1F1F1F1F02
      4A312E021F1F023A313131313152313131601971717A054C3131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131314150611F1F
      1F1F1F024A3150021F1F023A3131313131523131310C0D17176C774C31313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      315C3872727272725C31082E2E2E2E1B31313131315200001D1C00000900666D
      76546974756C6F0002006C01000048000000300200001200000043000000F401
      0000000000000000FFFFFF1F2C020000000000010009005B546974756C6F5D20
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      0B000000020000000000020000000000020000000000FFFFFF00000000020000
      00000000000000B41C00000700666D7644617461000200A40300004C0000005A
      0000000D00000043000000F4010000000000000000FFFFFF1F2C020000000000
      010013005B4441544520234464642F6D6D2F797979795D00000000FFFF000000
      0000020000000100000000090068656C76657469636100080000000000000000
      00010000000100020000000000FFFFFF0000000002000000000000000000411D
      00000900666D76506167696E61000200B40300005C0000004A0000000F000000
      43000000F4010000000000000000FFFFFF1F2C020000000000010007005B5041
      4745235D00000000FFFF0000000000020000000100000000090068656C766574
      6963610008000000000000000000010000000100020000000000FFFFFF000000
      0002000000000000000000D61D00000700666D76486F726100020021000000CC
      020000580000000A00000043000000F4010000000000000000FFFFFF1F2C0200
      00000000010011005B54494D4520235468683A6D6D3A73735D00000000FFFF00
      00000000020000000100000000090068656C7665746963610007000000000000
      000000100000000100020000000000FFFFFF0000000002000000000000000000
      831E00001000666D76446573656E766F6C7665646F7200020037030000CD0200
      00CC0000000A00000043000000F4010000000000000000FFFFFF1F2C02000000
      000001002000746563534F4654202D205465636E6F6C6F67696120656D205369
      7374656D617300000000FFFF0000000000020000000100000000090068656C76
      65746963610007000000000000000000110000000100020000000000FFFFFF00
      000000020000000000000000000E1F00000900666D764F75747261730002006C
      01000060000000310200001600000043000000F4010000000000000000FFFFFF
      1F2C020000000000010009005B4F75747261735D2000000000FFFF0000000000
      0200000001000000000500417269616C00070000000000000000000200000000
      00020000000000FFFFFF0000000002000000000000000000A31F000005004D65
      6D6F3900020064030000700100005C0000000D00000000000000010000000000
      00000000FFFFFF1F2C000000080064642F6D6D2F79790001000B00544F54414C
      20474552414C00000000FFFF0000000000020000000100000000090068656C76
      65746963610008000000020000000000010000000100020000000000FFFFFF00
      000000020000000000000000001221000006004D656D6F3130000200E8000000
      CB000000A70000000D00000060000000F4010000000000000000FFFFFF1F2C02
      00000000000100EC005B4946285B6E636D6973656E746F706973636F66696E73
      5D3D46616C73652C5B71727952656C61746F72696F50726F6475746F7356656E
      6465646F7265732E22636F6E747261746F225D2C5B71727952656C61746F7269
      6F50726F6475746F7356656E6465646F7265732E226E636D225D295D205B7172
      7952656C61746F72696F50726F6475746F7356656E6465646F7265732E227369
      74756163616F225D205B464F524D41544441544554494D45282764642F6D6D2F
      7979272C205B71727952656C61746F72696F50726F6475746F7356656E646564
      6F7265732E226661747572616D656E746F225D295D00000000FFFF0000000000
      020000000100000006090068656C766574696361000800000000000000000001
      0000000100020000000000FFFFFF000000000200000000000000000025220000
      06004D656D6F313300020090010000CB0000002D0000000D0000002000000001
      000000000000000000FFFFFF1F2C020000000000010090005B71727952656C61
      746F72696F50726F6475746F7356656E6465646F7265732E227365726965225D
      20205B4946285B71727952656C61746F72696F50726F6475746F7356656E6465
      646F7265732E224E554D45524F4E4F5441225D3D302C27272C5B71727952656C
      61746F72696F50726F6475746F7356656E6465646F7265732E224E554D45524F
      4E4F5441225D295D00000000FFFF000000000002000000010000000609006865
      6C7665746963610008000000000000000000010000000100020000000000FFFF
      FF00000000020000000000000000000023000006004D656D6F3136000200CA03
      0000CB000000340000000D0000000000000001000000000000000000FFFFFF1F
      2C000000080064642F6D6D2F797900010050005B466F726D6174466C6F617428
      5B4D6173636172615175616E7469646164655D2C5B71727952656C61746F7269
      6F50726F6475746F7356656E6465646F7265732E227175616E74696461646522
      5D295D00000000FFFF0000000000020000000100000006090068656C76657469
      63610008000000000000000000010000000100020000000000FFFFFF00000000
      02000000000000000000BB23000006004D656D6F3137000200F0010000CB0000
      00650000000D0000000000000001000000000000000000FFFFFF1F2C00000008
      0064642F6D6D2F797900010030005B71727952656C61746F72696F50726F6475
      746F7356656E6465646F7265732E2270726F6475746F76697375616C225D0000
      0000FFFF0000000000020000000100000006090068656C766574696361000800
      0000000000000000010000000100020000000000FFFFFF000000000200000000
      00000000007424000006004D656D6F313800020058020000CB00000014000000
      0D0000000000000001000000000000000000FFFFFF1F2C000000080064642F6D
      6D2F79790001002E005B71727952656C61746F72696F50726F6475746F735665
      6E6465646F7265732E2266696C69616C76656E6461225D00000000FFFF000000
      0000020000000100000006090068656C76657469636100080000000000000000
      00020000000100020000000000FFFFFF00000000020000000000000000002B25
      000006004D656D6F313900020070020000CB000000580100000D0000000B0000
      0001000000000000000000FFFFFF1F2C000000080064642F6D6D2F7979000100
      2C005B71727952656C61746F72696F50726F6475746F7356656E6465646F7265
      732E2264657363726963616F225D00000000FFFF000000000002000000010000
      0006090068656C76657469636100080000000000000000000000000001000200
      00000000FFFFFF0000000002000000000000000000D925000006004D656D6F32
      310002001B000000CB000000230000000D00000060000000F401000000000000
      0000FFFFFF1F2C02000000000001002B005B71727952656C61746F72696F5072
      6F6475746F7356656E6465646F7265732E2276656E6465646F72225D00000000
      FFFF0000000000020000000100000006090068656C7665746963610008000000
      000000000000010000000100020000000000FFFFFF0000000002000000000000
      0000008726000006004D656D6F32320002003E000000CB000000B30000000D00
      000060000000F4010000000000000000FFFFFF1F2C02000000000001002F005B
      71727952656C61746F72696F50726F6475746F7356656E6465646F7265732E22
      6E6F6D6576656E6465646F72225D00000000FFFF000000000002000000010000
      00060500417269616C0008000000020000000000000000000000020000000000
      FFFFFF00000000020000000000000000002027000006004D656D6F3234000200
      64030000F40000005C0000000D0000000000000001000000000000000000FFFF
      FF1F2C000000080064642F6D6D2F79790001000E00544F54414C2056454E4445
      444F5200000000FFFF0000000000020000000100000000090068656C76657469
      63610008000000020000000000010000000100020000000000FFFFFF00000000
      02000000000000000000FA27000006004D656D6F3235000200C6030000F40000
      00380000000D0000000300000001000000000000000000FFFFFF1F2C00000000
      0000010057005B466F726D6174466C6F6174285B4D6173636172615175616E74
      69646164655D2C5B53554D285B71727952656C61746F72696F50726F6475746F
      7356656E6465646F7265732E227175616E746964616465225D295D295D000000
      00FFFF0000000000020000000100000000090068656C76657469636100080000
      00020000000000010000001700020000000000FFFFFF00000000020000000000
      00000000D428000006004D656D6F3236000200CA03000070010000340000000D
      0000004300000001000000000000000000FFFFFF1F2C02000000000001005700
      5B466F726D6174466C6F6174285B4D6173636172615175616E7469646164655D
      2C5B53554D285B71727952656C61746F72696F50726F6475746F7356656E6465
      646F7265732E227175616E746964616465225D295D295D00000000FFFF000000
      0000020000000100000000090068656C76657469636100080000000200000000
      00010000001700020000000000FFFFFF00000000020000000000000000008F29
      000007004D656D6F3135360002009000000048000000D70000002E0000004B00
      0000F4010000000000000000FFFFFF1F2C020000000000030011005B52415A41
      4F46494C49414C424153455D0D0F005B4345505F4349444144455F55465D0D11
      005B454E44455245434F5F42414952524F5D00000000FFFF0000000000020000
      000100000000090068656C766574696361000700000000000000000000000000
      0100020000000000FFFFFF00000000020000000000000000001B2A000005004D
      656D6F380002009C0100007A000000520000001A00000043000B00F401000000
      0000000000FFFFFF1F2C02000000000001000A004E4F54412F4355504F4D0000
      0000FFFF0000000000020000000100000000090068656C766574696361000700
      00000000000000000A0000000100020000000000FFFFFF000000000200000000
      0000000000A62A000005004D656D6F350002006C0200007A0000005F0100001A
      00000043000A00F4010000000000000000FFFFFF1F2C02000000000001000900
      444553435249C7C34F00000000FFFF0000000000020000000100000000090068
      656C76657469636100070000000000000000000A0000000100020000000000FF
      FFFF00000000020000000000000000005B2B000006004D656D6F3436000200F4
      0000007A000000580000001A00000043000A00F4010000000000000000FFFFFF
      1F2C020000000000010032005B4946285B6E636D6973656E746F706973636F66
      696E735D3D46616C73652C2027434F4E545241544F272C274E434D27295D0000
      0000FFFF0000000000020000000100000000090068656C766574696361000700
      00000000000000000A0000000100020000000000FFFFFF000000000200000000
      0000000000F02B000006004D656D6F3537000200EE0100007A00000065000000
      1A00000043000E00F4010000000000000000FFFFFF1F2C020000000000020008
      0050524F4455544F2F0D07005345525649C74F00000000FFFF00000000000200
      00000100000000090068656C76657469636100070000000000000000000A0000
      000100020000000000FFFFFF0000000002000000000000000000762C00000500
      4D656D6F320002004C0100007A000000140000001A00000043000E00F4010000
      000000000000FFFFFF1F2C020000000000010004005349542E00000000FFFF00
      00000000020000000100000000090068656C7665746963610007000000000000
      0000000A0000000100020000000000FFFFFF0000000002000000000000000000
      FB2C000005004D656D6F34000200530200007A000000190000001A0000004300
      0F00F4010000000000000000FFFFFF1F2C0200000000000100030046494C0000
      0000FFFF0000000000020000000100000000090068656C766574696361000700
      00000000000000000A0000000100020000000000FFFFFF000000000200000000
      0000000000822D000006004D656D6F3131000200CB0300007A00000033000000
      1A00000043000F00F4010000000000000000FFFFFF1F2C020000000000010004
      005154444500000000FFFF0000000000020000000100000000090068656C7665
      7469636100070000000000000000000A0000000100020000000000FFFFFF0000
      0000020000000000000000000D2E000006004D656D6F32380002003E0000007A
      000000B80000001A00000043000F00F4010000000000000000FFFFFF1F2C0200
      000000000100080056454E4445444F5200000000FFFF00000000000200000001
      00000000090068656C76657469636100070000000000000000000A0000000100
      020000000000FFFFFF0000000002000000000000000000982E000006004D656D
      6F3239000200610100007A0000003A0000001A00000043000F00F40100000000
      00000000FFFFFF1F2C02000000000001000800464154555241444F00000000FF
      FF0000000000020000000100000000090068656C766574696361000700000000
      00000000000A0000000100020000000000FFFFFF000000000200000000000000
      00001F2F000006004D656D6F33300002001B0000007A000000230000001A0000
      0043000F00F4010000000000000000FFFFFF1F2C0200000000000100040043D3
      442E00000000FFFF0000000000020000000100000000090068656C7665746963
      6100070000000000000000000A0000000100020000000000FFFFFF0000000002
      000000000000000000D630000005004D656D6F33000200C0010000CB0000002D
      0000000D0000002000000001000000000000000000FFFFFF1F2C020000000000
      010035015B4946285B71727952656C61746F72696F50726F6475746F7356656E
      6465646F7265732E226D617175696E61225D3D302C27272C5B71727952656C61
      746F72696F50726F6475746F7356656E6465646F7265732E226D617175696E61
      225D295D2020205B4946285B71727952656C61746F72696F50726F6475746F73
      56656E6465646F7265732E22494E54455256454E53414F225D3D302C27272C5B
      71727952656C61746F72696F50726F6475746F7356656E6465646F7265732E22
      494E54455256454E53414F225D295D20205B4946285B71727952656C61746F72
      696F50726F6475746F7356656E6465646F7265732E224E554D45524F4355504F
      4D225D3D302C27272C5B71727952656C61746F72696F50726F6475746F735665
      6E6465646F7265732E224E554D45524F4355504F4D225D295D00000000FFFF00
      00000000020000000100000006090068656C7665746963610008000000000000
      000000010000000100020000000000FFFFFF000000000200000000000000FEFE
      FF0E0000000A00204361626563616C686F000000000F0052415A414F46494C49
      414C42415345000000000F00454E44455245434F5F42414952524F000000000D
      004345505F4349444144455F5546000000000600544954554C4F000100300006
      004F5554524153000100300011004D4153434152415155414E54494441444500
      080027232323232323270012006E636D6973656E746F706973636F66696E7300
      050046616C7365000C00204167727570616D656E746F00000000120041677275
      706172477275706F46696C69616C00050046616C7365000D0041677275706172
      46696C69616C00050046616C7365001000416772757061724461746156656E64
      6100050046616C7365000C0020544F54414C495A4143414F000000000A00544F
      54414C474552414C00010030000000000000000000FC00000000000000000000
      000000000000580042C995683481E3400E6AD3100C22E640}
  end
  object frpRelatorioProdutosClientes_Modelo_Gama: TfrReport
    Dataset = fdsRelatorioProdutosClientes_
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnBeforePrint = frpRelatorioProdutosClientes_BeforePrint
    Left = 207
    Top = 480
    ReportForm = {
      19000000DA4A000019FFFF00000A0050444643726561746F7200FFFFFFFFFF00
      000000340800009A0B0000040000002400000004000000120000000100040000
      0000FFFF000000000000000000000000030400466F726D00FEFFFFFFDC000000
      780000007C0100002C0100000406000500626567696E0D17002020544F54414C
      50524F4455544F532020203A3D20303B0D1B002020544F54414C474552414C20
      2020202020202020203A3D20303B0D17002020544F54414C50524F434C49454E
      5445203A3D20303B0D0D002020434F554E54203A3D20303B0D0300656E6400FF
      FFFFFFFF00000000340800009A0B000000000000000000000000000000000000
      01000400000000FFFF000000000000000000000000030400466F726D00FEFFFF
      FFDC000000780000007C0100002C010000040000000200960100000900666276
      526F6461706500020100000000CC0200002F0400000F00000030000300010000
      00000000000000FFFFFF1F00000000000000000000000000FFFF000000000002
      000000010000000000000001000000C800000014000000010000000000000200
      010200000B00506167654865616465723100020100000000480000002F040000
      4A0000003000020001000000000000000000FFFFFF1F00000000000000000000
      000000FFFF000000000002000000010000000000000001000000C80000001400
      0000010000000000000200A7020000060056656E64617300020100000000C300
      00002F0400005D0000003400050001000000000000000000FFFFFF1F00000000
      1200666473456E64657265636F436C69656E7465000000000300050062656769
      6E0D1800202020544F54414C50524F434C49454E5445203A3D20303B0D030065
      6E640001000000000000020000000100000000060046696C6861310001000000
      C8000000140000000100000000000002000D030000060046696C686131000201
      00000000300100002F0400000A0000003000150001000000000000000000FFFF
      FF1F00000000000000000000000000FFFF000000000002000000010000000000
      000001000000C80000001400000001000000000000020081030000140053756D
      E172696F446F2052656C6174F372696F31000201000000006C0100002F040000
      2A0000003000010001000000000000000000FFFFFF1F00000000000000000000
      000000FFFF000000000002000000010000000000000001000000C80000001400
      0000010000000000000100A61B000007006670764C6F676F0002000600000048
      000000730000002700000005000000F4010000000000000000FFFFFF1F2C0200
      00000000000000000000FFFF00000000000200000001000000060100A61B0000
      424DCE1700000000000036040000280000008300000026000000010008000000
      000098130000120B0000120B0000000100000001000000000000E8E5A800AA9E
      000099990000ADADAD003A3C4100A3970000BFB73700D8D48600FBFAF000A5A5
      A5001E1D1C00D8D9DA0054575A00D6D6D500E7E8F20012161B00B6AD1900CBC5
      5B008C8D9200BEC0C500E1E2E40085878A005E606300494C4F00090D12002C2E
      3300DEDB98007D7F8100EFEDCB00B9BABB00AEA400007C7B7B00C5BE44006666
      6600D1CC6F00CDC9810048484600F7F6E600AFA5080004080D00F9F8ED00B8AF
      2700DBD68C00999999001B1A1900C6BF5100131312003B3A3A00FFFFFF00EAE8
      BE00CCCCCC0023262A00E2DEA400F1EFD600B0B1B300D3CD7500B1A81000CCCC
      660072727200535252004342420001060A00ECE9C3008C8C8B00F5F4DF004A4A
      4A0057575600B6AC1F00282B3000C7C05C0061615F00F7F7F70088888700DDD8
      9300E3E0A600FDFCF70021242900070A1000BDB53100C5BE4A00E3E3E200A69C
      000099999900BABAB900DEDEDE00525458002A292800D9D58A005F5E5D00C7C5
      95001B1E2300E8E5B60000000700B5AB1300D5D07B00C6C6C500B2A80B002120
      2000B9B12400504F4E00666666006B6D7000B5B5BD0084848400E0DC9E00BCB4
      2C00F7EFD6005B5B5A00EFEFEF0087898B00DEDEE6003E3D3C0014181E00C8C2
      5300CCC55F00A8A9AC00BDBDBC00E5E1AC0075767900181B2000E6E6E6000E11
      17000810190033333300929191002D2C2B00B5B5B40000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31543D42470E3131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313152313131313148
      6D3131316D6D4C3131316D6D313131313131313131316D483131313131313131
      6D6D3131316D040A6C6C313131313131486D6D4C3131313131316D6D4C313131
      313131313131313131486D6D6D313131313131486D6D48313131316D48313131
      6D6D3131313131313131313131316D6D6D3131486D6D6D313131313131523131
      31317F7E6631554225256031603D42647931420C313B7D316D6C3D7040313166
      2C316D593D7068313133646C702531484255312C70643059313131310C252542
      0E31477431420E4825793131315442433D474C4C640E3120423C300A3131207E
      2C317F70254748484251512531603C316D59253C620A312C2543306831313131
      3152313131316C2031315959313131317C7D4C4C31487C0E3159683177424C51
      347531434031203D487957543130494C7F3D31487C0C310B37317F7031313131
      3C6631313131642C317C33487E51313131313179602F55317C3331316D793B70
      31487E14314857043131316D7C55557E311E3031542D4C314340313148790A0B
      4C313131315231313131477D313125306C64334C5779313131487C0E31224931
      422C31314340316C7D313C7D3131594931570C31543D31487C0C316870593025
      3131313170706C3C0E313C0A313033317C513131310C702570474C4C3033312C
      7C64300A3148300E31796243432248483051517C31603D316D6464590B2C3154
      7C42301C313131313152313131314749313166420C5548313D2C484831487C0E
      48302C311C4248516275316C7D31493D4879627F31256848373031487C0E3131
      550E207031313131473C0C554831642C4C7E330C62793131316830796D313148
      7C3331577D6D6D313148303331487C49555131487C0C0C7E4C2C703131480C0E
      7C2C313C476D6D31313131313152313131040B7E20316D473C6C33310E3D3C6C
      7931254264646D31486C42706831316C7D31484742702031310E3D433D6C3148
      4355314043473D0A31313131796C3C6C0E316670597E3C3D20313131310E256C
      6C7731316C0E312C3D47430431772F3D0A3133424366484825643C7E6C7C7431
      6D225943425531543D59437D3131313131523131316D643B6D3131316D514831
      313179514C316D51793131313131796D3131313C40313131796D313131313179
      794831317F6D316D15154831313131313131795148314879516D796D31313131
      31313151517931317F6D31316D51516D3151577F6D313131797931316D51516D
      5148313131515151313131314851516D31313131315231313131400431313131
      3131313131313131313131313131313131313131313131680431313131313131
      3131313131313148660F31313131313131313131313131313131313131313131
      313131313131313131313131220E313131313131313166553131313131313131
      3131313131313131313131313131313131313131313131313152313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131315C46121212463F31313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131523131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131315F06020202061B313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31523131313131310E40173C18183D6E3131313131310C2C666C3C1818181818
      05683131313131316D3768220D0516313131313108021F1F1F52353131313131
      72070707070707070707070707070750732B3631313131313131313131362B73
      212112081D31313131313131313123505050504B3131313131313131313F0812
      2E505050085231313131312C103E191919195D17313131317966713E4E191919
      191919195D0D31313131312C34282819190017313131313108021F1F1F523531
      313131311152020202020202020202020202020202022776313131313131313F
      501F02020202020202075C313131313131316A060202065F313131313131314C
      120202020202020221523131313175287A78787878784E223131310E1A3E1078
      7871717171717171281731313131773E7A717171712822313131313108021F1F
      1F5235313131313144021F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1D313131
      31310802021F1F1F1F1F1F1F1F02022331313131313107021F1F020831313131
      3131313A521F1F1F1F1F1F1F5052313131310D4E7878787A7A71282231316D7C
      4E7878784E4E7A717171717128173131312C3E7171717119195D223131313131
      08021F1F1F5269314C4C4C4C631F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F52
      503131313138521F1F1F0202020202021F1F1F5212313131313107021F1F0208
      313131313131361F1F1F1F1F0202020221523131316D457A78787A3D370E0E51
      31313B3E7878787A2274140E0E0E0E0E0E15313115787A787871190D0A145A2A
      6A6A6A2A5F36363636365044111111113226262626262626262626262626264A
      1F1F1F1F612631311B521F1F1F02443A08082363021F1F1F525F313131310702
      1F1F02083131313131311B021F1F1F1F6A2B353532523131310E71717171710C
      313131313115781078784E683131313131313131313131311C287878787A2C31
      31310106020202025F3131313131505202020202363131313131313131313131
      3131313144021F1F1F32312639021F1F1F584C31313131311B27021F1F1F3631
      313107021F1F020831313131313123021F1F1F11093131313152313131337A71
      7171454831313131312C28787810344C313131313131313131313131057A7878
      4E663131313135021F1F1F025F313131313150021F1F1F1F3631313131313131
      313131313131314C5E021F1F0276315F521F1F1F4B313131313131313132271F
      1F527331313107021F1F020831313131313112021F1F02723131313131523131
      31601978787A7C4C3131313131662878781045166E6E6E6E6E6E6E6E1C043155
      5B1078717A603131313135021F1F1F025F313131313150021F1F1F1F36313131
      313131314C0909090909363A021F1F1F1F3F314F021F02723131313131313131
      313123021F1F1109313107021F1F02083131313131312E021F1F027331313131
      3152313131601978787A054C3131313131561978787871282828282828282828
      005631337A717171346D313131313552020202025F3131313131210602020202
      3631313131762E635E61616161611F1F1F1F1F1F114C26611F1F027631313131
      3131313131311D1F1F1F1F1D313107021F1F02083131313131312E021F1F023A
      313131313152313131601978787A054C31313131311819787878787878787878
      787878784E1731141978787A454831313131764444444444241551515151464F
      4F4F4F4F413131313A0202021F1F1F1F1F1F1F1F1F1F1F521B311D1F1F1F1F36
      3131313131313131313126391F1F1F5C313107021F1F02083131313131312E02
      1F1F023A313131313152313131601978787A054C313131313156197878787878
      78787878787878784E1731337A717171346D313131313109090909097D713434
      347A37313131313131313158521F1F1F1F1F0202020202020202275831311D1F
      1F1F1F1D3131313131313131313126391F1F1F5C313107021F1F020831313131
      31312E021F1F023A313131313152313131601978787A054C3131313131224E78
      7878784E28282828282828280056310C787171715B0C31313131313131313131
      133E1010105D74313131313131312939021F1F1F1F3911636363636A50083631
      313126611F1F024B313131313131313131313F021F1F1F36313107021F1F0208
      3131313131312E021F1F023A313131313152313131601978787A054C31313131
      3116287878101A2C2C2C2C2C2C2C2C2C7D1E316D1A7A7878197F313131313131
      31313131134E78787828743131313131313176021F1F1F1F2326313131313131
      3131313131313107021F02213131313131313131313173021F1F444C31310702
      1F1F02083131313131312E021F1F023A313131313152313131601978787A054C
      31313131317F197171713448313131313131313131313131561978784E663131
      3131313131313131134E7878782874313131313131312B521F1F1F6129313131
      313131313131313131313158521F1F024A31313131313131317602021F522331
      313107021F1F02083131313131312E021F1F023A313131313152313131331978
      787A053131313131316D347A78784E133131313131313131313131317D287878
      71710431313131313131313113001919190004313131313131312B521F1F1F27
      4131313131313131313131313131310911021F1F1F232631313131295F1F1F1F
      1F612931313107021F1F022B3131313131312E021F1F52233131313131520E14
      602C7A78787A7C141414140C3131203E78787171660A1E6014141414140E3131
      155B107878107A567D371E1E1E1E1E1E13566C6C6C182C75757575756D315C02
      1F1F1F1F211B1B1B1B1B1B4A4A4A4A4A3631313176021F1F1F0261502323725E
      021F1F1F0258762B2B4A44021F1F1F504A4A4A2B1D312E021F1F1F074A4A4A4A
      5C520D7A7A7A78787878787A7A7A5D1731317945197878784E4E7A7A7A7A7A7A
      5D6C313131165D7171717119191919191919195D6E313131313166007A7A7A4E
      1431295E021F1F1F0202020202020202020202062B313131315802021F1F1F02
      0202021F1F1F1F52384C395252521F1F1F1F1F020202020608312E021F1F1F1F
      0202020221521771717878787878787171714E22313131335B28717878787871
      717171714E1731313131173E7A717878787878787878784E6E31313131316628
      7171717A6031314A521F1F1F1F1F1F1F1F1F1F1F1F1F1F524A31313131316939
      521F1F1F1F1F1F1F1F020258310911021F1F1F1F1F1F1F1F1F1F1F022B312E02
      1F1F1F1F1F1F1F1F50520D19191978787878781919190017313131310C0D1028
      4E4E191919191919000D31313131317D1A4E4E4E19191919191919001C313131
      3131662878787810603131315F0202020202020202020202020202062B313131
      31313136733902020202020261721D313129615252521F1F1F1F1F0202020206
      08312E021F1F1F1F0202020221527D17173C107878714D1717170D2C31313131
      31310E0A1C3B2217171717170D7D31313131313148757D77661717171717170D
      0431313131316628787878106031313131364A3A727272727272727272727250
      5C3131313131313131264B5F737338354131313131093A7272725E1F1F1F1F4F
      1212122E5C312E021F1F1F631212121258523131310E1978787A053131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313117003E3E3E5D75313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131310702
      1F1F52583131313131312E021F1F0223313131313152313131601978787A054C
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131317F686E6E6E6E153131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313121021F1F02073131313131312E021F1F023A313131313152313131601978
      787A054C31313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313173021F1F1F1F4F3A233A32312E021F1F023A3131313131523131
      31601978787A054C313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313169521F1F1F1F0202020608312E021F1F023A31313131
      3152313131601978787A054C3131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131310963521F1F1F1F1F1F024A312E021F1F023A
      313131313152313131601971717A054C31313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131313131314150611F1F1F1F1F024A315002
      1F1F023A3131313131523131310C0D17176C774C313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131313131313131313131315C387272727272
      5C31082E2E2E2E1B3131313131520000351C00000900666D76546974756C6F00
      0200540100004C000000400200001200000043000000F4010000000000000000
      FFFFFF1F2C020000000000010009005B546974756C6F5D2000000000FFFF0000
      000000020000000100000000090068656C766574696361000B00000002000000
      0000020000000000020000000000FFFFFF0000000002000000000000000000CC
      1C00000700666D7644617461000200990300004C0000005A0000000D00000043
      000000F4010000000000000000FFFFFF1F2C020000000000010013005B444154
      4520234464642F6D6D2F797979795D00000000FFFF0000000000020000000100
      000000090068656C766574696361000800000000000000000001000000010002
      0000000000FFFFFF0000000002000000000000000000591D00000900666D7650
      6167696E61000200A90300005C0000004A0000000F00000043000000F4010000
      000000000000FFFFFF1F2C020000000000010007005B50414745235D00000000
      FFFF0000000000020000000100000000090068656C7665746963610008000000
      000000000000010000000100020000000000FFFFFF0000000002000000000000
      000000EE1D00000700666D76486F726100020024000000CC020000580000000A
      00000043000000F4010000000000000000FFFFFF1F2C02000000000001001100
      5B54494D4520235468683A6D6D3A73735D00000000FFFF000000000002000000
      0100000000090068656C76657469636100070000000000000000001000000001
      00020000000000FFFFFF00000000020000000000000000009B1E00001000666D
      76446573656E766F6C7665646F7200020037030000CD020000CC0000000A0000
      0043000000F4010000000000000000FFFFFF1F2C020000000000010020007465
      63534F4654202D205465636E6F6C6F67696120656D2053697374656D61730000
      0000FFFF0000000000020000000100000000090068656C766574696361000700
      0000000000000000110000000100020000000000FFFFFF000000000200000000
      0000000000261F00000900666D764F7574726173000200540100006000000041
      0200001600000043000000F4010000000000000000FFFFFF1F2C020000000000
      010009005B4F75747261735D2000000000FFFF00000000000200000001000000
      000500417269616C0007000000000000000000020000000000020000000000FF
      FFFF0000000002000000000000000000AC1F000005004D656D6F380002008701
      0000780000002E0000001800000043000B00F4010000000000000000FFFFFF1F
      2C020000000000010004004E4F544100000000FFFF0000000000020000000100
      000000090068656C76657469636100070000000000000000000A000000010002
      0000000000FFFFFF00000000020000000000000000003720000005004D656D6F
      350002007F02000078000000A10000001800000043000A00F401000000000000
      0000FFFFFF1F2C02000000000001000900444553435249C7C34F00000000FFFF
      0000000000020000000100000000090068656C76657469636100070000000000
      000000000A0000000100020000000000FFFFFF00000000020000000000000000
      00DC20000006004D656D6F323000020009000000C3000000AB0000000D000000
      60000000F4010000000000000000FFFFFF1F2C020000000000010022005B7172
      79456E64657265636F436C69656E74652E226E6F6D65636C69656E7465225D00
      000000FFFF0000000000020000000100000006090068656C7665746963610008
      000000000000000000000000000100020000000000FFFFFF0000000002000000
      0000000000009121000006004D656D6F34360002000101000078000000470000
      001800000043000A00F4010000000000000000FFFFFF1F2C0200000000000100
      32005B4946285B6E636D6973656E746F706973636F66696E735D3D46616C7365
      2C2027434F4E545241544F272C274E434D27295D00000000FFFF000000000002
      0000000100000000090068656C76657469636100070000000000000000000A00
      00000100020000000000FFFFFF00000000020000000000000000002622000006
      004D656D6F35370002002302000078000000490000001800000043000E00F401
      0000000000000000FFFFFF1F2C0200000000000200080050524F4455544F2F0D
      07005345525649C74F00000000FFFF0000000000020000000100000000090068
      656C76657469636100070000000000000000000A0000000100020000000000FF
      FFFF00000000020000000000000003007E2200000A005375625265706F727431
      000200B4000000C3000000CC0200001200000001000000010000000000000000
      00FFFFFF1F2C020000000000000000000000FFFF000000000002000000010000
      00000100000000009A23000006004D656D6F313000020009000000FA000000D7
      0100002200000043000000F4010000000000000000FFFFFF1F2C020000000000
      03001A005B717279456E64657265636F436C69656E74652E22727561225D0D25
      0042414952524F3A205B717279456E64657265636F436C69656E74652E226261
      6972726F225D0D54005B464F524D415454455854282723232E2323232D232323
      272C205B717279456E64657265636F436C69656E74652E22636570225D295D20
      5B717279456E64657265636F436C69656E74652E22636964616465225D000000
      00FFFF0000000000020000000100000000090068656C76657469636100070000
      00000000000000000000000100020000000000FFFFFF00000000020000000000
      000000004524000006004D656D6F323100020009000000DF000000B30000000D
      00000040000000F4010000000000000000FFFFFF1F2C02000000000001002800
      4350463A205B717279456E64657265636F436C69656E74652E22706573736F61
      6E756D65726F225D00000000FFFF000000000002000000010000000009006865
      6C7665746963610008000000000000000000000000000100020000000000FFFF
      FF00000000020000000000000004009424000005004C696E65310002000C0000
      003A0100001B040000000000000100080064000000000000000000FFFFFF1F2C
      020000000000000000000000FFFF000000000002000000010000000000004925
      000005004D656D6F360002009F03000070010000500000000D00000000000000
      F0030000000000000000FFFFFF1F2C000000080064642F6D6D2F79790001002B
      005B464F524D4154464C4F415428272323232C2323232C2323302E3030272C20
      544F54414C474552414C295D00000000FFFF0000000000020000000100000000
      090068656C766574696361000800000002000000000001000000170002000000
      0000FFFFFF0000000002000000000000000000DE25000005004D656D6F390002
      00F1020000700100005C0000000D0000000000000001000000000000000000FF
      FFFF1F2C000000080064642F6D6D2F79790001000B00544F54414C2047455241
      4C00000000FFFF0000000000020000000100000000090068656C766574696361
      0008000000020000000000010000000100020000000000FFFFFF000000000200
      00000000000000007026000006004D656D6F313100020053030000700100002E
      0000000D00000000000000F0030000000000000000FFFFFF1F2C020000000000
      01000F005B544F54414C50524F4455544F535D00000000FFFF00000000000200
      00000100000000090068656C7665746963610008000000020000000000010000
      001700020000000000FFFFFF0000000002000000000000000000142700000600
      4D656D6F313600020009000000ED000000B30000000D00000048000000F40100
      00000000000000FFFFFF1F2C02000000000001002100464F4E453A205B717279
      456E64657265636F436C69656E74652E22666F6E65225D00000000FFFF000000
      0000020000000100000000090068656C76657469636100080000000000000000
      00000000000100020000000000FFFFFF00000000020000000000000000009C27
      000006004D656D6F3134000200B401000078000000320000001800000043000B
      00F4010000000000000000FFFFFF1F2C020000000000010005004355504F4D00
      000000FFFF0000000000020000000100000000090068656C7665746963610007
      0000000000000000000A0000000100020000000000FFFFFF0000000002000000
      0000000000002E28000006004D656D6F3232000200E6010000780000003D0000
      001800000043000F00F4010000000000000000FFFFFF1F2C0200000000000100
      0F0050524F4455544F20434C49454E544500000000FFFF000000000002000000
      0100000000090068656C76657469636100070000000000000000000A00000001
      00020000000000FFFFFF0000000002000000000000000000B728000006004D65
      6D6F3234000200B4000000780000004C0000001800000043000B00F401000000
      0000000000FFFFFF1F2C0200000000000100060050454449444F00000000FFFF
      0000000000020000000100000000090068656C76657469636100070000000000
      000000000A0000000100020000000000FFFFFF00000000020000000000000000
      003D29000005004D656D6F340002006B02000078000000150000001800000043
      000F00F4010000000000000000FFFFFF1F2C0200000000000100040046494C2E
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      070000000000000000000A0000000100020000000000FFFFFF00000000020000
      00000000000000C629000006004D656D6F31380002001F030000780000002E00
      00001800000043000E00F4010000000000000000FFFFFF1F2C02000000000001
      00060044455343544F00000000FFFF0000000000020000000100000000090068
      656C76657469636100070000000000000000000A0000000100020000000000FF
      FFFF00000000020000000000000000004C2A000005004D656D6F330002004C03
      000078000000350000001800000043000E00F4010000000000000000FFFFFF1F
      2C020000000000010004005154444500000000FFFF0000000000020000000100
      000000090068656C76657469636100070000000000000000000A000000010002
      0000000000FFFFFF0000000002000000000000000000D72A000006004D656D6F
      32330002008003000078000000350000001800000043000E00F4010000000000
      000000FFFFFF1F2C02000000000001000800554E4954C152494F00000000FFFF
      0000000000020000000100000000090068656C76657469636100070000000000
      000000000A0000000100020000000000FFFFFF00000000020000000000000000
      006C2B000006004D656D6F3132000200B6030000780000003900000018000000
      43000F00F4010000000000000000FFFFFF1F2C02000000000002000A0056414C
      4F52204CCD512E0D050056454E444100000000FFFF0000000000020000000100
      000000090068656C76657469636100070000000000000000000A000000010002
      0000000000FFFFFF0000000002000000000000000000F52B000005004D656D6F
      310002000600000078000000B00000001800000043000F00F401000000000000
      0000FFFFFF1F2C02000000000001000700434C49454E544500000000FFFF0000
      000000020000000100000000090068656C766574696361000700000000000000
      00000A0000000100020000000000FFFFFF000000000200000000000000000082
      2C000005004D656D6F3700020058010000780000002E0000001800000043000B
      00F4010000000000000000FFFFFF1F2C02000000000001000B00444154412046
      415455524100000000FFFF0000000000020000000100000000090068656C7665
      7469636100070000000000000000000A0000000100020000000000FFFFFF0000
      0000020000000000000000003D2D000007004D656D6F3135360002007C000000
      48000000D70000002E0000004B000000F4010000000000000000FFFFFF1F2C02
      0000000000030011005B52415A414F46494C49414C424153455D0D0F005B4345
      505F4349444144455F55465D0D11005B454E44455245434F5F42414952524F5D
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      07000000000000000000000000000100020000000000FFFFFF00000000020000
      00000000000000C32D000005004D656D6F320002004701000078000000130000
      001800000043000F00F4010000000000000000FFFFFF1F2C0200000000000100
      04005349542E00000000FFFF0000000000020000000100000000090068656C76
      657469636100070000000000000000000A0000000100020000000000FFFFFF00
      00000002000000000000000000932E000006004D656D6F343200020009000000
      D1000000AB0000000D00000060000000F4010000000000000000FFFFFF1F2C02
      000000000001004D0043D34449474F3A205B717279456E64657265636F436C69
      656E74652E227469706F636C69656E7465225D5B272D275D5B717279456E6465
      7265636F436C69656E74652E22636C69656E7465225D00000000FFFF00000000
      00020000000100000000090068656C7665746963610008000000000000000000
      000000000100020000000000FFFFFF0000000002000000000000000000292F00
      0006004D656D6F3338000200EF03000078000000390000001800000043000F00
      F4010000000000000000FFFFFF1F2C0200000000000200090044C94249544F20
      6F750D07004352C94449544F00000000FFFF0000000000020000000100000000
      090068656C76657469636100070000000000000000000A000000010002000000
      0000FFFFFF0000000002000000000000000000E62F000006004D656D6F333900
      0200F103000070010000380000000D00000000000000F0030000000000000000
      FFFFFF1F2C000000080064642F6D6D2F797900010032005B464F524D4154464C
      4F415428272323232C2323232C2323302E3030272C20544F54414C4352454449
      544F54524F4341295D00000000FFFF0000000000020000000100000000090068
      656C7665746963610008000000020000000000010000001700020000000000FF
      FFFF00000000020000000000000000008C30000006004D656D6F353200020070
      02000084010000140100000D0000004300000001000000000000000000FFFFFF
      1F2C0200000000000100230056616C6F7220546F74616C202D204465622E2F43
      7265642E20646F20436C69656E746500000000FFFF0000000000020000000100
      000000090068656C766574696361000800000002000000000001000000170002
      0000000000FFFFFF00000000020000000000000000005431000006004D656D6F
      35330002008B03000084010000640000000D00000000000000F0030000000000
      000000FFFFFF1F2C000000080064642F6D6D2F79790001003D005B464F524D41
      54464C4F415428272323232C2323232C2323302E3030272C20544F54414C4745
      52414C2B544F54414C4352454449544F54524F4341295D00000000FFFF000000
      0000020000000100000000090068656C76657469636100080000000200000000
      00010000001700020000000000FFFFFF00000000020000000000000002014032
      00000C004461646F734D65737472653100020100000000500000002F04000000
      0000003100050001000000000000000000FFFFFF1F000000001C006664735265
      6C61746F72696F50726F6475746F73436C69656E746573000000000500050062
      6567696E0D17002020544F54414C50524F434C49454E5445203A3D20303B0D17
      002020544F54414C434C49454E5445202020203A3D20303B0D20002020544F54
      414C4352454449544F54524F4341434C49454E5445203A3D20303B0D0300656E
      6400FFFF000000000002000000010000000000000001000000C8000000140000
      000100000000000002014B3500000E004461646F734465446574616C68650002
      0100000000740000002F0400000D0000003100080001000000000000000000FF
      FFFF1F000000001C0066647352656C61746F72696F50726F6475746F73436C69
      656E746573000000000C000500626567696E0D7A002020544F54414C434C4945
      4E5445203A3D20544F54414C434C49454E5445202B205B71727952656C61746F
      72696F50726F6475746F73436C69656E7465732E22746F74616C707265636F76
      656E6461222B71727952656C61746F72696F50726F6475746F73436C69656E74
      65732E22646573636F6E746F225D3B0D53002020544F54414C50524F434C4945
      4E5445203A3D20544F54414C50524F434C49454E5445202B205B71727952656C
      61746F72696F50726F6475746F73436C69656E7465732E227175616E74696461
      6465225D3B0D00000D67002020544F54414C4352454449544F54524F4341434C
      49454E5445203A3D20544F54414C4352454449544F54524F4341434C49454E54
      45202B205B71727952656C61746F72696F50726F6475746F73436C69656E7465
      732E226372656469746F74726F6361225D3B0D00000D78002020544F54414C47
      4552414C203A3D20544F54414C474552414C202B20285B71727952656C61746F
      72696F50726F6475746F73436C69656E7465732E22746F74616C707265636F76
      656E6461222B71727952656C61746F72696F50726F6475746F73436C69656E74
      65732E22646573636F6E746F225D293B0D51002020544F54414C50524F445554
      4F53203A3D20544F54414C50524F4455544F53202B20285B71727952656C6174
      6F72696F50726F6475746F73436C69656E7465732E227175616E746964616465
      225D293B0D59002020544F54414C4352454449544F54524F4341203A3D20544F
      54414C4352454449544F54524F4341202B205B71727952656C61746F72696F50
      726F6475746F73436C69656E7465732E226372656469746F74726F6361225D3B
      0D00000D00000D0300656E6400FFFF0000000000020000000100000000000000
      01000000C8000000140000000100000000000002012B3700000D00526F646170
      65446574616C686500020100000000DA0000002F040000170000003100090001
      000000000000000000FFFFFF1F000000000000000000000E000500626567696E
      0D220020494620434F554E54284461646F734465446574616C6865293D203120
      7468656E200D0F00202020686569676874203A3D2034330D270020656C736520
      494620434F554E54284461646F734465446574616C686529203D203220746865
      6E0D1400202020686569676874203A3D203433202D2031330D280020656C7365
      20494620434F554E54284461646F734465446574616C686529203D2033207468
      656E200D1400202020686569676874203A3D203433202D2032360D280020656C
      736520494620434F554E54284461646F734465446574616C686529203D203420
      7468656E200D1400202020686569676874203A3D203433202D2033390D130020
      656C73652020686569676874203A3D20303B0D00000D320020494620284C454E
      475448285B717279456E64657265636F436C69656E74652E22727561225D2920
      3E20343129205448454E0D19002020686569676874203A3D2068656967687420
      2B2031333B200D0300656E640000EA0000000000020000000100000000000000
      01000000C8000000140000000100000000000000013E39000006004D656D6F32
      3600020050000000740000007D0000000D00000060000000F401000000000000
      0000FFFFFF1F2C020000000000010061015B4946285B6E636D6973656E746F70
      6973636F66696E735D3D46616C73652C5B71727952656C61746F72696F50726F
      6475746F73436C69656E7465732E22636F6E747261746F225D2C5B7172795265
      6C61746F72696F50726F6475746F73436C69656E7465732E226E636D225D295D
      205B71727952656C61746F72696F50726F6475746F73436C69656E7465732E22
      736974756163616F225D205B4946285B71727952656C61746F72696F50726F64
      75746F73436C69656E7465732E22726567697374726F225D203D202756272C20
      464F524D41544441544554494D45282744442F4D4D2F5959272C205B71727952
      656C61746F72696F50726F6475746F73436C69656E7465732E22666174757261
      6D656E746F225D292C20464F524D41544441544554494D45282744442F4D4D2F
      5959272C205B71727952656C61746F72696F50726F6475746F73436C69656E74
      65732E226465766F6C7563616F225D29295D00000000FFFF0000000000020000
      000100000006090068656C766574696361000800000000000000000001000000
      01000000FF000000FFFFFF1F2F005B71727952656C61746F72696F50726F6475
      746F73436C69656E7465732E22726567697374726F225D203D20274427000200
      00000000000000017B3A000006004D656D6F3238000200CD0000007400000035
      0000000D0000002000000001000000000000000000FFFFFF1F2C020000000000
      01008B005B71727952656C61746F72696F50726F6475746F73436C69656E7465
      732E227365726965225D20205B4946285B71727952656C61746F72696F50726F
      6475746F73436C69656E7465732E224E554D45524F4E4F5441225D3D302C2727
      2C5B71727952656C61746F72696F50726F6475746F73436C69656E7465732E22
      4E554D45524F4E4F5441225D295D2000000000FFFF0000000000020000000100
      000006090068656C766574696361000800000000000000000001000000010000
      00FF000000FFFFFF1F2F005B71727952656C61746F72696F50726F6475746F73
      436C69656E7465732E22726567697374726F225D203D20274427000200000000
      0000000001563C000006004D656D6F3239000200030100007400000036000000
      0D0000002000000001000000000000000000FFFFFF1F2C020000000000010029
      015B4946285B71727952656C61746F72696F50726F6475746F73436C69656E74
      65732E226D617175696E61225D3D302C27272C5B71727952656C61746F72696F
      50726F6475746F73436C69656E7465732E226D617175696E61225D295D20205B
      4946285B71727952656C61746F72696F50726F6475746F73436C69656E746573
      2E22494E54455256454E53414F225D3D302C27272C5B71727952656C61746F72
      696F50726F6475746F73436C69656E7465732E22494E54455256454E53414F22
      5D295D20205B4946285B71727952656C61746F72696F50726F6475746F73436C
      69656E7465732E224E554D45524F4355504F4D225D3D302C27272C5B71727952
      656C61746F72696F50726F6475746F73436C69656E7465732E224E554D45524F
      4355504F4D225D295D2000000000FFFF00000000000200000001000000060900
      68656C76657469636100080000000000000000000100000001000000FF000000
      FFFFFF1F2F005B71727952656C61746F72696F50726F6475746F73436C69656E
      7465732E22726567697374726F225D203D202744270002000000000000000001
      923D000006004D656D6F333100020066020000740000002D0000000D00000000
      00000001000000000000000000FFFFFF1F2C000000080064642F6D6D2F797900
      010082005B4946285B71727952656C61746F72696F50726F6475746F73436C69
      656E7465732E22646573636F6E746F225D203C3E20302C20464F524D4154464C
      4F415428272323232C2323232C2323302E3030272C205B71727952656C61746F
      72696F50726F6475746F73436C69656E7465732E22646573636F6E746F225D29
      2C202727295D00000000FFFF0000000000020000000100000006090068656C76
      657469636100080000000000000000000100000001000000FF000000FFFFFF1F
      2F005B71727952656C61746F72696F50726F6475746F73436C69656E7465732E
      22726567697374726F225D203D2027442700020000000000000000017A3E0000
      06004D656D6F33320002006401000074000000500000000D0000000000000001
      000000000000000000FFFFFF1F2C000000080064642F6D6D2F79790001002E00
      5B71727952656C61746F72696F50726F6475746F73436C69656E7465732E2270
      726F6475746F76697375616C225D00000000FFFF000000000002000000010000
      0006090068656C76657469636100080000000000000000000100000001000000
      FF000000FFFFFF1F2F005B71727952656C61746F72696F50726F6475746F7343
      6C69656E7465732E22726567697374726F225D203D2027442700020000000000
      00000001603F000006004D656D6F3333000200B601000074000000140000000D
      0000000000000001000000000000000000FFFFFF1F2C000000080064642F6D6D
      2F79790001002C005B71727952656C61746F72696F50726F6475746F73436C69
      656E7465732E2266696C69616C76656E6461225D00000000FFFF000000000002
      0000000100000006090068656C76657469636100080000000000000000000100
      000001000000FF000000FFFFFF1F2F005B71727952656C61746F72696F50726F
      6475746F73436C69656E7465732E22726567697374726F225D203D2027442700
      020000000000000000014440000006004D656D6F3334000200CC010000740000
      009A0000000D0000000300000001000000000000000000FFFFFF1F2C00000008
      0064642F6D6D2F79790001002A005B71727952656C61746F72696F50726F6475
      746F73436C69656E7465732E2264657363726963616F225D00000000FFFF0000
      000000020000000100000006090068656C766574696361000800000000000000
      00000000000001000000FF000000FFFFFF1F2F005B71727952656C61746F7269
      6F50726F6475746F73436C69656E7465732E22726567697374726F225D203D20
      27442700020000000000000000017841000006004D656D6F3335000200FE0200
      0074000000380000000D0000000000000001000000000000000000FFFFFF1F2C
      000000080064642F6D6D2F79790001007A005B464F524D4154464C4F41542827
      2323232C2323232C2323302E3030272C205B71727952656C61746F72696F5072
      6F6475746F73436C69656E7465732E22746F74616C707265636F76656E646122
      2B71727952656C61746F72696F50726F6475746F73436C69656E7465732E2264
      6573636F6E746F225D20295D00000000FFFF0000000000020000000100000006
      090068656C76657469636100080000000000000000000100000001000000FF00
      0000FFFFFF1F2F005B71727952656C61746F72696F50726F6475746F73436C69
      656E7465732E22726567697374726F225D203D20274427000200000000000000
      00012F42000006004D656D6F313500020092020000DA000000340000000D0000
      004300000001000000000000000000FFFFFF1F2C020000000000010034005B46
      6F726D6174466C6F6174285B4D6173636172615175616E7469646164655D2C5B
      544F54414C50524F434C49454E54455D295D00000000FFFF0000000000020000
      000100000006090068656C766574696361000800000002000000000001000000
      1700020000000000FFFFFF0000000002000000000000000001BF42000006004D
      656D6F31330002002D020000DA000000600000000D0000004300000001000000
      000000000000FFFFFF1F2C02000000000001000D00546F74616C20436C69656E
      746500000000FFFF0000000000020000000100000006090068656C7665746963
      610008000000020000000000010000001700020000000000FFFFFF0000000002
      0000000000000000017043000006004D656D6F3137000200F6020000DA000000
      400000000D0000000000000001000000000000000000FFFFFF1F2C0200000000
      0001002E005B466F726D6174466C6F617428272323232C2323232C2323302E30
      30272C5B544F54414C434C49454E54455D295D00000000FFFF00000000000200
      00000100000006090068656C7665746963610008000000020000000000010000
      001700020000000000FFFFFF0000000002000000000000000001784400000600
      4D656D6F31390002009502000074000000310000000D00000000000000010000
      00000000000000FFFFFF1F2C000000080064642F6D6D2F79790001004E005B46
      6F726D6174466C6F6174285B4D6173636172615175616E7469646164655D2C5B
      71727952656C61746F72696F50726F6475746F73436C69656E7465732E227175
      616E746964616465225D295D00000000FFFF0000000000020000000100000006
      090068656C76657469636100080000000000000000000100000001000000FF00
      0000FFFFFF1F2F005B71727952656C61746F72696F50726F6475746F73436C69
      656E7465732E22726567697374726F225D203D20274427000200000000000000
      00015845000006004D656D6F32350002000000000074000000490000000D0000
      0060000000F4010000000000000000FFFFFF1F2C02000000000001002E005B71
      727952656C61746F72696F50726F6475746F73436C69656E7465732E22706564
      69646F636C69656E7465225D00000000FFFF0000000000020000000100000006
      090068656C76657469636100080000000000000000000200000001000000FF00
      0000FFFFFF1F2F005B71727952656C61746F72696F50726F6475746F73436C69
      656E7465732E22726567697374726F225D203D20274427000200000000000000
      00014246000006004D656D6F32370002003801000074000000380000000D0000
      000000000001000000000000000000FFFFFF1F2C000000080064642F6D6D2F79
      7900010030005B71727952656C61746F72696F50726F6475746F73436C69656E
      7465732E2270726F6475746F5F636C69656E7465225D00000000FFFF00000000
      00020000000100000006090068656C7665746963610008000000000000000000
      0000000001000000FF000000FFFFFF1F2F005B71727952656C61746F72696F50
      726F6475746F73436C69656E7465732E22726567697374726F225D203D202744
      2700020000000000000000014847000006004D656D6F3330000200C802000074
      000000340000000D0000000000000001000000000000000000FFFFFF1F2C0000
      00080064642F6D6D2F79790001004C005B464F524D4154464C4F415428272323
      232C2323232C2323302E3030272C205B71727952656C61746F72696F50726F64
      75746F73436C69656E7465732E22707265636F76656E6461225D295D00000000
      FFFF0000000000020000000100000006090068656C7665746963610008000000
      0000000000000100000001000000FF000000FFFFFF1F2F005B71727952656C61
      746F72696F50726F6475746F73436C69656E7465732E22726567697374726F22
      5D203D2027442700020000000000000000015048000006004D656D6F33360002
      003903000074000000380000000D0000000000000001000000000000000000FF
      FFFF1F2C000000080064642F6D6D2F79790001004E005B464F524D4154464C4F
      415428272323232C2323232C2323302E3030272C205B71727952656C61746F72
      696F50726F6475746F73436C69656E7465732E226372656469746F74726F6361
      225D295D00000000FFFF0000000000020000000100000006090068656C766574
      69636100080000000000000000000100000001000000FF000000FFFFFF1F2F00
      5B71727952656C61746F72696F50726F6475746F73436C69656E7465732E2272
      6567697374726F225D203D2027442700020000000000000000010D4900000600
      4D656D6F333700020031030000DA000000400000000D00000000000000010000
      00000000000000FFFFFF1F2C02000000000001003A005B466F726D6174466C6F
      617428272323232C2323232C2323302E3030272C5B544F54414C435245444954
      4F54524F4341434C49454E54455D295D00000000FFFF00000000000200000001
      00000006090068656C7665746963610008000000020000000000010000001700
      020000000000FFFFFF000000000200000000000000FEFEFF130000000A002043
      61626563616C686F000000000F0052415A414F46494C49414C42415345000000
      000F00454E44455245434F5F42414952524F000000000D004345505F43494441
      44455F5546000000000600544954554C4F000100300006004F55545241530001
      00300011004D4153434152415155414E54494441444500070027232323232327
      0012006E636D6973656E746F706973636F66696E7300050046616C7365000C00
      204167727570616D656E746F00000000120041677275706172477275706F4669
      6C69616C00050046616C7365000D004167727570617246696C69616C00050046
      616C7365001000416772757061724461746156656E646100050046616C736500
      0C0020544F54414C495A4143414F000000000A00544F54414C474552414C0001
      0030000D00544F54414C50524F4455544F5300010030000F00544F54414C5052
      4F434C49454E544500010030000C00544F54414C434C49454E54450001003000
      1800544F54414C4352454449544F54524F4341434C49454E5445000100300011
      00544F54414C4352454449544F54524F434100010030000000000000000000FC
      00000000000000000000000000000000580042C995683481E3400E6AD3100C22
      E640}
  end
  object frpRelatorioProdutosClientes_SemValores_Modelo_Gama: TfrReport
    Dataset = fdsRelatorioProdutosClientes_
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnBeforePrint = frpRelatorioProdutosClientes_BeforePrint
    Left = 367
    Top = 520
    ReportForm = {
      19000000FB3E000019FFFF00000A0050444643726561746F7200FFFFFFFFFF00
      000000340800009A0B0000000000002400000000000000120000000100040000
      0000FFFF000000000000000000000000030400466F726D00FEFFFFFFDC000000
      780000007C0100002C0100000406000500626567696E0D17002020544F54414C
      50524F4455544F532020203A3D20303B0D1B002020544F54414C474552414C20
      2020202020202020203A3D20303B0D17002020544F54414C50524F434C49454E
      5445203A3D20303B0D0D002020434F554E54203A3D20303B0D0300656E6400FF
      FFFFFFFF00000000340800009A0B000000000000000000000000000000000000
      01000400000000FFFF000000000000000000000000030400466F726D00FEFFFF
      FFDC000000780000007C0100002C010000040000000200960100000900666276
      526F6461706500020100000000CC0200002F0400000F00000030000300010000
      00000000000000FFFFFF1F00000000000000000000000000FFFF000000000002
      000000010000000000000001000000C800000014000000010000000000000200
      010200000B00506167654865616465723100020100000000480000002F040000
      4A0000003000020001000000000000000000FFFFFF1F00000000000000000000
      000000FFFF000000000002000000010000000000000001000000C80000001400
      0000010000000000000200A7020000060056656E64617300020100000000C300
      00002F0400005E0000003400050001000000000000000000FFFFFF1F00000000
      1200666473456E64657265636F436C69656E7465000000000300050062656769
      6E0D1800202020544F54414C50524F434C49454E5445203A3D20303B0D030065
      6E640001000000000000020000000100000000060046696C6861310001000000
      C8000000140000000100000000000002000D030000060046696C686131000201
      00000000300100002F0400000A0000003000150001000000000000000000FFFF
      FF1F00000000000000000000000000FFFF000000000002000000010000000000
      000001000000C80000001400000001000000000000020081030000140053756D
      E172696F446F2052656C6174F372696F31000201000000006C0100002F040000
      160000003000010001000000000000000000FFFFFF1F00000000000000000000
      000000FFFF000000000002000000010000000000000001000000C80000001400
      0000010000000000000100A61B000007006670764C6F676F0002001A00000048
      000000730000002700000005000000F4010000000000000000FFFFFF1F2C0200
      00000000000000000000FFFF00000000000200000001000000060100A61B0000
      424DCE1700000000000036040000280000008300000026000000010008000000
      000098130000120B0000120B0000000100000001000000000000E8E5A800AA9E
      000099990000ADADAD003A3C4100A3970000BFB73700D8D48600FBFAF000A5A5
      A5001E1D1C00D8D9DA0054575A00D6D6D500E7E8F20012161B00B6AD1900CBC5
      5B008C8D9200BEC0C500E1E2E40085878A005E606300494C4F00090D12002C2E
      3300DEDB98007D7F8100EFEDCB00B9BABB00AEA400007C7B7B00C5BE44006666
      6600D1CC6F00CDC9810048484600F7F6E600AFA5080004080D00F9F8ED00B8AF
      2700DBD68C00999999001B1A1900C6BF5100131312003B3A3A00FFFFFF00EAE8
      BE00CCCCCC0023262A00E2DEA400F1EFD600B0B1B300D3CD7500B1A81000CCCC
      660072727200535252004342420001060A00ECE9C3008C8C8B00F5F4DF004A4A
      4A0057575600B6AC1F00282B3000C7C05C0061615F00F7F7F70088888700DDD8
      9300E3E0A600FDFCF70021242900070A1000BDB53100C5BE4A00E3E3E200A69C
      000099999900BABAB900DEDEDE00525458002A292800D9D58A005F5E5D00C7C5
      95001B1E2300E8E5B60000000700B5AB1300D5D07B00C6C6C500B2A80B002120
      2000B9B12400504F4E00666666006B6D7000B5B5BD0084848400E0DC9E00BCB4
      2C00F7EFD6005B5B5A00EFEFEF0087898B00DEDEE6003E3D3C0014181E00C8C2
      5300CCC55F00A8A9AC00BDBDBC00E5E1AC0075767900181B2000E6E6E6000E11
      17000810190033333300929191002D2C2B00B5B5B40000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31543D42470E3131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313152313131313148
      6D3131316D6D4C3131316D6D313131313131313131316D483131313131313131
      6D6D3131316D040A6C6C313131313131486D6D4C3131313131316D6D4C313131
      313131313131313131486D6D6D313131313131486D6D48313131316D48313131
      6D6D3131313131313131313131316D6D6D3131486D6D6D313131313131523131
      31317F7E6631554225256031603D42647931420C313B7D316D6C3D7040313166
      2C316D593D7068313133646C702531484255312C70643059313131310C252542
      0E31477431420E4825793131315442433D474C4C640E3120423C300A3131207E
      2C317F70254748484251512531603C316D59253C620A312C2543306831313131
      3152313131316C2031315959313131317C7D4C4C31487C0E3159683177424C51
      347531434031203D487957543130494C7F3D31487C0C310B37317F7031313131
      3C6631313131642C317C33487E51313131313179602F55317C3331316D793B70
      31487E14314857043131316D7C55557E311E3031542D4C314340313148790A0B
      4C313131315231313131477D313125306C64334C5779313131487C0E31224931
      422C31314340316C7D313C7D3131594931570C31543D31487C0C316870593025
      3131313170706C3C0E313C0A313033317C513131310C702570474C4C3033312C
      7C64300A3148300E31796243432248483051517C31603D316D6464590B2C3154
      7C42301C313131313152313131314749313166420C5548313D2C484831487C0E
      48302C311C4248516275316C7D31493D4879627F31256848373031487C0E3131
      550E207031313131473C0C554831642C4C7E330C62793131316830796D313148
      7C3331577D6D6D313148303331487C49555131487C0C0C7E4C2C703131480C0E
      7C2C313C476D6D31313131313152313131040B7E20316D473C6C33310E3D3C6C
      7931254264646D31486C42706831316C7D31484742702031310E3D433D6C3148
      4355314043473D0A31313131796C3C6C0E316670597E3C3D20313131310E256C
      6C7731316C0E312C3D47430431772F3D0A3133424366484825643C7E6C7C7431
      6D225943425531543D59437D3131313131523131316D643B6D3131316D514831
      313179514C316D51793131313131796D3131313C40313131796D313131313179
      794831317F6D316D15154831313131313131795148314879516D796D31313131
      31313151517931317F6D31316D51516D3151577F6D313131797931316D51516D
      5148313131515151313131314851516D31313131315231313131400431313131
      3131313131313131313131313131313131313131313131680431313131313131
      3131313131313148660F31313131313131313131313131313131313131313131
      313131313131313131313131220E313131313131313166553131313131313131
      3131313131313131313131313131313131313131313131313152313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131315C46121212463F31313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131523131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131315F06020202061B313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31523131313131310E40173C18183D6E3131313131310C2C666C3C1818181818
      05683131313131316D3768220D0516313131313108021F1F1F52353131313131
      72070707070707070707070707070750732B3631313131313131313131362B73
      212112081D31313131313131313123505050504B3131313131313131313F0812
      2E505050085231313131312C103E191919195D17313131317966713E4E191919
      191919195D0D31313131312C34282819190017313131313108021F1F1F523531
      313131311152020202020202020202020202020202022776313131313131313F
      501F02020202020202075C313131313131316A060202065F313131313131314C
      120202020202020221523131313175287A78787878784E223131310E1A3E1078
      7871717171717171281731313131773E7A717171712822313131313108021F1F
      1F5235313131313144021F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1D313131
      31310802021F1F1F1F1F1F1F1F02022331313131313107021F1F020831313131
      3131313A521F1F1F1F1F1F1F5052313131310D4E7878787A7A71282231316D7C
      4E7878784E4E7A717171717128173131312C3E7171717119195D223131313131
      08021F1F1F5269314C4C4C4C631F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F52
      503131313138521F1F1F0202020202021F1F1F5212313131313107021F1F0208
      313131313131361F1F1F1F1F0202020221523131316D457A78787A3D370E0E51
      31313B3E7878787A2274140E0E0E0E0E0E15313115787A787871190D0A145A2A
      6A6A6A2A5F36363636365044111111113226262626262626262626262626264A
      1F1F1F1F612631311B521F1F1F02443A08082363021F1F1F525F313131310702
      1F1F02083131313131311B021F1F1F1F6A2B353532523131310E71717171710C
      313131313115781078784E683131313131313131313131311C287878787A2C31
      31310106020202025F3131313131505202020202363131313131313131313131
      3131313144021F1F1F32312639021F1F1F584C31313131311B27021F1F1F3631
      313107021F1F020831313131313123021F1F1F11093131313152313131337A71
      7171454831313131312C28787810344C313131313131313131313131057A7878
      4E663131313135021F1F1F025F313131313150021F1F1F1F3631313131313131
      313131313131314C5E021F1F0276315F521F1F1F4B313131313131313132271F
      1F527331313107021F1F020831313131313112021F1F02723131313131523131
      31601978787A7C4C3131313131662878781045166E6E6E6E6E6E6E6E1C043155
      5B1078717A603131313135021F1F1F025F313131313150021F1F1F1F36313131
      313131314C0909090909363A021F1F1F1F3F314F021F02723131313131313131
      313123021F1F1109313107021F1F02083131313131312E021F1F027331313131
      3152313131601978787A054C3131313131561978787871282828282828282828
      005631337A717171346D313131313552020202025F3131313131210602020202
      3631313131762E635E61616161611F1F1F1F1F1F114C26611F1F027631313131
      3131313131311D1F1F1F1F1D313107021F1F02083131313131312E021F1F023A
      313131313152313131601978787A054C31313131311819787878787878787878
      787878784E1731141978787A454831313131764444444444241551515151464F
      4F4F4F4F413131313A0202021F1F1F1F1F1F1F1F1F1F1F521B311D1F1F1F1F36
      3131313131313131313126391F1F1F5C313107021F1F02083131313131312E02
      1F1F023A313131313152313131601978787A054C313131313156197878787878
      78787878787878784E1731337A717171346D313131313109090909097D713434
      347A37313131313131313158521F1F1F1F1F0202020202020202275831311D1F
      1F1F1F1D3131313131313131313126391F1F1F5C313107021F1F020831313131
      31312E021F1F023A313131313152313131601978787A054C3131313131224E78
      7878784E28282828282828280056310C787171715B0C31313131313131313131
      133E1010105D74313131313131312939021F1F1F1F3911636363636A50083631
      313126611F1F024B313131313131313131313F021F1F1F36313107021F1F0208
      3131313131312E021F1F023A313131313152313131601978787A054C31313131
      3116287878101A2C2C2C2C2C2C2C2C2C7D1E316D1A7A7878197F313131313131
      31313131134E78787828743131313131313176021F1F1F1F2326313131313131
      3131313131313107021F02213131313131313131313173021F1F444C31310702
      1F1F02083131313131312E021F1F023A313131313152313131601978787A054C
      31313131317F197171713448313131313131313131313131561978784E663131
      3131313131313131134E7878782874313131313131312B521F1F1F6129313131
      313131313131313131313158521F1F024A31313131313131317602021F522331
      313107021F1F02083131313131312E021F1F023A313131313152313131331978
      787A053131313131316D347A78784E133131313131313131313131317D287878
      71710431313131313131313113001919190004313131313131312B521F1F1F27
      4131313131313131313131313131310911021F1F1F232631313131295F1F1F1F
      1F612931313107021F1F022B3131313131312E021F1F52233131313131520E14
      602C7A78787A7C141414140C3131203E78787171660A1E6014141414140E3131
      155B107878107A567D371E1E1E1E1E1E13566C6C6C182C75757575756D315C02
      1F1F1F1F211B1B1B1B1B1B4A4A4A4A4A3631313176021F1F1F0261502323725E
      021F1F1F0258762B2B4A44021F1F1F504A4A4A2B1D312E021F1F1F074A4A4A4A
      5C520D7A7A7A78787878787A7A7A5D1731317945197878784E4E7A7A7A7A7A7A
      5D6C313131165D7171717119191919191919195D6E313131313166007A7A7A4E
      1431295E021F1F1F0202020202020202020202062B313131315802021F1F1F02
      0202021F1F1F1F52384C395252521F1F1F1F1F020202020608312E021F1F1F1F
      0202020221521771717878787878787171714E22313131335B28717878787871
      717171714E1731313131173E7A717878787878787878784E6E31313131316628
      7171717A6031314A521F1F1F1F1F1F1F1F1F1F1F1F1F1F524A31313131316939
      521F1F1F1F1F1F1F1F020258310911021F1F1F1F1F1F1F1F1F1F1F022B312E02
      1F1F1F1F1F1F1F1F50520D19191978787878781919190017313131310C0D1028
      4E4E191919191919000D31313131317D1A4E4E4E19191919191919001C313131
      3131662878787810603131315F0202020202020202020202020202062B313131
      31313136733902020202020261721D313129615252521F1F1F1F1F0202020206
      08312E021F1F1F1F0202020221527D17173C107878714D1717170D2C31313131
      31310E0A1C3B2217171717170D7D31313131313148757D77661717171717170D
      0431313131316628787878106031313131364A3A727272727272727272727250
      5C3131313131313131264B5F737338354131313131093A7272725E1F1F1F1F4F
      1212122E5C312E021F1F1F631212121258523131310E1978787A053131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313117003E3E3E5D75313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131310702
      1F1F52583131313131312E021F1F0223313131313152313131601978787A054C
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131317F686E6E6E6E153131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313121021F1F02073131313131312E021F1F023A313131313152313131601978
      787A054C31313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313173021F1F1F1F4F3A233A32312E021F1F023A3131313131523131
      31601978787A054C313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313169521F1F1F1F0202020608312E021F1F023A31313131
      3152313131601978787A054C3131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131310963521F1F1F1F1F1F024A312E021F1F023A
      313131313152313131601971717A054C31313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131313131314150611F1F1F1F1F024A315002
      1F1F023A3131313131523131310C0D17176C774C313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131313131313131313131315C387272727272
      5C31082E2E2E2E1B3131313131520000351C00000900666D76546974756C6F00
      0200680100004C000000380200001200000043000000F4010000000000000000
      FFFFFF1F2C020000000000010009005B546974756C6F5D2000000000FFFF0000
      000000020000000100000000090068656C766574696361000B00000002000000
      0000020000000000020000000000FFFFFF0000000002000000000000000000CC
      1C00000700666D7644617461000200A50300004C0000005A0000000D00000043
      000000F4010000000000000000FFFFFF1F2C020000000000010013005B444154
      4520234464642F6D6D2F797979795D00000000FFFF0000000000020000000100
      000000090068656C766574696361000800000000000000000001000000010002
      0000000000FFFFFF0000000002000000000000000000591D00000900666D7650
      6167696E61000200B50300005C0000004A0000000F00000043000000F4010000
      000000000000FFFFFF1F2C020000000000010007005B50414745235D00000000
      FFFF0000000000020000000100000000090068656C7665746963610008000000
      000000000000010000000100020000000000FFFFFF0000000002000000000000
      000000EE1D00000700666D76486F726100020024000000CC020000580000000A
      00000043000000F4010000000000000000FFFFFF1F2C02000000000001001100
      5B54494D4520235468683A6D6D3A73735D00000000FFFF000000000002000000
      0100000000090068656C76657469636100070000000000000000001000000001
      00020000000000FFFFFF00000000020000000000000000009B1E00001000666D
      76446573656E766F6C7665646F7200020039030000CD020000CC0000000A0000
      0043000000F4010000000000000000FFFFFF1F2C020000000000010020007465
      63534F4654202D205465636E6F6C6F67696120656D2053697374656D61730000
      0000FFFF0000000000020000000100000000090068656C766574696361000700
      0000000000000000110000000100020000000000FFFFFF000000000200000000
      0000000000261F00000900666D764F7574726173000200680100006000000039
      0200001600000043000000F4010000000000000000FFFFFF1F2C020000000000
      010009005B4F75747261735D2000000000FFFF00000000000200000001000000
      000500417269616C0007000000000000000000020000000000020000000000FF
      FFFF0000000002000000000000000000AC1F000005004D656D6F380002009701
      000078000000320000001800000043000B00F4010000000000000000FFFFFF1F
      2C020000000000010004004E4F544100000000FFFF0000000000020000000100
      000000090068656C76657469636100070000000000000000000A000000010002
      0000000000FFFFFF00000000020000000000000000003720000005004D656D6F
      350002009302000078000000370100001800000043000A00F401000000000000
      0000FFFFFF1F2C02000000000001000900444553435249C7C34F00000000FFFF
      0000000000020000000100000000090068656C76657469636100070000000000
      000000000A0000000100020000000000FFFFFF00000000020000000000000000
      00DC20000006004D656D6F323000020019000000C3000000AB0000000D000000
      60000000F4010000000000000000FFFFFF1F2C020000000000010022005B7172
      79456E64657265636F436C69656E74652E226E6F6D65636C69656E7465225D00
      000000FFFF0000000000020000000100000006090068656C7665746963610008
      000000000000000000000000000100020000000000FFFFFF0000000002000000
      0000000000009121000006004D656D6F34360002001501000078000000430000
      001800000043000A00F4010000000000000000FFFFFF1F2C0200000000000100
      32005B4946285B6E636D6973656E746F706973636F66696E735D3D46616C7365
      2C2027434F4E545241544F272C274E434D27295D00000000FFFF000000000002
      0000000100000000090068656C76657469636100070000000000000000000A00
      00000100020000000000FFFFFF00000000020000000000000000002622000006
      004D656D6F35370002003702000078000000450000001800000043000E00F401
      0000000000000000FFFFFF1F2C0200000000000200080050524F4455544F2F0D
      07005345525649C74F00000000FFFF0000000000020000000100000000090068
      656C76657469636100070000000000000000000A0000000100020000000000FF
      FFFF00000000020000000000000003007E2200000A005375625265706F727431
      000200C8000000C3000000CC0200001200000001000000010000000000000000
      00FFFFFF1F2C020000000000000000000000FFFF000000000002000000010000
      00000100000000009A23000006004D656D6F313000020019000000FA000000D7
      0100002200000043000000F4010000000000000000FFFFFF1F2C020000000000
      03001A005B717279456E64657265636F436C69656E74652E22727561225D0D25
      0042414952524F3A205B717279456E64657265636F436C69656E74652E226261
      6972726F225D0D54005B464F524D415454455854282723232E2323232D232323
      272C205B717279456E64657265636F436C69656E74652E22636570225D295D20
      5B717279456E64657265636F436C69656E74652E22636964616465225D000000
      00FFFF0000000000020000000100000000090068656C76657469636100070000
      00000000000000000000000100020000000000FFFFFF00000000020000000000
      000000004524000006004D656D6F323100020019000000DF000000B30000000D
      00000040000000F4010000000000000000FFFFFF1F2C02000000000001002800
      4350463A205B717279456E64657265636F436C69656E74652E22706573736F61
      6E756D65726F225D00000000FFFF000000000002000000010000000009006865
      6C7665746963610008000000000000000000000000000100020000000000FFFF
      FF00000000020000000000000004009424000005004C696E65310002001C0000
      003A010000FB030000000000000100080064000000000000000000FFFFFF1F2C
      020000000000000000000000FFFF000000000002000000010000000000001A25
      000005004D656D6F320002005701000078000000130000001800000043000E00
      F4010000000000000000FFFFFF1F2C020000000000010004005349542E000000
      00FFFF0000000000020000000100000000090068656C76657469636100070000
      000000000000000A0000000100020000000000FFFFFF00000000020000000000
      00000000AF25000005004D656D6F390002006A030000700100005C0000000D00
      00000000000001000000000000000000FFFFFF1F2C000000080064642F6D6D2F
      79790001000B00544F54414C20474552414C00000000FFFF0000000000020000
      000100000000090068656C766574696361000800000002000000000001000000
      0100020000000000FFFFFF00000000020000000000000000004126000006004D
      656D6F3131000200D1030000700100002E0000000D00000000000000F0030000
      000000000000FFFFFF1F2C02000000000001000F005B544F54414C50524F4455
      544F535D00000000FFFF0000000000020000000100000000090068656C766574
      6963610008000000020000000000010000001700020000000000FFFFFF000000
      0002000000000000000000E526000006004D656D6F313600020019000000ED00
      0000B30000000D00000048000000F4010000000000000000FFFFFF1F2C020000
      00000001002100464F4E453A205B717279456E64657265636F436C69656E7465
      2E22666F6E65225D00000000FFFF000000000002000000010000000009006865
      6C7665746963610008000000000000000000000000000100020000000000FFFF
      FF00000000020000000000000000006D27000006004D656D6F3134000200C801
      000078000000320000001800000043000B00F4010000000000000000FFFFFF1F
      2C020000000000010005004355504F4D00000000FFFF00000000000200000001
      00000000090068656C76657469636100070000000000000000000A0000000100
      020000000000FFFFFF0000000002000000000000000000FF27000006004D656D
      6F3232000200FA010000780000003D0000001800000043000F00F40100000000
      00000000FFFFFF1F2C02000000000001000F0050524F4455544F20434C49454E
      544500000000FFFF0000000000020000000100000000090068656C7665746963
      6100070000000000000000000A0000000100020000000000FFFFFF0000000002
      0000000000000000008828000006004D656D6F3234000200C800000078000000
      4C0000001800000043000B00F4010000000000000000FFFFFF1F2C0200000000
      000100060050454449444F00000000FFFF000000000002000000010000000009
      0068656C76657469636100070000000000000000000A00000001000200000000
      00FFFFFF00000000020000000000000000000D29000005004D656D6F34000200
      7B02000078000000190000001800000043000F00F4010000000000000000FFFF
      FF1F2C0200000000000100030046494C00000000FFFF00000000000200000001
      00000000090068656C76657469636100070000000000000000000A0000000100
      020000000000FFFFFF00000000020000000000000000009329000005004D656D
      6F33000200CA03000078000000350000001800000043000F00F4010000000000
      000000FFFFFF1F2C020000000000010004005154444500000000FFFF00000000
      00020000000100000000090068656C7665746963610007000000000000000000
      0A0000000100020000000000FFFFFF00000000020000000000000000001C2A00
      0005004D656D6F310002001900000078000000B00000001800000043000F00F4
      010000000000000000FFFFFF1F2C02000000000001000700434C49454E544500
      000000FFFF0000000000020000000100000000090068656C7665746963610007
      0000000000000000000A0000000100020000000000FFFFFF0000000002000000
      000000000000A92A000005004D656D6F3700020068010000780000002E000000
      1800000043000F00F4010000000000000000FFFFFF1F2C02000000000001000B
      00444154412046415455524100000000FFFF0000000000020000000100000000
      090068656C76657469636100070000000000000000000A000000010002000000
      0000FFFFFF0000000002000000000000000000642B000007004D656D6F313536
      0002009000000048000000D70000002E0000004B000000F40100000000000000
      00FFFFFF1F2C020000000000030011005B52415A414F46494C49414C42415345
      5D0D0F005B4345505F4349444144455F55465D0D11005B454E44455245434F5F
      42414952524F5D00000000FFFF0000000000020000000100000000090068656C
      7665746963610007000000000000000000000000000100020000000000FFFFFF
      0000000002000000000000000000342C000006004D656D6F3432000200190000
      00D1000000AB0000000D00000060000000F4010000000000000000FFFFFF1F2C
      02000000000001004D0043D34449474F3A205B717279456E64657265636F436C
      69656E74652E227469706F636C69656E7465225D5B272D275D5B717279456E64
      657265636F436C69656E74652E22636C69656E7465225D00000000FFFF000000
      0000020000000100000000090068656C76657469636100080000000000000000
      00000000000100020000000000FFFFFF0000000002000000000000000201FD2C
      00000C004461646F734D65737472653100020100000000500000002F04000000
      0000003100050001000000000000000000FFFFFF1F000000001C006664735265
      6C61746F72696F50726F6475746F73436C69656E746573000000000400050062
      6567696E0D17002020544F54414C50524F434C49454E5445203A3D20303B0D17
      002020544F54414C434C49454E5445202020203A3D20303B0D0300656E6400FF
      FF000000000002000000010000000000000001000000C8000000140000000100
      000000000002012E2F00000E004461646F734465446574616C68650002010000
      0000740000002F0400000D0000003100080001000000000000000000FFFFFF1F
      000000001C0066647352656C61746F72696F50726F6475746F73436C69656E74
      65730000000007000500626567696E0D390020204946205B71727952656C6174
      6F72696F50726F6475746F73436C69656E7465732E22707265636F76656E6461
      225D203C2030205448454E0D7C0020202020544F54414C434C49454E5445203A
      3D20544F54414C434C49454E5445202D205B71727952656C61746F72696F5072
      6F6475746F73436C69656E7465732E227175616E746964616465225D202A205B
      71727952656C61746F72696F50726F6475746F73436C69656E7465732E227072
      65636F76656E6461225D0D06002020454C53450D7D0020202020544F54414C43
      4C49454E5445203A3D20544F54414C434C49454E5445202B205B71727952656C
      61746F72696F50726F6475746F73436C69656E7465732E227175616E74696461
      6465225D202A205B71727952656C61746F72696F50726F6475746F73436C6965
      6E7465732E22707265636F76656E6461225D3B0D53002020544F54414C50524F
      434C49454E5445203A3D20544F54414C50524F434C49454E5445202B205B7172
      7952656C61746F72696F50726F6475746F73436C69656E7465732E227175616E
      746964616465225D3B0D0300656E6400FFFF0000000000020000000100000000
      00000001000000C8000000140000000100000000000002010E3100000D00526F
      64617065446574616C686500020100000000DA0000002F040000170000003100
      090001000000000000000000FFFFFF1F000000000000000000000E0005006265
      67696E0D220020494620434F554E54284461646F734465446574616C6865293D
      2031207468656E200D0F00202020686569676874203A3D2034330D270020656C
      736520494620434F554E54284461646F734465446574616C686529203D203220
      7468656E0D1400202020686569676874203A3D203433202D2031330D28002065
      6C736520494620434F554E54284461646F734465446574616C686529203D2033
      207468656E200D1400202020686569676874203A3D203433202D2032360D2800
      20656C736520494620434F554E54284461646F734465446574616C686529203D
      2034207468656E200D1400202020686569676874203A3D203433202D2033390D
      130020656C73652020686569676874203A3D20303B0D00000D32002049462028
      4C454E475448285B717279456E64657265636F436C69656E74652E2272756122
      5D29203E20343129205448454E0D19002020686569676874203A3D2068656967
      6874202B2031333B200D0300656E640000EA0000000000020000000100000000
      00000001000000C8000000140000000100000000000000012133000006004D65
      6D6F323600020052000000740000007D0000000D00000060000000F401000000
      0000000000FFFFFF1F2C020000000000010061015B4946285B6E636D6973656E
      746F706973636F66696E735D3D46616C73652C5B71727952656C61746F72696F
      50726F6475746F73436C69656E7465732E22636F6E747261746F225D2C5B7172
      7952656C61746F72696F50726F6475746F73436C69656E7465732E226E636D22
      5D295D205B71727952656C61746F72696F50726F6475746F73436C69656E7465
      732E22736974756163616F225D205B4946285B71727952656C61746F72696F50
      726F6475746F73436C69656E7465732E22726567697374726F225D203D202756
      272C20464F524D41544441544554494D45282744442F4D4D2F5959272C205B71
      727952656C61746F72696F50726F6475746F73436C69656E7465732E22666174
      7572616D656E746F225D292C20464F524D41544441544554494D45282744442F
      4D4D2F5959272C205B71727952656C61746F72696F50726F6475746F73436C69
      656E7465732E226465766F6C7563616F225D29295D00000000FFFF0000000000
      020000000100000006090068656C766574696361000800000000000000000001
      00000001000000FF000000FFFFFF1F2F005B71727952656C61746F72696F5072
      6F6475746F73436C69656E7465732E22726567697374726F225D203D20274427
      00020000000000000000015E34000006004D656D6F3238000200CF0000007400
      0000350000000D0000002000000001000000000000000000FFFFFF1F2C020000
      00000001008B005B71727952656C61746F72696F50726F6475746F73436C6965
      6E7465732E227365726965225D20205B4946285B71727952656C61746F72696F
      50726F6475746F73436C69656E7465732E224E554D45524F4E4F5441225D3D30
      2C27272C5B71727952656C61746F72696F50726F6475746F73436C69656E7465
      732E224E554D45524F4E4F5441225D295D2000000000FFFF0000000000020000
      000100000006090068656C766574696361000800000000000000000001000000
      01000000FF000000FFFFFF1F2F005B71727952656C61746F72696F50726F6475
      746F73436C69656E7465732E22726567697374726F225D203D20274427000200
      00000000000000013936000006004D656D6F3239000200050100007400000036
      0000000D0000002000000001000000000000000000FFFFFF1F2C020000000000
      010029015B4946285B71727952656C61746F72696F50726F6475746F73436C69
      656E7465732E226D617175696E61225D3D302C27272C5B71727952656C61746F
      72696F50726F6475746F73436C69656E7465732E226D617175696E61225D295D
      20205B4946285B71727952656C61746F72696F50726F6475746F73436C69656E
      7465732E22494E54455256454E53414F225D3D302C27272C5B71727952656C61
      746F72696F50726F6475746F73436C69656E7465732E22494E54455256454E53
      414F225D295D20205B4946285B71727952656C61746F72696F50726F6475746F
      73436C69656E7465732E224E554D45524F4355504F4D225D3D302C27272C5B71
      727952656C61746F72696F50726F6475746F73436C69656E7465732E224E554D
      45524F4355504F4D225D295D2000000000FFFF00000000000200000001000000
      06090068656C76657469636100080000000000000000000100000001000000FF
      000000FFFFFF1F2F005B71727952656C61746F72696F50726F6475746F73436C
      69656E7465732E22726567697374726F225D203D202744270002000000000000
      0000012137000006004D656D6F33320002006601000074000000500000000D00
      00000000000001000000000000000000FFFFFF1F2C000000080064642F6D6D2F
      79790001002E005B71727952656C61746F72696F50726F6475746F73436C6965
      6E7465732E2270726F6475746F76697375616C225D00000000FFFF0000000000
      020000000100000006090068656C766574696361000800000000000000000001
      00000001000000FF000000FFFFFF1F2F005B71727952656C61746F72696F5072
      6F6475746F73436C69656E7465732E22726567697374726F225D203D20274427
      00020000000000000000010738000006004D656D6F3333000200B80100007400
      0000140000000D0000000000000001000000000000000000FFFFFF1F2C000000
      080064642F6D6D2F79790001002C005B71727952656C61746F72696F50726F64
      75746F73436C69656E7465732E2266696C69616C76656E6461225D00000000FF
      FF0000000000020000000100000006090068656C766574696361000800000000
      00000000000100000001000000FF000000FFFFFF1F2F005B71727952656C6174
      6F72696F50726F6475746F73436C69656E7465732E22726567697374726F225D
      203D202744270002000000000000000001EB38000006004D656D6F3334000200
      CE01000074000000350100000D0000000B00000001000000000000000000FFFF
      FF1F2C000000080064642F6D6D2F79790001002A005B71727952656C61746F72
      696F50726F6475746F73436C69656E7465732E2264657363726963616F225D00
      000000FFFF0000000000020000000100000006090068656C7665746963610008
      0000000000000000000000000001000000FF000000FFFFFF1F2F005B71727952
      656C61746F72696F50726F6475746F73436C69656E7465732E22726567697374
      726F225D203D2027442700020000000000000000017B39000006004D656D6F31
      330002008E020000DA000000600000000D000000430000000100000000000000
      0000FFFFFF1F2C02000000000001000D00546F74616C20436C69656E74650000
      0000FFFF0000000000020000000100000006090068656C766574696361000800
      0000020000000000010000001700020000000000FFFFFF000000000200000000
      0000000001323A000006004D656D6F3137000200F4020000DA00000044000000
      0D0000000000000001000000000000000000FFFFFF1F2C020000000000010034
      005B466F726D6174466C6F6174285B4D6173636172615175616E746964616465
      5D2C5B544F54414C50524F434C49454E54455D295D00000000FFFF0000000000
      020000000100000006090068656C766574696361000800000002000000000001
      0000001700020000000000FFFFFF00000000020000000000000000019B3B0000
      06004D656D6F31390002000703000074000000310000000D0000000000000001
      000000000000000000FFFFFF1F2C000000080064642F6D6D2F79790001004E00
      5B466F726D6174466C6F6174285B4D6173636172615175616E7469646164655D
      2C5B71727952656C61746F72696F50726F6475746F73436C69656E7465732E22
      7175616E746964616465225D295D0003000500626567696E0D51002020544F54
      414C50524F4455544F53203A3D20544F54414C50524F4455544F53202B20285B
      71727952656C61746F72696F50726F6475746F73436C69656E7465732E227175
      616E746964616465225D293B0D0300656E6400FFFF0000000000020000000100
      000006090068656C766574696361000800000000000000000001000000010000
      00FF000000FFFFFF1F2F005B71727952656C61746F72696F50726F6475746F73
      436C69656E7465732E22726567697374726F225D203D20274427000200000000
      00000000017B3C000006004D656D6F3235000200000000007400000051000000
      0D00000060000000F4010000000000000000FFFFFF1F2C02000000000001002E
      005B71727952656C61746F72696F50726F6475746F73436C69656E7465732E22
      70656469646F636C69656E7465225D00000000FFFF0000000000020000000100
      000006090068656C766574696361000800000000000000000002000000010000
      00FF000000FFFFFF1F2F005B71727952656C61746F72696F50726F6475746F73
      436C69656E7465732E22726567697374726F225D203D20274427000200000000
      0000000001653D000006004D656D6F32370002003A0100007400000038000000
      0D0000000000000001000000000000000000FFFFFF1F2C000000080064642F6D
      6D2F797900010030005B71727952656C61746F72696F50726F6475746F73436C
      69656E7465732E2270726F6475746F5F636C69656E7465225D00000000FFFF00
      00000000020000000100000006090068656C7665746963610008000000000000
      0000000000000001000000FF000000FFFFFF1F2F005B71727952656C61746F72
      696F50726F6475746F73436C69656E7465732E22726567697374726F225D203D
      20274427000200000000000000FEFEFF110000000A00204361626563616C686F
      000000000F0052415A414F46494C49414C42415345000000000F00454E444552
      45434F5F42414952524F000000000D004345505F4349444144455F5546000000
      000600544954554C4F000100300006004F5554524153000100300011004D4153
      434152415155414E544944414445000700272323232323270012006E636D6973
      656E746F706973636F66696E7300050046616C7365000C00204167727570616D
      656E746F00000000120041677275706172477275706F46696C69616C00050046
      616C7365000D004167727570617246696C69616C00050046616C736500100041
      6772757061724461746156656E646100050046616C7365000C0020544F54414C
      495A4143414F000000000A00544F54414C474552414C00010030000D00544F54
      414C50524F4455544F5300010030000F00544F54414C50524F434C49454E5445
      00010030000C00544F54414C434C49454E544500010030000000000000000000
      FC00000000000000000000000000000000580042C995683481E3404570D3100C
      22E640}
  end
  object frpRelatorioProdutosVendedores_Modelo_Gama: TfrReport
    Dataset = fdsRelatorioProdutosVendedores
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit, pbPageSetup]
    ReportType = rtMultiple
    StoreInDFM = True
    RebuildPrinter = False
    OnBeforePrint = frpRelatorioProdutosVendedoresBeforePrint
    Left = 618
    Top = 478
    ReportForm = {
      190000003442000019FFFF00000A0050444643726561746F7200FFFFFFFFFF00
      000000340800009A0B0000040000002400000004000000120000000100040000
      0000FFFF000000000000000000000000030400466F726D00FEFFFFFFDC000000
      780000007C0100002C0100000405000500626567696E0D00000D1000544F5441
      4C474552414C203A3D20303B0D00000D0300656E64000200F700000009006662
      76526F6461706500020100000000CC0200002F0400000F000000300003000100
      0000000000000000FFFFFF1F00000000000000000000000000FFFF0000000000
      02000000010000000000000001000000C8000000140000000100000000000002
      00620100000B00506167654865616465723100020100000000480000002F0400
      004A0000003000020001000000000000000000FFFFFF1F000000000000000000
      00000000FFFF000000000002000000010000000000000001000000C800000014
      000000010000000000000200E6010000060056656E64617300020100000000CB
      0000002F0400000F0000003500050001000000000000000000FFFFFF1F000000
      001E0066647352656C61746F72696F50726F6475746F7356656E6465646F7265
      73000000000000000100000000000002000000010000000000000001000000C8
      000000140000000100000000000002005A020000140053756DE172696F446F20
      52656C6174F372696F31000201000000006C0100002F0400002E000000300001
      0001000000000000000000FFFFFF1F00000000000000000000000000FFFF0000
      00000002000000010000000000000001000000C8000000140000000100000000
      00000200F7020000120043616265E7616C686F446520477275706F3100020100
      000000AC0000002F040000000000003000100001000000000000000000FFFFFF
      1F000000002B005B71727952656C61746F72696F50726F6475746F7356656E64
      65646F7265732E2276656E6465646F72225D00000000000000FFFF0000000000
      02000000010000000000000001000000C8000000140000000100000000000002
      00660300000F00526F646170E9446520477275706F3100020100000000F00000
      002F0400002E0000003000110001000000000000000000FFFFFF1F0000000000
      0000000000000000FFFF000000000002000000010000000000000001000000C8
      000000140000000100000000000001008B1B000007006670764C6F676F000200
      1800000048000000730000002700000005000000F4010000000000000000FFFF
      FF1F2C020000000000000000000000FFFF000000000002000000010000000601
      008B1B0000424DCE170000000000003604000028000000830000002600000001
      0008000000000098130000120B0000120B0000000100000001000000000000E8
      E5A800AA9E000099990000ADADAD003A3C4100A3970000BFB73700D8D48600FB
      FAF000A5A5A5001E1D1C00D8D9DA0054575A00D6D6D500E7E8F20012161B00B6
      AD1900CBC55B008C8D9200BEC0C500E1E2E40085878A005E606300494C4F0009
      0D12002C2E3300DEDB98007D7F8100EFEDCB00B9BABB00AEA400007C7B7B00C5
      BE440066666600D1CC6F00CDC9810048484600F7F6E600AFA5080004080D00F9
      F8ED00B8AF2700DBD68C00999999001B1A1900C6BF5100131312003B3A3A00FF
      FFFF00EAE8BE00CCCCCC0023262A00E2DEA400F1EFD600B0B1B300D3CD7500B1
      A81000CCCC660072727200535252004342420001060A00ECE9C3008C8C8B00F5
      F4DF004A4A4A0057575600B6AC1F00282B3000C7C05C0061615F00F7F7F70088
      888700DDD89300E3E0A600FDFCF70021242900070A1000BDB53100C5BE4A00E3
      E3E200A69C000099999900BABAB900DEDEDE00525458002A292800D9D58A005F
      5E5D00C7C595001B1E2300E8E5B60000000700B5AB1300D5D07B00C6C6C500B2
      A80B0021202000B9B12400504F4E00666666006B6D7000B5B5BD0084848400E0
      DC9E00BCB42C00F7EFD6005B5B5A00EFEFEF0087898B00DEDEE6003E3D3C0014
      181E00C8C25300CCC55F00A8A9AC00BDBDBC00E5E1AC0075767900181B2000E6
      E6E6000E1117000810190033333300929191002D2C2B00B5B5B4000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000003131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131543D42470E313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131315231
      31313131486D3131316D6D4C3131316D6D313131313131313131316D48313131
      31313131316D6D3131316D040A6C6C313131313131486D6D4C3131313131316D
      6D4C313131313131313131313131486D6D6D313131313131486D6D4831313131
      6D483131316D6D3131313131313131313131316D6D6D3131486D6D6D31313131
      313152313131317F7E6631554225256031603D42647931420C313B7D316D6C3D
      70403131662C316D593D7068313133646C702531484255312C70643059313131
      310C2525420E31477431420E4825793131315442433D474C4C640E3120423C30
      0A3131207E2C317F70254748484251512531603C316D59253C620A312C254330
      68313131313152313131316C2031315959313131317C7D4C4C31487C0E315968
      3177424C51347531434031203D487957543130494C7F3D31487C0C310B37317F
      70313131313C6631313131642C317C33487E51313131313179602F55317C3331
      316D793B7031487E14314857043131316D7C55557E311E3031542D4C31434031
      3148790A0B4C313131315231313131477D313125306C64334C5779313131487C
      0E31224931422C31314340316C7D313C7D3131594931570C31543D31487C0C31
      68705930253131313170706C3C0E313C0A313033317C513131310C702570474C
      4C3033312C7C64300A3148300E31796243432248483051517C31603D316D6464
      590B2C31547C42301C313131313152313131314749313166420C5548313D2C48
      4831487C0E48302C311C4248516275316C7D31493D4879627F31256848373031
      487C0E3131550E207031313131473C0C554831642C4C7E330C62793131316830
      796D3131487C3331577D6D6D313148303331487C49555131487C0C0C7E4C2C70
      3131480C0E7C2C313C476D6D31313131313152313131040B7E20316D473C6C33
      310E3D3C6C7931254264646D31486C42706831316C7D31484742702031310E3D
      433D6C31484355314043473D0A31313131796C3C6C0E316670597E3C3D203131
      31310E256C6C7731316C0E312C3D47430431772F3D0A3133424366484825643C
      7E6C7C74316D225943425531543D59437D3131313131523131316D643B6D3131
      316D514831313179514C316D51793131313131796D3131313C40313131796D31
      3131313179794831317F6D316D15154831313131313131795148314879516D79
      6D3131313131313151517931317F6D31316D51516D3151577F6D313131797931
      316D51516D5148313131515151313131314851516D3131313131523131313140
      0431313131313131313131313131313131313131313131313131313168043131
      31313131313131313131313148660F3131313131313131313131313131313131
      3131313131313131313131313131313131220E31313131313131316655313131
      3131313131313131313131313131313131313131313131313131313131315231
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131313131315C46121212463F3131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131523131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131315F06020202061B31313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131523131313131310E40173C18183D6E3131313131310C2C666C3C
      181818181805683131313131316D3768220D0516313131313108021F1F1F5235
      313131313172070707070707070707070707070750732B363131313131313131
      3131362B73212112081D31313131313131313123505050504B31313131313131
      31313F08122E505050085231313131312C103E191919195D1731313131796671
      3E4E191919191919195D0D31313131312C34282819190017313131313108021F
      1F1F523531313131311152020202020202020202020202020202022776313131
      313131313F501F02020202020202075C313131313131316A060202065F313131
      313131314C120202020202020221523131313175287A78787878784E22313131
      0E1A3E10787871717171717171281731313131773E7A71717171282231313131
      3108021F1F1F5235313131313144021F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
      1F1D31313131310802021F1F1F1F1F1F1F1F02022331313131313107021F1F02
      08313131313131313A521F1F1F1F1F1F1F5052313131310D4E7878787A7A7128
      2231316D7C4E7878784E4E7A717171717128173131312C3E7171717119195D22
      313131313108021F1F1F5269314C4C4C4C631F1F1F1F1F1F1F1F1F1F1F1F1F1F
      1F1F1F1F52503131313138521F1F1F0202020202021F1F1F5212313131313107
      021F1F0208313131313131361F1F1F1F1F0202020221523131316D457A78787A
      3D370E0E5131313B3E7878787A2274140E0E0E0E0E0E15313115787A78787119
      0D0A145A2A6A6A6A2A5F36363636365044111111113226262626262626262626
      262626264A1F1F1F1F612631311B521F1F1F02443A08082363021F1F1F525F31
      31313107021F1F02083131313131311B021F1F1F1F6A2B353532523131310E71
      717171710C313131313115781078784E683131313131313131313131311C2878
      78787A2C3131310106020202025F313131313150520202020236313131313131
      31313131313131313144021F1F1F32312639021F1F1F584C31313131311B2702
      1F1F1F3631313107021F1F020831313131313123021F1F1F1109313131315231
      3131337A717171454831313131312C28787810344C3131313131313131313131
      31057A78784E663131313135021F1F1F025F313131313150021F1F1F1F363131
      3131313131313131313131314C5E021F1F0276315F521F1F1F4B313131313131
      313132271F1F527331313107021F1F020831313131313112021F1F0272313131
      313152313131601978787A7C4C3131313131662878781045166E6E6E6E6E6E6E
      6E1C0431555B1078717A603131313135021F1F1F025F313131313150021F1F1F
      1F36313131313131314C0909090909363A021F1F1F1F3F314F021F0272313131
      3131313131313123021F1F1109313107021F1F02083131313131312E021F1F02
      73313131313152313131601978787A054C313131313156197878787128282828
      2828282828005631337A717171346D313131313552020202025F313131313121
      06020202023631313131762E635E61616161611F1F1F1F1F1F114C26611F1F02
      76313131313131313131311D1F1F1F1F1D313107021F1F02083131313131312E
      021F1F023A313131313152313131601978787A054C3131313131181978787878
      7878787878787878784E1731141978787A454831313131764444444444241551
      515151464F4F4F4F4F413131313A0202021F1F1F1F1F1F1F1F1F1F1F521B311D
      1F1F1F1F363131313131313131313126391F1F1F5C313107021F1F0208313131
      3131312E021F1F023A313131313152313131601978787A054C31313131315619
      787878787878787878787878784E1731337A717171346D313131313109090909
      097D713434347A37313131313131313158521F1F1F1F1F020202020202020227
      5831311D1F1F1F1F1D3131313131313131313126391F1F1F5C313107021F1F02
      083131313131312E021F1F023A313131313152313131601978787A054C313131
      3131224E787878784E28282828282828280056310C787171715B0C3131313131
      3131313131133E1010105D74313131313131312939021F1F1F1F391163636363
      6A50083631313126611F1F024B313131313131313131313F021F1F1F36313107
      021F1F02083131313131312E021F1F023A313131313152313131601978787A05
      4C313131313116287878101A2C2C2C2C2C2C2C2C2C7D1E316D1A7A7878197F31
      313131313131313131134E78787828743131313131313176021F1F1F1F232631
      31313131313131313131313107021F02213131313131313131313173021F1F44
      4C313107021F1F02083131313131312E021F1F023A3131313131523131316019
      78787A054C31313131317F197171713448313131313131313131313131561978
      784E6631313131313131313131134E7878782874313131313131312B521F1F1F
      6129313131313131313131313131313158521F1F024A31313131313131317602
      021F522331313107021F1F02083131313131312E021F1F023A31313131315231
      3131331978787A053131313131316D347A78784E133131313131313131313131
      317D28787871710431313131313131313113001919190004313131313131312B
      521F1F1F274131313131313131313131313131310911021F1F1F232631313131
      295F1F1F1F1F612931313107021F1F022B3131313131312E021F1F5223313131
      3131520E14602C7A78787A7C141414140C3131203E78787171660A1E60141414
      14140E3131155B107878107A567D371E1E1E1E1E1E13566C6C6C182C75757575
      756D315C021F1F1F1F211B1B1B1B1B1B4A4A4A4A4A3631313176021F1F1F0261
      502323725E021F1F1F0258762B2B4A44021F1F1F504A4A4A2B1D312E021F1F1F
      074A4A4A4A5C520D7A7A7A78787878787A7A7A5D1731317945197878784E4E7A
      7A7A7A7A7A5D6C313131165D7171717119191919191919195D6E313131313166
      007A7A7A4E1431295E021F1F1F0202020202020202020202062B313131315802
      021F1F1F020202021F1F1F1F52384C395252521F1F1F1F1F020202020608312E
      021F1F1F1F0202020221521771717878787878787171714E22313131335B2871
      7878787871717171714E1731313131173E7A717878787878787878784E6E3131
      31313166287171717A6031314A521F1F1F1F1F1F1F1F1F1F1F1F1F1F524A3131
      3131316939521F1F1F1F1F1F1F1F020258310911021F1F1F1F1F1F1F1F1F1F1F
      022B312E021F1F1F1F1F1F1F1F50520D19191978787878781919190017313131
      310C0D10284E4E191919191919000D31313131317D1A4E4E4E19191919191919
      001C3131313131662878787810603131315F0202020202020202020202020202
      062B31313131313136733902020202020261721D313129615252521F1F1F1F1F
      020202020608312E021F1F1F1F0202020221527D17173C107878714D1717170D
      2C3131313131310E0A1C3B2217171717170D7D31313131313148757D77661717
      171717170D0431313131316628787878106031313131364A3A72727272727272
      72727272505C3131313131313131264B5F737338354131313131093A7272725E
      1F1F1F1F4F1212122E5C312E021F1F1F631212121258523131310E1978787A05
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131313117003E3E3E5D7531313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313107021F1F52583131313131312E021F1F02233131313131523131316019
      78787A054C313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131313131317F686E6E6E6E15313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313121021F1F02073131313131312E021F1F023A31313131315231
      3131601978787A054C3131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313173021F1F1F1F4F3A233A32312E021F1F023A313131
      313152313131601978787A054C31313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131313169521F1F1F1F0202020608312E021F1F02
      3A313131313152313131601978787A054C313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131313131310963521F1F1F1F1F1F024A312E
      021F1F023A313131313152313131601971717A054C3131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131314150611F1F1F1F1F
      024A3150021F1F023A3131313131523131310C0D17176C774C31313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131315C38
      72727272725C31082E2E2E2E1B31313131315200001A1C00000900666D765469
      74756C6F0002006801000048000000140200001200000043000000F401000000
      0000000000FFFFFF1F2C020000000000010009005B546974756C6F5D20000000
      00FFFF0000000000020000000100000000090068656C766574696361000B0000
      00020000000000020000000000020000000000FFFFFF00000000020000000000
      00000000B11C00000700666D7644617461000200B40300004C0000005A000000
      0D00000043000000F4010000000000000000FFFFFF1F2C020000000000010013
      005B4441544520234464642F6D6D2F797979795D00000000FFFF000000000002
      0000000100000000090068656C76657469636100080000000000000000000100
      00000100020000000000FFFFFF00000000020000000000000000003E1D000009
      00666D76506167696E61000200C40300005C0000004A0000000F000000430000
      00F4010000000000000000FFFFFF1F2C020000000000010007005B5041474523
      5D00000000FFFF0000000000020000000100000000090068656C766574696361
      0008000000000000000000010000000100020000000000FFFFFF000000000200
      0000000000000000D31D00000700666D76486F726100020024000000CC020000
      580000000A00000043000000F4010000000000000000FFFFFF1F2C0200000000
      00010011005B54494D4520235468683A6D6D3A73735D00000000FFFF00000000
      00020000000100000000090068656C7665746963610007000000000000000000
      100000000100020000000000FFFFFF0000000002000000000000000000801E00
      001000666D76446573656E766F6C7665646F7200020035030000CD020000CC00
      00000A00000043000000F4010000000000000000FFFFFF1F2C02000000000001
      002000746563534F4654202D205465636E6F6C6F67696120656D205369737465
      6D617300000000FFFF0000000000020000000100000000090068656C76657469
      63610007000000000000000000110000000100020000000000FFFFFF00000000
      020000000000000000000B1F00000900666D764F757472617300020068010000
      60000000150200001600000043000000F4010000000000000000FFFFFF1F2C02
      0000000000010009005B4F75747261735D2000000000FFFF0000000000020000
      0001000000000500417269616C00070000000000000000000200000000000200
      00000000FFFFFF00000000020000000000000000001820000005004D656D6F36
      0002009A030000700100003C0000000D00000000000000010000000000000000
      00FFFFFF1F2C000000080064642F6D6D2F797900010083005B464F524D415446
      4C4F415428272323232C2323232C2323302E3030272C2053554D285B71727952
      656C61746F72696F50726F6475746F7356656E6465646F7265732E22746F7461
      6C707265636F76656E6461225D2B71727952656C61746F72696F50726F647574
      6F7356656E6465646F7265732E22646573636F6E746F2229295D2000000000FF
      FF0000000000020000000100000000090068656C766574696361000800000002
      0000000000010000000100020000000000FFFFFF000000000200000000000000
      0000AD20000005004D656D6F39000200C6020000700100005C0000000D000000
      0000000001000000000000000000FFFFFF1F2C000000080064642F6D6D2F7979
      0001000B00544F54414C20474552414C00000000FFFF00000000000200000001
      00000000090068656C7665746963610008000000020000000000010000000100
      020000000000FFFFFF00000000020000000000000000001C22000006004D656D
      6F3130000200D8000000CB0000007F0000000D00000060000000F40100000000
      00000000FFFFFF1F2C0200000000000100EC005B4946285B6E636D6973656E74
      6F706973636F66696E735D3D46616C73652C5B71727952656C61746F72696F50
      726F6475746F7356656E6465646F7265732E22636F6E747261746F225D2C5B71
      727952656C61746F72696F50726F6475746F7356656E6465646F7265732E226E
      636D225D295D205B71727952656C61746F72696F50726F6475746F7356656E64
      65646F7265732E22736974756163616F225D205B464F524D4154444154455449
      4D45282764642F6D6D2F7979272C205B71727952656C61746F72696F50726F64
      75746F7356656E6465646F7265732E226661747572616D656E746F225D295D00
      000000FFFF0000000000020000000100000006090068656C7665746963610008
      000000000000000000010000000100020000000000FFFFFF0000000002000000
      0000000000003023000006004D656D6F313300020058010000CB000000350000
      000D0000002000000001000000000000000000FFFFFF1F2C0200000000000100
      91005B71727952656C61746F72696F50726F6475746F7356656E6465646F7265
      732E227365726965225D20205B4946285B71727952656C61746F72696F50726F
      6475746F7356656E6465646F7265732E224E554D45524F4E4F5441225D3D302C
      27272C5B71727952656C61746F72696F50726F6475746F7356656E6465646F72
      65732E224E554D45524F4E4F5441225D295D2000000000FFFF00000000000200
      00000100000006090068656C7665746963610008000000000000000000010000
      000100020000000000FFFFFF0000000002000000000000000000E92400000600
      4D656D6F31350002008F010000CB0000002C0000000D00000020000000010000
      00000000000000FFFFFF1F2C020000000000010036015B4946285B7172795265
      6C61746F72696F50726F6475746F7356656E6465646F7265732E226D61717569
      6E61225D3D302C27272C5B71727952656C61746F72696F50726F6475746F7356
      656E6465646F7265732E226D617175696E61225D295D2020205B4946285B7172
      7952656C61746F72696F50726F6475746F7356656E6465646F7265732E22494E
      54455256454E53414F225D3D302C27272C5B71727952656C61746F72696F5072
      6F6475746F7356656E6465646F7265732E22494E54455256454E53414F225D29
      5D20205B4946285B71727952656C61746F72696F50726F6475746F7356656E64
      65646F7265732E224E554D45524F4355504F4D225D3D302C27272C5B71727952
      656C61746F72696F50726F6475746F7356656E6465646F7265732E224E554D45
      524F4355504F4D225D295D2000000000FFFF0000000000020000000100000006
      090068656C766574696361000800000000000000000001000000010002000000
      0000FFFFFF0000000002000000000000000000C425000006004D656D6F313600
      020032030000CB000000340000000D0000000000000001000000000000000000
      FFFFFF1F2C000000080064642F6D6D2F797900010050005B466F726D6174466C
      6F6174285B4D6173636172615175616E7469646164655D2C5B71727952656C61
      746F72696F50726F6475746F7356656E6465646F7265732E227175616E746964
      616465225D295D00000000FFFF0000000000020000000100000006090068656C
      7665746963610008000000000000000000010000000100020000000000FFFFFF
      00000000020000000000000000007F26000006004D656D6F3137000200F80100
      00CB000000450000000D0000000000000001000000000000000000FFFFFF1F2C
      000000080064642F6D6D2F797900010030005B71727952656C61746F72696F50
      726F6475746F7356656E6465646F7265732E2270726F6475746F76697375616C
      225D00000000FFFF0000000000020000000100000006090068656C7665746963
      610008000000000000000000010000000100020000000000FFFFFF0000000002
      0000000000000000003827000006004D656D6F313800020041020000CB000000
      140000000D0000000000000001000000000000000000FFFFFF1F2C0000000800
      64642F6D6D2F79790001002E005B71727952656C61746F72696F50726F647574
      6F7356656E6465646F7265732E2266696C69616C76656E6461225D00000000FF
      FF0000000000020000000100000006090068656C766574696361000800000000
      0000000000020000000100020000000000FFFFFF000000000200000000000000
      0000EF27000006004D656D6F313900020054020000CB000000B00000000D0000
      000B00000001000000000000000000FFFFFF1F2C000000080064642F6D6D2F79
      790001002C005B71727952656C61746F72696F50726F6475746F7356656E6465
      646F7265732E2264657363726963616F225D00000000FFFF0000000000020000
      000100000006090068656C766574696361000800000000000000000000000000
      0100020000000000FFFFFF0000000002000000000000000000F928000006004D
      656D6F32300002009A030000CB0000003C0000000D0000000000000001000000
      000000000000FFFFFF1F2C000000080064642F6D6D2F79790001007F005B464F
      524D4154464C4F415428272323232C2323232C2323302E3030272C205B717279
      52656C61746F72696F50726F6475746F7356656E6465646F7265732E22746F74
      616C707265636F76656E6461225D2B5B71727952656C61746F72696F50726F64
      75746F7356656E6465646F7265732E22646573636F6E746F225D295D00000000
      FFFF0000000000020000000100000006090068656C7665746963610008000000
      000000000000010000000100020000000000FFFFFF0000000002000000000000
      000000D929000006004D656D6F323200020016000000CB000000670000000D00
      000060000000F4010000000000000000FFFFFF1F2C020000000000010061005B
      71727952656C61746F72696F50726F6475746F7356656E6465646F7265732E22
      76656E6465646F72225D205B272D275D205B71727952656C61746F72696F5072
      6F6475746F7356656E6465646F7265732E226E6F6D6576656E6465646F72225D
      00000000FFFF00000000000200000001000000060500417269616C0008000000
      020000000000000000000000020000000000FFFFFF0000000002000000000000
      000000E62A000006004D656D6F32330002009A030000F40000003C0000000D00
      00000000000001000000000000000000FFFFFF1F2C000000080064642F6D6D2F
      797900010082005B464F524D4154464C4F415428272323232C2323232C232330
      2E3030272C2053554D285B71727952656C61746F72696F50726F6475746F7356
      656E6465646F7265732E22746F74616C707265636F76656E6461225D2B717279
      52656C61746F72696F50726F6475746F7356656E6465646F7265732E22646573
      636F6E746F2229295D00000000FFFF0000000000020000000100000000090068
      656C7665746963610008000000020000000000010000000100020000000000FF
      FFFF00000000020000000000000000007F2B000006004D656D6F3234000200C6
      020000F40000005C0000000D0000000000000001000000000000000000FFFFFF
      1F2C000000080064642F6D6D2F79790001000E00544F54414C2056454E444544
      4F5200000000FFFF0000000000020000000100000000090068656C7665746963
      610008000000020000000000010000000100020000000000FFFFFF0000000002
      000000000000000000592C000006004D656D6F32350002002E030000F4000000
      380000000D0000000300000001000000000000000000FFFFFF1F2C0000000000
      00010057005B466F726D6174466C6F6174285B4D6173636172615175616E7469
      646164655D2C5B53554D285B71727952656C61746F72696F50726F6475746F73
      56656E6465646F7265732E227175616E746964616465225D295D295D00000000
      FFFF0000000000020000000100000000090068656C7665746963610008000000
      020000000000010000001700020000000000FFFFFF0000000002000000000000
      000000332D000006004D656D6F32360002003203000070010000340000000D00
      00004300000001000000000000000000FFFFFF1F2C020000000000010057005B
      466F726D6174466C6F6174285B4D6173636172615175616E7469646164655D2C
      5B53554D285B71727952656C61746F72696F50726F6475746F7356656E646564
      6F7265732E227175616E746964616465225D295D295D00000000FFFF00000000
      00020000000100000000090068656C7665746963610008000000020000000000
      010000001700020000000000FFFFFF0000000002000000000000000000EE2D00
      0007004D656D6F3135360002006E00000048000000D70000002E0000004B0000
      00F4010000000000000000FFFFFF1F2C020000000000030011005B52415A414F
      46494C49414C424153455D0D0F005B4345505F4349444144455F55465D0D1100
      5B454E44455245434F5F42414952524F5D00000000FFFF000000000002000000
      0100000000090068656C76657469636100070000000000000000000000000001
      00020000000000FFFFFF0000000002000000000000000000742E000005004D65
      6D6F380002005B01000078000000320000001800000043000B00F40100000000
      00000000FFFFFF1F2C020000000000010004004E4F544100000000FFFF000000
      0000020000000100000000090068656C76657469636100070000000000000000
      000A0000000100020000000000FFFFFF0000000002000000000000000000FF2E
      000005004D656D6F350002005A02000078000000AD0000001800000043000A00
      F4010000000000000000FFFFFF1F2C02000000000001000900444553435249C7
      C34F00000000FFFF0000000000020000000100000000090068656C7665746963
      6100070000000000000000000A0000000100020000000000FFFFFF0000000002
      000000000000000000B42F000006004D656D6F3436000200D700000078000000
      430000001800000043000A00F4010000000000000000FFFFFF1F2C0200000000
      00010032005B4946285B6E636D6973656E746F706973636F66696E735D3D4661
      6C73652C2027434F4E545241544F272C274E434D27295D00000000FFFF000000
      0000020000000100000000090068656C76657469636100070000000000000000
      000A0000000100020000000000FFFFFF00000000020000000000000000003E30
      000006004D656D6F3537000200FC01000078000000450000001800000043000E
      00F4010000000000000000FFFFFF1F2C0200000000000100070050524F445554
      4F00000000FFFF0000000000020000000100000000090068656C766574696361
      00070000000000000000000A0000000100020000000000FFFFFF000000000200
      0000000000000000C430000005004D656D6F320002001A010000780000001300
      00001800000043000E00F4010000000000000000FFFFFF1F2C02000000000001
      0004005349542E00000000FFFF0000000000020000000100000000090068656C
      76657469636100070000000000000000000A0000000100020000000000FFFFFF
      00000000020000000000000000004C31000006004D656D6F31340002008D0100
      0078000000320000001800000043000B00F4010000000000000000FFFFFF1F2C
      020000000000010005004355504F4D00000000FFFF0000000000020000000100
      000000090068656C76657469636100070000000000000000000A000000010002
      0000000000FFFFFF0000000002000000000000000000DD31000005004D656D6F
      31000200BF010000780000003D0000001800000043000F00F401000000000000
      0000FFFFFF1F2C02000000000001000F0050524F4455544F20434C49454E5445
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      070000000000000000000A0000000100020000000000FFFFFF00000000020000
      000000000000006532000005004D656D6F330002008300000078000000540000
      001800000043000B00F4010000000000000000FFFFFF1F2C0200000000000100
      060050454449444F00000000FFFF000000000002000000010000000009006865
      6C76657469636100070000000000000000000A0000000100020000000000FFFF
      FF0000000002000000000000000000EB32000005004D656D6F34000200410200
      0078000000190000001800000043000F00F4010000000000000000FFFFFF1F2C
      0200000000000100040046494C2E00000000FFFF000000000002000000010000
      0000090068656C76657469636100070000000000000000000A00000001000200
      00000000FFFFFF00000000020000000000000000007333000005004D656D6F37
      00020007030000780000002E0000001800000043000E00F40100000000000000
      00FFFFFF1F2C0200000000000100060044455343544F00000000FFFF00000000
      00020000000100000000090068656C7665746963610007000000000000000000
      0A0000000100020000000000FFFFFF0000000002000000000000000000FA3300
      0006004D656D6F31310002003503000078000000330000001800000043000E00
      F4010000000000000000FFFFFF1F2C0200000000000100040051544445000000
      00FFFF0000000000020000000100000000090068656C76657469636100070000
      000000000000000A0000000100020000000000FFFFFF00000000020000000000
      000000008534000006004D656D6F313200020068030000780000003500000018
      00000043000E00F4010000000000000000FFFFFF1F2C02000000000001000800
      554E4954C152494F00000000FFFF000000000002000000010000000009006865
      6C76657469636100070000000000000000000A0000000100020000000000FFFF
      FF0000000002000000000000000000203500000B004D656D6F32375F68616861
      0002009D03000078000000390000001800000043000F00F40100000000000000
      00FFFFFF1F2C02000000000002000B0056414C4F52204CCD512E200D05005645
      4E444100000000FFFF0000000000020000000100000000090068656C76657469
      636100070000000000000000000A0000000100020000000000FFFFFF00000000
      02000000000000000000AB35000006004D656D6F323800020017000000780000
      006C0000001800000043000F00F4010000000000000000FFFFFF1F2C02000000
      00000100080056454E4445444F5200000000FFFF000000000002000000010000
      0000090068656C76657469636100070000000000000000000A00000001000200
      00000000FFFFFF00000000020000000000000000003936000006004D656D6F32
      390002002D010000780000002E0000001800000043000F00F401000000000000
      0000FFFFFF1F2C02000000000001000B00444154412046415455524100000000
      FFFF0000000000020000000100000000090068656C7665746963610007000000
      0000000000000A0000000100020000000000FFFFFF0000000002000000000000
      0000004A37000006004D656D6F3331000200FA020000CB000000380000000D00
      00004000000001000000000000000000FFFFFF1F2C000000080064642F6D6D2F
      797900010086005B4946285B71727952656C61746F72696F50726F6475746F73
      56656E6465646F7265732E22646573636F6E746F225D203C3E20302C20464F52
      4D4154464C4F415428272323232C2323232C2323302E3030272C205B71727952
      656C61746F72696F50726F6475746F7356656E6465646F7265732E2264657363
      6F6E746F225D292C202727295D00000000FFFF00000000000200000001000000
      06090068656C7665746963610008000000000000000000010000000100020000
      000000FFFFFF0000000002000000000000000000FD37000006004D656D6F3332
      00020081000000CB000000570000000D00000060000000F40100000000000000
      00FFFFFF1F2C020000000000010030005B71727952656C61746F72696F50726F
      6475746F7356656E6465646F7265732E2270656469646F636C69656E7465225D
      00000000FFFF0000000000020000000100000006090068656C76657469636100
      08000000000000000000010000000100020000000000FFFFFF00000000020000
      00000000000000BA38000006004D656D6F3333000200BB010000CB0000003C00
      00000D0000000000000001000000000000000000FFFFFF1F2C00000008006464
      2F6D6D2F797900010032005B71727952656C61746F72696F50726F6475746F73
      56656E6465646F7265732E2270726F6475746F5F636C69656E7465225D000000
      00FFFF0000000000020000000100000006090068656C76657469636100080000
      00000000000000000000000100020000000000FFFFFF00000000020000000000
      000000009339000006004D656D6F333400020066030000CB000000340000000D
      0000000000000001000000000000000000FFFFFF1F2C000000080064642F6D6D
      2F79790001004E005B464F524D4154464C4F415428272323232C2323232C2323
      302E3030272C205B71727952656C61746F72696F50726F6475746F7356656E64
      65646F7265732E22707265636F76656E6461225D295D00000000FFFF00000000
      00020000000100000006090068656C7665746963610008000000000000000000
      010000000100020000000000FFFFFF0000000002000000000000000000273A00
      0006004D656D6F3231000200D603000078000000390000001800000043000F00
      F4010000000000000000FFFFFF1F2C0200000000000100110044C94249544F20
      4F55204352C94449544F00000000FFFF00000000000200000001000000000900
      68656C76657469636100070000000000000000000A0000000100020000000000
      FFFFFF0000000002000000000000000000403B000006004D656D6F3237000200
      D3030000CB0000003C0000000D0000000000000001000000000000000000FFFF
      FF1F2C000000080064642F6D6D2F79790001008E005B4946285B71727952656C
      61746F72696F50726F6475746F7356656E6465646F7265732E22637265646974
      6F74726F6361225D203C3E20302C20464F524D4154464C4F415428272323232C
      2323232C2323302E3030272C205B71727952656C61746F72696F50726F647574
      6F7356656E6465646F7265732E226372656469746F74726F6361225D292C2027
      27295D00000000FFFF0000000000020000000100000006090068656C76657469
      63610008000000000000000000010000000100020000000000FFFFFF00000000
      02000000000000000000203C000006004D656D6F3330000200D3030000F40000
      003C0000000D0000000000000001000000000000000000FFFFFF1F2C00000008
      0064642F6D6D2F797900010055005B464F524D4154464C4F415428272323232C
      2323232C2323302E3030272C2053554D285B71727952656C61746F72696F5072
      6F6475746F7356656E6465646F7265732E226372656469746F74726F6361225D
      29295D00000000FFFF0000000000020000000100000000090068656C76657469
      63610008000000020000000000010000000100020000000000FFFFFF00000000
      02000000000000000000003D000006004D656D6F3335000200D3030000700100
      003C0000000D0000000000000001000000000000000000FFFFFF1F2C00000008
      0064642F6D6D2F797900010055005B464F524D4154464C4F415428272323232C
      2323232C2323302E3030272C2053554D285B71727952656C61746F72696F5072
      6F6475746F7356656E6465646F7265732E226372656469746F74726F6361225D
      29295D00000000FFFF0000000000020000000100000000090068656C76657469
      63610008000000020000000000010000000100020000000000FFFFFF00000000
      02000000000000000000A63D000006004D656D6F35320002007C020000080100
      00140100000D0000004300000001000000000000000000FFFFFF1F2C02000000
      00000100230056616C6F7220546F74616C202D204465622E2F437265642E2064
      6F20436C69656E746500000000FFFF0000000000020000000100000000090068
      656C7665746963610008000000020000000000010000001700020000000000FF
      FFFF0000000002000000000000000000ED3E000006004D656D6F353300020096
      03000008010000400000000D00000000000000F0030000000000000000FFFFFF
      1F2C000000080064642F6D6D2F7979000100BC005B464F524D4154464C4F4154
      28272323232C2323232C2323302E3030272C53554D285B71727952656C61746F
      72696F50726F6475746F7356656E6465646F7265732E22746F74616C70726563
      6F76656E6461225D2B5B71727952656C61746F72696F50726F6475746F735665
      6E6465646F7265732E22646573636F6E746F225D2B5B71727952656C61746F72
      696F50726F6475746F7356656E6465646F7265732E226372656469746F74726F
      6361225D2C56656E6461732C3029295D00000000FFFF00000000000200000001
      00000000090068656C7665746963610008000000020000000000010000001700
      020000000000FFFFFF0000000002000000000000000000933F000006004D656D
      6F33360002007C02000084010000140100000D00000043000000010000000000
      00000000FFFFFF1F2C0200000000000100230056616C6F7220546F74616C202D
      204465622E2F437265642E20646F20436C69656E746500000000FFFF00000000
      00020000000100000000090068656C7665746963610008000000020000000000
      010000001700020000000000FFFFFF0000000002000000000000000000DA4000
      0006004D656D6F33370002009603000084010000400000000D00000000000000
      F0030000000000000000FFFFFF1F2C000000080064642F6D6D2F7979000100BC
      005B464F524D4154464C4F415428272323232C2323232C2323302E3030272C53
      554D285B71727952656C61746F72696F50726F6475746F7356656E6465646F72
      65732E22746F74616C707265636F76656E6461225D2B5B71727952656C61746F
      72696F50726F6475746F7356656E6465646F7265732E22646573636F6E746F22
      5D2B5B71727952656C61746F72696F50726F6475746F7356656E6465646F7265
      732E226372656469746F74726F6361225D2C56656E6461732C3029295D000000
      00FFFF0000000000020000000100000000090068656C76657469636100080000
      00020000000000010000001700020000000000FFFFFF00000000020000000000
      0000FEFEFF0E0000000A00204361626563616C686F000000000F0052415A414F
      46494C49414C42415345000000000F00454E44455245434F5F42414952524F00
      0000000D004345505F4349444144455F5546000000000600544954554C4F0001
      00300006004F5554524153000100300011004D4153434152415155414E544944
      41444500080027232323232323270012006E636D6973656E746F706973636F66
      696E7300050046616C7365000C00204167727570616D656E746F000000001200
      41677275706172477275706F46696C69616C00050046616C7365000D00416772
      7570617246696C69616C00050046616C73650010004167727570617244617461
      56656E646100050046616C7365000C0020544F54414C495A4143414F00000000
      0A00544F54414C474552414C00010030000000000000000000FC000000000000
      00000000000000000000580042C995683481E3404570D3100C22E640}
  end
  object frpRelatorioProdutosVendedores_SemValores_Modelo_Gama: TfrReport
    Dataset = fdsRelatorioProdutosVendedores
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit, pbPageSetup]
    ReportType = rtMultiple
    StoreInDFM = True
    RebuildPrinter = False
    OnBeforePrint = frpRelatorioProdutosVendedoresBeforePrint
    Left = 642
    Top = 494
    ReportForm = {
      190000003235000019FFFF00000A0050444643726561746F7200FFFFFFFFFF00
      000000340800009A0B0000000000002400000000000000120000000100040000
      0000FFFF000000000000000000000000030400466F726D00FEFFFFFFDC000000
      780000007C0100002C0100000405000500626567696E0D00000D1000544F5441
      4C474552414C203A3D20303B0D00000D0300656E64000200F700000009006662
      76526F6461706500020100000000CC0200002F0400000F000000300003000100
      0000000000000000FFFFFF1F00000000000000000000000000FFFF0000000000
      02000000010000000000000001000000C8000000140000000100000000000002
      00620100000B00506167654865616465723100020100000000480000002F0400
      004A0000003000020001000000000000000000FFFFFF1F000000000000000000
      00000000FFFF000000000002000000010000000000000001000000C800000014
      000000010000000000000200E6010000060056656E64617300020100000000CB
      0000002F0400000F0000003500050001000000000000000000FFFFFF1F000000
      001E0066647352656C61746F72696F50726F6475746F7356656E6465646F7265
      73000000000000000100000000000002000000010000000000000001000000C8
      000000140000000100000000000002005A020000140053756DE172696F446F20
      52656C6174F372696F31000201000000006C0100002F04000016000000300001
      0001000000000000000000FFFFFF1F00000000000000000000000000FFFF0000
      00000002000000010000000000000001000000C8000000140000000100000000
      00000200FA020000120043616265E7616C686F446520477275706F3100020100
      000000AC0000002F040000000000003000100001000000000000000000FFFFFF
      1F000000002E005B71727952656C61746F72696F50726F6475746F7356656E64
      65646F7265732E2276656E6465646F72225D20202000000000000000FFFF0000
      00000002000000010000000000000001000000C8000000140000000100000000
      00000200690300000F00526F646170E9446520477275706F3100020100000000
      F00000002F040000160000003000110001000000000000000000FFFFFF1F0000
      0000000000000000000000FFFF00000000000200000001000000000000000100
      0000C8000000140000000100000000000001008E1B000007006670764C6F676F
      0002001B00000048000000730000002700000005000000F40100000000000000
      00FFFFFF1F2C020000000000000000000000FFFF000000000002000000010000
      000601008E1B0000424DCE170000000000003604000028000000830000002600
      0000010008000000000098130000120B0000120B000000010000000100000000
      0000E8E5A800AA9E000099990000ADADAD003A3C4100A3970000BFB73700D8D4
      8600FBFAF000A5A5A5001E1D1C00D8D9DA0054575A00D6D6D500E7E8F2001216
      1B00B6AD1900CBC55B008C8D9200BEC0C500E1E2E40085878A005E606300494C
      4F00090D12002C2E3300DEDB98007D7F8100EFEDCB00B9BABB00AEA400007C7B
      7B00C5BE440066666600D1CC6F00CDC9810048484600F7F6E600AFA508000408
      0D00F9F8ED00B8AF2700DBD68C00999999001B1A1900C6BF5100131312003B3A
      3A00FFFFFF00EAE8BE00CCCCCC0023262A00E2DEA400F1EFD600B0B1B300D3CD
      7500B1A81000CCCC660072727200535252004342420001060A00ECE9C3008C8C
      8B00F5F4DF004A4A4A0057575600B6AC1F00282B3000C7C05C0061615F00F7F7
      F70088888700DDD89300E3E0A600FDFCF70021242900070A1000BDB53100C5BE
      4A00E3E3E200A69C000099999900BABAB900DEDEDE00525458002A292800D9D5
      8A005F5E5D00C7C595001B1E2300E8E5B60000000700B5AB1300D5D07B00C6C6
      C500B2A80B0021202000B9B12400504F4E00666666006B6D7000B5B5BD008484
      8400E0DC9E00BCB42C00F7EFD6005B5B5A00EFEFEF0087898B00DEDEE6003E3D
      3C0014181E00C8C25300CCC55F00A8A9AC00BDBDBC00E5E1AC0075767900181B
      2000E6E6E6000E1117000810190033333300929191002D2C2B00B5B5B4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131543D42470E313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31523131313131486D3131316D6D4C3131316D6D313131313131313131316D48
      31313131313131316D6D3131316D040A6C6C313131313131486D6D4C31313131
      31316D6D4C313131313131313131313131486D6D6D313131313131486D6D4831
      3131316D483131316D6D3131313131313131313131316D6D6D3131486D6D6D31
      313131313152313131317F7E6631554225256031603D42647931420C313B7D31
      6D6C3D70403131662C316D593D7068313133646C702531484255312C70643059
      313131310C2525420E31477431420E4825793131315442433D474C4C640E3120
      423C300A3131207E2C317F70254748484251512531603C316D59253C620A312C
      25433068313131313152313131316C2031315959313131317C7D4C4C31487C0E
      3159683177424C51347531434031203D487957543130494C7F3D31487C0C310B
      37317F70313131313C6631313131642C317C33487E51313131313179602F5531
      7C3331316D793B7031487E14314857043131316D7C55557E311E3031542D4C31
      4340313148790A0B4C313131315231313131477D313125306C64334C57793131
      31487C0E31224931422C31314340316C7D313C7D3131594931570C31543D3148
      7C0C3168705930253131313170706C3C0E313C0A313033317C513131310C7025
      70474C4C3033312C7C64300A3148300E31796243432248483051517C31603D31
      6D6464590B2C31547C42301C313131313152313131314749313166420C554831
      3D2C484831487C0E48302C311C4248516275316C7D31493D4879627F31256848
      373031487C0E3131550E207031313131473C0C554831642C4C7E330C62793131
      316830796D3131487C3331577D6D6D313148303331487C49555131487C0C0C7E
      4C2C703131480C0E7C2C313C476D6D31313131313152313131040B7E20316D47
      3C6C33310E3D3C6C7931254264646D31486C42706831316C7D31484742702031
      310E3D433D6C31484355314043473D0A31313131796C3C6C0E316670597E3C3D
      20313131310E256C6C7731316C0E312C3D47430431772F3D0A31334243664848
      25643C7E6C7C74316D225943425531543D59437D3131313131523131316D643B
      6D3131316D514831313179514C316D51793131313131796D3131313C40313131
      796D313131313179794831317F6D316D15154831313131313131795148314879
      516D796D3131313131313151517931317F6D31316D51516D3151577F6D313131
      797931316D51516D5148313131515151313131314851516D3131313131523131
      3131400431313131313131313131313131313131313131313131313131313168
      04313131313131313131313131313148660F3131313131313131313131313131
      3131313131313131313131313131313131313131220E31313131313131316655
      3131313131313131313131313131313131313131313131313131313131313131
      3152313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131313131313131315C46121212463F3131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131523131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131315F06020202061B31
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131523131313131310E40173C18183D6E3131313131310C2C
      666C3C181818181805683131313131316D3768220D0516313131313108021F1F
      1F5235313131313172070707070707070707070707070750732B363131313131
      3131313131362B73212112081D31313131313131313123505050504B31313131
      31313131313F08122E505050085231313131312C103E191919195D1731313131
      7966713E4E191919191919195D0D31313131312C342828191900173131313131
      08021F1F1F523531313131311152020202020202020202020202020202022776
      313131313131313F501F02020202020202075C313131313131316A060202065F
      313131313131314C120202020202020221523131313175287A78787878784E22
      3131310E1A3E10787871717171717171281731313131773E7A71717171282231
      3131313108021F1F1F5235313131313144021F1F1F1F1F1F1F1F1F1F1F1F1F1F
      1F1F1F1F1D31313131310802021F1F1F1F1F1F1F1F0202233131313131310702
      1F1F0208313131313131313A521F1F1F1F1F1F1F5052313131310D4E7878787A
      7A71282231316D7C4E7878784E4E7A717171717128173131312C3E7171717119
      195D22313131313108021F1F1F5269314C4C4C4C631F1F1F1F1F1F1F1F1F1F1F
      1F1F1F1F1F1F1F52503131313138521F1F1F0202020202021F1F1F5212313131
      313107021F1F0208313131313131361F1F1F1F1F0202020221523131316D457A
      78787A3D370E0E5131313B3E7878787A2274140E0E0E0E0E0E15313115787A78
      7871190D0A145A2A6A6A6A2A5F36363636365044111111113226262626262626
      262626262626264A1F1F1F1F612631311B521F1F1F02443A08082363021F1F1F
      525F3131313107021F1F02083131313131311B021F1F1F1F6A2B353532523131
      310E71717171710C313131313115781078784E68313131313131313131313131
      1C287878787A2C3131310106020202025F313131313150520202020236313131
      31313131313131313131313144021F1F1F32312639021F1F1F584C3131313131
      1B27021F1F1F3631313107021F1F020831313131313123021F1F1F1109313131
      3152313131337A717171454831313131312C28787810344C3131313131313131
      31313131057A78784E663131313135021F1F1F025F313131313150021F1F1F1F
      3631313131313131313131313131314C5E021F1F0276315F521F1F1F4B313131
      313131313132271F1F527331313107021F1F020831313131313112021F1F0272
      313131313152313131601978787A7C4C3131313131662878781045166E6E6E6E
      6E6E6E6E1C0431555B1078717A603131313135021F1F1F025F31313131315002
      1F1F1F1F36313131313131314C0909090909363A021F1F1F1F3F314F021F0272
      3131313131313131313123021F1F1109313107021F1F02083131313131312E02
      1F1F0273313131313152313131601978787A054C313131313156197878787128
      2828282828282828005631337A717171346D313131313552020202025F313131
      31312106020202023631313131762E635E61616161611F1F1F1F1F1F114C2661
      1F1F0276313131313131313131311D1F1F1F1F1D313107021F1F020831313131
      31312E021F1F023A313131313152313131601978787A054C3131313131181978
      7878787878787878787878784E1731141978787A454831313131764444444444
      241551515151464F4F4F4F4F413131313A0202021F1F1F1F1F1F1F1F1F1F1F52
      1B311D1F1F1F1F363131313131313131313126391F1F1F5C313107021F1F0208
      3131313131312E021F1F023A313131313152313131601978787A054C31313131
      315619787878787878787878787878784E1731337A717171346D313131313109
      090909097D713434347A37313131313131313158521F1F1F1F1F020202020202
      0202275831311D1F1F1F1F1D3131313131313131313126391F1F1F5C31310702
      1F1F02083131313131312E021F1F023A313131313152313131601978787A054C
      3131313131224E787878784E28282828282828280056310C787171715B0C3131
      3131313131313131133E1010105D74313131313131312939021F1F1F1F391163
      6363636A50083631313126611F1F024B313131313131313131313F021F1F1F36
      313107021F1F02083131313131312E021F1F023A313131313152313131601978
      787A054C313131313116287878101A2C2C2C2C2C2C2C2C2C7D1E316D1A7A7878
      197F31313131313131313131134E78787828743131313131313176021F1F1F1F
      23263131313131313131313131313107021F0221313131313131313131317302
      1F1F444C313107021F1F02083131313131312E021F1F023A3131313131523131
      31601978787A054C31313131317F197171713448313131313131313131313131
      561978784E6631313131313131313131134E7878782874313131313131312B52
      1F1F1F6129313131313131313131313131313158521F1F024A31313131313131
      317602021F522331313107021F1F02083131313131312E021F1F023A31313131
      3152313131331978787A053131313131316D347A78784E133131313131313131
      313131317D287878717104313131313131313131130019191900043131313131
      31312B521F1F1F274131313131313131313131313131310911021F1F1F232631
      313131295F1F1F1F1F612931313107021F1F022B3131313131312E021F1F5223
      3131313131520E14602C7A78787A7C141414140C3131203E78787171660A1E60
      14141414140E3131155B107878107A567D371E1E1E1E1E1E13566C6C6C182C75
      757575756D315C021F1F1F1F211B1B1B1B1B1B4A4A4A4A4A3631313176021F1F
      1F0261502323725E021F1F1F0258762B2B4A44021F1F1F504A4A4A2B1D312E02
      1F1F1F074A4A4A4A5C520D7A7A7A78787878787A7A7A5D173131794519787878
      4E4E7A7A7A7A7A7A5D6C313131165D7171717119191919191919195D6E313131
      313166007A7A7A4E1431295E021F1F1F0202020202020202020202062B313131
      315802021F1F1F020202021F1F1F1F52384C395252521F1F1F1F1F0202020206
      08312E021F1F1F1F0202020221521771717878787878787171714E2231313133
      5B28717878787871717171714E1731313131173E7A717878787878787878784E
      6E313131313166287171717A6031314A521F1F1F1F1F1F1F1F1F1F1F1F1F1F52
      4A31313131316939521F1F1F1F1F1F1F1F020258310911021F1F1F1F1F1F1F1F
      1F1F1F022B312E021F1F1F1F1F1F1F1F50520D19191978787878781919190017
      313131310C0D10284E4E191919191919000D31313131317D1A4E4E4E19191919
      191919001C3131313131662878787810603131315F0202020202020202020202
      020202062B31313131313136733902020202020261721D313129615252521F1F
      1F1F1F020202020608312E021F1F1F1F0202020221527D17173C107878714D17
      17170D2C3131313131310E0A1C3B2217171717170D7D31313131313148757D77
      661717171717170D0431313131316628787878106031313131364A3A72727272
      72727272727272505C3131313131313131264B5F737338354131313131093A72
      72725E1F1F1F1F4F1212122E5C312E021F1F1F631212121258523131310E1978
      787A053131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131313131313117003E3E3E5D7531313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313107021F1F52583131313131312E021F1F02233131313131523131
      31601978787A054C313131313131313131313131313131313131313131313131
      313131313131313131313131313131313131313131317F686E6E6E6E15313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313121021F1F02073131313131312E021F1F023A31313131
      3152313131601978787A054C3131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313173021F1F1F1F4F3A233A32312E021F1F023A
      313131313152313131601978787A054C31313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131313131313169521F1F1F1F0202020608312E02
      1F1F023A313131313152313131601978787A054C313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131313131313131310963521F1F1F1F1F1F02
      4A312E021F1F023A313131313152313131601971717A054C3131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131314150611F1F
      1F1F1F024A3150021F1F023A3131313131523131310C0D17176C774C31313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      315C3872727272725C31082E2E2E2E1B31313131315200001D1C00000900666D
      76546974756C6F0002006C01000048000000300200001200000043000000F401
      0000000000000000FFFFFF1F2C020000000000010009005B546974756C6F5D20
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      0B000000020000000000020000000000020000000000FFFFFF00000000020000
      00000000000000B41C00000700666D7644617461000200A40300004C0000005A
      0000000D00000043000000F4010000000000000000FFFFFF1F2C020000000000
      010013005B4441544520234464642F6D6D2F797979795D00000000FFFF000000
      0000020000000100000000090068656C76657469636100080000000000000000
      00010000000100020000000000FFFFFF0000000002000000000000000000411D
      00000900666D76506167696E61000200B40300005C0000004A0000000F000000
      43000000F4010000000000000000FFFFFF1F2C020000000000010007005B5041
      4745235D00000000FFFF0000000000020000000100000000090068656C766574
      6963610008000000000000000000010000000100020000000000FFFFFF000000
      0002000000000000000000D61D00000700666D76486F726100020024000000CC
      020000580000000A00000043000000F4010000000000000000FFFFFF1F2C0200
      00000000010011005B54494D4520235468683A6D6D3A73735D00000000FFFF00
      00000000020000000100000000090068656C7665746963610007000000000000
      000000100000000100020000000000FFFFFF0000000002000000000000000000
      831E00001000666D76446573656E766F6C7665646F7200020035030000CD0200
      00CC0000000A00000043000000F4010000000000000000FFFFFF1F2C02000000
      000001002000746563534F4654202D205465636E6F6C6F67696120656D205369
      7374656D617300000000FFFF0000000000020000000100000000090068656C76
      65746963610007000000000000000000110000000100020000000000FFFFFF00
      000000020000000000000000000E1F00000900666D764F75747261730002006C
      01000060000000310200001600000043000000F4010000000000000000FFFFFF
      1F2C020000000000010009005B4F75747261735D2000000000FFFF0000000000
      0200000001000000000500417269616C00070000000000000000000200000000
      00020000000000FFFFFF0000000002000000000000000000A31F000005004D65
      6D6F3900020064030000700100005C0000000D00000000000000010000000000
      00000000FFFFFF1F2C000000080064642F6D6D2F79790001000B00544F54414C
      20474552414C00000000FFFF0000000000020000000100000000090068656C76
      65746963610008000000020000000000010000000100020000000000FFFFFF00
      000000020000000000000000001221000006004D656D6F31300002001C010000
      CB0000007F0000000D00000060000000F4010000000000000000FFFFFF1F2C02
      00000000000100EC005B4946285B6E636D6973656E746F706973636F66696E73
      5D3D46616C73652C5B71727952656C61746F72696F50726F6475746F7356656E
      6465646F7265732E22636F6E747261746F225D2C5B71727952656C61746F7269
      6F50726F6475746F7356656E6465646F7265732E226E636D225D295D205B7172
      7952656C61746F72696F50726F6475746F7356656E6465646F7265732E227369
      74756163616F225D205B464F524D41544441544554494D45282764642F6D6D2F
      7979272C205B71727952656C61746F72696F50726F6475746F7356656E646564
      6F7265732E226661747572616D656E746F225D295D00000000FFFF0000000000
      020000000100000006090068656C766574696361000800000000000000000001
      0000000100020000000000FFFFFF000000000200000000000000000026220000
      06004D656D6F31330002009C010000CB000000350000000D0000002000000001
      000000000000000000FFFFFF1F2C020000000000010091005B71727952656C61
      746F72696F50726F6475746F7356656E6465646F7265732E227365726965225D
      20205B4946285B71727952656C61746F72696F50726F6475746F7356656E6465
      646F7265732E224E554D45524F4E4F5441225D3D302C27272C5B71727952656C
      61746F72696F50726F6475746F7356656E6465646F7265732E224E554D45524F
      4E4F5441225D295D2000000000FFFF0000000000020000000100000006090068
      656C7665746963610008000000000000000000010000000100020000000000FF
      FFFF0000000002000000000000000000DF23000006004D656D6F3135000200D3
      010000CB0000002C0000000D0000002000000001000000000000000000FFFFFF
      1F2C020000000000010036015B4946285B71727952656C61746F72696F50726F
      6475746F7356656E6465646F7265732E226D617175696E61225D3D302C27272C
      5B71727952656C61746F72696F50726F6475746F7356656E6465646F7265732E
      226D617175696E61225D295D2020205B4946285B71727952656C61746F72696F
      50726F6475746F7356656E6465646F7265732E22494E54455256454E53414F22
      5D3D302C27272C5B71727952656C61746F72696F50726F6475746F7356656E64
      65646F7265732E22494E54455256454E53414F225D295D20205B4946285B7172
      7952656C61746F72696F50726F6475746F7356656E6465646F7265732E224E55
      4D45524F4355504F4D225D3D302C27272C5B71727952656C61746F72696F5072
      6F6475746F7356656E6465646F7265732E224E554D45524F4355504F4D225D29
      5D2000000000FFFF0000000000020000000100000006090068656C7665746963
      610008000000000000000000010000000100020000000000FFFFFF0000000002
      000000000000000000BA24000006004D656D6F3136000200CA030000CB000000
      340000000D0000000000000001000000000000000000FFFFFF1F2C0000000800
      64642F6D6D2F797900010050005B466F726D6174466C6F6174285B4D61736361
      72615175616E7469646164655D2C5B71727952656C61746F72696F50726F6475
      746F7356656E6465646F7265732E227175616E746964616465225D295D000000
      00FFFF0000000000020000000100000006090068656C76657469636100080000
      00000000000000010000000100020000000000FFFFFF00000000020000000000
      000000007525000006004D656D6F31370002003C020000CB000000490000000D
      0000000000000001000000000000000000FFFFFF1F2C000000080064642F6D6D
      2F797900010030005B71727952656C61746F72696F50726F6475746F7356656E
      6465646F7265732E2270726F6475746F76697375616C225D00000000FFFF0000
      000000020000000100000006090068656C766574696361000800000000000000
      0000010000000100020000000000FFFFFF00000000020000000000000000002E
      26000006004D656D6F31380002008A020000CB000000140000000D0000000000
      000001000000000000000000FFFFFF1F2C000000080064642F6D6D2F79790001
      002E005B71727952656C61746F72696F50726F6475746F7356656E6465646F72
      65732E2266696C69616C76656E6461225D00000000FFFF000000000002000000
      0100000006090068656C76657469636100080000000000000000000200000001
      00020000000000FFFFFF0000000002000000000000000000E526000006004D65
      6D6F3139000200A0020000CB000000280100000D0000000B0000000100000000
      0000000000FFFFFF1F2C000000080064642F6D6D2F79790001002C005B717279
      52656C61746F72696F50726F6475746F7356656E6465646F7265732E22646573
      63726963616F225D00000000FFFF000000000002000000010000000609006865
      6C7665746963610008000000000000000000000000000100020000000000FFFF
      FF00000000020000000000000000008F27000006004D656D6F32310002001B00
      0000CB000000230000000D00000060000000F4010000000000000000FFFFFF1F
      2C02000000000001002B005B71727952656C61746F72696F50726F6475746F73
      56656E6465646F7265732E2276656E6465646F72225D00000000FFFF00000000
      000200000001000000060500417269616C000800000002000000000001000000
      0000020000000000FFFFFF00000000020000000000000000003D28000006004D
      656D6F32320002003E000000CB000000830000000D00000060000000F4010000
      000000000000FFFFFF1F2C02000000000001002F005B71727952656C61746F72
      696F50726F6475746F7356656E6465646F7265732E226E6F6D6576656E646564
      6F72225D00000000FFFF00000000000200000001000000060500417269616C00
      08000000020000000000000000000000020000000000FFFFFF00000000020000
      00000000000000D628000006004D656D6F323400020064030000F40000005C00
      00000D0000000000000001000000000000000000FFFFFF1F2C00000008006464
      2F6D6D2F79790001000E00544F54414C2056454E4445444F5200000000FFFF00
      00000000020000000100000000090068656C7665746963610008000000020000
      000000010000000100020000000000FFFFFF0000000002000000000000000000
      B029000006004D656D6F3235000200C6030000F4000000380000000D00000003
      00000001000000000000000000FFFFFF1F2C000000000000010057005B466F72
      6D6174466C6F6174285B4D6173636172615175616E7469646164655D2C5B5355
      4D285B71727952656C61746F72696F50726F6475746F7356656E6465646F7265
      732E227175616E746964616465225D295D295D00000000FFFF00000000000200
      00000100000000090068656C7665746963610008000000020000000000010000
      001700020000000000FFFFFF00000000020000000000000000008A2A00000600
      4D656D6F3236000200CA03000070010000340000000D00000043000000010000
      00000000000000FFFFFF1F2C020000000000010057005B466F726D6174466C6F
      6174285B4D6173636172615175616E7469646164655D2C5B53554D285B717279
      52656C61746F72696F50726F6475746F7356656E6465646F7265732E22717561
      6E746964616465225D295D295D00000000FFFF00000000000200000001000000
      00090068656C7665746963610008000000020000000000010000001700020000
      000000FFFFFF0000000002000000000000000000452B000007004D656D6F3135
      360002009000000048000000D70000002E0000004B000000F401000000000000
      0000FFFFFF1F2C020000000000030011005B52415A414F46494C49414C424153
      455D0D0F005B4345505F4349444144455F55465D0D11005B454E44455245434F
      5F42414952524F5D00000000FFFF000000000002000000010000000009006865
      6C7665746963610007000000000000000000000000000100020000000000FFFF
      FF0000000002000000000000000000CB2B000005004D656D6F380002009C0100
      0078000000320000001800000043000B00F4010000000000000000FFFFFF1F2C
      020000000000010004004E4F544100000000FFFF000000000002000000010000
      0000090068656C76657469636100070000000000000000000A00000001000200
      00000000FFFFFF0000000002000000000000000000562C000005004D656D6F35
      0002009C020000780000002F0100001800000043000A00F40100000000000000
      00FFFFFF1F2C02000000000001000900444553435249C7C34F00000000FFFF00
      00000000020000000100000000090068656C7665746963610007000000000000
      0000000A0000000100020000000000FFFFFF0000000002000000000000000000
      0B2D000006004D656D6F34360002001C01000078000000400000001800000043
      000A00F4010000000000000000FFFFFF1F2C020000000000010032005B494628
      5B6E636D6973656E746F706973636F66696E735D3D46616C73652C2027434F4E
      545241544F272C274E434D27295D00000000FFFF000000000002000000010000
      0000090068656C76657469636100070000000000000000000A00000001000200
      00000000FFFFFF0000000002000000000000000000952D000006004D656D6F35
      370002003C02000078000000490000001800000043000E00F401000000000000
      0000FFFFFF1F2C0200000000000100070050524F4455544F00000000FFFF0000
      000000020000000100000000090068656C766574696361000700000000000000
      00000A0000000100020000000000FFFFFF00000000020000000000000000001B
      2E000005004D656D6F320002005C01000078000000140000001800000043000E
      00F4010000000000000000FFFFFF1F2C020000000000010004005349542E0000
      0000FFFF0000000000020000000100000000090068656C766574696361000700
      00000000000000000A0000000100020000000000FFFFFF000000000200000000
      0000000000A32E000006004D656D6F3134000200CF0100007800000032000000
      1800000043000A00F4010000000000000000FFFFFF1F2C020000000000010005
      004355504F4D00000000FFFF0000000000020000000100000000090068656C76
      657469636100070000000000000000000A0000000100020000000000FFFFFF00
      00000002000000000000000000342F000005004D656D6F31000200FF01000078
      0000003D0000001800000043000F00F4010000000000000000FFFFFF1F2C0200
      0000000001000F0050524F4455544F20434C49454E544500000000FFFF000000
      0000020000000100000000090068656C76657469636100070000000000000000
      000A0000000100020000000000FFFFFF0000000002000000000000000000BC2F
      000005004D656D6F33000200C1000000780000005C0000001800000043000B00
      F4010000000000000000FFFFFF1F2C0200000000000100060050454449444F00
      000000FFFF0000000000020000000100000000090068656C7665746963610007
      0000000000000000000A0000000100020000000000FFFFFF0000000002000000
      0000000000004130000005004D656D6F34000200850200007800000019000000
      1800000043000F00F4010000000000000000FFFFFF1F2C020000000000010003
      0046494C00000000FFFF0000000000020000000100000000090068656C766574
      69636100070000000000000000000A0000000100020000000000FFFFFF000000
      0002000000000000000000C830000006004D656D6F3131000200CB0300007800
      0000330000001800000043000F00F4010000000000000000FFFFFF1F2C020000
      000000010004005154444500000000FFFF000000000002000000010000000009
      0068656C76657469636100070000000000000000000A00000001000200000000
      00FFFFFF00000000020000000000000000005331000006004D656D6F32380002
      003E00000078000000840000001800000043000F00F4010000000000000000FF
      FFFF1F2C0200000000000100080056454E4445444F5200000000FFFF00000000
      00020000000100000000090068656C7665746963610007000000000000000000
      0A0000000100020000000000FFFFFF0000000002000000000000000000E13100
      0006004D656D6F32390002006D010000780000002E0000001800000043000F00
      F4010000000000000000FFFFFF1F2C02000000000001000B0044415441204641
      5455524100000000FFFF0000000000020000000100000000090068656C766574
      69636100070000000000000000000A0000000100020000000000FFFFFF000000
      00020000000000000000006832000006004D656D6F33300002001B0000007800
      0000230000001800000043000F00F4010000000000000000FFFFFF1F2C020000
      0000000100040043D3442E00000000FFFF000000000002000000010000000009
      0068656C76657469636100070000000000000000000A00000001000200000000
      00FFFFFF00000000020000000000000000001B33000006004D656D6F33320002
      00C1000000CB000000570000000D00000060000000F4010000000000000000FF
      FFFF1F2C020000000000010030005B71727952656C61746F72696F50726F6475
      746F7356656E6465646F7265732E2270656469646F636C69656E7465225D0000
      0000FFFF0000000000020000000100000006090068656C766574696361000800
      0000000000000000010000000100020000000000FFFFFF000000000200000000
      0000000000D833000006004D656D6F3333000200FF010000CB0000003C000000
      0D0000000000000001000000000000000000FFFFFF1F2C000000080064642F6D
      6D2F797900010032005B71727952656C61746F72696F50726F6475746F735665
      6E6465646F7265732E2270726F6475746F5F636C69656E7465225D00000000FF
      FF0000000000020000000100000006090068656C766574696361000800000000
      0000000000000000000100020000000000FFFFFF000000000200000000000000
      FEFEFF0E0000000A00204361626563616C686F000000000F0052415A414F4649
      4C49414C42415345000000000F00454E44455245434F5F42414952524F000000
      000D004345505F4349444144455F5546000000000600544954554C4F00010030
      0006004F5554524153000100300011004D4153434152415155414E5449444144
      4500080027232323232323270012006E636D6973656E746F706973636F66696E
      7300050046616C7365000C00204167727570616D656E746F0000000012004167
      7275706172477275706F46696C69616C00050046616C7365000D004167727570
      617246696C69616C00050046616C736500100041677275706172446174615665
      6E646100050046616C7365000C0020544F54414C495A4143414F000000000A00
      544F54414C474552414C00010030000000000000000000FC0000000000000000
      0000000000000000580042C995683481E3404570D3100C22E640}
  end
  object frpRelatorioProdutosClientes: TfrReport
    Dataset = fdsRelatorioProdutosClientes_
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnBeforePrint = frpRelatorioProdutosClientes_BeforePrint
    Left = 319
    Top = 400
    ReportForm = {
      19000000D958000019FFFF00000A0050444643726561746F7200FFFFFFFFFF00
      000000340800009A0B0000040000002400000004000000120000000100040000
      0000FFFF000000000000000000000000030400466F726D00FEFFFFFFDC000000
      780000007C0100002C0100000408000500626567696E0D17002020544F54414C
      50524F4455544F532020203A3D20303B0D1B002020544F54414C474552414C20
      2020202020202020203A3D20303B0D17002020544F54414C50524F434C49454E
      5445203A3D20303B0D0D002020434F554E54203A3D20303B0D17002020544F54
      414C505245434F5041555441203A3D20303B0D17002020544F54414C50524543
      4F56454E4441203A3D20303B0D0300656E6400FFFFFFFFFF0000000034080000
      9A0B00000000000000000000000000000000000001000400000000FFFF000000
      000000000000000000030400466F726D00FEFFFFFFDC000000780000007C0100
      002C010000040000000200CA0100000900666276526F64617065000201000000
      00CC0200002F0400000F0000003000030001000000000000000000FFFFFF1F00
      000000000000000000000000FFFF000000000002000000010000000000000001
      000000C800000014000000010000000000000200350200000B00506167654865
      616465723100020100000000480000002F0400004A0000003000020001000000
      000000000000FFFFFF1F00000000000000000000000000FFFF00000000000200
      0000010000000000000001000000C800000014000000010000000000000200DB
      020000060056656E64617300020100000000C30000002F0400005E0000003000
      050001000000000000000000FFFFFF1F000000001200666473456E6465726563
      6F436C69656E74650000000003000500626567696E0D1800202020544F54414C
      50524F434C49454E5445203A3D20303B0D0300656E6400010000000000000200
      00000100000000060046696C6861310001000000C80000001400000001000000
      000000020041030000060046696C68613100020100000000440100002F040000
      0A0000003000150001000000000000000000FFFFFF1F00000000000000000000
      000000FFFF000000000002000000010000000000000001000000C80000001400
      0000010000000000000200B5030000140053756DE172696F446F2052656C6174
      F372696F31000201000000006C0100002F0400002E0000003000010001000000
      000000000000FFFFFF1F00000000000000000000000000FFFF00000000000200
      0000010000000000000001000000C800000014000000010000000000000100DA
      1B000007006670764C6F676F0002000800000048000000730000002700000005
      000000F4010000000000000000FFFFFF1F2C020000000000000000000000FFFF
      00000000000200000001000000060100DA1B0000424DCE170000000000003604
      0000280000008300000026000000010008000000000098130000120B0000120B
      0000000100000001000000000000E8E5A800AA9E000099990000ADADAD003A3C
      4100A3970000BFB73700D8D48600FBFAF000A5A5A5001E1D1C00D8D9DA005457
      5A00D6D6D500E7E8F20012161B00B6AD1900CBC55B008C8D9200BEC0C500E1E2
      E40085878A005E606300494C4F00090D12002C2E3300DEDB98007D7F8100EFED
      CB00B9BABB00AEA400007C7B7B00C5BE440066666600D1CC6F00CDC981004848
      4600F7F6E600AFA5080004080D00F9F8ED00B8AF2700DBD68C00999999001B1A
      1900C6BF5100131312003B3A3A00FFFFFF00EAE8BE00CCCCCC0023262A00E2DE
      A400F1EFD600B0B1B300D3CD7500B1A81000CCCC660072727200535252004342
      420001060A00ECE9C3008C8C8B00F5F4DF004A4A4A0057575600B6AC1F00282B
      3000C7C05C0061615F00F7F7F70088888700DDD89300E3E0A600FDFCF7002124
      2900070A1000BDB53100C5BE4A00E3E3E200A69C000099999900BABAB900DEDE
      DE00525458002A292800D9D58A005F5E5D00C7C595001B1E2300E8E5B6000000
      0700B5AB1300D5D07B00C6C6C500B2A80B0021202000B9B12400504F4E006666
      66006B6D7000B5B5BD0084848400E0DC9E00BCB42C00F7EFD6005B5B5A00EFEF
      EF0087898B00DEDEE6003E3D3C0014181E00C8C25300CCC55F00A8A9AC00BDBD
      BC00E5E1AC0075767900181B2000E6E6E6000E11170008101900333333009291
      91002D2C2B00B5B5B40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000031313131313131313131313131313131313131313131
      313131313131313131313131313131313131313131543D42470E313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131523131313131486D3131316D6D4C3131316D6D
      313131313131313131316D4831313131313131316D6D3131316D040A6C6C3131
      31313131486D6D4C3131313131316D6D4C313131313131313131313131486D6D
      6D313131313131486D6D48313131316D483131316D6D31313131313131313131
      31316D6D6D3131486D6D6D31313131313152313131317F7E6631554225256031
      603D42647931420C313B7D316D6C3D70403131662C316D593D7068313133646C
      702531484255312C70643059313131310C2525420E31477431420E4825793131
      315442433D474C4C640E3120423C300A3131207E2C317F702547484842515125
      31603C316D59253C620A312C25433068313131313152313131316C2031315959
      313131317C7D4C4C31487C0E3159683177424C51347531434031203D48795754
      3130494C7F3D31487C0C310B37317F70313131313C6631313131642C317C3348
      7E51313131313179602F55317C3331316D793B7031487E14314857043131316D
      7C55557E311E3031542D4C314340313148790A0B4C313131315231313131477D
      313125306C64334C5779313131487C0E31224931422C31314340316C7D313C7D
      3131594931570C31543D31487C0C3168705930253131313170706C3C0E313C0A
      313033317C513131310C702570474C4C3033312C7C64300A3148300E31796243
      432248483051517C31603D316D6464590B2C31547C42301C3131313131523131
      31314749313166420C5548313D2C484831487C0E48302C311C4248516275316C
      7D31493D4879627F31256848373031487C0E3131550E207031313131473C0C55
      4831642C4C7E330C62793131316830796D3131487C3331577D6D6D3131483033
      31487C49555131487C0C0C7E4C2C703131480C0E7C2C313C476D6D3131313131
      3152313131040B7E20316D473C6C33310E3D3C6C7931254264646D31486C4270
      6831316C7D31484742702031310E3D433D6C31484355314043473D0A31313131
      796C3C6C0E316670597E3C3D20313131310E256C6C7731316C0E312C3D474304
      31772F3D0A3133424366484825643C7E6C7C74316D225943425531543D59437D
      3131313131523131316D643B6D3131316D514831313179514C316D5179313131
      3131796D3131313C40313131796D313131313179794831317F6D316D15154831
      313131313131795148314879516D796D3131313131313151517931317F6D3131
      6D51516D3151577F6D313131797931316D51516D514831313151515131313131
      4851516D31313131315231313131400431313131313131313131313131313131
      31313131313131313131316804313131313131313131313131313148660F3131
      3131313131313131313131313131313131313131313131313131313131313131
      220E313131313131313166553131313131313131313131313131313131313131
      3131313131313131313131313152313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      5C46121212463F31313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131523131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131315F06020202061B313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131313131313131523131313131310E40173C
      18183D6E3131313131310C2C666C3C181818181805683131313131316D376822
      0D0516313131313108021F1F1F52353131313131720707070707070707070707
      07070750732B3631313131313131313131362B73212112081D31313131313131
      313123505050504B3131313131313131313F08122E505050085231313131312C
      103E191919195D17313131317966713E4E191919191919195D0D31313131312C
      34282819190017313131313108021F1F1F523531313131311152020202020202
      020202020202020202022776313131313131313F501F02020202020202075C31
      3131313131316A060202065F313131313131314C120202020202020221523131
      313175287A78787878784E223131310E1A3E1078787171717171717128173131
      3131773E7A717171712822313131313108021F1F1F5235313131313144021F1F
      1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1D31313131310802021F1F1F1F1F1F1F
      1F02022331313131313107021F1F0208313131313131313A521F1F1F1F1F1F1F
      5052313131310D4E7878787A7A71282231316D7C4E7878784E4E7A7171717171
      28173131312C3E7171717119195D22313131313108021F1F1F5269314C4C4C4C
      631F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F52503131313138521F1F1F0202
      020202021F1F1F5212313131313107021F1F0208313131313131361F1F1F1F1F
      0202020221523131316D457A78787A3D370E0E5131313B3E7878787A2274140E
      0E0E0E0E0E15313115787A787871190D0A145A2A6A6A6A2A5F36363636365044
      111111113226262626262626262626262626264A1F1F1F1F612631311B521F1F
      1F02443A08082363021F1F1F525F3131313107021F1F02083131313131311B02
      1F1F1F1F6A2B353532523131310E71717171710C313131313115781078784E68
      3131313131313131313131311C287878787A2C3131310106020202025F313131
      31315052020202023631313131313131313131313131313144021F1F1F323126
      39021F1F1F584C31313131311B27021F1F1F3631313107021F1F020831313131
      313123021F1F1F11093131313152313131337A717171454831313131312C2878
      7810344C313131313131313131313131057A78784E663131313135021F1F1F02
      5F313131313150021F1F1F1F3631313131313131313131313131314C5E021F1F
      0276315F521F1F1F4B313131313131313132271F1F527331313107021F1F0208
      31313131313112021F1F0272313131313152313131601978787A7C4C31313131
      31662878781045166E6E6E6E6E6E6E6E1C0431555B1078717A60313131313502
      1F1F1F025F313131313150021F1F1F1F36313131313131314C0909090909363A
      021F1F1F1F3F314F021F02723131313131313131313123021F1F110931310702
      1F1F02083131313131312E021F1F0273313131313152313131601978787A054C
      3131313131561978787871282828282828282828005631337A717171346D3131
      31313552020202025F31313131312106020202023631313131762E635E616161
      61611F1F1F1F1F1F114C26611F1F0276313131313131313131311D1F1F1F1F1D
      313107021F1F02083131313131312E021F1F023A313131313152313131601978
      787A054C31313131311819787878787878787878787878784E1731141978787A
      454831313131764444444444241551515151464F4F4F4F4F413131313A020202
      1F1F1F1F1F1F1F1F1F1F1F521B311D1F1F1F1F36313131313131313131312639
      1F1F1F5C313107021F1F02083131313131312E021F1F023A3131313131523131
      31601978787A054C31313131315619787878787878787878787878784E173133
      7A717171346D313131313109090909097D713434347A37313131313131313158
      521F1F1F1F1F0202020202020202275831311D1F1F1F1F1D3131313131313131
      313126391F1F1F5C313107021F1F02083131313131312E021F1F023A31313131
      3152313131601978787A054C3131313131224E787878784E2828282828282828
      0056310C787171715B0C31313131313131313131133E1010105D743131313131
      31312939021F1F1F1F3911636363636A50083631313126611F1F024B31313131
      3131313131313F021F1F1F36313107021F1F02083131313131312E021F1F023A
      313131313152313131601978787A054C313131313116287878101A2C2C2C2C2C
      2C2C2C2C7D1E316D1A7A7878197F31313131313131313131134E787878287431
      31313131313176021F1F1F1F23263131313131313131313131313107021F0221
      3131313131313131313173021F1F444C313107021F1F02083131313131312E02
      1F1F023A313131313152313131601978787A054C31313131317F197171713448
      313131313131313131313131561978784E6631313131313131313131134E7878
      782874313131313131312B521F1F1F6129313131313131313131313131313158
      521F1F024A31313131313131317602021F522331313107021F1F020831313131
      31312E021F1F023A313131313152313131331978787A053131313131316D347A
      78784E133131313131313131313131317D287878717104313131313131313131
      13001919190004313131313131312B521F1F1F27413131313131313131313131
      3131310911021F1F1F232631313131295F1F1F1F1F612931313107021F1F022B
      3131313131312E021F1F52233131313131520E14602C7A78787A7C141414140C
      3131203E78787171660A1E6014141414140E3131155B107878107A567D371E1E
      1E1E1E1E13566C6C6C182C75757575756D315C021F1F1F1F211B1B1B1B1B1B4A
      4A4A4A4A3631313176021F1F1F0261502323725E021F1F1F0258762B2B4A4402
      1F1F1F504A4A4A2B1D312E021F1F1F074A4A4A4A5C520D7A7A7A78787878787A
      7A7A5D1731317945197878784E4E7A7A7A7A7A7A5D6C313131165D7171717119
      191919191919195D6E313131313166007A7A7A4E1431295E021F1F1F02020202
      02020202020202062B313131315802021F1F1F020202021F1F1F1F52384C3952
      52521F1F1F1F1F020202020608312E021F1F1F1F020202022152177171787878
      7878787171714E22313131335B28717878787871717171714E1731313131173E
      7A717878787878787878784E6E313131313166287171717A6031314A521F1F1F
      1F1F1F1F1F1F1F1F1F1F1F524A31313131316939521F1F1F1F1F1F1F1F020258
      310911021F1F1F1F1F1F1F1F1F1F1F022B312E021F1F1F1F1F1F1F1F50520D19
      191978787878781919190017313131310C0D10284E4E191919191919000D3131
      3131317D1A4E4E4E19191919191919001C313131313166287878781060313131
      5F0202020202020202020202020202062B313131313131367339020202020202
      61721D313129615252521F1F1F1F1F020202020608312E021F1F1F1F02020202
      21527D17173C107878714D1717170D2C3131313131310E0A1C3B221717171717
      0D7D31313131313148757D77661717171717170D043131313131662878787810
      6031313131364A3A7272727272727272727272505C3131313131313131264B5F
      737338354131313131093A7272725E1F1F1F1F4F1212122E5C312E021F1F1F63
      1212121258523131310E1978787A053131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131311700
      3E3E3E5D75313131313131313131313131313131313131313131313131313131
      31313131313131313131313131313131313107021F1F52583131313131312E02
      1F1F0223313131313152313131601978787A054C313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31317F686E6E6E6E153131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313121021F1F020731313131
      31312E021F1F023A313131313152313131601978787A054C3131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131313131313131313131313173021F1F1F1F
      4F3A233A32312E021F1F023A313131313152313131601978787A054C31313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131316952
      1F1F1F1F0202020608312E021F1F023A313131313152313131601978787A054C
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31310963521F1F1F1F1F1F024A312E021F1F023A313131313152313131601971
      717A054C31313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131314150611F1F1F1F1F024A3150021F1F023A3131313131523131
      310C0D17176C774C313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131315C3872727272725C31082E2E2E2E1B31313131
      31520000691C00000900666D76546974756C6F000200720100004C0000004002
      00001200000043000000F4010000000000000000FFFFFF1F2C02000000000001
      0009005B546974756C6F5D2000000000FFFF0000000000020000000100000000
      090068656C766574696361000B00000002000000000002000000000002000000
      0000FFFFFF0000000002000000000000000000001D00000700666D7644617461
      000200CB0300004C0000005A0000000D00000043000000F40100000000000000
      00FFFFFF1F2C020000000000010013005B4441544520234464642F6D6D2F7979
      79795D00000000FFFF0000000000020000000100000000090068656C76657469
      63610008000000000000000000010000000100020000000000FFFFFF00000000
      020000000000000000008D1D00000900666D76506167696E61000200DB030000
      5C0000004A0000000F00000043000000F4010000000000000000FFFFFF1F2C02
      0000000000010007005B50414745235D00000000FFFF00000000000200000001
      00000000090068656C7665746963610008000000000000000000010000000100
      020000000000FFFFFF0000000002000000000000000000221E00000700666D76
      486F726100020024000000CC020000580000000A00000043000000F401000000
      0000000000FFFFFF1F2C020000000000010011005B54494D4520235468683A6D
      6D3A73735D00000000FFFF0000000000020000000100000000090068656C7665
      746963610007000000000000000000100000000100020000000000FFFFFF0000
      000002000000000000000000CF1E00001000666D76446573656E766F6C766564
      6F7200020038030000CD020000CC0000000A00000043000000F4010000000000
      000000FFFFFF1F2C02000000000001002000746563534F4654202D205465636E
      6F6C6F67696120656D2053697374656D617300000000FFFF0000000000020000
      000100000000090068656C766574696361000700000000000000000011000000
      0100020000000000FFFFFF00000000020000000000000000005A1F0000090066
      6D764F75747261730002007201000060000000410200001600000043000000F4
      010000000000000000FFFFFF1F2C020000000000010009005B4F75747261735D
      2000000000FFFF00000000000200000001000000000500417269616C00070000
      00000000000000020000000000020000000000FFFFFF00000000020000000000
      00000000E51F000005004D656D6F35000200C0010000780000009D0000001800
      000043000A00F4010000000000000000FFFFFF1F2C0200000000000100090044
      4553435249C7C34F00000000FFFF000000000002000000010000000009006865
      6C76657469636100070000000000000000000A0000000100020000000000FFFF
      FF00000000020000000000000000008A20000006004D656D6F32300002000700
      0000C3000000AF0000000D00000060000000F4010000000000000000FFFFFF1F
      2C020000000000010022005B717279456E64657265636F436C69656E74652E22
      6E6F6D65636C69656E7465225D00000000FFFF00000000000200000001000000
      06090068656C7665746963610008000000000000000000000000000100020000
      000000FFFFFF00000000020000000000000000003F21000006004D656D6F3436
      000200AE00000078000000470000001800000043000A00F40100000000000000
      00FFFFFF1F2C020000000000010032005B4946285B6E636D6973656E746F7069
      73636F66696E735D3D46616C73652C2027434F4E545241544F272C274E434D27
      295D00000000FFFF0000000000020000000100000000090068656C7665746963
      6100070000000000000000000A0000000100020000000000FFFFFF0000000002
      000000000000000000D321000006004D656D6F35370002007801000078000000
      390000001800000043000E00F4010000000000000000FFFFFF1F2C0200000000
      000200070050524F4455544F0D07005345525649C74F00000000FFFF00000000
      00020000000100000000090068656C7665746963610007000000000000000000
      0A0000000100020000000000FFFFFF00000000020000000000000003002B2200
      000A005375625265706F727431000200B8000000C3000000CC02000012000000
      0100000001000000000000000000FFFFFF1F2C020000000000000000000000FF
      FF00000000000200000001000000000100000000004723000006004D656D6F31
      3000020007000000F8000000D70100002200000043000000F401000000000000
      0000FFFFFF1F2C02000000000003001A005B717279456E64657265636F436C69
      656E74652E22727561225D0D250042414952524F3A205B717279456E64657265
      636F436C69656E74652E2262616972726F225D0D54005B464F524D4154544558
      54282723232E2323232D232323272C205B717279456E64657265636F436C6965
      6E74652E22636570225D295D205B717279456E64657265636F436C69656E7465
      2E22636964616465225D00000000FFFF00000000000200000001000000000900
      68656C7665746963610007000000000000000000000000000100020000000000
      FFFFFF0000000002000000000000000000F223000006004D656D6F3231000200
      07000000DD000000B30000000D00000040000000F4010000000000000000FFFF
      FF1F2C020000000000010028004350463A205B717279456E64657265636F436C
      69656E74652E22706573736F616E756D65726F225D00000000FFFF0000000000
      020000000100000000090068656C766574696361000800000000000000000000
      0000000100020000000000FFFFFF000000000200000000000000040041240000
      05004C696E6531000200070000004E0100001E04000000000000010008006400
      0000000000000000FFFFFF1F2C020000000000000000000000FFFF0000000000
      0200000001000000000000D624000005004D656D6F39000200F0010000700100
      005C0000000D0000000000000001000000000000000000FFFFFF1F2C00000008
      0064642F6D6D2F79790001000B00544F54414C20474552414C00000000FFFF00
      00000000020000000100000000090068656C7665746963610008000000020000
      000000010000000100020000000000FFFFFF0000000002000000000000000000
      7A25000006004D656D6F313600020007000000EB000000B30000000D00000048
      000000F4010000000000000000FFFFFF1F2C02000000000001002100464F4E45
      3A205B717279456E64657265636F436C69656E74652E22666F6E65225D000000
      00FFFF0000000000020000000100000000090068656C76657469636100080000
      00000000000000000000000100020000000000FFFFFF00000000020000000000
      00000000FF25000005004D656D6F34000200B001000078000000110000001800
      000043000F00F4010000000000000000FFFFFF1F2C0200000000000100030046
      494C00000000FFFF0000000000020000000100000000090068656C7665746963
      6100070000000000000000000A0000000100020000000000FFFFFF0000000002
      0000000000000000008826000006004D656D6F31380002008703000078000000
      2E0000001800000043000E00F4010000000000000000FFFFFF1F2C0200000000
      000100060044455343544F00000000FFFF000000000002000000010000000009
      0068656C76657469636100070000000000000000000A00000001000200000000
      00FFFFFF00000000020000000000000000000E27000005004D656D6F33000200
      5D020000780000001F0000001800000043000E00F4010000000000000000FFFF
      FF1F2C020000000000010004005154444500000000FFFF000000000002000000
      0100000000090068656C76657469636100070000000000000000000A00000001
      00020000000000FFFFFF00000000020000000000000000009927000006004D65
      6D6F32330002007C02000084000000370000000C00000043000E00F401000000
      0000000000FFFFFF1F2C02000000000001000800554E4954C152494F00000000
      FFFF0000000000020000000100000000090068656C7665746963610007000000
      0000000000000A0000000100020000000000FFFFFF0000000002000000000000
      0000002128000006004D656D6F3132000200B202000084000000390000000C00
      000043000F00F4010000000000000000FFFFFF1F2C0200000000000100050054
      4F54414C00000000FFFF0000000000020000000100000000090068656C766574
      69636100070000000000000000000A0000000100020000000000FFFFFF000000
      0002000000000000000000AA28000005004D656D6F3100020007000000780000
      00AC0000001800000043000F00F4010000000000000000FFFFFF1F2C02000000
      000001000700434C49454E544500000000FFFF00000000000200000001000000
      00090068656C76657469636100070000000000000000000A0000000100020000
      000000FFFFFF00000000020000000000000000003229000005004D656D6F3700
      02000501000078000000320000001800000043000A00F4010000000000000000
      FFFFFF1F2C0200000000000100060046415455524100000000FFFF0000000000
      020000000100000000090068656C76657469636100070000000000000000000A
      0000000100020000000000FFFFFF0000000002000000000000000000ED290000
      07004D656D6F3135360002007E00000048000000D70000002E0000004B000000
      F4010000000000000000FFFFFF1F2C020000000000030011005B52415A414F46
      494C49414C424153455D0D0F005B4345505F4349444144455F55465D0D11005B
      454E44455245434F5F42414952524F5D00000000FFFF00000000000200000001
      00000000090068656C7665746963610007000000000000000000000000000100
      020000000000FFFFFF0000000002000000000000000000732A000005004D656D
      6F32000200F400000078000000130000001800000043000B00F4010000000000
      000000FFFFFF1F2C020000000000010004005349542E00000000FFFF00000000
      00020000000100000000090068656C7665746963610007000000000000000000
      0A0000000100020000000000FFFFFF0000000002000000000000000000FF2A00
      0005004D656D6F380002003701000078000000410000001800000043000F00F4
      010000000000000000FFFFFF1F2C02000000000001000A004E4F54412F435550
      4F4D00000000FFFF0000000000020000000100000000090068656C7665746963
      6100070000000000000000000A0000000100020000000000FFFFFF0000000002
      0000000000000000008A2B000006004D656D6F3232000200EB02000084000000
      370000000C00000043000E00F4010000000000000000FFFFFF1F2C0200000000
      0001000800554E4954C152494F00000000FFFF00000000000200000001000000
      00090068656C76657469636100070000000000000000000A0000000100020000
      000000FFFFFF00000000020000000000000000001B2C000006004D656D6F3336
      0002007C020000780000006F0000000C00000043000E00F40100000000000000
      00FFFFFF1F2C02000000000001000E00505245C74F2044452050415554410000
      0000FFFF0000000000020000000100000000090068656C766574696361000700
      00000000000000000A0000000100020000000000FFFFFF000000000200000000
      0000000000AC2C000006004D656D6F3337000200EB020000780000006F000000
      0C00000043000F00F4010000000000000000FFFFFF1F2C02000000000001000E
      00505245C74F2044452056454E444100000000FFFF0000000000020000000100
      000000090068656C76657469636100070000000000000000000A000000010002
      0000000000FFFFFF00000000020000000000000000003B2D000006004D656D6F
      33380002005A030000780000002D0000001800000043000F00F4010000000000
      000000FFFFFF1F2C02000000000002000400444946450D050052454EC7410000
      0000FFFF0000000000020000000100000000090068656C766574696361000700
      00000000000000000A0000000100020000000000FFFFFF000000000200000000
      0000000000C32D000006004D656D6F3234000200210300008400000039000000
      0C00000043000F00F4010000000000000000FFFFFF1F2C020000000000010005
      00544F54414C00000000FFFF0000000000020000000100000000090068656C76
      657469636100070000000000000000000A0000000100020000000000FFFFFF00
      000000020000000000000000007D2E000005004D656D6F360002000703000070
      010000540000000D00000000000000F0030000000000000000FFFFFF1F2C0000
      00080064642F6D6D2F797900010030005B464F524D4154464C4F415428272323
      232C2323232C2323302E3030272C20544F54414C505245434F56454E4441295D
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      07000000020000000000010000001700020000000000FFFFFF00000000020000
      00000000000000B82F000006004D656D6F31310002004D030000700100003C00
      00000D00000000000000F0030000000000000000FFFFFF1F2C00000008006464
      2F6D6D2F7979000100B0005B494628285B544F54414C505245434F56454E4441
      3E3D544F54414C505245434F50415554415D292C5B464F524D4154464C4F4154
      28272323232C2323232C2323302E3030272C205B544F54414C505245434F5645
      4E44412D544F54414C505245434F50415554415D295D2C5B464F524D4154464C
      4F415428272323232C2323232C2323302E3030272C205B544F54414C50524543
      4F56454E44412D544F54414C505245434F50415554415D295D295D00000000FF
      FF0000000000020000000100000000090068656C766574696361000700000002
      0000000000010000001700020000000000FFFFFF000000000200000000000000
      00007330000006004D656D6F31340002009802000070010000540000000D0000
      0000000000F0030000000000000000FFFFFF1F2C000000080064642F6D6D2F79
      7900010030005B464F524D4154464C4F415428272323232C2323232C2323302E
      3030272C20544F54414C505245434F5041555441295D00000000FFFF00000000
      00020000000100000000090068656C7665746963610007000000020000000000
      010000001700020000000000FFFFFF00000000020000000000000000002D3100
      0006004D656D6F34310002007A03000070010000400000000D00000000000000
      F0030000000000000000FFFFFF1F2C000000080064642F6D6D2F79790001002F
      005B464F524D4154464C4F415428272323232C2323232C2323302E3030272C20
      544F54414C444553434F4E544F53295D00000000FFFF00000000000200000001
      00000000090068656C7665746963610007000000020000000000010000001700
      020000000000FFFFFF0000000002000000000000000000FD31000006004D656D
      6F343200020007000000CF000000AF0000000D00000060000000F40100000000
      00000000FFFFFF1F2C02000000000001004D0043D34449474F3A205B71727945
      6E64657265636F436C69656E74652E227469706F636C69656E7465225D5B272D
      275D5B717279456E64657265636F436C69656E74652E22636C69656E7465225D
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      08000000000000000000000000000100020000000000FFFFFF00000000020000
      000000000000008732000006004D656D6F3433000200B6030000780000003A00
      00001800000043000F00F4010000000000000000FFFFFF1F2C02000000000001
      0007004CCD515549444F00000000FFFF00000000000200000001000000000900
      68656C76657469636100070000000000000000000A0000000100020000000000
      FFFFFF00000000020000000000000000005133000006004D656D6F3437000200
      AD03000070010000440000000D00000000000000F0030000000000000000FFFF
      FF1F2C000000080064642F6D6D2F79790001003F005B464F524D4154464C4F41
      5428272323232C2323232C2323302E3030272C20544F54414C505245434F5645
      4E44412B544F54414C444553434F4E544F53295D00000000FFFF000000000002
      0000000100000000090068656C76657469636100070000000200000000000100
      00001700020000000000FFFFFF0000000002000000000000000000E833000006
      004D656D6F3438000200F003000078000000360000001800000043000F00F401
      0000000000000000FFFFFF1F2C02000000000002000A0044C94249544F206F75
      200D07004352C94449544F00000000FFFF000000000002000000010000000009
      0068656C76657469636100070000000000000000000A00000001000200000000
      00FFFFFF0000000002000000000000000000A534000006004D656D6F35310002
      00E303000070010000440000000D00000000000000F0030000000000000000FF
      FFFF1F2C000000080064642F6D6D2F797900010032005B464F524D4154464C4F
      415428272323232C2323232C2323302E3030272C20544F54414C435245444954
      4F54524F4341295D00000000FFFF000000000002000000010000000009006865
      6C7665746963610007000000020000000000010000001700020000000000FFFF
      FF00000000020000000000000000004B35000006004D656D6F35320002007402
      000084010000140100000D0000004300000001000000000000000000FFFFFF1F
      2C0200000000000100230056616C6F7220546F74616C202D204465622E2F4372
      65642E20646F20436C69656E746500000000FFFF000000000002000000010000
      0000090068656C76657469636100080000000200000000000100000017000200
      00000000FFFFFF00000000020000000000000000002836000006004D656D6F35
      330002008D03000084010000640000000D00000000000000F003000000000000
      0000FFFFFF1F2C000000080064642F6D6D2F797900010052005B464F524D4154
      464C4F415428272323232C2323232C2323302E3030272C20544F54414C505245
      434F56454E44412B544F54414C444553434F4E544F532B544F54414C43524544
      49544F54524F4341295D2000000000FFFF000000000002000000010000000009
      0068656C76657469636100080000000200000000000100000017000200000000
      00FFFFFF0000000002000000000000000201763700000C004461646F734D6573
      7472653100020100000000500000002F04000000000000310005000100000000
      0000000000FFFFFF1F000000001C0066647352656C61746F72696F50726F6475
      746F73436C69656E7465730000000008000500626567696E0D1E002020544F54
      414C505245434F5041555441434C49454E5445203A3D20303B0D1E002020544F
      54414C505245434F56454E4441434C49454E5445203A3D20303B0D1700202054
      4F54414C50524F434C49454E5445203A3D20303B0D17002020544F54414C434C
      49454E5445202020203A3D20303B0D1D002020544F54414C444553434F4E544F
      53434C49454E5445203A3D20303B0D20002020544F54414C4352454449544F54
      524F4341434C49454E5445203A3D20303B0D0300656E6400FFFF000000000002
      000000010000000000000001000000C800000014000000010000000000000201
      643C00000E004461646F734465446574616C686500020100000000740000002F
      0400000D0000003100080001000000000000000000FFFFFF1F000000001C0066
      647352656C61746F72696F50726F6475746F73436C69656E7465730000000013
      000500626567696E0D7B002020544F54414C434C49454E5445203A3D20544F54
      414C434C49454E5445202B205B71727952656C61746F72696F50726F6475746F
      73436C69656E7465732E227175616E746964616465225D202A205B7172795265
      6C61746F72696F50726F6475746F73436C69656E7465732E22707265636F7665
      6E6461225D3B0D53002020544F54414C50524F434C49454E5445203A3D20544F
      54414C50524F434C49454E5445202B205B71727952656C61746F72696F50726F
      6475746F73436C69656E7465732E227175616E746964616465225D3B0D680020
      20544F54414C4352454449544F54524F4341434C49454E5445203A3D20544F54
      414C4352454449544F54524F4341434C49454E5445202B205B71727952656C61
      746F72696F50726F6475746F73436C69656E7465732E226372656469746F7472
      6F6361225D3B200D00000D51002020544F54414C50524F4455544F53203A3D20
      544F54414C50524F4455544F53202B20285B71727952656C61746F72696F5072
      6F6475746F73436C69656E7465732E227175616E746964616465225D293B0D5D
      002020544F54414C505245434F5041555441203A3D20544F54414C505245434F
      5041555441202B20285B71727952656C61746F72696F50726F6475746F73436C
      69656E7465732E22746F74616C707265636F746162656C61225D293B20200D6B
      002020544F54414C505245434F5041555441434C49454E5445203A3D20544F54
      414C505245434F5041555441434C49454E5445202B20285B71727952656C6174
      6F72696F50726F6475746F73436C69656E7465732E22746F74616C707265636F
      746162656C61225D2920203B0D00000D5C002020544F54414C505245434F5645
      4E4441203A3D20544F54414C505245434F56454E4441202B20285B7172795265
      6C61746F72696F50726F6475746F73436C69656E7465732E22746F74616C7072
      65636F76656E6461225D293B20200D6A002020544F54414C505245434F56454E
      4441434C49454E5445203A3D20544F54414C505245434F56454E4441434C4945
      4E5445202B20285B71727952656C61746F72696F50726F6475746F73436C6965
      6E7465732E22746F74616C707265636F76656E6461225D293B20200D00000D53
      002020544F54414C444553434F4E544F53203A3D20544F54414C444553434F4E
      544F53202B20285B71727952656C61746F72696F50726F6475746F73436C6965
      6E7465732E22646573636F6E746F225D293B20200D60002020544F54414C4445
      53434F4E544F53434C49454E5445203A3D20544F54414C444553434F4E544F53
      434C49454E5445202B20285B71727952656C61746F72696F50726F6475746F73
      436C69656E7465732E22646573636F6E746F225D293B200D00000D5C00202054
      4F54414C4352454449544F54524F4341203A3D20544F54414C4352454449544F
      54524F4341202B205B71727952656C61746F72696F50726F6475746F73436C69
      656E7465732E226372656469746F74726F6361225D3B2020200D00000D00000D
      0300656E6400FFFF000000000002000000010000000000000001000000C80000
      0014000000010000000000000201443E00000D00526F64617065446574616C68
      6500020100000000DA0000002F04000017000000310009000100000000000000
      0000FFFFFF1F000000000000000000000E000500626567696E0D220020494620
      434F554E54284461646F734465446574616C6865293D2031207468656E200D0F
      00202020686569676874203A3D2034330D270020656C736520494620434F554E
      54284461646F734465446574616C686529203D2032207468656E0D1400202020
      686569676874203A3D203433202D2031330D280020656C736520494620434F55
      4E54284461646F734465446574616C686529203D2033207468656E200D140020
      2020686569676874203A3D203433202D2032360D280020656C73652049462043
      4F554E54284461646F734465446574616C686529203D2034207468656E200D14
      00202020686569676874203A3D203433202D2033390D130020656C7365202068
      6569676874203A3D20303B0D00000D320020494620284C454E475448285B7172
      79456E64657265636F436C69656E74652E22727561225D29203E203431292054
      48454E0D19002020686569676874203A3D20686569676874202B2031333B200D
      0300656E640000EA000000000002000000010000000000000001000000C80000
      00140000000100000000000000015740000006004D656D6F32360002000B0000
      0074000000710000000D00000060000000F4010000000000000000FFFFFF1F2C
      020000000000010061015B4946285B6E636D6973656E746F706973636F66696E
      735D3D46616C73652C5B71727952656C61746F72696F50726F6475746F73436C
      69656E7465732E22636F6E747261746F225D2C5B71727952656C61746F72696F
      50726F6475746F73436C69656E7465732E226E636D225D295D205B7172795265
      6C61746F72696F50726F6475746F73436C69656E7465732E2273697475616361
      6F225D205B4946285B71727952656C61746F72696F50726F6475746F73436C69
      656E7465732E22726567697374726F225D203D202756272C20464F524D415444
      41544554494D45282744442F4D4D2F5959272C205B71727952656C61746F7269
      6F50726F6475746F73436C69656E7465732E226661747572616D656E746F225D
      292C20464F524D41544441544554494D45282744442F4D4D2F5959272C205B71
      727952656C61746F72696F50726F6475746F73436C69656E7465732E22646576
      6F6C7563616F225D29295D00000000FFFF000000000002000000010000000609
      0068656C76657469636100080000000000000000000100000001000000FF0000
      00FFFFFF1F2F005B71727952656C61746F72696F50726F6475746F73436C6965
      6E7465732E22726567697374726F225D203D2027442700020000000000000000
      01BA42000006004D656D6F32380002007E00000074000000460000000D000000
      2000000001000000000000000000FFFFFF1F2C0200000000000100B1015B7172
      7952656C61746F72696F50726F6475746F73436C69656E7465732E2273657269
      65225D205B4946285B71727952656C61746F72696F50726F6475746F73436C69
      656E7465732E224E554D45524F4E4F5441225D3D302C27272C5B71727952656C
      61746F72696F50726F6475746F73436C69656E7465732E224E554D45524F4E4F
      5441225D295D205B4946285B71727952656C61746F72696F50726F6475746F73
      436C69656E7465732E226D617175696E61225D3D302C27272C5B71727952656C
      61746F72696F50726F6475746F73436C69656E7465732E226D617175696E6122
      5D295D205B4946285B71727952656C61746F72696F50726F6475746F73436C69
      656E7465732E22494E54455256454E53414F225D3D302C27272C5B7172795265
      6C61746F72696F50726F6475746F73436C69656E7465732E22494E5445525645
      4E53414F225D295D20205B4946285B71727952656C61746F72696F50726F6475
      746F73436C69656E7465732E224E554D45524F4355504F4D225D3D302C27272C
      5B71727952656C61746F72696F50726F6475746F73436C69656E7465732E224E
      554D45524F4355504F4D225D295D00000000FFFF000000000002000000010000
      0006090068656C76657469636100080000000000000000000000000001000000
      FF000000FFFFFF1F2F005B71727952656C61746F72696F50726F6475746F7343
      6C69656E7465732E22726567697374726F225D203D2027442700020000000000
      000000010744000006004D656D6F3331000200CA02000074000000350000000D
      0000000000000001000000000000000000FFFFFF1F2C000000080064642F6D6D
      2F797900010082005B4946285B71727952656C61746F72696F50726F6475746F
      73436C69656E7465732E22646573636F6E746F225D203C3E20302C20464F524D
      4154464C4F415428272323232C2323232C2323302E3030272C205B7172795265
      6C61746F72696F50726F6475746F73436C69656E7465732E22646573636F6E74
      6F225D292C202727295D0003000500626567696E0D00000D0400656E643B00FF
      FF0000000000020000000100000006090068656C766574696361000800000000
      00000000000100000001000000FF000000FFFFFF1F2F005B71727952656C6174
      6F72696F50726F6475746F73436C69656E7465732E22726567697374726F225D
      203D202744270002000000000000000001EF44000006004D656D6F3332000200
      C600000074000000340000000D0000000000000001000000000000000000FFFF
      FF1F2C000000080064642F6D6D2F79790001002E005B71727952656C61746F72
      696F50726F6475746F73436C69656E7465732E2270726F6475746F7669737561
      6C225D00000000FFFF0000000000020000000100000006090068656C76657469
      636100080000000000000000000100000001000000FF000000FFFFFF1F2F005B
      71727952656C61746F72696F50726F6475746F73436C69656E7465732E227265
      67697374726F225D203D202744270002000000000000000001D545000006004D
      656D6F3333000200FA000000740000000E0000000D0000000000000001000000
      000000000000FFFFFF1F2C000000080064642F6D6D2F79790001002C005B7172
      7952656C61746F72696F50726F6475746F73436C69656E7465732E2266696C69
      616C76656E6461225D00000000FFFF0000000000020000000100000006090068
      656C76657469636100080000000000000000000100000001000000FF000000FF
      FFFF1F2F005B71727952656C61746F72696F50726F6475746F73436C69656E74
      65732E22726567697374726F225D203D202744270002000000000000000001B9
      46000006004D656D6F33340002000A01000074000000960000000D0000000300
      000001000000000000000000FFFFFF1F2C000000080064642F6D6D2F79790001
      002A005B71727952656C61746F72696F50726F6475746F73436C69656E746573
      2E2264657363726963616F225D00000000FFFF00000000000200000001000000
      06090068656C76657469636100080000000000000000000000000001000000FF
      000000FFFFFF1F2F005B71727952656C61746F72696F50726F6475746F73436C
      69656E7465732E22726567697374726F225D203D202744270002000000000000
      0000015348000006004D656D6F3335000200F801000074000000380000000D00
      00000000000001000000000000000000FFFFFF1F2C000000080064642F6D6D2F
      7979000100E0005B4946285B71727952656C61746F72696F50726F6475746F73
      436C69656E7465732E22746F74616C707265636F746162656C61225D203C3E20
      302C20464F524D4154464C4F415428272323232C2323232C2323302E3030272C
      205B71727952656C61746F72696F50726F6475746F73436C69656E7465732E22
      746F74616C707265636F746162656C61225D292C20464F524D4154464C4F4154
      28272323232C2323232C2323302E3030272C205B71727952656C61746F72696F
      50726F6475746F73436C69656E7465732E22746F74616C707265636F74616265
      6C61225D29295D00000000FFFF0000000000020000000100000006090068656C
      76657469636100080000000000000000000100000001000000FF000000FFFFFF
      1F2F005B71727952656C61746F72696F50726F6475746F73436C69656E746573
      2E22726567697374726F225D203D202744270002000000000000000001E34800
      0006004D656D6F31330002000D010000DE000000600000000D00000043000000
      01000000000000000000FFFFFF1F2C02000000000001000D00546F74616C2043
      6C69656E746500000000FFFF0000000000020000000100000000090068656C76
      65746963610008000000020000000000010000001700020000000000FFFFFF00
      00000002000000000000000001EB49000006004D656D6F31390002009F010000
      74000000210000000D0000000000000001000000000000000000FFFFFF1F2C00
      0000080064642F6D6D2F79790001004E005B466F726D6174466C6F6174285B4D
      6173636172615175616E7469646164655D2C5B71727952656C61746F72696F50
      726F6475746F73436C69656E7465732E227175616E746964616465225D295D00
      000000FFFF0000000000020000000100000006090068656C7665746963610008
      0000000000000000000100000001000000FF000000FFFFFF1F2F005B71727952
      656C61746F72696F50726F6475746F73436C69656E7465732E22726567697374
      726F225D203D202744270002000000000000000001F24A000006004D656D6F33
      30000200C201000074000000360000000D000000000000000100000000000000
      0000FFFFFF1F2C000000080064642F6D6D2F79790001004D005B464F524D4154
      464C4F415428272323232C2323232C2323302E3030272C205B71727952656C61
      746F72696F50726F6475746F73436C69656E7465732E22707265636F74616265
      6C61225D295D00000000FFFF0000000000020000000100000006090068656C76
      657469636100080000000000000000000100000001000000FF000000FFFFFF1F
      2F005B71727952656C61746F72696F50726F6475746F73436C69656E7465732E
      22726567697374726F225D203D202744270002000000000000000001B44B0000
      06004D656D6F31350002004C020000DE000000540000000D00000000000000F0
      030000000000000000FFFFFF1F2C000000080064642F6D6D2F79790001003700
      5B464F524D4154464C4F415428272323232C2323232C2323302E3030272C2054
      4F54414C505245434F56454E4441434C49454E5445295D00000000FFFF000000
      0000020000000100000000090068656C76657469636100070000000200000000
      00010000001700020000000000FFFFFF0000000002000000000000000001194D
      000006004D656D6F313700020090020000DE0000003C0000000D000000000000
      00F0030000000000000000FFFFFF1F2C000000080064642F6D6D2F7979000100
      DA005B494628285B544F54414C505245434F56454E4441434C49454E54453E3D
      544F54414C505245434F5041555441434C49454E54455D292C5B464F524D4154
      464C4F415428272323232C2323232C2323302E3030272C205B544F54414C5052
      45434F56454E4441434C49454E54452D544F54414C505245434F504155544143
      4C49454E54455D295D2C5B464F524D4154464C4F415428272323232C2323232C
      2323302E3030272C205B544F54414C505245434F56454E4441434C49454E5445
      2D544F54414C505245434F5041555441434C49454E54455D295D295D00000000
      FFFF0000000000020000000100000000090068656C7665746963610007000000
      020000000000010000001700020000000000FFFFFF0000000002000000000000
      000001DB4D000006004D656D6F3339000200DC010000DE000000540000000D00
      000000000000F0030000000000000000FFFFFF1F2C000000080064642F6D6D2F
      797900010037005B464F524D4154464C4F415428272323232C2323232C232330
      2E3030272C20544F54414C505245434F5041555441434C49454E5445295D0000
      0000FFFF0000000000020000000100000000090068656C766574696361000700
      0000020000000000010000001700020000000000FFFFFF000000000200000000
      0000000001E64E000006004D656D6F32350002006A0200007400000036000000
      0D0000000000000001000000000000000000FFFFFF1F2C000000080064642F6D
      6D2F797900010051005B464F524D4154464C4F415428272323232C2323232C23
      23302E3030272C205B71727952656C61746F72696F50726F6475746F73436C69
      656E7465732E22746F74616C707265636F76656E6461225D295D00000000FFFF
      0000000000020000000100000006090068656C76657469636100080000000000
      000000000100000001000000FF000000FFFFFF1F2F005B71727952656C61746F
      72696F50726F6475746F73436C69656E7465732E22726567697374726F225D20
      3D202744270002000000000000000001EC4F000006004D656D6F323700020034
      02000074000000340000000D0000000000000001000000000000000000FFFFFF
      1F2C000000080064642F6D6D2F79790001004C005B464F524D4154464C4F4154
      28272323232C2323232C2323302E3030272C205B71727952656C61746F72696F
      50726F6475746F73436C69656E7465732E22707265636F76656E6461225D295D
      00000000FFFF0000000000020000000100000006090068656C76657469636100
      080000000000000000000100000001000000FF000000FFFFFF1F2F005B717279
      52656C61746F72696F50726F6475746F73436C69656E7465732E227265676973
      74726F225D203D202744270002000000000000000001A151000006004D656D6F
      3239000200A2020000740000002A0000000D0000000000000001000000000000
      000000FFFFFF1F2C000000080064642F6D6D2F7979000100FB005B4946282028
      5B71727952656C61746F72696F50726F6475746F73436C69656E7465732E2274
      6F74616C707265636F76656E6461225D202D205B71727952656C61746F72696F
      50726F6475746F73436C69656E7465732E22746F74616C707265636F74616265
      6C61225D29203C3E20302C20464F524D4154464C4F415428272323232C232323
      2C2323302E3030272C20285B71727952656C61746F72696F50726F6475746F73
      436C69656E7465732E22746F74616C707265636F76656E6461225D2D5B717279
      52656C61746F72696F50726F6475746F73436C69656E7465732E22746F74616C
      707265636F746162656C61225D29292C202727295D00000000FFFF0000000000
      020000000100000006090068656C766574696361000800000000000000000001
      00000001000000FF000000FFFFFF1F2F005B71727952656C61746F72696F5072
      6F6475746F73436C69656E7465732E22726567697374726F225D203D20274427
      00020000000000000000016252000006004D656D6F3430000200C3020000DE00
      00003C0000000D00000000000000F0030000000000000000FFFFFF1F2C000000
      080064642F6D6D2F797900010036005B464F524D4154464C4F41542827232323
      2C2323232C2323302E3030272C20544F54414C444553434F4E544F53434C4945
      4E5445295D00000000FFFF0000000000020000000100000000090068656C7665
      746963610007000000020000000000010000001700020000000000FFFFFF0000
      0000020000000000000000017653000006004D656D6F3434000200F702000074
      0000003D0000000D0000000000000001000000000000000000FFFFFF1F2C0000
      00080064642F6D6D2F79790001007B005B464F524D4154464C4F415428272323
      232C2323232C2323302E3030272C205B71727952656C61746F72696F50726F64
      75746F73436C69656E7465732E22746F74616C707265636F76656E6461225D2B
      5B71727952656C61746F72696F50726F6475746F73436C69656E7465732E2264
      6573636F6E746F225D295D0002000500626567696E0D0400656E643B00FFFF00
      00000000020000000100000006090068656C7665746963610008000000000000
      0000000100000001000000FF000000FFFFFF1F00000002000000000000000001
      4E54000006004D656D6F3435000200F8020000DE0000003C0000000D00000000
      000000F0030000000000000000FFFFFF1F2C000000080064642F6D6D2F797900
      01004D005B464F524D4154464C4F415428272323232C2323232C2323302E3030
      272C20544F54414C505245434F56454E4441434C49454E54452B544F54414C44
      4553434F4E544F53434C49454E5445295D00000000FFFF000000000002000000
      0100000000090068656C76657469636100070000000200000000000100000017
      00020000000000FFFFFF00000000020000000000000000017455000006004D65
      6D6F34390002002503000074000000450000000D000000000000000100000000
      0000000000FFFFFF1F2C000000080064642F6D6D2F79790001008A005B494628
      5B71727952656C61746F72696F50726F6475746F73436C69656E7465732E2263
      72656469746F74726F6361225D203C3E20302C20464F524D4154464C4F415428
      272323232C2323232C2323302E3030272C205B71727952656C61746F72696F50
      726F6475746F73436C69656E7465732E226372656469746F74726F6361225D29
      2C202727295D0003000500626567696E0D00000D0400656E643B00FFFF000000
      0000020000000100000006090068656C76657469636100080000000000000000
      000100000001000000FF000000FFFFFF1F000000020000000000000000013856
      000006004D656D6F353000020022030000DE000000480000000D000000000000
      00F0030000000000000000FFFFFF1F2C000000080064642F6D6D2F7979000100
      39005B464F524D4154464C4F415428272323232C2323232C2323302E3030272C
      20544F54414C4352454449544F54524F4341434C49454E5445295D00000000FF
      FF0000000000020000000100000000090068656C766574696361000700000002
      0000000000010000001700020000000000FFFFFF000000000200000000000000
      FEFEFF150000000A00204361626563616C686F000000000F0052415A414F4649
      4C49414C42415345000000000F00454E44455245434F5F42414952524F000000
      000D004345505F4349444144455F5546000000000600544954554C4F00010030
      0006004F5554524153000100300011004D4153434152415155414E5449444144
      4500070027232323232327000C00204167727570616D656E746F000000001200
      41677275706172477275706F46696C69616C00050046616C7365000D00416772
      7570617246696C69616C00050046616C73650010004167727570617244617461
      56656E646100050046616C7365000C0020544F54414C495A4143414F00000000
      0F00544F54414C505245434F56454E444100010030001600544F54414C505245
      434F56454E4441434C49454E544500010030001600544F54414C505245434F50
      41555441434C49454E544500010030000F00544F54414C505245434F50415554
      41000100300012006E636D6973656E746F706973636F66696E7300050046616C
      7365000E00544F54414C444553434F4E544F5300010030001500544F54414C44
      4553434F4E544F53434C49454E544500010030001800544F54414C4352454449
      544F54524F4341434C49454E544500010030001100544F54414C435245444954
      4F54524F4341000100300000000000030000001200666473456E64657265636F
      436C69656E7465001200666473456E64657265636F436C69656E7465001C0066
      647352656C61746F72696F50726F6475746F73436C69656E746573001C006664
      7352656C61746F72696F50726F6475746F73436C69656E746573001D00666473
      52656C61746F72696F50726F6475746F73436C69656E7465735F00000000FC00
      000000000000000000000000000000580042C995683481E3404570D3100C22E6
      40}
  end
  object qryRelatorioProdutosClientes_: TtecQuery
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
        Name = 'DadosFiscais'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NCMIsentoPISCOFINS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DadosFiscais_Servicos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NCMIsentoPISCOFINS_Servicos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contratos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ProdutosComNFEmitida_Faturados'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contratos_Servicos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DadosFiscais_FrentedeCaixa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Devolucoes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ProdutosComNFEmitida_Devolvido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Devolucoes_Servicos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Devolucoes_np'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Ordenacao'
        ParamType = ptUnknown
        Value = 'cliente'
      end>
    Sql.Strings = (
      ';SELECT * FROM'
      '('
      'select produtosclientes.*,'
      '       vf.rua,'
      '       (select b.nome'
      '        from bairros b'
      '        where b.estado = vf.estado and'
      '              b.cidade = vf.cidade and'
      '              b.codigo = vf.bairro) as bairro,'
      '       vf.cep,'
      '       (select c.nome'
      '        from cidades c'
      '        where c.estado = vf.estado and'
      '              c.codigo = vf.cidade) as cidade,'
      '       vf.pessoanumero,'
      
        '       coalesce(formatar_fone_fax(vf.foneddd, vf.fonenumero, vf.' +
        'foneramal)) as fone'
      'from'
      '('
      ''
      ''
      '  /* Produtos com notas/cupons emitidos */'
      '  ('
      '   select vendas.*,'
      '          cp.produto_cliente'
      '   from'
      '   ('
      '    select vendas.*,'
      '           n.serie,'
      '           n.numero as numeronota'
      '    from'
      '    ('
      '     select vendas.*,'
      '            cp.maquina,'
      '            cp.intervensao,'
      '            cp.numero as numerocupom'
      '     from'
      '     ('
      '      select ct.cliente,'
      '             ct.tipocliente,'
      '             ct.nome as nomecliente,'
      '             '
      '             ct.numero as contrato,'
      '             ct.pedidocliente,'
      '             ct.situacao,'
      '             ct.faturamento,'
      '             df.filialvenda,'
      '             pdf.dadofiscal,'
      '             df.data,'
      '             pdf.quantidade,'
      
        '             - ratearcreditotroca_dadosfiscais(pdf.dadofiscal, p' +
        'df.produto) as creditotroca,'
      '             pdf.produto,'
      '             p.codigovisual as produtovisual,'
      '             pdf.filial,'
      
        '             cast(btrim(p.descricao ||'#39' '#39'||coalesce(p.valorgrade' +
        '1,'#39#39')||'#39' '#39'||coalesce(p.valorgrade2,'#39#39')) as varchar(162)) as desc' +
        'ricao,'
      '             pdf.precovenda,'
      '             pdf.precotabela,'
      '             pdf.quantidade*pdf.precovenda as totalprecovenda,'
      '             pdf.quantidade*pdf.precotabela as totalprecotabela,'
      '             cast(null as date) as devolucao,'
      ''
      '             -((coalesce(pdf.desconto,0)+'
      '                coalesce(pdf.valordescontoitem,0)) -'
      '               coalesce(pdf.acrescimo,0)'
      '               ) as desconto,'
      ''
      ''
      '             cast('#39'V'#39' as char) as registro,'
      
        '             (select ipi.classificacaofiscal from ipi where ipi.' +
        'codigo = c.ipi) as ncm'
      ''
      '             '
      '      from (contratos ct'
      '            join (dadosfiscais df'
      '                  join (produtosdadosfiscais pdf'
      
        '                        join ((produtos p left join promocoes pr' +
        'o on p.promocao = pro.codigo)'
      '                              join (((caracteristicas c'
      '                                      join grupos g'
      '                                      on c.grupo = g.codigo)'
      ''
      '                                      join classes cl'
      '                                      on c.classe = cl.codigo)'
      ''
      '                                      join marcas m'
      '                                      on c.marca = m.codigo)'
      ''
      '                              on c.codigo = p.caracteristica)'
      '                        on pdf.produto = p.codigo)'
      '                  on pdf.dadofiscal = df.numero)'
      '            on df.contrato = ct.numero)'
      ''
      
        '      where ct.faturamento between (:datainicial) and (:datafina' +
        'l)'
      '        and ct.numero = df.contrato'
      '        and not coalesce(pdf.brinde,false)'
      '        and (coalesce(ct.valorvista,0)<>0)'
      '        and not coalesce(df.notavinculada,false)'
      
        '        and (eHNotaFiscalSaidaVenda(df.codigofiscal) or mod(df.c' +
        'odigofiscal,1000) in (929))'
      '        and ct.origem IS NULL'
      
        '        and case when ct.os then ct.tipoequipamento in (1,2) and' +
        ' not (coalesce(ct.os_garantia,false) and ct.os_garantia_status='#39 +
        'A'#39') and not coalesce(ct.os_cortesia,false) else true end'
      ''
      
        '            /*   ct.situacao in ('#39'N'#39','#39'P'#39') and - Rel vendas n'#227'o p' +
        'ossui esta restri'#231#227'o */'
      '            /*   df.situacao='#39'N'#39' and */'
      ''
      '         and case when ct.situacao = '#39'N'#39' then'
      '                  ct.situacao = df.situacao'
      #9'   else (case when ct.situacao='#39'C'#39' then'
      
        #9'         (case when coalesce((select sum(p.valorpagto) from par' +
        'celas p where p.contrato = ct.numero and p.tipopagto='#39'E'#39'),0) = c' +
        't.valorprazo then'
      
        #9#9#9'    df.numero = (select max(df2.numero) from dadosfiscais df2' +
        ' where df2.contrato = ct.numero)'
      #9#9' '#9' else df.situacao='#39'N'#39' end) else true end) end'
      ''
      '      %DadosFiscais'
      ''
      '      %NCMIsentoPISCOFINS'
      ''
      ''
      
        '     ) as vendas left join cupons cp on vendas.dadofiscal = cp.d' +
        'adofiscal'
      
        '    ) as vendas left join notas n on vendas.dadofiscal = n.dadof' +
        'iscal'
      
        '   ) as vendas left join clientesprodutos cp on vendas.cliente =' +
        ' cp.cliente'
      
        '                                            and vendas.tipoclien' +
        'te = cp.tipocliente'
      '  '#9#9#9#9#9'  and vendas.produto = cp.produto'
      ' )'
      ' '
      ' union all'
      ' '
      ' '
      '  /* Servi'#231'os com notas/cupons emitidos */'
      '  '
      '  ('
      '   select vendas.*,'
      '          cast(null as varchar(30)) as produto_cliente'
      '   from'
      '   ('
      '    select vendas.*,'
      '           n.serie,'
      '           n.numero as numeronota'
      '    from'
      '    ('
      '     select vendas.*,'
      '            cp.maquina,'
      '            cp.intervensao,'
      '            cp.numero as numerocupom'
      '     from'
      '     ('
      '      select ct.cliente,'
      '             ct.tipocliente,'
      '             ct.nome as nomecliente,'
      '             ct.numero as contrato,'
      '             ct.pedidocliente,'
      '             ct.situacao,'
      '             ct.faturamento,'
      '             df.filialvenda,'
      '             df.numero as dadofiscal,'
      '             df.data,'
      '             sdf.quantidade,'
      '             cast(null as numeric(11,2)) as creditotroca,'
      '             cast(sdf.servico as bigint) as produto,'
      '             cast(sdf.servico as varchar(30)) as produtovisual,'
      '             df.filialvenda as filial,'
      '             cast(s.descricao as varchar(162)) as descricao,'
      '             sdf.valorservico as precovenda,'
      '             s.valor as precotabela,'
      '             sdf.quantidade*sdf.valorservico as totalprecovenda,'
      '             sdf.quantidade*s.valor as totalprecotabela,'
      '             cast(null as date) as devolucao,'
      '             0.00 as desconto,'
      '             cast('#39'V'#39' as char) as registro,'
      '             cast(null as varchar(8)) as ncm'
      ''
      '             '
      '      from (contratos ct'
      '            join (dadosfiscais df'
      '                  join (Servicosdadosfiscais sdf'
      '                        join servicos s '
      '                        on sdf.produto = s.codigo)'
      '                  on sdf.dadofiscal = df.numero)'
      '            on df.contrato = ct.numero)'
      '            '
      '            join servicoscontratos sc'
      '            on ct.numero = sc.contrato'
      '            and sc.servico = sdf.servico'
      ''
      
        '      where ct.faturamento between (:Datainicial) and (:DataFina' +
        'l) and'
      '            ct.numero = df.contrato  and'
      
        '/*            ct.situacao in ('#39'N'#39','#39'P'#39') and - Rel vendas n'#227'o poss' +
        'ui esta restri'#231#227'o */'
      
        '            df.situacao='#39'N'#39' and not coalesce(df.notavinculada,fa' +
        'lse)'
      
        '            and (eHNotaFiscalSaidaVenda(df.codigofiscal) or mod(' +
        'df.codigofiscal,1000) in (929))'
      
        '            and case when ct.os then ct.tipoequipamento in (1,2)' +
        ' and not (coalesce(ct.os_garantia,false) and ct.os_garantia_stat' +
        'us='#39'A'#39') and not coalesce(ct.os_cortesia,false) else true end'
      ''
      '            %DadosFiscais_Servicos'
      ''
      '            %NCMIsentoPISCOFINS_Servicos'
      ''
      
        '     ) as vendas left join cupons cp on vendas.dadofiscal = cp.d' +
        'adofiscal'
      
        '    ) as vendas left join notas n on vendas.dadofiscal = n.dadof' +
        'iscal'
      '   ) as vendas '
      ' )'
      ' '
      ' '
      '  union all'
      '  '
      '  /*  Produtos contratos em situa'#231#227'o Parcial ou Faturado */'
      ' ('
      '  select produtos.cliente,'
      '         produtos.tipocliente,'
      '         produtos.nomecliente,'
      '         produtos.contrato,'
      '         produtos.pedidocliente,'
      '         produtos.situacao,'
      '         produtos.faturamento,'
      '         produtos.filialvenda,'
      '         cast(null as integer) as dadofiscal,'
      '         cast(null as date) as data,'
      
        '         produtos.quantidade - produtos.quantidade_entregue as q' +
        'uantidade,'
      
        '         ((produtos.creditotroca / produtos.quantidade) * (produ' +
        'tos.quantidade - produtos.quantidade_entregue)) as creditotroca,'
      '         produtos.produto,'
      '         produtos.produtovisual,'
      '         produtos.filial,'
      '         produtos.descricao,                  '
      '         produtos.precovenda,'
      '         produtos.precotabela,'
      
        '         (produtos.quantidade - produtos.quantidade_entregue) * ' +
        'produtos.precovenda as totalprecovenda,'
      
        '         (produtos.quantidade - produtos.quantidade_entregue) * ' +
        'produtos.precotabela as totalprecotabela,'
      '         cast(null as date) as devolucao,'
      '         produtos.desconto,'
      '         produtos.registro,'
      '         produtos.ncm,'
      '         cast(null as integer) as maquina,'
      '         cast(null as integer) as intervensao,'
      '         cast(null as integer) as numerocupom,'
      '         cast(null as varchar(3)) as serie,'
      '         cast(null as integer) as numeronota,'
      '         cp.produto_cliente'
      '  from'
      '  ('
      '    select produtos.*'
      '    from'
      '    ('
      '     select ct.cliente,'
      '            ct.tipocliente,'
      '            ct.nome as nomecliente,'
      '            ct.numero as contrato,'
      '            ct.pedidocliente,'
      '            ct.situacao,'
      '            ct.faturamento,'
      '            ct.filialvenda,'
      '            pc.quantidade,'
      
        '            - ratearcreditotroca_contratos(pc.contrato, pc.produ' +
        'to) as creditotroca,'
      '            case when ct.situacao = '#39'P'#39' then'
      
        '              produtoscontratos_qtdeentregue(coalesce(ct.primoge' +
        'nito, ct.numero),pc.produto,pc.filial)'
      
        '            else cast(0 as Numeric(9,3)) end as quantidade_entre' +
        'gue,'
      '            pc.produto,'
      '            p.codigovisual as produtovisual,'
      '            pc.filial,'
      
        '            cast(btrim(p.descricao ||'#39' '#39'||coalesce(p.valorgrade1' +
        ','#39#39')||'#39' '#39'||coalesce(p.valorgrade2,'#39#39')) as varchar(162)) as descr' +
        'icao,'
      '            pc.precovenda,'
      '            pc.precotabela,'
      ''
      
        '/*            - (rateardesconto(ct.numero, cast(pc.produto as bi' +
        'gint)) + coalesce(pc.valordescontoitem,0)) as desconto,*/'
      ''
      '            - ((coalesce(pc.desconto) +'
      '                coalesce(pc.valordescontoitem,0)) -'
      '                coalesce(pc.acrescimo,0)) as desconto,'
      ''
      '  '#9'  cast('#39'V'#39' as char) as registro,'
      
        '           (select ipi.classificacaofiscal from ipi where ipi.co' +
        'digo = c.ipi) as ncm'
      ''
      '     from (contratos ct'
      '           join (produtoscontratos pc'
      
        '                 join ((produtos p left join promocoes pro on p.' +
        'promocao = pro.codigo)'
      '                       join (((caracteristicas c'
      '                               join grupos g'
      '                               on c.grupo = g.codigo)'
      ''
      '                               join classes cl'
      '                               on c.classe = cl.codigo)'
      ''
      '                               join marcas m'
      '                               on c.marca = m.codigo)'
      ''
      '                       on c.codigo = p.caracteristica)'
      '                 on p.codigo = pc.produto)'
      '           on pc.contrato = ct.numero)'
      ''
      
        '     where ct.faturamento between (:DataInicial) and (:DataFinal' +
        ') and'
      '           ct.situacao in ('#39'P'#39','#39'F'#39')'
      
        '           and case when ct.os then ct.tipoequipamento in (1,2) ' +
        'and not (coalesce(ct.os_garantia,false) and ct.os_garantia_statu' +
        's='#39'A'#39') and not coalesce(ct.os_cortesia,false) else true end'
      ''
      '          %Contratos'
      ''
      '          %NCMIsentoPISCOFINS'
      ''
      '          %ProdutosComNFEmitida_Faturados'
      ''
      '    ) as produtos'
      '    where (quantidade-quantidade_entregue)<>0'
      
        '  ) as produtos left join clientesprodutos cp on produtos.client' +
        'e = cp.cliente'
      
        '                                             and produtos.tipocl' +
        'iente = cp.tipocliente'
      '  '#9#9#9#9#9'     and produtos.produto = cp.produto'
      ' )'
      ' '
      ' union all'
      ' '
      '  '
      
        '  /*  Servi'#231'os contratos em situa'#231#227'o Parcial (n'#227'o existe) ou Fat' +
        'urado */'
      ' ('
      ' '
      '  select produtos.cliente,'
      '         produtos.tipocliente,'
      '         produtos.nomecliente,'
      '         produtos.contrato,'
      '         produtos.pedidocliente,'
      '         produtos.situacao,'
      '         produtos.faturamento,'
      '         produtos.filialvenda,'
      '         cast(null as integer) as dadofiscal,'
      '         cast(null as date) as data,'
      '         produtos.quantidade,'
      '         cast(null as numeric(11,2)) as creditotroca,'
      '         cast(produtos.servico as bigint) as produto,'
      '         cast(produtos.servico as varchar(30)) as produtovisual,'
      '         produtos.filial,'
      '         produtos.descricao,                  '
      '         produtos.precovenda,'
      '         produtos.precotabela,'
      '         produtos.totalprecovenda,'
      '         produtos.totalprecotabela,'
      '         cast(null as date) as devolucao,'
      '         produtos.desconto,'
      '         produtos.registro,'
      '         produtos.ncm,'
      '         cast(null as integer) as maquina,'
      '         cast(null as integer) as intervensao,'
      '         cast(null as integer) as numerocupom,'
      '         cast(null as varchar(3)) as serie,'
      '         cast(null as integer) as numeronota,'
      '         cast(null as varchar(30)) as produto_cliente'
      '  from'
      '  ('
      '     select ct.cliente,'
      '            ct.tipocliente,'
      '            ct.nome as nomecliente,'
      '            ct.numero as contrato,'
      '            ct.pedidocliente,'
      '            ct.situacao,'
      '            ct.faturamento,'
      '            ct.filialvenda,'
      '            sc.quantidade,'
      '            sc.servico,'
      '            ct.filialvenda as filial,'
      '            s.descricao,'
      '            '
      '            sc.valorservico as precovenda,'
      '            s.valor as precotabela,'
      '            sc.quantidade*sc.valorservico as totalprecovenda,'
      '            sc.quantidade*s.valor as totalprecotabela,'
      '            '
      '            0.00 as desconto,'
      '  '#9'        cast('#39'V'#39' as char) as registro,'
      ''
      '            cast(null as varchar(8)) as ncm'
      ''
      ''
      '     from (contratos ct'
      '           join (servicoscontratos sc'
      '                 join servicos s'
      '                 on s.codigo = sc.servico)'
      '           on sc.contrato = ct.numero)'
      ''
      
        '     where ct.faturamento between (:DataInicial) and (:DataFinal' +
        ') and'
      '           ct.situacao in (/*'#39'P'#39',*/'#39'F'#39')'
      
        '           and case when ct.os then ct.tipoequipamento in (1,2) ' +
        'and not (coalesce(ct.os_garantia,false) and ct.os_garantia_statu' +
        's='#39'A'#39') and not coalesce(ct.os_cortesia,false) else true end'
      ''
      '          %Contratos_Servicos'
      ''
      '          %NCMIsentoPISCOFINS_Servicos'
      ''
      '          %ProdutosComNFEmitida_Faturados'
      ''
      '  ) as produtos'
      ' )'
      ''
      '  '
      ' union all'
      ' '
      ' /* produtos com vendas sem contrato */'
      ' '
      ' ('
      '   select vendas.*,'
      '          cp.produto_cliente'
      '   from'
      '   ('
      '    select vendas.*,'
      '           n.serie,'
      '           n.numero as numeronota'
      '    from'
      '    ('
      '     select vendas.*,'
      '            cp.maquina,'
      '            cp.intervensao,'
      '            cp.numero as numerocupom'
      '     from'
      '     ('
      '      select df.cliente,'
      '             df.tipocliente,'
      '             df.nome as nomecliente,'
      '             df.contrato,'
      '             cast(null as varchar(35)) as pedidocliente,'
      '             cast(null as char(1)) as situacao,'
      '             df.data as faturamento,'
      '             df.filialvenda,'
      '             pdf.dadofiscal,'
      '             df.data,'
      '             pdf.quantidade,'
      
        '             - ratearcreditotroca_dadosfiscais(pdf.dadofiscal, p' +
        'df.produto) as creditotroca,'
      '             pdf.produto,'
      '             p.codigovisual as produtovisual,'
      '             pdf.filial,'
      
        '             cast(btrim(p.descricao ||'#39' '#39'||coalesce(p.valorgrade' +
        '1,'#39#39')||'#39' '#39'||coalesce(p.valorgrade2,'#39#39')) as varchar(162)) as desc' +
        'ricao,'
      '             pdf.precovenda,'
      '             pdf.precotabela,'
      '             pdf.quantidade*pdf.precovenda as totalprecovenda,'
      '             pdf.quantidade*pdf.precotabela as totalprecotabela,'
      '             cast(null as date) as devolucao,'
      ''
      ''
      '             -((coalesce(pdf.desconto,0)+'
      '                coalesce(pdf.valordescontoitem,0)) -'
      '               coalesce(pdf.acrescimo,0)'
      '               ) as desconto,'
      ''
      ''
      '             cast('#39'V'#39' as char) as registro,'
      
        '             (select ipi.classificacaofiscal from ipi where ipi.' +
        'codigo = c.ipi) as ncm'
      ''
      '      from (dadosfiscais df'
      #9'    join (produtosdadosfiscais pdf'
      
        #9#9'  join ((produtos p left join promocoes pro on p.promocao = pr' +
        'o.codigo)'
      #9#9#9'join (((caracteristicas c'
      '                                join grupos g'
      '                                on c.grupo = g.codigo)'
      ''
      '                                join classes cl'
      '                                on c.classe = cl.codigo)'
      ''
      '                                join marcas m'
      '                                on c.marca = m.codigo)'
      ''
      #9#9#9'on c.codigo = p.caracteristica)'
      '                  on pdf.produto = p.codigo)'
      '            on pdf.dadofiscal = df.numero)'
      ''
      '      where df.data between :Datainicial and :DataFinal'
      #9'    and df.contrato is null'
      #9#9'and df.situacao='#39'N'#39
      #9#9'and not coalesce(df.notavinculada,false)'
      ''
      
        '    and (eHNotaFiscalSaidaVenda(df.codigofiscal) or mod(df.codig' +
        'ofiscal,1000) in (929))'
      ''
      '            %DadosFiscais_FrentedeCaixa'
      ''
      '            %NCMIsentoPISCOFINS'
      ''
      
        '     ) as vendas left join cupons cp on vendas.dadofiscal = cp.d' +
        'adofiscal'
      
        '    ) as vendas left join notas n on vendas.dadofiscal = n.dadof' +
        'iscal'
      
        '   ) as vendas left join clientesprodutos cp on vendas.cliente =' +
        ' cp.cliente'
      
        '                                            and vendas.tipoclien' +
        'te = cp.tipocliente'
      '  '#9#9#9#9#9'  and vendas.produto = cp.produto'
      ' )'
      ''
      ''
      ' union all'
      ' '
      ' /* produtos com devolu'#231#227'o em contratosdevolvidos */'
      ' '
      ' ('
      '  select devolucoes.*,'
      '       cast(null as integer) as maquina,'
      '       cast(null as integer) as intervensao,'
      '       cast(null as integer) as numerocupom,'
      '       cast(null as varchar(3)) as serie,'
      '       cast(null as integer) as numeronota,'
      '       cp.produto_cliente'
      '  from'
      '  ('
      '   select ct.cliente,'
      '          ct.tipocliente,'
      '          ct.nome as nomecliente,'
      '          ct.numero as contrato,'
      '          ct.pedidocliente,'
      '          cd.situacao,'
      '          ct.faturamento,'
      '          ct.filialvenda,'
      #9'      cast(null as integer) as dadofiscal,'
      #9'      cast(null as date) as data,'
      '          -cd.quantidade as quantidade,'
      '          cd.creditotroca,'
      '          cd.produto,'
      '          p.codigovisual as produtovisual,'
      '          cd.filial,'
      
        '          cast(btrim(p.descricao ||'#39' '#39'||coalesce(p.valorgrade1,'#39 +
        #39')||'#39' '#39'||coalesce(p.valorgrade2,'#39#39')) as varchar(162)) as descric' +
        'ao,'
      
        '          -((cd.valorvista+cd.frete+cd.seguro+cd.desconto+cd.val' +
        'ordescontoitem)/cd.quantidade) as precovenda,'
      '          cast(null as numeric(15,2)) as precotabela,'
      ''
      
        '          -(cd.valorvista+cd.frete+cd.seguro+cd.desconto+cd.valo' +
        'rdescontoitem) as totalprecovenda,'
      ''
      '          cast(null as numeric(15,2)) as totalprecotabela,'
      '          cd.devolucao,'
      ''
      '          ((coalesce(cd.desconto,0)+'
      '              coalesce(cd.valordescontoitem,0)) -'
      '             (cd.valorvista - cd.valorprazo)) as desconto,'
      ''
      ''
      '          cast('#39'D'#39' as char) as registro,'
      
        '          (select ipi.classificacaofiscal from ipi where ipi.cod' +
        'igo = c.ipi) as ncm'
      ''
      '   from (contratos ct'
      '         join (contratosdevolvidos cd'
      
        '               join ((produtos p left join promocoes pro on p.pr' +
        'omocao = pro.codigo)'
      '                     join (((caracteristicas c'
      '                             join grupos g'
      '                             on c.grupo = g.codigo)'
      ''
      '                             join classes cl'
      '                             on c.classe = cl.codigo)'
      ''
      '                             join marcas m'
      '                             on c.marca = m.codigo)'
      ''
      '                     on c.codigo = p.caracteristica)'
      '               on p.codigo = cd.produto)'
      '         on ct.numero = cd.contrato)'
      ''
      '   where :IncluirDevolucoes'
      '     and ct.situacao in ('#39'N'#39','#39'P'#39','#39'F'#39','#39'C'#39') '
      '     and cd.devolucao between (:DataInicial) and (:DataFinal)'
      '     and cd.tipo = '#39'D'#39
      
        '     and case when ct.os then ct.tipoequipamento in (1,2) and no' +
        't (coalesce(ct.os_garantia,false) and ct.os_garantia_status='#39'A'#39')' +
        ' and not coalesce(ct.os_cortesia,false) else true end'
      ''
      '             %Devolucoes'
      ''
      '             %NCMIsentoPISCOFINS'
      ''
      '             %ProdutosComNFEmitida_Devolvido'
      ''
      
        '   ) as devolucoes left join clientesprodutos cp on devolucoes.c' +
        'liente = cp.cliente'
      
        '                                             and devolucoes.tipo' +
        'cliente = cp.tipocliente'
      '  '#9#9#9#9#9'     and devolucoes.produto = cp.produto'
      '  )'
      '  '
      ' union all  '
      ' '
      ' '
      ' /* servi'#231'os com devolu'#231#227'o em contratosdevolvidos */'
      ' '
      ' ('
      '  select devolucoes.*,'
      '       cast(null as integer) as maquina,'
      '       cast(null as integer) as intervensao,'
      '       cast(null as integer) as numerocupom,'
      '       cast(null as varchar(3)) as serie,'
      '       cast(null as integer) as numeronota,'
      '       cast(null as varchar(30)) as produto_cliente       '
      '  from'
      '  ('
      '   select ct.cliente,'
      '          ct.tipocliente,'
      '          ct.nome as nomecliente,'
      '          '
      '          ct.numero as contrato,'
      '          ct.pedidocliente,'
      '          cd.situacao,'
      '          ct.faturamento,'
      '          ct.filialvenda,'
      #9'      cast(null as integer) as dadofiscal,'
      #9'      cast(null as date) as data,'
      '          -cd.quantidade as quantidade,'
      '          cast(null as numeric(12,2)) as creditotroca,'
      '          cast(cd.servico as bigint) as produto,'
      '          cast(cd.servico as varchar(30)) as produtovisual,'
      '          cd.filial,'
      '          s.descricao,'
      
        '          -((cd.valorvista+cd.frete+cd.seguro+cd.desconto+cd.val' +
        'ordescontoitem)/cd.quantidade) as precovenda,'
      '          cast(null as numeric(15,2)) as precotabela,'
      
        '          -(cd.valorvista+cd.frete+cd.seguro+cd.desconto+cd.valo' +
        'rdescontoitem) as totalprecovenda,'
      '          cast(null as numeric(15,2)) as totalprecotabela,'
      '          cd.devolucao,'
      '    '#9'  0.00 as desconto,'
      '          cast('#39'D'#39' as char) as registro,'
      '          cast(null as varchar(8)) as ncm          '
      ''
      '   from (contratos ct'
      '         join (contratosdevolvidos cd'
      '               join servicos s'
      '               on s.codigo = cd.servico)'
      '         on ct.numero = cd.contrato)'
      ''
      '   where :IncluirDevolucoes'
      '     and ct.situacao in ('#39'N'#39','#39'P'#39','#39'F'#39','#39'C'#39') '
      '     and cd.devolucao between (:DataInicial) and (:DataFinal)'
      '     and cd.tipo = '#39'D'#39
      
        '     and case when ct.os then ct.tipoequipamento in (1,2) and no' +
        't (coalesce(ct.os_garantia,false) and ct.os_garantia_status='#39'A'#39')' +
        ' and not coalesce(ct.os_cortesia,false) else true end'
      ''
      '             %Devolucoes_Servicos'
      ''
      '             %NCMIsentoPISCOFINS_Servicos'
      ''
      '             %ProdutosComNFEmitida_Devolvido'
      ''
      '   ) as devolucoes'
      '  )'
      ' '
      ''
      ' union all'
      ''
      ' ('
      '  select devolucoes.*,'
      '       cast(null as integer) as maquina,'
      '       cast(null as integer) as intervensao,'
      '       cast(null as integer) as numerocupom,'
      '       cast(null as varchar(3)) as serie,'
      '       cast(null as integer) as numeronota,'
      '       cp.produto_cliente'
      '  from'
      '  ('
      '   select np.fornecedor as cliente,'
      '          np.tipofornecedor as tipocliente,'
      '          vf.nome as nomecliente,'
      '          np.contrato,'
      '          cast(null as varchar(35)) as pedidocliente,'
      '          np.situacao,'
      '          np.data as faturamento,'
      '          np.filial as filialvenda,'
      #9'      cast(null as integer) as dadofiscal,'
      #9'      cast(null as date) as data,'
      '          -pnp.quantidade as quantidade,'
      '          cast(null as numeric(12,2)) as creditotroca,'
      '          pnp.produto,'
      '          p.codigovisual as produtovisual,'
      '          np.filial,'
      
        '          cast(btrim(p.descricao ||'#39' '#39'||coalesce(p.valorgrade1,'#39 +
        #39')||'#39' '#39'||coalesce(p.valorgrade2,'#39#39')) as varchar(162)) as descric' +
        'ao,'
      '          -pnp.precounitario as precovenda,'
      '          cast(null as numeric(15,2)) as precotabela,'
      
        '          -pnp.precounitario * pnp.quantidade as totalprecovenda' +
        ','
      '          cast(null as numeric(15,2)) as totalprecotabela,'
      '          np.data as devolucao,'
      ''
      '          (coalesce(pnp.valordescontoitem,0) +'
      '           coalesce(pnp.desconto,0)) -'
      '           coalesce(pnp.acrescimo,0) as desconto,'
      ''
      ''
      '          cast('#39'D'#39' as char) as registro,'
      
        '          (select ipi.classificacaofiscal from ipi where ipi.cod' +
        'igo = c.ipi) as ncm'
      ''
      '            '
      '     from ((notaspag np'
      '           join vfornecedores vf'
      '           on np.fornecedor = vf.codigo and'
      '              np.tipofornecedor = vf.tipo)'
      ''
      '           join (produtosnotaspag pnp'
      
        #9#9' join ((produtos p left join promocoes pro on p.promocao = pro' +
        '.codigo)'
      #9#9'       join (((caracteristicas c'
      '                               join grupos g'
      '                               on c.grupo = g.codigo)'
      ''
      '                               join classes cl'
      '                               on c.classe = cl.codigo)'
      ''
      '                               join marcas m'
      '                               on c.marca = m.codigo)'
      ''
      '              '#9'       on c.codigo = p.caracteristica)'
      '                 on pnp.produto = p.codigo)'
      '           on pnp.codigonota = np.codigo)'
      ''
      ''
      '     Where :IncluirDevolucoes'
      
        '       and (np.data between (:DataInicial) and (:DataFinal) and ' +
        'np.situacao='#39'N'#39')'
      '       and np.contrato is null'
      '       and ehnotafiscalentradadevolucao(np.codigofiscal)'
      '       and :IncluirDevolucoesSemContrato'
      ''
      '             %Devolucoes_np'
      ''
      '             %NCMIsentoPISCOFINS'
      ''
      
        '   ) as devolucoes left join clientesprodutos cp on devolucoes.c' +
        'liente = cp.cliente'
      
        '                                             and devolucoes.tipo' +
        'cliente = cp.tipocliente'
      '  '#9#9#9#9#9'     and devolucoes.produto = cp.produto'
      '  )'
      '  '
      ''
      ''
      
        ' ) as produtosclientes  left join vfornecedores vf on produtoscl' +
        'ientes.cliente = vf.codigo and'
      
        '                                               produtosclientes.' +
        'tipocliente = vf.tipo'
      ''
      ') AS rpc'
      ''
      'ORDER BY UPPER(TO_ASCII(NomeCliente,'#39'LATIN1'#39')),'
      '         cliente,tipocliente,'
      '         '
      '         %Ordenacao')
    RequestLive = False
    Left = 328
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'Datainicial'
        ParamType = ptUnknown
        Value = #39'2008-01-01'#39
      end
      item
        DataType = ftString
        Name = 'DataFinal'
        ParamType = ptUnknown
        Value = #39'2008-01-15'#39
      end
      item
        DataType = ftUnknown
        Name = 'IncluirDevolucoes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IncluirDevolucoesSemContrato'
        ParamType = ptUnknown
      end>
    object qryRelatorioProdutosClientes_cliente: TIntegerField
      FieldName = 'cliente'
    end
    object qryRelatorioProdutosClientes_tipocliente: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
    object qryRelatorioProdutosClientes_nomecliente: TStringField
      FieldName = 'nomecliente'
      Size = 50
    end
    object qryRelatorioProdutosClientes_fone: TStringField
      FieldName = 'fone'
      Size = 50
    end
    object qryRelatorioProdutosClientes_contrato: TStringField
      FieldName = 'contrato'
    end
    object qryRelatorioProdutosClientes_pedidocliente: TStringField
      FieldName = 'pedidocliente'
      Size = 35
    end
    object qryRelatorioProdutosClientes_situacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
    object qryRelatorioProdutosClientes_faturamento: TDateField
      FieldName = 'faturamento'
    end
    object qryRelatorioProdutosClientes_filialvenda: TIntegerField
      FieldName = 'filialvenda'
    end
    object qryRelatorioProdutosClientes_dadofiscal: TIntegerField
      FieldName = 'dadofiscal'
    end
    object qryRelatorioProdutosClientes_data: TDateField
      FieldName = 'data'
    end
    object qryRelatorioProdutosClientes_quantidade: TFloatField
      FieldName = 'quantidade'
    end
    object qryRelatorioProdutosClientes_produto: TLargeintField
      FieldName = 'produto'
    end
    object qryRelatorioProdutosClientes_produtovisual: TStringField
      FieldName = 'produtovisual'
      Size = 30
    end
    object qryRelatorioProdutosClientes_filial: TIntegerField
      FieldName = 'filial'
    end
    object qryRelatorioProdutosClientes_descricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
    object qryRelatorioProdutosClientes_precovenda: TFloatField
      FieldName = 'precovenda'
    end
    object qryRelatorioProdutosClientes_precotabela: TFloatField
      FieldName = 'precotabela'
    end
    object qryRelatorioProdutosClientes_totalprecovenda: TFloatField
      FieldName = 'totalprecovenda'
    end
    object qryRelatorioProdutosClientes_totalprecotabela: TFloatField
      FieldName = 'totalprecotabela'
    end
    object qryRelatorioProdutosClientes_devolucao: TDateField
      FieldName = 'devolucao'
    end
    object qryRelatorioProdutosClientes_desconto: TFloatField
      FieldName = 'desconto'
    end
    object qryRelatorioProdutosClientes_registro: TStringField
      FieldName = 'registro'
      Size = 1
    end
    object qryRelatorioProdutosClientes_ncm: TStringField
      FieldName = 'ncm'
      Size = 8
    end
    object qryRelatorioProdutosClientes_maquina: TIntegerField
      FieldName = 'maquina'
    end
    object qryRelatorioProdutosClientes_intervensao: TIntegerField
      FieldName = 'intervensao'
    end
    object qryRelatorioProdutosClientes_numerocupom: TIntegerField
      FieldName = 'numerocupom'
    end
    object qryRelatorioProdutosClientes_serie: TStringField
      FieldName = 'serie'
      Size = 50
    end
    object qryRelatorioProdutosClientes_numeronota: TIntegerField
      FieldName = 'numeronota'
    end
    object qryRelatorioProdutosClientes_produto_cliente: TStringField
      FieldName = 'produto_cliente'
      Size = 30
    end
    object qryRelatorioProdutosClientes_rua: TStringField
      FieldName = 'rua'
      Size = 100
    end
    object qryRelatorioProdutosClientes_bairro: TStringField
      FieldName = 'bairro'
      Size = 80
    end
    object qryRelatorioProdutosClientes_cep: TIntegerField
      FieldName = 'cep'
    end
    object qryRelatorioProdutosClientes_cidade: TStringField
      FieldName = 'cidade'
      Size = 72
    end
    object qryRelatorioProdutosClientes_pessoanumero: TStringField
      FieldName = 'pessoanumero'
      Size = 14
    end
  end
  object fdsRelatorioProdutosClientes_: TfrDBDataSet
    DataSet = qryRelatorioProdutosClientes_
    OpenDataSource = False
    Left = 360
    Top = 144
  end
  object tecQuery1: TtecQuery
    Tag = -1
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    RequestLive = False
    Left = 88
    Top = 96
  end
end
