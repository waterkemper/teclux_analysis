inherited frmParametrosSelecaoInativos: TfrmParametrosSelecaoInativos
  Left = 276
  Top = 253
  Width = 598
  Height = 394
  VertScrollBar.Range = 164
  Caption = 'Par'#226'metros Sele'#231#227'o Inativos'
  PixelsPerInch = 75
  inherited sptConsulta: TSplitter
    Top = 160
    Width = 598
  end
  inherited dbgConsulta: TtecDBGrid
    Top = 164
    Width = 598
    Height = 230
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
        Width = 425
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'estado'
        Title.Alignment = taCenter
        Title.Caption = 'Estado'
        Width = 50
        Visible = True
      end>
  end
  inherited pnlCabecalho: TPanel
    Width = 598
    Height = 160
    Constraints.MaxHeight = 160
    Constraints.MinHeight = 160
    inherited pnlBotoes: TPanel
      Left = 510
      Height = 160
      inherited pnlNrRegistros: TPanel
        Height = 61
        inherited lblQtde: TLabel
          Top = 40
        end
      end
    end
    inherited pnlCabecalhoDePesquisa: TPanel
      Width = 510
      Height = 160
      inherited sbxItensConsulta: TScrollBox
        Width = 508
        Height = 158
        HorzScrollBar.Range = 504
        VertScrollBar.Range = 154
        inline fraDataPagamento: TfraIntervaloData
          Left = 4
          Top = 0
          Width = 156
          Height = 93
          Constraints.MaxHeight = 93
          Constraints.MaxWidth = 156
          Constraints.MinHeight = 93
          Constraints.MinWidth = 156
          Font.Color = clBlack
          font.height = -12
          Font.Name = 'Times'
          Font.Pitch = fpVariable
          Font.Style = []
          Font.Weight = 40
          ParentFont = False
          TabOrder = 0
          inherited gbxIntervaloData: TGroupBox
            Width = 156
            Height = 93
            Caption = 'Per'#237'odo pagamento'
            inherited mkeDataInicio: TMaskEdit
              Left = 67
              Top = 21
              Width = 81
              OnChange = fraIntervaloData1mkeDataInicioChange
            end
            inherited lblDataInicio: TLabel
              Left = 5
              Top = 24
            end
            inherited lblDataFinal: TLabel
              Left = 12
              Top = 56
            end
            inherited mkeDataFinal: TMaskEdit
              Left = 67
              Top = 53
              Width = 81
              OnChange = fraIntervaloData1mkeDataFinalChange
            end
          end
        end
        object rgpTelefone: TRadioGroup
          Left = 261
          Top = 0
          Width = 92
          Height = 93
          Items.Strings = (
            'Sim'
            'N'#227'o'
            'Ambos')
          Caption = 'Telefone'
          Constraints.MaxHeight = 93
          Constraints.MaxWidth = 92
          Constraints.MinHeight = 93
          Constraints.MinWidth = 92
          ItemIndex = 0
          TabOrder = 2
          OnClick = rgpTelefoneClick
        end
        object gbxConceitos: TGroupBox
          Left = 358
          Top = 7
          Width = 146
          Height = 86
          Constraints.MaxHeight = 86
          Constraints.MaxWidth = 146
          Constraints.MinHeight = 86
          Constraints.MinWidth = 146
          TabOrder = 3
          object sbnConceito: TSpeedButton
            Left = 112
            Top = 4
            Width = 24
            Height = 24
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
          object sbnEstado: TSpeedButton
            Left = 112
            Top = 31
            Width = 24
            Height = 23
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
            OnClick = sbnEstadoClick
          end
          object lblConceito: TLabel
            Left = 7
            Top = 8
            Width = 45
            Height = 15
            Caption = 'Conceito'
          end
          object mkeDiasAtrasoMaximo: TMaskEdit
            Left = 103
            Top = 57
            Width = 37
            Height = 23
            TabOrder = 4
            OnChange = mkeDiasAtrasoMaximoChange
          end
          object lblMaximoAtrasoDias: TLabel
            Left = 5
            Top = 61
            Width = 95
            Height = 15
            Caption = 'M'#225'x. atraso (dias)'
          end
          object lblEstado: TLabel
            Left = 16
            Top = 34
            Width = 36
            Height = 15
            Caption = 'Estado'
          end
          object edfConceito: TtecDbEditFind
            Left = 56
            Top = 4
            Width = 47
            Height = 23
            DataField = 'codigo'
            DataSource = dtmParametrosSelecaoInativos.dsrConceito
            Group = 'conceito'
            OnChange = edfConceitoChange
            OnKeyDown = edfConceitoKeyDown
            TabOrder = 0
            Parameter = 'codigo'
            ActiveSetControls = False
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
          end
          object edfEstado: TtecDbEditFind
            Left = 56
            Top = 30
            Width = 47
            Height = 23
            CharCase = ecUpperCase
            DataField = 'codigo'
            DataSource = dtmParametrosSelecaoInativos.dsrEstado
            Group = 'estado'
            OnChange = edfEstadoChange
            OnExit = edfEstadoExit
            OnKeyDown = edfEstadoKeyDown
            TabOrder = 2
            Parameter = 'codigo'
            ActiveSetControls = False
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
          end
        end
        object rgbRenegociado: TRadioGroup
          Left = 164
          Top = 0
          Width = 92
          Height = 93
          Items.Strings = (
            'Sim'
            'N'#227'o'
            'Ambos')
          Caption = 'Renegociado'
          Constraints.MaxHeight = 93
          Constraints.MaxWidth = 92
          Constraints.MinHeight = 93
          Constraints.MinWidth = 92
          ItemIndex = 1
          TabOrder = 1
          OnClick = rgbRenegociadoClick
        end
        object gbxVazio: TGroupBox
          Left = 304
          Top = 99
          Width = 200
          Height = 54
          Constraints.MaxHeight = 54
          Constraints.MaxWidth = 200
          Constraints.MinHeight = 54
          Constraints.MinWidth = 200
          TabOrder = 4
        end
        object gbxValor: TGroupBox
          Left = 4
          Top = 92
          Width = 297
          Height = 62
          Caption = 'Valor'
          Constraints.MaxHeight = 62
          Constraints.MaxWidth = 297
          Constraints.MinHeight = 62
          Constraints.MinWidth = 297
          TabOrder = 5
          object lblValorMinimo: TLabel
            Left = 8
            Top = 27
            Width = 38
            Height = 15
            Caption = 'M'#237'nimo'
          end
          object lblValorMaximo: TLabel
            Left = 151
            Top = 27
            Width = 41
            Height = 15
            Caption = 'M'#225'ximo'
          end
          object edtValorMinimo: TEditNumero
            Left = 48
            Top = 23
            Width = 91
            Height = 23
            Alignment = taRightJustify
            TabOrder = 2
            Text = '1,00'
            Decimais = True
            Negativo = False
            Tamanho = 0
          end
          object edtValorMaximo: TEditNumero
            Left = 194
            Top = 23
            Width = 91
            Height = 23
            Alignment = taRightJustify
            TabOrder = 3
            Text = '999999999,99'
            Decimais = True
            Negativo = False
            Tamanho = 0
          end
        end
      end
    end
  end
  inherited Source: TtecDataSource
    Left = 339
    Top = 14
  end
end
