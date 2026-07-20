inherited dtmVerificacaoReservas: TdtmVerificacaoReservas
  OldCreateOrder = False
  Left = 766
  Top = 256
  Height = 349
  Width = 518
  object dsrReservasPrevias: TtecDataSource
    DataSet = qryReservasPrevias
    Left = 200
    Top = 56
  end
  object qryReservasPrevias: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnCalcFields = qryReservasPreviasCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'CondicaoFilial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CondicaoProduto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CondicaoCaracteristica'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CondicaoGrupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CondicaoClasse'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CondicaoMarca'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'resultadocurvaabc'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';'
      'select sel.*'
      ''
      'from'
      ''
      '('
      ''
      '('
      ''
      ''
      'select Cast('#39'Reservas Pr'#233'vias'#39' as varchar(20)) as identificacao,'
      '       e.produto,'
      '       p.codigovisual as produtovisual,'
      '       p.descricao,'
      '       p.resultadocurvaabc,'
      '       e.filial,'
      '       e.emestoque,'
      '       e.reservaprevia as quantidade,'
      ''
      '       (Select sum(qtdepedida)'
      '        from pedidosfiliais'
      '        where pedidosfiliais.produto=e.produto'
      '          and pedidosfiliais.requisitada=e.filial'
      '          and pedidosfiliais.situacao='#39'A'#39') as quantidadepf,'
      ''
      '       false as marcar'
      ''
      'from estoques e, (produtos p'
      '                  join (((caracteristicas c'
      '                          join grupos g'
      '                          on c.grupo = g.codigo)'
      '                          join classes cl'
      '                          on c.classe = cl.codigo)'
      '                          join marcas m'
      '                          on c.marca = m.codigo)'
      '                  on p.caracteristica = c.codigo), filiais f'
      ''
      'where p.codigo=e.produto'
      '  and e.filial = f.codigo'
      '  and abs(e.reservaprevia - coalesce((Select sum(qtdepedida)'
      '                                   from pedidosfiliais'
      
        '                                   where pedidosfiliais.produto=' +
        'e.produto'
      
        '                                     and pedidosfiliais.requisit' +
        'ada=e.filial'
      
        '                                     and pedidosfiliais.situacao' +
        '='#39'A'#39'),0))>0'
      ''
      '  and not coalesce(c.composto,false)'
      ''
      ''
      '  %CondicaoFilial'
      '  %CondicaoProduto'
      '  %CondicaoCaracteristica'
      '  %CondicaoGrupo'
      '  %CondicaoClasse'
      '  %CondicaoMarca'
      '  %resultadocurvaabc'
      ''
      ''
      'order by e.filial,p.resultadocurvaabc,e.produto'
      ''
      ')'
      ''
      'union all'
      ''
      '('
      ''
      ''
      'select Cast('#39'Tr'#226'nsito'#39' as varchar(20)) as identificacao,'
      '       e.produto,'
      '       p.codigovisual as produtovisual,'
      '       p.descricao,'
      '       p.resultadocurvaabc,'
      '       e.filial,'
      '       e.emestoque,'
      '       e.transito as quantidade,'
      ''
      '       (Select sum(pedidosfiliais.qtderecebida)'
      '        from pedidosfiliais'
      '        where pedidosfiliais.produto=e.produto'
      '          and pedidosfiliais.requisitante=e.filial'
      '          and pedidosfiliais.situacao='#39'F'#39') as quantidadepf,'
      ''
      '       false as marcar'
      ''
      'from estoques e, (produtos p'
      '                  join (((caracteristicas c'
      '                          join grupos g'
      '                          on c.grupo = g.codigo)'
      '                          join classes cl'
      '                          on c.classe = cl.codigo)'
      '                          join marcas m'
      '                          on c.marca = m.codigo)'
      '                  on p.caracteristica = c.codigo), filiais f'
      ''
      'where p.codigo=e.produto'
      '  and e.filial = f.codigo'
      '  and e.transito <>0'
      
        '  and abs(e.transito - coalesce((Select sum(pedidosfiliais.qtder' +
        'ecebida)'
      '                                   from pedidosfiliais'
      
        '                                   where pedidosfiliais.produto=' +
        'e.produto'
      
        '                                     and pedidosfiliais.requisit' +
        'ante=e.filial'
      
        '                                     and pedidosfiliais.situacao' +
        '='#39'F'#39'),0))>0'
      ''
      '  and not coalesce(c.composto,false)'
      ''
      '  %CondicaoFilial'
      '  %CondicaoProduto'
      '  %CondicaoCaracteristica'
      '  %CondicaoGrupo'
      '  %CondicaoClasse'
      '  %CondicaoMarca'
      '  %resultadocurvaabc'
      ''
      '  order by e.filial,p.resultadocurvaabc,e.produto'
      ''
      ''
      ')'
      ''
      ')  as sel'
      ''
      'order by identificacao, filial, resultadocurvaabc, produto')
    RequestLive = True
    Left = 96
    Top = 48
    object qryReservasPreviasidentificacao: TStringField
      FieldName = 'identificacao'
    end
    object qryReservasPreviasproduto: TLargeintField
      DisplayLabel = 'Produto'
      FieldName = 'produto'
      ReadOnly = True
      Visible = False
    end
    object qryReservasPreviasprodutovisual: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'produtovisual'
      ReadOnly = True
      Size = 30
    end
    object qryReservasPreviasdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 80
      FieldName = 'descricao'
      ReadOnly = True
      Size = 100
    end
    object qryReservasPreviasresultadocurvaabc: TStringField
      DisplayLabel = 'Curva ABC'
      DisplayWidth = 12
      FieldName = 'resultadocurvaabc'
      ReadOnly = True
      Size = 1
    end
    object qryReservasPreviasfilial: TIntegerField
      DisplayLabel = 'Filial'
      FieldName = 'filial'
      ReadOnly = True
    end
    object qryReservasPreviasemestoque: TFloatField
      DisplayLabel = 'Em Estoque'
      FieldName = 'emestoque'
      ReadOnly = True
    end
    object qryReservasPreviasquantidade: TFloatField
      DisplayLabel = 'Reserva Pr'#233'via/Tr'#226'nsito'
      DisplayWidth = 20
      FieldName = 'quantidade'
    end
    object qryReservasPreviasquantidadepf: TFloatField
      DisplayLabel = 'Pedida/Recebida'
      DisplayWidth = 15
      FieldName = 'quantidadepf'
    end
    object qryReservasPreviassaldo: TFloatField
      DisplayLabel = 'Saldo'
      FieldKind = fkCalculated
      FieldName = 'saldo'
      Calculated = True
    end
    object qryReservasPreviasmarcar: TBooleanField
      DisplayLabel = 'Marcar'
      FieldName = 'marcar'
    end
  end
  object qryReservadoFuturo: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnCalcFields = qryReservadoFuturoCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'CondicaoFilial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CondicaoProduto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CondicaoCaracteristica'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CondicaoGrupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CondicaoClasse'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CondicaoMarca'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'resultadocurvaabc'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select e.* from'
      '('
      'SELECT'
      '       e.produto'
      '     , e.produtovisual'
      '     , e.descricao'
      '     , e.resultadocurvaabc'
      '     , e.filial'
      '     , e.emestoque'
      '     , e.reservado'
      '     , e.futuro'
      '     , SUM(e.pendentes_emissao) AS  pendentes_emissao'
      '     , false as marcar'
      'FROM'
      '('
      ''
      'select e.*'
      'from'
      ''
      '('
      ''
      'select e.*,'
      ''
      '       (case when (not e.eHcomponente and not e.eHcomposto) or'
      '                  (not e.eHcomponente and e.eHcomposto) then'
      '                   '
      '                         (coalesce('
      '                          (SELECT sum(pc.quantidade-COALESCE('
      
        '                                                        (SELECT ' +
        'sum(ctd.quantidade)'
      
        '                                                         FROM co' +
        'ntratosdevolvidos ctd'
      
        '                                                         WHERE c' +
        'td.contrato = pc.contrato'
      
        '                                                           AND c' +
        'td.produto = pc.produto'
      
        '                                                           AND c' +
        'td.situacao='#39'F'#39
      
        '                                                           and c' +
        'td.tipo='#39'D'#39'), 0))'
      '                    FROM produtoscontratos pc'
      '                    JOIN contratos ct ON pc.contrato = ct.numero'
      '                    WHERE pc.produto = e.produto'
      '                      AND pc.filial = e.filial'
      '                      AND ct.primogenito IS NULL'
      
        '                      AND ct.situacao IN ('#39'R'#39', '#39'F'#39', '#39'N'#39', '#39'P'#39')),0' +
        ') - coalesce('
      
        '                                                                ' +
        '               (SELECT sum(pdf.quantidade)'
      
        '                                                                ' +
        '                FROM produtoscontratos pc, contratos ct, produto' +
        'sdadosfiscais pdf, dadosfiscais df'
      
        '                                                                ' +
        '                WHERE pc.contrato = ct.numero'
      
        '                                                                ' +
        '                  AND ct.numero = df.contrato'
      
        '                                                                ' +
        '                  AND pc.produto = pdf.produto'
      
        '                                                                ' +
        '                  AND pc.filial = pdf.filial'
      
        '                                                                ' +
        '                  AND df.numero = pdf.dadofiscal'
      
        '                                                                ' +
        '                  AND pc.produto = e.produto'
      
        '                                                                ' +
        '                  AND pc.filial = e.filial'
      
        '                                                                ' +
        '                  AND ct.situacao IN ('#39'R'#39', '#39'F'#39', '#39'N'#39', '#39'P'#39')'
      
        '                                                                ' +
        '                  AND df.situacao = '#39'N'#39
      
        '                                                                ' +
        '                  and mod(df.codigofiscal,1000) <> 922 ),0))'
      
        '                                                                ' +
        '                     '
      '            when e.eHcomponente and not e.eHcomposto then '
      '            '
      '(coalesce('
      
        '                                             (SELECT sum( (pc.qu' +
        'antidade * pco.quantidade)'
      
        '                                                                ' +
        '                                                  '
      
        '                                                          -     ' +
        '                                        '
      
        '                                                                ' +
        '                 COALESCE('
      
        '                                                                ' +
        '                  (SELECT sum(ctd.quantidade*pcod.quantidade)'
      
        '                                                                ' +
        '                   FROM contratosdevolvidos ctd,'
      
        '                                                                ' +
        '                        produtoscompostos pcod'
      ''
      
        '                                                                ' +
        '                   WHERE ctd.contrato = pc.contrato'
      
        '                                                                ' +
        '                     AND ctd.produto = pc.produto'
      
        '                                                                ' +
        '                     and pcod.composto = e.composto'
      
        '                                                                ' +
        '                     and pcod.componente = e.produto'
      
        '                                                                ' +
        '                     AND ctd.situacao='#39'F'#39
      
        '                                                                ' +
        '                     and ctd.tipo='#39'D'#39'), 0))'
      ''
      
        '                                              FROM produtoscontr' +
        'atos pc,'
      
        '                                                   produtoscompo' +
        'stos pco,'
      '                                                   contratos ct'
      ''
      
        '                                              WHERE pc.contrato ' +
        '= ct.numero'
      
        '                                                and pc.produto =' +
        ' e.composto'
      
        '                                                and pco.composto' +
        ' = e.composto'
      
        '                                                and pco.componen' +
        'te = e.produto'
      ''
      
        '                                                AND pc.filial = ' +
        'e.filial'
      
        '                                                AND ct.primogeni' +
        'to IS NULL'
      
        '                                                AND ct.situacao ' +
        'IN ('#39'R'#39', '#39'F'#39', '#39'N'#39', '#39'P'#39')),0) - coalesce('
      
        '                                                                ' +
        '                                         (SELECT sum(pdfco.quant' +
        'idade)'
      
        '                                                                ' +
        '                                          FROM produtoscontratos' +
        ' pc,'
      
        '                                                                ' +
        '                                               contratos ct,'
      
        '                                                                ' +
        '                                               produtosdadosfisc' +
        'ais pdf,'
      
        '                                                                ' +
        '                                               produtosdadosfisc' +
        'aiscompostos pdfco,'
      
        '                                                                ' +
        '                                               dadosfiscais df'
      ''
      
        '                                                                ' +
        '                                          WHERE pc.contrato = ct' +
        '.numero'
      
        '                                                                ' +
        '                                            AND ct.numero = df.c' +
        'ontrato'
      
        '                                                                ' +
        '                                            AND pc.produto = e.c' +
        'omposto'
      
        '                                                                ' +
        '                                            AND pc.filial = pdf.' +
        'filial'
      
        '                                                                ' +
        '                                            AND df.numero = pdf.' +
        'dadofiscal'
      
        '                                                                ' +
        '                                            and pdf.dadofiscal =' +
        ' pdfco.dadofiscal'
      
        '                                                                ' +
        '                                            and pdfco.componente' +
        ' = e.produto'
      
        '                                                                ' +
        '                                            and pdf.produto = e.' +
        'composto'
      
        '                                                                ' +
        '                                            AND pc.produto = e.c' +
        'omposto'
      
        '                                                                ' +
        '                                            AND pc.filial = e.fi' +
        'lial'
      
        '                                                                ' +
        '                                            AND ct.situacao IN (' +
        #39'R'#39', '#39'F'#39', '#39'N'#39', '#39'P'#39')'
      
        '                                                                ' +
        '                                            AND df.situacao = '#39'N' +
        #39
      
        '                                                                ' +
        '                                            and mod(df.codigofis' +
        'cal,1000) <> 922),0))'
      ''
      ''
      
        '                                                                ' +
        '                                            +'
      ''
      ''
      ''
      ''
      '                         (coalesce('
      '                          (SELECT sum(pc.quantidade-COALESCE('
      
        '                                                        (SELECT ' +
        'sum(ctd.quantidade)'
      
        '                                                         FROM co' +
        'ntratosdevolvidos ctd'
      
        '                                                         WHERE c' +
        'td.contrato = pc.contrato'
      
        '                                                           AND c' +
        'td.produto = pc.produto'
      
        '                                                           AND c' +
        'td.situacao='#39'F'#39
      
        '                                                           and c' +
        'td.tipo='#39'D'#39'), 0))'
      '                    FROM produtoscontratos pc'
      '                    JOIN contratos ct ON pc.contrato = ct.numero'
      '                    WHERE pc.produto = e.produto'
      '                      AND pc.filial = e.filial'
      '                      AND ct.primogenito IS NULL'
      
        '                      AND ct.situacao IN ('#39'R'#39', '#39'F'#39', '#39'N'#39', '#39'P'#39')),0' +
        ') - coalesce('
      
        '                                                                ' +
        '               (SELECT sum(pdf.quantidade)'
      
        '                                                                ' +
        '                FROM produtoscontratos pc, contratos ct, produto' +
        'sdadosfiscais pdf, dadosfiscais df'
      
        '                                                                ' +
        '                WHERE pc.contrato = ct.numero'
      
        '                                                                ' +
        '                  AND ct.numero = df.contrato'
      
        '                                                                ' +
        '                  AND pc.produto = pdf.produto'
      
        '                                                                ' +
        '                  AND pc.filial = pdf.filial'
      
        '                                                                ' +
        '                  AND df.numero = pdf.dadofiscal'
      
        '                                                                ' +
        '                  AND pc.produto = e.produto'
      
        '                                                                ' +
        '                  AND pc.filial = e.filial'
      
        '                                                                ' +
        '                  AND ct.situacao IN ('#39'R'#39', '#39'F'#39', '#39'N'#39', '#39'P'#39')'
      
        '                                                                ' +
        '                  AND df.situacao = '#39'N'#39
      
        '                                                                ' +
        '                  and mod(df.codigofiscal,1000) <> 922),0))'
      ''
      ''
      '            end) AS pendentes_emissao'
      ''
      ''
      'from'
      '('
      ''
      '('
      ''
      
        'select pco.composto, e.produto, p.codigovisual as produtovisual,' +
        ' p.descricao, p.resultadocurvaabc, e.filial, e.emestoque, e.rese' +
        'rvado, e.futuro, true as ehComponente, false as ehComposto'
      'from estoques e'
      ''
      '     join (produtos p'
      '           join (((caracteristicas c'
      '                   join grupos g'
      '                   on c.grupo = g.codigo)'
      '                   join classes cl'
      '                   on c.classe = cl.codigo)'
      '                   join marcas m'
      '                   on c.marca = m.codigo)'
      '          on p.caracteristica = c.codigo)'
      ''
      '          join produtoscompostos pco'
      '          on p.codigo = pco.componente'
      ''
      '     on e.produto = p.codigo'
      ''
      '     join filiais f'
      '     on e.filial = f.codigo'
      ''
      ''
      'WHERE (e.reservado > 0'
      '       OR e.futuro > 0)'
      '  and not coalesce(c.composto,false)'
      ''
      ''
      '  %CondicaoFilial'
      '  %CondicaoProduto'
      '  %CondicaoCaracteristica'
      '  %CondicaoGrupo'
      '  %CondicaoClasse'
      '  %CondicaoMarca'
      '  %resultadocurvaabc'
      ''
      ''
      ')'
      ''
      'union all'
      ''
      '('
      ''
      
        'select pco.composto, e.produto, p.codigovisual as produtovisual,' +
        ' p.descricao, p.resultadocurvaabc, e.filial, e.emestoque, e.rese' +
        'rvado, e.futuro, false as eHComponente, true as eHComposto'
      'from estoques e'
      '          join (produtos p'
      '           join (((caracteristicas c'
      '                   join grupos g'
      '                   on c.grupo = g.codigo)'
      '                   join classes cl'
      '                   on c.classe = cl.codigo)'
      '                   join marcas m'
      '                   on c.marca = m.codigo)'
      '          on p.caracteristica = c.codigo)'
      ''
      '          join produtoscompostos pco'
      '          on p.codigo = pco.composto'
      ''
      '     on e.produto = p.codigo'
      ''
      '     join filiais f'
      '     on e.filial = f.codigo'
      ''
      ''
      ''
      'WHERE false and (e.reservado > 0'
      '       OR e.futuro > 0)'
      '  and coalesce(c.composto,false)'
      ''
      '  %CondicaoFilial'
      '  %CondicaoProduto'
      '  %CondicaoCaracteristica'
      '  %CondicaoGrupo'
      '  %CondicaoClasse'
      '  %CondicaoMarca'
      '  %resultadocurvaabc'
      ''
      ''
      ')'
      ''
      'union all'
      ''
      '('
      ''
      
        'select e.produto as composto, e.produto, p.codigovisual as produ' +
        'tovisual, p.descricao, p.resultadocurvaabc, e.filial, e.emestoqu' +
        'e, e.reservado, e.futuro, false as eHComponente, false as eHComp' +
        'osto'
      'from estoques e'
      ''
      '          join (produtos p'
      '           join (((caracteristicas c'
      '                   join grupos g'
      '                   on c.grupo = g.codigo)'
      '                   join classes cl'
      '                   on c.classe = cl.codigo)'
      '                   join marcas m'
      '                   on c.marca = m.codigo)'
      '          on p.caracteristica = c.codigo)'
      ''
      '     on e.produto = p.codigo'
      ''
      '     join filiais f'
      '     on e.filial = f.codigo'
      ''
      ''
      'WHERE (e.reservado > 0'
      '       OR e.futuro > 0)'
      '  and not coalesce(c.composto,false)'
      ''
      '  /*'
      '  and not exists (select pc.componente'
      '              from produtoscompostos pc'
      
        '              where pc.composto = e.produto or pc.componente = e' +
        '.produto limit 1)'
      '              */'
      ''
      ''
      ''
      '  %CondicaoFilial'
      '  %CondicaoProduto'
      '  %CondicaoCaracteristica'
      '  %CondicaoGrupo'
      '  %CondicaoClasse'
      '  %CondicaoMarca'
      '  %resultadocurvaabc'
      ''
      ''
      ')'
      '                     ) as e'
      '       )'
      '       as e'
      ') AS e       '
      'group by'
      '       e.produto'
      '     , e.produtovisual'
      '     , e.descricao'
      '     , e.resultadocurvaabc'
      '     , e.filial'
      '     , e.emestoque'
      '     , e.reservado'
      '     , e.futuro'
      ') as e'
      '       '
      'where '
      '       (       '
      '              e.reservado + e.futuro'
      '       )'
      '       > pendentes_emissao')
    RequestLive = True
    Left = 80
    Top = 152
    object qryReservadoFuturoproduto: TLargeintField
      DisplayLabel = 'Produto'
      FieldName = 'produto'
      ReadOnly = True
      Required = True
      Visible = False
    end
    object qryReservadoFuturoprodutovisual: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'produtovisual'
      ReadOnly = True
      Size = 30
    end
    object qryReservadoFuturodescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 80
      FieldName = 'descricao'
      ReadOnly = True
      Required = True
      Size = 100
    end
    object qryReservadoFuturoresultadocurvaabc: TStringField
      DisplayLabel = 'Curva ABC'
      DisplayWidth = 10
      FieldName = 'resultadocurvaabc'
      ReadOnly = True
      Size = 1
    end
    object qryReservadoFuturofilial: TIntegerField
      DisplayLabel = 'Filial'
      FieldName = 'filial'
      ReadOnly = True
      Required = True
    end
    object qryReservadoFuturoemestoque: TFloatField
      DisplayLabel = 'em Estoque'
      FieldName = 'emestoque'
      ReadOnly = True
      Required = True
    end
    object qryReservadoFuturoreservado: TFloatField
      DisplayLabel = 'Reservado'
      FieldName = 'reservado'
      ReadOnly = True
      Required = True
    end
    object qryReservadoFuturofuturo: TFloatField
      DisplayLabel = 'Futuro'
      DisplayWidth = 15
      FieldName = 'futuro'
      ReadOnly = True
      Required = True
    end
    object qryReservadoFuturopendentes_emissao: TFloatField
      DisplayLabel = 'Pendentes'
      DisplayWidth = 20
      FieldName = 'pendentes_emissao'
      ReadOnly = True
    end
    object qryReservadoFuturoSaldoReservadoFuturo: TFloatField
      DisplayLabel = 'Saldo Reservado/Futuro'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'SaldoReservadoFuturo'
      ReadOnly = True
      Calculated = True
    end
    object qryReservadoFuturomarcar: TBooleanField
      DisplayLabel = 'Marcar'
      FieldName = 'marcar'
    end
  end
  object dsrReservadoFuturo: TtecDataSource
    DataSet = qryReservadoFuturo
    Left = 200
    Top = 136
  end
end
