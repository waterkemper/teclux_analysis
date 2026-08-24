inherited frmCadastroSetoresProducao: TfrmCadastroSetoresProducao
  Left = 661
  Top = 288
  ActiveControl = edfCodigo
  Caption = 'Cadastro de Setores de Produ'#231#227'o'
  ClientHeight = 433
  ClientWidth = 580
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 0
    Top = 45
    Width = 580
    Height = 388
    Align = alClient
    BevelOuter = bvNone
    Visible = True
    inherited bvlBotoesEd: TBevel
      Left = 0
      Top = 388
      Width = 580
      Height = 0
      Align = alBottom
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 580
      Height = 388
      ActivePage = tstCadastro
      Align = alClient
      TabOrder = 0
      object tstCadastro: TTabSheet
        Caption = ' Cadastro'
        object lblCustoHomemHora: TLabel
          Left = 80
          Top = 52
          Width = 65
          Height = 12
          Hint = 
            'Custo m'#233'dio do homem-hora do setor a ser empregado no c'#225'lculo do' +
            ' custo de resistores/supressores'
          Caption = 'CUSTO M'#201'DIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object gbxDescricao: TGroupBox
          Left = 68
          Top = 12
          Width = 330
          Height = 37
          Caption = ' DESCRI'#199#195'O '
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
            Top = 10
            Width = 325
            Height = 23
            DataField = 'descricao'
            DataSource = dtmCadastroSetoresProducao.dsrSetoresProducao
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
        object gbxCodigoMaquina: TGroupBox
          Left = 6
          Top = 12
          Width = 55
          Height = 36
          Caption = 'C'#211'DIGO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object edfCodigo: TtecDbEditFind
            Left = 2
            Top = 10
            Width = 50
            Height = 23
            Alignment = taLeftJustify
            CharCase = ecUpperCase
            DataField = 'codigo'
            DataSource = dtmCadastroSetoresProducao.dsrSetoresProducao
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Group = 'maquina'
            MaxLength = 4
            Maximo = 0
            Minimo = 37353
            Adicional = 0
            Opcional = True
            ParentFont = False
            TabOrder = 0
            PermitirZero = False
            PermitirNulo = False
            Operacao = opATRIBUICAO
            Parameter = 'codigo'
            ActiveSetControls = True
            DenyInsert = True
            NoSetControls = <>
            SetControls = <
              item
                Control = gbxDescricao
              end
              item
                Control = pgcIndicadores
              end
              item
                Control = tstLog
              end>
          end
        end
        object pgcIndicadores: TPageControl
          Left = 0
          Top = 100
          Width = 572
          Height = 257
          ActivePage = tstLideres
          Align = alBottom
          TabOrder = 4
          object tstLideres: TTabSheet
            Caption = ' L'#237'deres '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            object sbnIncluirLiderdoSetor: TSpeedButton
              Left = 525
              Top = 21
              Width = 21
              Height = 21
              Hint = 'Incluir L'#237'der do Setor'
              Flat = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C37F7F7F7F7F7F7F7F7F8080808080807F7F7F7F7F7F7F7F7F7F7F
                7F808080C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C30000000000000000000000000000000000000000000000000000000000
                00808080C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F
                7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                00808080C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
                C3C3C3C3C3FFFFFFFFFFFFFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
                00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
                C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
                C3C37F7F7FFFFFFFC3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
                C3C37F7F7FFFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFF
                FFFF7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3000000000000000000000000000000000000C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F
                7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
              NumGlyphs = 2
              OnClick = sbnIncluirLiderdoSetorClick
            end
            object sbnExcluirLiderdoSetor: TSpeedButton
              Left = 525
              Top = 43
              Width = 21
              Height = 21
              Hint = 'Excluir L'#237'der do Setor'
              Flat = True
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
              OnClick = sbnExcluirLiderdoSetorClick
            end
            object gbxLideresdoSetor: TGroupBox
              Left = 0
              Top = 0
              Width = 518
              Height = 226
              Align = alLeft
              Caption = ' L'#205'DERES DO SETOR '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              object dbgLideresdoSetor: TtecDBGrid
                Left = 2
                Top = 16
                Width = 514
                Height = 208
                Align = alClient
                DataSource = dtmCadastroSetoresProducao.dsrSetoresProducaoLideres
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
                OnDblClick = dbgLideresdoSetorDblClick
                OnKeyDown = dbgLideresdoSetorKeyDown
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
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'datainiciallideranca'
                    Title.Alignment = taCenter
                    Title.Caption = 'IN'#205'CIO'
                    Width = 80
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'datafinallideranca'
                    Title.Alignment = taCenter
                    Title.Caption = 'T'#201'RMINO'
                    Width = 80
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'usuario'
                    Title.Alignment = taCenter
                    Title.Caption = 'USU'#193'RIO'
                    Width = 50
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'nomeusuario'
                    Title.Alignment = taCenter
                    Title.Caption = 'NOME DO L'#205'DER'
                    Width = 120
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'turno'
                    ReadOnly = False
                    Title.Alignment = taCenter
                    Width = 40
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'descricaoturno'
                    ReadOnly = False
                    Title.Caption = 'DESCRI'#199#195'O TURNO'
                    Width = 100
                    Visible = True
                  end>
              end
            end
          end
          object tstPremiacao: TTabSheet
            Caption = ' Premia'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ImageIndex = 1
            ParentFont = False
            object sbnIncluirPremiacao: TSpeedButton
              Left = 209
              Top = 21
              Width = 21
              Height = 21
              Hint = 'Incluir premia'#231#227'o'
              Flat = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C37F7F7F7F7F7F7F7F7F8080808080807F7F7F7F7F7F7F7F7F7F7F
                7F808080C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C30000000000000000000000000000000000000000000000000000000000
                00808080C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F
                7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                00808080C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
                C3C3C3C3C3FFFFFFFFFFFFFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
                00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
                C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
                C3C37F7F7FFFFFFFC3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
                C3C37F7F7FFFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFF
                FFFF7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3000000000000000000000000000000000000C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F
                7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
              NumGlyphs = 2
              OnClick = sbnIncluirPremiacaoClick
            end
            object sbnExcluirPremiacao: TSpeedButton
              Left = 209
              Top = 43
              Width = 21
              Height = 21
              Hint = 'Excluir premia'#231#227'o'
              Flat = True
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
              OnClick = sbnExcluirPremiacaoClick
            end
            object gbxMeses: TGroupBox
              Left = 0
              Top = 0
              Width = 204
              Height = 226
              Align = alLeft
              Caption = ' MESES '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              object dbgPremiacaoSetor: TtecDBGrid
                Left = 2
                Top = 16
                Width = 200
                Height = 208
                Align = alClient
                DataSource = dtmCadastroSetoresProducao.dsrSetoresProducaoPremiacao
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
                OnKeyDown = dbgPremiacaoSetorKeyDown
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
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'mes'
                    Title.Alignment = taCenter
                    Title.Caption = 'M'#202'S/ANO'
                    Width = 80
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'valor'
                    Title.Alignment = taCenter
                    Title.Caption = 'VALOR'
                    Width = 80
                    Visible = True
                  end>
              end
            end
          end
        end
        object gbxCustoHomemHora: TGroupBox
          Left = 69
          Top = 62
          Width = 90
          Height = 36
          Hint = 
            'Custo m'#233'dio do homem-hora do setor a ser empregado no c'#225'lculo do' +
            ' custo de resistores/supressores'
          Caption = ' HOMEM-HORA '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object edtCustoHomemHora: TDBEditNumero
            Left = 2
            Top = 10
            Width = 85
            Height = 23
            Hint = 
              'Custo m'#233'dio do homem-hora do setor a ser empregado no c'#225'lculo do' +
              ' custo de resistores/supressores'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            TabOrder = 0
            Text = 'edtCustoHomemHora'
            Mascara = True
            Alignment = taLeftJustify
            TipoMascara = tmGERAL
            NrDecimal = 4
            Decimais = True
            Negativo = False
            Tamanho = 9
            DataField = 'custohomemhora'
            DataSource = dtmCadastroSetoresProducao.dsrSetoresProducao
          end
        end
        object gbxFatorCusto: TGroupBox
          Left = 167
          Top = 62
          Width = 106
          Height = 36
          Hint = 
            'Percentual do custo do setor a ser empregado no c'#225'lculo do custo' +
            ' de resistores/supressores'
          Caption = ' CUSTO DO SETOR '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          object lblCustoSetor: TLabel
            Left = 91
            Top = 14
            Width = 11
            Height = 15
            Caption = '%'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
          end
          object edtFatorCusto: TDBEditNumero
            Left = 2
            Top = 10
            Width = 85
            Height = 23
            Hint = 
              'Percentual do custo do setor a ser empregado no c'#225'lculo do custo' +
              ' de resistores/supressores'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            TabOrder = 0
            Text = 'edtCustoHomemHora'
            Mascara = True
            Alignment = taLeftJustify
            TipoMascara = tmGERAL
            NrDecimal = 2
            Decimais = True
            Negativo = False
            Tamanho = 4
            DataField = 'fatorcusto'
            DataSource = dtmCadastroSetoresProducao.dsrSetoresProducao
          end
        end
      end
      object tstLog: TTabSheet
        Caption = ' Log das Opera'#231#245'es'
        ImageIndex = 1
        inline fraRegistroOperacoes1: TfraRegistroOperacoes
          Left = 0
          Top = 0
          Width = 572
          Height = 119
          Align = alTop
          TabOrder = 0
          inherited gbxRegistrodasOperacoes: TGroupBox
            Width = 572
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
            DataSet = dtmCadastroSetoresProducao.qryRegistrodasOperacoes
          end
        end
      end
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 580
    inherited tblBarra: TToolBar
      Width = 355
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
  object actAtualizar: TActionList
    Left = 500
    Top = 19
    object Action1: TAction
      Caption = 'Action1'
      OnUpdate = Action1Update
    end
  end
end
