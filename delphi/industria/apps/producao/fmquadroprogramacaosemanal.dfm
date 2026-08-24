inherited frmQuadroProgramacaoSemanal: TfrmQuadroProgramacaoSemanal
  Left = 410
  Top = 226
  ActiveControl = edtSemanaInicial
  Caption = 'Quadro de Programa'#231#227'o Semanal'
  ClientHeight = 480
  ClientWidth = 989
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlTopMenu: TPanel
    Width = 989
    inherited tblBarra: TToolBar
      Width = 764
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
      object sbnGerar: TSpeedButton
        Left = 84
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
        Left = 159
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
    inherited tblBarraCadastro: TToolBar
      inherited sbnIncluir: TSpeedButton
        Visible = False
      end
      inherited sbnSalvar: TSpeedButton
        Visible = False
      end
      inherited sbnExcluir: TSpeedButton
        Visible = False
      end
    end
  end
  object pgcParametrosQuadroSemana: TtecPageControl
    Left = 0
    Top = 45
    Width = 989
    Height = 435
    ActivePage = tstParametros
    Align = alClient
    TabOrder = 2
    TabWidth = 160
    OnChange = pgcParametrosQuadroSemanaChange
    object tstParametros: TTabSheet
      Caption = 'Par'#226'metros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      object gbxparametroCliente: TGroupBox
        Left = 6
        Top = 62
        Width = 501
        Height = 36
        Caption = 'CLIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        inline fraConsultaClientes: TfraConsultaCodigo
          Left = 2
          Top = 9
          Width = 498
          Height = 25
          HorzScrollBar.Range = 497
          VertScrollBar.Range = 25
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
            Height = 24
            OnClick = fraConsultaClientessbnProcuraClick
          end
          inherited dtxDescricao: TtecDBText
            Top = 2
            DataField = 'nome'
            DataSource = fraConsultaClientes.dsrProcuraCliente
          end
          inherited edfCodigo: TtecDBFindLookup
            Top = 2
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
        end
      end
      object gbxPeriodo: TGroupBox
        Left = 6
        Top = 6
        Width = 260
        Height = 48
        Caption = 'PER'#205'ODO DE  ENTREGA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object lblA: TLabel
          Left = 127
          Top = 28
          Width = 7
          Height = 16
          Caption = 'a'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object gbxInicial: TGroupBox
          Left = 0
          Top = 12
          Width = 120
          Height = 36
          Caption = 'SEMANA INICIAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object lblBarraInicial: TLabel
            Left = 52
            Top = 12
            Width = 5
            Height = 21
            Caption = '/'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -18
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
          end
        end
        object gbxFinal: TGroupBox
          Left = 140
          Top = 12
          Width = 120
          Height = 36
          Caption = 'SEMANA FINAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object Label1: TLabel
            Left = 52
            Top = 12
            Width = 5
            Height = 21
            Caption = '/'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -18
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
          end
        end
      end
      object edtSemanaInicial: TSpinEdit
        Left = 9
        Top = 28
        Width = 45
        Height = 24
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 0
        OnExit = edtSemanaInicialExit
      end
      object edtAnoinicial: TSpinEdit
        Left = 68
        Top = 28
        Width = 55
        Height = 24
        MaxValue = 0
        MinValue = 0
        TabOrder = 2
        Value = 2009
        OnExit = edtAnoinicialExit
      end
      object edtSemanaFinal: TSpinEdit
        Left = 149
        Top = 29
        Width = 45
        Height = 24
        MaxValue = 0
        MinValue = 0
        TabOrder = 3
        Value = 0
        OnExit = edtSemanaFinalExit
      end
      object edtAnoFinal: TSpinEdit
        Left = 208
        Top = 29
        Width = 55
        Height = 24
        MaxValue = 0
        MinValue = 0
        TabOrder = 4
        Value = 2009
        OnExit = edtAnoFinalExit
      end
    end
    object tstregistros: TTabSheet
      Caption = 'Registros Selecionados'
      ImageIndex = 1
      object dbgprogramacaosemanal: TtecDBGrid
        Left = 0
        Top = 7
        Width = 981
        Height = 397
        Align = alBottom
        DataSource = dtmQuadroProgramacaoSemanal.dsrOsp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'Arial'
        TitleFont.Pitch = fpVariable
        TitleFont.Style = []
        RowWrap = 60
        Large = False
        DoubleRowColor = True
        TitleMinHeight = 100
        CellHeights = 100
        StrippedColor = 16054260
        CanDelete = False
        CanNotInsertFromGrid = False
        PostOnEnter = False
        PostOnSetUpDown = False
        DenySort = True
        DefaultRowHeight = 19
        ExibirNumerodaLinha = False
        NaoAtribuirDadosaTabelaaoDigitar = False
        ShowWhenFieldInvisible = False
        CanClickWhenEditing = False
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ordem'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'N'#186
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'Arial'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 30
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'semana'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'SEM.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'Arial'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 30
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ano'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'ANO'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'Arial'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 45
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'numero'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'O.S.P.'
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
            FieldName = 'nomecliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'CLIENTE'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'Arial'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'produto_cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'PRODUTO'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'Arial'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 235
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'pn'
            Title.Alignment = taCenter
            Title.Caption = 'PART NUMBER'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'Arial'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'quantidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'PEDIDA'
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
            FieldName = 'qtdeentregue'
            Title.Alignment = taCenter
            Title.Caption = 'ENTREGUE'
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
            FieldName = 'saldo'
            Title.Alignment = taCenter
            Title.Caption = 'SALDO'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'Arial'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 60
            Visible = True
          end>
      end
      object gbxQuantidades: TGroupBox
        Left = 740
        Top = -2
        Width = 184
        Height = 17
        Caption = ' Q U A N T I D A D E S '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
  end
end
