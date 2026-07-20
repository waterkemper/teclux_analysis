inherited frmProcessosJudiciaisReinf: TfrmProcessosJudiciaisReinf
  Left = 422
  Top = 183
  ActiveControl = dbgEnvio_Processos
  Caption = 'Processos Judiciais REINF'
  ClientHeight = 554
  ClientWidth = 985
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTopMenu: TPanel [0]
    Width = 985
    TabOrder = 0
    inherited tblBarra: TToolBar
      Width = 760
    end
    inherited tblBarraCadastro: TToolBar
      inherited sbnExcluir: TSpeedButton
        Caption = 'Cancelar F6'
      end
    end
  end
  inline fraConsultaUFVara: TfraConsultaCodigo [1]
    Left = 336
    Top = 163
    Width = 49
    Height = 24
    HorzScrollBar.Range = 361
    HorzScrollBar.Visible = False
    VertScrollBar.Range = 23
    VertScrollBar.Visible = False
    AutoScroll = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Visible = False
    inherited sbnProcura: TSpeedButton
      Left = 24
    end
    inherited dtxDescricao: TtecDBText
      Left = 56
      Width = 0
      DataField = 'nome'
      DataSource = fraConsultaUFVara.dsrProcuraEstados
    end
    inherited edfCodigo: TtecDBFindLookup
      Width = 25
      DataField = 'ufvara'
      DataSource = dtmProcessosJudiciaisReinf.dsrSuspensaoExibilidadeTributos
      MaxLength = 2
      LookupField = 'codigo'
      LookupSource = fraConsultaUFVara.dsrProcuraEstados
      LookupQueryParameter = 'codigo'
      Parameter = ' '
      ActiveSetControls = False
      DenyInsert = False
      NoSetControls = <>
      SetControls = <>
      LookupParameter = 'codigo'
    end
  end
  inherited pnlBarra: TPanel
    Left = 0
    Top = 554
    Width = 985
    Height = 0
    Align = alBottom
    TabOrder = 4
    inherited bvlBotoesEd: TBevel
      Left = 981
      Top = 1
      Height = 22
      Align = alRight
    end
  end
  inline fraConsultaCidadesVara: TfraConsultaCodigo
    Left = 336
    Top = 193
    Width = 233
    Height = 24
    HorzScrollBar.Range = 401
    HorzScrollBar.Visible = False
    VertScrollBar.Range = 23
    VertScrollBar.Visible = False
    AutoScroll = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Visible = False
    inherited sbnProcura: TSpeedButton
      Left = 56
      Height = 23
    end
    inherited dtxDescricao: TtecDBText
      Left = 80
      Width = 137
      DataField = 'nome'
      DataSource = fraConsultaCidadesVara.dsrProcuraCidades
    end
    inherited edfCodigo: TtecDBFindLookup
      Width = 57
      DataField = 'codmunic'
      DataSource = dtmProcessosJudiciaisReinf.dsrSuspensaoExibilidadeTributos
      MaxLength = 6
      LookupField = 'codigoibge'
      LookupSource = fraConsultaCidadesVara.dsrProcuraCidades
      LookupQueryParameter = 'codigoibge'
      Parameter = ' '
      ActiveSetControls = False
      DenyInsert = False
      NoSetControls = <>
      SetControls = <>
      LookupParameter = 'codigoibge'
    end
  end
  object pgcProcessosJudiciais: TPageControl
    Left = 0
    Top = 45
    Width = 985
    Height = 508
    ActivePage = tstEnvioReinfs
    TabOrder = 3
    OnChange = pgcProcessosJudiciaisChange
    object tstCadastroReinf: TTabSheet
      Caption = 'Cadastro'
      object gbxNumero: TGroupBox
        Left = 8
        Top = 4
        Width = 73
        Height = 36
        Caption = ' N'#218'MERO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        inline fraConsultaProcessoJudicialReinf: TfraConsultaCodigoContabil
          Left = 3
          Top = 10
          Width = 66
          Height = 23
          HorzScrollBar.Range = 497
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
          inherited edfCodigo: TtecDBFindLookup
            Width = 66
            DataField = 'numero'
            DataSource = dtmProcessosJudiciaisReinf.dsrProcessoJudicialReinf
            Group = 'reinf'
            OnFound = nil
            OnKeyDown = fraConsultaProcessoJudicialReinfedfCodigoKeyDown
            Parameter = 'numero'
            ActiveSetControls = True
            DenyInsert = True
            NoSetControls = <>
            SetControls = <
              item
                Control = gbxTipoProcesso
              end
              item
                Control = gbxnrproc
              end
              item
                Control = gbxindautoria
              end
              item
                Control = gbxinivalid
              end
              item
                Control = gbxfimvalid
              end
              item
                Control = gbxObservacoes
              end
              item
                Control = gbxSuspensaoExibilidadeTributos
              end
              item
                Control = DBAdvEdit2
              end
              item
                Control = DBAdvEdit1
              end>
            LookupParameter = ' '
          end
        end
      end
      object gbxTipoProcesso: TGroupBox
        Left = 9
        Top = 41
        Width = 144
        Height = 36
        Hint = 'Preencher com o c'#243'digo correspondente ao tipo de processo'
        Caption = 'Tipo de Processo'
        TabOrder = 1
        object dbmTipoProcesso: TDBMaplistCombobox
          Left = 3
          Top = 11
          Width = 137
          Height = 23
          Hint = 'Preencher com o c'#243'digo correspondente ao tipo de processo'
          Style = csDropDownList
          DataField = 'tpproc'
          DataSource = dtmProcessosJudiciaisReinf.dsrProcessoJudicialReinf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Aria6'
          Font.Pitch = fpVariable
          Font.Style = []
          ItemHeight = 15
          Items.Strings = (
            '1 - Administrativo'
            '2 - Judici'#225'rio')
          ParentFont = False
          TabOrder = 0
          ItemValues.Strings = (
            '1'
            '2')
        end
      end
      object gbxnrproc: TGroupBox
        Left = 9
        Top = 79
        Width = 234
        Height = 36
        Hint = 'Informar o n'#250'mero do processo administrativo/judicial.'
        Caption = 'Nr. Processo Administrativo'
        TabOrder = 2
        object edtnrproc: TDBAdvEdit
          Left = 3
          Top = 12
          Width = 227
          Height = 21
          Hint = 'Informar o n'#250'mero do processo administrativo/judicial'
          FocusColor = 13691903
          DisabledBorder = False
          DisabledColor = clWindow
          ReturnIsTab = True
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          TabOrder = 0
          Visible = True
          Version = '2.9.3.1'
          DataField = 'nrproc'
          DataSource = dtmProcessosJudiciaisReinf.dsrProcessoJudicialReinf
        end
      end
      object gbxindautoria: TGroupBox
        Left = 9
        Top = 117
        Width = 232
        Height = 36
        Hint = 'Indicativo da autoria da a'#231#227'o judicial:'
        Caption = 'Indicativo da autoria da a'#231#227'o judicial'
        TabOrder = 3
        object dmbindautoria: TDBMaplistCombobox
          Left = 4
          Top = 11
          Width = 225
          Height = 23
          Hint = 'Indicativo da autoria da a'#231#227'o judicial:'
          Style = csDropDownList
          DataField = 'indautoria'
          DataSource = dtmProcessosJudiciaisReinf.dsrProcessoJudicialReinf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Aria6'
          Font.Pitch = fpVariable
          Font.Style = []
          ItemHeight = 15
          Items.Strings = (
            '1 - Pr'#243'prio contribuinte'
            '2 - Outra entidade ou empresa')
          ParentFont = False
          TabOrder = 0
          ItemValues.Strings = (
            '1'
            '2')
        end
      end
      object gbxinivalid: TGroupBox
        Left = 10
        Top = 155
        Width = 93
        Height = 38
        Caption = 'Validade Inicial'
        TabOrder = 4
        object edtinivalid: TDBEditmesano
          Left = 4
          Top = 13
          Width = 82
          Height = 21
          Alignment = taLeftJustify
          DataField = 'inivalid'
          DataSource = dtmProcessosJudiciaisReinf.dsrProcessoJudicialReinf
          MaxLength = -1
          Maximo = 0
          Minimo = 37353
          Adicional = 0
          TabOrder = 0
          Opcional = True
        end
      end
      object gbxfimvalid: TGroupBox
        Left = 106
        Top = 155
        Width = 93
        Height = 38
        Caption = 'Validade Final'
        TabOrder = 5
        object edtfimvalid: TDBEditmesano
          Left = 4
          Top = 13
          Width = 82
          Height = 21
          Alignment = taLeftJustify
          DataField = 'fimvalid'
          DataSource = dtmProcessosJudiciaisReinf.dsrProcessoJudicialReinf
          MaxLength = -1
          Maximo = 0
          Minimo = 37353
          Adicional = 0
          TabOrder = 0
          Opcional = True
        end
      end
      object gbxObservacoes: TGroupBox
        Left = 253
        Top = 87
        Width = 705
        Height = 113
        Caption = 'Observa'#231#245'es'
        TabOrder = 6
        object mmoObservacoesSuspensaoExibilidadeTributos: TtecDBMemo
          Left = 2
          Top = 15
          Width = 701
          Height = 96
          Align = alClient
          DataField = 'observacoes'
          DataSource = dtmProcessosJudiciaisReinf.dsrProcessoJudicialReinf
          TabOrder = 0
        end
      end
      object DBAdvEdit2: TDBAdvEdit
        Left = 704
        Top = 0
        Width = 241
        Height = 19
        TabStop = False
        EditAlign = eaCenter
        EmptyText = ' '
        FocusColor = clBtnFace
        DisabledColor = clBtnFace
        LabelPosition = lpTopLeft
        LabelTransparent = True
        LabelAlwaysEnabled = True
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'MS Sans Serif'
        LabelFont.Style = []
        Lookup.Separator = ';'
        BorderStyle = bsNone
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
        Visible = True
        Version = '2.9.3.1'
        DataField = 'sdatahoraalteracao'
        DataSource = dtmProcessosJudiciaisReinf.dsrProcessoJudicialReinf
      end
      object DBAdvEdit1: TDBAdvEdit
        Left = 704
        Top = 21
        Width = 241
        Height = 19
        TabStop = False
        EditAlign = eaCenter
        EmptyText = ' '
        FocusColor = clBtnFace
        DisabledColor = clBtnFace
        LabelPosition = lpTopLeft
        LabelTransparent = True
        LabelAlwaysEnabled = True
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'MS Sans Serif'
        LabelFont.Style = []
        Lookup.Separator = ';'
        BorderStyle = bsNone
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
        Visible = True
        Version = '2.9.3.1'
        DataField = 'sdatahoraexclusao'
        DataSource = dtmProcessosJudiciaisReinf.dsrProcessoJudicialReinf
      end
      object pnlBarraReinf: TPanel
        Left = 0
        Top = 456
        Width = 977
        Height = 24
        Align = alBottom
        TabOrder = 10
        object Bevel1: TBevel
          Left = 973
          Top = 1
          Width = 3
          Height = 22
          Align = alRight
        end
        object lblCopiar: TLabel
          Left = 24
          Top = 5
          Width = 121
          Height = 14
          Caption = 'REGISTRO CANCELADO '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object shCopiar: TShape
          Left = 9
          Top = 7
          Width = 11
          Height = 11
          Brush.Color = clRed
          Pen.Width = 0
        end
        object DBAdvEdit3: TDBAdvEdit
          Left = 149
          Top = 4
          Width = 212
          Height = 17
          TabStop = False
          EditAlign = eaCenter
          EmptyText = ' '
          FocusColor = clBtnFace
          DisabledColor = clBtnFace
          LabelPosition = lpTopLeft
          LabelTransparent = True
          LabelAlwaysEnabled = True
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Separator = ';'
          BorderStyle = bsNone
          Color = clBtnFace
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Visible = True
          Version = '2.9.3.1'
          DataField = 'sdatahoraexclusao'
          DataSource = dtmProcessosJudiciaisReinf.dsrSuspensaoExibilidadeTributos
        end
      end
      object pnlOpcoesSuspensaoExibilidadeTributos: TPanel
        Left = 952
        Top = 195
        Width = 25
        Height = 260
        TabOrder = 9
        object sbnIncluirProduto: TSpeedButton
          Left = -1
          Top = 2
          Width = 23
          Height = 21
          Hint = 'Incluir produto no contrato'
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
          Left = -1
          Top = 24
          Width = 23
          Height = 21
          Hint = 'Excluir produto no contrato'
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
      object gbxSuspensaoExibilidadeTributos: TGroupBox
        Left = 10
        Top = 194
        Width = 943
        Height = 263
        Caption = 'Suspens'#227'o da Exibilidade de Tributos'
        TabOrder = 11
        object dbgSuspensaoExibilidadeTributos: TDBAdvGrid
          Left = 2
          Top = 15
          Width = 939
          Height = 246
          Cursor = crDefault
          Align = alClient
          ColCount = 9
          Constraints.MaxHeight = 246
          Constraints.MinHeight = 246
          RowCount = 2
          FixedRows = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = []
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs]
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 0
          OnDrawCell = dbgSuspensaoExibilidadeTributosDrawCell
          OnGetCellColor = dbgSuspensaoExibilidadeTributosGetCellColor
          OnCanAddRow = dbgSuspensaoExibilidadeTributosCanAddRow
          OnGetEditorType = dbgSuspensaoExibilidadeTributosGetEditorType
          HintShowCells = True
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'Tahoma'
          ActiveCellFont.Style = [fsBold]
          ActiveCellColor = 15387318
          AutoNumAlign = True
          AutoThemeAdapt = True
          Bands.Active = True
          ControlLook.FixedGradientFrom = clWhite
          ControlLook.FixedGradientTo = clSilver
          ControlLook.FixedGradientHoverFrom = 13619409
          ControlLook.FixedGradientHoverTo = 12502728
          ControlLook.FixedGradientHoverMirrorFrom = 12502728
          ControlLook.FixedGradientHoverMirrorTo = 11254975
          ControlLook.FixedGradientDownFrom = 8816520
          ControlLook.FixedGradientDownTo = 7568510
          ControlLook.FixedGradientDownMirrorFrom = 7568510
          ControlLook.FixedGradientDownMirrorTo = 6452086
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
          IntegralHeight = True
          Look = glTMS
          Navigation.AllowInsertRow = True
          Navigation.AdvanceOnEnterLoop = False
          Navigation.AdvanceInsert = True
          Navigation.InsertPosition = pInsertAfter
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
          SearchFooter.ColorTo = 15790320
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
          SizeWithForm = True
          SortSettings.Show = True
          Version = '2.3.2.2'
          AutoCreateColumns = True
          AutoRemoveColumns = True
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
              ComboItems.Strings = (
                '')
              FieldName = 'codsusp'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'C'#243'digo da Suspens'#227'o'
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
              UseLookupEditor = False
              Width = 114
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              Editor = edCustom
              FieldName = 's_indsusp'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'Indicativo da Suspens'#227'o'
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
              Width = 312
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              FieldName = 'dtdecisao'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'Data da Decis'#227'o'
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
              Width = 88
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              ComboItems.Strings = (
                'Sim'
                'N'#227'o')
              Editor = edComboList
              FieldName = 'inddeposito'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'Montante Integral'
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
              Width = 54
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              Editor = edCustom
              FieldName = 'ufvara'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'UF Vara'
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
              UseLookupEditor = False
              Width = 59
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              Editor = edCustom
              FieldName = 'ibge_nomecidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'Munic'#237'pio'
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
              Width = 211
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              FieldName = 'datahoraexclusao'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
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
              Width = 0
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              FieldName = 'idvara'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'Ident. Vara'
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
              Width = 58
            end>
          DataSource = dtmProcessosJudiciaisReinf.dsrSuspensaoExibilidadeTributos
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
          ShowBooleanFields = True
          ShowPictureFields = True
          ShowUnicode = False
          UseDBFieldWidths = True
          PostOnEnter = False
          ColWidths = (
            20
            114
            312
            88
            54
            59
            211
            0
            58)
        end
      end
    end
    object tstEnvioReinfs: TTabSheet
      Caption = 'Enviados '
      ImageIndex = 1
      object gbxEnvio_Processos: TGroupBox
        Left = 0
        Top = 0
        Width = 977
        Height = 217
        Align = alClient
        Caption = 'Envio Processos Judiciais'
        TabOrder = 0
        object dbgEnvio_Processos: TDBAdvGrid
          Left = 2
          Top = 15
          Width = 973
          Height = 200
          Cursor = crDefault
          Align = alClient
          ColCount = 9
          RowCount = 2
          FixedRows = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 0
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'Tahoma'
          ActiveCellFont.Style = [fsBold]
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
              Fixed = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
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
              Width = 20
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              FieldName = 'numero'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'N'#250'mero'
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWindowText
              HeaderFont.Height = -11
              HeaderFont.Name = 'Tahoma'
              HeaderFont.Pitch = fpVariable
              HeaderFont.Style = []
              HeaderAlignment = taCenter
              PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
              PrintFont.Charset = DEFAULT_CHARSET
              PrintFont.Color = clWindowText
              PrintFont.Height = -11
              PrintFont.Name = 'Tahoma'
              PrintFont.Pitch = fpVariable
              PrintFont.Style = []
              Width = 78
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              FieldName = 'datahoraprocessamento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'Data/Hora Processamento'
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWindowText
              HeaderFont.Height = -11
              HeaderFont.Name = 'Tahoma'
              HeaderFont.Pitch = fpVariable
              HeaderFont.Style = []
              HeaderAlignment = taCenter
              PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
              PrintFont.Charset = DEFAULT_CHARSET
              PrintFont.Color = clWindowText
              PrintFont.Height = -11
              PrintFont.Name = 'Tahoma'
              PrintFont.Pitch = fpVariable
              PrintFont.Style = []
              Width = 173
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              FieldName = 's_operacao'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'Opera'#231#227'o'
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWindowText
              HeaderFont.Height = -11
              HeaderFont.Name = 'Tahoma'
              HeaderFont.Pitch = fpVariable
              HeaderFont.Style = []
              HeaderAlignment = taCenter
              PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
              PrintFont.Charset = DEFAULT_CHARSET
              PrintFont.Color = clWindowText
              PrintFont.Height = -11
              PrintFont.Name = 'Tahoma'
              PrintFont.Pitch = fpVariable
              PrintFont.Style = []
              Width = 103
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              FieldName = 's_tpproc'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'Tipo de Processo'
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWindowText
              HeaderFont.Height = -11
              HeaderFont.Name = 'Tahoma'
              HeaderFont.Pitch = fpVariable
              HeaderFont.Style = []
              HeaderAlignment = taCenter
              PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
              PrintFont.Charset = DEFAULT_CHARSET
              PrintFont.Color = clWindowText
              PrintFont.Height = -11
              PrintFont.Name = 'Tahoma'
              PrintFont.Pitch = fpVariable
              PrintFont.Style = []
              Width = 272
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              FieldName = 'nrproc'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'Nr. Processo Administrativo'
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWindowText
              HeaderFont.Height = -11
              HeaderFont.Name = 'Tahoma'
              HeaderFont.Pitch = fpVariable
              HeaderFont.Style = []
              HeaderAlignment = taCenter
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
              FieldName = 's_indautoria'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'Indicativo da autoria da a'#231#227'o judicial'
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWindowText
              HeaderFont.Height = -11
              HeaderFont.Name = 'Tahoma'
              HeaderFont.Pitch = fpVariable
              HeaderFont.Style = []
              HeaderAlignment = taCenter
              PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
              PrintFont.Charset = DEFAULT_CHARSET
              PrintFont.Color = clWindowText
              PrintFont.Height = -11
              PrintFont.Name = 'Tahoma'
              PrintFont.Pitch = fpVariable
              PrintFont.Style = []
              Width = 111
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              FieldName = 'inivalid'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'Validade Inicial'
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWindowText
              HeaderFont.Height = -11
              HeaderFont.Name = 'Tahoma'
              HeaderFont.Pitch = fpVariable
              HeaderFont.Style = []
              HeaderAlignment = taCenter
              PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
              PrintFont.Charset = DEFAULT_CHARSET
              PrintFont.Color = clWindowText
              PrintFont.Height = -11
              PrintFont.Name = 'Tahoma'
              PrintFont.Pitch = fpVariable
              PrintFont.Style = []
              Width = 79
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              FieldName = 'fimvalid'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'Validade Final'
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWindowText
              HeaderFont.Height = -11
              HeaderFont.Name = 'Tahoma'
              HeaderFont.Pitch = fpVariable
              HeaderFont.Style = []
              HeaderAlignment = taCenter
              PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
              PrintFont.Charset = DEFAULT_CHARSET
              PrintFont.Color = clWindowText
              PrintFont.Height = -11
              PrintFont.Name = 'Tahoma'
              PrintFont.Pitch = fpVariable
              PrintFont.Style = []
              Width = 91
            end>
          DataSource = dtmProcessosJudiciaisReinf.dsrEnvio_ProcessoJudicialReinf
          PageMode = False
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
          ColWidths = (
            20
            78
            173
            103
            272
            95
            111
            79
            91)
        end
      end
      object gbxEnvio_SuspensaoExibilidadeTributos: TGroupBox
        Left = 0
        Top = 217
        Width = 977
        Height = 263
        Align = alBottom
        Caption = 'Envio Suspens'#227'o da Exibilidade de Tributos'
        TabOrder = 1
        object dbgEnvio_SuspensaoExibilidadeTributos: TDBAdvGrid
          Left = 2
          Top = 15
          Width = 973
          Height = 246
          Cursor = crDefault
          Align = alClient
          ColCount = 9
          Constraints.MaxHeight = 246
          Constraints.MinHeight = 246
          RowCount = 2
          FixedRows = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = []
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs]
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 0
          OnDrawCell = dbgSuspensaoExibilidadeTributosDrawCell
          OnGetCellColor = dbgEnvio_SuspensaoExibilidadeTributosGetCellColor
          HintShowCells = True
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'Tahoma'
          ActiveCellFont.Style = [fsBold]
          ActiveCellColor = 15387318
          AutoNumAlign = True
          Bands.Active = True
          ControlLook.FixedGradientFrom = clWhite
          ControlLook.FixedGradientTo = clSilver
          ControlLook.FixedGradientHoverFrom = 13619409
          ControlLook.FixedGradientHoverTo = 12502728
          ControlLook.FixedGradientHoverMirrorFrom = 12502728
          ControlLook.FixedGradientHoverMirrorTo = 11254975
          ControlLook.FixedGradientDownFrom = 8816520
          ControlLook.FixedGradientDownTo = 7568510
          ControlLook.FixedGradientDownMirrorFrom = 7568510
          ControlLook.FixedGradientDownMirrorTo = 6452086
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
          IntegralHeight = True
          Look = glTMS
          Navigation.AllowInsertRow = True
          Navigation.AdvanceOnEnterLoop = False
          Navigation.AdvanceInsert = True
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
          SearchFooter.ColorTo = 15790320
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
          SizeWithForm = True
          SortSettings.Show = True
          Version = '2.3.2.2'
          AutoCreateColumns = False
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
              FieldName = 'codsusp'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'C'#243'digo da Suspens'#227'o'
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWindowText
              HeaderFont.Height = -11
              HeaderFont.Name = 'Tahoma'
              HeaderFont.Pitch = fpVariable
              HeaderFont.Style = []
              HeaderAlignment = taCenter
              PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
              PrintFont.Charset = DEFAULT_CHARSET
              PrintFont.Color = clWindowText
              PrintFont.Height = -11
              PrintFont.Name = 'Tahoma'
              PrintFont.Pitch = fpVariable
              PrintFont.Style = []
              Width = 109
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              FieldName = 's_indsusp'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'Indicativo da Suspens'#227'o'
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWindowText
              HeaderFont.Height = -11
              HeaderFont.Name = 'Tahoma'
              HeaderFont.Pitch = fpVariable
              HeaderFont.Style = []
              HeaderAlignment = taCenter
              PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
              PrintFont.Charset = DEFAULT_CHARSET
              PrintFont.Color = clWindowText
              PrintFont.Height = -11
              PrintFont.Name = 'Tahoma'
              PrintFont.Pitch = fpVariable
              PrintFont.Style = []
              Width = 260
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              FieldName = 'dtdecisao'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'Data da Decis'#227'o'
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWindowText
              HeaderFont.Height = -11
              HeaderFont.Name = 'Tahoma'
              HeaderFont.Pitch = fpVariable
              HeaderFont.Style = []
              HeaderAlignment = taCenter
              PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
              PrintFont.Charset = DEFAULT_CHARSET
              PrintFont.Color = clWindowText
              PrintFont.Height = -11
              PrintFont.Name = 'Tahoma'
              PrintFont.Pitch = fpVariable
              PrintFont.Style = []
              Width = 85
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              FieldName = 'inddeposito'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'Montante Integral'
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWindowText
              HeaderFont.Height = -11
              HeaderFont.Name = 'Tahoma'
              HeaderFont.Pitch = fpVariable
              HeaderFont.Style = []
              HeaderAlignment = taCenter
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
              FieldName = 'ufvara'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'UF Vara'
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWindowText
              HeaderFont.Height = -11
              HeaderFont.Name = 'Tahoma'
              HeaderFont.Pitch = fpVariable
              HeaderFont.Style = []
              HeaderAlignment = taCenter
              PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
              PrintFont.Charset = DEFAULT_CHARSET
              PrintFont.Color = clWindowText
              PrintFont.Height = -11
              PrintFont.Name = 'Tahoma'
              PrintFont.Pitch = fpVariable
              PrintFont.Style = []
              Width = 44
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              FieldName = 'ibge_nomecidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'Munic'#237'pio'
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWindowText
              HeaderFont.Height = -11
              HeaderFont.Name = 'Tahoma'
              HeaderFont.Pitch = fpVariable
              HeaderFont.Style = []
              HeaderAlignment = taCenter
              PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
              PrintFont.Charset = DEFAULT_CHARSET
              PrintFont.Color = clWindowText
              PrintFont.Height = -11
              PrintFont.Name = 'Tahoma'
              PrintFont.Pitch = fpVariable
              PrintFont.Style = []
              Width = 142
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              FieldName = 'idvara'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'Ident. Vara'
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWindowText
              HeaderFont.Height = -11
              HeaderFont.Name = 'Tahoma'
              HeaderFont.Pitch = fpVariable
              HeaderFont.Style = []
              HeaderAlignment = taCenter
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
              FieldName = 'datahoraexclusao'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'Data/Hora da Exclus'#227'o'
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWindowText
              HeaderFont.Height = -11
              HeaderFont.Name = 'Tahoma'
              HeaderFont.Pitch = fpVariable
              HeaderFont.Style = []
              HeaderAlignment = taCenter
              PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
              PrintFont.Charset = DEFAULT_CHARSET
              PrintFont.Color = clWindowText
              PrintFont.Height = -11
              PrintFont.Name = 'Tahoma'
              PrintFont.Pitch = fpVariable
              PrintFont.Style = []
              Width = 124
            end>
          DataSource = dtmProcessosJudiciaisReinf.dsrEnvio_SuspensaoExibilidadeTributos
          EditPostMode = epRow
          PageMode = False
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
          ShowBooleanFields = True
          ShowPictureFields = True
          ShowUnicode = False
          UseDBFieldWidths = True
          PostOnEnter = False
          ColWidths = (
            20
            109
            260
            85
            95
            44
            142
            64
            124)
        end
      end
    end
  end
  object FormControlEditLink1: TFormControlEditLink
    Tag = 0
    AutoPopupWidth = False
    EditStyle = esInplace
    PopupWidth = 100
    PopupHeight = 100
    WantKeyLeftRight = True
    WantKeyUpDown = True
    WantKeyHomeEnd = True
    WantKeyPriorNext = True
    WantKeyReturn = True
    WantKeyEscape = True
    OnSetEditorFocus = FormControlEditLink1SetEditorFocus
    Left = 656
    Top = 48
  end
end
