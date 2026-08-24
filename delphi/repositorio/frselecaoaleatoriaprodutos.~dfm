object fraSelecaoAleatoriaprodutos: TfraSelecaoAleatoriaprodutos
  Left = 0
  Top = 0
  Width = 580
  Height = 418
  TabOrder = 0
  inline fraSelecaoAleatoriaProduto: TfraSelecaoAleatoria
    Left = 0
    Top = 0
    Width = 580
    Height = 418
    HorzScrollBar.Range = 26
    Align = alClient
    AutoScroll = False
    TabOrder = 0
    inherited Splitter1: TSplitter
      Left = 545
      Height = 403
      Align = alRight
    end
    inherited dbgSelecaoAleatoria: TtecDBGrid
      Width = 545
      Height = 403
      Align = alClient
      OnDblClick = fraSelecaoAleatoriaProdutodbgSelecaoAleatoriaDblClick
      OnKeyDown = fraSelecaoAleatoriaProdutodbgSelecaoAleatoriaKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'codigo'
          Title.Alignment = taCenter
          Title.Caption = 'Produto'
          Width = 98
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
      Left = 548
      Width = 32
      Height = 403
      Align = alRight
      inherited sbnProcura: TSpeedButton
        Left = 7
        OnClick = fraSelecaoAleatoriaprodutosbnProcuraClick
      end
      inherited sbnExcluir: TSpeedButton
        Left = 7
      end
      inherited sbnExcluirTodos: TSpeedButton
        Left = 7
      end
      inherited sbnIncluirItem: TSpeedButton
        Left = 7
        OnClick = fraSelecaoAleatoriaprodutosbnIncluirItemClick
      end
    end
    inherited pnlAbaixo: TPanel
      Top = 403
      Width = 580
      inherited pnlAbaixoDireita: TPanel
        Left = 549
      end
    end
    inherited qrySelecaoAleatoria: TtecQuery
      AfterOpen = fraSelecaoAleatoriaProdutoqrySelecaoAleatoriaAfterOpen
      OnNewRecord = fraSelecaoAleatoriaProdutoqrySelecaoAleatoriaNewRecord
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
