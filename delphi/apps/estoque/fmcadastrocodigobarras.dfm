inherited frmCadastroCodigoBarras: TfrmCadastroCodigoBarras
  Left = 557
  Top = 289
  Caption = 'Cadastro de C'#243'digo de Barras'
  ClientHeight = 128
  ClientWidth = 553
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 182
    Top = 95
    Width = 282
    Height = 25
    inherited bvlBotoesEd: TBevel
      Left = 135
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 553
    TabOrder = 2
    inherited tblBarra: TToolBar
      Width = 328
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
    end
    inherited tblBarraCadastro: TToolBar
      inherited sbnIncluir: TSpeedButton
        Enabled = False
      end
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 40
    Width = 553
    Height = 88
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 1
    object gbxConsulta: TGroupBox
      Left = 6
      Top = 6
      Width = 537
      Height = 36
      Caption = 'ITEM PRODUTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object dtxCodigoProduto: TtecDBText
        Left = 2
        Top = 10
        Width = 230
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
      object dtxProduto: TtecDBText
        Left = 234
        Top = 10
        Width = 300
        Height = 23
        TabStop = False
        Color = clBtnFace
        DataField = 'descricaolc'
        DataSource = dtmCadastroProdutos.dsrProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Alignment = taLeftJustify
      end
    end
    object gbxCodBarras: TGroupBox
      Left = 6
      Top = 49
      Width = 273
      Height = 36
      Caption = 'C'#211'DIGO BARRAS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object edtCodigoBarras: TDBEditTexto
        Left = 2
        Top = 10
        Width = 268
        Height = 23
        DataField = 'codigobarras'
        DataSource = dtmCadastroProdutos.dsrCodigoBarrasProduto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = -1
        ParentFont = False
        TabOrder = 0
        OnKeyDown = edtCodigoBarrasKeyDown
        CharCasenoDefault = False
        Alignment = taLeftJustify
      end
    end
  end
end
