inherited frmConfirmarImpressaoListaCasamento: TfrmConfirmarImpressaoListaCasamento
  Left = 615
  Top = 296
  ActiveControl = ckbImprimirLista
  BorderStyle = bsDialog
  Caption = 'Impress'#245'es'
  ClientHeight = 224
  ClientWidth = 267
  PixelsPerInch = 96
  TextHeight = 16
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 0
    Width = 267
    Height = 224
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 0
    object gbxFundoJanela: TGroupBox
      Left = 3
      Top = 3
      Width = 261
      Height = 218
      Align = alClient
      TabOrder = 0
      object ckbImprimirLista: TCheckBox
        Left = 11
        Top = 9
        Width = 190
        Height = 17
        Caption = 'Imprimir Lista Casamento'
        TabOrder = 0
        OnClick = ckbImprimirListaClick
      end
      object ckbImprimirNota: TCheckBox
        Left = 11
        Top = 150
        Width = 238
        Height = 17
        Caption = 'Imprimir Nota Simples Remessa'
        TabOrder = 1
      end
      object bbnOK: TBitBtn
        Left = 24
        Top = 186
        Width = 85
        Height = 23
        Caption = '&OK'
        TabOrder = 2
        Kind = bkOK
      end
      object bbnCancelar: TBitBtn
        Left = 108
        Top = 186
        Width = 85
        Height = 23
        Caption = '&Cancelar'
        TabOrder = 3
        Kind = bkCancel
      end
      object TPanel
        Left = 4
        Top = 177
        Width = 253
        Height = 3
        BevelOuter = bvLowered
        TabOrder = 4
      end
      object ckbImprimirPrecoProdutoListaCasamento: TCheckBox
        Left = 32
        Top = 25
        Width = 185
        Height = 17
        Caption = 'Imprimir Pre'#231'o do Produto'
        Checked = True
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 5
      end
      object TPanel
        Left = 4
        Top = 139
        Width = 253
        Height = 3
        BevelOuter = bvLowered
        TabOrder = 6
      end
      object ckbSepararProdutosVendidos: TCheckBox
        Left = 32
        Top = 41
        Width = 185
        Height = 17
        Caption = 'Separar Produtos Vendidos'
        Checked = True
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 7
      end
      object rgbOrdenacao: TRadioGroup
        Left = 32
        Top = 64
        Width = 225
        Height = 57
        Caption = 'Ordena'#231#227'o'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Classe/Grupo'
          'Descri'#231#227'o'
          'Produto')
        TabOrder = 8
      end
    end
  end
end
