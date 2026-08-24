inherited frmCadastroMotivosParadas: TfrmCadastroMotivosParadas
  Left = 677
  Top = 202
  ActiveControl = edfCodigo
  Caption = 'Cadastro de Motivos das Paradas'
  ClientHeight = 227
  ClientWidth = 406
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 0
    Top = 40
    Width = 406
    Height = 187
    Align = alClient
    BevelOuter = bvNone
    Visible = True
    inherited bvlBotoesEd: TBevel
      Left = 0
      Top = 187
      Width = 406
      Height = 0
      Align = alBottom
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 406
      Height = 187
      ActivePage = tstCadastro
      Align = alClient
      TabOrder = 0
      object tstCadastro: TTabSheet
        Caption = ' Cadastro'
        object gbxCodigoMaquina: TGroupBox
          Left = 2
          Top = 2
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
            DataSource = dtmCadastroMotivosParadas.dsrMotivosParadas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Group = 'maquina'
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
            NoSetControls = <
              item
                Control = gbxDescricao
              end
              item
                Control = ckbBloqueiaMaquina
              end
              item
                Control = tstLog
              end>
            SetControls = <
              item
                Control = gbxDescricao
              end
              item
                Control = tstLog
              end
              item
              end>
          end
        end
        object gbxDescricao: TGroupBox
          Left = 2
          Top = 41
          Width = 330
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
            Width = 325
            Height = 23
            DataField = 'descricao'
            DataSource = dtmCadastroMotivosParadas.dsrMotivosParadas
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
        object ckbBloqueiaMaquina: TDBCheckBox
          Left = 124
          Top = 90
          Width = 210
          Height = 17
          Caption = 'Bloqueia a m'#225'quina'
          DataField = 'bloqueiamaquina'
          DataSource = dtmCadastroMotivosParadas.dsrMotivosParadas
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
        object ckbParadaNaoProgramada: TDBCheckBox
          Left = 124
          Top = 110
          Width = 210
          Height = 17
          Caption = 'Parada n'#227'o programada'
          DataField = 'paradanaoprogramada'
          DataSource = dtmCadastroMotivosParadas.dsrMotivosParadas
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
        object ckbNaoInfluiEficiencia: TDBCheckBox
          Left = 124
          Top = 130
          Width = 210
          Height = 17
          Caption = 'N'#227'o influi no c'#225'lculo da efici'#234'ncia'
          DataField = 'naoinfluieficiencia'
          DataSource = dtmCadastroMotivosParadas.dsrMotivosParadas
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
      end
      object tstLog: TTabSheet
        Caption = ' Log das Opera'#231#245'es'
        ImageIndex = 1
        inline fraRegistroOperacoes1: TfraRegistroOperacoes
          Left = 0
          Top = 0
          Width = 398
          Height = 119
          Align = alTop
          TabOrder = 0
          inherited gbxRegistrodasOperacoes: TGroupBox
            Width = 398
            Height = 119
            Font.Pitch = fpVariable
            inherited gbxRegistroInclusao: TGroupBox
              Width = 191
              Height = 101
              Align = alLeft
              Font.Pitch = fpVariable
              inherited sttDataInclusao: TStaticText
                Width = 187
                Font.Pitch = fpVariable
              end
              inherited sttUsuarioInclusao: TStaticText
                Width = 187
                Font.Pitch = fpVariable
              end
              inherited dtxDataInclusao: TtecDBText
                Font.Pitch = fpVariable
              end
              inherited dtxUsuarioInclusao: TtecDBText
                Font.Pitch = fpVariable
              end
            end
            inherited gbxRegistroAlteracao: TGroupBox
              Left = 193
              Top = 16
              Align = alLeft
              Font.Pitch = fpVariable
              inherited sttDataAlteracao: TStaticText
                Font.Pitch = fpVariable
              end
              inherited dtxDataAlteracao: TtecDBText
                Font.Pitch = fpVariable
              end
              inherited sttUsuarioAlteracao: TStaticText
                Font.Pitch = fpVariable
              end
              inherited dtxUsuarioAlteracao: TtecDBText
                Font.Pitch = fpVariable
              end
              inherited sttOperacao: TStaticText
                Font.Pitch = fpVariable
              end
              inherited dtxOperacao: TtecDBText
                Font.Pitch = fpVariable
              end
              inherited sttTabela: TStaticText
                Font.Pitch = fpVariable
              end
              inherited dtxTabela: TtecDBText
                Font.Pitch = fpVariable
              end
            end
          end
          inherited dsrRegistrodasOperacaoes: TtecDataSource
            DataSet = dtmCadastroMotivosParadas.qryRegistrodasOperacoes
          end
        end
      end
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 406
    inherited tblBarra: TToolBar
      Width = 181
    end
  end
end
