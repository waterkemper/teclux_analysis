inherited dtmCadastroOperadores: TdtmCadastroOperadores
  Left = 885
  Top = 226
  Height = 254
  Width = 360
  object qryUsuarios: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryUsuariosAfterScroll
    OnDeleteError = PostError
    OnEditError = PostError
    OnPostError = PostError
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'Autorizado'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'SELECT Codigo,'
      '       Nome,'
      '       SalarioHora,'
      '       Anuenio,'
      '       Turno,'
      '       CAST(CASE WHEN Inativo IS NULL'
      '                 THEN '#39#39
      '                 ELSE CASE WHEN Inativo > CURRENT_DATE'
      '                           THEN '#39#39
      '                           ELSE '#39'INATIVO'#39
      '                      END'
      '            END AS VARCHAR) AS Inativo'
      'FROM usuarios'
      'WHERE (Codigo = :Codigo)'
      '%Autorizado')
    RequestLive = True
    Left = 52
    Top = 14
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryUsuarioscodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryUsuariosnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryUsuariossalariohora: TFloatField
      FieldName = 'salariohora'
    end
    object qryUsuariosanuenio: TFloatField
      FieldName = 'anuenio'
    end
    object qryUsuariosturno: TIntegerField
      FieldName = 'turno'
      Required = True
    end
    object qryUsuariosinativo: TStringField
      FieldName = 'inativo'
      Size = 50
    end
  end
  object dsrUsuarios: TtecDataSource
    DataSet = qryUsuarios
    Left = 67
    Top = 34
  end
  object qryUsuariosInstrucoesTrabalho: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryUsuariosInstrucoesTrabalhoAfterOpen
    AfterEdit = qryUsuariosInstrucoesTrabalhoAfterEdit
    BeforePost = qryUsuariosInstrucoesTrabalhoBeforePost
    AfterPost = qryUsuariosInstrucoesTrabalhoAfterPost
    AfterDelete = qryUsuariosInstrucoesTrabalhoAfterDelete
    AfterScroll = qryUsuariosInstrucoesTrabalhoAfterScroll
    OnNewRecord = qryUsuariosInstrucoesTrabalhoNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT uit.Usuario,'
      '       uit.InstrucaoTrabalho,'
      '       uit.NivelConhecimento,'
      '       uit.HabilitadoSetUp,'
      '       uit.DataInicialTreinamento,'
      '       uit.DataFinalTreinamento,'
      ''
      '       it.Instrucao,'
      '       it.Descricao AS DescricaoInstrucao,'
      '       it.Inativo,'
      '       nc.Descricao AS DescricaoNivelConhecimento,'
      ''
      
        '      (SELECT DataUltimaVezTrabalhadoIT(uit.Usuario, (SELECT ito' +
        '.Operacao'
      
        '                                                      FROM Instr' +
        'ucoesTrabalhoOperacoes ito'
      
        '                                            WHERE ito.InstrucaoT' +
        'rabalho = it.Codigo LIMIT 1))) AS UltimaAtividade'
      ''
      'FROM usuariosinstrucoestrabalho uit'
      
        '     JOIN instrucoestrabalho it ON uit.InstrucaoTrabalho = it.Co' +
        'digo'
      
        '     JOIN Niveisconhecimento nc ON uit.NivelConhecimento = nc.Co' +
        'digo'
      ''
      'WHERE uit.Usuario = :Usuario'
      'ORDER BY it.Instrucao'
      '')
    RequestLive = True
    Left = 96
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'usuario'
        ParamType = ptUnknown
      end>
    object qryUsuariosInstrucoesTrabalhousuario: TIntegerField
      FieldName = 'usuario'
      Required = True
      DisplayFormat = '0'
    end
    object qryUsuariosInstrucoesTrabalhoinstrucaotrabalho: TIntegerField
      FieldName = 'instrucaotrabalho'
      Required = True
      DisplayFormat = '0'
    end
    object qryUsuariosInstrucoesTrabalhonivelconhecimento: TIntegerField
      FieldName = 'nivelconhecimento'
      Required = True
      DisplayFormat = '0'
    end
    object qryUsuariosInstrucoesTrabalhohabilitadosetup: TBooleanField
      FieldName = 'habilitadosetup'
    end
    object qryUsuariosInstrucoesTrabalhoinstrucao: TStringField
      FieldName = 'instrucao'
      Required = True
      Size = 30
    end
    object qryUsuariosInstrucoesTrabalhodescricaoinstrucao: TStringField
      FieldName = 'descricaoinstrucao'
      Size = 60
    end
    object qryUsuariosInstrucoesTrabalhodescricaonivelconhecimento: TStringField
      FieldName = 'descricaonivelconhecimento'
      Size = 50
    end
    object qryUsuariosInstrucoesTrabalhodatainicialtreinamento: TDateField
      FieldName = 'datainicialtreinamento'
      DisplayFormat = 'DD/MM/YY'
      EditMask = '99/99/9999;1; '
    end
    object qryUsuariosInstrucoesTrabalhodatafinaltreinamento: TDateField
      FieldName = 'datafinaltreinamento'
      DisplayFormat = 'DD/MM/YY'
      EditMask = '99/99/9999;1; '
    end
    object qryUsuariosInstrucoesTrabalhoinativo: TDateField
      Alignment = taCenter
      FieldName = 'inativo'
      DisplayFormat = 'DD/MM/YY'
      EditMask = '99/99/9999;1; '
    end
    object qryUsuariosInstrucoesTrabalhoUltimaAtividade: TDateField
      FieldName = 'ultimaatividade'
    end
  end
  object dsrUsuariosInstrucoesTrabalho: TtecDataSource
    DataSet = qryUsuariosInstrucoesTrabalho
    OnDataChange = dsrUsuariosInstrucoesTrabalhoDataChange
    Left = 120
    Top = 112
  end
end
