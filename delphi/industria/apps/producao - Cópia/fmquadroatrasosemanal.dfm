inherited frmQuadroAtrasoSemanal: TfrmQuadroAtrasoSemanal
  Left = 811
  Top = 255
  ActiveControl = fraConsultaClientes.edfCodigo
  Caption = 'Relat'#243'rio Quadro de Atraso Semanal'
  ClientHeight = 493
  ClientWidth = 979
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TToolBar
    Width = 979
    object sbnGerar: TSpeedButton
      Left = 153
      Top = 2
      Width = 75
      Height = 35
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
  end
  inherited pnlFundoJanela: TPanel
    Top = 54
    Width = 979
    Height = 439
    object pgcParametrosQuadroSemana: TtecPageControl
      Left = 3
      Top = 3
      Width = 973
      Height = 433
      ActivePage = tstParametros
      Align = alClient
      TabOrder = 0
      TabWidth = 160
      OnChange = pgcParametrosQuadroSemanaChange
      object tstParametros: TTabSheet
        Caption = 'Par'#226'metros'
        object gbxparametroCliente: TGroupBox
          Left = 6
          Top = 66
          Width = 500
          Height = 36
          Caption = 'CLIENTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          inline fraConsultaClientes: TfraConsultaCodigo
            Left = 1
            Top = 10
            Width = 497
            Height = 24
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
            inherited sbnProcura: TSpeedButton
              Left = 65
            end
            inherited dtxDescricao: TtecDBText
              Top = 1
              DataField = 'nome'
              DataSource = fraConsultaClientes.dsrProcuraCliente
            end
            inherited edfCodigo: TtecDBFindLookup
              Left = 2
              Width = 64
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
          Width = 215
          Height = 48
          Caption = 'PER'#205'ODO DE ENTREGA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object lblA: TLabel
            Left = 104
            Top = 25
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
            Left = -1
            Top = 12
            Width = 100
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
              Left = 38
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
            object edtSemanaInicial: TEditTexto
              Left = 2
              Top = 10
              Width = 33
              Height = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
              TabOrder = 0
              OnExit = edtSemanaInicialExit
              CharCasenoDefault = False
              Alignment = taCenter
            end
            object edtAnoinicial: TEditTexto
              Left = 46
              Top = 10
              Width = 51
              Height = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
              TabOrder = 1
              CharCasenoDefault = False
              Alignment = taCenter
            end
          end
          object gbxFinal: TGroupBox
            Left = 116
            Top = 12
            Width = 100
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
              Left = 38
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
            object edtSemanaFinal: TEditTexto
              Left = 2
              Top = 10
              Width = 33
              Height = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
              TabOrder = 0
              OnExit = edtSemanaFinalExit
              CharCasenoDefault = False
              Alignment = taCenter
            end
            object edtAnoFinal: TEditTexto
              Left = 46
              Top = 10
              Width = 51
              Height = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
              TabOrder = 1
              CharCasenoDefault = False
              Alignment = taCenter
            end
          end
        end
      end
      object tstregistros: TTabSheet
        Caption = 'Registros Selecionados'
        ImageIndex = 1
        object dbgprogramacaosemanal: TtecDBGrid
          Left = 0
          Top = 8
          Width = 965
          Height = 394
          Align = alBottom
          DataSource = dtmQuadroAtrasoSemanal.dsrOsp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
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
          PostOnEnter = False
          DenySort = False
          DefaultRowHeight = 19
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'marcador'
              Title.Alignment = taCenter
              Title.Caption = 'PRAZO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'Arial'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 50
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'numero'
              Title.Alignment = taCenter
              Title.Caption = 'O.S.P.'
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
              FieldName = 'nomecliente'
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
              FieldName = 'produtovisual'
              Title.Alignment = taCenter
              Title.Caption = 'DESCRI'#199#195'O DO MATERIAL'
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
              Title.Alignment = taCenter
              Title.Caption = 'PEDIDA'
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
              FieldName = 'entregue'
              Title.Alignment = taCenter
              Title.Caption = 'ENTREGUE'
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
              FieldName = 'Saldo'
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
          Left = 693
          Top = -2
          Width = 203
          Height = 13
          Caption = 'Q U A N T I D A D E S'
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
end
