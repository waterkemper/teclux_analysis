inherited dtmGerarRemessasSoacred: TdtmGerarRemessasSoacred
  OldCreateOrder = False
  Left = 537
  Top = 211
  Height = 210
  Width = 440
  object qryContratosParcelas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'faturamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'agente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'conceito'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select c.numero as contrato,'
      '       p.numero as parcela,'
      '       p.datavencto,'
      '       p.datapagto,'
      '       p.valorvencto,'
      '       p.valorpagto,'
      
        '       cast(p.valorpagto - p.valorvencto as numeric(10,2)) as mo' +
        'ra,'
      '       cast(case when p.formapagamento = '#39'D'#39' then '#39'D'#39
      '                 when p.formapagamento = '#39'H'#39' then '#39'C'#39
      '            end as varchar) as formapagamento,'
      '       c.cliente,'
      '       c.nome,'
      '       c.faturamento'
      'from contratos c join parcelas p on c.numero = p.contrato'
      'where c.numero is not null'
      '%filial'
      '%faturamento'
      '%agente'
      '%conceito'
      
        'order by cast(c.numero as bigint), cast(p.numero as integer), p.' +
        'datapagto')
    RequestLive = False
    Left = 45
    Top = 25
    object qryContratosParcelascontrato: TStringField
      FieldName = 'contrato'
      Required = True
    end
    object qryContratosParcelasparcela: TIntegerField
      FieldName = 'parcela'
      Required = True
      DisplayFormat = '0'
    end
    object qryContratosParcelasdatavencto: TDateField
      Alignment = taCenter
      FieldName = 'datavencto'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryContratosParcelasdatapagto: TDateField
      Alignment = taCenter
      FieldName = 'datapagto'
      EditMask = '99/99/9999;1; '
    end
    object qryContratosParcelasvalorvencto: TFloatField
      FieldName = 'valorvencto'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryContratosParcelasvalorpagto: TFloatField
      FieldName = 'valorpagto'
      DisplayFormat = '0.00'
    end
    object qryContratosParcelasmora: TFloatField
      FieldName = 'mora'
      DisplayFormat = '0.00'
    end
    object qryContratosParcelasformapagamento: TStringField
      FieldName = 'formapagamento'
      Size = 1
    end
    object qryContratosParcelascliente: TIntegerField
      FieldName = 'cliente'
      Required = True
      DisplayFormat = '0'
    end
    object qryContratosParcelasnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryContratosParcelasfaturamento: TDateField
      Alignment = taCenter
      FieldName = 'faturamento'
      EditMask = '99/99/9999;1; '
    end
  end
  object dsrContratosParcelas: TtecDataSource
    DataSet = qryContratosParcelas
    Left = 45
    Top = 75
  end
  object qryClientes: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'conceito'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'alteracao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';select * from'
      '('
      'select distinct cl.codigo,'
      '       cl.pessoanumero,'
      '       cl.nome,'
      '       cl.nascto,'
      '       cl.pai,'
      '       cl.mae,'
      
        '       (select ci.nome from cidades ci where ci.estado = cl.esta' +
        'do and ci.codigo = cl.naturalcidade) as naturalcidade,'
      '       cl.naturalestado,'
      '       '#39'BRASILEIRO'#39' as nacionalidade,'
      '       cl.idestado,'
      '       cl.iddocumento,'
      '       cl.idorgao,'
      '       cl.iddata,'
      '       cl.rua,'
      
        '       (select b.nome from bairros b where b.estado = cl.estado ' +
        'and b.cidade = cl.cidade and b.codigo = cl.bairro) as bairro,'
      
        '       (select ci.nome from cidades ci where ci.estado = cl.esta' +
        'do and ci.codigo = cl.cidade) as cidade,'
      '       cl.estado,'
      '       cl.cep,'
      '       cl.foneddd,'
      '       cl.fonenumero,'
      '       cl.fone2numero,'
      '       cast(case when cl.civil = '#39'S'#39' then '#39'1'#39
      '                 when cl.civil = '#39'C'#39' then '#39'2'#39
      '                 when cl.civil = '#39'D'#39' then '#39'3'#39
      '                 when cl.civil = '#39'V'#39' then '#39'4'#39
      '                 when cl.civil = '#39'O'#39' then '#39'7'#39
      '            end as varchar) as civil,'
      '       cast(case when cl.sexo = '#39'M'#39' then '#39'1'#39
      '                 when cl.sexo = '#39'F'#39' then '#39'2'#39
      '            end as varchar) as sexo,'
      '       cl.connome,'
      '       cl.empresa,'
      '       cl.empfonenumero,'
      '       cl.empadmissao,'
      
        '       (select ca.descricao from cargos ca where ca.codigo = cl.' +
        'empcargo) as cargo,'
      '       cl.emprendavalor,'
      '       cl.conempresa,'
      
        '       (select ca.descricao from cargos ca where ca.codigo = cl.' +
        'concargo) as cargoconjuge,'
      '       cl.referencia,'
      
        '       cast(cl.reffoneddd as varchar) || cast(cl.reffonenumero a' +
        's varchar) as ref1fone,'
      '       cast(case when cl.reftipo = '#39'P'#39' then '#39'Parente'#39
      '                 when cl.reftipo = '#39'A'#39' then '#39'Amigo'#39
      '                 when cl.reftipo = '#39'T'#39' then '#39'Trabalho'#39
      '            end as varchar) as ref1tipo,'
      '       cl.datacadastro,'
      '       cl.ultimaalteracao,'
      '       (select c.faturamento'
      #9' from contratos c'
      #9' where c.cliente = cl.codigo'
      #9' and c.faturamento between :fatInicial and :fatFinal'
      #9' and c.tipocliente = '#39'C'#39
      #9' and c.numero = (select max(cast(c1.numero as bigint))'
      #9#9#9' from contratos c1'
      #9#9#9' where c1.cliente = c.cliente'
      #9#9#9' and tipocliente = '#39'C'#39
      
        #9#9#9' and c1.faturamento between :fatInicial and :fatFinal)) as ul' +
        'timaconsulta'
      'from clientes cl'
      'where cl.codigo is not null'
      '%conceito'
      '%datas'
      '%alteracao'
      ') as cli'
      'order by UPPER(TO_ASCII(cli.nome,'#39'LATIN1'#39'));')
    RequestLive = False
    Left = 150
    Top = 25
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'fatInicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fatFinal'
        ParamType = ptUnknown
      end>
    object qryClientescodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryClientespessoanumero: TStringField
      FieldName = 'pessoanumero'
      Size = 14
    end
    object qryClientesnome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 40
    end
    object qryClientesnascto: TDateField
      Alignment = taCenter
      FieldName = 'nascto'
      EditMask = '99/99/9999;1; '
    end
    object qryClientespai: TStringField
      FieldName = 'pai'
      Size = 40
    end
    object qryClientesmae: TStringField
      FieldName = 'mae'
      Size = 40
    end
    object qryClientesnaturalcidade: TStringField
      FieldName = 'naturalcidade'
      Size = 13
    end
    object qryClientesnaturalestado: TStringField
      FieldName = 'naturalestado'
      Size = 2
    end
    object qryClientesnacionalidade: TMemoField
      FieldName = 'nacionalidade'
      BlobType = ftMemo
    end
    object qryClientesidestado: TStringField
      FieldName = 'idestado'
      Size = 2
    end
    object qryClientesiddocumento: TStringField
      FieldName = 'iddocumento'
    end
    object qryClientesidorgao: TStringField
      FieldName = 'idorgao'
      Size = 5
    end
    object qryClientesiddata: TDateField
      Alignment = taCenter
      FieldName = 'iddata'
      EditMask = '99/99/9999;1; '
    end
    object qryClientesrua: TStringField
      FieldName = 'rua'
      Required = True
      Size = 100
    end
    object qryClientesbairro: TStringField
      FieldName = 'bairro'
      Size = 21
    end
    object qryClientescidade: TStringField
      FieldName = 'cidade'
      Size = 22
    end
    object qryClientesestado: TStringField
      FieldName = 'estado'
      Required = True
      Size = 2
    end
    object qryClientescep: TIntegerField
      FieldName = 'cep'
      Required = True
      DisplayFormat = '0'
    end
    object qryClientesfoneddd: TIntegerField
      FieldName = 'foneddd'
      DisplayFormat = '0'
    end
    object qryClientesfonenumero: TIntegerField
      FieldName = 'fonenumero'
      DisplayFormat = '0'
    end
    object qryClientesfone2numero: TIntegerField
      FieldName = 'fone2numero'
      DisplayFormat = '0'
    end
    object qryClientescivil: TStringField
      FieldName = 'civil'
      Size = 1
    end
    object qryClientessexo: TStringField
      FieldName = 'sexo'
      Size = 1
    end
    object qryClientesconnome: TStringField
      FieldName = 'connome'
      Size = 40
    end
    object qryClientesempresa: TStringField
      FieldName = 'empresa'
      Size = 40
    end
    object qryClientesempfonenumero: TIntegerField
      FieldName = 'empfonenumero'
      DisplayFormat = '0'
    end
    object qryClientesempadmissao: TDateField
      Alignment = taCenter
      FieldName = 'empadmissao'
      EditMask = '99/99/9999;1; '
    end
    object qryClientescargo: TStringField
      FieldName = 'cargo'
      Size = 50
    end
    object qryClientesemprendavalor: TFloatField
      FieldName = 'emprendavalor'
      DisplayFormat = '0.00'
    end
    object qryClientesconempresa: TStringField
      FieldName = 'conempresa'
      Size = 40
    end
    object qryClientescargoconjuge: TStringField
      FieldName = 'cargoconjuge'
      Size = 50
    end
    object qryClientesreferencia: TStringField
      FieldName = 'referencia'
      Size = 40
    end
    object qryClientesref1fone: TMemoField
      FieldName = 'ref1fone'
      BlobType = ftMemo
    end
    object qryClientesref1tipo: TStringField
      FieldName = 'ref1tipo'
      Size = 8
    end
    object qryClientesdatacadastro: TDateField
      Alignment = taCenter
      FieldName = 'datacadastro'
      EditMask = '99/99/9999;1; '
    end
    object qryClientesultimaalteracao: TDateField
      Alignment = taCenter
      FieldName = 'ultimaalteracao'
      EditMask = '99/99/9999;1; '
    end
    object qryClientesultimaconsulta: TDateField
      Alignment = taCenter
      FieldName = 'ultimaconsulta'
      EditMask = '99/99/9999;1; '
    end
  end
  object dsrClientes: TtecDataSource
    DataSet = qryClientes
    Left = 150
    Top = 75
  end
  object qryVendas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeInsert = qryVendasBeforeInsert
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'faturamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'agente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'conceito'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select distinct c.numero as contrato,'
      '       c.cliente,'
      '       c.nome,'
      '       c.faturamento,'
      '       c.valorvista,'
      '       c.valorprazo,'
      '       c.can_data,'
      
        '       (select cast(case when (pl.desagio = 8) and (pl.quantidad' +
        'eparcelas <> 10) then 20 + pl.quantidadeparcelas'
      
        '                         when (pl.desagio = 8) and (pl.quantidad' +
        'eparcelas =  10) then 10 + pl.quantidadeparcelas'
      
        '                         else pl.quantidadeparcelas end as varch' +
        'ar) ||'
      '               cast(case when pl.prazovenctoentrada = 0 then '#39'1'#39
      '                         else '#39'0'#39' end as varchar)'
      '        from planos pl'
      '        where pl.codigo = c.plano) as plano,'
      
        '       (select cast(u.usename as varchar) from usuarios u where ' +
        'u.codigo = c.vendedor) as vendedor,'
      '       cast('#39'1 - Carn'#234#39' as varchar) as modalidade'
      'from contratos c'
      'where c.numero is not null'
      '%filial'
      '%faturamento'
      '%agente'
      '%conceito'
      'order by c.numero')
    RequestLive = True
    Left = 235
    Top = 25
    object qryVendascontrato: TStringField
      FieldName = 'contrato'
    end
    object qryVendascliente: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object qryVendasnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryVendasfaturamento: TDateField
      Alignment = taCenter
      FieldName = 'faturamento'
      EditMask = '99/99/9999;1; '
    end
    object qryVendasvalorvista: TFloatField
      FieldName = 'valorvista'
      DisplayFormat = '0.00'
    end
    object qryVendasvalorprazo: TFloatField
      FieldName = 'valorprazo'
      DisplayFormat = '0.00'
    end
    object qryVendasvendedor: TStringField
      FieldName = 'vendedor'
      Size = 10
    end
    object qryVendascan_data: TDateField
      Alignment = taCenter
      FieldName = 'can_data'
      EditMask = '99/99/9999;1; '
    end
    object qryVendasmodalidade: TStringField
      FieldName = 'modalidade'
      Required = True
      FixedChar = True
      Size = 50
    end
    object qryVendasplano: TMemoField
      FieldName = 'plano'
      BlobType = ftMemo
    end
  end
  object dsrVendas: TtecDataSource
    DataSet = qryVendas
    Left = 238
    Top = 75
  end
end
