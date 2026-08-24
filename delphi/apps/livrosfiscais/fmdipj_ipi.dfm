inherited frmDIPJ_IPI: TfrmDIPJ_IPI
  Left = 448
  Top = 122
  ActiveControl = edtExercicio
  Caption = 'DIPJ IPI'
  ClientHeight = 587
  ClientWidth = 991
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 0
    Top = 45
    Width = 991
    Height = 542
    Align = alClient
    BevelOuter = bvNone
    Visible = True
    inherited bvlBotoesEd: TBevel
      Left = 0
      Top = 81
      Width = 991
      Height = 0
      Align = alTop
      Visible = False
    end
    object pnlTop: TPanel
      Left = 0
      Top = 0
      Width = 991
      Height = 81
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object gbxExercicio: TGroupBox
        Left = 7
        Top = 0
        Width = 68
        Height = 36
        Caption = 'EXERC'#205'CIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object gbxArquivo: TGroupBox
        Left = 7
        Top = 40
        Width = 537
        Height = 36
        Caption = 'NOME DO ARQUIVO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object dtxArquivo: TtecDBText
          Left = 2
          Top = 10
          Width = 531
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'nomearquivo'
          DataSource = dtmDIPJ_IPI.dsrdipj_ipi
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
      object gbxFilial: TGroupBox
        Left = 80
        Top = 0
        Width = 465
        Height = 37
        Caption = 'FILIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        inline fraConsultaFilial: TfraConsultaCodigo
          Left = 5
          Top = 10
          Width = 496
          Height = 25
          HorzScrollBar.Range = 456
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
            Left = 32
          end
          inherited dtxDescricao: TtecDBText
            Left = 56
            Width = 400
            DataField = 'nome'
            DataSource = fraConsultaFilial.dsrProcuraFiliais
          end
          inherited edfCodigo: TtecDBFindLookup
            Width = 32
            DataField = 'filial'
            DataSource = dtmDIPJ_IPI.dsrdipj_ipi
            Group = 'periodo'
            MaxLength = 3
            OnFound = fraConsultaFilialedfCodigoFound
            LookupField = 'codigo'
            LookupSource = fraConsultaFilial.dsrProcuraFiliais
            LookupQueryParameter = 'codigo'
            Parameter = 'filial'
            ActiveSetControls = True
            DenyInsert = False
            NoSetControls = <
              item
                Control = gbxExercicio
              end
              item
                Control = gbxFilial
              end
              item
                Control = gbxArquivo
              end>
            SetControls = <
              item
                Control = pgcDIPJ_IPI
              end>
            LookupParameter = 'codigo'
          end
        end
      end
      object edtExercicio: TtecDbEditFind
        Left = 9
        Top = 10
        Width = 63
        Height = 23
        Alignment = taLeftJustify
        DataField = 'exercicio'
        DataSource = dtmDIPJ_IPI.dsrdipj_ipi
        EditMask = '!0000;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Group = 'periodo'
        MaxLength = 4
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        Opcional = True
        OnFound = fraConsultaFilialedfCodigoFound
        ParentFont = False
        TabOrder = 1
        PermitirZero = False
        PermitirNulo = False
        Operacao = opATRIBUICAO
        Parameter = 'exercicio'
      end
      object rbgTipoDeclaracao: TtecDBRadioGroup
        Left = 552
        Top = -2
        Width = 137
        Height = 78
        Caption = 'Tipo de declara'#231#227'o'
        TabOrder = 4
        TabStop = False
        DataField = 'tipodeclaracao'
        DataSource = dtmDIPJ_IPI.dsrdipj_ipi
        object rbnDeclaracaoOriginal: TtecRadioButton
          Left = 16
          Top = 24
          Width = 105
          Height = 17
          Caption = 'Original'
          Checked = True
          TabOrder = 0
          TabStop = True
          Value = '0'
        end
        object rbnDeclaracaoRetificadora: TtecRadioButton
          Left = 16
          Top = 48
          Width = 105
          Height = 17
          Caption = 'Retificadora'
          TabOrder = 1
          Value = '1'
        end
      end
    end
    object pgcDIPJ_IPI: TPageControl
      Left = 0
      Top = 80
      Width = 969
      Height = 465
      ActivePage = tstApuracaoSaldoIPI
      MultiLine = True
      TabOrder = 1
      object tstApuracaoSaldoIPI: TTabSheet
        Caption = '  F20 - Apura'#231#227'o do Saldo do IPI  '
        object sbnReatualizarSaldos: TSpeedButton
          Left = 752
          Top = 8
          Width = 193
          Height = 36
          Hint = 'Reatualizar todos os totais de d'#233'bito e cr'#233'dito de IPI'
          Caption = 'Reatualizar'
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
          Spacing = 0
          OnClick = sbnReatualizarSaldosClick
        end
        object dbgdipj_ipi_f20: TtecDBGrid
          Left = 0
          Top = 0
          Width = 731
          Height = 433
          DataSource = dtmDIPJ_IPI.dsrdipj_ipi_f20
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -13
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
          PostOnEnter = True
          PostOnSetUpDown = False
          DenySort = True
          DefaultRowHeight = 19
          ExibirNumerodaLinha = False
          NaoAtribuirDadosaTabelaaoDigitar = False
          ShowWhenFieldInvisible = False
          CanClickWhenEditing = False
          Columns = <
            item
              Expanded = False
              FieldName = 'mes'
              Title.Caption = 'PER'#205'ODO'
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
              FieldName = 'saldocredoranterior'
              Title.Alignment = taCenter
              Title.Caption = 'SALDO CREDOR ANTERIOR'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 140
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'debito'
              Title.Alignment = taCenter
              Title.Caption = 'D'#201'BITO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'credito'
              Title.Alignment = taCenter
              Title.Caption = 'CR'#201'DITO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SaldoApurado'
              Title.Alignment = taCenter
              Title.Caption = 'SALDO APURADO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TipoSaldo'
              Title.Alignment = taCenter
              Title.Caption = 'CREDOR/DEVEDOR'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 104
              Visible = True
            end>
        end
      end
      object tstInformacoes: TTabSheet
        Caption = '  Informa'#231#245'es  '
        ImageIndex = 1
        object pgcInformacoes: TPageControl
          Left = 0
          Top = 0
          Width = 961
          Height = 434
          ActivePage = tstEntradasF21
          Align = alClient
          TabOrder = 0
          object tstEntradasF21: TTabSheet
            Caption = '    F21 - Entrada e cr'#233'ditos  '
            object dbgEntradaseCreditosF21: TtecDBGrid
              Left = 0
              Top = 0
              Width = 953
              Height = 403
              Align = alClient
              DataSource = dtmDIPJ_IPI.dsrdipj_ipi_f21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = [fsBold]
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clBlack
              TitleFont.Height = -13
              TitleFont.Name = 'helvetica'
              TitleFont.Pitch = fpVariable
              TitleFont.Style = []
              OnDrawColumnCell = dbgEntradaseCreditosF21DrawColumnCell
              RowWrap = 60
              Large = False
              DoubleRowColor = False
              TitleMinHeight = 100
              CellHeights = 100
              StrippedColor = 16054260
              CanDelete = False
              CanNotInsertFromGrid = False
              PostOnEnter = True
              PostOnSetUpDown = False
              DenySort = True
              DefaultRowHeight = 19
              ExibirNumerodaLinha = False
              NaoAtribuirDadosaTabelaaoDigitar = False
              ShowWhenFieldInvisible = False
              CanClickWhenEditing = False
              Columns = <
                item
                  Expanded = False
                  FieldName = 'codigo'
                  Title.Caption = 'C'#211'DIGO'
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
                  FieldName = 'discriminacao'
                  Title.Caption = 'DISCRIMINA'#199#195'O'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -9
                  Title.Font.Name = 'helvetica'
                  Title.Font.Pitch = fpVariable
                  Title.Font.Style = []
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'comcredito'
                  Title.Alignment = taCenter
                  Title.Caption = 'COM CR'#201'DITO'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -9
                  Title.Font.Name = 'helvetica'
                  Title.Font.Pitch = fpVariable
                  Title.Font.Style = []
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'semcredito'
                  Title.Alignment = taCenter
                  Title.Caption = 'SEM CR'#201'DITO'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -9
                  Title.Font.Name = 'helvetica'
                  Title.Font.Pitch = fpVariable
                  Title.Font.Style = []
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ipicreditado'
                  Title.Alignment = taCenter
                  Title.Caption = 'IPI CREDITADO'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -9
                  Title.Font.Name = 'helvetica'
                  Title.Font.Pitch = fpVariable
                  Title.Font.Style = []
                  Width = 100
                  Visible = True
                end>
            end
          end
          object tstSaidasF22: TTabSheet
            Caption = '    F22 - Sa'#237'das e d'#233'bitos  '
            ImageIndex = 1
            object dbgSaidaseDebitosF22: TtecDBGrid
              Left = 0
              Top = 0
              Width = 953
              Height = 403
              Align = alClient
              DataSource = dtmDIPJ_IPI.dsrdipj_ipi_f22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clBlack
              TitleFont.Height = -13
              TitleFont.Name = 'helvetica'
              TitleFont.Pitch = fpVariable
              TitleFont.Style = []
              OnDrawColumnCell = dbgSaidaseDebitosF22DrawColumnCell
              RowWrap = 60
              Large = False
              DoubleRowColor = False
              TitleMinHeight = 100
              CellHeights = 100
              StrippedColor = 16054260
              CanDelete = False
              CanNotInsertFromGrid = False
              PostOnEnter = True
              PostOnSetUpDown = False
              DenySort = True
              DefaultRowHeight = 19
              ExibirNumerodaLinha = False
              NaoAtribuirDadosaTabelaaoDigitar = False
              ShowWhenFieldInvisible = False
              CanClickWhenEditing = False
              Columns = <
                item
                  Expanded = False
                  FieldName = 'codigo'
                  Title.Caption = 'C'#211'DIGO'
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
                  FieldName = 'discriminacao'
                  Title.Caption = 'DISCRIMINA'#199#195'O'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -9
                  Title.Font.Name = 'helvetica'
                  Title.Font.Pitch = fpVariable
                  Title.Font.Style = []
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'comdebito'
                  Title.Alignment = taCenter
                  Title.Caption = 'COM D'#201'BITO'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -9
                  Title.Font.Name = 'helvetica'
                  Title.Font.Pitch = fpVariable
                  Title.Font.Style = []
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'semdebito'
                  Title.Alignment = taCenter
                  Title.Caption = 'SEM D'#201'BITO'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -9
                  Title.Font.Name = 'helvetica'
                  Title.Font.Pitch = fpVariable
                  Title.Font.Style = []
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ipidebitado'
                  Title.Alignment = taCenter
                  Title.Caption = 'IPI DEBITADO'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -9
                  Title.Font.Name = 'helvetica'
                  Title.Font.Pitch = fpVariable
                  Title.Font.Style = []
                  Width = 100
                  Visible = True
                end>
            end
          end
          object tstInsumoeMercadorias: TTabSheet
            Caption = '  Insumos e Mercadorias  '
            ImageIndex = 2
            object pgcInsumosemercadorias: TPageControl
              Left = 0
              Top = 0
              Width = 953
              Height = 403
              ActivePage = tstRemetentesInsumo
              Align = alClient
              TabOrder = 0
              object tstRemetentesInsumo: TTabSheet
                Caption = '  F23 - Remetentes de Insumos  '
                object dbgf23: TtecDBGrid
                  Left = 0
                  Top = 0
                  Width = 945
                  Height = 372
                  Align = alClient
                  DataSource = dtmDIPJ_IPI.dsrdipj_ipi_f23
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clBlack
                  TitleFont.Height = -13
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
                  DenySort = True
                  DefaultRowHeight = 19
                  ExibirNumerodaLinha = False
                  NaoAtribuirDadosaTabelaaoDigitar = False
                  ShowWhenFieldInvisible = False
                  CanClickWhenEditing = False
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'cnpj'
                      Title.Alignment = taCenter
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Width = 250
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'basecalculo'
                      Title.Alignment = taCenter
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Width = 100
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Expanded = False
                      FieldName = 'st'
                      Title.Alignment = taCenter
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Expanded = False
                      FieldName = 'ri'
                      Title.Alignment = taCenter
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Width = 110
                      Visible = True
                    end>
                end
              end
              object tstEntradasdeInsumos: TTabSheet
                Caption = '  F24 - Entradas de insumo/mercadorias'
                ImageIndex = 1
                object dbgf24: TtecDBGrid
                  Left = 0
                  Top = 0
                  Width = 945
                  Height = 372
                  Align = alClient
                  DataSource = dtmDIPJ_IPI.dsrdipj_ipi_f24
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clBlack
                  TitleFont.Height = -13
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
                  DenySort = True
                  DefaultRowHeight = 19
                  ExibirNumerodaLinha = False
                  NaoAtribuirDadosaTabelaaoDigitar = False
                  ShowWhenFieldInvisible = False
                  CanClickWhenEditing = False
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'classificacaofiscal'
                      Title.Alignment = taCenter
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Width = 85
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'extipi'
                      Title.Alignment = taCenter
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
                      FieldName = 'basecalculo'
                      Title.Alignment = taCenter
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Width = 100
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'descricaoproduto'
                      Title.Alignment = taCenter
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Expanded = False
                      FieldName = 'st'
                      Title.Alignment = taCenter
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Visible = True
                    end>
                end
              end
              object tstDestinatarioInsumo: TTabSheet
                Caption = '  F25 - Destinat'#225'rio de Insumos  '
                ImageIndex = 2
                object dbgf25: TtecDBGrid
                  Left = 0
                  Top = 0
                  Width = 945
                  Height = 372
                  Align = alClient
                  DataSource = dtmDIPJ_IPI.dsrdipj_ipi_f25
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clBlack
                  TitleFont.Height = -13
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
                  DenySort = True
                  DefaultRowHeight = 19
                  ExibirNumerodaLinha = False
                  NaoAtribuirDadosaTabelaaoDigitar = False
                  ShowWhenFieldInvisible = False
                  CanClickWhenEditing = False
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'cnpj'
                      Title.Alignment = taCenter
                      Title.Caption = 'CNPJ'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Width = 250
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'basecalculo'
                      Title.Alignment = taCenter
                      Title.Caption = 'VALOR'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Width = 100
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Expanded = False
                      FieldName = 'st'
                      Title.Alignment = taCenter
                      Title.Caption = 'SUBST. TRIB.'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Expanded = False
                      FieldName = 'ri'
                      Title.Alignment = taCenter
                      Title.Caption = 'INTERDEPEND'#202'NCIA'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Width = 110
                      Visible = True
                    end>
                end
              end
              object tstSaidasdeInsumos: TTabSheet
                Caption = '  F26 - Sa'#237'das de insumo/mercadorias  '
                ImageIndex = 3
                object dbgf26: TtecDBGrid
                  Left = 0
                  Top = 0
                  Width = 945
                  Height = 372
                  Align = alClient
                  DataSource = dtmDIPJ_IPI.dsrdipj_ipi_f26
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clBlack
                  TitleFont.Height = -13
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
                  DenySort = True
                  DefaultRowHeight = 19
                  ExibirNumerodaLinha = False
                  NaoAtribuirDadosaTabelaaoDigitar = False
                  ShowWhenFieldInvisible = False
                  CanClickWhenEditing = False
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'classificacaofiscal'
                      Title.Alignment = taCenter
                      Title.Caption = 'CLASSIFICA'#199#195'O'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Width = 85
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'extipi'
                      Title.Alignment = taCenter
                      Title.Caption = 'EXTIPI'
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
                      FieldName = 'basecalculo'
                      Title.Alignment = taCenter
                      Title.Caption = 'VALOR'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Width = 100
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'descricaoproduto'
                      Title.Alignment = taCenter
                      Title.Caption = 'INSUMOS/MERCADORIAS'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Expanded = False
                      FieldName = 'st'
                      Title.Alignment = taCenter
                      Title.Caption = 'SUBST. TRIB.'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Visible = True
                    end>
                end
              end
            end
          end
        end
      end
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 991
    inherited tblBarra: TToolBar
      Left = 297
      Width = 694
    end
    inherited tblBarraCadastro: TToolBar
      Width = 297
      object sbnGerarArquivo: TSpeedButton
        Left = 225
        Top = 2
        Width = 72
        Height = 39
        Caption = 'Gerar F8'
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
        OnClick = sbnGerarArquivoClick
      end
    end
  end
end
