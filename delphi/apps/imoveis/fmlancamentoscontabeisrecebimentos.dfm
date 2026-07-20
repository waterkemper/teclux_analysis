inherited frmlancamentoscontabeisrecebimentos: Tfrmlancamentoscontabeisrecebimentos
  Left = 409
  Top = 230
  ActiveControl = LancamentosContabeis
  Caption = 'Lan'#231'amentos cont'#225'beis do recebimento'
  ClientHeight = 318
  ClientWidth = 753
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlTopMenu: TPanel
    Width = 753
    inherited tblBarra: TToolBar
      Width = 752
      Visible = False
    end
  end
  inline LancamentosContabeis: TfraLancamentoContabilidade
    Left = 0
    Top = 40
    Width = 753
    Height = 278
    VertScrollBar.Range = 105
    Align = alClient
    AutoScroll = False
    TabOrder = 2
    inherited pnlContabilidade: TPanel
      Width = 753
      Height = 173
      inherited dbgContabilidade: TtecDBGrid
        Width = 725
        Height = 156
      end
      inherited pnlOpcoesContabil: TPanel
        Left = 725
        Height = 156
      end
      inherited pnlLabel: TPanel
        Top = 156
        Width = 753
        inherited lblContaCreditoPagamento: TLabel
          Width = 237
          Height = 16
        end
        inherited lblLegenda: TLabel
          Width = 244
          Height = 16
        end
      end
    end
    inherited pnlDetalheContabilidade: TPanel
      Top = 173
      Width = 753
      inherited pnlTotalContabilidade: TPanel
        Left = 540
      end
      inherited pnlHistoricocontabil: TPanel
        Width = 540
        inherited gbxHistorico: TGroupBox
          Width = 540
          inherited fraConsultaHistoricoContabil: TfraConsultaCodigoContabil
            inherited edfCodigo: TtecDBFindLookup
              DataSource = LancamentosContabeis.dsrLancamentos
              Parameter = ' '
              ActiveSetControls = True
              DenyInsert = True
              NoSetControls = <>
              SetControls = <>
              LookupParameter = 'codigo'
            end
          end
        end
        inherited gbxComplemento: TGroupBox
          Width = 540
          inherited mmoComplemento: TtecDBMemo
            Width = 536
          end
        end
      end
    end
    inherited qryLancamentos: TtecQuery
      Left = 216
      Top = 40
    end
    inherited qryTotais: TtecQuery
      Top = 40
    end
    inherited qryProcuraContaContabil: TtecQuery
      Top = 44
    end
  end
end
