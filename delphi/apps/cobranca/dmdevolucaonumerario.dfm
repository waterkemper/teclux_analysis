inherited dtmDevolucaoNumerario: TdtmDevolucaoNumerario
  Left = 372
  Top = 175
  Height = 404
  Width = 650
  object qryContratos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryContratosAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select contratos.numero,'
      '       contratos.cliente,'
      '       contratos.filialvenda,'
      '       contratos.agente,'
      '       contratos.avalista,'
      '       contratos.vendedor,'
      '       contratos.analista,'
      '       contratos.valorvista,'
      '       contratos.valorprazo,'
      '       contratos.origem,'
      '       cast((case when contratos.situacao = '#39'F'#39' then '#39'FATURADO'#39
      
        '                        when contratos.situacao = '#39'N'#39' then '#39'NOTA' +
        ' FISCAL'#39
      '    '#9'          when contratos.situacao = '#39'P'#39' then '#39'NOTA PARCIAL'#39
      '                end) as varchar) as descricaosituacao,'
      
        '       (select contratos.numero  from contratos where contratos.' +
        'origem = cast(:contrato as varchar))           as novocontrato,'
      
        '       (select clientes.nome     from clientes  where clientes.c' +
        'odigo = contratos.avalista)   as nomeavalista,'
      
        '       (select usuarios.nome     from usuarios  where usuarios.c' +
        'odigo = contratos.vendedor)   as nomevendedor,'
      
        '       (select usuarios.nome     from usuarios  where usuarios.c' +
        'odigo = contratos.analista)   as nomeanalista,'
      
        '       (select filiais.nome      from filiais   where filiais.co' +
        'digo = contratos.filialvenda) as nomefilialvenda,'
      
        '       (select agentes.descricao from agentes   where agentes.co' +
        'digo = contratos.agente)      as descricaoagente'
      'from contratos'
      'where contratos.numero = cast(:contrato as varchar)')
    RequestLive = False
    Left = 64
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'contrato'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryContratosnumero: TStringField
      FieldName = 'numero'
    end
    object qryContratoscliente: TIntegerField
      FieldName = 'cliente'
      Required = True
      DisplayFormat = '0'
    end
    object qryContratosfilialvenda: TIntegerField
      FieldName = 'filialvenda'
      Required = True
      DisplayFormat = '0'
    end
    object qryContratosagente: TIntegerField
      FieldName = 'agente'
      Required = True
      DisplayFormat = '0'
    end
    object qryContratosavalista: TIntegerField
      FieldName = 'avalista'
      DisplayFormat = '0'
    end
    object qryContratosvendedor: TIntegerField
      FieldName = 'vendedor'
      Required = True
      DisplayFormat = '0'
    end
    object qryContratosanalista: TIntegerField
      FieldName = 'analista'
      DisplayFormat = '0'
    end
    object qryContratosvalorvista: TFloatField
      FieldName = 'valorvista'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryContratosvalorprazo: TFloatField
      FieldName = 'valorprazo'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryContratosorigem: TStringField
      FieldName = 'origem'
    end
    object qryContratosdescricaosituacao: TStringField
      FieldName = 'descricaosituacao'
      Size = 50
    end
    object qryContratosnovocontrato: TStringField
      FieldName = 'novocontrato'
      Size = 50
    end
    object qryContratosnomeavalista: TStringField
      FieldName = 'nomeavalista'
      Size = 50
    end
    object qryContratosnomevendedor: TStringField
      FieldName = 'nomevendedor'
      Size = 50
    end
    object qryContratosnomeanalista: TStringField
      FieldName = 'nomeanalista'
      Size = 50
    end
    object qryContratosnomefilialvenda: TStringField
      FieldName = 'nomefilialvenda'
      Size = 50
    end
    object qryContratosdescricaoagente: TStringField
      FieldName = 'descricaoagente'
      Size = 50
    end
  end
  object dsrContratos: TtecDataSource
    DataSet = qryContratos
    Left = 217
    Top = 128
  end
  object qryParcelasContrato: TtecQuery
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
      'select parcelas.contrato,'
      '       parcelas.numero,'
      
        '/*       case when parcelas.parcelaadicional then cast(cast('#39'A'#39' ' +
        'as varchar)||cast(parcelas.parcelaorigem as varchar) as varchar)' +
        ' else parcelas.parcelaorigem end as parcelaorigem, */'
      '       parcelas.parcelaorigem,'
      '       parcelas.datavencto,'
      '       parcelas.valorvencto,'
      '       parcelas.filialpagto,'
      '       parcelas.datapagto,'
      '       parcelas.valorpagto,'
      
        '/*       case when parcelas.pagamentoextracaixa then cast(cast('#39 +
        'B'#39' as varchar)||cast(parcelas.tipopagto as varchar) as varchar) ' +
        'else parcelas.tipopagto end as tipopagto, */'
      '       parcelas.tipopagto, '
      '       parcelas.deventrada,'
      '       parcelas.devcaixa,'
      '       parcelas.incobravel,'
      '       parcelas.origempagto,'
      '       parcelas.copiapagto,'
      
        '       ((parcelas.datapagto is not null) and (parcelas.tipopagto' +
        ' is null or parcelas.pagamentoextracaixa)) as autorizavel'
      'from parcelas'
      'where parcelas.contrato = :contrato'
      'order by parcelas.datavencto')
    RequestLive = True
    Left = 64
    Top = 189
    ParamData = <
      item
        DataType = ftString
        Name = 'contrato'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryParcelasContratocontrato: TStringField
      FieldName = 'contrato'
    end
    object qryParcelasContratonumero: TIntegerField
      FieldName = 'numero'
      Required = True
      DisplayFormat = '0'
    end
    object qryParcelasContratodatavencto: TDateField
      Alignment = taCenter
      FieldName = 'datavencto'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasContratovalorvencto: TFloatField
      FieldName = 'valorvencto'
      Required = True
      DisplayFormat = '###,##0.00'
    end
    object qryParcelasContratofilialpagto: TIntegerField
      FieldName = 'filialpagto'
      DisplayFormat = '0'
    end
    object qryParcelasContratodatapagto: TDateField
      Alignment = taCenter
      FieldName = 'datapagto'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasContratovalorpagto: TFloatField
      FieldName = 'valorpagto'
      DisplayFormat = '###,##0.00'
    end
    object qryParcelasContratodeventrada: TDateField
      Alignment = taCenter
      FieldName = 'deventrada'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasContratodevcaixa: TDateField
      Alignment = taCenter
      FieldName = 'devcaixa'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasContratoincobravel: TDateField
      Alignment = taCenter
      FieldName = 'incobravel'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasContratoautorizavel: TBooleanField
      FieldName = 'autorizavel'
    end
    object qryParcelasContratoorigempagto: TIntegerField
      FieldName = 'origempagto'
      DisplayFormat = '0'
    end
    object qryParcelasContratocopiapagto: TIntegerField
      FieldName = 'copiapagto'
      DisplayFormat = '0'
    end
    object qryParcelasContratoparcelaorigem: TStringField
      FieldName = 'parcelaorigem'
      Required = True
      Size = 7
    end
    object qryParcelasContratotipopagto: TStringField
      FieldName = 'tipopagto'
      Size = 50
    end
  end
  object dsrParcelasContrato: TtecDataSource
    DataSet = qryParcelasContrato
    Left = 217
    Top = 189
  end
  object qryClientes: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryClientesAfterOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'Select  coalesce(v.razao,v.nome) as nome,'
      '            v.codigo as codigo,'
      '            v.tipo as tipo, '
      '            formatar_cpf_cnpj(v.pessoanumero) as pessoanumero,'
      '            descricao_tipocliente(v.tipo) as tipocliente, '
      '            v.estado as estado,'
      '            c.nome as nomecidade'
      'From    vfornecedores v, cidades c'
      'WHERE'
      '   (v.estado = c.estado)'
      '   and (v.cidade = c.codigo)'
      'and '
      'v.codigo=:codigocliente and'
      'v.tipo=:tipocliente'
      'Order By UPPER(TO_ASCII(coalesce(v.razao,v.nome),'#39'LATIN1'#39'))')
    RequestLive = True
    Left = 64
    Top = 12
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigocliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'tipocliente'
        ParamType = ptInput
      end>
    object qryClientesnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryClientescodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryClientestipo: TStringField
      FieldName = 'tipo'
      Size = 1
    end
    object qryClientespessoanumero: TStringField
      FieldName = 'pessoanumero'
      Size = 50
    end
    object qryClientestipocliente: TStringField
      FieldName = 'tipocliente'
      Size = 50
    end
    object qryClientesestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object qryClientesnomecidade: TStringField
      FieldName = 'nomecidade'
      Size = 80
    end
  end
  object dsrClientes: TtecDataSource
    DataSet = qryClientes
    Left = 217
    Top = 12
  end
  object qryContratosPorCliente: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryContratosPorClienteAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'Select numero as numero'
      'From   contratos'
      'Where (situacao in ('#39'F'#39','#39'N'#39','#39'P'#39')) and'
      '              (not contratos_renegociado(numero)) and'
      '              (cliente =:cliente) and'
      '              (tipocliente = :tipocliente)'
      'order by faturamento desc')
    RequestLive = False
    Left = 64
    Top = 69
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cliente'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftString
        Name = 'tipocliente'
        ParamType = ptUnknown
      end>
    object qryContratosPorClientenumero: TStringField
      FieldName = 'numero'
      Required = True
    end
  end
  object dsrContratosPorCliente: TtecDataSource
    DataSet = qryContratosPorCliente
    Left = 217
    Top = 69
  end
  object qryConsultaClientes: TtecQuery
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
      'Select  coalesce(v.razao,v.nome) as nome ,'
      '            v.codigo,'
      '            v.tipo, '
      '            formatar_cpf_cnpj(v.pessoanumero) as pessoanumero,'
      '            descricao_tipocliente(v.tipo) as tipocliente, '
      '            v.estado,'
      '            c.nome as nomecidade'
      'From    vfornecedores v, cidades c'
      '/*  Preenchido em RunTime   */'
      '   and (v.estado = c.estado)'
      '   and (v.cidade = c.codigo)'
      'Order By UPPER(TO_ASCII(coalesce(v.razao,v.nome) ,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 320
    Top = 12
    object qryConsultaClientesnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaClientespessoanumero: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'pessoanumero'
      Size = 18
    end
    object qryConsultaClientesnomecidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'nomecidade'
      Size = 30
    end
    object qryConsultaClientesestado: TStringField
      DisplayLabel = 'UF'
      FieldName = 'estado'
      Size = 2
    end
    object qryConsultaClientescodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
    object qryConsultaClientestipocliente: TStringField
      DisplayLabel = 'Tipo cliente'
      FieldName = 'tipocliente'
      Size = 14
    end
    object qryConsultaClientestipo: TStringField
      FieldName = 'tipo'
      Visible = False
      Size = 1
    end
  end
  object qryMaxParcelaQuitada: TtecQuery
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
      'select numero '
      'from parcelas '
      'where datapagto is not null and '
      'tipopagto is null and'
      'contrato=:numero '
      'order by datavencto desc, numero desc limit 1')
    RequestLive = False
    Left = 377
    Top = 189
    ParamData = <
      item
        DataType = ftString
        Name = 'numero'
        ParamType = ptUnknown
        Value = '134524030'
      end>
    object qryMaxParcelaQuitadanumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
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
      '         coalesce(vf.razao,vf.nome) as nome ,'
      '         c.nascto,'
      '         c.iddocumento,'
      '         vf.pessoatipo,'
      
        '         cast((case when vf.pessoatipo = '#39'F'#39' then '#39'CPF'#39' else '#39'CN' +
        'PJ'#39' end) as varchar) as nomepessoanumero,'
      '         vf.pessoanumero as pessoanumero,'
      '         c.sexo,'
      '         c.naturalcidade,'
      '         c.naturalestado,'
      '         vf.empresa,'
      '         vf.rua,'
      '         vf.bairro,'
      '         vf.cidade,'
      '         vf.estado,'
      '         vf.cep,'
      '         vf.enderecoalterado,'
      
        '       (select cidades.nome from cidades where cidades.estado = ' +
        'vf.estado and cidades.codigo = vf.cidade) as nomecidade,'
      
        '       (select bairros.nome from bairros where bairros.estado = ' +
        'vf.estado and bairros.cidade = vf.cidade and bairros.codigo = vf' +
        '.bairro) as nomebairro,'
      
        '       (select cidades.nome from cidades where cidades.estado = ' +
        'c.naturalestado and cidades.codigo = c.naturalcidade) as nomenat' +
        'uralcidade'
      
        'from vfornecedores vf left join clientes c on vf.codigo=c.codigo' +
        ' and vf.tipo='#39'C'#39
      'where vf.codigo = :codigo and'
      '         vf.tipo = :tipocliente')
    RequestLive = True
    Left = 353
    Top = 72
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
      FieldName = 'pessoanumero'
      Size = 14
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
      FieldName = 'enderecoalterado'
    end
  end
end
