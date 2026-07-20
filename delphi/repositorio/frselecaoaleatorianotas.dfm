object fraSelecaoAleatorianotas: TfraSelecaoAleatorianotas
  Left = 0
  Top = 0
  Width = 819
  Height = 275
  TabOrder = 0
  inline fraSelecaoAleatorianotas: TfraSelecaoAleatoria
    Left = 0
    Top = 0
    Width = 819
    Height = 228
    HorzScrollBar.Range = 26
    Align = alClient
    AutoScroll = False
    TabOrder = 0
    inherited Splitter1: TSplitter
      Left = 781
      Height = 215
    end
    inherited dbgSelecaoAleatoria: TtecDBGrid
      Width = 781
      Height = 215
      Font.Height = -12
      Font.Name = 'Helvetica'
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
      OnDblClick = fraSelecaoAleatorianotasdbgSelecaoAleatoriaDblClick
      OnKeyDown = fraSelecaoAleatorianotasdbgSelecaoAleatoriaKeyDown
      DefaultRowHeight = 19
      Columns = <
        item
          Expanded = False
          FieldName = 'codigo'
          Title.Alignment = taCenter
          Title.Caption = 'Cli./Fornec.'
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tipo'
          Title.Caption = 'T'
          Width = 10
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Alignment = taCenter
          Title.Caption = 'Nome do Cliente/Fornecedor'
          Width = 144
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'serie'
          Title.Alignment = taCenter
          Title.Caption = 'S'#233'rie'
          Width = 26
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'numeronota'
          Title.Alignment = taCenter
          Title.Caption = 'Nr'#176' NF'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'operacao'
          Title.Caption = 'Op.'
          Width = 19
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'chv_nfe'
          Title.Alignment = taCenter
          Title.Caption = 'Chave NFe'
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valornota'
          Title.Alignment = taCenter
          Title.Caption = 'Valor'
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'campo'
          PickList.Strings = (
            'codigonota'
            'chv_nfe'
            'fornecedor'
            'tipofornecedor'
            'serie'
            'numero'
            'descricao'
            'valornota')
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
          Width = 100
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
          Width = 38
          Visible = True
        end>
    end
    inherited pnlLabels: TPanel
      Left = 784
      Height = 215
      inherited sbnProcura: TSpeedButton
        Hint = 'CTRL + F9 - Procurar notas'
        OnClick = fraSelecaoAleatorianotassbnProcuraClick
      end
      inherited sbnExcluir: TSpeedButton
        Hint = 'Excluir notas'
      end
      inherited sbnExcluirTodos: TSpeedButton
        Hint = 'Excluir todos os notas da lista'
      end
      inherited sbnIncluirItem: TSpeedButton
        Hint = 'Incluir notas na lista'
      end
    end
    inherited pnlAbaixo: TPanel
      Top = 215
      Width = 819
      Height = 13
      Font.Pitch = fpVariable
      inherited lblOrientacao: TLabel
        Font.Pitch = fpVariable
      end
      inherited pnlAbaixoDireita: TPanel
        Left = 788
        Height = 13
      end
    end
    inherited qrySelecaoAleatoria: TtecQuery
      Options = [doAutoFillDefs]
      AfterOpen = fraSelecaoAleatorianotasqrySelecaoAleatoriaAfterOpen
      OnNewRecord = fraSelecaoAleatorianotasqrySelecaoAleatoriaNewRecord
      Sql.Strings = (
        'SELECT  cast(null as char(18)) as codigo,'
        '            cast(null as char(1)) as tipo,'
        '            cast(null as varchar(50)) as descricao,'
        '           ,cast(null as varchar(10)) as campo,'
        '            cast(null as varchar(20)) as opcomparacao,'
        '            cast(null as varchar(2)) as oplogico')
    end
  end
  object pnlParametros: TPanel
    Left = 0
    Top = 228
    Width = 819
    Height = 47
    Align = alBottom
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object gbxPesquisaNFe: TGroupBox
      Left = 4
      Top = -1
      Width = 381
      Height = 41
      Caption = 'Pesquisar CHAVE NFE'
      TabOrder = 0
      object edtNFE: TMaskEdit
        Left = 4
        Top = 15
        Width = 373
        Height = 23
        EditMask = '99\-9999\-99999999999999\-99\-999\-999999999\-9\-99999999\-9;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 52
        ParentFont = False
        TabOrder = 0
        Text = '  -    -              -  -   -         - -        - '
        OnKeyDown = edtNFEKeyDown
      end
    end
  end
end
