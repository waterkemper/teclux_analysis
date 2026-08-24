inherited frmRelatorioExtratoConta: TfrmRelatorioExtratoConta
  Left = 316
  Top = 44
  Caption = 'Relatório de extrato de contas'
  ClientHeight = 549
  ClientWidth = 839
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TToolBar
    Width = 839
  end
  inherited pnlFundoJanela: TPanel
    Top = 40
    Width = 839
    Height = 602
    Align = alTop
    Alignment = taLeftJustify
    object gbxTipo: TGroupBox
      Left = 441
      Top = 198
      Width = 89
      Height = 60
      Caption = ' INCLUIR '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object ckbCreditos: TCheckBox
        Left = 8
        Top = 15
        Width = 78
        Height = 16
        Caption = 'Créditos'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 0
        OnClick = ckbCreditosClick
      end
      object ckbDebitos: TCheckBox
        Left = 8
        Top = 35
        Width = 78
        Height = 16
        Caption = 'Débitos'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 1
        OnClick = ckbDebitosClick
      end
    end
    object gbxPeriodo: TGroupBox
      Left = 6
      Top = 198
      Width = 161
      Height = 36
      Caption = 'PERÍODO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object lblA: TLabel
        Left = 77
        Top = 15
        Width = 7
        Height = 15
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
      end
      object edtDataFinal: TEditData
        Left = 88
        Top = 10
        Width = 70
        Height = 23
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 1
        Minimo = 3650
        Maximo = 37353
      end
      object edtDataInicial: TEditData
        Left = 2
        Top = 10
        Width = 70
        Height = 23
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 0
        Minimo = 3650
        Maximo = 37353
      end
    end
    object rgpOrdenacao: TtecDBRadioGroup
      Left = 177
      Top = 198
      Width = 118
      Height = 60
      Caption = ' ORDENAÇÃO '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TabStop = False
      object rbnLancamento: TtecRadioButton
        Left = 6
        Top = 15
        Width = 107
        Height = 17
        Caption = 'Lançamento'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = True
      end
      object rbnCompensacao: TtecRadioButton
        Left = 6
        Top = 35
        Width = 107
        Height = 17
        Caption = 'Compensação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
    object rgpDocumento: TtecDBRadioGroup
      Left = 305
      Top = 198
      Width = 127
      Height = 60
      Caption = ' OBSERVAÇÕES '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      TabStop = False
      object rbnSoPrimeiraLinha: TtecRadioButton
        Left = 5
        Top = 15
        Width = 114
        Height = 16
        Caption = 'Só a 1ª linha '
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = True
      end
      object rbnTodasLinhas: TtecRadioButton
        Left = 5
        Top = 35
        Width = 114
        Height = 16
        Caption = 'Todas as linhas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
    inline fraSelecaoAleatoriaeventos1: TfraSelecaoAleatoriaeventos
      Left = 2
      Top = 266
      Width = 799
      Height = 225
      TabOrder = 4
      inherited fraSelecaoAleatoriaeventos: TfraSelecaoAleatoria
        Width = 799
        Height = 225
        inherited Splitter1: TSplitter
          Left = 769
          Height = 210
        end
        inherited dbgSelecaoAleatoria: TtecDBGrid
          Width = 769
          Height = 210
          Columns = <
            item
              Expanded = False
              FieldName = 'codigo'
              Title.Alignment = taCenter
              Title.Caption = 'Evento'
              Width = 79
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'descricao'
              Title.Alignment = taCenter
              Title.Caption = 'Descrição'
              Width = 335
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'campo'
              PickList.Strings = (
                'codigo'
                'descricao')
              Title.Alignment = taCenter
              Title.Caption = 'Aplicar a'
              Width = 112
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'opcomparacao'
              PickList.Strings = (
                '= Igual a'
                '<> Diferente de'
                '>= Maior ou Igual a'
                '<= Menor ou Igual a'
                '> Maior que'
                '< Menor que'
                'Contém'
                'Não Contém'
                'Contido na Lista'
                'não Contido na Lista')
              Title.Alignment = taCenter
              Title.Caption = 'Condição'
              Width = 131
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'oplogico'
              PickList.Strings = (
                'e'
                'ou')
              Title.Alignment = taCenter
              Title.Caption = 'Lógica'
              Width = 53
              Visible = True
            end>
        end
        inherited pnlLabels: TPanel
          Left = 772
          Height = 210
        end
        inherited pnlAbaixo: TPanel
          Top = 210
          Width = 799
          Font.Pitch = fpVariable
          inherited lblOrientacao: TLabel
            Font.Pitch = fpVariable
          end
          inherited pnlAbaixoDireita: TPanel
            Left = 768
            Font.Pitch = fpVariable
          end
        end
      end
    end
    inline fraSelecaoAleatoriacontasbancarias1: TfraSelecaoAleatoriacontasbancarias
      Left = 3
      Top = 3
      Width = 833
      Height = 185
      Align = alTop
      TabOrder = 5
      inherited fraSelecaoAleatoriacontasbancarias: TfraSelecaoAleatoria
        Width = 833
        Height = 185
        inherited Splitter1: TSplitter
          Left = 761
          Height = 170
        end
        inherited dbgSelecaoAleatoria: TtecDBGrid
          Width = 761
          Height = 170
          Columns = <
            item
              Expanded = False
              FieldName = 'conta'
              Title.Alignment = taCenter
              Title.Caption = 'Conta'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nrbanco'
              Title.Alignment = taCenter
              Title.Caption = 'Nr.'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'banco'
              Title.Alignment = taCenter
              Title.Caption = 'Banco'
              Width = 111
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'agencia'
              Title.Alignment = taCenter
              Title.Caption = 'Agência'
              Width = 139
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'titular'
              Title.Alignment = taCenter
              Title.Caption = 'Titular'
              Width = 131
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'campo'
              PickList.Strings = (
                'codigo'
                'descricao')
              Title.Alignment = taCenter
              Title.Caption = 'Aplicar a'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'opcomparacao'
              PickList.Strings = (
                '= Igual a'
                '<> Diferente de'
                '>= Maior ou Igual a'
                '<= Menor ou Igual a'
                '> Maior que'
                '< Menor que'
                'Contém'
                'Não Contém'
                'Contido na Lista'
                'não Contido na Lista')
              Title.Alignment = taCenter
              Title.Caption = 'Condição'
              Width = 115
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'oplogico'
              PickList.Strings = (
                'e'
                'ou')
              Title.Alignment = taCenter
              Title.Caption = 'Lógica'
              Width = 41
              Visible = True
            end>
        end
        inherited pnlLabels: TPanel
          Left = 764
          Height = 170
        end
        inherited pnlAbaixo: TPanel
          Top = 170
          Width = 833
          Font.Pitch = fpVariable
          inherited lblOrientacao: TLabel
            Font.Pitch = fpVariable
          end
          inherited pnlAbaixoDireita: TPanel
            Left = 802
            Font.Pitch = fpVariable
          end
        end
      end
    end
  end
  object ecvValida: TtecEditionControlValidation
    EditionControl = <
      item
      end
      item
        Control = edtDataFinal
      end
      item
        Control = edtDataInicial
      end>
    Left = 600
  end
end
