inherited frmCadastroDependentesClientes: TfrmCadastroDependentesClientes
  Left = 366
  Top = 207
  Caption = 'Cadastro de Dependentes'
  ClientHeight = 149
  ClientWidth = 364
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    TabOrder = 2
  end
  inherited pnlTopMenu: TPanel
    Width = 364
    inherited tblBarra: TToolBar
      Width = 135
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 53
    Width = 364
    Height = 96
    Align = alClient
    TabOrder = 0
    object ckbDependentesClientesAutorizadoaComprar: TDBCheckBox
      Left = 214
      Top = 63
      Width = 140
      Height = 20
      Caption = 'Autorizado a Comprar'
      DataField = 'autorizadoacomprar'
      DataSource = dtmCadastroClientes.dsrDependentesClientes
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object gbxNomeDependente: TGroupBox
      Left = 10
      Top = 6
      Width = 345
      Height = 36
      Caption = 'NOME DO DEPENDENTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object edtDependentesNome: TDBEditTexto
        Left = 2
        Top = 10
        Width = 340
        Height = 23
        DataField = 'nome'
        DataSource = dtmCadastroClientes.dsrDependentesClientes
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
      end
    end
    object gbxNasctoDependente: TGroupBox
      Left = 10
      Top = 49
      Width = 75
      Height = 36
      Caption = 'NASCTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object edtDependentesNascto: TDBEditData
        Left = 2
        Top = 10
        Width = 70
        Height = 23
        DataField = 'nascto'
        DataSource = dtmCadastroClientes.dsrDependentesClientes
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
end
