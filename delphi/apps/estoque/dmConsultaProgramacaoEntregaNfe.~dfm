inherited dtmConsultaProgramacaoEntregaNfe: TdtmConsultaProgramacaoEntregaNfe
  OldCreateOrder = False
  Left = 357
  Top = 199
  Height = 428
  Width = 746
  object qryProgramacaoEntregaNfe: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryProgramacaoEntregaNfeAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'IntervaloEntregas'
        ParamType = ptUnknown
        Value = 'and pe.entrega between current_date  and current_date'
      end>
    Sql.Strings = (
      ';select'
      
        '         cast(substring(cnpjfornecedortransporte,1,8) as varchar' +
        '(8)) as raiz_cnpjfornecedortransporte,'
      ''
      ''
      '         coalesce('
      ''
      '            nomefornecedortransporte,'
      ''
      '         (select coalesce(ft.nome,ft.razao)'
      '          from fornecedores ft'
      
        '          where position(substring(cnpjfornecedortransporte,1,8)' +
        ' in ft.pessoanumero)<>0'
      
        '          order by ft.codigo limit 1), cast(null as varchar(60))' +
        ' ) as raiz_nomefornecedortransporte,'
      ''
      '          '
      '                      entrega,'
      '                      filial,'
      '                      nomefilial,'
      '                      fornecedor,'
      '                      nomefornecedor,'
      '                      serie,'
      '                      nomefornecedortransporte,'
      '                      cnpjfornecedortransporte,'
      '                      cSitNFe,'
      '                      tipo,'
      '                      qVol, '
      '          '
      '          '
      '          (          '
      '          select string_agg(lista_pedidos,'#39', '#39') as lista_pedidos'
      '          from'
      
        '          (select distinct unnest(string_to_array(lista_pedidos,' +
        ' '#39', '#39')) as lista_pedidos order by 1) sel          '
      '          ) as lista_pedidos,'
      '          '
      '          (          '
      '          select string_agg(lista_nrnfes,'#39', '#39') as lista_nrnfes'
      '          from'
      
        '          (select distinct unnest(string_to_array(lista_nrnfes, ' +
        #39', '#39')) as lista_nrnfes order by 1) sel          '
      '          ) as lista_nrnfes'
      '          '
      '          '
      '          '
      '          '
      '          '
      ''
      'from          '
      '          '
      '('
      ''
      'select distinct'
      ''
      ''
      ''
      ''
      
        '                      string_agg(cast(pedido as varchar), '#39', '#39') ' +
        'as lista_pedidos'
      '                     , entrega'
      '                     , filial'
      '                     , nomefilial'
      '                     , fornecedor'
      '                     , nomefornecedor                     '
      '                     , serie'
      
        '                     , string_agg(cast(nrnfe as varchar), '#39', '#39') ' +
        'as lista_nrnfes'
      '/*                     , dhemi*/'
      '                     , nomefornecedortransporte'
      '                     , cnpjfornecedortransporte'
      '                     , cSitNFe                    '
      '                     , tipo                       '
      '/*                     , chnfe */'
      '/*                     , nsu */'
      '                    , sum(qVol) as qVol'
      '      '
      ''
      ''
      '          '
      '          '
      '          '
      '          '
      '          '
      '          '
      ''
      'from'
      '         ('
      '                select distinct'
      '                       pe.numero as pedido'
      '                     , pe.entrega'
      '                     , pe.recebido'
      
        '                     , fi.codigo                                ' +
        '               as filial'
      '                     , fi.nome as nomefilial'
      
        '                     , f.codigo                                 ' +
        '               as fornecedor'
      
        '                     , coalesce(f.nome,f.razao)                 ' +
        '               as nomefornecedor'
      '                     '
      
        '                     , cast(substring(nsus.chnfe from 23 for 3) ' +
        'as varchar(3)) as serie'
      
        '                     , cast(substring(nsus.chnfe from 26 for 9) ' +
        'as integer)    as nrnfe'
      '                     '
      '                     /*'
      '                     , case'
      '                              when nsus.cSitNFe = '#39'1'#39
      
        '                                     then cast('#39'AUTORIZADA'#39' as v' +
        'archar(10))'
      '                              when nsus.cSitNFe = '#39'2'#39
      
        '                                     then cast('#39'DENEGADA'#39' as var' +
        'char(10))'
      '                              when nsus.cSitNFe = '#39'3'#39
      
        '                                     then cast('#39'CANCELADA'#39' as va' +
        'rchar(10))'
      
        '                       end                           as nomecSif' +
        'NFe'
      '                       */'
      '                       '
      
        '/*                     , cast(nsus.dhemi as timestamp) as dhemi*' +
        '/'
      '                     '
      '                     '
      '                    ,'
      '                     cast('
      '                     COALESCE('
      ''
      
        '                      case when POSITION('#39'<transporta><CNPJ>'#39' in' +
        ' xmlnfe)<>0 then'
      
        '                       split_part(substring(xmlnfe, POSITION('#39'<t' +
        'ransporta><CNPJ>'#39' in xmlnfe)+18+14+length('#39'</CNPJ><xNome>'#39'), 60)' +
        ', '#39'</x'#39', 1)'
      '                      else CAST(null as varchar(60))'
      '                      end,'
      ''
      '                     ft.nome'
      ''
      ''
      
        '                      ) as varchar(60)) as nomefornecedortranspo' +
        'rte'
      ''
      ''
      ''
      ''
      '                    ,'
      ''
      '                     cast('
      ''
      '                     COALESCE('
      ''
      ''
      
        '                      case when POSITION('#39'<transporta><CNPJ>'#39' in' +
        ' xmlnfe)<>0 then'
      
        '                              substring(xmlnfe, POSITION('#39'<trans' +
        'porta><CNPJ>'#39' in xmlnfe)+18, 14)'
      '                             else CAST(null as varchar(14))'
      '                             end,'
      ''
      '                     ft.pessoanumero'
      ''
      ''
      
        '                     ) as varchar(14)) as cnpjfornecedortranspor' +
        'te'
      ''
      ''
      '/*                     '
      '                     ,'
      '                       '
      '                       '
      '                       nsus_prod.sequencial'
      '                     , nsus_prod.cprod'
      '                     , nsus_prod.cean'
      '                     , nsus_prod.xprod as descricaoprodutonfe'
      '                     , nsus_prod.ucom'
      '                     , nsus_prod.qcom'
      '                     , nsus_prod.vuncom'
      '                     , nsus_prod.vfrete'
      '                     , nsus_prod.vseg'
      '                     , nsus_prod.vdesc'
      '                     , nsus_prod.voutro'
      '                     */'
      '                     '
      '                     , nsus.cSitNFe                    '
      '                     , nsus.tipo                       '
      '                     , nsus.chnfe'
      '                     , nsus.nsu'
      ''
      '                    , cast('
      '                    coalesce( '
      '                    NULLIF('
      
        '                    CAST((xpath('#39'//vol:qVol/text()'#39' , cast(nsus.' +
        'xmlnfe as xml), ARRAY[ARRAY['#39'vol'#39','
      
        '                                                        '#39'http://' +
        'www.portalfiscal.inf.br/nfe'#39']]))[1] as text),'#39'0'#39'),'#39'1'#39') as intege' +
        'r) as qVol'
      '                     '
      '                     '
      '                     '
      '                     '
      '                     '
      '                     '
      '                     /*'
      '                     , p.codigo       as produto'
      '                     , p.codigovisual as produtovisual'
      '                     , p.descricao    as descricaoproduto'
      '*/'
      '                     '
      '                from'
      '                       '
      '                       '
      '                       nsus_prod'
      '                            join nsus'
      '                            '
      '                            '
      '                        join fornecedores f'
      '                             join pedidos pe'
      '                                  left join fornecedores ft'
      
        '                                  on pe.fornecedortransporte = f' +
        't.codigo'
      '                                  '
      '                             on f.codigo = pe.fornecedor'
      '                             '
      '                        on nsus.cnpjemitente = f.pessoanumero'
      '                        '
      '                       join filiais fi'
      '                       on nsus.cnpj = fi.cnpj'
      '                            '
      '                            '
      '                            on nsus.cnpj     = nsus_prod.cnpj'
      '                               and nsus.nsu  = nsus_prod.nsu'
      '                               and nsus.tipo = nsus_prod.tipo'
      '                              '
      '                        '
      '                             left join '
      '                                  produtosfornecedores pf'
      '                                        '
      
        '                              on nsus_prod.cprod = pf.produtonof' +
        'ornecedor'
      '                               and pf.fornecedor = f.codigo'
      '                               and pf.tipofornecedor = '#39'F'#39
      ''
      
        '                               left join produtoscodigobarras pc' +
        'b'
      
        '                               on nsus_prod.cean = pcb.codigobar' +
        'ras'
      
        '                               and pcb.produto in (select pp.pro' +
        'duto from produtospedidos pp where pp.pedido = pe.numero)'
      ''
      
        '                               left join produtos p on p.codigo ' +
        '= COALESCE(pf.produto,pcb.produto)'
      ''
      ''
      ''
      '                where  /*cprod = '#39'PA.0235'#39' and */'
      ''
      '                       true'
      '/*                        and nsus.nsu = '#39'000000000132200'#39' */'
      '                       and nsus.tipoxmlretorno = '#39'resNFe'#39
      '                       and nsus.tipo in ('#39'NFE'#39
      '                                       /*, '#39'NFCe'#39'*/)'
      '                       and nsus.xmlnfe is not null'
      '                       and not exists'
      '                       ('
      '                              select'
      '                                     np.chv_nfe'
      '                              from'
      '                                     notaspag np'
      '                              where'
      '                                     np.chv_nfe = nsus.chnfe'
      '                       )'
      
        '                       and cast(nsus.dhemi as date) >= pe.databa' +
        'se'
      '                       /* and fi.codigo = NULL */'
      ''
      '                and pe.situacao in ('#39'A'#39','#39'P'#39')'
      
        '/*              and pe.entrega between '#39'2022-10-19'#39' and '#39'2022-10' +
        '-22'#39' */'
      ''
      '                %IntervaloEntregas'
      ''
      '         )'
      '         as nsus'
      'where'
      '         not'
      '         /* cancelada */'
      '         case'
      '                  when nsus.cSitNFe = '#39'3'#39
      '                           then true'
      '                  when nsus.tipo='#39'NFE'#39
      '                           then coalesce('
      '                                          ('
      '                                                 select'
      '                                                        true'
      '                                                 from'
      
        '                                                        nsus nsu' +
        's_c'
      '                                                 where'
      
        '                                                        nsus_c.c' +
        'hnfe                       = nsus.chnfe'
      
        '                                                        and nsus' +
        '_c.nsu                    <> nsus.nsu'
      
        '                                                        and nsus' +
        '_c.tipo                    = '#39'NFE'#39
      
        '                                                        and nsus' +
        '_c.tipoxmlretorno          = '#39'resEvento'#39
      
        '                                                        and nsus' +
        '_c.xmleveciencia is not null'
      
        '                                                        and cast' +
        '(cast((xpath('#39'//infEvento:tpEvento/text()="110111"'#39' , cast(nsus_' +
        'c.xmleveciencia as xml), ARRAY[ARRAY['#39'infEvento'#39','
      
        '                                                        '#39'http://' +
        'www.portalfiscal.inf.br/nfe'#39']]))[1] as text) as boolean)'
      '                                         )'
      '                                         ,false)'
      '                  when nsus.tipo='#39'CTE'#39
      '                           then coalesce('
      '                                          ('
      '                                                 select'
      '                                                        true'
      '                                                 from'
      
        '                                                        nsus nsu' +
        's_c'
      '                                                 where'
      
        '                                                        nsus_c.c' +
        'hnfe                       = nsus.chnfe'
      
        '                                                        and nsus' +
        '_c.nsu                    <> nsus.nsu'
      
        '                                                        and nsus' +
        '_c.tipoxmlretorno          = '#39'resEvento'#39
      
        '                                                        and nsus' +
        '_c.tipo                    = '#39'CTE'#39
      
        '                                                        and nsus' +
        '_c.xmleveciencia is not null'
      
        '                                                        and cast' +
        '(cast((xpath('#39'//infEvento:tpEvento/text()="110111"'#39' , cast(nsus_' +
        'c.xmleveciencia as xml), ARRAY[ARRAY['#39'infEvento'#39','
      
        '                                                        '#39'http://' +
        'www.portalfiscal.inf.br/cte'#39']]))[1] as text) as boolean)'
      '                                         )'
      '                                         ,false)'
      '         end'
      ''
      ''
      'group by'
      '                       entrega'
      '                     , filial'
      '                     , nomefilial'
      '                     , fornecedor'
      '                     , nomefornecedor                     '
      '                     , serie'
      '/*                     , nrnfe */'
      '/*                     , dhemi */'
      '                     , nomefornecedortransporte'
      '                     , cnpjfornecedortransporte'
      '                     , cSitNFe'
      '                     , tipo'
      '/*                     , chnfe */'
      '/*                     , nsu */'
      '/*                    , qVol */'
      ''
      ') as nsus'
      ''
      
        'group by cnpjfornecedortransporte, nomefornecedortransporte, lis' +
        'ta_pedidos, lista_nrnfes'
      '                     , entrega'
      '                     , filial'
      '                     , nomefilial'
      '                     , fornecedor'
      '                     , nomefornecedor                     '
      '                     , serie'
      '/*                     , nrnfe */'
      '/*                     , dhemi */'
      '                     , nomefornecedortransporte'
      '                     , cnpjfornecedortransporte'
      '                     , cSitNFe'
      '                     , tipo'
      '/*                     , chnfe */'
      '/*                     , nsu */'
      '                    , qVol '
      ''
      ''
      ''
      'order by entrega, raiz_nomefornecedortransporte'
      '')
    RequestLive = True
    Left = 72
    Top = 56
    object qryProgramacaoEntregaNfeentrega: TDateField
      Alignment = taCenter
      DisplayLabel = 'Entrega'
      FieldName = 'entrega'
      ReadOnly = True
      EditMask = '99/99/9999;1; '
    end
    object qryProgramacaoEntregaNfefilial: TIntegerField
      DisplayLabel = 'Filial'
      FieldName = 'filial'
      ReadOnly = True
    end
    object qryProgramacaoEntregaNfenomefilial: TStringField
      DisplayLabel = 'Nome da Filial'
      FieldName = 'nomefilial'
      ReadOnly = True
      Size = 60
    end
    object qryProgramacaoEntregaNfefornecedor: TIntegerField
      DisplayLabel = 'Fornecedor'
      FieldName = 'fornecedor'
      ReadOnly = True
    end
    object qryProgramacaoEntregaNfenomefornecedor: TStringField
      DisplayLabel = 'Nome do Fornecedor'
      FieldName = 'nomefornecedor'
      ReadOnly = True
      Size = 60
    end
    object qryProgramacaoEntregaNfeserie: TStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'serie'
      ReadOnly = True
      Size = 3
    end
    object qryProgramacaoEntregaNfenomefornecedortransporte: TStringField
      DisplayLabel = 'Transportador'
      FieldName = 'nomefornecedortransporte'
      ReadOnly = True
      Size = 60
    end
    object qryProgramacaoEntregaNfeqvol: TLargeintField
      DisplayLabel = 'Volumes'
      FieldName = 'qvol'
    end
    object qryProgramacaoEntregaNferaiz_nomefornecedortransporte: TStringField
      DisplayLabel = 'Entrega/Nome Fornecedor Transporte'
      FieldName = 'raiz_nomefornecedortransporte'
      ReadOnly = True
      Size = 60
    end
    object qryProgramacaoEntregaNferaiz_cnpjfornecedortransporte: TStringField
      FieldName = 'raiz_cnpjfornecedortransporte'
      Size = 8
    end
    object qryProgramacaoEntregaNfelista_pedidos: TMemoField
      FieldName = 'lista_pedidos'
      BlobType = ftMemo
    end
    object qryProgramacaoEntregaNfelista_nrnfes: TMemoField
      DisplayLabel = 'Notas Fiscais'
      FieldName = 'lista_nrnfes'
      BlobType = ftMemo
    end
  end
  object dsrProgramacaoEntregaNfe: TtecDataSource
    DataSet = qryProgramacaoEntregaNfe
    Left = 112
    Top = 72
  end
  object qryAtualizarPedidoRecebido: TtecQuery
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
      'update pedidos set recebido = :Recebido '
      'where numero = :pedido')
    RequestLive = False
    Left = 256
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Recebido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pedido'
        ParamType = ptUnknown
      end>
  end
  object qryCopia_ProgramacaoEntregaNFe: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'IntervaloEntregas'
        ParamType = ptUnknown
        Value = 'and pe.entrega >= current_date'
      end>
    Sql.Strings = (
      'select'
      '         nsus.*,'
      ''
      
        '         substring(cnpjfornecedortransporte,1,8) as raiz_cnpjfor' +
        'necedortransporte,'
      ''
      '         coalesce('
      '         (select coalesce(ft.nome,ft.razao)'
      '          from fornecedores ft'
      
        '          where position(substring(cnpjfornecedortransporte,1,8)' +
        ' in ft.pessoanumero)<>0'
      
        '          order by ft.codigo limit 1), nomefornecedortransporte)' +
        ' as raiz_nomefornecedortransporte'
      ''
      'from'
      '         ('
      '                select distinct'
      '                       pe.numero as pedido'
      '                     , pe.entrega'
      '                     , pe.recebido'
      
        '                     , fi.codigo                                ' +
        '               as filial'
      '                     , fi.nome as nomefilial'
      
        '                     , f.codigo                                 ' +
        '               as fornecedor'
      
        '                     , coalesce(f.nome,f.razao)                 ' +
        '               as nomefornecedor'
      '                     '
      
        '                     , cast(substring(nsus.chnfe from 23 for 3) ' +
        'as varchar(3)) as serie'
      
        '                     , cast(substring(nsus.chnfe from 26 for 9) ' +
        'as integer)    as nrnfe'
      '                     '
      '                     /*'
      '                     , case'
      '                              when nsus.cSitNFe = '#39'1'#39
      
        '                                     then cast('#39'AUTORIZADA'#39' as v' +
        'archar(10))'
      '                              when nsus.cSitNFe = '#39'2'#39
      
        '                                     then cast('#39'DENEGADA'#39' as var' +
        'char(10))'
      '                              when nsus.cSitNFe = '#39'3'#39
      
        '                                     then cast('#39'CANCELADA'#39' as va' +
        'rchar(10))'
      
        '                       end                           as nomecSif' +
        'NFe'
      '                       */'
      '                       '
      '                     , cast(nsus.dhemi as timestamp) as dhemi'
      '                     '
      '                     '
      '                    ,'
      '                     cast('
      '                     COALESCE('
      '                     '
      ''
      '                     ft.nome,'
      ''
      '                        /*'
      '                     (select'
      
        '                      CAST((xpath('#39'//emit:xNome/text()'#39' , cast(n' +
        'suscte.xmlnfe as xml), ARRAY[ARRAY['#39'emit'#39','
      
        '                                                        '#39'http://' +
        'www.portalfiscal.inf.br/cte'#39']]))[1] as text)'
      '                      from nsus nsuscte'
      '                      where nsuscte.tipo = '#39'CTE'#39
      '                        and nsuscte.xmlnfe is not null'
      
        '                        and cast(nsuscte.dhemi as timestamp) >= ' +
        'CAST(nsus.dhemi as timestamp)'
      ''
      
        '                        and cast(CAST((xpath('#39'//transporta:chave' +
        '/text()'#39' , cast(nsuscte.xmlnfe as xml), ARRAY[ARRAY['#39'transporta'#39 +
        ','
      
        '                                                        '#39'http://' +
        'www.portalfiscal.inf.br/cte'#39']]))[1] as text) as varchar(44)) = n' +
        'sus.chnfe'
      ''
      
        '                        and cast(CAST((xpath('#39'//rem:CNPJ/text()'#39 +
        ' , cast(nsuscte.xmlnfe as xml), ARRAY[ARRAY['#39'rem'#39','
      
        '                                                        '#39'http://' +
        'www.portalfiscal.inf.br/cte'#39']]))[2] as text) as varchar(14)) = n' +
        'sus.cnpjemitente),'
      '                                                        */'
      ''
      
        '                     CAST((xpath('#39'//transporta:xNome/text()'#39' , c' +
        'ast(nsus.xmlnfe as xml), ARRAY[ARRAY['#39'transporta'#39','
      
        '                                                        '#39'http://' +
        'www.portalfiscal.inf.br/nfe'#39']]))[3] as text)'
      ''
      
        '                      ) as varchar(60)) as nomefornecedortranspo' +
        'rte'
      ''
      ''
      ''
      ''
      '                    ,'
      ''
      '                     cast('
      '                     COALESCE('
      ''
      ''
      '                     ft.pessoanumero,'
      ''
      '                            /*'
      '                     (select'
      
        '                      CAST((xpath('#39'//emit:CNPJ/text()'#39' , cast(ns' +
        'uscte.xmlnfe as xml), ARRAY[ARRAY['#39'emit'#39','
      
        '                                                        '#39'http://' +
        'www.portalfiscal.inf.br/cte'#39']]))[1] as text)'
      '                      from nsus nsuscte'
      '                      where nsuscte.tipo = '#39'CTE'#39
      
        '                        and cast(nsuscte.dhemi as timestamp) >= ' +
        'CAST(nsus.dhemi as timestamp)'
      '                        and nsuscte.xmlnfe is not null'
      ''
      
        '                        and cast(CAST((xpath('#39'//transporta:chave' +
        '/text()'#39' , cast(nsuscte.xmlnfe as xml), ARRAY[ARRAY['#39'transporta'#39 +
        ','
      
        '                                                        '#39'http://' +
        'www.portalfiscal.inf.br/cte'#39']]))[1] as text) as varchar(44)) = n' +
        'sus.chnfe'
      ''
      
        '                        and cast(CAST((xpath('#39'//rem:CNPJ/text()'#39 +
        ' , cast(nsuscte.xmlnfe as xml), ARRAY[ARRAY['#39'rem'#39','
      
        '                                                        '#39'http://' +
        'www.portalfiscal.inf.br/cte'#39']]))[2] as text) as varchar(14)) = n' +
        'sus.cnpjemitente limit 1),'
      '                                                        */'
      ''
      
        '                     CAST((xpath('#39'//transporta:CNPJ/text()'#39' , ca' +
        'st(nsus.xmlnfe as xml), ARRAY[ARRAY['#39'transporta'#39','
      
        '                                                        '#39'http://' +
        'www.portalfiscal.inf.br/nfe'#39']]))[3] as text)'
      ''
      ''
      ''
      ''
      '                                                        '
      
        '                     ) as varchar(14)) as cnpjfornecedortranspor' +
        'te'
      ''
      ''
      '/*                     '
      '                     ,'
      '                       '
      '                       '
      '                       nsus_prod.sequencial'
      '                     , nsus_prod.cprod'
      '                     , nsus_prod.cean'
      '                     , nsus_prod.xprod as descricaoprodutonfe'
      '                     , nsus_prod.ucom'
      '                     , nsus_prod.qcom'
      '                     , nsus_prod.vuncom'
      '                     , nsus_prod.vfrete'
      '                     , nsus_prod.vseg'
      '                     , nsus_prod.vdesc'
      '                     , nsus_prod.voutro'
      '                     */'
      '                     '
      '                     , nsus.cSitNFe                    '
      '                     , nsus.tipo                       '
      '                     , nsus.chnfe'
      '                     , nsus.nsu'
      ''
      '                    , cast('
      '                    coalesce( '
      '                    NULLIF('
      
        '                    CAST((xpath('#39'//vol:qVol/text()'#39' , cast(nsus.' +
        'xmlnfe as xml), ARRAY[ARRAY['#39'vol'#39','
      
        '                                                        '#39'http://' +
        'www.portalfiscal.inf.br/nfe'#39']]))[1] as text),'#39'0'#39'),'#39'1'#39') as intege' +
        'r) as qVol'
      '                     '
      '                     '
      '                     '
      '                     '
      '                     '
      '                     '
      '                     /*'
      '                     , p.codigo       as produto'
      '                     , p.codigovisual as produtovisual'
      '                     , p.descricao    as descricaoproduto'
      '*/'
      '                     '
      '                from'
      '                       '
      '                       '
      '                       nsus_prod'
      '                            join nsus'
      '                            '
      '                            '
      '                        join fornecedores f'
      '                             join pedidos pe'
      '                                  left join fornecedores ft'
      
        '                                  on pe.fornecedortransporte = f' +
        't.codigo'
      '                                  '
      '                             on f.codigo = pe.fornecedor'
      '                             '
      '                        on nsus.cnpjemitente = f.pessoanumero'
      '                        '
      '                       join filiais fi'
      '                       on nsus.cnpj = fi.cnpj'
      '                            '
      '                            '
      '                            on nsus.cnpj     = nsus_prod.cnpj'
      '                               and nsus.nsu  = nsus_prod.nsu'
      '                               and nsus.tipo = nsus_prod.tipo'
      '                              '
      '                        '
      '                             left join '
      '                                  produtosfornecedores pf'
      '                                        '
      
        '                              on nsus_prod.cprod = pf.produtonof' +
        'ornecedor'
      '                               and pf.fornecedor = f.codigo'
      '                               and pf.tipofornecedor = '#39'F'#39
      ''
      
        '                               left join produtoscodigobarras pc' +
        'b'
      
        '                               on nsus_prod.cean = pcb.codigobar' +
        'ras'
      
        '                               and pcb.produto in (select pp.pro' +
        'duto from produtospedidos pp where pp.pedido = pe.numero)'
      ''
      
        '                               left join produtos p on p.codigo ' +
        '= COALESCE(pf.produto,pcb.produto)'
      ''
      ''
      ''
      '                where  /*cprod = '#39'PA.0235'#39' and */'
      ''
      '                       true'
      '/*                        and nsus.nsu = '#39'000000000132200'#39' */'
      '                       and nsus.tipoxmlretorno = '#39'resNFe'#39
      '                       and nsus.tipo in ('#39'NFE'#39
      '                                       /*, '#39'NFCe'#39'*/)'
      '                       and nsus.xmlnfe is not null'
      '                       and not exists'
      '                       ('
      '                              select'
      '                                     np.chv_nfe'
      '                              from'
      '                                     notaspag np'
      '                              where'
      '                                     np.chv_nfe = nsus.chnfe'
      '                       )'
      
        '                       and cast(nsus.dhemi as date) >= pe.databa' +
        'se'
      '                       /* and fi.codigo = NULL */'
      ''
      '                and pe.situacao in ('#39'A'#39','#39'P'#39')'
      ''
      '                %IntervaloEntregas'
      ''
      '         )'
      '         as nsus'
      'where'
      '         not'
      '         /* cancelada */'
      '         case'
      '                  when nsus.cSitNFe = '#39'3'#39
      '                           then true'
      '                  when nsus.tipo='#39'NFE'#39
      '                           then coalesce('
      '                                          ('
      '                                                 select'
      '                                                        true'
      '                                                 from'
      
        '                                                        nsus nsu' +
        's_c'
      '                                                 where'
      
        '                                                        nsus_c.c' +
        'hnfe                       = nsus.chnfe'
      
        '                                                        and nsus' +
        '_c.nsu                    <> nsus.nsu'
      
        '                                                        and nsus' +
        '_c.tipo                    = '#39'NFE'#39
      
        '                                                        and nsus' +
        '_c.tipoxmlretorno          = '#39'resEvento'#39
      
        '                                                        and nsus' +
        '_c.xmleveciencia is not null'
      
        '                                                        and cast' +
        '(cast((xpath('#39'//infEvento:tpEvento/text()="110111"'#39' , cast(nsus_' +
        'c.xmleveciencia as xml), ARRAY[ARRAY['#39'infEvento'#39','
      
        '                                                        '#39'http://' +
        'www.portalfiscal.inf.br/nfe'#39']]))[1] as text) as boolean)'
      '                                         )'
      '                                         ,false)'
      '                  when nsus.tipo='#39'CTE'#39
      '                           then coalesce('
      '                                          ('
      '                                                 select'
      '                                                        true'
      '                                                 from'
      
        '                                                        nsus nsu' +
        's_c'
      '                                                 where'
      
        '                                                        nsus_c.c' +
        'hnfe                       = nsus.chnfe'
      
        '                                                        and nsus' +
        '_c.nsu                    <> nsus.nsu'
      
        '                                                        and nsus' +
        '_c.tipoxmlretorno          = '#39'resEvento'#39
      
        '                                                        and nsus' +
        '_c.tipo                    = '#39'CTE'#39
      
        '                                                        and nsus' +
        '_c.xmleveciencia is not null'
      
        '                                                        and cast' +
        '(cast((xpath('#39'//infEvento:tpEvento/text()="110111"'#39' , cast(nsus_' +
        'c.xmleveciencia as xml), ARRAY[ARRAY['#39'infEvento'#39','
      
        '                                                        '#39'http://' +
        'www.portalfiscal.inf.br/cte'#39']]))[1] as text) as boolean)'
      '                                         )'
      '                                         ,false)'
      '         end'
      ''
      'order by entrega, raiz_nomefornecedortransporte '
      ''
      ''
      ''
      ''
      '/*'
      ''
      ':DataInicial'
      ':DataFinal'
      ''
      '*/')
    RequestLive = True
    Left = 536
    Top = 56
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
    object IntegerField1: TIntegerField
      DisplayLabel = 'Pedido'
      FieldName = 'pedido'
      ReadOnly = True
    end
    object DateField1: TDateField
      Alignment = taCenter
      DisplayLabel = 'Entrega'
      FieldName = 'entrega'
      ReadOnly = True
      EditMask = '99/99/9999;1; '
    end
    object IntegerField2: TIntegerField
      DisplayLabel = 'Filial'
      FieldName = 'filial'
      ReadOnly = True
    end
    object StringField1: TStringField
      DisplayLabel = 'Nome da Filial'
      FieldName = 'nomefilial'
      ReadOnly = True
      Size = 60
    end
    object IntegerField3: TIntegerField
      DisplayLabel = 'Fornecedor'
      FieldName = 'fornecedor'
      ReadOnly = True
    end
    object StringField2: TStringField
      DisplayLabel = 'Nome do Fornecedor'
      FieldName = 'nomefornecedor'
      ReadOnly = True
      Size = 60
    end
    object StringField3: TStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'serie'
      ReadOnly = True
      Size = 3
    end
    object IntegerField4: TIntegerField
      DisplayLabel = 'N'#250'mero NFe'
      FieldName = 'nrnfe'
      ReadOnly = True
    end
    object StringField4: TStringField
      DisplayLabel = 'Chave NFe'
      FieldName = 'chnfe'
      ReadOnly = True
      EditMask = '99\-9999\-99999999999999\-99\-999\-999999999\-9\-99999999\-9;0;_'
      Size = 44
    end
    object DateTimeField1: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'dhemi'
      DisplayFormat = 'dd/MM/yy hh:mm'
      EditMask = '99/99/99 99:99;1; '
    end
    object StringField5: TStringField
      DisplayLabel = 'Transportador'
      FieldName = 'nomefornecedortransporte'
      ReadOnly = True
      Size = 60
    end
    object IntegerField5: TIntegerField
      DisplayLabel = 'Volumes'
      FieldName = 'qvol'
      ReadOnly = True
    end
    object BooleanField1: TBooleanField
      DisplayLabel = 'Recebido'
      FieldName = 'recebido'
    end
    object MemoField1: TMemoField
      FieldName = 'raiz_cnpjfornecedortransporte'
      ReadOnly = True
      BlobType = ftMemo
    end
    object StringField6: TStringField
      DisplayLabel = 'Entrega/Nome Fornecedor Transporte'
      FieldName = 'raiz_nomefornecedortransporte'
      ReadOnly = True
      Size = 60
    end
  end
  object qryPedidos: TtecQuery
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
        Name = 'Lista_de_Pedidos'
        ParamType = ptUnknown
        Value = '0'
      end>
    Sql.Strings = (
      'select pe.numero,'
      '       pe.recebido'
      'from pedidos pe'
      'where pe.numero in (%Lista_de_Pedidos)'
      'order by pe.numero')
    RequestLive = True
    Active = True
    Left = 240
    Top = 160
    object qryPedidosnumero: TIntegerField
      DisplayLabel = 'Pedido'
      FieldName = 'numero'
      Required = True
    end
    object qryPedidosrecebido: TBooleanField
      DisplayLabel = 'Recebido'
      FieldName = 'recebido'
    end
  end
  object dsrPedidos: TtecDataSource
    DataSet = qryPedidos
    Left = 272
    Top = 176
  end
end
