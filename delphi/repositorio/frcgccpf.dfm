object fraCPFCGC: TfraCPFCGC
  Left = 0
  Top = 0
  Width = 180
  Height = 35
  HorzScrollBar.Range = 177
  VertScrollBar.Range = 23
  AutoScroll = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'helvetica'
  Font.Pitch = fpVariable
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object lblcpfcgc: TLabel
    Left = 2
    Top = 3
    Width = 26
    Height = 16
    Alignment = taRightJustify
    Caption = 'CPF'
  end
  object dtxCPFCGC: TDBEditCPFCNPJ2
    Left = 33
    Top = 0
    Width = 144
    Height = 24
    Color = clBtnFace
    MaxLength = 14
    ReadOnly = True
    TabOrder = 0
    Tamanho = 0
  end
end
