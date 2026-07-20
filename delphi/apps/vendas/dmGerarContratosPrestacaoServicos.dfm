inherited dtmGerarContratosPrestacaoServicos: TdtmGerarContratosPrestacaoServicos
  OldCreateOrder = False
  Left = 451
  Top = 262
  Height = 658
  Width = 829
  object qryContratosManutencao: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnCalcFields = qryContratosManutencaoCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'ListaClientes'
        ParamType = ptInput
      end>
    Sql.Strings = (
      ';'
      'select cm.*,'
      ''
      
        '       case when cm.formacontrato = 0 then coalesce(cm.vigencia,' +
        'cm.assinatura,cm.abertura)'
      '            when cm.formacontrato = 1 then'
      
        '                case when cm.formadoaluguel = '#39'D'#39' then cm.dataen' +
        'trega'
      
        '                     when cm.formadoaluguel = '#39'M'#39' then cm.dataen' +
        'trega'
      '                end'
      '       end as data_,'
      ''
      '       cast(case when cm.formacontrato = 0 then cm.diavencimento'
      '            when cm.formacontrato = 1 then'
      
        '                case when cm.formadoaluguel = '#39'D'#39' then extract (' +
        'day from (cm.dataentrega + cm.diaslocados))'
      
        '                     when cm.formadoaluguel = '#39'M'#39' then extract (' +
        'day from (cm.dataentrega))'
      '                end'
      '       end as Integer) as diavencimento_,'
      ''
      ''
      '       vf.nome as nomecliente,'
      ''
      '       cmd.numeroparcela,'
      ''
      '       coalesce(pcm.datavencto, cmd.datavencto)  as datavencto,'
      
        '       coalesce(pcm.valorvencto, cmd.valorvencto) as valorvencto' +
        ','
      ''
      '       p.numero as numeroparcelacontrato,'
      ''
      '       p.datavencto as datavenctoparcela,'
      '       p.valorvencto as valorvenctoparcela,'
      ''
      '       p.datapagto as datapagtoparcela,'
      '       p.valorpagto as valorpagtoparcela,'
      ''
      '       cast (case when ct.situacao = '#39'O'#39' then '#39'OR'#199'ADO'#39
      '                        when ct.situacao = '#39'R'#39' then '#39'RESERVADO'#39
      '                        when ct.situacao = '#39'F'#39' then'
      '                             case when'
      ''
      '                                 coalesce((select true'
      '                                           from dadosfiscais df'
      
        '                                           where df.contrato = c' +
        't.numero'
      
        '                                             and df.situacao = '#39 +
        'N'#39
      
        '                                             and mod(df.codigofi' +
        'scal,1000) = 922 limit 1), false)'
      
        '                             then '#39'SIMPLES FATURAMENTO'#39' else '#39'FA' +
        'TURADO'#39' end'
      
        '                        when ct.situacao = '#39'P'#39' then '#39'NOTA PARCIA' +
        'L'#39
      
        '                        when ct.situacao = '#39'N'#39' then '#39'NOTA FISCAL' +
        #39
      '                        when ct.situacao = '#39'C'#39' then '#39'CANCELADO'#39
      '             end as varchar(20)) as situacaocontrato,'
      ''
      ''
      '       ct.numero as contrato,'
      '       pcm.contratomanutencao,'
      
        '       case when ct.situacao is null or ct.situacao = '#39'R'#39' then t' +
        'rue else false end as marcar'
      ''
      'from ((contratosmanutencao cm'
      '     join'
      ''
      '       (('
      '        select * from vencimentoscontratomanutencao('
      
        '                                                    cast(:datain' +
        'icial as date),'
      
        '                                                    cast(:datafi' +
        'nal as date),'
      
        '                                                    cast('#39#39' as v' +
        'archar(1000)),'
      
        '                                                    cast(%ListaC' +
        'lientes as varchar(1000)),'
      
        '                                                    cast(3 as sm' +
        'allint)'
      '                                                    )'
      '       ) cmd'
      '       '
      '           left join (parcelascontratosmanutencao pcm'
      '                      left join (contratos ct'
      '                                 join parcelas p'
      '                                 on ct.numero = p.contrato)'
      
        '                      on pcm.contratomanutencao = ct.contratoman' +
        'utencao'
      
        '                      and pcm.numero = ct.parcelacontratomanuten' +
        'cao'
      '                      and ct.situacao in ('#39'R'#39','#39'F'#39','#39'N'#39','#39'P'#39'))'
      '           '
      '           on pcm.contratomanutencao = cmd.contratomanutencao'
      '           and pcm.numero = cmd.numeroparcela)'
      '           '
      '       on cm.numero = cmd.contratomanutencao)    '
      ''
      '      join vfornecedores vf'
      '      on cm.cliente = vf.codigo'
      '      and cm.tipocliente = vf.tipo)'
      ''
      ''
      'where cm.situacao = '#39'A'#39
      
        '  and case when :OpcaoDaSelecao = 0 then   /* Somente Novas incl' +
        'us'#245'es */'
      '     ct.numero is null'
      '  else'
      '    true'
      '  end'
      ''
      'order by cmd.datavencto, cm.cliente, cm.tipocliente'
      '')
    RequestLive = True
    Left = 64
    Top = 80
    ParamData = <
      item
        DataType = ftString
        Name = 'datainicial'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftDate
        Name = 'dataFinal'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftUnknown
        Name = 'OpcaoDaSelecao'
        ParamType = ptUnknown
      end>
    object qryContratosManutencaonumero: TIntegerField
      FieldName = 'numero'
      Required = True
      DisplayFormat = '0'
    end
    object qryContratosManutencaocliente: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object qryContratosManutencaotipocliente: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
    object qryContratosManutencaonomecliente: TStringField
      FieldName = 'nomecliente'
      Size = 50
    end
    object qryContratosManutencaodata_: TDateField
      FieldName = 'data_'
    end
    object qryContratosManutencaodataentrega: TDateField
      FieldName = 'dataentrega'
    end
    object qryContratosManutencaoassinatura: TDateField
      Alignment = taCenter
      FieldName = 'assinatura'
      EditMask = '99/99/9999;1; '
    end
    object qryContratosManutencaovigencia: TDateField
      Alignment = taCenter
      FieldName = 'vigencia'
      EditMask = '99/99/9999;1; '
    end
    object qryContratosManutencaodiavencimento_: TIntegerField
      DisplayLabel = 'DIA VENCTO'
      FieldName = 'diavencimento_'
    end
    object qryContratosManutencaodiavencimento: TIntegerField
      FieldName = 'diavencimento'
      DisplayFormat = '0'
    end
    object qryContratosManutencaoobservacoesnf: TStringField
      FieldName = 'observacoesnf'
      Size = 200
    end
    object qryContratosManutencaodesconsiderar: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'desconsiderar'
      Calculated = True
    end
    object qryContratosManutencaovalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '0.00'
    end
    object qryContratosManutencaonumeroparcela: TIntegerField
      FieldName = 'numeroparcela'
    end
    object qryContratosManutencaocontrato: TStringField
      FieldName = 'contrato'
    end
    object qryContratosManutencaodatavencto: TDateField
      FieldName = 'datavencto'
    end
    object qryContratosManutencaosituacaocontrato: TStringField
      FieldName = 'situacaocontrato'
    end
    object qryContratosManutencaovalorvencto: TCurrencyField
      FieldName = 'valorvencto'
    end
    object qryContratosManutencaonumeroparcelacontrato: TIntegerField
      FieldName = 'numeroparcelacontrato'
    end
    object qryContratosManutencaodatavenctoparcela: TDateField
      FieldName = 'datavenctoparcela'
    end
    object qryContratosManutencaovalorvenctoparcela: TCurrencyField
      FieldName = 'valorvenctoparcela'
    end
    object qryContratosManutencaodatapagtoparcela: TDateField
      FieldName = 'datapagtoparcela'
    end
    object qryContratosManutencaovalorpagtoparcela: TCurrencyField
      FieldName = 'valorpagtoparcela'
    end
    object qryContratosManutencaomarcar: TBooleanField
      FieldName = 'marcar'
    end
    object qryContratosManutencaocontratomanutencao: TIntegerField
      FieldName = 'contratomanutencao'
    end
  end
  object dsrContratosManutencao: TtecDataSource
    DataSet = qryContratosManutencao
    OnDataChange = dsrContratosManutencaoDataChange
    Left = 72
    Top = 128
  end
  object qryAtualizarParcelasContratosManutencao: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'contratomanutencao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'insert into parcelascontratosmanutencao'
      
        '  (contratomanutencao, numero, datavencto, valorvencto, datahora' +
        'atualizacao)'
      ''
      '('
      
        '        select contratomanutencao, numeroparcela as numero, data' +
        'vencto, valorvencto, CURRENT_TIMESTAMP'
      
        '        from vencimentoscontratomanutencao(:DataInicial, :DataFi' +
        'nal,'
      
        '                                           cast(%contratomanuten' +
        'cao as varchar(1000)),'
      
        '                                           cast('#39#39' as varchar(10' +
        '00)),'
      '                                           cast(2 as smallint))'
      ');')
    RequestLive = True
    Left = 256
    Top = 216
    ParamData = <
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
  end
  object qryGerarContratoporContratodeManutencao: TtecQuery
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
      
        'select gerarcontratoporcontratodemanutencao(:contratoManutencao,' +
        ' :parcelacontratomanutencao);')
    RequestLive = True
    Left = 256
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contratoManutencao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'parcelacontratomanutencao'
        ParamType = ptUnknown
      end>
  end
end
