inherited dtmVendasPerdidas: TdtmVendasPerdidas
  OldCreateOrder = False
  Left = 640
  Top = 249
  Height = 241
  Width = 499
  object qryVendasPerdidas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforePost = qryVendasPerdidasBeforePost
    OnNewRecord = qryVendasPerdidasNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select vp.*,'
      '       u.nome as nomevendedor,'
      '       f.nome as nomefilial,'
      
        '       (select p.codigovisual from produtos p where vp.produto =' +
        ' p.codigo) as produtovisual'
      ''
      'from vendasperdidas vp, usuarios u, filiais f'
      'where vp.codigo = :codigo'
      '  and vp.vendedor = u.codigo'
      '  and vp.filial = f.codigo')
    RequestLive = True
    Left = 56
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryVendasPerdidascodigo: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'codigo'
    end
    object qryVendasPerdidasfilial: TIntegerField
      FieldName = 'filial'
    end
    object qryVendasPerdidasvendedor: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'vendedor'
      Required = True
    end
    object qryVendasPerdidasgrupo: TStringField
      FieldName = 'grupo'
      Size = 4
    end
    object qryVendasPerdidasdata_hora: TDateTimeField
      Alignment = taCenter
      FieldName = 'data_hora'
      DisplayFormat = 'dd/MM/yy hh:mm'
      EditMask = '99/99/99 99:99;1; '
    end
    object qryVendasPerdidasobservacoes: TStringField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'observacoes'
      Required = True
      Size = 200
    end
    object qryVendasPerdidasnomevendedor: TStringField
      FieldName = 'nomevendedor'
      Size = 100
    end
    object qryVendasPerdidasnomefilial: TStringField
      FieldName = 'nomefilial'
      Size = 60
    end
    object qryVendasPerdidasproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryVendasPerdidasprodutovisual: TStringField
      FieldName = 'produtovisual'
      Size = 30
    end
    object qryVendasPerdidasdescricaoitemproduto: TStringField
      FieldName = 'descricaoitemproduto'
      Size = 100
    end
    object qryVendasPerdidasdescricaogrupoproduto: TStringField
      FieldName = 'descricaogrupoproduto'
      Size = 30
    end
  end
  object dsrVendasPerdidas: TtecDataSource
    DataSet = qryVendasPerdidas
    OnDataChange = dsrVendasPerdidasDataChange
    Left = 120
    Top = 40
  end
  object qryVendasPerdidas_Proximo: TtecQuery
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
      'select nextval('#39'vendasperdidas_codigo_seq'#39') as codigo')
    RequestLive = False
    Left = 280
    Top = 40
    object qryVendasPerdidas_Proximocodigo: TLargeintField
      FieldName = 'codigo'
    end
  end
end
