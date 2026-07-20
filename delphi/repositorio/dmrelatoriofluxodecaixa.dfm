inherited dtmrelatoriofluxodecaixa: Tdtmrelatoriofluxodecaixa
  OldCreateOrder = False
  Left = 449
  Top = 210
  Height = 606
  Width = 751
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
      Alignment = taCenter
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
      Alignment = taCenter
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
      19000000FA3E000019FFFF00000A0050444643726561746F7200FFFFFFFFFF00
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
      00000000970B000008004D656D6F446174610002002F0000002E0100003A0000
      000B0000006300000001000000000000000000FFFFFF1F2C0200000000000100
      58005B494628646174616D6F76696D656E746F3D2733302F31322F3138393927
      2C2027416E746572696F72272C20464F524D41544441544554494D4528276464
      2F6D6D2F7979272C20646174616D6F76696D656E746F2920295D000000000100
      0000000000020000000100000006090068656C76657469636100070000000000
      00000000100000000100020000000000FFFFFF00000000020000000000000000
      002A0C00000D004D656D6F56616C6F7261526563000200270100002E0100004D
      0000000B0000004300000001000000000000000000FFFFFF1F2C020000000000
      010009005B566C72615265635D00000000010000000000000200000001000000
      06090068656C7665746963610007000000000000000000110000000100020000
      000000FFFFFF0000000002000000000000000000BD0C00000D004D656D6F5661
      6C6F7261506167000200300200002E010000490000000B000000430000000100
      0000000000000000FFFFFF1F2C020000000000010009005B566C72615061675D
      0000000001000000000000020000000100000006090068656C76657469636100
      07000000000000000000110000000100020000000000FFFFFF00000000020000
      000000000000004B0D000006004D656D6F3834000200BA000000060200005F00
      0000110000004300000001000000000000000000FFFFFF1F2C02000000000001
      000B00544F54414C20474552414C00000000FFFF000000000002000000010000
      0000090068656C76657469636100070000000000000000000100000001000200
      00000000FFFFFF0000000002000000000000000000D80D000006004D656D6F38
      3600020023010000060200005100000011000000430000000100000000000000
      0000FFFFFF1F2C02000000000001000A005B54566C72615265635D00000000FF
      FF0000000000020000000100000000090068656C766574696361000700000002
      0000000000010000000100020000000000FFFFFF000000000200000000000000
      0000650E000006004D656D6F3932000200280200000602000051000000110000
      004300000001000000000000000000FFFFFF1F2C02000000000001000A005B54
      566C72615061675D00000000FFFF000000000002000000010000000009006865
      6C7665746963610007000000020000000000010000000100020000000000FFFF
      FF00000000020000000000000000003F0F000006004D656D6F32310002007B02
      00002E0100004C0000000B0000004300000001000000000000000000FFFFFF1F
      2C020000000000010057005B6966285B45786962697253616C646F5D3D547275
      652C205B4946286F7065726163616F3C3E2731202D2053414C444F20414E5445
      52494F52272C20545473616C646F2C20545453616C646F5F416E74295D2C2727
      295D00000000FFFF0000000000020000000100000006090068656C7665746963
      610007000000000000000000110000000100020000000000FFFFFF0000000002
      000000000000000000CB0F000006004D656D6F32320002007A02000006020000
      4D000000110000004300000001000000000000000000FFFFFF1F2C0200000000
      00010009005B545473616C646F5D00000000FFFF000000000002000000010000
      0000090068656C76657469636100070000000200000000000100000001000200
      00000000FFFFFF00000000020000000000000000005D10000006004D656D6F36
      370002002E000000B3000000600000001400000043000F00F401000000000000
      0000FFFFFF1F2C02000000000001000F00475255504F2044452046494C49414C
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      07000000000000000000090000000100020000000000FFFFFF00000000020000
      00000000000000ED10000006004D656D6F363800020093000000B30000001E00
      00001400000043000F00F4010000000000000000FFFFFF1F2C02000000000001
      000D005B477275706F46696C69616C5D00000000FFFF00000000000200000001
      00000000090068656C7665746963610007000000000000000000090000000100
      020000000000FFFFFF00000000020000000000000000008111000006004D656D
      6F3639000200B6000000B30000004D0100001400000041000F00F40100000000
      00000000FFFFFF1F2C020000000000010011005B4E6F6D65477275706F46696C
      69616C5D00000000FFFF0000000000020000000100000000090068656C766574
      6963610007000000020000000000080000000100020000000000FFFFFF000000
      00020000000000000000000A12000006004D656D6F323300020062000000E000
      00002C0000001400000043000F00F4010000000000000000FFFFFF1F2C020000
      0000000100060046494C49414C00000000FFFF00000000000200000001000000
      00090068656C7665746963610007000000000000000000090000000100020000
      000000FFFFFF00000000020000000000000000009512000006004D656D6F3634
      00020093000000E00000001E0000001400000043000F00F40100000000000000
      00FFFFFF1F2C020000000000010008005B46696C69616C5D00000000FFFF0000
      000000020000000100000000090068656C766574696361000700000000000000
      0000090000000100020000000000FFFFFF000000000200000000000000000024
      13000006004D656D6F3635000200B6000000E00000004D010000140000004100
      0F00F4010000000000000000FFFFFF1F2C02000000000001000C005B4E6F6D65
      46696C69616C5D00000000FFFF0000000000020000000100000000090068656C
      7665746963610007000000020000000000080000000100020000000000FFFFFF
      0000000002000000000000000000B313000006004D656D6F3631000200BA0000
      00A80100005F000000110000004300000001000000000000000000FFFFFF1F2C
      02000000000001000C00544F54414C2046494C49414C00000000FFFF00000000
      00020000000100000000090068656C7665746963610007000000000000000000
      010000000100020000000000FFFFFF0000000002000000000000000000401400
      0006004D656D6F323500020023010000A8010000510000001100000043000000
      01000000000000000000FFFFFF1F2C02000000000001000A005B54566C726152
      65635D00000000FFFF0000000000020000000100000000090068656C76657469
      63610007000000020000000000010000000100020000000000FFFFFF00000000
      02000000000000000000CD14000006004D656D6F333100020028020000A80100
      0051000000110000004300000001000000000000000000FFFFFF1F2C02000000
      000001000A005B54566C72615061675D00000000FFFF00000000000200000001
      00000000090068656C7665746963610007000000020000000000010000000100
      020000000000FFFFFF00000000020000000000000000005915000006004D656D
      6F33360002007A020000A80100004D0000001100000043000000010000000000
      00000000FFFFFF1F2C020000000000010009005B545473616C646F5D00000000
      FFFF0000000000020000000100000000090068656C7665746963610007000000
      020000000000010000000100020000000000FFFFFF0000000002000000000000
      000000E715000006004D656D6F3337000200BA000000D40100005F0000001100
      00004300000001000000000000000000FFFFFF1F2C02000000000001000B0054
      4F54414C20475255504F00000000FFFF00000000000200000001000000000900
      68656C7665746963610007000000000000000000010000000100020000000000
      FFFFFF00000000020000000000000000007416000006004D656D6F3339000200
      23010000D401000051000000110000004300000001000000000000000000FFFF
      FF1F2C02000000000001000A005B54566C72615265635D00000000FFFF000000
      0000020000000100000000090068656C76657469636100070000000200000000
      00010000000100020000000000FFFFFF00000000020000000000000000000117
      000006004D656D6F343500020028020000D40100005100000011000000430000
      0001000000000000000000FFFFFF1F2C02000000000001000A005B54566C7261
      5061675D00000000FFFF0000000000020000000100000000090068656C766574
      6963610007000000020000000000010000000100020000000000FFFFFF000000
      00020000000000000000008D17000006004D656D6F35310002007A020000D401
      00004D000000110000004300000001000000000000000000FFFFFF1F2C020000
      000000010009005B545473616C646F5D00000000FFFF00000000000200000001
      00000000090068656C7665746963610007000000020000000000010000000100
      020000000000FFFFFF0000000002000000000000000000291800000C006D6D6F
      686973746F7269636F0002006C0000002E010000B80000000B00000043000000
      01000000000000000000FFFFFF1F2C020000000000010013005B646573637269
      63616F6576656E746F5F635D00000000FFFF0000000000020000000100000006
      090068656C766574696361000700000000000000000010000000010002000000
      0000FFFFFF0000000002000000000000000000BE18000005004D656D6F320002
      00780100002E010000B40000000B0000004300000001000000000000000000FF
      FFFF1F2C020000000000010013005B64657363726963616F6576656E746F5F64
      5D00000000FFFF0000000000020000000100000006090068656C766574696361
      0007000000000000000000100000000100020000000000FFFFFF000000000200
      00000000000000009E19000005004D656D6F330002009A000000780100007F00
      0000110000004300000001000000000000000000FFFFFF1F2C02000000000001
      005E005B494628646174616D6F76696D656E746F3D2733302F31322F31383939
      272C2027544F54414C20414E544552494F52272C20464F524D41544441544554
      494D45282764642F6D6D2F7979272C20646174616D6F76696D656E746F292029
      5D00000000FFFF0000000000020000000100000000090068656C766574696361
      0007000000000000000000010000000100020000000000FFFFFF000000000200
      00000000000000002E1A000005004D656D6F3400020023010000780100005100
      0000110000004300000001000000000000000000FFFFFF1F2C02000000000001
      000E005B54566C72615265635F416E745D00000000FFFF000000000002000000
      0100000000090068656C76657469636100070000000200000000000100000001
      00020000000000FFFFFF0000000002000000000000000000BE1A000005004D65
      6D6F350002002402000078010000550000001100000043000000010000000000
      00000000FFFFFF1F2C02000000000001000E005B54566C72615061675F416E74
      5D00000000FFFF0000000000020000000100000000090068656C766574696361
      0007000000020000000000010000000100020000000000FFFFFF000000000200
      00000000000000007A1B000005004D656D6F360002007A020000780100004D00
      0000110000004300000001000000000000000000FFFFFF1F2C02000000000001
      003A005B4946286F7065726163616F3C3E2731202D2053414C444F20414E5445
      52494F52272C20545473616C646F2C20545453616C646F5F416E74295D000000
      00FFFF0000000000020000000100000000090068656C76657469636100070000
      00020000000000010000000100020000000000FFFFFF00000000020000000000
      00000400C91B000005004C696E65310002002E000000780100009A0200000000
      000001000800F4010000000000000000FFFFFF1F2C0200000000000000000000
      00FFFF00000000000200000001000000000400181C000005004C696E65320002
      002E0000008A0100009A0200000000000001000800F4010000000000000000FF
      FFFF1F2C020000000000000000000000FFFF0000000000020000000100000000
      0000A61C00000900666D764F7574726173000200540100004700000032010000
      2800000043000000F4010000000000000000FFFFFF1F2C020000000000010008
      005B4F75747261735D00000000FFFF0000000000020000000100000000090068
      656C7665746963610007000000000000000000020000000100020000000000FF
      FFFF0000000002000000000000000100CB34000007006670764C6F676F000200
      300000002E000000780000002A00000007000000F4010000000000000000FFFF
      FF1F2C020000000000000000000000FFFF000000000002000000010000000001
      00CB340000424DCE170000000000003604000028000000830000002600000001
      0008000000000098130000120B0000120B0000000100000001000000000000E8
      E5A800AA9E000099990000ADADAD003A3C4100A3970000BFB73700D8D48600FB
      FAF000A5A5A5001E1D1C00D8D9DA0054575A00D6D6D500E7E8F20012161B00B6
      AD1900CBC55B008C8D9200BEC0C500E1E2E40085878A005E606300494C4F0009
      0D12002C2E3300DEDB98007D7F8100EFEDCB00B9BABB00AEA400007C7B7B00C5
      BE440066666600D1CC6F00CDC9810048484600F7F6E600AFA5080004080D00F9
      F8ED00B8AF2700DBD68C00999999001B1A1900C6BF5100131312003B3A3A00FF
      FFFF00EAE8BE00CCCCCC0023262A00E2DEA400F1EFD600B0B1B300D3CD7500B1
      A81000CCCC660072727200535252004342420001060A00ECE9C3008C8C8B00F5
      F4DF004A4A4A0057575600B6AC1F00282B3000C7C05C0061615F00F7F7F70088
      888700DDD89300E3E0A600FDFCF70021242900070A1000BDB53100C5BE4A00E3
      E3E200A69C000099999900BABAB900DEDEDE00525458002A292800D9D58A005F
      5E5D00C7C595001B1E2300E8E5B60000000700B5AB1300D5D07B00C6C6C500B2
      A80B0021202000B9B12400504F4E00666666006B6D7000B5B5BD0084848400E0
      DC9E00BCB42C00F7EFD6005B5B5A00EFEFEF0087898B00DEDEE6003E3D3C0014
      181E00C8C25300CCC55F00A8A9AC00BDBDBC00E5E1AC0075767900181B2000E6
      E6E6000E1117000810190033333300929191002D2C2B00B5B5B4000000000000
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
      0000000000000000000000000000000000000000000000000000003131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131543D42470E313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131315231
      31313131486D3131316D6D4C3131316D6D313131313131313131316D48313131
      31313131316D6D3131316D040A6C6C313131313131486D6D4C3131313131316D
      6D4C313131313131313131313131486D6D6D313131313131486D6D4831313131
      6D483131316D6D3131313131313131313131316D6D6D3131486D6D6D31313131
      313152313131317F7E6631554225256031603D42647931420C313B7D316D6C3D
      70403131662C316D593D7068313133646C702531484255312C70643059313131
      310C2525420E31477431420E4825793131315442433D474C4C640E3120423C30
      0A3131207E2C317F70254748484251512531603C316D59253C620A312C254330
      68313131313152313131316C2031315959313131317C7D4C4C31487C0E315968
      3177424C51347531434031203D487957543130494C7F3D31487C0C310B37317F
      70313131313C6631313131642C317C33487E51313131313179602F55317C3331
      316D793B7031487E14314857043131316D7C55557E311E3031542D4C31434031
      3148790A0B4C313131315231313131477D313125306C64334C5779313131487C
      0E31224931422C31314340316C7D313C7D3131594931570C31543D31487C0C31
      68705930253131313170706C3C0E313C0A313033317C513131310C702570474C
      4C3033312C7C64300A3148300E31796243432248483051517C31603D316D6464
      590B2C31547C42301C313131313152313131314749313166420C5548313D2C48
      4831487C0E48302C311C4248516275316C7D31493D4879627F31256848373031
      487C0E3131550E207031313131473C0C554831642C4C7E330C62793131316830
      796D3131487C3331577D6D6D313148303331487C49555131487C0C0C7E4C2C70
      3131480C0E7C2C313C476D6D31313131313152313131040B7E20316D473C6C33
      310E3D3C6C7931254264646D31486C42706831316C7D31484742702031310E3D
      433D6C31484355314043473D0A31313131796C3C6C0E316670597E3C3D203131
      31310E256C6C7731316C0E312C3D47430431772F3D0A3133424366484825643C
      7E6C7C74316D225943425531543D59437D3131313131523131316D643B6D3131
      316D514831313179514C316D51793131313131796D3131313C40313131796D31
      3131313179794831317F6D316D15154831313131313131795148314879516D79
      6D3131313131313151517931317F6D31316D51516D3151577F6D313131797931
      316D51516D5148313131515151313131314851516D3131313131523131313140
      0431313131313131313131313131313131313131313131313131313168043131
      31313131313131313131313148660F3131313131313131313131313131313131
      3131313131313131313131313131313131220E31313131313131316655313131
      3131313131313131313131313131313131313131313131313131313131315231
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131313131315C46121212463F3131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131523131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131315F06020202061B31313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131523131313131310E40173C18183D6E3131313131310C2C666C3C
      181818181805683131313131316D3768220D0516313131313108021F1F1F5235
      313131313172070707070707070707070707070750732B363131313131313131
      3131362B73212112081D31313131313131313123505050504B31313131313131
      31313F08122E505050085231313131312C103E191919195D1731313131796671
      3E4E191919191919195D0D31313131312C34282819190017313131313108021F
      1F1F523531313131311152020202020202020202020202020202022776313131
      313131313F501F02020202020202075C313131313131316A060202065F313131
      313131314C120202020202020221523131313175287A78787878784E22313131
      0E1A3E10787871717171717171281731313131773E7A71717171282231313131
      3108021F1F1F5235313131313144021F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
      1F1D31313131310802021F1F1F1F1F1F1F1F02022331313131313107021F1F02
      08313131313131313A521F1F1F1F1F1F1F5052313131310D4E7878787A7A7128
      2231316D7C4E7878784E4E7A717171717128173131312C3E7171717119195D22
      313131313108021F1F1F5269314C4C4C4C631F1F1F1F1F1F1F1F1F1F1F1F1F1F
      1F1F1F1F52503131313138521F1F1F0202020202021F1F1F5212313131313107
      021F1F0208313131313131361F1F1F1F1F0202020221523131316D457A78787A
      3D370E0E5131313B3E7878787A2274140E0E0E0E0E0E15313115787A78787119
      0D0A145A2A6A6A6A2A5F36363636365044111111113226262626262626262626
      262626264A1F1F1F1F612631311B521F1F1F02443A08082363021F1F1F525F31
      31313107021F1F02083131313131311B021F1F1F1F6A2B353532523131310E71
      717171710C313131313115781078784E683131313131313131313131311C2878
      78787A2C3131310106020202025F313131313150520202020236313131313131
      31313131313131313144021F1F1F32312639021F1F1F584C31313131311B2702
      1F1F1F3631313107021F1F020831313131313123021F1F1F1109313131315231
      3131337A717171454831313131312C28787810344C3131313131313131313131
      31057A78784E663131313135021F1F1F025F313131313150021F1F1F1F363131
      3131313131313131313131314C5E021F1F0276315F521F1F1F4B313131313131
      313132271F1F527331313107021F1F020831313131313112021F1F0272313131
      313152313131601978787A7C4C3131313131662878781045166E6E6E6E6E6E6E
      6E1C0431555B1078717A603131313135021F1F1F025F313131313150021F1F1F
      1F36313131313131314C0909090909363A021F1F1F1F3F314F021F0272313131
      3131313131313123021F1F1109313107021F1F02083131313131312E021F1F02
      73313131313152313131601978787A054C313131313156197878787128282828
      2828282828005631337A717171346D313131313552020202025F313131313121
      06020202023631313131762E635E61616161611F1F1F1F1F1F114C26611F1F02
      76313131313131313131311D1F1F1F1F1D313107021F1F02083131313131312E
      021F1F023A313131313152313131601978787A054C3131313131181978787878
      7878787878787878784E1731141978787A454831313131764444444444241551
      515151464F4F4F4F4F413131313A0202021F1F1F1F1F1F1F1F1F1F1F521B311D
      1F1F1F1F363131313131313131313126391F1F1F5C313107021F1F0208313131
      3131312E021F1F023A313131313152313131601978787A054C31313131315619
      787878787878787878787878784E1731337A717171346D313131313109090909
      097D713434347A37313131313131313158521F1F1F1F1F020202020202020227
      5831311D1F1F1F1F1D3131313131313131313126391F1F1F5C313107021F1F02
      083131313131312E021F1F023A313131313152313131601978787A054C313131
      3131224E787878784E28282828282828280056310C787171715B0C3131313131
      3131313131133E1010105D74313131313131312939021F1F1F1F391163636363
      6A50083631313126611F1F024B313131313131313131313F021F1F1F36313107
      021F1F02083131313131312E021F1F023A313131313152313131601978787A05
      4C313131313116287878101A2C2C2C2C2C2C2C2C2C7D1E316D1A7A7878197F31
      313131313131313131134E78787828743131313131313176021F1F1F1F232631
      31313131313131313131313107021F02213131313131313131313173021F1F44
      4C313107021F1F02083131313131312E021F1F023A3131313131523131316019
      78787A054C31313131317F197171713448313131313131313131313131561978
      784E6631313131313131313131134E7878782874313131313131312B521F1F1F
      6129313131313131313131313131313158521F1F024A31313131313131317602
      021F522331313107021F1F02083131313131312E021F1F023A31313131315231
      3131331978787A053131313131316D347A78784E133131313131313131313131
      317D28787871710431313131313131313113001919190004313131313131312B
      521F1F1F274131313131313131313131313131310911021F1F1F232631313131
      295F1F1F1F1F612931313107021F1F022B3131313131312E021F1F5223313131
      3131520E14602C7A78787A7C141414140C3131203E78787171660A1E60141414
      14140E3131155B107878107A567D371E1E1E1E1E1E13566C6C6C182C75757575
      756D315C021F1F1F1F211B1B1B1B1B1B4A4A4A4A4A3631313176021F1F1F0261
      502323725E021F1F1F0258762B2B4A44021F1F1F504A4A4A2B1D312E021F1F1F
      074A4A4A4A5C520D7A7A7A78787878787A7A7A5D1731317945197878784E4E7A
      7A7A7A7A7A5D6C313131165D7171717119191919191919195D6E313131313166
      007A7A7A4E1431295E021F1F1F0202020202020202020202062B313131315802
      021F1F1F020202021F1F1F1F52384C395252521F1F1F1F1F020202020608312E
      021F1F1F1F0202020221521771717878787878787171714E22313131335B2871
      7878787871717171714E1731313131173E7A717878787878787878784E6E3131
      31313166287171717A6031314A521F1F1F1F1F1F1F1F1F1F1F1F1F1F524A3131
      3131316939521F1F1F1F1F1F1F1F020258310911021F1F1F1F1F1F1F1F1F1F1F
      022B312E021F1F1F1F1F1F1F1F50520D19191978787878781919190017313131
      310C0D10284E4E191919191919000D31313131317D1A4E4E4E19191919191919
      001C3131313131662878787810603131315F0202020202020202020202020202
      062B31313131313136733902020202020261721D313129615252521F1F1F1F1F
      020202020608312E021F1F1F1F0202020221527D17173C107878714D1717170D
      2C3131313131310E0A1C3B2217171717170D7D31313131313148757D77661717
      171717170D0431313131316628787878106031313131364A3A72727272727272
      72727272505C3131313131313131264B5F737338354131313131093A7272725E
      1F1F1F1F4F1212122E5C312E021F1F1F631212121258523131310E1978787A05
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131313117003E3E3E5D7531313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313107021F1F52583131313131312E021F1F02233131313131523131316019
      78787A054C313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131313131317F686E6E6E6E15313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313121021F1F02073131313131312E021F1F023A31313131315231
      3131601978787A054C3131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313173021F1F1F1F4F3A233A32312E021F1F023A313131
      313152313131601978787A054C31313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131313169521F1F1F1F0202020608312E021F1F02
      3A313131313152313131601978787A054C313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131313131310963521F1F1F1F1F1F024A312E
      021F1F023A313131313152313131601971717A054C3131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131314150611F1F1F1F1F
      024A3150021F1F023A3131313131523131310C0D17176C774C31313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131315C38
      72727272725C31082E2E2E2E1B31313131315200007135000013006D6D6F464F
      4E4546494C49414C424153455F52000200AC0000005B000000AA0000000A0000
      0004000000F4010000000000000000FFFFFF1F2C02000000000001001600464F
      4E453A205B464F4E4546494C49414C424153455D00000000FFFF000000000002
      0000000100000000090068656C76657469636100060000000000000000001000
      00000100020000000000FFFFFF00000000020000000000000000002636000014
      006D6D6F454E44455245434F5F42414952524F5F52000200AC00000045000000
      AB0000000A00000000000000F4010000000000000000FFFFFF1F2C0200000000
      00010024005B52554146494C49414C424153455D202D205B42414952524F4649
      4C49414C424153455D00000000FFFF0000000000020000000100000000090068
      656C7665746963610006000000000000000000100000000100020000000000FF
      FFFF0000000002000000000000000000F336000012006D6D6F4345505F434944
      4144455F55465F52000200AC00000050000000AB0000000A00000000000000F4
      010000000000000000FFFFFF1F2C02000000000001003E004345503A205B4345
      5046494C49414C424153455D202D205B43494441444546494C49414C42415345
      5D202D205B45535441444F46494C49414C424153455D00000000FFFF00000000
      00020000000100000000090068656C7665746963610006000000000000000000
      100000000100020000000000FFFFFF0000000002000000000000000000893700
      0008006D6D6F52415A414F000200AC0000002E000000AB000000140000000300
      0000F4010000000000000000FFFFFF1F2C020000000000010011005B52415A41
      4F46494C49414C424153455D00000000FFFF0000000000020000000100000006
      090068656C766574696361000600000000000000000010000000010002000000
      0000FFFFFF00000000020000000000000000001738000009006D6D6F54495455
      4C4F000200540100002E000000320100001700000002000000F4010000000000
      000000FFFFFF1F2C020000000000010008005B746974756C6F5D00000000FFFF
      0000000000020000000100000006090068656C766574696361000B0000000200
      00000000020000000100020000000000FFFFFF00000000020000000000000000
      00A83800000F006D6D6F524F54554C4F444154415F520002007C0200002E0000
      001C0000000C00000043000000F4010000000000000000FFFFFF1F2C02000000
      000001000500446174613A00000000FFFF000000000002000000010000000009
      0068656C76657469636100060000000000000000000000000001000200000000
      00FFFFFF00000000020000000000000000003F39000009006D6D6F444154415F
      52000200990200002E0000002C0000000C00000043000000F401000000000000
      0000FFFFFF1F2C020000000000010011005B4441544520234464642F6D6D2F79
      795D00000000FFFF0000000000020000000100000000090068656C7665746963
      610006000000000000000000010000000100020000000000FFFFFF0000000002
      000000000000000000D439000011006D6D6F524F54554C4F504147494E415F52
      0002007C02000039000000280000000C00000043000000F40100000000000000
      00FFFFFF1F2C0200000000000100070050E167696E613A00000000FFFF000000
      0000020000000100000000090068656C76657469636100060000000000000000
      00000000000100020000000000FFFFFF0000000002000000000000000000633A
      00000B006D6D6F504147494E415F52000200A502000039000000200000000C00
      000043000000F4010000000000000000FFFFFF1F2C020000000000010007005B
      50414745235D00000000FFFF0000000000020000000100000000090068656C76
      65746963610006000000000000000000010000000100020000000000FFFFFF00
      00000002000000000000000000003B00000F006D6D6F524F44415045484F5241
      5F520002002F0000007C020000580000000A00000043000000F4010000000000
      000000FFFFFF1F2C020000000000010011005B54494D4520235468683A6D6D3A
      73735D00000000FFFF0000000000020000000100000000090068656C76657469
      63610007000000000000000000100000000100020000000000FFFFFF00000000
      02000000000000000000A93B00000C006D6D6F544543534F46545F52000200E8
      0100007C020000DC0000000A00000043000000F4010000000000000000FFFFFF
      1F2C02000000000001002000746563534F4654202D205465636E6F6C6F676961
      20656D2053697374656D617300000000FFFF0000000000020000000100000000
      090068656C766574696361000700000000000000000011000000010002000000
      0000FFFFFF000000000200000000000000FEFEFF33000000070020546F746169
      73000000000300527561000000000600436964616465000000000400466F6E65
      000000000600546974756C6F0000000006004F75747261730000000006004261
      6972726F000000000600204461646F73000000000B00477275706F46696C6961
      6C000000000F004E6F6D65477275706F46696C69616C00000000060046696C69
      616C000000000A004E6F6D6546696C69616C000000000600566C725265630001
      00300008004A75726F7352656300010030000800546F74616C52656300010030
      000700566C7261526563000100300009004A75726F7361526563000100300009
      00546F74616C6152656300010030000600566C72506167000100300008004A75
      726F7350616700010030000800546F74616C50616700010030000700566C7261
      506167000100300009004A75726F736150616700010030000900546F74616C61
      50616700010030000C0053616C646F496E696369616C00010030000900646573
      63726963616F000000000D00646174616D6F76696D656E746F000000000D0054
      53616C646F496E696369616C00010030000B00686973746F7269636F5F630000
      00000B00686973746F7269636F5F64000000000C0020546F74616C697A616361
      6F00000000070054566C72526563000000000900544A75726F73526563000000
      00090054546F74616C52656300000000080054566C7261526563000000000A00
      544A75726F7361526563000000000A0054546F74616C61526563000000000700
      54566C72506167000000000900544A75726F7350616700000000090054546F74
      616C50616700000000080054566C7261506167000000000A00544A75726F7361
      506167000000000A0054546F74616C61506167000000000700545453616C646F
      00010030000C0054566C72615265635F416E74000000000C0054566C72615061
      675F416E74000000000B00545453616C646F5F416E74000000000C0020416772
      7570616D656E746F00000000120041677275706172477275706F46696C69616C
      00050046616C7365000D004167727570617246696C69616C00050046616C7365
      000F005469706F646552656C61746F72696F00010030000000000000000000FC
      000000000000000000000000000000005800D56AD3C9CE1FE540FE0CAACFB584
      E540}
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
      Alignment = taCenter
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
      19000000F63E000019FFFF00000A0050444643726561746F7200FFFFFFFFFF00
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
      00940B000008004D656D6F446174610002002F0000002E0100003A0000000B00
      00006300000001000000000000000000FFFFFF1F2C020000000000010058005B
      494628646174616D6F76696D656E746F3D2733302F31322F31383939272C2027
      416E746572696F72272C20464F524D41544441544554494D45282764642F6D6D
      2F7979272C20646174616D6F76696D656E746F2920295D000000000100000000
      0000020000000100000006090068656C76657469636100070000000000000000
      00000000000100020000000000FFFFFF0000000002000000000000000000270C
      00000D004D656D6F56616C6F7261526563000200270100002E0100004D000000
      0B0000004300000001000000000000000000FFFFFF1F2C020000000000010009
      005B566C72615265635D00000000010000000000000200000001000000060900
      68656C7665746963610007000000000000000000110000000100020000000000
      FFFFFF0000000002000000000000000000BA0C00000D004D656D6F56616C6F72
      61506167000200300200002E010000490000000B000000430000000100000000
      0000000000FFFFFF1F2C020000000000010009005B566C72615061675D000000
      0001000000000000020000000100000006090068656C76657469636100070000
      00000000000000110000000100020000000000FFFFFF00000000020000000000
      00000000480D000006004D656D6F3834000200BA000000060200005F00000011
      0000004300000001000000000000000000FFFFFF1F2C02000000000001000B00
      544F54414C20474552414C00000000FFFF000000000002000000010000000009
      0068656C76657469636100070000000000000000000100000001000200000000
      00FFFFFF0000000002000000000000000000D50D000006004D656D6F38360002
      00230100000602000051000000110000004300000001000000000000000000FF
      FFFF1F2C02000000000001000A005B54566C72615265635D00000000FFFF0000
      000000020000000100000000090068656C766574696361000700000002000000
      0000010000000100020000000000FFFFFF000000000200000000000000000062
      0E000006004D656D6F3932000200280200000602000051000000110000004300
      000001000000000000000000FFFFFF1F2C02000000000001000A005B54566C72
      615061675D00000000FFFF0000000000020000000100000000090068656C7665
      746963610007000000020000000000010000000100020000000000FFFFFF0000
      0000020000000000000000003B0F000006004D656D6F32310002007B0200002E
      0100004C0000000B0000004300000001000000000000000000FFFFFF1F2C0200
      00000000010056005B6966285B45786962697253616C646F5D3D547275652C5B
      4946286F7065726163616F3C3E2731202D2053414C444F20414E544552494F52
      272C20545473616C646F2C20545453616C646F5F416E74295D2C2727295D0000
      0000FFFF0000000000020000000100000006090068656C766574696361000700
      0000000000000000110000000100020000000000FFFFFF000000000200000000
      0000000000C70F000006004D656D6F32320002007A020000060200004D000000
      110000004300000001000000000000000000FFFFFF1F2C020000000000010009
      005B545473616C646F5D00000000FFFF00000000000200000001000000000900
      68656C7665746963610007000000020000000000010000000100020000000000
      FFFFFF00000000020000000000000000005910000006004D656D6F3637000200
      2E000000B3000000600000001400000043000F00F4010000000000000000FFFF
      FF1F2C02000000000001000F00475255504F2044452046494C49414C00000000
      FFFF0000000000020000000100000000090068656C7665746963610007000000
      000000000000090000000100020000000000FFFFFF0000000002000000000000
      000000E910000006004D656D6F363800020093000000B30000001E0000001400
      000043000F00F4010000000000000000FFFFFF1F2C02000000000001000D005B
      477275706F46696C69616C5D00000000FFFF0000000000020000000100000000
      090068656C766574696361000700000000000000000009000000010002000000
      0000FFFFFF00000000020000000000000000007D11000006004D656D6F363900
      0200B6000000B30000004D0100001400000041000F00F4010000000000000000
      FFFFFF1F2C020000000000010011005B4E6F6D65477275706F46696C69616C5D
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      07000000020000000000080000000100020000000000FFFFFF00000000020000
      000000000000000612000006004D656D6F323300020062000000E00000002C00
      00001400000043000F00F4010000000000000000FFFFFF1F2C02000000000001
      00060046494C49414C00000000FFFF0000000000020000000100000000090068
      656C7665746963610007000000000000000000090000000100020000000000FF
      FFFF00000000020000000000000000009112000006004D656D6F363400020093
      000000E00000001E0000001400000043000F00F4010000000000000000FFFFFF
      1F2C020000000000010008005B46696C69616C5D00000000FFFF000000000002
      0000000100000000090068656C76657469636100070000000000000000000900
      00000100020000000000FFFFFF00000000020000000000000000002013000006
      004D656D6F3635000200B6000000E00000004D0100001400000041000F00F401
      0000000000000000FFFFFF1F2C02000000000001000C005B4E6F6D6546696C69
      616C5D00000000FFFF0000000000020000000100000000090068656C76657469
      63610007000000020000000000080000000100020000000000FFFFFF00000000
      02000000000000000000AF13000006004D656D6F3631000200BA000000A80100
      005F000000110000004300000001000000000000000000FFFFFF1F2C02000000
      000001000C00544F54414C2046494C49414C00000000FFFF0000000000020000
      000100000000090068656C766574696361000700000000000000000001000000
      0100020000000000FFFFFF00000000020000000000000000003C14000006004D
      656D6F323500020023010000A801000051000000110000004300000001000000
      000000000000FFFFFF1F2C02000000000001000A005B54566C72615265635D00
      000000FFFF0000000000020000000100000000090068656C7665746963610007
      000000020000000000010000000100020000000000FFFFFF0000000002000000
      000000000000C914000006004D656D6F333100020028020000A8010000510000
      00110000004300000001000000000000000000FFFFFF1F2C0200000000000100
      0A005B54566C72615061675D00000000FFFF0000000000020000000100000000
      090068656C766574696361000700000002000000000001000000010002000000
      0000FFFFFF00000000020000000000000000005515000006004D656D6F333600
      02007A020000A80100004D000000110000004300000001000000000000000000
      FFFFFF1F2C020000000000010009005B545473616C646F5D00000000FFFF0000
      000000020000000100000000090068656C766574696361000700000002000000
      0000010000000100020000000000FFFFFF0000000002000000000000000000E3
      15000006004D656D6F3337000200BA000000D40100005F000000110000004300
      000001000000000000000000FFFFFF1F2C02000000000001000B00544F54414C
      20475255504F00000000FFFF0000000000020000000100000000090068656C76
      65746963610007000000000000000000010000000100020000000000FFFFFF00
      000000020000000000000000007016000006004D656D6F333900020023010000
      D401000051000000110000004300000001000000000000000000FFFFFF1F2C02
      000000000001000A005B54566C72615265635D00000000FFFF00000000000200
      00000100000000090068656C7665746963610007000000020000000000010000
      000100020000000000FFFFFF0000000002000000000000000000FD1600000600
      4D656D6F343500020028020000D4010000510000001100000043000000010000
      00000000000000FFFFFF1F2C02000000000001000A005B54566C72615061675D
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      07000000020000000000010000000100020000000000FFFFFF00000000020000
      000000000000008917000006004D656D6F35310002007A020000D40100004D00
      0000110000004300000001000000000000000000FFFFFF1F2C02000000000001
      0009005B545473616C646F5D00000000FFFF0000000000020000000100000000
      090068656C766574696361000700000002000000000001000000010002000000
      0000FFFFFF0000000002000000000000000000251800000C006D6D6F68697374
      6F7269636F0002006C0000002E010000B80000000B0000004300000001000000
      000000000000FFFFFF1F2C020000000000010013005B64657363726963616F65
      76656E746F5F635D00000000FFFF000000000002000000010000000609006865
      6C7665746963610007000000000000000000100000000100020000000000FFFF
      FF0000000002000000000000000000BA18000005004D656D6F32000200780100
      002E010000B40000000B0000004300000001000000000000000000FFFFFF1F2C
      020000000000010013005B64657363726963616F6576656E746F5F645D000000
      00FFFF0000000000020000000100000006090068656C76657469636100070000
      00000000000000100000000100020000000000FFFFFF00000000020000000000
      000000009A19000005004D656D6F330002009A000000780100007F0000001100
      00004300000001000000000000000000FFFFFF1F2C02000000000001005E005B
      494628646174616D6F76696D656E746F3D2733302F31322F31383939272C2027
      544F54414C20414E544552494F52272C20464F524D41544441544554494D4528
      2764642F6D6D2F7979272C20646174616D6F76696D656E746F2920295D000000
      00FFFF0000000000020000000100000000090068656C76657469636100070000
      00000000000000010000000100020000000000FFFFFF00000000020000000000
      000000002A1A000005004D656D6F340002002301000078010000510000001100
      00004300000001000000000000000000FFFFFF1F2C02000000000001000E005B
      54566C72615265635F416E745D00000000FFFF00000000000200000001000000
      00090068656C7665746963610007000000020000000000010000000100020000
      000000FFFFFF0000000002000000000000000000BA1A000005004D656D6F3500
      0200240200007801000055000000110000004300000001000000000000000000
      FFFFFF1F2C02000000000001000E005B54566C72615061675F416E745D000000
      00FFFF0000000000020000000100000000090068656C76657469636100070000
      00020000000000010000000100020000000000FFFFFF00000000020000000000
      00000000761B000005004D656D6F360002007A020000780100004D0000001100
      00004300000001000000000000000000FFFFFF1F2C02000000000001003A005B
      4946286F7065726163616F3C3E2731202D2053414C444F20414E544552494F52
      272C20545473616C646F2C20545453616C646F5F416E74295D00000000FFFF00
      00000000020000000100000000090068656C7665746963610007000000020000
      000000010000000100020000000000FFFFFF0000000002000000000000000400
      C51B000005004C696E65310002002E000000780100009A020000000000000100
      0800F4010000000000000000FFFFFF1F2C020000000000000000000000FFFF00
      000000000200000001000000000400141C000005004C696E65320002002E0000
      008A0100009A0200000000000001000800F4010000000000000000FFFFFF1F2C
      020000000000000000000000FFFF00000000000200000001000000000000A21C
      00000900666D764F757472617300020054010000470000003201000028000000
      43000000F4010000000000000000FFFFFF1F2C020000000000010008005B4F75
      747261735D00000000FFFF0000000000020000000100000000090068656C7665
      746963610007000000000000000000020000000100020000000000FFFFFF0000
      000002000000000000000100C734000007006670764C6F676F00020030000000
      2E000000780000002A00000007000000F4010000000000000000FFFFFF1F2C02
      0000000000000000000000FFFF00000000000200000001000000000100C73400
      00424DCE17000000000000360400002800000083000000260000000100080000
      00000098130000120B0000120B0000000100000001000000000000E8E5A800AA
      9E000099990000ADADAD003A3C4100A3970000BFB73700D8D48600FBFAF000A5
      A5A5001E1D1C00D8D9DA0054575A00D6D6D500E7E8F20012161B00B6AD1900CB
      C55B008C8D9200BEC0C500E1E2E40085878A005E606300494C4F00090D12002C
      2E3300DEDB98007D7F8100EFEDCB00B9BABB00AEA400007C7B7B00C5BE440066
      666600D1CC6F00CDC9810048484600F7F6E600AFA5080004080D00F9F8ED00B8
      AF2700DBD68C00999999001B1A1900C6BF5100131312003B3A3A00FFFFFF00EA
      E8BE00CCCCCC0023262A00E2DEA400F1EFD600B0B1B300D3CD7500B1A81000CC
      CC660072727200535252004342420001060A00ECE9C3008C8C8B00F5F4DF004A
      4A4A0057575600B6AC1F00282B3000C7C05C0061615F00F7F7F70088888700DD
      D89300E3E0A600FDFCF70021242900070A1000BDB53100C5BE4A00E3E3E200A6
      9C000099999900BABAB900DEDEDE00525458002A292800D9D58A005F5E5D00C7
      C595001B1E2300E8E5B60000000700B5AB1300D5D07B00C6C6C500B2A80B0021
      202000B9B12400504F4E00666666006B6D7000B5B5BD0084848400E0DC9E00BC
      B42C00F7EFD6005B5B5A00EFEFEF0087898B00DEDEE6003E3D3C0014181E00C8
      C25300CCC55F00A8A9AC00BDBDBC00E5E1AC0075767900181B2000E6E6E6000E
      1117000810190033333300929191002D2C2B00B5B5B400000000000000000000
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
      0000000000000000000000000000000000000000000000313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131543D42470E31313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131523131313131
      486D3131316D6D4C3131316D6D313131313131313131316D4831313131313131
      316D6D3131316D040A6C6C313131313131486D6D4C3131313131316D6D4C3131
      31313131313131313131486D6D6D313131313131486D6D48313131316D483131
      316D6D3131313131313131313131316D6D6D3131486D6D6D3131313131315231
      3131317F7E6631554225256031603D42647931420C313B7D316D6C3D70403131
      662C316D593D7068313133646C702531484255312C70643059313131310C2525
      420E31477431420E4825793131315442433D474C4C640E3120423C300A313120
      7E2C317F70254748484251512531603C316D59253C620A312C25433068313131
      313152313131316C2031315959313131317C7D4C4C31487C0E3159683177424C
      51347531434031203D487957543130494C7F3D31487C0C310B37317F70313131
      313C6631313131642C317C33487E51313131313179602F55317C3331316D793B
      7031487E14314857043131316D7C55557E311E3031542D4C314340313148790A
      0B4C313131315231313131477D313125306C64334C5779313131487C0E312249
      31422C31314340316C7D313C7D3131594931570C31543D31487C0C3168705930
      253131313170706C3C0E313C0A313033317C513131310C702570474C4C303331
      2C7C64300A3148300E31796243432248483051517C31603D316D6464590B2C31
      547C42301C313131313152313131314749313166420C5548313D2C484831487C
      0E48302C311C4248516275316C7D31493D4879627F31256848373031487C0E31
      31550E207031313131473C0C554831642C4C7E330C62793131316830796D3131
      487C3331577D6D6D313148303331487C49555131487C0C0C7E4C2C703131480C
      0E7C2C313C476D6D31313131313152313131040B7E20316D473C6C33310E3D3C
      6C7931254264646D31486C42706831316C7D31484742702031310E3D433D6C31
      484355314043473D0A31313131796C3C6C0E316670597E3C3D20313131310E25
      6C6C7731316C0E312C3D47430431772F3D0A3133424366484825643C7E6C7C74
      316D225943425531543D59437D3131313131523131316D643B6D3131316D5148
      31313179514C316D51793131313131796D3131313C40313131796D3131313131
      79794831317F6D316D15154831313131313131795148314879516D796D313131
      3131313151517931317F6D31316D51516D3151577F6D313131797931316D5151
      6D5148313131515151313131314851516D313131313152313131314004313131
      3131313131313131313131313131313131313131313131316804313131313131
      313131313131313148660F313131313131313131313131313131313131313131
      31313131313131313131313131220E3131313131313131665531313131313131
      3131313131313131313131313131313131313131313131313131523131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131315C46121212463F313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131315231
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131313131315F06020202061B3131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131523131313131310E40173C18183D6E3131313131310C2C666C3C18181818
      1805683131313131316D3768220D0516313131313108021F1F1F523531313131
      3172070707070707070707070707070750732B3631313131313131313131362B
      73212112081D31313131313131313123505050504B3131313131313131313F08
      122E505050085231313131312C103E191919195D17313131317966713E4E1919
      19191919195D0D31313131312C34282819190017313131313108021F1F1F5235
      3131313131115202020202020202020202020202020202277631313131313131
      3F501F02020202020202075C313131313131316A060202065F31313131313131
      4C120202020202020221523131313175287A78787878784E223131310E1A3E10
      787871717171717171281731313131773E7A717171712822313131313108021F
      1F1F5235313131313144021F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1D3131
      3131310802021F1F1F1F1F1F1F1F02022331313131313107021F1F0208313131
      313131313A521F1F1F1F1F1F1F5052313131310D4E7878787A7A71282231316D
      7C4E7878784E4E7A717171717128173131312C3E7171717119195D2231313131
      3108021F1F1F5269314C4C4C4C631F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
      52503131313138521F1F1F0202020202021F1F1F5212313131313107021F1F02
      08313131313131361F1F1F1F1F0202020221523131316D457A78787A3D370E0E
      5131313B3E7878787A2274140E0E0E0E0E0E15313115787A787871190D0A145A
      2A6A6A6A2A5F3636363636504411111111322626262626262626262626262626
      4A1F1F1F1F612631311B521F1F1F02443A08082363021F1F1F525F3131313107
      021F1F02083131313131311B021F1F1F1F6A2B353532523131310E7171717171
      0C313131313115781078784E683131313131313131313131311C287878787A2C
      3131310106020202025F31313131315052020202023631313131313131313131
      313131313144021F1F1F32312639021F1F1F584C31313131311B27021F1F1F36
      31313107021F1F020831313131313123021F1F1F11093131313152313131337A
      717171454831313131312C28787810344C313131313131313131313131057A78
      784E663131313135021F1F1F025F313131313150021F1F1F1F36313131313131
      31313131313131314C5E021F1F0276315F521F1F1F4B31313131313131313227
      1F1F527331313107021F1F020831313131313112021F1F027231313131315231
      3131601978787A7C4C3131313131662878781045166E6E6E6E6E6E6E6E1C0431
      555B1078717A603131313135021F1F1F025F313131313150021F1F1F1F363131
      31313131314C0909090909363A021F1F1F1F3F314F021F027231313131313131
      31313123021F1F1109313107021F1F02083131313131312E021F1F0273313131
      313152313131601978787A054C31313131315619787878712828282828282828
      28005631337A717171346D313131313552020202025F31313131312106020202
      023631313131762E635E61616161611F1F1F1F1F1F114C26611F1F0276313131
      313131313131311D1F1F1F1F1D313107021F1F02083131313131312E021F1F02
      3A313131313152313131601978787A054C313131313118197878787878787878
      78787878784E1731141978787A45483131313176444444444424155151515146
      4F4F4F4F4F413131313A0202021F1F1F1F1F1F1F1F1F1F1F521B311D1F1F1F1F
      363131313131313131313126391F1F1F5C313107021F1F02083131313131312E
      021F1F023A313131313152313131601978787A054C3131313131561978787878
      7878787878787878784E1731337A717171346D313131313109090909097D7134
      34347A37313131313131313158521F1F1F1F1F0202020202020202275831311D
      1F1F1F1F1D3131313131313131313126391F1F1F5C313107021F1F0208313131
      3131312E021F1F023A313131313152313131601978787A054C3131313131224E
      787878784E28282828282828280056310C787171715B0C313131313131313131
      31133E1010105D74313131313131312939021F1F1F1F3911636363636A500836
      31313126611F1F024B313131313131313131313F021F1F1F36313107021F1F02
      083131313131312E021F1F023A313131313152313131601978787A054C313131
      313116287878101A2C2C2C2C2C2C2C2C2C7D1E316D1A7A7878197F3131313131
      3131313131134E78787828743131313131313176021F1F1F1F23263131313131
      313131313131313107021F02213131313131313131313173021F1F444C313107
      021F1F02083131313131312E021F1F023A313131313152313131601978787A05
      4C31313131317F197171713448313131313131313131313131561978784E6631
      313131313131313131134E7878782874313131313131312B521F1F1F61293131
      31313131313131313131313158521F1F024A31313131313131317602021F5223
      31313107021F1F02083131313131312E021F1F023A3131313131523131313319
      78787A053131313131316D347A78784E133131313131313131313131317D2878
      7871710431313131313131313113001919190004313131313131312B521F1F1F
      274131313131313131313131313131310911021F1F1F232631313131295F1F1F
      1F1F612931313107021F1F022B3131313131312E021F1F52233131313131520E
      14602C7A78787A7C141414140C3131203E78787171660A1E6014141414140E31
      31155B107878107A567D371E1E1E1E1E1E13566C6C6C182C75757575756D315C
      021F1F1F1F211B1B1B1B1B1B4A4A4A4A4A3631313176021F1F1F026150232372
      5E021F1F1F0258762B2B4A44021F1F1F504A4A4A2B1D312E021F1F1F074A4A4A
      4A5C520D7A7A7A78787878787A7A7A5D1731317945197878784E4E7A7A7A7A7A
      7A5D6C313131165D7171717119191919191919195D6E313131313166007A7A7A
      4E1431295E021F1F1F0202020202020202020202062B313131315802021F1F1F
      020202021F1F1F1F52384C395252521F1F1F1F1F020202020608312E021F1F1F
      1F0202020221521771717878787878787171714E22313131335B287178787878
      71717171714E1731313131173E7A717878787878787878784E6E313131313166
      287171717A6031314A521F1F1F1F1F1F1F1F1F1F1F1F1F1F524A313131313169
      39521F1F1F1F1F1F1F1F020258310911021F1F1F1F1F1F1F1F1F1F1F022B312E
      021F1F1F1F1F1F1F1F50520D19191978787878781919190017313131310C0D10
      284E4E191919191919000D31313131317D1A4E4E4E19191919191919001C3131
      313131662878787810603131315F0202020202020202020202020202062B3131
      3131313136733902020202020261721D313129615252521F1F1F1F1F02020202
      0608312E021F1F1F1F0202020221527D17173C107878714D1717170D2C313131
      3131310E0A1C3B2217171717170D7D31313131313148757D7766171717171717
      0D0431313131316628787878106031313131364A3A7272727272727272727272
      505C3131313131313131264B5F737338354131313131093A7272725E1F1F1F1F
      4F1212122E5C312E021F1F1F631212121258523131310E1978787A0531313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313117003E3E3E5D753131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313107
      021F1F52583131313131312E021F1F0223313131313152313131601978787A05
      4C31313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131317F686E6E6E6E1531313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313121021F1F02073131313131312E021F1F023A3131313131523131316019
      78787A054C313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313173021F1F1F1F4F3A233A32312E021F1F023A31313131315231
      3131601978787A054C3131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313169521F1F1F1F0202020608312E021F1F023A313131
      313152313131601978787A054C31313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131310963521F1F1F1F1F1F024A312E021F1F02
      3A313131313152313131601971717A054C313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131313131313131314150611F1F1F1F1F024A3150
      021F1F023A3131313131523131310C0D17176C774C3131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131313131313131313131313131315C3872727272
      725C31082E2E2E2E1B31313131315200006D35000013006D6D6F464F4E454649
      4C49414C424153455F52000200AC0000005B000000AA0000000A000000040000
      00F4010000000000000000FFFFFF1F2C02000000000001001600464F4E453A20
      5B464F4E4546494C49414C424153455D00000000FFFF00000000000200000001
      00000000090068656C7665746963610006000000000000000000100000000100
      020000000000FFFFFF00000000020000000000000000002236000014006D6D6F
      454E44455245434F5F42414952524F5F52000200AC00000045000000AB000000
      0A00000000000000F4010000000000000000FFFFFF1F2C020000000000010024
      005B52554146494C49414C424153455D202D205B42414952524F46494C49414C
      424153455D00000000FFFF0000000000020000000100000000090068656C7665
      746963610006000000000000000000100000000100020000000000FFFFFF0000
      000002000000000000000000EF36000012006D6D6F4345505F4349444144455F
      55465F52000200AC00000050000000AB0000000A00000000000000F401000000
      0000000000FFFFFF1F2C02000000000001003E004345503A205B43455046494C
      49414C424153455D202D205B43494441444546494C49414C424153455D202D20
      5B45535441444F46494C49414C424153455D00000000FFFF0000000000020000
      000100000000090068656C766574696361000600000000000000000010000000
      0100020000000000FFFFFF00000000020000000000000000008537000008006D
      6D6F52415A414F000200AC0000002E000000AB0000001400000003000000F401
      0000000000000000FFFFFF1F2C020000000000010011005B52415A414F46494C
      49414C424153455D00000000FFFF000000000002000000010000000609006865
      6C7665746963610006000000000000000000100000000100020000000000FFFF
      FF00000000020000000000000000001338000009006D6D6F544954554C4F0002
      00540100002E000000320100001700000002000000F4010000000000000000FF
      FFFF1F2C020000000000010008005B746974756C6F5D00000000FFFF00000000
      00020000000100000006090068656C766574696361000B000000020000000000
      020000000100020000000000FFFFFF0000000002000000000000000000A43800
      000F006D6D6F524F54554C4F444154415F520002007C0200002E0000001C0000
      000C00000043000000F4010000000000000000FFFFFF1F2C0200000000000100
      0500446174613A00000000FFFF0000000000020000000100000000090068656C
      7665746963610006000000000000000000000000000100020000000000FFFFFF
      00000000020000000000000000003B39000009006D6D6F444154415F52000200
      990200002E0000002C0000000C00000043000000F4010000000000000000FFFF
      FF1F2C020000000000010011005B4441544520234464642F6D6D2F79795D0000
      0000FFFF0000000000020000000100000000090068656C766574696361000600
      0000000000000000010000000100020000000000FFFFFF000000000200000000
      0000000000D039000011006D6D6F524F54554C4F504147494E415F520002007C
      02000039000000280000000C00000043000000F4010000000000000000FFFFFF
      1F2C0200000000000100070050E167696E613A00000000FFFF00000000000200
      00000100000000090068656C7665746963610006000000000000000000000000
      000100020000000000FFFFFF00000000020000000000000000005F3A00000B00
      6D6D6F504147494E415F52000200A502000039000000200000000C0000004300
      0000F4010000000000000000FFFFFF1F2C020000000000010007005B50414745
      235D00000000FFFF0000000000020000000100000000090068656C7665746963
      610006000000000000000000010000000100020000000000FFFFFF0000000002
      000000000000000000FC3A00000F006D6D6F524F44415045484F52415F520002
      002F0000007C020000580000000A00000043000000F4010000000000000000FF
      FFFF1F2C020000000000010011005B54494D4520235468683A6D6D3A73735D00
      000000FFFF0000000000020000000100000000090068656C7665746963610007
      000000000000000000100000000100020000000000FFFFFF0000000002000000
      000000000000A53B00000C006D6D6F544543534F46545F52000200E80100007C
      020000DC0000000A00000043000000F4010000000000000000FFFFFF1F2C0200
      0000000001002000746563534F4654202D205465636E6F6C6F67696120656D20
      53697374656D617300000000FFFF000000000002000000010000000009006865
      6C7665746963610007000000000000000000110000000100020000000000FFFF
      FF000000000200000000000000FEFEFF33000000070020546F74616973000000
      000300527561000000000600436964616465000000000400466F6E6500000000
      0600546974756C6F0000000006004F757472617300000000060042616972726F
      000000000600204461646F73000000000B00477275706F46696C69616C000000
      000F004E6F6D65477275706F46696C69616C00000000060046696C69616C0000
      00000A004E6F6D6546696C69616C000000000600566C72526563000100300008
      004A75726F7352656300010030000800546F74616C5265630001003000070056
      6C7261526563000100300009004A75726F736152656300010030000900546F74
      616C6152656300010030000600566C72506167000100300008004A75726F7350
      616700010030000800546F74616C50616700010030000700566C726150616700
      0100300009004A75726F736150616700010030000900546F74616C6150616700
      010030000C0053616C646F496E696369616C0001003000090064657363726963
      616F000000000D00646174616D6F76696D656E746F000000000D005453616C64
      6F496E696369616C00010030000B00686973746F7269636F5F63000000000B00
      686973746F7269636F5F64000000000C0020546F74616C697A6163616F000000
      00070054566C72526563000000000900544A75726F7352656300000000090054
      546F74616C52656300000000080054566C7261526563000000000A00544A7572
      6F7361526563000000000A0054546F74616C6152656300000000070054566C72
      506167000000000900544A75726F7350616700000000090054546F74616C5061
      6700000000080054566C7261506167000000000A00544A75726F736150616700
      0000000A0054546F74616C61506167000000000700545453616C646F00010030
      000C0054566C72615265635F416E74000000000C0054566C72615061675F416E
      74000000000B00545453616C646F5F416E74000000000C00204167727570616D
      656E746F00000000120041677275706172477275706F46696C69616C00050046
      616C7365000D004167727570617246696C69616C00050046616C7365000F0054
      69706F646552656C61746F72696F00010030000000000000000000FC00000000
      0000000000000000000000005800D56AD3C9CE1FE5403513AACFB584E540}
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
      Alignment = taCenter
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
