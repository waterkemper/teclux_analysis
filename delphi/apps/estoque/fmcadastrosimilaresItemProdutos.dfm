inherited frmcadastrosimilaresitemprodutos: Tfrmcadastrosimilaresitemprodutos
  Left = 742
  Top = 198
  Caption = 'Cadastro de Produtos Similares'
  ClientHeight = 134
  ClientWidth = 704
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 200
    Top = 50
    Width = 20
    Height = 20
    inherited bvlBotoesEd: TBevel
      Left = 201
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 704
    TabOrder = 2
    inherited tblBarra: TToolBar
      Width = 479
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 45
    Width = 704
    Height = 89
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object gbxCodProduto: TGroupBox
      Left = 6
      Top = 10
      Width = 171
      Height = 36
      Caption = 'PRODUTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object dtxProdutoVisual: TtecDBText
        Left = 2
        Top = 11
        Width = 165
        Height = 23
        TabStop = False
        Color = clBtnFace
        DataField = 'codigovisual'
        DataSource = dtmCadastroProdutos.dsrProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Alignment = taLeftJustify
      end
    end
    object gbxSimilarItemProdutos: TGroupBox
      Left = 6
      Top = 48
      Width = 689
      Height = 38
      Caption = 'SIMILAR ITEM PRODUTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      inline fraConsultaCodigoProdutoItemSimilar: TfraConsultaCodigo
        Left = 3
        Top = 11
        Width = 683
        Height = 23
        HorzScrollBar.Range = 497
        VertScrollBar.Range = 23
        AutoScroll = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        inherited sbnProcura: TSpeedButton
          Left = 152
        end
        inherited dtxDescricao: TtecDBText
          Left = 176
          Width = 506
          DataField = 'descricaolc'
          DataSource = fraConsultaCodigoProdutoItemSimilar.dsrProcuraItemProdutos
        end
        inherited edfCodigo: TtecDBFindLookup
          Width = 153
          DataaFieldInterno = 'similar'
          DataaFieldVisual = 'similarvisual'
          DataField = 'similarvisual'
          DataSource = dtmCadastroProdutos.dsrProdutos_Similares
          LookupaFieldinterno = 'codigo'
          LookupaFieldVisual = 'codigovisual'
          LookupField = 'codigovisual'
          LookupSource = fraConsultaCodigoProdutoItemSimilar.dsrProcuraItemProdutos
          LookupQueryParameter = 'produtovisual'
          Parameter = ' '
          ActiveSetControls = False
          DenyInsert = False
          NoSetControls = <>
          SetControls = <>
          LookupParameter = 'produtovisual'
        end
      end
    end
  end
end
