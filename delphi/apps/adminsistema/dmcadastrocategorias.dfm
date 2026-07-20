inherited dtmCadastroCategorias: TdtmCadastroCategorias
  OldCreateOrder = False
  Left = 580
  Top = 247
  Height = 234
  Width = 219
  object qryCategorias: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnDeleteError = PostError
    OnEditError = PostError
    OnPostError = PostError
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT c.Codigo,'
      '       c.Hierarquia,'
      '       c.Descricao,'
      '       c.Inativo'
      ''
      'FROM   categorias c'
      ''
      'WHERE  Codigo = :Codigo AND'
      '       Inativo IS NULL'
      '       ')
    RequestLive = True
    Left = 32
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryCategoriasCodigo: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      DisplayFormat = '0'
    end
    object qryCategoriasHierarquia: TStringField
      FieldName = 'Hierarquia'
      Required = True
      Size = 10
    end
    object qryCategoriasDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Required = True
      Size = 50
    end
    object qryCategoriasInativo: TDateField
      Alignment = taCenter
      FieldName = 'Inativo'
      EditMask = '99/99/9999;1; '
    end
  end
  object qryConsultaCategorias: TtecQuery
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
      'SELECT   c.Descricao,'
      '         c.Hierarquia,'
      '         c.Codigo'
      '         '
      'FROM     categorias c'
      ''
      'WHERE    c.Inativo IS NULL'
      ''
      'ORDER BY UPPER(TO_ASCII(c.descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 128
    Top = 16
    object qryConsultaCategoriasDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Required = True
      Size = 50
    end
    object qryConsultaCategoriasHierarquia: TStringField
      FieldName = 'Hierarquia'
      Required = True
      Size = 10
    end
    object qryConsultaCategoriasCodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      Required = True
      DisplayFormat = '0'
    end
  end
  object dsrCategorias: TtecDataSource
    DataSet = qryCategorias
    Left = 32
    Top = 80
  end
  object spcCategoriaProximo: TtecQuery
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
      'SELECT Categorias_ProximoCodigo() as Codigo'
      '')
    RequestLive = False
    Left = 128
    Top = 80
    object spcCategoriaProximoCodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      DisplayFormat = '0'
    end
  end
end
