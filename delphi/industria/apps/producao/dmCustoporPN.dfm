inherited dtmCustoporPN: TdtmCustoporPN
  OldCreateOrder = False
  Left = 643
  Top = 260
  Height = 542
  Width = 545
  object qryClientesProdutos: TtecQuery
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
      
        'select p.codigo, cp.pn, cp.cliente, cp.tipocliente, vf.razao, cp' +
        '.produto_cliente,'
      '       cp.finalidade, cp.fluxograma, cp.tamloteproducao,'
      
        '       cp.excedentepermitido, cp.tipoexcedente, cp.origem, cp.re' +
        'visao,'
      
        '       p.codigovisual, coalesce(p.descricaoplanilhacusto,p.descr' +
        'icao) as descricao, c.setorproducao,'
      '       cp.embalagem_pri, cp.qttabuleiro_pri,'
      '       cp.tabuleiro_pri, cp.qtcaixa_pri,'
      ''
      '       cp.embalagem_ter, cp.qttabuleiro_ter,'
      '       cp.tabuleiro_ter, cp.qtcaixa_ter,'
      ''
      '       (select pe.codigovisual'
      '        from produtos pe'
      
        '        where pe.codigo = cp.embalagem_pri) as embalagemvisual_p' +
        'ri,'
      ''
      '       (select pe.codigovisual'
      '        from produtos pe'
      
        '        where pe.codigo = cp.embalagem_ter) as embalagemvisual_t' +
        'er,'
      '/*'
      '       (select pe.descricao'
      '        from produtos pe'
      
        '        where pe.codigo = cp.embalagem_pri) as descricaoembalage' +
        'mvisual_pri,'
      '*/'
      ''
      '       (select pe.codigovisual'
      '        from produtos pe'
      
        '        where pe.codigo = cp.tabuleiro_pri) as tabuleirovisual_p' +
        'ri,'
      ''
      '       (select pe.codigovisual'
      '        from produtos pe'
      
        '        where pe.codigo = cp.tabuleiro_ter) as tabuleirovisual_t' +
        'er,'
      ''
      '/*'
      '       (select pe.descricao'
      '        from produtos pe'
      
        '        where pe.codigo = cp.tabuleiro_pri) as descricaotabuleir' +
        'ovisual_pri,'
      '*/'
      '       cp.embalagem_pri_contadocliente,'
      '       cp.tabuleiro_pri_contadocliente,'
      ''
      '       cp.embalagem_ter_contadocliente,'
      '       cp.tabuleiro_ter_contadocliente,'
      ''
      '       coalesce((select m.valormoeda'
      '        from movimentos m'
      '        where m.produto = cp.embalagem_pri'
      '          and m.filial = :filialbase'
      '          and coalesce(m.valormoeda,0)<>0'
      
        '        order by m.data desc, m.lancto desc limit 1),0) as valor' +
        'moedaembalagem,'
      ''
      '      coalesce((select m.valormoeda'
      '        from movimentos m'
      '        where m.produto = cp.embalagem_ter'
      '          and m.filial = :filialbase'
      '          and coalesce(m.valormoeda,0)<>0'
      
        '        order by m.data desc, m.lancto desc limit 1),0) as valor' +
        'moedaembalagempallet,'
      ''
      '       (select mc.cotacao'
      '        from moedascotacoes mc'
      '        where mc.moeda =   '#39'EURO'#39
      '          and coalesce(mc.cotacao,0)<>0'
      '        order by mc.data desc limit 1) as CotacaoEuro,'
      ''
      '       (select mc.data'
      '        from moedascotacoes mc'
      '        where mc.moeda =   '#39'EURO'#39
      '          and coalesce(mc.cotacao,0)<>0'
      '        order by mc.data desc limit 1) as DataCotacaoEuro,'
      ''
      ''
      '       (select mc.cotacao'
      '        from moedascotacoes mc'
      '        where mc.moeda =   (select m.moeda'
      '                            from movimentos m'
      '                            where m.produto = cp.embalagem_pri'
      '                              and m.filial = :filialbase'
      '                              and coalesce(m.valormoeda,0)<>0'
      
        '                            order by m.data desc, m.lancto desc ' +
        'limit 1)'
      '          and coalesce(mc.cotacao,0)<>0'
      '        order by mc.data desc limit 1) as cotacaoembalagem,'
      ''
      '       (select mc.cotacao'
      '        from moedascotacoes mc'
      '        where mc.moeda =   (select m.moeda'
      '                            from movimentos m'
      '                            where m.produto = cp.embalagem_ter'
      '                              and m.filial = :filialbase'
      '                              and coalesce(m.valormoeda,0)<>0'
      
        '                            order by m.data desc, m.lancto desc ' +
        'limit 1)'
      '          and coalesce(mc.cotacao,0)<>0'
      
        '        order by mc.data desc limit 1) as cotacaoembalagempallet' +
        ','
      ''
      '       coalesce((select m.valormoeda'
      '        from movimentos m'
      '        where m.produto = cp.tabuleiro_pri'
      '          and m.filial = :filialbase'
      '          and coalesce(m.valormoeda,0)<>0'
      
        '        order by m.data desc, m.lancto desc limit 1),0) as valor' +
        'moedatabuleiro,'
      ''
      '       coalesce((select m.valormoeda'
      '        from movimentos m'
      '        where m.produto = cp.tabuleiro_ter'
      '          and m.filial = :filialbase'
      '          and coalesce(m.valormoeda,0)<>0'
      
        '        order by m.data desc, m.lancto desc limit 1),0) as valor' +
        'moedatabuleiropallet,'
      ''
      '       (select mc.cotacao'
      '        from moedascotacoes mc'
      '        where mc.moeda =   (select m.moeda'
      '                            from movimentos m'
      '                            where m.produto = cp.tabuleiro_pri'
      '                              and m.filial = :filialbase'
      '                              and coalesce(m.valormoeda,0)<>0'
      
        '                            order by m.data desc, m.lancto desc ' +
        'limit 1)'
      '          and coalesce(mc.cotacao,0)<>0'
      '        order by mc.data desc limit 1) as cotacaotabuleiro,'
      ''
      '       (select mc.cotacao'
      '        from moedascotacoes mc'
      '        where mc.moeda =   (select m.moeda'
      '                            from movimentos m'
      '                            where m.produto = cp.tabuleiro_ter'
      '                              and m.filial = :filialbase'
      '                              and coalesce(m.valormoeda,0)<>0'
      
        '                            order by m.data desc, m.lancto desc ' +
        'limit 1)'
      '          and coalesce(mc.cotacao,0)<>0'
      '        order by mc.data desc limit 1) as cotacaotabuleiropallet'
      ''
      'from caracteristicas c'
      '     join produtos p'
      '          join clientesprodutos cp'
      '               join vfornecedores vf'
      '               on vf.codigo = cp.cliente'
      '               and vf.tipo = cp.tipocliente'
      '          on p.codigo = cp.produto'
      '     on c.codigo = p.caracteristica'
      ''
      'where /*((c.Inativo IS NULL) OR (c.Inativo >= CURRENT_DATE)) AND'
      '       (SomenteNumero(cp.PN) < 9000) AND'
      '       (exists (select pc.composto'
      '               from produtoscompostos pc'
      '               where pc.composto = p.codigo) or'
      ''
      '       exists (select pcfi.composto'
      '               from produtoscompostosfios pcfi'
      '               where pcfi.composto = p.codigo) or'
      ''
      '       exists (select pcft.composto'
      '               from produtoscompostosfitas pcft'
      '               where pcft.composto = p.codigo))'
      ''
      ''
      '  and */ cp.cliente = :cliente'
      '  and cp.tipocliente = :tipocliente'
      '  and p.codigo = :produto'
      ''
      'order by SomenteNumero(cp.pn), cp.produto_cliente'
      '')
    RequestLive = False
    Left = 56
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filialbase'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'tipocliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qryClientesProdutoscodigo: TLargeintField
      FieldName = 'codigo'
    end
    object qryClientesProdutospn: TStringField
      FieldName = 'pn'
      Size = 10
    end
    object qryClientesProdutoscliente: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object qryClientesProdutosrazao: TStringField
      FieldName = 'razao'
      Size = 60
    end
    object qryClientesProdutostipocliente: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
    object qryClientesProdutosproduto_cliente: TStringField
      FieldName = 'produto_cliente'
      Size = 30
    end
    object qryClientesProdutosfinalidade: TStringField
      FieldName = 'finalidade'
      Size = 30
    end
    object qryClientesProdutosfluxograma: TIntegerField
      FieldName = 'fluxograma'
      DisplayFormat = '0'
    end
    object qryClientesProdutostamloteproducao: TIntegerField
      FieldName = 'tamloteproducao'
      DisplayFormat = '0'
    end
    object qryClientesProdutosexcedentepermitido: TIntegerField
      FieldName = 'excedentepermitido'
      DisplayFormat = '0'
    end
    object qryClientesProdutostipoexcedente: TStringField
      FieldName = 'tipoexcedente'
      Size = 1
    end
    object qryClientesProdutosorigem: TStringField
      FieldName = 'origem'
      Size = 1
    end
    object qryClientesProdutosrevisao: TStringField
      FieldName = 'revisao'
      Size = 5
    end
    object qryClientesProdutoscodigovisual: TStringField
      FieldName = 'codigovisual'
      Required = True
      Size = 30
    end
    object qryClientesProdutosdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 50
    end
    object qryClientesProdutossetorproducao: TStringField
      FieldName = 'setorproducao'
      Size = 4
    end
    object qryClientesProdutosembalagem_pri: TLargeintField
      FieldName = 'embalagem_pri'
    end
    object qryClientesProdutosqttabuleiro_pri: TIntegerField
      FieldName = 'qttabuleiro_pri'
      DisplayFormat = '0'
    end
    object qryClientesProdutostabuleiro_pri: TLargeintField
      FieldName = 'tabuleiro_pri'
    end
    object qryClientesProdutosqtcaixa_pri: TIntegerField
      FieldName = 'qtcaixa_pri'
      DisplayFormat = '0'
    end
    object qryClientesProdutosvalormoedaembalagem: TFloatField
      FieldName = 'valormoedaembalagem'
      DisplayFormat = '0.00'
    end
    object qryClientesProdutoscotacaoembalagem: TFloatField
      FieldName = 'cotacaoembalagem'
      DisplayFormat = '0.00'
    end
    object qryClientesProdutosvalormoedatabuleiro: TFloatField
      FieldName = 'valormoedatabuleiro'
      DisplayFormat = '0.00'
    end
    object qryClientesProdutoscotacaotabuleiro: TFloatField
      FieldName = 'cotacaotabuleiro'
      DisplayFormat = '0.00'
    end
    object qryClientesProdutosembalagemvisual_pri: TStringField
      FieldName = 'embalagemvisual_pri'
      Size = 50
    end
    object qryClientesProdutostabuleirovisual_pri: TStringField
      FieldName = 'tabuleirovisual_pri'
      Size = 50
    end
    object qryClientesProdutoscotacaoeuro: TFloatField
      FieldName = 'cotacaoeuro'
      DisplayFormat = '0.00'
    end
    object qryClientesProdutosdatacotacaoeuro: TDateField
      Alignment = taCenter
      FieldName = 'datacotacaoeuro'
      EditMask = '99/99/9999;1; '
    end
    object qryClientesProdutosembalagem_pri_contadocliente: TBooleanField
      FieldName = 'embalagem_pri_contadocliente'
    end
    object qryClientesProdutostabuleiro_pri_contadocliente: TBooleanField
      FieldName = 'tabuleiro_pri_contadocliente'
    end
    object qryClientesProdutosembalagem_ter: TLargeintField
      FieldName = 'embalagem_ter'
    end
    object qryClientesProdutosqttabuleiro_ter: TIntegerField
      FieldName = 'qttabuleiro_ter'
    end
    object qryClientesProdutostabuleiro_ter: TLargeintField
      FieldName = 'tabuleiro_ter'
    end
    object qryClientesProdutosqtcaixa_ter: TIntegerField
      FieldName = 'qtcaixa_ter'
    end
    object qryClientesProdutosvalormoedaembalagempallet: TFloatField
      FieldName = 'valormoedaembalagempallet'
    end
    object qryClientesProdutoscotacaoembalagempallet: TFloatField
      FieldName = 'cotacaoembalagempallet'
    end
    object qryClientesProdutosvalormoedatabuleiropallet: TFloatField
      FieldName = 'valormoedatabuleiropallet'
    end
    object qryClientesProdutoscotacaotabuleiropallet: TFloatField
      FieldName = 'cotacaotabuleiropallet'
    end
    object qryClientesProdutosembalagemvisual_ter: TStringField
      FieldName = 'embalagemvisual_ter'
      Size = 50
    end
    object qryClientesProdutostabuleirovisual_ter: TStringField
      FieldName = 'tabuleirovisual_ter'
      Size = 50
    end
    object qryClientesProdutosembalagem_ter_contadocliente: TBooleanField
      FieldName = 'embalagem_ter_contadocliente'
    end
    object qryClientesProdutostabuleiro_ter_contadocliente: TBooleanField
      FieldName = 'tabuleiro_ter_contadocliente'
    end
  end
  object qryComponenteProdutosCompostos_N1: TtecQuery
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
      'select pc.composto, pc.ordem,'
      
        '      ((pc.quantidade * pc.fatorconversao) * (1+coalesce(pc.perc' +
        'perda,0)/100.)) * 100 as QtdeCento,'
      '       pc.percperda,'
      
        '       c.unidade, pc.componente, p.codigovisual as componentevis' +
        'ual, coalesce(p.descricaoplanilhacusto,p.descricao) as descricao' +
        'componente, c.origem as origemmercadoria,'
      ''
      '       coalesce((select m.valormoeda'
      '        from movimentos m'
      '        where m.produto = p.codigo'
      '          and m.filial = :filialbase'
      '          and coalesce(m.valormoeda,0)<>0'
      
        '        order by m.data desc, m.lancto desc limit 1),0) as valor' +
        'moeda,'
      ''
      '      (select m.data'
      '        from movimentos m'
      '        where m.produto = p.codigo'
      '          and m.filial = :filialbase'
      '          and coalesce(m.valormoeda,0)<>0'
      '        order by m.data desc, m.lancto desc limit 1) as data,'
      ''
      '       (select mc.data'
      '        from moedascotacoes mc'
      '        where mc.moeda =   (select m.moeda'
      '                            from movimentos m'
      '                            where m.produto = p.codigo'
      '                              and m.filial = :filialbase'
      '                              and coalesce(m.valormoeda,0)<>0'
      
        '                            order by m.data desc, m.lancto desc ' +
        'limit 1)'
      '          and coalesce(mc.cotacao,0)<>0'
      '        order by mc.data desc limit 1) as datacotacao,'
      ''
      ''
      '       (select mc.cotacao'
      '        from moedascotacoes mc'
      '        where mc.moeda =   (select m.moeda'
      '                            from movimentos m'
      '                            where m.produto = p.codigo'
      '                              and m.filial = :filialbase'
      '                              and coalesce(m.valormoeda,0)<>0'
      
        '                            order by m.data desc, m.lancto desc ' +
        'limit 1)'
      '          and coalesce(mc.cotacao,0)<>0'
      '        order by mc.data desc limit 1) as cotacao,'
      ''
      ''
      '       (select m.moeda'
      '        from movimentos m'
      '        where m.produto = p.codigo'
      '          and m.filial = :filialbase'
      '          and coalesce(m.valormoeda,0)<>0'
      '        order by m.data desc, m.lancto desc limit 1) as moeda,'
      ''
      '        c.desmembrarcomponente,'
      '        c.composto2 as eHComposto,'
      '        pc.QuantidadeehSomatoriodosComponentes'
      ''
      ''
      ''
      'from produtoscompostos pc'
      '     join produtos p'
      '          join caracteristicas c'
      '          on p.caracteristica = c.codigo'
      '     on pc.componente = p.codigo'
      'where pc.composto = :produto'
      '  and not pc.desconsiderarcusto'
      'order by pc.composto, pc.ordem, pc.componente')
    RequestLive = False
    Left = 80
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filialbase'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qryComponenteProdutosCompostos_N1composto: TLargeintField
      FieldName = 'composto'
    end
    object qryComponenteProdutosCompostos_N1ordem: TIntegerField
      FieldName = 'ordem'
      DisplayFormat = '0'
    end
    object qryComponenteProdutosCompostos_N1unidade: TStringField
      FieldName = 'unidade'
      Size = 8
    end
    object qryComponenteProdutosCompostos_N1descricaocomponente: TStringField
      FieldName = 'descricaocomponente'
      Size = 50
    end
    object qryComponenteProdutosCompostos_N1origemmercadoria: TIntegerField
      FieldName = 'origemmercadoria'
    end
    object qryComponenteProdutosCompostos_N1valormoeda: TFloatField
      FieldName = 'valormoeda'
    end
    object qryComponenteProdutosCompostos_N1cotacao: TFloatField
      FieldName = 'cotacao'
    end
    object qryComponenteProdutosCompostos_N1moeda: TStringField
      FieldName = 'moeda'
      Size = 50
    end
    object qryComponenteProdutosCompostos_N1desmembrarcomponente: TBooleanField
      FieldName = 'desmembrarcomponente'
    end
    object qryComponenteProdutosCompostos_N1ehcomposto: TBooleanField
      FieldName = 'ehcomposto'
    end
    object qryComponenteProdutosCompostos_N1componente: TLargeintField
      FieldName = 'componente'
    end
    object qryComponenteProdutosCompostos_N1componentevisual: TStringField
      FieldName = 'componentevisual'
      Size = 30
    end
    object qryComponenteProdutosCompostos_N1percperda: TFloatField
      FieldName = 'percperda'
    end
    object qryComponenteProdutosCompostos_N1qtdecento: TFloatField
      FieldName = 'qtdecento'
    end
    object qryComponenteProdutosCompostos_N1data: TDateField
      FieldName = 'data'
    end
    object qryComponenteProdutosCompostos_N1datacotacao: TDateField
      FieldName = 'datacotacao'
    end
    object qryComponenteProdutosCompostos_N1quantidadeehsomatoriodoscomponentes: TBooleanField
      FieldName = 'quantidadeehsomatoriodoscomponentes'
    end
  end
  object qryProdutosCompostosFios: TtecQuery
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
      '   select selecao.*,'
      '       p.codigovisual,'
      
        '       coalesce(p.descricaoplanilhacusto,p.descricao) as descric' +
        'aocomponente,'
      '       c.origem as origemmercadoria,'
      ''
      '       coalesce((select m.valormoeda'
      '        from movimentos m'
      '        where m.produto = p.codigo'
      '          and m.filial = :filialbase'
      '          and coalesce(m.valormoeda,0)<>0'
      
        '        order by m.data desc, m.lancto desc limit 1),0) as valor' +
        'moeda,'
      ''
      '       coalesce((select mc.cotacao'
      '        from moedascotacoes mc'
      '        where mc.moeda =   (select m.moeda'
      '                            from movimentos m'
      '                            where m.produto = p.codigo'
      '                              and m.filial = :filialbase'
      '                              and coalesce(m.valormoeda,0)<>0'
      
        '                            order by m.data desc, m.lancto desc ' +
        'limit 1)'
      '          and coalesce(mc.cotacao,0)<>0'
      '        order by mc.data desc limit 1),0) as cotacao,'
      ''
      ''
      '      (select m.data'
      '        from movimentos m'
      '        where m.produto = p.codigo'
      '          and m.filial = :filialbase'
      '          and coalesce(m.valormoeda,0)<>0'
      '        order by m.data desc, m.lancto desc limit 1) as data,'
      ''
      '       (select mc.data'
      '        from moedascotacoes mc'
      '        where mc.moeda =   (select m.moeda'
      '                            from movimentos m'
      '                            where m.produto = p.codigo'
      '                              and m.filial = :filialbase'
      '                              and coalesce(m.valormoeda,0)<>0'
      
        '                            order by m.data desc, m.lancto desc ' +
        'limit 1)'
      '          and coalesce(mc.cotacao,0)<>0'
      '        order by mc.data desc limit 1) as datacotacao,'
      ''
      '       (select m.moeda'
      '        from movimentos m'
      '        where m.produto = p.codigo'
      '          and m.filial = :filialbase'
      '          and coalesce(m.valormoeda,0)<>0'
      '        order by m.data desc, m.lancto desc limit 1) as moeda'
      ''
      ''
      'from'
      '('
      ' select case when p.codigovisual is null then'
      ' '
      '         (select p.codigo'
      '          from caracteristicas c'
      '               join produtos p'
      '                    join estoques e'
      '                    on p.codigo = e.produto'
      '                    and e.filial = :filialbase'
      '               on c.codigo = p.caracteristica'
      ''
      
        '          where c.resistividade >= (pcfi.resistividade * (1-pcfi' +
        '.tolerancia/100.))'
      
        '            and c.resistividade <= (pcfi.resistividade * (1+pcfi' +
        '.tolerancia/100.))'
      '            and c.liga = pcfi.liga'
      '            and coalesce(e.emestoque,0)<>0'
      
        '            order by abs(pcfi.resistividade-c.resistividade) des' +
        'c'
      '          limit 1)'
      ''
      '       end as produto,'
      ''
      '       pcfi.componente as componentevisual,'
      '       pcfi.gramasporpeca,'
      '       p.codigo as componente,'
      '       pcfi.ordem'
      ''
      'from produtoscompostosfios pcfi'
      '     left join produtos p'
      '     on pcfi.componente = p.codigovisual'
      ''
      'where pcfi.composto = :produto'
      ') as selecao left join (produtos p'
      '                        join caracteristicas c'
      '                        on p.caracteristica = c.codigo)'
      '     on coalesce(selecao.componente,selecao.produto) = p.codigo'
      'order by selecao.ordem'
      ''
      ''
      ''
      '')
    RequestLive = False
    Left = 56
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filialbase'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qryProdutosCompostosFiosproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryProdutosCompostosFioscomponentevisual: TStringField
      FieldName = 'componentevisual'
    end
    object qryProdutosCompostosFiosgramasporpeca: TFloatField
      FieldName = 'gramasporpeca'
    end
    object qryProdutosCompostosFioscomponente: TLargeintField
      FieldName = 'componente'
    end
    object qryProdutosCompostosFiosordem: TIntegerField
      FieldName = 'ordem'
    end
    object qryProdutosCompostosFioscodigovisual: TStringField
      FieldName = 'codigovisual'
      Required = True
      Size = 30
    end
    object qryProdutosCompostosFiosdescricaocomponente: TStringField
      FieldName = 'descricaocomponente'
      Required = True
      Size = 50
    end
    object qryProdutosCompostosFiosorigemmercadoria: TIntegerField
      FieldName = 'origemmercadoria'
      Required = True
    end
    object qryProdutosCompostosFiosvalormoeda: TFloatField
      FieldName = 'valormoeda'
    end
    object qryProdutosCompostosFioscotacao: TFloatField
      FieldName = 'cotacao'
    end
    object qryProdutosCompostosFiosdata: TDateField
      FieldName = 'data'
    end
    object qryProdutosCompostosFiosdatacotacao: TDateField
      FieldName = 'datacotacao'
    end
    object qryProdutosCompostosFiosmoeda: TStringField
      FieldName = 'moeda'
      Size = 50
    end
  end
  object qryProdutosCompostosFitas: TtecQuery
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
      'select pcfi.*'
      'from produtoscompostosfitas pcfi'
      'where pcfi.composto = :produto'
      'order by pcfi.composto, pcfi.ordem, pcfi.componente')
    RequestLive = False
    Left = 56
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qryProdutosCompostosFitascomposto: TLargeintField
      FieldName = 'composto'
      Required = True
    end
    object qryProdutosCompostosFitascomponente: TStringField
      FieldName = 'componente'
      Required = True
    end
    object qryProdutosCompostosFitasordem: TIntegerField
      FieldName = 'ordem'
      Required = True
      DisplayFormat = '0'
    end
    object qryProdutosCompostosFitasquantidade: TFloatField
      FieldName = 'quantidade'
      DisplayFormat = '0.00'
    end
    object qryProdutosCompostosFitasespessura: TStringField
      FieldName = 'espessura'
      Size = 4
    end
    object qryProdutosCompostosFitaslargura: TStringField
      FieldName = 'largura'
      Size = 3
    end
    object qryProdutosCompostosFitasliga: TStringField
      FieldName = 'liga'
      Required = True
      Size = 3
    end
    object qryProdutosCompostosFitasnrvoltas: TIntegerField
      FieldName = 'nrvoltas'
      Required = True
      DisplayFormat = '0'
    end
    object qryProdutosCompostosFitasgramasporpeca: TFloatField
      FieldName = 'gramasporpeca'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryProdutosCompostosFitasdescricaocomponente: TStringField
      FieldName = 'descricaocomponente'
      Size = 30
    end
    object qryProdutosCompostosFitassequencia: TIntegerField
      FieldName = 'sequencia'
      Required = True
      DisplayFormat = '0'
    end
  end
  object qryComponenteProdutosCompostos_N2: TtecQuery
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
      'select pc.queima,'
      '       pc.componente,'
      '       p.codigovisual as componentevisual,'
      
        '       coalesce(p.descricaoplanilhacusto,p.descricao) as descric' +
        'aocomponente,'
      '              pc.percperda,'
      ''
      ''
      
        '       ((pc.quantidade * pc.fatorconversao) * (1+coalesce(pc.per' +
        'cperda,0)/100.)) * 100 as QtdeCento,'
      ''
      '       case when pc.queima then'
      '        coalesce((select m.valormoeda'
      '         from movimentos m'
      '         where m.produto = p.codigo'
      '           and m.filial = :filialbase'
      '           and coalesce(m.valormoeda,0)<>0'
      '           and m.tipomovimento = '#39'ENT'#39
      '         order by m.data desc, m.lancto desc limit 1),0.000000)'
      '       else'
      '         cast(null as numeric(12,6))'
      '       end as ValorMoedaMassa,'
      ''
      '       case when pc.PossuiCustoFrete then'
      '        coalesce((select m.valormoeda'
      '         from movimentos m'
      '         where m.produto = p.codigo'
      '           and m.filial = :filialbase'
      '           and coalesce(m.valormoeda,0)<>0'
      '           and m.tipomovimento = '#39'FRT'#39
      '         order by m.data desc, m.lancto desc limit 1),0.000000)'
      '       else'
      '         cast(null as numeric(12,6))'
      '       end as ValorFrete,'
      ''
      '       case when pc.queima then'
      
        '    '#9#9'cast(((select np.valornota / (select sum(pnp.quantidade) f' +
        'rom produtosnotaspag pnp where pnp.codigonota = np.codigo)'
      #9'        from notaspag np'
      #9#9'      where np.codigo = (select np.codigo'
      #9#9'                         from notaspag np'
      #9#9'                         where np.fornecedor = :fornecedorgas'
      
        #9#9'                         order by data desc limit 1)) * :qtCar' +
        'gaGas / pc.qtCeramicaCarga) as numeric(12,6))'
      '       else'
      '        cast(null as numeric(12,6))'
      '       end as ValorQueima,'
      ''
      '       case when pc.queima then'
      '        cast((coalesce((select m.valormoeda'
      '                  from movimentos m'
      '                  where m.produto = :produtoplaca'
      '                    and m.filial = :filialbase'
      '                    and coalesce(m.valormoeda,0)<>0'
      
        '         order by m.data desc, m.lancto desc limit 1),0.000000) ' +
        '*  :qtPlacasCarga *'
      ''
      '   '#9#9'   coalesce((select mc.cotacao'
      '           from moedascotacoes mc'
      '           where mc.moeda = (select m.moeda'
      '                             from movimentos m'
      '                             where m.produto = :produtoplaca'
      '                               and m.filial = :filialbase'
      '                               and coalesce(m.valormoeda,0)<>0'
      
        '                             order by m.data desc, m.lancto desc' +
        ' limit 1)'
      '            and coalesce(mc.cotacao,0)<>0'
      
        '           order by mc.data desc limit 1),0.000000) / (:CiclodeV' +
        'idadaPlaca * pc.qtCeramicaCarga )) as numeric(12,6))'
      '       else'
      '         cast(null as numeric(12,6))'
      '       end as ValorAmortizacao,'
      ''
      ''
      '       coalesce((select m.valormoeda'
      '        from movimentos m'
      '        where m.produto = p.codigo'
      '          and m.filial = :filialbase'
      '          and coalesce(m.valormoeda,0)<>0'
      
        '        order by m.data desc, m.lancto desc limit 1),0) as valor' +
        'moeda,'
      ''
      '       (select mc.cotacao'
      '        from moedascotacoes mc'
      '        where mc.moeda =   (select m.moeda'
      '                            from movimentos m'
      '                            where m.produto = p.codigo'
      '                              and m.filial = :filialbase'
      '                              and coalesce(m.valormoeda,0)<>0'
      
        '                            order by m.data desc, m.lancto desc ' +
        'limit 1)'
      '          and coalesce(mc.cotacao,0)<>0'
      '        order by mc.data desc limit 1) as cotacao,'
      ''
      ''
      '       c.origem as origemmercadoria,'
      '       c.desmembrarcomponente,'
      '       c.composto2 as eHComposto,'
      ''
      '      (select m.data'
      '        from movimentos m'
      '        where m.produto = p.codigo'
      '          and m.filial = :filialbase'
      '          and coalesce(m.valormoeda,0)<>0'
      '        order by m.data desc, m.lancto desc limit 1) as data,'
      ''
      '       (select mc.data'
      '        from moedascotacoes mc'
      '        where mc.moeda =   (select m.moeda'
      '                            from movimentos m'
      '                            where m.produto = p.codigo'
      '                              and m.filial = :filialbase'
      '                              and coalesce(m.valormoeda,0)<>0'
      
        '                            order by m.data desc, m.lancto desc ' +
        'limit 1)'
      '          and coalesce(mc.cotacao,0)<>0'
      '        order by mc.data desc limit 1) as datacotacao,'
      ''
      '       (select m.moeda'
      '        from movimentos m'
      '        where m.produto = p.codigo'
      '          and m.filial = :filialbase'
      '          and coalesce(m.valormoeda,0)<>0'
      '        order by m.data desc, m.lancto desc limit 1) as moeda,'
      '        pc.QuantidadeehSomatoriodosComponentes        '
      ''
      ''
      ''
      'from produtoscompostos pc'
      '     join produtos p'
      '          join caracteristicas c'
      '          on p.caracteristica = c.codigo'
      '     on pc.componente = p.codigo'
      'where pc.composto = :componente'
      '  and not pc.desconsiderarcusto'
      '  '
      'order by pc.composto, pc.ordem, pc.componente')
    RequestLive = False
    Left = 120
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filialbase'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fornecedorgas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'qtCargaGas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'produtoplaca'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'qtPlacasCarga'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CiclodeVidadaPlaca'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'componente'
        ParamType = ptUnknown
      end>
    object qryComponenteProdutosCompostos_N2queima: TBooleanField
      FieldName = 'queima'
    end
    object qryComponenteProdutosCompostos_N2descricaocomponente: TStringField
      FieldName = 'descricaocomponente'
      Required = True
      Size = 50
    end
    object qryComponenteProdutosCompostos_N2qtdecento: TFloatField
      FieldName = 'qtdecento'
    end
    object qryComponenteProdutosCompostos_N2valormoedamassa: TFloatField
      FieldName = 'valormoedamassa'
    end
    object qryComponenteProdutosCompostos_N2valorfrete: TFloatField
      FieldName = 'valorfrete'
    end
    object qryComponenteProdutosCompostos_N2valorqueima: TFloatField
      FieldName = 'valorqueima'
    end
    object qryComponenteProdutosCompostos_N2valoramortizacao: TFloatField
      FieldName = 'valoramortizacao'
    end
    object qryComponenteProdutosCompostos_N2valormoeda: TFloatField
      FieldName = 'valormoeda'
    end
    object qryComponenteProdutosCompostos_N2origemmercadoria: TIntegerField
      FieldName = 'origemmercadoria'
    end
    object qryComponenteProdutosCompostos_N2cotacao: TFloatField
      FieldName = 'cotacao'
    end
    object qryComponenteProdutosCompostos_N2ehcomposto: TBooleanField
      FieldName = 'ehcomposto'
    end
    object qryComponenteProdutosCompostos_N2componente: TLargeintField
      FieldName = 'componente'
    end
    object qryComponenteProdutosCompostos_N2componentevisual: TStringField
      FieldName = 'componentevisual'
      Size = 30
    end
    object qryComponenteProdutosCompostos_N2desmembrarcomponente: TBooleanField
      FieldName = 'desmembrarcomponente'
    end
    object qryComponenteProdutosCompostos_N2data: TDateField
      FieldName = 'data'
    end
    object qryComponenteProdutosCompostos_N2datacotacao: TDateField
      FieldName = 'datacotacao'
    end
    object qryComponenteProdutosCompostos_N2moeda: TStringField
      FieldName = 'moeda'
      Size = 50
    end
    object qryComponenteProdutosCompostos_N2percperda: TFloatField
      FieldName = 'percperda'
    end
    object qryComponenteProdutosCompostos_N2quantidadeehsomatoriodoscomponentes: TBooleanField
      FieldName = 'quantidadeehsomatoriodoscomponentes'
    end
  end
  object qryFluxogramas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      '/* 1'#186'. N'#205'VEL */'
      
        'select cp.fluxograma, fl.descricao, fl.titulocusto, cast(1 as in' +
        'teger) as sequencia, fl.corplanilhacusto,'
      '       sp.custohomemhora, sp.fatorcusto'
      'from clientesprodutos cp'
      '     join produtos p'
      '          join caracteristicas c'
      '               left join setoresproducao sp'
      '               on c.setorproducao = sp.codigo'
      '          on p.caracteristica = c.codigo'
      '     on cp.produto = p.codigo'
      '     join fluxogramas fl'
      '     on cp.fluxograma = fl.codigo'
      'where cp.cliente = :cliente'
      '  and cp.tipocliente = :tipocliente'
      '  and cp.produto = :produto'
      ''
      '  union all'
      ''
      '/* 2'#186'. N'#205'VEL */'
      
        'select cp.fluxograma, fl.descricao, fl.titulocusto, cast(2 as in' +
        'teger) as sequencia, fl.corplanilhacusto,'
      '       sp.custohomemhora, sp.fatorcusto'
      'from produtos p'
      '     join produtoscompostos pc'
      '     on pc.componente = p.codigo'
      ''
      '     join caracteristicas c'
      '          left join setoresproducao sp'
      '          on c.setorproducao = sp.codigo'
      '     on p.caracteristica = c.codigo'
      ''
      '     join clientesprodutos cp'
      '          join fluxogramas fl'
      '          on cp.fluxograma = fl.codigo'
      '     on p.codigo = cp.produto'
      ''
      'where pc.composto = :produto'
      
        '  and ((cp.cliente = :cliente and cp.tipocliente = :tipocliente)' +
        ' or'
      '       (cp.cliente = 1 and cp.tipocliente = '#39'L'#39'))'
      '  and pc.ExibirFluxogramaPlanilhaCusto'
      ''
      'union all  '
      ''
      ''
      '/* 3'#186'. N'#205'VEL */'
      
        'select cp.fluxograma, fl.descricao, fl.titulocusto, cast(3 as in' +
        'teger) as sequencia, fl.corplanilhacusto,'
      '       sp.custohomemhora, sp.fatorcusto'
      'from produtos p'
      '     join produtoscompostos pc3'
      '     on pc3.componente = p.codigo'
      ''
      '     join caracteristicas c'
      '          left join setoresproducao sp'
      '          on c.setorproducao = sp.codigo'
      '     on p.caracteristica = c.codigo'
      ''
      '     join clientesprodutos cp'
      '          join fluxogramas fl'
      '          on cp.fluxograma = fl.codigo'
      '     on p.codigo = cp.produto'
      ''
      'where pc3.composto in (select pc2.componente'
      '                       from produtoscompostos pc2'
      '                       where pc2.composto = :produto)'
      
        '  and ((cp.cliente = :cliente and cp.tipocliente = :tipocliente)' +
        ' or'
      '       (cp.cliente = 1 and cp.tipocliente = '#39'L'#39'))'
      '  and pc3.ExibirFluxogramaPlanilhaCusto'
      ''
      ''
      ''
      'order by sequencia')
    RequestLive = False
    Left = 200
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipocliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qryFluxogramasfluxograma: TIntegerField
      FieldName = 'fluxograma'
      DisplayFormat = '0'
    end
    object qryFluxogramasdescricao: TStringField
      FieldName = 'descricao'
      Size = 40
    end
    object qryFluxogramassequencia: TIntegerField
      FieldName = 'sequencia'
      DisplayFormat = '0'
    end
    object qryFluxogramastitulocusto: TStringField
      FieldName = 'titulocusto'
      Size = 50
    end
    object qryFluxogramascustohomemhora: TFloatField
      FieldName = 'custohomemhora'
      DisplayFormat = '0.00'
    end
    object qryFluxogramasfatorcusto: TFloatField
      FieldName = 'fatorcusto'
      DisplayFormat = '0.00'
    end
    object qryFluxogramascorplanilhacusto: TStringField
      FieldName = 'corplanilhacusto'
    end
  end
  object dsrFluxogramas: TtecDataSource
    DataSet = qryFluxogramas
    Left = 240
    Top = 352
  end
  object qryFluxogramasOperacoes: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 'fluxograma=fluxograma'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrFluxogramas
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select fo.*,'
      '       op.nome,'
      '       op.c01,'
      '       op.c02,'
      '       op.c03,'
      '       op.descricao as descricaooperacao,'
      ''
      '       TempoPadrao(op.Codigo, CURRENT_DATE) AS TempoPadrao,'
      ''
      '       cast(case when fo.tipooperacao = '#39'A'#39'  then '#39'A'#39
      '       else case when (select fo2.tipooperacao'
      '                       from fluxogramasoperacoes fo2'
      '                       where fo2.fluxograma = fo.fluxograma'
      
        '                         and cast(fo2.sequencia as numeric) > ca' +
        'st(fo.sequencia as numeric)'
      
        '                       order by cast(fo2.sequencia as numeric) l' +
        'imit 1) = '#39'A'#39' then '#39'A'#39' else '#39' '#39' end end ||'
      #9#9#9#9#9
      '       case when fo.operacaoconjugada then '#39'C'#39
      '       else case when coalesce((select fo2.Operacaoconjugada'
      '                                from fluxogramasoperacoes fo2'
      
        '                                where fo2.fluxograma = fo.fluxog' +
        'rama'
      
        '                                  and cast(fo2.sequencia as nume' +
        'ric) > cast(fo.sequencia as numeric)'
      
        '                                  order by cast(fo2.sequencia as' +
        ' numeric) limit 1),false) then '#39'c'#39
      '       else case when fo.OperacaoemGrupoComAnterior then '#39'G'#39
      
        '       else case when coalesce((select fo2.OperacaoemGrupoComAnt' +
        'erior'
      '                                from fluxogramasoperacoes fo2'
      
        '                                where fo2.fluxograma = fo.fluxog' +
        'rama'
      
        '                                  and cast(fo2.sequencia as nume' +
        'ric) > cast(fo.sequencia as numeric)'
      
        '                                  order by cast(fo2.sequencia as' +
        ' numeric) limit 1),false) then '#39'g'#39' else '#39' '#39' end end end end ||'
      #9#9#9#9#9#9#9#9
      
        '       case when coalesce(fo.informarterminodoprocesso,false) th' +
        'en '#39'T'#39' else '#39' '#39' end as varchar(3)) as tipo,'
      '       '
      #9'   fo_mediatempopadrao.mediatempopadrao'
      ''
      ''
      'from fluxogramasoperacoes fo'
      '     join operacoes op'
      '     on fo.operacao = op.codigo'
      #9
      #9
      #9' left join'#9
      #9' ('
      
        #9'   select fluxograma, min(sequencia) as sequencia, origemoperac' +
        'ao, avg(tempopadrao) as mediatempopadrao'
      '       from'
      '       ('#9
      #9#9'select fo.fluxograma,'
      '               cast(fo.sequencia as numeric) as sequencia,'
      
        '               case when fo.origemoperacaoalternativa is not nul' +
        'l then'
      '   '#9#9#9#9#9#9' fo.origemoperacaoalternativa'
      '  '#9#9#9'   else fo.operacao'
      '    '#9#9'   end as origemoperacao,'
      #9#9
      '           TempoPadrao(fo.Operacao, CURRENT_DATE) AS TempoPadrao'
      #9#9#9
      #9#9'from fluxogramasoperacoes fo'
      #9#9'where fo.custo'
      #9#9'  and fo.fluxograma in'
      #9#9'('
      #9#9
      #9#9'select cp.fluxograma'
      #9#9'from clientesprodutos cp'
      #9#9#9' join fluxogramas fl'
      #9#9#9' on cp.fluxograma = fl.codigo'
      #9#9'where cp.cliente = :cliente'
      #9#9'  and cp.tipocliente = :tipocliente'
      #9#9'  and cp.produto = :produto'
      ''
      #9#9'  union all'
      ''
      #9#9'select cp.fluxograma'
      #9#9'from produtos p'
      #9#9#9' join produtoscompostos pc'
      #9#9#9' on pc.componente = p.codigo'
      ''
      #9#9#9' join clientesprodutos cp'
      #9#9#9#9'  join fluxogramas fl'
      #9#9#9#9'  on cp.fluxograma = fl.codigo'
      #9#9#9' on p.codigo = cp.produto'
      ''
      #9#9'where pc.composto = :produto'
      
        #9#9'  and ((cp.cliente = :cliente and cp.tipocliente = :tipoclient' +
        'e) or'
      #9#9#9'   (cp.cliente = 1 and cp.tipocliente = '#39'L'#39'))'
      #9#9#9'   '
      #9#9#9'   '
      #9#9'union all'
      ''
      #9#9'select cp.fluxograma'
      '        from produtos p'
      '        join produtoscompostos pc3'
      '        on pc3.componente = p.codigo'
      ''
      '        join clientesprodutos cp'
      '            join fluxogramas fl'
      '            on cp.fluxograma = fl.codigo'
      '        on p.codigo = cp.produto'
      ''
      '        where pc3.composto in (select pc2.componente'
      '                              from produtoscompostos pc2'
      '                              where pc2.composto = :produto)'
      
        '        and ((cp.cliente = :cliente and cp.tipocliente = :tipocl' +
        'iente) or'
      '             (cp.cliente = 1 and cp.tipocliente = '#39'L'#39'))'
      '        and pc3.ExibirFluxogramaPlanilhaCusto'
      #9#9#9#9
      #9#9')'
      #9
      #9'   ) as fo_mediatempopadrao'#9
      #9'   group by fluxograma, origemoperacao'#9
      #9' ) as fo_mediatempopadrao'
      
        #9' on fo.fluxograma = fo_mediatempopadrao.fluxograma and cast(fo.' +
        'sequencia as numeric) = fo_mediatempopadrao.sequencia'
      ' '#9
      #9
      'where fo.custo'
      '  and fo.fluxograma in'
      '('
      ''
      'select cp.fluxograma'
      'from clientesprodutos cp'
      '     join fluxogramas fl'
      '     on cp.fluxograma = fl.codigo'
      'where cp.cliente = :cliente'
      '  and cp.tipocliente = :tipocliente'
      '  and cp.produto = :produto'
      ''
      '  union all'
      ''
      'select cp.fluxograma'
      'from produtos p'
      '     join produtoscompostos pc'
      '     on pc.componente = p.codigo'
      ''
      '     join clientesprodutos cp'
      '          join fluxogramas fl'
      '          on cp.fluxograma = fl.codigo'
      '     on p.codigo = cp.produto'
      #9#9
      'where pc.composto = :produto'
      
        '  and ((cp.cliente = :cliente and cp.tipocliente = :tipocliente)' +
        ' or'
      '       (cp.cliente = 1 and cp.tipocliente = '#39'L'#39'))'
      '  and pc.ExibirFluxogramaPlanilhaCusto'
      #9'   '
      #9'   '
      '   union all'
      ''
      'select cp.fluxograma'
      ' from produtos p'
      ' join produtoscompostos pc3'
      '   on pc3.componente = p.codigo'
      ''
      ' join clientesprodutos cp'
      '      join fluxogramas fl'
      '      on cp.fluxograma = fl.codigo'
      '   on p.codigo = cp.produto'
      ''
      ' where pc3.composto in (select pc2.componente'
      '                        from produtoscompostos pc2'
      '                        where pc2.composto = :produto)'
      
        '  and ((cp.cliente = :cliente and cp.tipocliente = :tipocliente)' +
        ' or'
      '       (cp.cliente = 1 and cp.tipocliente = '#39'L'#39'))'
      '  and pc3.ExibirFluxogramaPlanilhaCusto'
      '  '
      ')'#9
      ''
      'order by fo.fluxograma, cast(fo.sequencia as numeric)')
    RequestLive = False
    Left = 368
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipocliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qryFluxogramasOperacoesfluxograma: TIntegerField
      FieldName = 'fluxograma'
      DisplayFormat = '0'
    end
    object qryFluxogramasOperacoesoperacao: TIntegerField
      FieldName = 'operacao'
      DisplayFormat = '0'
    end
    object qryFluxogramasOperacoessequencia: TStringField
      FieldName = 'sequencia'
      Size = 6
    end
    object qryFluxogramasOperacoestipooperacao: TStringField
      FieldName = 'tipooperacao'
      Size = 1
    end
    object qryFluxogramasOperacoesorigemoperacaoalternativa: TIntegerField
      FieldName = 'origemoperacaoalternativa'
      DisplayFormat = '0'
    end
    object qryFluxogramasOperacoesoperacaoemgrupocomanterior: TBooleanField
      FieldName = 'operacaoemgrupocomanterior'
    end
    object qryFluxogramasOperacoesinformarterminodoprocesso: TBooleanField
      FieldName = 'informarterminodoprocesso'
    end
    object qryFluxogramasOperacoesoperacaoconjugada: TBooleanField
      FieldName = 'operacaoconjugada'
    end
    object qryFluxogramasOperacoespercentualoperador: TFloatField
      FieldName = 'percentualoperador'
      DisplayFormat = '0.00'
    end
    object qryFluxogramasOperacoesdescricaooperacao: TStringField
      FieldName = 'descricaooperacao'
      Size = 60
    end
    object qryFluxogramasOperacoestempopadrao: TFloatField
      FieldName = 'tempopadrao'
      DisplayFormat = '0.00'
    end
    object qryFluxogramasOperacoestipo: TStringField
      FieldName = 'tipo'
      Size = 3
    end
    object qryFluxogramasOperacoesnome: TStringField
      FieldName = 'nome'
      Size = 10
    end
    object qryFluxogramasOperacoesc01: TStringField
      FieldName = 'c01'
      Size = 2
    end
    object qryFluxogramasOperacoesc02: TStringField
      FieldName = 'c02'
      Size = 2
    end
    object qryFluxogramasOperacoesc03: TStringField
      FieldName = 'c03'
      Size = 2
    end
    object qryFluxogramasOperacoescusto: TBooleanField
      FieldName = 'custo'
    end
    object qryFluxogramasOperacoesmediatempopadrao: TFloatField
      FieldName = 'mediatempopadrao'
      DisplayFormat = '0.00'
    end
  end
  object qryParametrosProducao: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select pp.*,'
      '          (select c.origem'
      '           from caracteristicas c'
      '           where c.codigo = (select p.caracteristica'
      '                             from produtos p'
      
        '                             where p.codigo  = pp.produtoplaca))' +
        ' as origemmercadoriaplaca'
      'from parametrosproducao pp')
    RequestLive = False
    Left = 200
    Top = 232
    object qryParametrosProducaoqtcargagas: TIntegerField
      FieldName = 'qtcargagas'
    end
    object qryParametrosProducaofornecedorgas: TIntegerField
      FieldName = 'fornecedorgas'
    end
    object qryParametrosProducaoprodutoplaca: TLargeintField
      FieldName = 'produtoplaca'
    end
    object qryParametrosProducaoqtplacascarga: TIntegerField
      FieldName = 'qtplacascarga'
    end
    object qryParametrosProducaociclodevidadaplaca: TIntegerField
      FieldName = 'ciclodevidadaplaca'
    end
    object qryParametrosProducaoperccustoadimpprod: TFloatField
      FieldName = 'perccustoadimpprod'
    end
    object qryParametrosProducaoperccustoestoque: TFloatField
      FieldName = 'perccustoestoque'
    end
    object qryParametrosProducaoperccustoadimpgeral: TFloatField
      FieldName = 'perccustoadimpgeral'
    end
    object qryParametrosProducaopercmargemlucro: TFloatField
      FieldName = 'percmargemlucro'
    end
    object qryParametrosProducaoperccustovenda: TFloatField
      FieldName = 'perccustovenda'
    end
    object qryParametrosProducaoperccustoadm: TFloatField
      FieldName = 'perccustoadm'
    end
    object qryParametrosProducaoperccustodesenv: TFloatField
      FieldName = 'perccustodesenv'
    end
    object qryParametrosProducaoorigemmercadoriaplaca: TIntegerField
      FieldName = 'origemmercadoriaplaca'
    end
  end
  object qryComponenteProdutosCompostos_N3: TtecQuery
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
      'select pc.composto, pc.ordem,'
      '       pc.percperda,'
      
        '      ((pc.quantidade * pc.fatorconversao) * (1+coalesce(pc.perc' +
        'perda,0)/100.)) * 100 as QtdeCento,'
      
        '       c.unidade, pc.componente, p.codigovisual as componentevis' +
        'ual, coalesce(p.descricaoplanilhacusto,p.descricao) as descricao' +
        'componente, c.origem as origemmercadoria,'
      ''
      '       coalesce((select m.valormoeda'
      '        from movimentos m'
      '        where m.produto = p.codigo'
      '          and m.filial = :filialbase'
      '          and coalesce(m.valormoeda,0)<>0'
      
        '        order by m.data desc, m.lancto desc limit 1),0) as valor' +
        'moeda,'
      ''
      '       (select mc.cotacao'
      '        from moedascotacoes mc'
      '        where mc.moeda =   (select m.moeda'
      '                            from movimentos m'
      '                            where m.produto = p.codigo'
      '                              and m.filial = :filialbase'
      '                              and coalesce(m.valormoeda,0)<>0'
      
        '                            order by m.data desc, m.lancto desc ' +
        'limit 1)'
      '          and coalesce(mc.cotacao,0)<>0'
      '        order by mc.data desc limit 1) as cotacao,'
      ''
      '      (select m.data'
      '        from movimentos m'
      '        where m.produto = p.codigo'
      '          and m.filial = :filialbase'
      '          and coalesce(m.valormoeda,0)<>0'
      '        order by m.data desc, m.lancto desc limit 1) as data,'
      ''
      '       (select mc.data'
      '        from moedascotacoes mc'
      '        where mc.moeda =   (select m.moeda'
      '                            from movimentos m'
      '                            where m.produto = p.codigo'
      '                              and m.filial = :filialbase'
      '                              and coalesce(m.valormoeda,0)<>0'
      
        '                            order by m.data desc, m.lancto desc ' +
        'limit 1)'
      '          and coalesce(mc.cotacao,0)<>0'
      '        order by mc.data desc limit 1) as datacotacao,'
      '        '
      ''
      ''
      '       (select m.moeda'
      '        from movimentos m'
      '        where m.produto = p.codigo'
      '          and m.filial = :filialbase'
      '          and coalesce(m.valormoeda,0)<>0'
      '        order by m.data desc, m.lancto desc limit 1) as moeda,'
      ''
      '        c.desmembrarcomponente,'
      '        c.composto2 as eHComposto,'
      '        pc.QuantidadeehSomatoriodosComponentes'
      ''
      ''
      ''
      'from produtoscompostos pc'
      '     join produtos p'
      '          join caracteristicas c'
      '          on p.caracteristica = c.codigo'
      '     on pc.componente = p.codigo'
      'where pc.composto = :produto'
      '  and not pc.desconsiderarcusto'
      '  '
      'order by pc.composto, pc.ordem, pc.componente')
    RequestLive = False
    Left = 152
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filialbase'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qryComponenteProdutosCompostos_N3composto: TLargeintField
      FieldName = 'composto'
    end
    object qryComponenteProdutosCompostos_N3ordem: TIntegerField
      FieldName = 'ordem'
    end
    object qryComponenteProdutosCompostos_N3unidade: TStringField
      FieldName = 'unidade'
      Size = 8
    end
    object qryComponenteProdutosCompostos_N3componente: TLargeintField
      FieldName = 'componente'
    end
    object qryComponenteProdutosCompostos_N3componentevisual: TStringField
      FieldName = 'componentevisual'
      Size = 30
    end
    object qryComponenteProdutosCompostos_N3descricaocomponente: TStringField
      FieldName = 'descricaocomponente'
      Size = 50
    end
    object qryComponenteProdutosCompostos_N3origemmercadoria: TIntegerField
      FieldName = 'origemmercadoria'
    end
    object qryComponenteProdutosCompostos_N3valormoeda: TFloatField
      FieldName = 'valormoeda'
    end
    object qryComponenteProdutosCompostos_N3cotacao: TFloatField
      FieldName = 'cotacao'
    end
    object qryComponenteProdutosCompostos_N3moeda: TStringField
      FieldName = 'moeda'
      Size = 50
    end
    object qryComponenteProdutosCompostos_N3desmembrarcomponente: TBooleanField
      FieldName = 'desmembrarcomponente'
    end
    object qryComponenteProdutosCompostos_N3ehcomposto: TBooleanField
      FieldName = 'ehcomposto'
    end
    object qryComponenteProdutosCompostos_N3qtdecento: TFloatField
      FieldName = 'qtdecento'
    end
    object qryComponenteProdutosCompostos_N3data: TDateField
      FieldName = 'data'
    end
    object qryComponenteProdutosCompostos_N3datacotacao: TDateField
      FieldName = 'datacotacao'
    end
    object qryComponenteProdutosCompostos_N3percperda: TFloatField
      FieldName = 'percperda'
    end
    object qryComponenteProdutosCompostos_N3quantidadeehsomatoriodoscomponentes: TBooleanField
      FieldName = 'quantidadeehsomatoriodoscomponentes'
    end
  end
end
