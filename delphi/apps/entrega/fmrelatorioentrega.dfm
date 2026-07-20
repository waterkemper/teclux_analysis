inherited frmrelatorioentrega: Tfrmrelatorioentrega
  Left = 323
  Top = 57
  ActiveControl = fraIntervaloDatasEntrega
  Caption = 'Relat'#243'rio de entregas'
  ClientHeight = 511
  ClientWidth = 673
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBarra: TToolBar
    Width = 673
    TabOrder = 5
  end
  inherited pnlFundoJanela: TPanel
    Top = 481
    Width = 673
    TabOrder = 6
  end
  inline fraIntervaloDatasVenda: TfraIntervaloDatas
    Left = 6
    Top = 103
    Width = 162
    Height = 36
    Constraints.MaxHeight = 36
    Constraints.MaxWidth = 162
    Constraints.MinHeight = 36
    Constraints.MinWidth = 162
    TabOrder = 1
    inherited gbxPeriodo: TGroupBox
      Caption = 'PER'#205'ODO DE VENDAS'
    end
  end
  object gbxMaquinas: TGroupBox
    Left = 249
    Top = 43
    Width = 416
    Height = 166
    Caption = ' REGI'#213'ES'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    inline fraSelecaoAleatoriaRegioes: TfraSelecaoAleatoria
      Left = 2
      Top = 14
      Width = 412
      Height = 150
      HorzScrollBar.Range = 26
      Align = alClient
      AutoScroll = False
      TabOrder = 0
      inherited Splitter1: TSplitter
        Left = 381
        Height = 135
      end
      inherited dbgSelecaoAleatoria: TtecDBGrid
        Width = 381
        Height = 135
        Font.Height = -12
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
        OnDblClick = fraSelecaoAleatoriaRegioesdbgSelecaoAleatoriaDblClick
        OnKeyDown = fraSelecaoAleatoriaRegioesdbgSelecaoAleatoriaKeyDown
      end
      inherited pnlLabels: TPanel
        Left = 384
        Height = 135
        inherited sbnProcura: TSpeedButton
          OnClick = fraSelecaoAleatoriaRegioessbnProcuraClick
        end
      end
      inherited pnlAbaixo: TPanel
        Top = 135
        Width = 412
        Font.Pitch = fpVariable
        inherited lblOrientacao: TLabel
          Font.Pitch = fpVariable
        end
        inherited pnlAbaixoDireita: TPanel
          Left = 381
          Font.Pitch = fpVariable
        end
      end
      inherited qrySelecaoAleatoria: TtecQuery
        AfterOpen = fraSelecaoAleatoriaRegioesqrySelecaoAleatoriaAfterOpen
        Sql.Strings = (
          'select r.*'
          'from regioes r'
          'where false')
      end
    end
  end
  object gbxAgrupamento: TGroupBox
    Left = 120
    Top = 152
    Width = 113
    Height = 58
    Caption = 'AGRUPAMENTO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Visible = False
    object ckbAgruparRegioes: TCheckBox
      Left = 8
      Top = 16
      Width = 97
      Height = 17
      Caption = 'REGI'#213'ES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object ckbAgruparClientes: TCheckBox
      Left = 8
      Top = 34
      Width = 97
      Height = 17
      Caption = 'CLIENTES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object rgpSituacao: TRadioGroup
    Left = 8
    Top = 152
    Width = 105
    Height = 58
    Caption = 'SITUA'#199#195'O'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'EM ABERTO'
      'ENTREGUE')
    ParentFont = False
    TabOrder = 2
  end
  inline fraIntervaloDatasEntrega: TfraIntervaloDatas
    Left = 7
    Top = 54
    Width = 162
    Height = 36
    Constraints.MaxHeight = 36
    Constraints.MaxWidth = 162
    Constraints.MinHeight = 36
    Constraints.MinWidth = 162
    TabOrder = 0
    inherited gbxPeriodo: TGroupBox
      Caption = 'PER'#205'ODO DE ENTREGA'
      inherited edtDataFinal: TEditData
        Maximo = 37353
      end
    end
  end
  object gbxListaFornecedores: TGroupBox
    Left = 8
    Top = 365
    Width = 660
    Height = 137
    Caption = ' LISTA DE FORNECEDORES DE TRANSPORTE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'HELVETICA'
    Font.Pitch = fpVariable
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    inline fraSelecaoAleatoriaFornecedores1: TfraSelecaoAleatoriaClientes
      Left = 2
      Top = 16
      Width = 656
      Height = 119
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
        Width = 656
        Height = 119
        Font.Height = -12
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
        inherited Splitter1: TSplitter
          Left = 625
          Height = 104
        end
        inherited dbgSelecaoAleatoria: TtecDBGrid
          Width = 625
          Height = 104
          Font.Height = -11
          DefaultRowHeight = 18
          Columns = <
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'codigo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'CLIENTE'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'HELVETICA'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 59
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'tipo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'T'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'HELVETICA'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 15
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'descricao'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'NOME DO CLIENTE'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'HELVETICA'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 265
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'campo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'APLICAR A'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'HELVETICA'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'opcomparacao'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'CONDI'#199#195'O'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'HELVETICA'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 115
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'oplogico'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'L'#211'GICA'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'HELVETICA'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Visible = True
            end>
        end
        inherited pnlLabels: TPanel
          Left = 628
          Height = 104
        end
        inherited pnlAbaixo: TPanel
          Top = 104
          Width = 656
          inherited lblOrientacao: TLabel
            Width = 291
            Height = 15
            Caption = '[CTRL+F9] para pesquisa  e  [CTRL+Del] para excluir'
            Font.Height = -12
            Font.Name = 'HELVETICA'
          end
          inherited pnlAbaixoDireita: TPanel
            Left = 625
            Font.Pitch = fpVariable
          end
        end
      end
    end
  end
  object gbxListadeClientes: TGroupBox
    Left = 8
    Top = 218
    Width = 660
    Height = 143
    Caption = ' LISTA DE CLIENTES ENVOLVIDOS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'HELVETICA'
    Font.Pitch = fpVariable
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    inline fraSelecaoAleatoriaClientes1: TfraSelecaoAleatoriaClientes
      Left = 2
      Top = 16
      Width = 656
      Height = 125
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
        Width = 656
        Height = 125
        Font.Height = -12
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
        inherited Splitter1: TSplitter
          Left = 625
          Height = 110
        end
        inherited dbgSelecaoAleatoria: TtecDBGrid
          Width = 625
          Height = 110
          Font.Height = -11
          DefaultRowHeight = 18
          Columns = <
            item
              Expanded = False
              FieldName = 'codigo'
              Title.Alignment = taCenter
              Title.Caption = 'Cliente'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tipo'
              Title.Caption = 'T'
              Width = 14
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'descricao'
              Title.Alignment = taCenter
              Title.Caption = 'Nome do Cliente'
              Width = 261
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'campo'
              PickList.Strings = (
                'codigo'
                'descricao'
                'cpf/cnpj')
              Title.Alignment = taCenter
              Title.Caption = 'Aplicar a'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'opcomparacao'
              PickList.Strings = (
                '= Igual a'
                '<> Diferente de'
                '>= Maior ou Igual a'
                '<= Menor ou Igual a'
                '> Maior que'
                '< Menor que'
                'Cont'#233'm'
                'N'#227'o Cont'#233'm'
                'Contido na Lista'
                'n'#227'o Contido na Lista')
              Title.Alignment = taCenter
              Title.Caption = 'Condi'#231#227'o'
              Width = 119
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'oplogico'
              PickList.Strings = (
                'e'
                'ou')
              Title.Alignment = taCenter
              Title.Caption = 'L'#243'gica'
              Visible = True
            end>
        end
        inherited pnlLabels: TPanel
          Left = 628
          Height = 110
        end
        inherited pnlAbaixo: TPanel
          Top = 110
          Width = 656
          inherited lblOrientacao: TLabel
            Width = 291
            Height = 15
            Caption = '[CTRL+F9] para pesquisa  e  [CTRL+Del] para excluir'
            Font.Height = -12
            Font.Name = 'HELVETICA'
          end
          inherited pnlAbaixoDireita: TPanel
            Left = 625
            Font.Pitch = fpVariable
          end
        end
      end
    end
  end
  object ecvValida: TtecEditionControlValidation
    EditionControl = <>
    Left = 504
    Top = 88
  end
end
