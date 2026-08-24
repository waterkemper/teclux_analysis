inherited frmCadastroFluxoGramas: TfrmCadastroFluxoGramas
  Left = 701
  Top = 293
  ActiveControl = dbgOperacoes
  Caption = 'Cadastro de Fluxogramas'
  ClientHeight = 519
  ClientWidth = 1000
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 0
    Top = 45
    Width = 1000
    Height = 474
    Align = alClient
    BevelOuter = bvNone
    Visible = True
    inherited bvlBotoesEd: TBevel
      Left = 0
      Top = 474
      Width = 1000
      Height = 0
      Align = alBottom
      Visible = False
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 1000
      Height = 474
      ActivePage = tstCadastro
      Align = alClient
      TabOrder = 0
      object tstCadastro: TTabSheet
        Caption = ' Cadastro'
        object gbxCodigoFluxograma: TGroupBox
          Left = 3
          Top = 4
          Width = 62
          Height = 36
          Caption = ' C'#211'DIGO '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object gbxNomeFluxograma: TGroupBox
          Left = 71
          Top = 4
          Width = 386
          Height = 36
          Caption = ' DESCRI'#199#195'O DA FAM'#205'LIA '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object edtDescricao: TDBEditTexto
            Left = 2
            Top = 11
            Width = 381
            Height = 23
            DataField = 'descricao'
            DataSource = dtmCadastroFluxoGramas.dsrFluxoGramas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
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
        object gbxOperacoes: TGroupBox
          Left = 0
          Top = 45
          Width = 993
          Height = 348
          Caption = ' OPERA'#199#213'ES '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          object Bevel1: TBevel
            Left = 2
            Top = 16
            Width = 989
            Height = 0
            Align = alTop
            Shape = bsSpacer
          end
          object dbgOperacoes: TtecDBGrid
            Left = 2
            Top = 16
            Width = 957
            Height = 330
            Align = alClient
            DataSource = dtmCadastroFluxoGramas.dsrFluxoGramasOperacoes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -13
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = []
            OnDblClick = dbgOperacoesDblClick
            OnKeyDown = dbgOperacoesKeyDown
            RowWrap = 60
            Large = False
            DoubleRowColor = False
            TitleMinHeight = 100
            CellHeights = 100
            StrippedColor = 16054260
            CanDelete = True
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
                FieldName = 'sequencia'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = 'SEQU'#202'NCIA'
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
                FieldName = 'nome'
                Title.Alignment = taCenter
                Title.Caption = 'OPERA'#199#195'O'
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
                FieldName = 'c01'
                Title.Alignment = taCenter
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
                FieldName = 'tipo'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = 'TIPO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'custo'
                Title.Alignment = taCenter
                Title.Caption = 'CUSTO'
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
                FieldName = 'descricao'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = 'DESCRI'#199#195'O'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 454
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'percentualoperador'
                Title.Alignment = taCenter
                Title.Caption = '% OPERADOR'
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
          object pnlOperacoes: TPanel
            Left = 959
            Top = 16
            Width = 32
            Height = 330
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            object sbnIncluirOperacao: TSpeedButton
              Left = 2
              Top = 39
              Width = 23
              Height = 26
              Hint = 'Incluir opera'#231#227'o'
              Flat = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDC7F7F7F7F7F7F7F7F7F8080808080807F7F7F7F7F7F7F7F7F7F7F
                7F808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC0000000000000000000000000000000000000000000000000000000000
                00808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7F7F
                7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                00808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDCDCDCDCFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
                00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDC7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDC7F7F7FFFFFFFDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDC7F7F7FFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFFFFFFFFF
                FFFF7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000000000000000000000000000000000DCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7F7F
                7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
              Layout = blGlyphTop
              NumGlyphs = 2
              OnClick = sbnIncluirOperacaoClick
            end
            object sbnIncluirAlternativa: TSpeedButton
              Left = 4
              Top = 79
              Width = 23
              Height = 42
              Hint = 'Incluir opera'#231#227'o alternativa'
              Caption = 'A'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = [fsBold]
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDC7F7F7F7F7F7F7F7F7F8080808080807F7F7F7F7F7F7F7F7F7F7F
                7F808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC0000000000000000000000000000000000000000000000000000000000
                00808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7F7F
                7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                00808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDCDCDCDCFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
                00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDC7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDC7F7F7FFFFFFFDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDC7F7F7FFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFFFFFFFFF
                FFFF7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000000000000000000000000000000000DCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7F7F
                7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
              Layout = blGlyphTop
              ParentFont = False
              OnClick = sbnIncluirAlternativaClick
            end
          end
        end
        object edfCodigo: TtecDBFindLookup
          Left = 6
          Top = 14
          Width = 57
          Height = 23
          Alignment = taLeftJustify
          DataField = 'codigo'
          DataSource = dtmCadastroFluxoGramas.dsrFluxoGramas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Group = 'Fluxograma'
          MaxLength = 3
          Maximo = 0
          Minimo = 37353
          Adicional = 0
          Opcional = True
          ParentFont = False
          TabOrder = 4
          PermitirZero = False
          PermitirNulo = False
          Operacao = opPESQUISA
          Parameter = 'codigo'
          ActiveSetControls = True
          DenyInsert = True
          NoSetControls = <>
          SetControls = <>
        end
        object ckbNaoControlaQuantidadeAnterior: TDBCheckBox
          Left = 8
          Top = 398
          Width = 260
          Height = 17
          Caption = 'Opera'#231#227'o em [G]rupo com a anterior'
          DataField = 'OperacaoemGrupoComAnterior'
          DataSource = dtmCadastroFluxoGramas.dsrFluxoGramasOperacoes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object ckbInformarTerminodoProcesso: TDBCheckBox
          Left = 8
          Top = 431
          Width = 260
          Height = 17
          Caption = 'Pode-se informar o [T]'#233'rmino da opera'#231#227'o'
          DataField = 'InformarTerminodoProcesso'
          DataSource = dtmCadastroFluxoGramas.dsrFluxoGramasOperacoes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object ckbOperacaoConjugada: TDBCheckBox
          Left = 8
          Top = 414
          Width = 260
          Height = 17
          Caption = 'Opera'#231#227'o [C]onjugada com a anterior'
          DataField = 'operacaoconjugada'
          DataSource = dtmCadastroFluxoGramas.dsrFluxoGramasOperacoes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object gbxtitulocusto: TGroupBox
          Left = 463
          Top = 4
          Width = 386
          Height = 36
          Caption = ' T'#205'TULO DO FLUXOGRAMA NA PLANILHA DE CUSTOS '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object edttitulocusto: TDBEditTexto
            Left = 2
            Top = 11
            Width = 381
            Height = 23
            DataField = 'titulocusto'
            DataSource = dtmCadastroFluxoGramas.dsrFluxoGramas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
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
        object gbxCorFluxoGrama: TGroupBox
          Left = 855
          Top = 4
          Width = 130
          Height = 36
          Caption = 'COR NO FLUXOGRAMA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
      end
      object tstLog: TTabSheet
        Caption = ' Log das Opera'#231#245'es'
        ImageIndex = 1
        inline fraRegistroOperacoes1: TfraRegistroOperacoes
          Left = 0
          Top = 0
          Width = 992
          Height = 119
          Align = alTop
          TabOrder = 0
          inherited gbxRegistrodasOperacoes: TGroupBox
            Width = 992
            Height = 119
            Font.Pitch = fpVariable
            inherited gbxRegistroInclusao: TGroupBox
              Width = 191
              Height = 101
              Align = alLeft
              Font.Pitch = fpVariable
              inherited sttDataInclusao: TStaticText
                Width = 187
                Font.Pitch = fpVariable
              end
              inherited sttUsuarioInclusao: TStaticText
                Width = 187
                Font.Pitch = fpVariable
              end
              inherited dtxDataInclusao: TtecDBText
                Font.Pitch = fpVariable
              end
              inherited dtxUsuarioInclusao: TtecDBText
                Font.Pitch = fpVariable
              end
            end
            inherited gbxRegistroAlteracao: TGroupBox
              Left = 193
              Top = 16
              Align = alLeft
              Font.Pitch = fpVariable
              inherited sttDataAlteracao: TStaticText
                Font.Pitch = fpVariable
              end
              inherited dtxDataAlteracao: TtecDBText
                Font.Pitch = fpVariable
              end
              inherited sttUsuarioAlteracao: TStaticText
                Font.Pitch = fpVariable
              end
              inherited dtxUsuarioAlteracao: TtecDBText
                Font.Pitch = fpVariable
              end
              inherited sttOperacao: TStaticText
                Font.Pitch = fpVariable
              end
              inherited dtxOperacao: TtecDBText
                Font.Pitch = fpVariable
              end
              inherited sttTabela: TStaticText
                Font.Pitch = fpVariable
              end
              inherited dtxTabela: TtecDBText
                Font.Pitch = fpVariable
              end
            end
          end
          inherited dsrRegistrodasOperacaoes: TtecDataSource
            DataSet = dtmCadastroFluxoGramas.qryRegistrodasOperacoes
          end
        end
      end
    end
    object ColorBox1: TColorBox
      Left = 864
      Top = 40
      Width = 121
      Height = 22
      DefaultColorColor = clNone
      NoneColorColor = clNone
      Selected = clNone
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor]
      ItemHeight = 16
      TabOrder = 1
      OnSelect = ColorBox1Select
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 1000
    inherited tblBarra: TToolBar
      Width = 775
      inherited sbnAjuda: TSpeedButton
        Action = Action1
      end
      object sbnImprimir: TSpeedButton
        Left = 84
        Top = 2
        Width = 75
        Height = 39
        Hint = 'Visualizar como o relat'#243'rio ser'#225' impresso'
        Caption = 'Imprimir F7'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
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
  end
  object actLiberarBotoes: TActionList
    Left = 520
    Top = 8
    object Action1: TAction
      Caption = 'Action1'
      OnUpdate = Action1Update
    end
  end
end
