inherited frmParametrosSelecaoLembretes: TfrmParametrosSelecaoLembretes
  Left = 234
  Top = 285
  Width = 564
  Height = 394
  VertScrollBar.Range = 164
  Caption = 'Par'#226'metros Sele'#231#227'o  Lembretes'
  OnCreate = FormCreate
  PixelsPerInch = 75
  inherited sptConsulta: TSplitter
    Top = 160
    Width = 564
  end
  inherited dbgConsulta: TtecDBGrid
    Top = 164
    Width = 564
    Height = 230
    Columns = <
      item
        Expanded = False
        FieldName = 'codigo'
        Title.Alignment = taCenter
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nomecliente'
        Title.Alignment = taCenter
        Width = 330
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lembrar'
        Title.Alignment = taCenter
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'tipo'
        Title.Alignment = taCenter
        Width = 30
        Visible = True
      end>
  end
  inherited pnlCabecalho: TPanel
    Width = 564
    Height = 160
    Constraints.MaxHeight = 160
    Constraints.MaxWidth = 564
    Constraints.MinHeight = 160
    Constraints.MinWidth = 564
    inherited pnlBotoes: TPanel
      Left = 476
      Height = 160
      inherited pnlNrRegistros: TPanel
        Top = 82
        inherited lblNrRegistros: TLabel
          Font.Name = 'adobe-courier'
          Font.Pitch = fpFixed
        end
      end
    end
    inherited pnlCabecalhoDePesquisa: TPanel
      Width = 476
      Height = 160
      inherited sbxItensConsulta: TScrollBox
        Width = 474
        Height = 158
        HorzScrollBar.Range = 470
        VertScrollBar.Range = 154
        inline fraDataLembrete: TfraIntervaloData
          Left = 5
          Top = -1
          Width = 158
          Height = 88
          Constraints.MaxHeight = 88
          Constraints.MaxWidth = 158
          Constraints.MinHeight = 88
          Constraints.MinWidth = 158
          Font.Color = clBlack
          font.height = -12
          Font.Name = 'Times'
          Font.Pitch = fpVariable
          Font.Style = []
          Font.Weight = 40
          ParentFont = False
          TabOrder = 0
          inherited gbxIntervaloData: TGroupBox
            Width = 158
            Height = 88
            Caption = 'Per'#237'odo'
            inherited mkeDataInicio: TMaskEdit
              Left = 68
              Top = 18
              Width = 81
              OnChange = fraIntervaloDataLembretemkeDataInicioChange
            end
            inherited lblDataInicio: TLabel
              Left = 6
              Top = 22
            end
            inherited lblDataFinal: TLabel
              Left = 14
              Top = 55
            end
            inherited mkeDataFinal: TMaskEdit
              Left = 68
              Top = 51
              Width = 81
              OnChange = fraIntervaloDataLembretemkeDataFinalChange
            end
          end
        end
        object rgbConcluido: TRadioGroup
          Left = 292
          Top = 0
          Width = 88
          Height = 88
          Items.Strings = (
            '&Sim'
            '&N'#227'o'
            '&Ambos')
          Caption = '&Conclu'#237'do'
          Constraints.MaxHeight = 88
          Constraints.MaxWidth = 88
          Constraints.MinHeight = 88
          Constraints.MinWidth = 88
          ItemIndex = 1
          TabOrder = 2
          OnClick = rgbConcluidoClick
        end
        object rgbTelefone: TRadioGroup
          Left = 385
          Top = 0
          Width = 85
          Height = 88
          Items.Strings = (
            '&Sim'
            '&N'#227'o'
            '&Ambos')
          Caption = '&Telefone'
          Constraints.MaxHeight = 88
          Constraints.MaxWidth = 85
          Constraints.MinHeight = 88
          Constraints.MinWidth = 85
          ItemIndex = 0
          TabOrder = 3
          OnClick = rgbTelefoneClick
        end
        object rgbTipoAtendimento: TRadioGroup
          Left = 167
          Top = 0
          Width = 122
          Height = 88
          Items.Strings = (
            '&Reclama'#231#227'o'
            '&Visita'
            '&Cobran'#231'a')
          Caption = 'Tipo &atendimento'
          Constraints.MaxHeight = 88
          Constraints.MaxWidth = 122
          Constraints.MinHeight = 88
          Constraints.MinWidth = 122
          ItemIndex = 2
          TabOrder = 1
          OnClick = rgbTipoAtendimentoClick
        end
        object gbxVazio: TGroupBox
          Left = 5
          Top = 93
          Width = 465
          Height = 61
          Constraints.MaxHeight = 61
          Constraints.MaxWidth = 465
          Constraints.MinHeight = 61
          Constraints.MinWidth = 465
          TabOrder = 4
          object sbnConceito: TSpeedButton
            Left = 176
            Top = 32
            Width = 23
            Height = 25
            Glyph.Data = {
              3A060000424D3606000000000000360000002800000020000000100000000100
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
            OnClick = sbnConceitoClick
          end
          object lblDiasdeAtraso: TLabel
            Left = 8
            Top = 10
            Width = 77
            Height = 15
            Caption = 'Dias de Atraso'
            FocusControl = edtAtrasoInicio
          end
          object lblA: TLabel
            Left = 130
            Top = 10
            Width = 6
            Height = 15
            Caption = 'a'
            FocusControl = edtAtrasoFinal
          end
          object lblConceito: TLabel
            Left = 40
            Top = 36
            Width = 45
            Height = 15
            Caption = 'Conceito'
            FocusControl = edfConceito
          end
          object edfConceito: TtecDbEditFind
            Left = 92
            Top = 32
            Width = 81
            Height = 23
            DataField = 'codigo'
            DataSource = dtmParametrosSelecaoAtendimentos.dsrConceito
            Group = 'conceito'
            OnFound = edfConceitoFound
            OnKeyDown = edfConceitoKeyDown
            TabOrder = 5
            Parameter = 'codigo'
            ActiveSetControls = False
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
          end
          object edtAtrasoInicio: TEditNumero
            Left = 92
            Top = 6
            Width = 33
            Height = 23
            MaxLength = 4
            TabOrder = 3
            Text = '1'
            OnChange = edtAtrasoInicioChange
            OnExit = edtAtrasoInicioExit
            Decimais = False
            Negativo = False
            Tamanho = 0
          end
          object edtAtrasoFinal: TEditNumero
            Left = 140
            Top = 6
            Width = 33
            Height = 23
            MaxLength = 4
            TabOrder = 4
            Text = '9999'
            OnChange = edtAtrasoFinalChange
            OnExit = edtAtrasoFinalExit
            Decimais = False
            Negativo = False
            Tamanho = 0
          end
          object dtxConceito: TtecDBText
            Left = 202
            Top = 32
            Width = 257
            Height = 23
            DataField = 'descricao'
            DataSource = dtmParametrosSelecaoAtendimentos.dsrConceito
            BorderStyle = bsSingle
          end
        end
      end
    end
  end
  inherited Source: TtecDataSource
    Left = 347
    Top = 54
  end
end
