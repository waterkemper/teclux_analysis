inherited frmImportacaoConciliacao: TfrmImportacaoConciliacao
  Left = 48
  Top = 132
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  Caption = 'Importa'#231#227'o do arquivo OFX'
  ClientHeight = 602
  ClientWidth = 1365
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBarra: TPanel
    Left = 0
    Top = 602
    Width = 1365
    Height = 0
    Align = alBottom
  end
  inherited pnlTopMenu: TPanel
    Width = 1365
    inherited tblBarra: TToolBar
      Left = 306
      Width = 1059
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
      object sbnConsultaContratos: TSpeedButton
        Left = 84
        Top = 2
        Width = 77
        Height = 39
        Hint = 'Abre a Janela de Pagamentos ou Recebimentos'
        Caption = 'Documento'
        Flat = True
        Glyph.Data = {
          9E020000424D9E0200000000000036000000280000000E0000000E0000000100
          18000000000068020000C30E0000C30E00000000000000000000C0C0C0C8C8C8
          CACACACACACACACACAC9C9C9D0D0D0C3D5D5ABC6C6BCC2C2BAC5C5C9CECEC0BF
          BFC0C0C05C4AC1C1C19C9C9C9292929393939393939999997F8181994B4B9618
          184629295C2828846E6EC3C9C9C1C1C15C4ABFBFBF9C9C9C959C9C989C9C98A2
          A299A4A48797978A0404B05555B4BABA674E4EA69797C4C7C7C0C0C05C4AB8B8
          B8F0EFEFFFEEEEFFF9F9FFD8D8FFDBDBFFDCDC455454B1C1C1CAC7C73338389B
          9F9FC5C5C5C0C0C05C4AB8BABAE2DFDFFFC0C0FFD4D4FF9696FF9C9CAA616100
          0000151515CECFCFE3E3E3686868B8B8B8C3C3C35C4AB8B9B9E2E0E0FFCACAFF
          DBDBFFA6A6FFACAC4A3A3A0000004C4C4CF4F4F4F8F7F7A09F9F838383CCCCCC
          5C4AB8B9B9E2E0E0FFCECEFFDEDEFFAFAFFFB2B2442E2E000000373737BBC3C3
          E6CACA7E6D6DA9ADADC7C6C65C4AB8B9B9E2E0E0FFCECEFFDEDEFFAEAEFFB4B4
          5347470000000000000100009FA2A2939494949494CACACA5C4AB8BABAE2E0E0
          FFC5C5FFDBDBFF9E9EFFA3A3C26C6C0500000000000000000000001F1F1F4F4F
          4FD9D9D95C4AB8B9B9E2E1E1FFE1E1FFE2E2FFCFCFFFD3D3FFE7E7CAC8C85656
          561F1F1F2D2D2D505050BABABAC5C5C55C4AB8BABAE2E3E3FF9696FF6B6BFF6F
          6FFF8989F8FDFDB0B1B19898986A6A6ADADADACFCFCFC5C5C5BFBFBF5C4AB8B9
          B9E4E4E4FFCFCFFFBDBDFFBDBDFFC9C9FCFEFEBCBDBD535353ADADADC8C8C8C0
          C0C0C0C0C0C0C0C05C4ABAB9B9DDDDDDF3FCFCF2FFFFF2FFFFF3FDFDF2F1F191
          9090A7A7A7CCCCCCBFBFBFC0C0C0C0C0C0C0C0C05C4AC0C0C0BFBFBFBFBFBFBE
          BEBEBEBEBEBFBFBFBDBDBDBFBFBFC7C7C7BFBFBFC0C0C0C0C0C0C0C0C0C0C0C0
          5C4A}
        Layout = blGlyphTop
        Spacing = 0
        OnClick = sbnConsultaContratosClick
      end
    end
    inherited tblBarraCadastro: TToolBar
      Width = 306
      inherited sbnIncluir: TSpeedButton
        Visible = False
      end
      inherited sbnExcluir: TSpeedButton
        Visible = False
      end
      object sbnGerar: TSpeedButton
        Left = 225
        Top = 2
        Width = 81
        Height = 39
        Hint = 'Seleciona os contratos em aberto'
        Caption = 'Gerar F6'
        Flat = True
        Glyph.Data = {
          DE030000424DDE03000000000000360000002800000011000000120000000100
          180000000000A8030000120B0000120B00000000000000000000DCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DC00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC80878000
          0000808780DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC00DCDC
          DCDCDCDCDCDCDC80878000000080878000000000FFFF00000080878000000080
          8780DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDC00000000FF
          FF80878000000000FFFF00000080878000FFFF000000DCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDC00DCDCDCDCDCDC00000080878080878000FFFF00FFFF00FFFF00FF
          FF00FFFF808780808780000000DCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDC
          80878000000000000000FFFF80878000000080878000FFFF0000000000008087
          80DCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDC00000000FFFF00FFFF00FFFF
          000000FFFFFF00000000FFFF00FFFF00FFFF000000DCDCDCDCDCDCDCDCDCDCDC
          DC00DCDCDCDCDCDC80878000000000000000FFFF80878000000080878000FFFF
          000000000000808780DCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDC80
          878080878000FFFF00FFFF00FFFF00FFFF00FFFF808780808780DCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDC00000000FFFF80878000000000
          FFFF00000080878000FFFF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC00DCDC
          DCDCDCDCDCDCDC80878000000080878000000000FFFF00000080878000000080
          8780DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDC808780000000808780DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDC00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DC00}
        Layout = blGlyphTop
        Spacing = 0
        OnClick = sbnGerarClick
      end
    end
  end
  object pnlImportacao: TPanel
    Left = 0
    Top = 217
    Width = 659
    Height = 385
    Align = alLeft
    TabOrder = 3
    object dbgImportacao: TDBAdvGrid
      Left = 1
      Top = 1
      Width = 657
      Height = 383
      Cursor = crDefault
      Align = alClient
      ColCount = 9
      DefaultRowHeight = 19
      RowCount = 2
      FixedRows = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
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
      FixedFooters = 1
      FixedColWidth = 20
      FixedRowHeight = 19
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -11
      FixedFont.Name = 'Tahoma'
      FixedFont.Style = [fsBold]
      FloatFormat = '%.2f'
      FloatingFooter.Visible = True
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
      SearchFooter.Font.Charset = DEFAULT_CHARSET
      SearchFooter.Font.Color = clWindowText
      SearchFooter.Font.Height = -11
      SearchFooter.Font.Name = 'MS Sans Serif'
      SearchFooter.Font.Style = []
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
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -12
          HeaderFont.Name = 'helvetica'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = []
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clBlack
          PrintFont.Height = -12
          PrintFont.Name = 'helvetica'
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
          FieldName = 'sequencial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Header = 'N.'
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -9
          HeaderFont.Name = 'helvetica'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clBlack
          PrintFont.Height = -12
          PrintFont.Name = 'helvetica'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = []
          Width = 27
        end
        item
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Header = 'DOCUMENTO'
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -9
          HeaderFont.Name = 'helvetica'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clBlack
          PrintFont.Height = -12
          PrintFont.Name = 'helvetica'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = []
          Width = 115
        end
        item
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Header = 'DATA'
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -9
          HeaderFont.Name = 'helvetica'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clBlack
          PrintFont.Height = -12
          PrintFont.Name = 'helvetica'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = []
          Width = 70
        end
        item
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'tipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Header = 'T'
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -9
          HeaderFont.Name = 'helvetica'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clBlack
          PrintFont.Height = -12
          PrintFont.Name = 'helvetica'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = []
          Width = 17
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Header = 'VALOR'
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -9
          HeaderFont.Name = 'helvetica'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clBlack
          PrintFont.Height = -12
          PrintFont.Name = 'helvetica'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = []
          Width = 73
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'totalconciliado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Header = 'CONCILIADO'
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -9
          HeaderFont.Name = 'helvetica'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clBlack
          PrintFont.Height = -11
          PrintFont.Name = 'helvetica'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = []
          Width = 73
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'Saldo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Header = 'SALDO'
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -9
          HeaderFont.Name = 'helvetica'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clBlack
          PrintFont.Height = -11
          PrintFont.Name = 'helvetica'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = []
          Width = 68
        end
        item
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'descricao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Header = 'DESCRI'#199#195'O'
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -9
          HeaderFont.Name = 'helvetica'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clBlack
          PrintFont.Height = -12
          PrintFont.Name = 'helvetica'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = []
          Width = 165
        end>
      DataSource = dtmImportacaoConciliacao.dsrconciliacaoextrato
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
      UseDBFieldWidths = True
      PostOnEnter = False
      ColWidths = (
        20
        27
        115
        70
        17
        73
        73
        68
        165)
    end
  end
  object gbxLancamentosaImportar: TGroupBox
    Left = 0
    Top = 45
    Width = 1365
    Height = 172
    Align = alTop
    Caption = 'EXTRATO BANC'#193'RIO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object gbxParametros: TGroupBox
      Left = 2
      Top = 110
      Width = 1361
      Height = 60
      Align = alBottom
      Caption = 'PAR'#194'METROS'
      TabOrder = 2
      object gbxDias: TGroupBox
        Left = 2
        Top = 16
        Width = 135
        Height = 42
        Align = alLeft
        Caption = 'Dias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object edtDiasAcima: TSpinEdit
          Left = 84
          Top = 14
          Width = 44
          Height = 23
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 0
          OnChange = edtDiasAcimaChange
        end
        object StaticText6: TStaticText
          Left = 5
          Top = 12
          Width = 10
          Height = 26
          Alignment = taCenter
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object StaticText7: TStaticText
          Left = 67
          Top = 12
          Width = 15
          Height = 26
          Alignment = taCenter
          Caption = '+'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object edtDiasAbaixo: TSpinEdit
          Left = 19
          Top = 14
          Width = 45
          Height = 23
          MaxValue = 0
          MinValue = 0
          TabOrder = 0
          Value = 10
          OnChange = edtDiasAbaixoChange
        end
      end
      object gbxPercentualsobreoValor: TGroupBox
        Left = 137
        Top = 16
        Width = 132
        Height = 42
        Align = alLeft
        Caption = '% Sobre o Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Visible = False
        object edtPercentualValorAcima: TSpinEdit
          Left = 86
          Top = 16
          Width = 41
          Height = 23
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 10
          OnChange = edtPercentualValorAcimaChange
        end
        object lblDiasAntes: TStaticText
          Left = 12
          Top = 13
          Width = 10
          Height = 26
          Alignment = taCenter
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object edtPercentualValorAbaixo: TSpinEdit
          Left = 26
          Top = 16
          Width = 41
          Height = 23
          MaxValue = 0
          MinValue = 0
          TabOrder = 0
          Value = 10
          OnChange = edtPercentualValorAbaixoChange
        end
        object lblDiasDepois: TStaticText
          Left = 70
          Top = 13
          Width = 15
          Height = 26
          Alignment = taCenter
          Caption = '+'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
      end
      object gbxFornecedor: TGroupBox
        Left = 473
        Top = 16
        Width = 515
        Height = 42
        Caption = 'Cliente ou Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Visible = False
        inline fraConsultaFornecedor: TfraConsultaCodigo
          Left = 6
          Top = 15
          Width = 472
          Height = 22
          HorzScrollBar.Range = 631
          HorzScrollBar.Visible = False
          VertScrollBar.Range = 23
          VertScrollBar.Visible = False
          AutoScroll = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          inherited sbnProcura: TSpeedButton
            Left = 80
          end
          inherited dtxDescricao: TtecDBText
            Left = 104
            Top = -1
            Width = 369
            DataField = 'nome'
            DataSource = fraConsultaFornecedor.dsrProcuraCliente
          end
          inherited edfCodigo: TtecDBFindLookup
            Width = 81
            DataField = 'codigo'
            DataSource = fraConsultaFornecedor.dsrProcuraCliente
            Group = 'FORNECEDOR'
            MaxLength = 6
            OnFound = nil
            Operacao = opPESQUISA
            Parameter = 'codigo'
            ActiveSetControls = False
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
          end
        end
        object ckbAplicaouNaoFiltroFornecedor: TCheckBox
          Left = 488
          Top = 19
          Width = 17
          Height = 17
          TabOrder = 1
        end
      end
      object btnRefazeraConsulta: TBitBtn
        Left = 272
        Top = 24
        Width = 161
        Height = 25
        Caption = 'Atualizar a Consulta'
        TabOrder = 2
        OnClick = btnRefazeraConsultaClick
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDC808080000000808080DCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A058
          5858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC80808000000080808000000000FFFF000000808080000000808080DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858A0A0A0585858FF
          FFFF585858A0A0A0585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC00000000FFFF80808000000000FFFF00000080808000FFFF000000DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCA0A0A0585858DC
          DCDC585858A0A0A0DCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC80808080808000FFFF00FFFF00FFFF00FFFF00FFFF808080808080DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0A0A0A0DCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCA0A0A0A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          80808000000000000000FFFF80808000000080808000FFFF0000000000008080
          80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858585858DCDCDCA0A0A058
          5858A0A0A0DCDCDC585858585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
          00000000FFFF00FFFF00FFFF000000DCDCDC00000000FFFF00FFFF00FFFF0000
          00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCDCDCDCDCDCDC585858DC
          DCDC585858FFFFFFDCDCDCDCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
          80808000000000000000FFFF80808000000080808000FFFF0000000000008080
          80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858585858DCDCDCA0A0A058
          5858A0A0A0DCDCDC585858585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC80808080808000FFFF00FFFF00FFFF00FFFF00FFFF808080808080DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0A0A0A0DCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCA0A0A0A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC00000000FFFF80808000000000FFFF00000080808000FFFF000000DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCA0A0A0585858DC
          DCDC585858A0A0A0DCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC80808000000080808000000000FFFF000000808080000000808080DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858A0A0A0585858FF
          FFFF585858A0A0A0585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDC808080000000808080DCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A058
          5858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
        NumGlyphs = 2
      end
    end
    object StaticText9: TStaticText
      Left = 1000
      Top = 20
      Width = 42
      Height = 20
      Caption = 'Status'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object dtxStatus: TtecDBText
      Left = 1000
      Top = 40
      Width = 169
      Height = 32
      TabStop = False
      Color = clBtnFace
      DataField = 'status'
      DataSource = dtmImportacaoConciliacao.dsrConciliacao
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -20
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      Alignment = taLeftJustify
    end
    inline fraLerContaCorrenteSaldo1: TfraLerContaCorrenteSaldo
      Left = 497
      Top = 16
      Width = 494
      Height = 94
      HorzScrollBar.Range = 691
      HorzScrollBar.Visible = False
      VertScrollBar.Range = 109
      VertScrollBar.Visible = False
      Align = alLeft
      AutoScroll = False
      Color = clBtnFace
      ParentColor = False
      TabOrder = 1
      inherited gbxContaCorrente: TGroupBox
        Left = 0
        Top = 0
        Width = 489
        Height = 109
        Font.Height = -11
        inherited gbxBanco: TGroupBox
          Height = 36
          Caption = 'BANCO'
          Font.Height = -9
          inherited dtxSigla: TtecDBText
            Top = 10
            Width = 164
          end
        end
        inherited gbxAgencia: TGroupBox
          Width = 298
          Height = 36
          Caption = 'AG'#202'NCIA'
          Font.Height = -9
          inherited dtxNomeAgencia: TtecDBText
            Top = 10
          end
        end
        inherited gbxTitular: TGroupBox
          Top = 56
          Height = 36
          Caption = 'TITULAR'
          Font.Height = -9
          inherited dtxTitular: TtecDBText
            Top = 10
            Width = 292
          end
        end
        inherited gbxSaldo: TGroupBox
          Left = 518
          Height = 36
          Caption = 'SALDO LAN'#199'ADO AT'#201
          Font.Height = -9
          Visible = False
          inherited dtxSaldo: TDBEditNumero
            Top = 12
          end
        end
        inherited gbxConta: TGroupBox
          Top = 55
          Height = 36
          Caption = 'N'#186' DA CONTA'
          Font.Height = -9
          inherited sbnProcurarConta: TSpeedButton
            Top = 9
            Height = 24
            OnClick = fraLerContaCorrenteSaldo1sbnProcurarContaClick
          end
          inherited lblDigito: TLabel
            Top = 11
            Height = 18
            Font.Height = -16
          end
          inherited edfConta: TtecDbEditFind
            Top = 10
            Font.Height = -12
            Group = 'Conta'
            Parameter = 'Conta'
            ActiveSetControls = False
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
          end
          inherited dtxDigito: TtecDBText
            Top = 10
            Height = 23
            Font.Height = -12
          end
        end
      end
      inherited dsrProcuraContas: TtecDataSource
        DataSet = dtmImportacaoConciliacao.qryProcuraContas
        Left = 408
      end
    end
    object pgcSelecaoDados: TPageControl
      Left = 2
      Top = 16
      Width = 495
      Height = 94
      ActivePage = tstSelecaoPorPeriodo
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnChange = pgcSelecaoDadosChange
      object tstSelecaoPorPeriodo: TTabSheet
        Caption = 'SELE'#199#195'O POR PER'#205'ODO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        object gbxPeriodo: TGroupBox
          Left = 6
          Top = 0
          Width = 161
          Height = 36
          Caption = 'PER'#205'ODO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object lblA: TLabel
            Left = 77
            Top = 15
            Width = 7
            Height = 15
            Caption = 'a'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
          end
          object edtDataFinal: TEditData
            Left = 88
            Top = 10
            Width = 70
            Height = 23
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = 10
            ParentFont = False
            TabOrder = 1
            Minimo = 3650
            Maximo = 37353
          end
          object edtDataInicial: TEditData
            Left = 2
            Top = 10
            Width = 70
            Height = 23
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = 10
            ParentFont = False
            TabOrder = 0
            Minimo = 3650
            Maximo = 37353
          end
        end
      end
      object tstImportacaoOFX: TTabSheet
        Caption = 'IMPORTA'#199#195'O DO ARQUIVO OFX'
        ImageIndex = 1
        object btnSelecionarARquivoImportacao: TSpeedButton
          Left = 444
          Top = -1
          Width = 29
          Height = 24
          Glyph.Data = {
            AA030000424DAA03000000000000360000002800000011000000110000000100
            1800000000007403000000000000000000000000000000000000000000000000
            0101010101010000000000000000000101010000000000000000000000000000
            0000000000000000000000000000000000010101010101010101010101010101
            0101010101010101010101010000000000000000000000000000000002050206
            1100000000010101010101010101010101010101010101010101010101000000
            00000000000000000000000000010220389014245F0000000000000000000000
            0000000000000000000000000000000000000000281B0C5D4B364836220C0100
            112D891D31800000000000000000000000000000000000000000000000000000
            00000000004A341BDED2B7F0E7D1EBE1C9A28C65282B56000003000000000209
            0D2791B131B2E02FAAD82FADD92FABD92FABD92AB5E5366A6EE1CAACF9F5E0E5
            DECAE8E1CBFFFFFF7E633A0000000000000008202938CDFE35C3FA33C0F934BF
            F834C0F935C0F82AC6FF596E6CF7E4C7E3DDC6E4DDC9E3DCC6F7F2DDC4B8A100
            0000000000000C2B3A37C6FF32B6ED32B5ED32B3ED32B6EC33B4EA2BBFFE4262
            64EDD6BAEBE6D1E4DDC7E2DBC5FFFFF39C896C000000000000000F384738CCFF
            34B6EC33B5ED32B6ED31B7ED32B3ED2FBEF82A99C08B603AFFF7DDF8F5E0FDF6
            E1ECDBC0412C120000000000000011435538CDFF33B6ED34B6ED32B6ED32B6EE
            31B6ED33B5EC2DC4FF2D8FB16D5135AC836194775641341F0000000000000000
            0000185A7039CEFF33B3EE34B6EF34B6ED34B6EE32B5EC32B6ED33B3EB2FC2FF
            27BEF81D98BB25BAE4126E93000000010000000000001F76893BD6FF34B6ED34
            B9EF34B8EE34BAEE34B8EF32BAED33B7ED32B7ED33BBF132BFF737CEFF2896B9
            00000000000001010100144A5330B0E530ADED2EACE930ABE92FAAE82FACEA30
            ACEC2FADEC30ADEB2FADEA31AFF131B1E9195D6F000000000000010101000000
            00113E6A288FEB2684DD2582DB2C96FB2C9AFF2A97F92B97FA2A98FC2B96F930
            A8FF1240610000000000000101010101010000000013436F2B9AFE2890EE2D9C
            F919588D010307020A11030A11020A11030A11030D1500000000000001010101
            01010101010000000001070C0B29430C2A460517270000000000000000000000
            0000000000000000000000000000000000000001010101010100000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000}
          OnClick = btnSelecionarARquivoImportacaoClick
        end
        object lblCaminhodoArquivoImportacao: TStaticText
          Left = 3
          Top = 4
          Width = 42
          Height = 18
          Caption = 'Arquivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object StaticText2: TStaticText
          Left = 10
          Top = 28
          Width = 35
          Height = 18
          Caption = 'Banco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object dtxBanco: TtecDBText
          Left = 49
          Top = 23
          Width = 108
          Height = 22
          TabStop = False
          Color = clBtnFace
          DataField = 'sigla'
          DataSource = dtmImportacaoConciliacao.dsrContaConciliacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          Alignment = taLeftJustify
        end
        object StaticText1: TStaticText
          Left = 24
          Top = 47
          Width = 21
          Height = 18
          Caption = 'Ag.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object dtxNome: TtecDBText
          Left = 49
          Top = 44
          Width = 109
          Height = 22
          TabStop = False
          Color = clBtnFace
          DataField = 'nome'
          DataSource = dtmImportacaoConciliacao.dsrContaConciliacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
          Alignment = taLeftJustify
        end
        object StaticText3: TStaticText
          Left = 209
          Top = 25
          Width = 20
          Height = 18
          Caption = 'Cta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object dtxConta: TtecDBText
          Left = 233
          Top = 22
          Width = 98
          Height = 22
          TabStop = False
          Color = clBtnFace
          DataField = 'conta'
          DataSource = dtmImportacaoConciliacao.dsrConciliacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
          Alignment = taLeftJustify
        end
        object dtxSaldoFinal: TtecDBText
          Left = 232
          Top = 44
          Width = 98
          Height = 22
          TabStop = False
          Color = clBtnFace
          DataField = 'saldo'
          DataSource = dtmImportacaoConciliacao.dsrConciliacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
          Alignment = taLeftJustify
        end
        object StaticText4: TStaticText
          Left = 340
          Top = 25
          Width = 28
          Height = 18
          Caption = 'In'#237'cio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
        object dtxDataInicial: TtecDBText
          Left = 370
          Top = 22
          Width = 71
          Height = 22
          TabStop = False
          Color = clBtnFace
          DataField = 'datainicial'
          DataSource = dtmImportacaoConciliacao.dsrConciliacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
          Alignment = taLeftJustify
        end
        object StaticText5: TStaticText
          Left = 337
          Top = 47
          Width = 20
          Height = 18
          Caption = 'Fim'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 11
        end
        object dtxDataFinal: TtecDBText
          Left = 370
          Top = 44
          Width = 71
          Height = 22
          TabStop = False
          Color = clBtnFace
          DataField = 'datafinal'
          DataSource = dtmImportacaoConciliacao.dsrConciliacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 12
          Alignment = taLeftJustify
        end
        object StaticText8: TStaticText
          Left = 169
          Top = 47
          Width = 56
          Height = 18
          Caption = 'Saldo Final'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 13
        end
        object edtCaminhodoArquivoImportacao: TEditTexto
          Left = 49
          Top = 0
          Width = 392
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          TabOrder = 1
          CharCasenoDefault = False
          Alignment = taLeftJustify
        end
      end
    end
  end
  object dbgconciliacaoextratoitems: TDBAdvGrid
    Left = 659
    Top = 217
    Width = 706
    Height = 385
    Cursor = crDefault
    Align = alClient
    ColCount = 9
    RowCount = 2
    FixedRows = 1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 4
    ActiveRowShow = True
    OnCanClickCell = dbgconciliacaoextratoitemsCanClickCell
    OnCheckBoxClick = dbgconciliacaoextratoitemsCheckBoxClick
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
    FixedRowHeight = 22
    FixedFont.Charset = DEFAULT_CHARSET
    FixedFont.Color = clWindowText
    FixedFont.Height = -11
    FixedFont.Name = 'Tahoma'
    FixedFont.Style = [fsBold]
    FloatFormat = '%.2f'
    FloatingFooter.CalculateHiddenRows = False
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
    SizeWithForm = True
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
        ReadOnly = True
        Width = 20
      end
      item
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'operacao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Header = 'OPERA'#199#195'O'
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -9
        HeaderFont.Name = 'helvetica'
        HeaderFont.Pitch = fpVariable
        HeaderFont.Style = []
        HeaderAlignment = taCenter
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'helvetica'
        PrintFont.Pitch = fpVariable
        PrintFont.Style = []
        ReadOnly = True
        Width = 78
      end
      item
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        EditLength = 50
        FieldName = 'documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Header = 'DOCUMENTO'
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -9
        HeaderFont.Name = 'helvetica'
        HeaderFont.Pitch = fpVariable
        HeaderFont.Style = []
        HeaderAlignment = taCenter
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'MS Sans Serif'
        PrintFont.Pitch = fpVariable
        PrintFont.Style = []
        ReadOnly = True
        Width = 66
      end
      item
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Header = 'DATA'
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clBlack
        HeaderFont.Height = -9
        HeaderFont.Name = 'helvetica'
        HeaderFont.Pitch = fpVariable
        HeaderFont.Style = []
        HeaderAlignment = taCenter
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clBlack
        PrintFont.Height = -11
        PrintFont.Name = 'helvetica'
        PrintFont.Pitch = fpVariable
        PrintFont.Style = []
        ReadOnly = True
        Width = 61
      end
      item
        Alignment = taRightJustify
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Header = 'VALOR'
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clBlack
        HeaderFont.Height = -9
        HeaderFont.Name = 'helvetica'
        HeaderFont.Pitch = fpVariable
        HeaderFont.Style = []
        HeaderAlignment = taCenter
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clBlack
        PrintFont.Height = -11
        PrintFont.Name = 'helvetica'
        PrintFont.Pitch = fpVariable
        PrintFont.Style = []
        ReadOnly = True
        Width = 59
      end
      item
        Alignment = taCenter
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        Editor = edCheckBox
        FieldName = 'conciliar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Header = 'CONCILIAR'
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clBlack
        HeaderFont.Height = -9
        HeaderFont.Name = 'helvetica'
        HeaderFont.Pitch = fpVariable
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clBlack
        PrintFont.Height = -11
        PrintFont.Name = 'helvetica'
        PrintFont.Pitch = fpVariable
        PrintFont.Style = []
        Width = 47
      end
      item
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'evento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Header = 'EVENTO'
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clBlack
        HeaderFont.Height = -9
        HeaderFont.Name = 'helvetica'
        HeaderFont.Pitch = fpVariable
        HeaderFont.Style = []
        HeaderAlignment = taCenter
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clBlack
        PrintFont.Height = -11
        PrintFont.Name = 'helvetica'
        PrintFont.Pitch = fpVariable
        PrintFont.Style = []
        ReadOnly = True
        Width = 45
      end
      item
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'descricaoevento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Header = 'DESCRI'#199#195'O DO EVENTO'
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clBlack
        HeaderFont.Height = -9
        HeaderFont.Name = 'helvetica'
        HeaderFont.Pitch = fpVariable
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clBlack
        PrintFont.Height = -11
        PrintFont.Name = 'helvetica'
        PrintFont.Pitch = fpVariable
        PrintFont.Style = []
        ReadOnly = True
        Width = 133
      end
      item
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        Editor = edMemoDropDown
        FieldName = 'observacoes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Header = 'OBSERVA'#199#213'ES'
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clBlack
        HeaderFont.Height = -9
        HeaderFont.Name = 'helvetica'
        HeaderFont.Pitch = fpVariable
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clBlack
        PrintFont.Height = -11
        PrintFont.Name = 'helvetica'
        PrintFont.Pitch = fpVariable
        PrintFont.Style = []
        ReadOnly = True
        Width = 175
      end>
    DataSource = dtmImportacaoConciliacao.dsrMovtosBancosEventos
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
    ShowMemoFields = True
    ShowBooleanFields = True
    ShowUnicode = False
    UseDBFieldWidths = True
    PostOnEnter = False
    ColWidths = (
      20
      78
      66
      61
      59
      47
      45
      133
      175)
  end
  object OpenDialogImportacao: TOpenDialog
    DefaultExt = '*.ofx'
    Filter = '*.ofx|*.ofx'
    Left = 1130
    Top = 5
  end
end
