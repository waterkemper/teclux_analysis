inherited dtmExportacaoVendasReducoes: TdtmExportacaoVendasReducoes
  OldCreateOrder = False
  Left = 511
  Top = 264
  Height = 299
  Width = 492
  object qryVendas: TtecQuery
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
        Name = 'DATA'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ''
      
        'SELECT '#39'CF'#39'||cast(det.filial as varchar)||cast(det.num_usu as va' +
        'rchar)||rpad(cast(det.coo as varchar),6,'#39' '#39') as codigo_cupom,'
      
        '       rpad(cast(dic.cod_item as varchar),14,'#39' '#39') as codigo_item' +
        ','
      
        #9'   rpad(cast(cast(qtde_item as numeric(13,2)) as varchar),13,'#39' ' +
        #39') as quantidade,'
      
        #9'   rpad(cast(cast(vl_unit - descto_item/qtde_item + acres_item/' +
        'qtde_item as numeric(13,2)) as varchar),13,'#39' '#39') as preco_unitari' +
        'o,'
      
        #9'   rpad(cast(cast(0.00 as numeric(13,2)) as varchar),13,'#39' '#39') as' +
        ' custo,'
      
        #9'   rpad(cast(cast(vl_tot_item as numeric(13,2)) as varchar),13,' +
        #39' '#39') as subtotal,'
      #9'   rpad(cast(dic.num_item as varchar),3,'#39' '#39') as num_item,'
      
        #9'   rpad(cast(dic.desc_item as varchar),45,'#39' '#39') as descricao_ite' +
        'm,'
      
        #9'   rpad(cast(cast(17.00 as numeric(5,2)) as varchar),5,'#39' '#39') as ' +
        'icms,'
      #9'   rpad(cast('#39'UN'#39' as varchar),3,'#39' '#39') as unidade'
      #9'   '
      
        'FROM detalhecupom det join dadositemcupom dic on det.filial = di' +
        'c.filial and det.num_usu = dic.num_usu and det.cro = dic.cro and' +
        ' det.coo = dic.coo'
      'WHERE det.filial = :filialbase'
      '%DATA'
      'ORDER BY det.dt_ini, det.coo, dic.num_item'
      ''
      '/*SELECT det.coo,'
      '       det.dt_ini     as data,'
      '       (select df.cliente'
      '        from dadosfiscais df'
      '        where df.filialvenda = det.filial'
      '          and df.numero = (select c.dadofiscal'
      '                           from cupons c'
      '                           where c.maquina = det.num_usu'
      '                             and c.intervensao = det.cro'
      
        '                             and c.numero = det.coo)) as cliente' +
        ','
      '       det.nome_cli   as nomecliente,'
      '       (select df.vendedor'
      '        from dadosfiscais df'
      '        where df.filialvenda = det.filial'
      '          and df.numero = (select c.dadofiscal'
      '                           from cupons c'
      '                           where c.maquina = det.num_usu'
      '                             and c.intervensao = det.cro'
      
        '                             and c.numero = det.coo)) as vendedo' +
        'r,'
      '       (select u.nome'
      '        from usuarios u'
      '        where u.codigo =( select df.vendedor'
      '                          from dadosfiscais df'
      '                          where df.filialvenda = det.filial'
      '                            and df.numero = (select c.dadofiscal'
      '                                             from cupons c'
      
        '                                             where c.maquina = d' +
        'et.num_usu'
      
        '                                               and c.intervensao' +
        ' = det.cro'
      
        '                                               and c.numero = de' +
        't.coo))) as nomevendedor,'
      '       det.vl_tot     as valortotal,'
      '       det.sub_descto as desconto,'
      '       det.sub_acres  as acrescimo,'
      
        '       (select fpe.mp from formaspagamentoecf fpe where det.fili' +
        'al = fpe.filial and det.num_usu = fpe.num_usu and det.cro = fpe.' +
        'cro and det.coo = fpe.coo limit 1) as formapagto,'
      '       dic.cod_item   as produto,'
      '       dic.num_item   as sequencia,'
      '       dic.qtde_item  as quantidade,'
      '       dic.vl_unit    as valorunitario,'
      '       cast(case when det.canc = '#39'S'#39' then det.canc'
      '                 else dic.ind_canc'
      '            end as char(1)) as cancelado'
      
        'FROM detalhecupom det join dadositemcupom dic on det.filial = di' +
        'c.filial and det.num_usu = dic.num_usu and det.cro = dic.cro and' +
        ' det.coo = dic.coo'
      'WHERE det.filial = :filialbase'
      '%DATA'
      'ORDER BY det.dt_ini, det.coo, dic.num_item*/')
    RequestLive = False
    Left = 40
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filialbase'
        ParamType = ptUnknown
      end>
    object qryVendascodigo_cupom: TMemoField
      FieldName = 'codigo_cupom'
      BlobType = ftMemo
    end
    object qryVendascodigo_item: TMemoField
      FieldName = 'codigo_item'
      BlobType = ftMemo
    end
    object qryVendasquantidade: TMemoField
      FieldName = 'quantidade'
      BlobType = ftMemo
    end
    object qryVendaspreco_unitario: TMemoField
      FieldName = 'preco_unitario'
      BlobType = ftMemo
    end
    object qryVendascusto: TMemoField
      FieldName = 'custo'
      BlobType = ftMemo
    end
    object qryVendassubtotal: TMemoField
      FieldName = 'subtotal'
      BlobType = ftMemo
    end
    object qryVendasnum_item: TMemoField
      FieldName = 'num_item'
      BlobType = ftMemo
    end
    object qryVendasdescricao_item: TMemoField
      FieldName = 'descricao_item'
      BlobType = ftMemo
    end
    object qryVendasicms: TMemoField
      FieldName = 'icms'
      BlobType = ftMemo
    end
    object qryVendasunidade: TMemoField
      FieldName = 'unidade'
      BlobType = ftMemo
    end
  end
  object qryReducoes: TtecQuery
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
        Name = 'DATA'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'SELECT rz.crz,'
      '       rz.totalizadorgeral,'
      '       rz.vendabrutadiaria,'
      
        '       (select sum(det.vl_tot) from detalhecupom det where det.f' +
        'ilial = rz.filial and det.crz = rz.crz and det.canc = '#39'N'#39')     a' +
        's vendaliquida,'
      
        '       (select sum(det.sub_descto) from detalhecupom det where d' +
        'et.filial = rz.filial and det.crz = rz.crz and det.canc = '#39'N'#39') a' +
        's descontos,'
      
        '       (select sum(det.sub_acres) from detalhecupom det where de' +
        't.filial = rz.filial and det.crz = rz.crz and det.canc = '#39'N'#39')  a' +
        's acrescimos,'
      
        '       (select count(det.*) from detalhecupom det where det.fili' +
        'al = rz.filial and det.crz = rz.crz and det.canc = '#39'S'#39')         ' +
        '   as cancelamentos'
      'FROM reducoesz rz'
      'WHERE rz.filial = :filialbase'
      '%DATA'
      'ORDER BY rz.datamovimento')
    RequestLive = False
    Left = 40
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filialbase'
        ParamType = ptUnknown
      end>
    object qryReducoescrz: TIntegerField
      FieldName = 'crz'
      Required = True
    end
    object qryReducoestotalizadorgeral: TFloatField
      FieldName = 'totalizadorgeral'
      Required = True
    end
    object qryReducoesvendabrutadiaria: TFloatField
      FieldName = 'vendabrutadiaria'
      Required = True
    end
    object qryReducoesvendaliquida: TFloatField
      FieldName = 'vendaliquida'
    end
    object qryReducoesdescontos: TFloatField
      FieldName = 'descontos'
    end
    object qryReducoesacrescimos: TFloatField
      FieldName = 'acrescimos'
    end
    object qryReducoescancelamentos: TLargeintField
      FieldName = 'cancelamentos'
    end
  end
end
