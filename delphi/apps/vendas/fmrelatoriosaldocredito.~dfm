inherited frmrelatoriosaldocredito: Tfrmrelatoriosaldocredito
  Left = 363
  Top = 214
  ActiveControl = fraConsultaFilialGrupoFilial
  Caption = 'Relat'#243'rio de Saldos de Cr'#233'dito'
  ClientHeight = 360
  ClientWidth = 716
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TToolBar
    Width = 716
  end
  inherited pnlFundoJanela: TPanel
    Top = 56
    Width = 716
    Height = 304
    inline fraConsultaFilialGrupoFilial: TfraConsultaFilialGrupoFilial
      Left = 3
      Top = 3
      Width = 710
      Height = 58
      Align = alTop
      Color = clBtnFace
      ParentColor = False
      TabOrder = 0
      inherited pgcFiliaisGruposFiliais: TPageControl
        Width = 710
        inherited tstFilial: TTabSheet
          inherited fraConsultaFilial: TfraConsultaCodigo
            Width = 688
            Height = 26
            HorzScrollBar.Range = 685
            Font.Pitch = fpVariable
            inherited dtxDescricao: TtecDBText
              Width = 597
            end
            inherited edfCodigo: TtecDBFindLookup
              Parameter = 'codigo'
              ActiveSetControls = False
              DenyInsert = True
              NoSetControls = <>
              SetControls = <>
            end
          end
        end
        inherited tstGrupodeFilial: TTabSheet
          inherited fraConsultaGrupoFilial: TfraConsultaCodigo
            Width = 687
            Height = 26
            HorzScrollBar.Range = 681
            Font.Pitch = fpVariable
            inherited dtxDescricao: TtecDBText
              Width = 594
            end
            inherited edfCodigo: TtecDBFindLookup
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
    object GroupBox1: TGroupBox
      Left = 3
      Top = 61
      Width = 710
      Height = 52
      Align = alTop
      Caption = 'Cliente'
      TabOrder = 1
      inline fraConsultaClientes: TfraConsultaCodigo
        Left = 5
        Top = 18
        Width = 692
        Height = 26
        HorzScrollBar.Range = 686
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
          Width = 598
          DataField = 'nome'
          DataSource = fraConsultaClientes.dsrProcuraCliente
        end
        inherited edfCodigo: TtecDBFindLookup
          DataField = 'codigo'
          DataSource = fraConsultaClientes.dsrProcuraCliente
          Group = 'Clientes'
          MaxLength = 8
          OnFound = nil
          Operacao = opPESQUISA
          Parameter = 'codigo'
          ActiveSetControls = False
          DenyInsert = True
          NoSetControls = <>
          SetControls = <>
        end
        inherited qryProcuraCobrador: TtecQuery
          Left = 464
          Top = 16
        end
        inherited dsrProcuraCobrador: TtecDataSource
          Left = 496
          Top = 24
        end
      end
    end
    object gbxEventos: TGroupBox
      Left = 3
      Top = 176
      Width = 513
      Height = 49
      Caption = 'Eventos'
      TabOrder = 3
      inline fraConsultaEventos: TfraConsultaCodigoContabil
        Left = 5
        Top = 18
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
          DataField = 'descricao'
          DataSource = fraConsultaEventos.dsrProcuraEventos
        end
        inherited edfCodigo: TtecDBFindLookup
          DataField = 'codigo'
          DataSource = fraConsultaEventos.dsrProcuraEventos
          Group = 'Eventos'
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
    object gbxUsuarios: TGroupBox
      Left = 3
      Top = 227
      Width = 513
      Height = 51
      Caption = 'Usu'#225'rios'
      TabOrder = 5
      inline fraConsultaUsuarios: TfraConsultaCodigo
        Left = 5
        Top = 18
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
    object ckbSomenteAvulsos: TCheckBox
      Left = 8
      Top = 280
      Width = 225
      Height = 23
      Caption = 'Somente lan'#231'amentos avulsos'
      TabOrder = 7
    end
    object gbxTipo: TGroupBox
      Left = 519
      Top = 176
      Width = 186
      Height = 49
      Caption = 'Tipo'
      TabOrder = 4
      object ckbEntradas: TCheckBox
        Left = 8
        Top = 24
        Width = 70
        Height = 20
        Caption = 'Entrada'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object ckbSaidas: TCheckBox
        Left = 96
        Top = 24
        Width = 70
        Height = 20
        Caption = 'Sa'#237'da'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
    end
    object tecPageControl1: TtecPageControl
      Left = 3
      Top = 113
      Width = 710
      Height = 64
      ActivePage = tstProdutos
      Align = alTop
      TabOrder = 2
      TabWidth = 140
      object tstProdutos: TTabSheet
        Caption = '&Produtos'
        inline fraConsultaProdutos: TfraConsultaCodigo
          Left = 3
          Top = 5
          Width = 686
          Height = 26
          HorzScrollBar.Range = 681
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
            Left = 152
          end
          inherited dtxDescricao: TtecDBText
            Left = 176
            Width = 505
            DataField = 'descricao'
            DataSource = fraConsultaProdutos.dsrProcuraProdutos
          end
          inherited edfCodigo: TtecDBFindLookup
            Width = 153
            DataField = 'codigo'
            DataSource = fraConsultaProdutos.dsrProcuraProdutos
            Group = 'Produtos'
            MaxLength = 18
            OnFound = nil
            Operacao = opPESQUISA
            Parameter = ' '
            ActiveSetControls = False
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
          end
        end
      end
      object tstGrupos: TTabSheet
        Caption = '&Grupos'
        ImageIndex = 1
        inline fraConsultaGrupos: TfraConsultaCodigo
          Left = 3
          Top = 5
          Width = 686
          Height = 26
          HorzScrollBar.Range = 681
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
            Width = 593
            DataField = 'descricao'
            DataSource = fraConsultaGrupos.dsrProcuraGrupoProdutos
          end
          inherited edfCodigo: TtecDBFindLookup
            DataField = 'codigo'
            DataSource = fraConsultaGrupos.dsrProcuraGrupoProdutos
            Group = 'Produtos'
            MaxLength = 5
            OnFound = nil
            Operacao = opPESQUISA
            Parameter = 'codigo'
          end
        end
      end
      object tstClasses: TTabSheet
        Caption = '&Classes'
        ImageIndex = 2
        inline fraConsultaClasses: TfraConsultaCodigo
          Left = 3
          Top = 5
          Width = 686
          Height = 26
          HorzScrollBar.Range = 681
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
            Width = 593
            DataField = 'descricao'
            DataSource = fraConsultaClasses.dsrProcuraClasses
          end
          inherited edfCodigo: TtecDBFindLookup
            DataField = 'codigo'
            DataSource = fraConsultaClasses.dsrProcuraClasses
            Group = 'Produtos'
            MaxLength = 5
            OnFound = nil
            Operacao = opPESQUISA
            Parameter = 'codigo'
          end
        end
      end
    end
    object ckbClientescomSaldo: TCheckBox
      Left = 288
      Top = 280
      Width = 193
      Height = 23
      Caption = 'Somente Clientes com Saldo'
      TabOrder = 8
    end
    object gbxData: TGroupBox
      Left = 519
      Top = 229
      Width = 186
      Height = 49
      Caption = 'DATA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      object gbxDataInicial: TGroupBox
        Left = 5
        Top = 10
        Width = 85
        Height = 36
        Caption = 'INICIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object edtDataInicial: TEditData
          Left = 2
          Top = 10
          Width = 80
          Height = 23
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Minimo = 37353
          Maximo = 0
        end
      end
      object gbxDataFinal: TGroupBox
        Left = 96
        Top = 10
        Width = 85
        Height = 36
        Caption = 'FINAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object edtDataFinal: TEditData
          Left = 2
          Top = 10
          Width = 80
          Height = 23
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Minimo = 37353
          Maximo = 0
        end
      end
    end
  end
end
