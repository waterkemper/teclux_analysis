inherited frmRelatorioProdutosConferidos: TfrmRelatorioProdutosConferidos
  Left = 384
  Top = 135
  Caption = 'Relat'#243'rio de Produtos Conferidos'
  ClientHeight = 640
  ClientWidth = 816
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBarra: TToolBar
    Width = 816
    TabOrder = 6
  end
  inherited pnlFundoJanela: TPanel
    Top = 610
    Width = 816
    TabOrder = 7
  end
  inline fraIntervaloDatas1: TfraIntervaloDatas
    Left = 4
    Top = 48
    Width = 162
    Height = 36
    Constraints.MaxHeight = 36
    Constraints.MaxWidth = 162
    Constraints.MinHeight = 36
    Constraints.MinWidth = 162
    TabOrder = 0
    inherited gbxPeriodo: TGroupBox
      Caption = 'DATAS DOS DOCUMENTOS'
    end
  end
  object GroupBox1: TGroupBox
    Left = 303
    Top = 171
    Width = 435
    Height = 222
    Caption = ' OPERADORES '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    inline fraSelecaoAleatoriaFuncionarios: TfraSelecaoAleatoria
      Left = 2
      Top = 16
      Width = 431
      Height = 204
      HorzScrollBar.Range = 26
      Align = alClient
      AutoScroll = False
      TabOrder = 0
      inherited Splitter1: TSplitter
        Left = 400
        Height = 189
      end
      inherited dbgSelecaoAleatoria: TtecDBGrid
        Width = 400
        Height = 189
        Font.Height = -12
        Font.Name = 'Helvetica'
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
        OnDblClick = fraSelecaoAleatoriaFuncionariosdbgSelecaoAleatoriaDblClick
        OnKeyDown = fraSelecaoAleatoriaFuncionariosdbgSelecaoAleatoriaKeyDown
        DefaultRowHeight = 19
      end
      inherited pnlLabels: TPanel
        Left = 403
        Height = 189
        inherited sbnProcura: TSpeedButton
          Hint = 'CTRL + F9 - Procura funcion'#225'rio'
          OnClick = fraSelecaoAleatoriaFuncionariossbnProcuraClick
        end
        inherited sbnExcluir: TSpeedButton
          Hint = 'Excluir funcion'#225'rio'
        end
        inherited sbnExcluirTodos: TSpeedButton
          Hint = 'Excluir todos os funcion'#225'rios'
        end
        inherited sbnIncluirItem: TSpeedButton
          Hint = 'Incluir funcion'#225'rio'
        end
      end
      inherited pnlAbaixo: TPanel
        Top = 189
        Width = 431
        Font.Pitch = fpVariable
        inherited lblOrientacao: TLabel
          Font.Pitch = fpVariable
        end
        inherited pnlAbaixoDireita: TPanel
          Left = 400
          Font.Pitch = fpVariable
        end
      end
      inherited qrySelecaoAleatoria: TtecQuery
        AfterOpen = fraSelecaoAleatoriaFuncionariosqrySelecaoAleatoriaAfterOpen
        Sql.Strings = (
          'Select u.codigo,'
          '            u.nome'
          'From  usuarios u'
          'WHERE false')
      end
    end
  end
  object gbxSituacao: TGroupBox
    Left = 4
    Top = 91
    Width = 245
    Height = 70
    Caption = 'SITUA'#199#195'O DA CONFER'#202'NCIA DO DOCUMENTO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object ckbNaoConferidos: TCheckBox
      Left = 8
      Top = 18
      Width = 233
      Height = 20
      Caption = 'N'#195'O CONFERIDO'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 0
      OnClick = ckbNaoConferidosClick
    end
    object ckbTotalmenteConferidos: TCheckBox
      Left = 8
      Top = 50
      Width = 232
      Height = 18
      Caption = 'TOTALMENTE CONFERIDO'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 2
      OnClick = ckbTotalmenteConferidosClick
    end
    object ckbParcialmenteConferidos: TCheckBox
      Left = 8
      Top = 34
      Width = 231
      Height = 18
      Caption = 'PARCIALMENTE CONFERIDO'
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
      OnClick = ckbParcialmenteConferidosClick
    end
  end
  object gbxTipo: TGroupBox
    Left = 255
    Top = 91
    Width = 482
    Height = 70
    Caption = 'TIPO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object ckbContrato: TCheckBox
      Left = 8
      Top = 13
      Width = 121
      Height = 20
      Caption = 'CONTRATO'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 0
      OnClick = ckbContratoClick
    end
    object ckbNotadeEntrada: TCheckBox
      Left = 128
      Top = 13
      Width = 129
      Height = 20
      Caption = 'NOTA DE ENTRADA'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 2
      OnClick = ckbNotadeEntradaClick
    end
    object ckbNotadeSaida: TCheckBox
      Left = 8
      Top = 29
      Width = 121
      Height = 20
      Caption = 'NOTA DE SA'#205'DA'
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
      OnClick = ckbNotadeSaidaClick
    end
    object ckbTransferencia: TCheckBox
      Left = 128
      Top = 29
      Width = 129
      Height = 20
      Caption = 'TRANSFER'#202'NCIA'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 3
      OnClick = ckbTransferenciaClick
    end
    object ckbLISTASPADRAO: TCheckBox
      Left = 8
      Top = 46
      Width = 129
      Height = 20
      Caption = 'LISTAS PADR'#195'O'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 4
      OnClick = ckbLISTASPADRAOClick
    end
    object ckbNotadeSaidaTransferencia: TCheckBox
      Left = 128
      Top = 45
      Width = 193
      Height = 20
      Caption = 'NOTA DE SA'#205'DA TRANSFER'#202'NCIA'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 5
      OnClick = ckbNotadeSaidaTransferenciaClick
    end
    object ckbRomaneiosEntrada: TCheckBox
      Left = 320
      Top = 29
      Width = 153
      Height = 20
      Caption = 'ROMANEIOS DE ENTRADA'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 6
      OnClick = ckbRomaneiosEntradaClick
    end
    object ckbRomaneiosSaida: TCheckBox
      Left = 320
      Top = 45
      Width = 153
      Height = 20
      Caption = 'ROMANEIOS DE SA'#205'DA'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 7
      OnClick = ckbRomaneiosSaidaClick
    end
    object ckbOrcamentos: TCheckBox
      Left = 320
      Top = 13
      Width = 121
      Height = 20
      Caption = 'OR'#199'AMENTOS'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 8
      OnClick = ckbOrcamentosClick
    end
  end
  inline fraListaFiliais1: TfraListaFiliais
    Left = 4
    Top = 169
    Width = 293
    Height = 223
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    inherited gbxFiliais: TGroupBox
      Width = 293
      Height = 223
      Caption = ' &FILIAIS '
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      inherited sbnMarcarFiliais: TSpeedButton
        Left = 194
        Top = 195
      end
      inherited sbnDesmarcarFiliais: TSpeedButton
        Left = 218
        Top = 195
      end
      inherited clbFiliais: TCheckListBox
        Left = 2
        Width = 289
        Height = 176
        Align = alTop
        Font.Height = -12
        Font.Name = 'Arial'
      end
    end
  end
  inline fraMultiplaSelecaoAleatoria1: TfraMultiplaSelecaoAleatoria
    Left = 4
    Top = 392
    Width = 733
    Height = 245
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    inherited pgcMultiplaSelecaoAleatoria: TtecPageControl
      Width = 733
      Height = 245
      ActivePage = fraMultiplaSelecaoAleatoria1.tstItemdeProduto
      Font.Pitch = fpVariable
      inherited tstItemdeProduto: TTabSheet
        Font.Pitch = fpVariable
        inherited fraSelecaoAleatoriaItemdeProdutos: TfraSelecaoAleatoriaItemdeProdutos
          Width = 725
          Height = 215
          inherited fraSelecaoAleatoriaItemdeProduto: TfraSelecaoAleatoria
            Width = 725
            Height = 191
            inherited Splitter1: TSplitter
              Left = 690
              Height = 177
            end
            inherited dbgSelecaoAleatoria: TtecDBGrid
              Width = 690
              Height = 177
              Font.Height = -12
              Font.Name = 'HELVETICA'
              DefaultRowHeight = 19
            end
            inherited pnlLabels: TPanel
              Left = 693
              Height = 177
            end
            inherited pnlAbaixo: TPanel
              Top = 177
              Width = 725
              Font.Pitch = fpVariable
              inherited lblOrientacao: TLabel
                Font.Pitch = fpVariable
              end
              inherited pnlAbaixoDireita: TPanel
                Left = 694
                Font.Pitch = fpVariable
              end
            end
          end
          inherited pnlParametros: TPanel
            Top = 191
            Width = 725
            Font.Pitch = fpVariable
            inherited ckbProdutosComAgendamento: TCheckBox
              Font.Pitch = fpVariable
            end
          end
        end
      end
      inherited tstProduto: TTabSheet
        inherited fraSelecaoAleatoriaprodutos: TfraSelecaoAleatoriaprodutos
          Width = 725
          Height = 215
          inherited fraSelecaoAleatoriaProduto: TfraSelecaoAleatoria
            Width = 725
            Height = 215
            inherited Splitter1: TSplitter
              Left = 690
              Height = 200
            end
            inherited dbgSelecaoAleatoria: TtecDBGrid
              Width = 690
              Height = 200
              Font.Height = -12
            end
            inherited pnlLabels: TPanel
              Left = 693
              Height = 200
            end
            inherited pnlAbaixo: TPanel
              Top = 200
              Width = 725
              Font.Pitch = fpVariable
              inherited lblOrientacao: TLabel
                Font.Pitch = fpVariable
              end
              inherited pnlAbaixoDireita: TPanel
                Left = 694
                Font.Pitch = fpVariable
              end
            end
          end
        end
      end
      inherited tstSelecaoAleatoriaGrupoProduto: TTabSheet
        inherited fraSelecaoaleatoriagruposprodutos: TfraSelecaoaleatoriagruposprodutos
          inherited fraSelecaoAleatoriaGrupoProduto: TfraSelecaoAleatoria
            inherited dbgSelecaoAleatoria: TtecDBGrid
              Font.Height = -12
              DefaultRowHeight = 19
            end
            inherited pnlAbaixo: TPanel
              Font.Pitch = fpVariable
              inherited lblOrientacao: TLabel
                Font.Pitch = fpVariable
              end
              inherited pnlAbaixoDireita: TPanel
                Left = 694
                Font.Pitch = fpVariable
              end
            end
          end
        end
      end
      inherited tstSelecaoAleatoriaClasseProduto: TTabSheet
        inherited fraSelecaoaleatoriaclassesprodutos: TfraSelecaoaleatoriaclassesprodutos
          inherited fraSelecaoAleatoriaClasseProduto: TfraSelecaoAleatoria
            inherited dbgSelecaoAleatoria: TtecDBGrid
              Font.Height = -12
            end
            inherited pnlAbaixo: TPanel
              Font.Pitch = fpVariable
              inherited lblOrientacao: TLabel
                Font.Pitch = fpVariable
              end
              inherited pnlAbaixoDireita: TPanel
                Left = 694
                Font.Pitch = fpVariable
              end
            end
          end
        end
      end
      inherited tstSelecaoAleatoriaMarcaProduto: TTabSheet
        inherited fraSelecaoAleatoriamarcasProdutos: TfraSelecaoAleatoriamarcasProdutos
          inherited fraSelecaoAleatoriamarcasProduto: TfraSelecaoAleatoria
            inherited dbgSelecaoAleatoria: TtecDBGrid
              Font.Height = -12
            end
            inherited pnlLabels: TPanel
              inherited sbnProcura: TSpeedButton
                Left = 2
                Width = 30
              end
              inherited sbnExcluir: TSpeedButton
                Left = 2
                Width = 30
              end
              inherited sbnExcluirTodos: TSpeedButton
                Left = 2
                Width = 30
              end
              inherited sbnIncluirItem: TSpeedButton
                Left = 2
                Width = 30
              end
            end
            inherited pnlAbaixo: TPanel
              Font.Pitch = fpVariable
              inherited lblOrientacao: TLabel
                Font.Pitch = fpVariable
              end
              inherited pnlAbaixoDireita: TPanel
                Left = 694
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
                Left = 694
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
                Left = 694
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
                Left = 694
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
            inherited Splitter1: TSplitter
              Left = 867
            end
            inherited pnlLabels: TPanel
              Left = 837
            end
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
                Left = 694
                Font.Pitch = fpVariable
              end
            end
          end
        end
      end
      inherited tstSelecaoAleatoriaLotes: TTabSheet
        inherited fraSelecaoAleatorialotes1: TfraSelecaoAleatorialotes
          inherited fraSelecaoAleatorialotes: TfraSelecaoAleatoria
            inherited Splitter1: TSplitter
              Left = 867
            end
            inherited pnlLabels: TPanel
              Left = 835
            end
            inherited pnlAbaixo: TPanel
              Font.Pitch = fpVariable
              inherited lblOrientacao: TLabel
                Font.Pitch = fpVariable
              end
              inherited pnlAbaixoDireita: TPanel
                Left = 694
                Font.Pitch = fpVariable
              end
            end
          end
        end
      end
      inherited tstSelecaoAleatoriaMarketPlace: TTabSheet
        inherited fraSelecaoaleatoriamarketplace1: TfraSelecaoaleatoriamarketplace
          inherited fraSelecaoAleatoriamarketplace: TfraSelecaoAleatoria
            inherited Splitter1: TSplitter
              Left = 867
            end
            inherited pnlLabels: TPanel
              Left = 835
            end
            inherited pnlAbaixo: TPanel
              Font.Pitch = fpVariable
              inherited lblOrientacao: TLabel
                Font.Pitch = fpVariable
              end
              inherited pnlAbaixoDireita: TPanel
                Left = 694
                Font.Pitch = fpVariable
              end
            end
          end
        end
      end
      inherited tstAtributos: TTabSheet
        inherited fraSelecaoAleatoriaatributos1: TfraSelecaoAleatoriaatributos
          inherited fraSelecaoAleatoriaatributos: TfraSelecaoAleatoria
            inherited Splitter1: TSplitter
              Left = 867
            end
            inherited pnlLabels: TPanel
              Left = 837
            end
            inherited pnlAbaixo: TPanel
              Font.Pitch = fpVariable
              inherited lblOrientacao: TLabel
                Font.Pitch = fpVariable
              end
              inherited pnlAbaixoDireita: TPanel
                Left = 694
                Font.Pitch = fpVariable
              end
            end
          end
        end
      end
      inherited tstSelecaoAleatoriaServicos: TTabSheet
        inherited fraSelecaoaleatoriaservicos1: TfraSelecaoaleatoriaservicos
          inherited fraSelecaoAleatoriaservicos: TfraSelecaoAleatoria
            inherited Splitter1: TSplitter
              Left = 867
            end
            inherited pnlLabels: TPanel
              Left = 835
            end
            inherited pnlAbaixo: TPanel
              Font.Pitch = fpVariable
              inherited lblOrientacao: TLabel
                Font.Pitch = fpVariable
              end
              inherited pnlAbaixoDireita: TPanel
                Left = 694
                Font.Pitch = fpVariable
              end
            end
          end
        end
      end
    end
  end
  inline fraIntervaloDatasDigitacao: TfraIntervaloDatas
    Left = 255
    Top = 47
    Width = 162
    Height = 36
    Constraints.MaxHeight = 36
    Constraints.MaxWidth = 162
    Constraints.MinHeight = 36
    Constraints.MinWidth = 162
    TabOrder = 8
    inherited gbxPeriodo: TGroupBox
      Caption = 'DATAS DA DIGITA'#199#195'O'
    end
  end
  object ecvValida: TtecEditionControlValidation
    EditionControl = <
      item
        Control = fraIntervaloDatasDigitacao.edtDataFinal
      end
      item
        Control = fraIntervaloDatasDigitacao.edtDataInicial
      end>
    Left = 464
  end
end
