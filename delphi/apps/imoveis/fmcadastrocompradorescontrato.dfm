inherited frmcadastroCompradoresContrato: TfrmcadastroCompradoresContrato
  Left = 381
  Top = 232
  ActiveControl = fraConsultaComprador
  Caption = 'Cadastro de Compradores do Im'#243'vel'
  ClientWidth = 704
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlTopMenu: TPanel
    Width = 704
    inherited tblBarra: TToolBar
      Width = 479
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 45
    Width = 704
    Height = 177
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object gbxComprador: TGroupBox
      Left = 10
      Top = 6
      Width = 410
      Height = 36
      Caption = 'COMPRADOR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      inline fraConsultaComprador: TfraConsultaCodigo
        Left = 2
        Top = 10
        Width = 405
        Height = 23
        HorzScrollBar.Range = 405
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
          Width = 317
          DataField = 'nome'
          DataSource = fraConsultaComprador.dsrProcuraCliente
        end
        inherited edfCodigo: TtecDBFindLookup
          DataField = 'cliente'
          DataSource = dtmContratosImoveis.dsrCompradores
          MaxLength = 6
          LookupField = 'codigo'
          LookupSource = fraConsultaComprador.dsrProcuraCliente
          LookupQueryParameter = 'codigo'
          Parameter = ' '
          ActiveSetControls = False
          DenyInsert = False
          NoSetControls = <>
          SetControls = <>
          LookupParameter = 'codigo'
        end
        inherited qryConsultaContas: TtecQuery
          Left = 295
          Top = 23
        end
      end
    end
    object gbxRepresentante: TGroupBox
      Left = 10
      Top = 47
      Width = 410
      Height = 36
      Caption = 'REPRESENTANTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      inline fraConsultaRepresentante: TfraConsultaCodigo
        Left = 2
        Top = 10
        Width = 405
        Height = 23
        HorzScrollBar.Range = 405
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
          Width = 317
          DataField = 'nome'
          DataSource = fraConsultaRepresentante.dsrProcuraCliente
        end
        inherited edfCodigo: TtecDBFindLookup
          DataField = 'representante'
          DataSource = dtmContratosImoveis.dsrCompradores
          MaxLength = 6
          LookupField = 'codigo'
          LookupSource = fraConsultaRepresentante.dsrProcuraCliente
          LookupQueryParameter = 'codigo'
          Parameter = ' '
          ActiveSetControls = False
          DenyInsert = False
          NoSetControls = <>
          SetControls = <>
          LookupParameter = 'codigo'
        end
      end
    end
    object gbxFiador: TGroupBox
      Left = 10
      Top = 89
      Width = 410
      Height = 36
      Caption = 'FIADOR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      inline fraConsultaFiador: TfraConsultaCodigo
        Left = 2
        Top = 10
        Width = 405
        Height = 23
        HorzScrollBar.Range = 405
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
          Width = 317
          DataField = 'nome'
          DataSource = fraConsultaFiador.dsrProcuraCliente
        end
        inherited edfCodigo: TtecDBFindLookup
          DataField = 'fiador'
          DataSource = dtmContratosImoveis.dsrCompradores
          MaxLength = 6
          LookupField = 'codigo'
          LookupSource = fraConsultaFiador.dsrProcuraCliente
          LookupQueryParameter = 'codigo'
          Parameter = ' '
          ActiveSetControls = False
          DenyInsert = False
          NoSetControls = <>
          SetControls = <>
          LookupParameter = 'codigo'
        end
      end
    end
    object gbxPercentual: TGroupBox
      Left = 427
      Top = 6
      Width = 93
      Height = 35
      Caption = 'PERCENTUAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object edtPercentual: TDBEditNumero
        Left = 2
        Top = 10
        Width = 88
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = -1
        ParentFont = False
        TabOrder = 0
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 4
        Decimais = True
        Negativo = False
        Tamanho = 9
        DataField = 'percentual'
        DataSource = dtmContratosImoveis.dsrCompradores
      end
    end
    object gbxObservacoes: TGroupBox
      Left = 427
      Top = 46
      Width = 267
      Height = 78
      Caption = 'OBSERVA'#199#213'ES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      object mmoObservacoes: TtecDBMemo
        Left = 2
        Top = 14
        Width = 263
        Height = 62
        Align = alClient
        DataField = 'observacoes'
        DataSource = dtmContratosImoveis.dsrCompradores
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object cbxPrincipal: TDBCheckBox
      Left = 544
      Top = 10
      Width = 145
      Height = 31
      Caption = 'Comprador Principal'
      DataField = 'principal'
      DataSource = dtmContratosImoveis.dsrCompradores
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
  end
end
