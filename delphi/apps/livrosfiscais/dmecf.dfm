inherited dtmecf: Tdtmecf
  OldCreateOrder = False
  Left = 167
  Top = 33
  Height = 781
  Width = 1448
  object qryecf: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryecfAfterScroll
    OnNewRecord = qryecfNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select ecf.*'
      'from ecf'
      'where ecf.exercicio = :exercicio'
      '    and ecf.filial = :filial')
    RequestLive = True
    Left = 32
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end>
    object qryecfexercicio: TIntegerField
      FieldName = 'exercicio'
    end
    object qryecfnomearquivo: TStringField
      FieldName = 'nomearquivo'
      Size = 100
    end
    object qryecfdata: TDateTimeField
      FieldName = 'data'
    end
    object qryecffilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryecfnum_ord: TIntegerField
      FieldName = 'num_ord'
      DisplayFormat = '0'
    end
    object qryecfnatureza: TStringField
      FieldName = 'natureza'
      Size = 80
    end
    object qryecfind_sit_ini_per: TStringField
      FieldName = 'ind_sit_ini_per'
      Size = 1
    end
    object qryecfsit_especial: TStringField
      FieldName = 'sit_especial'
      Size = 1
    end
    object qryecfpat_reman_cis: TFloatField
      FieldName = 'pat_reman_cis'
      DisplayFormat = '0.00'
    end
    object qryecfdt_sit_esp: TDateField
      Alignment = taCenter
      FieldName = 'dt_sit_esp'
      EditMask = '99/99/9999;1; '
    end
    object qryecfdt_ini: TDateField
      Alignment = taCenter
      FieldName = 'dt_ini'
      EditMask = '99/99/9999;1; '
    end
    object qryecfdt_fin: TDateField
      Alignment = taCenter
      FieldName = 'dt_fin'
      EditMask = '99/99/9999;1; '
    end
    object qryecfretificadora: TStringField
      FieldName = 'retificadora'
      Size = 1
    end
    object qryecfnum_rec: TStringField
      FieldName = 'num_rec'
      Size = 41
    end
    object qryecftip_ecf: TStringField
      FieldName = 'tip_ecf'
      Size = 1
    end
    object qryecfcod_scp: TStringField
      FieldName = 'cod_scp'
      Size = 14
    end
  end
  object qryFiliais: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryFiliaisAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select f.*,'
      ''
      '       btrim((select b.nome'
      #9'    from bairros b'
      #9#9'where b.cidade = f.cidade'
      '          and b.codigo = f.bairro'
      '          and b.estado = f.estado)) as bairro,'
      ''
      ''
      '     (select c.codigoibge'
      '       from cidades c'
      '       where c.estado = f.estado'
      '         and c.codigo = f.cidade) as cidadeIBGE'
      '          '
      ''
      'from filiais f'
      'where f.codigo = :codigo')
    RequestLive = False
    Left = 416
    Top = 248
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
        Value = '2'
      end>
  end
  object dsrecf: TtecDataSource
    DataSet = qryecf
    OnDataChange = dsrecfDataChange
    Left = 64
    Top = 8
  end
  object qryInstRespAdmCadastro: TtecQuery
    Tag = -1
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    RequestLive = False
    Left = 192
    Top = 592
  end
  object qryRespAdmCadastro: TtecQuery
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
      'select *'
      'from respadmcadastro'
      'where filial=:filial')
    RequestLive = True
    Left = 176
    Top = 640
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end>
    object qryRespAdmCadastroinstituicao: TStringField
      FieldName = 'instituicao'
      Required = True
      Size = 2
    end
    object qryRespAdmCadastrocodigo: TStringField
      FieldName = 'codigo'
      Required = True
      Size = 30
    end
  end
  object dsrRespAdmCadastro: TtecDataSource
    DataSet = qryRespAdmCadastro
    Left = 184
    Top = 688
  end
  object qryRegistroJ050: TtecQuery
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
      ';select distinct selecao.*'
      'from'
      '('
      'select'
      '       cast(:datainicial as date) as data_alt,'
      '       cast(case when pl.natureza = '#39'A'#39'   then '#39'01'#39
      '                 when pl.natureza = '#39'P'#39'        then '#39'02'#39
      '                 when pl.natureza = '#39'L'#39'        then '#39'03'#39
      '                 when pl.natureza IN ('#39'R'#39','#39'D'#39') then '#39'04'#39
      '                 when pl.natureza = '#39'C'#39'        then '#39'05'#39
      '                 when pl.natureza = '#39'O'#39'        then '#39'09'#39
      '            end as varchar(2)) as cod_nat,'
      ''
      '       cast(pl.tipo as char(1)) as ind_cta,'
      ''
      
        '       length(trim(pl.classificacao)) - length(trim(replace(pl.c' +
        'lassificacao,'#39'.'#39','#39#39')))+1 as nivel,'
      ''
      '       case when pl.tipo = '#39'A'#39' then'
      
        '         cast(pl.classificacao||trim(to_char(pl.codigo,'#39'000000'#39')' +
        ') as varchar(28))'
      '       else'
      '         cast(pl.classificacao as varchar(28))'
      '       end as cod_cta,'
      ''
      '       pl.descricao as cta,'
      ''
      '       (select pr.classificacao'
      '        from planoreferencial pr'
      '        where pr.codigo = pl.referencia'
      '          and (pr.validoate is null or'
      '               pr.validoate>current_date)) as cod_cta_ref,'
      ''
      
        '        ClassificacaoContabilAcima(pl.classificacao) as cod_cta_' +
        'sup'
      ''
      
        'from planocontas pl join saldoscontabeis sc on pl.codigo = sc.co' +
        'nta'
      
        'where /* (contacommovto(pl.codigo, sc.filial, cast(:datainicial ' +
        'as date), cast(:datafinal as date)) or sc.saldoanterior<>0) */'
      '  (pl.inativo is null or pl.inativo > :datafinal)'
      ''
      '  and sc.filial in ((select cast(:filial as integer))'
      '                     union'
      '                    (select f.codigo'
      '                     from filiais f'
      '                     where f.filialconsolidadoradime = :filial))'
      '  and sc.exercicio = :exercicio'
      '  and pl.natureza <> '#39'O'#39
      ''
      ') as selecao'
      ''
      
        'order by data_alt, cod_nat, ind_cta, nivel, cod_cta, cta, cod_ct' +
        'a_ref, cod_cta_sup'
      ''
      '')
    RequestLive = False
    Left = 400
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end>
    object qryRegistroJ050data_alt: TDateField
      Alignment = taCenter
      FieldName = 'data_alt'
      EditMask = '99/99/9999;1; '
    end
    object qryRegistroJ050cod_nat: TStringField
      FieldName = 'cod_nat'
      Size = 2
    end
    object qryRegistroJ050ind_cta: TStringField
      FieldName = 'ind_cta'
      Size = 1
    end
    object qryRegistroJ050nivel: TIntegerField
      FieldName = 'nivel'
      DisplayFormat = '0'
    end
    object qryRegistroJ050cod_cta: TStringField
      FieldName = 'cod_cta'
      Size = 28
    end
    object qryRegistroJ050cta: TStringField
      FieldName = 'cta'
      Required = True
      Size = 50
    end
    object qryRegistroJ050cod_cta_ref: TStringField
      FieldName = 'cod_cta_ref'
      Size = 50
    end
    object qryRegistroJ050cod_cta_sup: TStringField
      FieldName = 'cod_cta_sup'
      Size = 50
    end
  end
  object qryRegistroI075: TtecQuery
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
      'select distinct'
      '       h.codigo,'
      '       h.descricao'
      'from lancamentos'
      '      join historicos h'
      '      on historico = h.codigo'
      ''
      'where data between :datainicial and :datafinal'
      '  and filial = :filial'
      ''
      'order by  h.codigo,  h.descricao'
      ''
      '')
    RequestLive = False
    Left = 72
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end>
  end
  object qryRegistroI155: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkFields = 'data=data'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrRegistroI150
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      ';'
      'select Data, cod_cta,'
      '      case when vl_sld_ini >=0 then CAST('#39'D'#39' as char(1))'
      '                                   else CAST('#39'C'#39' as char(1))'
      '       end as ind_dc_ini,'
      '       abs(vl_sld_ini) as vl_sld_ini,'
      '       vl_deb,'
      '       vl_cred,'
      ''
      '       abs(vl_deb - vl_cred + vl_sld_ini) as vl_sld_fin,'
      ''
      '       case when (vl_deb - vl_cred + vl_sld_ini) >=0 then'
      '            CAST('#39'D'#39' as char(1))'
      '       else CAST('#39'C'#39' as char(1))  end as ind_dc_fin'
      ''
      'FROM'
      '('
      '  select Data,'
      '       case when pl.tipo = '#39'A'#39' then'
      
        '         CAST(pl.classificacao||trim(to_char(pl.codigo,'#39'000000'#39')' +
        ') as varchar(28))'
      '       else'
      '         CAST(pl.classificacao as varchar(28))'
      '       end as cod_cta,'
      ''
      
        '       SaldoContabil(pl.Codigo, sc.Filial, CAST('#39'01/'#39' || SUBSTRI' +
        'NG(Data FROM 1 FOR 2)'
      
        '                                               || '#39'/'#39' || SUBSTRI' +
        'NG(Data FROM 3 FOR 4) AS Date) - 1,'
      
        '                                                    CAST(SUBSTRI' +
        'NG(Data FROM 3 FOR 4) AS INTEGER)) AS vl_sld_ini,'
      ''
      
        '       COALESCE(sc.debitos [CAST(SUBSTRING(Data FROM 1 FOR 2) as' +
        ' integer)],0) as vl_deb,'
      
        '       COALESCE(sc.creditos[CAST(SUBSTRING(Data FROM 1 FOR 2) as' +
        ' integer)],0) as vl_cred'
      ''
      '  FROM'
      '  ('
      
        '   select distinct CAST(to_char(CAST(:Datainicial as date)  + s.' +
        'a,'#39'MMYYYY'#39') as varchar(6)) as Data'
      
        '   FROM generate_series(1,CAST(:Datafinal as date)-CAST(:Dataini' +
        'cial as date)) as s(a)'
      '   order by 1'
      '   ) as meses,'
      
        '        planocontas pl join Saldoscontabeis sc on pl.codigo = sc' +
        '.conta'
      
        '        where (contacommovto(pl.codigo, :filial, CAST(:Datainici' +
        'al as date), CAST(:Datafinal as date)) or sc.Saldoanterior<>0)'
      '          and sc.filial = :filial'
      '          and sc.exercicio = :exercicio'
      '          and pl.tipo='#39'A'#39
      ''
      '  order by pl.classificacao, pl.codigo'
      ') as Saldos'
      'where  (vl_sld_ini <> 0) or'
      '       (vl_deb <> 0) or'
      '       (vl_cred <> 0)'
      'order by Data, cod_cta'
      '')
    RequestLive = False
    Left = 136
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'exercicio'
        ParamType = ptUnknown
      end>
    object qryRegistroI155data: TStringField
      FieldName = 'data'
      Size = 6
    end
    object qryRegistroI155cod_cta: TStringField
      FieldName = 'cod_cta'
      Size = 28
    end
    object qryRegistroI155vl_sld_ini: TFloatField
      FieldName = 'vl_sld_ini'
      DisplayFormat = '0.00'
    end
    object qryRegistroI155ind_dc_ini: TStringField
      FieldName = 'ind_dc_ini'
      Size = 1
    end
    object qryRegistroI155vl_deb: TFloatField
      FieldName = 'vl_deb'
      DisplayFormat = '0.00'
    end
    object qryRegistroI155vl_cred: TFloatField
      FieldName = 'vl_cred'
      DisplayFormat = '0.00'
    end
    object qryRegistroI155vl_sld_fin: TFloatField
      FieldName = 'vl_sld_fin'
      DisplayFormat = '0.00'
    end
    object qryRegistroI155ind_dc_fin: TStringField
      FieldName = 'ind_dc_fin'
      Size = 1
    end
  end
  object qryRegistroI150: TtecQuery
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
      
        'select Data, Datainicial, last_day_of_month(Datainicial) as Data' +
        'final'
      'FROM'
      '('
      'select Data,'
      
        '       cast('#39'01/'#39'||SUBSTRING(Data FROM 1 FOR 2)||'#39'/'#39'||SUBSTRING(' +
        'Data FROM 3 FOR 4) as date) as Datainicial'
      'FROM'
      '('
      'select distinct Data'
      'FROM'
      '('
      '  select Data,'
      '       case when pl.tipo = '#39'A'#39' then'
      
        '         cast(pl.classificacao||trim(to_char(pl.codigo,'#39'000000'#39')' +
        ') as varchar(28))'
      '       else'
      '         cast(pl.classificacao as varchar(28))'
      '       end as cod_cta,'
      ''
      
        '       SaldoContabil(pl.Codigo, sc.Filial, CAST('#39'01/'#39' || SUBSTRI' +
        'NG(Data FROM 1 FOR 2)'
      
        '                                               || '#39'/'#39' || SUBSTRI' +
        'NG(Data FROM 3 FOR 4) AS Date) - 1,'
      
        '                                                    CAST(SUBSTRI' +
        'NG(Data FROM 3 FOR 4) AS INTEGER)) AS vl_sld_ini,'
      ''
      
        '       coalesce(sc.debitos[cast(SUBSTRING(Data FROM 1 FOR 2) as ' +
        'integer)],0) as vl_deb,'
      
        '       coalesce(sc.creditos[cast(SUBSTRING(Data FROM 1 FOR 2) as' +
        ' integer)],0) as vl_cred'
      ''
      '  FROM'
      '  ('
      
        '   select distinct cast(to_char(cast(:Datainicial as date)  + s.' +
        'a,'#39'MMYYYY'#39') as varchar(6)) as Data'
      
        '   FROM generate_series(1,cast(:Datafinal as date)-cast(:Dataini' +
        'cial as date)) as s(a)'
      '   order by 1'
      '   ) as meses,'
      
        '        planocontas pl join saldoscontabeis sc on pl.codigo = sc' +
        '.conta'
      
        '        where (contacommovto(pl.codigo, :filial, cast(:Datainici' +
        'al as date), cast(:Datafinal as date)) or sc.saldoanterior<>0)'
      '          and sc.filial = :filial'
      '          and sc.exercicio = :exercicio'
      '          and pl.tipo='#39'A'#39
      ''
      '  order by pl.classificacao, pl.codigo'
      ') as saldos'
      'where  (vl_sld_ini <> 0) or'
      '       (vl_deb <> 0) or'
      '       (vl_cred <> 0)'
      'order by Data'
      ') as meses'
      ') as meses')
    RequestLive = False
    Left = 72
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'exercicio'
        ParamType = ptUnknown
      end>
    object qryRegistroI150data: TStringField
      FieldName = 'data'
      Size = 6
    end
    object qryRegistroI150datainicial: TDateField
      Alignment = taCenter
      FieldName = 'datainicial'
      EditMask = '99/99/9999;1; '
    end
    object qryRegistroI150datafinal: TDateField
      Alignment = taCenter
      FieldName = 'datafinal'
      EditMask = '99/99/9999;1; '
    end
  end
  object dsrRegistroI150: TtecDataSource
    DataSet = qryRegistroI150
    Left = 128
    Top = 184
  end
  object qryRegistroI200: TtecQuery
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
      
        'select num_lcto, data as dt_lcto, sum(valor) as vl_lcto, ind_lct' +
        'o'
      'from'
      '('
      'select case when origem = '#39'M'#39' then cast(nrlancto as varchar)'
      
        '                  /* Quando lote ter'#225' o seguinte formato  ->    ' +
        ' L 0000 0000'
      
        '                                                      sendo L --' +
        '> indicador de Lote'
      
        '                                                                ' +
        '0000 -> quatro caracteres para o numero do dia no ano, um zero a' +
        ' mais na frente para garantir a unicidade'
      
        '                                                                ' +
        '0000 -> quatro caracteres para o numero do lote'
      '                                                */'
      
        '            when origem = '#39'L'#39' then cast(origem||trim(to_char(EXT' +
        'RACT(DOY FROM data),'#39'0000'#39'))||trim(to_char(nrorigem,'#39'0000'#39')) as ' +
        'varchar)'
      
        '            when origem = '#39'P'#39' then cast('#39'P'#39'||trim(to_char(EXTRAC' +
        'T(DOY FROM data),'#39'0000'#39'))||nrorigem/1000000000 as varchar)'
      
        '            else                   cast(origem||nrorigem  as var' +
        'char) end as num_lcto,'
      '       data,'
      '       valor,'
      
        '       case when origem = '#39'X'#39' then cast('#39'E'#39' as varchar(1)) else ' +
        'cast('#39'N'#39' as varchar(1)) end as ind_lcto'
      ''
      'from lancamentos'
      'where filial = :filial'
      '  and data between :datainicial and :datafinal'
      ' and debitar is not null'
      ') as soma'
      'group by data,num_lcto, ind_lcto'
      'order by data,num_lcto, ind_lcto'
      '')
    RequestLive = False
    Left = 72
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end>
    object qryRegistroI200num_lcto: TStringField
      FieldName = 'num_lcto'
      Size = 50
    end
    object qryRegistroI200dt_lcto: TDateField
      FieldName = 'dt_lcto'
    end
    object qryRegistroI200vl_lcto: TFloatField
      DisplayWidth = 19
      FieldName = 'vl_lcto'
      DisplayFormat = '###,###,###,##0.00'
      Precision = 2
    end
    object qryRegistroI200ind_lcto: TStringField
      FieldName = 'ind_lcto'
      Size = 1
    end
  end
  object qryRegistroI250: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkFields = 'num_lcto=num_lcto'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrRegistroI200
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = '1000000'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = '1000'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = '100'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      '('
      ' select case when origem = '#39'M'#39' then cast(nrlancto as varchar)'
      
        '                  /* Quando lote ter'#225' o seguinte formato ->     ' +
        'L 0000 0000'
      
        '                                                      sendo L --' +
        '> indicador de Lote'
      
        '                                                                ' +
        '0000 -> quatro caracteres para o numero do dia no ano, um zero a' +
        ' mais na frente para garantir a unicidade'
      
        '                                                                ' +
        '0000 -> quatro caracteres para o numero do lote'
      '                                                */'
      
        '             when origem = '#39'L'#39' then cast(origem||trim(to_char(EX' +
        'TRACT(DOY FROM data),'#39'0000'#39'))||trim(to_char(nrorigem,'#39'0000'#39')) as' +
        ' varchar)'
      
        '             when origem = '#39'P'#39' then cast('#39'P'#39'||trim(to_char(EXTRA' +
        'CT(DOY FROM data),'#39'0000'#39'))||nrorigem/1000000000 as varchar)'
      
        '             else                   cast(origem||nrorigem  as va' +
        'rchar) end as num_lcto,'
      ''
      '       case when pl.tipo = '#39'A'#39' then'
      
        '         cast(pl.classificacao||trim(to_char(pl.codigo,'#39'000000'#39')' +
        ') as varchar(28))'
      '       else'
      '         cast(pl.classificacao as varchar(28))'
      '       end as cod_cta,'
      '       valor as vl_dc,'
      '       cast('#39'D'#39' as char(1)) as ind_dc,'
      '              /*'
      
        '       case when origem = '#39'B'#39' then cast(substring(nrorigem, 3 + ' +
        'length(extract(doy from data)), length(nrorigem)-2-length(extrac' +
        't(doy from data))-7 )||'#39' '#39'||'
      
        '                                        to_char(data, '#39'DDMMYY'#39') ' +
        'as char(12))'
      
        '            when origem = '#39'E'#39' then cast('#39'NF '#39' || (select np.nume' +
        'ro from notaspag np where np.codigo = nrorigem)  as char(12))'
      
        '            when origem = '#39'D'#39' then cast((select trim(dp.compleme' +
        'nto) from documentospag dp where dp.numero = nrorigem) as char(1' +
        '2))'
      
        '            when origem = '#39'M'#39' then cast('#39'MAN '#39' || nrlancto as ch' +
        'ar(12))'
      
        '            when origem = '#39'P'#39' then cast('#39'PG '#39'||(select trim(dp.c' +
        'omplemento) from documentospag dp where dp.numero = (nrorigem/10' +
        '00)%1000000   )||'#39' '#39'||nrorigem%1000 as char(12))'
      
        '            when origem = '#39'R'#39' then cast('#39'PG '#39' || nrorigem/100||'#39 +
        ' '#39'||nrorigem%100 as varchar(12))'
      
        '            when origem = '#39'S'#39' then cast((select n.numero from no' +
        'tas n where n.dadofiscal = nrorigem) as char(12))'
      
        '            when origem = '#39'L'#39' then cast('#39'LOTE '#39' || nrorigem as c' +
        'har(12))'
      
        '            when origem = '#39'X'#39' then cast('#39'LOTE-x '#39' || nrorigem as' +
        ' char(12))'
      
        '            when origem = '#39'I'#39' then cast('#39'IMP '#39' || nrorigem as ch' +
        'ar(12))'
      
        '            when origem IN ('#39'V'#39', '#39'H'#39', '#39'T'#39', '#39'A'#39', '#39'O'#39', '#39'G'#39') then c' +
        'ast('#39'CT '#39' || (NrOrigem / 100000000) as varchar(12))'
      '       end */ cast(null as varchar(12)) as num_arq,'
      ''
      '       historico as cod_hist_pad,'
      
        '       cast(RetiraBrancoePipeeASCII255(coalesce(complemento,'#39'.'#39')' +
        ') as char(254))  as hist'
      ''
      'from lancamentos  join planocontas pl on debitar = pl.codigo'
      'where filial = :filial'
      '  and data between :datainicial and :datafinal'
      ' and debitar is not null'
      ''
      ')'
      ''
      'union all'
      ''
      '('
      ' select case when origem = '#39'M'#39' then cast(nrlancto as varchar)'
      
        '                  /* Quando lote ter'#225' o seguinte formato ->    L' +
        ' 0000 0000'
      
        '                                                      sendo L --' +
        '> indicador de Lote'
      
        '                                                                ' +
        '0000 -> quatro caracteres para o numero do dia no ano, um zero a' +
        ' mais na frente para garantir a unicidade'
      
        '                                                                ' +
        '0000 -> quatro caracteres para o numero do lote'
      '                                                */'
      
        '                  when origem = '#39'P'#39' then cast('#39'P'#39'||trim(to_char(' +
        'EXTRACT(DOY FROM data),'#39'0000'#39'))||nrorigem/1000000000 as varchar)'
      
        '                  when origem = '#39'L'#39' then cast(origem||trim(to_ch' +
        'ar(EXTRACT(DOY FROM data),'#39'0000'#39'))||trim(to_char(nrorigem,'#39'0000'#39 +
        ')) as varchar)'
      
        '                 else                    cast(origem||nrorigem  ' +
        'as varchar) end as num_lcto,'
      '       case when pl.tipo = '#39'A'#39' then'
      
        '         cast(pl.classificacao||trim(to_char(pl.codigo,'#39'000000'#39')' +
        ') as varchar(28))'
      '       else'
      '         cast(pl.classificacao as varchar(28))'
      '       end as cod_cta,'
      '       valor as vl_dc,'
      '       cast('#39'C'#39' as char(1)) as ind_dc,'
      '       /*'
      
        '       case when origem = '#39'B'#39' then cast(substring(nrorigem, 3 + ' +
        'length(extract(doy from data)), length(nrorigem)-2-length(extrac' +
        't(doy from data))-7 )||'#39' '#39'||'
      
        '                                        to_char(data, '#39'DDMMYY'#39') ' +
        'as char(12))'
      
        '            when origem = '#39'E'#39' then cast('#39'NF '#39' || (select np.nume' +
        'ro from notaspag np where np.codigo = nrorigem)  as char(12))'
      
        '            when origem = '#39'D'#39' then cast((select trim(dp.compleme' +
        'nto) from documentospag dp where dp.numero = nrorigem) as char(1' +
        '2))'
      
        '            when origem = '#39'M'#39' then cast('#39'MAN '#39' || nrlancto as ch' +
        'ar(12))'
      
        '            when origem = '#39'P'#39' then cast('#39'PG '#39'||(select trim(dp.c' +
        'omplemento) from documentospag dp where dp.numero = nrorigem/100' +
        '0)||'#39' '#39'||nrorigem%1000 as char(12))'
      
        '            when origem = '#39'R'#39' then cast('#39'PG '#39' || nrorigem/100||'#39 +
        ' '#39'||nrorigem%100 as varchar(12))'
      
        '            when origem = '#39'S'#39' then cast((select n.numero from no' +
        'tas n where n.dadofiscal = nrorigem) as char(12))'
      
        '            when origem = '#39'L'#39' then cast('#39'LOTE '#39' || nrorigem as c' +
        'har(12))'
      
        '            when origem = '#39'X'#39' then cast('#39'LOTE-x '#39' || nrorigem as' +
        ' char(12))'
      
        '            when origem = '#39'I'#39' then cast('#39'IMP '#39' || nrorigem as ch' +
        'ar(12))'
      
        '            when origem IN ('#39'V'#39', '#39'H'#39', '#39'T'#39', '#39'A'#39', '#39'O'#39', '#39'G'#39') then c' +
        'ast('#39'CT '#39' || (NrOrigem / 100000000) as varchar(12))'
      '       end */ cast(null as varchar(12)) as num_arq,'
      ''
      '       historico as cod_hist_pad,'
      
        '       cast(RetiraBrancoePipeeASCII255(coalesce(complemento,'#39'.'#39')' +
        ') as char(254))  as hist'
      ''
      'from lancamentos join planocontas pl on creditar = pl.codigo'
      'where filial = :filial'
      '  and data between :datainicial and :datafinal'
      ' and creditar is not null'
      ''
      ')')
    RequestLive = False
    Left = 144
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end>
    object qryRegistroI250num_lcto: TStringField
      FieldName = 'num_lcto'
      Size = 50
    end
    object qryRegistroI250cod_cta: TStringField
      FieldName = 'cod_cta'
      Size = 28
    end
    object qryRegistroI250vl_dc: TFloatField
      DisplayWidth = 19
      FieldName = 'vl_dc'
      DisplayFormat = '###,###,###,##0.00'
      Precision = 2
    end
    object qryRegistroI250ind_dc: TStringField
      FieldName = 'ind_dc'
      Size = 1
    end
    object qryRegistroI250num_arq: TStringField
      FieldName = 'num_arq'
      Size = 50
    end
    object qryRegistroI250cod_hist_pad: TIntegerField
      FieldName = 'cod_hist_pad'
      DisplayFormat = '0'
    end
    object qryRegistroI250hist: TStringField
      FieldName = 'hist'
      Size = 254
    end
  end
  object dsrRegistroI200: TtecDataSource
    DataSet = qryRegistroI200
    Left = 120
    Top = 304
  end
  object qryRegistro0930: TtecQuery
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
      'select s.*,'
      '       q.descricao as descricaoqualificacao'
      'from signatarios s'
      '     join qualificacao q'
      '     on s.qualificacao = q.codigo')
    RequestLive = False
    Left = 400
    Top = 24
    object qryRegistro0930cpf: TStringField
      FieldName = 'cpf'
      Size = 11
    end
    object qryRegistro0930nome: TStringField
      FieldName = 'nome'
      Size = 70
    end
    object qryRegistro0930qualificacao: TStringField
      FieldName = 'qualificacao'
      Size = 3
    end
    object qryRegistro0930crc: TStringField
      FieldName = 'crc'
      Size = 11
    end
    object qryRegistro0930descricaoqualificacao: TStringField
      FieldName = 'descricaoqualificacao'
      Size = 70
    end
    object qryRegistro0930fone: TStringField
      FieldName = 'fone'
    end
    object qryRegistro0930email: TStringField
      FieldName = 'email'
      Size = 128
    end
    object qryRegistro0930uf_crc: TStringField
      FieldName = 'uf_crc'
      Size = 2
    end
    object qryRegistro0930data_crc: TDateField
      Alignment = taCenter
      FieldName = 'data_crc'
      EditMask = '99/99/9999;1; '
    end
    object qryRegistro0930num_seq_crc: TStringField
      FieldName = 'num_seq_crc'
      Size = 16
    end
  end
  object qryRegistroI350: TtecQuery
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
      'select distinct data'
      'from lancamentos'
      'where filial = :filial'
      '  and data between :datainicial and :datafinal'
      ' and origem='#39'X'#39
      'order by data')
    RequestLive = False
    Left = 56
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end>
    object qryRegistroI350data: TDateField
      FieldName = 'data'
    end
  end
  object dsrRegistroI350: TtecDataSource
    DataSet = qryRegistroI350
    Left = 120
    Top = 416
  end
  object qryRegistroI355: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkFields = 'data=data'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrRegistroI350
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      ';'
      'select Data,'
      '       case when pl.tipo = '#39'A'#39' then'
      
        '         cast(pl.classificacao||trim(to_char(pl.codigo,'#39'000000'#39')' +
        ') as varchar(28))'
      '       else'
      '         cast(pl.classificacao as varchar(28))'
      '       end as cod_cta,'
      ''
      
        '       case when (SaldoContabil - valorencerramento)  >=0 then c' +
        'ast('#39'D'#39' as char(1))'
      '                                   else cast('#39'C'#39' as char(1))'
      '       end as ind_dc,'
      '       abs((SaldoContabil - valorencerramento)) as vl_cta'
      'from'
      '('
      'select Data,'
      '       Conta,'
      
        '       SaldoContabil(Conta, :Filial, Data, CAST(SUBSTRING(Data F' +
        'ROM 1 FOR 4) AS INTEGER)) AS SaldoContabil,'
      '       valorencerramento as valorencerramento'
      'from'
      '('
      ' select Data, Conta,'
      
        '        sum(valorencerramentodebitos-valorencerramentocreditos) ' +
        'as valorencerramento'
      ' from'
      ' ('
      ''
      ''
      '  select Data,'
      '         debitar as Conta,'
      '         sum(valor) as valorencerramentodebitos,'
      '         0.00 as valorencerramentocreditos'
      '  from lancamentos'
      '  where Filial = :Filial'
      '    and Data between :Datainicial and :Datafinal'
      '    and origem='#39'X'#39
      '    and debitar is not null'
      '  group by Data, debitar'
      ''
      ''
      ''
      '   union all'
      ''
      ''
      '   select Data,'
      '          creditar as Conta,'
      '          0.00 as valorencerramentodebitos,'
      '          sum(valor) as valorencerramentocreditos'
      '   from lancamentos'
      '   where Filial = :Filial'
      '     and Data between :Datainicial and :Datafinal'
      '     and origem='#39'X'#39
      '     and creditar is not null'
      '   group by Data, creditar'
      ' ) as selecao'
      '  group by Data, Conta'
      ''
      ')  as selecao'
      ') as selecao join planoContas pl on selecao.Conta = pl.codigo'
      'where abs((SaldoContabil - valorencerramento))<>0'
      '  and pl.natureza in ('#39'R'#39','#39'D'#39')'
      'order by Data, pl.classificacao, pl.codigo')
    RequestLive = False
    Left = 168
    Top = 440
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end>
    object qryRegistroI355data: TDateField
      Alignment = taCenter
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object qryRegistroI355vl_cta: TFloatField
      DisplayWidth = 19
      FieldName = 'vl_cta'
      DisplayFormat = '###,###,###,##0.00'
      Precision = 2
    end
    object qryRegistroI355cod_cta: TStringField
      FieldName = 'cod_cta'
      Size = 28
    end
    object qryRegistroI355ind_dc: TStringField
      FieldName = 'ind_dc'
      Size = 1
    end
  end
  object qryRegistroJ100: TtecQuery
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
      'select Saldos.cod_agl,'
      '       Saldos.nivel_agl,'
      '       Saldos.ind_grp_bal,'
      '       Saldos.descr_cod_agl,'
      '       abs(Saldos.SaldoContabil) as vl_cta,'
      ''
      '       case when Saldos.SaldoContabil >= 0 then'
      '         cast('#39'D'#39' as char(1))'
      '       else'
      '         cast('#39'C'#39' as char(1)) end as ind_dc_bal,'
      ''
      '       abs(Saldos.SaldoAnterior) as vl_cta_ini,'
      ''
      '       case when Saldos.SaldoAnterior >= 0 then'
      '         cast('#39'D'#39' as char(1))'
      '       else'
      '         cast('#39'C'#39' as char(1)) end as ind_dc_bal_ini'
      ''
      ''
      'from'
      '  ('
      '      select case when pc.tipo = '#39'A'#39' then'
      
        '               cast(pc.classificacao||trim(to_char(pc.Codigo,'#39'00' +
        '0000'#39')) as varchar(28))'
      '             else'
      '               cast(pc.classificacao as varchar(28))'
      '             end as cod_agl,'
      ''
      
        '             length(trim(pc.classificacao)) - length(trim(replac' +
        'e(pc.classificacao,'#39'.'#39','#39#39')))+1 as nivel_agl,'
      ''
      
        '             case when pc.natureza = '#39'A'#39' then cast('#39'1'#39' as char(1' +
        '))'
      '             else cast('#39'2'#39' as char(1)) end as ind_grp_bal,'
      ''
      '             pc.descricao as descr_cod_agl,'
      ''
      
        '             SaldoContabil(pc.Codigo, sc.Filial, :DataFinal, CAS' +
        'T(SUBSTRING(:DataFinal FROM 1 FOR 4) AS INTEGER)) AS SaldoContab' +
        'il,'
      '             sc.saldoanterior'
      ''
      '      from planoContas pc'
      '           join SaldosContabeis sc'
      '                 join filiais f'
      '                 on sc.Filial = f.Codigo'
      '           on pc.Codigo = sc.Conta'
      ''
      
        '      where (Contacommovto(pc.Codigo, :Filial, cast(:Datainicial' +
        ' as date), cast(:DataFinal as date)) or sc.Saldoanterior<>0)'
      '        and sc.exercicio = :exercicio'
      '        and sc.Filial = :Filial'
      '        and pc.demosped'
      '        and pc.natureza in ('#39'A'#39','#39'P'#39','#39'L'#39')'
      ''
      '   ) as Saldos'
      '   where abs(SaldoContabil)<>0'
      '   order by cod_agl')
    RequestLive = False
    Left = 256
    Top = 504
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'exercicio'
        ParamType = ptUnknown
      end>
    object qryRegistroJ100cod_agl: TStringField
      FieldName = 'cod_agl'
      Size = 28
    end
    object qryRegistroJ100nivel_agl: TIntegerField
      FieldName = 'nivel_agl'
      DisplayFormat = '0'
    end
    object qryRegistroJ100ind_grp_bal: TStringField
      FieldName = 'ind_grp_bal'
      Size = 1
    end
    object qryRegistroJ100vl_cta: TFloatField
      FieldName = 'vl_cta'
      DisplayFormat = '0.00'
    end
    object qryRegistroJ100ind_dc_bal: TStringField
      FieldName = 'ind_dc_bal'
      Size = 1
    end
    object qryRegistroJ100descr_cod_agl: TStringField
      FieldName = 'descr_cod_agl'
      Size = 50
    end
    object qryRegistroJ100vl_cta_ini: TFloatField
      FieldName = 'vl_cta_ini'
    end
    object qryRegistroJ100ind_dc_bal_ini: TStringField
      FieldName = 'ind_dc_bal_ini'
      Size = 1
    end
  end
  object qryRegistroJ052: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnFilterRecord = qryRegistroJ052FilterRecord
    Filtered = True
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select case when pl.tipo = '#39'A'#39' then'
      
        '         cast(pl.classificacao||trim(to_char(pl.codigo,'#39'000000'#39')' +
        ') as varchar(28))'
      '       else'
      '         cast(pl.classificacao as varchar(28))'
      '       end as cod_agl'
      
        'from planocontas pl join saldoscontabeis sc on pl.codigo = sc.co' +
        'nta'
      
        'where (contacommovto(pl.codigo, :filial, cast(:datainicial as da' +
        'te), cast(:datafinal as date)) or sc.saldoanterior<>0)'
      '  and sc.filial = :filial'
      '  and sc.exercicio = :exercicio'
      '  and demosped'
      'order by pl.classificacao, pl.codigo')
    RequestLive = False
    Left = 416
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end>
    object qryRegistroJ052cod_agl: TStringField
      FieldName = 'cod_agl'
      Size = 28
    end
  end
  object qryRegistroJ150: TtecQuery
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
      'select Saldos.cod_agl,'
      '       Saldos.nivel_agl,'
      '       Saldos.descr_cod_agl,'
      
        '       abs(SaldoContabil - (valordebitosencerramento - valorcred' +
        'itosencerramento)) as vl_cta,'
      ''
      '       /*'
      
        '       cast(case when Saldos.ind_vl in ('#39'R'#39','#39'D'#39') then Saldos.ind' +
        '_vl'
      
        '                 when (SaldoContabil - (valordebitosencerramento' +
        ' - valorcreditosencerramento)) > 0 then '#39'P'#39
      '                 else '#39'N'#39
      '       end as char(1)) as ind_vl'
      '       */'
      ''
      
        '       cast(case when (SaldoContabil - (valordebitosencerramento' +
        ' - valorcreditosencerramento)) > 0 then  case when Saldos.tipo =' +
        ' '#39'A'#39' then '#39'D'#39' else '#39'N'#39' end'
      
        '                 else case when Saldos.tipo = '#39'A'#39' then '#39'R'#39' else ' +
        #39'P'#39' end'
      '       end as char(1)) as ind_vl'
      ''
      'from'
      '  ('
      '      select case when pc.tipo = '#39'A'#39' then'
      
        '               cast(pc.classificacao||trim(to_char(pc.codigo,'#39'00' +
        '0000'#39')) as varchar(28))'
      '             else'
      '               cast(pc.classificacao as varchar(28))'
      '             end as cod_agl,'
      '             pc.tipo,'
      ''
      
        '             length(trim(pc.classificacao)) - length(trim(replac' +
        'e(pc.classificacao,'#39'.'#39','#39#39')))+1 as nivel_agl,'
      ''
      '             pc.descricao as descr_cod_agl,'
      ''
      '             pc.natureza as ind_vl,'
      ''
      
        '             SaldoContabil(pc.codigo, sc.Filial, :DataFinal, CAS' +
        'T(SUBSTRING(:DataFinal FROM 1 FOR 4) AS INTEGER)) AS SaldoContab' +
        'il,'
      ''
      '             case when pc.tipo='#39'S'#39' then'
      '               coalesce((select sum(l.valor)'
      
        '                         from lancamentos l join planoContas pl ' +
        'on l.debitar = pl.codigo'
      
        '                         where l.Data between :Datainicial and :' +
        'DataFinal'
      '                           and l.origem = '#39'X'#39
      '                           and l.Filial = :Filial'
      
        '                           and position(pc.classificacao in pl.c' +
        'lassificacao)=1),0)'
      '             else'
      '               coalesce((select sum(l.valor)'
      
        '                         from lancamentos l join planoContas pl ' +
        'on l.debitar = pl.codigo'
      
        '                         where l.Data between :Datainicial and :' +
        'DataFinal'
      '                           and l.origem = '#39'X'#39
      '                           and l.Filial = :Filial'
      '                           and position('
      
        '                                cast(pc.classificacao||trim(to_c' +
        'har(pc.codigo,'#39'000000'#39')) as varchar(28)) in'
      
        '                                cast(pl.classificacao||trim(to_c' +
        'har(pl.codigo,'#39'000000'#39')) as varchar(28)))=1),0)'
      '             end as valordebitosencerramento,'
      ''
      ''
      '             case when pc.tipo='#39'S'#39' then'
      '               coalesce((select sum(l.valor)'
      
        '                         from lancamentos l join planoContas pl ' +
        'on l.creditar = pl.codigo'
      
        '                         where l.Data between :Datainicial and :' +
        'DataFinal'
      '                          and l.origem = '#39'X'#39
      '                          and l.Filial = :Filial'
      
        '                          and position(trim(pc.classificacao) in' +
        ' trim(pl.classificacao))=1),0)'
      '             else'
      '               coalesce((select sum(l.valor)'
      
        '                         from lancamentos l join planoContas pl ' +
        'on l.creditar = pl.codigo'
      
        '                         where l.Data between :Datainicial and :' +
        'DataFinal'
      '                           and l.origem = '#39'X'#39
      '                           and l.Filial = :Filial'
      '                           and position('
      
        '                                cast(pc.classificacao||trim(to_c' +
        'har(pc.codigo,'#39'000000'#39')) as varchar(28)) in'
      
        '                                cast(pl.classificacao||trim(to_c' +
        'har(pl.codigo,'#39'000000'#39')) as varchar(28)))=1),0)'
      '             end as valorcreditosencerramento'
      ''
      '      from planoContas pc'
      '           join SaldosContabeis sc'
      '                 join filiais f'
      '                 on sc.Filial = f.codigo'
      '           on pc.codigo = sc.Conta'
      ''
      
        '      where (Contacommovto(pc.codigo, :Filial, cast(:Datainicial' +
        ' as date), cast(:DataFinal as date)) or sc.Saldoanterior<>0)'
      '        and sc.exercicio = :exercicio'
      '        and sc.Filial = :Filial'
      '        and pc.demosped'
      '        and pc.natureza in ('#39'D'#39','#39'R'#39')'
      ''
      ''
      '   ) as Saldos'
      
        '   where abs(SaldoContabil - (valordebitosencerramento - valorcr' +
        'editosencerramento))<>0'
      '   order by cod_agl')
    RequestLive = False
    Left = 272
    Top = 560
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'exercicio'
        ParamType = ptUnknown
      end>
    object qryRegistroJ150cod_agl: TStringField
      FieldName = 'cod_agl'
      Size = 28
    end
    object qryRegistroJ150nivel_agl: TIntegerField
      FieldName = 'nivel_agl'
      DisplayFormat = '0'
    end
    object qryRegistroJ150vl_cta: TFloatField
      FieldName = 'vl_cta'
      DisplayFormat = '0.00'
    end
    object qryRegistroJ150ind_vl: TStringField
      FieldName = 'ind_vl'
      Size = 1
    end
    object qryRegistroJ150descr_cod_agl: TStringField
      FieldName = 'descr_cod_agl'
      Size = 50
    end
  end
  object qryFiliaisConsolidacao: TtecQuery
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
      'select f.cnpj,'
      '       f.estado,'
      '       f.inscricaoestadual,'
      '      (select c.codigoibge'
      '       from cidades c'
      '       where c.estado = f.estado'
      '         and c.codigo = f.cidade) as cidadeIBGE,'
      '       f.inscricaomunicipal,'
      '       f.junta'
      'from filiais  f'
      'where (f.filialconsolidadoradime = :filialconsolidadoradime or'
      '       f.codigo  in (select distinct filialconsolidadoradime'
      '                     from filiais'
      '                     where filialconsolidadoradime = :filial))'
      'order by f.codigo')
    RequestLive = False
    Left = 320
    Top = 632
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filialconsolidadoradime'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end>
    object qryFiliaisConsolidacaocnpj: TStringField
      FieldName = 'cnpj'
      Size = 14
    end
    object qryFiliaisConsolidacaoestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object qryFiliaisConsolidacaoinscricaoestadual: TStringField
      FieldName = 'inscricaoestadual'
    end
    object qryFiliaisConsolidacaocidadeibge: TIntegerField
      FieldName = 'cidadeibge'
    end
    object qryFiliaisConsolidacaoinscricaomunicipal: TStringField
      FieldName = 'inscricaomunicipal'
    end
    object qryFiliaisConsolidacaojunta: TStringField
      FieldName = 'junta'
    end
  end
  object qryIntervaloDatas: TtecQuery
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
      
        'select cast('#39'01/'#39'||to_char(min(data),'#39'mm/yyyy'#39') as date) as data' +
        'inicial,'
      '       last_day_of_month(max(data)) as datafinal'
      'from lancamentos'
      'where filial=:filial'
      '  and exercicio=:exercicio;')
    RequestLive = False
    Left = 264
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end>
    object qryIntervaloDatasdatainicial: TDateField
      Alignment = taCenter
      FieldName = 'datainicial'
      EditMask = '99/99/9999;1; '
    end
    object qryIntervaloDatasdatafinal: TDateField
      Alignment = taCenter
      FieldName = 'datafinal'
      EditMask = '99/99/9999;1; '
    end
  end
  object ACBrSPEDECF: TACBrSPEDECF
    Path = 'C:\Borland\Delphi7\Bin\'
    Delimitador = '|'
    ReplaceDelimitador = False
    TrimString = True
    CurMascara = '#0.00'
    Left = 280
    Top = 96
  end
  object dsrRegistro0930: TtecDataSource
    DataSet = qryRegistro0930
    Left = 428
    Top = 40
  end
  object qryL030: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnCalcFields = qryL030CalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select * from periodoapuracao(:exercicio, :filial)'
      ''
      '')
    RequestLive = False
    Left = 384
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end>
    object qryL030seq: TStringField
      FieldName = 'seq'
      Size = 4
    end
    object qryL030DescricaoSeq: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescricaoSeq'
      Calculated = True
    end
    object qryL030datainicial: TDateTimeField
      FieldName = 'datainicial'
    end
    object qryL030datafinal: TDateField
      Alignment = taCenter
      FieldName = 'datafinal'
      EditMask = '99/99/9999;1; '
    end
    object qryL030mes: TIntegerField
      FieldName = 'mes'
      DisplayFormat = '0'
    end
    object qryL030datainicialmes: TDateField
      FieldName = 'datainicialmes'
    end
  end
  object dsrL030: TtecDataSource
    DataSet = qryL030
    Left = 416
    Top = 328
  end
  object qryecf_td_l210: TtecQuery
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
      'select * '
      'from ecf_td_l210'
      'where exercicio = :exercicio'
      'order by ordem')
    RequestLive = True
    Left = 384
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end>
    object qryecf_td_l210codigo: TIntegerField
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
    object qryecf_td_l210exercicio: TIntegerField
      FieldName = 'exercicio'
      Required = True
    end
    object qryecf_td_l210descricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object qryecf_td_l210dt_ini: TDateField
      Alignment = taCenter
      FieldName = 'dt_ini'
      EditMask = '99/99/9999;1; '
    end
    object qryecf_td_l210dt_fim: TDateField
      Alignment = taCenter
      FieldName = 'dt_fim'
      EditMask = '99/99/9999;1; '
    end
    object qryecf_td_l210ordem: TIntegerField
      FieldName = 'ordem'
      DisplayFormat = '0'
    end
    object qryecf_td_l210tipo: TStringField
      FieldName = 'tipo'
      Size = 10
    end
    object qryecf_td_l210formato: TStringField
      FieldName = 'formato'
      Size = 10
    end
    object qryecf_td_l210linha_ecf: TIntegerField
      FieldName = 'linha_ecf'
      DisplayFormat = '0'
    end
    object qryecf_td_l210formula: TStringField
      FieldName = 'formula'
      Size = 50
    end
    object qryecf_td_l210ListaContasContabeis: TStringField
      FieldName = 'ListaContasContabeis'
      Size = 200
    end
    object qryecf_td_l210listaposicaosaldocontascontabeis: TStringField
      FieldName = 'listaposicaosaldocontascontabeis'
      Size = 100
    end
  end
  object qryecf_l210: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 'seq=sequencial030'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrL030
    Constraints = <>
    BeforeOpen = qryecf_l210BeforeOpen
    AfterPost = qryecf_l210AfterPost
    AfterScroll = qryecf_l210AfterScroll
    OnCalcFields = qryecf_l210CalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select ecf_l210.*,'
      '       ecf_td_l210.descricao,'
      '       ecf_td_l210.ORDEM,'
      '       ecf_td_l210.TIPO,'
      '       ecf_td_l210.FORMULA'
      ''
      'from ecf_l210'
      '    join ecf_td_l210'
      '    on ecf_td_l210.codigo = ecf_l210.codigo_td_l210'
      '    and ecf_td_l210.exercicio = ecf_l210.exercicio'
      ''
      'where ecf_l210.exercicio = :exercicio'
      '  and ecf_l210.filial = :filial'
      'order by ecf_td_l210.ORDEM')
    RequestLive = True
    Left = 368
    Top = 432
    ParamData = <
      item
        DataType = ftString
        Name = 'exercicio'
        ParamType = ptUnknown
        Value = '2014'
      end
      item
        DataType = ftString
        Name = 'filial'
        ParamType = ptUnknown
        Value = '2'
      end>
    object qryecf_l210exercicio: TIntegerField
      FieldName = 'exercicio'
    end
    object qryecf_l210filial: TIntegerField
      FieldName = 'filial'
      Required = True
      DisplayFormat = '0'
    end
    object qryecf_l210codigo_td_l210: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo_td_l210'
      Required = True
      DisplayFormat = '0'
    end
    object qryecf_l210sequencial030: TStringField
      FieldName = 'sequencial030'
      Required = True
      Size = 4
    end
    object qryecf_l210listacontascontabeis: TStringField
      FieldName = 'listacontascontabeis'
      Size = 200
    end
    object qryecf_l210valor: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 19
      FieldName = 'valor'
      DisplayFormat = '###,###,###,##0.00'
      Precision = 2
    end
    object qryecf_l210descricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 100
    end
    object qryecf_l210ordem: TIntegerField
      FieldName = 'ordem'
      DisplayFormat = '0'
    end
    object qryecf_l210tipo: TStringField
      FieldName = 'tipo'
      Size = 10
    end
    object qryecf_l210formula: TStringField
      FieldName = 'formula'
      Size = 50
    end
    object qryecf_l210PossuiListaContasContabeis: TStringField
      FieldKind = fkCalculated
      FieldName = 'PossuiListaContasContabeis'
      Size = 1
      Calculated = True
    end
    object qryecf_l210listaposicaosaldocontascontabeis: TStringField
      FieldName = 'listaposicaosaldocontascontabeis'
      Size = 100
    end
  end
  object dsrecf_l210: TtecDataSource
    DataSet = qryecf_l210
    Left = 400
    Top = 448
  end
  object qryPlanoContas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforePost = qryPlanoContasBeforePost
    OnNewRecord = qryPlanoContasNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'ListaPlanoContas_s'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'listaposicaosaldocontascontabeis_s'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ListaPlanoContas'
        ParamType = ptUnknown
        Value = '1,2'
      end>
    Sql.Strings = (
      ';'
      'select pc.codigo, pc.descricao,'
      '       case when pc.tipo = '#39'A'#39' then'
      
        '         cast(pc.classificacao||trim(to_char(pc.codigo,'#39'000000'#39')' +
        ') as varchar(28))'
      '       else'
      '         cast(pc.classificacao as varchar(28))'
      '       end as cod_cta,'
      '       cast(posicao.alfa as varchar(1)) as posicaoSaldo,'
      '       cast(posicao.alfa as varchar(1)) as posicaoSaldoAux'
      '       '
      
        'from (select * from lista_int_p(cast(string_to_array(%ListaPlano' +
        'Contas_s,'#39','#39') as integer[]))) as contas'
      
        'join (select * from lista_alfa_p(string_to_array(%listaposicaosa' +
        'ldocontascontabeis_s,'#39','#39'))) as posicao on contas.posicao = posic' +
        'ao.posicao'
      'join planocontas pc on pc.codigo = contas.inteiro'
      ''
      'where pc.codigo in (%ListaPlanoContas)'
      '')
    RequestLive = True
    Left = 712
    Top = 184
    object qryPlanoContascodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Required = True
    end
    object qryPlanoContasdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o do Plano de Contas'
      FieldName = 'descricao'
      Required = True
      Size = 50
    end
    object qryPlanoContascod_cta: TStringField
      FieldName = 'cod_cta'
      Size = 28
    end
    object qryPlanoContasposicaosaldo: TStringField
      DisplayLabel = 'P'
      FieldName = 'posicaosaldo'
      Size = 1
    end
    object qryPlanoContasposicaosaldoaux: TStringField
      FieldName = 'posicaosaldoaux'
      Size = 1
    end
  end
  object dsrPlanoContas: TtecDataSource
    DataSet = qryPlanoContas
    Left = 744
    Top = 200
  end
  object qrySaldoContabil: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'ListaContaContabil'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftUnknown
        Name = 'listaposicaosaldocontascontabeis'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';'
      
        'select abs(sum(SaldoContabil(sel.codigo, :filial, case when sel.' +
        'alfa='#39'I'#39' then cast(:datainicial as date)-1 else :datafinal end, ' +
        ':exercicio, false))) as Saldo'
      'from'
      '('
      
        '        select pc.codigo, posicao.alfa from (select * from lista' +
        '_int_p(cast(string_to_array(coalesce(%ListaContaContabil,'#39'0'#39'),'#39',' +
        #39') as integer[]))) as contas'
      
        '        join (select * from lista_alfa_p(string_to_array(coalesc' +
        'e(%listaposicaosaldocontascontabeis,'#39#39'),'#39','#39'))) as posicao on con' +
        'tas.posicao = posicao.posicao'
      '        join planocontas pc on pc.codigo = contas.inteiro'
      ')'
      'as sel'
      '')
    RequestLive = False
    Left = 744
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'exercicio'
        ParamType = ptUnknown
      end>
    object qrySaldoContabilsaldo: TFloatField
      FieldName = 'saldo'
    end
  end
  object qryecf_l300: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 'seq=seq'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrL030
    Constraints = <>
    BeforeOpen = qryecf_l300BeforeOpen
    AfterPost = qryecf_l300AfterPost
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      ';'
      
        'SELECT Classificacao, Tipo, Descricao, Seq, Mes, ABS(Valor) AS V' +
        'alor,'
      '       CAST(CASE WHEN Valor > 0'
      '                 THEN '#39'D'#39
      '                 ELSE '#39'C'#39
      '            END AS CHAR) AS D_C'
      ''
      'FROM'
      '     ('
      '      SELECT pr.Classificacao, pr.Tipo, pr.Descricao,'
      '             Meses.Seq, Meses.Mes,'
      ''
      '             /*'
      '            SUM(CASE WHEN SUBSTR(Meses.Seq, 1, 1) = '#39'T'#39
      
        '                     THEN COALESCE(sr.Debitos [3*(Meses.Mes-1)+1' +
        '],0) +'
      
        '                          COALESCE(sr.Debitos [3*(Meses.Mes-1)+2' +
        '],0) +'
      
        '                          COALESCE(sr.Debitos [3*(Meses.Mes-1)+3' +
        '],0)'
      ''
      '                     ELSE COALESCE(sr.Debitos [Meses.Mes],0)'
      '                END -'
      ''
      '                CASE WHEN SUBSTR(Meses.Seq, 1, 1) = '#39'T'#39
      
        '                     THEN COALESCE(sr.Creditos [3*(Meses.Mes-1)+' +
        '1],0) +'
      
        '                          COALESCE(sr.Creditos [3*(Meses.Mes-1)+' +
        '2],0) +'
      
        '                          COALESCE(sr.Creditos [3*(Meses.Mes-1)+' +
        '3],0)'
      '                     ELSE COALESCE(sr.Creditos [Meses.Mes],0)'
      '                END) AS Valor'
      '                */'
      ''
      
        '            SaldoReferencial(sr.conta, cast(:filial as integer),' +
        ' Meses.datafinal, cast(:Exercicio as integer)) as Valor'
      ''
      '      FROM (SaldosContasReferenciais sr'
      '            JOIN PlanoReferencial pr ON sr.Conta = pr.Codigo),'
      
        '           (SELECT * FROM PeriodoApuracao(:Exercicio,2)) AS Mese' +
        's'
      ''
      '      WHERE sr.Exercicio = :Exercicio'
      
        '        AND POSITION(CAST('#39'3'#39' AS VARCHAR) IN CAST(pr.Classificac' +
        'ao AS VARCHAR)) = 1'
      '        AND sr.Filial IN ((SELECT CAST(:Filial AS INTEGER))'
      '                           UNION (SELECT f.Codigo'
      '                                     FROM Filiais f'
      
        '                                     WHERE f.FilialConsolidadora' +
        'dime = :Filial))'
      
        '        AND pr.TipoPlano = CAST(Parametros_Valor('#39'Tipos Planos R' +
        'eferenciais'#39', :Filial) AS INTEGER)'
      ''
      
        '/*      GROUP BY pr.Classificacao, pr.Tipo, pr.Descricao, Meses.' +
        'Seq, Meses.Mes */'
      '      ORDER BY Meses.Mes, pr.Classificacao'
      '     ) AS s1'
      '')
    RequestLive = False
    Left = 464
    Top = 432
    ParamData = <
      item
        DataType = ftString
        Name = 'filial'
        ParamType = ptUnknown
        Value = '2'
      end
      item
        DataType = ftString
        Name = 'exercicio'
        ParamType = ptUnknown
        Value = '2014'
      end>
    object qryecf_l300classificacao: TStringField
      DisplayLabel = 'Classifica'#231#227'o'
      FieldName = 'classificacao'
    end
    object qryecf_l300descricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 200
    end
    object qryecf_l300seq: TStringField
      FieldName = 'seq'
      Size = 3
    end
    object qryecf_l300mes: TIntegerField
      FieldName = 'mes'
      DisplayFormat = '0'
    end
    object qryecf_l300valor: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 19
      FieldName = 'valor'
      DisplayFormat = '###,###,###,##0.00'
      Precision = 2
    end
    object qryecf_l300tipo: TStringField
      FieldName = 'tipo'
      Size = 1
    end
    object qryecf_l300d_c: TStringField
      FieldName = 'D_C'
      Size = 1
    end
  end
  object dsrecf_l300: TtecDataSource
    DataSet = qryecf_l300
    Left = 496
    Top = 448
  end
  object qryecf_m300: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 'seq=sequenciam030'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrL030
    Constraints = <>
    AfterOpen = qryecf_m300AfterOpen
    AfterPost = qryecf_m300AfterPost
    AfterScroll = qryecf_m300AfterScroll
    OnCalcFields = qryecf_m300CalcFields
    OnNewRecord = qryecf_m300NewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select ecf_m300.*,'
      '       ecf_td_m300.descricao,'
      '       ecf_td_m300.ORDEM,'
      '       ecf_td_m300.TIPO,'
      '       ecf_td_m300.tipo_lanc,'
      '       ecf_td_m300.FORMULA'
      ''
      'from ecf_m300'
      '    join ecf_td_m300'
      '    on ecf_td_m300.codigo = ecf_m300.codigo_td_m300'
      '    and ecf_td_m300.exercicio = ecf_m300.exercicio'
      'where ecf_m300.exercicio = :exercicio'
      '  and ecf_m300.filial = :filial'
      ''
      'order by ecf_td_m300.CODIGO, ecf_td_m300.ORDEM')
    RequestLive = True
    Left = 584
    Top = 440
    ParamData = <
      item
        DataType = ftString
        Name = 'exercicio'
        ParamType = ptUnknown
        Value = '2014'
      end
      item
        DataType = ftString
        Name = 'filial'
        ParamType = ptUnknown
        Value = '2'
      end>
    object qryecf_m300exercicio: TIntegerField
      FieldName = 'exercicio'
      Required = True
    end
    object qryecf_m300filial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryecf_m300codigo_td_m300: TFloatField
      FieldName = 'codigo_td_m300'
      DisplayFormat = '###.##'
    end
    object qryecf_m300sequenciam030: TStringField
      FieldName = 'sequenciam030'
      Size = 4
    end
    object qryecf_m300listacontascontabeis: TStringField
      FieldName = 'listacontascontabeis'
      Size = 200
    end
    object qryecf_m300valor: TFloatField
      DisplayWidth = 19
      FieldName = 'valor'
      DisplayFormat = '###,###,###,##0.00'
      Precision = 2
    end
    object qryecf_m300descricao: TStringField
      FieldName = 'descricao'
      Size = 512
    end
    object qryecf_m300ordem: TIntegerField
      FieldName = 'ordem'
      DisplayFormat = '0'
    end
    object qryecf_m300tipo: TStringField
      FieldName = 'tipo'
      Size = 10
    end
    object qryecf_m300formula: TStringField
      FieldName = 'formula'
      Size = 200
    end
    object qryecf_m300PossuiListaContasContabeis: TStringField
      FieldKind = fkCalculated
      FieldName = 'PossuiListaContasContabeis'
      Size = 1
      Calculated = True
    end
    object qryecf_m300ind_relacao: TIntegerField
      FieldName = 'ind_relacao'
      DisplayFormat = '0'
    end
    object qryecf_m300tipo_lanc: TStringField
      FieldName = 'tipo_lanc'
      Size = 1
    end
    object qryecf_m300listaposicaosaldocontascontabeis: TStringField
      FieldName = 'listaposicaosaldocontascontabeis'
      Size = 100
    end
  end
  object dsrecf_m300: TtecDataSource
    DataSet = qryecf_m300
    Left = 616
    Top = 456
  end
  object qryecf_td_m300: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnCalcFields = qryecf_td_m300CalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select * '
      'from ecf_td_m300'
      'where exercicio = :exercicio'
      'order by codigo, ordem')
    RequestLive = True
    Left = 576
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end>
    object qryecf_td_m300codigo: TFloatField
      FieldName = 'codigo'
      DisplayFormat = '###,##'
    end
    object qryecf_td_m300exercicio: TIntegerField
      FieldName = 'exercicio'
    end
    object qryecf_td_m300descricao: TStringField
      FieldName = 'descricao'
      Size = 512
    end
    object qryecf_td_m300dt_ini: TDateField
      FieldName = 'dt_ini'
    end
    object qryecf_td_m300dt_fim: TDateField
      FieldName = 'dt_fim'
    end
    object qryecf_td_m300ordem: TIntegerField
      FieldName = 'ordem'
    end
    object qryecf_td_m300tipo: TStringField
      FieldName = 'tipo'
      Size = 10
    end
    object qryecf_td_m300formato: TStringField
      FieldName = 'formato'
      Size = 10
    end
    object qryecf_td_m300linha_ecf: TIntegerField
      FieldName = 'linha_ecf'
    end
    object qryecf_td_m300formula: TStringField
      FieldName = 'formula'
      Size = 200
    end
    object qryecf_td_m300tipo_lanc: TStringField
      FieldName = 'tipo_lanc'
      Size = 1
    end
    object qryecf_td_m300listacontascontabeis: TStringField
      FieldName = 'listacontascontabeis'
      Size = 200
    end
    object qryecf_td_m300codigodescricao: TStringField
      FieldKind = fkCalculated
      FieldName = 'codigodescricao'
      Size = 518
      Calculated = True
    end
    object qryecf_td_m300listaposicaosaldocontascontabeis: TStringField
      FieldName = 'listaposicaosaldocontascontabeis'
      Size = 100
    end
  end
  object qryecf_m010: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterPost = qryecf_m010AfterPost
    AfterDelete = qryecf_m010AfterDelete
    AfterScroll = qryecf_m010AfterScroll
    OnCalcFields = qryecf_m010CalcFields
    OnNewRecord = qryecf_m010NewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select m010.*'
      'from ecf_m010 m010'
      'where extract(year from m010.dt_ap_lal) >= :exercicio'
      
        '  and extract(year from coalesce(m010.dt_lim_lal,m010.dt_ap_lal)' +
        ') <= :exercicio'
      '')
    RequestLive = True
    Left = 696
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end>
    object qryecf_m010seq_ecf_m010: TIntegerField
      FieldName = 'seq_ecf_m010'
    end
    object qryecf_m010cod_cta_b: TStringField
      DisplayLabel = 'Codigo da Conta'
      FieldName = 'cod_cta_b'
      Required = True
      Size = 50
    end
    object qryecf_m010desc_cta_lal: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'desc_cta_lal'
      Required = True
      Size = 100
    end
    object qryecf_m010dt_ap_lal: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data de Cria'#231#227'o'
      FieldName = 'dt_ap_lal'
      EditMask = '99/99/9999;1; '
    end
    object qryecf_m010cod_lan_orig: TFloatField
      DisplayLabel = 'C'#243'digo do lan'#231'amento de origem da conta'
      FieldName = 'cod_lan_orig'
      DisplayFormat = '###.##'
    end
    object qryecf_m010desc_lan_orig: TStringField
      DisplayLabel = 'Descri'#231#227'o do lan'#231'amento de origem da conta'
      FieldName = 'desc_lan_orig'
      Size = 512
    end
    object qryecf_m010dt_lim_lal: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data limite para uso do saldo da conta'
      FieldName = 'dt_lim_lal'
      EditMask = '99/99/9999;1; '
    end
    object qryecf_m010cod_tributo: TStringField
      DisplayLabel = 'Tipo de Tributo'
      FieldName = 'cod_tributo'
      Size = 1
    end
    object qryecf_m010vl_saldo_ini: TFloatField
      DisplayLabel = 'Saldo Inicial'
      DisplayWidth = 19
      FieldName = 'vl_saldo_ini'
      DisplayFormat = '###,###,###,##0.00'
      Precision = 2
    end
    object qryecf_m010ind_vl_saldo_ini: TStringField
      DisplayLabel = 'D/C'
      FieldName = 'ind_vl_saldo_ini'
      Size = 1
    end
    object qryecf_m010cnpj_sit_esp: TStringField
      DisplayLabel = 'CNPJ'
      FieldName = 'cnpj_sit_esp'
      Size = 14
    end
    object qryecf_m010listacontascontabeis: TStringField
      FieldName = 'listacontascontabeis'
      Size = 200
    end
    object qryecf_m010cod_cta_b_aux: TStringField
      FieldKind = fkCalculated
      FieldName = 'cod_cta_b_aux'
      Size = 50
      Calculated = True
    end
    object qryecf_m010desc_cta_lal_aux: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_cta_lal_aux'
      Size = 100
      Calculated = True
    end
    object qryecf_m010dt_ap_lal_aux: TDateField
      FieldKind = fkCalculated
      FieldName = 'dt_ap_lal_aux'
      Calculated = True
    end
    object qryecf_m010cod_lan_orig_aux: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'cod_lan_orig_aux'
      Calculated = True
    end
    object qryecf_m010desc_lan_orig_aux: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_lan_orig_aux'
      Size = 512
      Calculated = True
    end
    object qryecf_m010dt_lim_lal_aux: TDateField
      FieldKind = fkCalculated
      FieldName = 'dt_lim_lal_aux'
      Calculated = True
    end
    object qryecf_m010cod_tributo_aux: TStringField
      FieldKind = fkCalculated
      FieldName = 'cod_tributo_aux'
      Size = 1
      Calculated = True
    end
    object qryecf_m010vl_saldo_ini_aux: TCurrencyField
      DefaultExpression = '###,###,###,##0.00'
      DisplayWidth = 19
      FieldKind = fkCalculated
      FieldName = 'vl_saldo_ini_aux'
      Precision = 2
      Calculated = True
    end
    object qryecf_m010ind_vl_saldo_ini_aux: TStringField
      FieldKind = fkCalculated
      FieldName = 'ind_vl_saldo_ini_aux'
      Size = 1
      Calculated = True
    end
    object qryecf_m010cnpj_sit_esp_aux: TStringField
      FieldKind = fkCalculated
      FieldName = 'cnpj_sit_esp_aux'
      Size = 14
      Calculated = True
    end
  end
  object dsrecf_m010: TtecDataSource
    DataSet = qryecf_m010
    Left = 728
    Top = 392
  end
  object dsrecf_td_l210: TtecDataSource
    DataSet = qryecf_td_l210
    Left = 416
    Top = 392
  end
  object dsrecf_td_m300: TtecDataSource
    DataSet = qryecf_td_m300
    Left = 608
    Top = 392
  end
  object spcecf_M010_proximocodigo: TtecQuery
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
      'select ecf_m010_proximocodigo() as codigo')
    RequestLive = False
    Left = 744
    Top = 354
    object spcecf_M010_proximocodigocodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object qryecf_m410: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 'seq=sequencial030'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrL030
    Constraints = <>
    AfterScroll = qryecf_m410AfterScroll
    OnNewRecord = qryecf_m410NewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select m410.*,'
      '       (select m010.cod_cta_b'
      '        from ecf_m010 m010'
      
        '        where m010.seq_ecf_m010 = m410.seq_ecf_m010) as cod_cta_' +
        'b,'
      ''
      '       (select m010.cod_cta_b'
      '        from ecf_m010 m010'
      
        '        where m010.seq_ecf_m010 = m410.seq_ecf_m010_ctp) as cod_' +
        'cta_b_ctp'
      ''
      'from ecf_m410 m410'
      'where m410.exercicio = :exercicio'
      '  and m410.filial = :filial'
      'order by m410.seq_ecf_m410  ')
    RequestLive = True
    Left = 696
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end>
    object qryecf_m410seq_ecf_m410: TIntegerField
      FieldName = 'seq_ecf_m410'
    end
    object qryecf_m410exercicio: TStringField
      FieldName = 'exercicio'
      Size = 4
    end
    object qryecf_m410filial: TIntegerField
      FieldName = 'filial'
    end
    object qryecf_m410sequencial030: TStringField
      FieldName = 'sequencial030'
      Size = 4
    end
    object qryecf_m410seq_ecf_m010: TIntegerField
      FieldName = 'seq_ecf_m010'
    end
    object qryecf_m410cod_cta_b: TStringField
      FieldName = 'cod_cta_b'
      Size = 50
    end
    object qryecf_m410cod_cta_b_ctp: TStringField
      FieldName = 'cod_cta_b_ctp'
      Size = 50
    end
    object qryecf_m410cod_tributo: TStringField
      FieldName = 'cod_tributo'
      Size = 1
    end
    object qryecf_m410val_lan_lalb_pb: TFloatField
      DisplayWidth = 19
      FieldName = 'val_lan_lalb_pb'
      Required = True
      DisplayFormat = '###,###,###,##0.00'
      Precision = 2
    end
    object qryecf_m410ind_val_lan_lalb_pb: TStringField
      FieldName = 'ind_val_lan_lalb_pb'
      Size = 2
    end
    object qryecf_m410seq_ecf_m010_ctp: TIntegerField
      FieldName = 'seq_ecf_m010_ctp'
    end
    object qryecf_m410hist_lan_lalb: TStringField
      FieldName = 'hist_lan_lalb'
      Required = True
      Size = 200
    end
    object qryecf_m410ind_lan_ant: TStringField
      FieldName = 'ind_lan_ant'
      Size = 1
    end
  end
  object dsrecf_m410: TtecDataSource
    DataSet = qryecf_m410
    OnDataChange = dsrecf_m410DataChange
    Left = 728
    Top = 464
  end
  object qryAcumularSaldosContasReferenciais: TtecQuery
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
      'select AcumularSaldosContasReferenciais (:exercicio)')
    RequestLive = True
    Left = 552
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end>
  end
  object qryECF_k155_: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 'seq=seq'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrL030
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      ';'
      'select seq, cod_cta,'
      '      case when vl_sld_ini >=0 then CAST('#39'D'#39' as char(1))'
      '                                   else CAST('#39'C'#39' as char(1))'
      '       end as IND_VL_SLD_INI,'
      ''
      '       abs(vl_sld_ini) as vl_sld_ini,'
      '       vl_deb,'
      '       vl_cred,'
      ''
      '       abs(vl_deb - vl_cred + vl_sld_ini) as vl_sld_fin,'
      ''
      '       case when (vl_deb - vl_cred + vl_sld_ini) >=0 then'
      '            CAST('#39'D'#39' as char(1))'
      '       else CAST('#39'C'#39' as char(1))  end as IND_VL_SLD_FIN'
      ''
      'FROM'
      '('
      ''
      
        'select seq, cod_cta, sum(vl_sld_ini) as vl_sld_ini, sum(vl_deb) ' +
        'as vl_deb, sum(vl_cred) as vl_cred'
      'from'
      ''
      '('
      ''
      '  select meses.*,'
      '       case when pl.tipo = '#39'A'#39' then'
      
        '         CAST(pl.classificacao||trim(to_char(pl.codigo,'#39'000000'#39')' +
        ') as varchar(28))'
      '       else'
      '         CAST(pl.classificacao as varchar(28))'
      '       end as cod_cta,'
      ''
      '       case when meses.mes = 1 then'
      '         sc.saldoanterior'
      '       else'
      
        '         SaldoContabil(pl.Codigo, sc.Filial, meses.datainicial -' +
        ' 1, :exercicio)'
      '       end AS vl_sld_ini,'
      ''
      '       case when substr(meses.seq, 1, 1) = '#39'T'#39' then'
      ''
      '        COALESCE(sc.debitos [3*(meses.mes-1)+1],0) +'
      '        COALESCE(sc.debitos [3*(meses.mes-1)+2],0) +'
      '        COALESCE(sc.debitos [3*(meses.mes-1)+3],0)'
      ''
      '       else'
      '        COALESCE(sc.debitos [meses.mes],0)'
      '       end as vl_deb,'
      ''
      '       case when substr(meses.seq, 1, 1) = '#39'T'#39' then'
      '         COALESCE(sc.creditos [3*(meses.mes-1)+1],0) +'
      '         COALESCE(sc.creditos [3*(meses.mes-1)+2],0) +'
      '         COALESCE(sc.creditos [3*(meses.mes-1)+3],0)'
      '       else'
      '         COALESCE(sc.creditos [meses.mes],0)'
      '       end as vl_cred'
      ''
      ''
      '  FROM'
      '   (select * from periodoapuracao(:exercicio,:filial)) as meses,'
      ''
      
        '        planocontas pl join Saldoscontabeis sc on pl.codigo = sc' +
        '.conta'
      ''
      
        '   where (contacommovto(pl.codigo, sc.filial, CAST(:Datainicial ' +
        'as date), CAST(:Datafinal as date)) or sc.Saldoanterior<>0)'
      ''
      '          and sc.filial in ((select cast(:filial as integer))'
      '                     union'
      '                    (select f.codigo'
      '                     from filiais f'
      '                     where f.filialconsolidadoradime =:filial))'
      #9#9#9#9#9' '
      '          and sc.exercicio = :exercicio'
      '          and pl.tipo='#39'A'#39
      '          and pl.natureza in ('#39'A'#39','#39'P'#39','#39'L'#39')'
      ''
      ''
      '  order by pl.classificacao, pl.codigo'
      '  '
      ') as Saldos'
      'group by seq, cod_cta'
      ''
      ') as Saldos'
      ''
      ''
      'where  (vl_sld_ini <> 0) or'
      '       (vl_deb <> 0) or'
      '       (vl_cred <> 0)'
      'order by seq, cod_cta')
    RequestLive = False
    Left = 536
    Top = 632
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Datafinal'
        ParamType = ptUnknown
      end>
    object qryECF_k155_seq: TStringField
      FieldName = 'seq'
      Size = 3
    end
    object qryECF_k155_vl_sld_ini: TFloatField
      DisplayWidth = 19
      FieldName = 'vl_sld_ini'
      DisplayFormat = '###,###,###,##0.00'
      Precision = 2
    end
    object qryECF_k155_vl_deb: TFloatField
      DisplayWidth = 19
      FieldName = 'vl_deb'
      DisplayFormat = '###,###,###,##0.00'
      Precision = 2
    end
    object qryECF_k155_vl_cred: TFloatField
      DisplayWidth = 19
      FieldName = 'vl_cred'
      DisplayFormat = '###,###,###,##0.00'
      Precision = 2
    end
    object qryECF_k155_vl_sld_fin: TFloatField
      DisplayWidth = 19
      FieldName = 'vl_sld_fin'
      DisplayFormat = '###,###,###,##0.00'
      Precision = 2
    end
    object qryECF_k155_cod_cta: TStringField
      FieldName = 'cod_cta'
      Size = 28
    end
    object qryECF_k155_ind_vl_sld_ini: TStringField
      FieldName = 'ind_vl_sld_ini'
      Size = 1
    end
    object qryECF_k155_ind_vl_sld_fin: TStringField
      FieldName = 'ind_vl_sld_fin'
      Size = 1
    end
  end
  object qryECF_k355_: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 'seq=seq'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrL030
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      ';'
      'select seq, cod_cta,'
      '       vl_sld_fin,'
      ''
      '       case when vl_sld_fin >=0 then'
      '            CAST('#39'D'#39' as char(1))'
      '       else CAST('#39'C'#39' as char(1))  end as IND_VL_SLD_FIN'
      ''
      '       /*'
      '       abs(vl_deb - vl_cred + vl_sld_ini) as vl_sld_fin,'
      ''
      '       case when (vl_deb - vl_cred + vl_sld_ini) >=0 then'
      '            CAST('#39'D'#39' as char(1))'
      '       else CAST('#39'C'#39' as char(1))  end as IND_VL_SLD_FIN'
      '       */'
      ''
      'FROM'
      '('
      
        'select seq, cod_cta, sum(vl_sld_ini) as vl_sld_ini, sum(vl_deb) ' +
        'as vl_deb, sum(vl_cred) as vl_cred'
      'from'
      ''
      '('
      ''
      '  select meses.*,'
      '       case when pl.tipo = '#39'A'#39' then'
      
        '         CAST(pl.classificacao||trim(to_char(pl.codigo,'#39'000000'#39')' +
        ') as varchar(28))'
      '       else'
      '         CAST(pl.classificacao as varchar(28))'
      '       end as cod_cta,'
      ''
      
        '       SaldoContabil(pl.Codigo, sc.Filial, meses.datafinal1, :ex' +
        'ercicio) as vl_sld_fin'
      ''
      '/*'
      '       case when meses.mes = 1 then'
      '         sc.saldoanterior'
      '       else'
      
        '         SaldoContabil(pl.Codigo, sc.Filial, meses.datainicial -' +
        ' 1, :exercicio)'
      '       end AS vl_sld_ini,'
      ''
      '       case when substr(meses.seq, 1, 1) = '#39'T'#39' then'
      ''
      '        COALESCE(sc.debitos [3*(meses.mes-1)+1],0) +'
      '        COALESCE(sc.debitos [3*(meses.mes-1)+2],0) +'
      '        COALESCE(sc.debitos [3*(meses.mes-1)+3],0)'
      ''
      '       else'
      '        COALESCE(sc.debitos [meses.mes],0)'
      '       end as vl_deb,'
      ''
      ''
      '       case when substr(meses.seq, 1, 1) = '#39'T'#39' then'
      '         COALESCE(sc.creditos [3*(meses.mes-1)+1],0) +'
      '         COALESCE(sc.creditos [3*(meses.mes-1)+2],0) +'
      '         COALESCE(sc.creditos [3*(meses.mes-1)+3],0)'
      '       else'
      '         COALESCE(sc.creditos [meses.mes],0)'
      '       end as vl_cred'
      '       */'
      ''
      ''
      '  FROM'
      '   (select * from periodoapuracao(:exercicio,:filial)) as meses,'
      ''
      
        '        planocontas pl join Saldoscontabeis sc on pl.codigo = sc' +
        '.conta'
      ''
      
        '   where (contacommovto(pl.codigo, sc.filial, CAST(:Datainicial ' +
        'as date), CAST(:Datafinal as date)) or sc.Saldoanterior<>0)'
      ''
      '          and sc.filial in ((select cast(:filial as integer))'
      '                     union'
      '                    (select f.codigo'
      '                     from filiais f'
      '                     where f.filialconsolidadoradime =:filial))'
      ''
      '          and sc.exercicio = :exercicio'
      '          and pl.tipo='#39'A'#39
      '          and pl.natureza in ('#39'R'#39')'
      ''
      ''
      '  order by pl.classificacao, pl.codigo'
      ') as Saldos'
      'group by seq, cod_cta'
      ''
      ') as Saldos'
      'where  (vl_sld_ini <> 0) or'
      '       (vl_deb <> 0) or'
      '       (vl_cred <> 0)'
      'order by seq, cod_cta')
    RequestLive = False
    Left = 696
    Top = 640
    ParamData = <
      item
        DataType = ftString
        Name = 'exercicio'
        ParamType = ptUnknown
        Value = '2014'
      end
      item
        DataType = ftString
        Name = 'filial'
        ParamType = ptUnknown
        Value = '2'
      end
      item
        DataType = ftString
        Name = 'Datainicial'
        ParamType = ptUnknown
        Value = #39'2014-01-01'#39
      end
      item
        DataType = ftString
        Name = 'Datafinal'
        ParamType = ptUnknown
        Value = #39'2014-12-31'#39
      end>
    object qryECF_k355_seq: TStringField
      FieldName = 'seq'
      Size = 3
    end
    object qryECF_k355_cod_cta: TStringField
      FieldName = 'cod_cta'
      Size = 28
    end
    object qryECF_k355_vl_sld_fin: TFloatField
      DisplayWidth = 19
      FieldName = 'vl_sld_fin'
      DisplayFormat = '###,###,###,##0.00'
      Precision = 2
    end
    object qryECF_k355_ind_vl_sld_fin: TStringField
      FieldName = 'ind_vl_sld_fin'
      Size = 1
    end
  end
  object qryAcumularSaldosContabeis: TtecQuery
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
      'SELECT AcumularSaldosContabeis (:Exercicio, :OrigemX);'
      '')
    RequestLive = False
    Left = 936
    Top = 536
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Exercicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OrigemX'
        ParamType = ptUnknown
      end>
  end
  object qryAtualizar_ecf_l210: TtecQuery
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
      '/* INCLUIR REGISTROS NA TABELA ECF_L210 */'
      
        'insert into ecf_l210 (exercicio,filial,codigo_td_l210,sequencial' +
        '030,listacontascontabeis,listaposicaosaldocontascontabeis,valor)'
      ''
      '('
      'select ecf_td_l210_e.exercicio,'
      '       ecf_td_l210_e.filial,'
      '       ecf_td_l210_e.codigo,'
      '       ecf_td_l210_e.seq,'
      '       ecf_td_l210_e.listacontascontabeis,'
      '       ecf_td_l210_e.listaposicaosaldocontascontabeis,'
      '       ecf_td_l210_e.valor'
      'from'
      '('
      'select cast(:filial as integer) as filial,'
      '       pa.seq,'
      '       pa.mes,'
      '     ecf_td_l210.*,'
      ''
      
        '     (select sum(SaldoContabil(sel.codigo, :filial, case when se' +
        'l.alfa='#39'I'#39' then pa.datainicial-1 else pa.datafinal end, :exercic' +
        'io, false))'
      '      from'
      '       ('
      
        '        select pc.codigo, posicao.alfa from (select * from lista' +
        '_int_p(cast(string_to_array(coalesce(ecf_td_l210.listacontascont' +
        'abeis,'#39'0'#39'),'#39','#39') as integer[]))) as contas'
      
        '        join (select * from lista_alfa_p(string_to_array(coalesc' +
        'e(ecf_td_l210.listaposicaosaldocontascontabeis,'#39#39'),'#39','#39'))) as pos' +
        'icao on contas.posicao = posicao.posicao'
      '        join planocontas pc on pc.codigo = contas.inteiro'
      ''
      '       ) as sel) as valor'
      ''
      'from ecf_td_l210'
      '     join ecf'
      '     on ecf_td_l210.exercicio = ecf.exercicio,'
      ''
      '    (select * from periodoapuracao(:exercicio, :filial)) as pa'
      ''
      'where ecf_td_l210.exercicio = :exercicio'
      '  and ecf.filial = :filial'
      ''
      'order by ecf_td_l210.ORDEM'
      ') as ecf_td_l210_e left join ecf_l210'
      '  on ecf_td_l210_e.exercicio = ecf_l210.exercicio'
      '  and ecf_td_l210_e.filial = ecf_l210.filial'
      '  and ecf_td_l210_e.seq = ecf_l210.sequencial030'
      '  and ecf_td_l210_e.codigo = ecf_l210.codigo_td_l210'
      'where ecf_l210.exercicio is null'
      ');'
      ''
      ''
      ''
      '/* ATUALIZAR REGISTROS (VALOR) NA TABELA ECF_L210 */'
      'update ecf_l210 set valor = ecf_td_l210_e.valor'
      'from'
      '('
      'select cast(:filial as integer) as filial,'
      '       pa.seq,'
      '       pa.mes,'
      '     ecf_td_l210.*,'
      ''
      
        '     (select sum(SaldoContabil(sel.codigo, :filial, case when se' +
        'l.alfa='#39'I'#39' then pa.datainicial-1 else pa.datafinal end, :exercic' +
        'io, false))'
      '      from'
      '       ('
      
        '        select pc.codigo, posicao.alfa from (select * from lista' +
        '_int_p(cast(string_to_array(coalesce(ecf_td_l210.listacontascont' +
        'abeis,'#39'0'#39'),'#39','#39') as integer[]))) as contas'
      
        '        join (select * from lista_alfa_p(string_to_array(coalesc' +
        'e(ecf_td_l210.listaposicaosaldocontascontabeis,'#39#39'),'#39','#39'))) as pos' +
        'icao on contas.posicao = posicao.posicao'
      '        join planocontas pc on pc.codigo = contas.inteiro'
      ''
      '       ) as sel) as valor'
      ''
      'from ecf_td_l210'
      '     join ecf'
      '     on ecf_td_l210.exercicio = ecf.exercicio,'
      ''
      '    (select * from periodoapuracao(:exercicio, :filial)) as pa'
      ''
      'where ecf_td_l210.exercicio = :exercicio'
      '  and ecf.filial = :filial'
      ''
      'order by ecf_td_l210.ORDEM'
      ') as ecf_td_l210_e'
      '  where'
      '  ecf_td_l210_e.exercicio = ecf_l210.exercicio'
      '  and ecf_td_l210_e.filial = ecf_l210.filial'
      '  and ecf_td_l210_e.seq = ecf_l210.sequencial030'
      '  and ecf_td_l210_e.codigo = ecf_l210.codigo_td_l210'
      '  and ecf_td_l210_e.valor <> ecf_l210.valor;'
      ''
      
        '/* EXCLUIR REGISTRO QUE N'#195'O EST'#195'O NA TABELA DINAMICA ECF_TD_L210' +
        ' */'
      'delete from ecf_l210'
      'where exercicio = :exercicio'
      '  and filial = :filial'
      '  and (sequencial030, codigo_td_l210) not in'
      '  ('
      '    select pa.seq,'
      '           ecf_td_l210.codigo'
      ''
      '    from ecf_td_l210'
      '         join ecf'
      '         on ecf_td_l210.exercicio = ecf.exercicio,'
      ''
      
        '        (select * from periodoapuracao(:exercicio, :filial)) as ' +
        'pa'
      '    where ecf_td_l210.exercicio = :exercicio'
      '      and ecf.filial = :filial'
      '    order by ecf_td_l210.ORDEM'
      ''
      '  );'
      ''
      ''
      '')
    RequestLive = False
    Left = 552
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end>
  end
  object qryAtualizar_ecf_M300: TtecQuery
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
      '/* INCLUIR REGISTROS NA TABELA ECF_m300 */'
      
        'insert into ecf_m300 (exercicio,filial,codigo_td_m300,sequenciaM' +
        '030,listacontascontabeis,listaposicaosaldocontascontabeis, valor' +
        ', ind_relacao)'
      '('
      'select ecf_td_m300_e.exercicio,'
      '       ecf_td_m300_e.filial,'
      '       ecf_td_m300_e.codigo,'
      '       ecf_td_m300_e.seq,'
      '       ecf_td_m300_e.listacontascontabeis,'
      '       ecf_td_m300_e.listaposicaosaldocontascontabeis,'
      '       ecf_td_m300_e.valor,'
      
        '       case when ecf_td_m300_e.listacontascontabeis is not null ' +
        'then cast(2 as integer) else cast(4 as integer) end as ind_relac' +
        'ao'
      'from'
      '('
      'select cast(:filial as integer) as filial,'
      '       pa.seq,'
      '       pa.mes,'
      '       ecf_td_m300.*,'
      ''
      
        '       (select sum(SaldoContabil(sel.codigo, :filial, case when ' +
        'sel.alfa='#39'I'#39' then pa.datainicial-1 else pa.datafinal end, :exerc' +
        'icio, false))'
      '        from'
      '         ('
      
        '          select pc.codigo, posicao.alfa from (select * from lis' +
        'ta_int_p(cast(string_to_array(coalesce(ecf_td_m300.listacontasco' +
        'ntabeis,'#39'0'#39'),'#39','#39') as integer[]))) as contas'
      
        '          join (select * from lista_alfa_p(string_to_array(coale' +
        'sce(ecf_td_m300.listaposicaosaldocontascontabeis,'#39#39'),'#39','#39'))) as p' +
        'osicao on contas.posicao = posicao.posicao'
      '          join planocontas pc on pc.codigo = contas.inteiro'
      ''
      '         ) as sel) as valor'
      ''
      'from ecf_td_m300'
      '     join ecf'
      '     on ecf_td_m300.exercicio = ecf.exercicio,'
      ''
      '    (select * from periodoapuracao(:exercicio, :filial)) as pa'
      'where ecf_td_m300.exercicio = :exercicio'
      '  and ecf.filial = :filial'
      ''
      'order by ecf_td_m300.ORDEM'
      ') as ecf_td_m300_e left join ecf_m300'
      '  on ecf_td_m300_e.exercicio = ecf_m300.exercicio'
      '  and ecf_td_m300_e.filial = ecf_m300.filial'
      '  and ecf_td_m300_e.seq = ecf_m300.sequenciam030'
      '  and ecf_td_m300_e.codigo = ecf_m300.codigo_td_m300'
      'where ecf_m300.exercicio is null'
      ');'
      ''
      '/* ATUALIZAR REGISTROS (VALOR) NA TABELA ECF_m300 */'
      'update ecf_m300 set valor = ecf_td_m300_e.valor'
      'from'
      '('
      'select cast(:filial as integer) as filial,'
      '       pa.seq,'
      '       pa.mes,'
      '       ecf_td_m300.*,'
      ''
      
        '       (select sum(SaldoContabil(sel.codigo, :filial, case when ' +
        'sel.alfa='#39'I'#39' then pa.datainicial-1 else pa.datafinal end, :exerc' +
        'icio, false))'
      '        from'
      '         ('
      
        '          select pc.codigo, posicao.alfa from (select * from lis' +
        'ta_int_p(cast(string_to_array(coalesce(ecf_td_m300.listacontasco' +
        'ntabeis,'#39'0'#39'),'#39','#39') as integer[]))) as contas'
      
        '          join (select * from lista_alfa_p(string_to_array(coale' +
        'sce(ecf_td_m300.listaposicaosaldocontascontabeis,'#39#39'),'#39','#39'))) as p' +
        'osicao on contas.posicao = posicao.posicao'
      '          join planocontas pc on pc.codigo = contas.inteiro'
      ''
      '         ) as sel) as valor'
      ''
      'from ecf_td_m300'
      '     join ecf'
      '     on ecf_td_m300.exercicio = ecf.exercicio,'
      ''
      '    (select * from periodoapuracao(:exercicio, :filial)) as pa'
      'where ecf_td_m300.exercicio = :exercicio'
      '  and ecf.filial = :filial'
      ''
      'order by ecf_td_m300.ORDEM'
      ') as ecf_td_m300_e'
      '  where'
      '  ecf_td_m300_e.exercicio = ecf_m300.exercicio'
      '  and ecf_td_m300_e.filial = ecf_m300.filial'
      '  and ecf_td_m300_e.seq = ecf_m300.sequenciam030'
      '  and ecf_td_m300_e.codigo = ecf_m300.codigo_td_m300'
      '  and ecf_td_m300_e.valor <> ecf_m300.valor;'
      ''
      
        '/* EXCLUIR REGISTRO QUE N'#195'O EST'#195'O NA TABELA DINAMICA ECF_TD_m300' +
        ' */'
      'delete from ecf_m300'
      'where exercicio = :exercicio'
      '  and filial = :filial'
      '  and (sequenciam030, codigo_td_m300) not in'
      '  ('
      '    select pa.seq,'
      '           ecf_td_m300.codigo'
      ''
      '    from ecf_td_m300'
      '         join ecf'
      '         on ecf_td_m300.exercicio = ecf.exercicio,'
      ''
      
        '        (select * from periodoapuracao(:exercicio, :filial)) as ' +
        'pa'
      '    where ecf_td_m300.exercicio = :exercicio'
      '      and ecf.filial = :filial'
      ''
      '    order by ecf_td_m300.ORDEM'
      ''
      '  );'
      ''
      ''
      '')
    RequestLive = False
    Left = 552
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end>
  end
  object qryecf_td_p300: TtecQuery
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
      'select * '
      'from ecf_td_p300'
      'where exercicio = :exercicio'
      'order by codigo, ordem')
    RequestLive = True
    Left = 984
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end>
    object qryecf_td_p300codigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryecf_td_p300exercicio: TIntegerField
      FieldName = 'exercicio'
      DisplayFormat = '0'
    end
    object qryecf_td_p300descricao: TStringField
      FieldName = 'descricao'
      Size = 200
    end
    object qryecf_td_p300dt_ini: TDateField
      Alignment = taCenter
      FieldName = 'dt_ini'
      EditMask = '99/99/9999;1; '
    end
    object qryecf_td_p300dt_fim: TDateField
      Alignment = taCenter
      FieldName = 'dt_fim'
      EditMask = '99/99/9999;1; '
    end
    object qryecf_td_p300ordem: TIntegerField
      FieldName = 'ordem'
      DisplayFormat = '0'
    end
    object qryecf_td_p300tipo: TStringField
      FieldName = 'tipo'
      Size = 10
    end
    object qryecf_td_p300formato: TStringField
      FieldName = 'formato'
      Size = 10
    end
    object qryecf_td_p300linha_ecf: TIntegerField
      FieldName = 'linha_ecf'
      DisplayFormat = '0'
    end
    object qryecf_td_p300formula: TStringField
      FieldName = 'formula'
      Size = 200
    end
    object qryecf_td_p300listacontascontabeis: TStringField
      FieldName = 'listacontascontabeis'
      Size = 200
    end
    object qryecf_td_p300listaposicaosaldocontascontabeis: TStringField
      FieldName = 'listaposicaosaldocontascontabeis'
      Size = 100
    end
  end
  object dcrecf_td_p300: TtecDataSource
    DataSet = qryecf_td_p300
    Left = 1016
    Top = 400
  end
  object qryP030: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnCalcFields = qryP030CalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select * from periodoapuracao(:exercicio, :filial)')
    RequestLive = False
    Left = 864
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end>
    object qryP030seq: TStringField
      FieldName = 'seq'
      Size = 3
    end
    object qryP030DescricaoSeq: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescricaoSeq'
      Calculated = True
    end
    object qryP030datainicial: TDateField
      FieldName = 'datainicial'
    end
    object qryP030datafinal: TDateField
      FieldName = 'datafinal'
    end
    object qryP030mes: TIntegerField
      FieldName = 'mes'
    end
  end
  object dsrP030: TtecDataSource
    DataSet = qryP030
    Left = 896
    Top = 328
  end
  object qryECF_k355: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 'seq=seq'
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      ';'
      'select seq, cod_cta,'
      '       abs(Saldos.vl_sld_fin) as vl_sld_fin,'
      ''
      '       case when Saldos.vl_sld_fin >=0 then'
      '            CAST('#39'D'#39' as char(1))'
      '       else CAST('#39'C'#39' as char(1))  end as IND_VL_SLD_FIN'
      ''
      'FROM'
      '('
      ''
      '  select meses.*,'
      '       case when pl.tipo = '#39'A'#39' then'
      
        '         CAST(pl.classificacao||trim(to_char(pl.codigo,'#39'000000'#39')' +
        ') as varchar(28))'
      '       else'
      '         CAST(pl.classificacao as varchar(28))'
      '       end as cod_cta,'
      ''
      
        '       SaldoContabil(pl.Codigo, sc.Filial, meses.datafinal, :exe' +
        'rcicio, false) as vl_sld_fin'
      ''
      ''
      '  FROM'
      '   (select * from periodoapuracao(:exercicio,:filial)) as meses,'
      ''
      
        '        planocontas pl join Saldoscontabeis sc on pl.codigo = sc' +
        '.conta'
      ''
      
        '   where (contacommovto(pl.codigo, sc.filial, CAST(:Datainicial ' +
        'as date), CAST(:Datafinal as date)) or sc.Saldoanterior<>0)'
      ''
      '          and sc.filial in ((select cast(:filial as integer))'
      '                     union'
      '                    (select f.codigo'
      '                     from filiais f'
      '                     where f.filialconsolidadoradime =:filial))'
      ''
      '          and sc.exercicio = :exercicio'
      '          and pl.tipo='#39'A'#39
      '          and pl.natureza in ('#39'R'#39')'
      ''
      '  order by pl.classificacao, pl.codigo'
      ''
      ') as Saldos'
      'order by seq, cod_cta')
    RequestLive = False
    Left = 656
    Top = 560
    ParamData = <
      item
        DataType = ftString
        Name = 'exercicio'
        ParamType = ptUnknown
        Value = '2014'
      end
      item
        DataType = ftString
        Name = 'filial'
        ParamType = ptUnknown
        Value = '2'
      end
      item
        DataType = ftString
        Name = 'Datainicial'
        ParamType = ptUnknown
        Value = #39'2014-01-01'#39
      end
      item
        DataType = ftString
        Name = 'Datafinal'
        ParamType = ptUnknown
        Value = #39'2014-12-31'#39
      end>
    object qryECF_k355seq: TStringField
      FieldName = 'seq'
      Size = 3
    end
    object qryECF_k355cod_cta: TStringField
      FieldName = 'cod_cta'
      Size = 28
    end
    object qryECF_k355vl_sld_fin: TFloatField
      FieldName = 'vl_sld_fin'
    end
    object qryECF_k355ind_vl_sld_fin: TStringField
      FieldName = 'ind_vl_sld_fin'
      Size = 1
    end
  end
  object qryECF_k155: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 'seq=seq'
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      ';'
      'select seq, cod_cta,'
      '      case when Saldos.vl_sld_ini >=0 then CAST('#39'D'#39' as char(1))'
      '                                   else CAST('#39'C'#39' as char(1))'
      '       end as IND_VL_SLD_INI,'
      ''
      '       abs(Saldos.vl_sld_ini) as vl_sld_ini,'
      '       vl_deb,'
      '       vl_cred,'
      ''
      '       case when Saldos.vl_sld_fin >=0 then'
      '            CAST('#39'D'#39' as char(1))'
      '       else CAST('#39'C'#39' as char(1))  end as IND_VL_SLD_FIN,'
      ''
      '      abs(Saldos.vl_sld_fin) as vl_sld_fin'
      ''
      ''
      ''
      'FROM'
      '('
      ''
      ''
      '  select meses.*,'
      '       case when pl.tipo = '#39'A'#39' then'
      
        '         CAST(pl.classificacao||trim(to_char(pl.codigo,'#39'000000'#39')' +
        ') as varchar(28))'
      '       else'
      '         CAST(pl.classificacao as varchar(28))'
      '       end as cod_cta,'
      ''
      
        '       SaldoContabil(pl.Codigo, sc.Filial, meses.datainicial, :e' +
        'xercicio, TRUE) as vl_sld_ini,'
      
        '       SaldoContabil(pl.Codigo, sc.Filial, meses.datafinal,   :e' +
        'xercicio, TRUE) as vl_sld_fin,'
      
        '       TotalCreditos(pl.codigo, sc.filial, meses.datainicial, me' +
        'ses.datafinal, TRUE) as vl_cred,'
      
        '       TotalDebitos(pl.codigo, sc.filial, meses.datainicial, mes' +
        'es.datafinal, TRUE) as vl_deb'
      ''
      '  FROM'
      '   (select * from periodoapuracao(:exercicio,:filial)) as meses,'
      ''
      
        '        planocontas pl join Saldoscontabeis sc on pl.codigo = sc' +
        '.conta'
      ''
      
        '   where (contacommovto(pl.codigo, sc.filial, CAST(:Datainicial ' +
        'as date), CAST(:Datafinal as date)) or sc.Saldoanterior<>0)'
      ''
      '          and sc.filial in ((select cast(:filial as integer))'
      '                     union'
      '                    (select f.codigo'
      '                     from filiais f'
      '                     where f.filialconsolidadoradime =:filial))'
      ''
      '          and sc.exercicio = :exercicio'
      '          and pl.tipo='#39'A'#39
      '          and pl.natureza in ('#39'A'#39','#39'P'#39','#39'L'#39')'
      ''
      ''
      '  order by pl.classificacao, pl.codigo'
      ''
      ''
      ') as Saldos'
      ''
      'order by seq, cod_cta')
    RequestLive = False
    Left = 536
    Top = 560
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Datafinal'
        ParamType = ptUnknown
      end>
    object qryECF_k155seq: TStringField
      FieldName = 'seq'
      Size = 3
    end
    object qryECF_k155cod_cta: TStringField
      FieldName = 'cod_cta'
      Size = 28
    end
    object qryECF_k155ind_vl_sld_ini: TStringField
      FieldName = 'ind_vl_sld_ini'
      Size = 1
    end
    object qryECF_k155vl_sld_ini: TFloatField
      FieldName = 'vl_sld_ini'
    end
    object qryECF_k155vl_deb: TFloatField
      FieldName = 'vl_deb'
    end
    object qryECF_k155vl_cred: TFloatField
      FieldName = 'vl_cred'
    end
    object qryECF_k155ind_vl_sld_fin: TStringField
      FieldName = 'ind_vl_sld_fin'
      Size = 1
    end
    object qryECF_k155vl_sld_fin: TFloatField
      FieldName = 'vl_sld_fin'
    end
  end
  object qryecf_td_p200: TtecQuery
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
      'select * '
      'from ecf_td_p200'
      'where exercicio = :exercicio'
      'order by codigo, ordem')
    RequestLive = True
    Left = 864
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end>
    object qryecf_td_p200codigo: TStringField
      FieldName = 'codigo'
      Size = 10
    end
    object qryecf_td_p200exercicio: TIntegerField
      FieldName = 'exercicio'
      DisplayFormat = '0'
    end
    object qryecf_td_p200descricao: TStringField
      FieldName = 'descricao'
      Size = 300
    end
    object qryecf_td_p200dt_ini: TDateField
      Alignment = taCenter
      FieldName = 'dt_ini'
      EditMask = '99/99/9999;1; '
    end
    object qryecf_td_p200dt_fim: TDateField
      Alignment = taCenter
      FieldName = 'dt_fim'
      EditMask = '99/99/9999;1; '
    end
    object qryecf_td_p200ordem: TIntegerField
      FieldName = 'ordem'
      DisplayFormat = '0'
    end
    object qryecf_td_p200tipo: TStringField
      FieldName = 'tipo'
      Size = 10
    end
    object qryecf_td_p200formato: TStringField
      FieldName = 'formato'
      Size = 10
    end
    object qryecf_td_p200linha_ecf: TIntegerField
      FieldName = 'linha_ecf'
      DisplayFormat = '0'
    end
    object qryecf_td_p200formula: TStringField
      FieldName = 'formula'
      Size = 300
    end
    object qryecf_td_p200listacontascontabeis: TStringField
      FieldName = 'listacontascontabeis'
      Size = 200
    end
    object qryecf_td_p200listaposicaosaldocontascontabeis: TStringField
      FieldName = 'listaposicaosaldocontascontabeis'
      Size = 100
    end
  end
  object dsrecf_td_p200: TtecDataSource
    DataSet = qryecf_td_p200
    Left = 896
    Top = 392
  end
  object qryecf_p200: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 'seq=sequenciaP030'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrP030
    Constraints = <>
    BeforeOpen = qryecf_p200BeforeOpen
    AfterScroll = qryecf_p200AfterScroll
    OnCalcFields = qryecf_p200CalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select ecf_P200.*,'
      '       ecf_td_P200.descricao,'
      '       ecf_td_P200.ORDEM,'
      '       ecf_td_p200.TIPO,'
      '       ecf_td_p200.FORMULA'
      ''
      'from ecf_p200'
      '    join ecf_td_p200'
      '    on ecf_td_p200.codigo = ecf_p200.codigo_td_p200'
      '    and ecf_td_p200.exercicio = ecf_p200.exercicio'
      ''
      'where ecf_p200.exercicio = :exercicio'
      '  and ecf_p200.filial = :filial'
      'order by ecf_td_p200.ORDEM')
    RequestLive = True
    Left = 864
    Top = 448
    ParamData = <
      item
        DataType = ftString
        Name = 'exercicio'
        ParamType = ptUnknown
        Value = '2014'
      end
      item
        DataType = ftString
        Name = 'filial'
        ParamType = ptUnknown
        Value = '2'
      end>
    object qryecf_p200exercicio: TIntegerField
      FieldName = 'exercicio'
      DisplayFormat = '0'
    end
    object qryecf_p200filial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryecf_p200codigo_td_p200: TStringField
      FieldName = 'codigo_td_p200'
      Size = 10
    end
    object qryecf_p200sequenciap030: TStringField
      FieldName = 'sequenciap030'
      Size = 4
    end
    object qryecf_p200listacontascontabeis: TStringField
      FieldName = 'listacontascontabeis'
      Size = 200
    end
    object qryecf_p200valor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryecf_p200descricao: TStringField
      FieldName = 'descricao'
      Size = 300
    end
    object qryecf_p200ordem: TIntegerField
      FieldName = 'ordem'
      DisplayFormat = '0'
    end
    object qryecf_p200tipo: TStringField
      FieldName = 'tipo'
      Size = 10
    end
    object qryecf_p200formula: TStringField
      FieldName = 'formula'
      Size = 300
    end
    object qryecf_p200listaposicaosaldocontascontabeis: TStringField
      FieldName = 'listaposicaosaldocontascontabeis'
      Size = 100
    end
    object qryecf_p200PossuiListaContasContabeis: TStringField
      FieldKind = fkCalculated
      FieldName = 'PossuiListaContasContabeis'
      Size = 1
      Calculated = True
    end
  end
  object dsrecf_p200: TtecDataSource
    DataSet = qryecf_p200
    Left = 896
    Top = 464
  end
  object qryecf_p300: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 'seq=sequenciaP030'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrP030
    Constraints = <>
    BeforeOpen = qryecf_p300BeforeOpen
    AfterScroll = qryecf_p300AfterScroll
    OnCalcFields = qryecf_p300CalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select ecf_p300.*,'
      '       ecf_td_p300.descricao,'
      '       ecf_td_p300.ORDEM,'
      '       ecf_td_p300.TIPO,'
      '       ecf_td_p300.FORMULA'
      ''
      'from ecf_p300'
      '    join ecf_td_p300'
      '    on ecf_td_p300.codigo = ecf_p300.codigo_td_p300'
      '    and ecf_td_p300.exercicio = ecf_p300.exercicio'
      ''
      'where ecf_p300.exercicio = :exercicio'
      '  and ecf_p300.filial = :filial'
      'order by ecf_td_p300.ORDEM')
    RequestLive = True
    Left = 984
    Top = 448
    ParamData = <
      item
        DataType = ftString
        Name = 'exercicio'
        ParamType = ptUnknown
        Value = '2014'
      end
      item
        DataType = ftString
        Name = 'filial'
        ParamType = ptUnknown
        Value = '2'
      end>
    object qryecf_p300exercicio: TIntegerField
      FieldName = 'exercicio'
      DisplayFormat = '0'
    end
    object qryecf_p300filial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryecf_p300codigo_td_p300: TIntegerField
      FieldName = 'codigo_td_p300'
      DisplayFormat = '0'
    end
    object qryecf_p300sequenciap030: TStringField
      FieldName = 'sequenciap030'
      Size = 4
    end
    object qryecf_p300listacontascontabeis: TStringField
      FieldName = 'listacontascontabeis'
      Size = 200
    end
    object qryecf_p300valor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryecf_p300descricao: TStringField
      FieldName = 'descricao'
      Size = 200
    end
    object qryecf_p300ordem: TIntegerField
      FieldName = 'ordem'
      DisplayFormat = '0'
    end
    object qryecf_p300tipo: TStringField
      FieldName = 'tipo'
      Size = 10
    end
    object qryecf_p300formula: TStringField
      FieldName = 'formula'
      Size = 200
    end
    object qryecf_p300listaposicaosaldocontascontabeis: TStringField
      FieldName = 'listaposicaosaldocontascontabeis'
      Size = 100
    end
    object qryecf_p300PossuiListaContasContabeis: TStringField
      FieldKind = fkCalculated
      FieldName = 'PossuiListaContasContabeis'
      Size = 1
      Calculated = True
    end
  end
  object dsrecf_p300: TtecDataSource
    DataSet = qryecf_p300
    Left = 1016
    Top = 464
  end
  object qryAtualizar_ecf_p200: TtecQuery
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
      '/* INCLUIR REGISTROS NA TABELA ECF_p200 */'
      
        'insert into ecf_p200 (exercicio,filial,codigo_td_p200,sequenciaP' +
        '030,listacontascontabeis,listaposicaosaldocontascontabeis,valor)'
      ''
      '('
      'select ecf_td_p200_e.exercicio,'
      '       ecf_td_p200_e.filial,'
      '       ecf_td_p200_e.codigo,'
      '       ecf_td_p200_e.seq,'
      '       ecf_td_p200_e.listacontascontabeis,'
      '       ecf_td_p200_e.listaposicaosaldocontascontabeis,'
      '       ecf_td_p200_e.valor'
      'from'
      '('
      'select cast(:filial as integer) as filial,'
      '       pa.seq,'
      '       pa.mes,'
      '     ecf_td_p200.*,'
      ''
      
        '     (select sum(SaldoContabil(sel.codigo, :filial, case when se' +
        'l.alfa='#39'I'#39' then pa.datainicial-1 else pa.datafinal end, :exercic' +
        'io, false))'
      '      from'
      '       ('
      
        '        select pc.codigo, posicao.alfa from (select * from lista' +
        '_int_p(cast(string_to_array(coalesce(ecf_td_p200.listacontascont' +
        'abeis,'#39'0'#39'),'#39','#39') as integer[]))) as contas'
      
        '        join (select * from lista_alfa_p(string_to_array(coalesc' +
        'e(ecf_td_p200.listaposicaosaldocontascontabeis,'#39#39'),'#39','#39'))) as pos' +
        'icao on contas.posicao = posicao.posicao'
      '        join planocontas pc on pc.codigo = contas.inteiro'
      ''
      '       ) as sel) as valor'
      ''
      'from ecf_td_p200'
      '     join ecf'
      '     on ecf_td_p200.exercicio = ecf.exercicio,'
      ''
      '    (select * from periodoapuracao(:exercicio, :filial)) as pa'
      ''
      'where ecf_td_p200.exercicio = :exercicio'
      '  and ecf.filial = :filial'
      ''
      'order by ecf_td_p200.ORDEM'
      ') as ecf_td_p200_e left join ecf_p200'
      '  on ecf_td_p200_e.exercicio = ecf_p200.exercicio'
      '  and ecf_td_p200_e.filial = ecf_p200.filial'
      '  and ecf_td_p200_e.seq = ecf_p200.sequenciaP030'
      '  and ecf_td_p200_e.codigo = ecf_p200.codigo_td_p200'
      'where ecf_p200.exercicio is null'
      ');'
      ''
      ''
      ''
      '/* ATUALIZAR REGISTROS (VALOR) NA TABELA ECF_p200 */'
      'update ecf_p200 set valor = ecf_td_p200_e.valor'
      'from'
      '('
      'select cast(:filial as integer) as filial,'
      '       pa.seq,'
      '       pa.mes,'
      '     ecf_td_p200.*,'
      ''
      
        '     (select sum(SaldoContabil(sel.codigo, :filial, case when se' +
        'l.alfa='#39'I'#39' then pa.datainicial-1 else pa.datafinal end, :exercic' +
        'io, false))'
      '      from'
      '       ('
      
        '        select pc.codigo, posicao.alfa from (select * from lista' +
        '_int_p(cast(string_to_array(coalesce(ecf_td_p200.listacontascont' +
        'abeis,'#39'0'#39'),'#39','#39') as integer[]))) as contas'
      
        '        join (select * from lista_alfa_p(string_to_array(coalesc' +
        'e(ecf_td_p200.listaposicaosaldocontascontabeis,'#39#39'),'#39','#39'))) as pos' +
        'icao on contas.posicao = posicao.posicao'
      '        join planocontas pc on pc.codigo = contas.inteiro'
      ''
      '       ) as sel) as valor'
      ''
      'from ecf_td_p200'
      '     join ecf'
      '     on ecf_td_p200.exercicio = ecf.exercicio,'
      ''
      '    (select * from periodoapuracao(:exercicio, :filial)) as pa'
      ''
      'where ecf_td_p200.exercicio = :exercicio'
      '  and ecf.filial = :filial'
      ''
      'order by ecf_td_p200.ORDEM'
      ') as ecf_td_p200_e'
      '  where'
      '  ecf_td_p200_e.exercicio = ecf_p200.exercicio'
      '  and ecf_td_p200_e.filial = ecf_p200.filial'
      '  and ecf_td_p200_e.seq = ecf_p200.sequenciaP030'
      '  and ecf_td_p200_e.codigo = ecf_p200.codigo_td_p200'
      '  and ecf_td_p200_e.valor <> ecf_p200.valor;'
      ''
      
        '/* EXCLUIR REGISTRO QUE N'#195'O EST'#195'O NA TABELA DINAMICA ECF_TD_p200' +
        ' */'
      'delete from ecf_p200'
      'where exercicio = :exercicio'
      '  and filial = :filial'
      '  and (sequenciaP030, codigo_td_p200) not in'
      '  ('
      '    select pa.seq,'
      '           ecf_td_p200.codigo'
      ''
      '    from ecf_td_p200'
      '         join ecf'
      '         on ecf_td_p200.exercicio = ecf.exercicio,'
      ''
      
        '        (select * from periodoapuracao(:exercicio, :filial)) as ' +
        'pa'
      '    where ecf_td_p200.exercicio = :exercicio'
      '      and ecf.filial = :filial'
      '    order by ecf_td_p200.ORDEM'
      ''
      '  );'
      ''
      ''
      '')
    RequestLive = False
    Left = 872
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end>
  end
  object qryAtualizar_ecf_p300: TtecQuery
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
      '/* INCLUIR REGISTROS NA TABELA ECF_p300 */'
      
        'insert into ecf_p300 (exercicio,filial,codigo_td_p300,sequenciaP' +
        '030,listacontascontabeis,listaposicaosaldocontascontabeis,valor)'
      ''
      '('
      'select ecf_td_p300_e.exercicio,'
      '       ecf_td_p300_e.filial,'
      '       ecf_td_p300_e.codigo,'
      '       ecf_td_p300_e.seq,'
      '       ecf_td_p300_e.listacontascontabeis,'
      '       ecf_td_p300_e.listaposicaosaldocontascontabeis,'
      '       ecf_td_p300_e.valor'
      'from'
      '('
      'select cast(:filial as integer) as filial,'
      '       pa.seq,'
      '       pa.mes,'
      '     ecf_td_p300.*,'
      ''
      
        '     (select sum(SaldoContabil(sel.codigo, :filial, case when se' +
        'l.alfa='#39'I'#39' then pa.datainicial-1 else pa.datafinal end, :exercic' +
        'io, false))'
      '      from'
      '       ('
      
        '        select pc.codigo, posicao.alfa from (select * from lista' +
        '_int_p(cast(string_to_array(coalesce(ecf_td_p300.listacontascont' +
        'abeis,'#39'0'#39'),'#39','#39') as integer[]))) as contas'
      
        '        join (select * from lista_alfa_p(string_to_array(coalesc' +
        'e(ecf_td_p300.listaposicaosaldocontascontabeis,'#39#39'),'#39','#39'))) as pos' +
        'icao on contas.posicao = posicao.posicao'
      '        join planocontas pc on pc.codigo = contas.inteiro'
      ''
      '       ) as sel) as valor'
      ''
      'from ecf_td_p300'
      '     join ecf'
      '     on ecf_td_p300.exercicio = ecf.exercicio,'
      ''
      '    (select * from periodoapuracao(:exercicio, :filial)) as pa'
      ''
      'where ecf_td_p300.exercicio = :exercicio'
      '  and ecf.filial = :filial'
      ''
      'order by ecf_td_p300.ORDEM'
      ') as ecf_td_p300_e left join ecf_p300'
      '  on ecf_td_p300_e.exercicio = ecf_p300.exercicio'
      '  and ecf_td_p300_e.filial = ecf_p300.filial'
      '  and ecf_td_p300_e.seq = ecf_p300.sequenciaP030'
      '  and ecf_td_p300_e.codigo = ecf_p300.codigo_td_p300'
      'where ecf_p300.exercicio is null'
      ');'
      ''
      ''
      ''
      '/* ATUALIZAR REGISTROS (VALOR) NA TABELA ECF_p300 */'
      'update ecf_p300 set valor = ecf_td_p300_e.valor'
      'from'
      '('
      'select cast(:filial as integer) as filial,'
      '       pa.seq,'
      '       pa.mes,'
      '     ecf_td_p300.*,'
      ''
      
        '     (select sum(SaldoContabil(sel.codigo, :filial, case when se' +
        'l.alfa='#39'I'#39' then pa.datainicial-1 else pa.datafinal end, :exercic' +
        'io, false))'
      '      from'
      '       ('
      
        '        select pc.codigo, posicao.alfa from (select * from lista' +
        '_int_p(cast(string_to_array(coalesce(ecf_td_p300.listacontascont' +
        'abeis,'#39'0'#39'),'#39','#39') as integer[]))) as contas'
      
        '        join (select * from lista_alfa_p(string_to_array(coalesc' +
        'e(ecf_td_p300.listaposicaosaldocontascontabeis,'#39#39'),'#39','#39'))) as pos' +
        'icao on contas.posicao = posicao.posicao'
      '        join planocontas pc on pc.codigo = contas.inteiro'
      ''
      '       ) as sel) as valor'
      ''
      'from ecf_td_p300'
      '     join ecf'
      '     on ecf_td_p300.exercicio = ecf.exercicio,'
      ''
      '    (select * from periodoapuracao(:exercicio, :filial)) as pa'
      ''
      'where ecf_td_p300.exercicio = :exercicio'
      '  and ecf.filial = :filial'
      ''
      'order by ecf_td_p300.ORDEM'
      ') as ecf_td_p300_e'
      '  where'
      '  ecf_td_p300_e.exercicio = ecf_p300.exercicio'
      '  and ecf_td_p300_e.filial = ecf_p300.filial'
      '  and ecf_td_p300_e.seq = ecf_p300.sequenciaP030'
      '  and ecf_td_p300_e.codigo = ecf_p300.codigo_td_p300'
      '  and ecf_td_p300_e.valor <> ecf_p300.valor;'
      ''
      
        '/* EXCLUIR REGISTRO QUE N'#195'O EST'#195'O NA TABELA DINAMICA ECF_TD_p300' +
        ' */'
      'delete from ecf_p300'
      'where exercicio = :exercicio'
      '  and filial = :filial'
      '  and (sequenciaP030, codigo_td_p300) not in'
      '  ('
      '    select pa.seq,'
      '           ecf_td_p300.codigo'
      ''
      '    from ecf_td_p300'
      '         join ecf'
      '         on ecf_td_p300.exercicio = ecf.exercicio,'
      ''
      
        '        (select * from periodoapuracao(:exercicio, :filial)) as ' +
        'pa'
      '    where ecf_td_p300.exercicio = :exercicio'
      '      and ecf.filial = :filial'
      '    order by ecf_td_p300.ORDEM'
      ''
      '  );'
      ''
      ''
      '')
    RequestLive = False
    Left = 992
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end>
  end
  object qryecf_td_p400: TtecQuery
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
      'select * '
      'from ecf_td_p400'
      'where exercicio = :exercicio'
      'order by codigo, ordem')
    RequestLive = True
    Left = 1104
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end>
    object qryecf_td_p400codigo: TStringField
      FieldName = 'codigo'
      Size = 10
    end
    object qryecf_td_p400exercicio: TIntegerField
      FieldName = 'exercicio'
    end
    object qryecf_td_p400descricao: TStringField
      FieldName = 'descricao'
      Size = 300
    end
    object qryecf_td_p400dt_ini: TDateField
      FieldName = 'dt_ini'
    end
    object qryecf_td_p400dt_fim: TDateField
      FieldName = 'dt_fim'
    end
    object qryecf_td_p400ordem: TIntegerField
      FieldName = 'ordem'
    end
    object qryecf_td_p400tipo: TStringField
      FieldName = 'tipo'
      Size = 10
    end
    object qryecf_td_p400formato: TStringField
      FieldName = 'formato'
      Size = 10
    end
    object qryecf_td_p400linha_ecf: TIntegerField
      FieldName = 'linha_ecf'
    end
    object qryecf_td_p400formula: TStringField
      FieldName = 'formula'
      Size = 300
    end
    object qryecf_td_p400listacontascontabeis: TStringField
      FieldName = 'listacontascontabeis'
      Size = 400
    end
    object qryecf_td_p400listaposicaosaldocontascontabeis: TStringField
      FieldName = 'listaposicaosaldocontascontabeis'
      Size = 100
    end
  end
  object dsrecf_td_p400: TtecDataSource
    DataSet = qryecf_td_p400
    Left = 1136
    Top = 400
  end
  object qryecf_p400: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 'seq=sequenciaP030'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrP030
    Constraints = <>
    BeforeOpen = qryecf_p400BeforeOpen
    AfterScroll = qryecf_p400AfterScroll
    OnCalcFields = qryecf_p400CalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select ecf_p400.*,'
      '       ecf_td_p400.descricao,'
      '       ecf_td_p400.ORDEM,'
      '       ecf_td_p400.TIPO,'
      '       ecf_td_p400.FORMULA'
      ''
      'from ecf_p400'
      '    join ecf_td_p400'
      '    on ecf_td_p400.codigo = ecf_p400.codigo_td_p400'
      '    and ecf_td_p400.exercicio = ecf_p400.exercicio'
      ''
      'where ecf_p400.exercicio = :exercicio'
      '  and ecf_p400.filial = :filial'
      'order by ecf_td_p400.ORDEM')
    RequestLive = True
    Left = 1104
    Top = 448
    ParamData = <
      item
        DataType = ftString
        Name = 'exercicio'
        ParamType = ptUnknown
        Value = '2014'
      end
      item
        DataType = ftString
        Name = 'filial'
        ParamType = ptUnknown
        Value = '2'
      end>
    object qryecf_p400exercicio: TIntegerField
      FieldName = 'exercicio'
    end
    object qryecf_p400filial: TIntegerField
      FieldName = 'filial'
    end
    object qryecf_p400codigo_td_p400: TStringField
      FieldName = 'codigo_td_p400'
      Size = 10
    end
    object qryecf_p400sequenciap030: TStringField
      FieldName = 'sequenciap030'
      Size = 4
    end
    object qryecf_p400listacontascontabeis: TStringField
      FieldName = 'listacontascontabeis'
      Size = 400
    end
    object qryecf_p400valor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryecf_p400listaposicaosaldocontascontabeis: TStringField
      FieldName = 'listaposicaosaldocontascontabeis'
      Size = 100
    end
    object qryecf_p400descricao: TStringField
      FieldName = 'descricao'
      Size = 300
    end
    object qryecf_p400ordem: TIntegerField
      FieldName = 'ordem'
    end
    object qryecf_p400tipo: TStringField
      FieldName = 'tipo'
      Size = 10
    end
    object qryecf_p400formula: TStringField
      FieldName = 'formula'
      Size = 300
    end
    object qryecf_p400PossuiListaContasContabeis: TStringField
      FieldKind = fkCalculated
      FieldName = 'PossuiListaContasContabeis'
      Size = 1
      Calculated = True
    end
  end
  object dsrecf_p400: TtecDataSource
    DataSet = qryecf_p400
    Left = 1136
    Top = 464
  end
  object qryAtualizar_ecf_p400: TtecQuery
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
      '/* INCLUIR REGISTROS NA TABELA ECF_p400 */'
      
        'insert into ecf_p400 (exercicio,filial,codigo_td_p400,sequenciaP' +
        '030,listacontascontabeis,listaposicaosaldocontascontabeis,valor)'
      ''
      '('
      'select ecf_td_p400_e.exercicio,'
      '       ecf_td_p400_e.filial,'
      '       ecf_td_p400_e.codigo,'
      '       ecf_td_p400_e.seq,'
      '       ecf_td_p400_e.listacontascontabeis,'
      '       ecf_td_p400_e.listaposicaosaldocontascontabeis,'
      '       ecf_td_p400_e.valor'
      'from'
      '('
      'select cast(:filial as integer) as filial,'
      '       pa.seq,'
      '       pa.mes,'
      '     ecf_td_p400.*,'
      ''
      
        '     (select sum(SaldoContabil(sel.codigo, :filial, case when se' +
        'l.alfa='#39'I'#39' then pa.datainicial-1 else pa.datafinal end, :exercic' +
        'io, false))'
      '      from'
      '       ('
      
        '        select pc.codigo, posicao.alfa from (select * from lista' +
        '_int_p(cast(string_to_array(coalesce(ecf_td_p400.listacontascont' +
        'abeis,'#39'0'#39'),'#39','#39') as integer[]))) as contas'
      
        '        join (select * from lista_alfa_p(string_to_array(coalesc' +
        'e(ecf_td_p400.listaposicaosaldocontascontabeis,'#39#39'),'#39','#39'))) as pos' +
        'icao on contas.posicao = posicao.posicao'
      '        join planocontas pc on pc.codigo = contas.inteiro'
      ''
      '       ) as sel) as valor'
      ''
      'from ecf_td_p400'
      '     join ecf'
      '     on ecf_td_p400.exercicio = ecf.exercicio,'
      ''
      '    (select * from periodoapuracao(:exercicio, :filial)) as pa'
      ''
      'where ecf_td_p400.exercicio = :exercicio'
      '  and ecf.filial = :filial'
      ''
      'order by ecf_td_p400.ORDEM'
      ') as ecf_td_p400_e left join ecf_p400'
      '  on ecf_td_p400_e.exercicio = ecf_p400.exercicio'
      '  and ecf_td_p400_e.filial = ecf_p400.filial'
      '  and ecf_td_p400_e.seq = ecf_p400.sequenciaP030'
      '  and ecf_td_p400_e.codigo = ecf_p400.codigo_td_p400'
      'where ecf_p400.exercicio is null'
      ');'
      ''
      ''
      ''
      '/* ATUALIZAR REGISTROS (VALOR) NA TABELA ECF_p400 */'
      'update ecf_p400 set valor = ecf_td_p400_e.valor'
      'from'
      '('
      'select cast(:filial as integer) as filial,'
      '       pa.seq,'
      '       pa.mes,'
      '     ecf_td_p400.*,'
      ''
      
        '     (select sum(SaldoContabil(sel.codigo, :filial, case when se' +
        'l.alfa='#39'I'#39' then pa.datainicial-1 else pa.datafinal end, :exercic' +
        'io, false))'
      '      from'
      '       ('
      
        '        select pc.codigo, posicao.alfa from (select * from lista' +
        '_int_p(cast(string_to_array(coalesce(ecf_td_p400.listacontascont' +
        'abeis,'#39'0'#39'),'#39','#39') as integer[]))) as contas'
      
        '        join (select * from lista_alfa_p(string_to_array(coalesc' +
        'e(ecf_td_p400.listaposicaosaldocontascontabeis,'#39#39'),'#39','#39'))) as pos' +
        'icao on contas.posicao = posicao.posicao'
      '        join planocontas pc on pc.codigo = contas.inteiro'
      ''
      '       ) as sel) as valor'
      ''
      'from ecf_td_p400'
      '     join ecf'
      '     on ecf_td_p400.exercicio = ecf.exercicio,'
      ''
      '    (select * from periodoapuracao(:exercicio, :filial)) as pa'
      ''
      'where ecf_td_p400.exercicio = :exercicio'
      '  and ecf.filial = :filial'
      ''
      'order by ecf_td_p400.ORDEM'
      ') as ecf_td_p400_e'
      '  where'
      '  ecf_td_p400_e.exercicio = ecf_p400.exercicio'
      '  and ecf_td_p400_e.filial = ecf_p400.filial'
      '  and ecf_td_p400_e.seq = ecf_p400.sequenciaP030'
      '  and ecf_td_p400_e.codigo = ecf_p400.codigo_td_p400'
      '  and ecf_td_p400_e.valor <> ecf_p400.valor;'
      ''
      
        '/* EXCLUIR REGISTRO QUE N'#195'O EST'#195'O NA TABELA DINAMICA ECF_TD_p400' +
        ' */'
      'delete from ecf_p400'
      'where exercicio = :exercicio'
      '  and filial = :filial'
      '  and (sequenciaP030, codigo_td_p400) not in'
      '  ('
      '    select pa.seq,'
      '           ecf_td_p400.codigo'
      ''
      '    from ecf_td_p400'
      '         join ecf'
      '         on ecf_td_p400.exercicio = ecf.exercicio,'
      ''
      
        '        (select * from periodoapuracao(:exercicio, :filial)) as ' +
        'pa'
      '    where ecf_td_p400.exercicio = :exercicio'
      '      and ecf.filial = :filial'
      '    order by ecf_td_p400.ORDEM'
      ''
      '  );'
      ''
      ''
      '')
    RequestLive = False
    Left = 1104
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end>
  end
  object qryAtualizar_ecf_p500: TtecQuery
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
      '/* INCLUIR REGISTROS NA TABELA ECF_p500 */'
      
        'insert into ecf_p500 (exercicio,filial,codigo_td_p500,sequenciaP' +
        '030,listacontascontabeis,listaposicaosaldocontascontabeis,valor)'
      ''
      '('
      'select ecf_td_p500_e.exercicio,'
      '       ecf_td_p500_e.filial,'
      '       ecf_td_p500_e.codigo,'
      '       ecf_td_p500_e.seq,'
      '       ecf_td_p500_e.listacontascontabeis,'
      '       ecf_td_p500_e.listaposicaosaldocontascontabeis,'
      '       ecf_td_p500_e.valor'
      'from'
      '('
      'select cast(:filial as integer) as filial,'
      '       pa.seq,'
      '       pa.mes,'
      '     ecf_td_p500.*,'
      ''
      
        '     (select sum(SaldoContabil(sel.codigo, :filial, case when se' +
        'l.alfa='#39'I'#39' then pa.datainicial-1 else pa.datafinal end, :exercic' +
        'io, false))'
      '      from'
      '       ('
      
        '        select pc.codigo, posicao.alfa from (select * from lista' +
        '_int_p(cast(string_to_array(coalesce(ecf_td_p500.listacontascont' +
        'abeis,'#39'0'#39'),'#39','#39') as integer[]))) as contas'
      
        '        join (select * from lista_alfa_p(string_to_array(coalesc' +
        'e(ecf_td_p500.listaposicaosaldocontascontabeis,'#39#39'),'#39','#39'))) as pos' +
        'icao on contas.posicao = posicao.posicao'
      '        join planocontas pc on pc.codigo = contas.inteiro'
      ''
      '       ) as sel) as valor'
      ''
      'from ecf_td_p500'
      '     join ecf'
      '     on ecf_td_p500.exercicio = ecf.exercicio,'
      ''
      '    (select * from periodoapuracao(:exercicio, :filial)) as pa'
      ''
      'where ecf_td_p500.exercicio = :exercicio'
      '  and ecf.filial = :filial'
      ''
      'order by ecf_td_p500.ORDEM'
      ') as ecf_td_p500_e left join ecf_p500'
      '  on ecf_td_p500_e.exercicio = ecf_p500.exercicio'
      '  and ecf_td_p500_e.filial = ecf_p500.filial'
      '  and ecf_td_p500_e.seq = ecf_p500.sequenciaP030'
      '  and ecf_td_p500_e.codigo = ecf_p500.codigo_td_p500'
      'where ecf_p500.exercicio is null'
      ');'
      ''
      ''
      ''
      '/* ATUALIZAR REGISTROS (VALOR) NA TABELA ECF_p500 */'
      'update ecf_p500 set valor = ecf_td_p500_e.valor'
      'from'
      '('
      'select cast(:filial as integer) as filial,'
      '       pa.seq,'
      '       pa.mes,'
      '     ecf_td_p500.*,'
      ''
      
        '     (select sum(SaldoContabil(sel.codigo, :filial, case when se' +
        'l.alfa='#39'I'#39' then pa.datainicial-1 else pa.datafinal end, :exercic' +
        'io, false))'
      '      from'
      '       ('
      
        '        select pc.codigo, posicao.alfa from (select * from lista' +
        '_int_p(cast(string_to_array(coalesce(ecf_td_p500.listacontascont' +
        'abeis,'#39'0'#39'),'#39','#39') as integer[]))) as contas'
      
        '        join (select * from lista_alfa_p(string_to_array(coalesc' +
        'e(ecf_td_p500.listaposicaosaldocontascontabeis,'#39#39'),'#39','#39'))) as pos' +
        'icao on contas.posicao = posicao.posicao'
      '        join planocontas pc on pc.codigo = contas.inteiro'
      ''
      '       ) as sel) as valor'
      ''
      'from ecf_td_p500'
      '     join ecf'
      '     on ecf_td_p500.exercicio = ecf.exercicio,'
      ''
      '    (select * from periodoapuracao(:exercicio, :filial)) as pa'
      ''
      'where ecf_td_p500.exercicio = :exercicio'
      '  and ecf.filial = :filial'
      ''
      'order by ecf_td_p500.ORDEM'
      ') as ecf_td_p500_e'
      '  where'
      '  ecf_td_p500_e.exercicio = ecf_p500.exercicio'
      '  and ecf_td_p500_e.filial = ecf_p500.filial'
      '  and ecf_td_p500_e.seq = ecf_p500.sequenciaP030'
      '  and ecf_td_p500_e.codigo = ecf_p500.codigo_td_p500'
      '  and ecf_td_p500_e.valor <> ecf_p500.valor;'
      ''
      
        '/* EXCLUIR REGISTRO QUE N'#195'O EST'#195'O NA TABELA DINAMICA ECF_TD_p500' +
        ' */'
      'delete from ecf_p500'
      'where exercicio = :exercicio'
      '  and filial = :filial'
      '  and (sequenciaP030, codigo_td_p500) not in'
      '  ('
      '    select pa.seq,'
      '           ecf_td_p500.codigo'
      ''
      '    from ecf_td_p500'
      '         join ecf'
      '         on ecf_td_p500.exercicio = ecf.exercicio,'
      ''
      
        '        (select * from periodoapuracao(:exercicio, :filial)) as ' +
        'pa'
      '    where ecf_td_p500.exercicio = :exercicio'
      '      and ecf.filial = :filial'
      '    order by ecf_td_p500.ORDEM'
      ''
      '  );'
      ''
      ''
      '')
    RequestLive = False
    Left = 1224
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end>
  end
  object qryecf_td_p500: TtecQuery
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
      'select * '
      'from ecf_td_p500'
      'where exercicio = :exercicio'
      'order by codigo, ordem')
    RequestLive = True
    Left = 1208
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end>
    object qryecf_td_p500codigo: TStringField
      FieldName = 'codigo'
      Size = 10
    end
    object qryecf_td_p500exercicio: TIntegerField
      FieldName = 'exercicio'
    end
    object qryecf_td_p500descricao: TStringField
      FieldName = 'descricao'
      Size = 300
    end
    object qryecf_td_p500dt_ini: TDateField
      FieldName = 'dt_ini'
    end
    object qryecf_td_p500dt_fim: TDateField
      FieldName = 'dt_fim'
    end
    object qryecf_td_p500ordem: TIntegerField
      FieldName = 'ordem'
    end
    object qryecf_td_p500tipo: TStringField
      FieldName = 'tipo'
      Size = 10
    end
    object qryecf_td_p500formato: TStringField
      FieldName = 'formato'
      Size = 10
    end
    object qryecf_td_p500linha_ecf: TIntegerField
      FieldName = 'linha_ecf'
    end
    object qryecf_td_p500formula: TStringField
      FieldName = 'formula'
      Size = 512
    end
    object qryecf_td_p500listacontascontabeis: TStringField
      FieldName = 'listacontascontabeis'
      Size = 400
    end
    object qryecf_td_p500listaposicaosaldocontascontabeis: TStringField
      FieldName = 'listaposicaosaldocontascontabeis'
      Size = 100
    end
  end
  object dsrecf_td_p500: TtecDataSource
    DataSet = qryecf_td_p500
    Left = 1240
    Top = 400
  end
  object qryecf_p500: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 'seq=sequenciaP030'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrP030
    Constraints = <>
    BeforeOpen = qryecf_p500BeforeOpen
    AfterScroll = qryecf_p500AfterScroll
    OnCalcFields = qryecf_p500CalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select ecf_p500.*,'
      '       ecf_td_p500.descricao,'
      '       ecf_td_p500.ORDEM,'
      '       ecf_td_p500.TIPO,'
      '       ecf_td_p500.FORMULA'
      ''
      'from ecf_p500'
      '    join ecf_td_p500'
      '    on ecf_td_p500.codigo = ecf_p500.codigo_td_p500'
      '    and ecf_td_p500.exercicio = ecf_p500.exercicio'
      ''
      'where ecf_p500.exercicio = :exercicio'
      '  and ecf_p500.filial = :filial'
      'order by ecf_td_p500.ORDEM')
    RequestLive = True
    Left = 1208
    Top = 448
    ParamData = <
      item
        DataType = ftString
        Name = 'exercicio'
        ParamType = ptUnknown
        Value = '2014'
      end
      item
        DataType = ftString
        Name = 'filial'
        ParamType = ptUnknown
        Value = '2'
      end>
    object qryecf_p500exercicio: TIntegerField
      FieldName = 'exercicio'
    end
    object qryecf_p500filial: TIntegerField
      FieldName = 'filial'
    end
    object qryecf_p500codigo_td_p500: TStringField
      FieldName = 'codigo_td_p500'
      Size = 10
    end
    object qryecf_p500sequenciap030: TStringField
      FieldName = 'sequenciap030'
      Size = 4
    end
    object qryecf_p500listacontascontabeis: TStringField
      FieldName = 'listacontascontabeis'
      Size = 400
    end
    object qryecf_p500listaposicaosaldocontascontabeis: TStringField
      FieldName = 'listaposicaosaldocontascontabeis'
      Size = 100
    end
    object qryecf_p500valor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryecf_p500descricao: TStringField
      FieldName = 'descricao'
      Size = 300
    end
    object qryecf_p500ordem: TIntegerField
      FieldName = 'ordem'
    end
    object qryecf_p500tipo: TStringField
      FieldName = 'tipo'
      Size = 10
    end
    object qryecf_p500formula: TStringField
      FieldName = 'formula'
      Size = 512
    end
    object qryecf_p500PossuiListaContasContabeis: TStringField
      FieldKind = fkCalculated
      FieldName = 'PossuiListaContasContabeis'
      Size = 1
      Calculated = True
    end
  end
  object dsrecf_p500: TtecDataSource
    DataSet = qryecf_p500
    Left = 1240
    Top = 464
  end
  object qryecf_td_l210_Aux: TtecQuery
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
      'select * '
      'from ecf_td_l210'
      'where exercicio = :exercicio'
      'order by ordem')
    RequestLive = True
    Left = 416
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end>
  end
  object qryecf_td_p200_aux: TtecQuery
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
      'select * '
      'from ecf_td_p200'
      'where exercicio = :exercicio'
      'order by codigo, ordem')
    RequestLive = True
    Left = 896
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end>
  end
  object qryecf_td_p300_Aux: TtecQuery
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
      'select * '
      'from ecf_td_p300'
      'where exercicio = :exercicio'
      'order by codigo, ordem')
    RequestLive = True
    Left = 1016
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end>
  end
  object qryecf_td_p400_Aux: TtecQuery
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
      'select * '
      'from ecf_td_p400'
      'where exercicio = :exercicio'
      'order by codigo, ordem')
    RequestLive = True
    Left = 1136
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end>
  end
  object qryecf_td_p500_Aux: TtecQuery
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
      'select * '
      'from ecf_td_p500'
      'where exercicio = :exercicio'
      'order by codigo, ordem')
    RequestLive = True
    Left = 1240
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end>
  end
end
