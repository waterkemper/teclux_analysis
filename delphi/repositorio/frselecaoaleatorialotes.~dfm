object fraSelecaoAleatorialotes: TfraSelecaoAleatorialotes
  Left = 0
  Top = 0
  Width = 557
  Height = 425
  TabOrder = 0
  inline fraSelecaoAleatorialotes: TfraSelecaoAleatoria
    Left = 0
    Top = 0
    Width = 557
    Height = 425
    HorzScrollBar.Range = 26
    Align = alClient
    AutoScroll = False
    TabOrder = 0
    inherited Splitter1: TSplitter
      Left = 522
      Height = 410
      Align = alRight
    end
    inherited dbgSelecaoAleatoria: TtecDBGrid
      Width = 522
      Height = 410
      Align = alClient
      OnDblClick = fraSelecaoAleatorialotesdbgSelecaoAleatoriaDblClick
      OnKeyDown = fraSelecaoAleatorialotesdbgSelecaoAleatoriaKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'nrlote'
          Title.Alignment = taCenter
          Title.Caption = 'Lote'
          Width = 98
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fabricacao'
          Title.Alignment = taCenter
          Title.Caption = 'Fabrica'#231#227'o'
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'validade'
          Title.Alignment = taCenter
          Title.Caption = 'Validade'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'campo'
          PickList.Strings = (
            'nrlote'
            'fabricacao'
            'validade')
          Title.Alignment = taCenter
          Title.Caption = 'Aplicar a'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'opcomparacao'
          PickList.Strings = (
            '= Igual a'
            '<> Diferente de'
            '>= Maior ou Igual a'
            '<= Menor ou Igual a'
            '> Maior que'
            '< Menor que'
            'Cont'#233'm'
            'N'#227'o Cont'#233'm'
            'Contido na Lista'
            'n'#227'o Contido na Lista')
          Title.Alignment = taCenter
          Title.Caption = 'Condi'#231#227'o'
          Width = 115
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'oplogico'
          PickList.Strings = (
            'e'
            'ou')
          Title.Alignment = taCenter
          Title.Caption = 'L'#243'gica'
          Width = 41
          Visible = True
        end>
    end
    inherited pnlLabels: TPanel
      Left = 525
      Width = 32
      Height = 410
      Align = alRight
      inherited sbnProcura: TSpeedButton
        Left = 7
        OnClick = fraSelecaoAleatorialotesbnProcuraClick
      end
      inherited sbnExcluir: TSpeedButton
        Left = 7
      end
      inherited sbnExcluirTodos: TSpeedButton
        Left = 7
      end
      inherited sbnIncluirItem: TSpeedButton
        Left = 7
        OnClick = fraSelecaoAleatorialotesbnIncluirItemClick
      end
    end
    inherited pnlAbaixo: TPanel
      Top = 410
      Width = 557
      inherited pnlAbaixoDireita: TPanel
        Left = 526
      end
    end
    inherited qrySelecaoAleatoria: TtecQuery
      AfterOpen = fraSelecaoAleatorialotesqrySelecaoAleatoriaAfterOpen
      OnNewRecord = fraSelecaoAleatorialotesqrySelecaoAleatoriaNewRecord
      Sql.Strings = (
        'SELECT  cast(null as char(18)) as Codigo,'
        '            cast(null as char(1)) as tipo,'
        '            cast(null as varchar(100)) as descricao,'
        '            cast(null as varchar(10)) as campo,'
        '            cast(null as varchar(20)) as opcomparacao,'
        '            cast(null as varchar(2)) as oplogico')
    end
  end
end
