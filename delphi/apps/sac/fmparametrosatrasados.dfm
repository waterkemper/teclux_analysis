inherited frmParametrosAtrasados: TfrmParametrosAtrasados
  Left = 305
  Top = 185
  Width = 483
  Height = 402
  VertScrollBar.Range = 191
  Caption = 'Par'#226'metros Atrasados'
  PixelsPerInch = 75
  inherited sptConsulta: TSplitter
    Top = 187
    Width = 483
  end
  inherited dbgConsulta: TDBGrid
    Top = 191
    Width = 483
    Height = 211
  end
  inherited pnlCabecalho: TPanel
    Width = 483
    Height = 187
    Constraints.MaxHeight = 187
    Constraints.MinHeight = 187
    inherited pnlBotoes: TPanel
      Left = 395
      Height = 187
    end
    inherited pnlCabecalhoDePesquisa: TPanel
      Width = 395
      Height = 187
      inherited sbxItensConsulta: TScrollBox
        Width = 393
        Height = 185
        HorzScrollBar.Range = 388
        VertScrollBar.Range = 180
        object gbxTipoAtraso: TGroupBox
          Left = 5
          Top = 1
          Width = 173
          Height = 179
          Caption = 'Tipo de atraso'
          TabOrder = 0
          object rbnQualquerAtraso: TRadioButton
            Left = 8
            Top = 102
            Width = 113
            Height = 17
            Caption = '&Qualquer atraso'
            TabOrder = 1
            TabStop = False
            OnClick = rbnQualquerAtrasoClick
          end
          object rbnPrimeiroAtraso: TRadioButton
            Left = 8
            Top = 121
            Width = 103
            Height = 17
            Caption = '&Primeiro Atraso'
            TabOrder = 2
            TabStop = False
            OnClick = rbnPrimeiroAtrasoClick
          end
          inline fraDataVencimento: TfraIntervaloData
            Left = 8
            Top = 19
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
                Top = 20
              end
              inherited lblDataFinal: TLabel
                Top = 48
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
            Top = 145
            Width = 121
            Height = 21
            Caption = '&Nenhum Pagamento'
            TabOrder = 3
            OnClick = ckbNenhumPagamentoClick
          end
        end
        object rgpContactados: TRadioGroup
          Left = 183
          Top = 1
          Width = 100
          Height = 100
          Items.Strings = (
            'Sim'
            'N'#227'o'
            'Ambos')
          Caption = 'Contactado&s'
          ItemIndex = 2
          TabOrder = 1
          OnClick = rgpContactadosClick
        end
        object rgbConceitos: TGroupBox
          Left = 184
          Top = 106
          Width = 204
          Height = 41
          TabOrder = 2
          object lblConceitos: TLabel
            Left = 92
            Top = 12
            Width = 51
            Height = 15
            Caption = 'Conce&itos'
            FocusControl = mkeConceitos
          end
          object mkeConceitos: TMaskEdit
            Left = 147
            Top = 8
            Width = 48
            Height = 23
            EditMask = '!99999;0; '
            MaxLength = 5
            TabOrder = 1
            OnChange = mkeConceitosChange
          end
        end
        object rgpTelefone: TRadioGroup
          Left = 288
          Top = 1
          Width = 100
          Height = 100
          Items.Strings = (
            'Sim'
            'N'#227'o'
            'Ambos')
          Caption = 'Telefone'
          ItemIndex = 2
          TabOrder = 3
          OnClick = rgpTelefoneClick
        end
      end
    end
  end
  inherited Source: TDataSource
    DataSet = dtmParametrosAtrasados.qryConsultaAtrasados
    Left = 243
    Top = 150
  end
end
