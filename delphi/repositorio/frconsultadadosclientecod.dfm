inherited fraConsultaDadosClienteCod: TfraConsultaDadosClienteCod
  Height = 276
  VertScrollBar.Range = 275
  inherited lblEmpresa: TLabel
    Top = 62
  end
  inherited lblNaturalEstado: TLabel
    Top = 62
  end
  inherited lblNaturalCidade: TLabel
    Top = 62
  end
  inherited lblNascimento: TLabel
    Top = 35
  end
  inherited lblDocumento: TLabel
    Left = 159
    Top = 35
  end
  inherited lblSexo: TLabel
    Top = 35
  end
  inherited lblResumoCobranca: TLabel
    Top = 255
  end
  inherited lblCPFCNPJ: TLabel
    Top = 34
  end
  object lblCodigoCliente: TLabel [8]
    Left = 39
    Top = 8
    Width = 34
    Height = 13
    Alignment = taRightJustify
    Caption = 'Código'
  end
  object lblNomeCliente: TLabel [9]
    Left = 197
    Top = 6
    Width = 28
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nome'
  end
  inherited pgcDetalhesCliente: TtecPageControl
    Top = 85
    inherited tstEndereco: TTabSheet
      inherited fraEnderecoCliente: TfraEndereco
        inherited gbxEndereco: TGroupBox
          inherited pnlBairro: TPanel
            inherited edtBairro: TtecDoubleDBEdit
              LookupSource = dsrCliente
              DataSource = dsrCliente
            end
          end
          inherited pnlCidade: TPanel
            inherited edtCEP: TDBEditCep
              DataSource = dsrCliente
            end
            inherited edtCidade: TtecDoubleDBEdit
              LookupSource = dsrCliente
              DataSource = dsrCliente
            end
            inherited edtEstado: TDBEditTexto
              DataSource = dsrCliente
            end
          end
          inherited pnlRua: TPanel
            inherited mmoRua: TtecDBMemo
              DataSource = dsrCliente
            end
          end
        end
      end
    end
    inherited tstSPC: TTabSheet
      inherited dbgSPC: TtecDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'numero'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'datainclusao'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'registradospc'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'eavalista'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'datavencto'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valordebito'
            Visible = True
          end>
      end
    end
    inherited tstCobranca: TTabSheet
      inherited dbgCobranca: TtecDBGrid
        Columns = <
          item
            Alignment = taCenter
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
            FieldName = 'lembrar'
            Title.Alignment = taCenter
            Title.Caption = 'Lembrar'
            Width = 70
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'semspc'
            Title.Alignment = taCenter
            Title.Caption = 'Sem SPC'
            Width = 70
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'semaviso'
            Title.Alignment = taCenter
            Title.Caption = 'Sem aviso'
            Width = 70
            Visible = True
          end>
      end
    end
  end
  inherited dtxEmpresa: TtecDBText
    Top = 57
  end
  inherited dtxNaturalEstado: TtecDBText
    Top = 57
  end
  inherited dtxNaturalCidade: TtecDBText
    Left = 77
    Top = 57
  end
  inherited dtxNascimento: TtecDBText
    Left = 77
    Top = 30
  end
  inherited dtxDocumento: TtecDBText
    Left = 229
    Top = 30
  end
  inherited dtxSexo: TtecDBText
    Top = 30
  end
  object dtxCodigoCliente: TtecDBText [17]
    Left = 77
    Top = 3
    Width = 80
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'codigo'
    DataSource = dtmConsultaDadosCliente.dsrCliente
    ReadOnly = True
    TabOrder = 9
  end
  object dtxNomeCliente: TtecDBText [18]
    Left = 229
    Top = 3
    Width = 316
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'nome'
    DataSource = dtmConsultaDadosCliente.dsrCliente
    ReadOnly = True
    TabOrder = 10
  end
end
