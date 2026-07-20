inherited fraFoneRamal: TfraFoneRamal
  Width = 233
  inherited gbxFone: TGroupBox
    Width = 233
    object lblRamal: TLabel [2]
      Left = 149
      Top = 12
      Width = 31
      Height = 12
      Caption = 'RAMAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
    end
    inherited edtNumero: TDBEditFone
      Tag = 0
      Tamanho = 9
    end
    object edtFoneRamal: TDBEditTexto
      Left = 149
      Top = 24
      Width = 80
      Height = 23
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      MaxLength = -1
      ParentFont = False
      TabOrder = 2
      CharCasenoDefault = False
      Alignment = taLeftJustify
    end
  end
end
