inherited frmCadastroMoedas: TfrmCadastroMoedas
  Left = 430
  Top = 247
  ActiveControl = edfCodigoMoeda
  Caption = 'Cadastro de moedas'
  ClientHeight = 405
  ClientWidth = 923
  Font.Height = -12
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBarra: TPanel
    Left = 0
    Top = 45
    Width = 923
    Height = 360
    Align = alClient
    Font.Height = -12
    ParentFont = False
    Visible = True
    inherited bvlBotoesEd: TBevel
      Left = 1
      Top = 82
      Width = 921
      Height = 0
      Align = alBottom
      Visible = False
    end
    object gbxCodigoMoeda: TGroupBox
      Left = 6
      Top = 3
      Width = 100
      Height = 37
      Caption = ' C'#211'DIGO '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object edfCodigoMoeda: TtecDBFindLookup
        Left = 2
        Top = 10
        Width = 95
        Height = 23
        Alignment = taLeftJustify
        CharCase = ecUpperCase
        DataField = 'codigo'
        DataSource = dtmCadastroMoedas.dsrMoedas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Group = 'CodigoMoeda'
        MaxLength = 10
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        Opcional = True
        ParentFont = False
        TabOrder = 0
        PermitirZero = False
        PermitirNulo = False
        Operacao = opPESQUISA
        Parameter = 'codigo'
        ActiveSetControls = True
        DenyInsert = False
        NoSetControls = <>
        SetControls = <
          item
            Control = gbxDescricaoMoeda
          end
          item
            Control = gbxDecimais
          end
          item
            Control = gbxMoedasCotacoes
          end
          item
          end
          item
            Control = gbxMes
          end
          item
            Control = ckbMoedaPadrao
          end>
      end
    end
    object gbxDescricaoMoeda: TGroupBox
      Left = 111
      Top = 3
      Width = 330
      Height = 37
      Caption = ' DESCRI'#199#195'O '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object edtDescricaoMoeda: TDBEditTexto
        Left = 2
        Top = 10
        Width = 325
        Height = 23
        DataField = 'descricao'
        DataSource = dtmCadastroMoedas.dsrMoedas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = -1
        ParentFont = False
        TabOrder = 0
        CharCasenoDefault = False
        Alignment = taLeftJustify
      end
    end
    object gbxDecimais: TGroupBox
      Left = 446
      Top = 3
      Width = 55
      Height = 38
      Caption = 'DECIMAIS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      object dbsDecimais: TDBSpinEdit
        Left = 1
        Top = 10
        Width = 50
        Height = 24
        DataField = 'nrdecimais'
        DataSource = dtmCadastroMoedas.dsrMoedas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        MaxValue = 6
        MinValue = 0
        Value = 0
      end
    end
    object gbxMoedasCotacoes: TGroupBox
      Left = 1
      Top = 82
      Width = 921
      Height = 277
      Align = alBottom
      Caption = ' COTA'#199#213'ES DI'#193'RIAS DA MOEDA '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object dbgCotacaoMoedas: TtecDBGrid
        Left = 2
        Top = 16
        Width = 890
        Height = 259
        Align = alClient
        DataSource = dtmCadastroMoedas.dsrMoedasCotacoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -8
        TitleFont.Name = 'helvetica'
        TitleFont.Pitch = fpVariable
        TitleFont.Style = []
        OnKeyDown = dbgCotacaoMoedasKeyDown
        RowWrap = 60
        Large = False
        DoubleRowColor = False
        TitleMinHeight = 100
        CellHeights = 100
        StrippedColor = 16054260
        CanDelete = False
        CanNotInsertFromGrid = False
        PostOnEnter = True
        PostOnSetUpDown = False
        DenySort = False
        DefaultRowHeight = 19
        ExibirNumerodaLinha = False
        NaoAtribuirDadosaTabelaaoDigitar = False
        ShowWhenFieldInvisible = False
        CanClickWhenEditing = False
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'dia1'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'DIA'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cotacao1'
            Title.Alignment = taCenter
            Title.Caption = 'COTA'#199#195'O'
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
            FieldName = 'observacoes1'
            Title.Alignment = taCenter
            Title.Caption = 'OBSERVA'#199#213'ES'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 172
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'dia2'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'DIA'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cotacao2'
            Title.Alignment = taCenter
            Title.Caption = 'COTA'#199#195'O'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'observacoes2'
            Title.Alignment = taCenter
            Title.Caption = 'OBSERVA'#199#213'ES'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 172
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'dia3'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'DIA'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cotacao3'
            Title.Alignment = taCenter
            Title.Caption = 'COTA'#199#195'O'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'observacoes3'
            Title.Alignment = taCenter
            Title.Caption = 'OBSERVA'#199#213'ES'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 172
            Visible = True
          end>
      end
      object pnlOpcoesProdutos: TPanel
        Left = 892
        Top = 16
        Width = 27
        Height = 259
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object sbnReplicarValor: TSpeedButton
          Left = 1
          Top = 5
          Width = 23
          Height = 22
          Hint = 'Copiar o valor para os demais dias do m'#234's'
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
          OnClick = sbnReplicarValorClick
        end
      end
    end
    object gbxMes: TGroupBox
      Left = 7
      Top = 44
      Width = 59
      Height = 36
      Caption = 'M'#202'S/ANO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object edtMesAno: TDBEditmesano
        Left = 2
        Top = 10
        Width = 54
        Height = 23
        Alignment = taLeftJustify
        DataField = 'mesano'
        DataSource = dtmCadastroMoedas.dsrMoedas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = -1
        Maximo = 3660
        Minimo = 37353
        Adicional = 0
        ParentFont = False
        TabOrder = 0
        Opcional = True
      end
    end
    object ckbMoedaPadrao: TDBCheckBox
      Left = 576
      Top = 11
      Width = 101
      Height = 23
      Caption = 'Moeda padr'#227'o'
      DataField = 'padrao'
      DataSource = dtmCadastroMoedas.dsrMoedas
      TabOrder = 6
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object gbxInativo: TGroupBox
      Left = 366
      Top = 44
      Width = 75
      Height = 36
      Caption = ' INATIVO '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object edtInativo: TDBEditData
        Left = 2
        Top = 10
        Width = 70
        Height = 23
        Alignment = taLeftJustify
        DataField = 'inativo'
        DataSource = dtmCadastroMoedas.dsrMoedas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        ParentFont = False
        TabOrder = 0
        Opcional = True
      end
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 923
    inherited tblBarra: TToolBar
      Width = 698
    end
  end
end
