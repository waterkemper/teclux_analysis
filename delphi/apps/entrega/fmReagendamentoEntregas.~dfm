object frmReagendamentoEntregas: TfrmReagendamentoEntregas
  Left = 560
  Top = 60
  Width = 340
  Height = 247
  AutoSize = True
  Caption = 'Reagendamento de Entregas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Paneltop: TPanel
    Left = 0
    Top = 0
    Width = 324
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    Visible = False
    object lblDias: TLabel
      Left = 84
      Top = 44
      Width = 21
      Height = 13
      Caption = 'Dias'
      Visible = False
    end
    object edtDias: TDBEditTexto
      Left = 114
      Top = 39
      Width = 49
      Height = 23
      DataField = 'dias'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      MaxLength = 7
      ParentFont = False
      TabOrder = 1
      Visible = False
      CharCasenoDefault = False
      Alignment = taLeftJustify
    end
    object rgbEntrega: TtecDBRadioGroup
      Left = 114
      Top = 3
      Width = 105
      Height = 33
      Caption = 'ENTREGAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = False
      Visible = False
      DataField = 'entrega'
      object rbnEntregaSIM: TtecRadioButton
        Left = 9
        Top = 13
        Width = 48
        Height = 17
        Caption = 'SIM'
        TabOrder = 0
        Value = 'S'
      end
      object rbnEntregaNAO: TtecRadioButton
        Left = 51
        Top = 13
        Width = 46
        Height = 17
        Caption = 'N'#195'O'
        TabOrder = 1
        Value = 'N'
      end
    end
  end
  object Panelmiddle: TPanel
    Left = 0
    Top = 65
    Width = 324
    Height = 76
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object AdvDBDateTimePicker1: TAdvDBDateTimePicker
      Left = 114
      Top = 25
      Width = 106
      Height = 21
      Date = 45349.370115740740000000
      Time = 45349.370115740740000000
      Kind = dkDate
      TabOrder = 1
      AutoTab = True
      BorderStyle = bsSingle
      Ctl3D = True
      DateTime = 45349.370115740740000000
      TimeFormat = 'HH:mm'
      Version = '1.2.0.1'
      LabelAlwaysEnabled = True
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      DataField = 'dataentrega'
    end
    object AdvDBDateTimePicker2: TAdvDBDateTimePicker
      Left = 115
      Top = 51
      Width = 82
      Height = 21
      Date = 45349.370115740740000000
      Format = 'HH:mm'
      Time = 45349.370115740740000000
      Kind = dkTime
      TabOrder = 2
      AutoTab = True
      BorderStyle = bsSingle
      Ctl3D = True
      DateTime = 45349.370115740740000000
      TimeFormat = 'HH:mm'
      Version = '1.2.0.1'
      LabelAlwaysEnabled = True
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      DataField = 'horaentrega'
    end
    object StaticText1: TStaticText
      Left = 27
      Top = 30
      Width = 82
      Height = 17
      Caption = 'Data da Entrega'
      TabOrder = 3
    end
    object StaticText2: TStaticText
      Left = 28
      Top = 56
      Width = 82
      Height = 17
      Caption = 'Hora da Entrega'
      TabOrder = 4
    end
    object StaticText3: TStaticText
      Left = 67
      Top = 6
      Width = 42
      Height = 17
      Caption = 'Per'#237'odo'
      TabOrder = 5
    end
    object DBLPeriodo: TDBLookupComboPlus
      Left = 114
      Top = 0
      Width = 111
      Height = 24
      DataField = 'periodoentrega'
      LookupDisplay = 'descricao'
      LookupField = 'codigo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ListColor = clWindow
      ListFont.Charset = DEFAULT_CHARSET
      ListFont.Color = clBlack
      ListFont.Height = -12
      ListFont.Name = 'helvetica'
      ListFont.Pitch = fpVariable
      ListFont.Style = []
      ListCursor = crDefault
      ButtonCursor = crDefault
      ParentFont = False
      TabOrder = 0
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 141
    Width = 324
    Height = 68
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object ckbDBDefinirEntregaParaTodos: TPDBCheck
      Left = 114
      Top = -1
      Width = 119
      Height = 18
      Cursor = crArrow
      Hint = 'Atualizar os demais itens com os dados da entrega atual'
      Version = 
        'Version 1.50, Copyright '#169' 2000-2001 by Peric, E-mail: pericddn@p' +
        'tt.yu'
      DataField = 'definirdadosentregaparatodos'
      Caption = 'Definir para todos'
      HotTrack = False
      ImageType = igCheckBox
      ShowHandCursor = False
      ColorSipleMargine = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      Visible = False
      TabOrder = 0
    end
    object bbnOK: TBitBtn
      Left = 63
      Top = 32
      Width = 80
      Height = 25
      Caption = '&OK'
      Default = True
      ModalResult = 1
      TabOrder = 1
      TabStop = False
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
      Left = 182
      Top = 32
      Width = 80
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 2
      TabStop = False
      Kind = bkCancel
    end
  end
end
