inherited frmrelatoriofluxodecaixa: Tfrmrelatoriofluxodecaixa
  Left = 309
  Top = 167
  ActiveControl = pgcFilialGrupoFilial
  Caption = 'Relat'#243'rio Fluxo de Caixa'
  ClientHeight = 358
  ClientWidth = 419
  FormStyle = fsMDIChild
  Visible = True
  OnLoaded = FormLoaded
  PixelsPerInch = 96
  inherited pnlBarra: TPanel
    Width = 419
  end
  inherited pnlFundoJanela: TPanel
    Width = 419
    Height = 317
    object gbxFluxo: TGroupBox
      Left = 3
      Top = 3
      Width = 413
      Height = 311
      Align = alClient
      TabOrder = 0
      object pgcFilialGrupoFilial: TtecPageControl
        Left = 11
        Top = 240
        Width = 393
        Height = 65
        ActivePage = tstFilial
        TabOrder = 5
        OnChange = pgcFilialGrupoFilialChange
        object tstFilial: TTabSheet
          Caption = '    &Filial'
          object sbnConsultaFilial: TSpeedButton
            Left = 61
            Top = 12
            Width = 23
            Height = 23
            Hint = 'Procurar Filiais'
            Flat = True
            Glyph.Data = {
              3A060000424D3606000000000000360000002800000020000000100000000100
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
            OnClick = sbnConsultaFilialClick
          end
          object edfFilial: TtecDbEditFind
            Left = 0
            Top = 11
            Width = 60
            Height = 23
            DataField = 'codigo'
            DataSource = dtmrelatoriofluxodecaixa.dsrFiliais
            Group = 'Filial'
            MaxLength = 3
            TabOrder = 0
            Parameter = 'codigo'
            ActiveSetControls = False
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
          end
          object dtxFilial: TtecDBText
            Left = 88
            Top = 12
            Width = 297
            Height = 23
            Color = clBtnFace
            DataField = 'nome'
            DataSource = dtmrelatoriofluxodecaixa.dsrFiliais
            ParentColor = False
            BorderStyle = bsSingle
          end
        end
        object tstGrupoFilial: TTabSheet
          Caption = '    &Grupo Filial'
          ImageIndex = 1
          object sbnConsultaGrupoFilial: TSpeedButton
            Left = 67
            Top = 12
            Width = 23
            Height = 23
            Hint = 'Procurar grupos de filiais'
            Flat = True
            Glyph.Data = {
              3A060000424D3606000000000000360000002800000020000000100000000100
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
            OnClick = sbnConsultaGrupoFilialClick
          end
          object edfGrupoFilial: TtecDbEditFind
            Left = 6
            Top = 11
            Width = 60
            Height = 23
            DataField = 'codigo'
            DataSource = dtmrelatoriofluxodecaixa.dsrGrupoFiliais
            Group = 'GrupoFilial'
            MaxLength = 3
            TabOrder = 0
            Parameter = 'codigo'
            ActiveSetControls = False
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
          end
          object dtxGrupoFilial: TtecDBText
            Left = 91
            Top = 12
            Width = 270
            Height = 23
            Color = clBtnFace
            DataField = 'descricao'
            DataSource = dtmrelatoriofluxodecaixa.dsrGrupoFiliais
            ParentColor = False
            BorderStyle = bsSingle
          end
        end
      end
      object gbxAgrupamento: TGroupBox
        Left = 139
        Top = 6
        Width = 117
        Height = 76
        Caption = 'AGRUPAR POR'
        Font.Color = clBlack
        font.height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        ParentFont = False
        TabOrder = 1
        object ckbAgruparGrupoFilial: TCheckBox
          Left = 6
          Top = 18
          Width = 109
          Height = 25
          Caption = 'Grupo de filial'
          Font.Color = clBlack
          font.height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Font.Weight = 40
          ParentFont = False
          TabOrder = 0
          OnClick = ckbAgruparGrupoFilialClick
        end
        object ckbAgruparFilial: TCheckBox
          Left = 6
          Top = 43
          Width = 106
          Height = 25
          Caption = '&Filial'
          Font.Color = clBlack
          font.height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Font.Weight = 40
          ParentFont = False
          TabOrder = 1
          OnClick = ckbAgruparFilialClick
        end
      end
      object rgpTipodeRelatorio: TRadioGroup
        Left = 11
        Top = 14
        Width = 118
        Height = 69
        Items.Strings = (
          'Por eventos'
          'Detalhado')
        Alignment = taCenter
        Constraints.MaxWidth = 129
        ItemIndex = 0
        TabOrder = 0
        OnClick = rgpTipodeRelatorioClick
      end
      object gbxSaldoInicial: TGroupBox
        Left = 205
        Top = 191
        Width = 120
        Height = 40
        Caption = 'SALDO INICIAL'
        Font.Color = clBlack
        font.height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        ParentFont = False
        TabOrder = 4
        object edtSaldoInicial: TEditNumero
          Left = 4
          Top = 12
          Width = 112
          Height = 24
          Alignment = taRightJustify
          Font.Color = clBlack
          font.height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Font.Weight = 40
          ParentFont = False
          TabOrder = 0
          Mascara = True
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = True
          Negativo = True
          Tamanho = 9
        end
      end
      object gbxPeriodoFluxo: TGroupBox
        Left = 11
        Top = 88
        Width = 183
        Height = 55
        Caption = 'FLUXO DE CAIXA'
        Font.Color = clBlack
        font.height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        ParentFont = False
        TabOrder = 2
        object gbxDeDataInicial: TGroupBox
          Left = 6
          Top = 12
          Width = 82
          Height = 40
          Alignment = taCenter
          Caption = 'DE'
          Font.Color = clBlack
          font.height = -9
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          Font.Weight = 40
          ParentFont = False
          TabOrder = 0
          object edtDataInicial: TEditData
            Left = 2
            Top = 12
            Width = 75
            Height = 23
            Font.Color = clBlack
            font.height = -13
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            Font.Weight = 40
            MaxLength = 10
            ParentFont = False
            TabOrder = 0
            OnExit = edtDataInicialExit
            Minimo = 37353
            Maximo = 0
          end
        end
        object gbxAteDataFinal: TGroupBox
          Left = 95
          Top = 12
          Width = 82
          Height = 40
          Alignment = taCenter
          Caption = 'AT'#201
          Font.Color = clBlack
          font.height = -9
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          Font.Weight = 40
          ParentFont = False
          TabOrder = 1
          object edtDataFinal: TEditData
            Left = 2
            Top = 12
            Width = 75
            Height = 23
            Font.Color = clBlack
            font.height = -13
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            Font.Weight = 40
            MaxLength = 10
            ParentFont = False
            TabOrder = 0
            Minimo = 37353
            Maximo = 365
          end
        end
      end
      object gbxAcumulado: TGroupBox
        Left = 11
        Top = 175
        Width = 183
        Height = 55
        Caption = 'SALDO ACUMULADO'
        Font.Color = clBlack
        font.height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        ParentFont = False
        TabOrder = 3
        object GroupBox2: TGroupBox
          Left = 6
          Top = 12
          Width = 82
          Height = 40
          Alignment = taCenter
          Caption = 'DE'
          Font.Color = clBlack
          font.height = -9
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          Font.Weight = 40
          ParentFont = False
          TabOrder = 0
          object edtDataInicialAcumulado: TEditData
            Left = 3
            Top = 12
            Width = 75
            Height = 23
            Font.Color = clBlack
            font.height = -13
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            Font.Weight = 40
            MaxLength = 10
            ParentFont = False
            TabOrder = 0
            Minimo = 37353
            Maximo = 0
          end
        end
        object GroupBox3: TGroupBox
          Left = 95
          Top = 12
          Width = 82
          Height = 40
          Alignment = taCenter
          Caption = 'AT'#201
          Font.Color = clBlack
          font.height = -9
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          Font.Weight = 40
          ParentFont = False
          TabOrder = 1
          object edtDataFinalAcumulado: TEditData
            Left = 3
            Top = 12
            Width = 75
            Height = 23
            Font.Color = clBlack
            font.height = -13
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            Font.Weight = 40
            MaxLength = 10
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Minimo = 37353
            Maximo = 0
          end
        end
      end
      object ckbExibirSaldoAcumulado: TCheckBox
        Left = 11
        Top = 146
        Width = 193
        Height = 30
        Caption = 'Exibir saldo acumulado'
        Checked = True
        State = cbChecked
        TabOrder = 6
        OnClick = ckbExibirSaldoAcumuladoClick
      end
      object lblRelatorio: TLabel
        Left = 20
        Top = 9
        Width = 59
        Height = 12
        Caption = ' RELAT'#211'RIO '
        Font.Color = clBlack
        font.height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        ParentFont = False
      end
    end
  end
  object ecvValida: TtecEditionControlValidation
    EditionControl = <
      item
        Control = edtDataFinalAcumulado
      end
      item
        Control = edtDataInicialAcumulado
      end
      item
        Control = edtDataFinal
      end
      item
        Control = edtDataInicial
      end>
    Left = 328
    Top = 8
  end
end
