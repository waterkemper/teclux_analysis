inherited frmExibirJurosDescontos: TfrmExibirJurosDescontos
  Left = 270
  Top = 129
  ActiveControl = edtDiasAtraso1
  Caption = 'Taxas Juros/Descontos'
  ClientHeight = 235
  ClientWidth = 311
  Color = clBtnFace
  PixelsPerInch = 92
  object pnlExibirJurosDescontos: TPanel
    Left = 0
    Top = 0
    Width = 311
    Height = 235
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 0
    object gbxExibirJurosDescontos: TGroupBox
      Left = 3
      Top = 3
      Width = 305
      Height = 229
      Align = alClient
      TabOrder = 0
      object gbxPagamentosAtraso: TGroupBox
        Left = 9
        Top = 3
        Width = 287
        Height = 136
        Caption = 'Pagamentos em atraso'
        TabOrder = 0
        object lblDiasAtrasoMulta1: TLabel
          Left = 9
          Top = 23
          Width = 53
          Height = 15
          Alignment = taRightJustify
          Caption = 'Acima de'
        end
        object lblDiasAtrasoJuros1: TLabel
          Left = 9
          Top = 82
          Width = 53
          Height = 15
          Alignment = taRightJustify
          Caption = 'Acima de'
        end
        object edtDiasAtraso1: TEditNumero
          Left = 65
          Top = 19
          Width = 60
          Height = 23
          TabStop = False
          Alignment = taRightJustify
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
          Mascara = True
          NrDecimal = 2
          Decimais = False
          Negativo = False
          Tamanho = 3
        end
        object edtDiasAtraso2: TEditNumero
          Left = 65
          Top = 78
          Width = 60
          Height = 23
          TabStop = False
          Alignment = taRightJustify
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 3
          Mascara = True
          NrDecimal = 2
          Decimais = False
          Negativo = False
          Tamanho = 3
        end
        object lblDias3: TLabel
          Left = 127
          Top = 23
          Width = 23
          Height = 15
          Alignment = taRightJustify
          Caption = 'dias'
        end
        object lblPercentagem2: TLabel
          Left = 261
          Top = 23
          Width = 11
          Height = 15
          Alignment = taRightJustify
          Caption = '%'
        end
        object edtPercAtrasoMulta1: TEditNumero
          Left = 199
          Top = 19
          Width = 60
          Height = 23
          TabStop = False
          Alignment = taRightJustify
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 1
          Mascara = True
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 2
        end
        object lblPercentagem3: TLabel
          Left = 261
          Top = 49
          Width = 11
          Height = 15
          Alignment = taRightJustify
          Caption = '%'
        end
        object edtPercAtrasoMulta2: TEditNumero
          Left = 199
          Top = 78
          Width = 60
          Height = 23
          TabStop = False
          Alignment = taRightJustify
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 4
          Mascara = True
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 2
        end
        object lblMultas: TLabel
          Left = 163
          Top = 23
          Width = 31
          Height = 15
          Alignment = taRightJustify
          Caption = 'Multa'
        end
        object lblPercentagem4: TLabel
          Left = 261
          Top = 82
          Width = 11
          Height = 15
          Alignment = taRightJustify
          Caption = '%'
        end
        object edtPercAtrasoJuros1: TEditNumero
          Left = 199
          Top = 45
          Width = 60
          Height = 23
          TabStop = False
          Alignment = taRightJustify
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 2
          Mascara = True
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 2
        end
        object lblPercentagem5: TLabel
          Left = 261
          Top = 109
          Width = 11
          Height = 15
          Alignment = taRightJustify
          Caption = '%'
        end
        object edtPercAtrasoJuros2: TEditNumero
          Left = 199
          Top = 105
          Width = 60
          Height = 23
          TabStop = False
          Alignment = taRightJustify
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 5
          Mascara = True
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 2
        end
        object lblDias5: TLabel
          Left = 127
          Top = 82
          Width = 23
          Height = 15
          Alignment = taRightJustify
          Caption = 'dias'
        end
        object lblJuros: TLabel
          Left = 163
          Top = 49
          Width = 31
          Height = 15
          Alignment = taRightJustify
          Caption = 'Juros'
        end
        object lblMultas1: TLabel
          Left = 163
          Top = 82
          Width = 31
          Height = 15
          Alignment = taRightJustify
          Caption = 'Multa'
        end
        object lblJuros1: TLabel
          Left = 163
          Top = 109
          Width = 31
          Height = 15
          Alignment = taRightJustify
          Caption = 'Juros'
        end
      end
      object gbxDesconto: TGroupBox
        Left = 9
        Top = 143
        Width = 287
        Height = 42
        TabOrder = 1
        object lblDescontoPagAntecipado: TLabel
          Left = 13
          Top = 12
          Width = 183
          Height = 15
          Alignment = taRightJustify
          Caption = 'Desconto para pagto antecipado'
        end
        object edtDescontoPagAntecipado: TEditNumero
          Left = 199
          Top = 8
          Width = 60
          Height = 23
          TabStop = False
          Alignment = taRightJustify
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 1
          Mascara = True
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 2
        end
        object Label1: TLabel
          Left = 260
          Top = 12
          Width = 11
          Height = 15
          Alignment = taRightJustify
          Caption = '%'
        end
      end
      object sbnFechar: TBitBtn
        Left = 112
        Top = 193
        Width = 80
        Height = 25
        Caption = '&Fechar'
        Color = clBtnFace
        TabOrder = 2
        OnClick = sbnFecharClick
      end
    end
  end
end
