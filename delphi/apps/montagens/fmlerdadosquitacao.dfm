inherited frmLerDadosQuitacao: TfrmLerDadosQuitacao
  Left = 414
  Top = 276
  ActiveControl = edtDataPagto
  Caption = ''
  ClientHeight = 100
  ClientWidth = 326
  PixelsPerInch = 96
  TextHeight = 16
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 0
    Width = 326
    Height = 100
    Align = alClient
    BorderWidth = 3
    TabOrder = 0
    object gbxFundoJanela: TGroupBox
      Left = 4
      Top = 12
      Width = 317
      Height = 85
      Constraints.MaxHeight = 85
      TabOrder = 0
      object lblDatadePagto: TLabel
        Left = 10
        Top = 32
        Width = 83
        Height = 16
        Alignment = taRightJustify
        Caption = 'Data de Pagto'
      end
      object bbnCancelar: TBitBtn
        Left = 227
        Top = 44
        Width = 75
        Height = 25
        Caption = '&Cancelar'
        TabOrder = 0
        Kind = bkCancel
      end
      object bbnOK: TBitBtn
        Left = 227
        Top = 10
        Width = 75
        Height = 25
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
      object pnlSeparador: TPanel
        Left = 213
        Top = 12
        Width = 3
        Height = 61
        BevelOuter = bvLowered
        TabOrder = 3
      end
      object edtDataPagto: TEditData
        Left = 104
        Top = 28
        Width = 89
        Height = 24
        TabOrder = 2
        Minimo = 37353
        Maximo = 0
      end
    end
  end
  object ecvValida: TtecEditionControlValidation
    EditionControl = <
      item
        Control = edtDataPagto
      end>
    Left = 16
    Top = 8
  end
end
