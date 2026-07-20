inherited dtmNCM: TdtmNCM
  OldCreateOrder = False
  Left = 543
  Top = 289
  Height = 608
  Width = 667
  object dsrSecoes: TtecDataSource
    DataSet = qrySecoes
    Left = 140
    Top = 32
  end
  object qrySecoes: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qrySecoesAfterScroll
    OnNewRecord = qrySecoesNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT Secao,'
      '       Descricao'
      ''
      'FROM   NCMTabela'
      ''
      
        'WHERE  CodigoTIPI = TRIM(TO_CHAR(CAST(:Secao AS INTEGER), '#39'0000'#39 +
        '))'
      '')
    RequestLive = True
    Left = 37
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Secao'
        ParamType = ptUnknown
      end>
    object qrySecoessecao: TIntegerField
      FieldName = 'secao'
    end
    object qrySecoesdescricao: TStringField
      FieldName = 'descricao'
      Size = 1024
    end
  end
  object qrySecoesNotas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnNewRecord = qrySecoesNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT Notas'
      ''
      'FROM NCMNotas'
      ''
      'WHERE Secao = :Secao AND Capitulo = 0;'
      '       ')
    RequestLive = False
    Left = 37
    Top = 91
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Secao'
        ParamType = ptUnknown
      end>
    object qrySecoesNotasNotas: TStringField
      FieldName = 'notas'
      Size = 16884
    end
  end
  object dsrSecoesNotas: TtecDataSource
    DataSet = qrySecoesNotas
    Left = 141
    Top = 91
  end
  object qrySecoesCapitulos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnNewRecord = qrySecoesNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT CodigoTIPI AS Numero,'
      '       Descricao'
      ''
      'FROM   NCMTabela'
      ''
      'WHERE  Secao = :Secao AND'
      '       LENGTH(CodigoTIPI) = 2'
      ''
      'ORDER BY Numero')
    RequestLive = False
    Left = 37
    Top = 155
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Secao'
        ParamType = ptUnknown
      end>
    object qrySecoesCapitulosNumero: TStringField
      FieldName = 'numero'
      Size = 8
    end
    object qrySecoesCapitulosDescricao: TStringField
      FieldName = 'descricao'
      Size = 1024
    end
  end
  object dsrSecoesCapitulos: TtecDataSource
    DataSet = qrySecoesCapitulos
    Left = 141
    Top = 155
  end
  object qryCapitulos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryCapitulosAfterScroll
    OnNewRecord = qrySecoesNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT n1.Secao,'
      ''
      '      (SELECT n2.Descricao FROM NCMTabela n2'
      
        '          WHERE n2.CodigoTIPI = TRIM(TO_CHAR(n1.Secao, '#39'0000'#39')) ' +
        'limit 1) AS DescricaoSecao,'
      ''
      '       cast(n1.CodigoTIPI as integer) AS Capitulo,'
      ''
      '       n1.Descricao AS DescricaoCapitulo'
      ''
      'FROM   NCMTabela n1'
      ''
      
        'WHERE  n1.CodigoTIPI = TRIM(TO_CHAR(CAST(:Capitulo AS INTEGER), ' +
        #39'00'#39'));'
      '')
    RequestLive = True
    Left = 45
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Capitulo'
        ParamType = ptUnknown
      end>
    object qryCapitulossecao: TIntegerField
      FieldName = 'secao'
    end
    object qryCapitulosDescricaoSecao: TStringField
      FieldName = 'descricaosecao'
      Size = 1024
    end
    object qryCapitulosDescricaoCapitulo: TStringField
      FieldName = 'descricaocapitulo'
      Size = 1024
    end
    object qryCapituloscapitulo: TIntegerField
      FieldName = 'capitulo'
    end
  end
  object dsrCapitulos: TtecDataSource
    DataSet = qryCapitulos
    Left = 149
    Top = 267
  end
  object qryCapitulosNotas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnNewRecord = qrySecoesNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT Notas'
      ''
      'FROM   NCMNotas'
      ''
      'WHERE  Capitulo = :Capitulo;'
      '       ')
    RequestLive = False
    Left = 45
    Top = 318
    ParamData = <
      item
        DataType = ftString
        Name = 'Capitulo'
        ParamType = ptUnknown
      end>
    object qryCapitulosNotasNotas: TStringField
      FieldName = 'notas'
      Size = 16884
    end
  end
  object dsrCapitulosNotas: TtecDataSource
    DataSet = qryCapitulosNotas
    Left = 149
    Top = 319
  end
  object qryCapitulosNCM: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnNewRecord = qrySecoesNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      ';'
      
        'SELECT CASE WHEN ExTIPI <> '#39'00'#39' THEN NULL                     /*' +
        ' Quando h'#225' EX, o c'#243'digo TIPI fica */'
      
        '            ELSE CodigoTIPI                                   /*' +
        ' em branco para destacar EX       */'
      '       END AS CodigoTIPI,'
      ''
      ''
      '       CAST(CASE WHEN ExTIPI = '#39'00'#39' THEN NULL'
      '                 ELSE '#39'Ex.'#39' || ExTIPI'
      '            END AS VARCHAR(7)) AS ExtIPI,'
      ''
      
        '                          /* Endentando a DESCRI'#199#195'O para real'#231'ar' +
        ' a hierarquia */'
      
        '       CAST(REPEAT('#39' '#39',(CASE WHEN (SUBSTRING(CodigoTipi,1,2) = '#39 +
        '00'#39' OR LENGTH(CodigoTIPI) = 2) THEN 0'
      '                             WHEN LENGTH(CodigoTipi) = 4 THEN 2'
      
        '                             WHEN LENGTH(CodigoTipi) > 4 THEN LE' +
        'NGTH(CodigoTipi) - 2'
      
        '                        END)) || Descricao AS VARCHAR(100)) AS D' +
        'escricao,'
      ''
      '       Aliquota,'
      '       NacionalFederal,'
      '       ImportadosFederal,'
      '       CargaEstadual,'
      '       CargaMunicipal,'
      '       VigenciaInicio,'
      '       VigenciaFim,'
      '       ChaveIBPT,'
      '       FonteDados'
      ''
      
        'FROM (SELECT CAST(CASE WHEN SUBSTRING(CodigoTIPI,1,2) = '#39'00'#39' THE' +
        'N '#39'SE'#199#195'O '#39'   || TO_CHAR(Secao, '#39'RN'#39')    /* Se'#231#227'o XX - n'#227'o ser'#225' s' +
        'elecionado */'
      
        '                       WHEN CodigoTIPI = '#39'99'#39'                THE' +
        'N CodigoTIPI || '#39'  NF-e'#39'                /* 99  NF-e - n'#227'o ser'#225' s' +
        'elecionado */'
      
        '                       WHEN LENGTH(CodigoTIPI) = 2           THE' +
        'N '#39'Cap. '#39'    || CodigoTIPI              /* Cap. 99  - n'#227'o ser'#225' s' +
        'elecionado */'
      
        '                       WHEN LENGTH(CodigoTIPI) = 4           THE' +
        'N CodigoTIPI                            /* 9999       */'
      
        '                       WHEN LENGTH(CodigoTIPI) <= 6          THE' +
        'N SUBSTRING(CodigoTIPI,1,4) || '#39'.'#39' ||'
      
        '                                                                ' +
        '  SUBSTRING(CodigoTIPI,5,2)             /* 9999.99    */'
      '                       ELSE SUBSTRING(CodigoTIPI,1,4) || '#39'.'#39' ||'
      '                            SUBSTRING(CodigoTIPI,5,2) || '#39'.'#39' ||'
      
        '                            SUBSTRING(CodigoTIPI,7,2)           ' +
        '                                        /* 9999.99.99 */'
      '                  END AS VARCHAR(10)) AS CodigoTIPI,'
      ''
      '             CASE WHEN ExTIPI IS NULL THEN '#39'00'#39
      '                  ELSE ExTIPI'
      '             END AS ExtIPI,'
      ''
      '             Descricao,'
      ''
      '             CAST(CASE WHEN SouA  = '#39'A'#39
      '                        THEN CASE WHEN Aliquota IS NULL'
      '                                  THEN CAST('#39'NT'#39'     AS VARCHAR)'
      '                                  ELSE CAST(Aliquota AS VARCHAR)'
      '                             END'
      '                        ELSE NULL'
      '                   END AS VARCHAR(10)) AS Aliquota,'
      ''
      '             NacionalFederal,'
      '             ImportadosFederal,'
      '             CargaEstadual,'
      '             CargaMunicipal,'
      '             VigenciaInicio,'
      '             VigenciaFim,'
      '             ChaveIBPT,'
      '             FonteDados'
      ''
      '      FROM  NCMTabela'
      ''
      
        '      WHERE SUBSTRING(CodigoTIPI,1,2) = TRIM(TO_CHAR(CAST(:Capit' +
        'ulo AS INTEGER), '#39'00'#39'))'
      '        AND LENGTH(CodigoTIPI) > 2'
      ''
      '      ORDER BY CodigoTIPI, ExTIPI'
      '     ) AS Selecao'
      '')
    RequestLive = False
    Left = 45
    Top = 374
    ParamData = <
      item
        DataType = ftString
        Name = 'Capitulo'
        ParamType = ptUnknown
      end>
    object qryCapitulosNCMCodigoTIPI: TStringField
      DisplayWidth = 10
      FieldName = 'CodigoTIPI'
      Size = 10
    end
    object qryCapitulosNCMexTIPI: TStringField
      DisplayWidth = 5
      FieldName = 'exTIPI'
      Size = 5
    end
    object qryCapitulosNCMDescricao: TStringField
      DisplayWidth = 1024
      FieldName = 'Descricao'
      Size = 1024
    end
    object qryCapitulosNCMAliquota: TStringField
      DisplayWidth = 10
      FieldName = 'Aliquota'
      Size = 10
    end
    object qryCapitulosNCMNacionalFederal: TFloatField
      FieldName = 'nacionalfederal'
    end
    object qryCapitulosNCMImportadosFederal: TFloatField
      FieldName = 'ImportadosFederal'
    end
    object qryCapitulosNCMCargaEstadual: TFloatField
      FieldName = 'CargaEstadual'
    end
    object qryCapitulosNCMCargaMunicipal: TFloatField
      FieldName = 'CargaMunicipal'
    end
    object qryCapitulosNCMVigenciaInicio: TDateField
      FieldName = 'VigenciaInicio'
    end
    object qryCapitulosNCMVigenciaFim: TDateField
      FieldName = 'VigenciaFim'
    end
    object qryCapitulosNCMChaveIBPT: TStringField
      FieldName = 'ChaveIBPT'
      Size = 6
    end
    object qryCapitulosNCMFonteDados: TStringField
      FieldName = 'FonteDados'
      Size = 40
    end
  end
  object dsrCapitulosNCM: TtecDataSource
    DataSet = qryCapitulosNCM
    Left = 141
    Top = 375
  end
  object qryImportar: TtecQuery
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
    RequestLive = False
    Left = 248
    Top = 152
  end
  object qryNCMInexistentes: TtecQuery
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
      'SELECT Codigo,'
      '       Descricao,'
      '       CAST(SUBSTR(ipi.ClassificacaoFiscal,1,4) || '#39'.'#39' ||'
      '            SUBSTR(ipi.ClassificacaoFiscal,5,2) || '#39'.'#39' ||'
      
        '            SUBSTR(ipi.ClassificacaoFiscal,7,2) AS VARCHAR(10)) ' +
        'AS NCM,'
      '       ExTIPI,'
      '       Aliquota'
      ''
      'FROM ipi'
      ''
      'WHERE NOT EXISTS (SELECT Codigo'
      '                     FROM NCMTabela ncm'
      
        '                     WHERE ncm.CodigoTIPI = ipi.ClassificacaoFis' +
        'cal'
      
        '                       AND COALESCE(ncm.ExTIPI,'#39#39') = COALESCE(ip' +
        'i.ExTIPI,'#39#39'))'
      'ORDER BY Codigo')
    RequestLive = False
    Left = 240
    Top = 40
    object qryNCMInexistentesCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryNCMInexistentesDescricao: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
    object qryNCMInexistentesncm: TStringField
      FieldName = 'NCM'
      Size = 10
    end
    object qryNCMInexistentesExTIPI: TStringField
      FieldName = 'ExTIPI'
      Size = 3
    end
    object qryNCMInexistentesAliquota: TFloatField
      FieldName = 'Aliquota'
    end
  end
  object dsrNCMInexistentes: TtecDataSource
    DataSet = qryNCMInexistentes
    Left = 240
    Top = 88
  end
  object qryMVAProtocolos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterInsert = qryMVAProtocolosAfterInsert
    AfterScroll = qryMVAProtocolosAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT Protocolo,'
      '       Descricao'
      ''
      'FROM   mvaprotocolos'
      ''
      
        'WHERE Protocolo = :Protocolo  or case when :Protocolo is null th' +
        'en true end'
      ''
      'limit 1'
      ''
      ''
      '')
    RequestLive = True
    Left = 421
    Top = 34
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Protocolo'
        ParamType = ptUnknown
      end>
    object qryMVAProtocolosprotocolo: TStringField
      FieldName = 'protocolo'
      Required = True
      Size = 10
    end
    object qryMVAProtocolosDescricao: TStringField
      DisplayWidth = 1000
      FieldName = 'Descricao'
      Required = True
      Size = 1000
    end
  end
  object qryMVAProtocoloEstados: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterInsert = qryMVAProtocoloEstadosAfterInsert
    AfterPost = qryMVAProtocoloEstadosAfterPost
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT Protocolo,'
      '       Estado,'
      
        '       (select e.nome from estados e where e.codigo = mvaprotoco' +
        'loestados.estado) as NomeEstado,'
      '       Ativo,'
      '       PercReducaoMVA'
      ''
      'FROM   mvaprotocoloestados'
      ''
      'WHERE  Protocolo = :Protocolo'
      '/*       Estado    = :Estado */'
      'order by estado'
      '')
    RequestLive = True
    Left = 424
    Top = 86
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Protocolo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Estado'
        ParamType = ptUnknown
      end>
    object qryMVAProtocoloEstadosprotocolo: TStringField
      FieldName = 'protocolo'
      Size = 10
    end
    object qryMVAProtocoloEstadosEstado: TStringField
      FieldName = 'Estado'
      Required = True
      Size = 2
    end
    object qryMVAProtocoloEstadosPercReducaoMVA: TFloatField
      FieldName = 'PercReducaoMVA'
      DisplayFormat = '0.00'
    end
    object qryMVAProtocoloEstadosAtivo: TBooleanField
      FieldName = 'Ativo'
    end
    object qryMVAProtocoloEstadosNomeEstado: TStringField
      FieldName = 'NomeEstado'
      Size = 30
    end
  end
  object qryMVAGrupos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterInsert = qryMVAGruposAfterInsert
    BeforePost = qryMVAGruposBeforePost
    AfterPost = qryMVAGruposAfterPost
    AfterDelete = qryMVAGruposAfterDelete
    AfterScroll = qryMVAGruposAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT Protocolo,'
      '       Grupo,'
      '       Descricao'
      ''
      'FROM   mvagrupos'
      ''
      'WHERE  Protocolo = :Protocolo /* AND'
      '       Grupo     = :Grupo */'
      ''
      'order by grupo       '
      '')
    RequestLive = True
    Left = 421
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Protocolo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Grupo'
        ParamType = ptUnknown
      end>
    object qryMVAGruposprotocolo: TStringField
      FieldName = 'protocolo'
      Size = 10
    end
    object qryMVAGruposGrupo: TIntegerField
      FieldName = 'Grupo'
      Required = True
      DisplayFormat = '0'
    end
    object qryMVAGruposDescricao: TStringField
      DisplayWidth = 1000
      FieldName = 'Descricao'
      Size = 1000
    end
  end
  object dsrMVAProtocolos: TtecDataSource
    DataSet = qryMVAProtocolos
    Left = 501
    Top = 45
  end
  object dsrMVAProtocoloEstados: TtecDataSource
    DataSet = qryMVAProtocoloEstados
    Left = 500
    Top = 98
  end
  object dsrMVAGrupos: TtecDataSource
    DataSet = qryMVAGrupos
    Left = 500
    Top = 154
  end
  object qryMVAProdutosNCM: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkFields = 'grupo = grupo'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrMVAGrupos
    Constraints = <>
    AfterInsert = qryMVAProdutosNCMAfterInsert
    BeforePost = qryMVAProdutosNCMBeforePost
    AfterPost = qryMVAProdutosNCMAfterPost
    AfterDelete = qryMVAProdutosNCMAfterDelete
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT Protocolo,'
      '       Grupo,'
      '       Item,'
      '       Descricao,'
      '       ncm,'
      '       subncm,'
      '       MVA'
      ''
      'FROM   mvaprodutosncm'
      ''
      'WHERE  Protocolo = :Protocolo /*'
      '  AND  Grupo     = :Grupo'
      ''
      ' AND   Item      = :Item      AND'
      '       NCM       = :NCM  */'
      '       '
      'order by item, ncm, subncm'
      '       '
      ''
      '')
    RequestLive = True
    Left = 424
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Protocolo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Grupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Item'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NCM'
        ParamType = ptUnknown
      end>
    object qryMVAProdutosNCMProtocolo: TStringField
      FieldName = 'protocolo'
      Size = 10
    end
    object qryMVAProdutosNCMGrupo: TIntegerField
      FieldName = 'Grupo'
      DisplayFormat = '0'
    end
    object qryMVAProdutosNCMItem: TIntegerField
      FieldName = 'Item'
      Required = True
      DisplayFormat = '0'
    end
    object qryMVAProdutosNCMNCM: TStringField
      FieldName = 'NCM'
      Required = True
      Size = 10
    end
    object qryMVAProdutosNCMDescricao: TStringField
      FieldName = 'Descricao'
      Required = True
      Size = 1000
    end
    object qryMVAProdutosNCM_MVA: TFloatField
      FieldName = 'MVA'
      DisplayFormat = '0.00'
    end
    object qryMVAProdutosNCMSubNCM: TStringField
      DefaultExpression = #39#39
      FieldName = 'SubNCM'
      Required = True
      Size = 2
    end
  end
  object dsrMVAProdutosNCM: TtecDataSource
    DataSet = qryMVAProdutosNCM
    Left = 500
    Top = 226
  end
  object qryProtocolosAtualizar: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterInsert = qryProtocolosAtualizarAfterInsert
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select * from crosstab('
      ''
      
        '  '#39'select mvape.protocolo, false as selecionar, mvap.descricao, ' +
        'mvape.estado, mvape.ativo'
      '   from mvaprotocoloestados mvape'
      
        '        join mvaprotocolos mvap on mvape.protocolo = mvap.protoc' +
        'olo'
      '   order by 1,2,3'#39','
      ''
      
        '  '#39'select codigo from estados where codigo<>'#39#39'.'#39#39' order by codig' +
        'o'#39
      ''
      ') as ('
      '  protocolo varchar(10),'
      '  selecionar boolean,'
      '  nomeprotocolo varchar(1000),'
      ''
      '    "AC" boolean,'
      #9'"AL" boolean,'
      #9'"AM" boolean,'
      #9'"AP" boolean,'
      #9'"BA" boolean,'
      #9'"CE" boolean,'
      #9'"DF" boolean,'
      #9'"ES" boolean,'
      #9'"GO" boolean,'
      #9'"MA" boolean,'
      #9'"MG" boolean,'
      #9'"MS" boolean,'
      #9'"MT" boolean,'
      #9'"PA" boolean,'
      #9'"PB" boolean,'
      '        "PE" boolean,'
      #9'"PI" boolean,'
      #9'"PR" boolean,'
      #9'"RS" boolean,'
      #9'"RN" boolean,'
      #9'"RO" boolean,'
      #9'"RJ" boolean,'
      #9'"RR" boolean,'
      #9'"SC" boolean,'
      #9'"SE" boolean,'
      #9'"SP" boolean,'
      #9'"TO" boolean'
      ''
      ');')
    RequestLive = True
    Left = 424
    Top = 280
    object qryProtocolosAtualizarprotocolo: TStringField
      FieldName = 'protocolo'
      Size = 10
    end
    object qryProtocolosAtualizarselecionar: TBooleanField
      FieldName = 'selecionar'
      OnChange = qryProtocolosAtualizarselecionarChange
    end
    object qryProtocolosAtualizarnomeprotocolo: TStringField
      FieldName = 'nomeprotocolo'
      Size = 1000
    end
    object qryProtocolosAtualizarAC: TBooleanField
      FieldName = 'AC'
    end
    object qryProtocolosAtualizarAL: TBooleanField
      FieldName = 'AL'
    end
    object qryProtocolosAtualizarAM: TBooleanField
      FieldName = 'AM'
    end
    object qryProtocolosAtualizarAP: TBooleanField
      FieldName = 'AP'
    end
    object qryProtocolosAtualizarBA: TBooleanField
      FieldName = 'BA'
    end
    object qryProtocolosAtualizarCE: TBooleanField
      FieldName = 'CE'
    end
    object qryProtocolosAtualizarDF: TBooleanField
      FieldName = 'DF'
    end
    object qryProtocolosAtualizarES: TBooleanField
      FieldName = 'ES'
    end
    object qryProtocolosAtualizarGO: TBooleanField
      FieldName = 'GO'
    end
    object qryProtocolosAtualizarMA: TBooleanField
      FieldName = 'MA'
    end
    object qryProtocolosAtualizarMG: TBooleanField
      FieldName = 'MG'
    end
    object qryProtocolosAtualizarMS: TBooleanField
      FieldName = 'MS'
    end
    object qryProtocolosAtualizarMT: TBooleanField
      FieldName = 'MT'
    end
    object qryProtocolosAtualizarPA: TBooleanField
      FieldName = 'PA'
    end
    object qryProtocolosAtualizarPB: TBooleanField
      FieldName = 'PB'
    end
    object qryProtocolosAtualizarPE: TBooleanField
      FieldName = 'PE'
    end
    object qryProtocolosAtualizarPI: TBooleanField
      FieldName = 'PI'
    end
    object qryProtocolosAtualizarPR: TBooleanField
      FieldName = 'PR'
    end
    object qryProtocolosAtualizarRS: TBooleanField
      FieldName = 'RS'
    end
    object qryProtocolosAtualizarRN: TBooleanField
      FieldName = 'RN'
    end
    object qryProtocolosAtualizarRO: TBooleanField
      FieldName = 'RO'
    end
    object qryProtocolosAtualizarRJ: TBooleanField
      FieldName = 'RJ'
    end
    object qryProtocolosAtualizarRR: TBooleanField
      FieldName = 'RR'
    end
    object qryProtocolosAtualizarSC: TBooleanField
      FieldName = 'SC'
    end
    object qryProtocolosAtualizarSE: TBooleanField
      FieldName = 'SE'
    end
    object qryProtocolosAtualizarSP: TBooleanField
      FieldName = 'SP'
    end
    object qryProtocolosAtualizarTO: TBooleanField
      FieldName = 'TO'
    end
  end
  object dsrProtocolosAtualizar: TtecDataSource
    DataSet = qryProtocolosAtualizar
    Left = 504
    Top = 288
  end
  object qryAtualizarProtocolos: TtecQuery
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
      'SELECT MVAAtualizarEstadosIPI(:Protocolo)')
    RequestLive = False
    Left = 424
    Top = 336
    ParamData = <
      item
        DataType = ftString
        Name = 'Protocolo'
        ParamType = ptUnknown
      end>
  end
  object qryIPIsemNCM: TtecQuery
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
      'SELECT p.CodigoVisual AS Produto,'
      '       p.Descricao,'
      '       c.IPI,'
      '       CAST(SUBSTR(ipi.ClassificacaoFiscal,1,4) || '#39'.'#39' ||'
      '            SUBSTR(ipi.ClassificacaoFiscal,5,2) || '#39'.'#39' ||'
      
        '            SUBSTR(ipi.ClassificacaoFiscal,7,2) AS VARCHAR(10)) ' +
        'AS NCM'
      ''
      'FROM Produtos p'
      '     JOIN Caracteristicas c'
      '          JOIN IPI'
      '          ON IPI.Codigo = c.IPI'
      '     ON c.Codigo = p.Caracteristica'
      ''
      'WHERE NOT EXISTS (SELECT ncm.Codigo'
      '                     FROM NCMTabela ncm'
      
        '                     WHERE ncm.CodigoTIPI = ipi.ClassificacaoFis' +
        'cal AND'
      
        '                           COALESCE(ncm.ExTIPI,'#39#39') = COALESCE(ip' +
        'i.ExTIPI,'#39#39'))'
      'ORDER BY p.CodigoVisual'
      ''
      '')
    RequestLive = False
    Left = 248
    Top = 208
    object qryIPIsemNCMProduto: TStringField
      FieldName = 'Produto'
      Size = 30
    end
    object qryIPIsemNCMDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qryIPIsemNCMipi: TIntegerField
      FieldName = 'IPI'
    end
    object qryIPIsemNCMncm: TStringField
      FieldName = 'NCM'
      Size = 10
    end
  end
  object dsrIPIsemNCM: TtecDataSource
    DataSet = qryIPIsemNCM
    Left = 240
    Top = 264
  end
  object qryMVACadastradas: TtecQuery
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
      'SELECT ipi.Codigo,'
      '       ipi.Descricao,'
      '       CAST(SUBSTR(ipi.ClassificacaoFiscal,1,4) || '#39'.'#39' ||'
      '            SUBSTR(ipi.ClassificacaoFiscal,5,2) || '#39'.'#39' ||'
      
        '            SUBSTR(ipi.ClassificacaoFiscal,7,2) AS VARCHAR) AS N' +
        'CM,'
      '      ei.MVA,'
      '      ei.PercReducaoMVA,'
      
        '      CAST(EstadosMVAAtivo(ipi.Codigo, :FilialBase) AS VARCHAR) ' +
        'AS EstadosAtivos'
      ''
      'FROM IPI'
      '     JOIN EstadosIPI ei'
      '     ON IPI.Codigo = ei.IPI'
      ''
      
        'WHERE ei.Estado = (SELECT Estado FROM Filiais WHERE Codigo = :Fi' +
        'lialBase) AND ei.Ativo'
      'ORDER BY ipi.Codigo;'
      '')
    RequestLive = False
    Left = 256
    Top = 316
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FilialBase'
        ParamType = ptUnknown
      end>
    object qryMVACadastradasCodigo: TIntegerField
      FieldName = 'Codigo'
      Required = True
      DisplayFormat = '0'
    end
    object qryMVACadastradasDescricao: TStringField
      FieldName = 'Descricao'
      Required = True
      Size = 30
    end
    object qryMVACadastradasNCM: TStringField
      FieldName = 'NCM'
      Size = 50
    end
    object qryMVACadastradasMVA: TFloatField
      FieldName = 'MVA'
      DisplayFormat = '##0.00'
      EditFormat = '##0.00'
    end
    object qryMVACadastradasPercReducaoMVA: TFloatField
      FieldName = 'PercReducaoMVA'
      DisplayFormat = '##0.00'
      EditFormat = '##0.00'
    end
    object qryMVACadastradasEstadosAtivos: TStringField
      FieldName = 'EstadosAtivos'
      Size = 50
    end
  end
  object dsrMVACadstradas: TtecDataSource
    DataSet = qryMVACadastradas
    Left = 248
    Top = 372
  end
end
