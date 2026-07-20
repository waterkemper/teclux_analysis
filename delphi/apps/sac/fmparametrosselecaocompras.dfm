inherited frmParametrosSelecaoCompras: TfrmParametrosSelecaoCompras
  Left = 247
  Top = 295
  Width = 530
  Height = 342
  VertScrollBar.Range = 188
  ActiveControl = fraDataVenda.mkeDataInicio
  Caption = 'Par'#226'metros Sele'#231#227'o Compras'
  OnCreate = FormCreate
  PixelsPerInch = 92
  inherited sptConsulta: TSplitter
    Top = 169
    Width = 530
  end
  inherited dbgConsulta: TtecDBGrid
    Top = 169
    Width = 530
    Height = 154
    Columns = <
      item
        Expanded = False
        FieldName = 'codigo'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nomecliente'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Cliente'
        Width = 205
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'numero'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data'
        Title.Alignment = taCenter
        Title.Caption = 'Data'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'filialvenda'
        Title.Alignment = taCenter
        Title.Caption = 'Filial'
        Width = 32
        Visible = True
      end>
  end
  inherited pnlCabecalho: TPanel
    Width = 530
    Height = 169
    Constraints.MaxHeight = 169
    Constraints.MinHeight = 169
    inherited pnlCabecalhoDePesquisa: TPanel
      Width = 530
      Height = 169
      inherited sbxItensConsulta: TScrollBox
        Width = 528
        Height = 167
        HorzScrollBar.Range = 524
        VertScrollBar.Range = 162
        inherited pnlBotoes: TPanel
          Left = 440
          Height = 167
          TabOrder = 6
        end
        inline fraDataVenda: TfraIntervaloData
          Left = 4
          Top = 1
          Width = 160
          Height = 73
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
            Width = 160
            Caption = 'Data de compra'
            inherited mkeDataInicio: TMaskEdit
              Left = 71
              Top = 16
              Width = 79
              OnChange = fraDataVendamkeDataInicioChange
            end
            inherited lblDataInicio: TLabel
              Width = 31
            end
            inherited lblDataFinal: TLabel
              Top = 46
              Width = 25
            end
            inherited mkeDataFinal: TMaskEdit
              Left = 71
              Width = 79
              OnChange = fraDataVendamkeDataFinalChange
            end
          end
        end
        object gbxGruposFiliais: TGroupBox
          Left = 167
          Top = 8
          Width = 269
          Height = 66
          TabOrder = 1
          object sbnFilial: TSpeedButton
            Left = 125
            Top = 10
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
          object sbnGrupoFiliais: TSpeedButton
            Left = 125
            Top = 36
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
            OnClick = sbnGrupoFiliaisClick
          end
          object edfGruposFiliais: TtecDbEditFind
            Left = 73
            Top = 36
            Width = 50
            Height = 23
            Constraints.MinHeight = 23
            DataField = 'codigo'
            DataSource = dtmParametrosSelecaoCompras.dsrGruposDeFiliais
            Group = 'grupofilial'
            MaxLength = 0
            OnEnter = edfGruposFiliaisEnter
            OnFound = edfGruposFiliaisFound
            TabOrder = 2
            Parameter = 'codigo'
            ActiveSetControls = False
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
          end
          object edfFiliais: TtecDbEditFind
            Left = 73
            Top = 10
            Width = 50
            Height = 23
            Constraints.MinHeight = 23
            DataField = 'codigo'
            DataSource = dtmParametrosSelecaoCompras.dsrFiliais
            Group = 'filial'
            MaxLength = 0
            OnEnter = edfFiliaisEnter
            OnFound = edfFiliaisFound
            TabOrder = 0
            Parameter = 'codigo'
            ActiveSetControls = False
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
          end
          object dtxMnemonicoFilial: TtecDBText
            Left = 151
            Top = 10
            Width = 111
            Height = 23
            DataField = 'mnemonico'
            DataSource = dtmParametrosSelecaoCompras.dsrFiliais
            BorderStyle = bsSingle
          end
          object dtxMnemonicoGrupoFilial: TtecDBText
            Left = 151
            Top = 36
            Width = 111
            Height = 23
            DataField = 'mnemonico'
            DataSource = dtmParametrosSelecaoCompras.dsrGruposDeFiliais
            BorderStyle = bsSingle
          end
          object lblFiliais: TLabel
            Left = 41
            Top = 14
            Width = 33
            Height = 15
            Caption = 'Filiais'
          end
          object lblGrupoFiliais: TLabel
            Left = 6
            Top = 40
            Width = 71
            Height = 15
            Caption = 'Grupo Filiais'
          end
        end
        object rgpEntregue: TRadioGroup
          Left = 4
          Top = 74
          Width = 90
          Height = 88
          Items.Strings = (
            'Sim'
            'N'#227'o'
            'Ambos')
          Caption = 'Entregue'
          Enabled = False
          ItemIndex = 2
          TabOrder = 2
          OnClick = rgpEntregueClick
        end
        object rgpMontado: TRadioGroup
          Left = 99
          Top = 74
          Width = 90
          Height = 88
          Items.Strings = (
            'Sim'
            'N'#227'o'
            'Ambos')
          Caption = 'Montado'
          Enabled = False
          ItemIndex = 2
          TabOrder = 3
          OnClick = rgpMontadoClick
        end
        object rgpTelefone: TRadioGroup
          Left = 194
          Top = 74
          Width = 90
          Height = 88
          Items.Strings = (
            'Sim'
            'N'#227'o'
            'Ambos')
          Caption = 'Telefone'
          ItemIndex = 0
          TabOrder = 4
          OnClick = rgpTelefoneClick
        end
        object gbxValor: TGroupBox
          Left = 290
          Top = 74
          Width = 145
          Height = 88
          Caption = 'Valor'
          Constraints.MaxHeight = 88
          Constraints.MaxWidth = 145
          Constraints.MinHeight = 88
          Constraints.MinWidth = 145
          TabOrder = 5
          object lblValorMinimo: TLabel
            Left = 8
            Top = 24
            Width = 40
            Height = 15
            Caption = 'M'#237'nimo'
          end
          object lblValorMaximo: TLabel
            Left = 5
            Top = 56
            Width = 43
            Height = 15
            Caption = 'M'#225'ximo'
          end
          object edtValorMinimo: TEditNumero
            Left = 48
            Top = 20
            Width = 91
            Height = 23
            Alignment = taRightJustify
            TabOrder = 2
            Text = '1,00'
            Mascara = True
            NrDecimal = 2
            Decimais = True
            Negativo = False
            Tamanho = 0
          end
          object edtValorMaximo: TEditNumero
            Left = 48
            Top = 52
            Width = 91
            Height = 23
            Alignment = taRightJustify
            TabOrder = 3
            Text = '999.999.999,99'
            Mascara = True
            NrDecimal = 2
            Decimais = True
            Negativo = False
            Tamanho = 0
          end
        end
      end
    end
  end
  inherited stbMensagem: TStatusBar
    Top = 323
    Width = 530
  end
  inherited Source: TtecDataSource
    Left = 171
    Top = 14
  end
end
