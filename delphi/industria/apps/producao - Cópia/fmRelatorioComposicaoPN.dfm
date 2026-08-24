inherited frmRelatorioComposicaoPN: TfrmRelatorioComposicaoPN
  Left = 672
  Top = 219
  Caption = 'Relat'#243'rio de Composi'#231#227'o de PN'#180's'
  ClientHeight = 394
  ClientWidth = 588
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBarra: TToolBar
    Width = 588
  end
  inherited pnlFundoJanela: TPanel
    Top = 364
    Width = 588
  end
  object gbxPNs: TGroupBox
    Left = 0
    Top = 46
    Width = 177
    Height = 347
    Caption = 'PN'#180's'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Helvetica'
    Font.Pitch = fpVariable
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    inline fraSelecaoAleatoriaPN: TfraSelecaoAleatoria
      Left = 2
      Top = 15
      Width = 173
      Height = 330
      HorzScrollBar.Range = 26
      Align = alClient
      AutoScroll = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      inherited dbgSelecaoAleatoria: TtecDBGrid
        Width = 139
        Height = 325
        Align = alCustom
        Font.Height = -12
        Font.Name = 'Helvetica'
        Font.Style = [fsBold]
        PostOnEnter = True
        DefaultRowHeight = 19
        Columns = <
          item
            Expanded = False
            FieldName = 'codigo'
            Title.Alignment = taCenter
            Title.Caption = 'PART NUMBER'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'Helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 101
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            ReadOnly = True
            Title.Caption = 'Descri'#231#227'o'
            Width = 0
            Visible = True
          end>
      end
      inherited pnlLabels: TPanel
        Left = 145
        Width = 28
        Height = 330
        inherited sbnProcura: TSpeedButton
          Left = -1
        end
        inherited sbnExcluir: TSpeedButton
          Left = -1
        end
        inherited sbnExcluirTodos: TSpeedButton
          Left = -1
        end
        inherited sbnIncluirItem: TSpeedButton
          Left = -1
        end
      end
      inherited qrySelecaoAleatoria: TtecQuery
        Sql.Strings = (
          'SELECT  Codigo,'
          '         descricao'
          'FROM produtos'
          'WHERE false')
      end
    end
  end
end
