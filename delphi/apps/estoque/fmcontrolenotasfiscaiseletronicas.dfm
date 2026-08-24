inherited frmControleNotasFiscaisEletronicas: TfrmControleNotasFiscaisEletronicas
  Left = 403
  Top = 125
  ActiveControl = dbgNotas
  Caption = 'Controle de Notas Fiscais Eletr'#244'nicas'
  ClientHeight = 616
  ClientWidth = 978
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlTopMenu: TPanel
    Width = 978
    inherited tblBarra: TToolBar
      Width = 977
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
      inherited sbnAjuda: TSpeedButton
        Action = Action1
        Caption = 'Ajuda  F1'
      end
      object sbnGerar: TSpeedButton
        Left = 84
        Top = 2
        Width = 75
        Height = 39
        Hint = 'Selecionar Contratos'
        Caption = 'Gerar F6'
        Flat = True
        Glyph.Data = {
          DE030000424DDE03000000000000360000002800000011000000120000000100
          180000000000A8030000120B0000120B00000000000000000000DCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DC00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC80878000
          0000808780DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC00DCDC
          DCDCDCDCDCDCDC80878000000080878000000000FFFF00000080878000000080
          8780DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDC00000000FF
          FF80878000000000FFFF00000080878000FFFF000000DCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDC00DCDCDCDCDCDC00000080878080878000FFFF00FFFF00FFFF00FF
          FF00FFFF808780808780000000DCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDC
          80878000000000000000FFFF80878000000080878000FFFF0000000000008087
          80DCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDC00000000FFFF00FFFF00FFFF
          000000FFFFFF00000000FFFF00FFFF00FFFF000000DCDCDCDCDCDCDCDCDCDCDC
          DC00DCDCDCDCDCDC80878000000000000000FFFF80878000000080878000FFFF
          000000000000808780DCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDC80
          878080878000FFFF00FFFF00FFFF00FFFF00FFFF808780808780DCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDC00000000FFFF80878000000000
          FFFF00000080878000FFFF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC00DCDC
          DCDCDCDCDCDCDC80878000000080878000000000FFFF00000080878000000080
          8780DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDC808780000000808780DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDC00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DC00}
        Layout = blGlyphTop
        Spacing = 0
        OnClick = sbnGerarClick
      end
      object sbnEnviar: TSpeedButton
        Left = 159
        Top = 2
        Width = 75
        Height = 39
        Hint = 'Selecionar Contratos'
        Caption = 'Enviar F7'
        Flat = True
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFF
          FFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3FF0000000000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FFF
          FFFFFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3FF0000FF0000FF0000000000C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F
          7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3FF0000FF0000FF0000000000C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F
          7F7FFFFFFFFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3FF0000FF0000FF0000FF0000FF0000000000C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          FF0000FF0000FF0000FF0000FF0000FF0000000000C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7FFFFFFFFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F
          FF0000FF0000000000C3C3C3FF0000FF0000FF0000000000C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F7F7FC3C3C37F7F7F7F
          7F7F7F7F7F7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFF0000
          000000C3C3C3C3C3C3C3C3C3C3C3C3FF0000FF0000000000C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C37F
          7F7F7F7F7F7F7F7FFFFFFFFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FF0000FF0000FF0000000000C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F
          7F7F7F7F7F7F7F7F7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FF0000FF0000000000C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C37F7F7F7F7F7F7F7F7FFFFFFFFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FF0000FF0000000000C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C37F7F7F7F7F7F7F7F7FFFFFFFFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFF00000000
          00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FFFFFFFFFFFFFC3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFF00
          00000000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FFFFFFFFFFFFFC3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3FF0000FF0000000000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FC3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
        Layout = blGlyphTop
        NumGlyphs = 2
        Spacing = 0
        OnClick = sbnEnviarClick
      end
    end
  end
  object pnlFiltros: TPanel
    Left = 0
    Top = 45
    Width = 978
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object gbxEmissao: TGroupBox
      Left = 6
      Top = 6
      Width = 173
      Height = 52
      Caption = 'EMISS'#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object gbxEmissaoDe: TGroupBox
        Left = 5
        Top = 12
        Width = 80
        Height = 36
        Caption = 'DE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object edtEmissaoInicial: TEditData
          Left = 2
          Top = 10
          Width = 75
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
      end
      object gbxEmissaoAte: TGroupBox
        Left = 88
        Top = 12
        Width = 80
        Height = 36
        Caption = 'AT'#201
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object edtEmissaoFinal: TEditData
          Left = 2
          Top = 10
          Width = 75
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
      end
    end
    object gbxCliente: TGroupBox
      Left = 363
      Top = 20
      Width = 507
      Height = 37
      Caption = 'CLIENTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      inline fraConsultaCodigoCliente: TfraConsultaCodigo
        Left = 2
        Top = 10
        Width = 504
        Height = 25
        HorzScrollBar.Range = 502
        VertScrollBar.Range = 23
        AutoScroll = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        inherited dtxDescricao: TtecDBText
          Width = 414
          DataField = 'nome'
          DataSource = fraConsultaCodigoCliente.dsrProcuraCliente
        end
        inherited edfCodigo: TtecDBFindLookup
          DataField = 'codigo'
          DataSource = fraConsultaCodigoCliente.dsrProcuraCliente
          Group = 'Cliente'
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
    object gbxNota: TGroupBox
      Left = 183
      Top = 6
      Width = 175
      Height = 52
      Caption = 'NF-e'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object gbxSerieNota: TGroupBox
        Left = 5
        Top = 12
        Width = 80
        Height = 36
        Caption = 'S'#201'RIE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object edtSerieNota: TEditNumero
          Left = 2
          Top = 10
          Width = 75
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 1
          ParentFont = False
          TabOrder = 0
          Mascara = True
          Alignment = taLeftJustify
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = False
          Negativo = False
          Tamanho = 9
        end
      end
      object gbxNumeroNota: TGroupBox
        Left = 90
        Top = 12
        Width = 80
        Height = 36
        Caption = 'N'#218'MERO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object edtNumeroNota: TEditNumero
          Left = 2
          Top = 10
          Width = 75
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 9
          ParentFont = False
          TabOrder = 0
          Mascara = True
          Alignment = taLeftJustify
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = False
          Negativo = False
          Tamanho = 9
        end
      end
    end
  end
  object pnlTotalizadores: TPanel
    Left = 0
    Top = 551
    Width = 978
    Height = 65
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object gbxContratos: TGroupBox
      Left = 1
      Top = -2
      Width = 131
      Height = 65
      Caption = 'QTDE.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object lblQtdeContratos: TLabel
        Left = 33
        Top = 18
        Width = 27
        Height = 12
        Alignment = taRightJustify
        Caption = 'TOTAL'
      end
      object lblQtdeMarcados: TLabel
        Left = 7
        Top = 44
        Width = 53
        Height = 12
        Alignment = taRightJustify
        Caption = 'MARCADOS'
      end
      object edtQtdeTotal: TEditNumero
        Left = 64
        Top = 11
        Width = 60
        Height = 24
        TabStop = False
        Color = clActiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = -1
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Mascara = False
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = False
        Negativo = False
        Tamanho = 6
      end
      object edtQtdeMarcados: TEditNumero
        Left = 64
        Top = 36
        Width = 60
        Height = 24
        TabStop = False
        Color = clActiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = -1
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Mascara = False
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = False
        Negativo = False
        Tamanho = 6
      end
    end
    object gbxValores: TGroupBox
      Left = 137
      Top = -1
      Width = 170
      Height = 65
      Caption = 'VALORES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object lblTotalContratos: TLabel
        Left = 33
        Top = 19
        Width = 27
        Height = 12
        Alignment = taRightJustify
        Caption = 'TOTAL'
      end
      object lblTotalMarcados: TLabel
        Left = 7
        Top = 44
        Width = 53
        Height = 12
        Alignment = taRightJustify
        Caption = 'MARCADOS'
      end
      object edtValorTotal: TEditNumero
        Left = 64
        Top = 11
        Width = 100
        Height = 24
        TabStop = False
        Color = clActiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
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
      end
      object edtValorMarcados: TEditNumero
        Left = 64
        Top = 36
        Width = 100
        Height = 24
        TabStop = False
        Color = clActiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = -1
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = False
        Tamanho = 9
      end
    end
    object ckbSelecionarTodos: TCheckBox
      Left = 642
      Top = 7
      Width = 117
      Height = 18
      Caption = 'SELECIONAR TODAS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = ckbSelecionarTodosClick
    end
    object ckbExibirMensagensNFe: TCheckBox
      Left = 778
      Top = 7
      Width = 117
      Height = 18
      Caption = 'EXIBIR MENSAGENS'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 3
      OnClick = ckbExibirMensagensNFeClick
    end
  end
  object dbgNotas: TtecDBGrid
    Left = 0
    Top = 110
    Width = 978
    Height = 441
    Align = alClient
    DataSource = dtmControleNotasFiscaisEletronicas.dsrNotas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -13
    TitleFont.Name = 'helvetica'
    TitleFont.Pitch = fpVariable
    TitleFont.Style = []
    OnDblClick = dbgNotasDblClick
    OnKeyDown = dbgNotasKeyDown
    RowWrap = 60
    Large = False
    DoubleRowColor = False
    TitleMinHeight = 100
    CellHeights = 100
    StrippedRows = 2
    StrippedColor = 16054260
    CanDelete = False
    CanNotInsertFromGrid = False
    PostOnEnter = False
    PostOnSetUpDown = False
    DenySort = False
    DefaultRowHeight = 18
    ExibirNumerodaLinha = False
    NaoAtribuirDadosaTabelaaoDigitar = False
    ShowWhenFieldInvisible = False
    CanClickWhenEditing = False
    Columns = <
      item
        Expanded = False
        FieldName = 'tiponfe'
        Title.Alignment = taCenter
        Title.Caption = 'TIPO NFe'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -9
        Title.Font.Name = 'helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'operacao'
        Title.Alignment = taCenter
        Title.Caption = 'OPERA'#199#195'O'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -9
        Title.Font.Name = 'helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 205
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'filial'
        Title.Alignment = taCenter
        Title.Caption = 'FILIAL'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -9
        Title.Font.Name = 'helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 35
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'serie'
        Title.Alignment = taCenter
        Title.Caption = 'S'#201'RIE'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -9
        Title.Font.Name = 'helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nrdocumento'
        Title.Alignment = taCenter
        Title.Caption = 'N'#218'MERO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -9
        Title.Font.Name = 'helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'modelodocto'
        Title.Caption = 'MODELO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -9
        Title.Font.Name = 'helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'emissao'
        Title.Alignment = taCenter
        Title.Caption = 'EMISS'#195'O'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -9
        Title.Font.Name = 'helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cliente'
        Title.Alignment = taCenter
        Title.Caption = 'C'#211'DIGO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -9
        Title.Font.Name = 'helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tipocliente'
        Title.Caption = 'T'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -9
        Title.Font.Name = 'helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Alignment = taCenter
        Title.Caption = 'CLIENTE'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -9
        Title.Font.Name = 'helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 171
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cnpj'
        Title.Alignment = taCenter
        Title.Caption = 'CPF/CNPJ'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -9
        Title.Font.Name = 'helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 94
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'estado'
        Title.Alignment = taCenter
        Title.Caption = 'UF'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -9
        Title.Font.Name = 'helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 21
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valornota'
        Title.Alignment = taCenter
        Title.Caption = 'VALOR NOTA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -9
        Title.Font.Name = 'helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'selecionar'
        Title.Alignment = taCenter
        Title.Caption = 'OK'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -9
        Title.Font.Name = 'helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 25
        Visible = True
      end>
  end
  object ActionList1: TActionList
    Left = 576
    Top = 8
    object Action1: TAction
      Caption = 'Action1'
      OnUpdate = Action1Update
    end
  end
end
