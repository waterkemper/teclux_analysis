inherited frmrelatorioresumosinteticofaturamento: Tfrmrelatorioresumosinteticofaturamento
  Left = 402
  Top = 129
  ActiveControl = edtDataInicial
  Caption = 'Relat'#243'rio de Resumo Sint'#233'tico do Faturamento'
  ClientHeight = 661
  ClientWidth = 708
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TToolBar
    Width = 708
  end
  inherited pnlFundoJanela: TPanel
    Top = 40
    Width = 708
    Height = 689
    Align = alTop
    object gbxResumoSinteticodoFaturamento: TGroupBox
      Left = 3
      Top = 3
      Width = 702
      Height = 683
      Align = alClient
      TabOrder = 0
      object gbxPeriodo: TGroupBox
        Left = 8
        Top = 2
        Width = 289
        Height = 52
        Caption = 'Per'#237'odo do Faturamento'
        TabOrder = 0
        object lblDataInicial: TLabel
          Left = 8
          Top = 24
          Width = 33
          Height = 16
          Alignment = taRightJustify
          Caption = 'Inicial'
        end
        object lblDataFinal: TLabel
          Left = 145
          Top = 24
          Width = 28
          Height = 16
          Alignment = taRightJustify
          Caption = 'Final'
        end
        object edtDataInicial: TEditData
          Left = 45
          Top = 20
          Width = 80
          Height = 24
          MaxLength = 10
          TabOrder = 0
          Minimo = 37353
          Maximo = 0
        end
        object edtDataFinal: TEditData
          Left = 177
          Top = 20
          Width = 80
          Height = 24
          MaxLength = 10
          TabOrder = 1
          Minimo = 37353
          Maximo = 0
        end
      end
      object gbxAgrupamento: TGroupBox
        Left = 8
        Top = 58
        Width = 128
        Height = 81
        Caption = 'Agrupamento'
        TabOrder = 1
        object ckbAgruparGrupoFilial: TCheckBox
          Left = 6
          Top = 16
          Width = 115
          Height = 25
          Caption = '&Grupo de Filial'
          TabOrder = 0
        end
        object ckbAgruparFilial: TCheckBox
          Left = 6
          Top = 35
          Width = 115
          Height = 25
          Caption = '&Filial'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object ckbAgruparVendedor: TCheckBox
          Left = 6
          Top = 54
          Width = 115
          Height = 25
          Caption = '&Vendedor'
          TabOrder = 2
        end
      end
      object gbxDevolucoes: TGroupBox
        Left = 141
        Top = 58
        Width = 157
        Height = 81
        Caption = 'Devolu'#231#245'es de Vendas'
        TabOrder = 2
        object ckbDevolucoesPeriodoSelecionado: TCheckBox
          Left = 8
          Top = 16
          Width = 145
          Height = 30
          Caption = 'S'#243' do Per'#237'odo'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object ckbDevolucoesPeriodoAnterior: TCheckBox
          Left = 8
          Top = 48
          Width = 145
          Height = 30
          Caption = 'Per'#237'odos Anteriores'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
      end
      object ckbSaltarPaginas: TCheckBox
        Left = 311
        Top = 19
        Width = 105
        Height = 20
        Caption = 'Saltar P'#225'ginas'
        TabOrder = 3
        Visible = False
      end
      object gbxListar: TGroupBox
        Left = 303
        Top = 58
        Width = 218
        Height = 81
        Caption = 'Listar'
        TabOrder = 4
        object ckbRecebimentosporContrato: TCheckBox
          Left = 8
          Top = 16
          Width = 145
          Height = 20
          Caption = 'Vendas por &Contrato'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = ckbRecebimentosporContratoClick
        end
        object ckbRecebimentosFrentedeCaixa: TCheckBox
          Left = 8
          Top = 37
          Width = 201
          Height = 20
          Caption = 'Vendas por &Frente de Caixa'
          Checked = True
          State = cbChecked
          TabOrder = 1
          OnClick = ckbRecebimentosFrentedeCaixaClick
        end
      end
      inline fraConsultaFilialGrupoFilial: TfraConsultaFilialGrupoFilial
        Left = 8
        Top = 147
        Width = 673
        Height = 58
        Color = clBtnFace
        ParentColor = False
        TabOrder = 5
        inherited pgcFiliaisGruposFiliais: TPageControl
          Width = 673
          inherited tstFilial: TTabSheet
            inherited fraConsultaFilial: TfraConsultaCodigo
              Font.Pitch = fpVariable
              inherited edfCodigo: TtecDBFindLookup
                Parameter = 'codigo'
                ActiveSetControls = False
                DenyInsert = True
                NoSetControls = <>
                SetControls = <>
              end
            end
          end
          inherited tstGrupodeFilial: TTabSheet
            inherited fraConsultaGrupoFilial: TfraConsultaCodigo
              Font.Pitch = fpVariable
              inherited edfCodigo: TtecDBFindLookup
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
      inline fraConsultaIPPGCM1: TfraConsultaIPPGCM
        Left = 5
        Top = 212
        Width = 679
        Height = 58
        VertScrollBar.Range = 57
        AutoScroll = False
        TabOrder = 6
        inherited pgcProdutos: TtecPageControl
          Width = 679
          inherited tstItemProduto: TTabSheet
            inherited fraConsultaItemProduto: TfraConsultaCodigo
              Width = 671
              Font.Pitch = fpVariable
              inherited edfCodigo: TtecDBFindLookup
                Parameter = 'produtovisual'
                ActiveSetControls = False
                DenyInsert = True
                NoSetControls = <>
                SetControls = <>
              end
            end
          end
          inherited tstProdutos: TTabSheet
            inherited fraConsultaProduto: TfraConsultaCodigo
              Font.Pitch = fpVariable
              inherited edfCodigo: TtecDBFindLookup
                Parameter = 'caracteristicavisual'
                ActiveSetControls = False
                DenyInsert = True
                NoSetControls = <>
                SetControls = <>
              end
            end
          end
          inherited tstGrupodeProdutos: TTabSheet
            inherited fraConsultaGrupo: TfraConsultaCodigo
              Font.Pitch = fpVariable
              inherited edfCodigo: TtecDBFindLookup
                Parameter = 'codigo'
                ActiveSetControls = False
                DenyInsert = True
                NoSetControls = <>
                SetControls = <>
              end
            end
          end
          inherited tstClasses: TTabSheet
            inherited fraConsultaClasse: TfraConsultaCodigo
              Font.Pitch = fpVariable
              inherited edfCodigo: TtecDBFindLookup
                Parameter = 'codigo'
                ActiveSetControls = False
                DenyInsert = True
                NoSetControls = <>
                SetControls = <>
              end
            end
          end
          inherited tstMarcas: TTabSheet
            inherited fraConsultaMarcas: TfraConsultaCodigo
              Font.Pitch = fpVariable
              inherited edfCodigo: TtecDBFindLookup
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
      object gbxClientes: TGroupBox
        Left = 8
        Top = 419
        Width = 681
        Height = 190
        Caption = 'Clientes'
        TabOrder = 7
        inline fraSelecaoAleatoriaClientes1: TfraSelecaoAleatoriaClientes
          Left = 2
          Top = 18
          Width = 677
          Height = 170
          Align = alClient
          TabOrder = 0
          inherited fraSelecaoAleatoriaCliente: TfraSelecaoAleatoria
            Width = 677
            Height = 170
            inherited Splitter1: TSplitter
              Left = 646
              Height = 155
            end
            inherited dbgSelecaoAleatoria: TtecDBGrid
              Width = 646
              Height = 155
            end
            inherited pnlLabels: TPanel
              Left = 649
              Height = 155
            end
            inherited pnlAbaixo: TPanel
              Top = 155
              Width = 677
              inherited pnlAbaixoDireita: TPanel
                Left = 646
                Font.Pitch = fpVariable
              end
            end
          end
        end
      end
      object pgcVendedores: TtecPageControl
        Left = 6
        Top = 279
        Width = 683
        Height = 135
        ActivePage = tstVendedores
        TabOrder = 8
        object tstVendedores: TTabSheet
          Caption = 'Vendedores'
          inline fraSelecaoAleatoriausuariosVendedores: TfraSelecaoAleatoriausuarios
            Left = 0
            Top = 0
            Width = 675
            Height = 104
            Align = alClient
            TabOrder = 0
            inherited fraSelecaoAleatoriausuarios: TfraSelecaoAleatoria
              Width = 675
              Height = 104
              inherited Splitter1: TSplitter
                Left = 641
                Height = 89
              end
              inherited dbgSelecaoAleatoria: TtecDBGrid
                Width = 641
                Height = 89
              end
              inherited pnlLabels: TPanel
                Left = 644
                Height = 89
                inherited sbnProcura: TSpeedButton
                  Left = 5
                end
                inherited sbnExcluir: TSpeedButton
                  Left = 5
                end
                inherited sbnIncluirItem: TSpeedButton
                  Left = 5
                end
              end
              inherited pnlAbaixo: TPanel
                Top = 89
                Width = 675
                Font.Pitch = fpVariable
                inherited lblOrientacao: TLabel
                  Font.Pitch = fpVariable
                end
                inherited pnlAbaixoDireita: TPanel
                  Left = 644
                  Font.Pitch = fpVariable
                end
              end
            end
          end
        end
        object tstGruposdeVendedores: TTabSheet
          Caption = 'Grupos de Vendedores'
          ImageIndex = 2
          inline fraSelecaoAleatoriaGrupoVendedores: TfraSelecaoAleatoriagruposusuarios
            Left = 0
            Top = 0
            Width = 675
            Height = 104
            Align = alClient
            TabOrder = 0
            inherited fraSelecaoAleatoriagruposusuarios: TfraSelecaoAleatoria
              Width = 675
              Height = 104
              inherited Splitter1: TSplitter
                Left = 642
                Height = 89
              end
              inherited dbgSelecaoAleatoria: TtecDBGrid
                Width = 642
                Height = 89
              end
              inherited pnlLabels: TPanel
                Left = 645
                Height = 89
              end
              inherited pnlAbaixo: TPanel
                Top = 89
                Width = 675
                Font.Pitch = fpVariable
                inherited lblOrientacao: TLabel
                  Font.Pitch = fpVariable
                end
                inherited pnlAbaixoDireita: TPanel
                  Left = 644
                  Font.Pitch = fpVariable
                end
              end
            end
          end
        end
      end
    end
  end
end
