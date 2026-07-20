object frmMensagemGrid: TfrmMensagemGrid
  Left = 476
  Top = 167
  Width = 588
  Height = 322
  HorzScrollBar.Range = 549
  VertScrollBar.Range = 275
  ActiveControl = dbgMensagem
  AutoScroll = False
  BorderIcons = []
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object lblTitulo: TLabel
    Left = 0
    Top = 0
    Width = 572
    Height = 33
    Align = alTop
    Alignment = taCenter
    Caption = 'DIFEREN'#199'AS NOS C'#193'LCULOS!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -20
    Font.Name = 'Microsoft Sans Serif'
    Font.Pitch = fpVariable
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblTexto: TLabel
    Left = 0
    Top = 33
    Width = 572
    Height = 63
    Align = alClient
    Caption = 
      'Verifique no quadro Abaixo As Diferen'#231'am Entre Os Valores da Not' +
      'a Fiscal E Os Valores Calculados Nos Produtos.'
  end
  object dbgMensagem: TtecDBGrid
    Left = 0
    Top = 96
    Width = 572
    Height = 147
    Align = alBottom
    BorderStyle = bsNone
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgRowLines]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Shell Dlg'
    TitleFont.Pitch = fpVariable
    TitleFont.Style = []
    RowWrap = 60
    Large = False
    DoubleRowColor = False
    TitleMinHeight = 100
    CellHeights = 100
    StrippedColor = 16054260
    CanDelete = False
    CanNotInsertFromGrid = False
    PostOnEnter = False
    PostOnSetUpDown = False
    DenySort = False
    DefaultRowHeight = 17
    ExibirNumerodaLinha = False
    NaoAtribuirDadosaTabelaaoDigitar = False
    ShowWhenFieldInvisible = False
    CanClickWhenEditing = False
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 243
    Width = 572
    Height = 41
    Align = alBottom
    TabOrder = 0
    object bbnOK: TBitBtn
      Left = 218
      Top = 10
      Width = 75
      Height = 25
      Caption = '&OK'
      TabOrder = 0
      TabStop = False
      Kind = bkOK
    end
  end
end
