inherited frmSelecionarFormaPagamentoTEFDiscado: TfrmSelecionarFormaPagamentoTEFDiscado
  Left = 358
  Top = 195
  Width = 306
  Height = 306
  HorzScrollBar.Range = 256
  HorzScrollBar.Visible = False
  VertScrollBar.Range = 81
  VertScrollBar.Visible = False
  ActiveControl = pgcFormaPag
  BorderIcons = []
  Caption = 'Selecionar forma de pagamento'
  FormStyle = fsStayOnTop
  PixelsPerInch = 96
  TextHeight = 16
  object pgcFormaPag: TtecPageControl
    Left = 0
    Top = 0
    Width = 286
    Height = 233
    ActivePage = tstCredito
    TabIndex = 0
    TabOrder = 0
    OnChange = pgcFormaPagChange
    OnChanging = pgcFormaPagChanging
    object tstCredito: TTabSheet
      BorderWidth = 3
      Caption = '  &Cr'#233'dito'
      object lblTotalSelecionadoCred: TLabel
        Left = 3
        Top = 177
        Width = 108
        Height = 16
        Alignment = taRightJustify
        Caption = 'Valor da transa'#231#227'o'
      end
      object dbgCredito: TStringGrid
        Left = 3
        Top = 2
        Width = 189
        Height = 168
        TabStop = False
        ColCount = 2
        DefaultColWidth = 80
        DefaultRowHeight = 19
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object edtTotalSelecionadoCred: TEditNumero
        Left = 115
        Top = 175
        Width = 139
        Height = 23
        AutoSize = False
        MaxLength = -1
        TabOrder = 1
        OnChange = edtTotalSelecionadoCredChange
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = False
        Tamanho = 9
      end
    end
    object tstDebito: TTabSheet
      BorderWidth = 3
      Caption = '  &Debito'
      ImageIndex = 1
      object lblTotalSelecionadoDeb: TLabel
        Left = 3
        Top = 177
        Width = 108
        Height = 16
        Alignment = taRightJustify
        Caption = 'Valor da transa'#231#227'o'
      end
      object dbgDebito: TStringGrid
        Left = 3
        Top = 2
        Width = 190
        Height = 168
        TabStop = False
        ColCount = 2
        DefaultColWidth = 80
        DefaultRowHeight = 19
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object edtTotalSelecionadoDeb: TEditNumero
        Left = 115
        Top = 175
        Width = 139
        Height = 23
        AutoSize = False
        MaxLength = -1
        TabOrder = 1
        OnChange = edtTotalSelecionadoDebChange
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = False
        Tamanho = 9
      end
    end
    object tstCDC: TTabSheet
      Caption = 'CDC'
      ImageIndex = 2
      object lblTotalSelecionadoCDC: TLabel
        Left = 3
        Top = 177
        Width = 108
        Height = 16
        Alignment = taRightJustify
        Caption = 'Valor da transa'#231#227'o'
      end
      object dbgCDC: TStringGrid
        Left = 3
        Top = 2
        Width = 189
        Height = 168
        TabStop = False
        ColCount = 2
        DefaultColWidth = 80
        DefaultRowHeight = 19
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object edtTotalSelecionadoCDC: TEditNumero
        Left = 115
        Top = 175
        Width = 139
        Height = 23
        AutoSize = False
        MaxLength = -1
        TabOrder = 1
        OnChange = edtTotalSelecionadoCDCChange
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = False
        Tamanho = 9
      end
    end
    object tstDinheiro: TTabSheet
      BorderWidth = 3
      Caption = '  Di&nheiro'
      ImageIndex = 3
      object lblValorDisponivelCartoes: TLabel
        Left = 4
        Top = 52
        Width = 133
        Height = 16
        Alignment = taRightJustify
        Caption = 'Valor disp. nos cart'#245'es'
      end
      object lblPagamentoDinheiro: TLabel
        Left = 39
        Top = 80
        Width = 98
        Height = 16
        Alignment = taRightJustify
        Caption = 'Pag. em dinheiro'
      end
      object lblPrestacaoDinheiro: TLabel
        Left = 7
        Top = 12
        Width = 130
        Height = 16
        Alignment = taRightJustify
        Caption = 'Presta'#231#227'o em dinheiro'
      end
      object edtPagamentoDinheiro: TEditNumero
        Left = 140
        Top = 77
        Width = 134
        Height = 24
        MaxLength = 11
        TabOrder = 1
        OnChange = edtPagamentoDinheiroChange
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = False
        Tamanho = 11
      end
      object edtValorDisponivelCartoes: TEditNumero
        Left = 140
        Top = 49
        Width = 134
        Height = 24
        TabStop = False
        Color = clBtnFace
        Enabled = False
        MaxLength = -1
        ReadOnly = True
        TabOrder = 2
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = False
        Tamanho = 9
      end
      object pnlDin: TPanel
        Left = 2
        Top = 39
        Width = 274
        Height = 3
        BevelOuter = bvLowered
        TabOrder = 3
      end
      object edtPrestacaoDinheiro: TEditNumero
        Left = 140
        Top = 9
        Width = 134
        Height = 24
        TabStop = False
        Color = clBtnFace
        Enabled = False
        MaxLength = 11
        ReadOnly = True
        TabOrder = 0
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = False
        Tamanho = 11
      end
    end
  end
  object bbnOK: TBitBtn
    Left = 62
    Top = 239
    Width = 83
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = bbnOKClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      04000000000068010000120B0000120B00001000000010000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object bbnCancelar: TBitBtn
    Left = 145
    Top = 239
    Width = 83
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    Kind = bkCancel
  end
end
