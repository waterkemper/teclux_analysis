inherited frmCadastroGruposUsuarios: TfrmCadastroGruposUsuarios
  Left = 317
  Top = 195
  Caption = 'Cadastro de grupos de usu'#225'rios'
  ClientHeight = 262
  ClientWidth = 611
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Width = 404
  end
  inherited pnlTopMenu: TPanel
    Width = 611
    TabOrder = 2
    inherited tblBarra: TToolBar
      Width = 386
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 45
    Width = 611
    Height = 217
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 1
    object gbxFundoJanela: TGroupBox
      Left = 3
      Top = 3
      Width = 605
      Height = 211
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object sbnGrupoPostgreSQL: TSpeedButton
        Left = 162
        Top = 65
        Width = 23
        Height = 22
        Hint = 'Procura grupos de usu'#225'rios existentes no banco de dados'
        Enabled = False
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
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC7F
          7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
          FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
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
          DCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
          FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
          FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCFFFFFFFFFFFFDCDCDCDCDCDCDC
          DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FDCDCDCFFFFFFFFFFFF7F
          7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
        NumGlyphs = 2
        Visible = False
        OnClick = sbnGrupoPostgreSQLClick
      end
      object lblGrupoPostgreSQL: TLabel
        Left = 17
        Top = 67
        Width = 104
        Height = 15
        Alignment = taRightJustify
        Caption = 'Grupo PostgreSQL'
        Enabled = False
        Visible = False
      end
      object flkGrupoPostgreSQL: TtecDBFindLookup
        Left = 125
        Top = 64
        Width = 35
        Height = 23
        Alignment = taLeftJustify
        DataField = 'grupopostgresql'
        DataSource = dtmCadastrosInternos.dsrGruposUsuarios
        Enabled = False
        MaxLength = 3
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        Opcional = True
        TabOrder = 0
        Visible = False
        PermitirZero = False
        PermitirNulo = False
        Operacao = opATRIBUICAO
        LookupField = 'grosysid'
        LookupSource = dtmCadastrosInternos.dsrProcuraGrupoPostgreSQL
        LookupQueryParameter = 'groupsysid'
        Parameter = ' '
        ActiveSetControls = False
        DenyInsert = False
        NoSetControls = <>
        SetControls = <>
        LookupParameter = 'groupsysid'
      end
      object dtxGrupoPostgreSQL: TtecDBText
        Left = 321
        Top = 72
        Width = 210
        Height = 23
        TabStop = False
        Color = clBtnFace
        DataField = 'groname'
        DataSource = dtmCadastrosInternos.dsrProcuraGrupoPostgreSQL
        Enabled = False
        ReadOnly = True
        TabOrder = 2
        Visible = False
        Alignment = taLeftJustify
      end
      object gbxCodigo: TGroupBox
        Left = 10
        Top = 10
        Width = 65
        Height = 36
        Caption = 'CODIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object edfCodigoGrupo: TtecDbEditFind
          Left = 2
          Top = 10
          Width = 60
          Height = 23
          Alignment = taLeftJustify
          DataField = 'codigo'
          DataSource = dtmCadastrosInternos.dsrGruposUsuarios
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Group = 'GrupoUsuarios'
          MaxLength = 4
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
          SetControls = <>
        end
      end
      object gbxNomeGrupo: TGroupBox
        Left = 85
        Top = 10
        Width = 275
        Height = 36
        Caption = 'NOME DO GRUPO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object edtNomeGrupo: TDBEditTexto
          Left = 2
          Top = 10
          Width = 270
          Height = 23
          DataField = 'nome'
          DataSource = dtmCadastrosInternos.dsrGruposUsuarios
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
      object gbxPerfil: TGroupBox
        Left = 10
        Top = 58
        Width = 584
        Height = 147
        Caption = 'PERFIS DO GRUPO DE USU'#193'RIOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object ckbAnalistaCredito: TDBCheckBox
          Left = 10
          Top = 68
          Width = 175
          Height = 23
          Caption = 'Analista de cr'#233'dito'
          DataField = 'analistacredito'
          DataSource = dtmCadastrosInternos.dsrGruposUsuarios
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object ckbReservaProdutos: TDBCheckBox
          Left = 410
          Top = 50
          Width = 165
          Height = 23
          Caption = 'Reserva de produtos'
          DataField = 'reservaproduto'
          DataSource = dtmCadastrosInternos.dsrGruposUsuarios
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 16
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object ckbVendedor: TDBCheckBox
          Left = 410
          Top = 122
          Width = 165
          Height = 23
          Caption = 'Vendedor'
          DataField = 'vendedor'
          DataSource = dtmCadastrosInternos.dsrGruposUsuarios
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 20
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object ckbCobranca: TDBCheckBox
          Left = 194
          Top = 14
          Width = 205
          Height = 23
          Caption = 'Cobran'#231'a'
          DataField = 'cobrador'
          DataSource = dtmCadastrosInternos.dsrGruposUsuarios
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object ckbAtendimento: TDBCheckBox
          Left = 11
          Top = 86
          Width = 175
          Height = 23
          Caption = 'Atendimento'
          DataField = 'atendente'
          DataSource = dtmCadastrosInternos.dsrGruposUsuarios
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object ckbCaixa: TDBCheckBox
          Left = 10
          Top = 122
          Width = 175
          Height = 23
          Caption = 'Caixa'
          DataField = 'caixa'
          DataSource = dtmCadastrosInternos.dsrGruposUsuarios
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object ckbPagamento: TDBCheckBox
          Left = 10
          Top = 104
          Width = 175
          Height = 23
          Caption = 'Autoriza'#231#227'o de pagamentos'
          DataField = 'pagamento'
          DataSource = dtmCadastrosInternos.dsrGruposUsuarios
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object chkDescontoExtra: TDBCheckBox
          Left = 194
          Top = 50
          Width = 205
          Height = 23
          Caption = 'Desconto extra'
          DataField = 'descontoextra'
          DataSource = dtmCadastrosInternos.dsrGruposUsuarios
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object chkAlterarPrecoContrato: TDBCheckBox
          Left = 10
          Top = 50
          Width = 175
          Height = 23
          Caption = 'Alterar pre'#231'o no contrato'
          DataField = 'alterarprecocontrato'
          DataSource = dtmCadastrosInternos.dsrGruposUsuarios
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object chkDevolucaoProduto: TDBCheckBox
          Left = 194
          Top = 86
          Width = 205
          Height = 23
          Caption = 'Devolu'#231#227'o de produto'
          DataField = 'devolucaoproduto'
          DataSource = dtmCadastrosInternos.dsrGruposUsuarios
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 11
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object chkDevolucaoNumerario: TDBCheckBox
          Left = 194
          Top = 68
          Width = 205
          Height = 23
          Caption = 'Devolu'#231#227'o de numer'#225'rio'
          DataField = 'devolucaonumerario'
          DataSource = dtmCadastrosInternos.dsrGruposUsuarios
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object chkITecLux: TDBCheckBox
          Left = 410
          Top = 104
          Width = 165
          Height = 23
          Caption = 'Utilizar o i-tecLUX'
          DataField = 'iteclux'
          DataSource = dtmCadastrosInternos.dsrGruposUsuarios
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 19
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object chkAlterarFilial: TDBCheckBox
          Left = 10
          Top = 32
          Width = 175
          Height = 23
          Caption = 'Alterar filiais'
          DataField = 'alterarfilial'
          DataSource = dtmCadastrosInternos.dsrGruposUsuarios
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object chkGerenteEstoque: TDBCheckBox
          Left = 410
          Top = 14
          Width = 165
          Height = 23
          Caption = 'Gerente de Estoque'
          DataField = 'gerenteestoque'
          DataSource = dtmCadastrosInternos.dsrGruposUsuarios
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 14
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object chkAlterarDadosContabeis: TDBCheckBox
          Left = 10
          Top = 14
          Width = 175
          Height = 23
          Caption = 'Alterar dados cont'#225'beis'
          DataField = 'alterardadoscontabeis'
          DataSource = dtmCadastrosInternos.dsrGruposUsuarios
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object chkMontador: TDBCheckBox
          Left = 410
          Top = 32
          Width = 165
          Height = 23
          Caption = 'Montador'
          DataField = 'montador'
          DataSource = dtmCadastrosInternos.dsrGruposUsuarios
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 15
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object chkConfirmarTransferenciaItem: TDBCheckBox
          Left = 194
          Top = 32
          Width = 205
          Height = 23
          Caption = 'Confirmar Transfer'#234'ncia por Item'
          DataField = 'confirmartransfitem'
          DataSource = dtmCadastrosInternos.dsrGruposUsuarios
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object ckbRestringirFicheCliente: TDBCheckBox
          Left = 410
          Top = 68
          Width = 165
          Height = 23
          Caption = 'Restringir ficha do cliente'
          DataField = 'restringirfichacliente'
          DataSource = dtmCadastrosInternos.dsrGruposUsuarios
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 17
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object ckbEmissorNotaFiscal: TDBCheckBox
          Left = 194
          Top = 104
          Width = 205
          Height = 23
          Caption = 'Emissor de nota fiscal'
          DataField = 'emissornotafiscal'
          DataSource = dtmCadastrosInternos.dsrGruposUsuarios
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 12
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object ckbGerenteCaixa: TDBCheckBox
          Left = 194
          Top = 122
          Width = 205
          Height = 23
          Caption = 'Gerente de Caixa'
          DataField = 'gerentecaixa'
          DataSource = dtmCadastrosInternos.dsrGruposUsuarios
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 13
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object chkTrocaProduto: TDBCheckBox
          Left = 410
          Top = 86
          Width = 165
          Height = 23
          Caption = 'Troca de produto'
          DataField = 'trocaproduto'
          DataSource = dtmCadastrosInternos.dsrGruposUsuarios
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 18
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
      end
    end
  end
end
