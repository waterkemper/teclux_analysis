inherited frmRelatorioChequesVencimentos: TfrmRelatorioChequesVencimentos
  Left = 331
  Top = 168
  ActiveControl = edtInicioPeriodo
  Caption = 'Relat'#243'rio de cheques'
  ClientHeight = 523
  ClientWidth = 681
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TToolBar
    Width = 681
    Height = 46
    Constraints.MaxHeight = 46
    Constraints.MinHeight = 46
    inherited sbnAjuda: TSpeedButton
      Action = actHabilitar
    end
  end
  inherited pnlFundoJanela: TPanel
    Top = 46
    Width = 681
    Height = 477
    Align = alClient
    object gbxCheques: TGroupBox
      Left = 3
      Top = 3
      Width = 675
      Height = 471
      Align = alClient
      TabOrder = 0
      object gbxPeriodo: TGroupBox
        Left = 129
        Top = 17
        Width = 177
        Height = 36
        Caption = 'DATAS DE VENCIMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object lblA: TLabel
          Left = 85
          Top = 14
          Width = 7
          Height = 16
          Caption = 'a'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object edttermioPeriodo: TEditData
          Left = 99
          Top = 10
          Width = 75
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 1
          Minimo = 37353
          Maximo = 37353
        end
        object edtInicioPeriodo: TEditData
          Left = 2
          Top = 10
          Width = 75
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
          Minimo = 37353
          Maximo = 37353
        end
      end
      object pgcFilialGrupoFilial: TtecPageControl
        Left = 129
        Top = 92
        Width = 400
        Height = 53
        ActivePage = tstFilial
        TabOrder = 6
        OnChange = pgcFilialGrupoFilialChange
        object tstFilial: TTabSheet
          Caption = '    &Filial'
          object sbnConsultaFilial: TSpeedButton
            Left = 61
            Top = 0
            Width = 23
            Height = 23
            Hint = 'Procurar Filiais'
            Flat = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDC800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7FFFFFFFDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DC800000800000800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000
              00800000800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000008000
              00800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000008000008000
              00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFF
              FFFFDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCFFA858800000800000800000FFA858DCDCDC0000FF800000800000DCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDC
              DCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFDCDCDCDCDCDC7F
              7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
              FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
              FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDC7F7F7FDCDCDCFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
              FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000DCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
              FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
              FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000DCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
              FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
              FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFFFFFFFDCDCDCDCDCDCDC
              DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
              7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
            NumGlyphs = 2
            OnClick = sbnConsultaFilialClick
          end
          object edfFilial: TtecDbEditFind
            Left = -1
            Top = 0
            Width = 60
            Height = 23
            Alignment = taLeftJustify
            DataField = 'codigo'
            DataSource = dtmRelatorioChequesVencimentos.dsrFiliais
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Group = 'Filial'
            MaxLength = 3
            Maximo = 0
            Minimo = 37353
            Adicional = 0
            Opcional = True
            ParentFont = False
            TabOrder = 0
            PermitirZero = False
            PermitirNulo = False
            Operacao = opATRIBUICAO
            Parameter = 'codigo'
            ActiveSetControls = False
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
          end
          object dtxFilial: TtecDBText
            Left = 85
            Top = 1
            Width = 308
            Height = 23
            TabStop = False
            Color = clBtnFace
            DataField = 'nome'
            DataSource = dtmRelatorioChequesVencimentos.dsrFiliais
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
        object tstGrupoFilial: TTabSheet
          Caption = '    &Grupo Filial'
          ImageIndex = 1
          object sbnConsultaGrupoFilial: TSpeedButton
            Left = 61
            Top = 1
            Width = 23
            Height = 23
            Hint = 'Procurar grupos de filiais'
            Flat = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDC800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7FFFFFFFDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DC800000800000800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000
              00800000800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000008000
              00800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000008000008000
              00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFF
              FFFFDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCFFA858800000800000800000FFA858DCDCDC0000FF800000800000DCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDC
              DCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFDCDCDCDCDCDC7F
              7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
              FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
              FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDC7F7F7FDCDCDCFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
              FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000DCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
              FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
              FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000DCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
              FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
              FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFFFFFFFDCDCDCDCDCDCDC
              DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
              7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
            NumGlyphs = 2
            OnClick = sbnConsultaGrupoFilialClick
          end
          object edfGrupoFilial: TtecDbEditFind
            Left = 0
            Top = 0
            Width = 60
            Height = 23
            Alignment = taLeftJustify
            DataField = 'codigo'
            DataSource = dtmRelatorioChequesVencimentos.dsrGrupoFilial
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Group = 'GrupoFilial'
            MaxLength = 3
            Maximo = 0
            Minimo = 37353
            Adicional = 0
            Opcional = True
            ParentFont = False
            TabOrder = 0
            PermitirZero = False
            PermitirNulo = False
            Operacao = opATRIBUICAO
            Parameter = 'codigo'
            ActiveSetControls = False
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
          end
          object dtxGrupoFilial: TtecDBText
            Left = 85
            Top = 1
            Width = 308
            Height = 23
            TabStop = False
            Color = clBtnFace
            DataField = 'descricao'
            DataSource = dtmRelatorioChequesVencimentos.dsrGrupoFilial
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
      end
      object gbxTipoCheque: TGroupBox
        Left = 6
        Top = 168
        Width = 115
        Height = 94
        Caption = 'TIPO DE CHEQUE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object rbnAmbos: TRadioButton
          Left = 9
          Top = 22
          Width = 65
          Height = 17
          Caption = 'Ambos'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TabStop = True
        end
        object rbnVista: TRadioButton
          Left = 9
          Top = 46
          Width = 63
          Height = 17
          Caption = 'A vista'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object rbnPrazo: TRadioButton
          Left = 9
          Top = 69
          Width = 96
          Height = 17
          Caption = 'Pr'#233'-datado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
      object gbxTipoRelatorio: TGroupBox
        Left = 6
        Top = 17
        Width = 115
        Height = 128
        Caption = 'SITUA'#199#195'O CHEQUE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object rbnVencimentos: TRadioButton
          Left = 5
          Top = 13
          Width = 80
          Height = 17
          Caption = 'A vencer'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TabStop = True
          OnClick = rbnVencimentosClick
        end
        object rbnRecebimentos: TRadioButton
          Left = 5
          Top = 35
          Width = 85
          Height = 17
          Caption = 'Recebidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = rbnRecebimentosClick
        end
        object rbnDevolucoes: TRadioButton
          Left = 5
          Top = 58
          Width = 86
          Height = 17
          Caption = 'Devolvidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = rbnDevolucoesClick
        end
        object rbnCancelados: TRadioButton
          Left = 5
          Top = 81
          Width = 93
          Height = 17
          Caption = 'Cancelados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = rbnCanceladosClick
        end
        object rbnInutilizados: TRadioButton
          Left = 5
          Top = 104
          Width = 93
          Height = 17
          Caption = 'Incobr'#225'veis'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = rbnInutilizadosClick
        end
      end
      object gbxComresgate: TGroupBox
        Left = 129
        Top = 168
        Width = 110
        Height = 94
        Caption = 'COM RESGATE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        object rbnNaoListar: TRadioButton
          Left = 9
          Top = 22
          Width = 96
          Height = 17
          Caption = 'N'#227'o listar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object rbnSoMenor: TRadioButton
          Left = 9
          Top = 46
          Width = 94
          Height = 17
          Caption = 'S'#243' se menor'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          TabStop = True
        end
        object rbnListarTudo: TRadioButton
          Left = 9
          Top = 69
          Width = 96
          Height = 17
          Caption = 'Listar tudo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
      object gbxConsiderar: TGroupBox
        Left = 248
        Top = 168
        Width = 147
        Height = 94
        Caption = 'CONSIDERAR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        object rbnPrimeiraDevolucao: TRadioButton
          Left = 9
          Top = 22
          Width = 132
          Height = 17
          Caption = 'S'#243' a 1'#176' devolu'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object rbnSegundaDevolucao: TRadioButton
          Left = 9
          Top = 46
          Width = 132
          Height = 17
          Caption = 'S'#243' a 2'#176' devolu'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object rbnAmbasSituacoes: TRadioButton
          Left = 9
          Top = 69
          Width = 131
          Height = 17
          Caption = 'Ambas as situa'#231#245'es'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          TabStop = True
        end
      end
      object gbxComRemessa: TGroupBox
        Left = 403
        Top = 168
        Width = 129
        Height = 94
        Caption = 'LISTAR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        object rbnListarRemessa: TRadioButton
          Left = 7
          Top = 22
          Width = 106
          Height = 17
          Caption = 'Com remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object rbnNaoListarRemessa: TRadioButton
          Left = 7
          Top = 46
          Width = 106
          Height = 17
          Caption = 'Sem remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object rbnListarTodasRemessa: TRadioButton
          Left = 7
          Top = 69
          Width = 106
          Height = 17
          Caption = 'Listar tudo'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          TabStop = True
        end
      end
      object gbxRelatorio: TGroupBox
        Left = 6
        Top = 269
        Width = 115
        Height = 65
        Caption = 'RELAT'#211'RIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object rbnAnalitico: TRadioButton
          Left = 9
          Top = 19
          Width = 96
          Height = 17
          Caption = 'Anal'#237'tico'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TabStop = True
        end
        object rbnSintetico: TRadioButton
          Left = 9
          Top = 40
          Width = 96
          Height = 17
          Caption = 'Sint'#233'tico'
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
      object gbxAgrupar: TGroupBox
        Left = 130
        Top = 269
        Width = 109
        Height = 65
        Caption = 'AGRUPAR POR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        object rbnTotalSinteticoVencto: TRadioButton
          Left = 5
          Top = 19
          Width = 99
          Height = 17
          Caption = 'Data vencto'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TabStop = True
        end
        object rbnTotalSinteticoEmissao: TRadioButton
          Left = 5
          Top = 40
          Width = 98
          Height = 17
          Caption = 'Data emiss'#227'o'
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
      object gbxSituacao: TGroupBox
        Left = 368
        Top = 18
        Width = 80
        Height = 36
        Caption = 'SITUA'#199#195'O EM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object edtSituacao: TEditData
          Left = 2
          Top = 10
          Width = 75
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
          Minimo = 37353
          Maximo = 37353
        end
      end
      object gbxObservacao: TGroupBox
        Left = 248
        Top = 270
        Width = 148
        Height = 41
        Caption = 'OBSERVA'#199#213'ES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        object ckbListarObs: TCheckBox
          Left = 4
          Top = 12
          Width = 142
          Height = 25
          Caption = 'Listar as observa'#231#245'es'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object gbxCobrador: TGroupBox
        Left = 6
        Top = 340
        Width = 382
        Height = 121
        Caption = ' COBRADORES '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 12
        inline fraSelecaoAleatoriaCobrador: TfraSelecaoAleatoria
          Left = 2
          Top = 16
          Width = 378
          Height = 103
          HorzScrollBar.Range = 26
          Align = alClient
          AutoScroll = False
          TabOrder = 0
          inherited Splitter1: TSplitter
            Left = 378
            Height = 88
          end
          inherited dbgSelecaoAleatoria: TtecDBGrid
            Width = 347
            Height = 88
            Font.Height = -12
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
            OnDblClick = fraSelecaoAleatoriaCobradordbgSelecaoAleatoriaDblClick
            OnKeyDown = fraSelecaoAleatoriaCobradordbgSelecaoAleatoriaKeyDown
          end
          inherited pnlLabels: TPanel
            Left = 347
            Height = 88
            inherited sbnProcura: TSpeedButton
              OnClick = fraSelecaoAleatoriaCobradorsbnProcuraClick
            end
          end
          inherited pnlAbaixo: TPanel
            Top = 88
            Width = 378
            Font.Pitch = fpVariable
            inherited lblOrientacao: TLabel
              Font.Pitch = fpVariable
            end
            inherited pnlAbaixoDireita: TPanel
              Left = 347
              Font.Pitch = fpVariable
            end
          end
          inherited qrySelecaoAleatoria: TtecQuery
            AfterOpen = fraSelecaoAleatoriaCobradorqrySelecaoAleatoriaAfterOpen
            Sql.Strings = (
              'Select u.codigo,'
              '              u.nome'
              
                'From  (usuarios u left join gruposusuarios gu on u.grupo=gu.codi' +
                'go)'
              'WHERE (u.cobranca or gu.cobrador)'
              '       and false')
          end
        end
      end
      object rgpCobrador: TRadioGroup
        Left = 539
        Top = 174
        Width = 129
        Height = 88
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          'Com Cobrador'
          'Sem Cobrador'
          'Ambos')
        ParentFont = False
        TabOrder = 13
      end
      inline fraOrdenacao1: TfraOrdenacao
        Left = 404
        Top = 265
        Width = 225
        Height = 107
        TabOrder = 15
        inherited gbxOrdenacao: TGroupBox
          Width = 225
          Height = 107
          Caption = 'ORDENA'#199#195'O'
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          ParentFont = False
          inherited HeaderControl1: THeaderControl
            Top = 14
            Width = 221
          end
          inherited pnlDireito: TPanel
            Left = 199
            Top = 16
            Height = 89
          end
          inherited dbgSelecao: TtecDBGrid
            Top = 16
            Width = 197
            Height = 89
            Font.Height = -12
            DefaultRowHeight = 19
          end
        end
        inherited qryLista: TtecQuery
          Sql.Strings = (
            'select cast('#39'BANCO E CHEQUE'#39' as varchar(50)) as CAMPODESCRICAO, '
            
              '           cast('#39'BANCO, AGENCIA, CONTA, CHEQUE'#39' as varchar(55)) ' +
              'as CAMPO,'
            '          cast('#39'ASC'#39' as varchar) as TIPO'
            'UNION ALL'
            'select cast('#39'NOME DO CLIENTE'#39' as varchar(50)) as CAMPODESCRICAO,'
            
              '           cast('#39'UPPER(TO_ASCII(vf.nome,'#39#39'LATIN1'#39#39')), cliente, t' +
              'ipocliente'#39' as varchar(55)) as CAMPO,'
            '          cast('#39'ASC'#39' as varchar) as TIPO'
            'UNION ALL'
            'select cast('#39'NOME DO TITULAR'#39' as varchar(50)) as CAMPODESCRICAO,'
            
              '           cast('#39'UPPER(TO_ASCII(titular,'#39#39'LATIN1'#39#39'))'#39' as varchar' +
              '(55)) as CAMPO,'
            '          cast('#39'ASC'#39' as varchar) as TIPO'
            'UNION ALL'
            'select cast('#39'DATA DE VENCTO'#39' as varchar(50)) as CAMPODESCRICAO,'
            '           cast('#39'VENCTO'#39' as varchar(55)) as CAMPO,'
            '          cast('#39'ASC'#39' as varchar) as TIPO'
            'UNION ALL'
            'select cast('#39'DATA DE EMISS'#195'O'#39' as varchar(50)) as CAMPODESCRICAO,'
            '           cast('#39'VENCTO'#39' as varchar(55)) as CAMPO,'
            '          cast('#39'ASC'#39' as varchar) as TIPO')
          inherited qryListacampo: TStringField
            DisplayWidth = 55
            Size = 55
          end
        end
      end
      object gbxCobrrador: TGroupBox
        Left = 539
        Top = 168
        Width = 129
        Height = 14
        Caption = 'COBRADOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 14
      end
      object gbxPeriodoDevolucao: TGroupBox
        Left = 129
        Top = 55
        Width = 177
        Height = 36
        Caption = 'DATAS DE DEVOLU'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Visible = False
        object Label1: TLabel
          Left = 85
          Top = 14
          Width = 7
          Height = 16
          Caption = 'a'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object edttermioDevolucao: TEditData
          Left = 99
          Top = 10
          Width = 75
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 1
          Minimo = 37353
          Maximo = 37353
        end
        object edtInicioDevolucao: TEditData
          Left = 2
          Top = 10
          Width = 75
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
          Minimo = 37353
          Maximo = 37353
        end
      end
    end
  end
  object aclHabilitar: TActionList
    Left = 168
    Top = 7
    object actHabilitar: TAction
      Caption = 'actHabilitar'
      OnUpdate = actHabilitarUpdate
    end
  end
end
