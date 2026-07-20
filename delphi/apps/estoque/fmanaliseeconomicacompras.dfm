inherited frmAnaliseEconomicaCompras: TfrmAnaliseEconomicaCompras
  Left = 587
  Top = 118
  Caption = 'An'#225'lise Econ'#244'mica de Compras'
  ClientHeight = 589
  ClientWidth = 855
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBarra: TToolBar
    Width = 855
  end
  inherited pnlFundoJanela: TPanel
    Top = 581
    Width = 855
    Height = 8
  end
  inline fraIntervaloDatas: TfraIntervaloDatas
    Left = 9
    Top = 47
    Width = 162
    Height = 36
    Constraints.MaxHeight = 36
    Constraints.MaxWidth = 162
    Constraints.MinHeight = 36
    Constraints.MinWidth = 162
    TabOrder = 2
    inherited gbxPeriodo: TGroupBox
      Caption = 'INTERVALO DE EMISS'#195'O'
    end
  end
  inline fraListaFiliais: TfraListaFiliais
    Left = 248
    Top = 47
    Width = 326
    Height = 147
    TabOrder = 3
    inherited gbxFiliais: TGroupBox
      Height = 147
      Caption = 'LISTA DE FILIAIS'
      inherited clbFiliais: TCheckListBox
        Left = 2
        Top = 15
        Height = 130
        Align = alLeft
      end
    end
  end
  object gbxSelecoesAleatorias: TGroupBox
    Left = 8
    Top = 208
    Width = 841
    Height = 378
    Caption = 'M'#218'LTIPLAS SELE'#199#213'ES'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object pgcMultiplasSelecoes: TPageControl
      Left = 2
      Top = 14
      Width = 837
      Height = 362
      ActivePage = tstMultiplasSelecoesProdutos
      Align = alClient
      TabOrder = 0
      object tstMultiplasSelecoesProdutos: TTabSheet
        Caption = 'PRODUTOS'
        inline fraMultiplaSelecaoAleatoriAProdutos: TfraMultiplaSelecaoAleatoria
          Left = 0
          Top = 0
          Width = 829
          Height = 335
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
            Width = 829
            Height = 335
            Font.Pitch = fpVariable
            inherited tstItemdeProduto: TTabSheet
              Font.Pitch = fpVariable
              inherited fraSelecaoAleatoriaItemdeProdutos: TfraSelecaoAleatoriaItemdeProdutos
                inherited fraSelecaoAleatoriaItemdeProduto: TfraSelecaoAleatoria
                  inherited Splitter1: TSplitter
                    Left = 789
                  end
                  inherited dbgSelecaoAleatoria: TtecDBGrid
                    Width = 789
                  end
                  inherited pnlLabels: TPanel
                    Left = 792
                  end
                  inherited pnlAbaixo: TPanel
                    Font.Pitch = fpVariable
                    inherited lblOrientacao: TLabel
                      Font.Pitch = fpVariable
                    end
                    inherited pnlAbaixoDireita: TPanel
                      Left = 790
                      Font.Pitch = fpVariable
                    end
                  end
                end
                inherited pnlParametros: TPanel
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
                      Left = 790
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
                      Left = 790
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
                      Left = 790
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
                Width = 821
                Height = 305
                inherited fraSelecaoAleatoriamarketplace: TfraSelecaoAleatoria
                  Width = 821
                  Height = 305
                  inherited Splitter1: TSplitter
                    Height = 290
                  end
                  inherited dbgSelecaoAleatoria: TtecDBGrid
                    Height = 290
                  end
                  inherited pnlLabels: TPanel
                    Height = 290
                  end
                  inherited pnlAbaixo: TPanel
                    Top = 290
                    Width = 821
                    Font.Pitch = fpVariable
                    inherited lblOrientacao: TLabel
                      Font.Pitch = fpVariable
                    end
                    inherited pnlAbaixoDireita: TPanel
                      Left = 790
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
      end
      object tstMultiplasSelecoesFornecedores: TTabSheet
        Caption = 'FORNECEDORES'
        ImageIndex = 1
        inline fraSelecaoAleatoriaFornecedores: TfraSelecaoAleatoriaClientes
          Left = 0
          Top = 0
          Width = 829
          Height = 335
          Align = alClient
          TabOrder = 0
          inherited fraSelecaoAleatoriaCliente: TfraSelecaoAleatoria
            Width = 829
            Height = 335
            inherited Splitter1: TSplitter
              Left = 798
              Height = 320
            end
            inherited dbgSelecaoAleatoria: TtecDBGrid
              Width = 798
              Height = 320
            end
            inherited pnlLabels: TPanel
              Left = 801
              Height = 320
            end
            inherited pnlAbaixo: TPanel
              Top = 320
              Width = 829
              inherited pnlAbaixoDireita: TPanel
                Left = 798
                Font.Pitch = fpVariable
              end
            end
          end
        end
      end
      object tstMultiplasSelecoesGrupoFornecedores: TTabSheet
        Caption = 'GRUPO DE FORNECEDORES'
        ImageIndex = 2
        inline fraSelecaoAleatoriagruposfornecedores: TfraSelecaoAleatoriagruposfornecedores
          Left = 0
          Top = 0
          Width = 829
          Height = 335
          Align = alClient
          TabOrder = 0
          inherited fraSelecaoAleatoriaGruposFornecedores: TfraSelecaoAleatoria
            Width = 829
            Height = 335
            inherited Splitter1: TSplitter
              Left = 797
              Height = 320
            end
            inherited dbgSelecaoAleatoria: TtecDBGrid
              Width = 797
              Height = 320
            end
            inherited pnlLabels: TPanel
              Left = 800
              Height = 320
            end
            inherited pnlAbaixo: TPanel
              Top = 320
              Width = 829
              Font.Pitch = fpVariable
              inherited lblOrientacao: TLabel
                Font.Pitch = fpVariable
              end
              inherited pnlAbaixoDireita: TPanel
                Left = 798
                Font.Pitch = fpVariable
              end
            end
          end
        end
      end
    end
  end
  object rgpSituacaoCadastramentoNFe: TRadioGroup
    Left = 8
    Top = 120
    Width = 137
    Height = 73
    Items.Strings = (
      'NFe Cadastrada'
      'Nfe n'#227'o Cadastrada'
      'Ambas')
    TabOrder = 5
  end
  object StaticText1: TStaticText
    Left = 16
    Top = 119
    Width = 121
    Height = 16
    Caption = 'SITUA'#199#195'O DO CADASTRO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object ecvValida: TtecEditionControlValidation
    EditionControl = <
      item
        Control = fraIntervaloDatas.edtDataInicial
      end
      item
        Control = fraIntervaloDatas.edtDataFinal
      end>
    Left = 704
    Top = 88
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 704
    Top = 64
  end
end
