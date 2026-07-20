inherited frmCadastroProdutos: TfrmCadastroProdutos
  Left = 461
  Top = 174
  Action = actHabilitar
  AutoSize = True
  Caption = 'Itens do Produto'
  ClientHeight = 426
  ClientWidth = 752
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Width = 446
    inherited bvlBotoesEd: TBevel
      Left = 201
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 752
    TabOrder = 2
    inherited tblBarra: TToolBar
      Width = 527
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 45
    Width = 752
    Height = 381
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 1
    object gbxDescricao: TGroupBox
      Left = 3
      Top = 42
      Width = 746
      Height = 36
      Align = alTop
      Caption = ' DESCRI'#199#195'O '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object edtProdutoDescricao: TDBEditTexto
        Left = 4
        Top = 10
        Width = 735
        Height = 23
        DataField = 'descricao'
        DataSource = dtmCadastroProdutos.dsrProdutos
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
    object gbxPreco: TGroupBox
      Left = 3
      Top = 150
      Width = 746
      Height = 36
      Align = alTop
      Caption = ' PRE'#199'O '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      object sbnProcurarPreco: TSpeedButton
        Left = 65
        Top = 10
        Width = 23
        Height = 23
        Hint = 'Procurar Preco'
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7FFFFFFFC3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3800000800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000
          00800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000
          00800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000008000
          00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFF
          FFFFC3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3FFA858800000800000800000FFA858C3C3C30000FF800000800000C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3
          C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFC3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3C3C3C3C3C3C37F
          7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
          FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
          FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
          FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
          FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
          FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
          FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
          FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFFFFFFFC3C3C3C3C3C3C3
          C3C3FFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          800000FFA858FFA858FFA858FFA858FFA858800000C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
          7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3FFA858800000800000800000FFA858C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FC3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
        NumGlyphs = 2
        OnClick = sbnProcurarPrecoClick
      end
      object dtxPreco: TtecDBText
        Left = 89
        Top = 10
        Width = 277
        Height = 23
        TabStop = False
        Color = clBtnFace
        DataField = 'descricao'
        DataSource = dtmCadastroProdutos.dsrProcuraPrecos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Alignment = taLeftJustify
      end
      object flkPreco: TtecDBFindLookup
        Left = 3
        Top = 10
        Width = 60
        Height = 23
        Alignment = taLeftJustify
        DataField = 'preco'
        DataSource = dtmCadastroProdutos.dsrProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 4
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        Opcional = True
        OnMessage = flkPrecoMessage
        ParentFont = False
        TabOrder = 1
        PermitirZero = False
        PermitirNulo = False
        Operacao = opATRIBUICAO
        LookupField = 'codigo'
        LookupSource = dtmCadastroProdutos.dsrProcuraPrecos
        LookupQueryParameter = 'codigo'
        Parameter = ' '
        ActiveSetControls = False
        DenyInsert = True
        NoSetControls = <>
        SetControls = <>
        LookupParameter = 'codigo'
      end
    end
    object gbxReferencia: TGroupBox
      Left = 3
      Top = 227
      Width = 746
      Height = 36
      Align = alTop
      Caption = ' REFER'#202'NCIA '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      object edtReferencia: TDBEditTexto
        Left = 2
        Top = 10
        Width = 236
        Height = 23
        DataField = 'referencia'
        DataSource = dtmCadastroProdutos.dsrProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 13
        ParentFont = False
        TabOrder = 0
        CharCasenoDefault = False
        Alignment = taLeftJustify
      end
    end
    object pnlGrade: TPanel
      Left = 3
      Top = 340
      Width = 746
      Height = 38
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 8
      TabStop = True
      object gbxLinhaGrade: TGroupBox
        Left = 8
        Top = -1
        Width = 270
        Height = 36
        Caption = ' LINHA DA GRADE '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object dbcElementoLinhaGrade: TTecDBLookupComboBox
          Left = 112
          Top = 10
          Width = 155
          Height = 23
          DataField = 'valorgrade1'
          DataSource = dtmCadastroProdutos.dsrProdutos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          KeyField = 'valor'
          ListField = 'valor'
          ListSource = dtmCadastroProdutos.dsrProcuraElementosLinhaGrade
          ParentFont = False
          TabOrder = 1
        end
        object dtxLinhaGrade: TtecDBText
          Left = 2
          Top = 10
          Width = 110
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'Descricao_m'
          DataSource = dtmCadastroProdutos.dsrProcuraLinhaGrade
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Alignment = taLeftJustify
        end
      end
      object gbxColunadaGrade: TGroupBox
        Left = 287
        Top = -1
        Width = 270
        Height = 36
        Caption = ' COLUNA DA GRADE '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object dbcElementoColunaGrade: TTecDBLookupComboBox
          Left = 112
          Top = 10
          Width = 155
          Height = 23
          DataField = 'valorgrade2'
          DataSource = dtmCadastroProdutos.dsrProdutos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          KeyField = 'valor'
          ListField = 'valor'
          ListSource = dtmCadastroProdutos.dsrProcuraElementoColunaGrade
          ParentFont = False
          TabOrder = 1
        end
        object dtxColunaGrade: TtecDBText
          Left = 2
          Top = 10
          Width = 110
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'Descricao_m'
          DataSource = dtmCadastroProdutos.dsrProcuraColunaGrade
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Alignment = taLeftJustify
        end
      end
    end
    object gbxDescricaoPlanilhaCusto: TGroupBox
      Left = 3
      Top = 78
      Width = 746
      Height = 36
      Align = alTop
      Caption = ' DESCRI'#199#195'O NA PLANILHA DE CUSTO '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object edtdescricaoplanilhacusto: TDBEditTexto
        Left = 3
        Top = 10
        Width = 735
        Height = 23
        DataField = 'descricaoplanilhacusto'
        DataSource = dtmCadastroProdutos.dsrProdutos
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
    object gbxNomeSite: TGroupBox
      Left = 3
      Top = 114
      Width = 746
      Height = 36
      Align = alTop
      Caption = ' NOME NO SITE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object edtnome_site: TDBEditTexto
        Left = 2
        Top = 10
        Width = 735
        Height = 23
        DataField = 'nome_site'
        DataSource = dtmCadastroProdutos.dsrProdutos
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
    object GroupBoxCodigoAtributo: TGroupBox
      Left = 3
      Top = 299
      Width = 746
      Height = 36
      Align = alTop
      Caption = 'ATRIBUTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      Visible = False
      inline fraConsultaCodigoAtributos: TfraConsultaCodigo
        Left = 3
        Top = 10
        Width = 286
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
        TabOrder = 0
        inherited sbnProcura: TSpeedButton
          Left = 56
        end
        inherited dtxDescricao: TtecDBText
          Left = 80
          Width = 209
          DataField = 'descricao'
          DataSource = fraConsultaCodigoAtributos.dsrProcuraAtributos
        end
        inherited edfCodigo: TtecDBFindLookup
          Width = 57
          DataField = 'atributos'
          DataSource = dtmCadastroProdutos.dsrProdutos
          LookupField = 'codigo'
          LookupSource = fraConsultaCodigoAtributos.dsrProcuraAtributos
          LookupQueryParameter = 'codigo'
          Parameter = ' '
          ActiveSetControls = False
          DenyInsert = False
          NoSetControls = <>
          SetControls = <>
          LookupParameter = 'codigo'
        end
      end
    end
    object pnlCodigo: TPanel
      Left = 3
      Top = 3
      Width = 746
      Height = 39
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object gbxDataCadastroCaracteristica: TGroupBox
        Left = 264
        Top = 0
        Width = 93
        Height = 38
        Caption = 'DATA CADASTRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object dtxDataCadastroCaracteristica: TtecDBText
          Left = 3
          Top = 12
          Width = 87
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'datacadastro'
          DataSource = dtmCadastroProdutos.dsrProdutos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Alignment = taLeftJustify
        end
      end
      object gbxCodigo: TGroupBox
        Left = 2
        Top = 1
        Width = 249
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
        object edtCodigo: TDBEditTexto
          Left = 2
          Top = 10
          Width = 243
          Height = 23
          DataField = 'codigovisual'
          DataSource = dtmCadastroProdutos.dsrProdutos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 9
          ParentFont = False
          TabOrder = 0
          CharCasenoDefault = False
          Alignment = taLeftJustify
        end
      end
      object gbxDataAtualizado: TGroupBox
        Left = 361
        Top = 0
        Width = 93
        Height = 38
        Caption = 'ATUALIZADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object edtDataAtualizado: TtecDBText
          Left = 3
          Top = 12
          Width = 87
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'data'
          DataSource = dtmCadastroProdutos.dsrProdutos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Alignment = taLeftJustify
        end
      end
    end
    object pnlPromocao: TPanel
      Left = 3
      Top = 186
      Width = 746
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 5
      object gbxPromocao: TGroupBox
        Left = 0
        Top = 3
        Width = 360
        Height = 38
        Caption = 'PROMO'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object edtPrecoPromocao: TDBEditData
          Left = 3
          Top = 12
          Width = 39
          Height = 23
          TabStop = False
          Alignment = taLeftJustify
          Color = clBtnFace
          DataField = 'promocao'
          DataSource = dtmCadastroProdutos.dsrProcuraPrecos
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
          TabOrder = 0
          Opcional = True
        end
        object edtDescricaoPromocao: TDBEditData
          Left = 41
          Top = 12
          Width = 316
          Height = 23
          TabStop = False
          Alignment = taLeftJustify
          Color = clBtnFace
          DataField = 'descricaopromocao'
          DataSource = dtmCadastroProdutos.dsrProcuraPrecos
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
          TabOrder = 1
          Opcional = True
        end
      end
      object gbxValidadePromocao: TGroupBox
        Left = 364
        Top = 3
        Width = 80
        Height = 38
        Caption = 'VALIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object edtDataValidadePromocao: TDBEditData
          Left = 2
          Top = 12
          Width = 75
          Height = 23
          TabStop = False
          Alignment = taLeftJustify
          Color = clBtnFace
          DataField = 'validade'
          DataSource = dtmCadastroProdutos.dsrProcuraPrecos
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
          TabOrder = 0
          Opcional = True
        end
      end
    end
    object pnlInatiivoForalinhaRecolhido: TPanel
      Left = 3
      Top = 263
      Width = 746
      Height = 36
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 9
      object ckbRecolhido: TDBCheckBox
        Left = 284
        Top = 11
        Width = 78
        Height = 18
        Caption = 'Recolhido'
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
        Visible = False
      end
      object gbxInativo: TGroupBox
        Left = 1
        Top = 1
        Width = 80
        Height = 36
        Caption = ' INATIVO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object edtInativo: TDBEditData
          Left = 2
          Top = 10
          Width = 75
          Height = 23
          Alignment = taLeftJustify
          DataField = 'inativo'
          DataSource = dtmCadastroProdutos.dsrProdutos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Maximo = 365
          Minimo = 37353
          Adicional = 0
          ParentFont = False
          TabOrder = 0
          OnExit = edtInativoExit
          Opcional = True
        end
      end
      object gbxForaLinha: TGroupBox
        Left = 95
        Top = 1
        Width = 80
        Height = 36
        Caption = ' FORA LINHA '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object edtForaLinha: TDBEditData
          Left = 2
          Top = 10
          Width = 75
          Height = 23
          Alignment = taLeftJustify
          DataField = 'foralinha'
          DataSource = dtmCadastroProdutos.dsrProdutos
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
          OnExit = edtForaLinhaExit
          Opcional = True
        end
      end
    end
  end
  object aclHabilitar: TActionList
    Left = 408
    Top = 8
    object actHabilitar: TAction
      Caption = 'actHabilitar'
      OnUpdate = actHabilitarUpdate
    end
  end
end
