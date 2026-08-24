inherited dtmIndiceProdutividadeOEE: TdtmIndiceProdutividadeOEE
  OldCreateOrder = False
  Left = 881
  Top = 249
  Height = 288
  Width = 652
  object qryIndiceProdutividadeOEE_Maquina: TtecQuery
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
        Name = 'TurnoM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TurnoV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TurnoN1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TurnoN2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TurnoX'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FiltroPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FiltroMaquinas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FiltroSetores'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'SELECT Selecao.*,'
      
        '       CAST(100.0* (ITO / 100 * IPA / 100 * IDO / 100) AS NUMERI' +
        'C(5,2)) AS OEE,'
      
        '       (select m.setorproducao from maquinas m where m.codigo = ' +
        'selecao.maquina) as setor'
      ''
      'FROM'
      ''
      '('
      ' SELECT ito.Turno, ito.Maquina, ito.DescricaoMaquina,'
      
        '        CAST((100.0 * ido.Tempo / (ido.Tempo + ito.PNP)) AS NUME' +
        'RIC( 5,2)) AS ITO,'
      
        '        CAST((100.0 * (ito.TP - ito.PD))  / ito.TP AS NUMERIC(15' +
        ',2)) AS IPA,'
      '        ido.TTD, ido.PP, ido.PNP, ido.Tempo, ido.TCL, ido.IDO'
      ''
      ' FROM'
      ''
      ' ('
      '  SELECT oou.Maquina, m.Descricao AS DescricaoMaquina,'
      ''
      
        '                                             /* Total do Tempo d' +
        'isponivel ttd */'
      
        '        (EXTRACT(EPOCH FROM ((CAST(CAST(:DataFinal   AS DATE) + ' +
        '1 AS TIMESTAMP) -'
      
        '                                   CAST(:DataInicial AS TIMESTAM' +
        'P))) / 60) -'
      ''
      '         COALESCE(SUM((SELECT SUM(ooup.TempoParada)'
      '                       FROM OperacoesOSPUsuarioParadas ooup'
      
        '                            JOIN MotivosParadas mp ON ooup.Codig' +
        'oParada = mp.Codigo AND'
      
        '                                                      NOT COALES' +
        'CE(mp.ParadaNaoProgramada,FALSE)'
      ''
      
        '                       WHERE ooup.OSP  = oou.OSP  AND ooup.Opera' +
        'cao = oou.Operacao AND ooup.Data   = oou.Data AND'
      
        '                             ooup.Lote = oou.Lote AND ooup.Usuar' +
        'io = oou.Usuario   AND ooup.Inicio = oou.Inicio)),0)) AS TC,'
      
        '                        /* Paradas programadas  -> resultado tc ' +
        'Tempo de carga*/'
      ''
      '         SUM(oou.Quantidade) AS tp, /* total produzIDO */'
      ''
      '         COALESCE(SUM((SELECT SUM(ooup.TempoParada)'
      '                       FROM OperacoesOSPUsuarioParadas ooup'
      
        '                            JOIN MotivosParadas mp ON ooup.Codig' +
        'oParada = mp.Codigo AND'
      
        '                                                      COALESCE(m' +
        'p.ParadaNaoProgramada,FALSE)'
      ''
      
        '                       WHERE ooup.OSP  = oou.OSP  AND ooup.Opera' +
        'cao = oou.Operacao AND ooup.Data   = oou.Data AND'
      
        '                             ooup.Lote = oou.Lote AND ooup.Usuar' +
        'io = oou.Usuario   AND ooup.Inicio = oou.Inicio)), 0) AS PNP,'
      
        '                                                     /* Parada n' +
        #227'o programada */'
      ''
      
        '         coalesce(SUM((select sum(QuantidadePerda) from Operacoe' +
        'sOSPUsuariofalhas_(OOU.OSP, OOU.LOTE, OOU.Operacao, OOU.Usuario,' +
        ' OOU.Data, OOU.Inicio, cast(null as char)))),0) as PD,'
      
        '                                                      /* produto' +
        's defeituosos */'
      '         TipoTurno.Turno'
      ''
      '  FROM OperacoesOSPUsuario oou'
      ''
      '   JOIN'
      '      ('
      
        '       %TurnoM  /* SELECT cast('#39'M'#39' AS char(1)) AS Turno, cast('#39'0' +
        '5:00:00'#39' AS time) AS Inicio, cast('#39'13:30:00'#39' AS time) AS fim */'
      '       UNION ALL'
      
        '       %TurnoV /* SELECT cast('#39'V'#39' AS char(1)) AS Turno, cast('#39'13' +
        ':30:01'#39' AS time) AS Inicio, cast('#39'22:00:00'#39' AS time) AS fim */'
      '       UNION ALL'
      
        '       %TurnoN1 /* SELECT cast('#39'N'#39' AS char(1)) AS Turno, cast('#39'2' +
        '2:00:01'#39' AS time) AS Inicio, cast('#39'23:59:59'#39' AS time) AS fim */'
      '       UNION ALL'
      
        '       %TurnoN2 /* SELECT cast('#39'N'#39' AS char(1)) AS Turno, cast('#39'0' +
        '0:00:01'#39' AS time) AS Inicio, cast('#39'04:59:59'#39' AS time) AS fim */'
      '       UNION ALL'
      
        '       %TurnoX /* SELECT cast('#39'X'#39' AS char(1)) AS Turno, cast('#39'00' +
        ':00:01'#39' AS time) AS Inicio, cast('#39'04:59:59'#39' AS time) AS fim */'
      '      ) AS TipoTurno'
      '      ON oou.Inicio BETWEEN TipoTurno.Inicio and TipoTurno.Fim'
      ''
      '       JOIN Operacoes o ON oou.Operacao = o.Codigo'
      '       JOIN Maquinas m  ON oou.Maquina  = m.Codigo'
      ''
      '  WHERE COALESCE(oou.Quantidade,0) > 0 AND'
      '        oou.DataTermino IS NOT NULL    AND'
      '        oou.Termino     IS NOT NULL    AND'
      '        TempoPadrao(o.Codigo, oou.Data) <> 0'
      ''
      '        %FiltroPeriodo'
      '        %FiltroMaquinas'
      '        %FiltroSetores'
      ''
      ''
      '  GROUP BY oou.Maquina, m.Descricao, TipoTurno.Turno'
      ' ) AS ito'
      ''
      ' JOIN'
      ''
      ' ('
      '  SELECT Turno, Maquina, DescricaoMaquina,'
      
        '         CAST(SUM(IDO * Tempo) / SUM(Tempo) AS NUMERIC(5,2)) AS ' +
        'IDO,'
      ''
      
        '         CAST((EXTRACT(EPOCH FROM ((CAST(CAST(:DataFinal   AS DA' +
        'TE) + 1 AS TIMESTAMP) -'
      
        '                                         CAST(:DataInicial AS TI' +
        'MESTAMP))) / 60)) AS INTEGER) AS TTD,'
      ''
      '         CAST(SUM(PP)    AS INTEGER) AS PP,'
      '         CAST(SUM(PNP)   AS INTEGER) AS PNP,'
      '         CAST(SUM(Tempo) AS INTEGER) AS Tempo,'
      ''
      '        (CAST('
      
        '         (EXTRACT(EPOCH FROM ((CAST(CAST(:DataFinal AS DATE) + 1' +
        ' AS TIMESTAMP) -'
      
        '                                   CAST(:DataInicial AS TIMESTAM' +
        'P))) / 60)) /*Total do Tempo disponivel ttd */ -'
      '         SUM(PP) - SUM(PNP) - SUM(Tempo)'
      '         AS INTEGER)'
      '        ) AS TCL'
      '  FROM'
      ''
      '  ('
      '   SELECT Turno, Maquina, DescricaoMaquina,'
      
        '          CAST((100.0 * TP * TCT) / Tempo /* (TTD - TCL - pp - P' +
        'NP)*/ AS NUMERIC(15,2)) AS IDO,'
      '          Tempo,'
      '          PP, PNP'
      '          /*cast(TTD - PP - PNP - Tempo as integer) AS TC*/'
      '   FROM'
      ''
      '   ('
      '    SELECT ido.Maquina, ido.DescricaoMaquina,'
      ''
      '         SUM(Intervalo) + SUM(ido.pp) AS pp,'
      '         SUM(ido.tp) AS tp,'
      '         ido.TCT,'
      '         ido.TCT AS TempoPadrao,'
      ''
      '         SUM(ido.PNP) AS PNP,'
      
        '         SUM(ido.Tempo) - SUM(PP) - SUM(PNP) - SUM(Intervalo) AS' +
        ' Tempo,'
      ''
      '         ido.Turno /*,'
      ''
      '         SUM(ido.TCL - ido.Tempo - ido.PP - ido.PNP) AS TCL */'
      '    FROM'
      ''
      '    ('
      '     SELECT oou.Maquina, m.Descricao AS DescricaoMaquina,'
      ''
      
        '            /*----------------------------------------- O interv' +
        'alo '#233' considerado PP - Parada Programada */'
      '            CASE WHEN oou.Intervalo IS NOT NULL'
      '                 THEN oou.Intervalo'
      
        '                 ELSE NrMinutosIntervaloTurno(oou.Data, oou.Inic' +
        'io, oou.DataTermino, oou.Termino, u.Turno)'
      '            END AS Intervalo,'
      ''
      '            COALESCE(SUM((SELECT SUM(ooup.TempoParada)'
      
        '                             FROM OperacoesOSPUsuarioParadas oou' +
        'p'
      '                                  JOIN MotivosParadas mp'
      
        '                                  ON ooup.CodigoParada = mp.Codi' +
        'go AND'
      
        '                                     NOT COALESCE(mp.ParadaNaoPr' +
        'ogramada,FALSE)'
      
        '                             WHERE ooup.OSP  = oou.OSP  AND ooup' +
        '.Operacao = oou.Operacao AND ooup.Data   = oou.Data AND'
      
        '                                   ooup.Lote = oou.Lote AND ooup' +
        '.Usuario  = oou.Usuario  AND ooup.Inicio = oou.Inicio)), 0) AS P' +
        'P,'
      
        '                         /* Paradas programadas -> resultado tc ' +
        'Tempo de carga*/'
      ''
      '            SUM(oou.Quantidade) AS TP, /* total produzIDO */'
      ''
      
        '            TempoPadrao(o.Codigo, oou.Data) / 100.0 AS TCT, /*Te' +
        'mpo ciclo t'#233'cnico */'
      ''
      '            COALESCE(SUM((SELECT SUM(ooup.TempoParada)'
      
        '                             FROM OperacoesOSPUsuarioParadas oou' +
        'p'
      '                                  JOIN MotivosParadas mp'
      
        '                                  ON ooup.CodigoParada = mp.Codi' +
        'go AND'
      
        '                                     COALESCE(mp.ParadaNaoProgra' +
        'mada,FALSE)'
      
        '                             WHERE ooup.OSP  = oou.OSP  AND ooup' +
        '.Operacao = oou.Operacao AND ooup.Data   = oou.Data AND'
      
        '                                   ooup.Lote = oou.Lote AND ooup' +
        '.Usuario = oou.Usuario   AND ooup.Inicio = oou.Inicio)), 0) AS P' +
        'NP,'
      
        '                                                     /* Parada n' +
        #227'o programada */'
      ''
      
        '            CAST(SUM((EXTRACT(EPOCH FROM (CAST(oou.DataTermino |' +
        '| '#39' '#39' || oou.Termino AS TIMESTAMP)) -'
      
        '                                         (CAST(oou.Data        |' +
        '| '#39' '#39' || oou.Inicio  AS TIMESTAMP))) / 60)) AS INTEGER) AS Tempo' +
        ','
      ''
      '            TipoTurno.Turno /*,'
      '            TipoSemana.TCL  */'
      ''
      ''
      '     FROM OperacoesOSPUsuario oou'
      ''
      '          JOIN ('
      
        '                %TurnoM  /* SELECT cast('#39'M'#39' AS char(1)) AS Turno' +
        ', cast('#39'05:00:00'#39' AS time) AS Inicio, cast('#39'13:30:00'#39' AS time) A' +
        'S fim */'
      '                UNION ALL'
      
        '                %TurnoV /* SELECT cast('#39'V'#39' AS char(1)) AS Turno,' +
        ' cast('#39'13:30:01'#39' AS time) AS Inicio, cast('#39'22:00:00'#39' AS time) AS' +
        ' fim */'
      '                UNION ALL'
      
        '                %TurnoN1 /* SELECT cast('#39'N'#39' AS char(1)) AS Turno' +
        ', cast('#39'22:00:01'#39' AS time) AS Inicio, cast('#39'23:59:59'#39' AS time) A' +
        'S fim */'
      '                UNION ALL'
      
        '                %TurnoN2 /* SELECT cast('#39'N'#39' AS char(1)) AS Turno' +
        ', cast('#39'00:00:01'#39' AS time) AS Inicio, cast('#39'04:59:59'#39' AS time) A' +
        'S fim */'
      '                UNION ALL'
      
        '                %TurnoX /* SELECT cast('#39'X'#39' AS char(1)) AS Turno,' +
        ' cast('#39'00:00:01'#39' AS time) AS Inicio, cast('#39'04:59:59'#39' AS time) AS' +
        ' fim */'
      '              ) AS TipoTurno'
      
        '          ON oou.Inicio BETWEEN TipoTurno.Inicio and TipoTurno.f' +
        'im'
      '                              /*'
      '          JOIN ('
      
        '                SELECT 1 AS DiaSemana, :ValorTCLSemana AS TCL UN' +
        'ION ALL'
      
        '                SELECT 2 AS DiaSemana, :ValorTCLSemana AS TCL UN' +
        'ION ALL'
      
        '                SELECT 3 AS DiaSemana, :ValorTCLSemana AS TCL UN' +
        'ION ALL'
      
        '                SELECT 4 AS DiaSemana, :ValorTCLSemana AS TCL UN' +
        'ION ALL'
      
        '                SELECT 5 AS DiaSemana, :ValorTCLSemana AS TCL UN' +
        'ION ALL'
      
        '                SELECT 6 AS DiaSemana, :ValorTCLSabado AS TCL UN' +
        'ION ALL'
      '                SELECT 0 AS DiaSemana, :ValorTCLDomingo AS TCL'
      '               ) AS TipoSemana'
      '          ON EXTRACT(DOW FROM oou.data) = TipoSemana.DiaSemana'
      '          */'
      ''
      '          JOIN Operacoes o ON oou.Operacao = o.Codigo'
      '          JOIN Maquinas  m ON oou.Maquina  = m.Codigo'
      '          JOIN Usuarios  u ON oou.Usuario  = u.Codigo'
      ''
      '     WHERE COALESCE(oou.Quantidade,0) > 0 AND'
      '           oou.DataTermino IS NOT NULL    AND'
      '           oou.Termino     IS NOT NULL    AND'
      '           TempoPadrao(o.Codigo, oou.Data) <> 0'
      ''
      '           %FiltroPeriodo'
      '           %FiltroMaquinas'
      '           %FiltroSetores'
      ''
      
        '     GROUP BY oou.Maquina, m.Descricao, tct, TipoTurno.Turno, /*' +
        'TipoSemana.TCL,*/ oou.Data, Intervalo, oou.Inicio, oou.DataTermi' +
        'no, oou.Termino, u.Turno'
      '    ) AS ido'
      ''
      '    WHERE ido.Tempo <> 0'
      '    GROUP BY Maquina, DescricaoMaquina, TCT, Turno, Intervalo'
      ''
      '   ) AS ido'
      ''
      '  ) AS ido'
      '  GROUP BY Maquina, DescricaoMaquina, Turno'
      ''
      ' ) AS ido'
      ' ON ito.Maquina = Ido.Maquina AND'
      '    ito.Turno   = ido.Turno'
      ''
      ') AS Selecao'
      
        'ORDER BY setor, descricaomaquina, maquina, CASE WHEN Turno = '#39'M'#39 +
        '           THEN 1'
      
        '                                                WHEN Turno = '#39'V'#39 +
        '           THEN 2'
      
        '                                                WHEN Turno IN ('#39 +
        'N1'#39', '#39'N2'#39') THEN 3'
      
        '                                                                ' +
        '           ELSE 4'
      '                                           END'
      '')
    RequestLive = False
    Left = 88
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ValorTCLSemana'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ValorTCLSabado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ValorTCLDomingo'
        ParamType = ptUnknown
      end>
    object qryIndiceProdutividadeOEE_Maquinaturno: TStringField
      DisplayLabel = 'TURNO'
      FieldName = 'turno'
      Size = 1
    end
    object qryIndiceProdutividadeOEE_MaquinaSETOR: TStringField
      FieldName = 'SETOR'
      Size = 4
    end
    object qryIndiceProdutividadeOEE_Maquinamaquina: TIntegerField
      DisplayLabel = 'M'#193'QUINA'
      FieldName = 'maquina'
    end
    object qryIndiceProdutividadeOEE_Maquinadescricaomaquina: TStringField
      DisplayLabel = 'DESCRI'#199#195'O'
      FieldName = 'descricaomaquina'
      Size = 30
    end
    object qryIndiceProdutividadeOEE_MaquinaTTD: TIntegerField
      FieldName = 'TTD'
      DisplayFormat = '###,###,##0'
    end
    object qryIndiceProdutividadeOEE_MaquinaPP: TIntegerField
      FieldName = 'PP'
    end
    object qryIndiceProdutividadeOEE_MaquinaPNP: TIntegerField
      FieldName = 'PNP'
    end
    object qryIndiceProdutividadeOEE_MaquinaTempo: TIntegerField
      DisplayLabel = 'TEMPO'
      FieldName = 'Tempo'
    end
    object qryIndiceProdutividadeOEE_Maquinatcl: TIntegerField
      DisplayLabel = 'TCL'
      FieldName = 'tcl'
      DisplayFormat = '###,###,##0'
    end
    object qryIndiceProdutividadeOEE_Maquinaito: TFloatField
      DisplayLabel = 'ITO'
      FieldName = 'ito'
    end
    object qryIndiceProdutividadeOEE_Maquinaipa: TFloatField
      DisplayLabel = 'IPA'
      FieldName = 'ipa'
    end
    object qryIndiceProdutividadeOEE_Maquinaido: TFloatField
      DisplayLabel = 'IDO'
      FieldName = 'ido'
    end
    object qryIndiceProdutividadeOEE_Maquinaoee: TFloatField
      DisplayLabel = 'OEE'
      FieldName = 'oee'
    end
  end
  object dsrIndiceProdutividadeOEE: TtecDataSource
    DataSet = qryIndiceProdutividadeOEE_Maquina
    Left = 240
    Top = 40
  end
  object ExcelExport1: TExcelExport
    FontTitles.Charset = DEFAULT_CHARSET
    FontTitles.Color = clWindowText
    FontTitles.Height = -11
    FontTitles.Name = 'MS Sans Serif'
    FontTitles.Style = [fsBold]
    OrientationTitles = 0
    FontData.Charset = DEFAULT_CHARSET
    FontData.Color = clWindowText
    FontData.Height = -11
    FontData.Name = 'MS Sans Serif'
    FontData.Style = []
    StyleColumnWidth = cwAutoFit
    ColumnWidth = 80
    WorksheetName = 'Indice_Prod_por_M'#225'quinas'
    Dataset = qryIndiceProdutividadeOEE_Maquina
    Left = 328
    Top = 56
  end
  object qryTurnos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterInsert = qryTurnosAfterInsert
    AfterPost = qryTurnosAfterPost
    AfterScroll = qryTurnosAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      '       select cast('#39'M'#39' as char(1)) as turno,'
      '              cast('#39'05:00'#39' as time) as inicio,'
      '              cast('#39'13:30'#39' as time) as fim,'
      '              true as selecionar'
      ''
      '       union all'
      ''
      '       select cast('#39'V'#39' as char(1)) as turno,'
      '              cast('#39'13:30'#39' as time) as inicio,'
      '              cast('#39'22:00'#39' as time) as fim,'
      '              true as selecionar'
      ''
      '       union all'
      ''
      '       select cast('#39'N'#39' as char(1)) as turno,'
      '              cast('#39'22:00'#39' as time) as inicio,'
      '              cast('#39'05:00'#39' as time) as fim,'
      '              true as selecionar'
      ''
      ''
      '       union all'
      ''
      '       select cast('#39'X'#39' as char(1)) as turno,'
      '              cast(null as time) as inicio,'
      '              cast(null as time) as fim,'
      '              false as selecionar'
      ''
      ''
      '              ')
    RequestLive = True
    Left = 216
    Top = 152
    object qryTurnosturno: TStringField
      FieldName = 'turno'
      ReadOnly = True
      Size = 1
    end
    object qryTurnosinicio: TTimeField
      FieldName = 'inicio'
      DisplayFormat = 'HH:MM'
    end
    object qryTurnosfim: TTimeField
      FieldName = 'fim'
      DisplayFormat = 'HH:MM'
    end
    object qryTurnosselecionar: TBooleanField
      FieldName = 'selecionar'
    end
  end
  object dsrTurnos: TtecDataSource
    DataSet = qryTurnos
    Left = 256
    Top = 168
  end
  object qryIndiceProdutividadeOEE_Setor: TtecQuery
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
        Name = 'FiltroPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FiltroMaquinas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FiltroSetores'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TurnoM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TurnoV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TurnoN1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TurnoN2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TurnoX'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'SELECT Selecao.*,'
      
        '       CAST(100.0* (ITO / 100 * IPA / 100 * IDO / 100) AS NUMERI' +
        'C(5,2)) AS OEE'
      ''
      'FROM'
      ''
      '('
      ' SELECT ito.Turno, ito.SetorProducao, ito.DescricaoSetor,'
      
        '        CAST((100.0 * ido.Tempo / (ido.Tempo + ito.PNP)) AS NUME' +
        'RIC( 5,2)) AS ITO,'
      
        '        CAST((100.0 * (ito.TP - ito.PD))  / ito.TP AS NUMERIC(15' +
        ',2)) AS IPA,'
      ''
      '        CAST((SELECT COUNT(*)'
      '                 FROM (SELECT DISTINCT oou.Maquina'
      '                          FROM OperacoesOSPUsuario oou'
      
        '                               JOIN Maquinas m  ON oou.Maquina  ' +
        '= m.Codigo'
      
        '                                    JOIN SetoresProducao sp ON s' +
        'p.Codigo = m.SetorProducao'
      
        '                          WHERE COALESCE(oou.Quantidade,0) > 0  ' +
        '        AND'
      
        '                                oou.DataTermino IS NOT NULL     ' +
        '        AND'
      
        '                                oou.Termino     IS NOT NULL     ' +
        '        AND'
      
        '                                TempoPadrao(oou.Operacao, oou.Da' +
        'ta) > 0 AND'
      
        '                                m.SetorProducao = ito.SetorProdu' +
        'cao'
      ''
      '                                %FiltroPeriodo'
      '                                %FiltroMaquinas'
      
        '                                %FiltroSetores) AS s) AS INTEGER' +
        ') * ido.TTD AS TTD,'
      '        ido.PP, ido.PNP, ido.Tempo, ido.TCL, ido.IDO'
      ''
      ' FROM'
      ''
      ' ('
      '  SELECT m.setorproducao, sp.descricao AS DescricaoSetor,'
      ''
      
        '                                             /* Total do Tempo d' +
        'isponivel ttd */'
      
        '        (EXTRACT(EPOCH FROM ((CAST(CAST(:DataFinal   AS DATE) + ' +
        '1 AS TIMESTAMP) -'
      
        '                                   CAST(:DataInicial AS TIMESTAM' +
        'P))) / 60) -'
      ''
      '         COALESCE(SUM((SELECT SUM(ooup.TempoParada)'
      '                       FROM OperacoesOSPUsuarioParadas ooup'
      
        '                            JOIN MotivosParadas mp ON ooup.Codig' +
        'oParada = mp.Codigo AND'
      
        '                                                      NOT COALES' +
        'CE(mp.ParadaNaoProgramada,FALSE)'
      ''
      
        '                       WHERE ooup.OSP  = oou.OSP  AND ooup.Opera' +
        'cao = oou.Operacao AND ooup.Data   = oou.Data AND'
      
        '                             ooup.Lote = oou.Lote AND ooup.Usuar' +
        'io = oou.Usuario   AND ooup.Inicio = oou.Inicio)),0)) AS TC,'
      
        '                        /* Paradas programadas  -> resultado tc ' +
        'Tempo de carga*/'
      ''
      '         SUM(oou.Quantidade) AS tp, /* total produzIDO */'
      ''
      '         COALESCE(SUM((SELECT SUM(ooup.TempoParada)'
      '                       FROM OperacoesOSPUsuarioParadas ooup'
      
        '                            JOIN MotivosParadas mp ON ooup.Codig' +
        'oParada = mp.Codigo AND'
      
        '                                                      COALESCE(m' +
        'p.ParadaNaoProgramada,FALSE)'
      ''
      
        '                       WHERE ooup.OSP  = oou.OSP  AND ooup.Opera' +
        'cao = oou.Operacao AND ooup.Data   = oou.Data AND'
      
        '                             ooup.Lote = oou.Lote AND ooup.Usuar' +
        'io = oou.Usuario   AND ooup.Inicio = oou.Inicio)), 0) AS PNP,'
      
        '                                                     /* Parada n' +
        #227'o programada */'
      ''
      
        '         coalesce(SUM((select sum(QuantidadePerda) from Operacoe' +
        'sOSPUsuariofalhas_(OOU.OSP, OOU.LOTE, OOU.Operacao, OOU.Usuario,' +
        ' OOU.Data, OOU.Inicio, cast(null as char)))),0) as PD,'
      
        '                                                      /* produto' +
        's defeituosos */'
      '         TipoTurno.Turno'
      ''
      '  FROM OperacoesOSPUsuario oou'
      ''
      '   JOIN'
      '      ('
      
        '       %TurnoM  /* SELECT cast('#39'M'#39' AS char(1)) AS Turno, cast('#39'0' +
        '5:00:00'#39' AS time) AS Inicio, cast('#39'13:30:00'#39' AS time) AS fim */'
      '       UNION ALL'
      
        '       %TurnoV /* SELECT cast('#39'V'#39' AS char(1)) AS Turno, cast('#39'13' +
        ':30:01'#39' AS time) AS Inicio, cast('#39'22:00:00'#39' AS time) AS fim */'
      '       UNION ALL'
      
        '       %TurnoN1 /* SELECT cast('#39'N'#39' AS char(1)) AS Turno, cast('#39'2' +
        '2:00:01'#39' AS time) AS Inicio, cast('#39'23:59:59'#39' AS time) AS fim */'
      '       UNION ALL'
      
        '       %TurnoN2 /* SELECT cast('#39'N'#39' AS char(1)) AS Turno, cast('#39'0' +
        '0:00:01'#39' AS time) AS Inicio, cast('#39'04:59:59'#39' AS time) AS fim */'
      '       UNION ALL'
      
        '       %TurnoX /* SELECT cast('#39'X'#39' AS char(1)) AS Turno, cast('#39'00' +
        ':00:01'#39' AS time) AS Inicio, cast('#39'04:59:59'#39' AS time) AS fim */'
      '      ) AS TipoTurno'
      '      ON oou.Inicio BETWEEN TipoTurno.Inicio and TipoTurno.Fim'
      ''
      '       JOIN Operacoes o ON oou.Operacao = o.Codigo'
      '       JOIN Maquinas m  ON oou.Maquina  = m.Codigo'
      '            join setoresproducao sp'
      '              on  m.setorproducao = sp.codigo'
      ''
      '  WHERE COALESCE(oou.Quantidade,0) > 0 AND'
      '        oou.DataTermino IS NOT NULL    AND'
      '        oou.Termino     IS NOT NULL    AND'
      '        TempoPadrao(o.Codigo, oou.Data) > 0'
      ''
      '        %FiltroPeriodo'
      '        %FiltroMaquinas'
      '        %FiltroSetores'
      ''
      '  GROUP BY m.setorproducao, sp.Descricao, TipoTurno.Turno'
      ' ) AS ito'
      ''
      ' JOIN'
      ''
      ' ('
      '  SELECT Turno, SetorProducao, DescricaoSetor,'
      
        '         CAST(SUM(IDO * Tempo) / SUM(Tempo) AS NUMERIC(5,2)) AS ' +
        'IDO,'
      ''
      
        '         CAST((EXTRACT(EPOCH FROM ((CAST(CAST(:DataFinal   AS DA' +
        'TE) + 1 AS TIMESTAMP) -'
      
        '                                         CAST(:DataInicial AS TI' +
        'MESTAMP))) / 60)) AS INTEGER) AS TTD,'
      ''
      '         CAST(SUM(PP)    AS INTEGER) AS PP,'
      '         CAST(SUM(PNP)   AS INTEGER) AS PNP,'
      '         CAST(SUM(Tempo) AS INTEGER) AS Tempo,'
      ''
      ''
      '        CAST(CAST((SELECT COUNT(*)'
      '                      FROM (SELECT DISTINCT oou.Maquina'
      '                               FROM OperacoesOSPUsuario oou'
      
        '                                    JOIN Maquinas m  ON oou.Maqu' +
        'ina  = m.Codigo'
      
        '                                         JOIN SetoresProducao sp' +
        ' ON sp.Codigo = m.SetorProducao'
      
        '                               WHERE COALESCE(oou.Quantidade,0) ' +
        '> 0          AND'
      
        '                                     oou.DataTermino IS NOT NULL' +
        '             AND'
      
        '                                     oou.Termino     IS NOT NULL' +
        '             AND'
      
        '                                     TempoPadrao(oou.Operacao, o' +
        'ou.Data) > 0 AND'
      
        '                                     m.SetorProducao = ido.Setor' +
        'Producao'
      ''
      '                                     %FiltroPeriodo'
      '                                     %FiltroMaquinas'
      '                                     %FiltroSetores) AS s) *'
      
        '                  (EXTRACT(EPOCH FROM ((CAST(CAST(:DataFinal AS ' +
        'DATE) + 1 AS TIMESTAMP) -'
      
        '                                             CAST(:DataInicial A' +
        'S TIMESTAMP))) / 60)) AS INTEGER) /*Total do Tempo disponivel tt' +
        'd */'
      '          - SUM(PP) - SUM(PNP) - SUM(Tempo) AS INTEGER) AS TCL'
      '  FROM'
      ''
      '  ('
      '   SELECT Turno, SetorProducao, DescricaoSetor,'
      
        '          CAST((100.0 * TP * TCT) / Tempo /* (TTD - TCL - pp - P' +
        'NP)*/ AS NUMERIC(15,2)) AS IDO,'
      '          Tempo,'
      '          PP, PNP'
      '          /*cast(TTD - PP - PNP - Tempo as integer) AS TC*/'
      '   FROM'
      ''
      '   ('
      '    SELECT ido.SetorProducao, ido.DescricaoSetor,'
      ''
      '         SUM(Intervalo) + SUM(ido.PP) AS PP,'
      '         SUM(ido.TP) AS TP,'
      '         ido.TCT,'
      '         ido.TCT AS TempoPadrao,'
      ''
      '         SUM(ido.PNP) AS PNP,'
      
        '         SUM(ido.Tempo) - SUM(ido.PP) - SUM(ido.PNP) - SUM(Inter' +
        'valo) AS Tempo,'
      ''
      '         ido.Turno /*,'
      ''
      '         SUM(ido.TCL - ido.Tempo - ido.PP - ido.PNP) AS TCL */'
      '    FROM'
      ''
      '    ('
      '     SELECT m.setorproducao, sp.Descricao AS DescricaoSetor,'
      ''
      
        '            /*----------------------------------------- O interv' +
        'alo '#233' considerado PP - Parada Programada */'
      '            CASE WHEN oou.Intervalo IS NOT NULL'
      '                 THEN oou.Intervalo'
      
        '                 ELSE NrMinutosIntervaloTurno(oou.Data, oou.Inic' +
        'io, oou.DataTermino, oou.Termino, u.Turno)'
      '            END AS Intervalo,'
      ''
      '            COALESCE(SUM((SELECT SUM(ooup.TempoParada)'
      
        '                             FROM OperacoesOSPUsuarioParadas oou' +
        'p'
      '                                  JOIN MotivosParadas mp'
      
        '                                  ON ooup.CodigoParada = mp.Codi' +
        'go AND'
      
        '                                     NOT COALESCE(mp.ParadaNaoPr' +
        'ogramada,FALSE)'
      
        '                             WHERE ooup.OSP  = oou.OSP  AND ooup' +
        '.Operacao = oou.Operacao AND ooup.Data   = oou.Data AND'
      
        '                                   ooup.Lote = oou.Lote AND ooup' +
        '.Usuario  = oou.Usuario  AND ooup.Inicio = oou.Inicio)), 0) AS P' +
        'P,'
      
        '                         /* Paradas programadas -> resultado tc ' +
        'Tempo de carga*/'
      ''
      '            SUM(oou.Quantidade) AS TP, /* total produzIDO */'
      ''
      
        '            TempoPadrao(o.Codigo, oou.Data) / 100.0 AS TCT, /*Te' +
        'mpo ciclo t'#233'cnico */'
      ''
      '            COALESCE(SUM((SELECT SUM(ooup.TempoParada)'
      
        '                             FROM OperacoesOSPUsuarioParadas oou' +
        'p'
      '                                  JOIN MotivosParadas mp'
      
        '                                  ON ooup.CodigoParada = mp.Codi' +
        'go AND'
      
        '                                     COALESCE(mp.ParadaNaoProgra' +
        'mada,FALSE)'
      
        '                             WHERE ooup.OSP  = oou.OSP  AND ooup' +
        '.Operacao = oou.Operacao AND ooup.Data   = oou.Data AND'
      
        '                                   ooup.Lote = oou.Lote AND ooup' +
        '.Usuario = oou.Usuario   AND ooup.Inicio = oou.Inicio)), 0) AS P' +
        'NP,'
      
        '                                                     /* Parada n' +
        #227'o programada */'
      ''
      
        '            CAST(SUM((EXTRACT(EPOCH FROM (CAST(oou.DataTermino |' +
        '| '#39' '#39' || oou.Termino AS TIMESTAMP)) -'
      
        '                                         (CAST(oou.Data        |' +
        '| '#39' '#39' || oou.Inicio  AS TIMESTAMP))) / 60)) AS INTEGER) AS Tempo' +
        ','
      ''
      '            TipoTurno.Turno /*,'
      '            TipoSemana.TCL  */'
      ''
      ''
      '     FROM OperacoesOSPUsuario oou'
      ''
      '          JOIN ('
      
        '                %TurnoM  /* SELECT cast('#39'M'#39' AS char(1)) AS Turno' +
        ', cast('#39'05:00:00'#39' AS time) AS Inicio, cast('#39'13:30:00'#39' AS time) A' +
        'S fim */'
      '                UNION ALL'
      
        '                %TurnoV /* SELECT cast('#39'V'#39' AS char(1)) AS Turno,' +
        ' cast('#39'13:30:01'#39' AS time) AS Inicio, cast('#39'22:00:00'#39' AS time) AS' +
        ' fim */'
      '                UNION ALL'
      
        '                %TurnoN1 /* SELECT cast('#39'N'#39' AS char(1)) AS Turno' +
        ', cast('#39'22:00:01'#39' AS time) AS Inicio, cast('#39'23:59:59'#39' AS time) A' +
        'S fim */'
      '                UNION ALL'
      
        '                %TurnoN2 /* SELECT cast('#39'N'#39' AS char(1)) AS Turno' +
        ', cast('#39'00:00:01'#39' AS time) AS Inicio, cast('#39'04:59:59'#39' AS time) A' +
        'S fim */'
      '                UNION ALL'
      
        '                %TurnoX /* SELECT cast('#39'X'#39' AS char(1)) AS Turno,' +
        ' cast('#39'00:00:01'#39' AS time) AS Inicio, cast('#39'04:59:59'#39' AS time) AS' +
        ' fim */'
      '              ) AS TipoTurno'
      
        '          ON oou.Inicio BETWEEN TipoTurno.Inicio and TipoTurno.f' +
        'im'
      '                              /*'
      '          JOIN ('
      
        '                SELECT 1 AS DiaSemana, :ValorTCLSemana AS TCL UN' +
        'ION ALL'
      
        '                SELECT 2 AS DiaSemana, :ValorTCLSemana AS TCL UN' +
        'ION ALL'
      
        '                SELECT 3 AS DiaSemana, :ValorTCLSemana AS TCL UN' +
        'ION ALL'
      
        '                SELECT 4 AS DiaSemana, :ValorTCLSemana AS TCL UN' +
        'ION ALL'
      
        '                SELECT 5 AS DiaSemana, :ValorTCLSemana AS TCL UN' +
        'ION ALL'
      
        '                SELECT 6 AS DiaSemana, :ValorTCLSabado AS TCL UN' +
        'ION ALL'
      '                SELECT 0 AS DiaSemana, :ValorTCLDomingo AS TCL'
      '               ) AS TipoSemana'
      '          ON EXTRACT(DOW FROM oou.data) = TipoSemana.DiaSemana'
      '          */'
      ''
      '          JOIN Operacoes o ON oou.Operacao = o.Codigo'
      '          JOIN Usuarios  u ON oou.Usuario  = u.Codigo'
      '          JOIN Maquinas  m ON oou.Maquina  = m.Codigo'
      '               JOIN SetoresProducao sp'
      '               ON  m.SetorProducao = sp.Codigo'
      ''
      ''
      '     WHERE COALESCE(oou.Quantidade,0) > 0 AND'
      '           oou.DataTermino IS NOT NULL    AND'
      '           oou.Termino     IS NOT NULL    AND'
      '           TempoPadrao(o.Codigo, oou.Data) > 0'
      ''
      '           %FiltroPeriodo'
      '           %FiltroMaquinas'
      '           %FiltroSetores'
      '           '
      ''
      
        '     GROUP BY m.setorproducao, sp.Descricao, tct, TipoTurno.Turn' +
        'o, /*TipoSemana.TCL,*/ oou.Data, Intervalo, oou.Inicio, oou.Data' +
        'Termino, oou.Termino, u.Turno'
      '    ) AS ido'
      ''
      '    WHERE ido.Tempo <> 0'
      '    GROUP BY SetorProducao, DescricaoSetor, TCT, Turno'
      ''
      '   ) AS ido'
      ''
      '  ) AS ido'
      '  GROUP BY SetorProducao, DescricaoSetor, Turno'
      ''
      ' ) AS ido'
      ' ON ito.SetorProducao = Ido.SetorProducao AND'
      '    ito.Turno   = ido.Turno'
      ''
      ') AS Selecao'
      'ORDER BY SetorProducao, CASE WHEN Turno = '#39'M'#39'           THEN 1'
      '                             WHEN Turno = '#39'V'#39'           THEN 2'
      '                             WHEN Turno IN ('#39'N1'#39', '#39'N2'#39') THEN 3'
      '                                                        ELSE 4'
      '                        END'
      '')
    RequestLive = False
    Left = 96
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ValorTCLSemana'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ValorTCLSabado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ValorTCLDomingo'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      DisplayLabel = 'TURNO'
      FieldName = 'turno'
      Size = 1
    end
    object qryIndiceProdutividadeOEE_SetorSetorProducao: TStringField
      DisplayLabel = 'SETOR'
      FieldName = 'SetorProducao'
      Size = 4
    end
    object qryIndiceProdutividadeOEE_SetorDescricaoSetor: TStringField
      DisplayLabel = 'DESCRI'#199#195'O'
      FieldName = 'DescricaoSetor'
      Size = 50
    end
    object IntegerField2: TIntegerField
      FieldName = 'TTD'
      DisplayFormat = '###,###,##0'
    end
    object IntegerField3: TIntegerField
      FieldName = 'PP'
    end
    object IntegerField4: TIntegerField
      FieldName = 'PNP'
    end
    object IntegerField5: TIntegerField
      DisplayLabel = 'TEMPO'
      FieldName = 'Tempo'
    end
    object IntegerField6: TIntegerField
      DisplayLabel = 'TCL'
      FieldName = 'tcl'
      DisplayFormat = '###,###,##0'
    end
    object FloatField1: TFloatField
      DisplayLabel = 'ITO'
      FieldName = 'ito'
    end
    object FloatField2: TFloatField
      DisplayLabel = 'IPA'
      FieldName = 'ipa'
    end
    object FloatField3: TFloatField
      DisplayLabel = 'IDO'
      FieldName = 'ido'
    end
    object FloatField4: TFloatField
      DisplayLabel = 'OEE'
      FieldName = 'oee'
    end
  end
end
