object fraSelecaoAleatoriamodelosProdutos: TfraSelecaoAleatoriamodelosProdutos
  Left = 0
  Top = 0
  Width = 520
  Height = 328
  TabOrder = 0
  inline fraSelecaoAleatoriamodelosProduto: TfraSelecaoAleatoria
    Left = 0
    Top = 0
    Width = 520
    Height = 328
    HorzScrollBar.Range = 26
    Align = alClient
    AutoScroll = False
    TabOrder = 0
    inherited Splitter1: TSplitter
      Left = 485
      Height = 313
      Align = alRight
    end
    inherited dbgSelecaoAleatoria: TtecDBGrid
      Width = 485
      Height = 313
      Align = alClient
      OnDblClick = fraSelecaoAleatoriamodelosProdutodbgSelecaoAleatoriaDblClick
      OnKeyDown = fraSelecaoAleatoriamodelosProdutodbgSelecaoAleatoriaKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'codigo'
          Title.Alignment = taCenter
          Title.Caption = 'MODELO'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'HELVETICA'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 98
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'HELVETICA'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
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
          Title.Caption = 'APLICAR A'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'HELVETICA'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 66
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
          Title.Caption = 'CONDI'#199#195'O'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'HELVETICA'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'oplogico'
          PickList.Strings = (
            'e'
            'ou')
          Title.Alignment = taCenter
          Title.Caption = 'L'#211'GICA'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'HELVETICA'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 41
          Visible = True
        end>
    end
    inherited pnlLabels: TPanel
      Left = 488
      Width = 32
      Height = 313
      Align = alRight
      inherited sbnProcura: TSpeedButton
        Left = 7
        OnClick = fraSelecaoAleatoriamodelosProdutosbnProcuraClick
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
      Width = 520
      inherited pnlAbaixoDireita: TPanel
        Left = 489
      end
    end
    inherited qrySelecaoAleatoria: TtecQuery
      AfterOpen = fraSelecaoAleatoriamodelosProdutoqrySelecaoAleatoriaAfterOpen
      OnNewRecord = fraSelecaoAleatoriamodelosProdutoqrySelecaoAleatoriaNewRecord
      Sql.Strings = (
        'SELECT  cast(null as char(18)) as Codigo,'
        '            cast(null as char(1)) as tipo,'
        '            cast(null as varchar(50)) as descricao,'
        '            cast(null as varchar(10)) as campo,'
        '            cast(null as varchar(20)) as opcomparacao,'
        '            cast(null as varchar(2)) as oplogico')
    end
  end
end
