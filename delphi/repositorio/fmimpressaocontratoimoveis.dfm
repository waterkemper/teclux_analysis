object frmimpressaocontratoimoveis: Tfrmimpressaocontratoimoveis
  Left = 638
  Top = 231
  ActiveControl = bbnOK
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Impress'#227'o'
  ClientHeight = 205
  ClientWidth = 224
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poOwnerFormCenter
  Scaled = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gbxFundoJanela: TGroupBox
    Left = 0
    Top = 0
    Width = 224
    Height = 205
    Align = alClient
    TabOrder = 0
    object bbnOK: TBitBtn
      Left = 20
      Top = 165
      Width = 85
      Height = 26
      Caption = '&OK'
      Default = True
      TabOrder = 3
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
      Left = 120
      Top = 165
      Width = 85
      Height = 26
      Caption = '&Cancelar'
      TabOrder = 4
      Kind = bkCancel
    end
    object pnlHorizontal: TPanel
      Left = 10
      Top = 152
      Width = 205
      Height = 4
      BevelOuter = bvLowered
      TabOrder = 2
    end
    object gbxExtrato: TGroupBox
      Left = 108
      Top = 12
      Width = 109
      Height = 128
      Caption = ' EXTRATO '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object gbxData: TGroupBox
        Left = 13
        Top = 13
        Width = 75
        Height = 36
        Caption = ' NA DATA '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Microsoft Sans Serif'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object edtData: TEditData
          Left = 2
          Top = 10
          Width = 70
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Minimo = 37353
          Maximo = 0
        end
      end
      object rbnParaCliente: TtecRadioButton
        Left = 8
        Top = 64
        Width = 97
        Height = 17
        Caption = 'Para Cliente'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        TabStop = True
      end
      object rbnSimplificado: TtecRadioButton
        Left = 8
        Top = 84
        Width = 97
        Height = 17
        Caption = 'Simplificado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object rbnCompleto: TtecRadioButton
        Left = 8
        Top = 104
        Width = 97
        Height = 17
        Caption = 'Completo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
    end
    object rgpSelecionar: TtecDBRadioGroup
      Left = 12
      Top = 12
      Width = 89
      Height = 91
      Caption = ' IMPRIMIR '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = False
      object rbnExtrato: TtecRadioButton
        Left = 8
        Top = 17
        Width = 78
        Height = 17
        Caption = '&Extrato'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = True
        Value = 'E'
      end
      object rbnContrato: TtecRadioButton
        Left = 8
        Top = 41
        Width = 78
        Height = 17
        Caption = '&Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Value = 'C'
      end
      object rbnRecibo: TtecRadioButton
        Left = 8
        Top = 65
        Width = 78
        Height = 17
        Caption = '&Recibo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Value = 'R'
      end
    end
  end
end
