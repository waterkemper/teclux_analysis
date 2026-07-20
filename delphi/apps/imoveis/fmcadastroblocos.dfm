inherited frmCadastroBlocos: TfrmCadastroBlocos
  Left = 755
  Top = 298
  ActiveControl = edtDescricaoBloco
  Caption = 'Cadastro de Blocos'
  ClientWidth = 468
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlTopMenu: TPanel
    Width = 468
    inherited tblBarra: TToolBar
      Width = 243
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
    end
  end
  object pnlDados: TPanel
    Left = 0
    Top = 40
    Width = 468
    Height = 182
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object gbxBlocos: TGroupBox
      Left = 0
      Top = 0
      Width = 468
      Height = 182
      Align = alClient
      TabOrder = 0
      object gbxCodigo: TGroupBox
        Left = 10
        Top = 14
        Width = 60
        Height = 36
        Caption = 'C'#211'DIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object edtCodigo: TDBEditTexto
          Left = 2
          Top = 10
          Width = 55
          Height = 23
          TabStop = False
          DataField = 'codigo'
          DataSource = dtmcadastroempreendimentos.dsrBlocos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 17
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          CharCasenoDefault = False
        end
      end
      object gbxDescricao: TGroupBox
        Left = 79
        Top = 14
        Width = 380
        Height = 36
        Caption = 'DESCRI'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object edtDescricaoBloco: TDBEditTexto
          Left = 2
          Top = 10
          Width = 375
          Height = 23
          DataField = 'descricao'
          DataSource = dtmcadastroempreendimentos.dsrBlocos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 17
          ParentFont = False
          TabOrder = 0
          CharCasenoDefault = False
        end
      end
    end
  end
end
