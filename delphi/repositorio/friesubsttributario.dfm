object fraIESubstTributario: TfraIESubstTributario
  Left = 0
  Top = 0
  Width = 175
  Height = 221
  TabOrder = 0
  object dbgIESubstTributario: TtecDBGrid
    Left = 0
    Top = 0
    Width = 175
    Height = 221
    Align = alClient
    DataSource = dsrIESubstTributario
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'MS Shell Dlg'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Shell Dlg'
    TitleFont.Pitch = fpVariable
    TitleFont.Style = []
    OnKeyDown = dbgIESubstTributarioKeyDown
    RowWrap = 60
    Large = False
    DoubleRowColor = False
    TitleMinHeight = 100
    CellHeights = 100
    StrippedColor = 16054260
    CanDelete = False
    PostOnEnter = False
    DenySort = False
    Columns = <
      item
        Expanded = False
        FieldName = 'estado'
        Title.Alignment = taCenter
        Title.Caption = 'UF'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inscricaoestadual'
        Title.Alignment = taCenter
        Title.Caption = 'Inscri'#231#227'o Estadual'
        Width = 110
        Visible = True
      end>
  end
  object dsrIESubstTributario: TtecDataSource
    OnStateChange = dsrIESubstTributarioStateChange
    OnDataChange = dsrIESubstTributarioDataChange
    OnUpdateData = dsrIESubstTributarioUpdateData
    Left = 16
    Top = 56
  end
end
