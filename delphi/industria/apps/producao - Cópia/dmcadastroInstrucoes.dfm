inherited dtmCadastroInstrucoes: TdtmCadastroInstrucoes
  Left = 608
  Top = 264
  Height = 349
  Width = 553
  object qryInstrucoes: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryInstrucoesAfterScroll
    OnNewRecord = qryInstrucoesNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT Codigo,'
      '       Descricao,'
      '       Instrucao,'
      '       InatividadeMaxima,'
      '       Inativo'
      ''
      'FROM instrucoestrabalho'
      'WHERE Instrucao = :Instrucao')
    RequestLive = True
    Left = 72
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'instrucao'
        ParamType = ptUnknown
      end>
    object qryInstrucoescodigo: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryInstrucoesdescricao: TStringField
      DisplayLabel = 'descri'#231#227'o'
      FieldName = 'descricao'
      Required = True
      Size = 40
    end
    object qryInstrucoesinstrucao: TStringField
      DisplayLabel = 'instru'#231#227'o'
      FieldName = 'instrucao'
      Required = True
      Size = 30
    end
    object qryInstrucoesinativo: TDateField
      FieldName = 'inativo'
    end
    object qryInstrucoesInatividadeMaxima: TIntegerField
      FieldName = 'inatividademaxima'
    end
  end
  object dsrInstrucoes: TtecDataSource
    DataSet = qryInstrucoes
    Left = 104
    Top = 32
  end
  object qryInstrucoesProximo: TtecQuery
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
      ';'
      'select coalesce(max(codigo),0)+1 as codigo'
      'from instrucoestrabalho')
    RequestLive = True
    Left = 224
    Top = 16
    object qryInstrucoesProximocodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object qryInstrucoesTrabalhoOperacoes: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryInstrucoesTrabalhoOperacoesAfterOpen
    AfterClose = qryInstrucoesTrabalhoOperacoesAfterClose
    AfterEdit = qryInstrucoesTrabalhoOperacoesAfterEdit
    AfterPost = qryInstrucoesTrabalhoOperacoesAfterPost
    BeforeDelete = qryInstrucoesTrabalhoOperacoesBeforeDelete
    AfterDelete = qryInstrucoesTrabalhoOperacoesAfterDelete
    OnNewRecord = qryInstrucoesTrabalhoOperacoesNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT ito.*,'
      '       o.Nome, o.C01, o.C02, o.C03, o.descricao,'
      '       TempoPadrao(o.Codigo, CURRENT_DATE) AS TempoPadrao'
      ''
      'FROM instrucoestrabalhooperacoes ito'
      '     JOIN Operacoes o ON ito.Operacao = o.Codigo'
      ''
      'WHERE ito.InstrucaoTrabalho = :Instrucao'
      ''
      'ORDER BY o.Nome, o.C01, o.C02, o.C03'
      ''
      '')
    RequestLive = True
    Left = 72
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Instrucao'
        ParamType = ptUnknown
      end>
    object qryInstrucoesTrabalhoOperacoesinstrucaotrabalho: TIntegerField
      FieldName = 'instrucaotrabalho'
      DisplayFormat = '0'
    end
    object qryInstrucoesTrabalhoOperacoesoperacao: TIntegerField
      DisplayLabel = 'opera'#231#227'o'
      FieldName = 'operacao'
      Required = True
      DisplayFormat = '0'
    end
    object qryInstrucoesTrabalhoOperacoesnome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 10
    end
    object qryInstrucoesTrabalhoOperacoesc01: TStringField
      DisplayLabel = 'C1'
      FieldName = 'c01'
      Size = 2
    end
    object qryInstrucoesTrabalhoOperacoesc02: TStringField
      FieldName = 'c02'
      Size = 2
    end
    object qryInstrucoesTrabalhoOperacoesc03: TStringField
      FieldName = 'c03'
      Size = 2
    end
    object qryInstrucoesTrabalhoOperacoesdescricao: TStringField
      FieldName = 'descricao'
      Size = 60
    end
    object qryInstrucoesTrabalhoOperacoestempopadrao: TFloatField
      FieldName = 'tempopadrao'
      DisplayFormat = '0.00'
    end
  end
  object dsrInstrucoesTrabalhoOperacoes: TtecDataSource
    DataSet = qryInstrucoesTrabalhoOperacoes
    OnDataChange = dsrInstrucoesTrabalhoOperacoesDataChange
    Left = 88
    Top = 184
  end
  object qryRegistrodasOperacoes: TtecQuery
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
      ';'
      'SELECT Inclusao.UsuarioInclusao,'
      
        '       CAST(TO_CHAR(Inclusao.DataInclusao, '#39'DD/MM/YYYY HH24:MI:S' +
        'S'#39') AS VARCHAR(20)) AS DataInclusao,'
      '      (SELECT u.Nome'
      '          FROM Usuarios u'
      
        '          WHERE u.UseName = UsuarioInclusao) AS NomeUsuarioInclu' +
        'sao,'
      ''
      '       Alteracao.UsuarioAlteracao,'
      
        '       CAST(TO_CHAR(Alteracao.DataAlteracao, '#39'DD/MM/YYYY HH24:MI' +
        ':SS'#39') AS VARCHAR(20)) AS DataAlteracao,'
      '      (SELECT u.Nome'
      '          FROM Usuarios u'
      
        '          WHERE u.UseName = UsuarioAlteracao) AS NomeUsuarioAlte' +
        'racao,'
      '       Alteracao.Operacao,'
      '       Alteracao.Tabela'
      ''
      'FROM'
      ''
      '('
      ' SELECT Inclusao.*'
      ' FROM'
      ''
      ' ('
      '  (SELECT itl.Trigger_User    AS UsuarioInclusao,'
      '          itl.Trigger_Changed AS DataInclusao'
      '      FROM InstrucoesTrabalho_Log itl'
      '      WHERE itl.Codigo   = :Instrucao AND'
      '            Trigger_Mode = '#39'INSERT'#39
      '      ORDER BY itl.Trigger_Changed DESC LIMIT 1)'
      ''
      ''
      '  UNION ALL'
      ''
      '  (SELECT CAST(NULL AS VARCHAR(50)) AS UsuarioInclusao,'
      '          CAST(NULL AS TIMESTAMP)   AS DataInclusao'
      '      WHERE NOT EXISTS (SELECT itl.Codigo'
      '                           FROM InstrucoesTrabalho_Log itl'
      '                           WHERE itl.Codigo   = :Instrucao AND'
      '                                 Trigger_Mode = '#39'INSERT'#39
      
        '                           ORDER BY itl.Trigger_Changed DESC LIM' +
        'IT 1))'
      ' ) AS Inclusao'
      ''
      ') AS Inclusao,'
      ''
      ''
      '('
      ' SELECT Alteracao.*'
      ' FROM'
      ''
      ' ('
      '  SELECT Alteracao.* FROM'
      ''
      '  ('
      '   (SELECT itl.Trigger_User    AS UsuarioAlteracao,'
      '           itl.Trigger_Changed AS DataAlteracao,'
      ''
      
        '           CAST(CASE WHEN Trigger_Mode = '#39'INSERT'#39' THEN '#39'INCLUS'#195'O' +
        #39
      
        '                                                  ELSE '#39'ALTERA'#199#195 +
        'O'#39
      '                END AS VARCHAR(10)) AS Operacao,'
      '           CAST('#39'INSTRU'#199#213'ES TRABALHO'#39' AS VARCHAR(30)) AS Tabela'
      ''
      '       FROM InstrucoesTrabalho_Log itl'
      '       WHERE itl.Codigo = :Instrucao              AND'
      '             Trigger_Mode IN ('#39'INSERT'#39', '#39'UPDATE'#39') AND'
      '             Trigger_Tuple = '#39'new'#39
      '       ORDER BY itl.Trigger_Changed DESC LIMIT 1)'
      ''
      ''
      '   UNION ALL'
      ''
      '   (SELECT itl.Trigger_User    AS UsuarioAlteracao,'
      '           itl.Trigger_Changed AS DataAlteracao,'
      ''
      
        '           CAST(CASE WHEN Trigger_Mode = '#39'INSERT'#39' THEN '#39'INCLUS'#195'O' +
        #39
      
        '                     WHEN Trigger_Mode = '#39'UPDATE'#39' THEN '#39'ALTERA'#199#195 +
        'O'#39
      
        '                                                  ELSE '#39'EXCLUS'#195'O' +
        #39
      '                END AS VARCHAR(10)) AS Operacao,'
      
        '           CAST('#39'I. TRABALHO OPERA'#199#213'ES'#39' AS VARCHAR(30)) AS Tabel' +
        'a'
      ''
      '       FROM InstrucoesTrabalhoOperacoes_Log itl'
      '       WHERE itl.InstrucaoTrabalho = :Instrucao AND'
      '             Trigger_Mode IN ('#39'INSERT'#39', '#39'UPDATE'#39', '#39'DELETE'#39')'
      '       ORDER BY itl.Trigger_Changed DESC LIMIT 1)'
      ''
      '  ) AS Alteracao'
      '  ORDER BY DataAlteracao DESC LIMIT 1'
      ' ) AS Alteracao'
      ') AS Alteracao'
      'ORDER BY UsuarioInclusao')
    RequestLive = False
    Left = 392
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Instrucao'
        ParamType = ptUnknown
      end>
    object qryRegistrodasOperacoesusuarioinclusao: TStringField
      FieldName = 'usuarioinclusao'
      Size = 32
    end
    object qryRegistrodasOperacoesdatainclusao: TStringField
      FieldName = 'datainclusao'
    end
    object qryRegistrodasOperacoesusuarioalteracao: TStringField
      FieldName = 'usuarioalteracao'
      Size = 50
    end
    object qryRegistrodasOperacoesdataalteracao: TStringField
      FieldName = 'dataalteracao'
    end
    object qryRegistrodasOperacoesoperacao: TStringField
      FieldName = 'operacao'
      Size = 10
    end
    object qryRegistrodasOperacoestabela: TStringField
      FieldName = 'tabela'
      Size = 30
    end
    object qryRegistrodasOperacoesnomeusuarioinclusao: TStringField
      FieldName = 'nomeusuarioinclusao'
      Size = 40
    end
    object qryRegistrodasOperacoesnomeusuarioalteracao: TStringField
      FieldName = 'nomeusuarioalteracao'
      Size = 40
    end
  end
  object fdsImprimirInstrucoes: TfrDBDataSet
    CloseDataSource = True
    DataSet = qryImprimirInstrucoes
    Left = 264
    Top = 160
  end
  object qryImprimirInstrucoes: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'datainclusao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataalteracao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'InclusaoInstrucoes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AlteracaoInstrucoes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Ordenacao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';'
      'select it.*'
      'from'
      '('
      'select it.*,'
      '       o.codigo as codigooperacao,'
      '       o.nome, o.c01, o.c02, o.c03,'
      '       o.setup,'
      '       o.planocontrole,'
      '       o.descricao as descricaooperacao,'
      ''
      '       TempoPadrao(o.Codigo, CURRENT_DATE) AS TempoPadrao,'
      ''
      '       (select itl.trigger_user'
      '        from instrucoestrabalho_log itl'
      '        where trigger_mode = '#39'INSERT'#39
      '          and itl.codigo = it.codigo'
      '          %datainclusao'
      '        order by itl.trigger_changed desc limit 1'
      '       )  as UsuarioInclusao,'
      ''
      '       (select itl.trigger_changed'
      '        from instrucoestrabalho_log itl'
      '        where trigger_mode = '#39'INSERT'#39
      '          and itl.codigo = it.codigo'
      '          %datainclusao'
      '        order by itl.trigger_changed desc limit 1'
      '       )  as DataHoraInclusao,'
      ''
      ''
      '('
      'SELECT selecao.usuarioalteracao FROM'
      '('
      '     ('
      '     select itl.trigger_user as usuarioAlteracao,'
      #9#9#9'itl.trigger_changed as dataHoraAlteracao'
      '       from instrucoestrabalho_log itl'
      '        where itl.codigo = it.codigo'
      '         %dataalteracao'
      '          and itl.trigger_mode in ('#39'INSERT'#39', '#39'UPDATE'#39')'
      '          and itl.trigger_tuple = '#39'new'#39
      '         order by itl.trigger_changed desc limit 1'
      '      )'
      #9'union all'
      #9'  ('
      '      select itol.trigger_user as usuarioAlteracao,'
      #9#9#9' itol.trigger_changed as dataHoraAlteracao'
      '       from instrucoestrabalhooperacoes_log itol'
      '        where itol.Instrucao = o.codigo'
      '        %dataalteracao'
      ''
      '         and itol.trigger_mode in ('#39'INSERT'#39', '#39'UPDATE'#39')'
      '          and itol.trigger_tuple = '#39'new'#39
      '        order by itol.trigger_changed desc limit 1'
      '        )'
      ') AS selecao'
      '  order by dataHoraAlteracao desc limit 1) as usuarioalteracao,'
      ''
      ''
      ''
      ' ('
      ' select selecao.DataHoraAlteracao from'
      ' ('
      #9
      
        #9'   (select cast(to_char(itl.trigger_changed, '#39'DD/MM/YY HH24:MI:' +
        'SS'#39') as varchar(20)) as datahoraalteracao'
      '        from instrucoestrabalho_log itl'
      '         where itl.codigo = it.codigo'
      '          %dataalteracao'
      '          and trigger_mode in ('#39'INSERT'#39', '#39'UPDATE'#39')'
      '          and trigger_tuple = '#39'new'#39
      '         order by itl.trigger_changed desc limit 1'
      '       )'
      #9'   union all'
      
        #9'   (select cast(to_char(itol.trigger_changed, '#39'DD/MM/YY HH24:MI' +
        ':SS'#39') as varchar(20))as datahoraalteracao'
      '        from instrucoestrabalhooperacoes_log itol'
      '         where itol.Instrucao = it.codigo'
      '          %dataalteracao'
      '          and trigger_mode in ('#39'INSERT'#39', '#39'UPDATE'#39')'
      '          and trigger_tuple = '#39'new'#39
      '         order by itol.trigger_changed desc limit 1'
      '       )'
      
        ')as selecao'#9'order by datahoraalteracao limit 1)   as DataHoraAlt' +
        'eracao,'
      ''
      ''
      '      (select selecao.operacao from'
      #9'  ('
      
        #9'  (select cast(case when trigger_mode = '#39'INSERT'#39' THEN '#39'INCLUS'#195'O' +
        #39
      
        '                                        else '#39'ALTERA'#199#195'O'#39' end as ' +
        'varchar(10)) as operacao,'
      #9#9#9#9#9'itl.trigger_changed as dataHoraAlteracao'#9#9#9#9#9
      '        from instrucoestrabalho_log itl'
      '         where itl.codigo = it.codigo'
      '         %dataalteracao'
      '          and trigger_mode in ('#39'INSERT'#39', '#39'UPDATE'#39')'
      '          and trigger_tuple = '#39'new'#39
      '         order by itl.trigger_changed desc limit 1'
      '        )'#9
      #9'    union all'#9
      #9
      
        #9'    (select cast(case when trigger_mode = '#39'INSERT'#39' THEN '#39'INCLUS' +
        #195'O'#39
      
        '                                        else '#39'ALTERA'#199#195'O'#39' end as ' +
        'varchar(10)) as operacao,'
      #9#9#9#9#9'itol.trigger_changed as dataHoraAlteracao'#9#9#9#9#9
      '        from instrucoestrabalhooperacoes_log itol'
      '         where itol.Instrucao = it.codigo'
      '        %dataalteracao'
      '          and trigger_mode in ('#39'INSERT'#39', '#39'UPDATE'#39')'
      '          and trigger_tuple = '#39'new'#39
      '         order by itol.trigger_changed desc limit 1'
      '        )'
      #9#9')as selecao'
      #9#9'order by dataHoraAlteracao desc limit 1) as operacao,'
      ''
      '       (select selecao.tabela'
      '        FROM'
      '        ('
      '        ('
      '         select cast('#39'M'#193'QUINAS'#39' as varchar(30)) as tabela,'
      '                itl.trigger_changed as dataHoraAlteracao'
      '         from instrucoestrabalho_log itl'
      '          where itl.codigo = it.codigo'
      '          %dataalteracao'
      '           and trigger_mode in ('#39'INSERT'#39', '#39'UPDATE'#39')'
      '           and trigger_tuple = '#39'new'#39
      '          order by itl.trigger_changed desc limit 1'
      '         )'
      '         union all'
      '        ('
      '         select cast('#39'OP. M'#193'QUINAS'#39' as varchar(30)) as tabela,'
      '                itl.trigger_changed as dataHoraAlteracao'
      '         from instrucoestrabalhooperacoes_log itol'
      '          where itl.Instrucao = it.codigo'
      '          %dataalteracao'
      '           and trigger_mode in ('#39'INSERT'#39', '#39'UPDATE'#39')'
      '           and trigger_tuple = '#39'new'#39
      '          order by itl.trigger_changed desc limit 1'
      '         )'
      '        ) as selecao'
      '        order by dataHoraAlteracao desc limit 1) as Tabela'
      ''
      #9#9'from (instrucoestrabalho it'
      #9'     join (instrucoestrabalhooperacoes ito'
      #9#9#9'   join operacoes o'
      #9#9#9'   on ito.operacao = o.codigo)'
      #9'     on it.codigo = ito.InstrucaoTrabalho)'
      ') as it'
      'where true'
      '%Inclusaoinstrucoes'
      '%Alteracaoinstrucoes'
      ''
      '%Ordenacao'
      ''
      ''
      '/*'
      ''
      ':datainicialinclusao'
      ':datafinalinclusao'
      ''
      ':datainicialalteracao'
      ':datafinalalteracao'
      '*/'
      '')
    RequestLive = False
    Left = 376
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'datainicialinclusao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinalinclusao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datainicialalteracao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinalalteracao'
        ParamType = ptUnknown
      end>
    object qryImprimirInstrucoescodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryImprimirInstrucoesdescricao: TStringField
      FieldName = 'descricao'
      Size = 40
    end
    object qryImprimirInstrucoesusuarioinclusao: TStringField
      FieldName = 'usuarioinclusao'
      Size = 7
    end
    object qryImprimirInstrucoesdatahorainclusao: TDateTimeField
      FieldName = 'datahorainclusao'
    end
    object qryImprimirInstrucoesusuarioalteracao: TStringField
      FieldName = 'usuarioalteracao'
      Size = 7
    end
    object qryImprimirInstrucoesdatahoraalteracao: TStringField
      FieldName = 'datahoraalteracao'
      Size = 17
    end
    object qryImprimirInstrucoesoperacao: TStringField
      FieldName = 'operacao'
      Size = 8
    end
    object qryImprimirInstrucoestabela: TStringField
      FieldName = 'tabela'
      Size = 8
    end
    object qryImprimirInstrucoescodigooperacao: TIntegerField
      FieldName = 'codigooperacao'
      DisplayFormat = '0'
    end
    object qryImprimirInstrucoesnome: TStringField
      FieldName = 'nome'
      Size = 10
    end
    object qryImprimirInstrucoesc01: TStringField
      FieldName = 'c01'
      Size = 2
    end
    object qryImprimirInstrucoesc02: TStringField
      FieldName = 'c02'
      Size = 2
    end
    object qryImprimirInstrucoesc03: TStringField
      FieldName = 'c03'
      Size = 2
    end
    object qryImprimirInstrucoessetup: TBooleanField
      FieldName = 'setup'
    end
    object qryImprimirInstrucoesplanocontrole: TBooleanField
      FieldName = 'planocontrole'
    end
    object qryImprimirInstrucoesdescricaooperacao: TStringField
      FieldName = 'descricaooperacao'
      Size = 60
    end
    object qryImprimirInstrucoesTempoPadrao: TFloatField
      FieldName = 'tempopadrao'
      DisplayFormat = '0.00'
    end
    object qryImprimirInstrucoessequencia: TStringField
      FieldName = 'sequencia'
      Size = 6
    end
  end
  object frpImprimirInstrucoes: TfrReport
    Dataset = fdsImprimirInstrucoes
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnBeforePrint = frpImprimirInstrucoesBeforePrint
    Left = 256
    Top = 96
    ReportForm = {
      190000006F3E000019FFFFFFFF0A0050444643726561746F7200FFFFFFFFFF00
      000000340800009A0B00004800000024000000240000002B0000000000040000
      FFFFFFFF010000000000000000000000030400466F726D00FEFFFFFFDC000000
      780000007C0100002C0100000402000500626567696E0D0300656E64000200DE
      0000000900636162506167696E610002010000000024000000F5020000580000
      003000020001000000000000000000FFFFFF1F00000000000000000000000000
      FFFF000000000002000000010000000000000001000000C80000001400000001
      0000000000000200470100000900726470506167696E61000201000000008802
      0000F50200000E0000003000030001000000000000000000FFFFFF1F00000000
      000000000000000000FFFF000000000002000000010000000000000001000000
      C800000014000000010000000000000200C201000005004461646F7300020100
      000000E7000000F50200000F0000003000050001000000000000000000FFFFFF
      1F000000001600666473496D7072696D6972466C75786F6772616D6173000000
      000000000000000000000002000000010000000000000001000000C800000014
      000000010000000000000200550200000C0047726F7570486561646572310002
      010000000093000000F50200000E0000003000100001000000000000000000FF
      FFFF1F0000000021005B717279496D7072696D6972466C75786F6772616D6173
      2E22636F6469676F225D00000000000000FFFF00000000000200000001000000
      00060046696C6861310001000000C800000014000000010000000000000200BB
      020000060046696C68613100020100000000BC000000F50200001A0000003000
      150001000000000000000000FFFFFF1F00000000000000000000000000000000
      0000000002000000010000000000000001000000C80000001400000001000000
      00000000003F0300000D006D6D6F5A65627261646F53756200020058000000E8
      000000770200000D0000004300000001000000000000000000FFFFFF1F2C0200
      00000000000000000000FFFF0000000000020000000100000000050041726961
      6C0008000000000000000000000000000100020000000000FFFFFF0000000002
      000000000000000000C00300000A006D6D6F5A65627261646F00020048000000
      93000000880200000E0000004300000001000000000000000000FFFFFF1F2C02
      0000000000000000000000FFFF00000000000200000001000000000500417269
      616C0008000000020000000000000000000100020000000000FFFFFF00000000
      020000000000000000005304000005004D656D6F350002002400000088020000
      780000000B0000004300000001000000000000000000FFFFFF1F2C0200000000
      00010011005B54494D4520235468683A6D6D3A73735D00000000FFFF00000000
      00020000000100000006090068656C7665746963610007000000000000000000
      000000000100020000000000FFFFFF0000000002000000000000000100781C00
      0007006670764C6F676F000200450000002A000000900000002C000000050000
      0001000000000000000000FFFFFF1F2C020000000000000000000000FFFF0000
      0000000200000001000000000100781C0000424DCE1700000000000036040000
      280000008300000026000000010008000000000098130000120B0000120B0000
      000100000001000000000000E8E5A800AA9E000099990000ADADAD003A3C4100
      A3970000BFB73700D8D48600FBFAF000A5A5A5001E1D1C00D8D9DA0054575A00
      D6D6D500E7E8F20012161B00B6AD1900CBC55B008C8D9200BEC0C500E1E2E400
      85878A005E606300494C4F00090D12002C2E3300DEDB98007D7F8100EFEDCB00
      B9BABB00AEA400007C7B7B00C5BE440066666600D1CC6F00CDC9810048484600
      F7F6E600AFA5080004080D00F9F8ED00B8AF2700DBD68C00999999001B1A1900
      C6BF5100131312003B3A3A00FFFFFF00EAE8BE00CCCCCC0023262A00E2DEA400
      F1EFD600B0B1B300D3CD7500B1A81000CCCC6600727272005352520043424200
      01060A00ECE9C3008C8C8B00F5F4DF004A4A4A0057575600B6AC1F00282B3000
      C7C05C0061615F00F7F7F70088888700DDD89300E3E0A600FDFCF70021242900
      070A1000BDB53100C5BE4A00E3E3E200A69C000099999900BABAB900DEDEDE00
      525458002A292800D9D58A005F5E5D00C7C595001B1E2300E8E5B60000000700
      B5AB1300D5D07B00C6C6C500B2A80B0021202000B9B12400504F4E0066666600
      6B6D7000B5B5BD0084848400E0DC9E00BCB42C00F7EFD6005B5B5A00EFEFEF00
      87898B00DEDEE6003E3D3C0014181E00C8C25300CCC55F00A8A9AC00BDBDBC00
      E5E1AC0075767900181B2000E6E6E6000E111700081019003333330092919100
      2D2C2B00B5B5B400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000313131313131313131313131313131313131313131313131
      31313131313131313131313131313131313131543D42470E3131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131523131313131486D3131316D6D4C3131316D6D3131
      31313131313131316D4831313131313131316D6D3131316D040A6C6C31313131
      3131486D6D4C3131313131316D6D4C313131313131313131313131486D6D6D31
      3131313131486D6D48313131316D483131316D6D313131313131313131313131
      6D6D6D3131486D6D6D31313131313152313131317F7E6631554225256031603D
      42647931420C313B7D316D6C3D70403131662C316D593D7068313133646C7025
      31484255312C70643059313131310C2525420E31477431420E48257931313154
      42433D474C4C640E3120423C300A3131207E2C317F7025474848425151253160
      3C316D59253C620A312C25433068313131313152313131316C20313159593131
      31317C7D4C4C31487C0E3159683177424C51347531434031203D487957543130
      494C7F3D31487C0C310B37317F70313131313C6631313131642C317C33487E51
      313131313179602F55317C3331316D793B7031487E14314857043131316D7C55
      557E311E3031542D4C314340313148790A0B4C313131315231313131477D3131
      25306C64334C5779313131487C0E31224931422C31314340316C7D313C7D3131
      594931570C31543D31487C0C3168705930253131313170706C3C0E313C0A3130
      33317C513131310C702570474C4C3033312C7C64300A3148300E317962434322
      48483051517C31603D316D6464590B2C31547C42301C31313131315231313131
      4749313166420C5548313D2C484831487C0E48302C311C4248516275316C7D31
      493D4879627F31256848373031487C0E3131550E207031313131473C0C554831
      642C4C7E330C62793131316830796D3131487C3331577D6D6D31314830333148
      7C49555131487C0C0C7E4C2C703131480C0E7C2C313C476D6D31313131313152
      313131040B7E20316D473C6C33310E3D3C6C7931254264646D31486C42706831
      316C7D31484742702031310E3D433D6C31484355314043473D0A31313131796C
      3C6C0E316670597E3C3D20313131310E256C6C7731316C0E312C3D4743043177
      2F3D0A3133424366484825643C7E6C7C74316D225943425531543D59437D3131
      313131523131316D643B6D3131316D514831313179514C316D51793131313131
      796D3131313C40313131796D313131313179794831317F6D316D151548313131
      31313131795148314879516D796D3131313131313151517931317F6D31316D51
      516D3151577F6D313131797931316D51516D5148313131515151313131314851
      516D313131313152313131314004313131313131313131313131313131313131
      3131313131313131316804313131313131313131313131313148660F31313131
      313131313131313131313131313131313131313131313131313131313131220E
      3131313131313131665531313131313131313131313131313131313131313131
      3131313131313131313131523131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131315C46
      121212463F313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131315231313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31315F06020202061B3131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131313131313131523131313131310E40173C1818
      3D6E3131313131310C2C666C3C181818181805683131313131316D3768220D05
      16313131313108021F1F1F523531313131317207070707070707070707070707
      0750732B3631313131313131313131362B73212112081D313131313131313131
      23505050504B3131313131313131313F08122E505050085231313131312C103E
      191919195D17313131317966713E4E191919191919195D0D31313131312C3428
      2819190017313131313108021F1F1F5235313131313111520202020202020202
      02020202020202022776313131313131313F501F02020202020202075C313131
      313131316A060202065F313131313131314C1202020202020202215231313131
      75287A78787878784E223131310E1A3E10787871717171717171281731313131
      773E7A717171712822313131313108021F1F1F5235313131313144021F1F1F1F
      1F1F1F1F1F1F1F1F1F1F1F1F1F1F1D31313131310802021F1F1F1F1F1F1F1F02
      022331313131313107021F1F0208313131313131313A521F1F1F1F1F1F1F5052
      313131310D4E7878787A7A71282231316D7C4E7878784E4E7A71717171712817
      3131312C3E7171717119195D22313131313108021F1F1F5269314C4C4C4C631F
      1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F52503131313138521F1F1F02020202
      02021F1F1F5212313131313107021F1F0208313131313131361F1F1F1F1F0202
      020221523131316D457A78787A3D370E0E5131313B3E7878787A2274140E0E0E
      0E0E0E15313115787A787871190D0A145A2A6A6A6A2A5F363636363650441111
      11113226262626262626262626262626264A1F1F1F1F612631311B521F1F1F02
      443A08082363021F1F1F525F3131313107021F1F02083131313131311B021F1F
      1F1F6A2B353532523131310E71717171710C313131313115781078784E683131
      313131313131313131311C287878787A2C3131310106020202025F3131313131
      5052020202023631313131313131313131313131313144021F1F1F3231263902
      1F1F1F584C31313131311B27021F1F1F3631313107021F1F0208313131313131
      23021F1F1F11093131313152313131337A717171454831313131312C28787810
      344C313131313131313131313131057A78784E663131313135021F1F1F025F31
      3131313150021F1F1F1F3631313131313131313131313131314C5E021F1F0276
      315F521F1F1F4B313131313131313132271F1F527331313107021F1F02083131
      3131313112021F1F0272313131313152313131601978787A7C4C313131313166
      2878781045166E6E6E6E6E6E6E6E1C0431555B1078717A603131313135021F1F
      1F025F313131313150021F1F1F1F36313131313131314C0909090909363A021F
      1F1F1F3F314F021F02723131313131313131313123021F1F1109313107021F1F
      02083131313131312E021F1F0273313131313152313131601978787A054C3131
      313131561978787871282828282828282828005631337A717171346D31313131
      3552020202025F31313131312106020202023631313131762E635E6161616161
      1F1F1F1F1F1F114C26611F1F0276313131313131313131311D1F1F1F1F1D3131
      07021F1F02083131313131312E021F1F023A313131313152313131601978787A
      054C31313131311819787878787878787878787878784E1731141978787A4548
      31313131764444444444241551515151464F4F4F4F4F413131313A0202021F1F
      1F1F1F1F1F1F1F1F1F521B311D1F1F1F1F363131313131313131313126391F1F
      1F5C313107021F1F02083131313131312E021F1F023A31313131315231313160
      1978787A054C31313131315619787878787878787878787878784E1731337A71
      7171346D313131313109090909097D713434347A37313131313131313158521F
      1F1F1F1F0202020202020202275831311D1F1F1F1F1D31313131313131313131
      26391F1F1F5C313107021F1F02083131313131312E021F1F023A313131313152
      313131601978787A054C3131313131224E787878784E28282828282828280056
      310C787171715B0C31313131313131313131133E1010105D7431313131313131
      2939021F1F1F1F3911636363636A50083631313126611F1F024B313131313131
      313131313F021F1F1F36313107021F1F02083131313131312E021F1F023A3131
      31313152313131601978787A054C313131313116287878101A2C2C2C2C2C2C2C
      2C2C7D1E316D1A7A7878197F31313131313131313131134E7878782874313131
      3131313176021F1F1F1F23263131313131313131313131313107021F02213131
      313131313131313173021F1F444C313107021F1F02083131313131312E021F1F
      023A313131313152313131601978787A054C31313131317F1971717134483131
      31313131313131313131561978784E6631313131313131313131134E78787828
      74313131313131312B521F1F1F6129313131313131313131313131313158521F
      1F024A31313131313131317602021F522331313107021F1F0208313131313131
      2E021F1F023A313131313152313131331978787A053131313131316D347A7878
      4E133131313131313131313131317D2878787171043131313131313131311300
      1919190004313131313131312B521F1F1F274131313131313131313131313131
      310911021F1F1F232631313131295F1F1F1F1F612931313107021F1F022B3131
      313131312E021F1F52233131313131520E14602C7A78787A7C141414140C3131
      203E78787171660A1E6014141414140E3131155B107878107A567D371E1E1E1E
      1E1E13566C6C6C182C75757575756D315C021F1F1F1F211B1B1B1B1B1B4A4A4A
      4A4A3631313176021F1F1F0261502323725E021F1F1F0258762B2B4A44021F1F
      1F504A4A4A2B1D312E021F1F1F074A4A4A4A5C520D7A7A7A78787878787A7A7A
      5D1731317945197878784E4E7A7A7A7A7A7A5D6C313131165D71717171191919
      19191919195D6E313131313166007A7A7A4E1431295E021F1F1F020202020202
      0202020202062B313131315802021F1F1F020202021F1F1F1F52384C39525252
      1F1F1F1F1F020202020608312E021F1F1F1F0202020221521771717878787878
      787171714E22313131335B28717878787871717171714E1731313131173E7A71
      7878787878787878784E6E313131313166287171717A6031314A521F1F1F1F1F
      1F1F1F1F1F1F1F1F1F524A31313131316939521F1F1F1F1F1F1F1F0202583109
      11021F1F1F1F1F1F1F1F1F1F1F022B312E021F1F1F1F1F1F1F1F50520D191919
      78787878781919190017313131310C0D10284E4E191919191919000D31313131
      317D1A4E4E4E19191919191919001C3131313131662878787810603131315F02
      02020202020202020202020202062B3131313131313673390202020202026172
      1D313129615252521F1F1F1F1F020202020608312E021F1F1F1F020202022152
      7D17173C107878714D1717170D2C3131313131310E0A1C3B2217171717170D7D
      31313131313148757D77661717171717170D0431313131316628787878106031
      313131364A3A7272727272727272727272505C3131313131313131264B5F7373
      38354131313131093A7272725E1F1F1F1F4F1212122E5C312E021F1F1F631212
      121258523131310E1978787A0531313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313117003E3E
      3E5D753131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313107021F1F52583131313131312E021F1F
      0223313131313152313131601978787A054C3131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      7F686E6E6E6E1531313131313131313131313131313131313131313131313131
      313131313131313131313131313131313131313121021F1F0207313131313131
      2E021F1F023A313131313152313131601978787A054C31313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131313131313131313131313173021F1F1F1F4F3A
      233A32312E021F1F023A313131313152313131601978787A054C313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313169521F1F
      1F1F0202020608312E021F1F023A313131313152313131601978787A054C3131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      0963521F1F1F1F1F1F024A312E021F1F023A313131313152313131601971717A
      054C313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131314150611F1F1F1F1F024A3150021F1F023A3131313131523131310C
      0D17176C774C3131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131315C3872727272725C31082E2E2E2E1B313131313152
      0000021D000005004D656D6F31000200A601000024000000FF00000011000000
      4300000001000000000000000000FFFFFF1F2C020000000000010008005B5449
      54554C4F5D00000000FFFF0000000000020000000100000000090068656C7665
      74696361000B000000020000000000020000000100020000000000FFFFFF0000
      000002000000000000000000981D000006004D656D6F3235000200A602000024
      000000300000000F0000004300000001000000000000000000FFFFFF1F2C0200
      00000000010013005B4441544520234464642F6D6D2F797979795D00000000FF
      FF0000000000020000000100000006090068656C766574696361000700000000
      0000000000010000000100020000000000FFFFFF000000000200000000000000
      00002F1E000006004D656D6F3236000200B602000036000000200000000F0000
      004300000001000000000000000000FFFFFF1F2C020000000000010014005B50
      414745235D2F5B544F54414C50414745535D00000000FFFF0000000000020000
      000100000000090068656C766574696361000700000000000000000001000000
      0100020000000000FFFFFF0000000002000000000000000000D31E000006004D
      656D6F31320002003002000088020000A40000000B0000004300000001000000
      000000000000FFFFFF1F2C02000000000001002100746563534F4654202D2054
      65636E6F6C6F67696120656D2053697374656D61732000000000FFFF00000000
      00020000000100000006090068656C7665746963610007000000000000000000
      010000000100020000000000FFFFFF0000000002000000000000000000611F00
      0006004D656D6F3337000200A601000037000000FF0000002500000043000000
      F4010000000000000000FFFFFF1F2C02000000000001000B005B535542544954
      554C4F5D00000000FFFF0000000000020000000100000000090068656C766574
      6963610008000000000000000000020000000100020000000000FFFFFF000000
      0002000000000000000000E21F000006004D656D6F3738000200BCFFFFFF7C01
      0000400000001300000000000100F4010000000000000000FFFFFF1F2C020000
      000000000000000000FFFF0000000000020000000100000006090068656C7665
      746963610008000000000000000000110000000100020000000000FFFFFF0000
      0000020000000000000000008820000013006D6D6F464F4E4546494C49414C42
      4153455F52000200DB00000038000000CA0000000A00000004000000F4010000
      000000000000FFFFFF1F2C02000000000001001600464F4E453A205B464F4E45
      46494C49414C424153455D00000000FFFF000000000002000000010000000009
      0068656C76657469636100060000000000000000001000000001000200000000
      00FFFFFF00000000020000000000000000003D21000014006D6D6F454E444552
      45434F5F42414952524F5F52000200DB00000042000000CB0000000A00000000
      000000F4010000000000000000FFFFFF1F2C020000000000010024005B525541
      46494C49414C424153455D202D205B42414952524F46494C49414C424153455D
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      06000000000000000000100000000100020000000000FFFFFF00000000020000
      000000000000000A22000012006D6D6F4345505F4349444144455F55465F5200
      0200DB0000004D000000CB0000000A00000000000000F4010000000000000000
      FFFFFF1F2C02000000000001003E004345503A205B43455046494C49414C4241
      53455D202D205B43494441444546494C49414C424153455D202D205B45535441
      444F46494C49414C424153455D00000000FFFF00000000000200000001000000
      00090068656C7665746963610006000000000000000000100000000100020000
      000000FFFFFF0000000002000000000000000000A022000008006D6D6F52415A
      414F000200DB00000024000000CB0000001400000003000000F4010000000000
      000000FFFFFF1F2C020000000000010011005B52415A414F46494C49414C4241
      53455D00000000FFFF0000000000020000000100000000090068656C76657469
      63610006000000000000000000100000000100020000000000FFFFFF00000000
      020000000000000000004223000006004D656D6F31390002006B000000E90000
      004D0000000C00000043000000F4010000000000000000FFFFFF1F2C02000000
      000001001F005B717279496D7072696D6972466C75786F6772616D61732E226E
      6F6D65225D00000000FFFF0000000000020000000100000000090068656C7665
      746963610006000000000000000000080000001700020000000000FFFFFF0000
      000002000000000000000000E323000006004D656D6F3330000200B9000000E9
      000000170000000C00000043000000F4010000000000000000FFFFFF1F2C0200
      0000000001001E005B717279496D7072696D6972466C75786F6772616D61732E
      22633031225D00000000FFFF0000000000020000000100000000090068656C76
      657469636100060000000000000000000A0000001700020000000000FFFFFF00
      000000020000000000000000008424000006004D656D6F3437000200D1000000
      E9000000160000000C00000043000000F4010000000000000000FFFFFF1F2C02
      000000000001001E005B717279496D7072696D6972466C75786F6772616D6173
      2E22633032225D00000000FFFF0000000000020000000100000000090068656C
      76657469636100060000000000000000000A0000001700020000000000FFFFFF
      00000000020000000000000000002525000006004D656D6F3331000200E80000
      00E9000000150000000C00000043000000F4010000000000000000FFFFFF1F2C
      02000000000001001E005B717279496D7072696D6972466C75786F6772616D61
      732E22633033225D00000000FFFF000000000002000000010000000009006865
      6C76657469636100060000000000000000000A0000001700020000000000FFFF
      FF0000000002000000000000000000D425000006004D656D6F3436000200FF00
      0000E9000000140100000C00000043000000F4010000000000000000FFFFFF1F
      2C02000000000001002C005B717279496D7072696D6972466C75786F6772616D
      61732E2264657363726963616F6F7065726163616F225D00000000FFFF000000
      0000020000000100000000090068656C76657469636100060000000000000000
      00080000001700020000000000FFFFFF00000000020000000000000000005926
      000005004D656D6F3300020057000000C9000000140000000B00000043000F00
      F4010000000000000000FFFFFF1F2C0200000000000100030053455100000000
      FFFF0000000000020000000100000000090068656C7665746963610006000000
      0000000000000A0000001700020000000000FFFFFF0000000002000000000000
      000000DD26000005004D656D6F34000200B8000000C9000000180000000B0000
      0043000F00F4010000000000000000FFFFFF1F2C020000000000010002004331
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      060000000000000000000A0000001700020000000000FFFFFF00000000020000
      000000000000006127000005004D656D6F36000200D0000000C9000000170000
      000B00000043000F00F4010000000000000000FFFFFF1F2C0200000000000100
      0200433200000000FFFF0000000000020000000100000000090068656C766574
      69636100060000000000000000000A0000001700020000000000FFFFFF000000
      0002000000000000000000E527000005004D656D6F37000200E7000000C90000
      00160000000B00000043000F00F4010000000000000000FFFFFF1F2C02000000
      000001000200433300000000FFFF000000000002000000010000000009006865
      6C76657469636100060000000000000000000A0000001700020000000000FFFF
      FF00000000020000000000000000007128000006004D656D6F3131000200FD00
      0000C9000000150100000B00000043000F00F4010000000000000000FFFFFF1F
      2C02000000000001000900444553435249C7C34F00000000FFFF000000000002
      0000000100000000090068656C76657469636100060000000000000000000A00
      00001700020000000000FFFFFF0000000002000000000000000000FD28000006
      004D656D6F313300020057000000BE000000790200000B00000043000F00F401
      0000000000000000FFFFFF1F2C020000000000010009004F50455241C7D54553
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      060000000000000000000A0000001700020000000000FFFFFF00000000020000
      000000000000008629000006004D656D6F323700020055020000C90000002300
      00000B00000043000F00F4010000000000000000FFFFFF1F2C02000000000001
      0006005345542D555000000000FFFF0000000000020000000100000000090068
      656C76657469636100060000000000000000000A0000001700020000000000FF
      FFFF00000000020000000000000000001A2A000006004D656D6F323900020078
      020000C9000000580000000B00000041000F00F4010000000000000000FFFFFF
      1F2C02000000000001001100504C414E4F20444520434F4E54524F4C45000000
      00FFFF0000000000020000000100000000090068656C76657469636100060000
      000000000000000A0000001700020000000000FFFFFF00000000020000000000
      00000000002B000006004D656D6F333600020063020000E90000000A0000000B
      00000043000F00F4010000000000000000FFFFFF1F2C02000000000001000000
      0006000500626567696E0D2F006966205B717279496D7072696D6972466C7578
      6F6772616D61732E227365747570225D203D2054727565207468656E0D0D0020
      206D656D6F203A3D202758270D0400656C73650D0D0020206D656D6F203A3D20
      27273B0D0300656E6400FFFF000000000002000000010000000006005461686F
      6D6100080000000000000000000A0000001700020000000000FFFFFF00000000
      02000000000000000000F02B000006004D656D6F33380002009E020000E90000
      000A0000000B00000043000F00F4010000000000000000FFFFFF1F2C02000000
      0000010000000006000500626567696E0D37006966205B717279496D7072696D
      6972466C75786F6772616D61732E22706C616E6F636F6E74726F6C65225D203D
      2054727565207468656E0D0D0020206D656D6F203A3D202758270D0400656C73
      650D0F0020206D656D6F203A3D2027273B20200D0300656E6400FFFF00000000
      0002000000010000000006005461686F6D6100080000000000000000000A0000
      001700020000000000FFFFFF00000000020000000000000000007C2C00000600
      4D656D6F3339000200DD01000065000000F30000000B00000043000B00F40100
      00000000000000FFFFFF1F2C02000000000001000900414C54455241C7C34F00
      000000FFFF0000000000020000000100000000090068656C7665746963610006
      0000000000000000000A0000001700020000000000FFFFFF0000000002000000
      000000000000062D000006004D656D6F3430000200A3010000700000003A0000
      000A00000043000B00F4010000000000000000FFFFFF1F2C0200000000000100
      0700555355C152494F00000000FFFF0000000000020000000100000000090068
      656C76657469636100060000000000000000000A0000001700020000000000FF
      FFFF00000000020000000000000000008D2D000006004D656D6F343200020048
      000000650000001D0000001500000043000F00F4010000000000000000FFFFFF
      1F2C02000000000001000400434F442E00000000FFFF00000000000200000001
      00000000090068656C76657469636100060000000000000000000A0000001700
      020000000000FFFFFF0000000002000000000000000000192E000006004D656D
      6F34340002006500000065000000FA0000001500000043000F00F40100000000
      00000000FFFFFF1F2C02000000000001000900444553435249C7C34F00000000
      FFFF0000000000020000000100000000090068656C7665746963610006000000
      0000000000000A0000000100020000000000FFFFFF0000000002000000000000
      000000A72E000006004D656D6F34380002005F01000070000000440000000A00
      000043000F00F4010000000000000000FFFFFF1F2C02000000000001000B0044
      415441204520484F524100000000FFFF00000000000200000001000000000900
      68656C76657469636100060000000000000000000A0000001700020000000000
      FFFFFF0000000002000000000000000000322F000006004D656D6F3439000200
      5F010000650000007E0000000B00000043000F00F4010000000000000000FFFF
      FF1F2C02000000000001000800494E434C5553C34F00000000FFFF0000000000
      020000000100000000090068656C76657469636100060000000000000000000A
      0000001700020000000000FFFFFF0000000002000000000000000000BC2F0000
      06004D656D6F353000020021020000700000003C0000000A00000043000B00F4
      010000000000000000FFFFFF1F2C02000000000001000700555355C152494F00
      000000FFFF0000000000020000000100000000090068656C7665746963610006
      0000000000000000000A0000001700020000000000FFFFFF0000000002000000
      0000000000004A30000006004D656D6F3531000200DD01000070000000440000
      000A00000043000F00F4010000000000000000FFFFFF1F2C0200000000000100
      0B0044415441204520484F524100000000FFFF00000000000200000001000000
      00090068656C76657469636100060000000000000000000A0000001700020000
      000000FFFFFF0000000002000000000000000000D530000006004D656D6F3532
      0002005D020000700000003A0000000A00000043000F00F40100000000000000
      00FFFFFF1F2C020101000000010008004F50455241C7C34F00000000FFFF0000
      000000020000000100000000090068656C766574696361000600000000000000
      00000A0000001700020000000000FFFFFF00000000020000000000000000005E
      31000006004D656D6F35330002009702000070000000390000000A0000004300
      0F00F4010000000000000000FFFFFF1F2C02010100000001000600544142454C
      4100000000FFFF0000000000020000000100000000090068656C766574696361
      00060000000000000000000A0000001700020000000000FFFFFF000000000200
      00000000000000000132000005004D656D6F3200020049000000940000001C00
      00000C00000043000000F4010000000000000000FFFFFF1F2C02000000000001
      0021005B717279496D7072696D6972466C75786F6772616D61732E22636F6469
      676F225D00000000FFFF0000000000020000000100000000090068656C766574
      6963610007000000020000000000090000001700020000000000FFFFFF000000
      0002000000000000000000A732000005004D656D6F3900020066000000940000
      00F80000000C0000004100000064000000000000000000FFFFFF1F2C02000000
      0000010024005B717279496D7072696D6972466C75786F6772616D61732E2264
      657363726963616F225D00000000FFFF00000000000200000001000000000900
      68656C7665746963610007000000020000000000080000001700020000000000
      FFFFFF0000000002000000000000000000EC33000006004D656D6F3135000200
      5F01000094000000430000000C00000043000000F4010000000000000000FFFF
      FF1F2C000403080068683A6D6D3A737300010000000006000500626567696E0D
      38006966205B717279496D7072696D6972466C75786F6772616D61732E226461
      7461686F7261696E636C7573616F225D203C3E2030207468656E0D590020206D
      656D6F203A3D205B464F524D41544441544554494D45282744442F4D4D2F5959
      2048483A4D4D272C205B717279496D7072696D6972466C75786F6772616D6173
      2E2264617461686F7261696E636C7573616F225D295D0D0400656C73650D0C00
      20206D656D6F203A3D27273B0D0300656E6400FFFF0000000000020000000100
      000000090068656C76657469636100070000000200000000000A000000170002
      0000000000FFFFFF0000000002000000000000000000E034000006004D656D6F
      3230000200DE01000094000000430000000C00000043000000F4010000000000
      000000FFFFFF1F2C020000000000010071005B636F7079286966285B71727949
      6D7072696D6972466C75786F6772616D61732E2264617461686F7261616C7465
      726163616F225D3C3E27272C5B717279496D7072696D6972466C75786F677261
      6D61732E2264617461686F7261616C7465726163616F225D2C2727292C312C31
      34295D00000000FFFF0000000000020000000100000000090068656C76657469
      636100070000000200000000000A0000001700020000000000FFFFFF00000000
      020000000000000000008D35000006004D656D6F3231000200A3010000940000
      00390000000C00000043000000F4010000000000000000FFFFFF1F2C02000000
      000001002A005B717279496D7072696D6972466C75786F6772616D61732E2275
      73756172696F696E636C7573616F225D00000000FFFF00000000000200000001
      00000000090068656C7665746963610007000000020000000000080000001700
      020000000000FFFFFF00000000020000000000000000003B36000006004D656D
      6F323800020022020000940000003A0000000C00000043000000F40100000000
      00000000FFFFFF1F2C02000000000001002B005B717279496D7072696D697246
      6C75786F6772616D61732E227573756172696F616C7465726163616F225D0000
      0000FFFF0000000000020000000100000000090068656C766574696361000700
      00000200000000000A0000001700020000000000FFFFFF000000000200000000
      0000000000E136000006004D656D6F33320002005D020000940000003A000000
      0C00000043000000F4010000000000000000FFFFFF1F2C020000000000010023
      005B717279496D7072696D6972466C75786F6772616D61732E226F7065726163
      616F225D00000000FFFF0000000000020000000100000000090068656C766574
      69636100060000000200000000000A0000001700020000000000FFFFFF000000
      0002000000000000000000DE38000006004D656D6F3536000200980200009400
      0000380000000C00000043000000F4010000000000000000FFFFFF1F2C020000
      000000010021005B717279496D7072696D6972466C75786F6772616D61732E22
      746162656C61225D0010000500626567696E0D390020206966205B717279496D
      7072696D6972466C75786F6772616D61732E22636F6469676F6F706572616361
      6F225D203C3E2030207468656E200D07002020626567696E0D1C002020202066
      696C6861312E76697369626C65203A3D2054727565203B0D1800202020206669
      6C6861312E686569677468203A3D2032363B0D1A00202020204461646F732E76
      697369626C65203A3D20547275653B0D1700202020204461646F732E68656967
      7468203A3D2031343B0D05002020656E640D07002020656C7365200D07002020
      626567696E0D1C002020202066696C6861312E76697369626C65203A3D204661
      6C73653B0D17002020202066696C6861312E686569677468203A3D20303B0D1B
      00202020204461646F732E76697369626C65203A3D2046616C73653B0D160020
      2020204461646F732E686569677468203A3D20303B0D06002020656E643B0D03
      00656E6400FFFF0000000000020000000100000000090068656C766574696361
      00060000000200000000000A0000001700020000000000FFFFFF000000000200
      00000000000000006439000005004D656D6F380002006B000000C90000004D00
      00000B00000043000F00F4010000000000000000FFFFFF1F2C02000000000001
      0004004E4F4D4500000000FFFF0000000000020000000100000000090068656C
      76657469636100060000000000000000000A0000001700020000000000FFFFFF
      0000000002000000000000000000F339000006004D656D6F3130000200120200
      00C9000000430000000B00000043000F00F4010000000000000000FFFFFF1F2C
      02000000000001000C0054454D504F2050414452C34F00000000FFFF00000000
      00020000000100000000090068656C7665746963610006000000000000000000
      0A0000001700020000000000FFFFFF00000000020000000000000000009A3A00
      0006004D656D6F313400020058000000E9000000120000000C00000043000000
      F4010000000000000000FFFFFF1F2C020000000000010024005B717279496D70
      72696D6972466C75786F6772616D61732E2273657175656E636961225D000000
      00FFFF0000000000020000000100000000090068656C76657469636100060000
      00000000000000090000001700020000000000FFFFFF00000000020000000000
      00000000433B000006004D656D6F313600020014020000E9000000410000000C
      00000043000000F4010000000000000000FFFFFF1F2C02010100000001002600
      5B717279496D7072696D6972466C75786F6772616D61732E2274656D706F7061
      6472616F225D00000000FFFF0000000000020000000100000000090068656C76
      657469636100060000000000000000000A0000001700020000000000FFFFFF00
      0000000200000000000000FEFEFF27000000080020436F6D7072617300000000
      06004F7574726173000000000F0052415A414F46494C49414C42415345000000
      000F00454E44455245434F5F42414952524F000000000D004345505F43494441
      44455F554600000000050076616C6F7200010030000E00746F74616C63616C63
      756C61646F00010030000600544954554C4F000000000900535542544954554C
      4F000000000E00666F6E6566696C69616C6261736500010030000D0072756166
      696C69616C626173650001003000100062616972726F66696C69616C62617365
      00010030000D0063657066696C69616C62617365000100300010006369646164
      6566696C69616C626173650001003000100065737461646F66696C69616C6261
      73650001003000070020544F54414953000000000B0047544F54414C56454E44
      4100010030000B0047544F54414C435553544F000100300009002050524F4455
      544F53000000000700456D4C696E686100040054727565000B00466F72616465
      4C696E686100040054727565000B00436F6D4D6F6E746167656D000400547275
      65000B0053656D4D6F6E746167656D000400547275650006004272696E646500
      0400547275650009004E616F4272696E646500040054727565000A0020434142
      4543414C484F000000000C0053616C646F4573746F717565000000000C004461
      7461536974756163616F000000000C00204147525550414D454E544F00000000
      0D004167727570617246696C69616C00050066616C7365001200416772757061
      72477275706F46696C69616C00050066616C736500140041677275706172436C
      6173736550726F6475746F00050066616C736500130041677275706172477275
      706F50726F6475746F00050066616C7365000E004167727570617250726F6475
      746F00050066616C736500110041677275706172466F726E656365646F720005
      0046616C7365000A0020434F4E54524F4C4553000000000E00436F6D5175616E
      7469646164657300040054727565000B0020417578696C696172657300000000
      05004C696E686100010030000000000000000000FC0000000000000000000000
      0000000000580067405A6238B2E34048A0239ECE1FE540}
  end
end
