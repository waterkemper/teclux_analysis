inherited frmCadastroTabelasGIA: TfrmCadastroTabelasGIA
  Left = 404
  Top = 296
  ActiveControl = pgcTabelas
  Caption = 'Cadastro Tabelas da GIA'
  ClientWidth = 529
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 8
    Top = 146
    Width = 497
  end
  inherited pnlTopMenu: TPanel
    Width = 529
    TabOrder = 2
    inherited tblBarra: TToolBar
      Width = 304
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 40
    Width = 529
    Height = 182
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 1
    object pgcTabelas: TtecPageControl
      Left = 3
      Top = 3
      Width = 523
      Height = 176
      ActivePage = tstClassesPagto
      Align = alClient
      MultiLine = True
      TabIndex = 0
      TabOrder = 0
      TabStop = False
      OnChange = pgcTabelasChange
      object tstClassesPagto: TTabSheet
        BorderWidth = 3
        Caption = '  Cla&sses de pagamento'
        ImageIndex = 1
        object gbxClassesPagto: TGroupBox
          Left = 0
          Top = 0
          Width = 509
          Height = 139
          Align = alClient
          TabOrder = 0
          object lblDescricaoClassesPagto: TLabel
            Left = 7
            Top = 43
            Width = 58
            Height = 16
            Alignment = taRightJustify
            Caption = 'Descri'#231#227'o'
          end
          object lblCodigoClassesPagto: TLabel
            Left = 25
            Top = 16
            Width = 40
            Height = 16
            Alignment = taRightJustify
            Caption = 'C'#243'digo'
            FocusControl = edfCodigoClassePagto
          end
          object lblPeriodoReceita: TLabel
            Left = 21
            Top = 69
            Width = 44
            Height = 16
            Alignment = taRightJustify
            Caption = 'Per'#237'odo'
          end
          object edtDescricaoClassesPagto: TDBEditTexto
            Left = 70
            Top = 39
            Width = 400
            Height = 23
            DataField = 'descricao'
            DataSource = dtmCadastroTabelasGIA.dsrClassesPagto
            MaxLength = -1
            TabOrder = 1
            CharCasenoDefault = False
          end
          object edfCodigoClassePagto: TtecDbEditFind
            Left = 70
            Top = 12
            Width = 60
            Height = 24
            CharCase = ecUpperCase
            DataField = 'codigo'
            DataSource = dtmCadastroTabelasGIA.dsrClassesPagto
            Group = 'ClassePagto'
            MaxLength = 2
            Maximo = 0
            Minimo = 37353
            Adicional = 0
            Opcional = True
            TabOrder = 0
            PermitirZero = False
            PermitirNulo = False
            Operacao = opATRIBUICAO
            Parameter = 'codigo'
            ActiveSetControls = True
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
          end
          object edtPeriodoReceita: TDBEditTexto
            Left = 70
            Top = 66
            Width = 400
            Height = 23
            DataField = 'periodo'
            DataSource = dtmCadastroTabelasGIA.dsrClassesPagto
            MaxLength = -1
            TabOrder = 2
            CharCasenoDefault = False
          end
        end
      end
      object tstReceitasTributarias: TTabSheet
        BorderWidth = 2
        Caption = '  R&eceitas tribut'#225'rias'
        ImageIndex = 7
        object gbxColuna: TGroupBox
          Left = 0
          Top = 0
          Width = 485
          Height = 99
          Align = alClient
          TabOrder = 0
          object lblCodigoReceita: TLabel
            Left = 25
            Top = 16
            Width = 40
            Height = 16
            Caption = 'C'#243'digo'
            FocusControl = edfCodigoReceita
          end
          object lblDescricaoReceita: TLabel
            Left = 7
            Top = 42
            Width = 58
            Height = 16
            Caption = 'Descri'#231#227'o'
          end
          object edtDescricaoReceita: TDBEditTexto
            Left = 70
            Top = 39
            Width = 400
            Height = 23
            DataField = 'descricao'
            DataSource = dtmCadastroTabelasGIA.dsrReceitasTributarias
            MaxLength = -1
            TabOrder = 1
            CharCasenoDefault = False
          end
          object edfCodigoReceita: TtecDbEditFind
            Left = 70
            Top = 12
            Width = 60
            Height = 23
            DataField = 'codigo'
            DataSource = dtmCadastroTabelasGIA.dsrReceitasTributarias
            Group = 'Receitas'
            MaxLength = 5
            Maximo = 0
            Minimo = 37353
            Adicional = 0
            Opcional = True
            TabOrder = 0
            PermitirZero = False
            PermitirNulo = False
            Operacao = opATRIBUICAO
            Parameter = 'codigo'
            ActiveSetControls = True
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
          end
        end
      end
    end
  end
end
