inherited dtmConsultaLicitacoes: TdtmConsultaLicitacoes
  OldCreateOrder = False
  Left = 548
  Top = 256
  Height = 453
  Width = 610
  object qryConsultaLicitacoes: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryConsultaLicitacoesAfterOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'ListaCondicoesVendedores'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaCondicoesProdutos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaCondicoesClientes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SituacaoLicitacao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select l.numero,'
      '       l.cliente,'
      '       cl.nome as nomecliente,'
      '       cl.estado as UFCliente,'
      '       l.vendedor,'
      '       u.nome as nomevendedor,'
      '       l.datavenda,'
      '       l.vigencia,'
      '       lc.numero,'
      '       p.codigovisual as produtovisual,'
      '       p.descricao as produtodescricao,'
      '       '
      '       lc.quantidade,'
      '       lc.preco,'
      '       lc.aliquotaipi,'
      '       lc.valoripi,'
      '       lc.valordesconto,'
      ''
      
        '       (lc.quantidade * lc.preco) + coalesce(lc.valoripi,0) - co' +
        'alesce(lc.valordesconto,0)as TotalProduto,'
      ''
      
        '       Nullif(produtos_licitacoes_entregues(lc.licitacao, lc.pro' +
        'duto, lc.numero),0) as QuantidadeNotaFiscal,'
      ''
      
        '       (produtos_licitacoes_entregues(lc.licitacao, lc.produto, ' +
        'lc.numero) * lc.preco) +'
      '       '
      #9'   ((coalesce(lc.valoripi,0)/lc.quantidade) *'
      
        '         produtos_licitacoes_entregues(lc.licitacao, lc.produto,' +
        ' lc.numero)'
      '        ) -'
      #9#9
      #9'   ((coalesce(lc.valordesconto,0)/lc.quantidade) *'
      
        '         produtos_licitacoes_entregues(lc.licitacao, lc.produto,' +
        ' lc.numero)'
      '        ) as TotalProdutoEntregue,'
      ''
      
        '       lc.quantidade - produtos_licitacoes_entregues(lc.licitaca' +
        'o, lc.produto, lc.numero) as QuantidadePendente,'
      ''
      
        '       ((lc.quantidade - produtos_licitacoes_entregues(lc.licita' +
        'cao, lc.produto, lc.numero)) * lc.preco) +'
      '       ((coalesce(lc.valoripi,0)/lc.quantidade) *'
      
        '         (lc.quantidade - produtos_licitacoes_entregues(lc.licit' +
        'acao, lc.produto, lc.numero))'
      '        ) -'
      #9#9
      '       ((coalesce(lc.valordesconto,0)/lc.quantidade) *'
      
        '         (lc.quantidade - produtos_licitacoes_entregues(lc.licit' +
        'acao, lc.produto, lc.numero))'
      '        ) as TotalProdutoPendente,'
      ''
      '       situacao_licitacao(l.numero) as situacao_licitacao'
      ''
      ''
      'from licitacoes l'
      '     join clientes cl'
      '     on l.cliente = cl.codigo'
      '     '
      '     join usuarios u'
      '     on l.vendedor = u.codigo'
      '     '
      '     join licitacoesprodutos lc'
      '          join produtos p'
      '          on lc.produto = p.codigo'
      '     on l.numero = lc.licitacao'
      ''
      'where  TRUE and'
      '  case when :DataInicialVenda<>'#39#39'  and'
      '            :DataFinalVenda<>'#39#39' then'
      
        '        l.DataVenda between Cast(NullIf(:DataInicialVenda,'#39#39') as' +
        ' date) and Cast(NullIf(:DataFinalVenda,'#39#39') as date)'
      ''
      '       when :DataInicialVenda<>'#39#39' and'
      '            :DataFinalVenda='#39#39' then'
      
        '        l.DataVenda >= Cast(NullIf(:DataInicialVenda,'#39#39') as date' +
        ')'
      ''
      '       when :DataInicialVenda='#39#39' and'
      '            :DataFinalVenda<>'#39#39' then'
      '        l.DataVenda <= Cast(NullIf(:DataFinalVenda,'#39#39') as date)'
      '        else true'
      '  end'
      ''
      '  and'
      ''
      ''
      '  case when :DataInicialVigencia<>'#39#39'  and'
      '            :DataFinalVigencia<>'#39#39' then'
      
        '        l.Vigencia between Cast(NullIf(:DataInicialVigencia,'#39#39') ' +
        'as date) and Cast(NullIf(:DataFinalVigencia,'#39#39') as date)'
      ''
      '       when :DataInicialVigencia<>'#39#39' and'
      '            :DataFinalVigencia='#39#39' then'
      
        '        l.Vigencia >= Cast(NullIf(:DataInicialVigencia,'#39#39') as da' +
        'te)'
      ''
      '       when :DataInicialVigencia='#39#39' and'
      '            :DataFinalVigencia<>'#39#39' then'
      
        '        l.Vigencia <= Cast(NullIf(:DataFinalVigencia,'#39#39') as date' +
        ')'
      '        else true'
      '  end'
      ''
      ''
      '  /*'
      '  case when :Aberto and not :Vencido then'
      '            coalesce(l.vigencia,current_date) >= current_date'
      '       when not :Aberto and :Vencido then'
      '            coalesce(l.vigencia,current_date) < current_date'
      '       else true'
      '  end'
      '  */'
      ''
      '  %ListaCondicoesVendedores'
      '  %ListaCondicoesProdutos'
      '  %ListaCondicoesClientes'
      '  %SituacaoLicitacao'
      ''
      'order by l.datavenda, l.numero'
      ''
      ''
      '/*'
      ''
      '  :DataInicialVenda DataInicialVenda'
      '  :DataFinalVenda DataFinalVenda'
      '  :DataInicialVigencia DataInicialVigencia'
      '  :DataFinalVigencia DataFinalVigencia'
      '  :Aberto Aberto'
      '  :Vencido Vencido'
      ''
      '*/')
    RequestLive = False
    Left = 64
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'DataInicialVenda'
        ParamType = ptUnknown
        Value = '2022-01-01'
      end
      item
        DataType = ftUnknown
        Name = 'DataFinalVenda'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicialVigencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataFinalVigencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Aberto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Vencido'
        ParamType = ptUnknown
      end>
    object qryConsultaLicitacoesnumero: TIntegerField
      FieldName = 'numero'
      Required = True
    end
    object qryConsultaLicitacoescliente: TIntegerField
      FieldName = 'cliente'
    end
    object qryConsultaLicitacoesnomecliente: TStringField
      FieldName = 'nomecliente'
      Required = True
      Size = 60
    end
    object qryConsultaLicitacoesufcliente: TStringField
      FieldName = 'ufcliente'
      Required = True
      Size = 2
    end
    object qryConsultaLicitacoesvendedor: TIntegerField
      FieldName = 'vendedor'
    end
    object qryConsultaLicitacoesnomevendedor: TStringField
      FieldName = 'nomevendedor'
      Required = True
      Size = 100
    end
    object qryConsultaLicitacoesdatavenda: TDateField
      Alignment = taCenter
      FieldName = 'datavenda'
      EditMask = '99/99/9999;1; '
    end
    object qryConsultaLicitacoesvigencia: TDateField
      Alignment = taCenter
      FieldName = 'vigencia'
      EditMask = '99/99/9999;1; '
    end
    object qryConsultaLicitacoesprodutovisual: TStringField
      FieldName = 'produtovisual'
      Required = True
      Size = 30
    end
    object qryConsultaLicitacoesprodutodescricao: TStringField
      FieldName = 'produtodescricao'
      Required = True
      Size = 100
    end
    object qryConsultaLicitacoesquantidade: TFloatField
      FieldName = 'quantidade'
      DisplayFormat = '0.00'
    end
    object qryConsultaLicitacoespreco: TFloatField
      FieldName = 'preco'
      DisplayFormat = '0.00'
    end
    object qryConsultaLicitacoestotalproduto: TFloatField
      FieldName = 'totalproduto'
      DisplayFormat = '0.00'
    end
    object qryConsultaLicitacoesquantidadenotafiscal: TFloatField
      FieldName = 'quantidadenotafiscal'
      DisplayFormat = '0.00'
    end
    object qryConsultaLicitacoestotalprodutoentregue: TFloatField
      FieldName = 'totalprodutoentregue'
      DisplayFormat = '0.00'
    end
    object qryConsultaLicitacoesquantidadependente: TFloatField
      FieldName = 'quantidadependente'
      DisplayFormat = '0.00'
    end
    object qryConsultaLicitacoestotalprodutopendente: TFloatField
      FieldName = 'totalprodutopendente'
      DisplayFormat = '0.00'
    end
    object qryConsultaLicitacoessituacao_licitacao: TStringField
      FieldName = 'situacao_licitacao'
      Size = 7
    end
    object qryConsultaLicitacoesaliquotaipi: TFloatField
      FieldName = 'aliquotaipi'
    end
    object qryConsultaLicitacoesvaloripi: TFloatField
      FieldName = 'valoripi'
    end
    object qryConsultaLicitacoesvalordesconto: TFloatField
      FieldName = 'valordesconto'
    end
  end
  object dsrConsultaLicitacoes: TtecDataSource
    DataSet = qryConsultaLicitacoes
    Left = 152
    Top = 48
  end
end
