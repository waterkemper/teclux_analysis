inherited frmCadastroPrecos: TfrmCadastroPrecos
  Left = 389
  ActiveControl = edtPreco
  Caption = 'Cadastro de Pre'#231'os'
  ClientHeight = 137
  ClientWidth = 698
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Width = 436
    inherited bvlBotoesEd: TBevel
      Left = 201
      Height = 35
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 698
    TabOrder = 2
    inherited tblBarra: TToolBar
      Width = 473
      inherited sbnProcurar: TSpeedButton
        Enabled = False
        Visible = False
      end
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 40
    Width = 698
    Height = 97
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 1
    object gbxPrecos: TGroupBox
      Left = 3
      Top = 3
      Width = 692
      Height = 91
      Align = alClient
      TabOrder = 0
      object lblCaracteristica: TLabel
        Left = 24
        Top = 13
        Width = 45
        Height = 16
        Caption = 'Produto'
      end
      object lblDescricao: TLabel
        Left = 10
        Top = 39
        Width = 58
        Height = 16
        Caption = 'Descri'#231#227'o'
      end
      object lblPromocao: TLabel
        Left = 10
        Top = 63
        Width = 59
        Height = 16
        Caption = 'Promo'#231#227'o'
      end
      object Label1: TLabel
        Left = 554
        Top = 66
        Width = 49
        Height = 16
        Caption = 'Validade'
      end
      object dtxCaracteristica: TtecDBText
        Left = 75
        Top = 9
        Width = 120
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'caracteristica'
        DataSource = dtmCadastroProdutos.dsrPrecos
        ReadOnly = True
        TabOrder = 0
        Alignment = taLeftJustify
      end
      object edtPreco: TDBEditTexto
        Left = 75
        Top = 35
        Width = 471
        Height = 23
        DataField = 'descricao'
        DataSource = dtmCadastroProdutos.dsrPrecos
        MaxLength = -1
        TabOrder = 1
        CharCasenoDefault = False
        Alignment = taLeftJustify
      end
      inline fraConsultaPromocao: TfraConsultaCodigo
        Left = 75
        Top = 61
        Width = 478
        Height = 23
        HorzScrollBar.Range = 497
        HorzScrollBar.Visible = False
        VertScrollBar.Range = 23
        VertScrollBar.Visible = False
        AutoScroll = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        inherited dtxDescricao: TtecDBText
          Width = 385
          DataField = 'descricao'
          DataSource = fraConsultaPromocao.dsrProcuraPromocoes
        end
        inherited edfCodigo: TtecDBFindLookup
          DataField = 'promocao'
          DataSource = dtmCadastroProdutos.dsrPrecos
          LookupField = 'codigo'
          LookupSource = fraConsultaPromocao.dsrProcuraPromocoes
          LookupQueryParameter = 'codigo'
          Parameter = ' '
          ActiveSetControls = False
          DenyInsert = False
          NoSetControls = <>
          SetControls = <>
          LookupParameter = 'codigo'
        end
      end
      object edtDataValidadePromocao: TDBEditData
        Left = 609
        Top = 63
        Width = 75
        Height = 23
        TabStop = False
        Alignment = taLeftJustify
        Color = clBtnFace
        DataField = 'validade'
        DataSource = fraConsultaPromocao.dsrProcuraPromocoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Maximo = 37500
        Minimo = 37353
        Adicional = 0
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Opcional = True
      end
    end
  end
end
