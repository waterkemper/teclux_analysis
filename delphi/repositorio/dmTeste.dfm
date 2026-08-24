object dtmTeste: TdtmTeste
  OldCreateOrder = False
  Left = 506
  Top = 274
  Height = 296
  Width = 401
  object qryProdutos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = []
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = []
    Macros = <>
    Sql.Strings = (
      'Select  pn.codigonota,'
      '        pn.produto,'
      '        p.descricao,'
      '        p.descricao as descricaoteste'
      ''
      'From    produtosnotaspag pn, produtos p, caracteristicas c'
      'Where  (pn.produto = p.codigo) and'
      '           (p.caracteristica = c.codigo) and'
      '            (pn.codigonota = 56486)'
      
        'Order By pn.numero, UPPER(TO_ASCII(p.descricao,'#39'LATIN1'#39')), p.val' +
        'orgrade1, p.valorgrade2')
    RequestLive = False
    Left = 44
    Top = 81
    object qryProdutoscodigonota: TIntegerField
      FieldName = 'codigonota'
    end
    object qryProdutosproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryProdutosdescricao: TStringField
      FieldName = 'descricao'
      Size = 40
    end
    object qryProdutosdescricaoteste: TStringField
      FieldName = 'descricaoteste'
      Size = 51
    end
  end
end
