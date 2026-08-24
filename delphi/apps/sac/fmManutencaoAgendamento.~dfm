inherited frmManutencaoAgendamento: TfrmManutencaoAgendamento
  Left = 402
  Top = 123
  Caption = 'Manuten'#231#227'o de Agendamento'
  ClientHeight = 638
  ClientWidth = 1009
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBarra: TPanel
    Left = 0
    Top = 45
    Width = 1009
    Align = alTop
    TabOrder = 2
    inline fraConsultaMarca: TfraConsultaCodigo
      Left = 678
      Top = 4
      Width = 107
      Height = 25
      HorzScrollBar.Range = 529
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
      TabOrder = 0
      inherited sbnProcura: TSpeedButton
        Left = 82
        Width = 24
      end
      inherited dtxDescricao: TtecDBText
        Width = 1
        DataField = 'descricao'
        DataSource = fraConsultaGrupo.dsrProcuraGrupoProdutos
      end
      inherited edfCodigo: TtecDBFindLookup
        Width = 81
        DataField = 'marca'
        DataSource = dtmManutencaoAgendamento.dsrMarcasAgendamentos
        MaxLength = 4
        OnKeyDown = fraConsultaMarcaedfCodigoKeyDown
        LookupField = 'codigo'
        LookupSource = fraConsultaMarca.dsrProcuraMarca
        LookupQueryParameter = 'codigo'
        Parameter = ' '
        ActiveSetControls = False
        DenyInsert = False
        NoSetControls = <>
        SetControls = <>
        LookupParameter = 'codigo'
      end
    end
    inline fraConsultaItemProduto: TfraConsultaCodigo
      Left = 438
      Top = 4
      Width = 139
      Height = 23
      HorzScrollBar.Range = 529
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
      TabOrder = 1
      inherited sbnProcura: TSpeedButton
        Left = 113
      end
      inherited dtxDescricao: TtecDBText
        Left = 160
        Width = 1
        DataField = 'descricaolc'
        DataSource = fraConsultaItemProduto.dsrProcuraItemProdutos
      end
      inherited edfCodigo: TtecDBFindLookup
        Width = 113
        DataaFieldInterno = 'produto'
        DataaFieldVisual = 'codigovisual'
        DataField = 'codigovisual'
        DataSource = dtmManutencaoAgendamento.dsrProdutosAgendamentos
        MaxLength = 30
        OnKeyDown = fraConsultaItemProdutoedfCodigoKeyDown
        LookupaFieldinterno = 'codigo'
        LookupaFieldVisual = 'codigovisual'
        LookupField = 'codigovisual'
        LookupSource = fraConsultaItemProduto.dsrProcuraItemProdutos
        LookupQueryParameter = 'produtovisual'
        Parameter = ' '
        ActiveSetControls = False
        DenyInsert = False
        NoSetControls = <>
        SetControls = <>
        LookupParameter = 'produtovisual'
      end
      inherited qryProcuraItemProdutos: TtecQuery
        ParamData = <
          item
            DataType = ftInteger
            Name = 'cliente'
            ParamType = ptUnknown
          end
          item
            DataType = ftString
            Name = 'tipocliente'
            ParamType = ptUnknown
          end
          item
            DataType = ftString
            Name = 'produtovisual'
            ParamType = ptUnknown
            Value = '1010800'
          end
          item
            DataType = ftUnknown
            Name = 'FilialBase'
            ParamType = ptUnknown
          end>
      end
    end
    inline fraConsultaGrupo: TfraConsultaCodigo
      Left = 328
      Top = 4
      Width = 106
      Height = 25
      HorzScrollBar.Range = 529
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
        Left = 82
        Width = 24
      end
      inherited dtxDescricao: TtecDBText
        Width = 1
        DataField = 'descricao'
        DataSource = fraConsultaGrupo.dsrProcuraGrupoProdutos
      end
      inherited edfCodigo: TtecDBFindLookup
        Width = 81
        DataField = 'grupo'
        DataSource = dtmManutencaoAgendamento.dsrGruposAgendamentos
        MaxLength = 4
        OnKeyDown = fraConsultaGrupoedfCodigoKeyDown
        LookupField = 'codigo'
        LookupSource = fraConsultaGrupo.dsrProcuraGrupoProdutos
        LookupQueryParameter = 'codigo'
        Parameter = ' '
        ActiveSetControls = False
        DenyInsert = False
        NoSetControls = <>
        SetControls = <>
        LookupParameter = 'codigo'
      end
    end
    inline fraConsultaClasse: TfraConsultaCodigo
      Left = 583
      Top = 4
      Width = 107
      Height = 25
      HorzScrollBar.Range = 529
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
      TabOrder = 3
      inherited sbnProcura: TSpeedButton
        Left = 82
        Width = 24
      end
      inherited dtxDescricao: TtecDBText
        Width = 1
        DataField = 'descricao'
        DataSource = fraConsultaGrupo.dsrProcuraGrupoProdutos
      end
      inherited edfCodigo: TtecDBFindLookup
        Width = 81
        DataField = 'classe'
        DataSource = dtmManutencaoAgendamento.dsrClassesAgendamentos
        MaxLength = 4
        OnKeyDown = fraConsultaClasseedfCodigoKeyDown
        LookupField = 'codigo'
        LookupSource = fraConsultaClasse.dsrProcuraClasses
        LookupQueryParameter = 'codigo'
        Parameter = ' '
        ActiveSetControls = False
        DenyInsert = False
        NoSetControls = <>
        SetControls = <>
        LookupParameter = 'codigo'
      end
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 1009
    inherited tblBarra: TToolBar
      Width = 1008
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
      object sbnAlterar: TSpeedButton
        Left = 84
        Top = 2
        Width = 75
        Height = 39
        Hint = 'Gravar altera'#231#245'es'
        Constraints.MinHeight = 39
        Caption = 'Gravar F5'
        Flat = True
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C3C3C3C3000000
          0000000000000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F0000
          00000000C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FC3C3C3FFFFFF000000000000
          0000000000000000007F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000
          00000000000000C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3
          C3C3FFFFFFFFFFFFC3C3C37F7F7FFFFFFFC3C3C37F7F7FFFFFFF000000000000
          0000000000000000007F7F7FBFBFBF000000000000BFBFBFBFBFBFBFBFBF0000
          00000000000000C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F
          7F7F7F7F7FFFFFFFC3C3C37F7F7FFFFFFFC3C3C37F7F7FFFFFFF000000000000
          0000000000000000007F7F7FBFBFBF000000000000BFBFBFBFBFBFBFBFBF0000
          00000000000000C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F
          7F7F7F7F7FFFFFFFFFFFFF7F7F7FFFFFFFC3C3C37F7F7FFFFFFF000000000000
          0000000000000000007F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000
          00000000000000C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C37F7F7FFFFFFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000C3C3C37F7F7FFFFFFFC3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000C3C3C37F7F7FFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF7F7F7FFFFFFF000000000000
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00000000000000C3C3C37F7F7FFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F7F7FFFFFFF000000000000
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00000000000000C3C3C37F7F7FFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F7F7FFFFFFF000000000000
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00000000000000C3C3C37F7F7FFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F7F7FFFFFFF000000000000
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00000000000000C3C3C37F7F7FFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F7F7FFFFFFF000000000000
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00000000000000C3C3C37F7F7FFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F7F7FFFFFFF000000000000
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          007F7F7F000000C3C3C37F7F7FFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FFFFFFF000000000000
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00000000000000C3C3C37F7F7FC3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFF7F7F7FC3C3C3C3C3C3000000
          0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          00000000C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3}
        Layout = blGlyphTop
        NumGlyphs = 2
        Spacing = 0
        OnClick = sbnAlterarClick
      end
      object sbnGerar: TSpeedButton
        Left = 159
        Top = 2
        Width = 75
        Height = 39
        Hint = 'Selecionar pre'#231'o(s)'
        Constraints.MinHeight = 39
        Caption = 'Gerar F6'
        Flat = True
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDC808080000000808080DCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A058
          5858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC80808000000080808000000000FFFF000000808080000000808080DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858A0A0A0585858FF
          FFFF585858A0A0A0585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC00000000FFFF80808000000000FFFF00000080808000FFFF000000DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCA0A0A0585858DC
          DCDC585858A0A0A0DCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC80808080808000FFFF00FFFF00FFFF00FFFF00FFFF808080808080DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0A0A0A0DCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCA0A0A0A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          80808000000000000000FFFF80808000000080808000FFFF0000000000008080
          80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858585858DCDCDCA0A0A058
          5858A0A0A0DCDCDC585858585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
          00000000FFFF00FFFF00FFFF000000DCDCDC00000000FFFF00FFFF00FFFF0000
          00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCDCDCDCDCDCDC585858DC
          DCDC585858FFFFFFDCDCDCDCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
          80808000000000000000FFFF80808000000080808000FFFF0000000000008080
          80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858585858DCDCDCA0A0A058
          5858A0A0A0DCDCDC585858585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC80808080808000FFFF00FFFF00FFFF00FFFF00FFFF808080808080DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0A0A0A0DCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCA0A0A0A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC00000000FFFF80808000000000FFFF00000080808000FFFF000000DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCA0A0A0585858DC
          DCDC585858A0A0A0DCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC80808000000080808000000000FFFF000000808080000000808080DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858A0A0A0585858FF
          FFFF585858A0A0A0585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDC808080000000808080DCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A058
          5858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
        Layout = blGlyphTop
        NumGlyphs = 2
        Spacing = 0
        OnClick = sbnGerarClick
      end
    end
  end
  object pgcManutencaoAgendamento: TPageControl
    Left = 0
    Top = 81
    Width = 1009
    Height = 557
    ActivePage = tstParametros
    Align = alClient
    TabOrder = 0
    object tstParametros: TTabSheet
      Caption = 'Par'#226'metros'
      inline fraMultiplaSelecaoAleatoria1: TfraMultiplaSelecaoAleatoria
        Left = 0
        Top = 57
        Width = 624
        Height = 472
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        inherited pgcMultiplaSelecaoAleatoria: TtecPageControl
          Width = 624
          Height = 472
          ActivePage = fraMultiplaSelecaoAleatoria1.tstItemdeProduto
          Font.Pitch = fpVariable
          inherited tstItemdeProduto: TTabSheet
            Font.Pitch = fpVariable
            inherited fraSelecaoAleatoriaItemdeProdutos: TfraSelecaoAleatoriaItemdeProdutos
              Width = 616
              Height = 442
              inherited fraSelecaoAleatoriaItemdeProduto: TfraSelecaoAleatoria
                Width = 616
                Height = 418
                inherited Splitter1: TSplitter
                  Height = 404
                end
                inherited dbgSelecaoAleatoria: TtecDBGrid
                  Height = 404
                end
                inherited pnlLabels: TPanel
                  Height = 404
                end
                inherited pnlAbaixo: TPanel
                  Top = 404
                  Width = 616
                  Font.Pitch = fpVariable
                  inherited lblOrientacao: TLabel
                    Font.Pitch = fpVariable
                  end
                  inherited pnlAbaixoDireita: TPanel
                    Left = 585
                    Font.Pitch = fpVariable
                  end
                end
              end
              inherited pnlParametros: TPanel
                Top = 418
                Width = 616
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
                    Left = 585
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
                    Left = 585
                    Font.Pitch = fpVariable
                  end
                end
              end
            end
          end
          inherited tstSelecaoAleatoriaClasseProduto: TTabSheet
            inherited fraSelecaoaleatoriaclassesprodutos: TfraSelecaoaleatoriaclassesprodutos
              Width = 616
              Height = 442
              inherited fraSelecaoAleatoriaClasseProduto: TfraSelecaoAleatoria
                Width = 616
                Height = 442
                inherited Splitter1: TSplitter
                  Height = 427
                end
                inherited dbgSelecaoAleatoria: TtecDBGrid
                  Height = 427
                end
                inherited pnlLabels: TPanel
                  Height = 427
                end
                inherited pnlAbaixo: TPanel
                  Top = 427
                  Width = 616
                  Font.Pitch = fpVariable
                  inherited lblOrientacao: TLabel
                    Font.Pitch = fpVariable
                  end
                  inherited pnlAbaixoDireita: TPanel
                    Left = 585
                    Font.Pitch = fpVariable
                  end
                end
              end
            end
          end
          inherited tstSelecaoAleatoriaMarcaProduto: TTabSheet
            inherited fraSelecaoAleatoriamarcasProdutos: TfraSelecaoAleatoriamarcasProdutos
              inherited fraSelecaoAleatoriamarcasProduto: TfraSelecaoAleatoria
                inherited pnlAbaixo: TPanel
                  Font.Pitch = fpVariable
                  inherited lblOrientacao: TLabel
                    Font.Pitch = fpVariable
                  end
                  inherited pnlAbaixoDireita: TPanel
                    Left = 585
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
                inherited pnlAbaixo: TPanel
                  Font.Pitch = fpVariable
                  inherited lblOrientacao: TLabel
                    Font.Pitch = fpVariable
                  end
                  inherited pnlAbaixoDireita: TPanel
                    Left = 585
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
              Width = 616
              Height = 442
              inherited fraSelecaoAleatoriamarketplace: TfraSelecaoAleatoria
                Width = 616
                Height = 442
                inherited Splitter1: TSplitter
                  Height = 427
                end
                inherited dbgSelecaoAleatoria: TtecDBGrid
                  Height = 427
                end
                inherited pnlLabels: TPanel
                  Height = 427
                end
                inherited pnlAbaixo: TPanel
                  Top = 427
                  Width = 616
                  Font.Pitch = fpVariable
                  inherited lblOrientacao: TLabel
                    Font.Pitch = fpVariable
                  end
                  inherited pnlAbaixoDireita: TPanel
                    Left = 585
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
      end
      object pnlTop: TPanel
        Left = 0
        Top = 0
        Width = 1001
        Height = 57
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object gbxSelecaoAgendamento: TGroupBox
          Left = 0
          Top = 0
          Width = 233
          Height = 57
          Align = alLeft
          Caption = 'Com Agendamento em:'
          TabOrder = 0
          object ckbProdutosComAgendamento: TCheckBox
            Left = 8
            Top = 20
            Width = 73
            Height = 17
            Caption = 'Produtos'
            Checked = True
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentColor = False
            ParentFont = False
            State = cbChecked
            TabOrder = 0
          end
          object ckbGruposComAgendamento: TCheckBox
            Left = 8
            Top = 36
            Width = 65
            Height = 17
            Caption = 'Grupos'
            Checked = True
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentColor = False
            ParentFont = False
            State = cbChecked
            TabOrder = 1
          end
          object ckbClassesComAgendamento: TCheckBox
            Left = 96
            Top = 20
            Width = 65
            Height = 17
            Caption = 'Classes'
            Checked = True
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentColor = False
            ParentFont = False
            State = cbChecked
            TabOrder = 2
          end
          object ckbMarcasComAgendamento: TCheckBox
            Left = 96
            Top = 36
            Width = 65
            Height = 17
            Caption = 'Marcas'
            Checked = True
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentColor = False
            ParentFont = False
            State = cbChecked
            TabOrder = 3
          end
        end
      end
    end
    object tstDados: TTabSheet
      Caption = 'Dados Selecionados'
      ImageIndex = 1
      object pgcDadosSelecionados: TPageControl
        Left = 0
        Top = 0
        Width = 1001
        Height = 514
        ActivePage = tstProdutos
        Align = alClient
        PopupMenu = AdvPopupMenu1
        TabOrder = 0
        object tstProdutos: TTabSheet
          Caption = 'Produtos'
          object dbgProdutosAgendamentos: TDBAdvGrid
            Left = 0
            Top = 0
            Width = 961
            Height = 486
            Cursor = crDefault
            Align = alLeft
            ColCount = 9
            RowCount = 2
            FixedRows = 1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
            ParentFont = False
            PopupMenu = AdvPopupMenu1
            ScrollBars = ssBoth
            TabOrder = 0
            OnKeyDown = dbgProdutosAgendamentosKeyDown
            OnKeyPress = dbgProdutosAgendamentosKeyPress
            OnCanAddRow = dbgProdutosAgendamentosCanAddRow
            OnCanInsertRow = dbgProdutosAgendamentosCanInsertRow
            OnCanSort = dbgProdutosAgendamentosCanSort
            OnCanClickCell = dbgProdutosAgendamentosCanClickCell
            OnCellValidate = dbgProdutosAgendamentosCellValidate
            ActiveCellShow = True
            ActiveCellFont.Charset = DEFAULT_CHARSET
            ActiveCellFont.Color = clWindowText
            ActiveCellFont.Height = -11
            ActiveCellFont.Name = 'Tahoma'
            ActiveCellFont.Style = [fsBold]
            ActiveCellColor = 12164479
            ColumnHeaders.Strings = (
              ''
              'Produto'
              'Descri'#231#227'o'
              'Grupo'
              'Origem'
              'Dias'
              'Observa'#231#245'es')
            ControlLook.FixedGradientHoverFrom = clGray
            ControlLook.FixedGradientHoverTo = clWhite
            ControlLook.FixedGradientDownFrom = clGray
            ControlLook.FixedGradientDownTo = clSilver
            ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
            ControlLook.DropDownHeader.Font.Color = clWindowText
            ControlLook.DropDownHeader.Font.Height = -11
            ControlLook.DropDownHeader.Font.Name = 'Tahoma'
            ControlLook.DropDownHeader.Font.Style = []
            ControlLook.DropDownHeader.Visible = True
            ControlLook.DropDownHeader.Buttons = <>
            ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
            ControlLook.DropDownFooter.Font.Color = clWindowText
            ControlLook.DropDownFooter.Font.Height = -11
            ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
            ControlLook.DropDownFooter.Font.Style = []
            ControlLook.DropDownFooter.Visible = True
            ControlLook.DropDownFooter.Buttons = <>
            Filter = <>
            FilterDropDown.Font.Charset = DEFAULT_CHARSET
            FilterDropDown.Font.Color = clWindowText
            FilterDropDown.Font.Height = -11
            FilterDropDown.Font.Name = 'MS Sans Serif'
            FilterDropDown.Font.Style = []
            FilterDropDownClear = '(All)'
            FixedColWidth = 20
            FixedRowHeight = 22
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clWindowText
            FixedFont.Height = -11
            FixedFont.Name = 'Tahoma'
            FixedFont.Style = [fsBold]
            FloatFormat = '%.2f'
            Navigation.AdvanceOnEnter = True
            Navigation.AdvanceAutoEdit = False
            Navigation.AppendOnArrowDown = True
            PrintSettings.DateFormat = 'dd/mm/yyyy'
            PrintSettings.Font.Charset = DEFAULT_CHARSET
            PrintSettings.Font.Color = clWindowText
            PrintSettings.Font.Height = -11
            PrintSettings.Font.Name = 'MS Sans Serif'
            PrintSettings.Font.Style = []
            PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
            PrintSettings.FixedFont.Color = clWindowText
            PrintSettings.FixedFont.Height = -11
            PrintSettings.FixedFont.Name = 'MS Sans Serif'
            PrintSettings.FixedFont.Style = []
            PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
            PrintSettings.HeaderFont.Color = clWindowText
            PrintSettings.HeaderFont.Height = -11
            PrintSettings.HeaderFont.Name = 'MS Sans Serif'
            PrintSettings.HeaderFont.Style = []
            PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
            PrintSettings.FooterFont.Color = clWindowText
            PrintSettings.FooterFont.Height = -11
            PrintSettings.FooterFont.Name = 'MS Sans Serif'
            PrintSettings.FooterFont.Style = []
            PrintSettings.PageNumSep = '/'
            SearchFooter.FindNextCaption = 'Find &next'
            SearchFooter.FindPrevCaption = 'Find &previous'
            SearchFooter.Font.Charset = DEFAULT_CHARSET
            SearchFooter.Font.Color = clWindowText
            SearchFooter.Font.Height = -11
            SearchFooter.Font.Name = 'MS Sans Serif'
            SearchFooter.Font.Style = []
            SearchFooter.HighLightCaption = 'Highlight'
            SearchFooter.HintClose = 'Close'
            SearchFooter.HintFindNext = 'Find next occurrence'
            SearchFooter.HintFindPrev = 'Find previous occurrence'
            SearchFooter.HintHighlight = 'Highlight occurrences'
            SearchFooter.MatchCaseCaption = 'Match case'
            SortSettings.Column = 1
            SortSettings.Show = True
            Version = '2.3.2.2'
            AutoCreateColumns = True
            AutoRemoveColumns = False
            Columns = <
              item
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Pitch = fpVariable
                Font.Style = []
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clWindowText
                HeaderFont.Height = -11
                HeaderFont.Name = 'MS Sans Serif'
                HeaderFont.Pitch = fpVariable
                HeaderFont.Style = []
                PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                PrintFont.Charset = DEFAULT_CHARSET
                PrintFont.Color = clWindowText
                PrintFont.Height = -11
                PrintFont.Name = 'MS Sans Serif'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                Width = 20
              end
              item
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                EditLength = 30
                EditLink = FormControlEditLinkProduto
                Editor = edCustom
                FieldName = 'codigovisual'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Produto'
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clWindowText
                HeaderFont.Height = -11
                HeaderFont.Name = 'MS Sans Serif'
                HeaderFont.Pitch = fpVariable
                HeaderFont.Style = []
                PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                PrintFont.Charset = DEFAULT_CHARSET
                PrintFont.Color = clWindowText
                PrintFont.Height = -11
                PrintFont.Name = 'MS Sans Serif'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                Width = 131
              end
              item
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                EditLength = 100
                FieldName = 'descricao'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Descri'#231#227'o'
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clWindowText
                HeaderFont.Height = -11
                HeaderFont.Name = 'MS Sans Serif'
                HeaderFont.Pitch = fpVariable
                HeaderFont.Style = []
                PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                PrintFont.Charset = DEFAULT_CHARSET
                PrintFont.Color = clWindowText
                PrintFont.Height = -11
                PrintFont.Name = 'MS Sans Serif'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                Width = 267
              end
              item
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                FieldName = 'grupo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Grupo'
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clWindowText
                HeaderFont.Height = -11
                HeaderFont.Name = 'Tahoma'
                HeaderFont.Pitch = fpVariable
                HeaderFont.Style = []
                PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                PrintFont.Charset = DEFAULT_CHARSET
                PrintFont.Color = clWindowText
                PrintFont.Height = -11
                PrintFont.Name = 'Tahoma'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
              end
              item
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                FieldName = 'classe'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Classe'
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clWindowText
                HeaderFont.Height = -11
                HeaderFont.Name = 'Tahoma'
                HeaderFont.Pitch = fpVariable
                HeaderFont.Style = []
                PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                PrintFont.Charset = DEFAULT_CHARSET
                PrintFont.Color = clWindowText
                PrintFont.Height = -11
                PrintFont.Name = 'Tahoma'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                Width = 64
              end
              item
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                FieldName = 'marca'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Marca'
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clWindowText
                HeaderFont.Height = -11
                HeaderFont.Name = 'Tahoma'
                HeaderFont.Pitch = fpVariable
                HeaderFont.Style = []
                PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                PrintFont.Charset = DEFAULT_CHARSET
                PrintFont.Color = clWindowText
                PrintFont.Height = -11
                PrintFont.Name = 'Tahoma'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                Width = 95
              end
              item
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                EditLength = 10
                FieldName = 'origem'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Origem'
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clWindowText
                HeaderFont.Height = -11
                HeaderFont.Name = 'MS Sans Serif'
                HeaderFont.Pitch = fpVariable
                HeaderFont.Style = []
                PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                PrintFont.Charset = DEFAULT_CHARSET
                PrintFont.Color = clWindowText
                PrintFont.Height = -11
                PrintFont.Name = 'MS Sans Serif'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                Width = 77
              end
              item
                Alignment = taRightJustify
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                FieldName = 'dias'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Dias'
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clWindowText
                HeaderFont.Height = -11
                HeaderFont.Name = 'MS Sans Serif'
                HeaderFont.Pitch = fpVariable
                HeaderFont.Style = []
                PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                PrintFont.Charset = DEFAULT_CHARSET
                PrintFont.Color = clWindowText
                PrintFont.Height = -11
                PrintFont.Name = 'MS Sans Serif'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                Width = 28
              end
              item
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                EditLength = 200
                FieldName = 'observacoes'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Observa'#231#245'es'
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clWindowText
                HeaderFont.Height = -11
                HeaderFont.Name = 'MS Sans Serif'
                HeaderFont.Pitch = fpVariable
                HeaderFont.Style = []
                PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                PrintFont.Charset = DEFAULT_CHARSET
                PrintFont.Color = clWindowText
                PrintFont.Height = -11
                PrintFont.Name = 'MS Sans Serif'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                Width = 204
              end>
            DataSource = dtmManutencaoAgendamento.dsrProdutosAgendamentos
            EditPostMode = epRow
            InvalidPicture.Data = {
              055449636F6E0000010001002020040000000000E80200001600000028000000
              2000000040000000010004000000000000020000000000000000000000000000
              0000000000000000000080000080000000808000800000008000800080800000
              80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
              FFFFFF000000000000777777777777000000000000000000777788FFFF887777
              000000000000007778F8887117788F877700000000000778F87111111111178F
              877000000000778871111111111999178877000000077F811111111111199999
              18F7700000778811111111111119999991887700007881111111111111119199
              99188700077F711111811111111198719997F7700788111118FF111111118FF7
              1991887077F71111888FF1111118FFFF19997F77778111118888FF1111888FF8
              911918777881111118888FF1188888811111188778811111118888FF88888811
              111117877F7111111118888888888111111117F77F7999111111888888881111
              111111F77F7999991111788888F71111111111F77F7999999917888888FF7111
              111117F778879999917FFF88888FF111111117877887999997FFFFF88888FF11
              11111887778799997FFFFFF798888FF11111187777F87997FFFFFF71178F88FF
              71117F7707887997FFFFF7999978F88871118870077F87997FFF799999978F87
              1117F77000788879978799999999787111188700007788879999999999999999
              1188770000077F88799999999999999778F77000000077888879999999999778
              8877000000000778F88877799777788F877000000000007778F8888878888F87
              7700000000000000777788FFFF88777700000000000000000077777777777700
              00000000FFC003FFFF0000FFFC00003FF800001FF000000FE0000007C0000003
              C000000380000001800000010000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000080000001
              80000001C0000003C0000003E0000007F000000FF800001FFC00003FFF0000FF
              FFC003FF}
            ShowUnicode = False
            PostOnEnter = False
            OnCheckRequiredFields = dbgProdutosAgendamentosCheckRequiredFields
            ColWidths = (
              20
              131
              267
              50
              64
              95
              77
              28
              204)
          end
          object pnlProdutosAgendamentos: TPanel
            Left = 961
            Top = 0
            Width = 28
            Height = 486
            Align = alLeft
            TabOrder = 1
            object sbnIncluirProduto: TSpeedButton
              Left = 3
              Top = 17
              Width = 22
              Height = 22
              Hint = 'Incluir Produto'
              Flat = True
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
              NumGlyphs = 2
              OnClick = sbnIncluirProdutoClick
            end
            object sbnExcluirProduto: TSpeedButton
              Left = 3
              Top = 39
              Width = 23
              Height = 22
              Hint = 'Excluir Agendamento do Produto'
              Flat = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                A0A0A00000FF0000FF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDC0000FFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFFF
                FFFFDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFF808080DCDCDCDCDCDCDCDCDC
                0000FF0000FF0000FF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DC0000000000FFDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7FFF
                FFFFDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF808080DCDCDCDCDCDCDCDCDCDCDCDC
                0000FF0000FF0000FF0000FF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC0000
                000000FF808080DCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7FFF
                FFFFFFFFFFDCDCDCDCDCDCFFFFFF808080808080DCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC0000FF0000FF0000FF0000FF000000DCDCDCDCDCDCDCDCDC0000000000
                FF808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F
                7F7FFFFFFFDCDCDCFFFFFF808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDC0000FF0000FF0000FF000000DCDCDCDCDCDC0000000000FF0000
                FF808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F
                7F7FFFFFFFFFFFFF808080808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDC0000FF0000FF0000FF0000000000000000FF0000FF8080
                80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F
                7F7F7F7F7F808080808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDC0000FF0000FF0000FF0000FF0000FF808080DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F80
                80807F7F7F808080808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDC0000000000FF0000FF0000FF0000FFDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F
                7F7F7F7F7F7F7F7F808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDC0000000000000000FF0000FF0000FF000000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFF8080808080807F
                7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC0000000000FF0000FF0000FF0000FF0000FF0000FF000000DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFF80808080808080808080
                80807F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC0000FF
                0000FF0000FF0000FF0000FF0000FF808080DCDCDC7F7F7F0000FF000000DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF808080808080808080808080808080DC
                DCDCDCDCDC7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDC0000FF
                0000FF0000FF0000FF0000FF808080DCDCDCDCDCDCDCDCDC8080800000FF0000
                00DCDCDCDCDCDCDCDCDCDCDCDC808080808080808080808080808080DCDCDCDC
                DCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCA0A0A0
                0000FF0000FF808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC0000
                FF0000FF000000DCDCDCDCDCDC808080808080808080808080DCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
              NumGlyphs = 2
              OnClick = sbnExcluirProdutoClick
            end
          end
        end
        object tstGrupos: TTabSheet
          Caption = 'Grupos'
          ImageIndex = 1
          object dbgGruposAgendamentos: TDBAdvGrid
            Left = 0
            Top = 0
            Width = 912
            Height = 522
            Cursor = crDefault
            Align = alLeft
            ColCount = 5
            RowCount = 2
            FixedRows = 1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goEditing]
            ParentFont = False
            PopupMenu = AdvPopupMenu1
            ScrollBars = ssBoth
            TabOrder = 0
            OnKeyDown = dbgGruposAgendamentosKeyDown
            OnCanAddRow = dbgGruposAgendamentosCanAddRow
            OnCanInsertRow = dbgGruposAgendamentosCanInsertRow
            OnCanSort = dbgGruposAgendamentosCanSort
            OnCanClickCell = dbgGruposAgendamentosCanClickCell
            OnCellValidate = dbgGruposAgendamentosCellValidate
            ActiveCellShow = True
            ActiveCellFont.Charset = DEFAULT_CHARSET
            ActiveCellFont.Color = clWindowText
            ActiveCellFont.Height = -11
            ActiveCellFont.Name = 'Tahoma'
            ActiveCellFont.Style = [fsBold]
            ActiveCellColor = 12164479
            ColumnHeaders.Strings = (
              ''
              'Grupo'
              'Descri'#231#227'o'
              'Dias'
              'Observa'#231#245'es')
            ControlLook.FixedGradientHoverFrom = clGray
            ControlLook.FixedGradientHoverTo = clWhite
            ControlLook.FixedGradientDownFrom = clGray
            ControlLook.FixedGradientDownTo = clSilver
            ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
            ControlLook.DropDownHeader.Font.Color = clWindowText
            ControlLook.DropDownHeader.Font.Height = -11
            ControlLook.DropDownHeader.Font.Name = 'Tahoma'
            ControlLook.DropDownHeader.Font.Style = []
            ControlLook.DropDownHeader.Visible = True
            ControlLook.DropDownHeader.Buttons = <>
            ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
            ControlLook.DropDownFooter.Font.Color = clWindowText
            ControlLook.DropDownFooter.Font.Height = -11
            ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
            ControlLook.DropDownFooter.Font.Style = []
            ControlLook.DropDownFooter.Visible = True
            ControlLook.DropDownFooter.Buttons = <>
            Filter = <>
            FilterDropDown.Font.Charset = DEFAULT_CHARSET
            FilterDropDown.Font.Color = clWindowText
            FilterDropDown.Font.Height = -11
            FilterDropDown.Font.Name = 'MS Sans Serif'
            FilterDropDown.Font.Style = []
            FilterDropDownClear = '(All)'
            FixedColWidth = 20
            FixedRowHeight = 22
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clWindowText
            FixedFont.Height = -11
            FixedFont.Name = 'Tahoma'
            FixedFont.Style = [fsBold]
            FloatFormat = '%.2f'
            Navigation.AdvanceOnEnter = True
            Navigation.AdvanceAutoEdit = False
            Navigation.AppendOnArrowDown = True
            PrintSettings.DateFormat = 'dd/mm/yyyy'
            PrintSettings.Font.Charset = DEFAULT_CHARSET
            PrintSettings.Font.Color = clWindowText
            PrintSettings.Font.Height = -11
            PrintSettings.Font.Name = 'MS Sans Serif'
            PrintSettings.Font.Style = []
            PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
            PrintSettings.FixedFont.Color = clWindowText
            PrintSettings.FixedFont.Height = -11
            PrintSettings.FixedFont.Name = 'MS Sans Serif'
            PrintSettings.FixedFont.Style = []
            PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
            PrintSettings.HeaderFont.Color = clWindowText
            PrintSettings.HeaderFont.Height = -11
            PrintSettings.HeaderFont.Name = 'MS Sans Serif'
            PrintSettings.HeaderFont.Style = []
            PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
            PrintSettings.FooterFont.Color = clWindowText
            PrintSettings.FooterFont.Height = -11
            PrintSettings.FooterFont.Name = 'MS Sans Serif'
            PrintSettings.FooterFont.Style = []
            PrintSettings.PageNumSep = '/'
            SearchFooter.FindNextCaption = 'Find &next'
            SearchFooter.FindPrevCaption = 'Find &previous'
            SearchFooter.Font.Charset = DEFAULT_CHARSET
            SearchFooter.Font.Color = clWindowText
            SearchFooter.Font.Height = -11
            SearchFooter.Font.Name = 'MS Sans Serif'
            SearchFooter.Font.Style = []
            SearchFooter.HighLightCaption = 'Highlight'
            SearchFooter.HintClose = 'Close'
            SearchFooter.HintFindNext = 'Find next occurrence'
            SearchFooter.HintFindPrev = 'Find previous occurrence'
            SearchFooter.HintHighlight = 'Highlight occurrences'
            SearchFooter.MatchCaseCaption = 'Match case'
            SortSettings.Show = True
            Version = '2.3.2.2'
            AutoCreateColumns = True
            AutoRemoveColumns = False
            Columns = <
              item
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Pitch = fpVariable
                Font.Style = []
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clWindowText
                HeaderFont.Height = -11
                HeaderFont.Name = 'MS Sans Serif'
                HeaderFont.Pitch = fpVariable
                HeaderFont.Style = []
                PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                PrintFont.Charset = DEFAULT_CHARSET
                PrintFont.Color = clWindowText
                PrintFont.Height = -11
                PrintFont.Name = 'MS Sans Serif'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                Width = 20
              end
              item
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                EditLength = 30
                EditLink = FormControlEditLinkGrupo
                Editor = edCustom
                FieldName = 'grupo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Grupo'
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clWindowText
                HeaderFont.Height = -11
                HeaderFont.Name = 'MS Sans Serif'
                HeaderFont.Pitch = fpVariable
                HeaderFont.Style = []
                PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                PrintFont.Charset = DEFAULT_CHARSET
                PrintFont.Color = clWindowText
                PrintFont.Height = -11
                PrintFont.Name = 'MS Sans Serif'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                Width = 112
              end
              item
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                EditLength = 100
                FieldName = 'descricao'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Descri'#231#227'o'
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clWindowText
                HeaderFont.Height = -11
                HeaderFont.Name = 'MS Sans Serif'
                HeaderFont.Pitch = fpVariable
                HeaderFont.Style = []
                PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                PrintFont.Charset = DEFAULT_CHARSET
                PrintFont.Color = clWindowText
                PrintFont.Height = -11
                PrintFont.Name = 'MS Sans Serif'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                Width = 310
              end
              item
                Alignment = taRightJustify
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                FieldName = 'dias'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Dias'
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clWindowText
                HeaderFont.Height = -11
                HeaderFont.Name = 'MS Sans Serif'
                HeaderFont.Pitch = fpVariable
                HeaderFont.Style = []
                PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                PrintFont.Charset = DEFAULT_CHARSET
                PrintFont.Color = clWindowText
                PrintFont.Height = -11
                PrintFont.Name = 'MS Sans Serif'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                Width = 43
              end
              item
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                EditLength = 200
                FieldName = 'observacoes'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Observa'#231#245'es'
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clWindowText
                HeaderFont.Height = -11
                HeaderFont.Name = 'MS Sans Serif'
                HeaderFont.Pitch = fpVariable
                HeaderFont.Style = []
                PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                PrintFont.Charset = DEFAULT_CHARSET
                PrintFont.Color = clWindowText
                PrintFont.Height = -11
                PrintFont.Name = 'MS Sans Serif'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                Width = 373
              end>
            DataSource = dtmManutencaoAgendamento.dsrGruposAgendamentos
            EditPostMode = epRow
            InvalidPicture.Data = {
              055449636F6E0000010001002020040000000000E80200001600000028000000
              2000000040000000010004000000000000020000000000000000000000000000
              0000000000000000000080000080000000808000800000008000800080800000
              80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
              FFFFFF000000000000777777777777000000000000000000777788FFFF887777
              000000000000007778F8887117788F877700000000000778F87111111111178F
              877000000000778871111111111999178877000000077F811111111111199999
              18F7700000778811111111111119999991887700007881111111111111119199
              99188700077F711111811111111198719997F7700788111118FF111111118FF7
              1991887077F71111888FF1111118FFFF19997F77778111118888FF1111888FF8
              911918777881111118888FF1188888811111188778811111118888FF88888811
              111117877F7111111118888888888111111117F77F7999111111888888881111
              111111F77F7999991111788888F71111111111F77F7999999917888888FF7111
              111117F778879999917FFF88888FF111111117877887999997FFFFF88888FF11
              11111887778799997FFFFFF798888FF11111187777F87997FFFFFF71178F88FF
              71117F7707887997FFFFF7999978F88871118870077F87997FFF799999978F87
              1117F77000788879978799999999787111188700007788879999999999999999
              1188770000077F88799999999999999778F77000000077888879999999999778
              8877000000000778F88877799777788F877000000000007778F8888878888F87
              7700000000000000777788FFFF88777700000000000000000077777777777700
              00000000FFC003FFFF0000FFFC00003FF800001FF000000FE0000007C0000003
              C000000380000001800000010000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000080000001
              80000001C0000003C0000003E0000007F000000FF800001FFC00003FFF0000FF
              FFC003FF}
            ShowUnicode = False
            PostOnEnter = False
            OnCheckRequiredFields = dbgGruposAgendamentosCheckRequiredFields
            ColWidths = (
              20
              112
              310
              43
              373)
          end
          object pnlGuposAgendamentos: TPanel
            Left = 912
            Top = 0
            Width = 28
            Height = 522
            Align = alLeft
            TabOrder = 1
            object sbnIncluirGruposAgendamentos: TSpeedButton
              Left = 8
              Top = 17
              Width = 17
              Height = 22
              Hint = 'Incluir agendamento do grupo'
              Flat = True
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
              NumGlyphs = 2
              OnClick = sbnIncluirGruposAgendamentosClick
            end
            object sbnExcluirGruposAgendamentos: TSpeedButton
              Left = 8
              Top = 39
              Width = 15
              Height = 22
              Hint = 'Excluir Agendamento do Grupo'
              Flat = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                A0A0A00000FF0000FF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDC0000FFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFFF
                FFFFDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFF808080DCDCDCDCDCDCDCDCDC
                0000FF0000FF0000FF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DC0000000000FFDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7FFF
                FFFFDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF808080DCDCDCDCDCDCDCDCDCDCDCDC
                0000FF0000FF0000FF0000FF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC0000
                000000FF808080DCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7FFF
                FFFFFFFFFFDCDCDCDCDCDCFFFFFF808080808080DCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC0000FF0000FF0000FF0000FF000000DCDCDCDCDCDCDCDCDC0000000000
                FF808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F
                7F7FFFFFFFDCDCDCFFFFFF808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDC0000FF0000FF0000FF000000DCDCDCDCDCDC0000000000FF0000
                FF808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F
                7F7FFFFFFFFFFFFF808080808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDC0000FF0000FF0000FF0000000000000000FF0000FF8080
                80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F
                7F7F7F7F7F808080808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDC0000FF0000FF0000FF0000FF0000FF808080DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F80
                80807F7F7F808080808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDC0000000000FF0000FF0000FF0000FFDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F
                7F7F7F7F7F7F7F7F808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDC0000000000000000FF0000FF0000FF000000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFF8080808080807F
                7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC0000000000FF0000FF0000FF0000FF0000FF0000FF000000DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFF80808080808080808080
                80807F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC0000FF
                0000FF0000FF0000FF0000FF0000FF808080DCDCDC7F7F7F0000FF000000DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF808080808080808080808080808080DC
                DCDCDCDCDC7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDC0000FF
                0000FF0000FF0000FF0000FF808080DCDCDCDCDCDCDCDCDC8080800000FF0000
                00DCDCDCDCDCDCDCDCDCDCDCDC808080808080808080808080808080DCDCDCDC
                DCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCA0A0A0
                0000FF0000FF808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC0000
                FF0000FF000000DCDCDCDCDCDC808080808080808080808080DCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
              NumGlyphs = 2
              OnClick = sbnExcluirGruposAgendamentosClick
            end
          end
        end
        object tstClasses: TTabSheet
          Caption = 'Classes'
          ImageIndex = 2
          object dbgClassesAgendamentos: TDBAdvGrid
            Left = 0
            Top = 0
            Width = 912
            Height = 522
            Cursor = crDefault
            Align = alLeft
            ColCount = 5
            RowCount = 2
            FixedRows = 1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goEditing]
            ParentFont = False
            PopupMenu = AdvPopupMenu1
            ScrollBars = ssBoth
            TabOrder = 0
            OnKeyDown = dbgClassesAgendamentosKeyDown
            OnCanAddRow = dbgClassesAgendamentosCanAddRow
            OnCanInsertRow = dbgClassesAgendamentosCanInsertRow
            OnCanSort = dbgClassesAgendamentosCanSort
            OnCanClickCell = dbgClassesAgendamentosCanClickCell
            OnCellValidate = dbgClassesAgendamentosCellValidate
            ActiveCellShow = True
            ActiveCellFont.Charset = DEFAULT_CHARSET
            ActiveCellFont.Color = clWindowText
            ActiveCellFont.Height = -11
            ActiveCellFont.Name = 'Tahoma'
            ActiveCellFont.Style = [fsBold]
            ActiveCellColor = 12164479
            ColumnHeaders.Strings = (
              ''
              'Grupo'
              'Descri'#231#227'o'
              'Dias'
              'Observa'#231#245'es')
            ControlLook.FixedGradientHoverFrom = clGray
            ControlLook.FixedGradientHoverTo = clWhite
            ControlLook.FixedGradientDownFrom = clGray
            ControlLook.FixedGradientDownTo = clSilver
            ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
            ControlLook.DropDownHeader.Font.Color = clWindowText
            ControlLook.DropDownHeader.Font.Height = -11
            ControlLook.DropDownHeader.Font.Name = 'Tahoma'
            ControlLook.DropDownHeader.Font.Style = []
            ControlLook.DropDownHeader.Visible = True
            ControlLook.DropDownHeader.Buttons = <>
            ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
            ControlLook.DropDownFooter.Font.Color = clWindowText
            ControlLook.DropDownFooter.Font.Height = -11
            ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
            ControlLook.DropDownFooter.Font.Style = []
            ControlLook.DropDownFooter.Visible = True
            ControlLook.DropDownFooter.Buttons = <>
            Filter = <>
            FilterDropDown.Font.Charset = DEFAULT_CHARSET
            FilterDropDown.Font.Color = clWindowText
            FilterDropDown.Font.Height = -11
            FilterDropDown.Font.Name = 'MS Sans Serif'
            FilterDropDown.Font.Style = []
            FilterDropDownClear = '(All)'
            FixedColWidth = 20
            FixedRowHeight = 22
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clWindowText
            FixedFont.Height = -11
            FixedFont.Name = 'Tahoma'
            FixedFont.Style = [fsBold]
            FloatFormat = '%.2f'
            Navigation.AdvanceOnEnter = True
            Navigation.AdvanceAutoEdit = False
            Navigation.AppendOnArrowDown = True
            PrintSettings.DateFormat = 'dd/mm/yyyy'
            PrintSettings.Font.Charset = DEFAULT_CHARSET
            PrintSettings.Font.Color = clWindowText
            PrintSettings.Font.Height = -11
            PrintSettings.Font.Name = 'MS Sans Serif'
            PrintSettings.Font.Style = []
            PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
            PrintSettings.FixedFont.Color = clWindowText
            PrintSettings.FixedFont.Height = -11
            PrintSettings.FixedFont.Name = 'MS Sans Serif'
            PrintSettings.FixedFont.Style = []
            PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
            PrintSettings.HeaderFont.Color = clWindowText
            PrintSettings.HeaderFont.Height = -11
            PrintSettings.HeaderFont.Name = 'MS Sans Serif'
            PrintSettings.HeaderFont.Style = []
            PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
            PrintSettings.FooterFont.Color = clWindowText
            PrintSettings.FooterFont.Height = -11
            PrintSettings.FooterFont.Name = 'MS Sans Serif'
            PrintSettings.FooterFont.Style = []
            PrintSettings.PageNumSep = '/'
            SearchFooter.FindNextCaption = 'Find &next'
            SearchFooter.FindPrevCaption = 'Find &previous'
            SearchFooter.Font.Charset = DEFAULT_CHARSET
            SearchFooter.Font.Color = clWindowText
            SearchFooter.Font.Height = -11
            SearchFooter.Font.Name = 'MS Sans Serif'
            SearchFooter.Font.Style = []
            SearchFooter.HighLightCaption = 'Highlight'
            SearchFooter.HintClose = 'Close'
            SearchFooter.HintFindNext = 'Find next occurrence'
            SearchFooter.HintFindPrev = 'Find previous occurrence'
            SearchFooter.HintHighlight = 'Highlight occurrences'
            SearchFooter.MatchCaseCaption = 'Match case'
            SortSettings.Show = True
            Version = '2.3.2.2'
            AutoCreateColumns = True
            AutoRemoveColumns = False
            Columns = <
              item
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Pitch = fpVariable
                Font.Style = []
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clWindowText
                HeaderFont.Height = -11
                HeaderFont.Name = 'MS Sans Serif'
                HeaderFont.Pitch = fpVariable
                HeaderFont.Style = []
                PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                PrintFont.Charset = DEFAULT_CHARSET
                PrintFont.Color = clWindowText
                PrintFont.Height = -11
                PrintFont.Name = 'MS Sans Serif'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                Width = 20
              end
              item
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                EditLength = 30
                EditLink = FormControlEditLinkClasse
                Editor = edCustom
                FieldName = 'classe'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Classe'
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clWindowText
                HeaderFont.Height = -11
                HeaderFont.Name = 'MS Sans Serif'
                HeaderFont.Pitch = fpVariable
                HeaderFont.Style = []
                PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                PrintFont.Charset = DEFAULT_CHARSET
                PrintFont.Color = clWindowText
                PrintFont.Height = -11
                PrintFont.Name = 'MS Sans Serif'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                Width = 112
              end
              item
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                EditLength = 100
                FieldName = 'descricao'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Descri'#231#227'o'
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clWindowText
                HeaderFont.Height = -11
                HeaderFont.Name = 'MS Sans Serif'
                HeaderFont.Pitch = fpVariable
                HeaderFont.Style = []
                PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                PrintFont.Charset = DEFAULT_CHARSET
                PrintFont.Color = clWindowText
                PrintFont.Height = -11
                PrintFont.Name = 'MS Sans Serif'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                Width = 310
              end
              item
                Alignment = taRightJustify
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                FieldName = 'dias'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Dias'
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clWindowText
                HeaderFont.Height = -11
                HeaderFont.Name = 'MS Sans Serif'
                HeaderFont.Pitch = fpVariable
                HeaderFont.Style = []
                PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                PrintFont.Charset = DEFAULT_CHARSET
                PrintFont.Color = clWindowText
                PrintFont.Height = -11
                PrintFont.Name = 'MS Sans Serif'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                Width = 43
              end
              item
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                EditLength = 200
                FieldName = 'observacoes'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Observa'#231#245'es'
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clWindowText
                HeaderFont.Height = -11
                HeaderFont.Name = 'MS Sans Serif'
                HeaderFont.Pitch = fpVariable
                HeaderFont.Style = []
                PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                PrintFont.Charset = DEFAULT_CHARSET
                PrintFont.Color = clWindowText
                PrintFont.Height = -11
                PrintFont.Name = 'MS Sans Serif'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                Width = 373
              end>
            DataSource = dtmManutencaoAgendamento.dsrClassesAgendamentos
            EditPostMode = epRow
            InvalidPicture.Data = {
              055449636F6E0000010001002020040000000000E80200001600000028000000
              2000000040000000010004000000000000020000000000000000000000000000
              0000000000000000000080000080000000808000800000008000800080800000
              80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
              FFFFFF000000000000777777777777000000000000000000777788FFFF887777
              000000000000007778F8887117788F877700000000000778F87111111111178F
              877000000000778871111111111999178877000000077F811111111111199999
              18F7700000778811111111111119999991887700007881111111111111119199
              99188700077F711111811111111198719997F7700788111118FF111111118FF7
              1991887077F71111888FF1111118FFFF19997F77778111118888FF1111888FF8
              911918777881111118888FF1188888811111188778811111118888FF88888811
              111117877F7111111118888888888111111117F77F7999111111888888881111
              111111F77F7999991111788888F71111111111F77F7999999917888888FF7111
              111117F778879999917FFF88888FF111111117877887999997FFFFF88888FF11
              11111887778799997FFFFFF798888FF11111187777F87997FFFFFF71178F88FF
              71117F7707887997FFFFF7999978F88871118870077F87997FFF799999978F87
              1117F77000788879978799999999787111188700007788879999999999999999
              1188770000077F88799999999999999778F77000000077888879999999999778
              8877000000000778F88877799777788F877000000000007778F8888878888F87
              7700000000000000777788FFFF88777700000000000000000077777777777700
              00000000FFC003FFFF0000FFFC00003FF800001FF000000FE0000007C0000003
              C000000380000001800000010000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000080000001
              80000001C0000003C0000003E0000007F000000FF800001FFC00003FFF0000FF
              FFC003FF}
            ShowUnicode = False
            PostOnEnter = False
            OnCheckRequiredFields = dbgClassesAgendamentosCheckRequiredFields
            ColWidths = (
              20
              112
              310
              43
              373)
          end
          object pnlClassesAgendamentos: TPanel
            Left = 912
            Top = 0
            Width = 28
            Height = 522
            Align = alLeft
            TabOrder = 1
            object sbnIncluirClassesAgendamentos: TSpeedButton
              Left = 3
              Top = 17
              Width = 22
              Height = 22
              Hint = 'Incluir agendamento da classe'
              Flat = True
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
              NumGlyphs = 2
              OnClick = sbnIncluirClassesAgendamentosClick
            end
            object sbnExcluirClassesAgendamentos: TSpeedButton
              Left = 8
              Top = 39
              Width = 15
              Height = 22
              Hint = 'Excluir Agendamento da Classe'
              Flat = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                A0A0A00000FF0000FF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDC0000FFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFFF
                FFFFDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFF808080DCDCDCDCDCDCDCDCDC
                0000FF0000FF0000FF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DC0000000000FFDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7FFF
                FFFFDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF808080DCDCDCDCDCDCDCDCDCDCDCDC
                0000FF0000FF0000FF0000FF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC0000
                000000FF808080DCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7FFF
                FFFFFFFFFFDCDCDCDCDCDCFFFFFF808080808080DCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC0000FF0000FF0000FF0000FF000000DCDCDCDCDCDCDCDCDC0000000000
                FF808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F
                7F7FFFFFFFDCDCDCFFFFFF808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDC0000FF0000FF0000FF000000DCDCDCDCDCDC0000000000FF0000
                FF808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F
                7F7FFFFFFFFFFFFF808080808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDC0000FF0000FF0000FF0000000000000000FF0000FF8080
                80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F
                7F7F7F7F7F808080808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDC0000FF0000FF0000FF0000FF0000FF808080DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F80
                80807F7F7F808080808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDC0000000000FF0000FF0000FF0000FFDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F
                7F7F7F7F7F7F7F7F808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDC0000000000000000FF0000FF0000FF000000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFF8080808080807F
                7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC0000000000FF0000FF0000FF0000FF0000FF0000FF000000DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFF80808080808080808080
                80807F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC0000FF
                0000FF0000FF0000FF0000FF0000FF808080DCDCDC7F7F7F0000FF000000DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF808080808080808080808080808080DC
                DCDCDCDCDC7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDC0000FF
                0000FF0000FF0000FF0000FF808080DCDCDCDCDCDCDCDCDC8080800000FF0000
                00DCDCDCDCDCDCDCDCDCDCDCDC808080808080808080808080808080DCDCDCDC
                DCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCA0A0A0
                0000FF0000FF808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC0000
                FF0000FF000000DCDCDCDCDCDC808080808080808080808080DCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
              NumGlyphs = 2
              OnClick = sbnExcluirClassesAgendamentosClick
            end
          end
        end
        object tstMarcas: TTabSheet
          Caption = 'Marcas'
          ImageIndex = 3
          object dbgMarcasAgendamentos: TDBAdvGrid
            Left = 0
            Top = 0
            Width = 912
            Height = 522
            Cursor = crDefault
            Align = alLeft
            ColCount = 5
            RowCount = 2
            FixedRows = 1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goEditing]
            ParentFont = False
            PopupMenu = AdvPopupMenu1
            ScrollBars = ssBoth
            TabOrder = 0
            OnKeyDown = dbgMarcasAgendamentosKeyDown
            OnCanAddRow = dbgMarcasAgendamentosCanAddRow
            OnCanInsertRow = dbgMarcasAgendamentosCanInsertRow
            OnCanSort = dbgMarcasAgendamentosCanSort
            OnCanClickCell = dbgMarcasAgendamentosCanClickCell
            OnCellValidate = dbgMarcasAgendamentosCellValidate
            ActiveCellShow = True
            ActiveCellFont.Charset = DEFAULT_CHARSET
            ActiveCellFont.Color = clWindowText
            ActiveCellFont.Height = -11
            ActiveCellFont.Name = 'Tahoma'
            ActiveCellFont.Style = [fsBold]
            ActiveCellColor = 12164479
            ColumnHeaders.Strings = (
              ''
              'Grupo'
              'Descri'#231#227'o'
              'Dias'
              'Observa'#231#245'es')
            ControlLook.FixedGradientHoverFrom = clGray
            ControlLook.FixedGradientHoverTo = clWhite
            ControlLook.FixedGradientDownFrom = clGray
            ControlLook.FixedGradientDownTo = clSilver
            ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
            ControlLook.DropDownHeader.Font.Color = clWindowText
            ControlLook.DropDownHeader.Font.Height = -11
            ControlLook.DropDownHeader.Font.Name = 'Tahoma'
            ControlLook.DropDownHeader.Font.Style = []
            ControlLook.DropDownHeader.Visible = True
            ControlLook.DropDownHeader.Buttons = <>
            ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
            ControlLook.DropDownFooter.Font.Color = clWindowText
            ControlLook.DropDownFooter.Font.Height = -11
            ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
            ControlLook.DropDownFooter.Font.Style = []
            ControlLook.DropDownFooter.Visible = True
            ControlLook.DropDownFooter.Buttons = <>
            Filter = <>
            FilterDropDown.Font.Charset = DEFAULT_CHARSET
            FilterDropDown.Font.Color = clWindowText
            FilterDropDown.Font.Height = -11
            FilterDropDown.Font.Name = 'MS Sans Serif'
            FilterDropDown.Font.Style = []
            FilterDropDownClear = '(All)'
            FixedColWidth = 20
            FixedRowHeight = 22
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clWindowText
            FixedFont.Height = -11
            FixedFont.Name = 'Tahoma'
            FixedFont.Style = [fsBold]
            FloatFormat = '%.2f'
            Navigation.AdvanceOnEnter = True
            Navigation.AdvanceAutoEdit = False
            Navigation.AppendOnArrowDown = True
            PrintSettings.DateFormat = 'dd/mm/yyyy'
            PrintSettings.Font.Charset = DEFAULT_CHARSET
            PrintSettings.Font.Color = clWindowText
            PrintSettings.Font.Height = -11
            PrintSettings.Font.Name = 'MS Sans Serif'
            PrintSettings.Font.Style = []
            PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
            PrintSettings.FixedFont.Color = clWindowText
            PrintSettings.FixedFont.Height = -11
            PrintSettings.FixedFont.Name = 'MS Sans Serif'
            PrintSettings.FixedFont.Style = []
            PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
            PrintSettings.HeaderFont.Color = clWindowText
            PrintSettings.HeaderFont.Height = -11
            PrintSettings.HeaderFont.Name = 'MS Sans Serif'
            PrintSettings.HeaderFont.Style = []
            PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
            PrintSettings.FooterFont.Color = clWindowText
            PrintSettings.FooterFont.Height = -11
            PrintSettings.FooterFont.Name = 'MS Sans Serif'
            PrintSettings.FooterFont.Style = []
            PrintSettings.PageNumSep = '/'
            SearchFooter.FindNextCaption = 'Find &next'
            SearchFooter.FindPrevCaption = 'Find &previous'
            SearchFooter.Font.Charset = DEFAULT_CHARSET
            SearchFooter.Font.Color = clWindowText
            SearchFooter.Font.Height = -11
            SearchFooter.Font.Name = 'MS Sans Serif'
            SearchFooter.Font.Style = []
            SearchFooter.HighLightCaption = 'Highlight'
            SearchFooter.HintClose = 'Close'
            SearchFooter.HintFindNext = 'Find next occurrence'
            SearchFooter.HintFindPrev = 'Find previous occurrence'
            SearchFooter.HintHighlight = 'Highlight occurrences'
            SearchFooter.MatchCaseCaption = 'Match case'
            SortSettings.Show = True
            Version = '2.3.2.2'
            AutoCreateColumns = True
            AutoRemoveColumns = False
            Columns = <
              item
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Pitch = fpVariable
                Font.Style = []
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clWindowText
                HeaderFont.Height = -11
                HeaderFont.Name = 'MS Sans Serif'
                HeaderFont.Pitch = fpVariable
                HeaderFont.Style = []
                PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                PrintFont.Charset = DEFAULT_CHARSET
                PrintFont.Color = clWindowText
                PrintFont.Height = -11
                PrintFont.Name = 'MS Sans Serif'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                Width = 20
              end
              item
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                EditLength = 30
                EditLink = FormControlEditLinkMarca
                Editor = edCustom
                FieldName = 'marca'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Marca'
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clWindowText
                HeaderFont.Height = -11
                HeaderFont.Name = 'MS Sans Serif'
                HeaderFont.Pitch = fpVariable
                HeaderFont.Style = []
                PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                PrintFont.Charset = DEFAULT_CHARSET
                PrintFont.Color = clWindowText
                PrintFont.Height = -11
                PrintFont.Name = 'MS Sans Serif'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                Width = 112
              end
              item
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                EditLength = 100
                FieldName = 'descricao'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Descri'#231#227'o'
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clWindowText
                HeaderFont.Height = -11
                HeaderFont.Name = 'MS Sans Serif'
                HeaderFont.Pitch = fpVariable
                HeaderFont.Style = []
                PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                PrintFont.Charset = DEFAULT_CHARSET
                PrintFont.Color = clWindowText
                PrintFont.Height = -11
                PrintFont.Name = 'MS Sans Serif'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                ReadOnly = True
                Width = 310
              end
              item
                Alignment = taRightJustify
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                FieldName = 'dias'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Dias'
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clWindowText
                HeaderFont.Height = -11
                HeaderFont.Name = 'MS Sans Serif'
                HeaderFont.Pitch = fpVariable
                HeaderFont.Style = []
                PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                PrintFont.Charset = DEFAULT_CHARSET
                PrintFont.Color = clWindowText
                PrintFont.Height = -11
                PrintFont.Name = 'MS Sans Serif'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                Width = 43
              end
              item
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                EditLength = 200
                FieldName = 'observacoes'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Observa'#231#245'es'
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clWindowText
                HeaderFont.Height = -11
                HeaderFont.Name = 'MS Sans Serif'
                HeaderFont.Pitch = fpVariable
                HeaderFont.Style = []
                PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                PrintFont.Charset = DEFAULT_CHARSET
                PrintFont.Color = clWindowText
                PrintFont.Height = -11
                PrintFont.Name = 'MS Sans Serif'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                Width = 373
              end>
            DataSource = dtmManutencaoAgendamento.dsrMarcasAgendamentos
            EditPostMode = epRow
            InvalidPicture.Data = {
              055449636F6E0000010001002020040000000000E80200001600000028000000
              2000000040000000010004000000000000020000000000000000000000000000
              0000000000000000000080000080000000808000800000008000800080800000
              80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
              FFFFFF000000000000777777777777000000000000000000777788FFFF887777
              000000000000007778F8887117788F877700000000000778F87111111111178F
              877000000000778871111111111999178877000000077F811111111111199999
              18F7700000778811111111111119999991887700007881111111111111119199
              99188700077F711111811111111198719997F7700788111118FF111111118FF7
              1991887077F71111888FF1111118FFFF19997F77778111118888FF1111888FF8
              911918777881111118888FF1188888811111188778811111118888FF88888811
              111117877F7111111118888888888111111117F77F7999111111888888881111
              111111F77F7999991111788888F71111111111F77F7999999917888888FF7111
              111117F778879999917FFF88888FF111111117877887999997FFFFF88888FF11
              11111887778799997FFFFFF798888FF11111187777F87997FFFFFF71178F88FF
              71117F7707887997FFFFF7999978F88871118870077F87997FFF799999978F87
              1117F77000788879978799999999787111188700007788879999999999999999
              1188770000077F88799999999999999778F77000000077888879999999999778
              8877000000000778F88877799777788F877000000000007778F8888878888F87
              7700000000000000777788FFFF88777700000000000000000077777777777700
              00000000FFC003FFFF0000FFFC00003FF800001FF000000FE0000007C0000003
              C000000380000001800000010000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000080000001
              80000001C0000003C0000003E0000007F000000FF800001FFC00003FFF0000FF
              FFC003FF}
            ShowUnicode = False
            PostOnEnter = False
            OnCheckRequiredFields = dbgMarcasAgendamentosCheckRequiredFields
            ColWidths = (
              20
              112
              310
              43
              373)
          end
          object pnlMarcasAgendamentos: TPanel
            Left = 912
            Top = 0
            Width = 28
            Height = 522
            Align = alLeft
            TabOrder = 1
            object sbnIncluirMarcasAgendamentos: TSpeedButton
              Left = 3
              Top = 17
              Width = 22
              Height = 22
              Hint = 'Incluir agendamento da Marca'
              Flat = True
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
              NumGlyphs = 2
              OnClick = sbnIncluirMarcasAgendamentosClick
            end
            object sbnExcluirMarcasAgendamentos: TSpeedButton
              Left = 8
              Top = 39
              Width = 15
              Height = 22
              Hint = 'Excluir Agendamento da Marca'
              Flat = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                A0A0A00000FF0000FF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDC0000FFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFFF
                FFFFDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFF808080DCDCDCDCDCDCDCDCDC
                0000FF0000FF0000FF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DC0000000000FFDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7FFF
                FFFFDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF808080DCDCDCDCDCDCDCDCDCDCDCDC
                0000FF0000FF0000FF0000FF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC0000
                000000FF808080DCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7FFF
                FFFFFFFFFFDCDCDCDCDCDCFFFFFF808080808080DCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC0000FF0000FF0000FF0000FF000000DCDCDCDCDCDCDCDCDC0000000000
                FF808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F
                7F7FFFFFFFDCDCDCFFFFFF808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDC0000FF0000FF0000FF000000DCDCDCDCDCDC0000000000FF0000
                FF808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F
                7F7FFFFFFFFFFFFF808080808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDC0000FF0000FF0000FF0000000000000000FF0000FF8080
                80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F
                7F7F7F7F7F808080808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDC0000FF0000FF0000FF0000FF0000FF808080DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F80
                80807F7F7F808080808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDC0000000000FF0000FF0000FF0000FFDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F
                7F7F7F7F7F7F7F7F808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDC0000000000000000FF0000FF0000FF000000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFF8080808080807F
                7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC0000000000FF0000FF0000FF0000FF0000FF0000FF000000DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFF80808080808080808080
                80807F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC0000FF
                0000FF0000FF0000FF0000FF0000FF808080DCDCDC7F7F7F0000FF000000DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF808080808080808080808080808080DC
                DCDCDCDCDC7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDC0000FF
                0000FF0000FF0000FF0000FF808080DCDCDCDCDCDCDCDCDC8080800000FF0000
                00DCDCDCDCDCDCDCDCDCDCDCDC808080808080808080808080808080DCDCDCDC
                DCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCA0A0A0
                0000FF0000FF808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC0000
                FF0000FF000000DCDCDCDCDCDC808080808080808080808080DCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
              NumGlyphs = 2
              OnClick = sbnExcluirMarcasAgendamentosClick
            end
          end
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 514
        Width = 1001
        Height = 15
        Align = alBottom
        BevelOuter = bvNone
        Caption = 'CTRL X - Exportar | CTRL F Pesquisar | Bot'#227'o Direito - Menu'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  object FormControlEditLinkGrupo: TFormControlEditLink
    Tag = 0
    AutoPopupWidth = False
    EditStyle = esInplace
    PopupWidth = 0
    PopupHeight = 0
    WantKeyLeftRight = True
    WantKeyUpDown = True
    WantKeyHomeEnd = True
    WantKeyPriorNext = True
    WantKeyReturn = True
    WantKeyEscape = True
    Control = fraConsultaGrupo
    OnSetEditorFocus = FormControlEditLinkGrupoSetEditorFocus
    Left = 816
    Top = 64
  end
  object FormControlEditLinkProduto: TFormControlEditLink
    Tag = 0
    AutoPopupWidth = False
    EditStyle = esInplace
    PopupWidth = 0
    PopupHeight = 0
    WantKeyLeftRight = True
    WantKeyUpDown = True
    WantKeyHomeEnd = True
    WantKeyPriorNext = True
    WantKeyReturn = True
    WantKeyEscape = True
    Control = fraConsultaItemProduto
    OnSetEditorFocus = FormControlEditLinkProdutoSetEditorFocus
    Left = 840
    Top = 64
  end
  object AdvGridFindDialog1: TAdvGridFindDialog
    AutoPosition = False
    Grid = dbgProdutosAgendamentos
    MsgNotFound = 'O texto n'#227'o pode ser encontrado'
    MsgNoMoreFound = 'N'#227'o h'#225' mais ocorr'#234'ncias do texto'
    TxtCaption = 'Pesquisa'
    TxtTextToFind = 'Texto a procurar'
    TxtDirection = 'Dire'#231#227'o'
    TTxtDirForward1 = 'Avan'#231'ar (cima para baixo)'
    TTxtDirForward2 = 'Avan'#231'ar (esquerda para direita)'
    TTxtDirBackward1 = 'Voltar (baixo para cima)'
    TTxtDirBackward2 = 'Voltar (direita para esquerda)'
    TxtScope = 'Escopo'
    TxtScopeAllCells = 'Todas c'#233'lulas'
    TxtScopeCurrRow = 'Somente linha atual'
    TxtScopeCurrCol = 'Somente coluna atual'
    TxtScopeSelectedCells = 'Celulas selecionadas'
    TxtOptions = 'Op'#231#245'es'
    TxtOptionsCase = '&Diferenciar Mai'#250'sculas/Min'#250'sculas'
    TxtOptionsWholeWords = '&Apenas palavras inteiras'
    TxtOptionsMatchFirst = '&Correspondente no primeiro caracter'
    TxtOptionsIgnoreHTML = '&Ignorar tags HTML'
    TxtOptionsFixedCells = '&Pesquisa em c'#233'lulas fixas'
    TxtOptionsWildcards = 'Correspondencia com m'#225'scaras'
    TxtBtnOk = 'Ok'
    TxtBtnCancel = 'Cancela'
    Left = 478
    Top = 214
  end
  object AdvGridExcelIO1: TAdvGridExcelIO
    AdvStringGrid = dbgProdutosAgendamentos
    Options.ExportOverwriteMessage = 'File %s already exists'#13'Ok to overwrite ?'
    Options.ExportRawRTF = False
    Options.ExportShowInExcel = True
    UseUnicode = False
    Version = '3.4.1'
    Left = 542
    Top = 190
  end
  object AdvPopupMenu1: TAdvPopupMenu
    Version = '2.5.4.0'
    Left = 640
    Top = 206
    object Pesquizar1: TMenuItem
      Caption = 'Pesquisar'
      ShortCut = 16454
      OnClick = Pesquizar1Click
    end
    object ExportarExcel1: TMenuItem
      Caption = 'Exportar Excel'
      ShortCut = 16472
      OnClick = ExportarExcel1Click
    end
    object Copia1: TMenuItem
      Caption = 'Copiar'
      ShortCut = 16451
      OnClick = Copia1Click
    end
  end
  object FormControlEditLinkClasse: TFormControlEditLink
    Tag = 0
    AutoPopupWidth = False
    EditStyle = esInplace
    PopupWidth = 0
    PopupHeight = 0
    WantKeyLeftRight = True
    WantKeyUpDown = True
    WantKeyHomeEnd = True
    WantKeyPriorNext = True
    WantKeyReturn = True
    WantKeyEscape = True
    Control = fraConsultaClasse
    OnSetEditorFocus = FormControlEditLinkClasseSetEditorFocus
    Left = 864
    Top = 64
  end
  object FormControlEditLinkMarca: TFormControlEditLink
    Tag = 0
    AutoPopupWidth = False
    EditStyle = esInplace
    PopupWidth = 0
    PopupHeight = 0
    WantKeyLeftRight = True
    WantKeyUpDown = True
    WantKeyHomeEnd = True
    WantKeyPriorNext = True
    WantKeyReturn = True
    WantKeyEscape = True
    Control = fraConsultaMarca
    OnSetEditorFocus = FormControlEditLinkMarcaSetEditorFocus
    Left = 888
    Top = 64
  end
end
