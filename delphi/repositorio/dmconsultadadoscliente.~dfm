inherited dtmConsultaDadosCliente: TdtmConsultaDadosCliente
  Left = 543
  Top = 117
  Height = 721
  Width = 1024
  object qryCartasCliente: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryCartasClienteAfterScroll
    OnCalcFields = qryCartasClienteCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      '('
      'select cc.carta,'
      '         cc.numero,'
      '         c.cliente,'
      '         c.tipocliente,'
      '         c.avalista,'
      '         cc.eavalista,'
      '         c.tipocarta, '
      '         tc.descricao,'
      '         cc.bloqueada,  '
      '         cast(cc.enviada as date) as enviada,'
      '         cc.voltou,'
      '         cc.confirmacao,'
      '         cast(cc.data as date) as data'
      'from ((cartas c join tiposcartas tc on c.tipocarta = tc.codigo)'
      
        '                    join cartasclientes cc on c.numero = cc.cart' +
        'a)           '
      'where c.cliente = :cliente and'
      '         c.tipocliente=:tipocliente and'
      '         not cc.eavalista /*and'
      
        '         exists (select p.cartacliente from parcelas p where p.c' +
        'artacliente = cc.carta and p.cartanumerocliente = cc.numero) */'
      ')'
      'union all'
      '('
      'select cc.carta,'
      '         cc.numero,'
      '         c.cliente,'
      '         c.tipocliente,'
      '         c.avalista,'
      '         cc.eavalista,'
      '         c.tipocarta,'
      '         tc.descricao,'
      '         cc.bloqueada,  '
      '         cast(cc.enviada as date) as enviada,'
      '         cc.voltou,'
      '         cc.confirmacao,'
      '         cast(cc.data as date) as data'
      'from ((cartas c join tiposcartas tc on c.tipocarta = tc.codigo)'
      
        '                    join cartasclientes cc on c.numero = cc.cart' +
        'a)           '
      'where c.avalista = :cliente and'
      '         '#39'C'#39'=:tipocliente and'
      '         cc.eavalista /*and'
      
        '         exists (select p.cartaavalista from parcelas p where p.' +
        'cartaavalista = cc.carta and p.cartanumeroavalista = cc.numero) ' +
        '*/'
      ') '
      'order by enviada desc')
    RequestLive = True
    Left = 222
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipocliente'
        ParamType = ptUnknown
      end>
    object qryCartasClientecliente: TIntegerField
      FieldName = 'cliente'
    end
    object qryCartasClientetipocliente: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
    object qryCartasClienteavalista: TIntegerField
      FieldName = 'avalista'
    end
    object qryCartasClienteeavalista: TBooleanField
      FieldName = 'eavalista'
    end
    object qryCartasClientetipocarta: TIntegerField
      FieldName = 'tipocarta'
    end
    object qryCartasClientedescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
    object qryCartasClientebloqueada: TStringField
      FieldName = 'bloqueada'
      Size = 3
    end
    object qryCartasClienteenviada: TDateTimeField
      FieldName = 'enviada'
    end
    object qryCartasClientevoltou: TDateField
      FieldName = 'voltou'
    end
    object qryCartasClienteconfirmacao: TDateField
      FieldName = 'confirmacao'
    end
    object qryCartasClientesituacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'situacao'
      Size = 40
      Calculated = True
    end
    object qryCartasClientedata: TDateTimeField
      FieldName = 'data'
    end
    object qryCartasClientecarta: TIntegerField
      FieldName = 'carta'
    end
    object qryCartasClientenumero: TIntegerField
      FieldName = 'numero'
    end
  end
  object qryAtendimentosCliente: TtecQuery
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
      'select atendimentos.data,'
      '       atendimentos.lembrar,'
      '       atendimentos.semspc,'
      '       atendimentos.semaviso,'
      '       atendimentos.informes'
      'from atendimentos'
      'where atendimentos.cliente = :cliente and'
      '          atendimentos.tipocliente = :tipocliente and'
      '      atendimentos.tipo = '#39'C'#39
      '      /*and atendimentos.lembrar is not null -- pq? (jr-20/08)*/'
      'order by atendimentos.data desc')
    RequestLive = True
    Left = 73
    Top = 113
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipocliente'
        ParamType = ptUnknown
      end>
    object qryAtendimentosClientedata: TDateField
      FieldName = 'data'
    end
    object qryAtendimentosClientelembrar: TDateField
      FieldName = 'lembrar'
      EditMask = '!99/99/0000;1;_'
    end
    object qryAtendimentosClientesemspc: TDateField
      FieldName = 'semspc'
      EditMask = '!99/99/0000;1;_'
    end
    object qryAtendimentosClientesemaviso: TDateField
      FieldName = 'semaviso'
      EditMask = '!99/99/0000;1;_'
    end
    object qryAtendimentosClienteinformes: TMemoField
      FieldName = 'informes'
      BlobType = ftMemo
    end
  end
  object qryCliente: TtecQuery
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
      'select vf.codigo,'
      '         coalesce(vf.razao,vf.nome) as nome,'
      '         c.nascto,'
      '         c.iddocumento,'
      '         vf.pessoatipo,'
      
        '         cast((case when vf.pessoatipo = '#39'F'#39' then '#39'CPF'#39' else '#39'CN' +
        'PJ'#39' end) as varchar) as nomepessoanumero,'
      '         formatar_cpf_cnpj(vf.pessoanumero) as pessoanumero,'
      '         c.sexo,'
      '         c.naturalcidade,'
      '         c.naturalestado,'
      '         vf.empresa,'
      '         vf.rua,'
      '         vf.numero,'
      '         vf.complemento,'
      '         vf.bairro,'
      '         vf.cidade,'
      '         vf.estado,'
      '         vf.cep,'
      '         vf.enderecoalterado,'
      '         vf.foneDDD,'
      '         vf.fonenumero,'
      '         vf.foneramal,'
      
        '       (select cidades.nome from cidades where cidades.estado = ' +
        'vf.estado and cidades.codigo = vf.cidade) as nomecidade,'
      
        '       (select bairros.nome from bairros where bairros.estado = ' +
        'vf.estado and bairros.cidade = vf.cidade and bairros.codigo = vf' +
        '.bairro) as nomebairro,'
      
        '       (select cidades.nome from cidades where cidades.estado = ' +
        'c.naturalestado and cidades.codigo = c.naturalcidade) as nomenat' +
        'uralcidade,'
      
        '       (select g.descricao from cargos g where g.codigo = c.empc' +
        'argo) as nomecargo'
      
        'from vfornecedores vf left join clientes c on vf.codigo=c.codigo' +
        ' and vf.tipo='#39'C'#39
      'where vf.codigo = :codigo and'
      '         vf.tipo = :tipocliente')
    RequestLive = True
    Left = 73
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipocliente'
        ParamType = ptUnknown
      end>
    object qryClientecodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryClientenome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryClientenascto: TDateField
      FieldName = 'nascto'
      EditMask = '!99/99/0000;1;_'
    end
    object qryClienteiddocumento: TStringField
      FieldName = 'iddocumento'
    end
    object qryClientenomepessoanumero: TStringField
      FieldName = 'nomepessoanumero'
      Size = 50
    end
    object qryClientepessoanumero: TStringField
      DisplayWidth = 18
      FieldName = 'pessoanumero'
      Size = 18
    end
    object qryClientesexo: TStringField
      FieldName = 'sexo'
      Size = 1
    end
    object qryClientenaturalcidade: TIntegerField
      FieldName = 'naturalcidade'
      DisplayFormat = '0'
    end
    object qryClientenaturalestado: TStringField
      FieldName = 'naturalestado'
      Size = 2
    end
    object qryClienteempresa: TStringField
      FieldName = 'empresa'
      Size = 40
    end
    object qryClienterua: TStringField
      FieldName = 'rua'
      Size = 100
    end
    object qryClientebairro: TIntegerField
      FieldName = 'bairro'
      DisplayFormat = '0'
    end
    object qryClientecidade: TIntegerField
      FieldName = 'cidade'
      DisplayFormat = '0'
    end
    object qryClienteestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object qryClientecep: TIntegerField
      FieldName = 'cep'
      DisplayFormat = '##'#39'.'#39'###'#39'-'#39'###;0;_'
      EditFormat = '##'#39'.'#39'###'#39'-'#39'###;0;_'
    end
    object qryClientenomecidade: TStringField
      FieldName = 'nomecidade'
      Size = 50
    end
    object qryClientenomebairro: TStringField
      FieldName = 'nomebairro'
      Size = 50
    end
    object qryClientenomenaturalcidade: TStringField
      FieldName = 'nomenaturalcidade'
      Size = 50
    end
    object qryClientepessoatipo: TStringField
      FieldName = 'pessoatipo'
      Size = 1
    end
    object qryClienteenderecoalterado: TDateField
      Alignment = taCenter
      FieldName = 'enderecoalterado'
      EditMask = '99/99/9999;1; '
    end
    object qryClientenomecargo: TStringField
      FieldName = 'nomecargo'
      Size = 50
    end
    object qryClientefoneddd: TIntegerField
      FieldName = 'foneddd'
      DisplayFormat = '0'
    end
    object qryClientefonenumero: TIntegerField
      FieldName = 'fonenumero'
      DisplayFormat = '0'
    end
    object qryClientefoneramal: TStringField
      FieldName = 'foneramal'
      Size = 50
    end
    object qryClientenumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryClientecomplemento: TStringField
      FieldName = 'complemento'
      Size = 100
    end
  end
  object dsrCliente: TtecDataSource
    DataSet = qryCliente
    OnDataChange = dsrClienteDataChange
    Left = 73
    Top = 62
  end
  object dsrCartasCliente: TtecDataSource
    DataSet = qryCartasCliente
    Left = 222
    Top = 62
  end
  object dsrAtendimentosCliente: TtecDataSource
    DataSet = qryAtendimentosCliente
    Left = 73
    Top = 166
  end
  object dsrSPCCliente: TtecDataSource
    DataSet = qrySPCCliente
    Left = 222
    Top = 166
  end
  object qryCheques: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryChequesAfterScroll
    OnFilterRecord = qryChequesFilterRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      '  Select numero,'
      '         data,'
      '         vencto,'
      '         valor,'
      '         titular,'
      '         filial,'
      '         situacao,'
      
        '         cast(situacao || '#39' - '#39' || cheques_situacaocheque(numero' +
        ') as varchar(50)) as nome_situacao,'
      ''
      
        '         case when situacao = '#39'D'#39' then valor else 0.00 end as Va' +
        'lorDevolvido,'
      
        '         case when vencto >= current_date then valor else 0.00 e' +
        'nd as ValoraVencer'
      ''
      '  From cheques'
      '  Where cliente = :cliente'
      '    and tipocliente = :tipocliente')
    RequestLive = False
    Left = 72
    Top = 224
    ParamData = <
      item
        DataType = ftString
        Name = 'Cliente'
        ParamType = ptUnknown
        Value = '100001'
      end
      item
        DataType = ftUnknown
        Name = 'tipocliente'
        ParamType = ptUnknown
      end>
    object qryChequesnumero: TStringField
      FieldName = 'numero'
      Required = True
      Size = 30
    end
    object qryChequesdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryChequesvencto: TDateField
      Alignment = taCenter
      FieldName = 'vencto'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryChequesvalor: TFloatField
      FieldName = 'valor'
      Required = True
      DisplayFormat = '##,###,###,##0.00'
    end
    object qryChequestitular: TStringField
      FieldName = 'titular'
      Required = True
      Size = 40
    end
    object qryChequesfilial: TIntegerField
      FieldName = 'filial'
      Required = True
      DisplayFormat = '00#'
    end
    object qryChequessituacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
    object qryChequesnome_situacao: TStringField
      FieldName = 'nome_situacao'
      Size = 50
    end
    object qryChequesvalordevolvido: TFloatField
      FieldName = 'valordevolvido'
    end
    object qryChequesvaloravencer: TFloatField
      FieldName = 'valoravencer'
    end
  end
  object dsrCheques: TtecDataSource
    DataSet = qryCheques
    Left = 222
    Top = 222
  end
  object qryParcelasCheques: TtecQuery
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
      'Select   cheque,'
      '             numero,'
      '             datavencto,'
      '             valorvencto,'
      '             datapagto,'
      '             valorpagto,'
      '             tipopagto'
      'From     parcelascheques'
      'Where   cheque =:cheque')
    RequestLive = False
    Left = 70
    Top = 288
    ParamData = <
      item
        DataType = ftString
        Name = 'cheque'
        ParamType = ptUnknown
      end>
    object qryParcelasChequescheque: TStringField
      FieldName = 'cheque'
      Size = 30
    end
    object qryParcelasChequesnumero: TIntegerField
      FieldName = 'numero'
    end
    object qryParcelasChequesdatavencto: TDateField
      FieldName = 'datavencto'
    end
    object qryParcelasChequesvalorvencto: TFloatField
      FieldName = 'valorvencto'
    end
    object qryParcelasChequesvalorpagto: TFloatField
      FieldName = 'valorpagto'
    end
    object qryParcelasChequestipopagto: TStringField
      FieldName = 'tipopagto'
      Size = 1
    end
    object qryParcelasChequesdatapagto: TDateField
      FieldName = 'datapagto'
    end
  end
  object dsrParcelasCheques: TtecDataSource
    DataSet = qryParcelasCheques
    Left = 222
    Top = 289
  end
  object qryParcelasCartas: TtecQuery
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
      '('
      '   select  pc.contratoparcela,  '
      '             p.parcelaorigem as parcela'
      
        '   from  (parcelascartas pc join parcelas p on pc.contratoparcel' +
        'a = p.contrato and'
      
        '                                                                ' +
        'pc.parcela = p.numero)'
      '   where pc.carta=:carta and'
      '            pc.cartanumero = :cartanumero  '
      ')'
      'union all'
      '('
      '   select  '
      '             p.contrato as contratoparcela,             '
      '             p.parcelaorigem as parcela'
      '   from  parcelas p'
      '   where  (p.cartacliente = :carta and '
      '              p.cartanumerocliente = :cartanumero ) or'
      '              (p.cartaavalista = :carta and '
      '              p.cartanumeroavalista = :cartanumero ) '
      ')'
      'order by contratoparcela, parcela')
    RequestLive = False
    Left = 328
    Top = 6
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'carta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cartanumero'
        ParamType = ptUnknown
      end>
    object qryParcelasCartascontratoparcela: TStringField
      FieldName = 'contratoparcela'
      Required = True
    end
    object qryParcelasCartasparcela: TStringField
      FieldName = 'parcela'
      Size = 7
    end
  end
  object dsrParcelasCartas: TtecDataSource
    DataSet = qryParcelasCartas
    Left = 334
    Top = 62
  end
  object qryCartasOcorrencia: TtecQuery
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
      'SELECT semaviso'
      'FROM atendimentos'
      'WHERE semaviso > cast(:datacarta as date) AND '
      '            tipo = '#39'C'#39' AND'
      '            NOT concluido AND'
      '            atendimentos.cliente = :cliente AND'
      '            atendimentos.tipocliente = :tipocliente '
      'ORDER BY data DESC LIMIT 1')
    RequestLive = False
    Left = 456
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'datacarta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipocliente'
        ParamType = ptUnknown
      end>
    object qryCartasOcorrenciasemaviso: TDateField
      Alignment = taCenter
      FieldName = 'semaviso'
      EditMask = '99/99/9999;1; '
    end
  end
  object qrySPCCliente: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qrySPCClienteAfterScroll
    OnCalcFields = qrySPCClienteCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      ';select registros_spc.*,'
      
        '      (select bloqueada from spc where spc.numero = registros_sp' +
        'c.spc) as bloqueada'
      'from'
      '('
      '('
      ' select inclusoes_spc.spc,'
      '        inclusoes_spc.carta,'
      #9'inclusoes_spc.cartanumero,'
      '       inclusoes_spc.datainclusao,'
      '       exclusoes_spc.dataexclusao,'
      '       inclusoes_spc.registrado,'
      ''
      '   coalesce(inclusoes_spc.valordebito, '
      '          (select sum(p.valorvencto) '
      '            from parcelas p '
      
        '            where p.spccliente = inclusoes_spc.spc))  as valorde' +
        'bito,'
      ''
      '       inclusoes_spc.datavencto,'
      '       false as eAvalista,'
      '       inclusoes_spc.data,'
      '       inclusoes_spc.cliente,'
      '       inclusoes_spc.tipocliente,'
      
        '       (select nome from clientes cl where cl.codigo = inclusoes' +
        '_spc.avalista) as nome_avalista_ou_avalizado'
      ''
      ' from'
      ' ('
      '  select srd.spc,'
      '       srd.carta,'
      '       srd.cartanumero,'
      '       coalesce(srd.dataspc,srd.dataempresa) as datainclusao,'
      '       srd.valordebito,'
      '       srd.datavencto,'
      '       cc.data,'
      '       c.cliente,'
      '       c.tipocliente,'
      '       c.avalista,'
      
        '       case when (srd.dataspc is not null) then true else false ' +
        'end as registrado'
      
        '  from (spcremessadados srd join (cartasclientes cc join cartas ' +
        'c on cc.carta = c.numero)'
      
        '                                                   on srd.carta ' +
        '= cc.carta and'
      
        '                                                   srd.cartanume' +
        'ro=cc.numero)'
      '  where srd.operacao = '#39'I'#39' and'
      '       c.cliente = :cliente and'
      '       c.tipocliente = :tipocliente and'
      '       not cc.eavalista'
      '  order by srd.spc,srd.carta,srd.cartanumero'
      ' ) as inclusoes_spc left join'
      ' ('
      '  select srd.spc,'
      '       srd.carta,'
      '       srd.cartanumero,'
      '       coalesce(srd.dataspc,srd.dataempresa) as dataexclusao'
      
        '  from (spcremessadados srd join (cartasclientes cc join cartas ' +
        'c on cc.carta = c.numero)'
      
        '                                                   on srd.carta ' +
        '= cc.carta and'
      
        '                                                   srd.cartanume' +
        'ro=cc.numero)'
      '  where srd.operacao = '#39'E'#39' and'
      '       c.cliente = :cliente and'
      '       c.tipocliente = :tipocliente and'
      '       not cc.eavalista'
      '  order by srd.spc,srd.carta,srd.cartanumero'
      ' ) as exclusoes_spc on inclusoes_spc.spc = exclusoes_spc.spc and'
      
        '                      inclusoes_spc.carta = exclusoes_spc.carta ' +
        'and'
      #9#9'      inclusoes_spc.cartanumero = exclusoes_spc.cartanumero'
      ')'
      'union all'
      '('
      ' select inclusoes_spc.spc,'
      '        inclusoes_spc.carta,'
      #9'inclusoes_spc.cartanumero,'
      '       inclusoes_spc.datainclusao,'
      '       exclusoes_spc.dataexclusao,'
      '       inclusoes_spc.registrado,'
      ''
      '   coalesce(inclusoes_spc.valordebito, '
      '          (select sum(p.valorvencto) '
      '            from parcelas p '
      
        '            where p.spcavalista = inclusoes_spc.spc)) as valorde' +
        'bito, '
      ''
      '       inclusoes_spc.datavencto,'
      '       true as eAvalista,'
      '       inclusoes_spc.data,'
      '       inclusoes_spc.cliente,'
      '       inclusoes_spc.tipocliente,'
      
        '       (select nome from clientes cl where cl.codigo = inclusoes' +
        '_spc.cliente) as nome_avalista_ou_avalizado'
      ' from'
      ' ('
      '  select srd.spc,'
      '       srd.carta,'
      '       srd.cartanumero,'
      '       coalesce(srd.dataspc,srd.dataempresa) as datainclusao,'
      '       srd.valordebito,'
      '       srd.datavencto,'
      '       cc.data,'
      '       c.cliente,'
      '       c.tipocliente,'
      '       c.avalista,'
      
        '       case when (srd.dataspc is not null) then true else false ' +
        'end as registrado'
      
        '  from (spcremessadados srd join (cartasclientes cc join cartas ' +
        'c on cc.carta = c.numero)'
      
        '                                                   on srd.carta ' +
        '= cc.carta and'
      
        '                                                   srd.cartanume' +
        'ro=cc.numero)'
      '  where srd.operacao = '#39'I'#39' and'
      '       c.avalista = :cliente and'
      '       c.tipocliente = :tipocliente and'
      '       cc.eavalista'
      '  order by srd.spc,srd.carta,srd.cartanumero'
      ' ) as inclusoes_spc left join'
      ' ('
      '  select srd.spc,'
      '       srd.carta,'
      '       srd.cartanumero,'
      '       coalesce(srd.dataspc,srd.dataempresa) as dataexclusao'
      
        '  from (spcremessadados srd join (cartasclientes cc join cartas ' +
        'c on cc.carta = c.numero)'
      
        '                                                   on srd.carta ' +
        '= cc.carta and'
      
        '                                                   srd.cartanume' +
        'ro=cc.numero)'
      '  where srd.operacao = '#39'E'#39' and'
      '       c.avalista = :cliente and'
      '       c.tipocliente = :tipocliente and'
      '       cc.eavalista'
      '  order by srd.spc,srd.carta,srd.cartanumero'
      ' ) as exclusoes_spc on inclusoes_spc.spc = exclusoes_spc.spc and'
      
        '                      inclusoes_spc.carta = exclusoes_spc.carta ' +
        'and'
      #9#9'      inclusoes_spc.cartanumero = exclusoes_spc.cartanumero'
      ')'
      ') as registros_spc'
      'order by dataexclusao desc, datainclusao desc')
    RequestLive = True
    Left = 222
    Top = 113
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipocliente'
        ParamType = ptUnknown
      end>
    object qrySPCClientespc: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'spc'
      DisplayFormat = '0'
    end
    object qrySPCClientedatainclusao: TDateTimeField
      DisplayLabel = 'Inclus'#227'o'
      FieldName = 'datainclusao'
    end
    object qrySPCClientedataexclusao: TDateTimeField
      DisplayLabel = 'Exclus'#227'o'
      FieldName = 'dataexclusao'
    end
    object qrySPCClienteregistrado: TBooleanField
      DisplayLabel = 'Registrado'
      FieldName = 'registrado'
    end
    object qrySPCClientevalordebito: TFloatField
      DisplayLabel = 'Valor D'#233'bito'
      FieldName = 'valordebito'
      DisplayFormat = '0.00'
    end
    object qrySPCClientedatavencto: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data Vencto'
      FieldName = 'datavencto'
      EditMask = '99/99/9999;1; '
    end
    object qrySPCClienteeavalista: TBooleanField
      DisplayLabel = 'Avalista'
      FieldName = 'eavalista'
    end
    object qrySPCClientedata: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'data'
    end
    object qrySPCClientecliente: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object qrySPCClientetipocliente: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
    object qrySPCClientenome_avalista_ou_avalizado: TStringField
      FieldName = 'nome_avalista_ou_avalizado'
      Size = 26
    end
    object qrySPCClientebloqueada: TStringField
      FieldName = 'bloqueada'
      Size = 50
    end
    object qrySPCClientesituacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'situacao'
      Size = 70
      Calculated = True
    end
    object qrySPCClientecarta: TIntegerField
      FieldName = 'carta'
    end
    object qrySPCClientecartanumero: TIntegerField
      FieldName = 'cartanumero'
    end
  end
  object qrySPCOcorrencia: TtecQuery
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
      'SELECT semspc'
      'FROM atendimentos'
      'WHERE semspc > cast(:datacarta as date) AND '
      '            tipo = '#39'C'#39' AND'
      '            NOT concluido AND'
      '            atendimentos.cliente = :cliente AND'
      '            atendimentos.tipocliente = :tipocliente '
      'ORDER BY data DESC LIMIT 1')
    RequestLive = False
    Left = 464
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'datacarta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipocliente'
        ParamType = ptUnknown
      end>
    object qrySPCOcorrenciasemspc: TDateField
      FieldName = 'semspc'
    end
  end
  object qryParcelasSPC: TtecQuery
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
      '('
      '   select  pc.contratoparcela,  '
      '             p.parcelaorigem as parcela'
      
        '   from  (parcelascartas pc join parcelas p on pc.contratoparcel' +
        'a = p.contrato and'
      
        '                                                                ' +
        'pc.parcela = p.numero)'
      '   where pc.carta=:carta and'
      '            pc.cartanumero = :cartanumero  '
      ')'
      'union all'
      '('
      '   select  '
      '             p.contrato as contratoparcela,             '
      '             p.parcelaorigem as parcela'
      '   from  parcelas p'
      '   where  (p.cartacliente = :carta and '
      '              p.cartanumerocliente = :cartanumero ) or'
      '              (p.cartaavalista = :carta and '
      '              p.cartanumeroavalista = :cartanumero ) '
      ')'
      'order by contratoparcela, parcela'
      '')
    RequestLive = False
    Left = 336
    Top = 110
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'carta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cartanumero'
        ParamType = ptUnknown
      end>
    object qryParcelasSPCcontratoparcela: TStringField
      FieldName = 'contratoparcela'
    end
    object qryParcelasSPCparcela: TStringField
      FieldName = 'parcela'
      Size = 7
    end
  end
  object dsrParcelasSPC: TtecDataSource
    DataSet = qryParcelasSPC
    Left = 334
    Top = 166
  end
  object qrySaldoAtual: TtecQuery
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
      'Select 0.00 as valor')
    RequestLive = True
    Left = 424
    Top = 272
    object qrySaldoAtualvalor: TFloatField
      FieldName = 'valor'
    end
  end
  object qryProdutosTrocados: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnCalcFields = qryProdutosTrocadosCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select '
      ' numero,'
      ' tipo,'
      ' data,'
      ' cliente,'
      ' tipocliente,'
      ' produto,'
      
        ' (select descricao from produtos where produtos.codigo = pt.prod' +
        'uto) as descricaoproduto, '
      ' filial,'
      ' contrato ,'
      ' filialsaida,'
      ' quantidade,'
      ' precotabela,'
      ' precoavaliado,'
      ' valor,'
      ' saldo,'
      ' novocontrato,'
      ' defeito,'
      ' usuario,'
      ' usuarioautorizacao,'
      ' evento,'
      ' referencia'
      ' from '
      'produtostrocados pt'
      'where pt.cliente = :cliente and'
      '          pt.tipocliente = :tipocliente'
      'order by pt.numero,pt.data,pt.tipo')
    RequestLive = True
    Left = 56
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipocliente'
        ParamType = ptUnknown
      end>
    object qryProdutosTrocadosnumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryProdutosTrocadostipo: TStringField
      FieldName = 'tipo'
      Required = True
      Size = 1
    end
    object qryProdutosTrocadosdata: TDateTimeField
      FieldName = 'data'
      DisplayFormat = 'dd/mm/yy hh:mm'
    end
    object qryProdutosTrocadoscliente: TIntegerField
      FieldName = 'cliente'
      Required = True
      DisplayFormat = '0'
    end
    object qryProdutosTrocadostipocliente: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
    object qryProdutosTrocadosproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryProdutosTrocadosfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryProdutosTrocadoscontrato: TStringField
      FieldName = 'contrato'
    end
    object qryProdutosTrocadosfilialsaida: TIntegerField
      FieldName = 'filialsaida'
      DisplayFormat = '0'
    end
    object qryProdutosTrocadosquantidade: TFloatField
      FieldName = 'quantidade'
      DisplayFormat = '0.00'
    end
    object qryProdutosTrocadosprecotabela: TFloatField
      FieldName = 'precotabela'
      DisplayFormat = '0.00'
    end
    object qryProdutosTrocadosprecoavaliado: TFloatField
      FieldName = 'precoavaliado'
      DisplayFormat = '0.00'
    end
    object qryProdutosTrocadosvalor: TFloatField
      FieldName = 'valor'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryProdutosTrocadossaldo: TFloatField
      FieldName = 'saldo'
      DisplayFormat = '0.00'
    end
    object qryProdutosTrocadosnovocontrato: TStringField
      FieldName = 'novocontrato'
    end
    object qryProdutosTrocadosdefeito: TBooleanField
      FieldName = 'defeito'
    end
    object qryProdutosTrocadosusuario: TIntegerField
      FieldName = 'usuario'
      DisplayFormat = '0'
    end
    object qryProdutosTrocadosreferencia: TStringField
      FieldName = 'referencia'
      Size = 100
    end
    object qryProdutosTrocadosevento: TIntegerField
      FieldName = 'evento'
      DisplayFormat = '0'
    end
    object qryProdutosTrocadosDescricao: TStringField
      FieldKind = fkCalculated
      FieldName = 'Descricao'
      Size = 100
      Calculated = True
    end
    object qryProdutosTrocadosdescricaoproduto: TStringField
      FieldName = 'descricaoproduto'
      Size = 50
    end
    object qryProdutosTrocadosusuarioautorizacao: TIntegerField
      FieldName = 'usuarioautorizacao'
    end
  end
  object dsrProdutosTrocados: TtecDataSource
    DataSet = qryProdutosTrocados
    OnDataChange = dsrProdutosTrocadosDataChange
    Left = 96
    Top = 376
  end
  object spcProdutosTrocadosProximo: TtecQuery
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
      'select produtostrocados_proximocodigo() as numero')
    RequestLive = False
    Left = 268
    Top = 366
    object spcProdutosTrocadosProximonumero: TIntegerField
      FieldName = 'numero'
    end
  end
  object qryProcuraEventos: TtecQuery
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
      'select eventos.codigo,'
      '         eventos.descricao,'
      '         eventos.TipoMovimentacao,'
      
        '         case when eventos.TipoMovimentacao in ('#39'S'#39','#39'T'#39') then '#39'S' +
        'aida'#39' else '
      '         '#39'Entrada'#39' end as tipodocumento '
      ''
      'from eventos'
      'where eventos.codigo = :codigo and'
      '          ((eventos.inativo is null) or '
      '          (eventos.inativo>current_date)) and'
      '          eventos.saldocliente'
      '')
    RequestLive = False
    Left = 472
    Top = 346
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraEventoscodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryProcuraEventosdescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
    object qryProcuraEventostipodocumento: TMemoField
      FieldName = 'tipodocumento'
      BlobType = ftMemo
    end
    object qryProcuraEventostipomovimentacao: TStringField
      DisplayLabel = 'T'
      FieldName = 'tipomovimentacao'
      Size = 1
    end
  end
  object dsrProcuraEventos: TtecDataSource
    DataSet = qryProcuraEventos
    Left = 504
    Top = 360
  end
  object qryConsultaEventos: TtecQuery
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
      'select eventos.descricao,'
      '         eventos.codigo,'
      
        '         cast(case when eventos.TipoMovimentacao in ('#39'S'#39','#39'T'#39') th' +
        'en '#39'Sim'#39' else '#39'N'#227'o'#39' end as varchar) as ssaida '
      'from eventos'
      'Where  ((eventos.inativo is null) or '
      '          (eventos.inativo>current_date)) and'
      '          eventos.saldocliente'
      'order by UPPER(TO_ASCII(eventos.descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 531
    Top = 371
    object qryConsultaEventosdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
    object qryConsultaEventoscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryConsultaEventosssaida: TStringField
      Alignment = taCenter
      DisplayLabel = 'Sa'#237'da de Cr'#233'dito'
      FieldName = 'ssaida'
      Size = 3
    end
  end
  object dsrSaldoAtual: TtecDataSource
    DataSet = qrySaldoAtual
    Left = 448
    Top = 288
  end
  object qryLimitesCredito: TtecQuery
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
      'select campo[36] as RendaCliente,'
      '       cast(campo[37] as integer) as RendaBaseConjuge,'
      '       campo[38] as RendaConjuge,'
      '       campo[39] as OutrasRendas,'
      '       campo[40] as Onus,'
      '       campo[41] as TotalRenda,'
      '       cast(campo[42] as integer) as Pontos,'
      '       cast(campo[43] as integer) as BasePontos,'
      '       campo[44] as Disponivel,'
      '       campo[45] as LimiteTotal,'
      '       campo[46] as PorParcela,'
      '       campo[47] as AtrasoMedio,'
      ''
      '       CAST(Campo[48] AS INTEGER) AS MaiorAtraso,'
      '            Campo[49]             AS ValorMaiorAtraso,'
      ''
      '       CASE CAST(Campo[50] AS INTEGER)'
      '            WHEN 0 THEN NULL'
      '            ELSE CAST(TO_CHAR('
      
        '                 CAST(Campo[50] AS INTEGER), '#39'00/00/0000'#39') AS VA' +
        'RCHAR)'
      '       END                        AS DataMaiorAtraso,'
      ''
      '       CAST(Campo[51] AS INTEGER) AS AtrasoHoje,'
      '       CAST(Campo[52] AS INTEGER) AS UltimoAtraso,'
      '            Campo[53]             AS ValorUltimoAtraso,'
      ''
      '       CASE CAST(Campo[54] AS INTEGER)'
      '            WHEN 0 THEN NULL'
      '            ELSE CAST(TO_CHAR('
      
        '                 CAST(Campo[54] AS INTEGER), '#39'00/00/0000'#39') AS VA' +
        'RCHAR)'
      '       END                        AS DataUltimoAtraso,'
      '            Campo[55]             AS Ate30DiasEmAtraso,'
      '            Campo[56]             AS De31DiasEmAtraso,'
      '            Campo[57]             AS Mais60DiasEmAtraso,'
      '            Campo[58]             AS Ate30DiasAVencer,'
      '            Campo[59]             AS De31DiasAVencer,'
      '            Campo[60]             AS Mais60DiasAVencer,'
      '            Campo[61]             AS C61,'
      ''
      '       CAST(Campo[55] AS NUMERIC) +'
      '       CAST(Campo[56] AS NUMERIC) +'
      '       CAST(Campo[57] AS NUMERIC) AS TotalEmAtraso,'
      ''
      '       CAST(Campo[58] AS NUMERIC) +'
      '       CAST(Campo[59] AS NUMERIC) +'
      '       CAST(Campo[60] AS NUMERIC) AS TotalAVencer,'
      ''
      '       CAST(Campo[55] AS NUMERIC) +'
      '       CAST(Campo[56] AS NUMERIC) +'
      '       CAST(Campo[57] AS NUMERIC) +'
      '       CAST(Campo[58] AS NUMERIC) +'
      '       CAST(Campo[59] AS NUMERIC) +'
      '       CAST(Campo[60] AS NUMERIC) AS TotalEmAberto'
      ''
      
        'from (select (credito_calculodolimite(:Cliente,:Tipo,:ValorNota,' +
        ':Emissao)'
      '             ) as campo'
      '     ) as temp;')
    RequestLive = False
    Left = 336
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ValorNota'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Emissao'
        ParamType = ptUnknown
      end>
    object qryLimitesCreditorendacliente: TFloatField
      FieldName = 'rendacliente'
      DisplayFormat = '0.00'
    end
    object qryLimitesCreditorendabaseconjuge: TIntegerField
      FieldName = 'rendabaseconjuge'
      DisplayFormat = '0'
    end
    object qryLimitesCreditorendaconjuge: TFloatField
      FieldName = 'rendaconjuge'
      DisplayFormat = '0.00'
    end
    object qryLimitesCreditooutrasrendas: TFloatField
      FieldName = 'outrasrendas'
      DisplayFormat = '0.00'
    end
    object qryLimitesCreditoonus: TFloatField
      FieldName = 'onus'
      DisplayFormat = '0.00'
    end
    object qryLimitesCreditototalrenda: TFloatField
      FieldName = 'totalrenda'
      DisplayFormat = '0.00'
    end
    object qryLimitesCreditopontos: TIntegerField
      FieldName = 'pontos'
      DisplayFormat = '0'
    end
    object qryLimitesCreditobasepontos: TIntegerField
      FieldName = 'basepontos'
      DisplayFormat = '0'
    end
    object qryLimitesCreditodisponivel: TFloatField
      FieldName = 'disponivel'
      DisplayFormat = '0.00'
    end
    object qryLimitesCreditolimitetotal: TFloatField
      FieldName = 'limitetotal'
      DisplayFormat = '0.00'
    end
    object qryLimitesCreditoporparcela: TFloatField
      FieldName = 'porparcela'
      DisplayFormat = '0.00'
    end
    object qryLimitesCreditoatrasomedio: TFloatField
      FieldName = 'atrasomedio'
    end
    object qryLimitesCreditomaioratraso: TIntegerField
      FieldName = 'maioratraso'
    end
    object qryLimitesCreditovalormaioratraso: TFloatField
      FieldName = 'valormaioratraso'
    end
    object qryLimitesCreditodatamaioratraso: TStringField
      FieldName = 'datamaioratraso'
      Size = 50
    end
    object qryLimitesCreditoatrasohoje: TIntegerField
      FieldName = 'atrasohoje'
    end
    object qryLimitesCreditoultimoatraso: TIntegerField
      FieldName = 'ultimoatraso'
    end
    object qryLimitesCreditovalorultimoatraso: TFloatField
      FieldName = 'valorultimoatraso'
    end
    object qryLimitesCreditodataultimoatraso: TStringField
      FieldName = 'dataultimoatraso'
      Size = 50
    end
    object qryLimitesCreditoate30diasematraso: TFloatField
      FieldName = 'ate30diasematraso'
    end
    object qryLimitesCreditode31diasematraso: TFloatField
      FieldName = 'de31diasematraso'
    end
    object qryLimitesCreditomais60diasematraso: TFloatField
      FieldName = 'mais60diasematraso'
    end
    object qryLimitesCreditoate30diasavencer: TFloatField
      FieldName = 'ate30diasavencer'
    end
    object qryLimitesCreditode31diasavencer: TFloatField
      FieldName = 'de31diasavencer'
    end
    object qryLimitesCreditomais60diasavencer: TFloatField
      FieldName = 'mais60diasavencer'
    end
    object qryLimitesCreditoc61: TFloatField
      FieldName = 'c61'
    end
    object qryLimitesCreditototalematraso: TFloatField
      FieldName = 'totalematraso'
    end
    object qryLimitesCreditototalavencer: TFloatField
      FieldName = 'totalavencer'
    end
    object qryLimitesCreditototalemaberto: TFloatField
      FieldName = 'totalemaberto'
    end
  end
  object dsrLimitesCredito: TtecDataSource
    DataSet = qryLimitesCredito
    Left = 336
    Top = 288
  end
  object cdsChequesDevolvidos_aVencer: TClientDataSet
    Aggregates = <
      item
        Visible = False
      end>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspChequesDevolvidos_aVencer'
    Left = 496
    Top = 168
    object cdsChequesDevolvidos_aVencerTotalDevolvido: TAggregateField
      FieldName = 'TotalDevolvido'
      Active = True
      DisplayFormat = '###,##0.00'
      Expression = 'sum(ValorDevolvido)'
    end
    object cdsChequesDevolvidos_aVencerTotalaVencer: TAggregateField
      FieldName = 'TotalaVencer'
      Active = True
      DisplayFormat = '###,##0.00'
      Expression = 'sum(ValoraVencer)'
    end
  end
  object dspChequesDevolvidos_aVencer: TDataSetProvider
    DataSet = qryCheques
    Left = 608
    Top = 184
  end
  object qrycashback_saldos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qrycashback_saldosAfterOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select cb_s.*, cb.descricao, p.codigovisual,'
      '       cb_s2.usuarioautorizacao,'
      '       cb_s2.referencia,'
      ''
      '       case when cb_s.valor >= 0 then cast('#39'E'#39' as char(1)) else'
      
        '                                      cast('#39'S'#39' as char(1)) end a' +
        's tipo,'
      '       cb_s.saldofinal as saldofinalcalc'
      ''
      'from getcashback_saldos(cast(:cliente as integer),'
      '                        cast(:tipocliente as char(1)) ) cb_s'
      '     left join cashback cb'
      '     on cb.codigo = cb_s.cashback'
      ''
      '     left join produtos p'
      '     on cb_s.produto = p.codigo'
      ''
      ''
      '     join cashback_saldos cb_s2'
      '     on cb_s2.codigo = cb_s.codigo')
    RequestLive = True
    Left = 56
    Top = 432
    ParamData = <
      item
        DataType = ftString
        Name = 'cliente'
        ParamType = ptUnknown
        Value = '52850'
      end
      item
        DataType = ftString
        Name = 'tipocliente'
        ParamType = ptUnknown
        Value = 'C'
      end>
    object qrycashback_saldoscodigo: TIntegerField
      DisplayLabel = 'N'#176
      FieldName = 'codigo'
    end
    object qrycashback_saldoscashback: TIntegerField
      DisplayLabel = 'Cashback'
      FieldName = 'cashback'
      Required = True
    end
    object qrycashback_saldosdata_hora: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data/Hora Refer'#234'ncia'
      FieldName = 'data_hora'
      Required = True
      DisplayFormat = 'dd/MM/yy hh:mm:ss'
      EditMask = '99/99/99 99:99:99;1; '
    end
    object qrycashback_saldosdata_hora_lancamento: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data/Hora Lan'#231'amento'
      FieldName = 'data_hora_lancamento'
      Required = True
      DisplayFormat = 'dd/MM/yy hh:mm:ss'
      EditMask = '99/99/99 99:99:99;1; '
    end
    object qrycashback_saldosdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o do CashBack'
      FieldName = 'descricao'
      Size = 100
    end
    object qrycashback_saldoscliente: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'cliente'
      Required = True
    end
    object qrycashback_saldostipo_cliente: TStringField
      DisplayLabel = 'Tipo Cliente'
      DisplayWidth = 1
      FieldName = 'tipo_cliente'
      Required = True
      Size = 50
    end
    object qrycashback_saldosvalor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'valor'
      Required = True
      DisplayFormat = '0.00'
    end
    object qrycashback_saldosvalidade: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Validade'
      FieldName = 'validade'
      Required = True
      DisplayFormat = 'dd/MM/yy hh:mm'
      EditMask = '99/99/99 99:99;1; '
    end
    object qrycashback_saldosdisponibilidade: TDateField
      DisplayLabel = 'Disponibilidade'
      FieldName = 'disponibilidade'
      DisplayFormat = 'dd/MM/yy'
      EditMask = '99/99/99;1; '
    end
    object qrycashback_saldosstatus: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 16
      FieldName = 'status'
      Size = 50
    end
    object qrycashback_saldoscontrato: TStringField
      DisplayWidth = 6
      FieldName = 'contrato'
      Size = 50
    end
    object qrycashback_saldosparcela: TIntegerField
      FieldName = 'parcela'
    end
    object qrycashback_saldossaldo: TFloatField
      FieldName = 'saldo'
      DisplayFormat = '0.00'
    end
    object qrycashback_saldossaldofinal: TFloatField
      FieldName = 'saldofinal'
      DisplayFormat = '0.00'
    end
    object qrycashback_saldosproduto: TLargeintField
      DisplayLabel = 'Produto'
      FieldName = 'produto'
      ReadOnly = True
    end
    object qrycashback_saldoscancelamento: TIntegerField
      FieldName = 'cancelamento'
    end
    object qrycashback_saldoscodigovisual: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'codigovisual'
      Required = True
      Size = 30
    end
    object qrycashback_saldosusuarioautorizacao: TIntegerField
      DisplayLabel = 'Usu'#225'rio Autoriza'#231#227'o'
      FieldName = 'usuarioautorizacao'
      Required = True
    end
    object qrycashback_saldosreferencia: TStringField
      DisplayLabel = 'Referencia'
      FieldName = 'referencia'
      Size = 100
    end
    object qrycashback_saldostipo: TStringField
      FieldName = 'tipo'
      Size = 1
    end
    object qrycashback_saldossaldofinalcalc: TFloatField
      FieldName = 'saldofinalcalc'
      DisplayFormat = '0.00'
    end
  end
  object dsrcashback_saldos: TtecDataSource
    DataSet = qrycashback_saldos
    OnDataChange = dsrcashback_saldosDataChange
    Left = 112
    Top = 448
  end
  object qrycashback_saldosProximo: TtecQuery
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
      'select nextval('#39'cashback_saldos_proximocodigo'#39') as codigo')
    RequestLive = False
    Left = 256
    Top = 440
    object qrycashback_saldosProximocodigo: TLargeintField
      FieldName = 'codigo'
    end
  end
  object qryIncluirCashBack: TtecQuery
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
      '          insert into cashback_saldos'
      ''
      '          ('
      '              codigo,'
      '              data_hora,'
      '              data_hora_lancamento,'
      '              cliente,'
      '              tipo_cliente,'
      '              status,'
      '              contrato,'
      '              parcela,'
      '              cancelamento,'
      '              codigo_apropriacao_devolvida,'
      '              usuarioautorizacao,'
      '              referencia'
      ''
      '            )'
      ''
      '          values'
      ''
      '          ('
      ''
      '              :codigo,'
      '              :data_hora,'
      '              :data_hora,'
      '              :cliente,'
      '              :tipo_cliente,'
      '              :status,'
      '              :contrato,'
      '              :parcela,'
      '              :cancelamento,'
      '              :codigo_apropriacao_devolvida,'
      '              :usuarioautorizacao,'
      '              :referencia'
      ''
      '          );'
      ''
      '          insert into cashback_saldos_produtos ('
      ''
      '              codigo_saldo,'
      '              codigo_saldo_origem,'
      '              cashback,'
      '              validade,'
      '              produto,'
      '              quantidade,'
      '              valor'
      ''
      '            )'
      ''
      '          values'
      ''
      '          ('
      ''
      '              :codigo_saldo,'
      '              :codigo_saldo_origem,'
      '              :cashback,'
      '              :validade,'
      '              :produto,'
      '              :quantidade,'
      '              :valor'
      ''
      '          );'
      ''
      ''
      ''
      '')
    RequestLive = True
    Left = 368
    Top = 464
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'data_hora'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipo_cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cancelamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigo_apropriacao_devolvida'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'usuarioautorizacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'referencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigo_saldo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigo_saldo_origem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cashback'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'validade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'quantidade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'valor'
        ParamType = ptUnknown
      end>
  end
end
