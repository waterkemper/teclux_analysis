inherited frmCadastroProdutosNotaFiscal: TfrmCadastroProdutosNotaFiscal
  Left = 301
  Top = 22
  ActiveControl = ckbFiltrarProdutosPorFornecedor
  Caption = 'Cadastro de Itens da Nota Fiscal'
  ClientHeight = 743
  ClientWidth = 839
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlTopMenu: TPanel
    Width = 839
    TabOrder = 2
    inherited tblBarra: TToolBar
      Width = 614
      inherited sbnProcurar: TSpeedButton
        Width = 73
        Visible = False
      end
      inherited sbnAjuda: TSpeedButton
        Left = 73
        Action = actImpostos
      end
      inherited tbnDivisor: TToolButton
        Left = 74
      end
      inherited sbnPrimeiro: TSpeedButton
        Left = 82
      end
      inherited sbnAnterior: TSpeedButton
        Left = 132
      end
      inherited sbnProximo: TSpeedButton
        Left = 182
      end
      inherited sbnUltimo: TSpeedButton
        Left = 232
      end
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 45
    Width = 839
    Height = 698
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 1
    object gbxPreco: TGroupBox
      Left = 3
      Top = 297
      Width = 833
      Height = 398
      Align = alClient
      TabOrder = 2
      object gbxQtdeItem: TGroupBox
        Left = 7
        Top = 16
        Width = 76
        Height = 38
        Caption = 'QUANTIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object edtQuantidade: TDBEditNumero
          Left = 2
          Top = 12
          Width = 71
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          TabOrder = 0
          Text = 'edtQuantidade'
          Mascara = False
          Alignment = taLeftJustify
          TipoMascara = tmQUANTIDADE
          NrDecimal = 0
          Decimais = False
          Negativo = False
          Tamanho = 0
          DataField = 'quantidade'
          DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
        end
      end
      object gbxPrecoUnitario: TGroupBox
        Left = 85
        Top = 14
        Width = 96
        Height = 40
        Caption = 'PRE'#199'O UNIT'#193'RIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object edtPrecoProduto: TDBEditNumero
          Left = 3
          Top = 12
          Width = 89
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          TabOrder = 0
          Text = 'edtPrecoProduto'
          OnKeyDown = edtPrecoProdutoKeyDown
          Mascara = True
          Alignment = taLeftJustify
          TipoMascara = tmGERAL
          NrDecimal = 0
          Decimais = True
          Negativo = False
          Tamanho = 9
          DataField = 'precounitario'
          DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
        end
      end
      object gbxQTxPRECO: TGroupBox
        Left = 184
        Top = 14
        Width = 86
        Height = 40
        Caption = 'VALOR TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object dtxValorTotalProduto: TtecDBText
          Left = 3
          Top = 12
          Width = 78
          Height = 24
          TabStop = False
          Color = clBtnFace
          DataField = 'TotalQuantidadeXPrecoUnitario'
          DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Alignment = taLeftJustify
        end
      end
      object gbxTotalmaisIPI: TGroupBox
        Left = 598
        Top = 14
        Width = 94
        Height = 40
        Caption = 'VALOR TOTAL + IPI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        object dtxTotalMaisIPI: TtecDBText
          Left = 3
          Top = 12
          Width = 88
          Height = 24
          TabStop = False
          Color = clBtnFace
          DataField = 'TotalProdutoMaisIPI'
          DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Alignment = taLeftJustify
        end
      end
      object gbxMoeda: TGroupBox
        Left = 694
        Top = 14
        Width = 139
        Height = 40
        Caption = ' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        object sbnProcuraMoedas: TSpeedButton
          Left = 112
          Top = 12
          Width = 23
          Height = 23
          Hint = 'Procurar Nota Fiscal'
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
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFDCDCDCDCDCDC7F
            7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
            FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDC
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
            DCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
            FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFFFFFFFDCDCDCDCDCDCDC
            DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
            7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
          NumGlyphs = 2
          OnClick = sbnProcuraMoedasClick
        end
        object edtValorMoeda: TDBEditNumero
          Left = 3
          Top = 12
          Width = 102
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          TabOrder = 0
          Text = 'edtValorMoeda'
          OnKeyDown = edtPrecoProdutoKeyDown
          Mascara = True
          Alignment = taLeftJustify
          TipoMascara = tmGERAL
          NrDecimal = 6
          Decimais = True
          Negativo = False
          Tamanho = 12
          DataField = 'valormoeda'
          DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
        end
      end
      object dtxMoeda: TtecDBText
        Left = 700
        Top = 11
        Width = 40
        Height = 20
        TabStop = False
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
        Alignment = taLeftJustify
      end
      object gbxTotaisdaNota: TGroupBox
        Left = 676
        Top = 58
        Width = 157
        Height = 335
        Caption = 'TOTAL NF CALCULADA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 13
        object gbxProdutos_6: TGroupBox
          Left = 2
          Top = 119
          Width = 153
          Height = 35
          Align = alTop
          Caption = 'TOTAL PRODUTOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          object DBEditNumero1: TDBEditNumero
            Left = 2
            Top = 10
            Width = 145
            Height = 23
            TabStop = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Mascara = True
            Alignment = taLeftJustify
            TipoMascara = tmGERAL
            NrDecimal = 2
            Decimais = True
            Negativo = False
            Tamanho = 9
            DataField = 'totalprodutos'
            DataSource = dtmCadastroNotasFiscais.dsrNotaFiscal
          end
        end
        object gbxBaseICMS: TGroupBox
          Left = 2
          Top = 14
          Width = 153
          Height = 35
          Align = alTop
          Caption = 'BASE C'#193'LCULO ICMS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object edtBaseICMSNota: TDBEditNumero
            Left = 2
            Top = 10
            Width = 145
            Height = 23
            TabStop = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Text = 'edtBaseICMSNota'
            Mascara = True
            Alignment = taLeftJustify
            TipoMascara = tmGERAL
            NrDecimal = 2
            Decimais = True
            Negativo = False
            Tamanho = 9
            DataField = 'baseicmscalculada'
            DataSource = dtmCadastroNotasFiscais.dsrNotaFiscal
          end
        end
        object gbxValorICMS: TGroupBox
          Left = 2
          Top = 154
          Width = 153
          Height = 35
          Align = alTop
          Caption = 'VALOR DO ICMS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object edtValorICMSNota: TDBEditNumero
            Left = 2
            Top = 10
            Width = 145
            Height = 23
            TabStop = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Text = 'edtValorICMSNota'
            Mascara = True
            Alignment = taLeftJustify
            TipoMascara = tmGERAL
            NrDecimal = 2
            Decimais = True
            Negativo = False
            Tamanho = 9
            DataField = 'valoricmscalculada'
            DataSource = dtmCadastroNotasFiscais.dsrNotaFiscal
          end
        end
        object gbxBaseSubst: TGroupBox
          Left = 2
          Top = 49
          Width = 153
          Height = 35
          Align = alTop
          Caption = 'BASE SUBSTITUI'#199#195'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object edtBaseICMSSubstituicao: TDBEditNumero
            Left = 2
            Top = 10
            Width = 145
            Height = 23
            TabStop = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Text = 'edtBaseICMSSubstituicao'
            Mascara = True
            Alignment = taLeftJustify
            TipoMascara = tmGERAL
            NrDecimal = 2
            Decimais = True
            Negativo = False
            Tamanho = 9
            DataField = 'baseicmssubstituicaocalculada'
            DataSource = dtmCadastroNotasFiscais.dsrNotaFiscal
          end
        end
        object gbxValorSubst: TGroupBox
          Left = 2
          Top = 189
          Width = 153
          Height = 35
          Align = alTop
          Caption = 'ICMS SUBSTITUI'#199#195'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          object edtValorICMSSubstituicao: TDBEditNumero
            Left = 2
            Top = 10
            Width = 145
            Height = 23
            TabStop = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Text = 'edtValorICMSSubstituicao'
            Mascara = True
            Alignment = taLeftJustify
            TipoMascara = tmGERAL
            NrDecimal = 2
            Decimais = True
            Negativo = False
            Tamanho = 9
            DataField = 'valoricmssubstituicaocalculada'
            DataSource = dtmCadastroNotasFiscais.dsrNotaFiscal
          end
        end
        object gbxValordoIPINF: TGroupBox
          Left = 2
          Top = 259
          Width = 153
          Height = 35
          Align = alTop
          Caption = 'VALOR IPI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          object edtValordoIPINF: TDBEditNumero
            Left = 2
            Top = 10
            Width = 145
            Height = 23
            TabStop = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Text = 'edtValordoIPINF'
            Mascara = True
            Alignment = taLeftJustify
            TipoMascara = tmGERAL
            NrDecimal = 2
            Decimais = True
            Negativo = False
            Tamanho = 9
            DataField = 'valoripicalculada'
            DataSource = dtmCadastroNotasFiscais.dsrNotaFiscal
          end
        end
        object gbxTotalNota: TGroupBox
          Left = 2
          Top = 294
          Width = 153
          Height = 35
          Align = alTop
          Caption = 'TOTAL DA NOTA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          object edtValor: TDBEditNumero
            Left = 2
            Top = 10
            Width = 145
            Height = 23
            TabStop = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Text = 'edtValor'
            Mascara = True
            Alignment = taLeftJustify
            TipoMascara = tmGERAL
            NrDecimal = 2
            Decimais = True
            Negativo = False
            Tamanho = 9
            DataField = 'valornotacalculada'
            DataSource = dtmCadastroNotasFiscais.dsrNotaFiscal
          end
        end
        object gbxBaseSTRetAnt: TGroupBox
          Left = 2
          Top = 84
          Width = 153
          Height = 35
          Align = alTop
          Caption = 'BASE ST RET ANT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          object edtBaseSTRetAnt: TDBEditNumero
            Left = 2
            Top = 10
            Width = 145
            Height = 23
            TabStop = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Text = 'edtBaseICMSSubstituicao'
            Mascara = True
            Alignment = taLeftJustify
            TipoMascara = tmGERAL
            NrDecimal = 2
            Decimais = True
            Negativo = False
            Tamanho = 9
            DataField = 'vbcstretdesp'
            DataSource = dtmCadastroNotasFiscais.dsrNotaFiscal
          end
        end
        object gbxValorSTRetAnt: TGroupBox
          Left = 2
          Top = 224
          Width = 153
          Height = 35
          Align = alTop
          Caption = 'ICMS ST RET ANT.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          object edtValorSTRetAnt: TDBEditNumero
            Left = 2
            Top = 10
            Width = 145
            Height = 23
            TabStop = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Text = 'edtValorICMSSubstituicao'
            Mascara = True
            Alignment = taLeftJustify
            TipoMascara = tmGERAL
            NrDecimal = 2
            Decimais = True
            Negativo = False
            Tamanho = 9
            DataField = 'vicmsstretdesp'
            DataSource = dtmCadastroNotasFiscais.dsrNotaFiscal
          end
        end
      end
      object pgcImpostos: TPageControl
        Left = 2
        Top = 96
        Width = 663
        Height = 302
        ActivePage = tstImpostosFechamentoNF
        TabOrder = 11
        object tstImpostosFechamentoNF: TTabSheet
          Caption = '  &1 - Impostos da NF'
          object gbxICMSProprio: TGroupBox
            Left = 0
            Top = 0
            Width = 655
            Height = 127
            Align = alTop
            Caption = 'ICMS PR'#211'PRIO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object gbxCSOSN_OU_CST_NF: TGroupBox
              Left = 10
              Top = 52
              Width = 651
              Height = 37
              Caption = 'CSOSN - COD. SIT. OP. SIMPLES NACIONAL DA NOTA FISCAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              inline fraConsultaCSOSN_OU_CST_NF: TfraConsultaCodigoContabil
                Left = 2
                Top = 10
                Width = 701
                Height = 22
                HorzScrollBar.Range = 562
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 23
                VertScrollBar.Visible = False
                AutoScroll = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                inherited sbnProcura: TSpeedButton
                  Left = 32
                end
                inherited dtxDescricao: TtecDBText
                  Left = 56
                  Width = 587
                  DataField = 'descricao'
                  DataSource = fraConsultaCSOSN_OU_CST_NF.dsrProcuraTributosICMS
                end
                inherited edfCodigo: TtecDBFindLookup
                  Width = 33
                  DataField = 'cst_nf'
                  DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
                  MaxLength = 3
                  OnEnter = fraConsultaCSOSN_OU_CST_NFedfCodigoEnter
                  LookupField = 'codigo'
                  LookupSource = fraConsultaCSOSN_OU_CST_NF.dsrProcuraTributosICMS
                  LookupQueryParameter = 'codigo'
                  Parameter = ' '
                  ActiveSetControls = False
                  DenyInsert = True
                  NoSetControls = <>
                  SetControls = <>
                  LookupParameter = 'codigo'
                end
              end
            end
            object gbxCST_OU_CSOSN_EMPRESA: TGroupBox
              Left = 10
              Top = 16
              Width = 651
              Height = 36
              Caption = 'CST - CODIGO DA SITUA'#199#195'O TRIBUT'#193'RIA NA EMPRESA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              inline fraConsultaCST_OU_CSOSN_EMPRESA: TfraConsultaCodigoContabil
                Left = 3
                Top = 10
                Width = 674
                Height = 24
                HorzScrollBar.Range = 436
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 23
                VertScrollBar.Visible = False
                AutoScroll = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                inherited sbnProcura: TSpeedButton
                  Left = 24
                  Enabled = False
                  Font.Height = -13
                end
                inherited dtxDescricao: TtecDBText
                  Left = 48
                  Width = 596
                  DataField = 'descricao'
                  DataSource = fraConsultaCST_OU_CSOSN_EMPRESA.dsrProcuraTributosICMS
                end
                inherited edfCodigo: TtecDBFindLookup
                  Width = 25
                  TabStop = False
                  Color = clBtnFace
                  DataField = 'incidencia'
                  DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
                  MaxLength = 2
                  LookupField = 'codigo'
                  LookupSource = fraConsultaCST_OU_CSOSN_EMPRESA.dsrProcuraTributosICMS
                  LookupQueryParameter = 'codigo'
                  Parameter = ' '
                  ActiveSetControls = False
                  DenyInsert = False
                  NoSetControls = <>
                  SetControls = <>
                  LookupParameter = 'codigo'
                end
              end
            end
            object pnlDadosICMSProprio: TPanel
              Left = 2
              Top = 92
              Width = 651
              Height = 35
              BevelOuter = bvNone
              TabOrder = 2
              object sbnGerarTotalICMS: TSpeedButton
                Left = 625
                Top = 10
                Width = 23
                Height = 23
                Hint = 'Recalcula o valor do ICMS'
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                Glyph.Data = {
                  36060000424D3606000000000000360000002800000020000000100000000100
                  18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDC808080000000808080DCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A058
                  5858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDC80808000000080808000000000FFFF000000808080000000808080DCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858A0A0A0585858FF
                  FFFF585858A0A0A0585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDC00000000FFFF80808000000000FFFF00000080808000FFFF000000DCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCA0A0A0585858DC
                  DCDC585858A0A0A0DCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDC80808080808000FFFF00FFFF00FFFF00FFFF00FFFF808080808080DCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0A0A0A0DCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCA0A0A0A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  80808000000000000000FFFF80808000000080808000FFFF0000000000008080
                  80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858585858DCDCDCA0A0A058
                  5858A0A0A0DCDCDC585858585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                  00000000FFFF00FFFF00FFFF000000DCDCDC00000000FFFF00FFFF00FFFF0000
                  00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCDCDCDCDCDCDC585858DC
                  DCDC585858FFFFFFDCDCDCDCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                  80808000000000000000FFFF80808000000080808000FFFF0000000000008080
                  80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858585858DCDCDCA0A0A058
                  5858A0A0A0DCDCDC585858585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDC80808080808000FFFF00FFFF00FFFF00FFFF00FFFF808080808080DCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0A0A0A0DCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCA0A0A0A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDC00000000FFFF80808000000000FFFF00000080808000FFFF000000DCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCA0A0A0585858DC
                  DCDC585858A0A0A0DCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDC80808000000080808000000000FFFF000000808080000000808080DCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858A0A0A0585858FF
                  FFFF585858A0A0A0585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDC808080000000808080DCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A058
                  5858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
                NumGlyphs = 2
                ParentFont = False
                OnClick = sbnGerarTotalICMSClick
              end
              object gbxBaseCalculoICMSProprio: TGroupBox
                Left = 218
                Top = -1
                Width = 103
                Height = 36
                Caption = 'BASE DE C'#193'LCULO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                object edtBaseICMS: TDBEditNumero
                  Left = 4
                  Top = 10
                  Width = 95
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
                  Text = 'edtBaseICMS'
                  Mascara = True
                  Alignment = taLeftJustify
                  TipoMascara = tmGERAL
                  NrDecimal = 2
                  Decimais = True
                  Negativo = False
                  Tamanho = 9
                  DataField = 'icmsbasecalculo'
                  DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
                end
              end
              object gbxPercentualReducao: TGroupBox
                Left = 67
                Top = -1
                Width = 52
                Height = 36
                Caption = '% RED.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                object edtPRedBC: TDBEditNumero
                  Left = 2
                  Top = 10
                  Width = 47
                  Height = 23
                  Hint = 'Percentual da redu'#231#227'o base'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  MaxLength = -1
                  ParentFont = False
                  TabOrder = 0
                  Text = 'edtPRedBC'
                  Mascara = True
                  Alignment = taLeftJustify
                  TipoMascara = tmGERAL
                  NrDecimal = 2
                  Decimais = True
                  Negativo = False
                  Tamanho = 9
                  DataField = 'percentualreducaobase'
                  DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
                end
              end
              object gbxValorReducaoBase: TGroupBox
                Left = 121
                Top = -1
                Width = 95
                Height = 36
                Caption = 'VALOR REDU'#199#195'O'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                object edtRedBC: TDBEditNumero
                  Left = 4
                  Top = 10
                  Width = 87
                  Height = 23
                  Hint = 'Valor total da redu'#231#227'o base'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  MaxLength = -1
                  ParentFont = False
                  TabOrder = 0
                  Text = 'edtRedBC'
                  Mascara = True
                  Alignment = taLeftJustify
                  TipoMascara = tmGERAL
                  NrDecimal = 2
                  Decimais = True
                  Negativo = False
                  Tamanho = 9
                  DataField = 'valorreducaobase'
                  DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
                end
              end
              object gbxPercICMSProprio: TGroupBox
                Left = 323
                Top = -1
                Width = 60
                Height = 36
                Caption = '% ICMS'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 3
                object edtPICMS: TDBEditNumero
                  Left = 4
                  Top = 10
                  Width = 52
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
                  Text = 'edtPICMS'
                  Mascara = True
                  Alignment = taLeftJustify
                  TipoMascara = tmGERAL
                  NrDecimal = 2
                  Decimais = True
                  Negativo = False
                  Tamanho = 6
                  DataField = 'aliquotaicms'
                  DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
                end
              end
              object gbxValorICMSProprio: TGroupBox
                Left = 385
                Top = -1
                Width = 93
                Height = 36
                Caption = 'VALOR'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 4
                object edtVlICMS: TDBEditNumero
                  Left = 4
                  Top = 10
                  Width = 85
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
                  Text = 'edtVlICMS'
                  Mascara = True
                  Alignment = taLeftJustify
                  TipoMascara = tmGERAL
                  NrDecimal = 2
                  Decimais = True
                  Negativo = False
                  Tamanho = 9
                  DataField = 'icmsvalor'
                  DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
                end
              end
              object GroupBox18: TGroupBox
                Left = 538
                Top = -1
                Width = 85
                Height = 36
                Caption = 'VALOR SN'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 6
                object edtvcredicmssn: TDBEditNumero
                  Left = 4
                  Top = 10
                  Width = 77
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
                  Text = 'edtvcredicmssn'
                  Mascara = True
                  Alignment = taLeftJustify
                  TipoMascara = tmGERAL
                  NrDecimal = 2
                  Decimais = True
                  Negativo = False
                  Tamanho = 9
                  DataField = 'vcredicmssn'
                  DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
                end
              end
              object gbxpcredsn: TGroupBox
                Left = 481
                Top = -1
                Width = 54
                Height = 36
                Caption = '% SN'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 5
                object edtpcredsn: TDBEditNumero
                  Left = 4
                  Top = 10
                  Width = 45
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
                  Text = 'edtpcredsn'
                  Mascara = True
                  Alignment = taLeftJustify
                  TipoMascara = tmGERAL
                  NrDecimal = 2
                  Decimais = True
                  Negativo = False
                  Tamanho = 6
                  DataField = 'pcredsn'
                  DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
                end
              end
            end
          end
          object gbxICMSSubstTrib: TGroupBox
            Left = 0
            Top = 127
            Width = 655
            Height = 54
            Align = alTop
            Caption = 'ICMS SUBSTITUI'#199#195'O TRIBUT'#193'RIA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object gbxBaseCalculoICMSST: TGroupBox
              Left = 218
              Top = 14
              Width = 106
              Height = 36
              Caption = 'BASE DE C'#193'LCULO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              object edtBaseICMSST: TDBEditNumero
                Left = 4
                Top = 10
                Width = 98
                Height = 23
                TabStop = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = -1
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                Text = 'edtBaseICMSST'
                Mascara = True
                Alignment = taLeftJustify
                TipoMascara = tmGERAL
                NrDecimal = 2
                Decimais = True
                Negativo = False
                Tamanho = 9
                DataField = 'icmsbasecalculost'
                DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
              end
            end
            object gbxValorICMSPropriost: TGroupBox
              Left = 387
              Top = 14
              Width = 93
              Height = 36
              Caption = 'VALOR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              object edtVlICMSST: TDBEditNumero
                Left = 4
                Top = 10
                Width = 85
                Height = 23
                TabStop = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = -1
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                Text = 'edtVlICMSST'
                Mascara = True
                Alignment = taLeftJustify
                TipoMascara = tmGERAL
                NrDecimal = 2
                Decimais = True
                Negativo = False
                Tamanho = 9
                DataField = 'icmsvalorst'
                DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
              end
            end
            object GroupBox9: TGroupBox
              Left = 68
              Top = 14
              Width = 52
              Height = 36
              Caption = '% RED.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              object edtpredbcst: TDBEditNumero
                Left = 2
                Top = 10
                Width = 47
                Height = 23
                Hint = 'Percentual da redu'#231#227'o base'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = -1
                ParentFont = False
                TabOrder = 0
                Text = 'edtpredbcst'
                Mascara = True
                Alignment = taLeftJustify
                TipoMascara = tmGERAL
                NrDecimal = 2
                Decimais = True
                Negativo = False
                Tamanho = 9
                DataField = 'predbcst'
                DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
              end
            end
            object GroupBox10: TGroupBox
              Left = 122
              Top = 14
              Width = 94
              Height = 36
              Caption = 'VALOR REDU'#199#195'O'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              object edtvalorreducaobasest: TDBEditNumero
                Left = 4
                Top = 10
                Width = 86
                Height = 23
                Hint = 'Valor total da redu'#231#227'o base'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = -1
                ParentFont = False
                TabOrder = 0
                Text = 'edtvalorreducaobasest'
                Mascara = True
                Alignment = taLeftJustify
                TipoMascara = tmGERAL
                NrDecimal = 2
                Decimais = True
                Negativo = False
                Tamanho = 9
                DataField = 'reducaobasest'
                DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
              end
            end
            object GroupBox14: TGroupBox
              Left = 326
              Top = 14
              Width = 59
              Height = 36
              Caption = '% ICMS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              object edtaliquotaicmsst: TDBEditNumero
                Left = 4
                Top = 10
                Width = 52
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
                Text = 'edtaliquotaicmsst'
                Mascara = True
                Alignment = taLeftJustify
                TipoMascara = tmGERAL
                NrDecimal = 2
                Decimais = True
                Negativo = False
                Tamanho = 6
                DataField = 'aliquotaicmsst'
                DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
              end
            end
            object GroupBox15: TGroupBox
              Left = 4
              Top = 14
              Width = 60
              Height = 36
              Caption = 'MVA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object edtpMVAST: TDBEditNumero
                Left = 2
                Top = 10
                Width = 55
                Height = 23
                Hint = 'Percentual da redu'#231#227'o base'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = -1
                ParentFont = False
                TabOrder = 0
                Text = 'edtpMVAST'
                Mascara = True
                Alignment = taLeftJustify
                TipoMascara = tmGERAL
                NrDecimal = 2
                Decimais = True
                Negativo = False
                Tamanho = 9
                DataField = 'pmvast'
                DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
              end
            end
          end
          object gbxIPI: TGroupBox
            Left = 0
            Top = 181
            Width = 655
            Height = 91
            Align = alTop
            Caption = 'IPI'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            object GroupBox17: TGroupBox
              Left = 2
              Top = 17
              Width = 707
              Height = 36
              Caption = 'CST IPI DA NOTA FISCAL'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              Visible = False
              inline fraConsultaIPICST_NF: TfraConsultaCodigo
                Left = 3
                Top = 10
                Width = 726
                Height = 23
                HorzScrollBar.Range = 564
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 23
                VertScrollBar.Visible = False
                AutoScroll = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                inherited sbnProcura: TSpeedButton
                  Left = 24
                end
                inherited dtxDescricao: TtecDBText
                  Left = 48
                  Width = 675
                  DataField = 'descricao'
                  DataSource = fraConsultaIPICST_NF.dsrProcuratributosipi
                end
                inherited edfCodigo: TtecDBFindLookup
                  Width = 25
                  DataField = 'ipicst_nf'
                  DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
                  MaxLength = 2
                  LookupField = 'codigo'
                  LookupSource = fraConsultaIPICST_NF.dsrProcuratributosipi
                  LookupQueryParameter = 'codigo'
                  Parameter = ' '
                  ActiveSetControls = False
                  DenyInsert = False
                  NoSetControls = <>
                  SetControls = <>
                  LookupParameter = 'codigo'
                end
              end
            end
            object gbxIPICST: TGroupBox
              Left = 2
              Top = 16
              Width = 707
              Height = 36
              Caption = 'CST IPI NA EMPRESA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              inline fraConsultaIPICST: TfraConsultaCodigo
                Left = 3
                Top = 10
                Width = 726
                Height = 23
                HorzScrollBar.Range = 564
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 23
                VertScrollBar.Visible = False
                AutoScroll = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                inherited sbnProcura: TSpeedButton
                  Left = 24
                  Enabled = False
                end
                inherited dtxDescricao: TtecDBText
                  Left = 48
                  Width = 597
                  DataField = 'descricao'
                  DataSource = fraConsultaIPICST.dsrProcuratributosipi
                end
                inherited edfCodigo: TtecDBFindLookup
                  Width = 25
                  TabStop = False
                  Color = clBtnFace
                  DataField = 'ipicst'
                  DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
                  MaxLength = 2
                  LookupField = 'codigo'
                  LookupSource = fraConsultaIPICST.dsrProcuratributosipi
                  LookupQueryParameter = 'codigo'
                  Parameter = ' '
                  ActiveSetControls = False
                  DenyInsert = False
                  NoSetControls = <>
                  SetControls = <>
                  LookupParameter = 'codigo'
                end
              end
            end
            object pnlDadosIPIProprio: TPanel
              Left = 2
              Top = 51
              Width = 707
              Height = 36
              BevelOuter = bvNone
              TabOrder = 2
              object GroupBox2: TGroupBox
                Left = 386
                Top = 1
                Width = 118
                Height = 36
                Caption = 'VALOR DO IPI'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                object sbnGerarTotalIPI: TSpeedButton
                  Left = 91
                  Top = 10
                  Width = 23
                  Height = 23
                  Hint = 'Recalcula o valor do IPI (Ctrl I)'
                  Flat = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Glyph.Data = {
                    36060000424D3606000000000000360000002800000020000000100000000100
                    18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDC808080000000808080DCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A058
                    5858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC80808000000080808000000000FFFF000000808080000000808080DCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858A0A0A0585858FF
                    FFFF585858A0A0A0585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC00000000FFFF80808000000000FFFF00000080808000FFFF000000DCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCA0A0A0585858DC
                    DCDC585858A0A0A0DCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC80808080808000FFFF00FFFF00FFFF00FFFF00FFFF808080808080DCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0A0A0A0DCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCA0A0A0A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    80808000000000000000FFFF80808000000080808000FFFF0000000000008080
                    80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858585858DCDCDCA0A0A058
                    5858A0A0A0DCDCDC585858585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    00000000FFFF00FFFF00FFFF000000DCDCDC00000000FFFF00FFFF00FFFF0000
                    00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCDCDCDCDCDCDC585858DC
                    DCDC585858FFFFFFDCDCDCDCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    80808000000000000000FFFF80808000000080808000FFFF0000000000008080
                    80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858585858DCDCDCA0A0A058
                    5858A0A0A0DCDCDC585858585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC80808080808000FFFF00FFFF00FFFF00FFFF00FFFF808080808080DCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0A0A0A0DCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCA0A0A0A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC00000000FFFF80808000000000FFFF00000080808000FFFF000000DCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCA0A0A0585858DC
                    DCDC585858A0A0A0DCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC80808000000080808000000000FFFF000000808080000000808080DCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858A0A0A0585858FF
                    FFFF585858A0A0A0585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDC808080000000808080DCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A058
                    5858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
                  NumGlyphs = 2
                  ParentFont = False
                  OnClick = sbnGerarTotalIPIClick
                end
                object edtValorIPI: TDBEditNumero
                  Left = 4
                  Top = 10
                  Width = 85
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
                  Text = 'edtValorIPI'
                  OnKeyDown = edtValorIPIKeyDown
                  Mascara = True
                  Alignment = taLeftJustify
                  TipoMascara = tmGERAL
                  NrDecimal = 2
                  Decimais = True
                  Negativo = False
                  Tamanho = 9
                  DataField = 'valoripi'
                  DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
                end
              end
              object gbxBaseCalculoIPI: TGroupBox
                Left = 221
                Top = 1
                Width = 100
                Height = 36
                Caption = 'BASE DE C'#193'LCULO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                object edtBaseCalculoIPI: TDBEditNumero
                  Left = 4
                  Top = 10
                  Width = 93
                  Height = 23
                  Hint = 'Valor total da redu'#231#227'o base'
                  TabStop = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  MaxLength = -1
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                  Text = 'edtBaseCalculoIPI'
                  Mascara = True
                  Alignment = taLeftJustify
                  TipoMascara = tmGERAL
                  NrDecimal = 2
                  Decimais = True
                  Negativo = False
                  Tamanho = 9
                  DataField = 'ipibasecalculo'
                  DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
                end
              end
              object GroupBox1: TGroupBox
                Left = 324
                Top = 1
                Width = 60
                Height = 36
                Caption = '% IPI'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                object edtIPI: TDBEditNumero
                  Left = 3
                  Top = 10
                  Width = 53
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
                  Text = 'edtIPI'
                  Mascara = True
                  Alignment = taLeftJustify
                  TipoMascara = tmGERAL
                  NrDecimal = 2
                  Decimais = True
                  Negativo = False
                  Tamanho = 6
                  DataField = 'aliquotaipi'
                  DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
                end
              end
            end
          end
        end
        object tstImpostosPISCOFINS: TTabSheet
          Caption = '  &2 - Pis/Cofins'
          ImageIndex = 1
          object gbxPIS: TGroupBox
            Left = 1
            Top = -2
            Width = 573
            Height = 85
            Caption = 'PIS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object sbnGerarTotalPIS: TSpeedButton
              Left = 294
              Top = 59
              Width = 23
              Height = 23
              Hint = 'Recalcula o valor do PIS'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDC808080000000808080DCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A058
                5858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC80808000000080808000000000FFFF000000808080000000808080DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858A0A0A0585858FF
                FFFF585858A0A0A0585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC00000000FFFF80808000000000FFFF00000080808000FFFF000000DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCA0A0A0585858DC
                DCDC585858A0A0A0DCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC80808080808000FFFF00FFFF00FFFF00FFFF00FFFF808080808080DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0A0A0A0DCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCA0A0A0A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                80808000000000000000FFFF80808000000080808000FFFF0000000000008080
                80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858585858DCDCDCA0A0A058
                5858A0A0A0DCDCDC585858585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                00000000FFFF00FFFF00FFFF000000DCDCDC00000000FFFF00FFFF00FFFF0000
                00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCDCDCDCDCDCDC585858DC
                DCDC585858FFFFFFDCDCDCDCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                80808000000000000000FFFF80808000000080808000FFFF0000000000008080
                80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858585858DCDCDCA0A0A058
                5858A0A0A0DCDCDC585858585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC80808080808000FFFF00FFFF00FFFF00FFFF00FFFF808080808080DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0A0A0A0DCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCA0A0A0A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC00000000FFFF80808000000000FFFF00000080808000FFFF000000DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCA0A0A0585858DC
                DCDC585858A0A0A0DCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC80808000000080808000000000FFFF000000808080000000808080DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858A0A0A0585858FF
                FFFF585858A0A0A0585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDC808080000000808080DCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A058
                5858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
              NumGlyphs = 2
              ParentFont = False
              OnClick = sbnGerarTotalPISClick
            end
            object GroupBox6: TGroupBox
              Left = 117
              Top = 47
              Width = 63
              Height = 36
              Caption = '% PIS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              object DBEditNumero2: TDBEditNumero
                Left = 3
                Top = 10
                Width = 56
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
                Text = '2,00'
                Mascara = True
                Alignment = taLeftJustify
                TipoMascara = tmGERAL
                NrDecimal = 2
                Decimais = True
                Negativo = False
                Tamanho = 6
                DataField = 'pisaliquota'
                DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
              end
            end
            object GroupBox7: TGroupBox
              Left = 183
              Top = 47
              Width = 109
              Height = 36
              Caption = 'VALOR DO PIS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              object DBEditNumero3: TDBEditNumero
                Left = 4
                Top = 10
                Width = 101
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
                Text = '3,00'
                Mascara = True
                Alignment = taLeftJustify
                TipoMascara = tmGERAL
                NrDecimal = 2
                Decimais = True
                Negativo = False
                Tamanho = 9
                DataField = 'pisvalor'
                DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
              end
            end
            object GroupBox8: TGroupBox
              Left = 5
              Top = 47
              Width = 110
              Height = 36
              Caption = 'BASE DE C'#193'LCULO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              object DBEditNumero4: TDBEditNumero
                Left = 4
                Top = 10
                Width = 101
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
                Text = '4,00'
                Mascara = True
                Alignment = taLeftJustify
                TipoMascara = tmGERAL
                NrDecimal = 2
                Decimais = True
                Negativo = False
                Tamanho = 9
                DataField = 'pisbasecalculo'
                DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
              end
            end
            object gbxPISCST: TGroupBox
              Left = 4
              Top = 11
              Width = 566
              Height = 35
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              inline fraConsultaTributacaopis: TfraConsultaCodigo
                Left = 4
                Top = 8
                Width = 560
                Height = 23
                HorzScrollBar.Range = 726
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 23
                VertScrollBar.Visible = False
                AutoScroll = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                inherited sbnProcura: TSpeedButton
                  Left = 24
                end
                inherited dtxDescricao: TtecDBText
                  Left = 48
                  Width = 510
                  DataField = 'descricao'
                  DataSource = fraConsultaTributacaopis.dsrProcuratributospis
                end
                inherited edfCodigo: TtecDBFindLookup
                  Width = 25
                  DataField = 'piscst'
                  DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
                  MaxLength = 2
                  LookupField = 'codigo'
                  LookupSource = fraConsultaTributacaopis.dsrProcuratributospis
                  LookupQueryParameter = 'codigo'
                  Parameter = ' '
                  ActiveSetControls = False
                  DenyInsert = False
                  NoSetControls = <>
                  SetControls = <>
                  LookupParameter = 'codigo'
                end
              end
            end
          end
          object gbxCOFINS: TGroupBox
            Left = 2
            Top = 82
            Width = 573
            Height = 85
            Caption = 'COFINS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object sbnGerarTotalCOFINS: TSpeedButton
              Left = 294
              Top = 59
              Width = 23
              Height = 23
              Hint = 'Recalcula o valor do COFINS'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDC808080000000808080DCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A058
                5858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC80808000000080808000000000FFFF000000808080000000808080DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858A0A0A0585858FF
                FFFF585858A0A0A0585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC00000000FFFF80808000000000FFFF00000080808000FFFF000000DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCA0A0A0585858DC
                DCDC585858A0A0A0DCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC80808080808000FFFF00FFFF00FFFF00FFFF00FFFF808080808080DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0A0A0A0DCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCA0A0A0A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                80808000000000000000FFFF80808000000080808000FFFF0000000000008080
                80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858585858DCDCDCA0A0A058
                5858A0A0A0DCDCDC585858585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                00000000FFFF00FFFF00FFFF000000DCDCDC00000000FFFF00FFFF00FFFF0000
                00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCDCDCDCDCDCDC585858DC
                DCDC585858FFFFFFDCDCDCDCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                80808000000000000000FFFF80808000000080808000FFFF0000000000008080
                80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858585858DCDCDCA0A0A058
                5858A0A0A0DCDCDC585858585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC80808080808000FFFF00FFFF00FFFF00FFFF00FFFF808080808080DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0A0A0A0DCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCA0A0A0A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC00000000FFFF80808000000000FFFF00000080808000FFFF000000DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCA0A0A0585858DC
                DCDC585858A0A0A0DCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC80808000000080808000000000FFFF000000808080000000808080DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858A0A0A0585858FF
                FFFF585858A0A0A0585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDC808080000000808080DCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A058
                5858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
              NumGlyphs = 2
              ParentFont = False
              OnClick = sbnGerarTotalCOFINSClick
            end
            object GroupBox11: TGroupBox
              Left = 117
              Top = 47
              Width = 63
              Height = 36
              Caption = '% COFINS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              object DBEditNumero7: TDBEditNumero
                Left = 3
                Top = 10
                Width = 56
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
                Text = '7,00'
                Mascara = True
                Alignment = taLeftJustify
                TipoMascara = tmGERAL
                NrDecimal = 2
                Decimais = True
                Negativo = False
                Tamanho = 6
                DataField = 'cofinsaliquota'
                DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
              end
            end
            object GroupBox12: TGroupBox
              Left = 183
              Top = 47
              Width = 109
              Height = 36
              Caption = 'VALOR DA COFINS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              object DBEditNumero8: TDBEditNumero
                Left = 4
                Top = 10
                Width = 101
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
                Text = '8,00'
                Mascara = True
                Alignment = taLeftJustify
                TipoMascara = tmGERAL
                NrDecimal = 2
                Decimais = True
                Negativo = False
                Tamanho = 9
                DataField = 'cofinsvalor'
                DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
              end
            end
            object GroupBox13: TGroupBox
              Left = 5
              Top = 47
              Width = 110
              Height = 36
              Caption = 'BASE DE C'#193'LCULO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              object DBEditNumero9: TDBEditNumero
                Left = 4
                Top = 10
                Width = 101
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
                Text = '9,00'
                Mascara = True
                Alignment = taLeftJustify
                TipoMascara = tmGERAL
                NrDecimal = 2
                Decimais = True
                Negativo = False
                Tamanho = 9
                DataField = 'cofinsbasecalculo'
                DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
              end
            end
            object GroupBox16: TGroupBox
              Left = 4
              Top = 11
              Width = 566
              Height = 35
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              inline fraConsultaTributacaoCOFINS: TfraConsultaCodigo
                Left = 4
                Top = 8
                Width = 560
                Height = 23
                HorzScrollBar.Range = 726
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 23
                VertScrollBar.Visible = False
                AutoScroll = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                inherited sbnProcura: TSpeedButton
                  Left = 24
                end
                inherited dtxDescricao: TtecDBText
                  Left = 48
                  Width = 510
                  DataField = 'descricao'
                  DataSource = fraConsultaTributacaoCOFINS.dsrProcuratributoscofins
                end
                inherited edfCodigo: TtecDBFindLookup
                  Width = 25
                  DataField = 'cofinscst'
                  DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
                  MaxLength = 2
                  LookupField = 'codigo'
                  LookupSource = fraConsultaTributacaoCOFINS.dsrProcuratributoscofins
                  LookupQueryParameter = 'codigo'
                  Parameter = ' '
                  ActiveSetControls = False
                  DenyInsert = False
                  NoSetControls = <>
                  SetControls = <>
                  LookupParameter = 'codigo'
                end
              end
            end
          end
        end
      end
      object gbxDescontoProduto: TGroupBox
        Left = 272
        Top = 14
        Width = 145
        Height = 40
        Caption = 'DESC. GERAL    DESC. ITEM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object sbnRatearValorTotalProdutos: TSpeedButton
          Left = 59
          Top = 10
          Width = 23
          Height = 23
          Hint = 'Ratear o valor total do desconto'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDC808080000000808080DCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A058
            5858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDC80808000000080808000000000FFFF000000808080000000808080DCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858A0A0A0585858FF
            FFFF585858A0A0A0585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDC00000000FFFF80808000000000FFFF00000080808000FFFF000000DCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCA0A0A0585858DC
            DCDC585858A0A0A0DCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDC80808080808000FFFF00FFFF00FFFF00FFFF00FFFF808080808080DCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0A0A0A0DCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCA0A0A0A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            80808000000000000000FFFF80808000000080808000FFFF0000000000008080
            80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858585858DCDCDCA0A0A058
            5858A0A0A0DCDCDC585858585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
            00000000FFFF00FFFF00FFFF000000DCDCDC00000000FFFF00FFFF00FFFF0000
            00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCDCDCDCDCDCDC585858DC
            DCDC585858FFFFFFDCDCDCDCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
            80808000000000000000FFFF80808000000080808000FFFF0000000000008080
            80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858585858DCDCDCA0A0A058
            5858A0A0A0DCDCDC585858585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDC80808080808000FFFF00FFFF00FFFF00FFFF00FFFF808080808080DCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0A0A0A0DCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCA0A0A0A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDC00000000FFFF80808000000000FFFF00000080808000FFFF000000DCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCA0A0A0585858DC
            DCDC585858A0A0A0DCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDC80808000000080808000000000FFFF000000808080000000808080DCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858A0A0A0585858FF
            FFFF585858A0A0A0585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDC808080000000808080DCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A058
            5858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
          NumGlyphs = 2
          ParentFont = False
          OnClick = sbnRatearValorTotalProdutosClick
        end
        object edtDescontoProduto: TDBEditNumero
          Left = 3
          Top = 12
          Width = 54
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          TabOrder = 0
          Text = 'edtDescontoProduto'
          Mascara = True
          Alignment = taLeftJustify
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 9
          DataField = 'desconto'
          DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
        end
        object DBEditNumero5: TDBEditNumero
          Left = 85
          Top = 11
          Width = 55
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          TabOrder = 1
          Text = 'edtDescontoProduto'
          Mascara = True
          Alignment = taLeftJustify
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 9
          DataField = 'valordescontoitem'
          DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
        end
      end
      object gbxValorLiquidoProduto: TGroupBox
        Left = 417
        Top = 14
        Width = 85
        Height = 40
        Caption = 'VALOR L'#205'QUIDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object edtValorLiquidoProduto: TtecDBText
          Left = 3
          Top = 12
          Width = 78
          Height = 24
          TabStop = False
          Color = clBtnFace
          DataField = 'TotalLiquido'
          DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Alignment = taLeftJustify
        end
      end
      object gbxFreteProduto: TGroupBox
        Left = 506
        Top = 14
        Width = 90
        Height = 40
        Caption = 'FRETE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        object sbnRatearValorTotalFrete: TSpeedButton
          Left = 63
          Top = 10
          Width = 23
          Height = 23
          Hint = 'Ratear o valor total do frete'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDC808080000000808080DCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A058
            5858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDC80808000000080808000000000FFFF000000808080000000808080DCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858A0A0A0585858FF
            FFFF585858A0A0A0585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDC00000000FFFF80808000000000FFFF00000080808000FFFF000000DCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCA0A0A0585858DC
            DCDC585858A0A0A0DCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDC80808080808000FFFF00FFFF00FFFF00FFFF00FFFF808080808080DCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0A0A0A0DCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCA0A0A0A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            80808000000000000000FFFF80808000000080808000FFFF0000000000008080
            80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858585858DCDCDCA0A0A058
            5858A0A0A0DCDCDC585858585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
            00000000FFFF00FFFF00FFFF000000DCDCDC00000000FFFF00FFFF00FFFF0000
            00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCDCDCDCDCDCDC585858DC
            DCDC585858FFFFFFDCDCDCDCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
            80808000000000000000FFFF80808000000080808000FFFF0000000000008080
            80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858585858DCDCDCA0A0A058
            5858A0A0A0DCDCDC585858585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDC80808080808000FFFF00FFFF00FFFF00FFFF00FFFF808080808080DCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0A0A0A0DCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCA0A0A0A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDC00000000FFFF80808000000000FFFF00000080808000FFFF000000DCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCA0A0A0585858DC
            DCDC585858A0A0A0DCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDC80808000000080808000000000FFFF000000808080000000808080DCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858A0A0A0585858FF
            FFFF585858A0A0A0585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDC808080000000808080DCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A058
            5858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
          NumGlyphs = 2
          ParentFont = False
          OnClick = sbnRatearValorTotalFreteClick
        end
        object edtFrete: TDBEditNumero
          Left = 3
          Top = 12
          Width = 62
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          TabOrder = 0
          Text = 'edtFrete'
          OnKeyDown = edtPrecoProdutoKeyDown
          Mascara = True
          Alignment = taLeftJustify
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 9
          DataField = 'frete'
          DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
        end
      end
      object gbxUnidadeNF: TGroupBox
        Left = 7
        Top = 56
        Width = 179
        Height = 38
        Caption = 'UNIDADE DA NF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        inline fraConsultaUnidadeNF: TfraConsultaCodigo
          Left = 4
          Top = 11
          Width = 173
          Height = 24
          HorzScrollBar.Range = 436
          HorzScrollBar.Visible = False
          VertScrollBar.Range = 23
          VertScrollBar.Visible = False
          AutoScroll = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          inherited sbnProcura: TSpeedButton
            Left = 40
            Font.Height = -13
          end
          inherited dtxDescricao: TtecDBText
            Left = 64
            Width = 107
            DataField = 'descricao'
            DataSource = fraConsultaUnidadeNF.dsrProcuraUnidades
          end
          inherited edfCodigo: TtecDBFindLookup
            Width = 41
            DataField = 'unidadenf'
            DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
            MaxLength = 8
            LookupField = 'codigo'
            LookupSource = fraConsultaUnidadeNF.dsrProcuraUnidades
            LookupQueryParameter = 'codigo'
            Parameter = ' '
            ActiveSetControls = False
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
            LookupParameter = 'codigo'
          end
        end
      end
      object gbxFatorConversao: TGroupBox
        Left = 189
        Top = 56
        Width = 106
        Height = 38
        Caption = 'FATOR CONVERS'#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        object edtFatorConsersao: TDBEditNumero
          Left = 3
          Top = 12
          Width = 98
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          TabOrder = 0
          Text = 'edtFatorConsersao'
          Mascara = True
          Alignment = taLeftJustify
          TipoMascara = tmGERAL
          NrDecimal = 3
          Decimais = True
          Negativo = False
          Tamanho = 7
          DataField = 'fatorconversao'
          DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
        end
      end
      object gbxUnidadeEstoque: TGroupBox
        Left = 298
        Top = 56
        Width = 159
        Height = 38
        Caption = 'UNIDADE DO ESTOQUE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 14
        object dtxUnidadeEstoque: TtecDBText
          Left = 3
          Top = 11
          Width = 46
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'unidade'
          DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
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
        object dtxDescricaoUnidadeEstoque: TtecDBText
          Left = 53
          Top = 10
          Width = 100
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'descricaounidade'
          DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
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
      object gbxQtdeEstoque: TGroupBox
        Left = 462
        Top = 56
        Width = 98
        Height = 38
        Caption = 'QTDE ESTOQUE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        object edtQtdeEstoque: TDBEditNumero
          Left = 2
          Top = 12
          Width = 93
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          TabOrder = 0
          Text = 'edtQtdeEstoque'
          Mascara = False
          Alignment = taLeftJustify
          TipoMascara = tmQUANTIDADE
          NrDecimal = 0
          Decimais = False
          Negativo = False
          Tamanho = 0
          DataField = 'qtdeestoque'
          DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
        end
      end
    end
    object gbxProdutos: TGroupBox
      Left = 3
      Top = 138
      Width = 833
      Height = 159
      Align = alTop
      Caption = 'PRODUTO'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 1
      object gbxItem: TGroupBox
        Left = 2
        Top = 79
        Width = 829
        Height = 38
        Align = alTop
        Caption = 'ITEM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object sbnProdutos: TSpeedButton
          Left = 205
          Top = 10
          Width = 23
          Height = 24
          Hint = 'Procurar Produto'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7FFFFFFFC3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3800000800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000
            00800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000
            00800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000008000
            00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFF
            FFFFC3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3FFA858800000800000800000FFA858C3C3C30000FF800000800000C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3
            C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFC3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3C3C3C3C3C3C37F
            7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
            FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
            FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
            FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
            FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFFFFFFFC3C3C3C3C3C3C3
            C3C3FFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            800000FFA858FFA858FFA858FFA858FFA858800000C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
            7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3FFA858800000800000800000FFA858C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FC3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
          NumGlyphs = 2
          ParentFont = False
          OnClick = sbnProdutosClick
        end
        object dtxDescricaoProduto: TtecDBText
          Left = 230
          Top = 10
          Width = 595
          Height = 24
          TabStop = False
          Color = clBtnFace
          DataField = 'descricaolc'
          DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Alignment = taLeftJustify
        end
        object flkCodigoProduto: TtecDBFindLookup
          Left = 3
          Top = 10
          Width = 200
          Height = 24
          Alignment = taLeftJustify
          DataaFieldInterno = 'produto'
          DataaFieldVisual = 'produtovisual'
          DataField = 'produtodigitado'
          DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 30
          Maximo = 0
          Minimo = 37353
          Adicional = 0
          Opcional = True
          OnEnter = flkCodigoProdutoEnter
          OnMessage = flkCodigoProdutoMessage
          ParentFont = False
          TabOrder = 1
          PermitirZero = False
          PermitirNulo = False
          Operacao = opATRIBUICAO
          LookupaFieldinterno = 'produto'
          LookupaFieldVisual = 'produtovisual'
          LookupField = 'produtovisual'
          LookupSource = dtmCadastroNotasFiscais.dsrProcuraProdutoNotaFiscal
          LookupQueryParameter = 'produtovisual'
          Parameter = ' '
          ActiveSetControls = False
          DenyInsert = True
          NoSetControls = <>
          SetControls = <>
          LookupParameter = 'produtovisual'
        end
      end
      object gbxNCM: TGroupBox
        Left = 233
        Top = 116
        Width = 152
        Height = 36
        Caption = 'NCM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object dtxNCM: TtecDBText
          Left = 4
          Top = 10
          Width = 141
          Height = 24
          TabStop = False
          Color = clBtnFace
          DataField = 'classificacaofiscal'
          DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Alignment = taLeftJustify
        end
      end
      object gbxDescricaoPreco: TGroupBox
        Left = 391
        Top = 116
        Width = 439
        Height = 36
        Caption = 'DESCRI'#199#195'O DO PRE'#199'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object dtxDescricaoPreco: TtecDBText
          Left = 33
          Top = 10
          Width = 402
          Height = 24
          TabStop = False
          Color = clBtnFace
          DataField = 'descricaoprecoproduto'
          DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Alignment = taLeftJustify
        end
        object dtxPreco: TtecDBText
          Left = 4
          Top = 10
          Width = 29
          Height = 24
          TabStop = False
          Color = clBtnFace
          DataField = 'preco'
          DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Alignment = taLeftJustify
        end
      end
      object gbx_cst_csosn_produto: TGroupBox
        Left = 125
        Top = 116
        Width = 104
        Height = 36
        Caption = 'CST DO PRODUTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object dtxcst_csosn_produto: TtecDBText
          Left = 4
          Top = 10
          Width = 95
          Height = 24
          TabStop = False
          Color = clBtnFace
          DataField = 'cst_produto'
          DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Alignment = taLeftJustify
        end
      end
      object pnlTopProdutos: TPanel
        Left = 2
        Top = 14
        Width = 829
        Height = 65
        Align = alTop
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object pgcEntrada: TPageControl
          Left = 1
          Top = 1
          Width = 632
          Height = 48
          ActivePage = tstEntradaNotas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          Style = tsButtons
          TabHeight = 1
          TabOrder = 0
          TabStop = False
          TabWidth = 1
          object tstEntradaPedido: TTabSheet
            Caption = 'tstEntradaPedido'
            object gbxNrPedido: TGroupBox
              Left = 0
              Top = -2
              Width = 121
              Height = 40
              Caption = 'N'#186' PEDIDO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object sbnIncluirProdutosDoPedido: TSpeedButton
                Left = 91
                Top = 12
                Width = 23
                Height = 23
                Hint = 'Incluir os produtos existentes no pedido CTRL P'
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                Glyph.Data = {
                  36060000424D3606000000000000360000002800000020000000100000000100
                  18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDC808080000000808080DCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A058
                  5858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDC80808000000080808000000000FFFF000000808080000000808080DCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858A0A0A0585858FF
                  FFFF585858A0A0A0585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDC00000000FFFF80808000000000FFFF00000080808000FFFF000000DCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCA0A0A0585858DC
                  DCDC585858A0A0A0DCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDC80808080808000FFFF00FFFF00FFFF00FFFF00FFFF808080808080DCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0A0A0A0DCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCA0A0A0A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  80808000000000000000FFFF80808000000080808000FFFF0000000000008080
                  80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858585858DCDCDCA0A0A058
                  5858A0A0A0DCDCDC585858585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                  00000000FFFF00FFFF00FFFF000000DCDCDC00000000FFFF00FFFF00FFFF0000
                  00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCDCDCDCDCDCDC585858DC
                  DCDC585858FFFFFFDCDCDCDCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                  80808000000000000000FFFF80808000000080808000FFFF0000000000008080
                  80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858585858DCDCDCA0A0A058
                  5858A0A0A0DCDCDC585858585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDC80808080808000FFFF00FFFF00FFFF00FFFF00FFFF808080808080DCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0A0A0A0DCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCA0A0A0A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDC00000000FFFF80808000000000FFFF00000080808000FFFF000000DCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCA0A0A0585858DC
                  DCDC585858A0A0A0DCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDC80808000000080808000000000FFFF000000808080000000808080DCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858A0A0A0585858FF
                  FFFF585858A0A0A0585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDC808080000000808080DCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A058
                  5858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
                NumGlyphs = 2
                ParentFont = False
                OnClick = sbnIncluirProdutosDoPedidoClick
              end
              object sbnPedidos: TSpeedButton
                Left = 67
                Top = 12
                Width = 23
                Height = 23
                Hint = 'Procurar Pedido'
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                Glyph.Data = {
                  36060000424D3606000000000000360000002800000020000000100000000100
                  18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7FFFFFFFC3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3800000800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000
                  00800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000
                  00800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000008000
                  00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFF
                  FFFFC3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3FFA858800000800000800000FFA858C3C3C30000FF800000800000C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3
                  C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFC3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3C3C3C3C3C3C37F
                  7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
                  FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
                  FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
                  FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
                  FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
                  FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
                  FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
                  FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFFFFFFFC3C3C3C3C3C3C3
                  C3C3FFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  800000FFA858FFA858FFA858FFA858FFA858800000C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
                  7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3FFA858800000800000800000FFA858C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FC3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
                NumGlyphs = 2
                ParentFont = False
                OnClick = sbnPedidosClick
              end
              object flkPedido: TtecDBFindLookup
                Left = 3
                Top = 12
                Width = 62
                Height = 24
                Alignment = taLeftJustify
                DataField = 'pedido'
                DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 6
                Maximo = 0
                Minimo = 37353
                Adicional = 0
                Opcional = True
                OnEnter = flkPedidoEnter
                OnExit = flkPedidoExit
                ParentFont = False
                TabOrder = 0
                PermitirZero = False
                PermitirNulo = False
                Operacao = opATRIBUICAO
                LookupField = 'numero'
                LookupSource = dtmCadastroNotasFiscais.dsrProcuraPedidosNotaFiscal
                LookupQueryParameter = 'numero'
                Parameter = ' '
                ActiveSetControls = False
                DenyInsert = False
                NoSetControls = <>
                SetControls = <>
                LookupParameter = 'numero'
              end
            end
            object GroupBox3: TGroupBox
              Left = 123
              Top = -1
              Width = 46
              Height = 38
              Caption = 'NR'#176'.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              object tecDBText1: TtecDBText
                Left = 3
                Top = 10
                Width = 39
                Height = 24
                TabStop = False
                Color = clBtnFace
                DataField = 'numeroprodutotabela'
                DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
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
          object tstEntradaNotas: TTabSheet
            Caption = 'tstEntradaNotas'
            ImageIndex = 1
            object sbnGerarnumeronotafiscalsaida: TSpeedButton
              Left = 380
              Top = 12
              Width = 23
              Height = 24
              Hint = 'Incluir os produtos existentes na nota CTRL N'
              Flat = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDC808080000000808080DCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A058
                5858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC80808000000080808000000000FFFF000000808080000000808080DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858A0A0A0585858FF
                FFFF585858A0A0A0585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC00000000FFFF80808000000000FFFF00000080808000FFFF000000DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCA0A0A0585858DC
                DCDC585858A0A0A0DCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC80808080808000FFFF00FFFF00FFFF00FFFF00FFFF808080808080DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0A0A0A0DCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCA0A0A0A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                80808000000000000000FFFF80808000000080808000FFFF0000000000008080
                80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858585858DCDCDCA0A0A058
                5858A0A0A0DCDCDC585858585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                00000000FFFF00FFFF00FFFF000000DCDCDC00000000FFFF00FFFF00FFFF0000
                00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCDCDCDCDCDCDC585858DC
                DCDC585858FFFFFFDCDCDCDCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                80808000000000000000FFFF80808000000080808000FFFF0000000000008080
                80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858585858DCDCDCA0A0A058
                5858A0A0A0DCDCDC585858585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC80808080808000FFFF00FFFF00FFFF00FFFF00FFFF808080808080DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0A0A0A0DCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCA0A0A0A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC00000000FFFF80808000000000FFFF00000080808000FFFF000000DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCA0A0A0585858DC
                DCDC585858A0A0A0DCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC80808000000080808000000000FFFF000000808080000000808080DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858A0A0A0585858FF
                FFFF585858A0A0A0585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDC808080000000808080DCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A058
                5858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
              NumGlyphs = 2
              OnClick = sbnGerarnumeronotafiscalsaidaClick
            end
            object gbxFilial: TGroupBox
              Left = 0
              Top = -2
              Width = 206
              Height = 40
              Caption = 'FILIAL'
              TabOrder = 0
              object sbnProcurafilialnotafiscalsaida: TSpeedButton
                Left = 41
                Top = 12
                Width = 23
                Height = 23
                Hint = 'Procurar Filial'
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
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
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFDCDCDCDCDCDC7F
                  7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                  FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDC
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
                  DCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
                  FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                  FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFFFFFFFDCDCDCDCDCDCDC
                  DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
                  7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
                NumGlyphs = 2
                ParentFont = False
                OnClick = sbnProcurafilialnotafiscalsaidaClick
              end
              object dtxFilial: TtecDBText
                Left = 65
                Top = 12
                Width = 137
                Height = 24
                TabStop = False
                Color = clBtnFace
                DataField = 'nome'
                DataSource = dtmCadastroNotasFiscais.dsrProcuraFiliais
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                Alignment = taLeftJustify
              end
              object flkfilialnotafiscalsaida: TtecDBFindLookup
                Left = 4
                Top = 12
                Width = 38
                Height = 24
                Alignment = taLeftJustify
                DataField = 'filialnotafiscalsaida'
                DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                Group = 'NotaSaida'
                MaxLength = 3
                Maximo = 0
                Minimo = 37353
                Adicional = 0
                Opcional = True
                OnEnter = flkfilialnotafiscalsaidaEnter
                OnFound = flknumeronotafiscalsaidaFound
                ParentFont = False
                TabOrder = 1
                PermitirZero = False
                PermitirNulo = False
                Operacao = opATRIBUICAO
                LookupField = 'codigo'
                LookupSource = dtmCadastroNotasFiscais.dsrProcuraFiliais
                LookupQueryParameter = 'filial'
                Parameter = ' '
                LookupParameter = 'filial'
              end
            end
            object gbxSerieNF: TGroupBox
              Left = 211
              Top = -2
              Width = 64
              Height = 40
              Caption = 'S'#201'RIE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              object sbnProcuraserienotafiscalsaida: TSpeedButton
                Left = 37
                Top = 12
                Width = 23
                Height = 23
                Hint = 'Procurar S'#233'rie'
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
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFDCDCDCDCDCDC7F
                  7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                  FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDC
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
                  DCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
                  FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                  FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFFFFFFFDCDCDCDCDCDCDC
                  DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
                  7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
                NumGlyphs = 2
                OnClick = sbnProcuraserienotafiscalsaidaClick
              end
              object flkserienotafiscalsaida: TtecDBFindLookup
                Left = 3
                Top = 12
                Width = 30
                Height = 24
                Alignment = taLeftJustify
                DataField = 'serienotafiscalsaida'
                DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Pitch = fpVariable
                Font.Style = []
                Group = 'NotaSaida'
                MaxLength = 50
                Maximo = 0
                Minimo = 37353
                Adicional = 0
                Opcional = True
                OnEnter = flkserienotafiscalsaidaEnter
                OnFound = flknumeronotafiscalsaidaFound
                ParentFont = False
                TabOrder = 0
                PermitirZero = False
                PermitirNulo = False
                Operacao = opATRIBUICAO
                LookupField = 'serie'
                LookupSource = dtmCadastroNotasFiscais.dsrProcuraSerieFiliais
                LookupQueryParameter = 'serie'
                Parameter = ' '
                ActiveSetControls = False
                DenyInsert = True
                NoSetControls = <>
                SetControls = <>
                LookupParameter = 'serie'
              end
            end
            object gbxNumeroNF: TGroupBox
              Left = 280
              Top = -2
              Width = 94
              Height = 40
              Caption = 'N'#186' NOTA'
              TabOrder = 2
              object sbnProcuranumeronotafiscalsaida: TSpeedButton
                Left = 66
                Top = 12
                Width = 23
                Height = 23
                Hint = 'Procurar Nota Fiscal'
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
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFDCDCDCDCDCDC7F
                  7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                  FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDC
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
                  DCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
                  FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                  FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFFFFFFFDCDCDCDCDCDCDC
                  DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
                  7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
                NumGlyphs = 2
                OnClick = sbnProcuranumeronotafiscalsaidaClick
              end
              object flknumeronotafiscalsaida: TtecDBFindLookup
                Left = 3
                Top = 12
                Width = 60
                Height = 24
                Alignment = taLeftJustify
                DataField = 'numeronotafiscalsaida'
                DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Pitch = fpVariable
                Font.Style = []
                Group = 'NotaSaida'
                MaxLength = 9
                Maximo = 0
                Minimo = 37353
                Adicional = 0
                Opcional = True
                OnEnter = flknumeronotafiscalsaidaEnter
                OnFound = flknumeronotafiscalsaidaFound
                ParentFont = False
                TabOrder = 0
                PermitirZero = False
                PermitirNulo = False
                Operacao = opATRIBUICAO
                LookupField = 'numero'
                LookupSource = dtmCadastroNotasFiscais.dsrProcuraNotaFiscalProduto
                LookupQueryParameter = 'numero'
                Parameter = ' '
                LookupParameter = 'numero'
              end
            end
            object gbxDataInicial: TGroupBox
              Left = 456
              Top = -2
              Width = 82
              Height = 40
              Caption = 'DATA INICIAL'
              TabOrder = 3
              object edtDataInicial: TEditData
                Left = 3
                Top = 12
                Width = 75
                Height = 24
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 10
                ParentFont = False
                TabOrder = 0
                Minimo = 37353
                Maximo = 0
              end
            end
            object gbxDataFinal: TGroupBox
              Left = 543
              Top = -2
              Width = 82
              Height = 40
              Caption = 'DATA FINAL'
              TabOrder = 4
              object edtDataFinal: TEditData
                Left = 3
                Top = 12
                Width = 75
                Height = 24
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 10
                ParentFont = False
                TabOrder = 0
                Minimo = 37353
                Maximo = 0
              end
            end
            object gbxNrProdutoTabela: TGroupBox
              Left = 408
              Top = -2
              Width = 46
              Height = 40
              Caption = 'NR'#176'.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              object dtxNrProdutoTabela: TtecDBText
                Left = 3
                Top = 12
                Width = 39
                Height = 24
                TabStop = False
                Color = clBtnFace
                DataField = 'numeroprodutotabela'
                DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
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
        object StaticText2: TStaticText
          Left = 635
          Top = 29
          Width = 64
          Height = 16
          Caption = 'FABRICA'#199#195'O'
          TabOrder = 4
        end
        object StaticText3: TStaticText
          Left = 649
          Top = 52
          Width = 50
          Height = 16
          Caption = 'VALIDADE'
          TabOrder = 5
        end
        object PlannerDBDatePickerDAtaFabricacao: TPlannerDBDatePicker
          Left = 703
          Top = 23
          Width = 106
          Height = 22
          Hint = 'Informe a data'
          AllowNumericNullValue = True
          AutoFocus = True
          Flat = False
          ShowModified = True
          ReturnIsTab = True
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Visible = True
          OnEnter = PlannerDBDatePickerDAtaFabricacaoEnter
          Version = '1.8.1.0'
          ButtonStyle = bsDropDown
          ButtonWidth = 16
          Etched = False
          Glyph.Data = {
            DA020000424DDA0200000000000036000000280000000D0000000D0000000100
            200000000000A402000000000000000000000000000000000000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F00000000000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000000000000000000000000000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F0000000000000000000000000000000000000000000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F0000000000000000000000000000000
            0000000000000000000000000000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000}
          Calendar = cal18_.Owner
          HideCalendarAfterSelection = True
          DataField = 'fabricacao'
          DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
          object cal18_: TPlannerCalendar
            Left = 0
            Top = 0
            Width = 180
            Height = 180
            EventDayColor = clBlack
            EventMarkerColor = clYellow
            EventMarkerShape = evsCircle
            BackgroundPosition = bpTiled
            BevelOuter = bvNone
            BorderWidth = 1
            Look = lookFlat
            DateDownColor = clNone
            DateHoverColor = clNone
            DayFont.Charset = DEFAULT_CHARSET
            DayFont.Color = clWindowText
            DayFont.Height = -11
            DayFont.Name = 'MS Sans Serif'
            DayFont.Style = []
            WeekFont.Charset = DEFAULT_CHARSET
            WeekFont.Color = clWindowText
            WeekFont.Height = -11
            WeekFont.Name = 'MS Sans Serif'
            WeekFont.Style = []
            WeekName = 'Wk'
            TextColor = clBlack
            SelectColor = clTeal
            SelectFontColor = clWhite
            InActiveColor = clGray
            HeaderColor = clNone
            FocusColor = clHighlight
            InversColor = clTeal
            WeekendColor = clRed
            NameOfDays.Monday = 'seg'
            NameOfDays.Tuesday = 'ter'
            NameOfDays.Wednesday = 'qua'
            NameOfDays.Thursday = 'qui'
            NameOfDays.Friday = 'sex'
            NameOfDays.Saturday = 's'#225'b'
            NameOfDays.Sunday = 'dom'
            NameOfMonths.January = 'jan'
            NameOfMonths.February = 'fev'
            NameOfMonths.March = 'mar'
            NameOfMonths.April = 'abr'
            NameOfMonths.May = 'mai'
            NameOfMonths.June = 'jun'
            NameOfMonths.July = 'jul'
            NameOfMonths.August = 'ago'
            NameOfMonths.September = 'set'
            NameOfMonths.October = 'out'
            NameOfMonths.November = 'nov'
            NameOfMonths.December = 'dez'
            NameOfMonths.UseIntlNames = True
            StartDay = 7
            TodayFormat = '"Today" DDD/mm, YYYY'
            Day = 9
            Month = 12
            Year = 1899
            TabOrder = 0
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            CaptionColor = clNone
            CaptionTextColor = clBlack
            LineColor = clGray
            Line3D = True
            GradientStartColor = clWhite
            GradientEndColor = clBtnFace
            GradientDirection = gdVertical
            MonthGradientStartColor = clNone
            MonthGradientEndColor = clNone
            MonthGradientDirection = gdHorizontal
            HintPrevYear = 'Previous Year'
            HintPrevMonth = 'Previous Month'
            HintNextMonth = 'Next Month'
            HintNextYear = 'Next Year'
            Version = '1.9.2.1'
          end
        end
        object PlannerDBDatePickerDataValidade: TPlannerDBDatePicker
          Left = 703
          Top = 45
          Width = 106
          Height = 22
          Hint = 'Informe a data'
          AllowNumericNullValue = True
          AutoFocus = True
          Flat = False
          ShowModified = True
          ReturnIsTab = True
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Visible = True
          OnEnter = PlannerDBDatePickerDataValidadeEnter
          Version = '1.8.1.0'
          ButtonStyle = bsDropDown
          ButtonWidth = 16
          Etched = False
          Glyph.Data = {
            DA020000424DDA0200000000000036000000280000000D0000000D0000000100
            200000000000A402000000000000000000000000000000000000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F00000000000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000000000000000000000000000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F0000000000000000000000000000000000000000000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F0000000000000000000000000000000
            0000000000000000000000000000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000}
          Calendar = cal18_.Owner
          HideCalendarAfterSelection = True
          DataField = 'validade'
          DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
          object cal18_: TPlannerCalendar
            Left = 0
            Top = 0
            Width = 180
            Height = 180
            EventDayColor = clBlack
            EventMarkerColor = clYellow
            EventMarkerShape = evsCircle
            BackgroundPosition = bpTiled
            BevelOuter = bvNone
            BorderWidth = 1
            Look = lookFlat
            DateDownColor = clNone
            DateHoverColor = clNone
            DayFont.Charset = DEFAULT_CHARSET
            DayFont.Color = clWindowText
            DayFont.Height = -11
            DayFont.Name = 'MS Sans Serif'
            DayFont.Style = []
            WeekFont.Charset = DEFAULT_CHARSET
            WeekFont.Color = clWindowText
            WeekFont.Height = -11
            WeekFont.Name = 'MS Sans Serif'
            WeekFont.Style = []
            WeekName = 'Wk'
            TextColor = clBlack
            SelectColor = clTeal
            SelectFontColor = clWhite
            InActiveColor = clGray
            HeaderColor = clNone
            FocusColor = clHighlight
            InversColor = clTeal
            WeekendColor = clRed
            NameOfDays.Monday = 'seg'
            NameOfDays.Tuesday = 'ter'
            NameOfDays.Wednesday = 'qua'
            NameOfDays.Thursday = 'qui'
            NameOfDays.Friday = 'sex'
            NameOfDays.Saturday = 's'#225'b'
            NameOfDays.Sunday = 'dom'
            NameOfMonths.January = 'jan'
            NameOfMonths.February = 'fev'
            NameOfMonths.March = 'mar'
            NameOfMonths.April = 'abr'
            NameOfMonths.May = 'mai'
            NameOfMonths.June = 'jun'
            NameOfMonths.July = 'jul'
            NameOfMonths.August = 'ago'
            NameOfMonths.September = 'set'
            NameOfMonths.October = 'out'
            NameOfMonths.November = 'nov'
            NameOfMonths.December = 'dez'
            NameOfMonths.UseIntlNames = True
            StartDay = 7
            TodayFormat = '"Today" DDD/mm, YYYY'
            Day = 9
            Month = 12
            Year = 1899
            TabOrder = 0
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            CaptionColor = clNone
            CaptionTextColor = clBlack
            LineColor = clGray
            Line3D = True
            GradientStartColor = clWhite
            GradientEndColor = clBtnFace
            GradientDirection = gdVertical
            MonthGradientStartColor = clNone
            MonthGradientEndColor = clNone
            MonthGradientDirection = gdHorizontal
            HintPrevYear = 'Previous Year'
            HintPrevMonth = 'Previous Month'
            HintNextMonth = 'Next Month'
            HintNextYear = 'Next Year'
            Version = '1.9.2.1'
          end
        end
        object DBEditTextoNrLote: TDBEditTexto
          Left = 703
          Top = -1
          Width = 122
          Height = 23
          DataField = 'nrlote'
          DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          TabOrder = 1
          CharCasenoDefault = True
          Alignment = taLeftJustify
        end
        object StaticText1: TStaticText
          Left = 659
          Top = 4
          Width = 40
          Height = 16
          Caption = 'N'#186' LOTE'
          TabOrder = 6
        end
      end
    end
    object gbxSelecionar: TGroupBox
      Left = 3
      Top = 3
      Width = 833
      Height = 27
      Align = alTop
      TabOrder = 0
      object ckbFiltrarProdutosPorFornecedor: TCheckBox
        Left = 10
        Top = 10
        Width = 226
        Height = 15
        Caption = 'SELECIONAR PRODUTOS POR FORNECEDOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = ckbFiltrarProdutosPorFornecedorClick
      end
    end
    object gbxNatureza: TGroupBox
      Left = 3
      Top = 70
      Width = 833
      Height = 68
      Align = alTop
      Caption = 'CFOP NA EMPRESA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object sbnNaturezaProduto: TSpeedButton
        Left = 64
        Top = 12
        Width = 23
        Height = 22
        Hint = 'Procurar C'#243'digo Fiscal Produto'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
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
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFDCDCDCDCDCDC7F
          7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
          FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDC
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
          DCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
          FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
          FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFFFFFFFDCDCDCDCDCDCDC
          DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
          7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
        NumGlyphs = 2
        ParentFont = False
        OnClick = sbnNaturezaProdutoClick
      end
      object dtxNatureza: TtecDBText
        Left = 64
        Top = 39
        Width = 764
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'descricao'
        DataSource = dtmCadastroNotasFiscais.dsrProcuraNaturezasProduto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Alignment = taLeftJustify
      end
      object flkNaturezaProduto: TtecDBFindLookup
        Left = 3
        Top = 12
        Width = 60
        Height = 24
        Alignment = taLeftJustify
        DataField = 'codigofiscal'
        DataSource = dtmCadastroNotasFiscais.dsrProdutosNotaFiscal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 6
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        Opcional = True
        OnEnter = flkNaturezaProdutoEnter
        OnExit = flkNaturezaProdutoExit
        ParentFont = False
        TabOrder = 1
        PermitirZero = False
        PermitirNulo = False
        Operacao = opATRIBUICAO
        LookupField = 'codigofiscal'
        LookupSource = dtmCadastroNotasFiscais.dsrProcuraNaturezasProduto
        LookupQueryParameter = 'codigofiscal'
        Parameter = ' '
        ActiveSetControls = False
        DenyInsert = True
        NoSetControls = <>
        SetControls = <>
        LookupParameter = 'codigofiscal'
      end
      object dtxNaturezaProduto: TtecDBText
        Left = 90
        Top = 12
        Width = 739
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'descricaocfop'
        DataSource = dtmCadastroNotasFiscais.dsrProcuraNaturezasProduto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        Alignment = taLeftJustify
      end
      object dtxCodigoNatureza: TtecDBText
        Left = 3
        Top = 39
        Width = 59
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'codigo'
        DataSource = dtmCadastroNotasFiscais.dsrProcuraNaturezasProduto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Alignment = taLeftJustify
      end
    end
    object gbxNaturezaOriginal: TGroupBox
      Left = 3
      Top = 30
      Width = 833
      Height = 40
      Align = alTop
      Caption = 'CFOP DA NFE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      object dtxCFOPDescricaoNfe: TtecDBText
        Left = 3
        Top = 12
        Width = 70
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'CFOP'
        DataSource = dtmCadastroNotasFiscais.dsrProdutosNotasPagNFE
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Alignment = taLeftJustify
      end
      object dtxDescricaoCFOPNFe: TtecDBText
        Left = 74
        Top = 12
        Width = 754
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'descricaocfop'
        DataSource = dtmCadastroNotasFiscais.dsrProdutosNotasPagNFE
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Alignment = taLeftJustify
      end
    end
  end
  object aclHabilitar: TActionList
    Left = 720
    object actImpostos: TAction
      Caption = 'actImpostos'
      OnUpdate = actImpostosUpdate
    end
  end
end
