object frmSelecionarFilial: TfrmSelecionarFilial
  Left = 563
  Top = 165
  Width = 543
  Height = 128
  Caption = 'Selecionar Filial'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object gbxFilial: TGroupBox
    Left = 8
    Top = 8
    Width = 507
    Height = 39
    Caption = 'FILIAL'
    TabOrder = 0
    inline fraConsultaFilial: TfraConsultaCodigoContabil
      Left = 4
      Top = 13
      Width = 501
      Height = 23
      HorzScrollBar.Range = 497
      VertScrollBar.Range = 23
      AutoScroll = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      inherited dtxDescricao: TtecDBText
        DataField = 'nome'
        DataSource = fraConsultaFilial.dsrProcuraFiliais
      end
      inherited edfCodigo: TtecDBFindLookup
        DataField = 'codigo'
        DataSource = fraConsultaFilial.dsrProcuraFiliais
        Group = 'FILIAL'
        MaxLength = 3
        OnFound = nil
        Operacao = opPESQUISA
        Parameter = 'codigo'
        ActiveSetControls = False
        DenyInsert = True
        NoSetControls = <>
        SetControls = <>
      end
    end
  end
  object btnOK: TBitBtn
    Left = 136
    Top = 56
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = btnOKClick
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
  object btncancelar: TBitBtn
    Left = 224
    Top = 56
    Width = 89
    Height = 25
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Pitch = fpVariable
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Kind = bkCancel
  end
end
