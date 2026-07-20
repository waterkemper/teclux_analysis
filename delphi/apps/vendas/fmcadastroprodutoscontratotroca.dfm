inherited frmCadastroProdutosContratoTroca: TfrmCadastroProdutosContratoTroca
  Left = 428
  Top = 160
  Action = actHabilitarControles
  ActiveControl = dbgSimilares
  Caption = 'Cadastro de Produtos do Contrato'
  ClientHeight = 449
  ClientWidth = 774
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Width = 485
    inherited bvlBotoesEd: TBevel
      Left = 201
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 774
    TabOrder = 2
    inherited tblBarra: TToolBar
      Width = 549
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 45
    Width = 774
    Height = 404
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 1
    object gbxFundoJanela: TGroupBox
      Left = 3
      Top = 3
      Width = 768
      Height = 398
      Align = alClient
      TabOrder = 0
      object sbnConsultaProduto: TSpeedButton
        Left = 260
        Top = 12
        Width = 23
        Height = 23
        Hint = 'Procura produto a ser vendido'
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
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC7F
          7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
          FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
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
          DCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
          FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
          FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCFFFFFFFFFFFFDCDCDCDCDCDCDC
          DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FDCDCDCFFFFFFFFFFFF7F
          7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
        NumGlyphs = 2
        OnClick = sbnConsultaProdutoClick
      end
      object sbnConsultaFilial: TSpeedButton
        Left = 160
        Top = 39
        Width = 23
        Height = 23
        Hint = 'Procurar filial de despacho do produto'
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
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC7F
          7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
          FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
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
          DCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
          FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
          FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCFFFFFFFFFFFFDCDCDCDCDCDCDC
          DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FDCDCDCFFFFFFFFFFFF7F
          7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
        NumGlyphs = 2
        OnClick = sbnConsultaFilialClick
      end
      object sbnConsultaReserva: TSpeedButton
        Left = 187
        Top = 205
        Width = 23
        Height = 23
        Hint = 'Procura reservas do vendedor para o produto especificado'
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
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC7F
          7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
          FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
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
          DCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
          FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
          FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCFFFFFFFFFFFFDCDCDCDCDCDCDC
          DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FDCDCDCFFFFFFFFFFFF7F
          7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
        NumGlyphs = 2
        OnClick = sbnConsultaReservaClick
      end
      object sbnAlterarPreco: TSpeedButton
        Left = 230
        Top = 120
        Width = 93
        Height = 23
        Caption = '&Alterar pre'#231'o '
        Flat = True
        OnClick = sbnAlterarPrecoClick
      end
      object sbnProcurarVendedor: TSpeedButton
        Left = 185
        Top = 178
        Width = 23
        Height = 23
        Hint = 'Procura vendedores'
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
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC7F
          7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
          FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
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
          DCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
          FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
          FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCFFFFFFFFFFFFDCDCDCDCDCDCDC
          DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FDCDCDCFFFFFFFFFFFF7F
          7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
        NumGlyphs = 2
        OnClick = sbnProcurarVendedorClick
      end
      object lblCodigoProduto: TLabel
        Left = 30
        Top = 15
        Width = 90
        Height = 16
        Alignment = taRightJustify
        Caption = 'Item de produto'
      end
      object lblQuantidade: TLabel
        Left = 53
        Top = 96
        Width = 66
        Height = 16
        Alignment = taRightJustify
        Caption = 'Quantidade'
      end
      object lblPrecoProduto: TLabel
        Left = 85
        Top = 123
        Width = 34
        Height = 16
        Alignment = taRightJustify
        Caption = 'Pre'#231'o'
      end
      object lblFilialSaida: TLabel
        Left = 92
        Top = 42
        Width = 27
        Height = 16
        Alignment = taRightJustify
        Caption = 'Filial'
      end
      object lblReserva: TLabel
        Left = 73
        Top = 208
        Width = 46
        Height = 16
        Alignment = taRightJustify
        Caption = 'Reserva'
      end
      object lblVendedor: TLabel
        Left = 65
        Top = 181
        Width = 54
        Height = 16
        Alignment = taRightJustify
        Caption = 'Vendedor'
      end
      object lblDecricaoAlteracaoPreco: TLabel
        Left = 7
        Top = 150
        Width = 112
        Height = 16
        Alignment = taRightJustify
        Caption = 'Descri'#231#227'o do pre'#231'o'
      end
      object lblEmEstoque: TLabel
        Left = 49
        Top = 70
        Width = 70
        Height = 16
        Alignment = taRightJustify
        Caption = 'Em estoque'
      end
      object lblQtdeCopiar: TLabel
        Left = 259
        Top = 96
        Width = 237
        Height = 16
        Alignment = taRightJustify
        Caption = 'Quantidade '#224' copiar para o novo contrato'
        Visible = False
      end
      object lblFilialDeposito: TLabel
        Left = 505
        Top = 43
        Width = 58
        Height = 16
        Alignment = taRightJustify
        Caption = 'Dep'#243'sitos'
      end
      object lblPromocao: TLabel
        Left = 341
        Top = 123
        Width = 156
        Height = 18
        Caption = 'Produto em promo'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -15
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        Visible = False
      end
      object flkCodigoProduto: TtecDBFindLookup
        Left = 124
        Top = 12
        Width = 135
        Height = 24
        Alignment = taLeftJustify
        DataaFieldInterno = 'produto'
        DataaFieldVisual = 'produtovisual'
        DataField = 'produtodigitado'
        DataSource = dtmTrocaMercadorias.dsrProdutosContratos
        MaxLength = 100
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        Opcional = True
        OnEnter = flkCodigoProdutoEnter
        OnExit = flkCodigoProdutoExit
        OnKeyDown = flkCodigoProdutoKeyDown
        OnMessage = flkCodigoProdutoMessage
        TabOrder = 0
        PermitirZero = False
        PermitirNulo = False
        Operacao = opATRIBUICAO
        LookupaFieldinterno = 'produto'
        LookupaFieldVisual = 'produtovisual'
        LookupField = 'produtovisual'
        LookupSource = dtmTrocaMercadorias.dsrProcuraProduto
        LookupQueryParameter = 'produtovisual'
        Parameter = ' '
        ActiveSetControls = False
        DenyInsert = False
        NoSetControls = <>
        SetControls = <>
        LookupParameter = 'produtovisual'
      end
      object edtQuantidade: TDBEditNumero
        Left = 124
        Top = 93
        Width = 69
        Height = 24
        MaxLength = -1
        TabOrder = 2
        Mascara = False
        Alignment = taLeftJustify
        TipoMascara = tmQUANTIDADE
        NrDecimal = 0
        Decimais = False
        Negativo = False
        Tamanho = 0
        DataField = 'quantidade'
        DataSource = dtmTrocaMercadorias.dsrProdutosContratos
      end
      object dtxUnidade: TtecDBText
        Left = 194
        Top = 93
        Width = 65
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'unidade'
        DataSource = dtmTrocaMercadorias.dsrProdutosContratos
        ReadOnly = True
        TabOrder = 10
        Alignment = taLeftJustify
      end
      object dtxDescricaoProduto: TtecDBText
        Left = 280
        Top = 12
        Width = 425
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'descricaolc'
        DataSource = dtmTrocaMercadorias.dsrProcuraProduto
        ReadOnly = True
        TabOrder = 11
        Alignment = taLeftJustify
      end
      object edtPreco: TDBEditNumero
        Left = 124
        Top = 120
        Width = 105
        Height = 24
        TabStop = False
        MaxLength = -1
        TabOrder = 4
        OnExit = edtPrecoExit
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = False
        Tamanho = 9
        DataField = 'precovenda'
        DataSource = dtmTrocaMercadorias.dsrProdutosContratos
      end
      object dtxNomeVendedor: TtecDBText
        Left = 209
        Top = 178
        Width = 344
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'nome'
        DataSource = dtmTrocaMercadorias.dsrProcuraVendedorProduto
        ReadOnly = True
        TabOrder = 12
        Alignment = taLeftJustify
      end
      object flkVendedor: TtecDBFindLookup
        Left = 124
        Top = 178
        Width = 60
        Height = 24
        Alignment = taLeftJustify
        DataField = 'vendedor'
        DataSource = dtmTrocaMercadorias.dsrProdutosContratos
        MaxLength = 6
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        Opcional = True
        OnEnter = flkVendedorEnter
        TabOrder = 6
        PermitirZero = False
        PermitirNulo = False
        Operacao = opATRIBUICAO
        LookupField = 'codigo'
        LookupSource = dtmTrocaMercadorias.dsrProcuraVendedorProduto
        LookupQueryParameter = 'codigo'
        Parameter = ' '
        ActiveSetControls = False
        DenyInsert = False
        NoSetControls = <>
        SetControls = <>
        LookupParameter = 'codigo'
      end
      object flkFilial: TtecDBFindLookup
        Left = 124
        Top = 39
        Width = 35
        Height = 24
        Alignment = taLeftJustify
        DataField = 'filial'
        DataSource = dtmTrocaMercadorias.dsrProdutosContratos
        MaxLength = 3
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        Opcional = True
        OnEnter = flkFilialEnter
        OnMessage = flkFilialMessage
        TabOrder = 1
        PermitirZero = False
        PermitirNulo = False
        Operacao = opATRIBUICAO
        LookupField = 'codigo'
        LookupSource = dtmTrocaMercadorias.dsrProcuraFilialProduto
        LookupQueryParameter = 'codigo'
        Parameter = ' '
        ActiveSetControls = False
        DenyInsert = False
        NoSetControls = <>
        SetControls = <>
        LookupParameter = 'codigo'
      end
      object dtxNomeFilial: TtecDBText
        Left = 192
        Top = 39
        Width = 270
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'nome'
        DataSource = dtmTrocaMercadorias.dsrProcuraFilialProduto
        ReadOnly = True
        TabOrder = 13
        Alignment = taLeftJustify
      end
      object flkReserva: TtecDBFindLookup
        Left = 124
        Top = 205
        Width = 63
        Height = 24
        Alignment = taLeftJustify
        DataField = 'reserva'
        MaxLength = 9
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        Opcional = True
        OnEnter = flkReservaEnter
        OnExit = flkExit
        OnMessage = flkReservaMessage
        ReadOnly = True
        TabOrder = 7
        PermitirZero = False
        PermitirNulo = False
        Operacao = opATRIBUICAO
        LookupField = 'numero'
        LookupSource = dtmTrocaMercadorias.dsrProcuraReservaProduto
        LookupQueryParameter = 'numero'
        Parameter = ' '
        ActiveSetControls = False
        DenyInsert = False
        NoSetControls = <>
        SetControls = <>
        LookupParameter = 'numero'
      end
      object dtxReserva: TtecDBText
        Left = 211
        Top = 205
        Width = 342
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'descricao'
        DataSource = dtmTrocaMercadorias.dsrProcuraReservaProduto
        ReadOnly = True
        TabOrder = 14
        Alignment = taLeftJustify
      end
      object dtxPrecoProduto: TtecDBText
        Left = 124
        Top = 120
        Width = 105
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'precovenda'
        DataSource = dtmTrocaMercadorias.dsrProdutosContratos
        ReadOnly = True
        TabOrder = 15
        Alignment = taLeftJustify
      end
      object edtDescricaoPrecoVenda: TDBEditTexto
        Left = 124
        Top = 139
        Width = 390
        Height = 24
        DataField = 'descricaoprecovenda'
        DataSource = dtmTrocaMercadorias.dsrProdutosContratos
        Enabled = False
        MaxLength = -1
        TabOrder = 5
        OnExit = edtDescricaoPrecoVendaExit
        CharCasenoDefault = False
        Alignment = taLeftJustify
      end
      object rgpMontagem: TtecDBRadioGroup
        Left = 573
        Top = 124
        Width = 137
        Height = 50
        Caption = 'Montagem'
        TabOrder = 8
        TabStop = False
        DataField = 'montagem'
        DataSource = dtmTrocaMercadorias.dsrProdutosContratos
        object rbnMontagemSIM: TtecRadioButton
          Left = 9
          Top = 22
          Width = 50
          Height = 17
          Caption = 'Sim'
          TabOrder = 0
          Value = 'S'
        end
        object rbnMontagemNAO: TtecRadioButton
          Left = 67
          Top = 22
          Width = 54
          Height = 17
          Caption = 'N'#227'o'
          TabOrder = 1
          Value = 'N'
        end
      end
      object dtxEmEstoque: TtecDBText
        Left = 124
        Top = 66
        Width = 69
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'emestoque'
        DataSource = dtmTrocaMercadorias.dsrProdutoEstoque
        ReadOnly = True
        TabOrder = 16
        Alignment = taLeftJustify
      end
      object edtQtdeCopiar: TDBEditNumero
        Left = 498
        Top = 93
        Width = 69
        Height = 24
        MaxLength = -1
        TabOrder = 3
        Visible = False
        OnExit = edtQtdeCopiarExit
        Mascara = False
        Alignment = taLeftJustify
        TipoMascara = tmQUANTIDADE
        NrDecimal = 0
        Decimais = False
        Negativo = False
        Tamanho = 0
        DataField = 'qtdecopiar'
      end
      object dbgDepositos: TtecDBGrid
        Left = 572
        Top = 39
        Width = 138
        Height = 82
        TabStop = False
        Color = clBtnFace
        DataSource = dtmTrocaMercadorias.dsrEstoque
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Pitch = fpVariable
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 17
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
        DefaultRowHeight = 16
        ExibirNumerodaLinha = False
        NaoAtribuirDadosaTabelaaoDigitar = False
        ShowWhenFieldInvisible = False
        CanClickWhenEditing = False
        Columns = <
          item
            Expanded = False
            FieldName = 'filial'
            Title.Alignment = taCenter
            Title.Caption = 'Filial'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'emestoque'
            Title.Alignment = taCenter
            Title.Caption = 'Estoque'
            Width = 60
            Visible = True
          end>
      end
      object gbxSimilares: TGroupBox
        Left = 2
        Top = 234
        Width = 764
        Height = 162
        Align = alBottom
        Caption = 'Produtos Similares'
        TabOrder = 18
        object dbgSimilares: TtecDBGrid
          Left = 2
          Top = 15
          Width = 760
          Height = 145
          Align = alBottom
          DataSource = dtmTrocaMercadorias.dsrProdutosSimilares
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
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
          OnDblClick = dbgSimilaresDblClick
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
          DenySort = False
          DefaultRowHeight = 17
          ExibirNumerodaLinha = False
          NaoAtribuirDadosaTabelaaoDigitar = False
          ShowWhenFieldInvisible = False
          CanClickWhenEditing = False
          Columns = <
            item
              Expanded = False
              FieldName = 'codigo'
              Width = 109
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'descricao'
              Width = 160
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valorgrade1'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valorgrade2'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'filial'
              Width = 31
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'emestoque'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'reservado'
              Title.Caption = 'Reserv.'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valorproduto'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'similares'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'caracteristica'
              Title.Caption = 'Produto'
              Visible = True
            end>
        end
      end
      object rgbEntrega: TtecDBRadioGroup
        Left = 573
        Top = 177
        Width = 137
        Height = 50
        Caption = 'Entregar'
        TabOrder = 9
        TabStop = False
        DataField = 'entrega'
        DataSource = dtmTrocaMercadorias.dsrProdutosContratos
        object rbnEntregaSIM: TtecRadioButton
          Left = 9
          Top = 22
          Width = 50
          Height = 17
          Caption = 'Sim'
          TabOrder = 0
          Value = 'S'
        end
        object rbnEntregaNAO: TtecRadioButton
          Left = 67
          Top = 22
          Width = 54
          Height = 17
          Caption = 'N'#227'o'
          TabOrder = 1
          Value = 'N'
        end
      end
    end
  end
  object aclHabilitar: TActionList
    Left = 424
    Top = 8
    object actHabilitarControles: TAction
      OnUpdate = actHabilitarControlesUpdate
    end
  end
end
