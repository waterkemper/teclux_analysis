inherited dtmConsultaContratosManutencao: TdtmConsultaContratosManutencao
  OldCreateOrder = False
  Left = 409
  Top = 205
  Height = 458
  Width = 706
  object qryContratosManutencao: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryContratosManutencaoAfterOpen
    AfterScroll = qryContratosManutencaoAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'Intervalo_Abertura'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Intervalo_Assinatura'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Intervalo_Encerramento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Intervalo_Cancelamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Situacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaCondicionalusuarios'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaCondicionalgruposusuarios'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Equipamento'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select cm.*,'
      '       vf.nome,'
      '       vf.pessoanumero,'
      
        '       (select e.descricao from equipamentos e where e.codigo = ' +
        'cm.equipamento) as descricaoequipamento,'
      ''
      '       (select count(*)'
      '        from parcelas p'
      
        '        where p.contrato in (select ct.numero from contratos ct ' +
        'where ct.contratomanutencao = cm.numero)) as QtParcelas,'
      ''
      '       cast (case when cm.situacao = '#39'O'#39' then '#39'OR'#199'ADO'#39
      '                  when cm.situacao = '#39'A'#39' then '#39'ASSINADO'#39
      '                  when cm.situacao = '#39'F'#39' then '#39'FECHADO'#39
      '                  when cm.situacao = '#39'C'#39' then '#39'CANCELADO'#39
      '             end as varchar(20)) as NomeSituacao,'
      ''
      '       (select m.descricao'
      '        from motivos m'
      '        where m.codigo = cm.motivo'
      '       ) as descricaomotivo,'
      ''
      
        '      (select u.nome from usuarios u where u.codigo = cm.vendedo' +
        'r) as vendedornome,'
      '      '
      '      false as selecionar'
      ''
      ''
      'from ((contratosmanutencao cm'
      '     join vfornecedores vf'
      '     on cm.cliente = vf.codigo'
      '     and cm.tipocliente = vf.tipo)'
      ''
      ''
      '     join (usuarios u'
      '                left join GruposUsuarios gu'
      '                on u.grupo = gu.codigo)'
      '     on cm.vendedor = u.codigo)'
      ''
      ''
      ''
      'where true'
      ''
      '  %Intervalo_Abertura'
      '  %Intervalo_Assinatura'
      '  %Intervalo_Encerramento'
      '  %Intervalo_Cancelamento'
      '  %Situacao'
      '  %Filial'
      '  %Cliente'
      '  %ListaCondicionalusuarios'
      '  %ListaCondicionalgruposusuarios'
      '  %Equipamento')
    RequestLive = True
    Left = 104
    Top = 24
    object qryContratosManutencaonumero: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'numero'
    end
    object qryContratosManutencaocliente: TIntegerField
      FieldName = 'cliente'
      Required = True
    end
    object qryContratosManutencaotipocliente: TStringField
      DisplayLabel = 'tipo cliente'
      FieldName = 'tipocliente'
      Required = True
      Size = 1
    end
    object qryContratosManutencaodiavencimento: TIntegerField
      DisplayLabel = 'dia do vencimento'
      FieldName = 'diavencimento'
    end
    object qryContratosManutencaoassinatura: TDateField
      Alignment = taCenter
      FieldName = 'assinatura'
      EditMask = '99/99/9999;1; '
    end
    object qryContratosManutencaovigencia: TDateField
      Alignment = taCenter
      DisplayLabel = 'Vig'#234'ncia'
      FieldName = 'vigencia'
      EditMask = '99/99/9999;1; '
    end
    object qryContratosManutencaovalor: TFloatField
      FieldName = 'valor'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryContratosManutencaoobservacoesnf: TStringField
      FieldName = 'observacoesnf'
      Size = 200
    end
    object qryContratosManutencaoformacontrato: TIntegerField
      FieldName = 'formacontrato'
      Required = True
    end
    object qryContratosManutencaodataentrega: TDateField
      Alignment = taCenter
      DisplayLabel = 'Entrega/Instala'#231#227'o'
      FieldName = 'dataentrega'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryContratosManutencaovalortaxaentrega: TFloatField
      DisplayLabel = 'Valor Taxa Entrega'
      FieldName = 'valortaxaentrega'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryContratosManutencaodiaslocados: TIntegerField
      DisplayLabel = 'dias locados'
      FieldName = 'diaslocados'
      Required = True
    end
    object qryContratosManutencaoformadoaluguel: TStringField
      DisplayLabel = 'Forma do Aluguel'
      FieldName = 'formadoaluguel'
      Required = True
      Size = 1
    end
    object qryContratosManutencaovalorcaucao: TFloatField
      DisplayLabel = 'Valor Cau'#231#227'o'
      FieldName = 'valorcaucao'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryContratosManutencaonometitularidadecaucao: TStringField
      DisplayLabel = 'Nome do Titular da Cau'#231#227'o'
      FieldName = 'nometitularidadecaucao'
      Size = 50
    end
    object qryContratosManutencaoequipamento: TStringField
      FieldName = 'equipamento'
      Size = 10
    end
    object qryContratosManutencaonome: TStringField
      DisplayWidth = 18
      FieldName = 'nome'
      Size = 50
    end
    object qryContratosManutencaopessoanumero: TStringField
      FieldName = 'pessoanumero'
      Size = 14
    end
    object qryContratosManutencaodescricaoequipamento: TStringField
      FieldName = 'descricaoequipamento'
      Size = 50
    end
    object qryContratosManutencaoDataTermino: TDateField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'DataTermino'
      EditMask = '99/99/9999;1; '
      Calculated = True
    end
    object qryContratosManutencaovendedor: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'vendedor'
      Required = True
    end
    object qryContratosManutencaofilialvenda: TIntegerField
      FieldName = 'filialvenda'
    end
    object qryContratosManutencaoqtparcelas: TLargeintField
      FieldName = 'qtparcelas'
    end
    object qryContratosManutencaosituacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
    object qryContratosManutencaonomesituacao: TStringField
      FieldName = 'nomesituacao'
    end
    object qryContratosManutencaocan_data: TDateField
      FieldName = 'can_data'
    end
    object qryContratosManutencaomotivo: TIntegerField
      FieldName = 'motivo'
    end
    object qryContratosManutencaodescricaomotivo: TStringField
      FieldName = 'descricaomotivo'
      Size = 30
    end
    object qryContratosManutencaoconclusao: TDateField
      FieldName = 'conclusao'
    end
    object qryContratosManutencaoabertura: TDateField
      FieldName = 'abertura'
    end
    object qryContratosManutencaodescricaocancelamento: TStringField
      FieldName = 'descricaocancelamento'
      Size = 200
    end
    object qryContratosManutencaovendedornome: TStringField
      FieldName = 'vendedornome'
      Size = 100
    end
    object qryContratosManutencaoselecionar: TBooleanField
      FieldName = 'selecionar'
    end
  end
  object dsrContratosManutencao: TtecDataSource
    DataSet = qryContratosManutencao
    Left = 136
    Top = 40
  end
  object qryServicosContratosManutencao: TtecQuery
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
      'select scm.*,'
      '       s.descricao as descricaoservico'
      'from servicoscontratosmanutencao scm, servicos s'
      'where scm.contrato = :contrato'
      '  and scm.servico = s.codigo')
    RequestLive = True
    Left = 96
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'contrato'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryServicosContratosManutencaocontrato: TIntegerField
      FieldName = 'contrato'
    end
    object qryServicosContratosManutencaoservico: TIntegerField
      FieldName = 'servico'
      Required = True
    end
    object qryServicosContratosManutencaodescricaoservico: TStringField
      FieldName = 'descricaoservico'
      Required = True
      Size = 70
    end
    object qryServicosContratosManutencaoquantidade: TIntegerField
      FieldName = 'quantidade'
      Required = True
    end
    object qryServicosContratosManutencaovalor: TFloatField
      FieldName = 'valor'
      Required = True
      DisplayFormat = '0.00'
      currency = True
    end
  end
  object dsrServicosContratosManutencao: TtecDataSource
    DataSet = qryServicosContratosManutencao
    Left = 144
    Top = 136
  end
  object qryParcelasContratosManutencao: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select pcm.*,'
      '       p.datavencto as datavenctoparcela,'
      '       p.valorvencto as valorvenctoparcela,'
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
      '       p.datapagto,'
      '       p.valorpagto,'
      ''
      '       ct.numero as contrato'
      ''
      'from parcelascontratosmanutencao pcm'
      ''
      '     left join (contratos ct'
      '                join parcelas p'
      '                on ct.numero = p.contrato'
      '                )'
      '     on pcm.contratomanutencao = ct.contratomanutencao'
      '     and pcm.numero = ct.parcelacontratomanutencao'
      ''
      ''
      'where pcm.contratomanutencao = :contratomanutencao'
      'order by pcm.numero'
      '')
    RequestLive = True
    Left = 96
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contratomanutencao'
        ParamType = ptUnknown
      end>
    object qryParcelasContratosManutencaocontratomanutencao: TIntegerField
      FieldName = 'contratomanutencao'
      Required = True
    end
    object qryParcelasContratosManutencaonumero: TIntegerField
      FieldName = 'numero'
      Required = True
    end
    object qryParcelasContratosManutencaodatavencto: TDateField
      FieldName = 'datavencto'
    end
    object qryParcelasContratosManutencaovalorvencto: TFloatField
      FieldName = 'valorvencto'
    end
    object qryParcelasContratosManutencaodatahoraatualizacao: TDateTimeField
      FieldName = 'datahoraatualizacao'
      DisplayFormat = 'dd/mm/yyy hh:mm'
    end
    object qryParcelasContratosManutencaodatavenctoparcela: TDateField
      FieldName = 'datavenctoparcela'
    end
    object qryParcelasContratosManutencaovalorvenctoparcela: TFloatField
      FieldName = 'valorvenctoparcela'
    end
    object qryParcelasContratosManutencaosituacaocontrato: TStringField
      FieldName = 'situacaocontrato'
    end
    object qryParcelasContratosManutencaodatapagto: TDateField
      FieldName = 'datapagto'
    end
    object qryParcelasContratosManutencaovalorpagto: TFloatField
      FieldName = 'valorpagto'
    end
    object qryParcelasContratosManutencaocontrato: TStringField
      FieldName = 'contrato'
    end
  end
  object dsrParcelasContratosManutencao: TtecDataSource
    DataSet = qryParcelasContratosManutencao
    Left = 128
    Top = 240
  end
  object dsrTotais_: TtecDataSource
    DataSet = qryTotais_
    Left = 272
    Top = 24
  end
  object qryTotais_: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select cast(null as integer) as RegistrosSelecionados,'
      
        '       cast(null as numeric(11,2)) as TotalRegistrosSelecionados' +
        ','
      '       cast(null as integer) as RegistrosMarcados,'
      '       cast(null as numeric(11,2)) as TotalRegistrosMarcados'
      '        ')
    RequestLive = True
    Left = 312
    Top = 48
    object qryTotais_registrosselecionados: TIntegerField
      FieldName = 'registrosselecionados'
    end
    object qryTotais_totalregistrosselecionados: TFloatField
      FieldName = 'totalregistrosselecionados'
    end
    object qryTotais_registrosmarcados: TIntegerField
      FieldName = 'registrosmarcados'
    end
    object qryTotais_totalregistrosmarcados: TFloatField
      FieldName = 'totalregistrosmarcados'
    end
  end
end
