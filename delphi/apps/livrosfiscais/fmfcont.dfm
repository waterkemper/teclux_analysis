inherited frmFCont: TfrmFCont
  Left = 465
  Top = 175
  ActiveControl = edtExercicio
  Caption = 'FCONT - Controle Fiscal Cont'#225'bil de Transi'#231#227'o'
  ClientHeight = 573
  ClientWidth = 795
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 0
    Top = 45
    Width = 795
    Height = 528
    Align = alClient
    BevelOuter = bvNone
    Visible = True
    inherited bvlBotoesEd: TBevel
      Left = 0
      Top = 283
      Width = 795
      Height = 0
      Align = alTop
      Visible = False
    end
    object pnlTop: TPanel
      Left = 0
      Top = 0
      Width = 795
      Height = 283
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object gbxExercicio: TGroupBox
        Left = 5
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
        object edtExercicio: TtecDbEditFind
          Left = 2
          Top = 10
          Width = 63
          Height = 23
          Alignment = taLeftJustify
          DataField = 'exercicio'
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
          Operacao = opATRIBUICAO
          Parameter = 'exercicio'
          ActiveSetControls = True
          DenyInsert = False
          NoSetControls = <
            item
            end
            item
              Control = gbxFilial
            end>
          SetControls = <
            item
              Control = gbxArquivo
            end
            item
              Control = rbnSituacao
            end
            item
              Control = rbnIndicadorInicioPeriodo
            end
            item
              Control = mmoErro
            end>
        end
      end
      object gbxArquivo: TGroupBox
        Left = 5
        Top = 40
        Width = 540
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
          Width = 535
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'nomearquivo'
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
        Top = 1
        Width = 465
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
          Width = 461
          Height = 25
          HorzScrollBar.Range = 455
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
            Left = 38
          end
          inherited dtxDescricao: TtecDBText
            Left = 61
            Width = 399
            DataField = 'nome'
            DataSource = fraConsultaFilial.dsrProcuraFiliais
          end
          inherited edfCodigo: TtecDBFindLookup
            Width = 37
            DataField = 'filial'
            Group = 'periodo'
            MaxLength = 3
            OnFound = nil
            LookupField = 'codigo'
            LookupSource = fraConsultaFilial.dsrProcuraFiliais
            LookupQueryParameter = 'codigo'
            Parameter = 'filial'
            LookupParameter = 'codigo'
          end
          inherited qryProcuraCobrador: TtecQuery
            Left = 463
          end
        end
      end
      object rbnSituacao: TtecDBRadioGroup
        Left = 6
        Top = 80
        Width = 135
        Height = 126
        Caption = ' SITUA'#199#195'O '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        TabStop = False
        DataField = 'situacao'
        object rbnAbertura: TtecRadioButton
          Left = 8
          Top = 16
          Width = 110
          Height = 17
          Caption = '0 - Abertura'
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
        object rbnCISAO: TtecRadioButton
          Left = 8
          Top = 32
          Width = 110
          Height = 17
          Caption = '1 - Cis'#227'o'
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
        object rbnFUSAO: TtecRadioButton
          Left = 8
          Top = 48
          Width = 110
          Height = 17
          Caption = '2 - Fus'#227'o'
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
        object rbnINCORPORACAO: TtecRadioButton
          Left = 8
          Top = 64
          Width = 110
          Height = 17
          Caption = '3 - Incorpora'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Value = '3'
        end
        object rbnEXTINSAO: TtecRadioButton
          Left = 8
          Top = 80
          Width = 110
          Height = 17
          Caption = '4 - Extin'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          Value = '4'
        end
        object rbnNormal: TtecRadioButton
          Left = 8
          Top = 96
          Width = 110
          Height = 17
          Caption = '5 - Normal'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          TabStop = True
          Value = '5'
        end
      end
      object rbnIndicadorInicioPeriodo: TtecDBRadioGroup
        Left = 151
        Top = 80
        Width = 482
        Height = 87
        Caption = ' PER'#205'ODO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        TabStop = False
        DataField = 'IND_SIT_INI_PER'
        object rbn_Periodo_0: TtecRadioButton
          Left = 8
          Top = 16
          Width = 425
          Height = 17
          Caption = '0 - In'#237'cio no primeiro dia do ano'
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
        object rbn_Periodo_1: TtecRadioButton
          Left = 8
          Top = 32
          Width = 425
          Height = 17
          Caption = '1 - Abertura'
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
        object rbn_Periodo_2: TtecRadioButton
          Left = 8
          Top = 48
          Width = 470
          Height = 17
          Caption = 
            '2 - Resultante de cis'#227'o/fus'#227'o ou remanescente de cis'#227'o ou realiz' +
            'ou incorpora'#231#227'o'
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
        object rbn_Periodo_3: TtecRadioButton
          Left = 8
          Top = 64
          Width = 455
          Height = 17
          Caption = 
            '3 - In'#237'cio da obrigatoriedade da entrega da FCONT no curso do an' +
            'o-calend'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Value = '3'
        end
      end
      object ckbTipodeEscrituracao: TtecDBRadioGroup
        Left = 560
        Top = 1
        Width = 123
        Height = 56
        Caption = ' ESCRITURA'#199#195'O '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        TabStop = False
        DataField = 'TIPO_ESCRIT'
        object rbnOriginal: TtecRadioButton
          Left = 8
          Top = 16
          Width = 105
          Height = 17
          Caption = '0 - Original'
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
        object rbnRetificadora: TtecRadioButton
          Left = 8
          Top = 32
          Width = 105
          Height = 17
          Caption = '1 - Retificadora'
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
      end
      object gbxEscrituracaoPeriodoAnterior: TGroupBox
        Left = 151
        Top = 176
        Width = 337
        Height = 95
        Caption = ' ESCRITURA'#199#195'O ANTERIOR '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        object gbxEscrituracaoAnterior: TGroupBox
          Left = 0
          Top = 16
          Width = 205
          Height = 36
          Caption = ' IDENTIFICA'#199#195'O '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object DBEditTexto1: TDBEditTexto
            Left = 2
            Top = 10
            Width = 200
            Height = 23
            DataField = 'Id_escr_Per_ant'
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
        object gbxNrRecAnterior: TGroupBox
          Left = 0
          Top = 58
          Width = 205
          Height = 36
          Caption = ' N'#186' RECIBO '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object edtReciboAnterior: TDBEditTexto
            Left = 2
            Top = 10
            Width = 200
            Height = 23
            DataField = 'Nro_Rec_Anterior'
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
        object ckbSituacaoSaldoAnterior: TtecDBRadioGroup
          Left = 203
          Top = 9
          Width = 134
          Height = 86
          Caption = ' SITUA'#199#195'O DO SALDO '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          TabStop = False
          DataField = 'sIT_sLD_PER_ANT'
          object tecRadioButton1: TtecRadioButton
            Left = 8
            Top = 14
            Width = 120
            Height = 17
            Caption = '[R]ecuperado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Value = 'R'
          end
          object tecRadioButton2: TtecRadioButton
            Left = 8
            Top = 29
            Width = 120
            Height = 17
            Caption = '[N]'#227'o recuperado'
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            TabStop = True
            Value = 'N'
          end
          object tecRadioButton3: TtecRadioButton
            Left = 8
            Top = 44
            Width = 120
            Height = 17
            Caption = '[E]ditado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Value = 'E'
          end
          object tecRadioButton4: TtecRadioButton
            Left = 8
            Top = 60
            Width = 120
            Height = 17
            Caption = '[I]mportado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            Value = 'I'
          end
        end
      end
      object ckbPermissaoSaldoInicial: TtecDBRadioGroup
        Left = 6
        Top = 214
        Width = 135
        Height = 55
        Caption = ' SALDO INICIAL '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        TabStop = False
        DataField = 'Ind_lcto_ini_sld'
        object rbnAjustar: TtecRadioButton
          Left = 8
          Top = 16
          Width = 113
          Height = 17
          Caption = '0 - Ajustar'
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
        object tecRadioButton6: TtecRadioButton
          Left = 8
          Top = 32
          Width = 113
          Height = 17
          Caption = '1 - N'#227'o ajustar'
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
      end
    end
    object gbxErro: TGroupBox
      Left = 0
      Top = 278
      Width = 789
      Height = 255
      Caption = ' ERROS DE VALIDA'#199#195'O '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object mmoErro: TMemo
        Left = 2
        Top = 14
        Width = 785
        Height = 239
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
  inherited pnlTopMenu: TPanel
    Width = 795
    inherited tblBarra: TToolBar
      Left = 297
      Width = 498
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
