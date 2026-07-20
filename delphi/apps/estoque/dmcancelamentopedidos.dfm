inherited dtmCancelamentoPedidos: TdtmCancelamentoPedidos
  OldCreateOrder = False
  Left = 430
  Top = 202
  Height = 407
  Width = 844
  object qryFornecedores: TtecQuery
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
      'Select  codigo,'
      '            nome'
      'From    fornecedores'
      'Where (codigo =:codigo)')
    RequestLive = True
    Left = 59
    Top = 13
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryFornecedorescodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryFornecedoresnome: TStringField
      FieldName = 'nome'
      Size = 50
    end
  end
  object dsrFornecedores: TtecDataSource
    DataSet = qryFornecedores
    Left = 195
    Top = 13
  end
  object qryConsultaFornecedores: TtecQuery
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
      'Select  f.nome,'
      '            formatar_cpf_cnpj(f.pessoanumero) as pessoanumero,'
      '            f.codigo,'
      '            f.estado,'
      '            c.nome as nomecidade'
      'From    fornecedores f, cidades c'
      'Where (f.estado = c.estado)'
      '    and  (f.cidade = c.codigo)'
      'Order By UPPER(TO_ASCII(f.nome,'#39'LATIN1'#39'))'
      '')
    RequestLive = True
    Left = 347
    Top = 13
    object qryConsultaFornecedoresnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaFornecedorespessoanumero: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'pessoanumero'
      Size = 18
    end
    object qryConsultaFornecedoresnomecidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'nomecidade'
      Size = 30
    end
    object qryConsultaFornecedoresestado: TStringField
      DisplayLabel = 'UF'
      FieldName = 'estado'
      Size = 2
    end
    object qryConsultaFornecedorescodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
  end
  object qryPedidos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryPedidosAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT p.Numero,'
      '       p.Emissao,'
      '       p.Fornecedor,'
      '      (SELECT f.Nome FROM Fornecedores f'
      '          WHERE p.Fornecedor = f.Codigo'
      '      ) AS NomeFornecedor,'
      ''
      '       p.Cancelado,'
      '       p.Motivo,'
      '       p.Situacao,'
      '       CAST(0 AS NUMERIC) AS Valor,'
      '       FALSE AS Cancelar'
      ''
      'FROM pedidos p'
      ''
      'WHERE (p.Numero > 0)'
      ''
      '/*    Emissao            */'
      '/*    Fornecedor         */'
      '/*    Numero Pedido      */'
      '/*    Quais Entregues    */'
      ''
      'ORDER BY p.Emissao'
      '')
    RequestLive = True
    Left = 59
    Top = 74
    object qryPedidosnumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryPedidosemissao: TDateField
      Alignment = taCenter
      FieldName = 'emissao'
      EditMask = '99/99/9999;1; '
    end
    object qryPedidosnomefornecedor: TStringField
      FieldName = 'nomefornecedor'
      Size = 13
    end
    object qryPedidosfornecedor: TIntegerField
      FieldName = 'fornecedor'
      DisplayFormat = '0'
    end
    object qryPedidosvalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '0.00'
    end
    object qryPedidoscancelado: TDateField
      Alignment = taCenter
      FieldName = 'cancelado'
      EditMask = '99/99/9999;1; '
    end
    object qryPedidosmotivo: TIntegerField
      FieldName = 'motivo'
      DisplayFormat = '0'
    end
    object qryPedidossituacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
    object qryPedidoscancelar: TBooleanField
      FieldName = 'cancelar'
    end
  end
  object dsrPedidos: TtecDataSource
    DataSet = qryPedidos
    Left = 195
    Top = 74
  end
  object qryCancelarPedidos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'Select  numero,'
      '            cancelado,'
      '            motivo,'
      '            situacao'
      'From    pedidos'
      'Where (numero = :numero)')
    RequestLive = True
    Left = 347
    Top = 74
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryCancelarPedidoscancelado: TDateField
      FieldName = 'cancelado'
    end
    object qryCancelarPedidosmotivo: TIntegerField
      FieldName = 'motivo'
    end
    object qryCancelarPedidosnumero: TIntegerField
      FieldName = 'numero'
    end
    object qryCancelarPedidossituacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
  end
  object qryMotivos: TtecQuery
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
      'Select codigo,'
      '           descricao'
      'From   motivos'
      'Where (tipomotivo = '#39'P'#39') and (inativo is null) and '
      '           (codigo =:codigo)')
    RequestLive = False
    Left = 59
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryMotivoscodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryMotivosdescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
  end
  object qryConsultaMotivos: TtecQuery
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
      'Select descricao,'
      '           codigo'
      'From   motivos'
      'Where (tipomotivo = '#39'P'#39') and (inativo is null)'
      'Order By UPPER(TO_ASCII(descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 347
    Top = 136
    object qryConsultaMotivosdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
    object qryConsultaMotivoscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
  end
  object dsrMotivos: TtecDataSource
    DataSet = qryMotivos
    Left = 195
    Top = 136
  end
  object qryProdutosPedidos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryProdutosPedidosAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'Select  pp.pedido,'
      '            pp.produto,'
      '            p.codigovisual as produtovisual,'
      '            pp.quantidade,'
      
        '            produtospedidos_recebido(pp.pedido, pp.produto) as r' +
        'ecebido,'
      '            p.descricao,'
      '            p.valorgrade1,'
      '            p.valorgrade2,'
      
        '            (select gr.descricao from grades gr, caracteristicas' +
        ' c where gr.codigo = c.grade1 and  c.codigo = p.caracteristica) ' +
        'as linha,'
      
        '            (select gr.descricao from grades gr, caracteristicas' +
        ' c where gr.codigo = c.grade2 and  c.codigo = p.caracteristica) ' +
        'as coluna'
      'From    produtospedidos pp, produtos p'
      'Where (pp.produto = p.codigo) and'
      '           (pp.pedido =:pedido)')
    RequestLive = False
    Left = 59
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pedido'
        ParamType = ptUnknown
      end>
    object qryProdutosPedidospedido: TIntegerField
      FieldName = 'pedido'
    end
    object qryProdutosPedidosproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryProdutosPedidosquantidade: TFloatField
      FieldName = 'quantidade'
    end
    object qryProdutosPedidosrecebido: TFloatField
      FieldName = 'recebido'
    end
    object qryProdutosPedidosdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object qryProdutosPedidosvalorgrade1: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade1'
      Size = 30
    end
    object qryProdutosPedidosvalorgrade2: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade2'
      Size = 30
    end
    object qryProdutosPedidoslinha: TStringField
      FieldName = 'linha'
      Size = 50
    end
    object qryProdutosPedidoscoluna: TStringField
      FieldName = 'coluna'
      Size = 50
    end
    object qryProdutosPedidosprodutovisual: TStringField
      FieldName = 'produtovisual'
      Size = 30
    end
  end
  object dsrProdutosPedidos: TtecDataSource
    DataSet = qryProdutosPedidos
    Left = 196
    Top = 200
  end
  object qryDocumentosPag: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'Select numero,'
      '           fornecedor,'
      '           tipofornecedor,'
      '           emissao,'
      '           filialemissao,'
      '           previsao,'
      '           valor,'
      '           pedido'
      'From   documentospag'
      'Where previsao and (pedido =:pedido)')
    RequestLive = True
    Left = 507
    Top = 13
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pedido'
        ParamType = ptUnknown
      end>
    object qryDocumentosPagnumero: TIntegerField
      FieldName = 'numero'
    end
    object qryDocumentosPagfornecedor: TIntegerField
      FieldName = 'fornecedor'
    end
    object qryDocumentosPagtipofornecedor: TStringField
      FieldName = 'tipofornecedor'
      Size = 1
    end
    object qryDocumentosPagemissao: TDateField
      FieldName = 'emissao'
    end
    object qryDocumentosPagfilialemissao: TIntegerField
      FieldName = 'filialemissao'
    end
    object qryDocumentosPagprevisao: TBooleanField
      FieldName = 'previsao'
    end
    object qryDocumentosPagvalor: TFloatField
      FieldName = 'valor'
    end
    object qryDocumentosPagpedido: TIntegerField
      FieldName = 'pedido'
    end
  end
  object qryDuplicatas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'Select  documentopag,'
      '            numero,'
      '            datavencto,'
      '            valorvencto'
      'From    duplicatas'
      'Where  (documentopag =:documento)')
    RequestLive = True
    Left = 507
    Top = 74
    ParamData = <
      item
        DataType = ftInteger
        Name = 'documento'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryDuplicatasdocumentopag: TIntegerField
      FieldName = 'documentopag'
    end
    object qryDuplicatasnumero: TIntegerField
      FieldName = 'numero'
    end
    object qryDuplicatasdatavencto: TDateField
      FieldName = 'datavencto'
    end
    object qryDuplicatasvalorvencto: TFloatField
      FieldName = 'valorvencto'
    end
  end
end
