inherited frmAdministracaoTEFDedicado: TfrmAdministracaoTEFDedicado
  HelpType = htContext
  ActiveControl = nil
  BorderStyle = fbsSizeable
  Caption = 'Administra'#231#227'o do TEF'
  ClientHeight = 360
  ClientWidth = 373
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  inherited pnlFundoJanela: TPanel
    Width = 373
    Height = 360
    inherited pgcSiTEF: TPageControl
      Width = 367
      Height = 151
      ActivePage = tstAdmin
      inherited tstVendas: TTabSheet
        inherited bbnCancelar: TBitBtn
          Left = 230
        end
        inherited bbnPreAutoriazacao: TBitBtn
          Left = 230
        end
        inherited bbnVenda: TBitBtn
          Left = 230
        end
        inherited bbnTeleMarketing: TBitBtn
          Left = 230
        end
      end
      object tstAdmin: TTabSheet
        ImageIndex = 1
        object gbxReImpressao: TGroupBox
          Left = 5
          Top = 0
          Width = 170
          Height = 70
          Caption = 'Re-impress'#227'o'
          TabOrder = 0
          object sbnUltimoComprovante: TSpeedButton
            Left = 10
            Top = 18
            Width = 150
            Height = 22
            Caption = #218'ltimo comprovante'
            Flat = True
            OnClick = sbnUltimoComprovanteClick
          end
          object sbnComprovanteEspecifico: TSpeedButton
            Left = 10
            Top = 40
            Width = 150
            Height = 22
            Caption = 'Comprovante espec'#237'fico'
            Flat = True
            OnClick = sbnComprovanteEspecificoClick
          end
        end
        object gbxCancelamentos: TGroupBox
          Left = 185
          Top = 0
          Width = 170
          Height = 114
          Caption = 'Cancelamentos'
          TabOrder = 1
          object sbnNormal: TSpeedButton
            Left = 10
            Top = 18
            Width = 150
            Height = 22
            Caption = 'Normal'
            Flat = True
            OnClick = sbnNormalClick
          end
          object sbnTelemarketing: TSpeedButton
            Left = 10
            Top = 40
            Width = 150
            Height = 22
            Caption = 'Telemarketing'
            Flat = True
            OnClick = sbnTelemarketingClick
          end
          object sbnPreAutorizacao: TSpeedButton
            Left = 10
            Top = 62
            Width = 150
            Height = 22
            Caption = 'Pr'#233'-Autoriza'#231#227'o'
            Flat = True
            OnClick = sbnPreAutorizacaoClick
          end
          object sbnCapturaPreAutorizacao: TSpeedButton
            Left = 10
            Top = 84
            Width = 150
            Height = 22
            Caption = 'Captura Pr'#233'-Autoriza'#231#227'o'
            Flat = True
            OnClick = sbnCapturaPreAutorizacaoClick
          end
        end
        object gbxDiversos: TGroupBox
          Left = 5
          Top = 72
          Width = 170
          Height = 70
          Caption = 'Diversos'
          TabOrder = 2
          object sbnTransacoesGerenciais: TSpeedButton
            Left = 10
            Top = 18
            Width = 150
            Height = 22
            Caption = 'Transa'#231#245'es Gerenciais'
            Flat = True
            OnClick = sbnTransacoesGerenciaisClick
          end
          object sbnTesteComunicacao: TSpeedButton
            Left = 10
            Top = 40
            Width = 150
            Height = 22
            Caption = 'Teste de comunica'#231#227'o'
            Flat = True
            OnClick = sbnTesteComunicacaoClick
          end
        end
      end
    end
    inherited mmoMsg: TMemo
      Top = 154
      Width = 367
      Height = 203
      Enabled = False
    end
  end
end
