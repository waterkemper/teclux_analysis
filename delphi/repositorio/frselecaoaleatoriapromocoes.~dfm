object fraSelecaoaleatoriapromocoes: TfraSelecaoaleatoriapromocoes
  Left = 0
  Top = 0
  Width = 516
  Height = 328
  TabOrder = 0
  inline fraSelecaoAleatoriapromocoes: TfraSelecaoAleatoria
    Left = 0
    Top = 0
    Width = 516
    Height = 328
    HorzScrollBar.Range = 26
    Align = alClient
    AutoScroll = False
    TabOrder = 0
    inherited Splitter1: TSplitter
      Left = 481
      Height = 313
      Align = alRight
    end
    inherited dbgSelecaoAleatoria: TtecDBGrid
      Width = 481
      Height = 313
      Align = alClient
      OnDblClick = fraSelecaoAleatoriapromocoesdbgSelecaoAleatoriaDblClick
      OnKeyDown = fraSelecaoAleatoriapromocoesdbgSelecaoAleatoriaKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'codigo'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Width = 46
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Width = 165
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'campo'
          PickList.Strings = (
            'codigo'
            'descricao')
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
      Left = 484
      Width = 32
      Height = 313
      Align = alRight
      inherited sbnProcura: TSpeedButton
        Left = 7
        OnClick = fraSelecaoaleatoriapromocoesbnProcuraClick
      end
      inherited sbnExcluir: TSpeedButton
        Left = 7
      end
      inherited sbnExcluirTodos: TSpeedButton
        Left = 7
      end
      inherited sbnIncluirItem: TSpeedButton
        Left = 7
      end
    end
    inherited pnlAbaixo: TPanel
      Top = 313
      Width = 516
      inherited pnlAbaixoDireita: TPanel
        Left = 485
      end
    end
    inherited qrySelecaoAleatoria: TtecQuery
      AfterOpen = fraSelecaoAleatoriapromocoesqrySelecaoAleatoriaAfterOpen
      OnNewRecord = fraSelecaoAleatoriapromocoesqrySelecaoAleatoriaNewRecord
      Sql.Strings = (
        'SELECT  cast(null as char(18)) as Codigo,'
        '            cast(null as varchar(50)) as descricao,'
        '            cast(null as varchar(10)) as campo,'
        '            cast(null as varchar(20)) as opcomparacao,'
        '            cast(null as varchar(2)) as oplogico')
      Left = 200
    end
  end
end
