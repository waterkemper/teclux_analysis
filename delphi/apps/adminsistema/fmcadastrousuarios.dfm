inherited frmCadastroUsuarios: TfrmCadastroUsuarios
  Left = 280
  Top = 172
  Caption = 'Cadastro de Usu'#225'rios'
  ClientHeight = 520
  ClientWidth = 965
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Width = 553
    Height = 42
  end
  inherited pnlTopMenu: TPanel
    Width = 965
    TabOrder = 2
    inherited tblBarra: TToolBar
      Width = 740
      inherited sbnAjuda: TSpeedButton
        Action = actHabilitarAbas
      end
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 45
    Width = 965
    Height = 475
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object gbxUsuario: TGroupBox
      Left = 0
      Top = 0
      Width = 965
      Height = 475
      Align = alClient
      TabOrder = 0
      object pgcDetalhes: TtecPageControl
        Left = 2
        Top = 177
        Width = 961
        Height = 296
        ActivePage = tstComissaoVenda
        Align = alBottom
        TabOrder = 11
        OnChange = pgcDetalhesChange
        object tstPerfisGrupos: TTabSheet
          Caption = ' &Perfis e Grupos'
          ImageIndex = 3
          object gbxGrupoUsuarios: TGroupBox
            Left = 6
            Top = 6
            Width = 395
            Height = 36
            Caption = 'GRUPO DE USU'#193'RIOS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object sbnProcuraGruposUsuarios: TSpeedButton
              Left = 49
              Top = 10
              Width = 23
              Height = 22
              Hint = 'Procurar por grupos de usu'#225'rios'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
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
              ParentFont = False
              OnClick = sbnProcuraGruposUsuariosClick
            end
            object flkGrupoUsuarios: TtecDBFindLookup
              Left = 2
              Top = 10
              Width = 45
              Height = 23
              Alignment = taLeftJustify
              DataField = 'grupo'
              DataSource = dtmCadastrosInternos.dsrUsuarios
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
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
              LookupField = 'codigo'
              LookupSource = dtmCadastrosInternos.dsrProcuraGrupoUsuarios
              LookupQueryParameter = 'codigo'
              Parameter = ' '
              ActiveSetControls = False
              DenyInsert = False
              NoSetControls = <>
              SetControls = <>
              LookupParameter = 'codigo'
            end
            object dtxNomeGrupoUsuarios: TtecDBText
              Left = 72
              Top = 10
              Width = 320
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'nome'
              DataSource = dtmCadastrosInternos.dsrProcuraGrupoUsuarios
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              Alignment = taLeftJustify
            end
          end
          object gbxPerfil: TGroupBox
            Left = 0
            Top = 51
            Width = 953
            Height = 214
            Align = alBottom
            Caption = ' PERFIS DO USU'#193'RIO '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            object ckbAnalistaCredito: TDBCheckBox
              Left = 6
              Top = 33
              Width = 180
              Height = 23
              Caption = 'Analista de cr'#233'dito'
              DataField = 'credito'
              DataSource = dtmCadastrosInternos.dsrUsuarios
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
            object ckbReservaProdutos: TDBCheckBox
              Left = 420
              Top = 73
              Width = 165
              Height = 23
              Caption = 'Reserva de produtos'
              DataField = 'reserva'
              DataSource = dtmCadastrosInternos.dsrUsuarios
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 21
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object ckbVendedor: TDBCheckBox
              Left = 420
              Top = 113
              Width = 165
              Height = 23
              Caption = 'Vendedor'
              DataField = 'venda'
              DataSource = dtmCadastrosInternos.dsrUsuarios
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 23
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object chkAtendimento: TDBCheckBox
              Left = 6
              Top = 113
              Width = 180
              Height = 23
              Caption = 'Atendimento'
              DataField = 'atendimento'
              DataSource = dtmCadastrosInternos.dsrUsuarios
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
            object chkCaixa: TDBCheckBox
              Left = 6
              Top = 153
              Width = 180
              Height = 23
              Caption = 'Caixa'
              DataField = 'caixa'
              DataSource = dtmCadastrosInternos.dsrUsuarios
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
            object chkPagamentos: TDBCheckBox
              Left = 6
              Top = 133
              Width = 180
              Height = 23
              Caption = 'Autoriza'#231#227'o de pagamentos'
              DataField = 'pagamento'
              DataSource = dtmCadastrosInternos.dsrUsuarios
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
            object chkDescontoExtra: TDBCheckBox
              Left = 200
              Top = 33
              Width = 205
              Height = 23
              Caption = 'Desconto extra'
              DataField = 'descontoextra'
              DataSource = dtmCadastrosInternos.dsrUsuarios
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
            object chkAlterarPrecoContrato: TDBCheckBox
              Left = 6
              Top = 93
              Width = 180
              Height = 23
              Caption = 'Alterar pre'#231'o no contrato'
              DataField = 'alterarprecocontrato'
              DataSource = dtmCadastrosInternos.dsrUsuarios
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
            object chkDevolucaoProduto: TDBCheckBox
              Left = 200
              Top = 73
              Width = 205
              Height = 23
              Caption = 'Devolu'#231#227'o de vendas'
              DataField = 'devolucaoproduto'
              DataSource = dtmCadastrosInternos.dsrUsuarios
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
            object chkDevolucaoNumerario: TDBCheckBox
              Left = 200
              Top = 53
              Width = 205
              Height = 23
              Caption = 'Devolu'#231#227'o de numer'#225'rio'
              DataField = 'devolucaonumerario'
              DataSource = dtmCadastrosInternos.dsrUsuarios
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
            object chkITecLux: TDBCheckBox
              Left = 420
              Top = 133
              Width = 165
              Height = 23
              Caption = 'Utilizar o i-tecLUX'
              DataField = 'iteclux'
              DataSource = dtmCadastrosInternos.dsrUsuarios
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 24
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object chkAlterarFilial: TDBCheckBox
              Left = 6
              Top = 53
              Width = 180
              Height = 23
              Caption = 'Alterar filiais'
              DataField = 'alterarfilial'
              DataSource = dtmCadastrosInternos.dsrUsuarios
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
            object chkAlterarDadosContabeis: TDBCheckBox
              Left = 6
              Top = 73
              Width = 180
              Height = 23
              Caption = 'Alterar dados cont'#225'beis'
              DataField = 'alterardadoscontabeis'
              DataSource = dtmCadastrosInternos.dsrUsuarios
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
            object chkGerenteEstoque: TDBCheckBox
              Left = 200
              Top = 153
              Width = 205
              Height = 23
              Caption = 'Gerente de estoque'
              DataField = 'gerenteestoque'
              DataSource = dtmCadastrosInternos.dsrUsuarios
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
            object chkMontador: TDBCheckBox
              Left = 420
              Top = 33
              Width = 165
              Height = 23
              Caption = 'Montador'
              DataField = 'montador'
              DataSource = dtmCadastrosInternos.dsrUsuarios
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
            object chkConfirmaTransferenciaItem: TDBCheckBox
              Left = 200
              Top = 13
              Width = 205
              Height = 23
              Caption = 'Confirma transfer'#234'ncias por item'
              DataField = 'confirmartransfitem'
              DataSource = dtmCadastrosInternos.dsrUsuarios
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
            object ckbRestringirFichaCliente: TDBCheckBox
              Left = 420
              Top = 53
              Width = 165
              Height = 23
              Caption = 'Restringir ficha do cliente'
              DataField = 'restringirfichacliente'
              DataSource = dtmCadastrosInternos.dsrUsuarios
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
            object ckbEmissorNotaFiscal: TDBCheckBox
              Left = 200
              Top = 93
              Width = 205
              Height = 24
              Caption = 'Emissor de nota fiscal'
              DataField = 'emissornotafiscal'
              DataSource = dtmCadastrosInternos.dsrUsuarios
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
            object ckbGerenteCaixa: TDBCheckBox
              Left = 200
              Top = 133
              Width = 205
              Height = 23
              Caption = 'Gerente de caixa'
              DataField = 'gerentecaixa'
              DataSource = dtmCadastrosInternos.dsrUsuarios
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
            object ckbAdministrador: TDBCheckBox
              Left = 6
              Top = 13
              Width = 180
              Height = 23
              Caption = 'Administrador'
              DataField = 'administrador'
              DataSource = dtmCadastrosInternos.dsrUsuarios
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
            object ckbExcluiReservaProdutos: TDBCheckBox
              Left = 200
              Top = 113
              Width = 205
              Height = 23
              Caption = 'Excluir reservas de produtos'
              DataField = 'excluireserva'
              DataSource = dtmCadastrosInternos.dsrUsuarios
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
            object chktrocadeprodutos: TDBCheckBox
              Left = 420
              Top = 93
              Width = 165
              Height = 23
              Caption = 'Troca de produtos'
              DataField = 'trocaproduto'
              DataSource = dtmCadastrosInternos.dsrUsuarios
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 22
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object ckbGerenteProducao: TDBCheckBox
              Left = 200
              Top = 173
              Width = 205
              Height = 23
              Caption = 'Gerente de produ'#231#227'o'
              DataField = 'gerenteproducao'
              DataSource = dtmCadastrosInternos.dsrUsuarios
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
            object chkGerenteTecnico: TDBCheckBox
              Left = 420
              Top = 13
              Width = 165
              Height = 23
              Caption = 'Gerente t'#233'cnico'
              DataField = 'gerentetecnico'
              DataSource = dtmCadastrosInternos.dsrUsuarios
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
            object chkCobranca: TDBCheckBox
              Left = 6
              Top = 178
              Width = 97
              Height = 17
              Caption = 'Cobran'#231'a'
              DataField = 'cobranca'
              DataSource = dtmCadastrosInternos.dsrUsuarios
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'ChkCobranca'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 8
              ValueChecked = 'true'
              ValueUnchecked = 'false'
              OnClick = chkCobrancaClick
            end
            object chkAnalistaSite: TDBCheckBox
              Left = 420
              Top = 153
              Width = 165
              Height = 23
              Caption = 'Analista Site'
              DataField = 'analistasite'
              DataSource = dtmCadastrosInternos.dsrUsuarios
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 25
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object ckbGerenteVendas: TDBCheckBox
              Left = 420
              Top = 173
              Width = 205
              Height = 23
              Caption = 'Gerente de vendas'
              DataField = 'gerentevendas'
              DataSource = dtmCadastrosInternos.dsrUsuarios
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 26
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
          end
          object gbxSetoresdeVenda: TGroupBox
            Left = 405
            Top = 6
            Width = 359
            Height = 36
            Caption = 'SETORES DE VENDA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            inline fraConsultaSetorVenda: TfraConsultaCodigo
              Left = 2
              Top = 10
              Width = 355
              Height = 23
              HorzScrollBar.Range = 497
              HorzScrollBar.Visible = False
              VertScrollBar.Range = 23
              VertScrollBar.Visible = False
              AutoScroll = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              inherited sbnProcura: TSpeedButton
                Left = 40
              end
              inherited dtxDescricao: TtecDBText
                Left = 64
                Width = 290
                DataField = 'nome'
                DataSource = fraConsultaSetorVenda.dsrProcuraSetoresVenda
              end
              inherited edfCodigo: TtecDBFindLookup
                Width = 41
                DataField = 'setorvenda'
                DataSource = dtmCadastrosInternos.dsrUsuarios
                MaxLength = 6
                LookupField = 'codigo'
                LookupSource = fraConsultaSetorVenda.dsrProcuraSetoresVenda
                LookupQueryParameter = 'codigo'
                Parameter = ' '
                ActiveSetControls = False
                DenyInsert = False
                NoSetControls = <>
                SetControls = <>
                LookupParameter = 'codigo'
              end
              inherited qryProcuraSetoresVenda: TtecQuery
                inherited qryProcuraSetoresVendacodigo: TIntegerField
                  DisplayFormat = '0'
                end
              end
            end
          end
        end
        object tstFiliais: TTabSheet
          Caption = ' &Filiais'
          ImageIndex = 9
          object sbnIncluirFilial: TSpeedButton
            Left = 588
            Top = 3
            Width = 21
            Height = 21
            Flat = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C37F7F7F7F7F7F7F7F7F8080808080807F7F7F7F7F7F7F7F7F7F7F
              7F808080C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C30000000000000000000000000000000000000000000000000000000000
              00808080C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              00808080C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3FFFFFFFFFFFFFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
              00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C37F7F7FFFFFFFC3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C37F7F7FFFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFF
              FFFF7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000000000000000000000000000000000C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
            NumGlyphs = 2
            OnClick = sbnIncluirFilialClick
          end
          object sbnExcluirFilial: TSpeedButton
            Left = 588
            Top = 25
            Width = 21
            Height = 21
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
            OnClick = sbnExcluirFilialClick
          end
          object dbgFiliais: TtecDBGrid
            Left = 0
            Top = 0
            Width = 584
            Height = 265
            Align = alLeft
            DataSource = dtmCadastrosInternos.dsrUsuariosFiliais
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -13
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = []
            OnDblClick = dbgFiliaisDblClick
            OnKeyDown = dbgFiliaisKeyDown
            RowWrap = 60
            Large = False
            DoubleRowColor = False
            MsgDelete = 'a FILIAL DO USU'#193'RIO'
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
                Expanded = False
                FieldName = 'filial'
                Title.Alignment = taCenter
                Title.Caption = 'FILIAL'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 35
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nome'
                Title.Alignment = taCenter
                Title.Caption = 'NOME OU RAZ'#195'O SOCIAL'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 350
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'percentualgerente'
                Title.Alignment = taCenter
                Title.Caption = '% GERENTE'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'percentualsupervisor'
                Title.Alignment = taCenter
                Title.Caption = '% SUPERVISOR'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 64
                Visible = True
              end>
          end
        end
        object tstComissaoVenda: TTabSheet
          Caption = ' Comiss'#245'es de &Vendas'
          object sbnIncluirComissoes: TSpeedButton
            Left = 372
            Top = 23
            Width = 21
            Height = 21
            Hint = 'Incluir Nova Comiss'#227'o'
            Flat = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C37F7F7F7F7F7F7F7F7F8080808080807F7F7F7F7F7F7F7F7F7F7F
              7F808080C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C30000000000000000000000000000000000000000000000000000000000
              00808080C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              00808080C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3FFFFFFFFFFFFFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
              00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C37F7F7FFFFFFFC3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C37F7F7FFFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFF
              FFFF7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000000000000000000000000000000000C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
            NumGlyphs = 2
            OnClick = sbnIncluirComissoesClick
          end
          object sbnExcluirComissoes: TSpeedButton
            Left = 372
            Top = 45
            Width = 21
            Height = 21
            Hint = 'Excluir Comiss'#227'o'
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
            OnClick = sbnExcluirComissoesClick
          end
          object dbgComissoesVendas: TtecDBGrid
            Left = 0
            Top = 0
            Width = 369
            Height = 265
            Align = alLeft
            Color = clWhite
            DataSource = dtmCadastrosInternos.dsrComissoesUsuarios
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -13
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = []
            OnDblClick = dbgComissoesVendasDblClick
            OnKeyDown = dbgComissoesVendasKeyDown
            RowWrap = 60
            Large = False
            DoubleRowColor = False
            MsgDelete = 'a COMISS'#195'O DO USU'#193'RIO'
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
                Expanded = False
                FieldName = 'limite'
                Title.Alignment = taCenter
                Title.Caption = 'LIMITE DE VALOR'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 108
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'percprazo'
                Title.Alignment = taCenter
                Title.Caption = '(%) PRAZO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'percentrada'
                Title.Alignment = taCenter
                Title.Caption = '(%) ENTRADA'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'percvista'
                Title.Alignment = taCenter
                Title.Caption = '(%) VISTA'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 70
                Visible = True
              end>
          end
        end
        object tstComissaoCobranca: TTabSheet
          Caption = ' Comiss'#245'es Co&bran'#231'as'
          ImageIndex = 1
          object dbgComissoesCobranca: TtecDBGrid
            Left = 0
            Top = 0
            Width = 953
            Height = 265
            Align = alClient
            DataSource = dtmCadastrosInternos.dsrComissoesCobranca
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -13
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = []
            OnDblClick = dbgComissoesCobrancaDblClick
            OnKeyDown = dbgComissoesCobrancaKeyDown
            RowWrap = 60
            Large = False
            DoubleRowColor = False
            MsgDelete = 'as COMISS'#213'ES COBRAN'#199'AS'
            TitleMinHeight = 100
            CellHeights = 100
            StrippedColor = 16054260
            CanDelete = False
            CanNotInsertFromGrid = False
            PostOnEnter = False
            PostOnSetUpDown = False
            DenySort = False
            DefaultRowHeight = 17
            ExibirNumerodaLinha = False
            NaoAtribuirDadosaTabelaaoDigitar = False
            ShowWhenFieldInvisible = False
            CanClickWhenEditing = False
            Columns = <
              item
                Expanded = False
                FieldName = 'descricao'
                Title.Alignment = taCenter
                Title.Caption = 'Evento'
                Width = 199
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'percfaixa_1'
                Title.Alignment = taCenter
                Title.Caption = '(%) Faixa 1'
                Width = 88
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'percfaixa_2'
                Title.Alignment = taCenter
                Title.Caption = '(%) Faixa 2'
                Width = 88
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'percfaixa_3'
                Title.Alignment = taCenter
                Title.Caption = '(%) Faixa 3'
                Width = 88
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'percfaixa_4'
                Title.Alignment = taCenter
                Title.Caption = '(%) Faixa 4'
                Width = 88
                Visible = True
              end>
          end
        end
        object tstComissoesSobreIndicacoes: TTabSheet
          Caption = 'Comiss'#245'es sobre Indica'#231#245'es'
          ImageIndex = 11
          object sbnIncluirComissoesIndicados: TSpeedButton
            Left = 376
            Top = 15
            Width = 17
            Height = 21
            Hint = 'Incluir Nova Comiss'#227'o'
            Flat = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C37F7F7F7F7F7F7F7F7F8080808080807F7F7F7F7F7F7F7F7F7F7F
              7F808080C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C30000000000000000000000000000000000000000000000000000000000
              00808080C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              00808080C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3FFFFFFFFFFFFFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
              00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C37F7F7FFFFFFFC3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C37F7F7FFFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFF
              FFFF7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000000000000000000000000000000000C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
            NumGlyphs = 2
            OnClick = sbnIncluirComissoesClick
          end
          object sbnExcluirComissoesIndicados: TSpeedButton
            Left = 372
            Top = 37
            Width = 21
            Height = 21
            Hint = 'Excluir Comiss'#227'o'
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
            OnClick = sbnExcluirComissoesClick
          end
          object dbgComissoesVendasIndicados: TtecDBGrid
            Left = 0
            Top = 0
            Width = 369
            Height = 265
            Align = alLeft
            Color = clWhite
            DataSource = dtmCadastrosInternos.dsrComissoesUsuariosIndicados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -13
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = []
            OnDblClick = dbgComissoesVendasDblClick
            OnKeyDown = dbgComissoesVendasKeyDown
            RowWrap = 60
            Large = False
            DoubleRowColor = False
            MsgDelete = 'a COMISS'#195'O DO USU'#193'RIO'
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
                Expanded = False
                FieldName = 'limite'
                Title.Alignment = taCenter
                Title.Caption = 'LIMITE DE VALOR'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 108
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'percprazo'
                Title.Alignment = taCenter
                Title.Caption = '(%) PRAZO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'percentrada'
                Title.Alignment = taCenter
                Title.Caption = '(%) ENTRADA'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'percvista'
                Title.Alignment = taCenter
                Title.Caption = '(%) VISTA'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 70
                Visible = True
              end>
          end
          object gbxIndicador: TGroupBox
            Left = 409
            Top = 0
            Width = 454
            Height = 36
            Caption = 'INDICADOR'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            inline fraConsultaVendedor: TfraConsultaCodigo
              Left = 3
              Top = 10
              Width = 450
              Height = 24
              HorzScrollBar.Range = 448
              HorzScrollBar.Visible = False
              VertScrollBar.Range = 23
              VertScrollBar.Visible = False
              AutoScroll = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              inherited dtxDescricao: TtecDBText
                Width = 360
                DataField = 'nome'
                DataSource = fraConsultaVendedor.dsrProcuraVendedores
              end
              inherited edfCodigo: TtecDBFindLookup
                DataField = 'usuario_indicou'
                DataSource = dtmCadastrosInternos.dsrUsuarios
                MaxLength = 6
                LookupField = 'codigo'
                LookupSource = fraConsultaVendedor.dsrProcuraVendedores
                LookupQueryParameter = 'codigo'
                Parameter = ' '
                ActiveSetControls = False
                DenyInsert = True
                NoSetControls = <>
                SetControls = <>
                LookupParameter = 'codigo'
              end
            end
          end
          object gbxMeusIndicados: TGroupBox
            Left = 408
            Top = 40
            Width = 457
            Height = 217
            Caption = 'MEUS INDICADOS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object dbgMeusIndicados: TtecDBGrid
              Left = 2
              Top = 16
              Width = 453
              Height = 199
              Align = alClient
              DataSource = dtmCadastrosInternos.dsrMeusIndicados
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              ReadOnly = True
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
                  Expanded = False
                  FieldName = 'codigo'
                  Title.Caption = 'VENDEDOR'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'nome'
                  Title.Caption = 'NOME'
                  Width = 64
                  Visible = True
                end>
            end
          end
        end
        object tstComissoesUsuariosGrupos: TTabSheet
          Caption = ' Comiss'#245'es sob Grupo de Produtos'
          ImageIndex = 6
          object sbnIncluirComissoesUsuariosGrupos: TSpeedButton
            Left = 508
            Top = 23
            Width = 21
            Height = 21
            Hint = 'Incluir Nova Comiss'#227'o de Grupos de Produtos'
            Flat = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C37F7F7F7F7F7F7F7F7F8080808080807F7F7F7F7F7F7F7F7F7F7F
              7F808080C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C30000000000000000000000000000000000000000000000000000000000
              00808080C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              00808080C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3FFFFFFFFFFFFFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
              00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C37F7F7FFFFFFFC3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C37F7F7FFFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFF
              FFFF7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000000000000000000000000000000000C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
            NumGlyphs = 2
            OnClick = sbnIncluirComissoesUsuariosGruposClick
          end
          object sbnExcluirComissoesUsuariosGrupos: TSpeedButton
            Left = 508
            Top = 45
            Width = 21
            Height = 21
            Hint = 'Excluir Comiss'#227'o de Grupos de Produtos'
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
            OnClick = sbnExcluirComissoesUsuariosGruposClick
          end
          object dbgComissoesUsuariosGrupos: TtecDBGrid
            Left = 0
            Top = 0
            Width = 505
            Height = 265
            Align = alLeft
            DataSource = dtmCadastrosInternos.dsrComissoesUsuariosGrupos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -13
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = []
            OnDblClick = dbgComissoesUsuariosGruposDblClick
            OnKeyDown = dbgComissoesUsuariosGruposKeyDown
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
                Expanded = False
                FieldName = 'grupo'
                Title.Alignment = taCenter
                Title.Caption = 'GRUPO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'descricao'
                Title.Alignment = taCenter
                Title.Caption = 'DESCRI'#199#195'O'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 300
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'tipocomissao'
                Title.Alignment = taCenter
                Title.Caption = 'TIPO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'comissao'
                Title.Alignment = taCenter
                Title.Caption = 'COMISS'#195'O'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Visible = True
              end>
          end
        end
        object tstComissoesUsuariosClasses: TTabSheet
          Caption = ' Comiss'#245'es sob Classe de Produtos'
          ImageIndex = 7
          object sbnIncluirComissoesUsuariosClasses: TSpeedButton
            Left = 510
            Top = 23
            Width = 21
            Height = 21
            Hint = 'Incluir Nova Comiss'#227'o de Classes de Produtos'
            Flat = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C37F7F7F7F7F7F7F7F7F8080808080807F7F7F7F7F7F7F7F7F7F7F
              7F808080C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C30000000000000000000000000000000000000000000000000000000000
              00808080C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              00808080C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3FFFFFFFFFFFFFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
              00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C37F7F7FFFFFFFC3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C37F7F7FFFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFF
              FFFF7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000000000000000000000000000000000C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
            NumGlyphs = 2
            OnClick = sbnIncluirComissoesUsuariosClassesClick
          end
          object sbnExcluirComissoesUsuariosClasses: TSpeedButton
            Left = 510
            Top = 45
            Width = 21
            Height = 21
            Hint = 'Excluir Comiss'#227'o de Classes de Produtos'
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
            OnClick = sbnExcluirComissoesUsuariosClassesClick
          end
          object dbgComissoesUsuariosClasses: TtecDBGrid
            Left = 0
            Top = 0
            Width = 506
            Height = 265
            Align = alLeft
            DataSource = dtmCadastrosInternos.dsrComissoesUsuariosClasses
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -13
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = []
            OnDblClick = dbgComissoesUsuariosClassesDblClick
            OnKeyDown = dbgComissoesUsuariosClassesKeyDown
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
                Expanded = False
                FieldName = 'classe'
                Title.Alignment = taCenter
                Title.Caption = 'CLASSE'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'descricao'
                Title.Alignment = taCenter
                Title.Caption = 'DESCRI'#199#195'O'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 300
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'tipocomissao'
                Title.Alignment = taCenter
                Title.Caption = 'TIPO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'comissao'
                Title.Alignment = taCenter
                Title.Caption = 'COMISS'#195'O'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Visible = True
              end>
          end
        end
        object tstMetas: TTabSheet
          Caption = ' M&etas'
          ImageIndex = 2
          object sbnExcluirMetas: TSpeedButton
            Left = 440
            Top = 53
            Width = 21
            Height = 21
            Hint = 'Excluir Meta'
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
            OnClick = sbnExcluirMetasClick
          end
          object sbnIncluirMetas: TSpeedButton
            Left = 440
            Top = 31
            Width = 21
            Height = 21
            Hint = 'Incluir Nova Meta'
            Flat = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C37F7F7F7F7F7F7F7F7F8080808080807F7F7F7F7F7F7F7F7F7F7F
              7F808080C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C30000000000000000000000000000000000000000000000000000000000
              00808080C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              00808080C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3FFFFFFFFFFFFFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
              00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C37F7F7FFFFFFFC3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C37F7F7FFFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFF
              FFFF7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000000000000000000000000000000000C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
            NumGlyphs = 2
            OnClick = sbnIncluirMetasClick
          end
          object dbgMetasUsuarios: TtecDBGrid
            Left = 0
            Top = 11
            Width = 435
            Height = 256
            Color = clWhite
            DataSource = dtmCadastrosInternos.dsrMetasUsuarios
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -13
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = []
            OnDblClick = dbgMetasUsuariosDblClick
            OnKeyDown = dbgMetasUsuariosKeyDown
            RowWrap = 60
            Large = False
            DoubleRowColor = False
            MsgDelete = 'a META DO USU'#193'RIO'
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
                Alignment = taCenter
                Expanded = False
                FieldName = 'mesanoeditado'
                Title.Alignment = taCenter
                Title.Caption = 'ANO/M'#202'S'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valor'
                Title.Alignment = taCenter
                Title.Caption = 'VALOR'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 100
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'tipo'
                PickList.Strings = (
                  '%'
                  'V')
                Title.Alignment = taCenter
                Title.Caption = 'TIPO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'comissao'
                Title.Alignment = taCenter
                Title.Caption = 'COMISS'#195'O'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'uteismeta'
                Title.Alignment = taCenter
                Title.Caption = 'META'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'uteismes'
                Title.Alignment = taCenter
                Title.Caption = 'M'#202'S'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 60
                Visible = True
              end>
          end
          object gbxDiasUteis: TGroupBox
            Left = 282
            Top = 0
            Width = 124
            Height = 13
            Caption = 'DIAS '#218'TEIS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
        object tstSAC: TTabSheet
          Caption = ' &SAC'
          ImageIndex = 4
          object gbxOperador: TGroupBox
            Left = 6
            Top = 6
            Width = 75
            Height = 36
            Caption = 'OPERADOR'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object edtOperador: TDBEditTexto
              Left = 2
              Top = 10
              Width = 70
              Height = 23
              DataField = 'operador'
              DataSource = dtmCadastrosInternos.dsrUsuarios
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 0
              CharCasenoDefault = False
              Alignment = taLeftJustify
            end
          end
          object gbxLigacao: TGroupBox
            Left = 268
            Top = 6
            Width = 75
            Height = 36
            Caption = 'LIGA'#199#195'O'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object edtLigacao: TDBEditNumero
              Left = 2
              Top = 10
              Width = 70
              Height = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
              TabOrder = 0
              Text = 'edtLigacao'
              Mascara = True
              Alignment = taLeftJustify
              TipoMascara = tmGERAL
              NrDecimal = 2
              Decimais = False
              Negativo = False
              Tamanho = 4
              DataField = 'ligacao'
              DataSource = dtmCadastrosInternos.dsrUsuarios
            end
          end
          object gbxFiltro: TGroupBox
            Left = 6
            Top = 47
            Width = 338
            Height = 36
            Caption = 'FILTRO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object sbnFiltroSAC: TSpeedButton
              Left = 63
              Top = 10
              Width = 23
              Height = 23
              Hint = 'Procurar Filtro'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7FFFFFFFC3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3800000800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000
                00800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000
                00800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000008000
                00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFF
                FFFFC3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3FFA858800000800000800000FFA858C3C3C30000FF800000800000C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3
                C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFC3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3C3C3C3C3C3C37F
                7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
                FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
                FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
                FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
                FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
                FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
                FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
                FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFFFFFFFC3C3C3C3C3C3C3
                C3C3FFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                800000FFA858FFA858FFA858FFA858FFA858800000C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
                7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3FFA858800000800000800000FFA858C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FC3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
              NumGlyphs = 2
              ParentFont = False
              OnClick = sbnFiltroSACClick
            end
            object flkFiltroSAC: TtecDBFindLookup
              Left = 2
              Top = 10
              Width = 60
              Height = 23
              Alignment = taLeftJustify
              DataField = 'filtrosac'
              DataSource = dtmCadastrosInternos.dsrUsuarios
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
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
              LookupField = 'numero'
              LookupSource = dtmCadastrosInternos.dsrProcuraFiltros
              LookupQueryParameter = 'Numero'
              Parameter = ' '
              ActiveSetControls = False
              DenyInsert = True
              NoSetControls = <>
              SetControls = <>
              LookupParameter = 'Numero'
            end
            object dtxFiltro: TtecDBText
              Left = 85
              Top = 10
              Width = 250
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'descricao'
              DataSource = dtmCadastrosInternos.dsrProcuraFiltros
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              Alignment = taLeftJustify
            end
          end
        end
        object tstUsuariosSetores: TTabSheet
          Caption = ' Se&tores'
          ImageIndex = 5
          TabVisible = False
          object sbnIncluirSetor: TSpeedButton
            Left = 351
            Top = 23
            Width = 21
            Height = 21
            Hint = 'Incluir Setor'
            Flat = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C37F7F7F7F7F7F7F7F7F8080808080807F7F7F7F7F7F7F7F7F7F7F
              7F808080C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C30000000000000000000000000000000000000000000000000000000000
              00808080C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              00808080C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C3C3C3C3FFFFFFFFFFFFFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
              00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C37F7F7FFFFFFFC3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
              C3C37F7F7FFFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFF
              FFFF7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3000000000000000000000000000000000000C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
            NumGlyphs = 2
            OnClick = sbnIncluirSetorClick
          end
          object sbnExcluirSetor: TSpeedButton
            Left = 351
            Top = 45
            Width = 21
            Height = 21
            Hint = 'Excluir Setor'
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
            OnClick = sbnExcluirSetorClick
          end
          object dbgUsuariosSetores: TtecDBGrid
            Left = 0
            Top = 0
            Width = 347
            Height = 265
            Align = alLeft
            Color = clWhite
            DataSource = dtmCadastrosInternos.dsrSetoresUsuarios
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -13
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = []
            OnDblClick = dbgUsuariosSetoresDblClick
            OnKeyDown = dbgUsuariosSetoresKeyDown
            RowWrap = 60
            Large = False
            DoubleRowColor = False
            MsgDelete = 'a SETOR DO USU'#193'RIO'
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
                Expanded = False
                FieldName = 'grupo'
                Title.Alignment = taCenter
                Title.Caption = 'C'#211'DIGO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'descricao'
                Title.Alignment = taCenter
                Title.Caption = 'DESCRI'#199#195'O'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 250
                Visible = True
              end>
          end
        end
        object tstInternet: TTabSheet
          Caption = ' &Internet'
          ImageIndex = 8
          object pgcInternet: TtecPageControl
            Left = 0
            Top = 0
            Width = 953
            Height = 265
            ActivePage = tstConexao
            Align = alClient
            TabOrder = 0
            object tstConexao: TTabSheet
              Caption = '&Conex'#227'o'
              object gbxEmail: TGroupBox
                Left = 6
                Top = 4
                Width = 245
                Height = 131
                Caption = ' e-MAIL '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                object gbx_email: TGroupBox
                  Left = 0
                  Top = 15
                  Width = 245
                  Height = 36
                  Caption = 'e-MAIL'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  object edtEmail: TDBEditTexto
                    Left = 2
                    Top = 10
                    Width = 240
                    Height = 23
                    CharCase = ecLowerCase
                    DataField = 'email'
                    DataSource = dtmCadastrosInternos.dsrUsuarios
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    MaxLength = 8
                    ParentFont = False
                    TabOrder = 0
                    CharCasenoDefault = True
                    Alignment = taLeftJustify
                  end
                end
                object gbx_Usuario: TGroupBox
                  Left = 0
                  Top = 55
                  Width = 245
                  Height = 36
                  Caption = 'USU'#193'RIO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  object edtUsuarioEmail: TDBEditTexto
                    Left = 2
                    Top = 10
                    Width = 240
                    Height = 23
                    CharCase = ecLowerCase
                    DataField = 'usuarioemail'
                    DataSource = dtmCadastrosInternos.dsrUsuarios
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    MaxLength = 15
                    ParentFont = False
                    TabOrder = 0
                    CharCasenoDefault = True
                    Alignment = taLeftJustify
                  end
                end
                object gbx_Senha: TGroupBox
                  Left = 0
                  Top = 95
                  Width = 245
                  Height = 36
                  Caption = 'SENHA'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  object edtSenhaEmail: TEdit
                    Left = 2
                    Top = 10
                    Width = 240
                    Height = 23
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    ParentFont = False
                    PasswordChar = '*'
                    TabOrder = 0
                    OnChange = edtSenhaEmailChange
                  end
                end
              end
              object gbxIteclux: TGroupBox
                Left = 263
                Top = 4
                Width = 245
                Height = 131
                Caption = ' i-tecLUX '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                object gbxSenhaItecLUX_1: TGroupBox
                  Left = 0
                  Top = 55
                  Width = 245
                  Height = 36
                  Caption = 'SENHA'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  object edtSenhaitecLUX: TEdit
                    Left = 2
                    Top = 10
                    Width = 240
                    Height = 23
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    ParentFont = False
                    PasswordChar = '*'
                    TabOrder = 0
                    OnExit = edtSenhaItecluxExit
                  end
                end
                object gbxSenhaItecLUX_2: TGroupBox
                  Left = 0
                  Top = 95
                  Width = 245
                  Height = 36
                  Caption = 'CONFIRMA'#199#195'O'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  object edtConfirmaSenhaitecLUX: TEdit
                    Left = 2
                    Top = 10
                    Width = 240
                    Height = 23
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    ParentFont = False
                    PasswordChar = '*'
                    TabOrder = 0
                    OnExit = edtSenhaItecluxExit
                  end
                end
                object gbxUusuarioi_tecLUX: TGroupBox
                  Left = 0
                  Top = 15
                  Width = 245
                  Height = 36
                  Caption = 'USU'#193'RIO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  object edtUsuarioitecLUX: TDBEditTexto
                    Left = 2
                    Top = 10
                    Width = 240
                    Height = 23
                    CharCase = ecLowerCase
                    DataField = 'usuarioiteclux'
                    DataSource = dtmCadastrosInternos.dsrUsuarios
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    MaxLength = 17
                    ParentFont = False
                    TabOrder = 0
                    OnExit = edtSenhaItecluxExit
                    CharCasenoDefault = True
                    Alignment = taLeftJustify
                  end
                end
              end
              object gbxPOP3: TGroupBox
                Left = 3
                Top = 150
                Width = 245
                Height = 50
                Caption = ' POP3 '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
                object gbxPortaPOP3: TGroupBox
                  Left = 0
                  Top = 15
                  Width = 55
                  Height = 36
                  Caption = 'PORTA'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  object edtPortaPop: TDBEditTexto
                    Left = 2
                    Top = 10
                    Width = 50
                    Height = 23
                    DataField = 'portapop'
                    DataSource = dtmCadastrosInternos.dsrUsuarios
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    MaxLength = 11
                    ParentFont = False
                    TabOrder = 0
                    CharCasenoDefault = False
                    Alignment = taLeftJustify
                  end
                end
                object gbxHostPOP3: TGroupBox
                  Left = 54
                  Top = 15
                  Width = 191
                  Height = 36
                  Caption = 'HOST'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  object edtHostPop: TDBEditTexto
                    Left = 2
                    Top = 10
                    Width = 186
                    Height = 23
                    CharCase = ecLowerCase
                    DataField = 'hostpop'
                    DataSource = dtmCadastrosInternos.dsrUsuarios
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    MaxLength = 10
                    ParentFont = False
                    TabOrder = 0
                    CharCasenoDefault = True
                    Alignment = taLeftJustify
                  end
                end
              end
              object gbxSMTP: TGroupBox
                Left = 263
                Top = 150
                Width = 245
                Height = 50
                Caption = ' SMTP '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 3
                object gbxPortaSMTP: TGroupBox
                  Left = 0
                  Top = 15
                  Width = 55
                  Height = 36
                  Caption = 'PORTA'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  object edtPortaSmtp: TDBEditTexto
                    Left = 2
                    Top = 10
                    Width = 51
                    Height = 23
                    DataField = 'portasmtp'
                    DataSource = dtmCadastrosInternos.dsrUsuarios
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
                object gbxHostSMTP: TGroupBox
                  Left = 54
                  Top = 15
                  Width = 191
                  Height = 36
                  Caption = 'HOST'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  object edtHostSmtp: TDBEditTexto
                    Left = 2
                    Top = 10
                    Width = 186
                    Height = 23
                    CharCase = ecLowerCase
                    DataField = 'hostsmtp'
                    DataSource = dtmCadastrosInternos.dsrUsuarios
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    MaxLength = 11
                    ParentFont = False
                    TabOrder = 0
                    CharCasenoDefault = True
                    Alignment = taLeftJustify
                  end
                end
              end
              object ckbClientesCartaoCredito: TDBCheckBox
                Left = 7
                Top = 211
                Width = 206
                Height = 20
                Caption = 'Meu servidor requer autentica'#231#227'o'
                DataField = 'autenticarsmtp'
                DataSource = dtmCadastrosInternos.dsrUsuarios
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
              object ckbMeuServidorRequerUmaConexaodeSegurancaSSL: TDBCheckBox
                Left = 223
                Top = 211
                Width = 330
                Height = 20
                Caption = 'Meu servidor requer uma conex'#227'o de seguran'#231'a (SSL)'
                DataField = 'smtprequerssl'
                DataSource = dtmCadastrosInternos.dsrUsuarios
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
                OnClick = ckbMeuServidorRequerUmaConexaodeSegurancaSSLClick
              end
              object ckbMeuServidorRequerUmaConexaodeSegurancaTLS: TDBCheckBox
                Left = 559
                Top = 211
                Width = 58
                Height = 20
                Caption = 'TLS'
                DataField = 'smtprequertls'
                DataSource = dtmCadastrosInternos.dsrUsuarios
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
                OnClick = ckbMeuServidorRequerUmaConexaodeSegurancaTLSClick
              end
              object btnEnviarEmailTeste: TButton
                Left = 520
                Top = 0
                Width = 137
                Height = 25
                Caption = 'Enviar Email Teste'
                TabOrder = 8
                OnClick = btnEnviarEmailTesteClick
              end
              object gbxEmaildeTeste: TGroupBox
                Left = 520
                Top = 31
                Width = 417
                Height = 36
                Caption = 'e-MAIL de Teste'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 4
                object edtEmaildeTeste: TEditTexto
                  Left = 4
                  Top = 10
                  Width = 409
                  Height = 23
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
            object tstConfiguracao: TTabSheet
              Caption = 'C&onfigura'#231#227'o'
              ImageIndex = 1
              object gbxAssunto: TGroupBox
                Left = 6
                Top = 6
                Width = 545
                Height = 36
                Caption = ' ASSUNTO '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                object DBEditTexto1: TDBEditTexto
                  Left = 2
                  Top = 10
                  Width = 540
                  Height = 23
                  DataField = 'Assunto'
                  DataSource = dtmCadastrosInternos.dsrUsuarios
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  MaxLength = 12
                  ParentFont = False
                  TabOrder = 0
                  CharCasenoDefault = True
                  Alignment = taLeftJustify
                end
              end
              object gbxIntroducao: TGroupBox
                Left = 6
                Top = 49
                Width = 545
                Height = 92
                Caption = ' INTRODU'#199#195'O '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                object mmoIntroducao: TtecDBMemo
                  Left = 2
                  Top = 14
                  Width = 541
                  Height = 76
                  Align = alClient
                  DataField = 'introducao'
                  DataSource = dtmCadastrosInternos.dsrUsuarios
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
              end
              object gbxConclusao: TGroupBox
                Left = 6
                Top = 147
                Width = 545
                Height = 84
                Caption = ' CONCLUS'#195'O '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                object mmoConclusao: TtecDBMemo
                  Left = 2
                  Top = 14
                  Width = 541
                  Height = 68
                  Align = alClient
                  DataField = 'conclusao'
                  DataSource = dtmCadastrosInternos.dsrUsuarios
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
              end
            end
          end
        end
        object tstProducao: TTabSheet
          Caption = ' Produ'#231#227'o'
          ImageIndex = 10
          TabVisible = False
          object gbxSalarioHora: TGroupBox
            Left = 6
            Top = 6
            Width = 95
            Height = 36
            Caption = 'SAL'#193'RIO HORA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object edtSalarioHora: TDBEditNumero
              Left = 2
              Top = 10
              Width = 90
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
              TabOrder = 0
              Text = 'edtSalarioHora'
              Mascara = True
              Alignment = taLeftJustify
              TipoMascara = tmGERAL
              NrDecimal = 4
              Decimais = True
              Negativo = False
              Tamanho = 9
              DataField = 'salariohora'
              DataSource = dtmCadastrosInternos.dsrUsuarios
            end
          end
          object gbxAnuenio: TGroupBox
            Left = 108
            Top = 6
            Width = 95
            Height = 36
            Caption = 'ANU'#202'NIO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object edtAnuenio: TDBEditNumero
              Left = 2
              Top = 10
              Width = 90
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
              TabOrder = 0
              Text = 'edtAnuenio'
              Mascara = True
              Alignment = taLeftJustify
              TipoMascara = tmGERAL
              NrDecimal = 4
              Decimais = True
              Negativo = False
              Tamanho = 9
              DataField = 'anuenio'
              DataSource = dtmCadastrosInternos.dsrUsuarios
            end
          end
          object gbxOperacoesProducao: TGroupBox
            Left = 4
            Top = 50
            Width = 693
            Height = 217
            Caption = 'OPERA'#199#213'ES DE PRODU'#199#195'O'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            object dbgOperacoesdeProducao: TtecDBGrid
              Left = 2
              Top = 16
              Width = 689
              Height = 199
              Align = alClient
              DataSource = dtmCadastrosInternos.dsrUsuariosOperacoesProducao
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
              OnDblClick = dbgOperacoesdeProducaoDblClick
              OnKeyDown = dbgOperacoesdeProducaoKeyDown
              RowWrap = 60
              Large = False
              DoubleRowColor = False
              MsgDelete = 'esta opera'#231#227'o'
              TitleMinHeight = 100
              CellHeights = 100
              StrippedColor = 16054260
              CanDelete = True
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
                  Expanded = False
                  FieldName = 'nome'
                  Title.Alignment = taCenter
                  Title.Caption = 'NOME'
                  Width = 80
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'c01'
                  Title.Alignment = taCenter
                  Title.Caption = 'C01'
                  Width = 25
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'c02'
                  Title.Alignment = taCenter
                  Title.Caption = 'C02'
                  Width = 25
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'c03'
                  Title.Alignment = taCenter
                  Title.Caption = 'C03'
                  Width = 25
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'descricaooperacao'
                  ReadOnly = True
                  Title.Caption = 'DESCRI'#199#195'O DA OPERA'#199#195'O'
                  Width = 245
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'nivelconhecimento'
                  Title.Alignment = taCenter
                  Title.Caption = 'N'#205'VEL'
                  Width = 30
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'descricaonivelconhecimento'
                  ReadOnly = True
                  Title.Caption = 'DESCRI'#199#195'O DO N'#205'VEL'
                  Width = 120
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'habilitadosetup'
                  Title.Caption = 'HABILITADO SETUP'
                  Visible = True
                end>
            end
          end
          object gbxTurno: TGroupBox
            Left = 213
            Top = 7
            Width = 211
            Height = 36
            Caption = 'TURNO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            inline fraConsultaTurno: TfraConsultaCodigo
              Left = 2
              Top = 11
              Width = 206
              Height = 23
              HorzScrollBar.Range = 206
              VertScrollBar.Range = 23
              AutoScroll = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              inherited sbnProcura: TSpeedButton
                Left = 24
              end
              inherited dtxDescricao: TtecDBText
                Left = 48
                Width = 158
                DataField = 'descricao'
                DataSource = fraConsultaTurno.dsrProcuraTurnos
              end
              inherited edfCodigo: TtecDBFindLookup
                Width = 25
                DataField = 'turno'
                DataSource = dtmCadastrosInternos.dsrUsuarios
                Group = 'turno'
                MaxLength = 3
                OnFound = nil
                LookupField = 'codigo'
                LookupSource = fraConsultaTurno.dsrProcuraTurnos
                LookupQueryParameter = 'codigo'
                Parameter = ' '
                ActiveSetControls = False
                DenyInsert = True
                NoSetControls = <>
                SetControls = <>
                LookupParameter = 'codigo'
              end
              inherited qryProcuraTurnos: TtecQuery
                inherited qryProcuraTurnoscodigo: TIntegerField
                  DisplayFormat = '0'
                end
              end
            end
          end
        end
      end
      object rgbTipoComissao: TtecDBRadioGroup
        Left = 173
        Top = 133
        Width = 154
        Height = 36
        Caption = ' COMISS'#195'O '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        TabStop = False
        DataField = 'tipocomissao'
        DataSource = dtmCadastrosInternos.dsrUsuarios
        object rbnPrazo: TtecRadioButton
          Left = 21
          Top = 12
          Width = 53
          Height = 17
          Caption = 'Prazo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Value = 'P'
        end
        object rbnVista: TtecRadioButton
          Left = 91
          Top = 12
          Width = 49
          Height = 17
          Caption = 'Vista'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Value = 'V'
        end
      end
      object gbxSeguranca: TGroupBox
        Left = 345
        Top = 50
        Width = 153
        Height = 92
        Caption = ' SEGURAN'#199'A DA SENHA '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        object gbxExpiracao: TGroupBox
          Left = 0
          Top = 15
          Width = 70
          Height = 36
          Caption = 'EXPIRA'#199#195'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object dtxDataExpiracao: TtecDBText
            Left = 2
            Top = 10
            Width = 65
            Height = 23
            TabStop = False
            Color = clBtnFace
            DataField = 'expiracaosenha'
            DataSource = dtmCadastrosInternos.dsrUsuarios
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Alignment = taLeftJustify
          end
        end
        object gbxDiasAviso: TGroupBox
          Left = 68
          Top = 56
          Width = 85
          Height = 36
          Caption = ' AVISO '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object lblDiasAviso: TLabel
            Left = 56
            Top = 16
            Width = 24
            Height = 15
            Caption = 'dias'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
          end
          object edtDiasAvisoSenha: TDBEditNumero
            Left = 2
            Top = 10
            Width = 50
            Height = 23
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            TabOrder = 0
            Text = 'edtDiasAvisoSenha'
            OnExit = edtDiasValidadeSenhaExit
            Mascara = True
            Alignment = taLeftJustify
            TipoMascara = tmGERAL
            NrDecimal = 0
            Decimais = False
            Negativo = False
            Tamanho = 4
            DataField = 'diasavisosenha'
            DataSource = dtmCadastrosInternos.dsrUsuarios
          end
        end
        object gbxValidade: TGroupBox
          Left = 68
          Top = 15
          Width = 85
          Height = 36
          Caption = ' VALIDADE '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object lblDiasValidade: TLabel
            Left = 56
            Top = 16
            Width = 24
            Height = 15
            Caption = 'dias'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
          end
          object edtDiasValidadeSenha: TDBEditNumero
            Left = 2
            Top = 10
            Width = 50
            Height = 23
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            TabOrder = 0
            Text = 'edtDiasValidadeSenha'
            OnExit = edtDiasValidadeSenhaExit
            Mascara = True
            Alignment = taLeftJustify
            TipoMascara = tmGERAL
            NrDecimal = 0
            Decimais = False
            Negativo = False
            Tamanho = 4
            DataField = 'diasvalidadesenha'
            DataSource = dtmCadastrosInternos.dsrUsuarios
          end
        end
      end
      object gbxCodigo: TGroupBox
        Left = 10
        Top = 12
        Width = 75
        Height = 36
        Caption = ' C'#211'DIGO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object gbxNomeCompleto: TGroupBox
        Left = 93
        Top = 12
        Width = 405
        Height = 36
        Caption = ' NOME COMPLETO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object edtNome: TDBEditTexto
          Left = 2
          Top = 10
          Width = 400
          Height = 23
          DataField = 'nome'
          DataSource = dtmCadastrosInternos.dsrUsuarios
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 7
          ParentFont = False
          TabOrder = 0
          CharCasenoDefault = False
          Alignment = taLeftJustify
        end
      end
      object gbxLoginName: TGroupBox
        Left = 94
        Top = 50
        Width = 100
        Height = 36
        Caption = ' LOGIN '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object edtLogin: TDBEditTexto
          Left = 2
          Top = 10
          Width = 95
          Height = 23
          CharCase = ecLowerCase
          DataField = 'usename'
          DataSource = dtmCadastrosInternos.dsrUsuarios
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 8
          ParentFont = False
          TabOrder = 0
          CharCasenoDefault = True
          Alignment = taLeftJustify
        end
      end
      object gbxSenha_1: TGroupBox
        Left = 199
        Top = 50
        Width = 65
        Height = 36
        Caption = ' SENHA '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object edtSenha1: TEdit
          Left = 2
          Top = 10
          Width = 60
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          PasswordChar = '*'
          TabOrder = 0
          OnExit = edtSenhaExit
        end
      end
      object gbxSenha_2: TGroupBox
        Left = 272
        Top = 50
        Width = 65
        Height = 36
        Caption = ' SENHA '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        object edtSenha2: TEdit
          Left = 2
          Top = 10
          Width = 60
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          PasswordChar = '*'
          TabOrder = 0
          OnExit = edtSenhaExit
        end
      end
      object gbxInativo: TGroupBox
        Left = 10
        Top = 50
        Width = 75
        Height = 36
        Caption = ' INATIVO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object edtInativo: TDBEditData
          Left = 2
          Top = 10
          Width = 70
          Height = 23
          Alignment = taCenter
          DataField = 'inativo'
          DataSource = dtmCadastrosInternos.dsrUsuarios
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          Maximo = 365
          Minimo = 37353
          Adicional = 0
          ParentFont = False
          TabOrder = 0
          OnExit = edtInativoExit
          Opcional = True
        end
      end
      object gbxCodigoFolha: TGroupBox
        Left = 209
        Top = 90
        Width = 80
        Height = 36
        Caption = 'C'#211'D. FOLHA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        object edtCodigoFolha: TDBEditNumero
          Left = 2
          Top = 10
          Width = 75
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          TabOrder = 0
          Text = 'edtCodigoFolha'
          Mascara = True
          Alignment = taLeftJustify
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = False
          Negativo = False
          Tamanho = 6
          DataField = 'codigofolha'
          DataSource = dtmCadastrosInternos.dsrUsuarios
        end
      end
      inline fraEnderecoResidencia: TfraEnderecoEditor
        Left = 500
        Top = 8
        Width = 458
        Height = 159
        HorzScrollBar.Visible = False
        VertScrollBar.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        inherited gbxEndereco: TGroupBox
          Left = 3
          Top = 5
          Width = 454
          Height = 149
          Align = alNone
          inherited pnlNumero: TPanel
            Width = 450
            inherited edtNumeroEndereco: TDBEditTexto
              DataField = 'nrrua'
              DataSource = dtmCadastrosInternos.dsrUsuarios
              MaxLength = 9
            end
            inherited edtComplemento: TDBEditTexto
              DataField = 'complemento'
              DataSource = dtmCadastrosInternos.dsrUsuarios
              MaxLength = 14
            end
          end
          inherited pnlBairro: TPanel
            Width = 450
            inherited edtBairro: TtecDoubleDBEdit
              LookupField = 'nomebairrousuario'
              LookupSource = dtmCadastrosInternos.dsrUsuarios
              DataField = 'bairro'
              DataSource = dtmCadastrosInternos.dsrUsuarios
            end
          end
          inherited pnlCidade: TPanel
            Width = 450
            inherited edtEstado: TDBEditTexto
              Left = 393
              Width = 27
              DataField = 'estado'
              DataSource = dtmCadastrosInternos.dsrUsuarios
              MaxLength = 9
              Alignment = taCenter
            end
            inherited edtCidade: TtecDoubleDBEdit
              Left = 80
              Width = 313
              LookupField = 'nomecidadeusuario'
              LookupSource = dtmCadastrosInternos.dsrUsuarios
              DataField = 'cidade'
              DataSource = dtmCadastrosInternos.dsrUsuarios
            end
            inherited edtCEP: TDBEditCep
              DataField = 'cep'
              DataSource = dtmCadastrosInternos.dsrUsuarios
              MaxLength = 9
            end
          end
          inherited pnlRua: TPanel
            Width = 450
            inherited mmoRua: TtecDBMemo
              DataField = 'rua'
              DataSource = dtmCadastrosInternos.dsrUsuarios
              Font.Height = -12
            end
          end
          inherited pnllblCidade: TPanel
            Width = 450
          end
          inherited pnllblBairro: TPanel
            Width = 450
          end
          inherited pnllblNumero: TPanel
            Width = 450
          end
        end
      end
      inline fracgcoucpf1: Tfracgcoucpf
        Left = 10
        Top = 92
        Width = 143
        Height = 77
        HorzScrollBar.Visible = False
        VertScrollBar.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        inherited gbxCPGouCGC: TGroupBox
          Width = 143
          Height = 77
          Caption = ' TIPO DE PESSOA '
          inherited rgbTipoPessoa: TtecDBRadioGroup
            Left = 6
            Top = 10
            DataField = 'pessoatipo'
            DataSource = dtmCadastrosInternos.dsrUsuarios
            inherited rbnFisica: TtecRadioButton
              Top = 7
            end
            inherited rbnJuridica: TtecRadioButton
              Top = 7
            end
          end
          inherited gbxCPF_CNPJ: TGroupBox
            Left = 5
            Top = 36
            inherited edtCPFCNPJ: TDBEditCPFCNPJ
              DataField = 'pessoanumero'
              DataSource = dtmCadastrosInternos.dsrUsuarios
              Font.Height = -12
            end
          end
        end
      end
    end
    object edfCodigoUsuario: TtecDbEditFind
      Left = 12
      Top = 22
      Width = 70
      Height = 23
      Alignment = taLeftJustify
      DataField = 'codigo'
      DataSource = dtmCadastrosInternos.dsrUsuarios
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      Group = 'CadastroUsuario'
      MaxLength = 6
      Maximo = 0
      Minimo = 37353
      Adicional = 0
      Opcional = True
      OnFound = edfCodigoUsuarioFound
      OnMessage = edfCodigoUsuarioMessage
      ParentFont = False
      TabOrder = 1
      PermitirZero = False
      PermitirNulo = False
      Operacao = opATRIBUICAO
      Parameter = 'codigo'
      ActiveSetControls = True
      DenyInsert = False
      NoSetControls = <
        item
          Control = pnlBarra
        end>
      SetControls = <>
    end
  end
  object ecvValidacaoSenha: TtecEditionControlValidation
    EditionControl = <
      item
        Control = edtSenha1
      end
      item
        Control = edtSenha2
      end>
    Left = 455
    Top = 3
  end
  object ecvValidacaoUsuario: TtecEditionControlValidation
    EditionControl = <
      item
        Control = edtLogin
      end>
    Left = 487
    Top = 3
  end
  object aclHabilitar: TActionList
    Left = 528
    Top = 1
    object actHabilitarAbas: TAction
      OnUpdate = actHabilitarAbasUpdate
    end
  end
  object ecvValidacaoSenhaIteclux: TtecEditionControlValidation
    EditionControl = <
      item
        Control = edtConfirmaSenhaitecLUX
      end
      item
        Control = edtSenhaitecLUX
      end
      item
        Control = edtUsuarioitecLUX
      end>
    Left = 568
    Top = 1
  end
end
