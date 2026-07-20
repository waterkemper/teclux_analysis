inherited frmRelatorioListasCasamento: TfrmRelatorioListasCasamento
  Left = 385
  Top = 229
  Caption = 'Relat'#243'rio de Listas de Casamento'
  ClientHeight = 302
  ClientWidth = 874
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBarra: TToolBar
    Width = 874
  end
  inherited pnlFundoJanela: TPanel
    Top = 296
    Width = 874
    Height = 6
  end
  inline fraIntervaloDatas: TfraIntervaloDatas
    Left = 6
    Top = 47
    Width = 162
    Height = 36
    Constraints.MaxHeight = 36
    Constraints.MaxWidth = 162
    Constraints.MinHeight = 36
    Constraints.MinWidth = 162
    TabOrder = 2
    inherited gbxPeriodo: TGroupBox
      Caption = ' CASAMENTOS ENTRE'
      inherited edtDataFinal: TEditData
        Maximo = 65535
      end
    end
  end
  object ckbQuebrarPaginaporListadeCasamento: TCheckBox
    Left = 208
    Top = 58
    Width = 321
    Height = 17
    Caption = 'Saltar p'#225'gina na mudan'#231'a de lista de casamento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Helevtica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object gbxListasdeCasamento: TGroupBox
    Left = 0
    Top = 88
    Width = 874
    Height = 208
    Align = alBottom
    Caption = ' LISTAS DE CASAMENTO '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    inline fraSelecaoAleatoriaListadeCasamento: TfraSelecaoAleatoria
      Left = 2
      Top = 16
      Width = 870
      Height = 190
      HorzScrollBar.Range = 26
      Align = alClient
      AutoScroll = False
      TabOrder = 0
      inherited Splitter1: TSplitter
        Left = 843
        Height = 175
      end
      inherited dbgSelecaoAleatoria: TtecDBGrid
        Width = 843
        Height = 175
        Font.Height = -12
        Font.Name = 'Helvetica'
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
        OnDblClick = fraSelecaoAleatoriaListadeCasamentodbgSelecaoAleatoriaDblClick
        OnKeyDown = fraSelecaoAleatoriaListadeCasamentodbgSelecaoAleatoriaKeyDown
        DefaultRowHeight = 19
      end
      inherited pnlLabels: TPanel
        Left = 846
        Width = 27
        Height = 175
        inherited sbnProcura: TSpeedButton
          Hint = 'CTRL + F9 - Procura lista de casamento'
          OnClick = fraSelecaoAleatoriaListadeCasamentosbnProcuraClick
        end
        inherited sbnExcluir: TSpeedButton
          Hint = 'Excluir lista de casamento'
        end
        inherited sbnExcluirTodos: TSpeedButton
          Hint = 'Excluir todas as listas de casamento'
        end
        inherited sbnIncluirItem: TSpeedButton
          Hint = 'Incluir lista de casamento'
        end
      end
      inherited pnlAbaixo: TPanel
        Top = 175
        Width = 870
        Font.Pitch = fpVariable
        inherited lblOrientacao: TLabel
          Font.Pitch = fpVariable
        end
        inherited pnlAbaixoDireita: TPanel
          Left = 839
          Font.Pitch = fpVariable
        end
      end
      inherited qrySelecaoAleatoria: TtecQuery
        AfterOpen = fraSelecaoAleatoriaListadeCasamentoqrySelecaoAleatoriaAfterOpen
        Sql.Strings = (
          'Select lc.codigo,'
          '           lc.nome_noiva,'
          '           lc.nome_noivo,'
          '           lc.data'
          'From  listascasamento lc'
          'WHERE false')
      end
    end
  end
end
