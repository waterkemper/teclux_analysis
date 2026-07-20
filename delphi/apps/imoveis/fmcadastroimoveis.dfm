inherited frmCadastroImoveis: TfrmCadastroImoveis
  Left = 951
  Top = 216
  ActiveControl = edfCodigoEmpreendimento
  Caption = 'Cadastro de Im'#243'veis'
  ClientHeight = 639
  ClientWidth = 711
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = -8
    Top = 154
  end
  inherited pnlTopMenu: TPanel
    Width = 711
    inherited tblBarra: TToolBar
      Width = 486
    end
  end
  object gbxImoveis: TGroupBox
    Left = 0
    Top = 40
    Width = 711
    Height = 237
    Align = alTop
    Caption = #39
    TabOrder = 2
    object lblAreasDo: TLabel
      Left = 594
      Top = 8
      Width = 54
      Height = 14
      Caption = #193'REAS DO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
    end
    object gbxNumero: TGroupBox
      Left = 8
      Top = 128
      Width = 147
      Height = 36
      Caption = ' N'#218'MERO '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
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
        Font.Name = 'Arial'
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
        Alignment = taLeftJustify
        DataField = 'numero'
        DataSource = dtmCadastroImoveis.dsrImoveis
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
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
      Left = 8
      Top = 10
      Width = 465
      Height = 36
      Caption = ' EMPREENDIMENTO '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object sbnProcuraEmpreendimento: TSpeedButton
        Left = 67
        Top = 10
        Width = 23
        Height = 22
        Hint = 'Procura Empreendimento'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
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
        Top = 10
        Width = 65
        Height = 23
        Alignment = taLeftJustify
        DataField = 'codigo'
        DataSource = dtmCadastroImoveis.dsrProcuraEmpreendimentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
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
            Control = gbxNumero
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
        Top = 10
        Width = 372
        Height = 23
        TabStop = False
        Color = clBtnFace
        DataField = 'nome'
        DataSource = dtmCadastroImoveis.dsrProcuraEmpreendimentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Alignment = taLeftJustify
      end
    end
    object gbxBlocos: TGroupBox
      Left = 8
      Top = 48
      Width = 274
      Height = 37
      Caption = ' BLOCO '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object cbxBlocos: TTecDBLookupComboBox
        Left = 2
        Top = 10
        Width = 270
        Height = 23
        DataField = 'bloco'
        DataSource = dtmCadastroImoveis.dsrImoveis
        DropDownRows = 10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        KeyField = 'codigo'
        ListField = 'descricao'
        ListFieldIndex = 2
        ListSource = dtmCadastroImoveis.dsrConsultaBlocos
        ParentFont = False
        TabOrder = 0
        OnCloseUp = cbxBlocosCloseUp
        OnEnter = cbxBlocosEnter
        OnExit = cbxBlocosExit
        OnKeyDown = cbxBlocosKeyDown
      end
    end
    object rgpsituacao: TtecDBRadioGroup
      Left = 375
      Top = 49
      Width = 98
      Height = 75
      Caption = ' SITUA'#199#195'O '
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 4
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
        Font.Name = 'Arial'
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
        Font.Name = 'Arial'
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
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Value = 'V'
        ReadOnly = True
      end
    end
    object gbxObsEmpreendimento: TGroupBox
      Left = 8
      Top = 171
      Width = 548
      Height = 58
      Caption = ' OBSERVA'#199#212'ES DO EMPREENDIMENTO '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      object mmoobservacoesimoveis: TtecDBMemo
        Left = 2
        Top = 14
        Width = 544
        Height = 42
        TabStop = False
        Align = alClient
        DataField = 'observacoes'
        DataSource = dtmCadastroImoveis.dsrProcuraEmpreendimentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object gbxTipodeUnidade: TGroupBox
      Left = 8
      Top = 88
      Width = 274
      Height = 37
      Caption = ' TIPO DE UNIDADE '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object cbxTipodeUnidade: TTecDBLookupComboBox
        Left = 2
        Top = 10
        Width = 270
        Height = 23
        DataField = 'unidade'
        DataSource = dtmCadastroImoveis.dsrImoveis
        DropDownRows = 10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        KeyField = 'codigo'
        ListField = 'nome'
        ListFieldIndex = 2
        ListSource = dtmCadastroImoveis.dsrConsultaTiposUnidades
        ParentFont = False
        TabOrder = 0
        OnCloseUp = cbxTipodeUnidadeCloseUp
        OnEnter = cbxTipodeUnidadeEnter
        OnExit = cbxTipodeUnidadeExit
        OnKeyDown = cbxTipodeUnidadeKeyDown
      end
    end
    object GroupBox5: TGroupBox
      Left = 564
      Top = 22
      Width = 115
      Height = 171
      Caption = ' EMPREENDIMENTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      object gbxAreaTotal: TGroupBox
        Left = 0
        Top = 95
        Width = 115
        Height = 36
        Caption = ' '#193'REA TOTAL '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object DBEditNumero3: TDBEditNumero
          Left = 2
          Top = 10
          Width = 110
          Height = 23
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = '3,0000'
          Mascara = True
          TipoMascara = tmGERAL
          NrDecimal = 4
          Decimais = True
          Negativo = False
          Tamanho = 9
          DataField = 'TotalArea'
          DataSource = dtmCadastroImoveis.dsrImoveis
        end
      end
      object GroupBox6: TGroupBox
        Left = 0
        Top = 15
        Width = 115
        Height = 36
        Caption = ' '#193'REA PRIVATIVA '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object DBEditNumero1: TDBEditNumero
          Left = 2
          Top = 10
          Width = 110
          Height = 23
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          TabOrder = 0
          Text = '1,0000'
          Mascara = True
          TipoMascara = tmGERAL
          NrDecimal = 4
          Decimais = True
          Negativo = False
          Tamanho = 9
          DataField = 'TotalPrivativa'
          DataSource = dtmCadastroImoveis.dsrImoveis
        end
      end
      object GroupBox7: TGroupBox
        Left = 0
        Top = 55
        Width = 115
        Height = 36
        Caption = ' '#193'REA COMUM '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object DBEditNumero2: TDBEditNumero
          Left = 2
          Top = 10
          Width = 110
          Height = 23
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          TabOrder = 0
          Text = '2,0000'
          Mascara = True
          TipoMascara = tmGERAL
          NrDecimal = 4
          Decimais = True
          Negativo = False
          Tamanho = 9
          DataField = 'TotalComum'
          DataSource = dtmCadastroImoveis.dsrImoveis
        end
      end
      object GroupBox8: TGroupBox
        Left = 0
        Top = 135
        Width = 115
        Height = 36
        Caption = ' FRA'#199#195'O IDEAL '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object DBEditNumero4: TDBEditNumero
          Left = 2
          Top = 10
          Width = 110
          Height = 23
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          TabOrder = 0
          Text = '4,0000'
          OnExit = edtfracaoIdealExit
          Mascara = True
          TipoMascara = tmGERAL
          NrDecimal = 4
          Decimais = True
          Negativo = False
          Tamanho = 9
          DataField = 'TotalFracao'
          DataSource = dtmCadastroImoveis.dsrImoveis
        end
      end
    end
  end
  object gbxDados: TGroupBox
    Left = 0
    Top = 277
    Width = 711
    Height = 362
    Align = alClient
    TabOrder = 3
    object gbxAreas: TGroupBox
      Left = 10
      Top = 48
      Width = 413
      Height = 50
      Caption = ' '#193'REAS '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object lblMais: TLabel
        Left = 95
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
        Left = 0
        Top = 14
        Width = 90
        Height = 36
        Caption = ' PRIVATIVA '
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
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          TabOrder = 0
          Text = 'edtareaprivativa'
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
        Caption = ' COMUM '
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
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          TabOrder = 0
          Text = 'edtAreaComum'
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
        Caption = ' TOTAL '
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
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          MaxLength = -1
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = 'edtAreaTotal'
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
        Caption = ' FRA'#199#195'O IDEAL '
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
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          TabOrder = 0
          Text = 'edtfracaoIdeal'
          OnExit = edtfracaoIdealExit
          Mascara = True
          Alignment = taLeftJustify
          TipoMascara = tmGERAL
          NrDecimal = 6
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
      Top = 49
      Width = 145
      Height = 49
      Caption = ' VALOR '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object edtPrecoImovel: TDBEditNumero
        Left = 2
        Top = 11
        Width = 140
        Height = 36
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        MaxLength = -1
        ParentFont = False
        TabOrder = 0
        Text = 'edtPrecoImovel'
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
      Top = 103
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
      TabOrder = 4
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
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object gbxPavimentos: TGroupBox
      Left = 8
      Top = 10
      Width = 145
      Height = 36
      Caption = ' PAVIMENTO '
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
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 12
        ParentFont = False
        TabOrder = 0
        CharCasenoDefault = False
        Alignment = taLeftJustify
      end
    end
    object pgcDadosAdicionais: TtecPageControl
      Left = 2
      Top = 179
      Width = 707
      Height = 181
      ActivePage = tstCompradores
      Align = alBottom
      TabOrder = 5
      object tstCompradores: TTabSheet
        Caption = ' &1 - Compradores'
        object dbgCompradores: TtecDBGrid
          Left = 0
          Top = 0
          Width = 699
          Height = 150
          Align = alClient
          DataSource = dtmCadastroImoveis.dsrCompradores
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -13
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
          CanNotInsertFromGrid = False
          PostOnEnter = False
          PostOnSetUpDown = False
          DenySort = False
          DefaultRowHeight = 19
          ExibirNumerodaLinha = False
          NaoAtribuirDadosaTabelaaoDigitar = False
          ShowWhenFieldInvisible = False
          Columns = <
            item
              Expanded = False
              FieldName = 'cliente'
              Title.Alignment = taCenter
              Title.Caption = 'C'#211'DIGO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'Arial'
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
              Title.Font.Name = 'Arial'
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
              Title.Font.Name = 'Arial'
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
          Height = 150
          Align = alClient
          DataSource = dtmCadastroImoveis.dsrOutrosImoveis
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -13
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
          CanNotInsertFromGrid = False
          PostOnEnter = False
          PostOnSetUpDown = False
          DenySort = False
          DefaultRowHeight = 19
          ExibirNumerodaLinha = False
          NaoAtribuirDadosaTabelaaoDigitar = False
          ShowWhenFieldInvisible = False
          Columns = <
            item
              Expanded = False
              FieldName = 'nomeempreendimento'
              Title.Alignment = taCenter
              Title.Caption = 'NOME DO EMPREENDIMENTO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'Arial'
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
              Title.Font.Name = 'Arial'
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
              Title.Font.Name = 'Arial'
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
              Title.Font.Name = 'Arial'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 115
              Visible = True
            end>
        end
      end
    end
    object gbxContrato: TGroupBox
      Left = 160
      Top = 10
      Width = 95
      Height = 36
      Caption = ' CONTRATO '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
      object edtContrato: TDBEditNumero
        Left = 2
        Top = 10
        Width = 91
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = -1
        ParentFont = False
        TabOrder = 0
        Mascara = True
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
