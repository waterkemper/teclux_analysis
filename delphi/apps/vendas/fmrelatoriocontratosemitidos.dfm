inherited frmrelatoriocontratosemitidos: Tfrmrelatoriocontratosemitidos
  Left = 641
  Top = 61
  Caption = 'Relat'#243'rio de Contratos Emitidos'
  ClientHeight = 669
  ClientWidth = 674
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TToolBar
    Width = 674
  end
  inherited pnlFundoJanela: TPanel
    Top = 40
    Width = 674
    Height = 633
    Align = alTop
    object gbxContratosEmitidos: TGroupBox
      Left = 3
      Top = 3
      Width = 668
      Height = 627
      Align = alClient
      TabOrder = 0
      object gbxPeriodo: TGroupBox
        Left = 8
        Top = 453
        Width = 257
        Height = 43
        Caption = 'Per'#237'odo de faturamento'
        TabOrder = 8
        object lblDataInicial: TLabel
          Left = 8
          Top = 20
          Width = 33
          Height = 16
          Alignment = taRightJustify
          Caption = 'Inicial'
        end
        object lblDataFinal: TLabel
          Left = 137
          Top = 20
          Width = 28
          Height = 16
          Alignment = taRightJustify
          Caption = 'Final'
        end
        object edtDataInicial: TEditData
          Left = 45
          Top = 16
          Width = 80
          Height = 24
          MaxLength = 10
          TabOrder = 0
          Minimo = 37353
          Maximo = 0
        end
        object edtDataFinal: TEditData
          Left = 169
          Top = 16
          Width = 80
          Height = 24
          MaxLength = 10
          TabOrder = 1
          Minimo = 37353
          Maximo = 0
        end
      end
      object rgpTipo: TRadioGroup
        Left = 270
        Top = 453
        Width = 254
        Height = 83
        Caption = 'Tipo'
        ItemIndex = 3
        Items.Strings = (
          '&Exclui Parcelas Quitadas'
          'Entrada ou Venda a &Vista n'#227'o Quitada'
          'Contratos Totalmente &Quitados'
          '&Todos')
        TabOrder = 12
        OnClick = rgpTipoClick
      end
      object rgpOrdenacao: TRadioGroup
        Left = 530
        Top = 160
        Width = 127
        Height = 97
        Caption = 'Ordena'#231#227'o'
        ItemIndex = 0
        Items.Strings = (
          '&Data Emiss'#227'o'
          '&C'#243'digo Cliente'
          '&Nome Cliente')
        TabOrder = 6
      end
      object rgpResumo: TRadioGroup
        Left = 530
        Top = 453
        Width = 129
        Height = 83
        Caption = 'Resumo'
        ItemIndex = 0
        Items.Strings = (
          'Com R&esumo'
          '&Sem Resumo'
          'S'#243' Res&umo')
        TabOrder = 14
      end
      object gbxAgentes: TGroupBox
        Left = 8
        Top = 136
        Width = 257
        Height = 126
        Caption = '&Agentes'
        TabOrder = 2
        object sbnMarcarAgentes: TSpeedButton
          Left = 224
          Top = 18
          Width = 22
          Height = 22
          Hint = 'Marcar Agentes'
          Flat = True
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFF
            FFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCFF0000000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFF
            FFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCFF0000FF0000FF0000000000DCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F
            7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCFF0000FF0000FF0000000000DCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F
            7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCFF0000FF0000FF0000FF0000FF0000000000DCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            FF0000FF0000FF0000FF0000FF0000FF0000000000DCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F
            FF0000FF0000000000DCDCDCFF0000FF0000FF0000000000DCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7FDCDCDC7F7F7F7F
            7F7F7F7F7F7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFF0000
            000000DCDCDCDCDCDCDCDCDCDCDCDCFF0000FF0000000000DCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDC7F
            7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFF0000FF0000FF0000000000DCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F
            7F7F7F7F7F7F7F7F7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFF0000FF0000000000DCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDC7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFF0000FF0000000000DCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDC7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFF00000000
            00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFF00
            00000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCFF0000FF0000000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
          NumGlyphs = 2
          OnClick = sbnMarcarAgentesClick
        end
        object sbnDesmarcarAgentes: TSpeedButton
          Left = 224
          Top = 42
          Width = 22
          Height = 22
          Hint = 'Desmarcar Agentes'
          Flat = True
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFFFFFFDCDCDCDC
            DCDCFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFFFFFFDCDCDCDCDCDC
            0000FF0000FF0000FFDCDCDCDCDCDC7F7F7F0000007F7F7FDCDCDCDCDCDC0000
            FF0000FF0000FFDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDC
            DCDC7F7F7FFFFFFFFFFFFFDCDCDC7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC
            DCDCDC0000FF0000FF0000FFDCDCDC000000000000000000DCDCDC0000FF0000
            FF0000FFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FFFFFFF7F
            7F7F7F7F7F7F7F7FFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDC0000FF0000FF0000FF7F7F7F0000007F7F7F0000FF0000FF0000
            FFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FFF
            FFFF7F7F7FDCDCDC7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDC0000FF0000FF0000FFDCDCDC0000FF0000FF0000FFDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F
            7F7FDCDCDC7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDC0000FF0000FF0000000000FF0000FFDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FDC
            DCDC7F7F7FFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC000080000000000080DCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F
            7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDC0000FF0000800000000000800000FFDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F
            7F7F7F7F7F7F7F7FDCDCDCFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDC0000FF0000FF0000000000000000000000FF0000FFDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDC7F
            7F7F7F7F7F7F7F7FDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDC0000FF0000FF0000FF0000000000000000000000FF0000FF0000
            FFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FDCDCDC7F
            7F7F7F7F7F7F7F7FDCDCDC7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDC
            DCDCDC0000FF0000FF0000FFDCDCDC000000000000000000DCDCDC0000FF0000
            FF0000FFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDCDCDC7F
            7F7F7F7F7F7F7F7FFFFFFF7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDC
            0000FF0000FF0000FFDCDCDCDCDCDC7F7F7F0000007F7F7FDCDCDCDCDCDC0000
            FF0000FF0000FFDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDC
            DCDC7F7F7FDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
          NumGlyphs = 2
          OnClick = sbnDesmarcarAgentesClick
        end
        object clbAgentes: TCheckListBox
          Left = 5
          Top = 17
          Width = 212
          Height = 102
          ItemHeight = 15
          Style = lbOwnerDrawVariable
          TabOrder = 0
        end
      end
      object gbxAnalistaCredito: TGroupBox
        Left = 270
        Top = 136
        Width = 254
        Height = 126
        Caption = '&Analistas de Cr'#233'dito'
        TabOrder = 3
        object sbnMarcarAnalistaCredito: TSpeedButton
          Left = 225
          Top = 18
          Width = 22
          Height = 22
          Hint = 'Marcar Conceitos'
          Flat = True
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFF
            FFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCFF0000000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFF
            FFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCFF0000FF0000FF0000000000DCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F
            7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCFF0000FF0000FF0000000000DCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F
            7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCFF0000FF0000FF0000FF0000FF0000000000DCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            FF0000FF0000FF0000FF0000FF0000FF0000000000DCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F
            FF0000FF0000000000DCDCDCFF0000FF0000FF0000000000DCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7FDCDCDC7F7F7F7F
            7F7F7F7F7F7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFF0000
            000000DCDCDCDCDCDCDCDCDCDCDCDCFF0000FF0000000000DCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDC7F
            7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFF0000FF0000FF0000000000DCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F
            7F7F7F7F7F7F7F7F7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFF0000FF0000000000DCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDC7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFF0000FF0000000000DCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDC7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFF00000000
            00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFF00
            00000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCFF0000FF0000000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
          NumGlyphs = 2
          OnClick = sbnMarcarAnalistaCreditoClick
        end
        object sbnDesmarcarAnalistaCredito: TSpeedButton
          Left = 225
          Top = 42
          Width = 22
          Height = 22
          Hint = 'Desmarcar Conceitos'
          Flat = True
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFFFFFFDCDCDCDC
            DCDCFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFFFFFFDCDCDCDCDCDC
            0000FF0000FF0000FFDCDCDCDCDCDC7F7F7F0000007F7F7FDCDCDCDCDCDC0000
            FF0000FF0000FFDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDC
            DCDC7F7F7FFFFFFFFFFFFFDCDCDC7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC
            DCDCDC0000FF0000FF0000FFDCDCDC000000000000000000DCDCDC0000FF0000
            FF0000FFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FFFFFFF7F
            7F7F7F7F7F7F7F7FFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDC0000FF0000FF0000FF7F7F7F0000007F7F7F0000FF0000FF0000
            FFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FFF
            FFFF7F7F7FDCDCDC7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDC0000FF0000FF0000FFDCDCDC0000FF0000FF0000FFDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F
            7F7FDCDCDC7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDC0000FF0000FF0000000000FF0000FFDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FDC
            DCDC7F7F7FFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC000080000000000080DCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F
            7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDC0000FF0000800000000000800000FFDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F
            7F7F7F7F7F7F7F7FDCDCDCFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDC0000FF0000FF0000000000000000000000FF0000FFDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDC7F
            7F7F7F7F7F7F7F7FDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDC0000FF0000FF0000FF0000000000000000000000FF0000FF0000
            FFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FDCDCDC7F
            7F7F7F7F7F7F7F7FDCDCDC7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDC
            DCDCDC0000FF0000FF0000FFDCDCDC000000000000000000DCDCDC0000FF0000
            FF0000FFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDCDCDC7F
            7F7F7F7F7F7F7F7FFFFFFF7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDC
            0000FF0000FF0000FFDCDCDCDCDCDC7F7F7F0000007F7F7FDCDCDCDCDCDC0000
            FF0000FF0000FFDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDC
            DCDC7F7F7FDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
          NumGlyphs = 2
          OnClick = sbnDesmarcarAnalistaCreditoClick
        end
        object clbAnalistaCredito: TCheckListBox
          Left = 8
          Top = 17
          Width = 209
          Height = 102
          ItemHeight = 15
          Style = lbOwnerDrawVariable
          TabOrder = 0
        end
      end
      object gbxAgrupamento: TGroupBox
        Left = 530
        Top = 72
        Width = 129
        Height = 73
        Caption = 'Agrupamento'
        TabOrder = 5
        object ckbAgruparGrupoFilial: TCheckBox
          Left = 6
          Top = 16
          Width = 115
          Height = 25
          Caption = '&Grupo de Filial'
          TabOrder = 0
        end
        object ckbAgruparFilial: TCheckBox
          Left = 6
          Top = 36
          Width = 115
          Height = 25
          Caption = '&Filial'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
      end
      object gbxTotalizacao: TGroupBox
        Left = 530
        Top = 8
        Width = 128
        Height = 57
        Caption = 'Exibir Totaliza'#231#227'o'
        TabOrder = 4
        object ckbTotaisPorContrato: TCheckBox
          Left = 6
          Top = 17
          Width = 107
          Height = 30
          Caption = 'Por contrato'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
      end
      object gbxQuitacao: TGroupBox
        Left = 8
        Top = 495
        Width = 257
        Height = 41
        Caption = 'Per'#237'odo de quita'#231#227'o do contrato'
        TabOrder = 9
        object Label1: TLabel
          Left = 8
          Top = 19
          Width = 33
          Height = 16
          Alignment = taRightJustify
          Caption = 'Inicial'
        end
        object Label2: TLabel
          Left = 137
          Top = 19
          Width = 28
          Height = 16
          Alignment = taRightJustify
          Caption = 'Final'
        end
        object edtQuitacaoInicial: TEditData
          Left = 45
          Top = 15
          Width = 80
          Height = 24
          MaxLength = 10
          TabOrder = 0
          Minimo = 37353
          Maximo = 0
        end
        object edtQuitacaoFinal: TEditData
          Left = 169
          Top = 15
          Width = 80
          Height = 24
          MaxLength = 10
          TabOrder = 1
          Minimo = 37353
          Maximo = 0
        end
      end
      object gbxOpcao: TGroupBox
        Left = 6
        Top = 535
        Width = 259
        Height = 49
        Caption = 'Op'#231#227'o'
        TabOrder = 10
        object ckbNaoListarParcelas: TCheckBox
          Left = 65
          Top = 13
          Width = 169
          Height = 14
          Caption = 'N'#227'o listar as parcelas'
          TabOrder = 0
        end
        object ckbContratoComObs: TCheckBox
          Left = 65
          Top = 29
          Width = 176
          Height = 14
          Caption = 'Contrato com observa'#231#245'es'
          TabOrder = 1
        end
      end
      object gbxTipodeVenda: TGroupBox
        Left = 270
        Top = 545
        Width = 254
        Height = 39
        Caption = 'Tipo de Venda'
        TabOrder = 13
        object ckbVendaaVista: TCheckBox
          Left = 93
          Top = 19
          Width = 73
          Height = 14
          Caption = 'a &Vista'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object ckbVendaaPrazo: TCheckBox
          Left = 176
          Top = 19
          Width = 73
          Height = 14
          Caption = 'a &Prazo'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
      end
      inline fraListaFiliais1: TfraListaFiliais
        Left = 8
        Top = 1
        Width = 257
        Height = 134
        TabOrder = 0
        inherited gbxFiliais: TGroupBox
          Width = 257
          Height = 134
          inherited sbnMarcarFiliais: TSpeedButton
            Left = 224
            OnClick = fraListaFiliais1sbnMarcarFiliaisClick
          end
          inherited sbnDesmarcarFiliais: TSpeedButton
            Left = 224
          end
          inherited clbFiliais: TCheckListBox
            Width = 212
            Height = 110
            OnClickCheck = fraListaFiliais1clbFiliaisClickCheck
          end
        end
      end
      inline fraListaGruposFiliais1: TfraListaGruposFiliais
        Left = 270
        Top = 1
        Width = 254
        Height = 134
        TabOrder = 1
        inherited gbxGrupodeFiliais: TGroupBox
          Width = 254
          Height = 134
          inherited sbnmarcarGrupodeFiliais: TSpeedButton
            Left = 224
            OnClick = fraListaGruposFiliais1sbnmarcarGrupodeFiliaisClick
          end
          inherited sbnDesmarcarGrupodeFiliais: TSpeedButton
            Left = 224
          end
          inherited clbGrupodeFiliais: TCheckListBox
            Width = 211
            Height = 111
            OnClickCheck = fraListaGruposFiliais1clbGrupodeFiliaisClickCheck
          end
        end
      end
      object pgcSelecaoAleatoria: TPageControl
        Left = 8
        Top = 264
        Width = 657
        Height = 185
        ActivePage = tstClientes
        TabOrder = 7
        object tstClientes: TTabSheet
          Caption = 'Clientes'
          inline fraSelecaoAleatoriaClientes1: TfraSelecaoAleatoriaClientes
            Left = 0
            Top = 0
            Width = 649
            Height = 154
            Align = alClient
            TabOrder = 0
            inherited fraSelecaoAleatoriaCliente: TfraSelecaoAleatoria
              Width = 649
              Height = 154
              inherited Splitter1: TSplitter
                Left = 618
                Height = 139
              end
              inherited dbgSelecaoAleatoria: TtecDBGrid
                Width = 618
                Height = 139
              end
              inherited pnlLabels: TPanel
                Left = 621
                Height = 139
              end
              inherited pnlAbaixo: TPanel
                Top = 139
                Width = 649
                inherited pnlAbaixoDireita: TPanel
                  Left = 618
                  Font.Pitch = fpVariable
                end
              end
            end
          end
        end
        object tstProdutos: TTabSheet
          Caption = 'Produtos'
          ImageIndex = 1
          inline fraMultiplaSelecaoAleatoria1: TfraMultiplaSelecaoAleatoria
            Left = 0
            Top = 0
            Width = 649
            Height = 154
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            inherited pgcMultiplaSelecaoAleatoria: TtecPageControl
              Width = 649
              Height = 154
              ActivePage = fraMultiplaSelecaoAleatoria1.tstItemdeProduto
              Font.Pitch = fpVariable
              inherited tstItemdeProduto: TTabSheet
                Font.Pitch = fpVariable
                inherited fraSelecaoAleatoriaItemdeProdutos: TfraSelecaoAleatoriaItemdeProdutos
                  Width = 641
                  Height = 124
                  inherited fraSelecaoAleatoriaItemdeProduto: TfraSelecaoAleatoria
                    Width = 641
                    Height = 100
                    inherited Splitter1: TSplitter
                      Left = 609
                      Height = 86
                    end
                    inherited dbgSelecaoAleatoria: TtecDBGrid
                      Width = 609
                      Height = 86
                    end
                    inherited pnlLabels: TPanel
                      Left = 612
                      Height = 86
                    end
                    inherited pnlAbaixo: TPanel
                      Top = 86
                      Width = 641
                      Font.Pitch = fpVariable
                      inherited lblOrientacao: TLabel
                        Font.Pitch = fpVariable
                      end
                      inherited pnlAbaixoDireita: TPanel
                        Left = 610
                        Font.Pitch = fpVariable
                      end
                    end
                  end
                  inherited pnlParametros: TPanel
                    Top = 100
                    Width = 641
                    Font.Pitch = fpVariable
                    inherited ckbProdutosComAgendamento: TCheckBox
                      Font.Pitch = fpVariable
                    end
                  end
                end
              end
              inherited tstProduto: TTabSheet
                inherited fraSelecaoAleatoriaprodutos: TfraSelecaoAleatoriaprodutos
                  inherited fraSelecaoAleatoriaProduto: TfraSelecaoAleatoria
                    inherited pnlAbaixo: TPanel
                      Font.Pitch = fpVariable
                      inherited lblOrientacao: TLabel
                        Font.Pitch = fpVariable
                      end
                      inherited pnlAbaixoDireita: TPanel
                        Font.Pitch = fpVariable
                      end
                    end
                  end
                end
              end
              inherited tstSelecaoAleatoriaGrupoProduto: TTabSheet
                inherited fraSelecaoaleatoriagruposprodutos: TfraSelecaoaleatoriagruposprodutos
                  inherited fraSelecaoAleatoriaGrupoProduto: TfraSelecaoAleatoria
                    inherited pnlAbaixo: TPanel
                      Font.Pitch = fpVariable
                      inherited lblOrientacao: TLabel
                        Font.Pitch = fpVariable
                      end
                      inherited pnlAbaixoDireita: TPanel
                        Font.Pitch = fpVariable
                      end
                    end
                  end
                end
              end
              inherited tstSelecaoAleatoriaClasseProduto: TTabSheet
                inherited fraSelecaoaleatoriaclassesprodutos: TfraSelecaoaleatoriaclassesprodutos
                  inherited fraSelecaoAleatoriaClasseProduto: TfraSelecaoAleatoria
                    inherited pnlAbaixo: TPanel
                      Font.Pitch = fpVariable
                      inherited lblOrientacao: TLabel
                        Font.Pitch = fpVariable
                      end
                      inherited pnlAbaixoDireita: TPanel
                        Font.Pitch = fpVariable
                      end
                    end
                  end
                end
              end
              inherited tstSelecaoAleatoriaMarcaProduto: TTabSheet
                inherited fraSelecaoAleatoriamarcasProdutos: TfraSelecaoAleatoriamarcasProdutos
                  inherited fraSelecaoAleatoriamarcasProduto: TfraSelecaoAleatoria
                    inherited Splitter1: TSplitter
                      Left = 609
                    end
                    inherited dbgSelecaoAleatoria: TtecDBGrid
                      Width = 609
                    end
                    inherited pnlLabels: TPanel
                      Left = 612
                    end
                    inherited pnlAbaixo: TPanel
                      Font.Pitch = fpVariable
                      inherited lblOrientacao: TLabel
                        Font.Pitch = fpVariable
                      end
                      inherited pnlAbaixoDireita: TPanel
                        Left = 610
                        Font.Pitch = fpVariable
                      end
                    end
                  end
                end
              end
              inherited tstSelecaoAleatoriamodelosProduto: TTabSheet
                inherited fraSelecaoAleatoriamodelosProdutos1: TfraSelecaoAleatoriamodelosProdutos
                  inherited fraSelecaoAleatoriamodelosProduto: TfraSelecaoAleatoria
                    inherited pnlAbaixo: TPanel
                      Font.Pitch = fpVariable
                      inherited lblOrientacao: TLabel
                        Font.Pitch = fpVariable
                      end
                      inherited pnlAbaixoDireita: TPanel
                        Font.Pitch = fpVariable
                      end
                    end
                  end
                end
              end
              inherited tstSelecaoAleatoriaespecificacoesmodelos: TTabSheet
                inherited fraSelecaoAleatoriaespecificacoesmodelos1: TfraSelecaoAleatoriaespecificacoesmodelos
                  inherited fraSelecaoAleatoriaespecificacoesmodelos: TfraSelecaoAleatoria
                    inherited pnlAbaixo: TPanel
                      Font.Pitch = fpVariable
                      inherited lblOrientacao: TLabel
                        Font.Pitch = fpVariable
                      end
                      inherited pnlAbaixoDireita: TPanel
                        Font.Pitch = fpVariable
                      end
                    end
                  end
                end
              end
              inherited tstSelecaoAleatoriaPromocoes: TTabSheet
                inherited fraSelecaoaleatoriapromocoes: TfraSelecaoaleatoriapromocoes
                  inherited fraSelecaoAleatoriapromocoes: TfraSelecaoAleatoria
                    inherited Splitter1: TSplitter
                      Left = 609
                    end
                    inherited dbgSelecaoAleatoria: TtecDBGrid
                      Width = 609
                    end
                    inherited pnlLabels: TPanel
                      Left = 612
                    end
                    inherited pnlAbaixo: TPanel
                      Font.Pitch = fpVariable
                      inherited lblOrientacao: TLabel
                        Font.Pitch = fpVariable
                      end
                      inherited pnlAbaixoDireita: TPanel
                        Left = 610
                        Font.Pitch = fpVariable
                      end
                    end
                  end
                end
              end
              inherited tstCST: TTabSheet
                inherited fraSelecaoAleatoriacst: TfraSelecaoAleatoriacst
                  inherited fraSelecaoAleatoriacst: TfraSelecaoAleatoria
                    inherited pnlAbaixo: TPanel
                      Font.Pitch = fpVariable
                      inherited lblOrientacao: TLabel
                        Font.Pitch = fpVariable
                      end
                      inherited pnlAbaixoDireita: TPanel
                        Font.Pitch = fpVariable
                      end
                    end
                  end
                end
              end
              inherited tstCSOSN: TTabSheet
                inherited fraSelecaoAleatoriacsosn: TfraSelecaoAleatoriacsosn
                  inherited fraSelecaoAleatoriacsosn: TfraSelecaoAleatoria
                    inherited pnlAbaixo: TPanel
                      Font.Pitch = fpVariable
                      inherited lblOrientacao: TLabel
                        Font.Pitch = fpVariable
                      end
                      inherited pnlAbaixoDireita: TPanel
                        Font.Pitch = fpVariable
                      end
                    end
                  end
                end
              end
              inherited tstListaPadronizada: TTabSheet
                inherited fraSelecaoaleatorialistaspadronizadas: TfraSelecaoaleatorialistaspadronizadas
                  inherited fraSelecaoAleatoriaListasPadronizadas: TfraSelecaoAleatoria
                    inherited pnlAbaixo: TPanel
                      Font.Pitch = fpVariable
                      inherited lblOrientacao: TLabel
                        Font.Pitch = fpVariable
                      end
                      inherited pnlAbaixoDireita: TPanel
                        Font.Pitch = fpVariable
                      end
                    end
                  end
                end
              end
              inherited tstSelecaoAleatoriaLocalizacoesEstoques: TTabSheet
                inherited fraSelecaoaleatorialocalizacaoestoque1: TfraSelecaoaleatorialocalizacaoestoque
                  inherited fraSelecaoAleatoriaLocalizacaoEstoque: TfraSelecaoAleatoria
                    inherited pnlAbaixo: TPanel
                      Font.Pitch = fpVariable
                      inherited lblOrientacao: TLabel
                        Font.Pitch = fpVariable
                      end
                      inherited pnlAbaixoDireita: TPanel
                        Font.Pitch = fpVariable
                      end
                    end
                  end
                end
              end
              inherited tstSelecaoAleatoriaLotes: TTabSheet
                inherited fraSelecaoAleatorialotes1: TfraSelecaoAleatorialotes
                  inherited fraSelecaoAleatorialotes: TfraSelecaoAleatoria
                    inherited pnlAbaixo: TPanel
                      Font.Pitch = fpVariable
                      inherited lblOrientacao: TLabel
                        Font.Pitch = fpVariable
                      end
                      inherited pnlAbaixoDireita: TPanel
                        Font.Pitch = fpVariable
                      end
                    end
                  end
                end
              end
              inherited tstSelecaoAleatoriaMarketPlace: TTabSheet
                inherited fraSelecaoaleatoriamarketplace1: TfraSelecaoaleatoriamarketplace
                  Width = 641
                  Height = 124
                  inherited fraSelecaoAleatoriamarketplace: TfraSelecaoAleatoria
                    Width = 641
                    Height = 124
                    inherited Splitter1: TSplitter
                      Height = 109
                    end
                    inherited dbgSelecaoAleatoria: TtecDBGrid
                      Height = 109
                    end
                    inherited pnlLabels: TPanel
                      Height = 109
                    end
                    inherited pnlAbaixo: TPanel
                      Top = 109
                      Width = 641
                      Font.Pitch = fpVariable
                      inherited lblOrientacao: TLabel
                        Font.Pitch = fpVariable
                      end
                      inherited pnlAbaixoDireita: TPanel
                        Left = 610
                        Font.Pitch = fpVariable
                      end
                    end
                  end
                end
              end
              inherited tstAtributos: TTabSheet
                inherited fraSelecaoAleatoriaatributos1: TfraSelecaoAleatoriaatributos
                  inherited fraSelecaoAleatoriaatributos: TfraSelecaoAleatoria
                    inherited pnlAbaixo: TPanel
                      Font.Pitch = fpVariable
                      inherited lblOrientacao: TLabel
                        Font.Pitch = fpVariable
                      end
                      inherited pnlAbaixoDireita: TPanel
                        Font.Pitch = fpVariable
                      end
                    end
                  end
                end
              end
              inherited tstSelecaoAleatoriaServicos: TTabSheet
                inherited fraSelecaoaleatoriaservicos1: TfraSelecaoaleatoriaservicos
                  inherited fraSelecaoAleatoriaservicos: TfraSelecaoAleatoria
                    inherited pnlAbaixo: TPanel
                      Font.Pitch = fpVariable
                      inherited lblOrientacao: TLabel
                        Font.Pitch = fpVariable
                      end
                      inherited pnlAbaixoDireita: TPanel
                        Font.Pitch = fpVariable
                      end
                    end
                  end
                end
              end
            end
            inherited Timer1: TTimer
              OnTimer = fraMultiplaSelecaoAleatoria1Timer1Timer
            end
          end
        end
      end
      object gbxObservacaoContrato: TGroupBox
        Left = 2
        Top = 583
        Width = 664
        Height = 42
        Align = alBottom
        Caption = 'Filtrar Observa'#231#245'es'
        TabOrder = 11
        object edtFiltroObservacoes: TEditTexto
          Left = 1
          Top = 16
          Width = 572
          Height = 24
          MaxLength = -1
          TabOrder = 0
          CharCasenoDefault = True
          Alignment = taLeftJustify
        end
        object ckbConmSemObs: TCheckBox
          Left = 577
          Top = 15
          Width = 80
          Height = 24
          Caption = 'N'#227'o Cont'#233'm'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 1
          WordWrap = True
        end
      end
    end
  end
end
