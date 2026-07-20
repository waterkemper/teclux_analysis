inherited dtmrelatorioContratosSituacao: TdtmrelatorioContratosSituacao
  OldCreateOrder = False
  Left = 545
  Top = 217
  Height = 494
  Width = 775
  object qryRelatorioContratosSituacao: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeOpen = qryRelatorioContratosSituacaoBeforeOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'WhereClientes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WhereEmpreendimentos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaSituacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Ordenacao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';'
      'SELECT s.*,'
      ''
      '       CAST(CASE WHEN s.Situacao = '#39'J'#39' THEN '#39'NO JUR'#205'DICO'#39
      '                 WHEN s.Situacao = '#39'V'#39' THEN '#39'VENDIDO'#39
      '                 WHEN s.Situacao = '#39'D'#39' THEN '#39'RENEGOCIADO DE'#39
      '                 WHEN s.Situacao = '#39'F'#39' THEN '#39'TRANSFERIDO DE'#39
      '                 WHEN s.Situacao = '#39'S'#39' THEN '#39'RESCINDIDO'#39
      '                 WHEN s.Situacao = '#39'Q'#39' THEN '#39'QUITADO'#39
      '                 WHEN s.Situacao = '#39'R'#39' THEN '#39'RESERVADO'#39
      '                 WHEN s.Situacao = '#39'C'#39' THEN '#39'CANCELADO'#39
      '                 WHEN s.Situacao = '#39'G'#39' THEN '#39'RENEGOCIADO PARA'#39
      '                 WHEN s.Situacao = '#39'T'#39' THEN '#39'TRANSFERIDO PARA'#39
      '       END AS VARCHAR(50)) AS NomeSituacao,'
      ''
      ''
      '       CAST(CASE WHEN s.Situacao = '#39'J'#39' THEN 1'
      '                 WHEN s.Situacao = '#39'V'#39' THEN 2'
      '                 WHEN s.Situacao = '#39'D'#39' THEN 3'
      '                 WHEN s.Situacao = '#39'F'#39' THEN 4'
      '                 WHEN s.Situacao = '#39'S'#39' THEN 5'
      '                 WHEN s.Situacao = '#39'Q'#39' THEN 6'
      '                 WHEN s.Situacao = '#39'R'#39' THEN 7'
      '                 WHEN s.Situacao = '#39'C'#39' THEN 8'
      '                 WHEN s.Situacao = '#39'G'#39' THEN 9'
      '                 WHEN s.Situacao = '#39'T'#39' THEN 10'
      '       END AS INTEGER) AS OrdemSituacao,'
      ''
      ''
      
        '       CASE WHEN s.Situacao IN ('#39'D'#39',                            ' +
        '            /* Renegocia[D]o de   */'
      
        '                                '#39'F'#39')                            ' +
        '            /* Trans[F]erido de   */'
      '                 THEN s.Contrato_Origem'
      '                 '
      
        '            WHEN s.Situacao IN ('#39'G'#39',                            ' +
        '            /* Rene[G]ociado para */'
      
        '                                '#39'T'#39')                            ' +
        '            /* [T]ransferido para */'
      '                 THEN (SELECT vi.Contrato '
      '                          FROM VendasImoveis vi'
      '                          WHERE vi.Contrato_Origem = s.Contrato)'
      '            ELSE NULL'
      '       END AS DeContrato,'
      ''
      ''
      
        '       CASE WHEN s.Situacao IN ('#39'D'#39',                            ' +
        '            /* Renegocia[D]o de   */'
      
        '                                '#39'F'#39')                            ' +
        '            /* Trans[F]erido de   */'
      '            THEN s.Contrato'
      ''
      
        '            WHEN s.Situacao IN ('#39'G'#39',                            ' +
        '            /* Rene[G]ociado para */'
      
        '                                '#39'T'#39')                            ' +
        '            /* [T]ransferido para */'
      '                 THEN s.Contrato_Origem'
      '       END AS ParaContrato,'
      ''
      ''
      
        '       CASE WHEN s.Situacao IN ('#39'J'#39')                            ' +
        '              /* No [J]ur'#237'dico    */'
      '                 THEN SaldoDevedorImoveis(s.Contrato, s.Data)'
      ''
      
        '            WHEN s.Situacao IN ('#39'D'#39')                            ' +
        '              /* Renegocia[D]o de */'
      
        '                 THEN SaldoDevedorImoveis(s.Contrato, s.Data, TR' +
        'UE)'
      ''
      
        '            WHEN s.Situacao IN ('#39'S'#39',                            ' +
        '              /* Re[S]cindido     */'
      
        '                                '#39'F'#39')                            ' +
        '              /* Trans[F]erido de */'
      '                 THEN SaldoDevedorImoveis(s.Contrato, s.Data)'
      '                    '
      '            ELSE (SELECT SUM(iv.PrecoVenda)'
      '                       FROM ImoveisVendidos iv'
      '                       WHERE iv.Contrato = s.Contrato)'
      '       END AS PrecoVenda,'
      ''
      ''
      
        '       CASE WHEN s.Situacao IN ('#39'V'#39',                            ' +
        '              /* [V]endido        */'
      
        '                                '#39'F'#39')                            ' +
        '              /* Trans[F]erido de */'
      
        '            THEN ValorCurtoPrazo(CAST(EXTRACT(YEAR FROM s.Data) ' +
        'AS INTEGER),'
      
        '                                                                ' +
        '        s.Contrato, s.Data, FALSE)'
      '                                                               '
      
        '            ELSE ValorCurtoPrazo(CAST(EXTRACT(YEAR FROM CAST(:Da' +
        'taFinal AS DATE)) AS INTEGER),'
      
        '                                                                ' +
        '     s.Contrato, :DataFinal, FALSE)'
      '       END AS RecebimentosCurtoPrazo,'
      ''
      
        '       CASE WHEN s.Situacao IN ('#39'V'#39',                            ' +
        '              /* [V]endido        */'
      
        '                                '#39'F'#39')                            ' +
        '              /* Trans[F]erido de */'
      
        '            THEN ValorLongoPrazo(CAST(EXTRACT(YEAR FROM s.Data) ' +
        'AS INTEGER), s.Contrato, s.Data)'
      
        '            ELSE ValorlongoPrazo(CAST(EXTRACT(YEAR FROM CAST(:Da' +
        'taFinal AS DATE)) AS INTEGER),'
      
        '                                                                ' +
        '            s.Contrato, :DataFinal)'
      '       END AS RecebimentosLongoPrazo,'
      '          '
      ''
      
        '       CASE WHEN s.Situacao IN ('#39'S'#39')                            ' +
        '              /* Re[S]cindido     */'
      '            THEN (SELECT SUM(pi.AVPValor)'
      '                     FROM ParcelasImoveis pi'
      '                     WHERE pi.Contrato = s.Contrato AND'
      '                           pi.AVPPrazo = '#39'CURTO'#39'    AND'
      
        '                          (pi.Datapagto IS NULL OR pi.Datapagto ' +
        '>= s.DataAlteracao))'
      '                          '
      '            ELSE (SELECT SUM(pi.AVPValor)'
      '                     FROM ParcelasImoveis pi'
      '                     WHERE pi.Contrato = s.Contrato AND'
      '                           pi.AVPPrazo = '#39'CURTO'#39'     AND'
      
        '                          (pi.Datapagto IS NULL OR pi.Datapagto ' +
        '>= s.Data))'
      '       END AS AVPCurtoPrazo,'
      ''
      ''
      
        '       CASE WHEN s.Situacao IN ('#39'S'#39')                            ' +
        '             /* Re[S]cindido     */'
      '            THEN (SELECT SUM(pi.AVPValor)'
      '                     FROM ParcelasImoveis pi'
      '                     WHERE pi.Contrato = s.Contrato AND'
      '                           pi.AVPPrazo = '#39'LONGO'#39'     AND'
      
        '                          (pi.Datapagto IS NULL OR pi.Datapagto ' +
        '>= s.DataAlteracao))'
      ''
      '            ELSE (SELECT SUM(pi.AVPValor)'
      '                     FROM ParcelasImoveis pi'
      '                     WHERE pi.Contrato = s.Contrato AND'
      '                           pi.AVPPrazo = '#39'LONGO'#39'     AND'
      
        '                          (pi.Datapagto IS NULL OR pi.Datapagto ' +
        '>= s.Data))'
      '       END AS AVPLongoPrazo'
      ''
      'FROM ('
      '      SELECT vi.Contrato, vi.DataAlteracao, vi.Contrato_Origem,'
      ''
      
        '            (SituacaoContratoImoveisPeriodo(vi.Contrato, CAST(:D' +
        'ataInicial AS DATE),'
      
        '                                                         CAST(:D' +
        'ataFinal   AS DATE),'
      
        '                                                         CAST(:C' +
        'omJuridico AS BOOLEAN))).Situacao,'
      ''
      
        '            (SituacaoContratoImoveisPeriodo(vi.Contrato, CAST(:D' +
        'ataInicial AS DATE),'
      
        '                                                         CAST(:D' +
        'ataFinal   AS DATE),'
      
        '                                                         CAST(:C' +
        'omJuridico AS BOOLEAN))).Data,'
      ''
      '             co.Cliente, vf.Nome AS NomeCliente,'
      ''
      '           vi.Empreendimento,'
      '           e.Sigla,'
      '           e.Nome AS NomeEmpreendimento,'
      '           e.Sigla AS SiglaEmpreendimento,'
      '           vi.noJuridico,'
      ''
      '          (SELECT b.Descricao'
      '             FROM ImoveisVendidos iv'
      '                  JOIN Blocos b'
      '                  ON iv.Bloco = b.Codigo'
      '             WHERE iv.Contrato = vi.Contrato'
      
        '             ORDER BY iv.PrecoVenda DESC LIMIT 1) AS DescricaoBl' +
        'oco,'
      ''
      '          (SELECT tu.Nome'
      '              FROM ImoveisVendidos iv'
      '                    JOIN TiposUnidades tu'
      '                    ON iv.Unidade = tu.Codigo'
      '             WHERE iv.Contrato = vi.Contrato'
      
        '             ORDER BY iv.PrecoVenda DESC LIMIT 1) AS NomeUnidade' +
        ','
      ''
      '          (SELECT tu.sigla'
      '              FROM ImoveisVendidos iv'
      '                    JOIN TiposUnidades tu'
      '                    ON iv.Unidade = tu.Codigo'
      '             WHERE iv.Contrato = vi.Contrato'
      
        '             ORDER BY iv.PrecoVenda DESC LIMIT 1) AS SiglaUnidad' +
        'e,'
      ''
      '          (SELECT iv.Numero'
      '              FROM ImoveisVendidos iv'
      '              WHERE iv.Contrato = vi.Contrato'
      '              ORDER BY iv.precovenda DESC LIMIT 1) AS Numero,'
      ''
      '          (SELECT i.AreaPrivativa + i.AreaComum'
      '              FROM ImoveisVendidos iv'
      '                   JOIN Imoveis i'
      '                   ON iv.Bloco   = i.Bloco  AND'
      '                      iv.Numero  = i.Numero AND'
      '                      iv.Unidade = i.Unidade'
      '              WHERE iv.Contrato = vi.Contrato'
      '              ORDER BY iv.PrecoVenda DESC LIMIT 1) AS AreaTotal'
      ''
      '     FROM VendasImoveis vi'
      '          JOIN Empreendimentos e ON vi.Empreendimento = e.Codigo'
      ''
      '          JOIN Compradores co'
      '               JOIN vFornecedores vf'
      '               ON vf.Codigo = co.Cliente AND'
      '                  vf.Tipo   = co.TipoCliente'
      ''
      '          ON co.Contrato = vi.Contrato AND'
      '             COALESCE(co.Principal, FALSE)'
      ''
      ''
      
        '      WHERE (((/* vi.Situacao  <> '#39'S'#39' AND */ vi.Data          BE' +
        'TWEEN :DataInicial AND :DataFinal) OR'
      '              (vi.Situacao IN ('#39'S'#39','
      '                               '#39'T'#39','
      
        '                               '#39'F'#39') AND vi.DataAlteracao BETWEEN' +
        ' :DataInicial AND :DataFinal)) OR'
      ''
      '              (:ComJuridico AND vi.NoJuridico))'
      ''
      ''
      '           %WHEREClientes'
      '           %WHEREEmpreendimentos'
      ''
      ''
      '    ) AS s'
      ''
      'WHERE TRUE'
      ''
      '      %ListaSituacao'
      ''
      '      %Ordenacao'
      ''
      '')
    RequestLive = False
    Left = 72
    Top = 88
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'datafinal'
        ParamType = ptUnknown
        Value = #39'2017-01-01'#39
      end
      item
        DataType = ftDateTime
        Name = 'datainicial'
        ParamType = ptUnknown
        Value = #39'2017-01-01'#39
      end
      item
        DataType = ftBoolean
        Name = 'ComJuridico'
        ParamType = ptUnknown
        Value = True
      end>
    object qryRelatorioContratosSituacaoContrato: TIntegerField
      FieldName = 'Contrato'
      DisplayFormat = '0'
    end
    object qryRelatorioContratosSituacaoData: TDateField
      Alignment = taCenter
      FieldName = 'Data'
      EditMask = '99/99/9999;1; '
    end
    object qryRelatorioContratosSituacaoCliente: TIntegerField
      FieldName = 'Cliente'
      DisplayFormat = '0'
    end
    object qryRelatorioContratosSituacaoNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 50
    end
    object qryRelatorioContratosSituacaoRecebimentosCurtoPrazo: TFloatField
      FieldName = 'RecebimentosCurtoPrazo'
      DisplayFormat = '0.00'
    end
    object qryRelatorioContratosSituacaoRecebimentosLongoPrazo: TFloatField
      FieldName = 'RecebimentosLongoPrazo'
      DisplayFormat = '0.00'
    end
    object qryRelatorioContratosSituacaoAVPCurtoPrazo: TFloatField
      FieldName = 'AVPCurtoPrazo'
      DisplayFormat = '0.00'
    end
    object qryRelatorioContratosSituacaoAVPLongoPrazo: TFloatField
      FieldName = 'AVPLongoPrazo'
      DisplayFormat = '0.00'
    end
    object qryRelatorioContratosSituacaoNomeSituacao: TStringField
      FieldName = 'NomeSituacao'
      Size = 50
    end
    object qryRelatorioContratosSituacaoEmpreendimento: TIntegerField
      FieldName = 'Empreendimento'
      DisplayFormat = '0'
    end
    object qryRelatorioContratosSituacaoSigla: TStringField
      FieldName = 'Sigla'
      Size = 10
    end
    object qryRelatorioContratosSituacaoNomeEmpreendimento: TStringField
      FieldName = 'NomeEmpreendimento'
      Size = 60
    end
    object qryRelatorioContratosSituacaoPrecoVenda: TFloatField
      FieldName = 'PrecoVenda'
      DisplayFormat = '0.00'
    end
    object qryRelatorioContratosSituacaoDescricaoBloco: TStringField
      FieldName = 'DescricaoBloco'
      Size = 40
    end
    object qryRelatorioContratosSituacaoNomeUnidade: TStringField
      FieldName = 'NomeUnidade'
      Size = 15
    end
    object qryRelatorioContratosSituacaoNumero: TStringField
      FieldName = 'Numero'
      Size = 10
    end
    object qryRelatorioContratosSituacaoAreaTotal: TFloatField
      FieldName = 'AreaTotal'
      DisplayFormat = '0.00'
    end
    object qryRelatorioContratosSituacaoSiglaEmpreendimento: TStringField
      FieldName = 'SiglaEmpreendimento'
      Size = 10
    end
    object qryRelatorioContratosSituacaoSiglaUnidade: TStringField
      FieldName = 'SiglaUnidade'
      Size = 4
    end
    object qryRelatorioContratosSituacaoSituacao: TStringField
      FieldName = 'Situacao'
      Size = 1
    end
    object qryRelatorioContratosNoJuridico: TBooleanField
      FieldName = 'NoJuridico'
    end
    object qryRelatorioContratosSituacaoOrdemSituacao: TIntegerField
      FieldName = 'OrdemSituacao'
      DisplayFormat = '0'
    end
    object qryRelatorioContratosSituacaoDataAlteracao: TDateField
      Alignment = taCenter
      FieldName = 'DataAlteracao'
      EditMask = '99/99/9999;1; '
    end
    object qryRelatorioContratosSituacaoDeContrato: TIntegerField
      FieldName = 'DeContrato'
      DisplayFormat = '0'
    end
    object qryRelatorioContratosSituacaoParaContrato: TIntegerField
      FieldName = 'ParaContrato'
      DisplayFormat = '0'
    end
  end
  object dsrRelatorioContratosSituacao: TtecDataSource
    DataSet = qryRelatorioContratosSituacao
    Left = 104
    Top = 104
  end
  object frxRelatorioContratosSituacao: TfrxReport
    Version = '4.0.11'
    DataSet = frxDBRelatorioContratosSituacao_
    DataSetName = 'frxDBRelatorioContratosSituacao_'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42340.700718275500000000
    ReportOptions.LastChange = 43146.622729699100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      ' vZebrar, vZebrar2 : boolean;'
      ''
      ''
      ''
      ''
      'procedure GroupFooter3OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      'end;'
      ''
      ''
      'procedure Memo33OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure Memo33OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure Memo21OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  Memo21.visible :=  <frxDBDImoveisVendidos."nregistros"> = <Lin' +
        'e>;'
      'end;'
      ''
      'procedure Memo11OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  Memo11.visible :=  <frxDBDImoveisVendidos."nregistros"> = <Lin' +
        'e>;'
      'end;'
      ''
      'procedure Memo12OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  Memo12.visible :=  <frxDBDImoveisVendidos."nregistros"> = <Lin' +
        'e>;'
      'end;'
      ''
      'procedure Memo52OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  Memo52.visible :=  <frxDBDImoveisVendidos."nregistros"> = <Lin' +
        'e>;'
      'end;'
      ''
      'procedure Memo54OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  Memo54.visible :=  <frxDBDImoveisVendidos."nregistros"> = <Lin' +
        'e>;'
      'end;'
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if vZebrar then'
      '  begin'
      '    if <CordoZebrado> <> null then'
      '      mmoZebrado.color := <CordoZebrado>;'
      '    vZebrar := false;'
      '    vZebrar2 := true;'
      '  end'
      '  else'
      '  begin'
      '    mmoZebrado.color := clwhite;'
      '    vZebrar := true;'
      '  end;'
      ''
      'end;'
      ''
      'procedure MasterData2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if vZebrar2 then'
      '  begin'
      '    if <CordoZebrado> <> null then'
      '      mmoZebrado2.color := <CordoZebrado>;'
      '    vZebrar2 := false;'
      '  end'
      '  else'
      '  begin'
      '    mmoZebrado2.color := clwhite;'
      '    vZebrar2 := true;'
      '  end;'
      ''
      'end;'
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  GroupHeaderNomeEmpreendimento.visible := <Ordenacao> = 0;'
      
        '  GroupFooterEmpreendimento.visible := GroupHeaderNomeEmpreendim' +
        'ento.visible;'
      'end;'
      ''
      'procedure MemoContratoOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  MemoContrato.visible := pos(<frxDBRelatorioContratosSituacao."' +
        'situacao">,'#39'DFGT'#39')=0;'
      'end;'
      ''
      'procedure MemoContratoDFGTOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  MemoContratoDFGT.visible := pos(<frxDBRelatorioContratosSituac' +
        'ao."situacao">,'#39'DFGT'#39')<>0;'
      
        '  MemoContratoDe.visible := pos(<frxDBRelatorioContratosSituacao' +
        '."situacao">,'#39'DFGT'#39')<>0;'
      
        '  MemoContratoPara.visible := pos(<frxDBRelatorioContratosSituac' +
        'ao."situacao">,'#39'DFGT'#39')<>0;'
      'end;'
      ''
      'procedure MemoDadoContratoOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  MemoDadoContrato.visible := pos(<frxDBRelatorioContratosSituac' +
        'ao."situacao">,'#39'DFGT'#39')=0;'
      'end;'
      ''
      
        'procedure MemoDadoContratoDeOnBeforePrint(Sender: TfrxComponent)' +
        ';'
      'begin'
      
        '  MemoDadoContratoDe.visible := pos(<frxDBRelatorioContratosSitu' +
        'acao."situacao">,'#39'DFGT'#39')<>0;'
      
        '  MemoDadoContratoPara.visible := pos(<frxDBRelatorioContratosSi' +
        'tuacao."situacao">,'#39'DFGT'#39')<>0;'
      ''
      'end;'
      ''
      
        'procedure MemoDadoContratoParaOnBeforePrint(Sender: TfrxComponen' +
        't);'
      'begin'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxRelatorioContratosSituacaoGetValue
    Left = 256
    Top = 80
    Datasets = <
      item
        DataSet = frxDBDImoveisVendidos
        DataSetName = 'frxDBDImoveisVendidos'
      end
      item
        DataSet = frxDBRelatorioContratosSituacao
        DataSetName = 'frxDBRelatorioContratosSituacao'
      end>
    Variables = <
      item
        Name = ' Relatorio'
        Value = Null
      end
      item
        Name = 'ENDERECO_BAIRRO'
        Value = Null
      end
      item
        Name = 'RAZAOFILIALBASE'
        Value = Null
      end
      item
        Name = 'CEP_CIDADE_UF'
        Value = Null
      end
      item
        Name = 'TITULO'
        Value = #39'PLANILHA PARA REVERS'#195'O AVP ENTRE'#39
      end
      item
        Name = 'SUBTITULO'
        Value = Null
      end
      item
        Name = 'OUTRAS'
        Value = #39'FILIAIS: 1,2,3,4,5,6,7,8,9,10 '#39
      end
      item
        Name = 'DATA'
        Value = Null
      end
      item
        Name = 'CordoZebrado'
        Value = Null
      end
      item
        Name = 'AgruparGrupoFilial'
        Value = 'False'
      end
      item
        Name = 'AgruparFilial'
        Value = 'False'
      end
      item
        Name = 'AgruparFornecedor'
        Value = Null
      end
      item
        Name = 'AgruparLocalizacao'
        Value = Null
      end
      item
        Name = 'AgruparClasseProduto'
        Value = Null
      end
      item
        Name = 'AgruparGrupoProduto'
        Value = Null
      end
      item
        Name = 'DATASITUACAO'
        Value = #39'30/04/2015'#39
      end
      item
        Name = 'QuebrarPaginaporCliente'
        Value = 'False'
      end
      item
        Name = 'Ordenacao'
        Value = Null
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
      PaperSize = 200
      LeftMargin = 0.500000000000000000
      RightMargin = 0.500000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      OnBeforePrint = 'Page1OnBeforePrint'
      object PageHeader1: TfrxPageHeader
        Height = 86.929190000000000000
        Top = 18.897650000000000000
        Width = 1118.740880000000000000
        object Memo6: TfrxMemoView
          Left = 1031.811690000000000000
          Top = 18.897650000000000000
          Width = 52.913420000000000000
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
            '[Page]/[TotalPages#]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo4: TfrxMemoView
          Left = 997.795920000000000000
          Top = 18.897650000000000000
          Width = 34.015770000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'P'#195#129'G.:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 997.795920000000000000
          Top = 3.779530000000000000
          Width = 34.015770000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'DATA:')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 1031.811690000000000000
          Top = 3.779530000000000000
          Width = 52.913420000000000000
          Height = 11.338582680000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Date]')
          ParentFont = False
          VAlign = vaCenter
        end
        object mmoTitulo: TfrxMemoView
          ShiftMode = smDontShift
          Left = 472.441250000000000000
          Top = 3.779530000000000000
          Width = 480.000310000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
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
        object fmvRua: TfrxMemoView
          Left = 143.622140000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[RAZAOFILIALBASE]')
          ParentFont = False
        end
        object fmvBairro: TfrxMemoView
          Left = 143.622140000000000000
          Top = 15.118120000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[ENDERECO_BAIRRO]')
          ParentFont = False
        end
        object fmvCidade: TfrxMemoView
          Left = 143.622140000000000000
          Top = 26.456710000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[CEP_CIDADE_UF]')
          ParentFont = False
        end
        object fpvLogo: TfrxPictureView
          Left = 18.897650000000000000
          Top = 7.559060000000000000
          Width = 120.944960000000000000
          Height = 37.795300000000000000
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
        object MemoContrato: TfrxMemoView
          ShiftMode = smDontShift
          Left = 18.897650000000000000
          Top = 56.692950000000000000
          Width = 90.708720000000000000
          Height = 26.456700240000000000
          OnBeforePrint = 'MemoContratoOnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'CONTRATO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          ShiftMode = smDontShift
          Left = 415.748300000000000000
          Top = 56.692950000000000000
          Width = 90.708720000000000000
          Height = 26.456700240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'BLOCO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          ShiftMode = smDontShift
          Left = 506.457020000000000000
          Top = 56.692950000000000000
          Width = 71.811070000000000000
          Height = 26.456700240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'UNIDADE e N'#194#186)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 472.441250000000000000
          Top = 37.795300000000000000
          Width = 480.000310000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUBTITULO]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          ShiftMode = smDontShift
          Left = 578.268090000000000000
          Top = 56.692950000000000000
          Width = 49.133841180000000000
          Height = 26.456700240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #195#129'REA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          ShiftMode = smDontShift
          Left = 699.213050000000000000
          Top = 56.692950000000000000
          Width = 83.149611180000000000
          Height = 26.456700240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[IIF(<Saldo_ou_Total><>'#39#39',<Saldo_ou_Total>,'#39#39')]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          ShiftMode = smDontShift
          Left = 782.362710000000000000
          Top = 71.811070000000000000
          Width = 75.590551180000000000
          Height = 11.338580240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clWhite
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<frxDBRelatorioContratosSituacao."nomesituacao">='#39'RESCINDIDO'#39
          Memo.UTF8 = (
            'CURTO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          ShiftMode = smDontShift
          Left = 857.953310000000000000
          Top = 71.811070000000000000
          Width = 75.590551180000000000
          Height = 11.338580240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clWhite
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<frxDBRelatorioContratosSituacao."nomesituacao">='#39'RESCINDIDO'#39
          Memo.UTF8 = (
            'LONGO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          ShiftMode = smDontShift
          Left = 109.606370000000000000
          Top = 56.692950000000000000
          Width = 56.692950000000000000
          Height = 26.456700240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'DATA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          ShiftMode = smDontShift
          Left = 933.543910000000000000
          Top = 71.811070000000000000
          Width = 75.590551180000000000
          Height = 11.338580240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clWhite
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<frxDBRelatorioContratosSituacao."nomesituacao">='#39'NO JUR'#205'DICO'#39
          Memo.UTF8 = (
            'CURTO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          ShiftMode = smDontShift
          Left = 1009.134510000000000000
          Top = 71.811070000000000000
          Width = 75.590551180000000000
          Height = 11.338580240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clWhite
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<frxDBRelatorioContratosSituacao."nomesituacao">='#39'NO JUR'#205'DICO'#39
          Memo.UTF8 = (
            'LONGO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          ShiftMode = smDontShift
          Left = 166.299320000000000000
          Top = 56.692950000000000000
          Width = 45.354360000000000000
          Height = 26.456700240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'CLIENTE')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo60: TfrxMemoView
          ShiftMode = smDontShift
          Left = 211.653680000000000000
          Top = 56.692950000000000000
          Width = 204.094620000000000000
          Height = 26.456700240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'NOME')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          ShiftMode = smDontShift
          Left = 627.401980000000000000
          Top = 56.692950000000000000
          Width = 71.811021180000000000
          Height = 26.456700240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[IIF(<ListaOpcao>=0,'#39'PRE'#195#8225'O VENDA'#39','#39#39')]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          ShiftMode = smDontShift
          Left = 782.362710000000000000
          Top = 56.692950000000000000
          Width = 151.181151180000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clWhite
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<frxDBRelatorioContratosSituacao."nomesituacao">='#39'RESCINDIDO'#39
          Memo.UTF8 = (
            'PRAZOS RECEBIMENTOS ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          ShiftMode = smDontShift
          Left = 933.543910000000000000
          Top = 56.692950000000000000
          Width = 151.181151180000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clWhite
          Highlight.Font.Height = -15
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<frxDBRelatorioContratosSituacao."nomesituacao">='#39'NO JUR'#205'DICO'#39
          Memo.UTF8 = (
            
              '[IIF(<frxDBRelatorioContratosSituacao."nomesituacao">='#39'RESCINDID' +
              'O'#39','#39'REVERS'#195#402'O VALORES AVP'#39','#39'AVP AJUSTE VALOR PRESENTE'#39')]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoContratoDFGT: TfrxMemoView
          ShiftMode = smDontShift
          Left = 18.897650000000000000
          Top = 56.692950000000000000
          Width = 90.708720000000000000
          Height = 11.338580240000000000
          OnBeforePrint = 'MemoContratoDFGTOnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clWhite
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = 'Pos(<frxDBRelatorioContratosSituacao."situacao">,'#39'DFGT'#39')=0'
          Memo.UTF8 = (
            'CONTRATO')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoContratoDe: TfrxMemoView
          ShiftMode = smDontShift
          Left = 18.897650000000000000
          Top = 68.031540000000000000
          Width = 45.354360000000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clWhite
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = 'Pos(<frxDBRelatorioContratosSituacao."situacao">,'#39'DFGT'#39')=0'
          Memo.UTF8 = (
            'DE')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoContratoPara: TfrxMemoView
          ShiftMode = smDontShift
          Left = 64.252010000000000000
          Top = 68.031540000000000000
          Width = 45.354360000000000000
          Height = 15.118110240000000000
          OnBeforePrint = 'MemoContratoDFGTOnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clWhite
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = 'Pos(<frxDBRelatorioContratosSituacao."situacao">,'#39'DFGT'#39')=0'
          Memo.UTF8 = (
            'PARA')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeaderSituacao: TfrxGroupHeader
        Height = 22.677180000000000000
        Top = 166.299320000000000000
        Width = 1118.740880000000000000
        Condition = '<frxDBRelatorioContratosSituacao."nomesituacao">'
        ReprintOnNewPage = True
        StartNewPage = True
        object Memo16: TfrxMemoView
          Left = 18.897650000000000000
          Width = 691.653990000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataSet = dtmRelatorioEstoque.frxDBEstoque
          DataSetName = 'frxDBEstoque'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            '[frxDBRelatorioContratosSituacao."nomesituacao"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 13.228346460000000000
        ParentFont = False
        Top = 257.008040000000000000
        Width = 1118.740880000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = frxDBRelatorioContratosSituacao
        DataSetName = 'frxDBRelatorioContratosSituacao'
        RowCount = 0
        object mmoZebrado: TfrxMemoView
          Left = 18.897650000000000000
          Width = 706.772110000000000000
          Height = 13.228346460000000000
          Color = clBtnFace
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HideZeros = True
          ParentFont = False
          Style = 'Style1'
        end
        object MemoDadoContrato: TfrxMemoView
          Left = 18.897650000000000000
          Width = 90.708720000000000000
          Height = 13.228346460000000000
          OnBeforePrint = 'MemoDadoContratoOnBeforePrint'
          DataSet = frxDBRelatorioContratosSituacao
          DataSetName = 'frxDBRelatorioContratosSituacao'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBRelatorioContratosSituacao."contrato"]')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 109.606370000000000000
          Width = 56.692950000000000000
          Height = 13.228346460000000000
          DataSet = frxDBRelatorioContratosSituacao
          DataSetName = 'frxDBRelatorioContratosSituacao'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'DD/MM/YY'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBRelatorioContratosSituacao."data"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 211.653680000000000000
          Width = 204.094620000000000000
          Height = 13.228346460000000000
          DataSet = frxDBRelatorioContratosSituacao
          DataSetName = 'frxDBRelatorioContratosSituacao'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBRelatorioContratosSituacao."nomecliente"]')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Left = 166.299320000000000000
          Width = 45.354360000000000000
          Height = 13.228346460000000000
          DataSet = frxDBRelatorioContratosSituacao
          DataSetName = 'frxDBRelatorioContratosSituacao'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBRelatorioContratosSituacao."cliente"]')
          ParentFont = False
        end
        object Subreport1: TfrxSubreport
          Left = 419.527830000000000000
          Width = 321.260050000000000000
          Height = 11.338590000000000000
          Page = frxRelatorioContratosSituacao.Page2
        end
        object MemoDadoContratoDe: TfrxMemoView
          Left = 18.897650000000000000
          Width = 45.354360000000000000
          Height = 13.228346460000000000
          OnBeforePrint = 'MemoDadoContratoDeOnBeforePrint'
          DataSet = frxDBRelatorioContratosSituacao
          DataSetName = 'frxDBRelatorioContratosSituacao'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBRelatorioContratosSituacao."DeContrato"]')
          ParentFont = False
        end
        object MemoDadoContratoPara: TfrxMemoView
          Left = 64.252010000000000000
          Width = 45.354360000000000000
          Height = 13.228346460000000000
          OnBeforePrint = 'MemoDadoContratoParaOnBeforePrint'
          DataSet = frxDBRelatorioContratosSituacao
          DataSetName = 'frxDBRelatorioContratosSituacao'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBRelatorioContratosSituacao."ParaContrato"]')
          ParentFont = False
        end
      end
      object GroupFooterSituacao: TfrxGroupFooter
        Height = 17.007874020000000000
        Top = 343.937230000000000000
        Width = 1118.740880000000000000
        object Memo46: TfrxMemoView
          Left = 30.236240000000000000
          Width = 574.488560000000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'Totais [frxDBRelatorioContratosSituacao."nomesituacao"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 1009.134461180000000000
          Width = 75.590600000000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clWhite
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<frxDBRelatorioContratosSituacao."nomesituacao">='#39'NO JUR'#205'DICO'#39
          Memo.UTF8 = (
            
              '[SUM(<frxDBRelatorioContratosSituacao."avplongoprazo">,MasterDat' +
              'a1)]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 933.543861180000000000
          Width = 75.590600000000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clWhite
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<frxDBRelatorioContratosSituacao."nomesituacao">='#39'NO JUR'#205'DICO'#39
          Memo.UTF8 = (
            
              '[SUM(<frxDBRelatorioContratosSituacao."avpcurtoprazo">,MasterDat' +
              'a1)]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 699.213001180000000000
          Width = 83.149660000000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[SUM(<frxDBRelatorioContratosSituacao."precovenda">,MasterData1)' +
              ']')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 782.362661180000000000
          Width = 75.590600000000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clWhite
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<frxDBRelatorioContratosSituacao."nomesituacao">='#39'RESCINDIDO'#39
          Memo.UTF8 = (
            
              '[SUM(<frxDBRelatorioContratosSituacao."recebimentoscurtoprazo">,' +
              'MasterData1)]')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Left = 857.953261180000000000
          Width = 75.590600000000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clWhite
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<frxDBRelatorioContratosSituacao."nomesituacao">='#39'RESCINDIDO'#39
          Memo.UTF8 = (
            
              '[SUM(<frxDBRelatorioContratosSituacao."recebimentoslongoprazo">,' +
              'MasterData1)]')
          ParentFont = False
        end
      end
      object GroupHeaderNomeEmpreendimento: TfrxGroupHeader
        Height = 22.677180000000000000
        Top = 211.653680000000000000
        Width = 1118.740880000000000000
        Condition = '<frxDBRelatorioContratosSituacao."nomeempreendimento">'
        ReprintOnNewPage = True
        object Memo25: TfrxMemoView
          Left = 18.897650000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = frxDBRelatorioContratosSituacao
          DataSetName = 'frxDBRelatorioContratosSituacao'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBRelatorioContratosSituacao."siglaempreendimento"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 102.047310000000000000
          Width = 782.362710000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataSet = frxDBRelatorioContratosSituacao
          DataSetName = 'frxDBRelatorioContratosSituacao'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            '[frxDBRelatorioContratosSituacao."nomeempreendimento"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooterEmpreendimento: TfrxGroupFooter
        Height = 24.566934020000000000
        Top = 294.803340000000000000
        Width = 1118.740880000000000000
        object Memo27: TfrxMemoView
          Left = 30.236240000000000000
          Top = 3.779530000000000000
          Width = 574.488560000000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'Totais [frxDBRelatorioContratosSituacao."nomeempreendimento"]')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 699.213001180000000000
          Top = 3.779530000000000000
          Width = 83.149660000000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[SUM(<frxDBRelatorioContratosSituacao."precovenda">,MasterData1)' +
              ']')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 933.543861180000000000
          Top = 3.779530000000000000
          Width = 75.590600000000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clWhite
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<frxDBRelatorioContratosSituacao."nomesituacao">='#39'NO JUR'#205'DICO'#39
          Memo.UTF8 = (
            
              '[SUM(<frxDBRelatorioContratosSituacao."avpcurtoprazo">,MasterDat' +
              'a1)]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 1009.134461180000000000
          Top = 3.779530000000000000
          Width = 75.590600000000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clWhite
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<frxDBRelatorioContratosSituacao."nomesituacao">='#39'NO JUR'#205'DICO'#39
          Memo.UTF8 = (
            
              '[SUM(<frxDBRelatorioContratosSituacao."avplongoprazo">,MasterDat' +
              'a1)]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 782.362661180000000000
          Top = 3.779530000000000000
          Width = 75.590600000000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clWhite
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<frxDBRelatorioContratosSituacao."nomesituacao">='#39'RESCINDIDO'#39
          Memo.UTF8 = (
            
              '[SUM(<frxDBRelatorioContratosSituacao."recebimentoscurtoprazo">,' +
              'MasterData1)]')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 857.953261180000000000
          Top = 3.779530000000000000
          Width = 75.590600000000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clWhite
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<frxDBRelatorioContratosSituacao."nomesituacao">='#39'RESCINDIDO'#39
          Memo.UTF8 = (
            
              '[SUM(<frxDBRelatorioContratosSituacao."recebimentoslongoprazo">,' +
              'MasterData1)]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        Height = 20.787404020000000000
        Top = 385.512060000000000000
        Width = 1118.740880000000000000
        object Memo35: TfrxMemoView
          Left = 30.236240000000000000
          Width = 574.488560000000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'Total Geral')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 1009.134461180000000000
          Width = 75.590600000000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clWhite
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<frxDBRelatorioContratosSituacao."nomesituacao">='#39'NO JUR'#205'DICO'#39
          Memo.UTF8 = (
            
              '[SUM(<frxDBRelatorioContratosSituacao."avplongoprazo">,MasterDat' +
              'a1)]')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 933.543861180000000000
          Width = 75.590600000000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clWhite
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<frxDBRelatorioContratosSituacao."nomesituacao">='#39'NO JUR'#205'DICO'#39
          Memo.UTF8 = (
            
              '[SUM(<frxDBRelatorioContratosSituacao."avpcurtoprazo">,MasterDat' +
              'a1)]')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 699.213001180000000000
          Width = 83.149660000000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[SUM(<frxDBRelatorioContratosSituacao."precovenda">,MasterData1)' +
              ']')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 782.362661180000000000
          Width = 75.590600000000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clWhite
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<frxDBRelatorioContratosSituacao."nomesituacao">='#39'RESCINDIDO'#39
          Memo.UTF8 = (
            
              '[SUM(<frxDBRelatorioContratosSituacao."recebimentoscurtoprazo">,' +
              'MasterData1)]')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Left = 857.953261180000000000
          Width = 75.590600000000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clWhite
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<frxDBRelatorioContratosSituacao."nomesituacao">='#39'RESCINDIDO'#39
          Memo.UTF8 = (
            
              '[SUM(<frxDBRelatorioContratosSituacao."recebimentoslongoprazo">,' +
              'MasterData1)]')
          ParentFont = False
        end
      end
    end
    object Page2: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 200
      LeftMargin = 0.500000000000000000
      RightMargin = 0.500000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData2: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 13.228346460000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 1118.740880000000000000
        OnBeforePrint = 'MasterData2OnBeforePrint'
        DataSet = frxDBDImoveisVendidos
        DataSetName = 'frxDBDImoveisVendidos'
        RowCount = 0
        object mmoZebrado2: TfrxMemoView
          Width = 665.197280000000000000
          Height = 13.228346460000000000
          Color = clBtnFace
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HideZeros = True
          ParentFont = False
          Style = 'Style1'
        end
        object Memo19: TfrxMemoView
          Width = 86.929190000000000000
          Height = 13.228346460000000000
          DataSet = frxDBDImoveisVendidos
          DataSetName = 'frxDBDImoveisVendidos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDImoveisVendidos."descricaobloco"]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 86.929190000000000000
          Width = 71.811070000000000000
          Height = 13.228346460000000000
          DataSet = frxDBDImoveisVendidos
          DataSetName = 'frxDBDImoveisVendidos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              '[frxDBRelatorioContratosSituacao."siglaunidade"] [frxDBDImoveisV' +
              'endidos."numero"]')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 162.519790000000000000
          Width = 45.354360000000000000
          Height = 13.228346460000000000
          DataSet = frxDBDImoveisVendidos
          DataSetName = 'frxDBDImoveisVendidos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDImoveisVendidos."areatotal"]')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 211.653680000000000000
          Width = 68.031540000000000000
          Height = 13.228346460000000000
          DataSet = frxDBDImoveisVendidos
          DataSetName = 'frxDBDImoveisVendidos'
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
            
              '[IIF(<ListaOpcao>=0,FormatFloat('#39'###,###,##0.00'#39',<frxDBDImoveisV' +
              'endidos."precovenda">),'#39#39')]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 290.267701890000000000
          Width = 71.811070000000000000
          Height = 13.228346460000000000
          OnBeforePrint = 'Memo21OnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBRelatorioContratosSituacao."precovenda"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 513.259822990000000000
          Width = 75.590600000000000000
          Height = 13.228346460000000000
          OnBeforePrint = 'Memo11OnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBRelatorioContratosSituacao."avpcurtoprazo"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 589.606680000000000000
          Width = 75.590600000000000000
          Height = 13.228346460000000000
          OnBeforePrint = 'Memo12OnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBRelatorioContratosSituacao."avplongoprazo"]')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 362.078622990000000000
          Width = 75.590600000000000000
          Height = 13.228346460000000000
          OnBeforePrint = 'Memo52OnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBRelatorioContratosSituacao."recebimentoscurtoprazo"]')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 438.425480000000000000
          Width = 71.811070000000000000
          Height = 13.228346460000000000
          OnBeforePrint = 'Memo54OnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBRelatorioContratosSituacao."recebimentoslongoprazo"]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBRelatorioContratosSituacao_: TfrxDBDataset
    UserName = 'frxDBRelatorioContratosSituacao_'
    CloseDataSource = False
    FieldAliases.Strings = (
      'Contrato=contrato'
      'Data=data'
      'Cliente=cliente'
      'NomeCliente=nomecliente'
      'RecebimentosCurtoPrazo=recebimentoscurtoprazo'
      'RecebimentosLongoPrazo=recebimentoslongoprazo'
      'AVPCurtoPrazo=avpcurtoprazo'
      'AVPLongoPrazo=avplongoprazo'
      'NomeSituacao=nomesituacao'
      'Empreendimento=empreendimento'
      'Sigla=sigla'
      'NomeEmpreendimento=nomeempreendimento'
      'PrecoVenda=precovenda'
      'DescricaoBloco=descricaobloco'
      'NomeUnidade=nomeunidade'
      'Numero=numero'
      'AreaTotal=areatotal'
      'SiglaEmpreendimento=siglaempreendimento'
      'SiglaUnidade=siglaunidade'
      'Situacao=situacao'
      'NoJuridico=nojuridico'
      'OrdemSituacao=ordemsituacao'
      'DataAlteracao=DataAlteracao'
      'DeContrato=DeContrato'
      'ParaContrato=ParaContrato')
    DataSet = qryRelatorioContratosSituacao
    Left = 432
    Top = 144
  end
  object frxDBRelatorioContratosSituacao: TfrxDBDataset
    UserName = 'frxDBRelatorioContratosSituacao'
    CloseDataSource = False
    FieldAliases.Strings = (
      'Contrato=contrato'
      'Data=data'
      'Cliente=cliente'
      'NomeCliente=nomecliente'
      'RecebimentosCurtoPrazo=recebimentoscurtoprazo'
      'RecebimentosLongoPrazo=recebimentoslongoprazo'
      'AVPCurtoPrazo=avpcurtoprazo'
      'AVPLongoPrazo=avplongoprazo'
      'NomeSituacao=nomesituacao'
      'Empreendimento=empreendimento'
      'Sigla=sigla'
      'NomeEmpreendimento=nomeempreendimento'
      'PrecoVenda=precovenda'
      'DescricaoBloco=descricaobloco'
      'NomeUnidade=nomeunidade'
      'Numero=numero'
      'AreaTotal=areatotal'
      'SiglaEmpreendimento=siglaempreendimento'
      'SiglaUnidade=siglaunidade'
      'Situacao=situacao'
      'NoJuridico=nojuridico'
      'OrdemSituacao=ordemsituacao'
      'DataAlteracao=DataAlteracao'
      'DeContrato=DeContrato'
      'ParaContrato=ParaContrato')
    DataSet = qryRelatorioContratosSituacao
    Left = 432
    Top = 88
  end
  object qryImoveisVendidos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 'contrato=contrato;situacao=situacao'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrRelatorioContratosSituacao
    Constraints = <>
    BeforeOpen = qryImoveisVendidosBeforeOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'WhereClientes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WhereEmpreendimentos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Ordenacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CondicaoOpcaoListar'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaSituacao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';'
      '/*'
      ':DataSituacaoEm'
      ':exercicio'
      '*/'
      ''
      'SELECT s.*'
      'FROM ('
      '      SELECT iv.*,'
      '             b.Descricao AS DescricaoBloco,'
      '             tu.Nome     AS NomeUnidade,'
      '             i.AreaPrivativa + i.AreaComum AS AreaTotal,'
      ''
      '             CASE WHEN :ListaOpcao = 0'
      '                  THEN(SELECT COUNT(*)'
      '                          FROM ImoveisVendidos iv2'
      '                          WHERE iv2.Contrato = iv.Contrato)'
      '                  ELSE 1'
      '             END AS NRegistros,'
      '       '
      
        '            (SituacaoContratoImoveisPeriodo(vi.Contrato, :DataIn' +
        'icial, :DataFinal, :ComJuridico)).Situacao'
      ''
      '         FROM VendasImoveis vi'
      
        '              JOIN Empreendimentos em ON vi.Empreendimento = em.' +
        'Codigo'
      '              JOIN Compradores co'
      
        '                   JOIN vFornecedores vf ON vf.Codigo = co.Clien' +
        'te AND'
      
        '                                            vf.Tipo   = co.TipoC' +
        'liente'
      '              ON co.Contrato = vi.Contrato AND'
      '                 COALESCE(co.Principal, FALSE)'
      ''
      '              JOIN ImoveisVendidos iv'
      
        '                   JOIN Blocos b         ON iv.Bloco   = b.Codig' +
        'o'
      
        '                   JOIN TiposUnidades tu ON iv.Unidade = tu.Codi' +
        'go'
      
        '                   JOIN Imoveis i        ON iv.Bloco   = i.Bloco' +
        '  AND'
      
        '                                            iv.Numero  = i.Numer' +
        'o AND'
      
        '                                            iv.Unidade = i.Unida' +
        'de'
      '              ON vi.Contrato = iv.Contrato'
      ''
      ''
      '         WHERE ('
      '                ('
      
        '                 (vi.Situacao <> '#39'S'#39' AND vi.Data          BETWEE' +
        'N :DataInicial AND :DataFinal) OR'
      
        '                 (vi.Situacao =  '#39'S'#39' AND vi.DataAlteracao BETWEE' +
        'N :DataInicial AND :DataFinal)'
      '                ) OR'
      ''
      '                (:ComJuridico AND vi.NoJuridico)'
      '               )'
      ''
      ''
      '               %WHEREClientes'
      '               %WHEREEmpreendimentos'
      '            /* %Ordenacao */'
      '               %CondicaoOpcaoListar'
      ''
      
        '         ORDER BY iv.Contrato, iv.precoVenda DESC, iv.Bloco, iv.' +
        'Numero, iv.Unidade'
      '     ) AS s'
      'WHERE TRUE'
      '%ListaSituacao'
      '')
    RequestLive = False
    Left = 80
    Top = 160
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DataSituacaoEm'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'exercicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'listaOpcao'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'datafinal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ComJuridico'
        ParamType = ptUnknown
      end>
    object qryImoveisVendidosContrato: TIntegerField
      FieldName = 'Contrato'
      DisplayFormat = '0'
    end
    object qryImoveisVendidosBloco: TIntegerField
      DisplayLabel = 'Bloco'
      FieldName = 'bloco'
      DisplayFormat = '0'
    end
    object qryImoveisVendidosNumero: TStringField
      FieldName = 'Numero'
      Size = 10
    end
    object qryImoveisVendidosObservacoes: TStringField
      FieldName = 'Observacoes'
      Size = 200
    end
    object qryImoveisVendidosPrecoVenda: TFloatField
      FieldName = 'PrecoVenda'
      DisplayFormat = '0.00'
    end
    object qryImoveisVendidosUnidade: TIntegerField
      FieldName = 'Unidade'
      DisplayFormat = '0'
    end
    object qryImoveisVendidosOrdem: TIntegerField
      FieldName = 'Ordem'
      DisplayFormat = '0'
    end
    object qryImoveisVendidosDescricaoBloco: TStringField
      FieldName = 'DescricaoBloco'
      Size = 40
    end
    object qryImoveisVendidosNomeUnidade: TStringField
      FieldName = 'NomeUnidade'
      Size = 15
    end
    object qryImoveisVendidosAreaTotal: TFloatField
      FieldName = 'AreaTotal'
      DisplayFormat = '0.00'
    end
    object qryImoveisVendidosNRegistros: TLargeintField
      FieldName = 'NRegistros'
    end
    object qryImoveisVendidossituacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
  end
  object frxDBDImoveisVendidos: TfrxDBDataset
    UserName = 'frxDBDImoveisVendidos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'contrato=contrato'
      'bloco=bloco'
      'numero=numero'
      'observacoes=observacoes'
      'precovenda=precovenda'
      'unidade=unidade'
      'ordem=ordem'
      'descricaobloco=descricaobloco'
      'nomeunidade=nomeunidade'
      'areatotal=areatotal'
      'nregistros=nregistros')
    DataSet = qryImoveisVendidos
    Left = 328
    Top = 184
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
    Left = 688
    Top = 320
  end
  object frxMailExport1: TfrxMailExport
    UseFileCache = True
    ShowProgress = True
    ShowExportDialog = True
    SmtpPort = 25
    UseIniFile = True
    Left = 680
    Top = 224
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
    Left = 600
    Top = 136
  end
  object frxODSExport1: TfrxODSExport
    UseFileCache = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 680
    Top = 168
  end
  object frxODTExport1: TfrxODTExport
    UseFileCache = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 600
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
    Left = 600
    Top = 240
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    ShowProgress = True
    FixedWidth = True
    Background = False
    Centered = False
    EmptyLines = True
    Left = 680
    Top = 40
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    Left = 688
    Top = 272
  end
  object frxBMPExport1: TfrxBMPExport
    UseFileCache = True
    ShowProgress = True
    Left = 680
    Top = 120
  end
  object frxTIFFExport1: TfrxTIFFExport
    UseFileCache = True
    ShowProgress = True
    Left = 600
    Top = 192
  end
  object frxGIFExport1: TfrxGIFExport
    UseFileCache = True
    ShowProgress = True
    Left = 584
    Top = 80
  end
  object frxSimpleTextExport1: TfrxSimpleTextExport
    UseFileCache = True
    ShowProgress = True
    Frames = False
    EmptyLines = False
    OEMCodepage = False
    Left = 592
    Top = 32
  end
  object frxCSVExport1: TfrxCSVExport
    UseFileCache = True
    ShowProgress = True
    Separator = ';'
    OEMCodepage = False
    Left = 680
    Top = 72
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    ShowProgress = True
    Left = 640
    Top = 392
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 688
    Top = 376
  end
end
