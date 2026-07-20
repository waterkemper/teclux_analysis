inherited frmSelecionarUsuario: TfrmSelecionarUsuario
  Left = 542
  Top = 215
  Caption = 'Seleconar Usu'#225'rio'
  ClientHeight = 83
  ClientWidth = 514
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object gbxFundoJanela: TGroupBox
    Left = 0
    Top = 0
    Width = 514
    Height = 83
    Align = alClient
    TabOrder = 0
    object bbnCancelar: TBitBtn
      Left = 246
      Top = 52
      Width = 80
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      TabStop = False
      Kind = bkCancel
    end
    object bbnOK: TBitBtn
      Left = 159
      Top = 52
      Width = 80
      Height = 25
      Caption = '&OK'
      TabOrder = 0
      TabStop = False
      Kind = bkOK
    end
    object gbxUsuario: TGroupBox
      Left = 3
      Top = 6
      Width = 502
      Height = 39
      Caption = 'Usu'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      inline fraConsultaUsuarios: TfraConsultaCodigo
        Left = 4
        Top = 11
        Width = 505
        Height = 26
        HorzScrollBar.Range = 497
        VertScrollBar.Range = 23
        AutoScroll = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        inherited dtxDescricao: TtecDBText
          DataField = 'nome'
          DataSource = fraConsultaUsuarios.dsrProcuraUsuarios
        end
        inherited edfCodigo: TtecDBFindLookup
          DataField = 'codigo'
          DataSource = fraConsultaUsuarios.dsrProcuraUsuarios
          Group = 'Usuarios'
          MaxLength = 3
          OnFound = nil
          Operacao = opPESQUISA
          Parameter = 'codigo'
          ActiveSetControls = False
          DenyInsert = True
          NoSetControls = <>
          SetControls = <>
        end
      end
    end
  end
end
