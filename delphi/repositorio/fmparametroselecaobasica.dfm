inherited frmParametroSelecaoBasica: TfrmParametroSelecaoBasica
  Left = 297
  Top = 197
  Width = 473
  Height = 248
  VertScrollBar.Range = 173
  BorderIcons = [biSystemMenu]
  Caption = 'frmParametroSelecaoBasica'
  PixelsPerInch = 96
  TextHeight = 13
  inherited sptConsulta: TSplitter
    Top = 154
    Width = 465
  end
  inherited dbgConsulta: TtecDBGrid
    Top = 154
    Width = 465
    Height = 38
  end
  inherited pnlCabecalho: TPanel
    Width = 465
    Height = 154
    inherited pnlCabecalhoDePesquisa: TPanel
      Width = 465
      Height = 154
      inherited sbxItensConsulta: TScrollBox
        Width = 463
        Height = 152
        inherited pnlBotoes: TPanel
          Left = 375
          Height = 152
          object bbnExecutar: TBitBtn
            Left = 8
            Top = 54
            Width = 75
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'E&xecutar'
            TabOrder = 2
            OnClick = bbnExecutarClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
              3333333777333777FF33339993707399933333773337F3777FF3399933000339
              9933377333777F3377F3399333707333993337733337333337FF993333333333
              399377F33333F333377F993333303333399377F33337FF333373993333707333
              333377F333777F333333993333101333333377F333777F3FFFFF993333000399
              999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
              99933773FF777F3F777F339993707399999333773F373F77777F333999999999
              3393333777333777337333333999993333333333377777333333}
            NumGlyphs = 2
          end
          object pnlNrRegistros: TPanel
            Left = 6
            Top = 83
            Width = 79
            Height = 65
            Anchors = [akTop, akRight]
            BevelInner = bvLowered
            TabOrder = 3
            object lblNrRegistros: TLabel
              Left = 7
              Top = 2
              Width = 65
              Height = 35
              Alignment = taCenter
              AutoSize = False
              Caption = 'N'#250'mero Registros'
              Constraints.MaxHeight = 35
              Constraints.MaxWidth = 65
              Constraints.MinHeight = 35
              Constraints.MinWidth = 65
              WordWrap = True
            end
            object lblQtde: TLabel
              Left = 7
              Top = 43
              Width = 66
              Height = 15
              Alignment = taCenter
              AutoSize = False
            end
          end
        end
      end
    end
  end
  inherited stbMensagem: TStatusBar
    Top = 192
    Width = 465
  end
  inherited Source: TtecDataSource
    Left = 411
  end
end
