inherited frmRegistroDesempenho: TfrmRegistroDesempenho
  Left = 145
  Top = 302
  Caption = 'Registro de desempenho'
  ClientHeight = 266
  ClientWidth = 407
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 0
    Top = 208
    Width = 407
    Height = 58
    Align = alBottom
    Alignment = taLeftJustify
    inherited bvlBotoesEd: TBevel
      Height = 0
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 407
    inherited tblBarra: TToolBar
      Width = 182
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
    end
    inherited tblBarraCadastro: TToolBar
      inherited sbnIncluir: TSpeedButton
        Visible = False
      end
      inherited sbnExcluir: TSpeedButton
        Visible = False
      end
    end
  end
end
