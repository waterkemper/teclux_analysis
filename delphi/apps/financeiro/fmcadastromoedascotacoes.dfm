inherited frmCadastroMoedasCotacoes: TfrmCadastroMoedasCotacoes
  Left = 414
  Top = 165
  ActiveControl = edtDataCotacao
  Caption = 'Cota'#231#245'es'
  ClientHeight = 125
  ClientWidth = 456
  Font.Height = -11
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlBarra: TPanel
    Left = 0
    Top = 40
    Width = 456
    Height = 85
    Align = alClient
    Visible = True
    inherited bvlBotoesNavegacao: TBevel
      Left = 1
      Top = 84
      Width = 454
      Height = 0
      Align = alBottom
      Visible = False
    end
    object gbxDataCotacao: TGroupBox
      Left = 4
      Top = 3
      Width = 81
      Height = 37
      Caption = 'DATA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -8
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object edtDataCotacao: TtecDBFindLookup
        Left = 4
        Top = 10
        Width = 73
        Height = 18
        DataField = 'data'
        DataSource = dtmCadastroMoedas.dsrMoedasCotacoes
        MaxLength = 10
        Maximo = 37353
        Minimo = 37353
        Adicional = 0
        Opcional = True
        TabOrder = 0
        PermitirZero = False
        PermitirNulo = False
        Operacao = opATRIBUICAO
        LookupParameters = 'data'
        LocateParameters = 'data'
        Parameter = ' '
        ActiveSetControls = False
        DenyInsert = False
        NoSetControls = <>
        SetControls = <>
        LookupParameter = ' '
      end
    end
    object gbxCotacao: TGroupBox
      Left = 87
      Top = 3
      Width = 125
      Height = 37
      Caption = 'COTA'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -8
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object edtCotacao: TDBEditNumero
        Left = 4
        Top = 10
        Width = 117
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
        NrDecimal = 6
        Decimais = True
        Negativo = False
        Tamanho = 16
        DataField = 'cotacao'
        DataSource = dtmCadastroMoedas.dsrMoedasCotacoes
      end
    end
    object gbxObservacaoCotacao: TGroupBox
      Left = 4
      Top = 41
      Width = 448
      Height = 37
      Caption = 'OBSERVA'#199#213'ES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -8
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object edtDescricaoMoeda: TDBEditTexto
        Left = 4
        Top = 10
        Width = 440
        Height = 23
        DataField = 'observacoes'
        DataSource = dtmCadastroMoedas.dsrMoedasCotacoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 30
        ParentFont = False
        TabOrder = 0
        CharCasenoDefault = False
      end
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 456
    inherited tblBarra: TToolBar
      Left = 180
      Width = 276
      inherited sbnProcurar: TSpeedButton
        Width = 8
        Visible = False
      end
      inherited tbnDivisor: TToolButton
        Left = 8
      end
      inherited sbnAjuda: TSpeedButton
        Left = 16
        Width = 60
      end
      inherited sbnPrimeiro: TSpeedButton
        Left = 76
      end
      inherited sbnAnterior: TSpeedButton
        Left = 126
      end
      inherited sbnProximo: TSpeedButton
        Left = 176
      end
      inherited sbnUltimo: TSpeedButton
        Left = 226
      end
    end
    inherited tblBarraCadastro: TToolBar
      Width = 180
      inherited sbnIncluir: TSpeedButton
        Width = 60
      end
      inherited sbnSalvar: TSpeedButton
        Left = 60
        Width = 60
      end
      inherited sbnExcluir: TSpeedButton
        Left = 120
        Width = 60
      end
    end
  end
end
