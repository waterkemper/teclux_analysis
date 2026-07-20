object fraSelecaoAleatoriaatributos: TfraSelecaoAleatoriaatributos
  Left = 0
  Top = 0
  Width = 580
  Height = 425
  TabOrder = 0
  inline fraSelecaoAleatoriaatributos: TfraSelecaoAleatoria
    Left = 0
    Top = 0
    Width = 580
    Height = 425
    HorzScrollBar.Range = 26
    Align = alClient
    AutoScroll = False
    TabOrder = 0
    inherited Splitter1: TSplitter
      Left = 545
      Height = 410
      Align = alRight
    end
    inherited dbgSelecaoAleatoria: TtecDBGrid
      Width = 545
      Height = 410
      Align = alClient
      OnDblClick = fraSelecaoAleatoriaatributosdbgSelecaoAleatoriaDblClick
      OnKeyDown = fraSelecaoAleatoriaatributosdbgSelecaoAleatoriaKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'atributo'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Atributo'
          Width = 243
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Valor'
          Width = 204
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'validade'
          Title.Alignment = taCenter
          Title.Caption = 'Validade'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'campo'
          Title.Alignment = taCenter
          Title.Caption = 'Aplicar a'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'opcomparacao'
          Title.Alignment = taCenter
          Title.Caption = 'Condi'#231#227'o'
          Visible = False
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
      Height = 410
      Align = alRight
      inherited sbnProcura: TSpeedButton
        Left = 7
        OnClick = fraSelecaoAleatoriaatributosbnProcuraClick
      end
      inherited sbnExcluir: TSpeedButton
        Left = 7
      end
      inherited sbnExcluirTodos: TSpeedButton
        Left = 7
      end
      inherited sbnIncluirItem: TSpeedButton
        Left = 7
        OnClick = fraSelecaoAleatoriaatributosbnIncluirItemClick
      end
    end
    inherited pnlAbaixo: TPanel
      Top = 410
      Width = 580
      inherited pnlAbaixoDireita: TPanel
        Left = 549
      end
    end
    inherited qrySelecaoAleatoria: TtecQuery
      AfterOpen = fraSelecaoAleatoriaatributosqrySelecaoAleatoriaAfterOpen
      OnNewRecord = fraSelecaoAleatoriaatributosqrySelecaoAleatoriaNewRecord
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
