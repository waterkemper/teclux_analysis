inherited frmCadastroImoveisContrato: TfrmCadastroImoveisContrato
  Left = 740
  Top = 277
  ActiveControl = fraConsultaEmpreendimento
  Caption = 'Cadastro de Im'#243'veis no Contrato'
  ClientHeight = 400
  ClientWidth = 477
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlTopMenu: TPanel
    Width = 477
    inherited tblBarra: TToolBar
      Width = 252
    end
  end
  object gbxDados: TGroupBox
    Left = 0
    Top = 40
    Width = 477
    Height = 360
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object gbxEmpreendimentos: TGroupBox
      Left = 10
      Top = 6
      Width = 465
      Height = 36
      Caption = 'EMPREENDIMENTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      inline fraConsultaEmpreendimento: TfraConsultaCodigo
        Left = 2
        Top = 10
        Width = 460
        Height = 23
        HorzScrollBar.Range = 460
        VertScrollBar.Range = 23
        AutoScroll = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        inherited dtxDescricao: TtecDBText
          Width = 372
          DataField = 'nome'
          DataSource = fraConsultaEmpreendimento.dsrProcuraEmpreendimentos
        end
        inherited edfCodigo: TtecDBFindLookup
          DataField = 'codigoempreendimento'
          DataSource = dtmContratosImoveis.dsrImoveisVendidos
          Group = 'Empreendimentos'
          MaxLength = 6
          OnEnter = fraConsultaEmpreendimentoedfCodigoEnter
          OnFound = fraConsultaEmpreendimentoedfCodigoFound
          LookupField = 'codigo'
          LookupSource = fraConsultaEmpreendimento.dsrProcuraEmpreendimentos
          Parameter = ' '
          ActiveSetControls = True
          DenyInsert = True
          NoSetControls = <
            item
              Control = fraConsultaEmpreendimento.sbnProcura
            end>
          SetControls = <
            item
              Control = gbxBlocos
            end
            item
              Control = gbxTipodeUnidade
            end
            item
              Control = gbxNumero
            end
            item
              Control = gbxObsContrato
            end
            item
              Control = gbxareas
            end
            item
            end
            item
              Control = gbxPavimento
            end
            item
              Control = gbxObservacoes
            end>
          LookupParameter = 'Codigo'
        end
        inherited qryProcuraCobrador: TtecQuery
          Left = 432
        end
      end
    end
    object gbxBlocos: TGroupBox
      Left = 9
      Top = 46
      Width = 300
      Height = 37
      Caption = 'BLOCO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object gbxNumero: TGroupBox
      Left = 160
      Top = 86
      Width = 147
      Height = 37
      Caption = 'N'#218'MERO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object gbxPavimento: TGroupBox
      Left = 318
      Top = 46
      Width = 110
      Height = 36
      Caption = 'PAVIMENTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      object dtxpavimento: TtecDBText
        Left = 2
        Top = 10
        Width = 105
        Height = 23
        TabStop = False
        Color = clBtnFace
        DataField = 'pavimento'
        DataSource = dtmContratosImoveis.dsrImoveisVendidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object gbxareas: TGroupBox
      Left = 8
      Top = 206
      Width = 417
      Height = 50
      Caption = #193'REAS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      object lblMais: TLabel
        Left = 97
        Top = 24
        Width = 13
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = '+'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblIgual: TLabel
        Left = 203
        Top = 24
        Width = 19
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = '='
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
      end
      object gbxPrivativa: TGroupBox
        Left = 5
        Top = 14
        Width = 90
        Height = 36
        Caption = 'PRIVATIVA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object dtxPrivativa: TtecDBText
          Left = 2
          Top = 10
          Width = 85
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'areaprivativa'
          DataSource = dtmContratosImoveis.dsrImoveisVendidos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object gbxComum: TGroupBox
        Left = 112
        Top = 14
        Width = 90
        Height = 36
        Caption = 'COMUM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object dtxComum: TtecDBText
          Left = 2
          Top = 10
          Width = 85
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'areacomum'
          DataSource = dtmContratosImoveis.dsrImoveisVendidos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object gbxTotal: TGroupBox
        Left = 222
        Top = 14
        Width = 90
        Height = 36
        Caption = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object dtxtotal: TtecDBText
          Left = 2
          Top = 10
          Width = 85
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'AreaTotal'
          DataSource = dtmContratosImoveis.dsrImoveisVendidos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object gbxFracaoIdeal: TGroupBox
        Left = 323
        Top = 14
        Width = 90
        Height = 36
        Caption = 'FRA'#199#195'O IDEAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object dtxFracaoideal: TtecDBText
          Left = 2
          Top = 10
          Width = 85
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'fracaoideal'
          DataSource = dtmContratosImoveis.dsrImoveisVendidos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
    object gbxObservacoes: TGroupBox
      Left = 8
      Top = 262
      Width = 466
      Height = 81
      Caption = 'OBSERVA'#199#213'ES DO IM'#211'VEL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      object mmoObservacoes: TtecDBMemo
        Left = 2
        Top = 14
        Width = 462
        Height = 65
        Align = alClient
        Color = clBtnFace
        DataField = 'observacoes'
        DataSource = dtmContratosImoveis.dsrImoveisVendidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object gbxPrecoVenda: TGroupBox
      Left = 326
      Top = 154
      Width = 145
      Height = 49
      Caption = 'PRE'#199'O DE VENDA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      TabStop = True
      object edtPrecoVenda: TDBEditNumero
        Left = 2
        Top = 10
        Width = 140
        Height = 36
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        MaxLength = -1
        ParentFont = False
        TabOrder = 0
        Text = 'edtPrecoVenda'
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = False
        Tamanho = 9
        DataField = 'precovenda'
        DataSource = dtmContratosImoveis.dsrImoveisVendidos
      end
    end
    object gbxObsContrato: TGroupBox
      Left = 8
      Top = 128
      Width = 463
      Height = 73
      Caption = 'OBSERVA'#199#213'ES DO EMPREENDIMENTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      object mmoObsContrato: TtecDBMemo
        Left = 2
        Top = 14
        Width = 459
        Height = 57
        TabStop = False
        Align = alClient
        DataField = 'observacoes'
        DataSource = fraConsultaEmpreendimento.dsrProcuraEmpreendimentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentColor = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object gbxTipodeUnidade: TGroupBox
      Left = 8
      Top = 86
      Width = 147
      Height = 37
      Caption = 'TIPO DE UNIDADE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object gbxPrecoImovel: TGroupBox
      Left = 318
      Top = 86
      Width = 110
      Height = 36
      Caption = 'PRE'#199'O DO IM'#211'VEL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      object dtxPrevoImovel: TtecDBText
        Left = 2
        Top = 10
        Width = 105
        Height = 23
        TabStop = False
        Color = clBtnFace
        DataField = 'precovenda'
        DataSource = dtmContratosImoveis.dsrImoveisVendidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
end
