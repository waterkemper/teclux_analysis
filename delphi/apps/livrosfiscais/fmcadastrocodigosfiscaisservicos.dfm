inherited frmCadastroCodigosFiscaisServicos: TfrmCadastroCodigosFiscaisServicos
  Left = 460
  Top = 272
  AutoSize = False
  Caption = 'Cadastro de C'#243'digos Fiscais de Servi'#231'os'
  ClientHeight = 194
  ClientWidth = 600
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Top = 0
  end
  inherited pnlTopMenu: TPanel
    Width = 600
    inherited tblBarra: TToolBar
      Width = 375
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 40
    Width = 600
    Height = 154
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 2
    object gbxCodigo: TGroupBox
      Left = 6
      Top = 10
      Width = 105
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
        Width = 100
        Height = 23
        DataField = 'codigo'
        DataSource = dtmCadastroCodigosFiscaisServicos.dsrCodigosFiscaisServicos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Group = 'codigofiscal'
        MaxLength = 8
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
        NoSetControls = <
          item
          end>
        SetControls = <>
      end
    end
    object gbxDescricao: TGroupBox
      Left = 119
      Top = 10
      Width = 473
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
        Width = 468
        Height = 23
        DataField = 'descricao'
        DataSource = dtmCadastroCodigosFiscaisServicos.dsrCodigosFiscaisServicos
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
    object gbxDetalhes: TGroupBox
      Left = 6
      Top = 55
      Width = 586
      Height = 92
      Caption = 'DETALHES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object mmoDetalhes: TtecDBMemo
        Left = 2
        Top = 14
        Width = 582
        Height = 76
        Align = alClient
        DataField = 'detalhes'
        DataSource = dtmCadastroCodigosFiscaisServicos.dsrCodigosFiscaisServicos
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
  end
end
