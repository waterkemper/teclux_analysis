inherited frmAtendentes: TfrmAtendentes
  Left = 194
  Top = 182
  ActiveControl = dbgUsuarios
  Caption = 'Manuten'#231#227'o dos Atendentes'
  ClientHeight = 359
  ClientWidth = 657
  PixelsPerInch = 92
  inherited pnlBarra: TPanel
    Width = 657
    TabOrder = 2
    inherited bvlBotoesEd: TBevel
      Left = 211
      Visible = False
    end
  end
  inherited tblBarra: TToolBar
    Width = 657
    inherited sbnProcurar: TSpeedButton
      Left = 79
      Visible = False
    end
    inherited sbnAjuda: TSpeedButton
      Left = 4
    end
    inherited tbnDivisor: TToolButton
      Left = 154
    end
  end
  object dbgUsuarios: TtecDBGrid
    Left = 0
    Top = 44
    Width = 657
    Height = 315
    Align = alClient
    TabOrder = 0
    TitleFont.Color = clBlack
    Titlefont.height = -13
    TitleFont.Name = 'helvetica'
    TitleFont.Pitch = fpVariable
    TitleFont.Style = []
    OnDblClick = dbgUsuariosDblClick
    RowWrap = 60
    DoubleRowColor = False
    Columns = <
      item
        Expanded = False
        FieldName = 'codigo'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Alignment = taCenter
        Title.Caption = 'Nome'
        Width = 276
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'operador'
        Title.Alignment = taCenter
        Title.Caption = 'Operador'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inativo'
        Title.Alignment = taCenter
        Title.Caption = 'Inativo'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'filtrosac'
        Title.Alignment = taCenter
        Title.Caption = 'Filtro'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ligacao'
        Title.Alignment = taCenter
        Title.Caption = 'Liga'#231#227'o'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'shadow'
        Title.Alignment = taCenter
        Title.Caption = 'Shadow'
        Width = 60
        Visible = True
      end>
  end
end
