inherited frmEncerramentoExercicio: TfrmEncerramentoExercicio
  Left = 409
  Top = 201
  ActiveControl = fraConsultaFilial
  BorderStyle = bsSingle
  Caption = 'Zerar Contas de Resultado'
  ClientHeight = 209
  ClientWidth = 702
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 0
    Top = 45
    Width = 702
    Height = 164
    Align = alClient
    Visible = True
    inherited bvlBotoesEd: TBevel
      Left = 1
      Top = 150
      Width = 700
      Height = 0
      Align = alTop
    end
    object gbxContaResultadoSintetica: TGroupBox
      Left = 1
      Top = 38
      Width = 700
      Height = 38
      Align = alTop
      Caption = 'CONTAS CUJOS SALDOS SER'#195'O ZERADOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      inline fraConsultaContaResultadoSintetica: TfraConsultaCodigoContabil
        Left = 2
        Top = 10
        Width = 503
        Height = 25
        HorzScrollBar.Range = 502
        VertScrollBar.Range = 24
        AutoScroll = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        inherited sbnProcura: TSpeedButton
          Top = 1
          Font.Height = -13
        end
        inherited dtxDescricao: TtecDBText
          Top = 1
          Width = 414
          DataField = 'descricao'
          DataSource = fraConsultaContaResultadoSintetica.dsrProcuraDebitar
        end
        inherited edfCodigo: TtecDBFindLookup
          Top = 1
          DataField = 'codigo'
          DataSource = fraConsultaContaResultadoSintetica.dsrProcuraDebitar
          Group = 'debitar'
          MaxLength = 6
          OnExit = fraConsultaContaResultadoSinteticaedfCodigoExit
          OnFound = nil
          Operacao = opPESQUISA
          Parameter = 'codigo'
          ActiveSetControls = False
          DenyInsert = True
          NoSetControls = <>
          SetControls = <>
        end
      end
      object dtxClassificacaoContaResultadoSintetica: TtecDBText
        Left = 505
        Top = 10
        Width = 192
        Height = 23
        TabStop = False
        Color = clBtnFace
        DataField = 'classificacao'
        DataSource = fraConsultaContaResultadoSintetica.dsrProcuraDebitar
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
    object gbxContaResultadoAnalitica: TGroupBox
      Left = 1
      Top = 76
      Width = 700
      Height = 38
      Align = alTop
      Caption = 'RESULTADO DO EXERC'#205'CIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object dtxClassificacaoContaResultadoAnalitica: TtecDBText
        Left = 505
        Top = 12
        Width = 192
        Height = 23
        TabStop = False
        Color = clBtnFace
        DataField = 'classificacao'
        DataSource = fraConsultaContaResultadoAnalitica.dsrProcuraCreditar
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
      inline fraConsultaContaResultadoAnalitica: TfraConsultaCodigoContabil
        Left = 3
        Top = 12
        Width = 503
        Height = 23
        HorzScrollBar.Range = 502
        VertScrollBar.Range = 23
        AutoScroll = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        inherited sbnProcura: TSpeedButton
          Top = -2
          Height = 23
          Font.Height = -13
        end
        inherited dtxDescricao: TtecDBText
          Top = -1
          Width = 414
          DataField = 'descricao'
          DataSource = fraConsultaContaResultadoAnalitica.dsrProcuraCreditar
        end
        inherited edfCodigo: TtecDBFindLookup
          Top = -1
          DataField = 'codigo'
          DataSource = fraConsultaContaResultadoAnalitica.dsrProcuraCreditar
          Group = 'Creditar'
          MaxLength = 6
          OnExit = fraConsultaContaResultadoAnaliticaedfCodigoExit
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
    object gbxHistorico: TGroupBox
      Left = 1
      Top = 114
      Width = 700
      Height = 36
      Align = alTop
      Caption = 'HIST'#211'RICO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      inline fraConsultaHistorico: TfraConsultaCodigoContabil
        Left = 3
        Top = 10
        Width = 695
        Height = 37
        HorzScrollBar.Range = 694
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
        inherited sbnProcura: TSpeedButton
          Top = 1
          Font.Height = -13
        end
        inherited dtxDescricao: TtecDBText
          Width = 606
          DataField = 'descricao'
          DataSource = fraConsultaHistorico.dsrProcuraHistorico
        end
        inherited edfCodigo: TtecDBFindLookup
          DataField = 'codigo'
          DataSource = fraConsultaHistorico.dsrProcuraHistorico
          Group = 'Historico'
          MaxLength = 6
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
    object pnlFilialMes: TPanel
      Left = 1
      Top = 1
      Width = 700
      Height = 37
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object gbxFilial: TGroupBox
        Left = 0
        Top = 0
        Width = 502
        Height = 37
        Align = alLeft
        Caption = 'FILIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        inline fraConsultaFilial: TfraConsultaCodigo
          Left = 2
          Top = 10
          Width = 499
          Height = 25
          HorzScrollBar.Range = 499
          VertScrollBar.Range = 24
          AutoScroll = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          inherited sbnProcura: TSpeedButton
            Top = 1
            Font.Height = -13
          end
          inherited dtxDescricao: TtecDBText
            Top = 1
            Width = 411
            DataField = 'nome'
            DataSource = fraConsultaFilial.dsrProcuraFiliais
          end
          inherited edfCodigo: TtecDBFindLookup
            Top = 1
            DataField = 'codigo'
            DataSource = fraConsultaFilial.dsrProcuraFiliais
            Group = 'filial'
            MaxLength = 3
            OnExit = fraConsultaFilialedfCodigoExit
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
      object gbxMes: TGroupBox
        Left = 502
        Top = 0
        Width = 73
        Height = 37
        Align = alLeft
        Caption = 'M'#202'S'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object edtMesAno: TEditMesAno
          Left = 2
          Top = 10
          Width = 68
          Height = 23
          EditMask = '99/9999;1; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 7
          ParentFont = False
          TabOrder = 0
          Text = '  /    '
          OnExit = edtMesAnoExit
        end
      end
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 702
    inherited tblBarra: TToolBar
      Left = 150
      Width = 552
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
    end
    inherited tblBarraCadastro: TToolBar
      Width = 150
      object sbnGerar: TSpeedButton
        Left = 0
        Top = 2
        Width = 75
        Height = 35
        Hint = 'Selecionar duplicatas'
        Caption = 'Gerar F5'
        Enabled = False
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
      object sbnExcluir: TSpeedButton
        Left = 75
        Top = 2
        Width = 75
        Height = 35
        Hint = 'Exclui o Registro Atual'
        Caption = 'Excluir F6'
        Enabled = False
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
        Layout = blGlyphTop
        NumGlyphs = 2
        Spacing = 0
        OnClick = sbnExcluirClick
      end
    end
  end
end
