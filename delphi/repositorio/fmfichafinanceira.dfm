inherited frmFichaFinanceira: TfrmFichaFinanceira
  Left = 336
  Top = 1
  ActiveControl = dbgContratosPorCliente
  Caption = 'Ficha Financeira do Cliente'
  ClientHeight = 670
  ClientWidth = 817
  FormStyle = fsMDIChild
  Visible = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Width = 732
    TabOrder = 2
  end
  inherited pnlTopMenu: TPanel
    Width = 817
    inherited tblBarra: TToolBar
      Width = 816
      inherited sbnProcurar: TSpeedButton
        Visible = False
        OnClick = nil
      end
      inherited sbnAjuda: TSpeedButton
        Action = actHabilitarBotaoCalcular
      end
      object sbnDebitos: TSpeedButton
        Left = 84
        Top = 2
        Width = 75
        Height = 39
        Hint = 'Visualizar d'#233'bitos'
        Caption = 'D'#233'bitos F7'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
          73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
          0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
          0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
          0333337F777777737F333308888888880333337F333333337F33330888888888
          03333373FFFFFFFF733333700000000073333337777777773333}
        Layout = blGlyphTop
        NumGlyphs = 2
        Spacing = 0
        OnClick = sbnDebitosClick
      end
      object sbnContrato: TSpeedButton
        Left = 159
        Top = 2
        Width = 75
        Height = 39
        Hint = 'Acessar o contrato'
        Caption = 'Contrato F8'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
          FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
          00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
          F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
          00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
          F033777777777337F73309999990FFF0033377777777FFF77333099999000000
          3333777777777777333333399033333333333337773333333333333903333333
          3333333773333333333333303333333333333337333333333333}
        Layout = blGlyphTop
        NumGlyphs = 2
        Spacing = 0
        OnClick = sbnContratoClick
      end
      object sbnAtendimento: TSpeedButton
        Left = 234
        Top = 2
        Width = 98
        Height = 39
        Hint = 'Cadastro de atendimentos'
        Caption = 'Atendimento F10'
        Flat = True
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000DCDCDC00FFFF
          DCDCDC0000000000000000000000000000000000000000000000000000000000
          00000000DCDCDC00FFFFDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF7F7F7FDCDCDC00FFFF
          00FFFF0000000000FF0000800000800000800000800000800000800000800000
          8000000000FFFF00FFFFDCDCDC7F7F7F7F7F7F7F7F7FFFFFFFDCDCDCFFFFFFDC
          DCDCFFFFFFDCDCDCFFFFFFDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDC000080
          0000800000000000FFBFBFBF000000BFBFBF000000BFBFBF000000BFBFBF0000
          8000000000FFFFDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FFFFFFF7F7F7FDCDCDC7F
          7F7FDCDCDC7F7F7FDCDCDC7F7F7FDCDCDC7F7F7F7F7F7FDCDCDC000080DCDCDC
          DCDCDC0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          80000000DCDCDCDCDCDC7F7F7FFFFFFFDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCFF
          FFFFDCDCDCFFFFFFDCDCDCFFFFFFDCDCDC7F7F7FDCDCDCDCDCDC000080DCDCDC
          DCDCDCDCDCDC0000000000FFBFBFBF000000BFBFBF000000BFBFBF0000FF0000
          00DCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDC7F7F7FDCDCDC7F7F7FDC
          DCDC7F7F7FDCDCDC7F7F7FDCDCDC7F7F7FDCDCDCDCDCDCDCDCDC000080DCDCDC
          DCDCDCDCDCDCDCDCDC0000000000FF0000FF0000FF0000FF0000FF000000DCDC
          DCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF00FFFF000000
          00008000008000FFFF00000000000000000000000000000000000000000000FF
          FF00FFFF00FFFF00FFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F00FFFF000000
          00008000008000008000000000FFFF00FFFF00FFFF00FFFF00FFFF00000000FF
          FF00FFFF00FFFF00FFFF7F7F7F7F7F7FFFFFFFDCDCDC7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FDCDCDC000000
          000080000080000080000000BFBFBF00FFFF00FFFFDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDC7F7F7FDCDCDC7F
          7F7F7F7F7FFFFFFFDCDCDCFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCDCDCDC000000
          0000FF0000FF00008000008000008000FFFF00FFFFDCDCDC0000000000800000
          00000000DCDCDCDCDCDCDCDCDC7F7F7FDCDCDCFFFFFFDCDCDCDCDCDC7F7F7F7F
          7F7F7F7F7FFFFFFF7F7F7F7F7F7F7F7F7F7F7F7FDCDCDCFFFFFFDCDCDCDCDCDC
          0000800000FF0000FF0000FF0000800000000000000000800000000000800000
          80000080000000DCDCDCDCDCDCDCDCDC7F7F7FDCDCDCFFFFFFFFFFFFFFFFFF7F
          7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDC
          DCDCDC0000000000000000000000FF0000FF0000FF0000FF0000800000FF0000
          FF0000FF000000DCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDCDCDCFF
          FFFFFFFFFFFFFFFFFFFFFFDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDC
          DCDCDC00FFFF00FFFF7F7F7F0000800000000000000000800000FF0000FF0000
          80000080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FDCDCDC7F7F7F7F
          7F7F7F7F7F7F7F7FDCDCDCFFFFFFFFFFFF7F7F7FFFFFFFDCDCDCDCDCDCDCDCDC
          00FFFF00FFFFDCDCDCDCDCDCDCDCDC00FFFF00FFFF7F7F7F0000000000800000
          8000FFFFDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC7F
          7F7F7F7F7FFFFFFF7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDC00FFFF
          00FFFFDCDCDCDCDCDCDCDCDCDCDCDC00FFFF00FFFFDCDCDCDCDCDCDCDCDCDCDC
          DC00FFFF00FFFFDCDCDCDCDCDC7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDC7F
          7F7F7F7F7FFFFFFFDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFF00FFFF00FFFF
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC00FFFF00FFFFDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDC00FFFF00FFFF7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F
          7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F}
        Layout = blGlyphTop
        NumGlyphs = 2
        Spacing = 0
        OnClick = sbnAtendimentoClick
      end
      object sbnExibirJurosDescontos: TSpeedButton
        Left = 332
        Top = 2
        Width = 75
        Height = 39
        Hint = 'Exibir taxa juros/desconto'
        Caption = 'Taxas F11'
        Flat = True
        Glyph.Data = {
          36050000424D3605000000000000360000002800000015000000140000000100
          18000000000000050000120B0000120B00000000000000000000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000BFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFC0C0C000BFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFC0C0C000BFBFBFBFBFBF
          FFFFFFBFBFBFBFBFBFBFBFBFFFFFFFFF0000FF0000BFBFBFFFFFFFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFC0C0C000BFBFBFBFBFBF
          BFBFBFFFFFFFBFBFBFBFBFBFFF0000FF0000FF0000FF0000FF0000BFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFC0C0C000BFBFBFBFBFBF
          BFBFBFBFBFBFFFFFFFFF0000FF0000BFBFBFFFFFFFFF0000FF0000FF0000BFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFC0C0C000BFBFBFBFBFBF
          BFBFBFBFBFBFFF0000FF0000FFFFFFFFFFFFBFBFBFBFBFBFFF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000BFBFBFBFBFBFC0C0C000BFBFBFBFBFBF
          FFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFFF00
          00FF0000FF0000FF0000FF0000FF0000BFBFBFBFBFBFC0C0C000BFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFFF0000FF0000FF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFC0C0C000BFBFBFBFBFBF
          BFBFBFBFBFBFFFFFFFBFBFBFFF0000FF0000FF0000BFBFBFBFBFBFBFBFBFBFBF
          BF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFC0C0C000BFBFBFBFBFBF
          BFBFBFFFFFFFBFBFBFBFBFBFFFFFFFBFBFBFBFBFBFFFFFFFBFBFBFBFBFBFBFBF
          BFC0C7C0000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFC0C0C000BFBFBFBFBFBF
          FFFFFFBFBFBFBFBFBFBFBFBFFFFFFFBFBFBFBFBFBFBFBFBFFFFFFFBFBFBFBFBF
          BF00FF00C0C7C0000000BFBFBFBFBFBFBFBFBFBFBFBFC0C0C000BFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFC0C7C000FF00C0C7C0000000BFBFBFBFBFBFBFBFBFC0C0C000BFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BF00FF00C0C7C000FF00C0C7C0000000BFBFBFBFBFBFC0C0C000BFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFC0C7C000FF00C0C7C000FF00C0C7C0BFBFBFBFBFBFC0C0C000BFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BF00FF00C0C7C000FF00C0C7C0BFBFBFBFBFBFBFBFBFC0C0C000BFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFC0C7C000FF00C0C7C0BFBFBFBFBFBFBFBFBFBFBFBFC0C0C000BFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BF00FF00C0C7C0BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFC0C0C000BFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFC0C7C0BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFC0C0C000BFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFC0C0C000}
        Layout = blGlyphTop
        Spacing = 0
        OnClick = sbnExibirJurosDescontosClick
      end
      object sbnImprimir: TSpeedButton
        Left = 407
        Top = 2
        Width = 75
        Height = 39
        Hint = 'Visualizar como o relat'#243'rio ser'#225' impresso'
        Caption = 'Imprimir F12'
        Flat = True
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
        Spacing = 0
        OnClick = sbnImprimirClick
      end
      object sbnArquivosAnexados: TSpeedButton
        Left = 482
        Top = 2
        Width = 72
        Height = 39
        Hint = 'Gerenciar arquivos anexados a este cliente'
        AllowAllUp = True
        Anchors = [akTop, akRight]
        Constraints.MaxHeight = 39
        Constraints.MinHeight = 39
        Caption = 'Anexos'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Glyph.Data = {
          AE060000424DAE06000000000000360000002800000017000000170000000100
          1800000000007806000000000000000000000000000000000000FBFEF9F6FEF7
          F9FFF6FDF9FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFCFDFBFBFCFBFBFBFDFD00
          0000FBFBFDF3FBF9F6FDF6FFFFFF1A141A010000000000000000000000000000
          0000000100000000000000000000000100000000000000001C191AFFFFFFFEFA
          F7FFFBF9FEFBFC000000FFF7FFF9F9FDF6FBF9FFFFFF000000A8846ABD896BBD
          876DB7886BB38A69B68A69BE8869BB876AAF8869AC8A69B78968B68A6C9A816E
          000000FFFFFFFCFBFAFBFAF9FCFBFC000000FFFBFDFEF9FAFAFAF9FFFFFF0000
          00E9B088FFBA85FFB885FFBD8BFFBD8AFFBF89FFBE89FFBC8AFFBC8DFFBF8AFE
          BA80FFB885E5AD90000000FFFFFFF8FBFAF9F9FAF7FCFD000000FBFBFAF8FAF9
          FEFCF7FFFFFF000000E8A985FEB484D39C7A956A5894715B90735A93725A9871
          5D936F5C946D57DC997DFFB487E1A885000000FFFFFFF9FBFBFDFAFBFAFBFD00
          0000FDFCFCF4FBF9FAFBF8FFFFFF000000EAA885FFB889B17A5E401D163C271C
          392A1C3E281B43251D3B271C381F14B67662FFB68DD9A889000000FFFFFFFDFB
          F8FDFBF9FAFBFD000000FDFBFCF6FBFAF6FAFDFFFFFF000000ECAA86FFB27DF1
          B792D9AA90E1AD8FDEAF8BDDAF8EE3AC90DEAD92D6AE8CF4B988FCB381DCA78C
          000000FFFFFFFDFAF7FCFBF9F8FCFC000000F7FDFCFDFBFAFBF9FDFFFFFF0000
          00E8A887FFBD899567490A00001900001A00001900001F00001A0000100000A0
          6648FFBC8CDEA78B000000FFFFFFFBF8FCFCF9FCFCFCFA000000FCFCF8FEFAF9
          FCF8FDFFFFFF000000EAA789FFB380F9BD8FECC29DE4C3A6E8C2A7E4C3A6E7C2
          A5EAC0A7E8C2A4F4B991FDB283DFA68B000000FFFFFFFDF8FCFBFAFCFBFDFA00
          0000FAFBFBFBFAF7F7FAFEFFFFFF000000E7A883FFB88DA86F5B2A03042B110C
          2B100C260F0C29110C2D110C1D0A04A97555FFBB89E0A68B000000FFFFFFFDF8
          FCFCFAFDFAFDFA000000FDFBFCFDFAF9FAF9FCFFFFFF000000EDAA81FFB383D6
          A07FA47A64A67F64AB7C66A57B69A97D67AF7C65A87963DC9E7EFFB588E1A78B
          000000FFFFFFFDF8FCFCF9FCFAFDFB000000FEFBFCFAFAFAFCFAFBFFFFFF0000
          00F1AB81FAB17EFFB681FFBD89FFB784FFB988FFB688FFB686FFB887FFB889FF
          B087FEB184E1A78C000000FFFFFFFEF8FDFAF9FAFAFDFB000000FBFAFEF7F9F9
          F9FBFAFFFFFF000000ECAD81FBB992C79176C48B71F9BA90F7AF7BFFAF81FEAF
          80F7B180F6AF82FDAE7FFFB180DFA68B000000FFFFFFFEF9FDFAF8FAFAFCFA00
          0000FAF9FEFBFCFAFDFAF9FFFFFF000000EAB48BA47660030000040000825E41
          FFBD8DFEAD81FDAE7FFFAF7FFCAF82FFB37DFFB780E2A98D000000FFFFFFFDF9
          FDFAF8FAFCFCFB000000FDFBFCFAFAF8FEFDF8FFFFFF000000F2BE9B46241785
          624DAA887E391B11FFC190FFAF7EFCB180F9B17FF2B487E6AC84E8AE88CFA48D
          000000FFFFFFFDF9FBFCFAFAFCFDFC000000FAFBFDFFF9F8FCFEF5FFFFFF0000
          00F4C09444281D866146AB87753E1A15FDC090FCAD7DFEAE81FFC08E67443400
          0000090609000000000000FFFFFFFAFAFAFAFAFAFAFAFA000000F5FBFEF8FAF8
          F9FDF4FFFFFF000000F9C19646291D8A5F46B58274451A0FFFC08EFEAC81FCAB
          80FFC78E49351F44477163667E000000BFBFBFFFFFFFF9F9F9FAFAFAFBFBFB00
          0000F7FBFEF5FBF9FAFAF4FFFFFF000000FACAA8442F2685614BFAC59EDAA97F
          FFC397FFBC93FFBB8FFFD19D53402D0E142A000000C1C1C0FFFFFFFCFCFCF8F8
          F8FAFAFAFCFCFC000000FFFAFDFEF9F9FEFCF9FFFFFF0000005B3F34140B092D
          1F175F43335B433763473B5C3C315A3A2F614237160806000000BDC1C0FFFFFF
          FBFBFBFAFAFAF9F9F9FBFBFBFBFBFB000000FEFBFCFEF9F9F9FCF8FFFFFF8586
          8A877F7B1412144240408E898D6568670000007676757272777371726F706FCD
          CBCBFFFFFFFAFBFBFAFAFAFBFBFBFAFAFAFAFAFAFCFCFC000000F8FCFAFBFAF9
          F3FCF8F6FAFBFFFFFFFFFFFF8E8C8F000000CCCFD2454746323330FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFDF9FAFAFBFBFBFBFBFBFBFBFAFAFAFAFAFAFCFCFC00
          0000FAFCFCF9FCFBF7FBFBFAFBFAF9F8F9F8FAFEFFFFFF7778790000003B3A3C
          FFFFFFFCFAFEFBF9FBFAF9FCFAF9FCF8FAF9F8F8F9FAFAFAF9F9F9FAFAFAFBFB
          FBFAFAFAFCFCFC000000FFFAFDF8FBFCFEFAFAFCFCF9FEFCF9F7FAFBF9FDF7FF
          FFFFFFFFFFFFFFFFF9FEFDF7FFF7FCFEF7FDFAFBFDFBFCF9FDFAF9FCFBFCFCFC
          FCFCFCFBFBFBFCFCFCFBFBFBFDFDFD000000}
        ParentFont = False
        Spacing = 0
        OnClick = sbnArquivosAnexadosClick
      end
      object sbnLiberarClienteInadimplente: TSpeedButton
        Left = 554
        Top = 2
        Width = 68
        Height = 39
        Hint = 'Solicita a senha para a autoriza'#231#227'o da venda '#224' inadimplentes'
        Caption = 'Autoriza'#231#227'o'
        Flat = True
        Glyph.Data = {
          82060000424D8206000000000000360400002800000019000000150000000100
          0800000000004C020000C40E0000C40E00000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
          F6080807070808080708FFFFFFFFFF000000FFFFFFFF0807F7F7F7F7F7A4A46B
          2BA4A4A4A4F7F6FFFFFFFF000000FFFFFF08F79BACA4A4A4ACF7A47C7CF7ACAC
          ACA4F5FFFFFFFF000000FFFFFFFFF607FFFFFFFFFFFFBE7D7CF6FFFFF607FFFF
          FFFFFF000000FFFFFFFFFF07F6F6F6F6F6FFB47D7DBEFFF6F608FFFFFFFFFF00
          0000FFFFFFFFFF07F6F6F6F6FFB6BD747D74FFF6F608FFFFFFFFFF000000FFFF
          FFFFFF07F6070707070874077433F6F6F608FFFFFFFFFF000000FFFFFFFFFF07
          F6F6F6F6B5BEF6F6B57CB4FF0808FFFFFFFFFF000000FFFFFFFFFF07F6070707
          0707070707747C080708FFFFFFFFFF000000FFFFFFFFFF07F6F6F6F6F6F6F6F6
          F60874740708FFFFFFFFFF000000FFFFFFFFFF07F607070707070707070708B5
          6CF6FFFFFFFFFF000000FFFFFFFFFF07F6F6F6F6F6F60808080808B5B5B5FFFF
          FFFFFF000000FFFFFFFFFF07F60707070707070707070708082BB5FFFFFFFF00
          0000FFFFFFFFFF07F6F6090808080808080808F6F6086BBEFFFFFF000000FFFF
          FFFFFF07F6F6F6090808080808F6FFFFF608FFBEFFFFFF000000FFFFFFFFFF07
          F6F608FF08080808FF080707ADF6FFFFFFFFFF000000FFFFFFFFFF07080808F6
          0808F6F6FF070707F7FFFFFFFFFFFF000000FFFFFFFFFF0708F6080909FFFFFF
          FF0707A4FFFFFFFFFFFFFF000000FFFFFFFFFF08F7F7F7070707070707F707FF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF000000}
        Layout = blGlyphTop
        Spacing = 0
        OnClick = sbnLiberarClienteInadimplenteClick
      end
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 45
    Width = 817
    Height = 625
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object gbxFichaFinanceira: TGroupBox
      Left = 0
      Top = 0
      Width = 817
      Height = 625
      Align = alClient
      TabOrder = 0
      object pgcFichaFinanceira: TPageControl
        Left = 2
        Top = 39
        Width = 813
        Height = 584
        ActivePage = tstInformacoes
        Align = alClient
        MultiLine = True
        ParentShowHint = False
        ShowHint = True
        Style = tsButtons
        TabHeight = 1
        TabOrder = 0
        TabWidth = 1
        object tstInformacoes: TTabSheet
          Caption = 'tstInformacoes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          object lblContratos: TLabel
            Left = 1
            Top = 286
            Width = 56
            Height = 16
            Caption = 'Contrato&s'
            FocusControl = dbgContratosPorCliente
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
          end
          object dbgContratosPorCliente: TtecDBGrid
            Left = 0
            Top = 278
            Width = 222
            Height = 262
            Align = alLeft
            DataSource = dtmFichaFinanceira.dsrContratosPorCliente
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -13
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = []
            OnDrawColumnCell = dbgContratosPorClienteDrawColumnCell
            RowWrap = 60
            Large = False
            DoubleRowColor = False
            TitleMinHeight = 100
            CellHeights = 100
            StrippedColor = 16054260
            CanDelete = False
            CanNotInsertFromGrid = False
            PostOnEnter = False
            PostOnSetUpDown = False
            DenySort = False
            DefaultRowHeight = 19
            ExibirNumerodaLinha = False
            NaoAtribuirDadosaTabelaaoDigitar = False
            ShowWhenFieldInvisible = False
            CanClickWhenEditing = False
            Columns = <
              item
                Expanded = False
                FieldName = 'numero'
                Title.Alignment = taCenter
                Title.Caption = 'Contratos'
                Width = 100
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'situacaocontrato'
                Title.Alignment = taCenter
                Title.Caption = 'Situa'#231#227'o'
                Width = 82
                Visible = True
              end>
          end
          object pgcContratos: TtecPageControl
            Left = 222
            Top = 278
            Width = 583
            Height = 262
            ActivePage = tstParcelas
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            TabWidth = 90
            OnChange = pgcContratosChange
            object tstContratos: TTabSheet
              Caption = '&Geral'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ImageIndex = -1
              ParentFont = False
              object gbxContratos: TGroupBox
                Left = 0
                Top = 0
                Width = 575
                Height = 232
                Align = alClient
                TabOrder = 0
                object lblDataEmissao: TLabel
                  Left = 4
                  Top = 11
                  Width = 55
                  Height = 16
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'Emiss'#227'o'
                end
                object lblOrigem: TLabel
                  Left = 12
                  Top = 154
                  Width = 47
                  Height = 16
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'Anterior'
                end
                object lblReneg: TLabel
                  Left = 2
                  Top = 179
                  Width = 57
                  Height = 16
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'Renegoc.'
                end
                object lblPrimogenito: TLabel
                  Left = 4
                  Top = 128
                  Width = 55
                  Height = 16
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'Original'
                end
                object lblVendedor: TLabel
                  Left = 3
                  Top = 77
                  Width = 56
                  Height = 16
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'Vendedor'
                end
                object lblAvalista: TLabel
                  Left = 12
                  Top = 55
                  Width = 47
                  Height = 16
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'Avalista'
                end
                object lblFilial: TLabel
                  Left = 261
                  Top = 11
                  Width = 26
                  Height = 15
                  Caption = 'Filial'
                end
                object lblDependente: TLabel
                  Left = 1
                  Top = 203
                  Width = 57
                  Height = 16
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'Dep./Obs.'
                end
                object lblCobrador: TLabel
                  Left = 3
                  Top = 102
                  Width = 56
                  Height = 16
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'Cobrador'
                end
                object lblFaturamento: TLabel
                  Left = 136
                  Top = 11
                  Width = 43
                  Height = 16
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'Fatura'
                end
                object Label1: TLabel
                  Left = 20
                  Top = 31
                  Width = 39
                  Height = 16
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'Plano '
                end
                object dtxNomeDependente: TtecDBText
                  Left = 61
                  Top = 199
                  Width = 332
                  Height = 24
                  TabStop = False
                  Color = clBtnFace
                  DataField = 'nomedependente'
                  DataSource = dtmFichaFinanceira.dsrContratos
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 12
                  Alignment = taLeftJustify
                end
                object dtxEmissao: TtecDBText
                  Left = 61
                  Top = 7
                  Width = 75
                  Height = 23
                  TabStop = False
                  Color = clBtnFace
                  DataField = 'data'
                  DataSource = dtmFichaFinanceira.dsrContratos
                  ReadOnly = True
                  TabOrder = 0
                  Alignment = taLeftJustify
                end
                object dtxDescricaoVendedor: TtecDBText
                  Left = 61
                  Top = 73
                  Width = 332
                  Height = 23
                  TabStop = False
                  Color = clBtnFace
                  DataField = 'nome'
                  DataSource = dtmFichaFinanceira.dsrContratos
                  ReadOnly = True
                  TabOrder = 3
                  Alignment = taLeftJustify
                end
                object dtxNomeAvalista: TtecDBText
                  Left = 115
                  Top = 51
                  Width = 278
                  Height = 23
                  TabStop = False
                  Color = clBtnFace
                  DataField = 'nomeavalista'
                  DataSource = dtmFichaFinanceira.dsrContratos
                  ReadOnly = True
                  TabOrder = 8
                  Alignment = taLeftJustify
                end
                object dtxFilial: TtecDBText
                  Left = 292
                  Top = 7
                  Width = 35
                  Height = 23
                  TabStop = False
                  Color = clBtnFace
                  DataField = 'filialvenda'
                  DataSource = dtmFichaFinanceira.dsrContratos
                  ReadOnly = True
                  TabOrder = 9
                  Alignment = taLeftJustify
                end
                object dtxAvalista: TtecDBText
                  Left = 61
                  Top = 51
                  Width = 53
                  Height = 23
                  TabStop = False
                  Color = clBtnFace
                  DataField = 'avalista'
                  DataSource = dtmFichaFinanceira.dsrContratos
                  ReadOnly = True
                  TabOrder = 10
                  Alignment = taLeftJustify
                end
                object gbxValores: TGroupBox
                  Left = 397
                  Top = 44
                  Width = 179
                  Height = 177
                  TabOrder = 11
                  object lblValorPrazo: TStaticText
                    Left = 2
                    Top = 149
                    Width = 176
                    Height = 25
                    AutoSize = False
                    BorderStyle = sbsSingle
                    Caption = 'Valor prazo'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 10
                  end
                  object lblAcrescimo: TStaticText
                    Left = 2
                    Top = 130
                    Width = 176
                    Height = 22
                    AutoSize = False
                    BorderStyle = sbsSingle
                    Caption = 'Acr'#233'scimo'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 9
                  end
                  object lblValorVista: TStaticText
                    Left = 2
                    Top = 109
                    Width = 176
                    Height = 22
                    AutoSize = False
                    BorderStyle = sbsSingle
                    Caption = 'Valor vista'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 8
                  end
                  object lblDesconto: TStaticText
                    Left = 2
                    Top = 28
                    Width = 175
                    Height = 22
                    AutoSize = False
                    BorderStyle = sbsSingle
                    Caption = 'Desconto'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 7
                  end
                  object lblFrete: TStaticText
                    Left = 2
                    Top = 7
                    Width = 175
                    Height = 22
                    AutoSize = False
                    BorderStyle = sbsSingle
                    Caption = 'Frete'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 6
                  end
                  object dtxValorPrazo: TtecDBText
                    Left = 79
                    Top = 151
                    Width = 97
                    Height = 22
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'valor'
                    DataSource = dtmFichaFinanceira.dsrContratos
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 0
                    Alignment = taLeftJustify
                  end
                  object dtxFrete: TtecDBText
                    Left = 79
                    Top = 6
                    Width = 97
                    Height = 22
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'frete'
                    DataSource = dtmFichaFinanceira.dsrContratos
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 1
                    Alignment = taLeftJustify
                  end
                  object dtxAcrescimo: TtecDBText
                    Left = 79
                    Top = 129
                    Width = 97
                    Height = 22
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'acrescimo'
                    DataSource = dtmFichaFinanceira.dsrContratos
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 3
                    Alignment = taLeftJustify
                  end
                  object dtxValorVista: TtecDBText
                    Left = 79
                    Top = 108
                    Width = 97
                    Height = 22
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'valorvista'
                    DataSource = dtmFichaFinanceira.dsrContratos
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 4
                    Alignment = taLeftJustify
                  end
                  object pnlCupomDesconto: TPanel
                    Left = 2
                    Top = 50
                    Width = 175
                    Height = 38
                    BevelOuter = bvNone
                    TabOrder = 5
                    object edtValorCupomDesconto: TDBEditNumero
                      Left = 78
                      Top = 15
                      Width = 97
                      Height = 22
                      Color = clBtnFace
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'helvetica'
                      Font.Pitch = fpVariable
                      Font.Style = []
                      MaxLength = -1
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 1
                      Text = 'edtValorCupomDesconto'
                      Mascara = True
                      Alignment = taLeftJustify
                      TipoMascara = tmGERAL
                      NrDecimal = 2
                      Decimais = True
                      Negativo = False
                      Tamanho = 9
                      DataField = 'cupom_valor_desconto'
                      DataSource = dtmFichaFinanceira.dsrContratos
                    end
                    object lblCupomDesconto: TStaticText
                      Left = 0
                      Top = 0
                      Width = 175
                      Height = 18
                      AutoSize = False
                      BevelInner = bvSpace
                      BevelKind = bkFlat
                      BevelOuter = bvRaised
                      Caption = 'Cupom Desc.    | Valor'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Height = -11
                      Font.Name = 'helvetica'
                      Font.Pitch = fpVariable
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 0
                    end
                    inline fraConsultaCupom_Desconto: TfraConsultaCodigo
                      Left = -1
                      Top = 16
                      Width = 82
                      Height = 22
                      HorzScrollBar.Range = 497
                      HorzScrollBar.Visible = False
                      VertScrollBar.Range = 23
                      VertScrollBar.Visible = False
                      AutoScroll = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'helvetica'
                      Font.Pitch = fpVariable
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 2
                      inherited sbnProcura: TSpeedButton
                        Left = 80
                        Visible = False
                      end
                      inherited dtxDescricao: TtecDBText
                        Width = 0
                      end
                      inherited edfCodigo: TtecDBFindLookup
                        Width = 111
                        Height = 22
                        Color = clBtnFace
                        DataaFieldInterno = 'cupom_desconto'
                        DataaFieldVisual = 'codigo_cupom'
                        DataField = 'codigo_cupom'
                        DataSource = dtmFichaFinanceira.dsrContratos
                        Font.Height = -11
                        MaxLength = 100
                        LookupaFieldinterno = 'codigo'
                        LookupaFieldVisual = 'codigo_cupom'
                        LookupField = 'codigo_cupom'
                        LookupSource = fraConsultaCupom_Desconto.dsrProcuraCupons_Desconto
                        LookupQueryParameter = 'codigo_cupom'
                        Parameter = ' '
                        ActiveSetControls = False
                        DenyInsert = True
                        NoSetControls = <>
                        SetControls = <>
                        LookupParameter = 'codigo_cupom'
                      end
                    end
                  end
                  object dtxDesconto: TtecDBText
                    Left = 79
                    Top = 28
                    Width = 97
                    Height = 22
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'desconto'
                    DataSource = dtmFichaFinanceira.dsrContratos
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 2
                    Alignment = taLeftJustify
                  end
                  object blblCashBack: TStaticText
                    Left = 2
                    Top = 88
                    Width = 176
                    Height = 22
                    AutoSize = False
                    BorderStyle = sbsSingle
                    Caption = 'CashBack'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 11
                  end
                  object dtxdesconto_cashback: TtecDBText
                    Left = 80
                    Top = 87
                    Width = 97
                    Height = 22
                    TabStop = False
                    Color = clBtnFace
                    DataField = 'desconto_cashback'
                    DataSource = dtmFichaFinanceira.dsrContratos
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 12
                    Alignment = taLeftJustify
                  end
                end
                object dtxFaturamento: TtecDBText
                  Left = 181
                  Top = 7
                  Width = 75
                  Height = 23
                  TabStop = False
                  Color = clBtnFace
                  DataField = 'data'
                  DataSource = dtmFichaFinanceira.dsrContratos
                  ReadOnly = True
                  TabOrder = 14
                  Alignment = taLeftJustify
                end
                object dtxPlanoResumido: TtecDBText
                  Left = 396
                  Top = 27
                  Width = 100
                  Height = 23
                  TabStop = False
                  Color = clBtnFace
                  DataField = 'planoresumido'
                  DataSource = dtmFichaFinanceira.dsrContratos
                  ReadOnly = True
                  TabOrder = 15
                  Alignment = taLeftJustify
                end
                object dtxDescricaoPlano: TtecDBText
                  Left = 100
                  Top = 28
                  Width = 294
                  Height = 23
                  TabStop = False
                  Color = clBtnFace
                  DataField = 'descricaoplano'
                  DataSource = dtmFichaFinanceira.dsrContratos
                  ReadOnly = True
                  TabOrder = 16
                  Alignment = taLeftJustify
                end
                object dtxNomeCobrador: TtecDBText
                  Left = 61
                  Top = 98
                  Width = 332
                  Height = 23
                  TabStop = False
                  Color = clBtnFace
                  DataField = 'nomecobrador'
                  DataSource = dtmFichaFinanceira.dsrContratos
                  ReadOnly = True
                  TabOrder = 13
                  Alignment = taLeftJustify
                end
                object dtxPrimogenito: TtecDBText
                  Left = 61
                  Top = 124
                  Width = 100
                  Height = 24
                  TabStop = False
                  Color = clBtnFace
                  DataField = 'primogenito'
                  DataSource = dtmFichaFinanceira.dsrContratos
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clOlive
                  Font.Height = -13
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 4
                  Alignment = taLeftJustify
                end
                object dtxNomeClientePrimogenito: TtecDBText
                  Left = 162
                  Top = 124
                  Width = 231
                  Height = 24
                  TabStop = False
                  Color = clBtnFace
                  DataField = 'nomeclienteprimogenito'
                  DataSource = dtmFichaFinanceira.dsrContratos
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clOlive
                  Font.Height = -13
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 7
                  Alignment = taLeftJustify
                end
                object dtxOrigem: TtecDBText
                  Left = 61
                  Top = 150
                  Width = 100
                  Height = 24
                  TabStop = False
                  Color = clBtnFace
                  DataField = 'origem'
                  DataSource = dtmFichaFinanceira.dsrContratos
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
                  Font.Height = -13
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 1
                  Alignment = taLeftJustify
                end
                object dtxNomeClienteOrigem: TtecDBText
                  Left = 162
                  Top = 150
                  Width = 231
                  Height = 24
                  TabStop = False
                  Color = clBtnFace
                  DataField = 'nomeclienteorigem'
                  DataSource = dtmFichaFinanceira.dsrContratos
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
                  Font.Height = -13
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 5
                  Alignment = taLeftJustify
                end
                object dtxRenegociado: TtecDBText
                  Left = 61
                  Top = 175
                  Width = 100
                  Height = 24
                  TabStop = False
                  Color = clBtnFace
                  DataField = 'renegociado'
                  DataSource = dtmFichaFinanceira.dsrContratos
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
                  Font.Height = -13
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 2
                  Alignment = taLeftJustify
                end
                object dtxNomeClienteRenegociado: TtecDBText
                  Left = 162
                  Top = 175
                  Width = 184
                  Height = 24
                  TabStop = False
                  Color = clBtnFace
                  DataField = 'nomeclienterenegociado'
                  DataSource = dtmFichaFinanceira.dsrContratos
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
                  Font.Height = -13
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 6
                  Alignment = taLeftJustify
                end
                object dtxPlano: TtecDBText
                  Left = 60
                  Top = 28
                  Width = 40
                  Height = 23
                  TabStop = False
                  Color = clBtnFace
                  DataField = 'plano'
                  DataSource = dtmFichaFinanceira.dsrContratos
                  ReadOnly = True
                  TabOrder = 17
                  Alignment = taLeftJustify
                end
              end
            end
            object tstParcelas: TTabSheet
              Caption = 'Parce&las'
              ImageIndex = 3
              object pgcParcelasRecebimentos: TtecPageControl
                Left = 0
                Top = 0
                Width = 575
                Height = 232
                ActivePage = tstParcelasRecebimentos
                Align = alClient
                TabOrder = 0
                OnChange = pgcParcelasRecebimentosChange
                object tstParcelasRecebimentos: TTabSheet
                  Caption = 'Parcelas'
                  object dbgParcelas: TtecDBGrid
                    Left = 0
                    Top = 0
                    Width = 567
                    Height = 202
                    Align = alClient
                    DataSource = dtmFichaFinanceira.dsrParcelas
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clBlack
                    TitleFont.Height = -13
                    TitleFont.Name = 'helvetica'
                    TitleFont.Pitch = fpVariable
                    TitleFont.Style = []
                    OnDrawColumnCell = dbgParcelasDrawColumnCell
                    RowWrap = 60
                    Large = False
                    DoubleRowColor = False
                    TitleMinHeight = 100
                    CellHeights = 100
                    StrippedColor = 16054260
                    CanDelete = False
                    CanNotInsertFromGrid = False
                    PostOnEnter = False
                    PostOnSetUpDown = False
                    DenySort = False
                    DefaultRowHeight = 19
                    ExibirNumerodaLinha = False
                    NaoAtribuirDadosaTabelaaoDigitar = False
                    ShowWhenFieldInvisible = False
                    CanClickWhenEditing = False
                    Columns = <
                      item
                        Alignment = taCenter
                        Expanded = False
                        FieldName = 'numero'
                        Title.Alignment = taCenter
                        Title.Caption = 'NP'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -9
                        Title.Font.Name = 'helvetica'
                        Title.Font.Pitch = fpVariable
                        Title.Font.Style = []
                        Width = 35
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'datavencto'
                        Title.Alignment = taCenter
                        Title.Caption = 'VENCTO'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -9
                        Title.Font.Name = 'helvetica'
                        Title.Font.Pitch = fpVariable
                        Title.Font.Style = []
                        Width = 67
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'valorvencto'
                        Title.Alignment = taCenter
                        Title.Caption = 'VALOR'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -9
                        Title.Font.Name = 'helvetica'
                        Title.Font.Pitch = fpVariable
                        Title.Font.Style = []
                        Width = 70
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'descontosugerido'
                        Title.Alignment = taCenter
                        Title.Caption = 'DESCTO'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -9
                        Title.Font.Name = 'helvetica'
                        Title.Font.Pitch = fpVariable
                        Title.Font.Style = []
                        Width = 60
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'liquido'
                        Title.Alignment = taCenter
                        Title.Caption = 'L'#205'QUIDO'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -9
                        Title.Font.Name = 'helvetica'
                        Title.Font.Pitch = fpVariable
                        Title.Font.Style = []
                        Width = 75
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'datapagto'
                        Title.Alignment = taCenter
                        Title.Caption = 'PAGAMENTO'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -9
                        Title.Font.Name = 'helvetica'
                        Title.Font.Pitch = fpVariable
                        Title.Font.Style = []
                        Width = 68
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'valorpagto'
                        Title.Alignment = taCenter
                        Title.Caption = 'VALOR'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -9
                        Title.Font.Name = 'helvetica'
                        Title.Font.Pitch = fpVariable
                        Title.Font.Style = []
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'diasatraso'
                        Title.Caption = 'DIAS ATRASO'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -9
                        Title.Font.Name = 'helvetica'
                        Title.Font.Pitch = fpVariable
                        Title.Font.Style = []
                        Width = 65
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'jurosdesctos'
                        Title.Alignment = taCenter
                        Title.Caption = '(+) / (-)'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -9
                        Title.Font.Name = 'helvetica'
                        Title.Font.Pitch = fpVariable
                        Title.Font.Style = []
                        Width = 60
                        Visible = True
                      end
                      item
                        Alignment = taCenter
                        Expanded = False
                        FieldName = 'filialpagto'
                        Title.Alignment = taCenter
                        Title.Caption = 'FILIAL'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -9
                        Title.Font.Name = 'helvetica'
                        Title.Font.Pitch = fpVariable
                        Title.Font.Style = []
                        Width = 30
                        Visible = True
                      end
                      item
                        Alignment = taCenter
                        Expanded = False
                        FieldName = 'tipopagto'
                        Title.Alignment = taCenter
                        Title.Caption = 'TIPO'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -9
                        Title.Font.Name = 'helvetica'
                        Title.Font.Pitch = fpVariable
                        Title.Font.Style = []
                        Width = 24
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'deventrada'
                        Title.Alignment = taCenter
                        Title.Caption = 'DEV. ENTRADA'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -9
                        Title.Font.Name = 'helvetica'
                        Title.Font.Pitch = fpVariable
                        Title.Font.Style = []
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'devcaixa'
                        Title.Alignment = taCenter
                        Title.Caption = 'DEV. CAIXA'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -9
                        Title.Font.Name = 'helvetica'
                        Title.Font.Pitch = fpVariable
                        Title.Font.Style = []
                        Width = 67
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'siglabanco'
                        Title.Alignment = taCenter
                        Title.Caption = 'BANCO'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -9
                        Title.Font.Name = 'helvetica'
                        Title.Font.Pitch = fpVariable
                        Title.Font.Style = []
                        Width = 100
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'nomeagencia'
                        Title.Alignment = taCenter
                        Title.Caption = 'AG'#202'NCIA'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -9
                        Title.Font.Name = 'helvetica'
                        Title.Font.Pitch = fpVariable
                        Title.Font.Style = []
                        Width = 200
                        Visible = True
                      end
                      item
                        Alignment = taCenter
                        Expanded = False
                        FieldName = 'ContaBoleto'
                        Title.Alignment = taCenter
                        Title.Caption = 'CONTA'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -9
                        Title.Font.Name = 'helvetica'
                        Title.Font.Pitch = fpVariable
                        Title.Font.Style = []
                        Visible = True
                      end
                      item
                        Alignment = taCenter
                        Expanded = False
                        FieldName = 'Digito'
                        Title.Alignment = taCenter
                        Title.Caption = 'D'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -9
                        Title.Font.Name = 'helvetica'
                        Title.Font.Pitch = fpVariable
                        Title.Font.Style = []
                        Width = 15
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'nossonumero'
                        Title.Caption = 'NOSSO N'#218'MERO'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -9
                        Title.Font.Name = 'helvetica'
                        Title.Font.Pitch = fpVariable
                        Title.Font.Style = []
                        Width = 81
                        Visible = True
                      end
                      item
                        Alignment = taCenter
                        Expanded = False
                        FieldName = 'digverificadornossonumero'
                        Title.Alignment = taCenter
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -9
                        Title.Font.Name = 'helvetica'
                        Title.Font.Pitch = fpVariable
                        Title.Font.Style = []
                        Width = 21
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'usuarioextracaixa'
                        Title.Alignment = taCenter
                        Title.Caption = 'AUTORIZA'#199#195'O EXTRA-CAIXA'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -9
                        Title.Font.Name = 'helvetica'
                        Title.Font.Pitch = fpVariable
                        Title.Font.Style = []
                        Width = 300
                        Visible = True
                      end>
                  end
                end
                object tstRecebimentosParcelas: TTabSheet
                  Caption = 'Recebimentos'
                  ImageIndex = 1
                  object gbxRecebimentos: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 567
                    Height = 89
                    Align = alTop
                    Caption = 'Recebimentos'
                    TabOrder = 0
                    object Bevel1: TBevel
                      Left = 2
                      Top = 17
                      Width = 563
                      Height = 2
                      Align = alTop
                      Shape = bsSpacer
                    end
                    object dbgRecebimento: TtecDBGrid
                      Left = 2
                      Top = 19
                      Width = 563
                      Height = 68
                      TabStop = False
                      Align = alClient
                      DataSource = dtmFichaFinanceira.dsrRecebimentos
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Height = -11
                      Font.Name = 'Arial'
                      Font.Pitch = fpVariable
                      Font.Style = []
                      Options = [dgTitles, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 0
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clBlack
                      TitleFont.Height = -13
                      TitleFont.Name = 'Arial'
                      TitleFont.Pitch = fpVariable
                      TitleFont.Style = []
                      RowWrap = 60
                      Large = False
                      DoubleRowColor = False
                      TitleMinHeight = 100
                      CellHeights = 90
                      StrippedColor = 16054260
                      CanDelete = False
                      CanNotInsertFromGrid = False
                      PostOnEnter = False
                      PostOnSetUpDown = False
                      DenySort = False
                      DefaultRowHeight = 16
                      ExibirNumerodaLinha = False
                      NaoAtribuirDadosaTabelaaoDigitar = False
                      ShowWhenFieldInvisible = False
                      CanClickWhenEditing = False
                      Columns = <
                        item
                          Expanded = False
                          FieldName = 'datalancto'
                          Title.Alignment = taCenter
                          Title.Caption = 'Lancto'
                          Width = 102
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'valorlancto'
                          Title.Alignment = taCenter
                          Title.Caption = 'Valor Lancto'
                          Width = 90
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'datavencto'
                          Title.Alignment = taCenter
                          Title.Caption = 'Vencto'
                          Width = 75
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'tiporecebimento'
                          Title.Alignment = taCenter
                          Title.Caption = 'Tipo Recebimento'
                          Width = 160
                          Visible = True
                        end>
                    end
                  end
                  object gbxParcelas: TGroupBox
                    Left = 0
                    Top = 89
                    Width = 567
                    Height = 113
                    Align = alClient
                    Caption = 'Parcelas'
                    TabOrder = 1
                    object Bevel2: TBevel
                      Left = 2
                      Top = 17
                      Width = 563
                      Height = 2
                      Align = alTop
                      Shape = bsSpacer
                    end
                    object dbgParcelasRecebimentos: TtecDBGrid
                      Left = 2
                      Top = 19
                      Width = 563
                      Height = 92
                      TabStop = False
                      Align = alClient
                      DataSource = dtmFichaFinanceira.dsrParcelasRecebimentos
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Height = -11
                      Font.Name = 'Arial'
                      Font.Pitch = fpVariable
                      Font.Style = []
                      Options = [dgTitles, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 0
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clBlack
                      TitleFont.Height = -13
                      TitleFont.Name = 'Arial'
                      TitleFont.Pitch = fpVariable
                      TitleFont.Style = []
                      RowWrap = 60
                      Large = False
                      DoubleRowColor = False
                      TitleMinHeight = 100
                      CellHeights = 90
                      StrippedColor = 16054260
                      CanDelete = False
                      CanNotInsertFromGrid = False
                      PostOnEnter = False
                      PostOnSetUpDown = False
                      DenySort = False
                      DefaultRowHeight = 16
                      ExibirNumerodaLinha = False
                      NaoAtribuirDadosaTabelaaoDigitar = False
                      ShowWhenFieldInvisible = False
                      CanClickWhenEditing = False
                      Columns = <
                        item
                          Expanded = False
                          FieldName = 'contrato'
                          Title.Alignment = taCenter
                          Title.Caption = 'Contrato'
                          Width = 75
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'numero'
                          Title.Alignment = taCenter
                          Title.Caption = 'NP'
                          Width = 35
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'datavencto'
                          Title.Alignment = taCenter
                          Title.Caption = 'Vencto'
                          Width = 75
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'datapagto'
                          Title.Alignment = taCenter
                          Title.Caption = 'Pagto'
                          Width = 75
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'valorpagto'
                          Title.Alignment = taCenter
                          Title.Caption = 'Valor Pagto'
                          Width = 90
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'tiporecebimento'
                          Title.Alignment = taCenter
                          Title.Caption = 'Tipo Recebimento'
                          Width = 160
                          Visible = True
                        end>
                    end
                  end
                end
              end
            end
            object tstProdutos: TTabSheet
              Caption = 'Prod&utos'
              ImageIndex = -1
              object dbgProdutos: TtecDBGrid
                Left = 0
                Top = 0
                Width = 575
                Height = 204
                Align = alClient
                DataSource = dtmFichaFinanceira.dsrProdutos
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clBlack
                TitleFont.Height = -13
                TitleFont.Name = 'helvetica'
                TitleFont.Pitch = fpVariable
                TitleFont.Style = []
                OnDrawColumnCell = dbgProdutosDrawColumnCell
                RowWrap = 60
                Large = False
                DoubleRowColor = False
                TitleMinHeight = 100
                CellHeights = 100
                StrippedColor = 16054260
                CanDelete = False
                CanNotInsertFromGrid = False
                PostOnEnter = False
                PostOnSetUpDown = False
                DenySort = False
                DefaultRowHeight = 19
                ExibirNumerodaLinha = False
                NaoAtribuirDadosaTabelaaoDigitar = False
                ShowWhenFieldInvisible = False
                CanClickWhenEditing = False
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'produto'
                    Title.Alignment = taCenter
                    Title.Caption = 'C'#211'DIGO'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -9
                    Title.Font.Name = 'helvetica'
                    Title.Font.Pitch = fpVariable
                    Title.Font.Style = []
                    Width = 135
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'descricao'
                    Title.Alignment = taCenter
                    Title.Caption = 'DESCRI'#199#195'O DO PRODUTO'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -9
                    Title.Font.Name = 'helvetica'
                    Title.Font.Pitch = fpVariable
                    Title.Font.Style = []
                    Width = 300
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'valorgrade1'
                    Title.Alignment = taCenter
                    Title.Caption = 'LINHA'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -9
                    Title.Font.Name = 'helvetica'
                    Title.Font.Pitch = fpVariable
                    Title.Font.Style = []
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'valorgrade2'
                    Title.Alignment = taCenter
                    Title.Caption = 'COLUNA'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -9
                    Title.Font.Name = 'helvetica'
                    Title.Font.Pitch = fpVariable
                    Title.Font.Style = []
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'filial'
                    Title.Alignment = taCenter
                    Title.Caption = 'FILIAL'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -9
                    Title.Font.Name = 'helvetica'
                    Title.Font.Pitch = fpVariable
                    Title.Font.Style = []
                    Width = 30
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'quantidade'
                    Title.Alignment = taCenter
                    Title.Caption = 'QTDE'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -9
                    Title.Font.Name = 'helvetica'
                    Title.Font.Pitch = fpVariable
                    Title.Font.Style = []
                    Width = 35
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'precovenda'
                    Title.Alignment = taCenter
                    Title.Caption = 'PRE'#199'O'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -9
                    Title.Font.Name = 'helvetica'
                    Title.Font.Pitch = fpVariable
                    Title.Font.Style = []
                    Width = 85
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'devolvidos'
                    Title.Alignment = taCenter
                    Title.Caption = 'DEVOLVIDO'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -9
                    Title.Font.Name = 'helvetica'
                    Title.Font.Pitch = fpVariable
                    Title.Font.Style = []
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'trocados'
                    Title.Alignment = taCenter
                    Title.Caption = 'TROCADOS'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -9
                    Title.Font.Name = 'helvetica'
                    Title.Font.Pitch = fpVariable
                    Title.Font.Style = []
                    Width = 61
                    Visible = True
                  end>
              end
              object gbxLegendaProdutos: TGroupBox
                Left = 0
                Top = 204
                Width = 575
                Height = 28
                Align = alBottom
                TabOrder = 1
                object pnlProdutos: TPanel
                  Left = 7
                  Top = 10
                  Width = 282
                  Height = 14
                  BevelOuter = bvNone
                  TabOrder = 0
                  Visible = False
                  object shpTotal: TShape
                    Left = 5
                    Top = 1
                    Width = 11
                    Height = 11
                    Brush.Color = clYellow
                    Pen.Width = 0
                  end
                  object shpParcial: TShape
                    Left = 104
                    Top = 1
                    Width = 11
                    Height = 11
                    Brush.Color = 10329599
                    Pen.Width = 0
                  end
                  object lblDevolvidos: TLabel
                    Left = 20
                    Top = -1
                    Width = 60
                    Height = 15
                    Caption = 'Devolvidos'
                  end
                  object lblTrocados: TLabel
                    Left = 119
                    Top = -1
                    Width = 52
                    Height = 15
                    Caption = 'Trocados'
                  end
                  object lblDevolvidoseTrocados: TLabel
                    Left = 209
                    Top = -1
                    Width = 39
                    Height = 15
                    Caption = 'Ambos'
                  end
                  object Shape2: TShape
                    Left = 192
                    Top = 1
                    Width = 11
                    Height = 11
                    Brush.Color = 11064319
                    Pen.Width = 0
                  end
                end
              end
            end
            object tstServicos: TTabSheet
              Caption = 'Servi'#231'os'
              ImageIndex = 6
              object lblEquipamento: TLabel
                Left = 3
                Top = 116
                Width = 74
                Height = 15
                Alignment = taRightJustify
                Caption = 'Equipamento'
              end
              object lblComplemento: TLabel
                Left = -1
                Top = 141
                Width = 79
                Height = 15
                Alignment = taRightJustify
                Caption = 'Complemento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object dbgServicos: TtecDBGrid
                Left = 0
                Top = 0
                Width = 551
                Height = 108
                DataSource = dtmFichaFinanceira.dsrServicos
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clBlack
                TitleFont.Height = -13
                TitleFont.Name = 'helvetica'
                TitleFont.Pitch = fpVariable
                TitleFont.Style = []
                RowWrap = 60
                Large = False
                DoubleRowColor = False
                MsgDelete = 'o SERVI'#199'O'
                TitleMinHeight = 100
                CellHeights = 100
                StrippedColor = 16054260
                CanDelete = False
                CanNotInsertFromGrid = False
                PostOnEnter = False
                PostOnSetUpDown = False
                DenySort = False
                DefaultRowHeight = 19
                ExibirNumerodaLinha = False
                NaoAtribuirDadosaTabelaaoDigitar = False
                ShowWhenFieldInvisible = False
                CanClickWhenEditing = False
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'servico'
                    Title.Alignment = taCenter
                    Title.Caption = 'C'#211'DIGO'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -9
                    Title.Font.Name = 'helvetica'
                    Title.Font.Pitch = fpVariable
                    Title.Font.Style = []
                    Width = 50
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'descricaoservico'
                    Title.Alignment = taCenter
                    Title.Caption = 'DESCRI'#199#195'O DO SERVI'#199'O'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -9
                    Title.Font.Name = 'helvetica'
                    Title.Font.Pitch = fpVariable
                    Title.Font.Style = []
                    Width = 310
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'quantidade'
                    Title.Alignment = taCenter
                    Title.Caption = 'QTDE'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -9
                    Title.Font.Name = 'helvetica'
                    Title.Font.Pitch = fpVariable
                    Title.Font.Style = []
                    Width = 35
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'aliquotaissqn'
                    Title.Alignment = taCenter
                    Title.Caption = 'ISS (%)'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -9
                    Title.Font.Name = 'helvetica'
                    Title.Font.Pitch = fpVariable
                    Title.Font.Style = []
                    Width = 45
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'valorservico'
                    Title.Alignment = taCenter
                    Title.Caption = 'VALOR'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -9
                    Title.Font.Name = 'helvetica'
                    Title.Font.Pitch = fpVariable
                    Title.Font.Style = []
                    Width = 65
                    Visible = True
                  end>
              end
              object dtxEquipamento: TtecDBText
                Left = 82
                Top = 112
                Width = 59
                Height = 23
                TabStop = False
                Color = clBtnFace
                DataField = 'equipamento'
                DataSource = dtmFichaFinanceira.dsrServicos
                ReadOnly = True
                TabOrder = 1
                Alignment = taLeftJustify
              end
              object dtxDescricaoEquipamento: TtecDBText
                Left = 141
                Top = 112
                Width = 273
                Height = 23
                TabStop = False
                Color = clBtnFace
                DataField = 'descricaoequipamento'
                DataSource = dtmFichaFinanceira.dsrServicos
                ReadOnly = True
                TabOrder = 2
                Alignment = taLeftJustify
              end
              object mmoComplementoEquipamento: TDBMemo
                Left = 82
                Top = 137
                Width = 468
                Height = 48
                TabStop = False
                Color = clBtnFace
                DataField = 'complementoservico'
                DataSource = dtmFichaFinanceira.dsrServicos
                ReadOnly = True
                TabOrder = 3
              end
              object dtxReferencia: TtecDBText
                Left = 415
                Top = 112
                Width = 135
                Height = 23
                TabStop = False
                Color = clBtnFace
                DataField = 'referencia'
                DataSource = dtmFichaFinanceira.dsrServicos
                ReadOnly = True
                TabOrder = 4
                Alignment = taLeftJustify
              end
            end
            object tstNotasCupons: TTabSheet
              Caption = ' Dados &Fiscais'
              ImageIndex = -1
              object gbxNotaseCuponsFiscais: TGroupBox
                Left = 0
                Top = 0
                Width = 575
                Height = 121
                Align = alClient
                Caption = 'NOTAS E CUPONS FISCAIS DE SA'#205'DA'
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                object dbgNotaseCuponsFiscais: TtecDBGrid
                  Left = 2
                  Top = 16
                  Width = 571
                  Height = 103
                  Align = alClient
                  DataSource = dtmFichaFinanceira.dsrNotaseCuponsdoContrato
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clBlack
                  TitleFont.Height = -13
                  TitleFont.Name = 'MS Shell Dlg'
                  TitleFont.Pitch = fpVariable
                  TitleFont.Style = []
                  RowWrap = 60
                  Large = False
                  DoubleRowColor = False
                  TitleMinHeight = 100
                  CellHeights = 100
                  StrippedColor = 16054260
                  CanDelete = False
                  CanNotInsertFromGrid = False
                  PostOnEnter = False
                  PostOnSetUpDown = False
                  DenySort = False
                  DefaultRowHeight = 19
                  ExibirNumerodaLinha = False
                  NaoAtribuirDadosaTabelaaoDigitar = False
                  ShowWhenFieldInvisible = False
                  CanClickWhenEditing = False
                  Columns = <
                    item
                      Alignment = taCenter
                      Expanded = False
                      FieldName = 'filial'
                      Title.Alignment = taCenter
                      Title.Caption = 'FILIAL'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Width = 35
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Expanded = False
                      FieldName = 'serie'
                      Title.Alignment = taCenter
                      Title.Caption = 'S'#201'RIE'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Width = 35
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'maquina'
                      Title.Caption = 'M'#193'Q.'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Width = 28
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'intervensao'
                      Title.Caption = 'INT.'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Width = 25
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Expanded = False
                      FieldName = 'numero'
                      Title.Alignment = taCenter
                      Title.Caption = 'N'#218'MERO'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Width = 60
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'datasaida'
                      Title.Alignment = taCenter
                      Title.Caption = 'DATA'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'Helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'situacao'
                      Title.Alignment = taCenter
                      Title.Caption = 'S'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Width = 20
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'descricaosituacao'
                      Title.Alignment = taCenter
                      Title.Caption = 'SITUA'#199#195'O'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'valortotal'
                      Title.Alignment = taCenter
                      Title.Caption = 'VALOR NOTA'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'Helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Width = 70
                      Visible = True
                    end>
                end
              end
              object gbxNotasdeDevolucao: TGroupBox
                Left = 0
                Top = 121
                Width = 575
                Height = 111
                Align = alBottom
                Caption = 'NOTAS DE DEVOLU'#199#195'O'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                object GroupBox7: TGroupBox
                  Left = 2
                  Top = 16
                  Width = 571
                  Height = 17
                  Align = alTop
                  Caption = 'NOTAS DE ENTRADA'
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  object StaticText1: TStaticText
                    Left = 620
                    Top = 0
                    Width = 91
                    Height = 18
                    Caption = 'NOTAS DE SA'#205'DA'
                    Enabled = False
                    TabOrder = 0
                  end
                end
                object dbgNotasdeDevolucao: TtecDBGrid
                  Left = 2
                  Top = 29
                  Width = 571
                  Height = 80
                  Align = alBottom
                  DataSource = dtmFichaFinanceira.dsrNotasDevolucoesContrato
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clBlack
                  TitleFont.Height = -13
                  TitleFont.Name = 'MS Shell Dlg'
                  TitleFont.Pitch = fpVariable
                  TitleFont.Style = []
                  RowWrap = 60
                  Large = False
                  DoubleRowColor = False
                  TitleMinHeight = 100
                  CellHeights = 100
                  StrippedColor = 16054260
                  CanDelete = False
                  CanNotInsertFromGrid = False
                  PostOnEnter = False
                  PostOnSetUpDown = False
                  DenySort = False
                  DefaultRowHeight = 19
                  ExibirNumerodaLinha = False
                  NaoAtribuirDadosaTabelaaoDigitar = False
                  ShowWhenFieldInvisible = False
                  CanClickWhenEditing = False
                  Columns = <
                    item
                      Alignment = taCenter
                      Expanded = False
                      FieldName = 'fornecedor'
                      Title.Alignment = taCenter
                      Title.Caption = 'CLIENTE'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Width = 45
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Expanded = False
                      FieldName = 'tipofornecedor'
                      Title.Alignment = taCenter
                      Title.Caption = 'T'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Width = 12
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'nomefornecedor'
                      Title.Alignment = taCenter
                      Title.Caption = 'NOME'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Width = 156
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Expanded = False
                      FieldName = 'serie'
                      Title.Alignment = taCenter
                      Title.Caption = 'SERIE'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Width = 31
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'numero'
                      Title.Alignment = taCenter
                      Title.Caption = 'N'#218'MERO'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Width = 45
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Expanded = False
                      FieldName = 'data'
                      Title.Alignment = taCenter
                      Title.Caption = 'DATA'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Width = 69
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Expanded = False
                      FieldName = 'situacao'
                      Title.Alignment = taCenter
                      Title.Caption = 'S'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Width = 13
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'descricaosituacao'
                      Title.Alignment = taCenter
                      Title.Caption = 'SITUA'#199#195'O'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'valornota'
                      Title.Alignment = taCenter
                      Title.Caption = 'VALOR NOTA'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'HELVETICA'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Width = 63
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Expanded = False
                      FieldName = 'filialsaida'
                      Title.Alignment = taCenter
                      Title.Caption = 'FILIAL'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'Helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Width = 26
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Expanded = False
                      FieldName = 'seriesaida'
                      Title.Alignment = taCenter
                      Title.Caption = 'S'#201'RIE'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'Helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Width = 30
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Expanded = False
                      FieldName = 'maquina'
                      Title.Alignment = taCenter
                      Title.Caption = 'MAQ.'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'Helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Width = 28
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Expanded = False
                      FieldName = 'intervensao'
                      Title.Alignment = taCenter
                      Title.Caption = 'INT.'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'Helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Width = 25
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Expanded = False
                      FieldName = 'numerosaida'
                      Title.Alignment = taCenter
                      Title.Caption = 'N'#218'MERO'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'Helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Width = 45
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Expanded = False
                      FieldName = 'datasaida'
                      Title.Alignment = taCenter
                      Title.Caption = 'DATA'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'Helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Width = 67
                      Visible = True
                    end>
                end
              end
            end
            object tstEntrega: TTabSheet
              Caption = '&Entrega'
              ImageIndex = 5
              object pgcEntrega: TtecPageControl
                Left = 0
                Top = 0
                Width = 575
                Height = 232
                ActivePage = tstNotaEntrega
                Align = alClient
                TabOrder = 0
                TabWidth = 100
                object tstNotaEntrega: TTabSheet
                  Caption = '  &1 - Romaneios'
                  object dbgNotaEntrega: TtecDBGrid
                    Left = 0
                    Top = 0
                    Width = 567
                    Height = 202
                    Align = alClient
                    DataSource = dtmFichaFinanceira.dsrRomaneios
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                    ParentFont = False
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clBlack
                    TitleFont.Height = -13
                    TitleFont.Name = 'helvetica'
                    TitleFont.Pitch = fpVariable
                    TitleFont.Style = []
                    OnTitleClick = dbgNotaEntregaTitleClick
                    RowWrap = 60
                    Large = False
                    DoubleRowColor = False
                    TitleMinHeight = 100
                    CellHeights = 100
                    StrippedColor = 16054260
                    CanDelete = False
                    CanNotInsertFromGrid = False
                    PostOnEnter = False
                    PostOnSetUpDown = False
                    DenySort = False
                    DefaultRowHeight = 19
                    ExibirNumerodaLinha = False
                    NaoAtribuirDadosaTabelaaoDigitar = False
                    ShowWhenFieldInvisible = False
                    CanClickWhenEditing = False
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'numero'
                        Title.Alignment = taCenter
                        Title.Caption = 'N'#218'MERO'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -9
                        Title.Font.Name = 'helvetica'
                        Title.Font.Pitch = fpVariable
                        Title.Font.Style = []
                        Width = 50
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'emissao'
                        Title.Alignment = taCenter
                        Title.Caption = 'EMISS'#195'O'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -9
                        Title.Font.Name = 'helvetica'
                        Title.Font.Pitch = fpVariable
                        Title.Font.Style = []
                        Width = 70
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'cupom'
                        Title.Alignment = taCenter
                        Title.Caption = 'FILIAL/ECF/CRO/N'#218'MERO'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -9
                        Title.Font.Name = 'helvetica'
                        Title.Font.Pitch = fpVariable
                        Title.Font.Style = []
                        Width = 160
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'transportador'
                        Title.Alignment = taCenter
                        Title.Caption = 'C'#211'DIGO'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -9
                        Title.Font.Name = 'helvetica'
                        Title.Font.Pitch = fpVariable
                        Title.Font.Style = []
                        Width = 45
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'razao'
                        Title.Alignment = taCenter
                        Title.Caption = 'RAZ'#195'O SOCIAL TRANSPORTADOR'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -9
                        Title.Font.Name = 'helvetica'
                        Title.Font.Pitch = fpVariable
                        Title.Font.Style = []
                        Width = 168
                        Visible = True
                      end>
                  end
                end
                object tstProdutoEntrega: TTabSheet
                  Caption = '  &2 - Produtos'
                  ImageIndex = 1
                  object dbgProdutoEntrega: TtecDBGrid
                    Left = 0
                    Top = 0
                    Width = 567
                    Height = 202
                    Align = alClient
                    DataSource = dtmFichaFinanceira.dsrProdutosRomaneios
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                    ParentFont = False
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clBlack
                    TitleFont.Height = -13
                    TitleFont.Name = 'helvetica'
                    TitleFont.Pitch = fpVariable
                    TitleFont.Style = []
                    RowWrap = 60
                    Large = False
                    DoubleRowColor = False
                    TitleMinHeight = 100
                    CellHeights = 100
                    StrippedColor = 16054260
                    CanDelete = False
                    CanNotInsertFromGrid = False
                    PostOnEnter = False
                    PostOnSetUpDown = False
                    DenySort = False
                    DefaultRowHeight = 19
                    ExibirNumerodaLinha = False
                    NaoAtribuirDadosaTabelaaoDigitar = False
                    ShowWhenFieldInvisible = False
                    CanClickWhenEditing = False
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'produto'
                        Title.Alignment = taCenter
                        Title.Caption = 'C'#211'DIGO'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -9
                        Title.Font.Name = 'helvetica'
                        Title.Font.Pitch = fpVariable
                        Title.Font.Style = []
                        Width = 50
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'descricao'
                        Title.Alignment = taCenter
                        Title.Caption = 'DESCRI'#199#195'O DO PRODUTO'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -9
                        Title.Font.Name = 'helvetica'
                        Title.Font.Pitch = fpVariable
                        Title.Font.Style = []
                        Width = 250
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'filial'
                        Title.Alignment = taCenter
                        Title.Caption = 'FILIAL'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -9
                        Title.Font.Name = 'helvetica'
                        Title.Font.Pitch = fpVariable
                        Title.Font.Style = []
                        Width = 30
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'quantidade'
                        Title.Alignment = taCenter
                        Title.Caption = 'QTDE'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -9
                        Title.Font.Name = 'helvetica'
                        Title.Font.Pitch = fpVariable
                        Title.Font.Style = []
                        Width = 40
                        Visible = True
                      end>
                  end
                end
              end
            end
            object tstMontagem: TTabSheet
              Caption = 'Montagem'
              ImageIndex = 6
              object dbgMontagem: TtecDBGrid
                Left = 0
                Top = 0
                Width = 575
                Height = 232
                Align = alClient
                DataSource = dtmFichaFinanceira.dsrMontagens
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                ParentFont = False
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clBlack
                TitleFont.Height = -13
                TitleFont.Name = 'helvetica'
                TitleFont.Pitch = fpVariable
                TitleFont.Style = []
                RowWrap = 60
                Large = False
                DoubleRowColor = False
                TitleMinHeight = 100
                CellHeights = 100
                StrippedColor = 16054260
                CanDelete = False
                CanNotInsertFromGrid = False
                PostOnEnter = False
                PostOnSetUpDown = False
                DenySort = False
                DefaultRowHeight = 19
                ExibirNumerodaLinha = False
                NaoAtribuirDadosaTabelaaoDigitar = False
                ShowWhenFieldInvisible = False
                CanClickWhenEditing = False
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'produto'
                    Title.Alignment = taCenter
                    Title.Caption = 'PRODUTO'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -9
                    Title.Font.Name = 'helvetica'
                    Title.Font.Pitch = fpVariable
                    Title.Font.Style = []
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'descricaoproduto'
                    Title.Alignment = taCenter
                    Title.Caption = 'DESCRI'#199#195'O DO PRODUTO'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -9
                    Title.Font.Name = 'helvetica'
                    Title.Font.Pitch = fpVariable
                    Title.Font.Style = []
                    Width = 250
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'valorgrade1'
                    Title.Alignment = taCenter
                    Title.Caption = 'LINHA'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -9
                    Title.Font.Name = 'helvetica'
                    Title.Font.Pitch = fpVariable
                    Title.Font.Style = []
                    Width = 55
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'valorgrade2'
                    Title.Alignment = taCenter
                    Title.Caption = 'COLUNA'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -9
                    Title.Font.Name = 'helvetica'
                    Title.Font.Pitch = fpVariable
                    Title.Font.Style = []
                    Width = 55
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'numero'
                    Title.Alignment = taCenter
                    Title.Caption = 'NOTA'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -9
                    Title.Font.Name = 'helvetica'
                    Title.Font.Pitch = fpVariable
                    Title.Font.Style = []
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'serie'
                    Title.Caption = 'S'#201'RIE'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -9
                    Title.Font.Name = 'helvetica'
                    Title.Font.Pitch = fpVariable
                    Title.Font.Style = []
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'situacao'
                    Title.Alignment = taCenter
                    Title.Caption = 'SITUA'#199#195'O'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -9
                    Title.Font.Name = 'helvetica'
                    Title.Font.Pitch = fpVariable
                    Title.Font.Style = []
                    Width = 60
                    Visible = True
                  end>
              end
            end
          end
          object gxgDadosCliente: TGroupBox
            Left = 0
            Top = 0
            Width = 805
            Height = 278
            Align = alTop
            TabOrder = 2
            inline fraConsultaDadosClienteFicha: TfraConsultaDadosCliente
              Left = 2
              Top = 17
              Width = 801
              Height = 259
              HorzScrollBar.Range = 734
              VertScrollBar.Range = 238
              Align = alClient
              AutoScroll = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              inherited lblCPFCNPJ: TLabel [6]
              end
              inherited lblResumoCobranca: TLabel [7]
                Left = 0
                Top = 229
                Width = 801
                Height = 30
                Align = alBottom
              end
              inherited pgcDetalhesCliente: TtecPageControl
                Top = 44
                Width = 801
                Height = 185
                ActivePage = fraConsultaDadosClienteFicha.tstEndereco
                Align = alBottom
                inherited tstEndereco: TTabSheet
                  inherited fraEnderecoCliente: TfraEndereco
                    Height = 113
                    inherited gbxEndereco: TGroupBox
                      Height = 113
                      inherited pnllblNumero: TPanel
                        Height = 0
                        inherited lblenderecocliente_numero: TLabel
                          Left = 40
                          Width = 3
                          Caption = ''
                        end
                        inherited lblenderecocliente_complemento: TLabel
                          Left = 153
                          Width = 3
                          Caption = ''
                        end
                      end
                      inherited pnlRua: TPanel
                        inherited mmoRua: TtecDBMemo
                          Width = 423
                          DataSource = fraConsultaDadosClienteFicha.dsrCliente
                        end
                      end
                      inherited pnlNumero: TPanel
                        Top = 44
                        Height = 21
                        inherited edtNumeroEndereco: TDBEditTexto
                          Top = 0
                          DataField = 'numero'
                          DataSource = fraConsultaDadosClienteFicha.dsrCliente
                        end
                        inherited edtComplemento: TDBEditTexto
                          Left = 80
                          Top = 0
                          Width = 343
                          DataField = 'complemento'
                          DataSource = fraConsultaDadosClienteFicha.dsrCliente
                        end
                      end
                      inherited pnllblBairro: TPanel
                        Top = 108
                        Height = 0
                        inherited lblBairro_: TLabel
                          Left = 39
                          Width = 3
                          Caption = ''
                        end
                      end
                      inherited pnlBairro: TPanel
                        Top = 65
                        Height = 22
                        inherited edtBairro: TtecDoubleDBEdit
                          Width = 423
                          LookupSource = fraConsultaDadosClienteFicha.dsrCliente
                          DataSource = fraConsultaDadosClienteFicha.dsrCliente
                        end
                      end
                      inherited pnllblCidade: TPanel
                        Top = 108
                        Height = 0
                        inherited lblCEP_: TLabel
                          Left = 21
                          Width = 3
                          Caption = ''
                        end
                        inherited lblCidade_: TLabel
                          Left = 119
                          Width = 3
                          Caption = ''
                        end
                        inherited lblUF_: TLabel
                          Left = 403
                          Width = 3
                          Caption = ''
                        end
                      end
                      inherited pnlCidade: TPanel
                        Top = 87
                        Height = 21
                        inherited edtCEP: TDBEditCep
                          DataSource = fraConsultaDadosClienteFicha.dsrCliente
                        end
                        inherited edtCidade: TtecDoubleDBEdit
                          Left = 80
                          Width = 312
                          LookupSource = fraConsultaDadosClienteFicha.dsrCliente
                          DataSource = fraConsultaDadosClienteFicha.dsrCliente
                        end
                        inherited edtEstado: TDBEditTexto
                          DataSource = fraConsultaDadosClienteFicha.dsrCliente
                        end
                      end
                    end
                  end
                  inherited pnlCarta: TPanel
                    inherited Label1: TLabel
                      Width = 234
                    end
                    inherited lblAviso2: TLabel
                      Width = 234
                    end
                  end
                  inherited GroupBox1: TGroupBox
                    Top = 112
                    Height = 35
                    Font.Height = -12
                    ParentFont = False
                    inherited lblFoneRamal: TLabel
                      Top = 13
                      Height = 15
                    end
                    inherited lblFoneNumero: TLabel
                      Top = 13
                      Width = 28
                      Height = 15
                    end
                    inherited lblDDD: TLabel
                      Top = 13
                      Height = 15
                    end
                    inherited edtFoneRamal: TDBEditTexto
                      Top = 10
                      Width = 79
                    end
                    inherited edtFoneNumero: TDBEditFone
                      Top = 9
                    end
                    inherited edtFoneDDD: TDBEditNumero
                      Left = 51
                      Top = 10
                    end
                  end
                end
                inherited tstCartas: TTabSheet
                  inherited dbgParcelasCartas: TtecDBGrid
                    Font.Height = -12
                    DefaultRowHeight = 19
                  end
                  inherited dbgCartas: TtecDBGrid [1]
                    Font.Height = -12
                    DefaultRowHeight = 19
                  end
                  inherited dtxSituacaoCarta: TtecDBText [2]
                    Top = 130
                    Width = 521
                  end
                end
                inherited tstSPC: TTabSheet
                  inherited dtxSituacaoSPC: TtecDBText
                    Top = 130
                    Width = 497
                  end
                end
                inherited tstCobranca: TTabSheet
                  inherited mmoCobrancaInformes: TtecDBMemo
                    MaxLength = 760
                    ScrollBars = ssVertical
                  end
                end
                inherited tstCheques: TTabSheet
                  inherited pgcCheques: TtecPageControl
                    inherited tstCheques1: TTabSheet
                      inherited dbgCheques: TtecDBGrid
                        OnDrawColumnCell = fraConsultaDadosClienteFichadbgChequesDrawColumnCell
                        Columns = <
                          item
                            Expanded = False
                            FieldName = 'data'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlack
                            Font.Height = -12
                            Font.Name = 'helvetica'
                            Font.Pitch = fpVariable
                            Font.Style = []
                            Title.Alignment = taCenter
                            Title.Caption = 'EMISS'#195'O'
                            Title.Font.Charset = DEFAULT_CHARSET
                            Title.Font.Color = clBlack
                            Title.Font.Height = -9
                            Title.Font.Name = 'helvetica'
                            Title.Font.Pitch = fpVariable
                            Title.Font.Style = []
                            Width = 70
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'vencto'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlack
                            Font.Height = -12
                            Font.Name = 'helvetica'
                            Font.Pitch = fpVariable
                            Font.Style = []
                            Title.Alignment = taCenter
                            Title.Caption = 'VENCTO'
                            Title.Font.Charset = DEFAULT_CHARSET
                            Title.Font.Color = clBlack
                            Title.Font.Height = -9
                            Title.Font.Name = 'helvetica'
                            Title.Font.Pitch = fpVariable
                            Title.Font.Style = []
                            Width = 70
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'valor'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlack
                            Font.Height = -12
                            Font.Name = 'helvetica'
                            Font.Pitch = fpVariable
                            Font.Style = []
                            Title.Alignment = taCenter
                            Title.Caption = 'VALOR'
                            Title.Font.Charset = DEFAULT_CHARSET
                            Title.Font.Color = clBlack
                            Title.Font.Height = -9
                            Title.Font.Name = 'helvetica'
                            Title.Font.Pitch = fpVariable
                            Title.Font.Style = []
                            Width = 100
                            Visible = True
                          end
                          item
                            Alignment = taCenter
                            Expanded = False
                            FieldName = 'filial'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlack
                            Font.Height = -12
                            Font.Name = 'helvetica'
                            Font.Pitch = fpVariable
                            Font.Style = []
                            Title.Alignment = taCenter
                            Title.Caption = 'FILIAL'
                            Title.Font.Charset = DEFAULT_CHARSET
                            Title.Font.Color = clBlack
                            Title.Font.Height = -9
                            Title.Font.Name = 'helvetica'
                            Title.Font.Pitch = fpVariable
                            Title.Font.Style = []
                            Width = 35
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'titular'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlack
                            Font.Height = -12
                            Font.Name = 'helvetica'
                            Font.Pitch = fpVariable
                            Font.Style = []
                            Title.Alignment = taCenter
                            Title.Caption = 'TITULAR'
                            Title.Font.Charset = DEFAULT_CHARSET
                            Title.Font.Color = clBlack
                            Title.Font.Height = -9
                            Title.Font.Name = 'helvetica'
                            Title.Font.Pitch = fpVariable
                            Title.Font.Style = []
                            Width = 315
                            Visible = True
                          end
                          item
                            Alignment = taCenter
                            Expanded = False
                            FieldName = 'nome_situacao'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlack
                            Font.Height = -12
                            Font.Name = 'helvetica'
                            Font.Pitch = fpVariable
                            Font.Style = []
                            Title.Alignment = taCenter
                            Title.Caption = 'SITUA'#199#195'O'
                            Title.Font.Charset = DEFAULT_CHARSET
                            Title.Font.Color = clBlack
                            Title.Font.Height = -9
                            Title.Font.Name = 'helvetica'
                            Title.Font.Pitch = fpVariable
                            Title.Font.Style = []
                            Width = 135
                            Visible = True
                          end>
                      end
                    end
                    inherited tstResgate: TTabSheet
                      inherited dbgResgates: TtecDBGrid
                        OnDrawColumnCell = fraConsultaDadosClienteFichadbgResgatesDrawColumnCell
                      end
                    end
                  end
                end
                inherited tstSaldoCredito: TTabSheet
                  inherited sbnIncluirSaldo: TSpeedButton
                    Top = 125
                    OnClick = fraConsultaDadosClienteFichasbnIncluirSaldoClick
                  end
                  inherited dbgSaldoTroca: TtecDBGrid
                    Height = 120
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                    DenySort = True
                    Columns = <
                      item
                        Alignment = taCenter
                        Expanded = False
                        FieldName = 'tipo'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Height = -12
                        Font.Name = 'helvetica'
                        Font.Pitch = fpVariable
                        Font.Style = []
                        Title.Alignment = taCenter
                        Title.Caption = 'TIPO'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -9
                        Title.Font.Name = 'helvetica'
                        Title.Font.Pitch = fpVariable
                        Title.Font.Style = []
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'data'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Height = -12
                        Font.Name = 'helvetica'
                        Font.Pitch = fpVariable
                        Font.Style = []
                        Title.Alignment = taCenter
                        Title.Caption = 'DATA'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -9
                        Title.Font.Name = 'helvetica'
                        Title.Font.Pitch = fpVariable
                        Title.Font.Style = []
                        Width = 100
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'Descricao'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Height = -12
                        Font.Name = 'helvetica'
                        Font.Pitch = fpVariable
                        Font.Style = []
                        Title.Alignment = taCenter
                        Title.Caption = 'REFER'#202'NCIA'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -9
                        Title.Font.Name = 'helvetica'
                        Title.Font.Pitch = fpVariable
                        Title.Font.Style = []
                        Width = 448
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'valor'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Height = -12
                        Font.Name = 'helvetica'
                        Font.Pitch = fpVariable
                        Font.Style = []
                        Title.Alignment = taCenter
                        Title.Caption = 'VALOR'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -9
                        Title.Font.Name = 'helvetica'
                        Title.Font.Pitch = fpVariable
                        Title.Font.Style = []
                        Width = 80
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'saldo'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Height = -12
                        Font.Name = 'helvetica'
                        Font.Pitch = fpVariable
                        Font.Style = []
                        Title.Alignment = taCenter
                        Title.Caption = 'SALDO'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -9
                        Title.Font.Name = 'helvetica'
                        Title.Font.Pitch = fpVariable
                        Title.Font.Style = []
                        Width = 80
                        Visible = True
                      end>
                  end
                  inherited gbxSaldoAtual: TGroupBox
                    Top = 119
                  end
                end
                inherited tstCashBack: TTabSheet
                  inherited DBAdvGridcashback_saldos: TDBAdvGrid
                    Width = 793
                    Height = 120
                    WordWrap = False
                  end
                  inherited pnlBottomCashBack: TPanel
                    Top = 120
                    Width = 793
                  end
                end
                inherited tstLimitesCredito: TTabSheet
                  inherited GroupBox7: TGroupBox
                    Top = 11
                  end
                  inherited gbxRendas: TGroupBox
                    Height = 130
                  end
                  inherited GroupBox6: TGroupBox
                    Height = 130
                  end
                end
              end
            end
          end
          object gbxLegendaContratos: TGroupBox
            Left = 0
            Top = 540
            Width = 805
            Height = 33
            Align = alBottom
            TabOrder = 3
            object Label3: TLabel
              Left = 81
              Top = 12
              Width = 56
              Height = 15
              Caption = 'Em Atraso'
            end
            object shpAberto: TShape
              Left = 10
              Top = 14
              Width = 11
              Height = 11
              Pen.Width = 0
            end
            object lblAberto: TLabel
              Left = 24
              Top = 12
              Width = 35
              Height = 15
              Caption = 'Aberto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
            end
            object shpAtraso: TShape
              Left = 66
              Top = 14
              Width = 11
              Height = 11
              Brush.Color = 5592575
              Pen.Width = 0
            end
            object Shape1: TShape
              Left = 146
              Top = 14
              Width = 11
              Height = 11
              Brush.Color = 8366677
              Pen.Width = 0
            end
            object lblQuitado: TLabel
              Left = 160
              Top = 12
              Width = 43
              Height = 15
              Caption = 'Quitado'
            end
            object shpReservado: TShape
              Left = 209
              Top = 14
              Width = 11
              Height = 11
              Brush.Color = 16767396
              Pen.Width = 0
            end
            object lblReservado: TLabel
              Left = 223
              Top = 12
              Width = 60
              Height = 15
              Caption = 'Reservado'
            end
            object shpRenegociado: TShape
              Left = 287
              Top = 14
              Width = 11
              Height = 11
              Brush.Color = 8240895
              Pen.Width = 0
            end
            object lblRenegociado: TLabel
              Left = 301
              Top = 12
              Width = 74
              Height = 15
              Caption = 'Renegociado'
            end
            object shpCancelado: TShape
              Left = 382
              Top = 14
              Width = 11
              Height = 11
              Brush.Color = clYellow
              Pen.Width = 0
            end
            object lblCancelado: TLabel
              Left = 396
              Top = 12
              Width = 60
              Height = 15
              Caption = 'Cancelado'
            end
            object sbnLogParcelas: TSpeedButton
              Left = 680
              Top = 9
              Width = 121
              Height = 21
              Caption = 'Log das Parcelas'
              OnClick = sbnLogParcelasClick
            end
            object ckbSomenteEmAberto: TCheckBox
              Left = 481
              Top = 10
              Width = 122
              Height = 15
              Caption = 'Mostrar em Aberto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnClick = ckbSomenteEmAbertoClick
            end
          end
        end
        object tstDebitos: TTabSheet
          Caption = 'tstDebitos'
          ImageIndex = 1
          object gbxCalculoDebito: TGroupBox
            Left = 0
            Top = 0
            Width = 805
            Height = 573
            Align = alClient
            TabOrder = 0
            object pnltopCalculoDebito: TPanel
              Left = 2
              Top = 18
              Width = 801
              Height = 136
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 7
              object gbxChequesSituacao: TGroupBox
                Left = 112
                Top = 101
                Width = 663
                Height = 32
                Caption = 'Cheques'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                object edtTotaldeChequesDevolvidos: TDBText
                  Left = 311
                  Top = 9
                  Width = 106
                  Height = 19
                  Alignment = taRightJustify
                  BiDiMode = bdLeftToRight
                  Color = clBtnFace
                  DataField = 'TotalDevolvido'
                  DataSource = fraConsultaDadosClienteFicha.dsrChequesDevolvidos_aVencer
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = [fsBold]
                  ParentBiDiMode = False
                  ParentColor = False
                  ParentFont = False
                end
                object edtTotalChequesaVencer: TDBText
                  Left = 536
                  Top = 9
                  Width = 105
                  Height = 19
                  Alignment = taRightJustify
                  BiDiMode = bdLeftToRight
                  Color = clBtnFace
                  DataField = 'TotalaVencer'
                  DataSource = fraConsultaDadosClienteFicha.dsrChequesDevolvidos_aVencer
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = [fsBold]
                  ParentBiDiMode = False
                  ParentColor = False
                  ParentFont = False
                end
                object lblTotaldeChequesDevolvidos: TStaticText
                  Left = 206
                  Top = 10
                  Width = 96
                  Height = 20
                  Caption = 'Total Devolvidos'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
                object lblTotaldeChequesaVencer: TStaticText
                  Left = 441
                  Top = 10
                  Width = 88
                  Height = 20
                  Caption = 'Total a Vencer'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                end
              end
            end
            object GroupBox4: TGroupBox
              Left = 114
              Top = 89
              Width = 439
              Height = 32
              TabOrder = 4
              object lblTotalGeral: TLabel
                Left = 202
                Top = 10
                Width = 95
                Height = 16
                Caption = 'Total do d'#233'bito'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblTotalAtrasos: TLabel
                Left = 310
                Top = 9
                Width = 108
                Height = 20
                Alignment = taRightJustify
                AutoSize = False
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
              end
            end
            object gbxDataBase: TGroupBox
              Left = 6
              Top = 9
              Width = 104
              Height = 57
              TabOrder = 0
              object lblDataPagto: TLabel
                Left = 11
                Top = 6
                Width = 59
                Height = 16
                Caption = 'Data base'
              end
              object edtDataPagto: TEditData
                Left = 8
                Top = 24
                Width = 83
                Height = 24
                TabOrder = 0
                OnEnter = edtDataPagtoEnter
                OnKeyDown = edtDataPagtoKeyDown
                Minimo = 0
                Maximo = 37353
              end
            end
            object gbxValoresEmAtrasos: TGroupBox
              Left = 114
              Top = 8
              Width = 216
              Height = 89
              Caption = 'Parcelas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              object lblAtrasoParcelas: TLabel
                Left = 17
                Top = 24
                Width = 60
                Height = 16
                Alignment = taRightJustify
                Caption = 'Em atraso'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object lblAtrasoJuros: TLabel
                Left = 47
                Top = 45
                Width = 31
                Height = 16
                Alignment = taRightJustify
                Caption = 'Juros'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object lblAtrasoTotal: TLabel
                Left = 51
                Top = 66
                Width = 27
                Height = 16
                Alignment = taRightJustify
                Caption = 'Total'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object lblAtrasoParcelasValor: TLabel
                Left = 91
                Top = 21
                Width = 106
                Height = 20
                Alignment = taRightJustify
                AutoSize = False
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object lblAtrasoJurosValor: TLabel
                Left = 91
                Top = 43
                Width = 106
                Height = 20
                Alignment = taRightJustify
                AutoSize = False
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object lblAtrasoTotalValor: TLabel
                Left = 91
                Top = 65
                Width = 106
                Height = 20
                Alignment = taRightJustify
                AutoSize = False
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object Panel1: TPanel
                Left = -27
                Top = 54
                Width = 230
                Height = 1
                TabOrder = 0
              end
            end
            object gbxEmAberto: TGroupBox
              Left = 328
              Top = 8
              Width = 225
              Height = 89
              TabOrder = 2
              object lblEmAbertoParcelas: TLabel
                Left = 33
                Top = 24
                Width = 49
                Height = 16
                Alignment = taRightJustify
                Caption = 'A vencer'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object lblEmAbertoDescontos: TLabel
                Left = 18
                Top = 47
                Width = 62
                Height = 16
                Alignment = taRightJustify
                Caption = 'Descontos'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object lblEmAbertoTotal: TLabel
                Left = 54
                Top = 68
                Width = 27
                Height = 16
                Alignment = taRightJustify
                Caption = 'Total'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object lblEmAbertoParcelasValor: TLabel
                Left = 96
                Top = 21
                Width = 108
                Height = 20
                Alignment = taRightJustify
                AutoSize = False
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object lblEmAbertoDescontosValor: TLabel
                Left = 96
                Top = 43
                Width = 108
                Height = 20
                Alignment = taRightJustify
                AutoSize = False
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object lblEmAbertoTotalValor: TLabel
                Left = 96
                Top = 65
                Width = 108
                Height = 20
                Alignment = taRightJustify
                AutoSize = False
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
            end
            object GroupBox3: TGroupBox
              Left = 551
              Top = 8
              Width = 226
              Height = 113
              TabOrder = 3
              object lblParcela: TLabel
                Left = 24
                Top = 26
                Width = 51
                Height = 16
                Alignment = taRightJustify
                Caption = 'Parcelas'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object lblJuros: TLabel
                Left = 45
                Top = 47
                Width = 31
                Height = 16
                Alignment = taRightJustify
                Caption = 'Juros'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object lblDescontos: TLabel
                Left = 20
                Top = 68
                Width = 55
                Height = 16
                Alignment = taRightJustify
                Caption = 'Desconto'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object lblCarnes: TLabel
                Left = 5
                Top = 92
                Width = 84
                Height = 16
                Alignment = taRightJustify
                Caption = 'Total a pagar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblValorParcelas: TLabel
                Left = 99
                Top = 22
                Width = 106
                Height = 20
                Alignment = taRightJustify
                AutoSize = False
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object lblValorJuros: TLabel
                Left = 99
                Top = 44
                Width = 106
                Height = 20
                Alignment = taRightJustify
                AutoSize = False
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object lblValorDescontos: TLabel
                Left = 99
                Top = 66
                Width = 106
                Height = 20
                Alignment = taRightJustify
                AutoSize = False
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object lblValorCarnes: TLabel
                Left = 99
                Top = 89
                Width = 106
                Height = 20
                Alignment = taRightJustify
                AutoSize = False
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
              end
              object pnlDivisor: TPanel
                Left = 3
                Top = 86
                Width = 222
                Height = 2
                TabOrder = 0
              end
            end
            object dbgParcelasCalcularDebito: TtecDBGrid
              Left = 2
              Top = 154
              Width = 801
              Height = 326
              Align = alClient
              DataSource = dtmFichaFinanceira.dsrParcelasCalcularDebito
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clBlack
              TitleFont.Height = -13
              TitleFont.Name = 'helvetica'
              TitleFont.Pitch = fpVariable
              TitleFont.Style = []
              OnDrawColumnCell = dbgParcelasCalcularDebitoDrawColumnCell
              OnDblClick = dbgParcelasCalcularDebitoDblClick
              OnKeyDown = dbgParcelasCalcularDebitoKeyDown
              RowWrap = 60
              Large = False
              DoubleRowColor = False
              TitleMinHeight = 100
              CellHeights = 100
              StrippedColor = 16054260
              CanDelete = False
              CanNotInsertFromGrid = False
              PostOnEnter = False
              PostOnSetUpDown = False
              DenySort = False
              DefaultRowHeight = 20
              ExibirNumerodaLinha = False
              NaoAtribuirDadosaTabelaaoDigitar = False
              ShowWhenFieldInvisible = False
              CanClickWhenEditing = False
              Columns = <
                item
                  Expanded = False
                  FieldName = 'aux'
                  Title.Alignment = taCenter
                  Title.Caption = 'Contrato'
                  Width = 125
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'numeroparcela'
                  Title.Alignment = taCenter
                  Title.Caption = 'NP'
                  Width = 25
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'datavencimento'
                  Title.Alignment = taCenter
                  Title.Caption = 'Data Vencto.'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'valorvencimento'
                  Title.Alignment = taCenter
                  Title.Caption = 'Valor Vencto.'
                  Width = 90
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'datapagamento'
                  Title.Alignment = taCenter
                  Title.Caption = 'Data Pagto.'
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'valorpagamento'
                  Title.Alignment = taCenter
                  Title.Caption = 'Valor Pagto.'
                  Width = 90
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'JurosDescontos'
                  Title.Alignment = taCenter
                  Title.Caption = 'Juros/Desctos'
                  Width = 90
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'filialpagamento'
                  Title.Alignment = taCenter
                  Title.Caption = 'Fil.'
                  Width = 30
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'tipopagamento'
                  Title.Alignment = taCenter
                  Title.Caption = 'TP'
                  Width = 25
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'Quitar'
                  Title.Alignment = taCenter
                  Title.Caption = 'Sel.'
                  Width = 30
                  Visible = True
                end>
            end
            object dbgCheques: TtecDBGrid
              Left = 2
              Top = 480
              Width = 801
              Height = 91
              Align = alBottom
              DataSource = fraConsultaDadosClienteFicha.dsrCheques
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              ReadOnly = True
              TabOrder = 6
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clBlack
              TitleFont.Height = -13
              TitleFont.Name = 'helvetica'
              TitleFont.Pitch = fpVariable
              TitleFont.Style = []
              OnDrawColumnCell = fraConsultaDadosClienteFichadbgChequesDrawColumnCell
              RowWrap = 60
              Large = False
              DoubleRowColor = False
              TitleMinHeight = 100
              CellHeights = 100
              StrippedColor = 16054260
              CanDelete = False
              CanNotInsertFromGrid = False
              PostOnEnter = False
              PostOnSetUpDown = False
              DenySort = False
              DefaultRowHeight = 16
              ExibirNumerodaLinha = False
              NaoAtribuirDadosaTabelaaoDigitar = False
              ShowWhenFieldInvisible = False
              CanClickWhenEditing = False
              Columns = <
                item
                  Expanded = False
                  FieldName = 'data'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Title.Alignment = taCenter
                  Title.Caption = 'EMISS'#195'O'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -9
                  Title.Font.Name = 'helvetica'
                  Title.Font.Pitch = fpVariable
                  Title.Font.Style = []
                  Width = 70
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'vencto'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Title.Alignment = taCenter
                  Title.Caption = 'VENCTO'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -9
                  Title.Font.Name = 'helvetica'
                  Title.Font.Pitch = fpVariable
                  Title.Font.Style = []
                  Width = 70
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'valor'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Title.Alignment = taCenter
                  Title.Caption = 'VALOR'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -9
                  Title.Font.Name = 'helvetica'
                  Title.Font.Pitch = fpVariable
                  Title.Font.Style = []
                  Width = 100
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'filial'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Title.Alignment = taCenter
                  Title.Caption = 'FILIAL'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -9
                  Title.Font.Name = 'helvetica'
                  Title.Font.Pitch = fpVariable
                  Title.Font.Style = []
                  Width = 35
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'titular'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Title.Alignment = taCenter
                  Title.Caption = 'TITULAR'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -9
                  Title.Font.Name = 'helvetica'
                  Title.Font.Pitch = fpVariable
                  Title.Font.Style = []
                  Width = 315
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'nome_situacao'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Title.Alignment = taCenter
                  Title.Caption = 'SITUA'#199#195'O'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -9
                  Title.Font.Name = 'helvetica'
                  Title.Font.Pitch = fpVariable
                  Title.Font.Style = []
                  Width = 135
                  Visible = True
                end>
            end
          end
        end
      end
      object pnlTop: TPanel
        Left = 2
        Top = 18
        Width = 813
        Height = 21
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object sbnCliente: TSpeedButton
          Left = 145
          Top = -1
          Width = 23
          Height = 23
          Hint = 'Procurar Cliente'
          Flat = True
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
          OnClick = sbnClienteClick
        end
        object lblCliente: TLabel
          Left = 12
          Top = 3
          Width = 39
          Height = 15
          Alignment = taRightJustify
          Caption = 'Cliente'
          FocusControl = edfCodigoCliente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object lblConceito: TLabel
          Left = 560
          Top = 3
          Width = 51
          Height = 16
          Alignment = taRightJustify
          Caption = 'Conceito'
          FocusControl = edfCodigoCliente
        end
        object dtxNome: TtecDBText
          Left = 169
          Top = -1
          Width = 350
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'nome'
          DataSource = dtmFichaFinanceira.dsrClientes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Alignment = taLeftJustify
        end
        object dtxDescricaoConceito: TtecDBText
          Left = 617
          Top = 0
          Width = 177
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'descricaoconceito'
          DataSource = dtmFichaFinanceira.dsrClientes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Alignment = taLeftJustify
        end
      end
      object edfCodigoCliente: TtecDbEditFind
        Left = 56
        Top = 16
        Width = 90
        Height = 23
        Alignment = taLeftJustify
        DataField = 'codigo'
        DataSource = dtmFichaFinanceira.dsrClientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Group = 'Ficha'
        MaxLength = 10
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        Opcional = True
        OnEnter = edfCodigoClienteEnter
        OnExit = edfCodigoClienteExit
        OnFound = edfCodigoClienteFound
        ParentFont = False
        TabOrder = 2
        PermitirZero = False
        PermitirNulo = False
        Operacao = opATRIBUICAO
        Parameter = 'Codigo'
        ActiveSetControls = True
        DenyInsert = True
        NoSetControls = <
          item
            Control = sbnCliente
          end
          item
            Control = dtxNome
          end
          item
            Control = pnlTop
          end>
        SetControls = <>
      end
    end
  end
  object aclFichaFinanceira: TActionList
    Left = 688
    Top = 8
    object actHabilitarBotaoCalcular: TAction
      OnUpdate = actHabilitarBotaoCalcularUpdate
    end
  end
end
