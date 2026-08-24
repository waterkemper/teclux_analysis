inherited dtmProcessosJudiciaisReinf: TdtmProcessosJudiciaisReinf
  OldCreateOrder = False
  Left = 558
  Top = 207
  Height = 476
  Width = 700
  object qryProcessoJudicialReinf: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterClose = qryProcessoJudicialReinfAfterClose
    BeforeEdit = qryProcessoJudicialReinfBeforeEdit
    AfterScroll = qryProcessoJudicialReinfAfterScroll
    OnCalcFields = qryProcessoJudicialReinfCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select pjr.*'
      'from processojudicialreinf pjr'
      'where pjr.numero = :numero')
    RequestLive = True
    Left = 152
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end>
    object qryProcessoJudicialReinfnumero: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'numero'
    end
    object qryProcessoJudicialReinftpproc: TIntegerField
      DisplayLabel = 'Tipo de Processo'
      FieldName = 'tpproc'
      Required = True
    end
    object qryProcessoJudicialReinfnrproc: TStringField
      DisplayLabel = 'Nr. Processo Administrativo'
      FieldName = 'nrproc'
      Required = True
      Size = 21
    end
    object qryProcessoJudicialReinfinivalid: TStringField
      DisplayLabel = 'Validade Inicial'
      FieldName = 'inivalid'
      Required = True
      EditMask = '!99/9999;1;_'
      Size = 7
    end
    object qryProcessoJudicialReinffimvalid: TStringField
      DisplayLabel = 'Validade Final'
      FieldName = 'fimvalid'
      Size = 7
    end
    object qryProcessoJudicialReinfindautoria: TIntegerField
      DisplayLabel = 'Indicativo da autoria da a'#231#227'o judicial'
      FieldName = 'indautoria'
      Required = True
    end
    object qryProcessoJudicialReinfobservacoes: TStringField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'observacoes'
      Size = 500
    end
    object qryProcessoJudicialReinfdatahoraexclusao: TDateTimeField
      FieldName = 'datahoraexclusao'
    end
    object qryProcessoJudicialReinfsdatahoraexclusao: TStringField
      FieldKind = fkCalculated
      FieldName = 'sdatahoraexclusao'
      Size = 50
      Calculated = True
    end
    object qryProcessoJudicialReinfdatahoraalteracao: TDateTimeField
      FieldName = 'datahoraalteracao'
    end
    object qryProcessoJudicialReinfsdatahoraalteracao: TStringField
      FieldKind = fkCalculated
      FieldName = 'sdatahoraalteracao'
      Size = 50
      Calculated = True
    end
  end
  object dsrProcessoJudicialReinf: TtecDataSource
    DataSet = qryProcessoJudicialReinf
    Left = 192
    Top = 56
  end
  object spcProcessoJudicialReinf: TtecQuery
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
      'Select ProcessoJudicialReinf_proximonumero() as codigo')
    RequestLive = False
    Left = 328
    Top = 46
    object spcProcessoJudicialReinfcodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object qrySuspensaoExibilidadeTributos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforePost = qrySuspensaoExibilidadeTributosBeforePost
    AfterPost = qrySuspensaoExibilidadeTributosAfterPost
    AfterDelete = qrySuspensaoExibilidadeTributosAfterDelete
    OnCalcFields = qrySuspensaoExibilidadeTributosCalcFields
    OnNewRecord = qrySuspensaoExibilidadeTributosNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select suet.*,'
      ''
      '       (select c.nome'
      '        from cidades c'
      '        where c.codigoibge = suet.codMunic'
      '          and c.estado = suet.UFVara) as NomeCidade'
      ''
      ''
      'from suspensaoexibilidadetributos suet'
      'where suet.ProcessoJudicial = :ProcessoJudicial'
      'order by suet.numero')
    RequestLive = True
    Left = 120
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ProcessoJudicial'
        ParamType = ptUnknown
      end>
    object qrySuspensaoExibilidadeTributosprocessojudicial: TIntegerField
      FieldName = 'processojudicial'
    end
    object qrySuspensaoExibilidadeTributosnumero: TIntegerField
      FieldName = 'numero'
    end
    object qrySuspensaoExibilidadeTributoscodsusp: TStringField
      DisplayLabel = 'C'#243'digo da Suspens'#227'o'
      FieldName = 'codsusp'
      Size = 14
    end
    object qrySuspensaoExibilidadeTributosindsusp: TStringField
      DisplayLabel = 'Indicativo da Suspens'#227'o'
      FieldName = 'indsusp'
      Required = True
      Size = 2
    end
    object qrySuspensaoExibilidadeTributosdtdecisao: TDateField
      DisplayLabel = 'Data da Decis'#227'o'
      FieldName = 'dtdecisao'
      Required = True
    end
    object qrySuspensaoExibilidadeTributosinddeposito: TStringField
      FieldName = 'inddeposito'
      Required = True
      Size = 1
    end
    object qrySuspensaoExibilidadeTributosufvara: TStringField
      DisplayLabel = 'UF Vara'
      FieldName = 'ufvara'
      Required = True
      OnChange = qrySuspensaoExibilidadeTributosufvaraChange
      Size = 2
    end
    object qrySuspensaoExibilidadeTributoscodmunic: TIntegerField
      DisplayLabel = 'Cod. IBGE'
      FieldName = 'codmunic'
      Required = True
    end
    object qrySuspensaoExibilidadeTributosidvara: TStringField
      DisplayLabel = 'Ident. da Vara'
      FieldName = 'idvara'
      Required = True
      Size = 2
    end
    object qrySuspensaoExibilidadeTributoss_indsusp: TStringField
      DisplayLabel = 'Indicativo da Suspens'#227'o'
      FieldKind = fkLookup
      FieldName = 's_indsusp'
      LookupDataSet = qryTabelaSuspensaoExibilidade
      LookupKeyFields = 'codigo'
      LookupResultField = 'descricao'
      KeyFields = 'indsusp'
      Size = 105
      Lookup = True
    end
    object qrySuspensaoExibilidadeTributosdatahoraexclusao: TDateTimeField
      FieldName = 'datahoraexclusao'
    end
    object qrySuspensaoExibilidadeTributosnomecidade: TStringField
      FieldName = 'nomecidade'
      Size = 72
    end
    object qrySuspensaoExibilidadeTributosibge_nomecidade: TStringField
      FieldKind = fkCalculated
      FieldName = 'ibge_nomecidade'
      Size = 100
      Calculated = True
    end
    object qrySuspensaoExibilidadeTributossDataHoraExclusao: TStringField
      FieldKind = fkCalculated
      FieldName = 'sDataHoraExclusao'
      Size = 50
      Calculated = True
    end
  end
  object dsrSuspensaoExibilidadeTributos: TtecDataSource
    DataSet = qrySuspensaoExibilidadeTributos
    Left = 160
    Top = 136
  end
  object dsrTabelaSuspensaoExibilidade: TtecDataSource
    DataSet = qryTabelaSuspensaoExibilidade
    Left = 504
    Top = 184
  end
  object qryTabelaSuspensaoExibilidade: TtecQuery
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
      ';'
      'select codigo, descricao'
      'from'
      '('
      '('
      'select cast('#39'01'#39' as char(2)) as codigo,'
      
        '       cast('#39'01 - Liminar em Mandado de Seguran'#231'a'#39' as char(100))' +
        ' as descricao'
      ')'
      'union'
      '('
      'select cast('#39'02'#39' as char(2)) as codigo,'
      
        '       cast('#39'02 - Dep'#243'sito Judicial do Montante Integral'#39' as cha' +
        'r(100)) as descricao'
      ')'
      'union'
      '('
      'select cast('#39'03'#39' as char(2)) as codigo,'
      
        '       cast('#39'03 - Dep'#243'sito Administrativo do Montante Integral'#39' ' +
        'as char(100)) as descricao'
      ')'
      'union'
      '('
      'select cast('#39'04'#39' as char(2)) as codigo,'
      
        '       cast('#39'04 - Antecipa'#231#227'o de Tutela'#39' as char(100)) as descri' +
        'cao'
      ')'
      'union'
      '('
      'select cast('#39'05'#39' as char(2)) as codigo,'
      
        '       cast('#39'05 - Liminar em Medida Cautelar'#39' as char(100)) as d' +
        'escricao'
      ')'
      'union'
      '('
      'select cast('#39'08'#39' as char(2)) as codigo,'
      
        '       cast('#39'08 - Senten'#231'a em Mandado de Seguran'#231'a Favor'#225'vel ao ' +
        'Contribuinte'#39' as char(100)) as descricao'
      ')'
      'union'
      '('
      'select cast('#39'09'#39' as char(2)) as codigo,'
      
        '       cast('#39'09 - Senten'#231'a em A'#231#227'o Ordin'#225'ria Favor'#225'vel ao Contri' +
        'buinte e Confirmada pelo TRF'#39' as char(100)) as descricao'
      ')'
      'union'
      '('
      'select cast('#39'10'#39' as char(2)) as codigo,'
      
        '       cast('#39'10 - Ac'#243'rd'#227'o do TRF Favor'#225'vel ao Contribuinte'#39' as c' +
        'har(100)) as descricao'
      ')'
      'union'
      '('
      'select cast('#39'11'#39' as char(2)) as codigo,'
      
        '       cast('#39'11 - Ac'#243'rd'#227'o do STJ em Recurso Especial Favor'#225'vel a' +
        'o Contribuinte'#39' as char(100)) as descricao'
      ')'
      'union'
      '('
      'select cast('#39'12'#39' as char(2)) as codigo,'
      
        '       cast('#39'12 - Ac'#243'rd'#227'o do STF em Recurso Extraordin'#225'rio Favor' +
        #225'vel ao Contribuinte'#39' as char(100)) as descricao'
      ')'
      'union'
      '('
      'select cast('#39'13'#39' as char(2)) as codigo,'
      
        '       cast('#39'13 - Senten'#231'a 1'#170' inst'#226'ncia n'#227'o transitada em julgad' +
        'o com efeito suspensivo'#39' as char(100)) as descricao'
      ')'
      'union'
      '('
      'select cast('#39'90'#39' as char(2)) as codigo,'
      
        '       cast('#39'90 - Decis'#227'o Definitiva a favor do contribuinte'#39' as' +
        ' char(100)) as descricao'
      ')'
      'union'
      '('
      'select cast('#39'92'#39' as char(2)) as codigo,'
      
        '       cast('#39'92 - Sem suspens'#227'o da exigibilidade'#39' as char(100)) ' +
        'as descricao'
      ')'
      ') as TabelaSuspensaoExibilidade'
      'order by codigo')
    RequestLive = False
    Left = 464
    Top = 168
    object qryTabelaSuspensaoExibilidadecodigo: TStringField
      FieldName = 'codigo'
      Size = 2
    end
    object qryTabelaSuspensaoExibilidadedescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
  end
  object spcSuspensaoExibilidadeTributos: TtecQuery
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
      'Select SuspensaoExibilidadeTributos_proximonumero() as codigo')
    RequestLive = False
    Left = 312
    Top = 142
    object spcSuspensaoExibilidadeTributoscodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object qryEnvio_ProcessoJudicialReinf: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryEnvio_ProcessoJudicialReinfAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select e_pjr.*,'
      
        '       case when e_pjr.tpproc = 1 then cast('#39'1 - Administrativo ' +
        #39' as varchar(20))'
      
        '            when e_pjr.tpproc = 2 then cast('#39'2 - Judici'#225'rio'#39'  as' +
        ' varchar(20))'
      '       end as s_tpproc,'
      ''
      
        '       case when e_pjr.indautoria = 1 then cast('#39'1 - Pr'#243'prio con' +
        'tribuinte '#39' as varchar(30))'
      
        '            when e_pjr.indautoria = 2 then cast('#39'2 - Outra entid' +
        'ade ou empresa'#39'  as varchar(30))'
      '       end as s_indautoria,'
      ''
      
        '       case when e_pjr.operacao = '#39'I'#39' then cast('#39'INCLUS'#195'O'#39' as va' +
        'rchar(11))'
      
        '            when e_pjr.operacao = '#39'A'#39' then cast('#39'ALTERA'#199#195'O'#39' as v' +
        'archar(11))'
      
        '            when e_pjr.operacao = '#39'E'#39' then cast('#39'EXCLUS'#195'O'#39' as va' +
        'rchar(11))'
      
        '            when e_pjr.operacao = '#39'R'#39' then cast('#39'RETIFICA'#199#195'O'#39' as' +
        ' varchar(11))'
      '       end as s_operacao,'
      ''
      '       er.datahoraprocessamento     '
      ''
      ''
      'from Envio_ProcessoJudicialReinf e_pjr'
      '     join Envio_Reinf er'
      '     on e_pjr.numeroreinf = er.numero'
      ''
      'where e_pjr.numero = :numero'
      'order by er.DataHoraProcessamento'
      '')
    RequestLive = False
    Active = True
    Left = 136
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end>
    object qryEnvio_ProcessoJudicialReinfnumero: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'numero'
    end
    object qryEnvio_ProcessoJudicialReinfdatahoraprocessamento: TDateTimeField
      DisplayLabel = 'Data/Hora Processamento'
      FieldName = 'datahoraprocessamento'
      DisplayFormat = 'dd/MM/yyyy hh:mm:ss'
    end
    object qryEnvio_ProcessoJudicialReinfoperacao: TStringField
      DisplayLabel = 'Opera'#231#227'o'
      FieldName = 'operacao'
      Size = 1
    end
    object qryEnvio_ProcessoJudicialReinftpproc: TIntegerField
      DisplayLabel = 'Tipo de Processo'
      FieldName = 'tpproc'
    end
    object qryEnvio_ProcessoJudicialReinfnrproc: TStringField
      DisplayLabel = 'Nr. Processo Administrativo'
      FieldName = 'nrproc'
      Size = 21
    end
    object qryEnvio_ProcessoJudicialReinfinivalid: TStringField
      DisplayLabel = 'Validade Inicial'
      FieldName = 'inivalid'
      Size = 7
    end
    object qryEnvio_ProcessoJudicialReinffimvalid: TStringField
      DisplayLabel = 'Validade Final'
      FieldName = 'fimvalid'
      Size = 7
    end
    object qryEnvio_ProcessoJudicialReinfindautoria: TIntegerField
      DisplayLabel = 'Indicativo da autoria da a'#231#227'o judicial'
      FieldName = 'indautoria'
    end
    object qryEnvio_ProcessoJudicialReinfdatahoraexclusao: TDateTimeField
      FieldName = 'datahoraexclusao'
    end
    object qryEnvio_ProcessoJudicialReinfdatahoraalteracao: TDateTimeField
      FieldName = 'datahoraalteracao'
    end
    object qryEnvio_ProcessoJudicialReinfs_tpproc: TStringField
      DisplayLabel = 'Tipo de Processo'
      FieldName = 's_tpproc'
      Size = 50
    end
    object qryEnvio_ProcessoJudicialReinfs_indautoria: TStringField
      DisplayLabel = 'Indicativo da autoria da a'#231#227'o judicial'
      FieldName = 's_indautoria'
      Size = 50
    end
    object qryEnvio_ProcessoJudicialReinfs_operacao: TStringField
      FieldName = 's_operacao'
      Size = 50
    end
    object qryEnvio_ProcessoJudicialReinfnumeroreinf: TIntegerField
      FieldName = 'numeroreinf'
      Required = True
    end
    object qryEnvio_ProcessoJudicialReinfnrrecarqbase: TStringField
      FieldName = 'nrrecarqbase'
      Size = 52
    end
  end
  object dsrEnvio_ProcessoJudicialReinf: TtecDataSource
    DataSet = qryEnvio_ProcessoJudicialReinf
    Left = 176
    Top = 280
  end
  object qryEnvio_SuspensaoExibilidadeTributos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnCalcFields = qryEnvio_SuspensaoExibilidadeTributosCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select e_set.*,'
      
        '       case when e_set.indsusp = '#39'01'#39' then cast('#39'01 - Liminar em' +
        ' Mandado de Seguran'#231'a'#39' as varchar(100))'
      
        '            when e_set.indsusp = '#39'02'#39' then cast('#39'02 - Dep'#243'sito J' +
        'udicial do Montante Integral'#39' as varchar(100))'
      
        '            when e_set.indsusp = '#39'03'#39' then cast('#39'03 - Dep'#243'sito A' +
        'dministrativo do Montante Integral'#39' as varchar(100))'
      
        '            when e_set.indsusp = '#39'04'#39' then cast('#39'04 - Antecipa'#231#227 +
        'o de Tutela'#39' as varchar(100))'
      
        '            when e_set.indsusp = '#39'05'#39' then cast('#39'05 - Liminar em' +
        ' Medida Cautelar'#39' as varchar(100))'
      
        '            when e_set.indsusp = '#39'08'#39' then cast('#39'08 - Senten'#231'a e' +
        'm Mandado de Seguran'#231'a Favor'#225'vel ao Contribuinte'#39' as varchar(100' +
        '))'
      
        '            when e_set.indsusp = '#39'09'#39' then cast('#39'09 - Senten'#231'a e' +
        'm A'#231#227'o Ordin'#225'ria Favor'#225'vel ao Contribuinte e Confirmada pelo TRF' +
        #39' as varchar(100))'
      
        '            when e_set.indsusp = '#39'10'#39' then cast('#39'10 - Ac'#243'rd'#227'o do' +
        ' TRF Favor'#225'vel ao Contribuinte'#39' as varchar(100))'
      
        '            when e_set.indsusp = '#39'11'#39' then cast('#39'11 - Ac'#243'rd'#227'o do' +
        ' STJ em Recurso Especial Favor'#225'vel ao Contribuinte'#39' as varchar(1' +
        '00))'
      
        '            when e_set.indsusp = '#39'12'#39' then cast('#39'12 - Ac'#243'rd'#227'o do' +
        ' STF em Recurso Extraordin'#225'rio Favor'#225'vel ao Contribuinte'#39' as var' +
        'char(100))'
      
        '            when e_set.indsusp = '#39'13'#39' then cast('#39'13 - Senten'#231'a 1' +
        #170' inst'#226'ncia n'#227'o transitada em julgado com efeito suspensivo'#39' as ' +
        'varchar(100))'
      
        '            when e_set.indsusp = '#39'90'#39' then cast('#39'90 - Decis'#227'o De' +
        'finitiva a favor do contribuinte'#39' as varchar(100))'
      
        '            when e_set.indsusp = '#39'92'#39' then cast('#39'92 - Sem suspen' +
        's'#227'o da exigibilidade'#39' as varchar(100))'
      '       end as s_indsusp,'
      ''
      '       (select c.nome'
      '        from cidades c'
      '        where c.codigoibge = e_set.codMunic'
      '          and c.estado = e_set.UFVara) as NomeCidade,'
      '        er.datahoraprocessamento   '
      'from envio_suspensaoexibilidadetributos e_set'
      '     join Envio_Reinf er'
      '     on e_set.numeroreinf = er.numero'
      ''
      'where e_set.ProcessoJudicial = :ProcessoJudicial'
      '  and e_set.numeroreinf = :numeroreinf'
      'order by er.datahoraprocessamento'
      ''
      ''
      '       '
      '')
    RequestLive = False
    Active = True
    Left = 400
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ProcessoJudicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numeroreinf'
        ParamType = ptUnknown
      end>
    object qryEnvio_SuspensaoExibilidadeTributosprocessojudicial: TIntegerField
      FieldName = 'processojudicial'
    end
    object qryEnvio_SuspensaoExibilidadeTributosnumero: TIntegerField
      FieldName = 'numero'
    end
    object qryEnvio_SuspensaoExibilidadeTributosdatahoraprocessamento: TDateTimeField
      FieldName = 'datahoraprocessamento'
    end
    object qryEnvio_SuspensaoExibilidadeTributoscodsusp: TStringField
      FieldName = 'codsusp'
      Size = 14
    end
    object qryEnvio_SuspensaoExibilidadeTributosindsusp: TStringField
      FieldName = 'indsusp'
      Size = 2
    end
    object qryEnvio_SuspensaoExibilidadeTributosdtdecisao: TDateField
      Alignment = taCenter
      FieldName = 'dtdecisao'
      EditMask = '99/99/9999;1; '
    end
    object qryEnvio_SuspensaoExibilidadeTributosinddeposito: TStringField
      FieldName = 'inddeposito'
      Size = 1
    end
    object qryEnvio_SuspensaoExibilidadeTributosufvara: TStringField
      FieldName = 'ufvara'
      Size = 2
    end
    object qryEnvio_SuspensaoExibilidadeTributoscodmunic: TIntegerField
      FieldName = 'codmunic'
    end
    object qryEnvio_SuspensaoExibilidadeTributosidvara: TStringField
      FieldName = 'idvara'
      Size = 2
    end
    object qryEnvio_SuspensaoExibilidadeTributosdatahoraexclusao: TDateTimeField
      FieldName = 'datahoraexclusao'
    end
    object qryEnvio_SuspensaoExibilidadeTributoss_indsusp: TStringField
      FieldName = 's_indsusp'
      Size = 50
    end
    object qryEnvio_SuspensaoExibilidadeTributosibge_nomecidade: TStringField
      FieldKind = fkCalculated
      FieldName = 'ibge_nomecidade'
      Size = 100
      Calculated = True
    end
    object qryEnvio_SuspensaoExibilidadeTributosnomecidade: TStringField
      FieldName = 'nomecidade'
      Size = 72
    end
  end
  object dsrEnvio_SuspensaoExibilidadeTributos: TtecDataSource
    DataSet = qryEnvio_SuspensaoExibilidadeTributos
    Left = 424
    Top = 296
  end
end
