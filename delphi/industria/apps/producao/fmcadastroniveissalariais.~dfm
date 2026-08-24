inherited frmCadastroNiveisSalariais: TfrmCadastroNiveisSalariais
  Left = 536
  Top = 233
  ActiveControl = edfCodigo
  Caption = 'Cadastro de n'#237'veis salariais'
  ClientHeight = 370
  ClientWidth = 448
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 0
    Top = 45
    Width = 448
    Height = 325
    Align = alClient
    BevelOuter = bvNone
    Visible = True
    inherited bvlBotoesEd: TBevel
      Left = 0
      Top = 325
      Width = 448
      Height = 0
      Align = alBottom
    end
    object gbxCodigoNivelSalarial: TGroupBox
      Left = 10
      Top = 10
      Width = 70
      Height = 37
      Caption = ' C'#211'DIGO '
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
        Width = 65
        Height = 23
        Alignment = taLeftJustify
        DataField = 'codigo'
        DataSource = dtmCadastroNiveisSalariais.dsrNiveisSalariais
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
            Control = gbxFuncionarios
          end>
      end
    end
    object gbxDescricaoNivelSalarial: TGroupBox
      Left = 96
      Top = 10
      Width = 340
      Height = 36
      Caption = ' DESCRI'#199#195'O '
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
        Width = 335
        Height = 23
        DataField = 'descricao'
        DataSource = dtmCadastroNiveisSalariais.dsrNiveisSalariais
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
    object gbxFuncionarios: TGroupBox
      Left = 10
      Top = 57
      Width = 426
      Height = 273
      Caption = 'FUNCION'#193'RIOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object dbgFuncionarios: TtecDBGrid
        Left = 2
        Top = 16
        Width = 397
        Height = 255
        Align = alClient
        DataSource = dtmCadastroNiveisSalariais.dsrNiveisSalariaisUsuarios
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
        OnDblClick = dbgFuncionariosDblClick
        OnKeyDown = dbgFuncionariosKeyDown
        RowWrap = 60
        Large = False
        DoubleRowColor = False
        TitleMinHeight = 100
        CellHeights = 100
        StrippedColor = 16054260
        CanDelete = False
        CanNotInsertFromGrid = False
        PostOnEnter = False
        PostOnSetUpDown = False
        DenySort = False
        DefaultRowHeight = 19
        ExibirNumerodaLinha = False
        NaoAtribuirDadosaTabelaaoDigitar = False
        ShowWhenFieldInvisible = False
        CanClickWhenEditing = False
        Columns = <
          item
            Alignment = taLeftJustify
            Expanded = False
            FieldName = 'usuario'
            Title.Alignment = taCenter
            Title.Caption = 'C'#211'DIGO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Title.Alignment = taCenter
            Title.Caption = 'NOME DO USU'#193'RIO'
            Width = 286
            Visible = True
          end>
      end
      object pnlOpcoesFuncionarios: TPanel
        Left = 399
        Top = 16
        Width = 25
        Height = 255
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object sbnExcluirFuncionarios: TSpeedButton
          Left = 1
          Top = 23
          Width = 23
          Height = 22
          Hint = 'Excluir produto'
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
          NumGlyphs = 2
          OnClick = sbnExcluirFuncionariosClick
        end
      end
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 448
    inherited tblBarra: TToolBar
      Width = 223
    end
  end
end
