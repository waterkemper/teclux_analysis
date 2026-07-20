inherited frmGerarRemessasSoacred: TfrmGerarRemessasSoacred
  Left = 444
  Top = 163
  ActiveControl = fraConsultaFilial
  Caption = 'Gerar Remessas SOACRED'
  ClientHeight = 492
  ClientWidth = 717
  Color = clBtnFace
  Constraints.MaxHeight = 519
  Constraints.MaxWidth = 725
  Constraints.MinHeight = 492
  Constraints.MinWidth = 717
  FormStyle = fsMDIChild
  Visible = True
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTopMenu: TPanel
    Width = 717
    inherited tblBarra: TToolBar
      Width = 717
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
      inherited sbnAjuda: TSpeedButton
        Action = Action1
        GroupIndex = 0
      end
      object sbnGerarParcelas: TSpeedButton
        Left = 158
        Top = 2
        Width = 75
        Height = 43
        Hint = 'Gerar Dados para Conferência'
        Caption = 'Gerar F6'
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
        Layout = blGlyphTop
        NumGlyphs = 2
        Spacing = 0
        OnClick = sbnGerarParcelasClick
      end
      object sbnGravar: TSpeedButton
        Left = 233
        Top = 2
        Width = 75
        Height = 43
        Hint = 'Gravar Arquivos SOACRED'
        Caption = 'Gravar F5'
        Flat = True
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C3C3C3C3000000
          0000000000000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F0000
          00000000C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FC3C3C3FFFFFF000000000000
          0000000000000000007F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000
          00000000000000C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3
          C3C3FFFFFFFFFFFFC3C3C37F7F7FFFFFFFC3C3C37F7F7FFFFFFF000000000000
          0000000000000000007F7F7FBFBFBF000000000000BFBFBFBFBFBFBFBFBF0000
          00000000000000C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F
          7F7F7F7F7FFFFFFFC3C3C37F7F7FFFFFFFC3C3C37F7F7FFFFFFF000000000000
          0000000000000000007F7F7FBFBFBF000000000000BFBFBFBFBFBFBFBFBF0000
          00000000000000C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F
          7F7F7F7F7FFFFFFFFFFFFF7F7F7FFFFFFFC3C3C37F7F7FFFFFFF000000000000
          0000000000000000007F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000
          00000000000000C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C37F7F7FFFFFFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000C3C3C37F7F7FFFFFFFC3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000C3C3C37F7F7FFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF7F7F7FFFFFFF000000000000
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00000000000000C3C3C37F7F7FFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F7F7FFFFFFF000000000000
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00000000000000C3C3C37F7F7FFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F7F7FFFFFFF000000000000
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00000000000000C3C3C37F7F7FFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F7F7FFFFFFF000000000000
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00000000000000C3C3C37F7F7FFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F7F7FFFFFFF000000000000
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00000000000000C3C3C37F7F7FFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F7F7FFFFFFF000000000000
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          007F7F7F000000C3C3C37F7F7FFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FFFFFFF000000000000
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00000000000000C3C3C37F7F7FC3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFF7F7F7FC3C3C3C3C3C3000000
          0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          00000000C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3}
        Layout = blGlyphTop
        NumGlyphs = 2
        Spacing = 0
        OnClick = sbnGravarClick
      end
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 53
    Width = 717
    Height = 439
    Align = alClient
    TabOrder = 2
    object gbxPagamento: TGroupBox
      Left = 527
      Top = 70
      Width = 183
      Height = 63
      Caption = 'Pagamento'
      TabOrder = 4
      object gbxDeVencto: TGroupBox
        Left = 6
        Top = 16
        Width = 82
        Height = 42
        Caption = 'De'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        font.height = -11
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object edtPagtoInicial: TEditData
          Left = 3
          Top = 15
          Width = 75
          Height = 23
          Hint = 'Digite a data inicial de pagto'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
          Minimo = 37353
          Maximo = 0
        end
      end
      object gbxAteVencto: TGroupBox
        Left = 95
        Top = 16
        Width = 82
        Height = 42
        Caption = 'Até'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        font.height = -11
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object edtPagtoFinal: TEditData
          Left = 3
          Top = 15
          Width = 75
          Height = 23
          Hint = 'Digite a data final de pagto'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
          Minimo = 37353
          Maximo = 0
        end
      end
    end
    object gbxFaturamento: TGroupBox
      Left = 527
      Top = 5
      Width = 183
      Height = 63
      Caption = 'Faturamento'
      TabOrder = 3
      object gbxDeFaturamento: TGroupBox
        Left = 6
        Top = 16
        Width = 82
        Height = 42
        Caption = 'De'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        font.height = -11
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object edtFaturamentoInicial: TEditData
          Left = 3
          Top = 15
          Width = 75
          Height = 23
          Hint = 'Digite a data inicial de faturamento'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
          Minimo = 37353
          Maximo = 0
        end
      end
      object gbxAteFaturamento: TGroupBox
        Left = 95
        Top = 16
        Width = 82
        Height = 42
        Caption = 'Até'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        font.height = -11
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object edtFaturamentoFinal: TEditData
          Left = 3
          Top = 15
          Width = 75
          Height = 23
          Hint = 'Digite a data final de faturamento'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
          Minimo = 37353
          Maximo = 0
        end
      end
    end
    object gbxFilial: TGroupBox
      Left = 5
      Top = 5
      Width = 515
      Height = 46
      Caption = 'Filial'
      TabOrder = 0
      inline fraConsultaFilial: TfraConsultaCodigo
        Left = 5
        Top = 17
        Width = 506
        Height = 27
        HorzScrollBar.Range = 504
        VertScrollBar.Range = 23
        AutoScroll = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        font.height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        inherited sbnProcura: TSpeedButton
          Height = 23
        end
        inherited dtxDescricao: TtecDBText
          Width = 416
          DataField = 'nome'
          DataSource = fraConsultaFilial.dsrProcuraFiliais
        end
        inherited edfCodigo: TtecDBFindLookup
          DataField = 'codigo'
          DataSource = fraConsultaFilial.dsrProcuraFiliais
          Group = 'filial'
          MaxLength = 6
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
    object gbxAgente: TGroupBox
      Left = 5
      Top = 54
      Width = 515
      Height = 46
      Caption = 'Agente'
      TabOrder = 1
      inline fraConsultaAgente: TfraConsultaCodigo
        Left = 5
        Top = 17
        Width = 506
        Height = 27
        HorzScrollBar.Range = 504
        VertScrollBar.Range = 23
        AutoScroll = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        font.height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        inherited sbnProcura: TSpeedButton
          Height = 23
        end
        inherited dtxDescricao: TtecDBText
          Width = 416
          DataField = 'descricao'
          DataSource = fraConsultaAgente.dsrProcuraAgentes
        end
        inherited edfCodigo: TtecDBFindLookup
          DataField = 'codigo'
          DataSource = fraConsultaAgente.dsrProcuraAgentes
          Group = 'agente'
          MaxLength = 6
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
    object GroupBox1: TGroupBox
      Left = 90
      Top = 160
      Width = 429
      Height = 38
      TabOrder = 7
      object sbnDiretorioArquivos: TSpeedButton
        Left = 307
        Top = 8
        Width = 116
        Height = 23
        Hint = 'Selecione o diretório onde os arquivos serão salvos'
        Caption = 'Dir. Remessa'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00303333333333
          333337F3333333333333303333333333333337F33FFFFF3FF3FF303300000300
          300337FF77777F77377330000BBB0333333337777F337F33333330330BB00333
          333337F373F773333333303330033333333337F3377333333333303333333333
          333337F33FFFFF3FF3FF303300000300300337FF77777F77377330000BBB0333
          333337777F337F33333330330BB00333333337F373F773333333303330033333
          333337F3377333333333303333333333333337FFFF3FF3FFF333000003003000
          333377777F77377733330BBB0333333333337F337F33333333330BB003333333
          333373F773333333333330033333333333333773333333333333}
        NumGlyphs = 2
        OnClick = sbnDiretorioArquivosClick
      end
      object lblCaminhoDiretorio: TLabel
        Left = 5
        Top = 8
        Width = 301
        Height = 23
        AutoSize = False
      end
    end
    object gbxCodLoja: TGroupBox
      Left = 5
      Top = 152
      Width = 82
      Height = 46
      Caption = 'Cód. Loja'
      TabOrder = 8
      object edtCodLoja: TEditTexto
        Left = 5
        Top = 17
        Width = 71
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        MaxLength = 5
        TabOrder = 0
        CharCasenoDefault = True
      end
    end
    object gbxAlteracaoCadastro: TGroupBox
      Left = 527
      Top = 135
      Width = 183
      Height = 63
      Caption = 'Alteração Cadastro'
      TabOrder = 5
      object gbxDeAlteracao: TGroupBox
        Left = 6
        Top = 16
        Width = 82
        Height = 42
        Caption = 'De'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        font.height = -11
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object edtAlteracaoInicial: TEditData
          Left = 3
          Top = 15
          Width = 75
          Height = 23
          Hint = 'Digite a data inicial de pagto'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
          Minimo = 37353
          Maximo = 0
        end
      end
      object gbxAteAlteracao: TGroupBox
        Left = 95
        Top = 16
        Width = 82
        Height = 42
        Caption = 'Até'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        font.height = -11
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object edtAlteracaoFinal: TEditData
          Left = 3
          Top = 15
          Width = 75
          Height = 23
          Hint = 'Digite a data final de pagto'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
          Minimo = 37353
          Maximo = 0
        end
      end
    end
    object gbxConceito: TGroupBox
      Left = 5
      Top = 102
      Width = 515
      Height = 46
      Caption = 'Conceito'
      TabOrder = 2
      inline fraConsultaConceito: TfraConsultaCodigo
        Left = 5
        Top = 17
        Width = 506
        Height = 27
        HorzScrollBar.Range = 504
        VertScrollBar.Range = 23
        AutoScroll = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        font.height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        inherited sbnProcura: TSpeedButton
          Height = 23
        end
        inherited dtxDescricao: TtecDBText
          Width = 416
          DataField = 'descricao'
          DataSource = fraConsultaConceito.dsrProcuraConceito
        end
        inherited edfCodigo: TtecDBFindLookup
          DataField = 'codigo'
          DataSource = fraConsultaConceito.dsrProcuraConceito
          Group = 'conceito'
          MaxLength = 6
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
    object pgcTabelas: TtecPageControl
      Left = 1
      Top = 192
      Width = 715
      Height = 246
      ActivePage = tstParcelas
      Align = alBottom
      TabIndex = 0
      TabOrder = 6
      TabStop = False
      object tstParcelas: TTabSheet
        Caption = '&1 - Parcelas'
        object dbgParcelas: TtecDBGrid
          Left = 0
          Top = 0
          Width = 707
          Height = 218
          Align = alClient
          DataSource = dtmGerarRemessasSoacred.dsrContratosParcelas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -11
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          Titlefont.height = -13
          TitleFont.Name = 'Arial'
          TitleFont.Pitch = fpVariable
          TitleFont.Style = []
          RowWrap = 60
          Large = False
          DoubleRowColor = True
          TitleMinHeight = 100
          CellHeights = 100
          StrippedColor = 16054260
          CanDelete = False
          PostOnEnter = False
          DenySort = False
          Columns = <
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'contrato'
              Title.Alignment = taCenter
              Title.Caption = 'Contrato'
              Width = 88
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'parcela'
              Title.Alignment = taCenter
              Title.Caption = 'Par.'
              Width = 25
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nome'
              Title.Alignment = taCenter
              Title.Caption = 'Cliente'
              Width = 240
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'faturamento'
              Title.Alignment = taCenter
              Title.Caption = 'Data'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'datavencto'
              Title.Alignment = taCenter
              Title.Caption = 'Dt.Vencto'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valorvencto'
              Title.Alignment = taCenter
              Title.Caption = 'Vl.Vencto'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'datapagto'
              Title.Alignment = taCenter
              Title.Caption = 'Dt.Pagto'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valorpagto'
              Title.Alignment = taCenter
              Title.Caption = 'Vl.Pagto'
              Width = 62
              Visible = True
            end>
        end
      end
      object tstClientes: TTabSheet
        Caption = '&2 - Clientes'
        ImageIndex = 1
        object dbgClientes: TtecDBGrid
          Left = 0
          Top = 0
          Width = 707
          Height = 218
          Align = alClient
          DataSource = dtmGerarRemessasSoacred.dsrClientes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -11
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          Titlefont.height = -13
          TitleFont.Name = 'helvetica'
          TitleFont.Pitch = fpVariable
          TitleFont.Style = []
          RowWrap = 60
          Large = False
          DoubleRowColor = True
          TitleMinHeight = 100
          CellHeights = 100
          StrippedColor = 16054260
          CanDelete = False
          PostOnEnter = False
          DenySort = False
          Columns = <
            item
              Expanded = False
              FieldName = 'nome'
              Title.Alignment = taCenter
              Title.Caption = 'Nome'
              Width = 240
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cidade'
              Title.Alignment = taCenter
              Title.Caption = 'Cidade'
              Width = 180
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'estado'
              Title.Alignment = taCenter
              Title.Caption = 'UF'
              Width = 20
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nascto'
              Title.Alignment = taCenter
              Title.Caption = 'Nascto'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'datacadastro'
              Title.Alignment = taCenter
              Title.Caption = 'Cadastro'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ultimaalteracao'
              Title.Alignment = taCenter
              Title.Caption = 'Últ.Alteração'
              Width = 78
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ultimaconsulta'
              Title.Alignment = taCenter
              Title.Caption = 'Últ.Consulta'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'codigo'
              Title.Alignment = taCenter
              Title.Caption = 'Código'
              Width = 62
              Visible = True
            end>
        end
      end
      object tstVendas: TTabSheet
        Caption = '&3 - Vendas'
        ImageIndex = 2
        object dbgVendas: TtecDBGrid
          Left = 0
          Top = 0
          Width = 707
          Height = 218
          Align = alClient
          DataSource = dtmGerarRemessasSoacred.dsrVendas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -11
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          Titlefont.height = -13
          TitleFont.Name = 'helvetica'
          TitleFont.Pitch = fpVariable
          TitleFont.Style = []
          RowWrap = 60
          Large = False
          DoubleRowColor = True
          TitleMinHeight = 100
          CellHeights = 100
          StrippedColor = 16054260
          CanDelete = False
          PostOnEnter = False
          DenySort = False
          Columns = <
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'contrato'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Contrato'
              Width = 88
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nome'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Cliente'
              Width = 240
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'faturamento'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Data'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valorvista'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Vl.Vista'
              Width = 68
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valorprazo'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Vl.Prazo'
              Width = 68
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'vendedor'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Vendedor'
              Visible = True
            end
            item
              DropDownRows = 2
              Expanded = False
              FieldName = 'modalidade'
              PickList.Strings = (
                '1 - Carnê'
                '2 - Cheque')
              Title.Alignment = taCenter
              Title.Caption = 'Modalidade'
              Width = 70
              Visible = True
            end>
        end
      end
    end
  end
  object ActionList1: TActionList
    Left = 645
    Top = 10
    object Action1: TAction
      Caption = 'Action1'
      OnUpdate = Action1Update
    end
  end
end
