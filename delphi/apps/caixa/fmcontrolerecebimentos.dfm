inherited frmControleRecebimentos: TfrmControleRecebimentos
  Left = 231
  Top = 88
  ActiveControl = fraListaFiliais1.clbFiliais
  Caption = 'Controle de Recebimentos'
  ClientHeight = 580
  ClientWidth = 1076
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    TabOrder = 2
  end
  inherited pnlTopMenu: TPanel
    Width = 1076
    inherited tblBarra: TToolBar
      Width = 1075
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
      object sbnConfirma: TSpeedButton
        Left = 84
        Top = 2
        Width = 75
        Height = 39
        Hint = 'Confirma quita'#231#227'o da(s) duplicata(s)'
        Caption = 'Confirma F5'
        Enabled = False
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
        OnClick = sbnConfirmaClick
      end
      object sbnGerar: TSpeedButton
        Left = 159
        Top = 2
        Width = 75
        Height = 39
        Hint = 'Selecionar duplicatas'
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
    object stxOperacao: TStaticText
      Left = 460
      Top = 10
      Width = 4
      Height = 4
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      Visible = False
    end
  end
  object pgcControleRecebimentos: TtecPageControl
    Left = 0
    Top = 45
    Width = 1076
    Height = 535
    ActivePage = tstParametros
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = pgcControleRecebimentosChange
    object tstParametros: TTabSheet
      Caption = ' &1 - Par'#226'metros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      inline fraListaFiliais1: TfraListaFiliais
        Left = 6
        Top = 2
        Width = 322
        Height = 207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        inherited gbxFiliais: TGroupBox
          Width = 322
          Height = 207
          Caption = ' &FILIAIS '
          Font.Color = clBlack
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          inherited sbnMarcarFiliais: TSpeedButton
            Left = 295
          end
          inherited sbnDesmarcarFiliais: TSpeedButton
            Left = 295
          end
          inherited clbFiliais: TCheckListBox
            Width = 287
            Height = 186
          end
        end
      end
      object gbxClientes: TGroupBox
        Left = 340
        Top = 3
        Width = 462
        Height = 35
        Caption = ' CLIENTE '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        inline fraConsultaClientes: TfraConsultaCodigo
          Left = 2
          Top = 9
          Width = 455
          Height = 24
          HorzScrollBar.Range = 350
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
            Width = 367
            DataField = 'nome'
            DataSource = fraConsultaClientes.dsrProcuraCliente
          end
          inherited edfCodigo: TtecDBFindLookup
            DataField = 'codigo'
            DataSource = fraConsultaClientes.dsrProcuraCliente
            Group = 'Cliente'
            MaxLength = 8
            OnFound = nil
            Operacao = opPESQUISA
            Parameter = 'codigo'
            ActiveSetControls = False
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
          end
        end
      end
      object gbxEmissao: TGroupBox
        Left = 340
        Top = 178
        Width = 160
        Height = 36
        Caption = ' PER'#205'ODO DE EMISS'#195'O '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        object lblA: TLabel
          Left = 76
          Top = 16
          Width = 7
          Height = 15
          Caption = 'a'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object edtDataInicialEmissao: TEditData
          Left = 2
          Top = 10
          Width = 70
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
          Minimo = 37353
          Maximo = 37353
        end
        object edtDataFinalEmissao: TEditData
          Left = 87
          Top = 10
          Width = 70
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 1
          Minimo = 37353
          Maximo = 37353
        end
      end
      object gbxTipoRecebimentos: TGroupBox
        Left = 340
        Top = 48
        Width = 145
        Height = 120
        Caption = ' TIPOS DE RECEBIMENTO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object ckbDinheiro: TCheckBox
          Left = 8
          Top = 12
          Width = 120
          Height = 17
          Caption = 'Dinheiro'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 0
        end
        object ckbCheque: TCheckBox
          Left = 8
          Top = 30
          Width = 120
          Height = 17
          Caption = 'Cheque'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 1
        end
        object ckbDebito: TCheckBox
          Left = 8
          Top = 48
          Width = 120
          Height = 17
          Caption = 'Cart'#227'o de d'#233'bito'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 2
        end
        object ckbCredito: TCheckBox
          Left = 8
          Top = 66
          Width = 120
          Height = 17
          Caption = 'Cart'#227'o de cr'#233'dito'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 3
        end
        object ckbPIX: TCheckBox
          Left = 8
          Top = 82
          Width = 120
          Height = 17
          Caption = 'PIX'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 4
        end
        object ckbCreditoTroca: TCheckBox
          Left = 8
          Top = 98
          Width = 120
          Height = 17
          Caption = 'Cr'#233'dito de Troca'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 5
        end
      end
      object gbxVencimentos: TGroupBox
        Left = 340
        Top = 217
        Width = 160
        Height = 36
        Caption = ' VENCIMENTOS '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        object Label1: TLabel
          Left = 76
          Top = 16
          Width = 7
          Height = 15
          Caption = 'a'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object edtDataInicialVencto: TEditData
          Left = 2
          Top = 10
          Width = 70
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
          Minimo = 37353
          Maximo = 37353
        end
        object edtDataFinalVencto: TEditData
          Left = 87
          Top = 10
          Width = 70
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 1
          Minimo = 37353
          Maximo = 37353
        end
      end
      object rgbOperacaoes: TRadioGroup
        Left = 493
        Top = 47
        Width = 202
        Height = 89
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          'Alterar tipos de recebimentos'
          'Confirmar recebimentos'
          'Estornar recebimentos')
        ParentFont = False
        TabOrder = 4
        OnClick = rgbOperacaoesClick
      end
      inline fraListaTiposdeRecebimentos1: TfraListaTiposdeRecebimentos
        Left = 5
        Top = 210
        Width = 323
        Height = 174
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        inherited gbx: TGroupBox
          Width = 323
          Caption = ' &TIPOS DE RECEBIMENTOS '
          Font.Color = clBlack
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          inherited Bevel1: TBevel
            Top = 16
            Width = 319
          end
          inherited clbtiposderecebimentos: TCheckListBox
            Top = 22
            Width = 289
            Height = 150
            Align = alNone
          end
          inherited pnldireito: TPanel
            Left = 294
            Top = 22
            Width = 27
            Height = 150
            Align = alNone
            inherited sbnDesmarcar: TSpeedButton
              Left = 3
            end
            inherited sbnMarcar: TSpeedButton
              Left = 3
            end
          end
        end
        inherited qryTiposdeRecebimentos: TtecQuery
          Database = nil
          Transaction = nil
          Sql.Strings = (
            ';'
            'select * from'
            '('
            '('
            'Select tr.codigo, '
            '           tr.descricao'
            'From   tiposrecebimentos tr'
            '%WhereTiposRecebimentos'
            ')'
            ''
            ') as selecao'
            'Order by codigo')
        end
      end
      object sttOperacoes: TStaticText
        Left = 498
        Top = 48
        Width = 64
        Height = 16
        Caption = ' OPERA'#199#213'ES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object gbxRecebimentos: TGroupBox
        Left = 340
        Top = 257
        Width = 160
        Height = 36
        Caption = ' RECEBIMENTOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        object Label2: TLabel
          Left = 76
          Top = 16
          Width = 7
          Height = 15
          Caption = 'a'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object edtDataInicialRecebimento: TEditData
          Left = 2
          Top = 10
          Width = 70
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
          Minimo = 37353
          Maximo = 37353
        end
        object edtDataFinalRecebimento: TEditData
          Left = 87
          Top = 10
          Width = 70
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 1
          Minimo = 37353
          Maximo = 37353
        end
      end
      object gbxMeiosdePagamento: TGroupBox
        Left = 702
        Top = 50
        Width = 123
        Height = 57
        Caption = 'MEIOS DE PAGAMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        object ckbTEF: TCheckBox
          Left = 9
          Top = 16
          Width = 80
          Height = 17
          Caption = 'TEF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object ckbPOS: TCheckBox
          Left = 9
          Top = 32
          Width = 88
          Height = 17
          Caption = 'POS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
    end
    object tstSelecionados: TTabSheet
      Caption = ' &2 - Registros Selecionados'
      ImageIndex = 1
      object dbgDetalhado: TtecDBGrid
        Left = 0
        Top = 0
        Width = 1068
        Height = 362
        Align = alClient
        DataSource = dtmControleRecebimentos.dsrRecebimentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -9
        TitleFont.Name = 'helvetica'
        TitleFont.Pitch = fpVariable
        TitleFont.Style = []
        OnDrawColumnCell = dbgDetalhadoDrawColumnCell
        OnDblClick = dbgDetalhadoDblClick
        OnKeyDown = dbgDetalhadoKeyDown
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
            Alignment = taCenter
            Expanded = False
            FieldName = 'filial'
            ReadOnly = True
            Title.Caption = 'FILIAL'
            Width = 19
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'datalancto'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'LAN'#199'TO'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valorlancto'
            Title.Alignment = taCenter
            Title.Caption = 'VALOR'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'datavencto'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'VENCIMENTO'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valorvencto'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'VALOR'
            Width = 69
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'data_confirmacao'
            Title.Alignment = taCenter
            Title.Caption = 'RECEBIMENTO'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor_confirmacao'
            Title.Alignment = taCenter
            Title.Caption = 'VALOR'
            Width = 73
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'tiporec'
            Title.Alignment = taCenter
            Title.Caption = 'TIPO RECEBIMENTO'
            Width = 114
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'pdesagio'
            Title.Alignment = taCenter
            Title.Caption = '% DES'#193'G'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VlrDesagio'
            Title.Alignment = taCenter
            Title.Caption = 'VLR DES'#193'GIO'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cliente'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'CLIENTE'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nomecliente'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'NOME DO CLIENTE'
            Width = 134
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'listacontratos'
            Title.Alignment = taCenter
            Title.Caption = 'CONTRATOS'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ListaOrcamentos'
            Title.Caption = 'OR'#199'AMENTOS'
            Width = 67
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'confirmado'
            Title.Alignment = taCenter
            Title.Caption = 'OK'
            Width = 25
            Visible = True
          end>
      end
      object pnlButtom: TPanel
        Left = 0
        Top = 445
        Width = 1068
        Height = 59
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object gbxTransacao: TGroupBox
          Left = 0
          Top = 7
          Width = 118
          Height = 55
          Caption = ' TRANSA'#199#195'O '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object dtxTransacao: TtecDBText
            Left = 3
            Top = 19
            Width = 111
            Height = 23
            TabStop = False
            Color = clBtnFace
            DataField = 'transacao'
            DataSource = dtmControleRecebimentos.dsrRecebimentos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Alignment = taCenter
          end
        end
        object gbxLidos: TGroupBox
          Left = 240
          Top = 6
          Width = 294
          Height = 48
          Caption = ' SELECIONADOS '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object gbxNrLidos: TGroupBox
            Left = 3
            Top = 12
            Width = 65
            Height = 36
            Caption = ' QTDE '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object edtQtdeRecebimentos: TEditNumero
              Left = 2
              Top = 10
              Width = 60
              Height = 23
              TabStop = False
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
              Mascara = False
              TipoMascara = tmGERAL
              NrDecimal = 2
              Decimais = False
              Negativo = False
              Tamanho = 6
            end
          end
          object gbxValorLido: TGroupBox
            Left = 179
            Top = 12
            Width = 115
            Height = 36
            Caption = 'TOTAL VENCIMENTOS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object edtTotalVencimentos: TEditNumero
              Left = 2
              Top = 10
              Width = 110
              Height = 23
              TabStop = False
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
              Mascara = True
              TipoMascara = tmGERAL
              NrDecimal = 2
              Decimais = True
              Negativo = False
              Tamanho = 9
            end
          end
          object GroupBox1: TGroupBox
            Left = 66
            Top = 12
            Width = 115
            Height = 36
            Caption = 'TOTAL LAN'#199'AMENTOS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object edtTotalValorLancto: TEditNumero
              Left = 2
              Top = 10
              Width = 110
              Height = 23
              TabStop = False
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
              Mascara = True
              TipoMascara = tmGERAL
              NrDecimal = 2
              Decimais = True
              Negativo = False
              Tamanho = 9
            end
          end
        end
        object gbxMarcadas: TGroupBox
          Left = 540
          Top = 6
          Width = 178
          Height = 48
          Caption = 'CONFIRMADOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object gbxTotalQtdeMarcados: TGroupBox
            Left = 0
            Top = 12
            Width = 65
            Height = 36
            Caption = ' QTDE '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object edtQtdeMarcados: TEditNumero
              Left = 2
              Top = 10
              Width = 60
              Height = 23
              TabStop = False
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
              Mascara = False
              TipoMascara = tmGERAL
              NrDecimal = 2
              Decimais = False
              Negativo = False
              Tamanho = 6
            end
          end
          object gbxTotalValoresMarcados: TGroupBox
            Left = 63
            Top = 12
            Width = 115
            Height = 36
            Caption = ' RECEBIMENTOS '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object edtTotalMarcados: TEditNumero
              Left = 2
              Top = 10
              Width = 110
              Height = 23
              TabStop = False
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
              OnChange = edtTotalMarcadosChange
              Mascara = True
              TipoMascara = tmGERAL
              NrDecimal = 2
              Decimais = True
              Negativo = False
              Tamanho = 9
            end
          end
        end
        object ckbConfirmarTodos: TCheckBox
          Left = 845
          Top = 13
          Width = 125
          Height = 23
          Caption = 'Confirmar todos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = ckbConfirmarTodosClick
        end
        object gbxTEF: TGroupBox
          Left = 116
          Top = 7
          Width = 118
          Height = 51
          Caption = ' REDE TEF '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          object dtxNomeRedeTEF: TtecDBText
            Left = 3
            Top = 19
            Width = 111
            Height = 23
            TabStop = False
            Color = clBtnFace
            DataField = 'nomeredetef'
            DataSource = dtmControleRecebimentos.dsrRecebimentos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Alignment = taCenter
          end
        end
        object gbxDataQuitacao: TGroupBox
          Left = 744
          Top = 17
          Width = 77
          Height = 36
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          object edtDataConfirmacao: TEditData
            Left = 2
            Top = 10
            Width = 72
            Height = 23
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Minimo = 37353
            Maximo = 365
          end
        end
        object stxDataDa: TStaticText
          Left = 760
          Top = 6
          Width = 44
          Height = 16
          Caption = 'DATA DA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object stxConfirmacao: TStaticText
          Left = 746
          Top = 16
          Width = 73
          Height = 16
          Caption = 'CONFIRMA'#199#195'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object stxRecebimentos: TStaticText
          Left = 863
          Top = 30
          Width = 97
          Height = 19
          Caption = 'os recebimentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
      end
      object pnlCheques: TPanel
        Left = 0
        Top = 362
        Width = 1068
        Height = 83
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object gbxCheques: TGroupBox
          Left = 0
          Top = 0
          Width = 1068
          Height = 83
          Align = alClient
          Caption = ' CHEQUES '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object lblPossuiQuitacoes: TLabel
            Left = 731
            Top = 15
            Width = 249
            Height = 15
            Caption = 'Possui confirma'#231#245'es em outros vencimentos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
          end
          object lblPossuiQuitacoesCor: TShape
            Left = 714
            Top = 17
            Width = 11
            Height = 11
            Brush.Color = 22015
            Enabled = False
            Pen.Width = 0
          end
          object gbxClienteCheque: TGroupBox
            Left = 0
            Top = 12
            Width = 485
            Height = 36
            Caption = ' CLIENTE '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object dtxClienteCheque: TtecDBText
              Left = 82
              Top = 10
              Width = 400
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'nomecliente'
              DataSource = dtmControleRecebimentos.dsrRecebimentos
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
            object dtxcodigoCliente: TtecDBText
              Left = 3
              Top = 10
              Width = 78
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'cliente'
              DataSource = dtmControleRecebimentos.dsrRecebimentos
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
          object gbxTitulaCheque: TGroupBox
            Left = 0
            Top = 48
            Width = 485
            Height = 36
            Caption = ' TITULAR '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object dtxTitularCheque: TtecDBText
              Left = 2
              Top = 10
              Width = 480
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'cheque_titular'
              DataSource = dtmControleRecebimentos.dsrRecebimentos
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
          object gbxDataVenctoCheque: TGroupBox
            Left = 483
            Top = 12
            Width = 75
            Height = 36
            Caption = ' VENCTO '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object dtxDataVenctoCheque: TtecDBText
              Left = 2
              Top = 10
              Width = 70
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'cheque_vencto'
              DataSource = dtmControleRecebimentos.dsrRecebimentos
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
          object gbxCheque: TGroupBox
            Left = 676
            Top = 48
            Width = 75
            Height = 36
            Caption = ' N'#186' CHEQUE '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            object dtxCheque: TtecDBText
              Left = 2
              Top = 10
              Width = 70
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'cheque_cheque'
              DataSource = dtmControleRecebimentos.dsrRecebimentos
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
          object gbxConta: TGroupBox
            Left = 588
            Top = 48
            Width = 90
            Height = 36
            Caption = ' CONTA '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            object dtxConta: TtecDBText
              Left = 2
              Top = 10
              Width = 85
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'cheque_conta'
              DataSource = dtmControleRecebimentos.dsrRecebimentos
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
          object gbxAgencia: TGroupBox
            Left = 531
            Top = 48
            Width = 58
            Height = 36
            Caption = 'AG'#202'NCIA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            object dtxAgencia: TtecDBText
              Left = 2
              Top = 10
              Width = 53
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'cheque_agencia'
              DataSource = dtmControleRecebimentos.dsrRecebimentos
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
          object gbxBanco: TGroupBox
            Left = 483
            Top = 48
            Width = 50
            Height = 36
            Caption = 'BANCO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            object dtxBanco: TtecDBText
              Left = 2
              Top = 10
              Width = 45
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'cheque_banco'
              DataSource = dtmControleRecebimentos.dsrRecebimentos
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
        end
      end
    end
  end
end
