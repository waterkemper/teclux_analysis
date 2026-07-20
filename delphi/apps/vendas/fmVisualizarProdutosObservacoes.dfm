object frmVisualizarProdutosObservacoes: TfrmVisualizarProdutosObservacoes
  Left = 437
  Top = 180
  Width = 1054
  Height = 567
  Caption = 'Observa'#231#245'es dos produtos para venda'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBottom: TPanel
    Left = 0
    Top = 488
    Width = 1038
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btnOK: TBitBtn
      Left = 432
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 0
      Kind = bkOK
    end
    object btnCancel: TBitBtn
      Left = 536
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object DBCtrlGrid1: TDBCtrlGrid
    Left = 0
    Top = 0
    Width = 1038
    Height = 486
    Align = alTop
    AllowDelete = False
    AllowInsert = False
    PanelHeight = 162
    PanelWidth = 1021
    TabOrder = 1
    object pnlCabecalho: TPanel
      Left = 0
      Top = 0
      Width = 1021
      Height = 33
      Align = alTop
      TabOrder = 0
      object gbxProduto: TGroupBox
        Left = 1
        Top = 1
        Width = 1019
        Height = 32
        Align = alTop
        Caption = 'Produto'
        TabOrder = 0
        object DBDescricao: TDBText
          Left = 173
          Top = 11
          Width = 838
          Height = 17
          DataField = 'descricao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbCodigoVisual: TDBText
          Left = 5
          Top = 11
          Width = 161
          Height = 17
          DataField = 'codigovisual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object gbxObservacoes: TGroupBox
      Left = 0
      Top = 33
      Width = 1021
      Height = 129
      Align = alClient
      Caption = 'Observa'#231#245'es para venda'
      TabOrder = 1
      object dbmmoobservacoesvenda: TDBMemo
        Left = 2
        Top = 15
        Width = 1017
        Height = 112
        Align = alClient
        DataField = 'observacoesvenda'
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
end
