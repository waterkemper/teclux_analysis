inherited frmRazaoAuxiliarFornecedores: TfrmRazaoAuxiliarFornecedores
  Left = 163
  Caption = 'Raz'#227'o Auxiliar de Fornecedores'
  ClientHeight = 383
  ClientWidth = 339
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 81
  inherited pnlBarra: TPanel
    Width = 339
  end
  inherited pnlFundoJanela: TPanel
    Width = 339
    Height = 342
    object rgpRelatorio: TRadioGroup
      Left = 7
      Top = 6
      Width = 154
      Height = 69
      Items.Strings = (
        'Emiss'#227'o do Livro'
        'Termo de Abertura')
      Caption = 'Relat'#243'rio'
      ItemIndex = 0
      TabOrder = 0
    end
    object gbxPeriodo: TGroupBox
      Left = 6
      Top = 75
      Width = 155
      Height = 116
      Caption = 'Per'#237'odo'
      TabOrder = 1
      object gbxPeriodoInicial: TGroupBox
        Left = 16
        Top = 12
        Width = 121
        Height = 49
        Alignment = taCenter
        Caption = 'De'
        TabOrder = 0
        object edtDataInicial: TEditData
          Left = 22
          Top = 20
          Width = 80
          Height = 23
          Alignment = taCenter
          MaxLength = 10
          TabOrder = 0
          Minimo = 37353
          Maximo = 0
        end
      end
      object gbxPeriodoFinal: TGroupBox
        Left = 16
        Top = 61
        Width = 121
        Height = 49
        Alignment = taCenter
        Caption = 'At'#233
        TabOrder = 1
        object edtDataFinal: TEditData
          Left = 22
          Top = 20
          Width = 80
          Height = 23
          Alignment = taCenter
          MaxLength = 10
          TabOrder = 0
          Minimo = 37353
          Maximo = 0
        end
      end
    end
    object gbxNumeracao: TGroupBox
      Left = 166
      Top = 6
      Width = 125
      Height = 95
      Caption = 'Numera'#231#227'o'
      TabOrder = 2
      object edtLivro: TEditNumero
        Left = 58
        Top = 16
        Width = 58
        Height = 23
        Alignment = taRightJustify
        TabOrder = 0
        Mascara = False
        NrDecimal = 0
        Decimais = False
        Negativo = False
        Tamanho = 4
      end
      object lblLivro: TLabel
        Left = 8
        Top = 20
        Width = 28
        Height = 15
        Caption = 'Livro'
      end
      object lblPagina: TLabel
        Left = 8
        Top = 45
        Width = 39
        Height = 15
        Caption = 'P'#225'gina'
      end
      object lblMaximo: TLabel
        Left = 8
        Top = 70
        Width = 43
        Height = 15
        Caption = 'M'#225'ximo'
      end
      object edtPagina: TEditNumero
        Left = 58
        Top = 41
        Width = 58
        Height = 23
        Alignment = taRightJustify
        TabOrder = 4
        Text = '2,00'
        Mascara = False
        NrDecimal = 0
        Decimais = False
        Negativo = False
        Tamanho = 9
      end
      object edtMaximo: TEditNumero
        Left = 58
        Top = 66
        Width = 58
        Height = 23
        Alignment = taRightJustify
        TabOrder = 5
        Text = '1.000,00'
        Mascara = False
        NrDecimal = 0
        Decimais = False
        Negativo = False
        Tamanho = 9
      end
    end
    object gbxSaldo: TGroupBox
      Left = 167
      Top = 104
      Width = 153
      Height = 81
      Caption = 'Saldos'
      TabOrder = 3
      object lblSaldoDebito: TLabel
        Left = 8
        Top = 32
        Width = 36
        Height = 15
        Caption = 'D'#233'bito'
      end
      object lblSaldoCredito: TLabel
        Left = 8
        Top = 56
        Width = 40
        Height = 15
        Caption = 'Cr'#233'dito'
      end
      object edtSaldoCredito: TEditNumero
        Left = 57
        Top = 48
        Width = 88
        Height = 23
        Alignment = taRightJustify
        TabOrder = 2
        Text = '0,00'
        Mascara = True
        NrDecimal = 2
        Decimais = True
        Negativo = True
        Tamanho = 9
      end
      object edtSaldoDebito: TEditNumero
        Left = 57
        Top = 24
        Width = 88
        Height = 23
        Alignment = taRightJustify
        TabOrder = 3
        Text = '0,00'
        Mascara = True
        NrDecimal = 2
        Decimais = True
        Negativo = True
        Tamanho = 9
      end
    end
    inline fraListaFiliais1: TfraListaFiliais
      Left = 6
      Top = 190
      Width = 326
      Height = 146
      TabOrder = 4
    end
  end
  object ecvValida: TtecEditionControlValidation
    EditionControl = <
      item
        Control = edtDataFinal
      end
      item
        Control = edtDataInicial
      end
      item
        Control = edtPagina
      end
      item
        Control = edtMaximo
      end>
    Left = 208
    Top = 8
  end
end
