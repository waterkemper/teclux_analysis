inherited dtmAnaliseEconomicaCompras: TdtmAnaliseEconomicaCompras
  OldCreateOrder = False
  Left = 493
  Top = 202
  Height = 574
  Width = 771
  object qryAnaliseCompras: TtecQuery
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
        Name = 'ListadeFiliais'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListadeFornecedores'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaGruposFornecedores'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListadeItemProdutos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListadeProdutos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListadeGrupos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListadeClasses'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListadeMarcas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaCondicionalPromocoes'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';'
      ''
      'select s.*,'
      
        '       (vUni_MediaPrecoProduto * MProd_QuantidadeProdutos) as Va' +
        'lor_PrecoProduto'
      'from'
      '('#9
      ''
      ''
      
        'select s.filial, s.nomefilial, s.AnoMes, s.produtovisual, s.desc' +
        'ricaoproduto, s.grupo, s.descricaogrupo,'
      ''
      '       (select sum(pnp.qtdeestoque)'
      '        from notaspag np'
      '             join produtosnotaspag pnp'
      '             on np.codigo = pnp.codigonota'
      '        where pnp.produto = s.produto'
      '          and np.emissao between :DataInicial and :DataFinal'
      '           and np.situacao = '#39'N'#39
      '           and ehnotafiscalentradacompra(pnp.codigofiscal)'
      
        '           )/(abs((select extract(year from age(:DataInicial,:Da' +
        'taFinal))*12 + extract(month from age(:DataInicial,:DataFinal)))' +
        ')+1) as MProd_QuantidadeProdutos,'
      ''
      
        '       sum(s.quantidade*s.precocusto)/sum(s.quantidade) as vUni_' +
        'MediaPrecoProduto,'
      ''
      '       ('
      '       ('
      ''
      '        (sum(s.quantidade*s.precocusto)/sum(s.quantidade))'
      ''
      '        /'
      ''
      
        '  '#9'    (select  sum(pnp.qtdeestoque*(select precocusto from form' +
        'acaoprecovenda(np.codigo,pnp.numero)))/sum(pnp.qtdeestoque)'
      '         from notaspag np'
      '             join produtosnotaspag pnp'
      '             on np.codigo = pnp.codigonota'
      '         where pnp.produto = s.produto'
      '           and np.situacao = '#39'N'#39
      '           and ehnotafiscalentradacompra(pnp.codigofiscal)'
      
        '           and to_char(np.emissao, '#39'yyyy-mm'#39') =  s.Anterior_AnoM' +
        'es)'
      ''
      #9'   ) -1)*100 as Econ'
      ''
      'from'
      '('
      ''
      
        '  select cast(to_char(np.emissao, '#39'yyyy-mm'#39')as char(7)) as AnoMe' +
        's,'
      
        '         cast(to_char(np.emissao - interval '#39'1 month'#39', '#39'yyyy-mm'#39 +
        ') as char(7)) as Anterior_AnoMes,'
      '         pnp.produto,'
      '         p.codigovisual as produtovisual,'
      '         p.descricao as descricaoproduto,'
      '         c.grupo,'
      '         g.descricao as descricaogrupo,'
      '         pnp.qtdeestoque as quantidade,'
      ''
      
        '/*         pnp.precounitario/(case when pnp.fatorconversao is nu' +
        'll then 1 else pnp.fatorconversao end) as precounitario,*/'
      ''
      
        '         (select precocusto from formacaoprecovenda(np.codigo,pn' +
        'p.numero)) as precocusto,'
      ''
      '         np.filial,'
      '         f.nome as nomefilial'
      ''
      '  from notaspag np'
      '       join produtosnotaspag pnp'
      
        '       join (produtos p left join promocoes pro on p.promocao = ' +
        'pro.codigo)'
      '            join caracteristicas c'
      '                 join grupos g'
      '                 on c.grupo = g.codigo'
      '            on p.caracteristica = c.codigo'
      '       on pnp.produto = p.codigo'
      '       on np.codigo = pnp.codigonota'
      ''
      '       join filiais f'
      '       on np.filial = f.codigo'
      ''
      '       join vfornecedores vf'
      '       on np.fornecedor = vf.codigo'
      '       and np.tipofornecedor = vf.tipo'
      ''
      '  where np.emissao between :DataInicial and :DataFinal'
      '   and np.situacao = '#39'N'#39
      '   and ehnotafiscalentradacompra(pnp.codigofiscal)'
      ''
      '  %ListadeFiliais'
      '  %ListadeFornecedores'
      '  %ListaGruposFornecedores'
      ''
      '  %ListadeItemProdutos'
      '  %ListadeProdutos'
      '  %ListadeGrupos'
      '  %ListadeClasses'
      '  %ListadeMarcas'
      '  %ListaCondicionalPromocoes'
      ''
      ''
      ''
      ') as s'
      ''
      
        'group by s.filial, s.nomefilial, s.grupo, s.descricaogrupo, s.pr' +
        'odutovisual, s.descricaoproduto, s.AnoMes, s.produto, s.Anterior' +
        '_AnoMes'
      
        'order by s.filial, s.nomefilial, s.grupo, s.descricaogrupo, s.pr' +
        'odutovisual, s.descricaoproduto, s.AnoMes, s.produto, s.Anterior' +
        '_AnoMes'
      ''
      ') as s'
      ''
      '')
    RequestLive = False
    Left = 288
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'DataInicial'
        ParamType = ptUnknown
        Value = #39'2016-09-01'#39
      end
      item
        DataType = ftString
        Name = 'DataFinal'
        ParamType = ptUnknown
        Value = #39'2017-01-31'#39
      end>
    object qryAnaliseComprasanomes: TStringField
      FieldName = 'anomes'
      Size = 7
    end
    object qryAnaliseComprasprodutovisual: TStringField
      FieldName = 'produtovisual'
      Size = 30
    end
    object qryAnaliseComprasdescricaoproduto: TStringField
      FieldName = 'descricaoproduto'
      Size = 100
    end
    object qryAnaliseComprasgrupo: TStringField
      FieldName = 'grupo'
      Size = 4
    end
    object qryAnaliseComprasdescricaogrupo: TStringField
      FieldName = 'descricaogrupo'
      Size = 30
    end
    object qryAnaliseComprasmprod_quantidadeprodutos: TFloatField
      FieldName = 'mprod_quantidadeprodutos'
      DisplayFormat = '0.00'
    end
    object qryAnaliseComprasvalor_precoproduto: TFloatField
      FieldName = 'valor_precoproduto'
      DisplayFormat = '0.00'
    end
    object qryAnaliseComprasvuni_mediaprecoproduto: TFloatField
      FieldName = 'vuni_mediaprecoproduto'
      DisplayFormat = '0.00'
    end
    object qryAnaliseComprasecon: TFloatField
      FieldName = 'econ'
      DisplayFormat = '0.00'
    end
    object qryAnaliseComprasfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryAnaliseComprasnomefilial: TStringField
      FieldName = 'nomefilial'
      Size = 60
    end
  end
  object dsrAnaliseCompras: TtecDataSource
    DataSet = qryAnaliseCompras
    Left = 320
    Top = 96
  end
  object frxAnaliseEconomicaCompras: TfrxReport
    Version = '4.0.11'
    DataSet = frxDBEconomiaCompras
    DataSetName = 'frxDBDataset1'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42746.659209537000000000
    ReportOptions.LastChange = 42766.526297974500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      'vZebrar : boolean;'
      'vValorTotal_a, vValorTotal_b, vQuantidadeTotal : Currency;'
      ''
      'procedure GroupFooter1OnBeforePrint(Sender: TfrxComponent);'
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
      ''
      '  vQuantidadeTotal := vQuantidadeTotal + 1;'
      ''
      'end;'
      ''
      'procedure Memo15OnAfterData(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure Memo5OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  vValorTotal_a := 0;'
      '  vValorTotal_b := 0;'
      'end;'
      ''
      'procedure Memo16OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure Memo15OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   if vValorTotal_a = 0 then'
      '   begin'
      
        '     vValorTotal_a := SUM(IIF(<frxDBDataSet1."anomes">=<frxDBDat' +
        'aset2."anomes">,<frxDBDataSet1."valor_precoproduto">,0),MasterDa' +
        'ta1,1);'
      '     vValorTotal_b := 0;'
      '   end'
      '   else'
      '   begin'
      '     if vValorTotal_b <> 0 then'
      '       vValorTotal_a := vValorTotal_b;'
      
        '     vValorTotal_b := SUM(IIF(<frxDBDataSet1."anomes">=<frxDBDat' +
        'aset2."anomes">,<frxDBDataSet1."valor_precoproduto">,0),MasterDa' +
        'ta1,1)'
      '   end;'
      ''
      'end;'
      ''
      'procedure Memo16OnAfterData(Sender: TfrxComponent);'
      'begin'
      'end;'
      ''
      'procedure GroupFooter3OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   vValorTotal_a := 0;'
      '   vValorTotal_b := 0;'
      'end;'
      ''
      'procedure GroupFooter2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   vValorTotal_a := 0;'
      '   vValorTotal_b := 0;'
      ''
      'end;'
      ''
      'procedure Footer1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   vValorTotal_a := 0;'
      '   vValorTotal_b := 0;'
      'end;'
      ''
      'procedure PageHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  mmoData.left := 990;'
      '  mmoPagina.left := 990;'
      '  mmoValorData.left := 1010;'
      '  mmoValorPagina.left := 1010;'
      ''
      '  mmoTitulo.left := 387;'
      '  mmoOutras.left := 500;'
      'end;'
      ''
      'procedure Header1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  mmoData.left := 990;'
      '  mmoPagina.left := 990;'
      '  mmoValorData.left := 1010;'
      '  mmoValorPagina.left := 1010;'
      ''
      '  mmoTitulo.left := 387;'
      '  mmoOutras.left := 500;'
      ''
      'end;'
      ''
      'procedure Memo8OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  if SUM(IIF(<frxDBDataSet1."anomes">=<frxDBDataSet2."anomes">,<' +
        'frxDBDataSet1."econ">,0),MasterData1,1) > 0 then'
      '    Memo8.font.color := clRed'
      '  else'
      '    Memo8.font.color := clGreen;'
      'end;'
      ''
      'procedure Memo33OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        ' if (IIF((vValorTotal_a<>0) and (vValorTotal_b<>0),(((vValorTota' +
        'l_b / vValorTotal_a)-1)*100),0)) > 0 then'
      '   Memo33.font.color := clRed'
      ' else'
      '   Memo33.font.color := clGreen;'
      ''
      'end;'
      ''
      'procedure Memo34OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        ' if (IIF((vValorTotal_a<>0) and (vValorTotal_b<>0),(((vValorTota' +
        'l_b / vValorTotal_a)-1)*100),0)) > 0 then'
      '   Memo34.font.color := clRed'
      ' else'
      '   Memo34.font.color := clGreen;'
      ''
      'end;'
      ''
      'procedure Memo16OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        ' if (IIF((vValorTotal_a<>0) and (vValorTotal_b<>0),(((vValorTota' +
        'l_b / vValorTotal_a)-1)*100),0)) > 0 then'
      '   Memo16.font.color := clRed'
      ' else'
      '   Memo16.font.color := clGreen;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxAnaliseEconomicaComprasGetValue
    Left = 120
    Top = 176
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end
      item
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
      end>
    Variables = <
      item
        Name = ' New Category1'
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
        Value = #39'AN'#193'LISE ECON'#212'MICA DE COMPRAS'#39
      end
      item
        Name = 'OUTRAS'
        Value = #39'PAR'#194'METROS'#39
      end
      item
        Name = 'CordoZebrado'
        Value = '230'
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 1000.000000000000000000
      PaperHeight = 420.000000000000000000
      PaperSize = 256
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      OnBeforePrint = 'Page1OnBeforePrint'
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 264.567100000000000000
        Visible = False
        Width = 3741.734700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo2: TfrxMemoView
          Left = 453.543600000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '[IIF(<frxDBDataSet1."anomes">=<frxDBDataSet2."anomes">,<frxDBDat' +
              'aSet1."mprod_quantidadeprodutos">,0)]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 22.677180000000000000
        Top = 219.212740000000000000
        Visible = False
        Width = 3741.734700000000000000
        Condition = 'frxDBDataset1."produtovisual"'
        object Memo3: TfrxMemoView
          Left = 453.543600000000000000
          Top = 3.779530000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset2."anomes"]')
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        Height = 1549.607300000000000000
        Left = 445.984540000000000000
        Vertical = True
        Width = 166.299320000000000000
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
        KeepHeader = True
        RowCount = 0
      end
      object GroupHeader2: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Height = 1549.607300000000000000
        Left = 18.897650000000000000
        ParentFont = False
        Vertical = True
        Width = 404.409710000000000000
        Condition = 'frxDBDataset1."produtovisual"'
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 15.118120000000000000
        Top = 309.921460000000000000
        Width = 3741.734700000000000000
        OnBeforePrint = 'GroupFooter1OnBeforePrint'
        Stretched = True
        object mmoZebrado: TfrxMemoView
          Align = baClient
          Width = 3741.734700000000000000
          Height = 15.118120000000000000
          Color = clBtnFace
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Style = 'Style1'
        end
        object Memo1: TfrxMemoView
          Left = 22.677180000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataField = 'produtovisual'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."produtovisual"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 128.504020000000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataField = 'descricaoproduto'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."descricaoproduto"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 445.984540000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo5OnBeforePrint'
          StretchMode = smMaxHeight
          DataSet = dtmRelatorioEstoque.frxDBEstoqueGrade
          DataSetName = 'frxDBEstoqueGrade'
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
            
              '[SUM(IIF(<frxDBDataSet1."anomes">=<frxDBDataSet2."anomes">,<frxD' +
              'BDataSet1."valor_precoproduto">,0),MasterData1,1)]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 506.457020000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataSet = dtmRelatorioEstoque.frxDBEstoqueGrade
          DataSetName = 'frxDBEstoqueGrade'
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
            
              '[SUM(IIF(<frxDBDataSet1."anomes">=<frxDBDataSet2."anomes">,<frxD' +
              'BDataSet1."vUni_MediaPrecoProduto">,0),MasterData1,1)]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 570.709030000000000000
          Width = 41.574830000000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo8OnBeforePrint'
          StretchMode = smMaxHeight
          DataSet = dtmRelatorioEstoque.frxDBEstoqueGrade
          DataSetName = 'frxDBEstoqueGrade'
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
            
              '[SUM(IIF(<frxDBDataSet1."anomes">=<frxDBDataSet2."anomes">,<frxD' +
              'BDataSet1."econ">,0),MasterData1,1)]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 377.953000000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."mprod_quantidadeprodutos"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        Height = 41.574830000000000000
        Top = 464.882190000000000000
        Width = 3741.734700000000000000
        OnBeforePrint = 'Footer1OnBeforePrint'
        object Memo15: TfrxMemoView
          Left = 445.984540000000000000
          Top = 3.779530000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo15OnBeforePrint'
          StretchMode = smMaxHeight
          DataSet = dtmRelatorioEstoque.frxDBEstoqueGrade
          DataSetName = 'frxDBEstoqueGrade'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            
              '[SUM(IIF(<frxDBDataSet1."anomes">=<frxDBDataSet2."anomes">,<frxD' +
              'BDataSet1."valor_precoproduto">,0),MasterData1,1)]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 445.984540000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo16OnBeforePrint'
          StretchMode = smMaxHeight
          DataSet = dtmRelatorioEstoque.frxDBEstoqueGrade
          DataSetName = 'frxDBEstoqueGrade'
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
            
              '[IIF((vValorTotal_a<>0) and (vValorTotal_b<>0),(((vValorTotal_b ' +
              '/ vValorTotal_a)-1)*100),0)]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 359.055350000000000000
          Top = 3.779530000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataSet = dtmRelatorioEstoque.frxDBEstoqueGrade
          DataSetName = 'frxDBEstoqueGrade'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[vQuantidadeTotal]')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 60.472480000000000000
          Top = 3.779530000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Total Geral ->')
          ParentFont = False
        end
      end
      object GroupHeader3: TfrxGroupHeader
        Height = 22.677180000000000000
        Top = 128.504020000000000000
        Width = 3741.734700000000000000
        Condition = 'frxDBDataset1."filial"'
        object Memo18: TfrxMemoView
          Left = 26.456710000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          DataField = 'filial'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."filial"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 56.692950000000000000
          Width = 359.055350000000000000
          Height = 18.897650000000000000
          DataField = 'nomefilial'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."nomefilial"]')
          ParentFont = False
        end
      end
      object GroupFooter2: TfrxGroupFooter
        Height = 37.795300000000000000
        Top = 404.409710000000000000
        Width = 3741.734700000000000000
        OnBeforePrint = 'GroupFooter2OnBeforePrint'
        object Memo20: TfrxMemoView
          Left = 359.055350000000000000
          Top = 7.559060000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataSet = dtmRelatorioEstoque.frxDBEstoqueGrade
          DataSetName = 'frxDBEstoqueGrade'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[vQuantidadeTotal]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 120.944960000000000000
          Top = 7.559060000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          DataField = 'filial'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."filial"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 151.181200000000000000
          Top = 7.559060000000000000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          DataField = 'nomefilial'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."nomefilial"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 60.472480000000000000
          Top = 7.559060000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Total Filial ->')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 445.984540000000000000
          Top = 7.559060000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo15OnBeforePrint'
          StretchMode = smMaxHeight
          DataSet = dtmRelatorioEstoque.frxDBEstoqueGrade
          DataSetName = 'frxDBEstoqueGrade'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            
              '[SUM(IIF(<frxDBDataSet1."anomes">=<frxDBDataSet2."anomes">,<frxD' +
              'BDataSet1."valor_precoproduto">,0),MasterData1,1)]')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 445.984540000000000000
          Top = 22.677180000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo34OnBeforePrint'
          StretchMode = smMaxHeight
          DataSet = dtmRelatorioEstoque.frxDBEstoqueGrade
          DataSetName = 'frxDBEstoqueGrade'
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
            
              '[IIF((vValorTotal_a<>0) and (vValorTotal_b<>0),(((vValorTotal_b ' +
              '/ vValorTotal_a)-1)*100),0)]')
          ParentFont = False
        end
      end
      object GroupHeader4: TfrxGroupHeader
        Height = 22.677180000000000000
        Top = 173.858380000000000000
        Width = 3741.734700000000000000
        Condition = 'frxDBDataset1."grupo"'
        object Memo24: TfrxMemoView
          Left = 26.456710000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."grupo"]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 94.488250000000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."descricaogrupo"]')
          ParentFont = False
        end
      end
      object GroupFooter3: TfrxGroupFooter
        Height = 34.015770000000000000
        Top = 347.716760000000000000
        Width = 3741.734700000000000000
        OnBeforePrint = 'GroupFooter3OnBeforePrint'
        object Memo26: TfrxMemoView
          Left = 359.055350000000000000
          Top = 3.779530000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataSet = dtmRelatorioEstoque.frxDBEstoqueGrade
          DataSetName = 'frxDBEstoqueGrade'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[vQuantidadeTotal]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 120.944960000000000000
          Top = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."grupo"]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 170.078850000000000000
          Top = 3.779530000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."descricaogrupo"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 49.133890000000000000
          Top = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Total Grupo ->')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 445.984540000000000000
          Top = 3.779530000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo15OnBeforePrint'
          StretchMode = smMaxHeight
          DataSet = dtmRelatorioEstoque.frxDBEstoqueGrade
          DataSetName = 'frxDBEstoqueGrade'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            
              '[SUM(IIF(<frxDBDataSet1."anomes">=<frxDBDataSet2."anomes">,<frxD' +
              'BDataSet1."valor_precoproduto">,0),MasterData1,1)]')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 445.984540000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo33OnBeforePrint'
          StretchMode = smMaxHeight
          DataSet = dtmRelatorioEstoque.frxDBEstoqueGrade
          DataSetName = 'frxDBEstoqueGrade'
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
            
              '[IIF((vValorTotal_a<>0) and (vValorTotal_b<>0),(((vValorTotal_b ' +
              '/ vValorTotal_a)-1)*100),0)]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 86.929190000000000000
        Top = 18.897650000000000000
        Width = 3741.734700000000000000
        OnBeforePrint = 'Header1OnBeforePrint'
        ReprintOnNewPage = True
        object fmvRua: TfrxMemoView
          Left = 151.181200000000000000
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
          Left = 151.181200000000000000
          Top = 17.007885000000000000
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
          Left = 151.181200000000000000
          Top = 30.236240000000000000
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
          Left = 22.677180000000000000
          Top = 3.779530000000000000
          Width = 120.944960000000000000
          Height = 45.354360000000000000
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
        object mmoValorPagina: TfrxMemoView
          Left = 351.496290000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Page#]')
          ParentFont = False
        end
        object mmoPagina: TfrxMemoView
          Left = 313.700990000000000000
          Top = 18.897650000000000000
          Width = 34.015770000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'P'#195#129'G.:')
          ParentFont = False
        end
        object mmoData: TfrxMemoView
          Left = 313.700990000000000000
          Top = 3.779530000000000000
          Width = 34.015770000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'DATA:')
          ParentFont = False
        end
        object mmoOutras: TfrxMemoView
          ShiftMode = smDontShift
          Left = 370.393940000000000000
          Top = 22.677180000000000000
          Width = 41.574830000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[OUTRAS]')
          ParentFont = False
          WordWrap = False
        end
        object mmoValorData: TfrxMemoView
          Left = 351.496290000000000000
          Top = 3.779530000000000000
          Width = 60.472480000000000000
          Height = 11.338582680000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[Date]')
          ParentFont = False
        end
        object mmoTitulo: TfrxMemoView
          ShiftMode = smDontShift
          Left = 370.393866770000000000
          Top = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[TITULO]')
          ParentFont = False
          WordWrap = False
        end
        object Memo7: TfrxMemoView
          Left = 445.984540000000000000
          Top = 52.913420000000000000
          Width = 166.299320000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset2."MesAnoExtenso"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 22.677180000000000000
          Top = 68.031540000000000000
          Width = 321.260050000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'PRODUTO')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 343.937230000000000000
          Top = 68.031540000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'M'#195#8240'DIA PROD.')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 445.984540000000000000
          Top = 68.031540000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'VALOR')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 506.457020000000000000
          Top = 68.031540000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'V. UNIT.')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 566.929500000000000000
          Top = 68.031540000000000000
          Width = 45.354360000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'ECON. %')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'anomes=anomes'
      'produtovisual=produtovisual'
      'descricaoproduto=descricaoproduto'
      'grupo=grupo'
      'descricaogrupo=descricaogrupo'
      'mprod_quantidadeprodutos=mprod_quantidadeprodutos'
      'valor_precoproduto=valor_precoproduto'
      'vuni_mediaprecoproduto=vuni_mediaprecoproduto'
      'econ=econ'
      'filial=filial'
      'nomefilial=nomefilial')
    DataSet = qryAnaliseCompras
    Left = 232
    Top = 152
  end
  object qryAnaliseCompras_: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnCalcFields = qryAnaliseCompras_CalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      
        'select distinct cast(to_char(generate_series(0, (select cast(:Da' +
        'taFinal as date) - cast(:DataInicial as date))) + cast(:DataInic' +
        'ial as date), '#39'yyyy-mm'#39')as char(7)) as AnoMes'
      'order by 1'
      '')
    RequestLive = False
    Left = 424
    Top = 48
    ParamData = <
      item
        DataType = ftString
        Name = 'DataFinal'
        ParamType = ptUnknown
        Value = #39'2017-01-31'#39
      end
      item
        DataType = ftString
        Name = 'DataInicial'
        ParamType = ptUnknown
        Value = #39'2016-09-01'#39
      end>
    object qryAnaliseCompras_anomes: TStringField
      FieldName = 'anomes'
      Size = 7
    end
    object qryAnaliseCompras_MesAnoExtenso: TStringField
      FieldKind = fkCalculated
      FieldName = 'MesAnoExtenso'
      Size = 15
      Calculated = True
    end
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    FieldAliases.Strings = (
      'anomes=anomes'
      'MesAnoExtenso=MesAnoExtenso')
    DataSet = qryAnaliseCompras_
    Left = 320
    Top = 216
  end
  object tecDataSource1: TtecDataSource
    DataSet = qryAnaliseCompras
    Left = 344
    Top = 24
  end
  object frxDBEconomiaCompras: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'anomes=anomes'
      'produtovisual=produtovisual'
      'descricaoproduto=descricaoproduto'
      'grupo=grupo'
      'descricaogrupo=descricaogrupo'
      'mprod_quantidadeprodutos=mprod_quantidadeprodutos'
      'valor_precoproduto=valor_precoproduto'
      'vuni_mediaprecoproduto=vuni_mediaprecoproduto'
      'econ=econ'
      'filial=filial'
      'nomefilial=nomefilial')
    DataSet = qryAnaliseCompras
    Left = 240
    Top = 248
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
    Left = 520
    Top = 24
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    ShowProgress = True
    FixedWidth = True
    Background = False
    Centered = False
    EmptyLines = True
    Left = 520
    Top = 72
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
    Left = 520
    Top = 120
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 520
    Top = 176
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    Left = 520
    Top = 224
  end
  object frxBMPExport1: TfrxBMPExport
    UseFileCache = True
    ShowProgress = True
    Left = 520
    Top = 272
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    ShowProgress = True
    Left = 512
    Top = 328
  end
  object frxTIFFExport1: TfrxTIFFExport
    UseFileCache = True
    ShowProgress = True
    Left = 512
    Top = 384
  end
  object frxGIFExport1: TfrxGIFExport
    UseFileCache = True
    ShowProgress = True
    Left = 512
    Top = 440
  end
  object frxSimpleTextExport1: TfrxSimpleTextExport
    UseFileCache = True
    ShowProgress = True
    Frames = False
    EmptyLines = False
    OEMCodepage = False
    Left = 616
    Top = 32
  end
  object frxCSVExport1: TfrxCSVExport
    UseFileCache = True
    ShowProgress = True
    Separator = ';'
    OEMCodepage = False
    Left = 616
    Top = 88
  end
  object frxMailExport1: TfrxMailExport
    UseFileCache = True
    ShowProgress = True
    ShowExportDialog = True
    SmtpPort = 25
    UseIniFile = True
    Left = 616
    Top = 144
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
    Left = 616
    Top = 200
  end
  object frxODSExport1: TfrxODSExport
    UseFileCache = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 608
    Top = 256
  end
  object frxODTExport1: TfrxODTExport
    UseFileCache = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 608
    Top = 320
  end
end
