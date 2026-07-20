inherited frmRelatorioVendasporSetores: TfrmRelatorioVendasporSetores
  Left = 273
  Top = 121
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'Relat'#243'rio de Vendas por Setores'
  ClientHeight = 681
  ClientWidth = 888
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBarra: TToolBar
    Width = 888
  end
  inherited pnlFundoJanela: TPanel
    Top = 651
    Width = 888
    TabOrder = 7
  end
  inline fraIntervaloDatas: TfraIntervaloDatas
    Left = 9
    Top = 43
    Width = 200
    Height = 36
    Constraints.MaxHeight = 36
    Constraints.MaxWidth = 162
    Constraints.MinHeight = 36
    Constraints.MinWidth = 162
    TabOrder = 8
    inherited gbxPeriodo: TGroupBox
      Width = 200
      Constraints.MaxWidth = 0
      Constraints.MinWidth = 0
      inherited lblDataFinal: TLabel
        Left = 95
      end
      inherited edtDataInicial: TEditData
        Left = 5
        Width = 83
      end
      inherited edtDataFinal: TEditData
        Left = 109
        Width = 84
      end
    end
  end
  object gbxSetoresVenda: TGroupBox
    Left = 3
    Top = 301
    Width = 254
    Height = 156
    Caption = '&2 - Setores'
    TabOrder = 4
    object sbnMarcarGrupos: TSpeedButton
      Left = 228
      Top = 19
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
    end
    object sbnDesmarcarGrupos: TSpeedButton
      Left = 228
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
    end
    object clbSetoresdeVenda: TCheckListBox
      Left = 6
      Top = 19
      Width = 219
      Height = 134
      ItemHeight = 15
      Style = lbOwnerDrawVariable
      TabOrder = 0
    end
  end
  inline fraListaFiliais1: TfraListaFiliais
    Left = 4
    Top = 150
    Width = 254
    Height = 150
    TabOrder = 2
    inherited gbxFiliais: TGroupBox
      Width = 254
      Height = 150
      Caption = '&1 - Filiais'
      inherited sbnMarcarFiliais: TSpeedButton
        Left = 227
      end
      inherited sbnDesmarcarFiliais: TSpeedButton
        Left = 227
      end
      inherited clbFiliais: TCheckListBox
        Width = 220
        Height = 128
      end
    end
  end
  object rgpListaCasamento: TRadioGroup
    Left = 7
    Top = 83
    Width = 121
    Height = 67
    Caption = 'LISTA DE CASAMENTO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Pitch = fpVariable
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'COM LISTA'
      'SEM LISTA'
      'S'#211' LISTA')
    ParentFont = False
    TabOrder = 1
  end
  inline fraOrdenacao_cr1: TfraOrdenacao_cr
    Left = 268
    Top = 40
    Width = 415
    Height = 257
    HorzScrollBar.Visible = False
    VertScrollBar.Visible = False
    TabOrder = 3
    inherited gbxOrdenacao: TGroupBox
      Height = 257
      inherited pnlDireito: TPanel
        Height = 238
      end
      inherited dbgSelecao: TtecDBGrid
        Height = 238
        Columns = <
          item
            Expanded = False
            FieldName = 'campodescricao'
            ReadOnly = True
            Title.Caption = 'Nome do campo'
            Width = 130
            Visible = True
          end
          item
            DropDownRows = 2
            Expanded = False
            FieldName = 'tipo'
            PickList.Strings = (
              'ASC'
              'DESC')
            Title.Caption = 'Forma'
            Width = 62
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cabecalho'
            Title.Caption = 'Exibir cabecalho'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'rodape'
            Title.Caption = 'Totalizar rodap'#233
            Width = 89
            Visible = True
          end>
      end
    end
    inherited qryLista: TtecQuery
      Sql.Strings = (
        'select cast('#39'Faturamento'#39' as varchar(50)) as CAMPODESCRICAO, '
        '           cast('#39'faturamento'#39' as varchar(50)) as CAMPO,'
        '          cast('#39'ASC'#39' as varchar) as TIPO,'
        #9#9'  true as CABECALHO,'
        #9#9'  true as RODAPE'
        'UNION ALL'
        'select cast('#39'Vendedor'#39' as varchar(50)) as CAMPODESCRICAO, '
        '           cast('#39'vendedor'#39' as varchar(50)) as CAMPO,'
        '          cast('#39'ASC'#39' as varchar) as TIPO,'
        #9#9'  true as CABECALHO,'
        #9#9'  true as RODAPE'
        'UNION ALL'
        
          'select cast('#39'Lista de casamento'#39' as varchar(50)) as CAMPODESCRIC' +
          'AO, '
        '           cast('#39'listacasamento'#39' as varchar(50)) as CAMPO,'
        '          cast('#39'ASC'#39' as varchar) as TIPO,'
        #9#9'  true as CABECALHO,'
        #9#9'  true as RODAPE'#9
        'UNION ALL'
        
          'select cast('#39'Filial de Venda'#39' as varchar(50)) as CAMPODESCRICAO,' +
          ' '
        '           cast('#39'filialvenda'#39' as varchar(50)) as CAMPO,'
        '          cast('#39'ASC'#39' as varchar) as TIPO,'
        #9#9'  true as CABECALHO,'
        #9#9'  true as RODAPE'
        'UNION ALL'
        'select cast('#39'Setor de venda'#39' as varchar(50)) as CAMPODESCRICAO, '
        '           cast('#39'setorvenda'#39' as varchar(50)) as CAMPO,'
        '          cast('#39'ASC'#39' as varchar) as TIPO,'
        #9#9'  true as CABECALHO,'
        #9#9'  true as RODAPE'
        'UNION ALL'
        'select cast('#39'Marca'#39' as varchar(50)) as CAMPODESCRICAO, '
        '           cast('#39'marca'#39' as varchar(50)) as CAMPO,'
        '          cast('#39'ASC'#39' as varchar) as TIPO,'
        #9#9'  true as CABECALHO,'
        #9#9'  true as RODAPE'
        #9'  '
        'UNION ALL'
        'select cast('#39'Classe'#39' as varchar(50)) as CAMPODESCRICAO, '
        '           cast('#39'classe'#39' as varchar(50)) as CAMPO,'
        '          cast('#39'ASC'#39' as varchar) as TIPO,'
        #9#9'  true as CABECALHO,'
        #9#9'  true as RODAPE'
        #9#9'  '
        'UNION ALL'
        'select cast('#39'Grupo'#39' as varchar(50)) as CAMPODESCRICAO, '
        '           cast('#39'grupo'#39' as varchar(50)) as CAMPO,'
        '          cast('#39'ASC'#39' as varchar) as TIPO,'
        #9#9'  true as CABECALHO,'
        #9#9'  true as RODAPE'
        ''
        'UNION ALL'
        'select cast('#39'Produto'#39' as varchar(50)) as CAMPODESCRICAO, '
        '           cast('#39'caracteristica'#39' as varchar(50)) as CAMPO,'
        '          cast('#39'ASC'#39' as varchar) as TIPO,'
        #9#9'  true as CABECALHO,'
        #9#9'  true as RODAPE'
        ''
        'UNION ALL'
        'select cast('#39'Item Produto'#39' as varchar(50)) as CAMPODESCRICAO, '
        '           cast('#39'produtovisual'#39' as varchar(50)) as CAMPO,'
        '          cast('#39'ASC'#39' as varchar) as TIPO,'
        #9#9'  true as CABECALHO,'
        #9#9'  true as RODAPE')
    end
  end
  object PageControl1: TPageControl
    Left = 4
    Top = 461
    Width = 881
    Height = 220
    ActivePage = tstProdutos
    TabOrder = 6
    object tstProdutos: TTabSheet
      Caption = 'Produtos'
      ImageIndex = 1
      inline fraMultiplaSelecaoAleatoria1: TfraMultiplaSelecaoAleatoria
        Left = 0
        Top = 0
        Width = 873
        Height = 192
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
          Width = 873
          Height = 192
          ActivePage = fraMultiplaSelecaoAleatoria1.tstItemdeProduto
          Font.Pitch = fpVariable
          inherited tstItemdeProduto: TTabSheet
            Font.Pitch = fpVariable
            inherited fraSelecaoAleatoriaItemdeProdutos: TfraSelecaoAleatoriaItemdeProdutos
              Width = 865
              Height = 162
              inherited fraSelecaoAleatoriaItemdeProduto: TfraSelecaoAleatoria
                Width = 865
                Height = 138
                inherited Splitter1: TSplitter
                  Left = 833
                  Height = 124
                end
                inherited dbgSelecaoAleatoria: TtecDBGrid
                  Width = 833
                  Height = 124
                end
                inherited pnlLabels: TPanel
                  Left = 836
                  Height = 124
                end
                inherited pnlAbaixo: TPanel
                  Top = 124
                  Width = 865
                  Font.Pitch = fpVariable
                  inherited lblOrientacao: TLabel
                    Font.Pitch = fpVariable
                  end
                  inherited pnlAbaixoDireita: TPanel
                    Left = 834
                    Font.Pitch = fpVariable
                  end
                end
              end
              inherited pnlParametros: TPanel
                Top = 138
                Width = 865
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
                inherited dbgSelecaoAleatoria: TtecDBGrid
                end
                inherited pnlAbaixo: TPanel
                  Font.Pitch = fpVariable
                  inherited lblOrientacao: TLabel
                    Font.Pitch = fpVariable
                  end
                  inherited pnlAbaixoDireita: TPanel
                    Left = 834
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
                    Left = 834
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
                  Left = 833
                end
                inherited dbgSelecaoAleatoria: TtecDBGrid
                  Width = 833
                end
                inherited pnlLabels: TPanel
                  Left = 836
                end
                inherited pnlAbaixo: TPanel
                  Font.Pitch = fpVariable
                  inherited lblOrientacao: TLabel
                    Font.Pitch = fpVariable
                  end
                  inherited pnlAbaixoDireita: TPanel
                    Left = 834
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
                    Left = 834
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
              Width = 865
              Height = 162
              inherited fraSelecaoAleatoriamarketplace: TfraSelecaoAleatoria
                Width = 865
                Height = 162
                inherited Splitter1: TSplitter
                  Height = 147
                end
                inherited dbgSelecaoAleatoria: TtecDBGrid
                  Height = 147
                end
                inherited pnlLabels: TPanel
                  Height = 147
                end
                inherited pnlAbaixo: TPanel
                  Top = 147
                  Width = 865
                  Font.Pitch = fpVariable
                  inherited lblOrientacao: TLabel
                    Font.Pitch = fpVariable
                  end
                  inherited pnlAbaixoDireita: TPanel
                    Left = 834
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
    object tstClientes: TTabSheet
      Caption = 'Clientes'
      inline fraSelecaoAleatoriaClientes1: TfraSelecaoAleatoriaClientes
        Left = 0
        Top = 0
        Width = 873
        Height = 192
        Align = alClient
        TabOrder = 0
        inherited fraSelecaoAleatoriaCliente: TfraSelecaoAleatoria
          Width = 873
          Height = 192
          inherited Splitter1: TSplitter
            Left = 842
            Height = 177
          end
          inherited dbgSelecaoAleatoria: TtecDBGrid
            Width = 842
            Height = 177
          end
          inherited pnlLabels: TPanel
            Left = 845
            Height = 177
          end
          inherited pnlAbaixo: TPanel
            Top = 177
            Width = 873
            inherited pnlAbaixoDireita: TPanel
              Font.Pitch = fpVariable
            end
          end
        end
      end
    end
  end
  object pgcPlanos_e_Vendedores: TtecPageControl
    Left = 265
    Top = 296
    Width = 620
    Height = 161
    ActivePage = tstVendedores
    TabOrder = 5
    object tstVendedores: TTabSheet
      Caption = 'Vendedores'
      inline fraSelecaoAleatoriausuarios: TfraSelecaoAleatoriausuarios
        Left = 0
        Top = 0
        Width = 612
        Height = 133
        Align = alClient
        TabOrder = 0
        inherited fraSelecaoAleatoriausuarios: TfraSelecaoAleatoria
          Width = 612
          Height = 133
          inherited Splitter1: TSplitter
            Left = 577
            Height = 118
          end
          inherited dbgSelecaoAleatoria: TtecDBGrid
            Width = 577
            Height = 118
          end
          inherited pnlLabels: TPanel
            Left = 580
            Height = 118
          end
          inherited pnlAbaixo: TPanel
            Top = 118
            Width = 612
            Font.Pitch = fpVariable
            inherited lblOrientacao: TLabel
              Font.Pitch = fpVariable
            end
            inherited pnlAbaixoDireita: TPanel
              Left = 581
              Font.Pitch = fpVariable
            end
          end
        end
      end
    end
    object tstGruposdeVendedores: TTabSheet
      Caption = 'Grupos de Vendedores'
      ImageIndex = 2
      inline fraSelecaoAleatoriagruposusuarios1: TfraSelecaoAleatoriagruposusuarios
        Left = 0
        Top = 0
        Width = 612
        Height = 133
        Align = alClient
        TabOrder = 0
        inherited fraSelecaoAleatoriagruposusuarios: TfraSelecaoAleatoria
          Width = 612
          Height = 133
          inherited Splitter1: TSplitter
            Left = 577
            Height = 118
          end
          inherited dbgSelecaoAleatoria: TtecDBGrid
            Width = 577
            Height = 118
          end
          inherited pnlLabels: TPanel
            Left = 580
            Height = 118
          end
          inherited pnlAbaixo: TPanel
            Top = 118
            Width = 612
            Font.Pitch = fpVariable
            inherited lblOrientacao: TLabel
              Font.Pitch = fpVariable
            end
            inherited pnlAbaixoDireita: TPanel
              Left = 581
              Font.Pitch = fpVariable
            end
          end
        end
      end
    end
  end
  object ckbSomenteTotalizadores: TCheckBox
    Left = 688
    Top = 192
    Width = 161
    Height = 17
    Caption = 'Somente os Totalizadores'
    TabOrder = 9
  end
  object rgpTotaisCom: TRadioGroup
    Left = 688
    Top = 216
    Width = 161
    Height = 81
    Caption = 'Exibir'
    ItemIndex = 0
    Items.Strings = (
      'Totais Com as Trocas'
      'Totais Sem as Trocas'
      'Ambos os totais')
    TabOrder = 10
  end
end
