object frmPrincipal: TfrmPrincipal
  Left = 547
  Top = 44
  Width = 791
  Height = 490
  VertScrollBar.Range = 26
  ActiveControl = pgcPrincipal
  AutoScroll = False
  Caption = 'Configurador ECFs'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Helvetica'
  Font.Style = []
  OldCreateOrder = True
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object StatusBar1: TStatusBar
    Left = 0
    Top = 426
    Width = 775
    Height = 26
    BorderWidth = 1
    Panels = <
      item
        Width = 120
      end
      item
        Width = 50
      end>
  end
  object pgcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 775
    Height = 426
    ActivePage = tstParametros
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Helvetica'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object tstParametros: TTabSheet
      Caption = '&Par'#226'metros'
      object btSearchPorts: TSpeedButton
        Left = 290
        Top = 19
        Width = 23
        Height = 22
        Hint = 'Procurar Impressoras USB'
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000064000000640000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000005000000A6000000EF00000031000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000005000000AC000000FF000000FF00000053000000000000
          000000000000000000010000003F0000008E000000B0000000AA0000007B0000
          002100000005000000AC000000FF000000FF0000008C00000001000000000000
          000000000019000000BB000000FF000000FF000000FF000000FF000000FF0000
          00FB000000CF000000FF000000FF0000008C0000000100000000000000000000
          0013000000DB000000FF000000FF000000D20000009C000000A5000000E90000
          00FF000000FF000000FF0000008C000000010000000000000000000000000000
          009F000000FF000000FB0000005E0000000100000000000000000000000A0000
          009D000000FF000000FF00000053000000000000000000000000000000180000
          00FC000000FF0000007100000000000000000000000000000000000000000000
          0002000000C0000000FF000000C8000000000000000000000000000000580000
          00FF000000F70000000900000000000000000000000000000000000000000000
          000000000051000000FF000000FF0000000D00000000000000000000006F0000
          00FF000000DB0000000000000000000000000000000000000000000000000000
          00000000002C000000FF000000FF0000002200000000000000000000005E0000
          00FF000000F20000000400000000000000000000000000000000000000000000
          000000000046000000FF000000FF000000110000000000000000000000220000
          00FF000000FF0000005800000000000000000000000000000000000000000000
          0000000000A8000000FF000000D4000000000000000000000000000000000000
          00B5000000FF000000F000000039000000000000000000000000000000010000
          0075000000FF000000FF00000068000000000000000000000000000000000000
          0022000000EE000000FF000000FC000000AA000000730000007B000000C80000
          00FF000000FF000000BF00000003000000000000000000000000000000000000
          00000000002F000000DC000000FF000000FF000000FF000000FF000000FF0000
          00FF000000B00000000E00000000000000000000000000000000000000000000
          0000000000000000000900000068000000B7000000D9000000D4000000A50000
          0046000000010000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        ParentShowHint = False
        ShowHint = True
        OnClick = btSearchPortsClick
      end
      object btnAtivarDesativar: TButton
        Left = 254
        Top = 268
        Width = 78
        Height = 35
        Caption = 'Ativar'
        TabOrder = 26
        OnClick = btnAtivarDesativarClick
      end
      object gbxModelo: TGroupBox
        Left = 3
        Top = 8
        Width = 142
        Height = 36
        Caption = ' MODELO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object cbxModelo: TComboBox
          Left = 2
          Top = 10
          Width = 138
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          ItemHeight = 15
          ParentFont = False
          TabOrder = 0
          Text = 'Procurar'
          OnChange = cbxModeloChange
          Items.Strings = (
            'Procurar'
            'ecfNaoFiscal'
            'ecfBematech'
            'ecfSweda'
            'ecfDaruma'
            'ecfSchalter'
            'ecfMecaf'
            'ecfYanco'
            'ecfDataRegis'
            'ecfUrano'
            'ecfICash'
            'ecfQuattro'
            'ecfFiscNET'
            'ecfEpson'
            'ecfNCR')
        end
      end
      object gbxDescricaoModelo: TGroupBox
        Left = 3
        Top = 88
        Width = 245
        Height = 36
        Caption = ' DESCRI'#199#195'O DO MODELO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object edtDescricaoModelo: TEdit
          Left = 2
          Top = 10
          Width = 240
          Height = 23
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = edtDescricaoModeloChange
        end
      end
      object gbxNrECF: TGroupBox
        Left = 3
        Top = 239
        Width = 78
        Height = 36
        Caption = ' N'#186' ECF '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 16
        object lblNumeroECF: TLabel
          Left = 2
          Top = 10
          Width = 73
          Height = 23
          Alignment = taRightJustify
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
      end
      object gbxCRO: TGroupBox
        Left = 87
        Top = 239
        Width = 78
        Height = 36
        Caption = ' CRO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 17
        object lblIntervencao: TLabel
          Left = 2
          Top = 10
          Width = 73
          Height = 23
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Interven'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          Visible = False
        end
      end
      object gbxNrSerie: TGroupBox
        Left = 3
        Top = 294
        Width = 246
        Height = 36
        Caption = ' N'#186' DE S'#201'RIE '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 23
        object lblSerie: TLabel
          Left = 2
          Top = 10
          Width = 241
          Height = 23
          Alignment = taRightJustify
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
      end
      object gbxPorta: TGroupBox
        Left = 151
        Top = 8
        Width = 135
        Height = 36
        Caption = ' PORTA '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object cbxPorta: TComboBox
          Left = 2
          Top = 10
          Width = 130
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          ItemHeight = 15
          ParentFont = False
          TabOrder = 0
          Text = 'Procurar'
          OnChange = cbxPortaChange
          Items.Strings = (
            'Procurar'
            'COM1'
            'COM2'
            'COM3'
            'COM4'
            'COM4'
            'COM5'
            'COM6'
            'COM7'
            'COM8'
            'COM9'
            'COM10'
            'USB')
        end
      end
      object btnGravarECF: TButton
        Left = 333
        Top = 268
        Width = 73
        Height = 35
        Caption = 'Gravar ECF'
        Enabled = False
        TabOrder = 27
        OnClick = btnGravarECFClick
      end
      object gbxGrandeTotal: TGroupBox
        Left = 3
        Top = 334
        Width = 134
        Height = 36
        Caption = ' GRANDE TOTAL (GT) '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 24
        object lblGT: TLabel
          Left = 2
          Top = 10
          Width = 129
          Height = 23
          Alignment = taRightJustify
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
      end
      object gbxCRZ: TGroupBox
        Left = 171
        Top = 239
        Width = 78
        Height = 36
        Caption = ' CRZ '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 18
        object lblCRZ: TLabel
          Left = 2
          Top = 10
          Width = 73
          Height = 23
          Alignment = taRightJustify
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
      end
      object gbxVendaBruta: TGroupBox
        Left = 139
        Top = 334
        Width = 110
        Height = 36
        Caption = ' VENDA BRUTA '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 25
        object lblVendaBruta: TLabel
          Left = 2
          Top = 10
          Width = 105
          Height = 23
          Alignment = taRightJustify
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
      end
      object gbxVersaoSB: TGroupBox
        Left = 3
        Top = 201
        Width = 102
        Height = 36
        Caption = ' VERS'#195'O DO SB '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 14
        object lblVersaoSB: TLabel
          Left = 2
          Top = 10
          Width = 97
          Height = 23
          Alignment = taRightJustify
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
      end
      object gbxCNIEE: TGroupBox
        Left = 59
        Top = 161
        Width = 86
        Height = 36
        Caption = ' CNIEE '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        object edtCNIEE: TEdit
          Left = 2
          Top = 10
          Width = 81
          Height = 23
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = edtCNIEEChange
        end
      end
      object btnGerarArquivoECFs: TButton
        Left = 254
        Top = 305
        Width = 152
        Height = 25
        Caption = 'Gerar Arquivo ECFs'
        TabOrder = 28
        OnClick = btnGerarArquivoECFsClick
      end
      object gbxHost: TGroupBox
        Left = 318
        Top = 8
        Width = 120
        Height = 36
        Caption = ' HOST '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        object edtHost: TEdit
          Left = 2
          Top = 10
          Width = 114
          Height = 23
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object gbxBanco: TGroupBox
        Left = 318
        Top = 48
        Width = 120
        Height = 36
        Caption = ' BANCO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        object edtBanco: TEdit
          Left = 2
          Top = 10
          Width = 115
          Height = 23
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object gbxUsuario: TGroupBox
        Left = 318
        Top = 87
        Width = 120
        Height = 36
        Caption = ' USU'#193'RIO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        object edtUsuario: TEdit
          Left = 2
          Top = 10
          Width = 115
          Height = 23
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object gbxSenha: TGroupBox
        Left = 318
        Top = 125
        Width = 120
        Height = 36
        Caption = ' SENHA '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        object edtSenha: TEdit
          Left = 2
          Top = 10
          Width = 115
          Height = 23
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          PasswordChar = '*'
          TabOrder = 0
        end
      end
      object gbxFilial: TGroupBox
        Left = 3
        Top = 161
        Width = 54
        Height = 36
        Caption = ' FILIAL '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        object edtFilial: TEdit
          Left = 2
          Top = 10
          Width = 49
          Height = 23
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = edtFilialChange
        end
      end
      object gbxTipo: TGroupBox
        Left = 3
        Top = 125
        Width = 190
        Height = 36
        Caption = ' TIPO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object cbxTipoECF: TComboBox
          Left = 2
          Top = 10
          Width = 185
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          ItemHeight = 15
          ParentFont = False
          TabOrder = 0
          OnChange = cbxTipoECFChange
          Items.Strings = (
            'ECF-IF'
            'ECF-MR'
            'ECF-PDV')
        end
      end
      object gbxMF: TGroupBox
        Left = 196
        Top = 125
        Width = 53
        Height = 34
        Caption = ' MF '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        object cbxMF: TComboBox
          Left = 2
          Top = 10
          Width = 48
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          ItemHeight = 15
          ParentFont = False
          TabOrder = 0
          OnChange = cbxMFChange
          Items.Strings = (
            'S'
            'N')
        end
      end
      object gbxMarca: TGroupBox
        Left = 3
        Top = 47
        Width = 245
        Height = 36
        Caption = ' MARCA '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object edtMarca: TEdit
          Left = 2
          Top = 10
          Width = 240
          Height = 23
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = edtMarcaChange
        end
      end
      object gbxDataSB: TGroupBox
        Left = 112
        Top = 201
        Width = 80
        Height = 36
        Caption = ' DATA DO SB '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 15
        object lblDataSB: TLabel
          Left = 2
          Top = 10
          Width = 75
          Height = 23
          Alignment = taRightJustify
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
      end
      object gbxCNPJECF: TGroupBox
        Left = 147
        Top = 161
        Width = 142
        Height = 36
        Caption = ' CNPJ '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 12
        object lblCNPJECF: TLabel
          Left = 2
          Top = 10
          Width = 136
          Height = 23
          Alignment = taRightJustify
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
      end
      object gbxIEECF: TGroupBox
        Left = 292
        Top = 161
        Width = 126
        Height = 36
        Caption = ' INSCRI'#199#195'O ESTADUAL '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 13
        object lblIEECF: TLabel
          Left = 2
          Top = 10
          Width = 119
          Height = 23
          Alignment = taRightJustify
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
      end
      object gbxGTCripto: TGroupBox
        Left = 251
        Top = 334
        Width = 174
        Height = 36
        Caption = ' GT CRIPTO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 29
        object lblGTCripto: TEdit
          Left = 2
          Top = 10
          Width = 169
          Height = 23
          AutoSize = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object ckbMinasLegal: TCheckBox
        Left = 256
        Top = 200
        Width = 110
        Height = 17
        Caption = 'Minas Legal'
        Enabled = False
        TabOrder = 19
        Visible = False
      end
      object ckbCupomMania: TCheckBox
        Left = 256
        Top = 217
        Width = 110
        Height = 17
        Caption = 'Cupom Mania'
        Enabled = False
        TabOrder = 20
        Visible = False
      end
      object ckbParaibaLegal: TCheckBox
        Left = 256
        Top = 233
        Width = 110
        Height = 17
        Caption = 'Para'#237'ba Legal'
        TabOrder = 21
      end
      object ckbNotaLegalDF: TCheckBox
        Left = 256
        Top = 249
        Width = 110
        Height = 17
        Caption = 'Nota Legal - DF'
        Enabled = False
        TabOrder = 22
        Visible = False
      end
      object edtGTCripto: TEdit
        Left = 252
        Top = 370
        Width = 172
        Height = 23
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 30
      end
    end
    object tstEmpresaDesenvolvedora: TTabSheet
      Caption = '&Empresa Desenvolvedora'
      ImageIndex = 1
      object gbxCNPJ: TGroupBox
        Left = 1
        Top = 48
        Width = 155
        Height = 36
        Caption = ' CNPJ '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object edtCNPJ: TMaskEdit
          Left = 2
          Top = 10
          Width = 150
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object gbxIE: TGroupBox
        Left = 160
        Top = 48
        Width = 130
        Height = 36
        Caption = ' INSCRI'#199#195'O ESTADUAL '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object edtIE: TMaskEdit
          Left = 2
          Top = 10
          Width = 125
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object gbxIM: TGroupBox
        Left = 296
        Top = 48
        Width = 130
        Height = 36
        Caption = 'INSCRI'#199#195'O MUNICIPAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object edtIM: TMaskEdit
          Left = 2
          Top = 10
          Width = 124
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object gbxNomedaEmpresa: TGroupBox
        Left = 1
        Top = 8
        Width = 425
        Height = 36
        Caption = ' NOME DA EMPRESA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object edtNomeEmpresa: TMaskEdit
          Left = 2
          Top = 10
          Width = 420
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object gbxNomeComercial: TGroupBox
        Left = 1
        Top = 165
        Width = 425
        Height = 36
        Caption = ' NOME COMERCIAL DO PAF-ECF '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        object edtNomeComercialPAFECF: TMaskEdit
          Left = 2
          Top = 10
          Width = 419
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object gbxVersaoPAFECF: TGroupBox
        Left = 1
        Top = 205
        Width = 115
        Height = 36
        Caption = ' VERS'#195'O DO PAF-ECF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        object edtVersaoPAFECF: TMaskEdit
          Left = 2
          Top = 10
          Width = 109
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object gbxCodigoMD5: TGroupBox
        Left = 118
        Top = 205
        Width = 308
        Height = 36
        Caption = ' C'#211'DIGO MD5 '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        object edtCodigoMD5: TMaskEdit
          Left = 2
          Top = 10
          Width = 303
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 32
          ParentFont = False
          TabOrder = 0
        end
      end
      object gbxCaminhoArquivo: TGroupBox
        Left = 2
        Top = 324
        Width = 424
        Height = 36
        Caption = ' ARQUIVO DE CONFIGURA'#199#195'O '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 13
        object sbnTEFResp: TSpeedButton
          Left = 397
          Top = 10
          Width = 23
          Height = 22
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00303333333333
            333337F3333333333333303333333333333337F33FFFFF3FF3FF303300000300
            300337FF77777F77377330000BBB0333333337777F337F33333330330BB00333
            333337F373F773333333303330033333333337F3377333333333303333333333
            333337F33FFFFF3FF3FF303300000300300337FF77777F77377330000BBB0333
            333337777F337F33333330330BB00333333337F373F773333333303330033333
            333337F3377333333333303333333333333337FFFF3FF3FFF333000003003000
            333377777F77377733330BBB0333333333337F337F33333333330BB003333333
            333373F773333333333330033333333333333773333333333333}
          NumGlyphs = 2
          OnClick = sbnTEFRespClick
        end
        object edtCaminhoArquivo: TMaskEdit
          Left = 2
          Top = 10
          Width = 391
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object btnSalvarEmpresaDesenvolvedora: TButton
        Left = 277
        Top = 371
        Width = 152
        Height = 25
        Caption = 'Salvar dados da empresa'
        TabOrder = 14
        OnClick = btnSalvarEmpresaDesenvolvedoraClick
      end
      object gbxEndereco1: TGroupBox
        Left = 1
        Top = 86
        Width = 238
        Height = 75
        Caption = ' ENDERE'#199'O '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object edtEndereco1: TMaskEdit
          Left = 2
          Top = 10
          Width = 233
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 31
          ParentFont = False
          TabOrder = 0
        end
        object edtEndereco2: TMaskEdit
          Left = 2
          Top = 48
          Width = 233
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 31
          ParentFont = False
          TabOrder = 1
        end
      end
      object gbxTelefone: TGroupBox
        Left = 248
        Top = 86
        Width = 178
        Height = 36
        Caption = ' TELEFONE '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        object edtTelefone: TMaskEdit
          Left = 2
          Top = 10
          Width = 172
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 32
          ParentFont = False
          TabOrder = 0
        end
      end
      object gbxContato: TGroupBox
        Left = 248
        Top = 125
        Width = 178
        Height = 36
        Caption = ' CONTATO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        object edtContato: TMaskEdit
          Left = 2
          Top = 10
          Width = 172
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 32
          ParentFont = False
          TabOrder = 0
        end
      end
      object gbxLaudoPAF: TGroupBox
        Left = 1
        Top = 243
        Width = 340
        Height = 36
        Caption = ' LAUDO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        object edtLaudoPAF: TMaskEdit
          Left = 2
          Top = 10
          Width = 335
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 32
          ParentFont = False
          TabOrder = 0
        end
      end
      object gbxNrCredenciamento: TGroupBox
        Left = 1
        Top = 283
        Width = 340
        Height = 36
        Caption = ' N'#186' DO CREDENCIAMENTO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 12
        object edtNumeroCredenciadora: TMaskEdit
          Left = 2
          Top = 10
          Width = 335
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 32
          ParentFont = False
          TabOrder = 0
        end
      end
      object gbxDataLaudoPAF: TGroupBox
        Left = 346
        Top = 243
        Width = 80
        Height = 36
        Caption = ' DATA LAUDO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        object edtDataLaudoPAF: TEditData
          Left = 2
          Top = 10
          Width = 75
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Minimo = 37353
          Maximo = 0
        end
      end
    end
  end
  object ZPgSqlDatabase1: TZPgSqlDatabase
    Host = 'localhost'
    Port = '5432'
    Database = 'avisa'
    Encoding = etNone
    Login = 'tecsoft'
    Password = 'senha'
    LoginPrompt = False
    Connected = False
    Left = 256
    Top = 8
  end
  object qryECFs: TZPgSqlQuery
    Database = ZPgSqlDatabase1
    Transaction = ZPgSqlTransact1
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'WHERE'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'SELECT codigo,'
      '       filial,'
      '       maquina,'
      '       intervencao,'
      '       serie,'
      '       cniee,'
      '       modelo,'
      '       modelodescricao,'
      '       grandetotal,'
      '       vendabruta,'
      '       MFadicional,'
      '       Tipo,'
      '       Marca,'
      '       Data_SB,'
      '       versao_sb,'
      '       CNPJ,'
      '       IE,'
      '       minas_legal,'
      '       cupom_mania,'
      '       paraiba_legal,'
      '       nota_legal_df'
      'FROM ecfs'
      '%WHERE')
    RequestLive = True
    Left = 320
    Top = 8
    object qryECFscodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryECFsfilial: TIntegerField
      FieldName = 'filial'
    end
    object qryECFsmaquina: TStringField
      FieldName = 'maquina'
      Size = 4
    end
    object qryECFsintervencao: TStringField
      DisplayWidth = 5
      FieldName = 'intervencao'
      Size = 5
    end
    object qryECFsserie: TStringField
      FieldName = 'serie'
    end
    object qryECFscniee: TStringField
      FieldName = 'cniee'
      Size = 6
    end
    object qryECFsmodelo: TIntegerField
      FieldName = 'modelo'
    end
    object qryECFsmodelodescricao: TStringField
      FieldName = 'modelodescricao'
    end
    object qryECFsgrandetotal: TFloatField
      FieldName = 'grandetotal'
    end
    object qryECFsvendabruta: TFloatField
      FieldName = 'vendabruta'
    end
    object qryECFsmfadicional: TStringField
      FieldName = 'mfadicional'
      Size = 1
    end
    object qryECFstipo: TStringField
      FieldName = 'tipo'
      Size = 7
    end
    object qryECFsmarca: TStringField
      FieldName = 'marca'
    end
    object qryECFsdata_sb: TDateTimeField
      FieldName = 'data_sb'
    end
    object qryECFscnpj: TStringField
      FieldName = 'cnpj'
    end
    object qryECFsie: TStringField
      FieldName = 'ie'
    end
    object qryECFsversao_sb: TStringField
      FieldName = 'versao_sb'
      Size = 15
    end
    object qryECFsminas_legal: TBooleanField
      FieldName = 'minas_legal'
    end
    object qryECFscupom_mania: TBooleanField
      FieldName = 'cupom_mania'
    end
    object qryECFsparaiba_legal: TBooleanField
      FieldName = 'paraiba_legal'
    end
    object qryECFsnota_legal_df: TBooleanField
      FieldName = 'nota_legal_df'
    end
  end
  object qryECFsProximo: TZPgSqlQuery
    Database = ZPgSqlDatabase1
    Transaction = ZPgSqlTransact1
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select ecfs_proximocodigo() as codigo')
    RequestLive = False
    Left = 352
    Top = 8
    object qryECFsProximocodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object ZPgSqlTransact1: TZPgSqlTransact
    Options = [toHourGlass]
    AutoCommit = True
    Database = ZPgSqlDatabase1
    AutoRecovery = True
    TransactSafe = True
    TransIsolation = ptDefault
    Left = 288
    Top = 8
  end
  object dlgArquivoaExportar: TSaveDialog
    Filter = '*.ini'
    FilterIndex = 0
    Title = 'Save As'
    Left = 432
    Top = 29
  end
  object ACBrECF1: TACBrECF
    QuebraLinhaRodape = False
    Porta = 'COM2'
    MsgAguarde = 'Aguardando a resposta da Impressora: %d segundos'
    MsgTrabalhando = 'Impressora est'#225' trabalhando'
    MsgRelatorio = 'Imprimindo %s  %d'#170' Via '
    MsgPausaRelatorio = 'Destaque a %d'#170' via, <ENTER> proxima, %d seg.'
    PaginaDeCodigo = 0
    MemoParams.Strings = (
      '[Cabecalho]'
      'LIN000=<center><b>Nome da Empresa</b></center>'
      'LIN001=<center>Nome da Rua , 1234  -  Bairro</center>'
      'LIN002=<center>Cidade  -  UF  -  99999-999</center>'
      
        'LIN003=<center>CNPJ: 01.234.567/0001-22    IE: 012.345.678.90</c' +
        'enter>'
      
        'LIN004=<table width=100%><tr><td align=left><code>Data</code> <c' +
        'ode>Hora</code></td><td align=right>COO: <b><code>NumCupom</code' +
        '></b></td></tr></table>'
      'LIN005=<hr>'
      ' '
      '[Cabecalho_Item]'
      'LIN000=ITEM   CODIGO      DESCRICAO'
      'LIN001=QTD         x UNITARIO       Aliq     VALOR (R$)'
      'LIN002=<hr>'
      
        'MascaraItem=III CCCCCCCCCCCCCC DDDDDDDDDDDDDDDDDDDDDDDDDDDDDQQQQ' +
        'QQQQ UU x VVVVVVVVVVVVV AAAAAA TTTTTTTTTTTTT'
      ' '
      '[Rodape]'
      'LIN000=<hr>'
      
        'LIN001=<table width=100%><tr><td align=left><code>Data</code> <c' +
        'ode>Hora</code></td><td align=right>Projeto ACBr: <b><code>ACBR<' +
        '/code></b></td></tr></table>'
      'LIN002=<center>Obrigado Volte Sempre</center>'
      'LIN003=<hr>'
      ' '
      '[Formato]'
      'Colunas=48'
      'HTML=1'
      'HTML_Title_Size=2'
      'HTML_Font=<font size="2" face="Lucida Console">')
    ConfigBarras.MostrarCodigo = True
    ConfigBarras.LarguraLinha = 0
    ConfigBarras.Altura = 0
    ConfigBarras.Margem = 0
    InfoRodapeCupom.Imposto.ModoCompacto = False
    Left = 436
    Top = 74
  end
  object ACBrPosPrinter1: TACBrPosPrinter
    ConfigBarras.MostrarCodigo = False
    ConfigBarras.LarguraLinha = 0
    ConfigBarras.Altura = 0
    ConfigBarras.Margem = 0
    ConfigQRCode.Tipo = 2
    ConfigQRCode.LarguraModulo = 4
    ConfigQRCode.ErrorLevel = 0
    LinhasEntreCupons = 0
    Left = 496
    Top = 40
  end
end
