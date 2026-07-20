inherited dtmCadastroQuestionarios: TdtmCadastroQuestionarios
  OldCreateOrder = True
  Left = 281
  Top = 275
  Height = 295
  Width = 489
  object qryQuestionarios: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doEnableAutoInc, doUseRowId, doRefreshAfterPost, doRefreshBeforeEdit]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterCancel = qryQuestionariosAfterCancel
    BeforeDelete = BeforeDelete
    AfterScroll = qryQuestionariosAfterScroll
    OnDeleteError = PostError
    OnEditError = PostError
    OnPostError = PostError
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select  codigo,'
      '        descricao'
      'from questionarios'
      'where codigo = :codigo')
    RequestLive = True
    Left = 72
    Top = 17
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryQuestionarioscodigo: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'codigo'
      ReadOnly = True
      Required = True
      Visible = False
    end
    object qryQuestionariosdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 30
    end
  end
  object dsrQuestionario: TtecDataSource
    DataSet = qryQuestionarios
    Left = 245
    Top = 17
  end
  object qryQuestionariosPerguntas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeDelete = BeforeDelete
    OnDeleteError = PostError
    OnEditError = PostError
    OnPostError = PostError
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'Select  qp.questionario,'
      '        qp.pergunta,'
      '        p.enunciado'
      'From questionariosperguntas qp, perguntas p'
      'where (p.codigo = qp.pergunta) and'
      '      (qp.questionario = :codigo)')
    RequestLive = True
    Left = 72
    Top = 82
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryQuestionariosPerguntasquestionario: TIntegerField
      FieldName = 'questionario'
      Visible = False
    end
    object qryQuestionariosPerguntaspergunta: TIntegerField
      FieldName = 'pergunta'
      Visible = False
    end
    object qryQuestionariosPerguntasenunciado: TStringField
      DisplayLabel = 'Perguntas'
      FieldName = 'enunciado'
      Size = 50
    end
  end
  object dsrQuestionariosPerguntas: TtecDataSource
    DataSet = qryQuestionariosPerguntas
    Left = 245
    Top = 82
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
    Left = 72
    Top = 150
    object qryConsultaQuestionariosdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
    object qryConsultaQuestionarioscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Visible = False
    end
  end
  object dsrConsultaQuestionarios: TtecDataSource
    DataSet = qryConsultaQuestionarios
    Left = 245
    Top = 150
  end
  object qryPerguntasNaoIncluidas: TtecQuery
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
      'Select  p.codigo,'
      '        p.enunciado'
      'From Perguntas p'
      'where not (codigo in (select qp.pergunta'
      '                      from questionariosperguntas qp'
      '                      where qp.questionario = :Questionario'
      '                      union'
      '                      select p1.codigo'
      '                      from perguntas p1'
      '                      where p1.codigo in'
      '--Preenchido em runtime. N'#227'o Apague!'
      '                      )'
      '          )'
      'order by UPPER(TO_ASCII(p.enunciado,''LATIN1''))')
    RequestLive = False
    Left = 72
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Questionario'
        ParamType = ptUnknown
      end>
    object qryPerguntasNaoIncluidascodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
      Visible = False
    end
    object qryPerguntasNaoIncluidasenunciado: TStringField
      DisplayLabel = 'Enunciado'
      FieldName = 'enunciado'
      Required = True
      Size = 50
    end
  end
  object qryCodigoProximoQuestionario: TtecQuery
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
      'select questionarios_proximocodigo() as Codigo')
    RequestLive = False
    Left = 245
    Top = 216
    object qryCodigoProximoQuestionariocodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
end
