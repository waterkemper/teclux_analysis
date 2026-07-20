inherited frmTEFDedicado: TfrmTEFDedicado
  Left = 317
  Top = 130
  ActiveControl = pgcSiTEF
  Caption = 'SiTEF'
  ClientHeight = 382
  ClientWidth = 461
  PixelsPerInch = 96
  TextHeight = 16
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 0
    Width = 461
    Height = 382
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 0
    object pgcSiTEF: TPageControl
      Left = 3
      Top = 3
      Width = 455
      Height = 141
      ActivePage = tstVendas
      Align = alClient
      TabHeight = 1
      TabIndex = 0
      TabOrder = 0
      TabWidth = 1
      object tstVendas: TTabSheet
        DesignSize = (
          447
          130)
        object lblValor: TLabel
          Left = 64
          Top = 67
          Width = 29
          Height = 16
          Alignment = taRightJustify
          Caption = 'Valor'
        end
        object lblCupom: TLabel
          Left = 18
          Top = 39
          Width = 75
          Height = 16
          Alignment = taRightJustify
          Caption = 'Cupom fiscal'
        end
        object lblTerminal: TLabel
          Left = 44
          Top = 11
          Width = 48
          Height = 16
          Alignment = taRightJustify
          Caption = 'Terminal'
        end
        object bbnCancelar: TBitBtn
          Left = 256
          Top = 83
          Width = 117
          Height = 25
          Anchors = [akTop, akRight]
          Caption = '&Cancelar'
          TabOrder = 3
          OnClick = bbnCancelarClick
        end
        object bbnPreAutoriazacao: TBitBtn
          Left = 256
          Top = 58
          Width = 117
          Height = 25
          Anchors = [akTop, akRight]
          Caption = '&Pr'#233'-Autoriza'#231#227'o'
          TabOrder = 2
          OnClick = bbnPreAutoriazacaoClick
        end
        object bbnVenda: TBitBtn
          Left = 255
          Top = 8
          Width = 117
          Height = 25
          Anchors = [akTop, akRight]
          Caption = '&Venda'
          TabOrder = 0
          OnClick = bbnVendaClick
        end
        object edtTerminal: TEdit
          Left = 98
          Top = 8
          Width = 101
          Height = 24
          TabStop = False
          ReadOnly = True
          TabOrder = 4
        end
        object edtCupom: TEdit
          Left = 98
          Top = 36
          Width = 101
          Height = 24
          TabStop = False
          ReadOnly = True
          TabOrder = 5
        end
        object edtValor: TEdit
          Left = 98
          Top = 64
          Width = 101
          Height = 24
          TabStop = False
          ReadOnly = True
          TabOrder = 6
        end
        object bbnTeleMarketing: TBitBtn
          Left = 256
          Top = 33
          Width = 117
          Height = 25
          Anchors = [akTop, akRight]
          Caption = '&Telemarketing'
          TabOrder = 1
          OnClick = bbnTeleMarketingClick
        end
      end
    end
    object mmoMsg: TMemo
      Left = 3
      Top = 144
      Width = 455
      Height = 235
      TabStop = False
      Align = alBottom
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
end
