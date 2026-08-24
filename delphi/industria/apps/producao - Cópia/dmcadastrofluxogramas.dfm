inherited dtmCadastroFluxoGramas: TdtmCadastroFluxoGramas
  Left = 602
  Top = 209
  Height = 349
  Width = 553
  object qryFluxoGramas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryFluxoGramasAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select *'
      'from fluxogramas'
      'where    codigo = :codigo')
    RequestLive = True
    Left = 72
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryFluxoGramascodigo: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'codigo'
    end
    object qryFluxoGramasdescricao: TStringField
      DisplayLabel = 'descri'#231#227'o'
      FieldName = 'descricao'
      Required = True
      Size = 40
    end
    object qryFluxoGramastitulocusto: TStringField
      FieldName = 'titulocusto'
      Size = 50
    end
    object qryFluxoGramascorplanilhacusto: TStringField
      FieldName = 'corplanilhacusto'
    end
  end
  object dsrFluxoGramas: TtecDataSource
    DataSet = qryFluxoGramas
    Left = 104
    Top = 32
  end
  object qryFluxoGramasProximo: TtecQuery
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
      ';'
      'select coalesce(max(codigo),0)+1 as codigo'
      'from fluxogramas')
    RequestLive = True
    Left = 224
    Top = 16
    object qryFluxoGramasProximocodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object qryFluxoGramasOperacoes: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryFluxoGramasOperacoesAfterOpen
    AfterClose = qryFluxoGramasOperacoesAfterClose
    AfterEdit = qryFluxoGramasOperacoesAfterEdit
    AfterPost = qryFluxoGramasOperacoesAfterPost
    BeforeDelete = qryFluxoGramasOperacoesBeforeDelete
    AfterDelete = qryFluxoGramasOperacoesAfterDelete
    AfterScroll = qryFluxoGramasOperacoesAfterScroll
    OnNewRecord = qryFluxoGramasOperacoesNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT fo.*,'
      '       o.Nome,'
      '       o.C01, o.C02, o.C03,'
      '       o.Descricao,'
      ''
      '       TempoPadrao(fo.Operacao, CURRENT_DATE) AS TempoPadrao,'
      ''
      '       cast(case when fo.tipooperacao = '#39'A'#39'  then '#39'A'#39
      '       else case when (select fo2.tipooperacao'
      '                       from fluxogramasoperacoes fo2'
      '                       where fo2.fluxograma = fo.fluxograma'
      
        '                         and cast(fo2.sequencia as numeric) > ca' +
        'st(fo.sequencia as numeric)'
      
        '                       order by cast(fo2.sequencia as numeric) l' +
        'imit 1) = '#39'A'#39' then '#39'A'#39' else '#39' '#39' end end ||'
      #9#9#9#9#9
      '       case when fo.operacaoconjugada then '#39'C'#39
      '       else case when coalesce((select fo2.Operacaoconjugada'
      '                                from fluxogramasoperacoes fo2'
      
        '                                where fo2.fluxograma = fo.fluxog' +
        'rama'
      
        '                                  and cast(fo2.sequencia as nume' +
        'ric) > cast(fo.sequencia as numeric)'
      
        '                                  order by cast(fo2.sequencia as' +
        ' numeric) limit 1),false) then '#39'c'#39
      '       else case when fo.OperacaoemGrupoComAnterior then '#39'G'#39
      
        '       else case when coalesce((select fo2.OperacaoemGrupoComAnt' +
        'erior'
      '                                from fluxogramasoperacoes fo2'
      
        '                                where fo2.fluxograma = fo.fluxog' +
        'rama'
      
        '                                  and cast(fo2.sequencia as nume' +
        'ric) > cast(fo.sequencia as numeric)'
      
        '                                  order by cast(fo2.sequencia as' +
        ' numeric) limit 1),false) then '#39'g'#39' else '#39' '#39' end end end end ||'
      #9#9#9#9#9#9#9#9
      
        '       case when coalesce(fo.informarterminodoprocesso,false) th' +
        'en '#39'T'#39' else '#39' '#39' end as varchar(3)) as tipo,'
      ''
      '       coalesce((select case when fo2.tipooperacao = '#39'N'#39' and'
      
        '                                  not coalesce(fo2.operacaoemgru' +
        'pocomanterior,false) and'
      '                                  fo.tipooperacao = '#39'N'#39' and'
      
        '                                  not coalesce(fo.OperacaoemGrup' +
        'oComAnterior,false)'
      
        '                                  and fo.operacao not in (select' +
        ' fo3.origemoperacaoalternativa'
      
        '                                                          from f' +
        'luxogramasoperacoes fo3'
      
        '                                                          where ' +
        ' fo3.fluxograma = fo.Fluxograma'
      
        '                                                            and ' +
        'fo3.origemoperacaoalternativa is not null'
      
        '                                                            and ' +
        'cast(fo3.sequencia as numeric) > cast(fo.sequencia as numeric))'
      ''
      
        '                                  and not coalesce((select fo4.O' +
        'peracaoemGrupoComAnterior'
      
        '                                                    from fluxogr' +
        'amasoperacoes fo4'
      
        '                                                    where fo4.fl' +
        'uxograma = fo.fluxograma'
      
        '                                                    and cast(fo4' +
        '.sequencia as numeric) > cast(fo.sequencia as numeric)'
      
        '                                                    order by cas' +
        't(fo4.sequencia as numeric) limit 1  ),false)'
      '                         then true else false end'
      ''
      '                 from fluxogramasoperacoes fo2'
      '                 where fo2.fluxograma = fo.fluxograma'
      
        '                   and cast(fo2.sequencia as numeric) < cast(fo.' +
        'sequencia as numeric)'
      
        '                 order by cast(fo2.sequencia as numeric) desc li' +
        'mit 1), false) as PermiteConjugar,'
      ''
      
        '       coalesce((select case when not coalesce(fo2.operacaoconju' +
        'gada,false) and'
      
        '                                  not coalesce(fo.operacaoconjug' +
        'ada,false) and'
      
        '                                  not coalesce((select fo4.opera' +
        'caoconjugada'
      
        '                                                from fluxogramas' +
        'operacoes fo4'
      
        '                                                where fo4.fluxog' +
        'rama = fo.fluxograma'
      
        '                                                  and cast(fo4.s' +
        'equencia as numeric) > cast(fo.sequencia as numeric)'
      
        '                                                order by cast(fo' +
        '4.sequencia as numeric) limit 1  ),false)'
      ''
      '                                  then true else false end'
      '                 from fluxogramasoperacoes fo2'
      '                 where fo2.fluxograma = fo.fluxograma'
      
        '                   and cast(fo2.sequencia as numeric) < cast(fo.' +
        'sequencia as numeric)'
      
        '                 order by cast(fo2.sequencia as numeric) desc li' +
        'mit 1), false) as PermiteAgrupar'
      ''
      'FROM fluxogramasoperacoes fo'
      '     JOIN Operacoes o ON fo.Operacao = o.Codigo'
      ''
      'WHERE fo.Fluxograma = :fluxograma'
      'ORDER BY CAST(fo.Sequencia AS NUMERIC)'
      '')
    RequestLive = True
    Left = 72
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'fluxograma'
        ParamType = ptUnknown
      end>
    object qryFluxoGramasOperacoesfluxograma: TIntegerField
      FieldName = 'fluxograma'
      Required = True
      DisplayFormat = '0'
    end
    object qryFluxoGramasOperacoesoperacao: TIntegerField
      DisplayLabel = 'opera'#231#227'o'
      FieldName = 'operacao'
      Required = True
      DisplayFormat = '0'
    end
    object qryFluxoGramasOperacoesnome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 10
    end
    object qryFluxoGramasOperacoesc01: TStringField
      DisplayLabel = 'C1'
      FieldName = 'c01'
      Size = 2
    end
    object qryFluxoGramasOperacoesc02: TStringField
      DisplayLabel = 'C2'
      FieldName = 'c02'
      Size = 2
    end
    object qryFluxoGramasOperacoesc03: TStringField
      DisplayLabel = 'C3'
      FieldName = 'c03'
      Size = 2
    end
    object qryFluxoGramasOperacoestempopadrao: TFloatField
      DisplayLabel = 'Tempo Padr'#227'o'
      FieldName = 'tempopadrao'
      DisplayFormat = '0.00'
    end
    object qryFluxoGramasOperacoesdescricao: TStringField
      FieldName = 'descricao'
      Size = 60
    end
    object qryFluxoGramasOperacoessequencia: TStringField
      FieldName = 'sequencia'
      Size = 6
    end
    object qryFluxoGramasOperacoestipooperacao: TStringField
      FieldName = 'tipooperacao'
      Required = True
      Size = 1
    end
    object qryFluxoGramasOperacoesorigemoperacaoalternativa: TIntegerField
      FieldName = 'origemoperacaoalternativa'
      DisplayFormat = '0'
    end
    object qryFluxoGramasOperacoesOperacaoemGrupoComAnterior: TBooleanField
      FieldName = 'OperacaoemGrupoComAnterior'
    end
    object qryFluxoGramasOperacoesoperacaoconjugada: TBooleanField
      FieldName = 'operacaoconjugada'
    end
    object qryFluxoGramasOperacoesInformarTerminodoProcesso: TBooleanField
      FieldName = 'InformarTerminodoProcesso'
    end
    object qryFluxoGramasOperacoestipo: TStringField
      DisplayWidth = 3
      FieldName = 'tipo'
      Size = 3
    end
    object qryFluxoGramasOperacoespermiteconjugar: TBooleanField
      FieldName = 'permiteconjugar'
    end
    object qryFluxoGramasOperacoespermiteagrupar: TBooleanField
      FieldName = 'permiteagrupar'
    end
    object qryFluxoGramasOperacoesPercentualOperador: TFloatField
      FieldName = 'percentualoperador'
      DisplayFormat = '0.00'
    end
    object qryFluxoGramasOperacoescusto: TBooleanField
      FieldName = 'custo'
    end
  end
  object dsrFluxoGramasOperacoes: TtecDataSource
    DataSet = qryFluxoGramasOperacoes
    OnDataChange = dsrFluxoGramasOperacoesDataChange
    Left = 104
    Top = 160
  end
  object updOperacoes: TtecQuery
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
      
        'UPDATE operacoes SET tempopadrao = :tempo WHERE codigo = :operac' +
        'ao')
    RequestLive = False
    Left = 216
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tempo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'operacao'
        ParamType = ptUnknown
      end>
  end
  object qryRegistrodasOperacoes: TtecQuery
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
      'SELECT Inclusao.UsuarioInclusao,'
      
        '       CAST(TO_CHAR(Inclusao.DataInclusao, '#39'DD/MM/YYYY HH24:MI:S' +
        'S'#39') AS VARCHAR(20)) AS DataInclusao,'
      '      (SELECT u.Nome'
      '          FROM Usuarios u'
      
        '          WHERE u.UseName = UsuarioInclusao) AS NomeUsuarioInclu' +
        'sao,'
      ''
      '       Alteracao.UsuarioAlteracao,'
      
        '       CAST(TO_CHAR(Alteracao.DataAlteracao, '#39'DD/MM/YYYY HH24:MI' +
        ':SS'#39') AS VARCHAR(20)) AS DataAlteracao,'
      '      (SELECT u.Nome'
      '          FROM Usuarios u'
      
        '          WHERE u.UseName = UsuarioAlteracao) AS NomeUsuarioAlte' +
        'racao,'
      '       Alteracao.Operacao,'
      '       Alteracao.Tabela'
      ''
      'FROM'
      ''
      '('
      ' SELECT Inclusao.*'
      ' FROM'
      ''
      ' ('
      '  (SELECT fl.Trigger_User    AS UsuarioInclusao,'
      '          fl.Trigger_Changed AS DataInclusao'
      '      FROM Fluxogramas_Log fl'
      '      WHERE fl.Codigo    = :Fluxograma AND'
      '            Trigger_Mode = '#39'INSERT'#39
      '      ORDER BY fl.Trigger_Changed DESC LIMIT 1)'
      ''
      ''
      '  UNION ALL'
      ''
      '  (SELECT CAST(NULL AS VARCHAR(50)) AS UsuarioInclusao,'
      '          CAST(NULL AS TIMESTAMP)   AS DataInclusao'
      '      WHERE NOT EXISTS (SELECT fl.Codigo'
      '                           FROM Fluxogramas_Log fl'
      '                           WHERE fl.Codigo = :Fluxograma AND'
      '                                 Trigger_Mode = '#39'INSERT'#39
      
        '                           ORDER BY fl.Trigger_Changed DESC LIMI' +
        'T 1))'
      ' ) AS Inclusao'
      ''
      ') AS Inclusao,'
      ''
      ''
      '('
      ' SELECT Alteracao.*'
      ' FROM'
      ''
      ' ('
      '  SELECT Alteracao.* FROM'
      ''
      '  ('
      '   (SELECT fl.Trigger_User    AS UsuarioAlteracao,'
      '           fl.Trigger_Changed AS DataAlteracao,'
      ''
      
        '           CAST(CASE WHEN Trigger_Mode = '#39'INSERT'#39' THEN '#39'INCLUS'#195'O' +
        #39
      
        '                                                  ELSE '#39'ALTERA'#199#195 +
        'O'#39
      '                END AS VARCHAR(10)) AS Operacao,'
      '           CAST('#39'FLUXOGRAMAS'#39' AS VARCHAR(30)) AS Tabela'
      ''
      '       FROM Fluxogramas_Log fl'
      '       WHERE fl.Codigo = :Fluxograma                  AND'
      '             Trigger_Mode IN ('#39'INSERT'#39', '#39'UPDATE'#39') AND'
      '             Trigger_Tuple = '#39'new'#39
      '       ORDER BY fl.Trigger_Changed DESC LIMIT 1)'
      ''
      ''
      '   UNION ALL'
      ''
      '   (SELECT fl.Trigger_User    AS UsuarioAlteracao,'
      '           fl.Trigger_Changed AS DataAlteracao,'
      ''
      
        '           CAST(CASE WHEN Trigger_Mode = '#39'INSERT'#39' THEN '#39'INCLUS'#195'O' +
        #39
      
        '                     WHEN Trigger_Mode = '#39'UPDATE'#39' THEN '#39'ALTERA'#199#195 +
        'O'#39
      
        '                                                  ELSE '#39'EXCLUS'#195'O' +
        #39
      '                END AS VARCHAR(10)) AS Operacao,'
      
        '           CAST('#39'FLUXOGRAMAS OPERA'#199#213'ES'#39' AS VARCHAR(30)) AS Tabel' +
        'a'
      ''
      '       FROM FluxogramasOperacoes_Log fl'
      '       WHERE fl.Fluxograma = :Fluxograma AND'
      '             Trigger_Mode IN ('#39'INSERT'#39', '#39'UPDATE'#39', '#39'DELETE'#39')'
      '       ORDER BY fl.Trigger_Changed DESC LIMIT 1)'
      ''
      '  ) AS Alteracao'
      '  ORDER BY DataAlteracao DESC LIMIT 1'
      ' ) AS Alteracao'
      ') AS Alteracao'
      'ORDER BY UsuarioInclusao')
    RequestLive = False
    Left = 392
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'fluxograma'
        ParamType = ptUnknown
      end>
    object qryRegistrodasOperacoesusuarioinclusao: TStringField
      FieldName = 'usuarioinclusao'
      Size = 32
    end
    object qryRegistrodasOperacoesdatainclusao: TStringField
      FieldName = 'datainclusao'
    end
    object qryRegistrodasOperacoesusuarioalteracao: TStringField
      FieldName = 'usuarioalteracao'
      Size = 50
    end
    object qryRegistrodasOperacoesdataalteracao: TStringField
      FieldName = 'dataalteracao'
    end
    object qryRegistrodasOperacoesoperacao: TStringField
      FieldName = 'operacao'
      Size = 10
    end
    object qryRegistrodasOperacoestabela: TStringField
      FieldName = 'tabela'
      Size = 30
    end
    object qryRegistrodasOperacoesnomeusuarioinclusao: TStringField
      FieldName = 'nomeusuarioinclusao'
      Size = 40
    end
    object qryRegistrodasOperacoesnomeusuarioalteracao: TStringField
      FieldName = 'nomeusuarioalteracao'
      Size = 40
    end
  end
  object fdsImprimirFluxogramas: TfrDBDataSet
    CloseDataSource = True
    DataSet = qryImprimirFluxogramas
    Left = 304
    Top = 176
  end
  object qryImprimirFluxogramas: TtecQuery
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
        Name = 'datainclusao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataalteracao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Inclusaofluxogramas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Alteracaofluxogramas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Ordenacao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';'
      'SELECT    f.*'
      'FROM'
      ''
      '('
      ' SELECT f.*,'
      '        o.Codigo AS CodigoOperacao,'
      '        o.Nome,  o.C01, o.C02, o.C03,'
      '        o.SetUp, o.PlanoControle,'
      '        o.Descricao AS DescricaoOperacao,'
      '        '
      '        TempoPadrao(o.Codigo, CURRENT_DATE) AS Tempopadrao,'
      '      '
      '        fo.Sequencia,'
      '       (SELECT fl.Trigger_User'
      '           FROM Fluxogramas_Log fl'
      
        '           WHERE Trigger_Mode = '#39'INSERT'#39' AND fl.Codigo = f.Codig' +
        'o'
      '                 %DataInclusao'
      '           ORDER BY fl.Trigger_Changed DESC LIMIT 1'
      '       ) AS UsuarioInclusao,'
      ''
      '       (SELECT fl.Trigger_Changed'
      '           FROM Fluxogramas_Log fl'
      
        '           WHERE Trigger_Mode = '#39'INSERT'#39' AND fl.Codigo = f.Codig' +
        'o'
      '                 %DataInclusao'
      '           ORDER BY fl.Trigger_Changed DESC LIMIT 1'
      '       ) AS DataHoraInclusao,'
      ''
      ''
      '       (SELECT S.UsuarioAlteracao'
      '        FROM'
      ''
      '        ('
      '         (SELECT fl.Trigger_User    AS UsuarioAlteracao,'
      '                 fl.Trigger_Changed AS DataHoraAlteracao'
      '             FROM Fluxogramas_Log fl'
      '             WHERE fl.Codigo = f.Codigo                    AND'
      '                   fl.Trigger_Mode IN ('#39'INSERT'#39', '#39'UPDATE'#39') AND'
      '                   fl.Trigger_Tuple = '#39'new'#39'               '
      '                   %DataAlteracao'
      '             ORDER BY fl.Trigger_Changed DESC LIMIT 1'
      '         )'
      ''
      '         UNION ALL'
      '         '
      '         (SELECT fl.Trigger_User    AS UsuarioAlteracao,'
      '                 fl.Trigger_Changed AS DataHoraAlteracao'
      '            FROM FluxogramasOperacoes_Log fl'
      '            WHERE fl.Fluxograma = f.Codigo                AND'
      '                  fl.Trigger_Mode IN ('#39'INSERT'#39', '#39'UPDATE'#39') AND'
      '                  fl.Trigger_Tuple = '#39'new'#39
      '                  %DataAlteracao'
      '            ORDER BY fl.Trigger_Changed DESC LIMIT 1'
      '         )'
      '        ) AS S'
      
        '        ORDER BY DataHoraAlteracao DESC LIMIT 1) AS UsuarioAlter' +
        'acao,'
      ''
      ''
      ''
      '        (SELECT S.DataHoraAlteracao'
      '         FROM'
      '         '
      '         ('
      
        '          (SELECT CAST(TO_CHAR(fl.Trigger_Changed, '#39'DD/MM/YY HH2' +
        '4:MI:SS'#39') AS VARCHAR(20)) AS DatahoraAlteracao'
      '              FROM Fluxogramas_Log fl'
      '              WHERE fl.Codigo = f.Codigo                    AND'
      '                    fl.Trigger_Mode IN ('#39'INSERT'#39', '#39'UPDATE'#39') AND'
      '                    fl.Trigger_Tuple = '#39'new'#39
      '                    %DataAlteracao'
      '              ORDER BY fl.Trigger_Changed DESC LIMIT 1'
      '          )'
      '          '
      '          UNION ALL'
      ''
      
        '          (SELECT CAST(TO_CHAR(fl.Trigger_Changed, '#39'DD/MM/YY HH2' +
        '4:MI:SS'#39') AS VARCHAR(20)) AS DatahoraAlteracao'
      '              FROM FluxogramasOperacoes_Log fl'
      '              WHERE fl.Fluxograma = f.Codigo AND'
      '                    fl.Trigger_Mode IN ('#39'INSERT'#39', '#39'UPDATE'#39') AND'
      '                    fl.Trigger_Tuple = '#39'new'#39
      '                    %DataAlteracao'
      '              ORDER BY fl.Trigger_Changed DESC LIMIT 1'
      '          )'
      '         ) AS S'
      
        '         ORDER BY DatahoraAlteracao LIMIT 1) AS DataHoraAlteraca' +
        'o,'
      ''
      ''
      '         (SELECT S.Operacao'
      '          FROM'
      '          '
      '          ('
      '           (SELECT CAST(CASE WHEN fl.Trigger_Mode = '#39'INSERT'#39
      '                             THEN '#39'INCLUS'#195'O'#39
      '                             ELSE '#39'ALTERA'#199#195'O'#39
      '                        END AS VARCHAR(10)) AS Operacao,'
      
        '                    fl.Trigger_Changed AS DataHoraAlteracao     ' +
        '          '
      '               FROM Fluxogramas_Log fl'
      '               WHERE fl.Codigo = f.Codigo                    AND'
      '                     fl.Trigger_Mode IN ('#39'INSERT'#39', '#39'UPDATE'#39') AND'
      '                     fl.Trigger_Tuple = '#39'new'#39
      '                     %DataAlteracao'
      '               ORDER BY fl.Trigger_Changed DESC LIMIT 1'
      '           )   '
      '           '
      '           UNION ALL   '
      '   '
      '           (SELECT CAST(CASE WHEN Trigger_Mode = '#39'INSERT'#39
      '                             THEN '#39'INCLUS'#195'O'#39
      '                             ELSE '#39'ALTERA'#199#195'O'#39
      '                        END AS VARCHAR(10)) AS Operacao,'
      
        '                   fl.Trigger_Changed AS DataHoraAlteracao      ' +
        '         '
      '               FROM FluxogramasOperacoes_Log fl'
      '               WHERE fl.Fluxograma = f.Codigo                AND'
      '                     fl.Trigger_Mode IN ('#39'INSERT'#39', '#39'UPDATE'#39') AND'
      '                     fl.Trigger_Tuple = '#39'new'#39
      '                     %DataAlteracao'
      '               ORDER BY fl.Trigger_Changed DESC LIMIT 1'
      '           )'
      '          ) AS S'
      '          ORDER BY DataHoraAlteracao DESC LIMIT 1) AS Operacao,'
      ''
      '         '
      '       (SELECT S.Tabela'
      '        FROM'
      ''
      '        ('
      '         (SELECT CAST('#39'M'#193'QUINAS'#39' AS VARCHAR(30)) AS Tabela,'
      '                 fl.Trigger_Changed AS DataHoraAlteracao'
      '             FROM Fluxogramas_Log fl'
      '             WHERE fl.Codigo = f.Codigo                    AND'
      '                   fl.Trigger_Mode IN ('#39'INSERT'#39', '#39'UPDATE'#39') AND'
      '                   fl.Trigger_Tuple = '#39'new'#39
      '                   %DataAlteracao'
      '             ORDER BY fl.Trigger_Changed DESC LIMIT 1'
      '         )'
      '         '
      '         UNION ALL'
      ''
      '         (SELECT CAST('#39'OP. M'#193'QUINAS'#39' AS VARCHAR(30)) AS Tabela,'
      '                 fl.Trigger_Changed AS DataHoraAlteracao'
      '             FROM FluxogramasOperacoes_Log fl'
      '             WHERE fl.Fluxograma = f.Codigo                AND '
      '                   fl.Trigger_Mode IN ('#39'INSERT'#39', '#39'UPDATE'#39') AND'
      '                   fl.Trigger_Tuple = '#39'new'#39
      '                   %DataAlteracao'
      '             ORDER BY fl.Trigger_Changed DESC LIMIT 1'
      '         )'
      '        ) AS S'
      '        ORDER BY DataHoraAlteracao DESC LIMIT 1) AS Tabela'
      ''
      '    FROM (Fluxogramas f'
      '          JOIN (FluxogramasOperacoes fo'
      '                JOIN Operacoes o ON fo.Operacao = o.Codigo)'
      '          ON f.Codigo = fo.Fluxograma)'
      '    ORDER BY CAST(fo.Sequencia AS NUMERIC)'
      ') AS f'
      ''
      'WHERE true'
      '      %InclusaoFluxogramas'
      '      %AlteracaoFluxogramas'
      '%Ordenacao'
      ''
      ''
      '/*'
      ''
      ':DatainicialInclusao'
      ':DatafinalInclusao'
      ''
      ':DatainicialAlteracao'
      ':DatafinalAlteracao'
      '*/'
      ''
      '')
    RequestLive = False
    Left = 376
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'datainicialinclusao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinalinclusao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datainicialalteracao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinalalteracao'
        ParamType = ptUnknown
      end>
    object qryImprimirFluxogramascodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryImprimirFluxogramasdescricao: TStringField
      FieldName = 'descricao'
      Size = 40
    end
    object qryImprimirFluxogramasusuarioinclusao: TStringField
      FieldName = 'usuarioinclusao'
      Size = 6
    end
    object qryImprimirFluxogramasdatahorainclusao: TDateTimeField
      FieldName = 'datahorainclusao'
    end
    object qryImprimirFluxogramasusuarioalteracao: TStringField
      FieldName = 'usuarioalteracao'
      Size = 7
    end
    object qryImprimirFluxogramasdatahoraalteracao: TStringField
      FieldName = 'datahoraalteracao'
      Size = 17
    end
    object qryImprimirFluxogramasoperacao: TStringField
      FieldName = 'operacao'
      Size = 8
    end
    object qryImprimirFluxogramastabela: TStringField
      FieldName = 'tabela'
      Size = 8
    end
    object qryImprimirFluxogramascodigooperacao: TIntegerField
      FieldName = 'codigooperacao'
      DisplayFormat = '0'
    end
    object qryImprimirFluxogramasnome: TStringField
      FieldName = 'nome'
      Size = 10
    end
    object qryImprimirFluxogramasc01: TStringField
      FieldName = 'c01'
      Size = 2
    end
    object qryImprimirFluxogramasc02: TStringField
      FieldName = 'c02'
      Size = 2
    end
    object qryImprimirFluxogramasc03: TStringField
      FieldName = 'c03'
      Size = 2
    end
    object qryImprimirFluxogramassetup: TBooleanField
      FieldName = 'setup'
    end
    object qryImprimirFluxogramasplanocontrole: TBooleanField
      FieldName = 'planocontrole'
    end
    object qryImprimirFluxogramasdescricaooperacao: TStringField
      FieldName = 'descricaooperacao'
      Size = 60
    end
    object qryImprimirFluxogramastempopadrao: TFloatField
      FieldName = 'tempopadrao'
      DisplayFormat = '0.00'
    end
    object qryImprimirFluxogramassequencia: TStringField
      FieldName = 'sequencia'
      Size = 6
    end
  end
  object frpImprimirFluxogramas: TfrReport
    Dataset = fdsImprimirFluxogramas
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnBeforePrint = frpImprimirFluxogramasBeforePrint
    Left = 232
    Top = 152
    ReportForm = {
      190000006D3E000019FFFFFFFF08005C5C4249415C485000FFFFFFFFFF000000
      00340800009A0B00004800000024000000240000002B0000000000040000FFFF
      FFFF010000000000000000000000030400466F726D00FEFFFFFFDC0000007800
      00007C0100002C0100000402000500626567696E0D0300656E64000200DC0000
      000900636162506167696E610002010000000024000000F50200005800000030
      00020001000000000000000000FFFFFF1F00000000000000000000000000FFFF
      000000000002000000010000000000000001000000C800000014000000010000
      000000000200450100000900726470506167696E610002010000000088020000
      F50200000E0000003000030001000000000000000000FFFFFF1F000000000000
      00000000000000FFFF000000000002000000010000000000000001000000C800
      000014000000010000000000000200C001000005004461646F73000201000000
      00E7000000F50200000F0000003000050001000000000000000000FFFFFF1F00
      0000001600666473496D7072696D6972466C75786F6772616D61730000000000
      00000000000000000002000000010000000000000001000000C8000000140000
      00010000000000000200530200000C0047726F75704865616465723100020100
      00000093000000F50200000E0000003000100001000000000000000000FFFFFF
      1F0000000021005B717279496D7072696D6972466C75786F6772616D61732E22
      636F6469676F225D00000000000000FFFF000000000002000000010000000006
      0046696C6861310001000000C800000014000000010000000000000200B90200
      00060046696C68613100020100000000BC000000F50200001A00000030001500
      01000000000000000000FFFFFF1F000000000000000000000000000000000000
      000002000000010000000000000001000000C800000014000000010000000000
      0000003D0300000D006D6D6F5A65627261646F53756200020058000000E80000
      00770200000D0000004300000001000000000000000000FFFFFF1F2C02000000
      0000000000000000FFFF00000000000200000001000000000500417269616C00
      08000000000000000000000000000100020000000000FFFFFF00000000020000
      00000000000000BE0300000A006D6D6F5A65627261646F000200480000009300
      0000880200000E0000004300000001000000000000000000FFFFFF1F2C020000
      000000000000000000FFFF00000000000200000001000000000500417269616C
      0008000000020000000000000000000100020000000000FFFFFF000000000200
      00000000000000005104000005004D656D6F3500020024000000880200007800
      00000B0000004300000001000000000000000000FFFFFF1F2C02000000000001
      0011005B54494D4520235468683A6D6D3A73735D00000000FFFF000000000002
      0000000100000006090068656C76657469636100070000000000000000000000
      00000100020000000000FFFFFF0000000002000000000000000100761C000007
      006670764C6F676F000200450000002A000000900000002C0000000500000001
      000000000000000000FFFFFF1F2C020000000000000000000000FFFF00000000
      000200000001000000000100761C0000424DCE17000000000000360400002800
      00008300000026000000010008000000000098130000120B0000120B00000001
      00000001000000000000E8E5A800AA9E000099990000ADADAD003A3C4100A397
      0000BFB73700D8D48600FBFAF000A5A5A5001E1D1C00D8D9DA0054575A00D6D6
      D500E7E8F20012161B00B6AD1900CBC55B008C8D9200BEC0C500E1E2E4008587
      8A005E606300494C4F00090D12002C2E3300DEDB98007D7F8100EFEDCB00B9BA
      BB00AEA400007C7B7B00C5BE440066666600D1CC6F00CDC9810048484600F7F6
      E600AFA5080004080D00F9F8ED00B8AF2700DBD68C00999999001B1A1900C6BF
      5100131312003B3A3A00FFFFFF00EAE8BE00CCCCCC0023262A00E2DEA400F1EF
      D600B0B1B300D3CD7500B1A81000CCCC66007272720053525200434242000106
      0A00ECE9C3008C8C8B00F5F4DF004A4A4A0057575600B6AC1F00282B3000C7C0
      5C0061615F00F7F7F70088888700DDD89300E3E0A600FDFCF70021242900070A
      1000BDB53100C5BE4A00E3E3E200A69C000099999900BABAB900DEDEDE005254
      58002A292800D9D58A005F5E5D00C7C595001B1E2300E8E5B60000000700B5AB
      1300D5D07B00C6C6C500B2A80B0021202000B9B12400504F4E00666666006B6D
      7000B5B5BD0084848400E0DC9E00BCB42C00F7EFD6005B5B5A00EFEFEF008789
      8B00DEDEE6003E3D3C0014181E00C8C25300CCC55F00A8A9AC00BDBDBC00E5E1
      AC0075767900181B2000E6E6E6000E1117000810190033333300929191002D2C
      2B00B5B5B4000000000000000000000000000000000000000000000000000000
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
      0000000000003131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131543D42470E31313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131523131313131486D3131316D6D4C3131316D6D31313131
      3131313131316D4831313131313131316D6D3131316D040A6C6C313131313131
      486D6D4C3131313131316D6D4C313131313131313131313131486D6D6D313131
      313131486D6D48313131316D483131316D6D3131313131313131313131316D6D
      6D3131486D6D6D31313131313152313131317F7E6631554225256031603D4264
      7931420C313B7D316D6C3D70403131662C316D593D7068313133646C70253148
      4255312C70643059313131310C2525420E31477431420E482579313131544243
      3D474C4C640E3120423C300A3131207E2C317F70254748484251512531603C31
      6D59253C620A312C25433068313131313152313131316C203131595931313131
      7C7D4C4C31487C0E3159683177424C51347531434031203D487957543130494C
      7F3D31487C0C310B37317F70313131313C6631313131642C317C33487E513131
      31313179602F55317C3331316D793B7031487E14314857043131316D7C55557E
      311E3031542D4C314340313148790A0B4C313131315231313131477D31312530
      6C64334C5779313131487C0E31224931422C31314340316C7D313C7D31315949
      31570C31543D31487C0C3168705930253131313170706C3C0E313C0A31303331
      7C513131310C702570474C4C3033312C7C64300A3148300E3179624343224848
      3051517C31603D316D6464590B2C31547C42301C313131313152313131314749
      313166420C5548313D2C484831487C0E48302C311C4248516275316C7D31493D
      4879627F31256848373031487C0E3131550E207031313131473C0C554831642C
      4C7E330C62793131316830796D3131487C3331577D6D6D313148303331487C49
      555131487C0C0C7E4C2C703131480C0E7C2C313C476D6D313131313131523131
      31040B7E20316D473C6C33310E3D3C6C7931254264646D31486C42706831316C
      7D31484742702031310E3D433D6C31484355314043473D0A31313131796C3C6C
      0E316670597E3C3D20313131310E256C6C7731316C0E312C3D47430431772F3D
      0A3133424366484825643C7E6C7C74316D225943425531543D59437D31313131
      31523131316D643B6D3131316D514831313179514C316D51793131313131796D
      3131313C40313131796D313131313179794831317F6D316D1515483131313131
      3131795148314879516D796D3131313131313151517931317F6D31316D51516D
      3151577F6D313131797931316D51516D5148313131515151313131314851516D
      3131313131523131313140043131313131313131313131313131313131313131
      313131313131316804313131313131313131313131313148660F313131313131
      31313131313131313131313131313131313131313131313131313131220E3131
      3131313131316655313131313131313131313131313131313131313131313131
      3131313131313131315231313131313131313131313131313131313131313131
      313131313131313131313131313131313131313131313131313131315C461212
      12463F3131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313152313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      5F06020202061B31313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131523131313131310E40173C18183D6E
      3131313131310C2C666C3C181818181805683131313131316D3768220D051631
      3131313108021F1F1F5235313131313172070707070707070707070707070750
      732B3631313131313131313131362B73212112081D3131313131313131312350
      5050504B3131313131313131313F08122E505050085231313131312C103E1919
      19195D17313131317966713E4E191919191919195D0D31313131312C34282819
      190017313131313108021F1F1F52353131313131115202020202020202020202
      0202020202022776313131313131313F501F02020202020202075C3131313131
      31316A060202065F313131313131314C12020202020202022152313131317528
      7A78787878784E223131310E1A3E10787871717171717171281731313131773E
      7A717171712822313131313108021F1F1F5235313131313144021F1F1F1F1F1F
      1F1F1F1F1F1F1F1F1F1F1F1F1D31313131310802021F1F1F1F1F1F1F1F020223
      31313131313107021F1F0208313131313131313A521F1F1F1F1F1F1F50523131
      31310D4E7878787A7A71282231316D7C4E7878784E4E7A717171717128173131
      312C3E7171717119195D22313131313108021F1F1F5269314C4C4C4C631F1F1F
      1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F52503131313138521F1F1F020202020202
      1F1F1F5212313131313107021F1F0208313131313131361F1F1F1F1F02020202
      21523131316D457A78787A3D370E0E5131313B3E7878787A2274140E0E0E0E0E
      0E15313115787A787871190D0A145A2A6A6A6A2A5F3636363636504411111111
      3226262626262626262626262626264A1F1F1F1F612631311B521F1F1F02443A
      08082363021F1F1F525F3131313107021F1F02083131313131311B021F1F1F1F
      6A2B353532523131310E71717171710C313131313115781078784E6831313131
      31313131313131311C287878787A2C3131310106020202025F31313131315052
      020202023631313131313131313131313131313144021F1F1F32312639021F1F
      1F584C31313131311B27021F1F1F3631313107021F1F02083131313131312302
      1F1F1F11093131313152313131337A717171454831313131312C28787810344C
      313131313131313131313131057A78784E663131313135021F1F1F025F313131
      313150021F1F1F1F3631313131313131313131313131314C5E021F1F0276315F
      521F1F1F4B313131313131313132271F1F527331313107021F1F020831313131
      313112021F1F0272313131313152313131601978787A7C4C3131313131662878
      781045166E6E6E6E6E6E6E6E1C0431555B1078717A603131313135021F1F1F02
      5F313131313150021F1F1F1F36313131313131314C0909090909363A021F1F1F
      1F3F314F021F02723131313131313131313123021F1F1109313107021F1F0208
      3131313131312E021F1F0273313131313152313131601978787A054C31313131
      31561978787871282828282828282828005631337A717171346D313131313552
      020202025F31313131312106020202023631313131762E635E61616161611F1F
      1F1F1F1F114C26611F1F0276313131313131313131311D1F1F1F1F1D31310702
      1F1F02083131313131312E021F1F023A313131313152313131601978787A054C
      31313131311819787878787878787878787878784E1731141978787A45483131
      3131764444444444241551515151464F4F4F4F4F413131313A0202021F1F1F1F
      1F1F1F1F1F1F1F521B311D1F1F1F1F363131313131313131313126391F1F1F5C
      313107021F1F02083131313131312E021F1F023A313131313152313131601978
      787A054C31313131315619787878787878787878787878784E1731337A717171
      346D313131313109090909097D713434347A37313131313131313158521F1F1F
      1F1F0202020202020202275831311D1F1F1F1F1D313131313131313131312639
      1F1F1F5C313107021F1F02083131313131312E021F1F023A3131313131523131
      31601978787A054C3131313131224E787878784E28282828282828280056310C
      787171715B0C31313131313131313131133E1010105D74313131313131312939
      021F1F1F1F3911636363636A50083631313126611F1F024B3131313131313131
      31313F021F1F1F36313107021F1F02083131313131312E021F1F023A31313131
      3152313131601978787A054C313131313116287878101A2C2C2C2C2C2C2C2C2C
      7D1E316D1A7A7878197F31313131313131313131134E78787828743131313131
      313176021F1F1F1F23263131313131313131313131313107021F022131313131
      31313131313173021F1F444C313107021F1F02083131313131312E021F1F023A
      313131313152313131601978787A054C31313131317F19717171344831313131
      3131313131313131561978784E6631313131313131313131134E787878287431
      3131313131312B521F1F1F6129313131313131313131313131313158521F1F02
      4A31313131313131317602021F522331313107021F1F02083131313131312E02
      1F1F023A313131313152313131331978787A053131313131316D347A78784E13
      3131313131313131313131317D28787871710431313131313131313113001919
      190004313131313131312B521F1F1F2741313131313131313131313131313109
      11021F1F1F232631313131295F1F1F1F1F612931313107021F1F022B31313131
      31312E021F1F52233131313131520E14602C7A78787A7C141414140C3131203E
      78787171660A1E6014141414140E3131155B107878107A567D371E1E1E1E1E1E
      13566C6C6C182C75757575756D315C021F1F1F1F211B1B1B1B1B1B4A4A4A4A4A
      3631313176021F1F1F0261502323725E021F1F1F0258762B2B4A44021F1F1F50
      4A4A4A2B1D312E021F1F1F074A4A4A4A5C520D7A7A7A78787878787A7A7A5D17
      31317945197878784E4E7A7A7A7A7A7A5D6C313131165D717171711919191919
      1919195D6E313131313166007A7A7A4E1431295E021F1F1F0202020202020202
      020202062B313131315802021F1F1F020202021F1F1F1F52384C395252521F1F
      1F1F1F020202020608312E021F1F1F1F02020202215217717178787878787871
      71714E22313131335B28717878787871717171714E1731313131173E7A717878
      787878787878784E6E313131313166287171717A6031314A521F1F1F1F1F1F1F
      1F1F1F1F1F1F1F524A31313131316939521F1F1F1F1F1F1F1F02025831091102
      1F1F1F1F1F1F1F1F1F1F1F022B312E021F1F1F1F1F1F1F1F50520D1919197878
      7878781919190017313131310C0D10284E4E191919191919000D31313131317D
      1A4E4E4E19191919191919001C3131313131662878787810603131315F020202
      0202020202020202020202062B31313131313136733902020202020261721D31
      3129615252521F1F1F1F1F020202020608312E021F1F1F1F0202020221527D17
      173C107878714D1717170D2C3131313131310E0A1C3B2217171717170D7D3131
      3131313148757D77661717171717170D04313131313166287878781060313131
      31364A3A7272727272727272727272505C3131313131313131264B5F73733835
      4131313131093A7272725E1F1F1F1F4F1212122E5C312E021F1F1F6312121212
      58523131310E1978787A05313131313131313131313131313131313131313131
      313131313131313131313131313131313131313131313131313117003E3E3E5D
      7531313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313107021F1F52583131313131312E021F1F0223
      313131313152313131601978787A054C31313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131317F68
      6E6E6E6E15313131313131313131313131313131313131313131313131313131
      31313131313131313131313131313131313121021F1F02073131313131312E02
      1F1F023A313131313152313131601978787A054C313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313173021F1F1F1F4F3A233A
      32312E021F1F023A313131313152313131601978787A054C3131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131313131313131313131313169521F1F1F1F
      0202020608312E021F1F023A313131313152313131601978787A054C31313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131310963
      521F1F1F1F1F1F024A312E021F1F023A313131313152313131601971717A054C
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131314150611F1F1F1F1F024A3150021F1F023A3131313131523131310C0D17
      176C774C31313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131315C3872727272725C31082E2E2E2E1B3131313131520000
      001D000005004D656D6F31000200A601000024000000FF000000110000004300
      000001000000000000000000FFFFFF1F2C020000000000010008005B54495455
      4C4F5D00000000FFFF0000000000020000000100000000090068656C76657469
      6361000B000000020000000000020000000100020000000000FFFFFF00000000
      02000000000000000000961D000006004D656D6F3235000200A6020000240000
      00300000000F0000004300000001000000000000000000FFFFFF1F2C02000000
      0000010013005B4441544520234464642F6D6D2F797979795D00000000FFFF00
      00000000020000000100000006090068656C7665746963610007000000000000
      000000010000000100020000000000FFFFFF0000000002000000000000000000
      2D1E000006004D656D6F3236000200B602000036000000200000000F00000043
      00000001000000000000000000FFFFFF1F2C020000000000010014005B504147
      45235D2F5B544F54414C50414745535D00000000FFFF00000000000200000001
      00000000090068656C7665746963610007000000000000000000010000000100
      020000000000FFFFFF0000000002000000000000000000D11E000006004D656D
      6F31320002003002000088020000A40000000B00000043000000010000000000
      00000000FFFFFF1F2C02000000000001002100746563534F4654202D20546563
      6E6F6C6F67696120656D2053697374656D61732000000000FFFF000000000002
      0000000100000006090068656C76657469636100070000000000000000000100
      00000100020000000000FFFFFF00000000020000000000000000005F1F000006
      004D656D6F3337000200A601000037000000FF0000002500000043000000F401
      0000000000000000FFFFFF1F2C02000000000001000B005B535542544954554C
      4F5D00000000FFFF0000000000020000000100000000090068656C7665746963
      610008000000000000000000020000000100020000000000FFFFFF0000000002
      000000000000000000E01F000006004D656D6F3738000200BCFFFFFF7C010000
      400000001300000000000100F4010000000000000000FFFFFF1F2C0200000000
      00000000000000FFFF0000000000020000000100000006090068656C76657469
      63610008000000000000000000110000000100020000000000FFFFFF00000000
      020000000000000000008620000013006D6D6F464F4E4546494C49414C424153
      455F52000200DB00000038000000CA0000000A00000004000000F40100000000
      00000000FFFFFF1F2C02000000000001001600464F4E453A205B464F4E454649
      4C49414C424153455D00000000FFFF0000000000020000000100000000090068
      656C7665746963610006000000000000000000100000000100020000000000FF
      FFFF00000000020000000000000000003B21000014006D6D6F454E4445524543
      4F5F42414952524F5F52000200DB00000042000000CB0000000A000000000000
      00F4010000000000000000FFFFFF1F2C020000000000010024005B5255414649
      4C49414C424153455D202D205B42414952524F46494C49414C424153455D0000
      0000FFFF0000000000020000000100000000090068656C766574696361000600
      0000000000000000100000000100020000000000FFFFFF000000000200000000
      00000000000822000012006D6D6F4345505F4349444144455F55465F52000200
      DB0000004D000000CB0000000A00000000000000F4010000000000000000FFFF
      FF1F2C02000000000001003E004345503A205B43455046494C49414C42415345
      5D202D205B43494441444546494C49414C424153455D202D205B45535441444F
      46494C49414C424153455D00000000FFFF000000000002000000010000000009
      0068656C76657469636100060000000000000000001000000001000200000000
      00FFFFFF00000000020000000000000000009E22000008006D6D6F52415A414F
      000200DB00000024000000CB0000001400000003000000F40100000000000000
      00FFFFFF1F2C020000000000010011005B52415A414F46494C49414C42415345
      5D00000000FFFF0000000000020000000100000000090068656C766574696361
      0006000000000000000000100000000100020000000000FFFFFF000000000200
      00000000000000004023000006004D656D6F31390002006B000000E90000004D
      0000000C00000043000000F4010000000000000000FFFFFF1F2C020000000000
      01001F005B717279496D7072696D6972466C75786F6772616D61732E226E6F6D
      65225D00000000FFFF0000000000020000000100000000090068656C76657469
      63610006000000000000000000080000001700020000000000FFFFFF00000000
      02000000000000000000E123000006004D656D6F3330000200B9000000E90000
      00170000000C00000043000000F4010000000000000000FFFFFF1F2C02000000
      000001001E005B717279496D7072696D6972466C75786F6772616D61732E2263
      3031225D00000000FFFF0000000000020000000100000000090068656C766574
      69636100060000000000000000000A0000001700020000000000FFFFFF000000
      00020000000000000000008224000006004D656D6F3437000200D1000000E900
      0000160000000C00000043000000F4010000000000000000FFFFFF1F2C020000
      00000001001E005B717279496D7072696D6972466C75786F6772616D61732E22
      633032225D00000000FFFF0000000000020000000100000000090068656C7665
      7469636100060000000000000000000A0000001700020000000000FFFFFF0000
      0000020000000000000000002325000006004D656D6F3331000200E8000000E9
      000000150000000C00000043000000F4010000000000000000FFFFFF1F2C0200
      0000000001001E005B717279496D7072696D6972466C75786F6772616D61732E
      22633033225D00000000FFFF0000000000020000000100000000090068656C76
      657469636100060000000000000000000A0000001700020000000000FFFFFF00
      00000002000000000000000000D225000006004D656D6F3436000200FF000000
      E9000000140100000C00000043000000F4010000000000000000FFFFFF1F2C02
      000000000001002C005B717279496D7072696D6972466C75786F6772616D6173
      2E2264657363726963616F6F7065726163616F225D00000000FFFF0000000000
      020000000100000000090068656C766574696361000600000000000000000008
      0000001700020000000000FFFFFF000000000200000000000000000057260000
      05004D656D6F3300020057000000C9000000140000000B00000043000F00F401
      0000000000000000FFFFFF1F2C0200000000000100030053455100000000FFFF
      0000000000020000000100000000090068656C76657469636100060000000000
      000000000A0000001700020000000000FFFFFF00000000020000000000000000
      00DB26000005004D656D6F34000200B8000000C9000000180000000B00000043
      000F00F4010000000000000000FFFFFF1F2C0200000000000100020043310000
      0000FFFF0000000000020000000100000000090068656C766574696361000600
      00000000000000000A0000001700020000000000FFFFFF000000000200000000
      00000000005F27000005004D656D6F36000200D0000000C9000000170000000B
      00000043000F00F4010000000000000000FFFFFF1F2C02000000000001000200
      433200000000FFFF0000000000020000000100000000090068656C7665746963
      6100060000000000000000000A0000001700020000000000FFFFFF0000000002
      000000000000000000E327000005004D656D6F37000200E7000000C900000016
      0000000B00000043000F00F4010000000000000000FFFFFF1F2C020000000000
      01000200433300000000FFFF0000000000020000000100000000090068656C76
      657469636100060000000000000000000A0000001700020000000000FFFFFF00
      000000020000000000000000006F28000006004D656D6F3131000200FD000000
      C9000000150100000B00000043000F00F4010000000000000000FFFFFF1F2C02
      000000000001000900444553435249C7C34F00000000FFFF0000000000020000
      000100000000090068656C76657469636100060000000000000000000A000000
      1700020000000000FFFFFF0000000002000000000000000000FB28000006004D
      656D6F313300020057000000BE000000790200000B00000043000F00F4010000
      000000000000FFFFFF1F2C020000000000010009004F50455241C7D545530000
      0000FFFF0000000000020000000100000000090068656C766574696361000600
      00000000000000000A0000001700020000000000FFFFFF000000000200000000
      00000000008429000006004D656D6F323700020055020000C900000023000000
      0B00000043000F00F4010000000000000000FFFFFF1F2C020000000000010006
      005345542D555000000000FFFF0000000000020000000100000000090068656C
      76657469636100060000000000000000000A0000001700020000000000FFFFFF
      0000000002000000000000000000182A000006004D656D6F3239000200780200
      00C9000000580000000B00000041000F00F4010000000000000000FFFFFF1F2C
      02000000000001001100504C414E4F20444520434F4E54524F4C4500000000FF
      FF0000000000020000000100000000090068656C766574696361000600000000
      00000000000A0000001700020000000000FFFFFF000000000200000000000000
      0000FE2A000006004D656D6F333600020063020000E90000000A0000000B0000
      0043000F00F4010000000000000000FFFFFF1F2C020000000000010000000006
      000500626567696E0D2F006966205B717279496D7072696D6972466C75786F67
      72616D61732E227365747570225D203D2054727565207468656E0D0D0020206D
      656D6F203A3D202758270D0400656C73650D0D0020206D656D6F203A3D202727
      3B0D0300656E6400FFFF000000000002000000010000000006005461686F6D61
      00080000000000000000000A0000001700020000000000FFFFFF000000000200
      0000000000000000EE2B000006004D656D6F33380002009E020000E90000000A
      0000000B00000043000F00F4010000000000000000FFFFFF1F2C020000000000
      010000000006000500626567696E0D37006966205B717279496D7072696D6972
      466C75786F6772616D61732E22706C616E6F636F6E74726F6C65225D203D2054
      727565207468656E0D0D0020206D656D6F203A3D202758270D0400656C73650D
      0F0020206D656D6F203A3D2027273B20200D0300656E6400FFFF000000000002
      000000010000000006005461686F6D6100080000000000000000000A00000017
      00020000000000FFFFFF00000000020000000000000000007A2C000006004D65
      6D6F3339000200DD01000065000000F30000000B00000043000B00F401000000
      0000000000FFFFFF1F2C02000000000001000900414C54455241C7C34F000000
      00FFFF0000000000020000000100000000090068656C76657469636100060000
      000000000000000A0000001700020000000000FFFFFF00000000020000000000
      00000000042D000006004D656D6F3430000200A3010000700000003A0000000A
      00000043000B00F4010000000000000000FFFFFF1F2C02000000000001000700
      555355C152494F00000000FFFF0000000000020000000100000000090068656C
      76657469636100060000000000000000000A0000001700020000000000FFFFFF
      00000000020000000000000000008B2D000006004D656D6F3432000200480000
      00650000001D0000001500000043000F00F4010000000000000000FFFFFF1F2C
      02000000000001000400434F442E00000000FFFF000000000002000000010000
      0000090068656C76657469636100060000000000000000000A00000017000200
      00000000FFFFFF0000000002000000000000000000172E000006004D656D6F34
      340002006500000065000000FA0000001500000043000F00F401000000000000
      0000FFFFFF1F2C02000000000001000900444553435249C7C34F00000000FFFF
      0000000000020000000100000000090068656C76657469636100060000000000
      000000000A0000000100020000000000FFFFFF00000000020000000000000000
      00A52E000006004D656D6F34380002005F01000070000000440000000A000000
      43000F00F4010000000000000000FFFFFF1F2C02000000000001000B00444154
      41204520484F524100000000FFFF000000000002000000010000000009006865
      6C76657469636100060000000000000000000A0000001700020000000000FFFF
      FF0000000002000000000000000000302F000006004D656D6F34390002005F01
      0000650000007E0000000B00000043000F00F4010000000000000000FFFFFF1F
      2C02000000000001000800494E434C5553C34F00000000FFFF00000000000200
      00000100000000090068656C76657469636100060000000000000000000A0000
      001700020000000000FFFFFF0000000002000000000000000000BA2F00000600
      4D656D6F353000020021020000700000003C0000000A00000043000B00F40100
      00000000000000FFFFFF1F2C02000000000001000700555355C152494F000000
      00FFFF0000000000020000000100000000090068656C76657469636100060000
      000000000000000A0000001700020000000000FFFFFF00000000020000000000
      000000004830000006004D656D6F3531000200DD01000070000000440000000A
      00000043000F00F4010000000000000000FFFFFF1F2C02000000000001000B00
      44415441204520484F524100000000FFFF000000000002000000010000000009
      0068656C76657469636100060000000000000000000A00000017000200000000
      00FFFFFF0000000002000000000000000000D330000006004D656D6F35320002
      005D020000700000003A0000000A00000043000F00F4010000000000000000FF
      FFFF1F2C020101000000010008004F50455241C7C34F00000000FFFF00000000
      00020000000100000000090068656C7665746963610006000000000000000000
      0A0000001700020000000000FFFFFF00000000020000000000000000005C3100
      0006004D656D6F35330002009702000070000000390000000A00000043000F00
      F4010000000000000000FFFFFF1F2C02010100000001000600544142454C4100
      000000FFFF0000000000020000000100000000090068656C7665746963610006
      0000000000000000000A0000001700020000000000FFFFFF0000000002000000
      000000000000FF31000005004D656D6F3200020049000000940000001C000000
      0C00000043000000F4010000000000000000FFFFFF1F2C020000000000010021
      005B717279496D7072696D6972466C75786F6772616D61732E22636F6469676F
      225D00000000FFFF0000000000020000000100000000090068656C7665746963
      610007000000020000000000090000001700020000000000FFFFFF0000000002
      000000000000000000A532000005004D656D6F390002006600000094000000F8
      0000000C0000004100000064000000000000000000FFFFFF1F2C020000000000
      010024005B717279496D7072696D6972466C75786F6772616D61732E22646573
      63726963616F225D00000000FFFF000000000002000000010000000009006865
      6C7665746963610007000000020000000000080000001700020000000000FFFF
      FF0000000002000000000000000000EA33000006004D656D6F31350002005F01
      000094000000430000000C00000043000000F4010000000000000000FFFFFF1F
      2C000403080068683A6D6D3A737300010000000006000500626567696E0D3800
      6966205B717279496D7072696D6972466C75786F6772616D61732E2264617461
      686F7261696E636C7573616F225D203C3E2030207468656E0D590020206D656D
      6F203A3D205B464F524D41544441544554494D45282744442F4D4D2F59592048
      483A4D4D272C205B717279496D7072696D6972466C75786F6772616D61732E22
      64617461686F7261696E636C7573616F225D295D0D0400656C73650D0C002020
      6D656D6F203A3D27273B0D0300656E6400FFFF00000000000200000001000000
      00090068656C76657469636100070000000200000000000A0000001700020000
      000000FFFFFF0000000002000000000000000000DE34000006004D656D6F3230
      000200DE01000094000000430000000C00000043000000F40100000000000000
      00FFFFFF1F2C020000000000010071005B636F7079286966285B717279496D70
      72696D6972466C75786F6772616D61732E2264617461686F7261616C74657261
      63616F225D3C3E27272C5B717279496D7072696D6972466C75786F6772616D61
      732E2264617461686F7261616C7465726163616F225D2C2727292C312C313429
      5D00000000FFFF0000000000020000000100000000090068656C766574696361
      00070000000200000000000A0000001700020000000000FFFFFF000000000200
      00000000000000008B35000006004D656D6F3231000200A30100009400000039
      0000000C00000043000000F4010000000000000000FFFFFF1F2C020000000000
      01002A005B717279496D7072696D6972466C75786F6772616D61732E22757375
      6172696F696E636C7573616F225D00000000FFFF000000000002000000010000
      0000090068656C76657469636100070000000200000000000800000017000200
      00000000FFFFFF00000000020000000000000000003936000006004D656D6F32
      3800020022020000940000003A0000000C00000043000000F401000000000000
      0000FFFFFF1F2C02000000000001002B005B717279496D7072696D6972466C75
      786F6772616D61732E227573756172696F616C7465726163616F225D00000000
      FFFF0000000000020000000100000000090068656C7665746963610007000000
      0200000000000A0000001700020000000000FFFFFF0000000002000000000000
      000000DF36000006004D656D6F33320002005D020000940000003A0000000C00
      000043000000F4010000000000000000FFFFFF1F2C020000000000010023005B
      717279496D7072696D6972466C75786F6772616D61732E226F7065726163616F
      225D00000000FFFF0000000000020000000100000000090068656C7665746963
      6100060000000200000000000A0000001700020000000000FFFFFF0000000002
      000000000000000000DC38000006004D656D6F35360002009802000094000000
      380000000C00000043000000F4010000000000000000FFFFFF1F2C0200000000
      00010021005B717279496D7072696D6972466C75786F6772616D61732E227461
      62656C61225D0010000500626567696E0D390020206966205B717279496D7072
      696D6972466C75786F6772616D61732E22636F6469676F6F7065726163616F22
      5D203C3E2030207468656E200D07002020626567696E0D1C002020202066696C
      6861312E76697369626C65203A3D2054727565203B0D18002020202066696C68
      61312E686569677468203A3D2032363B0D1A00202020204461646F732E766973
      69626C65203A3D20547275653B0D1700202020204461646F732E686569677468
      203A3D2031343B0D05002020656E640D07002020656C7365200D070020206265
      67696E0D1C002020202066696C6861312E76697369626C65203A3D2046616C73
      653B0D17002020202066696C6861312E686569677468203A3D20303B0D1B0020
      2020204461646F732E76697369626C65203A3D2046616C73653B0D1600202020
      204461646F732E686569677468203A3D20303B0D06002020656E643B0D030065
      6E6400FFFF0000000000020000000100000000090068656C7665746963610006
      0000000200000000000A0000001700020000000000FFFFFF0000000002000000
      0000000000006239000005004D656D6F380002006B000000C90000004D000000
      0B00000043000F00F4010000000000000000FFFFFF1F2C020000000000010004
      004E4F4D4500000000FFFF0000000000020000000100000000090068656C7665
      7469636100060000000000000000000A0000001700020000000000FFFFFF0000
      000002000000000000000000F139000006004D656D6F313000020012020000C9
      000000430000000B00000043000F00F4010000000000000000FFFFFF1F2C0200
      0000000001000C0054454D504F2050414452C34F00000000FFFF000000000002
      0000000100000000090068656C76657469636100060000000000000000000A00
      00001700020000000000FFFFFF0000000002000000000000000000983A000006
      004D656D6F313400020058000000E9000000120000000C00000043000000F401
      0000000000000000FFFFFF1F2C020000000000010024005B717279496D707269
      6D6972466C75786F6772616D61732E2273657175656E636961225D00000000FF
      FF0000000000020000000100000000090068656C766574696361000600000000
      0000000000090000001700020000000000FFFFFF000000000200000000000000
      0000413B000006004D656D6F313600020014020000E9000000410000000C0000
      0043000000F4010000000000000000FFFFFF1F2C020101000000010026005B71
      7279496D7072696D6972466C75786F6772616D61732E2274656D706F70616472
      616F225D00000000FFFF0000000000020000000100000000090068656C766574
      69636100060000000000000000000A0000001700020000000000FFFFFF000000
      000200000000000000FEFEFF27000000080020436F6D70726173000000000600
      4F7574726173000000000F0052415A414F46494C49414C42415345000000000F
      00454E44455245434F5F42414952524F000000000D004345505F434944414445
      5F554600000000050076616C6F7200010030000E00746F74616C63616C63756C
      61646F00010030000600544954554C4F000000000900535542544954554C4F00
      0000000E00666F6E6566696C69616C6261736500010030000D0072756166696C
      69616C626173650001003000100062616972726F66696C69616C626173650001
      0030000D0063657066696C69616C626173650001003000100063696461646566
      696C69616C626173650001003000100065737461646F66696C69616C62617365
      0001003000070020544F54414953000000000B0047544F54414C56454E444100
      010030000B0047544F54414C435553544F000100300009002050524F4455544F
      53000000000700456D4C696E686100040054727565000B00466F726164654C69
      6E686100040054727565000B00436F6D4D6F6E746167656D0004005472756500
      0B0053656D4D6F6E746167656D000400547275650006004272696E6465000400
      547275650009004E616F4272696E646500040054727565000A00204341424543
      414C484F000000000C0053616C646F4573746F717565000000000C0044617461
      536974756163616F000000000C00204147525550414D454E544F000000000D00
      4167727570617246696C69616C00050066616C73650012004167727570617247
      7275706F46696C69616C00050066616C736500140041677275706172436C6173
      736550726F6475746F00050066616C736500130041677275706172477275706F
      50726F6475746F00050066616C7365000E004167727570617250726F6475746F
      00050066616C736500110041677275706172466F726E656365646F7200050046
      616C7365000A0020434F4E54524F4C4553000000000E00436F6D5175616E7469
      646164657300040054727565000B0020417578696C6961726573000000000500
      4C696E686100010030000000000000000000FC00000000000000000000000000
      000000580067405A6238B2E3405B82B49630E5E440}
  end
end
