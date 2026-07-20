inherited frmEmissaoNotasAcrescimoFinanceiro: TfrmEmissaoNotasAcrescimoFinanceiro
  Top = 106
  ActiveControl = fraConsultaFilial
  Caption = 'Emiss'#227'o de Notas Fiscais de Acrescimo Financeiro'
  ClientHeight = 539
  ClientWidth = 613
  Color = clBtnFace
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTopMenu: TPanel
    Width = 613
    inherited tblBarra: TToolBar
      Left = 304
      Width = 309
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
      inherited sbnAjuda: TSpeedButton
        Action = aclHabilitar
        GroupIndex = 0
      end
    end
    inherited tblBarraCadastro: TToolBar
      Width = 304
      inherited sbnIncluir: TSpeedButton
        Visible = False
      end
      inherited sbnExcluir: TSpeedButton
        Visible = False
      end
      object sbnGerar: TSpeedButton
        Left = 225
        Top = 2
        Width = 75
        Height = 43
        Hint = 'Gerar Informa'#231#245'es  => F6'
        Caption = 'Gerar F6'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        font.height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
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
        ParentFont = False
        Spacing = 0
        OnClick = sbnGerarClick
      end
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 53
    Width = 613
    Height = 486
    Align = alClient
    TabOrder = 2
    object gbxFiltros: TGroupBox
      Left = 1
      Top = 1
      Width = 611
      Height = 46
      Align = alTop
      TabOrder = 0
      object gbxFilial: TGroupBox
        Left = 178
        Top = 6
        Width = 355
        Height = 36
        Caption = 'FILIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        font.height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        inline fraConsultaFilial: TfraConsultaCodigo
          Left = 2
          Top = 10
          Width = 352
          Height = 24
          HorzScrollBar.Range = 351
          VertScrollBar.Range = 23
          AutoScroll = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          inherited sbnProcura: TSpeedButton
            Left = 49
            Height = 23
            Enabled = False
            Visible = False
          end
          inherited dtxDescricao: TtecDBText
            Left = 48
            Width = 303
            DataField = 'nome'
            DataSource = fraConsultaFilial.dsrProcuraFiliais
          end
          inherited edfCodigo: TtecDBFindLookup
            Width = 49
            TabStop = False
            DataField = 'codigo'
            DataSource = fraConsultaFilial.dsrProcuraFiliais
            Group = 'filial'
            MaxLength = 6
            OnFound = nil
            PermitirEditar = False
            Operacao = opPESQUISA
            Parameter = 'codigo'
            ActiveSetControls = False
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
          end
          inherited qryProcuraCobrador: TtecQuery
            Left = 352
            Top = 16
          end
          inherited dsrProcuraCobrador: TtecDataSource
            Left = 320
            Top = 8
          end
        end
      end
      object gbxEmissao: TGroupBox
        Left = 10
        Top = 6
        Width = 160
        Height = 36
        Caption = 'EMISS'#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        font.height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object lblA: TLabel
          Left = 76
          Top = 15
          Width = 5
          Height = 12
          Caption = 'a'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object edtEmissaoFinal: TEditData
          Left = 87
          Top = 10
          Width = 70
          Height = 20
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
          OnEnter = edtEmissaoFinalEnter
          Minimo = 37353
          Maximo = 0
        end
        object edtEmissaoInicial: TEditData
          Left = 2
          Top = 10
          Width = 70
          Height = 20
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 1
          OnExit = edtEmissaoInicialExit
          Minimo = 37353
          Maximo = 0
        end
      end
    end
    object gbxECFs: TGroupBox
      Left = 4
      Top = 175
      Width = 605
      Height = 121
      Caption = 'ECFs'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      font.height = -11
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object dbgECFs: TtecDBGrid
        Left = 4
        Top = 16
        Width = 475
        Height = 101
        DataSource = dtmEmissaoNotasAcrescimoFinanceiro.dsrECFsData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        font.height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        Titlefont.height = -13
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
        PostOnEnter = False
        DenySort = True
        Columns = <
          item
            Expanded = False
            FieldName = 'maquina'
            Title.Alignment = taCenter
            Title.Caption = 'ECF'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.font.height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'intervensao'
            Title.Alignment = taCenter
            Title.Caption = 'CRO'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.font.height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'acrescimo'
            Title.Alignment = taCenter
            Title.Caption = 'ACR'#201'SCIMO'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.font.height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'excluido'
            Title.Alignment = taCenter
            Title.Caption = 'EXCLUIDO'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.font.height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'percentual'
            Title.Alignment = taCenter
            Title.Caption = 'PERCENTUAL'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.font.height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valoricms'
            Title.Alignment = taCenter
            Title.Caption = 'VALOR ICMS'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.font.height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 75
            Visible = True
          end>
      end
    end
    object gbxData: TGroupBox
      Left = 4
      Top = 50
      Width = 605
      Height = 121
      Caption = 'DATAS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      font.height = -11
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object tecDBGrid1: TtecDBGrid
        Left = 4
        Top = 16
        Width = 475
        Height = 101
        DataSource = dtmEmissaoNotasAcrescimoFinanceiro.dsrDatas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        font.height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        Titlefont.height = -13
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
        PostOnEnter = False
        DenySort = True
        Columns = <
          item
            Expanded = False
            FieldName = 'data'
            Title.Alignment = taCenter
            Title.Caption = 'DATA'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.font.height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'acrescimo'
            Title.Alignment = taCenter
            Title.Caption = 'ACR'#201'SCIMO'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.font.height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'excluido'
            Title.Alignment = taCenter
            Title.Caption = 'EXCLUIDO'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.font.height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'percentual'
            Title.Alignment = taCenter
            Title.Caption = 'PERCENTUAL'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.font.height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valoricms'
            Title.Alignment = taCenter
            Title.Caption = 'VALOR ICMS'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.font.height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 75
            Visible = True
          end>
      end
    end
    object gbxCupons: TGroupBox
      Left = 4
      Top = 303
      Width = 605
      Height = 180
      Caption = 'CUPONS FISCAIS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      font.height = -11
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object dbgCupons: TtecDBGrid
        Left = 4
        Top = 20
        Width = 601
        Height = 156
        DataSource = dtmEmissaoNotasAcrescimoFinanceiro.dsrCupons
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        font.height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        Titlefont.height = -13
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
        PostOnEnter = False
        DenySort = True
        Columns = <
          item
            Expanded = False
            FieldName = 'numero'
            Title.Alignment = taCenter
            Title.Caption = 'N'#218'MERO'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.font.height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'qtdeparcelas_f'
            Title.Alignment = taCenter
            Title.Caption = 'NP'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.font.height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'entrada'
            Title.Alignment = taCenter
            Title.Caption = 'ENTRADA'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.font.height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'financiado'
            Title.Alignment = taCenter
            Title.Caption = 'FINANCIADO'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.font.height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'acrescimo'
            Title.Alignment = taCenter
            Title.Caption = 'ACR'#201'SCIMO'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.font.height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'icms'
            Title.Alignment = taCenter
            Title.Caption = 'ICMS'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.font.height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valorvista'
            Title.Alignment = taCenter
            Title.Caption = 'A VISTA'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.font.height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valortotal'
            Title.Alignment = taCenter
            Title.Caption = 'TOTAL'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.font.height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 75
            Visible = True
          end>
      end
      object gbxValores: TGroupBox
        Left = 107
        Top = 9
        Width = 437
        Height = 13
        Caption = 'V A L O R E S'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        font.height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  object actHabilitar: TActionList
    Left = 496
    Top = 8
    object aclHabilitar: TAction
      Caption = 'aclHabilitar'
      OnUpdate = aclHabilitarUpdate
    end
  end
end
