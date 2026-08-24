inherited frmcadastronfsaidafrete: Tfrmcadastronfsaidafrete
  Left = 393
  Top = 270
  ActiveControl = fraConsultaNota
  Caption = 'Notas fiscais de sa'#237'da - Frete'
  ClientHeight = 227
  ClientWidth = 436
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlTopMenu: TPanel
    Width = 436
    inherited tblBarra: TToolBar
      Width = 211
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
      inherited sbnAjuda: TSpeedButton
        Visible = False
      end
    end
  end
  object gbxDadosNota: TGroupBox
    Left = 0
    Top = 45
    Width = 436
    Height = 182
    Align = alClient
    Caption = 'Dados da Nota'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 2
    object gbxValorNota: TGroupBox
      Left = 8
      Top = 114
      Width = 148
      Height = 49
      Caption = 'VALOR DA NOTA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object edtvalorNota: TDBEditNumero
        Left = 5
        Top = 16
        Width = 137
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = -1
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = False
        Tamanho = 9
        DataField = 'valortotal'
        DataSource = dtmCadastroNotasFiscais.dsrConsultaDadosFiscais
      end
    end
    object gbxCliente: TGroupBox
      Left = 8
      Top = 64
      Width = 417
      Height = 49
      Caption = 'CLIENTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object edtCliente: TDBEditTexto
        Left = 5
        Top = 16
        Width = 101
        Height = 23
        DataField = 'cliente'
        DataSource = dtmCadastroNotasFiscais.dsrConsultaDadosFiscais
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = -1
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        CharCasenoDefault = False
        Alignment = taLeftJustify
      end
      object edtNomeCliente: TDBEditTexto
        Left = 113
        Top = 16
        Width = 299
        Height = 23
        DataField = 'nomecliente'
        DataSource = dtmCadastroNotasFiscais.dsrConsultaDadosFiscais
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = -1
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        CharCasenoDefault = False
        Alignment = taLeftJustify
      end
    end
    object gbxNrNota: TGroupBox
      Left = 9
      Top = 21
      Width = 144
      Height = 38
      Caption = 'N'#186' NOTA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      inline fraConsultaNota: TfraConsultaCodigo
        Left = 3
        Top = 10
        Width = 134
        Height = 26
        HorzScrollBar.Range = 132
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
          Left = 109
          Hint = 'Procura Nota Fiscal'
          OnClick = fraConsultaNotasbnProcuraClick
        end
        inherited dtxDescricao: TtecDBText
          Width = 2
          DataField = 'numero'
        end
        inherited edfCodigo: TtecDBFindLookup
          Width = 106
          DataField = 'numeronota'
          DataSource = dtmCadastroNotasFiscais.dsrConsultaDadosFiscais
          Group = 'Nota'
          MaxLength = 6
          OnFound = fraConsultaNotaedfCodigoFound
          Operacao = opPESQUISA
          Parameter = 'numero'
          ActiveSetControls = True
          DenyInsert = True
          NoSetControls = <>
          SetControls = <
            item
            end>
        end
      end
    end
  end
end
