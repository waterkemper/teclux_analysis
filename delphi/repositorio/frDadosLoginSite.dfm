object fraDadosLoginSite: TfraDadosLoginSite
  Left = 0
  Top = 0
  Width = 638
  Height = 364
  TabOrder = 0
  OnConstrainedResize = FrameConstrainedResize
  OnEnter = FrameEnter
  object sbnAbilitar: TSpeedButton
    Left = 392
    Top = 216
    Width = 33
    Height = 9
    Action = actAbilitar
  end
  object gbxCliente: TGroupBox
    Left = 0
    Top = 0
    Width = 638
    Height = 39
    Align = alTop
    Caption = 'CLIENTE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object dtxCodigoCliente: TtecDBText
      Left = 4
      Top = 14
      Width = 81
      Height = 22
      TabStop = False
      Color = clBtnFace
      DataField = 'cliente'
      DataSource = dsrUsuarios_Site
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Alignment = taLeftJustify
    end
    object dtxTipoCliente: TtecDBText
      Left = 89
      Top = 14
      Width = 17
      Height = 22
      TabStop = False
      Color = clBtnFace
      DataField = 'tipocliente'
      DataSource = dsrUsuarios_Site
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Alignment = taLeftJustify
    end
    object dtxNomeCliente: TtecDBText
      Left = 109
      Top = 14
      Width = 492
      Height = 22
      TabStop = False
      Color = clBtnFace
      DataField = 'nomecliente'
      DataSource = dsrUsuarios_Site
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Alignment = taLeftJustify
    end
  end
  object gbxUsuarios: TGroupBox
    Left = 0
    Top = 39
    Width = 601
    Height = 162
    Caption = 'USU'#193'RIOS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    object dbgUsuasrios: TtecDBGrid
      Left = 2
      Top = 15
      Width = 597
      Height = 145
      Align = alClient
      DataSource = dsrUsuarios_Site
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      RowWrap = 60
      Large = False
      DoubleRowColor = True
      TitleMinHeight = 100
      CellHeights = 100
      StrippedColor = 16054260
      CanDelete = False
      CanNotInsertFromGrid = True
      PostOnEnter = False
      PostOnSetUpDown = False
      DenySort = False
      DefaultRowHeight = 16
      ExibirNumerodaLinha = False
      NaoAtribuirDadosaTabelaaoDigitar = False
      ShowWhenFieldInvisible = False
      CanClickWhenEditing = False
      Columns = <
        item
          Expanded = False
          FieldName = 'nome'
          Title.Caption = 'NOME DO USU'#193'RIO'
          Width = 291
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'datacadastro'
          Title.Alignment = taCenter
          Title.Caption = 'DATA CADASTRO'
          Width = 96
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ultimoacesso'
          Title.Alignment = taCenter
          Title.Caption = #218'LTIMO ACESSO'
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'inativo'
          Title.Alignment = taCenter
          Title.Caption = 'INATIVO'
          Width = 79
          Visible = True
        end>
    end
  end
  object gbxNome: TGroupBox
    Left = 0
    Top = 201
    Width = 441
    Height = 39
    Caption = 'NOME'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object edtNome: TDBEditTexto
      Left = 6
      Top = 12
      Width = 430
      Height = 22
      DataField = 'nome'
      DataSource = dsrUsuarios_Site
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Style = []
      MaxLength = -1
      ParentFont = False
      TabOrder = 0
      CharCasenoDefault = False
      Alignment = taLeftJustify
    end
  end
  object dbckbInativo: TDBCheckBox
    Left = 480
    Top = 224
    Width = 65
    Height = 17
    Caption = 'INATIVO'
    DataField = 'inativol'
    DataSource = dsrUsuarios_Site
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'helvetica'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object gbxEmail: TGroupBox
    Left = 0
    Top = 241
    Width = 441
    Height = 39
    Caption = 'EMAIL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object edtEmail: TDBEditTexto
      Left = 6
      Top = 12
      Width = 431
      Height = 22
      CharCase = ecLowerCase
      DataField = 'email'
      DataSource = dsrUsuarios_Site
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Style = []
      MaxLength = -1
      ParentFont = False
      TabOrder = 0
      CharCasenoDefault = True
      Alignment = taLeftJustify
    end
  end
  inline fradbcgcoucpf1: Tfradbcgcoucpf
    Left = 4
    Top = 283
    Width = 137
    Height = 69
    HorzScrollBar.Visible = False
    VertScrollBar.Visible = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    inherited gbxCPGouCGC: TGroupBox
      inherited rgbTipoPessoa: TtecDBRadioGroup
        DataField = 'tipopessoa'
        DataSource = dsrUsuarios_Site
        inherited rbnFisica: TtecRadioButton
          Checked = True
          TabStop = True
        end
      end
      inherited gbxCPF_CNPJ: TGroupBox
        inherited edtCPFCNPJ: TDBEditCPFCNPJ
          DataField = 'pessoanumero'
          DataSource = dsrUsuarios_Site
          Font.Height = -11
        end
      end
    end
  end
  object gbxSenha: TGroupBox
    Left = 152
    Top = 282
    Width = 121
    Height = 68
    Caption = 'SENHA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object sbnGrarSenha: TSpeedButton
      Left = 90
      Top = 41
      Width = 23
      Height = 22
      Hint = 'gerar senha'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
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
      ParentFont = False
      OnClick = sbnGrarSenhaClick
    end
    object edtSenha: TDBEditTexto
      Left = 6
      Top = 15
      Width = 83
      Height = 22
      DataField = 'senhaauxiliar'
      DataSource = dsrUsuarios_Site
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Style = []
      MaxLength = -1
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 0
      CharCasenoDefault = True
      Alignment = taLeftJustify
    end
    object edtSenhaGerada: TDBEditTexto
      Left = 86
      Top = 9
      Width = 83
      Height = 22
      TabStop = False
      Color = clBtnFace
      DataField = 'senhagerada'
      DataSource = dsrUsuarios_Site
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Style = []
      MaxLength = -1
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Visible = False
      OnChange = edtSenhaGeradaChange
      CharCasenoDefault = False
      Alignment = taLeftJustify
    end
    object edtSenhaVisivel: TEdit
      Left = 8
      Top = 40
      Width = 76
      Height = 21
      TabOrder = 2
    end
  end
  object pnlBotoesProdutosContratos: TPanel
    Left = 602
    Top = 39
    Width = 36
    Height = 325
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 7
    object sbnIncluirUsuario: TSpeedButton
      Left = 7
      Top = 49
      Width = 23
      Height = 23
      Hint = 'Incluir usu'#225'rio'
      Flat = True
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDC7F7F7F7F7F7F7F7F7F8080808080807F7F7F7F7F7F7F7F7F7F7F
        7F808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDC0000000000000000000000000000000000000000000000000000000000
        00808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        00808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
        DCDCDCDCDCFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
        00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
        DCDC7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000DCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
        DCDC7F7F7FFFFFFFDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000DCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
        DCDC7F7F7FFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000DCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFFFFFFFFF
        FFFF7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDC000000000000000000000000000000000000DCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
      NumGlyphs = 2
      OnClick = sbnIncluirUsuarioClick
    end
    object sbnExcluirUsuario: TSpeedButton
      Left = 7
      Top = 77
      Width = 23
      Height = 23
      Hint = 'Excluir usu'#225'rio'
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
      OnClick = sbnExcluirUsuarioClick
    end
    object sbnSalvarUsuario: TSpeedButton
      Left = 5
      Top = 105
      Width = 23
      Height = 23
      Flat = True
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C3C3C3C3000000
        0000000000000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F0000
        00000000C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FC3C3C3FFFFFF000000000000
        0000000000000000007F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000
        00000000000000C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3
        C3C3FFFFFFFFFFFFC3C3C37F7F7FFFFFFFC3C3C37F7F7FFFFFFF000000000000
        0000000000000000007F7F7FBFBFBF000000000000BFBFBFBFBFBFBFBFBF0000
        00000000000000C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F
        7F7F7F7F7FFFFFFFC3C3C37F7F7FFFFFFFC3C3C37F7F7FFFFFFF000000000000
        0000000000000000007F7F7FBFBFBF000000000000BFBFBFBFBFBFBFBFBF0000
        00000000000000C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F
        7F7F7F7F7FFFFFFFFFFFFF7F7F7FFFFFFFC3C3C37F7F7FFFFFFF000000000000
        0000000000000000007F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000
        00000000000000C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C37F7F7FFFFFFF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000C3C3C37F7F7FFFFFFFC3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000C3C3C37F7F7FFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF7F7F7FFFFFFF000000000000
        000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        00000000000000C3C3C37F7F7FFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F7F7FFFFFFF000000000000
        000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        00000000000000C3C3C37F7F7FFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F7F7FFFFFFF000000000000
        000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        00000000000000C3C3C37F7F7FFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F7F7FFFFFFF000000000000
        000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        00000000000000C3C3C37F7F7FFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F7F7FFFFFFF000000000000
        000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        00000000000000C3C3C37F7F7FFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F7F7FFFFFFF000000000000
        000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        007F7F7F000000C3C3C37F7F7FFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FFFFFFF000000000000
        000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        00000000000000C3C3C37F7F7FC3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFF7F7F7FC3C3C3C3C3C3000000
        0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        00000000C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3}
      NumGlyphs = 2
      OnClick = sbnSalvarUsuarioClick
    end
  end
  object qryUsuarios_Site: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnApplyUpdateError = qryUsuarios_SiteApplyUpdateError
    AfterInsert = qryUsuarios_SiteAfterInsert
    AfterEdit = qryUsuarios_SiteAfterEdit
    BeforePost = qryUsuarios_SiteBeforePost
    AfterPost = qryUsuarios_SiteAfterPost
    AfterCancel = qryUsuarios_SiteAfterPost
    AfterDelete = qryUsuarios_SiteAfterDelete
    OnNewRecord = qryUsuarios_SiteNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select us.*,'
      
        '       (select vf.nome from vfornecedores vf where vf.codigo = :' +
        'cliente and vf.tipo = :tipocliente) as nomecliente,'
      '       us.senha as senhaauxiliar,'
      '       cast(null as varchar(10)) as senhagerada,'
      ''
      
        '       case when length(pessoanumero)<=11 then cast('#39'F'#39' as char(' +
        '1)) else cast('#39'J'#39' as char(1)) end as tipopessoa'
      'from usuarios_site us'
      'where us.cliente = :cliente'
      '  and us.tipocliente = :tipocliente')
    RequestLive = True
    Left = 352
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipocliente'
        ParamType = ptUnknown
      end>
    object qryUsuarios_Siteusuario: TStringField
      DisplayLabel = 'USU'#193'RIO'
      FieldName = 'usuario'
      Size = 100
    end
    object qryUsuarios_Sitesenha: TStringField
      DisplayLabel = 'senha do usu'#225'rio'
      FieldName = 'senha'
      Size = 100
    end
    object qryUsuarios_Sitenome: TStringField
      DisplayLabel = 'Nome do Usu'#225'rio'
      FieldName = 'nome'
      Required = True
      Size = 200
    end
    object qryUsuarios_Sitecliente: TLargeintField
      FieldName = 'cliente'
    end
    object qryUsuarios_Sitetipocliente: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
    object qryUsuarios_Sitedatacadastro: TDateTimeField
      FieldName = 'datacadastro'
    end
    object qryUsuarios_Siteultimoacesso: TDateTimeField
      FieldName = 'ultimoacesso'
    end
    object qryUsuarios_Siteinativo: TDateTimeField
      FieldName = 'inativo'
    end
    object qryUsuarios_Siteinativol: TBooleanField
      FieldName = 'inativol'
    end
    object qryUsuarios_Siteemail: TStringField
      DisplayLabel = 'email do usu'#225'rio'
      FieldName = 'email'
      Required = True
      Size = 200
    end
    object qryUsuarios_Sitereset_code: TStringField
      FieldName = 'reset_code'
      Size = 255
    end
    object qryUsuarios_Sitecookie_hash: TStringField
      FieldName = 'cookie_hash'
      Size = 255
    end
    object qryUsuarios_Siteactivation_code: TStringField
      FieldName = 'activation_code'
      Size = 255
    end
    object qryUsuarios_Sitepessoanumero: TStringField
      DisplayLabel = 'CPF ou CNPJ do usu'#225'rio'
      FieldName = 'pessoanumero'
      Size = 14
    end
    object qryUsuarios_Siteofertasemail: TBooleanField
      FieldName = 'ofertasemail'
    end
    object qryUsuarios_Siteofertassms: TBooleanField
      FieldName = 'ofertassms'
    end
    object qryUsuarios_Sitetipousuario: TStringField
      FieldName = 'tipousuario'
      Size = 1
    end
    object qryUsuarios_Sitecomo_conheceu_site: TStringField
      FieldName = 'como_conheceu_site'
      Size = 100
    end
    object qryUsuarios_Sitecodigo_bonus: TStringField
      FieldName = 'codigo_bonus'
      Size = 155
    end
    object qryUsuarios_Siteusuario_indicou: TIntegerField
      FieldName = 'usuario_indicou'
    end
    object qryUsuarios_Sitevendedor: TIntegerField
      FieldName = 'vendedor'
    end
    object qryUsuarios_Sitenomecliente: TStringField
      FieldName = 'nomecliente'
      Size = 50
    end
    object qryUsuarios_Sitesenhagerada: TStringField
      DisplayLabel = 'senha do usu'#225'rio'
      FieldName = 'senhagerada'
      Size = 10
    end
    object qryUsuarios_Sitetipopessoa: TStringField
      FieldName = 'tipopessoa'
      Size = 1
    end
    object qryUsuarios_Sitesenhaauxiliar: TStringField
      DisplayLabel = 'senha do usu'#225'rio'
      FieldName = 'senhaauxiliar'
      Required = True
      Size = 10
    end
  end
  object dsrUsuarios_Site: TtecDataSource
    DataSet = qryUsuarios_Site
    OnDataChange = dsrUsuarios_SiteDataChange
    Left = 384
    Top = 16
  end
  object actHabilitar: TActionList
    Left = 536
    Top = 288
    object actAbilitar: TAction
      Caption = 'actAbilitar'
      OnUpdate = actAbilitarUpdate
    end
  end
  object qrymd5: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      
        'select cast(md5(md5('#39'shakeit'#39') || md5(:pw)) as varchar(32)) as s' +
        'enha')
    RequestLive = False
    Left = 448
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pw'
        ParamType = ptUnknown
      end>
    object qrymd5senha: TStringField
      FieldName = 'senha'
      Size = 32
    end
  end
end
