inherited frmCadastroEquipamentosCliente: TfrmCadastroEquipamentosCliente
  Left = 810
  Top = 290
  ActiveControl = flkEquipamento
  Caption = 'Cadastro de Equipamentos Cliente'
  ClientHeight = 237
  ClientWidth = 536
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    TabOrder = 2
  end
  inherited pnlTopMenu: TPanel
    Width = 536
    inherited tblBarra: TToolBar
      Width = 311
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 40
    Width = 536
    Height = 197
    Align = alClient
    BorderWidth = 3
    TabOrder = 0
    object gbxEquipamentosCliente: TGroupBox
      Left = 4
      Top = 4
      Width = 528
      Height = 189
      Align = alClient
      TabOrder = 0
      object sbnProcurarEquipamento: TSpeedButton
        Left = 146
        Top = 11
        Width = 23
        Height = 23
        Hint = 'Procurar Equipamentos'
        Flat = True
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
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFDCDCDCDCDCDC7F
          7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
          FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDC
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
          DCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
          FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
          FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFFFFFFFDCDCDCDCDCDCDC
          DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
          7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
        NumGlyphs = 2
        OnClick = sbnProcurarEquipamentoClick
      end
      object lblEquipamento: TLabel
        Left = 6
        Top = 15
        Width = 76
        Height = 16
        Alignment = taRightJustify
        Caption = 'Equipamento'
      end
      object Label1: TLabel
        Left = 21
        Top = 41
        Width = 61
        Height = 16
        Alignment = taRightJustify
        Caption = 'Refer'#234'ncia'
      end
      object lblMarca: TLabel
        Left = 46
        Top = 93
        Width = 36
        Height = 16
        Alignment = taRightJustify
        Caption = 'Marca'
      end
      object lblModelo: TLabel
        Left = 40
        Top = 118
        Width = 42
        Height = 16
        Alignment = taRightJustify
        Caption = 'Modelo'
      end
      object lblOpcionais: TLabel
        Left = 24
        Top = 144
        Width = 58
        Height = 16
        Alignment = taRightJustify
        Caption = 'Opcionais'
      end
      object lblAno: TLabel
        Left = 59
        Top = 67
        Width = 23
        Height = 16
        Alignment = taRightJustify
        Caption = 'Ano'
      end
      object flkEquipamento: TtecDBFindLookup
        Left = 85
        Top = 11
        Width = 60
        Height = 24
        Alignment = taLeftJustify
        DataField = 'equipamento'
        MaxLength = 10
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        Opcional = True
        OnMessage = flkEquipamentoMessage
        ReadOnly = True
        TabOrder = 1
        PermitirZero = False
        PermitirNulo = False
        Operacao = opATRIBUICAO
        LookupField = 'codigo'
        LookupQueryParameter = 'codigo'
        Parameter = ' '
        ActiveSetControls = False
        DenyInsert = False
        NoSetControls = <>
        SetControls = <>
        LookupParameter = 'codigo'
      end
      object dtxEquipamento: TtecDBText
        Left = 170
        Top = 11
        Width = 350
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'descricao'
        ReadOnly = True
        TabOrder = 0
        Alignment = taLeftJustify
      end
      object dtxReferencia: TtecDBText
        Left = 85
        Top = 37
        Width = 200
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'referencia'
        ReadOnly = True
        TabOrder = 2
        Alignment = taLeftJustify
      end
      object dtxMarca: TtecDBText
        Left = 85
        Top = 89
        Width = 60
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'marca'
        ReadOnly = True
        TabOrder = 3
        Alignment = taLeftJustify
      end
      object dtxDescricaoMarca: TtecDBText
        Left = 146
        Top = 89
        Width = 200
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'descricaomarca'
        ReadOnly = True
        TabOrder = 4
        Alignment = taLeftJustify
      end
      object dtxModelo: TtecDBText
        Left = 85
        Top = 114
        Width = 261
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'modelo'
        ReadOnly = True
        TabOrder = 5
        Alignment = taLeftJustify
      end
      object dtxOpcionais: TtecDBText
        Left = 85
        Top = 140
        Width = 435
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'opcionais'
        ReadOnly = True
        TabOrder = 6
        Alignment = taLeftJustify
      end
      object dtxAno: TtecDBText
        Left = 85
        Top = 63
        Width = 50
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'ano'
        ReadOnly = True
        TabOrder = 7
        Alignment = taLeftJustify
      end
    end
  end
end
