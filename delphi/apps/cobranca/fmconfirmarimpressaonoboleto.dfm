inherited frmConfirmarImpressaonoboleto: TfrmConfirmarImpressaonoboleto
  Left = 1136
  Top = 289
  ActiveControl = ckbImprimirRelatorio
  Caption = 'Boleto ou Relat'#243'rio'
  ClientHeight = 107
  ClientWidth = 189
  KeyPreview = False
  PixelsPerInch = 96
  TextHeight = 16
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 0
    Width = 189
    Height = 107
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 0
    object gbxFundoJanela: TGroupBox
      Left = 3
      Top = 3
      Width = 183
      Height = 101
      Align = alClient
      TabOrder = 0
      object ckbImprimirRelatorio: TCheckBox
        Left = 30
        Top = 33
        Width = 122
        Height = 17
        Caption = 'Imprimir Relat'#243'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object bbnOK: TBitBtn
        Left = 5
        Top = 65
        Width = 85
        Height = 26
        Caption = '&OK'
        Default = True
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
        Left = 89
        Top = 65
        Width = 85
        Height = 26
        Caption = '&Cancelar'
        TabOrder = 2
        Kind = bkCancel
      end
      object TPanel
        Left = 3
        Top = 54
        Width = 206
        Height = 4
        BevelOuter = bvLowered
        TabOrder = 3
      end
      object ckbImprimirBoleto: TCheckBox
        Left = 30
        Top = 13
        Width = 105
        Height = 18
        Caption = 'Imprimir Boleto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
    end
  end
end
