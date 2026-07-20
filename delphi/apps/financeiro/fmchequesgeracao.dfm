inherited frmChequesGeracao: TfrmChequesGeracao
  Left = 345
  Top = 241
  ActiveControl = edtRemessaData
  Caption = 'Gera'#231#227'o do arquivo magn'#233'tico de cheque'
  ClientHeight = 144
  ClientWidth = 514
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  object pnlFundoJanela: TPanel [0]
    Left = 0
    Top = 40
    Width = 514
    Height = 104
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 2
    object gbxPeriodoVencimento: TGroupBox
      Left = 157
      Top = 5
      Width = 137
      Height = 90
      Caption = 'Per'#237'odo Vencimento'
      TabOrder = 1
      object lblVencimentoTermio: TLabel
        Left = 16
        Top = 52
        Width = 28
        Height = 16
        Alignment = taRightJustify
        Caption = 'Final'
      end
      object lblVencimentoInicio: TLabel
        Left = 11
        Top = 26
        Width = 33
        Height = 16
        Alignment = taRightJustify
        Caption = 'Inicial'
      end
      object edttermioPeriodo: TEditData
        Left = 48
        Top = 50
        Width = 75
        Height = 24
        MaxLength = 10
        TabOrder = 1
        OnEnter = edttermioPeriodoEnter
        Minimo = 37353
        Maximo = 0
      end
      object edtInicioPeriodo: TEditData
        Left = 48
        Top = 22
        Width = 75
        Height = 24
        MaxLength = 10
        TabOrder = 0
        Minimo = 37353
        Maximo = 0
      end
    end
    object gbxRemessa: TGroupBox
      Left = 4
      Top = 5
      Width = 145
      Height = 90
      Caption = 'Remessa'
      TabOrder = 0
      object lblRemessaData: TLabel
        Left = 27
        Top = 26
        Width = 27
        Height = 16
        Alignment = taRightJustify
        Caption = 'Data'
      end
      object lblRemessaNumero: TLabel
        Left = 10
        Top = 51
        Width = 45
        Height = 16
        Alignment = taRightJustify
        Caption = 'N'#250'mero'
      end
      object edtRemessaData: TEditData
        Left = 58
        Top = 22
        Width = 75
        Height = 24
        MaxLength = 10
        TabOrder = 0
        Minimo = 37353
        Maximo = 0
      end
      object edNumeroRemessa: TEditNumero
        Left = 58
        Top = 50
        Width = 75
        Height = 24
        MaxLength = -1
        TabOrder = 1
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = False
        Negativo = False
        Tamanho = 6
      end
    end
    object rgpTipoCheque: TtecDBRadioGroup
      Left = 305
      Top = 5
      Width = 115
      Height = 90
      Caption = 'Tipo de Cheque'
      TabOrder = 2
      TabStop = False
      object rbnTodos: TRadioButton
        Left = 17
        Top = 22
        Width = 84
        Height = 17
        Caption = 'Todos'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object rbnVista: TRadioButton
        Left = 17
        Top = 42
        Width = 84
        Height = 17
        Caption = 'Vista'
        TabOrder = 1
      end
      object rbnPrazo: TRadioButton
        Left = 17
        Top = 62
        Width = 84
        Height = 17
        Caption = 'Prazo'
        TabOrder = 2
      end
    end
  end
  inherited pnlBarra: TPanel
    Left = 429
    Top = 48
    Width = 85
    inherited bvlBotoesEd: TBevel
      Left = 68
      Top = 4
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 514
    inherited tblBarra: TToolBar
      Width = 513
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
      object sbnGerarArquivo: TSpeedButton
        Left = 158
        Top = 2
        Width = 75
        Height = 35
        Hint = 'Criar o arquivo magn'#233'tico com os cheque consultados'
        Caption = 'Gerar F6'
        Flat = True
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDC808080000000808080DCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A058
          5858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC80808000000080808000000000FFFF000000808080000000808080DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858A0A0A0585858FF
          FFFF585858A0A0A0585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC00000000FFFF80808000000000FFFF00000080808000FFFF000000DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCA0A0A0585858DC
          DCDC585858A0A0A0DCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC80808080808000FFFF00FFFF00FFFF00FFFF00FFFF808080808080DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0A0A0A0DCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCA0A0A0A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          80808000000000000000FFFF80808000000080808000FFFF0000000000008080
          80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858585858DCDCDCA0A0A058
          5858A0A0A0DCDCDC585858585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
          00000000FFFF00FFFF00FFFF000000DCDCDC00000000FFFF00FFFF00FFFF0000
          00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCDCDCDCDCDCDC585858DC
          DCDC585858FFFFFFDCDCDCDCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
          80808000000000000000FFFF80808000000080808000FFFF0000000000008080
          80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858585858DCDCDCA0A0A058
          5858A0A0A0DCDCDC585858585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC80808080808000FFFF00FFFF00FFFF00FFFF00FFFF808080808080DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0A0A0A0DCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCA0A0A0A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC00000000FFFF80808000000000FFFF00000080808000FFFF000000DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCA0A0A0585858DC
          DCDC585858A0A0A0DCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC80808000000080808000000000FFFF000000808080000000808080DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858A0A0A0585858FF
          FFFF585858A0A0A0585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDC808080000000808080DCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A058
          5858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
        Layout = blGlyphTop
        NumGlyphs = 2
        Spacing = 0
        OnClick = sbnGerarArquivoClick
      end
    end
  end
  object sdgGeracao: TSaveDialog
    Title = 'Salvar o arquivo em:'
    Left = 256
    Top = 8
  end
end
