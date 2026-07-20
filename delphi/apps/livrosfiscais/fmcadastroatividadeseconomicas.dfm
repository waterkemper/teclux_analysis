inherited frmCadastroAtividadesEconomicas: TfrmCadastroAtividadesEconomicas
  Left = 359
  Top = 158
  Caption = 'Cadastro Nacional de Atividades Econ'#244'micas'
  ClientHeight = 196
  ClientWidth = 797
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Top = 0
  end
  inherited pnlTopMenu: TPanel
    Width = 797
    inherited tblBarra: TToolBar
      Width = 572
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 40
    Width = 797
    Height = 156
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 2
    object gbxAtividade: TGroupBox
      Left = 7
      Top = 118
      Width = 126
      Height = 36
      Caption = 'COD. ATIVIDADE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object edtCodigoAtividade: TDBEditTexto
        Left = 3
        Top = 10
        Width = 118
        Height = 23
        DataField = 'codigoatividade'
        DataSource = dtmCadastroAtividadesEconomicas.dsrAtividadesEconomicas
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
    object gbxCodigo: TGroupBox
      Left = 6
      Top = 5
      Width = 83
      Height = 36
      Caption = 'C'#211'DIGO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object edfCodigoFiscal: TtecDbEditFind
        Left = 2
        Top = 10
        Width = 79
        Height = 23
        Alignment = taLeftJustify
        DataField = 'codigo'
        DataSource = dtmCadastroAtividadesEconomicas.dsrAtividadesEconomicas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Group = 'codigo'
        MaxLength = 7
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        Opcional = True
        ParentFont = False
        TabOrder = 0
        PermitirZero = False
        PermitirNulo = False
        Operacao = opATRIBUICAO
        Parameter = 'codigo'
        ActiveSetControls = True
        DenyInsert = False
        NoSetControls = <>
        SetControls = <
          item
            Control = gbxDescricao
          end
          item
            Control = gbxDenominacao
          end
          item
            Control = gbxAtividade
          end>
      end
    end
    object gbxDescricao: TGroupBox
      Left = 6
      Top = 43
      Width = 779
      Height = 36
      Caption = 'DESCRI'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object edtDescricao: TDBEditTexto
        Left = 2
        Top = 10
        Width = 772
        Height = 23
        DataField = 'descricao'
        DataSource = dtmCadastroAtividadesEconomicas.dsrAtividadesEconomicas
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
    object gbxDenominacao: TGroupBox
      Left = 6
      Top = 80
      Width = 779
      Height = 36
      Caption = 'DENOMINA'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object edtDenominacao: TDBEditTexto
        Left = 2
        Top = 10
        Width = 772
        Height = 23
        DataField = 'denominacao'
        DataSource = dtmCadastroAtividadesEconomicas.dsrAtividadesEconomicas
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
    object gbxItem: TGroupBox
      Left = 135
      Top = 118
      Width = 38
      Height = 36
      Caption = 'ITEM'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      object dtxItem: TDBEditTexto
        Left = 3
        Top = 10
        Width = 31
        Height = 23
        DataField = 'item'
        DataSource = dtmCadastroAtividadesEconomicas.dsrAtividadesEconomicas
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
    object gbxSubItem: TGroupBox
      Left = 178
      Top = 118
      Width = 53
      Height = 36
      Caption = 'SUBITEM'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      object DBEditTexto1: TDBEditTexto
        Left = 3
        Top = 10
        Width = 47
        Height = 23
        DataField = 'subitem'
        DataSource = dtmCadastroAtividadesEconomicas.dsrAtividadesEconomicas
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
  end
end
