inherited dtmFCont: TdtmFCont
  OldCreateOrder = False
  Left = 298
  Top = 66
  Height = 750
  Width = 736
  object qryecd: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryecdAfterScroll
    OnNewRecord = qryecdNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select ecd.*'
      'from ecd'
      'where ecd.exercicio = :exercicio'
      '    and ecd.filial = :filial')
    RequestLive = True
    Left = 28
    Top = 24
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
    object qryecdexercicio: TStringField
      FieldName = 'exercicio'
      Size = 4
    end
    object qryecdnomearquivo: TStringField
      FieldName = 'nomearquivo'
      Size = 100
    end
    object qryecddata: TDateTimeField
      FieldName = 'data'
    end
    object qryecdsituacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
    object qryecdfilial: TIntegerField
      FieldName = 'filial'
    end
    object qryecdnum_ord: TIntegerField
      FieldName = 'num_ord'
    end
    object qryecdnatureza: TStringField
      FieldName = 'natureza'
      Size = 80
    end
  end
  object qryFiliais: TZPgSqlQuery
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
      'select f.codigo,'
      '       f.suframa,'
      '       f.ind_perfil,'
      '       f.ind_ativ,'
      '       f.razao,'
      '       f.cnpj,'
      '       f.inscricaoestadual,'
      '       f.inscricaomunicipal,'
      '       f.estado,'
      '      (select c.codigoibge'
      '       from cidades c'
      '       where c.estado = f.estado'
      '         and c.codigo = f.cidade) as cidadeIBGE,'
      '       f.filialconsolidadoradime,'
      '       f.junta,'
      '       f.juntadata,'
      '      (select c.nome'
      '       from cidades c'
      '       where c.estado = f.estado'
      '         and c.codigo = f.cidade) as nomecidade'
      'from filiais f'
      'where f.codigo = :codigo')
    RequestLive = False
    Left = 56
    Top = 504
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryFiliaissuframa: TStringField
      FieldName = 'suframa'
      Size = 9
    end
    object qryFiliaisind_perfil: TStringField
      FieldName = 'ind_perfil'
      Required = True
      Size = 1
    end
    object qryFiliaisind_ativ: TStringField
      FieldName = 'ind_ativ'
      Required = True
      Size = 1
    end
    object qryFiliaisrazao: TStringField
      FieldName = 'razao'
      Required = True
      Size = 60
    end
    object qryFiliaiscnpj: TStringField
      FieldName = 'cnpj'
      Size = 14
    end
    object qryFiliaisinscricaoestadual: TStringField
      FieldName = 'inscricaoestadual'
    end
    object qryFiliaisinscricaomunicipal: TStringField
      FieldName = 'inscricaomunicipal'
    end
    object qryFiliaisestado: TStringField
      FieldName = 'estado'
      Required = True
      Size = 2
    end
    object qryFiliaiscidadeibge: TIntegerField
      FieldName = 'cidadeibge'
    end
    object qryFiliaisfilialconsolidadoradime: TIntegerField
      FieldName = 'filialconsolidadoradime'
    end
    object qryFiliaisjunta: TStringField
      FieldName = 'junta'
    end
    object qryFiliaisjuntadata: TDateField
      FieldName = 'juntadata'
    end
    object qryFiliaisnomecidade: TStringField
      FieldName = 'nomecidade'
      Size = 50
    end
    object qryFiliaiscodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object dsrecd: TtecDataSource
    DataSet = qryecd
    OnDataChange = dsrecdDataChange
    Left = 64
    Top = 16
  end
  object ACBrSPEDContabil: TACBrSPEDContabil
    Path = 'C:\Arquivos de programas\Borland\Delphi6\Bin\'
    Delimitador = '|'
    TrimString = True
    CurMascara = '#0.00'
    Left = 152
    Top = 528
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
    Top = 600
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
    Top = 648
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
    Top = 696
  end
  object qryRegistroI050: TtecQuery
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
      'select cast(:datainicial as date) as data_alt,'
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
      
        'where (contacommovto(pl.codigo, :filial, cast(:datainicial as da' +
        'te), cast(:datafinal as date)) or sc.saldoanterior<>0)'
      '  and sc.filial = :filial'
      '  and sc.exercicio = :exercicio'
      'order by pl.classificacao, pl.codigo'
      '')
    RequestLive = False
    Left = 72
    Top = 64
    ParamData = <
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
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end>
    object qryRegistroI050data_alt: TDateField
      Alignment = taCenter
      FieldName = 'data_alt'
      EditMask = '99/99/9999;1; '
    end
    object qryRegistroI050cod_nat: TStringField
      FieldName = 'cod_nat'
      Size = 2
    end
    object qryRegistroI050ind_cta: TStringField
      FieldName = 'ind_cta'
      Size = 1
    end
    object qryRegistroI050nivel: TIntegerField
      FieldName = 'nivel'
      DisplayFormat = '0'
    end
    object qryRegistroI050cod_cta: TStringField
      FieldName = 'cod_cta'
      Size = 28
    end
    object qryRegistroI050cta: TStringField
      FieldName = 'cta'
      Required = True
      Size = 50
    end
    object qryRegistroI050cod_cta_ref: TStringField
      FieldName = 'cod_cta_ref'
      Size = 50
    end
    object qryRegistroI050cod_cta_sup: TStringField
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
    Top = 128
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
      'select data, cod_cta,'
      '      case when vl_sld_ini >=0 then cast('#39'D'#39' as char(1))'
      '                                   else cast('#39'C'#39' as char(1))'
      '       end as ind_dc_ini,'
      '       abs(vl_sld_ini) as vl_sld_ini,'
      '       vl_deb,'
      '       vl_cred,'
      ''
      '       abs(vl_deb - vl_cred + vl_sld_ini) as vl_sld_fin,'
      ''
      '       case when (vl_deb - vl_cred + vl_sld_ini) >=0 then'
      '            cast('#39'D'#39' as char(1))'
      '       else cast('#39'C'#39' as char(1))  end as ind_dc_fin'
      ''
      'from'
      '('
      '  select data,'
      '       case when pl.tipo = '#39'A'#39' then'
      
        '         cast(pl.classificacao||trim(to_char(pl.codigo,'#39'000000'#39')' +
        ') as varchar(28))'
      '       else'
      '         cast(pl.classificacao as varchar(28))'
      '       end as cod_cta,'
      ''
      
        '       saldocontabil(pl.codigo,sc.filial, cast('#39'01/'#39'||substring(' +
        'data from 1 for 2)||'#39'/'#39'||substring(data from 3 for 4) as date)-1' +
        ') as vl_sld_ini,'
      ''
      
        '       coalesce(sc.debitos[cast(substring(data from 1 for 2) as ' +
        'integer)],0) as vl_deb,'
      
        '       coalesce(sc.creditos[cast(substring(data from 1 for 2) as' +
        ' integer)],0) as vl_cred'
      ''
      '  from'
      '  ('
      
        '   select distinct cast(to_char(cast(:datainicial as date)  + s.' +
        'a,'#39'MMYYYY'#39') as varchar(6)) as data'
      
        '   from generate_series(1,cast(:datafinal as date)-cast(:dataini' +
        'cial as date)) as s(a)'
      '   order by 1'
      '   ) as meses,'
      
        '        planocontas pl join saldoscontabeis sc on pl.codigo = sc' +
        '.conta'
      
        '        where (contacommovto(pl.codigo, :filial, cast(:datainici' +
        'al as date), cast(:datafinal as date)) or sc.saldoanterior<>0)'
      '          and sc.filial = :filial'
      '          and sc.exercicio = :exercicio'
      '          and pl.tipo='#39'A'#39
      ''
      '  order by pl.classificacao, pl.codigo'
      ') as saldos'
      'where  (vl_sld_ini <> 0) or'
      '       (vl_deb <> 0) or'
      '       (vl_cred <> 0)'
      'order by data, cod_cta'
      '')
    RequestLive = False
    Left = 136
    Top = 248
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
      
        'select data, datainicial, last_day_of_month(datainicial) as data' +
        'final'
      'from'
      '('
      'select data,'
      
        '       cast('#39'01/'#39'||substring(data from 1 for 2)||'#39'/'#39'||substring(' +
        'data from 3 for 4) as date) as datainicial'
      'from'
      '('
      'select distinct data'
      'from'
      '('
      '  select data,'
      '       case when pl.tipo = '#39'A'#39' then'
      
        '         cast(pl.classificacao||trim(to_char(pl.codigo,'#39'000000'#39')' +
        ') as varchar(28))'
      '       else'
      '         cast(pl.classificacao as varchar(28))'
      '       end as cod_cta,'
      ''
      
        '       saldocontabil(pl.codigo,sc.filial, cast('#39'01/'#39'||substring(' +
        'data from 1 for 2)||'#39'/'#39'||substring(data from 3 for 4) as date)-1' +
        ') as vl_sld_ini,'
      ''
      
        '       coalesce(sc.debitos[cast(substring(data from 1 for 2) as ' +
        'integer)],0) as vl_deb,'
      
        '       coalesce(sc.creditos[cast(substring(data from 1 for 2) as' +
        ' integer)],0) as vl_cred'
      ''
      '  from'
      '  ('
      
        '   select distinct cast(to_char(cast(:datainicial as date)  + s.' +
        'a,'#39'MMYYYY'#39') as varchar(6)) as data'
      
        '   from generate_series(1,cast(:datafinal as date)-cast(:dataini' +
        'cial as date)) as s(a)'
      '   order by 1'
      '   ) as meses,'
      
        '        planocontas pl join saldoscontabeis sc on pl.codigo = sc' +
        '.conta'
      
        '        where (contacommovto(pl.codigo, :filial, cast(:datainici' +
        'al as date), cast(:datafinal as date)) or sc.saldoanterior<>0)'
      '          and sc.filial = :filial'
      '          and sc.exercicio = :exercicio'
      '          and pl.tipo='#39'A'#39
      ''
      '  order by pl.classificacao, pl.codigo'
      ') as saldos'
      'where  (vl_sld_ini <> 0) or'
      '       (vl_deb <> 0) or'
      '       (vl_cred <> 0)'
      'order by data'
      ') as meses'
      ') as meses')
    RequestLive = False
    Left = 72
    Top = 184
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
    Top = 192
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
      
        '                  when origem = '#39'L'#39' then cast(origem||trim(to_ch' +
        'ar(EXTRACT(DOY FROM data),'#39'0000'#39'))||trim(to_char(nrorigem,'#39'0000'#39 +
        ')) as varchar)'
      
        '                 else                    cast(origem||nrorigem  ' +
        'as varchar) end as num_lcto,'
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
    Top = 296
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
      FieldName = 'vl_lcto'
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
      
        '                  when origem = '#39'L'#39' then cast(origem||trim(to_ch' +
        'ar(EXTRACT(DOY FROM data),'#39'0000'#39'))||trim(to_char(nrorigem,'#39'0000'#39 +
        ')) as varchar)'
      
        '                 else                    cast(origem||nrorigem  ' +
        'as varchar) end as num_lcto,'
      ''
      '       case when pl.tipo = '#39'A'#39' then'
      
        '         cast(pl.classificacao||trim(to_char(pl.codigo,'#39'000000'#39')' +
        ') as varchar(28))'
      '       else'
      '         cast(pl.classificacao as varchar(28))'
      '       end as cod_cta,'
      '       valor as vl_dc,'
      '       cast('#39'D'#39' as char(1)) as ind_dc,'
      
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
        ')||'#39' '#39'||nrorigem%100 as char(12))'
      
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
      '       end as num_arq,'
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
        ')||'#39' '#39'||nrorigem%100 as char(12))'
      
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
      '       end as num_arq,'
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
    Top = 368
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
      FieldName = 'vl_dc'
      DisplayFormat = '0.00'
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
    Top = 312
  end
  object qryRegistroJ930: TtecQuery
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
    Left = 256
    Top = 384
    object qryRegistroJ930cpf: TStringField
      FieldName = 'cpf'
      Size = 11
    end
    object qryRegistroJ930nome: TStringField
      FieldName = 'nome'
      Size = 70
    end
    object qryRegistroJ930qualificacao: TStringField
      FieldName = 'qualificacao'
      Size = 3
    end
    object qryRegistroJ930crc: TStringField
      FieldName = 'crc'
      Size = 11
    end
    object qryRegistroJ930descricaoqualificacao: TStringField
      FieldName = 'descricaoqualificacao'
      Size = 70
    end
  end
  object dsrRegistroJ930: TtecDataSource
    DataSet = qryRegistroJ930
    Left = 288
    Top = 400
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
    Top = 400
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
    Top = 424
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
      'select data,'
      '       case when pl.tipo = '#39'A'#39' then'
      
        '         cast(pl.classificacao||trim(to_char(pl.codigo,'#39'000000'#39')' +
        ') as varchar(28))'
      '       else'
      '         cast(pl.classificacao as varchar(28))'
      '       end as cod_cta,'
      ''
      
        '       case when (saldocontabil - valorencerramento)  >=0 then c' +
        'ast('#39'D'#39' as char(1))'
      '                                   else cast('#39'C'#39' as char(1))'
      '       end as ind_dc,'
      '       abs((saldocontabil - valorencerramento)) as vl_cta'
      'from'
      '('
      'select data,'
      '       conta,'
      '       saldocontabil(conta,:filial, data) as saldocontabil,'
      '       valorencerramento as valorencerramento'
      'from'
      '('
      ' select data, conta,'
      
        '        sum(valorencerramentodebitos-valorencerramentocreditos) ' +
        'as valorencerramento'
      ' from'
      ' ('
      ''
      ''
      '  select data,'
      '         debitar as conta,'
      '         sum(valor) as valorencerramentodebitos,'
      '         0.00 as valorencerramentocreditos'
      '  from lancamentos'
      '  where filial = :filial'
      '    and data between :datainicial and :datafinal'
      '    and origem='#39'X'#39
      '    and debitar is not null'
      '  group by data, debitar'
      ''
      ''
      ''
      '   union all'
      ''
      ''
      '   select data,'
      '          creditar as conta,'
      '          0.00 as valorencerramentodebitos,'
      '          sum(valor) as valorencerramentocreditos'
      '   from lancamentos'
      '   where filial = :filial'
      '     and data between :datainicial and :datafinal'
      '     and origem='#39'X'#39
      '     and creditar is not null'
      '   group by data, creditar'
      ' ) as selecao'
      '  group by data, conta'
      ''
      ')  as selecao'
      ') as selecao join planocontas pl on selecao.conta = pl.codigo'
      'where abs((saldocontabil - valorencerramento))<>0'
      '  and pl.natureza in ('#39'R'#39','#39'D'#39')'
      'order by data, pl.classificacao, pl.codigo')
    RequestLive = False
    Left = 168
    Top = 448
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
      FieldName = 'vl_cta'
      DisplayFormat = '0.00'
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
      'select saldos.cod_agl,'
      '       saldos.nivel_agl,'
      '       saldos.ind_grp_bal,'
      '       saldos.descr_cod_agl,'
      '       abs(saldocontabil) as vl_cta,'
      '       case when saldocontabil >= 0 then'
      '         cast('#39'D'#39' as char(1))'
      '       else'
      '         cast('#39'C'#39' as char(1)) end as ind_dc_bal'
      'from'
      '  ('
      '      select case when pc.tipo = '#39'A'#39' then'
      
        '               cast(pc.classificacao||trim(to_char(pc.codigo,'#39'00' +
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
      
        '             saldocontabil(pc.codigo,sc.filial, :datafinal) as s' +
        'aldocontabil'
      ''
      '      from planocontas pc'
      '           join saldoscontabeis sc'
      '                 join filiais f'
      '                 on sc.filial = f.codigo'
      '           on pc.codigo = sc.conta'
      ''
      
        '      where (contacommovto(pc.codigo, :filial, cast(:datainicial' +
        ' as date), cast(:datafinal as date)) or sc.saldoanterior<>0)'
      '        and sc.exercicio = :exercicio'
      '        and sc.filial = :filial'
      '        and pc.demosped'
      '        and pc.natureza in ('#39'A'#39','#39'P'#39','#39'L'#39')'
      ''
      '   ) as saldos'
      '   where abs(saldocontabil)<>0'
      '   order by cod_agl')
    RequestLive = False
    Left = 256
    Top = 512
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
        DataType = ftUnknown
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
  end
  object qryRegistroI052: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnFilterRecord = qryRegistroI052FilterRecord
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
    Left = 184
    Top = 88
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
    object qryRegistroI052cod_agl: TStringField
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
      'select saldos.cod_agl,'
      '       saldos.nivel_agl,'
      '       saldos.descr_cod_agl,'
      
        '       abs(saldocontabil - (valordebitosencerramento - valorcred' +
        'itosencerramento)) as vl_cta,'
      ''
      '       /*'
      
        '       cast(case when saldos.ind_vl in ('#39'R'#39','#39'D'#39') then saldos.ind' +
        '_vl'
      
        '                 when (saldocontabil - (valordebitosencerramento' +
        ' - valorcreditosencerramento)) > 0 then '#39'P'#39
      '                 else '#39'N'#39
      '       end as char(1)) as ind_vl'
      '       */'
      ''
      
        '       cast(case when (saldocontabil - (valordebitosencerramento' +
        ' - valorcreditosencerramento)) > 0 then  case when saldos.tipo =' +
        ' '#39'A'#39' then '#39'D'#39' else '#39'N'#39' end'
      
        '                 else case when saldos.tipo = '#39'A'#39' then '#39'R'#39' else ' +
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
      
        '             saldocontabil(pc.codigo,sc.filial, :datafinal) as s' +
        'aldocontabil,'
      ''
      '             case when pc.tipo='#39'S'#39' then'
      '               coalesce((select sum(l.valor)'
      
        '                         from lancamentos l join planocontas pl ' +
        'on l.debitar = pl.codigo'
      
        '                         where l.data between :datainicial and :' +
        'datafinal'
      '                           and l.origem = '#39'X'#39
      '                           and l.filial = :filial'
      
        '                           and position(pc.classificacao in pl.c' +
        'lassificacao)=1),0)'
      '             else'
      '               coalesce((select sum(l.valor)'
      
        '                         from lancamentos l join planocontas pl ' +
        'on l.debitar = pl.codigo'
      
        '                         where l.data between :datainicial and :' +
        'datafinal'
      '                           and l.origem = '#39'X'#39
      '                           and l.filial = :filial'
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
      
        '                         from lancamentos l join planocontas pl ' +
        'on l.creditar = pl.codigo'
      
        '                         where l.data between :datainicial and :' +
        'datafinal'
      '                          and l.origem = '#39'X'#39
      '                          and l.filial = :filial'
      
        '                          and position(trim(pc.classificacao) in' +
        ' trim(pl.classificacao))=1),0)'
      '             else'
      '               coalesce((select sum(l.valor)'
      
        '                         from lancamentos l join planocontas pl ' +
        'on l.creditar = pl.codigo'
      
        '                         where l.data between :datainicial and :' +
        'datafinal'
      '                           and l.origem = '#39'X'#39
      '                           and l.filial = :filial'
      '                           and position('
      
        '                                cast(pc.classificacao||trim(to_c' +
        'har(pc.codigo,'#39'000000'#39')) as varchar(28)) in'
      
        '                                cast(pl.classificacao||trim(to_c' +
        'har(pl.codigo,'#39'000000'#39')) as varchar(28)))=1),0)'
      '             end as valorcreditosencerramento'
      ''
      '      from planocontas pc'
      '           join saldoscontabeis sc'
      '                 join filiais f'
      '                 on sc.filial = f.codigo'
      '           on pc.codigo = sc.conta'
      ''
      
        '      where (contacommovto(pc.codigo, :filial, cast(:datainicial' +
        ' as date), cast(:datafinal as date)) or sc.saldoanterior<>0)'
      '        and sc.exercicio = :exercicio'
      '        and sc.filial = :filial'
      '        and pc.demosped'
      '        and pc.natureza in ('#39'D'#39','#39'R'#39')'
      ''
      ''
      '   ) as saldos'
      
        '   where abs(saldocontabil - (valordebitosencerramento - valorcr' +
        'editosencerramento))<>0'
      '   order by cod_agl')
    RequestLive = False
    Left = 272
    Top = 568
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
        DataType = ftUnknown
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
    Top = 640
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
    Left = 296
    Top = 192
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
end
