inherited dtmControleRecebimentos: TdtmControleRecebimentos
  OldCreateOrder = False
  Left = 269
  Top = 234
  Height = 441
  Width = 685
  object qryRecebimentos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeInsert = qryRecebimentosBeforeInsert
    BeforeDelete = qryRecebimentosBeforeDelete
    AfterScroll = qryRecebimentosAfterScroll
    OnCalcFields = qryRecebimentosCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'SQLRecebimentosDataVencto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SQLRecebimentosDataLancto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SQLRecebimentosDataRecebimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Filial_Recebimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TipoRecebimento_Recebimentos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FormadeRecebimentos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CondicaoOperacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'meiosdepagamento_Recebimentos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cliente_Contrato'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';'
      
        'Select coalesce(ct.cliente, (select aut.cliente from autenticaco' +
        'es aut where aut.transacao = r.transacao and cliente is not null' +
        ' limit 1)) as cliente,'
      '       coalesce(ct.tipocliente, '#39'C'#39') as tipolciente,'
      '       coalesce(vf.razao,vf.nome) as nomecliente,'
      '       r.*,'
      '       cast(substr(r.cheque,1,3) as varchar) as cheque_banco,'
      '       cast(substr(r.cheque,4,4) as varchar) as cheque_agencia,'
      '       cast(substr(r.cheque,12,6) as varchar) as cheque_cheque,'
      '       cast(substr(r.cheque,20,10) as varchar) as cheque_conta,'
      '       0.00 as juros,'
      
        '       (select coalesce(tef.nomeredensu,'#39#39') from tef where cast(' +
        'tef.codigo as varchar)= r.tef) as nomeredetef,'
      '       1 AS Quantidade'
      ''
      'from'
      '('
      'select r.*,'
      '       (select p.contrato'
      '        from parcelas p'
      '        where p.transacao = r.transacao limit 1) as contrato'
      'from'
      '('
      ' Select  r.codigo,'
      '         r.situacao,'
      '         r.datavencto,'
      '         r.valorvencto,'
      '         r.valorlancto,'
      '         r.tiporecebimento as codigotiporecebimento,'
      '         r.tiporecebimento as codigotiporecebimento_auxiliar,'
      '         /* p.contrato, */'
      '         r.datalancto,'
      '         tr.descricao as descricaotiporecebimento,'
      '         tr.tiporecebimento,'
      '         r.cheque,'
      '         r.desagio as pDesagio,'
      '         r.controle,'
      '         r.controlerecebimento,'
      '         r.valorlancto-r.valorvencto as ValorDesagio,'
      '         r.valortotal,'
      
        '/*         (select sum(valorvencto) from parcelas where transaca' +
        'o=r.transacao and contrato=p.contrato) as total_parcelas_transac' +
        'ao,'
      
        '           (select sum(valorlancto) from recebimentos where tran' +
        'sacao=r.transacao) as total_recebimentos_transacao,'
      '*/'
      
        '         case when (:operacao=2) then not r.confirmado else r.co' +
        'nfirmado end as confirmado,'
      '         r.transacao,'
      '         ch.vencto as cheque_vencto,'
      '         ch.titular as cheque_titular,'
      '         r.tef,'
      
        '         (select coalesce(tef.nomeredensu,'#39#39') from tef where cas' +
        't(tef.codigo as varchar)= r.tef) as nomeredetef,'
      '/*         r.usuario_confirmacao,'
      '         r.data_operacao,*/'
      '         r.valor_confirmacao,'
      '         r.valor_confirmacao as valor_confirmacao_old,'
      ''
      '         r.filial,'
      '         f.nome as nomefilialemissao,'
      ''
      '         coalesce(r.conta, ctr.conta) as conta,'
      '         r.data_confirmacao,'
      '         r.sequencia,'
      '         coalesce(r.evento, ctr.evento) as evento,'
      '         r.sequenciaevento,'
      ''
      '         r.data_confirmacao as data_confirmacao_old,'
      ''
      '         r.documentopag,'
      '         r.duplicata,'
      ''
      '         (select count(*)'
      '          from recebimentos rc'
      '          where rc.controlerecebimento = r.controlerecebimento'
      '            and rc.confirmado) as QuantidadeConfirmacoes,'
      '            '
      '         coalesce(r.fornecedor, tr.fornecedor) as fornecedor,'
      
        '         coalesce(r.eventodocumentopag, tr.evento) as eventodocu' +
        'mentopag,'
      ''
      
        '         cast(contratosdatransacao(r.transacao) as varchar(50)) ' +
        'as ListaContratos,'
      
        '         cast(orcamentosdatransacao(r.transacao) as varchar(50))' +
        ' as ListaOrcamentos'
      ''
      ''
      '  from recebimentos r'
      '       join tiposrecebimentos tr'
      '       on r.tiporecebimento = tr.codigo'
      ''
      '       join filiais f'
      '       on r.filial = f.codigo'
      ''
      '       LEFT JOIN cheques ch'
      '       ON r.cheque = ch.numero'
      ''
      '       left join contastiposrecebimentos ctr'
      '       on r.filial = ctr.filial'
      '       and tr.codigo = ctr.tiporecebimento'
      ''
      ''
      '  where r.tiporecebimento = tr.codigo  '
      '    and r.filial = f.codigo'
      '/*  and p.contrato=ct.numero'
      '  and p.transacao=r.transacao*/'
      '   %SQLRecebimentosDataVencto'
      '   %SQLRecebimentosDataLancto'
      '   %SQLRecebimentosDataRecebimento'
      '   %Filial_Recebimento'
      '    and r.situacao = '#39'N'#39
      '   %TipoRecebimento_Recebimentos'
      '   %FormadeRecebimentos'
      ''
      '   %CondicaoOperacao'
      ''
      '   %meiosdepagamento_Recebimentos'
      ''
      ') as r'
      ') as r'
      '     left join (contratos ct'
      '           join vfornecedores vf'
      '           on vf.codigo = ct.cliente'
      '           and vf.tipo = ct.tipocliente)'
      '     on r.contrato = ct.numero'
      'where true'
      '%Cliente_Contrato'
      ''
      
        'ORDER BY r.filial, r.datalancto, r.transacao, r.valorvencto, r.c' +
        'odigo, r.codigotiporecebimento, r.datavencto'
      ''
      '')
    RequestLive = True
    Left = 44
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'operacao'
        ParamType = ptUnknown
      end>
    object qryRecebimentoscodigo: TIntegerField
      FieldName = 'codigo'
      ReadOnly = True
      DisplayFormat = '0'
    end
    object qryRecebimentossituacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
    object qryRecebimentoscodigotiporecebimento: TIntegerField
      FieldName = 'codigotiporecebimento'
      DisplayFormat = '0'
    end
    object qryRecebimentosvalorlancto: TFloatField
      FieldName = 'valorlancto'
      ReadOnly = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryRecebimentosdatalancto: TDateTimeField
      FieldName = 'datalancto'
      DisplayFormat = 'dd/mm/yy hh:mm'
    end
    object qryRecebimentosvalorvencto: TFloatField
      FieldName = 'valorvencto'
      DisplayFormat = '###,###,##0.00'
    end
    object qryRecebimentosdatavencto: TDateField
      Alignment = taCenter
      FieldName = 'datavencto'
      EditMask = '99/99/9999;1; '
    end
    object qryRecebimentospdesagio: TFloatField
      FieldName = 'pdesagio'
      DisplayFormat = '0.00'
    end
    object qryRecebimentostransacao: TIntegerField
      FieldName = 'transacao'
      ReadOnly = True
      DisplayFormat = '0'
    end
    object qryRecebimentoscheque: TStringField
      FieldName = 'cheque'
      Size = 30
    end
    object qryRecebimentosconfirmado: TBooleanField
      FieldName = 'confirmado'
    end
    object qryRecebimentostiporec: TStringField
      FieldKind = fkLookup
      FieldName = 'tiporec'
      LookupDataSet = qryTiposRecebimentos
      LookupKeyFields = 'codigo'
      LookupResultField = 'descricao'
      KeyFields = 'codigotiporecebimento'
      Size = 50
      Lookup = True
    end
    object qryRecebimentosfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryRecebimentoscontrole: TIntegerField
      FieldName = 'controle'
      DisplayFormat = '0'
    end
    object qryRecebimentoscheque_vencto: TDateField
      Alignment = taCenter
      FieldName = 'cheque_vencto'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryRecebimentoscheque_titular: TStringField
      FieldName = 'cheque_titular'
      Required = True
      Size = 40
    end
    object qryRecebimentosnomecliente: TStringField
      FieldName = 'nomecliente'
      Size = 50
    end
    object qryRecebimentoscheque_banco: TStringField
      FieldName = 'cheque_banco'
      Size = 50
    end
    object qryRecebimentoscheque_agencia: TStringField
      FieldName = 'cheque_agencia'
      Size = 50
    end
    object qryRecebimentoscheque_cheque: TStringField
      FieldName = 'cheque_cheque'
      Size = 50
    end
    object qryRecebimentoscheque_conta: TStringField
      FieldName = 'cheque_conta'
      Size = 50
    end
    object qryRecebimentossituac: TStringField
      FieldKind = fkLookup
      FieldName = 'situac'
      LookupDataSet = qrySituacaoRecebimentos
      LookupKeyFields = 'situacao'
      LookupResultField = 'descricao'
      KeyFields = 'situacao'
      Size = 15
      Lookup = True
    end
    object qryRecebimentosnomeredetef: TStringField
      FieldName = 'nomeredetef'
      ReadOnly = True
      Size = 50
    end
    object qryRecebimentoscliente: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object qryRecebimentosvalor_confirmacao: TFloatField
      FieldName = 'valor_confirmacao'
      DisplayFormat = '###,###,##0.00'
    end
    object qryRecebimentostef: TStringField
      FieldName = 'tef'
      Size = 12
    end
    object qryRecebimentosconta: TIntegerField
      FieldName = 'conta'
      DisplayFormat = '0'
    end
    object qryRecebimentossequencia: TIntegerField
      FieldName = 'sequencia'
      DisplayFormat = '0'
    end
    object qryRecebimentosdata_confirmacao: TDateField
      FieldName = 'data_confirmacao'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/00;1; '
    end
    object qryRecebimentosevento: TIntegerField
      FieldName = 'evento'
      DisplayFormat = '0'
    end
    object qryRecebimentossequenciaevento: TIntegerField
      FieldName = 'sequenciaevento'
      DisplayFormat = '0'
    end
    object qryRecebimentosdata_confirmacao_old: TDateField
      Alignment = taCenter
      FieldName = 'data_confirmacao_old'
    end
    object qryRecebimentosvalortotal: TFloatField
      FieldName = 'valortotal'
      DisplayFormat = '###,###,##0.00'
    end
    object qryRecebimentoscodigotiporecebimento_auxiliar: TIntegerField
      FieldName = 'codigotiporecebimento_auxiliar'
      DisplayFormat = '0'
    end
    object qryRecebimentoscontrolerecebimento: TIntegerField
      FieldName = 'controlerecebimento'
      DisplayFormat = '0'
    end
    object qryRecebimentosquantidadeconfirmacoes: TLargeintField
      FieldName = 'quantidadeconfirmacoes'
    end
    object qryRecebimentosdocumentopag: TIntegerField
      FieldName = 'documentopag'
      DisplayFormat = '0'
    end
    object qryRecebimentosduplicata: TIntegerField
      FieldName = 'duplicata'
      DisplayFormat = '0'
    end
    object qryRecebimentosVlrDesagio: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'VlrDesagio'
      DisplayFormat = '###,###,##0.00'
      Calculated = True
    end
    object qryRecebimentosfornecedor: TIntegerField
      FieldName = 'fornecedor'
      DisplayFormat = '0'
    end
    object qryRecebimentoseventodocumentopag: TIntegerField
      FieldName = 'eventodocumentopag'
    end
    object qryRecebimentosvalor_confirmacao_old: TFloatField
      FieldName = 'valor_confirmacao_old'
    end
    object qryRecebimentoslistacontratos: TStringField
      FieldName = 'listacontratos'
      Size = 50
    end
    object qryRecebimentosQuantidade: TIntegerField
      FieldName = 'Quantidade'
    end
    object qryRecebimentosListaOrcamentos: TStringField
      FieldName = 'ListaOrcamentos'
      Size = 50
    end
  end
  object dsrRecebimentos: TtecDataSource
    DataSet = qryRecebimentos
    OnDataChange = dsrRecebimentosDataChange
    Left = 108
    Top = 16
  end
  object qryTiposRecebimentos: TtecQuery
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
      'select selecao.*'
      'from'
      '('
      'select codigo,'
      '       descricao,'
      '       tiporecebimento'
      'from tiposrecebimentos'
      'where inativo is null'
      ''
      'union all'
      ''
      'select 0 as codigo,'
      '       '#39#39' as descricao,'
      '       '#39#39' as tiporecebimento'
      ') as selecao'
      'order by descricao')
    RequestLive = False
    Left = 68
    Top = 107
    object qryTiposRecebimentoscodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryTiposRecebimentosdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object qryTiposRecebimentostiporecebimento: TStringField
      FieldName = 'tiporecebimento'
      Size = 1
    end
  end
  object qrySituacaoRecebimentos: TtecQuery
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
      'select cast('#39'N'#39' as char(1)) as situacao,'
      '          cast('#39'N - NORMAL'#39' as varchar(15)) as descricao'
      'union all'
      'select cast('#39'C'#39' as char(1)) as situacao,'
      '          cast('#39'C - CANCELADO'#39' as varchar(15)) as descricao'
      '')
    RequestLive = False
    Left = 68
    Top = 155
    object qrySituacaoRecebimentossituacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
    object qrySituacaoRecebimentosdescricao: TStringField
      FieldName = 'descricao'
      Size = 15
    end
  end
  object qryTipoRecebimento: TtecQuery
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
      'select tr.codigo,'
      ''
      '       case when coalesce(tr.recebimento_antecipado, false) then'
      '         cast(1 as integer)'
      '       else tr.numerorecebimentos'
      '       end as numerorecebimentos,'
      '       '
      '       ctr.conta as conta_ctr,'
      '       ctr.evento as evento_ctr'
      ''
      ''
      'from tiposrecebimentos tr'
      '     left join contastiposrecebimentos ctr'
      '     on tr.codigo = ctr.tiporecebimento'
      '     and ctr.filial = :filialrecebimento'
      'where tr.codigo = :codigo'
      '/*  and coalesce(tr.numerorecebimentos,0)>=1 */')
    RequestLive = False
    Left = 232
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filialrecebimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
  end
  object qryAtualizarRecebimentos: TtecQuery
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
        Name = 'ListadeRecebimentos'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select r.*'
      'from recebimentos r'
      'where true'
      ' %ListadeRecebimentos'
      'order by r.controlerecebimento, r.controle')
    RequestLive = True
    Left = 80
    Top = 208
  end
  object qryMovtosBancos: TtecQuery
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
        Name = 'ListaMovtosBancos'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select mb.*'
      'from movtosbancos mb'
      'where (mb.conta, mb.data) in'
      '(%ListaMovtosBancos)'
      'and mb.origemlancto = '#39'X'#39)
    RequestLive = True
    Left = 384
    Top = 96
    object qryMovtosBancosconta: TIntegerField
      FieldName = 'conta'
    end
    object qryMovtosBancosdata: TDateField
      FieldName = 'data'
    end
    object qryMovtosBancossequencia: TIntegerField
      FieldName = 'sequencia'
    end
    object qryMovtosBancoscompensacao: TDateField
      FieldName = 'compensacao'
    end
    object qryMovtosBancosseqcompensacao: TIntegerField
      FieldName = 'seqcompensacao'
    end
    object qryMovtosBancosdataoriginal: TDateField
      FieldName = 'dataoriginal'
    end
    object qryMovtosBancosevento: TIntegerField
      FieldName = 'evento'
    end
    object qryMovtosBancostipo: TStringField
      FieldName = 'tipo'
      Size = 1
    end
    object qryMovtosBancosorigemlancto: TStringField
      FieldName = 'origemlancto'
      Size = 1
    end
    object qryMovtosBancosdocumento: TStringField
      FieldName = 'documento'
    end
    object qryMovtosBancosobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 512
    end
    object qryMovtosBancosvalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object qryMovtosBancosEventos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 'conta=conta;data=data;sequencia=sequencia'
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'Listamovtosbancos'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select mbe.*'
      'from movtosbancoseventos mbe'
      'where (mbe.conta, mbe.data, mbe.sequencia) in'
      '  (select mb.conta, mb.data, mb.sequencia'
      '   from movtosbancos mb'
      '   where (mb.conta, mb.data) in (%ListaMovtosBancos)'
      '   and mb.origemlancto = '#39'X'#39')'
      '')
    RequestLive = True
    Left = 504
    Top = 144
    object qryMovtosBancosEventosconta: TIntegerField
      FieldName = 'conta'
      DisplayFormat = '0'
    end
    object qryMovtosBancosEventosdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object qryMovtosBancosEventossequencia: TIntegerField
      FieldName = 'sequencia'
      DisplayFormat = '0'
    end
    object qryMovtosBancosEventosevento: TIntegerField
      FieldName = 'evento'
      DisplayFormat = '0'
    end
    object qryMovtosBancosEventostipo: TStringField
      FieldName = 'tipo'
      Size = 1
    end
    object qryMovtosBancosEventosvalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '###,###,##0.00'
    end
    object qryMovtosBancosEventoscontatransf: TIntegerField
      FieldName = 'contatransf'
      DisplayFormat = '0'
    end
    object qryMovtosBancosEventossequenciaorigem: TIntegerField
      FieldName = 'sequenciaorigem'
      DisplayFormat = '0'
    end
    object qryMovtosBancosEventosobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 512
    end
    object qryMovtosBancosEventossequenciaevento: TIntegerField
      FieldName = 'sequenciaevento'
      Required = True
    end
  end
  object qryMovtosBancosProximaSequencia: TtecQuery
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
      'SELECT MAX(Sequencia) as numero'
      '  FROM MovtosBancos'
      ' WHERE Conta = :ContaPagto'
      '   AND Data  = :DataPagto')
    RequestLive = False
    Left = 464
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ContaPagto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataPagto'
        ParamType = ptUnknown
      end>
    object qryMovtosBancosProximaSequencianumero: TIntegerField
      FieldName = 'numero'
    end
  end
  object qryMovtosBancosProximaSequenciaEvento: TtecQuery
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
      'SELECT MAX(SequenciaEvento) as numero'
      '  FROM MovtosBancosEventos'
      ' WHERE Conta = :ContaPagto'
      '   AND Data  = :DataPagto'
      '   and sequencia = :sequencia'
      '   and Evento = :Evento'
      '  ')
    RequestLive = False
    Left = 464
    Top = 276
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ContaPagto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataPagto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sequencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Evento'
        ParamType = ptUnknown
      end>
    object qryMovtosBancosProximaSequenciaEventonumero: TIntegerField
      FieldName = 'numero'
    end
  end
  object dsrMovtosBancos: TtecDataSource
    DataSet = qryMovtosBancos
    Left = 424
    Top = 112
  end
  object dsrMovtosBancosEventos: TtecDataSource
    DataSet = qryMovtosBancosEventos
    Left = 552
    Top = 160
  end
  object qryAutenticacoes: TtecQuery
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
      
        'select filial, contratoparcela, parcela, num_usu, cro, coo, num_' +
        'fab'
      'from autenticacoes'
      'where transacao = :transacao'
      '   and tipo<>'#39'H'#39)
    RequestLive = False
    Left = 336
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'transacao'
        ParamType = ptUnknown
      end>
    object qryAutenticacoescontratoparcela: TStringField
      FieldName = 'contratoparcela'
    end
    object qryAutenticacoesparcela: TIntegerField
      FieldName = 'parcela'
    end
    object qryAutenticacoesfilial: TIntegerField
      FieldName = 'filial'
    end
    object qryAutenticacoesnum_usu: TIntegerField
      FieldName = 'num_usu'
    end
    object qryAutenticacoescro: TIntegerField
      FieldName = 'cro'
    end
    object qryAutenticacoescoo: TIntegerField
      FieldName = 'coo'
    end
    object qryAutenticacoesnum_fab: TStringField
      FieldName = 'num_fab'
    end
  end
  object spcRecebimentosProximo: TtecQuery
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
      'Select recebimentos_proximocodigo() as codigo')
    RequestLive = False
    Left = 88
    Top = 320
    object spcRecebimentosProximocodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object qryDocumentosPag: TtecQuery
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
        DataType = ftString
        Name = 'ListaDocumentosPag'
        ParamType = ptUnknown
        Value = '0'
      end>
    Sql.Strings = (
      'SELECT dp.*'
      'FROM   documentospag dp'
      'WHERE  dp.numero in'
      '  (%ListaDocumentosPag)')
    RequestLive = True
    Left = 216
    Top = 200
    object qryDocumentosPagnumero: TIntegerField
      FieldName = 'numero'
      Required = True
    end
    object qryDocumentosPagfornecedor: TIntegerField
      FieldName = 'fornecedor'
      Required = True
    end
    object qryDocumentosPagemissao: TDateField
      FieldName = 'emissao'
      Required = True
    end
    object qryDocumentosPagcomplemento: TStringField
      FieldName = 'complemento'
      Size = 15
    end
    object qryDocumentosPagfilialemissao: TIntegerField
      FieldName = 'filialemissao'
      Required = True
    end
    object qryDocumentosPagpedido: TIntegerField
      FieldName = 'pedido'
    end
    object qryDocumentosPagprevisao: TBooleanField
      FieldName = 'previsao'
    end
    object qryDocumentosPagreferencia: TStringField
      FieldName = 'referencia'
      Size = 100
    end
    object qryDocumentosPagvalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '###,###,##0.00'
    end
    object qryDocumentosPagirretido: TFloatField
      FieldName = 'irretido'
      DisplayFormat = '###,###,##0.00'
    end
    object qryDocumentosPaginssretido: TFloatField
      FieldName = 'inssretido'
      DisplayFormat = '###,###,##0.00'
    end
    object qryDocumentosPagissretido: TFloatField
      FieldName = 'issretido'
      DisplayFormat = '###,###,##0.00'
    end
    object qryDocumentosPagcofinsretido: TFloatField
      FieldName = 'cofinsretido'
      DisplayFormat = '###,###,##0.00'
    end
    object qryDocumentosPagpisretido: TFloatField
      FieldName = 'pisretido'
      DisplayFormat = '###,###,##0.00'
    end
    object qryDocumentosPagcsllretido: TFloatField
      FieldName = 'csllretido'
      DisplayFormat = '###,###,##0.00'
    end
    object qryDocumentosPagtipofornecedor: TStringField
      FieldName = 'tipofornecedor'
      Required = True
      Size = 1
    end
    object qryDocumentosPagevento: TIntegerField
      FieldName = 'evento'
    end
    object qryDocumentosPagdatalancto: TDateField
      FieldName = 'datalancto'
    end
    object qryDocumentosPagcreditar: TIntegerField
      FieldName = 'creditar'
    end
    object qryDocumentosPaghistorico: TIntegerField
      FieldName = 'historico'
    end
    object qryDocumentosPagdocumentopagorigem: TIntegerField
      FieldName = 'documentopagorigem'
    end
    object qryDocumentosPagdatavenctoorigem: TDateField
      FieldName = 'datavenctoorigem'
    end
    object qryDocumentosPagnumeroorigem: TIntegerField
      FieldName = 'numeroorigem'
    end
    object qryDocumentosPagadministrador: TBooleanField
      FieldName = 'administrador'
      Required = True
    end
    object qryDocumentosPagfornecedorparaiss: TIntegerField
      FieldName = 'fornecedorparaiss'
    end
    object qryDocumentosPagfatogerador: TStringField
      FieldName = 'fatogerador'
      Size = 30
    end
    object qryDocumentosPagpiscofinscsllretido: TFloatField
      FieldName = 'piscofinscsllretido'
    end
    object qryDocumentosPagadiantamento: TBooleanField
      FieldName = 'adiantamento'
      Required = True
    end
    object qryDocumentosPagdebitar: TIntegerField
      FieldName = 'debitar'
    end
    object qryDocumentosPagtipopagamento: TIntegerField
      FieldName = 'tipopagamento'
    end
    object qryDocumentosPagcontapagto: TIntegerField
      FieldName = 'contapagto'
    end
    object qryDocumentosPagchequepagto: TIntegerField
      FieldName = 'chequepagto'
    end
    object qryDocumentosPagsequencia: TIntegerField
      FieldName = 'sequencia'
    end
    object qryDocumentosPagfilialcontabil: TIntegerField
      FieldName = 'filialcontabil'
    end
    object qryDocumentosPagpiscst: TStringField
      FieldName = 'piscst'
      Size = 2
    end
    object qryDocumentosPagpisbasecalculo: TFloatField
      FieldName = 'pisbasecalculo'
      DisplayFormat = '###,###,##0.00'
    end
    object qryDocumentosPagpisaliquota: TFloatField
      FieldName = 'pisaliquota'
    end
    object qryDocumentosPagpisvalor: TFloatField
      FieldName = 'pisvalor'
      DisplayFormat = '###,###,##0.00'
    end
    object qryDocumentosPagcofinscst: TStringField
      FieldName = 'cofinscst'
      Size = 2
    end
    object qryDocumentosPagcofinsbasecalculo: TFloatField
      FieldName = 'cofinsbasecalculo'
      DisplayFormat = '###,###,##0.00'
    end
    object qryDocumentosPagcofinsaliquota: TFloatField
      FieldName = 'cofinsaliquota'
    end
    object qryDocumentosPagcofinsvalor: TFloatField
      FieldName = 'cofinsvalor'
      DisplayFormat = '###,###,##0.00'
    end
    object qryDocumentosPagnat_bc_cred: TStringField
      FieldName = 'nat_bc_cred'
      Size = 2
    end
  end
  object qryDuplicatas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 'numero=documentopag'
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'ListaDuplicatas'
        ParamType = ptUnknown
        Value = 'null,null,null'
      end>
    Sql.Strings = (
      'select d.*'
      'FROM duplicatas d'
      'WHERE (d.documentopag, d.datavencto, d.numero) in'
      '(%ListaDuplicatas)')
    RequestLive = True
    Left = 216
    Top = 248
    object qryDuplicatasdocumentopag: TIntegerField
      FieldName = 'documentopag'
      Required = True
    end
    object qryDuplicatasnumero: TIntegerField
      FieldName = 'numero'
      Required = True
    end
    object qryDuplicatasdatavencto: TDateField
      FieldName = 'datavencto'
      Required = True
    end
    object qryDuplicatasvalorvencto: TFloatField
      FieldName = 'valorvencto'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryDuplicatasvalordesconto: TFloatField
      FieldName = 'valordesconto'
      DisplayFormat = '###,###,##0.00'
    end
    object qryDuplicatasjuros: TFloatField
      FieldName = 'juros'
      DisplayFormat = '###,###,##0.00'
    end
    object qryDuplicatastipojuros: TStringField
      FieldName = 'tipojuros'
      Required = True
      Size = 1
    end
    object qryDuplicatasmulta: TFloatField
      FieldName = 'multa'
      DisplayFormat = '###,###,##0.00'
    end
    object qryDuplicatastipomulta: TStringField
      FieldName = 'tipomulta'
      Required = True
      Size = 1
    end
    object qryDuplicatasobservacao: TStringField
      FieldName = 'observacao'
      Size = 512
    end
    object qryDuplicatasdatapagto: TDateField
      FieldName = 'datapagto'
    end
    object qryDuplicatasvalorpagto: TFloatField
      FieldName = 'valorpagto'
      DisplayFormat = '###,###,##0.00'
    end
    object qryDuplicataschequepagto: TIntegerField
      FieldName = 'chequepagto'
    end
    object qryDuplicatasbancocobranca: TIntegerField
      FieldName = 'bancocobranca'
    end
    object qryDuplicatascontacredito: TIntegerField
      FieldName = 'contacredito'
    end
    object qryDuplicatasautorizado: TBooleanField
      FieldName = 'autorizado'
      Required = True
    end
    object qryDuplicatasfilialpagto: TIntegerField
      FieldName = 'filialpagto'
    end
    object qryDuplicatasusuario: TIntegerField
      FieldName = 'usuario'
    end
    object qryDuplicatastipopagamento: TIntegerField
      FieldName = 'tipopagamento'
    end
    object qryDuplicatascontapagto: TIntegerField
      FieldName = 'contapagto'
    end
    object qryDuplicatassequencia: TIntegerField
      FieldName = 'sequencia'
    end
    object qryDuplicatasevento: TIntegerField
      FieldName = 'evento'
    end
    object qryDuplicatasdataautorizacaopagto: TDateField
      FieldName = 'dataautorizacaopagto'
    end
    object qryDuplicatasnrlotecontabil: TLargeintField
      FieldName = 'nrlotecontabil'
    end
    object qryDuplicatassequenciaevento: TIntegerField
      FieldName = 'sequenciaevento'
    end
  end
  object qryAtualizarRecebimentos_Aux: TtecQuery
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
        Name = 'ListadeRecebimentos'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select r.*'
      'from recebimentos r'
      'where true'
      ' %ListadeRecebimentos'
      'order by r.controlerecebimento, r.controle')
    RequestLive = True
    Left = 80
    Top = 264
  end
  object spcDocumentosPagProximo: TtecQuery
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
      'Select documentospag_proximonumero() as codigo')
    RequestLive = False
    Left = 134
    Top = 54
    object spcDocumentosPagProximocodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
end
