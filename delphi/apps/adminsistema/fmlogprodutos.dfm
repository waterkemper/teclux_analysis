inherited frmLogProdutos: TfrmLogProdutos
  Left = 636
  Top = 144
  Caption = 'Log Produtos'
  ClientHeight = 199
  ClientWidth = 515
  Font.Height = -11
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlBarra: TToolBar
    Width = 515
  end
  inherited pnlFundoJanela: TPanel
    Top = 45
    Width = 515
    Height = 154
    object gbxPeriodo: TGroupBox
      Left = 11
      Top = 95
      Width = 219
      Height = 49
      Caption = 'Per'#237'odo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object lblInicio: TLabel
        Left = 8
        Top = 22
        Width = 16
        Height = 16
        Alignment = taRightJustify
        Caption = 'De'
      end
      object lblFim: TLabel
        Left = 108
        Top = 22
        Width = 20
        Height = 16
        Alignment = taRightJustify
        Caption = 'At'#233
      end
      object edtDataInicial: TEditData
        Left = 29
        Top = 18
        Width = 75
        Height = 24
        MaxLength = 10
        TabOrder = 1
        Minimo = 37353
        Maximo = 0
      end
      object edtDataFinal: TEditData
        Left = 133
        Top = 18
        Width = 75
        Height = 24
        MaxLength = 10
        TabOrder = 0
        Minimo = 37353
        Maximo = 0
      end
    end
    object gbxProdutos: TGroupBox
      Left = 236
      Top = 95
      Width = 265
      Height = 49
      Caption = 'Opera'#231#245'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object ckbInseridos: TCheckBox
        Left = 8
        Top = 17
        Width = 78
        Height = 23
        Caption = '&Inseridos'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object ckbApagados: TCheckBox
        Left = 180
        Top = 17
        Width = 78
        Height = 23
        Caption = '&Apagados'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object ckbAtualizados: TCheckBox
        Left = 88
        Top = 17
        Width = 90
        Height = 23
        Caption = '&Atualizados'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object ckbProdutoNaoBrinde: TCheckBox
        Left = 8
        Top = 80
        Width = 120
        Height = 23
        Caption = '&N'#227'o Brinde'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
    end
    object gbxItem: TGroupBox
      Left = 9
      Top = 1
      Width = 490
      Height = 43
      Caption = 'Item de Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      inline fraConsultaItemProduto: TfraConsultaCodigo
        Left = 8
        Top = 16
        Width = 470
        Height = 24
        HorzScrollBar.Range = 468
        VertScrollBar.Range = 24
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
          Left = 120
        end
        inherited dtxDescricao: TtecDBText
          Left = 144
          Width = 324
          DataField = 'descricao'
          DataSource = fraConsultaItemProduto.dsrProcuraItemProdutos
        end
        inherited edfCodigo: TtecDBFindLookup
          Width = 121
          DataaFieldInterno = 'produto'
          DataaFieldVisual = 'produtovisual'
          DataField = 'produtovisual'
          DataSource = fraConsultaItemProduto.dsrProcuraItemProdutos
          Group = 'Item'
          MaxLength = 10
          OnFound = nil
          Operacao = opPESQUISA
          Parameter = 'produtovisual'
          ActiveSetControls = False
          DenyInsert = True
          NoSetControls = <>
          SetControls = <>
        end
      end
    end
    object gbxProduto: TGroupBox
      Left = 10
      Top = 47
      Width = 490
      Height = 44
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      inline fraConsultaProduto: TfraConsultaCodigo
        Left = 8
        Top = 16
        Width = 470
        Height = 24
        HorzScrollBar.Range = 468
        VertScrollBar.Range = 24
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
          Left = 120
        end
        inherited dtxDescricao: TtecDBText
          Left = 144
          Width = 324
          DataField = 'descricao'
          DataSource = fraConsultaProduto.dsrProcuraProdutos
        end
        inherited edfCodigo: TtecDBFindLookup
          Width = 121
          DataaFieldInterno = 'caracteristica'
          DataaFieldVisual = 'caracteristicavisual'
          DataField = 'caracteristicavisual'
          DataSource = fraConsultaProduto.dsrProcuraProdutos
          Group = 'Produto'
          MaxLength = 10
          OnFound = nil
          Operacao = opPESQUISA
          Parameter = 'caracteristicavisual'
          ActiveSetControls = False
          DenyInsert = True
          NoSetControls = <>
          SetControls = <>
        end
      end
    end
  end
end
