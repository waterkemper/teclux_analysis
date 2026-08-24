object fraEstoquesFiliais: TfraEstoquesFiliais
  Left = 0
  Top = 0
  Width = 175
  Height = 221
  TabOrder = 0
  object dbgEstoquesFiliais: TtecDBGrid
    Left = 0
    Top = 0
    Width = 175
    Height = 221
    Align = alClient
    DataSource = dsrEstoquesFiliais
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'MS Shell Dlg'
    Font.Pitch = fpVariable
    Font.Style = []
    Font.Weight = 40
    ParentFont = False
    TabOrder = 0
    TitleFont.Color = clBlack
    TitleFont.Height = -9
    TitleFont.Name = 'MS Shell Dlg'
    TitleFont.Pitch = fpVariable
    TitleFont.Style = []
    TitleFont.Weight = 40
    OnKeyDown = dbgEstoquesFiliaisKeyDown
    RowWrap = 60
    Large = False
    DoubleRowColor = False
    TitleMinHeight = 100
    CellHeights = 100
    StrippedColor = 16054260
    CanDelete = False
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
  object dsrEstoquesFiliais: TtecDataSource
    OnStateChange = dsrEstoquesFiliaisStateChange
    OnDataChange = dsrEstoquesFiliaisDataChange
    OnUpdateData = dsrEstoquesFiliaisUpdateData
    Left = 16
    Top = 56
  end
end
