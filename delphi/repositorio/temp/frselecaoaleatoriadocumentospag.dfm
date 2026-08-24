object fraSelecaoAleatoriadocumentospag: TfraSelecaoAleatoriadocumentospag
  Left = 0
  Top = 0
  Width = 593
  Height = 324
  TabOrder = 0
  inline fraSelecaoAleatoriaContrato: TfraSelecaoAleatoria
    Left = 0
    Top = 0
    Width = 593
    Height = 324
    HorzScrollBar.Range = 26
    Align = alClient
    AutoScroll = False
    TabOrder = 0
    inherited Splitter1: TSplitter
      Left = 562
      Height = 309
    end
    inherited dbgSelecaoAleatoria: TtecDBGrid
      Width = 562
      Height = 309
      Font.Height = -12
      Font.Name = 'Helvetica'
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
      OnDblClick = fraSelecaoAleatoriadocumentospagdbgSelecaoAleatoriaDblClick
      OnKeyDown = fraSelecaoAleatoriaContratodbgSelecaoAleatoriaKeyDown
      DefaultRowHeight = 19
      Columns = <
        item
          Expanded = False
          FieldName = 'contrato'
          Title.Alignment = taCenter
          Title.Caption = 'Contrato'
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tipo'
          Title.Caption = 'T'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'nome'
          Title.Alignment = taCenter
          Title.Caption = 'Nome do Cliente'
          Width = 208
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'campo'
          PickList.Strings = (
            'contrato'
            'nome')
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
          Width = 106
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
          Visible = True
        end>
    end
    inherited pnlLabels: TPanel
      Left = 565
      Height = 309
      inherited sbnProcura: TSpeedButton
        Hint = 'CTRL + F9 - Procurar documentospag'
        OnClick = fraSelecaoAleatoriadocumentospagsbnProcuraClick
      end
      inherited sbnExcluir: TSpeedButton
        Hint = 'Excluir Contrato'
      end
      inherited sbnExcluirTodos: TSpeedButton
        Hint = 'Excluir todos os documentospag da lista'
      end
      inherited sbnIncluirItem: TSpeedButton
        Hint = 'Incluir documentospag na lista'
      end
    end
    inherited pnlAbaixo: TPanel
      Top = 309
      Width = 593
      Font.Pitch = fpVariable
      inherited lblOrientacao: TLabel
        Font.Pitch = fpVariable
      end
      inherited pnlAbaixoDireita: TPanel
        Left = 562
      end
    end
    inherited qrySelecaoAleatoria: TtecQuery
      Options = [doAutoFillDefs]
      AfterOpen = fraSelecaoAleatoriadocumentospagqrySelecaoAleatoriaAfterOpen
      OnNewRecord = fraSelecaoAleatoriadocumentospagqrySelecaoAleatoriaNewRecord
      Sql.Strings = (
        'SELECT  cast(null as char(20)) as numero,'
        '            cast(null as varchar(60)) as nome,'
        '           ,cast(null as varchar(10)) as campo,'
        '            cast(null as varchar(20)) as opcomparacao,'
        '            cast(null as varchar(2)) as oplogico')
    end
  end
end
