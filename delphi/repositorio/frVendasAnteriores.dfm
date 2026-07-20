object fraVendasAnteriores: TfraVendasAnteriores
  Left = 0
  Top = 0
  Width = 659
  Height = 321
  TabOrder = 0
  object DBAdvGridProdutosporCliente: TDBAdvGrid
    Left = 0
    Top = 0
    Width = 659
    Height = 321
    Cursor = crDefault
    Align = alClient
    ColCount = 19
    RowCount = 2
    FixedRows = 1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Pitch = fpVariable
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 0
    ActiveRowShow = True
    ActiveCellShow = True
    ActiveCellFont.Charset = DEFAULT_CHARSET
    ActiveCellFont.Color = clWindowText
    ActiveCellFont.Height = -11
    ActiveCellFont.Name = 'Tahoma'
    ActiveCellFont.Style = [fsBold]
    ControlLook.FixedGradientHoverFrom = clGray
    ControlLook.FixedGradientHoverTo = clWhite
    ControlLook.FixedGradientDownFrom = clGray
    ControlLook.FixedGradientDownTo = clSilver
    ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
    ControlLook.DropDownHeader.Font.Color = clWindowText
    ControlLook.DropDownHeader.Font.Height = -11
    ControlLook.DropDownHeader.Font.Name = 'Tahoma'
    ControlLook.DropDownHeader.Font.Style = []
    ControlLook.DropDownHeader.Visible = True
    ControlLook.DropDownHeader.Buttons = <>
    ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
    ControlLook.DropDownFooter.Font.Color = clWindowText
    ControlLook.DropDownFooter.Font.Height = -11
    ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
    ControlLook.DropDownFooter.Font.Style = []
    ControlLook.DropDownFooter.Visible = True
    ControlLook.DropDownFooter.Buttons = <>
    Filter = <>
    FilterDropDown.Font.Charset = DEFAULT_CHARSET
    FilterDropDown.Font.Color = clWindowText
    FilterDropDown.Font.Height = -11
    FilterDropDown.Font.Name = 'MS Sans Serif'
    FilterDropDown.Font.Style = []
    FilterDropDownClear = '(All)'
    FixedColWidth = 20
    FixedRowHeight = 33
    FixedFont.Charset = DEFAULT_CHARSET
    FixedFont.Color = clWindowText
    FixedFont.Height = -11
    FixedFont.Name = 'Tahoma'
    FixedFont.Style = [fsBold]
    FloatFormat = '%.2f'
    PrintSettings.DateFormat = 'dd/mm/yyyy'
    PrintSettings.Font.Charset = DEFAULT_CHARSET
    PrintSettings.Font.Color = clWindowText
    PrintSettings.Font.Height = -11
    PrintSettings.Font.Name = 'MS Sans Serif'
    PrintSettings.Font.Style = []
    PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
    PrintSettings.FixedFont.Color = clWindowText
    PrintSettings.FixedFont.Height = -11
    PrintSettings.FixedFont.Name = 'MS Sans Serif'
    PrintSettings.FixedFont.Style = []
    PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
    PrintSettings.HeaderFont.Color = clWindowText
    PrintSettings.HeaderFont.Height = -11
    PrintSettings.HeaderFont.Name = 'MS Sans Serif'
    PrintSettings.HeaderFont.Style = []
    PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
    PrintSettings.FooterFont.Color = clWindowText
    PrintSettings.FooterFont.Height = -11
    PrintSettings.FooterFont.Name = 'MS Sans Serif'
    PrintSettings.FooterFont.Style = []
    PrintSettings.PageNumSep = '/'
    SearchFooter.FindNextCaption = 'Find &next'
    SearchFooter.FindPrevCaption = 'Find &previous'
    SearchFooter.Font.Charset = DEFAULT_CHARSET
    SearchFooter.Font.Color = clWindowText
    SearchFooter.Font.Height = -11
    SearchFooter.Font.Name = 'MS Sans Serif'
    SearchFooter.Font.Style = []
    SearchFooter.HighLightCaption = 'Highlight'
    SearchFooter.HintClose = 'Close'
    SearchFooter.HintFindNext = 'Find next occurrence'
    SearchFooter.HintFindPrev = 'Find previous occurrence'
    SearchFooter.HintHighlight = 'Highlight occurrences'
    SearchFooter.MatchCaseCaption = 'Match case'
    SortSettings.Show = True
    SortSettings.UndoSort = True
    Version = '2.3.2.2'
    AutoCreateColumns = False
    AutoRemoveColumns = False
    Columns = <
      item
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Pitch = fpVariable
        Font.Style = []
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Pitch = fpVariable
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'MS Sans Serif'
        PrintFont.Pitch = fpVariable
        PrintFont.Style = []
        Width = 20
      end
      item
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        EditLength = 20
        FieldName = 'contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Pitch = fpVariable
        Font.Style = []
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Pitch = fpVariable
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'MS Sans Serif'
        PrintFont.Pitch = fpVariable
        PrintFont.Style = []
        ShowBands = True
        Width = 64
      end
      item
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        EditLength = 1
        FieldName = 'situacao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Pitch = fpVariable
        Font.Style = []
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Pitch = fpVariable
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'MS Sans Serif'
        PrintFont.Pitch = fpVariable
        PrintFont.Style = []
        ShowBands = True
        Width = 31
      end
      item
        Alignment = taCenter
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        EditMask = '99/99/9999;1; '
        FieldName = 'faturamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Pitch = fpVariable
        Font.Style = []
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Pitch = fpVariable
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'MS Sans Serif'
        PrintFont.Pitch = fpVariable
        PrintFont.Style = []
        ShowBands = True
        Width = 63
      end
      item
        Alignment = taRightJustify
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'filial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Pitch = fpVariable
        Font.Style = []
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Pitch = fpVariable
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'MS Sans Serif'
        PrintFont.Pitch = fpVariable
        PrintFont.Style = []
        ShowBands = True
        Width = 46
      end
      item
        Alignment = taRightJustify
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Pitch = fpVariable
        Font.Style = []
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Pitch = fpVariable
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'MS Sans Serif'
        PrintFont.Pitch = fpVariable
        PrintFont.Style = []
        ShowBands = True
        Width = 64
      end
      item
        Alignment = taRightJustify
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'precovenda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Pitch = fpVariable
        Font.Style = []
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Pitch = fpVariable
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'MS Sans Serif'
        PrintFont.Pitch = fpVariable
        PrintFont.Style = []
        ShowBands = True
        Width = 82
      end
      item
        Alignment = taRightJustify
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'totalprecovenda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Pitch = fpVariable
        Font.Style = []
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Pitch = fpVariable
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'MS Sans Serif'
        PrintFont.Pitch = fpVariable
        PrintFont.Style = []
        ShowBands = True
        Width = 65
      end
      item
        Alignment = taRightJustify
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'precotabela'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Pitch = fpVariable
        Font.Style = []
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Pitch = fpVariable
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'MS Sans Serif'
        PrintFont.Pitch = fpVariable
        PrintFont.Style = []
        ShowBands = True
        Width = 68
      end
      item
        Alignment = taRightJustify
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'totalprecotabela'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Pitch = fpVariable
        Font.Style = []
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Pitch = fpVariable
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'MS Sans Serif'
        PrintFont.Pitch = fpVariable
        PrintFont.Style = []
        ShowBands = True
        Width = 64
      end
      item
        Alignment = taRightJustify
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'desconto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Pitch = fpVariable
        Font.Style = []
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Pitch = fpVariable
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'MS Sans Serif'
        PrintFont.Pitch = fpVariable
        PrintFont.Style = []
        ShowBands = True
        Width = 64
      end
      item
        Alignment = taRightJustify
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'filialvenda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Pitch = fpVariable
        Font.Style = []
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Pitch = fpVariable
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'MS Sans Serif'
        PrintFont.Pitch = fpVariable
        PrintFont.Style = []
        ShowBands = True
        Width = 30
      end
      item
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        EditLength = 50
        FieldName = 'serie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Pitch = fpVariable
        Font.Style = []
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Pitch = fpVariable
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'MS Sans Serif'
        PrintFont.Pitch = fpVariable
        PrintFont.Style = []
        ShowBands = True
        Width = 23
      end
      item
        Alignment = taRightJustify
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'numeronota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Pitch = fpVariable
        Font.Style = []
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Pitch = fpVariable
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'MS Sans Serif'
        PrintFont.Pitch = fpVariable
        PrintFont.Style = []
        ShowBands = True
        Width = 43
      end
      item
        Alignment = taRightJustify
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'maquina'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Pitch = fpVariable
        Font.Style = []
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Pitch = fpVariable
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'MS Sans Serif'
        PrintFont.Pitch = fpVariable
        PrintFont.Style = []
        ShowBands = True
        Width = 32
      end
      item
        Alignment = taRightJustify
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'intervensao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Pitch = fpVariable
        Font.Style = []
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Pitch = fpVariable
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'MS Sans Serif'
        PrintFont.Pitch = fpVariable
        PrintFont.Style = []
        ShowBands = True
        Width = 25
      end
      item
        Alignment = taRightJustify
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'numerocupom'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Pitch = fpVariable
        Font.Style = []
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Pitch = fpVariable
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'MS Sans Serif'
        PrintFont.Pitch = fpVariable
        PrintFont.Style = []
        ShowBands = True
        Width = 41
      end
      item
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        EditLength = 30
        FieldName = 'produto_cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Pitch = fpVariable
        Font.Style = []
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Pitch = fpVariable
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'MS Sans Serif'
        PrintFont.Pitch = fpVariable
        PrintFont.Style = []
        ShowBands = True
        Width = 51
      end
      item
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        EditLength = 35
        FieldName = 'pedidocliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Pitch = fpVariable
        Font.Style = []
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Pitch = fpVariable
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'MS Sans Serif'
        PrintFont.Pitch = fpVariable
        PrintFont.Style = []
        ShowBands = True
        Width = 64
      end>
    DataSource = dsrProdutosporCliente
    PageMode = False
    InvalidPicture.Data = {
      055449636F6E0000010001002020040000000000E80200001600000028000000
      2000000040000000010004000000000000020000000000000000000000000000
      0000000000000000000080000080000000808000800000008000800080800000
      80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
      FFFFFF000000000000777777777777000000000000000000777788FFFF887777
      000000000000007778F8887117788F877700000000000778F87111111111178F
      877000000000778871111111111999178877000000077F811111111111199999
      18F7700000778811111111111119999991887700007881111111111111119199
      99188700077F711111811111111198719997F7700788111118FF111111118FF7
      1991887077F71111888FF1111118FFFF19997F77778111118888FF1111888FF8
      911918777881111118888FF1188888811111188778811111118888FF88888811
      111117877F7111111118888888888111111117F77F7999111111888888881111
      111111F77F7999991111788888F71111111111F77F7999999917888888FF7111
      111117F778879999917FFF88888FF111111117877887999997FFFFF88888FF11
      11111887778799997FFFFFF798888FF11111187777F87997FFFFFF71178F88FF
      71117F7707887997FFFFF7999978F88871118870077F87997FFF799999978F87
      1117F77000788879978799999999787111188700007788879999999999999999
      1188770000077F88799999999999999778F77000000077888879999999999778
      8877000000000778F88877799777788F877000000000007778F8888878888F87
      7700000000000000777788FFFF88777700000000000000000077777777777700
      00000000FFC003FFFF0000FFFC00003FF800001FF000000FE0000007C0000003
      C000000380000001800000010000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000080000001
      80000001C0000003C0000003E0000007F000000FF800001FFC00003FFF0000FF
      FFC003FF}
    ShowUnicode = False
    PostOnEnter = False
    ColWidths = (
      20
      64
      31
      63
      46
      64
      82
      65
      68
      64
      64
      30
      23
      43
      32
      25
      41
      51
      64)
    RowHeights = (
      33
      22)
  end
  object qryProdutosporCliente: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      '  select  sel.*'
      '  from'
      '  '
      '  ('
      '  '
      '  '
      '      ('
      '       select vendas.*,'
      '              cp.produto_cliente'
      '       from'
      '       ('
      '        select vendas.*,'
      '               n.serie,'
      '               n.numero as numeronota'
      '        from'
      '        ('
      '         select vendas.*,'
      '                cp.maquina,'
      '                cp.intervensao,'
      '                cp.numero as numerocupom'
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
      '                 pdf.dadofiscal,'
      '                 df.data,'
      '                 pdf.quantidade,'
      '                 pdf.produto,'
      '                 p.codigovisual as produtovisual,'
      '                 pdf.filial,'
      
        '                 cast(btrim(p.descricao ||'#39' '#39'||coalesce(p.valorg' +
        'rade1,'#39#39')||'#39' '#39'||coalesce(p.valorgrade2,'#39#39')) as varchar(162)) as ' +
        'descricao,'
      '                 pdf.precovenda,'
      '                 pdf.precotabela,'
      
        '                 pdf.quantidade*pdf.precovenda as totalprecovend' +
        'a,'
      
        '                 pdf.quantidade*pdf.precotabela as totalprecotab' +
        'ela,'
      '                 cast(null as date) as devolucao,'
      
        '                 coalesce(pdf.desconto,0)+coalesce(pdf.valordesc' +
        'ontoitem,0) as desconto,'
      '                 cast('#39'V'#39' as char) as registro,'
      
        '                 (select ipi.classificacaofiscal from ipi where ' +
        'ipi.codigo = c.ipi) as ncm'
      ''
      '                 '
      '          from (contratos ct'
      '                join (dadosfiscais df'
      '                      join (produtosdadosfiscais pdf'
      
        '                            join ((produtos p left join promocoe' +
        's pro on p.promocao = pro.codigo)'
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
      ''
      
        '                                  on c.codigo = p.caracteristica' +
        ')'
      '                            on pdf.produto = p.codigo)'
      '                      on pdf.dadofiscal = df.numero)'
      '                on df.contrato = ct.numero)'
      ''
      
        '          where /* ct.faturamento between (:Datainicial) and (:D' +
        'ataFinal) and */'
      '                ct.numero = df.contrato  and'
      '                ct.situacao in ('#39'N'#39','#39'P'#39') and'
      
        '                df.situacao='#39'N'#39' and not coalesce(df.notavinculad' +
        'a,false)'
      
        '                and case when ct.os then ct.tipoequipamento in (' +
        '1,2) and not (coalesce(ct.os_garantia,false) and ct.os_garantia_' +
        'status='#39'A'#39') and not coalesce(ct.os_cortesia,false) else true end'
      ''
      '                and ct.cliente = :cliente'
      '                and ct.tipocliente = :tipocliente'
      '                and pdf.produto = :produto'
      ''
      
        '         ) as vendas left join cupons cp on vendas.dadofiscal = ' +
        'cp.dadofiscal'
      
        '        ) as vendas left join notas n on vendas.dadofiscal = n.d' +
        'adofiscal'
      
        '       ) as vendas left join clientesprodutos cp on vendas.clien' +
        'te = cp.cliente'
      
        '                                                and vendas.tipoc' +
        'liente = cp.tipocliente'
      '                          and vendas.produto = cp.produto'
      '     )'
      '     '
      '     '
      '     '
      '     '
      '      union all'
      '      '
      '      '
      '      '
      '      '
      '      '
      '     ('
      '      select produtos.cliente,'
      '             produtos.tipocliente,'
      '             produtos.nomecliente,'
      '             produtos.contrato,'
      '             produtos.pedidocliente,'
      '             produtos.situacao,'
      '             produtos.faturamento,'
      '             produtos.filialvenda,'
      '             cast(null as integer) as dadofiscal,'
      '             cast(null as date) as data,'
      
        '             produtos.quantidade - produtos.quantidade_entregue ' +
        'as quantidade,'
      '             produtos.produto,'
      '             produtos.produtovisual,'
      '             produtos.filial,'
      '             produtos.descricao,                  '
      '             produtos.precovenda,'
      '             produtos.precotabela,'
      
        '             (produtos.quantidade - produtos.quantidade_entregue' +
        ') * produtos.precovenda as totalprecovenda,'
      
        '             (produtos.quantidade - produtos.quantidade_entregue' +
        ') * produtos.precotabela as totalprecotabela,'
      '             cast(null as date) as devolucao,'
      '             produtos.desconto,'
      '             produtos.registro,'
      '             produtos.ncm,'
      '             cast(null as integer) as maquina,'
      '             cast(null as integer) as intervensao,'
      '             cast(null as integer) as numerocupom,'
      '             cast(null as varchar(3)) as serie,'
      '             cast(null as integer) as numeronota,'
      '             cp.produto_cliente'
      '      from'
      '      ('
      '        select produtos.*'
      '        from'
      '        ('
      '         select ct.cliente,'
      '                ct.tipocliente,'
      '                ct.nome as nomecliente,'
      '                ct.numero as contrato,'
      '                ct.pedidocliente,'
      '                ct.situacao,'
      '                ct.faturamento,'
      '                ct.filialvenda,'
      '                pc.quantidade,'
      '                case when ct.situacao = '#39'P'#39' then'
      
        '                  produtoscontratos_qtdeentregue(coalesce(ct.pri' +
        'mogenito,ct.numero),pc.produto,pc.filial)'
      
        '                else cast(0 as Numeric(9,3)) end as quantidade_e' +
        'ntregue,'
      '                pc.produto,'
      '                p.codigovisual as produtovisual,'
      '                pc.filial,'
      
        '                cast(btrim(p.descricao ||'#39' '#39'||coalesce(p.valorgr' +
        'ade1,'#39#39')||'#39' '#39'||coalesce(p.valorgrade2,'#39#39')) as varchar(162)) as d' +
        'escricao,'
      '                pc.precovenda,'
      '                pc.precotabela,'
      ''
      
        '                rateardesconto(ct.numero, cast(pc.produto as big' +
        'int)) + coalesce(pc.valordescontoitem,0) as desconto,'
      '          cast('#39'V'#39' as char) as registro,'
      
        '               (select ipi.classificacaofiscal from ipi where ip' +
        'i.codigo = c.ipi) as ncm'
      ''
      '         from (contratos ct'
      '               join (produtoscontratos pc'
      
        '                     join ((produtos p left join promocoes pro o' +
        'n p.promocao = pro.codigo)'
      '                           join (((caracteristicas c'
      '                                   join grupos g'
      '                                   on c.grupo = g.codigo)'
      ''
      '                                   join classes cl'
      '                                   on c.classe = cl.codigo)'
      ''
      '                                   join marcas m'
      '                                   on c.marca = m.codigo)'
      ''
      '                           on c.codigo = p.caracteristica)'
      '                     on p.codigo = pc.produto)'
      '               on pc.contrato = ct.numero)'
      ''
      
        '         where /*ct.faturamento between (:DataInicial) and (:Dat' +
        'aFinal) and */'
      '               ct.situacao in ('#39'P'#39','#39'F'#39')'
      
        '               and case when ct.os then ct.tipoequipamento in (1' +
        ',2) and not (coalesce(ct.os_garantia,false) and ct.os_garantia_s' +
        'tatus='#39'A'#39') and not coalesce(ct.os_cortesia,false) else true end'
      '               '
      '               and ct.cliente = :cliente'
      '               and ct.tipocliente = :tipocliente'
      '               and pc.produto = :produto'
      ''
      ''
      '        ) as produtos'
      '        where (quantidade-quantidade_entregue)<>0'
      
        '      ) as produtos left join clientesprodutos cp on produtos.cl' +
        'iente = cp.cliente'
      
        '                                                 and produtos.ti' +
        'pocliente = cp.tipocliente'
      '                             and produtos.produto = cp.produto'
      '     )'
      '     '
      '     '
      '     '
      '     union all'
      '     '
      '     '
      '     '
      '     '
      '     ('
      '       select vendas.*,'
      '              cp.produto_cliente'
      '       from'
      '       ('
      '        select vendas.*,'
      '               n.serie,'
      '               n.numero as numeronota'
      '        from'
      '        ('
      '         select vendas.*,'
      '                cp.maquina,'
      '                cp.intervensao,'
      '                cp.numero as numerocupom'
      '         from'
      '         ('
      '          select df.cliente,'
      '                 df.tipocliente,'
      '                 df.nome as nomecliente,'
      '                 df.contrato,'
      '                 cast(null as varchar(35)) as pedidocliente,'
      '                 cast(null as char(1)) as situacao,'
      '                 df.data as faturamento,'
      '                 df.filialvenda,'
      '                 pdf.dadofiscal,'
      '                 df.data,'
      '                 pdf.quantidade,'
      '                 pdf.produto,'
      '                 p.codigovisual as produtovisual,'
      '                 pdf.filial,'
      
        '                 cast(btrim(p.descricao ||'#39' '#39'||coalesce(p.valorg' +
        'rade1,'#39#39')||'#39' '#39'||coalesce(p.valorgrade2,'#39#39')) as varchar(162)) as ' +
        'descricao,'
      '                 pdf.precovenda,'
      '                 pdf.precotabela,'
      
        '                 pdf.quantidade*pdf.precovenda as totalprecovend' +
        'a,'
      
        '                 pdf.quantidade*pdf.precotabela as totalprecotab' +
        'ela,'
      '                 cast(null as date) as devolucao,'
      
        '                     coalesce(pdf.desconto,0)+coalesce(pdf.valor' +
        'descontoitem,0) as desconto,'
      '                 cast('#39'V'#39' as char) as registro,'
      
        '                 (select ipi.classificacaofiscal from ipi where ' +
        'ipi.codigo = c.ipi) as ncm'
      ''
      '          from (dadosfiscais df'
      '            join (produtosdadosfiscais pdf'
      
        '              join ((produtos p left join promocoes pro on p.pro' +
        'mocao = pro.codigo)'
      '                join (((caracteristicas c'
      '                                    join grupos g'
      '                                    on c.grupo = g.codigo)'
      ''
      '                                    join classes cl'
      '                                    on c.classe = cl.codigo)'
      ''
      '                                    join marcas m'
      '                                    on c.marca = m.codigo)'
      ''
      '                on c.codigo = p.caracteristica)'
      '                      on pdf.produto = p.codigo)'
      '                on pdf.dadofiscal = df.numero)'
      ''
      '          where /*df.data between :Datainicial and :DataFinal'
      '            and */ df.contrato is null'
      '            and df.situacao='#39'N'#39
      '            and not coalesce(df.notavinculada,false)'
      ''
      
        '            and (eHNotaFiscalSaidaVenda(df.codigofiscal) or mod(' +
        'df.codigofiscal,1000) in (929))'
      ''
      '            and df.cliente     = :cliente'
      '            and df.tipocliente = :tipocliente'
      '            and pdf.produto    = :produto'
      ''
      
        '         ) as vendas left join cupons cp on vendas.dadofiscal = ' +
        'cp.dadofiscal'
      
        '        ) as vendas left join notas n on vendas.dadofiscal = n.d' +
        'adofiscal'
      
        '       ) as vendas left join clientesprodutos cp on vendas.clien' +
        'te = cp.cliente'
      
        '                                                and vendas.tipoc' +
        'liente = cp.tipocliente'
      '                          and vendas.produto = cp.produto'
      '     )'
      '   '
      '  ) as sel'
      '  order by faturamento desc  ')
    RequestLive = False
    Left = 40
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataFinal'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'cliente'
        ParamType = ptUnknown
        Value = '2'
      end
      item
        DataType = ftString
        Name = 'tipocliente'
        ParamType = ptUnknown
        Value = #39'C'#39
      end
      item
        DataType = ftString
        Name = 'produto'
        ParamType = ptUnknown
        Value = '96'
      end>
    object qryProdutosporClientecontrato: TStringField
      DisplayLabel = 'Contrato'
      FieldName = 'contrato'
    end
    object qryProdutosporClientesituacao: TStringField
      DisplayLabel = 'Sit.Contrato'
      FieldName = 'situacao'
      Size = 1
    end
    object qryProdutosporClientefaturamento: TDateField
      Alignment = taCenter
      DisplayLabel = 'Faturamento'
      FieldName = 'faturamento'
      EditMask = '99/99/9999;1; '
    end
    object qryProdutosporClientefilial: TIntegerField
      DisplayLabel = 'Filial Produto'
      FieldName = 'filial'
    end
    object qryProdutosporClientequantidade: TFloatField
      DisplayLabel = 'Qtdade'
      FieldName = 'quantidade'
      DisplayFormat = '0.00'
    end
    object qryProdutosporClienteprecovenda: TFloatField
      DisplayLabel = 'Pre'#231'o de Venda'
      FieldName = 'precovenda'
      DisplayFormat = '0.00'
    end
    object qryProdutosporClientetotalprecovenda: TFloatField
      DisplayLabel = 'Total Pre'#231'o de Venda'
      FieldName = 'totalprecovenda'
      DisplayFormat = '0.00'
    end
    object qryProdutosporClienteprecotabela: TFloatField
      DisplayLabel = 'Pre'#231'o de Tabela'
      FieldName = 'precotabela'
      DisplayFormat = '0.00'
    end
    object qryProdutosporClientetotalprecotabela: TFloatField
      DisplayLabel = 'Total Pre'#231'o Tabela'
      FieldName = 'totalprecotabela'
      DisplayFormat = '0.00'
    end
    object qryProdutosporClientedesconto: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'desconto'
      DisplayFormat = '0.00'
    end
    object qryProdutosporClientefilialvenda: TIntegerField
      DisplayLabel = 'Fil.Venda'
      FieldName = 'filialvenda'
    end
    object qryProdutosporClienteserie: TStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'serie'
      Size = 50
    end
    object qryProdutosporClientenumeronota: TIntegerField
      DisplayLabel = 'N'#186'Nota'
      FieldName = 'numeronota'
    end
    object qryProdutosporClientemaquina: TIntegerField
      DisplayLabel = 'M'#225'q.'
      FieldName = 'maquina'
    end
    object qryProdutosporClienteintervensao: TIntegerField
      DisplayLabel = 'Int.'
      FieldName = 'intervensao'
    end
    object qryProdutosporClientenumerocupom: TIntegerField
      DisplayLabel = 'Cupom'
      FieldName = 'numerocupom'
    end
    object qryProdutosporClienteproduto_cliente: TStringField
      DisplayLabel = 'Prod.Cliente'
      FieldName = 'produto_cliente'
      Size = 30
    end
    object qryProdutosporClientepedidocliente: TStringField
      DisplayLabel = 'Pedido Cliente'
      FieldName = 'pedidocliente'
      Size = 35
    end
  end
  object dsrProdutosporCliente: TtecDataSource
    DataSet = qryProdutosporCliente
    Left = 72
    Top = 40
  end
end
