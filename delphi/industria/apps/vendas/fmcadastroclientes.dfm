inherited frmCadastroClientes: TfrmCadastroClientes
  Left = 479
  Top = 133
  ActiveControl = edfCodigoCliente
  Caption = 'Cadastro de Clientes'
  ClientHeight = 582
  ClientWidth = 789
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 0
    Top = 581
    Width = 789
    Height = 1
    Align = alBottom
    BevelOuter = bvNone
    inherited bvlBotoesEd: TBevel
      Left = 0
      Top = 1
      Width = 789
      Height = 0
      Align = alBottom
      Visible = False
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 789
    TabOrder = 2
    inherited tblBarra: TToolBar
      Width = 564
      ButtonHeight = 23
      inherited sbnAjuda: TSpeedButton
        Top = 13
        Caption = 'F1 Ajuda'
        OnClick = nil
      end
      object lblEnderecoDesatualizado: TLabel
        Left = 84
        Top = 2
        Width = 210
        Height = 23
        Align = alCustom
        Caption = 'Endere'#231'o desatualizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -20
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        Visible = False
      end
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 45
    Width = 789
    Height = 536
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object gbxNomeCliente: TGroupBox
      Left = 0
      Top = 0
      Width = 789
      Height = 142
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object gbxFilialCadastro: TGroupBox
        Left = 80
        Top = 2
        Width = 147
        Height = 36
        Caption = ' FILIAL DE CADASTRO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object dtxFilialCadastro: TtecDBText
          Left = 2
          Top = 10
          Width = 142
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'nomefilialcadastro'
          DataSource = dtmCadastroClientes.dsrClientes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Alignment = taLeftJustify
        end
      end
      object gbxNome: TGroupBox
        Left = 7
        Top = 40
        Width = 377
        Height = 36
        Caption = 'NOME OU RAZ'#195'O SOCIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object edtClientesNome: TDBEditTexto
          Left = 2
          Top = 10
          Width = 372
          Height = 23
          DataField = 'nome'
          DataSource = dtmCadastroClientes.dsrClientes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 15
          ParentFont = False
          TabOrder = 0
          CharCasenoDefault = False
          Alignment = taLeftJustify
        end
      end
      object gbxDataCadastro: TGroupBox
        Left = 232
        Top = 2
        Width = 75
        Height = 36
        Caption = ' INCLUS'#195'O '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object dtxDataCadastro: TtecDBText
          Left = 2
          Top = 10
          Width = 70
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'datacadastro'
          DataSource = dtmCadastroClientes.dsrClientes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Alignment = taLeftJustify
        end
      end
      object gbxConceito: TGroupBox
        Left = 534
        Top = 45
        Width = 227
        Height = 36
        Caption = ' CONCEITO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        object sbnProcurarConceito: TSpeedButton
          Left = 44
          Top = 11
          Width = 22
          Height = 22
          Hint = 'Procurar Conceito'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDC800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7FFFFFFFDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DC800000800000800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000
            00800000800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000008000
            00800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000008000008000
            00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFF
            FFFFDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCFFA858800000800000800000FFA858DCDCDC0000FF800000800000DCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDC
            DCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFDCDCDCDCDCDC7F
            7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
            FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDC7F7F7FDCDCDCFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
            FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000DCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
            FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000DCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
            FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFFFFFFFDCDCDCDCDCDCDC
            DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
            7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
          NumGlyphs = 2
          ParentFont = False
          OnClick = sbnProcurarConceitoClick
        end
        object flkConceitoClientes: TtecDBFindLookup
          Left = 2
          Top = 10
          Width = 40
          Height = 23
          Alignment = taLeftJustify
          DataField = 'conceito'
          DataSource = dtmCadastroClientes.dsrClientes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
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
          LookupField = 'codigo'
          LookupSource = dtmCadastroClientes.dsrProcuraConceitos
          LookupQueryParameter = 'codigo'
          Parameter = ' '
          ActiveSetControls = False
          DenyInsert = False
          NoSetControls = <>
          SetControls = <>
          LookupParameter = 'codigo'
        end
        object dtxConceitosNome: TtecDBText
          Left = 67
          Top = 10
          Width = 157
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'descricao'
          DataSource = dtmCadastroClientes.dsrProcuraConceitos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Alignment = taLeftJustify
        end
      end
      object gbxDataAlteracao: TGroupBox
        Left = 311
        Top = 2
        Width = 75
        Height = 36
        Caption = ' ALTERA'#199#195'O '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object dtxDataUltimaAlteracao: TtecDBText
          Left = 2
          Top = 10
          Width = 70
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'ultimaalteracao'
          DataSource = dtmCadastroClientes.dsrClientes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Alignment = taLeftJustify
        end
      end
      object gbxFantasia: TGroupBox
        Left = 536
        Top = 2
        Width = 225
        Height = 36
        Caption = ' NOME DE FANTASIA '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        object edtClientesApelido: TDBEditTexto
          Left = 2
          Top = 10
          Width = 220
          Height = 23
          DataField = 'apelido'
          DataSource = dtmCadastroClientes.dsrClientes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 18
          ParentFont = False
          TabOrder = 0
          CharCasenoDefault = False
          Alignment = taLeftJustify
        end
      end
      inline fracgcoucpf1: Tfracgcoucpf
        Left = 392
        Top = 2
        Width = 132
        Height = 75
        HorzScrollBar.Visible = False
        VertScrollBar.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        inherited gbxCPGouCGC: TGroupBox
          Width = 132
          Height = 75
          inherited rgbTipoPessoa: TtecDBRadioGroup
            Left = 0
            Top = 13
            Width = 132
            Height = 30
            ParentCtl3D = False
            DataField = 'pessoatipo'
            DataSource = dtmCadastroClientes.dsrClientes
            OnChange = fracgcoucpf1rgbTipoPessoaChange
            inherited rbnFisica: TtecRadioButton
              Left = 11
              Height = 20
              OnClick = fracgcoucpf1rbnFisicaClick
            end
            inherited rbnJuridica: TtecRadioButton
              Left = 68
              OnClick = fracgcoucpf1rbnJuridicaClick
            end
          end
          inherited gbxCPF_CNPJ: TGroupBox
            Left = 0
            Top = 39
            Height = 36
            inherited edtCPFCNPJ: TDBEditCPFCNPJ
              Top = 10
              DataField = 'pessoanumero'
              DataSource = dtmCadastroClientes.dsrClientes
              Font.Height = -12
              OnExit = fracgcoucpf1edtCPFCNPJExit
            end
          end
        end
      end
      object gbxObservacao: TGroupBox
        Left = 7
        Top = 80
        Width = 754
        Height = 59
        Caption = 'OBSERVA'#199#213'ES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        object pnlOcultarObservacoesClienteVendedor: TPanel
          Left = 2
          Top = 14
          Width = 750
          Height = 43
          Align = alClient
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Visible = False
          object mmoClientesObservacoes: TtecDBMemo
            Left = 0
            Top = 0
            Width = 750
            Height = 43
            Align = alClient
            DataField = 'observacoes'
            DataSource = dtmCadastroClientes.dsrClientes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = 1000
            ParentFont = False
            TabOrder = 0
          end
        end
      end
      object gbxCodigo: TGroupBox
        Left = 7
        Top = 2
        Width = 67
        Height = 36
        Caption = ' C'#211'DIGO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object edfCodigoCliente: TtecDbEditFind
          Left = 2
          Top = 10
          Width = 62
          Height = 23
          Alignment = taLeftJustify
          DataField = 'codigo'
          DataSource = dtmCadastroClientes.dsrClientes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Group = 'clientes'
          MaxLength = 9
          Maximo = 0
          Minimo = 37353
          Adicional = 0
          Opcional = True
          ParentFont = False
          TabOrder = 0
          PermitirZero = False
          PermitirNulo = False
          Operacao = opATRIBUICAO
          Parameter = 'codigo'
          ActiveSetControls = True
          DenyInsert = True
          NoSetControls = <>
          SetControls = <>
        end
      end
    end
    object pgcCadastroClientes: TtecPageControl
      Left = 0
      Top = 144
      Width = 789
      Height = 397
      ActivePage = tstGeral
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabWidth = 110
      OnChange = pgcCadastroClientesChange
      object tstGeral: TTabSheet
        Caption = ' &1 - Geral'
        object pgcGeral: TPageControl
          Left = 0
          Top = 2
          Width = 781
          Height = 367
          ActivePage = tstGeralJuridica
          Style = tsFlatButtons
          TabHeight = 1
          TabOrder = 0
          TabWidth = 1
          object tstGeralFisica: TTabSheet
            object gbxIdentificacao: TGroupBox
              Left = 2
              Top = 0
              Width = 150
              Height = 124
              Caption = 'IDENTIDADE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              object gbxDocumento: TGroupBox
                Left = 0
                Top = 12
                Width = 150
                Height = 36
                Caption = ' DOCUMENTO '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                object edtClientesIdDocumento: TDBEditDocumento
                  Left = 2
                  Top = 10
                  Width = 145
                  Height = 23
                  DataField = 'iddocumento'
                  DataSource = dtmCadastroClientes.dsrClientes
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  MaxLength = 22
                  ParentFont = False
                  TabOrder = 0
                  CharCasenoDefault = False
                  Alignment = taLeftJustify
                  Tipo = Identidade
                end
              end
              object gbxOrgao: TGroupBox
                Left = 0
                Top = 50
                Width = 150
                Height = 36
                Caption = ' '#211'RG'#195'O EMISSOR '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                object edtClientesIdOrgao: TDBEditTexto
                  Left = 2
                  Top = 10
                  Width = 145
                  Height = 23
                  DataField = 'idorgao'
                  DataSource = dtmCadastroClientes.dsrClientes
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  MaxLength = 18
                  ParentFont = False
                  TabOrder = 0
                  CharCasenoDefault = False
                  Alignment = taLeftJustify
                end
              end
              object gbxUFOrgao: TGroupBox
                Left = 0
                Top = 88
                Width = 63
                Height = 36
                Caption = ' UF '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                object sbnProcurarEstado: TSpeedButton
                  Left = 37
                  Top = 11
                  Width = 22
                  Height = 22
                  Hint = 'Procurar Estado'
                  Flat = True
                  Glyph.Data = {
                    36060000424D3606000000000000360000002800000020000000100000000100
                    18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDC800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7FFFFFFFDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DC800000800000800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000
                    00800000800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000008000
                    00800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000008000008000
                    00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFF
                    FFFFDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCFFA858800000800000800000FFA858DCDCDC0000FF800000800000DCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDC
                    DCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFDCDCDCDCDCDC7F
                    7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                    FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
                    FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDC7F7F7FDCDCDCFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
                    FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000DCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
                    FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
                    FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000DCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
                    FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                    FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFFFFFFFDCDCDCDCDCDCDC
                    DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
                    7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
                  NumGlyphs = 2
                  OnClick = sbnProcurarEstadoClick
                end
                object flkEstadoClientes: TtecDBFindLookup
                  Left = 2
                  Top = 10
                  Width = 34
                  Height = 23
                  Alignment = taLeftJustify
                  CharCase = ecUpperCase
                  DataField = 'idestado'
                  DataSource = dtmCadastroClientes.dsrClientes
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  MaxLength = 2
                  Maximo = 0
                  Minimo = 37353
                  Adicional = 0
                  Opcional = True
                  ParentFont = False
                  TabOrder = 0
                  PermitirZero = False
                  PermitirNulo = False
                  Operacao = opATRIBUICAO
                  LookupField = 'codigo'
                  LookupSource = dtmCadastroClientes.dsrProcuraEstados
                  LookupQueryParameter = 'codigo'
                  Parameter = ' '
                  ActiveSetControls = False
                  DenyInsert = True
                  NoSetControls = <>
                  SetControls = <>
                  LookupParameter = 'codigo'
                end
              end
              object gbxDataEmissao: TGroupBox
                Left = 70
                Top = 88
                Width = 80
                Height = 36
                Caption = ' EMISS'#195'O '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 3
                object edtClientesIdData: TDBEditData
                  Left = 2
                  Top = 10
                  Width = 75
                  Height = 23
                  Alignment = taLeftJustify
                  DataField = 'iddata'
                  DataSource = dtmCadastroClientes.dsrClientes
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Maximo = 0
                  Minimo = 37353
                  Adicional = 0
                  ParentFont = False
                  TabOrder = 0
                  Opcional = True
                end
              end
            end
            object gbxNascto: TGroupBox
              Left = 2
              Top = 135
              Width = 80
              Height = 36
              Caption = ' NASCIMENTO '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              object edtClientesNascto: TDBEditData
                Left = 2
                Top = 10
                Width = 75
                Height = 23
                Alignment = taLeftJustify
                DataField = 'nascto'
                DataSource = dtmCadastroClientes.dsrClientes
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                Maximo = 0
                Minimo = 37353
                Adicional = 0
                ParentFont = False
                TabOrder = 0
                OnExit = edtClientesNasctoExit
                Opcional = True
              end
            end
            object gbxAniversario: TGroupBox
              Left = 2
              Top = 173
              Width = 80
              Height = 36
              Caption = 'ANIVERS'#193'RIO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              object edtClientesaniversario: TDBEditDiaMes
                Left = 2
                Top = 10
                Width = 75
                Height = 23
                Alignment = taLeftJustify
                DataField = 'aniversario'
                DataSource = dtmCadastroClientes.dsrClientes
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                Maximo = 0
                Minimo = 37353
                Adicional = 0
                ParentFont = False
                TabOrder = 0
                Opcional = True
                AnoExercicio = '1999'
              end
            end
            object gbxEmail: TGroupBox
              Left = 171
              Top = 0
              Width = 372
              Height = 36
              Caption = ' E-MAIL '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              object edtClientesEMail: TDBEditTexto
                Left = 2
                Top = 10
                Width = 367
                Height = 23
                CharCase = ecLowerCase
                DataField = 'email'
                DataSource = dtmCadastroClientes.dsrClientes
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 16
                ParentFont = False
                TabOrder = 0
                OnExit = edtClientesEMailExit
                CharCasenoDefault = True
                Alignment = taLeftJustify
              end
            end
            object gbxFiliacao: TGroupBox
              Left = 171
              Top = 217
              Width = 374
              Height = 87
              Caption = ' FILIA'#199#195'O '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 8
              object gbxNomePai: TGroupBox
                Left = 0
                Top = 12
                Width = 374
                Height = 36
                Caption = ' PAI '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                object edtClientesPai: TDBEditTexto
                  Left = 2
                  Top = 10
                  Width = 369
                  Height = 23
                  DataField = 'pai'
                  DataSource = dtmCadastroClientes.dsrClientes
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  MaxLength = 14
                  ParentFont = False
                  TabOrder = 0
                  CharCasenoDefault = False
                  Alignment = taLeftJustify
                end
              end
              object gbxNomeMae: TGroupBox
                Left = 0
                Top = 51
                Width = 374
                Height = 36
                Caption = ' M'#195'E '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                object edtClientesMae: TDBEditTexto
                  Left = 2
                  Top = 10
                  Width = 369
                  Height = 23
                  DataField = 'mae'
                  DataSource = dtmCadastroClientes.dsrClientes
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  MaxLength = 14
                  ParentFont = False
                  TabOrder = 0
                  CharCasenoDefault = False
                  Alignment = taLeftJustify
                end
              end
            end
            object gbxNaturalidade: TGroupBox
              Left = 171
              Top = 175
              Width = 374
              Height = 36
              Caption = ' NATURAL DE '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 7
              object sbnProcurarCidade: TSpeedButton
                Left = 316
                Top = 10
                Width = 22
                Height = 22
                Hint = 'Procurar Cidade'
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                Glyph.Data = {
                  36060000424D3606000000000000360000002800000020000000100000000100
                  18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDC800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7FFFFFFFDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DC800000800000800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000
                  00800000800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000008000
                  00800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000008000008000
                  00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFF
                  FFFFDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCFFA858800000800000800000FFA858DCDCDC0000FF800000800000DCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDC
                  DCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFDCDCDCDCDCDC7F
                  7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                  FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
                  FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDC7F7F7FDCDCDCFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
                  FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000DCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
                  FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
                  FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000DCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
                  FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                  FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFFFFFFFDCDCDCDCDCDCDC
                  DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
                  7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
                NumGlyphs = 2
                ParentFont = False
                OnClick = sbnProcurarCidadeClick
              end
              object dtxClientesNaturalEstado: TDBEditTexto
                Left = 341
                Top = 10
                Width = 30
                Height = 23
                TabStop = False
                DataField = 'naturalestado'
                DataSource = dtmCadastroClientes.dsrClientes
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 24
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
                CharCasenoDefault = False
                Alignment = taLeftJustify
              end
              object dtxNaturalCidadeCliente: TtecDBText
                Left = 2
                Top = 10
                Width = 263
                Height = 23
                TabStop = False
                Color = clBtnFace
                DataField = 'nome'
                DataSource = dtmCadastroClientes.dsrProcuraCidades
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
                Alignment = taLeftJustify
              end
              object flkNaturalidade: TtecDBFindLookup
                Left = 264
                Top = 10
                Width = 50
                Height = 23
                Alignment = taLeftJustify
                DataField = 'naturalcidade'
                DataSource = dtmCadastroClientes.dsrClientes
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 6
                Maximo = 0
                Minimo = 37353
                Adicional = 0
                Opcional = True
                ParentFont = False
                TabOrder = 0
                PermitirZero = False
                PermitirNulo = False
                Operacao = opATRIBUICAO
                LookupField = 'codigo'
                LookupSource = dtmCadastroClientes.dsrProcuraCidades
                LookupQueryParameter = 'codigo'
                Parameter = ' '
                ActiveSetControls = False
                DenyInsert = True
                NoSetControls = <>
                SetControls = <>
                LookupParameter = 'codigo'
              end
            end
            object gbxTempo: TGroupBox
              Left = 462
              Top = 80
              Width = 80
              Height = 88
              Caption = ' CASADO H'#193' '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 6
              object gbxDataCasamento: TGroupBox
                Left = 0
                Top = 52
                Width = 80
                Height = 36
                Caption = ' DATA '
                TabOrder = 0
                object edtClientesCivilData: TDBEditData
                  Left = 2
                  Top = 10
                  Width = 75
                  Height = 23
                  Alignment = taLeftJustify
                  DataField = 'civildata'
                  DataSource = dtmCadastroClientes.dsrClientes
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Maximo = 0
                  Minimo = 37353
                  Adicional = 0
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                  OnEnter = edtClientesCivilDataEnter
                  OnExit = edtClientesCivilDataExit
                  Opcional = True
                end
              end
              object gbxAnosCasado: TGroupBox
                Left = 0
                Top = 12
                Width = 34
                Height = 36
                Caption = 'ANOS'
                TabOrder = 1
                object edtCivilAno: TEditNumero
                  Left = 2
                  Top = 10
                  Width = 29
                  Height = 23
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  MaxLength = -1
                  ParentFont = False
                  TabOrder = 0
                  Text = '99,00'
                  OnChange = edtCivilAnoChange
                  Mascara = False
                  Alignment = taLeftJustify
                  TipoMascara = tmGERAL
                  NrDecimal = 2
                  Decimais = False
                  Negativo = False
                  Tamanho = 2
                end
              end
              object gbxMesesCasado: TGroupBox
                Left = 38
                Top = 13
                Width = 42
                Height = 36
                Caption = 'MESES'
                TabOrder = 2
                object edtCivilMes: TEditNumero
                  Left = 3
                  Top = 10
                  Width = 36
                  Height = 23
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  MaxLength = -1
                  ParentFont = False
                  TabOrder = 0
                  Text = '99,00'
                  OnChange = edtCivilAnoChange
                  Mascara = False
                  Alignment = taLeftJustify
                  TipoMascara = tmGERAL
                  NrDecimal = 2
                  Decimais = False
                  Negativo = False
                  Tamanho = 2
                end
              end
            end
            object rgpSexo: TtecDBRadioGroup
              Left = 171
              Top = 80
              Width = 92
              Height = 88
              Caption = ' SEXO '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              TabStop = False
              DataField = 'sexo'
              DataSource = dtmCadastroClientes.dsrClientes
              object rbnMasculino: TtecRadioButton
                Left = 8
                Top = 15
                Width = 80
                Height = 17
                Caption = 'Masculino'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                Value = 'M'
              end
              object rbnFeminino: TtecRadioButton
                Left = 8
                Top = 38
                Width = 80
                Height = 17
                Caption = 'Feminino'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                Value = 'F'
              end
              object rbnEmpresa: TtecRadioButton
                Left = 8
                Top = 61
                Width = 80
                Height = 17
                Caption = 'Empresa'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                Value = 'E'
              end
            end
            object rgpClientesCivil: TtecDBRadioGroup
              Left = 277
              Top = 80
              Width = 172
              Height = 88
              Caption = ' ESTADO CIVIL '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              TabStop = False
              DataField = 'civil'
              DataSource = dtmCadastroClientes.dsrClientes
              OnChange = rgpClientesCivilChange
              object rbnCasado: TtecRadioButton
                Left = 8
                Top = 15
                Width = 68
                Height = 17
                Caption = 'Casado'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                Value = 'C'
              end
              object rbnSolteiro: TtecRadioButton
                Left = 95
                Top = 15
                Width = 67
                Height = 17
                Caption = 'Solteiro'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                Value = 'S'
              end
              object rbnDivorciado: TtecRadioButton
                Left = 8
                Top = 39
                Width = 82
                Height = 17
                Caption = 'Divorciado'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                Value = 'D'
              end
              object rbnViuvo: TtecRadioButton
                Left = 95
                Top = 39
                Width = 65
                Height = 17
                Caption = 'Vi'#250'vo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 3
                Value = 'V'
              end
              object rbnOutros: TtecRadioButton
                Left = 8
                Top = 64
                Width = 76
                Height = 17
                Caption = 'Outros'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 4
                Value = 'O'
              end
            end
            object gbxSiteFisica: TGroupBox
              Left = 171
              Top = 38
              Width = 372
              Height = 36
              Caption = ' SITE '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 9
              object edtClientesSite: TDBEditTexto
                Left = 2
                Top = 10
                Width = 367
                Height = 23
                CharCase = ecLowerCase
                DataField = 'site'
                DataSource = dtmCadastroClientes.dsrClientes
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 16
                ParentFont = False
                TabOrder = 0
                OnExit = edtClientesEMailExit
                CharCasenoDefault = True
                Alignment = taLeftJustify
              end
            end
          end
          object tstGeralJuridica: TTabSheet
            ImageIndex = 1
            inline fraEnderecoCliente: TfraEnderecoEditor
              Left = 0
              Top = -2
              Width = 455
              Height = 146
              HorzScrollBar.Visible = False
              VertScrollBar.Visible = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              inherited gbxEndereco: TGroupBox
                Width = 455
                Height = 146
                Font.Style = [fsBold]
                inherited pnlNumero: TPanel
                  Top = 53
                  Width = 451
                  inherited edtNumeroEndereco: TDBEditTexto
                    DataField = 'numero'
                    DataSource = dtmCadastroClientes.dsrClientes
                  end
                  inherited edtComplemento: TDBEditTexto
                    DataField = 'complemento'
                    DataSource = dtmCadastroClientes.dsrClientes
                  end
                end
                inherited pnlBairro: TPanel
                  Top = 86
                  Width = 451
                  inherited edtBairro: TtecDoubleDBEdit
                    LookupField = 'nomebairrocliente'
                    LookupSource = dtmCadastroClientes.dsrClientes
                    DataField = 'bairro'
                    DataSource = dtmCadastroClientes.dsrClientes
                  end
                end
                inherited pnlCidade: TPanel
                  Top = 120
                  Width = 451
                  inherited edtEstado: TDBEditTexto
                    DataField = 'estado'
                    DataSource = dtmCadastroClientes.dsrClientes
                  end
                  inherited edtCidade: TtecDoubleDBEdit
                    LookupField = 'nomecidadecliente'
                    LookupSource = dtmCadastroClientes.dsrClientes
                    DataField = 'cidade'
                    DataSource = dtmCadastroClientes.dsrClientes
                  end
                  inherited edtCEP: TDBEditCep
                    DataField = 'cep'
                    DataSource = dtmCadastroClientes.dsrClientes
                  end
                end
                inherited pnlRua: TPanel
                  Top = 13
                  Width = 451
                  inherited mmoRua: TtecDBMemo
                    Width = 421
                    DataField = 'rua'
                    DataSource = dtmCadastroClientes.dsrClientes
                    Font.Height = -12
                  end
                end
                inherited pnllblCidade: TPanel
                  Top = 112
                  Width = 451
                  Height = 8
                  inherited lblCEP_: TLabel
                    Left = 4
                  end
                end
                inherited pnllblBairro: TPanel
                  Top = 76
                  Width = 451
                  inherited lblBairro_: TLabel
                    Top = 1
                    Height = 11
                  end
                end
                inherited pnllblNumero: TPanel
                  Top = 43
                  Width = 451
                  inherited lblenderecocliente_numero: TLabel
                    Left = 4
                    Height = 11
                  end
                  inherited lblenderecocliente_complemento: TLabel
                    Width = 71
                    Height = 11
                  end
                end
              end
            end
            object gbxEmailPJ: TGroupBox
              Left = 1
              Top = 314
              Width = 372
              Height = 36
              Caption = 'E-MAIL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 11
              object edtEmailPJ: TDBEditTexto
                Left = 2
                Top = 10
                Width = 367
                Height = 23
                CharCase = ecLowerCase
                DataField = 'email'
                DataSource = dtmCadastroClientes.dsrClientes
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 16
                ParentFont = False
                TabOrder = 0
                OnExit = edtClientesEMailExit
                CharCasenoDefault = True
                Alignment = taLeftJustify
              end
            end
            object gbxDataEnderecoJuridica: TGroupBox
              Left = 464
              Top = -2
              Width = 80
              Height = 36
              Caption = 'ALTERADO EM'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              object dtxEnderecoAlteradoem: TtecDBText
                Left = 2
                Top = 10
                Width = 75
                Height = 23
                TabStop = False
                Color = clBtnFace
                DataField = 'enderecoalterado'
                DataSource = dtmCadastroClientes.dsrClientes
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                Alignment = taLeftJustify
              end
            end
            object gbxIE: TGroupBox
              Left = 465
              Top = 107
              Width = 168
              Height = 36
              Caption = 'INSCRI'#199#195'O ESTADUAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 6
              object edtInscricaoEstadual: TDBEditDocumento
                Left = 2
                Top = 10
                Width = 163
                Height = 23
                DataField = 'iddocumento'
                DataSource = dtmCadastroClientes.dsrClientes
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = -1
                ParentFont = False
                TabOrder = 0
                CharCasenoDefault = False
                Alignment = taLeftJustify
                Tipo = Identidade
              end
            end
            object gbxIM: TGroupBox
              Left = 465
              Top = 72
              Width = 168
              Height = 36
              Caption = 'INSCRI'#199#195'O MUNICIPAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              object edtInscricaoMunicipal: TDBEditDocumento
                Left = 2
                Top = 10
                Width = 163
                Height = 23
                DataField = 'inscricaomunicipal'
                DataSource = dtmCadastroClientes.dsrClientes
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 21
                ParentFont = False
                TabOrder = 0
                CharCasenoDefault = False
                Alignment = taLeftJustify
                Tipo = Identidade
              end
            end
            object gbxPracaPagto: TGroupBox
              Left = 1
              Top = 223
              Width = 454
              Height = 36
              Caption = 'PRA'#199'A DE PAGAMENTO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 8
              inline fraConsultaPracaPagto: TfraConsultaCodigo
                Left = 3
                Top = 10
                Width = 444
                Height = 23
                HorzScrollBar.Range = 412
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 23
                VertScrollBar.Visible = False
                AutoScroll = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                inherited sbnProcura: TSpeedButton
                  Left = 389
                end
                inherited dtxDescricao: TtecDBText
                  Left = 0
                  Width = 333
                  DataField = 'nome'
                  DataSource = fraConsultaPracaPagto.dsrProcuraEstadoCidades
                end
                inherited edfCodigo: TtecDBFindLookup
                  Left = 334
                  Width = 54
                  DataField = 'pracapagtocidade'
                  DataSource = dtmCadastroClientes.dsrClientes
                  MaxLength = 6
                  LookupField = 'codigo'
                  LookupSource = fraConsultaPracaPagto.dsrProcuraEstadoCidades
                  LookupQueryParameter = 'codigo'
                  Parameter = ' '
                  ActiveSetControls = False
                  DenyInsert = True
                  NoSetControls = <>
                  SetControls = <>
                  LookupParameter = 'codigo'
                end
              end
              object dtxEstadoPracaPagto: TtecDBText
                Left = 417
                Top = 10
                Width = 34
                Height = 23
                TabStop = False
                Color = clBtnFace
                DataField = 'estado'
                DataSource = fraConsultaPracaPagto.dsrProcuraEstadoCidades
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
                Alignment = taLeftJustify
              end
            end
            object gbxRamodeAtividade: TGroupBox
              Left = 1
              Top = 148
              Width = 454
              Height = 36
              Caption = 'RAMO DE ATIVIDADE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              inline fraConsultaRamodeAtividade: TfraConsultaCodigo
                Left = 3
                Top = 10
                Width = 450
                Height = 23
                HorzScrollBar.Range = 448
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 23
                VertScrollBar.Visible = False
                AutoScroll = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                inherited dtxDescricao: TtecDBText
                  Width = 360
                  DataField = 'descricao'
                  DataSource = fraConsultaRamodeAtividade.dsrProcuraCargos
                end
                inherited edfCodigo: TtecDBFindLookup
                  DataField = 'empcargo'
                  DataSource = dtmCadastroClientes.dsrClientes
                  MaxLength = 6
                  LookupField = 'codigo'
                  LookupSource = fraConsultaRamodeAtividade.dsrProcuraCargos
                  LookupQueryParameter = 'codigo'
                  Parameter = ' '
                  ActiveSetControls = False
                  DenyInsert = True
                  NoSetControls = <>
                  SetControls = <>
                  LookupParameter = 'codigo'
                end
                inherited qryProcuraCargos: TtecQuery
                  inherited qryProcuraCargoscodigo: TIntegerField
                    DisplayFormat = '0'
                  end
                end
              end
            end
            object gbxVendedor: TGroupBox
              Left = 1
              Top = 184
              Width = 454
              Height = 36
              Caption = 'VENDEDOR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              inline fraConsultaVendedor: TfraConsultaCodigo
                Left = 3
                Top = 10
                Width = 450
                Height = 24
                HorzScrollBar.Range = 448
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 23
                VertScrollBar.Visible = False
                AutoScroll = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                inherited dtxDescricao: TtecDBText
                  Width = 360
                  DataField = 'nome'
                  DataSource = fraConsultaVendedor.dsrProcuraVendedores
                end
                inherited edfCodigo: TtecDBFindLookup
                  DataField = 'vendedor'
                  DataSource = dtmCadastroClientes.dsrClientes
                  MaxLength = 6
                  LookupField = 'codigo'
                  LookupSource = fraConsultaVendedor.dsrProcuraVendedores
                  LookupQueryParameter = 'codigo'
                  Parameter = ' '
                  ActiveSetControls = False
                  DenyInsert = True
                  NoSetControls = <>
                  SetControls = <>
                  LookupParameter = 'codigo'
                end
              end
            end
            inline fraFoneRamal2: TfraFoneRamal
              Left = 168
              Top = 261
              Width = 163
              Height = 51
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 10
              inherited gbxFone: TGroupBox
                Width = 163
                Caption = 'FAX'
                inherited lblNumero: TLabel
                  Left = 36
                end
                inherited lblRamal: TLabel
                  Left = 119
                end
                inherited edtDDD: TDBEditNumero
                  Width = 30
                  DataField = 'fone2ddd'
                  DataSource = dtmCadastroClientes.dsrClientes
                end
                inherited edtNumero: TDBEditFone
                  Left = 36
                  Width = 80
                  DataField = 'fone2numero'
                  DataSource = dtmCadastroClientes.dsrClientes
                end
                inherited edtFoneRamal: TDBEditTexto
                  Left = 119
                  Width = 40
                  DataField = 'fone2ramal'
                  DataSource = dtmCadastroClientes.dsrClientes
                end
              end
            end
            inline fraFoneRamal1: TfraFoneRamal
              Left = 2
              Top = 261
              Width = 163
              Height = 51
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 9
              inherited gbxFone: TGroupBox
                Width = 163
                inherited lblNumero: TLabel
                  Left = 36
                end
                inherited lblRamal: TLabel
                  Left = 119
                end
                inherited edtDDD: TDBEditNumero
                  Width = 30
                  DataField = 'foneddd'
                  DataSource = dtmCadastroClientes.dsrClientes
                end
                inherited edtNumero: TDBEditFone
                  Left = 36
                  Width = 80
                  DataField = 'fonenumero'
                  DataSource = dtmCadastroClientes.dsrClientes
                end
                inherited edtFoneRamal: TDBEditTexto
                  Left = 119
                  Width = 40
                  DataField = 'foneramal'
                  DataSource = dtmCadastroClientes.dsrClientes
                end
              end
            end
            object gbxSUFRAMA: TGroupBox
              Left = 465
              Top = 34
              Width = 118
              Height = 38
              Caption = 'SUFRAMA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              object edtSuframa: TDBEditTexto
                Left = 2
                Top = 11
                Width = 113
                Height = 23
                DataField = 'suframa'
                DataSource = dtmCadastroClientes.dsrClientes
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = -1
                ParentFont = False
                TabOrder = 0
                CharCasenoDefault = False
                Alignment = taLeftJustify
              end
            end
            object gbxIESubstTributaria: TGroupBox
              Left = 465
              Top = 143
              Width = 191
              Height = 209
              Caption = 'SUBSTITUI'#199#195'O TRIBUT'#193'RIA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 7
              inline fraIESubstTributario1: TfraIESubstTributario
                Left = 2
                Top = 14
                Width = 187
                Height = 193
                HorzScrollBar.Range = 176
                VertScrollBar.Range = 195
                Align = alClient
                AutoScroll = False
                TabOrder = 0
                inherited dbgIESubstTributario: TtecDBGrid
                  Width = 176
                  Height = 195
                  Align = alNone
                  Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
                  CanDelete = True
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'estado'
                      Title.Alignment = taCenter
                      Title.Caption = 'UF'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'Helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Width = 25
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'inscricaoestadual'
                      Title.Alignment = taCenter
                      Title.Caption = 'INSCRI'#199#195'O ESTADUAL'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -9
                      Title.Font.Name = 'Helvetica'
                      Title.Font.Pitch = fpVariable
                      Title.Font.Style = []
                      Width = 110
                      Visible = True
                    end>
                end
              end
            end
          end
        end
      end
      object tstResidencia_ou_Entrega: TTabSheet
        Caption = ' &2 - Resid'#234'ncia'
        ImageIndex = 1
        object pgcResidencia_ou_Entrega: TPageControl
          Left = 0
          Top = 0
          Width = 781
          Height = 367
          ActivePage = tstResidencia
          TabHeight = 1
          TabOrder = 0
          TabWidth = 1
          object tstResidencia: TTabSheet
            Caption = 'Resid'#234'ncia'
            object pnlResidencia: TPanel
              Left = 0
              Top = 0
              Width = 773
              Height = 356
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object gbxDataEndereco: TGroupBox
                Left = 458
                Top = -2
                Width = 80
                Height = 36
                Caption = 'ALTERADO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                object dtxEnderecoAlterado: TtecDBText
                  Left = 2
                  Top = 10
                  Width = 75
                  Height = 23
                  TabStop = False
                  Color = clBtnFace
                  DataField = 'enderecoalterado'
                  DataSource = dtmCadastroClientes.dsrClientes
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                  Alignment = taLeftJustify
                end
              end
              object gbxMoradia: TGroupBox
                Left = 253
                Top = 147
                Width = 250
                Height = 136
                Caption = 'MORADIA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
                object gbxTempoResidencia: TGroupBox
                  Left = 171
                  Top = 14
                  Width = 79
                  Height = 82
                  Caption = 'RESIDE H'#193
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  object gbxAnosResidencia: TGroupBox
                    Left = 0
                    Top = 10
                    Width = 39
                    Height = 36
                    Caption = 'ANOS'
                    TabOrder = 0
                    object edtResAno: TEditNumero
                      Left = 2
                      Top = 10
                      Width = 34
                      Height = 23
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Height = -12
                      Font.Name = 'helvetica'
                      Font.Pitch = fpVariable
                      Font.Style = []
                      MaxLength = -1
                      ParentFont = False
                      TabOrder = 0
                      OnChange = edtResAnoChange
                      Mascara = False
                      Alignment = taLeftJustify
                      TipoMascara = tmGERAL
                      NrDecimal = 2
                      Decimais = False
                      Negativo = False
                      Tamanho = 2
                    end
                  end
                  object gbxMesesResidencia: TGroupBox
                    Left = 37
                    Top = 10
                    Width = 42
                    Height = 36
                    Caption = 'MESES'
                    TabOrder = 1
                    object edtResMes: TEditNumero
                      Left = 2
                      Top = 10
                      Width = 37
                      Height = 23
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Height = -12
                      Font.Name = 'helvetica'
                      Font.Pitch = fpVariable
                      Font.Style = []
                      MaxLength = -1
                      ParentFont = False
                      TabOrder = 0
                      OnChange = edtResAnoChange
                      Mascara = False
                      Alignment = taLeftJustify
                      TipoMascara = tmGERAL
                      NrDecimal = 2
                      Decimais = False
                      Negativo = False
                      Tamanho = 2
                    end
                  end
                  object gbxDataResidencia: TGroupBox
                    Left = 0
                    Top = 46
                    Width = 80
                    Height = 36
                    Caption = 'DATA'
                    TabOrder = 2
                    object edtClientesResTempo: TDBEditData
                      Left = 2
                      Top = 10
                      Width = 75
                      Height = 23
                      Alignment = taLeftJustify
                      DataField = 'restempo'
                      DataSource = dtmCadastroClientes.dsrClientes
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Height = -12
                      Font.Name = 'helvetica'
                      Font.Pitch = fpVariable
                      Font.Style = []
                      Maximo = 0
                      Minimo = 37353
                      Adicional = 0
                      ParentFont = False
                      TabOrder = 0
                      OnEnter = edtClientesResTempoEnter
                      OnExit = edtClientesResTempoExit
                      Opcional = True
                    end
                  end
                end
                object gbxAluguel: TGroupBox
                  Left = 0
                  Top = 100
                  Width = 173
                  Height = 36
                  Caption = 'VALOR ALUGUEL/FINANCIAMENTO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  object edtClientesResOnus: TDBEditNumero
                    Left = 29
                    Top = 10
                    Width = 105
                    Height = 23
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    MaxLength = -1
                    ParentFont = False
                    TabOrder = 0
                    Mascara = True
                    Alignment = taLeftJustify
                    TipoMascara = tmGERAL
                    NrDecimal = 2
                    Decimais = True
                    Negativo = False
                    Tamanho = 7
                    DataField = 'resonus'
                    DataSource = dtmCadastroClientes.dsrClientes
                  end
                end
                object rgpClientesResTipo: TtecDBRadioGroup
                  Left = 0
                  Top = 14
                  Width = 173
                  Height = 82
                  Caption = 'TIPO DE RESID'#202'NCIA'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  TabStop = False
                  DataField = 'restipo'
                  DataSource = dtmCadastroClientes.dsrClientes
                  OnChange = rgpClientesResTipoChange
                  object rbnResPropria: TtecRadioButton
                    Left = 8
                    Top = 15
                    Width = 83
                    Height = 17
                    Caption = 'Pr'#243'pria'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                    Value = 'P'
                  end
                  object rbnResAlugada: TtecRadioButton
                    Left = 96
                    Top = 15
                    Width = 73
                    Height = 17
                    Caption = 'Alugada'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 1
                    Value = 'A'
                  end
                  object rbnResFinanciada: TtecRadioButton
                    Left = 8
                    Top = 36
                    Width = 83
                    Height = 17
                    Caption = 'Financiada'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 2
                    Value = 'F'
                  end
                  object rbnResParentes: TtecRadioButton
                    Left = 96
                    Top = 36
                    Width = 73
                    Height = 17
                    Caption = 'Parentes'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 3
                    Value = 'R'
                  end
                  object rbnResTrabalho: TtecRadioButton
                    Left = 8
                    Top = 57
                    Width = 83
                    Height = 17
                    Caption = 'Trabalho'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 4
                    Value = 'T'
                  end
                end
              end
              object gbxTelefones: TGroupBox
                Left = 2
                Top = 148
                Width = 240
                Height = 94
                Caption = 'TELEFONES'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                inline fraFoneRamalResidencia2: TfraFoneRamal
                  Left = 84
                  Top = 51
                  Width = 156
                  Height = 44
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  inherited gbxFone: TGroupBox
                    Width = 156
                    Height = 44
                    Caption = ''
                    inherited lblDDD: TLabel
                      Top = 8
                    end
                    inherited lblNumero: TLabel
                      Left = 33
                      Top = 8
                    end
                    inherited lblRamal: TLabel
                      Left = 115
                      Top = 8
                    end
                    inherited edtDDD: TDBEditNumero
                      Left = 1
                      Top = 18
                      Width = 30
                      Font.Height = -12
                      Mascara = False
                      DataField = 'fone2ddd'
                      DataSource = dtmCadastroClientes.dsrClientes
                    end
                    inherited edtNumero: TDBEditFone
                      Left = 32
                      Top = 18
                      Width = 80
                      DataField = 'fone2numero'
                      DataSource = dtmCadastroClientes.dsrClientes
                      Font.Height = -12
                    end
                    inherited edtFoneRamal: TDBEditTexto
                      Left = 113
                      Top = 18
                      Width = 40
                      DataField = 'fone2ramal'
                      DataSource = dtmCadastroClientes.dsrClientes
                      Font.Height = -12
                      MaxLength = 12
                    end
                  end
                end
                inline fraFoneRamalResidencia1: TfraFoneRamal
                  Left = 84
                  Top = 14
                  Width = 156
                  Height = 44
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  inherited gbxFone: TGroupBox
                    Width = 156
                    Height = 44
                    Caption = ''
                    inherited lblDDD: TLabel
                      Top = 8
                    end
                    inherited lblNumero: TLabel
                      Left = 33
                      Top = 8
                    end
                    inherited lblRamal: TLabel
                      Left = 115
                      Top = 8
                    end
                    inherited edtDDD: TDBEditNumero
                      Left = 1
                      Top = 18
                      Width = 30
                      Font.Height = -12
                      Mascara = False
                      DataField = 'foneddd'
                      DataSource = dtmCadastroClientes.dsrClientes
                    end
                    inherited edtNumero: TDBEditFone
                      Left = 32
                      Top = 18
                      Width = 80
                      DataField = 'fonenumero'
                      DataSource = dtmCadastroClientes.dsrClientes
                      Font.Height = -12
                    end
                    inherited edtFoneRamal: TDBEditTexto
                      Left = 113
                      Top = 18
                      Width = 40
                      DataField = 'foneramal'
                      DataSource = dtmCadastroClientes.dsrClientes
                      Font.Height = -12
                      MaxLength = 12
                    end
                  end
                end
                object rgpTipoTelefone: TtecDBRadioGroup
                  Left = 0
                  Top = 14
                  Width = 86
                  Height = 80
                  Caption = 'TIPO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  TabStop = False
                  DataField = 'fonetipo'
                  DataSource = dtmCadastroClientes.dsrClientes
                  object rbnProprio: TtecRadioButton
                    Left = 7
                    Top = 15
                    Width = 75
                    Height = 17
                    Caption = 'Pr'#243'prio'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                    Value = 'P'
                  end
                  object rbnRecado: TtecRadioButton
                    Left = 7
                    Top = 36
                    Width = 75
                    Height = 17
                    Caption = 'Recado'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 1
                    Value = 'R'
                  end
                  object rbnNenhum: TtecRadioButton
                    Left = 7
                    Top = 57
                    Width = 75
                    Height = 17
                    Caption = 'Nenhum'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 2
                    Value = 'N'
                  end
                end
              end
            end
          end
          object tstEntrega: TTabSheet
            Caption = 'Entrega'
            ImageIndex = 1
            object pnlEntrega: TPanel
              Left = 0
              Top = 0
              Width = 773
              Height = 356
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object gbxEmTransito: TGroupBox
                Left = 0
                Top = 154
                Width = 456
                Height = 37
                Caption = 'EM TR'#194'NSITO PELO ESTABELECIMENTO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                inline fraConsultaClienteTransito: TfraConsultaCodigo
                  Left = 4
                  Top = 11
                  Width = 449
                  Height = 24
                  HorzScrollBar.Range = 448
                  HorzScrollBar.Visible = False
                  VertScrollBar.Range = 23
                  VertScrollBar.Visible = False
                  AutoScroll = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  inherited dtxDescricao: TtecDBText
                    Width = 361
                    DataField = 'nome'
                    DataSource = fraConsultaClienteTransito.dsrProcuraCliente
                  end
                  inherited edfCodigo: TtecDBFindLookup
                    DataField = 'clientetransito'
                    DataSource = dtmCadastroClientes.dsrClientes
                    MaxLength = 8
                    LookupField = 'codigo'
                    LookupSource = fraConsultaClienteTransito.dsrProcuraCliente
                    LookupQueryParameter = 'codigo'
                    Parameter = ' '
                    ActiveSetControls = False
                    DenyInsert = False
                    NoSetControls = <>
                    SetControls = <>
                    LookupParameter = 'codigo'
                  end
                end
              end
              object gbxObsNotaFiscal: TGroupBox
                Left = 0
                Top = 193
                Width = 456
                Height = 64
                Caption = 'OBSERVA'#199#213'ES PARA A NOTA FISCAL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                object mmoOBSNF: TtecDBMemo
                  Left = 2
                  Top = 14
                  Width = 452
                  Height = 48
                  Align = alClient
                  DataField = 'obsnotafiscal'
                  DataSource = dtmCadastroClientes.dsrClientes
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  MaxLength = 320
                  ParentFont = False
                  TabOrder = 0
                end
              end
              object ckbPISSuspenso: TDBCheckBox
                Left = 1
                Top = 261
                Width = 121
                Height = 20
                Caption = 'Com IPI Suspenso'
                DataField = 'ipisuspenso'
                DataSource = dtmCadastroClientes.dsrClientes
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                ValueChecked = 'True'
                ValueUnchecked = 'False'
              end
              object gbxObsIPISuspenso: TGroupBox
                Left = 129
                Top = 261
                Width = 327
                Height = 70
                Caption = 'OBSERVA'#199#213'ES PARA IPI SUSPENSO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 3
                object mmoObsIPISuspenso: TtecDBMemo
                  Left = 2
                  Top = 14
                  Width = 323
                  Height = 54
                  Align = alClient
                  DataField = 'obsipisuspenso'
                  DataSource = dtmCadastroClientes.dsrClientes
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  MaxLength = 320
                  ParentFont = False
                  TabOrder = 0
                end
              end
            end
          end
        end
      end
      object tstDadosComerciais: TTabSheet
        Caption = ' &3 - Comercial'
        ImageIndex = 2
        object gbxComercial: TGroupBox
          Left = 2
          Top = 2
          Width = 453
          Height = 113
          Caption = 'EMPRESA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object edtClientesEmpresa: TDBEditTexto
            Left = 4
            Top = 14
            Width = 443
            Height = 23
            DataField = 'empresa'
            DataSource = dtmCadastroClientes.dsrClientes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = 18
            ParentFont = False
            TabOrder = 0
            CharCasenoDefault = False
            Alignment = taLeftJustify
          end
          object ckbClientesEmpComprovado: TDBCheckBox
            Left = 354
            Top = 82
            Width = 96
            Height = 25
            Caption = 'Comprovado'
            DataField = 'empcomprovado'
            DataSource = dtmCadastroClientes.dsrClientes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object gbxCargoEmpresa: TGroupBox
            Left = 4
            Top = 40
            Width = 358
            Height = 36
            Caption = 'CARGO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object sbnProcurarCargoClientes: TSpeedButton
              Left = 65
              Top = 10
              Width = 22
              Height = 22
              Hint = 'Procurar Cargo'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDC800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7FFFFFFFDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DC800000800000800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000
                00800000800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000008000
                00800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000008000008000
                00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFF
                FFFFDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCFFA858800000800000800000FFA858DCDCDC0000FF800000800000DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDC
                DCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFDCDCDCDCDCDC7F
                7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
                FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDC7F7F7FDCDCDCFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
                FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
                FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
                FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
                FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFFFFFFFDCDCDCDCDCDCDC
                DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
                7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
              NumGlyphs = 2
              ParentFont = False
              OnClick = sbnProcurarCargoClientesClick
            end
            object flkCargoClientes: TtecDBFindLookup
              Left = 2
              Top = 10
              Width = 60
              Height = 23
              Alignment = taLeftJustify
              DataField = 'empcargo'
              DataSource = dtmCadastroClientes.dsrClientes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 6
              Maximo = 0
              Minimo = 37353
              Adicional = 0
              Opcional = True
              ParentFont = False
              TabOrder = 0
              PermitirZero = False
              PermitirNulo = False
              Operacao = opATRIBUICAO
              LookupField = 'codigo'
              LookupSource = dtmCadastroClientes.dsrProcuraCargosCliente
              LookupQueryParameter = 'codigo'
              Parameter = ' '
              ActiveSetControls = False
              DenyInsert = True
              NoSetControls = <>
              SetControls = <>
              LookupParameter = 'codigo'
            end
            object dtxCargoClieDescricao: TtecDBText
              Left = 88
              Top = 10
              Width = 265
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'descricao'
              DataSource = dtmCadastroClientes.dsrProcuraCargosCliente
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              Alignment = taLeftJustify
            end
          end
          object gbxAdmissao: TGroupBox
            Left = 367
            Top = 40
            Width = 80
            Height = 36
            Caption = 'ADMISS'#195'O'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object edtClientesEmpAdmissao: TDBEditData
              Left = 2
              Top = 10
              Width = 75
              Height = 23
              Alignment = taLeftJustify
              DataField = 'empadmissao'
              DataSource = dtmCadastroClientes.dsrClientes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              Maximo = 0
              Minimo = 37353
              Adicional = 0
              ParentFont = False
              TabOrder = 0
              OnExit = edtClientesEmpAdmissaoExit
              Opcional = True
            end
          end
        end
        object gbxRenda: TGroupBox
          Left = 464
          Top = 78
          Width = 149
          Height = 141
          Caption = 'RENDAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          object gbxSalario: TGroupBox
            Left = 0
            Top = 14
            Width = 111
            Height = 36
            Caption = 'SAL'#193'RIO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object edtClientesEmpRendaValor: TDBEditNumero
              Left = 2
              Top = 10
              Width = 106
              Height = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
              TabOrder = 0
              Text = 'edtClientesEmpRendaValor'
              OnExit = edtClientesEmpRendaValorExit
              Mascara = True
              Alignment = taLeftJustify
              TipoMascara = tmGERAL
              NrDecimal = 2
              Decimais = True
              Negativo = False
              Tamanho = 7
              DataField = 'emprendavalor'
              DataSource = dtmCadastroClientes.dsrClientes
            end
          end
          object gbxOutrasRendas: TGroupBox
            Left = 0
            Top = 64
            Width = 150
            Height = 82
            Caption = 'OUTRAS RENDAS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object gbxValorRendas: TGroupBox
              Left = 0
              Top = 40
              Width = 111
              Height = 36
              Caption = 'VALOR'
              TabOrder = 1
              object edtClientesEmpOutrasValor: TDBEditNumero
                Left = 2
                Top = 10
                Width = 106
                Height = 23
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = -1
                ParentFont = False
                TabOrder = 0
                Text = 'edtClientesEmpOutrasValor'
                OnExit = edtClientesEmpOutrasValorExit
                Mascara = True
                Alignment = taLeftJustify
                TipoMascara = tmGERAL
                NrDecimal = 2
                Decimais = True
                Negativo = False
                Tamanho = 7
                DataField = 'empoutrasvalor'
                DataSource = dtmCadastroClientes.dsrClientes
              end
            end
            object edtClientesEmpOutrasDescricao: TDBEditTexto
              Left = 2
              Top = 13
              Width = 145
              Height = 23
              DataField = 'empoutrasdescricao'
              DataSource = dtmCadastroClientes.dsrClientes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 29
              ParentFont = False
              TabOrder = 0
              CharCasenoDefault = False
              Alignment = taLeftJustify
            end
            object gbxFaixaOutrasRendas: TGroupBox
              Left = 109
              Top = 40
              Width = 40
              Height = 36
              Caption = 'FAIXA'
              TabOrder = 2
              object dtxClientesEmpOutrasFaixa: TtecDBText
                Left = 2
                Top = 10
                Width = 35
                Height = 23
                TabStop = False
                Color = clBtnFace
                DataField = 'empoutrasfaixa'
                DataSource = dtmCadastroClientes.dsrClientes
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                Alignment = taLeftJustify
              end
            end
          end
          object gbxFaixaSalario: TGroupBox
            Left = 109
            Top = 14
            Width = 40
            Height = 36
            Caption = 'FAIXA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object dtxClientesEmpRendaFaixa: TtecDBText
              Left = 2
              Top = 10
              Width = 35
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'emprendafaixa'
              DataSource = dtmCadastroClientes.dsrClientes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Alignment = taLeftJustify
            end
          end
        end
        inline fraFoneRamalComercial: TfraFoneRamal
          Left = 464
          Top = 3
          Width = 149
          Height = 50
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          inherited gbxFone: TGroupBox
            Width = 149
            Height = 50
            Caption = ' TELEFONE '
            Font.Height = -11
            Font.Style = [fsBold]
            inherited lblDDD: TLabel
              Left = 1
              Height = 14
              Font.Height = -11
              Font.Style = [fsBold]
              ParentFont = False
            end
            inherited lblNumero: TLabel
              Left = 32
              Width = 45
              Height = 14
              Font.Height = -11
              Font.Style = [fsBold]
              ParentFont = False
            end
            inherited lblRamal: TLabel
              Left = 109
            end
            inherited edtDDD: TDBEditNumero
              Left = -1
              Width = 30
              Font.Height = -12
              Mascara = False
              DataField = 'empfoneddd'
              DataSource = dtmCadastroClientes.dsrClientes
            end
            inherited edtNumero: TDBEditFone
              Left = 28
              Width = 80
              DataField = 'empfonenumero'
              DataSource = dtmCadastroClientes.dsrClientes
              Font.Height = -12
            end
            inherited edtFoneRamal: TDBEditTexto
              Left = 106
              Width = 40
              DataField = 'empfoneramal'
              DataSource = dtmCadastroClientes.dsrClientes
              Font.Height = -12
              MaxLength = 12
            end
          end
        end
        inline fraEnderecoComercial: TfraEnderecoEditor
          Left = 2
          Top = 121
          Width = 454
          Height = 149
          HorzScrollBar.Visible = False
          VertScrollBar.Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          inherited gbxEndereco: TGroupBox
            Width = 454
            Height = 149
            Font.Style = [fsBold]
            inherited pnlNumero: TPanel
              Top = 53
              Width = 450
              inherited edtNumeroEndereco: TDBEditTexto
                DataField = 'empnumero'
                DataSource = dtmCadastroClientes.dsrClientes
              end
              inherited edtComplemento: TDBEditTexto
                DataField = 'empcomplemento'
                DataSource = dtmCadastroClientes.dsrClientes
              end
            end
            inherited pnlBairro: TPanel
              Top = 86
              Width = 450
              inherited edtBairro: TtecDoubleDBEdit
                LookupField = 'nomebairroempresa'
                LookupSource = dtmCadastroClientes.dsrClientes
                DataField = 'empbairro'
                DataSource = dtmCadastroClientes.dsrClientes
                MaxLength = 9
              end
            end
            inherited pnlCidade: TPanel
              Top = 122
              Width = 450
              inherited edtEstado: TDBEditTexto
                DataField = 'empestado'
                DataSource = dtmCadastroClientes.dsrClientes
                MaxLength = 9
              end
              inherited edtCidade: TtecDoubleDBEdit
                LookupField = 'nomecidadeempresa'
                LookupSource = dtmCadastroClientes.dsrClientes
                DataField = 'empcidade'
                DataSource = dtmCadastroClientes.dsrClientes
                MaxLength = 9
              end
              inherited edtCEP: TDBEditCep
                DataField = 'empcep'
                DataSource = dtmCadastroClientes.dsrClientes
                MaxLength = 6
              end
            end
            inherited pnlRua: TPanel
              Top = 13
              Width = 450
              inherited mmoRua: TtecDBMemo
                Width = 421
                DataField = 'emprua'
                DataSource = dtmCadastroClientes.dsrClientes
                Font.Height = -12
              end
            end
            inherited pnllblCidade: TPanel
              Top = 112
              Width = 450
              inherited lblCEP_: TLabel
                Left = 3
              end
            end
            inherited pnllblBairro: TPanel
              Top = 76
              Width = 450
              inherited lblBairro_: TLabel
                Height = 11
              end
            end
            inherited pnllblNumero: TPanel
              Top = 43
              Width = 450
              inherited lblenderecocliente_numero: TLabel
                Top = 0
                Height = 11
              end
              inherited lblenderecocliente_complemento: TLabel
                Top = 0
                Width = 71
                Height = 11
              end
            end
          end
        end
      end
      object tstConjuge: TTabSheet
        Caption = '  &4 - C'#244'njuge'
        ImageIndex = 3
        object gbxDadosConjuge_2: TGroupBox
          Left = 0
          Top = 0
          Width = 781
          Height = 366
          Align = alClient
          TabOrder = 0
          inline fraEnderecoConjuge: TfraEnderecoEditor
            Left = 8
            Top = 144
            Width = 455
            Height = 151
            HorzScrollBar.Visible = False
            VertScrollBar.Visible = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            inherited gbxEndereco: TGroupBox
              Width = 455
              Height = 151
              Caption = ' ENDERE'#199'O COMERCIAL '
              Font.Height = -11
              Font.Style = [fsBold]
              inherited pnlNumero: TPanel
                Top = 56
                Width = 451
                inherited edtNumeroEndereco: TDBEditTexto
                  Width = 78
                  DataField = 'connumero'
                  DataSource = dtmCadastroClientes.dsrClientes
                end
                inherited edtComplemento: TDBEditTexto
                  Left = 78
                  Width = 340
                  DataField = 'concomplemento'
                  DataSource = dtmCadastroClientes.dsrClientes
                end
              end
              inherited pnlBairro: TPanel
                Top = 90
                Width = 451
                inherited sbnBairro: TSpeedButton
                  OnClick = fraEnderecoConjugesbnBairroClick
                end
                inherited edtBairro: TtecDoubleDBEdit
                  Top = -1
                  LookupField = 'conbairronome'
                  LookupSource = dtmCadastroClientes.dsrClientes
                  DataField = 'conbairro'
                  DataSource = dtmCadastroClientes.dsrClientes
                  MaxLength = 9
                end
              end
              inherited pnlCidade: TPanel
                Top = 126
                Width = 451
                inherited edtEstado: TDBEditTexto
                  DataField = 'conestado'
                  DataSource = dtmCadastroClientes.dsrClientes
                  MaxLength = 9
                end
                inherited edtCidade: TtecDoubleDBEdit
                  Left = 80
                  Width = 312
                  LookupField = 'concidadenome'
                  LookupSource = dtmCadastroClientes.dsrClientes
                  DataField = 'concidade'
                  DataSource = dtmCadastroClientes.dsrClientes
                  MaxLength = 9
                end
                inherited edtCEP: TDBEditCep
                  DataField = 'concep'
                  DataSource = dtmCadastroClientes.dsrClientes
                  MaxLength = 6
                end
              end
              inherited pnlRua: TPanel
                Top = 16
                Width = 451
                inherited sbnRua: TSpeedButton
                  OnClick = fraEnderecoConjugesbnRuaClick
                end
                inherited mmoRua: TtecDBMemo
                  DataField = 'conrua'
                  DataSource = dtmCadastroClientes.dsrClientes
                  Font.Height = -12
                end
              end
              inherited pnllblCidade: TPanel
                Top = 116
                Width = 451
              end
              inherited pnllblBairro: TPanel
                Top = 79
                Width = 451
                Height = 11
                inherited lblBairro_: TLabel
                  Width = 40
                  Height = 14
                  Font.Height = -11
                  Font.Style = [fsBold]
                  ParentFont = False
                end
              end
              inherited pnllblNumero: TPanel
                Top = 46
                Width = 451
                inherited lblenderecocliente_numero: TLabel
                  Left = -2
                  Width = 45
                  Height = 14
                  Font.Height = -11
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                inherited lblenderecocliente_complemento: TLabel
                  Width = 84
                  Height = 14
                  Font.Height = -11
                  Font.Style = [fsBold]
                  ParentFont = False
                end
              end
            end
            inherited actRotulos: TActionList
              Left = 424
              Top = 48
            end
          end
          inline fraFoneRamalConjuge: TfraFoneRamal
            Left = 470
            Top = 51
            Width = 151
            Height = 52
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            inherited gbxFone: TGroupBox
              Width = 151
              Height = 52
              Caption = ' TELEFONE '
              Font.Height = -11
              Font.Style = [fsBold]
              inherited lblDDD: TLabel
                Height = 14
                Font.Height = -11
                Font.Style = [fsBold]
                ParentFont = False
              end
              inherited lblNumero: TLabel
                Left = 32
                Width = 45
                Height = 14
                Font.Height = -11
                Font.Style = [fsBold]
                ParentFont = False
              end
              inherited lblRamal: TLabel
                Left = 111
              end
              inherited edtDDD: TDBEditNumero
                Left = 0
                Width = 29
                Font.Height = -12
                DataField = 'confoneddd'
                DataSource = dtmCadastroClientes.dsrClientes
              end
              inherited edtNumero: TDBEditFone
                Left = 29
                Width = 79
                DataField = 'confonenumero'
                DataSource = dtmCadastroClientes.dsrClientes
                Font.Height = -12
              end
              inherited edtFoneRamal: TDBEditTexto
                Left = 108
                Width = 40
                DataField = 'confoneramal'
                DataSource = dtmCadastroClientes.dsrClientes
                Font.Height = -12
                MaxLength = 12
              end
            end
          end
          object gbxConjuge: TGroupBox
            Left = 7
            Top = 9
            Width = 455
            Height = 36
            Caption = 'C'#212'NJUGE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object sbnProcurarConjuge: TSpeedButton
              Left = 85
              Top = 11
              Width = 22
              Height = 22
              Hint = 'Procurar C'#244'njuge'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDC800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7FFFFFFFDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DC800000800000800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000
                00800000800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000008000
                00800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000008000008000
                00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFF
                FFFFDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCFFA858800000800000800000FFA858DCDCDC0000FF800000800000DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDC
                DCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFDCDCDCDCDCDC7F
                7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
                FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDC7F7F7FDCDCDCFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
                FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
                FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
                FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
                FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFFFFFFFDCDCDCDCDCDCDC
                DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
                7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
              NumGlyphs = 2
              ParentFont = False
              OnClick = sbnProcurarConjugeClick
            end
            object flkConjuge: TtecDBFindLookup
              Left = 2
              Top = 10
              Width = 80
              Height = 23
              Alignment = taLeftJustify
              DataField = 'conjuge'
              DataSource = dtmCadastroClientes.dsrClientes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 8
              Maximo = 0
              Minimo = 37353
              Adicional = 0
              Opcional = True
              OnMessage = flkConjugeMessage
              ParentFont = False
              TabOrder = 0
              PermitirZero = False
              PermitirNulo = False
              Operacao = opATRIBUICAO
              LookupField = 'codigo'
              LookupSource = dtmCadastroClientes.dsrProcuraConjuge
              LookupQueryParameter = 'codigo'
              Parameter = ' '
              ActiveSetControls = False
              DenyInsert = True
              NoSetControls = <>
              SetControls = <>
              LookupParameter = 'codigo'
            end
            object edtNomeConjuge: TDBEditTexto
              Left = 109
              Top = 10
              Width = 343
              Height = 23
              DataField = 'connome'
              DataSource = dtmCadastroClientes.dsrClientes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 14
              ParentFont = False
              TabOrder = 1
              CharCasenoDefault = False
              Alignment = taLeftJustify
            end
          end
          object gbxNasctoConjuge: TGroupBox
            Left = 470
            Top = 9
            Width = 80
            Height = 36
            Caption = 'NASCIMENTO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object edtNasctoConjuge: TDBEditData
              Left = 2
              Top = 10
              Width = 75
              Height = 23
              Alignment = taLeftJustify
              DataField = 'connascto'
              DataSource = dtmCadastroClientes.dsrClientes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              Maximo = 0
              Minimo = 37353
              Adicional = 0
              ParentFont = False
              TabOrder = 0
              Opcional = True
            end
          end
          object gbxEmpresaConjuge: TGroupBox
            Left = 7
            Top = 48
            Width = 455
            Height = 88
            Caption = 'EMPRESA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            object gbxCargoConjuge: TGroupBox
              Left = 5
              Top = 44
              Width = 358
              Height = 36
              Caption = 'CARGO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              object sbnProcurarCargosConjuge: TSpeedButton
                Left = 64
                Top = 11
                Width = 22
                Height = 22
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                Glyph.Data = {
                  36060000424D3606000000000000360000002800000020000000100000000100
                  18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDC800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7FFFFFFFDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DC800000800000800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000
                  00800000800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000008000
                  00800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000008000008000
                  00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFF
                  FFFFDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCFFA858800000800000800000FFA858DCDCDC0000FF800000800000DCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDC
                  DCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFDCDCDCDCDCDC7F
                  7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                  FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
                  FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDC7F7F7FDCDCDCFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
                  FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000DCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
                  FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
                  FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000DCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
                  FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                  FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFFFFFFFDCDCDCDCDCDCDC
                  DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
                  7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
                NumGlyphs = 2
                ParentFont = False
                OnClick = sbnProcurarCargosConjugeClick
              end
              object flkCargoConjuge: TtecDBFindLookup
                Left = 2
                Top = 10
                Width = 60
                Height = 23
                Alignment = taLeftJustify
                DataField = 'concargo'
                DataSource = dtmCadastroClientes.dsrClientes
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 6
                Maximo = 0
                Minimo = 37353
                Adicional = 0
                Opcional = True
                ParentFont = False
                TabOrder = 0
                PermitirZero = False
                PermitirNulo = False
                Operacao = opATRIBUICAO
                LookupField = 'codigo'
                LookupSource = dtmCadastroClientes.dsrProcuraCargosConjuge
                LookupQueryParameter = 'codigo'
                Parameter = ' '
                ActiveSetControls = False
                DenyInsert = False
                NoSetControls = <>
                SetControls = <>
                LookupParameter = 'codigo'
              end
              object dtxCargoDescricaoConjuge: TtecDBText
                Left = 87
                Top = 10
                Width = 268
                Height = 23
                TabStop = False
                Color = clBtnFace
                DataField = 'descricao'
                DataSource = dtmCadastroClientes.dsrProcuraCargosConjuge
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
                Alignment = taLeftJustify
              end
            end
            object gbxAdmissaoConjuge: TGroupBox
              Left = 367
              Top = 44
              Width = 80
              Height = 36
              Caption = 'ADMISS'#195'O'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              object edtAdmissaoConjuge: TDBEditData
                Left = 2
                Top = 10
                Width = 75
                Height = 23
                Alignment = taLeftJustify
                DataField = 'conadmissao'
                DataSource = dtmCadastroClientes.dsrClientes
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = [fsBold]
                Maximo = 0
                Minimo = 37353
                Adicional = 0
                ParentFont = False
                TabOrder = 0
                Opcional = True
              end
            end
            object edtEmpresaConjuge: TDBEditTexto
              Left = 4
              Top = 15
              Width = 442
              Height = 23
              DataField = 'conempresa'
              DataSource = dtmCadastroClientes.dsrClientes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 17
              ParentFont = False
              TabOrder = 2
              CharCasenoDefault = False
              Alignment = taLeftJustify
            end
          end
          object gbxRendaConjuge: TGroupBox
            Left = 470
            Top = 146
            Width = 149
            Height = 47
            Caption = 'RENDA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
            object gbxValorConjuge: TGroupBox
              Left = 0
              Top = 12
              Width = 111
              Height = 36
              Caption = 'VALOR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object edtRendaConjuge: TDBEditNumero
                Left = 2
                Top = 10
                Width = 106
                Height = 23
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = -1
                ParentFont = False
                TabOrder = 0
                Text = 'edtRendaConjuge'
                OnChange = edtRendaConjugeChange
                Mascara = True
                Alignment = taLeftJustify
                TipoMascara = tmGERAL
                NrDecimal = 2
                Decimais = True
                Negativo = False
                Tamanho = 7
                DataField = 'conrendavalor'
                DataSource = dtmCadastroClientes.dsrClientes
              end
            end
            object gbxFaixaConjuge: TGroupBox
              Left = 109
              Top = 12
              Width = 40
              Height = 36
              Caption = 'FAIXA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              object dtxFaixaConjuge: TtecDBText
                Left = 2
                Top = 10
                Width = 35
                Height = 23
                TabStop = False
                Color = clBtnFace
                DataField = 'conrendafaixa'
                DataSource = dtmCadastroClientes.dsrClientes
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                Alignment = taLeftJustify
              end
            end
          end
        end
      end
      object tstReferencia: TTabSheet
        Caption = ' &5 - Refer'#234'ncia'
        ImageIndex = 6
        inline fraEnderecoReferencia: TfraEnderecoEditor
          Left = 102
          Top = 44
          Width = 455
          Height = 147
          HorzScrollBar.Visible = False
          VertScrollBar.Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          inherited gbxEndereco: TGroupBox
            Width = 455
            Height = 147
            Font.Height = -11
            Font.Style = [fsBold]
            inherited pnlNumero: TPanel
              Top = 56
              Width = 451
              inherited edtNumeroEndereco: TDBEditTexto
                DataField = 'refnumero'
                DataSource = dtmCadastroClientes.dsrClientes
              end
              inherited edtComplemento: TDBEditTexto
                Width = 337
                DataField = 'refcomplemento'
                DataSource = dtmCadastroClientes.dsrClientes
              end
            end
            inherited pnlBairro: TPanel
              Top = 89
              Width = 451
              inherited edtBairro: TtecDoubleDBEdit
                LookupField = 'nomebairroreferencia'
                LookupSource = dtmCadastroClientes.dsrClientes
                DataField = 'refbairro'
                DataSource = dtmCadastroClientes.dsrClientes
                MaxLength = 9
              end
            end
            inherited pnlCidade: TPanel
              Top = 125
              Width = 451
              inherited edtEstado: TDBEditTexto
                DataField = 'refestado'
                DataSource = dtmCadastroClientes.dsrClientes
                MaxLength = 9
              end
              inherited edtCidade: TtecDoubleDBEdit
                LookupField = 'nomecidadereferencia'
                LookupSource = dtmCadastroClientes.dsrClientes
                DataField = 'refcidade'
                DataSource = dtmCadastroClientes.dsrClientes
                MaxLength = 9
              end
              inherited edtCEP: TDBEditCep
                DataField = 'refcep'
                DataSource = dtmCadastroClientes.dsrClientes
                MaxLength = 6
              end
            end
            inherited pnlRua: TPanel
              Top = 16
              Width = 451
              inherited mmoRua: TtecDBMemo
                DataField = 'refrua'
                DataSource = dtmCadastroClientes.dsrClientes
                Font.Height = -12
              end
            end
            inherited pnllblCidade: TPanel
              Top = 115
              Width = 451
            end
            inherited pnllblBairro: TPanel
              Top = 79
              Width = 451
              inherited lblBairro_: TLabel
                Width = 40
                Height = 14
                Font.Height = -11
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
            inherited pnllblNumero: TPanel
              Top = 46
              Width = 451
              inherited lblenderecocliente_numero: TLabel
                Left = -2
                Width = 45
                Height = 14
                Font.Height = -11
                Font.Style = [fsBold]
                ParentFont = False
              end
              inherited lblenderecocliente_complemento: TLabel
                Width = 84
                Height = 14
                Font.Height = -11
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
          end
        end
        object rgpReferenciaClientes: TtecDBRadioGroup
          Left = 6
          Top = 6
          Width = 87
          Height = 74
          Caption = 'TIPO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TabStop = False
          DataField = 'reftipo'
          DataSource = dtmCadastroClientes.dsrClientes
          object rbnRefParente: TtecRadioButton
            Left = 6
            Top = 11
            Width = 71
            Height = 17
            Caption = 'Parente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Value = 'P'
          end
          object rbnRefAmigo: TtecRadioButton
            Left = 6
            Top = 31
            Width = 71
            Height = 17
            Caption = 'Amigo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Value = 'A'
          end
          object rbnRefTrabalho: TtecRadioButton
            Left = 6
            Top = 50
            Width = 71
            Height = 17
            Caption = 'Trabalho'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Value = 'T'
          end
        end
        object gbxReferencia: TGroupBox
          Left = 102
          Top = 6
          Width = 455
          Height = 36
          Caption = 'NOME DA REFER'#202'NCIA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object edtClientesReferencia: TDBEditTexto
            Left = 2
            Top = 10
            Width = 451
            Height = 23
            DataField = 'referencia'
            DataSource = dtmCadastroClientes.dsrClientes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = 21
            ParentFont = False
            TabOrder = 0
            CharCasenoDefault = False
            Alignment = taLeftJustify
          end
        end
        object gbxFoneReferencia: TGroupBox
          Left = 102
          Top = 198
          Width = 311
          Height = 58
          Caption = 'TELEFONES'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          inline fraFoneRamalReferencia_2: TfraFoneRamal
            Left = 155
            Top = 12
            Width = 156
            Height = 43
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            inherited gbxFone: TGroupBox
              Width = 156
              Height = 43
              Caption = ''
              inherited lblDDD: TLabel
                Top = 8
              end
              inherited lblNumero: TLabel
                Left = 33
                Top = 8
              end
              inherited lblRamal: TLabel
                Left = 116
                Top = 8
              end
              inherited edtDDD: TDBEditNumero
                Top = 20
                Width = 30
                Font.Height = -12
                Mascara = False
                DataField = 'reffone2ddd'
                DataSource = dtmCadastroClientes.dsrClientes
              end
              inherited edtNumero: TDBEditFone
                Left = 33
                Top = 20
                Width = 80
                DataField = 'reffone2numero'
                DataSource = dtmCadastroClientes.dsrClientes
                Font.Height = -12
              end
              inherited edtFoneRamal: TDBEditTexto
                Left = 113
                Top = 20
                Width = 40
                DataField = 'reffone2ramal'
                DataSource = dtmCadastroClientes.dsrClientes
                Font.Height = -12
                MaxLength = 12
              end
            end
          end
          inline fraFoneRamalReferencia_1: TfraFoneRamal
            Left = 0
            Top = 12
            Width = 157
            Height = 44
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            inherited gbxFone: TGroupBox
              Width = 157
              Height = 44
              Caption = ''
              inherited lblDDD: TLabel
                Top = 8
              end
              inherited lblNumero: TLabel
                Left = 33
                Top = 8
              end
              inherited lblRamal: TLabel
                Left = 116
                Top = 8
              end
              inherited edtDDD: TDBEditNumero
                Top = 20
                Width = 30
                Font.Height = -12
                Mascara = False
                DataField = 'reffoneddd'
                DataSource = dtmCadastroClientes.dsrClientes
              end
              inherited edtNumero: TDBEditFone
                Left = 33
                Top = 20
                Width = 80
                DataField = 'reffonenumero'
                DataSource = dtmCadastroClientes.dsrClientes
                Font.Height = -12
              end
              inherited edtFoneRamal: TDBEditTexto
                Left = 114
                Top = 20
                Width = 40
                DataField = 'reffoneramal'
                DataSource = dtmCadastroClientes.dsrClientes
                Font.Height = -12
                MaxLength = 12
              end
            end
          end
        end
      end
      object tstOutrosDados: TTabSheet
        Caption = ' &6 - Outros'
        ImageIndex = 4
        object gbxSerie: TGroupBox
          Left = 237
          Top = 2
          Width = 155
          Height = 112
          Caption = 'S'#201'RIES DE NFs'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          object dbgSerie: TtecDBGrid
            Left = 1
            Top = 12
            Width = 152
            Height = 98
            DataSource = dtmCadastroClientes.dsrSeriesClientes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -9
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = []
            OnKeyDown = dbgSerieKeyDown
            OnKeyPress = dbgSerieKeyPress
            RowWrap = 60
            Large = False
            DoubleRowColor = False
            MsgDelete = 'a S'#201'RIE'
            TitleMinHeight = 100
            CellHeights = 100
            StrippedColor = 16054260
            CanDelete = False
            CanNotInsertFromGrid = False
            PostOnEnter = False
            PostOnSetUpDown = False
            DenySort = False
            DefaultRowHeight = 19
            ExibirNumerodaLinha = False
            NaoAtribuirDadosaTabelaaoDigitar = False
            ShowWhenFieldInvisible = False
            CanClickWhenEditing = False
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'serie'
                Title.Alignment = taCenter
                Title.Caption = 'S'#201'RIE'
                Width = 35
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'modelodoctofiscal'
                Title.Caption = 'MODELO DOCTO'
                Visible = True
              end>
          end
        end
        object gbxContabilidade: TGroupBox
          Left = 0
          Top = 215
          Width = 577
          Height = 110
          Caption = 'CONTABILIDADE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          object gbxDebitar: TGroupBox
            Left = 6
            Top = 13
            Width = 567
            Height = 36
            Caption = 'DEBITAR'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object sbnConsultaDebitar: TSpeedButton
              Left = 69
              Top = 10
              Width = 22
              Height = 22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDC800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7FFFFFFFDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DC800000800000800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000
                00800000800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000008000
                00800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000008000008000
                00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFF
                FFFFDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCFFA858800000800000800000FFA858DCDCDC0000FF800000800000DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDC
                DCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC7F
                7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
                FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDC7F7F7FDCDCDCFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
                FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
                FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
                FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
                FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCFFFFFFFFFFFFDCDCDCDCDCDCDC
                DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FDCDCDCFFFFFFFFFFFF7F
                7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
              NumGlyphs = 2
              ParentFont = False
              OnClick = sbnConsultaDebitarClick
            end
            object dtxDebitarDescricao: TtecDBText
              Left = 92
              Top = 10
              Width = 328
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'descricao'
              DataSource = dtmCadastroClientes.dsrProcuraDebitar
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              Alignment = taLeftJustify
            end
            object flkDebitar: TtecDBFindLookup
              Left = 2
              Top = 10
              Width = 65
              Height = 23
              Alignment = taLeftJustify
              DataField = 'debito'
              DataSource = dtmCadastroClientes.dsrClientes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 6
              Maximo = 0
              Minimo = 37353
              Adicional = 0
              Opcional = True
              ParentFont = False
              TabOrder = 0
              PermitirZero = False
              PermitirNulo = False
              Operacao = opATRIBUICAO
              LookupField = 'codigo'
              LookupSource = dtmCadastroClientes.dsrProcuraDebitar
              LookupQueryParameter = 'codigo'
              Parameter = ' '
              ActiveSetControls = False
              DenyInsert = True
              NoSetControls = <>
              SetControls = <>
              LookupParameter = 'codigo'
            end
            object dtxDebitarClassificacao: TtecDBText
              Left = 421
              Top = 9
              Width = 143
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'classificacao'
              DataSource = dtmCadastroClientes.dsrProcuraDebitar
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
              Alignment = taLeftJustify
            end
          end
          object gbxCreditar: TGroupBox
            Left = 6
            Top = 61
            Width = 567
            Height = 36
            Caption = 'CREDITAR'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object sbnConsultaCreditar: TSpeedButton
              Left = 69
              Top = 10
              Width = 22
              Height = 22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDC800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7FFFFFFFDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DC800000800000800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000
                00800000800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000008000
                00800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000008000008000
                00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFF
                FFFFDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCFFA858800000800000800000FFA858DCDCDC0000FF800000800000DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDC
                DCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC7F
                7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
                FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDC7F7F7FDCDCDCFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
                FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
                FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
                FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
                FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCFFFFFFFFFFFFDCDCDCDCDCDCDC
                DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FDCDCDCFFFFFFFFFFFF7F
                7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
              NumGlyphs = 2
              ParentFont = False
              OnClick = sbnConsultaCreditarClick
            end
            object dtxCreditarDescricao: TtecDBText
              Left = 92
              Top = 10
              Width = 328
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'descricao'
              DataSource = dtmCadastroClientes.dsrProcuraCreditar
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Alignment = taLeftJustify
            end
            object flkCreditar: TtecDBFindLookup
              Left = 2
              Top = 10
              Width = 65
              Height = 23
              Alignment = taLeftJustify
              DataField = 'credito'
              DataSource = dtmCadastroClientes.dsrClientes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 6
              Maximo = 0
              Minimo = 37353
              Adicional = 0
              Opcional = True
              ParentFont = False
              TabOrder = 1
              PermitirZero = False
              PermitirNulo = False
              Operacao = opATRIBUICAO
              LookupField = 'codigo'
              LookupSource = dtmCadastroClientes.dsrProcuraCreditar
              LookupQueryParameter = 'codigo'
              Parameter = ' '
              ActiveSetControls = False
              DenyInsert = True
              NoSetControls = <>
              SetControls = <>
              LookupParameter = 'codigo'
            end
            object dtxCreditarClassificacao: TtecDBText
              Left = 421
              Top = 10
              Width = 143
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'classificacao'
              DataSource = dtmCadastroClientes.dsrProcuraCreditar
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
              Alignment = taLeftJustify
            end
          end
        end
        object gbxPlanoPadrao: TGroupBox
          Left = 1
          Top = 177
          Width = 311
          Height = 36
          Caption = 'PLANO DE PAGTO PADR'#195'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          object sbnConsultaPlano: TSpeedButton
            Left = 54
            Top = 10
            Width = 23
            Height = 23
            Hint = 'Procurar Cargo'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDC800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7FFFFFFFDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DC800000800000800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000
              00800000800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000008000
              00800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000008000008000
              00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFF
              FFFFDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCFFA858800000800000800000FFA858DCDCDC0000FF800000800000DCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDC
              DCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFDCDCDCDCDCDC7F
              7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
              FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
              FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDC7F7F7FDCDCDCFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
              FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000DCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
              FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
              FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000DCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
              FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
              FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFFFFFFFDCDCDCDCDCDCDC
              DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
              7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
            NumGlyphs = 2
            ParentFont = False
            OnClick = sbnConsultaPlanoClick
          end
          object flkPlanoPadrao: TtecDBFindLookup
            Left = 5
            Top = 10
            Width = 48
            Height = 23
            Alignment = taLeftJustify
            DataField = 'planopadrao'
            DataSource = dtmCadastroClientes.dsrClientes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = 6
            Maximo = 0
            Minimo = 37353
            Adicional = 0
            Opcional = True
            ParentFont = False
            TabOrder = 0
            PermitirZero = False
            PermitirNulo = False
            Operacao = opATRIBUICAO
            LookupField = 'codigo'
            LookupSource = dtmCadastroClientes.dsrProcuraPlano
            LookupQueryParameter = 'codigo'
            Parameter = ' '
            ActiveSetControls = False
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
            LookupParameter = 'codigo'
          end
          object dtxPlanoPadraoDescricao: TtecDBText
            Left = 78
            Top = 10
            Width = 230
            Height = 23
            TabStop = False
            Color = clBtnFace
            DataField = 'descricao'
            DataSource = dtmCadastroClientes.dsrProcuraPlano
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            Alignment = taLeftJustify
          end
        end
        object ckbNaoExibirFichaFinanceira: TDBCheckBox
          Left = 1
          Top = 9
          Width = 224
          Height = 23
          Caption = 'N'#227'o exibir ficha financeira'
          DataField = 'naoexibirfichafinanceira'
          DataSource = dtmCadastroClientes.dsrClientes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object ckbContribuinteICMS: TDBCheckBox
          Left = 1
          Top = 30
          Width = 224
          Height = 23
          Caption = 'Contribuinte do ICMS'
          DataField = 'contribicms'
          DataSource = dtmCadastroClientes.dsrClientes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object gbxMarkup: TGroupBox
          Left = 2
          Top = 137
          Width = 71
          Height = 36
          Caption = 'MARK-UP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          object lblMarkUp: TLabel
            Left = 54
            Top = 13
            Width = 12
            Height = 16
            Caption = '%'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
          end
          object edtMarkup: TDBEditNumero
            Left = 2
            Top = 10
            Width = 50
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            TabOrder = 0
            Text = 'edtMarkup'
            Mascara = True
            Alignment = taLeftJustify
            TipoMascara = tmGERAL
            NrDecimal = 2
            Decimais = True
            Negativo = False
            Tamanho = 4
            DataField = 'markup'
            DataSource = dtmCadastroClientes.dsrClientes
          end
        end
        object gbxPontuacao: TGroupBox
          Left = 397
          Top = 1
          Width = 262
          Height = 140
          Caption = 'PONTUA'#199#195'O DE CR'#201'DITO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          object gbxNrDependentes: TGroupBox
            Left = 0
            Top = 15
            Width = 105
            Height = 36
            Caption = 'N'#186' DEPENDENTES'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object edtClientesDependentes: TDBEditNumero
              Left = 28
              Top = 10
              Width = 35
              Height = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
              TabOrder = 0
              Text = 'edtClientesDependentes'
              Mascara = False
              Alignment = taLeftJustify
              TipoMascara = tmGERAL
              NrDecimal = 2
              Decimais = False
              Negativo = False
              Tamanho = 2
              DataField = 'dependentes'
              DataSource = dtmCadastroClientes.dsrClientes
            end
          end
          object gbxOutrosOnus: TGroupBox
            Left = 0
            Top = 60
            Width = 105
            Height = 36
            Caption = 'OUTROS '#212'NUS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object edtClientesOnus: TDBEditNumero
              Left = 2
              Top = 10
              Width = 99
              Height = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
              TabOrder = 0
              Text = 'edtClientesOnus'
              Mascara = True
              Alignment = taLeftJustify
              TipoMascara = tmGERAL
              NrDecimal = 2
              Decimais = True
              Negativo = False
              Tamanho = 7
              DataField = 'onus'
              DataSource = dtmCadastroClientes.dsrClientes
            end
          end
          object gbxIndicadores: TGroupBox
            Left = 104
            Top = 15
            Width = 158
            Height = 124
            Caption = 'POSSUI'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object ckbClientesCartaoCredito: TDBCheckBox
              Left = 4
              Top = 12
              Width = 128
              Height = 20
              Caption = 'Cart'#227'o de cr'#233'dito'
              DataField = 'cartaocredito'
              DataSource = dtmCadastroClientes.dsrClientes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object ckbCartaoLoja: TDBCheckBox
              Left = 4
              Top = 33
              Width = 146
              Height = 21
              Caption = 'Cart'#227'o em alguma loja'
              DataField = 'cartaoloja'
              DataSource = dtmCadastroClientes.dsrClientes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object ckbCheque: TDBCheckBox
              Left = 4
              Top = 55
              Width = 128
              Height = 20
              Caption = 'Cheque comum'
              DataField = 'cheque'
              DataSource = dtmCadastroClientes.dsrClientes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object ckbChequeEspecial: TDBCheckBox
              Left = 4
              Top = 76
              Width = 128
              Height = 20
              Caption = 'Cheque especial'
              DataField = 'chequeespecial'
              DataSource = dtmCadastroClientes.dsrClientes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object ckbClientesAutomovel: TDBCheckBox
              Left = 4
              Top = 98
              Width = 128
              Height = 20
              Caption = 'Autom'#243'vel'
              DataField = 'automovel'
              DataSource = dtmCadastroClientes.dsrClientes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              ValueChecked = 'T'
              ValueUnchecked = 'False'
            end
          end
        end
        object ckbCobrancaemCarteira: TDBCheckBox
          Left = 1
          Top = 51
          Width = 224
          Height = 23
          Caption = 'Cobran'#231'a em carteira'
          DataField = 'cobrancaemcarteira'
          DataSource = dtmCadastroClientes.dsrClientes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object ckbTagAdPedNFE: TDBCheckBox
          Left = 1
          Top = 72
          Width = 224
          Height = 23
          Caption = 'Tag adicional do pedido na NFE'
          DataField = 'tagadpednfe'
          DataSource = dtmCadastroClientes.dsrClientes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object ckbRecolhericmsst: TDBCheckBox
          Left = 1
          Top = 93
          Width = 224
          Height = 23
          Caption = 'Recolher ICMS ST'
          DataField = 'recolhericmsst'
          DataSource = dtmCadastroClientes.dsrClientes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
      end
      object tstDependentes: TTabSheet
        Caption = ' &7 - Dependentes'
        ImageIndex = 7
        OnShow = tstDependentesShow
        object gbxDependentes: TGroupBox
          Left = 0
          Top = 0
          Width = 781
          Height = 366
          Align = alClient
          TabOrder = 0
          object dbgDependentes: TtecDBGrid
            Left = 2
            Top = 18
            Width = 755
            Height = 346
            Align = alClient
            DataSource = dtmCadastroClientes.dsrDependentesClientes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -13
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = [fsBold]
            OnDblClick = dbgDependentesDblClick
            OnKeyDown = dbgDependentesKeyDown
            RowWrap = 60
            Large = False
            DoubleRowColor = False
            MsgDelete = 'o EQUIPAMENTO DO CLIENTE'
            TitleMinHeight = 100
            CellHeights = 100
            StrippedColor = 16054260
            CanDelete = False
            CanNotInsertFromGrid = False
            PostOnEnter = False
            PostOnSetUpDown = False
            DenySort = False
            DefaultRowHeight = 19
            ExibirNumerodaLinha = False
            NaoAtribuirDadosaTabelaaoDigitar = False
            ShowWhenFieldInvisible = False
            CanClickWhenEditing = False
            Columns = <
              item
                Expanded = False
                FieldName = 'nome'
                Title.Alignment = taCenter
                Title.Caption = 'NOME DO DEPENDENTE'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 370
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nascto'
                Title.Alignment = taCenter
                Title.Caption = 'NASCIMENTO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'autorizadoacomprar'
                Title.Alignment = taCenter
                Title.Caption = 'AUTORIZADO A COMPRAR'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Visible = True
              end>
          end
          object Panel1: TPanel
            Left = 757
            Top = 18
            Width = 22
            Height = 346
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            object sbnExcluirDependente: TSpeedButton
              Left = -1
              Top = 46
              Width = 23
              Height = 23
              Hint = 'Excluir equipamento'
              Flat = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                A0A0A00000FF0000FF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDC0000FFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFFF
                FFFFDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFF808080DCDCDCDCDCDCDCDCDC
                0000FF0000FF0000FF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DC0000000000FFDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7FFF
                FFFFDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF808080DCDCDCDCDCDCDCDCDCDCDCDC
                0000FF0000FF0000FF0000FF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC0000
                000000FF808080DCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7FFF
                FFFFFFFFFFDCDCDCDCDCDCFFFFFF808080808080DCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC0000FF0000FF0000FF0000FF000000DCDCDCDCDCDCDCDCDC0000000000
                FF808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F
                7F7FFFFFFFDCDCDCFFFFFF808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDC0000FF0000FF0000FF000000DCDCDCDCDCDC0000000000FF0000
                FF808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F
                7F7FFFFFFFFFFFFF808080808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDC0000FF0000FF0000FF0000000000000000FF0000FF8080
                80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F
                7F7F7F7F7F808080808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDC0000FF0000FF0000FF0000FF0000FF808080DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F80
                80807F7F7F808080808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDC0000000000FF0000FF0000FF0000FFDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F
                7F7F7F7F7F7F7F7F808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDC0000000000000000FF0000FF0000FF000000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFF8080808080807F
                7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC0000000000FF0000FF0000FF0000FF0000FF0000FF000000DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFF80808080808080808080
                80807F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC0000FF
                0000FF0000FF0000FF0000FF0000FF808080DCDCDC7F7F7F0000FF000000DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF808080808080808080808080808080DC
                DCDCDCDCDC7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDC0000FF
                0000FF0000FF0000FF0000FF808080DCDCDCDCDCDCDCDCDC8080800000FF0000
                00DCDCDCDCDCDCDCDCDCDCDCDC808080808080808080808080808080DCDCDCDC
                DCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCA0A0A0
                0000FF0000FF808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC0000
                FF0000FF000000DCDCDCDCDCDC808080808080808080808080DCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
              NumGlyphs = 2
              OnClick = sbnExcluirDependenteClick
            end
            object sbnIncluirDependente: TSpeedButton
              Left = -1
              Top = 22
              Width = 23
              Height = 23
              Hint = 'Incluir equipamento'
              Flat = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDC7F7F7F7F7F7F7F7F7F8080808080807F7F7F7F7F7F7F7F7F7F7F
                7F808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC0000000000000000000000000000000000000000000000000000000000
                00808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7F7F
                7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                00808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDCDCDCDCFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
                00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDC7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDC7F7F7FFFFFFFDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDC7F7F7FFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFFFFFFFFF
                FFFF7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000000000000000000000000000000000DCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7F7F
                7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
              NumGlyphs = 2
              OnClick = sbnIncluirDependenteClick
            end
          end
        end
      end
      object tstEquipamentos: TTabSheet
        Caption = ' &8 - Equiptos'
        ImageIndex = 6
        OnShow = tstEquipamentosShow
        object gbxEquipamentos: TGroupBox
          Left = 0
          Top = 0
          Width = 781
          Height = 366
          Align = alClient
          TabOrder = 0
          object dbgEquipamentos: TtecDBGrid
            Left = 2
            Top = 18
            Width = 755
            Height = 346
            Align = alClient
            DataSource = dtmCadastroEquipamentos.dsrEquipamentosClientes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -13
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = [fsBold]
            OnDblClick = dbgEquipamentosDblClick
            OnKeyDown = dbgEquipamentosKeyDown
            RowWrap = 60
            Large = False
            DoubleRowColor = False
            MsgDelete = 'o EQUIPAMENTO DO CLIENTE'
            TitleMinHeight = 100
            CellHeights = 100
            StrippedColor = 16054260
            CanDelete = False
            CanNotInsertFromGrid = False
            PostOnEnter = False
            PostOnSetUpDown = False
            DenySort = False
            DefaultRowHeight = 19
            ExibirNumerodaLinha = False
            NaoAtribuirDadosaTabelaaoDigitar = False
            ShowWhenFieldInvisible = False
            CanClickWhenEditing = False
            Columns = <
              item
                Expanded = False
                FieldName = 'Equipamento'
                Title.Alignment = taCenter
                Title.Caption = 'C'#211'DIGO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Descricao'
                Title.Alignment = taCenter
                Title.Caption = 'DESCRI'#199#195'O'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 250
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Referencia'
                Title.Alignment = taCenter
                Title.Caption = 'REFER'#202'NCIA'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 120
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Ano'
                Title.Alignment = taCenter
                Title.Caption = 'ANO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Modelo'
                Title.Alignment = taCenter
                Title.Caption = 'MODELO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DescricaoMarca'
                Title.Alignment = taCenter
                Title.Caption = 'MARCA'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 125
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Opcionais'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                Title.Alignment = taCenter
                Title.Caption = 'OPCIONAIS'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 260
                Visible = True
              end>
          end
          object pnlOpcoesProdutos: TPanel
            Left = 757
            Top = 18
            Width = 22
            Height = 346
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            object sbnIncluirEquipamento: TSpeedButton
              Left = 0
              Top = 25
              Width = 21
              Height = 23
              Flat = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDC7F7F7F7F7F7F7F7F7F8080808080807F7F7F7F7F7F7F7F7F7F7F
                7F808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC0000000000000000000000000000000000000000000000000000000000
                00808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7F7F
                7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                00808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDCDCDCDCFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
                00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDC7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDC7F7F7FFFFFFFDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDC7F7F7FFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFFFFFFFFF
                FFFF7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000000000000000000000000000000000DCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7F7F
                7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
              NumGlyphs = 2
              OnClick = sbnIncluirEquipamentoClick
            end
            object sbnExcluirEquipamento: TSpeedButton
              Left = 0
              Top = 57
              Width = 21
              Height = 23
              Flat = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                A0A0A00000FF0000FF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDC0000FFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFFF
                FFFFDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFF808080DCDCDCDCDCDCDCDCDC
                0000FF0000FF0000FF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DC0000000000FFDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7FFF
                FFFFDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF808080DCDCDCDCDCDCDCDCDCDCDCDC
                0000FF0000FF0000FF0000FF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC0000
                000000FF808080DCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7FFF
                FFFFFFFFFFDCDCDCDCDCDCFFFFFF808080808080DCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC0000FF0000FF0000FF0000FF000000DCDCDCDCDCDCDCDCDC0000000000
                FF808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F
                7F7FFFFFFFDCDCDCFFFFFF808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDC0000FF0000FF0000FF000000DCDCDCDCDCDC0000000000FF0000
                FF808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F
                7F7FFFFFFFFFFFFF808080808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDC0000FF0000FF0000FF0000000000000000FF0000FF8080
                80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F
                7F7F7F7F7F808080808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDC0000FF0000FF0000FF0000FF0000FF808080DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F80
                80807F7F7F808080808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDC0000000000FF0000FF0000FF0000FFDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F
                7F7F7F7F7F7F7F7F808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDC0000000000000000FF0000FF0000FF000000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFF8080808080807F
                7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC0000000000FF0000FF0000FF0000FF0000FF0000FF000000DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFF80808080808080808080
                80807F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC0000FF
                0000FF0000FF0000FF0000FF0000FF808080DCDCDC7F7F7F0000FF000000DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF808080808080808080808080808080DC
                DCDCDCDCDC7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDC0000FF
                0000FF0000FF0000FF0000FF808080DCDCDCDCDCDCDCDCDC8080800000FF0000
                00DCDCDCDCDCDCDCDCDCDCDCDC808080808080808080808080808080DCDCDCDC
                DCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCA0A0A0
                0000FF0000FF808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC0000
                FF0000FF000000DCDCDCDCDCDC808080808080808080808080DCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
              NumGlyphs = 2
              OnClick = sbnExcluirEquipamentoClick
            end
          end
        end
      end
      object tstReceitasOculos: TTabSheet
        Caption = '&9 - '#211'culos'
        ImageIndex = 8
        object gbxReceitas: TGroupBox
          Left = 0
          Top = 0
          Width = 781
          Height = 366
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object gbxOlhoDireito: TGroupBox
            Left = 257
            Top = 16
            Width = 114
            Height = 70
            Caption = 'OLHO DIREITO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object gbxEixoOD: TGroupBox
              Left = 0
              Top = 46
              Width = 112
              Height = 25
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              object lblEixo_od: TLabel
                Left = 3
                Top = 7
                Width = 23
                Height = 15
                Caption = 'Eixo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object edtEixo_od: TDBEditNumero
                Left = 57
                Top = 4
                Width = 53
                Height = 23
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 3
                ParentFont = False
                TabOrder = 0
                Text = 'edt'
                Mascara = True
                Alignment = taLeftJustify
                TipoMascara = tmGERAL
                NrDecimal = 0
                Decimais = False
                Negativo = True
                Tamanho = 3
                DataField = 'eixo_od'
                DataSource = dtmCadastroClientes.dsrReceitaOculos
              end
            end
            object gbxCilindroOD: TGroupBox
              Left = 0
              Top = 28
              Width = 112
              Height = 25
              TabOrder = 2
              object lblCilindro_od: TLabel
                Left = 3
                Top = 7
                Width = 43
                Height = 15
                Caption = 'Cilindro'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object edtCilindro_od: TDBEditNumero
                Left = 57
                Top = 4
                Width = 53
                Height = 23
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 4
                ParentFont = False
                TabOrder = 0
                Text = 'edtC'
                Mascara = True
                Alignment = taLeftJustify
                TipoMascara = tmGERAL
                NrDecimal = 2
                Decimais = True
                Negativo = True
                Tamanho = 2
                DataField = 'cilindro_od'
                DataSource = dtmCadastroClientes.dsrReceitaOculos
              end
            end
            object gbxEsfericoOD: TGroupBox
              Left = 0
              Top = 10
              Width = 112
              Height = 25
              TabOrder = 0
              object lblEsfericoOD: TLabel
                Left = 3
                Top = 7
                Width = 45
                Height = 15
                Caption = 'Esf'#233'rico'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object edtEsferico_od: TDBEditNumero
                Left = 57
                Top = 4
                Width = 53
                Height = 23
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 4
                ParentFont = False
                TabOrder = 0
                Text = 'edtE'
                Mascara = True
                Alignment = taLeftJustify
                TipoMascara = tmGERAL
                NrDecimal = 2
                Decimais = True
                Negativo = True
                Tamanho = 2
                DataField = 'esferico_od'
                DataSource = dtmCadastroClientes.dsrReceitaOculos
              end
            end
          end
          object gbxDistanciaNasoPupilarLonge: TGroupBox
            Left = 381
            Top = 15
            Width = 186
            Height = 36
            Caption = 'LONGE - DIST'#194'NCIA NASO-PUPILAR'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object edtlonge_dnp_oe: TDBEditNumero
              Left = 12
              Top = 10
              Width = 53
              Height = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 3
              ParentFont = False
              TabOrder = 0
              Text = 'edt'
              Mascara = True
              Alignment = taLeftJustify
              TipoMascara = tmGERAL
              NrDecimal = 0
              Decimais = False
              Negativo = True
              Tamanho = 3
              DataField = 'longe_dnp_oe'
              DataSource = dtmCadastroClientes.dsrReceitaOculos
            end
            object edtlonge_dnp_od: TDBEditNumero
              Left = 119
              Top = 10
              Width = 53
              Height = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 3
              ParentFont = False
              TabOrder = 1
              Text = 'edt'
              Mascara = True
              Alignment = taLeftJustify
              TipoMascara = tmGERAL
              NrDecimal = 0
              Decimais = False
              Negativo = True
              Tamanho = 3
              DataField = 'longe_dnp_od'
              DataSource = dtmCadastroClientes.dsrReceitaOculos
            end
          end
          object gbxDistanciaNasoPupilarPerto: TGroupBox
            Left = 381
            Top = 103
            Width = 186
            Height = 36
            Caption = 'PERTO - DIST'#194'NCIA NASO-PUPILAR'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            object edtperto_dnp_oe: TDBEditNumero
              Left = 12
              Top = 10
              Width = 53
              Height = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 3
              ParentFont = False
              TabOrder = 0
              Text = 'edt'
              Mascara = True
              Alignment = taLeftJustify
              TipoMascara = tmGERAL
              NrDecimal = 0
              Decimais = False
              Negativo = True
              Tamanho = 3
              DataField = 'perto_dnp_oe'
              DataSource = dtmCadastroClientes.dsrReceitaOculos
            end
            object edtperto_dnp_od: TDBEditNumero
              Left = 119
              Top = 10
              Width = 53
              Height = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 3
              ParentFont = False
              TabOrder = 1
              Text = 'edt'
              Mascara = True
              Alignment = taLeftJustify
              TipoMascara = tmGERAL
              NrDecimal = 0
              Decimais = False
              Negativo = True
              Tamanho = 3
              DataField = 'perto_dnp_od'
              DataSource = dtmCadastroClientes.dsrReceitaOculos
            end
          end
          object gbxAdicao: TGroupBox
            Left = 411
            Top = 58
            Width = 60
            Height = 36
            Caption = 'ADI'#199#195'O'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            object edtAdicao: TDBEditNumero
              Left = 2
              Top = 10
              Width = 55
              Height = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 3
              ParentFont = False
              TabOrder = 0
              Text = '1'
              Mascara = True
              Alignment = taLeftJustify
              TipoMascara = tmGERAL
              NrDecimal = 0
              Decimais = False
              Negativo = True
              Tamanho = 3
              DataField = 'adicao'
              DataSource = dtmCadastroClientes.dsrReceitaOculos
            end
          end
          object rbpTipoLente: TDBRadioGroup
            Left = 482
            Top = 151
            Width = 210
            Height = 36
            Columns = 4
            DataField = 'tipo'
            DataSource = dtmCadastroClientes.dsrReceitaOculos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Items.Strings = (
              'CR'
              'Cristal'
              'Poli.'
              'AR')
            ParentFont = False
            TabOrder = 5
            Values.Strings = (
              '1'
              '2'
              '3'
              '4')
          end
          object dbgContratos: TtecDBGrid
            Left = 2
            Top = 17
            Width = 241
            Height = 347
            Align = alLeft
            DataSource = dtmCadastroClientes.dsrReceitaOculos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -13
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = []
            RowWrap = 60
            Large = False
            DoubleRowColor = False
            TitleMinHeight = 100
            CellHeights = 100
            StrippedColor = 16054260
            CanDelete = False
            CanNotInsertFromGrid = False
            PostOnEnter = False
            PostOnSetUpDown = False
            DenySort = False
            DefaultRowHeight = 19
            ExibirNumerodaLinha = False
            NaoAtribuirDadosaTabelaaoDigitar = False
            ShowWhenFieldInvisible = False
            CanClickWhenEditing = False
            Columns = <
              item
                Expanded = False
                FieldName = 'contrato'
                Title.Alignment = taCenter
                Title.Caption = 'CONTRATO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 94
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'situacao'
                Title.Alignment = taCenter
                Title.Caption = 'SITUA'#199#195'O'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 105
                Visible = True
              end>
          end
          object gbxOlhoEsquerdo: TGroupBox
            Left = 578
            Top = 14
            Width = 114
            Height = 70
            Caption = 'OLHO ESQUERDO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            object gbxEixoOE: TGroupBox
              Left = 0
              Top = 46
              Width = 112
              Height = 25
              TabOrder = 1
              object lblEixoOE: TLabel
                Left = 3
                Top = 7
                Width = 23
                Height = 15
                Caption = 'Eixo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object edtEixo_oe: TDBEditNumero
                Left = 57
                Top = 4
                Width = 53
                Height = 23
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 3
                ParentFont = False
                TabOrder = 0
                Text = 'edt'
                Mascara = True
                Alignment = taLeftJustify
                TipoMascara = tmGERAL
                NrDecimal = 0
                Decimais = False
                Negativo = True
                Tamanho = 3
                DataField = 'eixo_oe'
                DataSource = dtmCadastroClientes.dsrReceitaOculos
              end
            end
            object gbxCilindoOE: TGroupBox
              Left = 0
              Top = 28
              Width = 112
              Height = 25
              TabOrder = 2
              object lblCilindroOE: TLabel
                Left = 3
                Top = 7
                Width = 43
                Height = 15
                Caption = 'Cilindro'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object edtCilindro_oe: TDBEditNumero
                Left = 57
                Top = 4
                Width = 53
                Height = 23
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 4
                ParentFont = False
                TabOrder = 0
                Text = 'edtC'
                Mascara = True
                Alignment = taLeftJustify
                TipoMascara = tmGERAL
                NrDecimal = 2
                Decimais = True
                Negativo = True
                Tamanho = 2
                DataField = 'cilindro_oe'
                DataSource = dtmCadastroClientes.dsrReceitaOculos
              end
            end
            object gbxEsferidoOE: TGroupBox
              Left = 0
              Top = 10
              Width = 112
              Height = 25
              TabOrder = 0
              object lblEsfericoOE: TLabel
                Left = 3
                Top = 7
                Width = 45
                Height = 15
                Caption = 'Esf'#233'rico'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object edtEsferico_oe: TDBEditNumero
                Left = 57
                Top = 4
                Width = 53
                Height = 23
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 4
                ParentFont = False
                TabOrder = 0
                Text = 'edtE'
                Mascara = True
                Alignment = taLeftJustify
                TipoMascara = tmGERAL
                NrDecimal = 2
                Decimais = True
                Negativo = True
                Tamanho = 2
                DataField = 'esferico_oe'
                DataSource = dtmCadastroClientes.dsrReceitaOculos
              end
            end
          end
          object gbxAltura: TGroupBox
            Left = 479
            Top = 58
            Width = 60
            Height = 36
            Caption = 'ALTURA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            object edtAltura: TDBEditNumero
              Left = 2
              Top = 10
              Width = 55
              Height = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 3
              ParentFont = False
              TabOrder = 0
              Text = '1'
              Mascara = True
              Alignment = taLeftJustify
              TipoMascara = tmGERAL
              NrDecimal = 0
              Decimais = False
              Negativo = True
              Tamanho = 3
              DataField = 'altura'
              DataSource = dtmCadastroClientes.dsrReceitaOculos
            end
          end
          object gbxMedico: TGroupBox
            Left = 257
            Top = 222
            Width = 210
            Height = 30
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 11
            object lblMedico: TLabel
              Left = 4
              Top = 9
              Width = 39
              Height = 15
              Alignment = taRightJustify
              Caption = 'M'#233'dico'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
            end
            object edtMedico: TDBEditTexto
              Left = 56
              Top = 4
              Width = 151
              Height = 23
              DataField = 'medico'
              DataSource = dtmCadastroClientes.dsrReceitaOculos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 9
              ParentFont = False
              TabOrder = 0
              CharCasenoDefault = False
              Alignment = taLeftJustify
            end
          end
          object gbxCor: TGroupBox
            Left = 482
            Top = 222
            Width = 210
            Height = 30
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 13
            object lblCor: TLabel
              Left = 3
              Top = 9
              Width = 20
              Height = 15
              Caption = 'Cor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
            end
            object edtCor: TDBEditTexto
              Left = 50
              Top = 4
              Width = 157
              Height = 23
              DataField = 'cor'
              DataSource = dtmCadastroClientes.dsrReceitaOculos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 6
              ParentFont = False
              TabOrder = 0
              CharCasenoDefault = False
              Alignment = taLeftJustify
            end
          end
          object gbxEntrega: TGroupBox
            Left = 257
            Top = 199
            Width = 210
            Height = 30
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 10
            object lblEntrega: TLabel
              Left = 4
              Top = 9
              Width = 43
              Height = 15
              Alignment = taRightJustify
              Caption = 'Entrega'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
            end
            object edtEntrega: TDBEditTexto
              Left = 56
              Top = 4
              Width = 151
              Height = 23
              DataField = 'entrega'
              DataSource = dtmCadastroClientes.dsrReceitaOculos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 10
              ParentFont = False
              TabOrder = 0
              CharCasenoDefault = False
              Alignment = taLeftJustify
            end
          end
          object gbxAjuste: TGroupBox
            Left = 257
            Top = 176
            Width = 210
            Height = 30
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 9
            object lblAjuste: TLabel
              Left = 4
              Top = 9
              Width = 34
              Height = 15
              Alignment = taRightJustify
              Caption = 'Ajuste'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
            end
            object edtAjuste: TDBEditTexto
              Left = 56
              Top = 4
              Width = 151
              Height = 23
              DataField = 'ajuste'
              DataSource = dtmCadastroClientes.dsrReceitaOculos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 9
              ParentFont = False
              TabOrder = 0
              CharCasenoDefault = False
              Alignment = taLeftJustify
            end
          end
          object gbxMedida: TGroupBox
            Left = 257
            Top = 153
            Width = 210
            Height = 30
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 8
            object lblMedida: TLabel
              Left = 4
              Top = 9
              Width = 40
              Height = 15
              Alignment = taRightJustify
              Caption = 'Medida'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
            end
            object edtMedida: TDBEditTexto
              Left = 56
              Top = 5
              Width = 151
              Height = 23
              DataField = 'medida'
              DataSource = dtmCadastroClientes.dsrReceitaOculos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 9
              ParentFont = False
              TabOrder = 0
              CharCasenoDefault = False
              Alignment = taLeftJustify
            end
          end
          object Panel4: TPanel
            Left = 485
            Top = 152
            Width = 75
            Height = 12
            BevelOuter = bvNone
            Caption = ' TIPO DE LENTE '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 14
          end
          object gbxLente: TGroupBox
            Left = 482
            Top = 199
            Width = 210
            Height = 30
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 12
            object lblLente: TLabel
              Left = 3
              Top = 9
              Width = 31
              Height = 15
              Caption = 'Lente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
            end
            object edtLente: TDBEditTexto
              Left = 50
              Top = 4
              Width = 157
              Height = 23
              DataField = 'lente'
              DataSource = dtmCadastroClientes.dsrReceitaOculos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 8
              ParentFont = False
              TabOrder = 0
              CharCasenoDefault = False
              Alignment = taLeftJustify
            end
          end
        end
      end
      object tstContatos: TTabSheet
        Caption = '1&0 - Contatos'
        ImageIndex = 9
        object dbgContatos: TtecDBGrid
          Left = 0
          Top = 0
          Width = 584
          Height = 366
          Align = alClient
          DataSource = dtmCadastroClientes.dsrContatosClientes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Pitch = fpVariable
          TitleFont.Style = []
          OnDblClick = dbgContatosDblClick
          OnKeyDown = dbgContatosKeyDown
          RowWrap = 60
          Large = False
          DoubleRowColor = False
          TitleMinHeight = 100
          CellHeights = 100
          StrippedColor = 16054260
          CanDelete = False
          CanNotInsertFromGrid = False
          PostOnEnter = False
          PostOnSetUpDown = False
          DenySort = False
          DefaultRowHeight = 19
          ExibirNumerodaLinha = False
          NaoAtribuirDadosaTabelaaoDigitar = False
          ShowWhenFieldInvisible = False
          CanClickWhenEditing = False
          Columns = <
            item
              Expanded = False
              FieldName = 'contato'
              Title.Alignment = taCenter
              Title.Caption = 'NOME'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'Arial'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'foneddd'
              Title.Alignment = taCenter
              Title.Caption = 'DDD'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'Arial'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fonenumero'
              Title.Alignment = taCenter
              Title.Caption = 'TELEFONE'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'Arial'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'foneramal'
              Title.Alignment = taCenter
              Title.Caption = 'RAMAL'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'Arial'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'email'
              Title.Alignment = taCenter
              Title.Caption = 'E-MAIL'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'Arial'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 160
              Visible = True
            end>
        end
        object Panel2: TPanel
          Left = 756
          Top = 0
          Width = 25
          Height = 366
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object sbnExcluirContato: TSpeedButton
            Left = 2
            Top = 31
            Width = 23
            Height = 23
            Flat = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              A0A0A00000FF0000FF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDC0000FFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFFF
              FFFFDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFF808080DCDCDCDCDCDCDCDCDC
              0000FF0000FF0000FF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DC0000000000FFDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7FFF
              FFFFDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF808080DCDCDCDCDCDCDCDCDCDCDCDC
              0000FF0000FF0000FF0000FF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC0000
              000000FF808080DCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7FFF
              FFFFFFFFFFDCDCDCDCDCDCFFFFFF808080808080DCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDC0000FF0000FF0000FF0000FF000000DCDCDCDCDCDCDCDCDC0000000000
              FF808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F
              7F7FFFFFFFDCDCDCFFFFFF808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDC0000FF0000FF0000FF000000DCDCDCDCDCDC0000000000FF0000
              FF808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F
              7F7FFFFFFFFFFFFF808080808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDC0000FF0000FF0000FF0000000000000000FF0000FF8080
              80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F
              7F7F7F7F7F808080808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDC0000FF0000FF0000FF0000FF0000FF808080DCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F80
              80807F7F7F808080808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDC0000000000FF0000FF0000FF0000FFDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F
              7F7F7F7F7F7F7F7F808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDC0000000000000000FF0000FF0000FF000000DCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFF8080808080807F
              7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDC0000000000FF0000FF0000FF0000FF0000FF0000FF000000DCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFF80808080808080808080
              80807F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC0000FF
              0000FF0000FF0000FF0000FF0000FF808080DCDCDC7F7F7F0000FF000000DCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF808080808080808080808080808080DC
              DCDCDCDCDC7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDC0000FF
              0000FF0000FF0000FF0000FF808080DCDCDCDCDCDCDCDCDC8080800000FF0000
              00DCDCDCDCDCDCDCDCDCDCDCDC808080808080808080808080808080DCDCDCDC
              DCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCA0A0A0
              0000FF0000FF808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC0000
              FF0000FF000000DCDCDCDCDCDC808080808080808080808080DCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
            NumGlyphs = 2
            OnClick = sbnExcluirContatoClick
          end
          object sbnIncluirContato: TSpeedButton
            Left = 2
            Top = 7
            Width = 23
            Height = 23
            Flat = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDC7F7F7F7F7F7F7F7F7F8080808080807F7F7F7F7F7F7F7F7F7F7F
              7F808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDC0000000000000000000000000000000000000000000000000000000000
              00808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              00808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
              DCDCDCDCDCFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
              00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
              DCDC7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000DCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
              DCDC7F7F7FFFFFFFDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000DCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
              DCDC7F7F7FFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000DCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFFFFFFFFF
              FFFF7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDC000000000000000000000000000000000000DCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
            NumGlyphs = 2
            OnClick = sbnIncluirContatoClick
          end
        end
        object Panel3: TPanel
          Left = 584
          Top = 0
          Width = 172
          Height = 366
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 2
          object gbxCargo: TGroupBox
            Left = 0
            Top = 0
            Width = 172
            Height = 36
            Align = alTop
            Caption = 'CARGO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object dtxcargo: TtecDBText
              Left = 2
              Top = 10
              Width = 167
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'descricaocargo'
              DataSource = dtmCadastroClientes.dsrContatosClientes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Alignment = taLeftJustify
            end
          end
          object gbxObservacoes: TGroupBox
            Left = 0
            Top = 36
            Width = 172
            Height = 330
            Align = alClient
            Caption = 'OBSERVA'#199#213'ES'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object mmoContatoObservacoes: TtecDBMemo
              Left = 2
              Top = 14
              Width = 168
              Height = 314
              Align = alClient
              DataField = 'observacoes'
              DataSource = dtmCadastroClientes.dsrContatosClientes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
          end
        end
      end
    end
  end
end
