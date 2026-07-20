inherited frmCancelamentoContratosReservados: TfrmCancelamentoContratosReservados
  Left = 92
  Top = 224
  Caption = 'Cancelamento de Contratos Reservados'
  PixelsPerInch = 120
  inherited pnlFundoJanela: TPanel
    inherited gbxFilial: TGroupBox
      inherited edfFilial: TtecDbEditFind
        Parameter = 'codigo'
        ActiveSetControls = False
        DenyInsert = True
        NoSetControls = <>
        SetControls = <>
      end
    end
    inherited gbxVendedor: TGroupBox
      inherited edfVendedor: TtecDbEditFind
        Parameter = 'codigo'
        ActiveSetControls = False
        DenyInsert = True
        NoSetControls = <>
        SetControls = <>
      end
    end
  end
  object ecvValidar: TtecEditionControlValidation
    EditionControl = <
      item
        Control = edtDataEmissao
      end
      item
        Control = edtDataFinenceira
      end>
    Left = 336
    Top = 8
  end
end
