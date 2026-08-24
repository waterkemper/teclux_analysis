object fraSelecaoAleatoriaItemdeProdutos: TfraSelecaoAleatoriaItemdeProdutos
  Left = 0
  Top = 0
  Width = 559
  Height = 386
  TabOrder = 0
  inline fraSelecaoAleatoriaItemdeProduto: TfraSelecaoAleatoria
    Left = 0
    Top = 0
    Width = 559
    Height = 366
    HorzScrollBar.Range = 26
    Align = alClient
    AutoScroll = False
    TabOrder = 0
    inherited Splitter1: TSplitter
      Left = 524
      Height = 352
      Align = alRight
    end
    inherited dbgSelecaoAleatoria: TtecDBGrid
      Width = 524
      Height = 352
      Align = alClient
      OnDblClick = fraSelecaoAleatoriaItemdeProdutodbgSelecaoAleatoriaDblClick
      OnKeyDown = fraSelecaoAleatoriaItemdeProdutodbgSelecaoAleatoriaKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'codigo'
          Title.Alignment = taCenter
          Title.Caption = 'Item'
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Width = 184
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'campo'
          PickList.Strings = (
            'codigo'
            'descricao')
          Title.Caption = 'Aplicar a'
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'opcomparacao'
          PickList.Strings = (
            '= Igual a'
            '<> Diferente de'
            '>= Maior ou Igual a'
            '<= Menor ou Igual a'
            '> Maior que'
            '< Menor que'
            'Cont'#233'm'
            'N'#227'o Cont'#233'm'
            'Contido na Lista'
            'n'#227'o Contido na Lista')
          Title.Alignment = taCenter
          Title.Caption = 'Condi'#231#227'o'
          Width = 115
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'oplogico'
          PickList.Strings = (
            'e'
            'ou')
          Title.Alignment = taCenter
          Title.Caption = 'L'#243'gica'
          Width = 41
          Visible = True
        end>
    end
    inherited pnlLabels: TPanel
      Left = 527
      Width = 32
      Height = 352
      Align = alRight
      inherited sbnProcura: TSpeedButton
        Left = 7
        OnClick = fraSelecaoAleatoriaItemdeProdutosbnProcuraClick
      end
      inherited sbnExcluir: TSpeedButton
        Left = 7
      end
      inherited sbnExcluirTodos: TSpeedButton
        Left = 7
      end
      inherited sbnIncluirItem: TSpeedButton
        Left = 7
      end
    end
    inherited pnlAbaixo: TPanel
      Top = 352
      Width = 559
      Height = 14
      inherited pnlAbaixoDireita: TPanel
        Left = 528
        Height = 14
        Caption = '<<<'
        Visible = True
        OnClick = fraSelecaoAleatoriaItemdeProdutopnlAbaixoDireitaClick
      end
    end
    inherited qrySelecaoAleatoria: TtecQuery
      AfterOpen = fraSelecaoAleatoriaItemdeProdutoqrySelecaoAleatoriaAfterOpen
      OnNewRecord = fraSelecaoAleatoriaItemdeProdutoqrySelecaoAleatoriaNewRecord
      Sql.Strings = (
        'SELECT  cast(null as char(18)) as Codigo,'
        '               cast(null as varchar(162)) as descricao,'
        '               cast(null as varchar(10)) as campo,'
        '            cast(null as varchar(20)) as opcomparacao,'
        '            cast(null as varchar(2)) as oplogico')
    end
  end
  object pnlParametros: TPanel
    Left = 0
    Top = 366
    Width = 559
    Height = 20
    Align = alBottom
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Constraints.MaxHeight = 20
    Constraints.MinHeight = 20
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Visible = False
    object ckbProdutosComAgendamento: TCheckBox
      Left = 8
      Top = 0
      Width = 161
      Height = 17
      Caption = 'Produtos com Agendamento'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      OnClick = ckbProdutosComAgendamentoClick
    end
    object ckbIncluirSimilaresnaLista: TCheckBox
      Left = 208
      Top = 0
      Width = 97
      Height = 17
      Caption = 'Incluir Similares'
      Color = clBtnFace
      Constraints.MaxHeight = 17
      Constraints.MinHeight = 17
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 1
    end
  end
  object qryProdutosSimilares: TtecQuery
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
        Name = 'CondicaoProduto'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      '/* EXPLAIN (FORMAT JSON)*/'
      ''
      ''
      
        'select distinct /*case when pssel.codigo = :produto then 0 else ' +
        '1 end as ordenacaoproduto,*/ pssel.*,'
      
        '    /* Para a verifica'#231#227'o da qtidade de similar do similar relac' +
        'ionado ao selecionado faz-se igual a selecao do selecionado */'
      ''
      ''
      '                 case when pssel.grade1 is not null then'
      
        '                   (select g.descricao from grades g where g.cod' +
        'igo = pssel.grade1)'
      '                 else'
      '                   cast(null as varchar(40)) end as linha,'
      '                   '
      '                 case when pssel.grade2 is not null then'
      
        '                   (select g.descricao from grades g where g.cod' +
        'igo = pssel.grade2)'
      '                 else'
      '                   cast(null as varchar(40)) end as coluna,'
      ''
      ''
      '    '
      ''
      '     ('
      '      select count(*) from'
      '         ( '
      '      '
      '           ('
      '             '
      '             select ps.codigo as ps_codigo'
      '                    '
      '                    '
      '             from (produtos ps '
      '                   join caracteristicas cs '
      '                   on ps.caracteristica = cs.codigo),'
      '             '
      '             ('
      '             '
      '               select distinct'
      '                     psel.codigo as psel_codigo,'
      '                     psel.caracteristica as psel_caracteristica,'
      
        '                     psel.agrupamentosimilares as psel_agrupamen' +
        'tosimilares,'
      '                     psel.grade1 as psel_grade1,'
      '                     psel.grade2 as psel_grade2,'
      '                     psel.valorgrade1 as psel_valorgrade1,'
      '                     psel.valorgrade2 as psel_valorgrade2,'
      '                     s."similar"'
      '                   '
      '               from similares s right outer join'
      '                '
      '                     ('
      '                     select p.codigo, '
      '                            p.caracteristica, '
      '                            c.agrupamentosimilares,'
      '                            c.grade1,'
      '                            c.grade2,'
      '                            p.valorgrade1,'
      '                            p.valorgrade2'
      '                            '
      '                     from produtos p '
      '                          join caracteristicas c'
      '                           on p.caracteristica = c.codigo'
      '                     where p.codigo = pssel.codigo '
      '                     ) as psel'
      '                     '
      '               on s.caracteristica = psel.caracteristica'
      '             ) as psel_similar'
      ''
      '            where (ps.caracteristica = psel_similar.similar or '
      
        '                   ps.caracteristica  = psel_similar.psel_caract' +
        'eristica)'
      '                  '
      '              /*and ps.codigo <> psel_similar.psel_codigo*/'
      '              '
      '              and ((ps.inativo IS NULL) OR '
      '                   (ps.inativo>CURRENT_DATE))'
      '                   '
      
        '              and case when coalesce(psel_agrupamentosimilares, ' +
        #39#39') = '#39'L'#39
      '                           AND psel_grade1 IS NOT NULL'
      
        '                           AND psel_valorgrade1 IS NOT NULL  the' +
        'n '
      '                           '
      '                              ps.valorgrade1 = psel_valorgrade1'
      '                              and cs.grade1 = psel_grade1'
      '                           '
      '                           '
      
        '                       when coalesce(psel_agrupamentosimilares, ' +
        #39#39') = '#39'C'#39
      '                           AND psel_grade2 IS NOT NULL'
      
        '                           AND psel_valorgrade2 IS NOT NULL  the' +
        'n  '
      '                           '
      '                             ps.valorgrade2 = psel_valorgrade2'
      '                             and cs.grade2 = psel_grade2'
      '                           '
      '                  else true end     '
      '              '
      '             )'
      ''
      '              union all'
      '              '
      '             ('
      '               SELECT ps."similar" as ps_codigo'
      '               FROM produtos_similares ps'
      '               WHERE ps.produto = pssel.codigo'
      '             '
      '              )'
      '              '
      '            ) as ps'
      '           ) as similares'
      '           '
      '           '
      '  from'
      '  (  '
      ''
      ''
      '    select pssel.*,'
      '    '
      '          CASE'
      '              WHEN coalesce(valorpromocao, 0)=0 THEN'
      '                     (SELECT valor'
      '                      FROM colunasprecos'
      
        '                      WHERE (colunasprecos.caracteristica = psse' +
        'l.caracteristica)'
      '                        AND (colunasprecos.preco = pssel.preco)'
      
        '                        AND (colunasprecos.coluna = pssel.precon' +
        'ormal))'
      '              ELSE coalesce(pssel.valorpromocao, 0)'
      '          END AS valorproduto,'
      ''
      '          pedidos_estoquepedido(codigo,filial) as pedido'
      '    '
      '   '
      '    from'
      '    ('
      '        select ps.*,'
      '                 e.filial,'
      '                 e.emestoque,'
      '                 e.reservado,'
      '                 e.futuro,'
      '                 f.preconormal,'
      '                 '
      '                 CASE'
      '                     WHEN f.precopromocao IS NOT NULL THEN'
      '                            (SELECT valor'
      '                             FROM colunasprecos'
      
        '                             WHERE (colunasprecos.caracteristica' +
        ' = ps.caracteristica)'
      
        '                               AND (colunasprecos.preco = ps.pre' +
        'co)'
      
        '                               AND (colunasprecos.coluna = f.pre' +
        'copromocao)'
      
        '                               AND (colunasprecos.validade >= no' +
        'w()))'
      '                 END AS valorpromocao'
      '                 '
      '                 '
      '                 '
      '        from'
      '        ('
      '         '
      '         '
      '          SELECT p.descricao,'
      '                 p.valorgrade1,'
      '                 p.valorgrade2,'
      '                 c.grade1,'
      '                 c.grade2,'
      '                 '
      '                '
      '                 p.codigo,'
      '                 p.codigovisual,'
      '                 p.caracteristica,'
      '                 p.preco,'
      '                 '
      '                 '
      '                 c.unidade,'
      '                 c.brinde,'
      '                 c.agrupamentosimilares as agrupamentosimilares'
      '                 '
      '         '
      '         from'
      '         ('
      '      '
      '           ('
      '             '
      '             select ps.codigo as ps_codigo'
      '                    '
      '                    '
      '             from (produtos ps '
      '                   join caracteristicas cs '
      '                   on ps.caracteristica = cs.codigo),'
      '             '
      '             ('
      '             '
      '               select distinct'
      '                     psel.codigo as psel_codigo,'
      '                     psel.caracteristica as psel_caracteristica,'
      
        '                     psel.agrupamentosimilares as psel_agrupamen' +
        'tosimilares,'
      '                     psel.grade1 as psel_grade1,'
      '                     psel.grade2 as psel_grade2,'
      '                     psel.valorgrade1 as psel_valorgrade1,'
      '                     psel.valorgrade2 as psel_valorgrade2,'
      '                     s."similar"'
      '                   '
      '              from similares s right outer join'
      '                '
      '                     ('
      '                     select p.codigo, '
      '                            p.caracteristica, '
      '                            c.agrupamentosimilares,'
      '                            c.grade1,'
      '                            c.grade2,'
      '                            p.valorgrade1,'
      '                            p.valorgrade2'
      '                            '
      '                     from produtos p '
      '                          join caracteristicas c'
      '                           on p.caracteristica = c.codigo'
      '                     where true'
      '                       and %CondicaoProduto'
      '                       '
      '                     ) as psel'
      '                     '
      '               on s.caracteristica = psel.caracteristica'
      '             ) as psel_similar'
      '              '
      '            where (ps.caracteristica = psel_similar.similar or '
      
        '                   ps.caracteristica  = psel_similar.psel_caract' +
        'eristica)'
      '                  '
      '              /* and ps.codigo <> psel_similar.psel_codigo */'
      '              '
      '              and ((ps.inativo IS NULL) OR '
      '                   (ps.inativo>CURRENT_DATE))'
      '                   '
      
        '              and case when coalesce(psel_agrupamentosimilares, ' +
        #39#39') = '#39'L'#39
      '                           AND psel_grade1 IS NOT NULL'
      
        '                           AND psel_valorgrade1 IS NOT NULL  the' +
        'n '
      '                           '
      '                              ps.valorgrade1 = psel_valorgrade1'
      '                              and cs.grade1 = psel_grade1'
      '                           '
      '                           '
      
        '                       when coalesce(psel_agrupamentosimilares, ' +
        #39#39') = '#39'C'#39
      '                           AND psel_grade2 IS NOT NULL'
      
        '                           AND psel_valorgrade2 IS NOT NULL  the' +
        'n  '
      '                           '
      '                             ps.valorgrade2 = psel_valorgrade2'
      '                             and cs.grade2 = psel_grade2'
      '                           '
      '                  else true end     '
      '              '
      '             )'
      ''
      '              union all'
      '              '
      '             ('
      '               SELECT ps."similar" as ps_codigo'
      '               FROM produtos_similares ps'
      '                    join produtos p'
      '                    on ps.produto = p.codigo'
      '               WHERE true'
      '                 and %CondicaoProduto'
      '             '
      '              )'
      '              '
      
        '            ) as ps, produtos p, /*((*/ caracteristicas c  /*lef' +
        't join grades g1 on c.grade1 = g1.codigo)'
      
        '                                                      left join ' +
        'grades g2 on c.grade2 = g2.codigo) */'
      '                                                      '
      ''
      '        where  ps.ps_codigo = p.codigo'
      '          and p.caracteristica = c.codigo'
      '          '
      '          '
      '        ) as ps,  estoques e, filiais f   '
      '        where e.produto = ps.codigo      '
      '          and e.filial = f.codigo'
      
        '          and case when parametros_valor('#39'Mostrar Estoque Filiai' +
        's Similares'#39', e.filial)='#39'True'#39
      '                   then true'
      '                   else f.codigo = :filialbase'
      '                   end'
      '          '
      '    )  as pssel'
      ''
      '  ) as pssel'
      ''
      'WHERE (valorproduto > 0)'
      'ORDER BY 1, valorproduto'
      ''
      ''
      ''
      ''
      '')
    RequestLive = False
    Left = 248
    Top = 192
    ParamData = <
      item
        DataType = ftString
        Name = 'produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FilialBase'
        ParamType = ptUnknown
      end>
  end
end
