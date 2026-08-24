inherited frmecf: Tfrmecf
  Left = 462
  Top = 168
  ActiveControl = DBTabControlP030
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  Caption = 'ecf - Escritura'#231#227'o Cont'#225'bil Fiscal'
  ClientHeight = 689
  ClientWidth = 1064
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 0
    Top = 689
    Width = 1064
    Height = 0
    Align = alBottom
    BevelOuter = bvNone
    Visible = True
    inherited bvlBotoesEd: TBevel
      Left = 0
      Top = 0
      Width = 1064
      Height = 0
      Align = alTop
      Visible = False
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 1064
    inherited tblBarra: TToolBar
      Left = 297
      Width = 767
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
  object pnlTop: TPanel
    Left = 0
    Top = 45
    Width = 1064
    Height = 43
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object gbxExercicio: TGroupBox
      Left = 6
      Top = 6
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
      object edtExercicio: TtecDbEditFind
        Left = 2
        Top = 10
        Width = 63
        Height = 23
        Alignment = taCenter
        DataField = 'exercicio'
        DataSource = dtmecf.dsrecf
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
        ParentFont = False
        TabOrder = 0
        PermitirZero = False
        PermitirNulo = False
        Operacao = opPESQUISA
        Parameter = 'exercicio'
        ActiveSetControls = True
        DenyInsert = False
        NoSetControls = <
          item
            Control = gbxExercicio
          end
          item
            Control = gbxFilial
          end>
        SetControls = <
          item
            Control = gbxArquivo
          end
          item
            Control = pgcECF
          end>
      end
    end
    object gbxArquivo: TGroupBox
      Left = 456
      Top = 6
      Width = 503
      Height = 36
      Caption = ' NOME DO ARQUIVO '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object dtxArquivo: TtecDBText
        Left = 2
        Top = 10
        Width = 498
        Height = 23
        TabStop = False
        Color = clBtnFace
        DataField = 'nomearquivo'
        DataSource = dtmecf.dsrecf
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
      Left = 78
      Top = 6
      Width = 375
      Height = 36
      Caption = ' FILIAL '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      inline fraConsultaFilial: TfraConsultaCodigo
        Left = 2
        Top = 10
        Width = 371
        Height = 24
        HorzScrollBar.Range = 456
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
        inherited sbnProcura: TSpeedButton
          Left = 32
        end
        inherited dtxDescricao: TtecDBText
          Left = 56
          Width = 314
          DataField = 'nome'
          DataSource = fraConsultaFilial.dsrProcuraFiliais
        end
        inherited edfCodigo: TtecDBFindLookup
          Width = 32
          DataField = 'filial'
          DataSource = dtmecf.dsrecf
          Group = 'periodo'
          MaxLength = 3
          OnFound = nil
          LookupField = 'codigo'
          LookupSource = fraConsultaFilial.dsrProcuraFiliais
          LookupQueryParameter = 'codigo'
          Parameter = 'filial'
          LookupParameter = 'codigo'
        end
      end
    end
  end
  object pgcECF: TtecPageControl
    Left = 0
    Top = 88
    Width = 1064
    Height = 601
    ActivePage = tstLucroPresumido
    Align = alClient
    TabOrder = 3
    OnChange = pgcECFChange
    object tstECF: TTabSheet
      Caption = 'Detalhes da ECF'
      object GroupBox1: TGroupBox
        Left = 0
        Top = 90
        Width = 267
        Height = 36
        Caption = ' RECIBO ANTERIOR '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object edtnum_rec: TDBEditTexto
          Left = 2
          Top = 10
          Width = 263
          Height = 23
          DataField = 'num_rec'
          DataSource = dtmecf.dsrecf
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
      object tecfBRadioGroup1: TtecDBRadioGroup
        Left = 0
        Top = 6
        Width = 267
        Height = 79
        Caption = ' FINALIDADE DA ESCRITURA'#199#195'O '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        TabStop = False
        DataField = 'retificadora'
        DataSource = dtmecf.dsrecf
        object lblTributacao: TLabel
          Left = 42
          Top = 61
          Width = 54
          Height = 15
          Caption = 'tributa'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object tecRadioButton5: TtecRadioButton
          Left = 6
          Top = 12
          Width = 193
          Height = 17
          Caption = 'S - ECF retificadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Value = 'S'
        end
        object tecRadioButton6: TtecRadioButton
          Left = 6
          Top = 28
          Width = 193
          Height = 17
          Caption = 'N - ECF original'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Value = 'N'
        end
        object tecRadioButton7: TtecRadioButton
          Left = 6
          Top = 45
          Width = 254
          Height = 17
          Caption = 'F - ECF original com mudan'#231'a de forma de'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Value = 'F'
        end
      end
      object rbnSituacao: TtecDBRadioGroup
        Left = 277
        Top = 7
        Width = 258
        Height = 202
        Caption = ' INDICADOR DE SITUA'#199#195'O ESPECIAL '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        TabStop = False
        DataField = 'sit_especial'
        DataSource = dtmecf.dsrecf
        object rbnCISAO: TtecRadioButton
          Left = 8
          Top = 17
          Width = 240
          Height = 17
          Hint = 'Sem ocorr'#234'ncia de situa'#231#227'o especial ou evento'
          Caption = '0 - Normal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Value = '0'
        end
        object rbnFUSAO: TtecRadioButton
          Left = 8
          Top = 52
          Width = 240
          Height = 17
          Caption = '2 - Fus'#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Value = '2'
        end
        object rbnINCORPORACAO: TtecRadioButton
          Left = 8
          Top = 70
          Width = 240
          Height = 17
          Caption = '3 - Incorpora'#231#227'o / incorporada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Value = '3'
        end
        object rbnEXTINSAO: TtecRadioButton
          Left = 8
          Top = 34
          Width = 240
          Height = 17
          Caption = '1 - Extin'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Value = '1'
        end
        object rbnNormal: TtecRadioButton
          Left = 8
          Top = 158
          Width = 240
          Height = 17
          Caption = '8 - Desenquadramento de imune/isenta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          Value = '8'
        end
        object rbnTransformacao: TtecRadioButton
          Left = 8
          Top = 140
          Width = 240
          Height = 17
          Caption = '7 - Transforma'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          Value = '7'
        end
        object tecRadioButton12: TtecRadioButton
          Left = 8
          Top = 87
          Width = 240
          Height = 17
          Caption = '4 - Incorpora'#231#227'o / incorporadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          Value = '4'
        end
        object tecRadioButton13: TtecRadioButton
          Left = 8
          Top = 105
          Width = 240
          Height = 17
          Caption = '5 - Cis'#227'o total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          Value = '5'
        end
        object tecRadioButton14: TtecRadioButton
          Left = 8
          Top = 123
          Width = 240
          Height = 17
          Caption = '6 - Cis'#227'o parcial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          Value = '6'
        end
        object tecRadioButton15: TtecRadioButton
          Left = 8
          Top = 176
          Width = 240
          Height = 17
          Caption = '9 - Inclus'#227'o no Simples Nacional'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          Value = '9'
        end
      end
      object rgbtip_ecd: TtecDBRadioGroup
        Left = 1
        Top = 133
        Width = 266
        Height = 76
        Caption = ' TIPO DA ECF '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        TabStop = False
        DataField = 'tip_ecf'
        DataSource = dtmecf.dsrecf
        object rbnNaoparticipante_de_SCP_como_socio_ostensivo: TtecRadioButton
          Left = 6
          Top = 15
          Width = 245
          Height = 17
          Caption = '0 - N'#227'o participante SCP s'#243'cio ostensivo'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TabStop = True
          Value = '0'
        end
        object rbnECD_da_SCP: TtecRadioButton
          Left = 6
          Top = 54
          Width = 107
          Height = 17
          Caption = '2 - ECF da SCP'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Value = '2'
          ReadOnly = True
        end
        object rbnParticipante_de_SCP_como_socio_ostensivo: TtecRadioButton
          Left = 6
          Top = 35
          Width = 245
          Height = 17
          Caption = '1 - Participante SCP s'#243'cio ostensivo'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Value = '1'
          ReadOnly = True
        end
      end
      object rbnind_sit_ini_per: TtecDBRadioGroup
        Left = 0
        Top = 215
        Width = 535
        Height = 96
        Caption = ' INDICADOR DO IN'#205'CIO DO PER'#205'ODO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        TabStop = False
        DataField = 'ind_sit_ini_per'
        DataSource = dtmecf.dsrecf
        object tecRadioButton1: TtecRadioButton
          Left = 8
          Top = 17
          Width = 480
          Height = 17
          Caption = '0 - Normal (in'#237'cio no primeiro dia do ano)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Value = '0'
        end
        object tecRadioButton2: TtecRadioButton
          Left = 8
          Top = 31
          Width = 480
          Height = 17
          Caption = '1 - Abertura (in'#237'cio de atividades no ano-calend'#225'rio)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Value = '1'
        end
        object tecRadioButton3: TtecRadioButton
          Left = 8
          Top = 46
          Width = 480
          Height = 17
          Caption = 
            '2 - Resultante de cis'#227'o/fus'#227'o ou remanescente de cis'#227'o, ou reali' +
            'zou incorpora'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Value = '2'
        end
        object tecRadioButton4: TtecRadioButton
          Left = 8
          Top = 76
          Width = 480
          Height = 17
          Caption = 
            '4 - In'#237'cio de obrigatoriedade da entrega da ECF no curso do ano-' +
            'calend'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Value = '4'
        end
        object tecRadioButton11: TtecRadioButton
          Left = 8
          Top = 61
          Width = 480
          Height = 17
          Caption = '3 - Resultante de transforma'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          Value = '3'
        end
      end
      object gbxErro: TGroupBox
        Left = 0
        Top = 307
        Width = 1056
        Height = 263
        Align = alBottom
        Caption = ' ERROS DE VALIDA'#199#195'O '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        object mmoErro: TMemo
          Left = 2
          Top = 16
          Width = 1052
          Height = 245
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    object tstLucroReal: TTabSheet
      Caption = 'Lucro Real'
      ImageIndex = 1
      object DBTabControlL030: TDBTabControl
        Left = 0
        Top = 0
        Width = 1056
        Height = 570
        Align = alClient
        DataField = 'DescricaoSeq'
        DataSource = dtmecf.dsrL030
        MultiLine = True
        TabOrder = 0
        object pgcLucroReal: TtecPageControl
          Left = 4
          Top = 6
          Width = 1048
          Height = 560
          ActivePage = tstL210
          Align = alClient
          TabOrder = 0
          OnChange = pgcLucroRealChange
          object tstL210: TTabSheet
            Caption = 'L210 - Informativo da Composi'#231#227'o dos Custos'
            object Splitter1: TSplitter
              Left = 693
              Top = 0
              Width = 6
              Height = 529
              Align = alRight
              OnCanResize = Splitter1CanResize
            end
            object dbgecf_l210: TtecDBGrid
              Left = 0
              Top = 0
              Width = 693
              Height = 529
              Align = alClient
              DataSource = dtmecf.dsrecf_l210
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
              TitleFont.Height = -9
              TitleFont.Name = 'helvetica'
              TitleFont.Pitch = fpVariable
              TitleFont.Style = []
              OnDrawColumnCell = dbgecf_l210DrawColumnCell
              OnDblClick = dbgPlanodeContasDblClick
              OnKeyDown = dbgPlanodeContasKeyDown
              RowWrap = 60
              Large = False
              DoubleRowColor = False
              TitleMinHeight = 100
              CellHeights = 100
              StrippedColor = 16054260
              CanDelete = False
              CanNotInsertFromGrid = True
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
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'codigo_td_l210'
                  ReadOnly = True
                  Title.Alignment = taCenter
                  Title.Caption = 'C'#211'DIGO'
                  Width = 40
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'descricao'
                  ReadOnly = True
                  Title.Alignment = taCenter
                  Title.Caption = 'DESCRI'#199#195'O DA CONTA DE CUSTOS'
                  Width = 480
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'PossuiListaContasContabeis'
                  ReadOnly = True
                  Title.Alignment = taCenter
                  Title.Caption = 'C'
                  Width = 15
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'valor'
                  ReadOnly = True
                  Title.Alignment = taCenter
                  Title.Caption = 'SALDO'
                  Width = 110
                  Visible = True
                end>
            end
            object pnlPlanodeContas: TPanel
              Left = 699
              Top = 0
              Width = 341
              Height = 529
              Align = alRight
              BevelOuter = bvNone
              Caption = 'pnlPlanodeContas'
              TabOrder = 1
              object dbgPlanodeContas: TtecDBGrid
                Left = 0
                Top = 0
                Width = 341
                Height = 491
                Align = alClient
                DataSource = dtmecf.dsrPlanoContas
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
                TitleFont.Height = -9
                TitleFont.Name = 'helvetica'
                TitleFont.Pitch = fpVariable
                TitleFont.Style = []
                OnDblClick = dbgPlanodeContasDblClick
                OnKeyDown = dbgPlanodeContasKeyDown
                RowWrap = 60
                Large = False
                DoubleRowColor = False
                MsgDelete = 'este registro do Plano de Contas?'
                TitleMinHeight = 100
                CellHeights = 100
                StrippedColor = 16054260
                CanDelete = True
                CanNotInsertFromGrid = False
                PostOnEnter = True
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
                    FieldName = 'codigo'
                    Title.Alignment = taCenter
                    Title.Caption = 'C'#211'DIGO'
                    Width = 46
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'descricao'
                    ReadOnly = True
                    Title.Alignment = taCenter
                    Title.Caption = 'DESCRI'#199#195'O NO PLANO DE CONTAS'
                    Width = 212
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'posicaosaldo'
                    PickList.Strings = (
                      'I'
                      'F')
                    Title.Alignment = taCenter
                    Width = 42
                    Visible = True
                  end>
              end
              object Panel1: TPanel
                Left = 0
                Top = 491
                Width = 341
                Height = 38
                Align = alBottom
                BevelOuter = bvNone
                TabOrder = 1
                object Bevel1: TBevel
                  Left = 5
                  Top = 13
                  Width = 332
                  Height = 2
                  Visible = False
                end
                object btnImportarContas: TSpeedButton
                  Left = 3
                  Top = 17
                  Width = 338
                  Height = 20
                  Caption = 'Importar Contas Contabeis de Outros Periodos'
                  OnClick = btnImportarContasClick
                end
                object lblOrientacao: TStaticText
                  Left = 40
                  Top = 0
                  Width = 270
                  Height = 16
                  Caption = 'Pressione CTRL + F9 para pesquisa  |  CTRL + Del para excluir'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
              end
            end
          end
          object tstL300: TTabSheet
            Caption = 'L300 - Demonstra'#231#227'o do Resultado L'#237'quido no Per'#237'odo Fiscal'
            ImageIndex = 1
            object dbg_l300: TtecDBGrid
              Left = 0
              Top = 0
              Width = 1040
              Height = 529
              Align = alClient
              DataSource = dtmecf.dsrecf_l300
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
              TitleFont.Height = -9
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
                  FieldName = 'classificacao'
                  Title.Alignment = taCenter
                  Title.Caption = 'CLASSIFICA'#199#195'O'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'descricao'
                  Title.Alignment = taCenter
                  Title.Caption = 'DESCRI'#199#195'O DA CONTA REFERENCIAL'
                  Width = 647
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'valor'
                  Title.Alignment = taCenter
                  Title.Caption = 'SALDO'
                  Width = 110
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'D_C'
                  Title.Alignment = taCenter
                  Title.Caption = 'D/C'
                  Width = 20
                  Visible = True
                end>
            end
          end
          object tstLALUR: TTabSheet
            Caption = 'LALUR'
            ImageIndex = 2
            object pgcLALUR: TtecPageControl
              Left = 0
              Top = 0
              Width = 1040
              Height = 529
              ActivePage = tstParte_A_DemoLucroLeal
              Align = alClient
              TabOrder = 0
              OnChange = pgcLALURChange
              object tstParte_A_DemoLucroLeal: TTabSheet
                Caption = 'Parte A - Demontra'#231#227'o do Lucro Real'
                object pgcParte_A_DemoLucroLeal: TtecPageControl
                  Left = 0
                  Top = 0
                  Width = 1032
                  Height = 498
                  ActivePage = tstParte_A_DemoLucroLeal_Lancamentos
                  Align = alClient
                  TabOrder = 0
                  OnChange = pgcParte_A_DemoLucroLealChange
                  object tstParte_A_DemoLucroLeal_Lancamentos: TTabSheet
                    Caption = 'Lan'#231'amentos'
                    object dbg_ecfM300: TtecDBGrid
                      Left = 0
                      Top = 0
                      Width = 1024
                      Height = 467
                      Align = alClient
                      DataSource = dtmecf.dsrecf_m300
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
                      TitleFont.Height = -9
                      TitleFont.Name = 'helvetica'
                      TitleFont.Pitch = fpVariable
                      TitleFont.Style = []
                      OnDrawColumnCell = dbg_ecfM300DrawColumnCell
                      OnDblClick = dbgPlanodeContasDblClick
                      OnKeyDown = dbgPlanodeContasKeyDown
                      RowWrap = 60
                      Large = False
                      DoubleRowColor = False
                      TitleMinHeight = 100
                      CellHeights = 100
                      StrippedColor = 16054260
                      CanDelete = False
                      CanNotInsertFromGrid = True
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
                          Alignment = taCenter
                          Expanded = False
                          FieldName = 'codigo_td_m300'
                          Title.Alignment = taCenter
                          Title.Caption = 'C'#211'DIGO'
                          Width = 40
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'descricao'
                          Title.Alignment = taCenter
                          Title.Caption = 'DESCRI'#199#195'O DO TIPO DO LAN'#199'AMENTO NO e-LALUR'
                          Width = 400
                          Visible = True
                        end
                        item
                          Alignment = taCenter
                          Expanded = False
                          FieldName = 'ind_relacao'
                          Title.Alignment = taCenter
                          Title.Caption = 'RELACIONAMENTO DO LAN'#199'AMENTO DA PARTE A'
                          Visible = False
                        end
                        item
                          Alignment = taCenter
                          Expanded = False
                          FieldName = 'PossuiListaContasContabeis'
                          Title.Alignment = taCenter
                          Title.Caption = 'C'
                          Width = 15
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'valor'
                          Title.Alignment = taCenter
                          Title.Caption = 'VALOR'
                          Width = 110
                          Visible = True
                        end>
                    end
                  end
                  object tst_Parte_A_DemoLucroLeal_Relacionamentos: TTabSheet
                    Caption = 'Relacionamentos'
                    ImageIndex = 1
                    TabVisible = False
                  end
                end
              end
              object tstParteB_LALUR: TTabSheet
                Caption = 'Parte B - Controle das Contas'
                ImageIndex = 1
                TabVisible = False
                object pgcParteB_LALUR: TtecPageControl
                  Left = 0
                  Top = 0
                  Width = 1032
                  Height = 498
                  ActivePage = tst_m010
                  Align = alClient
                  TabOrder = 0
                  OnChange = pgcParteB_LALURChange
                  object tst_m010: TTabSheet
                    Caption = 'Identifica'#231#227'o da conta na parte B'
                    object pnlecf_m010: TPanel
                      Left = 0
                      Top = 0
                      Width = 1024
                      Height = 467
                      Align = alClient
                      TabOrder = 0
                      object pnlecf_m010_bottom: TPanel
                        Left = 1
                        Top = 291
                        Width = 1022
                        Height = 175
                        Hint = 
                          'Saldo no per'#237'odo inicial desta escritura'#231#227'o. Se a data de cria'#231#227 +
                          'o for no per'#237'odo da escritura'#231#227'o, ent'#227'o o valor deve ser zero'
                        Align = alBottom
                        TabOrder = 0
                        object DBNavigator1: TDBNavigator
                          Left = 6
                          Top = 144
                          Width = 252
                          Height = 28
                          DataSource = dtmecf.dsrecf_m010
                          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
                          TabOrder = 0
                        end
                        object gbx_m010_Cod_Cta_B: TGroupBox
                          Left = 8
                          Top = 4
                          Width = 80
                          Height = 36
                          Hint = 
                            'C'#243'digo un'#237'voco atribu'#237'do pela pessoa jur'#237'dica '#224' conta no e-LALUR' +
                            ' e e-LACS. '
                          Caption = ' CONTA '
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Height = -9
                          Font.Name = 'helvetica'
                          Font.Pitch = fpVariable
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 1
                          object edt_m010_Cod_Cta_B: TDBEditTexto
                            Left = 2
                            Top = 10
                            Width = 75
                            Height = 23
                            Hint = 
                              'C'#243'digo un'#237'voco atribu'#237'do pela pessoa jur'#237'dica '#224' conta no e-LALUR' +
                              ' e e-LACS. '
                            DataField = 'cod_cta_b'
                            DataSource = dtmecf.dsrecf_m010
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
                        object gbx_m010_Dt_Lim_Lal: TGroupBox
                          Left = 500
                          Top = 45
                          Width = 75
                          Height = 36
                          Hint = 
                            'Data limite para a exclus'#227'o, adi'#231#227'o ou compensa'#231#227'o do valor cont' +
                            'rolado, se houver.'
                          Caption = 'DATA LIMITE '
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Height = -9
                          Font.Name = 'helvetica'
                          Font.Pitch = fpVariable
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 2
                          object edt_m010_Dt_Lim_Lal: TDBEditData
                            Left = 2
                            Top = 10
                            Width = 70
                            Height = 23
                            Hint = 
                              'Data limite para a exclus'#227'o, adi'#231#227'o ou compensa'#231#227'o do valor cont' +
                              'rolado, se houver.'
                            Alignment = taCenter
                            DataField = 'dt_lim_lal'
                            DataSource = dtmecf.dsrecf_m010
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlack
                            Font.Height = -12
                            Font.Name = 'helvetica'
                            Font.Pitch = fpVariable
                            Font.Style = []
                            MaxLength = -1
                            Maximo = 0
                            Minimo = 37353
                            Adicional = 0
                            ParentFont = False
                            TabOrder = 0
                            Opcional = True
                          end
                        end
                        object gbx_m010_Vl_Saldo_Ini: TGroupBox
                          Left = 315
                          Top = 84
                          Width = 110
                          Height = 36
                          Hint = 'Saldo no per'#237'odo inicial desta escritura'#231#227'o.'
                          Caption = ' SALDO INICIAL '
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Height = -9
                          Font.Name = 'helvetica'
                          Font.Pitch = fpVariable
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 3
                          object edt_m010_Vl_Saldo_Ini: TDBEditNumero
                            Left = 2
                            Top = 10
                            Width = 105
                            Height = 23
                            Hint = 
                              'Saldo no per'#237'odo inicial desta escritura'#231#227'o. Se a data de cria'#231#227 +
                              'o for no per'#237'odo da escritura'#231#227'o, ent'#227'o o valor deve ser zero'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlack
                            Font.Height = -12
                            Font.Name = 'helvetica'
                            Font.Pitch = fpVariable
                            Font.Style = []
                            MaxLength = -1
                            ParentFont = False
                            TabOrder = 0
                            Text = '1,00'
                            Mascara = True
                            Alignment = taLeftJustify
                            TipoMascara = tmGERAL
                            NrDecimal = 2
                            Decimais = True
                            Negativo = False
                            Tamanho = 9
                            DataField = 'vl_saldo_ini'
                            DataSource = dtmecf.dsrecf_m010
                          end
                        end
                        object gbxl_m010_Cod_Lan_Orig: TGroupBox
                          Left = 8
                          Top = 44
                          Width = 487
                          Height = 36
                          Hint = 
                            'Descri'#231#227'o do tipo de lan'#231'amento na parte A do e-LALUR e/ou do e-' +
                            'LACS que deu origem'
                          Caption = ' C'#211'DIGO DO LAN'#199'AMENTO DE ORIGEM DA CONTA '
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Height = -9
                          Font.Name = 'helvetica'
                          Font.Pitch = fpVariable
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 4
                          object dbl_m010_Cod_Lan_Orig: TTecDBLookupComboBox
                            Left = 2
                            Top = 10
                            Width = 482
                            Height = 23
                            Hint = 
                              'Descri'#231#227'o do tipo de lan'#231'amento na parte A do e-LALUR e/ou do e-' +
                              'LACS que deu origem'
                            DataField = 'cod_lan_orig'
                            DataSource = dtmecf.dsrecf_m010
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlack
                            Font.Height = -12
                            Font.Name = 'helvetica'
                            Font.Pitch = fpVariable
                            Font.Style = []
                            KeyField = 'codigo'
                            ListField = 'codigodescricao'
                            ListSource = dtmecf.dsrecf_td_m300
                            NullValueKey = 46
                            ParentFont = False
                            TabOrder = 0
                          end
                        end
                        object gbx_m010_Cod_Tributo: TGroupBox
                          Left = 10
                          Top = 84
                          Width = 300
                          Height = 36
                          Hint = 
                            '"I" - Imposto de Renda Pessoa Jur'#237'dica ou "C" - Contribui'#231#227'o Soc' +
                            'ial sobre o Lucro L'#237'quido'
                          Caption = ' TIPO DE TRIBUTO '
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Height = -9
                          Font.Name = 'helvetica'
                          Font.Pitch = fpVariable
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 5
                          object dbm_m010_Cod_Tributo: TDBMaplistCombobox
                            Left = 2
                            Top = 10
                            Width = 295
                            Height = 23
                            Hint = 
                              '"I" - Imposto de Renda Pessoa Jur'#237'dica ou "C" - Contribui'#231#227'o Soc' +
                              'ial sobre o Lucro L'#237'quido'
                            DataField = 'cod_tributo'
                            DataSource = dtmecf.dsrecf_m010
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlack
                            Font.Height = -12
                            Font.Name = 'helvetica'
                            Font.Pitch = fpVariable
                            Font.Style = []
                            ItemHeight = 15
                            Items.Strings = (
                              'I - Imposto de Renda Pessoa Jur'#237'dica'
                              'C - Contribui'#231#227'o Social sobre o Lucro L'#237'quido')
                            ParentFont = False
                            TabOrder = 0
                            ItemValues.Strings = (
                              'I'
                              'C')
                          end
                        end
                        object gbx_m010_Ind_Vl_Saldo_Ini: TGroupBox
                          Left = 430
                          Top = 84
                          Width = 45
                          Height = 36
                          Hint = 
                            '"D" para preju'#237'zos ou valores que reduzam o lucro real ou a base' +
                            ' de c'#225'lculo da contribui'#231#227'o social e "C" para valores que aument' +
                            'em o lucro real ou a base de c'#225'lculo da contribui'#231#227'o social em p' +
                            'er'#237'odos subsquentes'
                          Caption = 'D/C'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Height = -9
                          Font.Name = 'helvetica'
                          Font.Pitch = fpVariable
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 6
                          object dbm_m010_Ind_Vl_Saldo_Ini: TDBMaplistCombobox
                            Left = 2
                            Top = 10
                            Width = 40
                            Height = 23
                            Hint = 
                              '"D" para preju'#237'zos ou valores que reduzam o lucro real ou a base' +
                              ' de c'#225'lculo da contribui'#231#227'o social e "C" para valores que aument' +
                              'em o lucro real ou a base de c'#225'lculo da contribui'#231#227'o social em p' +
                              'er'#237'odos subsquentes'
                            DataField = 'ind_vl_saldo_ini'
                            DataSource = dtmecf.dsrecf_m010
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlack
                            Font.Height = -12
                            Font.Name = 'helvetica'
                            Font.Pitch = fpVariable
                            Font.Style = []
                            ItemHeight = 15
                            Items.Strings = (
                              'D - Reduzir o lucro real'
                              'C - Aumentar o lucro real')
                            ParentFont = False
                            TabOrder = 0
                            ItemValues.Strings = (
                              'D'
                              'C')
                          end
                        end
                        object gbx_m010_dt_ap_lal: TGroupBox
                          Left = 500
                          Top = 4
                          Width = 75
                          Height = 36
                          Hint = 'Data final do per'#237'odo de apura'#231#227'o em que a conta foi criada'
                          Caption = ' CRIA'#199#195'O '
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Height = -9
                          Font.Name = 'helvetica'
                          Font.Pitch = fpVariable
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 7
                          object edt_m010_dt_ap_lal: TDBEditData
                            Left = 2
                            Top = 10
                            Width = 70
                            Height = 23
                            Hint = 'Data final do per'#237'odo de apura'#231#227'o em que a conta foi criada'
                            Alignment = taCenter
                            DataField = 'dt_ap_lal'
                            DataSource = dtmecf.dsrecf_m010
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlack
                            Font.Height = -12
                            Font.Name = 'helvetica'
                            Font.Pitch = fpVariable
                            Font.Style = []
                            MaxLength = -1
                            Maximo = 0
                            Minimo = 37353
                            Adicional = 0
                            ParentFont = False
                            TabOrder = 0
                            Opcional = True
                          end
                        end
                        object gbx_m010_Desc_Cta_Lal: TGroupBox
                          Left = 95
                          Top = 4
                          Width = 400
                          Height = 36
                          Hint = 'Descri'#231#227'o da conta'
                          Caption = ' DESCRI'#199#195'O DA CONTA '
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Height = -9
                          Font.Name = 'helvetica'
                          Font.Pitch = fpVariable
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 8
                          object edt_m010_desc_cta_lal: TDBEditTexto
                            Left = 2
                            Top = 10
                            Width = 395
                            Height = 23
                            Hint = 'Descri'#231#227'o da conta'
                            DataField = 'desc_cta_lal'
                            DataSource = dtmecf.dsrecf_m010
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
                        object gbx_m010_CNPJ_Sit_Esp: TGroupBox
                          Left = 480
                          Top = 84
                          Width = 95
                          Height = 36
                          Hint = 
                            'Data limite para a exclus'#227'o, adi'#231#227'o ou compensa'#231#227'o do valor cont' +
                            'rolado, se houver.'
                          Caption = ' CNPJ '
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Height = -9
                          Font.Name = 'helvetica'
                          Font.Pitch = fpVariable
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 9
                          object DBEditData1: TDBEditData
                            Left = 2
                            Top = 10
                            Width = 90
                            Height = 23
                            Hint = 
                              'Data limite para a exclus'#227'o, adi'#231#227'o ou compensa'#231#227'o do valor cont' +
                              'rolado, se houver.'
                            Alignment = taCenter
                            DataField = 'dt_lim_lal'
                            DataSource = dtmecf.dsrecf_m010
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlack
                            Font.Height = -12
                            Font.Name = 'helvetica'
                            Font.Pitch = fpVariable
                            Font.Style = []
                            MaxLength = -1
                            Maximo = 0
                            Minimo = 37353
                            Adicional = 0
                            ParentFont = False
                            TabOrder = 0
                            Opcional = True
                          end
                        end
                      end
                      object zdbg_m010: TtecDBGrid
                        Tag = 1
                        Left = 1
                        Top = 1
                        Width = 1022
                        Height = 290
                        Align = alClient
                        DataSource = dtmecf.dsrecf_m010
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Height = -12
                        Font.Name = 'helvetica'
                        Font.Pitch = fpVariable
                        Font.Style = []
                        ParentFont = False
                        ReadOnly = True
                        TabOrder = 1
                        TitleFont.Charset = DEFAULT_CHARSET
                        TitleFont.Color = clBlack
                        TitleFont.Height = -9
                        TitleFont.Name = 'helvetica'
                        TitleFont.Pitch = fpVariable
                        TitleFont.Style = []
                        RowWrap = 60
                        Large = False
                        DoubleRowColor = False
                        TitleMinHeight = 100
                        CellHeights = 100
                        StrippedColor = 16054260
                        CanDelete = True
                        CanNotInsertFromGrid = True
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
                            FieldName = 'cod_cta_b_aux'
                            Title.Alignment = taCenter
                            Title.Caption = 'CONTA'
                            Width = 68
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'desc_cta_lal_aux'
                            Title.Alignment = taCenter
                            Title.Caption = 'DESCRI'#199#195'O'
                            Width = 246
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'dt_ap_lal_aux'
                            Title.Alignment = taCenter
                            Title.Caption = 'CRIA'#199#195'O'
                            Width = 70
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'dt_lim_lal_aux'
                            Title.Alignment = taCenter
                            Title.Caption = 'LIMITE'
                            Width = 70
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'cod_tributo_aux'
                            Title.Caption = 'TRIBUTO'
                            Width = 45
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'vl_saldo_ini_aux'
                            Title.Alignment = taCenter
                            Title.Caption = 'SALDO INICIAL'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'ind_vl_saldo_ini_aux'
                            Title.Caption = 'D/C'
                            Width = 20
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'cod_lan_orig_aux'
                            Title.Alignment = taCenter
                            Title.Caption = 'ORIGEM'
                            Width = 100
                            Visible = True
                          end>
                      end
                    end
                  end
                  object tst_m410: TTabSheet
                    Caption = 'Lan'#231'amentos sem reflexo na parte A'
                    ImageIndex = 1
                    object pnlecf_m410: TPanel
                      Left = 0
                      Top = 0
                      Width = 1024
                      Height = 467
                      Align = alClient
                      TabOrder = 0
                      object dbgECF_m410: TtecDBGrid
                        Left = 1
                        Top = 1
                        Width = 1022
                        Height = 217
                        Align = alClient
                        DataSource = dtmecf.dsrecf_m410
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Height = -9
                        Font.Name = 'helvetica'
                        Font.Pitch = fpVariable
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 1
                        TitleFont.Charset = DEFAULT_CHARSET
                        TitleFont.Color = clBlack
                        TitleFont.Height = -9
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
                        DefaultRowHeight = 16
                        ExibirNumerodaLinha = False
                        NaoAtribuirDadosaTabelaaoDigitar = False
                        ShowWhenFieldInvisible = False
                        CanClickWhenEditing = False
                        Columns = <
                          item
                            Expanded = False
                            FieldName = 'cod_cta_b'
                            Title.Alignment = taCenter
                            Title.Caption = 'CONTA'
                            Width = 80
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'cod_tributo'
                            Title.Alignment = taCenter
                            Title.Caption = 'TRIBUTO'
                            Width = 45
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'val_lan_lalb_pb'
                            Title.Alignment = taCenter
                            Title.Caption = 'VALOR LAN'#199'AMENTO'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'ind_val_lan_lalb_pb'
                            Title.Alignment = taCenter
                            Title.Caption = 'INDICADOR LAN'#199'TO'
                            Width = 100
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'ind_lan_ant'
                            Title.Alignment = taCenter
                            Title.Caption = 'DIFERIDO'
                            Visible = True
                          end>
                      end
                      object pnlECF_m410_bottom: TPanel
                        Left = 1
                        Top = 218
                        Width = 1022
                        Height = 248
                        Align = alBottom
                        TabOrder = 0
                        object Label12: TLabel
                          Left = 8
                          Top = 135
                          Width = 423
                          Height = 16
                          Caption = 
                            'Lan'#231'amento para realiza'#231#227'o de valores cuja tributa'#231#227'o tenha sido' +
                            ' diferida'
                        end
                        object DBNavigator2: TDBNavigator
                          Left = 6
                          Top = 216
                          Width = 252
                          Height = 28
                          DataSource = dtmecf.dsrecf_m410
                          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
                          TabOrder = 0
                        end
                        object gbxM410_COD_CTA_B: TGroupBox
                          Left = 8
                          Top = 4
                          Width = 90
                          Height = 36
                          Hint = 'C'#243'digo da conta do lan'#231'amento (conta da Parte B)'
                          Caption = ' CONTA '
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Height = -9
                          Font.Name = 'helvetica'
                          Font.Pitch = fpVariable
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 1
                          object DBCBB: TTecDBLookupComboBox
                            Left = 2
                            Top = 10
                            Width = 85
                            Height = 23
                            Hint = 'C'#243'digo da conta do lan'#231'amento (conta da Parte B)'
                            DataField = 'cod_cta_b'
                            DataSource = dtmecf.dsrecf_m410
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlack
                            Font.Height = -12
                            Font.Name = 'helvetica'
                            Font.Pitch = fpVariable
                            Font.Style = []
                            KeyField = 'cod_cta_b'
                            ListField = 'cod_cta_b;desc_cta_lal'
                            ListSource = dtmecf.dsrecf_m010
                            ParentFont = False
                            TabOrder = 0
                          end
                        end
                        object GroupBox3: TGroupBox
                          Left = 104
                          Top = 4
                          Width = 400
                          Height = 36
                          Hint = 'Descri'#231#227'o da conta'
                          Caption = ' DESCRI'#199#195'O DA CONTA '
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Height = -9
                          Font.Name = 'helvetica'
                          Font.Pitch = fpVariable
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 2
                          object tecDBText1: TtecDBText
                            Left = 2
                            Top = 10
                            Width = 395
                            Height = 23
                            TabStop = False
                            Color = clBtnFace
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
                        object gbxM410_COD_TRIBUTO: TGroupBox
                          Left = 8
                          Top = 44
                          Width = 325
                          Height = 36
                          Hint = 
                            '"I" - Imposto de Renda Pessoa Jur'#237'dica ou "C" - Contribui'#231#227'o Soc' +
                            'ial sobre o Lucro L'#237'quido'
                          Caption = ' TIPO DE TRIBUTO '
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Height = -9
                          Font.Name = 'helvetica'
                          Font.Pitch = fpVariable
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 3
                          object DBMaplistCombobox1: TDBMaplistCombobox
                            Left = 2
                            Top = 10
                            Width = 320
                            Height = 23
                            Hint = 
                              '"I" - Imposto de Renda Pessoa Jur'#237'dica ou "C" - Contribui'#231#227'o Soc' +
                              'ial sobre o Lucro L'#237'quido'
                            DataField = 'cod_tributo'
                            DataSource = dtmecf.dsrecf_m410
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlack
                            Font.Height = -12
                            Font.Name = 'helvetica'
                            Font.Pitch = fpVariable
                            Font.Style = []
                            ItemHeight = 15
                            Items.Strings = (
                              'I - Imposto de Renda'
                              'C - Contribui'#231#227'o Social sobre o Lucro L'#237'quido')
                            ParentFont = False
                            TabOrder = 0
                            ItemValues.Strings = (
                              'I'
                              'C')
                          end
                        end
                        object gbxM410_VAL_LAN_LALB_PB: TGroupBox
                          Left = 341
                          Top = 44
                          Width = 110
                          Height = 36
                          Hint = 'Saldo no per'#237'odo inicial desta escritura'#231#227'o.'
                          Caption = 'VALOR LAN'#199'AMENTO'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Height = -9
                          Font.Name = 'helvetica'
                          Font.Pitch = fpVariable
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 4
                          object DBEditNumero2: TDBEditNumero
                            Left = 2
                            Top = 10
                            Width = 105
                            Height = 23
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlack
                            Font.Height = -12
                            Font.Name = 'helvetica'
                            Font.Pitch = fpVariable
                            Font.Style = []
                            MaxLength = -1
                            ParentFont = False
                            TabOrder = 0
                            Text = '2,00'
                            Mascara = True
                            TipoMascara = tmGERAL
                            NrDecimal = 2
                            Decimais = True
                            Negativo = False
                            Tamanho = 9
                            DataField = 'val_lan_lalb_pb'
                            DataSource = dtmecf.dsrecf_m410
                          end
                        end
                        object gbxM410_IND_VAL_LAN_LALB_PB: TGroupBox
                          Left = 458
                          Top = 44
                          Width = 45
                          Height = 36
                          Hint = 
                            'Indicador do lan'#231'amento: "CR" - cr'#233'dito, "DB" - d'#233'bito, "PF" - p' +
                            'reju'#237'zo do exerc'#237'cio e "BC" base de c'#225'lculo negativa da CSLL'
                          Caption = 'D/C'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Height = -9
                          Font.Name = 'helvetica'
                          Font.Pitch = fpVariable
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 5
                          object DBMaplistCombobox2: TDBMaplistCombobox
                            Left = 2
                            Top = 10
                            Width = 40
                            Height = 23
                            Hint = 
                              'Indicador do lan'#231'amento: "CR" - cr'#233'dito, "DB" - d'#233'bito, "PF" - p' +
                              'reju'#237'zo do exerc'#237'cio e "BC" base de c'#225'lculo negativa da CSLL'
                            DataField = 'ind_val_lan_lalb_pb'
                            DataSource = dtmecf.dsrecf_m410
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlack
                            Font.Height = -12
                            Font.Name = 'helvetica'
                            Font.Pitch = fpVariable
                            Font.Style = []
                            ItemHeight = 15
                            Items.Strings = (
                              'CR - Cr'#233'dito'
                              'DB - D'#233'bito'
                              'PF - Preju'#237'zo do exerc'#237'cio.'
                              'BC - Base de c'#225'lculo negativa da CSLL')
                            ParentFont = False
                            TabOrder = 0
                            ItemValues.Strings = (
                              'CR'
                              'DB'
                              'PF'
                              'BC')
                          end
                        end
                        object gbxContraPartida: TGroupBox
                          Left = 8
                          Top = 84
                          Width = 90
                          Height = 36
                          Hint = 
                            'C'#243'digo un'#237'voco da contrapartida (conta da Parte B), caso seja ne' +
                            'cess'#225'ria a transfer'#234'ncia de saldo de uma conta na parte B para o' +
                            'utra conta na parte B'
                          Caption = 'CONTRAPARTIDA'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Height = -9
                          Font.Name = 'helvetica'
                          Font.Pitch = fpVariable
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 6
                          object TecDBLookupComboBox1: TTecDBLookupComboBox
                            Left = 2
                            Top = 10
                            Width = 85
                            Height = 23
                            Hint = 
                              'C'#243'digo un'#237'voco da contrapartida (conta da Parte B), caso seja ne' +
                              'cess'#225'ria a transfer'#234'ncia de saldo de uma conta na parte B para o' +
                              'utra conta na parte B'
                            DataField = 'cod_cta_b_ctp'
                            DataSource = dtmecf.dsrecf_m410
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlack
                            Font.Height = -12
                            Font.Name = 'helvetica'
                            Font.Pitch = fpVariable
                            Font.Style = []
                            KeyField = 'cod_cta_b'
                            ListField = 'cod_cta_b;desc_cta_lal'
                            ListSource = dtmecf.dsrecf_m010
                            NullValueKey = 46
                            ParentFont = False
                            TabOrder = 0
                          end
                        end
                        object GroupBox7: TGroupBox
                          Left = 104
                          Top = 84
                          Width = 400
                          Height = 36
                          Hint = 'Descri'#231#227'o da contrapartida'
                          Caption = ' DESCRI'#199#195'O DA CONTA '
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Height = -9
                          Font.Name = 'helvetica'
                          Font.Pitch = fpVariable
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 7
                          object tecDBText2: TtecDBText
                            Left = 2
                            Top = 10
                            Width = 395
                            Height = 23
                            Hint = 'Descri'#231#227'o da contrapartida'
                            TabStop = False
                            Color = clBtnFace
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
                        object GroupBox5: TGroupBox
                          Left = 444
                          Top = 124
                          Width = 60
                          Height = 36
                          Caption = 'SIM/N'#195'O'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Height = -9
                          Font.Name = 'helvetica'
                          Font.Pitch = fpVariable
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 8
                          object DBMaplistCombobox3: TDBMaplistCombobox
                            Left = 2
                            Top = 10
                            Width = 55
                            Height = 23
                            DataField = 'ind_lan_ant'
                            DataSource = dtmecf.dsrecf_m410
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlack
                            Font.Height = -12
                            Font.Name = 'helvetica'
                            Font.Pitch = fpVariable
                            Font.Style = []
                            ItemHeight = 15
                            Items.Strings = (
                              'S - Sim'
                              'N - N'#227'o')
                            ParentFont = False
                            TabOrder = 0
                            ItemValues.Strings = (
                              'S - Sim'
                              'N - N'#227'o')
                          end
                        end
                        object gbxM410_HIST_LAN_LALB: TGroupBox
                          Left = 512
                          Top = 1
                          Width = 509
                          Height = 246
                          Align = alRight
                          Caption = ' HIST'#211'RICO DO LAN'#199'AMENTO '
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Height = -9
                          Font.Name = 'helvetica'
                          Font.Pitch = fpVariable
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 9
                          object tecDBMemo1: TtecDBMemo
                            Left = 2
                            Top = 14
                            Width = 505
                            Height = 230
                            Align = alClient
                            DataField = 'hist_lan_lalb'
                            DataSource = dtmecf.dsrecf_m410
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlack
                            Font.Height = -12
                            Font.Name = 'helvetica'
                            Font.Pitch = fpVariable
                            Font.Style = []
                            ParentFont = False
                            TabOrder = 0
                          end
                        end
                      end
                    end
                  end
                  object tst_m500: TTabSheet
                    Caption = 'Demonstrativo de Saldos'
                    ImageIndex = 2
                  end
                end
              end
            end
          end
        end
      end
    end
    object tstLucroPresumido: TTabSheet
      Caption = 'Lucro Presumido'
      ImageIndex = 2
      object DBTabControlP030: TDBTabControl
        Left = 0
        Top = 0
        Width = 1056
        Height = 570
        Align = alClient
        DataField = 'DescricaoSeq'
        DataSource = dtmecf.dsrP030
        MultiLine = True
        TabOrder = 0
        object pgcLucroPresumido: TtecPageControl
          Left = 4
          Top = 6
          Width = 1048
          Height = 560
          ActivePage = tstP200
          Align = alClient
          TabOrder = 0
          OnChange = pgcLucroPresumidoChange
          object tstP200: TTabSheet
            Caption = 'P200 - Apura'#231#227'o da Base de C'#225'lculo'
            object Splitter2: TSplitter
              Left = 1034
              Top = 0
              Width = 6
              Height = 529
              Align = alRight
              OnCanResize = Splitter1CanResize
            end
            object dbgP200: TtecDBGrid
              Left = 0
              Top = 0
              Width = 1034
              Height = 529
              Align = alClient
              DataSource = dtmecf.dsrecf_p200
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
              TitleFont.Height = -9
              TitleFont.Name = 'helvetica'
              TitleFont.Pitch = fpVariable
              TitleFont.Style = []
              OnDrawColumnCell = dbgP200DrawColumnCell
              OnDblClick = dbgPlanodeContasDblClick
              OnKeyDown = dbgPlanodeContasKeyDown
              RowWrap = 60
              Large = False
              DoubleRowColor = False
              TitleMinHeight = 100
              CellHeights = 100
              StrippedColor = 16054260
              CanDelete = False
              CanNotInsertFromGrid = True
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
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'codigo_td_p200'
                  ReadOnly = True
                  Title.Alignment = taCenter
                  Title.Caption = 'C'#211'DIGO'
                  Width = 40
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'descricao'
                  ReadOnly = True
                  Title.Alignment = taCenter
                  Title.Caption = 'DESCRI'#199#195'O'
                  Width = 480
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'PossuiListaContasContabeis'
                  ReadOnly = True
                  Title.Alignment = taCenter
                  Title.Caption = 'C'
                  Width = 15
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'valor'
                  ReadOnly = True
                  Title.Alignment = taCenter
                  Title.Caption = 'SALDO'
                  Width = 110
                  Visible = True
                end>
            end
          end
          object tstP300: TTabSheet
            Caption = 'P300 - C'#225'lculo do IRPJ'
            ImageIndex = 1
            object dbgP300: TtecDBGrid
              Left = 0
              Top = 0
              Width = 1040
              Height = 529
              Align = alClient
              DataSource = dtmecf.dsrecf_p300
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
              TitleFont.Height = -9
              TitleFont.Name = 'helvetica'
              TitleFont.Pitch = fpVariable
              TitleFont.Style = []
              OnDrawColumnCell = dbgP300DrawColumnCell
              OnDblClick = dbgPlanodeContasDblClick
              OnKeyDown = dbgPlanodeContasKeyDown
              RowWrap = 60
              Large = False
              DoubleRowColor = False
              TitleMinHeight = 100
              CellHeights = 100
              StrippedColor = 16054260
              CanDelete = False
              CanNotInsertFromGrid = True
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
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'codigo_td_p300'
                  ReadOnly = True
                  Title.Alignment = taCenter
                  Title.Caption = 'C'#211'DIGO'
                  Width = 40
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'descricao'
                  ReadOnly = True
                  Title.Alignment = taCenter
                  Title.Caption = 'DESCRI'#199#195'O'
                  Width = 480
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'PossuiListaContasContabeis'
                  ReadOnly = True
                  Title.Alignment = taCenter
                  Title.Caption = 'C'
                  Width = 15
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'valor'
                  ReadOnly = True
                  Title.Alignment = taCenter
                  Title.Caption = 'SALDO'
                  Width = 110
                  Visible = True
                end>
            end
          end
          object tstP400: TTabSheet
            Caption = 'P400 - Apura'#231#227'o da Base de C'#225'lculo da CSLL'
            ImageIndex = 2
            object dbgP400: TtecDBGrid
              Left = 0
              Top = 0
              Width = 1040
              Height = 529
              Align = alClient
              DataSource = dtmecf.dsrecf_p400
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
              TitleFont.Height = -9
              TitleFont.Name = 'helvetica'
              TitleFont.Pitch = fpVariable
              TitleFont.Style = []
              OnDrawColumnCell = dbgP400DrawColumnCell
              OnDblClick = dbgPlanodeContasDblClick
              OnKeyDown = dbgPlanodeContasKeyDown
              RowWrap = 60
              Large = False
              DoubleRowColor = False
              TitleMinHeight = 100
              CellHeights = 100
              StrippedColor = 16054260
              CanDelete = False
              CanNotInsertFromGrid = True
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
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'codigo_td_p400'
                  ReadOnly = True
                  Title.Alignment = taCenter
                  Title.Caption = 'C'#211'DIGO'
                  Width = 40
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'descricao'
                  ReadOnly = True
                  Title.Alignment = taCenter
                  Title.Caption = 'DESCRI'#199#195'O'
                  Width = 480
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'PossuiListaContasContabeis'
                  ReadOnly = True
                  Title.Alignment = taCenter
                  Title.Caption = 'C'
                  Width = 15
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'valor'
                  ReadOnly = True
                  Title.Alignment = taCenter
                  Title.Caption = 'SALDO'
                  Width = 110
                  Visible = True
                end>
            end
          end
          object tstP500: TTabSheet
            Caption = 'P500 - C'#225'lculo da CSLL'
            ImageIndex = 3
            object dbgP500: TtecDBGrid
              Left = 0
              Top = 0
              Width = 1040
              Height = 529
              Align = alClient
              DataSource = dtmecf.dsrecf_p500
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
              TitleFont.Height = -9
              TitleFont.Name = 'helvetica'
              TitleFont.Pitch = fpVariable
              TitleFont.Style = []
              OnDrawColumnCell = dbgP500DrawColumnCell
              OnDblClick = dbgPlanodeContasDblClick
              OnKeyDown = dbgPlanodeContasKeyDown
              RowWrap = 60
              Large = False
              DoubleRowColor = False
              TitleMinHeight = 100
              CellHeights = 100
              StrippedColor = 16054260
              CanDelete = False
              CanNotInsertFromGrid = True
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
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'codigo_td_p400'
                  ReadOnly = True
                  Title.Alignment = taCenter
                  Title.Caption = 'C'#211'DIGO'
                  Width = 40
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'descricao'
                  ReadOnly = True
                  Title.Alignment = taCenter
                  Title.Caption = 'DESCRI'#199#195'O'
                  Width = 480
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'PossuiListaContasContabeis'
                  ReadOnly = True
                  Title.Alignment = taCenter
                  Title.Caption = 'C'
                  Width = 15
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'valor'
                  ReadOnly = True
                  Title.Alignment = taCenter
                  Title.Caption = 'SALDO'
                  Width = 110
                  Visible = True
                end>
            end
          end
        end
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 865
    Top = 16
  end
end
