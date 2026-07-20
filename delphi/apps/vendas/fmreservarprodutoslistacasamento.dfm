inherited frmReservarProdutosListaCasamento: TfrmReservarProdutosListaCasamento
  Left = 413
  Top = 289
  ActiveControl = edtQuantidade
  Caption = 'Reservar Produtos'
  ClientHeight = 183
  ClientWidth = 418
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 216
    Top = 90
    Width = 145
  end
  inherited pnlTopMenu: TPanel
    Width = 418
    inherited tblBarra: TToolBar
      Width = 193
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
    end
    inherited tblBarraCadastro: TToolBar
      inherited sbnIncluir: TSpeedButton
        Visible = False
      end
      inherited sbnExcluir: TSpeedButton
        Visible = False
      end
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 40
    Width = 418
    Height = 143
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 2
    object gbxReservarProdutos: TGroupBox
      Left = 3
      Top = 3
      Width = 412
      Height = 137
      Align = alClient
      TabOrder = 0
      object lblProduto: TLabel
        Left = 27
        Top = 18
        Width = 45
        Height = 16
        Alignment = taRightJustify
        Caption = 'Produto'
      end
      object lblUsuario: TLabel
        Left = 28
        Top = 44
        Width = 44
        Height = 16
        Alignment = taRightJustify
        Caption = 'Usu'#225'rio'
      end
      object lblData: TLabel
        Left = 45
        Top = 71
        Width = 27
        Height = 16
        Alignment = taRightJustify
        Caption = 'Data'
      end
      object lblQuantidade: TLabel
        Left = 6
        Top = 98
        Width = 66
        Height = 16
        Alignment = taRightJustify
        Caption = 'Quantidade'
      end
      object dtxProduto: TtecDBText
        Left = 77
        Top = 14
        Width = 320
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'descricao'
        ReadOnly = True
        TabOrder = 0
      end
      object dtxUsuario: TtecDBText
        Left = 77
        Top = 40
        Width = 250
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'nome'
        ReadOnly = True
        TabOrder = 1
      end
      object dtxData: TtecDBText
        Left = 77
        Top = 67
        Width = 140
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'data'
        ReadOnly = True
        TabOrder = 2
      end
      object edtQuantidade: TDBEditNumero
        Left = 77
        Top = 94
        Width = 35
        Height = 24
        MaxLength = -1
        TabOrder = 3
        Text = 'edtQuantidade'
        Mascara = False
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = False
        Negativo = False
        Tamanho = 2
        DataField = 'quantidade'
      end
    end
  end
end
