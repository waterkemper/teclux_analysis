inherited frmRequisicoesOSP: TfrmRequisicoesOSP
  Left = 343
  Top = 181
  Caption = 'Requisi'#231#245'es da OSP'
  ClientHeight = 563
  ClientWidth = 1221
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlBarra: TPanel
    Left = 0
    Top = 563
    Width = 1221
    Height = 0
    Align = alBottom
  end
  inherited pnlTopMenu: TPanel
    Width = 1221
    inherited tblBarra: TToolBar
      Width = 996
      inherited sbnAjuda: TSpeedButton
        Action = aclHabilitar
      end
    end
    inherited tblBarraCadastro: TToolBar
      inherited sbnIncluir: TSpeedButton
        Visible = False
      end
      inherited sbnExcluir: TSpeedButton
        Visible = False
      end
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 45
    Width = 1221
    Height = 110
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 603
      Top = 55
      Width = 273
      Height = 51
      Caption = 'LOTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object gbxTamLoteProducao: TGroupBox
        Left = 6
        Top = 12
        Width = 129
        Height = 37
        Caption = 'TAM. LOTE PRODU'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object edtLoteProducao: TDBEditNumero
          Left = 2
          Top = 10
          Width = 124
          Height = 24
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = 'edtLoteProducao'
          Mascara = False
          TipoMascara = tmGERAL
          NrDecimal = 0
          Decimais = True
          Negativo = False
          Tamanho = 9
          DataField = 'quantidadelote'
          DataSource = dtmRequisicoesOSP.dsrOSPLotes
        end
      end
      object gbxQtdadeExcedente: TGroupBox
        Left = 139
        Top = 12
        Width = 129
        Height = 37
        Caption = 'EXCEDENTE PERMITIDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object edtExcedentePermitido: TDBEditNumero
          Left = 2
          Top = 10
          Width = 124
          Height = 24
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = 'edtExcedentePermitido'
          Mascara = False
          TipoMascara = tmGERAL
          NrDecimal = 0
          Decimais = True
          Negativo = False
          Tamanho = 9
          DataField = 'excedentelote'
          DataSource = dtmRequisicoesOSP.dsrOSPLotes
        end
      end
    end
    object gbxQuantidadeProduto: TGroupBox
      Left = 602
      Top = 3
      Width = 342
      Height = 52
      Caption = 'Q U A N T I D A D E S'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object gbxPedida: TGroupBox
        Left = 6
        Top = 12
        Width = 149
        Height = 36
        Caption = 'PEDIDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object edtQuantidade: TDBEditNumero
          Left = 3
          Top = 10
          Width = 80
          Height = 23
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = 'edtQuantidade'
          Mascara = False
          TipoMascara = tmQUANTIDADE
          NrDecimal = 0
          Decimais = False
          Negativo = False
          Tamanho = 0
          DataField = 'quantidadeosp'
          DataSource = dtmRequisicoesOSP.dsrOSPLotes
        end
        object dtxUnidade: TtecDBText
          Left = 87
          Top = 10
          Width = 59
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'unidade'
          DataSource = dtmRequisicoesOSP.dsrOSPLotes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Alignment = taLeftJustify
        end
      end
      object gbxEntregue: TGroupBox
        Left = 160
        Top = 12
        Width = 85
        Height = 36
        Caption = 'ENTREGUE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object dtxEntregue: TtecDBText
          Left = 2
          Top = 10
          Width = 80
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'qtdeentregue'
          DataSource = dtmRequisicoesOSP.dsrOSPLotes
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
      object gbxSaldo: TGroupBox
        Left = 250
        Top = 12
        Width = 85
        Height = 36
        Caption = 'SALDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object dtxSaldo: TtecDBText
          Left = 2
          Top = 10
          Width = 80
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'saldo'
          DataSource = dtmRequisicoesOSP.dsrOSPLotes
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
    object gbxProdutonoCliente: TGroupBox
      Left = 5
      Top = 55
      Width = 594
      Height = 51
      Caption = 'PRODUTO NO CLIENTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object gbxProdutoCliente: TGroupBox
        Left = 4
        Top = 12
        Width = 227
        Height = 36
        Caption = 'C'#211'DIGO DO PRODUTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object edtProdutoCliente: TDBEditTexto
          Left = 2
          Top = 10
          Width = 222
          Height = 24
          TabStop = False
          DataField = 'produto_cliente'
          DataSource = dtmRequisicoesOSP.dsrClientesProdutos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentColor = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          CharCasenoDefault = False
          Alignment = taLeftJustify
        end
      end
      object gbxFinalidade: TGroupBox
        Left = 353
        Top = 12
        Width = 237
        Height = 36
        Caption = 'FINALIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object edtFinalidade: TDBEditTexto
          Left = 2
          Top = 10
          Width = 231
          Height = 24
          TabStop = False
          Color = clBtnFace
          DataField = 'finalidade'
          DataSource = dtmRequisicoesOSP.dsrClientesProdutos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          CharCasenoDefault = False
          Alignment = taLeftJustify
        end
      end
      object gbxOrigem: TGroupBox
        Left = 293
        Top = 12
        Width = 57
        Height = 36
        Caption = 'ORIGEM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object edtOrigem: TDBEditTexto
          Left = 2
          Top = 10
          Width = 52
          Height = 24
          TabStop = False
          Color = clBtnFace
          DataField = 'origem'
          DataSource = dtmRequisicoesOSP.dsrClientesProdutos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          CharCasenoDefault = False
          Alignment = taLeftJustify
        end
      end
      object gbxPN: TGroupBox
        Left = 234
        Top = 12
        Width = 56
        Height = 36
        Caption = 'PN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object edtPN: TDBEditTexto
          Left = 3
          Top = 10
          Width = 50
          Height = 24
          TabStop = False
          Color = clBtnFace
          DataField = 'pn'
          DataSource = dtmRequisicoesOSP.dsrClientesProdutos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 6
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          CharCasenoDefault = False
          Alignment = taLeftJustify
        end
      end
    end
    object gbxProduto: TGroupBox
      Left = 165
      Top = 4
      Width = 434
      Height = 54
      Caption = 'PRODUTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object gbxComplemento: TGroupBox
        Left = 244
        Top = 12
        Width = 185
        Height = 38
        Caption = 'COMPLEMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object dtxComplemento: TtecDBText
          Left = 2
          Top = 11
          Width = 180
          Height = 24
          TabStop = False
          Color = clBtnFace
          DataField = 'complementoproduto'
          DataSource = dtmRequisicoesOSP.dsrOSPLotes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Alignment = taLeftJustify
        end
      end
      object gbxCodigoProduto: TGroupBox
        Left = 4
        Top = 12
        Width = 237
        Height = 38
        Caption = 'C'#211'DIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object dtxProduto: TtecDBText
          Left = 2
          Top = 11
          Width = 232
          Height = 24
          TabStop = False
          Color = clBtnFace
          DataField = 'produtovisual'
          DataSource = dtmRequisicoesOSP.dsrOSPLotes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
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
    object gbxNumero: TGroupBox
      Left = 4
      Top = 5
      Width = 159
      Height = 50
      Caption = 'N'#186' OSP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object Label5: TLabel
        Left = 107
        Top = 12
        Width = 5
        Height = 19
        Caption = '-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblLote: TLabel
        Left = 115
        Top = 0
        Width = 30
        Height = 11
        Caption = ' LOTE '
      end
      object edfOSP: TtecDbEditFind
        Left = 4
        Top = 11
        Width = 101
        Height = 36
        Alignment = taLeftJustify
        DataField = 'osp'
        DataSource = dtmRequisicoesOSP.dsrOSPLotes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -25
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Group = 'osplote'
        MaxLength = 7
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        Opcional = True
        OnEnter = edfOSPEnter
        OnExit = edfOSPExit
        OnKeyDown = edfOSPKeyDown
        ParentFont = False
        TabOrder = 0
        PermitirZero = False
        PermitirNulo = False
        Operacao = opPESQUISA
        Parameter = 'osp'
        ActiveSetControls = True
        DenyInsert = True
        NoSetControls = <
          item
            Control = lblLote
          end>
        SetControls = <>
      end
      object edfLote: TtecDbEditFind
        Left = 116
        Top = 11
        Width = 40
        Height = 36
        Alignment = taLeftJustify
        Constraints.MaxHeight = 36
        Constraints.MinHeight = 36
        DataField = 'numero'
        DataSource = dtmRequisicoesOSP.dsrOSPLotes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -25
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Group = 'osplote'
        MaxLength = 2
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        Opcional = True
        OnEnter = edfLoteEnter
        OnExit = edfLoteExit
        OnKeyDown = edfLoteKeyDown
        ParentFont = False
        TabOrder = 1
        PermitirZero = False
        PermitirNulo = False
        Operacao = opPESQUISA
        Parameter = 'numero'
      end
    end
  end
  object pnlProdutos: TPanel
    Left = 0
    Top = 155
    Width = 1221
    Height = 408
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object gbxprodutos: TGroupBox
      Left = 0
      Top = 0
      Width = 945
      Height = 408
      Align = alLeft
      Caption = ' LISTA DE COMPONENTES '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object dbgRequisicoesOSP: TtecDBGrid
        Left = 2
        Top = 16
        Width = 908
        Height = 299
        Align = alClient
        DataSource = dtmRequisicoesOSP.dsrRequisicoesOSP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'Arial'
        TitleFont.Pitch = fpVariable
        TitleFont.Style = []
        OnDblClick = dbgRequisicoesOSPDblClick
        OnKeyDown = dbgRequisicoesOSPKeyDown
        RowWrap = 60
        Large = False
        DoubleRowColor = True
        TitleMinHeight = 100
        CellHeights = 100
        StrippedColor = 16054260
        CanDelete = False
        CanNotInsertFromGrid = False
        PostOnEnter = False
        PostOnSetUpDown = False
        DenySort = True
        DefaultRowHeight = 19
        ExibirNumerodaLinha = False
        NaoAtribuirDadosaTabelaaoDigitar = False
        ShowWhenFieldInvisible = False
        CanClickWhenEditing = False
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'sequencia'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186
            Width = 35
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Origem'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'TIPO'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -9
            Title.Font.Name = 'Helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 43
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'componente_c'
            Title.Alignment = taCenter
            Title.Caption = 'PROJETO'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'codigovisual'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'PRODUTO'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -9
            Title.Font.Name = 'Helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 130
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -9
            Title.Font.Name = 'Helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 180
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'emestoque'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'EM ESTOQUE'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'quantidade_c'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'REQUISITADA'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -9
            Title.Font.Name = 'Helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 65
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'unidade'
            Title.Alignment = taCenter
            Title.Caption = 'UNIDADE'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'quantidadeliberada'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'LIBERADA'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -9
            Title.Font.Name = 'Helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'quantidadees'
            Title.Alignment = taCenter
            Title.Caption = 'QUANTIDADE'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'saldo'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'SALDO'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -9
            Title.Font.Name = 'Helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 65
            Visible = True
          end>
      end
      object pnlOpcaoes: TPanel
        Left = 910
        Top = 16
        Width = 33
        Height = 299
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object sbnReConferir: TSpeedButton
          Left = 1
          Top = 12
          Width = 29
          Height = 28
          Hint = 
            'Adiciona novos produtos e quantidades presentes em Composi'#231#227'o/Fi' +
            'os/Fitas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C006000001000000010000000000000000000000FFFFFFFEFEFE
            FCFCFCFBFBFBFBFBFAFBFBFAFBFBFAFBFBFAFBFBFAFBFBFAFBFBFAFBFBFAFBFB
            FAFBFBFAFBFBFAFBFBFAFBFBFAFBFBFAFBFBFAFBFBFAFBFBFBFCFCFBFEFEFEFF
            FFFFFAFAF9EBEBEADBDBD8D2D2CFCFCFCCCFCFCCCFCFCCCFCFCCCFCFCCCFCFCC
            CFCFCCCFCFCCD0D0CCD0D0CCD0D0CDD0D0CDD0D0CDD0D0CDD0D0CDD0D0CDD2D2
            CFD8D8D6E7E7E5F7F7F6DCDCDAADADAA95958E8C8C8389898189898089898089
            89808989808989818989818989818A8A818989808A8A818B8B828A8A828A8A82
            8A8A828A8A828D8D8494948DA8A8A2D0D0CD9C9C9675756E7C7C728080758181
            768181758181758181758181758181768181768181767D7D7274746872726678
            786D81817581817681817681817681817680807579796F8D8D8764645B6C6C62
            8F8F8398988B9B9B8E9C9C8F9C9C8F9C9C8F9C9C8F9C9C8F9C9C8F9C9C8F8B8B
            7F6161575050445E5E538383769696889B9B8E9C9C8F99998C94948778786B60
            60574E4E42747468A4A497ADAD9FAEAEA0AFAFA1AFAFA1AFAFA1AFAFA1AFAFA1
            AFAFA1AFAFA19393864E4E4427271E2C2C224E4E437B7B6EA0A092AEAEA0ADAD
            9FA9A99B83837651514648483C7A7A6DB0B0A1B5B5A7B5B5A6B5B5A6B5B5A6B4
            B4A6B5B5A6B5B5A6B5B5A6B5B5A6A5A59779796E54544A34342B2222193E3E35
            77776AA8A89BB5B5A6B3B3A589897D4C4C4048483C7C7C70B6B6A7BABAACBABA
            ABBABAABBBBBACC1C1B3BABAABBABAABBABAABBABAABB6B6A8B0B0A2A7A7999B
            9B8D4A4A4124241C414138838376B2B2A3B9B9AA8C8C7F4B4B3F48483C7E7E71
            B9B9AABEBEAFBDBDAEBEBEB0BFBFB4A8A8A0C1C1B3BEBEAFBDBDAEBDBDAEBDBD
            AEBDBDAEBDBDAEBDBDAEADADA05F5F533333295A5A509E9E90BABAAB8F8F814C
            4C4048483C808072BDBDAEC2C2B3C2C2B3BFBFB288887E48483EAFAFA6C2C2B4
            C1C1B2C1C1B2C1C1B2C1C1B2C1C1B2C1C1B2BDBDAE9797894D4D424A4A3F8E8E
            81BBBBAC9191844D4D4148483C828274C0C0B1C5C5B6C4C4B6A7A79C5E5E5434
            34296C6C63B8B8ADC6C6B7C4C4B5C4C4B5C4C4B5C4C4B5C4C4B5C3C3B4AEAE9F
            68685C46463A818174B8B8A99292854D4D4148483C838376C4C4B5C9C9BAB9B9
            AE7F7F7547473C37372B49493E919186C4C4B7C9C9BAC9C9B9C9C9B9C9C9B9C9
            C9B9C8C8B8B7B7A77676684A4A3E7E7E70B8B8A99494874D4D4148483C858578
            C8C8B9C6C6B99C9C925E5E544141363D3D3241413667675DACACA1CBCBBDCDCD
            BDCDCDBDCDCDBDCDCDBDCCCCBCBABAAA78786A515145878779BEBEAF97978A4E
            4E4249493C87877ACBCBBCBEBEB189897F5F5F554C4C4145453A4A4A3F63635A
            97978DC8C8BCD2D2C3D2D2C2D2D2C2D2D2C2CFCFBFB3B3A46E6E625B5B509898
            8BC8C8B89A9A8C4E4E4249493D8A8A7CCFCFBFC8C8BBB1B1A5A1A1957A7A6F52
            524759594E909084B7B7AACECEC0D5D5C5D5D5C5D5D5C5D5D5C5CBCBBC969688
            5E5E52707064AEAEA0D0D0C09D9D8F4E4E4349493D8C8C7ED4D4C4D8D8C9D4D4
            C5D3D3C4BABAAB69695E58584D858579C1C1B3D6D6C7D9D9C9D9D9C9D9D9C9D9
            D9C9ACAC9F66665B5F5F538F8F82C6C6B7D6D6C79F9F924E4E4249493D8E8E82
            D7D7C9DBDBCDDBDBCCDBDBCCDCDCCEB7B7A866665C5F5F547575699B9B8FB5B5
            A7BCBCACAEAEA28A8A7F5C5C5265655A8F8F83C6C6B7DADACCDADACCA3A3964E
            4E424B4B3F939388DEDED1E0E0D3E0E0D1E0E0D1E0E0D1E0E0D1ACAC9F7F7F74
            6B6B6065655A69695E6B6B6166665B65655A75756A99998CC5C5B9DDDDCFDFDF
            D2E0E0D3A8A89C51514549493D909086E2E2DAE7E7DEE6E6DBE6E6DBE6E6DBE6
            E6DCDFDFD5C6C6BCA8A89E93938A8A8A8288887F8B8B8295958CB8B8AED6D6CC
            E4E4DAE6E6DCE7E7DDE7E7DEA5A59C4E4E4447473B77776DCDCDC8EAEAE6EEEE
            EAEFEFEAEFEFEAEFEFEAEFEFEAEEEEE9E5E5DFD9D9D3D3D3CDD0D0CAD3D3CEDB
            DBD6ECECE7F0F0EBEFEFEAEFEFEAEDEDE8DCDCD78D8D844A4A3F65655C545449
            8D8D85BBBBB6CCCCC7CFCFCBCFCFCBCFCFCBCFCFCBCFCFCBD0D0CBCFCFCACECE
            C9CECEC9CECEC9CFCFCBD0D0CBCFCFCBCFCFCBCECEC9C2C2BC9E9E9661615755
            554AB5B5B069695F5C5C527070677D7D74808077808077808077808077808077
            8080778080778080778080778080778080778080778080778080777E7E767474
            6B60605666665C989891F0F0EFC8C8C5ACACA7ADADA7AFAFABB0B0ABB0B0ABB0
            B0ABB0B0ABB0B0ABB0B0ABB0B0ABB0B0ABB0B0ABB0B0ABB0B0ABB0B0ABB0B0AB
            B0B0ABB0B0ABADADA9ABABA6C4C4BFE6E6E3FEFEFEFAFAFAF6F6F6F6F6F5F6F6
            F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6
            F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F5F6F6F5FAFAFAFEFEFE}
          ParentFont = False
          OnClick = sbnReConferirClick
        end
        object sbnIncluirComponente: TSpeedButton
          Left = 1
          Top = 52
          Width = 29
          Height = 28
          Hint = 'Incluir Componente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDC7F7F7F7F7F7F7F7F7F8080808080807F7F7F7F7F7F7F7F7F7F7F
            7F808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDC0000000000000000000000000000000000000000000000000000000000
            00808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
            007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
            007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
            007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
            007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
            00808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
            00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
            DCDCDCDCDCFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
            00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
            DCDC7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000DCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
            DCDC7F7F7FFFFFFFDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000DCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
            DCDC7F7F7FFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000DCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFFFFFFFFF
            FFFF7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDC000000000000000000000000000000000000DCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
          NumGlyphs = 2
          ParentFont = False
          OnClick = sbnIncluirComponenteClick
        end
      end
      object gbxDadosAdicionais: TGroupBox
        Left = 2
        Top = 315
        Width = 941
        Height = 91
        Align = alBottom
        Caption = 'INFORMA'#199#213'ES ADICIONAIS'
        TabOrder = 2
        object gbxObservacoes: TGroupBox
          Left = 2
          Top = 53
          Width = 937
          Height = 36
          Align = alBottom
          Caption = ' OBSERVA'#199#213'ES'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          object mmoObservacoes: TtecDBMemo
            Left = 2
            Top = 10
            Width = 885
            Height = 20
            DataField = 'observacoes'
            DataSource = dtmRequisicoesOSP.dsrRequisicoesOSP
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
        end
        object gbxOC: TGroupBox
          Left = 21
          Top = 12
          Width = 200
          Height = 36
          Caption = ' ORDEM DE COMPRA '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object edtOC: TDBEditTexto
            Left = 2
            Top = 10
            Width = 195
            Height = 23
            DataField = 'OC'
            DataSource = dtmRequisicoesOSP.dsrRequisicoesOSP
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            TabOrder = 0
            CharCasenoDefault = False
            Alignment = taLeftJustify
          end
        end
        object gbxOS: TGroupBox
          Left = 238
          Top = 12
          Width = 200
          Height = 36
          Caption = ' OS '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object edtOS: TDBEditTexto
            Left = 2
            Top = 10
            Width = 195
            Height = 23
            DataField = 'OS'
            DataSource = dtmRequisicoesOSP.dsrRequisicoesOSP
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            TabOrder = 0
            CharCasenoDefault = False
            Alignment = taLeftJustify
          end
        end
        object gbxNF: TGroupBox
          Left = 451
          Top = 12
          Width = 200
          Height = 36
          Caption = ' N'#186' NF '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object edtNF: TDBEditTexto
            Left = 2
            Top = 10
            Width = 195
            Height = 23
            DataField = 'NF'
            DataSource = dtmRequisicoesOSP.dsrRequisicoesOSP
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            TabOrder = 0
            CharCasenoDefault = False
            Alignment = taLeftJustify
          end
        end
        object gbxChargeCode: TGroupBox
          Left = 667
          Top = 12
          Width = 200
          Height = 36
          Caption = ' CHARGE/CODE '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          object edtChargeCode: TDBEditTexto
            Left = 2
            Top = 10
            Width = 195
            Height = 23
            DataField = 'chargecode'
            DataSource = dtmRequisicoesOSP.dsrRequisicoesOSP
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
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
    object gbxMovimentacao: TGroupBox
      Left = 945
      Top = 0
      Width = 276
      Height = 408
      Align = alClient
      Caption = ' MOVIMENTA'#199#213'ES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object tecDBGrid1: TtecDBGrid
        Left = 2
        Top = 16
        Width = 272
        Height = 390
        Align = alClient
        DataSource = dtmRequisicoesOSP.dsrMovimentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'Arial'
        TitleFont.Pitch = fpVariable
        TitleFont.Style = []
        RowWrap = 60
        Large = False
        DoubleRowColor = True
        TitleMinHeight = 100
        CellHeights = 100
        StrippedColor = 16054260
        CanDelete = False
        CanNotInsertFromGrid = False
        PostOnEnter = False
        PostOnSetUpDown = False
        DenySort = False
        DefaultRowHeight = 19
        ExibirNumerodaLinha = False
        NaoAtribuirDadosaTabelaaoDigitar = False
        ShowWhenFieldInvisible = False
        CanClickWhenEditing = False
        Columns = <
          item
            Expanded = False
            FieldName = 'data'
            Title.Alignment = taCenter
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'hora'
            Title.Alignment = taCenter
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'quantidade_calc'
            Title.Alignment = taCenter
            Title.Caption = 'QUANTIDADE'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'usename'
            Title.Alignment = taCenter
            Title.Caption = 'USU'#193'RIO'
            Width = 80
            Visible = True
          end>
      end
    end
  end
  object actHabilitar: TActionList
    Left = 505
    Top = 8
    object aclHabilitar: TAction
      Caption = 'aclHabilitar'
      OnUpdate = aclHabilitarUpdate
    end
  end
end
