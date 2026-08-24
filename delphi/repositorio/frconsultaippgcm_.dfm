object fraConsultaIPPGCM: TfraConsultaIPPGCM
  Left = 0
  Top = 0
  Width = 542
  Height = 58
  VertScrollBar.Range = 57
  TabOrder = 0
  object pgcProdutos: TtecPageControl
    Left = 0
    Top = 0
    Width = 542
    Height = 57
    ActivePage = tstItemProduto
    Align = alTop
    TabOrder = 0
    TabWidth = 90
    OnChange = pgcProdutosChange
    object tstItemProduto: TTabSheet
      Caption = '  &Item Produto'
      inline fraConsultaItemProduto: TfraConsultaCodigo
        Left = 0
        Top = 0
        Width = 534
        Height = 27
        HorzScrollBar.Range = 529
        VertScrollBar.Range = 23
        Align = alTop
        TabOrder = 0
        inherited sbnProcura: TSpeedButton
          Left = 137
        end
        inherited dtxDescricao: TtecDBText
          Left = 160
          Width = 369
          DataField = 'descricaolc'
          DataSource = fraConsultaItemProduto.dsrProcuraItemProdutos
        end
        inherited edfCodigo: TtecDBFindLookup
          Width = 135
          DataField = 'codigo'
          DataSource = fraConsultaItemProduto.dsrProcuraItemProdutos
          Group = 'ItemProduto'
          MaxLength = 18
          OnExit = fraConsultaItemProdutoedfCodigoExit
          OnFound = nil
          Operacao = opPESQUISA
          Parameter = 'codigo'
          ActiveSetControls = False
          DenyInsert = True
          NoSetControls = <>
          SetControls = <>
        end
      end
    end
    object tstProdutos: TTabSheet
      Caption = ' &Produto'
      ImageIndex = 2
      inline fraConsultaProduto: TfraConsultaCodigo
        Left = 0
        Top = 0
        Width = 534
        Height = 27
        HorzScrollBar.Range = 529
        VertScrollBar.Range = 23
        Align = alTop
        TabOrder = 0
        inherited sbnProcura: TSpeedButton
          Left = 136
        end
        inherited dtxDescricao: TtecDBText
          Left = 159
          Width = 370
          DataField = 'descricao'
          DataSource = fraConsultaProduto.dsrProcuraProdutos
        end
        inherited edfCodigo: TtecDBFindLookup
          Width = 135
          DataField = 'codigo'
          DataSource = fraConsultaProduto.dsrProcuraProdutos
          Group = 'Produto'
          MaxLength = 16
          OnExit = fraConsultaProdutoedfCodigoExit
          OnFound = nil
          Operacao = opPESQUISA
          Parameter = 'codigo'
          ActiveSetControls = False
          DenyInsert = True
          NoSetControls = <>
          SetControls = <>
        end
      end
    end
    object tstGrupodeProdutos: TTabSheet
      Caption = ' &Grupo'
      ImageIndex = 1
      inline fraConsultaGrupo: TfraConsultaCodigo
        Left = 0
        Top = 0
        Width = 534
        Height = 27
        HorzScrollBar.Range = 529
        VertScrollBar.Range = 23
        Align = alTop
        TabOrder = 0
        inherited dtxDescricao: TtecDBText
          Width = 441
          DataField = 'descricao'
          DataSource = fraConsultaGrupo.dsrProcuraGrupoProdutos
        end
        inherited edfCodigo: TtecDBFindLookup
          DataField = 'codigo'
          DataSource = fraConsultaGrupo.dsrProcuraGrupoProdutos
          Group = 'Grupo'
          MaxLength = 2
          OnExit = fraConsultaGrupoedfCodigoExit
          OnFound = nil
          Operacao = opPESQUISA
          Parameter = 'codigo'
          ActiveSetControls = False
          DenyInsert = True
          NoSetControls = <>
          SetControls = <>
        end
      end
    end
    object tstClasses: TTabSheet
      Caption = ' Cla&sse'
      ImageIndex = 3
      inline fraConsultaClasse: TfraConsultaCodigo
        Left = 0
        Top = 0
        Width = 534
        Height = 27
        HorzScrollBar.Range = 529
        VertScrollBar.Range = 23
        Align = alTop
        TabOrder = 0
        inherited dtxDescricao: TtecDBText
          Width = 441
          DataField = 'descricao'
          DataSource = fraConsultaClasse.dsrProcuraClasses
        end
        inherited edfCodigo: TtecDBFindLookup
          DataField = 'codigo'
          DataSource = fraConsultaClasse.dsrProcuraClasses
          Group = 'Classe'
          MaxLength = 4
          OnExit = fraConsultaClasseedfCodigoExit
          OnFound = nil
          Operacao = opPESQUISA
          Parameter = 'codigo'
          ActiveSetControls = False
          DenyInsert = True
          NoSetControls = <>
          SetControls = <>
        end
      end
    end
    object tstMarcas: TTabSheet
      Caption = '&Marcas'
      ImageIndex = 4
      inline fraConsultaMarcas: TfraConsultaCodigo
        Left = 0
        Top = 0
        Width = 534
        Height = 27
        HorzScrollBar.Range = 529
        VertScrollBar.Range = 23
        Align = alTop
        TabOrder = 0
        inherited dtxDescricao: TtecDBText
          Width = 441
          DataField = 'descricao'
          DataSource = fraConsultaMarcas.dsrProcuraMarca
        end
        inherited edfCodigo: TtecDBFindLookup
          DataField = 'codigo'
          DataSource = fraConsultaMarcas.dsrProcuraMarca
          Group = 'Marca'
          MaxLength = 2
          OnExit = fraConsultaMarcasedfCodigoExit
          OnFound = nil
          Operacao = opPESQUISA
          Parameter = 'codigo'
          ActiveSetControls = False
          DenyInsert = True
          NoSetControls = <>
          SetControls = <>
        end
      end
    end
  end
end
