inherited dtmLivroAuxiliarImpostosRetidos: TdtmLivroAuxiliarImpostosRetidos
  OldCreateOrder = False
  Left = 728
  Top = 176
  Height = 475
  Width = 734
  object qryProcuraFiliais: TtecQuery
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
      'Select'
      '    f.codigo,'
      '    f.nome,'
      '    f.razao,'
      '    f.cnpj,'
      '    f.inscricaoestadual,'
      '    f.rua,'
      '    f.estado,'
      '    c.nome as nomecidade,'
      '    b.nome as nomebairro,'
      '    f.cep,'
      '    f.junta,'
      '    f.juntadata'
      'From filiais f, estados e, cidades c, bairros b'
      'where (f.estado = e.codigo) and'
      '      (f.estado = c.estado) and'
      '      (f.cidade = c.codigo) and'
      '      (f.estado = b.estado) and'
      '      (f.cidade = b.cidade) and'
      '      (f.bairro = b.codigo) and'
      '      (f.codigo = :codigo)')
    RequestLive = False
    Left = 42
    Top = 6
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraFiliaiscodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object qryProcuraFiliaisnome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 40
    end
    object qryProcuraFiliaisrazao: TStringField
      FieldName = 'razao'
      Required = True
      Size = 40
    end
    object qryProcuraFiliaiscnpj: TStringField
      FieldName = 'cnpj'
      Size = 14
    end
    object qryProcuraFiliaisinscricaoestadual: TStringField
      FieldName = 'inscricaoestadual'
    end
    object qryProcuraFiliaisrua: TStringField
      FieldName = 'rua'
      Size = 100
    end
    object qryProcuraFiliaisestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object qryProcuraFiliaisnomecidade: TStringField
      FieldName = 'nomecidade'
      Size = 30
    end
    object qryProcuraFiliaisnomebairro: TStringField
      FieldName = 'nomebairro'
      Size = 30
    end
    object qryProcuraFiliaiscep: TIntegerField
      FieldName = 'cep'
    end
    object qryProcuraFiliaisjunta: TStringField
      FieldName = 'junta'
    end
    object qryProcuraFiliaisjuntadata: TDateField
      FieldName = 'juntadata'
    end
  end
  object dsrProcuraFiliais: TtecDataSource
    DataSet = qryProcuraFiliais
    Left = 42
    Top = 58
  end
  object qryConsultaFiliais: TtecQuery
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
      'SELECT nome,codigo'
      'FROM filiais'
      'ORDER BY UPPER(TO_ASCII(nome,'#39'LATIN1'#39'))')
    RequestLive = True
    Left = 45
    Top = 110
    object qryConsultaFiliaisnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaFiliaiscodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object qryAuxiliarImpostosRetidos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnCalcFields = qryAuxiliarImpostosRetidosCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'FiltroFiliais'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';'
      'SELECT * FROM'
      '('
      ' SELECT CAST(2 AS INTEGER)  AS Posicao,'
      
        '        Serie, Numero, Tipo, DataContabil, Cliente, Nome, DataEm' +
        'issao,'
      
        '       (TRUNC(ValorVencto,     2) + TRUNC(COFINSProporcional,2) ' +
        '+'
      
        '        TRUNC(CSLLProporcional,2) + TRUNC(INSSProporcional,  2) ' +
        '+'
      
        '        TRUNC(IRRFProporcional,2) + TRUNC(ISSProporcional,   2) ' +
        '+'
      
        '                                    TRUNC(PISProporcional,   2))' +
        ' AS ValorTotal,'
      ''
      
        '        TRUNC(COFINS,2) AS COFINS, TRUNC(CSLL,2) AS CSLL, TRUNC(' +
        'INSS,2) AS INSS,'
      
        '        TRUNC(IRRF,  2) AS IRRF,   TRUNC(ISS, 2) AS ISS,  TRUNC(' +
        'PIS, 2) AS PIS, NVenctos'
      ' FROM'
      '      ('
      '       SELECT n.Serie, n.Numero,'
      '              CAST('#39'PAGTO'#39' AS VARCHAR(10)) AS Tipo,'
      '              p.Datapagto AS DataContabil,'
      '              df.Data AS DataEmissao,'
      '              df.Cliente, df.Nome,'
      '              vdf.ValorVencto,'
      ''
      
        '             (vdf.ValorVencto * COALESCE(df.COFINSRetido, 0)) / ' +
        '(df.ValorTotal -'
      
        '                    (COALESCE(df.COFINSRetido, 0) + COALESCE(df.' +
        'CSLLRetido, 0) +'
      
        '                     COALESCE(df.INSSRetido,   0) + COALESCE(df.' +
        'IRRetido,   0) +'
      
        '                     COALESCE(df.ISSRetido,    0) + COALESCE(df.' +
        'PISRetido,  0)))'
      
        '                                                          AS COF' +
        'INSProporcional,'
      ''
      
        '             (vdf.ValorVencto * COALESCE(df.CSLLRetido, 0)) / (d' +
        'f.ValorTotal -'
      
        '                    (COALESCE(df.COFINSRetido, 0) + COALESCE(df.' +
        'CSLLRetido, 0) +'
      
        '                     COALESCE(df.INSSRetido,   0) + COALESCE(df.' +
        'IRRetido,   0) +'
      
        '                     COALESCE(df.ISSRetido,    0) + COALESCE(df.' +
        'PISRetido,  0)))'
      
        '                                                            AS C' +
        'SLLProporcional,'
      ''
      
        '             (vdf.ValorVencto * COALESCE(df.INSSRetido, 0)) / (d' +
        'f.ValorTotal -'
      
        '                    (COALESCE(df.COFINSRetido, 0) + COALESCE(df.' +
        'CSLLRetido, 0) +'
      
        '                     COALESCE(df.INSSRetido,   0) + COALESCE(df.' +
        'IRRetido,   0) +'
      
        '                     COALESCE(df.ISSRetido,    0) + COALESCE(df.' +
        'PISRetido,  0)))'
      
        '                                                            AS I' +
        'NSSProporcional,'
      ''
      
        '             (vdf.ValorVencto * COALESCE(df.IRRetido, 0)) / (df.' +
        'ValorTotal -'
      
        '                    (COALESCE(df.COFINSRetido, 0) + COALESCE(df.' +
        'CSLLRetido, 0) +'
      
        '                     COALESCE(df.INSSRetido,   0) + COALESCE(df.' +
        'IRRetido,   0) +'
      
        '                     COALESCE(df.ISSRetido,    0) + COALESCE(df.' +
        'PISRetido,  0)))'
      
        '                                                            AS I' +
        'RRFProporcional,'
      ''
      
        '              (vdf.ValorVencto * COALESCE(df.ISSRetido, 0)) / (d' +
        'f.ValorTotal -'
      
        '                    (COALESCE(df.COFINSRetido, 0) + COALESCE(df.' +
        'CSLLRetido, 0) +'
      
        '                     COALESCE(df.INSSRetido,   0) + COALESCE(df.' +
        'IRRetido,   0) +'
      
        '                     COALESCE(df.ISSRetido,    0) + COALESCE(df.' +
        'PISRetido,  0)))'
      
        '                                                             AS ' +
        'ISSProporcional,'
      ''
      
        '              (vdf.ValorVencto * COALESCE(df.PISRetido, 0)) / (d' +
        'f.ValorTotal -'
      
        '                    (COALESCE(df.COFINSRetido, 0) + COALESCE(df.' +
        'CSLLRetido, 0) +'
      
        '                     COALESCE(df.INSSRetido,   0) + COALESCE(df.' +
        'IRRetido,   0) +'
      
        '                     COALESCE(df.ISSRetido,    0) + COALESCE(df.' +
        'PISRetido,  0)))'
      
        '                                                             AS ' +
        'PISProporcional,'
      ''
      '               CASE WHEN (SELECT Regime'
      '                             FROM ImpostosRetidos'
      
        '                             WHERE Descricao = '#39'COFINS'#39') = '#39'CAIX' +
        'A'#39
      
        '                    THEN  (vdf.ValorVencto * COALESCE(df.COFINSR' +
        'etido, 0)) / (df.ValorTotal -'
      
        '                                  (COALESCE(df.COFINSRetido, 0) ' +
        '+ COALESCE(df.CSLLRetido, 0) +'
      
        '                                   COALESCE(df.INSSRetido,   0) ' +
        '+ COALESCE(df.IRRetido,   0) +'
      
        '                                   COALESCE(df.ISSRetido,    0) ' +
        '+ COALESCE(df.PISRetido,  0)))'
      '                    ELSE 0'
      '               END AS COFINS,'
      ''
      '               CASE WHEN (SELECT Regime'
      '                             FROM ImpostosRetidos'
      '                             WHERE Descricao = '#39'CSLL'#39') = '#39'CAIXA'#39
      
        '                    THEN  (vdf.ValorVencto * COALESCE(df.CSLLRet' +
        'ido, 0)) / (df.ValorTotal -'
      
        '                                (COALESCE(df.COFINSRetido, 0) + ' +
        'COALESCE(df.CSLLRetido, 0) +'
      
        '                                 COALESCE(df.INSSRetido,   0) + ' +
        'COALESCE(df.IRRetido,   0) +'
      
        '                                 COALESCE(df.ISSRetido,    0) + ' +
        'COALESCE(df.PISRetido,  0)))'
      '                    ELSE 0'
      '               END AS CSLL,'
      ''
      '               CASE WHEN (SELECT Regime'
      '                             FROM ImpostosRetidos'
      '                             WHERE Descricao = '#39'INSS'#39') = '#39'CAIXA'#39
      
        '                    THEN (vdf.ValorVencto * COALESCE(df.INSSReti' +
        'do, 0)) / (df.ValorTotal -'
      
        '                               (COALESCE(df.COFINSRetido, 0) + C' +
        'OALESCE(df.CSLLRetido, 0) +'
      
        '                                COALESCE(df.INSSRetido,   0) + C' +
        'OALESCE(df.IRRetido,   0) +'
      
        '                                COALESCE(df.ISSRetido,    0) + C' +
        'OALESCE(df.PISRetido,  0)))'
      '                    ELSE 0'
      '               END AS INSS,'
      ''
      '               CASE WHEN (SELECT Regime'
      '                             FROM ImpostosRetidos'
      '                             WHERE Descricao = '#39'IRRF'#39') = '#39'CAIXA'#39
      
        '                    THEN (vdf.ValorVencto * COALESCE(df.IRRetido' +
        ', 0)) / (df.ValorTotal -'
      
        '                             (COALESCE(df.COFINSRetido, 0) + COA' +
        'LESCE(df.CSLLRetido, 0) +'
      
        '                              COALESCE(df.INSSRetido,   0) + COA' +
        'LESCE(df.IRRetido,   0) +'
      
        '                              COALESCE(df.ISSRetido,    0) + COA' +
        'LESCE(df.PISRetido,  0)))'
      '                    ELSE 0'
      '               END AS IRRF,'
      ''
      '               CASE WHEN (SELECT Regime'
      '                             FROM ImpostosRetidos'
      '                             WHERE Descricao = '#39'ISS'#39') = '#39'CAIXA'#39
      
        '                    THEN (vdf.ValorVencto * COALESCE(df.ISSRetid' +
        'o, 0)) / (df.ValorTotal -'
      
        '                            (COALESCE(df.COFINSRetido, 0) + COAL' +
        'ESCE(df.CSLLRetido, 0) +'
      
        '                             COALESCE(df.INSSRetido,   0) + COAL' +
        'ESCE(df.IRRetido,   0) +'
      
        '                             COALESCE(df.ISSRetido,    0) + COAL' +
        'ESCE(df.PISRetido,  0)))'
      '                    ELSE 0'
      '               END AS ISS,'
      ''
      '               CASE WHEN (SELECT Regime'
      '                             FROM ImpostosRetidos'
      '                             WHERE Descricao = '#39'PIS'#39') = '#39'CAIXA'#39
      
        '                    THEN (vdf.ValorVencto * COALESCE(df.PISRetid' +
        'o, 0)) / (df.ValorTotal -'
      
        '                             (COALESCE(df.COFINSRetido, 0) + COA' +
        'LESCE(df.CSLLRetido, 0) +'
      
        '                              COALESCE(df.INSSRetido,   0) + COA' +
        'LESCE(df.IRRetido,   0) +'
      
        '                              COALESCE(df.ISSRetido,    0) + COA' +
        'LESCE(df.PISRetido,  0)))'
      '                    ELSE 0'
      '               END AS PIS,'
      ''
      '              (SELECT COUNT(*)'
      '                  FROM Parcelas p2'
      '                  WHERE p2.Contrato = p.Contrato) AS NVenctos'
      ''
      '       FROM Parcelas p'
      '            JOIN Contratos ct'
      '                  JOIN DadosFiscais df'
      '                       JOIN Notas n'
      '                       ON n.DadoFiscal = df.Numero'
      '                  ON df.Contrato = ct.Numero'
      '            ON p.Contrato = ct.Numero,'
      ''
      '            VenctosDadosFiscais vdf'
      ''
      '       WHERE vdf.DadoFiscal = df.Numero'
      '         AND vdf.Numero = p.Numero'
      '         AND p.Datapagto BETWEEN :Datainicial AND :DataFinal'
      '         AND df.Situacao = '#39'N'#39
      '         AND (((COALESCE(df.COFINSRetido, 0) <> 0) AND'
      '               (SELECT Regime'
      '                   FROM ImpostosRetidos'
      '                   WHERE Descricao = '#39'COFINS'#39') = '#39'CAIXA'#39') OR'
      ''
      '              ((COALESCE(df.CSLLRetido, 0) <> 0) AND'
      '               (SELECT Regime'
      '                   FROM ImpostosRetidos'
      '                   WHERE Descricao = '#39'CSLL'#39') = '#39'CAIXA'#39') OR'
      ''
      '              ((COALESCE(df.INSSRetido, 0) <> 0) AND'
      '               (SELECT Regime'
      '                   FROM ImpostosRetidos'
      '                   WHERE Descricao = '#39'INSS'#39') = '#39'CAIXA'#39') OR'
      ''
      '              ((COALESCE(df.IRRetido, 0) <> 0) AND'
      '               (SELECT Regime'
      '                   FROM ImpostosRetidos'
      '                   WHERE Descricao = '#39'IRRF'#39') = '#39'CAIXA'#39') OR'
      ''
      '              ((COALESCE(df.ISSRetido, 0) <> 0) AND'
      '               (SELECT Regime'
      '                   FROM ImpostosRetidos'
      '                   WHERE Descricao = '#39'ISS'#39') = '#39'CAIXA'#39') OR'
      ''
      '              ((COALESCE(df.PISRetido, 0) <> 0) AND'
      '               (SELECT Regime'
      '                   FROM ImpostosRetidos'
      '                   WHERE Descricao = '#39'PIS'#39') = '#39'CAIXA'#39'))'
      ''
      '       %FiltroFiliais'
      ''
      '       ORDER BY p.Datapagto, n.Serie, n.Numero'
      '      ) AS Pagamentos'
      ') AS T1'
      ''
      'UNION ALL'
      ''
      '('
      ' SELECT CAST(1 AS INTEGER)  AS Posicao,'
      '        n.Serie, n.Numero,'
      '        CAST('#39'EMISS'#195'O'#39' AS VARCHAR(10)) AS Tipo,'
      '        df.Data AS DataContabil,'
      '        df.Cliente, df.Nome,'
      '        df.Data AS DataEmissao,'
      '        df.ValorTotal,'
      ''
      '        CASE WHEN (SELECT Regime'
      '                      FROM ImpostosRetidos'
      
        '                      WHERE Descricao = '#39'COFINS'#39') = '#39'COMPET'#202'NCIA' +
        #39
      '             THEN COALESCE(df.COFINSRetido, 0)'
      '             ELSE 0'
      '        END AS COFINS,'
      ''
      '        CASE WHEN (SELECT Regime'
      '                      FROM ImpostosRetidos'
      '                      WHERE Descricao = '#39'CSLL'#39') = '#39'COMPET'#202'NCIA'#39
      '             THEN COALESCE(df.CSLLRetido, 0)'
      '             ELSE 0'
      '        END AS CSLL,'
      ''
      '        CASE WHEN (SELECT Regime'
      '                      FROM ImpostosRetidos'
      '                      WHERE Descricao = '#39'INSS'#39') = '#39'COMPET'#202'NCIA'#39
      '             THEN COALESCE(df.INSSRetido, 0)'
      '             ELSE 0'
      '         END AS INSS,'
      ''
      '        CASE WHEN (SELECT Regime'
      '                      FROM ImpostosRetidos'
      '                      WHERE Descricao = '#39'IRRF'#39') = '#39'COMPET'#202'NCIA'#39
      '             THEN COALESCE(df.IRRetido, 0)'
      '             ELSE 0'
      '        END AS IRRF,'
      ''
      '        CASE WHEN (SELECT Regime'
      '                      FROM ImpostosRetidos'
      '                      WHERE Descricao = '#39'ISS'#39') = '#39'COMPET'#202'NCIA'#39
      '             THEN COALESCE(df.ISSRetido, 0)'
      '             ELSE 0'
      '         END AS ISS,'
      ''
      '        CASE WHEN (SELECT Regime'
      '                      FROM ImpostosRetidos'
      '                      WHERE Descricao = '#39'PIS'#39') = '#39'COMPET'#202'NCIA'#39
      '             THEN COALESCE(df.PISRetido, 0)'
      '             ELSE 0'
      '        END AS PIS,'
      ''
      '       (SELECT COUNT(*)'
      '           FROM Parcelas p2'
      '           WHERE p2.Contrato = df.Contrato) AS NVenctos'
      ''
      ' FROM DadosFiscais df'
      '      JOIN Notas n'
      '      ON n.DadoFiscal = df.Numero'
      ''
      ' WHERE df.Data BETWEEN :Datainicial AND :DataFinal'
      '   AND df.Situacao = '#39'N'#39
      '   AND (((COALESCE(df.COFINSRetido, 0) <> 0) AND'
      '         (SELECT Regime'
      '             FROM ImpostosRetidos'
      '             WHERE Descricao = '#39'COFINS'#39') = '#39'COMPET'#202'NCIA'#39') OR'
      ''
      '        ((COALESCE(df.CSLLRetido, 0) <> 0) AND'
      '         (SELECT Regime'
      '             FROM ImpostosRetidos'
      '             WHERE Descricao = '#39'CSLL'#39') = '#39'COMPET'#202'NCIA'#39') OR'
      ''
      '        ((COALESCE(df.INSSRetido, 0) <> 0) AND'
      '         (SELECT Regime'
      '             FROM ImpostosRetidos'
      '             WHERE Descricao = '#39'INSS'#39') = '#39'COMPET'#202'NCIA'#39') OR'
      ''
      '        ((COALESCE(df.IRRetido, 0) <> 0) AND'
      '         (SELECT Regime'
      '             FROM ImpostosRetidos'
      '             WHERE Descricao = '#39'IRRF'#39') = '#39'COMPET'#202'NCIA'#39') OR'
      ''
      '        ((COALESCE(df.ISSRetido, 0) <> 0) AND'
      '         (SELECT Regime'
      '             FROM ImpostosRetidos'
      '             WHERE Descricao = '#39'ISS'#39') = '#39'COMPET'#202'NCIA'#39') OR'
      ''
      '        ((COALESCE(df.PISRetido, 0) <> 0) AND'
      '         (SELECT Regime'
      '             FROM ImpostosRetidos'
      '             WHERE Descricao = '#39'PIS'#39') = '#39'COMPET'#202'NCIA'#39'))'
      ''
      ' %FiltroFiliais'
      ''
      ' ORDER BY df.Data, n.Serie, n.Numero'
      ')'
      'ORDER BY Posicao, DataContabil, Serie, Numero')
    RequestLive = False
    Left = 256
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'dataInicial'
        ParamType = ptUnknown
        Value = #39'01/01/2000'#39
      end
      item
        DataType = ftString
        Name = 'datafinal'
        ParamType = ptUnknown
        Value = #39'31/12/2007'#39
      end>
    object qryAuxiliarImpostosRetidosserie: TStringField
      FieldName = 'serie'
      Size = 3
    end
    object qryAuxiliarImpostosRetidosnumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryAuxiliarImpostosRetidosdatacontabil: TDateField
      Alignment = taCenter
      FieldName = 'datacontabil'
      EditMask = '99/99/9999;1; '
    end
    object qryAuxiliarImpostosRetidoscliente: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object qryAuxiliarImpostosRetidosnome: TStringField
      FieldName = 'nome'
      Size = 23
    end
    object qryAuxiliarImpostosRetidosdataemissao: TDateField
      Alignment = taCenter
      FieldName = 'dataemissao'
      EditMask = '99/99/9999;1; '
    end
    object qryAuxiliarImpostosRetidoscofins: TFloatField
      FieldName = 'cofins'
      DisplayFormat = '0.00'
    end
    object qryAuxiliarImpostosRetidoscsll: TFloatField
      FieldName = 'csll'
      DisplayFormat = '0.00'
    end
    object qryAuxiliarImpostosRetidosinss: TFloatField
      FieldName = 'inss'
      DisplayFormat = '0.00'
    end
    object qryAuxiliarImpostosRetidosirrf: TFloatField
      FieldName = 'irrf'
      DisplayFormat = '0.00'
    end
    object qryAuxiliarImpostosRetidosiss: TFloatField
      FieldName = 'iss'
      DisplayFormat = '0.00'
    end
    object qryAuxiliarImpostosRetidospis: TFloatField
      FieldName = 'pis'
      DisplayFormat = '0.00'
    end
    object qryAuxiliarImpostosRetidosnvenctos: TLargeintField
      FieldName = 'nvenctos'
    end
    object qryAuxiliarImpostosRetidosvalortotal: TFloatField
      FieldName = 'valortotal'
      DisplayFormat = '0.00'
    end
    object qryAuxiliarImpostosRetidosposicao: TIntegerField
      FieldName = 'posicao'
      DisplayFormat = '0'
    end
    object qryAuxiliarImpostosRetidostipo: TStringField
      FieldName = 'tipo'
      Size = 50
    end
    object qryAuxiliarImpostosRetidosDescricaoPosicao: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescricaoPosicao'
      Size = 50
      Calculated = True
    end
  end
  object dsrAuxiliarImpostosRetidos: TtecDataSource
    DataSet = qryAuxiliarImpostosRetidos
    Left = 288
    Top = 192
  end
  object fdsLivroAuxiliarImpostosRetidos: TfrDBDataSet
    DataSet = qryAuxiliarImpostosRetidos
    Left = 352
    Top = 224
  end
  object frpLivroAuxliarImpostosRetidos: TfrReport
    Dataset = fdsLivroAuxiliarImpostosRetidos
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnGetValue = frpLivroAuxliarImpostosRetidosGetValue
    OnBeforePrint = frpLivroAuxliarImpostosRetidosBeforePrint
    Left = 312
    Top = 208
    ReportForm = {
      19000000F176000019FFFF00000A0050444643726561746F7200FFFFFFFFFF00
      000000340800009A0B0000000000002C00000000000000290000000000040000
      0000FFFF010000001200000000000000030400466F726D00FEFFFFFFDC000000
      780000007C0100002C0100000417000500626567696E0D1E0020206966205B41
      677275706172477275706F46696C69616C5D207468656E0D0700202062656769
      6E0D2700202020204361626563616C686F477275706F46696C69616C2E766973
      69626C653A3D747275653B0D260020202020526F64617065477275706F46696C
      69616C2E76697369626C653A3D747275653B20200D05002020656E640D060020
      20656C73650D07002020626567696E0D2800202020204361626563616C686F47
      7275706F46696C69616C2E76697369626C653A3D66616C73653B0D2A00202020
      20526F64617065477275706F46696C69616C2E76697369626C653A3D66616C73
      653B20202020200D07002020656E643B200D00000D190020206966205B416772
      7570617246696C69616C5D207468656E0D07002020626567696E0D2200202020
      204361626563616C686F46696C69616C2E76697369626C653A3D747275653B0D
      210020202020526F6461706546696C69616C2E76697369626C653A3D74727565
      3B20200D05002020656E640D06002020656C73650D07002020626567696E0D23
      00202020204361626563616C686F46696C69616C2E76697369626C653A3D6661
      6C73653B0D220020202020526F6461706546696C69616C2E76697369626C653A
      3D66616C73653B20200D07002020656E643B200D0300656E640002004F030000
      0900726470506167696E610002010000000030020000F5020000170000003000
      030001000000000000000000FFFFFF1F00000000000000000000090005006265
      67696E0D1600506167696E613A3D5B5B506167696E615D2B315D3B200D1D0069
      6620285B5B506167696E615D3E5B4D6178696D6F5D5D29207468656E0D130020
      6966205B4C6976726F5D3C3E30207468656E0D060020626567696E0D0C002020
      506167696E613A3D323B0D150020204C6976726F3A3D5B5B4C6976726F5D2B31
      5D3B0D050020656E643B0D0300656E6400FFFF00000000000200000001000000
      0000000001000000C800000014000000010000000000000200FB03000005004E
      6F7461730002010000000008010000F50200000C000000300005000100000000
      0000000000FFFFFF1F000000001F006664734C6976726F417578696C69617249
      6D706F73746F7352657469646F730000000003000500626567696E0D18002020
      5452414E53504F52544152203A3D20545255453B20200D0300656E6400005B00
      0000000002000000010000000000000001000000C80000001400000001000000
      0000000200CB0400000900636162506167696E61000201000000002C000000F5
      020000610000003000020001000000000000000000FFFFFF1F00000000000000
      00000005000500626567696E0D170020204946205B5452414E53504F52544152
      5D205448454E0D1900202020436162506167696E612E686569676874203A3D20
      39370D21002020656C736520202020436162506167696E612E68656967687420
      3A3D2038333B0D0300656E6400FFFF0000000000020000000100000000000000
      01000000C8000000140000000100000000000002003A0500000F00526F646170
      E9446520477275706F310002010000000044010000F502000014000000300011
      0001000000000000000000FFFFFF1F00000000000000000000000000FFFF0000
      00000002000000010000000000000001000000C8000000140000000100000000
      00000200D2050000120043616265E7616C686F446520477275706F3100020100
      000000A4000000F5020000130000003000100001000000000000000000FFFFFF
      1F0000000026005B717279417578696C696172496D706F73746F735265746964
      6F732E22706F736963616F225D00000000000000FFFF00000000000200000001
      0000000000000001000000C8000000140000000100000000000000005F060000
      0A006D6D6F5A65627261646F0002002E000000080100009A0200000B00000043
      000000F4010000000000000000FFFFFF1F2C000000080064642F6D6D2F797900
      000000000000FFFF0000000000020000000100000006090068656C7665746963
      610007000000000000000000120000001700020000000000FFFFFF0000000002
      000000000000000000E606000006004D656D6F31340002004702000072000000
      2B0000000C00000043000F00F4010000000000000000FFFFFF1F2C0201010000
      00010004004952524600000000015B0000000000020000000100000000090068
      656C76657469636100060000000000000000000A0000001700020000000000FF
      FFFF00000000020000000000000000006D07000006004D656D6F3431000200F1
      010000720000002B0000000C00000043000F00F4010000000000000000FFFFFF
      1F2C0201010000000100040043534C4C00000000015B00000000000200000001
      00000000090068656C76657469636100060000000000000000000A0000001700
      020000000000FFFFFF0000000002000000000000000000F607000006004D656D
      6F3131000200C7010000720000002A0000000C00000043000F00F40100000000
      00000000FFFFFF1F2C02010100000001000600434F46494E5300000000015B00
      00000000020000000100000000090068656C7665746963610006000000000000
      0000000A0000001700020000000000FFFFFF0000000002000000000000000000
      7D08000006004D656D6F31380002001C020000720000002B0000000C00000043
      000F00F4010000000000000000FFFFFF1F2C02010100000001000400494E5353
      00000000015B0000000000020000000100000000090068656C76657469636100
      060000000000000000000A0000001700020000000000FFFFFF00000000020000
      000000000000000509000006004D656D6F333600020096010000720000003100
      00000C00000043000F00F4010000000000000000FFFFFF1F2C02010100000001
      00050056414C4F5200000000015B000000000002000000010000000009006865
      6C76657469636100060000000000000000000A0000001700020000000000FFFF
      FF00000000020000000000000000008F09000006004D656D6F3339000200C701
      000066000000010100000C00000043000F00F4010000000000000000FFFFFF1F
      2C0200000000000100070056414C4F52455300000000015B0000000000020000
      000100000000090068656C766574696361000600000000000000000002000000
      0100020000000000FFFFFF00000000020000000000000000001E0A000006004D
      656D6F3330000200D4000000720000008E0000000C00000043000F00F4010000
      000000000000FFFFFF1F2C02010100000001000C0052415AC34F20534F434941
      4C00000000015B0000000000020000000100000000090068656C766574696361
      00060000000000000000000A0000001700020000000000FFFFFF000000000200
      0000000000000000A70A000006004D656D6F3631000200AC0000007200000028
      0000000C00000043000F00F4010000000000000000FFFFFF1F2C020101000000
      0100060043D34449474F00000000015B00000000000200000001000000000900
      68656C76657469636100060000000000000000000A0000001700020000000000
      FFFFFF0000000002000000000000000000330B000009004D656D6F4D61726361
      0002004E000000720000002D0000000C00000043000F00F40100000000000000
      00FFFFFF1F2C020101000000010006004EDA4D45524F00000000015B00000000
      00020000000100000000090068656C7665746963610006000000000000000000
      0A0000001700020000000000FFFFFF0000000002000000000000000000BD0B00
      000F006D6D6F51554144524F504147494E41000200870200002C000000400000
      001C00000043000F00F4010000000000000000FFFFFF1F2C0200000000000000
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      07000000000000000000090000000100020000000000FFFFFF00000000020000
      000000000000005B0C00000F006D6D6F524F54554C4F504147494E410002008A
      0200003B000000270000000B00000040000000F4010000000000000000FFFFFF
      1F2C020000000000010012005B466F6C68615F6F755F506167696E615D3A0000
      0000FFFF0000000000020000000100000000090068656C766574696361000700
      0000020000000000100000000100020000000000FFFFFF000000000200000000
      0000000000E90C000009006D6D6F504147494E41000200B20200003B00000012
      0000000B00000041000000F4010000000000000000FFFFFF1F2C020000000000
      010008005B506167696E615D00000000FFFF0000000000020000000100000000
      090068656C766574696361000700000000000000000011000000010002000000
      0000FFFFFF0000000002000000000000000000870D000010006D6D6F524F4441
      5045484F52415F4C560002001B0000003D020000500000000A00000043000000
      F4010000000000000000FFFFFF1F2C020000000000010011005B54494D452023
      5468683A6D6D3A73735D00000000FFFF00000000000200000001000000050900
      68656C7665746963610007000000000000000000100000000100020000000000
      FFFFFF0000000002000000000000000400D60D000005004C696E65370002004A
      04000076000000000000002400000001000400F4010000000000000000FFFFFF
      1F2C020000000000000000000000FFFF00000000000200000001000000000100
      2B49000007006670764C6F676F0002002F0000002C000000800000002A000000
      07000000F4010000000000000000FFFFFF1F2C020000000000000000000000FF
      FF000000000002000000010000000601002B490000424DFE3A00000000000036
      0000002800000083000000260000000100180000000000C83A0000120B000012
      0B00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFBBBABA4141414C4B4B616161D7D7D7FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF8F8F7F1F1F1FFFFFFFFFFFFFFFFFFF0F0F0EEEEEEFAFAFAFFFF
      FFFFFFFFFFFFFFEFEFEFEEEEEEFDFDFDFFFFFFFAFAFAFEFEFEFFFFFFFBFBFBFC
      FCFCFFFFFFFFFFFFFFFFFFEFEFEFF5F5F6FFFFFFFFFFFFFFFFFFFBFBFBFCFCFC
      FFFFFFFFFFFFFFFFFFEFEFEFF4F4F4FFFFFFFFFFFFFFFFFFEBEBEBADADADA3A2
      A25C5B5B5B5A59FFFFFFFFFFFFFAFAFAFEFEFEFFFFFFFFFFFFF7F7F7EEEEEEF1
      F1F1FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEEEEEEFBFBFB
      FFFFFFFBFBFBFDFDFDFFFFFFFAFAFAFEFEFEFFFFFFFAFAFAFEFEFEFFFFFFFFFF
      FFFFFFFFF8F8F8EEEEEEEEEEEEF0F0F0FFFFFFFFFFFFFEFEFEFAFAFAFEFEFEFF
      FFFFF3F3F3EEEEEEEEEEEEF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF1F1F1F6F6F5
      FFFFFFFFFFFFFDFDFDEEEEEEF0F0F0FEFEFEFFFFFFFAFAFAFEFEFEFEFEFEFAFA
      FAFFFFFFFDFDFDFAFAFAFFFFFFFFFFFFFFFFFFF0F0F1EEEEEEF4F4F4FEFEFEFF
      FFFFF6F6F6EDEEEDEEEEEEF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      000000FFFFFFFFFFFFFFFFFFFFFFFFB5B4B42E2E2E6C6B6BFFFFFFDEDEDE4A4A
      4A4747464A4A49C9C8C8FFFFFFC7C7C74444444C4B4B504F4EE8E8E8FDFCFC4B
      4A4AD9D9D9FFFFFF737271959494FFFFFFEEEEEE5A59594443433E3D3C8A8A89
      FFFFFFFFFFFF6B6B6A9C9C9CFFFFFFF1F1F15E5E5D4342423E3E3D848483FFFF
      FFFFFFFFD1D0D0504F4F5A59593D3C3B464545FFFFFFF4F4F44B4A49DCDCDCFF
      FFFF9696953D3D3C5150503838375D5C5CFFFFFFFFFFFFFFFFFFFFFFFFD8D8D7
      4746454747464C4B4AD1D1D1FFFFFF646362AAA9A9FFFFFF4A4A49D3D3D2F8F8
      F8474646E5E5E5FFFFFFFFFFFFFFFFFFB9B9B84A4948565655444342636363FA
      FAFAFCFCFC4E4E4DD2D2D2FFFFFF7C7C7B4C4C4A5352523A3939A5A4A4FFFFFF
      FFFFFF7E7E7D2B2B2A9C9C9CFFFFFFB4B4B33D3D3D474645616060F3F3F3F8F8
      F84C4C4BE1E0E0E2E2E2474646FFFFFFC4C4C4545353FFFFFFF1F1F15F5F5E47
      4645525151252423A7A7A7FFFFFF9A9A9A4848475555543C3B3B828281FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF5C5C5C7A7A
      79FDFDFDFFFFFF5F5E5E636362FEFEFEFFFFFFFFFFFFFCFCFC343332959594FB
      FBFBFCFCFCFFFFFFF4F4F4313030D4D4D4FFFFFF5E5D5C868585FFFFFF767575
      4A4948FAFAFAE4E4E4262524BFBFBFFFFFFF5656558F8E8EFFFFFF7E7E7D4342
      41F8F7F8E7E7E7292827BABAB9FFFFFF393837888887FBFBFBB4B4B3414040FF
      FFFFF3F3F331302FDADADAFFFFFF1E1D1CB1B1B1FFFFFFB5B5B43D3C3BFFFFFF
      FFFFFFFFFFFFFFFFFF5353526F6E6EFFFEFEFFFFFFFFFFFFFFFFFF4E4D4C9D9C
      9CFFFFFF30302FCCCCCDF7F7F72D2C2BE1E1E1FFFFFFFFFFFFFFFFFFFFFFFFFB
      FBFBE6E6E6C6C6C5141312DFDFDFFFFFFF353534C9C9C9FFFFFFFFFFFFF0F0F0
      E5E5E57272723F3E3EFFFFFFF9F9F92F2E2EC1C1C0FEFDFEF6F6F62B2A29ABAB
      ABFFFFFFFFFFFFFFFFFFF2F1F1333231DDDCDCDEDEDE2D2C2BFFFFFFBBBBBB3B
      3B3AFFFFFFBABAB91B1A19FAFAFAFFFFFF5958578B8B8AFFFFFFFFFFFFF6F6F5
      E5E5E5A09F9F1E1D1CFCFCFCFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFF
      FFFFFFFFFFFFFF62616190908FFFFFFFFFFFFF4948473C3B3B5B5A59515050D0
      CFCFFBFBFB272625E9E9E9FFFFFFFFFFFFFFFFFFF4F4F4373636D7D7D7FFFFFF
      676665878686FFFFFF4B4A4A9C9C9CFFFFFFFFFFFF5655558C8C8BFFFFFF5B5B
      5A929191FFFFFF535251939292FFFFFFFFFFFF5F5E5E888887FFFFFF2B2A29D8
      D8D8FFFFFFB8B9B7414040FFFFFFF3F3F3373635D9D8D8FFFFFF8584843D3C3B
      5D5C5C3C3B3B494847FFFFFFFFFFFFFFFFFFFFFFFF403F3E3F3F3F5A5A595252
      51D4D4D3FFFFFF535251A2A1A1FFFFFF373736D0D0D0FDFDFD333232E1E1E1FF
      FFFFFFFFFFFFFFFFD8D8D8403F3F4645443F3F3F636261FAFAFAFCFCFB3B3B3A
      CCCBCBFFFFFF9897973434334D4D4C393939A2A2A2FFFFFFF9F9F93C3B3AD4D4
      D4FFFFFFE7E7E7201F1E565554565554666565F4F4F4F7F7F7393837E1E0E0E2
      E2E2333231FFFFFFC3C3C240403FFFFFFFEEEEEE4F4F4E4E4D4C5F5F5E1D1C1B
      9A9A99FFFFFFBABAB93534334A4A493B3B3C818080FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFF000000FFFFFFFFFFFFFFFFFFFDFEFE605F5F888887FCFDFCFFFFFF6C
      6C6B4A4948D9D9D9E0E0E0F6F6F6FFFFFF414140969696F9F9F8FBFBFBFFFFFF
      F4F4F4313030D2D2D2F6F6F63B3B3A989797FFFFFF7F7F7E4A4948F5F5F5E2E2
      E2212020BDBDBCFFFFFF5B5B5A929191FFFFFF898888444343F4F4F4E6E5E525
      2423B6B6B6FFFFFF474645828181F8F8F8B0B0AF3B3A3AFFFFFFF3F3F331302F
      D7D7D6FFFFFFFFFFFFE0DFDFD7D7D67B7A7A3F3E3EFFFFFFFFFFFFFFFFFFFFFF
      FF616060535251DADADAE0E0E0F7F7F7FFFFFF4E4D4C9A9999FCFCFC2F2F2ECC
      CCCCDBDADA252323EAEAEAFFFFFFFFFFFFFFFFFF848484393939E9E9E9EEEEEE
      FFFFFFFFFFFFF8F8F8353534CDCCCCFFFFFF2B2A29949393EDEDEDF2F2F3FFFF
      FFFFFFFFF3F3F33A3938CACAC9FDFDFDF8F8F8323130878787DDDEDDE4E4E3FE
      FEFEF3F3F3333231D9D8D8DADADA2C2B2AFAFAFA9C9B9C3D3C3CFFFFFFFFFFFF
      F9F8F8D8D8D8D3D3D2343332969696FFFFFF515150636261ECECEBEFEFEFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFACACAC1F
      1E1E2D2D2D7E7E7DFFFFFFEDEDED605F5F5252525B5A59CECECEFFFFFFD1D1D1
      4544445554545A5958EAEAEAFDFDFD4848464C4C4B5050504E4D4DEDEDEDFFFF
      FFF3F3F35B5B5A4B4B4B3D3C3C838282FFFFFFFFFFFF5B5B5A929191FFFFFFF6
      F5F660605F4B4B4A3F3E3E7D7C7CFFFEFEFFFFFFD4D4D4434241575756434242
      5C5B5AFFFFFFF5F5F5575656DFDEDEFFFFFF8D8D8C58585863626140403FA5A5
      A5FFFFFFFFFFFFFFFFFFFFFFFFE9E9EA5B5B5A5454535C5C5BD6D6D5FFFFFF6E
      6D6C3D3C3C5F5E5D2F2E2D5251504140407C7B7BFFFFFFFFFFFFFFFFFFFFFFFF
      D7D7D74949485C5C5B595957767675FEFEFEFCFCFC5B5B5AD4D4D4FFFFFF9898
      9744444461615F565655AEAEAEFFFFFF797878131312414140A6A6A6FFFFFFCA
      CACA4B4A4A5858576F6E6EF5F5F6FBFBFB4746454D4D4C5353522E2D2C5A5958
      373635A8A8A8FFFFFFECECEC6665645F5F5E5959584A4A49E0E0E0FFFFFFB9B9
      B94241415F5F5E575756909090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
      FFFFFFFFFFFFFFFFF2F2F24E4D4D757574EBEBEBFFFFFFFFFFFFFFFFFFEBEBEB
      E1E1E0F6F6F6FFFFFFFFFFFFFFFFFFE6E6E6E2E2E1FBFBFBFFFFFFF2F2F2E3E3
      E2E8E8E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E6E6EEEEEEFFFFFFFFFFFFFF
      FFFF5252518C8B8BFFFFFFFFFFFFFFFFFFE7E7E7ECECECFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFE7E7E7E4E4E4F4F4F4FFFFFFFAFAFAB5B5B6F1F1F2FFFFFFECEC
      ECE1E1E2E2E2E3F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEA
      EBEAE1E1E1F8F8F7FFFFFFF6F6F6E6E6E6E2E2E2EDEDEDE5E5E5EFEFEFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE3E3E3E1E1E1E8E8E7FFFFFFFDFD
      FDB6B6B6EBEBEBFFFFFFFFFFFFF1F1F1E1E1E1E1E1E1F1F1F1FFFFFFE1E1E12A
      2928B3B3B3F1F1F1FFFFFFFFFFFFFFFFFFE5E5E5E5E5E5FDFDFDFFFFFFF1F1F1
      E4E4E4E5E5E5EDEDEDE4E4E3F7F7F7FFFFFFFFFFFFFBFBFBE4E4E4E2E2E1E5E5
      E5FFFFFFFFFFFFFFFFFFFFFFFFF8F8F8E2E1E1E1E1E1ECECECFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF8B8A8AABABAAFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF838383ADACACFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4
      F468686DE7E8F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFAFAFA686867D7D7D7FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFDFDFD6C6C6BDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFE8E5B3C9C25DCBC55DCBC55DCBC55DC7C05CEC
      E9C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6D17BA39700A8
      9D00A89D00A89D00A09500DFDA9AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFD6D7D88A8C8E6062654F5154484B4F494C4F3E404488898BFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFD9D9DA98999C6D6F72575A5D4E5053494B4F494C4F
      494C4F494C4F494C4F3D4043828386FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFEFEFEFB0B1B381838563646757585B3D4044868789FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFD7D282A99E00AEA400AEA400AEA400A79C00E1DDA1FFFFFFFFFFFF
      FFFFFFFFFFFFFEFDFBC9C253BEB635C0B839C0B839C0B839C0B839C0B839C0B8
      39C0B839C0B839C0B839C0B839C0B839C0B838C2BA40C5BE4ACBC55FDAD68FF3
      F1D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      F0EED2DBD68DCCC55FC4BC44C3BB41CAC45BD8D486EDEBC9FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2CC72C3BB48C6BF4CC6BF4CC2
      BA46E4E0A8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      EDEAC7D7D285CBC55DC7C04FC6BE4BC6BF4CC6BF4CD7D282000000FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF94959712141901050B090C110B0E130B0F140B0F1400
      00055F6065FFFFFFFFFFFFFFFFFFFFFFFFE9E9E9686A6D15181C02060B070A10
      0A0D120B0E130B0F140B0F140B0F140B0F140B0F1400000457595CFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF9A9B9D26282D05090E04070D090C110A0D130000025D
      5F62FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D282A99E00AEA400AEA400AEA400
      A79C00E1DDA1FFFFFFFFFFFFFFFFFFFFFFFFFDFDFAB5AC17A79C00AA9F00AA9F
      00AA9F00AA9F00AA9F00AA9F00AA9F00AA9F00AA9F00AA9F00AA9F00AA9F00AA
      9F00A99F00A99E00A69B00AEA40AE4E1A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFECEAC3C4BC49ADA302A89D00A89E00AA9F00AA9F00A99E00A79C
      00ACA100C0B83FE8E5B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB
      B32BA59900A99F00A99F00A39800D6D07DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFCFCF7CAC35BAAA000A79C00A99E00A99F00A99F00A99F00A99F
      00C3BB43000000FFFFFFFFFFFFFFFFFFFFFFFFBCBCBE06090E0F1318171A1F17
      1A1F171A1F16191E15181D06090F66676BFFFFFFFFFFFFFFFFFFD5D5D62D2F33
      02050B13161B171A1F171A1F16191E15181D15181D15181D15181D15181D1518
      1D05090E5E6063FFFFFFFFFFFFFFFFFFFFFFFF76777901040A0E111716191E17
      1A1F171A1F16191E04070C646669FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D282
      A89D00ADA300ADA300ADA300A69B00E2DEA3FFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEB8AF20AAA000ADA300ADA300ADA300ADA300ADA300ADA300ADA300ADA300AD
      A300ADA300ADA300ADA300ADA300AEA400AEA400AEA400AAA000ADA305EFEDCF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8D385ABA101A89D00ADA300AEA400AEA4
      00AEA400AEA400AEA400AEA400ADA300A99E00A99F00D1CB70FEFEFDFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFBFB737AA9F00AEA400AEA400A89E00D8D384FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEC865A59A00ADA300AEA400AEA4
      00AEA400AEA400AEA400AEA400C6BF4C000000FFFFFFFFFFFFFFFFFFFFFFFF56
      575B060A0F181B1F171A1F181B200D10150C0F1414171C05080E65666AFFFFFF
      FFFFFFEBEBEB303237070A10181B20181B2016191E080B100A0D121013181417
      1C14171C14171C14171C14171C04080D5D5F62FFFFFFFFFFFFFFFFFF9A9B9D02
      050B14171C171A1F171A1F16191E090C11080B11000208626567FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFD7D282A99D00ADA300ADA300ADA300A79C00E0DB9CFFFF
      FEFDFCF8FDFCF8FDFDFAFBFBF4B9B024ACA201AFA503AFA503AFA503AFA503AF
      A503AFA503AFA503AFA503AFA503AFA503AFA503B0A606AFA504ABA000ADA300
      AEA400AEA400A79D00C6BF4DFFFFFFFFFFFFFFFFFFFFFFFFD2CD73A69C00ACA2
      00AEA400AEA400ABA100A89D00A89D00A89D00A79D00ABA000AEA400AEA400AD
      A300A69B00CAC35AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFB737AA9F00AEA400
      AEA400A89E00D8D384FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F2DAADA4
      03ACA200AEA400AEA400AEA400AAA000A89D00AA9F00AA9F00C3BC44000000FF
      FFFFFFFFFFFFFFFFEEEDEE2A2C30101318171A1F171A1F0E11173F4145AFB0B2
      D4D4D5D2D2D3E2E3E3FFFFFFFFFFFF70727402050A181B20171A1F15181D0E11
      16626468A8A8AAC2C3C4D2D3D4D4D5D6D4D4D5D4D4D5D4D4D5D1D1D2E1E1E2FF
      FFFFFFFFFFE0E1E1191C21101319171A1F171A1F14171C0A0D1357585CA2A3A5
      BEC0C5C7C595B9B027BCB42CBCB42CBCB42CB8AF27D6D17FF2F0D8F1EFD3F1EF
      D3F1EFD4F1EFD6C6BF4DB3A91CB6AD19B6AD19B5AC1AB6AD19EBE8C0F6F5E3F6
      F5E4F6F5E4F6F5E4F6F5E4F6F5E4F6F5E4F6F5E4F6F5E4F6F5E4F6F5E4F7F5E4
      F7F6E6F7F6E5DBD790ADA303ADA300AEA400ACA200B1A80AF6F5E4FFFFFFFFFF
      FFDFDB9AA79D00ADA300AEA400ACA200A89E00B8AF1FCDC764D9D488D9D58AD0
      CA6BBBB227A99F00ACA200AEA400AEA400A69B00D6D17EFFFFFFFFFFFFFFFFFF
      FFFFFFBFB737AA9F00AEA400AEA400A89E00D8D384FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFDEDB98A89D00AEA400AEA400AEA400ABA000BBB32EDAD68CE2
      DEA3E2DEA4EAE8BF000000FFFFFFFFFFFFFFFFFFD4D5D516191E14171C171A1F
      14171C16191DD7D7D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E1191C211215
      1A171A1F171A1F080B11818285FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7D7F8103060C181B1F171A1F16191E
      0D101597989AFFFFFFFFFFFFFFFFFFE8E5A8A49800ABA000ABA000ABA000A59A
      00D5D07DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4BD48A69B00ABA100ABA100AA
      A000ABA100F3F1D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B01FABA000AEA400AEA3
      00AAA000E9E7BBFFFFFFF7F6E7B2A910ABA000AEA400ACA200ADA303D9D58AFC
      FBF4FFFFFFFFFFFFFFFFFFFFFFFFFEFEFBDFDB9AB0A60AABA100AEA400ACA200
      ADA304F1EFD3FFFFFFFFFFFFFFFFFFBFB737AA9F00AEA400AEA400A89E00D8D3
      84FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0CB6BA99E00AEA400AEA400AC
      A100B5AD1AFAF9F0FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
      CBCBCC0E101616191E171A1F111418282B30F8F8F8FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFF9B9C9E05080D171A1F171A1F11141A25272CFBFBFBFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFB3A3C40
      0D1015171A1F171A1F070A0F6A6C6FFFFFFFFFFFFFFFFFFFFFFFFFE2DFA5A89D
      00AEA400AEA400AEA400A99E00D5D07DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5
      BE4AA99E00AEA400AEA400ADA300AEA401F1EFD3FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFB
      F4B3AA12ACA100AEA400AEA400A89E00E6E3B0FFFFFFD6D17FA69B00AEA400AE
      A300ABA000E3E0A6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      EBE8BEADA406ADA200AEA400A79C00CDC761FFFFFFFFFFFFFFFFFFBFB737AA9F
      00AEA400AEA400A89E00D8D384FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCA
      C357A99E00AEA400AEA400A99E00C8C151FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      000000FFFFFFFFFFFFFFFFFFC6C7C80A0D13171A1F171A1F0F1217323539FAFA
      FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6C6E7105080E171A1F171A1F12151B2A
      2C3185878A888A8C87898B87898B87898B87898B87898B87898B87898B7F8183
      ACADAFFFFFFFDCDCDD1B1E2313161C171A1F14171C101318C6C8C9FFFFFFFFFF
      FFFFFFFFFFFFFFE2DFA5A89D00AEA400AEA400AEA400A99E00D5D07DFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFC5BE4AA99E00AEA400AEA400ADA300AEA401F1EFD3
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFBFBFBF4FBFAF1FAFAF1FAFA
      F1FAFAF1F9F8ECF3F1D8CEC867AAA000AEA400AEA400ADA300ABA100EDEBC6FF
      FFFFBDB52FAA9F00AEA400A89E00C8C253FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1CC6FA89D00AEA400ABA100B6AD19FBFA
      F3FFFFFFFFFFFFBFB737AA9F00AEA400AEA400A89E00D8D384FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFC7C04FA99E00AEA400AEA400A89E00CCC65FFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFC6C7C80A0D13171A
      1F171A1F0E1116393B3FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5254580A
      0D13171A1F171A1F181B2014171C05080D04070C04070D04070D04070D04070D
      04070D04070D04070D000000525457FFFFFFCBCCCD0D101616191E171A1F1114
      1A23262AECECECFFFFFFFFFFFFFFFFFFFFFFFFE1DEA2A59A00ABA100ABA100AB
      A100A69A00D7D27CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5BE44A59900AAA000
      AAA000A99F00AAA000F0EED1FFFFFFFFFFFFFFFFFFFFFFFFE4E1AAC6BF51B9B0
      23B4AA12B2A80DB2A80CB2A80CB2A80DB1A80BAFA503AAA000AEA400AEA400AE
      A400ABA000B6AD18FDFCF7F8F7E9B1A709ACA200ADA300AA9F00E6E3B1FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEECCAACA2
      01ADA300ADA300ACA200F0EDCFFFFFFFFFFFFFBFB737AA9F00AEA400AEA400A8
      9E00D8D384FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7C04EA99E00AEA400
      AEA400A89D00CFC969FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFF
      FFFFFFFFC6C7C80A0D13171A1F171A1F0E1116383A3FFBFBFBFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF494C4F0B0E14171A1F171A1F171A1F171A1F171A1F171A1F
      171A1F171A1F171A1F171A1F171A1F171A1F171A1F070B105F6164FFFFFFC1C2
      C3090C12171A1F171A1F101319282B30F6F6F7FFFFFFFFFFFFFFFFFFFFFFFFE6
      E3B0B3A91CB8AF1FB8AF1FB8AF1FB6AC1FCDC981E1E2E4E3E3E3E3E3E3E3E3E3
      E1E1E2C6C062BCB331BDB530BDB530BCB430BDB531F3F2DBFFFFFFFFFFFFFFFE
      FECEC866A89D00A89D00ABA100ACA200ACA200ACA200ACA200ACA200ACA200AD
      A300AEA400AEA400AEA400ACA100A69B00DED997FFFFFFEFEDCBAEA401ADA300
      ADA300AEA401F0EED1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFF7F5E4B3AA0FACA200ADA300ABA100E7E4B3FFFFFFFFFFFFBF
      B737AA9F00AEA400AEA400A89E00D8D384FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFC7C04EA99E00AEA400AEA400A89D00CFC969FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFF000000FFFFFFFFFFFFFFFFFFC6C7C80A0D13171A1F171A1F0E111638
      3A3FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5153560A0D13171A1F171A1F
      171A1F171A1F171A1F171A1F171A1F171A1F171A1F171A1F171A1F171A1F171A
      1F070B105F6164FFFFFFCCCCCE0E101616191E171A1F11141924272CEFEFEFFF
      FFFFFFFFFFFFFFFFFFFFFFFEFDFBFBFAF0FBFAF2FBFAF2FBFAF2FDFCF2929392
      14181E23252A23252A23252A101319AEAFB1FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFDAD58AA69B00ADA300AEA400AEA400AEA400ACA200AB
      A100ABA100ABA000ABA000ABA000AAA000A99E00A79C00AEA40ADAD58AFFFFFF
      FFFFFFEFEDCEAEA402ADA300ADA300AEA401F0EECFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F5E4B3A90EACA200ADA300AB
      A100E8E5B6FFFFFFFFFFFFBFB737AA9F00AEA400AEA400A89E00D8D384FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7C04EA99E00AEA400AEA400A89D00CFC9
      69FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFC6C7C80A
      0D13171A1F171A1F0E1116383A3FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      636568070A10171A1F171A1F181B2015181D06090F05080E05080E05080E0508
      0E05080E05080E05080E05080E000000535558FFFFFFD8D8D9181A1F14171C17
      1A1F13161C1A1D22D8D9DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF8C8D9201060A12151A12151A12151A000007A8A9ACFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF9EEB3AA11ABA100AEA400AE
      A400AEA400AAA000B2A90EB7AE1CB9B022B9B125B9B124BAB125BDB52EC5BE4C
      D7D283F3F2DAFFFFFFFFFFFFFFFFFFF7F6E7B2A80BACA200AEA400A99E00E3E0
      A8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEB
      EAC3ABA100ADA300ADA300ADA300F1EFD2FFFFFFFFFFFFBFB737AA9F00AEA400
      AEA400A89E00D8D384FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7C04EA99E
      00AEA400AEA400A89D00CFC969FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
      FFFFFFFFFFFFFFFFC6C7C80A0D13171A1F171A1F0E1116383A3FFBFBFBFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF86878A03060C171A1F171A1F11141A2C2E339597
      99999A9D98999C98999C98999C98999C98999C98999C98999C919395B8B9BAFF
      FFFFF0F0F02D2F33101318171A1F16191E090C11B3B4B6FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E8F92070B10171A1F171A
      1F171A1F03060CA9AAACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6
      E2B0A89E00AEA400AEA400AEA400ABA000D1CB6EF7F6E5FEFEFEFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBFB7
      36AA9F00AEA400A99E00C5BD47FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFCDC761A99E00AEA400ABA000B8AF1FFCFCF6FFFFFF
      FFFFFFBFB737AA9F00AEA400AEA400A89E00D8D384FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFC7C04EA99E00AEA400AEA400A89D00CFC969FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFC6C7C80A0D13171A1F171A1F
      0E1116383A3FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6B6B80A0D131619
      1E171A1F12151A23262BFAF9FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF525458090C12171A1F171A1F060A0F
      6A6C6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF8E8F92070B10171A1F171A1F171A1F03060CA9AAACFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFDBD68EA79C00AEA400AEA400ACA200B2A90DF9F8ED
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFDAD58AA79B00AEA400AEA400AA9F00DCD891FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E1A9ACA101ADA300AEA400
      A79C00D0CB6CFFFFFFFFFFFFFFFFFFBFB737AA9F00AEA400AEA400A89E00D8D3
      84FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7C04EA99E00AEA400AEA400A8
      9D00CFC969FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
      D0D1D1090C12171A1F171A1F0D10153A3C41FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFF0F0F025282D101319171A1F171A1F080B108A8C8FFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F9193
      03060C171A1F171A1F14171D14171CACADAFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF8E8F920000020A0D120A0D120A0D12000000AC
      ADAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBD68EA79C00AEA400
      AEA400ACA200AFA508F4F3DDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF9EFB6AC19AA9F00AE
      A400ACA200AAA000D1CB6FF6F5E3FFFFFFFFFFFFFFFFFFFFFFFFF9F8ECD6D180
      ADA200ACA200AEA400ABA100B0A70BF9F9EEFFFFFFFFFFFFFFFFFFC0B83BAA9F
      00AEA400AEA400A89E00DBD68EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7
      C04EA99E00AEA400AEA400A89C00D1CC71FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      000000D4D4D5C2C3C4C6C7C998999B0E1116171A1F171A1F1013182F3236BFC0
      C1C3C4C5C2C3C4BEBFC0D7D7D8FFFFFFFFFFFF7A7C7E03060B181B20171A1F14
      171C12161B6A6B6EA2A4A5BABBBDC3C4C5C2C3C4C2C3C4C2C3C4C2C3C4BEBFC0
      D4D5D6FFFFFFFFFFFFE2E2E31A1D22111419171A1F181B2012151A0F12175355
      59909193B0B1B2B8B9BAB9BABBB9BABBB9BABBB9BABBB9BABB8C8D904F525559
      5B5E595B5E595B5E4C4F53989A9BBEBFC0BDBEBFBDBEBFBDBDBEBBBCBDEEEEEE
      FFFFFFE6E3B2A99E00AEA300AEA400AEA400ABA000C4BD45DEDA98DEDA97DEDA
      97DEDA97DEDA97DDD996DDD995DDD995DDD995DDD995DAD690F1EFD2FFFFFFFF
      FFFFFFFFFFE5E1ACAA9E00ADA200AEA400ADA300A89D00B2A80DC5BE4BD1CB6D
      D1CB6EC8C151B4AB14A89E00ADA200AEA400ADA300A89D00D9D588E4E1AADBD6
      8FDCD892DDD892B8AF1FACA100AEA400AEA400ABA000C6BF4BDDD994DCD891DC
      D891DAD58DEFEDCEFFFFFFC7C04EA99E00AEA400AEA400AAA000C1B93CDDD994
      DCD891DCD891DCD891E6E3B200000057585C0D10150E1116101318181B1F171A
      1F171A1F171A1F16191E0D10160D10160D1015000107616266FFFFFFFFFFFFE8
      E8E927292E090D12181B20181B2015181D080B10090D120C0F150D10160D1015
      0D10150D10150D1015000106585A5DFFFFFFFFFFFFFFFFFF8486880002081619
      1E171A1F171A1F15181D090C12070B100B0E130C0F140C0F140C0F140C0F140C
      0F1400000587888BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6A6C6F0000030D1015
      0D10150B0E1306090FC0C1C2FFFFFFFAF9EEB5AB13ABA000AEA400AEA400AEA4
      00AAA000A99F00A99F00A99F00A99F00A99F00A99F00A99F00A99F00A99F00A9
      9F00A29600DBD68DFFFFFFFFFFFFFFFFFFFFFFFFDAD589A89D00ABA100AEA400
      AEA400ACA200A99E00A89D00A89D00A89E00ACA200AEA400AEA400ACA200A69B
      00D3CF77FEFEFAB2A90EA69B00A99E00A99E00ADA300AEA400AEA400AEA400AE
      A400ABA100A99E00A99E00A99E00A39800D9D386FFFFFFC7C04EA99E00AEA400
      AEA400AEA400ACA200A99F00A99E00A99E00A99E00C2BB420000005E5F631619
      1E16191E171A1F171A1F171A1F171A1F171A1F171A1F16191E16191E16191E07
      0A1067686CFFFFFFFFFFFFFFFFFFC9C9CA1D202504070C14171C171A1F171A1F
      171A1F171A1F16191E16191E16191E16191E16191E060A0F5F6164FFFFFFFFFF
      FFFFFFFFFAFAFA5B5E610003090E111616191E171A1F171A1F171A1F171A1F17
      1A1F171A1F171A1F171A1F171A1F060A0F87888BFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF6D6F7204070C16191F16191F14171D101318C3C4C5FFFFFFFFFFFFDDD9
      95A69B00ACA200AEA400AEA400AEA400AEA400AEA400AEA400AEA400AEA400AE
      A400AEA400AEA400AEA400AEA400A79C00DDD893FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFE0DC9EAFA50DA79C00ACA200AEA400AEA400AEA400AEA400AEA400AEA4
      00ACA200A89D00ACA203D9D588FFFFFFFAFAF0B6AD18ABA100AEA400AEA400AE
      A400AEA400AEA400AEA400AEA400AEA400AEA400AEA400AEA400A89E00DBD68D
      FFFFFFC7C04EA99E00AEA400AEA400AEA400AEA400AEA400AEA400AEA400AEA4
      00C6BF4D00000054555A090C11090C110C0F15181B20171A1F171A1F181B2015
      181D090C12090C11090C110000035E5F63FFFFFFFFFFFFFFFFFFFFFFFFDADADA
      54575A11141904070D070A10080B11090C11090C11090C11090C11090C11090C
      1100000155575BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9293952C2E33080B1005
      080E080B10080C11090C11090C11090C11090C11090C11090C11000001808184
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6D6F7205080D171A1F171A1F15181D1114
      19C3C4C5FFFFFFFFFFFFFFFFFFD5D07BACA103A79D00A99E00A99E00A99E00A9
      9E00A99E00A99E00A99E00A99E00A99E00A99E00A99E00A99E00A29600DBD68C
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F1D8CCC661B1A810A99E00A89D
      00A99E00A99E00A89E00A89E00AFA60CC8C156EFEDCDFFFFFFFFFFFFF8F7EAB1
      A80BA69B00A99E00A99E00ADA300AEA400AEA400AEA400AEA400ABA100A99E00
      A99E00A99E00A39800D9D386FFFFFFC7C04EA99E00AEA400AEA400AEA400ACA2
      00A99E00A99E00A99E00A99E00C2BB420000009192946162666163674F515513
      161B171A1F171A1F14171C2124295F616461636661626657585C98989AFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2D2D39E9FA07F80847071746264676062
      6561626661626661626661626656585B929395FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFF5F4F4BCBDBE93939575777A6B6D70616367606265616266616266
      61626661626656585BADAEB0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6D6F720508
      0D171A1F171A1F15181D111419C3C4C5FFFFFFFFFFFFFFFFFFFFFFFFF1EFD2DB
      D792CFC967C9C356C8C152C8C152C8C152C8C152C8C152C8C152C8C152C8C152
      C8C152C8C152C3BC4BE8E5B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFF7F5E5E3E0A9D4CE7ACCC55ECBC55BD3CD75E1DDA1F4F3DFFFFFFFFF
      FFFFFFFFFFFFFFFFFBFAF2CFC968C8C155CAC358CAC358B4AA13ADA200AEA400
      AEA400ACA200BDB52FCAC459CAC358CAC358C6BF51E7E4B4FFFFFFC7C04EA99E
      00AEA400AEA400ACA100B9B124CAC459CAC358CAC358CAC358DAD58B000000FF
      FFFFFFFFFFFFFFFFD1D2D2090C12171A1F171A1F0D10153A3C41FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF60626500000002050B02050B000308000004BEBFC0FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFC0B83AAA9F00AEA400AEA400A79D00D9D589FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFC7C04EA99E00AEA400AEA400A89D00D1CB6FFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFC6C7C80A0D13171A1F171A1F
      0E1116383A3FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5B6B8808284898B8E898B8E88
      8A8D86888BE1E1E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3BB41AA9F00AEA400AEA400AA9F00C1B9
      3CFEFEFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7C04EA99E00AEA400AEA400A8
      9D00CFC969FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
      C6C7C80A0D13171A1F171A1F0E1116383A3FFBFBFBFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCC55EA89D
      00AEA400AEA400AEA400ABA100BDB531CEC864D1CB6DCDC765EAE8BEFFFFFFC7
      C04EA99E00AEA400AEA400A89D00CFC969FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      000000FFFFFFFFFFFFFFFFFFC6C7C80A0D13171A1F171A1F0E1116383A3FFBFB
      FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFE0DC9EA69B00AEA400AEA400AEA400AEA400AAA000A89D00A8
      9D00A39700D8D488FFFFFFC7C04EA99E00AEA400AEA400A89D00CFC969FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFC6C7C80A0D13171A
      1F171A1F0E1116383A3FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFAF2BAB227A69B00ADA300AE
      A400AEA400AEA400AEA400AEA400A99E00DBD790FFFFFFC7C04EA99E00AEA400
      AEA400A89D00CFC969FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFF
      FFFFFFFFC6C7C8090C1216191E16191E0D101537393EFBFBFBFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFF5F4DFC4BD4CB0A60BADA300AEA400AEA400AEA400AEA400A99E00DBD790
      FFFFFFC7C04DA99E00AEA400AEA400A89D00CFC969FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFF000000FFFFFFFFFFFFFFFFFFD7D8D955575B5E60645E6064585A5E75
      7679FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E4B4D2CD77C9C357C8C151
      C8C153C8C153C5BD4EE7E4B4FFFFFFD9D488C5BD4EC8C153C8C153C4BD4DDEDA
      99FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000B949000009006D6D6F5449
      54554C4F000200540100002C000000320100001200000043000000F401000000
      0000000000FFFFFF1F2C020000000000010008005B544954554C4F5D00000000
      FFFF0000000000020000000100000006090068656C766574696361000B000000
      020000000000020000000100020000000000FFFFFF0000000002000000000000
      000000674A000010006D6D6F524F44415045544543534F4654000200FE010000
      3D020000CA0000000A00000043000000F4010000000000000000FFFFFF1F2C02
      000000000001002100746563534F4654202D205465636E6F6C6F67696120656D
      2053697374656D61732000000000FFFF00000000000200000001000000050900
      68656C7665746963610007000000000000000000110000000100020000000000
      FFFFFF0000000002000000000000000000F84A00000C006D6D6F535542544954
      554C4F000200540100003F000000320100001B00000043000000F40100000000
      00000000FFFFFF1F2C020000000000010008005B4F75747261735D00000000FF
      FF0000000000020000000100000000090068656C766574696361000900000002
      0000000000020000000100020000000000FFFFFF000000000200000000000000
      0000894B00000E006D6D6F524F54554C4F4C4956524F0002008A0200002E0000
      001F0000000B00000040000000F4010000000000000000FFFFFF1F2C02000000
      0000010006004C6976726F3A00000000FFFF0000000000020000000100000000
      090068656C766574696361000700000002000000000000000000010002000000
      0000FFFFFF0000000002000000000000000000284C000008006D6D6F4C495652
      4F000200AE0200002E000000160000000B00000041000000F401000000000000
      0000FFFFFF1F2C02000000000001001A005B6966285B4C6976726F5D3D302C27
      272C5B4C6976726F5D295D00000000FFFF000000000002000000010000000009
      0068656C76657469636100070000000000000000000100000001000200000000
      00FFFFFF0000000002000000000000000000C54C000005006D6D6F4945000200
      B10000004C000000A20000000A00000043000000F4010000000000000000FFFF
      FF1F2C02000000000001001B00492E4553542E3A5B496E7363726963616F4573
      74616475616C5D2000000000FFFF000000000002000000010000000009006865
      6C7665746963610007000000000000000000100000000100020000000000FFFF
      FF0000000002000000000000000000554D000007006D6D6F434E504A000200B1
      00000041000000A20000000A00000043000000F4010000000000000000FFFFFF
      1F2C02000000000001000C00434E504A3A205B434E504A5D00000000FFFF0000
      000000020000000100000000090068656C766574696361000700000000000000
      0000100000000100020000000000FFFFFF0000000002000000000000000000E1
      4D000008006D6D6F52415A414F000200B10000002C000000A200000014000000
      43000000F4010000000000000000FFFFFF1F2C020000000000010007005B5261
      7A616F5D00000000FFFF0000000000020000000100000006090068656C766574
      6963610007000000000000000000100000000100020000000000FFFFFF000000
      0002000000000000000000704E00000D004D656D6F436F6446697363616C0002
      002E00000072000000200000000C00000043000F00F4010000000000000000FF
      FFFF1F2C0201010000000100050053C952494500000000015B00000000000200
      00000100000000090068656C76657469636100060000000000000000000A0000
      001700020000000000FFFFFF0000000002000000000000000000164F00000500
      4D656D6F380002002E00000009010000200000000B00000043000000F4010000
      000000000000FFFFFF1F2C000000000000010024005B717279417578696C6961
      72496D706F73746F7352657469646F732E227365726965225D00000000FFFF00
      00000000020000000100000000090068656C7665746963610007000000000000
      000000120000001700020000000000FFFFFF0000000002000000000000000000
      A94F00000B004D656D6F50726F6475746F0002002E000000660000007E000000
      0C00000043000F00F4010000000000000000FFFFFF1F2C02000000000001000B
      004E4F54412046495343414C00000000015B0000000000020000000100000000
      090068656C76657469636100060000000000000000000A000000010002000000
      0000FFFFFF00000000020000000000000000005750000006004D656D6F313600
      0200D4000000090100008E0000000B00000041000000F4010000000000000000
      FFFFFF1F2C000402080064642F6D6D2F797900010023005B717279417578696C
      696172496D706F73746F7352657469646F732E226E6F6D65225D00000000FFFF
      0000000000020000000100000000090068656C76657469636100070000000000
      00000000100000001700020000000000FFFFFF00000000020000000000000000
      000751000006004D656D6F3434000200AB00000009010000290000000B000000
      43000000F4010000000000000000FFFFFF1F2C00040107002323232C23232300
      010026005B717279417578696C696172496D706F73746F7352657469646F732E
      22636C69656E7465225D00000000FFFF00000000000200000001000000000900
      68656C7665746963610007000000000000000000110000001700020000000000
      FFFFFF0000000002000000000000000000F051000006004D656D6F3435000200
      4E00000009010000300000000B00000043000000F4010000000000000000FFFF
      FF1F2C00040107002323232C2323230001005F005B4946285B71727941757869
      6C696172496D706F73746F7352657469646F732E226E76656E63746F73225D3E
      312C20272A2020272C202727295D5B717279417578696C696172496D706F7374
      6F7352657469646F732E226E756D65726F225D00000000FFFF00000000000200
      00000100000000090068656C7665746963610007000000000000000000120000
      001700020000000000FFFFFF00000000020000000000000000007A5200000600
      4D656D6F3638000200AC00000066000000B60000000C00000043000F00F40100
      00000000000000FFFFFF1F2C02000000000001000700434C49454E5445000000
      00015B0000000000020000000100000000090068656C76657469636100060000
      000000000000000A0000000100020000000000FFFFFF00000000020000000000
      00000000A353000005004D656D6F3400020099010000080100002E0000000B00
      000003000000F4010000000000000000FFFFFF1F2C00000007002323232C2323
      230001004A005B464F524D4154464C4F415428272323232C2323232C2323302E
      3030272C205B717279417578696C696172496D706F73746F7352657469646F73
      2E2276616C6F72746F74616C225D295D0003000500626567696E0D4600202056
      414C4F52544F54414C203A3D2056414C4F52544F54414C202B205B7172794175
      78696C696172496D706F73746F7352657469646F732E2276616C6F72746F7461
      6C225D0D0300656E6400FFFF0000000000020000000100000000090068656C76
      65746963610007000000000000000000110000001700020000000000FFFFFF00
      00000002000000000000000000EE54000005004D656D6F37000200C701000008
      0100002A0000000B00000003000000F4010000000000000000FFFFFF1F2C0000
      0007002323232C23232300010077005B6966285B717279417578696C69617249
      6D706F73746F7352657469646F732E22636F66696E73225D3C3E302C5B464F52
      4D4154464C4F415428272323232C2323232C2323302E3030272C5B7172794175
      78696C696172496D706F73746F7352657469646F732E22636F66696E73225D29
      5D2C2727295D0003000500626567696E0D3B002020434F46494E53203A3D2043
      4F46494E53202B205B717279417578696C696172496D706F73746F7352657469
      646F732E22636F66696E73225D3B0D0300656E6400FFFF000000000002000000
      0100000000090068656C76657469636100070000000000000000001100000017
      00020000000000FFFFFF00000000020000000000000000002F56000006004D65
      6D6F3133000200F1010000080100002B0000000B00000003000000F401000000
      0000000000FFFFFF1F2C00000007002323232C23232300010073005B6966285B
      717279417578696C696172496D706F73746F7352657469646F732E2263736C6C
      225D3C3E302C5B464F524D4154464C4F415428272323232C2323232C2323302E
      3030272C5B717279417578696C696172496D706F73746F7352657469646F732E
      2263736C6C225D295D2C2727295D0003000500626567696E0D3400202043534C
      4C203A3D2043534C4C202B205B717279417578696C696172496D706F73746F73
      52657469646F732E2263736C6C225D0D0300656E6400FFFF0000000000020000
      000100000000090068656C766574696361000700000000000000000011000000
      1700020000000000FFFFFF00000000020000000000000000007057000006004D
      656D6F32350002001C020000080100002B0000000B00000003000000F4010000
      000000000000FFFFFF1F2C00000007002323232C23232300010073005B696628
      5B717279417578696C696172496D706F73746F7352657469646F732E22696E73
      73225D3C3E302C5B464F524D4154464C4F415428272323232C2323232C232330
      2E3030272C5B717279417578696C696172496D706F73746F7352657469646F73
      2E22696E7373225D295D2C2727295D0003000500626567696E0D34002020494E
      5353203A3D20494E5353202B205B717279417578696C696172496D706F73746F
      7352657469646F732E22696E7373225D0D0300656E6400FFFF00000000000200
      00000100000000090068656C7665746963610007000000000000000000110000
      001700020000000000FFFFFF0000000002000000000000000000F65700000600
      4D656D6F333800020072020000720000002B0000000C00000043000F00F40100
      00000000000000FFFFFF1F2C0201010000000100030049535300000000015B00
      00000000020000000100000000090068656C7665746963610006000000000000
      0000000A0000001700020000000000FFFFFF0000000002000000000000000000
      8058000006004D656D6F34330002007B00000072000000310000000C00000043
      000F00F4010000000000000000FFFFFF1F2C02010100000001000700454D4953
      53C34F00000000015B0000000000020000000100000000090068656C76657469
      636100060000000000000000000A0000001700020000000000FFFFFF00000000
      020000000000000000000659000006004D656D6F35350002009D020000720000
      002B0000000C00000043000F00F4010000000000000000FFFFFF1F2C02010100
      00000100030050495300000000015B0000000000020000000100000000090068
      656C76657469636100060000000000000000000A0000001700020000000000FF
      FFFF0000000002000000000000000000D059000006004D656D6F35360002007B
      00000009010000300000000B00000043000000F4010000000000000000FFFFFF
      1F2C000000000000010047005B464F524D41544441544554494D45282764642F
      6D6D2F7979272C5B717279417578696C696172496D706F73746F735265746964
      6F732E2264617461656D697373616F225D295D00000000FFFF00000000000200
      00000100000000090068656C7665746963610007000000000000000000110000
      001700020000000000FFFFFF0000000002000000000000000000115B00000600
      4D656D6F323300020047020000080100002B0000000B00000003000000F40100
      00000000000000FFFFFF1F2C00000007002323232C23232300010073005B6966
      285B717279417578696C696172496D706F73746F7352657469646F732E226972
      7266225D3C3E302C5B464F524D4154464C4F415428272323232C2323232C2323
      302E3030272C5B717279417578696C696172496D706F73746F7352657469646F
      732E2269727266225D295D2C2727295D0003000500626567696E0D3400202049
      525246203A3D2049525246202B205B717279417578696C696172496D706F7374
      6F7352657469646F732E2269727266225D0D0300656E6400FFFF000000000002
      0000000100000000090068656C76657469636100070000000000000000001100
      00001700020000000000FFFFFF00000000020000000000000000004D5C000006
      004D656D6F363200020072020000080100002B0000000B00000003000000F401
      0000000000000000FFFFFF1F2C00000007002323232C23232300010071005B69
      66285B717279417578696C696172496D706F73746F7352657469646F732E2269
      7373225D3C3E302C5B464F524D4154464C4F415428272323232C2323232C2323
      302E3030272C5B717279417578696C696172496D706F73746F7352657469646F
      732E22697373225D295D2C2727295D0003000500626567696E0D310020204953
      53203A3D20495353202B205B717279417578696C696172496D706F73746F7352
      657469646F732E22697373225D0D0300656E6400FFFF00000000000200000001
      00000000090068656C7665746963610007000000000000000000110000001700
      020000000000FFFFFF0000000002000000000000000000895D000006004D656D
      6F36370002009D020000080100002B0000000B00000003000000F40100000000
      00000000FFFFFF1F2C00000007002323232C23232300010071005B6966285B71
      7279417578696C696172496D706F73746F7352657469646F732E22706973225D
      3C3E302C5B464F524D4154464C4F415428272323232C2323232C2323302E3030
      272C5B717279417578696C696172496D706F73746F7352657469646F732E2270
      6973225D295D2C2727295D0003000500626567696E0D31002020504953203A3D
      20504953202B205B717279417578696C696172496D706F73746F735265746964
      6F732E22504953225D0D0300656E6400FFFF0000000000020000000100000000
      090068656C766574696361000700000000000000000011000000170002000000
      0000FFFFFF0000000002000000000000000000335E000005004D656D6F320002
      00CF000000810000007F0000000B00000043000000F4010000000000000000FF
      FFFF1F2C020000000000010028005B4946285B5452414E53504F525441525D3D
      545255452C275452414E53504F525445272C2727295D00000000FFFF00000000
      00020000000100000000090068656C7665746963610007000000020000000000
      110000001700020000000000FFFFFF0000000002000000000000000000025F00
      0006004D656D6F3237000200C7010000810000002A0000000B00000003000000
      F4010000000000000000FFFFFF1F2C00000007002323232C2323230001004500
      5B4946285B5452414E53504F525441525D3D545255452C5B464F524D4154464C
      4F415428272323232C2323232C2323302E3030272C205B434F46494E535D295D
      2C2727295D00000000FFFF0000000000020000000100000000090068656C7665
      746963610007000000020000000000110000001700020000000000FFFFFF0000
      000002000000000000000000CF5F000006004D656D6F3238000200F101000081
      0000002B0000000B00000003000000F4010000000000000000FFFFFF1F2C0000
      0007002323232C23232300010043005B4946285B5452414E53504F525441525D
      3D545255452C5B464F524D4154464C4F415428272323232C2323232C2323302E
      3030272C205B43534C4C5D295D2C2727295D00000000FFFF0000000000020000
      000100000000090068656C766574696361000700000002000000000011000000
      1700020000000000FFFFFF00000000020000000000000000009C60000006004D
      656D6F32390002001C020000810000002B0000000B00000003000000F4010000
      000000000000FFFFFF1F2C00000007002323232C23232300010043005B494628
      5B5452414E53504F525441525D3D545255452C5B464F524D4154464C4F415428
      272323232C2323232C2323302E3030272C205B494E53535D295D2C2727295D00
      000000FFFF0000000000020000000100000000090068656C7665746963610007
      000000020000000000110000001700020000000000FFFFFF0000000002000000
      0000000000006961000006004D656D6F333200020047020000810000002B0000
      000B00000003000000F4010000000000000000FFFFFF1F2C0000000700232323
      2C23232300010043005B4946285B5452414E53504F525441525D3D545255452C
      5B464F524D4154464C4F415428272323232C2323232C2323302E3030272C205B
      495252465D295D2C2727295D00000000FFFF0000000000020000000100000000
      090068656C766574696361000700000002000000000011000000170002000000
      0000FFFFFF00000000020000000000000000003562000006004D656D6F333400
      020072020000810000002B0000000B00000003000000F4010000000000000000
      FFFFFF1F2C00000007002323232C23232300010042005B4946285B5452414E53
      504F525441525D3D545255452C5B464F524D4154464C4F415428272323232C23
      23232C2323302E3030272C205B4953535D295D2C2727295D00000000FFFF0000
      000000020000000100000000090068656C766574696361000700000002000000
      0000110000001700020000000000FFFFFF000000000200000000000000000001
      63000006004D656D6F33370002009D020000810000002B0000000B0000000300
      0000F4010000000000000000FFFFFF1F2C00000007002323232C232323000100
      42005B4946285B5452414E53504F525441525D3D545255452C5B464F524D4154
      464C4F415428272323232C2323232C2323302E3030272C205B5049535D295D2C
      2727295D00000000FFFF0000000000020000000100000000090068656C766574
      6963610007000000020000000000110000001700020000000000FFFFFF000000
      0002000000000000000000AF63000006004D656D6F3139000200270100003002
      00005F0000000B00000043000000F4010000000000000000FFFFFF1F2C020000
      00000001002B005B4946285B5452414E53504F525441525D3D545255452C2741
      205452414E53504F52544152272C2727295D00000000FFFF0000000000020000
      000100000006090068656C766574696361000700000002000000000011000000
      1700020000000000FFFFFF00000000020000000000000000007E64000006004D
      656D6F3331000200C7010000300200002A0000000B00000003000000F4010000
      000000000000FFFFFF1F2C00000007002323232C23232300010045005B494628
      5B5452414E53504F525441525D3D545255452C5B464F524D4154464C4F415428
      272323232C2323232C2323302E3030272C205B434F46494E535D295D2C272729
      5D00000000FFFF0000000000020000000100000006090068656C766574696361
      0007000000020000000000110000001700020000000000FFFFFF000000000200
      00000000000000004B65000006004D656D6F3333000200F1010000300200002B
      0000000B00000003000000F4010000000000000000FFFFFF1F2C000000070023
      23232C23232300010043005B4946285B5452414E53504F525441525D3D545255
      452C5B464F524D4154464C4F415428272323232C2323232C2323302E3030272C
      205B43534C4C5D295D2C2727295D00000000FFFF000000000002000000010000
      0006090068656C76657469636100070000000200000000001100000017000200
      00000000FFFFFF00000000020000000000000000001866000006004D656D6F34
      320002001C020000300200002B0000000B00000003000000F401000000000000
      0000FFFFFF1F2C00000007002323232C23232300010043005B4946285B545241
      4E53504F525441525D3D545255452C5B464F524D4154464C4F41542827232323
      2C2323232C2323302E3030272C205B494E53535D295D2C2727295D00000000FF
      FF0000000000020000000100000006090068656C766574696361000700000002
      0000000000110000001700020000000000FFFFFF000000000200000000000000
      0000E566000006004D656D6F343600020047020000300200002B0000000B0000
      0003000000F4010000000000000000FFFFFF1F2C00000007002323232C232323
      00010043005B4946285B5452414E53504F525441525D3D545255452C5B464F52
      4D4154464C4F415428272323232C2323232C2323302E3030272C205B49525246
      5D295D2C2727295D00000000FFFF000000000002000000010000000609006865
      6C7665746963610007000000020000000000110000001700020000000000FFFF
      FF0000000002000000000000000000B167000006004D656D6F34370002007202
      0000300200002B0000000B00000003000000F4010000000000000000FFFFFF1F
      2C00000007002323232C23232300010042005B4946285B5452414E53504F5254
      41525D3D545255452C5B464F524D4154464C4F415428272323232C2323232C23
      23302E3030272C205B4953535D295D2C2727295D00000000FFFF000000000002
      0000000100000006090068656C76657469636100070000000200000000001100
      00001700020000000000FFFFFF00000000020000000000000000007D68000006
      004D656D6F34380002009D020000300200002B0000000B00000003000000F401
      0000000000000000FFFFFF1F2C00000007002323232C23232300010042005B49
      46285B5452414E53504F525441525D3D545255452C5B464F524D4154464C4F41
      5428272323232C2323232C2323302E3030272C205B5049535D295D2C2727295D
      00000000FFFF0000000000020000000100000006090068656C76657469636100
      07000000020000000000110000001700020000000000FFFFFF00000000020000
      000000000000002569000006004D656D6F36390002001B000000300200000801
      00000D0000004300000001000000000000000000FFFFFF1F2C02000000000001
      0025002A204E6F74612046697363616C20636F6D2076E172696F732076656E63
      696D656E746F732E00000000FFFF000000000002000000010000000609006865
      6C7665746963610006000000000000000000000000000100020000000000FFFF
      FF0000000002000000000000000000AB69000005004D656D6F33000200620100
      0072000000340000000C00000043000F00F4010000000000000000FFFFFF1F2C
      020000000000010004004441544100000000015B000000000002000000010000
      0000090068656C76657469636100060000000000000000000A00000001000200
      00000000FFFFFF00000000020000000000000000007D6A000005004D656D6F36
      0002006401000009010000320000000B00000043000000F40100000000000000
      00FFFFFF1F2C000000080064642F6D6D2F797900010048005B464F524D415444
      41544554494D45282764642F6D6D2F7979272C5B717279417578696C69617249
      6D706F73746F7352657469646F732E2264617461636F6E746162696C225D295D
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      07000000000000000000120000001700020000000000FFFFFF00000000020000
      000000000000000E6B000005004D656D6F310002006201000066000000650000
      000C00000043000F00F4010000000000000000FFFFFF1F2C0200000000000100
      0F004441444F5320434F4E54C14245495300000000015B000000000002000000
      0100000000090068656C76657469636100060000000000000000000A00000001
      00020000000000FFFFFF0000000002000000000000000000BF6B000005004D65
      6D6F350002002E000000A6000000140200000F00000043000000010000000000
      00000000FFFFFF1F2C02000000000001002F005B717279417578696C69617249
      6D706F73746F7352657469646F732E2244657363726963616F506F736963616F
      225D00000000FFFF0000000000020000000100000000090068656C7665746963
      610008000000020000000000000000000100020000000000FFFFFF0000000002
      000000000000000000A16C000005004D656D6F39000200330000004801000053
      0100000C00000043000000F4010000000000000000FFFFFF1F2C020000000000
      01003A00544F5441495320444153205B717279417578696C696172496D706F73
      746F7352657469646F732E2244657363726963616F506F736963616F225D0003
      000500626567696E0D1600205472616E73706F727461723A3D66616C73653B20
      200D0300656E6400FFFF0000000000020000000100000000090068656C766574
      6963610007000000020000000000110000001700020000000000FFFFFF000000
      0002000000000000000000A06D000006004D656D6F3130000200C70100004801
      00002A0000000B00000003000000F4010000000000000000FFFFFF1F2C000000
      07002323232C23232300010057005B464F524D4154464C4F415428272323232C
      2323232C2323302E3030272C205B53554D285B717279417578696C696172496D
      706F73746F7352657469646F732E22636F66696E73225D2C204E6F7461732C20
      31295D295D0003000500626567696E0D0E002020434F46494E53203A3D20303B
      0D0300656E6400FFFF0000000000020000000100000000090068656C76657469
      63610007000000020000000000110000001700020000000000FFFFFF00000000
      020000000000000000009B6E000006004D656D6F3132000200F1010000480100
      002B0000000B00000003000000F4010000000000000000FFFFFF1F2C00000007
      002323232C23232300010055005B464F524D4154464C4F415428272323232C23
      23232C2323302E3030272C205B53554D285B717279417578696C696172496D70
      6F73746F7352657469646F732E2263736C6C225D2C204E6F7461732C2031295D
      295D0003000500626567696E0D0C00202043534C4C203A3D20303B0D0300656E
      6400FFFF0000000000020000000100000000090068656C766574696361000700
      0000020000000000110000001700020000000000FFFFFF000000000200000000
      0000000000966F000006004D656D6F31350002001C020000480100002B000000
      0B00000003000000F4010000000000000000FFFFFF1F2C00000007002323232C
      23232300010055005B464F524D4154464C4F415428272323232C2323232C2323
      302E3030272C205B53554D285B717279417578696C696172496D706F73746F73
      52657469646F732E22696E7373225D2C204E6F7461732C2031295D295D000300
      0500626567696E0D0C002020494E5353203A3D20303B0D0300656E6400FFFF00
      00000000020000000100000000090068656C7665746963610007000000020000
      000000110000001700020000000000FFFFFF0000000002000000000000000000
      9170000006004D656D6F313700020047020000480100002B0000000B00000003
      000000F4010000000000000000FFFFFF1F2C00000007002323232C2323230001
      0055005B464F524D4154464C4F415428272323232C2323232C2323302E303027
      2C205B53554D285B717279417578696C696172496D706F73746F735265746964
      6F732E2269727266225D2C204E6F7461732C2031295D295D0003000500626567
      696E0D0C00202049525246203A3D20303B0D0300656E6400FFFF000000000002
      0000000100000000090068656C76657469636100070000000200000000001100
      00001700020000000000FFFFFF00000000020000000000000000008A71000006
      004D656D6F323100020072020000480100002B0000000B00000003000000F401
      0000000000000000FFFFFF1F2C00000007002323232C23232300010054005B46
      4F524D4154464C4F415428272323232C2323232C2323302E3030272C205B5355
      4D285B717279417578696C696172496D706F73746F7352657469646F732E2269
      7373225D2C204E6F7461732C2031295D295D0003000500626567696E0D0B0020
      20495353203A3D20303B0D0300656E6400FFFF00000000000200000001000000
      00090068656C7665746963610007000000020000000000110000001700020000
      000000FFFFFF00000000020000000000000000008372000006004D656D6F3232
      0002009D020000480100002B0000000B00000003000000F40100000000000000
      00FFFFFF1F2C00000007002323232C23232300010054005B464F524D4154464C
      4F415428272323232C2323232C2323302E3030272C205B53554D285B71727941
      7578696C696172496D706F73746F7352657469646F732E22706973225D2C204E
      6F7461732C2031295D295D0003000500626567696E0D0B002020504953203A3D
      20303B0D0300656E6400FFFF0000000000020000000100000000090068656C76
      65746963610007000000020000000000110000001700020000000000FFFFFF00
      000000020000000000000000005673000006004D656D6F323400020085010000
      81000000420000000B00000003000000F4010000000000000000FFFFFF1F2C00
      000007002323232C23232300010049005B4946285B5452414E53504F52544152
      5D3D545255452C5B464F524D4154464C4F415428272323232C2323232C232330
      2E3030272C205B56414C4F52544F54414C5D295D2C2727295D00000000FFFF00
      00000000020000000100000000090068656C7665746963610007000000020000
      000000110000001700020000000000FFFFFF0000000002000000000000000000
      5D74000006004D656D6F323600020089010000480100003E0000000B00000003
      000000F4010000000000000000FFFFFF1F2C00000007002323232C2323230001
      005B005B464F524D4154464C4F415428272323232C2323232C2323302E303027
      2C205B53554D285B717279417578696C696172496D706F73746F735265746964
      6F732E2276616C6F72746F74616C225D2C204E6F7461732C2031295D295D0003
      000500626567696E0D1200202056414C4F52544F54414C203A3D20303B0D0300
      656E6400FFFF0000000000020000000100000000090068656C76657469636100
      07000000020000000000110000001700020000000000FFFFFF00000000020000
      000000000000003075000006004D656D6F343000020089010000300200003E00
      00000B00000003000000F4010000000000000000FFFFFF1F2C00000007002323
      232C23232300010049005B4946285B5452414E53504F525441525D3D54525545
      2C5B464F524D4154464C4F415428272323232C2323232C2323302E3030272C20
      5B56414C4F52544F54414C5D295D2C2727295D00000000FFFF00000000000200
      00000100000006090068656C7665746963610007000000020000000000110000
      001700020000000000FFFFFF000000000200000000000000FEFEFF1B0000000B
      0020496E76656E746172696F0000000003005275610000000006004261697272
      6F000000000600436964616465000000000400466F6E650000000006004F7574
      7261730000000005004C6976726F00010031000600506167696E610001003000
      06004D6178696D6F00040039393939000400434E504A000000001100496E7363
      726963616F457374616475616C00000000050052617A616F0000000006005469
      74756C6F000000000900537562546974756C6F0002002727000C002041677275
      70616D656E746F00000000120041677275706172477275706F46696C69616C00
      050046616C7365000D004167727570617246696C69616C00050046616C736500
      0B0020417578696C6961726573000000000B005472616E73706F727461720005
      0046616C7365000E0020546F74616C697A61646F726173000000000A0056414C
      4F52544F54414C00010030000600434F46494E530001003000040043534C4C00
      010030000400494E535300010030000400495252460001003000030049535300
      01003000030050495300010030000000000000000000FC000000000000000000
      0000000000000058004031283F7686E3400F843D83CE1FE540}
  end
end
