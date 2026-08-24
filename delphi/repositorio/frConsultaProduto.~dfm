object fraConsultaProduto: TfraConsultaProduto
  Left = 0
  Top = 0
  Width = 719
  Height = 89
  TabOrder = 0
  object gbxConsultaProduto: TGroupBox
    Left = 0
    Top = 0
    Width = 719
    Height = 43
    Align = alTop
    Caption = 'Item de Produto'
    TabOrder = 0
    inline fraConsultaItemProduto: TfraConsultaCodigo
      Left = 2
      Top = 15
      Width = 715
      Height = 23
      HorzScrollBar.Range = 497
      VertScrollBar.Range = 23
      Align = alTop
      AutoScroll = False
      AutoSize = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      inherited sbnProcura: TSpeedButton
        Left = 144
      end
      inherited dtxDescricao: TtecDBText
        Left = 168
        Width = 545
        DataField = 'descricao'
        DataSource = fraConsultaItemProduto.dsrProcuraItemProdutos
      end
      inherited edfCodigo: TtecDBFindLookup
        Width = 145
        OnFound = nil
        LookupaFieldinterno = 'produto'
        LookupaFieldVisual = 'produtovisual'
        LookupField = 'produtovisual'
        LookupSource = fraConsultaItemProduto.dsrProcuraItemProdutos
        LookupQueryParameter = 'produtovisual'
        Parameter = ' '
        ActiveSetControls = False
        DenyInsert = True
        NoSetControls = <>
        SetControls = <>
        LookupParameter = 'produtovisual'
      end
    end
  end
  object gbxLote: TGroupBox
    Left = 0
    Top = 43
    Width = 719
    Height = 43
    Align = alTop
    Caption = 'Lote'
    Constraints.MaxHeight = 43
    Constraints.MinHeight = 43
    TabOrder = 1
    inline fraConsultaLote: TfraConsultaCodigo
      Left = 2
      Top = 15
      Width = 715
      Height = 23
      HorzScrollBar.Range = 497
      VertScrollBar.Range = 23
      Align = alTop
      AutoScroll = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      inherited sbnProcura: TSpeedButton
        Left = 144
      end
      inherited dtxDescricao: TtecDBText
        Left = 169
        Width = 0
        Visible = False
      end
      inherited edfCodigo: TtecDBFindLookup
        Width = 145
        OnFound = nil
        LookupaFieldinterno = 'lote'
        LookupaFieldVisual = 'nrlote'
        LookupField = 'nrlote'
        LookupSource = fraConsultaLote.dsrProcuraLotesProdutos
        LookupQueryParameter = 'nrlote'
        Parameter = ' '
        ActiveSetControls = False
        DenyInsert = True
        NoSetControls = <>
        SetControls = <>
        LookupParameter = 'nrlote'
      end
    end
    object StaticText1: TStaticText
      Left = 172
      Top = 21
      Width = 68
      Height = 17
      Caption = 'Fabricado em'
      TabOrder = 1
    end
    object StaticText2: TStaticText
      Left = 358
      Top = 21
      Width = 51
      Height = 17
      Caption = 'V'#225'lido at'#233
      TabOrder = 2
    end
    object PlannerDBDatePickerFabricacao: TPlannerDBDatePicker
      Left = 249
      Top = 19
      Width = 96
      Height = 23
      Hint = 'Informe a data'
      TabStop = False
      AllowNumericNullValue = True
      AutoFocus = True
      Flat = False
      ShowModified = True
      ReturnIsTab = True
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Visible = True
      Version = '1.8.1.0'
      ButtonStyle = bsDropDown
      ButtonWidth = 16
      Etched = False
      Glyph.Data = {
        DA020000424DDA0200000000000036000000280000000D0000000D0000000100
        200000000000A402000000000000000000000000000000000000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F00000000000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000000000000000000000000000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F0000000000000000000000000000000000000000000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F0000000000000000000000000000000
        0000000000000000000000000000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000}
      Calendar = cal18_.Owner
      HideCalendarAfterSelection = True
      DataField = 'fabricacao'
      DataSource = fraConsultaLote.dsrProcuraLotesProdutos
      object cal18_: TPlannerCalendar
        Left = 0
        Top = 0
        Width = 180
        Height = 180
        EventDayColor = clBlack
        EventMarkerColor = clYellow
        EventMarkerShape = evsCircle
        BackgroundPosition = bpTiled
        BevelOuter = bvNone
        BorderWidth = 1
        Look = lookFlat
        DateDownColor = clNone
        DateHoverColor = clNone
        DayFont.Charset = DEFAULT_CHARSET
        DayFont.Color = clWindowText
        DayFont.Height = -11
        DayFont.Name = 'MS Sans Serif'
        DayFont.Style = []
        WeekFont.Charset = DEFAULT_CHARSET
        WeekFont.Color = clWindowText
        WeekFont.Height = -11
        WeekFont.Name = 'MS Sans Serif'
        WeekFont.Style = []
        WeekName = 'Wk'
        TextColor = clBlack
        SelectColor = clTeal
        SelectFontColor = clWhite
        InActiveColor = clGray
        HeaderColor = clNone
        FocusColor = clHighlight
        InversColor = clTeal
        WeekendColor = clRed
        NameOfDays.Monday = 'seg'
        NameOfDays.Tuesday = 'ter'
        NameOfDays.Wednesday = 'qua'
        NameOfDays.Thursday = 'qui'
        NameOfDays.Friday = 'sex'
        NameOfDays.Saturday = 's'#225'b'
        NameOfDays.Sunday = 'dom'
        NameOfMonths.January = 'jan'
        NameOfMonths.February = 'fev'
        NameOfMonths.March = 'mar'
        NameOfMonths.April = 'abr'
        NameOfMonths.May = 'mai'
        NameOfMonths.June = 'jun'
        NameOfMonths.July = 'jul'
        NameOfMonths.August = 'ago'
        NameOfMonths.September = 'set'
        NameOfMonths.October = 'out'
        NameOfMonths.November = 'nov'
        NameOfMonths.December = 'dez'
        NameOfMonths.UseIntlNames = True
        StartDay = 7
        TodayFormat = '"Today" DDD/mm, YYYY'
        Day = 29
        Month = 12
        Year = 1899
        TabOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        CaptionColor = clNone
        CaptionTextColor = clBlack
        LineColor = clGray
        Line3D = True
        GradientStartColor = clWhite
        GradientEndColor = clBtnFace
        GradientDirection = gdVertical
        MonthGradientStartColor = clNone
        MonthGradientEndColor = clNone
        MonthGradientDirection = gdHorizontal
        HintPrevYear = 'Previous Year'
        HintPrevMonth = 'Previous Month'
        HintNextMonth = 'Next Month'
        HintNextYear = 'Next Year'
        Version = '1.9.2.1'
      end
    end
    object PlannerDBDatePickerValidade: TPlannerDBDatePicker
      Left = 414
      Top = 19
      Width = 96
      Height = 23
      Hint = 'Informe a data'
      TabStop = False
      AllowNumericNullValue = True
      AutoFocus = True
      Flat = False
      ShowModified = True
      ReturnIsTab = True
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Visible = True
      Version = '1.8.1.0'
      ButtonStyle = bsDropDown
      ButtonWidth = 16
      Etched = False
      Glyph.Data = {
        DA020000424DDA0200000000000036000000280000000D0000000D0000000100
        200000000000A402000000000000000000000000000000000000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F00000000000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000000000000000000000000000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F0000000000000000000000000000000000000000000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F0000000000000000000000000000000
        0000000000000000000000000000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000}
      Calendar = cal18_.Owner
      HideCalendarAfterSelection = True
      DataField = 'validade'
      DataSource = fraConsultaLote.dsrProcuraLotesProdutos
      object cal18_: TPlannerCalendar
        Left = 0
        Top = 0
        Width = 180
        Height = 180
        EventDayColor = clBlack
        EventMarkerColor = clYellow
        EventMarkerShape = evsCircle
        BackgroundPosition = bpTiled
        BevelOuter = bvNone
        BorderWidth = 1
        Look = lookFlat
        DateDownColor = clNone
        DateHoverColor = clNone
        DayFont.Charset = DEFAULT_CHARSET
        DayFont.Color = clWindowText
        DayFont.Height = -11
        DayFont.Name = 'MS Sans Serif'
        DayFont.Style = []
        WeekFont.Charset = DEFAULT_CHARSET
        WeekFont.Color = clWindowText
        WeekFont.Height = -11
        WeekFont.Name = 'MS Sans Serif'
        WeekFont.Style = []
        WeekName = 'Wk'
        TextColor = clBlack
        SelectColor = clTeal
        SelectFontColor = clWhite
        InActiveColor = clGray
        HeaderColor = clNone
        FocusColor = clHighlight
        InversColor = clTeal
        WeekendColor = clRed
        NameOfDays.Monday = 'seg'
        NameOfDays.Tuesday = 'ter'
        NameOfDays.Wednesday = 'qua'
        NameOfDays.Thursday = 'qui'
        NameOfDays.Friday = 'sex'
        NameOfDays.Saturday = 's'#225'b'
        NameOfDays.Sunday = 'dom'
        NameOfMonths.January = 'jan'
        NameOfMonths.February = 'fev'
        NameOfMonths.March = 'mar'
        NameOfMonths.April = 'abr'
        NameOfMonths.May = 'mai'
        NameOfMonths.June = 'jun'
        NameOfMonths.July = 'jul'
        NameOfMonths.August = 'ago'
        NameOfMonths.September = 'set'
        NameOfMonths.October = 'out'
        NameOfMonths.November = 'nov'
        NameOfMonths.December = 'dez'
        NameOfMonths.UseIntlNames = True
        StartDay = 7
        TodayFormat = '"Today" DDD/mm, YYYY'
        Day = 29
        Month = 12
        Year = 1899
        TabOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        CaptionColor = clNone
        CaptionTextColor = clBlack
        LineColor = clGray
        Line3D = True
        GradientStartColor = clWhite
        GradientEndColor = clBtnFace
        GradientDirection = gdVertical
        MonthGradientStartColor = clNone
        MonthGradientEndColor = clNone
        MonthGradientDirection = gdHorizontal
        HintPrevYear = 'Previous Year'
        HintPrevMonth = 'Previous Month'
        HintNextMonth = 'Next Month'
        HintNextYear = 'Next Year'
        Version = '1.9.2.1'
      end
    end
  end
end
