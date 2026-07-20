inherited frmSetoresVenda: TfrmSetoresVenda
  Left = 307
  Top = 182
  ActiveControl = edfCodigo
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  Caption = 'Setores Venda'
  ClientHeight = 88
  ClientWidth = 709
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 0
    Top = 87
    Width = 709
    Height = 1
    Align = alBottom
    inherited bvlBotoesEd: TBevel
      Left = 1
      Top = 0
      Width = 707
      Height = 0
      Align = alBottom
      Visible = False
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 709
    inherited tblBarra: TToolBar
      Width = 484
    end
  end
  object gbxCodigo: TGroupBox
    Left = 4
    Top = 46
    Width = 61
    Height = 38
    Caption = 'C'#211'DIGO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object edfCodigo: TtecDbEditFind
      Left = 2
      Top = 12
      Width = 56
      Height = 23
      Alignment = taLeftJustify
      DataField = 'codigo'
      DataSource = dtmSetoresVenda.dsrSetoresVenda
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      Group = 'Falha'
      MaxLength = 6
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
      ActiveSetControls = True
      DenyInsert = True
      NoSetControls = <>
      SetControls = <
        item
        end
        item
        end
        item
        end>
    end
  end
  object gbxDescricao: TGroupBox
    Left = 68
    Top = 46
    Width = 605
    Height = 38
    Caption = 'DESCRI'#199#195'O'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object edtDescricao: TDBEditTexto
      Left = 2
      Top = 11
      Width = 600
      Height = 23
      DataField = 'nome'
      DataSource = dtmSetoresVenda.dsrSetoresVenda
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      MaxLength = -1
      ParentFont = False
      TabOrder = 0
      CharCasenoDefault = False
      Alignment = taLeftJustify
    end
  end
end
