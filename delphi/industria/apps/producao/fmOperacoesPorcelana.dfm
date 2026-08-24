inherited frmOperacoesPorcelana: TfrmOperacoesPorcelana
  Left = 709
  Top = 156
  Caption = 'Opera'#231#245'es com Porcelana'
  ClientHeight = 469
  ClientWidth = 605
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Helvetica'
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBarra: TPanel
    Left = 0
    Top = 195
    Width = 605
    Height = 0
    Align = alBottom
    inherited bvlBotoesEd: TBevel
      Left = 1
      Top = -1
      Width = 603
      Height = 0
      Align = alBottom
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 605
    inherited tblBarra: TToolBar
      Width = 380
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
    end
    inherited tblBarraCadastro: TToolBar
      inherited sbnIncluir: TSpeedButton
        Visible = False
      end
      inherited sbnExcluir: TSpeedButton
        Visible = False
      end
    end
  end
  object dbgOperacoes: TtecDBGrid
    Left = 8
    Top = 48
    Width = 585
    Height = 97
    DataSource = dtmOperacoesPorcelana.dsrOperacoes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -9
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Pitch = fpVariable
    TitleFont.Style = []
    RowWrap = 60
    Large = False
    DoubleRowColor = False
    TitleMinHeight = 100
    CellHeights = 100
    StrippedColor = 16054260
    CanDelete = False
    PostOnEnter = False
    DenySort = False
    DefaultRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'nome'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'c01'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 25
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'c02'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 25
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'c03'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Visible = True
      end>
  end
  object gbxOperador: TGroupBox
    Left = 8
    Top = 152
    Width = 586
    Height = 36
    Caption = ' OPERADOR '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    inline fraConsultaOperador: TfraConsultaCodigo
      Left = 2
      Top = 10
      Width = 581
      Height = 23
      HorzScrollBar.Range = 497
      VertScrollBar.Range = 23
      AutoScroll = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      inherited dtxDescricao: TtecDBText
        Width = 493
        DataField = 'nome'
        DataSource = fraConsultaOperador.dsrProcuraUsuarios
      end
      inherited edfCodigo: TtecDBFindLookup
        DataField = 'codigo'
        DataSource = fraConsultaOperador.dsrProcuraUsuarios
        Group = 'operador'
        MaxLength = 5
        OnChange = fraConsultaOperadoredfCodigoChange
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
  object gbxOSPsQueimadas: TGroupBox
    Left = 0
    Top = 195
    Width = 605
    Height = 274
    Align = alBottom
    Caption = ' OSP'#39's A IREM PARA O FORNO '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Helvetica'
    Font.Pitch = fpVariable
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object dbgOperacoesOSPUsuarios: TtecDBGrid
      Left = 0
      Top = 17
      Width = 305
      Height = 217
      DataSource = dtmOperacoesPorcelana.dsrConsultaOperacoesOSPUsuarios
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Pitch = fpVariable
      TitleFont.Style = []
      RowWrap = 60
      Large = False
      DoubleRowColor = False
      TitleMinHeight = 100
      CellHeights = 100
      StrippedColor = 16054260
      CanDelete = False
      PostOnEnter = False
      DenySort = False
      DefaultRowHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'osp'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -9
          Title.Font.Name = 'Helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lote'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -9
          Title.Font.Name = 'Helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -9
          Title.Font.Name = 'Helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ok'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -9
          Title.Font.Name = 'Helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 64
          Visible = True
        end>
    end
    object ckbMarcarTodos: TCheckBox
      Left = 131
      Top = 244
      Width = 173
      Height = 16
      Hint = 'Selecionar todas as osp'
      Caption = 'Marcar todos os OSP/Lotes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = ckbMarcarTodosClick
    end
  end
end
