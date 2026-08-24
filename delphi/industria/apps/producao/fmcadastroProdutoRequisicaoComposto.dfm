inherited frmCadastroProdutoComposto: TfrmCadastroProdutoComposto
  Left = 532
  Top = 203
  ActiveControl = flkCodigoProduto
  Caption = 'Cadastro de Produto Composto'
  ClientHeight = 171
  ClientWidth = 736
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Width = 596
    inherited bvlBotoesEd: TBevel
      Left = 135
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 736
    TabOrder = 2
    inherited tblBarra: TToolBar
      Width = 511
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
    Width = 736
    Height = 131
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object gbxConsulta: TGroupBox
      Left = 0
      Top = 0
      Width = 736
      Height = 131
      Align = alClient
      TabOrder = 0
      object gbxComposto: TGroupBox
        Left = 8
        Top = 8
        Width = 722
        Height = 36
        Caption = 'COMPOSTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object dtxProduto: TtecDBText
          Left = 234
          Top = 10
          Width = 485
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
          TabOrder = 0
          Alignment = taLeftJustify
        end
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
          TabOrder = 1
          Alignment = taLeftJustify
        end
      end
      object gbxComponente: TGroupBox
        Left = 8
        Top = 47
        Width = 722
        Height = 36
        Caption = 'COMPONENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object sbnConsultaProduto: TSpeedButton
          Left = 209
          Top = 11
          Width = 23
          Height = 23
          Hint = 'Procura produto a ser vendido'
          Flat = True
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDC800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7FFFFFFFDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DC800000800000800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000
            00800000800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000008000
            00800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000008000008000
            00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFF
            FFFFDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCFFA858800000800000800000FFA858DCDCDC0000FF800000800000DCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDC
            DCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC7F
            7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
            FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDC7F7F7FDCDCDCFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
            FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000DCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
            FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000DCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
            FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCFFFFFFFFFFFFDCDCDCDCDCDCDC
            DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FDCDCDCFFFFFFFFFFFF7F
            7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
          NumGlyphs = 2
          OnClick = sbnConsultaProdutoClick
        end
        object flkCodigoProduto: TtecDBFindLookup
          Left = 4
          Top = 11
          Width = 205
          Height = 23
          Alignment = taLeftJustify
          DataField = 'componentevisual'
          DataSource = dtmCadastroProdutos.dsrProdutoComposto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 30
          Maximo = 0
          Minimo = 37353
          Adicional = 0
          Opcional = True
          ParentFont = False
          TabOrder = 0
          PermitirZero = False
          PermitirNulo = False
          Operacao = opATRIBUICAO
          LookupField = 'codigovisual'
          LookupSource = dtmCadastroProdutos.dsrProcuraProduto
          Parameter = ' '
          ActiveSetControls = False
          DenyInsert = True
          NoSetControls = <>
          SetControls = <>
          LookupParameter = 'codigovisual'
        end
        object dtxDescricaoProduto: TtecDBText
          Left = 234
          Top = 10
          Width = 485
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'descricao'
          DataSource = dtmCadastroProdutos.dsrProcuraProduto
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
      object gbxQuantidade: TGroupBox
        Left = 8
        Top = 87
        Width = 142
        Height = 36
        Caption = 'QUANTIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object edtQuantidade: TDBEditNumero
          Left = 2
          Top = 10
          Width = 136
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          TabOrder = 0
          Mascara = False
          TipoMascara = tmQUANTIDADE
          NrDecimal = 0
          Decimais = False
          Negativo = False
          Tamanho = 0
          DataField = 'quantidade'
          DataSource = dtmCadastroProdutos.dsrProdutoComposto
        end
      end
      object gbxPreco: TGroupBox
        Left = 264
        Top = 87
        Width = 125
        Height = 36
        Caption = 'PRE'#199'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object edtPreco: TDBEditNumero
          Left = 2
          Top = 10
          Width = 119
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 12
          ParentFont = False
          TabOrder = 0
          Mascara = False
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 12
          DataField = 'preco'
          DataSource = dtmCadastroProdutos.dsrProdutoComposto
        end
      end
      object gbxTotalComponentes: TGroupBox
        Left = 392
        Top = 87
        Width = 121
        Height = 36
        Caption = 'TOTAL COMPONENTES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object lblTotalComponentesValor: TLabel
          Left = 2
          Top = 10
          Width = 117
          Height = 23
          Alignment = taRightJustify
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
      end
      object gbxUnidade: TGroupBox
        Left = 152
        Top = 87
        Width = 108
        Height = 36
        Caption = 'UNIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        object dtxUnidade: TtecDBText
          Left = 4
          Top = 10
          Width = 101
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'unidade_aux'
          DataSource = dtmCadastroProdutos.dsrProdutoComposto
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
    end
  end
end
