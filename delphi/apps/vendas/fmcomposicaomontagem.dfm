inherited frmComposicaoMontagem: TfrmComposicaoMontagem
  Left = 300
  Top = 157
  ActiveControl = dbgComposicaoMontagem
  Caption = 'Composi'#231#227'o dos Kit'#39's de Montagem'
  ClientHeight = 323
  ClientWidth = 643
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 104
    Top = 106
  end
  inherited pnlTopMenu: TPanel
    Width = 643
    inherited tblBarra: TToolBar
      Width = 414
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
    end
    inherited tblBarraCadastro: TToolBar
      inherited sbnIncluir: TSpeedButton
        Visible = False
      end
      inherited sbnSalvar: TSpeedButton
        Visible = False
      end
      inherited sbnExcluir: TSpeedButton
        Visible = False
      end
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 53
    Width = 643
    Height = 248
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object dbgComposicaoMontagem: TtecDBGrid
      Left = 0
      Top = 0
      Width = 643
      Height = 248
      Align = alClient
      DataSource = dtmordemservico.dsrComponentesMontagem
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
      PostOnEnter = False
      DenySort = False
      Columns = <
        item
          Expanded = False
          FieldName = 'composto'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'componente'
          Title.Alignment = taCenter
          Title.Caption = 'Produto'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricaolc'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Width = 366
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'unidade'
          Title.Alignment = taCenter
          Title.Caption = 'Un.'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          Title.Alignment = taCenter
          Title.Caption = 'Qtde.'
          Width = 82
          Visible = True
        end>
    end
  end
end
