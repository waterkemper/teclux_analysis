inherited frmAtualizarMVAs: TfrmAtualizarMVAs
  Left = 655
  Top = 164
  ActiveControl = dbgAtualizarMVAs
  Caption = 'Atualizar MVAs'
  ClientHeight = 525
  ClientWidth = 923
  Constraints.MaxHeight = 556
  Constraints.MaxWidth = 935
  Constraints.MinHeight = 556
  Constraints.MinWidth = 935
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBarra: TPanel
    Left = 0
    Top = 462
    Width = 923
    Height = 0
    Align = alBottom
    inherited bvlBotoesEd: TBevel
      Left = 1
      Top = -1
      Width = 921
      Height = 0
      Align = alBottom
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 923
    inherited tblBarra: TToolBar
      Width = 698
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
  object dbgAtualizarMVAs: TtecDBGrid
    Left = 0
    Top = 40
    Width = 923
    Height = 422
    Align = alClient
    DataSource = dtmNCM.dsrProtocolosAtualizar
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -9
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Pitch = fpVariable
    TitleFont.Style = []
    OnDrawColumnCell = dbgAtualizarMVAsDrawColumnCell
    OnDblClick = dbgAtualizarMVAsDblClick
    OnKeyDown = dbgAtualizarMVAsKeyDown
    RowWrap = 60
    Large = False
    DoubleRowColor = True
    TitleMinHeight = 100
    CellHeights = 100
    StrippedColor = 16054260
    CanDelete = False
    PostOnEnter = False
    DenySort = False
    DefaultRowHeight = 19
    ExibirNumerodaLinha = False
    NaoAtribuirDadosaTabelaaoDigitar = False
    Columns = <
      item
        Expanded = False
        Width = 0
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'selecionar'
        Title.Alignment = taCenter
        Title.Caption = 'OK'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 40
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'protocolo'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'PROTOCOLO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AL'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AM'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AP'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BA'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CE'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DF'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GO'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MA'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MG'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MS'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MT'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PA'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PB'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PE'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PI'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PR'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RS'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RN'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RO'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RJ'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RR'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SP'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TO'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 25
        Visible = True
      end>
  end
  object pnlAtualizarMVAs: TPanel
    Left = 0
    Top = 462
    Width = 923
    Height = 63
    Align = alBottom
    TabOrder = 3
    object lblLegenda: TLabel
      Left = 615
      Top = 44
      Width = 225
      Height = 15
      Alignment = taCenter
      Caption = '[Ctrl Barra de Espa'#231'o] Marcar/Desmarcar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
    end
    object gbxAtualizarMVAs: TGroupBox
      Left = 1
      Top = 1
      Width = 921
      Height = 36
      Align = alTop
      Caption = ' DESCRI'#199#195'O DO PROTOCOLO '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object dtxnomeprotocolo: TtecDBText
        Left = 2
        Top = 10
        Width = 916
        Height = 23
        TabStop = False
        Color = clBtnFace
        DataField = 'nomeprotocolo'
        DataSource = dtmNCM.dsrProtocolosAtualizar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Alignment = taLeftJustify
      end
    end
    object ckbMarcarTodos: TCheckBox
      Left = 848
      Top = 44
      Width = 57
      Height = 17
      Caption = 'Todos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = ckbMarcarTodosClick
    end
  end
end
