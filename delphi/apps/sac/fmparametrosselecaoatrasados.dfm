inherited frmParametrosSelecaoAtrasados: TfrmParametrosSelecaoAtrasados
  Left = 321
  Top = 137
  Width = 483
  Height = 416
  VertScrollBar.Range = 201
  Caption = 'Par'#226'metros Sele'#231#227'o Atrasados'
  PixelsPerInch = 92
  inherited sptConsulta: TSplitter
    Top = 182
    Width = 483
  end
  inherited dbgConsulta: TtecDBGrid
    Top = 182
    Width = 483
    Height = 215
    Columns = <
      item
        Expanded = False
        FieldName = 'codigo'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Cliente'
        Width = 360
        Visible = True
      end>
  end
  inherited pnlCabecalho: TPanel
    Width = 483
    Height = 182
    Constraints.MaxHeight = 182
    Constraints.MinHeight = 182
    inherited pnlCabecalhoDePesquisa: TPanel
      Width = 483
      Height = 182
      inherited sbxItensConsulta: TScrollBox
        Width = 481
        Height = 180
        HorzScrollBar.Range = 474
        VertScrollBar.Range = 177
        inherited pnlBotoes: TPanel
          Left = 393
          Height = 180
          TabOrder = 5
        end
        object gbxTipoAtraso: TGroupBox
          Left = 5
          Top = 1
          Width = 173
          Height = 137
          Caption = 'Tipo de atraso'
          TabOrder = 0
          inline fraDataVencimento: TfraIntervaloData
            Left = 8
            Top = 15
            Width = 155
            Height = 76
            Constraints.MinHeight = 65
            Constraints.MinWidth = 150
            Font.Color = clBlack
            font.height = -12
            Font.Name = 'Times'
            Font.Pitch = fpVariable
            Font.Style = []
            Font.Weight = 40
            ParentFont = False
            TabOrder = 0
            inherited gbxIntervaloData: TGroupBox
              Width = 155
              Height = 76
              Caption = 'Vencimento'
              inherited mkeDataInicio: TMaskEdit
                Left = 69
                Top = 17
                Width = 79
                OnChange = fraDataAtrasomkeDataInicioChange
              end
              inherited lblDataInicio: TLabel
                Width = 31
              end
              inherited lblDataFinal: TLabel
                Width = 25
              end
              inherited mkeDataFinal: TMaskEdit
                Left = 69
                Top = 45
                Width = 79
                OnChange = fraDataAtrasomkeDataFinalChange
              end
            end
          end
          object ckbNenhumPagamento: TCheckBox
            Left = 8
            Top = 113
            Width = 121
            Height = 17
            Caption = '&Nenhum pagamento'
            TabOrder = 2
            OnClick = ckbNenhumPagamentoClick
          end
          object ckbPrimeiroAtraso: TCheckBox
            Left = 8
            Top = 94
            Width = 152
            Height = 18
            Caption = 'Somente Primeiro Atraso'
            Checked = True
            State = cbChecked
            TabOrder = 1
            OnClick = ckbPrimeiroAtrasoClick
          end
        end
        object rgpOcorrencias: TRadioGroup
          Left = 182
          Top = 1
          Width = 100
          Height = 92
          Items.Strings = (
            'Sim'
            'N'#227'o'
            'Ambos')
          Caption = 'Ocorr'#234'ncias'
          Constraints.MaxHeight = 92
          Constraints.MinHeight = 92
          ItemIndex = 1
          TabOrder = 1
          OnClick = rgpOcorrenciasClick
        end
        object rgbCarencia: TGroupBox
          Left = 182
          Top = 98
          Width = 204
          Height = 39
          TabOrder = 3
          object lblCarencia: TLabel
            Left = 109
            Top = 11
            Width = 51
            Height = 15
            Caption = 'Car'#234'ncia'
          end
          object edtCarencia: TEditNumero
            Left = 158
            Top = 7
            Width = 37
            Height = 23
            Alignment = taRightJustify
            TabOrder = 1
            Text = '20,00'
            OnChange = edtCarenciaChange
            Mascara = True
            NrDecimal = 2
            Decimais = False
            Negativo = False
            Tamanho = 0
          end
        end
        object rgpTelefone: TRadioGroup
          Left = 286
          Top = 1
          Width = 100
          Height = 92
          Items.Strings = (
            'Sim'
            'N'#227'o'
            'Ambos')
          Caption = 'Telefone'
          Constraints.MaxHeight = 92
          Constraints.MinHeight = 92
          ItemIndex = 0
          TabOrder = 2
          OnClick = rgpTelefoneClick
        end
        object rgpConceitos: TGroupBox
          Left = 5
          Top = 142
          Width = 381
          Height = 35
          TabOrder = 4
          object sbnFilial: TSpeedButton
            Left = 105
            Top = 7
            Width = 23
            Height = 23
            Flat = True
            Glyph.Data = {
              3A060000424D3606000000000000360000002800000020000000100000000100
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
            OnClick = sbnFilialClick
          end
          object lblConceitos: TLabel
            Left = 8
            Top = 10
            Width = 56
            Height = 15
            Caption = 'Conce&itos'
          end
          object edfConceitos: TtecDbEditFind
            Left = 62
            Top = 5
            Width = 41
            Height = 23
            DataField = 'codigo'
            DataSource = dtmParametrosSelecaoAtrasados.dsrConceitos
            Group = 'Conceitos'
            MaxLength = 0
            OnChange = edfConceitosChange
            TabOrder = 2
            Parameter = 'Codigo'
            ActiveSetControls = False
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
          end
          object dtxAtrasados: TtecDBText
            Left = 130
            Top = 6
            Width = 244
            Height = 23
            DataField = 'descricao'
            DataSource = dtmParametrosSelecaoAtrasados.dsrConceitos
            BorderStyle = bsSingle
          end
        end
      end
    end
  end
  inherited stbMensagem: TStatusBar
    Top = 397
    Width = 483
  end
  inherited Source: TtecDataSource
    Left = 123
    Top = 262
  end
end
