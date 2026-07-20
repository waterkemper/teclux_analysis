inherited frmCadastroEmpreendimentos: TfrmCadastroEmpreendimentos
  Left = 1070
  Top = 6
  ActiveControl = edfNumeroEmpreendimento
  Caption = 'Cadastro de Empreendimentos'
  ClientHeight = 904
  ClientWidth = 714
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlTopMenu: TPanel
    Width = 714
    inherited tblBarra: TToolBar
      Width = 489
    end
  end
  object pnlDadosEmpreendimento: TPanel
    Left = 0
    Top = 40
    Width = 714
    Height = 864
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object gbxEmpreendimentos: TGroupBox
      Left = 0
      Top = 0
      Width = 714
      Height = 864
      Align = alClient
      TabOrder = 0
      object lblAreasDo: TLabel
        Left = 586
        Top = 58
        Width = 54
        Height = 14
        Caption = #193'REAS DO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
      end
      object gbxDescricao: TGroupBox
        Left = 181
        Top = 10
        Width = 490
        Height = 36
        Caption = ' NOME DO EMPREENDIMENTO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object edtDescricaoEmpreendimento: TDBEditTexto
          Left = 2
          Top = 10
          Width = 485
          Height = 23
          CharCase = ecUpperCase
          DataField = 'nome'
          DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 26
          ParentFont = False
          TabOrder = 0
          CharCasenoDefault = True
          Alignment = taLeftJustify
        end
      end
      object gbxSigla: TGroupBox
        Left = 77
        Top = 10
        Width = 100
        Height = 36
        Caption = ' SIGLA '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object edtSigla: TDBEditTexto
          Left = 2
          Top = 10
          Width = 95
          Height = 23
          CharCase = ecUpperCase
          DataField = 'sigla'
          DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 8
          ParentFont = False
          TabOrder = 0
          CharCasenoDefault = True
          Alignment = taLeftJustify
        end
      end
      object gbxObservacoes: TGroupBox
        Left = 10
        Top = 49
        Width = 404
        Height = 77
        Caption = ' OBSERVA'#199#213'ES '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object mmoObservacoes: TtecDBMemo
          Left = 2
          Top = 14
          Width = 400
          Height = 61
          Align = alClient
          DataField = 'observacoes'
          DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 300
          ParentFont = False
          TabOrder = 0
        end
      end
      object gbxCodigo: TGroupBox
        Left = 11
        Top = 10
        Width = 62
        Height = 36
        Caption = ' C'#211'DIGO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object edfNumeroEmpreendimento: TtecDbEditFind
          Left = 4
          Top = 10
          Width = 55
          Height = 23
          Alignment = taLeftJustify
          DataField = 'codigo'
          DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 6
          Maximo = 0
          Minimo = 37353
          Adicional = 0
          Opcional = True
          ParentFont = False
          TabOrder = 0
          PermitirZero = False
          PermitirNulo = False
          Operacao = opPESQUISA
          Parameter = 'Numero'
          ActiveSetControls = True
          DenyInsert = True
          NoSetControls = <>
          SetControls = <>
        end
      end
      object pgcDadosEmpreendimento: TtecPageControl
        Left = 2
        Top = 255
        Width = 710
        Height = 607
        ActivePage = tstContabil
        Align = alBottom
        TabOrder = 7
        object tstBlocos: TTabSheet
          Caption = ' &1 - Blocos'
          object sbnExcluirBloco: TSpeedButton
            Left = 279
            Top = 26
            Width = 23
            Height = 23
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              A0A0A00000FF0000FF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDC0000FFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFFF
              FFFFDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFF808080DCDCDCDCDCDCDCDCDC
              0000FF0000FF0000FF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DC0000000000FFDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7FFF
              FFFFDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF808080DCDCDCDCDCDCDCDCDCDCDCDC
              0000FF0000FF0000FF0000FF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC0000
              000000FF808080DCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7FFF
              FFFFFFFFFFDCDCDCDCDCDCFFFFFF808080808080DCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDC0000FF0000FF0000FF0000FF000000DCDCDCDCDCDCDCDCDC0000000000
              FF808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F
              7F7FFFFFFFDCDCDCFFFFFF808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDC0000FF0000FF0000FF000000DCDCDCDCDCDC0000000000FF0000
              FF808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F
              7F7FFFFFFFFFFFFF808080808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDC0000FF0000FF0000FF0000000000000000FF0000FF8080
              80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F
              7F7F7F7F7F808080808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDC0000FF0000FF0000FF0000FF0000FF808080DCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F80
              80807F7F7F808080808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDC0000000000FF0000FF0000FF0000FFDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F
              7F7F7F7F7F7F7F7F808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDC0000000000000000FF0000FF0000FF000000DCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFF8080808080807F
              7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDC0000000000FF0000FF0000FF0000FF0000FF0000FF000000DCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFF80808080808080808080
              80807F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC0000FF
              0000FF0000FF0000FF0000FF0000FF808080DCDCDC7F7F7F0000FF000000DCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF808080808080808080808080808080DC
              DCDCDCDCDC7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDC0000FF
              0000FF0000FF0000FF0000FF808080DCDCDCDCDCDCDCDCDC8080800000FF0000
              00DCDCDCDCDCDCDCDCDCDCDCDC808080808080808080808080808080DCDCDCDC
              DCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCA0A0A0
              0000FF0000FF808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC0000
              FF0000FF000000DCDCDCDCDCDC808080808080808080808080DCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
            NumGlyphs = 2
            OnClick = sbnExcluirBlocoClick
          end
          object sbnincluirBloco: TSpeedButton
            Left = 279
            Top = 2
            Width = 23
            Height = 23
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
            NumGlyphs = 2
            OnClick = sbnincluirBlocoClick
          end
          object dbgBlocos: TtecDBGrid
            Left = 0
            Top = 0
            Width = 275
            Height = 576
            Align = alLeft
            DataSource = dtmcadastroempreendimentos.dsrBlocos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'Arial'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = [fsBold]
            OnDblClick = dbgBlocosDblClick
            OnKeyDown = dbgBlocosKeyDown
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
            DenySort = False
            DefaultRowHeight = 19
            ExibirNumerodaLinha = False
            NaoAtribuirDadosaTabelaaoDigitar = False
            ShowWhenFieldInvisible = False
            Columns = <
              item
                Expanded = False
                FieldName = 'descricao'
                Title.Alignment = taCenter
                Title.Caption = 'NOME DO BLOCO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'Arial'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 235
                Visible = True
              end>
          end
        end
        object tstEndereco: TTabSheet
          Caption = ' &2 - Endere'#231'o'
          ImageIndex = 2
          inline fraEnderecoEmpreendimento: TfraEnderecoEditor
            Left = 4
            Top = 2
            Width = 455
            Height = 152
            HorzScrollBar.Visible = False
            VertScrollBar.Visible = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            inherited gbxEndereco: TGroupBox
              Width = 455
              Height = 152
              inherited pnlNumero: TPanel
                Width = 451
                inherited edtNumeroEndereco: TDBEditTexto
                  DataField = 'numero'
                  DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
                  MaxLength = 9
                end
                inherited edtComplemento: TDBEditTexto
                  DataField = 'complemento'
                  DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
                  MaxLength = 14
                end
              end
              inherited pnlBairro: TPanel
                Width = 451
                inherited sbnBairro: TSpeedButton
                  OnClick = fraEnderecoEmpreendimentosbnBairroClick
                end
                inherited edtBairro: TtecDoubleDBEdit
                  LookupField = 'nomebairrocliente'
                  LookupSource = dtmcadastroempreendimentos.dsrEmpreendimentos
                  DataField = 'bairro'
                  DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
                  MaxLength = 50
                end
              end
              inherited pnlCidade: TPanel
                Width = 451
                Caption = 'NomeCidade'
                inherited edtEstado: TDBEditTexto
                  DataField = 'estado'
                  DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
                  MaxLength = 9
                end
                inherited edtCidade: TtecDoubleDBEdit
                  LookupField = 'nomecidadecliente'
                  LookupSource = dtmcadastroempreendimentos.dsrEmpreendimentos
                  DataField = 'cidade'
                  DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
                  MaxLength = 50
                end
                inherited edtCEP: TDBEditCep
                  DataField = 'cep'
                  DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
                  MaxLength = 6
                end
              end
              inherited pnlRua: TPanel
                Width = 451
                inherited sbnRua: TSpeedButton
                  OnClick = fraEnderecoEmpreendimentosbnRuaClick
                end
                inherited mmoRua: TtecDBMemo
                  DataField = 'rua'
                  DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
                  Font.Height = -12
                end
              end
              inherited pnllblCidade: TPanel
                Width = 451
              end
              inherited pnllblBairro: TPanel
                Width = 451
              end
              inherited pnllblNumero: TPanel
                Width = 451
              end
            end
          end
        end
        object tstContabil: TTabSheet
          Caption = ' &3 - Cont'#225'bil'
          ImageIndex = 1
          object pgcContabil: TtecPageControl
            Left = 0
            Top = 0
            Width = 702
            Height = 576
            ActivePage = tstVenda
            Align = alClient
            TabOrder = 0
            object tstVenda: TTabSheet
              Caption = ' &Venda'
              object lblTaxaDesconto: TLabel
                Left = 560
                Top = 455
                Width = 93
                Height = 12
                Caption = 'TAXA DE DESCONTO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object lblSugerida: TLabel
                Left = 575
                Top = 468
                Width = 49
                Height = 12
                Caption = 'SUGERIDA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object gbxImpostoSobreVendas: TGroupBox
                Left = 7
                Top = 208
                Width = 532
                Height = 169
                Caption = ' APROPRIA'#199#195'O DOS IMPOSTOS SOBRE A VENDA '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 3
                object gbxDebitarCOFINS: TGroupBox
                  Left = 0
                  Top = 13
                  Width = 532
                  Height = 34
                  Caption = 
                    ' DEBITAR COFINS - CONTRIBUI'#199#195'O PARA O FINANCIAMENTO DA SEGURIDAD' +
                    'E SOCIAL '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  inline fraDebitoCOFINSVenda: TfraConsultaCodigoContabil
                    Left = 2
                    Top = 10
                    Width = 379
                    Height = 26
                    HorzScrollBar.Range = 365
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
                      Left = 61
                      Height = 23
                      Hint = 'Procura conta cont'#225'bil'
                    end
                    inherited dtxDescricao: TtecDBText
                      Left = 87
                      Width = 291
                      DataField = 'descricao'
                      DataSource = fraDebitoCOFINSVenda.dsrProcuraDebitar
                    end
                    inherited edfCodigo: TtecDBFindLookup
                      Width = 60
                      DataField = 'contacofins'
                      DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
                      MaxLength = 8
                      LookupField = 'codigo'
                      LookupSource = fraDebitoCOFINSVenda.dsrProcuraDebitar
                      LookupQueryParameter = 'codigo'
                      Parameter = ' '
                      ActiveSetControls = False
                      DenyInsert = False
                      NoSetControls = <>
                      SetControls = <>
                      LookupParameter = 'codigo'
                    end
                    inherited qryProcuraDebitar: TtecQuery
                      Active = True
                      inherited qryProcuraDebitarcodigo: TIntegerField
                        DisplayFormat = '0'
                      end
                    end
                  end
                  object edtCofinsDebitarClass: TtecDBText
                    Left = 381
                    Top = 10
                    Width = 148
                    Height = 23
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'classificacao'
                    DataSource = fraDebitoCOFINSVenda.dsrProcuraDebitar
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
                end
                object gbxDebitarIRPJVendas: TGroupBox
                  Left = 0
                  Top = 93
                  Width = 532
                  Height = 36
                  Caption = ' DEBITAR IRPJ - IMPOSTO DE RENDA - PESSOA JUR'#205'DICA '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  inline fraIRPJDebitarVenda: TfraConsultaCodigoContabil
                    Left = 2
                    Top = 10
                    Width = 379
                    Height = 24
                    HorzScrollBar.Range = 365
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
                      Height = 23
                      Hint = 'Procura conta cont'#225'bil'
                    end
                    inherited dtxDescricao: TtecDBText
                      Left = 87
                      Width = 291
                      DataField = 'descricao'
                      DataSource = fraIRPJDebitarVenda.dsrProcuraDebitar
                    end
                    inherited edfCodigo: TtecDBFindLookup
                      DataField = 'contairpj'
                      DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
                      MaxLength = 8
                      LookupField = 'codigo'
                      LookupSource = fraIRPJDebitarVenda.dsrProcuraDebitar
                      LookupQueryParameter = 'codigo'
                      Parameter = ' '
                      ActiveSetControls = False
                      DenyInsert = False
                      NoSetControls = <>
                      SetControls = <>
                      LookupParameter = 'codigo'
                    end
                    inherited qryProcuraDebitar: TtecQuery
                      Active = True
                      inherited qryProcuraDebitarcodigo: TIntegerField
                        DisplayFormat = '0'
                      end
                    end
                  end
                  object dtxIRDebitarClass: TtecDBText
                    Left = 381
                    Top = 10
                    Width = 148
                    Height = 23
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'classificacao'
                    DataSource = fraIRPJDebitarVenda.dsrProcuraDebitar
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
                end
                object gbxDebitarCSLLVenda: TGroupBox
                  Left = 0
                  Top = 53
                  Width = 532
                  Height = 36
                  Caption = ' DEBITAR CSLL - CONTRIBUI'#199#195'O SOCIAL SOBRE O LUCRO L'#205'QUIDO '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  inline fraDebitarCSLLVenda: TfraConsultaCodigoContabil
                    Left = 2
                    Top = 10
                    Width = 379
                    Height = 24
                    HorzScrollBar.Range = 365
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
                      Height = 23
                      Hint = 'Procura conta cont'#225'bil'
                    end
                    inherited dtxDescricao: TtecDBText
                      Left = 87
                      Width = 291
                      DataField = 'descricao'
                      DataSource = fraDebitarCSLLVenda.dsrProcuraDebitar
                    end
                    inherited edfCodigo: TtecDBFindLookup
                      DataField = 'contacsll'
                      DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
                      MaxLength = 8
                      LookupField = 'codigo'
                      LookupSource = fraDebitarCSLLVenda.dsrProcuraDebitar
                      LookupQueryParameter = 'codigo'
                      Parameter = ' '
                      ActiveSetControls = False
                      DenyInsert = False
                      NoSetControls = <>
                      SetControls = <>
                      LookupParameter = 'codigo'
                    end
                    inherited qryProcuraDebitar: TtecQuery
                      Active = True
                      inherited qryProcuraDebitarcodigo: TIntegerField
                        DisplayFormat = '0'
                      end
                    end
                  end
                  object dtxCSLLDebitarClass: TtecDBText
                    Left = 381
                    Top = 10
                    Width = 148
                    Height = 23
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'classificacao'
                    DataSource = fraDebitarCSLLVenda.dsrProcuraDebitar
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
                end
                object gbxDebitarPISVenda: TGroupBox
                  Left = 0
                  Top = 133
                  Width = 532
                  Height = 36
                  Caption = ' DEBITAR PIS - PROGRAMA DE INTEGRA'#199#195'O SOCIAL '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 3
                  inline fraPISDebtarVenda: TfraConsultaCodigoContabil
                    Left = 2
                    Top = 10
                    Width = 379
                    Height = 24
                    HorzScrollBar.Range = 365
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
                      Height = 23
                      Hint = 'Procura conta cont'#225'bil'
                    end
                    inherited dtxDescricao: TtecDBText
                      Left = 87
                      Width = 291
                      DataField = 'descricao'
                      DataSource = fraPISDebtarVenda.dsrProcuraDebitar
                    end
                    inherited edfCodigo: TtecDBFindLookup
                      DataField = 'contapis'
                      DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
                      MaxLength = 8
                      LookupField = 'codigo'
                      LookupSource = fraPISDebtarVenda.dsrProcuraDebitar
                      LookupQueryParameter = 'codigo'
                      Parameter = ' '
                      ActiveSetControls = False
                      DenyInsert = False
                      NoSetControls = <>
                      SetControls = <>
                      LookupParameter = 'codigo'
                    end
                    inherited qryProcuraDebitar: TtecQuery
                      Active = True
                      inherited qryProcuraDebitarcodigo: TIntegerField
                        DisplayFormat = '0'
                      end
                    end
                  end
                  object dtxDebitarPISClass: TtecDBText
                    Left = 381
                    Top = 10
                    Width = 148
                    Height = 23
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'classificacao'
                    DataSource = fraPISDebtarVenda.dsrProcuraDebitar
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
                end
              end
              object gbxApropriacaoCustos: TGroupBox
                Left = 6
                Top = 107
                Width = 532
                Height = 89
                Caption = ' APROPRIA'#199#195'O DOS CUSTOS DOS IM'#211'VEIS '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
                object gbxDebitoCustosVenda: TGroupBox
                  Left = 0
                  Top = 13
                  Width = 532
                  Height = 36
                  Caption = ' DEBITAR VALOR DOS CUSTOS '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  inline fraDebitarCustosVenda: TfraConsultaCodigoContabil
                    Left = 2
                    Top = 11
                    Width = 379
                    Height = 23
                    HorzScrollBar.Range = 365
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
                      Hint = 'Procura conta cont'#225'bil'
                    end
                    inherited dtxDescricao: TtecDBText
                      Left = 87
                      Width = 291
                      DataField = 'descricao'
                      DataSource = fraDebitarCustosVenda.dsrProcuraDebitar
                    end
                    inherited edfCodigo: TtecDBFindLookup
                      DataField = 'debitocustos'
                      DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
                      MaxLength = 8
                      LookupField = 'codigo'
                      LookupSource = fraDebitarCustosVenda.dsrProcuraDebitar
                      LookupQueryParameter = 'codigo'
                      Parameter = ' '
                      ActiveSetControls = False
                      DenyInsert = False
                      NoSetControls = <>
                      SetControls = <>
                      LookupParameter = 'codigo'
                    end
                    inherited qryProcuraDebitar: TtecQuery
                      Active = True
                      inherited qryProcuraDebitarcodigo: TIntegerField
                        DisplayFormat = '0'
                      end
                    end
                    inherited qryProcuraCreditar: TtecQuery
                      inherited qryProcuraCreditarcodigo: TIntegerField
                        DisplayFormat = '0'
                      end
                    end
                  end
                  object dtxDebitoCustos: TtecDBText
                    Left = 381
                    Top = 10
                    Width = 148
                    Height = 23
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'classificacao'
                    DataSource = fraDebitarCustosVenda.dsrProcuraDebitar
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
                end
                object gbxCreditoCustosVendas: TGroupBox
                  Left = 0
                  Top = 53
                  Width = 532
                  Height = 36
                  Caption = ' CREDITAR VALOR DOS CUSTOS '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  inline fraCreditarCustosVenda: TfraConsultaCodigoContabil
                    Left = 2
                    Top = 11
                    Width = 379
                    Height = 23
                    HorzScrollBar.Range = 365
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
                      Hint = 'Procura conta cont'#225'bil'
                    end
                    inherited dtxDescricao: TtecDBText
                      Left = 87
                      Width = 291
                      DataField = 'descricao'
                      DataSource = fraCreditarCustosVenda.dsrProcuraCreditar
                    end
                    inherited edfCodigo: TtecDBFindLookup
                      DataField = 'creditocustos'
                      DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
                      MaxLength = 8
                      LookupField = 'codigo'
                      LookupSource = fraCreditarCustosVenda.dsrProcuraCreditar
                      LookupQueryParameter = 'codigo'
                      Parameter = ' '
                      ActiveSetControls = False
                      DenyInsert = False
                      NoSetControls = <>
                      SetControls = <>
                      LookupParameter = 'codigo'
                    end
                    inherited qryProcuraCreditar: TtecQuery
                      Active = True
                      inherited qryProcuraCreditarcodigo: TIntegerField
                        DisplayFormat = '0'
                      end
                    end
                  end
                  object tecDBText13: TtecDBText
                    Left = 381
                    Top = 10
                    Width = 148
                    Height = 23
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'classificacao'
                    DataSource = fraCreditarCustosVenda.dsrProcuraCreditar
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
                end
              end
              object gbxApropriacaoVendaImovel: TGroupBox
                Left = 6
                Top = 45
                Width = 532
                Height = 50
                Caption = ' APROPRIA'#199#195'O DO VALOR DA VENDA DO IM'#211'VEL '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                object gbxCreVenda: TGroupBox
                  Left = 0
                  Top = 13
                  Width = 532
                  Height = 36
                  Caption = ' CREDITAR O VALOR TOTAL NA VENDA DE IM'#211'VEL '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  inline fraCreditoVenda: TfraConsultaCodigoContabil
                    Left = 2
                    Top = 11
                    Width = 379
                    Height = 23
                    HorzScrollBar.Range = 365
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
                      Hint = 'Procura conta cont'#225'bil'
                    end
                    inherited dtxDescricao: TtecDBText
                      Left = 87
                      Width = 291
                      DataField = 'descricao'
                      DataSource = fraCreditoVenda.dsrProcuraCreditar
                    end
                    inherited edfCodigo: TtecDBFindLookup
                      DataField = 'contavenda'
                      DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
                      MaxLength = 8
                      LookupField = 'codigo'
                      LookupSource = fraCreditoVenda.dsrProcuraCreditar
                      LookupQueryParameter = 'codigo'
                      Parameter = ' '
                      ActiveSetControls = False
                      DenyInsert = False
                      NoSetControls = <>
                      SetControls = <>
                      LookupParameter = 'codigo'
                    end
                    inherited qryProcuraCreditar: TtecQuery
                      Active = True
                      inherited qryProcuraCreditarcodigo: TIntegerField
                        DisplayFormat = '0'
                      end
                    end
                  end
                  object dtxCreditoVendaClass: TtecDBText
                    Left = 381
                    Top = 10
                    Width = 148
                    Height = 23
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'classificacao'
                    DataSource = fraCreditoVenda.dsrProcuraCreditar
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
                end
              end
              object gbxApropriacaoDescontosRecebimentos: TGroupBox
                Left = 6
                Top = 389
                Width = 532
                Height = 50
                Caption = ' APROPRIA'#199#195'O DE DESCONTOS CONCEDIDOS NOS RECEBIMENTOS '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 4
                object grxDescontosConcedidos: TGroupBox
                  Left = 0
                  Top = 13
                  Width = 532
                  Height = 36
                  Caption = ' DEBITAR DESCONTOS CONCEDIDOS NOS RECEBIMENTOS '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  inline fraDebitarDescontosConcedidos: TfraConsultaCodigoContabil
                    Left = 2
                    Top = 11
                    Width = 379
                    Height = 23
                    HorzScrollBar.Range = 365
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
                      Hint = 'Procura conta cont'#225'bil'
                    end
                    inherited dtxDescricao: TtecDBText
                      Left = 87
                      Width = 291
                      DataField = 'descricao'
                      DataSource = fraDebitarDescontosConcedidos.dsrProcuraDebitar
                    end
                    inherited edfCodigo: TtecDBFindLookup
                      DataField = 'debitodescontorecebimento'
                      DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
                      MaxLength = 8
                      LookupField = 'codigo'
                      LookupSource = fraDebitarDescontosConcedidos.dsrProcuraDebitar
                      LookupQueryParameter = 'codigo'
                      Parameter = ' '
                      ActiveSetControls = False
                      DenyInsert = False
                      NoSetControls = <>
                      SetControls = <>
                      LookupParameter = 'codigo'
                    end
                    inherited qryProcuraDebitar: TtecQuery
                      Active = True
                      inherited qryProcuraDebitarcodigo: TIntegerField
                        DisplayFormat = '0'
                      end
                    end
                    inherited qryProcuraCreditar: TtecQuery
                      inherited qryProcuraCreditarcodigo: TIntegerField
                        DisplayFormat = '0'
                      end
                    end
                  end
                  object dtxDebitarDescontosRecebimentos: TtecDBText
                    Left = 381
                    Top = 10
                    Width = 148
                    Height = 23
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'classificacao'
                    DataSource = fraDebitarDescontosConcedidos.dsrProcuraDebitar
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
                end
              end
              object gbxApropriacaoAVP: TGroupBox
                Left = 6
                Top = 451
                Width = 532
                Height = 89
                Caption = ' APROPRIA'#199#195'O DO AVP - AJUSTE A VALOR PRESENTE '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 5
                object gbxAVPCurtoPrazo: TGroupBox
                  Left = 0
                  Top = 13
                  Width = 532
                  Height = 36
                  Caption = ' CONTA PARA AVP DE CURTO PRAZO '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  inline fraAVPCurtoPrazo: TfraConsultaCodigoContabil
                    Left = 2
                    Top = 11
                    Width = 379
                    Height = 23
                    HorzScrollBar.Range = 365
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
                      Hint = 'Procura conta cont'#225'bil'
                    end
                    inherited dtxDescricao: TtecDBText
                      Left = 87
                      Width = 291
                      DataField = 'descricao'
                      DataSource = fraAVPCurtoPrazo.dsrProcuraCreditar
                    end
                    inherited edfCodigo: TtecDBFindLookup
                      DataField = 'AVPCurtoPrazo'
                      DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
                      MaxLength = 8
                      LookupField = 'codigo'
                      LookupSource = fraAVPCurtoPrazo.dsrProcuraCreditar
                      LookupQueryParameter = 'codigo'
                      Parameter = ' '
                      ActiveSetControls = False
                      DenyInsert = False
                      NoSetControls = <>
                      SetControls = <>
                      LookupParameter = 'codigo'
                    end
                    inherited qryProcuraDebitar: TtecQuery
                      inherited qryProcuraDebitarcodigo: TIntegerField
                        DisplayFormat = '0'
                      end
                    end
                    inherited qryProcuraCreditar: TtecQuery
                      Active = True
                      inherited qryProcuraCreditarcodigo: TIntegerField
                        DisplayFormat = '0'
                      end
                    end
                  end
                  object tecDBText29: TtecDBText
                    Left = 381
                    Top = 10
                    Width = 148
                    Height = 23
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'classificacao'
                    DataSource = fraAVPCurtoPrazo.dsrProcuraCreditar
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
                end
                object gbxAVPLongPrazo: TGroupBox
                  Left = 0
                  Top = 53
                  Width = 532
                  Height = 36
                  Caption = ' CONTA PARA AVP DE LONGO PRAZO '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  inline fraAVPLongoPrazo: TfraConsultaCodigoContabil
                    Left = 2
                    Top = 11
                    Width = 379
                    Height = 23
                    HorzScrollBar.Range = 365
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
                      Hint = 'Procura conta cont'#225'bil'
                    end
                    inherited dtxDescricao: TtecDBText
                      Left = 87
                      Width = 291
                      DataField = 'descricao'
                      DataSource = fraAVPLongoPrazo.dsrProcuraCreditar
                    end
                    inherited edfCodigo: TtecDBFindLookup
                      DataField = 'AVPLongoPrazo'
                      DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
                      MaxLength = 8
                      LookupField = 'codigo'
                      LookupSource = fraAVPLongoPrazo.dsrProcuraCreditar
                      LookupQueryParameter = 'codigo'
                      Parameter = ' '
                      ActiveSetControls = False
                      DenyInsert = False
                      NoSetControls = <>
                      SetControls = <>
                      LookupParameter = 'codigo'
                    end
                    inherited qryProcuraCreditar: TtecQuery
                      Active = True
                      inherited qryProcuraCreditarcodigo: TIntegerField
                        DisplayFormat = '0'
                      end
                    end
                  end
                  object tecDBText30: TtecDBText
                    Left = 381
                    Top = 10
                    Width = 148
                    Height = 23
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'classificacao'
                    DataSource = fraAVPLongoPrazo.dsrProcuraCreditar
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
                end
              end
              object gbxAVPTaxaDesconto: TGroupBox
                Left = 568
                Top = 481
                Width = 70
                Height = 36
                Caption = ' PARA AVP '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 6
                object DBEditNumero2: TDBEditNumero
                  Left = 1
                  Top = 10
                  Width = 51
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
                  Text = '2,0000'
                  Mascara = True
                  Alignment = taLeftJustify
                  TipoMascara = tmGERAL
                  NrDecimal = 4
                  Decimais = True
                  Negativo = False
                  Tamanho = 10
                  DataField = 'AVPTaxaDesconto'
                  DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
                end
                object stxAVPPercentual: TStaticText
                  Left = 55
                  Top = 14
                  Width = 14
                  Height = 18
                  Caption = '%'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                end
              end
              object gbxEstoqueConcluidos: TGroupBox
                Left = 6
                Top = 6
                Width = 532
                Height = 36
                Caption = ' CONTA DE ESTOQUE DE IM'#211'VEIS CONCLU'#205'DOS '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                inline fraEstoqueImoveisConcluidos: TfraConsultaCodigoContabil
                  Left = 2
                  Top = 11
                  Width = 379
                  Height = 23
                  HorzScrollBar.Range = 365
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
                    Hint = 'Procura conta cont'#225'bil'
                  end
                  inherited dtxDescricao: TtecDBText
                    Left = 87
                    Width = 291
                    DataField = 'descricao'
                    DataSource = fraCreditoVenda.dsrProcuraCreditar
                  end
                  inherited edfCodigo: TtecDBFindLookup
                    DataField = 'EstoquesImoveisConcluidos'
                    DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
                    MaxLength = 8
                    LookupField = 'codigo'
                    LookupSource = fraCreditoVenda.dsrProcuraCreditar
                    LookupQueryParameter = 'codigo'
                    Parameter = ' '
                    ActiveSetControls = False
                    DenyInsert = False
                    NoSetControls = <>
                    SetControls = <>
                    LookupParameter = 'codigo'
                  end
                  inherited qryProcuraCreditar: TtecQuery
                    inherited qryProcuraCreditarcodigo: TIntegerField
                      DisplayFormat = '0'
                    end
                  end
                end
                object tecDBText12: TtecDBText
                  Left = 381
                  Top = 10
                  Width = 148
                  Height = 23
                  TabStop = False
                  Color = clBtnFace
                  DataField = 'classificacao'
                  DataSource = fraCreditoVenda.dsrProcuraCreditar
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
              end
            end
            object tstEntregaChaves: TTabSheet
              Caption = ' &Entrega das Chaves'
              ImageIndex = 2
              object gbxImpostosChaves: TGroupBox
                Left = 6
                Top = 318
                Width = 532
                Height = 179
                Caption = ' TRANSFER'#202'NCIA DOS IMPOSTOS NA ENTREGA DAS CHAVES '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 3
                object gbxCOFINSChaves: TGroupBox
                  Left = 0
                  Top = 15
                  Width = 532
                  Height = 36
                  Caption = 
                    ' CREDITAR COFINS - CONTRIBUI'#199#195'O PARA O FINANCIAMENTO DA SEGURIDA' +
                    'DE SOCIAL '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  object tecDBText3: TtecDBText
                    Left = 381
                    Top = 10
                    Width = 148
                    Height = 23
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'classificacao'
                    DataSource = fraDebitoCOFINSVenda.dsrProcuraDebitar
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
                  object tecDBText1: TtecDBText
                    Left = 4
                    Top = 10
                    Width = 85
                    Height = 23
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'contacofins'
                    DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
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
                  object tecDBText2: TtecDBText
                    Left = 87
                    Top = 10
                    Width = 294
                    Height = 23
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'descricao'
                    DataSource = fraDebitoCOFINSVenda.dsrProcuraDebitar
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 2
                    Alignment = taLeftJustify
                  end
                end
                object gbxCSLLChaves: TGroupBox
                  Left = 0
                  Top = 55
                  Width = 532
                  Height = 36
                  Caption = ' CREDITAR CSLL - CONTRIBUI'#199#195'O SOCIAL SOBRE O LUCRO L'#205'QUIDO '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  object tecDBText4: TtecDBText
                    Left = 381
                    Top = 10
                    Width = 148
                    Height = 23
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'classificacao'
                    DataSource = fraDebitarCSLLVenda.dsrProcuraDebitar
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
                  object tecDBText5: TtecDBText
                    Left = 4
                    Top = 10
                    Width = 85
                    Height = 23
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'contacsll'
                    DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
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
                  object tecDBText6: TtecDBText
                    Left = 87
                    Top = 10
                    Width = 294
                    Height = 23
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'descricao'
                    DataSource = fraDebitarCSLLVenda.dsrProcuraDebitar
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 2
                    Alignment = taLeftJustify
                  end
                end
                object gbxIRPJChaves: TGroupBox
                  Left = 0
                  Top = 95
                  Width = 532
                  Height = 36
                  Caption = 'CREDITAR IRPJ - IMPOSTO DE RENDA - PESSOA JUR'#205'DICA'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  object tecDBText14: TtecDBText
                    Left = 381
                    Top = 10
                    Width = 148
                    Height = 23
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'classificacao'
                    DataSource = fraIRPJDebitarVenda.dsrProcuraDebitar
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
                  object tecDBText15: TtecDBText
                    Left = 4
                    Top = 10
                    Width = 85
                    Height = 23
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'contairpj'
                    DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
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
                  object tecDBText16: TtecDBText
                    Left = 87
                    Top = 10
                    Width = 294
                    Height = 23
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'descricao'
                    DataSource = fraIRPJDebitarVenda.dsrProcuraDebitar
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 2
                    Alignment = taLeftJustify
                  end
                end
                object GroupBox5: TGroupBox
                  Left = 0
                  Top = 135
                  Width = 532
                  Height = 36
                  Caption = 'CREDITAR PIS - PROGRAMA DE INTEGRA'#199#195'O SOCIAL'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 3
                  object tecDBText17: TtecDBText
                    Left = 381
                    Top = 10
                    Width = 148
                    Height = 23
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'classificacao'
                    DataSource = fraPISDebtarVenda.dsrProcuraDebitar
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
                  object tecDBText18: TtecDBText
                    Left = 4
                    Top = 10
                    Width = 85
                    Height = 23
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'contapis'
                    DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
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
                  object tecDBText19: TtecDBText
                    Left = 87
                    Top = 10
                    Width = 294
                    Height = 23
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'descricao'
                    DataSource = fraPISDebtarVenda.dsrProcuraDebitar
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 2
                    Alignment = taLeftJustify
                  end
                end
              end
              object gbxTransferenciaCustos: TGroupBox
                Left = 6
                Top = 110
                Width = 532
                Height = 98
                Caption = ' TRANSFER'#202'NCIA DOS CUSTOS DO IM'#211'VEL '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                object gbxDebitarTransferenciaCustos: TGroupBox
                  Left = 0
                  Top = 15
                  Width = 532
                  Height = 36
                  Caption = ' DEBITAR VALOR DOS CUSTOS DO IM'#211'VEL '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  inline fraChavesDebitarCustos: TfraConsultaCodigoContabil
                    Left = 2
                    Top = 11
                    Width = 379
                    Height = 23
                    HorzScrollBar.Range = 365
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
                      Left = 87
                      Width = 291
                      DataField = 'descricao'
                      DataSource = fraChavesDebitarCustos.dsrProcuraDebitar
                    end
                    inherited edfCodigo: TtecDBFindLookup
                      DataField = 'debitocustochaves'
                      DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
                      MaxLength = 8
                      LookupField = 'codigo'
                      LookupSource = fraChavesDebitarCustos.dsrProcuraDebitar
                      LookupQueryParameter = 'codigo'
                      Parameter = ' '
                      ActiveSetControls = False
                      DenyInsert = False
                      NoSetControls = <>
                      SetControls = <>
                      LookupParameter = 'codigo'
                    end
                    inherited qryProcuraDebitar: TtecQuery
                      Active = True
                      inherited qryProcuraDebitarcodigo: TIntegerField
                        DisplayFormat = '0'
                      end
                    end
                    inherited qryProcuraCreditar: TtecQuery
                      inherited qryProcuraCreditarcodigo: TIntegerField
                        DisplayFormat = '0'
                      end
                    end
                  end
                  object tecDBText7: TtecDBText
                    Left = 381
                    Top = 10
                    Width = 148
                    Height = 23
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'classificacao'
                    DataSource = fraChavesDebitarCustos.dsrProcuraDebitar
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
                end
                object GroupBox7: TGroupBox
                  Left = 0
                  Top = 55
                  Width = 532
                  Height = 36
                  Caption = ' CREDITAR VALOR DOS CUSTOS DO IM'#211'VEL '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  object tecDBText20: TtecDBText
                    Left = 381
                    Top = 10
                    Width = 148
                    Height = 23
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'classificacao'
                    DataSource = fraDebitarCustosVenda.dsrProcuraDebitar
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
                  object tecDBText21: TtecDBText
                    Left = 4
                    Top = 10
                    Width = 85
                    Height = 23
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'debitocustos'
                    DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
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
                  object tecDBText22: TtecDBText
                    Left = 87
                    Top = 10
                    Width = 294
                    Height = 23
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'descricao'
                    DataSource = fraDebitarCustosVenda.dsrProcuraDebitar
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 2
                    Alignment = taLeftJustify
                  end
                end
              end
              object gbxTransferenciaValorVenda: TGroupBox
                Left = 6
                Top = 6
                Width = 532
                Height = 98
                Caption = ' TRANSFER'#202'NCIA DO VALOR DA VENDA '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                object GroupBox4: TGroupBox
                  Left = 0
                  Top = 16
                  Width = 532
                  Height = 36
                  Caption = ' DEBITAR VALOR DA VENDA '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  object tecDBText10: TtecDBText
                    Left = 381
                    Top = 10
                    Width = 148
                    Height = 23
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'classificacao'
                    DataSource = fraCreditoVenda.dsrProcuraCreditar
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
                  object tecDBText8: TtecDBText
                    Left = 2
                    Top = 10
                    Width = 85
                    Height = 23
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'contavenda'
                    DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
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
                  object tecDBText23: TtecDBText
                    Left = 87
                    Top = 10
                    Width = 294
                    Height = 23
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'descricao'
                    DataSource = fraCreditoVenda.dsrProcuraCreditar
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 2
                    Alignment = taLeftJustify
                  end
                end
                object GroupBox6: TGroupBox
                  Left = 0
                  Top = 56
                  Width = 532
                  Height = 36
                  Caption = ' CREDITAR VALOR DA VENDA '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  inline fraChavesCreditarVenda: TfraConsultaCodigoContabil
                    Left = 2
                    Top = 11
                    Width = 379
                    Height = 23
                    HorzScrollBar.Range = 365
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
                      Left = 87
                      Width = 291
                      DataField = 'descricao'
                      DataSource = fraChavesCreditarVenda.dsrProcuraCreditar
                    end
                    inherited edfCodigo: TtecDBFindLookup
                      DataField = 'creditovendachaves'
                      DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
                      MaxLength = 8
                      LookupField = 'codigo'
                      LookupSource = fraChavesCreditarVenda.dsrProcuraCreditar
                      LookupQueryParameter = 'codigo'
                      Parameter = ' '
                      ActiveSetControls = False
                      DenyInsert = False
                      NoSetControls = <>
                      SetControls = <>
                      LookupParameter = 'codigo'
                    end
                    inherited qryProcuraCreditar: TtecQuery
                      Active = True
                      inherited qryProcuraCreditarcodigo: TIntegerField
                        DisplayFormat = '0'
                      end
                    end
                  end
                  object tecDBText11: TtecDBText
                    Left = 381
                    Top = 10
                    Width = 148
                    Height = 23
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'classificacao'
                    DataSource = fraChavesCreditarVenda.dsrProcuraCreditar
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
                end
              end
              object gbxDebitarAbatimentos: TGroupBox
                Left = 6
                Top = 505
                Width = 532
                Height = 38
                Caption = ' DEBITAR ABATIMENTOS E DESCONTOS CONCEDIDOS '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 4
                inline fraDebitarDescontosConcedidosChaves: TfraConsultaCodigoContabil
                  Left = 2
                  Top = 13
                  Width = 379
                  Height = 23
                  HorzScrollBar.Range = 365
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
                    Left = 87
                    Width = 291
                    DataField = 'descricao'
                    DataSource = fraDebitarDescontosConcedidosChaves.dsrProcuraDebitar
                  end
                  inherited edfCodigo: TtecDBFindLookup
                    DataField = 'debitodescontoconcedidos'
                    DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
                    MaxLength = 8
                    LookupField = 'codigo'
                    LookupSource = fraDebitarDescontosConcedidosChaves.dsrProcuraDebitar
                    LookupQueryParameter = 'codigo'
                    Parameter = ' '
                    ActiveSetControls = False
                    DenyInsert = False
                    NoSetControls = <>
                    SetControls = <>
                    LookupParameter = 'codigo'
                  end
                  inherited qryProcuraDebitar: TtecQuery
                    Active = True
                    inherited qryProcuraDebitarcodigo: TIntegerField
                      DisplayFormat = '0'
                    end
                  end
                  inherited qryProcuraCreditar: TtecQuery
                    inherited qryProcuraCreditarcodigo: TIntegerField
                      DisplayFormat = '0'
                    end
                  end
                end
                object tecDBText24: TtecDBText
                  Left = 381
                  Top = 12
                  Width = 148
                  Height = 23
                  TabStop = False
                  Color = clBtnFace
                  DataField = 'classificacao'
                  DataSource = fraDebitarDescontosConcedidosChaves.dsrProcuraDebitar
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
              end
              object gbxTransferenciaDespesasVendas: TGroupBox
                Left = 6
                Top = 214
                Width = 532
                Height = 98
                Caption = ' TRANSFER'#202'NCIA DAS DESPESAS DE VENDA '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
                object GroupBox8: TGroupBox
                  Left = 0
                  Top = 53
                  Width = 532
                  Height = 36
                  Caption = ' CREDITAR DESPESAS DE VENDAS '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  inline fraCreditoDespesasVenda: TfraConsultaCodigoContabil
                    Left = 2
                    Top = 11
                    Width = 379
                    Height = 23
                    HorzScrollBar.Range = 365
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
                      Left = 87
                      Width = 291
                      DataField = 'descricao'
                      DataSource = fraCreditoDespesasVenda.dsrProcuraDebitar
                    end
                    inherited edfCodigo: TtecDBFindLookup
                      DataField = 'creditodespesasvenda'
                      DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
                      MaxLength = 8
                      LookupField = 'codigo'
                      LookupSource = fraCreditoDespesasVenda.dsrProcuraDebitar
                      LookupQueryParameter = 'codigo'
                      Parameter = ' '
                      ActiveSetControls = False
                      DenyInsert = False
                      NoSetControls = <>
                      SetControls = <>
                      LookupParameter = 'codigo'
                    end
                    inherited qryProcuraDebitar: TtecQuery
                      Active = True
                      inherited qryProcuraDebitarcodigo: TIntegerField
                        DisplayFormat = '0'
                      end
                    end
                    inherited qryProcuraCreditar: TtecQuery
                      inherited qryProcuraCreditarcodigo: TIntegerField
                        DisplayFormat = '0'
                      end
                    end
                  end
                  object tecDBText25: TtecDBText
                    Left = 381
                    Top = 10
                    Width = 148
                    Height = 23
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'classificacao'
                    DataSource = fraCreditoDespesasVenda.dsrProcuraDebitar
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
                end
                object GroupBox9: TGroupBox
                  Left = 0
                  Top = 15
                  Width = 532
                  Height = 36
                  Caption = ' DEBITAR DESPESAS DE VENDAS '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  object tecDBText26: TtecDBText
                    Left = 381
                    Top = 10
                    Width = 148
                    Height = 23
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'classificacaoplanocontasdebitardespesasvendas'
                    DataSource = dtmcadastroempreendimentos.dsrParametrosContasImoveis
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
                  object tecDBText27: TtecDBText
                    Left = 4
                    Top = 10
                    Width = 85
                    Height = 23
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'debitardespesasvenda'
                    DataSource = dtmcadastroempreendimentos.dsrParametrosContasImoveis
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
                  object tecDBText28: TtecDBText
                    Left = 87
                    Top = 10
                    Width = 294
                    Height = 23
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'descricaoplanocontasdebitardespesasvendas'
                    DataSource = dtmcadastroempreendimentos.dsrParametrosContasImoveis
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 2
                    Alignment = taLeftJustify
                  end
                end
              end
            end
            object tstAtualizacaoMonetaria: TTabSheet
              Caption = ' &Atualiza'#231#227'o Monet'#225'ria'
              ImageIndex = 3
              object gbxAtualizacaoMonetaria: TGroupBox
                Left = 6
                Top = 6
                Width = 518
                Height = 36
                Caption = 
                  ' CREDITAR ATUALIZA'#199#195'O MONET'#193'RIA SOBRE SALDO DEVEDOR PARA IM'#211'VEIS' +
                  ' N'#195'O ENTREGUES '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                inline fraCreditarAtualizacaoMonetaria: TfraConsultaCodigoContabil
                  Left = 2
                  Top = 11
                  Width = 365
                  Height = 23
                  HorzScrollBar.Range = 365
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
                    Left = 87
                    Width = 278
                    DataField = 'descricao'
                    DataSource = fraCreditarAtualizacaoMonetaria.dsrProcuraCreditar
                  end
                  inherited edfCodigo: TtecDBFindLookup
                    DataField = 'creditoatualizacaomonetaria'
                    DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
                    MaxLength = 8
                    LookupField = 'codigo'
                    LookupSource = fraCreditarAtualizacaoMonetaria.dsrProcuraCreditar
                    LookupQueryParameter = 'codigo'
                    Parameter = ' '
                    ActiveSetControls = False
                    DenyInsert = False
                    NoSetControls = <>
                    SetControls = <>
                    LookupParameter = 'codigo'
                  end
                  inherited qryProcuraCreditar: TtecQuery
                    Active = True
                    inherited qryProcuraCreditarcodigo: TIntegerField
                      DisplayFormat = '0'
                    end
                  end
                end
                object tecDBText9: TtecDBText
                  Left = 367
                  Top = 10
                  Width = 148
                  Height = 23
                  TabStop = False
                  Color = clBtnFace
                  DataField = 'classificacao'
                  DataSource = fraCreditarAtualizacaoMonetaria.dsrProcuraCreditar
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
              end
            end
          end
        end
      end
      object gbxHabite_se: TGroupBox
        Left = 440
        Top = 49
        Width = 80
        Height = 36
        Caption = ' HABITE-SE '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object edtDataHabitese: TDBEditData
          Left = 2
          Top = 10
          Width = 75
          Height = 23
          Alignment = taCenter
          DataField = 'datahabitese'
          DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          Maximo = 10000
          Minimo = 37353
          Adicional = 0
          ParentFont = False
          TabOrder = 0
          OnExit = edtDataHabiteseExit
          Opcional = True
        end
      end
      object gbxAreaTerreno: TGroupBox
        Left = 430
        Top = 89
        Width = 105
        Height = 36
        Caption = ' '#193'REA TERRENO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        object DBEditNumero1: TDBEditNumero
          Left = 2
          Top = 10
          Width = 100
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
          Text = '1,0000'
          Mascara = True
          Alignment = taLeftJustify
          TipoMascara = tmGERAL
          NrDecimal = 4
          Decimais = True
          Negativo = False
          Tamanho = 10
          DataField = 'areaterreno'
          DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
        end
      end
      object drgF200_03: TtecDBRadioGroup
        Left = 10
        Top = 129
        Width = 315
        Height = 123
        Caption = ' TIPO DE UNIDADE IMOBILI'#193'RIA VENDIDA  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        TabStop = False
        DataField = 'unid_imob'
        DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
        object rbnF200_03_01: TtecRadioButton
          Left = 6
          Top = 15
          Width = 300
          Height = 17
          Caption = '01 - Terreno adquirido para venda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Value = '01'
        end
        object rbnF200_03_02: TtecRadioButton
          Left = 6
          Top = 32
          Width = 300
          Height = 17
          Caption = '02 - Terreno decorrente de loteamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Value = '02'
        end
        object rbnF200_03_03: TtecRadioButton
          Left = 6
          Top = 49
          Width = 300
          Height = 17
          Caption = '03 - Lote oriundo de desmembramento de terreno'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Value = '03'
        end
        object rbnF200_03_04: TtecRadioButton
          Left = 6
          Top = 66
          Width = 303
          Height = 17
          Caption = '04 - Unidade resultante de incorpora'#231#227'o imobili'#225'ria'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Value = '04'
        end
        object rbnF200_03_05: TtecRadioButton
          Left = 6
          Top = 83
          Width = 300
          Height = 17
          Caption = '05 - Pr'#233'dio constru'#237'do/em constru'#231#227'o para venda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          Value = '05'
        end
        object rbnF200_03_06: TtecRadioButton
          Left = 6
          Top = 100
          Width = 300
          Height = 17
          Caption = '06 - Outras'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          Value = '06'
        end
      end
      object drgF200_21: TtecDBRadioGroup
        Left = 331
        Top = 129
        Width = 218
        Height = 103
        Caption = ' NATUREZA DO EMPREENDIMENTO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        TabStop = False
        DataField = 'ind_nat_emp'
        DataSource = dtmcadastroempreendimentos.dsrEmpreendimentos
        object lblParticipacao: TLabel
          Left = 41
          Top = 46
          Width = 67
          Height = 15
          Caption = 'participa'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object rbnF200_21_01: TtecRadioButton
          Left = 6
          Top = 15
          Width = 92
          Height = 17
          Caption = '1 - Cons'#243'rcio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Value = '1'
        end
        object rbnF200_21_02: TtecRadioButton
          Left = 6
          Top = 31
          Width = 207
          Height = 17
          Caption = '2 - SCP - sociedade em conta de'
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
        object rbnF200_21_03: TtecRadioButton
          Left = 6
          Top = 62
          Width = 195
          Height = 17
          Caption = '3 - Incorpora'#231#227'o em condom'#237'nio'
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
        object rbnF200_21_04: TtecRadioButton
          Left = 6
          Top = 79
          Width = 97
          Height = 17
          Caption = '4 - Outras'
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
      end
      object gbxAreasEmpreendimento: TGroupBox
        Left = 556
        Top = 72
        Width = 115
        Height = 171
        Caption = ' EMPREENDIMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
        object gbxAreaTotal: TGroupBox
          Left = 0
          Top = 95
          Width = 115
          Height = 36
          Caption = ' '#193'REA TOTAL '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object dtxAreaTotal: TtecDBText
            Left = 2
            Top = 10
            Width = 110
            Height = 23
            TabStop = False
            Color = clBtnFace
            DataField = 'AreaTotal'
            DataSource = dtmcadastroempreendimentos.dsrImoveis
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
        object GroupBox1: TGroupBox
          Left = 0
          Top = 15
          Width = 115
          Height = 36
          Caption = ' '#193'REA PRIVATIVA '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object dtxAreaPrivativa: TtecDBText
            Left = 2
            Top = 10
            Width = 110
            Height = 23
            TabStop = False
            Color = clBtnFace
            DataField = 'AreaPrivativa'
            DataSource = dtmcadastroempreendimentos.dsrImoveis
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
        object GroupBox2: TGroupBox
          Left = 0
          Top = 55
          Width = 115
          Height = 36
          Caption = ' '#193'REA COMUM '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object dtxAreaComum: TtecDBText
            Left = 2
            Top = 10
            Width = 110
            Height = 23
            TabStop = False
            Color = clBtnFace
            DataField = 'AreaComum'
            DataSource = dtmcadastroempreendimentos.dsrImoveis
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
        object gbxFracaoIdeal: TGroupBox
          Left = 0
          Top = 135
          Width = 115
          Height = 36
          Caption = ' FRA'#199#195'O IDEAL '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          object dtxFracaoIdeal: TtecDBText
            Left = 2
            Top = 10
            Width = 110
            Height = 23
            TabStop = False
            Color = clBtnFace
            DataField = 'fracaoideal'
            DataSource = dtmcadastroempreendimentos.dsrImoveis
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
  end
end
