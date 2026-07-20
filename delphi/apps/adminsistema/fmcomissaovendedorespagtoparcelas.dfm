inherited frmcomissaovendedorespagtoparcelas: Tfrmcomissaovendedorespagtoparcelas
  Left = 461
  Top = 90
  Caption = 'Relat'#243'rio de comiss'#227'o de vendedores sobre o recebimento'
  ClientHeight = 397
  ClientWidth = 755
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TToolBar
    Width = 755
    inherited sbnImprimir: TSpeedButton
      Font.Height = -12
    end
    inherited sbnAjuda: TSpeedButton
      Font.Height = -12
    end
  end
  inherited pnlFundoJanela: TPanel
    Top = 40
    Width = 755
    Height = 357
    Align = alClient
    object rgbResumo: TtecDBRadioGroup
      Left = 10
      Top = 54
      Width = 125
      Height = 75
      Caption = 'RESUMO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TabStop = False
      object rbnComresumo: TtecRadioButton
        Left = 6
        Top = 15
        Width = 97
        Height = 18
        Caption = 'Com resumo'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = True
      end
      object rbnSemResumo: TtecRadioButton
        Left = 6
        Top = 35
        Width = 97
        Height = 18
        Caption = 'Sem resumo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object rbnSoResumo: TtecRadioButton
        Left = 6
        Top = 55
        Width = 97
        Height = 18
        Caption = 'S'#243' resumo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
    end
    object gbxDataRecebimentos: TGroupBox
      Left = 8
      Top = 12
      Width = 160
      Height = 36
      Caption = ' DATAS DE RECEBIMENTO '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label2: TLabel
        Left = 77
        Top = 16
        Width = 7
        Height = 15
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
      end
      object edtDataInicialRecebimento: TEditData
        Left = 2
        Top = 10
        Width = 70
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 0
        Minimo = 37353
        Maximo = 37353
      end
      object edtDataFinalRecebimento: TEditData
        Left = 87
        Top = 10
        Width = 70
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 1
        Minimo = 37353
        Maximo = 37353
      end
    end
    object gbxListaCondicionalVendedores: TGroupBox
      Left = 175
      Top = 5
      Width = 578
      Height = 348
      Caption = 'Vendedores'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      inline fraSelecaoAleatoriavendedores: TfraSelecaoAleatoriavendedores
        Left = 2
        Top = 16
        Width = 574
        Height = 330
        Align = alClient
        TabOrder = 0
        inherited fraSelecaoAleatoriavendedores: TfraSelecaoAleatoria
          Width = 574
          Height = 330
          inherited Splitter1: TSplitter
            Left = 546
            Height = 315
          end
          inherited dbgSelecaoAleatoria: TtecDBGrid
            Width = 546
            Height = 315
          end
          inherited pnlLabels: TPanel
            Left = 549
            Height = 315
            inherited sbnProcura: TSpeedButton
              Left = 1
            end
            inherited sbnExcluir: TSpeedButton
              Left = 1
            end
            inherited sbnExcluirTodos: TSpeedButton
              Left = 1
            end
            inherited sbnIncluirItem: TSpeedButton
              Left = 1
            end
          end
          inherited pnlAbaixo: TPanel
            Top = 315
            Width = 574
            Font.Pitch = fpVariable
            inherited lblOrientacao: TLabel
              Font.Pitch = fpVariable
            end
            inherited pnlAbaixoDireita: TPanel
              Left = 543
              Font.Pitch = fpVariable
            end
          end
        end
      end
    end
  end
end
