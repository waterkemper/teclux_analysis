inherited frmConsultaProdutosNotasFiscaisAnteriores: TfrmConsultaProdutosNotasFiscaisAnteriores
  Left = 384
  Top = 193
  Caption = 'Consulta de Produtos de Notas Fiscais de Entrada'
  ClientHeight = 521
  ClientWidth = 1068
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inline fraProdutosNotasFiscaisAnteriores1: TfraProdutosNotasFiscaisAnteriores
    Left = 0
    Top = 0
    Width = 1068
    Height = 521
    Align = alClient
    TabOrder = 0
    inherited dbgProdutosNotaFiscalAnteriores: TtecDBGrid
      Width = 1040
      Height = 521
      Columns = <
        item
          Expanded = False
          FieldName = 'filialentrada'
          Title.Caption = 'FILIAL'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 34
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fornecedor'
          Title.Alignment = taCenter
          Title.Caption = 'C'#211'DIGO'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 41
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nomefornecedor'
          Title.Alignment = taCenter
          Title.Caption = 'NOME DO FORNECEDOR'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 117
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'serie'
          Title.Alignment = taCenter
          Title.Caption = 'S'#201'RIE'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 31
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'numeronota'
          Title.Alignment = taCenter
          Title.Caption = 'N'#218'MERO'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'emissao'
          Title.Alignment = taCenter
          Title.Caption = 'EMISS'#195'O'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'data'
          Title.Caption = 'LAN'#199'AMENTO'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'quantidade'
          Title.Caption = 'QUANTIDADE'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'fatorconversao'
          Title.Alignment = taCenter
          Title.Caption = 'FATOR'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'qtdeestoque'
          Title.Caption = 'QTDE ESTOQUE'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ncm_cadastro'
          Title.Alignment = taCenter
          Title.Caption = 'NCM CADASTRO'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cst_produto'
          Title.Alignment = taCenter
          Title.Caption = 'CST PROD.'
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
          FieldName = 'csosn_produto'
          Title.Alignment = taCenter
          Title.Caption = 'CSOSN PROD.'
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
          FieldName = 'codigofiscalempresa'
          Title.Alignment = taCenter
          Title.Caption = 'CFOP'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 36
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ncm_nota'
          Title.Alignment = taCenter
          Title.Caption = 'NCM NF'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cst_notafiscal'
          Title.Alignment = taCenter
          Title.Caption = 'CST NF'
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
          FieldName = 'csosn_notafiscal'
          Title.Alignment = taCenter
          Title.Caption = 'CSOSN NF'
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
          FieldName = 'codigofiscalfornecedor'
          Title.Alignment = taCenter
          Title.Caption = 'CFOP FORN'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ncm_fornecedor'
          Title.Alignment = taCenter
          Title.Caption = 'NCM FORNEC.'
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
          FieldName = 'cst_fornecedor'
          Title.Alignment = taCenter
          Title.Caption = 'CST FORN.'
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
          FieldName = 'csosn_fornecedor'
          Title.Alignment = taCenter
          Title.Caption = 'CSOSN FORN.'
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
          FieldName = 'precounitario'
          Title.Alignment = taCenter
          Title.Caption = 'P.UNIT'#193'RIO'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'despesasacessorias'
          Title.Alignment = taCenter
          Title.Caption = 'DESP. ACESS.'
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
          FieldName = 'frete'
          Title.Alignment = taCenter
          Title.Caption = 'FRETE'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'iivalor'
          Title.Alignment = taCenter
          Title.Caption = 'IMP. IMPORT.'
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
          FieldName = 'seguro'
          Title.Alignment = taCenter
          Title.Caption = 'SEGURO'
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
          FieldName = 'acrescimo'
          Title.Alignment = taCenter
          Title.Caption = 'ACR'#201'SCIMO'
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
          FieldName = 'desconto'
          Title.Alignment = taCenter
          Title.Caption = 'DESCONTO'
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
          FieldName = 'aliquotaicms'
          Title.Alignment = taCenter
          Title.Caption = '%'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'icmsvalor'
          Title.Alignment = taCenter
          Title.Caption = 'ICMS NORMAL'
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
          FieldName = 'pcredsn'
          Title.Alignment = taCenter
          Title.Caption = '%'
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
          FieldName = 'vcredicmssn'
          Title.Alignment = taCenter
          Title.Caption = 'ICMS SIMPLES'
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
          FieldName = 'aliquotaicmsconhecimentofrete'
          Title.Alignment = taCenter
          Title.Caption = '%'
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
          FieldName = 'icmsconhecimentofrete'
          Title.Alignment = taCenter
          Title.Caption = 'ICMS FRETE'
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
          FieldName = 'fatorsubstituicao_custo'
          Title.Alignment = taCenter
          Title.Caption = 'MVA'
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
          FieldName = 'icmsvalorstcusto'
          Title.Alignment = taCenter
          Title.Caption = 'ICMS ST'
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
          FieldName = 'aliquotaipi'
          Title.Alignment = taCenter
          Title.Caption = '%'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 28
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valoripi'
          Title.Alignment = taCenter
          Title.Caption = 'IPI'
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
          FieldName = 'pisaliquota'
          Title.Alignment = taCenter
          Title.Caption = '%'
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
          FieldName = 'pisvalor'
          Title.Alignment = taCenter
          Title.Caption = 'PIS'
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
          FieldName = 'cofinsaliquota'
          Title.Alignment = taCenter
          Title.Caption = '%'
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
          FieldName = 'cofinsvalor'
          Title.Alignment = taCenter
          Title.Caption = 'COFINS'
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
          FieldName = 'precocusto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = 'CUSTO UNIT.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'custo_medio'
          Title.Alignment = taCenter
          Title.Caption = 'CUSTO M'#201'D.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descontoprecovenda'
          Title.Alignment = taCenter
          Title.Caption = 'DESC. VENDA'
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
          FieldName = 'custoparavenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = 'CUSTO VENDA'
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
          FieldName = 'markup'
          Title.Alignment = taCenter
          Title.Caption = '%'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valormarkup'
          Title.Alignment = taCenter
          Title.Caption = 'MARK-UP'
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
          FieldName = 'percentualreducaoicmsprecovenda'
          Title.Alignment = taCenter
          Title.Caption = '% RED.'
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
          FieldName = 'baseicmsparavenda'
          Title.Alignment = taCenter
          Title.Caption = 'BASE ICMS'
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
          FieldName = 'aliquotaicmsprecovenda'
          Title.Alignment = taCenter
          Title.Caption = '%'
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
          FieldName = 'icmsvalorprecovenda'
          Title.Alignment = taCenter
          Title.Caption = 'ICMS VENDA'
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
          FieldName = 'pisaliquotaprecovenda'
          Title.Alignment = taCenter
          Title.Caption = '%'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pisvalorprecovenda'
          Title.Alignment = taCenter
          Title.Caption = 'PIS VENDA'
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
          FieldName = 'cofinsaliquotaprecovenda'
          Title.Alignment = taCenter
          Title.Caption = '%'
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
          FieldName = 'cofinsvalorprecovenda'
          Title.Alignment = taCenter
          Title.Caption = 'COFINS VENDA'
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
          FieldName = 'arredondamento'
          Title.Alignment = taCenter
          Title.Caption = 'ARREDONDAMENTO'
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
          FieldName = 'precovenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = 'PRE'#199'O DE VENDA'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Visible = True
        end>
    end
    inherited pnlOpcoesProdutosBottom: TPanel
      Left = 1040
      Height = 521
    end
    inherited qryProdutosNotaFiscalAnteriores: TtecQuery
      Left = 952
    end
  end
end
