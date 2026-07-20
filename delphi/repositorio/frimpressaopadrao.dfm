object frmImpressaoPadrao: TfrmImpressaoPadrao
  Left = 116
  Top = 71
  Width = 826
  Height = 565
  VertScrollBar.Range = 1129
  HorzScrollBar.Range = 801
  Caption = 'Impress'#227'o Padr'#227'o'
  Color = clBtnFace
  PixelsPerInch = 120
  TextHeight = 16
  TextWidth = 7
  object rlrRelatorioPadrao: TRLReport
    Left = 7
    Top = 6
    Width = 794
    Height = 1123
    Font.Color = clBlack
    Font.Height = 17
    Font.Name = 'Arial'
    Font.Pitch = fpVariable
    Font.Style = []
    Font.Weight = 40
    Margins.TopMargin = 13
    object rlbTitulo: TRLBand
      Left = 38
      Top = 49
      Width = 718
      Height = 73
      BandType = btTitle
      object rlwTitulo: TRLDraw
        Left = 0
        Top = 1
        Width = 718
        Height = 72
        Pen.Width = 0
      end
      object rllNomeEmpresa: TRLLabel
        Left = 1
        Top = 17
        Width = 220
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = 'Nome da Empresa'
        Font.Color = clBlack
        Font.Height = 20
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        ParentFont = False
      end
      object rllCGC: TRLLabel
        Left = 6
        Top = 42
        Width = 210
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = 'CNPJ da Empresa'
        Font.Color = clBlack
        Font.Height = 15
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        ParentFont = False
      end
      object rllTituloRelatorio_1: TRLLabel
        Left = 226
        Top = 11
        Width = 412
        Height = 23
        Alignment = taCenter
        AutoSize = False
        Caption = 'T'#237'tulo do Relat'#243'rio'
        Font.Color = clBlack
        Font.Height = 23
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        ParentFont = False
      end
      object rllTituloRelatorio_2: TRLLabel
        Left = 226
        Top = 35
        Width = 412
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = 'Sub-T'#237'tulo do Relat'#243'rio'
        Font.Color = clBlack
        Font.Height = 13
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        ParentFont = False
      end
      object rllTituloRelatorio_3: TRLLabel
        Left = 226
        Top = 52
        Width = 412
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = 'Sub-T'#237'tulo do Relat'#243'rio'
        Font.Color = clBlack
        Font.Height = 13
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        ParentFont = False
      end
      object rliData: TRLSystemInfo
        Left = 645
        Top = 12
        Width = 72
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        Font.Color = clBlack
        Font.Height = 15
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        ParentFont = False
      end
      object rliHora: TRLSystemInfo
        Left = 645
        Top = 29
        Width = 72
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        Font.Color = clBlack
        Font.Height = 15
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        Info = itHour
        ParentFont = False
      end
      object rliPagina: TRLSystemInfo
        Left = 645
        Top = 46
        Width = 72
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        Font.Color = clBlack
        Font.Height = 15
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        Info = itPageNumber
        ParentFont = False
      end
      object rlwBarra_1: TRLDraw
        Left = 223
        Top = 2
        Width = 1
        Height = 70
        Kind = dkVertLine
        Pen.Width = 0
      end
      object rlwBarra_2: TRLDraw
        Left = 640
        Top = 2
        Width = 1
        Height = 70
        Kind = dkVertLine
        Pen.Width = 0
      end
    end
    object rlbRodape: TRLBand
      Left = 38
      Top = 162
      Width = 718
      Height = 18
      BandType = btFooter
      object rllDesenvolvedor: TRLLabel
        Left = 476
        Top = 1
        Width = 239
        Height = 17
        Alignment = taRightJustify
        Caption = 'tecSOFT - Tecnologia em Sistemas'
        Font.Color = clBlack
        Font.Height = 15
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        ParentFont = False
      end
      object rllSistema: TRLLabel
        Left = 2
        Top = 1
        Width = 51
        Height = 17
        Caption = 'tecLUX'
        Font.Color = clBlack
        Font.Height = 15
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        ParentFont = False
      end
    end
    object rlbDetalhe: TRLBand
      Left = 38
      Top = 142
      Width = 718
      Height = 20
    end
    object rlbCabecalho: TRLBand
      Left = 38
      Top = 122
      Width = 718
      Height = 20
      BandType = btColumnHeader
    end
  end
end
