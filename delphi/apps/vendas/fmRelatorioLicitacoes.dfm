inherited frmRelatorioLicitacoes: TfrmRelatorioLicitacoes
  Left = 327
  Top = 123
  Caption = 'Relat'#243'rio de Licita'#231#245'es'
  ClientHeight = 543
  ClientWidth = 835
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBarra: TToolBar
    Width = 835
    TabOrder = 5
  end
  inherited pnlFundoJanela: TPanel
    Top = 513
    Width = 835
    TabOrder = 6
  end
  object gbxPeriodo: TGroupBox
    Left = 8
    Top = 112
    Width = 137
    Height = 67
    Caption = 'Per'#237'odo de Venda'
    TabOrder = 0
    object lblDataInicial: TLabel
      Left = 14
      Top = 22
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Inicial'
    end
    object lblDataFinal: TLabel
      Left = 18
      Top = 45
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = 'Final'
    end
    object edtDataInicial: TEditData
      Left = 53
      Top = 18
      Width = 80
      Height = 21
      MaxLength = 10
      TabOrder = 0
      Minimo = 37353
      Maximo = 0
    end
    object edtDataFinal: TEditData
      Left = 52
      Top = 41
      Width = 80
      Height = 21
      MaxLength = 10
      TabOrder = 1
      Minimo = 37353
      Maximo = 0
    end
  end
  object rgpResumo: TRadioGroup
    Left = 8
    Top = 293
    Width = 137
    Height = 81
    Caption = 'Resumo'
    ItemIndex = 0
    Items.Strings = (
      'Com R&esumo'
      '&Sem Resumo'
      'S'#243' Res&umo')
    TabOrder = 3
  end
  object gbxListadeClientes: TGroupBox
    Left = 152
    Top = 50
    Width = 665
    Height = 223
    Caption = ' LISTA DE CLIENTES ENVOLVIDOS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'HELVETICA'
    Font.Pitch = fpVariable
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    inline fraSelecaoAleatoriaClientes1: TfraSelecaoAleatoriaClientes
      Left = 2
      Top = 16
      Width = 661
      Height = 205
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'HELVETICA'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      inherited fraSelecaoAleatoriaCliente: TfraSelecaoAleatoria
        Width = 661
        Height = 205
        Font.Height = -12
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
        inherited Splitter1: TSplitter
          Left = 625
          Height = 190
        end
        inherited dbgSelecaoAleatoria: TtecDBGrid
          Width = 625
          Height = 190
          Font.Height = -11
          DefaultRowHeight = 18
        end
        inherited pnlLabels: TPanel
          Left = 628
          Height = 190
        end
        inherited pnlAbaixo: TPanel
          Top = 190
          Width = 661
          inherited lblOrientacao: TLabel
            Width = 291
            Height = 15
            Caption = '[CTRL+F9] para pesquisa  e  [CTRL+Del] para excluir'
            Font.Height = -12
            Font.Name = 'HELVETICA'
          end
          inherited pnlAbaixoDireita: TPanel
            Left = 630
            Font.Pitch = fpVariable
          end
        end
      end
    end
  end
  object gbxSituacaoLicitacoes: TGroupBox
    Left = 8
    Top = 182
    Width = 137
    Height = 82
    Caption = 'SITUA'#199#195'O'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object ckbLicitacaoAberta: TCheckBox
      Left = 8
      Top = 16
      Width = 96
      Height = 10
      Caption = 'Aberta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object ckbLicitacaoFinalizada: TCheckBox
      Left = 8
      Top = 32
      Width = 103
      Height = 10
      Caption = 'Finalizada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object ckbLicitacaoCancelada: TCheckBox
      Left = 8
      Top = 48
      Width = 84
      Height = 10
      Caption = 'Cancelada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object ckbLicitacaoExpirada: TCheckBox
      Left = 8
      Top = 62
      Width = 76
      Height = 15
      Caption = 'Expirada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
  end
  object rgbTipoRelatorio: TRadioGroup
    Left = 8
    Top = 53
    Width = 137
    Height = 52
    Caption = 'Tipo de Relat'#243'rio'
    ItemIndex = 0
    Items.Strings = (
      'Sint'#233'tico'
      'Anal'#237'tico')
    TabOrder = 7
  end
  object gbxListaCondicionalVendedores: TGroupBox
    Left = 151
    Top = 285
    Width = 666
    Height = 220
    Caption = 'Vendedores'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    inline fraSelecaoAleatoriavendedores: TfraSelecaoAleatoriavendedores
      Left = 2
      Top = 16
      Width = 662
      Height = 202
      Align = alClient
      TabOrder = 0
      inherited fraSelecaoAleatoriavendedores: TfraSelecaoAleatoria
        Width = 662
        Height = 202
        inherited Splitter1: TSplitter
          Left = 546
          Height = 187
        end
        inherited dbgSelecaoAleatoria: TtecDBGrid
          Width = 546
          Height = 187
        end
        inherited pnlLabels: TPanel
          Left = 549
          Height = 187
          inherited sbnProcura: TSpeedButton
            Left = 1
          end
          inherited sbnExcluir: TSpeedButton
            Left = 1
          end
          inherited sbnExcluirTodos: TSpeedButton
            Left = 1
          end
          inherited sbnIncluirItem: TSpeedButton
            Left = 1
          end
        end
        inherited pnlAbaixo: TPanel
          Top = 187
          Width = 662
          Font.Pitch = fpVariable
          inherited lblOrientacao: TLabel
            Font.Pitch = fpVariable
          end
          inherited pnlAbaixoDireita: TPanel
            Left = 631
            Font.Pitch = fpVariable
          end
        end
      end
    end
  end
  object ckbCustoMaiorVenda: TCheckBox
    Left = 8
    Top = 270
    Width = 145
    Height = 15
    Caption = 'Custo maior que a venda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
end
