object fraSelecaoAleatoriacontasbancarias: TfraSelecaoAleatoriacontasbancarias
  Left = 0
  Top = 0
  Width = 736
  Height = 328
  TabOrder = 0
  inline fraSelecaoAleatoriacontasbancarias: TfraSelecaoAleatoria
    Left = 0
    Top = 0
    Width = 736
    Height = 328
    HorzScrollBar.Range = 26
    Align = alClient
    AutoScroll = False
    TabOrder = 0
    inherited Splitter1: TSplitter
      Left = 697
      Height = 313
    end
    inherited dbgSelecaoAleatoria: TtecDBGrid
      Width = 697
      Height = 313
      OnDblClick = fraSelecaoAleatoriacontasbancariasdbgSelecaoAleatoriaDblClick
      OnKeyDown = fraSelecaoAleatoriacontasbancariasdbgSelecaoAleatoriaKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'conta'
          Title.Alignment = taCenter
          Title.Caption = 'Conta'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nrbanco'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Nr.'
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'banco'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Banco'
          Width = 106
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'agencia'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Ag'#234'ncia'
          Width = 103
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'titular'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Titular'
          Width = 102
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'campo'
          PickList.Strings = (
            'codigo'
            'descricao')
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Aplicar a'
          Width = 74
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
          ReadOnly = True
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
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'L'#243'gica'
          Width = 41
          Visible = True
        end>
    end
    inherited pnlLabels: TPanel
      Left = 700
      Width = 32
      Height = 313
      inherited sbnProcura: TSpeedButton
        Left = 7
        OnClick = fraSelecaoAleatoriacontasbancariasbnProcuraClick
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
      Width = 736
      inherited pnlAbaixoDireita: TPanel
        Left = 705
      end
    end
    inherited qrySelecaoAleatoria: TtecQuery
      AfterOpen = fraSelecaoAleatoriacontasbancariasqrySelecaoAleatoriaAfterOpen
      OnNewRecord = fraSelecaoAleatoriacontasbancariasqrySelecaoAleatoriaNewRecord
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
