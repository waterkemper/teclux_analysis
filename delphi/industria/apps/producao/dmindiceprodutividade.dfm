inherited dtmIndiceProdutividade: TdtmIndiceProdutividade
  OldCreateOrder = False
  Left = 588
  Top = 199
  Height = 462
  Width = 647
  object qryIndiceProdutividade: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryIndiceProdutividadeAfterOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      '')
    RequestLive = True
    Left = 96
    Top = 56
  end
  object dsrIndiceProdutividade: TtecDataSource
    DataSet = qryIndiceProdutividade
    Left = 152
    Top = 72
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
    WorksheetName = 'Indice_Prod_Setor_e_Funcion'#225'rio'
    Dataset = qryIndiceProdutividade
    Left = 328
    Top = 56
  end
  object qryEficienciaporOperacaodeOSP: TtecQuery
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
        Name = 'FiltroSetoresProducao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FiltroFuncionarios'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      
        'SELECT COALESCE(m.SetorProducao, CAST(NULL AS VARCHAR(4))) AS Se' +
        'torProducao,'
      ''
      
        '       COALESCE(sp.Descricao, CAST('#39'DIVERSOS'#39' AS VARCHAR(50))) A' +
        'S DescricaoSetor,'
      ''
      '       oou.Usuario,'
      '       u.Nome AS NomeUsuario,'
      '       oou.OSP, oou.Lote,  '
      #9'   '
      '      (SELECT cp.PN'
      '          FROM clientesprodutos cp'
      '         '#9'WHERE cp.Cliente     = osp.Cliente    AND'
      #9#9'            cp.TipoCliente = cp.TipoCliente AND'
      #9#9'            cp.Produto     = osp.Produto) AS PN,'
      ''
      '        o.Nome AS NomeOperacao,'
      '        o.C01,'
      '        o.C02,'
      '        o.C03,'
      ''
      '        TempoPadrao(oou.Operacao, oou.Data) AS TempoPadrao,'
      ''
      '        oou.Data,'
      '        oou.Quantidade,'
      ''
      
        '        TempoOperacaoUsuario     (oou.OSP, oou.Lote, oou.Operaca' +
        'o, oou.Usuario, oou.Data, oou.Inicio) AS Tempo,'
      
        '        EficienciaOperacaoUsuario(oou.OSP, oou.Lote, oou.Operaca' +
        'o, oou.Usuario, oou.Data, oou.Inicio) * 100 AS Eficiencia,'
      
        '        QualidadeOperacaoUsuario (oou.OSP, oou.Lote, oou.Operaca' +
        'o, oou.Usuario, oou.Data, oou.Inicio) * 100 AS Qualidade,'
      ''
      ''
      '       (SELECT COALESCE(SUM(QuantidadePerda), 0)'
      
        '        FROM (select * from OperacoesOSPUsuarioFalhas_(OOU.OSP, ' +
        'OOU.LOTE, OOU.Operacao, OOU.Usuario, OOU.Data, OOU.Inicio, cast(' +
        'null as char))) oouf'
      '        JOIN Falhas f ON f.Codigo = oouf.Falha'
      '        WHERE (f.TipoFalha IN ('#39'I'#39','#39'P'#39'))) AS Perda'
      ''
      ''
      ' FROM OperacoesOSPUsuario oou'
      '      JOIN Operacoes o ON oou.Operacao = o.Codigo'
      '      JOIN Usuarios u  ON oou.Usuario  = u.Codigo'
      '      JOIN Maquinas m'
      '           JOIN SetoresProducao sp'
      '           ON sp.Codigo = m.SetorProducao'
      
        '      ON m.Codigo = COALESCE(oou.Maquina, (SELECT om.Maquina FRO' +
        'M OperacoesMaquinas om'
      
        '                                              WHERE om.Operacao ' +
        '= oou.Operacao LIMIT 1))'
      '      JOIN OSP'
      '      ON oou.OSP = osp.Numero'
      ''
      ''
      ' WHERE oou.Usuario = oou.UsuarioTermino'
      '   AND COALESCE(oou.Quantidade,0) <> 0'
      '   AND oou.DataTermino IS NOT NULL'
      '   AND oou.Termino     IS NOT NULL'
      ''
      ''
      '       %FiltroPeriodo'
      '       %FiltroSetoresProducao'
      '       %FiltroFuncionarios'
      ''
      
        'ORDER BY SetorProducao, DescricaoSetor, oou.Usuario, NomeUsuario' +
        ', oou.OSP, oou.Lote, NomeOperacao, o.C01, o.C02, o.C03, TempoPad' +
        'rao'
      ''
      ''
      '/* PAR'#194'METROS'
      ':DataInicial'
      ':DataFinal'
      '*/'
      '')
    RequestLive = False
    Left = 96
    Top = 160
    ParamData = <
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
    object qryEficienciaporOperacaodeOSPsetorproducao: TStringField
      Alignment = taCenter
      DisplayLabel = 'SETOR'
      FieldName = 'setorproducao'
      Size = 5
    end
    object qryEficienciaporOperacaodeOSPdescricaosetor: TStringField
      DisplayLabel = 'DESCRI'#199#195'O DO SETOR'
      FieldName = 'descricaosetor'
    end
    object qryEficienciaporOperacaodeOSPusuario: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'OPERADOR'
      DisplayWidth = 5
      FieldName = 'usuario'
      Required = True
      DisplayFormat = '0'
    end
    object qryEficienciaporOperacaodeOSPnomeusuario: TStringField
      DisplayLabel = 'NOME DO OPERADOR'
      FieldName = 'nomeusuario'
      Required = True
      Size = 30
    end
    object qryEficienciaporOperacaodeOSPosp: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'OSP'
      DisplayWidth = 8
      FieldName = 'osp'
      Required = True
      DisplayFormat = '###,##0'
    end
    object qryEficienciaporOperacaodeOSPlote: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'LOTE'
      DisplayWidth = 3
      FieldName = 'lote'
      Required = True
      DisplayFormat = '0'
    end
    object qryEficienciaporOperacaodeOSPpn: TStringField
      Alignment = taCenter
      DisplayLabel = 'PN'
      FieldName = 'pn'
      Size = 5
    end
    object qryEficienciaporOperacaodeOSPnomeoperacao: TStringField
      DisplayLabel = 'OPERA'#199#195'O'
      FieldName = 'nomeoperacao'
      Size = 10
    end
    object qryEficienciaporOperacaodeOSPc01: TStringField
      Alignment = taCenter
      DisplayLabel = 'C1'
      FieldName = 'c01'
      Size = 3
    end
    object qryEficienciaporOperacaodeOSPc02: TStringField
      Alignment = taCenter
      DisplayLabel = 'C2'
      FieldName = 'c02'
      Size = 3
    end
    object qryEficienciaporOperacaodeOSPc03: TStringField
      Alignment = taCenter
      DisplayLabel = 'C3'
      FieldName = 'c03'
      Size = 3
    end
    object qryEficienciaporOperacaodeOSPtempopadrao: TFloatField
      DisplayLabel = 'TEMPO PADR'#195'O'
      FieldName = 'tempopadrao'
      DisplayFormat = '0.00'
    end
    object qryEficienciaporOperacaodeOSPdata: TDateField
      Alignment = taCenter
      DisplayLabel = 'DATA'
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object qryEficienciaporOperacaodeOSPquantidade: TIntegerField
      DisplayLabel = 'QUANTIDADE'
      DisplayWidth = 8
      FieldName = 'quantidade'
      DisplayFormat = '###,##0'
    end
    object qryEficienciaporOperacaodeOSPtempo: TIntegerField
      DisplayLabel = 'TEMPO'
      DisplayWidth = 5
      FieldName = 'tempo'
      DisplayFormat = '0'
    end
    object qryEficienciaporOperacaodeOSPeficiencia: TFloatField
      DisplayLabel = 'EFICI'#202'NCIA'
      DisplayWidth = 6
      FieldName = 'eficiencia'
      DisplayFormat = '##0.00'
    end
    object qryEficienciaporOperacaodeOSPqualidade: TFloatField
      DisplayLabel = 'QUALIDADE'
      DisplayWidth = 5
      FieldName = 'qualidade'
      DisplayFormat = '##0.00'
    end
    object qryEficienciaporOperacaodeOSPperda: TLargeintField
      DisplayLabel = 'PERDA'
      DisplayWidth = 6
      FieldName = 'perda'
      DisplayFormat = '###,##0'
    end
  end
  object qryPremiacaoFuncionariosSetor: TtecQuery
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
        Name = 'FiltroSetoresProducao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FiltroFuncionarios'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';'
      'SELECT  *, PremioUsuario + PremioSetor AS PremioTotal'
      'FROM'
      '('
      ' SELECT SetorProducao, Usuario, NomeUsuario,'
      ''
      '       EficienciaUsuario * 100 AS EficienciaUsuario,'
      ''
      
        '                                   /* Na premia'#231#227'o, a efici'#234'ncia' +
        ' m'#225'xima '#233' 100 */'
      '       CASE WHEN EficienciaUsuario <  0.70 THEN 0'
      
        '            WHEN EficienciaUsuario <  0.80 THEN EficienciaUsuari' +
        'o * ValorPremio / 4'
      
        '            WHEN EficienciaUsuario <= 1.00 THEN EficienciaUsuari' +
        'o * ValorPremio / 2'
      '                                           ELSE ValorPremio / 2'
      '       END  AS PremioUsuario,'
      ''
      '       EficienciaSetor * 100 AS EficienciaSetor,'
      ''
      
        '                                   /* Na premia'#231#227'o, a efici'#234'ncia' +
        ' m'#225'xima '#233' 100 */'
      '       CASE WHEN EficienciaUsuario <  0.70 THEN 0'
      
        '            WHEN EficienciaUsuario <  0.80 THEN (CASE WHEN Efici' +
        'enciaSetor > 1.00'
      '                                                      THEN 1.00'
      
        '                                                      ELSE Efici' +
        'enciaSetor'
      
        '                                                 END) * ValorPre' +
        'mio / 4'
      ''
      
        '            WHEN EficienciaUsuario <= 1.00 THEN (CASE WHEN Efici' +
        'enciaSetor > 1.00'
      '                                                      THEN 1.00'
      
        '                                                      ELSE Efici' +
        'enciaSetor'
      
        '                                                 END) * ValorPre' +
        'mio / 2'
      ''
      
        '                                           ELSE (CASE WHEN Efici' +
        'enciaSetor > 1.00'
      '                                                      THEN 1.00'
      
        '                                                      ELSE Efici' +
        'enciaSetor'
      
        '                                                 END) * ValorPre' +
        'mio / 2'
      '          END  AS PremioSetor'
      ''
      '   FROM'
      ' ('
      ''
      ''
      '  SELECT Setores.SetorProducao, Setores.DescricaoSetor,'
      ''
      '         CASE WHEN Setores.SomaTempo <> 0'
      '              THEN Setores.EficienciaTempo / Setores.SomaTempo'
      '              ELSE 0'
      '         END AS EficienciaSetor,'
      ''
      '        (SELECT spp.valor'
      '            FROM SetoresProducaopremiacao spp'
      '            WHERE spp.Setor = Setores.SetorProducao AND'
      
        '                  spp.Mes   = TO_CHAR(CAST(:DataInicial AS DATE)' +
        ', '#39'MM/YYYY'#39')) AS ValorPremio,'
      ''
      ''
      '         Usuarios.Usuario,'
      '         Usuarios.NomeUsuario,'
      '         Usuarios.EficienciaUsuario'
      ''
      '  FROM'
      '  ('
      
        '   SELECT COALESCE(m.SetorProducao, CAST(NULL AS VARCHAR(4))) AS' +
        ' SetorProducao,'
      
        '          COALESCE(sp.Descricao, CAST('#39'DIVERSOS'#39' AS VARCHAR(50))' +
        ') AS DescricaoSetor,'
      ''
      
        '          SUM(EficienciaOperacaoUsuario(oou.OSP, oou.Lote, oou.O' +
        'peracao, oou.Usuario, oou.Data, oou.Inicio) *'
      
        '              TempoOperacaoUsuario     (oou.OSP, oou.Lote, oou.O' +
        'peracao, oou.Usuario, oou.Data, oou.Inicio)) AS EficienciaTempo,'
      ''
      
        '          SUM(TempoOperacaoUsuario     (oou.OSP, oou.Lote, oou.O' +
        'peracao, oou.Usuario, oou.Data, oou.Inicio)) AS SomaTempo'
      ''
      ''
      ' FROM OperacoesOSPUsuario oou'
      '      JOIN Operacoes o'
      '           JOIN InstrucoesTrabalhoOperacoes ito'
      '                JOIN UsuariosInstrucoesTrabalho uit'
      '                ON ito.InstrucaoTrabalho = uit.InstrucaoTrabalho'
      '           ON o.Codigo = ito.Operacao'
      '      ON oou.Operacao = o.Codigo AND uit.Usuario = oou.Usuario'
      ''
      '      JOIN Usuarios u ON oou.Usuario = u.Codigo'
      ''
      '      JOIN Maquinas m'
      '           JOIN SetoresProducao sp'
      '           ON sp.Codigo = m.SetorProducao'
      
        '      ON m.Codigo  = COALESCE(oou.Maquina, (SELECT om.Maquina FR' +
        'OM OperacoesMaquinas om'
      
        '                                               WHERE om.Operacao' +
        ' = oou.Operacao LIMIT 1))'
      ''
      ''
      ' WHERE oou.Usuario = oou.UsuarioTermino AND'
      '       COALESCE(oou.Quantidade,0) <> 0  AND'
      '       oou.DataTermino IS NOT NULL      AND'
      '       oou.Termino     IS NOT NULL      AND'
      ''
      '       CASE WHEN uit.DataInicialTreinamento IS NOT NULL'
      
        '                 THEN CASE WHEN uit.DataFinalTreinamento IS NOT ' +
        'NULL'
      
        '                           THEN NOT (oou.Data BETWEEN uit.DataIn' +
        'icialTreinamento AND'
      
        '                                                      uit.DataFi' +
        'nalTreinamento)'
      
        '                           ELSE NOT (oou.Data >= uit.DataInicial' +
        'Treinamento)'
      '                      END'
      '                 ELSE TRUE'
      '       END  AND'
      ''
      '       TempoPadrao(oou.Operacao, oou.Data) > 0'
      ''
      '       %FiltroPeriodo'
      '       %FiltroSetoresProducao'
      ''
      '   GROUP BY SetorProducao, DescricaoSetor'
      '  ) AS Setores'
      ''
      '  JOIN'
      ''
      '  ('
      '  SELECT SetorProducao, DescricaoSetor, Usuario, NomeUsuario,'
      ''
      '         CASE WHEN SomaTempo <> 0'
      '              THEN EficienciaTempo / SomaTempo'
      '              ELSE 0'
      '         END AS EficienciaUsuario'
      ''
      '  FROM'
      '  ('
      
        '   SELECT COALESCE(m.SetorProducao, CAST(NULL AS VARCHAR(4))) AS' +
        ' SetorProducao,'
      
        '          COALESCE(sp.Descricao, CAST('#39'DIVERSOS'#39' AS VARCHAR(50))' +
        ') AS DescricaoSetor,'
      '          oou.Usuario, u.Nome AS NomeUsuario,'
      ''
      
        '          SUM(EficienciaOperacaoUsuario(oou.OSP, oou.Lote, oou.O' +
        'peracao, oou.Usuario, oou.Data, oou.Inicio) *'
      
        '              TempoOperacaoUsuario     (oou.OSP, oou.Lote, oou.O' +
        'peracao, oou.Usuario, oou.Data, oou.Inicio)) AS EficienciaTempo,'
      ''
      
        '          SUM(TempoOperacaoUsuario     (oou.OSP, oou.Lote, oou.O' +
        'peracao, oou.Usuario, oou.Data, oou.Inicio)) AS SomaTempo'
      ''
      ''
      ' FROM OperacoesOSPUsuario oou'
      '      JOIN Operacoes o'
      '           JOIN InstrucoesTrabalhoOperacoes ito'
      '                JOIN UsuariosInstrucoesTrabalho uit'
      '                ON ito.InstrucaoTrabalho = uit.InstrucaoTrabalho'
      '           ON o.Codigo = ito.Operacao'
      '      ON oou.Operacao = o.Codigo AND uit.Usuario = oou.Usuario'
      ''
      '      JOIN Usuarios u  ON oou.Usuario  = u.Codigo'
      ''
      '      JOIN Maquinas m'
      '           JOIN SetoresProducao sp'
      '           ON sp.Codigo = m.SetorProducao'
      
        '      ON m.Codigo = COALESCE(oou.Maquina, (SELECT om.Maquina FRO' +
        'M OperacoesMaquinas om'
      
        '                                              WHERE om.Operacao ' +
        '= oou.Operacao LIMIT 1))'
      ''
      ' WHERE oou.Usuario = oou.UsuarioTermino AND'
      '       COALESCE(oou.Quantidade,0) <> 0  AND'
      '       oou.DataTermino IS NOT NULL      AND'
      '       oou.Termino     IS NOT NULL      AND'
      ''
      '       CASE WHEN uit.DataInicialTreinamento IS NOT NULL'
      '            THEN CASE WHEN uit.DataFinalTreinamento IS NOT NULL'
      
        '                      THEN NOT (oou.Data BETWEEN uit.DataInicial' +
        'Treinamento AND'
      
        '                                                 uit.DataFinalTr' +
        'einamento)'
      
        '                      ELSE NOT (oou.Data >= uit.DataInicialTrein' +
        'amento)'
      '                 END'
      ''
      '            ELSE TRUE'
      '       END  AND'
      ''
      '       TempoPadrao(oou.Operacao, oou.Data) > 0'
      ''
      '       %FiltroPeriodo'
      '       %FiltroSetoresProducao'
      '       %FiltroFuncionarios'
      ''
      
        '   GROUP BY SetorProducao, DescricaoSetor, oou.Usuario, NomeUsua' +
        'rio'
      '  ) AS Usuarios'
      '  ) AS Usuarios'
      '  on Setores.SetorProducao = Usuarios.SetorProducao'
      ' ) AS premiacao'
      ') AS premiacao'
      'ORDER BY SetorProducao, Usuario'
      ''
      ''
      ''
      '/* PAR'#194'METROS'
      ':DataInicial'
      ':DataFinal'
      '*/'
      '')
    RequestLive = False
    Left = 96
    Top = 224
    ParamData = <
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
    object qryPremiacaoFuncionariosSetorsetorproducao: TStringField
      Alignment = taCenter
      DisplayLabel = 'SETOR'
      FieldName = 'setorproducao'
      Size = 5
    end
    object qryPremiacaoFuncionariosSetorusuario: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'OPERADOR'
      DisplayWidth = 5
      FieldName = 'usuario'
      DisplayFormat = '0'
    end
    object qryPremiacaoFuncionariosSetornomeusuario: TStringField
      DisplayLabel = 'NOME DO OPERADOR'
      FieldName = 'nomeusuario'
      Size = 30
    end
    object qryPremiacaoFuncionariosSetoreficienciausuario: TFloatField
      DisplayLabel = 'EFICI'#202'NCIA OPERADOR'
      FieldName = 'eficienciausuario'
      DisplayFormat = '0.00'
    end
    object qryPremiacaoFuncionariosSetorpremiousuario: TFloatField
      DisplayLabel = 'PR'#202'MIO OPERADOR'
      FieldName = 'premiousuario'
      DisplayFormat = '###,##0.00'
    end
    object qryPremiacaoFuncionariosSetoreficienciasetor: TFloatField
      DisplayLabel = 'EFICI'#202'NCIA SETOR'
      FieldName = 'eficienciasetor'
      DisplayFormat = '0.00'
    end
    object qryPremiacaoFuncionariosSetorpremiosetor: TFloatField
      DisplayLabel = 'PR'#202'MIO SETOR'
      FieldName = 'premiosetor'
      DisplayFormat = '###,##0.00'
    end
    object qryPremiacaoFuncionariosSetorpremiototal: TFloatField
      DisplayLabel = 'PR'#202'MIO TOTAL'
      FieldName = 'premiototal'
      DisplayFormat = '###,##0.00'
    end
  end
  object qryPremiacaoLideres: TtecQuery
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
        Name = 'FiltroSetoresProducao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';'
      'SELECT Setores.Usuario, Setores.NomeUsuario,'
      '       Premiacao.*,'
      '       CAST(NULL AS NUMERIC(15,2)) AS MediaEficiencia,'
      '       CAST(NULL AS NUMERIC(15,2)) AS ValorPremioLider'
      ''
      'FROM'
      ''
      '('
      ' SELECT spl.Setor, spl.Usuario, u.nome as NomeUsuario'
      
        ' FROM SetoresProducaoLideres spl join usuarios u on spl.usuario ' +
        '= u.codigo'
      ' WHERE spl.DataFinalLideranca IS NULL AND'
      
        '       TO_CHAR(spl.DataInicialLideranca,'#39'YYYYMM'#39') <= TO_CHAR(CAS' +
        'T(:DataInicial AS DATE),'#39'YYYYMM'#39')'
      ') AS Setores'
      ''
      'JOIN'
      ''
      '('
      ' SELECT SetorProducao,'
      '        EficienciaSetor * 100 AS EficienciaSetor,'
      '        ValorPremio'
      ' FROM'
      ''
      ' ('
      '  SELECT Setores.SetorProducao, Setores.DescricaoSetor,'
      ''
      '         CASE WHEN Setores.SomaTempo <> 0'
      '              THEN Setores.EficienciaTempo / Setores.SomaTempo'
      '              ELSE 0'
      '         END AS EficienciaSetor,'
      ''
      '        (SELECT spp.Valor'
      '            FROM SetoresProducaoPremiacao spp'
      '            WHERE spp.Setor = Setores.SetorProducao AND'
      
        '                  spp.Mes   = TO_CHAR(CAST(:DataInicial AS DATE)' +
        ', '#39'MM/YYYY'#39')) AS ValorPremio'
      ''
      '  FROM'
      '  ('
      
        '   SELECT COALESCE(m.SetorProducao, CAST(NULL AS VARCHAR(4))) AS' +
        ' SetorProducao,'
      
        '          COALESCE(sp.Descricao, CAST('#39'DIVERSOS'#39' AS VARCHAR(50))' +
        ') AS DescricaoSetor,'
      ''
      
        '          SUM(EficienciaOperacaoUsuario(oou.OSP, oou.Lote, oou.O' +
        'peracao, oou.Usuario, oou.Data, oou.Inicio) *'
      
        '              TempoOperacaoUsuario     (oou.OSP, oou.Lote, oou.O' +
        'peracao, oou.Usuario, oou.Data, oou.Inicio)) AS EficienciaTempo,'
      ''
      
        '          SUM(TempoOperacaoUsuario     (oou.OSP, oou.Lote, oou.O' +
        'peracao, oou.Usuario, oou.Data, oou.Inicio)) AS SomaTempo'
      ''
      '     FROM OperacoesOSPUsuario oou'
      '          JOIN Operacoes o'
      '               JOIN InstrucoesTrabalhoOperacoes ito'
      '                    JOIN UsuariosInstrucoesTrabalho uit'
      
        '                    ON ito.InstrucaoTrabalho = uit.InstrucaoTrab' +
        'alho'
      '               ON o.Codigo = ito.Operacao'
      
        '          ON oou.Operacao = o.Codigo AND uit.Usuario = oou.Usuar' +
        'io'
      ''
      '          JOIN Usuarios u ON oou.Usuario = u.Codigo'
      ''
      '          JOIN Maquinas m'
      '               JOIN SetoresProducao sp'
      '               ON sp.Codigo = m.SetorProducao'
      
        '          ON m.Codigo = COALESCE(oou.Maquina, (SELECT om.Maquina' +
        ' FROM OperacoesMaquinas om'
      
        '                                                  WHERE om.Opera' +
        'cao = oou.Operacao LIMIT 1))'
      ''
      ''
      '     WHERE oou.Usuario = oou.UsuarioTermino AND'
      '           COALESCE(oou.Quantidade,0) <> 0  AND'
      '           oou.DataTermino IS NOT NULL      AND'
      '           oou.Termino     IS NOT NULL      AND'
      ''
      '           CASE WHEN uit.DataInicialTreinamento IS NOT NULL'
      
        '                THEN CASE WHEN uit.DataFinalTreinamento IS NOT N' +
        'ULL'
      
        '                          THEN NOT (oou.Data BETWEEN uit.DataIni' +
        'cialTreinamento AND'
      
        '                                                     uit.DataFin' +
        'alTreinamento)'
      
        '                          ELSE NOT (oou.Data >= uit.DataInicialT' +
        'reinamento)'
      '                     END'
      '                ELSE TRUE'
      '           END  AND'
      ''
      '          TempoPadrao(oou.Operacao, oou.Data) > 0'
      ''
      '           %FiltroPeriodo'
      '           %FiltroSetoresProducao'
      ''
      '   GROUP BY SetorProducao, DescricaoSetor'
      '  ) AS Setores'
      ''
      ' ) AS Premiacao'
      ') AS Premiacao'
      'on Setores.Setor = Premiacao.SetorProducao'
      ''
      'order by Setores.Usuario, Setores.Setor'
      ''
      '/* PAR'#194'METROS'
      ':DataInicial'
      ':DataFinal'
      '*/'
      '')
    RequestLive = False
    Left = 88
    Top = 344
    ParamData = <
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
    object qryPremiacaoLideresusuario: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'L'#205'DER'
      DisplayWidth = 5
      FieldName = 'usuario'
      DisplayFormat = '0'
    end
    object qryPremiacaoLideresnomeusuario: TStringField
      DisplayLabel = 'NOME DO L'#205'DER'
      FieldName = 'nomeusuario'
      Size = 30
    end
    object qryPremiacaoLideressetorproducao: TStringField
      Alignment = taCenter
      DisplayLabel = 'SETOR'
      FieldName = 'setorproducao'
      Size = 5
    end
    object qryPremiacaoLidereseficienciasetor: TFloatField
      DisplayLabel = 'EFICI'#202'NCIA SETOR'
      FieldName = 'eficienciasetor'
      DisplayFormat = '0.00'
    end
    object qryPremiacaoLideresvalorpremio: TFloatField
      DisplayLabel = 'VALOR DO PR'#202'MIO'
      FieldName = 'valorpremio'
      DisplayFormat = '###,##0.00'
    end
    object qryPremiacaoLideresmediaeficiencia: TFloatField
      DisplayLabel = 'M'#201'DIA DA EFICI'#202'NCIA'
      FieldName = 'mediaeficiencia'
      DisplayFormat = '0.00'
    end
    object qryPremiacaoLideresvalorpremiolider: TFloatField
      DisplayLabel = 'VALOR DO PR'#202'MIO DO L'#205'DER'
      FieldName = 'valorpremiolider'
      DisplayFormat = '###,##0.00'
    end
  end
  object qryPremiacaoFuncionariosPonderada: TtecQuery
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
        Name = 'FiltroSetoresProducao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FiltroFuncionarios'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';'
      'SELECT Usuario, NomeUsuario,'
      ''
      '       CASE WHEN SomaTempoUsuario <> 0'
      '            THEN (SomaSetor + SomaUsuario) / SomaTempoUsuario'
      '            ELSE 0'
      '       END AS Premio'
      'FROM'
      '('
      ''
      ' SELECT Usuario, NomeUsuario,'
      '        SUM(PremioSetor   * SomaTempoUsuario) AS SomaSetor,'
      '        SUM(PremioUsuario * SomaTempoUsuario) AS SomaUsuario,'
      '        SUM(SomaTempoUsuario) AS SomaTempoUsuario'
      ' FROM'
      ''
      ' ('
      '   SELECT Setorproducao, Usuario, NomeUsuario,'
      ''
      '          EficienciaUsuario, SomaTempoUsuario,'
      ''
      
        '                                   /* Na premia'#231#227'o, a efici'#234'ncia' +
        ' m'#225'xima '#233' 100 */'
      '          CASE WHEN EficienciaUsuario <  0.70 THEN 0'
      
        '               WHEN EficienciaUsuario <  0.80 THEN EficienciaUsu' +
        'ario * ValorPremio / 4'
      
        '               WHEN EficienciaUsuario <= 1.00 THEN EficienciaUsu' +
        'ario * ValorPremio / 2'
      
        '                                              ELSE ValorPremio /' +
        ' 2'
      '          END  AS PremioUsuario,'
      ''
      '          EficienciaSetor,'
      ''
      
        '                                   /* Na premia'#231#227'o, a efici'#234'ncia' +
        ' m'#225'xima '#233' 100 */'
      '          CASE WHEN EficienciaUsuario <  0.70 THEN 0'
      
        '               WHEN EficienciaUsuario <  0.80 THEN (CASE WHEN Ef' +
        'icienciaSetor > 1.00'
      
        '                                                         THEN 1.' +
        '00'
      
        '                                                         ELSE Ef' +
        'icienciaSetor'
      
        '                                                    END) * Valor' +
        'Premio / 4'
      ''
      
        '               WHEN EficienciaUsuario <= 1.00 THEN (CASE WHEN Ef' +
        'icienciaSetor > 1.00'
      
        '                                                         THEN 1.' +
        '00'
      
        '                                                         ELSE Ef' +
        'icienciaSetor'
      
        '                                                    END) * Valor' +
        'Premio / 2'
      ''
      
        '                                              ELSE (CASE WHEN Ef' +
        'icienciaSetor > 1.00'
      
        '                                                         THEN 1.' +
        '00'
      
        '                                                         ELSE Ef' +
        'icienciaSetor'
      
        '                                                    END) *  Valo' +
        'rPremio / 2'
      '          END  AS PremioSetor'
      ''
      ''
      '   FROM'
      ''
      '   ('
      '    SELECT Setores.SetorProducao, Setores.DescricaoSetor,'
      ''
      '           CASE WHEN Setores.SomaTempo <> 0'
      '                THEN Setores.EficienciaTempo / Setores.SomaTempo'
      '                ELSE 0'
      '           END AS EficienciaSetor,'
      ''
      '          (SELECT spp.Valor'
      '              FROM SetoresproducaoPremiacao spp'
      '              WHERE spp.Setor = Setores.SetorProducao AND'
      
        '                    spp.Mes   = TO_CHAR(CAST(:datainicial AS DAT' +
        'E), '#39'MM/YYYY'#39')) AS ValorPremio,'
      ''
      '           Usuarios.Usuario,'
      '           Usuarios.NomeUsuario,'
      '           Usuarios.EficienciaUsuario,'
      '           Usuarios.SomaTempoUsuario'
      ''
      '    FROM'
      ''
      '    ('
      
        '     SELECT COALESCE(m.SetorProducao, CAST(NULL AS VARCHAR(4))) ' +
        '      AS SetorProducao,'
      
        '            COALESCE(sp.Descricao,    CAST('#39'DIVERSOS'#39' AS VARCHAR' +
        '(50))) AS DescricaoSetor,'
      ''
      
        '            SUM(EficienciaOperacaoUsuario(oou.OSP, oou.Lote, oou' +
        '.Operacao, oou.Usuario, oou.Data, oou.Inicio) *'
      
        '                TempoOperacaoUsuario     (oou.OSP, oou.Lote, oou' +
        '.Operacao, oou.Usuario, oou.Data, oou.Inicio)) AS EficienciaTemp' +
        'o,'
      ''
      
        '            SUM(TempoOperacaoUsuario     (oou.OSP, oou.Lote, oou' +
        '.Operacao, oou.Usuario, oou.Data, oou.Inicio)) AS SomaTempo'
      ''
      '     FROM OperacoesOSPUsuario oou'
      '          JOIN Operacoes o'
      '               JOIN InstrucoesTrabalhoOperacoes ito'
      '                    JOIN UsuariosInstrucoesTrabalho uit'
      
        '                    ON ito.InstrucaoTrabalho = uit.InstrucaoTrab' +
        'alho'
      '               ON o.Codigo = ito.Operacao'
      
        '          ON oou.Operacao = o.Codigo AND uit.Usuario = oou.Usuar' +
        'io'
      ''
      '          JOIN Usuarios u ON oou.Usuario = u.Codigo'
      ''
      '          JOIN Maquinas m'
      '               JOIN SetoresProducao sp'
      '               ON sp.Codigo = m.SetorProducao'
      
        '          ON m.Codigo = COALESCE(oou.Maquina, (SELECT om.Maquina' +
        ' FROM OperacoesMaquinas om'
      
        '                                                  WHERE om.Opera' +
        'cao = oou.Operacao LIMIT 1))'
      ''
      ''
      '     WHERE oou.Usuario = oou.UsuarioTermino AND'
      '           COALESCE(oou.Quantidade,0) <> 0  AND'
      '           oou.DataTermino IS NOT NULL      AND'
      '           oou.Termino     IS NOT NULL      AND'
      ''
      '           CASE WHEN uit.DataInicialTreinamento IS NOT NULL'
      
        '                THEN CASE WHEN uit.DataFinalTreinamento IS NOT N' +
        'ULL'
      
        '                          THEN NOT (oou.Data BETWEEN uit.DataIni' +
        'cialTreinamento AND'
      
        '                                                     uit.DataFin' +
        'alTreinamento)'
      
        '                          ELSE NOT (oou.Data >= uit.DataInicialT' +
        'reinamento)'
      '                     END'
      '                ELSE TRUE'
      '           END  AND'
      ''
      '           TempoPadrao(oou.Operacao, oou.Data) > 0'
      ''
      '           %FiltroPeriodo'
      '           %FiltroSetoresProducao'
      ''
      '     GROUP BY SetorProducao, DescricaoSetor'
      '    ) AS Setores'
      ''
      '    JOIN'
      ''
      '    ('
      
        '     SELECT SetorProducao, DescricaoSetor, Usuario, NomeUsuario,' +
        ' SomaTempo AS SomaTempoUsuario,'
      ''
      '            CASE WHEN SomaTempo <> 0'
      '                THEN EficienciaTempo / SomaTempo'
      '                ELSE 0'
      '            END AS EficienciaUsuario'
      ''
      '     FROM'
      ''
      '     ('
      
        '      SELECT COALESCE(m.SetorProducao, CAST(NULL AS VARCHAR(4)))' +
        ' AS SetorProducao,'
      
        '             COALESCE(sp.Descricao, CAST('#39'DIVERSOS'#39' AS VARCHAR(5' +
        '0))) AS DescricaoSetor,'
      '             oou.Usuario, u.Nome AS NomeUsuario,'
      ''
      
        '             SUM(EficienciaOperacaoUsuario(oou.OSP, oou.Lote, oo' +
        'u.Operacao, oou.Usuario, oou.Data, oou.Inicio) *'
      
        '                 TempoOperacaoUsuario     (oou.OSP, oou.Lote, oo' +
        'u.Operacao, oou.Usuario, oou.Data, oou.Inicio)) AS EficienciaTem' +
        'po,'
      ''
      
        '             SUM(TempoOperacaoUsuario     (oou.OSP, oou.Lote, oo' +
        'u.Operacao, oou.Usuario, oou.Data, oou.Inicio)) AS SomaTempo'
      ''
      ''
      '     FROM OperacoesOSPUsuario oou'
      '          JOIN Operacoes o'
      '               JOIN InstrucoesTrabalhoOperacoes ito'
      '                    JOIN UsuariosInstrucoesTrabalho uit'
      
        '                    ON ito.InstrucaoTrabalho = uit.InstrucaoTrab' +
        'alho'
      '               ON o.Codigo = ito.Operacao'
      
        '          ON oou.Operacao = o.Codigo AND uit.Usuario = oou.Usuar' +
        'io'
      ''
      '          JOIN Usuarios u ON oou.Usuario = u.Codigo'
      ''
      '          JOIN Maquinas m'
      '               JOIN SetoresProducao sp'
      '               ON sp.Codigo = m.SetorProducao'
      
        '          ON m.Codigo = COALESCE(oou.Maquina, (SELECT om.Maquina' +
        ' FROM OperacoesMaquinas om'
      
        '                                                  WHERE om.Opera' +
        'cao = oou.Operacao LIMIT 1))'
      ''
      ''
      '     WHERE oou.Usuario = oou.UsuarioTermino AND'
      '           COALESCE(oou.Quantidade,0) <> 0  AND'
      '           oou.DataTermino IS NOT NULL      AND'
      '           oou.Termino     IS NOT NULL      AND'
      ''
      '           CASE WHEN uit.DataInicialTreinamento IS NOT NULL'
      
        '                THEN CASE WHEN uit.DataFinalTreinamento IS NOT N' +
        'ULL'
      
        '                          THEN NOT (oou.Data BETWEEN uit.DataIni' +
        'cialTreinamento AND'
      
        '                                                     uit.DataFin' +
        'alTreinamento)'
      
        '                          ELSE NOT (oou.Data >= uit.DataInicialT' +
        'reinamento)'
      '                     END'
      '                ELSE TRUE'
      '           END  AND'
      ''
      '           TempoPadrao(oou.Operacao, oou.Data) > 0'
      ''
      '           %FiltroPeriodo'
      '           %FiltroSetoresProducao'
      '           %FiltroFuncionarios'
      ''
      
        '      GROUP BY SetorProducao, DescricaoSetor, oou.Usuario, NomeU' +
        'suario'
      '     ) AS Usuarios'
      '    ) AS Usuarios'
      '      ON Setores.Setorproducao = Usuarios.Setorproducao'
      '   ) AS Premiacao'
      ' ) AS Premiacao'
      '   GROUP BY Usuario, NomeUsuario'
      ') AS Premiacao'
      'ORDER BY Usuario'
      ''
      '/* PAR'#194'METROS'
      ':DataInicial'
      ':DataFinal'
      '*/')
    RequestLive = False
    Left = 96
    Top = 280
    ParamData = <
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
    object qryPremiacaoFuncionariosPonderadausuario: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'OPERADOR'
      FieldName = 'usuario'
      DisplayFormat = '0'
    end
    object qryPremiacaoFuncionariosPonderadanomeusuario: TStringField
      DisplayLabel = 'NOME DO OPERADOR'
      FieldName = 'nomeusuario'
      Size = 30
    end
    object qryPremiacaoFuncionariosPonderadapremio: TFloatField
      DisplayLabel = 'PR'#202'MIO'
      FieldName = 'premio'
      DisplayFormat = '###,##0.00'
    end
  end
end
