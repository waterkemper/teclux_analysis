inherited dtmrelatoriofluxodecaixa: Tdtmrelatoriofluxodecaixa
  OldCreateOrder = False
  Left = 159
  Top = 103
  Height = 498
  Width = 695
  object qryFiliais: TtecQuery
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
      'select codigo, nome'
      'from filiais'
      'where codigo=:codigo')
    RequestLive = True
    Left = 435
    Top = 79
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryFiliaiscodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryFiliaisnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
  end
  object dsrFiliais: TtecDataSource
    DataSet = qryFiliais
    Left = 435
    Top = 136
  end
  object qryGrupoFiliais: TtecQuery
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
      'select codigo, '
      '         descricao'
      'from gruposfiliais'
      'where codigo=:codigo')
    RequestLive = True
    Left = 587
    Top = 79
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryGrupoFiliaiscodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryGrupoFiliaisdescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
  end
  object dsrGrupoFiliais: TtecDataSource
    DataSet = qryGrupoFiliais
    Left = 587
    Top = 136
  end
  object qryConsultaFiliais: TtecQuery
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
      'select codigo,nome'
      'from filiais'
      'order by UPPER(TO_ASCII(nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 436
    Top = 193
    object qryConsultaFiliaisnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaFiliaiscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
  object qryConsultaGrupoFiliais: TtecQuery
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
      'select codigo,descricao'
      'from gruposfiliais'
      'order by UPPER(TO_ASCII(descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 587
    Top = 193
    object qryConsultaGrupoFiliaisdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
    object qryConsultaGrupoFiliaiscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
  object qryTotalizacao: TtecQuery
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
      'select '
      '    cast(0 as integer) as GrupoFilial,'
      '    cast(0 as integer) as filial,'
      '    cast(null as Date) as data,'
      '    cast(0 as integer) as TRegistros,'
      '    cast(0 as Numeric) as TVlrRec,'
      '    cast(0 as Numeric) as TJurosRec,'
      '    cast(0 as Numeric) as TTotalRec,'
      '    cast(0 as Numeric) as TVlraRec,'
      '    cast(0 as Numeric) as TJurosaRec,'
      '    cast(0 as Numeric) as TTotalaRec,'
      '    cast(0 as Numeric) as TVlrPag,'
      '    cast(0 as Numeric) as TJurosPag,'
      '    cast(0 as Numeric) as TTotalPag,'
      '    cast(0 as Numeric) as TVlraPag,'
      '    cast(0 as Numeric) as TJurosaPag,'
      '    cast(0 as Numeric) as TTotalaPag,'
      '    cast(0 as Numeric) as TTSaldo,'
      '    cast(0 as Numeric) as TVlraRec_Ant,'
      '    cast(0 as Numeric) as TVlraPag_Ant,   '
      '    cast(0 as Numeric) as TTVlraRec_Ant,'
      '    cast(0 as Numeric) as TTVlraPag_Ant,'
      '    cast(0 as Numeric) as TTSaldo_Ant,'
      '    cast('#39'N'#39' as varchar) as JaTotalizado')
    RequestLive = True
    Left = 80
    Top = 264
    object qryTotalizacaogrupofilial: TIntegerField
      FieldName = 'grupofilial'
      DisplayFormat = '0'
    end
    object qryTotalizacaofilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryTotalizacaotregistros: TIntegerField
      FieldName = 'tregistros'
      DisplayFormat = '0'
    end
    object qryTotalizacaotvlrrec: TFloatField
      FieldName = 'tvlrrec'
      DisplayFormat = '0.00'
    end
    object qryTotalizacaotjurosrec: TFloatField
      FieldName = 'tjurosrec'
      DisplayFormat = '0.00'
    end
    object qryTotalizacaottotalrec: TFloatField
      FieldName = 'ttotalrec'
      DisplayFormat = '0.00'
    end
    object qryTotalizacaotvlrarec: TFloatField
      FieldName = 'tvlrarec'
      DisplayFormat = '0.00'
    end
    object qryTotalizacaotjurosarec: TFloatField
      FieldName = 'tjurosarec'
      DisplayFormat = '0.00'
    end
    object qryTotalizacaottotalarec: TFloatField
      FieldName = 'ttotalarec'
      DisplayFormat = '0.00'
    end
    object qryTotalizacaotvlrpag: TFloatField
      FieldName = 'tvlrpag'
      DisplayFormat = '0.00'
    end
    object qryTotalizacaotjurospag: TFloatField
      FieldName = 'tjurospag'
      DisplayFormat = '0.00'
    end
    object qryTotalizacaottotalpag: TFloatField
      FieldName = 'ttotalpag'
      DisplayFormat = '0.00'
    end
    object qryTotalizacaotvlrapag: TFloatField
      FieldName = 'tvlrapag'
      DisplayFormat = '0.00'
    end
    object qryTotalizacaotjurosapag: TFloatField
      FieldName = 'tjurosapag'
      DisplayFormat = '0.00'
    end
    object qryTotalizacaottotalapag: TFloatField
      FieldName = 'ttotalapag'
      DisplayFormat = '0.00'
    end
    object qryTotalizacaojatotalizado: TStringField
      FieldName = 'jatotalizado'
      Size = 1
    end
    object qryTotalizacaottsaldo: TFloatField
      FieldName = 'ttsaldo'
      DisplayFormat = '0.00'
    end
    object qryTotalizacaodata: TDateField
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object qryTotalizacaottvlrarec_ant: TFloatField
      FieldName = 'ttvlrarec_ant'
      DisplayFormat = '0.00'
    end
    object qryTotalizacaottvlrapag_ant: TFloatField
      FieldName = 'ttvlrapag_ant'
      DisplayFormat = '0.00'
    end
    object qryTotalizacaottsaldo_ant: TFloatField
      FieldName = 'ttsaldo_ant'
      DisplayFormat = '0.00'
    end
    object qryTotalizacaotvlrarec_ant: TFloatField
      FieldName = 'tvlrarec_ant'
      DisplayFormat = '0.00'
    end
    object qryTotalizacaotvlrapag_ant: TFloatField
      FieldName = 'tvlrapag_ant'
      DisplayFormat = '0.00'
    end
  end
  object qryFluxoporEvento: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryFluxoporEventoAfterOpen
    AfterScroll = qryFluxoporEventoAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'WhereFilialVenda'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WhereFilial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WhereFilialEmissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Ordenacao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      '/*INICIO SALDO ANTERIOR*/'
      '('
      'select DATAS.*,'
      '        ACUMULADO.vlrarec,'
      '        ACUMULADO.descricaoevento_c,'
      '        ACUMULADO.vlrapag,'
      '        ACUMULADO.descricaoevento_d,'
      '        cast('#39'1 - SALDO ANTERIOR'#39' as varchar) as operacao,'
      #9'False as Totalizado'
      '  from'
      '('
      '('
      
        ' select   grupofilial,  nomegrupofilial,  filial, nomefilial, ca' +
        'st('#39'30/12/1899'#39' as date) as data'
      ' from'
      ' ('
      '  ('
      '   ('
      
        '    select  case when   :AgruparGrupoFilial    then fgf.grupo el' +
        'se cast(0 as integer) end as grupofilial,'
      
        '            case when :AgruparGrupoFilial    then gf.descricao e' +
        'lse null end as nomegrupofilial,'
      
        '            case when :AgruparFilial   then ct.filialvenda else ' +
        'cast(0 as integer) end as filial,'
      
        '            case when :AgruparFilial   then f.nome else null end' +
        ' as nomefilial'
      '    from ((contratos ct join parcelas p on ct.numero=p.contrato)'
      '                      join (filiais f'
      
        '  '#9#9'     left join (filiaisgruposfiliais fgf join gruposfiliais ' +
        'gf on fgf.grupo=gf.codigo)'
      '                       on f.codigo=fgf.filial)'
      '                      on ct.filialvenda=f.codigo)'
      '    where p.datapagto is null and (p.tipopagto is null) and'
      
        '        p.datavencto between (:DataInicialAcumulado) and (:DataF' +
        'inalAcumulado) and'
      
        '        ct.situacao in ('#39'F'#39','#39'N'#39','#39'P'#39') and not (contratos_renegoci' +
        'ado(ct.numero))'
      '              %WhereFilialVenda'
      
        '    order by UPPER(TO_ASCII(gf.descricao,'#39'LATIN1'#39')), fgf.grupo, ' +
        'f.nome, ct.filialvenda, p.datavencto'
      '   )'
      '   union'
      '   ('
      
        '    select  case when :AgruparGrupoFilial then fgf.grupo else ca' +
        'st(0 as integer) end as grupofilial,'
      
        '            case when :AgruparGrupoFilial then gf.descricao else' +
        ' null end as nomegrupofilial,'
      
        '            case when :AgruparFilial      then r.filial else cas' +
        't(0 as integer) end as filial,'
      
        '            case when :AgruparFilial      then f.nome else null ' +
        'end as nomefilial'
      '    from (recebimentos r join (filiais f '
      
        '                                   left join (filiaisgruposfilia' +
        'is fgf join gruposfiliais gf on fgf.grupo=gf.codigo)'
      '                                    on f.codigo = fgf.filial)'
      '                                  on r.filial = f.codigo)'
      
        '    where r.datavencto between (:DataInicialAcumulado) and (:Dat' +
        'aFinalAcumulado)'
      '      and not coalesce(r.confirmado,false)'
      '      and r.cheque is null'
      '      and r.situacao = '#39'N'#39
      '    %WhereFilial'
      
        '    order by  UPPER(TO_ASCII(gf.descricao,'#39'LATIN1'#39')), fgf.grupo,' +
        ' f.nome, r.filial, r.datavencto'
      '   )'
      '  ) '
      '  ) AS RECEBIMENTOS'
      
        '  group by nomegrupofilial, grupofilial, nomefilial, filial, dat' +
        'a'
      ')'
      'union'
      '('
      
        ' select   grupofilial,  nomegrupofilial,  filial, nomefilial, ca' +
        'st('#39'30/12/1899'#39' as date) as data'
      ' from'
      ' ('
      
        '   select    case when  :AgruparGrupoFilial    then fgf.grupo el' +
        'se cast(0 as integer) end as grupofilial,'
      
        '             case when  :AgruparGrupoFilial    then gf.descricao' +
        ' else null end as nomegrupofilial,'
      
        '             case when  :AgruparFilial   then dp.filialemissao e' +
        'lse cast(0 as integer) end as filial,'
      
        '             case when  :AgruparFilial   then f.nome else null e' +
        'nd as nomefilial'
      
        '  from ((documentospag dp join duplicatas d on dp.numero=d.docum' +
        'entopag)'
      '                         join (filiais f'
      
        #9#9#9'  left join (filiaisgruposfiliais fgf join gruposfiliais gf o' +
        'n fgf.grupo=gf.codigo)'
      '                          on f.codigo=fgf.filial)'
      '                         on dp.filialemissao=f.codigo)'
      '  where d.datapagto is null and'
      
        '      d.datavencto between (:DataInicialAcumulado) and (:DataFin' +
        'alAcumulado)'
      '             %WhereFilialEmissao'
      
        ' order by UPPER(TO_ASCII(gf.descricao,'#39'LATIN1'#39')), fgf.grupo, f.n' +
        'ome, dp.filialemissao, d.datavencto'
      ' ) AS PAGAMENTOS'
      ' group by nomegrupofilial, grupofilial, nomefilial, filial, data'
      ')'
      ') as DATAS'
      ' left join'
      '  ('
      '   ('
      
        '    select   grupofilial,  filial, cast('#39'30/12/1899'#39' as date) as' +
        ' data,'
      '             descricaoevento_c,'
      #9'     cast(null as varchar) as descricaoevento_d,'
      #9'     sum(valorvencto) as vlrarec,'
      #9'     0.00 as vlrapag'
      '    from'
      '    ('
      '     ('
      
        '      select  case when  :agrupargrupofilial then fgf.grupo else' +
        ' cast(0 as integer) end as grupofilial,'
      
        '              case when :agruparfilial   then ct.filialvenda els' +
        'e cast(0 as integer) end as filial,'
      '              p.valorvencto,'
      
        '              cast('#39'PRESTACOES EM ABERTO'#39' as varchar) as descric' +
        'aoevento_c'
      
        '      from ((contratos ct join parcelas p on ct.numero=p.contrat' +
        'o)'
      
        '                          left join filiaisgruposfiliais fgf on ' +
        'ct.filialvenda=fgf.filial)'
      '      where p.datapagto is null and (p.tipopagto is null) and'
      
        '            p.datavencto between (:datainicialacumulado) and (:d' +
        'atafinalacumulado) and'
      
        '            ct.situacao in ('#39'f'#39','#39'n'#39','#39'p'#39') and not (contratos_rene' +
        'gociado(ct.numero))'
      '              %wherefilialvenda'
      '      order by fgf.grupo, ct.filialvenda, p.datavencto'
      '     )'
      '     union all'
      '     ('
      
        '      select  case when :AgruparGrupoFilial then fgf.grupo else ' +
        'cast(0 as integer) end as grupofilial,'
      
        '              case when :AgruparFilial      then r.filial else c' +
        'ast(0 as integer) end as filial,'
      '              r.valorvencto,'
      '              tr.descricao as descricaoevento_c'
      
        '      from ((recebimentos r join tiposrecebimentos tr on r.tipor' +
        'ecebimento = tr.codigo)'
      
        '                           left join filiaisgruposfiliais fgf on' +
        ' r.filial = fgf.filial)'
      
        '      where r.datavencto between (:DataInicialAcumulado) and (:D' +
        'ataFinalAcumulado)'
      '        and not coalesce(r.confirmado,false)'
      '        and r.cheque is null'
      '        and r.situacao = '#39'N'#39
      '      %WhereFilial'
      '      order by fgf.grupo, r.filial, r.datavencto      '
      '     )'
      '    ) AS RECEBIMENTOS'
      '    group by grupofilial, filial, data, descricaoevento_c'
      '   )'
      '   union all'
      '   ('
      
        '    select  grupofilial, filial, cast('#39'30/12/1899'#39' as date) as d' +
        'ata,'
      #9'    cast(null as varchar) as descricaoevento_c,'
      
        '            cast(descricaoevento_d as varchar) as descricaoevent' +
        'o_d,'
      #9'    0.00 as vlrarec, sum(valorvencto) as vlrapag'
      '    from'
      '    ('
      
        '     select  case when :AgruparGrupoFilial   then fgf.grupo else' +
        ' cast(0 as integer) end as grupofilial,'
      
        '             case when :AgruparFilial   then dp.filialemissao el' +
        'se cast(0 as integer) end as filial,'
      '             d.valorvencto,'
      
        '             coalesce(e.descricao, '#39'PAGAMENTOS EM ABERTO'#39') as de' +
        'scricaoevento_d'
      
        '     from (((documentospag dp join duplicatas d on dp.numero=d.d' +
        'ocumentopag)'
      
        '                          left join eventos e on dp.evento=e.cod' +
        'igo)'
      
        '                             left join filiaisgruposfiliais fgf ' +
        'on dp.filialemissao = fgf.filial)'
      '     where d.datapagto is null and'
      
        '           d.datavencto between (:DataInicialAcumulado) and (:Da' +
        'taFinalAcumulado)'
      '             %WhereFilialEmissao'
      '     order by fgf.grupo, dp.filialemissao, d.datavencto'
      '    ) AS PAGAMENTOS'
      '   group by grupofilial, filial, data, descricaoevento_d'
      '   )'
      '  ) as ACUMULADO ON'
      '    DATAS.grupofilial = ACUMULADO.grupofilial and'
      '    DATAS.filial = ACUMULADO.filial and'
      '    DATAS.data = ACUMULADO.data'
      ')'
      'union all'
      '/*FINAL SALDO ANTERIOR*/'
      ''
      ''
      '/* DEFINI'#199#195'O DO SALDO INICIAL INFORMADO */'
      '('
      ' select   grupofilial,  nomegrupofilial,  filial, nomefilial,'
      '          cast('#39'30/12/1899'#39' as date) as data,'
      '          vlrarec,'
      '          cast('#39'SALDO INICIAL'#39' as varchar) as descricaoevento_c,'
      '          cast(0 as numeric) as vlraPag,'
      '          cast(null as varchar) as descricaoevento_d,'
      
        '          cast('#39'2 - SALDO INICIAL'#39' as varchar) as operacao, Fals' +
        'e as Totalizado'
      ' from'
      ' ('
      '   select    cast(0 as integer) as grupofilial,'
      '             cast(null as varchar) as nomegrupofilial,'
      '             cast(0 as integer) as filial,'
      '             cast(null as varchar) as nomefilial,'
      '             cast(:SaldoInicial as numeric) as vlraRec'
      ' ) as TOTALSALDOINICIAL'
      ')'
      '/* FIM DA DEFINI'#199#195'O DO SALDO INICIAL INFORMADO */'
      ''
      '/* INICIO DA DEFINI'#199#195'O DAS LINHAS DE DETALHE DO FLUXO */'
      'union all'
      '('
      'select DATAS.*,'
      '        DETALHE.vlrarec,'
      '        DETALHE.descricaoevento_c,'
      '        DETALHE.vlrapag,'
      '        DETALHE.descricaoevento_d,'
      
        '        cast('#39'3 - RELATORIO'#39' as varchar) as operacao, False as T' +
        'otalizado'
      '  from'
      '('
      '('
      
        ' select   grupofilial,  nomegrupofilial,  filial, nomefilial, da' +
        'ta'
      ' from'
      ' ('
      '    select grupofilial,nomegrupofilial,filial,nomefilial,'
      '             primeirodiautil(filial,data,'#39'R'#39') as data'
      '    from'
      '    ('
      '      ('
      
        '        select    case when  :AgruparGrupoFilial    then fgf.gru' +
        'po else cast(0 as integer) end as grupofilial,'
      
        '                  case when  :AgruparGrupoFilial    then gf.desc' +
        'ricao else null end as nomegrupofilial,'
      
        '                  case when  :AgruparFilial   then ct.filialvend' +
        'a else cast(0 as integer) end as filial,'
      
        '                  case when  :AgruparFilial   then f.nome else n' +
        'ull end as nomefilial,'
      '                  p.datavencto as data'
      
        '        from ((contratos ct join parcelas p on ct.numero=p.contr' +
        'ato)'
      '                         join (filiais f'
      
        '  '#9'   '#9'     left join (filiaisgruposfiliais fgf join gruposfilia' +
        'is gf on fgf.grupo=gf.codigo)'
      '                       on f.codigo=fgf.filial)'
      '                      on ct.filialvenda=f.codigo)'
      '        where p.datapagto is null'
      '          and p.tipopagto is null'
      
        '          and p.datavencto between (:DataInicial) and (:DataFina' +
        'l)'
      
        '          and ct.situacao in ('#39'F'#39','#39'N'#39','#39'P'#39') and not (contratos_re' +
        'negociado(ct.numero))'
      '          %WhereFilialVenda'
      
        '        order by UPPER(TO_ASCII(gf.descricao,'#39'LATIN1'#39')), fgf.gru' +
        'po, UPPER(TO_ASCII(f.nome,'#39'LATIN1'#39')), ct.filialvenda, p.datavenc' +
        'to'
      '      )'
      '       union all'
      '     ('
      
        '        select  case when :AgruparGrupoFilial then fgf.grupo    ' +
        'else cast(0 as integer) end as grupofilial,'
      
        '                case when :AgruparGrupoFilial then gf.descricao ' +
        'else null               end as nomegrupofilial,'
      
        '                case when :AgruparFilial      then r.filial     ' +
        'else cast(0 as integer) end as filial,'
      
        '                case when :AgruparFilial      then f.nome       ' +
        'else null               end as nomefilial,'
      '                r.datavencto as data'
      '        from (recebimentos r join (filiais f '
      
        '                                   left join (filiaisgruposfilia' +
        'is fgf join gruposfiliais gf on fgf.grupo=gf.codigo)'
      '                                    on f.codigo = fgf.filial)'
      '                                  on r.filial = f.codigo)'
      
        '        where r.datavencto between (:DataInicial) and (:DataFina' +
        'l)'
      '          and not coalesce(r.confirmado,false)'
      '          and r.cheque is null'
      '          and r.situacao = '#39'N'#39
      '        %WhereFilial'
      '        order by fgf.grupo, r.filial, r.datavencto       '
      '      ) '
      '       union all'
      '     ('
      
        '        select  case when :AgruparGrupoFilial then fgf.grupo    ' +
        'else cast(0 as integer) end as grupofilial,'
      
        '                case when :AgruparGrupoFilial then gf.descricao ' +
        'else null               end as nomegrupofilial,'
      
        '                case when :AgruparFilial      then ch.filial    ' +
        ' else cast(0 as integer) end as filial,'
      
        '                case when :AgruparFilial      then f.nome       ' +
        'else null               end as nomefilial,'
      '                ch.vencto as data'
      '        from (cheques ch join (filiais f '
      
        '                               left join (filiaisgruposfiliais f' +
        'gf join gruposfiliais gf on fgf.grupo=gf.codigo)'
      '                                    on f.codigo = fgf.filial)'
      '                                  on ch.filial = f.codigo)'
      '        where ch.vencto between (:DataInicial) and (:DataFinal)'
      '          and ch.situacao = '#39'N'#39
      '        %WhereFilial'
      '        order by fgf.grupo, ch.filial, ch.vencto'
      '      ) '
      '   ) AS RECEBIMENTOS'
      ' ) AS RECEBIMENTOS'
      
        '  group by nomegrupofilial, grupofilial, nomefilial, filial, dat' +
        'a'
      ')'
      'union'
      '('
      
        ' select   grupofilial,  nomegrupofilial,  filial, nomefilial, da' +
        'ta'
      ' from'
      ' ('
      '    select grupofilial,nomegrupofilial,filial,nomefilial,'
      '             primeirodiautil(filial,data,'#39'P'#39') as data'
      '    from'
      '    ('
      
        '     select    case when :AgruparGrupoFilial    then fgf.grupo e' +
        'lse cast(0 as integer) end as grupofilial,'
      
        '               case when :AgruparGrupoFilial    then gf.descrica' +
        'o else null end as nomegrupofilial,'
      
        '               case when :AgruparFilial   then dp.filialemissao ' +
        'else cast(0 as integer) end as filial,'
      
        '               case when :AgruparFilial   then f.nome else null ' +
        'end as nomefilial,'
      '               d.datavencto as data'
      
        '     from ((documentospag dp join duplicatas d on dp.numero=d.do' +
        'cumentopag)'
      '                         join (filiais f'
      
        #9#9#9'  left join (filiaisgruposfiliais fgf join gruposfiliais gf o' +
        'n fgf.grupo=gf.codigo)'
      '                          on f.codigo=fgf.filial)'
      '                         on dp.filialemissao=f.codigo)'
      '     where d.datapagto is null'
      '       and d.datavencto between (:DataInicial) and (:DataFinal)'
      '           %WhereFilialEmissao'
      
        '     order by UPPER(TO_ASCII(gf.descricao,'#39'LATIN1'#39')), fgf.grupo,' +
        ' UPPER(TO_ASCII(f.nome,'#39'LATIN1'#39')), dp.filialemissao, d.datavenct' +
        'o'
      '   ) AS PAGAMENTOS'
      ' ) AS PAGAMENTOS'
      ' group by nomegrupofilial, grupofilial, nomefilial, filial, data'
      ')'
      ') as DATAS'
      ''
      ' left join'
      ' ('
      '  ('
      '   select   grupofilial,  filial, data,'
      '            descricaoevento_c,'
      #9'    cast(null as varchar) as descricaoevento_d,'
      #9'    sum(valorvencto) as vlrarec,'
      #9'    0.00 as vlrapag'
      '   from'
      '   ('
      
        '     select grupofilial, filial, primeirodiautil(filial,data,'#39'R'#39 +
        ') as data, valorvencto, descricaoevento_c'
      '     from'
      '     ('
      '      ('
      
        '        select   case when :AgruparGrupoFilial    then fgf.grupo' +
        ' else cast(0 as integer) end as grupofilial,'
      
        '                 case when :AgruparFilial   then ct.filialvenda ' +
        'else cast(0 as integer) end as filial,'
      '                 p.datavencto as data,'
      '                 P.valorvencto,'
      
        '                 cast('#39'PRESTACOES DE CONTRATOS'#39' as varchar) as d' +
        'escricaoevento_c'
      
        '        from ((contratos ct join parcelas p on ct.numero=p.contr' +
        'ato)'
      
        '                          left join filiaisgruposfiliais fgf on ' +
        'ct.filialvenda=fgf.filial)'
      '        where p.datapagto is null and (p.tipopagto is null) and'
      
        '              p.datavencto between (:DataInicial) and (:DataFina' +
        'l) and'
      
        '              ct.situacao in ('#39'F'#39','#39'N'#39','#39'P'#39') and not (contratos_re' +
        'negociado(ct.numero))'
      '                 %WhereFilialVenda'
      '        order by fgf.grupo, ct.filialvenda, p.datavencto'
      '      )'
      '       union all'
      '      ('
      
        '        select  case when :AgruparGrupoFilial then fgf.grupo    ' +
        'else cast(0 as integer) end as grupofilial,'
      
        '                case when :AgruparFilial      then r.filial     ' +
        'else cast(0 as integer) end as filial,'
      '                r.datavencto as data,'
      '                r.valorvencto,'
      '                tr.descricao as descricaoevento_c'
      
        '          from ((recebimentos r join tiposrecebimentos tr on r.t' +
        'iporecebimento = tr.codigo) '
      '                                join (filiais f left join '
      
        '                                              (filiaisgruposfili' +
        'ais fgf join gruposfiliais gf on fgf.grupo=gf.codigo)'
      '                                    on f.codigo = fgf.filial)'
      '                                  on r.filial = f.codigo)'
      
        '          where r.datavencto between (:DataInicial) and (:DataFi' +
        'nal)'
      '            and not coalesce(r.confirmado,false)'
      '            and r.cheque is null'
      '            and r.situacao = '#39'N'#39
      '          %WhereFilial'
      '          order by fgf.grupo, r.filial, r.datavencto       '
      '      ) '
      '       union all'
      '      ('
      
        '          select  case when :AgruparGrupoFilial then fgf.grupo  ' +
        '  else cast(0 as integer) end as grupofilial,'
      
        '                  case when :AgruparFilial      then ch.filial  ' +
        '   else cast(0 as integer) end as filial,'
      '                  ch.vencto as data,'
      '                  ch.valor as valorvencto,'
      
        '                  cast('#39'CHEQUES'#39' as varchar) as descricaoevento_' +
        'c'
      '        from (cheques ch join (filiais f '
      
        '                               left join (filiaisgruposfiliais f' +
        'gf join gruposfiliais gf on fgf.grupo=gf.codigo)'
      '                                    on f.codigo = fgf.filial)'
      '                                  on ch.filial = f.codigo)'
      
        '          where ch.vencto between (:DataInicial) and (:DataFinal' +
        ')'
      '            and ch.situacao = '#39'N'#39
      '          %WhereFilial'
      '          order by fgf.grupo, ch.filial, ch.vencto'
      '      ) '
      '     ) AS RECEBIMENTOS'
      '   ) AS RECEBIMENTOS'
      '    group by grupofilial, filial, data, descricaoevento_c'
      '   )'
      '   union all'
      '   ('
      '     select   grupofilial, filial, data,'
      #9'      cast(null as varchar) as descricaoevento_c,'
      
        '              cast(descricaoevento_d as varchar) as descricaoeve' +
        'nto_d,'
      '  '#9'      0.00 as vlrarec,'
      #9'      sum(valorvencto) as vlrapag'
      '     from'
      '     ('
      
        '      select grupofilial, filial, primeirodiautil(filial, data, ' +
        #39'P'#39') as data, valorvencto, descricaoevento_d'
      '      from'
      '      ('
      
        '      select  case when :AgruparGrupoFilial    then fgf.grupo el' +
        'se cast(0 as integer) end as grupofilial,'
      
        '              case when :AgruparFilial   then dp.filialemissao e' +
        'lse cast(0 as integer) end as filial,'
      '              d.datavencto as data,'
      '              d.valorvencto,'
      
        '              coalesce(e.descricao, '#39'OUTROS PAGAMENTOS'#39') as desc' +
        'ricaoevento_d'
      
        '      from (((documentospag dp join duplicatas d on dp.numero=d.' +
        'documentopag)'
      
        '                           left join eventos e on dp.evento = e.' +
        'codigo)'
      
        '                              left join filiaisgruposfiliais fgf' +
        ' on dp.filialemissao = fgf.filial)'
      '      where d.datapagto is null and'
      '            d.datavencto between (:DataInicial) and (:DataFinal)'
      '              %WhereFilialEmissao'
      '      order by fgf.grupo, dp.filialemissao, d.datavencto'
      '     ) AS PAGAMENTOS'
      '     ) AS PAGAMENTOS'
      '     group by grupofilial, filial, data, descricaoevento_d'
      '   )'
      '  ) as DETALHE ON'
      '    DATAS.grupofilial = DETALHE.grupofilial and'
      '    DATAS.filial = DETALHE.filial and'
      '    DATAS.data = DETALHE.data'
      ')'
      '%Ordenacao'
      '')
    RequestLive = True
    Left = 80
    Top = 344
    ParamData = <
      item
        DataType = ftString
        Name = 'AgruparGrupoFilial'
        ParamType = ptUnknown
        Value = 'False'
      end
      item
        DataType = ftString
        Name = 'AgruparFilial'
        ParamType = ptUnknown
        Value = 'False'
      end
      item
        DataType = ftDate
        Name = 'DataInicialAcumulado'
        ParamType = ptUnknown
        Value = #39'30/12/1899'#39
      end
      item
        DataType = ftDate
        Name = 'DataFinalAcumulado'
        ParamType = ptUnknown
        Value = #39'05/09/2005'#39
      end
      item
        DataType = ftString
        Name = 'SaldoInicial'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftDate
        Name = 'DataInicial'
        ParamType = ptUnknown
        Value = #39'06/09/2005'#39
      end
      item
        DataType = ftDate
        Name = 'DataFinal'
        ParamType = ptUnknown
        Value = #39'26/09/2005'#39
      end>
    object qryFluxoporEventogrupofilial: TIntegerField
      FieldName = 'grupofilial'
      DisplayFormat = '0'
    end
    object qryFluxoporEventonomegrupofilial: TStringField
      FieldName = 'nomegrupofilial'
      Size = 50
    end
    object qryFluxoporEventofilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryFluxoporEventonomefilial: TStringField
      FieldName = 'nomefilial'
      Size = 50
    end
    object qryFluxoporEventodata: TDateField
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object qryFluxoporEventovlrarec: TFloatField
      FieldName = 'vlrarec'
      DisplayFormat = '0.00'
    end
    object qryFluxoporEventovlrapag: TFloatField
      FieldName = 'vlrapag'
      DisplayFormat = '0.00'
    end
    object qryFluxoporEventooperacao: TStringField
      FieldName = 'operacao'
      Size = 18
    end
    object qryFluxoporEventototalizado: TBooleanField
      FieldName = 'totalizado'
    end
    object qryFluxoporEventodescricaoevento_c: TStringField
      FieldName = 'descricaoevento_c'
      Size = 50
    end
    object qryFluxoporEventodescricaoevento_d: TStringField
      FieldName = 'descricaoevento_d'
      Size = 50
    end
    object qryFluxoporEventoExibirSaldo: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'ExibirSaldo'
      Calculated = True
    end
  end
  object frpFluxoporEvento: TfrReport
    Dataset = fdsFluxoporEvento
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnBeginDoc = frprelatoriofluxodecaixaBeginDoc
    OnEndDoc = frprelatoriofluxodecaixaEndDoc
    OnBeginBand = frprelatoriofluxodecaixaBeginBand
    OnGetValue = frpFluxoporEventoGetValue
    OnBeforePrint = frpFluxoporEventoBeforePrint
    Left = 224
    Top = 336
    ReportForm = {
      19000000103F000019FFFF00000A0050444643726561746F7200FFFFFFFFFF00
      000000340800009A0B0000000000002C00000000000000290000000000040000
      0000FFFF000000000000000000000000030400466F726D00FEFFFFFFDC000000
      780000007C0100002C010000041A000500626567696E0D00000D1C006966205B
      41677275706172477275706F46696C69616C5D207468656E0D0500626567696E
      0D2400204361626563616C686F477275706F46696C69616C2E76697369626C65
      3A3D747275653B0D210020526F64617065477275706F46696C69616C2E766973
      69626C653A3D747275653B0D0300656E640D0400656C73650D0500626567696E
      0D2500204361626563616C686F477275706F46696C69616C2E76697369626C65
      3A3D66616C73653B0D220020526F64617065477275706F46696C69616C2E7669
      7369626C653A3D66616C73653B0D0400656E643B0D00000D17006966205B4167
      727570617246696C69616C5D207468656E0D0500626567696E0D1F0020436162
      6563616C686F46696C69616C2E76697369626C653A3D747275653B0D1C002052
      6F6461706546696C69616C2E76697369626C653A3D747275653B0D0300656E64
      0D0400656C73650D0500626567696E0D2000204361626563616C686F46696C69
      616C2E76697369626C653A3D66616C73653B0D1D0020526F6461706546696C69
      616C2E76697369626C653A3D66616C73653B0D0400656E643B0D00000D010020
      0D0300656E640002008A0200000B005061676548656164657231000201000000
      002E000000F5020000540000003000020001000000000000000000FFFFFF1F00
      000000000000000000000000FFFF000000000002000000010000000000000001
      000000C8000000140000000100000000000002000D0300000F004D6173746572
      44617461466C75786F000201000000002E010000F50200000B00000035000500
      01000000000000000000FFFFFF1F000000001400666473466C75786F706F7248
      6973746F7269636F000000000000000100000000000002000000010000000000
      000001000000C800000014000000010000000000000200790300000C0053756D
      6172696F546F74616C0002010000000000020000F50200001A00000039000100
      01000000000000000000FFFFFF1F00000000000000000000000000FFFF000000
      000002000000010000000000000001000000C800000014000000010000000000
      0002003204000014004361626563616C686F477275706F46696C69616C000201
      00000000B0000000F50200001C0000003900100001000000000000000000FFFF
      FF1F0000000045005B4946285B41677275706172477275706F46696C69616C5D
      3D547275652C205B717279666C75786F706F726576656E746F2E22677275706F
      66696C69616C225D2C2727295D00000000000000FFFF00000000000200000001
      0000000000000001000000C800000014000000010000000000000200DC040000
      0F004361626563616C686F46696C69616C00020100000000DC000000F5020000
      1C0000003900100001000000000000000000FFFFFF1F000000003B005B494628
      5B4167727570617246696C69616C5D3D547275652C205B717279666C75786F70
      6F726576656E746F2E2266696C69616C225D2C2727295D00000000000000FFFF
      000000000002000000010000000000000001000000C800000014000000010000
      000000000200480500000C00526F6461706546696C69616C00020100000000A4
      010000F5020000190000003900110001000000000000000000FFFFFF1F000000
      00000000000000000000FFFF0000000000020000000100000000000000010000
      00C800000014000000010000000000000200B90500001100526F646170654772
      75706F46696C69616C00020100000000D0010000F50200001900000039001100
      01000000000000000000FFFFFF1F00000000000000000000000000FFFF000000
      000002000000010000000000000001000000C800000014000000010000000000
      0002004806000011004361626563616C686F4F7065726163616F000201000000
      000E010000F5020000000000003900100001000000000000000000FFFFFF1F00
      0000001E005B717279666C75786F706F726576656E746F2E226F706572616361
      6F225D00000000000000FFFF0000000000020000000100000000000000010000
      00C800000014000000010000000000000200290700001300526F646170655361
      6C646F416E746572696F720002010000000078010000F5020000120000003900
      110001000000000000000000FFFFFF1F00000000000000000000050005006265
      67696E0D2B0020206966205B6F7065726163616F5D203D202731202D2053414C
      444F20414E544552494F5227207468656E0D13002020202076697369626C6520
      3A3D20547275650D1A002020656C73652076697369626C65203A3D2046616C73
      653B20200D0300656E6400010000000000000200000001000000000000000100
      0000C800000014000000010000000000000200920700000900666276526F6461
      7065000201000000007C020000F50200000D0000003000030001000000000000
      000000FFFFFF1F00000000000000000000000000FFFF00000000000200000001
      0000000000000001000000C80000001400000001000000000000000017080000
      0A006D6D6F5A65627261646F0002002F0000002E0100009A0200000B00000003
      00000001000000000000000000FFFFFF1F2C0200000000000000000000000100
      0000000000020000000100000000090068656C76657469636100070000000000
      00000000100000000100020000000000FFFFFF00000000020000000000000000
      009708000005004D656D6F380002002E00000073000000990200000C00000043
      000F0001000000000000000000FFFFFF1F2C020000000000000000000000FFFF
      0000000000020000000100000000090068656C76657469636100070000000000
      00000000120000000100020000000000FFFFFF00000000020000000000000000
      001D09000005004D656D6F310002002E000000730000003B0000000C00000043
      000F0001000000000000000000FFFFFF1F2C0200000000000100040044415441
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      070000000000000000000A0000000100020000000000FFFFFF00000000020000
      00000000000000A809000005004D656D6F370002002F01000073000000450000
      000C00000043000F0001000000000000000000FFFFFF1F2C0200000000000100
      090041205245434542455200000000FFFF000000000002000000010000000009
      0068656C76657469636100070000000000000000000A00000001000200000000
      00FFFFFF0000000002000000000000000000320A000006004D656D6F31300002
      003002000073000000490000000C00000043000F0001000000000000000000FF
      FFFF1F2C020000000000010007004120504147415200000000FFFF0000000000
      020000000100000000090068656C76657469636100070000000000000000000A
      0000000100020000000000FFFFFF0000000002000000000000000000BA0A0000
      06004D656D6F323000020079020000730000004E0000000C00000043000F00F4
      010000000000000000FFFFFF1F2C0200000000000100050053414C444F000000
      00FFFF0000000000020000000100000000090068656C76657469636100070000
      000000000000000A0000000100020000000000FFFFFF00000000020000000000
      00000000A20B000008004D656D6F446174610002002F0000002E0100003A0000
      000B0000006300000001000000000000000000FFFFFF1F2C0200000000000100
      63005B494628646174616D6F76696D656E746F3D2730312F30312F3139303027
      2C2027416E746572696F72272C20464F524D41544441544554494D4528276464
      2F6D6D2F7979272C20535452544F4441544528646174616D6F76696D656E746F
      292920295D0000000001000000000000020000000100000006090068656C7665
      746963610007000000000000000000100000000100020000000000FFFFFF0000
      000002000000000000000000350C00000D004D656D6F56616C6F726152656300
      0200270100002E0100004D0000000B0000004300000001000000000000000000
      FFFFFF1F2C020000000000010009005B566C72615265635D0000000001000000
      000000020000000100000006090068656C766574696361000700000000000000
      0000110000000100020000000000FFFFFF0000000002000000000000000000C8
      0C00000D004D656D6F56616C6F7261506167000200300200002E010000490000
      000B0000004300000001000000000000000000FFFFFF1F2C0200000000000100
      09005B566C72615061675D000000000100000000000002000000010000000609
      0068656C76657469636100070000000000000000001100000001000200000000
      00FFFFFF0000000002000000000000000000560D000006004D656D6F38340002
      00BA000000060200005F000000110000004300000001000000000000000000FF
      FFFF1F2C02000000000001000B00544F54414C20474552414C00000000FFFF00
      00000000020000000100000000090068656C7665746963610007000000000000
      000000010000000100020000000000FFFFFF0000000002000000000000000000
      E30D000006004D656D6F38360002002301000006020000510000001100000043
      00000001000000000000000000FFFFFF1F2C02000000000001000A005B54566C
      72615265635D00000000FFFF0000000000020000000100000000090068656C76
      65746963610007000000020000000000010000000100020000000000FFFFFF00
      00000002000000000000000000700E000006004D656D6F393200020028020000
      0602000051000000110000004300000001000000000000000000FFFFFF1F2C02
      000000000001000A005B54566C72615061675D00000000FFFF00000000000200
      00000100000000090068656C7665746963610007000000020000000000010000
      000100020000000000FFFFFF00000000020000000000000000004A0F00000600
      4D656D6F32310002007B0200002E0100004C0000000B00000043000000010000
      00000000000000FFFFFF1F2C020000000000010057005B6966285B4578696269
      7253616C646F5D3D547275652C205B4946286F7065726163616F3C3E2731202D
      2053414C444F20414E544552494F52272C20545473616C646F2C20545453616C
      646F5F416E74295D2C2727295D00000000FFFF00000000000200000001000000
      06090068656C7665746963610007000000000000000000110000000100020000
      000000FFFFFF0000000002000000000000000000D60F000006004D656D6F3232
      0002007A020000060200004D0000001100000043000000010000000000000000
      00FFFFFF1F2C020000000000010009005B545473616C646F5D00000000FFFF00
      00000000020000000100000000090068656C7665746963610007000000020000
      000000010000000100020000000000FFFFFF0000000002000000000000000000
      6810000006004D656D6F36370002002E000000B3000000600000001400000043
      000F00F4010000000000000000FFFFFF1F2C02000000000001000F0047525550
      4F2044452046494C49414C00000000FFFF000000000002000000010000000009
      0068656C76657469636100070000000000000000000900000001000200000000
      00FFFFFF0000000002000000000000000000F810000006004D656D6F36380002
      0093000000B30000001E0000001400000043000F00F4010000000000000000FF
      FFFF1F2C02000000000001000D005B477275706F46696C69616C5D00000000FF
      FF0000000000020000000100000000090068656C766574696361000700000000
      0000000000090000000100020000000000FFFFFF000000000200000000000000
      00008C11000006004D656D6F3639000200B6000000B30000004D010000140000
      0041000F00F4010000000000000000FFFFFF1F2C020000000000010011005B4E
      6F6D65477275706F46696C69616C5D00000000FFFF0000000000020000000100
      000000090068656C766574696361000700000002000000000008000000010002
      0000000000FFFFFF00000000020000000000000000001512000006004D656D6F
      323300020062000000E00000002C0000001400000043000F00F4010000000000
      000000FFFFFF1F2C0200000000000100060046494C49414C00000000FFFF0000
      000000020000000100000000090068656C766574696361000700000000000000
      0000090000000100020000000000FFFFFF0000000002000000000000000000A0
      12000006004D656D6F363400020093000000E00000001E000000140000004300
      0F00F4010000000000000000FFFFFF1F2C020000000000010008005B46696C69
      616C5D00000000FFFF0000000000020000000100000000090068656C76657469
      63610007000000000000000000090000000100020000000000FFFFFF00000000
      020000000000000000002F13000006004D656D6F3635000200B6000000E00000
      004D0100001400000041000F00F4010000000000000000FFFFFF1F2C02000000
      000001000C005B4E6F6D6546696C69616C5D00000000FFFF0000000000020000
      000100000000090068656C766574696361000700000002000000000008000000
      0100020000000000FFFFFF0000000002000000000000000000BE13000006004D
      656D6F3631000200BA000000A80100005F000000110000004300000001000000
      000000000000FFFFFF1F2C02000000000001000C00544F54414C2046494C4941
      4C00000000FFFF0000000000020000000100000000090068656C766574696361
      0007000000000000000000010000000100020000000000FFFFFF000000000200
      00000000000000004B14000006004D656D6F323500020023010000A801000051
      000000110000004300000001000000000000000000FFFFFF1F2C020000000000
      01000A005B54566C72615265635D00000000FFFF000000000002000000010000
      0000090068656C76657469636100070000000200000000000100000001000200
      00000000FFFFFF0000000002000000000000000000D814000006004D656D6F33
      3100020028020000A80100005100000011000000430000000100000000000000
      0000FFFFFF1F2C02000000000001000A005B54566C72615061675D00000000FF
      FF0000000000020000000100000000090068656C766574696361000700000002
      0000000000010000000100020000000000FFFFFF000000000200000000000000
      00006415000006004D656D6F33360002007A020000A80100004D000000110000
      004300000001000000000000000000FFFFFF1F2C020000000000010009005B54
      5473616C646F5D00000000FFFF0000000000020000000100000000090068656C
      7665746963610007000000020000000000010000000100020000000000FFFFFF
      0000000002000000000000000000F215000006004D656D6F3337000200BA0000
      00D40100005F000000110000004300000001000000000000000000FFFFFF1F2C
      02000000000001000B00544F54414C20475255504F00000000FFFF0000000000
      020000000100000000090068656C766574696361000700000000000000000001
      0000000100020000000000FFFFFF00000000020000000000000000007F160000
      06004D656D6F333900020023010000D401000051000000110000004300000001
      000000000000000000FFFFFF1F2C02000000000001000A005B54566C72615265
      635D00000000FFFF0000000000020000000100000000090068656C7665746963
      610007000000020000000000010000000100020000000000FFFFFF0000000002
      0000000000000000000C17000006004D656D6F343500020028020000D4010000
      51000000110000004300000001000000000000000000FFFFFF1F2C0200000000
      0001000A005B54566C72615061675D00000000FFFF0000000000020000000100
      000000090068656C766574696361000700000002000000000001000000010002
      0000000000FFFFFF00000000020000000000000000009817000006004D656D6F
      35310002007A020000D40100004D000000110000004300000001000000000000
      000000FFFFFF1F2C020000000000010009005B545473616C646F5D00000000FF
      FF0000000000020000000100000000090068656C766574696361000700000002
      0000000000010000000100020000000000FFFFFF000000000200000000000000
      0000341800000C006D6D6F686973746F7269636F0002006C0000002E010000B8
      0000000B0000004300000001000000000000000000FFFFFF1F2C020000000000
      010013005B64657363726963616F6576656E746F5F635D00000000FFFF000000
      0000020000000100000006090068656C76657469636100070000000000000000
      00100000000100020000000000FFFFFF0000000002000000000000000000C918
      000005004D656D6F32000200780100002E010000B40000000B00000043000000
      01000000000000000000FFFFFF1F2C020000000000010013005B646573637269
      63616F6576656E746F5F645D00000000FFFF0000000000020000000100000006
      090068656C766574696361000700000000000000000010000000010002000000
      0000FFFFFF0000000002000000000000000000B419000005004D656D6F330002
      009A000000780100007F000000110000004300000001000000000000000000FF
      FFFF1F2C020000000000010069005B494628646174616D6F76696D656E746F3D
      2730312F30312F31393030272C2027544F54414C20414E544552494F52272C20
      464F524D41544441544554494D45282764642F6D6D2F7979272C20535452544F
      4441544528646174616D6F76696D656E746F292920295D00000000FFFF000000
      0000020000000100000000090068656C76657469636100070000000000000000
      00010000000100020000000000FFFFFF0000000002000000000000000000441A
      000005004D656D6F340002002301000078010000510000001100000043000000
      01000000000000000000FFFFFF1F2C02000000000001000E005B54566C726152
      65635F416E745D00000000FFFF0000000000020000000100000000090068656C
      7665746963610007000000020000000000010000000100020000000000FFFFFF
      0000000002000000000000000000D41A000005004D656D6F3500020024020000
      7801000055000000110000004300000001000000000000000000FFFFFF1F2C02
      000000000001000E005B54566C72615061675F416E745D00000000FFFF000000
      0000020000000100000000090068656C76657469636100070000000200000000
      00010000000100020000000000FFFFFF0000000002000000000000000000901B
      000005004D656D6F360002007A020000780100004D0000001100000043000000
      01000000000000000000FFFFFF1F2C02000000000001003A005B4946286F7065
      726163616F3C3E2731202D2053414C444F20414E544552494F52272C20545473
      616C646F2C20545453616C646F5F416E74295D00000000FFFF00000000000200
      00000100000000090068656C7665746963610007000000020000000000010000
      000100020000000000FFFFFF0000000002000000000000000400DF1B00000500
      4C696E65310002002E000000780100009A0200000000000001000800F4010000
      000000000000FFFFFF1F2C020000000000000000000000FFFF00000000000200
      0000010000000004002E1C000005004C696E65320002002E0000008A0100009A
      0200000000000001000800F4010000000000000000FFFFFF1F2C020000000000
      000000000000FFFF00000000000200000001000000000000BC1C00000900666D
      764F75747261730002005401000047000000320100002800000043000000F401
      0000000000000000FFFFFF1F2C020000000000010008005B4F75747261735D00
      000000FFFF0000000000020000000100000000090068656C7665746963610007
      000000000000000000020000000100020000000000FFFFFF0000000002000000
      000000000100E134000007006670764C6F676F000200300000002E0000007800
      00002A00000007000000F4010000000000000000FFFFFF1F2C02000000000000
      0000000000FFFF00000000000200000001000000000100E1340000424DCE1700
      0000000000360400002800000083000000260000000100080000000000981300
      00120B0000120B0000000100000001000000000000E8E5A800AA9E0000999900
      00ADADAD003A3C4100A3970000BFB73700D8D48600FBFAF000A5A5A5001E1D1C
      00D8D9DA0054575A00D6D6D500E7E8F20012161B00B6AD1900CBC55B008C8D92
      00BEC0C500E1E2E40085878A005E606300494C4F00090D12002C2E3300DEDB98
      007D7F8100EFEDCB00B9BABB00AEA400007C7B7B00C5BE440066666600D1CC6F
      00CDC9810048484600F7F6E600AFA5080004080D00F9F8ED00B8AF2700DBD68C
      00999999001B1A1900C6BF5100131312003B3A3A00FFFFFF00EAE8BE00CCCCCC
      0023262A00E2DEA400F1EFD600B0B1B300D3CD7500B1A81000CCCC6600727272
      00535252004342420001060A00ECE9C3008C8C8B00F5F4DF004A4A4A00575756
      00B6AC1F00282B3000C7C05C0061615F00F7F7F70088888700DDD89300E3E0A6
      00FDFCF70021242900070A1000BDB53100C5BE4A00E3E3E200A69C0000999999
      00BABAB900DEDEDE00525458002A292800D9D58A005F5E5D00C7C595001B1E23
      00E8E5B60000000700B5AB1300D5D07B00C6C6C500B2A80B0021202000B9B124
      00504F4E00666666006B6D7000B5B5BD0084848400E0DC9E00BCB42C00F7EFD6
      005B5B5A00EFEFEF0087898B00DEDEE6003E3D3C0014181E00C8C25300CCC55F
      00A8A9AC00BDBDBC00E5E1AC0075767900181B2000E6E6E6000E111700081019
      0033333300929191002D2C2B00B5B5B400000000000000000000000000000000
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
      0000000000000000000000000000000000313131313131313131313131313131
      31313131313131313131313131313131313131313131313131313131543D4247
      0E31313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131523131313131486D3131316D
      6D4C3131316D6D313131313131313131316D4831313131313131316D6D313131
      6D040A6C6C313131313131486D6D4C3131313131316D6D4C3131313131313131
      31313131486D6D6D313131313131486D6D48313131316D483131316D6D313131
      3131313131313131316D6D6D3131486D6D6D31313131313152313131317F7E66
      31554225256031603D42647931420C313B7D316D6C3D70403131662C316D593D
      7068313133646C702531484255312C70643059313131310C2525420E31477431
      420E4825793131315442433D474C4C640E3120423C300A3131207E2C317F7025
      4748484251512531603C316D59253C620A312C25433068313131313152313131
      316C2031315959313131317C7D4C4C31487C0E3159683177424C513475314340
      31203D487957543130494C7F3D31487C0C310B37317F70313131313C66313131
      31642C317C33487E51313131313179602F55317C3331316D793B7031487E1431
      4857043131316D7C55557E311E3031542D4C314340313148790A0B4C31313131
      5231313131477D313125306C64334C5779313131487C0E31224931422C313143
      40316C7D313C7D3131594931570C31543D31487C0C3168705930253131313170
      706C3C0E313C0A313033317C513131310C702570474C4C3033312C7C64300A31
      48300E31796243432248483051517C31603D316D6464590B2C31547C42301C31
      3131313152313131314749313166420C5548313D2C484831487C0E48302C311C
      4248516275316C7D31493D4879627F31256848373031487C0E3131550E207031
      313131473C0C554831642C4C7E330C62793131316830796D3131487C3331577D
      6D6D313148303331487C49555131487C0C0C7E4C2C703131480C0E7C2C313C47
      6D6D31313131313152313131040B7E20316D473C6C33310E3D3C6C7931254264
      646D31486C42706831316C7D31484742702031310E3D433D6C31484355314043
      473D0A31313131796C3C6C0E316670597E3C3D20313131310E256C6C7731316C
      0E312C3D47430431772F3D0A3133424366484825643C7E6C7C74316D22594342
      5531543D59437D3131313131523131316D643B6D3131316D514831313179514C
      316D51793131313131796D3131313C40313131796D313131313179794831317F
      6D316D15154831313131313131795148314879516D796D313131313131315151
      7931317F6D31316D51516D3151577F6D313131797931316D51516D5148313131
      515151313131314851516D313131313152313131314004313131313131313131
      3131313131313131313131313131313131316804313131313131313131313131
      313148660F313131313131313131313131313131313131313131313131313131
      31313131313131220E3131313131313131665531313131313131313131313131
      3131313131313131313131313131313131313131523131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131315C46121212463F313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131315231313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131315F06020202061B3131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313152313131
      3131310E40173C18183D6E3131313131310C2C666C3C18181818180568313131
      3131316D3768220D0516313131313108021F1F1F523531313131317207070707
      0707070707070707070750732B3631313131313131313131362B73212112081D
      31313131313131313123505050504B3131313131313131313F08122E50505008
      5231313131312C103E191919195D17313131317966713E4E191919191919195D
      0D31313131312C34282819190017313131313108021F1F1F5235313131313111
      52020202020202020202020202020202022776313131313131313F501F020202
      02020202075C313131313131316A060202065F313131313131314C1202020202
      02020221523131313175287A78787878784E223131310E1A3E10787871717171
      717171281731313131773E7A717171712822313131313108021F1F1F52353131
      31313144021F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1D3131313131080202
      1F1F1F1F1F1F1F1F02022331313131313107021F1F0208313131313131313A52
      1F1F1F1F1F1F1F5052313131310D4E7878787A7A71282231316D7C4E7878784E
      4E7A717171717128173131312C3E7171717119195D22313131313108021F1F1F
      5269314C4C4C4C631F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F525031313131
      38521F1F1F0202020202021F1F1F5212313131313107021F1F02083131313131
      31361F1F1F1F1F0202020221523131316D457A78787A3D370E0E5131313B3E78
      78787A2274140E0E0E0E0E0E15313115787A787871190D0A145A2A6A6A6A2A5F
      36363636365044111111113226262626262626262626262626264A1F1F1F1F61
      2631311B521F1F1F02443A08082363021F1F1F525F3131313107021F1F020831
      31313131311B021F1F1F1F6A2B353532523131310E71717171710C3131313131
      15781078784E683131313131313131313131311C287878787A2C313131010602
      0202025F31313131315052020202023631313131313131313131313131313144
      021F1F1F32312639021F1F1F584C31313131311B27021F1F1F3631313107021F
      1F020831313131313123021F1F1F11093131313152313131337A717171454831
      313131312C28787810344C313131313131313131313131057A78784E66313131
      3135021F1F1F025F313131313150021F1F1F1F36313131313131313131313131
      31314C5E021F1F0276315F521F1F1F4B313131313131313132271F1F52733131
      3107021F1F020831313131313112021F1F027231313131315231313160197878
      7A7C4C3131313131662878781045166E6E6E6E6E6E6E6E1C0431555B1078717A
      603131313135021F1F1F025F313131313150021F1F1F1F36313131313131314C
      0909090909363A021F1F1F1F3F314F021F02723131313131313131313123021F
      1F1109313107021F1F02083131313131312E021F1F0273313131313152313131
      601978787A054C3131313131561978787871282828282828282828005631337A
      717171346D313131313552020202025F31313131312106020202023631313131
      762E635E61616161611F1F1F1F1F1F114C26611F1F0276313131313131313131
      311D1F1F1F1F1D313107021F1F02083131313131312E021F1F023A3131313131
      52313131601978787A054C31313131311819787878787878787878787878784E
      1731141978787A454831313131764444444444241551515151464F4F4F4F4F41
      3131313A0202021F1F1F1F1F1F1F1F1F1F1F521B311D1F1F1F1F363131313131
      313131313126391F1F1F5C313107021F1F02083131313131312E021F1F023A31
      3131313152313131601978787A054C3131313131561978787878787878787878
      7878784E1731337A717171346D313131313109090909097D713434347A373131
      31313131313158521F1F1F1F1F0202020202020202275831311D1F1F1F1F1D31
      31313131313131313126391F1F1F5C313107021F1F02083131313131312E021F
      1F023A313131313152313131601978787A054C3131313131224E787878784E28
      282828282828280056310C787171715B0C31313131313131313131133E101010
      5D74313131313131312939021F1F1F1F3911636363636A50083631313126611F
      1F024B313131313131313131313F021F1F1F36313107021F1F02083131313131
      312E021F1F023A313131313152313131601978787A054C313131313116287878
      101A2C2C2C2C2C2C2C2C2C7D1E316D1A7A7878197F3131313131313131313113
      4E78787828743131313131313176021F1F1F1F23263131313131313131313131
      313107021F02213131313131313131313173021F1F444C313107021F1F020831
      31313131312E021F1F023A313131313152313131601978787A054C3131313131
      7F197171713448313131313131313131313131561978784E6631313131313131
      313131134E7878782874313131313131312B521F1F1F61293131313131313131
      31313131313158521F1F024A31313131313131317602021F522331313107021F
      1F02083131313131312E021F1F023A313131313152313131331978787A053131
      313131316D347A78784E133131313131313131313131317D2878787171043131
      3131313131313113001919190004313131313131312B521F1F1F274131313131
      313131313131313131310911021F1F1F232631313131295F1F1F1F1F61293131
      3107021F1F022B3131313131312E021F1F52233131313131520E14602C7A7878
      7A7C141414140C3131203E78787171660A1E6014141414140E3131155B107878
      107A567D371E1E1E1E1E1E13566C6C6C182C75757575756D315C021F1F1F1F21
      1B1B1B1B1B1B4A4A4A4A4A3631313176021F1F1F0261502323725E021F1F1F02
      58762B2B4A44021F1F1F504A4A4A2B1D312E021F1F1F074A4A4A4A5C520D7A7A
      7A78787878787A7A7A5D1731317945197878784E4E7A7A7A7A7A7A5D6C313131
      165D7171717119191919191919195D6E313131313166007A7A7A4E1431295E02
      1F1F1F0202020202020202020202062B313131315802021F1F1F020202021F1F
      1F1F52384C395252521F1F1F1F1F020202020608312E021F1F1F1F0202020221
      521771717878787878787171714E22313131335B28717878787871717171714E
      1731313131173E7A717878787878787878784E6E313131313166287171717A60
      31314A521F1F1F1F1F1F1F1F1F1F1F1F1F1F524A31313131316939521F1F1F1F
      1F1F1F1F020258310911021F1F1F1F1F1F1F1F1F1F1F022B312E021F1F1F1F1F
      1F1F1F50520D19191978787878781919190017313131310C0D10284E4E191919
      191919000D31313131317D1A4E4E4E19191919191919001C3131313131662878
      787810603131315F0202020202020202020202020202062B3131313131313673
      3902020202020261721D313129615252521F1F1F1F1F020202020608312E021F
      1F1F1F0202020221527D17173C107878714D1717170D2C3131313131310E0A1C
      3B2217171717170D7D31313131313148757D77661717171717170D0431313131
      316628787878106031313131364A3A7272727272727272727272505C31313131
      31313131264B5F737338354131313131093A7272725E1F1F1F1F4F1212122E5C
      312E021F1F1F631212121258523131310E1978787A0531313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313117003E3E3E5D753131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313107021F1F525831
      31313131312E021F1F0223313131313152313131601978787A054C3131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131317F686E6E6E6E1531313131313131313131313131313131
      313131313131313131313131313131313131313131313131313131313121021F
      1F02073131313131312E021F1F023A313131313152313131601978787A054C31
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3173021F1F1F1F4F3A233A32312E021F1F023A31313131315231313160197878
      7A054C3131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313169521F1F1F1F0202020608312E021F1F023A313131313152313131
      601978787A054C31313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131310963521F1F1F1F1F1F024A312E021F1F023A3131313131
      52313131601971717A054C313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131314150611F1F1F1F1F024A3150021F1F023A31
      31313131523131310C0D17176C774C3131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131313131313131315C3872727272725C31082E2E
      2E2E1B31313131315200008735000013006D6D6F464F4E4546494C49414C4241
      53455F52000200AC0000005B000000AA0000000A00000004000000F401000000
      0000000000FFFFFF1F2C02000000000001001600464F4E453A205B464F4E4546
      494C49414C424153455D00000000FFFF00000000000200000001000000000900
      68656C7665746963610006000000000000000000100000000100020000000000
      FFFFFF00000000020000000000000000003C36000014006D6D6F454E44455245
      434F5F42414952524F5F52000200AC00000045000000AB0000000A0000000000
      0000F4010000000000000000FFFFFF1F2C020000000000010024005B52554146
      494C49414C424153455D202D205B42414952524F46494C49414C424153455D00
      000000FFFF0000000000020000000100000000090068656C7665746963610006
      000000000000000000100000000100020000000000FFFFFF0000000002000000
      0000000000000937000012006D6D6F4345505F4349444144455F55465F520002
      00AC00000050000000AB0000000A00000000000000F4010000000000000000FF
      FFFF1F2C02000000000001003E004345503A205B43455046494C49414C424153
      455D202D205B43494441444546494C49414C424153455D202D205B4553544144
      4F46494C49414C424153455D00000000FFFF0000000000020000000100000000
      090068656C766574696361000600000000000000000010000000010002000000
      0000FFFFFF00000000020000000000000000009F37000008006D6D6F52415A41
      4F000200AC0000002E000000AB0000001400000003000000F401000000000000
      0000FFFFFF1F2C020000000000010011005B52415A414F46494C49414C424153
      455D00000000FFFF0000000000020000000100000006090068656C7665746963
      610006000000000000000000100000000100020000000000FFFFFF0000000002
      0000000000000000002D38000009006D6D6F544954554C4F000200540100002E
      000000320100001700000002000000F4010000000000000000FFFFFF1F2C0200
      00000000010008005B746974756C6F5D00000000FFFF00000000000200000001
      00000006090068656C766574696361000B000000020000000000020000000100
      020000000000FFFFFF0000000002000000000000000000BE3800000F006D6D6F
      524F54554C4F444154415F520002007C0200002E0000001C0000000C00000043
      000000F4010000000000000000FFFFFF1F2C0200000000000100050044617461
      3A00000000FFFF0000000000020000000100000000090068656C766574696361
      0006000000000000000000000000000100020000000000FFFFFF000000000200
      00000000000000005539000009006D6D6F444154415F52000200990200002E00
      00002C0000000C00000043000000F4010000000000000000FFFFFF1F2C020000
      000000010011005B4441544520234464642F6D6D2F79795D00000000FFFF0000
      000000020000000100000000090068656C766574696361000600000000000000
      0000010000000100020000000000FFFFFF0000000002000000000000000000EA
      39000011006D6D6F524F54554C4F504147494E415F520002007C020000390000
      00280000000C00000043000000F4010000000000000000FFFFFF1F2C02000000
      00000100070050E167696E613A00000000FFFF00000000000200000001000000
      00090068656C7665746963610006000000000000000000000000000100020000
      000000FFFFFF0000000002000000000000000000793A00000B006D6D6F504147
      494E415F52000200A502000039000000200000000C00000043000000F4010000
      000000000000FFFFFF1F2C020000000000010007005B50414745235D00000000
      FFFF0000000000020000000100000000090068656C7665746963610006000000
      000000000000010000000100020000000000FFFFFF0000000002000000000000
      000000163B00000F006D6D6F524F44415045484F52415F520002002F0000007C
      020000580000000A00000043000000F4010000000000000000FFFFFF1F2C0200
      00000000010011005B54494D4520235468683A6D6D3A73735D00000000FFFF00
      00000000020000000100000000090068656C7665746963610007000000000000
      000000100000000100020000000000FFFFFF0000000002000000000000000000
      BF3B00000C006D6D6F544543534F46545F52000200E80100007C020000DC0000
      000A00000043000000F4010000000000000000FFFFFF1F2C0200000000000100
      2000746563534F4654202D205465636E6F6C6F67696120656D2053697374656D
      617300000000FFFF0000000000020000000100000000090068656C7665746963
      610007000000000000000000110000000100020000000000FFFFFF0000000002
      00000000000000FEFEFF33000000070020546F74616973000000000300527561
      000000000600436964616465000000000400466F6E6500000000060054697475
      6C6F0000000006004F757472617300000000060042616972726F000000000600
      204461646F73000000000B00477275706F46696C69616C000000000F004E6F6D
      65477275706F46696C69616C00000000060046696C69616C000000000A004E6F
      6D6546696C69616C000000000600566C72526563000100300008004A75726F73
      52656300010030000800546F74616C52656300010030000700566C7261526563
      000100300009004A75726F736152656300010030000900546F74616C61526563
      00010030000600566C72506167000100300008004A75726F7350616700010030
      000800546F74616C50616700010030000700566C726150616700010030000900
      4A75726F736150616700010030000900546F74616C6150616700010030000C00
      53616C646F496E696369616C0001003000090064657363726963616F00000000
      0D00646174616D6F76696D656E746F000000000D005453616C646F496E696369
      616C00010030000B00686973746F7269636F5F63000000000B00686973746F72
      69636F5F64000000000C0020546F74616C697A6163616F00000000070054566C
      72526563000000000900544A75726F7352656300000000090054546F74616C52
      656300000000080054566C7261526563000000000A00544A75726F7361526563
      000000000A0054546F74616C6152656300000000070054566C72506167000000
      000900544A75726F7350616700000000090054546F74616C5061670000000008
      0054566C7261506167000000000A00544A75726F7361506167000000000A0054
      546F74616C61506167000000000700545453616C646F00010030000C0054566C
      72615265635F416E74000000000C0054566C72615061675F416E74000000000B
      00545453616C646F5F416E74000000000C00204167727570616D656E746F0000
      0000120041677275706172477275706F46696C69616C00050046616C7365000D
      004167727570617246696C69616C00050046616C7365000F005469706F646552
      656C61746F72696F00010030000000000000000000FC00000000000000000000
      0000000000005800DCAC856ACE1FE5409931A36BCE1FE540}
  end
  object fdsFluxoporEvento: TfrDBDataSet
    DataSet = qryFluxoporEvento
    OpenDataSource = False
    Left = 352
    Top = 352
  end
  object qryFluxoDetalhado: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryFluxoDetalhadoAfterOpen
    AfterScroll = qryFluxoDetalhadoAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'WhereFilialVenda'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WhereFilialEmissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Ordenacao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      '/*INICIO SALDO ANTERIOR*/'
      ''
      '('
      'select DATAS.*,'
      '        ACUMULADO.vlrarec,'
      '        ACUMULADO.descricaoevento_c,'
      '        ACUMULADO.vlrapag,'
      '        ACUMULADO.descricaoevento_d,'
      '        cast('#39'1 - SALDO ANTERIOR'#39' as varchar) as operacao,'
      #9'False as Totalizado'
      '  from'
      '('
      '('
      
        ' select   grupofilial,  nomegrupofilial,  filial, nomefilial, ca' +
        'st('#39'30/12/1899'#39' as date) as data'
      ' from'
      ' ('
      
        '   select  case when   :AgruparGrupoFilial    then fgf.grupo els' +
        'e cast(0 as integer) end as grupofilial,'
      
        '             case when :AgruparGrupoFilial    then gf.descricao ' +
        'else null end as nomegrupofilial,'
      
        '             case when :AgruparFilial   then ct.filialvenda else' +
        ' cast(0 as integer) end as filial,'
      
        '             case when :AgruparFilial   then f.nome else null en' +
        'd as nomefilial'
      '  from ((contratos ct join parcelas p on ct.numero=p.contrato)'
      '                    join (filiais f'
      #9#9'     left join (filiaisgruposfiliais fgf'
      #9#9'      left join gruposfiliais gf on fgf.grupo=gf.codigo)'
      '                     on f.codigo=fgf.filial)'
      '                    on ct.filialvenda=f.codigo)'
      '  where p.datapagto is null and (p.tipopagto is null) and'
      
        '      p.datavencto between (:DataInicialAcumulado) and (:DataFin' +
        'alAcumulado) and'
      
        '      ct.situacao in ('#39'F'#39','#39'N'#39','#39'P'#39') and not (contratos_renegociad' +
        'o(ct.numero))'
      '             %WhereFilialVenda'
      
        '  order by UPPER(TO_ASCII(gf.descricao,'#39'LATIN1'#39')), fgf.grupo, UP' +
        'PER(TO_ASCII(f.nome,'#39'LATIN1'#39')), ct.filialvenda, p.datavencto'
      ' ) AS RECEBIMENTOS'
      
        '  group by nomegrupofilial, grupofilial, nomefilial, filial, dat' +
        'a'
      ')'
      'union'
      '('
      
        ' select   grupofilial,  nomegrupofilial,  filial, nomefilial, ca' +
        'st('#39'30/12/1899'#39' as date) as data'
      ' from'
      ' ('
      
        '   select    case when  :AgruparGrupoFilial    then fgf.grupo el' +
        'se cast(0 as integer) end as grupofilial,'
      
        '             case when  :AgruparGrupoFilial    then gf.descricao' +
        ' else null end as nomegrupofilial,'
      
        '             case when  :AgruparFilial   then dp.filialemissao e' +
        'lse cast(0 as integer) end as filial,'
      
        '             case when  :AgruparFilial   then f.nome else null e' +
        'nd as nomefilial'
      
        '  from ((documentospag dp join duplicatas d on dp.numero=d.docum' +
        'entopag)'
      '                         join (filiais f'
      #9#9#9'  left join (filiaisgruposfiliais fgf'
      #9#9#9'   left join gruposfiliais gf on fgf.grupo=gf.codigo)'
      '                          on f.codigo=fgf.filial)'
      '                         on dp.filialemissao=f.codigo)'
      '  where d.datapagto is null and'
      
        '      d.datavencto between (:DataInicialAcumulado) and (:DataFin' +
        'alAcumulado)'
      '             %WhereFilialEmissao'
      
        ' order by UPPER(TO_ASCII(gf.descricao,'#39'LATIN1'#39')), fgf.grupo, UPP' +
        'ER(TO_ASCII(f.nome,'#39'LATIN1'#39')), dp.filialemissao, d.datavencto'
      ' ) AS PAGAMENTOS'
      ' group by nomegrupofilial, grupofilial, nomefilial, filial, data'
      ')'
      ') as DATAS'
      ' left join'
      '  ('
      '   ('
      
        '    select   grupofilial,  filial, cast('#39'30/12/1899'#39' as date) as' +
        ' data,'
      
        '             cast('#39'PRESTACOES EM ABERTO'#39' as varchar(250)) as des' +
        'cricaoevento_c,'
      #9'     cast(null as varchar) as descricaoevento_d,'
      #9'     sum(valorvencto) as vlrarec,'
      #9'     0.00 as vlrapag'
      '    from'
      '     ('
      
        '      select  case when  :AgruparGrupoFilial then fgf.grupo else' +
        ' cast(0 as integer) end as grupofilial,'
      
        '              case when :AgruparFilial   then ct.filialvenda els' +
        'e cast(0 as integer) end as filial,'
      '              P.valorvencto'
      
        '      from ((contratos ct join parcelas p on ct.numero=p.contrat' +
        'o)'
      
        '                          left join filiaisgruposfiliais fgf on ' +
        'ct.filialvenda=fgf.filial)'
      '      where p.datapagto is null and (p.tipopagto is null) and'
      
        '            p.datavencto between (:DataInicialAcumulado) and (:D' +
        'ataFinalAcumulado) and'
      
        '            ct.situacao in ('#39'F'#39','#39'N'#39','#39'P'#39') and not (contratos_rene' +
        'gociado(ct.numero))'
      '              %WhereFilialVenda'
      '      order by fgf.grupo, ct.filialvenda, p.datavencto'
      '     ) AS RECEBIMENTOS'
      '     group by grupofilial, filial, data'
      '   )'
      '   union all'
      '   ('
      
        '    select  grupofilial, filial, cast('#39'30/12/1899'#39' as date) as d' +
        'ata,'
      #9'    cast(null as varchar(250)) as descricaoevento_c,'
      
        '            cast(descricaoevento_d as varchar) as descricaoevent' +
        'o_d,'
      #9'    0.00 as vlrarec, sum(valorvencto) as vlrapag'
      '    from'
      '    ('
      
        '     select  case when :AgruparGrupoFilial   then fgf.grupo else' +
        ' cast(0 as integer) end as grupofilial,'
      
        '             case when :AgruparFilial   then dp.filialemissao el' +
        'se cast(0 as integer) end as filial,'
      '             d.valorvencto,'
      
        '             coalesce(e.descricao, '#39'PAGAMENTOS EM ABERTO'#39') as de' +
        'scricaoevento_d'
      
        '     from (((documentospag dp join duplicatas d on dp.numero=d.d' +
        'ocumentopag)'
      
        '                          left join eventos e on dp.evento=e.cod' +
        'igo)'
      
        '                             left join filiaisgruposfiliais fgf ' +
        'on dp.filialemissao = fgf.filial)'
      '     where d.datapagto is null and'
      
        '           d.datavencto between (:DataInicialAcumulado) and (:Da' +
        'taFinalAcumulado)'
      '             %WhereFilialEmissao'
      '     order by fgf.grupo, dp.filialemissao, d.datavencto'
      '    ) AS PAGAMENTOS'
      '   group by grupofilial, filial, data, descricaoevento_d'
      '   )'
      '  ) as ACUMULADO ON'
      '    DATAS.grupofilial = ACUMULADO.grupofilial and'
      '    DATAS.filial = ACUMULADO.filial and'
      '    DATAS.data = ACUMULADO.data'
      ')'
      'union all'
      ''
      '/*FINAL SALDO ANTERIOR*/'
      ''
      '/* DEFINI'#199#195'O DO SALDO INICIAL INFORMADO */'
      '('
      ' select   grupofilial,  nomegrupofilial,  filial, nomefilial,'
      '          cast('#39'30/12/1899'#39' as date) as data,'
      '          vlrarec,'
      
        '          cast('#39'SALDO INICIAL'#39' as varchar(250)) as descricaoeven' +
        'to_c,'
      '          cast(0 as numeric) as vlraPag,'
      '          cast(null as varchar) as descricaoevento_d,'
      
        '          cast('#39'2 - SALDO INICIAL'#39' as varchar) as operacao, Fals' +
        'e as Totalizado'
      ' from'
      ' ('
      '   select    cast(0 as integer) as grupofilial,'
      '             cast(null as varchar) as nomegrupofilial,'
      '             cast(0 as integer) as filial,'
      '             cast(null as varchar) as nomefilial,'
      '             cast(:SaldoInicial as numeric) as vlraRec'
      ' ) as TOTALSALDOINICIAL'
      ')'
      ''
      '/* FIM DA DEFINI'#199#195'O DO SALDO INICIAL INFORMADO */'
      ''
      '/* INICIO DA DEFINI'#199#195'O DAS LINHAS DE DETALHE DO FLUXO */'
      'union all'
      '('
      'select DATAS.*,'
      '        DETALHE.vlrarec,'
      '        DETALHE.descricaoevento_c,'
      '        DETALHE.vlrapag,'
      '        DETALHE.descricaoevento_d,'
      
        '        cast('#39'3 - RELATORIO'#39' as varchar) as operacao, False as T' +
        'otalizado'
      '  from'
      '('
      '('
      
        ' select   grupofilial,  nomegrupofilial,  filial, nomefilial, da' +
        'ta'
      ' from'
      ' ('
      '    select grupofilial,nomegrupofilial,filial,nomefilial,'
      '             primeirodiautil(filial,data,'#39'R'#39') as data'
      '    from'
      '    ('
      
        '      select    case when  :AgruparGrupoFilial    then fgf.grupo' +
        ' else cast(0 as integer) end as grupofilial,'
      
        '                case when  :AgruparGrupoFilial    then gf.descri' +
        'cao else null end as nomegrupofilial,'
      
        '                case when  :AgruparFilial   then ct.filialvenda ' +
        'else cast(0 as integer) end as filial,'
      
        '                case when  :AgruparFilial   then f.nome else nul' +
        'l end as nomefilial,'
      '                p.datavencto as data'
      
        '      from ((contratos ct join parcelas p on ct.numero=p.contrat' +
        'o)'
      '                       join (filiais f'
      #9'   '#9'     left join (filiaisgruposfiliais fgf'
      #9#9'      left join gruposfiliais gf on fgf.grupo=gf.codigo)'
      '                     on f.codigo=fgf.filial)'
      '                    on ct.filialvenda=f.codigo)'
      '      where p.datapagto is null'
      '        and p.tipopagto is null'
      '        and p.datavencto between (:DataInicial) and (:DataFinal)'
      
        '        and ct.situacao in ('#39'F'#39','#39'N'#39','#39'P'#39') and not (contratos_rene' +
        'gociado(ct.numero))'
      '        %WhereFilialVenda'
      
        '      order by UPPER(TO_ASCII(gf.descricao,'#39'LATIN1'#39')), fgf.grupo' +
        ', UPPER(TO_ASCII(f.nome,'#39'LATIN1'#39')), ct.filialvenda, p.datavencto'
      '   ) AS RECEBIMENTOS'
      '   /* where data between (:DataInicial) and (:DataFinal)*/'
      ' ) AS RECEBIMENTOS'
      
        '  group by nomegrupofilial, grupofilial, nomefilial, filial, dat' +
        'a'
      ')'
      'union'
      '('
      
        ' select   grupofilial,  nomegrupofilial,  filial, nomefilial, da' +
        'ta'
      ' from'
      ' ('
      '    select grupofilial,nomegrupofilial,filial,nomefilial,'
      '             primeirodiautil(filial,data,'#39'P'#39') as data'
      '    from'
      '    ('
      
        '     select    case when :AgruparGrupoFilial    then fgf.grupo e' +
        'lse cast(0 as integer) end as grupofilial,'
      
        '               case when :AgruparGrupoFilial    then gf.descrica' +
        'o else null end as nomegrupofilial,'
      
        '               case when :AgruparFilial   then dp.filialemissao ' +
        'else cast(0 as integer) end as filial,'
      
        '               case when :AgruparFilial   then f.nome else null ' +
        'end as nomefilial,'
      '               d.datavencto as data'
      
        '     from ((documentospag dp join duplicatas d on dp.numero=d.do' +
        'cumentopag)'
      '                         join (filiais f'
      #9#9#9'  left join (filiaisgruposfiliais fgf'
      #9#9#9'   left join gruposfiliais gf on fgf.grupo=gf.codigo)'
      '                          on f.codigo=fgf.filial)'
      '                         on dp.filialemissao=f.codigo)'
      '     where d.datapagto is null'
      '       and d.datavencto between (:DataInicial) and (:DataFinal)'
      '           %WhereFilialEmissao'
      
        '     order by UPPER(TO_ASCII(gf.descricao,'#39'LATIN1'#39')), fgf.grupo,' +
        ' UPPER(TO_ASCII(f.nome,'#39'LATIN1'#39')), dp.filialemissao, d.datavenct' +
        'o'
      '   ) AS PAGAMENTOS'
      '   /*where data between (:DataInicial) and (:DataFinal)*/'
      ' ) AS PAGAMENTOS'
      ' group by nomegrupofilial, grupofilial, nomefilial, filial, data'
      ')'
      ') as DATAS'
      ''
      ' left join'
      ' ('
      '  ('
      
        '     select grupofilial, filial, primeirodiautil(filial,data,'#39'R'#39 +
        ') as data,'
      '            descricaoevento_c,'
      #9'    cast(null as varchar) as descricaoevento_d,'
      '            valorvencto as vlrarec,'
      #9'    0.00 as vlrapag'
      '     from'
      '     ('
      
        '      select case when :AgruparGrupoFilial    then fgf.grupo els' +
        'e cast(0 as integer) end as grupofilial,'
      
        '               case when :AgruparFilial   then ct.filialvenda el' +
        'se cast(0 as integer) end as filial,'
      '               p.datavencto as data,'
      '               P.valorvencto,'
      
        '               '#39'CT '#39'||lpad(cast(ct.numero as varchar(6)),6,'#39'0'#39')|' +
        '|'#39'-'#39'||p.numero||'#39' '#39'||ct.nome as descricaoevento_c'
      
        '      from (((contratos ct join parcelas p on ct.numero=p.contra' +
        'to)'
      
        '                        left join filiaisgruposfiliais fgf on ct' +
        '.filialvenda=fgf.filial)'
      
        '                        left join planos pl  on ct.plano=pl.codi' +
        'go)'
      ''
      '      where p.datapagto is null and (p.tipopagto is null) and'
      
        '            p.datavencto between (:DataInicial) and (:DataFinal)' +
        ' and'
      
        '            ct.situacao in ('#39'F'#39','#39'N'#39','#39'P'#39') and not (contratos_rene' +
        'gociado(ct.numero))'
      '               %WhereFilialVenda'
      '      order by fgf.grupo, ct.filialvenda, p.datavencto'
      '     ) AS RECEBIMENTOS'
      '     /* where data between (:DataInicial) and (:DataFinal)*/'
      '   )'
      '   union all'
      '   ('
      
        '      select grupofilial, filial, primeirodiautil(filial, data, ' +
        #39'P'#39') as data,'
      ' '#9'     cast(null as varchar(250)) as descricaoevento_c,'
      #9'     descricaoevento_d,'
      #9'     0.00 as vlrarec,'
      '             valorvencto as vlrapag'
      '      from'
      '      ('
      
        '      select  case when :AgruparGrupoFilial    then fgf.grupo el' +
        'se cast(0 as integer) end as grupofilial,'
      
        '              case when :AgruparFilial   then dp.filialemissao e' +
        'lse cast(0 as integer) end as filial,'
      '              d.datavencto as data,'
      '              d.valorvencto,'
      '             case when np.numero is not null then'
      
        '              '#39'NF '#39'||lpad(cast(np.numero as varchar(6)),6,'#39'0'#39')||' +
        #39'-'#39'||d.numero||'#39' '#39'||fo.nome'
      
        '              else '#39'DC '#39'||lpad(cast(dp.numero as varchar(6)),6,'#39 +
        '0'#39')||'#39'-'#39'||d.numero||'#39' '#39'||fo.nome end as descricaoevento_d'
      ''
      
        '      from (((((documentospag dp join duplicatas d on dp.numero=' +
        'd.documentopag)'
      
        '                           left join notaspag np on dp.numero=np' +
        '.documentopag)'
      
        '                           left join vfornecedores fo on dp.forn' +
        'ecedor=fo.codigo and dp.tipofornecedor=fo.tipo)'
      
        '                           left join eventos e on dp.evento = e.' +
        'codigo)'
      
        '                              left join filiaisgruposfiliais fgf' +
        ' on dp.filialemissao = fgf.filial)'
      '      where d.datapagto is null and'
      '            d.datavencto between (:DataInicial) and (:DataFinal)'
      '              %WhereFilialEmissao'
      '      order by fgf.grupo, dp.filialemissao, d.datavencto'
      '     ) AS PAGAMENTOS'
      '     /* where data between (:DataInicial) and (:DataFinal)*/'
      '   )'
      '  ) as DETALHE ON'
      '    DATAS.grupofilial = DETALHE.grupofilial and'
      '    DATAS.filial = DETALHE.filial and'
      '    DATAS.data = DETALHE.data'
      ')'
      '%Ordenacao')
    RequestLive = True
    Left = 80
    Top = 416
    ParamData = <
      item
        DataType = ftString
        Name = 'AgruparGrupoFilial'
        ParamType = ptUnknown
        Value = 'False'
      end
      item
        DataType = ftString
        Name = 'AgruparFilial'
        ParamType = ptUnknown
        Value = 'False'
      end
      item
        DataType = ftDate
        Name = 'DataInicialAcumulado'
        ParamType = ptUnknown
        Value = #39'30/12/1899'#39
      end
      item
        DataType = ftDate
        Name = 'DataFinalAcumulado'
        ParamType = ptUnknown
        Value = #39'05/09/2005'#39
      end
      item
        DataType = ftString
        Name = 'SaldoInicial'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftDate
        Name = 'DataInicial'
        ParamType = ptUnknown
        Value = #39'06/09/2005'#39
      end
      item
        DataType = ftDate
        Name = 'DataFinal'
        ParamType = ptUnknown
        Value = #39'26/09/2005'#39
      end>
    object qryFluxoDetalhadogrupofilial: TIntegerField
      FieldName = 'grupofilial'
      DisplayFormat = '0'
    end
    object qryFluxoDetalhadonomegrupofilial: TStringField
      FieldName = 'nomegrupofilial'
      Size = 50
    end
    object qryFluxoDetalhadofilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryFluxoDetalhadonomefilial: TStringField
      FieldName = 'nomefilial'
      Size = 50
    end
    object qryFluxoDetalhadodata: TDateField
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object qryFluxoDetalhadovlrarec: TFloatField
      FieldName = 'vlrarec'
      DisplayFormat = '0.00'
    end
    object qryFluxoDetalhadodescricaoevento_c: TStringField
      FieldName = 'descricaoevento_c'
      Size = 250
    end
    object qryFluxoDetalhadovlrapag: TFloatField
      FieldName = 'vlrapag'
      DisplayFormat = '0.00'
    end
    object qryFluxoDetalhadodescricaoevento_d: TStringField
      FieldName = 'descricaoevento_d'
      Size = 250
    end
    object qryFluxoDetalhadooperacao: TStringField
      FieldName = 'operacao'
      Size = 18
    end
    object qryFluxoDetalhadototalizado: TBooleanField
      FieldName = 'totalizado'
    end
    object qryFluxoDetalhadoExibirSaldo: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'ExibirSaldo'
      Calculated = True
    end
  end
  object frpFluxoDetalhado: TfrReport
    Dataset = fdsFluxoDetalhado
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnBeginDoc = frprelatoriofluxodecaixaBeginDoc
    OnEndDoc = frprelatoriofluxodecaixaEndDoc
    OnBeginBand = frpFluxoDetalhadoBeginBand
    OnGetValue = frpFluxoDetalhadoGetValue
    OnBeforePrint = frpFluxoDetalhadoBeforePrint
    Left = 224
    Top = 408
    ReportForm = {
      190000000C3F000019FFFF00000A0050444643726561746F7200FFFFFFFFFF00
      000000340800009A0B0000000000002C00000000000000290000000000040000
      0000FFFF000000000000000000000000030400466F726D00FEFFFFFFDC000000
      780000007C0100002C010000041A000500626567696E0D00000D1C006966205B
      41677275706172477275706F46696C69616C5D207468656E0D0500626567696E
      0D2400204361626563616C686F477275706F46696C69616C2E76697369626C65
      3A3D747275653B0D210020526F64617065477275706F46696C69616C2E766973
      69626C653A3D747275653B0D0300656E640D0400656C73650D0500626567696E
      0D2500204361626563616C686F477275706F46696C69616C2E76697369626C65
      3A3D66616C73653B0D220020526F64617065477275706F46696C69616C2E7669
      7369626C653A3D66616C73653B0D0400656E643B0D00000D17006966205B4167
      727570617246696C69616C5D207468656E0D0500626567696E0D1F0020436162
      6563616C686F46696C69616C2E76697369626C653A3D747275653B0D1C002052
      6F6461706546696C69616C2E76697369626C653A3D747275653B0D0300656E64
      0D0400656C73650D0500626567696E0D2000204361626563616C686F46696C69
      616C2E76697369626C653A3D66616C73653B0D1D0020526F6461706546696C69
      616C2E76697369626C653A3D66616C73653B0D0400656E643B0D00000D010020
      0D0300656E640002008A0200000B005061676548656164657231000201000000
      002E000000F5020000540000003000020001000000000000000000FFFFFF1F00
      000000000000000000000000FFFF000000000002000000010000000000000001
      000000C8000000140000000100000000000002000A0300000F004D6173746572
      44617461466C75786F000201000000002E010000F50200000B00000035000500
      01000000000000000000FFFFFF1F000000001100666473466C75786F44657461
      6C6861646F000000000000000100000000000002000000010000000000000001
      000000C800000014000000010000000000000200760300000C0053756D617269
      6F546F74616C0002010000000000020000F50200001A00000039000100010000
      00000000000000FFFFFF1F00000000000000000000000000FFFF000000000002
      000000010000000000000001000000C800000014000000010000000000000200
      2F04000014004361626563616C686F477275706F46696C69616C000201000000
      00B0000000F50200001C0000003900100001000000000000000000FFFFFF1F00
      00000045005B4946285B41677275706172477275706F46696C69616C5D3D5472
      75652C205B717279666C75786F646574616C6861646F2E22677275706F66696C
      69616C225D2C2727295D00000000000000FFFF00000000000200000001000000
      0000000001000000C800000014000000010000000000000200D90400000F0043
      61626563616C686F46696C69616C00020100000000DC000000F50200001C0000
      003900100001000000000000000000FFFFFF1F000000003B005B4946285B4167
      727570617246696C69616C5D3D547275652C205B717279666C75786F64657461
      6C6861646F2E2266696C69616C225D2C2727295D00000000000000FFFF000000
      000002000000010000000000000001000000C800000014000000010000000000
      000200450500000C00526F6461706546696C69616C00020100000000A4010000
      F5020000190000003900110001000000000000000000FFFFFF1F000000000000
      00000000000000FFFF000000000002000000010000000000000001000000C800
      000014000000010000000000000200B60500001100526F64617065477275706F
      46696C69616C00020100000000D0010000F50200001900000039001100010000
      00000000000000FFFFFF1F00000000000000000000000000FFFF000000000002
      000000010000000000000001000000C800000014000000010000000000000200
      4506000011004361626563616C686F4F7065726163616F000201000000000E01
      0000F5020000000000003900100001000000000000000000FFFFFF1F00000000
      1E005B717279666C75786F646574616C6861646F2E226F7065726163616F225D
      00000000000000FFFF000000000002000000010000000000000001000000C800
      000014000000010000000000000200260700001300526F6461706553616C646F
      416E746572696F720002010000000078010000F5020000120000003900110001
      000000000000000000FFFFFF1F0000000000000000000005000500626567696E
      0D2B0020206966205B6F7065726163616F5D203D202731202D2053414C444F20
      414E544552494F5227207468656E0D13002020202076697369626C65203A3D20
      547275650D1A002020656C73652076697369626C65203A3D2046616C73653B20
      200D0300656E64000100000000000002000000010000000000000001000000C8
      000000140000000100000000000002008F0700000900666276526F6461706500
      0201000000007C020000F50200000D0000003000030001000000000000000000
      FFFFFF1F00000000000000000000000000FFFF00000000000200000001000000
      0000000001000000C800000014000000010000000000000000140800000A006D
      6D6F5A65627261646F0002002F0000002E0100009A0200000B00000003000000
      01000000000000000000FFFFFF1F2C0200000000000000000000000100000000
      0000020000000100000000090068656C76657469636100070000000000000000
      00100000000100020000000000FFFFFF00000000020000000000000000009408
      000005004D656D6F380002002E00000073000000990200000C00000043000F00
      01000000000000000000FFFFFF1F2C020000000000000000000000FFFF000000
      0000020000000100000000090068656C76657469636100070000000000000000
      00120000000100020000000000FFFFFF00000000020000000000000000001A09
      000005004D656D6F310002002E000000730000003B0000000C00000043000F00
      01000000000000000000FFFFFF1F2C0200000000000100040044415441000000
      00FFFF0000000000020000000100000000090068656C76657469636100070000
      000000000000000A0000000100020000000000FFFFFF00000000020000000000
      00000000A509000005004D656D6F370002002F01000073000000450000000C00
      000043000F0001000000000000000000FFFFFF1F2C0200000000000100090041
      205245434542455200000000FFFF000000000002000000010000000009006865
      6C76657469636100070000000000000000000A0000000100020000000000FFFF
      FF00000000020000000000000000002F0A000006004D656D6F31300002003002
      000073000000490000000C00000043000F0001000000000000000000FFFFFF1F
      2C020000000000010007004120504147415200000000FFFF0000000000020000
      000100000000090068656C76657469636100070000000000000000000A000000
      0100020000000000FFFFFF0000000002000000000000000000B70A000006004D
      656D6F323000020079020000730000004E0000000C00000043000F00F4010000
      000000000000FFFFFF1F2C0200000000000100050053414C444F00000000FFFF
      0000000000020000000100000000090068656C76657469636100070000000000
      000000000A0000000100020000000000FFFFFF00000000020000000000000000
      009F0B000008004D656D6F446174610002002F0000002E0100003A0000000B00
      00006300000001000000000000000000FFFFFF1F2C020000000000010063005B
      494628646174616D6F76696D656E746F3D2730312F30312F31393030272C2027
      416E746572696F72272C20464F524D41544441544554494D45282764642F6D6D
      2F7979272C20535452544F4441544528646174616D6F76696D656E746F292920
      295D0000000001000000000000020000000100000006090068656C7665746963
      610007000000000000000000000000000100020000000000FFFFFF0000000002
      000000000000000000320C00000D004D656D6F56616C6F726152656300020027
      0100002E0100004D0000000B0000004300000001000000000000000000FFFFFF
      1F2C020000000000010009005B566C72615265635D0000000001000000000000
      020000000100000006090068656C766574696361000700000000000000000011
      0000000100020000000000FFFFFF0000000002000000000000000000C50C0000
      0D004D656D6F56616C6F7261506167000200300200002E010000490000000B00
      00004300000001000000000000000000FFFFFF1F2C020000000000010009005B
      566C72615061675D000000000100000000000002000000010000000609006865
      6C7665746963610007000000000000000000110000000100020000000000FFFF
      FF0000000002000000000000000000530D000006004D656D6F3834000200BA00
      0000060200005F000000110000004300000001000000000000000000FFFFFF1F
      2C02000000000001000B00544F54414C20474552414C00000000FFFF00000000
      00020000000100000000090068656C7665746963610007000000000000000000
      010000000100020000000000FFFFFF0000000002000000000000000000E00D00
      0006004D656D6F38360002002301000006020000510000001100000043000000
      01000000000000000000FFFFFF1F2C02000000000001000A005B54566C726152
      65635D00000000FFFF0000000000020000000100000000090068656C76657469
      63610007000000020000000000010000000100020000000000FFFFFF00000000
      020000000000000000006D0E000006004D656D6F393200020028020000060200
      0051000000110000004300000001000000000000000000FFFFFF1F2C02000000
      000001000A005B54566C72615061675D00000000FFFF00000000000200000001
      00000000090068656C7665746963610007000000020000000000010000000100
      020000000000FFFFFF0000000002000000000000000000460F000006004D656D
      6F32310002007B0200002E0100004C0000000B00000043000000010000000000
      00000000FFFFFF1F2C020000000000010056005B6966285B4578696269725361
      6C646F5D3D547275652C5B4946286F7065726163616F3C3E2731202D2053414C
      444F20414E544552494F52272C20545473616C646F2C20545453616C646F5F41
      6E74295D2C2727295D00000000FFFF0000000000020000000100000006090068
      656C7665746963610007000000000000000000110000000100020000000000FF
      FFFF0000000002000000000000000000D20F000006004D656D6F32320002007A
      020000060200004D000000110000004300000001000000000000000000FFFFFF
      1F2C020000000000010009005B545473616C646F5D00000000FFFF0000000000
      020000000100000000090068656C766574696361000700000002000000000001
      0000000100020000000000FFFFFF000000000200000000000000000064100000
      06004D656D6F36370002002E000000B3000000600000001400000043000F00F4
      010000000000000000FFFFFF1F2C02000000000001000F00475255504F204445
      2046494C49414C00000000FFFF0000000000020000000100000000090068656C
      7665746963610007000000000000000000090000000100020000000000FFFFFF
      0000000002000000000000000000F410000006004D656D6F3638000200930000
      00B30000001E0000001400000043000F00F4010000000000000000FFFFFF1F2C
      02000000000001000D005B477275706F46696C69616C5D00000000FFFF000000
      0000020000000100000000090068656C76657469636100070000000000000000
      00090000000100020000000000FFFFFF00000000020000000000000000008811
      000006004D656D6F3639000200B6000000B30000004D0100001400000041000F
      00F4010000000000000000FFFFFF1F2C020000000000010011005B4E6F6D6547
      7275706F46696C69616C5D00000000FFFF000000000002000000010000000009
      0068656C76657469636100070000000200000000000800000001000200000000
      00FFFFFF00000000020000000000000000001112000006004D656D6F32330002
      0062000000E00000002C0000001400000043000F00F4010000000000000000FF
      FFFF1F2C0200000000000100060046494C49414C00000000FFFF000000000002
      0000000100000000090068656C76657469636100070000000000000000000900
      00000100020000000000FFFFFF00000000020000000000000000009C12000006
      004D656D6F363400020093000000E00000001E0000001400000043000F00F401
      0000000000000000FFFFFF1F2C020000000000010008005B46696C69616C5D00
      000000FFFF0000000000020000000100000000090068656C7665746963610007
      000000000000000000090000000100020000000000FFFFFF0000000002000000
      0000000000002B13000006004D656D6F3635000200B6000000E00000004D0100
      001400000041000F00F4010000000000000000FFFFFF1F2C0200000000000100
      0C005B4E6F6D6546696C69616C5D00000000FFFF000000000002000000010000
      0000090068656C76657469636100070000000200000000000800000001000200
      00000000FFFFFF0000000002000000000000000000BA13000006004D656D6F36
      31000200BA000000A80100005F00000011000000430000000100000000000000
      0000FFFFFF1F2C02000000000001000C00544F54414C2046494C49414C000000
      00FFFF0000000000020000000100000000090068656C76657469636100070000
      00000000000000010000000100020000000000FFFFFF00000000020000000000
      000000004714000006004D656D6F323500020023010000A80100005100000011
      0000004300000001000000000000000000FFFFFF1F2C02000000000001000A00
      5B54566C72615265635D00000000FFFF00000000000200000001000000000900
      68656C7665746963610007000000020000000000010000000100020000000000
      FFFFFF0000000002000000000000000000D414000006004D656D6F3331000200
      28020000A801000051000000110000004300000001000000000000000000FFFF
      FF1F2C02000000000001000A005B54566C72615061675D00000000FFFF000000
      0000020000000100000000090068656C76657469636100070000000200000000
      00010000000100020000000000FFFFFF00000000020000000000000000006015
      000006004D656D6F33360002007A020000A80100004D00000011000000430000
      0001000000000000000000FFFFFF1F2C020000000000010009005B545473616C
      646F5D00000000FFFF0000000000020000000100000000090068656C76657469
      63610007000000020000000000010000000100020000000000FFFFFF00000000
      02000000000000000000EE15000006004D656D6F3337000200BA000000D40100
      005F000000110000004300000001000000000000000000FFFFFF1F2C02000000
      000001000B00544F54414C20475255504F00000000FFFF000000000002000000
      0100000000090068656C76657469636100070000000000000000000100000001
      00020000000000FFFFFF00000000020000000000000000007B16000006004D65
      6D6F333900020023010000D40100005100000011000000430000000100000000
      0000000000FFFFFF1F2C02000000000001000A005B54566C72615265635D0000
      0000FFFF0000000000020000000100000000090068656C766574696361000700
      0000020000000000010000000100020000000000FFFFFF000000000200000000
      00000000000817000006004D656D6F343500020028020000D401000051000000
      110000004300000001000000000000000000FFFFFF1F2C02000000000001000A
      005B54566C72615061675D00000000FFFF000000000002000000010000000009
      0068656C76657469636100070000000200000000000100000001000200000000
      00FFFFFF00000000020000000000000000009417000006004D656D6F35310002
      007A020000D40100004D000000110000004300000001000000000000000000FF
      FFFF1F2C020000000000010009005B545473616C646F5D00000000FFFF000000
      0000020000000100000000090068656C76657469636100070000000200000000
      00010000000100020000000000FFFFFF00000000020000000000000000003018
      00000C006D6D6F686973746F7269636F0002006C0000002E010000B80000000B
      0000004300000001000000000000000000FFFFFF1F2C02000000000001001300
      5B64657363726963616F6576656E746F5F635D00000000FFFF00000000000200
      00000100000006090068656C7665746963610007000000000000000000100000
      000100020000000000FFFFFF0000000002000000000000000000C51800000500
      4D656D6F32000200780100002E010000B40000000B0000004300000001000000
      000000000000FFFFFF1F2C020000000000010013005B64657363726963616F65
      76656E746F5F645D00000000FFFF000000000002000000010000000609006865
      6C7665746963610007000000000000000000100000000100020000000000FFFF
      FF0000000002000000000000000000B019000005004D656D6F330002009A0000
      00780100007F000000110000004300000001000000000000000000FFFFFF1F2C
      020000000000010069005B494628646174616D6F76696D656E746F3D2730312F
      30312F31393030272C2027544F54414C20414E544552494F52272C20464F524D
      41544441544554494D45282764642F6D6D2F7979272C20535452544F44415445
      28646174616D6F76696D656E746F292920295D00000000FFFF00000000000200
      00000100000000090068656C7665746963610007000000000000000000010000
      000100020000000000FFFFFF0000000002000000000000000000401A00000500
      4D656D6F34000200230100007801000051000000110000004300000001000000
      000000000000FFFFFF1F2C02000000000001000E005B54566C72615265635F41
      6E745D00000000FFFF0000000000020000000100000000090068656C76657469
      63610007000000020000000000010000000100020000000000FFFFFF00000000
      02000000000000000000D01A000005004D656D6F350002002402000078010000
      55000000110000004300000001000000000000000000FFFFFF1F2C0200000000
      0001000E005B54566C72615061675F416E745D00000000FFFF00000000000200
      00000100000000090068656C7665746963610007000000020000000000010000
      000100020000000000FFFFFF00000000020000000000000000008C1B00000500
      4D656D6F360002007A020000780100004D000000110000004300000001000000
      000000000000FFFFFF1F2C02000000000001003A005B4946286F706572616361
      6F3C3E2731202D2053414C444F20414E544552494F52272C20545473616C646F
      2C20545453616C646F5F416E74295D00000000FFFF0000000000020000000100
      000000090068656C766574696361000700000002000000000001000000010002
      0000000000FFFFFF0000000002000000000000000400DB1B000005004C696E65
      310002002E000000780100009A0200000000000001000800F401000000000000
      0000FFFFFF1F2C020000000000000000000000FFFF0000000000020000000100
      00000004002A1C000005004C696E65320002002E0000008A0100009A02000000
      00000001000800F4010000000000000000FFFFFF1F2C02000000000000000000
      0000FFFF00000000000200000001000000000000B81C00000900666D764F7574
      7261730002005401000047000000320100002800000043000000F40100000000
      00000000FFFFFF1F2C020000000000010008005B4F75747261735D00000000FF
      FF0000000000020000000100000000090068656C766574696361000700000000
      0000000000020000000100020000000000FFFFFF000000000200000000000000
      0100DD34000007006670764C6F676F000200300000002E000000780000002A00
      000007000000F4010000000000000000FFFFFF1F2C0200000000000000000000
      00FFFF00000000000200000001000000000100DD340000424DCE170000000000
      0036040000280000008300000026000000010008000000000098130000120B00
      00120B0000000100000001000000000000E8E5A800AA9E000099990000ADADAD
      003A3C4100A3970000BFB73700D8D48600FBFAF000A5A5A5001E1D1C00D8D9DA
      0054575A00D6D6D500E7E8F20012161B00B6AD1900CBC55B008C8D9200BEC0C5
      00E1E2E40085878A005E606300494C4F00090D12002C2E3300DEDB98007D7F81
      00EFEDCB00B9BABB00AEA400007C7B7B00C5BE440066666600D1CC6F00CDC981
      0048484600F7F6E600AFA5080004080D00F9F8ED00B8AF2700DBD68C00999999
      001B1A1900C6BF5100131312003B3A3A00FFFFFF00EAE8BE00CCCCCC0023262A
      00E2DEA400F1EFD600B0B1B300D3CD7500B1A81000CCCC660072727200535252
      004342420001060A00ECE9C3008C8C8B00F5F4DF004A4A4A0057575600B6AC1F
      00282B3000C7C05C0061615F00F7F7F70088888700DDD89300E3E0A600FDFCF7
      0021242900070A1000BDB53100C5BE4A00E3E3E200A69C000099999900BABAB9
      00DEDEDE00525458002A292800D9D58A005F5E5D00C7C595001B1E2300E8E5B6
      0000000700B5AB1300D5D07B00C6C6C500B2A80B0021202000B9B12400504F4E
      00666666006B6D7000B5B5BD0084848400E0DC9E00BCB42C00F7EFD6005B5B5A
      00EFEFEF0087898B00DEDEE6003E3D3C0014181E00C8C25300CCC55F00A8A9AC
      00BDBDBC00E5E1AC0075767900181B2000E6E6E6000E11170008101900333333
      00929191002D2C2B00B5B5B40000000000000000000000000000000000000000
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
      0000000000000000000000000031313131313131313131313131313131313131
      313131313131313131313131313131313131313131313131543D42470E313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131313131523131313131486D3131316D6D4C3131
      316D6D313131313131313131316D4831313131313131316D6D3131316D040A6C
      6C313131313131486D6D4C3131313131316D6D4C313131313131313131313131
      486D6D6D313131313131486D6D48313131316D483131316D6D31313131313131
      31313131316D6D6D3131486D6D6D31313131313152313131317F7E6631554225
      256031603D42647931420C313B7D316D6C3D70403131662C316D593D70683131
      33646C702531484255312C70643059313131310C2525420E31477431420E4825
      793131315442433D474C4C640E3120423C300A3131207E2C317F702547484842
      51512531603C316D59253C620A312C25433068313131313152313131316C2031
      315959313131317C7D4C4C31487C0E3159683177424C51347531434031203D48
      7957543130494C7F3D31487C0C310B37317F70313131313C6631313131642C31
      7C33487E51313131313179602F55317C3331316D793B7031487E143148570431
      31316D7C55557E311E3031542D4C314340313148790A0B4C3131313152313131
      31477D313125306C64334C5779313131487C0E31224931422C31314340316C7D
      313C7D3131594931570C31543D31487C0C3168705930253131313170706C3C0E
      313C0A313033317C513131310C702570474C4C3033312C7C64300A3148300E31
      796243432248483051517C31603D316D6464590B2C31547C42301C3131313131
      52313131314749313166420C5548313D2C484831487C0E48302C311C42485162
      75316C7D31493D4879627F31256848373031487C0E3131550E20703131313147
      3C0C554831642C4C7E330C62793131316830796D3131487C3331577D6D6D3131
      48303331487C49555131487C0C0C7E4C2C703131480C0E7C2C313C476D6D3131
      3131313152313131040B7E20316D473C6C33310E3D3C6C7931254264646D3148
      6C42706831316C7D31484742702031310E3D433D6C31484355314043473D0A31
      313131796C3C6C0E316670597E3C3D20313131310E256C6C7731316C0E312C3D
      47430431772F3D0A3133424366484825643C7E6C7C74316D225943425531543D
      59437D3131313131523131316D643B6D3131316D514831313179514C316D5179
      3131313131796D3131313C40313131796D313131313179794831317F6D316D15
      154831313131313131795148314879516D796D3131313131313151517931317F
      6D31316D51516D3151577F6D313131797931316D51516D514831313151515131
      3131314851516D31313131315231313131400431313131313131313131313131
      3131313131313131313131313131680431313131313131313131313131314866
      0F31313131313131313131313131313131313131313131313131313131313131
      313131220E313131313131313166553131313131313131313131313131313131
      3131313131313131313131313131313152313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131315C46121212463F31313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131523131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131315F06020202061B313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131313131313131313131523131313131310E
      40173C18183D6E3131313131310C2C666C3C181818181805683131313131316D
      3768220D0516313131313108021F1F1F52353131313131720707070707070707
      07070707070750732B3631313131313131313131362B73212112081D31313131
      313131313123505050504B3131313131313131313F08122E5050500852313131
      31312C103E191919195D17313131317966713E4E191919191919195D0D313131
      31312C34282819190017313131313108021F1F1F523531313131311152020202
      020202020202020202020202022776313131313131313F501F02020202020202
      075C313131313131316A060202065F313131313131314C120202020202020221
      523131313175287A78787878784E223131310E1A3E1078787171717171717128
      1731313131773E7A717171712822313131313108021F1F1F5235313131313144
      021F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1D31313131310802021F1F1F1F
      1F1F1F1F02022331313131313107021F1F0208313131313131313A521F1F1F1F
      1F1F1F5052313131310D4E7878787A7A71282231316D7C4E7878784E4E7A7171
      71717128173131312C3E7171717119195D22313131313108021F1F1F5269314C
      4C4C4C631F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F52503131313138521F1F
      1F0202020202021F1F1F5212313131313107021F1F0208313131313131361F1F
      1F1F1F0202020221523131316D457A78787A3D370E0E5131313B3E7878787A22
      74140E0E0E0E0E0E15313115787A787871190D0A145A2A6A6A6A2A5F36363636
      365044111111113226262626262626262626262626264A1F1F1F1F612631311B
      521F1F1F02443A08082363021F1F1F525F3131313107021F1F02083131313131
      311B021F1F1F1F6A2B353532523131310E71717171710C313131313115781078
      784E683131313131313131313131311C287878787A2C3131310106020202025F
      31313131315052020202023631313131313131313131313131313144021F1F1F
      32312639021F1F1F584C31313131311B27021F1F1F3631313107021F1F020831
      313131313123021F1F1F11093131313152313131337A71717145483131313131
      2C28787810344C313131313131313131313131057A78784E663131313135021F
      1F1F025F313131313150021F1F1F1F3631313131313131313131313131314C5E
      021F1F0276315F521F1F1F4B313131313131313132271F1F527331313107021F
      1F020831313131313112021F1F0272313131313152313131601978787A7C4C31
      31313131662878781045166E6E6E6E6E6E6E6E1C0431555B1078717A60313131
      3135021F1F1F025F313131313150021F1F1F1F36313131313131314C09090909
      09363A021F1F1F1F3F314F021F02723131313131313131313123021F1F110931
      3107021F1F02083131313131312E021F1F027331313131315231313160197878
      7A054C3131313131561978787871282828282828282828005631337A71717134
      6D313131313552020202025F31313131312106020202023631313131762E635E
      61616161611F1F1F1F1F1F114C26611F1F0276313131313131313131311D1F1F
      1F1F1D313107021F1F02083131313131312E021F1F023A313131313152313131
      601978787A054C31313131311819787878787878787878787878784E17311419
      78787A454831313131764444444444241551515151464F4F4F4F4F413131313A
      0202021F1F1F1F1F1F1F1F1F1F1F521B311D1F1F1F1F36313131313131313131
      3126391F1F1F5C313107021F1F02083131313131312E021F1F023A3131313131
      52313131601978787A054C31313131315619787878787878787878787878784E
      1731337A717171346D313131313109090909097D713434347A37313131313131
      313158521F1F1F1F1F0202020202020202275831311D1F1F1F1F1D3131313131
      313131313126391F1F1F5C313107021F1F02083131313131312E021F1F023A31
      3131313152313131601978787A054C3131313131224E787878784E2828282828
      2828280056310C787171715B0C31313131313131313131133E1010105D743131
      31313131312939021F1F1F1F3911636363636A50083631313126611F1F024B31
      3131313131313131313F021F1F1F36313107021F1F02083131313131312E021F
      1F023A313131313152313131601978787A054C313131313116287878101A2C2C
      2C2C2C2C2C2C2C7D1E316D1A7A7878197F31313131313131313131134E787878
      28743131313131313176021F1F1F1F2326313131313131313131313131310702
      1F02213131313131313131313173021F1F444C313107021F1F02083131313131
      312E021F1F023A313131313152313131601978787A054C31313131317F197171
      713448313131313131313131313131561978784E663131313131313131313113
      4E7878782874313131313131312B521F1F1F6129313131313131313131313131
      313158521F1F024A31313131313131317602021F522331313107021F1F020831
      31313131312E021F1F023A313131313152313131331978787A05313131313131
      6D347A78784E133131313131313131313131317D287878717104313131313131
      31313113001919190004313131313131312B521F1F1F27413131313131313131
      3131313131310911021F1F1F232631313131295F1F1F1F1F612931313107021F
      1F022B3131313131312E021F1F52233131313131520E14602C7A78787A7C1414
      14140C3131203E78787171660A1E6014141414140E3131155B107878107A567D
      371E1E1E1E1E1E13566C6C6C182C75757575756D315C021F1F1F1F211B1B1B1B
      1B1B4A4A4A4A4A3631313176021F1F1F0261502323725E021F1F1F0258762B2B
      4A44021F1F1F504A4A4A2B1D312E021F1F1F074A4A4A4A5C520D7A7A7A787878
      78787A7A7A5D1731317945197878784E4E7A7A7A7A7A7A5D6C313131165D7171
      717119191919191919195D6E313131313166007A7A7A4E1431295E021F1F1F02
      02020202020202020202062B313131315802021F1F1F020202021F1F1F1F5238
      4C395252521F1F1F1F1F020202020608312E021F1F1F1F020202022152177171
      7878787878787171714E22313131335B28717878787871717171714E17313131
      31173E7A717878787878787878784E6E313131313166287171717A6031314A52
      1F1F1F1F1F1F1F1F1F1F1F1F1F1F524A31313131316939521F1F1F1F1F1F1F1F
      020258310911021F1F1F1F1F1F1F1F1F1F1F022B312E021F1F1F1F1F1F1F1F50
      520D19191978787878781919190017313131310C0D10284E4E19191919191900
      0D31313131317D1A4E4E4E19191919191919001C313131313166287878781060
      3131315F0202020202020202020202020202062B313131313131367339020202
      02020261721D313129615252521F1F1F1F1F020202020608312E021F1F1F1F02
      02020221527D17173C107878714D1717170D2C3131313131310E0A1C3B221717
      1717170D7D31313131313148757D77661717171717170D043131313131662878
      7878106031313131364A3A7272727272727272727272505C3131313131313131
      264B5F737338354131313131093A7272725E1F1F1F1F4F1212122E5C312E021F
      1F1F631212121258523131310E1978787A053131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3117003E3E3E5D75313131313131313131313131313131313131313131313131
      31313131313131313131313131313131313131313107021F1F52583131313131
      312E021F1F0223313131313152313131601978787A054C313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131317F686E6E6E6E153131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313121021F1F020731
      31313131312E021F1F023A313131313152313131601978787A054C3131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131313131313131313131313131313173021F
      1F1F1F4F3A233A32312E021F1F023A313131313152313131601978787A054C31
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3169521F1F1F1F0202020608312E021F1F023A31313131315231313160197878
      7A054C3131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131310963521F1F1F1F1F1F024A312E021F1F023A313131313152313131
      601971717A054C31313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131314150611F1F1F1F1F024A3150021F1F023A3131313131
      523131310C0D17176C774C313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131315C3872727272725C31082E2E2E2E1B31
      313131315200008335000013006D6D6F464F4E4546494C49414C424153455F52
      000200AC0000005B000000AA0000000A00000004000000F40100000000000000
      00FFFFFF1F2C02000000000001001600464F4E453A205B464F4E4546494C4941
      4C424153455D00000000FFFF0000000000020000000100000000090068656C76
      65746963610006000000000000000000100000000100020000000000FFFFFF00
      000000020000000000000000003836000014006D6D6F454E44455245434F5F42
      414952524F5F52000200AC00000045000000AB0000000A00000000000000F401
      0000000000000000FFFFFF1F2C020000000000010024005B52554146494C4941
      4C424153455D202D205B42414952524F46494C49414C424153455D00000000FF
      FF0000000000020000000100000000090068656C766574696361000600000000
      0000000000100000000100020000000000FFFFFF000000000200000000000000
      00000537000012006D6D6F4345505F4349444144455F55465F52000200AC0000
      0050000000AB0000000A00000000000000F4010000000000000000FFFFFF1F2C
      02000000000001003E004345503A205B43455046494C49414C424153455D202D
      205B43494441444546494C49414C424153455D202D205B45535441444F46494C
      49414C424153455D00000000FFFF000000000002000000010000000009006865
      6C7665746963610006000000000000000000100000000100020000000000FFFF
      FF00000000020000000000000000009B37000008006D6D6F52415A414F000200
      AC0000002E000000AB0000001400000003000000F4010000000000000000FFFF
      FF1F2C020000000000010011005B52415A414F46494C49414C424153455D0000
      0000FFFF0000000000020000000100000006090068656C766574696361000600
      0000000000000000100000000100020000000000FFFFFF000000000200000000
      00000000002938000009006D6D6F544954554C4F000200540100002E00000032
      0100001700000002000000F4010000000000000000FFFFFF1F2C020000000000
      010008005B746974756C6F5D00000000FFFF0000000000020000000100000006
      090068656C766574696361000B00000002000000000002000000010002000000
      0000FFFFFF0000000002000000000000000000BA3800000F006D6D6F524F5455
      4C4F444154415F520002007C0200002E0000001C0000000C00000043000000F4
      010000000000000000FFFFFF1F2C02000000000001000500446174613A000000
      00FFFF0000000000020000000100000000090068656C76657469636100060000
      00000000000000000000000100020000000000FFFFFF00000000020000000000
      000000005139000009006D6D6F444154415F52000200990200002E0000002C00
      00000C00000043000000F4010000000000000000FFFFFF1F2C02000000000001
      0011005B4441544520234464642F6D6D2F79795D00000000FFFF000000000002
      0000000100000000090068656C76657469636100060000000000000000000100
      00000100020000000000FFFFFF0000000002000000000000000000E639000011
      006D6D6F524F54554C4F504147494E415F520002007C02000039000000280000
      000C00000043000000F4010000000000000000FFFFFF1F2C0200000000000100
      070050E167696E613A00000000FFFF0000000000020000000100000000090068
      656C7665746963610006000000000000000000000000000100020000000000FF
      FFFF0000000002000000000000000000753A00000B006D6D6F504147494E415F
      52000200A502000039000000200000000C00000043000000F401000000000000
      0000FFFFFF1F2C020000000000010007005B50414745235D00000000FFFF0000
      000000020000000100000000090068656C766574696361000600000000000000
      0000010000000100020000000000FFFFFF000000000200000000000000000012
      3B00000F006D6D6F524F44415045484F52415F520002002F0000007C02000058
      0000000A00000043000000F4010000000000000000FFFFFF1F2C020000000000
      010011005B54494D4520235468683A6D6D3A73735D00000000FFFF0000000000
      020000000100000000090068656C766574696361000700000000000000000010
      0000000100020000000000FFFFFF0000000002000000000000000000BB3B0000
      0C006D6D6F544543534F46545F52000200E80100007C020000DC0000000A0000
      0043000000F4010000000000000000FFFFFF1F2C020000000000010020007465
      63534F4654202D205465636E6F6C6F67696120656D2053697374656D61730000
      0000FFFF0000000000020000000100000000090068656C766574696361000700
      0000000000000000110000000100020000000000FFFFFF000000000200000000
      000000FEFEFF33000000070020546F7461697300000000030052756100000000
      0600436964616465000000000400466F6E65000000000600546974756C6F0000
      000006004F757472617300000000060042616972726F00000000060020446164
      6F73000000000B00477275706F46696C69616C000000000F004E6F6D65477275
      706F46696C69616C00000000060046696C69616C000000000A004E6F6D654669
      6C69616C000000000600566C72526563000100300008004A75726F7352656300
      010030000800546F74616C52656300010030000700566C726152656300010030
      0009004A75726F736152656300010030000900546F74616C6152656300010030
      000600566C72506167000100300008004A75726F735061670001003000080054
      6F74616C50616700010030000700566C7261506167000100300009004A75726F
      736150616700010030000900546F74616C6150616700010030000C0053616C64
      6F496E696369616C0001003000090064657363726963616F000000000D006461
      74616D6F76696D656E746F000000000D005453616C646F496E696369616C0001
      0030000B00686973746F7269636F5F63000000000B00686973746F7269636F5F
      64000000000C0020546F74616C697A6163616F00000000070054566C72526563
      000000000900544A75726F7352656300000000090054546F74616C5265630000
      0000080054566C7261526563000000000A00544A75726F736152656300000000
      0A0054546F74616C6152656300000000070054566C7250616700000000090054
      4A75726F7350616700000000090054546F74616C50616700000000080054566C
      7261506167000000000A00544A75726F7361506167000000000A0054546F7461
      6C61506167000000000700545453616C646F00010030000C0054566C72615265
      635F416E74000000000C0054566C72615061675F416E74000000000B00545453
      616C646F5F416E74000000000C00204167727570616D656E746F000000001200
      41677275706172477275706F46696C69616C00050046616C7365000D00416772
      7570617246696C69616C00050046616C7365000F005469706F646552656C6174
      6F72696F00010030000000000000000000FC0000000000000000000000000000
      00005800DCAC856ACE1FE5409931A36BCE1FE540}
  end
  object fdsFluxoDetalhado: TfrDBDataSet
    DataSet = qryFluxoDetalhado
    OpenDataSource = False
    Left = 352
    Top = 424
  end
  object qrysaldoFluxoCaixa: TtecQuery
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
      'select saldofluxoCaixa(current_date) as saldo')
    RequestLive = False
    Left = 216
    Top = 256
    object qrysaldoFluxoCaixasaldo: TFloatField
      FieldName = 'saldo'
      DisplayFormat = '0.00'
    end
  end
  object qryFluxoporEvento_aux: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryFluxoporEventoAfterOpen
    AfterScroll = qryFluxoporEventoAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'WhereFilialVenda'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WhereFilialRecebimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WhereFilialEmissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WhereFilialCheque'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Ordenacao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      '/*INICIO SALDO ANTERIOR*/'
      '('
      'select DATAS.*,'
      '        ACUMULADO.vlrarec,'
      '        ACUMULADO.descricaoevento_c,'
      '        ACUMULADO.vlrapag,'
      '        ACUMULADO.descricaoevento_d,'
      '        cast('#39'1 - SALDO ANTERIOR'#39' as varchar) as operacao,'
      #9'False as Totalizado'
      '  from'
      '('
      '('
      
        ' select   grupofilial,  nomegrupofilial,  filial, nomefilial, ca' +
        'st('#39'30/12/1899'#39' as date) as data'
      ' from'
      ' ('
      '  ('
      '   ('
      
        '    select  case when   :AgruparGrupoFilial    then fgf.grupo el' +
        'se cast(0 as integer) end as grupofilial,'
      
        '            case when :AgruparGrupoFilial    then gf.descricao e' +
        'lse null end as nomegrupofilial,'
      
        '            case when :AgruparFilial   then ct.filialvenda else ' +
        'cast(0 as integer) end as filial,'
      
        '            case when :AgruparFilial   then f.nome else null end' +
        ' as nomefilial'
      '    from ((contratos ct join parcelas p on ct.numero=p.contrato)'
      '                      join (filiais f'
      
        '  '#9#9'     left join (filiaisgruposfiliais fgf join gruposfiliais ' +
        'gf on fgf.grupo=gf.codigo)'
      '                       on f.codigo=fgf.filial)'
      '                      on ct.filialvenda=f.codigo)'
      '    where p.datapagto is null and (p.tipopagto is null) and'
      
        '        p.datavencto between (:DataInicialAcumulado) and (:DataF' +
        'inalAcumulado) and'
      
        '        ct.situacao in ('#39'F'#39','#39'N'#39','#39'P'#39') and not (contratos_renegoci' +
        'ado(ct.numero))'
      '              %WhereFilialVenda'
      
        '    order by UPPER(TO_ASCII(gf.descricao,'#39'LATIN1'#39')), fgf.grupo, ' +
        'f.nome, ct.filialvenda, p.datavencto'
      '   )'
      '   union'
      '   ('
      
        '    select  case when :AgruparGrupoFilial then fgf.grupo else ca' +
        'st(0 as integer) end as grupofilial,'
      
        '            case when :AgruparGrupoFilial then gf.descricao else' +
        ' null end as nomegrupofilial,'
      
        '            case when :AgruparFilial      then r.filial else cas' +
        't(0 as integer) end as filial,'
      
        '            case when :AgruparFilial      then f.nome else null ' +
        'end as nomefilial'
      '    from (recebimentos r join (filiais f '
      
        '                                   left join (filiaisgruposfilia' +
        'is fgf join gruposfiliais gf on fgf.grupo=gf.codigo)'
      '                                    on f.codigo = fgf.filial)'
      '                                  on r.filial = f.codigo)'
      
        '    where r.datavencto between (:DataInicialAcumulado) and (:Dat' +
        'aFinalAcumulado)'
      '      and not coalesce(r.confirmado,false)'
      '      and r.cheque is null'
      '      and r.situacao = '#39'N'#39
      '    %WhereFilialRecebimento'
      
        '    order by  UPPER(TO_ASCII(gf.descricao,'#39'LATIN1'#39')), fgf.grupo,' +
        ' f.nome, r.filial, r.datavencto'
      '   )'
      '  ) '
      '  ) AS RECEBIMENTOS'
      
        '  group by nomegrupofilial, grupofilial, nomefilial, filial, dat' +
        'a'
      ')'
      'union'
      '('
      
        ' select   grupofilial,  nomegrupofilial,  filial, nomefilial, ca' +
        'st('#39'30/12/1899'#39' as date) as data'
      ' from'
      ' ('
      
        '   select    case when  :AgruparGrupoFilial    then fgf.grupo el' +
        'se cast(0 as integer) end as grupofilial,'
      
        '             case when  :AgruparGrupoFilial    then gf.descricao' +
        ' else null end as nomegrupofilial,'
      
        '             case when  :AgruparFilial   then dp.filialemissao e' +
        'lse cast(0 as integer) end as filial,'
      
        '             case when  :AgruparFilial   then f.nome else null e' +
        'nd as nomefilial'
      
        '  from ((documentospag dp join duplicatas d on dp.numero=d.docum' +
        'entopag)'
      '                         join (filiais f'
      
        #9#9#9'  left join (filiaisgruposfiliais fgf join gruposfiliais gf o' +
        'n fgf.grupo=gf.codigo)'
      '                          on f.codigo=fgf.filial)'
      '                         on dp.filialemissao=f.codigo)'
      '  where d.datapagto is null and'
      
        '      d.datavencto between (:DataInicialAcumulado) and (:DataFin' +
        'alAcumulado)'
      '             %WhereFilialEmissao'
      
        ' order by UPPER(TO_ASCII(gf.descricao,'#39'LATIN1'#39')), fgf.grupo, f.n' +
        'ome, dp.filialemissao, d.datavencto'
      ' ) AS PAGAMENTOS'
      ' group by nomegrupofilial, grupofilial, nomefilial, filial, data'
      ')'
      ') as DATAS'
      ' left join'
      '  ('
      '   ('
      
        '    select   grupofilial,  filial, cast('#39'30/12/1899'#39' as date) as' +
        ' data,'
      '             descricaoevento_c,'
      #9'     cast(null as varchar) as descricaoevento_d,'
      #9'     sum(valorvencto) as vlrarec,'
      #9'     0.00 as vlrapag'
      '    from'
      '    ('
      '     ('
      
        '      select  case when  :agrupargrupofilial then fgf.grupo else' +
        ' cast(0 as integer) end as grupofilial,'
      
        '              case when :agruparfilial   then ct.filialvenda els' +
        'e cast(0 as integer) end as filial,'
      '              p.valorvencto,'
      
        '              cast('#39'PARCELAS EM ABERTO'#39' as varchar) as descricao' +
        'evento_c'
      
        '      from ((contratos ct join parcelas p on ct.numero=p.contrat' +
        'o)'
      
        '                          left join filiaisgruposfiliais fgf on ' +
        'ct.filialvenda=fgf.filial)'
      '      where p.datapagto is null and (p.tipopagto is null) and'
      
        '            p.datavencto between (:datainicialacumulado) and (:d' +
        'atafinalacumulado) and'
      
        '            ct.situacao in ('#39'f'#39','#39'n'#39','#39'p'#39') and not (contratos_rene' +
        'gociado(ct.numero))'
      '              %wherefilialvenda'
      '      order by fgf.grupo, ct.filialvenda, p.datavencto'
      '     )'
      '     union all'
      '     ('
      
        '      select  case when :AgruparGrupoFilial then fgf.grupo else ' +
        'cast(0 as integer) end as grupofilial,'
      
        '              case when :AgruparFilial      then r.filial else c' +
        'ast(0 as integer) end as filial,'
      '              r.valorvencto,'
      '              tr.descricao as descricaoevento_c'
      
        '      from ((recebimentos r join tiposrecebimentos tr on r.tipor' +
        'ecebimento = tr.codigo)'
      
        '                           left join filiaisgruposfiliais fgf on' +
        ' r.filial = fgf.filial)'
      
        '      where r.datavencto between (:DataInicialAcumulado) and (:D' +
        'ataFinalAcumulado)'
      '        and not coalesce(r.confirmado,false)'
      '        and r.cheque is null'
      '        and r.situacao = '#39'N'#39
      '      %WhereFilialRecebimento'
      '      order by fgf.grupo, r.filial, r.datavencto      '
      '     )'
      '    ) AS RECEBIMENTOS'
      '    group by grupofilial, filial, data, descricaoevento_c'
      '   )'
      '   union all'
      '   ('
      
        '    select  grupofilial, filial, cast('#39'30/12/1899'#39' as date) as d' +
        'ata,'
      #9'    cast(null as varchar) as descricaoevento_c,'
      
        '            cast(descricaoevento_d as varchar) as descricaoevent' +
        'o_d,'
      #9'    0.00 as vlrarec, sum(valorvencto) as vlrapag'
      '    from'
      '    ('
      
        '     select  case when :AgruparGrupoFilial   then fgf.grupo else' +
        ' cast(0 as integer) end as grupofilial,'
      
        '             case when :AgruparFilial   then dp.filialemissao el' +
        'se cast(0 as integer) end as filial,'
      '             d.valorvencto,'
      
        '             coalesce(e.descricao, '#39'PAGAMENTOS EM ABERTO'#39') as de' +
        'scricaoevento_d'
      
        '     from (((documentospag dp join duplicatas d on dp.numero=d.d' +
        'ocumentopag)'
      
        '                          left join eventos e on dp.evento=e.cod' +
        'igo)'
      
        '                             left join filiaisgruposfiliais fgf ' +
        'on dp.filialemissao = fgf.filial)'
      '     where d.datapagto is null and'
      
        '           d.datavencto between (:DataInicialAcumulado) and (:Da' +
        'taFinalAcumulado)'
      '             %WhereFilialEmissao'
      '     order by fgf.grupo, dp.filialemissao, d.datavencto'
      '    ) AS PAGAMENTOS'
      '   group by grupofilial, filial, data, descricaoevento_d'
      '   )'
      '  ) as ACUMULADO ON'
      '    DATAS.grupofilial = ACUMULADO.grupofilial and'
      '    DATAS.filial = ACUMULADO.filial and'
      '    DATAS.data = ACUMULADO.data'
      ')'
      'union all'
      '/*FINAL SALDO ANTERIOR*/'
      ''
      '/*DEFINI'#199#195'O DO SALDO INICIAL INFORMADO*/'
      '('
      ' select   grupofilial,  nomegrupofilial,  filial, nomefilial,'
      '          cast('#39'30/12/1899'#39' as date) as data,'
      '          vlrarec,'
      '          cast('#39'SALDO INICIAL'#39' as varchar) as descricaoevento_c,'
      '          cast(0 as numeric) as vlraPag,'
      '          cast(null as varchar) as descricaoevento_d,'
      
        '          cast('#39'2 - SALDO INICIAL'#39' as varchar) as operacao, Fals' +
        'e as Totalizado'
      ' from'
      ' ('
      '   select    cast(0 as integer) as grupofilial,'
      '             cast(null as varchar) as nomegrupofilial,'
      '             cast(0 as integer) as filial,'
      '             cast(null as varchar) as nomefilial,'
      '             cast(:SaldoInicial as numeric) as vlraRec'
      ' ) as TOTALSALDOINICIAL'
      ')'
      'union all'
      '/*FIM DA DEFINI'#199#195'O DO SALDO INICIAL INFORMADO*/'
      ''
      '/* INICIO DA DEFINI'#199#195'O DAS LINHAS DE DETALHE DO FLUXO */'
      '('
      'select DATAS.*,'
      '        DETALHE.vlrarec,'
      '        DETALHE.descricaoevento_c,'
      '        DETALHE.vlrapag,'
      '        DETALHE.descricaoevento_d,'
      
        '        cast('#39'3 - RELAT'#211'RIO'#39' as varchar) as operacao, False as T' +
        'otalizado'
      '  from'
      '('
      '('
      
        ' select   grupofilial,  nomegrupofilial,  filial, nomefilial, da' +
        'ta'
      ' from'
      ' ('
      '    select grupofilial,nomegrupofilial,filial,nomefilial,'
      '             primeirodiautil(filial,data,'#39'R'#39') as data'
      '    from'
      '    ('
      '      ('
      
        '        select    case when  :AgruparGrupoFilial    then fgf.gru' +
        'po else cast(0 as integer) end as grupofilial,'
      
        '                  case when  :AgruparGrupoFilial    then gf.desc' +
        'ricao else null end as nomegrupofilial,'
      
        '                  case when  :AgruparFilial   then ct.filialvend' +
        'a else cast(0 as integer) end as filial,'
      
        '                  case when  :AgruparFilial   then f.nome else n' +
        'ull end as nomefilial,'
      '                  p.datavencto as data'
      
        '        from ((contratos ct join parcelas p on ct.numero=p.contr' +
        'ato)'
      '                         join (filiais f'
      
        '  '#9'   '#9'     left join (filiaisgruposfiliais fgf join gruposfilia' +
        'is gf on fgf.grupo=gf.codigo)'
      '                       on f.codigo=fgf.filial)'
      '                      on ct.filialvenda=f.codigo)'
      '        where p.datapagto is null'
      '          and p.tipopagto is null'
      
        '          and p.datavencto between (:DataInicial) and (:DataFina' +
        'l)'
      
        '          and ct.situacao in ('#39'F'#39','#39'N'#39','#39'P'#39') and not (contratos_re' +
        'negociado(ct.numero))'
      '          %WhereFilialVenda'
      
        '        order by UPPER(TO_ASCII(gf.descricao,'#39'LATIN1'#39')), fgf.gru' +
        'po, UPPER(TO_ASCII(f.nome,'#39'LATIN1'#39')), ct.filialvenda, p.datavenc' +
        'to'
      '      )'
      '       union all'
      '     ('
      
        '        select  case when :AgruparGrupoFilial then fgf.grupo    ' +
        'else cast(0 as integer) end as grupofilial,'
      
        '                case when :AgruparGrupoFilial then gf.descricao ' +
        'else null               end as nomegrupofilial,'
      
        '                case when :AgruparFilial      then r.filial     ' +
        'else cast(0 as integer) end as filial,'
      
        '                case when :AgruparFilial      then f.nome       ' +
        'else null               end as nomefilial,'
      '                r.datavencto as data'
      '        from (recebimentos r join (filiais f '
      
        '                                   left join (filiaisgruposfilia' +
        'is fgf join gruposfiliais gf on fgf.grupo=gf.codigo)'
      '                                    on f.codigo = fgf.filial)'
      '                                  on r.filial = f.codigo)'
      
        '        where r.datavencto between (:DataInicial) and (:DataFina' +
        'l)'
      '          and not coalesce(r.confirmado,false)'
      '          and r.cheque is null'
      '          and r.situacao = '#39'N'#39
      '        %WhereFilialRecebimento'
      
        '        order by UPPER(TO_ASCII(gf.descricao,'#39'LATIN1'#39')), fgf.gru' +
        'po, UPPER(TO_ASCII(f.nome,'#39'LATIN1'#39')), r.filial, r.datavencto'
      '      ) '
      '       union all'
      '     ('
      
        '        select  case when :AgruparGrupoFilial then fgf.grupo    ' +
        'else cast(0 as integer) end as grupofilial,'
      
        '                case when :AgruparGrupoFilial then gf.descricao ' +
        'else null               end as nomegrupofilial,'
      
        '                case when :AgruparFilial      then ch.filial    ' +
        ' else cast(0 as integer) end as filial,'
      
        '                case when :AgruparFilial      then f.nome       ' +
        'else null               end as nomefilial,'
      '                ch.vencto as data'
      '        from (cheques ch join (filiais f '
      
        '                               left join (filiaisgruposfiliais f' +
        'gf join gruposfiliais gf on fgf.grupo=gf.codigo)'
      '                                    on f.codigo = fgf.filial)'
      '                                  on ch.filial = f.codigo)'
      '        where ch.vencto between (:DataInicial) and (:DataFinal)'
      '          and ch.situacao = '#39'N'#39
      '        %WhereFilialCheque'
      
        '        order by UPPER(TO_ASCII(gf.descricao,'#39'LATIN1'#39')), fgf.gru' +
        'po, UPPER(TO_ASCII(f.nome,'#39'LATIN1'#39')), ch.filial, ch.vencto'
      '      ) '
      '   ) AS RECEBIMENTOS'
      ' ) AS RECEBIMENTOS'
      
        '  group by nomegrupofilial, grupofilial, nomefilial, filial, dat' +
        'a'
      ')'
      'union'
      '('
      
        ' select   grupofilial,  nomegrupofilial,  filial, nomefilial, da' +
        'ta'
      ' from'
      ' ('
      '    select grupofilial,nomegrupofilial,filial,nomefilial,'
      '             primeirodiautil(filial,data,'#39'P'#39') as data'
      '    from'
      '    ('
      
        '     select    case when :AgruparGrupoFilial    then fgf.grupo e' +
        'lse cast(0 as integer) end as grupofilial,'
      
        '               case when :AgruparGrupoFilial    then gf.descrica' +
        'o else null end as nomegrupofilial,'
      
        '               case when :AgruparFilial   then dp.filialemissao ' +
        'else cast(0 as integer) end as filial,'
      
        '               case when :AgruparFilial   then f.nome else null ' +
        'end as nomefilial,'
      '               d.datavencto as data'
      
        '     from ((documentospag dp join duplicatas d on dp.numero=d.do' +
        'cumentopag)'
      '                         join (filiais f'
      
        #9#9#9'  left join (filiaisgruposfiliais fgf join gruposfiliais gf o' +
        'n fgf.grupo=gf.codigo)'
      '                          on f.codigo=fgf.filial)'
      '                         on dp.filialemissao=f.codigo)'
      '     where d.datapagto is null'
      '       and d.datavencto between (:DataInicial) and (:DataFinal)'
      '           %WhereFilialEmissao'
      
        '     order by UPPER(TO_ASCII(gf.descricao,'#39'LATIN1'#39')), fgf.grupo,' +
        ' UPPER(TO_ASCII(f.nome,'#39'LATIN1'#39')), dp.filialemissao, d.datavenct' +
        'o'
      '   ) AS PAGAMENTOS'
      ' ) AS PAGAMENTOS'
      ' group by nomegrupofilial, grupofilial, nomefilial, filial, data'
      ')'
      ') as DATAS'
      ''
      ' left join'
      ' ('
      '  ('
      '   select   grupofilial,  filial, data,'
      '            descricaoevento_c,'
      #9'    cast(null as varchar) as descricaoevento_d,'
      #9'    sum(valorvencto) as vlrarec,'
      #9'    0.00 as vlrapag'
      '   from'
      '   ('
      
        '     select grupofilial, filial, primeirodiautil(filial,data,'#39'R'#39 +
        ') as data, valorvencto, descricaoevento_c'
      '     from'
      '     ('
      '      ('
      
        '        select   case when :AgruparGrupoFilial    then fgf.grupo' +
        ' else cast(0 as integer) end as grupofilial,'
      
        '                 case when :AgruparFilial   then ct.filialvenda ' +
        'else cast(0 as integer) end as filial,'
      '                 p.datavencto as data,'
      '                 P.valorvencto,'
      
        '                 cast('#39'PARCELAS DE CONTRATOS'#39' as varchar) as des' +
        'cricaoevento_c'
      
        '        from ((contratos ct join parcelas p on ct.numero=p.contr' +
        'ato)'
      
        '                          left join filiaisgruposfiliais fgf on ' +
        'ct.filialvenda=fgf.filial)'
      '        where p.datapagto is null and (p.tipopagto is null) and'
      
        '              p.datavencto between (:DataInicial) and (:DataFina' +
        'l) and'
      
        '              ct.situacao in ('#39'F'#39','#39'N'#39','#39'P'#39') and not (contratos_re' +
        'negociado(ct.numero))'
      '                 %WhereFilialVenda'
      '        order by fgf.grupo, ct.filialvenda, p.datavencto'
      '      )'
      '       union all'
      '      ('
      
        '        select  case when :AgruparGrupoFilial then fgf.grupo    ' +
        'else cast(0 as integer) end as grupofilial,'
      
        '                case when :AgruparFilial      then r.filial     ' +
        'else cast(0 as integer) end as filial,'
      '                r.datavencto as data,'
      '                r.valorvencto,'
      '                tr.descricao as descricaoevento_c'
      
        '          from ((recebimentos r join tiposrecebimentos tr on r.t' +
        'iporecebimento = tr.codigo) '
      '                                join (filiais f left join '
      
        '                                              (filiaisgruposfili' +
        'ais fgf join gruposfiliais gf on fgf.grupo=gf.codigo)'
      '                                    on f.codigo = fgf.filial)'
      '                                  on r.filial = f.codigo)'
      
        '          where r.datavencto between (:DataInicial) and (:DataFi' +
        'nal)'
      '            and not coalesce(r.confirmado,false)'
      '            and r.cheque is null'
      '            and r.situacao = '#39'N'#39
      '          %WhereFilialRecebimento'
      '          order by fgf.grupo, r.filial, r.datavencto       '
      '      ) '
      '       union all'
      '      ('
      
        '          select  case when :AgruparGrupoFilial then fgf.grupo  ' +
        '  else cast(0 as integer) end as grupofilial,'
      
        '                  case when :AgruparFilial      then ch.filial  ' +
        '   else cast(0 as integer) end as filial,'
      '                  ch.vencto as data,'
      '                  ch.valor as valorvencto,'
      
        '                  cast('#39'CHEQUES'#39' as varchar) as descricaoevento_' +
        'c'
      '        from (cheques ch join (filiais f '
      
        '                               left join (filiaisgruposfiliais f' +
        'gf join gruposfiliais gf on fgf.grupo=gf.codigo)'
      '                                    on f.codigo = fgf.filial)'
      '                                  on ch.filial = f.codigo)'
      
        '          where ch.vencto between (:DataInicial) and (:DataFinal' +
        ')'
      '            and ch.situacao = '#39'N'#39
      '          %WhereFilialCheque'
      '          order by fgf.grupo, ch.filial, ch.vencto'
      '      ) '
      '     ) AS RECEBIMENTOS'
      '   ) AS RECEBIMENTOS'
      '    group by grupofilial, filial, data, descricaoevento_c'
      '   )'
      '   union all'
      '   ('
      '     select   grupofilial, filial, data,'
      #9'      cast(null as varchar) as descricaoevento_c,'
      
        '              cast(descricaoevento_d as varchar) as descricaoeve' +
        'nto_d,'
      '  '#9'      0.00 as vlrarec,'
      #9'      sum(valorvencto) as vlrapag'
      '     from'
      '     ('
      
        '      select grupofilial, filial, primeirodiautil(filial, data, ' +
        #39'P'#39') as data, valorvencto, descricaoevento_d'
      '      from'
      '      ('
      
        '      select  case when :AgruparGrupoFilial    then fgf.grupo el' +
        'se cast(0 as integer) end as grupofilial,'
      
        '              case when :AgruparFilial   then dp.filialemissao e' +
        'lse cast(0 as integer) end as filial,'
      '              d.datavencto as data,'
      '              d.valorvencto,'
      
        '              coalesce(e.descricao, '#39'OUTROS PAGAMENTOS'#39') as desc' +
        'ricaoevento_d'
      
        '      from (((documentospag dp join duplicatas d on dp.numero=d.' +
        'documentopag)'
      
        '                           left join eventos e on dp.evento = e.' +
        'codigo)'
      
        '                              left join filiaisgruposfiliais fgf' +
        ' on dp.filialemissao = fgf.filial)'
      '      where d.datapagto is null and'
      '            d.datavencto between (:DataInicial) and (:DataFinal)'
      '              %WhereFilialEmissao'
      '      order by fgf.grupo, dp.filialemissao, d.datavencto'
      '     ) AS PAGAMENTOS'
      '     ) AS PAGAMENTOS'
      '     group by grupofilial, filial, data, descricaoevento_d'
      '   )'
      '  ) as DETALHE ON'
      '    DATAS.grupofilial = DETALHE.grupofilial and'
      '    DATAS.filial = DETALHE.filial and'
      '    DATAS.data = DETALHE.data'
      ')'
      '%Ordenacao')
    RequestLive = True
    Left = 552
    Top = 352
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'AgruparGrupoFilial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AgruparFilial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicialAcumulado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataFinalAcumulado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SaldoInicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataFinal'
        ParamType = ptUnknown
      end>
    object IntegerField1: TIntegerField
      FieldName = 'grupofilial'
      DisplayFormat = '0'
    end
    object StringField1: TStringField
      FieldName = 'nomegrupofilial'
      Size = 50
    end
    object IntegerField2: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object StringField2: TStringField
      FieldName = 'nomefilial'
      Size = 50
    end
    object DateField1: TDateField
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object FloatField1: TFloatField
      FieldName = 'vlrarec'
      DisplayFormat = '0.00'
    end
    object FloatField2: TFloatField
      FieldName = 'vlrapag'
      DisplayFormat = '0.00'
    end
    object StringField3: TStringField
      FieldName = 'operacao'
      Size = 18
    end
    object BooleanField1: TBooleanField
      FieldName = 'totalizado'
    end
    object StringField4: TStringField
      FieldName = 'descricaoevento_c'
      Size = 23
    end
    object StringField5: TStringField
      FieldName = 'descricaoevento_d'
      Size = 17
    end
    object BooleanField2: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'ExibirSaldo'
      Calculated = True
    end
  end
  object qryFluxoDetalhado_aux: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryFluxoDetalhadoAfterOpen
    AfterScroll = qryFluxoDetalhadoAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'WhereFilialVenda'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WhereFilialRecebimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WhereFilialEmissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WhereFilialCheque'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Ordenacao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      '/*INICIO SALDO ANTERIOR*/'
      '('
      'select DATAS.*,'
      '        ACUMULADO.vlrarec,'
      '        ACUMULADO.descricaoevento_c,'
      '        ACUMULADO.vlrapag,'
      '        ACUMULADO.descricaoevento_d,'
      '        cast('#39'1 - SALDO ANTERIOR'#39' as varchar) as operacao,'
      #9'False as Totalizado'
      '  from'
      '('
      '('
      
        ' select   grupofilial,  nomegrupofilial,  filial, nomefilial, ca' +
        'st('#39'30/12/1899'#39' as date) as data'
      ' from'
      ' ('
      '  ('
      '   ('
      
        '    select  case when   :AgruparGrupoFilial    then fgf.grupo el' +
        'se cast(0 as integer) end as grupofilial,'
      
        '             case when :AgruparGrupoFilial    then gf.descricao ' +
        'else null end as nomegrupofilial,'
      
        '             case when :AgruparFilial   then ct.filialvenda else' +
        ' cast(0 as integer) end as filial,'
      
        '             case when :AgruparFilial   then f.nome else null en' +
        'd as nomefilial'
      '    from ((contratos ct join parcelas p on ct.numero=p.contrato)'
      '                    join (filiais f'
      #9#9'     left join (filiaisgruposfiliais fgf'
      #9#9'      left join gruposfiliais gf on fgf.grupo=gf.codigo)'
      '                     on f.codigo=fgf.filial)'
      '                    on ct.filialvenda=f.codigo)'
      '    where p.datapagto is null and (p.tipopagto is null) and'
      
        '      p.datavencto between (:DataInicialAcumulado) and (:DataFin' +
        'alAcumulado) and'
      
        '      ct.situacao in ('#39'F'#39','#39'N'#39','#39'P'#39') and not (contratos_renegociad' +
        'o(ct.numero))'
      '             %WhereFilialVenda'
      
        '    order by UPPER(TO_ASCII(gf.descricao,'#39'LATIN1'#39')), fgf.grupo, ' +
        'UPPER(TO_ASCII(f.nome,'#39'LATIN1'#39')), ct.filialvenda, p.datavencto'
      '   )'
      '   union'
      '   ('
      
        '    select  case when :AgruparGrupoFilial then fgf.grupo else ca' +
        'st(0 as integer) end as grupofilial,'
      
        '            case when :AgruparGrupoFilial then gf.descricao else' +
        ' null end as nomegrupofilial,'
      
        '            case when :AgruparFilial      then r.filial else cas' +
        't(0 as integer) end as filial,'
      
        '            case when :AgruparFilial      then f.nome else null ' +
        'end as nomefilial'
      '    from (recebimentos r join (filiais f '
      
        '                                   left join (filiaisgruposfilia' +
        'is fgf join gruposfiliais gf on fgf.grupo=gf.codigo)'
      '                                    on f.codigo = fgf.filial)'
      '                                  on r.filial = f.codigo)'
      
        '    where r.datavencto between (:DataInicialAcumulado) and (:Dat' +
        'aFinalAcumulado)'
      '      and not coalesce(r.confirmado,false)'
      '      and r.cheque is null'
      '      and r.situacao = '#39'N'#39
      '    %WhereFilialRecebimento'
      
        '    order by  UPPER(TO_ASCII(gf.descricao,'#39'LATIN1'#39')), fgf.grupo,' +
        ' f.nome, r.filial, r.datavencto'
      '   )'
      '  )'
      ' ) AS RECEBIMENTOS'
      
        '  group by nomegrupofilial, grupofilial, nomefilial, filial, dat' +
        'a'
      ')'
      'union'
      '('
      
        ' select   grupofilial,  nomegrupofilial,  filial, nomefilial, ca' +
        'st('#39'30/12/1899'#39' as date) as data'
      ' from'
      ' ('
      
        '   select    case when  :AgruparGrupoFilial    then fgf.grupo el' +
        'se cast(0 as integer) end as grupofilial,'
      
        '             case when  :AgruparGrupoFilial    then gf.descricao' +
        ' else null end as nomegrupofilial,'
      
        '             case when  :AgruparFilial   then dp.filialemissao e' +
        'lse cast(0 as integer) end as filial,'
      
        '             case when  :AgruparFilial   then f.nome else null e' +
        'nd as nomefilial'
      
        '  from ((documentospag dp join duplicatas d on dp.numero=d.docum' +
        'entopag)'
      '                         join (filiais f'
      #9#9#9'  left join (filiaisgruposfiliais fgf'
      #9#9#9'   left join gruposfiliais gf on fgf.grupo=gf.codigo)'
      '                          on f.codigo=fgf.filial)'
      '                         on dp.filialemissao=f.codigo)'
      '  where d.datapagto is null and'
      
        '      d.datavencto between (:DataInicialAcumulado) and (:DataFin' +
        'alAcumulado)'
      '             %WhereFilialEmissao'
      
        ' order by UPPER(TO_ASCII(gf.descricao,'#39'LATIN1'#39')), fgf.grupo, UPP' +
        'ER(TO_ASCII(f.nome,'#39'LATIN1'#39')), dp.filialemissao, d.datavencto'
      ' ) AS PAGAMENTOS'
      ' group by nomegrupofilial, grupofilial, nomefilial, filial, data'
      ')'
      ') as DATAS'
      ' left join'
      '  ('
      '   ('
      
        '    select   grupofilial,  filial, cast('#39'30/12/1899'#39' as date) as' +
        ' data,'
      '             descricaoevento_c,'
      #9'     cast(null as varchar) as descricaoevento_d,'
      #9'     sum(valorvencto) as vlrarec,'
      #9'     0.00 as vlrapag'
      '    from'
      '     ('
      '      ('
      '       ('
      
        '        select  case when  :AgruparGrupoFilial then fgf.grupo el' +
        'se cast(0 as integer) end as grupofilial,'
      
        '              case when :AgruparFilial   then ct.filialvenda els' +
        'e cast(0 as integer) end as filial,'
      '              P.valorvencto,'
      
        '              cast('#39'PRESTACOES EM ABERTO'#39' as varchar) as descric' +
        'aoevento_c'
      
        '        from ((contratos ct join parcelas p on ct.numero=p.contr' +
        'ato)'
      
        '                          left join filiaisgruposfiliais fgf on ' +
        'ct.filialvenda=fgf.filial)'
      '        where p.datapagto is null and (p.tipopagto is null) and'
      
        '            p.datavencto between (:DataInicialAcumulado) and (:D' +
        'ataFinalAcumulado) and'
      
        '            ct.situacao in ('#39'F'#39','#39'N'#39','#39'P'#39') and not (contratos_rene' +
        'gociado(ct.numero))'
      '              %WhereFilialVenda'
      '        order by fgf.grupo, ct.filialvenda, p.datavencto'
      '       )'
      '       union all '
      '       ('
      
        '        select  case when :AgruparGrupoFilial then fgf.grupo els' +
        'e cast(0 as integer) end as grupofilial,'
      
        '                case when :AgruparFilial      then r.filial else' +
        ' cast(0 as integer) end as filial,'
      '                r.valorvencto,'
      '                tr.descricao as descricaoevento_c'
      
        '        from ((recebimentos r join tiposrecebimentos tr on r.tip' +
        'orecebimento = tr.codigo)'
      
        '                             left join filiaisgruposfiliais fgf ' +
        'on r.filial = fgf.filial)'
      
        '        where r.datavencto between (:DataInicialAcumulado) and (' +
        ':DataFinalAcumulado)'
      '          and not coalesce(r.confirmado,false)'
      '          and r.cheque is null'
      '          and r.situacao = '#39'N'#39
      '        %WhereFilialRecebimento'
      '        order by fgf.grupo, r.filial, r.datavencto      '
      '       )'
      '      ) '
      '     ) AS RECEBIMENTOS'
      '     group by grupofilial, filial, data, descricaoevento_c'
      '   )'
      '   union all'
      '   ('
      
        '    select  grupofilial, filial, cast('#39'30/12/1899'#39' as date) as d' +
        'ata,'
      #9'    cast(null as varchar(250)) as descricaoevento_c,'
      
        '            cast(descricaoevento_d as varchar) as descricaoevent' +
        'o_d,'
      #9'    0.00 as vlrarec, sum(valorvencto) as vlrapag'
      '    from'
      '    ('
      
        '     select  case when :AgruparGrupoFilial   then fgf.grupo else' +
        ' cast(0 as integer) end as grupofilial,'
      
        '             case when :AgruparFilial   then dp.filialemissao el' +
        'se cast(0 as integer) end as filial,'
      '             d.valorvencto,'
      
        '             coalesce(e.descricao, '#39'PAGAMENTOS EM ABERTO'#39') as de' +
        'scricaoevento_d'
      
        '     from (((documentospag dp join duplicatas d on dp.numero=d.d' +
        'ocumentopag)'
      
        '                          left join eventos e on dp.evento=e.cod' +
        'igo)'
      
        '                             left join filiaisgruposfiliais fgf ' +
        'on dp.filialemissao = fgf.filial)'
      '     where d.datapagto is null and'
      
        '           d.datavencto between (:DataInicialAcumulado) and (:Da' +
        'taFinalAcumulado)'
      '             %WhereFilialEmissao'
      '     order by fgf.grupo, dp.filialemissao, d.datavencto'
      '    ) AS PAGAMENTOS'
      '   group by grupofilial, filial, data, descricaoevento_d'
      '   )'
      '  ) as ACUMULADO ON'
      '    DATAS.grupofilial = ACUMULADO.grupofilial and'
      '    DATAS.filial = ACUMULADO.filial and'
      '    DATAS.data = ACUMULADO.data'
      ')'
      'union all'
      '/*FINAL SALDO ANTERIOR*/'
      ''
      '/*DEFINI'#199#195'O DO SALDO INICIAL INFORMADO*/'
      '('
      ' select   grupofilial,  nomegrupofilial,  filial, nomefilial,'
      '          cast('#39'30/12/1899'#39' as date) as data,'
      '          vlrarec,'
      
        '          cast('#39'SALDO INICIAL'#39' as varchar(250)) as descricaoeven' +
        'to_c,'
      '          cast(0 as numeric) as vlraPag,'
      '          cast(null as varchar) as descricaoevento_d,'
      
        '          cast('#39'2 - SALDO INICIAL'#39' as varchar) as operacao, Fals' +
        'e as Totalizado'
      ' from'
      ' ('
      '   select    cast(0 as integer) as grupofilial,'
      '             cast(null as varchar) as nomegrupofilial,'
      '             cast(0 as integer) as filial,'
      '             cast(null as varchar) as nomefilial,'
      '             cast(:SaldoInicial as numeric) as vlraRec'
      ' ) as TOTALSALDOINICIAL'
      ')'
      'union all'
      '/*FIM DA DEFINI'#199#195'O DO SALDO INICIAL INFORMADO*/'
      ''
      '/* INICIO DA DEFINI'#199#195'O DAS LINHAS DE DETALHE DO FLUXO */'
      ''
      '('
      'select DATAS.*,'
      '        DETALHE.vlrarec,'
      '        DETALHE.descricaoevento_c,'
      '        DETALHE.vlrapag,'
      '        DETALHE.descricaoevento_d,'
      
        '        cast('#39'3 - RELATORIO'#39' as varchar) as operacao, False as T' +
        'otalizado'
      '  from'
      '('
      '('
      
        ' select   grupofilial,  nomegrupofilial,  filial, nomefilial, da' +
        'ta'
      ' from'
      ' ('
      '    select grupofilial,nomegrupofilial,filial,nomefilial,'
      '             primeirodiautil(filial,data,'#39'R'#39') as data'
      '    from'
      '    ('
      '     ('
      '      ('
      
        '       select    case when  :AgruparGrupoFilial    then fgf.grup' +
        'o else cast(0 as integer) end as grupofilial,'
      
        '                  case when  :AgruparGrupoFilial    then gf.desc' +
        'ricao else null end as nomegrupofilial,'
      
        '                  case when  :AgruparFilial   then ct.filialvend' +
        'a else cast(0 as integer) end as filial,'
      
        '                  case when  :AgruparFilial   then f.nome else n' +
        'ull end as nomefilial,'
      '                  p.datavencto as data'
      
        '       from ((contratos ct join parcelas p on ct.numero=p.contra' +
        'to)'
      '                         join (filiais f'
      '  '#9'   '#9'     left join (filiaisgruposfiliais fgf'
      '  '#9#9'      left join gruposfiliais gf on fgf.grupo=gf.codigo)'
      '                       on f.codigo=fgf.filial)'
      '                      on ct.filialvenda=f.codigo)'
      '       where p.datapagto is null'
      '          and p.tipopagto is null'
      
        '          and p.datavencto between (:DataInicial) and (:DataFina' +
        'l)'
      
        '          and ct.situacao in ('#39'F'#39','#39'N'#39','#39'P'#39') and not (contratos_re' +
        'negociado(ct.numero))'
      '          %WhereFilialVenda'
      
        '       order by UPPER(TO_ASCII(gf.descricao,'#39'LATIN1'#39')), fgf.grup' +
        'o, UPPER(TO_ASCII(f.nome,'#39'LATIN1'#39')), ct.filialvenda, p.datavenct' +
        'o'
      '     )'
      '     union all'
      '     ('
      
        '      select  case when :AgruparGrupoFilial then fgf.grupo    el' +
        'se cast(0 as integer) end as grupofilial,'
      
        '              case when :AgruparGrupoFilial then gf.descricao el' +
        'se null               end as nomegrupofilial,'
      
        '              case when :AgruparFilial      then r.filial     el' +
        'se cast(0 as integer) end as filial,'
      
        '              case when :AgruparFilial      then f.nome       el' +
        'se null               end as nomefilial,'
      '              r.datavencto as data'
      '      from (recebimentos r join (filiais f '
      
        '                                   left join (filiaisgruposfilia' +
        'is fgf join gruposfiliais gf on fgf.grupo=gf.codigo)'
      '                                    on f.codigo = fgf.filial)'
      '                                  on r.filial = f.codigo)'
      '      where r.datavencto between (:DataInicial) and (:DataFinal)'
      '        and not coalesce(r.confirmado,false)'
      '        and r.cheque is null'
      '        and r.situacao = '#39'N'#39
      '      %WhereFilialRecebimento'
      
        '      order by UPPER(TO_ASCII(gf.descricao,'#39'LATIN1'#39')), fgf.grupo' +
        ', UPPER(TO_ASCII(f.nome,'#39'LATIN1'#39')), r.filial, r.datavencto'
      '     ) '
      '     union all'
      '     ('
      
        '      select  case when :AgruparGrupoFilial then fgf.grupo    el' +
        'se cast(0 as integer) end as grupofilial,'
      
        '              case when :AgruparGrupoFilial then gf.descricao el' +
        'se null               end as nomegrupofilial,'
      
        '              case when :AgruparFilial      then ch.filial     e' +
        'lse cast(0 as integer) end as filial,'
      
        '              case when :AgruparFilial      then f.nome       el' +
        'se null               end as nomefilial,'
      '              ch.vencto as data'
      '      from (cheques ch join (filiais f '
      
        '                               left join (filiaisgruposfiliais f' +
        'gf join gruposfiliais gf on fgf.grupo=gf.codigo)'
      '                                    on f.codigo = fgf.filial)'
      '                                  on ch.filial = f.codigo)'
      '      where ch.vencto between (:DataInicial) and (:DataFinal)'
      '        and ch.situacao = '#39'N'#39
      '      %WhereFilialCheque'
      
        '      order by UPPER(TO_ASCII(gf.descricao,'#39'LATIN1'#39')), fgf.grupo' +
        ', UPPER(TO_ASCII(f.nome,'#39'LATIN1'#39')), ch.filial, ch.vencto'
      '     )'
      '    )'
      '   ) AS RECEBIMENTOS'
      ' ) AS RECEBIMENTOS'
      
        '  group by nomegrupofilial, grupofilial, nomefilial, filial, dat' +
        'a'
      ')'
      'union'
      '('
      
        ' select   grupofilial,  nomegrupofilial,  filial, nomefilial, da' +
        'ta'
      ' from'
      ' ('
      '    select grupofilial,nomegrupofilial,filial,nomefilial,'
      '             primeirodiautil(filial,data,'#39'P'#39') as data'
      '    from'
      '    ('
      
        '     select    case when :AgruparGrupoFilial    then fgf.grupo e' +
        'lse cast(0 as integer) end as grupofilial,'
      
        '               case when :AgruparGrupoFilial    then gf.descrica' +
        'o else null end as nomegrupofilial,'
      
        '               case when :AgruparFilial   then dp.filialemissao ' +
        'else cast(0 as integer) end as filial,'
      
        '               case when :AgruparFilial   then f.nome else null ' +
        'end as nomefilial,'
      '               d.datavencto as data'
      
        '     from ((documentospag dp join duplicatas d on dp.numero=d.do' +
        'cumentopag)'
      '                         join (filiais f'
      #9#9#9'  left join (filiaisgruposfiliais fgf'
      #9#9#9'   left join gruposfiliais gf on fgf.grupo=gf.codigo)'
      '                          on f.codigo=fgf.filial)'
      '                         on dp.filialemissao=f.codigo)'
      '     where d.datapagto is null'
      '       and d.datavencto between (:DataInicial) and (:DataFinal)'
      '           %WhereFilialEmissao'
      
        '     order by UPPER(TO_ASCII(gf.descricao,'#39'LATIN1'#39')), fgf.grupo,' +
        ' UPPER(TO_ASCII(f.nome,'#39'LATIN1'#39')), dp.filialemissao, d.datavenct' +
        'o'
      '   ) AS PAGAMENTOS'
      ' ) AS PAGAMENTOS'
      ' group by nomegrupofilial, grupofilial, nomefilial, filial, data'
      ')'
      ') as DATAS'
      ''
      ' left join'
      ' ('
      '  ('
      
        '     select grupofilial, filial, primeirodiautil(filial,data,'#39'R'#39 +
        ') as data,'
      '            descricaoevento_c,'
      #9'    cast(null as varchar) as descricaoevento_d,'
      '            valorvencto as vlrarec,'
      #9'    0.00 as vlrapag'
      '     from'
      '     ('
      '      ('
      '       ('
      
        '        select case when :AgruparGrupoFilial    then fgf.grupo e' +
        'lse cast(0 as integer) end as grupofilial,'
      
        '              case when :AgruparFilial   then ct.filialvenda els' +
        'e cast(0 as integer) end as filial,'
      '              p.datavencto as data,'
      '              P.valorvencto,'
      
        '              '#39'CT '#39'||lpad(cast(ct.numero as varchar(6)),6,'#39'0'#39')||' +
        #39'-'#39'||p.numero||'#39' '#39'||ct.nome as descricaoevento_c'
      
        '        from (((contratos ct join parcelas p on ct.numero=p.cont' +
        'rato)'
      
        '                        left join filiaisgruposfiliais fgf on ct' +
        '.filialvenda=fgf.filial)'
      
        '                        left join planos pl  on ct.plano=pl.codi' +
        'go)'
      ''
      '        where p.datapagto is null and (p.tipopagto is null) and'
      
        '             p.datavencto between (:DataInicial) and (:DataFinal' +
        ') and'
      
        '             ct.situacao in ('#39'F'#39','#39'N'#39','#39'P'#39') and not (contratos_ren' +
        'egociado(ct.numero))'
      '               %WhereFilialVenda'
      '        order by fgf.grupo, ct.filialvenda, p.datavencto'
      '       )'
      '       union all'
      '       ('
      '        select grupofilial,filial,recebimentos.data,valorvencto,'
      
        '               descricao||'#39' CT '#39'||lpad(cast(contrato as varchar(' +
        '6)),6,'#39'0'#39')||'#39' '#39'||ct.nome as descricaoevento_c'
      '        from '
      '        (      '
      
        '         select case when :AgruparGrupoFilial then fgf.grupo    ' +
        'else cast(0 as integer) end as grupofilial,'
      
        '                case when :AgruparFilial      then r.filial     ' +
        'else cast(0 as integer) end as filial,'
      '                r.datavencto as data,'
      '                r.valorvencto,               '
      '                (select p.contrato'
      '                 from parcelas p'
      
        '                 where p.transacao = r.transacao limit 1) as con' +
        'trato,'
      '                tr.descricao'
      
        '         from ((recebimentos r join tiposrecebimentos tr on r.ti' +
        'porecebimento = tr.codigo)'
      '                              join (filiais f left join '
      
        '                                            (filiaisgruposfiliai' +
        's fgf join gruposfiliais gf on fgf.grupo=gf.codigo)'
      '                                    on f.codigo = fgf.filial)'
      '                              on r.filial = f.codigo)'
      
        '         where r.datavencto between (:DataInicial) and (:DataFin' +
        'al)'
      '           and not coalesce(r.confirmado,false)'
      '           and r.cheque is null'
      '           and r.situacao = '#39'N'#39
      '         %WhereFilialRecebimento'
      '         order by fgf.grupo, r.filial, r.datavencto       '
      
        '        ) as recebimentos join contratos ct on ct.numero = receb' +
        'imentos.contrato'
      '       )       '
      '       union all'
      '       ('
      
        '        select  case when :AgruparGrupoFilial then fgf.grupo    ' +
        'else cast(0 as integer) end as grupofilial,'
      
        '                case when :AgruparFilial      then ch.filial    ' +
        ' else cast(0 as integer) end as filial,'
      '                ch.vencto as data,'
      '                ch.valor as valorvencto,'
      
        '                '#39'CH '#39'||ch.numero||'#39' '#39'||vf.nome as descricaoevent' +
        'o_c'
      '        from ((cheques ch join (filiais f '
      
        '                               left join (filiaisgruposfiliais f' +
        'gf join gruposfiliais gf on fgf.grupo=gf.codigo)'
      '                                    on f.codigo = fgf.filial)'
      '                                  on ch.filial = f.codigo)'
      
        '                          join vfornecedores vf on vf.codigo = c' +
        'h.cliente and vf.tipo = ch.tipocliente)'
      '                                            '
      '        where ch.vencto between (:DataInicial) and (:DataFinal)'
      '          and ch.situacao = '#39'N'#39
      '        %WhereFilialCheque'
      '        order by fgf.grupo, ch.filial, ch.vencto'
      '       )  '
      '      )'
      '     ) AS RECEBIMENTOS'
      '   )'
      '   union all'
      '   ('
      
        '      select grupofilial, filial, primeirodiautil(filial, data, ' +
        #39'P'#39') as data,'
      ' '#9'     cast(null as varchar(250)) as descricaoevento_c,'
      #9'     descricaoevento_d,'
      #9'     0.00 as vlrarec,'
      '             valorvencto as vlrapag'
      '      from'
      '      ('
      
        '      select  case when :AgruparGrupoFilial    then fgf.grupo el' +
        'se cast(0 as integer) end as grupofilial,'
      
        '              case when :AgruparFilial   then dp.filialemissao e' +
        'lse cast(0 as integer) end as filial,'
      '              d.datavencto as data,'
      '              d.valorvencto,'
      '              case when np.numero is not null then'
      
        '              '#39'NF '#39'||lpad(cast(np.numero as varchar(6)),6,'#39'0'#39')||' +
        #39'-'#39'||d.numero||'#39' '#39'|| fo.nome'
      '              else '
      
        '              '#39'DC '#39'||lpad(cast(dp.numero as varchar(6)),6,'#39'0'#39')||' +
        #39'-'#39'||d.numero||'#39' '#39'|| fo.nome end as descricaoevento_d'
      ''
      
        '      from (((((documentospag dp join duplicatas d on dp.numero=' +
        'd.documentopag)'
      
        '                           left join notaspag np on dp.numero=np' +
        '.documentopag)'
      
        '                           left join vfornecedores fo on dp.forn' +
        'ecedor=fo.codigo and dp.tipofornecedor=fo.tipo)'
      
        '                           left join eventos e on dp.evento = e.' +
        'codigo)'
      
        '                              left join filiaisgruposfiliais fgf' +
        ' on dp.filialemissao = fgf.filial)'
      '      where d.datapagto is null and'
      '            d.datavencto between (:DataInicial) and (:DataFinal)'
      '              %WhereFilialEmissao'
      '      order by fgf.grupo, dp.filialemissao, d.datavencto'
      '     ) AS PAGAMENTOS'
      '   )'
      '  ) as DETALHE ON'
      '    DATAS.grupofilial = DETALHE.grupofilial and'
      '    DATAS.filial = DETALHE.filial and'
      '    DATAS.data = DETALHE.data'
      ')'
      '%Ordenacao')
    RequestLive = True
    Left = 552
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'AgruparGrupoFilial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AgruparFilial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicialAcumulado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataFinalAcumulado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SaldoInicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataFinal'
        ParamType = ptUnknown
      end>
    object IntegerField3: TIntegerField
      FieldName = 'grupofilial'
    end
    object StringField6: TStringField
      FieldName = 'nomegrupofilial'
      Size = 50
    end
    object IntegerField4: TIntegerField
      FieldName = 'filial'
    end
    object StringField7: TStringField
      FieldName = 'nomefilial'
      Size = 50
    end
    object DateField2: TDateField
      FieldName = 'data'
    end
    object FloatField3: TFloatField
      FieldName = 'vlrarec'
    end
    object StringField8: TStringField
      FieldName = 'descricaoevento_c'
      Size = 250
    end
    object FloatField4: TFloatField
      FieldName = 'vlrapag'
    end
    object StringField9: TStringField
      FieldName = 'descricaoevento_d'
      Size = 250
    end
    object StringField10: TStringField
      FieldName = 'operacao'
      Size = 18
    end
    object BooleanField3: TBooleanField
      FieldName = 'totalizado'
    end
  end
end
