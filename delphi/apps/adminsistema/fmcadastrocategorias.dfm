inherited frmCadastroCategorias: TfrmCadastroCategorias
  Left = 614
  Top = 251
  ActiveControl = edfCodigo
  Caption = 'Cadastro de Categorias'
  ClientHeight = 178
  ClientWidth = 386
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited tblBarra: TToolBar
    Width = 386
    TabOrder = 2
    inherited tbnDivisor: TToolButton
      Left = 0
      Wrap = True
    end
    inherited sbnAjuda: TSpeedButton
      Left = 0
      Top = 51
    end
    inherited sbnIncluir: TSpeedButton
      Left = 75
      Top = 51
    end
    inherited sbnSalvar: TSpeedButton
      Left = 150
      Top = 51
    end
    inherited sbnExcluir: TSpeedButton
      Left = 225
      Top = 51
    end
  end
  inherited pnlBarra: TPanel
    Width = 430
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 53
    Width = 386
    Height = 125
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 1
    object gbxFundoJanela: TGroupBox
      Left = 3
      Top = 3
      Width = 380
      Height = 119
      Align = alClient
      TabOrder = 0
      object gbxCodigo: TGroupBox
        Left = 16
        Top = 16
        Width = 66
        Height = 42
        Caption = 'C'#243'digo'
        TabOrder = 0
        object edfCodigo: TtecDbEditFind
          Left = 5
          Top = 15
          Width = 56
          Height = 21
          Hint = 'C'#243'digo da categoria'
          DataField = 'Codigo'
          DataSource = dtmCadastroCategorias.dsrCategorias
          Group = 'Categorias'
          MaxLength = 3
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
      object gbxHierarquia: TGroupBox
        Left = 130
        Top = 16
        Width = 109
        Height = 42
        Caption = 'Hierarquia'
        TabOrder = 1
        object edtHierarquia: TDBEditTexto
          Left = 3
          Top = 16
          Width = 101
          Height = 21
          Hint = 'Define a hierarquia das categorias e eventos'
          CharCase = ecUpperCase
          DataField = 'Hierarquia'
          DataSource = dtmCadastroCategorias.dsrCategorias
          MaxLength = 13
          TabOrder = 0
          CharCasenoDefault = False
        end
      end
      object gbxInativo: TGroupBox
        Left = 279
        Top = 16
        Width = 85
        Height = 42
        Caption = 'Inativo'
        TabOrder = 3
        object edtInativo: TDBEditData
          Left = 4
          Top = 16
          Width = 75
          Height = 21
          Hint = 'Data em que a categoria deixou de ser usada'
          DataField = 'Inativo'
          DataSource = dtmCadastroCategorias.dsrCategorias
          Maximo = 0
          Minimo = 37353
          Adicional = 0
          TabOrder = 0
          Opcional = True
        end
      end
      object gbxDescricao: TGroupBox
        Left = 16
        Top = 70
        Width = 349
        Height = 41
        Caption = 'Descri'#231#227'o'
        TabOrder = 2
        object edtDescricao: TDBEditTexto
          Left = 2
          Top = 16
          Width = 342
          Height = 21
          Hint = 'Descri'#231#227'o da categoria'
          CharCase = ecUpperCase
          DataField = 'Descricao'
          DataSource = dtmCadastroCategorias.dsrCategorias
          MaxLength = 12
          TabOrder = 0
          CharCasenoDefault = False
        end
      end
    end
  end
end
