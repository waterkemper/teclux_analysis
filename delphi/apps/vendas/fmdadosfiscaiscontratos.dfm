inherited frmDadosFiscaisContratos: TfrmDadosFiscaisContratos
  Left = 489
  Top = 134
  ActiveControl = dbgDadosFiscais
  Caption = 'Documentos Fiscais'
  ClientHeight = 229
  ClientWidth = 696
  PixelsPerInch = 96
  TextHeight = 16
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 0
    Width = 696
    Height = 229
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 0
    object gbxDadosFiscaisContratos: TGroupBox
      Left = 3
      Top = 3
      Width = 690
      Height = 223
      Align = alClient
      TabOrder = 0
      object dbgDadosFiscais: TtecDBGrid
        Left = 5
        Top = 5
        Width = 684
        Height = 180
        DataSource = dtmDevolucaoMercadorias.dsrDadosFiscais
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
        ShowWhenFieldInvisible = False
        CanClickWhenEditing = False
        Columns = <
          item
            Expanded = False
            FieldName = 'filialnota'
            Title.Alignment = taCenter
            Title.Caption = 'Fil'
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'serie'
            Title.Alignment = taCenter
            Title.Caption = 'S'#233'rie'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nota'
            Title.Alignment = taCenter
            Title.Caption = 'Nota'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'filialcupom'
            Title.Alignment = taCenter
            Title.Caption = 'Fil'
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'maquina'
            Title.Alignment = taCenter
            Title.Caption = 'M'#225'quina'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'intervensao'
            Title.Alignment = taCenter
            Title.Caption = 'Intervens'#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cupom'
            Title.Alignment = taCenter
            Title.Caption = 'Cupom'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nrlote'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Lote'
            Width = 121
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'quantidade'
            Title.Alignment = taCenter
            Title.Caption = 'Qtde.'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'devolver'
            Title.Alignment = taCenter
            Title.Caption = 'Devolver'
            Width = 60
            Visible = True
          end>
      end
      object sbnConfirma: TBitBtn
        Left = 319
        Top = 190
        Width = 100
        Height = 25
        Caption = 'Confir&ma'
        TabOrder = 1
        OnClick = sbnConfirmaClick
      end
    end
  end
end
