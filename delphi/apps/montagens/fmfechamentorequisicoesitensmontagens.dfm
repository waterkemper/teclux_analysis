inherited frmFechamentoRequisicoesItensMontagens: TfrmFechamentoRequisicoesItensMontagens
  Left = 351
  Top = 333
  ActiveControl = flkTabeladeMontagem
  Caption = 'Fechamento de Itens de Requisicoes de Montagens'
  ClientHeight = 368
  ClientWidth = 591
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBarra: TPanel
    Left = 112
    Top = 1
    Width = 233
    Height = 16
    Visible = True
  end
  inherited pnlTopMenu: TPanel
    Width = 591
    inherited tblBarra: TToolBar
      Left = 223
      Width = 368
      inherited sbnProcurar: TSpeedButton
        Width = 81
        Visible = False
      end
      inherited tbnDivisor: TToolButton
        Left = 81
        Width = 6
      end
      inherited sbnAjuda: TSpeedButton
        Left = 87
      end
      inherited sbnPrimeiro: TSpeedButton
        Left = 162
        Hint = 'Primeiro'
      end
      inherited sbnAnterior: TSpeedButton
        Left = 212
        Hint = 'Anterior'
      end
      inherited sbnProximo: TSpeedButton
        Left = 262
        Hint = 'Próximo'
      end
      inherited sbnUltimo: TSpeedButton
        Left = 312
        Hint = 'Último'
      end
    end
    inherited tblBarraCadastro: TToolBar
      Width = 223
      inherited sbnIncluir: TSpeedButton
        Width = 73
        Visible = False
      end
      inherited sbnSalvar: TSpeedButton
        Left = 73
      end
      inherited sbnExcluir: TSpeedButton
        Left = 148
        Width = 71
        Visible = False
      end
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 53
    Width = 591
    Height = 328
    Align = alTop
    BorderWidth = 3
    TabOrder = 2
    object gbxRequisicoesItens: TGroupBox
      Left = 4
      Top = 4
      Width = 583
      Height = 320
      Align = alClient
      TabOrder = 0
      object sbnProcuraTabeladeMontagem: TSpeedButton
        Left = 190
        Top = 109
        Width = 23
        Height = 23
        Hint = 'Procurar Produto'
        Flat = True
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
        OnClick = sbnProcuraTabeladeMontagemClick
      end
      object lblProduto: TLabel
        Left = 49
        Top = 34
        Width = 76
        Height = 13
        Alignment = taRightJustify
        Caption = 'Item de Produto'
      end
      object lblQuantidade: TLabel
        Left = 69
        Top = 87
        Width = 56
        Height = 13
        Alignment = taRightJustify
        Caption = 'Quantidade'
      end
      object lblTabeladeMontagem: TLabel
        Left = 22
        Top = 114
        Width = 103
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tabela de Montagem'
      end
      object lblDatadeMontagem: TLabel
        Left = 34
        Top = 172
        Width = 91
        Height = 13
        Alignment = taRightJustify
        Caption = 'Data de Montagem'
      end
      object lblValorPagto: TLabel
        Left = 54
        Top = 200
        Width = 71
        Height = 13
        Alignment = taRightJustify
        Caption = 'Valor do Pagto'
      end
      object lblDataPagto: TLabel
        Left = 57
        Top = 229
        Width = 68
        Height = 13
        Alignment = taRightJustify
        Caption = 'Data de Pagto'
      end
      object lblFilial: TLabel
        Left = 97
        Top = 60
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'Filial'
      end
      object lblTipodeMontagem: TLabel
        Left = 34
        Top = 143
        Width = 91
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tipo de Montagem'
      end
      object dtxDescricaoProduto: TtecDBText
        Left = 269
        Top = 28
        Width = 300
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'descricaoprodutolc'
        DataSource = dtmFechamentoRequisicoesMontagens.dsrItensRequisicoes
        ReadOnly = True
        TabOrder = 1
      end
      object flkTabeladeMontagem: TtecDBFindLookup
        Left = 129
        Top = 109
        Width = 60
        Height = 21
        DataField = 'montagem'
        DataSource = dtmFechamentoRequisicoesMontagens.dsrItensRequisicoes
        MaxLength = 4
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        Opcional = True
        TabOrder = 0
        PermitirZero = False
        PermitirNulo = False
        Operacao = opATRIBUICAO
        LookupField = 'codigo'
        LookupSource = dtmFechamentoRequisicoesMontagens.dsrProcuraTabeladeMontagem
        Parameter = ' '
        ActiveSetControls = False
        DenyInsert = False
        NoSetControls = <>
        SetControls = <>
        LookupParameter = 'codigo'
      end
      object dtxDescricaoTabeladeMontagem: TtecDBText
        Left = 213
        Top = 109
        Width = 284
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'descricao'
        DataSource = dtmFechamentoRequisicoesMontagens.dsrProcuraTabeladeMontagem
        ReadOnly = True
        TabOrder = 2
      end
      object edtDataMontagem: TDBEditData
        Left = 128
        Top = 168
        Width = 89
        Height = 21
        DataField = 'datamontagem'
        DataSource = dtmFechamentoRequisicoesMontagens.dsrItensRequisicoes
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        TabOrder = 5
        Opcional = True
      end
      object edtValorPagto: TDBEditNumero
        Left = 128
        Top = 196
        Width = 89
        Height = 21
        Enabled = False
        MaxLength = -1
        TabOrder = 9
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = False
        Tamanho = 9
        DataField = 'valorpagto'
        DataSource = dtmFechamentoRequisicoesMontagens.dsrItensRequisicoes
      end
      object edtDataPagto: TDBEditData
        Left = 128
        Top = 224
        Width = 89
        Height = 21
        DataField = 'datapagto'
        DataSource = dtmFechamentoRequisicoesMontagens.dsrItensRequisicoes
        Enabled = False
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        TabOrder = 12
        Opcional = True
      end
      object gbxObservacoesItens: TGroupBox
        Left = 2
        Top = 252
        Width = 579
        Height = 66
        Align = alBottom
        Caption = 'Observação'
        TabOrder = 3
        object mmoObservacoes: TtecDBMemo
          Left = 8
          Top = 16
          Width = 561
          Height = 41
          DataField = 'observacoes'
          DataSource = dtmFechamentoRequisicoesMontagens.dsrItensRequisicoes
          Enabled = False
          TabOrder = 0
        end
      end
      object dtxFilialProduto: TtecDBText
        Left = 197
        Top = 54
        Width = 300
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'filialproduto'
        DataSource = dtmFechamentoRequisicoesMontagens.dsrItensRequisicoes
        ReadOnly = True
        TabOrder = 4
      end
      object ckbMarcar: TDBCheckBox
        Left = 432
        Top = 2
        Width = 65
        Height = 25
        Caption = '&Marcar'
        DataField = 'marcar'
        DataSource = dtmFechamentoRequisicoesMontagens.dsrItensRequisicoes
        TabOrder = 6
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        OnClick = ckbMarcarClick
      end
      object flkProduto: TtecDBFindLookup
        Left = 128
        Top = 28
        Width = 135
        Height = 21
        DataField = 'produto'
        DataSource = dtmFechamentoRequisicoesMontagens.dsrItensRequisicoes
        Enabled = False
        MaxLength = 18
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        Opcional = True
        TabOrder = 7
        PermitirZero = False
        PermitirNulo = False
        Operacao = opATRIBUICAO
        Parameter = ' '
        ActiveSetControls = False
        DenyInsert = False
        NoSetControls = <>
        SetControls = <>
        LookupParameter = 'codigo'
      end
      object flkFilialProduto: TtecDBFindLookup
        Left = 128
        Top = 54
        Width = 60
        Height = 21
        DataField = 'filial'
        DataSource = dtmFechamentoRequisicoesMontagens.dsrItensRequisicoes
        Enabled = False
        MaxLength = 4
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        Opcional = True
        TabOrder = 8
        PermitirZero = False
        PermitirNulo = False
        Operacao = opATRIBUICAO
        Parameter = ' '
        ActiveSetControls = False
        DenyInsert = False
        NoSetControls = <>
        SetControls = <>
        LookupParameter = 'codigo'
      end
      object edtQuantidade: TDBEditNumero
        Left = 128
        Top = 81
        Width = 86
        Height = 21
        Enabled = False
        MaxLength = -1
        TabOrder = 10
        Mascara = False
        Alignment = taLeftJustify
        TipoMascara = tmQUANTIDADE
        NrDecimal = 0
        Decimais = False
        Negativo = False
        Tamanho = 0
        DataField = 'quantidade'
        DataSource = dtmFechamentoRequisicoesMontagens.dsrItensRequisicoes
      end
      object ccbTipodeMontagem: TtecDBComboBox
        Left = 128
        Top = 139
        Width = 89
        Height = 21
        DataField = 'tipodemontagem'
        DataSource = dtmFechamentoRequisicoesMontagens.dsrItensRequisicoes
        ItemHeight = 13
        Items.Strings = (
          'Loja'
          'Dentro'
          'Fora')
        TabOrder = 11
      end
    end
  end
end
