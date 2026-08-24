inherited frmConsultaOsp: TfrmConsultaOsp
  Left = 429
  Top = 223
  ActiveControl = edtAnoEntradaConsultaOSP
  Caption = 'Consulta OSP'
  ClientHeight = 471
  ClientWidth = 851
  FormStyle = fsMDIChild
  Visible = True
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlTopMenu: TPanel
    Width = 851
    inherited tblBarra: TToolBar
      Left = 385
      Width = 466
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
    end
    inherited tblBarraCadastro: TToolBar
      Width = 385
      inherited sbnIncluir: TSpeedButton
        Visible = False
      end
      inherited sbnSalvar: TSpeedButton
        Visible = False
      end
      inherited sbnExcluir: TSpeedButton
        Visible = False
      end
      object sbnGerar: TSpeedButton
        Left = 225
        Top = 2
        Width = 75
        Height = 39
        Hint = 'Gerar Informa'#231#245'es  => F6'
        Caption = 'Gerar F6'
        Flat = True
        Glyph.Data = {
          DE030000424DDE03000000000000360000002800000011000000120000000100
          180000000000A8030000120B0000120B00000000000000000000DCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DC00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC80878000
          0000808780DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC00DCDC
          DCDCDCDCDCDCDC80878000000080878000000000FFFF00000080878000000080
          8780DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDC00000000FF
          FF80878000000000FFFF00000080878000FFFF000000DCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDC00DCDCDCDCDCDC00000080878080878000FFFF00FFFF00FFFF00FF
          FF00FFFF808780808780000000DCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDC
          80878000000000000000FFFF80878000000080878000FFFF0000000000008087
          80DCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDC00000000FFFF00FFFF00FFFF
          000000FFFFFF00000000FFFF00FFFF00FFFF000000DCDCDCDCDCDCDCDCDCDCDC
          DC00DCDCDCDCDCDC80878000000000000000FFFF80878000000080878000FFFF
          000000000000808780DCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDC80
          878080878000FFFF00FFFF00FFFF00FFFF00FFFF808780808780DCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDC00000000FFFF80878000000000
          FFFF00000080878000FFFF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC00DCDC
          DCDCDCDCDCDCDC80878000000080878000000000FFFF00000080878000000080
          8780DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDC808780000000808780DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDC00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DC00}
        Layout = blGlyphTop
        Spacing = 0
        OnClick = sbnGerarClick
      end
      object sbnImprmir: TSpeedButton
        Left = 300
        Top = 2
        Width = 85
        Height = 39
        Hint = 'Reimprimir a Nota => F7'
        Caption = 'Impress'#227'o F7'
        Flat = True
        Glyph.Data = {
          F6030000424DF603000000000000360000002800000013000000100000000100
          180000000000C0030000120B0000120B00000000000000000000DCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC000000DCDCDCDCDCDCDCDCDC00
          0000000000000000000000000000000000000000000000000000000000000000
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC000000DCDCDCDCDCDC000000C0C7C0C0C7
          C0C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0000000C0C7C0000000DC
          DCDCDCDCDCDCDCDCDCDCDC000000DCDCDC000000000000000000000000000000
          000000000000000000000000000000000000000000000000C0C7C0000000DCDC
          DCDCDCDCDCDCDC000000DCDCDC000000C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0
          C7C000FFFF00FFFF00FFFFC0C7C0C0C7C0000000000000000000DCDCDCDCDCDC
          DCDCDC000000DCDCDC000000C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0C7C08087
          80808780808780C0C7C0C0C7C0000000C0C7C0000000DCDCDCDCDCDCDCDCDC00
          0000DCDCDC000000000000000000000000000000000000000000000000000000
          000000000000000000000000C0C7C0C0C7C0000000DCDCDCDCDCDC000000DCDC
          DC000000C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0
          C7C0000000C0C7C0000000C0C7C0000000DCDCDCDCDCDC000000DCDCDCDCDCDC
          000000000000000000000000000000000000000000000000000000000000C0C7
          C0000000C0C7C0000000000000DCDCDCDCDCDC000000DCDCDCDCDCDCDCDCDC00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C7C0
          000000C0C7C0000000DCDCDCDCDCDC000000DCDCDCDCDCDCDCDCDCDCDCDC0000
          00FFFFFF000000000000000000000000000000FFFFFF00000000000000000000
          0000DCDCDCDCDCDCDCDCDC000000DCDCDCDCDCDCDCDCDCDCDCDC000000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000DCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDC000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC000000FFFFFF00
          0000000000000000000000000000FFFFFF000000DCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC000000FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000DCDCDCDCDCDCDCDCDCDCDCDC00
          0000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC000000000000000000000000
          000000000000000000000000000000DCDCDCDCDCDCDCDCDCDCDCDC000000DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC000000}
        Layout = blGlyphTop
        Spacing = 0
        OnClick = sbnImprmirClick
      end
    end
  end
  object pgcConsultasOSP: TtecPageControl
    Left = 0
    Top = 45
    Width = 851
    Height = 426
    ActivePage = tstParametros
    Align = alClient
    TabOrder = 2
    TabWidth = 160
    object tstParametros: TTabSheet
      Caption = 'Par'#226'metros'
      object gbxparametroCliente: TGroupBox
        Left = 10
        Top = 61
        Width = 425
        Height = 36
        Caption = 'CLIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        inline fraConsultaClientes: TfraConsultaCodigo
          Left = 2
          Top = 10
          Width = 421
          Height = 24
          HorzScrollBar.Range = 497
          HorzScrollBar.Visible = False
          VertScrollBar.Range = 23
          VertScrollBar.Visible = False
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
            Width = 332
            DataField = 'nome'
            DataSource = fraConsultaClientes.dsrProcuraCliente
          end
          inherited edfCodigo: TtecDBFindLookup
            DataField = 'codigo'
            DataSource = fraConsultaClientes.dsrProcuraCliente
            Group = 'cliente'
            MaxLength = 10
            Opcional = False
            OnFound = nil
            Operacao = opPESQUISA
            Parameter = 'codigo'
            ActiveSetControls = False
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
          end
          inherited qryProcuraCobrador: TtecQuery
            Top = 16
          end
          inherited dsrProcuraCobrador: TtecDataSource
            Left = 424
          end
        end
      end
      object gbxOSP: TGroupBox
        Left = 252
        Top = 6
        Width = 182
        Height = 47
        Caption = 'OSP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object GroupBox1: TGroupBox
          Left = 0
          Top = 11
          Width = 92
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
          inline fraConsultaOSPInicial: TfraConsultaCodigo
            Left = 2
            Top = 10
            Width = 88
            Height = 23
            HorzScrollBar.Range = 87
            HorzScrollBar.Visible = False
            VertScrollBar.Range = 24
            VertScrollBar.Visible = False
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
              DataField = 'produto'
              DataSource = fraConsultaOSPInicial.dsrProcuraOSP
              Visible = False
            end
            inherited edfCodigo: TtecDBFindLookup
              DataField = 'numero'
              DataSource = fraConsultaOSPInicial.dsrProcuraOSP
              Group = 'ospinicial'
              MaxLength = 8
              OnFound = nil
              OnMessage = fraConsultaOSPInicialedfCodigoMessage
              Operacao = opPESQUISA
              Parameter = 'numero'
              ActiveSetControls = False
              DenyInsert = True
              NoSetControls = <>
              SetControls = <>
            end
          end
        end
        object GroupBox2: TGroupBox
          Left = 90
          Top = 11
          Width = 92
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
          inline fraConsultaOSPFinal: TfraConsultaCodigo
            Left = 2
            Top = 10
            Width = 88
            Height = 23
            HorzScrollBar.Range = 87
            HorzScrollBar.Visible = False
            VertScrollBar.Range = 24
            VertScrollBar.Visible = False
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
              Visible = False
            end
            inherited edfCodigo: TtecDBFindLookup
              DataField = 'numero'
              DataSource = fraConsultaOSPFinal.dsrProcuraOSP
              Group = 'ospfinal'
              MaxLength = 8
              OnFound = nil
              OnMessage = fraConsultaOSPFinaledfCodigoMessage
              Operacao = opPESQUISA
              Parameter = 'numero'
              ActiveSetControls = False
              DenyInsert = True
              NoSetControls = <>
              SetControls = <>
            end
          end
        end
      end
      object gbxSemanaEntradaConsultaOSP: TGroupBox
        Left = 10
        Top = 6
        Width = 109
        Height = 47
        Caption = 'ENTRADA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object GroupBox9: TGroupBox
          Left = 53
          Top = 12
          Width = 56
          Height = 36
          Caption = 'SEMANA'
          TabOrder = 1
          object edtSemanaEntradaConsultaOSP: TSpinEdit
            Left = 2
            Top = 10
            Width = 51
            Height = 24
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxValue = 53
            MinValue = 0
            ParentFont = False
            TabOrder = 0
            Value = 0
            OnExit = edtSemanaEntradaConsultaOSPExit
          end
        end
        object GroupBox10: TGroupBox
          Left = 0
          Top = 12
          Width = 55
          Height = 36
          Caption = 'ANO'
          TabOrder = 0
          object edtAnoEntradaConsultaOSP: TSpinEdit
            Left = 2
            Top = 10
            Width = 50
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = 4
            MaxValue = 3000
            MinValue = 2000
            ParentFont = False
            TabOrder = 0
            Value = 2000
            OnExit = edtAnoEntradaConsultaOSPExit
          end
        end
      end
      object gbxSemanaEntregaConsultaOSP: TGroupBox
        Left = 131
        Top = 6
        Width = 109
        Height = 47
        Caption = 'ENTREGA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object GroupBox12: TGroupBox
          Left = 53
          Top = 12
          Width = 56
          Height = 36
          Caption = 'SEMANA'
          TabOrder = 1
          object edtSemanaEntregaConsultaOSP: TSpinEdit
            Left = 2
            Top = 10
            Width = 52
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxValue = 53
            MinValue = 0
            ParentFont = False
            TabOrder = 0
            Value = 0
            OnExit = edtSemanaEntregaConsultaOSPExit
          end
        end
        object GroupBox13: TGroupBox
          Left = 0
          Top = 12
          Width = 55
          Height = 36
          Caption = 'ANO'
          TabOrder = 0
          object edtAnoEntregaConsultaOSP: TSpinEdit
            Left = 2
            Top = 10
            Width = 50
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = 4
            MaxValue = 3000
            MinValue = 2000
            ParentFont = False
            TabOrder = 0
            Value = 2000
            OnExit = edtAnoEntregaConsultaOSPExit
          end
        end
      end
    end
    object tstregistros: TTabSheet
      Caption = 'Registros selecionados'
      ImageIndex = 1
      object dbgOSP: TtecDBGrid
        Left = 0
        Top = 0
        Width = 236
        Height = 180
        DataSource = dtmConsultaOsp.dsrOsp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -13
        TitleFont.Name = 'helvetica'
        TitleFont.Pitch = fpVariable
        TitleFont.Style = []
        OnDrawColumnCell = dbgOSPDrawColumnCell
        OnDblClick = dbgOSPDblClick
        RowWrap = 60
        Large = False
        DoubleRowColor = False
        TitleMinHeight = 100
        CellHeights = 100
        StrippedColor = 16054260
        CanDelete = False
        CanNotInsertFromGrid = False
        PostOnEnter = False
        PostOnSetUpDown = False
        DenySort = False
        DefaultRowHeight = 19
        ExibirNumerodaLinha = False
        NaoAtribuirDadosaTabelaaoDigitar = False
        ShowWhenFieldInvisible = False
        CanClickWhenEditing = False
        Columns = <
          item
            Expanded = False
            FieldName = 'numero'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' OSP'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'Arial'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'numerolote'
            Title.Alignment = taCenter
            Title.Caption = 'LOTE'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'jaimpresso'
            Title.Caption = 'IMPRESSO'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'imprimir'
            Title.Caption = 'IMPRIMIR'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 64
            Visible = True
          end>
      end
      object pgcDadosOSP: TtecPageControl
        Left = 0
        Top = 202
        Width = 843
        Height = 193
        ActivePage = tstOperacoes
        Align = alBottom
        TabOrder = 1
        object tstOperacoes: TTabSheet
          Caption = '  &1 - Opera'#231#245'es'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          object dbgOperacoes: TtecDBGrid
            Left = 0
            Top = 0
            Width = 835
            Height = 162
            Align = alClient
            DataSource = dtmConsultaOsp.dsrFluxogramasOperacoes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -12
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = []
            RowWrap = 60
            Large = False
            DoubleRowColor = False
            TitleMinHeight = 100
            CellHeights = 100
            StrippedColor = 16054260
            CanDelete = False
            CanNotInsertFromGrid = False
            PostOnEnter = False
            PostOnSetUpDown = False
            DenySort = False
            DefaultRowHeight = 19
            ExibirNumerodaLinha = False
            NaoAtribuirDadosaTabelaaoDigitar = False
            ShowWhenFieldInvisible = False
            CanClickWhenEditing = False
            Columns = <
              item
                Expanded = False
                FieldName = 'nome'
                Title.Alignment = taCenter
                Title.Caption = 'C'#211'DIGO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 90
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'c01'
                Title.Alignment = taCenter
                Title.Caption = 'C1'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 25
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'c02'
                Title.Alignment = taCenter
                Title.Caption = 'C2'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 25
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'c03'
                Title.Alignment = taCenter
                Title.Caption = 'C3'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 25
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'descricao'
                Title.Alignment = taCenter
                Title.Caption = 'DESCRI'#199#195'O'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 400
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'tempopadrao'
                Title.Alignment = taCenter
                Title.Caption = 'TEMPO PADR'#195'O'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 80
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'setup'
                Title.Alignment = taCenter
                Title.Caption = 'SET-UP'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 40
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'planocontrole'
                Title.Alignment = taCenter
                Title.Caption = 'P CONTROLE'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 65
                Visible = True
              end>
          end
        end
        object tstListaComponentes: TTabSheet
          Caption = '  &2 - Componentes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ImageIndex = 2
          ParentFont = False
          object dbgComponentes: TtecDBGrid
            Left = 0
            Top = 0
            Width = 835
            Height = 162
            Align = alClient
            DataSource = dtmConsultaOsp.dsrProdutosCompostos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -12
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = []
            RowWrap = 60
            Large = False
            DoubleRowColor = False
            TitleMinHeight = 100
            CellHeights = 100
            StrippedColor = 16054260
            CanDelete = False
            CanNotInsertFromGrid = False
            PostOnEnter = False
            PostOnSetUpDown = False
            DenySort = False
            DefaultRowHeight = 19
            ExibirNumerodaLinha = False
            NaoAtribuirDadosaTabelaaoDigitar = False
            ShowWhenFieldInvisible = False
            CanClickWhenEditing = False
            Columns = <
              item
                Expanded = False
                FieldName = 'quantidade'
                Title.Alignment = taCenter
                Title.Caption = 'QTDE'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 70
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'unidade'
                Title.Alignment = taCenter
                Title.Caption = 'UNIDADE'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'codigovisual'
                Title.Alignment = taCenter
                Title.Caption = 'C'#211'DIGO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 129
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'descricao'
                Title.Alignment = taCenter
                Title.Caption = 'DESCRI'#199#195'O'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 400
                Visible = True
              end>
          end
        end
        object tstObservacoes: TTabSheet
          Caption = '  &3 - Observa'#231#245'es'
          ImageIndex = 1
          object gbxObservacoes: TGroupBox
            Left = 305
            Top = 0
            Width = 530
            Height = 162
            Align = alClient
            Caption = 'OBSERVA'#199#213'ES'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object mmoobservacoes: TtecDBMemo
              Left = 2
              Top = 14
              Width = 526
              Height = 146
              Align = alClient
              DataField = 'observacoes'
              DataSource = dtmConsultaOsp.dsrOsp
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
          end
          object gbxDadosMarcacao: TGroupBox
            Left = 0
            Top = 0
            Width = 305
            Height = 162
            Align = alLeft
            Caption = 'DADOS DE MARCA'#199#195'O'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object mmodadosmarcacao: TtecDBMemo
              Left = 2
              Top = 14
              Width = 301
              Height = 146
              Align = alClient
              DataField = 'dadosmarcacao'
              DataSource = dtmConsultaOsp.dsrOsp
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
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
      object pnlDadosOSP: TPanel
        Left = 238
        Top = 0
        Width = 593
        Height = 204
        TabOrder = 2
        object gbxCliente: TGroupBox
          Left = 6
          Top = 57
          Width = 404
          Height = 36
          Caption = 'CLIENTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object edtcodigoCliente: TDBEditNumero
            Left = 2
            Top = 10
            Width = 73
            Height = 23
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Text = 'edtcodigoCliente'
            Mascara = True
            Alignment = taLeftJustify
            TipoMascara = tmGERAL
            NrDecimal = 0
            Decimais = True
            Negativo = False
            Tamanho = 9
            DataField = 'cliente'
            DataSource = dtmConsultaOsp.dsrOsp
          end
          object edtNomeCliente: TDBEditTexto
            Left = 74
            Top = 10
            Width = 326
            Height = 23
            DataField = 'nomecliente'
            DataSource = dtmConsultaOsp.dsrOsp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = 14
            ParentColor = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            CharCasenoDefault = False
            Alignment = taLeftJustify
          end
        end
        object gbxNumeroOSP: TGroupBox
          Left = 6
          Top = 4
          Width = 134
          Height = 50
          Caption = 'N'#186' DA OSP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object edtnumeroOSP: TDBEditNumero
            Left = 2
            Top = 11
            Width = 128
            Height = 36
            AutoSelect = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -25
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentColor = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Text = 'edtnumeroOSP'
            Mascara = True
            Alignment = taLeftJustify
            TipoMascara = tmGERAL
            NrDecimal = 0
            Decimais = True
            Negativo = False
            Tamanho = 9
            DataField = 'numero'
            DataSource = dtmConsultaOsp.dsrOsp
          end
        end
        object GroupBox3: TGroupBox
          Left = 264
          Top = 4
          Width = 319
          Height = 50
          Caption = 'PRAZO DE ENTREGA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object GroupBox4: TGroupBox
            Left = 8
            Top = 11
            Width = 80
            Height = 36
            Caption = 'DATA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object edtentrega: TDBEditData
              Left = 2
              Top = 10
              Width = 75
              Height = 23
              Alignment = taLeftJustify
              DataField = 'entrega'
              DataSource = dtmConsultaOsp.dsrOsp
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              Maximo = 0
              Minimo = 37353
              Adicional = 0
              ParentColor = True
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Opcional = True
            end
          end
          object GroupBox5: TGroupBox
            Left = 93
            Top = 11
            Width = 69
            Height = 36
            Caption = 'SEMANA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object dtxSemana: TtecDBText
              Left = 2
              Top = 10
              Width = 64
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'semana'
              DataSource = dtmConsultaOsp.dsrOsp
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Alignment = taCenter
            end
          end
          object GroupBox6: TGroupBox
            Left = 167
            Top = 11
            Width = 52
            Height = 36
            Caption = 'ANO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object dtxano: TtecDBText
              Left = 2
              Top = 10
              Width = 47
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'ano'
              DataSource = dtmConsultaOsp.dsrOsp
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Alignment = taCenter
            end
          end
          object GroupBox7: TGroupBox
            Left = 225
            Top = 11
            Width = 86
            Height = 36
            Caption = 'PRIORIDADE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            object dtxPrioridade: TtecDBText
              Left = 2
              Top = 10
              Width = 81
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'semana'
              DataSource = dtmConsultaOsp.dsrOsp
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Alignment = taCenter
            end
          end
        end
        object gbxNrNoCliente: TGroupBox
          Left = 417
          Top = 57
          Width = 166
          Height = 36
          Caption = 'N'#186' DO PEDIDO PARA O CLIENTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          object edtNrNoCliente: TDBEditTexto
            Left = 2
            Top = 10
            Width = 161
            Height = 23
            DataField = 'pedidocliente'
            DataSource = dtmConsultaOsp.dsrOsp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = 14
            ParentColor = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            CharCasenoDefault = False
            Alignment = taLeftJustify
          end
        end
        object gbxData: TGroupBox
          Left = 163
          Top = 18
          Width = 80
          Height = 36
          Caption = 'DATA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          object edtDataPedido: TDBEditData
            Left = 2
            Top = 10
            Width = 75
            Height = 23
            Alignment = taLeftJustify
            DataField = 'data'
            DataSource = dtmConsultaOsp.dsrOsp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            Maximo = 0
            Minimo = 365
            Adicional = 0
            ParentColor = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Opcional = True
          end
        end
        object gbxProdutonoCliente: TGroupBox
          Left = 6
          Top = 95
          Width = 577
          Height = 50
          Caption = 'PRODUTO NO CLIENTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          object gbxProdutoCliente: TGroupBox
            Left = 5
            Top = 11
            Width = 227
            Height = 36
            Caption = 'C'#211'DIGO DO PRODUTO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object edtProdutoCliente: TDBEditTexto
              Left = 2
              Top = 10
              Width = 222
              Height = 23
              DataField = 'produto_cliente'
              DataSource = dtmConsultaOsp.dsrClientesProdutos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentColor = True
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              CharCasenoDefault = False
              Alignment = taLeftJustify
            end
          end
          object gbxFinalidade: TGroupBox
            Left = 361
            Top = 11
            Width = 209
            Height = 36
            Caption = 'FINALIDADE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            object edtFinalidade: TDBEditTexto
              Left = 2
              Top = 10
              Width = 204
              Height = 23
              DataField = 'finalidade'
              DataSource = dtmConsultaOsp.dsrClientesProdutos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentColor = True
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              CharCasenoDefault = False
              Alignment = taLeftJustify
            end
          end
          object gbxOrigem: TGroupBox
            Left = 298
            Top = 11
            Width = 56
            Height = 36
            Caption = 'ORIGEM'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object edtOrigem: TDBEditTexto
              Left = 2
              Top = 10
              Width = 51
              Height = 23
              DataField = 'origem'
              DataSource = dtmConsultaOsp.dsrClientesProdutos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentColor = True
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              CharCasenoDefault = False
              Alignment = taCenter
            end
          end
          object gbxPN: TGroupBox
            Left = 237
            Top = 11
            Width = 55
            Height = 36
            Caption = 'PN'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object edtPN: TDBEditTexto
              Left = 2
              Top = 10
              Width = 50
              Height = 23
              DataField = 'pn'
              DataSource = dtmConsultaOsp.dsrClientesProdutos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 6
              ParentColor = True
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              CharCasenoDefault = False
              Alignment = taCenter
            end
          end
        end
        object gbxQuantidadeProduto: TGroupBox
          Left = 6
          Top = 147
          Width = 342
          Height = 50
          Caption = 'Q U A N T I D A D E S'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          object gbxPedida: TGroupBox
            Left = 6
            Top = 12
            Width = 143
            Height = 36
            Caption = 'PEDIDA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object edtQuantidade: TDBEditNumero
              Left = 2
              Top = 10
              Width = 80
              Height = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentColor = True
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Text = 'edtQuantidade'
              Mascara = False
              Alignment = taLeftJustify
              TipoMascara = tmQUANTIDADE
              NrDecimal = 0
              Decimais = False
              Negativo = False
              Tamanho = 0
              DataField = 'quantidade'
              DataSource = dtmConsultaOsp.dsrOsp
            end
            object dtxUnidade: TtecDBText
              Left = 82
              Top = 10
              Width = 58
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'unidade'
              DataSource = dtmConsultaOsp.dsrOsp
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              Alignment = taCenter
            end
          end
          object gbxEntregue: TGroupBox
            Left = 155
            Top = 12
            Width = 86
            Height = 36
            Caption = 'ENTREGUE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object dtxEntregue: TtecDBText
              Left = 2
              Top = 10
              Width = 81
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'qtdeentregue'
              DataSource = dtmConsultaOsp.dsrOsp
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Alignment = taLeftJustify
            end
          end
          object gbxSaldo: TGroupBox
            Left = 248
            Top = 12
            Width = 86
            Height = 36
            Caption = 'SALDO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object dtxSaldo: TtecDBText
              Left = 2
              Top = 10
              Width = 81
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataSource = dtmConsultaOsp.dsrOsp
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Alignment = taLeftJustify
            end
          end
        end
        object gbxPrecos: TGroupBox
          Left = 355
          Top = 147
          Width = 228
          Height = 50
          Caption = 'P R E '#199' O S'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          object gbxPreco: TGroupBox
            Left = 8
            Top = 12
            Width = 104
            Height = 36
            Caption = 'PRE'#199'O UNIT'#193'RIO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object edtPreco: TDBEditNumero
              Left = 2
              Top = 10
              Width = 99
              Height = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentColor = True
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Text = 'edtPreco'
              Mascara = True
              Alignment = taLeftJustify
              TipoMascara = tmGERAL
              NrDecimal = 2
              Decimais = True
              Negativo = False
              Tamanho = 14
              DataField = 'preco'
              DataSource = dtmConsultaOsp.dsrOsp
            end
          end
          object gbxTotal: TGroupBox
            Left = 117
            Top = 12
            Width = 104
            Height = 36
            Caption = 'TOTAL'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object dtxTotal: TtecDBText
              Left = 2
              Top = 10
              Width = 99
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'total'
              DataSource = dtmConsultaOsp.dsrOsp
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Alignment = taLeftJustify
            end
          end
        end
      end
      object ckbSelecionarTodas: TCheckBox
        Left = 2
        Top = 182
        Width = 91
        Height = 16
        Caption = 'Marcar todas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = ckbSelecionarTodasClick
      end
      object ckbSelecionarSoNaoImpressas: TCheckBox
        Left = 95
        Top = 183
        Width = 140
        Height = 16
        Caption = 'S'#243' as n'#227'o impressas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = ckbSelecionarSoNaoImpressasClick
      end
    end
  end
end
