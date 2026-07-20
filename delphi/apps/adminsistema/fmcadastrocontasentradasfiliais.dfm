inherited frmContasContabeisEntradas: TfrmContasContabeisEntradas
  Left = 212
  Top = 138
  Width = 600
  Height = 152
  HorzScrollBar.Range = 545
  VertScrollBar.Range = 129
  Caption = 'Contas Cont'#225'beis de Entrada'
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 0
    Top = 40
    Width = 563
    Height = 89
    Align = alClient
    Visible = True
    inherited bvlBotoesEd: TBevel
      Left = 299
      Visible = False
    end
    object pnlFilialDescricao: TPanel
      Left = 1
      Top = 1
      Width = 561
      Height = 50
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object lblFilial: TLabel
        Left = 65
        Top = 6
        Width = 27
        Height = 16
        Alignment = taRightJustify
        Caption = 'Filial'
      end
      object lblDescricao: TLabel
        Left = 34
        Top = 32
        Width = 58
        Height = 16
        Alignment = taRightJustify
        Caption = 'Descri'#231#227'o'
      end
      object dtxCodigoFilial: TtecDBText
        Left = 98
        Top = 3
        Width = 48
        Height = 23
        TabStop = False
        BorderStyle = 
        Color = clBtnFace
        DataField = 'codigo'
        DataSource = dtmCadastrosInternos.dsrFiliais
        ReadOnly = True
        TabOrder = 0
        Alignment = taLeftJustify
      end
      object dtxNomeFilial: TtecDBText
        Left = 148
        Top = 3
        Width = 438
        Height = 23
        TabStop = False
        BorderStyle = 
        Color = clBtnFace
        DataField = 'nome'
        DataSource = dtmCadastrosInternos.dsrFiliais
        ReadOnly = True
        TabOrder = 1
        Alignment = taLeftJustify
      end
      object dtxDescricao: TtecDBText
        Left = 98
        Top = 26
        Width = 487
        Height = 23
        TabStop = False
        BorderStyle = 
        Color = clBtnFace
        DataField = 'descricao'
        ReadOnly = True
        TabOrder = 2
        Alignment = taLeftJustify
      end
    end
    object pnlContaContabil: TPanel
      Left = 1
      Top = 51
      Width = 561
      Height = 22
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object sbnProcurarContaEntrada: TSpeedButton
        Left = 188
        Top = 0
        Width = 23
        Height = 23
        Hint = 'Procurar Conta Cont'#225'bil'
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
        OnClick = sbnProcurarContaEntradaClick
      end
      object lblContaContabil: TLabel
        Left = 8
        Top = 8
        Width = 85
        Height = 16
        Alignment = taRightJustify
        Caption = 'Conta Cont'#225'bil'
      end
      object flkConta: TtecDBFindLookup
        Left = 98
        Top = 0
        Width = 88
        Height = 24
        Alignment = taLeftJustify
        DataField = 'contacontabil'
        MaxLength = 5
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        Opcional = True
        ReadOnly = True
        TabOrder = 1
        PermitirZero = False
        PermitirNulo = False
        Operacao = opATRIBUICAO
        LookupField = 'codigo'
        LookupSource = dtmCadastrosInternos.dsrProcuraContas
        LookupQueryParameter = 'codigo'
        Parameter = ' '
        ActiveSetControls = False
        DenyInsert = False
        NoSetControls = <>
        SetControls = <>
        LookupParameter = 'codigo'
      end
      object dtxDescricaoConta: TtecDBText
        Left = 214
        Top = 0
        Width = 371
        Height = 23
        TabStop = False
        BorderStyle = 
        Color = clBtnFace
        DataField = 'descricao'
        DataSource = dtmCadastrosInternos.dsrProcuraContas
        ReadOnly = True
        TabOrder = 0
        Alignment = taLeftJustify
      end
    end
    object pnlFornecedor: TPanel
      Left = 1
      Top = 73
      Width = 561
      Height = 28
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object lblfornecedor: TLabel
        Left = 27
        Top = 8
        Width = 65
        Height = 16
        Caption = 'Fornecedor'
      end
      inline fraConsultaFornecedor: TfraConsultaCodigo
        Left = 91
        Top = 3
        Width = 503
        Height = 26
        HorzScrollBar.Range = 493
        VertScrollBar.Range = 23
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
          Left = 71
        end
        inherited dtxDescricao: TtecDBText
          Left = 95
          Width = 398
          DataField = 'nome'
          DataSource = fraConsultaFornecedor.dsrProcuraCliente
        end
        inherited edfCodigo: TtecDBFindLookup
          Left = 7
          DataField = 'fornecedor'
          MaxLength = 9
          LookupField = 'codigo'
          LookupSource = fraConsultaFornecedor.dsrProcuraCliente
          LookupQueryParameter = 'codigo'
          Parameter = ' '
          ActiveSetControls = False
          DenyInsert = False
          NoSetControls = <>
          SetControls = <>
          LookupParameter = 'codigo'
        end
      end
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 563
    inherited tblBarra: TToolBar
      Width = 338
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
    end
    inherited tblBarraCadastro: TToolBar
      inherited sbnIncluir: TSpeedButton
        Visible = False
      end
    end
  end
end
