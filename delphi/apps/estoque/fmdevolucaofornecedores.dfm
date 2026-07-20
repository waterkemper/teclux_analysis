inherited frmDevolucaoFornecedores: TfrmDevolucaoFornecedores
  Left = 337
  Top = 135
  ActiveControl = fraConsultaFilial.edfCodigo
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  Caption = 'Devolu'#231#227'o a fornecedores'
  ClientHeight = 577
  ClientWidth = 895
  FormStyle = fsMDIChild
  Position = poScreenCenter
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 0
    Top = 40
    Width = 895
    Height = 537
    Align = alClient
    BevelOuter = bvNone
    Visible = True
    inherited bvlBotoesEd: TBevel
      Left = 0
      Top = 537
      Width = 895
      Height = 0
      Align = alBottom
    end
    object pgcProdutos: TPageControl
      Left = 0
      Top = 0
      Width = 895
      Height = 537
      ActivePage = tstParametros
      Align = alClient
      TabOrder = 0
      object tstParametros: TTabSheet
        Hint = 'Defini'#231#227'o dos filtros para sele'#231#227'o de produtos'
        Caption = '   &Par'#226'metros'
        object pnlTop: TPanel
          Left = 0
          Top = 0
          Width = 887
          Height = 177
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object pnlTopLeft: TPanel
            Left = 0
            Top = 0
            Width = 887
            Height = 177
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object gbxLocalizacao: TGroupBox
              Left = 4
              Top = 87
              Width = 436
              Height = 36
              Caption = 'LOCALIZA'#199#195'O'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              object edtLocalizacao: TEditTexto
                Left = 2
                Top = 10
                Width = 430
                Height = 24
                Hint = 'Defini'#231#227'o da localiza'#231#227'o dos produtos'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = -1
                ParentFont = False
                TabOrder = 0
                CharCasenoDefault = False
                Alignment = taLeftJustify
              end
            end
            object pnlFornecedor: TPanel
              Left = 2
              Top = 42
              Width = 441
              Height = 44
              BevelOuter = bvNone
              TabOrder = 1
              object gbxFornecedor: TGroupBox
                Left = 1
                Top = 2
                Width = 435
                Height = 40
                Caption = 'FORNECEDOR'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                inline fraConsultaFornecedor: TfraConsultaCodigo
                  Left = 3
                  Top = 14
                  Width = 431
                  Height = 24
                  HorzScrollBar.Range = 428
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
                    Hint = 'Procurar fornecedor'
                    Font.Height = -13
                  end
                  inherited dtxDescricao: TtecDBText
                    Width = 340
                    Height = 24
                    Hint = 'Nome ou raz'#227'o social do fornecedor'
                    DataField = 'nome'
                    DataSource = fraConsultaFornecedor.dsrProcuraCliente
                    Font.Height = -13
                  end
                  inherited edfCodigo: TtecDBFindLookup
                    Width = 64
                    Height = 24
                    Hint = 'C'#243'digo do fornecedor'
                    DataField = 'codigo'
                    DataSource = fraConsultaFornecedor.dsrProcuraCliente
                    Font.Height = -13
                    Group = 'fornecedor'
                    MaxLength = 6
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
            object gbxFilial: TGroupBox
              Left = 4
              Top = 0
              Width = 435
              Height = 37
              Caption = 'FILIAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              inline fraConsultaFilial: TfraConsultaCodigo
                Left = 4
                Top = 10
                Width = 427
                Height = 25
                HorzScrollBar.Range = 427
                VertScrollBar.Range = 24
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
                  Top = 1
                  Font.Height = -13
                end
                inherited dtxDescricao: TtecDBText
                  Top = 1
                  Width = 339
                  Height = 24
                  DataField = 'nome'
                  DataSource = fraConsultaFilial.dsrProcuraFiliais
                  Font.Height = -13
                end
                inherited edfCodigo: TtecDBFindLookup
                  Left = -1
                  Top = 1
                  Height = 24
                  DataField = 'codigo'
                  DataSource = fraConsultaFilial.dsrProcuraFiliais
                  Font.Height = -13
                  Group = 'filial'
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
            object gbxData: TGroupBox
              Left = 4
              Top = 125
              Width = 88
              Height = 38
              Caption = 'ESTOQUE EM'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              object edtData: TEditData
                Left = 3
                Top = 11
                Width = 81
                Height = 24
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 10
                ParentFont = False
                TabOrder = 0
                Minimo = 37353
                Maximo = 0
              end
            end
            object GroupBox1: TGroupBox
              Left = 96
              Top = 125
              Width = 88
              Height = 38
              Caption = 'NF A PARTIR DE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              object edtNFAcimaDe: TEditData
                Left = 3
                Top = 11
                Width = 81
                Height = 24
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 10
                ParentFont = False
                TabOrder = 0
                Minimo = 37353
                Maximo = 0
              end
            end
            object gbxDataNF: TGroupBox
              Left = 264
              Top = 125
              Width = 90
              Height = 38
              Caption = 'INCLUIR NF EM'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              object edtIncluirNFEm: TEditData
                Left = 3
                Top = 11
                Width = 83
                Height = 24
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 10
                ParentFont = False
                TabOrder = 0
                Minimo = 37353
                Maximo = 0
              end
            end
          end
          inline fraListaGrupoFornecedores: TfraListaGrupoFornecedores
            Left = 449
            Top = 0
            Width = 321
            Height = 177
            TabOrder = 1
            inherited gbxGrupoFornecedores: TGroupBox
              Width = 321
              Height = 177
              Caption = '&GRUPOS DE FORNECEDORES'
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              ParentFont = False
              inherited bvllimitatortabajara: TBevel
                Top = 14
                Width = 317
                Height = 1
              end
              inherited clbgrupofornecedores: TCheckListBox
                Top = 15
                Width = 291
                Height = 160
                Hint = 'Grupos de fornecedores'
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                ParentFont = False
              end
              inherited pnldireito: TPanel
                Left = 293
                Top = 15
                Height = 160
                inherited sbnDesmarcar: TSpeedButton
                  Hint = 'Desmarcar os grupos assinalados'
                end
                inherited sbnMarcar: TSpeedButton
                  Hint = 'Assinalar todos os grupos'
                end
              end
            end
            inherited qryGruposFornecedores: TtecQuery
              Database = nil
              Transaction = nil
            end
          end
        end
        object pnlBottom: TPanel
          Left = 0
          Top = 177
          Width = 887
          Height = 329
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          inline fraListaclasseProdutos: TfraListaclasseProdutos
            Left = 323
            Top = 0
            Width = 230
            Height = 329
            Align = alLeft
            TabOrder = 1
            inherited gbx: TGroupBox
              Width = 230
              Height = 329
              Caption = '&CLASSES DE PRODUTOS'
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              ParentFont = False
              inherited Bevel1: TBevel
                Top = 14
                Width = 226
                Height = 1
              end
              inherited clbclasseprodutos: TCheckListBox
                Top = 15
                Width = 200
                Height = 312
                Hint = 'Classes de produtos'
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                ParentFont = False
              end
              inherited pnldireito: TPanel
                Left = 202
                Top = 15
                Height = 312
                inherited sbnDesmarcar: TSpeedButton
                  Hint = 'Desmarcar as classes assinaladas'
                end
                inherited sbnMarcar: TSpeedButton
                  Hint = 'Assinalar todas as classes'
                end
              end
            end
            inherited qryclassesProdutos: TtecQuery
              Database = nil
              Transaction = nil
            end
          end
          inline fraListaGrupoProdutos: TfraListaGrupoProdutos
            Left = 0
            Top = 0
            Width = 323
            Height = 329
            Align = alLeft
            TabOrder = 0
            inherited gbx: TGroupBox
              Width = 323
              Height = 329
              Caption = '&GRUPOS DE PRODUTOS'
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              ParentFont = False
              inherited Bevel1: TBevel
                Top = 14
                Width = 319
                Height = 1
              end
              inherited clbgrupoprodutos: TCheckListBox
                Top = 15
                Width = 295
                Height = 312
                Hint = 'Grupos de produtos'
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                ParentFont = False
              end
              inherited pnldireito: TPanel
                Left = 297
                Top = 15
                Width = 24
                Height = 312
                inherited sbnDesmarcar: TSpeedButton
                  Hint = 'Desmarcar os grupos assinalados'
                end
                inherited sbnMarcar: TSpeedButton
                  Hint = 'Assinlar todos os grupos'
                end
              end
            end
            inherited qryGruposProdutos: TtecQuery
              Database = nil
              Transaction = nil
            end
          end
          inline fraListamarcasProdutos: TfraListamarcasProdutos
            Left = 553
            Top = 0
            Width = 217
            Height = 329
            Align = alLeft
            TabOrder = 2
            inherited gbx: TGroupBox
              Width = 217
              Height = 329
              Caption = '&MARCAS DE PRODUTOS'
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              ParentFont = False
              inherited Bevel1: TBevel
                Top = 14
                Width = 213
                Height = 1
              end
              inherited clbmarcasprodutos: TCheckListBox
                Top = 15
                Width = 187
                Height = 312
                Hint = 'Marcas de produtos'
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                ParentFont = False
              end
              inherited pnldireito: TPanel
                Left = 189
                Top = 15
                Height = 312
                inherited sbnDesmarcar: TSpeedButton
                  Hint = 'Desmarcar as marcas assinaladas'
                end
                inherited sbnMarcar: TSpeedButton
                  Hint = 'Assinalar todas as marcas'
                end
              end
            end
            inherited qrymarcassProdutos: TtecQuery
              Database = nil
              Transaction = nil
            end
          end
        end
      end
      object tstSelecao: TTabSheet
        Hint = 'Planilha de sele'#231#227'o dos produtos'
        Caption = '    &Sele'#231#227'o dos produtos'
        ImageIndex = 1
        object gbxProdutos: TGroupBox
          Left = 0
          Top = 129
          Width = 887
          Height = 353
          Align = alClient
          Caption = 'PRODUTOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Bevel1: TBevel
            Left = 2
            Top = 16
            Width = 883
            Height = 1
            Align = alTop
            Shape = bsSpacer
          end
          object dbgProdutosInventario: TtecDBGrid
            Left = 2
            Top = 17
            Width = 883
            Height = 334
            Align = alClient
            DataSource = dtmDevolucaoFornecedores.dsrProdutosMovimentados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -13
            TitleFont.Name = 'Arial'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = []
            OnDrawColumnCell = dbgProdutosInventarioDrawColumnCell
            OnDblClick = dbgProdutosInventarioDblClick
            OnKeyDown = dbgProdutosInventarioKeyDown
            RowWrap = 60
            Large = False
            DoubleRowColor = False
            MsgDelete = 'o PRODUTO DO INVENT'#193'RIO'
            TitleMinHeight = 100
            CellHeights = 100
            StrippedColor = 16054260
            CanDelete = False
            CanNotInsertFromGrid = False
            PostOnEnter = False
            PostOnSetUpDown = False
            DenySort = True
            DefaultRowHeight = 18
            ExibirNumerodaLinha = False
            NaoAtribuirDadosaTabelaaoDigitar = False
            Columns = <
              item
                ButtonStyle = cbsNone
                Expanded = False
                FieldName = 'codigoitem'
                Title.Alignment = taCenter
                Title.Caption = 'C'#243'digo'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'Arial'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 70
                Visible = True
              end
              item
                ButtonStyle = cbsNone
                Expanded = False
                FieldName = 'item'
                Title.Caption = 'Descri'#231#227'o'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'Arial'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 200
                Visible = True
              end
              item
                ButtonStyle = cbsNone
                Expanded = False
                FieldName = 'qtdestoque'
                Title.Alignment = taCenter
                Title.Caption = 'Em Estoque'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'Arial'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'pendente'
                Title.Caption = 'Pendente'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'Arial'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'qtsaidanf'
                Title.Alignment = taCenter
                Title.Caption = 'Sa'#237'da NF'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'Arial'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 50
                Visible = True
              end
              item
                ButtonStyle = cbsNone
                Expanded = False
                FieldName = 'quantidade'
                Title.Alignment = taCenter
                Title.Caption = 'Quantidade'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'Arial'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Alignment = taCenter
                ButtonStyle = cbsNone
                Expanded = False
                FieldName = 'serie'
                Title.Alignment = taCenter
                Title.Caption = 'S'#233'rie'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'Arial'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 30
                Visible = True
              end
              item
                ButtonStyle = cbsNone
                Expanded = False
                FieldName = 'numero'
                Title.Alignment = taCenter
                Title.Caption = 'N'#250'mero'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'Arial'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 48
                Visible = True
              end
              item
                ButtonStyle = cbsNone
                Expanded = False
                FieldName = 'data'
                Title.Alignment = taCenter
                Title.Caption = 'Data'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'Arial'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'aliquotaicms'
                Title.Alignment = taCenter
                Title.Caption = 'Al'#237'q.'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'Arial'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 35
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valoricms'
                Title.Alignment = taCenter
                Title.Caption = 'Valor ICMS'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'Arial'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'aliquotaipi'
                Title.Alignment = taCenter
                Title.Caption = 'Al'#237'q.'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'Arial'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 35
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valoripi'
                Title.Alignment = taCenter
                Title.Caption = 'Valor IPI'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'Arial'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                ButtonStyle = cbsNone
                Expanded = False
                FieldName = 'fornecedor'
                Title.Alignment = taCenter
                Title.Caption = 'C'#243'digo'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'Arial'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 40
                Visible = True
              end
              item
                ButtonStyle = cbsNone
                Expanded = False
                FieldName = 'nomefornecedor'
                Title.Caption = 'Nome Fornecedor'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'Arial'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'marcar'
                Title.Alignment = taCenter
                Title.Caption = 'Sel.'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'Arial'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 25
                Visible = True
              end>
          end
        end
        object gbxCodigoFiscal: TGroupBox
          Left = 0
          Top = 0
          Width = 887
          Height = 129
          Align = alTop
          Caption = 'NATUREZA DA OPERA'#199#195'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          inline fraConsultaNatureza: TfraConsultaCodigo
            Left = 6
            Top = 16
            Width = 819
            Height = 24
            HorzScrollBar.Range = 809
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
              Width = 721
              DataField = 'descricao'
              DataSource = fraConsultaNatureza.dsrProcuraNaturezasCFOP
            end
            inherited edfCodigo: TtecDBFindLookup
              DataField = 'codigofiscal'
              DataSource = fraConsultaNatureza.dsrProcuraNaturezasCFOP
              Group = 'natureza'
              MaxLength = 4
              OnFound = nil
              Operacao = opPESQUISA
              Parameter = 'codigofiscal'
              ActiveSetControls = False
              DenyInsert = True
              NoSetControls = <>
              SetControls = <>
            end
          end
          object dtxNatureza: TtecDBText
            Left = 6
            Top = 40
            Width = 809
            Height = 20
            TabStop = False
            Color = clBtnFace
            DataField = 'descricaonatureza'
            DataSource = fraConsultaNatureza.dsrProcuraNaturezasCFOP
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            Alignment = taLeftJustify
          end
          object gbxObservacoesNF: TGroupBox
            Left = 2
            Top = 66
            Width = 883
            Height = 61
            Caption = 'OBSERVA'#199#213'ES'
            TabOrder = 2
            object mmoObservacoes: TtecMemo
              Left = 2
              Top = 16
              Width = 879
              Height = 43
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Pitch = fpVariable
              Font.Style = []
              Lines.Strings = (
                'mmoObservacoes')
              ParentFont = False
              TabOrder = 0
            end
          end
        end
        object GroupBox2: TGroupBox
          Left = 0
          Top = 482
          Width = 887
          Height = 24
          Align = alBottom
          TabOrder = 2
          object ckbSelecionarTodos: TCheckBox
            Left = 752
            Top = 5
            Width = 129
            Height = 15
            Caption = 'Selecionar Todos'
            Checked = True
            State = cbChecked
            TabOrder = 0
            OnClick = ckbSelecionarTodosClick
          end
        end
      end
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 895
    inherited tblBarra: TToolBar
      Left = 308
      Width = 587
      inherited sbnProcurar: TSpeedButton
        Visible = False
        OnClick = nil
      end
      object sbnImprimir: TSpeedButton
        Left = 84
        Top = 2
        Width = 75
        Height = 39
        Hint = 'Imprimir listagem com as notas fiscais selecionadas'
        Caption = 'Imprimir F7'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
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
        ParentFont = False
        Spacing = 0
        OnClick = sbnImprimirClick
      end
    end
    inherited tblBarraCadastro: TToolBar
      Width = 308
      inherited sbnIncluir: TSpeedButton
        Visible = False
      end
      inherited sbnSalvar: TSpeedButton
        Hint = 'Imprimir as notas fiscais de devolu'#231#227'o'
      end
      inherited sbnExcluir: TSpeedButton
        Visible = False
      end
      object sbnGerar: TSpeedButton
        Left = 225
        Top = 2
        Width = 83
        Height = 35
        Hint = 'Gerar a consulta conforme par'#226'metros'
        Caption = 'Gerar F6'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDC808080000000808080DCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A058
          5858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC80808000000080808000000000FFFF000000808080000000808080DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858A0A0A0585858FF
          FFFF585858A0A0A0585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC00000000FFFF80808000000000FFFF00000080808000FFFF000000DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCA0A0A0585858DC
          DCDC585858A0A0A0DCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC80808080808000FFFF00FFFF00FFFF00FFFF00FFFF808080808080DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0A0A0A0DCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCA0A0A0A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          80808000000000000000FFFF80808000000080808000FFFF0000000000008080
          80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858585858DCDCDCA0A0A058
          5858A0A0A0DCDCDC585858585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
          00000000FFFF00FFFF00FFFF000000DCDCDC00000000FFFF00FFFF00FFFF0000
          00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCDCDCDCDCDCDC585858DC
          DCDC585858FFFFFFDCDCDCDCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
          80808000000000000000FFFF80808000000080808000FFFF0000000000008080
          80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858585858DCDCDCA0A0A058
          5858A0A0A0DCDCDC585858585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC80808080808000FFFF00FFFF00FFFF00FFFF00FFFF808080808080DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0A0A0A0DCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCA0A0A0A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC00000000FFFF80808000000000FFFF00000080808000FFFF000000DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCA0A0A0585858DC
          DCDC585858A0A0A0DCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC80808000000080808000000000FFFF000000808080000000808080DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858A0A0A0585858FF
          FFFF585858A0A0A0585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDC808080000000808080DCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A058
          5858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
        Layout = blGlyphTop
        NumGlyphs = 2
        ParentFont = False
        Spacing = 0
        OnClick = sbnGerarClick
      end
    end
  end
end
