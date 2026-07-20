inherited frmRelatorioCupons: TfrmRelatorioCupons
  Left = 443
  Top = 322
  ActiveControl = edtPeriodoInicial
  Caption = 'Relat'#243'rio de Cupons Fiscais'
  ClientHeight = 118
  ClientWidth = 535
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TToolBar
    Width = 535
  end
  inherited pnlFundoJanela: TPanel
    Top = 40
    Width = 535
    Height = 78
    object gbxPeriodo: TGroupBox
      Left = 0
      Top = 2
      Width = 118
      Height = 73
      Caption = 'PER'#205'ODO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object lblPeriodoInicial: TLabel
        Left = 5
        Top = 20
        Width = 35
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'INICIAL'
      end
      object lblPeriodoFinal: TLabel
        Left = 5
        Top = 50
        Width = 35
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'FINAL'
      end
      object edtPeriodoInicial: TEditData
        Left = 42
        Top = 14
        Width = 70
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Minimo = 37353
        Maximo = 0
      end
      object edtPeriodoFinal: TEditData
        Left = 42
        Top = 44
        Width = 70
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Minimo = 37353
        Maximo = 0
      end
    end
    object gbxFilial: TGroupBox
      Left = 122
      Top = 2
      Width = 409
      Height = 36
      Caption = 'FILIAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      inline fraConsultaCodigoFilial: TfraConsultaCodigo
        Left = 2
        Top = 10
        Width = 404
        Height = 23
        HorzScrollBar.Range = 401
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
        inherited sbnProcura: TSpeedButton
          Left = 48
        end
        inherited dtxDescricao: TtecDBText
          Left = 72
          Width = 329
          DataField = 'nome'
          DataSource = fraConsultaCodigoFilial.dsrProcuraFiliais
        end
        inherited edfCodigo: TtecDBFindLookup
          Width = 49
          DataField = 'codigo'
          DataSource = fraConsultaCodigoFilial.dsrProcuraFiliais
          Group = 'Filial'
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
    object gbxVendedor: TGroupBox
      Left = 122
      Top = 39
      Width = 409
      Height = 36
      Caption = 'VENDEDOR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      inline fraConsultaCodigoVendedor: TfraConsultaCodigo
        Left = 2
        Top = 10
        Width = 404
        Height = 23
        HorzScrollBar.Range = 401
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
        inherited sbnProcura: TSpeedButton
          Left = 48
        end
        inherited dtxDescricao: TtecDBText
          Left = 72
          Width = 329
          DataField = 'nome'
          DataSource = fraConsultaCodigoVendedor.dsrProcuraVendedores
        end
        inherited edfCodigo: TtecDBFindLookup
          Width = 49
          DataField = 'codigo'
          DataSource = fraConsultaCodigoVendedor.dsrProcuraVendedores
          Group = 'Vendedor'
          MaxLength = 4
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
