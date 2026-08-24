inherited frmTransferirSaldosContabeis: TfrmTransferirSaldosContabeis
  Left = 603
  Top = 255
  ActiveControl = fraConsultaFilial
  BorderStyle = bsSingle
  Caption = 'Transfer'#234'ncia dos Saldos de Exerc'#237'cio'
  ClientHeight = 173
  ClientWidth = 514
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 0
    Top = 45
    Width = 514
    Height = 128
    Align = alClient
    Visible = True
    inherited bvlBotoesEd: TBevel
      Left = 1
      Top = 39
      Width = 512
      Height = 0
      Align = alTop
      Visible = False
    end
    object gbxFilial: TGroupBox
      Left = 1
      Top = 1
      Width = 512
      Height = 38
      Align = alTop
      Caption = ' FILIAL '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      inline fraConsultaFilial: TfraConsultaCodigo
        Left = 1
        Top = 10
        Width = 509
        Height = 26
        HorzScrollBar.Range = 508
        VertScrollBar.Range = 23
        AutoScroll = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        inherited sbnProcura: TSpeedButton
          Left = 60
          Top = 1
        end
        inherited dtxDescricao: TtecDBText
          Left = 84
          Top = 1
          Width = 425
          DataField = 'nome'
          DataSource = fraConsultaFilial.dsrProcuraFiliais
        end
        inherited edfCodigo: TtecDBFindLookup
          Left = 2
          Width = 56
          DataField = 'codigo'
          DataSource = fraConsultaFilial.dsrProcuraFiliais
          Group = 'filial'
          MaxLength = 3
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
    object gbxExercicios: TGroupBox
      Left = 113
      Top = 56
      Width = 292
      Height = 59
      Caption = ' EXERC'#205'CIOS CONT'#193'BEIS '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Image1: TImage
        Left = 121
        Top = 31
        Width = 53
        Height = 21
        Picture.Data = {
          07544269746D6170C6000000424DC6000000000000003E000000280000003300
          000011000000010001000000000088000000120B0000120B0000020000000200
          0000FFFFFF00000000000000000030001FFF000000003E001FFF000000003F80
          1FFF000000003FE01FFFFFFFFFFFFFF81FFFFFFFFFFFFFFE1FFFFFFFFFFFFFFF
          9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFFFFFFFFFFF1FFFFFFFFFFFFFFC
          1FFFFFFFFFFFFFF01FFF000000003FC01FFF000000003F001FFF000000003C00
          1FFF0000000030001FFF0000000000001FFF}
      end
      object gbxExercicioTransferencia: TGroupBox
        Left = 188
        Top = 14
        Width = 96
        Height = 40
        Caption = ' PR'#211'XIMO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object lblExercicioTransferencia: TLabel
          Left = 2
          Top = 14
          Width = 92
          Height = 24
          Align = alBottom
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -20
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object gbxExercicioAtual: TGroupBox
        Left = 8
        Top = 15
        Width = 97
        Height = 40
        Caption = ' ATUAL '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object lblExercicioAtual: TLabel
          Left = 2
          Top = 14
          Width = 93
          Height = 24
          Align = alBottom
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -20
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 514
    inherited tblBarra: TToolBar
      Left = 75
      Width = 439
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
    end
    inherited tblBarraCadastro: TToolBar
      Width = 75
      object sbnConfirma: TSpeedButton
        Left = 0
        Top = 2
        Width = 75
        Height = 35
        Hint = 'Confirmar a transfer'#234'ncia dos saldos'
        Caption = 'Confirma F5'
        Enabled = False
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C3C3C3C3000000
          0000000000000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F0000
          00000000C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FC3C3C3FFFFFF000000000000
          0000000000000000007F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000
          00000000000000C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3
          C3C3FFFFFFFFFFFFC3C3C37F7F7FFFFFFFC3C3C37F7F7FFFFFFF000000000000
          0000000000000000007F7F7FBFBFBF000000000000BFBFBFBFBFBFBFBFBF0000
          00000000000000C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F
          7F7F7F7F7FFFFFFFC3C3C37F7F7FFFFFFFC3C3C37F7F7FFFFFFF000000000000
          0000000000000000007F7F7FBFBFBF000000000000BFBFBFBFBFBFBFBFBF0000
          00000000000000C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F
          7F7F7F7F7FFFFFFFFFFFFF7F7F7FFFFFFFC3C3C37F7F7FFFFFFF000000000000
          0000000000000000007F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000
          00000000000000C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C37F7F7FFFFFFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000C3C3C37F7F7FFFFFFFC3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000C3C3C37F7F7FFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF7F7F7FFFFFFF000000000000
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00000000000000C3C3C37F7F7FFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F7F7FFFFFFF000000000000
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00000000000000C3C3C37F7F7FFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F7F7FFFFFFF000000000000
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00000000000000C3C3C37F7F7FFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F7F7FFFFFFF000000000000
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00000000000000C3C3C37F7F7FFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F7F7FFFFFFF000000000000
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00000000000000C3C3C37F7F7FFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F7F7FFFFFFF000000000000
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          007F7F7F000000C3C3C37F7F7FFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FFFFFFF000000000000
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00000000000000C3C3C37F7F7FC3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFF7F7F7FC3C3C3C3C3C3000000
          0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          00000000C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3}
        Layout = blGlyphTop
        NumGlyphs = 2
        ParentFont = False
        Spacing = 0
        OnClick = sbnConfirmaClick
      end
    end
  end
  object qryTransferirSaldosExercicio: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT TransferirSaldosExercicio(:AnoAtual, :Filial)')
    RequestLive = False
    Left = 328
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'anoatual'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end>
  end
end
