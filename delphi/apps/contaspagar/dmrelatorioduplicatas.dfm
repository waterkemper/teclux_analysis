inherited dtmRelatorioDuplicatas: TdtmRelatorioDuplicatas
  OldCreateOrder = False
  Left = 174
  Top = 196
  Height = 571
  Width = 1024
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
      'SELECT nome,codigo'
      'FROM     filiais'
      'ORDER BY UPPER(TO_ASCII(nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 447
    Top = 15
    object qryConsultaFiliaisnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaFiliaiscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
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
      'SELECT descricao,codigo'
      'FROM     gruposfiliais'
      'ORDER BY UPPER(TO_ASCII(descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 447
    Top = 80
    object qryConsultaGrupoFiliaisdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
    object qryConsultaGrupoFiliaiscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
  end
  object qryBancos: TtecQuery
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
      'Select  codigo,'
      '            nome'
      'From    bancos'
      'Where codigo =:codigo')
    RequestLive = True
    Left = 68
    Top = 203
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryBancoscodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryBancosnome: TStringField
      FieldName = 'nome'
      Size = 50
    end
  end
  object dsrBanco: TtecDataSource
    DataSet = qryBancos
    Left = 242
    Top = 203
  end
  object qryConsultaBancos: TtecQuery
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
      'Select  sigla,'
      '            nome,'
      '            codigo'
      'From    bancos'
      'Order By UPPER(TO_ASCII(nome,'#39'LATIN1'#39'))')
    RequestLive = True
    Left = 447
    Top = 202
    object qryConsultaBancossigla: TStringField
      DisplayLabel = 'Sigla'
      FieldName = 'sigla'
      Size = 10
    end
    object qryConsultaBancosnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 50
    end
    object qryConsultaBancoscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
  end
  object qryDuplicatas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeOpen = qryDuplicatasBeforeOpen
    OnCalcFields = qryDuplicatasCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'TipoRelatorio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Periodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Periodo_Emissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GrupoFilial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fornecedor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TipoFornecimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GrupoFornecedor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Banco'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Conta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Previsao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Evento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaCondicionalDocumentosPag_d'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Autorizado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TipoPagamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Administrador'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Periodo_Adiantamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Banco_Adiantamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Conta_Adiantamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Autorizado_Adiantamento_nonononon'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TipoPagamento_Adiantamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Ordenacao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select selecao.*,'
      '       to_char(datalancto, '#39'MM/YYYY'#39') as mesAno,'
      ''
      '       coalesce(NullIf((select sum(dp.valorpagto)'
      
        '        from duplicatas dp join documentospag dt on dp.documento' +
        'pag = dt.numero'
      '        where dp.documentopag = selecao.documentopag'
      
        '          and not coalesce(dt.regimedecaixa,false)),0),selecao.v' +
        'alorpagto) as TotalValorPagto,'
      ''
      
        '       coalesce(NullIf((select sum(case when dp.valorpagto>dp.va' +
        'lorvencto then dp.valorpagto-dp.valorvencto else 0.00 end)'
      
        '        from duplicatas dp  join documentospag dt on dp.document' +
        'opag = dt.numero'
      '        where dp.documentopag = selecao.documentopag'
      '          and not coalesce(dt.regimedecaixa,false)),0),'
      
        '            case when selecao.valorpagto>selecao.valorvencto the' +
        'n selecao.valorpagto-selecao.valorvencto'
      '            else 0.00 end) as TotalValorJurosPagos,'
      ''
      
        '       coalesce(NullIf((select sum(case when coalesce(dp.valorpa' +
        'gto,0)<>0 and dp.valorpagto<dp.valorvencto then dp.valorvencto-d' +
        'p.valorpagto else 0.00 end)'
      
        '        from duplicatas dp join documentospag dt on dp.documento' +
        'pag = dt.numero'
      '        where dp.documentopag = selecao.documentopag'
      '          and not coalesce(dt.regimedecaixa,false)),0),'
      
        '          case when coalesce(selecao.valorpagto,0)<>0 and seleca' +
        'o.valorpagto<selecao.valorvencto then selecao.valorvencto-seleca' +
        'o.valorpagto else 0.00 end)'
      '          as TotalValorDescReceb,'
      ''
      '       coalesce(NullIf((select count(*)'
      
        '        from duplicatas dp join documentospag dt on dp.documento' +
        'pag = dt.numero'
      '        where dp.documentopag = selecao.documentopag'
      
        '          and not coalesce(dt.regimedecaixa,false)),0),1) as QtP' +
        'arcelas,'
      ''
      
        '       coalesce(selecao.valorvencto,0) - coalesce(selecao.valord' +
        'esconto,0) as valorliquido'
      ''
      ''
      ''
      'from'
      '('
      '('
      '  Select t.documentopag,'
      '         t.numero,'
      '         d.filialemissao,'
      '         f.nome as nomefilialemissao,'
      '         f.cnpj as cnpjfilial,'
      '         fgf.grupo as grupofilialemissao,'
      '         gf.descricao as nomegrupofilialemissao,'
      '         n.numero as nota,'
      '         n.serie,'
      '         d.complemento,'
      '         t.complemento as complementoduplicata,'
      '         d.fornecedor,'
      '         d.tipofornecedor,'
      '         coalesce(vf.razao,vf.nome) as nomefornecedor,'
      '         vf.pessoanumero as cnpj_cpf_fornecedor,'
      ''
      '         d.emissao,'
      
        '         case when d.regimedecaixa then t.datavencto else d.data' +
        'lancto end as datalancto,'
      '         d.previsao,'
      '         t.bancocobranca,'
      
        '         (select b.sigla from bancos b where b.codigo = t.bancoc' +
        'obranca) as siglabancocobranca,'
      '         t.datavencto,'
      '         t.valorvencto,'
      '         t.valordesconto,'
      ''
      '         t.datapagto,'
      '         t.valorpagto,'
      
        '         (select b.sigla from bancos b join contas c on c.banco ' +
        '= b.codigo where c.conta = t.contapagto) as siglabancopagto,'
      '         t.contapagto,'
      '         t.observacao,'
      '         false as adiantamento,'
      
        '         cast(cast(abs(t.datavencto - current_date)as varchar) |' +
        '| cast('#39' - D'#39' as varchar) as varchar) as obs,'
      
        '         case When :AgruparData then True else False end as Dife' +
        'renciar,'
      
        '        (select e.codigo from eventos e where e.codigo=coalesce(' +
        't.evento,d.evento)) as evento,'
      
        '        (select e.descricao from eventos e where e.codigo=coales' +
        'ce(t.evento,d.evento)) as descricao_evento,'
      ''
      '        (select u.usename'
      '         from duplicatas_log t_log'
      '              join usuarios u'
      '              on t_log.trigger_user = u.usename'
      '         where t_log.documentopag = t.documentopag'
      '           and t_log.numero = t.numero'
      '           and t_log.trigger_mode = '#39'INSERT'#39
      '           and t_log.trigger_tuple = '#39'NEW'#39
      
        '         order by t_log.trigger_changed desc limit 1) as Usuario' +
        'Lancamento,'
      ''
      '        (select u.usename'
      '         from duplicatas_log t_log'
      '              join usuarios u'
      '              on t_log.trigger_user = u.usename'
      '         where t_log.documentopag = t.documentopag'
      '           and t_log.numero = t.numero'
      '           and t_log.trigger_mode = '#39'UPDATE'#39
      '           and t_log.trigger_tuple = '#39'NEW'#39
      '           AND t_log.datapagto is not null'
      
        '         order by t_log.trigger_changed desc limit 1) as Usuario' +
        'Pagamento,'
      ''
      '       t.dda,'
      '       d.regimedecaixa,'
      '       '
      
        '       case when coalesce(d.regimedecaixa,false) then t.valorven' +
        'cto else d.valor end as valor'
      '       '
      '  From  ((duplicatas t'
      '         left join notaspag n'
      '         on n.documentopag = t.documentopag)'
      ''
      '         join (((documentospag d'
      '                join (filiais f'
      '                     left join (filiaisgruposfiliais fgf'
      '                                left join gruposfiliais gf'
      '                                on fgf.grupo=gf.codigo )'
      '                     on f.codigo=fgf.filial)'
      '               on d.filialemissao=f.codigo)'
      #9#9#9'   '
      '               JOIN eventos e'
      '               ON d.evento = e.Codigo)'
      ''
      '               join vfornecedores vf'
      '               on d.fornecedor = vf.codigo'
      '               and d.tipofornecedor = vf.tipo)'
      ''
      '         on t.documentopag = d.numero)'
      ''
      '  where :Condicao_incluir_duplicatas'
      ''
      ''
      '  %TipoRelatorio'
      '  %Periodo'
      '  %Periodo_Emissao'
      '  %Filial'
      '  %GrupoFilial'
      '  %Fornecedor'
      '  %TipoFornecimento'
      '  %GrupoFornecedor'
      '  %Banco'
      '  %Conta'
      '  %Previsao'
      '  %Evento'
      '  %ListaCondicionalDocumentosPag_d'
      '  %Autorizado'
      '  %TipoPagamento'
      '  %Administrador'
      '  %DDA'
      ''
      ')'
      ''
      'union all'
      ''
      '('
      ''
      '  Select d.numero as documentopag,'
      '         cast(1 as integer) as numero,'
      '         d.filialemissao,'
      '         f.nome as nomefilialemissao,'
      '         f.cnpj as cnpjfilial,'
      '         fgf.grupo as grupofilialemissao,'
      '         gf.descricao as nomegrupofilialemissao,'
      '         cast(null as integer) as nota,'
      '         cast(null as varchar(3)) as serie,'
      '         d.complemento,'
      '         d.complemento as complementoduplicata,'
      '         d.fornecedor,'
      '         d.tipofornecedor,'
      ''
      '         coalesce(vf.razao,vf.nome) as nomefornecedor,'
      '         vf.pessoanumero as cnpj_cpf_fornecedor,'
      ''
      ''
      '         d.emissao,'
      '         d.datalancto,'
      '         d.previsao,'
      
        '        (select ct.banco from contas ct where ct.conta = d.conta' +
        'pagto) as bancocobranca,'
      
        '        (select b.sigla from bancos b where b.codigo = (select c' +
        't.banco from contas ct where ct.conta = d.contapagto)) as siglab' +
        'ancocobranca,'
      '         d.datalancto as datavencto,'
      ''
      '         d.valor as valorvencto,'
      '         0.00 as valordesconto,'
      ''
      '         d.datalancto as datapagto,'
      '         d.valor as valorpagto,'
      ''
      
        '         (select b.sigla from bancos b where b.codigo = (select ' +
        'ct.banco from contas ct where ct.conta = d.contapagto)) as sigla' +
        'bancopagto,'
      ''
      '         d.contapagto,'
      '         d.referencia as observacao,'
      '         true as adiantamento,'
      '         cast(null as varchar) as obs,'
      
        '         case When :AgruparData then True else False end as Dife' +
        'renciar,'
      
        '        (select e.codigo from eventos e where e.codigo=d.evento)' +
        ' as evento,'
      
        '        (select e.descricao from eventos e where e.codigo=d.even' +
        'to) as descricao_evento,'
      ''
      ''
      '        (select u.nome'
      '         from documentospag_log d_log'
      '              join usuarios u'
      '              on d_log.trigger_user = u.usename'
      '         where d_log.numero = d.numero'
      '           and d_log.trigger_mode = '#39'INSERT'#39
      '           and d_log.trigger_tuple = '#39'NEW'#39
      
        '         order by d_log.trigger_changed desc limit 1) as Usuario' +
        'Lancamento,'
      ''
      ''
      '        (select u.nome'
      '         from documentospag_log d_log'
      '              join usuarios u'
      '              on d_log.trigger_user = u.usename'
      '         where d_log.numero = d.numero'
      '           and d_log.trigger_mode = '#39'INSERT'#39
      '           and d_log.trigger_tuple = '#39'NEW'#39
      
        '         order by d_log.trigger_changed desc limit 1) as Usuario' +
        'Pagamento,'
      ''
      '        false as dda,'
      '        d.regimedecaixa,'
      '        d.valor'
      ''
      
        '  From (((documentospag d join (filiais f left join (filiaisgrup' +
        'osfiliais fgf'
      
        '                                                   left join gru' +
        'posfiliais gf'
      
        '                                                   on fgf.grupo=' +
        'gf.codigo)'
      '                              on f.codigo=fgf.filial)'
      '        on d.filialemissao=f.codigo)'
      #9#9
      '        JOIN eventos e'
      '        ON d.evento = e.Codigo)'
      #9#9
      '        join vfornecedores vf'
      '        on d.fornecedor = vf.codigo'
      '        and d.tipofornecedor = vf.tipo)'
      ''
      
        '  where coalesce(d.adiantamento,false) and :Condicao_incluir_Adi' +
        'antamento'
      ''
      '  %Periodo_Adiantamento'
      '  %Periodo_Emissao'
      '  %Filial'
      '  %GrupoFilial'
      '  %Fornecedor'
      '  %TipoFornecimento'
      '  %GrupoFornecedor'
      '  %Banco_Adiantamento'
      '  %Conta_Adiantamento'
      '  %Previsao'
      '  %Evento'
      '  %ListaCondicionalDocumentosPag_d'
      '  %Autorizado_Adiantamento_nonononon'
      '  %TipoPagamento_Adiantamento'
      '  %Administrador'
      ''
      ')'
      ''
      ') as selecao'
      ''
      '%Ordenacao')
    RequestLive = True
    Left = 648
    Top = 17
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'AgruparData'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Condicao_incluir_duplicatas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Condicao_incluir_Adiantamento'
        ParamType = ptUnknown
      end>
    object qryDuplicatasdocumentopag: TIntegerField
      FieldName = 'documentopag'
      Required = True
      DisplayFormat = '0'
    end
    object qryDuplicatasfilialemissao: TIntegerField
      FieldName = 'filialemissao'
      Required = True
      DisplayFormat = '0'
    end
    object qryDuplicatasnomefilialemissao: TStringField
      DisplayWidth = 40
      FieldName = 'nomefilialemissao'
      Size = 60
    end
    object qryDuplicatascnpjfilial: TStringField
      FieldName = 'cnpjfilial'
      Size = 14
    end
    object qryDuplicatasgrupofilialemissao: TIntegerField
      FieldName = 'grupofilialemissao'
      DisplayFormat = '0'
    end
    object qryDuplicatasnomegrupofilialemissao: TStringField
      FieldName = 'nomegrupofilialemissao'
      Size = 30
    end
    object qryDuplicatasnota: TIntegerField
      FieldName = 'nota'
      DisplayFormat = '0'
    end
    object qryDuplicatasserie: TStringField
      FieldName = 'serie'
      Size = 3
    end
    object qryDuplicatasfornecedor: TIntegerField
      FieldName = 'fornecedor'
      Required = True
      DisplayFormat = '0'
    end
    object qryDuplicatastipofornecedor: TStringField
      FieldName = 'tipofornecedor'
      Required = True
      Size = 1
    end
    object qryDuplicatasnomefornecedor: TStringField
      DisplayWidth = 32
      FieldName = 'nomefornecedor'
      Size = 56
    end
    object qryDuplicatascnpj_cpf_fornecedor: TStringField
      FieldName = 'cnpj_cpf_fornecedor'
      Size = 14
    end
    object qryDuplicatasdatavencto: TDateField
      Alignment = taCenter
      FieldName = 'datavencto'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryDuplicatasvalorvencto: TFloatField
      FieldName = 'valorvencto'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryDuplicatasvalordesconto: TFloatField
      FieldName = 'valordesconto'
      DisplayFormat = '0.00'
    end
    object qryDuplicatasdatapagto: TDateField
      Alignment = taCenter
      FieldName = 'datapagto'
      EditMask = '99/99/9999;1; '
    end
    object qryDuplicatasvalorpagto: TFloatField
      FieldName = 'valorpagto'
      DisplayFormat = '0.00'
    end
    object qryDuplicatasnumero: TIntegerField
      FieldName = 'numero'
      Required = True
      DisplayFormat = '0'
    end
    object qryDuplicatasprevisao: TBooleanField
      FieldName = 'previsao'
      Required = True
    end
    object qryDuplicatasemissao: TDateField
      Alignment = taCenter
      FieldName = 'emissao'
      EditMask = '99/99/9999;1; '
    end
    object qryDuplicatasValorJurosPagos: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ValorJurosPagos'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryDuplicatasValorDescReceb: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ValorDescReceb'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryDuplicatasobservacao: TStringField
      DisplayWidth = 32
      FieldName = 'observacao'
      Size = 148
    end
    object qryDuplicatasContaPagto: TIntegerField
      FieldName = 'ContaPagto'
    end
    object qryDuplicatasdiferenciar: TBooleanField
      FieldName = 'diferenciar'
    end
    object qryDuplicatasbancocobranca: TIntegerField
      FieldName = 'bancocobranca'
    end
    object qryDuplicatassiglabancocobranca: TStringField
      FieldName = 'siglabancocobranca'
      Size = 10
    end
    object qryDuplicatassiglabancopagto: TStringField
      DisplayWidth = 7
      FieldName = 'siglabancopagto'
      Size = 10
    end
    object qryDuplicatasobs: TStringField
      FieldName = 'obs'
      Size = 7
    end
    object qryDuplicatasevento: TIntegerField
      FieldName = 'evento'
    end
    object qryDuplicatasdescricao_evento: TStringField
      FieldName = 'descricao_evento'
      Size = 30
    end
    object qryDuplicatascomplemento: TStringField
      FieldName = 'complemento'
      Size = 15
    end
    object qryDuplicatasdocumento: TStringField
      FieldKind = fkCalculated
      FieldName = 'documento'
      Calculated = True
    end
    object qryDuplicatasadiantamento: TBooleanField
      FieldName = 'adiantamento'
    end
    object qryDuplicatasdda: TBooleanField
      FieldName = 'dda'
    end
    object qryDuplicatasdatalancto: TDateField
      Alignment = taCenter
      FieldName = 'datalancto'
      EditMask = '99/99/9999;1; '
    end
    object qryDuplicatasmesano: TMemoField
      FieldName = 'mesano'
      BlobType = ftMemo
    end
    object qryDuplicatasvalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '0.00'
    end
    object qryDuplicatasregimedecaixa: TBooleanField
      FieldName = 'regimedecaixa'
    end
    object qryDuplicatastotalvalorjurospagos: TFloatField
      FieldName = 'totalvalorjurospagos'
      DisplayFormat = '0.00'
    end
    object qryDuplicatastotalvalordescreceb: TFloatField
      FieldName = 'totalvalordescreceb'
      DisplayFormat = '0.00'
    end
    object qryDuplicatastotalvalorpagto: TFloatField
      FieldName = 'totalvalorpagto'
      DisplayFormat = '0.00'
    end
    object qryDuplicatasqtparcelas: TLargeintField
      FieldName = 'qtparcelas'
    end
    object qryDuplicatascomplementoduplicata: TStringField
      FieldName = 'complementoduplicata'
      Size = 15
    end
    object qryDuplicatasEventoDescricao: TStringField
      FieldKind = fkCalculated
      FieldName = 'EventoDescricao'
      Size = 60
      Calculated = True
    end
    object qryDuplicatasUsuarioLancamento: TStringField
      FieldName = 'UsuarioLancamento'
      Size = 100
    end
    object qryDuplicatasUsuarioPagamento: TStringField
      FieldName = 'UsuarioPagamento'
      Size = 100
    end
    object qryDuplicatasvalorliquido: TCurrencyField
      FieldName = 'valorliquido'
    end
  end
  object qryFornecedores: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeOpen = qryFornecedoresBeforeOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT  f.Codigo,'
      '        coalesce(f.razao,f.Nome) as nome,'
      '        f.Tipo'
      ''
      'FROM    vfornecedores f'
      ''
      'WHERE   f.Tipo   = :Tipo AND'
      '        f.Codigo = :Codigo')
    RequestLive = True
    Left = 68
    Top = 139
    ParamData = <
      item
        DataType = ftString
        Name = 'tipo'
        ParamType = ptUnknown
        Value = 'F'
      end
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryFornecedorescodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryFornecedoresnome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object qryFornecedorestipo: TStringField
      FieldName = 'tipo'
      Size = 50
    end
  end
  object dsrFornecedores: TtecDataSource
    DataSet = qryFornecedores
    Left = 242
    Top = 139
  end
  object qryConsultaFornecedores: TtecQuery
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
      'Select  coalesce(v.razao,v.nome) as nome ,'
      '            v.codigo,'
      '            cast(v.tipo as varchar) as tipo,'
      '            formatar_cpf_cnpj(v.pessoanumero) as pessoanumero,'
      '            descricao_tipocliente(v.tipo) as tipocliente,'
      '            v.estado,'
      '            c.nome as nomecidade'
      'From    vfornecedores v, cidades c'
      '/*     Preenchido em RunTime      */'
      '   and (v.estado = c.estado)'
      '   and (v.cidade = c.codigo)'
      'Order By UPPER(TO_ASCII(coalesce(v.razao,v.nome),'#39'LATIN1'#39'))')
    RequestLive = True
    Left = 447
    Top = 138
    object qryConsultaFornecedoresnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaFornecedorespessoanumero: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'pessoanumero'
      Size = 18
    end
    object qryConsultaFornecedoresnomecidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'nomecidade'
      Required = True
      Size = 30
    end
    object qryConsultaFornecedoresestado: TStringField
      DisplayLabel = 'UF'
      FieldName = 'estado'
      Size = 2
    end
    object qryConsultaFornecedorescodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
    object qryConsultaFornecedorestipocliente: TStringField
      DisplayLabel = 'Tipo fornecedor'
      FieldName = 'tipocliente'
      Size = 14
    end
    object qryConsultaFornecedorestipo: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'tipo'
      Visible = False
      Size = 1
    end
  end
  object fdsDuplicatasPagar: TfrDBDataSet
    DataSet = qryDuplicatas
    OpenDataSource = False
    Left = 656
    Top = 205
  end
  object frpPagamentosEfetuados: TfrReport
    Dataset = fdsDuplicatasPagar
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnBeforePrint = frpPagamentosEfetuadosBeforePrint
    Left = 656
    Top = 328
    ReportForm = {
      19000000DD5A000019FFFF00000A0050444643726561746F7200FFFFFFFFFF00
      000000340800009A0B0000000000000B0000002F000000070000000100040000
      0000FFFF000000000000000000000000030400466F726D00FEFFFFFFDC000000
      780000007C0100002C010000042D000500626567696E0D1C006966205B416772
      75706172477275706F46696C69616C5D207468656E0D0500626567696E0D2400
      204361626563616C686F477275706F46696C69616C2E76697369626C653A3D74
      7275653B0D210020526F64617065477275706F46696C69616C2E76697369626C
      653A3D747275653B0D0300656E640D0400656C73650D0500626567696E0D2500
      204361626563616C686F477275706F46696C69616C2E76697369626C653A3D66
      616C73653B0D220020526F64617065477275706F46696C69616C2E7669736962
      6C653A3D66616C73653B0D0400656E643B0D00000D17006966205B4167727570
      617246696C69616C5D207468656E0D0500626567696E0D1F0020436162656361
      6C686F46696C69616C2E76697369626C653A3D747275653B0D1C0020526F6461
      706546696C69616C2E76697369626C653A3D747275653B0D0300656E640D0400
      656C73650D0500626567696E0D2000204361626563616C686F46696C69616C2E
      76697369626C653A3D66616C73653B0D1D0020526F6461706546696C69616C2E
      76697369626C653A3D66616C73653B0D0400656E643B0D00000D1B006966205B
      41677275706172466F726E656365646F725D207468656E0D0500626567696E0D
      2300204361626563616C686F466F726E656365646F722E76697369626C653A3D
      747275653B0D200020526F64617065466F726E656365646F722E76697369626C
      653A3D747275653B0D0300656E640D0400656C73650D0500626567696E0D2400
      204361626563616C686F466F726E656365646F722E76697369626C653A3D6661
      6C73653B0D210020526F64617065466F726E656365646F722E76697369626C65
      3A3D66616C73653B0D0500656E643B200D00000D15006966205B416772757061
      72446174615D207468656E0D0500626567696E0D24002020204361626563616C
      686F44617461506167746F2E76697369626C653A3D747275653B0D2100202020
      526F6461706544617461506167746F2E76697369626C653A3D747275653B0D03
      00656E640D0400656C73650D0500626567696E0D25002020204361626563616C
      686F44617461506167746F2E76697369626C653A3D66616C73653B0D22002020
      20526F6461706544617461506167746F2E76697369626C653A3D66616C73653B
      0D0500656E643B200D0300656E64000200660400000B004461646F734D657374
      726500020100000000F80000002F0400000B0000003100050001000000000000
      000000FFFFFF1F0000000012006664734475706C696361746173506167617200
      00000003000500626567696E0D1200204C494E4841203A3D205B4C494E45235D
      200D0300656E6400FFFF000000000002000000010000000000000001000000C8
      00000014000000010000000000000200D30400000D00526F646170E94D657374
      72653100020100000000D70100002F0400001500000030000600010000000000
      00000000FFFFFF1F00000000000000000000000000FFFF000000000002000000
      010000000000000001000000C800000014000000010000000000000200430500
      001000526F64617065466F726E656365646F72000201000000004C0100002F04
      00001D0000003000110001000000000000000000FFFFFF1F0000000000000000
      0000000000FFFF000000000002000000010000000000000001000000C8000000
      140000000100000000000002007306000014004361626563616C686F47727570
      6F46696C69616C00020100000000940000002F0400001C000000300010000100
      0000000000000000FFFFFF1F0000000048005B6966285B416772757061724772
      75706F66696C69616C5D3D547275652C205B7172794475706C6963617461732E
      22477275706F46696C69616C456D697373616F225D2C2727295D000000000600
      0500626567696E0D180020204746546F74616C56616C6F7256656E63746F3A3D
      303B0D120020204746546F74616C4A75726F733A3D303B0D190020204746546F
      74616C56616C6F72506167746F3A3D303B20200D180020204746546F74616C52
      6567697374726F733A3D303B20200D0300656E6400FFFF000000000002000000
      010000000000000001000000C800000014000000010000000000000200940700
      000F004361626563616C686F46696C69616C00020100000000B80000002F0400
      001C0000003000100001000000000000000000FFFFFF1F000000003E005B6966
      285B4167727570617246696C69616C5D3D547275652C205B7172794475706C69
      63617461732E2246696C69616C456D697373616F225D2C2727295D0000000006
      000500626567696E0D180020204746546F74616C56616C6F7256656E63746F3A
      3D303B0D120020204746546F74616C4A75726F733A3D303B0D19002020474654
      6F74616C56616C6F72506167746F3A3D303B20200D180020204746546F74616C
      526567697374726F733A3D303B20200D0300656E6400FFFF0000000000020000
      00010000000000000001000000C8000000140000000100000000000002004A08
      000013004361626563616C686F466F726E656365646F7200020100000000DE00
      00002F040000000000003000100001000000000000000000FFFFFF1F00000000
      43005B6966285B41677275706172466F726E656365646F725D3D547275652C20
      5B7172794475706C6963617461732E224E6F6D65466F726E656365646F72225D
      2C2727295D00000000000000FFFF000000000002000000010000000000000001
      000000C800000014000000010000000000000200B60800000C00526F64617065
      46696C69616C00020100000000880100002F0400001400000030001100010000
      00000000000000FFFFFF1F00000000000000000000000000FFFF000000000002
      000000010000000000000001000000C800000014000000010000000000000200
      270900001100526F64617065477275706F46696C69616C00020100000000AC01
      00002F040000140000003000110001000000000000000000FFFFFF1F00000000
      000000000000000000FFFF000000000002000000010000000000000001000000
      C800000014000000010000000000000200FF0900000F00526F64617065446174
      61506167746F00020100000000280100002F0400001500000030001100010000
      00000000000000FFFFFF1F0000000000000000000005000500626567696E0D2B
      00206966205B7172794475706C6963617461732E226469666572656E63696172
      225D3D54727565207468656E0D11002076697369626C65203A3D2046616C7365
      0D1700656C73652076697369626C65203A3D20747275653B20200D0300656E64
      00FFFF000000000002000000010000000000000001000000C800000014000000
      010000000000000200A90A0000120043616265E7616C686F446520477275706F
      3100020100000000EE0000002F04000000000000300010000100000000000000
      0000FFFFFF1F0000000038005B6966285B41677275706172446174615D3D5472
      75652C205B7172794475706C6963617461732E2264617461706167746F225D2C
      2727295D00000000000000FFFF00000000000200000001000000000000000100
      0000C800000014000000010000000000000200120B000009004361626563616C
      686F000201000000002E0000002F040000590000003000020001000000000000
      000000FFFFFF1F00000000000000000000000000FFFF00000000000200000001
      0000000000000001000000C8000000140000000100000000000002007B0B0000
      0900666276526F6461706500020100000000400200002F0400000D0000003000
      030001000000000000000000FFFFFF1F00000000000000000000000000FFFF00
      0000000002000000010000000000000001000000C80000001400000001000000
      00000000000D0C00000A006D6D6F5A65627261646F00020018000000F9000000
      E50300000B0000004100000001000000FFFFFF1F0000FFFFFF1F2C0200000000
      0000000002000500626567696E0D0300656E6400FFFF00000000000200000001
      00000000090068656C766574696361000A000000000000000000000000000100
      020000000000FFFFFF1F00000002000000000000000000EC0C000006004D656D
      6F31390002009A010000F8000000480000000B00000040000000F40100000000
      00000000FFFFFF1F2C02000000000001003A005B466F726D6174466C6F617428
      272323232C2323232C2323302E3030272C7172794475706C6963617461732E22
      76616C6F72706167746F22295D00000000FFFF00000000000200000001000000
      06090068656C7665746963610007000000000000000000010000000100020000
      000000FFFFFF1F22005B7172794475706C6963617461732E226469666572656E
      63696172225D3D547275650002000000000000000000BE0D000005004D656D6F
      3800020082010000DB010000600000000E00000043000000F401000000000000
      0000FFFFFF1F2C020000000000010050005B466F726D6174466C6F6174282723
      23232C2323232C2323302E3030272C53554D285B7172794475706C6963617461
      732E2276616C6F72706167746F225D2C204461646F734D65737472652C312929
      5D00000000FFFF0000000000020000000100000000090068656C766574696361
      0007000000020000000000010000000100020000000000FFFFFF000000000200
      0000000000000000910E000006004D656D6F3334000200820100004F01000060
      0000000E00000043000000F4010000000000000000FFFFFF1F2C020000000000
      010050005B466F726D6174466C6F617428272323232C2323232C2323302E3030
      272C53554D285B7172794475706C6963617461732E2276616C6F72706167746F
      225D2C204461646F734D65737472652C3129295D00000000FFFF000000000002
      0000000100000000090068656C76657469636100070000000200000000000100
      00000100020000000000FFFFFF0000000002000000000000000000640F000006
      004D656D6F3432000200820100008B010000600000000E00000043000000F401
      0000000000000000FFFFFF1F2C020000000000010050005B466F726D6174466C
      6F617428272323232C2323232C2323302E3030272C53554D285B717279447570
      6C6963617461732E2276616C6F72706167746F225D2C204461646F734D657374
      72652C3129295D00000000FFFF0000000000020000000100000000090068656C
      7665746963610007000000020000000000010000000100020000000000FFFFFF
      00000000020000000000000000003710000006004D656D6F3437000200820100
      00AF010000600000000E00000043000000F4010000000000000000FFFFFF1F2C
      020000000000010050005B466F726D6174466C6F617428272323232C2323232C
      2323302E3030272C53554D285B7172794475706C6963617461732E2276616C6F
      72706167746F225D2C204461646F734D65737472652C3129295D00000000FFFF
      0000000000020000000100000000090068656C76657469636100070000000200
      00000000010000000100020000000000FFFFFF00000000020000000000000000
      000A11000006004D656D6F3532000200820100002C010000600000000E000000
      43000000F4010000000000000000FFFFFF1F2C020000000000010050005B466F
      726D6174466C6F617428272323232C2323232C2323302E3030272C53554D285B
      7172794475706C6963617461732E2276616C6F72706167746F225D2C20446164
      6F734D65737472652C3129295D00000000FFFF00000000000200000001000000
      00090068656C7665746963610007000000020000000000010000000100020000
      000000FFFFFF0000000002000000000000000000AA11000005004D656D6F3900
      020018000000F8000000270000000B00000040000000F4010000000000000000
      FFFFFF1F2C02000000000001001E005B7172794475706C6963617461732E2264
      6F63756D656E746F706167225D00000000FFFF00000000000200000001000000
      06090068656C7665746963610007000000000000000000010000000100020000
      000000FFFFFF00000000020000000000000000004512000006004D656D6F3130
      00020041000000F80000000F0000000B00000042000000F40100000000000000
      00FFFFFF1F2C020000000000010018005B7172794475706C6963617461732E22
      6E756D65726F225D00000000FFFF000000000002000000010000000609006865
      6C7665746963610007000000000000000000010000000100020000000000FFFF
      FF0000000002000000000000000000CC12000005004D656D6F31000200180000
      0067000000260000001B00000043000F00F4010000000000000000FFFFFF1F2C
      02000000000001000500444F43544F00000000FFFF0000000000020000000100
      000000090068656C76657469636100070000000000000000000A000000010002
      0000000000FFFFFF00000000020000000000000000005013000005004D656D6F
      320002003E00000067000000120000001B00000043000F00F401000000000000
      0000FFFFFF1F2C020000000000010002004E5000000000FFFF00000000000200
      00000100000000090068656C76657469636100070000000000000000000A0000
      000100020000000000FFFFFF0000000002000000000000000000DF1300000500
      4D656D6F360002009A010000670000004A0000001B00000043000F00F4010000
      000000000000FFFFFF1F2C0200000000000200050056414C4F520D0500504147
      544F00000000FFFF0000000000020000000100000000090068656C7665746963
      6100070000000000000000000A0000000100020000000000FFFFFF0000000002
      0000000000000000008114000006004D656D6F31330002009C000000F8000000
      160000000B00000040000000F4010000000000000000FFFFFF1F2C0200000000
      0001001F005B7172794475706C6963617461732E2266696C69616C656D697373
      616F225D00000000FFFF0000000000020000000100000006090068656C766574
      6963610007000000000000000000010000000100020000000000FFFFFF000000
      00020000000000000000002415000006004D656D6F323000020015010000F800
      0000830000000B00000043000000F4010000000000000000FFFFFF1F2C020000
      000000010020005B7172794475706C6963617461732E226E6F6D65666F726E65
      6365646F72225D00000000FFFF0000000000020000000100000006090068656C
      7665746963610007000000000000000000000000000100020000000000FFFFFF
      0000000002000000000000000000B315000006004D656D6F3232000200500000
      0067000000440000001B00000043000F00F4010000000000000000FFFFFF1F2C
      02000000000001000C0053C9524945202F204E4F544100000000FFFF00000000
      00020000000100000000090068656C7665746963610007000000000000000000
      0A0000000100020000000000FFFFFF0000000002000000000000000000AA1600
      0006004D656D6F323300020050000000F80000004E0000000B00000043000000
      F4010000000000000000FFFFFF1F2C020000000000010074005B4946285B7172
      794475706C6963617461732E22636F6D706C656D656E746F6475706C69636174
      61225D3D27272C5B7172794475706C6963617461732E22636F6D706C656D656E
      746F225D2C5B7172794475706C6963617461732E22636F6D706C656D656E746F
      6475706C6963617461225D295D00000000FFFF00000000000200000001000000
      06090068656C7665746963610007000000000000000000000000000100020000
      000000FFFFFF00000000020000000000000000009617000006004D656D6F3135
      0002006D010000DB0100002B0000000E00000043000000F40100000000000000
      00FFFFFF1F2C020000000000010000000005000500626567696E0D2500202069
      66205B53554D28312C4461646F734D65737472652C31295D203C3E2030207468
      656E0D2400202020202020204D656D6F3A3D205B53554D28312C4461646F734D
      65737472652C31295D0D0A002020656C73652027273B0D0300656E6400FFFF00
      00000000020000000100000000090068656C7665746963610007000000020000
      000000010000000100020000000000FFFFFF0000000002000000000000000000
      2418000006004D656D6F313700020015000000DB010000530100000E00000043
      000000F4010000000000000000FFFFFF1F2C02000000000001000B00544F5441
      4C20474552414C00000000FFFF0000000000020000000100000000090068656C
      7665746963610007000000000000000000010000000100020000000000FFFFFF
      0000000002000000000000000000AC18000005004D656D6F3500020094000000
      67000000200000001B00000043000F00F4010000000000000000FFFFFF1F2C02
      00000000000100060046494C49414C00000000FFFF0000000000020000000100
      000000090068656C76657469636100070000000000000000000A000000010002
      0000000000FFFFFF00000000020000000000000000003B19000006004D656D6F
      3231000200B400000067000000370000001B00000043000F00F4010000000000
      000000FFFFFF1F2C02000000000002000400444154410D0500504147544F0000
      0000FFFF0000000000020000000100000000090068656C766574696361000700
      00000000000000000A0000000100020000000000FFFFFF000000000200000000
      0000000000C419000006004D656D6F3238000200EB0000006700000029000000
      1B00000043000E00F4010000000000000000FFFFFF1F2C020000000000010006
      0043D34449474F00000000FFFF0000000000020000000100000000090068656C
      76657469636100070000000000000000000A0000000100020000000000FFFFFF
      0000000002000000000000000000631A000006004D656D6F3239000200EB0000
      00F8000000280000000B00000040000000F4010000000000000000FFFFFF1F2C
      02000000000001001C005B7172794475706C6963617461732E22666F726E6563
      65646F72225D00000000FFFF0000000000020000000100000006090068656C76
      65746963610007000000000000000000010000000100020000000000FFFFFF00
      00000002000000000000000000EB1A000006004D656D6F33300002001E020000
      67000000370000001B00000043000F00F4010000000000000000FFFFFF1F2C02
      000000000001000500444553432E00000000FFFF000000000002000000010000
      0000090068656C76657469636100070000000000000000000A00000001000200
      00000000FFFFFF0000000002000000000000000000381C000006004D656D6F33
      310002001A020000F80000003B0000000B00000040000000F401000000000000
      0000FFFFFF1F2C020000000000010000000005000500626567696E0D32002020
      6966205B5B7172794475706C6963617461732E2256616C6F7244657363526563
      6562225D203C3E20305D207468656E200D4E00202020202020204D656D6F3A3D
      205B466F726D6174466C6F617428272323232C2323232C2323302E3030272C5B
      7172794475706C6963617461732E2256616C6F72446573635265636562225D29
      5D0D12002020656C7365204D656D6F3A3D2027273B200D0300656E6400FFFF00
      00000000020000000100000006090068656C7665746963610007000000000000
      000000010000000100020000000000FFFFFF1F22005B7172794475706C696361
      7461732E226469666572656E63696172225D3D54727565000200000000000000
      0000E11C000006004D656D6F3235000200B4000000F8000000350000000B0000
      0040000000F4010000000000000000FFFFFF1F2C020000000000010026005B71
      72794475706C6963617461732E2264617461706167746F2220234464642F6D6D
      2F79795D00000000FFFF0000000000020000000100000006090068656C766574
      6963610007000000000000000000020000000100020000000000FFFFFF000000
      0002000000000000000000961D000006004D656D6F3333000200130000004F01
      0000550100000E00000043000000F4010000000000000000FFFFFF1F2C020000
      00000001003200544F54414C20464F524E454345444F523A205B717279447570
      6C6963617461732E226E6F6D65666F726E656365646F72225D00000000FFFF00
      00000000020000000100000000090068656C7665746963610007000000000000
      000000010000000100020000000000FFFFFF0000000002000000000000000000
      821E000006004D656D6F33350002006D0100004F0100002B0000000E00000043
      000000F4010000000000000000FFFFFF1F2C0200000000000100000000050005
      00626567696E0D250020206966205B53554D28312C4461646F734D6573747265
      2C31295D203C3E2030207468656E0D2400202020202020204D656D6F3A3D205B
      53554D28312C4461646F734D65737472652C31295D0D0A002020656C73652027
      273B0D0300656E6400FFFF0000000000020000000100000000090068656C7665
      746963610007000000020000000000010000000100020000000000FFFFFF0000
      000002000000000000000000CE1F000005004D656D6F34000200E7010000F800
      0000370000000B00000040000000F4010000000000000000FFFFFF1F2C020000
      000000010000000005000500626567696E0D320020206966205B5B7172794475
      706C6963617461732E2276616C6F724A75726F735061676F73225D203C3E2030
      5D207468656E0D4F00202020202020204D656D6F3A3D205B466F726D6174466C
      6F617428272323232C2323232C2323302E3030272C5B7172794475706C696361
      7461732E2256616C6F724A75726F735061676F73225D295D0D11002020656C73
      65204D656D6F3A3D2027273B0D0300656E6400FFFF0000000000020000000100
      000006090068656C766574696361000700000000000000000001000000010002
      0000000000FFFFFF1F22005B7172794475706C6963617461732E226469666572
      656E63696172225D3D547275650002000000000000000000A520000006004D65
      6D6F3132000200F50100004F010000600000000E00000043000000F401000000
      0000000000FFFFFF1F2C020000000000010054005B466F726D6174466C6F6174
      28272323232C2323232C2323302E3030272C53554D285B7172794475706C6963
      617461732E2276616C6F72446573635265636562225D2C204461646F734D6573
      7472652C3129295D00000000FFFF000000000002000000010000000009006865
      6C7665746963610007000000020000000000010000000100020000000000FFFF
      FF00000000020000000000000000007C21000006004D656D6F3138000200F501
      0000DB010000600000000E00000043000000F4010000000000000000FFFFFF1F
      2C020000000000010054005B466F726D6174466C6F617428272323232C232323
      2C2323302E3030272C53554D285B7172794475706C6963617461732E2276616C
      6F72446573635265636562225D2C204461646F734D65737472652C3129295D00
      000000FFFF0000000000020000000100000000090068656C7665746963610007
      000000020000000000010000000100020000000000FFFFFF0000000002000000
      0000000000000422000006004D656D6F323600020084020000670000002C0000
      001B00000043000F00F4010000000000000000FFFFFF1F2C0200000000000100
      050042414E434F00000000FFFF0000000000020000000100000000090068656C
      76657469636100070000000000000000000A0000000100020000000000FFFFFF
      00000000020000000000000000008C22000006004D656D6F3237000200B00200
      0067000000370000001B00000043000F00F4010000000000000000FFFFFF1F2C
      02000000000001000500434F4E544100000000FFFF0000000000020000000100
      000000090068656C76657469636100070000000000000000000A000000010002
      0000000000FFFFFF00000000020000000000000000003023000006004D656D6F
      333200020084020000F8000000300000000B00000040000000F4010000000000
      000000FFFFFF1F2C020000000000010021005B7172794475706C696361746173
      2E227369676C6162616E636F706167746F225D00000000FFFF00000000000200
      00000100000006090068656C7665746963610007000000000000000000000000
      000100020000000000FFFFFF0000000002000000000000000000332400000600
      4D656D6F3336000200B0020000F8000000350000000B00000040000000F40100
      00000000000000FFFFFF1F2C020000000000020000000D000000050005006265
      67696E0D2B0020206966205B7172794475706C6963617461732E22636F6E7461
      706167746F225D203E2030207468656E200D2A00202020202020204D656D6F3A
      3D205B7172794475706C6963617461732E22636F6E7461706167746F225D0D12
      002020656C7365204D656D6F3A3D2027273B200D0300656E6400FFFF00000000
      00020000000100000006090068656C7665746963610007000000000000000000
      010000000100020000000000FFFFFF0000000002000000000000000000DE2400
      0006004D656D6F3337000200E000000098000000DE0000001400000043000F00
      F4010000000000000000FFFFFF1F2C020000000000010028005B717279447570
      6C6963617461732E224E6F6D65477275706F46696C69616C456D697373616F22
      5D00000000FFFF0000000000020000000100000000090068656C766574696361
      0007000000020000000000080000000100020000000000FFFFFF000000000200
      00000000000000007825000006004D656D6F37310002001C0000009800000098
      0000001400000043000F00F4010000000000000000FFFFFF1F2C020000000000
      01001700475255504F2046494C49414C20444520454D495353C34F00000000FF
      FF0000000000020000000100000000090068656C766574696361000700000000
      0000000000090000000100020000000000FFFFFF000000000200000000000000
      00001F26000006004D656D6F3732000200B90000009800000022000000140000
      0043000F00F4010000000000000000FFFFFF1F2C020000000000010024005B71
      72794475706C6963617461732E22477275706F46696C69616C456D697373616F
      225D00000000FFFF0000000000020000000100000000090068656C7665746963
      610007000000000000000000090000000100020000000000FFFFFF0000000002
      000000000000000000C526000006004D656D6F3338000200E0000000BC000000
      DE0000001400000043000F00F4010000000000000000FFFFFF1F2C0200000000
      00010023005B7172794475706C6963617461732E224E6F6D6546696C69616C45
      6D697373616F225D00000000FFFF000000000002000000010000000009006865
      6C7665746963610007000000020000000000080000000100020000000000FFFF
      FF00000000020000000000000000005927000006004D656D6F33390002004400
      0000BC000000700000001400000043000F00F4010000000000000000FFFFFF1F
      2C0200000000000100110046494C49414C20444520454D495353C34F00000000
      FFFF0000000000020000000100000000090068656C7665746963610007000000
      000000000000090000000100020000000000FFFFFF0000000002000000000000
      000000FB27000006004D656D6F3430000200B9000000BC000000220000001400
      000043000F00F4010000000000000000FFFFFF1F2C02000000000001001F005B
      7172794475706C6963617461732E2246696C69616C456D697373616F225D0000
      0000FFFF0000000000020000000100000000090068656C766574696361000700
      0000000000000000090000000100020000000000FFFFFF000000000200000000
      0000000000AF28000006004D656D6F3431000200130000008B01000055010000
      0E00000043000000F4010000000000000000FFFFFF1F2C020000000000010031
      00544F54414C2046494C49414C3A205B7172794475706C6963617461732E224E
      6F6D6546696C69616C456D697373616F225D00000000FFFF0000000000020000
      000100000000090068656C766574696361000700000000000000000001000000
      0100020000000000FFFFFF00000000020000000000000000009B29000006004D
      656D6F34330002006D0100008B0100002B0000000E00000043000000F4010000
      000000000000FFFFFF1F2C020000000000010000000005000500626567696E0D
      250020206966205B53554D28312C4461646F734D65737472652C31295D203C3E
      2030207468656E0D2400202020202020204D656D6F3A3D205B53554D28312C44
      61646F734D65737472652C31295D0D0A002020656C73652027273B0D0300656E
      6400FFFF0000000000020000000100000000090068656C766574696361000700
      0000020000000000010000000100020000000000FFFFFF000000000200000000
      0000000000722A000006004D656D6F3435000200F50100008B01000060000000
      0E00000043000000F4010000000000000000FFFFFF1F2C020000000000010054
      005B466F726D6174466C6F617428272323232C2323232C2323302E3030272C53
      554D285B7172794475706C6963617461732E2276616C6F724465736352656365
      62225D2C204461646F734D65737472652C3129295D00000000FFFF0000000000
      020000000100000000090068656C766574696361000700000002000000000001
      0000000100020000000000FFFFFF0000000002000000000000000000342B0000
      06004D656D6F343600020013000000AF010000550100000E00000043000000F4
      010000000000000000FFFFFF1F2C02000000000001003F00544F54414C204752
      55504F2044452046494C49414C3A205B7172794475706C6963617461732E224E
      6F6D65477275706F46696C69616C456D697373616F225D00000000FFFF000000
      0000020000000100000000090068656C76657469636100070000000000000000
      00010000000100020000000000FFFFFF0000000002000000000000000000202C
      000006004D656D6F34380002006D010000AF0100002B0000000E000000430000
      00F4010000000000000000FFFFFF1F2C02000000000001000000000500050062
      6567696E0D250020206966205B53554D28312C4461646F734D65737472652C31
      295D203C3E2030207468656E0D2400202020202020204D656D6F3A3D205B5355
      4D28312C4461646F734D65737472652C31295D0D0A002020656C73652027273B
      0D0300656E6400FFFF0000000000020000000100000000090068656C76657469
      63610007000000020000000000010000000100020000000000FFFFFF00000000
      02000000000000000000F72C000006004D656D6F3530000200F5010000AF0100
      00600000000E00000043000000F4010000000000000000FFFFFF1F2C02000000
      0000010054005B466F726D6174466C6F617428272323232C2323232C2323302E
      3030272C53554D285B7172794475706C6963617461732E2276616C6F72446573
      635265636562225D2C204461646F734D65737472652C3129295D00000000FFFF
      0000000000020000000100000000090068656C76657469636100070000000200
      00000000010000000100020000000000FFFFFF00000000020000000000000000
      00C02D000006004D656D6F3531000200140000002C010000540100000E000000
      43000000F4010000000000000000FFFFFF1F2C02000000000001004600544F54
      414C204449413A205B464F524D41544441544554494D45282764642F6D6D2F79
      797979272C205B7172794475706C6963617461732E2264617461706167746F22
      5D295D00000000FFFF0000000000020000000100000000090068656C76657469
      63610007000000000000000000010000000100020000000000FFFFFF00000000
      02000000000000000000AC2E000006004D656D6F35330002006D0100002C0100
      002B0000000E00000043000000F4010000000000000000FFFFFF1F2C02000000
      0000010000000005000500626567696E0D250020206966205B53554D28312C44
      61646F734D65737472652C31295D203C3E2030207468656E0D24002020202020
      20204D656D6F3A3D205B53554D28312C4461646F734D65737472652C31295D0D
      0A002020656C73652027273B0D0300656E6400FFFF0000000000020000000100
      000000090068656C766574696361000700000002000000000001000000010002
      0000000000FFFFFF0000000002000000000000000000832F000006004D656D6F
      3535000200F50100002C010000600000000E00000043000000F4010000000000
      000000FFFFFF1F2C020000000000010054005B466F726D6174466C6F61742827
      2323232C2323232C2323302E3030272C53554D285B7172794475706C69636174
      61732E2276616C6F72446573635265636562225D2C204461646F734D65737472
      652C3129295D00000000FFFF0000000000020000000100000000090068656C76
      65746963610007000000020000000000010000000100020000000000FFFFFF00
      000000020000000000000000001030000006004D656D6F35360002005F030000
      670000009F0000001B00000043000F00F4010000000000000000FFFFFF1F2C02
      000000000001000A004F425345525641C7C34F00000000FFFF00000000000200
      00000100000000090068656C76657469636100070000000000000000000A0000
      000100020000000000FFFFFF0000000002000000000000000000AF3000000600
      4D656D6F35370002005F030000F80000009E0000000B00000043000000F40100
      00000000000000FFFFFF1F2C02000000000001001C005B7172794475706C6963
      617461732E226F62736572766163616F225D00000000FFFF0000000000020000
      000100000006090068656C766574696361000700000000000000000000000000
      0100020000000000FFFFFF0000000002000000000000000100D6480000090066
      70764C6F676F5F500002001B0000002E000000780000002A00000007000000F4
      010000000000000000FFFFFF1F2C020000000000000000000000FFFF00000000
      000200000001000000060100D6480000424DCE17000000000000360400002800
      00008300000026000000010008000000000098130000120B0000120B00000001
      00000001000000000000E8E5A800AA9E000099990000ADADAD003A3C4100A397
      0000BFB73700D8D48600FBFAF000A5A5A5001E1D1C00D8D9DA0054575A00D6D6
      D500E7E8F20012161B00B6AD1900CBC55B008C8D9200BEC0C500E1E2E4008587
      8A005E606300494C4F00090D12002C2E3300DEDB98007D7F8100EFEDCB00B9BA
      BB00AEA400007C7B7B00C5BE440066666600D1CC6F00CDC9810048484600F7F6
      E600AFA5080004080D00F9F8ED00B8AF2700DBD68C00999999001B1A1900C6BF
      5100131312003B3A3A00FFFFFF00EAE8BE00CCCCCC0023262A00E2DEA400F1EF
      D600B0B1B300D3CD7500B1A81000CCCC66007272720053525200434242000106
      0A00ECE9C3008C8C8B00F5F4DF004A4A4A0057575600B6AC1F00282B3000C7C0
      5C0061615F00F7F7F70088888700DDD89300E3E0A600FDFCF70021242900070A
      1000BDB53100C5BE4A00E3E3E200A69C000099999900BABAB900DEDEDE005254
      58002A292800D9D58A005F5E5D00C7C595001B1E2300E8E5B60000000700B5AB
      1300D5D07B00C6C6C500B2A80B0021202000B9B12400504F4E00666666006B6D
      7000B5B5BD0084848400E0DC9E00BCB42C00F7EFD6005B5B5A00EFEFEF008789
      8B00DEDEE6003E3D3C0014181E00C8C25300CCC55F00A8A9AC00BDBDBC00E5E1
      AC0075767900181B2000E6E6E6000E1117000810190033333300929191002D2C
      2B00B5B5B4000000000000000000000000000000000000000000000000000000
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
      0000000000003131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131543D42470E31313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131523131313131486D3131316D6D4C3131316D6D31313131
      3131313131316D4831313131313131316D6D3131316D040A6C6C313131313131
      486D6D4C3131313131316D6D4C313131313131313131313131486D6D6D313131
      313131486D6D48313131316D483131316D6D3131313131313131313131316D6D
      6D3131486D6D6D31313131313152313131317F7E6631554225256031603D4264
      7931420C313B7D316D6C3D70403131662C316D593D7068313133646C70253148
      4255312C70643059313131310C2525420E31477431420E482579313131544243
      3D474C4C640E3120423C300A3131207E2C317F70254748484251512531603C31
      6D59253C620A312C25433068313131313152313131316C203131595931313131
      7C7D4C4C31487C0E3159683177424C51347531434031203D487957543130494C
      7F3D31487C0C310B37317F70313131313C6631313131642C317C33487E513131
      31313179602F55317C3331316D793B7031487E14314857043131316D7C55557E
      311E3031542D4C314340313148790A0B4C313131315231313131477D31312530
      6C64334C5779313131487C0E31224931422C31314340316C7D313C7D31315949
      31570C31543D31487C0C3168705930253131313170706C3C0E313C0A31303331
      7C513131310C702570474C4C3033312C7C64300A3148300E3179624343224848
      3051517C31603D316D6464590B2C31547C42301C313131313152313131314749
      313166420C5548313D2C484831487C0E48302C311C4248516275316C7D31493D
      4879627F31256848373031487C0E3131550E207031313131473C0C554831642C
      4C7E330C62793131316830796D3131487C3331577D6D6D313148303331487C49
      555131487C0C0C7E4C2C703131480C0E7C2C313C476D6D313131313131523131
      31040B7E20316D473C6C33310E3D3C6C7931254264646D31486C42706831316C
      7D31484742702031310E3D433D6C31484355314043473D0A31313131796C3C6C
      0E316670597E3C3D20313131310E256C6C7731316C0E312C3D47430431772F3D
      0A3133424366484825643C7E6C7C74316D225943425531543D59437D31313131
      31523131316D643B6D3131316D514831313179514C316D51793131313131796D
      3131313C40313131796D313131313179794831317F6D316D1515483131313131
      3131795148314879516D796D3131313131313151517931317F6D31316D51516D
      3151577F6D313131797931316D51516D5148313131515151313131314851516D
      3131313131523131313140043131313131313131313131313131313131313131
      313131313131316804313131313131313131313131313148660F313131313131
      31313131313131313131313131313131313131313131313131313131220E3131
      3131313131316655313131313131313131313131313131313131313131313131
      3131313131313131315231313131313131313131313131313131313131313131
      313131313131313131313131313131313131313131313131313131315C461212
      12463F3131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313152313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      5F06020202061B31313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131523131313131310E40173C18183D6E
      3131313131310C2C666C3C181818181805683131313131316D3768220D051631
      3131313108021F1F1F5235313131313172070707070707070707070707070750
      732B3631313131313131313131362B73212112081D3131313131313131312350
      5050504B3131313131313131313F08122E505050085231313131312C103E1919
      19195D17313131317966713E4E191919191919195D0D31313131312C34282819
      190017313131313108021F1F1F52353131313131115202020202020202020202
      0202020202022776313131313131313F501F02020202020202075C3131313131
      31316A060202065F313131313131314C12020202020202022152313131317528
      7A78787878784E223131310E1A3E10787871717171717171281731313131773E
      7A717171712822313131313108021F1F1F5235313131313144021F1F1F1F1F1F
      1F1F1F1F1F1F1F1F1F1F1F1F1D31313131310802021F1F1F1F1F1F1F1F020223
      31313131313107021F1F0208313131313131313A521F1F1F1F1F1F1F50523131
      31310D4E7878787A7A71282231316D7C4E7878784E4E7A717171717128173131
      312C3E7171717119195D22313131313108021F1F1F5269314C4C4C4C631F1F1F
      1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F52503131313138521F1F1F020202020202
      1F1F1F5212313131313107021F1F0208313131313131361F1F1F1F1F02020202
      21523131316D457A78787A3D370E0E5131313B3E7878787A2274140E0E0E0E0E
      0E15313115787A787871190D0A145A2A6A6A6A2A5F3636363636504411111111
      3226262626262626262626262626264A1F1F1F1F612631311B521F1F1F02443A
      08082363021F1F1F525F3131313107021F1F02083131313131311B021F1F1F1F
      6A2B353532523131310E71717171710C313131313115781078784E6831313131
      31313131313131311C287878787A2C3131310106020202025F31313131315052
      020202023631313131313131313131313131313144021F1F1F32312639021F1F
      1F584C31313131311B27021F1F1F3631313107021F1F02083131313131312302
      1F1F1F11093131313152313131337A717171454831313131312C28787810344C
      313131313131313131313131057A78784E663131313135021F1F1F025F313131
      313150021F1F1F1F3631313131313131313131313131314C5E021F1F0276315F
      521F1F1F4B313131313131313132271F1F527331313107021F1F020831313131
      313112021F1F0272313131313152313131601978787A7C4C3131313131662878
      781045166E6E6E6E6E6E6E6E1C0431555B1078717A603131313135021F1F1F02
      5F313131313150021F1F1F1F36313131313131314C0909090909363A021F1F1F
      1F3F314F021F02723131313131313131313123021F1F1109313107021F1F0208
      3131313131312E021F1F0273313131313152313131601978787A054C31313131
      31561978787871282828282828282828005631337A717171346D313131313552
      020202025F31313131312106020202023631313131762E635E61616161611F1F
      1F1F1F1F114C26611F1F0276313131313131313131311D1F1F1F1F1D31310702
      1F1F02083131313131312E021F1F023A313131313152313131601978787A054C
      31313131311819787878787878787878787878784E1731141978787A45483131
      3131764444444444241551515151464F4F4F4F4F413131313A0202021F1F1F1F
      1F1F1F1F1F1F1F521B311D1F1F1F1F363131313131313131313126391F1F1F5C
      313107021F1F02083131313131312E021F1F023A313131313152313131601978
      787A054C31313131315619787878787878787878787878784E1731337A717171
      346D313131313109090909097D713434347A37313131313131313158521F1F1F
      1F1F0202020202020202275831311D1F1F1F1F1D313131313131313131312639
      1F1F1F5C313107021F1F02083131313131312E021F1F023A3131313131523131
      31601978787A054C3131313131224E787878784E28282828282828280056310C
      787171715B0C31313131313131313131133E1010105D74313131313131312939
      021F1F1F1F3911636363636A50083631313126611F1F024B3131313131313131
      31313F021F1F1F36313107021F1F02083131313131312E021F1F023A31313131
      3152313131601978787A054C313131313116287878101A2C2C2C2C2C2C2C2C2C
      7D1E316D1A7A7878197F31313131313131313131134E78787828743131313131
      313176021F1F1F1F23263131313131313131313131313107021F022131313131
      31313131313173021F1F444C313107021F1F02083131313131312E021F1F023A
      313131313152313131601978787A054C31313131317F19717171344831313131
      3131313131313131561978784E6631313131313131313131134E787878287431
      3131313131312B521F1F1F6129313131313131313131313131313158521F1F02
      4A31313131313131317602021F522331313107021F1F02083131313131312E02
      1F1F023A313131313152313131331978787A053131313131316D347A78784E13
      3131313131313131313131317D28787871710431313131313131313113001919
      190004313131313131312B521F1F1F2741313131313131313131313131313109
      11021F1F1F232631313131295F1F1F1F1F612931313107021F1F022B31313131
      31312E021F1F52233131313131520E14602C7A78787A7C141414140C3131203E
      78787171660A1E6014141414140E3131155B107878107A567D371E1E1E1E1E1E
      13566C6C6C182C75757575756D315C021F1F1F1F211B1B1B1B1B1B4A4A4A4A4A
      3631313176021F1F1F0261502323725E021F1F1F0258762B2B4A44021F1F1F50
      4A4A4A2B1D312E021F1F1F074A4A4A4A5C520D7A7A7A78787878787A7A7A5D17
      31317945197878784E4E7A7A7A7A7A7A5D6C313131165D717171711919191919
      1919195D6E313131313166007A7A7A4E1431295E021F1F1F0202020202020202
      020202062B313131315802021F1F1F020202021F1F1F1F52384C395252521F1F
      1F1F1F020202020608312E021F1F1F1F02020202215217717178787878787871
      71714E22313131335B28717878787871717171714E1731313131173E7A717878
      787878787878784E6E313131313166287171717A6031314A521F1F1F1F1F1F1F
      1F1F1F1F1F1F1F524A31313131316939521F1F1F1F1F1F1F1F02025831091102
      1F1F1F1F1F1F1F1F1F1F1F022B312E021F1F1F1F1F1F1F1F50520D1919197878
      7878781919190017313131310C0D10284E4E191919191919000D31313131317D
      1A4E4E4E19191919191919001C3131313131662878787810603131315F020202
      0202020202020202020202062B31313131313136733902020202020261721D31
      3129615252521F1F1F1F1F020202020608312E021F1F1F1F0202020221527D17
      173C107878714D1717170D2C3131313131310E0A1C3B2217171717170D7D3131
      3131313148757D77661717171717170D04313131313166287878781060313131
      31364A3A7272727272727272727272505C3131313131313131264B5F73733835
      4131313131093A7272725E1F1F1F1F4F1212122E5C312E021F1F1F6312121212
      58523131310E1978787A05313131313131313131313131313131313131313131
      313131313131313131313131313131313131313131313131313117003E3E3E5D
      7531313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313107021F1F52583131313131312E021F1F0223
      313131313152313131601978787A054C31313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131317F68
      6E6E6E6E15313131313131313131313131313131313131313131313131313131
      31313131313131313131313131313131313121021F1F02073131313131312E02
      1F1F023A313131313152313131601978787A054C313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313173021F1F1F1F4F3A233A
      32312E021F1F023A313131313152313131601978787A054C3131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131313131313131313131313169521F1F1F1F
      0202020608312E021F1F023A313131313152313131601978787A054C31313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131310963
      521F1F1F1F1F1F024A312E021F1F023A313131313152313131601971717A054C
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131314150611F1F1F1F1F024A3150021F1F023A3131313131523131310C0D17
      176C774C31313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131315C3872727272725C31082E2E2E2E1B3131313131520000
      664900000B006D6D6F544954554C4F5F50000200790100002E0000003B020000
      1500000043000000F4010000000000000000FFFFFF1F2C020000000000010008
      005B544954554C4F5D00000000FFFF0000000000020000000100000006090068
      656C766574696361000B000000020000000000020000000100020000000000FF
      FFFF0000000002000000000000000000F74900000F006D6D6F524F54554C4F44
      4154415F50000200B60300002E0000001C0000000C00000043000000F4010000
      000000000000FFFFFF1F2C02000000000001000500446174613A00000000FFFF
      0000000000020000000100000006090068656C76657469636100060000000000
      00000000000000000100020000000000FFFFFF00000000020000000000000000
      008E4A000009006D6D6F444154415F50000200D20300002E0000002C0000000C
      00000043000000F4010000000000000000FFFFFF1F2C02000000000001001100
      5B4441544520234464642F6D6D2F79795D00000000FFFF000000000002000000
      0100000006090068656C76657469636100060000000000000000000100000001
      00020000000000FFFFFF0000000002000000000000000000234B000011006D6D
      6F524F54554C4F504147494E415F50000200B60300003B000000280000000C00
      000043000000F4010000000000000000FFFFFF1F2C0200000000000100070050
      E167696E613A00000000FFFF0000000000020000000100000000090068656C76
      65746963610006000000000000000000000000000100020000000000FFFFFF00
      00000002000000000000000000B24B00000B006D6D6F504147494E415F500002
      00DE0300003B000000200000000C00000043000000F4010000000000000000FF
      FFFF1F2C020000000000010007005B50414745235D00000000FFFF0000000000
      020000000100000000090068656C766574696361000600000000000000000001
      0000000100020000000000FFFFFF0000000002000000000000000000584C0000
      13006D6D6F464F4E4546494C49414C424153455F50000200980000004F000000
      CE0000000A00000047000000F4010000000000000000FFFFFF1F2C0200000000
      0001001600464F4E453A205B464F4E4546494C49414C424153455D00000000FF
      FF0000000000020000000100000000090068656C766574696361000600000000
      0000000000000000000100020000000000FFFFFF000000000200000000000000
      00000D4D000014006D6D6F454E44455245434F5F42414952524F5F5000020098
      00000039000000CF0000000A00000043000000F4010000000000000000FFFFFF
      1F2C020000000000010024005B52554146494C49414C424153455D202D205B42
      414952524F46494C49414C424153455D00000000FFFF00000000000200000001
      00000000090068656C7665746963610006000000000000000000000000000100
      020000000000FFFFFF0000000002000000000000000000DA4D000012006D6D6F
      4345505F4349444144455F55465F500002009800000044000000CF0000000A00
      000043000000F4010000000000000000FFFFFF1F2C02000000000001003E0043
      45503A205B43455046494C49414C424153455D202D205B43494441444546494C
      49414C424153455D202D205B45535441444F46494C49414C424153455D000000
      00FFFF0000000000020000000100000000090068656C76657469636100060000
      00000000000000000000000100020000000000FFFFFF00000000020000000000
      000000007C4E000014006D6D6F52415A414F46494C49414C424153455F500002
      00980000002E000000CF0000000A00000043000000F4010000000000000000FF
      FFFF1F2C020000000000010011005B52415A414F46494C49414C424153455D00
      000000FFFF0000000000020000000100000006090068656C7665746963610006
      000000000000000000000000000100020000000000FFFFFF0000000002000000
      0000000000000A4F00000900666D764F75747261730002007801000044000000
      3B0200002000000043000000F4010000000000000000FFFFFF1F2C0200000000
      00010008005B4F75747261735D00000000FFFF00000000000200000001000000
      00090068656C7665746963610007000000000000000000020000000100020000
      000000FFFFFF0000000002000000000000000000914F000005004D656D6F3300
      0200E4010000670000003A0000001B00000043000F00F4010000000000000000
      FFFFFF1F2C020000000000010005004A55524F5300000000FFFF000000000002
      0000000100000000090068656C76657469636100070000000000000000000A00
      00000100020000000000FFFFFF00000000020000000000000000006850000006
      004D656D6F3131000200BE0100004F010000600000000E00000043000000F401
      0000000000000000FFFFFF1F2C020000000000010054005B466F726D6174466C
      6F617428272323232C2323232C2323302E3030272C53554D285B717279447570
      6C6963617461732E2276616C6F724A75726F735061676F73225D2C4461646F73
      4D65737472652C3129295D00000000FFFF000000000002000000010000000009
      0068656C76657469636100070000000200000000000100000001000200000000
      00FFFFFF00000000020000000000000000003F51000006004D656D6F31340002
      00BE010000DB010000600000000E00000043000000F4010000000000000000FF
      FFFF1F2C020000000000010054005B466F726D6174466C6F617428272323232C
      2323232C2323302E3030272C53554D285B7172794475706C6963617461732E22
      76616C6F724A75726F735061676F73225D2C4461646F734D65737472652C3129
      295D00000000FFFF0000000000020000000100000000090068656C7665746963
      610007000000020000000000010000000100020000000000FFFFFF0000000002
      0000000000000000001652000006004D656D6F3434000200BE0100008B010000
      600000000E00000043000000F4010000000000000000FFFFFF1F2C0200000000
      00010054005B466F726D6174466C6F617428272323232C2323232C2323302E30
      30272C53554D285B7172794475706C6963617461732E2276616C6F724A75726F
      735061676F73225D2C4461646F734D65737472652C3129295D00000000FFFF00
      00000000020000000100000000090068656C7665746963610007000000020000
      000000010000000100020000000000FFFFFF0000000002000000000000000000
      ED52000006004D656D6F3439000200BE010000AF010000600000000E00000043
      000000F4010000000000000000FFFFFF1F2C020000000000010054005B466F72
      6D6174466C6F617428272323232C2323232C2323302E3030272C53554D285B71
      72794475706C6963617461732E2276616C6F724A75726F735061676F73225D2C
      4461646F734D65737472652C3129295D00000000FFFF00000000000200000001
      00000000090068656C7665746963610007000000020000000000010000000100
      020000000000FFFFFF0000000002000000000000000000C453000006004D656D
      6F3534000200BE0100002C010000600000000E00000043000000F40100000000
      00000000FFFFFF1F2C020000000000010054005B466F726D6174466C6F617428
      272323232C2323232C2323302E3030272C53554D285B7172794475706C696361
      7461732E2276616C6F724A75726F735061676F73225D2C4461646F734D657374
      72652C3129295D00000000FFFF0000000000020000000100000000090068656C
      7665746963610007000000020000000000010000000100020000000000FFFFFF
      0000000002000000000000000000615400000F006D6D6F524F44415045484F52
      415F500002001F00000040020000580000000A00000043000000F40100000000
      00000000FFFFFF1F2C020000000000010011005B54494D4520235468683A6D6D
      3A73735D00000000FFFF0000000000020000000100000006090068656C766574
      6963610007000000000000000000100000000100020000000000FFFFFF000000
      00020000000000000000000A5500000C006D6D6F544543534F46545F50000200
      1F03000040020000DC0000000A00000043000000F4010000000000000000FFFF
      FF1F2C02000000000001002000746563534F4654202D205465636E6F6C6F6769
      6120656D2053697374656D617300000000FFFF00000000000200000001000000
      06090068656C7665746963610007000000000000000000110000000100020000
      000000FFFFFF00000000020000000000000000009055000006004D656D6F3136
      0002006E02000067000000160000001B00000043000F00F40100000000000000
      00FFFFFF1F2C0200000000000100030041445400000000FFFF00000000000200
      00000100000000090068656C76657469636100070000000000000000000A0000
      000100020000000000FFFFFF0000000002000000000000000000165600000600
      4D656D6F32340002005502000067000000190000001B00000043000F00F40100
      00000000000000FFFFFF1F2C0200000000000100030044444100000000FFFF00
      00000000020000000100000000090068656C7665746963610007000000000000
      0000000A0000000100020000000000FFFFFF0000000002000000000000000000
      C256000006004D656D6F353800020055020000F8000000160000000B00000040
      000000F4010000000000000000FFFFFF1F2C000000000000010029005B494628
      5B7172794475706C6963617461732E22646461225D3D547275652C202758272C
      202727295D00000000FFFF0000000000020000000100000006090068656C7665
      746963610007000000000000000000010000000100020000000000FFFFFF0000
      0000020000000000000000007757000006004D656D6F35390002006E020000F8
      000000130000000B00000040000000F4010000000000000000FFFFFF1F2C0000
      00000000010032005B4946285B7172794475706C6963617461732E2261646961
      6E74616D656E746F225D3D547275652C202758272C202727295D00000000FFFF
      0000000000020000000100000006090068656C76657469636100070000000000
      00000000010000000100020000000000FFFFFF00000000020000000000000000
      001158000006004D656D6F3630000200E702000067000000780000001B000000
      43000F00F4010000000000000000FFFFFF1F2C02000000000001001700455645
      4E544F202F204C414E43544F202F20504147544F00000000FFFF000000000002
      0000000100000000090068656C76657469636100070000000000000000000A00
      00000100020000000000FFFFFF00000000020000000000000000004059000006
      004D656D6F3631000200E7020000F80000007C0000000B00000043000000F401
      0000000000000000FFFFFF1F2C02000000000003002E005B436F7079285B7172
      794475706C6963617461732E226576656E746F64657363726963616F225D2C31
      2C3236295D0D3C005B274C414E43544F3A20275D5B436F7079285B7172794475
      706C6963617461732E225573756172696F4C616E63616D656E746F225D2C312C
      3136295D0D3C005B27504147544F20203A20275D5B436F7079285B7172794475
      706C6963617461732E225573756172696F506167616D656E746F225D2C312C31
      36295D00000000FFFF0000000000020000000100000006090068656C76657469
      63610006000000000000000000000000000100020000000000FFFFFF00000000
      02000000000000000000CC59000005004D656D6F370002001501000067000000
      850000001B00000043000F00F4010000000000000000FFFFFF1F2C0200000000
      0001000A00464F524E454345444F5200000000FFFF0000000000020000000100
      000000090068656C76657469636100070000000000000000000A000000010002
      0000000000FFFFFF000000000200000000000000FEFEFF0D0000000400205661
      7200000000030052756100000000060042616972726F000000000400466F6E65
      000000000600546974756C6F00160027504147414D454E544F53204546455455
      41444F53270006004F7574726173000000000600436964616465000000000C00
      204167727570616D656E746F00000000120041677275706172477275706F4669
      6C69616C00050046616C7365000D004167727570617246696C69616C00050046
      616C736500110041677275706172466F726E656365646F7200050046616C7365
      000700204F7574726F730000000005004C696E68610001003000000000000000
      0000FC000000000000000000000000000000005800E00C74D16F88E340C9E6F9
      1D0D39E640}
  end
  object frpResumoPagamentosEfetuados: TfrReport
    Dataset = fdsDuplicatasPagar
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnBeforePrint = frpResumoPagamentosEfetuadosBeforePrint
    Left = 656
    Top = 395
    ReportForm = {
      190000002459000019FFFF00000A0050444643726561746F7200FFFFFFFFFF00
      000000340800009A0B0000000000000B0000002F000000070000000100040000
      0000FFFF000000000000000000000000030400466F726D00FEFFFFFFDC000000
      780000007C0100002C010000042E000500626567696E0D1D004461646F734D65
      737472652E76697369626C65203A3D2066616C73653B0D1C006966205B416772
      75706172477275706F46696C69616C5D207468656E0D0500626567696E0D2400
      204361626563616C686F477275706F46696C69616C2E76697369626C653A3D74
      7275653B0D210020526F64617065477275706F46696C69616C2E76697369626C
      653A3D747275653B0D0300656E640D0400656C73650D0500626567696E0D2500
      204361626563616C686F477275706F46696C69616C2E76697369626C653A3D66
      616C73653B0D220020526F64617065477275706F46696C69616C2E7669736962
      6C653A3D66616C73653B0D0400656E643B0D00000D17006966205B4167727570
      617246696C69616C5D207468656E0D0500626567696E0D1F0020436162656361
      6C686F46696C69616C2E76697369626C653A3D747275653B0D1C0020526F6461
      706546696C69616C2E76697369626C653A3D747275653B0D0300656E640D0400
      656C73650D0500626567696E0D2000204361626563616C686F46696C69616C2E
      76697369626C653A3D66616C73653B0D1D0020526F6461706546696C69616C2E
      76697369626C653A3D66616C73653B0D0400656E643B0D00000D1B006966205B
      41677275706172466F726E656365646F725D207468656E0D0500626567696E0D
      2300204361626563616C686F466F726E656365646F722E76697369626C653A3D
      747275653B0D200020526F64617065466F726E656365646F722E76697369626C
      653A3D747275653B0D0300656E640D0400656C73650D0500626567696E0D2400
      204361626563616C686F466F726E656365646F722E76697369626C653A3D6661
      6C73653B0D210020526F64617065466F726E656365646F722E76697369626C65
      3A3D66616C73653B0D0500656E643B200D00000D15006966205B416772757061
      72446174615D207468656E0D0500626567696E0D24002020204361626563616C
      686F44617461506167746F2E76697369626C653A3D747275653B0D2100202020
      526F6461706544617461506167746F2E76697369626C653A3D747275653B0D03
      00656E640D0400656C73650D0500626567696E0D25002020204361626563616C
      686F44617461506167746F2E76697369626C653A3D66616C73653B0D22002020
      20526F6461706544617461506167746F2E76697369626C653A3D66616C73653B
      0D0500656E643B200D0300656E64000200860400000B004461646F734D657374
      726500020100000000F80000002F0400000B0000003100050001000000000000
      000000FFFFFF1F0000000012006664734475706C696361746173506167617200
      00000003000500626567696E0D1200204C494E4841203A3D205B4C494E45235D
      200D0300656E6400FFFF000000000002000000010000000000000001000000C8
      00000014000000010000000000000200F30400000D00526F646170E94D657374
      72653100020100000000D70100002F0400001500000030000600010000000000
      00000000FFFFFF1F00000000000000000000000000FFFF000000000002000000
      010000000000000001000000C800000014000000010000000000000200630500
      001000526F64617065466F726E656365646F72000201000000004C0100002F04
      0000210000003000110001000000000000000000FFFFFF1F0000000000000000
      0000000000FFFF000000000002000000010000000000000001000000C8000000
      140000000100000000000002009306000014004361626563616C686F47727570
      6F46696C69616C00020100000000940000002F0400001C000000300010000100
      0000000000000000FFFFFF1F0000000048005B6966285B416772757061724772
      75706F66696C69616C5D3D547275652C205B7172794475706C6963617461732E
      22477275706F46696C69616C456D697373616F225D2C2727295D000000000600
      0500626567696E0D180020204746546F74616C56616C6F7256656E63746F3A3D
      303B0D120020204746546F74616C4A75726F733A3D303B0D190020204746546F
      74616C56616C6F72506167746F3A3D303B20200D180020204746546F74616C52
      6567697374726F733A3D303B20200D0300656E6400FFFF000000000002000000
      010000000000000001000000C800000014000000010000000000000200B40700
      000F004361626563616C686F46696C69616C00020100000000B80000002F0400
      001C0000003000100001000000000000000000FFFFFF1F000000003E005B6966
      285B4167727570617246696C69616C5D3D547275652C205B7172794475706C69
      63617461732E2246696C69616C456D697373616F225D2C2727295D0000000006
      000500626567696E0D180020204746546F74616C56616C6F7256656E63746F3A
      3D303B0D120020204746546F74616C4A75726F733A3D303B0D19002020474654
      6F74616C56616C6F72506167746F3A3D303B20200D180020204746546F74616C
      526567697374726F733A3D303B20200D0300656E6400FFFF0000000000020000
      00010000000000000001000000C8000000140000000100000000000002006A08
      000013004361626563616C686F466F726E656365646F7200020100000000DE00
      00002F040000000000003000100001000000000000000000FFFFFF1F00000000
      43005B6966285B41677275706172466F726E656365646F725D3D547275652C20
      5B7172794475706C6963617461732E224E6F6D65466F726E656365646F72225D
      2C2727295D00000000000000FFFF000000000002000000010000000000000001
      000000C800000014000000010000000000000200D60800000C00526F64617065
      46696C69616C00020100000000880100002F0400001400000030001100010000
      00000000000000FFFFFF1F00000000000000000000000000FFFF000000000002
      000000010000000000000001000000C800000014000000010000000000000200
      470900001100526F64617065477275706F46696C69616C00020100000000AC01
      00002F040000140000003000110001000000000000000000FFFFFF1F00000000
      000000000000000000FFFF000000000002000000010000000000000001000000
      C800000014000000010000000000000200B60900000F00526F64617065446174
      61506167746F00020100000000240100002F0400001900000030001100010000
      00000000000000FFFFFF1F00000000000000000000000000FFFF000000000002
      000000010000000000000001000000C800000014000000010000000000000200
      600A0000120043616265E7616C686F446520477275706F3100020100000000EE
      0000002F040000000000003000100001000000000000000000FFFFFF1F000000
      0038005B6966285B41677275706172446174615D3D547275652C205B71727944
      75706C6963617461732E2264617461706167746F225D2C2727295D0000000000
      0000FFFF000000000002000000010000000000000001000000C8000000140000
      00010000000000000200C90A000009004361626563616C686F00020100000000
      2E0000002F040000490000003000020001000000000000000000FFFFFF1F0000
      0000000000000000000000FFFF00000000000200000001000000000000000100
      0000C800000014000000010000000000000200320B00000900666276526F6461
      706500020100000000DC0200002F0400000D0000003000030001000000000000
      000000FFFFFF1F00000000000000000000000000FFFF00000000000200000001
      0000000000000001000000C800000014000000010000000000000000C40B0000
      0A006D6D6F5A65627261646F0002001C000000F9000000E10300000B00000041
      00000001000000FFFFFF1F0000FFFFFF1F2C0200000000000000000200050062
      6567696E0D0300656E6400FFFF0000000000020000000100000000090068656C
      766574696361000A000000000000000000000000000100020000000000FFFFFF
      1F00000002000000000000000000640C000005004D656D6F390002001D000000
      F80000002D0000000B00000040000000F4010000000000000000FFFFFF1F2C02
      000000000001001E005B7172794475706C6963617461732E22646F63756D656E
      746F706167225D00000000FFFF0000000000020000000100000006090068656C
      7665746963610007000000000000000000110000000100020000000000FFFFFF
      0000000002000000000000000000FF0C000006004D656D6F31300002004E0000
      00F7000000150000000B00000043000000F4010000000000000000FFFFFF1F2C
      020000000000010018005B7172794475706C6963617461732E226E756D65726F
      225D00000000FFFF0000000000020000000100000006090068656C7665746963
      610007000000000000000000110000000100020000000000FFFFFF0000000002
      000000000000000000860D000005004D656D6F310002001A0000006700000030
      0000000B00000043000F00F4010000000000000000FFFFFF1F2C020000000000
      01000500444F43544F00000000FFFF0000000000020000000100000000090068
      656C7665746963610007000000000000000000020000000100020000000000FF
      FFFF00000000020000000000000000000A0E000005004D656D6F320002004A00
      000067000000180000000B00000043000F00F4010000000000000000FFFFFF1F
      2C020000000000010002004E5000000000FFFF00000000000200000001000000
      00090068656C7665746963610007000000000000000000020000000100020000
      000000FFFFFF0000000002000000000000000000970E000005004D656D6F3600
      0200F8010000670000005B0000000B00000043000F00F4010000000000000000
      FFFFFF1F2C02000000000001000B0056414C4F5220504147544F00000000FFFF
      0000000000020000000100000000090068656C76657469636100070000000000
      00000000020000000100020000000000FFFFFF00000000020000000000000000
      00230F000005004D656D6F370002003F01000067000000B90000000B00000043
      000F00F4010000000000000000FFFFFF1F2C02000000000001000A00464F524E
      454345444F5200000000FFFF0000000000020000000100000000090068656C76
      65746963610007000000000000000000020000000100020000000000FFFFFF00
      00000002000000000000000000C50F000006004D656D6F3133000200B5000000
      F70000001E0000000B00000040000000F4010000000000000000FFFFFF1F2C02
      000000000001001F005B7172794475706C6963617461732E2266696C69616C65
      6D697373616F225D00000000FFFF000000000002000000010000000609006865
      6C7665746963610007000000000000000000110000000100020000000000FFFF
      FF00000000020000000000000000008210000006004D656D6F3139000200F301
      0000F8000000600000000B00000040000000F4010000000000000000FFFFFF1F
      2C02000000000001003A005B466F726D6174466C6F617428272323232C232323
      2C2323302E3030272C7172794475706C6963617461732E2276616C6F72706167
      746F22295D00000000FFFF0000000000020000000100000006090068656C7665
      746963610007000000000000000000110000000100020000000000FFFFFF0000
      0000020000000000000000002511000006004D656D6F32300002003F010000F8
      000000B80000000B00000040000000F4010000000000000000FFFFFF1F2C0200
      00000000010020005B7172794475706C6963617461732E226E6F6D65666F726E
      656365646F72225D00000000FFFF000000000002000000010000000609006865
      6C7665746963610007000000000000000000100000000100020000000000FFFF
      FF0000000002000000000000000000AD11000006004D656D6F31360002009000
      000067000000210000000B00000043000F00F4010000000000000000FFFFFF1F
      2C0200000000000100050053C952494500000000FFFF00000000000200000001
      00000000090068656C7665746963610007000000000000000000020000000100
      020000000000FFFFFF00000000020000000000000000003412000006004D656D
      6F323200020062000000670000002E0000000B00000043000F00F40100000000
      00000000FFFFFF1F2C020000000000010004004E4F544100000000FFFF000000
      0000020000000100000000090068656C76657469636100070000000000000000
      00020000000100020000000000FFFFFF00000000020000000000000000002A13
      000006004D656D6F323300020061000000F80000002C0000000B000000400000
      00F4010000000000000000FFFFFF1F2C02000000000001000000000500050062
      6567696E0D260020206966205B7172794475706C6963617461732E226E6F7461
      225D203C3E2030207468656E200D2500202020202020204D656D6F3A3D205B71
      72794475706C6963617461732E226E6F7461225D200D12002020656C7365204D
      656D6F3A3D2027273B200D0300656E6400FFFF00000000000200000001000000
      06090068656C7665746963610007000000000000000000110000000100020000
      000000FFFFFF00000000020000000000000000002314000006004D656D6F3234
      00020090000000F8000000210000000B00000040000000F40100000000000000
      00FFFFFF1F2C020000000000010000000005000500626567696E0D2800202069
      66205B7172794475706C6963617461732E227365726965225D203C3E20272720
      7468656E200D2600202020202020204D656D6F3A3D205B7172794475706C6963
      617461732E227365726965225D200D12002020656C7365204D656D6F3A3D2027
      273B200D0300656E6400FFFF0000000000020000000100000006090068656C76
      65746963610007000000000000000000120000000100020000000000FFFFFF00
      00000002000000000000000000F514000005004D656D6F38000200F3010000DB
      010000600000000E00000043000000F4010000000000000000FFFFFF1F2C0200
      00000000010050005B466F726D6174466C6F617428272323232C2323232C2323
      302E3030272C53554D285B7172794475706C6963617461732E2276616C6F7270
      6167746F225D2C204461646F734D65737472652C3129295D00000000FFFF0000
      000000020000000100000000090068656C766574696361000700000002000000
      0000010000000100020000000000FFFFFF0000000002000000000000000000E1
      15000006004D656D6F3135000200C4010000DB0100002B0000000E0000004300
      0000F4010000000000000000FFFFFF1F2C020000000000010000000005000500
      626567696E0D250020206966205B53554D28312C4461646F734D65737472652C
      31295D203C3E2030207468656E0D2400202020202020204D656D6F3A3D205B53
      554D28312C4461646F734D65737472652C31295D0D0A002020656C7365202727
      3B0D0300656E6400FFFF0000000000020000000100000000090068656C766574
      6963610007000000020000000000010000000100020000000000FFFFFF000000
      00020000000000000000006F16000006004D656D6F313700020015000000DB01
      0000AB0100000E00000043000000F4010000000000000000FFFFFF1F2C020000
      00000001000B00544F54414C20474552414C00000000FFFF0000000000020000
      000100000000090068656C766574696361000700000000000000000001000000
      0100020000000000FFFFFF0000000002000000000000000000F716000005004D
      656D6F35000200B100000067000000220000000B00000043000F00F401000000
      0000000000FFFFFF1F2C0200000000000100060046494C49414C00000000FFFF
      0000000000020000000100000000090068656C76657469636100070000000000
      00000000020000000100020000000000FFFFFF00000000020000000000000000
      008417000006004D656D6F3231000200D300000067000000430000000B000000
      43000F00F4010000000000000000FFFFFF1F2C02000000000001000A00444154
      4120504147544F00000000FFFF0000000000020000000100000000090068656C
      7665746963610007000000000000000000020000000100020000000000FFFFFF
      00000000020000000000000000000B18000006004D656D6F3238000200160100
      00670000002A0000000B00000043000F00F4010000000000000000FFFFFF1F2C
      0200000000000100040043D3442E00000000FFFF000000000002000000010000
      0000090068656C76657469636100070000000000000000000200000001000200
      00000000FFFFFF0000000002000000000000000000AA18000006004D656D6F32
      390002001A010000F8000000260000000B00000040000000F401000000000000
      0000FFFFFF1F2C02000000000001001C005B7172794475706C6963617461732E
      22666F726E656365646F72225D00000000FFFF00000000000200000001000000
      06090068656C7665746963610007000000000000000000110000000100020000
      000000FFFFFF00000000020000000000000000003619000006004D656D6F3330
      000200BD02000067000000430000000B00000043000F00F40100000000000000
      00FFFFFF1F2C02000000000001000900444553434F4E544F5300000000FFFF00
      00000000020000000100000000090068656C7665746963610007000000000000
      000000020000000100020000000000FFFFFF0000000002000000000000000000
      611A000006004D656D6F3331000200BD020000F8000000430000000B00000040
      000000F4010000000000000000FFFFFF1F2C0200000000000100000000050005
      00626567696E0D320020206966205B5B7172794475706C6963617461732E2256
      616C6F72446573635265636562225D203C3E20305D207468656E200D4E002020
      20202020204D656D6F3A3D205B466F726D6174466C6F617428272323232C2323
      232C2323302E3030272C5B7172794475706C6963617461732E2256616C6F7244
      6573635265636562225D295D0D12002020656C7365204D656D6F3A3D2027273B
      200D0300656E6400FFFF0000000000020000000100000006090068656C766574
      6963610007000000000000000000110000000100020000000000FFFFFF000000
      00020000000000000000000A1B000006004D656D6F3235000200D2000000F800
      0000450000000B00000040000000F4010000000000000000FFFFFF1F2C020000
      000000010026005B7172794475706C6963617461732E2264617461706167746F
      2220234464642F6D6D2F79795D00000000FFFF00000000000200000001000000
      06090068656C7665746963610007000000000000000000120000000100020000
      000000FFFFFF0000000002000000000000000000BF1B000006004D656D6F3333
      0002000F0000004F010000B10100000E00000043000000F40100000000000000
      00FFFFFF1F2C02000000000001003200544F54414C20464F524E454345444F52
      3A205B7172794475706C6963617461732E226E6F6D65666F726E656365646F72
      225D00000000FFFF0000000000020000000100000000090068656C7665746963
      610007000000000000000000010000000100020000000000FFFFFF0000000002
      000000000000000000921C000006004D656D6F3334000200F30100004F010000
      600000000E00000043000000F4010000000000000000FFFFFF1F2C0200000000
      00010050005B466F726D6174466C6F617428272323232C2323232C2323302E30
      30272C53554D285B7172794475706C6963617461732E2276616C6F7270616774
      6F225D2C204461646F734D65737472652C3129295D00000000FFFF0000000000
      020000000100000000090068656C766574696361000700000002000000000001
      0000000100020000000000FFFFFF00000000020000000000000000007E1D0000
      06004D656D6F3335000200C40100004F0100002B0000000E00000043000000F4
      010000000000000000FFFFFF1F2C020000000000010000000005000500626567
      696E0D250020206966205B53554D28312C4461646F734D65737472652C31295D
      203C3E2030207468656E0D2400202020202020204D656D6F3A3D205B53554D28
      312C4461646F734D65737472652C31295D0D0A002020656C73652027273B0D03
      00656E6400FFFF0000000000020000000100000000090068656C766574696361
      0007000000020000000000010000000100020000000000FFFFFF000000000200
      0000000000000000A81E000005004D656D6F3400020046020000F80000005B00
      00000B00000040000000F4010000000000000000FFFFFF1F2C02000000000001
      0000000005000500626567696E0D320020206966205B5B7172794475706C6963
      617461732E2276616C6F724A75726F735061676F73225D203C3E20305D207468
      656E0D4F00202020202020204D656D6F3A3D205B466F726D6174466C6F617428
      272323232C2323232C2323302E3030272C5B7172794475706C6963617461732E
      2256616C6F724A75726F735061676F73225D295D0D11002020656C7365204D65
      6D6F3A3D2027273B0D0300656E6400FFFF000000000002000000010000000609
      0068656C76657469636100070000000000000000001100000001000200000000
      00FFFFFF00000000020000000000000000007F1F000006004D656D6F31320002
      00A00200004F010000600000000E00000043000000F4010000000000000000FF
      FFFF1F2C020000000000010054005B466F726D6174466C6F617428272323232C
      2323232C2323302E3030272C53554D285B7172794475706C6963617461732E22
      76616C6F72446573635265636562225D2C204461646F734D65737472652C3129
      295D00000000FFFF0000000000020000000100000000090068656C7665746963
      610007000000020000000000010000000100020000000000FFFFFF0000000002
      0000000000000000005620000006004D656D6F3138000200A0020000DB010000
      600000000E00000043000000F4010000000000000000FFFFFF1F2C0200000000
      00010054005B466F726D6174466C6F617428272323232C2323232C2323302E30
      30272C53554D285B7172794475706C6963617461732E2276616C6F7244657363
      5265636562225D2C204461646F734D65737472652C3129295D00000000FFFF00
      00000000020000000100000000090068656C7665746963610007000000020000
      000000010000000100020000000000FFFFFF0000000002000000000000000000
      DE20000006004D656D6F323600020000030000670000002C0000000B00000043
      000F00F4010000000000000000FFFFFF1F2C0200000000000100050042414E43
      4F00000000FFFF0000000000020000000100000000090068656C766574696361
      0007000000000000000000020000000100020000000000FFFFFF000000000200
      00000000000000006621000006004D656D6F32370002002C0300006700000033
      0000000B00000043000F00F4010000000000000000FFFFFF1F2C020000000000
      01000500434F4E544100000000FFFF0000000000020000000100000000090068
      656C7665746963610007000000000000000000020000000100020000000000FF
      FFFF00000000020000000000000000000A22000006004D656D6F3332000200FD
      020000F8000000300000000B00000040000000F4010000000000000000FFFFFF
      1F2C020000000000010021005B7172794475706C6963617461732E227369676C
      6162616E636F706167746F225D00000000FFFF00000000000200000001000000
      06090068656C7665746963610007000000000000000000110000000100020000
      000000FFFFFF00000000020000000000000000000D23000006004D656D6F3336
      0002002B030000F8000000340000000B00000040000000F40100000000000000
      00FFFFFF1F2C020000000000020000000D00000005000500626567696E0D2B00
      20206966205B7172794475706C6963617461732E22636F6E7461706167746F22
      5D203E2030207468656E200D2A00202020202020204D656D6F3A3D205B717279
      4475706C6963617461732E22636F6E7461706167746F225D0D12002020656C73
      65204D656D6F3A3D2027273B200D0300656E6400FFFF00000000000200000001
      00000006090068656C7665746963610007000000000000000000110000000100
      020000000000FFFFFF0000000002000000000000000000B823000006004D656D
      6F3337000200E000000098000000DE0000001400000043000F00F40100000000
      00000000FFFFFF1F2C020000000000010028005B7172794475706C6963617461
      732E224E6F6D65477275706F46696C69616C456D697373616F225D00000000FF
      FF0000000000020000000100000000090068656C766574696361000700000002
      0000000000080000000100020000000000FFFFFF000000000200000000000000
      00005224000006004D656D6F37310002001C0000009800000098000000140000
      0043000F00F4010000000000000000FFFFFF1F2C020000000000010017004752
      55504F2046494C49414C20444520454D495353C34F00000000FFFF0000000000
      020000000100000000090068656C766574696361000700000000000000000009
      0000000100020000000000FFFFFF0000000002000000000000000000F9240000
      06004D656D6F3732000200B900000098000000220000001400000043000F00F4
      010000000000000000FFFFFF1F2C020000000000010024005B7172794475706C
      6963617461732E22477275706F46696C69616C456D697373616F225D00000000
      FFFF0000000000020000000100000000090068656C7665746963610007000000
      000000000000090000000100020000000000FFFFFF0000000002000000000000
      0000009F25000006004D656D6F3338000200E0000000BC000000DE0000001400
      000043000F00F4010000000000000000FFFFFF1F2C020000000000010023005B
      7172794475706C6963617461732E224E6F6D6546696C69616C456D697373616F
      225D00000000FFFF0000000000020000000100000000090068656C7665746963
      610007000000020000000000080000000100020000000000FFFFFF0000000002
      0000000000000000003326000006004D656D6F333900020044000000BC000000
      700000001400000043000F00F4010000000000000000FFFFFF1F2C0200000000
      000100110046494C49414C20444520454D495353C34F00000000FFFF00000000
      00020000000100000000090068656C7665746963610007000000000000000000
      090000000100020000000000FFFFFF0000000002000000000000000000D52600
      0006004D656D6F3430000200B9000000BC000000220000001400000043000F00
      F4010000000000000000FFFFFF1F2C02000000000001001F005B717279447570
      6C6963617461732E2246696C69616C456D697373616F225D00000000FFFF0000
      000000020000000100000000090068656C766574696361000700000000000000
      0000090000000100020000000000FFFFFF000000000200000000000000000089
      27000006004D656D6F3431000200130000008B010000AD0100000E0000004300
      0000F4010000000000000000FFFFFF1F2C02000000000001003100544F54414C
      2046494C49414C3A205B7172794475706C6963617461732E224E6F6D6546696C
      69616C456D697373616F225D00000000FFFF0000000000020000000100000000
      090068656C766574696361000700000000000000000001000000010002000000
      0000FFFFFF00000000020000000000000000005C28000006004D656D6F343200
      0200F30100008B010000600000000E00000043000000F4010000000000000000
      FFFFFF1F2C020000000000010050005B466F726D6174466C6F61742827232323
      2C2323232C2323302E3030272C53554D285B7172794475706C6963617461732E
      2276616C6F72706167746F225D2C204461646F734D65737472652C3129295D00
      000000FFFF0000000000020000000100000000090068656C7665746963610007
      000000020000000000010000000100020000000000FFFFFF0000000002000000
      0000000000004829000006004D656D6F3433000200C40100008B0100002B0000
      000E00000043000000F4010000000000000000FFFFFF1F2C0200000000000100
      00000005000500626567696E0D250020206966205B53554D28312C4461646F73
      4D65737472652C31295D203C3E2030207468656E0D2400202020202020204D65
      6D6F3A3D205B53554D28312C4461646F734D65737472652C31295D0D0A002020
      656C73652027273B0D0300656E6400FFFF000000000002000000010000000009
      0068656C76657469636100070000000200000000000100000001000200000000
      00FFFFFF00000000020000000000000000001F2A000006004D656D6F34350002
      00A00200008B010000600000000E00000043000000F4010000000000000000FF
      FFFF1F2C020000000000010054005B466F726D6174466C6F617428272323232C
      2323232C2323302E3030272C53554D285B7172794475706C6963617461732E22
      76616C6F72446573635265636562225D2C204461646F734D65737472652C3129
      295D00000000FFFF0000000000020000000100000000090068656C7665746963
      610007000000020000000000010000000100020000000000FFFFFF0000000002
      000000000000000000E12A000006004D656D6F343600020013000000AF010000
      AD0100000E00000043000000F4010000000000000000FFFFFF1F2C0200000000
      0001003F00544F54414C20475255504F2044452046494C49414C3A205B717279
      4475706C6963617461732E224E6F6D65477275706F46696C69616C456D697373
      616F225D00000000FFFF0000000000020000000100000000090068656C766574
      6963610007000000000000000000010000000100020000000000FFFFFF000000
      0002000000000000000000B42B000006004D656D6F3437000200F3010000AF01
      0000600000000E00000043000000F4010000000000000000FFFFFF1F2C020000
      000000010050005B466F726D6174466C6F617428272323232C2323232C232330
      2E3030272C53554D285B7172794475706C6963617461732E2276616C6F727061
      67746F225D2C204461646F734D65737472652C3129295D00000000FFFF000000
      0000020000000100000000090068656C76657469636100070000000200000000
      00010000000100020000000000FFFFFF0000000002000000000000000000A02C
      000006004D656D6F3438000200C4010000AF0100002B0000000E000000430000
      00F4010000000000000000FFFFFF1F2C02000000000001000000000500050062
      6567696E0D250020206966205B53554D28312C4461646F734D65737472652C31
      295D203C3E2030207468656E0D2400202020202020204D656D6F3A3D205B5355
      4D28312C4461646F734D65737472652C31295D0D0A002020656C73652027273B
      0D0300656E6400FFFF0000000000020000000100000000090068656C76657469
      63610007000000020000000000010000000100020000000000FFFFFF00000000
      02000000000000000000772D000006004D656D6F3530000200A0020000AF0100
      00600000000E00000043000000F4010000000000000000FFFFFF1F2C02000000
      0000010054005B466F726D6174466C6F617428272323232C2323232C2323302E
      3030272C53554D285B7172794475706C6963617461732E2276616C6F72446573
      635265636562225D2C204461646F734D65737472652C3129295D00000000FFFF
      0000000000020000000100000000090068656C76657469636100070000000200
      00000000010000000100020000000000FFFFFF00000000020000000000000000
      003F2E000006004D656D6F35310002001000000028010000B00100000E000000
      43000000F4010000000000000000FFFFFF1F2C02000000000001004500544F54
      414C204449413A205B464F524D41544441544554494D45282764642F6D6D2F79
      797979272C5B7172794475706C6963617461732E2264617461706167746F225D
      295D00000000FFFF0000000000020000000100000000090068656C7665746963
      610007000000000000000000010000000100020000000000FFFFFF0000000002
      000000000000000000122F000006004D656D6F3532000200F301000028010000
      600000000E00000043000000F4010000000000000000FFFFFF1F2C0200000000
      00010050005B466F726D6174466C6F617428272323232C2323232C2323302E30
      30272C53554D285B7172794475706C6963617461732E2276616C6F7270616774
      6F225D2C204461646F734D65737472652C3129295D00000000FFFF0000000000
      020000000100000000090068656C766574696361000700000002000000000001
      0000000100020000000000FFFFFF0000000002000000000000000000FE2F0000
      06004D656D6F3533000200C4010000280100002B0000000E00000043000000F4
      010000000000000000FFFFFF1F2C020000000000010000000005000500626567
      696E0D250020206966205B53554D28312C4461646F734D65737472652C31295D
      203C3E2030207468656E0D2400202020202020204D656D6F3A3D205B53554D28
      312C4461646F734D65737472652C31295D0D0A002020656C73652027273B0D03
      00656E6400FFFF0000000000020000000100000000090068656C766574696361
      0007000000020000000000010000000100020000000000FFFFFF000000000200
      0000000000000000D530000006004D656D6F3535000200A00200002801000060
      0000000E00000043000000F4010000000000000000FFFFFF1F2C020000000000
      010054005B466F726D6174466C6F617428272323232C2323232C2323302E3030
      272C53554D285B7172794475706C6963617461732E2276616C6F724465736352
      65636562225D2C204461646F734D65737472652C3129295D00000000FFFF0000
      000000020000000100000000090068656C766574696361000700000002000000
      0000010000000100020000000000FFFFFF000000000200000000000000000062
      31000006004D656D6F35360002005F030000670000009F0000000B0000004300
      0F00F4010000000000000000FFFFFF1F2C02000000000001000A004F42534552
      5641C7C34F00000000FFFF0000000000020000000100000000090068656C7665
      746963610007000000000000000000020000000100020000000000FFFFFF0000
      0000020000000000000000000132000006004D656D6F35370002005F030000F8
      0000009E0000000B00000043000000F4010000000000000000FFFFFF1F2C0200
      0000000001001C005B7172794475706C6963617461732E226F62736572766163
      616F225D00000000FFFF0000000000020000000100000006090068656C766574
      6963610007000000000000000000100000000100020000000000FFFFFF000000
      0002000000000000000100284A000009006670764C6F676F5F500002001B0000
      002E000000780000002A00000007000000F4010000000000000000FFFFFF1F2C
      020000000000000000000000FFFF00000000000200000001000000060100284A
      0000424DCE170000000000003604000028000000830000002600000001000800
      0000000098130000120B0000120B0000000100000001000000000000E8E5A800
      AA9E000099990000ADADAD003A3C4100A3970000BFB73700D8D48600FBFAF000
      A5A5A5001E1D1C00D8D9DA0054575A00D6D6D500E7E8F20012161B00B6AD1900
      CBC55B008C8D9200BEC0C500E1E2E40085878A005E606300494C4F00090D1200
      2C2E3300DEDB98007D7F8100EFEDCB00B9BABB00AEA400007C7B7B00C5BE4400
      66666600D1CC6F00CDC9810048484600F7F6E600AFA5080004080D00F9F8ED00
      B8AF2700DBD68C00999999001B1A1900C6BF5100131312003B3A3A00FFFFFF00
      EAE8BE00CCCCCC0023262A00E2DEA400F1EFD600B0B1B300D3CD7500B1A81000
      CCCC660072727200535252004342420001060A00ECE9C3008C8C8B00F5F4DF00
      4A4A4A0057575600B6AC1F00282B3000C7C05C0061615F00F7F7F70088888700
      DDD89300E3E0A600FDFCF70021242900070A1000BDB53100C5BE4A00E3E3E200
      A69C000099999900BABAB900DEDEDE00525458002A292800D9D58A005F5E5D00
      C7C595001B1E2300E8E5B60000000700B5AB1300D5D07B00C6C6C500B2A80B00
      21202000B9B12400504F4E00666666006B6D7000B5B5BD0084848400E0DC9E00
      BCB42C00F7EFD6005B5B5A00EFEFEF0087898B00DEDEE6003E3D3C0014181E00
      C8C25300CCC55F00A8A9AC00BDBDBC00E5E1AC0075767900181B2000E6E6E600
      0E1117000810190033333300929191002D2C2B00B5B5B4000000000000000000
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
      0000000000000000000000000000000000000000000000003131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131543D42470E313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131315231313131
      31486D3131316D6D4C3131316D6D313131313131313131316D48313131313131
      31316D6D3131316D040A6C6C313131313131486D6D4C3131313131316D6D4C31
      3131313131313131313131486D6D6D313131313131486D6D48313131316D4831
      31316D6D3131313131313131313131316D6D6D3131486D6D6D31313131313152
      313131317F7E6631554225256031603D42647931420C313B7D316D6C3D704031
      31662C316D593D7068313133646C702531484255312C70643059313131310C25
      25420E31477431420E4825793131315442433D474C4C640E3120423C300A3131
      207E2C317F70254748484251512531603C316D59253C620A312C254330683131
      31313152313131316C2031315959313131317C7D4C4C31487C0E315968317742
      4C51347531434031203D487957543130494C7F3D31487C0C310B37317F703131
      31313C6631313131642C317C33487E51313131313179602F55317C3331316D79
      3B7031487E14314857043131316D7C55557E311E3031542D4C31434031314879
      0A0B4C313131315231313131477D313125306C64334C5779313131487C0E3122
      4931422C31314340316C7D313C7D3131594931570C31543D31487C0C31687059
      30253131313170706C3C0E313C0A313033317C513131310C702570474C4C3033
      312C7C64300A3148300E31796243432248483051517C31603D316D6464590B2C
      31547C42301C313131313152313131314749313166420C5548313D2C48483148
      7C0E48302C311C4248516275316C7D31493D4879627F31256848373031487C0E
      3131550E207031313131473C0C554831642C4C7E330C62793131316830796D31
      31487C3331577D6D6D313148303331487C49555131487C0C0C7E4C2C70313148
      0C0E7C2C313C476D6D31313131313152313131040B7E20316D473C6C33310E3D
      3C6C7931254264646D31486C42706831316C7D31484742702031310E3D433D6C
      31484355314043473D0A31313131796C3C6C0E316670597E3C3D20313131310E
      256C6C7731316C0E312C3D47430431772F3D0A3133424366484825643C7E6C7C
      74316D225943425531543D59437D3131313131523131316D643B6D3131316D51
      4831313179514C316D51793131313131796D3131313C40313131796D31313131
      3179794831317F6D316D15154831313131313131795148314879516D796D3131
      313131313151517931317F6D31316D51516D3151577F6D313131797931316D51
      516D5148313131515151313131314851516D3131313131523131313140043131
      3131313131313131313131313131313131313131313131313168043131313131
      31313131313131313148660F3131313131313131313131313131313131313131
      3131313131313131313131313131220E31313131313131316655313131313131
      3131313131313131313131313131313131313131313131313131315231313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131315C46121212463F3131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313152
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131315F06020202061B31313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131523131313131310E40173C18183D6E3131313131310C2C666C3C181818
      181805683131313131316D3768220D0516313131313108021F1F1F5235313131
      313172070707070707070707070707070750732B363131313131313131313136
      2B73212112081D31313131313131313123505050504B3131313131313131313F
      08122E505050085231313131312C103E191919195D17313131317966713E4E19
      1919191919195D0D31313131312C34282819190017313131313108021F1F1F52
      3531313131311152020202020202020202020202020202022776313131313131
      313F501F02020202020202075C313131313131316A060202065F313131313131
      314C120202020202020221523131313175287A78787878784E223131310E1A3E
      10787871717171717171281731313131773E7A71717171282231313131310802
      1F1F1F5235313131313144021F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1D31
      313131310802021F1F1F1F1F1F1F1F02022331313131313107021F1F02083131
      31313131313A521F1F1F1F1F1F1F5052313131310D4E7878787A7A7128223131
      6D7C4E7878784E4E7A717171717128173131312C3E7171717119195D22313131
      313108021F1F1F5269314C4C4C4C631F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
      1F52503131313138521F1F1F0202020202021F1F1F5212313131313107021F1F
      0208313131313131361F1F1F1F1F0202020221523131316D457A78787A3D370E
      0E5131313B3E7878787A2274140E0E0E0E0E0E15313115787A787871190D0A14
      5A2A6A6A6A2A5F36363636365044111111113226262626262626262626262626
      264A1F1F1F1F612631311B521F1F1F02443A08082363021F1F1F525F31313131
      07021F1F02083131313131311B021F1F1F1F6A2B353532523131310E71717171
      710C313131313115781078784E683131313131313131313131311C287878787A
      2C3131310106020202025F313131313150520202020236313131313131313131
      31313131313144021F1F1F32312639021F1F1F584C31313131311B27021F1F1F
      3631313107021F1F020831313131313123021F1F1F1109313131315231313133
      7A717171454831313131312C28787810344C313131313131313131313131057A
      78784E663131313135021F1F1F025F313131313150021F1F1F1F363131313131
      3131313131313131314C5E021F1F0276315F521F1F1F4B313131313131313132
      271F1F527331313107021F1F020831313131313112021F1F0272313131313152
      313131601978787A7C4C3131313131662878781045166E6E6E6E6E6E6E6E1C04
      31555B1078717A603131313135021F1F1F025F313131313150021F1F1F1F3631
      3131313131314C0909090909363A021F1F1F1F3F314F021F0272313131313131
      3131313123021F1F1109313107021F1F02083131313131312E021F1F02733131
      31313152313131601978787A054C313131313156197878787128282828282828
      2828005631337A717171346D313131313552020202025F313131313121060202
      02023631313131762E635E61616161611F1F1F1F1F1F114C26611F1F02763131
      31313131313131311D1F1F1F1F1D313107021F1F02083131313131312E021F1F
      023A313131313152313131601978787A054C3131313131181978787878787878
      7878787878784E1731141978787A454831313131764444444444241551515151
      464F4F4F4F4F413131313A0202021F1F1F1F1F1F1F1F1F1F1F521B311D1F1F1F
      1F363131313131313131313126391F1F1F5C313107021F1F0208313131313131
      2E021F1F023A313131313152313131601978787A054C31313131315619787878
      787878787878787878784E1731337A717171346D313131313109090909097D71
      3434347A37313131313131313158521F1F1F1F1F020202020202020227583131
      1D1F1F1F1F1D3131313131313131313126391F1F1F5C313107021F1F02083131
      313131312E021F1F023A313131313152313131601978787A054C313131313122
      4E787878784E28282828282828280056310C787171715B0C3131313131313131
      3131133E1010105D74313131313131312939021F1F1F1F3911636363636A5008
      3631313126611F1F024B313131313131313131313F021F1F1F36313107021F1F
      02083131313131312E021F1F023A313131313152313131601978787A054C3131
      31313116287878101A2C2C2C2C2C2C2C2C2C7D1E316D1A7A7878197F31313131
      313131313131134E78787828743131313131313176021F1F1F1F232631313131
      31313131313131313107021F02213131313131313131313173021F1F444C3131
      07021F1F02083131313131312E021F1F023A313131313152313131601978787A
      054C31313131317F197171713448313131313131313131313131561978784E66
      31313131313131313131134E7878782874313131313131312B521F1F1F612931
      3131313131313131313131313158521F1F024A31313131313131317602021F52
      2331313107021F1F02083131313131312E021F1F023A31313131315231313133
      1978787A053131313131316D347A78784E133131313131313131313131317D28
      787871710431313131313131313113001919190004313131313131312B521F1F
      1F274131313131313131313131313131310911021F1F1F232631313131295F1F
      1F1F1F612931313107021F1F022B3131313131312E021F1F5223313131313152
      0E14602C7A78787A7C141414140C3131203E78787171660A1E6014141414140E
      3131155B107878107A567D371E1E1E1E1E1E13566C6C6C182C75757575756D31
      5C021F1F1F1F211B1B1B1B1B1B4A4A4A4A4A3631313176021F1F1F0261502323
      725E021F1F1F0258762B2B4A44021F1F1F504A4A4A2B1D312E021F1F1F074A4A
      4A4A5C520D7A7A7A78787878787A7A7A5D1731317945197878784E4E7A7A7A7A
      7A7A5D6C313131165D7171717119191919191919195D6E313131313166007A7A
      7A4E1431295E021F1F1F0202020202020202020202062B313131315802021F1F
      1F020202021F1F1F1F52384C395252521F1F1F1F1F020202020608312E021F1F
      1F1F0202020221521771717878787878787171714E22313131335B2871787878
      7871717171714E1731313131173E7A717878787878787878784E6E3131313131
      66287171717A6031314A521F1F1F1F1F1F1F1F1F1F1F1F1F1F524A3131313131
      6939521F1F1F1F1F1F1F1F020258310911021F1F1F1F1F1F1F1F1F1F1F022B31
      2E021F1F1F1F1F1F1F1F50520D19191978787878781919190017313131310C0D
      10284E4E191919191919000D31313131317D1A4E4E4E19191919191919001C31
      31313131662878787810603131315F0202020202020202020202020202062B31
      313131313136733902020202020261721D313129615252521F1F1F1F1F020202
      020608312E021F1F1F1F0202020221527D17173C107878714D1717170D2C3131
      313131310E0A1C3B2217171717170D7D31313131313148757D77661717171717
      170D0431313131316628787878106031313131364A3A72727272727272727272
      72505C3131313131313131264B5F737338354131313131093A7272725E1F1F1F
      1F4F1212122E5C312E021F1F1F631212121258523131310E1978787A05313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313117003E3E3E5D7531313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      07021F1F52583131313131312E021F1F0223313131313152313131601978787A
      054C313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131317F686E6E6E6E15313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313121021F1F02073131313131312E021F1F023A31313131315231313160
      1978787A054C3131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313173021F1F1F1F4F3A233A32312E021F1F023A313131313152
      313131601978787A054C31313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313169521F1F1F1F0202020608312E021F1F023A3131
      31313152313131601978787A054C313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131310963521F1F1F1F1F1F024A312E021F1F
      023A313131313152313131601971717A054C3131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131314150611F1F1F1F1F024A31
      50021F1F023A3131313131523131310C0D17176C774C31313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131315C38727272
      72725C31082E2E2E2E1B3131313131520000BF4A00000B006D6D6F544954554C
      4F5F50000200790100002E0000003B0200001500000043000000F40100000000
      00000000FFFFFF1F2C02000000000001000F00524553554D4F205B544954554C
      4F5D00000000FFFF0000000000020000000100000006090068656C7665746963
      61000B000000020000000000020000000100020000000000FFFFFF0000000002
      000000000000000000504B00000F006D6D6F524F54554C4F444154415F500002
      00B50300002E0000001C0000000C00000043000000F4010000000000000000FF
      FFFF1F2C02000000000001000500446174613A00000000FFFF00000000000200
      00000100000006090068656C7665746963610006000000000000000000000000
      000100020000000000FFFFFF0000000002000000000000000000E74B00000900
      6D6D6F444154415F50000200D20300002E0000002C0000000C00000043000000
      F4010000000000000000FFFFFF1F2C020000000000010011005B444154452023
      4464642F6D6D2F79795D00000000FFFF00000000000200000001000000060900
      68656C7665746963610006000000000000000000010000000100020000000000
      FFFFFF00000000020000000000000000007C4C000011006D6D6F524F54554C4F
      504147494E415F50000200B50300003B000000280000000C00000043000000F4
      010000000000000000FFFFFF1F2C0200000000000100070050E167696E613A00
      000000FFFF0000000000020000000100000000090068656C7665746963610006
      000000000000000000000000000100020000000000FFFFFF0000000002000000
      0000000000000B4D00000B006D6D6F504147494E415F50000200DE0300003B00
      0000200000000C00000043000000F4010000000000000000FFFFFF1F2C020000
      000000010007005B50414745235D00000000FFFF000000000002000000010000
      0000090068656C76657469636100060000000000000000000100000001000200
      00000000FFFFFF0000000002000000000000000000B14D000013006D6D6F464F
      4E4546494C49414C424153455F50000200980000004F000000CE0000000A0000
      0047000000F4010000000000000000FFFFFF1F2C02000000000001001600464F
      4E453A205B464F4E4546494C49414C424153455D00000000FFFF000000000002
      0000000100000000090068656C76657469636100060000000000000000000000
      00000100020000000000FFFFFF0000000002000000000000000000664E000014
      006D6D6F454E44455245434F5F42414952524F5F500002009800000039000000
      CF0000000A00000043000000F4010000000000000000FFFFFF1F2C0200000000
      00010024005B52554146494C49414C424153455D202D205B42414952524F4649
      4C49414C424153455D00000000FFFF0000000000020000000100000000090068
      656C7665746963610006000000000000000000000000000100020000000000FF
      FFFF0000000002000000000000000000334F000012006D6D6F4345505F434944
      4144455F55465F500002009800000044000000CF0000000A00000043000000F4
      010000000000000000FFFFFF1F2C02000000000001003E004345503A205B4345
      5046494C49414C424153455D202D205B43494441444546494C49414C42415345
      5D202D205B45535441444F46494C49414C424153455D00000000FFFF00000000
      00020000000100000000090068656C7665746963610006000000000000000000
      000000000100020000000000FFFFFF0000000002000000000000000000D54F00
      0014006D6D6F52415A414F46494C49414C424153455F50000200980000002E00
      0000CF0000000A00000043000000F4010000000000000000FFFFFF1F2C020000
      000000010011005B52415A414F46494C49414C424153455D00000000FFFF0000
      000000020000000100000006090068656C766574696361000600000000000000
      0000000000000100020000000000FFFFFF000000000200000000000000000063
      5000000900666D764F757472617300020078010000440000003B020000200000
      0043000000F4010000000000000000FFFFFF1F2C020000000000010008005B4F
      75747261735D00000000FFFF0000000000020000000100000000090068656C76
      65746963610007000000000000000000020000000100020000000000FFFFFF00
      00000002000000000000000000EA50000005004D656D6F330002005302000067
      0000004E0000000B00000043000F00F4010000000000000000FFFFFF1F2C0200
      00000000010005004A55524F5300000000FFFF00000000000200000001000000
      00090068656C7665746963610007000000000000000000020000000100020000
      000000FFFFFF0000000002000000000000000000C151000006004D656D6F3131
      000200410200004F010000600000000E00000043000000F40100000000000000
      00FFFFFF1F2C020000000000010054005B466F726D6174466C6F617428272323
      232C2323232C2323302E3030272C53554D285B7172794475706C696361746173
      2E2276616C6F724A75726F735061676F73225D2C4461646F734D65737472652C
      3129295D00000000FFFF0000000000020000000100000000090068656C766574
      6963610007000000020000000000010000000100020000000000FFFFFF000000
      00020000000000000000009852000006004D656D6F313400020041020000DB01
      0000600000000E00000043000000F4010000000000000000FFFFFF1F2C020000
      000000010054005B466F726D6174466C6F617428272323232C2323232C232330
      2E3030272C53554D285B7172794475706C6963617461732E2276616C6F724A75
      726F735061676F73225D2C4461646F734D65737472652C3129295D00000000FF
      FF0000000000020000000100000000090068656C766574696361000700000002
      0000000000010000000100020000000000FFFFFF000000000200000000000000
      00006F53000006004D656D6F3434000200410200008B010000600000000E0000
      0043000000F4010000000000000000FFFFFF1F2C020000000000010054005B46
      6F726D6174466C6F617428272323232C2323232C2323302E3030272C53554D28
      5B7172794475706C6963617461732E2276616C6F724A75726F735061676F7322
      5D2C4461646F734D65737472652C3129295D00000000FFFF0000000000020000
      000100000000090068656C766574696361000700000002000000000001000000
      0100020000000000FFFFFF00000000020000000000000000004654000006004D
      656D6F343900020041020000AF010000600000000E00000043000000F4010000
      000000000000FFFFFF1F2C020000000000010054005B466F726D6174466C6F61
      7428272323232C2323232C2323302E3030272C53554D285B7172794475706C69
      63617461732E2276616C6F724A75726F735061676F73225D2C4461646F734D65
      737472652C3129295D00000000FFFF0000000000020000000100000000090068
      656C7665746963610007000000020000000000010000000100020000000000FF
      FFFF00000000020000000000000000001D55000006004D656D6F353400020041
      02000028010000600000000E00000043000000F4010000000000000000FFFFFF
      1F2C020000000000010054005B466F726D6174466C6F617428272323232C2323
      232C2323302E3030272C53554D285B7172794475706C6963617461732E227661
      6C6F724A75726F735061676F73225D2C4461646F734D65737472652C3129295D
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      07000000020000000000010000000100020000000000FFFFFF00000000020000
      00000000000000BA5500000F006D6D6F524F44415045484F52415F5000020023
      000000DC020000580000000A00000043000000F4010000000000000000FFFFFF
      1F2C020000000000010011005B54494D4520235468683A6D6D3A73735D000000
      00FFFF0000000000020000000100000006090068656C76657469636100070000
      00000000000000100000000100020000000000FFFFFF00000000020000000000
      00000000635600000C006D6D6F544543534F46545F500002001F030000DC0200
      00DC0000000A00000043000000F4010000000000000000FFFFFF1F2C02000000
      000001002000746563534F4654202D205465636E6F6C6F67696120656D205369
      7374656D617300000000FFFF0000000000020000000100000006090068656C76
      65746963610007000000000000000000110000000100020000000000FFFFFF00
      00000002000000000000000000E956000006004D656D6F3538000200A1020000
      670000001C0000000B00000043000F00F4010000000000000000FFFFFF1F2C02
      00000000000100030044444100000000FFFF0000000000020000000100000000
      090068656C76657469636100070000000000000000000A000000010002000000
      0000FFFFFF0000000002000000000000000A0F00546672436865636B426F7856
      6965770000675700000600436865636B31000200000000000000000018000000
      0C0000000100000002000000000000000000FFFFFF1F2C020000000000010015
      005B7172794475706C6963617461732E22646461225D00000000FFFF00000000
      00020000000100000000010000000000001358000006004D656D6F3539000200
      A8020000F80000000E0000000B00000040000000F4010000000000000000FFFF
      FF1F2C000000000000010029005B4946285B7172794475706C6963617461732E
      22646461225D3D547275652C202758272C202727295D00000000FFFF00000000
      00020000000100000006090068656C7665746963610007000000000000000000
      110000000100020000000000FFFFFF000000000200000000000000FEFEFF0D00
      000004002056617200000000030052756100000000060042616972726F000000
      000400466F6E65000000000600546974756C6F00160027504147414D454E544F
      5320454645545541444F53270006004F75747261730000000006004369646164
      65000000000C00204167727570616D656E746F00000000120041677275706172
      477275706F46696C69616C00050046616C7365000D004167727570617246696C
      69616C00050046616C736500110041677275706172466F726E656365646F7200
      050046616C7365000700204F7574726F730000000005004C696E686100010030
      000000000000000000FC000000000000000000000000000000005800E00C74D1
      6F88E340C9E6F91D0D39E640}
  end
  object qryGruposFornecedores: TtecQuery
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
      'Select codigo,'
      '           nome'
      'From   gruposfornecedores'
      'Where codigo =:codigo')
    RequestLive = False
    Left = 69
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryGruposFornecedorescodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object qryGruposFornecedoresnome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 50
    end
  end
  object dsrGruposFornecedores: TtecDataSource
    DataSet = qryGruposFornecedores
    Left = 242
    Top = 392
  end
  object qryConsultaGruposFornecedores: TtecQuery
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
      'Select nome,'
      '           codigo'
      'From   gruposfornecedores'
      'Order By UPPER(TO_ASCII(nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 447
    Top = 391
    object qryConsultaGruposFornecedoresnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object qryConsultaGruposFornecedorescodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Required = True
    end
  end
  object qryTiposPagamentos: TtecQuery
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
      'Select  codigo,'
      '            descricao'
      'From    tipospagamentos'
      'Where codigo = :codigo')
    RequestLive = False
    Left = 72
    Top = 440
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryTiposPagamentoscodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object qryTiposPagamentosdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 30
    end
  end
  object dsrTiposPagamentos: TtecDataSource
    DataSet = qryTiposPagamentos
    Left = 243
    Top = 448
  end
  object qryConsultaTiposPagamentos: TtecQuery
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
      'SELECT descricao,'
      '               codigo'
      'FROM     tipospagamentos'
      'ORDER BY UPPER(TO_ASCII(descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 448
    Top = 450
    object qryConsultaTiposPagamentosdescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
    object qryConsultaTiposPagamentoscodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
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
      'order by codigo')
    RequestLive = True
    Left = 67
    Top = 15
    object qryFiliaiscodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object qryFiliaisnome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 40
    end
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
      'order by codigo')
    RequestLive = True
    Left = 147
    Top = 15
    object qryGrupoFiliaiscodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryGrupoFiliaisdescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset'
    CloseDataSource = False
    FieldAliases.Strings = (
      'documentopag=documentopag'
      'filialemissao=filialemissao'
      'nomefilialemissao=nomefilialemissao'
      'cnpjfilial=cnpjfilial'
      'grupofilialemissao=grupofilialemissao'
      'nomegrupofilialemissao=nomegrupofilialemissao'
      'nota=nota'
      'serie=serie'
      'fornecedor=fornecedor'
      'tipofornecedor=tipofornecedor'
      'nomefornecedor=nomefornecedor'
      'cnpj_cpf_fornecedor=cnpj_cpf_fornecedor'
      'datavencto=datavencto'
      'valorvencto=valorvencto'
      'valordesconto=valordesconto'
      'datapagto=datapagto'
      'valorpagto=valorpagto'
      'numero=numero'
      'previsao=previsao'
      'emissao=emissao'
      'ValorJurosPagos=ValorJurosPagos'
      'ValorDescReceb=ValorDescReceb'
      'observacao=observacao'
      'ContaPagto=ContaPagto'
      'diferenciar=diferenciar'
      'bancocobranca=bancocobranca'
      'siglabancocobranca=siglabancocobranca'
      'siglabancopagto=siglabancopagto'
      'obs=obs'
      'evento=evento'
      'descricao_evento=descricao_evento'
      'complemento=complemento'
      'documento=documento'
      'adiantamento=adiantamento'
      'dda=dda'
      'datalancto=datalancto'
      'mesano=mesano'
      'valor=valor'
      'regimedecaixa=regimedecaixa'
      'totalvalorjurospagos=totalvalorjurospagos'
      'totalvalordescreceb=totalvalordescreceb'
      'totalvalorpagto=totalvalorpagto'
      'qtparcelas=qtparcelas'
      'complementoduplicata=complementoduplicata'
      'EventoDescricao=EventoDescricao'
      'UsuarioLancamento=UsuarioLancamento'
      'UsuarioPagamento=UsuarioPagamento')
    DataSet = qryDuplicatas
    Left = 752
    Top = 32
  end
  object frxDuplicatasporCompetencia: TfrxReport
    Version = '4.0.11'
    DataSet = frxDBDataset2
    DataSetName = 'frxDBDataset'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43735.424366458300000000
    ReportOptions.LastChange = 45512.407081296300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      ' LINHA: INTEGER;'
      
        ' vTGPrecoaPrazo_d, vTGPrecoCusto_d, vTGMarkup_d, vpMargem_d : Cu' +
        'rrency;'
      
        ' vTGPrecoaPrazo_v, vTGPrecoCusto_v, vTGMarkup_v, vpMargem_v : Cu' +
        'rrency;'
      
        ' vTGPrecoaPrazo_g, vTGPrecoCusto_g, vTGMarkup_g, vpMargem_g, vTo' +
        'talVencimento : Currency;'
      '  vZebrar, vZebrar2 : boolean;'
      ''
      'procedure GroupFooter3OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure Memo11OnAfterData(Sender: TfrxComponent);'
      'begin'
      
        '  vTotalVencimento := SUM(<frxDBDataset."valorvencto">,MasterDat' +
        'a1,1);'
      'end;'
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <AgruparGrupoFilial> then'
      '  begin'
      '     CabecalhoGrupoFilial.visible:=true;'
      '     RodapeGrupoFilial.visible:=true;'
      '  end'
      '  else'
      '  begin'
      '    CabecalhoGrupoFilial.visible:=false;'
      '    RodapeGrupoFilial.visible:=false;'
      '  end;'
      ''
      '  if <AgruparFilial> then'
      '  begin'
      '   CabecalhoFilial.visible:=true;'
      '   RodapeFilial.visible:=true;'
      '  end'
      '  else'
      '  begin'
      '    CabecalhoFilial.visible:=false;'
      '    RodapeFilial.visible:=false;'
      '  end;'
      ''
      '  if <AgruparFornecedor> then'
      '  begin'
      '   CabecalhoFornecedor.visible:=true;'
      '   RodapeFornecedor.visible:=true;'
      '  end'
      '  else'
      '  begin'
      '    CabecalhoFornecedor.visible:=false;'
      '    RodapeFornecedor.visible:=false;'
      '  end;'
      ''
      '  if <AgruparData> then'
      '  begin'
      '   CabecalhoDataLancto.visible:=true;'
      '   RodapeDataLancto.visible:=true;'
      '   CabecalhoMesAno.visible:=true;'
      '   RodapeMesAno.visible:=true;'
      '  end'
      '  else'
      '  begin'
      '    CabecalhoDataLancto.visible:=false;'
      '    RodapeDataLancto.visible:=false;'
      '    CabecalhoMesAno.visible:=false;'
      '    RodapeMesAno.visible:=false;'
      '  end;'
      ''
      ''
      ''
      'end;'
      ''
      'procedure Memo47OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  mmoTotalValorPagto.text := floattostr(SUM(<frxDBDataset."valor' +
        'pagto">,MasterData1,1));'
      'end;'
      ''
      
        'procedure CabecalhoDocumentopagOnBeforePrint(Sender: TfrxCompone' +
        'nt);'
      'begin'
      '  if vZebrar2 then'
      '  begin'
      '    mmoZebrado2.color := <CordoZebrado>;'
      '    vZebrar2 := false;'
      '  end'
      '  else'
      '  begin'
      '    mmoZebrado2.color := clwhite;'
      '    vZebrar2 := true;'
      '  end;'
      ''
      'end;'
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if vZebrar then'
      '  begin'
      '    mmoZebrado.color := <CordoZebrado>;'
      '    vZebrar := false;'
      '  end'
      '  else'
      '  begin'
      '    mmoZebrado.color := clwhite;'
      '    vZebrar := true;'
      '  end;'
      ''
      'end;'
      ''
      
        'procedure CabecalhoGrupoFilialOnBeforePrint(Sender: TfrxComponen' +
        't);'
      'begin'
      ' if <AgruparGrupoFilial> then'
      ' begin'
      '   Outline.LevelRoot;'
      
        '   Outline.AddItem(inttostr(<frxDBDataset."grupofilialemissao">)' +
        '+'#39' - '#39'+<frxDBDataset."nomegrupofilialemissao">);'
      ' end;'
      ''
      'end;'
      ''
      'procedure CabecalhoFilialOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ' if <AgruparFilial> then'
      ' begin'
      '   Outline.LevelRoot;'
      
        '   Outline.AddItem(inttostr(<frxDBDataset."filialemissao">)+'#39' - ' +
        #39'+<frxDBDataset."nomefilialemissao">);'
      ' end;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxDuplicatasporCompetenciaGetValue
    Left = 792
    Top = 120
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset'
      end>
    Variables = <
      item
        Name = ' Relatorio'
        Value = Null
      end
      item
        Name = 'ENDERECO_BAIRRO'
        Value = #39'RODOVIA SC-405, KM 1, 1229 - Rio Tavares'#39
      end
      item
        Name = 'RAZAOFILIALBASE'
        Value = #39'WD COMPNESADOS E MADEIRA LTDA - EPP'#39
      end
      item
        Name = 'CEP_CIDADE_UF'
        Value = #39'88048-100  Florian'#243'polis  SC'#39
      end
      item
        Name = 'TITULO'
        Value = #39'CONTAS POR DATA DE COMPET'#202'NCIA'#39
      end
      item
        Name = 'SUBTITULO'
        Value = #39' SEM ADIANTAMENTOS ENTRE: 01/07/2024 E 08/08/2024'#39
      end
      item
        Name = 'OUTRAS'
        Value = Null
      end
      item
        Name = 'DATA'
        Value = Null
      end
      item
        Name = 'AgruparGrupoFilial'
        Value = 'False'
      end
      item
        Name = 'AgruparFilial'
        Value = 'True'
      end
      item
        Name = 'AgruparFornecedor'
        Value = 'False'
      end
      item
        Name = 'AgruparData'
        Value = 'False'
      end
      item
        Name = 'CordoZebrado'
        Value = '$00B3D9FF'
      end
      item
        Name = 'AgruparDocumentosPag'
        Value = 'False'
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      OnBeforePrint = 'Page1OnBeforePrint'
      object MasterData1: TfrxMasterData
        Height = 15.118120000000000000
        Top = 351.496290000000000000
        Width = 1122.520410000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset'
        RowCount = 0
        object mmoZebrado: TfrxMemoView
          Left = 105.826840000000000000
          Width = 1005.354980000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          AllowExpressions = False
          Clipped = False
          Color = 11786751
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          WordWrap = False
          Wysiwyg = False
        end
        object Memo4: TfrxMemoView
          Left = 366.614410000000000000
          Width = 30.236240000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset."obs"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 476.220780000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DataField = 'valorvencto'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset."valorvencto"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 536.693260000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset."valordesconto"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 597.165740000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          DataField = 'datapagto'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'DD/MM/YY'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset."datapagto"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 657.638220000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset."valorpagto"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 721.890230000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset."ValorJurosPagos"]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 774.803650000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset."ValorDescReceb"]')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 944.882500000000000000
          Width = 166.299320000000000000
          Height = 15.118120000000000000
          StretchMode = smActualHeight
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset."observacao"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 419.527830000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          DataField = 'datavencto'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'DD/MM/YY'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset."datavencto"]')
          ParentFont = False
        end
        object Memo80: TfrxMemoView
          Left = 396.850650000000000000
          Width = 22.677180000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[IIF(<frxDBDataset."dda">=True,'#39'X'#39','#39#39')]')
          ParentFont = False
        end
        object Memo83: TfrxMemoView
          Left = 109.606370000000000000
          Width = 18.897650000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset."numero"]')
          ParentFont = False
        end
        object Memo86: TfrxMemoView
          Left = 831.496600000000000000
          Width = 113.385900000000000000
          Height = 15.118120000000000000
          StretchMode = smActualHeight
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset."EventoDescricao"]'
            '['#39'LANCTO:'#39'] [frxDBDataset."UsuarioLancamento"]'
            
              '[IIF(<frxDBDataset."UsuarioPagamento"><>'#39#39','#39'PAGTO  :'#39'+<frxDBData' +
              'set."UsuarioPagamento">,'#39#39')]')
          ParentFont = False
        end
        object Memo84: TfrxMemoView
          Left = 132.283550000000000000
          Width = 230.551330000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset."complementoduplicata"]')
          ParentFont = False
        end
      end
      object CabecalhoMesAno: TfrxGroupHeader
        Height = 3.779530000000000000
        Top = 241.889920000000000000
        Width = 1122.520410000000000000
        Condition = 'IIF(<AgruparData>,<frxDBDataset."mesano">,'#39#39')'
        OutlineText = 'IIF(<AgruparData>,<frxDBDataset."mesano">,'#39#39')'
        StartNewPage = True
      end
      object RodapeDataLancto: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 415.748300000000000000
        Width = 1122.520410000000000000
        object Memo5: TfrxMemoView
          Left = 445.984540000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorvencto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 7.559060000000000000
          Width = 211.653680000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'DD/MM/YY'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'TOAIS EM [frxDBDataset."datalancto"]')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 506.457020000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valordesconto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 627.401980000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorpagto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 680.315400000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorJurosPagos">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 733.228820000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorDescReceb">,MasterData1,1)]')
          ParentFont = False
        end
      end
      object CabecalhoDataLancto: TfrxGroupHeader
        Top = 291.023810000000000000
        Width = 1122.520410000000000000
        Condition = 'IIF(<AgruparData>,<frxDBDataset."datalancto">,'#39#39')'
      end
      object RodapeMesAno: TfrxGroupFooter
        Height = 15.118120000000000000
        Top = 502.677490000000000000
        Width = 1122.520410000000000000
        object Memo8: TfrxMemoView
          Left = 445.984540000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorvencto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 7.559060000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'TOTAIS EM [frxDBDataset."mesano"]')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 506.457020000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valordesconto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Left = 627.401980000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorpagto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          Left = 680.315400000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorJurosPagos">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          Left = 733.228820000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorDescReceb">,MasterData1,1)]')
          ParentFont = False
        end
      end
      object CabecalhoDocumentopag: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Height = 15.118120000000000000
        ParentFont = False
        Top = 313.700990000000000000
        Width = 1122.520410000000000000
        OnBeforePrint = 'CabecalhoDocumentopagOnBeforePrint'
        Condition = 'frxDBDataset."documentopag"'
        DrillDown = True
        object mmoZebrado2: TfrxMemoView
          Left = 7.559060000000000000
          Width = 1103.622760000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          AllowExpressions = False
          Clipped = False
          Color = 11786751
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          WordWrap = False
          Wysiwyg = False
        end
        object Memo14: TfrxMemoView
          Left = 7.559060000000000000
          Width = 34.015770000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset."documentopag"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 56.692950000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '[IIF(<frxDBDataset."regimedecaixa">=True,<frxDBDataset."compleme' +
              'ntoduplicata">,<frxDBDataset."complemento">)]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 128.504020000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'DD/MM/YY'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset."datalancto"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 181.417440000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          DataField = 'fornecedor'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset."fornecedor"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 219.212740000000000000
          Width = 147.401670000000000000
          Height = 15.118120000000000000
          DataField = 'nomefornecedor'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset."nomefornecedor"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 476.220780000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset."valor"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 109.606370000000000000
          Width = 18.897650000000000000
          Height = 15.118120000000000000
          DataField = 'filialemissao'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset."filialemissao"]')
          ParentFont = False
        end
        object mmoTotalValorPagto: TfrxMemoView
          Left = 642.520100000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset."totalvalorpagto"]')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 695.433520000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset."totalvalorjurospagos"]')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 748.346940000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset."totalvalordescreceb"]')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 540.472790000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset."valordesconto"]')
          ParentFont = False
        end
        object Memo77: TfrxMemoView
          Left = 41.574830000000000000
          Width = 18.897650000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset."qtparcelas"]')
          ParentFont = False
        end
        object Memo78: TfrxMemoView
          Left = 366.614410000000000000
          Width = 30.236240000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[IIF(<frxDBDataset."qtparcelas">=1,<frxDBDataset."obs">,'#39'...'#39')]')
          ParentFont = False
        end
        object Memo79: TfrxMemoView
          Left = 396.850650000000000000
          Width = 22.677180000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[IIF(<frxDBDataset."qtparcelas">=1,IIF(<frxDBDataset."dda">=True' +
              ','#39'X'#39','#39#39'),'#39'...'#39')]')
          ParentFont = False
        end
        object Memo81: TfrxMemoView
          Left = 419.527830000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'DD/MM/YY'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[IIF(<frxDBDataset."qtparcelas">=1,formatdatetime('#39'dd/mm/yy'#39',<fr' +
              'xDBDataset."datavencto">),'#39'...'#39')]')
          ParentFont = False
        end
        object Memo82: TfrxMemoView
          Left = 600.945270000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'DD/MM/YY'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[IIF(<frxDBDataset."qtparcelas">=1, IIF(<frxDBDataset."datapagto' +
              '"><>0,formatdatetime('#39'dd/mm/yy'#39',<frxDBDataset."datapagto">),'#39#39'),' +
              #39'...'#39')]')
          ParentFont = False
        end
        object Memo87: TfrxMemoView
          Left = 831.496600000000000000
          Width = 113.385900000000000000
          Height = 15.118120000000000000
          StretchMode = smActualHeight
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset."EventoDescricao"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object RodapeDocumentopag: TfrxGroupFooter
        Height = 3.779530000000000000
        Top = 389.291590000000000000
        Width = 1122.520410000000000000
        object Line3: TfrxLineView
          Left = 7.559060000000000000
          Width = 1111.181820000000000000
          Frame.Typ = [ftTop]
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 80.881933700000000000
        Top = 18.897650000000000000
        Width = 1122.520410000000000000
        object Memo18: TfrxMemoView
          Left = 7.559060000000000000
          Top = 56.692950000000000000
          Width = 34.015770000000000000
          Height = 24.188983700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'DOCTO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 41.574830000000000000
          Top = 56.692950000000000000
          Width = 15.118120000000000000
          Height = 24.188983700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'NP')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 56.692950000000000000
          Top = 56.692950000000000000
          Width = 52.913420000000000000
          Height = 24.188983700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'S'#195#8240'RIE/NOTA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 109.606370000000000000
          Top = 56.692950000000000000
          Width = 18.897650000000000000
          Height = 24.188983700000000000
          StretchMode = smActualHeight
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'FIL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 128.504020000000000000
          Top = 56.692950000000000000
          Width = 52.913420000000000000
          Height = 24.188983700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'LAN'#195#8225'TO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 181.417440000000000000
          Top = 56.692950000000000000
          Width = 37.795300000000000000
          Height = 24.188983700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'C'#195#8220'DIGO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 721.890230000000000000
          Top = 68.031540000000000000
          Width = 52.913420000000000000
          Height = 12.850393700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'JUROS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 774.803650000000000000
          Top = 68.031540000000000000
          Width = 52.913420000000000000
          Height = 12.850393700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'DESCONTO')
          ParentFont = False
        end
        object fmvRua: TfrxMemoView
          Left = 132.283550000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[RAZAOFILIALBASE]')
          ParentFont = False
        end
        object fmvBairro: TfrxMemoView
          Left = 132.283550000000000000
          Top = 17.007885000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[ENDERECO_BAIRRO]')
          ParentFont = False
        end
        object fmvCidade: TfrxMemoView
          Left = 132.283550000000000000
          Top = 30.236240000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[CEP_CIDADE_UF]')
          ParentFont = False
        end
        object fpvLogo: TfrxPictureView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 120.944960000000000000
          Height = 45.354360000000000000
          Picture.Data = {
            07544269746D617016110000424D161100000000000036000000280000004800
            0000140000000100180000000000E0100000C40E0000C40E0000000000000000
            0000FFFFFFFFFFFFFCFCFCCECDCDFFFFFFE3E3E3CFCFD0FFFFFFF1F1F1CDCDCD
            FAFAFADDDDDDFFFFFFE4E3E3FFFFFFE4E4E4DBDCDCFFFFFFECECECFBFBFBFCFC
            FCCECECDF9F9F9FFFFFFB5B5B58D8D8E9E9E9DF8F8F8F4F4F4FAFAFAD0D0D0D3
            D3D4FEFEFEFFFFFFFFFFFFD7D7D8DBDADAFDFDFDF2F2F2DDDDDDFEFEFEE9E9E9
            FFFFFFFEFEFECFCFD0CFCFCFFAFAFAF0F0F1FAFAFADADADACECECEEEEEEEFFFF
            FFE7E7E7ECECECFEFEFED0D0D1E9E9E9F1F1F1FBFBFBE1E1E1FBFBFBF4F4F4FA
            FAFACFCFCFD4D4D5FFFFFFCECECECECECEFAFAFAFFFFFFFFFFFFFFFFFFFFFFFF
            A9A8A8D2D2D2DCDCDC999999DFDFDFF7F7F7585859F1F1F1FDFDFD3C3A3AFFFF
            FF545453ECECEC969696C7C7C7B2B2B2999A9AEBEBEB424140EDEDED414141FA
            FAF9585757E7E7E7868686D9D9D9C0C0C06F6F6FDDDDDD696969F9F9F9FFFFFF
            929394D0D0D0E7E7E7EFEFEFB3B3B23E3E3FF9F9F97B7B7AFFFFFFFFFFFFE0E0
            E0C7C7C68C8C8CAFAEAEDFDFDFECECECD8D7D73F3F3FFEFEFE4C4D4EF9F9F946
            4646DFDFDFF1F1F1A8A7A7E7E7E7484747DEDEDEBCBCBC545352E1E1E15A5A5A
            FFFFFFE0E0E0D3D3D37E7D7EFFFFFFFFFFFFFFFFFFFFFFFFABABABE2E2E1DADA
            DA7A7A79B9B9B9F6F6F668686AFEFEFEFFFFFF3E3D3DFEFEFE565658E8E8E8B0
            B0AFD8D8D8A5A5A4999A9AEBEBEB403F3EFCFCFB464646F8F8F8616161F2F2F2
            868686D9D9D9C0C0C0F3F3F3B3B3B3484949FAFAFAFFFFFF8E8F90AAAAA9C9C9
            C8EFEFEFB7B7B73E4043F1F1F1848485FFFFFFF9F9F94D4D4DC5C5C5F6F6F6B1
            B0B0DFDFDF4B4B4DC3C3C3E4E4E4FDFDFD555656FEFEFE40403FB9B9B9E1E1E1
            A8A8A8E6E6E64B4A4ADADADAC0C1C2F2F2F2B3B3B33F3F3FFFFFFF404040C4C4
            C4F5F5F5FFFFFFFFFFFFFFFFFFFFFFFF7474749C9B9AFFFFFFE2E2E2AFAFB0FE
            FEFEF0F0F0AEAEADF5F6F6C0BFBEB3B3B2FCFCFCFFFFFFD7D7D8C6C6C6FFFFFF
            989999EAEBEBFCFCFCAFAFAFF6F6F6FFFFFFEDEDEDB0B0AFE1E1E0F0F0F0E7E7
            E7D9D9D9AFAEAEDCDDDDFFFFFFFFFFFFFFFFFFC9C9C9C2C2C2FCFCFCB0B0AFB7
            B7B7B7B6B5FCFCFCFFFFFFFFFFFFD6D7D7AEAEADE7E7E5E0E0E0F2F2F2F2F2F2
            B0AFAFC2C2C2E6E6E63B3A3ADDDEDEFFFFFFB6B6B6DDDDDDE9E9E9B0AFAFB7B7
            B7BEBEBEFFFFFFD1D1D1AFAEAEE0E0E0FFFFFFDADADAAFAEAEE1E1E1FFFFFFFF
            FFFFFFFFFFFFFFFFEAEAEAF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9FAFAF9FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F3DDDAB6ECE9C4ECE9C4FD
            FDF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEAF7F7F7FFFFFFFFFFFFFFFFFFFFFF
            FFD6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFEFEFECDCDCEB2B2B1ADAEB0BABCBDFFFFFFFFFFFFFFFFFFF8F8F9CACB
            CCB3B4B4ADAEB0ADAEB0ADAEB0C6C7C8FFFFFFFFFFFFFFFFFFFEFEFED1D2D3B7
            B7B7B6B7B8FFFFFFFFFFFFFCFCF6ACA205ADA400ADA400F6F5E5FFFFFFFFFFFF
            EAE7BFE3DFA6E3DFA6E3DFA6E3DFA6E3DFA6E3DFA6E3DFA6E5E1AEECE9C5FCFC
            F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDECEBC6E4E0ABECE9C3FDFCF9FF
            FFFFFFFFFFFFFFFFFFFFFFFEFEFCE6E3B1E6E3B1EDEAC7FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFF7F6E6E8E7BAE6E3B1E6E3B1FFFFFFFFFFFFF3F3F41B1E231619
            20171A20171A203F4045FFFFFFFDFDFD8183850F1218161920171A20171A2017
            1A20171A205C5D61FFFFFFFFFFFF9FA0A10F1218161920171A20313337FFFFFF
            FFFFFFFCFCF6ACA205ADA400ADA400F6F5E5FFFFFFFFFFFFC2BA43ADA400ADA4
            00ADA400ADA400ADA400ADA400ADA400ADA400ADA400ABA104F9F8EFFFFFFFFF
            FFFFFFFEFCCDC869ACA104ADA400ADA400ADA400ACA103C8C156FEFEFBFFFFFF
            FFFFFFFAFAEFABA100ADA400C2BA45FFFFFFFFFFFFFFFFFFFFFFFFC1B944ACA3
            00ADA400ADA400ADA400FFFFFFFFFFFF838586171A20181B2111151B3C3E4160
            6265FFFFFF71737616191F181B210F13193034383D3F443D40443D4044797A7B
            FFFFFFBEBFC113161C181B2114181D1C20244D4F4CEEECCBEEECCBEDEAC7BCB5
            36BCB635BCB635E5E2B0E8E6BBE8E6BBC8C45ABDB63FBDB63FBDB63FBDB63FBD
            B63FBDB63FBDB640BBB438ADA400ADA400B9AF26FFFFFFFEFEFDBCB334ADA400
            ADA400ABA101AEA404ABA101ADA400ADA400B7AE26FEFEFAFFFFFFFAFAEFABA1
            00ADA400C2BA45FFFFFFFFFFFFFFFFFFF4F1DCACA300ADA400ADA400B0A608B1
            A811FFFFFFFFFFFF35383C181B2111151AE8E8E8FFFFFFFFFFFFF7F7F70E1217
            181B211C1F24F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD1F2227181B
            2115181EB6B7B9FFFFFFF2EFD4ACA300ADA400AFA409FEFDFAFFFFFFFFFFFFB1
            A810ADA400ADA400E5E2AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFB0A611ADA400AEA504FDFDF8D3CD78ACA300ADA400DCD791FFFFFFFFFF
            FFFFFFFFDFDC9EACA202ADA400CAC35BFFFFFFFAFAEFABA100ADA400C2BA45FF
            FFFFFFFFFFFFFFFFD4D07BADA400ADA400D3CD77FFFFFFFFFFFFFFFFFFFFFFFF
            282A2C181B2112151BF0F1F1FFFFFFFFFFFFB6B7B8181B21181B212F32368081
            857F80857F80857F80857F8085A6A7A8E6E6E613161C181B2124272CFFFFFFFF
            FFFFF2EFD4ACA300ADA400B0A709FEFDFAFFFFFFFFFFFFB1A810ADA400ADA400
            E5E2AFFFFFFFFFFFFFFEFEFEFDFDFBFBFAF3FBFAF3F9F9F0E9E6BCADA403ADA4
            00B0A707FEFDF9ACA202ADA400CDC767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4
            CF7BADA400ABA100FFFFFFFAFAEFABA100ADA400C2BA45FFFFFFFFFFFFFFFFFF
            CEC763ADA400ADA400E4E1ABFFFFFFFFFFFFFFFFFFFFFFFF292C31181B211216
            1BF1F1F2FFFFFFFFFFFF9A9C9E181B21181B21181B21181B21181B21181B2118
            1B21181B215D5E62DBDCDC11141A181B21494B4EFFFFFFFFFFFFF3F2DBB9B02A
            B9B02BBAB230D7D7D7D7D7D7D7D7D7BDB53EBEB53BBEB53BEBE8BEFFFFFFECE9
            C5ADA307ACA200ADA400ADA400ADA400ADA400ADA400ADA400CCC661FFFFFFAB
            A100ADA400EEECC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F5E5ACA300ADA400
            FBFAF2FAFAEFABA100ADA400C2BA45FFFFFFFFFFFFFFFFFFCEC762ADA400ADA4
            00E7E4B5FFFFFFFFFFFFFFFFFFFFFFFF292C31181B2112161BF1F1F2FFFFFFFF
            FFFFABABAB181B21181B21171A2014171C14171C14171C14171C14171C5C5E62
            E2E3E313161C181B21373A3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7171A
            1F13161B13161BE7E8EAFFFFFFFFFFFFFFFFFFFFFFFEA99E02ADA400ADA400B1
            A610B3A918B3A919B3A91ABBB32EE5E2AFFFFFFFFFFFFFABA100ADA400E5E1AD
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEBCAADA400ABA000FFFFFEFAFAEFABA1
            00ADA400C2BA45FFFFFFFFFFFFFFFFFFCEC762ADA400ADA400E7E4B5FFFFFFFF
            FFFFFFFFFFFFFFFF292C31181B2112161BF1F1F2FFFFFFFFFFFFDFDFDF14171D
            181B213C3E42F1F1F2F0F0F1F0F0F1F0F0F1F0F0F1F5F5F5F8F8F8171A1F181B
            210C0F15FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7171A1F181B21181B21E7
            E8E9FFFFFFFFFFFFFFFFFFF3F1D7ADA400ADA400B8B023FEFEFDFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3AA15ADA400B8B023FEFEFBFFFFFFFFFF
            FFFFFFFFFFFFFFBCB330ADA400AFA405FFFFFFFAFAEFABA100ADA400C2BA45FF
            FFFFFFFFFFFFFFFFCEC762ADA400ADA400E7E4B5FFFFFFFFFFFFEEEEEEE8E8E8
            272A2F181B2113171CDFDFDFE8E8E8ECECECFFFFFF111319181B21171A20ADAE
            B0E2E2E3E8E8E8E8E8E8E8E8E8EFEFEFFFFFFF4D4F52181B21181B2147494ECF
            D0D1E3E3E4E4E4E5E4E4E5DEDFDF27292D272B2F272B2FDADADAE6E7E7E6E7E7
            F5F5F5F5F3E0ADA400ADA400B0A70FF1EFD4F2F0D6F2F0D6F1F0D4F1F0D4F1F0
            D4F7F5E5FFFFFFF1EFD3ACA202ADA400AEA503DED999EDEAC5E1DEA1B0A70AAD
            A400ACA300E8E5B7F1EFD4EEEDCCACA200ADA400BFB73BF1EFD4F1EFD4FAF9EE
            CEC762ADA400ADA400DDD996F1EFD4F1EFD4595B5E15181E181B21181B21181B
            2115181E15181E3D3E43FFFFFFC7C7C90E1117181B2115191E15181E15181E15
            181E15181E5B5C5FFFFFFFF0F0F10A0E13181B21181B2115181E15181E15181E
            15181E16191EFAFAFAFFFFFFFFFFFF25292D15181E15181E9D9EA0FFFFFFABA0
            00ADA400ADA400ACA300ACA300ACA300ACA300ACA300ACA300CAC55CFFFFFFFF
            FFFFE4E1ADABA200ADA400ADA400ACA300ADA400ADA400ABA200DEDA99D2CD73
            ACA300ACA300ADA400ADA400ADA400ACA300ACA300E0DD9ECEC762ADA400ADA4
            00ADA400ACA300ACA3005A5D6015181D181B21181B21181B2116191E15181D3E
            4044FFFFFFFFFFFFE0E0E1494C4F212429171A1F15181D15181D15181D5C5F62
            FFFFFFFFFFFFF0F1F16B6D70282C301B1E2215181D15181D15181D161A1FF9F9
            F9FFFFFFFFFFFF272B2F181B21181B219E9FA2FFFFFFF9F9EDBEB83DAFA60BAD
            A403ADA403ADA403ADA403ADA403ADA403CBC55EFFFFFFFFFFFFFFFFFFFAF9EF
            CDC865B5AB1BAEA406B3AA18CBC562F9F7E9FFFFFFD2CD75AFA605AFA605ADA4
            00ADA400ADA400AFA605AFA605E0DCA0CEC762ADA400ADA400AEA502AFA605AF
            A605FDFDFDFCFCFC292C31181B2112161BF0F0F0FCFCFCFDFDFDFFFFFFFFFFFF
            FFFFFFFFFFFFFEFEFEFCFCFCFCFCFCFCFCFCFCFCFCFDFDFDFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFDFDFDFCFCFCFCFCFCFCFCFCFCFCFCFFFFFFFFFFFFFFFFFF2A
            2C2F15191E15191EA0A0A0FFFFFFFFFFFFFFFFFFFEFEFDFEFEFCFEFEFCFEFEFC
            FEFEFCFEFEFCFEFEFCFEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
            FDFFFFFEFFFFFFFFFFFFFFFFFFFFFEFEFEFEFDFBFBF3ABA100ADA400BEB639FE
            FEFDFEFEFDFFFFFECEC762ADA400ADA400E6E3B3FEFEFDFEFEFDFFFFFFFFFFFF
            292C31181B2112161BF1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFDFDF8AAA000ADA400ADA400C4BC4BC7C152ECE9C1
            CEC762ADA400ADA400E7E4B5FFFFFFFFFFFFFFFFFFFFFFFF292C31181B211216
            1BF1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFBFB740ACA200ADA400ADA400ADA400E2DEA3CEC762ADA400ADA4
            00E7E4B5FFFFFFFFFFFFFFFFFFFFFFFF67696B5A5C60585A5EF5F5F5FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
            FCE6E3B1CBC55DC5C34EC5C34EEAE7BEDDD893C5C34EC5C34EEEECCAFFFFFFFF
            FFFF}
        end
        object Memo236: TfrxMemoView
          Left = 1050.709340000000000000
          Top = 22.677180000000000000
          Width = 60.472480000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Page#]')
          ParentFont = False
        end
        object Memo237: TfrxMemoView
          Left = 1012.914040000000000000
          Top = 22.677180000000000000
          Width = 34.015770000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'P'#195#129'G.:')
          ParentFont = False
        end
        object Memo238: TfrxMemoView
          Left = 1012.914040000000000000
          Top = 7.559060000000000000
          Width = 34.015770000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'DATA:')
          ParentFont = False
        end
        object Memo239: TfrxMemoView
          Left = 1050.709340000000000000
          Top = 7.559060000000000000
          Width = 60.472480000000000000
          Height = 11.338582680000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[Date]')
          ParentFont = False
        end
        object mmoTitulo: TfrxMemoView
          ShiftMode = smDontShift
          Left = 393.071120000000000000
          Top = 7.559060000000000000
          Width = 570.709030000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[TITULO]')
          ParentFont = False
          WordWrap = False
        end
        object Memo240: TfrxMemoView
          ShiftMode = smDontShift
          Left = 393.071120000000000000
          Top = 26.456710000000000000
          Width = 570.709030000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUBTITULO]')
          ParentFont = False
          WordWrap = False
        end
        object Memo34: TfrxMemoView
          Left = 219.212740000000000000
          Top = 56.692950000000000000
          Width = 147.401670000000000000
          Height = 24.188983700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'FORNECEDOR')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 657.638220000000000000
          Top = 68.031540000000000000
          Width = 64.252010000000000000
          Height = 12.850393700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'VALOR')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 600.945270000000000000
          Top = 68.031540000000000000
          Width = 56.692925590000000000
          Height = 12.850393700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'DATA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 366.614410000000000000
          Top = 56.692950000000000000
          Width = 234.330835590000000000
          Height = 12.850393700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'VENCIMENTO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 419.527830000000000000
          Top = 68.031540000000000000
          Width = 56.692925590000000000
          Height = 12.850393700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'DATA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 476.220780000000000000
          Top = 68.031540000000000000
          Width = 64.252010000000000000
          Height = 12.850393700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'VALOR')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 600.945270000000000000
          Top = 56.692950000000000000
          Width = 226.771775590000000000
          Height = 12.850393700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'PAGAMENTO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 540.472790000000000000
          Top = 68.031540000000000000
          Width = 60.472480000000000000
          Height = 12.850393700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'DESCONTO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 396.850650000000000000
          Top = 68.031540000000000000
          Width = 22.677180000000000000
          Height = 12.850393700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'DDA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 366.614410000000000000
          Top = 68.031540000000000000
          Width = 30.236240000000000000
          Height = 12.850393700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'SIT.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 944.882500000000000000
          Top = 56.692950000000000000
          Width = 166.299320000000000000
          Height = 24.188983700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'OBSERVA'#195#8225#195#402'O ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo85: TfrxMemoView
          Left = 827.717070000000000000
          Top = 56.692950000000000000
          Width = 117.165430000000000000
          Height = 24.188983700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'EVENTO / LANCTO / PAGTO')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object CabecalhoGrupoFilial: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 158.740260000000000000
        Visible = False
        Width = 1122.520410000000000000
        OnBeforePrint = 'CabecalhoGrupoFilialOnBeforePrint'
        Condition = 'IIF(<AgruparGrupoFilial>,<frxDBDataset."grupofilialemissao">,'#39#39')'
        object Memo40: TfrxMemoView
          Left = 109.606370000000000000
          Width = 982.677800000000000000
          Height = 15.118120000000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              '[frxDBDataset."grupofilialemissao"] [frxDBDataset."nomegrupofili' +
              'alemissao"]')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 18.897650000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Grupo de Filial')
          ParentFont = False
        end
      end
      object RodapeGrupoFilial: TfrxGroupFooter
        Height = 26.456710000000000000
        Top = 589.606680000000000000
        Visible = False
        Width = 1122.520410000000000000
        object Memo66: TfrxMemoView
          Left = 11.338590000000000000
          Top = 3.779530000000000000
          Width = 408.189240000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              'TOTAL GRUPO DE FILIAL [frxDBDataset."grupofilialemissao"] [frxDB' +
              'Dataset."nomegrupofilialemissao"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          Left = 11.338590000000000000
          Top = 22.677180000000000000
          Width = 1100.708720000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
        object Memo42: TfrxMemoView
          Left = 445.984540000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorvencto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 506.457020000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valordesconto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo68: TfrxMemoView
          Left = 627.401980000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorpagto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo69: TfrxMemoView
          Left = 680.315400000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorJurosPagos">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo70: TfrxMemoView
          Left = 733.228820000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorDescReceb">,MasterData1,1)]')
          ParentFont = False
        end
      end
      object CabecalhoFilial: TfrxGroupHeader
        Height = 18.897637800000000000
        Top = 200.315090000000000000
        Visible = False
        Width = 1122.520410000000000000
        OnBeforePrint = 'CabecalhoFilialOnBeforePrint'
        Condition = 'IIF(<AgruparFilial>,<frxDBDataset."filialemissao">,'#39#39')'
        object Memo208: TfrxMemoView
          Left = 19.811070000000000000
          Top = 2.330550000000000000
          Width = 82.236240000000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            'Filial')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo209: TfrxMemoView
          Left = 112.086580000000000000
          Top = 2.330550000000000000
          Width = 985.087200000000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          HideZeros = True
          Memo.UTF8 = (
            
              '[frxDBDataset."filialemissao"] [frxDBDataset."nomefilialemissao"' +
              ']')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object RodapeFilial: TfrxGroupFooter
        Height = 26.456710000000000000
        Top = 540.472790000000000000
        Visible = False
        Width = 1122.520410000000000000
        object Memo43: TfrxMemoView
          Left = 11.338590000000000000
          Top = 3.779530000000000000
          Width = 408.189240000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              'TOTAL FILIAL [frxDBDataset."filialemissao"] [frxDBDataset."nomef' +
              'ilialemissao"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Left = 11.338590000000000000
          Top = 22.677180000000000000
          Width = 1100.708720000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
        object Memo44: TfrxMemoView
          Left = 445.984540000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorvencto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 506.457020000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valordesconto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          Left = 627.401980000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorpagto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          Left = 680.315400000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorJurosPagos">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          Left = 733.228820000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorDescReceb">,MasterData1,1)]')
          ParentFont = False
        end
      end
      object CabecalhoFornecedor: TfrxGroupHeader
        Top = 268.346630000000000000
        Visible = False
        Width = 1122.520410000000000000
        Condition = 
          'IIF(<AgruparFornecedor>,inttostr(<frxDBDataset."fornecedor">)+<f' +
          'rxDBDataset."tipofornecedor">,'#39#39')'
      end
      object RodapeFornecedor: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 457.323130000000000000
        Visible = False
        Width = 1122.520410000000000000
        object Memo45: TfrxMemoView
          Left = 11.338590000000000000
          Width = 408.189240000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              'TOTAL FORNECEDOR [frxDBDataset."tipofornecedor"][frxDBDataset."f' +
              'ornecedor"] [frxDBDataset."nomefornecedor"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 445.984540000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorvencto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 506.457020000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valordesconto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Left = 627.401980000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorpagto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Left = 680.315400000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorJurosPagos">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          Left = 733.228820000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorDescReceb">,MasterData1,1)]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        Height = 22.677180000000000000
        Top = 638.740570000000000000
        Width = 1122.520410000000000000
        object Memo71: TfrxMemoView
          Left = 11.338590000000000000
          Width = 408.189240000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'TOTAL GERAL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line4: TfrxLineView
          Left = 11.338590000000000000
          Top = 18.897650000000000000
          Width = 1100.708720000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
        object Memo72: TfrxMemoView
          Left = 445.984540000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorvencto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo73: TfrxMemoView
          Left = 506.457020000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valordesconto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo74: TfrxMemoView
          Left = 627.401980000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorpagto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo75: TfrxMemoView
          Left = 680.315400000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorJurosPagos">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo76: TfrxMemoView
          Left = 733.228820000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorDescReceb">,MasterData1,1)]')
          ParentFont = False
        end
      end
    end
  end
  object tecQuery1: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeOpen = qryDuplicatasBeforeOpen
    AfterOpen = qryDuplicatasAfterOpen
    OnCalcFields = qryDuplicatasCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'TipoRelatorio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Periodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GrupoFilial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fornecedor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TipoFornecimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GrupoFornecedor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Banco'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Previsao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Evento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Autorizado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TipoPagamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Administrador'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Periodo_Adiantamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Banco_Adiantamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Autorizado_Adiantamento_nonononon'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TipoPagamento_Adiantamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Ordenacao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select selecao.*,'
      '       to_char(datalancto, '#39'MM/YYYY'#39') as mesAno,'
      ''
      '       (select sum(dp.valorpagto)'
      '        from duplicatas dp'
      
        '        where dp.documentopag = selecao.documentopag) as TotalVa' +
        'lorPagto,'
      ''
      
        '       (select sum(case when dp.valorpagto>dp.valorvencto then d' +
        'p.valorpagto-dp.valorvencto else 0.00 end)'
      '        from duplicatas dp'
      
        '        where dp.documentopag = selecao.documentopag) as TotalVa' +
        'lorJurosPagos,'
      ''
      
        '       (select sum(case when coalesce(dp.valorpagto,0)<>0 and dp' +
        '.valorpagto<dp.valorvencto then dp.valorvencto-dp.valorpagto els' +
        'e 0.00 end)'
      '        from duplicatas dp'
      
        '        where dp.documentopag = selecao.documentopag) as TotalVa' +
        'lorDescReceb'
      ''
      'from'
      '('
      '('
      '  Select t.documentopag,'
      '         t.numero,'
      '         d.filialemissao,'
      '         f.nome as nomefilialemissao,'
      '         fgf.grupo as grupofilialemissao,'
      '         gf.descricao as nomegrupofilialemissao,'
      '         n.numero as nota,'
      '         n.serie,'
      '         d.complemento,'
      '         d.fornecedor,'
      '         d.tipofornecedor,'
      
        '         (Select coalesce(v.razao,v.nome) as nome  From vfornece' +
        'dores v'
      '                        where (d.fornecedor = v.codigo)  and'
      
        '                                  (d.tipofornecedor = v.tipo))as' +
        ' nomefornecedor,'
      '         d.emissao,'
      
        '         case when d.regimedecaixa then t.datavencto else d.data' +
        'lancto end as datalancto,'
      '         d.previsao,'
      '         t.bancocobranca,'
      
        '         (select b.sigla from bancos b where b.codigo = t.bancoc' +
        'obranca) as siglabancocobranca,'
      '         t.datavencto,'
      '         t.valorvencto,'
      '         t.valordesconto,'
      '         t.datapagto,'
      '         t.valorpagto,'
      
        '         (select b.sigla from bancos b join contas c on c.banco ' +
        '= b.codigo where c.conta = t.contapagto) as siglabancopagto,'
      '         t.contapagto,'
      '         t.observacao,'
      '         false as adiantamento,'
      
        '         cast(cast(abs(t.datavencto - current_date)as varchar) |' +
        '| cast('#39' - D'#39' as varchar) as varchar) as obs,'
      
        '         case When :AgruparData then True else False end as Dife' +
        'renciar,'
      
        '       (select e.codigo from eventos e where e.codigo=coalesce(t' +
        '.evento,d.evento)) as evento,'
      
        '       (select e.descricao from eventos e where e.codigo=coalesc' +
        'e(t.evento,d.evento)) as descricao_evento,'
      '       t.dda,'
      '       d.regimedecaixa'
      '  From  ((duplicatas t'
      '         left join notaspag n'
      '         on n.documentopag = t.documentopag)'
      ''
      '         join (documentospag d'
      '               join (filiais f'
      '                     left join (filiaisgruposfiliais fgf'
      '                                left join gruposfiliais gf'
      '                                on fgf.grupo=gf.codigo )'
      '                     on f.codigo=fgf.filial)'
      '               on d.filialemissao=f.codigo)'
      '         on t.documentopag = d.numero)'
      ''
      '  where :Condicao_incluir_duplicatas'
      ''
      ''
      '  %TipoRelatorio'
      '  %Periodo'
      '  %Filial'
      '  %GrupoFilial'
      '  %Fornecedor'
      '  %TipoFornecimento'
      '  %GrupoFornecedor'
      '  %Banco'
      '  %Previsao'
      '  %Evento'
      '  %Autorizado'
      '  %TipoPagamento'
      '  %Administrador'
      '  %DDA'
      ''
      ')'
      ''
      'union all'
      ''
      '('
      ''
      '  Select d.numero as documentopag,'
      '         cast(1 as integer) as numero,'
      '         d.filialemissao,'
      '         f.nome as nomefilialemissao,'
      '         fgf.grupo as grupofilialemissao,'
      '         gf.descricao as nomegrupofilialemissao,'
      '         cast(null as integer) as nota,'
      '         cast(null as varchar(3)) as serie,'
      '         d.complemento,'
      '         d.fornecedor,'
      '         d.tipofornecedor,'
      
        '         (Select coalesce(v.razao,v.nome) as nome  From vfornece' +
        'dores v'
      '                        where (d.fornecedor = v.codigo)  and'
      
        '                                  (d.tipofornecedor = v.tipo))as' +
        ' nomefornecedor,'
      '         d.emissao,'
      '         d.datalancto,'
      '         d.previsao,'
      
        '        (select ct.banco from contas ct where ct.conta = d.conta' +
        'pagto) as bancocobranca,'
      
        '        (select b.sigla from bancos b where b.codigo = (select c' +
        't.banco from contas ct where ct.conta = d.contapagto)) as siglab' +
        'ancocobranca,'
      '         d.datalancto as datavencto,'
      ''
      '         d.valor as valorvencto,'
      '         0.00 as valordesconto,'
      ''
      '         d.datalancto as datapagto,'
      '         d.valor as valorpagto,'
      ''
      
        '         (select b.sigla from bancos b where b.codigo = (select ' +
        'ct.banco from contas ct where ct.conta = d.contapagto)) as sigla' +
        'bancopagto,'
      ''
      '         d.contapagto,'
      '         d.referencia as observacao,'
      '         true as adiantamento,'
      '         cast(null as varchar) as obs,'
      
        '         case When :AgruparData then True else False end as Dife' +
        'renciar,'
      
        '        (select e.codigo from eventos e where e.codigo=d.evento)' +
        ' as evento,'
      
        '        (select e.descricao from eventos e where e.codigo=d.even' +
        'to) as descricao_evento,'
      '        false as dda,'
      '        d.regimedecaixa'
      ''
      
        '  From (documentospag d join (filiais f left join (filiaisgrupos' +
        'filiais fgf'
      
        '                                                   left join gru' +
        'posfiliais gf'
      
        '                                                   on fgf.grupo=' +
        'gf.codigo)'
      '                              on f.codigo=fgf.filial)'
      '        on d.filialemissao=f.codigo)'
      ''
      
        '  where coalesce(d.adiantamento,false) and :Condicao_incluir_Adi' +
        'antamento'
      ''
      '  %Periodo_Adiantamento'
      '  %Filial'
      '  %GrupoFilial'
      '  %Fornecedor'
      '  %TipoFornecimento'
      '  %GrupoFornecedor'
      '  %Banco_Adiantamento'
      '  %Previsao'
      '  %Evento'
      '  %Autorizado_Adiantamento_nonononon'
      '  %TipoPagamento_Adiantamento'
      '  %Administrador'
      ''
      ')'
      ''
      ') as selecao'
      ''
      ''
      ''
      '%Ordenacao'
      ''
      '')
    RequestLive = True
    Left = 936
    Top = 9
    ParamData = <
      item
        DataType = ftString
        Name = 'AgruparData'
        ParamType = ptUnknown
        Value = 'false'
      end
      item
        DataType = ftString
        Name = 'Condicao_incluir_duplicatas'
        ParamType = ptUnknown
        Value = 'true'
      end
      item
        DataType = ftString
        Name = 'Condicao_incluir_Adiantamento'
        ParamType = ptUnknown
        Value = 'false'
      end>
    object IntegerField1: TIntegerField
      FieldName = 'documentopag'
      Required = True
      DisplayFormat = '0'
    end
    object IntegerField2: TIntegerField
      FieldName = 'filialemissao'
      Required = True
      DisplayFormat = '0'
    end
    object IntegerField3: TIntegerField
      FieldName = 'nota'
      DisplayFormat = '0'
    end
    object StringField1: TStringField
      FieldName = 'serie'
      Size = 3
    end
    object IntegerField4: TIntegerField
      FieldName = 'fornecedor'
      Required = True
      DisplayFormat = '0'
    end
    object StringField2: TStringField
      FieldName = 'tipofornecedor'
      Required = True
      Size = 1
    end
    object DateField1: TDateField
      Alignment = taCenter
      FieldName = 'datavencto'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object FloatField1: TFloatField
      FieldName = 'valorvencto'
      Required = True
      DisplayFormat = '0.00'
    end
    object FloatField2: TFloatField
      FieldName = 'valordesconto'
      DisplayFormat = '0.00'
    end
    object DateField2: TDateField
      Alignment = taCenter
      FieldName = 'datapagto'
      EditMask = '99/99/9999;1; '
    end
    object FloatField3: TFloatField
      FieldName = 'valorpagto'
      DisplayFormat = '0.00'
    end
    object IntegerField5: TIntegerField
      FieldName = 'numero'
      Required = True
      DisplayFormat = '0'
    end
    object BooleanField1: TBooleanField
      FieldName = 'previsao'
      Required = True
    end
    object DateField3: TDateField
      Alignment = taCenter
      FieldName = 'emissao'
      EditMask = '99/99/9999;1; '
    end
    object StringField3: TStringField
      FieldName = 'nomefilialemissao'
      Size = 40
    end
    object IntegerField6: TIntegerField
      FieldName = 'grupofilialemissao'
      DisplayFormat = '0'
    end
    object StringField4: TStringField
      FieldName = 'nomegrupofilialemissao'
      Size = 30
    end
    object StringField5: TStringField
      FieldName = 'nomefornecedor'
      Size = 40
    end
    object CurrencyField1: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ValorJurosPagos'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object CurrencyField2: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ValorDescReceb'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object StringField6: TStringField
      FieldName = 'observacao'
      Size = 512
    end
    object IntegerField7: TIntegerField
      FieldName = 'ContaPagto'
    end
    object BooleanField2: TBooleanField
      FieldName = 'diferenciar'
    end
    object IntegerField8: TIntegerField
      FieldName = 'bancocobranca'
    end
    object StringField7: TStringField
      FieldName = 'siglabancocobranca'
      Size = 50
    end
    object StringField8: TStringField
      FieldName = 'siglabancopagto'
      Size = 7
    end
    object StringField9: TStringField
      FieldName = 'obs'
      Size = 8
    end
    object IntegerField9: TIntegerField
      FieldName = 'evento'
    end
    object StringField10: TStringField
      FieldName = 'descricao_evento'
      Size = 50
    end
    object StringField11: TStringField
      FieldName = 'complemento'
      Size = 15
    end
    object StringField12: TStringField
      FieldKind = fkCalculated
      FieldName = 'documento'
      Calculated = True
    end
    object BooleanField3: TBooleanField
      FieldName = 'adiantamento'
    end
    object BooleanField4: TBooleanField
      FieldName = 'dda'
    end
    object DateField4: TDateField
      FieldName = 'datalancto'
    end
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset'
    CloseDataSource = False
    FieldAliases.Strings = (
      'documentopag=documentopag'
      'filialemissao=filialemissao'
      'nomefilialemissao=nomefilialemissao'
      'cnpjfilial=cnpjfilial'
      'grupofilialemissao=grupofilialemissao'
      'nomegrupofilialemissao=nomegrupofilialemissao'
      'nota=nota'
      'serie=serie'
      'fornecedor=fornecedor'
      'tipofornecedor=tipofornecedor'
      'nomefornecedor=nomefornecedor'
      'cnpj_cpf_fornecedor=cnpj_cpf_fornecedor'
      'datavencto=datavencto'
      'valorvencto=valorvencto'
      'valordesconto=valordesconto'
      'datapagto=datapagto'
      'valorpagto=valorpagto'
      'numero=numero'
      'previsao=previsao'
      'emissao=emissao'
      'ValorJurosPagos=ValorJurosPagos'
      'ValorDescReceb=ValorDescReceb'
      'observacao=observacao'
      'ContaPagto=ContaPagto'
      'diferenciar=diferenciar'
      'bancocobranca=bancocobranca'
      'siglabancocobranca=siglabancocobranca'
      'siglabancopagto=siglabancopagto'
      'obs=obs'
      'evento=evento'
      'descricao_evento=descricao_evento'
      'complemento=complemento'
      'documento=documento'
      'adiantamento=adiantamento'
      'dda=dda'
      'datalancto=datalancto'
      'mesano=mesano'
      'valor=valor'
      'regimedecaixa=regimedecaixa'
      'totalvalorjurospagos=totalvalorjurospagos'
      'totalvalordescreceb=totalvalordescreceb'
      'totalvalorpagto=totalvalorpagto'
      'qtparcelas=qtparcelas'
      'complementoduplicata=complementoduplicata'
      'EventoDescricao=EventoDescricao'
      'UsuarioLancamento=UsuarioLancamento'
      'UsuarioPagamento=UsuarioPagamento')
    DataSet = qryDuplicatas
    Left = 840
    Top = 32
  end
  object frxResumoDuplicatasporCompetencia: TfrxReport
    Version = '4.0.11'
    DataSet = frxDBDataset2
    DataSetName = 'frxDBDataset'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43735.424366458300000000
    ReportOptions.LastChange = 45512.382358368060000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      ' LINHA: INTEGER;'
      
        ' vTGPrecoaPrazo_d, vTGPrecoCusto_d, vTGMarkup_d, vpMargem_d : Cu' +
        'rrency;'
      
        ' vTGPrecoaPrazo_v, vTGPrecoCusto_v, vTGMarkup_v, vpMargem_v : Cu' +
        'rrency;'
      
        ' vTGPrecoaPrazo_g, vTGPrecoCusto_g, vTGMarkup_g, vpMargem_g, vTo' +
        'talVencimento : Currency;'
      '  vZebrar, vZebrar2 : boolean;'
      ''
      'procedure GroupFooter3OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure Memo11OnAfterData(Sender: TfrxComponent);'
      'begin'
      
        '  vTotalVencimento := SUM(<frxDBDataset."valorvencto">,MasterDat' +
        'a1,1);'
      'end;'
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <AgruparGrupoFilial> then'
      '  begin'
      '     CabecalhoGrupoFilial.visible:=true;'
      '     RodapeGrupoFilial.visible:=true;'
      
        '//     CabecalhoGrupoFilial.OutLineText := IIF(<AgruparGrupoFili' +
        'al>,<frxDBDataset."grupofilialemissao">,'#39#39');'
      '  end'
      '  else'
      '  begin'
      '//    CabecalhoGrupoFilial.OutLineText := '#39#39';'
      '    CabecalhoGrupoFilial.visible:=false;'
      '    RodapeGrupoFilial.visible:=false;'
      '  end;'
      ''
      '  if <AgruparFilial> then'
      '  begin'
      
        '//   CabecalhoFilial.OutLineText := IIF(<AgruparFilial>,<frxDBDa' +
        'taset."filialemissao">,'#39#39');'
      '   CabecalhoFilial.visible:=true;'
      '   RodapeFilial.visible:=true;'
      '  end'
      '  else'
      '  begin'
      '//    CabecalhoFilial.OutLineText := '#39#39';'
      '    CabecalhoFilial.visible:=false;'
      '    RodapeFilial.visible:=false;'
      '  end;'
      ''
      '  if <AgruparFornecedor> then'
      '  begin'
      '   CabecalhoFornecedor.visible:=true;'
      '   RodapeFornecedor.visible:=true;'
      '  end'
      '  else'
      '  begin'
      '    CabecalhoFornecedor.visible:=false;'
      '    RodapeFornecedor.visible:=false;'
      '  end;'
      ''
      '  if <AgruparData> then'
      '  begin'
      '   CabecalhoDataLancto.visible:=true;'
      '   RodapeDataLancto.visible:=true;'
      '   CabecalhoMesAno.visible:=true;'
      '   RodapeMesAno.visible:=true;'
      '  end'
      '  else'
      '  begin'
      '    CabecalhoDataLancto.visible:=false;'
      '    RodapeDataLancto.visible:=false;'
      '    CabecalhoMesAno.visible:=false;'
      '    RodapeMesAno.visible:=false;'
      '  end;'
      ''
      ''
      ''
      'end;'
      ''
      'procedure Memo47OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  mmoTotalValorPagto.text := floattostr(SUM(<frxDBDataset."valor' +
        'pagto">,MasterData1,1));'
      'end;'
      ''
      
        'procedure CabecalhoDocumentopagOnBeforePrint(Sender: TfrxCompone' +
        'nt);'
      'begin'
      '  if vZebrar2 then'
      '  begin'
      '    mmoZebrado2.color := <CordoZebrado>;'
      '    vZebrar2 := false;'
      '  end'
      '  else'
      '  begin'
      '    mmoZebrado2.color := clwhite;'
      '    vZebrar2 := true;'
      '  end;'
      ''
      'end;'
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if vZebrar then'
      '  begin'
      '    mmoZebrado.color := <CordoZebrado>;'
      '    vZebrar := false;'
      '  end'
      '  else'
      '  begin'
      '    mmoZebrado.color := clwhite;'
      '    vZebrar := true;'
      '  end;'
      ''
      'end;'
      ''
      'procedure CabecalhoFilialOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ' if <AgruparFilial> then'
      ' begin'
      '   Outline.LevelRoot;'
      
        '   Outline.AddItem(inttostr(<frxDBDataset."filialemissao">)+'#39' - ' +
        #39'+<frxDBDataset."nomefilialemissao">);'
      ' end;'
      ''
      'end;'
      ''
      
        'procedure CabecalhoGrupoFilialOnBeforePrint(Sender: TfrxComponen' +
        't);'
      'begin'
      ' if <AgruparGrupoFilial> then'
      ' begin'
      '   Outline.LevelRoot;'
      
        '   Outline.AddItem(inttostr(<frxDBDataset."grupofilialemissao">)' +
        '+'#39' - '#39'+<frxDBDataset."nomegrupofilialemissao">);'
      ' end;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxDuplicatasporCompetenciaGetValue
    Left = 800
    Top = 232
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset'
      end>
    Variables = <
      item
        Name = ' Relatorio'
        Value = Null
      end
      item
        Name = 'ENDERECO_BAIRRO'
        Value = #39'RUA ESTEVES JUNIOR, 748 - CENTRO'#39
      end
      item
        Name = 'RAZAOFILIALBASE'
        Value = #39'UNIANDRA COMERCIO DE ARTIGOS DE VESTUARIO LTDA EPP'#39
      end
      item
        Name = 'CEP_CIDADE_UF'
        Value = #39'88015-130  FLORIANOPOLIS  SC'#39
      end
      item
        Name = 'TITULO'
        Value = #39'RESUMO CONTAS POR DATA DE COMPET'#202'NCIA'#39
      end
      item
        Name = 'SUBTITULO'
        Value = #39' SEM ADIANTAMENTOS ENTRE: 01/01/2019 E 31/03/2019'#39
      end
      item
        Name = 'OUTRAS'
        Value = Null
      end
      item
        Name = 'DATA'
        Value = Null
      end
      item
        Name = 'AgruparGrupoFilial'
        Value = 'False'
      end
      item
        Name = 'AgruparFilial'
        Value = 'True'
      end
      item
        Name = 'AgruparFornecedor'
        Value = 'False'
      end
      item
        Name = 'AgruparData'
        Value = 'True'
      end
      item
        Name = 'CordoZebrado'
        Value = '$00B3D9FF'
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      OnBeforePrint = 'Page1OnBeforePrint'
      object MasterData1: TfrxMasterData
        Height = 15.118120000000000000
        Top = 351.496290000000000000
        Width = 1122.520410000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset'
        RowCount = 0
        object mmoZebrado: TfrxMemoView
          Left = 400.630180000000000000
          Width = 710.551640000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          AllowExpressions = False
          Clipped = False
          Color = 11786751
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          WordWrap = False
          Wysiwyg = False
        end
        object Memo4: TfrxMemoView
          Left = 404.409710000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset."obs"]')
          ParentFont = False
        end
        object CheckBox1: TfrxCheckBoxView
          Left = 464.882190000000000000
          Width = 26.456710000000000000
          Height = 15.118120000000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = 'dda'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
        end
        object Memo2: TfrxMemoView
          Left = 548.031850000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DataField = 'valorvencto'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset."valorvencto"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 616.063390000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset."valordesconto"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 684.094930000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          DataField = 'datapagto'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'DD/MM/YY'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset."datapagto"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 740.787880000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset."valorpagto"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 805.039890000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset."ValorJurosPagos"]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 857.953310000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset."ValorDescReceb"]')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 910.866730000000000000
          Width = 200.315090000000000000
          Height = 15.118120000000000000
          DataField = 'observacao'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset."observacao"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 491.338900000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          DataField = 'datavencto'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'DD/MM/YY'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset."datavencto"]')
          ParentFont = False
        end
      end
      object CabecalhoMesAno: TfrxGroupHeader
        Height = 3.779530000000000000
        Top = 241.889920000000000000
        Width = 1122.520410000000000000
        Condition = 'IIF(<AgruparData>,<frxDBDataset."mesano">,'#39#39')'
        OutlineText = 'IIF(<AgruparData>,<frxDBDataset."mesano">,'#39#39')'
        StartNewPage = True
      end
      object RodapeDataLancto: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 415.748300000000000000
        Width = 1122.520410000000000000
        object Memo5: TfrxMemoView
          Left = 517.795610000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorvencto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 7.559060000000000000
          Width = 211.653680000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'DD/MM/YY'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'TOAIS EM [frxDBDataset."datalancto"]')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 589.606680000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valordesconto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 710.551640000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorpagto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 763.465060000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorJurosPagos">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 816.378480000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorDescReceb">,MasterData1,1)]')
          ParentFont = False
        end
      end
      object CabecalhoDataLancto: TfrxGroupHeader
        Top = 291.023810000000000000
        Width = 1122.520410000000000000
        Condition = 'IIF(<AgruparData>,<frxDBDataset."datalancto">,'#39#39')'
      end
      object RodapeMesAno: TfrxGroupFooter
        Height = 15.118120000000000000
        Top = 502.677490000000000000
        Width = 1122.520410000000000000
        object Memo8: TfrxMemoView
          Left = 517.795610000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorvencto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 7.559060000000000000
          Width = 211.653680000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'TOTAIS EM [frxDBDataset."mesano"]')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 589.606680000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valordesconto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Left = 710.551640000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorpagto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          Left = 763.465060000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorJurosPagos">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          Left = 816.378480000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorDescReceb">,MasterData1,1)]')
          ParentFont = False
        end
      end
      object CabecalhoDocumentopag: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Height = 15.118120000000000000
        ParentFont = False
        Top = 313.700990000000000000
        Visible = False
        Width = 1122.520410000000000000
        OnBeforePrint = 'CabecalhoDocumentopagOnBeforePrint'
        Condition = 'frxDBDataset."documentopag"'
        DrillDown = True
        object mmoZebrado2: TfrxMemoView
          Left = 7.559060000000000000
          Width = 1103.622760000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          AllowExpressions = False
          Clipped = False
          Color = 11786751
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          WordWrap = False
          Wysiwyg = False
        end
        object Memo14: TfrxMemoView
          Left = 7.559060000000000000
          Width = 49.133890000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset."documentopag"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 75.590600000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset."documento"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 166.299320000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'DD/MM/YY'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset."datalancto"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 219.212740000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          DataField = 'fornecedor'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset."fornecedor"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 260.787570000000000000
          Width = 170.078850000000000000
          Height = 15.118120000000000000
          DataField = 'nomefornecedor'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset."nomefornecedor"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 532.913730000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset."valor"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 136.063080000000000000
          Width = 30.236240000000000000
          Height = 15.118120000000000000
          DataField = 'filialemissao'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset."filialemissao"]')
          ParentFont = False
        end
        object mmoTotalValorPagto: TfrxMemoView
          Left = 725.669760000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset."totalvalorpagto"]')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 778.583180000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset."totalvalorjurospagos"]')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 831.496600000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset."totalvalordescreceb"]')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 604.724800000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset."valordesconto"]')
          ParentFont = False
        end
      end
      object RodapeDocumentopag: TfrxGroupFooter
        Height = 3.779530000000000000
        Top = 389.291590000000000000
        Visible = False
        Width = 1122.520410000000000000
        object Line3: TfrxLineView
          Left = 7.559060000000000000
          Width = 1111.181820000000000000
          Frame.Typ = [ftTop]
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 80.881933700000000000
        Top = 18.897650000000000000
        Width = 1122.520410000000000000
        object Memo18: TfrxMemoView
          Left = 7.559060000000000000
          Top = 56.692950000000000000
          Width = 49.133890000000000000
          Height = 24.188983700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'DOCTO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 56.692950000000000000
          Top = 56.692950000000000000
          Width = 18.897650000000000000
          Height = 24.188983700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'NP')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 75.590600000000000000
          Top = 56.692950000000000000
          Width = 60.472480000000000000
          Height = 24.188983700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'S'#195#8240'RIE/NOTA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 136.063080000000000000
          Top = 56.692950000000000000
          Width = 30.236240000000000000
          Height = 24.188983700000000000
          StretchMode = smActualHeight
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'FILIAL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 166.299320000000000000
          Top = 56.692950000000000000
          Width = 52.913420000000000000
          Height = 24.188983700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'LAN'#195#8225'TO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 219.212740000000000000
          Top = 56.692950000000000000
          Width = 37.795300000000000000
          Height = 24.188983700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'C'#195#8220'DIGO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 805.039890000000000000
          Top = 68.031540000000000000
          Width = 52.913420000000000000
          Height = 12.850393700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'JUROS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 857.953310000000000000
          Top = 68.031540000000000000
          Width = 52.913420000000000000
          Height = 12.850393700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'DESCONTO')
          ParentFont = False
        end
        object fmvRua: TfrxMemoView
          Left = 132.283550000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[RAZAOFILIALBASE]')
          ParentFont = False
        end
        object fmvBairro: TfrxMemoView
          Left = 132.283550000000000000
          Top = 17.007885000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[ENDERECO_BAIRRO]')
          ParentFont = False
        end
        object fmvCidade: TfrxMemoView
          Left = 132.283550000000000000
          Top = 30.236240000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[CEP_CIDADE_UF]')
          ParentFont = False
        end
        object fpvLogo: TfrxPictureView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 120.944960000000000000
          Height = 45.354360000000000000
        end
        object Memo236: TfrxMemoView
          Left = 1050.709340000000000000
          Top = 22.677180000000000000
          Width = 60.472480000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Page#]')
          ParentFont = False
        end
        object Memo237: TfrxMemoView
          Left = 1012.914040000000000000
          Top = 22.677180000000000000
          Width = 34.015770000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'P'#195#129'G.:')
          ParentFont = False
        end
        object Memo238: TfrxMemoView
          Left = 1012.914040000000000000
          Top = 7.559060000000000000
          Width = 34.015770000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'DATA:')
          ParentFont = False
        end
        object Memo239: TfrxMemoView
          Left = 1050.709340000000000000
          Top = 7.559060000000000000
          Width = 60.472480000000000000
          Height = 11.338582680000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[Date]')
          ParentFont = False
        end
        object mmoTitulo: TfrxMemoView
          ShiftMode = smDontShift
          Left = 393.071120000000000000
          Top = 7.559060000000000000
          Width = 570.709030000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[TITULO]')
          ParentFont = False
          WordWrap = False
        end
        object Memo240: TfrxMemoView
          ShiftMode = smDontShift
          Left = 393.071120000000000000
          Top = 26.456710000000000000
          Width = 570.709030000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUBTITULO]')
          ParentFont = False
          WordWrap = False
        end
        object Memo34: TfrxMemoView
          Left = 257.008040000000000000
          Top = 56.692950000000000000
          Width = 173.858380000000000000
          Height = 24.188983700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'FORNECEDOR')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 740.787880000000000000
          Top = 68.031540000000000000
          Width = 64.252010000000000000
          Height = 12.850393700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'VALOR')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 684.094930000000000000
          Top = 68.031540000000000000
          Width = 56.692925590000000000
          Height = 12.850393700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'DATA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 430.866420000000000000
          Top = 56.692950000000000000
          Width = 253.228485590000000000
          Height = 12.850393700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'VENCIMENTO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 491.338900000000000000
          Top = 68.031540000000000000
          Width = 56.692925590000000000
          Height = 12.850393700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'DATA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 548.031850000000000000
          Top = 68.031540000000000000
          Width = 64.252010000000000000
          Height = 12.850393700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'VALOR')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 684.094930000000000000
          Top = 56.692950000000000000
          Width = 226.771775590000000000
          Height = 12.850393700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'PAGAMENTO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 612.283860000000000000
          Top = 68.031540000000000000
          Width = 71.811070000000000000
          Height = 12.850393700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'DESCONTO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 461.102660000000000000
          Top = 68.031540000000000000
          Width = 30.236240000000000000
          Height = 12.850393700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'DDA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 430.866420000000000000
          Top = 68.031540000000000000
          Width = 30.236240000000000000
          Height = 12.850393700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'SIT.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 910.866730000000000000
          Top = 56.692950000000000000
          Width = 200.315090000000000000
          Height = 24.188983700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'OBSERVA'#195#8225#195#402'O')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object CabecalhoGrupoFilial: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 158.740260000000000000
        Visible = False
        Width = 1122.520410000000000000
        OnBeforePrint = 'CabecalhoGrupoFilialOnBeforePrint'
        Condition = 'IIF(<AgruparGrupoFilial>,<frxDBDataset."grupofilialemissao">,'#39#39')'
        object Memo40: TfrxMemoView
          Left = 109.606370000000000000
          Width = 982.677800000000000000
          Height = 15.118120000000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              '[frxDBDataset."grupofilialemissao"] [frxDBDataset."nomegrupofili' +
              'alemissao"]')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 18.897650000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Grupo de Filial')
          ParentFont = False
        end
      end
      object RodapeGrupoFilial: TfrxGroupFooter
        Height = 26.456710000000000000
        Top = 589.606680000000000000
        Visible = False
        Width = 1122.520410000000000000
        object Memo66: TfrxMemoView
          Left = 11.338590000000000000
          Top = 3.779530000000000000
          Width = 495.118430000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              'TOTAL GRUPO DE FILIAL [frxDBDataset."grupofilialemissao"] [frxDB' +
              'Dataset."nomegrupofilialemissao"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          Left = 11.338590000000000000
          Top = 22.677180000000000000
          Width = 1100.708720000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
        object Memo42: TfrxMemoView
          Left = 517.795610000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorvencto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 589.606680000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valordesconto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo68: TfrxMemoView
          Left = 710.551640000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorpagto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo69: TfrxMemoView
          Left = 763.465060000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorJurosPagos">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo70: TfrxMemoView
          Left = 816.378480000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorDescReceb">,MasterData1,1)]')
          ParentFont = False
        end
      end
      object CabecalhoFilial: TfrxGroupHeader
        Height = 18.897637800000000000
        Top = 200.315090000000000000
        Visible = False
        Width = 1122.520410000000000000
        OnBeforePrint = 'CabecalhoFilialOnBeforePrint'
        Condition = 'IIF(<AgruparFilial>,<frxDBDataset."filialemissao">,'#39#39')'
        object Memo208: TfrxMemoView
          Left = 19.811070000000000000
          Top = 2.330550000000000000
          Width = 82.236240000000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            'Filial')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo209: TfrxMemoView
          Left = 112.086580000000000000
          Top = 2.330550000000000000
          Width = 985.087200000000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          HideZeros = True
          Memo.UTF8 = (
            
              '[frxDBDataset."filialemissao"] [frxDBDataset."nomefilialemissao"' +
              ']')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object RodapeFilial: TfrxGroupFooter
        Height = 26.456710000000000000
        Top = 540.472790000000000000
        Visible = False
        Width = 1122.520410000000000000
        object Memo43: TfrxMemoView
          Left = 11.338590000000000000
          Top = 3.779530000000000000
          Width = 495.118430000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              'TOTAL FILIAL [frxDBDataset."filialemissao"] [frxDBDataset."nomef' +
              'ilialemissao"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Left = 11.338590000000000000
          Top = 22.677180000000000000
          Width = 1100.708720000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
        object Memo44: TfrxMemoView
          Left = 517.795610000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorvencto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 589.606680000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valordesconto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          Left = 710.551640000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorpagto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          Left = 763.465060000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorJurosPagos">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          Left = 816.378480000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorDescReceb">,MasterData1,1)]')
          ParentFont = False
        end
      end
      object CabecalhoFornecedor: TfrxGroupHeader
        Top = 268.346630000000000000
        Visible = False
        Width = 1122.520410000000000000
        Condition = 'IIF(<AgruparFornecedor>,<frxDBDataset."fornecedor">,'#39#39')'
      end
      object RodapeFornecedor: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 457.323130000000000000
        Visible = False
        Width = 1122.520410000000000000
        object Memo45: TfrxMemoView
          Left = 11.338590000000000000
          Width = 495.118430000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              'TOTAL FORNECEDOR [frxDBDataset."tipofornecedor"][frxDBDataset."f' +
              'ornecedor"] [frxDBDataset."nomefornecedor"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 517.795610000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorvencto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 589.606680000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valordesconto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Left = 710.551640000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorpagto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Left = 763.465060000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorJurosPagos">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          Left = 816.378480000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorDescReceb">,MasterData1,1)]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        Height = 22.677180000000000000
        Top = 638.740570000000000000
        Width = 1122.520410000000000000
        object Memo71: TfrxMemoView
          Left = 11.338590000000000000
          Width = 495.118430000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'TOTAL GERAL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line4: TfrxLineView
          Left = 11.338590000000000000
          Top = 18.897650000000000000
          Width = 1100.708720000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
        object Memo72: TfrxMemoView
          Left = 517.795610000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorvencto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo73: TfrxMemoView
          Left = 589.606680000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valordesconto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo74: TfrxMemoView
          Left = 710.551640000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorpagto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo75: TfrxMemoView
          Left = 763.465060000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorJurosPagos">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo76: TfrxMemoView
          Left = 816.378480000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorDescReceb">,MasterData1,1)]')
          ParentFont = False
        end
      end
    end
  end
  object frxReport1: TfrxReport
    Version = '4.0.11'
    DataSet = frxDBDataset2
    DataSetName = 'frxDBDataset'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43735.424366458300000000
    ReportOptions.LastChange = 43735.424366458300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      ' LINHA: INTEGER;'
      
        ' vTGPrecoaPrazo_d, vTGPrecoCusto_d, vTGMarkup_d, vpMargem_d : Cu' +
        'rrency;'
      
        ' vTGPrecoaPrazo_v, vTGPrecoCusto_v, vTGMarkup_v, vpMargem_v : Cu' +
        'rrency;'
      
        ' vTGPrecoaPrazo_g, vTGPrecoCusto_g, vTGMarkup_g, vpMargem_g, vTo' +
        'talVencimento : Currency;'
      '  vZebrar, vZebrar2 : boolean;'
      ''
      'procedure GroupFooter3OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure Memo11OnAfterData(Sender: TfrxComponent);'
      'begin'
      
        '  vTotalVencimento := SUM(<frxDBDataset."valorvencto">,MasterDat' +
        'a1,1);'
      'end;'
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <AgruparGrupoFilial> then'
      '  begin'
      '     CabecalhoGrupoFilial.visible:=true;'
      '     RodapeGrupoFilial.visible:=true;'
      '  end'
      '  else'
      '  begin'
      '    CabecalhoGrupoFilial.visible:=false;'
      '    RodapeGrupoFilial.visible:=false;'
      '  end;'
      ''
      '  if <AgruparFilial> then'
      '  begin'
      '   CabecalhoFilial.visible:=true;'
      '   RodapeFilial.visible:=true;'
      '  end'
      '  else'
      '  begin'
      '    CabecalhoFilial.visible:=false;'
      '    RodapeFilial.visible:=false;'
      '  end;'
      ''
      '  if <AgruparFornecedor> then'
      '  begin'
      '   CabecalhoFornecedor.visible:=true;'
      '   RodapeFornecedor.visible:=true;'
      '  end'
      '  else'
      '  begin'
      '    CabecalhoFornecedor.visible:=false;'
      '    RodapeFornecedor.visible:=false;'
      '  end;'
      ''
      '  if <AgruparData> then'
      '  begin'
      '   CabecalhoDataLancto.visible:=true;'
      '   RodapeDataLancto.visible:=true;'
      '   CabecalhoMesAno.visible:=true;'
      '   RodapeMesAno.visible:=true;'
      '  end'
      '  else'
      '  begin'
      '    CabecalhoDataLancto.visible:=false;'
      '    RodapeDataLancto.visible:=false;'
      '    CabecalhoMesAno.visible:=false;'
      '    RodapeMesAno.visible:=false;'
      '  end;'
      ''
      ''
      ''
      'end;'
      ''
      'procedure Memo47OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  mmoTotalValorPagto.text := floattostr(SUM(<frxDBDataset."valor' +
        'pagto">,MasterData1,1));'
      'end;'
      ''
      
        'procedure CabecalhoDocumentopagOnBeforePrint(Sender: TfrxCompone' +
        'nt);'
      'begin'
      '  if vZebrar2 then'
      '  begin'
      '    mmoZebrado2.color := <CordoZebrado>;'
      '    vZebrar2 := false;'
      '  end'
      '  else'
      '  begin'
      '    mmoZebrado2.color := clwhite;'
      '    vZebrar2 := true;'
      '  end;'
      ''
      'end;'
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if vZebrar then'
      '  begin'
      '    mmoZebrado.color := <CordoZebrado>;'
      '    vZebrar := false;'
      '  end'
      '  else'
      '  begin'
      '    mmoZebrado.color := clwhite;'
      '    vZebrar := true;'
      '  end;'
      ''
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxDuplicatasporCompetenciaGetValue
    Left = 888
    Top = 464
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset'
      end>
    Variables = <
      item
        Name = ' Relatorio'
        Value = Null
      end
      item
        Name = 'ENDERECO_BAIRRO'
        Value = Null
      end
      item
        Name = 'RAZAOFILIALBASE'
        Value = Null
      end
      item
        Name = 'CEP_CIDADE_UF'
        Value = Null
      end
      item
        Name = 'TITULO'
        Value = Null
      end
      item
        Name = 'SUBTITULO'
        Value = Null
      end
      item
        Name = 'OUTRAS'
        Value = Null
      end
      item
        Name = 'DATA'
        Value = Null
      end
      item
        Name = 'AgruparGrupoFilial'
        Value = 'False'
      end
      item
        Name = 'AgruparFilial'
        Value = 'False'
      end
      item
        Name = 'AgruparFornecedor'
        Value = 'False'
      end
      item
        Name = 'AgruparData'
        Value = 'True'
      end
      item
        Name = 'CordoZebrado'
        Value = '$00B3D9FF'
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      OnBeforePrint = 'Page1OnBeforePrint'
      object MasterData1: TfrxMasterData
        Height = 15.118120000000000000
        Top = 351.496290000000000000
        Width = 1122.520410000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset'
        RowCount = 0
        object mmoZebrado: TfrxMemoView
          Left = 400.630180000000000000
          Width = 710.551640000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          AllowExpressions = False
          Clipped = False
          Color = 11786751
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          WordWrap = False
          Wysiwyg = False
        end
        object Memo4: TfrxMemoView
          Left = 404.409710000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset."obs"]')
          ParentFont = False
        end
        object CheckBox1: TfrxCheckBoxView
          Left = 464.882190000000000000
          Width = 26.456710000000000000
          Height = 15.118120000000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = 'dda'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
        end
        object Memo2: TfrxMemoView
          Left = 548.031850000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DataField = 'valorvencto'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset."valorvencto"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 616.063390000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset."valordesconto"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 684.094930000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          DataField = 'datapagto'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'DD/MM/YY'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset."datapagto"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 740.787880000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset."valorpagto"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 805.039890000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset."ValorJurosPagos"]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 857.953310000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset."ValorDescReceb"]')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 910.866730000000000000
          Width = 200.315090000000000000
          Height = 15.118120000000000000
          DataField = 'observacao'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset."observacao"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 491.338900000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          DataField = 'datavencto'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'DD/MM/YY'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset."datavencto"]')
          ParentFont = False
        end
      end
      object CabecalhoMesAno: TfrxGroupHeader
        Height = 3.779530000000000000
        Top = 241.889920000000000000
        Width = 1122.520410000000000000
        Condition = 'IIF(<AgruparData>,<frxDBDataset."mesano">,'#39#39')'
        OutlineText = 'IIF(<AgruparData>,<frxDBDataset."mesano">,'#39#39')'
        StartNewPage = True
      end
      object RodapeDataLancto: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 415.748300000000000000
        Width = 1122.520410000000000000
        object Memo5: TfrxMemoView
          Left = 517.795610000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorvencto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 7.559060000000000000
          Width = 211.653680000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'DD/MM/YY'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'TOAIS EM [frxDBDataset."datalancto"]')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 589.606680000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valordesconto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 710.551640000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorpagto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 763.465060000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorJurosPagos">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 816.378480000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorDescReceb">,MasterData1,1)]')
          ParentFont = False
        end
      end
      object CabecalhoDataLancto: TfrxGroupHeader
        Top = 291.023810000000000000
        Width = 1122.520410000000000000
        Condition = 'IIF(<AgruparData>,<frxDBDataset."datalancto">,'#39#39')'
      end
      object RodapeMesAno: TfrxGroupFooter
        Height = 15.118120000000000000
        Top = 502.677490000000000000
        Width = 1122.520410000000000000
        object Memo8: TfrxMemoView
          Left = 517.795610000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorvencto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 7.559060000000000000
          Width = 211.653680000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'TOTAIS EM [frxDBDataset."mesano"]')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 589.606680000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valordesconto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Left = 710.551640000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorpagto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          Left = 763.465060000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorJurosPagos">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          Left = 816.378480000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorDescReceb">,MasterData1,1)]')
          ParentFont = False
        end
      end
      object CabecalhoDocumentopag: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Height = 15.118120000000000000
        ParentFont = False
        Top = 313.700990000000000000
        Visible = False
        Width = 1122.520410000000000000
        OnBeforePrint = 'CabecalhoDocumentopagOnBeforePrint'
        Condition = 'frxDBDataset."documentopag"'
        DrillDown = True
        object mmoZebrado2: TfrxMemoView
          Left = 7.559060000000000000
          Width = 1103.622760000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          AllowExpressions = False
          Clipped = False
          Color = 11786751
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          WordWrap = False
          Wysiwyg = False
        end
        object Memo14: TfrxMemoView
          Left = 7.559060000000000000
          Width = 49.133890000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset."documentopag"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 75.590600000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset."documento"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 166.299320000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'DD/MM/YY'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset."datalancto"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 219.212740000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          DataField = 'fornecedor'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset."fornecedor"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 260.787570000000000000
          Width = 170.078850000000000000
          Height = 15.118120000000000000
          DataField = 'nomefornecedor'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset."nomefornecedor"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 532.913730000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset."valor"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 136.063080000000000000
          Width = 30.236240000000000000
          Height = 15.118120000000000000
          DataField = 'filialemissao'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset."filialemissao"]')
          ParentFont = False
        end
        object mmoTotalValorPagto: TfrxMemoView
          Left = 725.669760000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset."totalvalorpagto"]')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 778.583180000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset."totalvalorjurospagos"]')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 831.496600000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset."totalvalordescreceb"]')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 604.724800000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset."valordesconto"]')
          ParentFont = False
        end
      end
      object RodapeDocumentopag: TfrxGroupFooter
        Height = 3.779530000000000000
        Top = 389.291590000000000000
        Visible = False
        Width = 1122.520410000000000000
        object Line3: TfrxLineView
          Left = 7.559060000000000000
          Width = 1111.181820000000000000
          Frame.Typ = [ftTop]
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 80.881933700000000000
        Top = 18.897650000000000000
        Width = 1122.520410000000000000
        object Memo18: TfrxMemoView
          Left = 7.559060000000000000
          Top = 56.692950000000000000
          Width = 49.133890000000000000
          Height = 24.188983700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'DOCTO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 56.692950000000000000
          Top = 56.692950000000000000
          Width = 18.897650000000000000
          Height = 24.188983700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'NP')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 75.590600000000000000
          Top = 56.692950000000000000
          Width = 60.472480000000000000
          Height = 24.188983700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'S'#195#8240'RIE/NOTA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 136.063080000000000000
          Top = 56.692950000000000000
          Width = 30.236240000000000000
          Height = 24.188983700000000000
          StretchMode = smActualHeight
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'FILIAL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 166.299320000000000000
          Top = 56.692950000000000000
          Width = 52.913420000000000000
          Height = 24.188983700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'LAN'#195#8225'TO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 219.212740000000000000
          Top = 56.692950000000000000
          Width = 37.795300000000000000
          Height = 24.188983700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'C'#195#8220'DIGO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 805.039890000000000000
          Top = 68.031540000000000000
          Width = 52.913420000000000000
          Height = 12.850393700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'JUROS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 857.953310000000000000
          Top = 68.031540000000000000
          Width = 52.913420000000000000
          Height = 12.850393700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'DESCONTO')
          ParentFont = False
        end
        object fmvRua: TfrxMemoView
          Left = 132.283550000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[RAZAOFILIALBASE]')
          ParentFont = False
        end
        object fmvBairro: TfrxMemoView
          Left = 132.283550000000000000
          Top = 17.007885000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[ENDERECO_BAIRRO]')
          ParentFont = False
        end
        object fmvCidade: TfrxMemoView
          Left = 132.283550000000000000
          Top = 30.236240000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[CEP_CIDADE_UF]')
          ParentFont = False
        end
        object fpvLogo: TfrxPictureView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 120.944960000000000000
          Height = 45.354360000000000000
        end
        object Memo236: TfrxMemoView
          Left = 1050.709340000000000000
          Top = 22.677180000000000000
          Width = 60.472480000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Page#]')
          ParentFont = False
        end
        object Memo237: TfrxMemoView
          Left = 1012.914040000000000000
          Top = 22.677180000000000000
          Width = 34.015770000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'P'#195#129'G.:')
          ParentFont = False
        end
        object Memo238: TfrxMemoView
          Left = 1012.914040000000000000
          Top = 7.559060000000000000
          Width = 34.015770000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'DATA:')
          ParentFont = False
        end
        object Memo239: TfrxMemoView
          Left = 1050.709340000000000000
          Top = 7.559060000000000000
          Width = 60.472480000000000000
          Height = 11.338582680000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[Date]')
          ParentFont = False
        end
        object mmoTitulo: TfrxMemoView
          ShiftMode = smDontShift
          Left = 393.071120000000000000
          Top = 7.559060000000000000
          Width = 570.709030000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[TITULO]')
          ParentFont = False
          WordWrap = False
        end
        object Memo240: TfrxMemoView
          ShiftMode = smDontShift
          Left = 393.071120000000000000
          Top = 26.456710000000000000
          Width = 570.709030000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUBTITULO]')
          ParentFont = False
          WordWrap = False
        end
        object Memo34: TfrxMemoView
          Left = 257.008040000000000000
          Top = 56.692950000000000000
          Width = 173.858380000000000000
          Height = 24.188983700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'FORNECEDOR')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 740.787880000000000000
          Top = 68.031540000000000000
          Width = 64.252010000000000000
          Height = 12.850393700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'VALOR')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 684.094930000000000000
          Top = 68.031540000000000000
          Width = 56.692925590000000000
          Height = 12.850393700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'DATA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 430.866420000000000000
          Top = 56.692950000000000000
          Width = 253.228485590000000000
          Height = 12.850393700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'VENCIMENTO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 491.338900000000000000
          Top = 68.031540000000000000
          Width = 56.692925590000000000
          Height = 12.850393700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'DATA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 548.031850000000000000
          Top = 68.031540000000000000
          Width = 64.252010000000000000
          Height = 12.850393700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'VALOR')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 684.094930000000000000
          Top = 56.692950000000000000
          Width = 226.771775590000000000
          Height = 12.850393700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'PAGAMENTO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 612.283860000000000000
          Top = 68.031540000000000000
          Width = 71.811070000000000000
          Height = 12.850393700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'DESCONTO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 461.102660000000000000
          Top = 68.031540000000000000
          Width = 30.236240000000000000
          Height = 12.850393700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'DDA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 430.866420000000000000
          Top = 68.031540000000000000
          Width = 30.236240000000000000
          Height = 12.850393700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'SIT.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 910.866730000000000000
          Top = 56.692950000000000000
          Width = 200.315090000000000000
          Height = 24.188983700000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            'OBSERVA'#195#8225#195#402'O')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object CabecalhoGrupoFilial: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 158.740260000000000000
        Visible = False
        Width = 1122.520410000000000000
        Condition = 'IIF(<AgruparGrupoFilial>,<frxDBDataset."grupofilialvenda">,'#39#39')'
        OutlineText = 'IIF(<AgruparGrupoFilial>,<frxDBDataset."grupofilialvenda">,'#39#39')'
        object Memo40: TfrxMemoView
          Left = 109.606370000000000000
          Width = 982.677800000000000000
          Height = 15.118120000000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              '[frxDBDataset."grupofilialemissao"] [frxDBDataset."nomegrupofili' +
              'alemissao"]')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 18.897650000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          DataSet = dtmrelatoriocustomercadoriasvendidas.frxDBcustomercvendidas_
          DataSetName = 'frxDBcustomercvendidas_'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Grupo de Filial')
          ParentFont = False
        end
      end
      object RodapeGrupoFilial: TfrxGroupFooter
        Height = 26.456710000000000000
        Top = 589.606680000000000000
        Visible = False
        Width = 1122.520410000000000000
        object Memo66: TfrxMemoView
          Left = 11.338590000000000000
          Top = 3.779530000000000000
          Width = 495.118430000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              'TOTAL GRUPO DE FILIAL [frxDBDataset."grupofilialemissao"] [frxDB' +
              'Dataset."nomegrupofilialemissao"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          Left = 11.338590000000000000
          Top = 22.677180000000000000
          Width = 1100.708720000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
        object Memo42: TfrxMemoView
          Left = 517.795610000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorvencto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 589.606680000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valordesconto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo68: TfrxMemoView
          Left = 710.551640000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorpagto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo69: TfrxMemoView
          Left = 763.465060000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorJurosPagos">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo70: TfrxMemoView
          Left = 816.378480000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorDescReceb">,MasterData1,1)]')
          ParentFont = False
        end
      end
      object CabecalhoFilial: TfrxGroupHeader
        Height = 18.897637800000000000
        Top = 200.315090000000000000
        Visible = False
        Width = 1122.520410000000000000
        Condition = 'IIF(<AgruparFilial>,<frxDBDataset."filialemissao">,'#39#39')'
        OutlineText = 'IIF(<AgruparFilial>,<frxDBDataset."filialemissao">,'#39#39')'
        object Memo208: TfrxMemoView
          Left = 19.811070000000000000
          Top = 2.330550000000000000
          Width = 82.236240000000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            'Filial')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo209: TfrxMemoView
          Left = 112.086580000000000000
          Top = 2.330550000000000000
          Width = 985.087200000000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          HideZeros = True
          Memo.UTF8 = (
            
              '[frxDBDataset."filialemissao"] [frxDBDataset."nomefilialemissao"' +
              ']')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object RodapeFilial: TfrxGroupFooter
        Height = 26.456710000000000000
        Top = 540.472790000000000000
        Visible = False
        Width = 1122.520410000000000000
        object Memo43: TfrxMemoView
          Left = 11.338590000000000000
          Top = 3.779530000000000000
          Width = 495.118430000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              'TOTAL FILIAL [frxDBDataset."filialemissao"] [frxDBDataset."nomef' +
              'ilialemissao"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Left = 11.338590000000000000
          Top = 22.677180000000000000
          Width = 1100.708720000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
        object Memo44: TfrxMemoView
          Left = 517.795610000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorvencto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 589.606680000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valordesconto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          Left = 710.551640000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorpagto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          Left = 763.465060000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorJurosPagos">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          Left = 816.378480000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorDescReceb">,MasterData1,1)]')
          ParentFont = False
        end
      end
      object CabecalhoFornecedor: TfrxGroupHeader
        Top = 268.346630000000000000
        Visible = False
        Width = 1122.520410000000000000
        Condition = 'IIF(<AgruparFornecedor>,<frxDBDataset."fornecedor">,'#39#39')'
      end
      object RodapeFornecedor: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 457.323130000000000000
        Visible = False
        Width = 1122.520410000000000000
        object Memo45: TfrxMemoView
          Left = 11.338590000000000000
          Width = 495.118430000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              'TOTAL FORNECEDOR [frxDBDataset."tipofornecedor"][frxDBDataset."f' +
              'ornecedor"] [frxDBDataset."nomefornecedor"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 517.795610000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorvencto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 589.606680000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valordesconto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Left = 710.551640000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorpagto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Left = 763.465060000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorJurosPagos">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          Left = 816.378480000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorDescReceb">,MasterData1,1)]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        Height = 22.677180000000000000
        Top = 638.740570000000000000
        Width = 1122.520410000000000000
        object Memo71: TfrxMemoView
          Left = 11.338590000000000000
          Width = 495.118430000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'TOTAL GERAL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line4: TfrxLineView
          Left = 11.338590000000000000
          Top = 18.897650000000000000
          Width = 1100.708720000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
        object Memo72: TfrxMemoView
          Left = 517.795610000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorvencto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo73: TfrxMemoView
          Left = 589.606680000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valordesconto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo74: TfrxMemoView
          Left = 710.551640000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."valorpagto">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo75: TfrxMemoView
          Left = 763.465060000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorJurosPagos">,MasterData1,1)]')
          ParentFont = False
        end
        object Memo76: TfrxMemoView
          Left = 816.378480000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset."ValorDescReceb">,MasterData1,1)]')
          ParentFont = False
        end
      end
    end
  end
  object tecQuery2: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeOpen = qryDuplicatasBeforeOpen
    OnCalcFields = qryDuplicatasCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT selecao.*,'
      '       to_char(datalancto, '#39'MM/YYYY'#39') as mesAno,'
      ''
      '       (select sum(dp.valorpagto)'
      '        from duplicatas dp'
      
        '        where dp.documentopag = selecao.documentopag) as TotalVa' +
        'lorPagto,'
      ''
      
        '       (select sum(case when dp.valorpagto>dp.valorvencto then d' +
        'p.valorpagto-dp.valorvencto else 0.00 end)'
      '        from duplicatas dp'
      
        '        where dp.documentopag = selecao.documentopag) as TotalVa' +
        'lorJurosPagos,'
      ''
      
        '       (select sum(case when coalesce(dp.valorpagto,0)<>0 and dp' +
        '.valorpagto<dp.valorvencto then dp.valorvencto-dp.valorpagto els' +
        'e 0.00 end)'
      '        from duplicatas dp'
      
        '        where dp.documentopag = selecao.documentopag) as TotalVa' +
        'lorDescReceb'
      ''
      ''
      'FROM ('
      '        (SELECT t.documentopag,'
      '                t.numero,'
      '                d.filialemissao,'
      '                f.nome AS nomefilialemissao,'
      '                fgf.grupo AS grupofilialemissao,'
      '                gf.descricao AS nomegrupofilialemissao,'
      '                n.numero AS nota,'
      '                n.serie,'
      '                d.complemento,'
      '                d.fornecedor,'
      '                d.tipofornecedor,'
      ''
      '           (SELECT coalesce(v.razao, v.nome) AS nome'
      '            FROM vfornecedores v'
      '            WHERE (d.fornecedor = v.codigo)'
      '              AND (d.tipofornecedor = v.tipo))AS nomefornecedor,'
      '                d.emissao,'
      '                CASE'
      '                    WHEN d.regimedecaixa THEN t.datavencto'
      '                    ELSE d.datalancto'
      '                END AS datalancto,'
      '                d.previsao,'
      '                t.bancocobranca,'
      ''
      '           (SELECT b.sigla'
      '            FROM bancos b'
      
        '            WHERE b.codigo = t.bancocobranca) AS siglabancocobra' +
        'nca,'
      '                t.datavencto,'
      '                t.valorvencto,'
      '                t.valordesconto,'
      '                t.datapagto,'
      '                t.valorpagto,'
      ''
      '           (SELECT b.sigla'
      '            FROM bancos b'
      '            JOIN contas c ON c.banco = b.codigo'
      '            WHERE c.conta = t.contapagto) AS siglabancopagto,'
      '                t.contapagto,'
      '                t.observacao,'
      '                FALSE AS adiantamento,'
      
        '                         cast(cast(abs(t.datavencto - CURRENT_DA' +
        'TE)AS varchar) || cast('#39' - D'#39' AS varchar) AS varchar) AS obs,'
      '                         CASE'
      '                             WHEN '#39't'#39' THEN TRUE'
      '                             ELSE FALSE'
      '                         END AS Diferenciar,'
      ''
      '           (SELECT e.codigo'
      '            FROM eventos e'
      
        '            WHERE e.codigo=coalesce(t.evento, d.evento)) AS even' +
        'to,'
      ''
      '           (SELECT e.descricao'
      '            FROM eventos e'
      
        '            WHERE e.codigo=coalesce(t.evento, d.evento)) AS desc' +
        'ricao_evento,'
      '                         t.dda,'
      '                         d.regimedecaixa,'
      ''
      '            d.valor'
      ''
      '         FROM ((duplicatas t'
      
        '                LEFT JOIN notaspag n ON n.documentopag = t.docum' +
        'entopag)'
      '               JOIN (documentospag d'
      '                     JOIN (filiais f'
      '                           LEFT JOIN (filiaisgruposfiliais fgf'
      
        '                                      LEFT JOIN gruposfiliais gf' +
        ' ON fgf.grupo=gf.codigo) ON f.codigo=fgf.filial) ON d.filialemis' +
        'sao=f.codigo) ON t.documentopag = d.numero)'
      '         WHERE '#39't'#39
      '           AND (CASE'
      '                    WHEN d.regimedecaixa THEN t.datavencto'
      '                    ELSE d.datalancto'
      '                END BETWEEN ('#39'01/01/2019'#39') AND ('#39'05/10/2019'#39')) )'
      '      UNION ALL'
      '        (SELECT d.numero AS documentopag,'
      '                cast(1 AS integer) AS numero,'
      '                d.filialemissao,'
      '                f.nome AS nomefilialemissao,'
      '                fgf.grupo AS grupofilialemissao,'
      '                gf.descricao AS nomegrupofilialemissao,'
      '                cast(NULL AS integer) AS nota,'
      '                cast(NULL AS varchar(3)) AS serie,'
      '                d.complemento,'
      '                d.fornecedor,'
      '                d.tipofornecedor,'
      ''
      '           (SELECT coalesce(v.razao, v.nome) AS nome'
      '            FROM vfornecedores v'
      '            WHERE (d.fornecedor = v.codigo)'
      '              AND (d.tipofornecedor = v.tipo))AS nomefornecedor,'
      '                d.emissao,'
      '                d.datalancto,'
      '                d.previsao,'
      ''
      '           (SELECT ct.banco'
      '            FROM contas ct'
      '            WHERE ct.conta = d.contapagto) AS bancocobranca,'
      ''
      '           (SELECT b.sigla'
      '            FROM bancos b'
      '            WHERE b.codigo ='
      '                (SELECT ct.banco'
      '                 FROM contas ct'
      
        '                 WHERE ct.conta = d.contapagto)) AS siglabancoco' +
        'branca,'
      '                d.datalancto AS datavencto,'
      '                d.valor AS valorvencto,'
      '                0.00 AS valordesconto,'
      '                d.datalancto AS datapagto,'
      '                d.valor AS valorpagto,'
      ''
      '           (SELECT b.sigla'
      '            FROM bancos b'
      '            WHERE b.codigo ='
      '                (SELECT ct.banco'
      '                 FROM contas ct'
      
        '                 WHERE ct.conta = d.contapagto)) AS siglabancopa' +
        'gto,'
      '                d.contapagto,'
      '                d.referencia AS observacao,'
      '                TRUE AS adiantamento,'
      '                        cast(NULL AS varchar) AS obs,'
      '                        CASE'
      '                            WHEN '#39't'#39' THEN TRUE'
      '                            ELSE FALSE'
      '                        END AS Diferenciar,'
      ''
      '           (SELECT e.codigo'
      '            FROM eventos e'
      '            WHERE e.codigo=d.evento) AS evento,'
      ''
      '           (SELECT e.descricao'
      '            FROM eventos e'
      '            WHERE e.codigo=d.evento) AS descricao_evento,'
      '                        FALSE AS dda,'
      '                                 d.regimedecaixa, d.valor'
      '         FROM (documentospag d'
      '               JOIN (filiais f'
      '                     LEFT JOIN (filiaisgruposfiliais fgf'
      
        '                                LEFT JOIN gruposfiliais gf ON fg' +
        'f.grupo=gf.codigo) ON f.codigo=fgf.filial) ON d.filialemissao=f.' +
        'codigo)'
      '         WHERE coalesce(d.adiantamento, FALSE)'
      '           AND '#39'f'#39
      
        '           AND (d.datalancto BETWEEN ('#39'01/01/2019'#39') AND ('#39'05/10/' +
        '2019'#39')) )) AS selecao'
      'ORDER BY datalancto,'
      '         documentopag,'
      '         datavencto,'
      '         nomefornecedor,'
      '         fornecedor')
    RequestLive = True
    Left = 920
    Top = 441
    object IntegerField10: TIntegerField
      FieldName = 'documentopag'
      Required = True
      DisplayFormat = '0'
    end
    object IntegerField11: TIntegerField
      FieldName = 'filialemissao'
      Required = True
      DisplayFormat = '0'
    end
    object IntegerField12: TIntegerField
      FieldName = 'nota'
      DisplayFormat = '0'
    end
    object StringField13: TStringField
      FieldName = 'serie'
      Size = 3
    end
    object IntegerField13: TIntegerField
      FieldName = 'fornecedor'
      Required = True
      DisplayFormat = '0'
    end
    object StringField14: TStringField
      FieldName = 'tipofornecedor'
      Required = True
      Size = 1
    end
    object DateField5: TDateField
      Alignment = taCenter
      FieldName = 'datavencto'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object FloatField4: TFloatField
      FieldName = 'valorvencto'
      Required = True
      DisplayFormat = '0.00'
    end
    object FloatField5: TFloatField
      FieldName = 'valordesconto'
      DisplayFormat = '0.00'
    end
    object DateField6: TDateField
      Alignment = taCenter
      FieldName = 'datapagto'
      EditMask = '99/99/9999;1; '
    end
    object FloatField6: TFloatField
      FieldName = 'valorpagto'
      DisplayFormat = '0.00'
    end
    object IntegerField14: TIntegerField
      FieldName = 'numero'
      Required = True
      DisplayFormat = '0'
    end
    object BooleanField5: TBooleanField
      FieldName = 'previsao'
      Required = True
    end
    object DateField7: TDateField
      Alignment = taCenter
      FieldName = 'emissao'
      EditMask = '99/99/9999;1; '
    end
    object StringField15: TStringField
      DisplayWidth = 40
      FieldName = 'nomefilialemissao'
      Size = 60
    end
    object IntegerField15: TIntegerField
      FieldName = 'grupofilialemissao'
      DisplayFormat = '0'
    end
    object StringField16: TStringField
      FieldName = 'nomegrupofilialemissao'
      Size = 30
    end
    object StringField17: TStringField
      DisplayWidth = 32
      FieldName = 'nomefornecedor'
      Size = 56
    end
    object CurrencyField3: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ValorJurosPagos'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object CurrencyField4: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ValorDescReceb'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object StringField18: TStringField
      DisplayWidth = 32
      FieldName = 'observacao'
      Size = 148
    end
    object IntegerField16: TIntegerField
      FieldName = 'ContaPagto'
    end
    object BooleanField6: TBooleanField
      FieldName = 'diferenciar'
    end
    object IntegerField17: TIntegerField
      FieldName = 'bancocobranca'
    end
    object StringField19: TStringField
      FieldName = 'siglabancocobranca'
      Size = 10
    end
    object StringField20: TStringField
      DisplayWidth = 7
      FieldName = 'siglabancopagto'
      Size = 10
    end
    object StringField21: TStringField
      FieldName = 'obs'
      Size = 7
    end
    object IntegerField18: TIntegerField
      FieldName = 'evento'
    end
    object StringField22: TStringField
      FieldName = 'descricao_evento'
      Size = 30
    end
    object StringField23: TStringField
      FieldName = 'complemento'
      Size = 15
    end
    object StringField24: TStringField
      FieldKind = fkCalculated
      FieldName = 'documento'
      Calculated = True
    end
    object BooleanField7: TBooleanField
      FieldName = 'adiantamento'
    end
    object BooleanField8: TBooleanField
      FieldName = 'dda'
    end
    object DateField8: TDateField
      Alignment = taCenter
      FieldName = 'datalancto'
      EditMask = '99/99/9999;1; '
    end
    object MemoField1: TMemoField
      FieldName = 'mesano'
      BlobType = ftMemo
    end
    object FloatField7: TFloatField
      FieldName = 'valor'
      DisplayFormat = '0.00'
    end
    object BooleanField9: TBooleanField
      FieldName = 'regimedecaixa'
    end
    object FloatField8: TFloatField
      FieldName = 'totalvalorjurospagos'
      DisplayFormat = '0.00'
    end
    object FloatField9: TFloatField
      FieldName = 'totalvalordescreceb'
      DisplayFormat = '0.00'
    end
    object FloatField10: TFloatField
      FieldName = 'totalvalorpagto'
      DisplayFormat = '0.00'
    end
  end
  object frpDuplicatasPagar: TfrReport
    Dataset = fdsDuplicatasPagar
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnBeforePrint = frpDuplicatasPagarBeforePrint
    Left = 656
    Top = 75
    ReportForm = {
      19000000B561000019FFFF00000A0050444643726561746F7200FFFFFFFFFF00
      000000340800009A0B0000000000000B0000002F000000070000000100040000
      FFFFFFFF000000000000000000000000030400466F726D00FEFFFFFFDC000000
      780000007C0100002C010000043A000500626567696E0D1C006966205B416772
      75706172477275706F46696C69616C5D207468656E0D0500626567696E0D2400
      204361626563616C686F477275706F46696C69616C2E76697369626C653A3D74
      7275653B0D210020526F64617065477275706F46696C69616C2E76697369626C
      653A3D747275653B0D0300656E640D0400656C73650D0500626567696E0D2500
      204361626563616C686F477275706F46696C69616C2E76697369626C653A3D66
      616C73653B0D220020526F64617065477275706F46696C69616C2E7669736962
      6C653A3D66616C73653B0D0400656E643B0D00000D17006966205B4167727570
      617246696C69616C5D207468656E0D0500626567696E0D1F0020436162656361
      6C686F46696C69616C2E76697369626C653A3D747275653B0D1C0020526F6461
      706546696C69616C2E76697369626C653A3D747275653B0D0300656E640D0400
      656C73650D0500626567696E0D2000204361626563616C686F46696C69616C2E
      76697369626C653A3D66616C73653B0D1D0020526F6461706546696C69616C2E
      76697369626C653A3D66616C73653B0D0400656E643B0D00000D1B006966205B
      41677275706172466F726E656365646F725D207468656E0D0500626567696E0D
      2300204361626563616C686F466F726E656365646F722E76697369626C653A3D
      747275653B0D200020526F64617065466F726E656365646F722E76697369626C
      653A3D747275653B0D0300656E640D0400656C73650D0500626567696E0D2400
      204361626563616C686F466F726E656365646F722E76697369626C653A3D6661
      6C73653B0D210020526F64617065466F726E656365646F722E76697369626C65
      3A3D66616C73653B0D0400656E643B0D00000D15006966205B41677275706172
      446174615D207468656E0D0500626567696E0D240020204361626563616C686F
      4461746156656E63746F2E76697369626C653A3D747275653B0D21002020526F
      646170654461746156656E63746F2E76697369626C653A3D747275653B0D0300
      656E640D0400656C73650D0500626567696E0D250020204361626563616C686F
      4461746156656E63746F2E76697369626C653A3D66616C73653B0D2200202052
      6F646170654461746156656E63746F2E76697369626C653A3D66616C73653B0D
      0400656E643B0D00000D1F006966205B41677275706172446F63756D656E746F
      735061675D207468656E200D0600626567696E200D280020204361626563616C
      686F446F63756D656E746F735061672E76697369626C653A3D747275653B200D
      25002020526F64617065446F63756D656E746F735061672E76697369626C653A
      3D747275653B200D0400656E64200D0500656C7365200D0600626567696E200D
      290020204361626563616C686F446F63756D656E746F735061672E7669736962
      6C653A3D66616C73653B200D26002020526F64617065446F63756D656E746F73
      5061672E76697369626C653A3D66616C73653B200D0500656E643B200D00000D
      00000D0300656E64000200A50500000B004461646F734D657374726500020100
      000000390100002F0400000B0000003100050001000000000000000000FFFFFF
      1F0000000012006664734475706C696361746173506167617200000000050005
      00626567696E0D2D0020206966205B7172794475706C6963617461732E224469
      666572656E63696172225D3D46616C7365207468656E0D100020202020686569
      676874203A3D2031310D14002020656C736520686569676874203A3D2032323B
      0D0300656E6400FFFF000000000002000000010000000000000001000000C800
      000014000000010000000000000200120600000D00526F646170E94D65737472
      6531000201000000002F0200002F040000160000003000060001000000000000
      000000FFFFFF1F00000000000000000000000000FFFF00000000000200000001
      0000000000000001000000C8000000140000000100000000000002007E060000
      0C00526F6461706546696C69616C00020100000000D80100002F040000160000
      003000110001000000000000000000FFFFFF1F00000000000000000000000000
      FFFF000000000002000000010000000000000001000000C80000001400000001
      0000000000000200AE07000014004361626563616C686F477275706F46696C69
      616C00020100000000940000002F0400001D0000003000100001000000000000
      000000FFFFFF1F0000000048005B6966285B41677275706172477275706F6669
      6C69616C5D3D547275652C205B7172794475706C6963617461732E2247727570
      6F46696C69616C456D697373616F225D2C2727295D0000000006000500626567
      696E0D180020204746546F74616C56616C6F7256656E63746F3A3D303B0D1200
      20204746546F74616C4A75726F733A3D303B0D190020204746546F74616C5661
      6C6F72506167746F3A3D303B20200D180020204746546F74616C526567697374
      726F733A3D303B20200D0300656E6400FFFF0000000000020000000100000000
      00000001000000C8000000140000000100000000000002006408000013004361
      626563616C686F466F726E656365646F7200020100000000EC0000002F040000
      000000003000100001000000000000000000FFFFFF1F0000000043005B696628
      5B41677275706172466F726E656365646F725D3D547275652C205B7172794475
      706C6963617461732E224E6F6D65466F726E656365646F72225D2C2727295D00
      000000000000FFFF000000000002000000010000000000000001000000C80000
      0014000000010000000000000200D50800001100526F64617065477275706F46
      696C69616C00020100000000040200002F040000160000003000110001000000
      000000000000FFFFFF1F00000000000000000000000000FFFF00000000000200
      0000010000000000000001000000C80000001400000001000000000000020045
      0900001000526F64617065466F726E656365646F7200020100000000A4010000
      2F040000160000003000110001000000000000000000FFFFFF1F000000000000
      00000000000000FFFF000000000002000000010000000000000001000000C800
      000014000000010000000000000200660A00000F004361626563616C686F4669
      6C69616C00020100000000C00000002F0400001C000000300010000100000000
      0000000000FFFFFF1F000000003E005B6966285B4167727570617246696C6961
      6C5D3D547275652C205B7172794475706C6963617461732E2246696C69616C45
      6D697373616F225D2C2727295D0000000006000500626567696E0D1800202047
      46546F74616C56616C6F7256656E63746F3A3D303B0D120020204746546F7461
      6C4A75726F733A3D303B0D190020204746546F74616C56616C6F72506167746F
      3A3D303B20200D180020204746546F74616C526567697374726F733A3D303B20
      200D0300656E6400FFFF000000000002000000010000000000000001000000C8
      00000014000000010000000000000200120B000013004361626563616C686F44
      61746156656E63746F00020100000000060100002F0400000000000030001000
      01000000000000000000FFFFFF1F0000000039005B6966285B41677275706172
      446174615D3D547275652C205B7172794475706C6963617461732E2264617461
      76656E63746F225D2C2727295D00000000000000FFFF00000000000200000001
      0000000000000001000000C800000014000000010000000000000200F30B0000
      1000526F646170654461746156656E63746F00020100000000840100002F0400
      00160000003000110001000000000000000000FFFFFF1F000000000000000000
      0005000500626567696E0D2D0020206966205B7172794475706C696361746173
      2E224469666572656E63696172225D3D46616C7365207468656E0D1300202020
      2076697369626C65203A3D20547275650D1B002020656C73652076697369626C
      65203A3D2046616C73653B2020200D0300656E6400FFFF000000000002000000
      010000000000000001000000C8000000140000000100000000000002005C0C00
      000900666276526F6461706500020100000000B80200002F0400000D00000030
      00030001000000000000000000FFFFFF1F00000000000000000000000000FFFF
      000000000002000000010000000000000001000000C800000014000000010000
      000000000200C50C000009004361626563616C686F000201000000002E000000
      2F040000590000003000020001000000000000000000FFFFFF1F000000000000
      00000000000000FFFF000000000002000000010000000000000001000000C800
      0000140000000100000000000002007F0D000016004361626563616C686F446F
      63756D656E746F73506167000201000000001E0100002F040000000000003000
      100001000000000000000000FFFFFF1F0000000044005B6966285B4167727570
      6172446F63756D656E746F735061675D3D547275652C205B7172794475706C69
      63617461732E22646F63756D656E746F706167225D2C2727295D000000000000
      00FFFF000000000002000000010000000000000001000000C800000014000000
      010000000000000200630E00001300526F64617065446F63756D656E746F7350
      616700020100000000580100002F040000160000003000110001000000000000
      000000FFFFFF1F0000000000000000000005000500626567696E0D2D00202069
      66205B7172794475706C6963617461732E224469666572656E63696172225D3D
      46616C7365207468656E0D13002020202076697369626C65203A3D2054727565
      0D1B002020656C73652076697369626C65203A3D2046616C73653B2020200D03
      00656E6400FFFF000000000002000000010000000000000001000000C8000000
      14000000010000000000000000F50E00000A006D6D6F5A65627261646F000200
      1C00000039010000E20300000B0000004300000001000000FFFFFF1F0000FFFF
      FF1F2C02000000000000000002000500626567696E0D0300656E6400FFFF0000
      000000020000000100000000090068656C766574696361000700000000000000
      0000000000000100020000000000FFFFFF1F0000000200000000000000000095
      0F000005004D656D6F390002001600000039010000240000000B000000400000
      00F4010000000000000000FFFFFF1F2C02000000000001001E005B7172794475
      706C6963617461732E22646F63756D656E746F706167225D00000000FFFF0000
      000000020000000100000006090068656C766574696361000700000000000000
      0000010000000100020000000000FFFFFF000000000200000000000000000031
      10000006004D656D6F31300002003600000039010000180000000B0000004000
      0000F4010000000000000000FFFFFF1F2C020000000000010019005B71727944
      75706C6963617461732E226E756D65726F225D2000000000FFFF000000000002
      0000000100000006090068656C76657469636100070000000000000000000100
      00000100020000000000FFFFFF0000000002000000000000000000D810000006
      004D656D6F31310002007502000039010000470000000B00000040000000F401
      0000000000000000FFFFFF1F2C020000000000010024005B7172794475706C69
      63617461732E227369676C6162616E636F636F6272616E6361225D00000000FF
      FF0000000000020000000100000006090068656C766574696361000700000000
      0000000000000000000100020000000000FFFFFF000000000200000000000000
      00005F11000005004D656D6F310002001A0000006D0000002400000017000000
      43000F00F4010000000000000000FFFFFF1F2C02000000000001000500444F43
      544F00000000FFFF0000000000020000000100000000090068656C7665746963
      6100070000000000000000000A0000000100020000000000FFFFFF0000000002
      000000000000000000E311000005004D656D6F320002003E0000006D00000010
      0000001700000043000F00F4010000000000000000FFFFFF1F2C020000000000
      010002004E5000000000FFFF0000000000020000000100000000090068656C76
      657469636100070000000000000000000A0000000100020000000000FFFFFF00
      000000020000000000000000007612000005004D656D6F33000200750200006D
      0000003F0000001700000043000F00F4010000000000000000FFFFFF1F2C0200
      000000000200060042414E434F200D0800434F4252414EC74100000000FFFF00
      00000000020000000100000000090068656C7665746963610007000000000000
      0000000A0000000100020000000000FFFFFF0000000002000000000000000000
      0613000005004D656D6F36000200AE0100006D0000003F000000170000004300
      0F00F4010000000000000000FFFFFF1F2C0200000000000200050056414C4F52
      0D060056454E43544F00000000FFFF0000000000020000000100000000090068
      656C76657469636100070000000000000000000A0000000100020000000000FF
      FFFF00000000020000000000000000009213000005004D656D6F370002002B01
      00006D000000830000001700000043000F00F4010000000000000000FFFFFF1F
      2C02000000000001000A00464F524E454345444F5200000000FFFF0000000000
      020000000100000000090068656C76657469636100070000000000000000000A
      0000000100020000000000FFFFFF000000000200000000000000000034140000
      06004D656D6F31330002009A000000390100000E0000000B00000040000000F4
      010000000000000000FFFFFF1F2C02000000000001001F005B7172794475706C
      6963617461732E2266696C69616C656D697373616F225D00000000FFFF000000
      0000020000000100000006090068656C76657469636100070000000000000000
      00010000000100020000000000FFFFFF00000000020000000000000000002715
      000006004D656D6F3134000200B4020000390100001F0000000B000000400000
      00F4010000000000000000FFFFFF1F2C02000000000001000000000500050062
      6567696E0D250020206966205B7172794475706C6963617461732E226F627322
      5D203C3E202727207468656E0D2300202020202020204D656D6F3A3D205B7172
      794475706C6963617461732E226F6273225D0D12002020656C7365204D656D6F
      3A3D2027273B200D0300656E6400FFFF00000000000200000001000000060900
      68656C7665746963610007000000000000000000020000000100020000000000
      FFFFFF0000000002000000000000000000AE15000006004D656D6F3138000200
      B40200006D000000230000001700000043000F00F4010000000000000000FFFF
      FF1F2C020000000000010004005349542E00000000FFFF000000000002000000
      0100000000090068656C76657469636100070000000000000000000A00000001
      00020000000000FFFFFF00000000020000000000000000002F17000006004D65
      6D6F3139000200A2010000390100004B0000000B00000040000000F401000000
      0000000000FFFFFF1F2C02000000000001003B005B466F726D6174466C6F6174
      28272323232C2323232C2323302E3030272C7172794475706C6963617461732E
      2276616C6F7276656E63746F22295D0007000500626567696E0D01007B0D2F00
      20206966205B7172794475706C6963617461732E226469666572656E63696172
      22205D203D2074727565207468656E0D4700202020206D656D6F203A3D205B46
      6F726D6174466C6F617428272323232C2323232C2323302E3030272C71727944
      75706C6963617461732E2276616C6F7276656E63746F22295D0D12002020656C
      7365206D656D6F203A3D2027273B0D01007D0D0300656E6400FFFF0000000000
      020000000100000006090068656C766574696361000700000000000000000001
      0000000100020000000000FFFFFF1F1D005B7172794475706C6963617461732E
      226469666572656E63696172225D0002000000000000000000BE17000006004D
      656D6F32320002004E0000006D0000004C0000001700000043000F00F4010000
      000000000000FFFFFF1F2C02000000000001000C0053C9524945202F204E4F54
      4100000000FFFF0000000000020000000100000000090068656C766574696361
      00070000000000000000000A0000000100020000000000FFFFFF000000000200
      0000000000000000B518000006004D656D6F32330002004E0000003901000046
      0000000B00000043000000F4010000000000000000FFFFFF1F2C020000000000
      010074005B4946285B7172794475706C6963617461732E22636F6D706C656D65
      6E746F6475706C6963617461225D3D27272C5B7172794475706C696361746173
      2E22636F6D706C656D656E746F225D2C5B7172794475706C6963617461732E22
      636F6D706C656D656E746F6475706C6963617461225D295D00000000FFFF0000
      000000020000000100000006090068656C766574696361000700000000000000
      0000020000000100020000000000FFFFFF000000000200000000000000000088
      19000005004D656D6F380002009D01000033020000500000000E000000430000
      00F4010000000000000000FFFFFF1F2C020000000000010051005B466F726D61
      74466C6F617428272323232C2323232C2323302E3030272C53554D285B717279
      4475706C6963617461732E2276616C6F7276656E63746F225D2C204461646F73
      4D65737472652C3129295D00000000FFFF000000000002000000010000000009
      0068656C76657469636100070000000200000000000100000001000200000000
      00FFFFFF0000000002000000000000000000741A000006004D656D6F31350002
      0073010000330200002B0000000E00000043000000F4010000000000000000FF
      FFFF1F2C020000000000010000000005000500626567696E0D25002020696620
      5B53554D28312C4461646F734D65737472652C31295D203C3E2030207468656E
      0D2400202020202020204D656D6F3A3D205B53554D28312C4461646F734D6573
      7472652C31295D0D0A002020656C73652027273B0D0300656E6400FFFF000000
      0000020000000100000000090068656C76657469636100070000000200000000
      00010000000100020000000000FFFFFF0000000002000000000000000000031B
      000006004D656D6F3137000200E900000033020000850000000E000000430000
      00F4010000000000000000FFFFFF1F2C02000000000001000C00544F54414C20
      474552414C3A00000000FFFF0000000000020000000100000000090068656C76
      65746963610007000000000000000000010000000100020000000000FFFFFF00
      00000002000000000000000000881B000005004D656D6F350002009A0000006D
      000000110000001700000043000F00F4010000000000000000FFFFFF1F2C0200
      000000000100030046494C00000000FFFF000000000002000000010000000009
      0068656C76657469636100070000000000000000000A00000001000200000000
      00FFFFFF0000000002000000000000000000111C000006004D656D6F32310002
      00D80000006D0000002D0000001700000043000F00F4010000000000000000FF
      FFFF1F2C0200000000000100060056454E43544F00000000FFFF000000000002
      0000000100000000090068656C76657469636100070000000000000000000A00
      00000100020000000000FFFFFF00000000020000000000000000009B1C000006
      004D656D6F3236000200AB0000006D0000002D0000001700000043000F00F401
      0000000000000000FFFFFF1F2C02000000000001000700454D495353C34F0000
      0000FFFF0000000000020000000100000000090068656C766574696361000700
      00000000000000000A0000000100020000000000FFFFFF000000000200000000
      0000000000221D000006004D656D6F3238000200050100006D00000026000000
      1700000043000F00F4010000000000000000FFFFFF1F2C020000000000010004
      0043D3442E00000000FFFF0000000000020000000100000000090068656C7665
      7469636100070000000000000000000A0000000100020000000000FFFFFF0000
      000002000000000000000000C11D000006004D656D6F32390002000501000039
      010000260000000B00000040000000F4010000000000000000FFFFFF1F2C0200
      0000000001001C005B7172794475706C6963617461732E22666F726E65636564
      6F72225D00000000FFFF0000000000020000000100000006090068656C766574
      6963610007000000000000000000010000000100020000000000FFFFFF000000
      0002000000000000000000511E000006004D656D6F3330000200ED0100006D00
      0000310000001700000043000F00F4010000000000000000FFFFFF1F2C020000
      0000000200050056414C4F520D0500444553432E00000000FFFF000000000002
      0000000100000000090068656C76657469636100070000000000000000000A00
      00000100020000000000FFFFFF0000000002000000000000000000961F000006
      004D656D6F3331000200DE01000039010000400000000B00000040000000F401
      0000000000000000FFFFFF1F2C02000000000001000000000500050062656769
      6E0D2E0020206966205B7172794475706C6963617461732E2276616C6F726465
      73636F6E746F225D203C3E2030207468656E0D4B00202020202020204D656D6F
      3A3D205B466F726D6174466C6F617428272323232C2323232C2323302E303027
      2C7172794475706C6963617461732E2276616C6F72646573636F6E746F22295D
      0D11002020656C7365204D656D6F3A3D2027273B0D0300656E6400FFFF000000
      0000020000000100000006090068656C76657469636100070000000000000000
      00010000000100020000000000FFFFFF1F22005B7172794475706C6963617461
      732E224469666572656E63696172225D3D547275650002000000000000000000
      4020000006004D656D6F3235000200D8000000390100002D0000000B00000040
      000000F4010000000000000000FFFFFF1F2C020000000000010027005B717279
      4475706C6963617461732E226461746176656E63746F2220234464642F6D6D2F
      79795D00000000FFFF0000000000020000000100000006090068656C76657469
      63610007000000000000000000020000000100020000000000FFFFFF00000000
      02000000000000000000E720000006004D656D6F3237000200AB000000390100
      002D0000000B00000040000000F4010000000000000000FFFFFF1F2C02000000
      0000010024005B7172794475706C6963617461732E22656D697373616F222023
      4464642F6D6D2F79795D00000000FFFF00000000000200000001000000060900
      68656C7665746963610007000000000000000000020000000100020000000000
      FFFFFF0000000002000000000000000000BD21000006004D656D6F3332000200
      D601000033020000480000000E00000043000000F4010000000000000000FFFF
      FF1F2C020000000000010053005B466F726D6174466C6F617428272323232C23
      23232C2323302E3030272C53554D285B7172794475706C6963617461732E2276
      616C6F72646573636F6E746F225D2C204461646F734D65737472652C3129295D
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      07000000020000000000010000000100020000000000FFFFFF00000000020000
      000000000000007122000006004D656D6F3333000200EDFFFFFFDC0100008101
      00000E00000043000000F4010000000000000000FFFFFF1F2C02000000000001
      003100544F54414C2046494C49414C3A205B7172794475706C6963617461732E
      224E6F6D6546696C69616C456D697373616F225D00000000FFFF000000000002
      0000000100000000090068656C76657469636100070000000000000000000100
      00000100020000000000FFFFFF00000000020000000000000000004523000006
      004D656D6F33340002009D010000DC010000500000000E00000043000000F401
      0000000000000000FFFFFF1F2C020000000000010051005B466F726D6174466C
      6F617428272323232C2323232C2323302E3030272C53554D285B717279447570
      6C6963617461732E2276616C6F7276656E63746F225D2C204461646F734D6573
      7472652C3129295D00000000FFFF000000000002000000010000000009006865
      6C7665746963610007000000020000000000010000000100020000000000FFFF
      FF00000000020000000000000000003124000006004D656D6F33350002007301
      0000DC0100002B0000000E00000043000000F4010000000000000000FFFFFF1F
      2C020000000000010000000005000500626567696E0D250020206966205B5355
      4D28312C4461646F734D65737472652C31295D203C3E2030207468656E0D2400
      202020202020204D656D6F3A3D205B53554D28312C4461646F734D6573747265
      2C31295D0D0A002020656C73652027273B0D0300656E6400FFFF000000000002
      0000000100000000090068656C76657469636100070000000200000000000100
      00000100020000000000FFFFFF00000000020000000000000000000725000006
      004D656D6F3336000200D6010000DC010000480000000E00000043000000F401
      0000000000000000FFFFFF1F2C020000000000010053005B466F726D6174466C
      6F617428272323232C2323232C2323302E3030272C53554D285B717279447570
      6C6963617461732E2276616C6F72646573636F6E746F225D2C204461646F734D
      65737472652C3129295D00000000FFFF00000000000200000001000000000900
      68656C7665746963610007000000020000000000010000000100020000000000
      FFFFFF0000000002000000000000000000B225000006004D656D6F3337000200
      E000000098000000DE0000001400000043000F00F4010000000000000000FFFF
      FF1F2C020000000000010028005B7172794475706C6963617461732E224E6F6D
      65477275706F46696C69616C456D697373616F225D00000000FFFF0000000000
      020000000100000000090068656C766574696361000700000002000000000008
      0000000100020000000000FFFFFF00000000020000000000000000004C260000
      06004D656D6F37310002001C00000098000000980000001400000043000F00F4
      010000000000000000FFFFFF1F2C02000000000001001700475255504F204649
      4C49414C20444520454D495353C34F00000000FFFF0000000000020000000100
      000000090068656C766574696361000700000000000000000009000000010002
      0000000000FFFFFF0000000002000000000000000000F326000006004D656D6F
      3732000200B900000098000000220000001400000043000F00F4010000000000
      000000FFFFFF1F2C020000000000010024005B7172794475706C696361746173
      2E22477275706F46696C69616C456D697373616F225D00000000FFFF00000000
      00020000000100000000090068656C7665746963610007000000000000000000
      090000000100020000000000FFFFFF0000000002000000000000000000992700
      0006004D656D6F3338000200E0000000C4000000DE0000001400000043000F00
      F4010000000000000000FFFFFF1F2C020000000000010023005B717279447570
      6C6963617461732E224E6F6D6546696C69616C456D697373616F225D00000000
      FFFF0000000000020000000100000000090068656C7665746963610007000000
      020000000000080000000100020000000000FFFFFF0000000002000000000000
      0000002D28000006004D656D6F333900020044000000C4000000700000001400
      000043000F00F4010000000000000000FFFFFF1F2C0200000000000100110046
      494C49414C20444520454D495353C34F00000000FFFF00000000000200000001
      00000000090068656C7665746963610007000000000000000000090000000100
      020000000000FFFFFF0000000002000000000000000000CF28000006004D656D
      6F3430000200B9000000C4000000220000001400000043000F00F40100000000
      00000000FFFFFF1F2C02000000000001001F005B7172794475706C6963617461
      732E2246696C69616C456D697373616F225D00000000FFFF0000000000020000
      000100000000090068656C766574696361000700000000000000000009000000
      0100020000000000FFFFFF00000000020000000000000000009129000006004D
      656D6F3431000200EDFFFFFF08020000810100000E00000043000000F4010000
      000000000000FFFFFF1F2C02000000000001003F00544F54414C20475255504F
      2044452046494C49414C3A205B7172794475706C6963617461732E224E6F6D65
      477275706F46696C69616C456D697373616F225D00000000FFFF000000000002
      0000000100000000090068656C76657469636100070000000000000000000100
      00000100020000000000FFFFFF0000000002000000000000000000652A000006
      004D656D6F34320002009D01000008020000500000000E00000043000000F401
      0000000000000000FFFFFF1F2C020000000000010051005B466F726D6174466C
      6F617428272323232C2323232C2323302E3030272C53554D285B717279447570
      6C6963617461732E2276616C6F7276656E63746F225D2C204461646F734D6573
      7472652C3129295D00000000FFFF000000000002000000010000000009006865
      6C7665746963610007000000020000000000010000000100020000000000FFFF
      FF0000000002000000000000000000512B000006004D656D6F34330002007301
      0000080200002B0000000E00000043000000F4010000000000000000FFFFFF1F
      2C020000000000010000000005000500626567696E0D250020206966205B5355
      4D28312C4461646F734D65737472652C31295D203C3E2030207468656E0D2400
      202020202020204D656D6F3A3D205B53554D28312C4461646F734D6573747265
      2C31295D0D0A002020656C73652027273B0D0300656E6400FFFF000000000002
      0000000100000000090068656C76657469636100070000000200000000000100
      00000100020000000000FFFFFF0000000002000000000000000000272C000006
      004D656D6F3434000200D601000008020000480000000E00000043000000F401
      0000000000000000FFFFFF1F2C020000000000010053005B466F726D6174466C
      6F617428272323232C2323232C2323302E3030272C53554D285B717279447570
      6C6963617461732E2276616C6F72646573636F6E746F225D2C204461646F734D
      65737472652C3129295D00000000FFFF00000000000200000001000000000900
      68656C7665746963610007000000020000000000010000000100020000000000
      FFFFFF0000000002000000000000000000DC2C000006004D656D6F3435000200
      EDFFFFFFA8010000810100000E00000043000000F4010000000000000000FFFF
      FF1F2C02000000000001003200544F54414C20464F524E454345444F523A205B
      7172794475706C6963617461732E224E6F6D65466F726E656365646F72225D00
      000000FFFF0000000000020000000100000000090068656C7665746963610007
      000000000000000000010000000100020000000000FFFFFF0000000002000000
      000000000000B02D000006004D656D6F34360002009D010000A8010000500000
      000E00000043000000F4010000000000000000FFFFFF1F2C0200000000000100
      51005B466F726D6174466C6F617428272323232C2323232C2323302E3030272C
      53554D285B7172794475706C6963617461732E2276616C6F7276656E63746F22
      5D2C204461646F734D65737472652C3129295D00000000FFFF00000000000200
      00000100000000090068656C7665746963610007000000020000000000010000
      000100020000000000FFFFFF00000000020000000000000000009C2E00000600
      4D656D6F343700020073010000A80100002B0000000E00000043000000F40100
      00000000000000FFFFFF1F2C020000000000010000000005000500626567696E
      0D250020206966205B53554D28312C4461646F734D65737472652C31295D203C
      3E2030207468656E0D2400202020202020204D656D6F3A3D205B53554D28312C
      4461646F734D65737472652C31295D0D0A002020656C73652027273B0D030065
      6E6400FFFF0000000000020000000100000000090068656C7665746963610007
      000000020000000000010000000100020000000000FFFFFF0000000002000000
      000000000000722F000006004D656D6F3438000200D6010000A8010000480000
      000E00000043000000F4010000000000000000FFFFFF1F2C0200000000000100
      53005B466F726D6174466C6F617428272323232C2323232C2323302E3030272C
      53554D285B7172794475706C6963617461732E2276616C6F72646573636F6E74
      6F225D2C204461646F734D65737472652C3129295D00000000FFFF0000000000
      020000000100000000090068656C766574696361000700000002000000000001
      0000000100020000000000FFFFFF000000000200000000000000000015300000
      06004D656D6F32300002002B01000039010000870000000B0000004000000001
      000000000000000000FFFFFF1F2C020000000000010020005B7172794475706C
      6963617461732E226E6F6D65666F726E656365646F72225D00000000FFFF0000
      000000020000000100000006090068656C766574696361000700000000000000
      0000000000000100020000000000FFFFFF0000000002000000000000000000DF
      30000006004D656D6F34390002001500000088010000590100000E0000004300
      0000F4010000000000000000FFFFFF1F2C02000000000001004700544F54414C
      204449413A205B464F524D41544441544554494D45282764642F6D6D2F797979
      79272C205B7172794475706C6963617461732E226461746176656E63746F225D
      295D00000000FFFF0000000000020000000100000000090068656C7665746963
      610007000000000000000000010000000100020000000000FFFFFF0000000002
      000000000000000000B331000006004D656D6F35300002009D01000088010000
      500000000E00000043000000F4010000000000000000FFFFFF1F2C0200000000
      00010051005B466F726D6174466C6F617428272323232C2323232C2323302E30
      30272C53554D285B7172794475706C6963617461732E2276616C6F7276656E63
      746F225D2C204461646F734D65737472652C3129295D00000000FFFF00000000
      00020000000100000000090068656C7665746963610007000000020000000000
      010000000100020000000000FFFFFF00000000020000000000000000009F3200
      0006004D656D6F353100020073010000880100002B0000000E00000043000000
      F4010000000000000000FFFFFF1F2C0200000000000100000000050005006265
      67696E0D250020206966205B53554D28312C4461646F734D65737472652C3129
      5D203C3E2030207468656E0D2400202020202020204D656D6F3A3D205B53554D
      28312C4461646F734D65737472652C31295D0D0A002020656C73652027273B0D
      0300656E6400FFFF0000000000020000000100000000090068656C7665746963
      610007000000020000000000010000000100020000000000FFFFFF0000000002
      0000000000000000007533000006004D656D6F3532000200D601000088010000
      480000000E00000043000000F4010000000000000000FFFFFF1F2C0200000000
      00010053005B466F726D6174466C6F617428272323232C2323232C2323302E30
      30272C53554D285B7172794475706C6963617461732E2276616C6F7264657363
      6F6E746F225D2C204461646F734D65737472652C3129295D00000000FFFF0000
      000000020000000100000000090068656C766574696361000700000002000000
      0000010000000100020000000000FFFFFF000000000200000000000000000002
      34000006004D656D6F3533000200530300006D000000AA000000170000004300
      0F00F4010000000000000000FFFFFF1F2C02000000000001000A004F42534552
      5641C7C34F00000000FFFF0000000000020000000100000000090068656C7665
      7469636100070000000000000000000A0000000100020000000000FFFFFF0000
      000002000000000000000000A134000006004D656D6F35340002005303000039
      010000AC0000000B00000043000000F4010000000000000000FFFFFF1F2C0200
      0000000001001C005B7172794475706C6963617461732E224F62736572766163
      616F225D00000000FFFF0000000000020000000100000006090068656C766574
      6963610007000000000000000000000000000100020000000000FFFFFF000000
      00020000000000000000003E3500000F006D6D6F524F44415045484F52415F50
      0002001C000000B8020000580000000A00000043000000F40100000000000000
      00FFFFFF1F2C020000000000010011005B54494D4520235468683A6D6D3A7373
      5D00000000FFFF0000000000020000000100000006090068656C766574696361
      0007000000000000000000100000000100020000000000FFFFFF000000000200
      0000000000000000E73500000C006D6D6F544543534F46545F500002001F0300
      00B8020000DC0000000A00000043000000F4010000000000000000FFFFFF1F2C
      02000000000001002000746563534F4654202D205465636E6F6C6F6769612065
      6D2053697374656D617300000000FFFF00000000000200000001000000060900
      68656C7665746963610007000000000000000000110000000100020000000000
      FFFFFF00000000020000000000000001000E4E000009006670764C6F676F5F50
      0002001B0000002E000000780000002A00000007000000F40100000000000000
      00FFFFFF1F2C020000000000000000000000FFFF000000000002000000010000
      000001000E4E0000424DCE170000000000003604000028000000830000002600
      0000010008000000000098130000120B0000120B000000010000000100000000
      0000E8E5A800AA9E000099990000ADADAD003A3C4100A3970000BFB73700D8D4
      8600FBFAF000A5A5A5001E1D1C00D8D9DA0054575A00D6D6D500E7E8F2001216
      1B00B6AD1900CBC55B008C8D9200BEC0C500E1E2E40085878A005E606300494C
      4F00090D12002C2E3300DEDB98007D7F8100EFEDCB00B9BABB00AEA400007C7B
      7B00C5BE440066666600D1CC6F00CDC9810048484600F7F6E600AFA508000408
      0D00F9F8ED00B8AF2700DBD68C00999999001B1A1900C6BF5100131312003B3A
      3A00FFFFFF00EAE8BE00CCCCCC0023262A00E2DEA400F1EFD600B0B1B300D3CD
      7500B1A81000CCCC660072727200535252004342420001060A00ECE9C3008C8C
      8B00F5F4DF004A4A4A0057575600B6AC1F00282B3000C7C05C0061615F00F7F7
      F70088888700DDD89300E3E0A600FDFCF70021242900070A1000BDB53100C5BE
      4A00E3E3E200A69C000099999900BABAB900DEDEDE00525458002A292800D9D5
      8A005F5E5D00C7C595001B1E2300E8E5B60000000700B5AB1300D5D07B00C6C6
      C500B2A80B0021202000B9B12400504F4E00666666006B6D7000B5B5BD008484
      8400E0DC9E00BCB42C00F7EFD6005B5B5A00EFEFEF0087898B00DEDEE6003E3D
      3C0014181E00C8C25300CCC55F00A8A9AC00BDBDBC00E5E1AC0075767900181B
      2000E6E6E6000E1117000810190033333300929191002D2C2B00B5B5B4000000
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
      0000000000000000000000000000000000000000000000000000000000003131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131543D42470E313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31523131313131486D3131316D6D4C3131316D6D313131313131313131316D48
      31313131313131316D6D3131316D040A6C6C313131313131486D6D4C31313131
      31316D6D4C313131313131313131313131486D6D6D313131313131486D6D4831
      3131316D483131316D6D3131313131313131313131316D6D6D3131486D6D6D31
      313131313152313131317F7E6631554225256031603D42647931420C313B7D31
      6D6C3D70403131662C316D593D7068313133646C702531484255312C70643059
      313131310C2525420E31477431420E4825793131315442433D474C4C640E3120
      423C300A3131207E2C317F70254748484251512531603C316D59253C620A312C
      25433068313131313152313131316C2031315959313131317C7D4C4C31487C0E
      3159683177424C51347531434031203D487957543130494C7F3D31487C0C310B
      37317F70313131313C6631313131642C317C33487E51313131313179602F5531
      7C3331316D793B7031487E14314857043131316D7C55557E311E3031542D4C31
      4340313148790A0B4C313131315231313131477D313125306C64334C57793131
      31487C0E31224931422C31314340316C7D313C7D3131594931570C31543D3148
      7C0C3168705930253131313170706C3C0E313C0A313033317C513131310C7025
      70474C4C3033312C7C64300A3148300E31796243432248483051517C31603D31
      6D6464590B2C31547C42301C313131313152313131314749313166420C554831
      3D2C484831487C0E48302C311C4248516275316C7D31493D4879627F31256848
      373031487C0E3131550E207031313131473C0C554831642C4C7E330C62793131
      316830796D3131487C3331577D6D6D313148303331487C49555131487C0C0C7E
      4C2C703131480C0E7C2C313C476D6D31313131313152313131040B7E20316D47
      3C6C33310E3D3C6C7931254264646D31486C42706831316C7D31484742702031
      310E3D433D6C31484355314043473D0A31313131796C3C6C0E316670597E3C3D
      20313131310E256C6C7731316C0E312C3D47430431772F3D0A31334243664848
      25643C7E6C7C74316D225943425531543D59437D3131313131523131316D643B
      6D3131316D514831313179514C316D51793131313131796D3131313C40313131
      796D313131313179794831317F6D316D15154831313131313131795148314879
      516D796D3131313131313151517931317F6D31316D51516D3151577F6D313131
      797931316D51516D5148313131515151313131314851516D3131313131523131
      3131400431313131313131313131313131313131313131313131313131313168
      04313131313131313131313131313148660F3131313131313131313131313131
      3131313131313131313131313131313131313131220E31313131313131316655
      3131313131313131313131313131313131313131313131313131313131313131
      3152313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131313131313131315C46121212463F3131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131523131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131315F06020202061B31
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131523131313131310E40173C18183D6E3131313131310C2C
      666C3C181818181805683131313131316D3768220D0516313131313108021F1F
      1F5235313131313172070707070707070707070707070750732B363131313131
      3131313131362B73212112081D31313131313131313123505050504B31313131
      31313131313F08122E505050085231313131312C103E191919195D1731313131
      7966713E4E191919191919195D0D31313131312C342828191900173131313131
      08021F1F1F523531313131311152020202020202020202020202020202022776
      313131313131313F501F02020202020202075C313131313131316A060202065F
      313131313131314C120202020202020221523131313175287A78787878784E22
      3131310E1A3E10787871717171717171281731313131773E7A71717171282231
      3131313108021F1F1F5235313131313144021F1F1F1F1F1F1F1F1F1F1F1F1F1F
      1F1F1F1F1D31313131310802021F1F1F1F1F1F1F1F0202233131313131310702
      1F1F0208313131313131313A521F1F1F1F1F1F1F5052313131310D4E7878787A
      7A71282231316D7C4E7878784E4E7A717171717128173131312C3E7171717119
      195D22313131313108021F1F1F5269314C4C4C4C631F1F1F1F1F1F1F1F1F1F1F
      1F1F1F1F1F1F1F52503131313138521F1F1F0202020202021F1F1F5212313131
      313107021F1F0208313131313131361F1F1F1F1F0202020221523131316D457A
      78787A3D370E0E5131313B3E7878787A2274140E0E0E0E0E0E15313115787A78
      7871190D0A145A2A6A6A6A2A5F36363636365044111111113226262626262626
      262626262626264A1F1F1F1F612631311B521F1F1F02443A08082363021F1F1F
      525F3131313107021F1F02083131313131311B021F1F1F1F6A2B353532523131
      310E71717171710C313131313115781078784E68313131313131313131313131
      1C287878787A2C3131310106020202025F313131313150520202020236313131
      31313131313131313131313144021F1F1F32312639021F1F1F584C3131313131
      1B27021F1F1F3631313107021F1F020831313131313123021F1F1F1109313131
      3152313131337A717171454831313131312C28787810344C3131313131313131
      31313131057A78784E663131313135021F1F1F025F313131313150021F1F1F1F
      3631313131313131313131313131314C5E021F1F0276315F521F1F1F4B313131
      313131313132271F1F527331313107021F1F020831313131313112021F1F0272
      313131313152313131601978787A7C4C3131313131662878781045166E6E6E6E
      6E6E6E6E1C0431555B1078717A603131313135021F1F1F025F31313131315002
      1F1F1F1F36313131313131314C0909090909363A021F1F1F1F3F314F021F0272
      3131313131313131313123021F1F1109313107021F1F02083131313131312E02
      1F1F0273313131313152313131601978787A054C313131313156197878787128
      2828282828282828005631337A717171346D313131313552020202025F313131
      31312106020202023631313131762E635E61616161611F1F1F1F1F1F114C2661
      1F1F0276313131313131313131311D1F1F1F1F1D313107021F1F020831313131
      31312E021F1F023A313131313152313131601978787A054C3131313131181978
      7878787878787878787878784E1731141978787A454831313131764444444444
      241551515151464F4F4F4F4F413131313A0202021F1F1F1F1F1F1F1F1F1F1F52
      1B311D1F1F1F1F363131313131313131313126391F1F1F5C313107021F1F0208
      3131313131312E021F1F023A313131313152313131601978787A054C31313131
      315619787878787878787878787878784E1731337A717171346D313131313109
      090909097D713434347A37313131313131313158521F1F1F1F1F020202020202
      0202275831311D1F1F1F1F1D3131313131313131313126391F1F1F5C31310702
      1F1F02083131313131312E021F1F023A313131313152313131601978787A054C
      3131313131224E787878784E28282828282828280056310C787171715B0C3131
      3131313131313131133E1010105D74313131313131312939021F1F1F1F391163
      6363636A50083631313126611F1F024B313131313131313131313F021F1F1F36
      313107021F1F02083131313131312E021F1F023A313131313152313131601978
      787A054C313131313116287878101A2C2C2C2C2C2C2C2C2C7D1E316D1A7A7878
      197F31313131313131313131134E78787828743131313131313176021F1F1F1F
      23263131313131313131313131313107021F0221313131313131313131317302
      1F1F444C313107021F1F02083131313131312E021F1F023A3131313131523131
      31601978787A054C31313131317F197171713448313131313131313131313131
      561978784E6631313131313131313131134E7878782874313131313131312B52
      1F1F1F6129313131313131313131313131313158521F1F024A31313131313131
      317602021F522331313107021F1F02083131313131312E021F1F023A31313131
      3152313131331978787A053131313131316D347A78784E133131313131313131
      313131317D287878717104313131313131313131130019191900043131313131
      31312B521F1F1F274131313131313131313131313131310911021F1F1F232631
      313131295F1F1F1F1F612931313107021F1F022B3131313131312E021F1F5223
      3131313131520E14602C7A78787A7C141414140C3131203E78787171660A1E60
      14141414140E3131155B107878107A567D371E1E1E1E1E1E13566C6C6C182C75
      757575756D315C021F1F1F1F211B1B1B1B1B1B4A4A4A4A4A3631313176021F1F
      1F0261502323725E021F1F1F0258762B2B4A44021F1F1F504A4A4A2B1D312E02
      1F1F1F074A4A4A4A5C520D7A7A7A78787878787A7A7A5D173131794519787878
      4E4E7A7A7A7A7A7A5D6C313131165D7171717119191919191919195D6E313131
      313166007A7A7A4E1431295E021F1F1F0202020202020202020202062B313131
      315802021F1F1F020202021F1F1F1F52384C395252521F1F1F1F1F0202020206
      08312E021F1F1F1F0202020221521771717878787878787171714E2231313133
      5B28717878787871717171714E1731313131173E7A717878787878787878784E
      6E313131313166287171717A6031314A521F1F1F1F1F1F1F1F1F1F1F1F1F1F52
      4A31313131316939521F1F1F1F1F1F1F1F020258310911021F1F1F1F1F1F1F1F
      1F1F1F022B312E021F1F1F1F1F1F1F1F50520D19191978787878781919190017
      313131310C0D10284E4E191919191919000D31313131317D1A4E4E4E19191919
      191919001C3131313131662878787810603131315F0202020202020202020202
      020202062B31313131313136733902020202020261721D313129615252521F1F
      1F1F1F020202020608312E021F1F1F1F0202020221527D17173C107878714D17
      17170D2C3131313131310E0A1C3B2217171717170D7D31313131313148757D77
      661717171717170D0431313131316628787878106031313131364A3A72727272
      72727272727272505C3131313131313131264B5F737338354131313131093A72
      72725E1F1F1F1F4F1212122E5C312E021F1F1F631212121258523131310E1978
      787A053131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131313131313117003E3E3E5D7531313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313107021F1F52583131313131312E021F1F02233131313131523131
      31601978787A054C313131313131313131313131313131313131313131313131
      313131313131313131313131313131313131313131317F686E6E6E6E15313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313121021F1F02073131313131312E021F1F023A31313131
      3152313131601978787A054C3131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313173021F1F1F1F4F3A233A32312E021F1F023A
      313131313152313131601978787A054C31313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131313131313169521F1F1F1F0202020608312E02
      1F1F023A313131313152313131601978787A054C313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131313131313131310963521F1F1F1F1F1F02
      4A312E021F1F023A313131313152313131601971717A054C3131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131314150611F1F
      1F1F1F024A3150021F1F023A3131313131523131310C0D17176C774C31313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      315C3872727272725C31082E2E2E2E1B31313131315200009E4E00000B006D6D
      6F544954554C4F5F50000200790100002E0000002F0200001500000043000000
      F4010000000000000000FFFFFF1F2C020000000000010008005B544954554C4F
      5D00000000FFFF0000000000020000000100000000090068656C766574696361
      000B000000020000000000020000000100020000000000FFFFFF000000000200
      00000000000000002F4F00000F006D6D6F524F54554C4F444154415F50000200
      B20300002E0000001C0000000C00000043000000F4010000000000000000FFFF
      FF1F2C02000000000001000500446174613A00000000FFFF0000000000020000
      000100000000090068656C766574696361000600000000000000000000000000
      0100020000000000FFFFFF0000000002000000000000000000C64F000009006D
      6D6F444154415F50000200D20300002E0000002C0000000C00000043000000F4
      010000000000000000FFFFFF1F2C020000000000010011005B44415445202344
      64642F6D6D2F79795D00000000FFFF0000000000020000000100000000090068
      656C7665746963610006000000000000000000010000000100020000000000FF
      FFFF00000000020000000000000000005B50000011006D6D6F524F54554C4F50
      4147494E415F50000200B20300003B000000280000000C00000043000000F401
      0000000000000000FFFFFF1F2C0200000000000100070050E167696E613A0000
      0000FFFF0000000000020000000100000000090068656C766574696361000600
      0000000000000000000000000100020000000000FFFFFF000000000200000000
      0000000000EA5000000B006D6D6F504147494E415F50000200DE0300003B0000
      00200000000C00000043000000F4010000000000000000FFFFFF1F2C02000000
      0000010007005B50414745235D00000000FFFF00000000000200000001000000
      00090068656C7665746963610006000000000000000000010000000100020000
      000000FFFFFF00000000020000000000000000009051000013006D6D6F464F4E
      4546494C49414C424153455F50000200980000004F000000CE0000000A000000
      47000000F4010000000000000000FFFFFF1F2C02000000000001001600464F4E
      453A205B464F4E4546494C49414C424153455D00000000FFFF00000000000200
      00000100000000090068656C7665746963610006000000000000000000000000
      000100020000000000FFFFFF0000000002000000000000000000455200001400
      6D6D6F454E44455245434F5F42414952524F5F500002009800000039000000CF
      0000000A00000043000000F4010000000000000000FFFFFF1F2C020000000000
      010024005B52554146494C49414C424153455D202D205B42414952524F46494C
      49414C424153455D00000000FFFF000000000002000000010000000009006865
      6C7665746963610006000000000000000000000000000100020000000000FFFF
      FF00000000020000000000000000001253000012006D6D6F4345505F43494441
      44455F55465F500002009800000044000000CF0000000A00000043000000F401
      0000000000000000FFFFFF1F2C02000000000001003E004345503A205B434550
      46494C49414C424153455D202D205B43494441444546494C49414C424153455D
      202D205B45535441444F46494C49414C424153455D00000000FFFF0000000000
      020000000100000000090068656C766574696361000600000000000000000000
      0000000100020000000000FFFFFF0000000002000000000000000000B4530000
      14006D6D6F52415A414F46494C49414C424153455F50000200980000002E0000
      00CF0000000A00000043000000F4010000000000000000FFFFFF1F2C02000000
      0000010011005B52415A414F46494C49414C424153455D00000000FFFF000000
      0000020000000100000000090068656C76657469636100060000000000000000
      00000000000100020000000000FFFFFF00000000020000000000000000004254
      00000900666D764F757472617300020079010000460000002F02000024000000
      43000000F4010000000000000000FFFFFF1F2C020000000000010008005B4F75
      747261735D00000000FFFF0000000000020000000100000000090068656C7665
      746963610007000000000000000000020000000100020000000000FFFFFF0000
      000002000000000000000000C854000006004D656D6F31320002005D0200006D
      000000180000001700000043000F00F4010000000000000000FFFFFF1F2C0200
      000000000100030044444100000000FFFF000000000002000000010000000009
      0068656C76657469636100070000000000000000000A00000001000200000000
      00FFFFFF00000000020000000000000000007455000006004D656D6F31360002
      005F02000039010000160000000B00000040000000F4010000000000000000FF
      FFFF1F2C000000000000010029005B4946285B7172794475706C696361746173
      2E22646461225D3D547275652C202758272C202727295D00000000FFFF000000
      0000020000000100000006090068656C76657469636100070000000000000000
      00010000000100020000000000FFFFFF00000000020000000000000000000556
      000005004D656D6F34000200D70200006D0000007C0000001700000043000F00
      F4010000000000000000FFFFFF1F2C02000000000001000F004556454E544F20
      2F204C414E43544F00000000FFFF000000000002000000010000000009006865
      6C76657469636100070000000000000000000A0000000100020000000000FFFF
      FF0000000002000000000000000000F856000006004D656D6F3234000200D702
      0000390100007C0000000B00000043000000F4010000000000000000FFFFFF1F
      2C02000000000003002E005B636F7079285B7172794475706C6963617461732E
      226576656E746F64657363726963616F225D2C312C3235295D0D3C005B274C41
      4E43544F3A20275D5B434F5059285B7172794475706C6963617461732E225573
      756172696F4C616E63616D656E746F225D2C312C3137295D0D000000000000FF
      FF0000000000020000000100000006090068656C766574696361000600000000
      0000000000000000000100020000000000FFFFFF000000000200000000000000
      00008A57000006004D656D6F35350002001E0200006D0000003F000000170000
      0043000F00F4010000000000000000FFFFFF1F2C020000000000020005005641
      4C4F520D07004CCD515549444F00000000FFFF00000000000200000001000000
      00090068656C76657469636100070000000000000000000A0000000100020000
      000000FFFFFF00000000020000000000000000006658000006004D656D6F3536
      00020012020000390100004B0000000B00000040000000F40100000000000000
      00FFFFFF1F2C02000000000001003C005B466F726D6174466C6F617428272323
      232C2323232C2323302E3030272C7172794475706C6963617461732E2276616C
      6F726C69717569646F22295D00000000FFFF0000000000020000000100000006
      090068656C766574696361000700000002000000000001000000010002000000
      0000FFFFFF1F1D005B7172794475706C6963617461732E226469666572656E63
      696172225D00020000000000000000003B59000006004D656D6F35370002000D
      02000088010000500000000E00000043000000F4010000000000000000FFFFFF
      1F2C020000000000010052005B466F726D6174466C6F617428272323232C2323
      232C2323302E3030272C53554D285B7172794475706C6963617461732E227661
      6C6F726C69717569646F225D2C204461646F734D65737472652C3129295D0000
      0000FFFF0000000000020000000100000000090068656C766574696361000700
      0000020000000000010000000100020000000000FFFFFF000000000200000000
      0000000000105A000006004D656D6F35380002000D020000A801000050000000
      0E00000043000000F4010000000000000000FFFFFF1F2C020000000000010052
      005B466F726D6174466C6F617428272323232C2323232C2323302E3030272C53
      554D285B7172794475706C6963617461732E2276616C6F726C69717569646F22
      5D2C204461646F734D65737472652C3129295D00000000FFFF00000000000200
      00000100000000090068656C7665746963610007000000020000000000010000
      000100020000000000FFFFFF0000000002000000000000000000E55A00000600
      4D656D6F35390002000D020000DC010000500000000E00000043000000F40100
      00000000000000FFFFFF1F2C020000000000010052005B466F726D6174466C6F
      617428272323232C2323232C2323302E3030272C53554D285B7172794475706C
      6963617461732E2276616C6F726C69717569646F225D2C204461646F734D6573
      7472652C3129295D00000000FFFF000000000002000000010000000009006865
      6C7665746963610007000000020000000000010000000100020000000000FFFF
      FF0000000002000000000000000000BA5B000006004D656D6F36300002000D02
      000008020000500000000E00000043000000F4010000000000000000FFFFFF1F
      2C020000000000010052005B466F726D6174466C6F617428272323232C232323
      2C2323302E3030272C53554D285B7172794475706C6963617461732E2276616C
      6F726C69717569646F225D2C204461646F734D65737472652C3129295D000000
      00FFFF0000000000020000000100000000090068656C76657469636100070000
      00020000000000010000000100020000000000FFFFFF00000000020000000000
      000000008F5C000006004D656D6F36310002000D02000033020000500000000E
      00000043000000F4010000000000000000FFFFFF1F2C02000000000001005200
      5B466F726D6174466C6F617428272323232C2323232C2323302E3030272C5355
      4D285B7172794475706C6963617461732E2276616C6F726C69717569646F225D
      2C204461646F734D65737472652C3129295D00000000FFFF0000000000020000
      000100000000090068656C766574696361000700000002000000000001000000
      0100020000000000FFFFFF0000000002000000000000000000415D000006004D
      656D6F3632000200150000005C010000590100000E00000043000000F4010000
      000000000000FFFFFF1F2C02000000000001002F00544F54414C20444F43554D
      454E544F3A205B7172794475706C6963617461732E22646F63756D656E746F70
      6167225D00000000FFFF0000000000020000000100000000090068656C766574
      6963610007000000000000000000010000000100020000000000FFFFFF000000
      0002000000000000000000155E000006004D656D6F3633000200A10100005C01
      0000500000000E00000043000000F4010000000000000000FFFFFF1F2C020000
      000000010051005B466F726D6174466C6F617428272323232C2323232C232330
      2E3030272C53554D285B7172794475706C6963617461732E2276616C6F727665
      6E63746F225D2C204461646F734D65737472652C3129295D00000000FFFF0000
      000000020000000100000000090068656C766574696361000700000002000000
      0000010000000100020000000000FFFFFF000000000200000000000000000001
      5F000006004D656D6F3634000200730100005C0100002B0000000E0000004300
      0000F4010000000000000000FFFFFF1F2C020000000000010000000005000500
      626567696E0D250020206966205B53554D28312C4461646F734D65737472652C
      31295D203C3E2030207468656E0D2400202020202020204D656D6F3A3D205B53
      554D28312C4461646F734D65737472652C31295D0D0A002020656C7365202727
      3B0D0300656E6400FFFF0000000000020000000100000000090068656C766574
      6963610007000000020000000000010000000100020000000000FFFFFF000000
      0002000000000000000000D75F000006004D656D6F3635000200DA0100005C01
      0000480000000E00000043000000F4010000000000000000FFFFFF1F2C020000
      000000010053005B466F726D6174466C6F617428272323232C2323232C232330
      2E3030272C53554D285B7172794475706C6963617461732E2276616C6F726465
      73636F6E746F225D2C204461646F734D65737472652C3129295D00000000FFFF
      0000000000020000000100000000090068656C76657469636100070000000200
      00000000010000000100020000000000FFFFFF00000000020000000000000000
      00AC60000006004D656D6F3636000200110200005C010000500000000E000000
      43000000F4010000000000000000FFFFFF1F2C020000000000010052005B466F
      726D6174466C6F617428272323232C2323232C2323302E3030272C53554D285B
      7172794475706C6963617461732E2276616C6F726C69717569646F225D2C2044
      61646F734D65737472652C3129295D00000000FFFF0000000000020000000100
      000000090068656C766574696361000700000002000000000001000000010002
      0000000000FFFFFF000000000200000000000000FEFEFF0A0000000400205661
      72000000000600546974756C6F00100027434F4E544153204120504147415227
      0006004F7574726173000000000C00204167727570616D656E746F0000000012
      0041677275706172477275706F46696C69616C00050046616C7365000D004167
      727570617246696C69616C00050046616C736500110041677275706172466F72
      6E656365646F7200050046616C7365000B004167727570617244617461000500
      46616C736500140041677275706172446F63756D656E746F7350616700050046
      616C7365000700204F7574726F73000000000000000000000000FC0000000000
      00000000000000000000005800E00C74D16F88E340B61EFA1D0D39E640}
  end
  object frpResumoDuplicatasPagar: TfrReport
    Dataset = fdsDuplicatasPagar
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnBeforePrint = frpResumoDuplicatasPagarBeforePrint
    Left = 576
    Top = 147
    ReportForm = {
      19000000F15F000019FFFF00000A0050444643726561746F7200FFFFFFFFFF00
      000000340800009A0B0000000000000B0000002F000000070000000100040000
      0000FFFF000000000000000000000000030400466F726D00FEFFFFFFDC000000
      780000007C0100002C010000043B000500626567696E0D1D004461646F734D65
      737472652E76697369626C65203A3D2066616C73653B0D1C006966205B416772
      75706172477275706F46696C69616C5D207468656E0D0500626567696E0D2400
      204361626563616C686F477275706F46696C69616C2E76697369626C653A3D74
      7275653B0D210020526F64617065477275706F46696C69616C2E76697369626C
      653A3D747275653B0D0300656E640D0400656C73650D0500626567696E0D2500
      204361626563616C686F477275706F46696C69616C2E76697369626C653A3D66
      616C73653B0D220020526F64617065477275706F46696C69616C2E7669736962
      6C653A3D66616C73653B0D0400656E643B0D00000D17006966205B4167727570
      617246696C69616C5D207468656E0D0500626567696E0D1F0020436162656361
      6C686F46696C69616C2E76697369626C653A3D747275653B0D1C0020526F6461
      706546696C69616C2E76697369626C653A3D747275653B0D0300656E640D0400
      656C73650D0500626567696E0D2000204361626563616C686F46696C69616C2E
      76697369626C653A3D66616C73653B0D1D0020526F6461706546696C69616C2E
      76697369626C653A3D66616C73653B0D0400656E643B0D00000D1B006966205B
      41677275706172466F726E656365646F725D207468656E0D0500626567696E0D
      2300204361626563616C686F466F726E656365646F722E76697369626C653A3D
      747275653B0D200020526F64617065466F726E656365646F722E76697369626C
      653A3D747275653B0D0300656E640D0400656C73650D0500626567696E0D2400
      204361626563616C686F466F726E656365646F722E76697369626C653A3D6661
      6C73653B0D210020526F64617065466F726E656365646F722E76697369626C65
      3A3D66616C73653B0D0400656E643B0D00000D15006966205B41677275706172
      446174615D207468656E0D0500626567696E0D240020204361626563616C686F
      4461746156656E63746F2E76697369626C653A3D747275653B0D21002020526F
      646170654461746156656E63746F2E76697369626C653A3D747275653B0D0300
      656E640D0400656C73650D0500626567696E0D250020204361626563616C686F
      4461746156656E63746F2E76697369626C653A3D66616C73653B0D2200202052
      6F646170654461746156656E63746F2E76697369626C653A3D66616C73653B0D
      0400656E643B0D00000D20006966205B41677275706172446F63756D656E746F
      735061675D207468656E20200D0700626567696E20200D290020204361626563
      616C686F446F63756D656E746F735061672E76697369626C653A3D747275653B
      20200D26002020526F64617065446F63756D656E746F735061672E7669736962
      6C653A3D747275653B20200D0500656E6420200D0600656C736520200D070062
      6567696E20200D2A0020204361626563616C686F446F63756D656E746F735061
      672E76697369626C653A3D66616C73653B20200D27002020526F64617065446F
      63756D656E746F735061672E76697369626C653A3D66616C73653B20200D0600
      656E643B20200D00000D00000D0300656E64000200680500000B004461646F73
      4D657374726500020100000000450100002F0400000B00000031000500010000
      00000000000000FFFFFF1F0000000012006664734475706C6963617461735061
      67617200000000000000FFFF0000000000020000000100000000000000010000
      00C800000014000000010000000000000200D50500000D00526F646170E94D65
      7374726531000201000000004B0200002F040000160000003000060001000000
      000000000000FFFFFF1F00000000000000000000000000FFFF00000000000200
      0000010000000000000001000000C80000001400000001000000000000020041
      0600000C00526F6461706546696C69616C00020100000000F40100002F040000
      160000003000110001000000000000000000FFFFFF1F00000000000000000000
      000000FFFF000000000002000000010000000000000001000000C80000001400
      00000100000000000002007107000014004361626563616C686F477275706F46
      696C69616C00020100000000900000002F0400001D0000003000100001000000
      000000000000FFFFFF1F0000000048005B6966285B4167727570617247727570
      6F66696C69616C5D3D547275652C205B7172794475706C6963617461732E2247
      7275706F46696C69616C456D697373616F225D2C2727295D0000000006000500
      626567696E0D180020204746546F74616C56616C6F7256656E63746F3A3D303B
      0D120020204746546F74616C4A75726F733A3D303B0D190020204746546F7461
      6C56616C6F72506167746F3A3D303B20200D180020204746546F74616C526567
      697374726F733A3D303B20200D0300656E6400FFFF0000000000020000000100
      00000000000001000000C8000000140000000100000000000002002708000013
      004361626563616C686F466F726E656365646F7200020100000000EC0000002F
      040000000000003000100001000000000000000000FFFFFF1F0000000043005B
      6966285B41677275706172466F726E656365646F725D3D547275652C205B7172
      794475706C6963617461732E224E6F6D65466F726E656365646F72225D2C2727
      295D00000000000000FFFF000000000002000000010000000000000001000000
      C800000014000000010000000000000200980800001100526F64617065477275
      706F46696C69616C00020100000000200200002F040000160000003000110001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200080900001000526F64617065466F726E656365646F7200020100000000C0
      0100002F0400001D0000003000110001000000000000000000FFFFFF1F000000
      00000000000000000000FFFF0000000000020000000100000000000000010000
      00C800000014000000010000000000000200290A00000F004361626563616C68
      6F46696C69616C00020100000000C00000002F0400001D000000300010000100
      0000000000000000FFFFFF1F000000003E005B6966285B416772757061724669
      6C69616C5D3D547275652C205B7172794475706C6963617461732E2246696C69
      616C456D697373616F225D2C2727295D0000000006000500626567696E0D1800
      20204746546F74616C56616C6F7256656E63746F3A3D303B0D12002020474654
      6F74616C4A75726F733A3D303B0D190020204746546F74616C56616C6F725061
      67746F3A3D303B20200D180020204746546F74616C526567697374726F733A3D
      303B20200D0300656E6400FFFF00000000000200000001000000000000000100
      0000C800000014000000010000000000000200D50A000013004361626563616C
      686F4461746156656E63746F00020100000000020100002F0400000000000030
      00100001000000000000000000FFFFFF1F0000000039005B6966285B41677275
      706172446174615D3D547275652C205B7172794475706C6963617461732E2264
      61746176656E63746F225D2C2727295D00000000000000FFFF00000000000200
      0000010000000000000001000000C80000001400000001000000000000020045
      0B00001000526F646170654461746156656E63746F0002010000000094010000
      2F040000190000003000110001000000000000000000FFFFFF1F000000000000
      00000000000000FFFF000000000002000000010000000000000001000000C800
      000014000000010000000000000200AE0B00000900666276526F646170650002
      0100000000B80200002F0400000D0000003000030001000000000000000000FF
      FFFF1F00000000000000000000000000FFFF0000000000020000000100000000
      00000001000000C800000014000000010000000000000200170C000009004361
      626563616C686F000201000000002A0000002F04000053000000300002000100
      0000000000000000FFFFFF1F00000000000000000000000000FFFF0000000000
      02000000010000000000000001000000C8000000140000000100000000000002
      00D10C000016004361626563616C686F446F63756D656E746F73506167000201
      000000001C0100002F040000000000003000100001000000000000000000FFFF
      FF1F0000000044005B6966285B41677275706172446F63756D656E746F735061
      675D3D547275652C205B7172794475706C6963617461732E22646F63756D656E
      746F706167225D2C2727295D00000000000000FFFF0000000000020000000100
      00000000000001000000C800000014000000010000000000000200B50D000013
      00526F64617065446F63756D656E746F7350616700020100000000680100002F
      040000160000003000110001000000000000000000FFFFFF1F00000000000000
      00000005000500626567696E0D2D0020206966205B7172794475706C69636174
      61732E224469666572656E63696172225D3D46616C7365207468656E0D130020
      20202076697369626C65203A3D20547275650D1B002020656C73652076697369
      626C65203A3D2046616C73653B2020200D0300656E6400FFFF00000000000200
      0000010000000000000001000000C800000014000000010000000000000000A1
      0E000006004D656D6F3335000200D3010000F80100002B0000000E0000004300
      0000F4010000000000000000FFFFFF1F2C020000000000010000000005000500
      626567696E0D250020206966205B53554D28312C4461646F734D65737472652C
      31295D203C3E2030207468656E0D2400202020202020204D656D6F3A3D205B53
      554D28312C4461646F734D65737472652C31295D0D0A002020656C7365202727
      3B0D0300656E6400FFFF0000000000020000000100000000090068656C766574
      6963610007000000020000000000010000000100020000000000FFFFFF000000
      00020000000000000000008D0F000006004D656D6F3135000200D30100004F02
      00002B0000000E00000043000000F4010000000000000000FFFFFF1F2C020000
      000000010000000005000500626567696E0D250020206966205B53554D28312C
      4461646F734D65737472652C31295D203C3E2030207468656E0D240020202020
      2020204D656D6F3A3D205B53554D28312C4461646F734D65737472652C31295D
      0D0A002020656C73652027273B0D0300656E6400FFFF00000000000200000001
      00000000090068656C7665746963610007000000020000000000010000000100
      020000000000FFFFFF00000000020000000000000000007910000006004D656D
      6F3433000200D3010000240200002B0000000E00000043000000F40100000000
      00000000FFFFFF1F2C020000000000010000000005000500626567696E0D2500
      20206966205B53554D28312C4461646F734D65737472652C31295D203C3E2030
      207468656E0D2400202020202020204D656D6F3A3D205B53554D28312C446164
      6F734D65737472652C31295D0D0A002020656C73652027273B0D0300656E6400
      FFFF0000000000020000000100000000090068656C7665746963610007000000
      020000000000010000000100020000000000FFFFFF0000000002000000000000
      0000006511000006004D656D6F3437000200D3010000C40100002B0000000E00
      000043000000F4010000000000000000FFFFFF1F2C0200000000000100000000
      05000500626567696E0D250020206966205B53554D28312C4461646F734D6573
      7472652C31295D203C3E2030207468656E0D2400202020202020204D656D6F3A
      3D205B53554D28312C4461646F734D65737472652C31295D0D0A002020656C73
      652027273B0D0300656E6400FFFF000000000002000000010000000009006865
      6C7665746963610007000000020000000000010000000100020000000000FFFF
      FF00000000020000000000000000005112000006004D656D6F3531000200D301
      0000980100002B0000000E00000043000000F4010000000000000000FFFFFF1F
      2C020000000000010000000005000500626567696E0D250020206966205B5355
      4D28312C4461646F734D65737472652C31295D203C3E2030207468656E0D2400
      202020202020204D656D6F3A3D205B53554D28312C4461646F734D6573747265
      2C31295D0D0A002020656C73652027273B0D0300656E6400FFFF000000000002
      0000000100000000090068656C76657469636100070000000200000000000100
      00000100020000000000FFFFFF0000000002000000000000000000E31200000A
      006D6D6F5A65627261646F0002001000000045010000E20300000B0000004300
      000001000000FFFFFF1F0000FFFFFF1F2C020000000000000000020005006265
      67696E0D0300656E6400FFFF0000000000020000000100000000090068656C76
      65746963610007000000000000000000000000000100020000000000FFFFFF1F
      000000020000000000000000008313000005004D656D6F390002000E00000045
      0100002C0000000B00000040000000F4010000000000000000FFFFFF1F2C0200
      0000000001001E005B7172794475706C6963617461732E22646F63756D656E74
      6F706167225D00000000FFFF0000000000020000000100000006090068656C76
      65746963610007000000000000000000110000000100020000000000FFFFFF00
      000000020000000000000000001F14000006004D656D6F31300002003A000000
      45010000180000000B00000040000000F4010000000000000000FFFFFF1F2C02
      0000000000010019005B7172794475706C6963617461732E226E756D65726F22
      5D2000000000FFFF0000000000020000000100000006090068656C7665746963
      610007000000000000000000110000000100020000000000FFFFFF0000000002
      000000000000000000C614000006004D656D6F3131000200F802000045010000
      630000000B00000040000000F4010000000000000000FFFFFF1F2C0200000000
      00010024005B7172794475706C6963617461732E227369676C6162616E636F63
      6F6272616E6361225D00000000FFFF0000000000020000000100000006090068
      656C7665746963610007000000000000000000100000000100020000000000FF
      FFFF00000000020000000000000000006815000006004D656D6F313300020099
      00000045010000220000000B00000040000000F4010000000000000000FFFFFF
      1F2C02000000000001001F005B7172794475706C6963617461732E2266696C69
      616C656D697373616F225D00000000FFFF000000000002000000010000000609
      0068656C76657469636100070000000000000000001100000001000200000000
      00FFFFFF00000000020000000000000000005B16000006004D656D6F31340002
      005B03000045010000230000000B00000000000000F4010000000000000000FF
      FFFF1F2C020000000000010000000005000500626567696E0D25002020696620
      5B7172794475706C6963617461732E226F6273225D203C3E202727207468656E
      0D2300202020202020204D656D6F3A3D205B7172794475706C6963617461732E
      226F6273225D0D12002020656C7365204D656D6F3A3D2027273B200D0300656E
      6400FFFF0000000000020000000100000006090068656C766574696361000700
      0000000000000000110000000100020000000000FFFFFF000000000200000000
      00000000001917000006004D656D6F313900020001020000450100004B000000
      0B00000040000000F4010000000000000000FFFFFF1F2C02000000000001003B
      005B466F726D6174466C6F617428272323232C2323232C2323302E3030272C71
      72794475706C6963617461732E2276616C6F7276656E63746F22295D00000000
      FFFF0000000000020000000100000006090068656C7665746963610007000000
      000000000000110000000100020000000000FFFFFF0000000002000000000000
      0000000F18000006004D656D6F32330002005200000045010000270000000B00
      000040000000F4010000000000000000FFFFFF1F2C0200000000000100000000
      05000500626567696E0D260020206966205B7172794475706C6963617461732E
      226E6F7461225D203C3E2030207468656E200D2500202020202020204D656D6F
      3A3D205B7172794475706C6963617461732E226E6F7461225D200D1200202065
      6C7365204D656D6F3A3D2027273B200D0300656E6400FFFF0000000000020000
      000100000006090068656C766574696361000700000000000000000011000000
      0100020000000000FFFFFF00000000020000000000000000000819000006004D
      656D6F32340002007900000045010000200000000B00000040000000F4010000
      000000000000FFFFFF1F2C020000000000010000000005000500626567696E0D
      280020206966205B7172794475706C6963617461732E227365726965225D203C
      3E202727207468656E200D2600202020202020204D656D6F3A3D205B71727944
      75706C6963617461732E227365726965225D200D12002020656C7365204D656D
      6F3A3D2027273B200D0300656E6400FFFF000000000002000000010000000609
      0068656C76657469636100070000000000000000001200000001000200000000
      00FFFFFF00000000020000000000000000009719000006004D656D6F31370002
      000500000050020000C90100000E00000043000000F4010000000000000000FF
      FFFF1F2C02000000000001000C00544F54414C20474552414C3A00000000FFFF
      0000000000020000000100000000090068656C76657469636100070000000000
      00000000010000000100020000000000FFFFFF00000000020000000000000000
      00361A000006004D656D6F32390002001501000045010000260000000B000000
      40000000F4010000000000000000FFFFFF1F2C02000000000001001C005B7172
      794475706C6963617461732E22666F726E656365646F72225D00000000FFFF00
      00000000020000000100000006090068656C7665746963610007000000000000
      000000110000000100020000000000FFFFFF0000000002000000000000000000
      591B000006004D656D6F33310002005102000045010000400000000B00000040
      000000F4010000000000000000FFFFFF1F2C0200000000000100000000050005
      00626567696E0D2E0020206966205B7172794475706C6963617461732E227661
      6C6F72646573636F6E746F225D203C3E2030207468656E0D4B00202020202020
      204D656D6F3A3D205B466F726D6174466C6F617428272323232C2323232C2323
      302E3030272C7172794475706C6963617461732E2276616C6F72646573636F6E
      746F22295D0D11002020656C7365204D656D6F3A3D2027273B0D0300656E6400
      FFFF0000000000020000000100000006090068656C7665746963610007000000
      000000000000110000000100020000000000FFFFFF0000000002000000000000
      000000031C000006004D656D6F3235000200E8000000450100002D0000000B00
      000040000000F4010000000000000000FFFFFF1F2C020000000000010027005B
      7172794475706C6963617461732E226461746176656E63746F2220234464642F
      6D6D2F79795D00000000FFFF0000000000020000000100000006090068656C76
      65746963610007000000000000000000120000000100020000000000FFFFFF00
      00000002000000000000000000AA1C000006004D656D6F3237000200BB000000
      450100002D0000000B00000040000000F4010000000000000000FFFFFF1F2C02
      0000000000010024005B7172794475706C6963617461732E22656D697373616F
      2220234464642F6D6D2F79795D00000000FFFF00000000000200000001000000
      06090068656C7665746963610007000000000000000000120000000100020000
      000000FFFFFF0000000002000000000000000000A61D000006004D656D6F3332
      000200470200004F0200004A0000000E00000043000000F40100000000000000
      00FFFFFF1F2C020000000000010079005B49462853554D285B7172794475706C
      6963617461732E2276616C6F72646573636F6E746F225D2C204461646F734D65
      737472652C203129203E20302C2053554D285B7172794475706C696361746173
      2E2276616C6F72646573636F6E746F225D2C204461646F734D65737472652C20
      3129202C202727295D00000000FFFF0000000000020000000100000000090068
      656C7665746963610007000000020000000000010000000100020000000000FF
      FFFF00000000020000000000000000005A1E000006004D656D6F333300020005
      000000F8010000C90100000E00000043000000F4010000000000000000FFFFFF
      1F2C02000000000001003100544F54414C2046494C49414C3A205B7172794475
      706C6963617461732E224E6F6D6546696C69616C456D697373616F225D000000
      00FFFF0000000000020000000100000000090068656C76657469636100070000
      00000000000000010000000100020000000000FFFFFF00000000020000000000
      00000000561F000006004D656D6F333600020047020000F80100004A0000000E
      00000043000000F4010000000000000000FFFFFF1F2C02000000000001007900
      5B49462853554D285B7172794475706C6963617461732E2276616C6F72646573
      636F6E746F225D2C204461646F734D65737472652C203129203E20302C205355
      4D285B7172794475706C6963617461732E2276616C6F72646573636F6E746F22
      5D2C204461646F734D65737472652C203129202C202727295D00000000FFFF00
      00000000020000000100000000090068656C7665746963610007000000020000
      000000010000000100020000000000FFFFFF0000000002000000000000000000
      0120000006004D656D6F3337000200E000000094000000DE0000001400000043
      000F00F4010000000000000000FFFFFF1F2C020000000000010028005B717279
      4475706C6963617461732E224E6F6D65477275706F46696C69616C456D697373
      616F225D00000000FFFF0000000000020000000100000000090068656C766574
      6963610007000000020000000000080000000100020000000000FFFFFF000000
      00020000000000000000009B20000006004D656D6F37310002001C0000009400
      0000980000001400000043000F00F4010000000000000000FFFFFF1F2C020000
      00000001001700475255504F2046494C49414C20444520454D495353C34F0000
      0000FFFF0000000000020000000100000000090068656C766574696361000700
      0000000000000000090000000100020000000000FFFFFF000000000200000000
      00000000004221000006004D656D6F3732000200B90000009400000022000000
      1400000043000F00F4010000000000000000FFFFFF1F2C020000000000010024
      005B7172794475706C6963617461732E22477275706F46696C69616C456D6973
      73616F225D00000000FFFF0000000000020000000100000000090068656C7665
      746963610007000000000000000000090000000100020000000000FFFFFF0000
      000002000000000000000000E821000006004D656D6F3338000200E0000000C4
      000000DE0000001400000043000F00F4010000000000000000FFFFFF1F2C0200
      00000000010023005B7172794475706C6963617461732E224E6F6D6546696C69
      616C456D697373616F225D00000000FFFF000000000002000000010000000009
      0068656C76657469636100070000000200000000000800000001000200000000
      00FFFFFF00000000020000000000000000007C22000006004D656D6F33390002
      0044000000C4000000700000001400000043000F00F4010000000000000000FF
      FFFF1F2C0200000000000100110046494C49414C20444520454D495353C34F00
      000000FFFF0000000000020000000100000000090068656C7665746963610007
      000000000000000000090000000100020000000000FFFFFF0000000002000000
      0000000000001E23000006004D656D6F3430000200B9000000C4000000220000
      001400000043000F00F4010000000000000000FFFFFF1F2C0200000000000100
      1F005B7172794475706C6963617461732E2246696C69616C456D697373616F22
      5D00000000FFFF0000000000020000000100000000090068656C766574696361
      0007000000000000000000090000000100020000000000FFFFFF000000000200
      0000000000000000E023000006004D656D6F34310002000500000024020000C9
      0100000E00000043000000F4010000000000000000FFFFFF1F2C020000000000
      01003F00544F54414C20475255504F2044452046494C49414C3A205B71727944
      75706C6963617461732E224E6F6D65477275706F46696C69616C456D69737361
      6F225D00000000FFFF0000000000020000000100000000090068656C76657469
      63610007000000000000000000010000000100020000000000FFFFFF00000000
      02000000000000000000DC24000006004D656D6F343400020047020000240200
      004A0000000E00000043000000F4010000000000000000FFFFFF1F2C02000000
      0000010079005B49462853554D285B7172794475706C6963617461732E227661
      6C6F72646573636F6E746F225D2C204461646F734D65737472652C203129203E
      20302C2053554D285B7172794475706C6963617461732E2276616C6F72646573
      636F6E746F225D2C204461646F734D65737472652C203129202C202727295D00
      000000FFFF0000000000020000000100000000090068656C7665746963610007
      000000020000000000010000000100020000000000FFFFFF0000000002000000
      0000000000009125000006004D656D6F343500020005000000C4010000C90100
      000E00000043000000F4010000000000000000FFFFFF1F2C0200000000000100
      3200544F54414C20464F524E454345444F523A205B7172794475706C69636174
      61732E224E6F6D65466F726E656365646F72225D00000000FFFF000000000002
      0000000100000000090068656C76657469636100070000000000000000000100
      00000100020000000000FFFFFF00000000020000000000000000008D26000006
      004D656D6F343800020047020000C40100004A0000000E00000043000000F401
      0000000000000000FFFFFF1F2C020000000000010079005B49462853554D285B
      7172794475706C6963617461732E2276616C6F72646573636F6E746F225D2C20
      4461646F734D65737472652C203129203E20302C2053554D285B717279447570
      6C6963617461732E2276616C6F72646573636F6E746F225D2C204461646F734D
      65737472652C203129202C202727295D00000000FFFF00000000000200000001
      00000000090068656C7665746963610007000000020000000000010000000100
      020000000000FFFFFF00000000020000000000000000003027000006004D656D
      6F32300002003B01000045010000C30000000B00000040000000010000000000
      00000000FFFFFF1F2C020000000000010020005B7172794475706C6963617461
      732E226E6F6D65666F726E656365646F72225D00000000FFFF00000000000200
      00000100000006090068656C7665746963610007000000000000000000100000
      000100020000000000FFFFFF0000000002000000000000000000FA2700000600
      4D656D6F34390002000500000098010000C90100000E00000043000000F40100
      00000000000000FFFFFF1F2C02000000000001004700544F54414C204449413A
      205B464F524D41544441544554494D45282764642F6D6D2F79797979272C205B
      7172794475706C6963617461732E226461746176656E63746F225D295D000000
      00FFFF0000000000020000000100000000090068656C76657469636100070000
      00000000000000010000000100020000000000FFFFFF00000000020000000000
      00000000F628000006004D656D6F353200020043020000980100004E0000000E
      00000043000000F4010000000000000000FFFFFF1F2C02000000000001007900
      5B49462853554D285B7172794475706C6963617461732E2276616C6F72646573
      636F6E746F225D2C204461646F734D65737472652C203129203E20302C205355
      4D285B7172794475706C6963617461732E2276616C6F72646573636F6E746F22
      5D2C204461646F734D65737472652C203129202C202727295D00000000FFFF00
      00000000020000000100000000090068656C7665746963610007000000020000
      000000010000000100020000000000FFFFFF0000000002000000000000000000
      9529000006004D656D6F35340002007E03000045010000800000000B00000001
      000000F4010000000000000000FFFFFF1F2C02000000000001001C005B717279
      4475706C6963617461732E224F62736572766163616F225D00000000FFFF0000
      000000020000000100000006090068656C766574696361000700000000000000
      0000100000000100020000000000FFFFFF000000000200000000000000000032
      2A00000F006D6D6F524F44415045484F52415F500002001F000000B802000058
      0000000A00000043000000F4010000000000000000FFFFFF1F2C020000000000
      010011005B54494D4520235468683A6D6D3A73735D00000000FFFF0000000000
      020000000100000006090068656C766574696361000700000000000000000010
      0000000100020000000000FFFFFF0000000002000000000000000000DB2A0000
      0C006D6D6F544543534F46545F500002001F030000B8020000DC0000000A0000
      0043000000F4010000000000000000FFFFFF1F2C020000000000010020007465
      63534F4654202D205465636E6F6C6F67696120656D2053697374656D61730000
      0000FFFF0000000000020000000100000006090068656C766574696361000700
      0000000000000000110000000100020000000000FFFFFF000000000200000000
      00000001000243000009006670764C6F676F5F500002001B0000002A00000078
      0000002A00000007000000F4010000000000000000FFFFFF1F2C020000000000
      000000000000FFFF0000000000020000000100000000010002430000424DCE17
      0000000000003604000028000000830000002600000001000800000000009813
      0000120B0000120B0000000100000001000000000000E8E5A800AA9E00009999
      0000ADADAD003A3C4100A3970000BFB73700D8D48600FBFAF000A5A5A5001E1D
      1C00D8D9DA0054575A00D6D6D500E7E8F20012161B00B6AD1900CBC55B008C8D
      9200BEC0C500E1E2E40085878A005E606300494C4F00090D12002C2E3300DEDB
      98007D7F8100EFEDCB00B9BABB00AEA400007C7B7B00C5BE440066666600D1CC
      6F00CDC9810048484600F7F6E600AFA5080004080D00F9F8ED00B8AF2700DBD6
      8C00999999001B1A1900C6BF5100131312003B3A3A00FFFFFF00EAE8BE00CCCC
      CC0023262A00E2DEA400F1EFD600B0B1B300D3CD7500B1A81000CCCC66007272
      7200535252004342420001060A00ECE9C3008C8C8B00F5F4DF004A4A4A005757
      5600B6AC1F00282B3000C7C05C0061615F00F7F7F70088888700DDD89300E3E0
      A600FDFCF70021242900070A1000BDB53100C5BE4A00E3E3E200A69C00009999
      9900BABAB900DEDEDE00525458002A292800D9D58A005F5E5D00C7C595001B1E
      2300E8E5B60000000700B5AB1300D5D07B00C6C6C500B2A80B0021202000B9B1
      2400504F4E00666666006B6D7000B5B5BD0084848400E0DC9E00BCB42C00F7EF
      D6005B5B5A00EFEFEF0087898B00DEDEE6003E3D3C0014181E00C8C25300CCC5
      5F00A8A9AC00BDBDBC00E5E1AC0075767900181B2000E6E6E6000E1117000810
      190033333300929191002D2C2B00B5B5B4000000000000000000000000000000
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
      0000000000000000000000000000000000003131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131543D42
      470E313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131313131313131523131313131486D313131
      6D6D4C3131316D6D313131313131313131316D4831313131313131316D6D3131
      316D040A6C6C313131313131486D6D4C3131313131316D6D4C31313131313131
      3131313131486D6D6D313131313131486D6D48313131316D483131316D6D3131
      313131313131313131316D6D6D3131486D6D6D31313131313152313131317F7E
      6631554225256031603D42647931420C313B7D316D6C3D70403131662C316D59
      3D7068313133646C702531484255312C70643059313131310C2525420E314774
      31420E4825793131315442433D474C4C640E3120423C300A3131207E2C317F70
      254748484251512531603C316D59253C620A312C254330683131313131523131
      31316C2031315959313131317C7D4C4C31487C0E3159683177424C5134753143
      4031203D487957543130494C7F3D31487C0C310B37317F70313131313C663131
      3131642C317C33487E51313131313179602F55317C3331316D793B7031487E14
      314857043131316D7C55557E311E3031542D4C314340313148790A0B4C313131
      315231313131477D313125306C64334C5779313131487C0E31224931422C3131
      4340316C7D313C7D3131594931570C31543D31487C0C31687059302531313131
      70706C3C0E313C0A313033317C513131310C702570474C4C3033312C7C64300A
      3148300E31796243432248483051517C31603D316D6464590B2C31547C42301C
      313131313152313131314749313166420C5548313D2C484831487C0E48302C31
      1C4248516275316C7D31493D4879627F31256848373031487C0E3131550E2070
      31313131473C0C554831642C4C7E330C62793131316830796D3131487C333157
      7D6D6D313148303331487C49555131487C0C0C7E4C2C703131480C0E7C2C313C
      476D6D31313131313152313131040B7E20316D473C6C33310E3D3C6C79312542
      64646D31486C42706831316C7D31484742702031310E3D433D6C314843553140
      43473D0A31313131796C3C6C0E316670597E3C3D20313131310E256C6C773131
      6C0E312C3D47430431772F3D0A3133424366484825643C7E6C7C74316D225943
      425531543D59437D3131313131523131316D643B6D3131316D51483131317951
      4C316D51793131313131796D3131313C40313131796D31313131317979483131
      7F6D316D15154831313131313131795148314879516D796D3131313131313151
      517931317F6D31316D51516D3151577F6D313131797931316D51516D51483131
      31515151313131314851516D3131313131523131313140043131313131313131
      3131313131313131313131313131313131313168043131313131313131313131
      31313148660F3131313131313131313131313131313131313131313131313131
      3131313131313131220E31313131313131316655313131313131313131313131
      3131313131313131313131313131313131313131315231313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131315C46121212463F3131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313152313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131315F06020202061B31313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131523131
      313131310E40173C18183D6E3131313131310C2C666C3C181818181805683131
      313131316D3768220D0516313131313108021F1F1F5235313131313172070707
      070707070707070707070750732B3631313131313131313131362B7321211208
      1D31313131313131313123505050504B3131313131313131313F08122E505050
      085231313131312C103E191919195D17313131317966713E4E19191919191919
      5D0D31313131312C34282819190017313131313108021F1F1F52353131313131
      1152020202020202020202020202020202022776313131313131313F501F0202
      0202020202075C313131313131316A060202065F313131313131314C12020202
      0202020221523131313175287A78787878784E223131310E1A3E107878717171
      71717171281731313131773E7A717171712822313131313108021F1F1F523531
      3131313144021F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1D31313131310802
      021F1F1F1F1F1F1F1F02022331313131313107021F1F0208313131313131313A
      521F1F1F1F1F1F1F5052313131310D4E7878787A7A71282231316D7C4E787878
      4E4E7A717171717128173131312C3E7171717119195D22313131313108021F1F
      1F5269314C4C4C4C631F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F5250313131
      3138521F1F1F0202020202021F1F1F5212313131313107021F1F020831313131
      3131361F1F1F1F1F0202020221523131316D457A78787A3D370E0E5131313B3E
      7878787A2274140E0E0E0E0E0E15313115787A787871190D0A145A2A6A6A6A2A
      5F36363636365044111111113226262626262626262626262626264A1F1F1F1F
      612631311B521F1F1F02443A08082363021F1F1F525F3131313107021F1F0208
      3131313131311B021F1F1F1F6A2B353532523131310E71717171710C31313131
      3115781078784E683131313131313131313131311C287878787A2C3131310106
      020202025F313131313150520202020236313131313131313131313131313131
      44021F1F1F32312639021F1F1F584C31313131311B27021F1F1F363131310702
      1F1F020831313131313123021F1F1F11093131313152313131337A7171714548
      31313131312C28787810344C313131313131313131313131057A78784E663131
      313135021F1F1F025F313131313150021F1F1F1F363131313131313131313131
      3131314C5E021F1F0276315F521F1F1F4B313131313131313132271F1F527331
      313107021F1F020831313131313112021F1F0272313131313152313131601978
      787A7C4C3131313131662878781045166E6E6E6E6E6E6E6E1C0431555B107871
      7A603131313135021F1F1F025F313131313150021F1F1F1F3631313131313131
      4C0909090909363A021F1F1F1F3F314F021F0272313131313131313131312302
      1F1F1109313107021F1F02083131313131312E021F1F02733131313131523131
      31601978787A054C313131313156197878787128282828282828282800563133
      7A717171346D313131313552020202025F313131313121060202020236313131
      31762E635E61616161611F1F1F1F1F1F114C26611F1F02763131313131313131
      31311D1F1F1F1F1D313107021F1F02083131313131312E021F1F023A31313131
      3152313131601978787A054C3131313131181978787878787878787878787878
      4E1731141978787A454831313131764444444444241551515151464F4F4F4F4F
      413131313A0202021F1F1F1F1F1F1F1F1F1F1F521B311D1F1F1F1F3631313131
      31313131313126391F1F1F5C313107021F1F02083131313131312E021F1F023A
      313131313152313131601978787A054C31313131315619787878787878787878
      787878784E1731337A717171346D313131313109090909097D713434347A3731
      3131313131313158521F1F1F1F1F0202020202020202275831311D1F1F1F1F1D
      3131313131313131313126391F1F1F5C313107021F1F02083131313131312E02
      1F1F023A313131313152313131601978787A054C3131313131224E787878784E
      28282828282828280056310C787171715B0C31313131313131313131133E1010
      105D74313131313131312939021F1F1F1F3911636363636A5008363131312661
      1F1F024B313131313131313131313F021F1F1F36313107021F1F020831313131
      31312E021F1F023A313131313152313131601978787A054C3131313131162878
      78101A2C2C2C2C2C2C2C2C2C7D1E316D1A7A7878197F31313131313131313131
      134E78787828743131313131313176021F1F1F1F232631313131313131313131
      31313107021F02213131313131313131313173021F1F444C313107021F1F0208
      3131313131312E021F1F023A313131313152313131601978787A054C31313131
      317F197171713448313131313131313131313131561978784E66313131313131
      31313131134E7878782874313131313131312B521F1F1F612931313131313131
      3131313131313158521F1F024A31313131313131317602021F52233131310702
      1F1F02083131313131312E021F1F023A313131313152313131331978787A0531
      31313131316D347A78784E133131313131313131313131317D28787871710431
      313131313131313113001919190004313131313131312B521F1F1F2741313131
      31313131313131313131310911021F1F1F232631313131295F1F1F1F1F612931
      313107021F1F022B3131313131312E021F1F52233131313131520E14602C7A78
      787A7C141414140C3131203E78787171660A1E6014141414140E3131155B1078
      78107A567D371E1E1E1E1E1E13566C6C6C182C75757575756D315C021F1F1F1F
      211B1B1B1B1B1B4A4A4A4A4A3631313176021F1F1F0261502323725E021F1F1F
      0258762B2B4A44021F1F1F504A4A4A2B1D312E021F1F1F074A4A4A4A5C520D7A
      7A7A78787878787A7A7A5D1731317945197878784E4E7A7A7A7A7A7A5D6C3131
      31165D7171717119191919191919195D6E313131313166007A7A7A4E1431295E
      021F1F1F0202020202020202020202062B313131315802021F1F1F020202021F
      1F1F1F52384C395252521F1F1F1F1F020202020608312E021F1F1F1F02020202
      21521771717878787878787171714E22313131335B2871787878787171717171
      4E1731313131173E7A717878787878787878784E6E313131313166287171717A
      6031314A521F1F1F1F1F1F1F1F1F1F1F1F1F1F524A31313131316939521F1F1F
      1F1F1F1F1F020258310911021F1F1F1F1F1F1F1F1F1F1F022B312E021F1F1F1F
      1F1F1F1F50520D19191978787878781919190017313131310C0D10284E4E1919
      19191919000D31313131317D1A4E4E4E19191919191919001C31313131316628
      78787810603131315F0202020202020202020202020202062B31313131313136
      733902020202020261721D313129615252521F1F1F1F1F020202020608312E02
      1F1F1F1F0202020221527D17173C107878714D1717170D2C3131313131310E0A
      1C3B2217171717170D7D31313131313148757D77661717171717170D04313131
      31316628787878106031313131364A3A7272727272727272727272505C313131
      3131313131264B5F737338354131313131093A7272725E1F1F1F1F4F1212122E
      5C312E021F1F1F631212121258523131310E1978787A05313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313117003E3E3E5D7531313131313131313131313131313131313131
      313131313131313131313131313131313131313131313131313107021F1F5258
      3131313131312E021F1F0223313131313152313131601978787A054C31313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131317F686E6E6E6E15313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131312102
      1F1F02073131313131312E021F1F023A313131313152313131601978787A054C
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313173021F1F1F1F4F3A233A32312E021F1F023A313131313152313131601978
      787A054C31313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313169521F1F1F1F0202020608312E021F1F023A3131313131523131
      31601978787A054C313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131310963521F1F1F1F1F1F024A312E021F1F023A31313131
      3152313131601971717A054C3131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131314150611F1F1F1F1F024A3150021F1F023A
      3131313131523131310C0D17176C774C31313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131315C3872727272725C31082E
      2E2E2E1B3131313131520000994300000B006D6D6F544954554C4F5F50000200
      790100002A0000003B0200001500000043000000F4010000000000000000FFFF
      FF1F2C02000000000001000F00524553554D4F205B544954554C4F5D00000000
      FFFF0000000000020000000100000000090068656C766574696361000B000000
      020000000000020000000100020000000000FFFFFF0000000002000000000000
      0000002A4400000F006D6D6F524F54554C4F444154415F50000200B60300002A
      0000001C0000000C00000043000000F4010000000000000000FFFFFF1F2C0200
      0000000001000500446174613A00000000FFFF00000000000200000001000000
      00090068656C7665746963610006000000000000000000000000000100020000
      000000FFFFFF0000000002000000000000000000C144000009006D6D6F444154
      415F50000200D30300002A0000002C0000000C00000043000000F40100000000
      00000000FFFFFF1F2C020000000000010011005B4441544520234464642F6D6D
      2F79795D00000000FFFF0000000000020000000100000000090068656C766574
      6963610006000000000000000000010000000100020000000000FFFFFF000000
      00020000000000000000005645000011006D6D6F524F54554C4F504147494E41
      5F50000200B603000037000000280000000C00000043000000F4010000000000
      000000FFFFFF1F2C0200000000000100070050E167696E613A00000000FFFF00
      00000000020000000100000000090068656C7665746963610006000000000000
      000000000000000100020000000000FFFFFF0000000002000000000000000000
      E54500000B006D6D6F504147494E415F50000200DF0300003700000020000000
      0C00000043000000F4010000000000000000FFFFFF1F2C020000000000010007
      005B50414745235D00000000FFFF000000000002000000010000000009006865
      6C7665746963610006000000000000000000010000000100020000000000FFFF
      FF00000000020000000000000000008B46000013006D6D6F464F4E4546494C49
      414C424153455F50000200980000004B000000CE0000000A00000047000000F4
      010000000000000000FFFFFF1F2C02000000000001001600464F4E453A205B46
      4F4E4546494C49414C424153455D00000000FFFF000000000002000000010000
      0000090068656C76657469636100060000000000000000000000000001000200
      00000000FFFFFF00000000020000000000000000004047000014006D6D6F454E
      44455245434F5F42414952524F5F500002009800000035000000CF0000000A00
      000043000000F4010000000000000000FFFFFF1F2C020000000000010024005B
      52554146494C49414C424153455D202D205B42414952524F46494C49414C4241
      53455D00000000FFFF0000000000020000000100000000090068656C76657469
      63610006000000000000000000000000000100020000000000FFFFFF00000000
      020000000000000000000D48000012006D6D6F4345505F4349444144455F5546
      5F500002009800000040000000CF0000000A00000043000000F4010000000000
      000000FFFFFF1F2C02000000000001003E004345503A205B43455046494C4941
      4C424153455D202D205B43494441444546494C49414C424153455D202D205B45
      535441444F46494C49414C424153455D00000000FFFF00000000000200000001
      00000000090068656C7665746963610006000000000000000000000000000100
      020000000000FFFFFF0000000002000000000000000000AF48000014006D6D6F
      52415A414F46494C49414C424153455F50000200980000002A000000CF000000
      0A00000043000000F4010000000000000000FFFFFF1F2C020000000000010011
      005B52415A414F46494C49414C424153455D00000000FFFF0000000000020000
      000100000000090068656C766574696361000600000000000000000000000000
      0100020000000000FFFFFF00000000020000000000000000003D490000090066
      6D764F757472617300020079010000420000003B0200002800000043000000F4
      010000000000000000FFFFFF1F2C020000000000010008005B4F75747261735D
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      07000000000000000000020000000100020000000000FFFFFF00000000020000
      00000000000000C449000005004D656D6F340002001A0000006D0000002C0000
      000B00000043000F00F4010000000000000000FFFFFF1F2C0200000000000100
      0500444F43544F00000000FFFF0000000000020000000100000000090068656C
      76657469636100070000000000000000000A0000000100020000000000FFFFFF
      0000000002000000000000000000494A000006004D656D6F3132000200460000
      006D000000180000000B00000043000F00F4010000000000000000FFFFFF1F2C
      020000000000010002004E5000000000FFFF0000000000020000000100000000
      090068656C76657469636100070000000000000000000A000000010002000000
      0000FFFFFF0000000002000000000000000000DA4A000006004D656D6F353500
      0200040300006D000000630000000B00000043000F00F4010000000000000000
      FFFFFF1F2C02000000000001000E0042414E434F20434F4252414EC741000000
      00FFFF0000000000020000000100000000090068656C76657469636100070000
      000000000000000A0000000100020000000000FFFFFF00000000020000000000
      00000000674B000006004D656D6F35360002000D0200006D0000004B0000000B
      00000043000F00F4010000000000000000FFFFFF1F2C02000000000001000A00
      564C522056454E43544F00000000FFFF00000000000200000001000000000900
      68656C76657469636100070000000000000000000A0000000100020000000000
      FFFFFF0000000002000000000000000000F44B000006004D656D6F3537000200
      470100006D000000C70000000B00000043000F00F4010000000000000000FFFF
      FF1F2C02000000000001000A00464F524E454345444F5200000000FFFF000000
      0000020000000100000000090068656C76657469636100070000000000000000
      000A0000000100020000000000FFFFFF00000000020000000000000000007B4C
      000006004D656D6F3538000200670300006D000000230000000B00000043000F
      00F4010000000000000000FFFFFF1F2C020000000000010004005349542E0000
      0000FFFF0000000000020000000100000000090068656C766574696361000700
      00000000000000000A0000000100020000000000FFFFFF000000000200000000
      0000000000034D000006004D656D6F3539000200880000006D0000001D000000
      0B00000043000F00F4010000000000000000FFFFFF1F2C020000000000010005
      0053C952494500000000FFFF0000000000020000000100000000090068656C76
      657469636100070000000000000000000A0000000100020000000000FFFFFF00
      000000020000000000000000008A4D000006004D656D6F36300002005E000000
      6D0000002A0000000B00000043000F00F4010000000000000000FFFFFF1F2C02
      0000000000010004004E4F544100000000FFFF00000000000200000001000000
      00090068656C76657469636100070000000000000000000A0000000100020000
      000000FFFFFF0000000002000000000000000000134E000006004D656D6F3631
      000200A50000006D000000220000000B00000043000F00F40100000000000000
      00FFFFFF1F2C0200000000000100060046494C49414C00000000FFFF00000000
      00020000000100000000090068656C7665746963610007000000000000000000
      0A0000000100020000000000FFFFFF00000000020000000000000000009C4E00
      0006004D656D6F3632000200F40000006D0000002D0000000B00000043000F00
      F4010000000000000000FFFFFF1F2C0200000000000100060056454E43544F00
      000000FFFF0000000000020000000100000000090068656C7665746963610007
      0000000000000000000A0000000100020000000000FFFFFF0000000002000000
      000000000000264F000006004D656D6F3633000200C70000006D0000002D0000
      000B00000043000F00F4010000000000000000FFFFFF1F2C0200000000000100
      0700454D495353C34F00000000FFFF0000000000020000000100000000090068
      656C76657469636100070000000000000000000A0000000100020000000000FF
      FFFF0000000002000000000000000000AD4F000006004D656D6F363400020021
      0100006D000000260000000B00000043000F00F4010000000000000000FFFFFF
      1F2C0200000000000100040043D3442E00000000FFFF00000000000200000001
      00000000090068656C76657469636100070000000000000000000A0000000100
      020000000000FFFFFF00000000020000000000000000003850000006004D656D
      6F3635000200580200006D000000450000000B00000043000F00F40100000000
      00000000FFFFFF1F2C02000000000001000800444553434F4E544F00000000FF
      FF0000000000020000000100000000090068656C766574696361000700000000
      00000000000A0000000100020000000000FFFFFF000000000200000000000000
      0000C550000006004D656D6F36360002008A0300006D000000740000000B0000
      0043000F00F4010000000000000000FFFFFF1F2C02000000000001000A004F42
      5345525641C7C34F00000000FFFF000000000002000000010000000009006865
      6C76657469636100070000000000000000000A0000000100020000000000FFFF
      FF00000000020000000000000000004A51000005004D656D6F31000200E80200
      006D0000001C0000000B00000043000F00F4010000000000000000FFFFFF1F2C
      0200000000000100030044444100000000FFFF00000000000200000001000000
      00090068656C76657469636100070000000000000000000A0000000100020000
      000000FFFFFF00000000020000000000000000001D52000005004D656D6F3800
      0200EC0100004F020000600000000E00000043000000F4010000000000000000
      FFFFFF1F2C020000000000010051005B466F726D6174466C6F61742827232323
      2C2323232C2323302E3030272C53554D285B7172794475706C6963617461732E
      2276616C6F7276656E63746F225D2C204461646F734D65737472652C3129295D
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      07000000020000000000010000000100020000000000FFFFFF00000000020000
      00000000000000F152000006004D656D6F3334000200EC010000F80100006000
      00000E00000043000000F4010000000000000000FFFFFF1F2C02000000000001
      0051005B466F726D6174466C6F617428272323232C2323232C2323302E303027
      2C53554D285B7172794475706C6963617461732E2276616C6F7276656E63746F
      225D2C204461646F734D65737472652C3129295D00000000FFFF000000000002
      0000000100000000090068656C76657469636100070000000200000000000100
      00000100020000000000FFFFFF0000000002000000000000000000C553000006
      004D656D6F3432000200EC01000024020000600000000E00000043000000F401
      0000000000000000FFFFFF1F2C020000000000010051005B466F726D6174466C
      6F617428272323232C2323232C2323302E3030272C53554D285B717279447570
      6C6963617461732E2276616C6F7276656E63746F225D2C204461646F734D6573
      7472652C3129295D00000000FFFF000000000002000000010000000009006865
      6C7665746963610007000000020000000000010000000100020000000000FFFF
      FF00000000020000000000000000009954000006004D656D6F3436000200EC01
      0000C4010000600000000E00000043000000F4010000000000000000FFFFFF1F
      2C020000000000010051005B466F726D6174466C6F617428272323232C232323
      2C2323302E3030272C53554D285B7172794475706C6963617461732E2276616C
      6F7276656E63746F225D2C204461646F734D65737472652C3129295D00000000
      FFFF0000000000020000000100000000090068656C7665746963610007000000
      020000000000010000000100020000000000FFFFFF0000000002000000000000
      0000006D55000006004D656D6F3530000200EC01000098010000600000000E00
      000043000000F4010000000000000000FFFFFF1F2C020000000000010051005B
      466F726D6174466C6F617428272323232C2323232C2323302E3030272C53554D
      285B7172794475706C6963617461732E2276616C6F7276656E63746F225D2C20
      4461646F734D65737472652C3129295D00000000FFFF00000000000200000001
      00000000090068656C7665746963610007000000020000000000010000000100
      020000000000FFFFFF00000000020000000000000000001956000006004D656D
      6F3136000200E0020000450100000E0000000B00000040000000F40100000000
      00000000FFFFFF1F2C000000000000010029005B4946285B7172794475706C69
      63617461732E22646461225D3D547275652C202758272C202727295D00000000
      FFFF0000000000020000000100000006090068656C7665746963610007000000
      000000000000110000000100020000000000FFFFFF0000000002000000000000
      000000A656000005004D656D6F320002009D0200006D0000004B0000000B0000
      0043000F00F4010000000000000000FFFFFF1F2C02000000000001000B00564C
      52204CCD515549444F00000000FFFF0000000000020000000100000000090068
      656C76657469636100070000000000000000000A0000000100020000000000FF
      FFFF00000000020000000000000000007A57000005004D656D6F330002007C02
      000098010000600000000E00000043000000F4010000000000000000FFFFFF1F
      2C020000000000010052005B466F726D6174466C6F617428272323232C232323
      2C2323302E3030272C53554D285B7172794475706C6963617461732E2276616C
      6F726C69717569646F225D2C204461646F734D65737472652C3129295D000000
      00FFFF0000000000020000000100000000090068656C76657469636100070000
      00020000000000010000000100020000000000FFFFFF00000000020000000000
      000000004E58000005004D656D6F350002007C020000C4010000600000000E00
      000043000000F4010000000000000000FFFFFF1F2C020000000000010052005B
      466F726D6174466C6F617428272323232C2323232C2323302E3030272C53554D
      285B7172794475706C6963617461732E2276616C6F726C69717569646F225D2C
      204461646F734D65737472652C3129295D00000000FFFF000000000002000000
      0100000000090068656C76657469636100070000000200000000000100000001
      00020000000000FFFFFF00000000020000000000000000002259000005004D65
      6D6F360002007C020000F8010000600000000E00000043000000F40100000000
      00000000FFFFFF1F2C020000000000010052005B466F726D6174466C6F617428
      272323232C2323232C2323302E3030272C53554D285B7172794475706C696361
      7461732E2276616C6F726C69717569646F225D2C204461646F734D6573747265
      2C3129295D00000000FFFF0000000000020000000100000000090068656C7665
      746963610007000000020000000000010000000100020000000000FFFFFF0000
      000002000000000000000000F659000005004D656D6F370002007C0200002402
      0000600000000E00000043000000F4010000000000000000FFFFFF1F2C020000
      000000010052005B466F726D6174466C6F617428272323232C2323232C232330
      2E3030272C53554D285B7172794475706C6963617461732E2276616C6F726C69
      717569646F225D2C204461646F734D65737472652C3129295D00000000FFFF00
      00000000020000000100000000090068656C7665746963610007000000020000
      000000010000000100020000000000FFFFFF0000000002000000000000000000
      CB5A000006004D656D6F31380002007C0200004F020000600000000E00000043
      000000F4010000000000000000FFFFFF1F2C020000000000010052005B466F72
      6D6174466C6F617428272323232C2323232C2323302E3030272C53554D285B71
      72794475706C6963617461732E2276616C6F726C69717569646F225D2C204461
      646F734D65737472652C3129295D00000000FFFF000000000002000000010000
      0000090068656C76657469636100070000000200000000000100000001000200
      00000000FFFFFF00000000020000000000000000007D5B000006004D656D6F32
      31000200750000006C010000590100000E00000043000000F401000000000000
      0000FFFFFF1F2C02000000000001002F00544F54414C20444F43554D454E544F
      3A205B7172794475706C6963617461732E22646F63756D656E746F706167225D
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      07000000000000000000010000000100020000000000FFFFFF00000000020000
      00000000000000515C000006004D656D6F3232000200FC0100006C0100005000
      00000E00000043000000F4010000000000000000FFFFFF1F2C02000000000001
      0051005B466F726D6174466C6F617428272323232C2323232C2323302E303027
      2C53554D285B7172794475706C6963617461732E2276616C6F7276656E63746F
      225D2C204461646F734D65737472652C3129295D00000000FFFF000000000002
      0000000100000000090068656C76657469636100070000000200000000000100
      00000100020000000000FFFFFF00000000020000000000000000003D5D000006
      004D656D6F3236000200D30100006C0100002B0000000E00000043000000F401
      0000000000000000FFFFFF1F2C02000000000001000000000500050062656769
      6E0D250020206966205B53554D28312C4461646F734D65737472652C31295D20
      3C3E2030207468656E0D2400202020202020204D656D6F3A3D205B53554D2831
      2C4461646F734D65737472652C31295D0D0A002020656C73652027273B0D0300
      656E6400FFFF0000000000020000000100000000090068656C76657469636100
      07000000020000000000010000000100020000000000FFFFFF00000000020000
      00000000000000135E000006004D656D6F3238000200490200006C0100004800
      00000E00000043000000F4010000000000000000FFFFFF1F2C02000000000001
      0053005B466F726D6174466C6F617428272323232C2323232C2323302E303027
      2C53554D285B7172794475706C6963617461732E2276616C6F72646573636F6E
      746F225D2C204461646F734D65737472652C3129295D00000000FFFF00000000
      00020000000100000000090068656C7665746963610007000000020000000000
      010000000100020000000000FFFFFF0000000002000000000000000000E85E00
      0006004D656D6F33300002008C0200006C010000500000000E00000043000000
      F4010000000000000000FFFFFF1F2C020000000000010052005B466F726D6174
      466C6F617428272323232C2323232C2323302E3030272C53554D285B71727944
      75706C6963617461732E2276616C6F726C69717569646F225D2C204461646F73
      4D65737472652C3129295D00000000FFFF000000000002000000010000000009
      0068656C76657469636100070000000200000000000100000001000200000000
      00FFFFFF000000000200000000000000FEFEFF0A000000040020566172000000
      000600546974756C6F00100027434F4E5441532041205041474152270006004F
      7574726173000000000C00204167727570616D656E746F000000001200416772
      75706172477275706F46696C69616C00050046616C7365000D00416772757061
      7246696C69616C00050046616C736500110041677275706172466F726E656365
      646F7200050046616C7365000B00416772757061724461746100050046616C73
      6500140041677275706172446F63756D656E746F7350616700050046616C7365
      000700204F7574726F73000000000000000000000000FC000000000000000000
      000000000000005800E00C74D16F88E340B61EFA1D0D39E640}
  end
end
