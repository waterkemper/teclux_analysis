inherited frmMetaVendas: TfrmMetaVendas
  Left = 297
  Top = 221
  ActiveControl = gbxMeta
  Caption = 'Meta de Vendas'
  ClientHeight = 270
  ClientWidth = 313
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlTopMenu: TPanel
    Width = 313
    inherited tblBarra: TToolBar
      Width = 313
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
      inherited tbnDivisor: TToolButton
        Visible = False
      end
    end
  end
  object gbxFundoJanela: TGroupBox
    Left = 0
    Top = 53
    Width = 313
    Height = 217
    Align = alClient
    Constraints.MaxHeight = 217
    Constraints.MaxWidth = 313
    Constraints.MinHeight = 217
    Constraints.MinWidth = 313
    TabOrder = 2
    object lblDataAtual: TLabel
      Left = 7
      Top = 8
      Width = 298
      Height = 26
      Alignment = taCenter
      AutoSize = False
      Caption = 'lblDataAtual'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object gbxMeta: TGroupBox
      Left = 2
      Top = 34
      Width = 309
      Height = 145
      Caption = 'Metas'
      TabOrder = 0
      TabStop = True
      object dbgMeta: TtecDBGrid
        Left = 59
        Top = 16
        Width = 182
        Height = 89
        TabStop = False
        DataSource = dtmFrenteCaixa.dsrMetaVendas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Options = [dgTitles, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -13
        TitleFont.Name = 'Arial'
        TitleFont.Pitch = fpVariable
        TitleFont.Style = []
        OnDrawColumnCell = dbgMetaDrawColumnCell
        RowWrap = 60
        Large = False
        DoubleRowColor = False
        TitleMinHeight = 100
        CellHeights = 90
        StrippedColor = 16054260
        CanDelete = False
        PostOnEnter = False
        DenySort = False
        Columns = <
          item
            Expanded = False
            FieldName = 'descricao'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Caption = 'Comparativo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -15
            Title.Font.Name = 'Arial'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'percentual'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'Valor (%)'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -15
            Title.Font.Name = 'Arial'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Visible = True
          end>
      end
    end
  end
end
