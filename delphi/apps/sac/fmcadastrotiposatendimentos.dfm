inherited frmCadastroTiposAtendimentos: TfrmCadastroTiposAtendimentos
  Left = 511
  Top = 188
  Caption = 'Cadastro de Tipos de Atendimento'
  ClientHeight = 213
  ClientWidth = 385
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 128
    Top = 34
    Width = 362
  end
  inherited pnlTopMenu: TPanel
    Width = 385
    inherited tblBarra: TToolBar
      Width = 160
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 45
    Width = 385
    Height = 168
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 2
    object gbxCodigo: TGroupBox
      Left = 6
      Top = 10
      Width = 60
      Height = 36
      Caption = ' C'#211'DIGO '
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
        DataSource = dtmCadastroTiposAtendimentos.dsrTiposAtendimentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Group = 'TipoAtendimento'
        MaxLength = 3
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
        NoSetControls = <
          item
            Control = pnlBarra
          end>
        SetControls = <>
      end
    end
    object gbxDescricao: TGroupBox
      Left = 75
      Top = 10
      Width = 300
      Height = 36
      Caption = ' DESCRI'#199#195'O '
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
        Width = 295
        Height = 23
        DataField = 'descricao'
        DataSource = dtmCadastroTiposAtendimentos.dsrTiposAtendimentos
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
    object rgbTiposAtendimento: TtecDBRadioGroup
      Left = 75
      Top = 54
      Width = 132
      Height = 110
      Caption = ' TIPO DE ATENDIMENTO '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      TabStop = False
      DataField = 'tipo'
      DataSource = dtmCadastroTiposAtendimentos.dsrTiposAtendimentos
      object ckbReclamacao: TtecRadioButton
        Left = 11
        Top = 31
        Width = 90
        Height = 17
        Caption = 'Reclama'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Value = 'R'
      end
      object ckbVisita: TtecRadioButton
        Left = 11
        Top = 50
        Width = 90
        Height = 17
        Caption = 'Contato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Value = 'V'
      end
      object ckbCobranca: TtecRadioButton
        Left = 11
        Top = 13
        Width = 90
        Height = 17
        Caption = 'Cobran'#231'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Value = 'C'
      end
      object ckbOrcamento: TtecRadioButton
        Left = 11
        Top = 69
        Width = 90
        Height = 17
        Caption = 'Or'#231'amento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Value = 'O'
      end
      object ckbEntrega: TtecRadioButton
        Left = 11
        Top = 87
        Width = 90
        Height = 17
        Caption = 'Entrega'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Value = 'E'
      end
    end
  end
end
