inherited dtmReinf: TdtmReinf
  OldCreateOrder = False
  Left = 530
  Top = 202
  Height = 506
  Width = 729
  object qryReinf: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryReinfAfterScroll
    OnNewRecord = qryReinfNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select reinf.*'
      'from reinf'
      'where reinf.filial = :filial'
      '  and reinf.perApur = :perApur')
    RequestLive = True
    Left = 56
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'perApur'
        ParamType = ptUnknown
      end>
    object qryReinffilial: TIntegerField
      FieldName = 'filial'
    end
    object qryReinfperapur: TStringField
      FieldName = 'perapur'
      Size = 7
    end
    object qryReinftpamb: TIntegerField
      FieldName = 'tpamb'
    end
    object qryReinfprocemi: TIntegerField
      FieldName = 'procemi'
    end
    object qryReinfverproc: TStringField
      FieldName = 'verproc'
    end
    object qryReinfdatahoraexclusao: TDateTimeField
      FieldName = 'datahoraexclusao'
    end
    object qryReinfdatahoraalteracao: TDateTimeField
      FieldName = 'datahoraalteracao'
    end
  end
  object dsrReinf: TtecDataSource
    DataSet = qryReinf
    Left = 96
    Top = 24
  end
  object qry1000_Contribuinte: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeOpen = qry1000_ContribuinteBeforeOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      ';'
      'select f.*,'
      
        '       case when f.operacao = '#39'I'#39' then cast('#39'INCLUS'#195'O'#39' as varcha' +
        'r(11))'
      
        '            when f.operacao = '#39'A'#39' then cast('#39'ALTERA'#199#195'O'#39' as varch' +
        'ar(11))'
      
        '            when f.operacao = '#39'E'#39' then cast('#39'EXCLUS'#195'O'#39' as varcha' +
        'r(11))'
      
        '            when f.operacao = '#39'R'#39' then cast('#39'RETIFICA'#199#195'O'#39' as var' +
        'char(11))'
      '       end as s_operacao'
      ''
      'from'
      '('
      
        'select case when f.numeroreinf is null then  /* n'#227'o foi enviado ' +
        'nada ao reinf */'
      
        '            case when f.DataHoraExclusaoReinf is not null then /' +
        '* foi cancelado */'
      
        '                   cast(null as varchar(1))                    /' +
        '* nenhuma opera'#231#227'o ser'#225' feita */'
      '            else'
      
        '                   cast('#39'I'#39' as varchar(1))                     /' +
        '* Inclus'#227'o */'
      '            end'
      '       else'
      '            case when (er1000.operacao = '#39'I'#39') or'
      '                      (er1000.operacao = '#39'A'#39') then'
      ''
      
        '                   case when f.DataHoraExclusaoReinf is not null' +
        ' then'
      
        '                            cast('#39'E'#39' as varchar(1))             ' +
        '        /* Exclusao */'
      ''
      
        '                        when md5(cast(f.tpInsc                 a' +
        's varchar)||'
      
        '                                 cast(f.nrInsc                 a' +
        's varchar)||'
      
        '                                 cast(f.iniValid               a' +
        's varchar)||'
      
        '                                 cast(f.fimValid               a' +
        's varchar)||'
      
        '                                 cast(f.classTrib              a' +
        's varchar)||'
      
        '                                 cast(f.indEscrituracao        a' +
        's varchar)||'
      
        '                                 cast(f.indDesoneracao         a' +
        's varchar)||'
      
        '                                 cast(f.indAcordoIsenMulta     a' +
        's varchar)||'
      
        '                                 cast(f.indSitPJ               a' +
        's varchar)||'
      
        '                                 cast(f.nmCtt                  a' +
        's varchar)||'
      
        '                                 cast(f.cpfCtt                 a' +
        's varchar)||'
      
        '                                 cast(f.foneFixo               a' +
        's varchar)||'
      
        '                                 cast(f.foneCel                a' +
        's varchar)||'
      
        '                                 cast(f.email                  a' +
        's varchar)) <>'
      ''
      
        '                             md5(cast(er1000.tpInsc             ' +
        'as varchar)||'
      
        '                                 cast(er1000.nrInsc             ' +
        'as varchar)||'
      
        '                                 cast(er1000.iniValid           ' +
        'as varchar)||'
      
        '                                 cast(er1000.fimValid           ' +
        'as varchar)||'
      
        '                                 cast(er1000.classTrib          ' +
        'as varchar)||'
      
        '                                 cast(er1000.indEscrituracao    ' +
        'as varchar)||'
      
        '                                 cast(er1000.indDesoneracao     ' +
        'as varchar)||'
      
        '                                 cast(er1000.indAcordoIsenMulta ' +
        'as varchar)||'
      
        '                                 cast(er1000.indSitPJ           ' +
        'as varchar)||'
      
        '                                 cast(er1000.nmCtt              ' +
        'as varchar)||'
      
        '                                 cast(er1000.cpfCtt             ' +
        'as varchar)||'
      
        '                                 cast(er1000.foneFixo           ' +
        'as varchar)||'
      
        '                                 cast(er1000.foneCel            ' +
        'as varchar)||'
      
        '                                 cast(er1000.email              ' +
        'as varchar)) then'
      
        '                              cast('#39'A'#39' as varchar(1))           ' +
        '          /* Altera'#231#227'o */'
      ''
      '                        else'
      
        '                              cast(null as varchar(1))          ' +
        '           /* nenhuma Altera'#231#227'o */'
      ''
      '                   end'
      '            else'
      
        '              cast(null as varchar(1))                     /* re' +
        'gistro j'#225' foi excluido */'
      '            end'
      '       end as operacao,'
      ''
      '       f.*,'
      ''
      '       er1000.iniValid as iniValid_Anterior,'
      '       er1000.fimValid as fimValid_Anterior'
      ''
      ''
      'from'
      '('
      '  select cast(1 as integer) as tpInsc,'
      '         f.cnpj as nrInsc,'
      ''
      
        '         cast(TO_CHAR(f.iniciovalidadereinf, '#39'YYYY-MM'#39') as varch' +
        'ar(7)) as iniValid,'
      ''
      '         case when f.finalvalidadereinf is not null then'
      
        '           cast(TO_CHAR(f.finalvalidadereinf, '#39'YYYY-MM'#39') as varc' +
        'har(7))'
      '         else cast(null as varchar(7)) end as fimValid,'
      ''
      '         f.classificacaotributaria as classTrib,'
      ''
      '         f.indEscrituracao,'
      '         f.indDesoneracao,'
      '         f.indAcordoIsenMulta,'
      '         f.indSitPJ,'
      ''
      '         cast(:nmCtt as varchar(70)) as    nmCtt,'
      '         cast(:cpfCtt as varchar(11)) as   cpfCtt,'
      '         cast(:foneFixo as varchar(13)) as foneFixo,'
      '         cast(:foneCel as varchar(13)) as  foneCel,'
      '         cast(:email as varchar(6)) as     email,'
      ''
      '         f.DataHoraExclusaoReinf,'
      '         f.DataHoraAlteracaoReinf,'
      ''
      '         (select max(er1000.numeroreinf)'
      '          from Envio_Reinf_1000 er1000'
      '          where er1000.nrInsc = f.cnpj) as numeroreinf'
      ''
      '  from filiais f'
      '  where f.codigo = :filial'
      ') as f left join Envio_Reinf_1000 er1000'
      '     on f.numeroreinf = er1000.numeroreinf'
      ') as f'
      'where f.operacao is not null')
    RequestLive = False
    Left = 56
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nmCtt'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cpfCtt'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'foneFixo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'foneCel'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'email'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end>
    object qry1000_Contribuintenumeroreinf: TIntegerField
      FieldName = 'numeroreinf'
    end
    object qry1000_Contribuinteoperacao: TStringField
      DisplayLabel = 'Opera'#231#227'o'
      FieldName = 'operacao'
      Size = 1
    end
    object qry1000_Contribuintetpinsc: TIntegerField
      DisplayLabel = 'Tipo Inscri'#231#227'o'
      FieldName = 'tpinsc'
    end
    object qry1000_Contribuintenrinsc: TStringField
      DisplayLabel = 'N'#186' Inscri'#231#227'o'
      FieldName = 'nrinsc'
      Size = 14
    end
    object qry1000_Contribuinteinivalid: TStringField
      DisplayLabel = 'In'#237'cio Validade'
      FieldName = 'inivalid'
      Size = 7
    end
    object qry1000_Contribuintefimvalid: TStringField
      DisplayLabel = 'Final Validade'
      FieldName = 'fimvalid'
      Size = 7
    end
    object qry1000_Contribuinteclasstrib: TStringField
      DisplayLabel = 'Classifica'#231#227'o'
      FieldName = 'classtrib'
      Size = 2
    end
    object qry1000_Contribuinteindescrituracao: TIntegerField
      DisplayLabel = 'Obrig. ECD'
      FieldName = 'indescrituracao'
    end
    object qry1000_Contribuinteinddesoneracao: TIntegerField
      DisplayLabel = 'Ind. Desonera'#231#227'o'
      FieldName = 'inddesoneracao'
    end
    object qry1000_Contribuinteindacordoisenmulta: TIntegerField
      DisplayLabel = 'Acordo Int. Isen'#231#227'o'
      FieldName = 'indacordoisenmulta'
    end
    object qry1000_Contribuinteindsitpj: TIntegerField
      DisplayLabel = 'Situa'#231#227'o PJ'
      FieldName = 'indsitpj'
    end
    object qry1000_Contribuintenmctt: TStringField
      DisplayLabel = 'Nome para Contato'
      FieldName = 'nmctt'
      Size = 70
    end
    object qry1000_Contribuintecpfctt: TStringField
      DisplayLabel = 'CPF do Contato'
      FieldName = 'cpfctt'
      Size = 11
    end
    object qry1000_Contribuintefonefixo: TStringField
      DisplayLabel = 'fFone Fixo'
      FieldName = 'fonefixo'
      Size = 13
    end
    object qry1000_Contribuintefonecel: TStringField
      DisplayLabel = 'Fone Celular'
      FieldName = 'fonecel'
      Size = 13
    end
    object qry1000_Contribuinteemail: TStringField
      DisplayLabel = 'Email'
      FieldName = 'email'
      Size = 6
    end
    object qry1000_Contribuintedatahoraexclusaoreinf: TDateTimeField
      DisplayLabel = 'Data/Hora Exclus'#227'o'
      FieldName = 'datahoraexclusaoreinf'
    end
    object qry1000_Contribuintedatahoraalteracaoreinf: TDateTimeField
      DisplayLabel = 'Data/Hora Altera'#231#227'o'
      FieldName = 'datahoraalteracaoreinf'
    end
    object qry1000_Contribuinteinivalid_anterior: TStringField
      FieldName = 'inivalid_anterior'
      Size = 7
    end
    object qry1000_Contribuintefimvalid_anterior: TStringField
      FieldName = 'fimvalid_anterior'
      Size = 7
    end
    object qry1000_Contribuintes_operacao: TStringField
      FieldName = 's_operacao'
      Size = 50
    end
  end
  object dsr1000_Contribuinte: TtecDataSource
    DataSet = qry1000_Contribuinte
    Left = 88
    Top = 88
  end
  object qryEnvio_Reinf: TtecQuery
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
      'select e_reinf.*'
      'from Envio_Reinf e_reinf'
      'where e_reinf.filial = :filial'
      '  and e_reinf.perApur = :perApur'
      'order by e_reinf.numero  ')
    RequestLive = True
    Left = 200
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'perApur'
        ParamType = ptUnknown
      end>
    object qryEnvio_Reinfdatahoraprocessamento: TDateTimeField
      DisplayLabel = 'Data/Hora do Envio'
      FieldName = 'datahoraprocessamento'
    end
    object qryEnvio_Reinfnumero: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'numero'
    end
    object qryEnvio_Reinffilial: TIntegerField
      DisplayLabel = 'Filial'
      FieldName = 'filial'
    end
    object qryEnvio_Reinfperapur: TStringField
      DisplayLabel = 'Apura'#231#227'o'
      FieldName = 'perapur'
      Size = 7
    end
    object qryEnvio_Reinftpamb: TIntegerField
      DisplayLabel = 'Ambiente'
      FieldName = 'tpamb'
    end
    object qryEnvio_Reinfprocemi: TIntegerField
      DisplayLabel = 'Emissor'
      FieldName = 'procemi'
    end
    object qryEnvio_Reinfverproc: TStringField
      DisplayLabel = 'Verrs'#227'o'
      FieldName = 'verproc'
    end
    object qryEnvio_Reinfdatahoraexclusao: TDateTimeField
      DisplayLabel = 'Data/Hora da Exclus'#227'o'
      FieldName = 'datahoraexclusao'
    end
    object qryEnvio_Reinfdatahoraalteracao: TDateTimeField
      DisplayLabel = 'Data/Hora da Altera'#231#227'o'
      FieldName = 'datahoraalteracao'
    end
  end
  object dsrEnvio_Reinf: TtecDataSource
    DataSet = qryEnvio_Reinf
    Left = 240
    Top = 24
  end
  object qryEnvio1000_Contribuinte: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 'numero=numeroreinf'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrEnvio_Reinf
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select er1000.*,'
      ''
      
        '       case when er1000.operacao = '#39'I'#39' then cast('#39'INCLUS'#195'O'#39' as v' +
        'archar(11))'
      
        '            when er1000.operacao = '#39'A'#39' then cast('#39'ALTERA'#199#195'O'#39' as ' +
        'varchar(11))'
      
        '            when er1000.operacao = '#39'E'#39' then cast('#39'EXCLUS'#195'O'#39' as v' +
        'archar(11))'
      
        '            when er1000.operacao = '#39'R'#39' then cast('#39'RETIFICA'#199#195'O'#39' a' +
        's varchar(11))'
      '       end as s_operacao'
      ''
      'from Envio_Reinf_1000 er1000'
      '     join Envio_Reinf er'
      '     on er1000.numeroreinf = er.numero'
      'where er.filial = :filial'
      '  and er.perApur = :perApur'
      ''
      'order by  er1000.numeroreinf desc'
      '')
    RequestLive = False
    Left = 216
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'perApur'
        ParamType = ptUnknown
      end>
    object qryEnvio1000_Contribuintenumeroreinf: TIntegerField
      FieldName = 'numeroreinf'
    end
    object qryEnvio1000_Contribuinteoperacao: TStringField
      DisplayLabel = 'Opera'#231#227'o'
      FieldName = 'operacao'
      Size = 1
    end
    object qryEnvio1000_Contribuintetpinsc: TIntegerField
      DisplayLabel = 'Tipo Inscri'#231#227'o'
      FieldName = 'tpinsc'
    end
    object qryEnvio1000_Contribuintenrinsc: TStringField
      DisplayLabel = 'N'#186' Inscri'#231#227'o'
      FieldName = 'nrinsc'
      Size = 14
    end
    object qryEnvio1000_Contribuinteinivalid: TStringField
      DisplayLabel = 'In'#237'cio Validade'
      FieldName = 'inivalid'
      Size = 7
    end
    object qryEnvio1000_Contribuintefimvalid: TStringField
      DisplayLabel = 'Final Validade'
      FieldName = 'fimvalid'
      Size = 7
    end
    object qryEnvio1000_Contribuinteclasstrib: TStringField
      DisplayLabel = 'Classifica'#231#227'o'
      FieldName = 'classtrib'
      Size = 2
    end
    object qryEnvio1000_Contribuinteindescrituracao: TIntegerField
      DisplayLabel = 'Obrig. ECD'
      FieldName = 'indescrituracao'
    end
    object qryEnvio1000_Contribuinteinddesoneracao: TIntegerField
      DisplayLabel = 'Ind. Desonera'#231#227'o'
      FieldName = 'inddesoneracao'
    end
    object qryEnvio1000_Contribuinteindacordoisenmulta: TIntegerField
      DisplayLabel = 'Acordo Int. Isen'#231#227'o'
      FieldName = 'indacordoisenmulta'
    end
    object qryEnvio1000_Contribuinteindsitpj: TIntegerField
      DisplayLabel = 'Situa'#231#227'o PJ'
      FieldName = 'indsitpj'
    end
    object qryEnvio1000_Contribuintenmctt: TStringField
      DisplayLabel = 'Nome para Contato'
      FieldName = 'nmctt'
      Size = 70
    end
    object qryEnvio1000_Contribuintecpfctt: TStringField
      DisplayLabel = 'CPF do Contato'
      FieldName = 'cpfctt'
      Size = 11
    end
    object qryEnvio1000_Contribuintefonefixo: TStringField
      DisplayLabel = 'Fone Fixo'
      FieldName = 'fonefixo'
      Size = 13
    end
    object qryEnvio1000_Contribuintefonecel: TStringField
      DisplayLabel = 'Fone Celular'
      FieldName = 'fonecel'
      Size = 13
    end
    object qryEnvio1000_Contribuinteemail: TStringField
      DisplayLabel = 'Email'
      FieldName = 'email'
      Size = 6
    end
    object qryEnvio1000_Contribuintedatahoraexclusaoreinf: TDateTimeField
      DisplayLabel = 'Data/Hora Exclus'#227'o'
      FieldName = 'datahoraexclusaoreinf'
    end
    object qryEnvio1000_Contribuintedatahoraalteracaoreinf: TDateTimeField
      DisplayLabel = 'Data/Hora Altera'#231#227'o'
      FieldName = 'datahoraalteracaoreinf'
    end
    object qryEnvio1000_Contribuintes_operacao: TStringField
      FieldName = 's_operacao'
      Size = 50
    end
  end
  object dsrEnvio1000_Contribuinte: TtecDataSource
    DataSet = qryEnvio1000_Contribuinte
    Left = 248
    Top = 104
  end
  object qryEnvio1070_ProcessoJudicialReinf: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 'numero=numeroreinf'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrEnvio_Reinf
    Constraints = <>
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
      '       end as s_operacao'
      ''
      'from Envio_ProcessoJudicialReinf e_pjr'
      '     join Envio_Reinf er'
      '     on e_pjr.numeroreinf = er.numero'
      ''
      'where er.filial = :filial'
      '  and er.perApur = :perApur'
      ''
      'order by  e_pjr.numeroreinf desc')
    RequestLive = False
    Left = 320
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'perApur'
        ParamType = ptUnknown
      end>
    object qryEnvio1070_ProcessoJudicialReinfnumero: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'numero'
    end
    object qryEnvio1070_ProcessoJudicialReinftpproc: TIntegerField
      DisplayLabel = 'Tipo de Processo'
      FieldName = 'tpproc'
    end
    object qryEnvio1070_ProcessoJudicialReinfnrproc: TStringField
      DisplayLabel = 'Nr. Processo Administrativo'
      FieldName = 'nrproc'
      Size = 21
    end
    object qryEnvio1070_ProcessoJudicialReinfinivalid: TStringField
      DisplayLabel = 'Validade Inicial'
      FieldName = 'inivalid'
      Size = 7
    end
    object qryEnvio1070_ProcessoJudicialReinffimvalid: TStringField
      DisplayLabel = 'Validade Final'
      FieldName = 'fimvalid'
      Size = 7
    end
    object qryEnvio1070_ProcessoJudicialReinfindautoria: TIntegerField
      DisplayLabel = 'Indicativo da autoria da a'#231#227'o judicial'
      FieldName = 'indautoria'
    end
    object qryEnvio1070_ProcessoJudicialReinfdatahoraexclusao: TDateTimeField
      FieldName = 'datahoraexclusao'
    end
    object qryEnvio1070_ProcessoJudicialReinfdatahoraalteracao: TDateTimeField
      FieldName = 'datahoraalteracao'
    end
    object qryEnvio1070_ProcessoJudicialReinfs_tpproc: TStringField
      DisplayLabel = 'Tipo de Processo'
      FieldName = 's_tpproc'
      Size = 50
    end
    object qryEnvio1070_ProcessoJudicialReinfs_indautoria: TStringField
      DisplayLabel = 'Indicativo da autoria da a'#231#227'o judicial'
      FieldName = 's_indautoria'
      Size = 50
    end
    object qryEnvio1070_ProcessoJudicialReinfnumeroreinf: TIntegerField
      FieldName = 'numeroreinf'
      Required = True
    end
    object qryEnvio1070_ProcessoJudicialReinfnrrecarqbase: TStringField
      FieldName = 'nrrecarqbase'
      Size = 52
    end
    object qryEnvio1070_ProcessoJudicialReinfoperacao: TStringField
      DisplayLabel = 'Opera'#231#227'o'
      FieldName = 'operacao'
      Size = 1
    end
    object qryEnvio1070_ProcessoJudicialReinfs_operacao: TStringField
      FieldName = 's_operacao'
      Size = 50
    end
  end
  object dsrEnvio1070_ProcessoJudicialReinf: TtecDataSource
    DataSet = qryEnvio1070_ProcessoJudicialReinf
    Left = 352
    Top = 192
  end
  object qryEnvio1070_SuspensaoExibilidadeTributos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkFields = 'numero=processojudicial;numeroreinf=numeroreinf'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrEnvio1070_ProcessoJudicialReinf
    Constraints = <>
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
      '          and c.estado = e_set.UFVara) as NomeCidade'
      ''
      ''
      'from envio_suspensaoexibilidadetributos e_set'
      '     join Envio_Reinf er'
      '     on e_set.numeroreinf = er.numero'
      ''
      'where er.filial = :filial'
      '  and er.perApur = :perApur'
      ''
      'order by  e_set.numeroreinf desc'
      ''
      ''
      '       '
      '')
    RequestLive = False
    Left = 424
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'perApur'
        ParamType = ptUnknown
      end>
    object qryEnvio1070_SuspensaoExibilidadeTributosprocessojudicial: TIntegerField
      FieldName = 'processojudicial'
    end
    object qryEnvio1070_SuspensaoExibilidadeTributosnumero: TIntegerField
      FieldName = 'numero'
      Required = True
    end
    object qryEnvio1070_SuspensaoExibilidadeTributoscodsusp: TStringField
      FieldName = 'codsusp'
      Size = 14
    end
    object qryEnvio1070_SuspensaoExibilidadeTributosindsusp: TStringField
      FieldName = 'indsusp'
      Size = 2
    end
    object qryEnvio1070_SuspensaoExibilidadeTributosdtdecisao: TDateField
      FieldName = 'dtdecisao'
    end
    object qryEnvio1070_SuspensaoExibilidadeTributosinddeposito: TStringField
      FieldName = 'inddeposito'
      Size = 1
    end
    object qryEnvio1070_SuspensaoExibilidadeTributosufvara: TStringField
      FieldName = 'ufvara'
      Size = 2
    end
    object qryEnvio1070_SuspensaoExibilidadeTributoscodmunic: TIntegerField
      FieldName = 'codmunic'
    end
    object qryEnvio1070_SuspensaoExibilidadeTributosidvara: TStringField
      FieldName = 'idvara'
      Size = 2
    end
    object qryEnvio1070_SuspensaoExibilidadeTributosdatahoraexclusao: TDateTimeField
      FieldName = 'datahoraexclusao'
    end
    object qryEnvio1070_SuspensaoExibilidadeTributoss_indsusp: TStringField
      FieldName = 's_indsusp'
      Size = 50
    end
    object qryEnvio1070_SuspensaoExibilidadeTributosnomecidade: TStringField
      FieldName = 'nomecidade'
      Size = 72
    end
    object qryEnvio1070_SuspensaoExibilidadeTributosnumeroreinf: TIntegerField
      FieldName = 'numeroreinf'
      Required = True
    end
  end
  object dsrEnvio1070_SuspensaoExibilidadeTributos: TtecDataSource
    DataSet = qryEnvio1070_SuspensaoExibilidadeTributos
    Left = 464
    Top = 256
  end
  object qry1070_ProcessoJudicialReinf: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qry1070_ProcessoJudicialReinfAfterOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      ';select pjr.*,'
      
        '       case when pjr.operacao = '#39'I'#39' then cast('#39'INCLUS'#195'O'#39' as varc' +
        'har(11))'
      
        '            when pjr.operacao = '#39'A'#39' then cast('#39'ALTERA'#199#195'O'#39' as var' +
        'char(11))'
      
        '            when pjr.operacao = '#39'E'#39' then cast('#39'EXCLUS'#195'O'#39' as varc' +
        'har(11))'
      
        '            when pjr.operacao = '#39'R'#39' then cast('#39'RETIFICA'#199#195'O'#39' as v' +
        'archar(11))'
      '       end as s_operacao'
      ''
      'from'
      '('
      
        ' select case when pjr.numeroreinf is null then  /* n'#227'o foi envia' +
        'do nada ao reinf */'
      '            case'
      
        '                when pjr.DataHoraExclusao is not null then /* fo' +
        'i cancelado */'
      
        '                  cast(null as varchar(1))                    /*' +
        ' nenhuma opera'#231#227'o ser'#225' feita */'
      '                else'
      
        '                  cast('#39'I'#39' as varchar(1))                     /*' +
        ' Inclus'#227'o */'
      '            end'
      '       else'
      '            case when (e_pjr.operacao = '#39'I'#39') or'
      '                      (e_pjr.operacao = '#39'A'#39') then'
      
        '                   case when pjr.DataHoraExclusao is not null th' +
        'en'
      
        '                            cast('#39'E'#39' as varchar(1))             ' +
        '        /* Exclusao */'
      ''
      
        '                        when md5(cast(pjr.tpProc                ' +
        ' as varchar)||'
      
        '                                 cast(pjr.nrproc                ' +
        ' as varchar)||'
      
        '                                 cast(pjr.iniValid              ' +
        ' as varchar)||'
      
        '                                 cast(pjr.fimValid              ' +
        ' as varchar)||'
      
        '                                 cast(pjr.indAutoria            ' +
        ' as varchar)) <>'
      
        '                             md5(cast(e_pjr.tpProc            as' +
        ' varchar)||'
      
        '                                 cast(e_pjr.nrproc            as' +
        ' varchar)||'
      
        '                                 cast(e_pjr.iniValid          as' +
        ' varchar)||'
      
        '                                 cast(e_pjr.fimValid          as' +
        ' varchar)||'
      
        '                                 cast(e_pjr.indAutoria        as' +
        ' varchar)) or'
      ''
      
        '                              ( (select COALESCE(md5(string_agg(' +
        'cast(setr as text),'#39#39')),'#39#39')'
      '                                                        from'
      '                                                        ('
      '                                                         select'
      
        '                                                           setr.' +
        'codSusp,'
      
        '                                                           setr.' +
        'indSusp,'
      
        '                                                           setr.' +
        'dtDecisao,'
      
        '                                                           setr.' +
        'indDeposito,'
      
        '                                                           setr.' +
        'ufVara,'
      
        '                                                           setr.' +
        'codMunic,'
      
        '                                                           setr.' +
        'idVara'
      
        '                                                         from Su' +
        'spensaoExibilidadeTributos setr'
      
        '                                                         where s' +
        'etr.processojudicial = 3'
      
        '                                                          and se' +
        'tr.datahoraexclusao is null'
      
        '                                                        order by' +
        ' setr.numero'
      
        '                                                        ) as set' +
        'r) <>'
      ''
      
        '                                (select coalesce(md5(string_agg(' +
        'cast(e_setr as text),'#39#39')),'#39#39')'
      '                                                        from'
      '                                                        ('
      '                                                         select'
      
        '                                                           e_set' +
        'r.codSusp,'
      
        '                                                           e_set' +
        'r.indSusp,'
      
        '                                                           e_set' +
        'r.dtDecisao,'
      
        '                                                           e_set' +
        'r.indDeposito,'
      
        '                                                           e_set' +
        'r.ufVara,'
      
        '                                                           e_set' +
        'r.codMunic,'
      
        '                                                           e_set' +
        'r.idVara'
      
        '                                                         from En' +
        'vio_SuspensaoExibilidadeTributos e_setr'
      
        '                                                         where e' +
        '_setr.processojudicial = 3'
      
        '                                                           and e' +
        '_setr.numeroreinf = 0'
      
        '                                                        order by' +
        ' e_setr.numero'
      
        '                                                        ) as e_s' +
        'etr)) then'
      
        '                              cast('#39'A'#39' as varchar(1))           ' +
        '          /* Altera'#231#227'o */'
      ''
      '                        else'
      
        '                              cast(null as varchar(1))          ' +
        '           /* nenhuma Altera'#231#227'o */'
      ''
      '                   end'
      '                   else'
      
        '                     cast(null as varchar(1))                   ' +
        '  /* registro j'#225' foi excluido */'
      '            end'
      '       end as operacao,'
      ''
      '       pjr.*,'
      ''
      '       e_pjr.iniValid as iniValid_Anterior,'
      '       e_pjr.fimValid as fimValid_Anterior'
      ''
      'from'
      '('
      'select pjr.*,'
      
        '       case when pjr.tpproc = 1 then cast('#39'1 - Administrativo '#39' ' +
        'as varchar(20))'
      
        '            when pjr.tpproc = 2 then cast('#39'2 - Judici'#225'rio'#39'  as v' +
        'archar(20))'
      '       end as s_tpproc,'
      ''
      
        '       case when pjr.indautoria = 1 then cast('#39'1 - Pr'#243'prio contr' +
        'ibuinte '#39' as varchar(30))'
      
        '            when pjr.indautoria = 2 then cast('#39'2 - Outra entidad' +
        'e ou empresa'#39'  as varchar(30))'
      '       end as s_indautoria,'
      ''
      ''
      '       (select max(e_pjr.numeroreinf)'
      '        from Envio_ProcessoJudicialReinf e_pjr'
      '        where e_pjr.numero = pjr.numero) as numeroreinf'
      ''
      'from  ProcessoJudicialReinf pjr'
      ')  as pjr'
      '      left join Envio_ProcessoJudicialReinf e_pjr'
      '      on pjr.numero = e_pjr.numero'
      '      and pjr.numeroreinf = e_pjr.numeroreinf'
      ') as pjr where operacao is not null')
    RequestLive = False
    Left = 80
    Top = 160
    object qry1070_ProcessoJudicialReinfnumero: TIntegerField
      FieldName = 'numero'
      Required = True
    end
    object qry1070_ProcessoJudicialReinftpproc: TIntegerField
      FieldName = 'tpproc'
    end
    object qry1070_ProcessoJudicialReinfnrproc: TStringField
      FieldName = 'nrproc'
      Size = 21
    end
    object qry1070_ProcessoJudicialReinfinivalid: TStringField
      FieldName = 'inivalid'
      Size = 7
    end
    object qry1070_ProcessoJudicialReinffimvalid: TStringField
      FieldName = 'fimvalid'
      Size = 7
    end
    object qry1070_ProcessoJudicialReinfindautoria: TIntegerField
      FieldName = 'indautoria'
    end
    object qry1070_ProcessoJudicialReinfdatahoraexclusao: TDateTimeField
      FieldName = 'datahoraexclusao'
    end
    object qry1070_ProcessoJudicialReinfdatahoraalteracao: TDateTimeField
      FieldName = 'datahoraalteracao'
    end
    object qry1070_ProcessoJudicialReinfs_tpproc: TStringField
      FieldName = 's_tpproc'
      Size = 14
    end
    object qry1070_ProcessoJudicialReinfs_indautoria: TStringField
      FieldName = 's_indautoria'
      Size = 29
    end
    object qry1070_ProcessoJudicialReinfnumeroreinf: TIntegerField
      FieldName = 'numeroreinf'
    end
    object qry1070_ProcessoJudicialReinfoperacao: TStringField
      FieldName = 'operacao'
      Size = 1
    end
    object qry1070_ProcessoJudicialReinfs_operacao: TStringField
      FieldName = 's_operacao'
      Size = 8
    end
    object qry1070_ProcessoJudicialReinfinivalid_anterior: TStringField
      FieldName = 'inivalid_anterior'
      Size = 7
    end
    object qry1070_ProcessoJudicialReinffimvalid_anterior: TStringField
      FieldName = 'fimvalid_anterior'
      Size = 7
    end
  end
  object dsr1070_ProcessoJudicialReinf: TtecDataSource
    DataSet = qry1070_ProcessoJudicialReinf
    Left = 112
    Top = 176
  end
  object qry1070_SuspensaoExibilidadeTributos: TtecQuery
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
      'select suet.*,'
      ''
      
        '       case when suet.indsusp = '#39'01'#39' then cast('#39'01 - Liminar em ' +
        'Mandado de Seguran'#231'a'#39' as varchar(100))'
      
        '            when suet.indsusp = '#39'02'#39' then cast('#39'02 - Dep'#243'sito Ju' +
        'dicial do Montante Integral'#39' as varchar(100))'
      
        '            when suet.indsusp = '#39'03'#39' then cast('#39'03 - Dep'#243'sito Ad' +
        'ministrativo do Montante Integral'#39' as varchar(100))'
      
        '            when suet.indsusp = '#39'04'#39' then cast('#39'04 - Antecipa'#231#227'o' +
        ' de Tutela'#39' as varchar(100))'
      
        '            when suet.indsusp = '#39'05'#39' then cast('#39'05 - Liminar em ' +
        'Medida Cautelar'#39' as varchar(100))'
      
        '            when suet.indsusp = '#39'08'#39' then cast('#39'08 - Senten'#231'a em' +
        ' Mandado de Seguran'#231'a Favor'#225'vel ao Contribuinte'#39' as varchar(100)' +
        ')'
      
        '            when suet.indsusp = '#39'09'#39' then cast('#39'09 - Senten'#231'a em' +
        ' A'#231#227'o Ordin'#225'ria Favor'#225'vel ao Contribuinte e Confirmada pelo TRF'#39 +
        ' as varchar(100))'
      
        '            when suet.indsusp = '#39'10'#39' then cast('#39'10 - Ac'#243'rd'#227'o do ' +
        'TRF Favor'#225'vel ao Contribuinte'#39' as varchar(100))'
      
        '            when suet.indsusp = '#39'11'#39' then cast('#39'11 - Ac'#243'rd'#227'o do ' +
        'STJ em Recurso Especial Favor'#225'vel ao Contribuinte'#39' as varchar(10' +
        '0))'
      
        '            when suet.indsusp = '#39'12'#39' then cast('#39'12 - Ac'#243'rd'#227'o do ' +
        'STF em Recurso Extraordin'#225'rio Favor'#225'vel ao Contribuinte'#39' as varc' +
        'har(100))'
      
        '            when suet.indsusp = '#39'13'#39' then cast('#39'13 - Senten'#231'a 1'#170 +
        ' inst'#226'ncia n'#227'o transitada em julgado com efeito suspensivo'#39' as v' +
        'archar(100))'
      
        '            when suet.indsusp = '#39'90'#39' then cast('#39'90 - Decis'#227'o Def' +
        'initiva a favor do contribuinte'#39' as varchar(100))'
      
        '            when suet.indsusp = '#39'92'#39' then cast('#39'92 - Sem suspens' +
        #227'o da exigibilidade'#39' as varchar(100))'
      '       end as s_indsusp,'
      ''
      '       (select c.nome'
      '        from cidades c'
      '        where c.codigoibge = suet.codMunic'
      '          and c.estado = suet.UFVara) as NomeCidade'
      ''
      'from suspensaoexibilidadetributos suet'
      'where suet.ProcessoJudicial in (:ListaProcessoJudicial)'
      'order by suet.numero')
    RequestLive = False
    Left = 144
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ListaProcessoJudicial'
        ParamType = ptUnknown
      end>
    object qry1070_SuspensaoExibilidadeTributosprocessojudicial: TIntegerField
      FieldName = 'processojudicial'
    end
    object qry1070_SuspensaoExibilidadeTributosnumero: TIntegerField
      FieldName = 'numero'
    end
    object qry1070_SuspensaoExibilidadeTributoscodsusp: TStringField
      FieldName = 'codsusp'
      Size = 14
    end
    object qry1070_SuspensaoExibilidadeTributosindsusp: TStringField
      FieldName = 'indsusp'
      Size = 2
    end
    object qry1070_SuspensaoExibilidadeTributosdtdecisao: TDateField
      Alignment = taCenter
      FieldName = 'dtdecisao'
      EditMask = '99/99/9999;1; '
    end
    object qry1070_SuspensaoExibilidadeTributosinddeposito: TStringField
      FieldName = 'inddeposito'
      Size = 1
    end
    object qry1070_SuspensaoExibilidadeTributosufvara: TStringField
      FieldName = 'ufvara'
      Size = 2
    end
    object qry1070_SuspensaoExibilidadeTributoscodmunic: TIntegerField
      FieldName = 'codmunic'
    end
    object qry1070_SuspensaoExibilidadeTributosidvara: TStringField
      FieldName = 'idvara'
      Size = 2
    end
    object qry1070_SuspensaoExibilidadeTributosdatahoraexclusao: TDateTimeField
      FieldName = 'datahoraexclusao'
    end
    object qry1070_SuspensaoExibilidadeTributoss_indsusp: TStringField
      FieldName = 's_indsusp'
      Size = 50
    end
    object qry1070_SuspensaoExibilidadeTributosnomecidade: TStringField
      FieldName = 'nomecidade'
      Size = 72
    end
  end
  object dsr1070_SuspensaoExibilidadeTributos: TtecDataSource
    DataSet = qry1070_SuspensaoExibilidadeTributos
    Left = 176
    Top = 231
  end
  object qry2010_ServicosTomados: TtecQuery
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
      'select  r2010.fornecedor, '
      '        r2010.tipofornecedor,'
      '        r2010.filial, '
      '        r2010.tipofilial,'
      '        r2010.tpInscEstab,'
      '        r2010.nrInscEstab, '
      '        r2010.indobra, '
      '        r2010.cnpjPrestador,'
      '        r2010.indCPRB,'
      '        '
      
        '       case when r2010.tpinscestab = 1 then cast('#39'CNPJ'#39' as varch' +
        'ar(4))'
      
        '            when r2010.tpinscestab = 4 then cast('#39'CNO'#39' as varcha' +
        'r(4))'
      '       end as stpinscestab,'
      ''
      
        '       case when r2010.indobra = 0 then cast('#39'0 - N'#227'o est'#225' sujei' +
        'ta a matr'#237'cula de obra'#39' as varchar(50))'
      
        '            when r2010.indobra = 1 then cast('#39'1 - Obra de Constr' +
        'u'#231#227'o Civil - Empreitada Total'#39' as varchar(50))'
      
        '            when r2010.indobra = 2 then cast('#39'2 - Obra de Constr' +
        'u'#231#227'o Civil - Empreitada Parcial'#39' as varchar(50))'
      '       end as sindobra,'
      '        '
      '        sum(r2010.vlrTotalBruto) as vlrTotalBruto,'
      '        sum(r2010.vlrTotalBaseRet) as vlrTotalBaseRet,'
      '        sum(r2010.vlrTotalRetPrinc) as vlrTotalRetPrinc,'
      '        sum(r2010.vlrTotalRetAdic) as vlrTotalRetAdic,'
      '        sum(r2010.vlrTotalNRetPrinc) as vlrTotalNRetPrinc,'
      '        sum(r2010.vlrTotalNRetAdic) as vlrTotalNRetAdic'
      'from'
      ''
      '('
      ''
      'select  r2010.fornecedor, '
      '        r2010.tipofornecedor,'
      '        r2010.filial, '
      '        r2010.tipofilial,'
      '        r2010.tpInscEstab,'
      '        r2010.nrInscEstab, '
      '        r2010.indobra, '
      '        r2010.cnpjPrestador,'
      '        r2010.indCPRB,'
      '        '
      '       '
      '       dp.valor as vlrTotalBruto,'
      '       '
      '       (select sum(r2010_is.vlrBaseRet)'
      '        from reinf_2010_infotpserv r2010_is'
      '        where r2010_is.documentopag = r2010.documentopag'
      '          and r2010_is.) as vlrTotalBaseRet,'
      '        '
      '       (select sum(r2010_is.vlrRetencao - r2010_is.vlrRetSub)'
      '        from reinf_2010_infotpserv r2010_is'
      
        '        where r2010_is.documentopag = r2010.documentopag) as vlr' +
        'TotalRetPrinc,'
      ''
      '       (select sum(r2010_is.vlrAdicional)'
      '        from reinf_2010_infotpserv r2010_is'
      
        '        where r2010_is.documentopag = r2010.documentopag) as vlr' +
        'TotalRetAdic,'
      ''
      '       (select sum(r2010_is.vlrNRetPrinc)'
      '        from reinf_2010_infotpserv r2010_is'
      
        '        where r2010_is.documentopag = r2010.documentopag) as vlr' +
        'TotalNRetPrinc,'
      '        '
      '       (select sum(r2010_is.vlrNRetAdic)'
      '        from reinf_2010_infotpserv r2010_is'
      
        '        where r2010_is.documentopag = r2010.documentopag) as vlr' +
        'TotalNRetAdic        '
      '        '
      '       '
      'from reinf_2010 r2010'
      '     join documentospag dp'
      '     on r2010.documentopag = dp.numero'
      ''
      'where (r2010.filial = 1 or'
      '       r2010.filial in (select f.codigo'
      '                       from filiais f'
      '                       where f.filialconsolidadoradime = 1))'
      ') as r2010                       '
      ''
      
        'group by r2010.tpInscEstab, r2010.nrInscEstab, r2010.indobra, r2' +
        '010.cnpjPrestador, r2010.indCPRB,'
      '         r2010.fornecedor, r2010.tipofornecedor,'
      '         r2010.filial, r2010.tipofilial'
      '         '
      'order by  r2010.cnpjPrestador'
      '         '
      '         ')
    RequestLive = True
    Left = 72
    Top = 304
    object qry2010_ServicosTomadosdocumentopag: TIntegerField
      FieldName = 'documentopag'
      Required = True
    end
    object qry2010_ServicosTomadosfornecedor: TIntegerField
      FieldName = 'fornecedor'
    end
    object qry2010_ServicosTomadosfilial: TIntegerField
      FieldName = 'filial'
    end
    object qry2010_ServicosTomadostpinscestab: TIntegerField
      FieldName = 'tpinscestab'
    end
    object qry2010_ServicosTomadosnrinscestab: TStringField
      FieldName = 'nrinscestab'
      Size = 14
    end
    object qry2010_ServicosTomadosindobra: TIntegerField
      FieldName = 'indobra'
    end
    object qry2010_ServicosTomadoscnpjprestador: TStringField
      FieldName = 'cnpjprestador'
      Size = 14
    end
    object qry2010_ServicosTomadosindcprb: TIntegerField
      FieldName = 'indcprb'
    end
    object qry2010_ServicosTomadosdatahoraalteracaodadosreinf: TDateTimeField
      FieldName = 'datahoraalteracaodadosreinf'
      DisplayFormat = 'dd/MM/yyyy hh:mm:ss'
    end
    object qry2010_ServicosTomadosdatahoraexclusaodadosreinf: TDateTimeField
      FieldName = 'datahoraexclusaodadosreinf'
      DisplayFormat = 'dd/MM/yyyy hh:mm:ss'
    end
    object qry2010_ServicosTomadosstpinscestab: TStringField
      FieldName = 'stpinscestab'
      Size = 50
    end
    object qry2010_ServicosTomadossindobra: TStringField
      FieldName = 'sindobra'
      Size = 50
    end
    object qry2010_ServicosTomadostipofornecedor: TStringField
      FieldName = 'tipofornecedor'
      Size = 1
    end
    object qry2010_ServicosTomadostipofilial: TStringField
      FieldName = 'tipofilial'
      Size = 1
    end
    object qry2010_ServicosTomadosvlrtotalbruto: TFloatField
      FieldName = 'vlrtotalbruto'
      DisplayFormat = '###,##0.00'
    end
    object qry2010_ServicosTomadosvlrtotalbaseret: TFloatField
      FieldName = 'vlrtotalbaseret'
      DisplayFormat = '###,##0.00'
    end
    object qry2010_ServicosTomadosvlrtotalretprinc: TFloatField
      FieldName = 'vlrtotalretprinc'
      DisplayFormat = '###,##0.00'
    end
    object qry2010_ServicosTomadosvlrtotalretadic: TFloatField
      FieldName = 'vlrtotalretadic'
      DisplayFormat = '###,##0.00'
    end
    object qry2010_ServicosTomadosvlrtotalnretprinc: TFloatField
      FieldName = 'vlrtotalnretprinc'
      DisplayFormat = '###,##0.00'
    end
    object qry2010_ServicosTomadosvlrtotalnretadic: TFloatField
      FieldName = 'vlrtotalnretadic'
      DisplayFormat = '###,##0.00'
    end
  end
  object dsr2010_ServicosTomados: TtecDataSource
    DataSet = qry2010_ServicosTomados
    Left = 104
    Top = 312
  end
end
