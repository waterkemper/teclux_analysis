inherited frmOpcaoVendasIdentificadas: TfrmOpcaoVendasIdentificadas
  Left = 554
  Top = 161
  Caption = 'Vendas Identificadas'
  ClientHeight = 147
  ClientWidth = 190
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object gbxPeriodo: TGroupBox
    Left = 7
    Top = 20
    Width = 150
    Height = 36
    Caption = ' PER'#205'ODO M'#202'S/ANO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object lblA: TLabel
      Left = 71
      Top = 14
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
    object edtMesInicial: TEditMesAno
      Left = 5
      Top = 10
      Width = 58
      Height = 24
      EditMask = '99/9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      MaxLength = 7
      ParentFont = False
      TabOrder = 0
      Text = '  /    '
    end
    object edtMesFinal: TEditMesAno
      Left = 86
      Top = 10
      Width = 58
      Height = 24
      EditMask = '99/9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      MaxLength = 7
      ParentFont = False
      TabOrder = 1
      Text = '  /    '
    end
  end
  object gbxCNPJ: TGroupBox
    Left = 7
    Top = 64
    Width = 151
    Height = 36
    Caption = 'CPF/CNPJ'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'HELVETICA'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object edtCPFouCNPJ: TMaskEdit
      Left = 2
      Top = 10
      Width = 145
      Height = 20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = 12
      Font.Name = 'HELVETICA'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object bbnOK: TBitBtn
    Left = 10
    Top = 115
    Width = 80
    Height = 25
    Caption = '&OK'
    Default = True
    TabOrder = 2
    TabStop = False
    OnClick = bbnOKClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
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
    Left = 97
    Top = 115
    Width = 80
    Height = 25
    Caption = '&Cancelar'
    TabOrder = 3
    TabStop = False
    Kind = bkCancel
  end
end
