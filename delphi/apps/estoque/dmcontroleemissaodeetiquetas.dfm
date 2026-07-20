inherited dtmControleEmissaodeEtiquetas: TdtmControleEmissaodeEtiquetas
  OldCreateOrder = False
  Left = 599
  Top = 327
  Height = 310
  Width = 555
  object qryParametrosFormularios: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnCalcFields = qryParametrosFormulariosCalcFields
    OnFilterRecord = qryParametrosFormulariosFilterRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'IntervaloDatas'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select pf.*,'
      '       u.codigo as codigousuario,'
      '       u.nome as nomeusuario,'
      '       false as selecionar'
      '       '
      'from parametrosformularios pf'
      '     join usuarios u'
      '     on pf.usename = u.usename'
      ''
      'where coalesce(pf.objetivo,'#39#39')<>'#39#39
      '  and pf.nomeformulario = '#39'frmEmissaoEtiquetas.ini'#39
      '  %IntervaloDatas'
      ''
      'order by pf.datahora'
      ''
      ''
      '/*'
      ':datainicial'
      ':datafinal'
      ''
      '*/'
      '')
    RequestLive = True
    Left = 72
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end>
    object qryParametrosFormulariosnomeformulario: TStringField
      FieldName = 'nomeformulario'
      Visible = False
      Size = 100
    end
    object qryParametrosFormulariosusename: TStringField
      FieldName = 'usename'
      Size = 50
    end
    object qryParametrosFormularioschave: TStringField
      FieldName = 'chave'
      Visible = False
      Size = 50
    end
    object qryParametrosFormulariosconteudo: TMemoField
      FieldName = 'conteudo'
      Visible = False
      BlobType = ftMemo
    end
    object qryParametrosFormulariosdatahora: TDateTimeField
      FieldName = 'datahora'
    end
    object qryParametrosFormulariosobjetivo: TStringField
      FieldName = 'objetivo'
      Visible = False
      Size = 50
    end
    object qryParametrosFormularioscodigousuario: TIntegerField
      FieldName = 'codigousuario'
    end
    object qryParametrosFormulariosnomeusuario: TStringField
      FieldName = 'nomeusuario'
      Size = 100
    end
    object qryParametrosFormulariosFilialProdutosExposicao: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'FilialProdutosExposicao'
      DisplayFormat = '0'
      Calculated = True
    end
    object qryParametrosFormulariosEmExposicao: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'EmExposicao'
      Calculated = True
    end
    object qryParametrosFormulariosQtdemEstoqueProdutosExposicao: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'QtdemEstoqueProdutosExposicao'
      Calculated = True
    end
    object qryParametrosFormulariosQusntidadeLote: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'QusntidadeLote'
      Calculated = True
    end
    object qryParametrosFormulariosNrLote: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NrLote'
      DisplayFormat = '0'
      Calculated = True
    end
    object qryParametrosFormulariosQtdeZeradaProdutosExposicao: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'QtdeZeradaProdutosExposicao'
      Calculated = True
    end
    object qryParametrosFormulariosIntervaloInicialAlteracao: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'IntervaloInicialAlteracao'
      Calculated = True
    end
    object qryParametrosFormulariosIntervaloFinalAlteracao: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'IntervaloFinalAlteracao'
      Calculated = True
    end
    object qryParametrosFormulariosModeloEtiqueta: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ModeloEtiqueta'
      DisplayFormat = '0'
      Calculated = True
    end
    object qryParametrosFormulariosQuantidadeProdutosExposicao: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'QuantidadeProdutosExposicao'
      DisplayFormat = '0'
      Calculated = True
    end
    object qryParametrosFormulariosselecionar: TBooleanField
      FieldName = 'selecionar'
      Visible = False
    end
  end
  object frxControleEmissaodeEtiquetas: TfrxReport
    Version = '4.0.11'
    DataSet = frxDBControleEmissaodeEtiquetas_
    DataSetName = 'frxDBControleEmissaodeEtiquetas'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42716.483787870400000000
    ReportOptions.LastChange = 42716.747139039400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      'vZebrar : boolean;'
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
      'begin'
      ''
      'end.')
    OnGetValue = frxControleEmissaodeEtiquetasGetValue
    Left = 160
    Top = 104
    Datasets = <
      item
        DataSet = frxDBControleEmissaodeEtiquetas
        DataSetName = 'frxDBControleEmissaodeEtiquetas'
      end>
    Variables = <
      item
        Name = 'RAZAOFILIALBASE'
        Value = #39'PRAIANA COMERCIO DE PRODUTOS HOSPITALARES EIRELI EPP'#39
      end
      item
        Name = 'ENDERECO_BAIRRO'
        Value = #39' RUA 3300, 381, COM 3'#170' AVENIDA - CENTRO'#39
      end
      item
        Name = 'CEP_CIDADE_UF'
        Value = #39'88330-272  Balne'#225'rio Cambori'#250'  SC'#39
      end
      item
        Name = 'TITULO'
        Value = Null
      end
      item
        Name = 'SUBTITULO'
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
      PaperSize = 9
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 162.519790000000000000
        Width = 1122.520410000000000000
        DataSet = frxDBControleEmissaodeEtiquetas
        DataSetName = 'frxDBControleEmissaodeEtiquetas'
        RowCount = 0
        object mmoZebrado: TfrxMemoView
          Align = baClient
          Width = 1122.520410000000000000
          Height = 18.897650000000000000
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
        object Memo2: TfrxMemoView
          Left = 170.078850000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          DataSet = frxDBControleEmissaodeEtiquetas
          DataSetName = 'frxDBControleEmissaodeEtiquetas'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBControleEmissaodeEtiquetas."nomeusuario"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 7.559060000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataSet = frxDBControleEmissaodeEtiquetas
          DataSetName = 'frxDBControleEmissaodeEtiquetas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yy hh:mm'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBControleEmissaodeEtiquetas."datahora"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 313.700990000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DataSet = frxDBControleEmissaodeEtiquetas
          DataSetName = 'frxDBControleEmissaodeEtiquetas'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBControleEmissaodeEtiquetas."FilialProdutosExposicao"]')
          ParentFont = False
        end
        object CheckBox1: TfrxCheckBoxView
          Left = 355.275820000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          CheckStyle = csCheck
          DataField = 'EmExposicao'
          DataSet = frxDBControleEmissaodeEtiquetas
          DataSetName = 'frxDBControleEmissaodeEtiquetas'
        end
        object Memo8: TfrxMemoView
          Left = 427.086890000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = 'NrLote'
          DataSet = frxDBControleEmissaodeEtiquetas
          DataSetName = 'frxDBControleEmissaodeEtiquetas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBControleEmissaodeEtiquetas."NrLote"]')
          ParentFont = False
        end
        object CheckBox2: TfrxCheckBoxView
          Left = 514.016080000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          CheckStyle = csCheck
          DataField = 'QusntidadeLote'
          DataSet = frxDBControleEmissaodeEtiquetas
          DataSetName = 'frxDBControleEmissaodeEtiquetas'
        end
        object CheckBox3: TfrxCheckBoxView
          Left = 578.268090000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          CheckStyle = csCheck
          DataField = 'QtdemEstoqueProdutosExposicao'
          DataSet = frxDBControleEmissaodeEtiquetas
          DataSetName = 'frxDBControleEmissaodeEtiquetas'
        end
        object CheckBox4: TfrxCheckBoxView
          Left = 646.299630000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          CheckStyle = csCheck
          DataField = 'QtdeZeradaProdutosExposicao'
          DataSet = frxDBControleEmissaodeEtiquetas
          DataSetName = 'frxDBControleEmissaodeEtiquetas'
        end
        object Memo13: TfrxMemoView
          Left = 695.433520000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataSet = frxDBControleEmissaodeEtiquetas
          DataSetName = 'frxDBControleEmissaodeEtiquetas'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            
              '[IIF(<frxDBControleEmissaodeEtiquetas."QtdeZeradaProdutosExposic' +
              'ao">,<frxDBControleEmissaodeEtiquetas."QuantidadeProdutosExposic' +
              'ao">,0)]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 752.126470000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataField = 'IntervaloInicialAlteracao'
          DataSet = frxDBControleEmissaodeEtiquetas
          DataSetName = 'frxDBControleEmissaodeEtiquetas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBControleEmissaodeEtiquetas."IntervaloInicialAlteracao"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 835.276130000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataField = 'IntervaloFinalAlteracao'
          DataSet = frxDBControleEmissaodeEtiquetas
          DataSetName = 'frxDBControleEmissaodeEtiquetas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBControleEmissaodeEtiquetas."IntervaloFinalAlteracao"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 918.425790000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataField = 'ModeloEtiqueta'
          DataSet = frxDBControleEmissaodeEtiquetas
          DataSetName = 'frxDBControleEmissaodeEtiquetas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBControleEmissaodeEtiquetas."ModeloEtiqueta"]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 120.944960000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataSet = frxDBControleEmissaodeEtiquetas
          DataSetName = 'frxDBControleEmissaodeEtiquetas'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBControleEmissaodeEtiquetas."codigousuario"]')
          ParentFont = False
        end
      end
      object PageHeader1_: TfrxPageHeader
        Height = 83.149660000000000000
        Top = 18.897650000000000000
        Width = 1122.520410000000000000
        object Memo4: TfrxMemoView
          Left = 7.559060000000000000
          Top = 56.692950000000000000
          Width = 109.606370000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'DATA/HORA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 166.299320000000000000
          Top = 56.692950000000000000
          Width = 143.622140000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'NOME')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 309.921460000000000000
          Top = 56.692950000000000000
          Width = 41.574830000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'FILIAL SELEC.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 351.496290000000000000
          Top = 56.692950000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'EM EXPOSI'#195#8225#195#402'O')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 427.086890000000000000
          Top = 56.692950000000000000
          Width = 86.929190000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'NR. LOTE DE TRANSFER'#195#352'NCIA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 514.016080000000000000
          Top = 68.031540000000000000
          Width = 60.472480000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'DO LOTE')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 574.488560000000000000
          Top = 68.031540000000000000
          Width = 71.811070000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'EM ESTOQUE')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 646.299630000000000000
          Top = 68.031540000000000000
          Width = 49.133890000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'ZERADA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 695.433520000000000000
          Top = 68.031540000000000000
          Width = 56.692950000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'IMPRESSA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 514.016080000000000000
          Top = 56.692950000000000000
          Width = 238.110390000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'QUANTIDADES')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 752.126470000000000000
          Top = 68.031540000000000000
          Width = 83.149660000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'DATA INICIAL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 835.276130000000000000
          Top = 68.031540000000000000
          Width = 83.149660000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'DATA FINAL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 752.126470000000000000
          Top = 56.692950000000000000
          Width = 166.299320000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'ALTERA'#195#8225#195#8226'ES DO PRE'#195#8225'O')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 918.425790000000000000
          Top = 56.692950000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'MODELO DA ETIQUETA')
          ParentFont = False
          VAlign = vaCenter
        end
        object fmvRua: TfrxMemoView
          Left = 136.063080000000000000
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
          Left = 136.063080000000000000
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
          Left = 136.063080000000000000
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
          Left = 7.559060000000000000
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
        object Memo236: TfrxMemoView
          Left = 1046.929810000000000000
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
        object Memo237: TfrxMemoView
          Left = 1009.134510000000000000
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
        object Memo238: TfrxMemoView
          Left = 1009.134510000000000000
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
        object Memo239: TfrxMemoView
          Left = 1046.929810000000000000
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
          Left = 517.795610000000000000
          Width = 283.464750000000000000
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
          WordWrap = False
        end
        object Memo240: TfrxMemoView
          ShiftMode = smDontShift
          Left = 517.795610000000000000
          Top = 26.456710000000000000
          Width = 283.464750000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUBTITULO]')
          ParentFont = False
          WordWrap = False
        end
        object Memo23: TfrxMemoView
          Left = 117.165430000000000000
          Top = 56.692950000000000000
          Width = 49.133890000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'USU'#195#129'RIO')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDBControleEmissaodeEtiquetas: TfrxDBDataset
    UserName = 'frxDBControleEmissaodeEtiquetas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nomeformulario=nomeformulario'
      'usename=usename'
      'chave=chave'
      'conteudo=conteudo'
      'datahora=datahora'
      'objetivo=objetivo'
      'nomeusuario=nomeusuario'
      'FilialProdutosExposicao=FilialProdutosExposicao'
      'EmExposicao=EmExposicao'
      'QtdemEstoqueProdutosExposicao=QtdemEstoqueProdutosExposicao'
      'QusntidadeLote=QusntidadeLote'
      'NrLote=NrLote'
      'QtdeZeradaProdutosExposicao=QtdeZeradaProdutosExposicao'
      'IntervaloInicialAlteracao=IntervaloInicialAlteracao'
      'IntervaloFinalAlteracao=IntervaloFinalAlteracao'
      'ModeloEtiqueta=ModeloEtiqueta'
      'QuantidadeProdutosExposicao=QuantidadeProdutosExposicao'
      'selecionar=selecionar'
      'codigousuario=codigousuario')
    DataSet = qryParametrosFormularios
    Left = 232
    Top = 128
  end
  object frxDBControleEmissaodeEtiquetas_: TfrxDBDataset
    UserName = 'frxDBControleEmissaodeEtiquetas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nomeformulario=nomeformulario'
      'usename=usename'
      'chave=chave'
      'conteudo=conteudo'
      'datahora=datahora'
      'objetivo=objetivo'
      'nomeusuario=nomeusuario'
      'FilialProdutosExposicao=FilialProdutosExposicao'
      'EmExposicao=EmExposicao'
      'QtdemEstoqueProdutosExposicao=QtdemEstoqueProdutosExposicao'
      'QusntidadeLote=QusntidadeLote'
      'NrLote=NrLote'
      'QtdeZeradaProdutosExposicao=QtdeZeradaProdutosExposicao'
      'IntervaloInicialAlteracao=IntervaloInicialAlteracao'
      'IntervaloFinalAlteracao=IntervaloFinalAlteracao'
      'ModeloEtiqueta=ModeloEtiqueta'
      'QuantidadeProdutosExposicao=QuantidadeProdutosExposicao'
      'selecionar=selecionar'
      'codigousuario=codigousuario')
    DataSet = qryParametrosFormularios
    Left = 232
    Top = 176
  end
  object frxCheckBoxObject1: TfrxCheckBoxObject
    Left = 368
    Top = 80
  end
end
