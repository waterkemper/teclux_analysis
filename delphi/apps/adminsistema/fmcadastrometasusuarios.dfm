inherited frmCadastroMetasUsuarios: TfrmCadastroMetasUsuarios
  Left = 465
  Top = 246
  ActiveControl = edtMesAno
  Caption = 'Cadastro de Metas Usu'#225'rios'
  ClientHeight = 265
  ClientWidth = 399
  Color = clBtnFace
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 400
    Top = 2
    Width = 233
  end
  inherited pnlTopMenu: TPanel
    Width = 399
    inherited tblBarra: TToolBar
      Width = 170
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 53
    Width = 399
    Height = 212
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 2
    object gbxMetasUsuarios: TGroupBox
      Left = 3
      Top = 3
      Width = 393
      Height = 206
      Align = alClient
      TabOrder = 0
      object lblAnoMes: TLabel
        Left = 47
        Top = 13
        Width = 52
        Height = 16
        Alignment = taRightJustify
        Caption = 'M'#234's/Ano'
      end
      object lblValor: TLabel
        Left = 70
        Top = 94
        Width = 29
        Height = 16
        Alignment = taRightJustify
        Caption = 'Valor'
      end
      object lblDiasMetas: TLabel
        Left = 1
        Top = 40
        Width = 98
        Height = 16
        Alignment = taRightJustify
        Caption = 'Dias '#250'teis metas'
      end
      object lblDiasMes: TLabel
        Left = 12
        Top = 67
        Width = 87
        Height = 16
        Alignment = taRightJustify
        Caption = 'Dias '#250'teis m'#234's'
      end
      object edtValor: TDBEditNumero
        Left = 102
        Top = 90
        Width = 110
        Height = 24
        MaxLength = -1
        TabOrder = 0
        Text = 'edtValor'
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = False
        Tamanho = 9
        DataField = 'valor'
        DataSource = dtmCadastrosInternos.dsrMetasUsuarios
      end
      object edtDiasMetas: TDBEditNumero
        Left = 102
        Top = 36
        Width = 60
        Height = 24
        MaxLength = -1
        TabOrder = 3
        Text = 'edtDiasMetas'
        Mascara = False
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = False
        Negativo = False
        Tamanho = 2
        DataField = 'uteismeta'
        DataSource = dtmCadastrosInternos.dsrMetasUsuarios
      end
      object edtDiasMes: TDBEditNumero
        Left = 102
        Top = 63
        Width = 60
        Height = 24
        MaxLength = -1
        TabOrder = 2
        Text = 'edtDiasMes'
        Mascara = False
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = False
        Negativo = False
        Tamanho = 2
        DataField = 'uteismes'
        DataSource = dtmCadastrosInternos.dsrMetasUsuarios
      end
      inline fraComissao1: TfraComissao
        Left = 103
        Top = 116
        Width = 163
        Height = 91
        HorzScrollBar.Range = 163
        VertScrollBar.Range = 91
        AutoScroll = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        inherited gbxComissao: TGroupBox
          inherited dtxComissao: TDBEditNumero
            Text = 'dtxComissao'
            DataSource = dtmCadastrosInternos.dsrMetasUsuarios
          end
          inherited rgpTipoComissao: TtecDBRadioGroup
            DataField = 'tipo'
            DataSource = dtmCadastrosInternos.dsrMetasUsuarios
          end
        end
      end
      object edtMesAno: TDBEditmesano
        Left = 102
        Top = 8
        Width = 60
        Height = 24
        DataField = 'mesanoeditado'
        DataSource = dtmCadastrosInternos.dsrMetasUsuarios
        MaxLength = 7
        Maximo = 37353
        Minimo = 37353
        Adicional = 0
        TabOrder = 1
        Opcional = True
      end
    end
  end
end
