inherited frmArquivoDimob: TfrmArquivoDimob
  Left = 417
  Top = 227
  Caption = 'frmArquivoDimob'
  ClientHeight = 387
  ClientWidth = 553
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlTopMenu: TPanel
    Width = 553
    inherited tblBarra: TToolBar
      Left = 72
      Width = 481
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
    end
    inherited tblBarraCadastro: TToolBar
      Width = 72
      object sbnGerarArquivo: TSpeedButton
        Left = 0
        Top = 2
        Width = 72
        Height = 35
        Caption = 'Gerar F6'
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
  object gbxJanelaFundo: TGroupBox
    Left = 0
    Top = 40
    Width = 553
    Height = 347
    Align = alClient
    TabOrder = 2
    object gbxAnoBase: TGroupBox
      Left = 10
      Top = 13
      Width = 55
      Height = 36
      Caption = 'ANO BASE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object edtAnoBase: TEditNumero
        Left = 2
        Top = 12
        Width = 50
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 4
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
    object gbxRetificadora: TGroupBox
      Left = 10
      Top = 56
      Width = 203
      Height = 52
      Caption = ' DECLARA'#199#195'O RETIFICADORA '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object gbxNrRecibo: TGroupBox
        Left = 123
        Top = 16
        Width = 80
        Height = 36
        Caption = ' N'#186' RECIBO '
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object edtNRecibo: TEditNumero
          Left = 2
          Top = 10
          Width = 75
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
          Mascara = True
          Alignment = taLeftJustify
          TipoMascara = tmGERAL
          NrDecimal = 0
          Decimais = False
          Negativo = False
          Tamanho = 9
        end
      end
      object rgbRetificadora: TtecDBRadioGroup
        Left = 0
        Top = 16
        Width = 116
        Height = 36
        Caption = ' '#201' RETIFICADORA? '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = False
        object rbnNaoRetificadora: TtecRadioButton
          Left = 11
          Top = 12
          Width = 48
          Height = 17
          Caption = 'N'#227'o'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = '1'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TabStop = True
          OnClick = rbnNaoRetificadoraClick
          Value = '1'
        end
        object rbnSimRetificadora: TtecRadioButton
          Left = 63
          Top = 12
          Width = 48
          Height = 17
          Caption = 'Sim'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = '1'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = rbnSimRetificadoraClick
          Value = '1'
        end
      end
    end
    object gbxSituacaoEspecial: TGroupBox
      Left = 223
      Top = 56
      Width = 321
      Height = 130
      Caption = ' SITUA'#199#195'O ESPECIAL '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object rdbSituacaoEspecial: TtecDBRadioGroup
        Left = 0
        Top = 16
        Width = 116
        Height = 36
        Caption = 'SITUA'#199#195'O ESPECIAL? '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = False
        object rbnSituacaoEspecial_Nao: TtecRadioButton
          Left = 11
          Top = 12
          Width = 48
          Height = 17
          Caption = 'N'#227'o'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = '1'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TabStop = True
          OnClick = rbnSituacaoEspecial_NaoClick
          Value = '1'
        end
        object rbnSituacaoEspecial_Sim: TtecRadioButton
          Left = 63
          Top = 12
          Width = 48
          Height = 17
          Caption = 'Sim'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = '1'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = rbnSituacaoEspecial_SimClick
          Value = '1'
        end
      end
      object gbxDataEvento: TGroupBox
        Left = 114
        Top = 16
        Width = 75
        Height = 36
        Caption = ' DATA '
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object edtDataEspecial: TEditData
          Left = 2
          Top = 10
          Width = 70
          Height = 23
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Minimo = 37353
          Maximo = 0
        end
      end
      object rgbSituacao: TtecDBRadioGroup
        Left = 187
        Top = 16
        Width = 134
        Height = 114
        Caption = ' C'#211'DIGO DA SITUA'#199#195'O '
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        TabStop = False
        object lblIncorporada: TLabel
          Left = 48
          Top = 76
          Width = 66
          Height = 15
          Caption = 'Incorporada'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object rbnNormal: TtecRadioButton
          Left = 6
          Top = 12
          Width = 122
          Height = 17
          Caption = '00 - Normal'
          Checked = True
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = '1'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TabStop = True
          Value = '00'
        end
        object rbnExtincao: TtecRadioButton
          Left = 6
          Top = 28
          Width = 122
          Height = 17
          Caption = '01 - Extin'#231#227'o'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = '1'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Value = '01'
        end
        object rbnFusao: TtecRadioButton
          Left = 6
          Top = 44
          Width = 122
          Height = 17
          Caption = '02 - Fus'#227'o'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = '1'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Value = '02'
        end
        object rbnIncorporacao: TtecRadioButton
          Left = 6
          Top = 60
          Width = 122
          Height = 17
          Caption = '03 - Incorpora'#231#227'o/'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = '1'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Value = '03'
        end
        object rbnCisaoTotal: TtecRadioButton
          Left = 6
          Top = 92
          Width = 122
          Height = 17
          Caption = '04 - Cis'#227'o Total'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = '1'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          Value = '04'
        end
      end
    end
    object gbxArquivo: TGroupBox
      Left = 75
      Top = 13
      Width = 468
      Height = 36
      Caption = 'ARQUIVO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object sbnArquivo: TSpeedButton
        Left = 385
        Top = 10
        Width = 79
        Height = 22
        Hint = 'Definir pasta do arquivo'
        Caption = 'Arqui&vo '
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555555FFFFFFFFFF55555000000000055555577777777775F55500B8B8B8B8
          B05555775F555555575F550F0B8B8B8B8B05557F75F555555575550BF0B8B8B8
          B8B0557F575FFFFFFFF7550FBF0000000000557F557777777777500BFBFBFBFB
          0555577F555555557F550B0FBFBFBFBF05557F7F555555FF75550F0BFBFBF000
          55557F75F555577755550BF0BFBF0B0555557F575FFF757F55550FB700007F05
          55557F557777557F55550BFBFBFBFB0555557F555555557F55550FBFBFBFBF05
          55557FFFFFFFFF7555550000000000555555777777777755555550FBFB055555
          5555575FFF755555555557000075555555555577775555555555}
        NumGlyphs = 2
        ParentFont = False
        OnClick = sbnArquivoClick
      end
      object lblArqDimob: TLabel
        Left = 2
        Top = 12
        Width = 378
        Height = 22
        Hint = 'Nome do arquivo da DIME a ser gerado'
        AutoSize = False
        Caption = 'DIMOB.txt'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
      end
    end
    inline fraListaFiliais: TfraListaFiliais
      Left = 7
      Top = 190
      Width = 537
      Height = 146
      TabOrder = 4
      inherited gbxFiliais: TGroupBox
        Width = 537
        Caption = ' &FILIAIS '
        Font.Color = clBlack
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
        inherited sbnMarcarFiliais: TSpeedButton
          Left = 511
        end
        inherited sbnDesmarcarFiliais: TSpeedButton
          Left = 511
        end
        inherited clbFiliais: TCheckListBox
          Top = 13
          Width = 503
          Height = 129
          Font.Height = -12
          Font.Name = 'helvetica'
        end
      end
    end
  end
  object dlgArquivoaExportar: TSaveDialog
    Title = 'Save As'
    Left = 424
    Top = 8
  end
  object ecvValidaRecibo: TtecEditionControlValidation
    EditionControl = <
      item
        Control = edtNRecibo
      end
      item
        Control = edtAnoBase
      end>
    Left = 248
    Top = 8
  end
  object ecvValidaDataSituacaoEspecial: TtecEditionControlValidation
    EditionControl = <
      item
        Control = edtDataEspecial
      end>
    Left = 280
    Top = 8
  end
end
