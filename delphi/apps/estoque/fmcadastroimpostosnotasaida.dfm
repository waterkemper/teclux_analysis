inherited frmCadastroImpostosNotaSaida: TfrmCadastroImpostosNotaSaida
  Left = 456
  Top = 212
  ActiveControl = cmbTipo
  Caption = 'Cadastro de Impostos'
  ClientHeight = 222
  ClientWidth = 314
  PixelsPerInch = 96
  TextHeight = 13
  inherited tblBarra: TToolBar
    Width = 314
    TabOrder = 2
    inherited sbnProcurar: TSpeedButton
      Visible = False
    end
    inherited tbnDivisor: TToolButton
      Left = 0
      Wrap = True
    end
    inherited sbnAjuda: TSpeedButton
      Left = 0
      Top = 51
    end
    inherited sbnIncluir: TSpeedButton
      Left = 75
      Top = 51
    end
    inherited sbnSalvar: TSpeedButton
      Left = 150
      Top = 51
    end
    inherited sbnExcluir: TSpeedButton
      Left = 225
      Top = 51
    end
  end
  inherited pnlBarra: TPanel
    Width = 282
    inherited bvlBotoesEd: TBevel
      Left = 201
      Height = 35
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 53
    Width = 314
    Height = 169
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object gbxImpostos: TGroupBox
      Left = 0
      Top = 0
      Width = 314
      Height = 169
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      font.height = -13
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object gbxTipoImposto: TGroupBox
        Left = 6
        Top = 6
        Width = 72
        Height = 36
        Caption = 'TIPO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        font.height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object cmbTipo: TtecDBComboBox
          Left = 2
          Top = 10
          Width = 66
          Height = 21
          DataField = 'tipo'
          DataSource = dtmEmissaoNotaAvulsas.dsrCalculosDadosFiscais
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ItemHeight = 13
          Items.Strings = (
            'ICMS'
            'IPI'
            'ISS')
          ParentFont = False
          TabOrder = 0
        end
      end
      object gbxBaseCalculo: TGroupBox
        Left = 82
        Top = 6
        Width = 110
        Height = 36
        Caption = 'BASE DE CÁLCULO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        font.height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object edtValorBase: TDBEditNumero
          Left = 2
          Top = 10
          Width = 105
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          TabOrder = 0
          Text = '999.999.999,99'
          Mascara = True
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 12
          DataField = 'base'
          DataSource = dtmEmissaoNotaAvulsas.dsrCalculosDadosFiscais
        end
      end
      object gbxAliquota: TGroupBox
        Left = 197
        Top = 6
        Width = 75
        Height = 36
        Caption = 'ALÍQUOTA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        font.height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object lblPercentual: TLabel
          Left = 57
          Top = 14
          Width = 9
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object edtAliquota: TDBEditNumero
          Left = 2
          Top = 10
          Width = 50
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          TabOrder = 0
          Text = '999,99'
          Mascara = True
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 6
          DataField = 'aliquota'
          DataSource = dtmEmissaoNotaAvulsas.dsrCalculosDadosFiscais
        end
      end
      object gbxValorImposto: TGroupBox
        Left = 82
        Top = 48
        Width = 110
        Height = 36
        Caption = 'VALOR IMPOSTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        font.height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object edtValor: TDBEditNumero
          Left = 2
          Top = 10
          Width = 105
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          TabOrder = 0
          Text = '999.999.999,99'
          Mascara = True
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 12
          DataField = 'valor'
          DataSource = dtmEmissaoNotaAvulsas.dsrCalculosDadosFiscais
        end
      end
      object gbxIsentas: TGroupBox
        Left = 82
        Top = 90
        Width = 110
        Height = 36
        Caption = 'ISENTAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        font.height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object edtIsentos: TDBEditNumero
          Left = 2
          Top = 10
          Width = 105
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          TabOrder = 0
          Text = '999.999.999,99'
          Mascara = True
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 12
          DataField = 'isentas'
          DataSource = dtmEmissaoNotaAvulsas.dsrCalculosDadosFiscais
        end
      end
      object gbxOutras: TGroupBox
        Left = 82
        Top = 133
        Width = 110
        Height = 36
        Caption = 'OUTRAS OPERAÇÕES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        font.height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        object edtOutros: TDBEditNumero
          Left = 2
          Top = 10
          Width = 105
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          TabOrder = 0
          Text = '999.999.999,99'
          Mascara = True
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 12
          DataField = 'outras'
          DataSource = dtmEmissaoNotaAvulsas.dsrCalculosDadosFiscais
        end
      end
      object gbxTotal: TGroupBox
        Left = 197
        Top = 133
        Width = 110
        Height = 36
        Caption = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        font.height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        object dtxTotalImposto: TtecDBText
          Left = 2
          Top = 10
          Width = 105
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'Total'
          DataSource = dtmEmissaoNotaAvulsas.dsrCalculosDadosFiscais
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -13
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
  end
end  
