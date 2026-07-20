inherited frmFCont: TfrmFCont
  Left = 345
  Top = 131
  ActiveControl = edtExercicio
  Caption = 'ECD - Escritura'#231#227'o Cont'#225'bil Digital'
  ClientHeight = 523
  ClientWidth = 789
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  inherited pnlBarra: TPanel
    Top = 44
    Width = 789
    Height = 479
    Align = alClient
    BevelOuter = bvNone
    Visible = True
    inherited bvlBotoesEd: TBevel
      Left = 0
      Top = 132
      Width = 789
      Height = 0
      Align = alTop
      Visible = False
    end
    object pnlTop: TPanel
      Left = 0
      Top = 0
      Width = 789
      Height = 132
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object gbxExercicio: TGroupBox
        Left = 7
        Top = 0
        Width = 68
        Height = 36
        Alignment = taCenter
        Caption = 'EXERC'#205'CIO'
        Font.Color = clBlack
        Font.Height = 9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        ParentFont = False
        TabOrder = 0
        object edtExercicio: TtecDbEditFind
          Left = 2
          Top = 10
          Width = 63
          Height = 23
          DataField = 'exercicio'
          DataSource = dtmFCont.dsrecd
          EditMask = '!0000;1;_'
          Font.Color = clBlack
          Font.Height = 12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Font.Weight = 40
          Group = 'periodo'
          MaxLength = 4
          Maximo = 0
          Minimo = 37353
          Adicional = 0
          Opcional = True
          ParentFont = False
          TabOrder = 0
          PermitirZero = False
          PermitirNulo = False
          Operacao = opATRIBUICAO
          Parameter = 'exercicio'
          ActiveSetControls = True
          DenyInsert = False
          NoSetControls = <
            item
              Control = gbxNumOrd
            end
            item
              Control = gbxFilial
            end>
          SetControls = <
            item
              Control = gbxArquivo
            end
            item
              Control = rbnSituacao
            end
            item
              Control = gbxLivro
            end
            item
              Control = mmoErro
            end>
        end
      end
      object gbxArquivo: TGroupBox
        Left = 7
        Top = 40
        Width = 537
        Height = 36
        Caption = 'NOME DO ARQUIVO'
        Font.Color = clBlack
        Font.Height = 9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        ParentFont = False
        TabOrder = 2
        object dtxArquivo: TtecDBText
          Left = 2
          Top = 10
          Width = 531
          Height = 23
          DataField = 'nomearquivo'
          DataSource = dtmFCont.dsrecd
          Font.Color = clBlack
          Font.Height = 12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Font.Weight = 40
          ParentFont = False
          BorderStyle = bsSingle
        end
      end
      object gbxFilial: TGroupBox
        Left = 80
        Top = 1
        Width = 464
        Height = 36
        Caption = 'FILIAL'
        Font.Color = clBlack
        Font.Height = 9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        ParentFont = False
        TabOrder = 1
        inline fraConsultaFilial: TfraConsultaCodigo
          Left = 5
          Top = 10
          Width = 496
          Height = 25
          VertScrollBar.Range = 23
          HorzScrollBar.Range = 456
          Font.Color = clBlack
          Font.Height = 11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Font.Weight = 40
          ParentFont = False
          TabOrder = 0
          inherited sbnProcura: TSpeedButton
            Left = 32
          end
          inherited dtxDescricao: TtecDBText
            Left = 56
            Width = 400
            DataField = 'nome'
            DataSource = fraConsultaFilial.dsrProcuraFiliais
          end
          inherited edfCodigo: TtecDBFindLookup
            Width = 32
            DataField = 'filial'
            DataSource = dtmFCont.dsrecd
            Group = 'periodo'
            MaxLength = 3
            OnFound = nil
            LookupField = 'codigo'
            LookupSource = fraConsultaFilial.dsrProcuraFiliais
            Parameter = 'filial'
            LookupParameter = 'codigo'
          end
        end
      end
      object rbnSituacao: TtecDBRadioGroup
        Left = 548
        Top = 2
        Width = 141
        Height = 119
        Caption = 'SITUA'#199#195'O'
        Font.Color = clBlack
        Font.Height = 9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        ParentFont = False
        TabOrder = 3
        TabStop = False
        DataField = 'situacao'
        DataSource = dtmFCont.dsrecd
        object rbnAbertura: TtecRadioButton
          Left = 8
          Top = 16
          Width = 113
          Height = 17
          Caption = '0 - ABERTURA'
          Font.Color = clBlack
          Font.Height = 9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Font.Weight = 40
          ParentFont = False
          TabOrder = 0
          TabStop = False
          Value = '0'
        end
        object rbnCISAO: TtecRadioButton
          Left = 8
          Top = 32
          Width = 113
          Height = 17
          Caption = '1 - CIS'#195'O'
          Font.Color = clBlack
          Font.Height = 9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Font.Weight = 40
          ParentFont = False
          TabOrder = 1
          TabStop = False
          Value = '1'
        end
        object rbnFUSAO: TtecRadioButton
          Left = 8
          Top = 48
          Width = 113
          Height = 17
          Caption = '2 - FUS'#195'O'
          Font.Color = clBlack
          Font.Height = 9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Font.Weight = 40
          ParentFont = False
          TabOrder = 2
          TabStop = False
          Value = '2'
        end
        object rbnINCORPORACAO: TtecRadioButton
          Left = 8
          Top = 64
          Width = 128
          Height = 17
          Caption = '3 - INCORPORA'#199#195'O'
          Font.Color = clBlack
          Font.Height = 9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Font.Weight = 40
          ParentFont = False
          TabOrder = 3
          TabStop = False
          Value = '3'
        end
        object rbnEXTINSAO: TtecRadioButton
          Left = 8
          Top = 80
          Width = 113
          Height = 17
          Caption = '4 - EXTINS'#195'O'
          Font.Color = clBlack
          Font.Height = 9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Font.Weight = 40
          ParentFont = False
          TabOrder = 4
          TabStop = False
          Value = '4'
        end
        object rbnNormal: TtecRadioButton
          Left = 8
          Top = 96
          Width = 113
          Height = 17
          Caption = '5 - NORMAL'
          Checked = True
          Font.Color = clBlack
          Font.Height = 9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Font.Weight = 40
          ParentFont = False
          TabOrder = 5
          Value = '5'
        end
      end
      object gbxLivro: TGroupBox
        Left = 8
        Top = 78
        Width = 537
        Height = 51
        Caption = 'LIVRO'
        Font.Color = clBlack
        Font.Height = 9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        ParentFont = False
        TabOrder = 4
        object gbxNumOrd: TGroupBox
          Left = 4
          Top = 12
          Width = 72
          Height = 36
          Alignment = taCenter
          Caption = 'NR. ORDEM'
          Font.Color = clBlack
          Font.Height = 9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Font.Weight = 40
          ParentFont = False
          TabOrder = 0
          object edtNum_Ord: TDBEditNumero
            Left = 4
            Top = 11
            Width = 64
            Height = 23
            Alignment = taRightJustify
            Font.Color = clBlack
            Font.Height = 12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Font.Weight = 40
            ParentFont = False
            TabOrder = 0
            Mascara = False
            TipoMascara = tmGERAL
            NrDecimal = 0
            Decimais = False
            Negativo = False
            Tamanho = 9
            DataField = 'num_ord'
            DataSource = dtmFCont.dsrecd
          end
        end
        object gbxNatureza: TGroupBox
          Left = 78
          Top = 12
          Width = 455
          Height = 36
          Caption = 'NATUREZA '
          Font.Color = clBlack
          Font.Height = 9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Font.Weight = 40
          ParentFont = False
          TabOrder = 1
          object edtNatureza: TDBEditTexto
            Left = 5
            Top = 10
            Width = 446
            Height = 23
            DataField = 'natureza'
            DataSource = dtmFCont.dsrecd
            Font.Color = clBlack
            Font.Height = 12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Font.Weight = 40
            ParentFont = False
            TabOrder = 0
            CharCasenoDefault = False
          end
        end
      end
    end
    object gbxErro: TGroupBox
      Left = 0
      Top = 132
      Width = 789
      Height = 347
      Caption = 'ERROS DE VALIDA'#199#195'O'
      Font.Color = clBlack
      Font.Height = 11
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      Font.Weight = 40
      ParentFont = False
      TabOrder = 1
      object mmoErro: TMemo
        Left = 2
        Top = 14
        Width = 785
        Height = 331
        Font.Color = clBlack
        Font.Height = 11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  inherited tblBarra: TToolBar
    Width = 789
    inherited sbnProcurar: TSpeedButton
      Left = 309
    end
    inherited sbnAjuda: TSpeedButton
      Left = 384
    end
    object sbnGerarArquivo: TSpeedButton [2]
      Left = 237
      Top = 5
      Width = 72
      Height = 35
      Caption = 'Gerar F8'
      Flat = True
      Glyph.Data = {
        E2030000424DDE03000000000000360000002800000011000000120000000100
        180000000000A8030000120B0000120B00000000000000000000DCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DC00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC80878000
        0000808780DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC00DCDC
        DCDCDCDCDCDCDC80878000000080878000000000FFFF00000080878000000080
        8780DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDC00000000FF
        FF80878000000000FFFF00000080878000FFFF000000DCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDC00DCDCDCDCDCDC00000080878080878000FFFF00FFFF00FFFF00FF
        FF00FFFF808780808780000000DCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDC
        80878000000000000000FFFF80878000000080878000FFFF0000000000008087
        80DCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDC00000000FFFF00FFFF00FFFF
        000000FFFFFF00000000FFFF00FFFF00FFFF000000DCDCDCDCDCDCDCDCDCDCDC
        DC00DCDCDCDCDCDC80878000000000000000FFFF80878000000080878000FFFF
        000000000000808780DCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDC80
        878080878000FFFF00FFFF00FFFF00FFFF00FFFF808780808780DCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDC00000000FFFF80878000000000
        FFFF00000080878000FFFF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC00DCDC
        DCDCDCDCDCDCDC80878000000080878000000000FFFF00000080878000000080
        8780DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDC808780000000808780DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDC00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DC00}
      Layout = blGlyphTop
      Spacing = 0
      OnClick = sbnGerarArquivoClick
    end
    inherited sbnExcluir: TSpeedButton
      Left = 162
    end
    inherited sbnSalvar: TSpeedButton
      Left = 87
    end
    inherited tbnDivisor: TToolButton
      Left = 79
    end
  end
end
