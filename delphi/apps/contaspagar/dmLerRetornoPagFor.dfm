inherited dtmLerRetornoPagFor: TdtmLerRetornoPagFor
  OldCreateOrder = False
  Left = 249
  Top = 203
  Height = 612
  Width = 967
  object dsrretorno_pagfor_r1: TtecDataSource
    DataSet = qryretorno_pagfor_r1
    Left = 64
    Top = 72
  end
  object qryretorno_pagfor_r1: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 
      'registro0=registro0, Cod_do_Banco=Cod_do_Banco, Lote_de_Serv=Lot' +
      'e_de_Serv'
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'SQL'
        ParamType = ptUnknown
        Value = 'false'
      end>
    Sql.Strings = (
      'select r1.*,'
      ''
      '      ('
      '      select x.descricao '
      '      from'
      '      json_to_recordset('
      ''
      '       (select  cast(j_r_p.conteudo as json)'
      '        from json_retorno_pagfor j_r_p)'
      ''
      
        '      ) as x(tabela varchar(100), codigo varchar(100), descricao' +
        ' varchar(200))'
      '      where x.tabela = '#39'Tipo de Servi'#231'o FEBRABAN'#39
      '        and x.codigo = r1.tp_de_serv'
      '      ) as Tp_de_Serv_descricao '
      ''
      ''
      'from retorno_pagfor_r1 r1'
      ''
      'where true'
      '  and %SQL')
    RequestLive = True
    Left = 104
    Top = 88
    object qryretorno_pagfor_r1registro0: TLargeintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'registro0'
      Required = True
    end
    object qryretorno_pagfor_r1cod_do_banco: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'cod_do_banco'
      Required = True
      Size = 3
    end
    object qryretorno_pagfor_r1lote_de_serv: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'lote_de_serv'
      Required = True
      Size = 4
    end
    object qryretorno_pagfor_r1tp_de_registro: TStringField
      DisplayLabel = 'Tp Reg.'
      FieldName = 'tp_de_registro'
      Required = True
      Size = 1
    end
    object qryretorno_pagfor_r1tp_da_op: TStringField
      DisplayLabel = 'Tp Op'
      FieldName = 'tp_da_op'
      Size = 1
    end
    object qryretorno_pagfor_r1tp_de_serv: TStringField
      DisplayLabel = 'Tp Serv.'
      FieldName = 'tp_de_serv'
      Size = 2
    end
    object qryretorno_pagfor_r1forma_lancto: TStringField
      DisplayLabel = 'Forma Lancto'
      FieldName = 'forma_lancto'
      Size = 2
    end
    object qryretorno_pagfor_r1nro_da_ver_do_lote: TStringField
      DisplayLabel = 'Nro ver Lote'
      FieldName = 'nro_da_ver_do_lote'
      Size = 3
    end
    object qryretorno_pagfor_r1tp_de_inso_da_emp: TStringField
      DisplayLabel = 'Tp Insc.'
      FieldName = 'tp_de_inso_da_emp'
      Size = 1
    end
    object qryretorno_pagfor_r1nro_de_insc_da_emp: TStringField
      DisplayLabel = 'Nr Insc.'
      FieldName = 'nro_de_insc_da_emp'
      Size = 14
    end
    object qryretorno_pagfor_r1cd_do_conv_no_banco: TStringField
      DisplayLabel = 'Cd Conv. Banco'
      FieldName = 'cd_do_conv_no_banco'
    end
    object qryretorno_pagfor_r1ag_mant_da_conta: TStringField
      DisplayLabel = 'Ag. Mant. Cta'
      FieldName = 'ag_mant_da_conta'
      Size = 5
    end
    object qryretorno_pagfor_r1dg_ver_da_ag: TStringField
      DisplayLabel = 'DV Ag.'
      FieldName = 'dg_ver_da_ag'
      Size = 1
    end
    object qryretorno_pagfor_r1nr_da_conta_cor: TStringField
      DisplayLabel = 'Nr Cta Cor.'
      FieldName = 'nr_da_conta_cor'
      Size = 12
    end
    object qryretorno_pagfor_r1dg_ver_da_conta: TStringField
      DisplayLabel = 'DV Cta'
      FieldName = 'dg_ver_da_conta'
      Size = 1
    end
    object qryretorno_pagfor_r1dg_ver_da_ag_e_cta: TStringField
      DisplayLabel = 'DV Ag/Cta'
      FieldName = 'dg_ver_da_ag_e_cta'
      Size = 1
    end
    object qryretorno_pagfor_r1nm_da_emp: TStringField
      DisplayLabel = 'Nome da Emp.'
      FieldName = 'nm_da_emp'
      Size = 30
    end
    object qryretorno_pagfor_r1endereco: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'endereco'
      Size = 30
    end
    object qryretorno_pagfor_r1numero: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'numero'
      Size = 5
    end
    object qryretorno_pagfor_r1complemento: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'complemento'
      Size = 15
    end
    object qryretorno_pagfor_r1cidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'cidade'
    end
    object qryretorno_pagfor_r1cep: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'cep'
      Size = 8
    end
    object qryretorno_pagfor_r1uf: TStringField
      DisplayLabel = 'UF'
      FieldName = 'uf'
      Size = 2
    end
    object qryretorno_pagfor_r1oc_retorno: TStringField
      DisplayLabel = 'Oc Retorno'
      FieldName = 'oc_retorno'
      Size = 10
    end
    object qryretorno_pagfor_r1tp_de_serv_descricao: TStringField
      DisplayLabel = 'Tp Serv. Descri'#231#227'o'
      FieldName = 'tp_de_serv_descricao'
      Size = 200
    end
  end
  object dsrretorno_pagfor_r3_segG: TtecDataSource
    DataSet = qryretorno_pagfor_r3_segG
    Left = 72
    Top = 224
  end
  object qryretorno_pagfor_r3_segG: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryretorno_pagfor_r3_segGAfterOpen
    AfterScroll = qryretorno_pagfor_r3_segGAfterScroll
    OnCalcFields = qryretorno_pagfor_r3_segGCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'SQL'
        ParamType = ptUnknown
        Value = 'false'
      end>
    Sql.Strings = (
      'select segG.*,'
      ''
      
        '       coalesce((select sum(case when d_pgf.operacao = '#39'Concilia' +
        'r'#39' then 0.00 else d.valorvencto end)'
      '        from duplicatas d'
      '             left join duplicatas_pagforsegg d_pgf'
      '             on d_pgf.documentopag = d.documentopag'
      '             and d_pgf.datavencto = d.datavencto'
      '             and d_pgf.numero = d.numero'
      '             and d_pgf.pagfor = d.pagforG'
      '        where d.pagforG = seg.pagfor'
      '        ),0) +'
      ''
      ''
      
        '       coalesce((select sum( case when d_pgf.operacao = '#39'Concili' +
        'ar'#39' then'
      
        '                                        coalesce(d.valorvencto, ' +
        'd_pgf.valorvencto)'
      
        '                                  else -coalesce(d.valorvencto, ' +
        'd_pgf.valorvencto)'
      '                             end)'
      '        from duplicatas_pagforsegg d_pgf'
      '             left join duplicatas d'
      '             on d_pgf.documentopag = d.documentopag'
      '             and d_pgf.datavencto = d.datavencto'
      '             and d_pgf.numero = d.numero'
      '            /* and d_pgf.pagfor = d.pagforG */'
      '        where d_pgf.pagfor = seg.pagfor'
      
        '          and case when d_pgf.operacao = '#39'Desconciliar'#39' then d_p' +
        'gf.pagfor = d.pagforG else true end'
      ''
      '        ),0) as TotalConciliado,'
      ''
      ''
      ''
      '      ('
      '      select x.descricao'
      '      from'
      '      json_to_recordset('
      ''
      '       (select  cast(j_r_p.conteudo as json)'
      '        from json_retorno_pagfor j_r_p)'
      ''
      
        '      ) as x(tabela varchar(100), codigo varchar(100), descricao' +
        ' varchar(200))'
      '      where x.tabela = '#39'C'#243'digo de Movimento Remessa'#39
      '        and x.codigo = segG.Cd_de_Mov_Rem'
      '      ) as Cd_de_Mov_Rem_descricao,'
      ''
      '      ('
      '      select x.descricao'
      '      from'
      '      json_to_recordset('
      ''
      '       (select  cast(j_r_p.conteudo as json)'
      '        from json_retorno_pagfor j_r_p)'
      ''
      
        '      ) as x(tabela varchar(100), codigo varchar(100), descricao' +
        ' varchar(200))'
      '      where x.tabela = '#39'C'#243'digo da Moeda'#39
      '        and x.codigo = segG.Cd_da_Moeda'
      '      ) as Cd_da_Moeda_descricao,'
      ''
      '      ('
      '      select x.descricao'
      '      from'
      '      json_to_recordset('
      ''
      '       (select  cast(j_r_p.conteudo as json)'
      '        from json_retorno_pagfor j_r_p)'
      ''
      
        '      ) as x(tabela varchar(100), codigo varchar(100), descricao' +
        ' varchar(200))'
      '      where x.tabela = '#39'Esp'#233'cie do T'#237'tulo'#39
      '        and x.codigo = segG.Esp_Titulo'
      '      ) as Esp_Titulo_descricao,'
      ''
      '      ('
      '      select x.descricao'
      '      from'
      '      json_to_recordset('
      ''
      '       (select  cast(j_r_p.conteudo as json)'
      '        from json_retorno_pagfor j_r_p)'
      ''
      
        '      ) as x(tabela varchar(100), codigo varchar(100), descricao' +
        ' varchar(200))'
      '      where x.tabela = '#39'C'#243'digo do Desconto'#39
      '        and x.codigo = segG.Cd_Desconto'
      '      ) as Cd_Desconto_descricao,'
      ''
      ''
      '      ('
      '      select x.descricao'
      '      from'
      '      json_to_recordset('
      ''
      '       (select  cast(j_r_p.conteudo as json)'
      '        from json_retorno_pagfor j_r_p)'
      ''
      
        '      ) as x(tabela varchar(100), codigo varchar(100), descricao' +
        ' varchar(200))'
      '      where x.tabela = '#39'C'#243'digo para Protesto'#39
      '        and x.codigo = segG.Cd_Protesto'
      '      ) as Cd_Protesto_descricao,'
      ''
      '      ('
      '      select x.descricao'
      '      from'
      '      json_to_recordset('
      ''
      '       (select  cast(j_r_p.conteudo as json)'
      '        from json_retorno_pagfor j_r_p)'
      ''
      
        '      ) as x(tabela varchar(100), codigo varchar(100), descricao' +
        ' varchar(200))'
      '      where x.tabela = '#39'Tipo de T'#237'tulo'#39
      '        and x.codigo = segG.Tp_de_Titulo'
      '      ) as Tp_de_Titulo_descricao,'
      ''
      '      (select r1.nr_da_conta_cor'
      '       from retorno_pagfor_r1 r1'
      '       where r1.registro0  = segG.registro0'
      '         and r1.cod_do_banco = segG.cod_do_banco'
      
        '         and r1.lote_de_serv = segG.lote_de_serv) as nr_da_conta' +
        '_cor,'
      ''
      '      seg.pagfor'
      ''
      ''
      'from retorno_pagfor_r3_segg segG'
      '     natural join retorno_pagfor_r3_segmentos seg'
      'where true'
      '  and %SQL')
    RequestLive = True
    Left = 112
    Top = 240
    object qryretorno_pagfor_r3_segGpagfor: TLargeintField
      DisplayLabel = 'PagFor'
      FieldName = 'pagfor'
    end
    object qryretorno_pagfor_r3_segGregistro0: TLargeintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'registro0'
    end
    object qryretorno_pagfor_r3_segGcod_do_banco: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'cod_do_banco'
      Size = 3
    end
    object qryretorno_pagfor_r3_segGlote_de_serv: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'lote_de_serv'
      Size = 4
    end
    object qryretorno_pagfor_r3_segGtp_de_registro: TStringField
      DisplayLabel = 'Tp.Reg.'
      FieldName = 'tp_de_registro'
      Size = 1
    end
    object qryretorno_pagfor_r3_segGnr_seq_reg_lote: TStringField
      DisplayLabel = 'Seq. Lote'
      FieldName = 'nr_seq_reg_lote'
      Size = 5
    end
    object qryretorno_pagfor_r3_segGsegmento: TStringField
      DisplayLabel = 'Seg.'
      FieldName = 'segmento'
      Size = 1
    end
    object qryretorno_pagfor_r3_segGcd_de_mov_rem: TStringField
      DisplayLabel = 'Cd Mov.'
      FieldName = 'cd_de_mov_rem'
      Size = 2
    end
    object qryretorno_pagfor_r3_segGcd_de_mov_rem_descricao: TStringField
      DisplayLabel = 'Desc. Mov.'
      FieldName = 'cd_de_mov_rem_descricao'
      Size = 200
    end
    object qryretorno_pagfor_r3_segGcod_de_barras: TStringField
      DisplayLabel = 'C'#243'digo de Barras'
      FieldName = 'cod_de_barras'
      Size = 44
    end
    object qryretorno_pagfor_r3_segGtp_de_insc_ced: TStringField
      DisplayLabel = 'Tp Insc.'
      FieldName = 'tp_de_insc_ced'
      Size = 1
    end
    object qryretorno_pagfor_r3_segGnr_insc_ced: TStringField
      DisplayLabel = 'Nr. Insc.'
      FieldName = 'nr_insc_ced'
      Size = 15
    end
    object qryretorno_pagfor_r3_segGnome_do_cedente: TStringField
      DisplayLabel = 'Nome do Cedente'
      FieldName = 'nome_do_cedente'
      Size = 30
    end
    object qryretorno_pagfor_r3_segGdt_vencto: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dt Vencto'
      FieldName = 'dt_vencto'
      EditMask = '99/99/9999;1; '
    end
    object qryretorno_pagfor_r3_segGvlr_nominal: TFloatField
      DisplayLabel = 'Vlr Nominal'
      FieldName = 'vlr_nominal'
      DisplayFormat = '0.00'
    end
    object qryretorno_pagfor_r3_segGqt_moeda: TFloatField
      DisplayLabel = 'Qt Moeda'
      FieldName = 'qt_moeda'
      DisplayFormat = '0.00'
    end
    object qryretorno_pagfor_r3_segGcd_da_moeda: TStringField
      DisplayLabel = 'Cd da Moeda'
      FieldName = 'cd_da_moeda'
      Size = 2
    end
    object qryretorno_pagfor_r3_segGcd_da_moeda_descricao: TStringField
      DisplayLabel = 'Desc. da Moeda'
      FieldName = 'cd_da_moeda_descricao'
      Size = 200
    end
    object qryretorno_pagfor_r3_segGnr_doc_cob: TStringField
      DisplayLabel = 'Nr Doc. Cob.'
      FieldName = 'nr_doc_cob'
      Size = 15
    end
    object qryretorno_pagfor_r3_segGag_enc_cob: TStringField
      DisplayLabel = 'Ag. Cob.'
      FieldName = 'ag_enc_cob'
      Size = 5
    end
    object qryretorno_pagfor_r3_segGdg_ver_ag: TStringField
      DisplayLabel = 'DV Ag.'
      FieldName = 'dg_ver_ag'
      Size = 1
    end
    object qryretorno_pagfor_r3_segGpr_cobradora: TStringField
      DisplayLabel = 'Pra'#231'a Cob.'
      FieldName = 'pr_cobradora'
      Size = 10
    end
    object qryretorno_pagfor_r3_segGcd_carteira: TStringField
      DisplayLabel = 'Cd Carteira'
      FieldName = 'cd_carteira'
      Size = 1
    end
    object qryretorno_pagfor_r3_segGesp_titulo: TStringField
      DisplayLabel = 'Esp.T'#237't.'
      FieldName = 'esp_titulo'
      Size = 2
    end
    object qryretorno_pagfor_r3_segGdt_emissao: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dt Emiss'#227'o'
      FieldName = 'dt_emissao'
      EditMask = '99/99/9999;1; '
    end
    object qryretorno_pagfor_r3_segGjr_mora_dia: TFloatField
      DisplayLabel = 'Juros/Mora ao dia'
      FieldName = 'jr_mora_dia'
      DisplayFormat = '0.00'
    end
    object qryretorno_pagfor_r3_segGcd_desconto: TStringField
      DisplayLabel = 'Cd Desc.'
      FieldName = 'cd_desconto'
      Size = 1
    end
    object qryretorno_pagfor_r3_segGcd_desconto_descricao: TStringField
      DisplayLabel = 'Desc. Desconto'
      FieldName = 'cd_desconto_descricao'
      Size = 200
    end
    object qryretorno_pagfor_r3_segGdt_desconto: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dt Desconto'
      FieldName = 'dt_desconto'
      EditMask = '99/99/9999;1; '
    end
    object qryretorno_pagfor_r3_segGvlr_per_desc: TFloatField
      DisplayLabel = '% Desc.'
      FieldName = 'vlr_per_desc'
      DisplayFormat = '0.00'
    end
    object qryretorno_pagfor_r3_segGcd_protesto: TStringField
      DisplayLabel = 'Cd. Prot.'
      FieldName = 'cd_protesto'
      Size = 1
    end
    object qryretorno_pagfor_r3_segGcd_protesto_descricao: TStringField
      DisplayLabel = 'Desc. Protesto'
      FieldName = 'cd_protesto_descricao'
      Size = 200
    end
    object qryretorno_pagfor_r3_segGnr_dias_protesto: TStringField
      DisplayLabel = 'Nr dias Prot.'
      FieldName = 'nr_dias_protesto'
      Size = 2
    end
    object qryretorno_pagfor_r3_segGdt_lim_pago_tit: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dt Lim. Pg T'#237't.'
      FieldName = 'dt_lim_pago_tit'
      EditMask = '99/99/9999;1; '
    end
    object qryretorno_pagfor_r3_segGtp_de_titulo: TStringField
      DisplayLabel = 'Tp T'#237't.'
      FieldName = 'tp_de_titulo'
      Size = 1
    end
    object qryretorno_pagfor_r3_segGtp_de_titulo_descricao: TStringField
      DisplayLabel = 'Descri'#231#227'o Tp T'#237't.'
      FieldName = 'tp_de_titulo_descricao'
      Size = 200
    end
    object qryretorno_pagfor_r3_segGesp_titulo_descricao: TStringField
      DisplayLabel = 'Esp. T'#237't.'
      FieldName = 'esp_titulo_descricao'
      Size = 200
    end
    object qryretorno_pagfor_r3_segGnr_da_conta_cor: TStringField
      FieldName = 'nr_da_conta_cor'
      Size = 12
    end
    object qryretorno_pagfor_r3_segGtotalconciliado: TFloatField
      DisplayLabel = 'Tot. Conciliado'
      FieldName = 'totalconciliado'
      DisplayFormat = '0.00'
    end
    object qryretorno_pagfor_r3_segGSaldoConciliar: TCurrencyField
      DisplayLabel = 'Saldo a Conciliar'
      FieldKind = fkCalculated
      FieldName = 'SaldoConciliar'
      DisplayFormat = '0.00'
      Calculated = True
    end
  end
  object dsrretorno_pagfor_r3_segH: TtecDataSource
    DataSet = qryretorno_pagfor_r3_segH
    Left = 224
    Top = 224
  end
  object qryretorno_pagfor_r3_segH: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 
      'registro0=registro0, Cod_do_Banco=Cod_do_Banco, Lote_de_Serv=Lot' +
      'e_de_Serv, Tp_de_Registro=Tp_de_Registro, Nr_Seq_Reg_Lote=Nr_Seq' +
      '_Reg_Lote'
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'SQL'
        ParamType = ptUnknown
        Value = 'false'
      end>
    Sql.Strings = (
      'select segH.*,'
      ''
      '      ('
      '      select x.descricao'
      '      from'
      '      json_to_recordset('
      ''
      '       (select  cast(j_r_p.conteudo as json)'
      '        from json_retorno_pagfor j_r_p)'
      ''
      
        '      ) as x(tabela varchar(100), codigo varchar(100), descricao' +
        ' varchar(200))'
      '      where x.tabela = '#39'C'#243'digo de Movimento Remessa'#39
      '        and x.codigo = segH.Cd_de_Mov_Rem'
      '      ) as Cd_de_Mov_Rem_descricao,'
      ''
      '     ('
      '      select x.descricao'
      '      from'
      '      json_to_recordset('
      ''
      '       (select  cast(j_r_p.conteudo as json)'
      '        from json_retorno_pagfor j_r_p)'
      ''
      
        '      ) as x(tabela varchar(100), codigo varchar(100), descricao' +
        ' varchar(200))'
      '      where x.tabela = '#39'C'#243'digo do Desconto'#39
      '        and x.codigo = segH.Cd_Desconto2'
      '      ) as Cd_Desconto2_descricao,'
      ''
      '     ('
      '      select x.descricao'
      '      from'
      '      json_to_recordset('
      ''
      '       (select  cast(j_r_p.conteudo as json)'
      '        from json_retorno_pagfor j_r_p)'
      ''
      
        '      ) as x(tabela varchar(100), codigo varchar(100), descricao' +
        ' varchar(200))'
      '      where x.tabela = '#39'C'#243'digo do Desconto'#39
      '        and x.codigo = segH.Cd_Desconto3'
      '      ) as Cd_Desconto3_descricao,'
      ''
      '     ('
      '      select x.descricao'
      '      from'
      '      json_to_recordset('
      ''
      '       (select  cast(j_r_p.conteudo as json)'
      '        from json_retorno_pagfor j_r_p)'
      ''
      
        '      ) as x(tabela varchar(100), codigo varchar(100), descricao' +
        ' varchar(200))'
      '      where x.tabela = '#39'C'#243'digo da Multa'#39
      '        and x.codigo = segH.Cd_da_Multa'
      '      ) as Cd_da_Multa_descricao'
      ''
      'from retorno_pagfor_r3_segh segH'
      'where true'
      '  and %SQL')
    RequestLive = True
    Left = 256
    Top = 240
    object qryretorno_pagfor_r3_segHregistro0: TLargeintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'registro0'
      Required = True
    end
    object qryretorno_pagfor_r3_segHcod_do_banco: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'cod_do_banco'
      Required = True
      Size = 3
    end
    object qryretorno_pagfor_r3_segHlote_de_serv: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'lote_de_serv'
      Required = True
      Size = 4
    end
    object qryretorno_pagfor_r3_segHtp_de_registro: TStringField
      DisplayLabel = 'Tp Reg.'
      FieldName = 'tp_de_registro'
      Required = True
      Size = 1
    end
    object qryretorno_pagfor_r3_segHnr_seq_reg_lote: TStringField
      DisplayLabel = 'Seq. Lote'
      FieldName = 'nr_seq_reg_lote'
      Required = True
      Size = 5
    end
    object qryretorno_pagfor_r3_segHsegmento: TStringField
      DisplayLabel = 'Seg.'
      FieldName = 'segmento'
      Size = 1
    end
    object qryretorno_pagfor_r3_segHcd_de_mov_rem: TStringField
      DisplayLabel = 'Cd. Mov.'
      FieldName = 'cd_de_mov_rem'
      Size = 2
    end
    object qryretorno_pagfor_r3_segHcd_de_mov_rem_descricao: TStringField
      DisplayLabel = 'Desc. Movimento'
      FieldName = 'cd_de_mov_rem_descricao'
      Size = 200
    end
    object qryretorno_pagfor_r3_segHtp_de_insc_sac: TStringField
      DisplayLabel = 'Tp Insc.'
      FieldName = 'tp_de_insc_sac'
      Size = 1
    end
    object qryretorno_pagfor_r3_segHnr_insc_sac: TStringField
      DisplayLabel = 'Nr. Inscri'#231#227'o'
      FieldName = 'nr_insc_sac'
      Size = 15
    end
    object qryretorno_pagfor_r3_segHnome_do_sacador: TStringField
      DisplayLabel = 'Nome do Sacador'
      FieldName = 'nome_do_sacador'
      Size = 40
    end
    object qryretorno_pagfor_r3_segHcd_desconto2: TStringField
      DisplayLabel = 'Cd Desc. 2'
      FieldName = 'cd_desconto2'
      Size = 1
    end
    object qryretorno_pagfor_r3_segHcd_desconto2_descricao: TStringField
      DisplayLabel = 'Descri'#231#227'o Desconto 2'
      FieldName = 'cd_desconto2_descricao'
      Size = 200
    end
    object qryretorno_pagfor_r3_segHdt_desconto2: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dt Desc. 2'
      FieldName = 'dt_desconto2'
      EditMask = '99/99/9999;1; '
    end
    object qryretorno_pagfor_r3_segHvlr_per_desc2: TFloatField
      DisplayLabel = '% Desc. 2'
      FieldName = 'vlr_per_desc2'
      DisplayFormat = '0.00'
    end
    object qryretorno_pagfor_r3_segHcd_desconto3: TStringField
      DisplayLabel = 'Cd. Desc 3'
      FieldName = 'cd_desconto3'
      Size = 1
    end
    object qryretorno_pagfor_r3_segHcd_desconto3_descricao: TStringField
      DisplayLabel = 'Descri'#231#227'o Desconto 3'
      FieldName = 'cd_desconto3_descricao'
      Size = 200
    end
    object qryretorno_pagfor_r3_segHdt_desconto3: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dt Desc. 3'
      FieldName = 'dt_desconto3'
      EditMask = '99/99/9999;1; '
    end
    object qryretorno_pagfor_r3_segHvlr_per_desc3: TFloatField
      DisplayLabel = '% Desc 3'
      FieldName = 'vlr_per_desc3'
      DisplayFormat = '0.00'
    end
    object qryretorno_pagfor_r3_segHcd_da_multa: TStringField
      DisplayLabel = 'Cd Multa'
      FieldName = 'cd_da_multa'
      Size = 1
    end
    object qryretorno_pagfor_r3_segHcd_da_multa_descricao: TStringField
      DisplayLabel = 'Descri'#231#227'o da Multa'
      FieldName = 'cd_da_multa_descricao'
      Size = 200
    end
    object qryretorno_pagfor_r3_segHdt_in_vig_multa: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dt Multa'
      FieldName = 'dt_in_vig_multa'
      EditMask = '99/99/9999;1; '
    end
    object qryretorno_pagfor_r3_segHvlr_apl_multa: TFloatField
      DisplayLabel = 'Vlr Apl. Multa'
      FieldName = 'vlr_apl_multa'
      DisplayFormat = '0.00'
    end
    object qryretorno_pagfor_r3_segHvlr_abatimento: TFloatField
      DisplayLabel = 'vlr Abat.'
      FieldName = 'vlr_abatimento'
      DisplayFormat = '0.00'
    end
    object qryretorno_pagfor_r3_segHmensagem1: TStringField
      DisplayLabel = 'Mensagem 1'
      FieldName = 'mensagem1'
      Size = 40
    end
    object qryretorno_pagfor_r3_segHmensagem2: TStringField
      DisplayLabel = 'Mensagem 2'
      FieldName = 'mensagem2'
      Size = 40
    end
  end
  object dsrretorno_pagfor_trailer_tipo_5: TtecDataSource
    DataSet = qryretorno_pagfor_trailer_tipo_5
    Left = 88
    Top = 592
  end
  object qryretorno_pagfor_trailer_tipo_5: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 
      'registro0=registro0, Cod_do_Banco=Cod_do_Banco, Lote_de_Serv=Lot' +
      'e_de_Serv'
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'SQL'
        ParamType = ptUnknown
        Value = 'false'
      end>
    Sql.Strings = (
      'select r5.*'
      'from retorno_pagfor_trailer_tipo_5 r5'
      'where true'
      '  and %SQL')
    RequestLive = True
    Left = 128
    Top = 608
    object qryretorno_pagfor_trailer_tipo_5registro0: TLargeintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'registro0'
    end
    object qryretorno_pagfor_trailer_tipo_5cod_do_banco: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'cod_do_banco'
      Size = 3
    end
    object qryretorno_pagfor_trailer_tipo_5lote_de_serv: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'lote_de_serv'
      Size = 4
    end
    object qryretorno_pagfor_trailer_tipo_5tp_de_registro: TStringField
      DisplayLabel = 'Tp. Reg.'
      FieldName = 'tp_de_registro'
      Size = 1
    end
    object qryretorno_pagfor_trailer_tipo_5qt_reg: TIntegerField
      DisplayLabel = 'Qt. Reg.'
      FieldName = 'qt_reg'
    end
    object qryretorno_pagfor_trailer_tipo_5soma_valores: TFloatField
      DisplayLabel = 'Soma Valores'
      FieldName = 'soma_valores'
      DisplayFormat = '0.00'
    end
    object qryretorno_pagfor_trailer_tipo_5soma_qt_moedas: TFloatField
      DisplayLabel = 'Qt Moedas'
      FieldName = 'soma_qt_moedas'
      DisplayFormat = '0.00'
    end
    object qryretorno_pagfor_trailer_tipo_5nr_aviso_debito: TStringField
      DisplayLabel = 'Nr Aviso D'#233'b.'
      FieldName = 'nr_aviso_debito'
      Size = 6
    end
    object qryretorno_pagfor_trailer_tipo_5oc_retorno: TStringField
      DisplayLabel = 'Oc. Retorno'
      FieldName = 'oc_retorno'
      Size = 10
    end
  end
  object dsrDuplicatas: TtecDataSource
    DataSet = qryDuplicatas
    Left = 504
    Top = 32
  end
  object qryDuplicatas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryDuplicatasAfterOpen
    AfterPost = qryDuplicatasAfterPost
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'CondicaoBuscaAproximada'
        ParamType = ptUnknown
        Value = 'd.documentopag = 3000'
      end>
    Sql.Strings = (
      'select d.documentopag,'
      '       d.numero,'
      '       dp.complemento,'
      '       dp.fornecedor,'
      '       dp.tipofornecedor,'
      '       vf.nome as nomefornecedor,'
      '       d.datavencto,'
      '       d.valorvencto,'
      
        '       nullif(coalesce(d.juros,0) + coalesce(d.multa,0),0) as mu' +
        'ltajuros,'
      ''
      '       d.pagfor,'
      '       d.pagforG,'
      ''
      
        '       case when dp_pgf.operacao = '#39'Desconciliar'#39' then cast(null' +
        ' as date) else'
      
        '         coalesce(dp_pgf.datapagto, d.datapagto) end as datapagt' +
        'o,'
      ''
      
        '       case when dp_pgf.operacao = '#39'Desconciliar'#39' then cast(null' +
        ' as numeric) else'
      
        '         coalesce(dp_pgf.valorpagto,d.valorpagto) end as valorpa' +
        'gto,'
      ''
      
        '       case when dp_pgf.operacao = '#39'Desconciliar'#39' then cast(null' +
        ' as integer) else'
      
        '         coalesce(dp_pgf.contapagto,d.contapagto) end as contapa' +
        'gto,'
      ''
      '       d.juros,'
      '       d.multa,'
      '       d.valordesconto,'
      ''
      
        '       case when dp_pgf.operacao = '#39'Desconciliar'#39' then cast(null' +
        ' as integer) else'
      
        '         coalesce(dp_pgf.filialpagto,d.filialpagto) end as filia' +
        'lpagto,'
      ''
      '       d.datapagto as datapagto_orig,'
      '       d.valorpagto as valorpagto_orig,'
      '       d.contapagto as contapagto_orig,'
      '       d.juros as juros_orig,'
      '       d.multa as multa_orig,'
      '       d.valordesconto as valordesconto_orig,'
      '       d.pagfor as pagfor_orig,'
      ''
      '       coalesce(dp_pgf.usuario,d.usuario) as usuario,'
      ''
      '       d.contacredito,'
      '       d.tipopagamento,'
      ''
      
        '       case when dp_pgf.operacao = '#39'Desconciliar'#39' then cast(null' +
        ' as integer) else'
      
        '         coalesce(dp_pgf.filialpagto,d.filialpagto) end as filia' +
        'lpagto,'
      ''
      '       case when :SegmentoG then'
      '         coalesce(dp_pgf_g.observacao, d.observacao)'
      '       else'
      '         coalesce(dp_pgf.observacao, d.observacao)'
      '       end as observacao,'
      ''
      '       d.evento,'
      ''
      '       case when :SegmentoG then'
      ''
      '         case when d.pagforG is not null'
      ''
      '         then'
      ''
      '           coalesce((select false'
      '            from duplicatas_pagforsegg dp_pgf'
      '            where dp_pgf.documentopag = d.documentopag'
      '              and dp_pgf.datavencto = d.datavencto'
      '              and dp_pgf.numero = d.numero'
      '              and dp_pgf.pagfor =  d.pagforG'
      '              and dp_pgf.operacao = '#39'Desconciliar'#39
      '              /*and dp_pgf.pagfor is not null*/),true)'
      ''
      ''
      '         else'
      ''
      '           coalesce((select true'
      '            from duplicatas_pagforsegg dp_pgf'
      '            where dp_pgf.documentopag = d.documentopag'
      '              and dp_pgf.datavencto = d.datavencto'
      '              and dp_pgf.numero = d.numero'
      '              and dp_pgf.operacao = '#39'Conciliar'#39
      '              and dp_pgf.pagfor is not null),false)'
      ''
      '         end'
      ''
      '       else'
      ''
      '         case when d.pagfor is not null'
      ''
      '         then'
      ''
      '           coalesce((select false'
      '            from duplicatas_pagfor dp_pgf'
      '            where dp_pgf.documentopag = d.documentopag'
      '              and dp_pgf.datavencto = d.datavencto'
      '              and dp_pgf.numero = d.numero'
      '              and dp_pgf.pagfor =  d.pagfor'
      '              and dp_pgf.operacao = '#39'Desconciliar'#39
      '              /*and dp_pgf.pagfor is not null*/),true)'
      ''
      ''
      '         else'
      ''
      '           coalesce((select true'
      '            from duplicatas_pagfor dp_pgf'
      '            where dp_pgf.documentopag = d.documentopag'
      '              and dp_pgf.datavencto = d.datavencto'
      '              and dp_pgf.numero = d.numero'
      '              and dp_pgf.operacao = '#39'Conciliar'#39
      '              and dp_pgf.pagfor is not null),false)'
      ''
      '         end'
      ''
      '       end as conciliar'
      ''
      'from duplicatas d'
      '     join documentospag dp'
      '          join vfornecedores vf'
      '          on dp.fornecedor = vf.codigo'
      '          and dp.tipofornecedor = vf.tipo'
      '     on d.documentopag = dp.numero'
      ''
      '     left join duplicatas_pagfor dp_pgf'
      '     on d.documentopag = dp_pgf.documentopag'
      '     and d.datavencto = dp_pgf.datavencto'
      '     and d.numero = dp_pgf.numero'
      ''
      '     left join duplicatas_pagforsegg dp_pgf_g'
      '     on d.documentopag = dp_pgf_g.documentopag'
      '     and d.datavencto = dp_pgf_g.datavencto'
      '     and d.numero = dp_pgf_g.numero'
      ''
      ''
      
        'where case when :Segmento_TotalmenteConciliado then coalesce(dp_' +
        'pgf.pagfor,d.pagfor)  = :pagfor'
      
        '           when :SegmentoG_TotalmenteConciliado then coalesce(dp' +
        '_pgf_g.pagfor,d.pagforG) = :pagforG'
      '      else'
      '       (%CondicaoBuscaAproximada)'
      '      end'
      ''
      ''
      '/*'
      ':datainicial'
      ':datafinal'
      ':valor'
      ''
      ':DiasAbaixo'
      ':DiasAcima'
      ':PercentualValorAbaixo'
      ':PercentualValorAcima'
      ''
      '*/')
    RequestLive = True
    Left = 536
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SegmentoG'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Segmento_TotalmenteConciliado'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pagfor'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftUnknown
        Name = 'SegmentoG_TotalmenteConciliado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pagforG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'datafinal'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'valor'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'DiasAbaixo'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'DiasAcima'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PercentualValorAbaixo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PercentualValorAcima'
        ParamType = ptUnknown
      end>
    object qryDuplicatasdocumentopag: TIntegerField
      DisplayLabel = 'Docto'
      FieldName = 'documentopag'
      Required = True
    end
    object qryDuplicatasnumero: TIntegerField
      DisplayLabel = 'Nr.'
      FieldName = 'numero'
      Required = True
    end
    object qryDuplicatascomplemento: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'complemento'
      Size = 15
    end
    object qryDuplicatasfornecedor: TIntegerField
      DisplayLabel = 'Fornecedor'
      FieldName = 'fornecedor'
      Required = True
    end
    object qryDuplicatastipofornecedor: TStringField
      DisplayLabel = 'T'
      FieldName = 'tipofornecedor'
      Required = True
      Size = 1
    end
    object qryDuplicatasnomefornecedor: TStringField
      DisplayLabel = 'Nome do Fornecedor'
      FieldName = 'nomefornecedor'
      Size = 50
    end
    object qryDuplicatasdatavencto: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dt Vencto'
      FieldName = 'datavencto'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryDuplicatasvalorvencto: TFloatField
      DisplayLabel = 'Vlr Vencto'
      FieldName = 'valorvencto'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryDuplicatasdatapagto: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dt Pagto'
      FieldName = 'datapagto'
      EditMask = '99/99/9999;1; '
    end
    object qryDuplicatasvalorpagto: TFloatField
      DisplayLabel = 'Vlr Pagto'
      FieldName = 'valorpagto'
      DisplayFormat = '0.00'
    end
    object qryDuplicatasconciliar: TBooleanField
      DisplayLabel = 'Conciliar'
      FieldName = 'conciliar'
      OnChange = qryDuplicatasconciliarChange
    end
    object qryDuplicataspagfor: TIntegerField
      FieldName = 'pagfor'
    end
    object qryDuplicatasvalordesconto: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'valordesconto'
    end
    object qryDuplicatasjuros: TFloatField
      FieldName = 'juros'
    end
    object qryDuplicatasmulta: TFloatField
      FieldName = 'multa'
    end
    object qryDuplicatasmultajuros: TFloatField
      DisplayLabel = 'Multa/Juros'
      FieldName = 'multajuros'
    end
    object qryDuplicatascontapagto: TIntegerField
      DisplayLabel = 'Conta Pagto'
      FieldName = 'contapagto'
    end
    object qryDuplicatasfilialpagto: TIntegerField
      DisplayLabel = 'Filial Pagto'
      FieldName = 'filialpagto'
    end
    object qryDuplicatasusuario: TIntegerField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'usuario'
    end
    object qryDuplicatascontacredito: TIntegerField
      FieldName = 'contacredito'
    end
    object qryDuplicatastipopagamento: TIntegerField
      FieldName = 'tipopagamento'
    end
    object qryDuplicatasobservacao: TStringField
      FieldName = 'observacao'
      Size = 1000
    end
    object qryDuplicatasevento: TIntegerField
      FieldName = 'evento'
    end
  end
  object dsrretorno_pagfor_r0: TtecDataSource
    DataSet = qryretorno_pagfor_r0
    Left = 64
    Top = 8
  end
  object qryretorno_pagfor_r0: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 'registro0=codigo'
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'SQL'
        ParamType = ptUnknown
        Value = 'false'
      end>
    Sql.Strings = (
      'select r0.*'
      'from retorno_pagfor_r0 r0'
      'where true'
      '  and %SQL'
      ''
      '/*'
      ''
      '             r0.cod_do_banco = :cod_do_banco and'
      '             r0.nr_da_conta_cor = :nr_da_conta_cor and'
      '             r0.nr_seq = :nr_seq                       '
      ''
      ''
      '*/  '
      '')
    RequestLive = True
    Left = 104
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_do_banco'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_da_conta_cor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_seq'
        ParamType = ptUnknown
      end>
    object qryretorno_pagfor_r0codigo: TLargeintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Required = True
    end
    object qryretorno_pagfor_r0nomearquivo: TStringField
      DisplayLabel = 'Nome do Arquivo'
      FieldName = 'nomearquivo'
      Size = 100
    end
    object qryretorno_pagfor_r0datahora: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data/Hora'
      FieldName = 'datahora'
      DisplayFormat = 'dd/MM/yy hh:mm'
      EditMask = '99/99/99 99:99;1; '
    end
    object qryretorno_pagfor_r0cod_do_banco: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'cod_do_banco'
      Size = 3
    end
    object qryretorno_pagfor_r0lote_de_serv: TStringField
      DisplayLabel = 'Lt Serv.'
      FieldName = 'lote_de_serv'
      Size = 4
    end
    object qryretorno_pagfor_r0tp_de_registro: TStringField
      DisplayLabel = 'Tp Reg.'
      FieldName = 'tp_de_registro'
      Size = 1
    end
    object qryretorno_pagfor_r0tp_de_inso_da_emp: TStringField
      DisplayLabel = 'Tp. Insc.'
      FieldName = 'tp_de_inso_da_emp'
      Size = 1
    end
    object qryretorno_pagfor_r0nro_de_insc_da_emp: TStringField
      DisplayLabel = 'Insc. Empresa'
      FieldName = 'nro_de_insc_da_emp'
      Size = 14
    end
    object qryretorno_pagfor_r0cd_do_conv_no_banco: TStringField
      FieldName = 'cd_do_conv_no_banco'
    end
    object qryretorno_pagfor_r0ag_mant_da_conta: TStringField
      FieldName = 'ag_mant_da_conta'
      Size = 5
    end
    object qryretorno_pagfor_r0dg_ver_da_ag: TStringField
      FieldName = 'dg_ver_da_ag'
      Size = 1
    end
    object qryretorno_pagfor_r0nr_da_conta_cor: TStringField
      FieldName = 'nr_da_conta_cor'
      Size = 12
    end
    object qryretorno_pagfor_r0dg_ver_da_conta: TStringField
      FieldName = 'dg_ver_da_conta'
      Size = 1
    end
    object qryretorno_pagfor_r0dg_ver_da_ag_e_cta: TStringField
      FieldName = 'dg_ver_da_ag_e_cta'
      Size = 1
    end
    object qryretorno_pagfor_r0nm_da_emp: TStringField
      FieldName = 'nm_da_emp'
      Size = 30
    end
    object qryretorno_pagfor_r0nm_do_banco: TStringField
      FieldName = 'nm_do_banco'
      Size = 30
    end
    object qryretorno_pagfor_r0cd_rem_ret: TStringField
      FieldName = 'cd_rem_ret'
      Size = 1
    end
    object qryretorno_pagfor_r0dt_geracao: TDateField
      Alignment = taCenter
      FieldName = 'dt_geracao'
      EditMask = '99/99/9999;1; '
    end
    object qryretorno_pagfor_r0nr_seq: TStringField
      FieldName = 'nr_seq'
      Size = 6
    end
    object qryretorno_pagfor_r0nr_ver_layout: TStringField
      FieldName = 'nr_ver_layout'
      Size = 3
    end
    object qryretorno_pagfor_r0hr_geracao: TTimeField
      Alignment = taCenter
      FieldName = 'hr_geracao'
      EditMask = '99:99;1; '
    end
  end
  object dsrretorno_pagfor_r3_segA: TtecDataSource
    DataSet = qryretorno_pagfor_r3_segA
    Left = 72
    Top = 152
  end
  object qryretorno_pagfor_r3_segA: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryretorno_pagfor_r3_segAAfterOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'SQL'
        ParamType = ptUnknown
        Value = 'true'
      end>
    Sql.Strings = (
      'select segA.*,'
      ''
      '       (select x.descricao'
      '        from'
      '        json_to_recordset('
      ''
      '         (select  cast(j_r_p.conteudo as json)'
      '          from json_retorno_pagfor j_r_p)'
      ''
      
        '         ) as x(tabela varchar(100), codigo varchar(100), descri' +
        'cao varchar(200))'
      
        '         where x.tabela = '#39'Tipo de Movimento'#39' and x.codigo = seg' +
        'A.Tipo_de_Movimento'
      '         ) as desc_Tipo_de_Movimento,'
      ''
      '       (select x.descricao'
      '        from'
      '        json_to_recordset('
      ''
      '         (select  cast(j_r_p.conteudo as json)'
      '          from json_retorno_pagfor j_r_p)'
      ''
      
        '         ) as x(tabela varchar(100), codigo varchar(100), descri' +
        'cao varchar(200))'
      
        '         where x.tabela = '#39'C'#243'digo da Instru'#231#227'o para Movimento'#39' a' +
        'nd x.codigo = segA.cd_Ins_Movto'
      '         ) as desc_cd_Ins_Movto,'
      ''
      '       (select x.descricao'
      '        from'
      '        json_to_recordset('
      ''
      '         (select  cast(j_r_p.conteudo as json)'
      '          from json_retorno_pagfor j_r_p)'
      ''
      
        '         ) as x(tabela varchar(100), codigo varchar(100), descri' +
        'cao varchar(200))'
      
        '         where x.tabela = '#39'C'#243'digo da C'#226'mara Centralizadora'#39' and ' +
        'x.codigo = segA.cd_cam_comp'
      '         ) as desc_cd_cam_comp,'
      ''
      ''
      '       (select x.descricao'
      '        from'
      '        json_to_recordset('
      ''
      '         (select  cast(j_r_p.conteudo as json)'
      '          from json_retorno_pagfor j_r_p)'
      ''
      
        '         ) as x(tabela varchar(100), codigo varchar(100), descri' +
        'cao varchar(200))'
      
        '         where x.tabela = '#39'Aviso ao Favorecido'#39' and x.codigo = s' +
        'egA.Em_Aviso_Fav'
      '         ) as desc_Em_Aviso_Fav,'
      ''
      '       (select x.descricao'
      '        from'
      '        json_to_recordset('
      ''
      '         (select  cast(j_r_p.conteudo as json)'
      '          from json_retorno_pagfor j_r_p)'
      ''
      
        '         ) as x(tabela varchar(100), codigo varchar(100), descri' +
        'cao varchar(200))'
      
        '         where x.tabela = '#39'C'#243'digos de Ocorr'#234'ncia para Retorno'#39' a' +
        'nd x.codigo = segA.Oc_Retorno'
      '         ) as desc_Oc_Retorno,'
      ''
      '        seg.pagfor '
      ''
      ''
      'from retorno_pagfor_r3_sega segA'
      '     natural join retorno_pagfor_r3_segmentos seg'
      'where true'
      '  and %SQL')
    RequestLive = True
    Left = 107
    Top = 168
    object qryretorno_pagfor_r3_segApagfor: TLargeintField
      DisplayLabel = 'PagFor'
      FieldName = 'pagfor'
    end
    object qryretorno_pagfor_r3_segAregistro0: TLargeintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'registro0'
      Required = True
    end
    object qryretorno_pagfor_r3_segAcod_do_banco: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'cod_do_banco'
      Required = True
      Size = 3
    end
    object qryretorno_pagfor_r3_segAlote_de_serv: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'lote_de_serv'
      Required = True
      Size = 4
    end
    object qryretorno_pagfor_r3_segAtp_de_registro: TStringField
      DisplayLabel = 'Tp Reg.'
      FieldName = 'tp_de_registro'
      Required = True
      Size = 1
    end
    object qryretorno_pagfor_r3_segAnr_seq_reg_lote: TStringField
      DisplayLabel = 'Seq.'
      FieldName = 'nr_seq_reg_lote'
      Required = True
      Size = 5
    end
    object qryretorno_pagfor_r3_segAsegmento: TStringField
      DisplayLabel = 'Seg.'
      FieldName = 'segmento'
      Size = 1
    end
    object qryretorno_pagfor_r3_segAtipo_de_movimento: TStringField
      DisplayLabel = 'Tp Mov.'
      FieldName = 'tipo_de_movimento'
      Size = 1
    end
    object qryretorno_pagfor_r3_segAdesc_tipo_de_movimento: TStringField
      FieldName = 'desc_tipo_de_movimento'
      Size = 200
    end
    object qryretorno_pagfor_r3_segAcd_ins_movto: TStringField
      DisplayLabel = 'Cd Ins Mov.'
      FieldName = 'cd_ins_movto'
      Size = 2
    end
    object qryretorno_pagfor_r3_segAdesc_cd_ins_movto: TStringField
      DisplayLabel = 'Desc. Cd Ins Mov.'
      FieldName = 'desc_cd_ins_movto'
      Size = 200
    end
    object qryretorno_pagfor_r3_segAcd_cam_comp: TStringField
      DisplayLabel = 'Cd Cam.'
      FieldName = 'cd_cam_comp'
      Size = 3
    end
    object qryretorno_pagfor_r3_segAdesc_cd_cam_comp: TStringField
      DisplayLabel = 'Desc. Cd Cam.'
      FieldName = 'desc_cd_cam_comp'
      Size = 200
    end
    object qryretorno_pagfor_r3_segAcod_banco_fav: TStringField
      DisplayLabel = 'Bco Fav.'
      FieldName = 'cod_banco_fav'
      Size = 3
    end
    object qryretorno_pagfor_r3_segAcod_ag_fav: TStringField
      DisplayLabel = 'Ag. Fav.'
      FieldName = 'cod_ag_fav'
      Size = 5
    end
    object qryretorno_pagfor_r3_segAdg_ver_ag_fav: TStringField
      DisplayLabel = 'DV Ag. Fav.'
      FieldName = 'dg_ver_ag_fav'
      Size = 1
    end
    object qryretorno_pagfor_r3_segAnr_da_conta_cor_fav: TStringField
      DisplayLabel = 'Cta Fav.'
      FieldName = 'nr_da_conta_cor_fav'
      Size = 12
    end
    object qryretorno_pagfor_r3_segAdg_ver_da_conta_fav: TStringField
      DisplayLabel = 'DV Cta Fav.'
      FieldName = 'dg_ver_da_conta_fav'
      Size = 1
    end
    object qryretorno_pagfor_r3_segAdg_ver_da_ag_e_cta_fav: TStringField
      DisplayLabel = 'DV Ag/Cta'
      FieldName = 'dg_ver_da_ag_e_cta_fav'
      Size = 1
    end
    object qryretorno_pagfor_r3_segAnm_fav: TStringField
      DisplayLabel = 'Nome Favorecido'
      FieldName = 'nm_fav'
      Size = 30
    end
    object qryretorno_pagfor_r3_segAnr_doc_cliente: TStringField
      DisplayLabel = 'Nr. Doc. Cliente'
      FieldName = 'nr_doc_cliente'
    end
    object qryretorno_pagfor_r3_segAdata_pagto: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dt Pagto'
      FieldName = 'data_pagto'
      EditMask = '99/99/9999;1; '
    end
    object qryretorno_pagfor_r3_segAtp_moeda: TStringField
      DisplayLabel = 'Tp Moeda'
      FieldName = 'tp_moeda'
      Size = 3
    end
    object qryretorno_pagfor_r3_segAqtdade_moeda: TStringField
      DisplayLabel = 'Qtdade Moeda'
      FieldName = 'qtdade_moeda'
      Size = 10
    end
    object qryretorno_pagfor_r3_segAvlr_pagto: TFloatField
      DisplayLabel = 'Vlr Pagto'
      FieldName = 'vlr_pagto'
      DisplayFormat = '0.00'
    end
    object qryretorno_pagfor_r3_segAnro_docto_banco: TStringField
      DisplayLabel = 'Doc. Banco'
      FieldName = 'nro_docto_banco'
    end
    object qryretorno_pagfor_r3_segAdt_real_pagto: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dt Real Pgto'
      FieldName = 'dt_real_pagto'
      EditMask = '99/99/9999;1; '
    end
    object qryretorno_pagfor_r3_segAvlr_real_pagto: TFloatField
      DisplayLabel = 'Vlr Real Pagto'
      FieldName = 'vlr_real_pagto'
      DisplayFormat = '0.00'
    end
    object qryretorno_pagfor_r3_segAoutras_informacoes: TStringField
      DisplayLabel = 'Outras Inf.'
      FieldName = 'outras_informacoes'
      Size = 40
    end
    object qryretorno_pagfor_r3_segAfinalidade: TStringField
      DisplayLabel = 'Finalidade'
      FieldName = 'finalidade'
      Size = 2
    end
    object qryretorno_pagfor_r3_segAem_aviso_fav: TStringField
      DisplayLabel = 'Aviso Fav.'
      FieldName = 'em_aviso_fav'
      Size = 1
    end
    object qryretorno_pagfor_r3_segAdesc_em_aviso_fav: TStringField
      DisplayLabel = 'Desc. Aviso Fav.'
      FieldName = 'desc_em_aviso_fav'
      Size = 200
    end
    object qryretorno_pagfor_r3_segAoc_retorno: TStringField
      DisplayLabel = 'Oc. Retorno'
      FieldName = 'oc_retorno'
      Size = 10
    end
    object qryretorno_pagfor_r3_segAdesc_oc_retorno: TStringField
      DisplayLabel = 'Desc. Oc. Retorno'
      FieldName = 'desc_oc_retorno'
      Size = 200
    end
  end
  object dsrretorno_pagfor_r3_segB: TtecDataSource
    DataSet = qryretorno_pagfor_r3_segB
    Left = 224
    Top = 152
  end
  object qryretorno_pagfor_r3_segB: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 
      'registro0=registro0, Cod_do_Banco=Cod_do_Banco, Lote_de_Serv=Lot' +
      'e_de_Serv, Tp_de_Registro=Tp_de_Registro, Nr_Seq_Reg_Lote=Nr_Seq' +
      '_Reg_Lote'
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'SQL'
        ParamType = ptUnknown
        Value = 'false'
      end>
    Sql.Strings = (
      'select segB.*,'
      ''
      '       (select x.descricao'
      '        from'
      '        json_to_recordset('
      ''
      '         (select  cast(j_r_p.conteudo as json)'
      '          from json_retorno_pagfor j_r_p)'
      ''
      
        '         ) as x(tabela varchar(100), codigo varchar(100), descri' +
        'cao varchar(200))'
      
        '         where x.tabela = '#39'C'#243'digo de Hist'#243'rico para Cr'#233'dito'#39' and' +
        ' x.codigo = segB.Cod_Hist_Cred'
      '         ) as desc_Cod_Hist_Cred,'
      ''
      '       (select x.descricao'
      '        from'
      '        json_to_recordset('
      ''
      '         (select  cast(j_r_p.conteudo as json)'
      '          from json_retorno_pagfor j_r_p)'
      ''
      
        '         ) as x(tabela varchar(100), codigo varchar(100), descri' +
        'cao varchar(200))'
      
        '         where x.tabela = '#39'C'#243'digos de Ocorr'#234'ncia para Retorno'#39' a' +
        'nd x.codigo = segB.Oc_Retorno'
      '         ) as desc_Oc_Retorno'
      ''
      'from retorno_pagfor_r3_segb segB'
      'where true'
      '  and %SQL')
    RequestLive = True
    Left = 259
    Top = 168
    object qryretorno_pagfor_r3_segBregistro0: TLargeintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'registro0'
    end
    object qryretorno_pagfor_r3_segBcod_do_banco: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'cod_do_banco'
      Size = 3
    end
    object qryretorno_pagfor_r3_segBlote_de_serv: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'lote_de_serv'
      Size = 4
    end
    object qryretorno_pagfor_r3_segBtp_de_registro: TStringField
      DisplayLabel = 'Tp Reg.'
      FieldName = 'tp_de_registro'
      Size = 1
    end
    object qryretorno_pagfor_r3_segBnr_seq_reg_lote: TStringField
      DisplayLabel = 'Seq. Lote'
      FieldName = 'nr_seq_reg_lote'
      Size = 5
    end
    object qryretorno_pagfor_r3_segBsegmento: TStringField
      DisplayLabel = 'Seg.'
      FieldName = 'segmento'
      Size = 1
    end
    object qryretorno_pagfor_r3_segBtp_de_inso_fav: TStringField
      DisplayLabel = 'Tp Ins. Fav.'
      FieldName = 'tp_de_inso_fav'
      Size = 1
    end
    object qryretorno_pagfor_r3_segBcnpj_cpf_fav: TStringField
      DisplayLabel = 'CNPJ Fav.'
      FieldName = 'cnpj_cpf_fav'
      Size = 14
    end
    object qryretorno_pagfor_r3_segBlogradouro_fav: TStringField
      DisplayLabel = 'Log. Fav.'
      FieldName = 'logradouro_fav'
      Size = 30
    end
    object qryretorno_pagfor_r3_segBnr_local_fav: TStringField
      DisplayLabel = 'Nr Loc. Fav.'
      FieldName = 'nr_local_fav'
      Size = 5
    end
    object qryretorno_pagfor_r3_segBcompl_fav: TStringField
      DisplayLabel = 'Compl. Fav.'
      FieldName = 'compl_fav'
      Size = 15
    end
    object qryretorno_pagfor_r3_segBbairro_fav: TStringField
      DisplayLabel = 'Bairro Fav.'
      FieldName = 'bairro_fav'
      Size = 15
    end
    object qryretorno_pagfor_r3_segBcidade_fav: TStringField
      DisplayLabel = 'Cidade Fav.'
      FieldName = 'cidade_fav'
    end
    object qryretorno_pagfor_r3_segBcep_fav: TStringField
      DisplayLabel = 'CEP Fav.'
      FieldName = 'cep_fav'
      Size = 8
    end
    object qryretorno_pagfor_r3_segBestado_fav: TStringField
      DisplayLabel = 'UF Fav.'
      FieldName = 'estado_fav'
      Size = 2
    end
    object qryretorno_pagfor_r3_segBdata_vencto: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dt Vencto'
      FieldName = 'data_vencto'
      EditMask = '99/99/9999;1; '
    end
    object qryretorno_pagfor_r3_segBvlr_doc: TFloatField
      DisplayLabel = 'Vlr Doc.'
      FieldName = 'vlr_doc'
      DisplayFormat = '0.00'
    end
    object qryretorno_pagfor_r3_segBvlr_abat: TFloatField
      DisplayLabel = 'Vlr Abatimento'
      FieldName = 'vlr_abat'
      DisplayFormat = '0.00'
    end
    object qryretorno_pagfor_r3_segBvlr_desconto: TFloatField
      DisplayLabel = 'Vlr Desconto'
      FieldName = 'vlr_desconto'
      DisplayFormat = '0.00'
    end
    object qryretorno_pagfor_r3_segBvlr_mora: TFloatField
      DisplayLabel = 'Vlr Mora'
      FieldName = 'vlr_mora'
      DisplayFormat = '0.00'
    end
    object qryretorno_pagfor_r3_segBvlr_multa: TFloatField
      DisplayLabel = 'Vlr Multa'
      FieldName = 'vlr_multa'
      DisplayFormat = '0.00'
    end
    object qryretorno_pagfor_r3_segBhora_env_ted: TTimeField
      Alignment = taCenter
      DisplayLabel = 'Hora Envio Ted'
      FieldName = 'hora_env_ted'
      EditMask = '99:99;1; '
    end
    object qryretorno_pagfor_r3_segBcod_hist_cred: TStringField
      DisplayLabel = 'Cd H Cred'
      FieldName = 'cod_hist_cred'
      Size = 4
    end
    object qryretorno_pagfor_r3_segBdesc_cod_hist_cred: TStringField
      FieldName = 'desc_cod_hist_cred'
      Size = 200
    end
    object qryretorno_pagfor_r3_segBoc_retorno: TStringField
      DisplayLabel = 'Oc. Ret.'
      FieldName = 'oc_retorno'
      Size = 10
    end
    object qryretorno_pagfor_r3_segBdesc_oc_retorno: TStringField
      FieldName = 'desc_oc_retorno'
      Size = 200
    end
  end
  object dsrretorno_pagfor_r3_segJ: TtecDataSource
    DataSet = qryretorno_pagfor_r3_segJ
    Left = 74
    Top = 290
  end
  object qryretorno_pagfor_r3_segJ: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryretorno_pagfor_r3_segJAfterOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'SQL'
        ParamType = ptUnknown
        Value = 'true'
      end>
    Sql.Strings = (
      'select segj.*,'
      ''
      '       (select x.descricao'
      '        from'
      '        json_to_recordset('
      ''
      '         (select  cast(j_r_p.conteudo as json)'
      '          from json_retorno_pagfor j_r_p)'
      ''
      
        '         ) as x(tabela varchar(100), codigo varchar(100), descri' +
        'cao varchar(200))'
      
        '         where x.tabela = '#39'Tipo de Movimento'#39' and x.codigo = seg' +
        'J.Tipo_de_Movimento'
      '         ) as desc_Tipo_de_Movimento,'
      ''
      ''
      '       (select x.descricao'
      '        from'
      '        json_to_recordset('
      ''
      '         (select  cast(j_r_p.conteudo as json)'
      '          from json_retorno_pagfor j_r_p)'
      ''
      
        '         ) as x(tabela varchar(100), codigo varchar(100), descri' +
        'cao varchar(200))'
      
        '         where x.tabela = '#39'C'#243'digo da Instru'#231#227'o para Movimento'#39' a' +
        'nd x.codigo = segJ.cd_Ins_Movto'
      '         ) as desc_cd_Ins_Movto,'
      ''
      ''
      '       (select x.descricao'
      '        from'
      '        json_to_recordset('
      ''
      '         (select  cast(j_r_p.conteudo as json)'
      '          from json_retorno_pagfor j_r_p)'
      ''
      
        '         ) as x(tabela varchar(100), codigo varchar(100), descri' +
        'cao varchar(200))'
      
        '         where x.tabela = '#39'C'#243'digo da Moeda'#39' and x.codigo = segJ.' +
        'Cd_da_Moeda'
      '         ) as desc_Cd_da_Moeda,'
      ''
      '       (select x.descricao'
      '        from'
      '        json_to_recordset('
      ''
      '         (select  cast(j_r_p.conteudo as json)'
      '          from json_retorno_pagfor j_r_p)'
      ''
      
        '         ) as x(tabela varchar(100), codigo varchar(100), descri' +
        'cao varchar(200))'
      
        '         where x.tabela = '#39'C'#243'digos de Ocorr'#234'ncia para Retorno'#39' a' +
        'nd x.codigo = segJ.Oc_Retorno'
      '         ) as desc_Oc_Retorno,'
      ''
      '         seg.pagfor'
      ''
      'from retorno_pagfor_r3_segj segJ'
      '     natural join retorno_pagfor_r3_segmentos seg'
      ''
      'where true'
      '  and %SQL')
    RequestLive = True
    Left = 106
    Top = 306
    object qryretorno_pagfor_r3_segJpagfor: TLargeintField
      DisplayLabel = 'PagFor'
      FieldName = 'pagfor'
    end
    object qryretorno_pagfor_r3_segJregistro0: TLargeintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'registro0'
      Required = True
    end
    object qryretorno_pagfor_r3_segJcod_do_banco: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'cod_do_banco'
      Required = True
      Size = 3
    end
    object qryretorno_pagfor_r3_segJlote_de_serv: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'lote_de_serv'
      Required = True
      Size = 4
    end
    object qryretorno_pagfor_r3_segJtp_de_registro: TStringField
      DisplayLabel = 'Tp Reg.'
      FieldName = 'tp_de_registro'
      Required = True
      Size = 1
    end
    object qryretorno_pagfor_r3_segJnr_seq_reg_lote: TStringField
      DisplayLabel = 'Seq. Lote'
      FieldName = 'nr_seq_reg_lote'
      Required = True
      Size = 5
    end
    object qryretorno_pagfor_r3_segJsegmento: TStringField
      DisplayLabel = 'Seg.'
      FieldName = 'segmento'
      Size = 1
    end
    object qryretorno_pagfor_r3_segJtipo_de_movimento: TStringField
      DisplayLabel = 'Tp Mov.'
      FieldName = 'tipo_de_movimento'
      Size = 1
    end
    object qryretorno_pagfor_r3_segJdesc_tipo_de_movimento: TStringField
      DisplayLabel = 'Desc. Tp Mov.'
      FieldName = 'desc_tipo_de_movimento'
      Size = 200
    end
    object qryretorno_pagfor_r3_segJcd_ins_movto: TStringField
      DisplayLabel = 'Ins. Movto'
      FieldName = 'cd_ins_movto'
      Size = 2
    end
    object qryretorno_pagfor_r3_segJdesc_cd_ins_movto: TStringField
      DisplayLabel = 'Desc. Ins. Movto'
      FieldName = 'desc_cd_ins_movto'
      Size = 200
    end
    object qryretorno_pagfor_r3_segJcod_de_barras: TStringField
      DisplayLabel = 'C'#243'digo de Barras'
      FieldName = 'cod_de_barras'
      Size = 44
    end
    object qryretorno_pagfor_r3_segJnome_do_cedente: TStringField
      DisplayLabel = 'Nome do Cedente'
      FieldName = 'nome_do_cedente'
      Size = 30
    end
    object qryretorno_pagfor_r3_segJdt_vencto: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dt Vencto'
      FieldName = 'dt_vencto'
      EditMask = '99/99/9999;1; '
    end
    object qryretorno_pagfor_r3_segJvlr_nominal: TFloatField
      DisplayLabel = 'Vlr Nominal'
      FieldName = 'vlr_nominal'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryretorno_pagfor_r3_segJvlr_desconto: TFloatField
      DisplayLabel = 'Vlr Desconto'
      FieldName = 'vlr_desconto'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryretorno_pagfor_r3_segJvlr_multajuros: TFloatField
      DisplayLabel = 'Vlr Multa/Juros'
      FieldName = 'vlr_multajuros'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryretorno_pagfor_r3_segJdata_pagto: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dt Pagto'
      FieldName = 'data_pagto'
      EditMask = '99/99/9999;1; '
    end
    object qryretorno_pagfor_r3_segJvlr_pagto: TFloatField
      DisplayLabel = 'Vlr Pagto'
      FieldName = 'vlr_pagto'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryretorno_pagfor_r3_segJqt_moeda: TFloatField
      DisplayLabel = 'Qt Moeda'
      FieldName = 'qt_moeda'
      DisplayFormat = '0.00'
    end
    object qryretorno_pagfor_r3_segJnr_doc_cliente: TStringField
      DisplayLabel = 'Nr Doc cliente'
      FieldName = 'nr_doc_cliente'
    end
    object qryretorno_pagfor_r3_segJnro_docto_banco: TStringField
      DisplayLabel = 'Nr Doc Banco'
      FieldName = 'nro_docto_banco'
    end
    object qryretorno_pagfor_r3_segJcd_da_moeda: TStringField
      DisplayLabel = 'Cd da Moeda'
      FieldName = 'cd_da_moeda'
      Size = 2
    end
    object qryretorno_pagfor_r3_segJdesc_cd_da_moeda: TStringField
      DisplayLabel = 'Desc. Cd da Moeda'
      FieldName = 'desc_cd_da_moeda'
      Size = 200
    end
    object qryretorno_pagfor_r3_segJoc_retorno: TStringField
      DisplayLabel = 'Oc Retorno'
      FieldName = 'oc_retorno'
      Size = 10
    end
    object qryretorno_pagfor_r3_segJdesc_oc_retorno: TStringField
      DisplayLabel = 'Desc. Oc Retorno'
      FieldName = 'desc_oc_retorno'
      Size = 200
    end
  end
  object dsrRetorno_pagfor_r3_segN: TtecDataSource
    DataSet = qryRetorno_pagfor_r3_segN
    Left = 74
    Top = 354
  end
  object qryRetorno_pagfor_r3_segN: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryRetorno_pagfor_r3_segNAfterOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'SQL'
        ParamType = ptUnknown
        Value = 'true'
      end>
    Sql.Strings = (
      'select segN.*,'
      ''
      '       (select x.descricao'
      '        from'
      '        json_to_recordset('
      ''
      '         (select  cast(j_r_p.conteudo as json)'
      '          from json_retorno_pagfor j_r_p)'
      ''
      
        '         ) as x(tabela varchar(100), codigo varchar(100), descri' +
        'cao varchar(200))'
      
        '         where x.tabela = '#39'Tipo de Movimento'#39' and x.codigo = seg' +
        'N.Tipo_de_Movimento'
      '         ) as desc_Tipo_de_Movimento,'
      ''
      '       (select x.descricao'
      '        from'
      '        json_to_recordset('
      ''
      '         (select  cast(j_r_p.conteudo as json)'
      '          from json_retorno_pagfor j_r_p)'
      ''
      
        '         ) as x(tabela varchar(100), codigo varchar(100), descri' +
        'cao varchar(200))'
      
        '         where x.tabela = '#39'C'#243'digo da Instru'#231#227'o para Movimento'#39' a' +
        'nd x.codigo = segN.cd_Ins_Movto'
      '         ) as desc_cd_Ins_Movto,'
      ''
      '       (select x.descricao'
      '        from'
      '        json_to_recordset('
      ''
      '         (select  cast(j_r_p.conteudo as json)'
      '          from json_retorno_pagfor j_r_p)'
      ''
      
        '         ) as x(tabela varchar(100), codigo varchar(100), descri' +
        'cao varchar(200))'
      
        '         where x.tabela = '#39'C'#243'digos de Ocorr'#234'ncia para Retorno'#39' a' +
        'nd x.codigo = segN.Oc_Retorno'
      '         ) as desc_Oc_Retorno,'
      ''
      '       seg.pagfor  '
      ''
      ''
      ''
      'from retorno_pagfor_r3_segn  segN'
      '     natural join retorno_pagfor_r3_segmentos seg'
      ''
      'where true'
      '  and %SQL')
    RequestLive = True
    Left = 106
    Top = 370
    object qryRetorno_pagfor_r3_segNpagfor: TLargeintField
      DisplayLabel = 'PagFor'
      FieldName = 'pagfor'
    end
    object qryRetorno_pagfor_r3_segNregistro0: TLargeintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'registro0'
      Required = True
    end
    object qryRetorno_pagfor_r3_segNcod_do_banco: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'cod_do_banco'
      Required = True
      Size = 3
    end
    object qryRetorno_pagfor_r3_segNlote_de_serv: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'lote_de_serv'
      Required = True
      Size = 4
    end
    object qryRetorno_pagfor_r3_segNtp_de_registro: TStringField
      DisplayLabel = 'Tp Reg.'
      FieldName = 'tp_de_registro'
      Required = True
      Size = 1
    end
    object qryRetorno_pagfor_r3_segNnr_seq_reg_lote: TStringField
      DisplayLabel = 'Seq. Lote'
      FieldName = 'nr_seq_reg_lote'
      Required = True
      Size = 5
    end
    object qryRetorno_pagfor_r3_segNsegmento: TStringField
      DisplayLabel = 'Seg.'
      FieldName = 'segmento'
      Size = 1
    end
    object qryRetorno_pagfor_r3_segNtipo_de_movimento: TStringField
      DisplayLabel = 'Tp Movto'
      FieldName = 'tipo_de_movimento'
      Size = 1
    end
    object qryRetorno_pagfor_r3_segNdesc_tipo_de_movimento: TStringField
      DisplayLabel = 'Desc. Tp Movto'
      FieldName = 'desc_tipo_de_movimento'
      Size = 200
    end
    object qryRetorno_pagfor_r3_segNcd_ins_movto: TStringField
      DisplayLabel = 'Ins. Movto'
      FieldName = 'cd_ins_movto'
      Size = 2
    end
    object qryRetorno_pagfor_r3_segNdesc_cd_ins_movto: TStringField
      DisplayLabel = 'Desc. Ins. Movto'
      FieldName = 'desc_cd_ins_movto'
      Size = 200
    end
    object qryRetorno_pagfor_r3_segNnr_doc_cliente: TStringField
      DisplayLabel = 'Doc. Cliente'
      FieldName = 'nr_doc_cliente'
    end
    object qryRetorno_pagfor_r3_segNnro_docto_banco: TStringField
      DisplayLabel = 'Doc. Banco'
      FieldName = 'nro_docto_banco'
    end
    object qryRetorno_pagfor_r3_segNnm_contribuinte: TStringField
      DisplayLabel = 'Nome Contribuinte'
      FieldName = 'nm_contribuinte'
      Size = 30
    end
    object qryRetorno_pagfor_r3_segNdata_pagto: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dt Pagto'
      FieldName = 'data_pagto'
      EditMask = '99/99/9999;1; '
    end
    object qryRetorno_pagfor_r3_segNvlr_pagto: TFloatField
      DisplayLabel = 'Vlr Pagto'
      FieldName = 'vlr_pagto'
      DisplayFormat = '0.00'
    end
    object qryRetorno_pagfor_r3_segNinf_compl: TStringField
      DisplayLabel = 'Inf. Compl.'
      FieldName = 'inf_compl'
      Size = 120
    end
    object qryRetorno_pagfor_r3_segNoc_retorno: TStringField
      DisplayLabel = 'Oc. Retorno'
      FieldName = 'oc_retorno'
      Size = 10
    end
    object qryRetorno_pagfor_r3_segNdesc_oc_retorno: TStringField
      DisplayLabel = 'Desc. Oc. Retorno'
      FieldName = 'desc_oc_retorno'
      Size = 200
    end
  end
  object qryretorno_pagfor_trailer_tipo_9: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 'registro0=registro0'
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'SQL'
        ParamType = ptUnknown
        Value = 'false'
      end>
    Sql.Strings = (
      'select r9.*'
      'from retorno_pagfor_trailer_tipo_9 r9'
      'where true'
      '  and %SQL')
    RequestLive = True
    Left = 328
    Top = 608
    object qryretorno_pagfor_trailer_tipo_9registro0: TLargeintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'registro0'
    end
    object qryretorno_pagfor_trailer_tipo_9cod_do_banco: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'cod_do_banco'
      Size = 3
    end
    object qryretorno_pagfor_trailer_tipo_9lote_de_serv: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'lote_de_serv'
      Size = 4
    end
    object qryretorno_pagfor_trailer_tipo_9tp_de_registro: TStringField
      DisplayLabel = 'Tp. Reg.'
      FieldName = 'tp_de_registro'
      Size = 1
    end
    object qryretorno_pagfor_trailer_tipo_9qt_de_lotes: TIntegerField
      DisplayLabel = 'Qt. Lotes'
      FieldName = 'qt_de_lotes'
    end
    object qryretorno_pagfor_trailer_tipo_9qt_reg: TIntegerField
      DisplayLabel = 'Qt. Reg.'
      FieldName = 'qt_reg'
    end
  end
  object dsrretorno_pagfor_trailer_tipo_9: TtecDataSource
    DataSet = qryretorno_pagfor_trailer_tipo_9
    Left = 288
    Top = 592
  end
  object dsrRetorno_pagfor_r3_segO: TtecDataSource
    DataSet = qryRetorno_pagfor_r3_segO
    Left = 77
    Top = 410
  end
  object qryRetorno_pagfor_r3_segO: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryRetorno_pagfor_r3_segOAfterOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'SQL'
        ParamType = ptUnknown
        Value = 'true'
      end>
    Sql.Strings = (
      'select segO.*,'
      ''
      '       (select x.descricao'
      '        from'
      '        json_to_recordset('
      ''
      '         (select  cast(j_r_p.conteudo as json)'
      '          from json_retorno_pagfor j_r_p)'
      ''
      
        '         ) as x(tabela varchar(100), codigo varchar(100), descri' +
        'cao varchar(200))'
      
        '         where x.tabela = '#39'Tipo de Movimento'#39' and x.codigo = seg' +
        'O.Tipo_de_Movimento'
      '         ) as desc_Tipo_de_Movimento,'
      ''
      '       (select x.descricao'
      '        from'
      '        json_to_recordset('
      ''
      '         (select  cast(j_r_p.conteudo as json)'
      '          from json_retorno_pagfor j_r_p)'
      ''
      
        '         ) as x(tabela varchar(100), codigo varchar(100), descri' +
        'cao varchar(200))'
      
        '         where x.tabela = '#39'C'#243'digo da Instru'#231#227'o para Movimento'#39' a' +
        'nd x.codigo = segO.cd_Ins_Movto'
      '         ) as desc_cd_Ins_Movto,'
      ''
      '       (select x.descricao'
      '        from'
      '        json_to_recordset('
      ''
      '         (select  cast(j_r_p.conteudo as json)'
      '          from json_retorno_pagfor j_r_p)'
      ''
      
        '         ) as x(tabela varchar(100), codigo varchar(100), descri' +
        'cao varchar(200))'
      
        '         where x.tabela = '#39'C'#243'digos de Ocorr'#234'ncia para Retorno'#39' a' +
        'nd x.codigo = segO.Oc_Retorno'
      '         ) as desc_Oc_Retorno,'
      ''
      '       seg.pagfor  '
      ''
      ''
      'from retorno_pagfor_r3_sego segO'
      '     natural join retorno_pagfor_r3_segmentos seg'
      'where true'
      '  and %SQL')
    RequestLive = True
    Left = 109
    Top = 418
    object qryRetorno_pagfor_r3_segOpagfor: TLargeintField
      DisplayLabel = 'PagFor'
      FieldName = 'pagfor'
    end
    object qryRetorno_pagfor_r3_segOregistro0: TLargeintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'registro0'
      Required = True
    end
    object qryRetorno_pagfor_r3_segOcod_do_banco: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'cod_do_banco'
      Required = True
      Size = 3
    end
    object qryRetorno_pagfor_r3_segOlote_de_serv: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'lote_de_serv'
      Required = True
      Size = 4
    end
    object qryRetorno_pagfor_r3_segOtp_de_registro: TStringField
      DisplayLabel = 'Tp Reg.'
      FieldName = 'tp_de_registro'
      Required = True
      Size = 1
    end
    object qryRetorno_pagfor_r3_segOnr_seq_reg_lote: TStringField
      DisplayLabel = 'Seq. Lote'
      FieldName = 'nr_seq_reg_lote'
      Required = True
      Size = 5
    end
    object qryRetorno_pagfor_r3_segOsegmento: TStringField
      DisplayLabel = 'Seg.'
      FieldName = 'segmento'
      Size = 1
    end
    object qryRetorno_pagfor_r3_segOtipo_de_movimento: TStringField
      DisplayLabel = 'Tp Movto'
      FieldName = 'tipo_de_movimento'
      Size = 1
    end
    object qryRetorno_pagfor_r3_segOdesc_tipo_de_movimento: TStringField
      DisplayLabel = 'Desc. Tp Movto'
      FieldName = 'desc_tipo_de_movimento'
      Size = 200
    end
    object qryRetorno_pagfor_r3_segOcd_ins_movto: TStringField
      DisplayLabel = 'Ins. Mov.'
      FieldName = 'cd_ins_movto'
      Size = 2
    end
    object qryRetorno_pagfor_r3_segOdesc_cd_ins_movto: TStringField
      DisplayLabel = 'Desc. Ins. Mov.'
      FieldName = 'desc_cd_ins_movto'
      Size = 200
    end
    object qryRetorno_pagfor_r3_segOcd_barras: TStringField
      DisplayLabel = 'C'#243'digo de Barras'
      FieldName = 'cd_barras'
      Size = 44
    end
    object qryRetorno_pagfor_r3_segOnmconcess_orgaopub: TStringField
      DisplayLabel = 'Conc.Org.P'#250'bl.'
      FieldName = 'nmconcess_orgaopub'
      Size = 30
    end
    object qryRetorno_pagfor_r3_segOdt_vencto: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dt Vencto'
      FieldName = 'dt_vencto'
      EditMask = '99/99/9999;1; '
    end
    object qryRetorno_pagfor_r3_segOdata_pagto: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dt Pagto'
      FieldName = 'data_pagto'
      EditMask = '99/99/9999;1; '
    end
    object qryRetorno_pagfor_r3_segOvlr_pagto: TFloatField
      DisplayLabel = 'Vlr Pagto'
      FieldName = 'vlr_pagto'
      DisplayFormat = '0.00'
    end
    object qryRetorno_pagfor_r3_segOnr_doc_cliente: TStringField
      DisplayLabel = 'Doc. Cliente'
      FieldName = 'nr_doc_cliente'
    end
    object qryRetorno_pagfor_r3_segOnro_docto_banco: TStringField
      DisplayLabel = 'Doc. Banco'
      FieldName = 'nro_docto_banco'
    end
    object qryRetorno_pagfor_r3_segOoc_retorno: TStringField
      DisplayLabel = 'Oc. Retorno'
      FieldName = 'oc_retorno'
      Size = 10
    end
    object qryRetorno_pagfor_r3_segOdesc_oc_retorno: TStringField
      DisplayLabel = 'Desc. Oc. Retorno'
      FieldName = 'desc_oc_retorno'
      Size = 200
    end
  end
  object dsrRetorno_pagfor_r3_segW: TtecDataSource
    DataSet = qryRetorno_pagfor_r3_segW
    Left = 77
    Top = 466
  end
  object qryRetorno_pagfor_r3_segW: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 
      'registro0=registro0, Cod_do_Banco=Cod_do_Banco, Lote_de_Serv=Lot' +
      'e_de_Serv, Tp_de_Registro=Tp_de_Registro, Nr_Seq_Reg_Lote=Nr_Seq' +
      '_Reg_Lote'
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'SQL'
        ParamType = ptUnknown
        Value = 'false'
      end>
    Sql.Strings = (
      'select segW.*,'
      ''
      '       (select x.descricao'
      '        from'
      '        json_to_recordset('
      ''
      '         (select  cast(j_r_p.conteudo as json)'
      '          from json_retorno_pagfor j_r_p)'
      ''
      
        '         ) as x(tabela varchar(100), codigo varchar(100), descri' +
        'cao varchar(200))'
      
        '         where x.tabela = '#39'C'#243'digos de Ocorr'#234'ncia para Retorno'#39' a' +
        'nd x.codigo = segW.Oc_Retorno'
      '         ) as desc_Oc_Retorno'
      ''
      ''
      'from retorno_pagfor_r3_segw segW'
      'where true'
      '  and %SQL')
    RequestLive = True
    Left = 109
    Top = 482
    object qryRetorno_pagfor_r3_segWregistro0: TLargeintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'registro0'
      Required = True
    end
    object qryRetorno_pagfor_r3_segWcod_do_banco: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'cod_do_banco'
      Required = True
      Size = 3
    end
    object qryRetorno_pagfor_r3_segWlote_de_serv: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'lote_de_serv'
      Required = True
      Size = 4
    end
    object qryRetorno_pagfor_r3_segWtp_de_registro: TStringField
      DisplayLabel = 'Tp Reg.'
      FieldName = 'tp_de_registro'
      Required = True
      Size = 1
    end
    object qryRetorno_pagfor_r3_segWnr_seq_reg_lote: TStringField
      DisplayLabel = 'Seq. Lote'
      FieldName = 'nr_seq_reg_lote'
      Required = True
      Size = 5
    end
    object qryRetorno_pagfor_r3_segWsegmento: TStringField
      DisplayLabel = 'Seg.'
      FieldName = 'segmento'
      Size = 1
    end
    object qryRetorno_pagfor_r3_segWnr_seq_reg_compl: TStringField
      DisplayLabel = 'Seq. Compl.'
      FieldName = 'nr_seq_reg_compl'
      Size = 1
    end
    object qryRetorno_pagfor_r3_segWinf_1_e_2: TStringField
      DisplayLabel = 'Inf. 1 e 2'
      FieldName = 'inf_1_e_2'
      Size = 1
    end
    object qryRetorno_pagfor_r3_segWinf_compl_1: TStringField
      DisplayLabel = 'Inf. Compl. 1'
      FieldName = 'inf_compl_1'
      Size = 80
    end
    object qryRetorno_pagfor_r3_segWinf_compl_2: TStringField
      DisplayLabel = 'Inf. Compl 2'
      FieldName = 'inf_compl_2'
      Size = 80
    end
    object qryRetorno_pagfor_r3_segWinf_compl_trib: TStringField
      DisplayLabel = 'Inf. Compl. Trib.'
      FieldName = 'inf_compl_trib'
      Size = 50
    end
    object qryRetorno_pagfor_r3_segWoc_retorno: TStringField
      DisplayLabel = 'Oc. Retorno'
      FieldName = 'oc_retorno'
      Size = 10
    end
    object qryRetorno_pagfor_r3_segWdesc_oc_retorno: TStringField
      FieldName = 'desc_oc_retorno'
      Size = 200
    end
  end
  object dsrRetorno_pagfor_r3_segZ: TtecDataSource
    DataSet = qryRetorno_pagfor_r3_segZ
    Left = 269
    Top = 466
  end
  object qryRetorno_pagfor_r3_segZ: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 
      'registro0=registro0, Cod_do_Banco=Cod_do_Banco, Lote_de_Serv=Lot' +
      'e_de_Serv, Tp_de_Registro=Tp_de_Registro, Nr_Seq_Reg_Lote=Nr_Seq' +
      '_Reg_Lote'
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'SQL'
        ParamType = ptUnknown
        Value = 'false'
      end>
    Sql.Strings = (
      'select segZ.*,'
      ''
      '       (select x.descricao'
      '        from'
      '        json_to_recordset('
      ''
      '         (select  cast(j_r_p.conteudo as json)'
      '          from json_retorno_pagfor j_r_p)'
      ''
      
        '         ) as x(tabela varchar(100), codigo varchar(100), descri' +
        'cao varchar(200))'
      
        '         where x.tabela = '#39'C'#243'digos de Ocorr'#234'ncia para Retorno'#39' a' +
        'nd x.codigo = segZ.Oc_Retorno'
      '         ) as desc_Oc_Retorno'
      ''
      'from retorno_pagfor_r3_segz segZ'
      'where true'
      '  and %SQL')
    RequestLive = True
    Left = 301
    Top = 482
    object qryRetorno_pagfor_r3_segZregistro0: TLargeintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'registro0'
    end
    object qryRetorno_pagfor_r3_segZcod_do_banco: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'cod_do_banco'
      Size = 3
    end
    object qryRetorno_pagfor_r3_segZlote_de_serv: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'lote_de_serv'
      Size = 4
    end
    object qryRetorno_pagfor_r3_segZtp_de_registro: TStringField
      DisplayLabel = 'Tp Reg.'
      FieldName = 'tp_de_registro'
      Size = 1
    end
    object qryRetorno_pagfor_r3_segZnr_seq_reg_lote: TStringField
      DisplayLabel = 'Seq. Lote'
      FieldName = 'nr_seq_reg_lote'
      Size = 5
    end
    object qryRetorno_pagfor_r3_segZsegmento: TStringField
      DisplayLabel = 'Seg.'
      FieldName = 'segmento'
      Size = 1
    end
    object qryRetorno_pagfor_r3_segZaut_pagto: TStringField
      DisplayLabel = 'Aut. Pagto'
      FieldName = 'aut_pagto'
      Size = 64
    end
    object qryRetorno_pagfor_r3_segZprot_pagto: TStringField
      DisplayLabel = 'Prot. Pagto'
      FieldName = 'prot_pagto'
      Size = 25
    end
    object qryRetorno_pagfor_r3_segZoc_retorno: TStringField
      DisplayLabel = 'Oc. Retorno'
      FieldName = 'oc_retorno'
      Size = 10
    end
    object qryRetorno_pagfor_r3_segZdesc_oc_retorno: TStringField
      FieldName = 'desc_oc_retorno'
      Size = 200
    end
  end
  object qryretorno_pagfor_r0_proximocodigo: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      
        'select cast(nextval('#39'retorno_pagfor_r0_proximocodigo'#39') as intege' +
        'r) as codigo')
    RequestLive = False
    Left = 560
    Top = 176
    object qryretorno_pagfor_r0_proximocodigocodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object dsrretorno_pagfor_r0_Text: TtecDataSource
    DataSet = qryretorno_pagfor_r0_Text
    Left = 224
    Top = 8
  end
  object qryretorno_pagfor_r0_Text: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 'registro0=codigo'
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'SQL'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select r0.*'
      'from retorno_pagfor_r0 r0'
      'where true'
      '  and %SQL'
      ''
      '')
    RequestLive = True
    Left = 264
    Top = 24
    object LargeintField1: TLargeintField
      FieldName = 'codigo'
    end
    object qryretorno_pagfor_r0_Textconteudoarquivo: TMemoField
      FieldName = 'conteudoarquivo'
      BlobType = ftMemo
    end
  end
  object dsrretorno_pagfor_r3_segJ52: TtecDataSource
    DataSet = qryretorno_pagfor_r3_segJ52
    Left = 245
    Top = 298
  end
  object qryretorno_pagfor_r3_segJ52: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 
      'registro0=registro0, Cod_do_Banco=Cod_do_Banco, Lote_de_Serv=Lot' +
      'e_de_Serv, Tp_de_Registro=Tp_de_Registro, Nr_Seq_Reg_Lote=Nr_Seq' +
      '_Reg_Lote'
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'SQL'
        ParamType = ptUnknown
        Value = 'false'
      end>
    Sql.Strings = (
      'select segJ52.*'
      'from retorno_pagfor_r3_segj52 segJ52'
      'where true'
      '  and %SQL')
    RequestLive = True
    Left = 277
    Top = 314
    object qryretorno_pagfor_r3_segJ52registro0: TLargeintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'registro0'
    end
    object qryretorno_pagfor_r3_segJ52cod_do_banco: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'cod_do_banco'
      Size = 3
    end
    object qryretorno_pagfor_r3_segJ52lote_de_serv: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'lote_de_serv'
      Size = 4
    end
    object qryretorno_pagfor_r3_segJ52tp_de_registro: TStringField
      DisplayLabel = 'Tp Reg.'
      FieldName = 'tp_de_registro'
      Size = 1
    end
    object qryretorno_pagfor_r3_segJ52nr_seq_reg_lote: TStringField
      DisplayLabel = 'Seq. Lote'
      FieldName = 'nr_seq_reg_lote'
      Size = 5
    end
    object qryretorno_pagfor_r3_segJ52segmento: TStringField
      DisplayLabel = 'Seg.'
      FieldName = 'segmento'
      Size = 1
    end
    object qryretorno_pagfor_r3_segJ52cd_mov_rem: TStringField
      DisplayLabel = 'Cd Mov.'
      FieldName = 'cd_mov_rem'
      Size = 2
    end
    object qryretorno_pagfor_r3_segJ52id_reg_opc: TStringField
      DisplayLabel = 'Reg. op.'
      FieldName = 'id_reg_opc'
      Size = 2
    end
    object qryretorno_pagfor_r3_segJ52tpinsc_sacado: TStringField
      DisplayLabel = 'Tp Ins.Sacado'
      FieldName = 'tpinsc_sacado'
      Size = 1
    end
    object qryretorno_pagfor_r3_segJ52cnpj_cpf_sacado: TStringField
      DisplayLabel = 'Ins.Sacado'
      FieldName = 'cnpj_cpf_sacado'
      Size = 15
    end
    object qryretorno_pagfor_r3_segJ52nm_sacado: TStringField
      DisplayLabel = 'Nome Sacado'
      FieldName = 'nm_sacado'
      Size = 40
    end
    object qryretorno_pagfor_r3_segJ52tpinsc_cedente: TStringField
      DisplayLabel = 'Tp Ins.Cedente'
      FieldName = 'tpinsc_cedente'
      Size = 1
    end
    object qryretorno_pagfor_r3_segJ52cnpj_cpf_cedente: TStringField
      DisplayLabel = 'Ins.Cedente'
      FieldName = 'cnpj_cpf_cedente'
      Size = 15
    end
    object qryretorno_pagfor_r3_segJ52nm_cedente: TStringField
      DisplayLabel = 'Nome Cedente'
      FieldName = 'nm_cedente'
      Size = 40
    end
    object qryretorno_pagfor_r3_segJ52tpinsc_sacador: TStringField
      DisplayLabel = 'Tp Ins.Sacador'
      FieldName = 'tpinsc_sacador'
      Size = 1
    end
    object qryretorno_pagfor_r3_segJ52cnpj_cpf_sacador: TStringField
      DisplayLabel = 'Ins.Sacador'
      FieldName = 'cnpj_cpf_sacador'
      Size = 15
    end
    object qryretorno_pagfor_r3_segJ52nm_sacador: TStringField
      DisplayLabel = 'Nome Sacador'
      FieldName = 'nm_sacador'
      Size = 40
    end
  end
  object qryRetorno_pagfor_r3_segN1: TtecQuery
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
        Name = 'SQL'
        ParamType = ptUnknown
        Value = 'false'
      end>
    Sql.Strings = (
      'select segN1.*'
      'from retorno_pagfor_r3_segn1  segN1'
      'where true'
      '  and %SQL')
    RequestLive = True
    Left = 282
    Top = 386
    object qryRetorno_pagfor_r3_segN1registro0: TLargeintField
      FieldName = 'registro0'
    end
    object qryRetorno_pagfor_r3_segN1cod_do_banco: TStringField
      FieldName = 'cod_do_banco'
      Size = 3
    end
    object qryRetorno_pagfor_r3_segN1lote_de_serv: TStringField
      FieldName = 'lote_de_serv'
      Size = 4
    end
    object qryRetorno_pagfor_r3_segN1tp_de_registro: TStringField
      FieldName = 'tp_de_registro'
      Size = 1
    end
    object qryRetorno_pagfor_r3_segN1nr_seq_reg_lote: TStringField
      FieldName = 'nr_seq_reg_lote'
      Size = 5
    end
    object qryRetorno_pagfor_r3_segN1cd_receita_trib: TStringField
      FieldName = 'cd_receita_trib'
      Size = 6
    end
    object qryRetorno_pagfor_r3_segN1tp_id_contrib: TStringField
      FieldName = 'tp_id_contrib'
      Size = 2
    end
    object qryRetorno_pagfor_r3_segN1id_contrib: TStringField
      FieldName = 'id_contrib'
      Size = 14
    end
    object qryRetorno_pagfor_r3_segN1cd_id_trib: TStringField
      FieldName = 'cd_id_trib'
      Size = 2
    end
    object qryRetorno_pagfor_r3_segN1competencia: TStringField
      FieldName = 'competencia'
      Size = 6
    end
    object qryRetorno_pagfor_r3_segN1vlr_prev_pg_inss: TFloatField
      FieldName = 'vlr_prev_pg_inss'
      DisplayFormat = '0.00'
    end
    object qryRetorno_pagfor_r3_segN1vlr_out_ent: TFloatField
      FieldName = 'vlr_out_ent'
      DisplayFormat = '0.00'
    end
    object qryRetorno_pagfor_r3_segN1at_monetaria: TFloatField
      FieldName = 'at_monetaria'
      DisplayFormat = '0.00'
    end
  end
  object dsrRetorno_pagfor_r3_segN1: TtecDataSource
    DataSet = qryRetorno_pagfor_r3_segN1
    Left = 250
    Top = 370
  end
  object dsrRetorno_pagfor_r3_segN2: TtecDataSource
    DataSet = qryRetorno_pagfor_r3_segN2
    Left = 434
    Top = 370
  end
  object qryRetorno_pagfor_r3_segN2: TtecQuery
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
        Name = 'SQL'
        ParamType = ptUnknown
        Value = 'false'
      end>
    Sql.Strings = (
      'select segN2.*'
      'from retorno_pagfor_r3_segn2  segN2'
      'where true'
      '  and %SQL')
    RequestLive = True
    Left = 466
    Top = 386
    object qryRetorno_pagfor_r3_segN2registro0: TLargeintField
      FieldName = 'registro0'
    end
    object qryRetorno_pagfor_r3_segN2cod_do_banco: TStringField
      FieldName = 'cod_do_banco'
      Size = 3
    end
    object qryRetorno_pagfor_r3_segN2lote_de_serv: TStringField
      FieldName = 'lote_de_serv'
      Size = 4
    end
    object qryRetorno_pagfor_r3_segN2tp_de_registro: TStringField
      FieldName = 'tp_de_registro'
      Size = 1
    end
    object qryRetorno_pagfor_r3_segN2nr_seq_reg_lote: TStringField
      FieldName = 'nr_seq_reg_lote'
      Size = 5
    end
    object qryRetorno_pagfor_r3_segN2cd_receita_trib: TStringField
      FieldName = 'cd_receita_trib'
      Size = 6
    end
    object qryRetorno_pagfor_r3_segN2tp_id_contrib: TStringField
      FieldName = 'tp_id_contrib'
      Size = 2
    end
    object qryRetorno_pagfor_r3_segN2id_contrib: TStringField
      FieldName = 'id_contrib'
      Size = 14
    end
    object qryRetorno_pagfor_r3_segN2cd_id_trib: TStringField
      FieldName = 'cd_id_trib'
      Size = 2
    end
    object qryRetorno_pagfor_r3_segN2per_apuracao: TDateField
      Alignment = taCenter
      FieldName = 'per_apuracao'
      EditMask = '99/99/9999;1; '
    end
    object qryRetorno_pagfor_r3_segN2nr_ref: TStringField
      FieldName = 'nr_ref'
      Size = 17
    end
    object qryRetorno_pagfor_r3_segN2vlr_principal: TFloatField
      FieldName = 'vlr_principal'
      DisplayFormat = '0.00'
    end
    object qryRetorno_pagfor_r3_segN2vlr_multa: TFloatField
      FieldName = 'vlr_multa'
      DisplayFormat = '0.00'
    end
    object qryRetorno_pagfor_r3_segN2vlr_juros: TFloatField
      FieldName = 'vlr_juros'
      DisplayFormat = '0.00'
    end
    object qryRetorno_pagfor_r3_segN2dt_vencto: TDateField
      Alignment = taCenter
      FieldName = 'dt_vencto'
      EditMask = '99/99/9999;1; '
    end
  end
  object dsrRetorno_pagfor_r3_segN3: TtecDataSource
    DataSet = qryRetorno_pagfor_r3_segN3
    Left = 610
    Top = 370
  end
  object qryRetorno_pagfor_r3_segN3: TtecQuery
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
        Name = 'SQL'
        ParamType = ptUnknown
        Value = 'false'
      end>
    Sql.Strings = (
      'select segN3.*'
      'from retorno_pagfor_r3_segn3  segN3'
      'where true'
      '  and %SQL')
    RequestLive = True
    Left = 642
    Top = 386
    object qryRetorno_pagfor_r3_segN3registro0: TLargeintField
      FieldName = 'registro0'
    end
    object qryRetorno_pagfor_r3_segN3cod_do_banco: TStringField
      FieldName = 'cod_do_banco'
      Size = 3
    end
    object qryRetorno_pagfor_r3_segN3lote_de_serv: TStringField
      FieldName = 'lote_de_serv'
      Size = 4
    end
    object qryRetorno_pagfor_r3_segN3tp_de_registro: TStringField
      FieldName = 'tp_de_registro'
      Size = 1
    end
    object qryRetorno_pagfor_r3_segN3nr_seq_reg_lote: TStringField
      FieldName = 'nr_seq_reg_lote'
      Size = 5
    end
    object qryRetorno_pagfor_r3_segN3cd_receita_trib: TStringField
      FieldName = 'cd_receita_trib'
      Size = 6
    end
    object qryRetorno_pagfor_r3_segN3tp_id_contrib: TStringField
      FieldName = 'tp_id_contrib'
      Size = 2
    end
    object qryRetorno_pagfor_r3_segN3id_contrib: TStringField
      FieldName = 'id_contrib'
      Size = 14
    end
    object qryRetorno_pagfor_r3_segN3cd_id_trib: TStringField
      FieldName = 'cd_id_trib'
      Size = 2
    end
    object qryRetorno_pagfor_r3_segN3per_apuracao: TDateField
      Alignment = taCenter
      FieldName = 'per_apuracao'
      EditMask = '99/99/9999;1; '
    end
    object qryRetorno_pagfor_r3_segN3vlr_rec_bruta_acum: TFloatField
      FieldName = 'vlr_rec_bruta_acum'
      DisplayFormat = '0.00'
    end
    object qryRetorno_pagfor_r3_segN3perc_rec_bruta_acum: TFloatField
      FieldName = 'perc_rec_bruta_acum'
      DisplayFormat = '0.00'
    end
    object qryRetorno_pagfor_r3_segN3vlr_principal: TFloatField
      FieldName = 'vlr_principal'
      DisplayFormat = '0.00'
    end
    object qryRetorno_pagfor_r3_segN3vlr_multa: TFloatField
      FieldName = 'vlr_multa'
      DisplayFormat = '0.00'
    end
    object qryRetorno_pagfor_r3_segN3vlr_juros: TFloatField
      FieldName = 'vlr_juros'
      DisplayFormat = '0.00'
    end
  end
  object dsrRetorno_pagfor_r3_segN4: TtecDataSource
    DataSet = qryRetorno_pagfor_r3_segN4
    Left = 778
    Top = 370
  end
  object qryRetorno_pagfor_r3_segN4: TtecQuery
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
        Name = 'SQL'
        ParamType = ptUnknown
        Value = 'false'
      end>
    Sql.Strings = (
      'select segN4.*'
      'from retorno_pagfor_r3_segn4  segN4'
      'where true'
      '  and %SQL')
    RequestLive = True
    Left = 810
    Top = 386
    object qryRetorno_pagfor_r3_segN4registro0: TLargeintField
      FieldName = 'registro0'
    end
    object qryRetorno_pagfor_r3_segN4cod_do_banco: TStringField
      FieldName = 'cod_do_banco'
      Size = 3
    end
    object qryRetorno_pagfor_r3_segN4lote_de_serv: TStringField
      FieldName = 'lote_de_serv'
      Size = 4
    end
    object qryRetorno_pagfor_r3_segN4tp_de_registro: TStringField
      FieldName = 'tp_de_registro'
      Size = 1
    end
    object qryRetorno_pagfor_r3_segN4nr_seq_reg_lote: TStringField
      FieldName = 'nr_seq_reg_lote'
      Size = 5
    end
    object qryRetorno_pagfor_r3_segN4cd_receita_trib: TStringField
      FieldName = 'cd_receita_trib'
      Size = 6
    end
    object qryRetorno_pagfor_r3_segN4tp_id_contrib: TStringField
      FieldName = 'tp_id_contrib'
      Size = 2
    end
    object qryRetorno_pagfor_r3_segN4id_contrib: TStringField
      FieldName = 'id_contrib'
      Size = 14
    end
    object qryRetorno_pagfor_r3_segN4cd_id_trib: TStringField
      FieldName = 'cd_id_trib'
      Size = 2
    end
    object qryRetorno_pagfor_r3_segN4dt_vencto: TDateField
      Alignment = taCenter
      FieldName = 'dt_vencto'
      EditMask = '99/99/9999;1; '
    end
    object qryRetorno_pagfor_r3_segN4insest_cdmun_nrodecl: TStringField
      FieldName = 'insest_cdmun_nrodecl'
      Size = 12
    end
    object qryRetorno_pagfor_r3_segN4divativ_nretiq: TStringField
      FieldName = 'divativ_nretiq'
      Size = 13
    end
    object qryRetorno_pagfor_r3_segN4per_ref: TStringField
      FieldName = 'per_ref'
      Size = 6
    end
    object qryRetorno_pagfor_r3_segN4nrparcela: TStringField
      FieldName = 'nrparcela'
      Size = 13
    end
    object qryRetorno_pagfor_r3_segN4vlr_receita: TFloatField
      FieldName = 'vlr_receita'
      DisplayFormat = '0.00'
    end
    object qryRetorno_pagfor_r3_segN4vlr_juros: TFloatField
      FieldName = 'vlr_juros'
      DisplayFormat = '0.00'
    end
    object qryRetorno_pagfor_r3_segN4vlr_multa: TFloatField
      FieldName = 'vlr_multa'
      DisplayFormat = '0.00'
    end
  end
  object dsrretorno_pagfor_r3: TtecDataSource
    DataSet = qryretorno_pagfor_r3
    Left = 736
    Top = 16
  end
  object qryretorno_pagfor_r3: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryretorno_pagfor_r3AfterOpen
    AfterScroll = qryretorno_pagfor_r3AfterScroll
    OnCalcFields = qryretorno_pagfor_r3CalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'SQL'
        ParamType = ptUnknown
        Value = 'false'
      end>
    Sql.Strings = (
      'select sel.pagfor,'
      '       r1.Nr_da_Conta_Cor,'
      '       contas.filial,'
      ''
      '       (select codigo'
      '        from planocontas plc'
      '        where plc.codigo = (select c.contacontabil'
      '                            from contas c'
      
        '                            where c.conta = cast(r1.Nr_da_Conta_' +
        'Cor as integer))'
      '        ) as ContaContabil,'
      ''
      '       sel.registro0,'
      '       sel.cod_do_banco,'
      '       sel.lote_de_serv,'
      '       sel.tp_de_registro,'
      '       sel.nr_seq_reg_lote,'
      '       sel.segmento,'
      '       sel.tipo_de_movimento,'
      ''
      '       coalesce((select sum(d.valorpagto)'
      '                 from duplicatas d'
      '                 where d.pagfor = sel.pagfor),0) +'
      ''
      '       coalesce((select sum(d_pgf.valorpagto)'
      '                 from duplicatas_pagfor d_pgf'
      '                      left join duplicatas d'
      '                      on d_pgf.documentopag = d.documentopag'
      '                      and d_pgf.datavencto = d.datavencto'
      '                      and d_pgf.numero = d.numero'
      '                 where d_pgf.pagfor = sel.pagfor'
      '                   and d.pagfor is null),0) as TotalConciliado,'
      ''
      '       (select x.descricao'
      '        from'
      '        json_to_recordset('
      ''
      '         (select  cast(j_r_p.conteudo as json)'
      '          from json_retorno_pagfor j_r_p)'
      ''
      
        '         ) as x(tabela varchar(100), codigo varchar(100), descri' +
        'cao varchar(200))'
      
        '         where x.tabela = '#39'Tipo de Movimento'#39' and x.codigo = sel' +
        '.tipo_de_movimento'
      '         ) as desc_tipo_movto,'
      ''
      '       sel.cd_Ins_Movto,'
      '       '
      '       (select x.descricao'
      '        from'
      '        json_to_recordset('
      ''
      '         (select  cast(j_r_p.conteudo as json)'
      '          from json_retorno_pagfor j_r_p)'
      ''
      
        '         ) as x(tabela varchar(100), codigo varchar(100), descri' +
        'cao varchar(200))'
      
        '         where x.tabela = '#39'C'#243'digo da Instru'#231#227'o para Movimento'#39' a' +
        'nd x.codigo = sel.cd_Ins_Movto'
      '         ) as desc_ins_movto,'
      ''
      '        sel.identif_nome,'
      '        sel.identif_doc,'
      '        sel.Cod_de_Barras,'
      ''
      '        sel.dt_vencto,'
      '        sel.vlr_vencto,'
      '        sel.dt_pagto,'
      ''
      '        nullif(sel.vlr_desconto,0) as vlr_desconto,'
      '        nullif(sel.vlr_multajuros,0) as vlr_multajuros,'
      ''
      '        sel.vlr_pagto,'
      ''
      '        r1.Tp_de_Serv,'
      ''
      '       (select x.descricao'
      '        from'
      '        json_to_recordset('
      ''
      '         (select  cast(j_r_p.conteudo as json)'
      '          from json_retorno_pagfor j_r_p)'
      ''
      
        '         ) as x(tabela varchar(100), codigo varchar(100), descri' +
        'cao varchar(200))'
      
        '         where x.tabela = '#39'Tipo de Servi'#231'o FEBRABAN'#39' and x.codig' +
        'o = r1.Tp_de_Serv'
      '         ) as desc_Tp_de_Serv,'
      ''
      ''
      '        r1.Forma_Lancto,'
      ''
      '       (select x.descricao'
      '        from'
      '        json_to_recordset('
      ''
      '         (select  cast(j_r_p.conteudo as json)'
      '          from json_retorno_pagfor j_r_p)'
      ''
      
        '         ) as x(tabela varchar(100), codigo varchar(100), descri' +
        'cao varchar(200))'
      
        '         where x.tabela = '#39'Forma de Lan'#231'amento'#39' and x.codigo = r' +
        '1.Forma_Lancto'
      '         ) as desc_Forma_Lancto,'
      ''
      '        r1.Oc_Retorno,'
      ''
      '       (select x.descricao'
      '        from'
      '        json_to_recordset('
      ''
      '         (select  cast(j_r_p.conteudo as json)'
      '          from json_retorno_pagfor j_r_p)'
      ''
      
        '         ) as x(tabela varchar(100), codigo varchar(100), descri' +
        'cao varchar(200))'
      
        '         where x.tabela = '#39'C'#243'digos de Ocorr'#234'ncia para Retorno'#39' a' +
        'nd x.codigo = r1.Oc_Retorno'
      '         ) as desc_Oc_Retorno'
      ''
      ''
      'from'
      ''
      '('
      'select segmentos.pagfor,'
      '       segA.registro0,'
      '       segA.cod_do_banco,'
      '       segA.lote_de_serv,'
      '       segA.tp_de_registro,'
      '       segA.nr_seq_reg_lote,'
      '       segA.segmento,'
      '       segA.tipo_de_movimento,'
      '       segA.cd_Ins_Movto,'
      '       '
      '       /* INFORMA'#199#213'ES DO FAVORECIDO'
      '       segA.cd_cam_comp,'
      '       '
      '       (select x.descricao'
      '        from'
      '        json_to_recordset( '
      ''
      '         (select  cast(j_r_p.conteudo as json)'
      '          from json_retorno_pagfor j_r_p)'
      ''
      
        '         ) as x(tabela varchar(100), codigo varchar(100), descri' +
        'cao varchar(200))'
      
        '         where x.tabela = '#39'C'#243'digo da C'#226'mara Centralizadora'#39' and ' +
        'x.codigo = sel.cd_cam_comp'
      '         ) as desc_cam_comp,'
      ''
      '       sega.cod_banco_fav,'
      '       cod_banco_fav CHAR(3),'
      '       cod_ag_fav CHAR(5),'
      '       dg_ver_ag_fav CHAR(1),'
      '       nr_da_conta_cor_fav CHAR(12),'
      '       dg_ver_da_conta_fav CHAR(1),'
      '       dg_ver_da_ag_e_cta_fav CHAR(1),'
      '       nm_fav VARCHAR(30),'
      '       */'
      '       '
      '       '
      '  segA.nm_fav as identif_nome,'
      '  segA.nr_doc_cliente as identif_doc,'
      '  cast(null as varchar(44)) as Cod_de_Barras,'
      '  segA.data_pagto as dt_vencto,'
      '  segA.vlr_pagto as vlr_vencto,'
      '  segA.data_pagto as dt_pagto,'
      '  cast(null as numeric) as vlr_desconto,'
      '  cast(null as numeric) as vlr_multajuros,  '
      '  segA.vlr_pagto'
      ''
      ''
      '  '
      '  /*'
      '  nr_doc_cliente VARCHAR(20),'
      '  data_pagto DATE,'
      '  '
      '  tp_moeda VARCHAR(3),'
      '  qtdade_moeda VARCHAR(10),'
      '  vlr_pagto NUMERIC(13,2),'
      '  nro_docto_banco VARCHAR(20),'
      '  dt_real_pagto DATE,'
      '  vlr_real_pagto NUMERIC(13,2),'
      '  outras_informacoes VARCHAR(40),'
      '  finalidade VARCHAR(2),'
      '  em_aviso_fav VARCHAR(1),'
      '  oc_retorno VARCHAR(10),'
      '  */'
      ''
      'from ((retorno_pagfor_r3_segA segA'
      '      natural join retorno_pagfor_r3_segmentos segmentos)'
      ''
      '      join retorno_pagfor_r0 r0'
      '      on segA.registro0 = r0.codigo)'
      ''
      'Where true and %SQL'
      ''
      'union  all'
      ''
      'select segmentos.pagfor,'
      '       segG.registro0,'
      '       segG.cod_do_banco,'
      '       segG.lote_de_serv,'
      '       segG.tp_de_registro,'
      '       segG.nr_seq_reg_lote,'
      '       segG.segmento,'
      
        '       /*segA.tipo_de_movimento*/ cast(null as CHAR(1)) as tipo_' +
        'de_movimento,'
      
        '       /*segA.cd_Ins_Movto */ cast(null as CHAR(2)) as cd_Ins_Mo' +
        'vto,'
      ''
      '       segg.nome_do_cedente as identif_nome,'
      '       cast(segG.nr_doc_cob as varchar(20)) as identif_doc,'
      '       segG.Cod_de_Barras,'
      '       segG.dt_vencto,'
      '       segG.vlr_nominal as vlr_vencto,'
      '       cast(null as date) as dt_pagto,'
      '       cast(null as numeric) as vlr_desconto,'
      '       cast(null as numeric) as vlr_multajuros,'
      '       cast(null as numeric) as vlr_pagto'
      ''
      ''
      'from ((retorno_pagfor_r3_segg segG'
      '       natural join retorno_pagfor_r3_segmentos segmentos)'
      ''
      '       join retorno_pagfor_r0 r0'
      '       on segG.registro0 = r0.codigo)'
      ''
      
        'Where false and %SQL  /* Segmento contendo somente informa'#231#245'es d' +
        'o vencimento */   '
      ''
      'union all'
      ''
      'select segmentos.pagfor,'
      '       segJ.registro0,'
      '       segJ.cod_do_banco,'
      '       segJ.lote_de_serv,'
      '       segJ.tp_de_registro,'
      '       segJ.nr_seq_reg_lote,'
      '       segJ.segmento,'
      '       segJ.tipo_de_movimento,'
      '       segJ.cd_Ins_Movto,'
      '       segJ.nome_do_cedente as identif_nome,'
      '       segj.nr_doc_cliente as identif_doc,'
      '       segJ.Cod_de_Barras,'
      '       segJ.dt_vencto,'
      '       segJ.vlr_nominal as vlr_vencto,'
      '       segj.data_pagto as dt_pagto,'
      '       segJ.vlr_desconto,'
      '       segJ.vlr_multajuros,'
      '       segj.vlr_pagto'
      ''
      ''
      'from ((retorno_pagfor_r3_segj segJ'
      '       natural join retorno_pagfor_r3_segmentos segmentos)'
      ''
      '       join retorno_pagfor_r0 r0'
      '       on segJ.registro0 = r0.codigo)'
      ''
      'Where true and %SQL'
      ''
      'union all'
      ''
      'select segmentos.pagfor,'
      '       segN.registro0,'
      '       segN.cod_do_banco,'
      '       segN.lote_de_serv,'
      '       segN.tp_de_registro,'
      '       segN.nr_seq_reg_lote,'
      '       segN.segmento,'
      '       segN.tipo_de_movimento,'
      '       segN.cd_Ins_Movto,'
      ''
      '       segN.nm_contribuinte as identif_nome,'
      '       segN.nr_doc_cliente as identif_doc,'
      '       cast(null as varchar(44)) as Cod_de_Barras,'
      ''
      '       segN.data_pagto as dt_vencto,'
      '       segN1.vlr_prev_pg_inss as vlr_vencto,'
      '       segN.data_pagto as dt_pagto,'
      '       cast(null as numeric) as vlr_desconto,'
      '       cast(null as numeric) as vlr_multajuros,'
      '       segN.vlr_pagto'
      ''
      'from retorno_pagfor_r3_segn segN'
      '     natural join retorno_pagfor_r3_segn1 segN1'
      ''
      '     natural join retorno_pagfor_r3_segmentos segmentos'
      ''
      '     join retorno_pagfor_r0 r0'
      '     on segN.registro0 = r0.codigo'
      'Where true and %SQL'
      ''
      ''
      'union all'
      ''
      'select segmentos.pagfor,'
      '       segN.registro0,'
      '       segN.cod_do_banco,'
      '       segN.lote_de_serv,'
      '       segN.tp_de_registro,'
      '       segN.nr_seq_reg_lote,'
      '       segN.segmento,'
      '       segN.tipo_de_movimento,'
      '       segN.cd_Ins_Movto,'
      ''
      '       segN.nm_contribuinte as identif_nome,'
      '       segN.nr_doc_cliente as identif_doc,'
      '       cast(null as varchar(44)) as Cod_de_Barras,'
      ''
      '       segN2.dt_vencto,'
      '       segn2.vlr_principal as vlr_vencto,'
      '       segN.data_pagto as dt_pagto,'
      '       cast(null as numeric) as vlr_desconto,'
      
        '       (coalesce(segn2.vlr_multa,0.00) + coalesce(segn2.vlr_juro' +
        's,0.00)) as vlr_multajuros,'
      '       segN.vlr_pagto'
      ''
      'from retorno_pagfor_r3_segn segN'
      '     natural join retorno_pagfor_r3_segn2 segN2'
      '     natural join retorno_pagfor_r3_segmentos segmentos'
      '     join retorno_pagfor_r0 r0'
      '     on segN.registro0 = r0.codigo'
      'Where true and %SQL'
      ''
      'union all'
      ''
      'select segmentos.pagfor,'
      '       segN.registro0,'
      '       segN.cod_do_banco,'
      '       segN.lote_de_serv,'
      '       segN.tp_de_registro,'
      '       segN.nr_seq_reg_lote,'
      '       segN.segmento,'
      '       segN.tipo_de_movimento,'
      '       segN.cd_Ins_Movto,'
      ''
      '       segN.nm_contribuinte as identif_nome,'
      '       segN.nr_doc_cliente as identif_doc,'
      '       cast(null as varchar(44)) as Cod_de_Barras,'
      ''
      '       segN.data_pagto as dt_vencto,'
      '       segn3.vlr_principal as vlr_vencto,'
      '       segN.data_pagto as dt_pagto,'
      '       cast(null as numeric) as vlr_desconto,'
      
        '       (coalesce(segn3.vlr_multa,0.00) + coalesce(segn3.vlr_juro' +
        's,0.00)) as vlr_multajuros,'
      '       segN.vlr_pagto'
      ''
      'from retorno_pagfor_r3_segn segN'
      '     natural join retorno_pagfor_r3_segn3 segN3'
      '     natural join retorno_pagfor_r3_segmentos segmentos'
      '     join retorno_pagfor_r0 r0'
      '     on segN.registro0 = r0.codigo'
      'Where true and %SQL'
      ''
      'union all'
      ''
      'select segmentos.pagfor,'
      '       segN.registro0,'
      '       segN.cod_do_banco,'
      '       segN.lote_de_serv,'
      '       segN.tp_de_registro,'
      '       segN.nr_seq_reg_lote,'
      '       segN.segmento,'
      '       segN.tipo_de_movimento,'
      '       segN.cd_Ins_Movto,'
      ''
      '       segN.nm_contribuinte as identif_nome,'
      '       segN.nr_doc_cliente as identif_doc,'
      '       cast(null as varchar(44)) as Cod_de_Barras,'
      ''
      '       segN4.dt_vencto,'
      '       segn4.vlr_receita as vlr_vencto,'
      '       segN.data_pagto as dt_pagto,'
      '       cast(null as numeric) as vlr_desconto,'
      
        '       (coalesce(segn4.vlr_multa,0.00) + coalesce(segn4.vlr_juro' +
        's,0.00)) as vlr_multajuros,'
      '       segN.vlr_pagto'
      ''
      'from retorno_pagfor_r3_segn segN'
      '     natural join retorno_pagfor_r3_segn4 segN4'
      '     natural join retorno_pagfor_r3_segmentos segmentos'
      '     join retorno_pagfor_r0 r0'
      '     on segN.registro0 = r0.codigo'
      'Where true and %SQL'
      ''
      ''
      'union all'
      ''
      'select segmentos.pagfor,'
      '       segO.registro0,'
      '       segO.cod_do_banco,'
      '       segO.lote_de_serv,'
      '       segO.tp_de_registro,'
      '       segO.nr_seq_reg_lote,'
      '       segO.segmento,'
      '       segO.tipo_de_movimento,'
      '       segO.cd_Ins_Movto,'
      ''
      '       sego.nmconcess_orgaopub as identif_nome,'
      '       segO.nr_doc_cliente as identif_doc,'
      '       segO.cd_barras as Cod_de_Barras,'
      ''
      '       segO.dt_vencto,'
      '       segO.vlr_pagto as vlr_vencto,'
      '       segO.data_pagto as dt_pagto,'
      '       cast(null as numeric) as vlr_desconto,'
      '       cast(null as numeric) as vlr_multajuros,'
      '       segO.vlr_pagto'
      ''
      ''
      'from ((retorno_pagfor_r3_sego segO'
      '      natural join retorno_pagfor_r3_segmentos segmentos)'
      '      join retorno_pagfor_r0 r0'
      '      on segO.registro0 = r0.codigo)'
      'Where true and %SQL'
      ''
      ') as sel'
      '/*'
      '  join retorno_pagfor_r3_segmentos r3_seg'
      '  on sel.registro0 = r3_seg.registro0'
      '  and sel.cod_do_banco = r3_seg.cod_do_banco'
      '  and sel.lote_de_serv = r3_seg.lote_de_serv'
      '  and sel.nr_seq_reg_lote = r3_seg.nr_seq_reg_lote'
      '  and sel.segmento = r3_seg.segmento'
      '  */'
      ''
      '  join (retorno_pagfor_r1 r1'
      '        left join contas'
      '        on cast(r1.Nr_da_Conta_Cor as integer) = contas.conta)'
      '  on'
      '  sel.registro0 = r1.registro0 and'
      '  sel.Cod_do_Banco = r1.Cod_do_Banco and'
      '  sel.Lote_de_Serv = r1.Lote_de_Serv'
      ''
      '/*'
      ''
      ':datainicial'
      ':datafinal'
      ''
      '*/')
    RequestLive = True
    Left = 771
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end>
    object qryretorno_pagfor_r3registro0: TLargeintField
      FieldName = 'registro0'
    end
    object qryretorno_pagfor_r3cod_do_banco: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'cod_do_banco'
      Size = 3
    end
    object qryretorno_pagfor_r3lote_de_serv: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'lote_de_serv'
      Size = 4
    end
    object qryretorno_pagfor_r3tp_de_registro: TStringField
      DisplayLabel = 'TP'
      FieldName = 'tp_de_registro'
      Size = 1
    end
    object qryretorno_pagfor_r3nr_seq_reg_lote: TStringField
      DisplayLabel = 'Seq.'
      FieldName = 'nr_seq_reg_lote'
      Size = 5
    end
    object qryretorno_pagfor_r3segmento: TStringField
      DisplayLabel = 'Seg'
      FieldName = 'segmento'
      Size = 1
    end
    object qryretorno_pagfor_r3tipo_de_movimento: TStringField
      DisplayLabel = 'Tp Mov'
      FieldName = 'tipo_de_movimento'
      Size = 1
    end
    object qryretorno_pagfor_r3desc_tipo_movto: TStringField
      DisplayLabel = 'Descr. Tp Mov.'
      FieldName = 'desc_tipo_movto'
      Size = 200
    end
    object qryretorno_pagfor_r3cd_ins_movto: TStringField
      DisplayLabel = 'Ins. Mov.'
      FieldName = 'cd_ins_movto'
      Size = 2
    end
    object qryretorno_pagfor_r3desc_ins_movto: TStringField
      DisplayLabel = 'Desc. Ins. Mov.'
      FieldName = 'desc_ins_movto'
      Size = 200
    end
    object qryretorno_pagfor_r3identif_nome: TStringField
      DisplayLabel = 'Identif. Nome'
      FieldName = 'identif_nome'
      Size = 30
    end
    object qryretorno_pagfor_r3identif_doc: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'identif_doc'
    end
    object qryretorno_pagfor_r3cod_de_barras: TStringField
      DisplayLabel = 'C'#243'd. de Barras'
      DisplayWidth = 44
      FieldName = 'cod_de_barras'
      Size = 50
    end
    object qryretorno_pagfor_r3dt_vencto: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dt Vencto'
      FieldName = 'dt_vencto'
      EditMask = '99/99/9999;1; '
    end
    object qryretorno_pagfor_r3vlr_vencto: TFloatField
      DisplayLabel = 'Vlr Vencto'
      FieldName = 'vlr_vencto'
      DisplayFormat = '0.00'
    end
    object qryretorno_pagfor_r3dt_pagto: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dt Pagto'
      FieldName = 'dt_pagto'
      EditMask = '99/99/9999;1; '
    end
    object qryretorno_pagfor_r3vlr_desconto: TFloatField
      DisplayLabel = 'Vlr Descto'
      FieldName = 'vlr_desconto'
      DisplayFormat = '0.00'
    end
    object qryretorno_pagfor_r3vlr_multajuros: TFloatField
      DisplayLabel = 'Multa/Juros'
      FieldName = 'vlr_multajuros'
      DisplayFormat = '0.00'
    end
    object qryretorno_pagfor_r3vlr_pagto: TFloatField
      DisplayLabel = 'Vlr Pagto'
      FieldName = 'vlr_pagto'
      DisplayFormat = '0.00'
    end
    object qryretorno_pagfor_r3pagfor: TLargeintField
      DisplayLabel = 'PagFor'
      FieldName = 'pagfor'
    end
    object qryretorno_pagfor_r3tp_de_serv: TStringField
      DisplayLabel = 'Tp Serv.'
      FieldName = 'tp_de_serv'
      Size = 2
    end
    object qryretorno_pagfor_r3desc_tp_de_serv: TStringField
      DisplayLabel = 'Desc. Tp Serv.'
      FieldName = 'desc_tp_de_serv'
      Size = 200
    end
    object qryretorno_pagfor_r3forma_lancto: TStringField
      DisplayLabel = 'Forma Lancto'
      FieldName = 'forma_lancto'
      Size = 2
    end
    object qryretorno_pagfor_r3desc_forma_lancto: TStringField
      DisplayLabel = 'Desc. Forma Lancto'
      FieldName = 'desc_forma_lancto'
      Size = 200
    end
    object qryretorno_pagfor_r3oc_retorno: TStringField
      DisplayLabel = 'Oc Ret.'
      FieldName = 'oc_retorno'
      Size = 10
    end
    object qryretorno_pagfor_r3desc_oc_retorno: TStringField
      DisplayLabel = 'Desc. Oc Ret.'
      FieldName = 'desc_oc_retorno'
      Size = 200
    end
    object qryretorno_pagfor_r3totalconciliado: TFloatField
      DisplayLabel = 'Tot. Conciliado'
      FieldName = 'totalconciliado'
      DisplayFormat = '0.00'
    end
    object qryretorno_pagfor_r3SaldoConciliar: TCurrencyField
      DisplayLabel = 'Saldo a Conciliar'
      FieldKind = fkCalculated
      FieldName = 'SaldoConciliar'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryretorno_pagfor_r3nr_da_conta_cor: TStringField
      FieldName = 'nr_da_conta_cor'
      Size = 12
    end
    object qryretorno_pagfor_r3contacontabil: TIntegerField
      FieldName = 'contacontabil'
    end
    object qryretorno_pagfor_r3filial: TIntegerField
      FieldName = 'filial'
    end
  end
  object qryContas: TtecQuery
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
      'SELECT c.Banco,'
      '       c.Agencia,'
      '       c.Conta,'
      '       c.Digito,'
      '       c.Titular,'
      '       b.Sigla,'
      ''
      '       b.ModeloCheque,'
      '       a.Nome,'
      '       c.bancoreferencia,'
      '       c.convenio,'
      '       c.variacao_carteira,'
      '       formatacao_convenio,'
      '       formatacao_nosso_numero,'
      '       valor_isencao_taxa,'
      '       agenciareferencia,'
      '       cnpj_agencia_referencia,'
      '       cedente_nome,'
      '       codigo_singular,'
      '       c.tiporecebimento,'
      '       c.filial'
      ''
      ''
      'FROM   contas c JOIN Bancos b   ON c.Banco   = b.Codigo'
      '                JOIN Agencias a ON c.Banco   = a.Banco AND'
      '                                   c.Agencia = a.Codigo'
      ''
      'WHERE  c.Conta = :Conta'
      '')
    RequestLive = True
    Left = 739
    Top = 107
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Conta'
        ParamType = ptUnknown
      end>
    object qryContasBanco: TIntegerField
      FieldName = 'Banco'
      Required = True
      DisplayFormat = '0'
    end
    object qryContasAgencia: TIntegerField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'Agencia'
      Required = True
      DisplayFormat = '0'
    end
    object qryContasConta: TIntegerField
      FieldName = 'Conta'
      Required = True
      DisplayFormat = '0'
    end
    object qryContasDigito: TStringField
      DisplayLabel = 'D'#237'gito'
      FieldName = 'Digito'
      Required = True
      Size = 2
    end
    object qryContasTitular: TStringField
      FieldName = 'Titular'
      Size = 50
    end
    object qryContasSigla: TStringField
      FieldName = 'Sigla'
      Size = 10
    end
    object qryContasNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
    object qryContasModeloCheque: TIntegerField
      FieldName = 'ModeloCheque'
      DisplayFormat = '0'
    end
    object qryContasbancoreferencia: TStringField
      FieldName = 'bancoreferencia'
      Size = 3
    end
    object qryContasconvenio: TLargeintField
      FieldName = 'convenio'
    end
    object qryContasvariacao_carteira: TStringField
      FieldName = 'variacao_carteira'
      Size = 50
    end
    object qryContasformatacao_convenio: TStringField
      FieldName = 'formatacao_convenio'
      Size = 50
    end
    object qryContasformatacao_nosso_numero: TStringField
      FieldName = 'formatacao_nosso_numero'
      Size = 50
    end
    object qryContasvalor_isencao_taxa: TFloatField
      FieldName = 'valor_isencao_taxa'
      DisplayFormat = '0.00'
    end
    object qryContasagenciareferencia: TIntegerField
      FieldName = 'agenciareferencia'
      DisplayFormat = '0'
    end
    object qryContascnpj_agencia_referencia: TStringField
      FieldName = 'cnpj_agencia_referencia'
      Size = 14
    end
    object qryContascedente_nome: TStringField
      FieldName = 'cedente_nome'
      Size = 100
    end
    object qryContascodigo_singular: TLargeintField
      FieldName = 'codigo_singular'
    end
    object qryContastiporecebimento: TIntegerField
      FieldName = 'tiporecebimento'
    end
    object qryContasfilial: TIntegerField
      FieldName = 'filial'
    end
  end
  object dsrContas: TtecDataSource
    DataSet = qryContas
    Left = 772
    Top = 123
  end
  object qryFiliais: TtecQuery
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
      'Select  codigo, '
      '            nome,'
      '            inscricaoestadual,'
      '            cnpj'
      ''
      'From    filiais'
      'Where codigo=:codigo')
    RequestLive = True
    Left = 740
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryFiliaiscodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryFiliaisnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryFiliaisinscricaoestadual: TStringField
      FieldName = 'inscricaoestadual'
    end
    object qryFiliaiscnpj: TStringField
      FieldName = 'cnpj'
      Size = 14
    end
  end
  object dsrFiliais: TtecDataSource
    DataSet = qryFiliais
    Left = 770
    Top = 200
  end
  object ACBrPagFor: TACBrPagFor
    Configuracoes.Arquivos.PathSalvar = 'C:\Borland\Delphi7\Bin\'
    Left = 448
    Top = 208
  end
  object qryretorno_pagfor_r3_segmentos: TtecQuery
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
        Name = 'SQL'
        ParamType = ptUnknown
        Value = 'false'
      end>
    Sql.Strings = (
      'select seg.*'
      'from retorno_pagfor_r3_segmentos seg'
      'where true'
      '  and %SQL')
    RequestLive = True
    Left = 272
    Top = 96
    object qryretorno_pagfor_r3_segmentospagfor: TLargeintField
      FieldName = 'pagfor'
    end
    object qryretorno_pagfor_r3_segmentosregistro0: TLargeintField
      FieldName = 'registro0'
    end
    object qryretorno_pagfor_r3_segmentoscod_do_banco: TStringField
      FieldName = 'cod_do_banco'
      Size = 3
    end
    object qryretorno_pagfor_r3_segmentoslote_de_serv: TStringField
      FieldName = 'lote_de_serv'
      Size = 4
    end
    object qryretorno_pagfor_r3_segmentosnr_seq_reg_lote: TStringField
      FieldName = 'nr_seq_reg_lote'
      Size = 5
    end
    object qryretorno_pagfor_r3_segmentossegmento: TStringField
      FieldName = 'segmento'
      Size = 1
    end
  end
  object qryretorno_pagfor_r3_segmentos_proximo: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      
        'select cast(nextval('#39'retorno_pagfor_r3_segmentos_proximocodigo'#39')' +
        ' as integer) as codigo')
    RequestLive = False
    Left = 560
    Top = 240
    object qryretorno_pagfor_r3_segmentos_proximocodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object qryDuplicatasAux_: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryDuplicatasAfterOpen
    AfterPost = qryDuplicatasAfterPost
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select d.documentopag,'
      '       d.numero,'
      '       d.pagfor,'
      '       d.pagforG'
      ''
      'from duplicatas d'
      'where d.documentopag = :documentopag'
      ' and d.datavencto = :dataVencto'
      ' and d.numero = :numero'
      '')
    RequestLive = True
    Left = 488
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentopag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataVencto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end>
    object qryDuplicatasAux_documentopag: TIntegerField
      FieldName = 'documentopag'
      Required = True
    end
    object qryDuplicatasAux_numero: TIntegerField
      FieldName = 'numero'
      Required = True
    end
    object qryDuplicatasAux_pagfor: TIntegerField
      FieldName = 'pagfor'
    end
    object qryDuplicatasAux_pagforg: TIntegerField
      FieldName = 'pagforg'
    end
  end
  object qryretorno_pagfor_r3_G: TtecQuery
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
        Name = 'SQL'
        ParamType = ptUnknown
        Value = 'false'
      end>
    Sql.Strings = (
      'select segG.registro0'
      'from ((retorno_pagfor_r3_segg segG'
      '       natural join retorno_pagfor_r3_segmentos segmentos)'
      ''
      '       join retorno_pagfor_r0 r0'
      '       on segG.registro0 = r0.codigo)'
      ''
      
        'Where true and %SQL  /* Segmento contendo somente informa'#231#245'es do' +
        ' vencimento */'
      ''
      ''
      '/*'
      ''
      ':datainicial'
      ':datafinal'
      ''
      '*/')
    RequestLive = True
    Left = 835
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end>
    object qryretorno_pagfor_r3_Gregistro0: TLargeintField
      FieldName = 'registro0'
    end
  end
  object qryDuplicatas_PagFor: TtecQuery
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
      'select dp_pgf.*,'
      ''
      '       (select d.pagfor'
      '        from duplicatas d'
      '        where d.documentopag = dp_pgf.documentopag'
      '          and d.datavencto = dp_pgf.datavencto'
      '          and d.numero = dp_pgf.numero) as pagfor_duplicata,'
      ''
      ''
      '       (select d.datapagto'
      '        from duplicatas d'
      '        where d.documentopag = dp_pgf.documentopag'
      '          and d.datavencto = dp_pgf.datavencto'
      '          and d.numero = dp_pgf.numero) as datapgto_duplicata'
      ''
      ''
      'from duplicatas_pagfor dp_pgf'
      'where :Todas or'
      ' ('
      '     dp_pgf.documentopag = :documentopag'
      ' and dp_pgf.datavencto = :datavencto'
      ' and dp_pgf.numero = :numero'
      ' )')
    RequestLive = True
    Left = 616
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Todas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'documentopag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datavencto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end>
    object qryDuplicatas_PagFordocumentopag: TIntegerField
      FieldName = 'documentopag'
    end
    object qryDuplicatas_PagFornumero: TIntegerField
      FieldName = 'numero'
    end
    object qryDuplicatas_PagFordatavencto: TDateField
      FieldName = 'datavencto'
    end
    object qryDuplicatas_PagForvalorvencto: TFloatField
      FieldName = 'valorvencto'
    end
    object qryDuplicatas_PagForvalordesconto: TFloatField
      FieldName = 'valordesconto'
    end
    object qryDuplicatas_PagForobservacao: TStringField
      FieldName = 'observacao'
      Size = 1000
    end
    object qryDuplicatas_PagFordatapagto: TDateField
      FieldName = 'datapagto'
    end
    object qryDuplicatas_PagForvalorpagto: TFloatField
      FieldName = 'valorpagto'
    end
    object qryDuplicatas_PagForcontapagto: TIntegerField
      FieldName = 'contapagto'
    end
    object qryDuplicatas_PagForevento: TIntegerField
      FieldName = 'evento'
    end
    object qryDuplicatas_PagForcontacredito: TIntegerField
      FieldName = 'contacredito'
    end
    object qryDuplicatas_PagForfilialpagto: TIntegerField
      FieldName = 'filialpagto'
    end
    object qryDuplicatas_PagForusuario: TIntegerField
      FieldName = 'usuario'
    end
    object qryDuplicatas_PagFortipopagamento: TIntegerField
      FieldName = 'tipopagamento'
    end
    object qryDuplicatas_PagForpagfor: TIntegerField
      FieldName = 'pagfor'
    end
    object qryDuplicatas_PagForoperacao: TStringField
      FieldName = 'operacao'
      Size = 12
    end
    object qryDuplicatas_PagForpagfor_duplicata: TIntegerField
      FieldName = 'pagfor_duplicata'
    end
    object qryDuplicatas_PagFordatapgto_duplicata: TDateField
      FieldName = 'datapgto_duplicata'
    end
  end
  object qryDuplicatas_PagForSegG: TtecQuery
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
      'select dp_pgf.*,'
      ''
      '       (select d.pagforg'
      '        from duplicatas d'
      '        where d.documentopag = dp_pgf.documentopag'
      '          and d.datavencto = dp_pgf.datavencto'
      '          and d.numero = dp_pgf.numero) as pagforg_duplicata'
      ''
      'from duplicatas_pagforsegg dp_pgf'
      'where dp_pgf.documentopag = :documentopag'
      '  and dp_pgf.datavencto = :datavencto'
      '  and dp_pgf.numero = :numero'
      '')
    RequestLive = True
    Left = 616
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentopag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datavencto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end>
    object qryDuplicatas_PagForSegGdocumentopag: TIntegerField
      FieldName = 'documentopag'
    end
    object qryDuplicatas_PagForSegGnumero: TIntegerField
      FieldName = 'numero'
    end
    object qryDuplicatas_PagForSegGdatavencto: TDateField
      Alignment = taCenter
      FieldName = 'datavencto'
      EditMask = '99/99/9999;1; '
    end
    object qryDuplicatas_PagForSegGpagfor: TIntegerField
      FieldName = 'pagfor'
    end
    object qryDuplicatas_PagForSegGoperacao: TStringField
      FieldName = 'operacao'
      Size = 12
    end
    object qryDuplicatas_PagForSegGvalorvencto: TFloatField
      FieldName = 'valorvencto'
      DisplayFormat = '0.00'
    end
    object qryDuplicatas_PagForSegGvalordesconto: TFloatField
      FieldName = 'valordesconto'
      DisplayFormat = '0.00'
    end
    object qryDuplicatas_PagForSegGobservacao: TStringField
      FieldName = 'observacao'
      Size = 1000
    end
    object qryDuplicatas_PagForSegGdatapagto: TDateField
      Alignment = taCenter
      FieldName = 'datapagto'
      EditMask = '99/99/9999;1; '
    end
    object qryDuplicatas_PagForSegGvalorpagto: TFloatField
      FieldName = 'valorpagto'
      DisplayFormat = '0.00'
    end
    object qryDuplicatas_PagForSegGcontapagto: TIntegerField
      FieldName = 'contapagto'
    end
    object qryDuplicatas_PagForSegGevento: TIntegerField
      FieldName = 'evento'
    end
    object qryDuplicatas_PagForSegGcontacredito: TIntegerField
      FieldName = 'contacredito'
    end
    object qryDuplicatas_PagForSegGfilialpagto: TIntegerField
      FieldName = 'filialpagto'
    end
    object qryDuplicatas_PagForSegGusuario: TIntegerField
      FieldName = 'usuario'
    end
    object qryDuplicatas_PagForSegGtipopagamento: TIntegerField
      FieldName = 'tipopagamento'
    end
    object qryDuplicatas_PagForSegGpagforg_duplicata: TIntegerField
      FieldName = 'pagforg_duplicata'
    end
  end
  object qryAtualizacoes_Identif_Dupl_Pendentes: TtecQuery
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
      'SELECT'
      ' '
      '(select count(*)'
      'from duplicatas d'
      'where (d.documentopag, d.datavencto, d.numero, d.pagforg) in'
      
        '(select d_pfg.documentopag, d_pfg.datavencto, d_pfg.numero, d_pf' +
        'g.pagfor'
      ' from duplicatas_pagforsegg d_pfg'
      
        ' where d_pfg.operacao = '#39'Desconciliar'#39')) as Cancelamento_da_Iden' +
        'tificacao,'
      ''
      '(select count(*)'
      'from duplicatas d'
      'where d.pagforg is null and'
      '(d.documentopag, d.datavencto, d.numero) in'
      '(select d_pfg.documentopag, d_pfg.datavencto, d_pfg.numero'
      ' from duplicatas_pagforsegg d_pfg'
      ' where d_pfg.operacao = '#39'Conciliar'#39')) as Identificacao,'
      ''
      ''
      'coalesce((select string_agg(cast(d_pfg.pagfor as varchar),'#39','#39')'
      ' from duplicatas_pagforsegg d_pfg'
      '      join duplicatas d'
      '      on'
      '      d.documentopag = d_pfg.documentopag and'
      '      d.datavencto = d_pfg.datavencto and'
      '      d.numero = d_pfg.numero and'
      '      d.pagforg = d_pfg.pagfor'
      ''
      ' where d_pfg.operacao = '#39'Desconciliar'#39'),'#39'0'#39')||'#39','#39'||'
      ''
      ' COALESCE((select string_agg(cast(d_pfg.pagfor as varchar),'#39','#39')'
      ' from duplicatas_pagforsegg d_pfg'
      '      join duplicatas d'
      '      on'
      '      d.documentopag = d_pfg.documentopag and'
      '      d.datavencto = d_pfg.datavencto and'
      '      d.numero = d_pfg.numero'
      ''
      ' where d_pfg.operacao = '#39'Conciliar'#39
      '   and d.pagforg is null),'#39'0'#39') as agg_Identificacao,'
      ''
      ''
      ''
      ' '
      '(select count(*) '
      'from duplicatas d'
      'where (d.documentopag, d.datavencto, d.numero, d.pagfor) in'
      
        '(select d_pf.documentopag, d_pf.datavencto, d_pf.numero, d_pf.pa' +
        'gfor '
      ' from duplicatas_pagfor d_pf'
      
        ' where d_pf.operacao = '#39'Desconciliar'#39')) as Cancelamento_do_pagam' +
        'ento,'
      ' '
      ' '
      '(select count(*) '
      'from duplicatas d'
      'where d.pagfor is null and'
      '(d.documentopag, d.datavencto, d.numero) in'
      '(select d_pf.documentopag, d_pf.datavencto, d_pf.numero'
      ' from duplicatas_pagfor d_pf'
      ' where d_pf.operacao = '#39'Conciliar'#39')) as pagamento,'
      ' '
      'coalesce('
      '(select string_agg(cast(d.pagfor as varchar),'#39','#39') '
      'from duplicatas d'
      'where (d.documentopag, d.datavencto, d.numero, d.pagfor) in'
      
        '(select d_pf.documentopag, d_pf.datavencto, d_pf.numero, d_pf.pa' +
        'gfor '
      ' from duplicatas_pagfor d_pf'
      ' where d_pf.operacao = '#39'Desconciliar'#39')),'#39'0'#39')||'#39','#39'||'
      ''
      'coalesce('
      '(select string_agg(cast(d_pf.pagfor as varchar),'#39','#39') '
      'from duplicatas_pagfor d_pf '
      '     join duplicatas d'
      '     on d.documentopag = d_pf.documentopag '
      '     and d.datavencto = d_pf.datavencto '
      '     and d.numero = d_pf.numero      '
      ' where d_pf.operacao = '#39'Conciliar'#39
      '   and d.pagfor is null),'#39'0'#39') as agg_pagamento')
    RequestLive = False
    Left = 712
    Top = 256
    object qryAtualizacoes_Identif_Dupl_Pendentescancelamento_da_identificacao: TLargeintField
      FieldName = 'cancelamento_da_identificacao'
    end
    object qryAtualizacoes_Identif_Dupl_Pendentesidentificacao: TLargeintField
      FieldName = 'identificacao'
    end
    object qryAtualizacoes_Identif_Dupl_Pendentesagg_identificacao: TMemoField
      FieldName = 'agg_identificacao'
      BlobType = ftMemo
    end
    object qryAtualizacoes_Identif_Dupl_Pendentescancelamento_do_pagamento: TLargeintField
      FieldName = 'cancelamento_do_pagamento'
    end
    object qryAtualizacoes_Identif_Dupl_Pendentespagamento: TLargeintField
      FieldName = 'pagamento'
    end
    object qryAtualizacoes_Identif_Dupl_Pendentesagg_pagamento: TMemoField
      FieldName = 'agg_pagamento'
      BlobType = ftMemo
    end
  end
  object qryAtualizar_Identificacoes_Pendentes: TtecQuery
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
      'update duplicatas set pagforg = null,'
      '                      observacao = selecao.observacao'
      'from'
      '('
      ' select documentopag, datavencto, numero, observacao'
      ' from duplicatas_pagforsegg'
      ' where operacao='#39'Desconciliar'#39
      ') as selecao'
      'where duplicatas.documentopag = selecao.documentopag'
      '  and duplicatas.datavencto = selecao.datavencto'
      '  and duplicatas.numero = selecao.numero;'
      ''
      ''
      'update duplicatas set pagforg = selecao.pagfor,'
      '                      observacao = selecao.observacao'
      'from'
      '('
      ' select documentopag, datavencto, numero, pagfor, observacao'
      ' from duplicatas_pagforsegg'
      ' where operacao='#39'Conciliar'#39
      ''
      ') as selecao'
      'where duplicatas.documentopag = selecao.documentopag'
      '  and duplicatas.datavencto = selecao.datavencto'
      '  and duplicatas.numero = selecao.numero;'
      ''
      'delete from duplicatas_pagforsegg;'
      ''
      ''
      ''
      '')
    RequestLive = True
    Left = 744
    Top = 280
  end
  object qryAtualizar_Dupl_Pendentes: TtecQuery
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
      ''
      '/*'
      
        '   Atualizar o campo pagfor quando a duplicata j'#225' esta paga e n'#227 +
        'o h'#225' mudan'#231'a de'
      '   campos que fazem parte de movtosbancoseventos que seguem'
      '   datapagto'
      '   valorpagto'
      '   contapagto'
      ''
      ''
      
        '   Caso contr'#225'rio ser'#225' necess'#225'rio seguir as regras e fazer a qui' +
        'ta'#231#227'o via c'#243'digo,'
      '   desquitando e quitando novamente!'
      ''
      '*/'
      ''
      'update duplicatas set pagfor = selecao.pagfor,'
      '                      filialpagto = selecao.filialpagto,'
      '                      usuario = selecao.usuario,'
      '                      observacao = selecao.observacao'
      'from'
      '('
      ' select dp_pgf.documentopag,'
      '        dp_pgf.datavencto,'
      '        dp_pgf.numero,'
      ''
      '        dp_pgf.pagfor,'
      '        dp_pgf.filialpagto,'
      '        dp_pgf.usuario,'
      '        dp_pgf.observacao'
      ''
      ' from duplicatas_pagfor dp_pgf'
      '      join duplicatas d'
      '      on d.documentopag = dp_pgf.documentopag'
      '      and d.datavencto = dp_pgf.datavencto'
      '      and d.numero = dp_pgf.numero'
      ''
      ' where operacao='#39'Conciliar'#39' and'
      '   dp_pgf.datapagto = d.datapagto and'
      '   dp_pgf.valorpagto = d.valorpagto and'
      '   dp_pgf.contapagto = d.contapagto'
      ''
      ') as selecao'
      'where duplicatas.documentopag = selecao.documentopag'
      '  and duplicatas.datavencto = selecao.datavencto'
      '  and duplicatas.numero = selecao.numero;'
      ''
      'delete from duplicatas_pagfor'
      'where (documentopag, datavencto, numero, pagfor) in'
      ''
      '('
      ' select dp_pgf.documentopag,'
      '        dp_pgf.datavencto,'
      '        dp_pgf.numero,'
      '        dp_pgf.pagfor'
      ''
      ' from duplicatas_pagfor dp_pgf'
      '      join duplicatas d'
      '      on d.documentopag = dp_pgf.documentopag'
      '      and d.datavencto = dp_pgf.datavencto'
      '      and d.numero = dp_pgf.numero'
      ''
      ' where operacao='#39'Conciliar'#39' and'
      '   dp_pgf.datapagto = d.datapagto and'
      '   dp_pgf.valorpagto = d.valorpagto and'
      '   dp_pgf.contapagto = d.contapagto'
      ''
      ');')
    RequestLive = True
    Left = 784
    Top = 304
  end
end
