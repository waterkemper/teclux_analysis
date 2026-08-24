inherited frmCadastroAtendimento: TfrmCadastroAtendimento
  Left = 528
  Top = 164
  Action = actHabilitar
  ActiveControl = dbgOcorrencias
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  Caption = 'Cadastro de Atendimentos'
  ClientHeight = 637
  ClientWidth = 1333
  FormStyle = fsMDIChild
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 48
    Top = 2
    Width = 603
  end
  inherited pnlTopMenu: TPanel
    Width = 1333
    TabOrder = 2
    inherited tblBarra: TToolBar
      Left = 303
      Width = 1030
      ButtonHeight = 35
      inherited sbnProcurar: TSpeedButton
        Top = 2
      end
      inherited sbnAjuda: TSpeedButton
        Top = 19
      end
      object sbnImprimir: TSpeedButton
        Left = 84
        Top = 2
        Width = 75
        Height = 35
        Hint = 'Visualizar como o relat'#243'rio ser'#225' impresso'
        Caption = 'Imprimir F7'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
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
        ParentFont = False
        Spacing = 0
        OnClick = sbnImprimirClick
      end
      object sbnImprimirMultiplos: TSpeedButton
        Left = 159
        Top = 2
        Width = 130
        Height = 35
        Hint = 'Visualizar janela com par'#226'metros para sele'#231#227'o e impress'#227'o'
        Caption = 'Imprimir M'#250'ltiplos F8'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
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
        ParentFont = False
        Spacing = 0
        OnClick = sbnImprimirMultiplosClick
      end
      object sbnCadastroCliente: TSpeedButton
        Left = 289
        Top = 2
        Width = 96
        Height = 35
        Hint = 'Exibir Ficha Financeira'
        Caption = 'Cadastro Cliente'
        Flat = True
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC000000000000000000000000000000000000000000000000DCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDC7F7F7F7F7F7FDCDCDCFFFFFFDCDCDCDCDCDCDCDCDC000000
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000000000800000
          00DCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDC7F7F7FFFFFFF7F7F7FDCDCDCFFFFFFDCDCDC000000000000
          0000800000800000800000800000800000800000800000800000000000800000
          80000000DCDCDCDCDCDC7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFF7F7F7FDCDCDCFFFFFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          80000080000000DCDCDC7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7FDCDCDCFFFFFF7F7F7FDCDCDCDCDCDC000000
          7F7F7F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF0000
          00000080000080000000DCDCDC7F7F7F7F7F7F7F7F7FFFFFFFDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDC7F7F7FFFFFFF7F7F7FFFFFFFFFFFFF7F7F7FDCDCDCDCDCDC
          000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF0000
          00000000000080000000DCDCDCDCDCDC7F7F7F7F7F7FFFFFFFDCDCDCDCDCDCDC
          DCDCFFFFFFFFFFFF7F7F7FFFFFFF7F7F7F7F7F7FDCDCDC7F7F7FDCDCDCDCDCDC
          DCDCDC000000FFFFFFFFFFFF7F7F7F000000000000000000000000FFFFFF0000
          00FFFFFF000000000000DCDCDCDCDCDCDCDCDC7F7F7FDCDCDCFFFFFFFFFFFF7F
          7F7F7F7F7F7F7F7F7F7F7FDCDCDC7F7F7FFFFFFF7F7F7F7F7F7FDCDCDCDCDCDC
          DCDCDCDCDCDC000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00FFFFFF000000000000DCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
          DCDCDCDCDCDCDCDCFFFFFFFFFFFF7F7F7FFFFFFF7F7F7F7F7F7FDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDC000000FFFFFFFFFFFF7F7F7F0000000000000000000000
          00FFFFFF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCFF
          FFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7FDCDCDC7F7F7FFFFFFFDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDC000000000000000000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F
          7F7F7F7F7FDCDCDCDCDCDCDCDCDCFFFFFFFFFFFF7F7F7FFFFFFFDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC000000FFFFFFFFFFFF7F7F7F0000000000
          00000000000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F
          7F7FDCDCDCFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC000000000000000000DCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDC7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
        Layout = blGlyphTop
        NumGlyphs = 2
        Spacing = 0
        OnClick = sbnCadastroClienteClick
      end
      object sbnOrcamento: TSpeedButton
        Left = 385
        Top = 2
        Width = 69
        Height = 35
        Hint = 'Cadastro de Or'#231'amento'
        Caption = 'Or'#231'amento'
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
        OnClick = sbnOrcamentoClick
      end
      object sbnConsultaVendas: TSpeedButton
        Left = 454
        Top = 2
        Width = 107
        Height = 35
        Hint = 'Consulta vendas a clientes'
        Caption = 'Consultar Vendas'
        Flat = True
        Glyph.Data = {
          9E020000424D9E0200000000000036000000280000000E0000000E0000000100
          18000000000068020000C30E0000C30E00000000000000000000C0C0C0C8C8C8
          CACACACACACACACACAC9C9C9D0D0D0C3D5D5ABC6C6BCC2C2BAC5C5C9CECEC0BF
          BFC0C0C05C4AC1C1C19C9C9C9292929393939393939999997F8181994B4B9618
          184629295C2828846E6EC3C9C9C1C1C15C4ABFBFBF9C9C9C959C9C989C9C98A2
          A299A4A48797978A0404B05555B4BABA674E4EA69797C4C7C7C0C0C05C4AB8B8
          B8F0EFEFFFEEEEFFF9F9FFD8D8FFDBDBFFDCDC455454B1C1C1CAC7C73338389B
          9F9FC5C5C5C0C0C05C4AB8BABAE2DFDFFFC0C0FFD4D4FF9696FF9C9CAA616100
          0000151515CECFCFE3E3E3686868B8B8B8C3C3C35C4AB8B9B9E2E0E0FFCACAFF
          DBDBFFA6A6FFACAC4A3A3A0000004C4C4CF4F4F4F8F7F7A09F9F838383CCCCCC
          5C4AB8B9B9E2E0E0FFCECEFFDEDEFFAFAFFFB2B2442E2E000000373737BBC3C3
          E6CACA7E6D6DA9ADADC7C6C65C4AB8B9B9E2E0E0FFCECEFFDEDEFFAEAEFFB4B4
          5347470000000000000100009FA2A2939494949494CACACA5C4AB8BABAE2E0E0
          FFC5C5FFDBDBFF9E9EFFA3A3C26C6C0500000000000000000000001F1F1F4F4F
          4FD9D9D95C4AB8B9B9E2E1E1FFE1E1FFE2E2FFCFCFFFD3D3FFE7E7CAC8C85656
          561F1F1F2D2D2D505050BABABAC5C5C55C4AB8BABAE2E3E3FF9696FF6B6BFF6F
          6FFF8989F8FDFDB0B1B19898986A6A6ADADADACFCFCFC5C5C5BFBFBF5C4AB8B9
          B9E4E4E4FFCFCFFFBDBDFFBDBDFFC9C9FCFEFEBCBDBD535353ADADADC8C8C8C0
          C0C0C0C0C0C0C0C05C4ABAB9B9DDDDDDF3FCFCF2FFFFF2FFFFF3FDFDF2F1F191
          9090A7A7A7CCCCCCBFBFBFC0C0C0C0C0C0C0C0C05C4AC0C0C0BFBFBFBFBFBFBE
          BEBEBEBEBEBFBFBFBDBDBDBFBFBFC7C7C7BFBFBFC0C0C0C0C0C0C0C0C0C0C0C0
          5C4A}
        Layout = blGlyphTop
        Spacing = 0
        OnClick = sbnConsultaVendasClick
      end
      object sbnTrocarUsuario: TSpeedButton
        Left = 561
        Top = 2
        Width = 88
        Height = 35
        Hint = 'Trocar usu'#225'rio respons'#225'vel pelo atendimento'
        Caption = 'Trocar Usu'#225'rio'
        Flat = True
        Glyph.Data = {
          AA040000424DAA04000000000000360000002800000013000000130000000100
          18000000000074040000C40E0000C40E00000000000000000000CDCFD0372611
          5C37015E38025D38035E38025E39025E39035D37025E37025E39035C37034933
          199A9897FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDE0E1604825BF7A06D4
          8A0CD29227D19633CE8912CE8509D29734D39732D28809C7810A7D5B24ABABAB
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F37F7970845C0ECA901ED0B9
          87C8CDC2AEA676A89B65C5CEC4D0C7AAC88B169F6E11746955DADADDFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCD2D2D26D634F75673D9AB7C49BD2FE
          9FD2F49FD0F39AD2FD9BC7E4837448655335BEBEC0FDFDFEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFDFDFCDEDCDB6F767C3C698A83C3F0A7D8FFB6DFFFB7
          DFFFABD9FF8ECEFB4A80AB505862DAD6D4FCFCFCFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFDFDEDD6E787F3D688963A9DF97D3FFAEDAFFB8DFFFB8DEFFB1DB
          FE9DD4FF6DB9F13D6E9864717DA7A8ABBFC1C4BEC0C4BEC0C4BEBEC3D1D1D1FF
          FFFF7D7C7C31648E4D9DD977BFF99DD3FFB3DDFEBFE2FEBFE1FEB6DEFEA1D4FF
          7EC5FB519FDE3C76A05252467254337556327657336A4D326C6660FFFFFF605F
          5F386F9B519AD177C2F8A0D8FFB7E0FFC0E4FFC1E3FFB8E0FEA2D5FD7EC6F84E
          96D0588CA18E7A30BC8126BC7F20C27B0A935802635A51FFFFFFC8C8C63C4851
          2C4E675FA0D08DC7F0B1DFFCC2EAFFBEE5FFB2DCFF9ED8FF74BFEF3869935C7F
          8696A281C3C8BCD8B87CD492186442069D9C9EFFFFFFF8F7F7959595080A0A19
          1E20252E333F4B55718A9C9CC9E8A0DBFB72A4C92B3C4C2C3F5386BBE3A8DDFA
          97D3FD8AAEC0554C327B7872F0F0F1FFFFFFFEFEFED3D3D3353130120C061E17
          0F1A120A1C150E3C464A5E829A2C2E2F1B15195D7D99AEDEFFB8E0FFADDCFF85
          C8FA336690787E82E4E3E3FFFFFFFFFFFFF2F2F292919025201C2E261D3E352B
          42382E3F362A3E362B352F274F667997C8EEBBE2FFBAE0FFAEDBFE99D4FF65AE
          E72A5980636D75FFFFFFFFFFFFFFFFFFE8E8E88685853D38353F38304D453C53
          4F494C565A4D759786C2EEB2E0FFC0E2FEC0E3FFB5DEFF9BD3FF70BAF450A3E3
          284C67FFFFFFFFFFFFFFFFFFFFFFFFEEEEEEB5B4B57E7D7C64615D494E523251
          6C5192C88DCCEFADD9F9C0E5FFC0E5FFB4DEFF99D6FF62A7DB37678E475C6BFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F3E1E1E1B1B2B32A2E33263C4E
          486376657D908BA8BBA6D1EBA2D7FA75A8CB395974161D239E9E9EFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F75C5B5A0B0706201C1622
          1F1C323435566C7865889D3C4A52111010363434E3E3E3FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C12220202019113B32283E36
          2C433D3746433E29241A181613989798F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9A8A7A82E2B283028204F473C50483F
          362E262B2823848483E8E8E8FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF9F9FADADBDC6F6D6D1E1C1B141413555554C1
          C1C1F5F5F5FCFCFCFEFEFEFFFFFF}
        Layout = blGlyphTop
        Spacing = 0
        OnClick = sbnTrocarUsuarioClick
      end
    end
    inherited tblBarraCadastro: TToolBar
      Width = 303
      object sbnFollow_up: TSpeedButton
        Left = 225
        Top = 2
        Width = 78
        Height = 35
        Hint = 'Inclui um novo Registro acompanhando o registro atual'
        AllowAllUp = True
        Anchors = [akTop, akRight]
        BiDiMode = bdLeftToRight
        Constraints.MaxHeight = 35
        Constraints.MinHeight = 35
        Caption = 'Followup F4'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDC7F7F7F7F7F7F7F7F7F8080808080807F7F7F7F7F7F7F7F7F7F7F
          7F808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC0000000000000000000000000000000000000000000000000000000000
          00808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
          DCDCDCDCDCFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
          00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
          DCDC7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
          DCDC7F7F7FFFFFFFDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000DCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
          DCDC7F7F7FFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000DCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFFFFFFFFF
          FFFF7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC000000000000000000000000000000000000DCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
        Layout = blGlyphTop
        NumGlyphs = 2
        ParentFont = False
        ParentBiDiMode = False
        Spacing = 0
        OnClick = sbnFollow_upClick
      end
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 40
    Width = 1333
    Height = 597
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 587
      Top = 3
      Width = 2
      Height = 591
      Color = 6776679
      ParentColor = False
      ResizeStyle = rsNone
    end
    object gbxListaAtendimentos: TGroupBox
      Left = 589
      Top = 3
      Width = 741
      Height = 591
      Align = alClient
      TabOrder = 0
      object lblCobrancas: TLabel
        Left = 7
        Top = 1
        Width = 88
        Height = 14
        Caption = ' ATENDIMENTOS '
        FocusControl = dbgOcorrencias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbgOcorrencias: TtecDBGrid
        Left = 2
        Top = 18
        Width = 737
        Height = 571
        Align = alClient
        DataSource = dtmCadastroAtendimentos.dsrOcorrencias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'times'
        TitleFont.Pitch = fpVariable
        TitleFont.Style = []
        OnCellClick = dbgOcorrenciasCellClick
        OnDrawColumnCell = dbgOcorrenciasDrawColumnCell
        OnDblClick = dbgOcorrenciasDblClick
        OnKeyPress = dbgOcorrenciasKeyPress
        RowWrap = 60
        Large = False
        DoubleRowColor = True
        TitleMinHeight = 100
        CellHeights = 100
        StrippedColor = 16054260
        CanDelete = False
        CanNotInsertFromGrid = False
        PostOnEnter = False
        PostOnSetUpDown = False
        DenySort = True
        DefaultRowHeight = 19
        ExibirNumerodaLinha = False
        NaoAtribuirDadosaTabelaaoDigitar = False
        ShowWhenFieldInvisible = False
        Columns = <
          item
            Expanded = False
            FieldName = 'expandir'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Caption = '+/-'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -9
            Title.Font.Name = 'Helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'codigo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'N'#186
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -9
            Title.Font.Name = 'Helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'origem'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'ORIGEM'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -9
            Title.Font.Name = 'Helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'datainclusao'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'INCLUS'#195'O'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -9
            Title.Font.Name = 'HELVETICA'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 91
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
            Title.Caption = 'ABERTURA'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'HELVETICA'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 56
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ultimoatendimento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = #218'LTIMO AT.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'HELVETICA'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 58
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'qtatendimentos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'QTDE'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -9
            Title.Font.Name = 'Helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 29
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'lembrar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'LEMBRAR EM'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'HELVETICA'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricaotipo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'TIPO'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -9
            Title.Font.Name = 'HELVETICA'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'status'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = [fsBold]
            Title.Alignment = taCenter
            Title.Caption = 'S'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -9
            Title.Font.Name = 'Helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 12
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'assunto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'ASSUNTO'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -9
            Title.Font.Name = 'HELVETICA'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 193
            Visible = True
          end>
      end
    end
    object pnlLeft: TPanel
      Left = 3
      Top = 3
      Width = 584
      Height = 591
      Align = alLeft
      TabOrder = 1
      object pnlTop: TPanel
        Left = 1
        Top = 1
        Width = 582
        Height = 349
        Align = alTop
        TabOrder = 0
        object gbxMotivoCancelamento: TGroupBox
          Left = 1
          Top = 312
          Width = 580
          Height = 36
          Align = alBottom
          Caption = 'MOTIVO DO CANCELAMENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 17
          object dtxMotivodoCancelamento: TtecDBText
            Left = 2
            Top = 10
            Width = 574
            Height = 23
            TabStop = False
            Color = clBtnFace
            DataField = 'descricaomotivo'
            DataSource = dtmCadastroAtendimentos.dsrAtendimento
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
        object gbxCodigo: TGroupBox
          Left = 0
          Top = 4
          Width = 95
          Height = 36
          Caption = ' N'#218'MERO '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object edfCodigo: TtecDbEditFind
            Left = 2
            Top = 10
            Width = 90
            Height = 23
            Alignment = taRightJustify
            DataField = 'codigo'
            DataSource = dtmCadastroAtendimentos.dsrAtendimento
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Group = 'Atendimento'
            MaxLength = 8
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
            ActiveSetControls = True
            DenyInsert = True
            NoSetControls = <
              item
                Control = gbxCodigo
              end>
            SetControls = <
              item
                Control = gbxDataInclusao
              end
              item
                Control = rgpTipo
              end
              item
                Control = gbxTipoAtendimento
              end
              item
                Control = gbxCliente
              end
              item
                Control = gbxAtendente
              end
              item
                Control = gbxLembrarEm
              end
              item
                Control = gbxSemSPC
              end
              item
                Control = gbxSemAviso
              end
              item
                Control = pgcInformes
              end
              item
                Control = gbxListaAtendimentos
              end
              item
                Control = rgpStatus
              end
              item
                Control = gbxLIgacoesClientes
              end>
          end
        end
        object gbxDataInclusao: TGroupBox
          Left = 0
          Top = 39
          Width = 95
          Height = 35
          Caption = ' HORA INCLUS'#195'O '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 12
          object dtxData: TtecDBText
            Left = 2
            Top = 10
            Width = 90
            Height = 23
            TabStop = False
            Color = clBtnFace
            DataField = 'datainclusao'
            DataSource = dtmCadastroAtendimentos.dsrAtendimento
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Alignment = taCenter
          end
        end
        object gbxTipoAtendimento: TGroupBox
          Left = 202
          Top = 4
          Width = 374
          Height = 36
          Caption = ' TIPO DE ATENDIMENTO '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object sbnTipoAtendimento: TSpeedButton
            Left = 49
            Top = 12
            Width = 23
            Height = 21
            Hint = 'Procurar Tipo Atendimento'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Pitch = fpVariable
            Font.Style = []
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7FFFFFFFC3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3800000800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000
              00800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000
              00800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000008000
              00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFF
              FFFFC3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3FFA858800000800000800000FFA858C3C3C30000FF800000800000C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3
              C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFC3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3C3C3C3C3C3C37F
              7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
              FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
              FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
              FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
              FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
              FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
              FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
              FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFFFFFFFC3C3C3C3C3C3C3
              C3C3FFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              800000FFA858FFA858FFA858FFA858FFA858800000C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
              7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3FFA858800000800000800000FFA858C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FC3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
            NumGlyphs = 2
            ParentFont = False
            OnClick = sbnTipoAtendimentoClick
          end
          object edfTipoAtendimento: TtecDBFindLookup
            Left = 2
            Top = 10
            Width = 45
            Height = 23
            Alignment = taRightJustify
            DataField = 'tipoatendimento'
            DataSource = dtmCadastroAtendimentos.dsrAtendimento
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
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
            LookupField = 'codigo'
            LookupSource = dtmCadastroAtendimentos.dsrProcuraTiposAtendimentos
            LookupQueryParameter = 'codigo'
            Parameter = ' '
            ActiveSetControls = False
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
            LookupParameter = 'codigo'
          end
          object dtxTipoAtendimento: TtecDBText
            Left = 73
            Top = 10
            Width = 298
            Height = 23
            TabStop = False
            Color = clBtnFace
            DataField = 'descricao'
            DataSource = dtmCadastroAtendimentos.dsrProcuraTiposAtendimentos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            Alignment = taLeftJustify
          end
        end
        object gbxCliente: TGroupBox
          Left = 202
          Top = 39
          Width = 374
          Height = 36
          Caption = ' CLIENTE '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          object sbnCliente: TSpeedButton
            Left = 71
            Top = 10
            Width = 23
            Height = 23
            Hint = 'Procurar Cliente'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Pitch = fpVariable
            Font.Style = []
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7FFFFFFFC3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3800000800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000
              00800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000
              00800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000008000
              00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFF
              FFFFC3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3FFA858800000800000800000FFA858C3C3C30000FF800000800000C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3
              C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFC3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3C3C3C3C3C3C37F
              7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
              FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
              FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
              FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
              FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
              FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
              FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
              FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFFFFFFFC3C3C3C3C3C3C3
              C3C3FFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              800000FFA858FFA858FFA858FFA858FFA858800000C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
              7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3FFA858800000800000800000FFA858C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FC3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
            NumGlyphs = 2
            ParentFont = False
            OnClick = sbnClienteClick
          end
          object edfCodigoCliente: TtecDBFindLookup
            Left = 2
            Top = 10
            Width = 69
            Height = 23
            Alignment = taRightJustify
            DataField = 'cliente'
            DataSource = dtmCadastroAtendimentos.dsrAtendimento
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = 8
            Maximo = 0
            Minimo = 37353
            Adicional = 0
            Opcional = True
            OnFound = edfCodigoClienteFound
            ParentFont = False
            TabOrder = 0
            PermitirZero = False
            PermitirNulo = False
            Operacao = opATRIBUICAO
            LookupField = 'codigo'
            LookupSource = dtmCadastroAtendimentos.dsrProcuraClientes
            LookupQueryParameter = 'codigo'
            Parameter = ' '
            ActiveSetControls = False
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
            LookupParameter = 'codigo'
          end
          object dtxNome: TtecDBText
            Left = 95
            Top = 10
            Width = 276
            Height = 23
            TabStop = False
            Color = clBtnFace
            DataField = 'nome'
            DataSource = dtmCadastroAtendimentos.dsrProcuraClientes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            Alignment = taLeftJustify
          end
        end
        object gbxAssunto: TGroupBox
          Left = 0
          Top = 74
          Width = 577
          Height = 37
          Caption = 'ASSUNTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          object edtAssunto: TDBEditTexto
            Left = 2
            Top = 11
            Width = 572
            Height = 23
            DataField = 'assunto'
            DataSource = dtmCadastroAtendimentos.dsrAtendimento
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
        object gbxAtendenteLogado: TGroupBox
          Left = 1
          Top = 275
          Width = 580
          Height = 36
          Caption = ' ATENDENTE LOGADO '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 13
          object dtxAtendenteLogado: TtecDBText
            Left = 2
            Top = 10
            Width = 575
            Height = 23
            TabStop = False
            Color = clBtnFace
            DataField = 'nomeusuariologado'
            DataSource = dtmCadastroAtendimentos.dsrAtendimento
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
        object rgpTipo: TtecDBRadioGroup
          Left = 96
          Top = 5
          Width = 104
          Height = 70
          Caption = ' ATENDIMENTO DE '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          TabStop = False
          OnClickItem = rgpTipoClickItem
          DataField = 'tipo'
          DataSource = dtmCadastroAtendimentos.dsrAtendimento
          object ckbTipoReclamacao: TtecRadioButton
            Left = 4
            Top = 25
            Width = 94
            Height = 13
            Caption = 'Reclama'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = ckbTipoReclamacaoClick
            Value = 'R'
          end
          object ckbTipoVisita: TtecRadioButton
            Left = 4
            Top = 39
            Width = 93
            Height = 13
            Caption = 'Contato'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = ckbTipoVisitaClick
            Value = 'V'
          end
          object ckbTipoCobranca: TtecRadioButton
            Left = 4
            Top = 11
            Width = 78
            Height = 13
            Caption = 'Cobran'#231'a'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = ckbTipoCobrancaClick
            Value = 'C'
          end
          object ckbOrcamento: TtecRadioButton
            Left = 3
            Top = 52
            Width = 93
            Height = 13
            Caption = 'Or'#231'amento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnClick = ckbTipoVisitaClick
            Value = 'O'
          end
        end
        object gbxLIgacoesClientes: TGroupBox
          Left = 1
          Top = 239
          Width = 580
          Height = 35
          TabOrder = 10
          object ckbNaoLigarTelefone: TDBCheckBox
            Left = 6
            Top = 14
            Width = 302
            Height = 14
            Caption = 'N'#227'o fazer liga'#231#245'es telef'#244'nicas para o cliente'
            DataField = 'naoligar'
            DataSource = dtmCadastroAtendimentos.dsrAtendimento
            TabOrder = 0
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object gbxOrigem: TGroupBox
            Left = 422
            Top = -1
            Width = 155
            Height = 36
            Caption = ' ORIGEM '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object dtxOrigem: TtecDBText
              Left = 2
              Top = 11
              Width = 80
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'origem'
              DataSource = dtmCadastroAtendimentos.dsrAtendimento
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Alignment = taCenter
            end
            object StaticText1: TStaticText
              Left = 84
              Top = 0
              Width = 34
              Height = 16
              Caption = ' DATA '
              TabOrder = 1
            end
            object dtxDataOrigem: TtecDBText
              Left = 82
              Top = 10
              Width = 70
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'dataorigem'
              DataSource = dtmCadastroAtendimentos.dsrAtendimento
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 10
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
              Alignment = taCenter
            end
          end
        end
        object gbxOrcamento: TGroupBox
          Left = 424
          Top = 111
          Width = 153
          Height = 35
          Caption = 'OR'#199'AMENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 15
          object edtOrcamento: TDBEditTexto
            Left = 2
            Top = 10
            Width = 149
            Height = 23
            TabStop = False
            Color = clBtnFace
            DataField = 'orcamentodescricao'
            DataSource = dtmCadastroAtendimentos.dsrAtendimento
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            CharCasenoDefault = False
            Alignment = taCenter
          end
        end
        object gbxSemAviso: TGroupBox
          Left = 338
          Top = 111
          Width = 80
          Height = 35
          Caption = 'SEM AVISO AT'#201
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          object edtDataAviso: TDBEditData
            Left = 2
            Top = 10
            Width = 75
            Height = 23
            Alignment = taCenter
            DataField = 'semaviso'
            DataSource = dtmCadastroAtendimentos.dsrAtendimento
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            Maximo = 37353
            Minimo = 0
            Adicional = 0
            ParentFont = False
            TabOrder = 0
            OnEnter = edtDataAvisoEnter
            Opcional = True
          end
        end
        object gbxContrato: TGroupBox
          Left = 424
          Top = 145
          Width = 153
          Height = 57
          Caption = ' CONTRATO '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 16
          object edtContrato: TDBEditTexto
            Left = 2
            Top = 10
            Width = 148
            Height = 23
            TabStop = False
            Color = clBtnFace
            DataField = 'contratodescricao'
            DataSource = dtmCadastroAtendimentos.dsrAtendimento
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            CharCasenoDefault = False
            Alignment = taCenter
          end
          object edtRenegociado: TDBEditTexto
            Left = 2
            Top = 32
            Width = 146
            Height = 23
            TabStop = False
            Color = clBtnFace
            DataField = 'renegociadoText'
            DataSource = dtmCadastroAtendimentos.dsrAtendimento
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            CharCasenoDefault = False
            Alignment = taCenter
          end
        end
        object gbxData: TGroupBox
          Left = 0
          Top = 110
          Width = 80
          Height = 36
          Caption = ' DATA '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          object edtData: TDBEditData
            Left = 2
            Top = 10
            Width = 75
            Height = 23
            Alignment = taCenter
            DataField = 'data'
            DataSource = dtmCadastroAtendimentos.dsrAtendimento
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            Maximo = 37353
            Minimo = 365
            Adicional = 0
            ParentFont = False
            TabOrder = 0
            OnExit = edtDataExit
            Opcional = True
          end
        end
        object gbxLembrarEm: TGroupBox
          Left = 81
          Top = 110
          Width = 167
          Height = 37
          Caption = ' LEMBRAR EM ------ A PARTIR DAS '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          object edttpLembrarHora: TAdvDBDateTimePicker
            Left = 104
            Top = 12
            Width = 57
            Height = 23
            Date = 43019.366192129630000000
            Format = 'HH:mm'
            Time = 43019.366192129630000000
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Kind = dkTime
            ParentFont = False
            TabOrder = 1
            AutoTab = True
            BorderStyle = bsSingle
            Ctl3D = True
            DateTime = 43019.366192129630000000
            TimeFormat = 'HH:mm'
            Version = '1.2.0.1'
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clWindowText
            LabelFont.Height = -11
            LabelFont.Name = 'MS Sans Serif'
            LabelFont.Style = []
            DataField = 'lembrarhora'
            DataSource = dtmCadastroAtendimentos.dsrAtendimento
          end
          object edttpLembrar: TDBPlannerDatePicker
            Left = 5
            Top = 11
            Width = 96
            Height = 23
            AllowNumericNullValue = True
            EmptyTextFocused = True
            Flat = False
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clWindowText
            LabelFont.Height = -11
            LabelFont.Name = 'MS Sans Serif'
            LabelFont.Style = []
            Lookup.Separator = ';'
            Color = clWindow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            ReadOnly = False
            TabOrder = 0
            Visible = True
            Version = '1.4.0.9'
            ButtonStyle = bsButton
            ButtonWidth = 16
            Etched = False
            Glyph.Data = {
              DA020000424DDA0200000000000036000000280000000D0000000D0000000100
              200000000000A402000000000000000000000000000000000000F0F0F000F0F0
              F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
              F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
              F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
              F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
              F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
              F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
              F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
              F00000000000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
              F000F0F0F000F0F0F000F0F0F000F0F0F000000000000000000000000000F0F0
              F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
              F0000000000000000000000000000000000000000000F0F0F000F0F0F000F0F0
              F000F0F0F000F0F0F000F0F0F000F0F0F0000000000000000000000000000000
              0000000000000000000000000000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
              F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
              F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
              F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
              F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
              F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
              F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
              F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
              F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000}
            DataField = 'lembrar'
            DataSource = dtmCadastroAtendimentos.dsrAtendimento
            HideCalendarAfterSelection = True
            object TDBPlannerCalendar
              Left = 0
              Top = 0
              Width = 180
              Height = 180
              EventDayColor = clBlack
              EventMarkerColor = clYellow
              EventMarkerShape = evsCircle
              BackgroundPosition = bpTiled
              BevelOuter = bvNone
              BorderWidth = 1
              Look = lookFlat
              DateDownColor = clNone
              DateHoverColor = clNone
              DayFont.Charset = DEFAULT_CHARSET
              DayFont.Color = clWindowText
              DayFont.Height = -11
              DayFont.Name = 'MS Sans Serif'
              DayFont.Style = []
              WeekFont.Charset = DEFAULT_CHARSET
              WeekFont.Color = clWindowText
              WeekFont.Height = -11
              WeekFont.Name = 'MS Sans Serif'
              WeekFont.Style = []
              WeekName = 'Wk'
              TextColor = clBlack
              SelectColor = clTeal
              SelectFontColor = clWhite
              InActiveColor = clGray
              HeaderColor = clNone
              FocusColor = clHighlight
              InversColor = clTeal
              WeekendColor = clRed
              NameOfDays.Monday = 'seg'
              NameOfDays.Tuesday = 'ter'
              NameOfDays.Wednesday = 'qua'
              NameOfDays.Thursday = 'qui'
              NameOfDays.Friday = 'sex'
              NameOfDays.Saturday = 's'#225'b'
              NameOfDays.Sunday = 'dom'
              NameOfMonths.January = 'jan'
              NameOfMonths.February = 'fev'
              NameOfMonths.March = 'mar'
              NameOfMonths.April = 'abr'
              NameOfMonths.May = 'mai'
              NameOfMonths.June = 'jun'
              NameOfMonths.July = 'jul'
              NameOfMonths.August = 'ago'
              NameOfMonths.September = 'set'
              NameOfMonths.October = 'out'
              NameOfMonths.November = 'nov'
              NameOfMonths.December = 'dez'
              NameOfMonths.UseIntlNames = True
              MinDate.Day = 18
              MinDate.Month = 10
              MinDate.Year = 2017
              MinDate.Use = True
              StartDay = 7
              TodayFormat = '"Today" DDD/mm, YYYY'
              Day = 18
              Month = 10
              Year = 2017
              TabOrder = 0
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              CaptionColor = clNone
              CaptionTextColor = clBlack
              LineColor = clGray
              Line3D = True
              GradientStartColor = clWhite
              GradientEndColor = clBtnFace
              GradientDirection = gdVertical
              MonthGradientStartColor = clNone
              MonthGradientEndColor = clNone
              MonthGradientDirection = gdHorizontal
              HintPrevYear = 'Previous Year'
              HintPrevMonth = 'Previous Month'
              HintNextMonth = 'Next Month'
              HintNextYear = 'Next Year'
              Version = '1.9.2.1'
              Active = False
              AutoUpdate = True
            end
          end
        end
        object gbxSemSPC: TGroupBox
          Left = 252
          Top = 110
          Width = 80
          Height = 37
          Caption = ' SEM SPC AT'#201
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          object edtDataSPC: TDBEditData
            Left = 2
            Top = 10
            Width = 75
            Height = 23
            Alignment = taCenter
            DataField = 'semspc'
            DataSource = dtmCadastroAtendimentos.dsrAtendimento
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            Maximo = 37353
            Minimo = 0
            Adicional = 0
            ParentFont = False
            TabOrder = 0
            OnEnter = edtDataSPCEnter
            Opcional = True
          end
        end
        object rgpStatus: TtecDBRadioGroup
          Left = 424
          Top = 206
          Width = 153
          Height = 31
          Caption = ' STATUS '
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 11
          TabStop = False
          DataField = 'status'
          DataSource = dtmCadastroAtendimentos.dsrAtendimento
          object rbnFechado: TtecRadioButton
            Left = 79
            Top = 12
            Width = 71
            Height = 15
            Caption = 'Fechado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Value = 'F'
          end
          object rbnAberto: TtecRadioButton
            Left = 7
            Top = 12
            Width = 61
            Height = 15
            Caption = 'Aberto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Value = 'A'
          end
        end
        object gbxAlertaFicha: TGroupBox
          Left = 1
          Top = 152
          Width = 416
          Height = 91
          Caption = 'MENSAGEM DE ALERTA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          object mmoFichaAlerta: TtecDBMemo
            Left = 2
            Top = 14
            Width = 407
            Height = 80
            DataField = 'fichaalerta'
            DataSource = dtmCadastroAtendimentos.dsrAtendimento
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = 1000
            ParentFont = False
            TabOrder = 0
          end
        end
        object gbxAtendente: TGroupBox
          Left = 1
          Top = 311
          Width = 580
          Height = 36
          Caption = 'ATENDENTE CADASTRANTE '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 14
          object dtxAtendente: TtecDBText
            Left = 2
            Top = 10
            Width = 575
            Height = 23
            TabStop = False
            Color = clBtnFace
            DataField = 'nomeusuario'
            DataSource = dtmCadastroAtendimentos.dsrAtendimento
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
      end
      object pgcInformes: TPageControl
        Left = 1
        Top = 350
        Width = 582
        Height = 240
        ActivePage = tstEditarInformes
        Align = alClient
        MultiLine = True
        TabOrder = 1
        TabWidth = 150
        object tstEditarInformes: TTabSheet
          BorderWidth = 2
          Caption = 'Texto do Atendimento'
          object mmoEditarInformes: TRichEdit
            Left = 0
            Top = 0
            Width = 570
            Height = 205
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            ScrollBars = ssVertical
            TabOrder = 0
            WantTabs = True
            OnKeyDown = mmoEditarInformesKeyDown
            OnKeyPress = mmoEditarInformesKeyPress
          end
        end
        object tstHistorico: TTabSheet
          BorderWidth = 2
          Caption = ' Hist'#243'ric&os'
          ImageIndex = 1
          object gbxUltimaReclamacao: TGroupBox
            Left = 0
            Top = 119
            Width = 570
            Height = 86
            Align = alBottom
            Caption = ' '#218'LTIMA RECLAMA'#199#195'O '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object mmoUltimaReclamacao: TDBMemo
              Left = 2
              Top = 14
              Width = 566
              Height = 70
              TabStop = False
              Align = alClient
              Color = 16765587
              DataField = 'informes'
              DataSource = dtmCadastroAtendimentos.dsrUltimaReclamacao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
          end
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 570
            Height = 119
            Align = alClient
            AutoSize = True
            Caption = 'Panel1'
            TabOrder = 1
            object lbxExibirInformes: TRichEdit
              Left = 1
              Top = 1
              Width = 568
              Height = 117
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              HideScrollBars = False
              ParentFont = False
              ReadOnly = True
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
        end
      end
    end
  end
  object aclHabilitar: TActionList
    Left = 1176
    Top = 8
    object actHabilitar: TAction
      OnUpdate = actHabilitarUpdate
    end
  end
end
