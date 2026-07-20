object fraDataParametro: TfraDataParametro
  Left = 0
  Top = 0
  Width = 243
  Height = 69
  VertScrollBar.Range = 67
  AutoScroll = False
  TabOrder = 0
  object gbxFormaSelecao: TGroupBox
    Left = 0
    Top = 0
    Width = 243
    Height = 37
    Align = alTop
    Caption = 'FORMA DE SELE'#199#195'O'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object dbcFormaSelecao: TtecDBComboBox
      Left = 4
      Top = 12
      Width = 234
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ItemHeight = 15
      Items.Strings = (
        #218'LTIMO DIA M'#202'S ANTERIOR'
        #218'LTIMO DIA M'#202'S ATUAL'
        'DATA SELECIONADO')
      ParentFont = False
      TabOrder = 0
      OnChange = dbcFormaSelecaoChange
    end
  end
  object gbxPeriodo: TGroupBox
    Left = 0
    Top = 39
    Width = 243
    Height = 30
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object lblDataInicial: TLabel
      Left = 4
      Top = 10
      Width = 25
      Height = 12
      Caption = 'DATA:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
    end
    object edtDataFinal: TEditData
      Left = 40
      Top = 4
      Width = 80
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      Minimo = 37353
      Maximo = 0
    end
  end
end
