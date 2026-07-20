inherited frmMotivos: TfrmMotivos
  Left = 449
  Top = 162
  Width = 442
  Height = 337
  HorzScrollBar.Range = 397
  VertScrollBar.Range = 53
  ActiveControl = dbgMotivos
  BorderStyle = bsDialog
  Caption = 'Motivos de %s'
  PixelsPerInch = 96
  TextHeight = 16
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 0
    Width = 422
    Height = 295
    Align = alClient
    BorderWidth = 3
    TabOrder = 0
    object gbxFundoJanela: TGroupBox
      Left = 4
      Top = 4
      Width = 414
      Height = 287
      Align = alClient
      TabOrder = 0
      object dbgMotivos: TtecDBGrid
        Left = 2
        Top = 18
        Width = 410
        Height = 120
        Align = alClient
        DataSource = dsrMotivos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -13
        TitleFont.Name = 'helvetica'
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
        DefaultRowHeight = 16
        ExibirNumerodaLinha = False
        NaoAtribuirDadosaTabelaaoDigitar = False
      end
      object gbxTexto: TGroupBox
        Left = 2
        Top = 138
        Width = 410
        Height = 102
        Align = alBottom
        Caption = 'Texto'
        TabOrder = 1
        object mmoTexto: TtecMemo
          Left = 2
          Top = 18
          Width = 406
          Height = 82
          Align = alClient
          MaxLength = 1000
          TabOrder = 0
        end
      end
      object gbxBotoes: TGroupBox
        Left = 2
        Top = 240
        Width = 410
        Height = 45
        Align = alBottom
        TabOrder = 2
        object bbnOK: TBitBtn
          Left = 92
          Top = 12
          Width = 96
          Height = 25
          TabOrder = 0
          OnClick = bbnOKClick
          Kind = bkOK
        end
        object bbnCancelar: TBitBtn
          Left = 203
          Top = 12
          Width = 96
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 1
          Kind = bkCancel
        end
      end
    end
  end
  object dsrMotivos: TtecDataSource
    Left = 255
    Top = 65
  end
end
