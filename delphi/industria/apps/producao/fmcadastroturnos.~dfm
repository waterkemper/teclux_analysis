inherited frmCadastroTurnos: TfrmCadastroTurnos
  Left = 1136
  Top = 253
  ActiveControl = edfCodigo
  Caption = 'Cadastro de intervalo de turnos'
  ClientHeight = 375
  ClientWidth = 416
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 0
    Top = 40
    Width = 416
    Height = 335
    Align = alClient
    BevelOuter = bvNone
    Visible = True
    inherited bvlBotoesEd: TBevel
      Left = 0
      Top = 335
      Width = 416
      Height = 0
      Align = alBottom
    end
    object gbxCodigoNivelSalarial: TGroupBox
      Left = 6
      Top = 6
      Width = 60
      Height = 36
      Caption = 'C'#211'DIGO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object edfCodigo: TtecDbEditFind
        Left = 2
        Top = 10
        Width = 55
        Height = 23
        Alignment = taLeftJustify
        DataField = 'codigo'
        DataSource = dtmCadastroTurnos.dsrTurnos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Group = 'codigo'
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
        ActiveSetControls = True
        DenyInsert = True
        NoSetControls = <>
        SetControls = <
          item
            Control = gbxDescricaoNivelSalarial
          end
          item
            Control = gbxIntervalos
          end>
      end
    end
    object gbxDescricaoNivelSalarial: TGroupBox
      Left = 74
      Top = 6
      Width = 240
      Height = 36
      Caption = 'DESCRI'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object edtDescricao: TDBEditTexto
        Left = 2
        Top = 10
        Width = 235
        Height = 23
        DataField = 'descricao'
        DataSource = dtmCadastroTurnos.dsrTurnos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 12
        ParentFont = False
        TabOrder = 0
        CharCasenoDefault = False
        Alignment = taLeftJustify
      end
    end
    object gbxIntervalos: TGroupBox
      Left = 6
      Top = 46
      Width = 403
      Height = 283
      Caption = 'INTERVALOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object Bevel1: TBevel
        Left = 2
        Top = 16
        Width = 399
        Height = 0
        Align = alTop
        Shape = bsSpacer
      end
      object dbgIntervalos: TtecDBGrid
        Left = 2
        Top = 16
        Width = 399
        Height = 265
        Align = alClient
        DataSource = dtmCadastroTurnos.dsrTurnosIntervalos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -9
        TitleFont.Name = 'helvetica'
        TitleFont.Pitch = fpVariable
        TitleFont.Style = []
        RowWrap = 60
        Large = False
        DoubleRowColor = False
        MsgDelete = 'este intervalo'
        TitleMinHeight = 100
        CellHeights = 100
        StrippedColor = 16054260
        CanDelete = True
        PostOnEnter = False
        DenySort = False
        DefaultRowHeight = 19
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'lkDiaSemana'
            Title.Alignment = taCenter
            Title.Caption = 'DIA DA SEMANA'
            Width = 125
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EhInicioTurno'
            Title.Alignment = taCenter
            Title.Caption = 'IN'#205'CIO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IntervaloInicial'
            Title.Alignment = taCenter
            Title.Caption = 'HORA INICIAL'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IntervaloFinal'
            Title.Alignment = taCenter
            Title.Caption = 'HORA FINAL'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EhTerminoTurno'
            Title.Alignment = taCenter
            Title.Caption = 'T'#201'RMINO'
            Visible = True
          end>
      end
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 416
    inherited tblBarra: TToolBar
      Width = 191
    end
  end
end
