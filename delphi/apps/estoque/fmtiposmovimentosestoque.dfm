inherited frmTiposMovimentosDoEstoque: TfrmTiposMovimentosDoEstoque
  Left = 506
  Top = 200
  Caption = 'Tipos de Movimentos do Estoque'
  ClientHeight = 406
  ClientWidth = 568
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Width = 488
  end
  inherited pnlTopMenu: TPanel
    Width = 568
    TabOrder = 2
    inherited tblBarra: TToolBar
      Width = 343
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 40
    Width = 568
    Height = 366
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 1
    object gbxCodigo: TGroupBox
      Left = 10
      Top = 10
      Width = 66
      Height = 37
      Caption = 'C'#211'DIGO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object edfMovimento: TtecDbEditFind
        Left = 2
        Top = 10
        Width = 60
        Height = 23
        Alignment = taLeftJustify
        CharCase = ecUpperCase
        DataField = 'codigo'
        DataSource = dtmTiposMovimentosDoEstoque.dsrMovimentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Group = 'Movimento'
        MaxLength = 3
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        Opcional = True
        OnFound = edfProcuraMovimentoFound
        ParentFont = False
        TabOrder = 0
        PermitirZero = False
        PermitirNulo = False
        Operacao = opATRIBUICAO
        Parameter = 'codigo'
        ActiveSetControls = True
        DenyInsert = False
        NoSetControls = <>
        SetControls = <>
      end
    end
    object gbxTransferencia: TGroupBox
      Left = 10
      Top = 54
      Width = 462
      Height = 38
      Caption = 'TRANSFER'#202'NCIA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object sbnTransferencia: TSpeedButton
        Left = 62
        Top = 11
        Width = 23
        Height = 21
        Hint = 'Procurar Transfer'#234'ncia'
        Flat = True
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
          DCDCDCDC800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7FFFFFFFDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DC800000800000800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000
          00800000800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000008000
          00800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000008000008000
          00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFF
          FFFFDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCFFA858800000800000800000FFA858DCDCDC0000FF800000800000DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDC
          DCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFDCDCDCDCDCDC7F
          7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
          FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
          FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDC7F7F7FDCDCDCFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
          FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000DCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
          FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
          FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000DCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
          FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
          FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFFFFFFFDCDCDCDCDCDCDC
          DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
          7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
        NumGlyphs = 2
        ParentFont = False
        OnClick = sbnTransferenciaClick
      end
      object flkTransferencia: TtecDBFindLookup
        Left = 2
        Top = 10
        Width = 60
        Height = 23
        Alignment = taLeftJustify
        CharCase = ecUpperCase
        DataField = 'transferencia'
        DataSource = dtmTiposMovimentosDoEstoque.dsrMovimentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 5
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        Opcional = True
        ParentFont = False
        TabOrder = 0
        PermitirZero = False
        PermitirNulo = False
        Operacao = opATRIBUICAO
        LookupField = 'codigo'
        LookupSource = dtmTiposMovimentosDoEstoque.dsrProcuraTransferencias
        LookupQueryParameter = 'codigo'
        Parameter = ' '
        ActiveSetControls = False
        DenyInsert = True
        NoSetControls = <>
        SetControls = <>
        LookupParameter = 'codigo'
      end
      object dtxTransferencia: TtecDBText
        Left = 85
        Top = 10
        Width = 373
        Height = 23
        TabStop = False
        Color = clBtnFace
        DataField = 'descricao'
        DataSource = dtmTiposMovimentosDoEstoque.dsrProcuraTransferencias
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
    object gbxOperacao: TGroupBox
      Left = 90
      Top = 104
      Width = 383
      Height = 251
      Caption = 'OPERA'#199#213'ES DO MOVIMENTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      object bvlDivisor: TBevel
        Left = 189
        Top = 5
        Width = 3
        Height = 244
        Shape = bsLeftLine
      end
      object lblEmEstoque: TLabel
        Left = 4
        Top = 15
        Width = 160
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Em estoque '
        Color = 10132122
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object lblReservado: TLabel
        Left = 4
        Top = 38
        Width = 160
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Reservado '
        Color = 10132122
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object lblTransito: TLabel
        Left = 4
        Top = 61
        Width = 160
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Tr'#226'nsito '
        Color = 10132122
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object lblDemonstracao: TLabel
        Left = 4
        Top = 84
        Width = 160
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Demonstra'#231#227'o '
        Color = 10132122
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object lblConserto: TLabel
        Left = 4
        Top = 107
        Width = 160
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Conserto '
        Color = 10132122
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object lblFuturo: TLabel
        Left = 4
        Top = 130
        Width = 160
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Futuro '
        Color = 10132122
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object lblDanificado: TLabel
        Left = 4
        Top = 153
        Width = 160
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Danificado '
        Color = 10132122
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object lblUltimaEntrada: TLabel
        Left = 4
        Top = 223
        Width = 160
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Ultima entrada '
        Color = 10132122
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object lblUltimaCompra: TLabel
        Left = 216
        Top = 15
        Width = 160
        Height = 20
        AutoSize = False
        Caption = ' '#218'ltima compra'
        Color = 10132122
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object lblFinanceiro: TLabel
        Left = 216
        Top = 38
        Width = 160
        Height = 20
        AutoSize = False
        Caption = ' Financeiro'
        Color = 10132122
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object lblTotalizaVenda: TLabel
        Left = 216
        Top = 61
        Width = 160
        Height = 20
        AutoSize = False
        Caption = ' Totalizar venda'
        Color = 10132122
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object lblTotalizaCompra: TLabel
        Left = 216
        Top = 84
        Width = 160
        Height = 20
        AutoSize = False
        Caption = ' Totalizar compra'
        Color = 10132122
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object lblEstoqueFisico: TLabel
        Left = 4
        Top = 176
        Width = 160
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Estoque f'#237'sico'
        Color = 10132122
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object lblReservaPrevia: TLabel
        Left = 4
        Top = 199
        Width = 160
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Reserva pr'#233'via'
        Color = 10132122
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object lblValorMoeda: TLabel
        Left = 216
        Top = 107
        Width = 160
        Height = 20
        AutoSize = False
        Caption = ' Valor moeda'
        Color = 10132122
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object lblAcabados: TLabel
        Left = 216
        Top = 130
        Width = 160
        Height = 20
        AutoSize = False
        Caption = 'Acabados'
        Color = 10132122
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object lblSemiAcabados: TLabel
        Left = 216
        Top = 153
        Width = 160
        Height = 20
        AutoSize = False
        Caption = 'Semi-acabados'
        Color = 10132122
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object lblSemFuncao18: TLabel
        Left = 216
        Top = 176
        Width = 160
        Height = 20
        AutoSize = False
        Caption = ' Uso Futuro'
        Color = 10132122
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object lblSemFuncao19: TLabel
        Left = 216
        Top = 199
        Width = 160
        Height = 20
        AutoSize = False
        Caption = ' Uso Futuro'
        Color = 10132122
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object lblSemFuncao20: TLabel
        Left = 216
        Top = 223
        Width = 160
        Height = 20
        AutoSize = False
        Caption = ' Uso Futuro'
        Color = 10132122
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object edtEmEstoque: TEdit
        Left = 166
        Top = 15
        Width = 20
        Height = 20
        Hint = '[ + ] adciona, [ - ] substrai, [ = ] iguala e [ * ] n'#227'o altera'
        AutoSize = False
        CharCase = ecUpperCase
        Constraints.MaxHeight = 20
        Constraints.MinHeight = 20
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 1
        ParentFont = False
        TabOrder = 0
        Text = '*'
        OnChange = edtOperacoesChange
      end
      object edtReservado: TEdit
        Left = 166
        Top = 38
        Width = 20
        Height = 20
        Hint = '[ + ] adciona, [ - ] substrai, [ = ] iguala e [ * ] n'#227'o altera'
        AutoSize = False
        CharCase = ecUpperCase
        Constraints.MaxHeight = 20
        Constraints.MinHeight = 20
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 1
        ParentFont = False
        TabOrder = 1
        Text = '*'
        OnChange = edtOperacoesChange
      end
      object edtTransito: TEdit
        Left = 166
        Top = 61
        Width = 20
        Height = 20
        Hint = '[ + ] adciona, [ - ] substrai, [ = ] iguala e [ * ] n'#227'o altera'
        AutoSize = False
        CharCase = ecUpperCase
        Constraints.MaxHeight = 20
        Constraints.MinHeight = 20
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 1
        ParentFont = False
        TabOrder = 2
        Text = '*'
        OnChange = edtOperacoesChange
      end
      object edtDemonstracao: TEdit
        Left = 166
        Top = 84
        Width = 20
        Height = 20
        Hint = '[ + ] adciona, [ - ] substrai, [ = ] iguala e [ * ] n'#227'o altera'
        AutoSize = False
        CharCase = ecUpperCase
        Constraints.MaxHeight = 20
        Constraints.MinHeight = 20
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 1
        ParentFont = False
        TabOrder = 3
        Text = '*'
        OnChange = edtOperacoesChange
      end
      object edtConserto: TEdit
        Left = 166
        Top = 107
        Width = 20
        Height = 20
        Hint = '[ + ] adciona, [ - ] substrai, [ = ] iguala e [ * ] n'#227'o altera'
        AutoSize = False
        CharCase = ecUpperCase
        Constraints.MaxHeight = 20
        Constraints.MinHeight = 20
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 1
        ParentFont = False
        TabOrder = 4
        Text = '*'
        OnChange = edtOperacoesChange
      end
      object edtFuturo: TEdit
        Left = 166
        Top = 130
        Width = 20
        Height = 20
        Hint = '[ + ] adciona, [ - ] substrai, [ = ] iguala e [ * ] n'#227'o altera'
        AutoSize = False
        CharCase = ecUpperCase
        Constraints.MaxHeight = 20
        Constraints.MinHeight = 20
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 1
        ParentFont = False
        TabOrder = 5
        Text = '*'
        OnChange = edtOperacoesChange
      end
      object edtDanificado: TEdit
        Left = 166
        Top = 153
        Width = 20
        Height = 20
        Hint = '[ + ] adciona, [ - ] substrai, [ = ] iguala e [ * ] n'#227'o altera'
        AutoSize = False
        CharCase = ecUpperCase
        Constraints.MaxHeight = 20
        Constraints.MinHeight = 20
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 1
        ParentFont = False
        TabOrder = 6
        Text = '*'
        OnChange = edtOperacoesChange
      end
      object edtEstoqueFisico_8: TEdit
        Left = 166
        Top = 176
        Width = 20
        Height = 20
        Hint = '[ + ] adciona, [ - ] substrai, [ = ] iguala e [ * ] n'#227'o altera'
        AutoSize = False
        CharCase = ecUpperCase
        Constraints.MaxHeight = 20
        Constraints.MinHeight = 20
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 1
        ParentFont = False
        TabOrder = 7
        Text = '*'
        OnChange = edtOperacoesChange
      end
      object edtReservaPrevia: TEdit
        Left = 166
        Top = 199
        Width = 20
        Height = 20
        Hint = '[ + ] adciona, [ - ] substrai, [ = ] iguala e [ * ] n'#227'o altera'
        AutoSize = False
        CharCase = ecUpperCase
        Constraints.MaxHeight = 20
        Constraints.MinHeight = 20
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 1
        ParentFont = False
        TabOrder = 8
        Text = '*'
        OnChange = edtOperacoesChange
      end
      object edtUltimaEntrada: TEdit
        Left = 166
        Top = 223
        Width = 20
        Height = 20
        Hint = '[ + ] adciona, [ - ] substrai, [ = ] iguala e [ * ] n'#227'o altera'
        AutoSize = False
        CharCase = ecUpperCase
        Constraints.MaxHeight = 20
        Constraints.MinHeight = 20
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 1
        ParentFont = False
        TabOrder = 9
        Text = '*'
        OnChange = edtOperacoesChange
      end
      object edtUltimaCompra: TEdit
        Left = 194
        Top = 15
        Width = 20
        Height = 20
        Hint = '[ + ] adciona, [ - ] substrai, [ = ] iguala e [ * ] n'#227'o altera'
        AutoSize = False
        CharCase = ecUpperCase
        Constraints.MaxHeight = 20
        Constraints.MinHeight = 20
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 1
        ParentFont = False
        TabOrder = 10
        Text = '*'
        OnChange = edtOperacoesChange
      end
      object edtFinanceiro: TEdit
        Left = 194
        Top = 38
        Width = 20
        Height = 20
        Hint = 
          '[ + ] adciona, [ - ] substrai, [ = ] iguala, [ C ] custo m'#233'dio  ' +
          'e [ * ] n'#227'o altera'
        AutoSize = False
        CharCase = ecUpperCase
        Constraints.MaxHeight = 20
        Constraints.MinHeight = 20
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 1
        ParentFont = False
        TabOrder = 11
        Text = '*'
        OnChange = edtOperacoesChange
      end
      object edtTotalizaVenda: TEdit
        Left = 194
        Top = 61
        Width = 20
        Height = 20
        Hint = '[ + ] adciona, [ - ] substrai, [ = ] iguala e [ * ] n'#227'o altera'
        AutoSize = False
        CharCase = ecUpperCase
        Constraints.MaxHeight = 20
        Constraints.MinHeight = 20
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 1
        ParentFont = False
        TabOrder = 12
        Text = '*'
        OnChange = edtOperacoesChange
      end
      object edtTotalizaCompra: TEdit
        Left = 194
        Top = 84
        Width = 20
        Height = 20
        Hint = '[ + ] adciona, [ - ] substrai, [ = ] iguala e [ * ] n'#227'o altera'
        AutoSize = False
        CharCase = ecUpperCase
        Constraints.MaxHeight = 20
        Constraints.MinHeight = 20
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 1
        ParentFont = False
        TabOrder = 13
        Text = '*'
        OnChange = edtOperacoesChange
      end
      object edtValorMoeda: TEdit
        Left = 194
        Top = 107
        Width = 20
        Height = 20
        Hint = '[ + ] adciona, [ - ] substrai, [ = ] iguala e [ * ] n'#227'o altera'
        AutoSize = False
        CharCase = ecUpperCase
        Constraints.MaxHeight = 20
        Constraints.MinHeight = 20
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 1
        ParentFont = False
        TabOrder = 14
        Text = '*'
        OnChange = edtOperacoesChange
      end
      object edtAcabados_16: TEdit
        Left = 194
        Top = 130
        Width = 20
        Height = 20
        Hint = '[ + ] adciona, [ - ] substrai, [ = ] iguala e [ * ] n'#227'o altera'
        AutoSize = False
        CharCase = ecUpperCase
        Constraints.MaxHeight = 20
        Constraints.MinHeight = 20
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 1
        ParentFont = False
        TabOrder = 15
        Text = '*'
        OnChange = edtOperacoesChange
      end
      object edtSemiAcabados_17: TEdit
        Left = 194
        Top = 153
        Width = 20
        Height = 20
        Hint = '[ + ] adciona, [ - ] substrai, [ = ] iguala e [ * ] n'#227'o altera'
        AutoSize = False
        CharCase = ecUpperCase
        Constraints.MaxHeight = 20
        Constraints.MinHeight = 20
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 1
        ParentFont = False
        TabOrder = 16
        Text = '*'
        OnChange = edtOperacoesChange
      end
      object edtSemFuncao18: TEdit
        Left = 194
        Top = 176
        Width = 20
        Height = 20
        Hint = '[ + ] adciona, [ - ] substrai, [ = ] iguala e [ * ] n'#227'o altera'
        TabStop = False
        AutoSize = False
        CharCase = ecUpperCase
        Constraints.MaxHeight = 20
        Constraints.MinHeight = 20
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 1
        ParentFont = False
        ReadOnly = True
        TabOrder = 17
        Text = '*'
        OnChange = edtOperacoesChange
      end
      object edtSemFuncao19: TEdit
        Left = 194
        Top = 199
        Width = 20
        Height = 20
        Hint = '[ + ] adciona, [ - ] substrai, [ = ] iguala e [ * ] n'#227'o altera'
        TabStop = False
        AutoSize = False
        CharCase = ecUpperCase
        Constraints.MaxHeight = 20
        Constraints.MinHeight = 20
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 1
        ParentFont = False
        ReadOnly = True
        TabOrder = 18
        Text = '*'
        OnChange = edtOperacoesChange
      end
      object edtSemFuncao20: TEdit
        Left = 194
        Top = 223
        Width = 20
        Height = 20
        Hint = '[ + ] adciona, [ - ] substrai, [ = ] iguala e [ * ] n'#227'o altera'
        TabStop = False
        AutoSize = False
        CharCase = ecUpperCase
        Constraints.MaxHeight = 20
        Constraints.MinHeight = 20
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 1
        ParentFont = False
        ReadOnly = True
        TabOrder = 19
        Text = '*'
        OnChange = edtOperacoesChange
      end
    end
    object gbxInativo: TGroupBox
      Left = 482
      Top = 10
      Width = 76
      Height = 37
      Caption = 'INATIVO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object edtInativoMovimentos: TDBEditData
        Left = 2
        Top = 10
        Width = 70
        Height = 23
        Alignment = taLeftJustify
        DataField = 'inativo'
        DataSource = dtmTiposMovimentosDoEstoque.dsrMovimentos
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
    object gbxDescricao: TGroupBox
      Left = 86
      Top = 10
      Width = 387
      Height = 38
      Caption = 'DESCRI'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object edtDescricaoMovimentos: TDBEditTexto
        Left = 2
        Top = 10
        Width = 380
        Height = 23
        DataField = 'descricao'
        DataSource = dtmTiposMovimentosDoEstoque.dsrMovimentos
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
