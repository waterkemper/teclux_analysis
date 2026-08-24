inherited frmCadastroImoveis: TfrmCadastroImoveis
  Left = 452
  Top = 122
  ActiveControl = edfCodigoEmpreendimento
  Caption = 'Cadastro de Im'#243'veis'
  ClientHeight = 639
  ClientWidth = 719
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 0
    Top = 154
  end
  inherited pnlTopMenu: TPanel
    Left = 8
    Width = 711
    inherited tblBarra: TToolBar
      Width = 486
    end
  end
  object gbxImoveis: TGroupBox
    Left = 8
    Top = 40
    Width = 711
    Height = 237
    Align = alTop
    TabOrder = 2
    object gbxCodigo: TGroupBox
      Left = 10
      Top = 125
      Width = 147
      Height = 36
      Caption = 'N'#218'MERO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      object sbnProcurarNUmeroImoveis: TSpeedButton
        Left = 120
        Top = 11
        Width = 23
        Height = 22
        Hint = 'Procura N'#250'mero do Im'#243'vel'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
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
        OnClick = sbnProcurarNUmeroImoveisClick
      end
      object edfNumeroImovel: TtecDbEditFind
        Left = 2
        Top = 10
        Width = 119
        Height = 23
        DataField = 'numero'
        DataSource = dtmCadastroImoveis.dsrImoveis
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Group = 'B'
        MaxLength = 10
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        Opcional = True
        OnChange = edfNumeroImovelChange
        OnEnter = edfNumeroImovelEnter
        OnExit = edfNumeroImovelExit
        OnFound = edfNumeroImovelFound
        ParentFont = False
        TabOrder = 0
        PermitirZero = False
        PermitirNulo = False
        Operacao = opATRIBUICAO
        Parameter = 'Imovel'
        ActiveSetControls = True
        DenyInsert = False
        NoSetControls = <
          item
            Control = gbxEmpreendimentos
          end
          item
            Control = gbxBlocos
          end>
        SetControls = <
          item
            Control = gbxDados
          end
          item
            Control = rgpsituacao
          end
          item
            Control = gbxObsEmpreendimento
          end>
      end
    end
    object gbxEmpreendimentos: TGroupBox
      Left = 10
      Top = 6
      Width = 465
      Height = 36
      Caption = 'EMPREENDIMENTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object sbnProcuraEmpreendimento: TSpeedButton
        Left = 67
        Top = 12
        Width = 23
        Height = 22
        Hint = 'Procura Empreendimento'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
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
        OnClick = sbnProcuraEmpreendimentoClick
      end
      object edfCodigoEmpreendimento: TtecDBFindLookup
        Left = 2
        Top = 11
        Width = 65
        Height = 23
        DataField = 'codigo'
        DataSource = dtmCadastroImoveis.dsrProcuraEmpreendimentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Group = 'A'
        MaxLength = 5
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        Opcional = True
        ParentFont = False
        TabOrder = 0
        PermitirZero = False
        PermitirNulo = False
        Operacao = opPESQUISA
        Parameter = 'Codigo'
        ActiveSetControls = True
        DenyInsert = True
        NoSetControls = <
          item
            Control = sbnProcuraEmpreendimento
          end>
        SetControls = <
          item
            Control = gbxBlocos
          end
          item
            Control = gbxTipodeUnidade
          end
          item
            Control = gbxCodigo
          end
          item
            Control = rgpsituacao
          end
          item
            Control = gbxObsEmpreendimento
          end
          item
            Control = gbxDados
          end>
      end
      object dtxDescricao: TtecDBText
        Left = 90
        Top = 11
        Width = 372
        Height = 23
        TabStop = False
        Color = clBtnFace
        DataField = 'nome'
        DataSource = dtmCadastroImoveis.dsrProcuraEmpreendimentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
    object gbxBlocos: TGroupBox
      Left = 10
      Top = 45
      Width = 274
      Height = 37
      Caption = 'BLOCO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object rgpsituacao: TtecDBRadioGroup
      Left = 375
      Top = 47
      Width = 98
      Height = 75
      Caption = 'SITUA'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = False
      DataField = 'situacao'
      DataSource = dtmCadastroImoveis.dsrImoveis
      ReadOnly = True
      object rgbDisponivel: TtecRadioButton
        Left = 8
        Top = 13
        Width = 86
        Height = 17
        Caption = 'Dispon'#237'vel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Value = 'D'
        ReadOnly = True
      end
      object Rgbreservado: TtecRadioButton
        Left = 8
        Top = 33
        Width = 86
        Height = 17
        Caption = 'Reservado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Value = 'R'
        ReadOnly = True
      end
      object Rgbvendido: TtecRadioButton
        Left = 8
        Top = 52
        Width = 86
        Height = 17
        Caption = 'Vendido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Value = 'V'
        ReadOnly = True
      end
    end
    object gbxObsEmpreendimento: TGroupBox
      Left = 10
      Top = 169
      Width = 570
      Height = 58
      Caption = 'OBSERVA'#199#212'ES DO EMPREENDIMENTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      object mmoobservacoesimoveis: TtecDBMemo
        Left = 2
        Top = 14
        Width = 566
        Height = 42
        TabStop = False
        Align = alClient
        DataField = 'observacoes'
        DataSource = dtmCadastroImoveis.dsrProcuraEmpreendimentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object gbxTipodeUnidade: TGroupBox
      Left = 10
      Top = 85
      Width = 274
      Height = 37
      Caption = 'TIPO DE UNIDADE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
  end
  object gbxDados: TGroupBox
    Left = 8
    Top = 277
    Width = 711
    Height = 362
    Align = alClient
    TabOrder = 3
    object gbxareas: TGroupBox
      Left = 10
      Top = 46
      Width = 417
      Height = 50
      Caption = #193'REAS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object lblMais: TLabel
        Left = 97
        Top = 24
        Width = 13
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = '+'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblIgual: TLabel
        Left = 203
        Top = 24
        Width = 19
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = '='
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
      end
      object gbxPrivativa: TGroupBox
        Left = 5
        Top = 14
        Width = 90
        Height = 36
        Caption = 'PRIVATIVA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object edtareaprivativa: TDBEditNumero
          Left = 2
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
          Mascara = True
          Alignment = taLeftJustify
          TipoMascara = tmGERAL
          NrDecimal = 4
          Decimais = True
          Negativo = False
          Tamanho = 9
          DataField = 'areaprivativa'
          DataSource = dtmCadastroImoveis.dsrImoveis
        end
      end
      object gbxComum: TGroupBox
        Left = 112
        Top = 14
        Width = 90
        Height = 36
        Caption = 'COMUM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object edtAreaComum: TDBEditNumero
          Left = 2
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
          Mascara = True
          Alignment = taLeftJustify
          TipoMascara = tmGERAL
          NrDecimal = 4
          Decimais = True
          Negativo = False
          Tamanho = 9
          DataField = 'areacomum'
          DataSource = dtmCadastroImoveis.dsrImoveis
        end
      end
      object gbxTotal: TGroupBox
        Left = 222
        Top = 14
        Width = 90
        Height = 36
        Caption = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object edtAreaTotal: TDBEditNumero
          Left = 2
          Top = 10
          Width = 85
          Height = 23
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          MaxLength = -1
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Mascara = True
          Alignment = taLeftJustify
          TipoMascara = tmGERAL
          NrDecimal = 4
          Decimais = True
          Negativo = False
          Tamanho = 9
          DataField = 'AreaTotal'
          DataSource = dtmCadastroImoveis.dsrImoveis
        end
      end
      object gbxFracaoIdeal: TGroupBox
        Left = 323
        Top = 14
        Width = 90
        Height = 36
        Caption = 'FRA'#199#195'O IDEAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object edtfracaoIdeal: TDBEditNumero
          Left = 2
          Top = 10
          Width = 86
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
          OnExit = edtfracaoIdealExit
          Mascara = True
          Alignment = taLeftJustify
          TipoMascara = tmGERAL
          NrDecimal = 8
          Decimais = True
          Negativo = False
          Tamanho = 9
          DataField = 'fracaoideal'
          DataSource = dtmCadastroImoveis.dsrImoveis
        end
      end
    end
    object gbxPreco: TGroupBox
      Left = 436
      Top = 47
      Width = 145
      Height = 49
      Caption = 'VALOR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object edtPrecoImovel: TDBEditNumero
        Left = 2
        Top = 10
        Width = 140
        Height = 36
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        MaxLength = -1
        ParentFont = False
        TabOrder = 0
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = False
        Tamanho = 9
        DataField = 'preco'
        DataSource = dtmCadastroImoveis.dsrImoveis
      end
    end
    object gbxObsImovel: TGroupBox
      Left = 11
      Top = 101
      Width = 570
      Height = 68
      Caption = 'OBSERVA'#199#213'ES DO IM'#211'VEL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object mmoObservacoes: TtecDBMemo
        Left = 2
        Top = 14
        Width = 566
        Height = 52
        Align = alClient
        DataField = 'observacoes'
        DataSource = dtmCadastroImoveis.dsrImoveis
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object gbxPavimentos: TGroupBox
      Left = 10
      Top = 7
      Width = 145
      Height = 36
      Caption = 'PAVIMENTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object edtPavimento: TDBEditTexto
        Left = 2
        Top = 10
        Width = 140
        Height = 23
        DataField = 'pavimento'
        DataSource = dtmCadastroImoveis.dsrImoveis
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 12
        ParentFont = False
        TabOrder = 0
        CharCasenoDefault = False
      end
    end
    object pgcDadosAdicionais: TtecPageControl
      Left = 2
      Top = 175
      Width = 707
      Height = 185
      ActivePage = tstCompradores
      Align = alBottom
      TabIndex = 0
      TabOrder = 4
      object tstCompradores: TTabSheet
        Caption = ' &1 - Compradores'
        object dbgCompradores: TtecDBGrid
          Left = 0
          Top = 0
          Width = 699
          Height = 154
          Align = alClient
          DataSource = dtmCadastroImoveis.dsrCompradores
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -13
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
              FieldName = 'nomecomprador'
              Title.Alignment = taCenter
              Title.Caption = 'NOME DO COMPRADOR'
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
              FieldName = 'percentual'
              Title.Alignment = taCenter
              Title.Caption = '%'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 60
              Visible = True
            end>
        end
      end
      object tstOutrosImoveis: TTabSheet
        Caption = ' &2 - Im'#243'veis Associados'
        ImageIndex = 2
        object dbgOutrosImoveis: TtecDBGrid
          Left = 0
          Top = 0
          Width = 699
          Height = 154
          Align = alClient
          DataSource = dtmCadastroImoveis.dsrOutrosImoveis
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -13
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
              FieldName = 'nomeempreendimento'
              Title.Alignment = taCenter
              Title.Caption = 'NOME DO EMPREENDIMENTO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 280
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'nomebloco'
              Title.Alignment = taCenter
              Title.Caption = 'BLOCO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 160
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'tipo'
              Title.Alignment = taCenter
              Title.Caption = 'TIPO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 100
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'numero'
              Title.Alignment = taCenter
              Title.Caption = 'N'#218'MERO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 115
              Visible = True
            end>
        end
      end
    end
    object gbxContrato: TGroupBox
      Left = 159
      Top = 7
      Width = 95
      Height = 36
      Caption = 'CONTRATO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Visible = False
      object edtContrato: TDBEditNumero
        Left = 2
        Top = 10
        Width = 91
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
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 0
        Decimais = False
        Negativo = False
        Tamanho = 9
        DataField = 'contrato'
        DataSource = dtmCadastroImoveis.dsrImoveisVendidos
      end
    end
  end
end
