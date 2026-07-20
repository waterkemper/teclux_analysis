object frmCobrancaPIX: TfrmCobrancaPIX
  Left = 311
  Top = 126
  Width = 853
  Height = 558
  Caption = 'Cobran'#231'a PIX'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgcCobrancaPIX: TPageControl
    Left = 0
    Top = 0
    Width = 837
    Height = 520
    ActivePage = tstQRCode
    Align = alClient
    TabOrder = 0
    object tstQRCode: TTabSheet
      Caption = 'QRCode'
      object imFluxoQRCode: TImage
        Left = 256
        Top = 160
        Width = 289
        Height = 265
        Center = True
        Constraints.MinHeight = 140
        Proportional = True
        Stretch = True
      end
      object AdvSmoothProgressBar1: TAdvSmoothProgressBar
        Left = 0
        Top = 476
        Width = 829
        Height = 16
        Step = 3.000000000000000000
        Maximum = 100.000000000000000000
        Appearance.BackGroundFill.Color = 16777164
        Appearance.BackGroundFill.ColorTo = clNavy
        Appearance.BackGroundFill.ColorMirror = clNone
        Appearance.BackGroundFill.ColorMirrorTo = clNone
        Appearance.BackGroundFill.GradientType = gtVertical
        Appearance.BackGroundFill.GradientMirrorType = gtSolid
        Appearance.BackGroundFill.BorderColor = clSilver
        Appearance.BackGroundFill.Rounding = 0
        Appearance.BackGroundFill.ShadowOffset = 0
        Appearance.BackGroundFill.Glow = gmNone
        Appearance.ProgressFill.Color = 13434828
        Appearance.ProgressFill.ColorTo = clAqua
        Appearance.ProgressFill.ColorMirror = 16765357
        Appearance.ProgressFill.ColorMirrorTo = 16767936
        Appearance.ProgressFill.GradientType = gtVertical
        Appearance.ProgressFill.GradientMirrorType = gtVertical
        Appearance.ProgressFill.BorderColor = clBlack
        Appearance.ProgressFill.Rounding = 0
        Appearance.ProgressFill.ShadowOffset = 0
        Appearance.ProgressFill.Glow = gmNone
        Appearance.Font.Charset = DEFAULT_CHARSET
        Appearance.Font.Color = 8404992
        Appearance.Font.Height = -11
        Appearance.Font.Name = 'Tahoma'
        Appearance.Font.Style = [fsBold]
        Appearance.ProgressFont.Charset = DEFAULT_CHARSET
        Appearance.ProgressFont.Color = clBlack
        Appearance.ProgressFont.Height = -11
        Appearance.ProgressFont.Name = 'Tahoma'
        Appearance.ProgressFont.Style = []
        Appearance.ValueFormat = '%.0f%%'
        Appearance.ValueType = vtPercentage
        Appearance.ValueVisible = True
        Version = '1.7.0.0'
        MarqueeInterval = 3
        MarqueeColor = clRed
        MarqueeSize = 10
        Align = alBottom
        Visible = False
        TabStop = False
      end
      object gbFluxoStatus: TGroupBox
        Left = 0
        Top = 0
        Width = 829
        Height = 66
        Align = alTop
        Caption = 'Status'
        TabOrder = 1
        object pnFluxoStatus: TPanel
          Left = 2
          Top = 15
          Width = 825
          Height = 49
          Align = alClient
          BevelOuter = bvNone
          Color = clMenuHighlight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
        end
      end
      object gbFluxoCliente: TGroupBox
        Left = 0
        Top = 66
        Width = 829
        Height = 80
        Align = alTop
        Caption = 'CLIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object pnFluxoCliente: TPanel
          Left = 2
          Top = 16
          Width = 647
          Height = 62
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object lbFluxoClienteNome: TLabel
            Left = 184
            Top = 5
            Width = 27
            Height = 14
            Caption = 'Nome'
          end
          object lbFluxoClienteDoc: TLabel
            Left = 8
            Top = 5
            Width = 47
            Height = 14
            Caption = 'CPF/CNPJ'
          end
          object edFluxoClienteNome: TEdit
            Left = 184
            Top = 20
            Width = 425
            Height = 31
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object edFluxoClienteDoc: TEdit
            Left = 8
            Top = 20
            Width = 169
            Height = 31
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
        end
        object gbFluxoTotal: TGroupBox
          Left = 616
          Top = 1
          Width = 209
          Height = 79
          Caption = 'TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object pnFluxoTotalStr: TPanel
            Left = 2
            Top = 15
            Width = 205
            Height = 61
            Align = alTop
            BevelOuter = bvNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -35
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
        end
      end
      object gbxPIX: TGroupBox
        Left = 0
        Top = 434
        Width = 829
        Height = 42
        Align = alBottom
        Caption = 'PIX'
        TabOrder = 3
        object edFluxoCopiaECola: TEdit
          Left = 2
          Top = 12
          Width = 823
          Height = 27
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
    object tstLog: TTabSheet
      Caption = 'Log'
      ImageIndex = 1
      object mLog: TMemo
        Left = 0
        Top = 0
        Width = 887
        Height = 433
        Align = alClient
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
  object ACBrPixCD1: TACBrPixCD
    Recebedor.UF = 'SP'
    Recebedor.CEP = '18272230'
    Recebedor.CodCategoriaComerciante = 0
    DadosAutomacao.NomeSoftwareHouse = 'Projeto ACBr'
    DadosAutomacao.CNPJSoftwareHouse = '18760540000139'
    DadosAutomacao.NomeAplicacao = 'ACBrPIXCDTeste'
    DadosAutomacao.VersaoAplicacao = '1.0'
    PSP = ACBrPSPSantander1
    Left = 24
    Top = 40
  end
  object ACBrPSPSantander1: TACBrPSPSantander
    ACBrPixCD = ACBrPixCD1
    Left = 52
    Top = 40
  end
  object ACBrPSPBancoDoBrasil1: TACBrPSPBancoDoBrasil
    Left = 80
    Top = 40
  end
  object ACBrPSPItau1: TACBrPSPItau
    Left = 108
    Top = 40
  end
  object ACBrPSPShipay1: TACBrPSPShipay
    Left = 136
    Top = 40
  end
  object ACBrPSPSicredi1: TACBrPSPSicredi
    Left = 168
    Top = 40
  end
  object ACBrPSPSicoob1: TACBrPSPSicoob
    Left = 208
    Top = 40
  end
  object qryContasCobrancaPIX: TtecQuery
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
      'select banco,'
      '       agencia,'
      ''
      '       PIX_Key,'
      '       Type_PIX_Key,'
      '       Consumer_Key,'
      '       Consumer_Secret,'
      '       Path_File_PIXCertified,'
      '       Pass_PIXCertified,'
      ''
      '       Ambiente_cobranca_PIX,'
      '       Tempo_Espera_cobranca_PIX,'
      '       Expiracao_cobranca_PIX'
      ''
      'from contas'
      'where conta = :ContaCobrancaPIX')
    RequestLive = False
    Left = 68
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ContaCobrancaPIX'
        ParamType = ptUnknown
      end>
    object qryContasCobrancaPIXbanco: TIntegerField
      FieldName = 'banco'
    end
    object qryContasCobrancaPIXagencia: TIntegerField
      FieldName = 'agencia'
    end
    object qryContasCobrancaPIXpix_key: TStringField
      FieldName = 'pix_key'
      Size = 100
    end
    object qryContasCobrancaPIXtype_pix_key: TStringField
      FieldName = 'type_pix_key'
    end
    object qryContasCobrancaPIXconsumer_key: TStringField
      FieldName = 'consumer_key'
      Size = 100
    end
    object qryContasCobrancaPIXconsumer_secret: TStringField
      FieldName = 'consumer_secret'
      Size = 100
    end
    object qryContasCobrancaPIXpath_file_pixcertified: TStringField
      FieldName = 'path_file_pixcertified'
      Size = 300
    end
    object qryContasCobrancaPIXpass_pixcertified: TStringField
      FieldName = 'pass_pixcertified'
      Size = 300
    end
    object qryContasCobrancaPIXambiente_cobranca_pix: TStringField
      FieldName = 'ambiente_cobranca_pix'
    end
    object qryContasCobrancaPIXtempo_espera_cobranca_pix: TStringField
      FieldName = 'tempo_espera_cobranca_pix'
      Size = 6
    end
    object qryContasCobrancaPIXexpiracao_cobranca_pix: TStringField
      FieldName = 'expiracao_cobranca_pix'
      Size = 6
    end
  end
  object tmConsultarPagto: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = tmConsultarPagtoTimer
    Left = 696
    Top = 216
  end
  object tmConsultarDevolucao: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = tmConsultarDevolucaoTimer
    Left = 728
    Top = 200
  end
end
