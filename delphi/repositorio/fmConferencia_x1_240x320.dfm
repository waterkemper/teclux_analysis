inherited frmConferenciacoletor_x1_240x320: TfrmConferenciacoletor_x1_240x320
  Left = 519
  Top = 190
  Width = 978
  Height = 386
  ActiveControl = pgcContrato
  BorderIcons = []
  BorderStyle = bsNone
  BorderWidth = 0
  Caption = 'Op'#231#245'es'
  Color = clWindow
  Ctl3D = False
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited stbPrincipal: TStatusBar
    Top = 348
    Width = 962
    Height = 0
    Visible = False
  end
  object pnlOpColetor: TPanel
    Left = 0
    Top = 0
    Width = 240
    Height = 320
    Constraints.MaxHeight = 320
    Constraints.MaxWidth = 240
    Constraints.MinHeight = 320
    Constraints.MinWidth = 240
    TabOrder = 0
    Visible = False
    object btnContrato: TButton
      Left = 0
      Top = -1
      Width = 241
      Height = 50
      Caption = '1 - Contrato'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnContratoClick
    end
    object btnInterlojas: TButton
      Left = 0
      Top = 53
      Width = 241
      Height = 50
      Caption = '2 - Interlojas'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnInterlojasClick
    end
    object btnListaPadrao: TButton
      Left = 0
      Top = 107
      Width = 241
      Height = 50
      Caption = '3 - Listas Padr'#227'o'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnListaPadraoClick
    end
    object btnNFSaida: TButton
      Left = 0
      Top = 216
      Width = 241
      Height = 50
      Caption = '5 - NF de Sa'#237'da'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btnNFSaidaClick
    end
    object btnNFEntrada: TButton
      Left = 0
      Top = 162
      Width = 241
      Height = 50
      Caption = '4 - NF de Entrada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnNFEntradaClick
    end
    object btnSair: TButton
      Left = 0
      Top = 271
      Width = 241
      Height = 50
      Caption = 'Esc - Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = btnSairClick
    end
  end
  object pnlOperacao: TPanel
    Left = 241
    Top = 0
    Width = 240
    Height = 320
    Caption = 'pnlOperacao'
    Constraints.MaxHeight = 320
    Constraints.MaxWidth = 240
    Constraints.MinHeight = 320
    Constraints.MinWidth = 240
    TabOrder = 1
    object pgcOperacao: TPageControl
      Left = 1
      Top = 1
      Width = 238
      Height = 287
      ActivePage = tstContrato
      Align = alClient
      TabOrder = 0
      object tstContrato: TTabSheet
        Caption = 'tstContrato'
        object pgcContrato: TPageControl
          Left = 0
          Top = 0
          Width = 230
          Height = 259
          ActivePage = tstParametrosContrato
          Align = alClient
          TabOrder = 0
          OnChange = pgcContratoChange
          object tstParametrosContrato: TTabSheet
            Caption = 'Par'#226'metros'
            object pnlTopContrato: TPanel
              Left = 0
              Top = 0
              Width = 222
              Height = 61
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object edfContrato: TtecDbEditFind
                Left = 0
                Top = 16
                Width = 137
                Height = 23
                Alignment = taLeftJustify
                AutoSize = False
                Constraints.MaxHeight = 23
                Constraints.MinHeight = 23
                DataField = 'numero'
                DataSource = dsrProcuraContratos
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Pitch = fpVariable
                Font.Style = []
                Group = 'contrato'
                MaxLength = 20
                Maximo = 0
                Minimo = 37353
                Adicional = 0
                Opcional = True
                OnFound = edfContratoFound
                OnKeyDown = edfContratoKeyDown
                ParentFont = False
                TabOrder = 0
                PermitirZero = False
                PermitirNulo = False
                Operacao = opATRIBUICAO
                Parameter = 'contrato'
                ActiveSetControls = False
                DenyInsert = True
                NoSetControls = <>
                SetControls = <>
              end
              object lblContrato: TStaticText
                Left = 0
                Top = 0
                Width = 138
                Height = 17
                Alignment = taCenter
                AutoSize = False
                BorderStyle = sbsSingle
                Caption = 'Contrato'
                Constraints.MaxHeight = 17
                Constraints.MaxWidth = 138
                Constraints.MinHeight = 17
                Constraints.MinWidth = 138
                TabOrder = 3
              end
              object lblDataContrato: TStaticText
                Left = 136
                Top = 0
                Width = 86
                Height = 17
                Alignment = taCenter
                AutoSize = False
                BorderStyle = sbsSingle
                Caption = 'Data'
                Constraints.MaxHeight = 17
                Constraints.MaxWidth = 86
                Constraints.MinHeight = 17
                Constraints.MinWidth = 86
                TabOrder = 4
              end
              object edtDataContrato: TEditData
                Left = 136
                Top = 16
                Width = 86
                Height = 23
                AutoSize = False
                Constraints.MaxHeight = 23
                Constraints.MinHeight = 23
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                OnKeyDown = edtDataContratoKeyDown
                Minimo = 37353
                Maximo = 0
              end
              object lblNomeClenteContrato: TStaticText
                Left = 0
                Top = 38
                Width = 41
                Height = 23
                AutoSize = False
                BorderStyle = sbsSingle
                Caption = 'Nome'
                Constraints.MaxHeight = 23
                Constraints.MaxWidth = 41
                Constraints.MinHeight = 23
                Constraints.MinWidth = 41
                TabOrder = 5
              end
              object edtNomeContrato: TEditTexto
                Left = 38
                Top = 38
                Width = 195
                Height = 23
                AutoSize = False
                Constraints.MaxHeight = 23
                Constraints.MaxWidth = 195
                Constraints.MinHeight = 23
                Constraints.MinWidth = 195
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = -1
                ParentFont = False
                TabOrder = 2
                OnKeyDown = edtNomeContratoKeyDown
                CharCasenoDefault = False
                Alignment = taLeftJustify
              end
            end
          end
          object tstSelecaoContrato: TTabSheet
            Caption = 'Contrato'
            ImageIndex = 1
            object dbgContrato: TtecDBGrid
              Left = 0
              Top = 0
              Width = 222
              Height = 231
              Align = alClient
              DataSource = dsrContratos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Pitch = fpVariable
              TitleFont.Style = []
              OnKeyDown = dbgContratoKeyDown
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
              DefaultRowHeight = 16
              ExibirNumerodaLinha = False
              NaoAtribuirDadosaTabelaaoDigitar = False
              ShowWhenFieldInvisible = False
              CanClickWhenEditing = False
              Columns = <
                item
                  Expanded = False
                  FieldName = 'numero'
                  Title.Alignment = taCenter
                  Title.Caption = 'Contrato'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'data'
                  Title.Alignment = taCenter
                  Title.Caption = 'Data'
                  Width = 67
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'nome'
                  Title.Alignment = taCenter
                  Title.Caption = 'Nome'
                  Width = 200
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'valorprazo'
                  Visible = True
                end>
            end
          end
        end
      end
      object tstInterlojas: TTabSheet
        Caption = 'tstInterlojas'
        ImageIndex = 1
      end
      object tstListasPadrao: TTabSheet
        Caption = 'tstListasPadrao'
        ImageIndex = 3
      end
      object tstNFEntrada: TTabSheet
        Caption = 'tstNFEntrada'
        ImageIndex = 4
        object pgcNFEntrada: TPageControl
          Left = 0
          Top = 0
          Width = 230
          Height = 259
          ActivePage = tstParametrosNfEntrada
          Align = alClient
          TabOrder = 0
          OnChange = pgcNFEntradaChange
          object tstParametrosNfEntrada: TTabSheet
            Caption = 'Par'#226'metros'
            object StaticText6: TStaticText
              Left = 0
              Top = 38
              Width = 97
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = 'Data Inicial'
              Constraints.MaxHeight = 17
              Constraints.MaxWidth = 97
              Constraints.MinHeight = 17
              Constraints.MinWidth = 97
              TabOrder = 5
            end
            object edtDataInicialNFe: TEditData
              Left = 0
              Top = 54
              Width = 97
              Height = 23
              AutoSize = False
              Constraints.MaxHeight = 23
              Constraints.MinHeight = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnKeyDown = edtDataInicialNFeKeyDown
              Minimo = 37353
              Maximo = 0
            end
            object StaticText7: TStaticText
              Left = 96
              Top = 38
              Width = 97
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = 'Data Final'
              Constraints.MaxHeight = 17
              Constraints.MaxWidth = 97
              Constraints.MinHeight = 17
              Constraints.MinWidth = 97
              TabOrder = 6
            end
            object edtDataFinalNFe: TEditData
              Left = 96
              Top = 54
              Width = 97
              Height = 23
              AutoSize = False
              Constraints.MaxHeight = 23
              Constraints.MinHeight = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnKeyDown = edtDataFinalNFeKeyDown
              Minimo = 37353
              Maximo = 0
            end
            object StaticText8: TStaticText
              Left = 0
              Top = 0
              Width = 222
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = 'Nota Fiscal Eletronica de ENTRADA'
              Constraints.MaxHeight = 17
              Constraints.MaxWidth = 222
              Constraints.MinHeight = 17
              Constraints.MinWidth = 222
              TabOrder = 7
            end
            object edfchv_nfeEntrada: TtecDbEditFind
              Left = 0
              Top = 16
              Width = 221
              Height = 23
              Alignment = taLeftJustify
              AutoSize = False
              Constraints.MaxHeight = 23
              Constraints.MinHeight = 23
              DataField = 'chv_nfe'
              DataSource = dsrProcuraNFeEntrada
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -8
              Font.Name = 'Helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              Group = 'chavenfeEntrada'
              Maximo = 0
              Minimo = 37353
              Adicional = 0
              Opcional = True
              OnFound = edfchv_nfeEntradaFound
              OnKeyDown = edfchv_nfeEntradaKeyDown
              ParentFont = False
              TabOrder = 0
              PermitirZero = False
              PermitirNulo = False
              Operacao = opATRIBUICAO
              Parameter = 'chv_Nfe'
              ActiveSetControls = False
              DenyInsert = True
              NoSetControls = <>
              SetControls = <>
            end
            object StaticText9: TStaticText
              Left = 0
              Top = 76
              Width = 80
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = 'Nr. Nota'
              Constraints.MaxHeight = 17
              Constraints.MaxWidth = 80
              Constraints.MinHeight = 17
              Constraints.MinWidth = 80
              TabOrder = 8
            end
            object edfNFEntrada: TtecDbEditFind
              Left = 0
              Top = 92
              Width = 80
              Height = 23
              Alignment = taLeftJustify
              AutoSize = False
              Constraints.MaxHeight = 23
              Constraints.MinHeight = 23
              DataField = 'numero'
              DataSource = dsrProcuraNFEntrada
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Pitch = fpVariable
              Font.Style = []
              Group = 'NFEntrada'
              MaxLength = 20
              Maximo = 0
              Minimo = 37353
              Adicional = 0
              Opcional = True
              OnFound = edfNFEntradaFound
              OnKeyDown = edfNFEntradaKeyDown
              ParentFont = False
              TabOrder = 3
              PermitirZero = False
              PermitirNulo = False
              Operacao = opATRIBUICAO
              Parameter = 'numero'
              ActiveSetControls = False
              DenyInsert = True
              NoSetControls = <>
              SetControls = <>
            end
            object StaticText10: TStaticText
              Left = 0
              Top = 114
              Width = 222
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = 'Nome'
              Constraints.MaxHeight = 17
              Constraints.MaxWidth = 222
              Constraints.MinHeight = 17
              Constraints.MinWidth = 222
              TabOrder = 9
            end
            object edtNomeNFEntrada: TEditTexto
              Left = 0
              Top = 130
              Width = 222
              Height = 23
              AutoSize = False
              Constraints.MaxHeight = 23
              Constraints.MaxWidth = 222
              Constraints.MinHeight = 23
              Constraints.MinWidth = 222
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
              TabOrder = 4
              OnKeyDown = edtNomeNFEntradaKeyDown
              CharCasenoDefault = False
              Alignment = taLeftJustify
            end
          end
          object tstSelecaoNFEntrada: TTabSheet
            Caption = 'Sele'#231#227'o'
            ImageIndex = 1
            object dbgNFEntrada: TtecDBGrid
              Left = 0
              Top = 0
              Width = 222
              Height = 231
              Align = alClient
              DataSource = dsrNotasPag
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Pitch = fpVariable
              TitleFont.Style = []
              OnKeyDown = dbgContratoKeyDown
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
              DefaultRowHeight = 16
              ExibirNumerodaLinha = False
              NaoAtribuirDadosaTabelaaoDigitar = False
              ShowWhenFieldInvisible = False
              CanClickWhenEditing = False
              Columns = <
                item
                  Expanded = False
                  FieldName = 'fornecedor'
                  Title.Caption = 'Fornec.'
                  Width = 38
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'serie'
                  Title.Alignment = taCenter
                  Title.Caption = 'S'#233'rie'
                  Width = 29
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'numero'
                  Title.Alignment = taCenter
                  Title.Caption = 'N'#250'mero'
                  Width = 47
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'data'
                  Title.Alignment = taCenter
                  Title.Caption = 'Data'
                  Width = 59
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'nome'
                  Title.Alignment = taCenter
                  Title.Caption = 'Nome'
                  Width = 200
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'valornota'
                  Visible = True
                end>
            end
          end
        end
      end
      object tstNFSaida: TTabSheet
        Caption = 'tstNFSaida'
        ImageIndex = 2
        object pgcNFSaida: TPageControl
          Left = 0
          Top = 0
          Width = 230
          Height = 259
          ActivePage = tstParametrosNfsAIDA
          Align = alClient
          TabOrder = 0
          OnChange = pgcNFSaidaChange
          object tstParametrosNfsAIDA: TTabSheet
            Caption = 'Par'#226'metros'
            object StaticText1: TStaticText
              Left = 0
              Top = 38
              Width = 97
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = 'Data Inicial'
              Constraints.MaxHeight = 17
              Constraints.MaxWidth = 97
              Constraints.MinHeight = 17
              Constraints.MinWidth = 97
              TabOrder = 5
            end
            object edtDataInicial: TEditData
              Left = 0
              Top = 54
              Width = 97
              Height = 23
              AutoSize = False
              Constraints.MaxHeight = 23
              Constraints.MinHeight = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnKeyDown = edtDataInicialKeyDown
              Minimo = 37353
              Maximo = 0
            end
            object StaticText2: TStaticText
              Left = 96
              Top = 38
              Width = 97
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = 'Data Final'
              Constraints.MaxHeight = 17
              Constraints.MaxWidth = 97
              Constraints.MinHeight = 17
              Constraints.MinWidth = 97
              TabOrder = 6
            end
            object edtDataFinal: TEditData
              Left = 96
              Top = 54
              Width = 97
              Height = 23
              AutoSize = False
              Constraints.MaxHeight = 23
              Constraints.MinHeight = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnKeyDown = edtDataFinalKeyDown
              Minimo = 37353
              Maximo = 0
            end
            object StaticText3: TStaticText
              Left = 0
              Top = 0
              Width = 222
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = 'Nota Fiscal Eletronica de SA'#205'DA'
              Constraints.MaxHeight = 17
              Constraints.MaxWidth = 222
              Constraints.MinHeight = 17
              Constraints.MinWidth = 222
              TabOrder = 7
            end
            object edfchv_nfesaida: TtecDbEditFind
              Left = 0
              Top = 16
              Width = 220
              Height = 23
              Alignment = taLeftJustify
              AutoSize = False
              Constraints.MaxHeight = 23
              Constraints.MinHeight = 23
              DataField = 'chv_nfe'
              DataSource = dsrProcuraNFeSaida
              EditMask = '99\-9999\-99999999999999\-99\-999\-999999999\-9\-99999999\-9;0;_'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -8
              Font.Name = 'Arial'
              Font.Pitch = fpVariable
              Font.Style = []
              Group = 'chavenfesaida'
              MaxLength = 52
              Maximo = 0
              Minimo = 37353
              Adicional = 0
              Opcional = True
              OnFound = edfchv_nfesaidaFound
              OnKeyDown = edfchv_nfesaidaKeyDown
              ParentFont = False
              TabOrder = 0
              PermitirZero = False
              PermitirNulo = False
              Operacao = opATRIBUICAO
              Parameter = 'chv_Nfe'
              ActiveSetControls = False
              DenyInsert = True
              NoSetControls = <>
              SetControls = <>
            end
            object StaticText4: TStaticText
              Left = 0
              Top = 76
              Width = 80
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = 'Nr. Nota'
              Constraints.MaxHeight = 17
              Constraints.MaxWidth = 80
              Constraints.MinHeight = 17
              Constraints.MinWidth = 80
              TabOrder = 8
            end
            object edfNFSaida: TtecDbEditFind
              Left = 0
              Top = 92
              Width = 80
              Height = 23
              Alignment = taLeftJustify
              AutoSize = False
              Constraints.MaxHeight = 23
              Constraints.MinHeight = 23
              DataField = 'numero'
              DataSource = dsrProcuraNFSaida
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Pitch = fpVariable
              Font.Style = []
              Group = 'NFSaida'
              MaxLength = 20
              Maximo = 0
              Minimo = 37353
              Adicional = 0
              Opcional = True
              OnFound = edfNFSaidaFound
              OnKeyDown = edfNFSaidaKeyDown
              ParentFont = False
              TabOrder = 3
              PermitirZero = False
              PermitirNulo = False
              Operacao = opATRIBUICAO
              Parameter = 'numero'
              ActiveSetControls = False
              DenyInsert = True
              NoSetControls = <>
              SetControls = <>
            end
            object StaticText5: TStaticText
              Left = 0
              Top = 114
              Width = 222
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = 'Nome'
              Constraints.MaxHeight = 17
              Constraints.MaxWidth = 222
              Constraints.MinHeight = 17
              Constraints.MinWidth = 222
              TabOrder = 9
            end
            object edtNomeNFSaida: TEditTexto
              Left = 0
              Top = 130
              Width = 222
              Height = 23
              AutoSize = False
              Constraints.MaxHeight = 23
              Constraints.MaxWidth = 222
              Constraints.MinHeight = 23
              Constraints.MinWidth = 222
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
              TabOrder = 4
              OnKeyDown = edtNomeNFSaidaKeyDown
              CharCasenoDefault = False
              Alignment = taLeftJustify
            end
          end
          object tstSelecaoNFSaida: TTabSheet
            Caption = 'Sele'#231#227'o'
            ImageIndex = 1
            object dbgNFSaida: TtecDBGrid
              Left = 0
              Top = 0
              Width = 222
              Height = 231
              Align = alClient
              DataSource = dsrDadosFiscais
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Pitch = fpVariable
              TitleFont.Style = []
              OnKeyDown = dbgContratoKeyDown
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
              DefaultRowHeight = 16
              ExibirNumerodaLinha = False
              NaoAtribuirDadosaTabelaaoDigitar = False
              ShowWhenFieldInvisible = False
              CanClickWhenEditing = False
              Columns = <
                item
                  Expanded = False
                  FieldName = 'filial'
                  Title.Caption = 'Filial'
                  Width = 27
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'serie'
                  Title.Alignment = taCenter
                  Title.Caption = 'S'#233'rie'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'numero'
                  Title.Alignment = taCenter
                  Title.Caption = 'N'#250'mero'
                  Width = 47
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'data'
                  Title.Alignment = taCenter
                  Title.Caption = 'Data'
                  Width = 68
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'nome'
                  Title.Alignment = taCenter
                  Title.Caption = 'Nome'
                  Width = 200
                  Visible = True
                end>
            end
          end
        end
      end
    end
    object pnlBottomOperacaoes: TPanel
      Left = 1
      Top = 288
      Width = 238
      Height = 31
      Align = alBottom
      TabOrder = 1
      object sbnGerar: TBitBtn
        Left = 1
        Top = 1
        Width = 236
        Height = 31
        Hint = 'Gerar as quantidades dos produtos'
        Caption = 'Gerar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = sbnGerarClick
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
        NumGlyphs = 2
      end
      object sbnConferir: TBitBtn
        Left = 0
        Top = 1
        Width = 237
        Height = 31
        Hint = 'Conferir as quantidades dos produtos'
        Caption = 'Conferir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = sbnConferirClick
        OnKeyDown = sbnConferirKeyDown
        Glyph.Data = {
          AE060000424DAE06000000000000360000002800000017000000170000000100
          1800000000007806000000000000000000000000000000000000A5A5A5040404
          1313131313131313131313131313131313131313131313131313131313131313
          13131313131313131313131313131313131313131313131313080808A8A8A800
          00001C1C1CD0D0D0ADADADAFAFAFAFAFAFAFAFAFAFAFAFB0B0B0B0B0B0AFAFAF
          AFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFB1B1
          B1ABABAB080808000000373737F5F5F5BFBFBFC2C2C2C2C2C2C3C3C3C2C2C2BF
          BFBFC2C2C2C4C4C4C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2
          C2C2C2C2C2C2C6C6C6B1B1B1141414000000353535F0F0F0BBBBBBBFBFBFBFBF
          BFCBC0CB958B95767376868686BEBEBEC0C0C0BFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFC2C2C2AFAFAF141414000000353535F0F0F0
          BBBBBBC1BEC1E1C9E1248824147A147F7F7F807B80848484C7C7C7C0C0C0BFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFC2C2C2AFAFAF14141400
          0000353535F0F0F0BFBABFC4CBC41C931C007900007E00007F007C7F7C817B81
          828282BFBFBFC0C0C0BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFC2C2
          C2AFAFAF141414000000353535F2F0F2BCBEBC23DD23008D00007C00007F0000
          7F00077F07767F76807B80878787C0C0C0C0C0C0BFBFBFBFBFBFBFBFBFBFBFBF
          BFBFBFBFBFBFC2C2C2AFAFAF141414000000353535F3EFF3B3C4B300D4000073
          00007F00007F00007F00007F00007F00847F84807B80828282C4C4C4BFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFC2C2C2AFAFAF141414000000353535F3EFF3
          B5C4B500D500007500007F00007F00007F00007F00007F00007F00767F767F7A
          7F8F8F8FC6C6C6BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFC2C2C2AFAFAF14141400
          0000353535F3EFF3B5C4B500D500007500007F00007F00007500007400007D00
          007F00067F06757E75838183B6B6B6C1C1C1BFBFBFBFBFBFBFBFBFBFBFBFC2C2
          C2AFAFAF141414000000353535F3EFF3B3C4B300D400007300007F0000750011
          E71100E900007800007D00007F00587F58887D88757575C1C1C1BFBFBFBFBFBF
          BFBFBFBFBFBFC2C2C2AFAFAF141414000000353535F2F0F2BDBEBD28DE280087
          00007200007D007D737D1EE91E00E500007000007E00007F005E7F5E847A84A3
          A3A3C6C6C6BFBFBFBFBFBFBFBFBFC2C2C2AFAFAF141414000000353535F0F0F0
          BFBABFC7C1C724E92400D8000070006E766E9D8D9D30FF3000DD00007000007D
          00007F005E7E5E7F7A7FA4A4A4C5C5C5BFBFBFBFBFBFC2C2C2AFAFAF14141400
          0000353535F0F0F0BBBBBBC1BEC1E1B5E122FF2200DF007D8E7DA7A0A7E3B7E3
          2AFB2A00E300007800007D00337F338A7E8A7776779F9F9FC2C2C2BFBFBFC2C2
          C2AFAFAF141414000000353535F0F0F0BBBBBBBFBFBFC1BEC1BEBFBE6FDF6FBC
          C7BCC3C1C3C0BEC0C8BBC82DFA2D00E300006900007D00377F378E7E8E757575
          CCCCCCBFBFBFC2C2C2AFAFAF141414000000353535F0F0F0BBBBBBBFBFBFBFBF
          BFC1BEC1C7BCC7C0BEC0BFBFBFBFBFBFC2BDC2D1B8D131F83100E10000770000
          7D003F7E3F857C858E8E8EC0C0C0C3C3C3AFAFAF141414000000353535F0F0F0
          BBBBBBBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFC0BEC0D5B7
          D52BFB2B00E200007200197E19807E80797779A7A7A7C6C6C6AFAFAF14141400
          0000353535F0F0F0BBBBBBBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBFBFBFBFBFC1BEC1C7BCC728FC2800DD00006D000A7D0A917D91818181C1C1
          C1B0B0B0141414000000353535F0F0F0BBBBBBBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFC1BEC1DFB3DF2DFA2D00E400007800
          1A7D1A857685C0C0C0B0B0B0141414000000353535F0F0F0BBBBBBBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFC0BEC0C9
          BBC92DF92D00E400036B03587358C3BFC3B0B0B0141414000000363636EFEFEF
          B8B8B8BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
          BBBBBBBBBBBBBBBEBABECAB6CA2AF62A00CF00719A71C7C1C7ADADAD14141400
          0000292929FFFFFFEFEFEFF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
          F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F2F0F2FFEBFFFFEFFFF9F4F9F6F6
          F6D0D0D004040400000080808029292935353535353535353535353535353535
          3535353535353535353535353535353535353535353535353535353535353535
          3535353535353737371B1B1BA5A5A5000000}
      end
    end
  end
  object qryProcuraContratos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select ct.*'
      'from contratos ct'
      'where ct.numero = :contrato'
      '  and ct.situacao not in ('#39'N'#39','#39'C'#39')')
    RequestLive = False
    Left = 524
    Top = 240
    ParamData = <
      item
        DataType = ftString
        Name = 'contrato'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryProcuraContratosnumero: TStringField
      FieldName = 'numero'
      Required = True
    end
  end
  object dsrProcuraContratos: TtecDataSource
    DataSet = qryProcuraContratos
    Left = 556
    Top = 240
  end
  object dsrContratos: TtecDataSource
    DataSet = qryContratos
    Left = 556
    Top = 208
  end
  object qryContratos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'CondicaoNumeroContrato'
        ParamType = ptUnknown
        Value = 'and false'
      end
      item
        DataType = ftString
        Name = 'CondicaoDataContrato'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CondicaoNomeContrato'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select ct.numero,'
      '       ct.data,'
      '       ct.nome,'
      '       ct.valorprazo,'
      '       ct.primogenito'
      '       '
      'from contratos ct'
      'where ct.situacao not in ('#39'N'#39','#39'C'#39')'
      ''
      '%CondicaoNumeroContrato'
      '%CondicaoDataContrato'
      '%CondicaoNomeContrato'
      ''
      ''
      'order by ct.nome')
    RequestLive = True
    Left = 524
    Top = 208
    object qryContratosnumero: TStringField
      FieldName = 'numero'
      Required = True
    end
    object qryContratosdata: TDateField
      FieldName = 'data'
      Required = True
      DisplayFormat = 'dd/mm/yy'
    end
    object qryContratosnome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object qryContratosvalorprazo: TFloatField
      FieldName = 'valorprazo'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryContratosprimogenito: TStringField
      FieldName = 'primogenito'
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 600
    Top = 32
  end
  object qryProdutosContratos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select pc.*,'
      '       p.codigovisual,'
      '       p.descricao as descricaoproduto,'
      '       p.valorgrade1,'
      '       p.valorgrade2,'
      
        '       (select g.descricao from grades g where g.codigo = c.grad' +
        'e1) as linha,'
      
        '       (select g.descricao from grades g where g.codigo = c.grad' +
        'e2) as coluna'
      'from produtoscontratos pc'
      '     join produtos p'
      '          join caracteristicas c'
      '          on p.caracteristica = c.codigo'
      '     on pc.produto = p.codigo'
      'where pc.contrato = :contrato'
      'order by pc.contrato')
    RequestLive = False
    Left = 525
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptUnknown
      end>
  end
  object qryProcuraNFSaida: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select n.*, df.*'
      ''
      'from dadosfiscais df'
      '     join notas n'
      '     on df.numero = n.dadofiscal'
      ''
      'where n.numero = :numero'
      '  and df.situacao in ('#39'N'#39')')
    RequestLive = True
    Left = 604
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end>
    object qryProcuraNFSaidanumero: TIntegerField
      FieldName = 'numero'
    end
  end
  object dsrProcuraNFSaida: TtecDataSource
    DataSet = qryProcuraNFSaida
    Left = 636
    Top = 248
  end
  object qryDadosFiscais: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'CondicaoIntervaloDataNFSaida'
        ParamType = ptUnknown
        Value = 'and false'
      end
      item
        DataType = ftString
        Name = 'CondicaoChv_NFeSaida'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CondicaoNumeroNFSaida'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CondicaoNomeNFSaida'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select n.*, df.*'
      ''
      'from dadosfiscais df'
      '     join notas n'
      '     on df.numero = n.dadofiscal'
      ''
      'where df.situacao in ('#39'N'#39')'
      ''
      '    %CondicaoIntervaloDataNFSaida'
      '    %CondicaoChv_NFeSaida'
      '    %CondicaoNumeroNFSaida'
      '    %CondicaoNomeNFSaida'
      ''
      'order by df.nome, n.numero')
    RequestLive = True
    Left = 604
    Top = 216
    object qryDadosFiscaisfilial: TIntegerField
      FieldName = 'filial'
      Required = True
    end
    object qryDadosFiscaisserie: TStringField
      FieldName = 'serie'
      Required = True
      Size = 3
    end
    object qryDadosFiscaisnumero: TIntegerField
      FieldName = 'numero'
      Required = True
    end
    object qryDadosFiscaisnumero_1: TIntegerField
      FieldName = 'numero_1'
      Required = True
    end
    object qryDadosFiscaisdata: TDateField
      FieldName = 'data'
      Required = True
      DisplayFormat = 'dd/mm/yy'
    end
    object qryDadosFiscaisnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryDadosFiscaisvalortotal: TFloatField
      FieldName = 'valortotal'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
  end
  object dsrDadosFiscais: TtecDataSource
    DataSet = qryDadosFiscais
    Left = 636
    Top = 216
  end
  object qryProdutosDadosFiscais: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select pdf.*,'
      '       p.codigovisual,'
      '       p.descricao as descricaoproduto,'
      '       p.valorgrade1,'
      '       p.valorgrade2,'
      
        '       (select g.descricao from grades g where g.codigo = c.grad' +
        'e1) as linha,'
      
        '       (select g.descricao from grades g where g.codigo = c.grad' +
        'e2) as coluna'
      'from produtosdadosfiscais pdf'
      '     join produtos p'
      '          join caracteristicas c'
      '          on p.caracteristica = c.codigo'
      '     on pdf.produto = p.codigo'
      'where pdf.dadofiscal = :dadofiscal'
      'order by pdf.numero')
    RequestLive = False
    Left = 605
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dadofiscal'
        ParamType = ptUnknown
      end>
  end
  object qryProcuraNFeSaida: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select n.*, df.*'
      ''
      'from dadosfiscais df'
      '     join notas n'
      '     on df.numero = n.dadofiscal'
      ''
      'where df.chv_nfe = :chv_Nfe'
      '  and df.situacao in ('#39'N'#39')')
    RequestLive = True
    Left = 604
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'chv_Nfe'
        ParamType = ptUnknown
      end>
    object qryProcuraNFeSaidachv_nfe: TStringField
      FieldName = 'chv_nfe'
      Size = 44
    end
  end
  object dsrProcuraNFeSaida: TtecDataSource
    DataSet = qryProcuraNFeSaida
    Left = 636
    Top = 280
  end
  object qryProcuraNFeEntrada: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select np.*'
      ''
      'from notaspag np'
      ''
      'where np.chv_nfe = :chv_Nfe'
      '  and np.situacao in ('#39'N'#39')')
    RequestLive = True
    Left = 684
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'chv_Nfe'
        ParamType = ptUnknown
      end>
    object qryProcuraNFeEntradachv_nfe: TStringField
      FieldName = 'chv_nfe'
      EditMask = '99\-9999\-99999999999999\-99\-999\-999999999\-9\-99999999\-9;0;_'
      Size = 44
    end
  end
  object dsrProcuraNFeEntrada: TtecDataSource
    DataSet = qryProcuraNFeEntrada
    Left = 716
    Top = 280
  end
  object qryProcuraNFEntrada: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select np.*'
      ''
      'from notaspag np'
      ''
      'where np.numero = :numero'
      '  and np.situacao in ('#39'N'#39')')
    RequestLive = True
    Left = 684
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end>
    object qryProcuraNFEntradanumero: TIntegerField
      FieldName = 'numero'
    end
  end
  object dsrProcuraNFEntrada: TtecDataSource
    DataSet = qryProcuraNFEntrada
    Left = 716
    Top = 248
  end
  object qryNotasPag: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'CondicaoIntervaloDataNFEntrada'
        ParamType = ptUnknown
        Value = 'and false'
      end
      item
        DataType = ftUnknown
        Name = 'CondicaoChv_NFeEntrada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CondicaoNumeroNFEntrada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CondicaoNomeNFEntrada'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select np.*'
      ''
      'from notaspag np'
      ''
      'where np.situacao in ('#39'N'#39')'
      ''
      '    %CondicaoIntervaloDataNFEntrada'
      '    %CondicaoChv_NFeEntrada'
      '    %CondicaoNumeroNFEntrada'
      '    %CondicaoNomeNFEntrada'
      ''
      'order by np.numero')
    RequestLive = True
    Left = 684
    Top = 216
    object qryNotasPagcodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryNotasPagfornecedor: TIntegerField
      FieldName = 'fornecedor'
      Required = True
    end
    object qryNotasPagserie: TStringField
      FieldName = 'serie'
      Required = True
      Size = 3
    end
    object qryNotasPagnumero: TIntegerField
      FieldName = 'numero'
      Required = True
    end
    object qryNotasPagdata: TDateField
      FieldName = 'data'
      Required = True
      DisplayFormat = 'dd/mm/yy'
    end
    object qryNotasPagnome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object qryNotasPagvalornota: TFloatField
      FieldName = 'valornota'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object dsrNotasPag: TtecDataSource
    DataSet = qryNotasPag
    Left = 716
    Top = 216
  end
  object qryProdutosNotasPag: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select pnp.*,'
      '       p.codigovisual,'
      '       p.descricao as descricaoproduto,'
      '       p.valorgrade1,'
      '       p.valorgrade2,'
      
        '       (select g.descricao from grades g where g.codigo = c.grad' +
        'e1) as linha,'
      
        '       (select g.descricao from grades g where g.codigo = c.grad' +
        'e2) as coluna'
      ''
      'from produtosnotaspag pnp'
      '     join produtos p'
      '          join caracteristicas c'
      '          on p.caracteristica = c.codigo'
      '     on pnp.produto = p.codigo'
      ''
      'where pnp.codigonota = :codigonota'
      'order by pnp.numero')
    RequestLive = False
    Left = 685
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigonota'
        ParamType = ptUnknown
      end>
  end
end
