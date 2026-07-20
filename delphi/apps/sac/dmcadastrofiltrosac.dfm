inherited dtmCadastroFiltroSAC: TdtmCadastroFiltroSAC
  OldCreateOrder = True
  Left = 304
  Top = 176
  Height = 424
  Width = 482
  object dsrFiltrosSAC: TtecDataSource
    DataSet = qryFiltrosSAC
    Left = 222
    Top = 17
  end
  object qryConsultaFiltrosSAC: TtecQuery
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
      'Select * '
      'From   FiltrosSAC'
      'Order By UPPER(TO_ASCII(descricao,''LATIN1''))')
    RequestLive = False
    Left = 66
    Top = 78
    object qryConsultaFiltrosSACdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Required = True
      Size = 30
    end
    object qryConsultaFiltrosSACnumero: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'numero'
      Required = True
      DisplayFormat = '0'
    end
  end
  object qryProximoNumeroFiltro: TtecQuery
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
      'Select FiltrosSac_ProximoNumero() as Numero')
    RequestLive = False
    Left = 222
    Top = 78
    object qryProximoNumeroFiltronumero: TIntegerField
      FieldName = 'numero'
    end
  end
  object qryConsultaQuestionarios: TtecQuery
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
      'select  codigo,'
      '        descricao'
      'from questionarios'
      'order by UPPER(TO_ASCII(descricao,''LATIN1''))')
    RequestLive = False
    Left = 66
    Top = 144
    object qryConsultaQuestionariosdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
    object qryConsultaQuestionarioscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Visible = False
      DisplayFormat = '0'
    end
  end
  object dsrConsultaQuestionarios: TtecDataSource
    DataSet = qryConsultaQuestionarios
    Left = 222
    Top = 144
  end
  object dsrQuestionario: TtecDataSource
    DataSet = qryQuestionarios
    Left = 222
    Top = 206
  end
  object qryGerarLigacoes: TtecQuery
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
      'Select ligacoes_inserir(:Numero)')
    RequestLive = False
    Left = 222
    Top = 339
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Numero'
        ParamType = ptUnknown
      end>
  end
  object qryUpdateFiltroSac: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeDelete = BeforeDelete
    AfterScroll = qryFiltrosSACAfterScroll
    OnDeleteError = PostError
    OnEditError = PostError
    OnPostError = PostError
    OnNewRecord = qryFiltrosSACNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'UPDATE filtrossac'
      'SET inativo = now()'
      'where numero= :numero')
    RequestLive = True
    Left = 66
    Top = 273
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptUnknown
        Value = 0
      end>
  end
  object qryUpdateLigacoes: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeDelete = BeforeDelete
    AfterScroll = qryFiltrosSACAfterScroll
    OnDeleteError = PostError
    OnEditError = PostError
    OnPostError = PostError
    OnNewRecord = qryFiltrosSACNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'UPDATE ligacoes'
      'SET situacao = '#39'C'#39
      'where situacao = '#39'R'#39' and'
      '          filtrosac = :filtrosac')
    RequestLive = True
    Left = 222
    Top = 273
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filtrosac'
        ParamType = ptUnknown
      end>
  end
  object qryDeleteLigacoes: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeDelete = BeforeDelete
    AfterScroll = qryFiltrosSACAfterScroll
    OnDeleteError = PostError
    OnEditError = PostError
    OnPostError = PostError
    OnNewRecord = qryFiltrosSACNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'DELETE from ligacoes'
      'where situacao = '#39'0'#39' and'
      '          filtrosac = :filtrosac')
    RequestLive = True
    Left = 66
    Top = 339
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filtrosac'
        ParamType = ptUnknown
      end>
  end
  object qryExisteLigacoes: TtecQuery
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
      'Select int4(Count(*)) as Qtde '
      'from Ligacoes'
      'Where  FiltroSAC =:Filtro')
    RequestLive = False
    Left = 389
    Top = 15
    ParamData = <
      item
        DataType = ftString
        Name = 'Filtro'
        ParamType = ptUnknown
        Value = '3'
      end>
    object qryExisteLigacoesqtde: TIntegerField
      FieldName = 'qtde'
      DisplayFormat = '0'
    end
  end
  object qryLigacoes: TtecQuery
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
      'select L.filtrosac,'
      '       L.cliente,'
      '       L.usuario,'
      '       L.datahora,'
      '       L.religado,'
      '       L.contato,'
      '       L.situacao'
      'From ligacoes L'
      'Where (L.filtrosac     = :filtrosac)   '
      '          /* Peenchido em RunTime   */  '
      'Order By L.situacao , L.datahora '
      'For Update'
      'Limit 1')
    RequestLive = True
    Left = 384
    Top = 79
    ParamData = <
      item
        DataType = ftInteger
        Name = 'filtrosac'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryLigacoesfiltrosac: TIntegerField
      FieldName = 'filtrosac'
      DisplayFormat = '0'
    end
    object qryLigacoescliente: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object qryLigacoesusuario: TIntegerField
      FieldName = 'usuario'
      DisplayFormat = '0'
    end
    object qryLigacoesdatahora: TDateTimeField
      FieldName = 'datahora'
    end
    object qryLigacoessituacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
    object qryLigacoesreligado: TIntegerField
      FieldName = 'religado'
      DisplayFormat = '0#'
    end
    object qryLigacoescontato: TIntegerField
      FieldName = 'contato'
    end
  end
  object qryQuestionarios: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doEnableAutoInc, doUseRowId, doRefreshAfterPost, doRefreshBeforeEdit]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select  codigo,'
      '        descricao'
      'from questionarios'
      'where codigo = :codigo')
    RequestLive = True
    Left = 66
    Top = 206
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
        Value = ''
      end>
    object qryQuestionarioscodigo: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'codigo'
      ReadOnly = True
      Required = True
      Visible = False
      DisplayFormat = '0'
    end
    object qryQuestionariosdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 30
    end
  end
  object qryFiltrosSAC: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeDelete = BeforeDelete
    AfterScroll = qryFiltrosSACAfterScroll
    OnDeleteError = PostError
    OnEditError = PostError
    OnPostError = PostError
    OnNewRecord = qryFiltrosSACNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select F.Numero,'
      '          F.Descricao,'
      '          F.Tipo,'
      '          F.Data,'
      '          F.Filtro,'
      '          F.Inativo,'
      '          F.Questionario,'
      '          F.SQL'
      'from filtrossac F'
      'where (F.Numero =:Numero)')
    RequestLive = False
    Left = 66
    Top = 17
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Numero'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryFiltrosSACnumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryFiltrosSACdescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
    object qryFiltrosSACtipo: TStringField
      FieldName = 'tipo'
      Size = 1
    end
    object qryFiltrosSACdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object qryFiltrosSACfiltro: TStringField
      FieldName = 'filtro'
      Size = 512
    end
    object qryFiltrosSACinativo: TDateField
      Alignment = taCenter
      FieldName = 'inativo'
      EditMask = '99/99/9999;1; '
    end
    object qryFiltrosSACquestionario: TIntegerField
      FieldName = 'questionario'
      DisplayFormat = '0'
    end
    object qryFiltrosSACsql: TStringField
      DisplayWidth = 1000
      FieldName = 'sql'
      Size = 1000
    end
  end
end
