inherited frmLivroAuxiliarImpostosRetidos: TfrmLivroAuxiliarImpostosRetidos
  Left = 484
  Top = 193
  ActiveControl = edtDia
  Caption = 'Livro Auxiliar Impostos Retidos'
  ClientHeight = 242
  ClientWidth = 338
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TToolBar
    Width = 338
  end
  inherited pnlFundoJanela: TPanel
    Top = 50
    Width = 338
    Height = 192
    object gbxLivroSaidaMercadorias: TGroupBox
      Left = 3
      Top = 3
      Width = 332
      Height = 186
      Align = alClient
      TabOrder = 0
      object lblRelatorio: TLabel
        Left = 17
        Top = 3
        Width = 45
        Height = 9
        Caption = ' RELAT'#211'RIO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        font.height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
      end
      object rgpRelatorio: TRadioGroup
        Left = 10
        Top = 12
        Width = 175
        Height = 66
        ItemIndex = 0
        Items.Strings = (
          'Emiss'#227'o do Livro'
          'Termo de Abertura')
        TabOrder = 0
        OnClick = rgpRelatorioClick
      end
      object gbxFiliais: TGroupBox
        Left = 9
        Top = 141
        Width = 313
        Height = 35
        Caption = 'FILIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        font.height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object sbnProcurarFilial: TSpeedButton
          Left = 55
          Top = 10
          Width = 24
          Height = 24
          Hint = 'Procurar Filial'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDC800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7FFFFFFFDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DC800000800000800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000
            00800000800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000008000
            00800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000008000008000
            00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFF
            FFFFDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCFFA858800000800000800000FFA858DCDCDC0000FF800000800000DCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDC
            DCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFDCDCDCDCDCDC7F
            7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
            FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDC7F7F7FDCDCDCFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
            FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000DCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
            FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000DCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
            FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFFFFFFFDCDCDCDCDCDCDC
            DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
            7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
          NumGlyphs = 2
          ParentFont = False
          OnClick = sbnProcurarFilialClick
        end
        object edfFilial: TtecDbEditFind
          Left = 2
          Top = 10
          Width = 50
          Height = 21
          DataField = 'codigo'
          DataSource = dtmLivroAuxiliarImpostosRetidos.dsrProcuraFiliais
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Group = 'Filial'
          MaxLength = 3
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
          ActiveSetControls = False
          DenyInsert = True
          NoSetControls = <>
          SetControls = <>
        end
        object dtxFilial: TtecDBText
          Left = 80
          Top = 10
          Width = 230
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'nome'
          DataSource = dtmLivroAuxiliarImpostosRetidos.dsrProcuraFiliais
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
      object gbxPeriodo: TGroupBox
        Left = 11
        Top = 82
        Width = 178
        Height = 56
        Caption = 'PER'#205'ODO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        font.height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object pgcPeriodo: TPageControl
          Left = 5
          Top = 9
          Width = 169
          Height = 42
          ActivePage = tstMes
          TabHeight = 1
          TabIndex = 0
          TabOrder = 0
          TabWidth = 1
          object tstMes: TTabSheet
            Caption = 'tstMes'
            object gbxDoDia: TGroupBox
              Left = 13
              Top = -2
              Width = 40
              Height = 36
              Caption = 'DE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              font.height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object edtDia: TEditDia
                Left = 2
                Top = 10
                Width = 35
                Height = 21
                EditMask = '99;1; '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                font.height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 2
                ParentFont = False
                TabOrder = 0
                Text = '  '
              end
            end
            object gbxAteDia: TGroupBox
              Left = 72
              Top = -1
              Width = 80
              Height = 36
              Caption = 'AT'#201
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              font.height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              object edtDataFinalPeriodo: TEditData
                Left = 2
                Top = 10
                Width = 75
                Height = 23
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                font.height = -13
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
          object tstPeriodo: TTabSheet
            Caption = 'tstPeriodo'
            ImageIndex = 1
            object gbxPeriodoInicial: TGroupBox
              Left = 0
              Top = -1
              Width = 80
              Height = 36
              Caption = 'DE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              font.height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object edtDataInicial: TEditData
                Left = 2
                Top = 10
                Width = 75
                Height = 23
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                font.height = -13
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
            object gbxPeriodoFinal: TGroupBox
              Left = 85
              Top = -1
              Width = 80
              Height = 36
              Caption = 'AT'#201
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              font.height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              object edtDataFinal: TEditData
                Left = 2
                Top = 10
                Width = 75
                Height = 23
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                font.height = -13
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
        end
      end
      object gbxNumeracao: TGroupBox
        Left = 194
        Top = 6
        Width = 129
        Height = 90
        Caption = 'NUMERA'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        font.height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object gbxNrLivro: TGroupBox
          Left = 7
          Top = 11
          Width = 55
          Height = 36
          Caption = 'LIVRO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object edtLivro: TEditNumero
            Left = 2
            Top = 10
            Width = 50
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            font.height = -13
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            TabOrder = 0
            Mascara = False
            Alignment = taLeftJustify
            TipoMascara = tmGERAL
            NrDecimal = 0
            Decimais = False
            Negativo = False
            Tamanho = 4
          end
        end
        object gbxPagina: TGroupBox
          Left = 68
          Top = 11
          Width = 55
          Height = 36
          Caption = 'P'#193'GINA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object edtPagina: TEditNumero
            Left = 2
            Top = 10
            Width = 50
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            font.height = -13
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            TabOrder = 0
            Text = '999,00'
            Mascara = False
            Alignment = taLeftJustify
            TipoMascara = tmGERAL
            NrDecimal = 0
            Decimais = False
            Negativo = False
            Tamanho = 9
          end
        end
        object gbxMaximo: TGroupBox
          Left = 68
          Top = 51
          Width = 55
          Height = 36
          Caption = 'M'#193'XIMO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object edtMaximo: TEditNumero
            Left = 2
            Top = 10
            Width = 50
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            font.height = -13
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            TabOrder = 0
            Text = '499,00'
            Mascara = False
            Alignment = taLeftJustify
            TipoMascara = tmGERAL
            NrDecimal = 0
            Decimais = False
            Negativo = False
            Tamanho = 9
          end
        end
      end
    end
  end
  object ecvValida: TtecEditionControlValidation
    EditionControl = <
      item
        Control = edtMaximo
      end
      item
        Control = edtPagina
      end
      item
        Control = edfFilial
      end
      item
        Control = edtDataFinalPeriodo
      end
      item
        Control = edtDia
      end>
    Left = 368
    Top = 8
  end
end
