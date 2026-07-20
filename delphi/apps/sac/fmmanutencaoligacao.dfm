inherited frmManutencaoLigacao: TfrmManutencaoLigacao
  Left = 263
  Top = 200
  ActiveControl = edfFiltro
  Caption = 'Manuteção das Ligações'
  ClientHeight = 456
  ClientWidth = 573
  WindowState = wsMaximized
  PixelsPerInch = 75
  inherited pnlBarra: TPanel
    Width = 573
    inherited sbnAjuda: TSpeedButton
      Left = 75
    end
    inherited sbnIncluir: TSpeedButton
      Left = 228
      Visible = False
    end
    inherited sbnExcluir: TSpeedButton
      Left = 294
      Visible = False
    end
    inherited sbnSalvar: TSpeedButton
      Left = 360
      Visible = False
    end
    inherited sbnProcurar: TSpeedButton
      Left = 156
      Visible = False
    end
    inherited bvlBotoesEd: TBevel
      Left = 71
    end
    object sbnGerar: TSpeedButton
      Left = 4
      Top = 3
      Width = 65
      Height = 35
      Hint = 'Procura por um Registro na Tabela => F9'
      Caption = 'Gerar F6'
      Flat = True
      Glyph.Data = {
        3A060000424D3606000000000000360000002800000020000000100000000100
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 41
    Width = 579
    Height = 414
    BorderStyle = bsSingle
    Font.Color = clWindowText
    Font.Pitch = fpVariable
    Font.Style = []
    Font.Weight = 40
    ParentFont = False
    TabOrder = 1
    object gbxStatusLigacao: TGroupBox
      Left = 112
      Top = 4
      Width = 361
      Height = 89
      Caption = 'Status ligação'
      Font.Color = clWindowText
      Font.Pitch = fpVariable
      Font.Style = []
      Font.Weight = 40
      ParentFont = False
      TabOrder = 0
      object ckbNenhuma: TCheckBox
        Left = 9
        Top = 19
        Width = 96
        Height = 16
        Caption = '&Ligar - [ 0 ]'
        Font.Color = clWindowText
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        ParentFont = False
        TabOrder = 0
        OnClick = ckbNenhumaClick
      end
      object ckbIniciando: TCheckBox
        Left = 9
        Top = 39
        Width = 195
        Height = 16
        Caption = 'Completada &sem resposta - [ D ]'
        Font.Color = clWindowText
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        ParentFont = False
        TabOrder = 1
        OnClick = ckbNenhumaClick
      end
      object ckbReligando: TCheckBox
        Left = 223
        Top = 39
        Width = 95
        Height = 16
        Caption = '&Religar - [ R ]'
        Font.Color = clWindowText
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        ParentFont = False
        TabOrder = 4
        OnClick = ckbNenhumaClick
      end
      object ckbCancelado: TCheckBox
        Left = 223
        Top = 19
        Width = 115
        Height = 16
        Caption = 'Canc&elada - [ C ]'
        Font.Color = clWindowText
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        ParentFont = False
        TabOrder = 3
        OnClick = ckbNenhumaClick
      end
      object ckbAtendido: TCheckBox
        Left = 9
        Top = 60
        Width = 190
        Height = 16
        Caption = 'Completada c&om resposta - [ A ]'
        Font.Color = clWindowText
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        ParentFont = False
        TabOrder = 2
        OnClick = ckbNenhumaClick
      end
      object lblLigacao: TLabel
        Left = 223
        Top = 63
        Width = 31
        Height = 13
        Caption = 'Lig&ação'
        Enabled = False
        FocusControl = edtLigacao
        Font.Color = clWindowText
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        ParentFont = False
      end
      object edtLigacao: TEditNumero
        Left = 261
        Top = 59
        Width = 32
        Height = 21
        Enabled = False
        TabOrder = 5
        OnChange = edtLigacaoChange
        Decimais = False
        Negativo = False
        Tamanho = 0
      end
    end
    object dbgManutencaoLigacoes: TtecDBGrid
      Left = 5
      Top = 95
      Width = 568
      Height = 259
      DataSource = dtmManutencaoLigacao.dsrManutencaoLigacao
      TabOrder = 1
      TitleFont.Color = clWindowText
      TitleFont.Pitch = fpVariable
      TitleFont.Style = []
      TitleFont.Weight = 40
      OnDrawColumnCell = dbgManutencaoLigacoesDrawColumnCell
      OnDblClick = dbgManutencaoLigacoesDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'filtrosac'
          Title.Alignment = taCenter
          Title.Caption = 'Filtro'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cliente'
          Title.Alignment = taCenter
          Title.Caption = 'Cliente'
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'usuario'
          Title.Alignment = taCenter
          Title.Caption = 'Usuário'
          Width = 55
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'datahora'
          Title.Alignment = taCenter
          Title.Caption = 'Data'
          Width = 130
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'situacao'
          Title.Alignment = taCenter
          Title.Caption = 'Situação'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'contato'
          Title.Alignment = taCenter
          Title.Caption = 'Contato'
          Width = 93
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'religado'
          Title.Alignment = taCenter
          Title.Caption = 'Rel.'
          Width = 28
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'marcar'
          Title.Alignment = taCenter
          Title.Caption = 'Marcar'
          Width = 45
          Visible = True
        end>
    end
    object gbxSubstituirPor: TGroupBox
      Left = 477
      Top = 44
      Width = 96
      Height = 48
      Caption = 'Substituir por:'
      TabOrder = 2
      object sbnSubstituir: TSpeedButton
        Left = 64
        Top = 19
        Width = 22
        Height = 26
        Enabled = False
        Flat = True
        Glyph.Data = {
          3A060000424D3606000000000000360000002800000020000000100000000100
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
        NumGlyphs = 2
        OnClick = sbnSubstituirClick
      end
      object cmbSubstituirPor: TComboBox
        Left = 8
        Top = 18
        Width = 54
        Height = 21
        Enabled = False
        ItemHeight = 15
        Items.Strings = (
          '0'
          'D'
          'A'
          'R'
          'C')
        TabOrder = 0
      end
    end
    object lblLigar: TLabel
      Left = 116
      Top = 356
      Width = 29
      Height = 15
      Caption = 'Ligar:'
      Font.Color = clWindowText
      Font.Pitch = fpVariable
      Font.Style = []
      Font.Weight = 40
      ParentFont = False
    end
    object lblCompletadaSemResposta: TLabel
      Left = 11
      Top = 372
      Width = 134
      Height = 15
      Caption = 'Completada sem resposta:'
      Font.Color = clWindowText
      Font.Pitch = fpVariable
      Font.Style = []
      Font.Weight = 40
      ParentFont = False
    end
    object lblCompletadaComResposta: TLabel
      Left = 11
      Top = 389
      Width = 134
      Height = 15
      Caption = 'Completada com resposta:'
      Font.Color = clWindowText
      Font.Pitch = fpVariable
      Font.Style = []
      Font.Weight = 40
      ParentFont = False
    end
    object lblCancelada: TLabel
      Left = 311
      Top = 356
      Width = 56
      Height = 15
      Caption = 'Cancelada:'
      Font.Color = clWindowText
      Font.Pitch = fpVariable
      Font.Style = []
      Font.Weight = 40
      ParentFont = False
    end
    object lblReligar: TLabel
      Left = 328
      Top = 372
      Width = 39
      Height = 15
      Caption = 'Religar:'
      Font.Color = clWindowText
      Font.Pitch = fpVariable
      Font.Style = []
      Font.Weight = 40
      ParentFont = False
    end
    object dtxLigar: TtecDBText
      Left = 151
      Top = 356
      Width = 52
      Height = 15
      Alignment = taRightJustify
      DataField = 'qtdeligar'
      DataSource = dtmManutencaoLigacao.dsrTotaisManutencaoLigacao
      Font.Color = clWindowText
      Font.Pitch = fpVariable
      Font.Style = []
      Font.Weight = 40
      ParentFont = False
    end
    object dtxCompletadaSemResposta: TtecDBText
      Left = 151
      Top = 372
      Width = 52
      Height = 15
      Alignment = taRightJustify
      DataField = 'qtdediscando'
      DataSource = dtmManutencaoLigacao.dsrTotaisManutencaoLigacao
      Font.Color = clWindowText
      Font.Pitch = fpVariable
      Font.Style = []
      Font.Weight = 40
      ParentFont = False
    end
    object dtxCompletadaComResposta: TtecDBText
      Left = 151
      Top = 389
      Width = 52
      Height = 15
      Alignment = taRightJustify
      DataField = 'qtdeatendida'
      DataSource = dtmManutencaoLigacao.dsrTotaisManutencaoLigacao
      Font.Color = clWindowText
      Font.Pitch = fpVariable
      Font.Style = []
      Font.Weight = 40
      ParentFont = False
    end
    object dtxCancelada: TtecDBText
      Left = 375
      Top = 356
      Width = 52
      Height = 15
      Alignment = taRightJustify
      DataField = 'qtdecancelado'
      DataSource = dtmManutencaoLigacao.dsrTotaisManutencaoLigacao
      Font.Color = clWindowText
      Font.Pitch = fpVariable
      Font.Style = []
      Font.Weight = 40
      ParentFont = False
    end
    object dtxReligar: TtecDBText
      Left = 375
      Top = 372
      Width = 52
      Height = 15
      Alignment = taRightJustify
      DataField = 'qtdereligar'
      DataSource = dtmManutencaoLigacao.dsrTotaisManutencaoLigacao
      Font.Color = clWindowText
      Font.Pitch = fpVariable
      Font.Style = []
      Font.Weight = 40
      ParentFont = False
    end
    object gbxMarcar: TGroupBox
      Left = 477
      Top = 4
      Width = 95
      Height = 42
      Caption = 'Marcar'
      TabOrder = 13
      object ckbTodas: TCheckBox
        Left = 19
        Top = 16
        Width = 55
        Height = 18
        Caption = '&Todas'
        Enabled = False
        TabOrder = 0
        OnClick = ckbTodasClick
      end
    end
  end
  object gbxFiltro: TGroupBox
    Left = 7
    Top = 45
    Width = 101
    Height = 89
    Caption = 'Filtro'
    Font.Color = clWindowText
    Font.Pitch = fpVariable
    Font.Style = []
    Font.Weight = 40
    ParentFont = False
    TabOrder = 2
    object sbnFilial: TSpeedButton
      Left = 70
      Top = 22
      Width = 23
      Height = 26
      Flat = True
      Glyph.Data = {
        3A060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7FFFFFFFC3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
        C3800000800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000
        00800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000
        00800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000008000
        00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFF
        FFFFC3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3FFA858800000800000800000FFA858C3C3C30000FF800000800000C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3
        C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
        800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFC3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3C3C3C3C3C3C37F
        7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
        FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
        FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
        FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
        FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
        FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
        FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
        FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFFFFFFFC3C3C3C3C3C3C3
        C3C3FFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
        800000FFA858FFA858FFA858FFA858FFA858800000C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
        7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3FFA858800000800000800000FFA858C3C3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FC3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
      NumGlyphs = 2
      OnClick = sbnFilialClick
    end
    object edfFiltro: TtecDbEditFind
      Left = 6
      Top = 22
      Width = 61
      Height = 21
      DataField = 'numero'
      DataSource = dtmManutencaoLigacao.dsFiltrosSAC
      Group = 'filtro'
      MaxLength = 0
      OnFound = edfFiltroFound
      TabOrder = 0
      Parameter = 'numero'
      ActiveSetControls = True
      DenyInsert = True
      NoSetControls = <
        item
          Control = gbxFiltro
        end>
      SetControls = <
        item
          Control = GroupBox1
        end>
    end
  end
end
