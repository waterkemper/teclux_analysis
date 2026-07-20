inherited dtmRelatorioLicitacoes: TdtmRelatorioLicitacoes
  OldCreateOrder = False
  Left = 418
  Top = 219
  Height = 515
  Width = 902
  object qryLicitacoesporProdutos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'IntervaloLicitacao'
        ParamType = ptUnknown
        Value = 'AND L.DATAVENDA >= '#39'2023-01-01'#39
      end
      item
        DataType = ftUnknown
        Name = 'SituacaoLicitacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaCondicionaldeClientes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaCondicionaldeVendedores'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CustoMaiorVenda'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select l.numero,'
      '       l.cliente,'
      '       situacao_licitacao(l.numero) as situacao_licitacao,'
      '       cl.nome as nomecliente,'
      '       l.datavenda,'
      '       l.vigencia,'
      '       p.codigovisual as produtovisual,'
      '       p.descricao as descricaoproduto,'
      '       lc.quantidade,'
      ''
      '       lc.quantidade -'
      
        '       (Coalesce(produtos_licitacoes_orcados(lc.licitacao, lc.pr' +
        'oduto, lc.numero),0) +'
      
        '        Coalesce(produtos_licitacoes_reservados(lc.licitacao, lc' +
        '.produto, lc.numero),0) +'
      
        '        Coalesce(produtos_licitacoes_faturados(lc.licitacao, lc.' +
        'produto, lc.numero),0) +'
      
        '        Coalesce(produtos_licitacoes_entregues(lc.licitacao, lc.' +
        'produto, lc.numero),0) -'
      
        '        Coalesce(produtos_licitacoes_devolvidos(lc.licitacao, lc' +
        '.produto, lc.numero),0) ) as SaldoPendente,'
      ''
      '        l.prazo,'
      ''
      '        lc.valoripi,'
      
        '       (lc.quantidade * lc.preco) + coalesce(lc.valoripi) as Tot' +
        'alProduto,'
      
        '       (lc.quantidade * coalesce(lc.customedio,0)) as customedio' +
        'total,'
      ''
      ''
      
        '        Selecionar_AliquotaIcms(f.estado           /*as EstadoOr' +
        'igem*/,'
      
        '                                cl.estado          /*as EstadoDe' +
        'stino*/,'
      
        '                                cl.pessoatipo      /*as TipoPess' +
        'oa*/,'
      
        '                                p.codigo           /*as produto*' +
        '/,'
      
        '                                false              /*as Aliquota' +
        'InternadoEstadodeDestino*/,'
      
        '                                f.contribicms      /*as pContrib' +
        'uinteOrigem*/,'
      
        '                                cl.contribicms     /*as pContrib' +
        'uinteDestino*/,'
      
        '                                cl.consumidorfinal /*as pVendaCo' +
        'nsumidorFinal*/) as AliquotaIcms'
      ''
      'from licitacoes l'
      '     join filiais f'
      '     on l.filialvenda = f.codigo'
      ''
      '     join usuarios u'
      '     on l.vendedor = u.codigo'
      ''
      '     join clientes cl'
      '     on l.cliente = cl.codigo'
      ''
      '     join vfornecedores vf'
      '     on l.cliente = vf.codigo'
      '     and vf.tipo = '#39'C'#39
      ''
      '     join licitacoesprodutos lc'
      '          join produtos p'
      '          on lc.produto = p.codigo'
      ''
      '     on lc.licitacao = l.numero'
      ''
      ''
      'where true'
      '%IntervaloLicitacao'
      '%SituacaoLicitacao'
      '%ListaCondicionaldeClientes'
      '%ListaCondicionaldeVendedores'
      '%CustoMaiorVenda'
      ''
      '/*'
      ':DataInicial'
      ':DataFinal'
      ''
      '*/'
      ''
      ''
      'order by l.datavenda, l.numero'
      '')
    RequestLive = False
    Left = 184
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DataInicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataFinal'
        ParamType = ptUnknown
      end>
    object qryLicitacoesporProdutosnumero: TIntegerField
      FieldName = 'numero'
      Required = True
    end
    object qryLicitacoesporProdutoscliente: TIntegerField
      FieldName = 'cliente'
    end
    object qryLicitacoesporProdutossituacao_licitacao: TStringField
      FieldName = 'situacao_licitacao'
      Size = 10
    end
    object qryLicitacoesporProdutosnomecliente: TStringField
      FieldName = 'nomecliente'
      Required = True
      Size = 60
    end
    object qryLicitacoesporProdutosdatavenda: TDateField
      Alignment = taCenter
      FieldName = 'datavenda'
      EditMask = '99/99/9999;1; '
    end
    object qryLicitacoesporProdutosvigencia: TDateField
      Alignment = taCenter
      FieldName = 'vigencia'
      EditMask = '99/99/9999;1; '
    end
    object qryLicitacoesporProdutosprodutovisual: TStringField
      FieldName = 'produtovisual'
      Required = True
      Size = 30
    end
    object qryLicitacoesporProdutosdescricaoproduto: TStringField
      FieldName = 'descricaoproduto'
      Required = True
      Size = 100
    end
    object qryLicitacoesporProdutosquantidade: TFloatField
      FieldName = 'quantidade'
      DisplayFormat = '0.00'
    end
    object qryLicitacoesporProdutossaldopendente: TFloatField
      FieldName = 'saldopendente'
      DisplayFormat = '0.00'
    end
    object qryLicitacoesporProdutosprazo: TIntegerField
      FieldName = 'prazo'
    end
    object qryLicitacoesporProdutostotalproduto: TFloatField
      FieldName = 'totalproduto'
      DisplayFormat = '0.00'
    end
    object qryLicitacoesporProdutoscustomediototal: TFloatField
      FieldName = 'customediototal'
      DisplayFormat = '0.00'
    end
    object qryLicitacoesporProdutosaliquotaicms: TFloatField
      FieldName = 'aliquotaicms'
      DisplayFormat = '0.00'
    end
    object qryLicitacoesporProdutosvaloripi: TCurrencyField
      FieldName = 'valoripi'
    end
  end
  object dsrLicitacoesporProdutos: TtecDataSource
    DataSet = qryLicitacoesporProdutos
    Left = 216
    Top = 48
  end
  object qryLicitacoesporNumero: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'IntervaloLicitacao'
        ParamType = ptUnknown
        Value = 'AND L.DATAVENDA >= '#39'2023-01-01'#39
      end
      item
        DataType = ftUnknown
        Name = 'SituacaoLicitacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaCondicionaldeClientes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaCondicionaldeVendedores'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CustoMaiorVenda'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select numero, cliente, nomecliente, datavenda, vigencia,'
      '       observacoes, prazo, situacao_licitacao,'
      '       sum(valoripi) as valoripi,'
      '       sum(TotalProduto) as TotalProduto,'
      '       sum(customediototal) as customediototal,'
      '       SUM(ValorImposto) as ValorImposto,'
      
        '       sum(TotalProduto-customediototal-ValorImposto)  as LucroL' +
        'iquido,'
      
        '       sum((TotalProduto-customediototal-ValorImposto) * 100) / ' +
        'sum(TotalProduto) as PercLucroLiquido'
      'from'
      '('
      'select sel.*,'
      '       TotalProduto *  AliquotaIcms / 100 as ValorImposto'
      'from'
      '('
      ''
      'select l.numero,'
      '       l.cliente,'
      '       situacao_licitacao(l.numero) as situacao_licitacao,'
      '       cl.nome as nomecliente,'
      '       l.datavenda,'
      '       l.vigencia,'
      '       l.observacoes,'
      '       p.codigovisual as produtovisual,'
      '       p.descricao as descricaoproduto,'
      '       lc.quantidade,'
      ''
      '       lc.quantidade -'
      
        '       (/*Nullif(produtos_licitacoes_orcados(lc.licitacao, lc.pr' +
        'oduto, lc.numero),0) +'
      
        '        Nullif(produtos_licitacoes_reservados(lc.licitacao, lc.p' +
        'roduto, lc.numero),0) +'
      
        '        Nullif(produtos_licitacoes_faturados(lc.licitacao, lc.pr' +
        'oduto, lc.numero),0) + */'
      
        '        produtos_licitacoes_entregues(lc.licitacao, lc.produto, ' +
        'lc.numero) /*+'
      
        '        produtos_licitacoes_devolvidos(lc.licitacao, lc.produto,' +
        ' lc.numero)*/ ) as SaldoPendente,'
      ''
      '        l.prazo,'
      ''
      '        lc.valoripi,'
      
        '       (lc.quantidade * lc.preco) + coalesce(lc.valoripi,0) as T' +
        'otalProduto,'
      
        '       (lc.quantidade * coalesce(lc.customedio,0)) as customedio' +
        'total,'
      ''
      ''
      
        '        /*1. O que falta entregar o c'#225'lculo '#233' feito pelo custome' +
        'dio atual'
      '        ((lc.quantidade -'
      ''
      '         (select sum(pdf.quantidade)'
      '                        from produtosdadosfiscais pdf'
      '                             join dadosfiscais df'
      '                                  join contratos ct'
      '                                   on ct.numero = df.contrato'
      '                             on pdf.dadofiscal = df.numero'
      '                        where ct.licitacao = l.numero'
      '                          and df.situacao = '#39'N'#39
      '                          and pdf.produto = p.codigo)) *'
      ''
      
        '        coalesce(nullif(customedio(p.codigo, cast(1 as smallint)' +
        '),0),'
      '          (select e.valorultimacompra'
      '           from estoques e'
      '           where e.produto = p.codigo'
      '             and e.filial = f.codigo ))) +'
      
        '        2. O restante '#233' pego m.valor/m.quantidade do movimento R' +
        'FV da sa'#237'da da nota fiscal'
      ''
      '         (select sum(abs(m.valor))'
      '                        from produtosdadosfiscais pdf'
      '                             join dadosfiscais df'
      '                                  join contratos ct'
      '                                   on ct.numero = df.contrato'
      '                             on pdf.dadofiscal = df.numero'
      ''
      '                             join movimentos m'
      '                             on m.dadofiscal = df.numero'
      '                             and m.produto  = pdf.produto'
      '                             and m.tipomovimento = '#39'RFV'#39
      '                             and m.filial = f.codigo'
      ''
      '                        where ct.licitacao = l.numero'
      '                          and df.situacao = '#39'N'#39
      '                          and pdf.produto = p.codigo)'
      ''
      ''
      '              as customediototal,'
      '              */'
      ''
      ''
      ''
      
        '        Selecionar_AliquotaIcms(f.estado           /*as EstadoOr' +
        'igem*/,'
      
        '                                cl.estado          /*as EstadoDe' +
        'stino*/,'
      
        '                                cl.pessoatipo      /*as TipoPess' +
        'oa*/,'
      
        '                                p.codigo           /*as produto*' +
        '/,'
      
        '                                false              /*as Aliquota' +
        'InternadoEstadodeDestino*/,'
      
        '                                f.contribicms      /*as pContrib' +
        'uinteOrigem*/,'
      
        '                                cl.contribicms     /*as pContrib' +
        'uinteDestino*/,'
      
        '                                cl.consumidorfinal /*as pVendaCo' +
        'nsumidorFinal*/) as AliquotaIcms'
      ''
      'from licitacoes l'
      '     join filiais f'
      '     on l.filialvenda = f.codigo'
      ''
      '     join usuarios u'
      '     on l.vendedor = u.codigo'
      ''
      '     join clientes cl'
      '     on l.cliente = cl.codigo'
      ''
      '     join vfornecedores vf'
      '     on l.cliente = vf.codigo'
      '     and vf.tipo = '#39'C'#39
      '     '
      ''
      '     join licitacoesprodutos lc'
      '          join produtos p'
      '          on lc.produto = p.codigo'
      ''
      '     on lc.licitacao = l.numero'
      ''
      ''
      'where true'
      '%IntervaloLicitacao'
      '%SituacaoLicitacao'
      '%ListaCondicionaldeClientes'
      '%ListaCondicionaldeVendedores'
      ''
      '%CustoMaiorVenda'
      ''
      '/*'
      ':DataInicial'
      ':DataFinal'
      ''
      '*/'
      ''
      ''
      'order by l.datavenda, l.numero'
      ')  as sel'
      ''
      ')  as sel'
      ''
      
        'group by numero, cliente, nomecliente, datavenda, vigencia, obse' +
        'rvacoes, prazo, situacao_licitacao;'
      '')
    RequestLive = False
    Left = 104
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DataInicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataFinal'
        ParamType = ptUnknown
      end>
    object qryLicitacoesporNumeronumero: TIntegerField
      FieldName = 'numero'
    end
    object qryLicitacoesporNumerocliente: TIntegerField
      FieldName = 'cliente'
    end
    object qryLicitacoesporNumeronomecliente: TStringField
      FieldName = 'nomecliente'
      Size = 60
    end
    object qryLicitacoesporNumerodatavenda: TDateField
      Alignment = taCenter
      FieldName = 'datavenda'
      EditMask = '99/99/9999;1; '
    end
    object qryLicitacoesporNumerovigencia: TDateField
      Alignment = taCenter
      FieldName = 'vigencia'
      EditMask = '99/99/9999;1; '
    end
    object qryLicitacoesporNumeroobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 500
    end
    object qryLicitacoesporNumeroprazo: TIntegerField
      FieldName = 'prazo'
    end
    object qryLicitacoesporNumerototalproduto: TFloatField
      FieldName = 'totalproduto'
      DisplayFormat = '0.00'
    end
    object qryLicitacoesporNumerocustomediototal: TFloatField
      FieldName = 'customediototal'
      DisplayFormat = '0.00'
    end
    object qryLicitacoesporNumerovalorimposto: TFloatField
      FieldName = 'valorimposto'
      DisplayFormat = '0.00'
    end
    object qryLicitacoesporNumerolucroliquido: TFloatField
      FieldName = 'lucroliquido'
      DisplayFormat = '0.00'
    end
    object qryLicitacoesporNumeroperclucroliquido: TFloatField
      FieldName = 'perclucroliquido'
      DisplayFormat = '0.00'
    end
    object qryLicitacoesporNumerosituacao_licitacao: TStringField
      FieldName = 'situacao_licitacao'
      Size = 10
    end
    object qryLicitacoesporNumerovaloripi: TCurrencyField
      FieldName = 'valoripi'
    end
  end
  object dsrLicitacoesporNumero: TtecDataSource
    DataSet = qryLicitacoesporNumero
    Left = 136
    Top = 232
  end
  object frxDBLicitacoesporProdutos: TfrxDBDataset
    UserName = 'frxDBLicitacoesporProdutos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'numero=numero'
      'cliente=cliente'
      'situacao_licitacao=situacao_licitacao'
      'nomecliente=nomecliente'
      'datavenda=datavenda'
      'vigencia=vigencia'
      'produtovisual=produtovisual'
      'descricaoproduto=descricaoproduto'
      'quantidade=quantidade'
      'saldopendente=saldopendente'
      'prazo=prazo'
      'totalproduto=totalproduto'
      'customediototal=customediototal'
      'aliquotaicms=aliquotaicms'
      'valoripi=valoripi')
    DataSet = qryLicitacoesporProdutos
    Left = 288
    Top = 104
  end
  object frxDBLicitacoesporProdutos_: TfrxDBDataset
    UserName = 'frxDBLicitacoesporProdutos_'
    CloseDataSource = False
    FieldAliases.Strings = (
      'numero=numero'
      'cliente=cliente'
      'situacao_licitacao=situacao_licitacao'
      'nomecliente=nomecliente'
      'datavenda=datavenda'
      'vigencia=vigencia'
      'produtovisual=produtovisual'
      'descricaoproduto=descricaoproduto'
      'quantidade=quantidade'
      'saldopendente=saldopendente'
      'prazo=prazo'
      'totalproduto=totalproduto'
      'customediototal=customediototal'
      'aliquotaicms=aliquotaicms'
      'valoripi=valoripi')
    DataSet = qryLicitacoesporProdutos
    Left = 288
    Top = 144
  end
  object frxRLicitacoesporProdutos: TfrxReport
    Version = '4.0.11'
    DataSet = frxDBLicitacoesporProdutos_
    DataSetName = 'frxDBLicitacoesporProdutos_'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45167.557598344900000000
    ReportOptions.LastChange = 45589.383926261570000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      ' vZebrar, vZebrar2 : boolean;'
      ''
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if vZebrar then'
      '  begin'
      '    if <CordoZebrado> <> null then'
      '      mmoZebrado.color := <CordoZebrado>;'
      '    vZebrar := false;'
      '  end'
      '  else'
      '  begin'
      '    mmoZebrado.color := clwhite;'
      '    vZebrar := true;'
      '  end;'
      ''
      'end;'
      ''
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxRLicitacoesporProdutosGetValue
    Left = 392
    Top = 72
    Datasets = <
      item
        DataSet = frxDBLicitacoesporProdutos
        DataSetName = 'frxDBLicitacoesporProdutos'
      end>
    Variables = <
      item
        Name = ' Relatorio'
        Value = Null
      end
      item
        Name = 'ENDERECO_BAIRRO'
        Value = Null
      end
      item
        Name = 'RAZAOFILIALBASE'
        Value = Null
      end
      item
        Name = 'CEP_CIDADE_UF'
        Value = Null
      end
      item
        Name = 'TITULO'
        Value = #39'RELAT'#211'RIO DE LICITA'#199#213'ES - ANAL'#205'TICO'#39
      end
      item
        Name = 'SUBTITULO'
        Value = #39'VENDAS ENTRE: 01/09/2023 E 30/09/2023'#39
      end
      item
        Name = 'OUTRAS'
        Value = #39'FILIAIS: 1,2,3,4,5,6,7,8,9,10 '#39
      end
      item
        Name = 'DATA'
        Value = Null
      end
      item
        Name = 'CordoZebrado'
        Value = Null
      end
      item
        Name = 'AgruparGrupoFilial'
        Value = 'False'
      end
      item
        Name = 'AgruparFilial'
        Value = 'True'
      end
      item
        Name = 'AgruparFornecedor'
        Value = Null
      end
      item
        Name = 'AgruparLocalizacao'
        Value = Null
      end
      item
        Name = 'AgruparClasseProduto'
        Value = Null
      end
      item
        Name = 'AgruparGrupoProduto'
        Value = Null
      end
      item
        Name = 'DATASITUACAO'
        Value = #39'28/02/2021'#39
      end
      item
        Name = 'QuebrarPaginaporCliente'
        Value = 'False'
      end
      item
        Name = 'Pagina1'
        Value = Null
      end
      item
        Name = 'Pagina2'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 11.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 5.000000000000000000
      object PageHeader1: TfrxPageHeader
        Height = 68.031540000000000000
        Top = 18.897650000000000000
        Width = 1043.150280000000000000
        object Memo6: TfrxMemoView
          Left = 986.457330000000000000
          Top = 18.897650000000000000
          Width = 52.913420000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Page]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo4: TfrxMemoView
          Left = 937.323440000000000000
          Top = 18.897650000000000000
          Width = 45.354360000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'P'#195#129'G.:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 937.323440000000000000
          Top = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'DATA:')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 986.457330000000000000
          Top = 3.779530000000000000
          Width = 52.913420000000000000
          Height = 11.338582680000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[Date]')
          ParentFont = False
          VAlign = vaCenter
        end
        object mmoTitulo: TfrxMemoView
          ShiftMode = smDontShift
          Left = 427.086890000000000000
          Top = 3.779530000000000000
          Width = 498.897960000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[TITULO]')
          ParentFont = False
        end
        object fmvRua_T: TfrxMemoView
          ShiftMode = smDontShift
          Left = 124.724490000000000000
          Top = 3.779530000000000000
          Width = 294.803340000000000000
          Height = 11.338590000000000000
          StretchMode = smActualHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[RAZAOFILIALBASE]'
            '[ENDERECO_BAIRRO]'
            '[CEP_CIDADE_UF]')
          ParentFont = False
        end
        object fpvLogo: TfrxPictureView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 120.944960000000000000
          Height = 45.354360000000000000
          Picture.Data = {
            07544269746D617016110000424D161100000000000036000000280000004800
            0000140000000100180000000000E0100000C40E0000C40E0000000000000000
            0000FFFFFFFFFFFFFCFCFCCECDCDFFFFFFE3E3E3CFCFD0FFFFFFF1F1F1CDCDCD
            FAFAFADDDDDDFFFFFFE4E3E3FFFFFFE4E4E4DBDCDCFFFFFFECECECFBFBFBFCFC
            FCCECECDF9F9F9FFFFFFB5B5B58D8D8E9E9E9DF8F8F8F4F4F4FAFAFAD0D0D0D3
            D3D4FEFEFEFFFFFFFFFFFFD7D7D8DBDADAFDFDFDF2F2F2DDDDDDFEFEFEE9E9E9
            FFFFFFFEFEFECFCFD0CFCFCFFAFAFAF0F0F1FAFAFADADADACECECEEEEEEEFFFF
            FFE7E7E7ECECECFEFEFED0D0D1E9E9E9F1F1F1FBFBFBE1E1E1FBFBFBF4F4F4FA
            FAFACFCFCFD4D4D5FFFFFFCECECECECECEFAFAFAFFFFFFFFFFFFFFFFFFFFFFFF
            A9A8A8D2D2D2DCDCDC999999DFDFDFF7F7F7585859F1F1F1FDFDFD3C3A3AFFFF
            FF545453ECECEC969696C7C7C7B2B2B2999A9AEBEBEB424140EDEDED414141FA
            FAF9585757E7E7E7868686D9D9D9C0C0C06F6F6FDDDDDD696969F9F9F9FFFFFF
            929394D0D0D0E7E7E7EFEFEFB3B3B23E3E3FF9F9F97B7B7AFFFFFFFFFFFFE0E0
            E0C7C7C68C8C8CAFAEAEDFDFDFECECECD8D7D73F3F3FFEFEFE4C4D4EF9F9F946
            4646DFDFDFF1F1F1A8A7A7E7E7E7484747DEDEDEBCBCBC545352E1E1E15A5A5A
            FFFFFFE0E0E0D3D3D37E7D7EFFFFFFFFFFFFFFFFFFFFFFFFABABABE2E2E1DADA
            DA7A7A79B9B9B9F6F6F668686AFEFEFEFFFFFF3E3D3DFEFEFE565658E8E8E8B0
            B0AFD8D8D8A5A5A4999A9AEBEBEB403F3EFCFCFB464646F8F8F8616161F2F2F2
            868686D9D9D9C0C0C0F3F3F3B3B3B3484949FAFAFAFFFFFF8E8F90AAAAA9C9C9
            C8EFEFEFB7B7B73E4043F1F1F1848485FFFFFFF9F9F94D4D4DC5C5C5F6F6F6B1
            B0B0DFDFDF4B4B4DC3C3C3E4E4E4FDFDFD555656FEFEFE40403FB9B9B9E1E1E1
            A8A8A8E6E6E64B4A4ADADADAC0C1C2F2F2F2B3B3B33F3F3FFFFFFF404040C4C4
            C4F5F5F5FFFFFFFFFFFFFFFFFFFFFFFF7474749C9B9AFFFFFFE2E2E2AFAFB0FE
            FEFEF0F0F0AEAEADF5F6F6C0BFBEB3B3B2FCFCFCFFFFFFD7D7D8C6C6C6FFFFFF
            989999EAEBEBFCFCFCAFAFAFF6F6F6FFFFFFEDEDEDB0B0AFE1E1E0F0F0F0E7E7
            E7D9D9D9AFAEAEDCDDDDFFFFFFFFFFFFFFFFFFC9C9C9C2C2C2FCFCFCB0B0AFB7
            B7B7B7B6B5FCFCFCFFFFFFFFFFFFD6D7D7AEAEADE7E7E5E0E0E0F2F2F2F2F2F2
            B0AFAFC2C2C2E6E6E63B3A3ADDDEDEFFFFFFB6B6B6DDDDDDE9E9E9B0AFAFB7B7
            B7BEBEBEFFFFFFD1D1D1AFAEAEE0E0E0FFFFFFDADADAAFAEAEE1E1E1FFFFFFFF
            FFFFFFFFFFFFFFFFEAEAEAF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9FAFAF9FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F3DDDAB6ECE9C4ECE9C4FD
            FDF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEAF7F7F7FFFFFFFFFFFFFFFFFFFFFF
            FFD6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFEFEFECDCDCEB2B2B1ADAEB0BABCBDFFFFFFFFFFFFFFFFFFF8F8F9CACB
            CCB3B4B4ADAEB0ADAEB0ADAEB0C6C7C8FFFFFFFFFFFFFFFFFFFEFEFED1D2D3B7
            B7B7B6B7B8FFFFFFFFFFFFFCFCF6ACA205ADA400ADA400F6F5E5FFFFFFFFFFFF
            EAE7BFE3DFA6E3DFA6E3DFA6E3DFA6E3DFA6E3DFA6E3DFA6E5E1AEECE9C5FCFC
            F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDECEBC6E4E0ABECE9C3FDFCF9FF
            FFFFFFFFFFFFFFFFFFFFFFFEFEFCE6E3B1E6E3B1EDEAC7FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFF7F6E6E8E7BAE6E3B1E6E3B1FFFFFFFFFFFFF3F3F41B1E231619
            20171A20171A203F4045FFFFFFFDFDFD8183850F1218161920171A20171A2017
            1A20171A205C5D61FFFFFFFFFFFF9FA0A10F1218161920171A20313337FFFFFF
            FFFFFFFCFCF6ACA205ADA400ADA400F6F5E5FFFFFFFFFFFFC2BA43ADA400ADA4
            00ADA400ADA400ADA400ADA400ADA400ADA400ADA400ABA104F9F8EFFFFFFFFF
            FFFFFFFEFCCDC869ACA104ADA400ADA400ADA400ACA103C8C156FEFEFBFFFFFF
            FFFFFFFAFAEFABA100ADA400C2BA45FFFFFFFFFFFFFFFFFFFFFFFFC1B944ACA3
            00ADA400ADA400ADA400FFFFFFFFFFFF838586171A20181B2111151B3C3E4160
            6265FFFFFF71737616191F181B210F13193034383D3F443D40443D4044797A7B
            FFFFFFBEBFC113161C181B2114181D1C20244D4F4CEEECCBEEECCBEDEAC7BCB5
            36BCB635BCB635E5E2B0E8E6BBE8E6BBC8C45ABDB63FBDB63FBDB63FBDB63FBD
            B63FBDB63FBDB640BBB438ADA400ADA400B9AF26FFFFFFFEFEFDBCB334ADA400
            ADA400ABA101AEA404ABA101ADA400ADA400B7AE26FEFEFAFFFFFFFAFAEFABA1
            00ADA400C2BA45FFFFFFFFFFFFFFFFFFF4F1DCACA300ADA400ADA400B0A608B1
            A811FFFFFFFFFFFF35383C181B2111151AE8E8E8FFFFFFFFFFFFF7F7F70E1217
            181B211C1F24F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD1F2227181B
            2115181EB6B7B9FFFFFFF2EFD4ACA300ADA400AFA409FEFDFAFFFFFFFFFFFFB1
            A810ADA400ADA400E5E2AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFB0A611ADA400AEA504FDFDF8D3CD78ACA300ADA400DCD791FFFFFFFFFF
            FFFFFFFFDFDC9EACA202ADA400CAC35BFFFFFFFAFAEFABA100ADA400C2BA45FF
            FFFFFFFFFFFFFFFFD4D07BADA400ADA400D3CD77FFFFFFFFFFFFFFFFFFFFFFFF
            282A2C181B2112151BF0F1F1FFFFFFFFFFFFB6B7B8181B21181B212F32368081
            857F80857F80857F80857F8085A6A7A8E6E6E613161C181B2124272CFFFFFFFF
            FFFFF2EFD4ACA300ADA400B0A709FEFDFAFFFFFFFFFFFFB1A810ADA400ADA400
            E5E2AFFFFFFFFFFFFFFEFEFEFDFDFBFBFAF3FBFAF3F9F9F0E9E6BCADA403ADA4
            00B0A707FEFDF9ACA202ADA400CDC767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4
            CF7BADA400ABA100FFFFFFFAFAEFABA100ADA400C2BA45FFFFFFFFFFFFFFFFFF
            CEC763ADA400ADA400E4E1ABFFFFFFFFFFFFFFFFFFFFFFFF292C31181B211216
            1BF1F1F2FFFFFFFFFFFF9A9C9E181B21181B21181B21181B21181B21181B2118
            1B21181B215D5E62DBDCDC11141A181B21494B4EFFFFFFFFFFFFF3F2DBB9B02A
            B9B02BBAB230D7D7D7D7D7D7D7D7D7BDB53EBEB53BBEB53BEBE8BEFFFFFFECE9
            C5ADA307ACA200ADA400ADA400ADA400ADA400ADA400ADA400CCC661FFFFFFAB
            A100ADA400EEECC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F5E5ACA300ADA400
            FBFAF2FAFAEFABA100ADA400C2BA45FFFFFFFFFFFFFFFFFFCEC762ADA400ADA4
            00E7E4B5FFFFFFFFFFFFFFFFFFFFFFFF292C31181B2112161BF1F1F2FFFFFFFF
            FFFFABABAB181B21181B21171A2014171C14171C14171C14171C14171C5C5E62
            E2E3E313161C181B21373A3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7171A
            1F13161B13161BE7E8EAFFFFFFFFFFFFFFFFFFFFFFFEA99E02ADA400ADA400B1
            A610B3A918B3A919B3A91ABBB32EE5E2AFFFFFFFFFFFFFABA100ADA400E5E1AD
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEBCAADA400ABA000FFFFFEFAFAEFABA1
            00ADA400C2BA45FFFFFFFFFFFFFFFFFFCEC762ADA400ADA400E7E4B5FFFFFFFF
            FFFFFFFFFFFFFFFF292C31181B2112161BF1F1F2FFFFFFFFFFFFDFDFDF14171D
            181B213C3E42F1F1F2F0F0F1F0F0F1F0F0F1F0F0F1F5F5F5F8F8F8171A1F181B
            210C0F15FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7171A1F181B21181B21E7
            E8E9FFFFFFFFFFFFFFFFFFF3F1D7ADA400ADA400B8B023FEFEFDFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3AA15ADA400B8B023FEFEFBFFFFFFFFFF
            FFFFFFFFFFFFFFBCB330ADA400AFA405FFFFFFFAFAEFABA100ADA400C2BA45FF
            FFFFFFFFFFFFFFFFCEC762ADA400ADA400E7E4B5FFFFFFFFFFFFEEEEEEE8E8E8
            272A2F181B2113171CDFDFDFE8E8E8ECECECFFFFFF111319181B21171A20ADAE
            B0E2E2E3E8E8E8E8E8E8E8E8E8EFEFEFFFFFFF4D4F52181B21181B2147494ECF
            D0D1E3E3E4E4E4E5E4E4E5DEDFDF27292D272B2F272B2FDADADAE6E7E7E6E7E7
            F5F5F5F5F3E0ADA400ADA400B0A70FF1EFD4F2F0D6F2F0D6F1F0D4F1F0D4F1F0
            D4F7F5E5FFFFFFF1EFD3ACA202ADA400AEA503DED999EDEAC5E1DEA1B0A70AAD
            A400ACA300E8E5B7F1EFD4EEEDCCACA200ADA400BFB73BF1EFD4F1EFD4FAF9EE
            CEC762ADA400ADA400DDD996F1EFD4F1EFD4595B5E15181E181B21181B21181B
            2115181E15181E3D3E43FFFFFFC7C7C90E1117181B2115191E15181E15181E15
            181E15181E5B5C5FFFFFFFF0F0F10A0E13181B21181B2115181E15181E15181E
            15181E16191EFAFAFAFFFFFFFFFFFF25292D15181E15181E9D9EA0FFFFFFABA0
            00ADA400ADA400ACA300ACA300ACA300ACA300ACA300ACA300CAC55CFFFFFFFF
            FFFFE4E1ADABA200ADA400ADA400ACA300ADA400ADA400ABA200DEDA99D2CD73
            ACA300ACA300ADA400ADA400ADA400ACA300ACA300E0DD9ECEC762ADA400ADA4
            00ADA400ACA300ACA3005A5D6015181D181B21181B21181B2116191E15181D3E
            4044FFFFFFFFFFFFE0E0E1494C4F212429171A1F15181D15181D15181D5C5F62
            FFFFFFFFFFFFF0F1F16B6D70282C301B1E2215181D15181D15181D161A1FF9F9
            F9FFFFFFFFFFFF272B2F181B21181B219E9FA2FFFFFFF9F9EDBEB83DAFA60BAD
            A403ADA403ADA403ADA403ADA403ADA403CBC55EFFFFFFFFFFFFFFFFFFFAF9EF
            CDC865B5AB1BAEA406B3AA18CBC562F9F7E9FFFFFFD2CD75AFA605AFA605ADA4
            00ADA400ADA400AFA605AFA605E0DCA0CEC762ADA400ADA400AEA502AFA605AF
            A605FDFDFDFCFCFC292C31181B2112161BF0F0F0FCFCFCFDFDFDFFFFFFFFFFFF
            FFFFFFFFFFFFFEFEFEFCFCFCFCFCFCFCFCFCFCFCFCFDFDFDFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFDFDFDFCFCFCFCFCFCFCFCFCFCFCFCFFFFFFFFFFFFFFFFFF2A
            2C2F15191E15191EA0A0A0FFFFFFFFFFFFFFFFFFFEFEFDFEFEFCFEFEFCFEFEFC
            FEFEFCFEFEFCFEFEFCFEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
            FDFFFFFEFFFFFFFFFFFFFFFFFFFFFEFEFEFEFDFBFBF3ABA100ADA400BEB639FE
            FEFDFEFEFDFFFFFECEC762ADA400ADA400E6E3B3FEFEFDFEFEFDFFFFFFFFFFFF
            292C31181B2112161BF1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFDFDF8AAA000ADA400ADA400C4BC4BC7C152ECE9C1
            CEC762ADA400ADA400E7E4B5FFFFFFFFFFFFFFFFFFFFFFFF292C31181B211216
            1BF1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFBFB740ACA200ADA400ADA400ADA400E2DEA3CEC762ADA400ADA4
            00E7E4B5FFFFFFFFFFFFFFFFFFFFFFFF67696B5A5C60585A5EF5F5F5FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
            FCE6E3B1CBC55DC5C34EC5C34EEAE7BEDDD893C5C34EC5C34EEEECCAFFFFFFFF
            FFFF}
        end
        object Memo71: TfrxMemoView
          Left = 427.086890000000000000
          Top = 26.456710000000000000
          Width = 498.897960000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUBTITULO]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          ShiftMode = smDontShift
          Top = 41.574830000000000000
          Width = 49.133890000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'LICI'
            'TA'#195#8225#195#402'O')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo57: TfrxMemoView
          ShiftMode = smDontShift
          Left = 68.031540000000000000
          Top = 41.574830000000000000
          Width = 49.133890000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'CLIENTE')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          ShiftMode = smDontShift
          Left = 117.165430000000000000
          Top = 41.574830000000000000
          Width = 173.858380000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'NOME DO CLIENTE')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo62: TfrxMemoView
          ShiftMode = smDontShift
          Left = 291.023810000000000000
          Top = 41.574830000000000000
          Width = 52.913420000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'DATA')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo64: TfrxMemoView
          ShiftMode = smDontShift
          Left = 343.937230000000000000
          Top = 41.574830000000000000
          Width = 60.472480000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'VALIDADE')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          ShiftMode = smDontShift
          Left = 404.409710000000000000
          Top = 41.574830000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'ITEM')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo68: TfrxMemoView
          ShiftMode = smDontShift
          Left = 480.000310000000000000
          Top = 41.574830000000000000
          Width = 241.889920000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'DESCRI'#195#8225#195#402'O')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo70: TfrxMemoView
          ShiftMode = smDontShift
          Left = 721.890230000000000000
          Top = 41.574830000000000000
          Width = 30.236240000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'QTDE')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo73: TfrxMemoView
          ShiftMode = smDontShift
          Left = 752.126470000000000000
          Top = 41.574830000000000000
          Width = 34.015770000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'PEN'
            'DENTE')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          ShiftMode = smDontShift
          Left = 786.142240000000000000
          Top = 41.574830000000000000
          Width = 37.795300000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'PRAZO')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo77: TfrxMemoView
          ShiftMode = smDontShift
          Left = 873.071430000000000000
          Top = 41.574830000000000000
          Width = 56.692950000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'TOTAL')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo78: TfrxMemoView
          ShiftMode = smDontShift
          Left = 929.764380000000000000
          Top = 41.574830000000000000
          Width = 64.252010000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'CUSTO '
            'TOTAL')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo80: TfrxMemoView
          ShiftMode = smDontShift
          Left = 994.016390000000000000
          Top = 41.574830000000000000
          Width = 45.354360000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '%'
            'IMPOSTO')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          ShiftMode = smDontShift
          Left = 49.133890000000000000
          Top = 41.574830000000000000
          Width = 18.897650000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'SIT.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo82: TfrxMemoView
          ShiftMode = smDontShift
          Left = 823.937540000000000000
          Top = 41.574830000000000000
          Width = 49.133890000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'VALOR IPI')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 15.118120000000000000
        Top = 147.401670000000000000
        Width = 1043.150280000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        AllowSplit = True
        DataSet = frxDBLicitacoesporProdutos
        DataSetName = 'frxDBLicitacoesporProdutos'
        RowCount = 0
        Stretched = True
        object mmoZebrado: TfrxMemoView
          Align = baClient
          Width = 1043.150280000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          DataField = 'numero'
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBLicitacoesporProdutos."numero"]')
          ParentFont = False
          SuppressRepeated = True
        end
        object Memo58: TfrxMemoView
          Left = 68.031540000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          DataField = 'cliente'
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBLicitacoesporProdutos."cliente"]')
          ParentFont = False
          SuppressRepeated = True
        end
        object Memo60: TfrxMemoView
          Left = 117.165430000000000000
          Width = 173.858380000000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
          DataField = 'nomecliente'
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBLicitacoesporProdutos."nomecliente"]')
          ParentFont = False
          SuppressRepeated = True
        end
        object Memo61: TfrxMemoView
          Left = 291.023810000000000000
          Width = 52.913420000000000000
          Height = 15.118110240000000000
          DataField = 'datavenda'
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBLicitacoesporProdutos."datavenda"]')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          Left = 343.937230000000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBLicitacoesporProdutos."vigencia"]')
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          Left = 404.409710000000000000
          Width = 75.590600000000000000
          Height = 15.118110240000000000
          DataField = 'produtovisual'
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBLicitacoesporProdutos."produtovisual"]')
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          Left = 480.000310000000000000
          Width = 241.889920000000000000
          Height = 15.118110240000000000
          StretchMode = smActualHeight
          DataField = 'descricaoproduto'
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBLicitacoesporProdutos."descricaoproduto"]')
          ParentFont = False
        end
        object Memo69: TfrxMemoView
          Left = 718.110700000000000000
          Width = 34.015770000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBLicitacoesporProdutos."quantidade"]')
          ParentFont = False
        end
        object Memo72: TfrxMemoView
          Left = 748.346940000000000000
          Width = 37.795300000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBLicitacoesporProdutos."saldopendente"]')
          ParentFont = False
        end
        object Memo74: TfrxMemoView
          Left = 786.142240000000000000
          Width = 37.795300000000000000
          Height = 15.118110240000000000
          DataField = 'prazo'
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBLicitacoesporProdutos."prazo"]')
          ParentFont = False
        end
        object Memo76: TfrxMemoView
          Left = 861.732840000000000000
          Width = 68.031540000000000000
          Height = 15.118110240000000000
          DataField = 'totalproduto'
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBLicitacoesporProdutos."totalproduto"]')
          ParentFont = False
        end
        object Memo79: TfrxMemoView
          Left = 929.764380000000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBLicitacoesporProdutos."customediototal"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 978.898270000000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          DataField = 'aliquotaicms'
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBLicitacoesporProdutos."aliquotaicms"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 49.133890000000000000
          Width = 18.897650000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[Copy(<frxDBLicitacoesporProdutos."situacao_licitacao">,1,1)]')
          ParentFont = False
        end
        object Memo83: TfrxMemoView
          Left = 805.039890000000000000
          Width = 68.031540000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBLicitacoesporProdutos."valoripi"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 15.118120000000000000
        Top = 264.567100000000000000
        Width = 1043.150280000000000000
        object Memo21: TfrxMemoView
          Left = 3.779530000000000000
          Width = 718.110700000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'hh:mm'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '[formatdatetime('#39'dd/mm/yyyy'#39', <date>)] [formatdatetime('#39'hh:mm'#39', ' +
              '<time>)] ['#39'TecSoft'#39']')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 18.897650000000000000
        Top = 222.992270000000000000
        Width = 1043.150280000000000000
        object Memo1: TfrxMemoView
          Left = 687.874460000000000000
          Top = 3.779530000000000000
          Width = 64.252010000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBLicitacoesporProdutos."quantidade">,MasterData1)]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 721.890230000000000000
          Top = 3.779530000000000000
          Width = 64.252010000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBLicitacoesporProdutos."saldopendente">,MasterData1)]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 869.291900000000000000
          Top = 3.779530000000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBLicitacoesporProdutos."totalproduto">,MasterData1)]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 922.205320000000000000
          Top = 3.779530000000000000
          Width = 71.811070000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[SUM(<frxDBLicitacoesporProdutos."customediototal">,MasterData1)' +
              ']')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 517.795610000000000000
          Top = 3.779530000000000000
          Width = 64.252010000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'TOTAIS')
          ParentFont = False
        end
        object Memo84: TfrxMemoView
          Left = 812.598950000000000000
          Top = 3.779530000000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBLicitacoesporProdutos."valoripi">,MasterData1)]')
          ParentFont = False
        end
      end
    end
    object Page2: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 5.000000000000000000
      object PageHeader2: TfrxPageHeader
        Height = 68.031540000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo10: TfrxMemoView
          Left = 986.457330000000000000
          Top = 18.897650000000000000
          Width = 52.913420000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Page]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo11: TfrxMemoView
          Left = 937.323440000000000000
          Top = 18.897650000000000000
          Width = 45.354360000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'P'#195#129'G.:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 937.323440000000000000
          Top = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'DATA:')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 986.457330000000000000
          Top = 3.779530000000000000
          Width = 52.913420000000000000
          Height = 11.338582680000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[Date]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          ShiftMode = smDontShift
          Left = 427.086890000000000000
          Top = 3.779530000000000000
          Width = 498.897960000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'RESUMO [TITULO]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          ShiftMode = smDontShift
          Left = 124.724490000000000000
          Top = 3.779530000000000000
          Width = 294.803340000000000000
          Height = 11.338590000000000000
          StretchMode = smActualHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[RAZAOFILIALBASE]'
            '[ENDERECO_BAIRRO]'
            '[CEP_CIDADE_UF]')
          ParentFont = False
        end
        object fpvLogo2: TfrxPictureView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 120.944960000000000000
          Height = 45.354360000000000000
          Picture.Data = {
            07544269746D617016110000424D161100000000000036000000280000004800
            0000140000000100180000000000E0100000C40E0000C40E0000000000000000
            0000FFFFFFFFFFFFFCFCFCCECDCDFFFFFFE3E3E3CFCFD0FFFFFFF1F1F1CDCDCD
            FAFAFADDDDDDFFFFFFE4E3E3FFFFFFE4E4E4DBDCDCFFFFFFECECECFBFBFBFCFC
            FCCECECDF9F9F9FFFFFFB5B5B58D8D8E9E9E9DF8F8F8F4F4F4FAFAFAD0D0D0D3
            D3D4FEFEFEFFFFFFFFFFFFD7D7D8DBDADAFDFDFDF2F2F2DDDDDDFEFEFEE9E9E9
            FFFFFFFEFEFECFCFD0CFCFCFFAFAFAF0F0F1FAFAFADADADACECECEEEEEEEFFFF
            FFE7E7E7ECECECFEFEFED0D0D1E9E9E9F1F1F1FBFBFBE1E1E1FBFBFBF4F4F4FA
            FAFACFCFCFD4D4D5FFFFFFCECECECECECEFAFAFAFFFFFFFFFFFFFFFFFFFFFFFF
            A9A8A8D2D2D2DCDCDC999999DFDFDFF7F7F7585859F1F1F1FDFDFD3C3A3AFFFF
            FF545453ECECEC969696C7C7C7B2B2B2999A9AEBEBEB424140EDEDED414141FA
            FAF9585757E7E7E7868686D9D9D9C0C0C06F6F6FDDDDDD696969F9F9F9FFFFFF
            929394D0D0D0E7E7E7EFEFEFB3B3B23E3E3FF9F9F97B7B7AFFFFFFFFFFFFE0E0
            E0C7C7C68C8C8CAFAEAEDFDFDFECECECD8D7D73F3F3FFEFEFE4C4D4EF9F9F946
            4646DFDFDFF1F1F1A8A7A7E7E7E7484747DEDEDEBCBCBC545352E1E1E15A5A5A
            FFFFFFE0E0E0D3D3D37E7D7EFFFFFFFFFFFFFFFFFFFFFFFFABABABE2E2E1DADA
            DA7A7A79B9B9B9F6F6F668686AFEFEFEFFFFFF3E3D3DFEFEFE565658E8E8E8B0
            B0AFD8D8D8A5A5A4999A9AEBEBEB403F3EFCFCFB464646F8F8F8616161F2F2F2
            868686D9D9D9C0C0C0F3F3F3B3B3B3484949FAFAFAFFFFFF8E8F90AAAAA9C9C9
            C8EFEFEFB7B7B73E4043F1F1F1848485FFFFFFF9F9F94D4D4DC5C5C5F6F6F6B1
            B0B0DFDFDF4B4B4DC3C3C3E4E4E4FDFDFD555656FEFEFE40403FB9B9B9E1E1E1
            A8A8A8E6E6E64B4A4ADADADAC0C1C2F2F2F2B3B3B33F3F3FFFFFFF404040C4C4
            C4F5F5F5FFFFFFFFFFFFFFFFFFFFFFFF7474749C9B9AFFFFFFE2E2E2AFAFB0FE
            FEFEF0F0F0AEAEADF5F6F6C0BFBEB3B3B2FCFCFCFFFFFFD7D7D8C6C6C6FFFFFF
            989999EAEBEBFCFCFCAFAFAFF6F6F6FFFFFFEDEDEDB0B0AFE1E1E0F0F0F0E7E7
            E7D9D9D9AFAEAEDCDDDDFFFFFFFFFFFFFFFFFFC9C9C9C2C2C2FCFCFCB0B0AFB7
            B7B7B7B6B5FCFCFCFFFFFFFFFFFFD6D7D7AEAEADE7E7E5E0E0E0F2F2F2F2F2F2
            B0AFAFC2C2C2E6E6E63B3A3ADDDEDEFFFFFFB6B6B6DDDDDDE9E9E9B0AFAFB7B7
            B7BEBEBEFFFFFFD1D1D1AFAEAEE0E0E0FFFFFFDADADAAFAEAEE1E1E1FFFFFFFF
            FFFFFFFFFFFFFFFFEAEAEAF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9FAFAF9FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F3DDDAB6ECE9C4ECE9C4FD
            FDF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEAF7F7F7FFFFFFFFFFFFFFFFFFFFFF
            FFD6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFEFEFECDCDCEB2B2B1ADAEB0BABCBDFFFFFFFFFFFFFFFFFFF8F8F9CACB
            CCB3B4B4ADAEB0ADAEB0ADAEB0C6C7C8FFFFFFFFFFFFFFFFFFFEFEFED1D2D3B7
            B7B7B6B7B8FFFFFFFFFFFFFCFCF6ACA205ADA400ADA400F6F5E5FFFFFFFFFFFF
            EAE7BFE3DFA6E3DFA6E3DFA6E3DFA6E3DFA6E3DFA6E3DFA6E5E1AEECE9C5FCFC
            F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDECEBC6E4E0ABECE9C3FDFCF9FF
            FFFFFFFFFFFFFFFFFFFFFFFEFEFCE6E3B1E6E3B1EDEAC7FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFF7F6E6E8E7BAE6E3B1E6E3B1FFFFFFFFFFFFF3F3F41B1E231619
            20171A20171A203F4045FFFFFFFDFDFD8183850F1218161920171A20171A2017
            1A20171A205C5D61FFFFFFFFFFFF9FA0A10F1218161920171A20313337FFFFFF
            FFFFFFFCFCF6ACA205ADA400ADA400F6F5E5FFFFFFFFFFFFC2BA43ADA400ADA4
            00ADA400ADA400ADA400ADA400ADA400ADA400ADA400ABA104F9F8EFFFFFFFFF
            FFFFFFFEFCCDC869ACA104ADA400ADA400ADA400ACA103C8C156FEFEFBFFFFFF
            FFFFFFFAFAEFABA100ADA400C2BA45FFFFFFFFFFFFFFFFFFFFFFFFC1B944ACA3
            00ADA400ADA400ADA400FFFFFFFFFFFF838586171A20181B2111151B3C3E4160
            6265FFFFFF71737616191F181B210F13193034383D3F443D40443D4044797A7B
            FFFFFFBEBFC113161C181B2114181D1C20244D4F4CEEECCBEEECCBEDEAC7BCB5
            36BCB635BCB635E5E2B0E8E6BBE8E6BBC8C45ABDB63FBDB63FBDB63FBDB63FBD
            B63FBDB63FBDB640BBB438ADA400ADA400B9AF26FFFFFFFEFEFDBCB334ADA400
            ADA400ABA101AEA404ABA101ADA400ADA400B7AE26FEFEFAFFFFFFFAFAEFABA1
            00ADA400C2BA45FFFFFFFFFFFFFFFFFFF4F1DCACA300ADA400ADA400B0A608B1
            A811FFFFFFFFFFFF35383C181B2111151AE8E8E8FFFFFFFFFFFFF7F7F70E1217
            181B211C1F24F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD1F2227181B
            2115181EB6B7B9FFFFFFF2EFD4ACA300ADA400AFA409FEFDFAFFFFFFFFFFFFB1
            A810ADA400ADA400E5E2AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFB0A611ADA400AEA504FDFDF8D3CD78ACA300ADA400DCD791FFFFFFFFFF
            FFFFFFFFDFDC9EACA202ADA400CAC35BFFFFFFFAFAEFABA100ADA400C2BA45FF
            FFFFFFFFFFFFFFFFD4D07BADA400ADA400D3CD77FFFFFFFFFFFFFFFFFFFFFFFF
            282A2C181B2112151BF0F1F1FFFFFFFFFFFFB6B7B8181B21181B212F32368081
            857F80857F80857F80857F8085A6A7A8E6E6E613161C181B2124272CFFFFFFFF
            FFFFF2EFD4ACA300ADA400B0A709FEFDFAFFFFFFFFFFFFB1A810ADA400ADA400
            E5E2AFFFFFFFFFFFFFFEFEFEFDFDFBFBFAF3FBFAF3F9F9F0E9E6BCADA403ADA4
            00B0A707FEFDF9ACA202ADA400CDC767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4
            CF7BADA400ABA100FFFFFFFAFAEFABA100ADA400C2BA45FFFFFFFFFFFFFFFFFF
            CEC763ADA400ADA400E4E1ABFFFFFFFFFFFFFFFFFFFFFFFF292C31181B211216
            1BF1F1F2FFFFFFFFFFFF9A9C9E181B21181B21181B21181B21181B21181B2118
            1B21181B215D5E62DBDCDC11141A181B21494B4EFFFFFFFFFFFFF3F2DBB9B02A
            B9B02BBAB230D7D7D7D7D7D7D7D7D7BDB53EBEB53BBEB53BEBE8BEFFFFFFECE9
            C5ADA307ACA200ADA400ADA400ADA400ADA400ADA400ADA400CCC661FFFFFFAB
            A100ADA400EEECC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F5E5ACA300ADA400
            FBFAF2FAFAEFABA100ADA400C2BA45FFFFFFFFFFFFFFFFFFCEC762ADA400ADA4
            00E7E4B5FFFFFFFFFFFFFFFFFFFFFFFF292C31181B2112161BF1F1F2FFFFFFFF
            FFFFABABAB181B21181B21171A2014171C14171C14171C14171C14171C5C5E62
            E2E3E313161C181B21373A3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7171A
            1F13161B13161BE7E8EAFFFFFFFFFFFFFFFFFFFFFFFEA99E02ADA400ADA400B1
            A610B3A918B3A919B3A91ABBB32EE5E2AFFFFFFFFFFFFFABA100ADA400E5E1AD
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEBCAADA400ABA000FFFFFEFAFAEFABA1
            00ADA400C2BA45FFFFFFFFFFFFFFFFFFCEC762ADA400ADA400E7E4B5FFFFFFFF
            FFFFFFFFFFFFFFFF292C31181B2112161BF1F1F2FFFFFFFFFFFFDFDFDF14171D
            181B213C3E42F1F1F2F0F0F1F0F0F1F0F0F1F0F0F1F5F5F5F8F8F8171A1F181B
            210C0F15FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7171A1F181B21181B21E7
            E8E9FFFFFFFFFFFFFFFFFFF3F1D7ADA400ADA400B8B023FEFEFDFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3AA15ADA400B8B023FEFEFBFFFFFFFFFF
            FFFFFFFFFFFFFFBCB330ADA400AFA405FFFFFFFAFAEFABA100ADA400C2BA45FF
            FFFFFFFFFFFFFFFFCEC762ADA400ADA400E7E4B5FFFFFFFFFFFFEEEEEEE8E8E8
            272A2F181B2113171CDFDFDFE8E8E8ECECECFFFFFF111319181B21171A20ADAE
            B0E2E2E3E8E8E8E8E8E8E8E8E8EFEFEFFFFFFF4D4F52181B21181B2147494ECF
            D0D1E3E3E4E4E4E5E4E4E5DEDFDF27292D272B2F272B2FDADADAE6E7E7E6E7E7
            F5F5F5F5F3E0ADA400ADA400B0A70FF1EFD4F2F0D6F2F0D6F1F0D4F1F0D4F1F0
            D4F7F5E5FFFFFFF1EFD3ACA202ADA400AEA503DED999EDEAC5E1DEA1B0A70AAD
            A400ACA300E8E5B7F1EFD4EEEDCCACA200ADA400BFB73BF1EFD4F1EFD4FAF9EE
            CEC762ADA400ADA400DDD996F1EFD4F1EFD4595B5E15181E181B21181B21181B
            2115181E15181E3D3E43FFFFFFC7C7C90E1117181B2115191E15181E15181E15
            181E15181E5B5C5FFFFFFFF0F0F10A0E13181B21181B2115181E15181E15181E
            15181E16191EFAFAFAFFFFFFFFFFFF25292D15181E15181E9D9EA0FFFFFFABA0
            00ADA400ADA400ACA300ACA300ACA300ACA300ACA300ACA300CAC55CFFFFFFFF
            FFFFE4E1ADABA200ADA400ADA400ACA300ADA400ADA400ABA200DEDA99D2CD73
            ACA300ACA300ADA400ADA400ADA400ACA300ACA300E0DD9ECEC762ADA400ADA4
            00ADA400ACA300ACA3005A5D6015181D181B21181B21181B2116191E15181D3E
            4044FFFFFFFFFFFFE0E0E1494C4F212429171A1F15181D15181D15181D5C5F62
            FFFFFFFFFFFFF0F1F16B6D70282C301B1E2215181D15181D15181D161A1FF9F9
            F9FFFFFFFFFFFF272B2F181B21181B219E9FA2FFFFFFF9F9EDBEB83DAFA60BAD
            A403ADA403ADA403ADA403ADA403ADA403CBC55EFFFFFFFFFFFFFFFFFFFAF9EF
            CDC865B5AB1BAEA406B3AA18CBC562F9F7E9FFFFFFD2CD75AFA605AFA605ADA4
            00ADA400ADA400AFA605AFA605E0DCA0CEC762ADA400ADA400AEA502AFA605AF
            A605FDFDFDFCFCFC292C31181B2112161BF0F0F0FCFCFCFDFDFDFFFFFFFFFFFF
            FFFFFFFFFFFFFEFEFEFCFCFCFCFCFCFCFCFCFCFCFCFDFDFDFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFDFDFDFCFCFCFCFCFCFCFCFCFCFCFCFFFFFFFFFFFFFFFFFF2A
            2C2F15191E15191EA0A0A0FFFFFFFFFFFFFFFFFFFEFEFDFEFEFCFEFEFCFEFEFC
            FEFEFCFEFEFCFEFEFCFEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
            FDFFFFFEFFFFFFFFFFFFFFFFFFFFFEFEFEFEFDFBFBF3ABA100ADA400BEB639FE
            FEFDFEFEFDFFFFFECEC762ADA400ADA400E6E3B3FEFEFDFEFEFDFFFFFFFFFFFF
            292C31181B2112161BF1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFDFDF8AAA000ADA400ADA400C4BC4BC7C152ECE9C1
            CEC762ADA400ADA400E7E4B5FFFFFFFFFFFFFFFFFFFFFFFF292C31181B211216
            1BF1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFBFB740ACA200ADA400ADA400ADA400E2DEA3CEC762ADA400ADA4
            00E7E4B5FFFFFFFFFFFFFFFFFFFFFFFF67696B5A5C60585A5EF5F5F5FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
            FCE6E3B1CBC55DC5C34EC5C34EEAE7BEDDD893C5C34EC5C34EEEECCAFFFFFFFF
            FFFF}
        end
        object Memo17: TfrxMemoView
          Left = 427.086890000000000000
          Top = 26.456710000000000000
          Width = 498.897960000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUBTITULO]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          ShiftMode = smDontShift
          Top = 41.574830000000000000
          Width = 49.133890000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'LICI'
            'TA'#195#8225#195#402'O')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          ShiftMode = smDontShift
          Left = 68.031540000000000000
          Top = 41.574830000000000000
          Width = 49.133890000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'CLIENTE')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          ShiftMode = smDontShift
          Left = 117.165430000000000000
          Top = 41.574830000000000000
          Width = 173.858380000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'NOME DO CLIENTE')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          ShiftMode = smDontShift
          Left = 291.023810000000000000
          Top = 41.574830000000000000
          Width = 60.472480000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'DATA')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          ShiftMode = smDontShift
          Left = 351.496290000000000000
          Top = 41.574830000000000000
          Width = 60.472480000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'VALIDADE')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          ShiftMode = smDontShift
          Left = 411.968770000000000000
          Top = 41.574830000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'ITEM')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          ShiftMode = smDontShift
          Left = 487.559370000000000000
          Top = 41.574830000000000000
          Width = 257.008040000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'DESCRI'#195#8225#195#402'O')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          ShiftMode = smDontShift
          Left = 744.567410000000000000
          Top = 41.574830000000000000
          Width = 34.015770000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'QTDE')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          ShiftMode = smDontShift
          Left = 778.583180000000000000
          Top = 41.574830000000000000
          Width = 37.795300000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'PEN'
            'DENTE')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          ShiftMode = smDontShift
          Left = 816.378480000000000000
          Top = 41.574830000000000000
          Width = 37.795300000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'PRAZO')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          ShiftMode = smDontShift
          Left = 854.173780000000000000
          Top = 41.574830000000000000
          Width = 68.031540000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'TOTAL')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          ShiftMode = smDontShift
          Left = 922.205320000000000000
          Top = 41.574830000000000000
          Width = 68.031540000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'CUSTO '
            'TOTAL')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          ShiftMode = smDontShift
          Left = 990.236860000000000000
          Top = 41.574830000000000000
          Width = 49.133890000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '%'
            'IMPOSTO')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          ShiftMode = smDontShift
          Left = 49.133890000000000000
          Top = 41.574830000000000000
          Width = 18.897650000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'SIT.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object MasterData2: TfrxMasterData
        Height = 15.118120000000000000
        Top = 147.401670000000000000
        Visible = False
        Width = 1046.929810000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        AllowSplit = True
        DataSet = frxDBLicitacoesporProdutos
        DataSetName = 'frxDBLicitacoesporProdutos'
        RowCount = 0
        Stretched = True
        object Memo37: TfrxMemoView
          Align = baClient
          Width = 1046.929810000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          DataField = 'numero'
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBLicitacoesporProdutos."numero"]')
          ParentFont = False
          SuppressRepeated = True
        end
        object Memo39: TfrxMemoView
          Left = 68.031540000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          DataField = 'cliente'
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBLicitacoesporProdutos."cliente"]')
          ParentFont = False
          SuppressRepeated = True
        end
        object Memo40: TfrxMemoView
          Left = 117.165430000000000000
          Width = 173.858380000000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
          DataField = 'nomecliente'
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBLicitacoesporProdutos."nomecliente"]')
          ParentFont = False
          SuppressRepeated = True
        end
        object Memo41: TfrxMemoView
          Left = 291.023810000000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          DataField = 'datavenda'
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBLicitacoesporProdutos."datavenda"]')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 351.496290000000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          DataField = 'datavenda'
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBLicitacoesporProdutos."datavenda"]')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 411.968770000000000000
          Width = 75.590600000000000000
          Height = 15.118110240000000000
          DataField = 'produtovisual'
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBLicitacoesporProdutos."produtovisual"]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 487.559370000000000000
          Width = 257.008040000000000000
          Height = 15.118110240000000000
          StretchMode = smActualHeight
          DataField = 'descricaoproduto'
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBLicitacoesporProdutos."descricaoproduto"]')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 744.567410000000000000
          Width = 34.015770000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBLicitacoesporProdutos."quantidade"]')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 778.583180000000000000
          Width = 37.795300000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBLicitacoesporProdutos."saldopendente"]')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 816.378480000000000000
          Width = 37.795300000000000000
          Height = 15.118110240000000000
          DataField = 'prazo'
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBLicitacoesporProdutos."prazo"]')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 854.173780000000000000
          Width = 68.031540000000000000
          Height = 15.118110240000000000
          DataField = 'totalproduto'
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBLicitacoesporProdutos."totalproduto"]')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 918.425790000000000000
          Width = 71.811070000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBLicitacoesporProdutos."customediototal"]')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 978.898270000000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          DataField = 'aliquotaicms'
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBLicitacoesporProdutos."aliquotaicms"]')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 49.133890000000000000
          Width = 18.897650000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[Copy(<frxDBLicitacoesporProdutos."situacao_licitacao">,1,1)]')
          ParentFont = False
        end
      end
      object PageFooter2: TfrxPageFooter
        Height = 15.118120000000000000
        Top = 264.567100000000000000
        Width = 1046.929810000000000000
        object Memo52: TfrxMemoView
          Left = 3.779530000000000000
          Width = 718.110700000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'hh:mm'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '[formatdatetime('#39'dd/mm/yyyy'#39', <date>)] [formatdatetime('#39'hh:mm'#39', ' +
              '<time>)] ['#39'TecSoft'#39']')
          ParentFont = False
        end
      end
      object ReportSummary2: TfrxReportSummary
        Height = 18.897650000000000000
        Top = 222.992270000000000000
        Width = 1046.929810000000000000
        object Memo53: TfrxMemoView
          Left = 714.331170000000000000
          Top = 3.779530000000000000
          Width = 64.252010000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBLicitacoesporProdutos."quantidade">,MasterData2,1)]')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 752.126470000000000000
          Top = 3.779530000000000000
          Width = 64.252010000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[SUM(<frxDBLicitacoesporProdutos."saldopendente">,MasterData2,1)' +
              ']')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 861.732840000000000000
          Top = 3.779530000000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBLicitacoesporProdutos."totalproduto">,MasterData2,1)]')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 918.425790000000000000
          Top = 3.779530000000000000
          Width = 71.811070000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[SUM(<frxDBLicitacoesporProdutos."customediototal">,MasterData2,' +
              '1)]')
          ParentFont = False
        end
        object Memo81: TfrxMemoView
          Left = 517.795610000000000000
          Top = 3.779530000000000000
          Width = 64.252010000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporProdutos
          DataSetName = 'frxDBLicitacoesporProdutos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'TOTAIS')
          ParentFont = False
        end
      end
    end
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    ShowProgress = True
    FixedWidth = True
    Background = False
    Centered = False
    EmptyLines = True
    Left = 776
    Top = 312
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 664
    Top = 288
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 776
    Top = 168
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    Left = 776
    Top = 112
  end
  object frxBMPExport1: TfrxBMPExport
    UseFileCache = True
    ShowProgress = True
    Left = 776
    Top = 24
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    ShowProgress = True
    Left = 688
    Top = 24
  end
  object frxTIFFExport1: TfrxTIFFExport
    UseFileCache = True
    ShowProgress = True
    Left = 776
    Top = 216
  end
  object frxGIFExport1: TfrxGIFExport
    UseFileCache = True
    ShowProgress = True
    Left = 776
    Top = 64
  end
  object frxSimpleTextExport1: TfrxSimpleTextExport
    UseFileCache = True
    ShowProgress = True
    Frames = False
    EmptyLines = False
    OEMCodepage = False
    Left = 768
    Top = 264
  end
  object frxCSVExport1: TfrxCSVExport
    UseFileCache = True
    ShowProgress = True
    Separator = ';'
    OEMCodepage = False
    Left = 672
    Top = 232
  end
  object frxMailExport1: TfrxMailExport
    UseFileCache = True
    ShowProgress = True
    ShowExportDialog = True
    SmtpPort = 25
    UseIniFile = True
    Left = 680
    Top = 176
  end
  object frxTXTExport1: TfrxTXTExport
    UseFileCache = True
    ShowProgress = True
    ScaleWidth = 1.000000000000000000
    ScaleHeight = 1.000000000000000000
    Borders = False
    Pseudogrpahic = False
    PageBreaks = True
    OEMCodepage = False
    EmptyLines = False
    LeadSpaces = False
    PrintAfter = False
    PrinterDialog = True
    UseSavedProps = True
    Left = 656
    Top = 344
  end
  object frxODSExport1: TfrxODSExport
    UseFileCache = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 680
    Top = 72
  end
  object frxODTExport1: TfrxODTExport
    UseFileCache = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 680
    Top = 128
  end
  object frxDBLicitacoesporNumero: TfrxDBDataset
    UserName = 'frxDBLicitacoesporNumero'
    CloseDataSource = False
    FieldAliases.Strings = (
      'numero=numero'
      'cliente=cliente'
      'nomecliente=nomecliente'
      'datavenda=datavenda'
      'vigencia=vigencia'
      'observacoes=observacoes'
      'prazo=prazo'
      'totalproduto=totalproduto'
      'customediototal=customediototal'
      'valorimposto=valorimposto'
      'lucroliquido=lucroliquido'
      'perclucroliquido=perclucroliquido'
      'situacao_licitacao=situacao_licitacao'
      'valoripi=valoripi')
    DataSet = qryLicitacoesporNumero
    Left = 280
    Top = 264
  end
  object frxDBLicitacoesporNumero_: TfrxDBDataset
    UserName = 'frxDBLicitacoesporNumero_'
    CloseDataSource = False
    FieldAliases.Strings = (
      'numero=numero'
      'cliente=cliente'
      'nomecliente=nomecliente'
      'datavenda=datavenda'
      'vigencia=vigencia'
      'observacoes=observacoes'
      'prazo=prazo'
      'totalproduto=totalproduto'
      'customediototal=customediototal'
      'valorimposto=valorimposto'
      'lucroliquido=lucroliquido'
      'perclucroliquido=perclucroliquido'
      'situacao_licitacao=situacao_licitacao'
      'valoripi=valoripi')
    DataSet = qryLicitacoesporNumero
    Left = 280
    Top = 304
  end
  object frxRLicitacoesporNumero: TfrxReport
    Version = '4.0.11'
    DataSet = frxDBLicitacoesporNumero_
    DataSetName = 'frxDBLicitacoesporNumero_'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45167.557598344900000000
    ReportOptions.LastChange = 45589.366274571760000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      ' vZebrar, vZebrar2 : boolean;'
      ''
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if vZebrar then'
      '  begin'
      '    if <CordoZebrado> <> null then'
      '      mmoZebrado.color := <CordoZebrado>;'
      '    vZebrar := false;'
      '  end'
      '  else'
      '  begin'
      '    mmoZebrado.color := clwhite;'
      '    vZebrar := true;'
      '  end;'
      ''
      'end;'
      ''
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxRLicitacoesporNumeroGetValue
    Left = 400
    Top = 232
    Datasets = <
      item
        DataSet = frxDBLicitacoesporNumero
        DataSetName = 'frxDBLicitacoesporNumero'
      end>
    Variables = <
      item
        Name = ' Relatorio'
        Value = Null
      end
      item
        Name = 'ENDERECO_BAIRRO'
        Value = Null
      end
      item
        Name = 'RAZAOFILIALBASE'
        Value = Null
      end
      item
        Name = 'CEP_CIDADE_UF'
        Value = Null
      end
      item
        Name = 'TITULO'
        Value = #39'RELAT'#211'RIO DE LICITA'#199#213'ES - SINT'#201'TICO'#39
      end
      item
        Name = 'SUBTITULO'
        Value = #39'VENDAS ENTRE: 01/09/2023 E 30/09/2023'#39
      end
      item
        Name = 'OUTRAS'
        Value = #39'FILIAIS: 1,2,3,4,5,6,7,8,9,10 '#39
      end
      item
        Name = 'DATA'
        Value = Null
      end
      item
        Name = 'CordoZebrado'
        Value = Null
      end
      item
        Name = 'AgruparGrupoFilial'
        Value = 'False'
      end
      item
        Name = 'AgruparFilial'
        Value = 'True'
      end
      item
        Name = 'AgruparFornecedor'
        Value = Null
      end
      item
        Name = 'AgruparLocalizacao'
        Value = Null
      end
      item
        Name = 'AgruparClasseProduto'
        Value = Null
      end
      item
        Name = 'AgruparGrupoProduto'
        Value = Null
      end
      item
        Name = 'DATASITUACAO'
        Value = #39'28/02/2021'#39
      end
      item
        Name = 'QuebrarPaginaporCliente'
        Value = 'False'
      end
      item
        Name = 'Pagina1'
        Value = Null
      end
      item
        Name = 'Pagina2'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 7.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 5.000000000000000000
      object PageHeader1: TfrxPageHeader
        Height = 68.031540000000000000
        Top = 18.897650000000000000
        Width = 1058.268400000000000000
        object Memo6: TfrxMemoView
          Left = 986.457330000000000000
          Top = 18.897650000000000000
          Width = 52.913420000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Page]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo4: TfrxMemoView
          Left = 937.323440000000000000
          Top = 18.897650000000000000
          Width = 45.354360000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'P'#195#129'G.:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 937.323440000000000000
          Top = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'DATA:')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 986.457330000000000000
          Top = 3.779530000000000000
          Width = 52.913420000000000000
          Height = 11.338582680000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[Date]')
          ParentFont = False
          VAlign = vaCenter
        end
        object mmoTitulo: TfrxMemoView
          ShiftMode = smDontShift
          Left = 427.086890000000000000
          Top = 3.779530000000000000
          Width = 498.897960000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[TITULO]')
          ParentFont = False
        end
        object fmvRua_T: TfrxMemoView
          ShiftMode = smDontShift
          Left = 124.724490000000000000
          Top = 3.779530000000000000
          Width = 294.803340000000000000
          Height = 11.338590000000000000
          StretchMode = smActualHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[RAZAOFILIALBASE]'
            '[ENDERECO_BAIRRO]'
            '[CEP_CIDADE_UF]')
          ParentFont = False
        end
        object fpvLogo: TfrxPictureView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 120.944960000000000000
          Height = 45.354360000000000000
          Picture.Data = {
            07544269746D617016110000424D161100000000000036000000280000004800
            0000140000000100180000000000E0100000C40E0000C40E0000000000000000
            0000FFFFFFFFFFFFFCFCFCCECDCDFFFFFFE3E3E3CFCFD0FFFFFFF1F1F1CDCDCD
            FAFAFADDDDDDFFFFFFE4E3E3FFFFFFE4E4E4DBDCDCFFFFFFECECECFBFBFBFCFC
            FCCECECDF9F9F9FFFFFFB5B5B58D8D8E9E9E9DF8F8F8F4F4F4FAFAFAD0D0D0D3
            D3D4FEFEFEFFFFFFFFFFFFD7D7D8DBDADAFDFDFDF2F2F2DDDDDDFEFEFEE9E9E9
            FFFFFFFEFEFECFCFD0CFCFCFFAFAFAF0F0F1FAFAFADADADACECECEEEEEEEFFFF
            FFE7E7E7ECECECFEFEFED0D0D1E9E9E9F1F1F1FBFBFBE1E1E1FBFBFBF4F4F4FA
            FAFACFCFCFD4D4D5FFFFFFCECECECECECEFAFAFAFFFFFFFFFFFFFFFFFFFFFFFF
            A9A8A8D2D2D2DCDCDC999999DFDFDFF7F7F7585859F1F1F1FDFDFD3C3A3AFFFF
            FF545453ECECEC969696C7C7C7B2B2B2999A9AEBEBEB424140EDEDED414141FA
            FAF9585757E7E7E7868686D9D9D9C0C0C06F6F6FDDDDDD696969F9F9F9FFFFFF
            929394D0D0D0E7E7E7EFEFEFB3B3B23E3E3FF9F9F97B7B7AFFFFFFFFFFFFE0E0
            E0C7C7C68C8C8CAFAEAEDFDFDFECECECD8D7D73F3F3FFEFEFE4C4D4EF9F9F946
            4646DFDFDFF1F1F1A8A7A7E7E7E7484747DEDEDEBCBCBC545352E1E1E15A5A5A
            FFFFFFE0E0E0D3D3D37E7D7EFFFFFFFFFFFFFFFFFFFFFFFFABABABE2E2E1DADA
            DA7A7A79B9B9B9F6F6F668686AFEFEFEFFFFFF3E3D3DFEFEFE565658E8E8E8B0
            B0AFD8D8D8A5A5A4999A9AEBEBEB403F3EFCFCFB464646F8F8F8616161F2F2F2
            868686D9D9D9C0C0C0F3F3F3B3B3B3484949FAFAFAFFFFFF8E8F90AAAAA9C9C9
            C8EFEFEFB7B7B73E4043F1F1F1848485FFFFFFF9F9F94D4D4DC5C5C5F6F6F6B1
            B0B0DFDFDF4B4B4DC3C3C3E4E4E4FDFDFD555656FEFEFE40403FB9B9B9E1E1E1
            A8A8A8E6E6E64B4A4ADADADAC0C1C2F2F2F2B3B3B33F3F3FFFFFFF404040C4C4
            C4F5F5F5FFFFFFFFFFFFFFFFFFFFFFFF7474749C9B9AFFFFFFE2E2E2AFAFB0FE
            FEFEF0F0F0AEAEADF5F6F6C0BFBEB3B3B2FCFCFCFFFFFFD7D7D8C6C6C6FFFFFF
            989999EAEBEBFCFCFCAFAFAFF6F6F6FFFFFFEDEDEDB0B0AFE1E1E0F0F0F0E7E7
            E7D9D9D9AFAEAEDCDDDDFFFFFFFFFFFFFFFFFFC9C9C9C2C2C2FCFCFCB0B0AFB7
            B7B7B7B6B5FCFCFCFFFFFFFFFFFFD6D7D7AEAEADE7E7E5E0E0E0F2F2F2F2F2F2
            B0AFAFC2C2C2E6E6E63B3A3ADDDEDEFFFFFFB6B6B6DDDDDDE9E9E9B0AFAFB7B7
            B7BEBEBEFFFFFFD1D1D1AFAEAEE0E0E0FFFFFFDADADAAFAEAEE1E1E1FFFFFFFF
            FFFFFFFFFFFFFFFFEAEAEAF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9FAFAF9FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F3DDDAB6ECE9C4ECE9C4FD
            FDF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEAF7F7F7FFFFFFFFFFFFFFFFFFFFFF
            FFD6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFEFEFECDCDCEB2B2B1ADAEB0BABCBDFFFFFFFFFFFFFFFFFFF8F8F9CACB
            CCB3B4B4ADAEB0ADAEB0ADAEB0C6C7C8FFFFFFFFFFFFFFFFFFFEFEFED1D2D3B7
            B7B7B6B7B8FFFFFFFFFFFFFCFCF6ACA205ADA400ADA400F6F5E5FFFFFFFFFFFF
            EAE7BFE3DFA6E3DFA6E3DFA6E3DFA6E3DFA6E3DFA6E3DFA6E5E1AEECE9C5FCFC
            F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDECEBC6E4E0ABECE9C3FDFCF9FF
            FFFFFFFFFFFFFFFFFFFFFFFEFEFCE6E3B1E6E3B1EDEAC7FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFF7F6E6E8E7BAE6E3B1E6E3B1FFFFFFFFFFFFF3F3F41B1E231619
            20171A20171A203F4045FFFFFFFDFDFD8183850F1218161920171A20171A2017
            1A20171A205C5D61FFFFFFFFFFFF9FA0A10F1218161920171A20313337FFFFFF
            FFFFFFFCFCF6ACA205ADA400ADA400F6F5E5FFFFFFFFFFFFC2BA43ADA400ADA4
            00ADA400ADA400ADA400ADA400ADA400ADA400ADA400ABA104F9F8EFFFFFFFFF
            FFFFFFFEFCCDC869ACA104ADA400ADA400ADA400ACA103C8C156FEFEFBFFFFFF
            FFFFFFFAFAEFABA100ADA400C2BA45FFFFFFFFFFFFFFFFFFFFFFFFC1B944ACA3
            00ADA400ADA400ADA400FFFFFFFFFFFF838586171A20181B2111151B3C3E4160
            6265FFFFFF71737616191F181B210F13193034383D3F443D40443D4044797A7B
            FFFFFFBEBFC113161C181B2114181D1C20244D4F4CEEECCBEEECCBEDEAC7BCB5
            36BCB635BCB635E5E2B0E8E6BBE8E6BBC8C45ABDB63FBDB63FBDB63FBDB63FBD
            B63FBDB63FBDB640BBB438ADA400ADA400B9AF26FFFFFFFEFEFDBCB334ADA400
            ADA400ABA101AEA404ABA101ADA400ADA400B7AE26FEFEFAFFFFFFFAFAEFABA1
            00ADA400C2BA45FFFFFFFFFFFFFFFFFFF4F1DCACA300ADA400ADA400B0A608B1
            A811FFFFFFFFFFFF35383C181B2111151AE8E8E8FFFFFFFFFFFFF7F7F70E1217
            181B211C1F24F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD1F2227181B
            2115181EB6B7B9FFFFFFF2EFD4ACA300ADA400AFA409FEFDFAFFFFFFFFFFFFB1
            A810ADA400ADA400E5E2AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFB0A611ADA400AEA504FDFDF8D3CD78ACA300ADA400DCD791FFFFFFFFFF
            FFFFFFFFDFDC9EACA202ADA400CAC35BFFFFFFFAFAEFABA100ADA400C2BA45FF
            FFFFFFFFFFFFFFFFD4D07BADA400ADA400D3CD77FFFFFFFFFFFFFFFFFFFFFFFF
            282A2C181B2112151BF0F1F1FFFFFFFFFFFFB6B7B8181B21181B212F32368081
            857F80857F80857F80857F8085A6A7A8E6E6E613161C181B2124272CFFFFFFFF
            FFFFF2EFD4ACA300ADA400B0A709FEFDFAFFFFFFFFFFFFB1A810ADA400ADA400
            E5E2AFFFFFFFFFFFFFFEFEFEFDFDFBFBFAF3FBFAF3F9F9F0E9E6BCADA403ADA4
            00B0A707FEFDF9ACA202ADA400CDC767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4
            CF7BADA400ABA100FFFFFFFAFAEFABA100ADA400C2BA45FFFFFFFFFFFFFFFFFF
            CEC763ADA400ADA400E4E1ABFFFFFFFFFFFFFFFFFFFFFFFF292C31181B211216
            1BF1F1F2FFFFFFFFFFFF9A9C9E181B21181B21181B21181B21181B21181B2118
            1B21181B215D5E62DBDCDC11141A181B21494B4EFFFFFFFFFFFFF3F2DBB9B02A
            B9B02BBAB230D7D7D7D7D7D7D7D7D7BDB53EBEB53BBEB53BEBE8BEFFFFFFECE9
            C5ADA307ACA200ADA400ADA400ADA400ADA400ADA400ADA400CCC661FFFFFFAB
            A100ADA400EEECC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F5E5ACA300ADA400
            FBFAF2FAFAEFABA100ADA400C2BA45FFFFFFFFFFFFFFFFFFCEC762ADA400ADA4
            00E7E4B5FFFFFFFFFFFFFFFFFFFFFFFF292C31181B2112161BF1F1F2FFFFFFFF
            FFFFABABAB181B21181B21171A2014171C14171C14171C14171C14171C5C5E62
            E2E3E313161C181B21373A3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7171A
            1F13161B13161BE7E8EAFFFFFFFFFFFFFFFFFFFFFFFEA99E02ADA400ADA400B1
            A610B3A918B3A919B3A91ABBB32EE5E2AFFFFFFFFFFFFFABA100ADA400E5E1AD
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEBCAADA400ABA000FFFFFEFAFAEFABA1
            00ADA400C2BA45FFFFFFFFFFFFFFFFFFCEC762ADA400ADA400E7E4B5FFFFFFFF
            FFFFFFFFFFFFFFFF292C31181B2112161BF1F1F2FFFFFFFFFFFFDFDFDF14171D
            181B213C3E42F1F1F2F0F0F1F0F0F1F0F0F1F0F0F1F5F5F5F8F8F8171A1F181B
            210C0F15FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7171A1F181B21181B21E7
            E8E9FFFFFFFFFFFFFFFFFFF3F1D7ADA400ADA400B8B023FEFEFDFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3AA15ADA400B8B023FEFEFBFFFFFFFFFF
            FFFFFFFFFFFFFFBCB330ADA400AFA405FFFFFFFAFAEFABA100ADA400C2BA45FF
            FFFFFFFFFFFFFFFFCEC762ADA400ADA400E7E4B5FFFFFFFFFFFFEEEEEEE8E8E8
            272A2F181B2113171CDFDFDFE8E8E8ECECECFFFFFF111319181B21171A20ADAE
            B0E2E2E3E8E8E8E8E8E8E8E8E8EFEFEFFFFFFF4D4F52181B21181B2147494ECF
            D0D1E3E3E4E4E4E5E4E4E5DEDFDF27292D272B2F272B2FDADADAE6E7E7E6E7E7
            F5F5F5F5F3E0ADA400ADA400B0A70FF1EFD4F2F0D6F2F0D6F1F0D4F1F0D4F1F0
            D4F7F5E5FFFFFFF1EFD3ACA202ADA400AEA503DED999EDEAC5E1DEA1B0A70AAD
            A400ACA300E8E5B7F1EFD4EEEDCCACA200ADA400BFB73BF1EFD4F1EFD4FAF9EE
            CEC762ADA400ADA400DDD996F1EFD4F1EFD4595B5E15181E181B21181B21181B
            2115181E15181E3D3E43FFFFFFC7C7C90E1117181B2115191E15181E15181E15
            181E15181E5B5C5FFFFFFFF0F0F10A0E13181B21181B2115181E15181E15181E
            15181E16191EFAFAFAFFFFFFFFFFFF25292D15181E15181E9D9EA0FFFFFFABA0
            00ADA400ADA400ACA300ACA300ACA300ACA300ACA300ACA300CAC55CFFFFFFFF
            FFFFE4E1ADABA200ADA400ADA400ACA300ADA400ADA400ABA200DEDA99D2CD73
            ACA300ACA300ADA400ADA400ADA400ACA300ACA300E0DD9ECEC762ADA400ADA4
            00ADA400ACA300ACA3005A5D6015181D181B21181B21181B2116191E15181D3E
            4044FFFFFFFFFFFFE0E0E1494C4F212429171A1F15181D15181D15181D5C5F62
            FFFFFFFFFFFFF0F1F16B6D70282C301B1E2215181D15181D15181D161A1FF9F9
            F9FFFFFFFFFFFF272B2F181B21181B219E9FA2FFFFFFF9F9EDBEB83DAFA60BAD
            A403ADA403ADA403ADA403ADA403ADA403CBC55EFFFFFFFFFFFFFFFFFFFAF9EF
            CDC865B5AB1BAEA406B3AA18CBC562F9F7E9FFFFFFD2CD75AFA605AFA605ADA4
            00ADA400ADA400AFA605AFA605E0DCA0CEC762ADA400ADA400AEA502AFA605AF
            A605FDFDFDFCFCFC292C31181B2112161BF0F0F0FCFCFCFDFDFDFFFFFFFFFFFF
            FFFFFFFFFFFFFEFEFEFCFCFCFCFCFCFCFCFCFCFCFCFDFDFDFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFDFDFDFCFCFCFCFCFCFCFCFCFCFCFCFFFFFFFFFFFFFFFFFF2A
            2C2F15191E15191EA0A0A0FFFFFFFFFFFFFFFFFFFEFEFDFEFEFCFEFEFCFEFEFC
            FEFEFCFEFEFCFEFEFCFEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
            FDFFFFFEFFFFFFFFFFFFFFFFFFFFFEFEFEFEFDFBFBF3ABA100ADA400BEB639FE
            FEFDFEFEFDFFFFFECEC762ADA400ADA400E6E3B3FEFEFDFEFEFDFFFFFFFFFFFF
            292C31181B2112161BF1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFDFDF8AAA000ADA400ADA400C4BC4BC7C152ECE9C1
            CEC762ADA400ADA400E7E4B5FFFFFFFFFFFFFFFFFFFFFFFF292C31181B211216
            1BF1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFBFB740ACA200ADA400ADA400ADA400E2DEA3CEC762ADA400ADA4
            00E7E4B5FFFFFFFFFFFFFFFFFFFFFFFF67696B5A5C60585A5EF5F5F5FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
            FCE6E3B1CBC55DC5C34EC5C34EEAE7BEDDD893C5C34EC5C34EEEECCAFFFFFFFF
            FFFF}
        end
        object Memo71: TfrxMemoView
          Left = 427.086890000000000000
          Top = 26.456710000000000000
          Width = 498.897960000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUBTITULO]')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          ShiftMode = smDontShift
          Top = 52.913420000000000000
          Width = 52.913420000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'LICITA'#195#8225#195#402'O')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          ShiftMode = smDontShift
          Left = 71.811070000000000000
          Top = 52.913420000000000000
          Width = 49.133890000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'CLIENTE')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          ShiftMode = smDontShift
          Left = 120.944960000000000000
          Top = 52.913420000000000000
          Width = 249.448980000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'NOME DO CLIENTE')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo81: TfrxMemoView
          ShiftMode = smDontShift
          Left = 370.393940000000000000
          Top = 52.913420000000000000
          Width = 60.472480000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'DATA')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo82: TfrxMemoView
          ShiftMode = smDontShift
          Left = 430.866420000000000000
          Top = 52.913420000000000000
          Width = 60.472480000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            'VALIDADE')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo83: TfrxMemoView
          ShiftMode = smDontShift
          Left = 491.338900000000000000
          Top = 52.913420000000000000
          Width = 196.535560000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'OBSERVA'#195#8225#195#8226'ES')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo88: TfrxMemoView
          ShiftMode = smDontShift
          Left = 748.346940000000000000
          Top = 52.913420000000000000
          Width = 64.251968500000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'TOTAL')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo89: TfrxMemoView
          ShiftMode = smDontShift
          Left = 812.598950000000000000
          Top = 52.913420000000000000
          Width = 64.251968500000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'CUSTO')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo90: TfrxMemoView
          ShiftMode = smDontShift
          Left = 876.850960000000000000
          Top = 52.913420000000000000
          Width = 64.251968500000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'IMPOSTOS')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          ShiftMode = smDontShift
          Left = 941.102970000000000000
          Top = 52.913420000000000000
          Width = 64.252010000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'LUCRO L'#195#141'Q.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          ShiftMode = smDontShift
          Left = 1005.354980000000000000
          Top = 52.913420000000000000
          Width = 49.133890000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '% LUC')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          ShiftMode = smDontShift
          Left = 52.913420000000000000
          Top = 52.913420000000000000
          Width = 18.897650000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'SIT')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo69: TfrxMemoView
          ShiftMode = smDontShift
          Left = 687.874460000000000000
          Top = 52.913420000000000000
          Width = 60.472438500000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'VALOR IPI')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 15.118120000000000000
        ParentFont = False
        Top = 147.401670000000000000
        Width = 1058.268400000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        AllowSplit = True
        DataSet = frxDBLicitacoesporNumero
        DataSetName = 'frxDBLicitacoesporNumero'
        RowCount = 0
        Stretched = True
        object mmoZebrado: TfrxMemoView
          Align = baClient
          Width = 1058.268400000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Width = 52.913420000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBLicitacoesporNumero."numero"]')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Left = 71.811070000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBLicitacoesporNumero."cliente"]')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          Left = 120.944960000000000000
          Width = 249.448980000000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBLicitacoesporNumero."nomecliente"]')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Left = 370.393940000000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          DataField = 'datavenda'
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBLicitacoesporNumero."datavenda"]')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          Left = 430.866420000000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBLicitacoesporNumero."vigencia"]')
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          Left = 491.338900000000000000
          Width = 196.535560000000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBLicitacoesporNumero."observacoes"]')
          ParentFont = False
          WordBreak = True
        end
        object Memo10: TfrxMemoView
          Left = 748.346898500000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBLicitacoesporNumero."totalproduto"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 797.480788500000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBLicitacoesporNumero."customediototal"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 861.732798500000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBLicitacoesporNumero."valorimposto"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 925.984850000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBLicitacoesporNumero."lucroliquido"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 1005.354980000000000000
          Width = 49.133890000000000000
          Height = 15.118120000000000000
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBLicitacoesporNumero."perclucroliquido"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 52.913420000000000000
          Width = 18.897650000000000000
          Height = 15.118120000000000000
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[Copy(<frxDBLicitacoesporNumero."situacao_licitacao">,1,1)]')
          ParentFont = False
        end
        object Memo70: TfrxMemoView
          Left = 684.094930000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBLicitacoesporNumero."valoripi"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 11.338590000000000000
        Top = 275.905690000000000000
        Width = 1058.268400000000000000
        object Memo21: TfrxMemoView
          Left = 3.779530000000000000
          Width = 718.110700000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'hh:mm'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '[formatdatetime('#39'dd/mm/yyyy'#39', <date>)] [formatdatetime('#39'hh:mm'#39', ' +
              '<time>)] ['#39'TecSoft'#39']')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 30.236240000000000000
        Top = 222.992270000000000000
        Width = 1058.268400000000000000
        object Memo1: TfrxMemoView
          Left = 733.228778500000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBLicitacoesporNumero."totalproduto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 797.480788500000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[SUM(<frxDBLicitacoesporNumero."customediototal">,MasterData1,1)' +
              ']')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 861.732798500000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBLicitacoesporNumero."valorimposto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 933.543910000000000000
          Top = 3.779530000000000000
          Width = 71.811070000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBLicitacoesporNumero."lucroliquido">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 570.709030000000000000
          Top = 3.779530000000000000
          Width = 64.252010000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'TOTAIS')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 1009.134510000000000000
          Top = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[(<SUM(<frxDBLicitacoesporNumero."totalproduto">- <frxDBLicitaco' +
              'esporNumero."customediototal">-<frxDBLicitacoesporNumero."valori' +
              'mposto">,MasterData1,1)>*100)/<SUM(<frxDBLicitacoesporNumero."to' +
              'talproduto">,MasterData1,1)>]')
          ParentFont = False
        end
        object Memo72: TfrxMemoView
          Left = 668.976810000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBLicitacoesporNumero."valoripi">,MasterData1,1)]')
          ParentFont = False
        end
      end
    end
    object Page2: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 7.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 5.000000000000000000
      object PageHeader2: TfrxPageHeader
        Height = 68.031540000000000000
        Top = 18.897650000000000000
        Width = 1058.268400000000000000
        object Memo19: TfrxMemoView
          Left = 986.457330000000000000
          Top = 18.897650000000000000
          Width = 52.913420000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Page]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo20: TfrxMemoView
          Left = 937.323440000000000000
          Top = 18.897650000000000000
          Width = 45.354360000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'P'#195#129'G.:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 937.323440000000000000
          Top = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'DATA:')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 986.457330000000000000
          Top = 3.779530000000000000
          Width = 52.913420000000000000
          Height = 11.338582680000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[Date]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          ShiftMode = smDontShift
          Left = 427.086890000000000000
          Top = 3.779530000000000000
          Width = 498.897960000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'RESUMO [TITULO]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          ShiftMode = smDontShift
          Left = 124.724490000000000000
          Top = 3.779530000000000000
          Width = 294.803340000000000000
          Height = 11.338590000000000000
          StretchMode = smActualHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[RAZAOFILIALBASE]'
            '[ENDERECO_BAIRRO]'
            '[CEP_CIDADE_UF]')
          ParentFont = False
        end
        object fpvLogo2: TfrxPictureView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 120.944960000000000000
          Height = 45.354360000000000000
          Picture.Data = {
            07544269746D617016110000424D161100000000000036000000280000004800
            0000140000000100180000000000E0100000C40E0000C40E0000000000000000
            0000FFFFFFFFFFFFFCFCFCCECDCDFFFFFFE3E3E3CFCFD0FFFFFFF1F1F1CDCDCD
            FAFAFADDDDDDFFFFFFE4E3E3FFFFFFE4E4E4DBDCDCFFFFFFECECECFBFBFBFCFC
            FCCECECDF9F9F9FFFFFFB5B5B58D8D8E9E9E9DF8F8F8F4F4F4FAFAFAD0D0D0D3
            D3D4FEFEFEFFFFFFFFFFFFD7D7D8DBDADAFDFDFDF2F2F2DDDDDDFEFEFEE9E9E9
            FFFFFFFEFEFECFCFD0CFCFCFFAFAFAF0F0F1FAFAFADADADACECECEEEEEEEFFFF
            FFE7E7E7ECECECFEFEFED0D0D1E9E9E9F1F1F1FBFBFBE1E1E1FBFBFBF4F4F4FA
            FAFACFCFCFD4D4D5FFFFFFCECECECECECEFAFAFAFFFFFFFFFFFFFFFFFFFFFFFF
            A9A8A8D2D2D2DCDCDC999999DFDFDFF7F7F7585859F1F1F1FDFDFD3C3A3AFFFF
            FF545453ECECEC969696C7C7C7B2B2B2999A9AEBEBEB424140EDEDED414141FA
            FAF9585757E7E7E7868686D9D9D9C0C0C06F6F6FDDDDDD696969F9F9F9FFFFFF
            929394D0D0D0E7E7E7EFEFEFB3B3B23E3E3FF9F9F97B7B7AFFFFFFFFFFFFE0E0
            E0C7C7C68C8C8CAFAEAEDFDFDFECECECD8D7D73F3F3FFEFEFE4C4D4EF9F9F946
            4646DFDFDFF1F1F1A8A7A7E7E7E7484747DEDEDEBCBCBC545352E1E1E15A5A5A
            FFFFFFE0E0E0D3D3D37E7D7EFFFFFFFFFFFFFFFFFFFFFFFFABABABE2E2E1DADA
            DA7A7A79B9B9B9F6F6F668686AFEFEFEFFFFFF3E3D3DFEFEFE565658E8E8E8B0
            B0AFD8D8D8A5A5A4999A9AEBEBEB403F3EFCFCFB464646F8F8F8616161F2F2F2
            868686D9D9D9C0C0C0F3F3F3B3B3B3484949FAFAFAFFFFFF8E8F90AAAAA9C9C9
            C8EFEFEFB7B7B73E4043F1F1F1848485FFFFFFF9F9F94D4D4DC5C5C5F6F6F6B1
            B0B0DFDFDF4B4B4DC3C3C3E4E4E4FDFDFD555656FEFEFE40403FB9B9B9E1E1E1
            A8A8A8E6E6E64B4A4ADADADAC0C1C2F2F2F2B3B3B33F3F3FFFFFFF404040C4C4
            C4F5F5F5FFFFFFFFFFFFFFFFFFFFFFFF7474749C9B9AFFFFFFE2E2E2AFAFB0FE
            FEFEF0F0F0AEAEADF5F6F6C0BFBEB3B3B2FCFCFCFFFFFFD7D7D8C6C6C6FFFFFF
            989999EAEBEBFCFCFCAFAFAFF6F6F6FFFFFFEDEDEDB0B0AFE1E1E0F0F0F0E7E7
            E7D9D9D9AFAEAEDCDDDDFFFFFFFFFFFFFFFFFFC9C9C9C2C2C2FCFCFCB0B0AFB7
            B7B7B7B6B5FCFCFCFFFFFFFFFFFFD6D7D7AEAEADE7E7E5E0E0E0F2F2F2F2F2F2
            B0AFAFC2C2C2E6E6E63B3A3ADDDEDEFFFFFFB6B6B6DDDDDDE9E9E9B0AFAFB7B7
            B7BEBEBEFFFFFFD1D1D1AFAEAEE0E0E0FFFFFFDADADAAFAEAEE1E1E1FFFFFFFF
            FFFFFFFFFFFFFFFFEAEAEAF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9FAFAF9FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F3DDDAB6ECE9C4ECE9C4FD
            FDF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEAF7F7F7FFFFFFFFFFFFFFFFFFFFFF
            FFD6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFEFEFECDCDCEB2B2B1ADAEB0BABCBDFFFFFFFFFFFFFFFFFFF8F8F9CACB
            CCB3B4B4ADAEB0ADAEB0ADAEB0C6C7C8FFFFFFFFFFFFFFFFFFFEFEFED1D2D3B7
            B7B7B6B7B8FFFFFFFFFFFFFCFCF6ACA205ADA400ADA400F6F5E5FFFFFFFFFFFF
            EAE7BFE3DFA6E3DFA6E3DFA6E3DFA6E3DFA6E3DFA6E3DFA6E5E1AEECE9C5FCFC
            F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDECEBC6E4E0ABECE9C3FDFCF9FF
            FFFFFFFFFFFFFFFFFFFFFFFEFEFCE6E3B1E6E3B1EDEAC7FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFF7F6E6E8E7BAE6E3B1E6E3B1FFFFFFFFFFFFF3F3F41B1E231619
            20171A20171A203F4045FFFFFFFDFDFD8183850F1218161920171A20171A2017
            1A20171A205C5D61FFFFFFFFFFFF9FA0A10F1218161920171A20313337FFFFFF
            FFFFFFFCFCF6ACA205ADA400ADA400F6F5E5FFFFFFFFFFFFC2BA43ADA400ADA4
            00ADA400ADA400ADA400ADA400ADA400ADA400ADA400ABA104F9F8EFFFFFFFFF
            FFFFFFFEFCCDC869ACA104ADA400ADA400ADA400ACA103C8C156FEFEFBFFFFFF
            FFFFFFFAFAEFABA100ADA400C2BA45FFFFFFFFFFFFFFFFFFFFFFFFC1B944ACA3
            00ADA400ADA400ADA400FFFFFFFFFFFF838586171A20181B2111151B3C3E4160
            6265FFFFFF71737616191F181B210F13193034383D3F443D40443D4044797A7B
            FFFFFFBEBFC113161C181B2114181D1C20244D4F4CEEECCBEEECCBEDEAC7BCB5
            36BCB635BCB635E5E2B0E8E6BBE8E6BBC8C45ABDB63FBDB63FBDB63FBDB63FBD
            B63FBDB63FBDB640BBB438ADA400ADA400B9AF26FFFFFFFEFEFDBCB334ADA400
            ADA400ABA101AEA404ABA101ADA400ADA400B7AE26FEFEFAFFFFFFFAFAEFABA1
            00ADA400C2BA45FFFFFFFFFFFFFFFFFFF4F1DCACA300ADA400ADA400B0A608B1
            A811FFFFFFFFFFFF35383C181B2111151AE8E8E8FFFFFFFFFFFFF7F7F70E1217
            181B211C1F24F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD1F2227181B
            2115181EB6B7B9FFFFFFF2EFD4ACA300ADA400AFA409FEFDFAFFFFFFFFFFFFB1
            A810ADA400ADA400E5E2AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFB0A611ADA400AEA504FDFDF8D3CD78ACA300ADA400DCD791FFFFFFFFFF
            FFFFFFFFDFDC9EACA202ADA400CAC35BFFFFFFFAFAEFABA100ADA400C2BA45FF
            FFFFFFFFFFFFFFFFD4D07BADA400ADA400D3CD77FFFFFFFFFFFFFFFFFFFFFFFF
            282A2C181B2112151BF0F1F1FFFFFFFFFFFFB6B7B8181B21181B212F32368081
            857F80857F80857F80857F8085A6A7A8E6E6E613161C181B2124272CFFFFFFFF
            FFFFF2EFD4ACA300ADA400B0A709FEFDFAFFFFFFFFFFFFB1A810ADA400ADA400
            E5E2AFFFFFFFFFFFFFFEFEFEFDFDFBFBFAF3FBFAF3F9F9F0E9E6BCADA403ADA4
            00B0A707FEFDF9ACA202ADA400CDC767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4
            CF7BADA400ABA100FFFFFFFAFAEFABA100ADA400C2BA45FFFFFFFFFFFFFFFFFF
            CEC763ADA400ADA400E4E1ABFFFFFFFFFFFFFFFFFFFFFFFF292C31181B211216
            1BF1F1F2FFFFFFFFFFFF9A9C9E181B21181B21181B21181B21181B21181B2118
            1B21181B215D5E62DBDCDC11141A181B21494B4EFFFFFFFFFFFFF3F2DBB9B02A
            B9B02BBAB230D7D7D7D7D7D7D7D7D7BDB53EBEB53BBEB53BEBE8BEFFFFFFECE9
            C5ADA307ACA200ADA400ADA400ADA400ADA400ADA400ADA400CCC661FFFFFFAB
            A100ADA400EEECC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F5E5ACA300ADA400
            FBFAF2FAFAEFABA100ADA400C2BA45FFFFFFFFFFFFFFFFFFCEC762ADA400ADA4
            00E7E4B5FFFFFFFFFFFFFFFFFFFFFFFF292C31181B2112161BF1F1F2FFFFFFFF
            FFFFABABAB181B21181B21171A2014171C14171C14171C14171C14171C5C5E62
            E2E3E313161C181B21373A3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7171A
            1F13161B13161BE7E8EAFFFFFFFFFFFFFFFFFFFFFFFEA99E02ADA400ADA400B1
            A610B3A918B3A919B3A91ABBB32EE5E2AFFFFFFFFFFFFFABA100ADA400E5E1AD
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEBCAADA400ABA000FFFFFEFAFAEFABA1
            00ADA400C2BA45FFFFFFFFFFFFFFFFFFCEC762ADA400ADA400E7E4B5FFFFFFFF
            FFFFFFFFFFFFFFFF292C31181B2112161BF1F1F2FFFFFFFFFFFFDFDFDF14171D
            181B213C3E42F1F1F2F0F0F1F0F0F1F0F0F1F0F0F1F5F5F5F8F8F8171A1F181B
            210C0F15FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7171A1F181B21181B21E7
            E8E9FFFFFFFFFFFFFFFFFFF3F1D7ADA400ADA400B8B023FEFEFDFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3AA15ADA400B8B023FEFEFBFFFFFFFFFF
            FFFFFFFFFFFFFFBCB330ADA400AFA405FFFFFFFAFAEFABA100ADA400C2BA45FF
            FFFFFFFFFFFFFFFFCEC762ADA400ADA400E7E4B5FFFFFFFFFFFFEEEEEEE8E8E8
            272A2F181B2113171CDFDFDFE8E8E8ECECECFFFFFF111319181B21171A20ADAE
            B0E2E2E3E8E8E8E8E8E8E8E8E8EFEFEFFFFFFF4D4F52181B21181B2147494ECF
            D0D1E3E3E4E4E4E5E4E4E5DEDFDF27292D272B2F272B2FDADADAE6E7E7E6E7E7
            F5F5F5F5F3E0ADA400ADA400B0A70FF1EFD4F2F0D6F2F0D6F1F0D4F1F0D4F1F0
            D4F7F5E5FFFFFFF1EFD3ACA202ADA400AEA503DED999EDEAC5E1DEA1B0A70AAD
            A400ACA300E8E5B7F1EFD4EEEDCCACA200ADA400BFB73BF1EFD4F1EFD4FAF9EE
            CEC762ADA400ADA400DDD996F1EFD4F1EFD4595B5E15181E181B21181B21181B
            2115181E15181E3D3E43FFFFFFC7C7C90E1117181B2115191E15181E15181E15
            181E15181E5B5C5FFFFFFFF0F0F10A0E13181B21181B2115181E15181E15181E
            15181E16191EFAFAFAFFFFFFFFFFFF25292D15181E15181E9D9EA0FFFFFFABA0
            00ADA400ADA400ACA300ACA300ACA300ACA300ACA300ACA300CAC55CFFFFFFFF
            FFFFE4E1ADABA200ADA400ADA400ACA300ADA400ADA400ABA200DEDA99D2CD73
            ACA300ACA300ADA400ADA400ADA400ACA300ACA300E0DD9ECEC762ADA400ADA4
            00ADA400ACA300ACA3005A5D6015181D181B21181B21181B2116191E15181D3E
            4044FFFFFFFFFFFFE0E0E1494C4F212429171A1F15181D15181D15181D5C5F62
            FFFFFFFFFFFFF0F1F16B6D70282C301B1E2215181D15181D15181D161A1FF9F9
            F9FFFFFFFFFFFF272B2F181B21181B219E9FA2FFFFFFF9F9EDBEB83DAFA60BAD
            A403ADA403ADA403ADA403ADA403ADA403CBC55EFFFFFFFFFFFFFFFFFFFAF9EF
            CDC865B5AB1BAEA406B3AA18CBC562F9F7E9FFFFFFD2CD75AFA605AFA605ADA4
            00ADA400ADA400AFA605AFA605E0DCA0CEC762ADA400ADA400AEA502AFA605AF
            A605FDFDFDFCFCFC292C31181B2112161BF0F0F0FCFCFCFDFDFDFFFFFFFFFFFF
            FFFFFFFFFFFFFEFEFEFCFCFCFCFCFCFCFCFCFCFCFCFDFDFDFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFDFDFDFCFCFCFCFCFCFCFCFCFCFCFCFFFFFFFFFFFFFFFFFF2A
            2C2F15191E15191EA0A0A0FFFFFFFFFFFFFFFFFFFEFEFDFEFEFCFEFEFCFEFEFC
            FEFEFCFEFEFCFEFEFCFEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
            FDFFFFFEFFFFFFFFFFFFFFFFFFFFFEFEFEFEFDFBFBF3ABA100ADA400BEB639FE
            FEFDFEFEFDFFFFFECEC762ADA400ADA400E6E3B3FEFEFDFEFEFDFFFFFFFFFFFF
            292C31181B2112161BF1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFDFDF8AAA000ADA400ADA400C4BC4BC7C152ECE9C1
            CEC762ADA400ADA400E7E4B5FFFFFFFFFFFFFFFFFFFFFFFF292C31181B211216
            1BF1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFBFB740ACA200ADA400ADA400ADA400E2DEA3CEC762ADA400ADA4
            00E7E4B5FFFFFFFFFFFFFFFFFFFFFFFF67696B5A5C60585A5EF5F5F5FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
            FCE6E3B1CBC55DC5C34EC5C34EEAE7BEDDD893C5C34EC5C34EEEECCAFFFFFFFF
            FFFF}
        end
        object Memo27: TfrxMemoView
          Left = 427.086890000000000000
          Top = 26.456710000000000000
          Width = 498.897960000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUBTITULO]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          ShiftMode = smDontShift
          Top = 52.913420000000000000
          Width = 52.913420000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'LICITA'#195#8225#195#402'O')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          ShiftMode = smDontShift
          Left = 71.811070000000000000
          Top = 52.913420000000000000
          Width = 49.133890000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'CLIENTE')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          ShiftMode = smDontShift
          Left = 120.944960000000000000
          Top = 52.913420000000000000
          Width = 249.448980000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'NOME DO CLIENTE')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          ShiftMode = smDontShift
          Left = 370.393940000000000000
          Top = 52.913420000000000000
          Width = 60.472480000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'DATA')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          ShiftMode = smDontShift
          Left = 430.866420000000000000
          Top = 52.913420000000000000
          Width = 60.472480000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            'VALIDADE')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          ShiftMode = smDontShift
          Left = 491.338900000000000000
          Top = 52.913420000000000000
          Width = 257.008040000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'OBSERVA'#195#8225#195#8226'ES')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          ShiftMode = smDontShift
          Left = 748.346940000000000000
          Top = 52.913420000000000000
          Width = 64.251968500000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'TOTAL')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          ShiftMode = smDontShift
          Left = 812.598950000000000000
          Top = 52.913420000000000000
          Width = 64.251968500000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'CUSTO')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          ShiftMode = smDontShift
          Left = 876.850960000000000000
          Top = 52.913420000000000000
          Width = 64.251968500000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'IMPOSTOS')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          ShiftMode = smDontShift
          Left = 941.102970000000000000
          Top = 52.913420000000000000
          Width = 64.252010000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'LUCRO L'#195#141'Q.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          ShiftMode = smDontShift
          Left = 1005.354980000000000000
          Top = 52.913420000000000000
          Width = 49.133890000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '% LUC')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          ShiftMode = smDontShift
          Left = 52.913420000000000000
          Top = 52.913420000000000000
          Width = 18.897650000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'SIT')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object MasterData2: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 15.118120000000000000
        ParentFont = False
        Top = 147.401670000000000000
        Visible = False
        Width = 1058.268400000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        AllowSplit = True
        DataSet = frxDBLicitacoesporNumero
        DataSetName = 'frxDBLicitacoesporNumero'
        RowCount = 0
        Stretched = True
        object Memo41: TfrxMemoView
          Align = baClient
          Width = 1058.268400000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Width = 52.913420000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBLicitacoesporNumero."numero"]')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 71.811070000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBLicitacoesporNumero."cliente"]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 120.944960000000000000
          Width = 249.448980000000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBLicitacoesporNumero."nomecliente"]')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 370.393940000000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          DataField = 'datavenda'
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBLicitacoesporNumero."datavenda"]')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 430.866420000000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          DataField = 'datavenda'
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBLicitacoesporNumero."datavenda"]')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 491.338900000000000000
          Width = 257.008040000000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBLicitacoesporNumero."observacoes"]')
          ParentFont = False
          WordBreak = True
        end
        object Memo48: TfrxMemoView
          Left = 748.346898500000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBLicitacoesporNumero."totalproduto"]')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 797.480788500000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBLicitacoesporNumero."customediototal"]')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 861.732798500000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBLicitacoesporNumero."valorimposto"]')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 925.984850000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBLicitacoesporNumero."lucroliquido"]')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 1005.354980000000000000
          Width = 49.133890000000000000
          Height = 15.118120000000000000
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBLicitacoesporNumero."perclucroliquido"]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 52.913420000000000000
          Width = 18.897650000000000000
          Height = 15.118120000000000000
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[Copy(<frxDBLicitacoesporNumero."situacao_licitacao">,1,1)]')
          ParentFont = False
        end
      end
      object PageFooter2: TfrxPageFooter
        Height = 11.338590000000000000
        Top = 275.905690000000000000
        Width = 1058.268400000000000000
        object Memo57: TfrxMemoView
          Left = 3.779530000000000000
          Width = 718.110700000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'hh:mm'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '[formatdatetime('#39'dd/mm/yyyy'#39', <date>)] [formatdatetime('#39'hh:mm'#39', ' +
              '<time>)] ['#39'TecSoft'#39']')
          ParentFont = False
        end
      end
      object ReportSummary2: TfrxReportSummary
        Height = 30.236240000000000000
        Top = 222.992270000000000000
        Width = 1058.268400000000000000
        object Memo59: TfrxMemoView
          Left = 733.228778500000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBLicitacoesporNumero."totalproduto">,MasterData2,1)]')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          Left = 797.480788500000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[SUM(<frxDBLicitacoesporNumero."customediototal">,MasterData2,1)' +
              ']')
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          Left = 861.732798500000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBLicitacoesporNumero."valorimposto">,MasterData2,1)]')
          ParentFont = False
        end
        object Memo66: TfrxMemoView
          Left = 933.543910000000000000
          Top = 3.779530000000000000
          Width = 71.811070000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBLicitacoesporNumero."lucroliquido">,MasterData2,1)]')
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          Left = 650.079160000000000000
          Top = 3.779530000000000000
          Width = 64.252010000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'TOTAIS')
          ParentFont = False
        end
        object Memo68: TfrxMemoView
          Left = 1009.134510000000000000
          Top = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 15.118110240000000000
          DataSet = frxDBLicitacoesporNumero
          DataSetName = 'frxDBLicitacoesporNumero'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[(<SUM(<frxDBLicitacoesporNumero."totalproduto">- <frxDBLicitaco' +
              'esporNumero."customediototal">-<frxDBLicitacoesporNumero."valori' +
              'mposto">,MasterData2,1)>*100)/<SUM(<frxDBLicitacoesporNumero."to' +
              'talproduto">,MasterData2,1)>]')
          ParentFont = False
        end
      end
    end
  end
  object qryCopia_LicitacoesporProdutos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'IntervaloLicitacao'
        ParamType = ptUnknown
        Value = 'AND L.DATAVENDA >= '#39'2023-01-01'#39
      end
      item
        DataType = ftUnknown
        Name = 'SituacaoLicitacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaCondicionaldeClientes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaCondicionaldeVendedores'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select l.numero,'
      '       l.cliente,'
      '       situacao_licitacao(l.numero) as situacao_licitacao,'
      '       cl.nome as nomecliente,'
      '       l.datavenda,'
      '       l.vigencia,'
      '       p.codigovisual as produtovisual,'
      '       p.descricao as descricaoproduto,'
      '       lc.quantidade,'
      ''
      '       lc.quantidade -'
      
        '       (Coalesce(produtos_licitacoes_orcados(lc.licitacao, lc.pr' +
        'oduto, lc.numero),0) +'
      
        '        Coalesce(produtos_licitacoes_reservados(lc.licitacao, lc' +
        '.produto, lc.numero),0) +'
      
        '        Coalesce(produtos_licitacoes_faturados(lc.licitacao, lc.' +
        'produto, lc.numero),0) +'
      
        '        Coalesce(produtos_licitacoes_entregues(lc.licitacao, lc.' +
        'produto, lc.numero),0) -'
      
        '        Coalesce(produtos_licitacoes_devolvidos(lc.licitacao, lc' +
        '.produto, lc.numero),0) ) as SaldoPendente,'
      ''
      '        l.prazo,'
      ''
      '       (lc.quantidade * lc.preco) as TotalProduto,'
      ''
      ''
      
        '        /*1. O que falta entregar o c'#225'lculo '#233' feito pelo custome' +
        'dio atual */'
      '        ((lc.quantidade -'
      ''
      '         (select sum(pdf.quantidade)'
      '                        from produtosdadosfiscais pdf'
      '                             join dadosfiscais df'
      '                                  join contratos ct'
      '                                   on ct.numero = df.contrato'
      '                             on pdf.dadofiscal = df.numero'
      '                        where ct.licitacao = l.numero'
      '                          and df.situacao = '#39'N'#39
      '                          and pdf.produto = p.codigo)) *'
      ''
      
        '        coalesce(nullif( /*customedio(p.codigo, f.codigo)*/ lc.c' +
        'ustomedio,0),'
      ''
      '          (select e.valorultimacompra'
      '           from estoques e'
      '           where e.produto = p.codigo'
      '             and e.filial = f.codigo ))) +'
      
        '        /*2. O restante '#233' pego m.valor/m.quantidade do movimento' +
        ' RFV da sa'#237'da da nota fiscal */'
      ''
      '         (select sum(abs(m.valor))'
      '                        from produtosdadosfiscais pdf'
      '                             join dadosfiscais df'
      '                                  join contratos ct'
      '                                   on ct.numero = df.contrato'
      '                             on pdf.dadofiscal = df.numero'
      ''
      '                             join movimentos m'
      '                             on m.dadofiscal = df.numero'
      '                             and m.produto  = pdf.produto'
      '                             and m.tipomovimento = '#39'RFV'#39
      '                             and m.filial = f.codigo'
      ''
      '                        where ct.licitacao = l.numero'
      '                          and df.situacao = '#39'N'#39
      '                          and pdf.produto = p.codigo)'
      ''
      ''
      '              as customediototal,'
      ''
      ''
      ''
      
        '        Selecionar_AliquotaIcms(f.estado           /*as EstadoOr' +
        'igem*/,'
      
        '                                cl.estado          /*as EstadoDe' +
        'stino*/,'
      
        '                                cl.pessoatipo      /*as TipoPess' +
        'oa*/,'
      
        '                                p.codigo           /*as produto*' +
        '/,'
      
        '                                false              /*as Aliquota' +
        'InternadoEstadodeDestino*/,'
      
        '                                f.contribicms      /*as pContrib' +
        'uinteOrigem*/,'
      
        '                                cl.contribicms     /*as pContrib' +
        'uinteDestino*/,'
      
        '                                cl.consumidorfinal /*as pVendaCo' +
        'nsumidorFinal*/) as AliquotaIcms'
      ''
      'from licitacoes l'
      '     join filiais f'
      '     on l.filialvenda = f.codigo'
      ''
      '     join usuarios u'
      '     on l.vendedor = u.codigo'
      ''
      '     join clientes cl'
      '     on l.cliente = cl.codigo'
      ''
      '     join vfornecedores vf'
      '     on l.cliente = vf.codigo'
      '     and vf.tipo = '#39'C'#39
      ''
      '     join licitacoesprodutos lc'
      '          join produtos p'
      '          on lc.produto = p.codigo'
      ''
      '     on lc.licitacao = l.numero'
      ''
      ''
      'where true'
      '%IntervaloLicitacao'
      '%SituacaoLicitacao'
      '%ListaCondicionaldeClientes'
      '%ListaCondicionaldeVendedores'
      ''
      '/*'
      ':DataInicial'
      ':DataFinal'
      ''
      '*/'
      ''
      ''
      'order by l.datavenda, l.numero'
      '')
    RequestLive = False
    Left = 456
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DataInicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataFinal'
        ParamType = ptUnknown
      end>
    object IntegerField1: TIntegerField
      FieldName = 'numero'
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'cliente'
    end
    object StringField1: TStringField
      FieldName = 'situacao_licitacao'
      Size = 10
    end
    object StringField2: TStringField
      FieldName = 'nomecliente'
      Required = True
      Size = 60
    end
    object DateField1: TDateField
      Alignment = taCenter
      FieldName = 'datavenda'
      EditMask = '99/99/9999;1; '
    end
    object DateField2: TDateField
      Alignment = taCenter
      FieldName = 'vigencia'
      EditMask = '99/99/9999;1; '
    end
    object StringField3: TStringField
      FieldName = 'produtovisual'
      Required = True
      Size = 30
    end
    object StringField4: TStringField
      FieldName = 'descricaoproduto'
      Required = True
      Size = 100
    end
    object FloatField1: TFloatField
      FieldName = 'quantidade'
      DisplayFormat = '0.00'
    end
    object FloatField2: TFloatField
      FieldName = 'saldopendente'
      DisplayFormat = '0.00'
    end
    object IntegerField3: TIntegerField
      FieldName = 'prazo'
    end
    object FloatField3: TFloatField
      FieldName = 'totalproduto'
      DisplayFormat = '0.00'
    end
    object FloatField4: TFloatField
      FieldName = 'customediototal'
      DisplayFormat = '0.00'
    end
    object FloatField5: TFloatField
      FieldName = 'aliquotaicms'
      DisplayFormat = '0.00'
    end
  end
  object qryCopia_LicitacoesporNumero: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'IntervaloLicitacao'
        ParamType = ptUnknown
        Value = 'AND L.DATAVENDA >= '#39'2023-01-01'#39
      end
      item
        DataType = ftUnknown
        Name = 'SituacaoLicitacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaCondicionaldeClientes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaCondicionaldeVendedores'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select numero, cliente, nomecliente, datavenda, vigencia,'
      '       observacoes, prazo, situacao_licitacao,'
      '       sum(TotalProduto) as TotalProduto,'
      '       sum(customediototal) as customediototal,'
      '       SUM(ValorImposto) as ValorImposto,'
      
        '       sum(TotalProduto-customediototal-ValorImposto)  as LucroL' +
        'iquido,'
      
        '       sum((TotalProduto-customediototal-ValorImposto) * 100) / ' +
        'sum(TotalProduto) as PercLucroLiquido'
      'from'
      '('
      'select sel.*,'
      '       TotalProduto *  AliquotaIcms / 100 as ValorImposto'
      'from'
      '('
      ''
      'select l.numero,'
      '       l.cliente,'
      '       situacao_licitacao(l.numero) as situacao_licitacao,'
      '       cl.nome as nomecliente,'
      '       l.datavenda,'
      '       l.vigencia,'
      '       l.observacoes,'
      '       p.codigovisual as produtovisual,'
      '       p.descricao as descricaoproduto,'
      '       lc.quantidade,'
      ''
      '       lc.quantidade -'
      
        '       (/*Nullif(produtos_licitacoes_orcados(lc.licitacao, lc.pr' +
        'oduto, lc.numero),0) +'
      
        '        Nullif(produtos_licitacoes_reservados(lc.licitacao, lc.p' +
        'roduto, lc.numero),0) +'
      
        '        Nullif(produtos_licitacoes_faturados(lc.licitacao, lc.pr' +
        'oduto, lc.numero),0) + */'
      
        '        produtos_licitacoes_entregues(lc.licitacao, lc.produto, ' +
        'lc.numero) /*+'
      
        '        produtos_licitacoes_devolvidos(lc.licitacao, lc.produto,' +
        ' lc.numero)*/ ) as SaldoPendente,'
      ''
      '        l.prazo,'
      ''
      '       (lc.quantidade * lc.preco) as TotalProduto,'
      ''
      ''
      
        '        /*1. O que falta entregar o c'#225'lculo '#233' feito pelo custome' +
        'dio atual */'
      '        ((lc.quantidade -'
      ''
      '         (select sum(pdf.quantidade)'
      '                        from produtosdadosfiscais pdf'
      '                             join dadosfiscais df'
      '                                  join contratos ct'
      '                                   on ct.numero = df.contrato'
      '                             on pdf.dadofiscal = df.numero'
      '                        where ct.licitacao = l.numero'
      '                          and df.situacao = '#39'N'#39
      '                          and pdf.produto = p.codigo)) *'
      ''
      
        '        coalesce(nullif(customedio(p.codigo, cast(1 as smallint)' +
        '),0),'
      '          (select e.valorultimacompra'
      '           from estoques e'
      '           where e.produto = p.codigo'
      '             and e.filial = f.codigo ))) +'
      
        '        /*2. O restante '#233' pego m.valor/m.quantidade do movimento' +
        ' RFV da sa'#237'da da nota fiscal */'
      ''
      '         (select sum(abs(m.valor))'
      '                        from produtosdadosfiscais pdf'
      '                             join dadosfiscais df'
      '                                  join contratos ct'
      '                                   on ct.numero = df.contrato'
      '                             on pdf.dadofiscal = df.numero'
      ''
      '                             join movimentos m'
      '                             on m.dadofiscal = df.numero'
      '                             and m.produto  = pdf.produto'
      '                             and m.tipomovimento = '#39'RFV'#39
      '                             and m.filial = f.codigo'
      ''
      '                        where ct.licitacao = l.numero'
      '                          and df.situacao = '#39'N'#39
      '                          and pdf.produto = p.codigo)'
      ''
      ''
      '              as customediototal,'
      ''
      ''
      ''
      
        '        Selecionar_AliquotaIcms(f.estado           /*as EstadoOr' +
        'igem*/,'
      
        '                                cl.estado          /*as EstadoDe' +
        'stino*/,'
      
        '                                cl.pessoatipo      /*as TipoPess' +
        'oa*/,'
      
        '                                p.codigo           /*as produto*' +
        '/,'
      
        '                                false              /*as Aliquota' +
        'InternadoEstadodeDestino*/,'
      
        '                                f.contribicms      /*as pContrib' +
        'uinteOrigem*/,'
      
        '                                cl.contribicms     /*as pContrib' +
        'uinteDestino*/,'
      
        '                                cl.consumidorfinal /*as pVendaCo' +
        'nsumidorFinal*/) as AliquotaIcms'
      ''
      'from licitacoes l'
      '     join filiais f'
      '     on l.filialvenda = f.codigo'
      ''
      '     join usuarios u'
      '     on l.vendedor = u.codigo'
      ''
      '     join clientes cl'
      '     on l.cliente = cl.codigo'
      ''
      '     join vfornecedores vf'
      '     on l.cliente = vf.codigo'
      '     and vf.tipo = '#39'C'#39
      '     '
      ''
      '     join licitacoesprodutos lc'
      '          join produtos p'
      '          on lc.produto = p.codigo'
      ''
      '     on lc.licitacao = l.numero'
      ''
      ''
      'where true'
      '%IntervaloLicitacao'
      '%SituacaoLicitacao'
      '%ListaCondicionaldeClientes'
      '%ListaCondicionaldeVendedores'
      ''
      '/*'
      ':DataInicial'
      ':DataFinal'
      ''
      '*/'
      ''
      ''
      'order by l.datavenda, l.numero'
      ')  as sel'
      ''
      ')  as sel'
      ''
      
        'group by numero, cliente, nomecliente, datavenda, vigencia, obse' +
        'rvacoes, prazo, situacao_licitacao;'
      '')
    RequestLive = False
    Left = 528
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DataInicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataFinal'
        ParamType = ptUnknown
      end>
    object IntegerField4: TIntegerField
      FieldName = 'numero'
    end
    object IntegerField5: TIntegerField
      FieldName = 'cliente'
    end
    object StringField5: TStringField
      FieldName = 'nomecliente'
      Size = 60
    end
    object DateField3: TDateField
      Alignment = taCenter
      FieldName = 'datavenda'
      EditMask = '99/99/9999;1; '
    end
    object DateField4: TDateField
      Alignment = taCenter
      FieldName = 'vigencia'
      EditMask = '99/99/9999;1; '
    end
    object StringField6: TStringField
      FieldName = 'observacoes'
      Size = 500
    end
    object IntegerField6: TIntegerField
      FieldName = 'prazo'
    end
    object FloatField6: TFloatField
      FieldName = 'totalproduto'
      DisplayFormat = '0.00'
    end
    object FloatField7: TFloatField
      FieldName = 'customediototal'
      DisplayFormat = '0.00'
    end
    object FloatField8: TFloatField
      FieldName = 'valorimposto'
      DisplayFormat = '0.00'
    end
    object FloatField9: TFloatField
      FieldName = 'lucroliquido'
      DisplayFormat = '0.00'
    end
    object FloatField10: TFloatField
      FieldName = 'perclucroliquido'
      DisplayFormat = '0.00'
    end
    object StringField7: TStringField
      FieldName = 'situacao_licitacao'
      Size = 10
    end
  end
end
