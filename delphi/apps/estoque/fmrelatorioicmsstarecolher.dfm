inherited frmrelatorioicmsstarecolher: Tfrmrelatorioicmsstarecolher
  Left = 712
  Top = 263
  ActiveControl = edtDataInicial
  Caption = 'Relat'#243'rio de ICMS ST a recolher'
  ClientHeight = 184
  ClientWidth = 720
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TToolBar
    Width = 720
  end
  inherited pnlFundoJanela: TPanel
    Top = 39
    Width = 720
    Height = 145
    object gbxPeriodo: TGroupBox
      Left = 212
      Top = 7
      Width = 255
      Height = 45
      Caption = ' PER'#205'ODO '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object lblA: TLabel
        Left = 171
        Top = 18
        Width = 7
        Height = 15
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
      end
      object edtDataInicial: TEditData
        Left = 97
        Top = 14
        Width = 70
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 0
        Minimo = 37353
        Maximo = 0
      end
      object edtDataFinal: TEditData
        Left = 182
        Top = 14
        Width = 70
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 1
        Minimo = 37353
        Maximo = 0
      end
    end
    object gbxFornecedor: TGroupBox
      Left = 212
      Top = 56
      Width = 502
      Height = 36
      Caption = ' FORNECEDOR '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      inline fraConsultaFornecedor: TfraConsultaCodigo
        Left = 2
        Top = 10
        Width = 498
        Height = 24
        HorzScrollBar.Range = 497
        VertScrollBar.Range = 23
        AutoScroll = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        inherited dtxDescricao: TtecDBText
          DataField = 'nome'
          DataSource = fraConsultaFornecedor.dsrProcuraCliente
        end
        inherited edfCodigo: TtecDBFindLookup
          DataField = 'codigo'
          DataSource = fraConsultaFornecedor.dsrProcuraCliente
          Group = 'forn'
          MaxLength = -1
          OnFound = nil
          Operacao = opPESQUISA
          Parameter = 'codigo'
          ActiveSetControls = False
          DenyInsert = True
          NoSetControls = <>
          SetControls = <>
        end
      end
    end
    object gbxProduto: TGroupBox
      Left = 212
      Top = 97
      Width = 502
      Height = 36
      Caption = ' PRODUTO '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      inline fraConsultaProdutos: TfraConsultaCodigo
        Left = 2
        Top = 10
        Width = 498
        Height = 24
        HorzScrollBar.Range = 497
        VertScrollBar.Range = 23
        AutoScroll = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        inherited sbnProcura: TSpeedButton
          Left = 112
        end
        inherited dtxDescricao: TtecDBText
          Left = 136
          Width = 361
          DataField = 'descricao'
          DataSource = fraConsultaProdutos.dsrProcuraItemProdutos
        end
        inherited edfCodigo: TtecDBFindLookup
          Width = 113
          DataaFieldInterno = 'codigo'
          DataaFieldVisual = 'codigovisual'
          DataField = 'produto'
          DataSource = fraConsultaProdutos.dsrProcuraItemProdutos
          Group = 'prod'
          MaxLength = -1
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
    inline fraListaFiliais: TfraListaFiliais
      Left = 6
      Top = 6
      Width = 196
      Height = 128
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      inherited gbxFiliais: TGroupBox
        Width = 196
        Height = 128
        Caption = ' &FILIAIS '
        Font.Color = clBlack
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
        inherited sbnMarcarFiliais: TSpeedButton
          Left = 170
        end
        inherited sbnDesmarcarFiliais: TSpeedButton
          Left = 170
        end
        inherited clbFiliais: TCheckListBox
          Left = 3
          Top = 13
          Width = 165
          Height = 108
          Font.Height = -12
        end
      end
    end
    object rgpTipoPeriodo: TRadioGroup
      Left = 212
      Top = 7
      Width = 97
      Height = 45
      Caption = ' PER'#205'ODO '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'LAN'#199'AMENTO'
        'EMISS'#195'O')
      ParentFont = False
      TabOrder = 4
    end
    object rgpOpcaoNCM: TtecDBRadioGroup
      Left = 477
      Top = 7
      Width = 95
      Height = 45
      Caption = 'OP'#199#195'O NCM'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      TabStop = False
      object rbnNCMNotaFiscal: TtecRadioButton
        Left = 8
        Top = 26
        Width = 85
        Height = 17
        Caption = 'Nota fiscal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object rbnNCMEmpresa: TtecRadioButton
        Left = 8
        Top = 12
        Width = 85
        Height = 17
        Caption = 'Empresa'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        TabStop = True
      end
    end
  end
end
