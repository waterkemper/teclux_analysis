inherited frmCadastroNiveisConhecimento: TfrmCadastroNiveisConhecimento
  Left = 605
  Top = 279
  ActiveControl = edfCodigo
  Caption = 'Cadastro de N'#237'veis de Conhecimento'
  ClientHeight = 90
  ClientWidth = 420
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 0
    Top = 40
    Width = 420
    Height = 50
    Align = alClient
    BevelOuter = bvNone
    Visible = True
    inherited bvlBotoesEd: TBevel
      Left = 0
      Top = 50
      Width = 420
      Height = 0
      Align = alBottom
    end
    object gbxCodigoMaquina: TGroupBox
      Left = 10
      Top = 10
      Width = 60
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
      object edfCodigo: TtecDbEditFind
        Left = 2
        Top = 10
        Width = 55
        Height = 23
        Alignment = taLeftJustify
        DataField = 'codigo'
        DataSource = dtmCadastroNiveisConhecimento.dsrNiveisConhecimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Group = 'maquina'
        MaxLength = 6
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
        DenyInsert = True
        NoSetControls = <>
        SetControls = <
          item
            Control = gbxDescricao
          end
          item
          end
          item
          end
          item
          end>
      end
    end
    object gbxDescricao: TGroupBox
      Left = 79
      Top = 10
      Width = 330
      Height = 37
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
        Width = 325
        Height = 23
        DataField = 'descricao'
        DataSource = dtmCadastroNiveisConhecimento.dsrNiveisConhecimento
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
  inherited pnlTopMenu: TPanel
    Width = 420
    inherited tblBarra: TToolBar
      Width = 195
    end
  end
end
