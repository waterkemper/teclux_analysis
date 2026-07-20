inherited dtmCadastroContatos: TdtmCadastroContatos
  Left = 79
  Top = 205
  Height = 264
  Width = 830
  object qryPerguntasAplicadas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeScroll = qryPerguntasAplicadasBeforeScroll
    AfterScroll = qryPerguntasAplicadasAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select  p.codigo,'
      '        p.enunciado,'
      '        p.complementos,'
      '        p.minimo,'
      '        p.maximo,'
      '        p.tipo'
      'from Perguntas p'
      'where (p.valida) and (p.codigo in (select qp.pergunta'
      
        '                                   from questionariosperguntas q' +
        'p'
      
        '                                   where qp.questionario = :codi' +
        'go))'
      'order by p.ordem  ')
    RequestLive = False
    Left = 172
    Top = 73
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryPerguntasAplicadascodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Visible = False
    end
    object qryPerguntasAplicadasenunciado: TStringField
      FieldName = 'enunciado'
      Size = 50
    end
    object qryPerguntasAplicadascomplementos: TStringField
      FieldName = 'complementos'
      Size = 200
    end
    object qryPerguntasAplicadasminimo: TIntegerField
      FieldName = 'minimo'
    end
    object qryPerguntasAplicadasmaximo: TIntegerField
      FieldName = 'maximo'
    end
    object qryPerguntasAplicadastipo: TStringField
      FieldName = 'tipo'
      Size = 1
    end
  end
  object dsrPerguntasAplicadas: TtecDataSource
    DataSet = qryPerguntasAplicadas
    Left = 327
    Top = 73
  end
  object dsrRespostaDiscursiva: TtecDataSource
    DataSet = qryRespostaDiscursiva
    Left = 327
    Top = 134
  end
  object qryContatos: TtecQuery
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
    OnNewRecord = qryContatosNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select t.numero,'
      '       t.cliente,'
      '       t.questionario,'
      '       t.data,'
      '       t.texto,'
      '       t.tipo,'
      '       t.usuario,'
      '       c.nome,'
      '       c.sexo,'
      '       q.descricao'
      'from contatos t, clientes c, questionarios q'
      'where (t.numero = :numero) and'
      '      (t.cliente = c.codigo) and'
      '      (t.questionario = q.codigo)'
      '')
    RequestLive = True
    Left = 172
    Top = 15
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryContatosnumero: TIntegerField
      FieldName = 'numero'
      Required = True
      DisplayFormat = '0'
    end
    object qryContatoscliente: TIntegerField
      FieldName = 'cliente'
      Required = True
      DisplayFormat = '0'
    end
    object qryContatosquestionario: TIntegerField
      FieldName = 'questionario'
      DisplayFormat = '0'
    end
    object qryContatosdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryContatostexto: TStringField
      FieldName = 'texto'
      Size = 50
    end
    object qryContatosnome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 40
    end
    object qryContatosdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 30
    end
    object qryContatostipo: TStringField
      FieldName = 'tipo'
      Required = True
      Size = 1
    end
    object qryContatossexo: TStringField
      Alignment = taRightJustify
      FieldName = 'sexo'
      Size = 1
    end
    object qryContatosusuario: TIntegerField
      FieldName = 'usuario'
    end
  end
  object dsrContatos: TtecDataSource
    DataSet = qryContatos
    Left = 327
    Top = 15
  end
  object qryRespostaDiscursiva: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
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
      'select d.contato,'
      '       d.questionario,'
      '       d.pergunta,'
      '       d.texto'
      'from discursivas d'
      'where (d.contato =:contato)  and'
      '           (d.questionario =:questionario)  and'
      '           (d.pergunta =:pergunta)')
    RequestLive = True
    Left = 172
    Top = 134
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'questionario'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pergunta'
        ParamType = ptUnknown
      end>
    object qryRespostaDiscursivacontato: TIntegerField
      FieldName = 'contato'
      Required = True
    end
    object qryRespostaDiscursivaquestionario: TIntegerField
      FieldName = 'questionario'
      Required = True
    end
    object qryRespostaDiscursivapergunta: TIntegerField
      FieldName = 'pergunta'
      Required = True
    end
    object qryRespostaDiscursivatexto: TStringField
      FieldName = 'texto'
      Size = 150
    end
  end
  object qryOpcoesPerguntasAplicadas: TtecQuery
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
      'Select pergunta,'
      '           codigo,'
      '           opcao'
      'From   opcoesperguntas'
      'Where (Pergunta =:Pergunta)'
      'Order By codigo')
    RequestLive = False
    Left = 327
    Top = 195
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Pergunta'
        ParamType = ptUnknown
      end>
    object qryOpcoesPerguntasAplicadaspergunta: TIntegerField
      FieldName = 'pergunta'
      Required = True
    end
    object qryOpcoesPerguntasAplicadascodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object qryOpcoesPerguntasAplicadasopcao: TStringField
      FieldName = 'opcao'
      Required = True
    end
  end
  object qryRespostaObjetiva: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
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
      'Select *'
      'From   Objetivas'
      'Where (Contato =:Contato) and'
      '            (Questionario =:Questionario) and'
      '            (Pergunta =:Pergunta)  and'
      '            (Opcao =:Opcao) ')
    RequestLive = True
    Left = 172
    Top = 195
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Contato'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'Questionario'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'Pergunta'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'Opcao'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryRespostaObjetivacontato: TIntegerField
      FieldName = 'contato'
      Required = True
    end
    object qryRespostaObjetivaquestionario: TIntegerField
      FieldName = 'questionario'
      Required = True
    end
    object qryRespostaObjetivapergunta: TIntegerField
      FieldName = 'pergunta'
      Required = True
    end
    object qryRespostaObjetivaopcao: TIntegerField
      FieldName = 'opcao'
      Required = True
    end
  end
  object qryConsultaRespostaObjetiva: TtecQuery
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
      'Select *'
      'From   Objetivas'
      'Where (Contato =:Contato) and'
      '            (Questionario =:Questionario) and'
      '            (Pergunta =:Pergunta)')
    RequestLive = True
    Left = 469
    Top = 15
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Contato'
        ParamType = ptUnknown
        Value = 100018
      end
      item
        DataType = ftInteger
        Name = 'Questionario'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'Pergunta'
        ParamType = ptUnknown
        Value = 1
      end>
    object qryConsultaRespostaObjetivacontato: TIntegerField
      FieldName = 'contato'
      Required = True
    end
    object qryConsultaRespostaObjetivaquestionario: TIntegerField
      FieldName = 'questionario'
      Required = True
    end
    object qryConsultaRespostaObjetivapergunta: TIntegerField
      FieldName = 'pergunta'
      Required = True
    end
    object qryConsultaRespostaObjetivaopcao: TIntegerField
      FieldName = 'opcao'
      Required = True
    end
  end
  object qryConsultaContatos: TtecQuery
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
      'select c.numero,'
      '       t.nome,'
      '       c.data'
      'from contatos c, clientes t'
      'where (c.cliente = t.codigo)'
      '/* esta linha sera preenchida em runtime */'
      'order by UPPER(TO_ASCII(t.nome,''LATIN1''))')
    RequestLive = False
    Left = 469
    Top = 73
    object qryConsultaContatosnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaContatosnumero: TIntegerField
      FieldName = 'numero'
    end
    object qryConsultaContatosdata: TDateField
      FieldName = 'data'
    end
  end
  object qryProximoNumeroContato: TtecQuery
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
      'select contatos_proximonumero() as Numero')
    RequestLive = False
    Left = 469
    Top = 134
    object qryProximoNumeroContatonumero: TIntegerField
      FieldName = 'numero'
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
      'Where (L.filtrosac     = :filtrosac) '
      '          /* Peenchido em RunTime   */'
      'Order By L.situacao , L.datahora '
      'For Update'
      'Limit 1')
    RequestLive = True
    Left = 625
    Top = 15
    ParamData = <
      item
        DataType = ftInteger
        Name = 'filtrosac'
        ParamType = ptUnknown
        Value = '60'
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
  object dsrLigacoes: TtecDataSource
    AutoEdit = False
    DataSet = qryLigacoes
    Left = 625
    Top = 73
  end
  object qryExisteContatos: TtecQuery
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
      'Select   * '
      'From     Contatos'
      'Where   (Numero =:Contato)'
      '')
    RequestLive = False
    Left = 469
    Top = 195
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contato'
        ParamType = ptUnknown
      end>
    object qryExisteContatonumero: TIntegerField
      FieldName = 'numero'
    end
    object qryExisteContatocliente: TIntegerField
      FieldName = 'cliente'
    end
    object qryExisteContatodata: TDateField
      FieldName = 'data'
    end
    object qryExisteContatoquestionario: TIntegerField
      FieldName = 'questionario'
    end
    object qryExisteContatotexto: TStringField
      FieldName = 'texto'
      Size = 50
    end
    object qryExisteContatotipo: TStringField
      FieldName = 'tipo'
      Size = 1
    end
  end
  object qryExcluirRespostaObjetiva: TtecQuery
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
      'delete from objetivas '
      'where (contato =:Contato) and'
      '           (questionario =:Questionario) ')
    RequestLive = False
    Left = 625
    Top = 134
    ParamData = <
      item
        DataType = ftString
        Name = 'Contato'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'Questionario'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object qryExcluirRespostaDiscursiva: TtecQuery
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
      'delete from discursivas '
      'where (contato =:Contato) and'
      '           (questionario =:Questionario)')
    RequestLive = False
    Left = 625
    Top = 195
    ParamData = <
      item
        DataType = ftString
        Name = 'Contato'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'Questionario'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object qryExcluirLigacoes: TtecQuery
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
      'Select *'
      'From   Ligacoes'
      'Where (Contato =:Contato)')
    RequestLive = True
    Left = 732
    Top = 15
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contato'
        ParamType = ptUnknown
      end>
    object qryExcluirLigacoesfiltrosac: TIntegerField
      FieldName = 'filtrosac'
    end
    object qryExcluirLigacoescliente: TIntegerField
      FieldName = 'cliente'
    end
    object qryExcluirLigacoesusuario: TIntegerField
      FieldName = 'usuario'
    end
    object qryExcluirLigacoesdatahora: TDateTimeField
      FieldName = 'datahora'
    end
    object qryExcluirLigacoessituacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
    object qryExcluirLigacoesreligado: TIntegerField
      FieldName = 'religado'
    end
    object qryExcluirLigacoescontato: TIntegerField
      FieldName = 'contato'
    end
  end
end
