inherited dtmDadosNFe: TdtmDadosNFe
  OldCreateOrder = False
  Left = 404
  Top = 234
  Height = 521
  Width = 663
  object qrytrib_entrada_item_imposto: TtecQuery
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
      'select  pnp.codigonota,'
      '        pnp.produto,'
      '        pnp.numero,'
      ''
      
        '         /* as regras para defini'#231#227'o do cst, cclasstrib e vbs s'#227 +
        'o as mesmas, pode-se pegar'
      
        '           o cst e cclasstrib de um dos tr'#234's cbs, ibsuf ou ibsmu' +
        'n */'
      ''
      '        (select teii.codigo_cst'
      '         from trib_entrada_item_imposto  teii'
      '              join trib_imposto ti'
      '              on teii.id_imposto = ti.id_imposto'
      ''
      ''
      '         where pnp.codigonota =  teii.codigonota'
      '           and pnp.numero = teii.numero'
      '           and pnp.produto = teii.produto'
      '           and ti.codigo = '#39'CBS'#39') as codigo_cst_cbsibs,'
      ''
      '        (select teii.cclasstrib'
      '         from trib_entrada_item_imposto  teii'
      '              join trib_imposto ti'
      '              on teii.id_imposto = ti.id_imposto'
      ''
      '         where pnp.codigonota =  teii.codigonota'
      '           and pnp.numero = teii.numero'
      '           and pnp.produto = teii.produto'
      '           and ti.codigo = '#39'CBS'#39') as cclasstrib_cbsibs,'
      ''
      '        (select teii.vbc'
      '         from trib_entrada_item_imposto  teii'
      '              join trib_imposto ti'
      '              on teii.id_imposto = ti.id_imposto'
      ''
      '         where pnp.codigonota =  teii.codigonota'
      '           and pnp.numero = teii.numero'
      '           and pnp.produto = teii.produto'
      '           and ti.codigo = '#39'CBS'#39') as vbc_cbsibs,'
      ''
      ''
      '        (select teii.paliq'
      '         from trib_entrada_item_imposto  teii'
      '              join trib_imposto ti'
      '              on teii.id_imposto = ti.id_imposto'
      ''
      '         where pnp.codigonota =  teii.codigonota'
      '           and pnp.numero = teii.numero'
      '           and pnp.produto = teii.produto'
      '           and ti.codigo = '#39'CBS'#39') as paliq_cbs,'
      ''
      '        (select teii.vimposto'
      '         from trib_entrada_item_imposto  teii'
      '              join trib_imposto ti'
      '              on teii.id_imposto = ti.id_imposto'
      ''
      '         where pnp.codigonota =  teii.codigonota'
      '           and pnp.numero = teii.numero'
      '           and pnp.produto = teii.produto'
      '           and ti.codigo = '#39'CBS'#39') as vimposto_cbs,'
      ''
      '        (select teii.paliq'
      '         from trib_entrada_item_imposto  teii'
      '              join trib_imposto ti'
      '              on teii.id_imposto = ti.id_imposto'
      ''
      '         where pnp.codigonota =  teii.codigonota'
      '           and pnp.numero = teii.numero'
      '           and pnp.produto = teii.produto'
      '           and ti.codigo = '#39'IBSUF'#39') as paliq_ibsuf,'
      ''
      '        (select teii.vimposto'
      '         from trib_entrada_item_imposto  teii'
      '              join trib_imposto ti'
      '              on teii.id_imposto = ti.id_imposto'
      ''
      '         where pnp.codigonota =  teii.codigonota'
      '           and pnp.numero = teii.numero'
      '           and pnp.produto = teii.produto'
      '           and ti.codigo = '#39'IBSUF'#39') as vimposto_ibsuf,'
      ''
      '        (select teii.paliq'
      '         from trib_entrada_item_imposto  teii'
      '              join trib_imposto ti'
      '              on teii.id_imposto = ti.id_imposto'
      ''
      '         where pnp.codigonota =  teii.codigonota'
      '           and pnp.numero = teii.numero'
      '           and pnp.produto = teii.produto'
      '           and ti.codigo = '#39'IBSMUN'#39') as paliq_ibsmun,'
      ''
      '        (select teii.vimposto'
      '         from trib_entrada_item_imposto  teii'
      '              join trib_imposto ti'
      '              on teii.id_imposto = ti.id_imposto'
      ''
      '         where pnp.codigonota =  teii.codigonota'
      '           and pnp.numero = teii.numero'
      '           and pnp.produto = teii.produto'
      '           and ti.codigo = '#39'IBSMUN'#39') as vimposto_ibsmun'
      ''
      'from produtosnotaspag pnp'
      'where pnp.codigonota = :codigonota'
      '  and pnp.produto = :produto'
      '  and pnp.numero = :numero')
    RequestLive = False
    Left = 96
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigonota'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end>
    object qrytrib_entrada_item_impostocodigonota: TIntegerField
      FieldName = 'codigonota'
    end
    object qrytrib_entrada_item_impostoproduto: TLargeintField
      FieldName = 'produto'
    end
    object qrytrib_entrada_item_impostonumero: TIntegerField
      FieldName = 'numero'
    end
    object qrytrib_entrada_item_impostocodigo_cst_cbsibs: TStringField
      FieldName = 'codigo_cst_cbsibs'
      Size = 4
    end
    object qrytrib_entrada_item_impostocclasstrib_cbsibs: TStringField
      FieldName = 'cclasstrib_cbsibs'
      Size = 6
    end
    object qrytrib_entrada_item_impostovbc_cbsibs: TFloatField
      FieldName = 'vbc_cbsibs'
    end
    object qrytrib_entrada_item_impostopaliq_cbs: TFloatField
      FieldName = 'paliq_cbs'
    end
    object qrytrib_entrada_item_impostovimposto_cbs: TFloatField
      FieldName = 'vimposto_cbs'
    end
    object qrytrib_entrada_item_impostopaliq_ibsuf: TFloatField
      FieldName = 'paliq_ibsuf'
    end
    object qrytrib_entrada_item_impostovimposto_ibsuf: TFloatField
      FieldName = 'vimposto_ibsuf'
    end
    object qrytrib_entrada_item_impostopaliq_ibsmun: TFloatField
      FieldName = 'paliq_ibsmun'
    end
    object qrytrib_entrada_item_impostovimposto_ibsmun: TFloatField
      FieldName = 'vimposto_ibsmun'
    end
  end
  object dsrtrib_entrada_item_imposto: TtecDataSource
    DataSet = qrytrib_entrada_item_imposto
    Left = 208
    Top = 64
  end
  object qrytrib_saida_item_imposto: TtecQuery
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
      'select  pdf.dadofiscal,'
      '        pdf.produto,'
      '        pdf.numero,'
      ''
      
        '         /* as regras para defini'#231#227'o do cst, cclasstrib e vbs s'#227 +
        'o as mesmas, pode-se pegar'
      
        '           o cst e cclasstrib de um dos tr'#234's cbs, ibsuf ou ibsmu' +
        'n */'
      ''
      '        (select tsii.codigo_cst'
      '         from trib_saida_item_imposto  tsii'
      '              join trib_imposto ti'
      '              on tsii.id_imposto = ti.id_imposto'
      ''
      ''
      '         where pdf.dadofiscal =  tsii.dadofiscal'
      '           and pdf.numero = tsii.numero'
      '           and pdf.produto = tsii.produto'
      '           and ti.codigo = '#39'CBS'#39') as codigo_cst_cbsibs,'
      ''
      '        (select tsii.cclasstrib'
      '         from trib_saida_item_imposto  tsii'
      '              join trib_imposto ti'
      '              on tsii.id_imposto = ti.id_imposto'
      ''
      '         where pdf.dadofiscal =  tsii.dadofiscal'
      '           and pdf.numero = tsii.numero'
      '           and pdf.produto = tsii.produto'
      '           and ti.codigo = '#39'CBS'#39') as cclasstrib_cbsibs,'
      ''
      '        (select tsii.vbc'
      '         from trib_saida_item_imposto  tsii'
      '              join trib_imposto ti'
      '              on tsii.id_imposto = ti.id_imposto'
      ''
      '         where pdf.dadofiscal =  tsii.dadofiscal'
      '           and pdf.numero = tsii.numero'
      '           and pdf.produto = tsii.produto'
      '           and ti.codigo = '#39'CBS'#39') as vbc_cbsibs,'
      ''
      ''
      '        (select tsii.paliq'
      '         from trib_saida_item_imposto  tsii'
      '              join trib_imposto ti'
      '              on tsii.id_imposto = ti.id_imposto'
      ''
      '         where pdf.dadofiscal =  tsii.dadofiscal'
      '           and pdf.numero = tsii.numero'
      '           and pdf.produto = tsii.produto'
      '           and ti.codigo = '#39'CBS'#39') as paliq_cbs,'
      ''
      '        (select tsii.vimposto'
      '         from trib_saida_item_imposto  tsii'
      '              join trib_imposto ti'
      '              on tsii.id_imposto = ti.id_imposto'
      ''
      '         where pdf.dadofiscal =  tsii.dadofiscal'
      '           and pdf.numero = tsii.numero'
      '           and pdf.produto = tsii.produto'
      '           and ti.codigo = '#39'CBS'#39') as vimposto_cbs,'
      ''
      ''
      '           /*'
      '        (select tsii.codigo_cst'
      '         from trib_saida_item_imposto  tsii'
      '              join trib_imposto ti'
      '              on tsii.id_imposto = ti.id_imposto'
      ''
      '         where pdf.dadofiscal =  tsii.dadofiscal'
      '           and pdf.numero = tsii.numero'
      '           and pdf.produto = tsii.produto'
      '           and ti.codigo = '#39'IBSUF'#39') as codigo_cst_ibsuf,'
      ''
      '        (select tsii.cclasstrib'
      '         from trib_saida_item_imposto  tsii'
      '              join trib_imposto ti'
      '              on tsii.id_imposto = ti.id_imposto'
      ''
      '         where pdf.dadofiscal =  tsii.dadofiscal'
      '           and pdf.numero = tsii.numero'
      '           and pdf.produto = tsii.produto'
      '           and ti.codigo = '#39'IBSUF'#39') as cclasstrib_ibsuf,'
      ''
      '        (select tsii.vbc'
      '         from trib_saida_item_imposto  tsii'
      '              join trib_imposto ti'
      '              on tsii.id_imposto = ti.id_imposto'
      ''
      '         where pdf.dadofiscal =  tsii.dadofiscal'
      '           and pdf.numero = tsii.numero'
      '           and pdf.produto = tsii.produto'
      '           and ti.codigo = '#39'IBSUF'#39') as vbc_ibsuf,'
      '           */'
      ''
      ''
      '        (select tsii.paliq'
      '         from trib_saida_item_imposto  tsii'
      '              join trib_imposto ti'
      '              on tsii.id_imposto = ti.id_imposto'
      ''
      '         where pdf.dadofiscal =  tsii.dadofiscal'
      '           and pdf.numero = tsii.numero'
      '           and pdf.produto = tsii.produto'
      '           and ti.codigo = '#39'IBSUF'#39') as paliq_ibsuf,'
      ''
      '        (select tsii.vimposto'
      '         from trib_saida_item_imposto  tsii'
      '              join trib_imposto ti'
      '              on tsii.id_imposto = ti.id_imposto'
      ''
      '         where pdf.dadofiscal =  tsii.dadofiscal'
      '           and pdf.numero = tsii.numero'
      '           and pdf.produto = tsii.produto'
      '           and ti.codigo = '#39'IBSUF'#39') as vimposto_ibsuf,'
      ''
      ''
      ''
      ''
      '            /*'
      '        (select tsii.codigo_cst'
      '         from trib_saida_item_imposto  tsii'
      '              join trib_imposto ti'
      '              on tsii.id_imposto = ti.id_imposto'
      ''
      '         where pdf.dadofiscal =  tsii.dadofiscal'
      '           and pdf.numero = tsii.numero'
      '           and pdf.produto = tsii.produto'
      '           and ti.codigo = '#39'IBSMUN'#39') as codigo_cst_ibsmun,'
      ''
      '        (select tsii.cclasstrib'
      '         from trib_saida_item_imposto  tsii'
      '              join trib_imposto ti'
      '              on tsii.id_imposto = ti.id_imposto'
      ''
      '         where pdf.dadofiscal =  tsii.dadofiscal'
      '           and pdf.numero = tsii.numero'
      '           and pdf.produto = tsii.produto'
      '           and ti.codigo = '#39'IBSMUN'#39') as cclasstrib_ibsmun,'
      ''
      '        (select tsii.vbc'
      '         from trib_saida_item_imposto  tsii'
      '              join trib_imposto ti'
      '              on tsii.id_imposto = ti.id_imposto'
      ''
      '         where pdf.dadofiscal =  tsii.dadofiscal'
      '           and pdf.numero = tsii.numero'
      '           and pdf.produto = tsii.produto'
      '           and ti.codigo = '#39'IBSMUN'#39') as vbc_ibsmun,'
      '           */'
      ''
      ''
      '        (select tsii.paliq'
      '         from trib_saida_item_imposto  tsii'
      '              join trib_imposto ti'
      '              on tsii.id_imposto = ti.id_imposto'
      ''
      '         where pdf.dadofiscal =  tsii.dadofiscal'
      '           and pdf.numero = tsii.numero'
      '           and pdf.produto = tsii.produto'
      '           and ti.codigo = '#39'IBSMUN'#39') as paliq_ibsmun,'
      ''
      '        (select tsii.vimposto'
      '         from trib_saida_item_imposto  tsii'
      '              join trib_imposto ti'
      '              on tsii.id_imposto = ti.id_imposto'
      ''
      '         where pdf.dadofiscal =  tsii.dadofiscal'
      '           and pdf.numero = tsii.numero'
      '           and pdf.produto = tsii.produto'
      '           and ti.codigo = '#39'IBSMUN'#39') as vimposto_ibsmun'
      ''
      'from produtosdadosfiscais pdf'
      'where pdf.dadofiscal = :Dadofiscal'
      '  and pdf.produto = :produto'
      '  and pdf.numero = :numero'
      '')
    RequestLive = False
    Left = 96
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'dadofiscal'
        ParamType = ptUnknown
      end
      item
        DataType = ftLargeint
        Name = 'produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'numero'
        ParamType = ptUnknown
      end>
    object qrytrib_saida_item_impostodadofiscal: TIntegerField
      FieldName = 'dadofiscal'
      Required = True
    end
    object qrytrib_saida_item_impostoproduto: TLargeintField
      FieldName = 'produto'
      Required = True
    end
    object qrytrib_saida_item_impostonumero: TIntegerField
      FieldName = 'numero'
      Required = True
    end
    object qrytrib_saida_item_impostocodigo_cst_cbsibs: TStringField
      FieldName = 'codigo_cst_cbsibs'
      Size = 3
    end
    object qrytrib_saida_item_impostocclasstrib_cbsibs: TStringField
      FieldName = 'cclasstrib_cbsibs'
      Size = 6
    end
    object qrytrib_saida_item_impostovbc_cbsibs: TFloatField
      FieldName = 'vbc_cbsibs'
    end
    object qrytrib_saida_item_impostopaliq_cbs: TFloatField
      FieldName = 'paliq_cbs'
    end
    object qrytrib_saida_item_impostovimposto_cbs: TFloatField
      FieldName = 'vimposto_cbs'
    end
    object qrytrib_saida_item_impostopaliq_ibsuf: TFloatField
      FieldName = 'paliq_ibsuf'
    end
    object qrytrib_saida_item_impostovimposto_ibsuf: TFloatField
      FieldName = 'vimposto_ibsuf'
    end
    object qrytrib_saida_item_impostopaliq_ibsmun: TFloatField
      FieldName = 'paliq_ibsmun'
    end
    object qrytrib_saida_item_impostovimposto_ibsmun: TFloatField
      FieldName = 'vimposto_ibsmun'
    end
  end
  object dsrtrib_saida_item_imposto: TtecDataSource
    DataSet = qrytrib_saida_item_imposto
    Left = 168
    Top = 152
  end
  object qryTotais_trib_saida_imposto: TtecQuery
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
      
        '/* as regras para defini'#231#227'o do cst, cclasstrib e vbs s'#227'o as mesm' +
        'as, pode-se pegar'
      
        '           o cst e cclasstrib de um dos tr'#234's cbs, ibsuf ou ibsmu' +
        'n */'
      'select'
      
        '    sum(case when ti.codigo = '#39'CBS'#39'    then tsti.vbc      end) a' +
        's vbc_cbsibs,'
      
        '    sum(case when ti.codigo = '#39'CBS'#39'    then tsti.vimposto end) a' +
        's vimposto_cbs,'
      
        '    sum(case when ti.codigo = '#39'IBSUF'#39'  then tsti.vimposto end) a' +
        's vimposto_ibsuf,'
      
        '    sum(case when ti.codigo = '#39'IBSMUN'#39' then tsti.vimposto end) a' +
        's vimposto_ibsmun'
      ''
      'from dadosfiscais df'
      '     join trib_saida_total_imposto tsti'
      '       on tsti.dadofiscal = df.numero'
      '     join trib_imposto ti'
      '       on ti.id_imposto = tsti.id_imposto'
      ''
      'where df.numero = :Dadofiscal'
      '  and ti.codigo in ('#39'CBS'#39','#39'IBSUF'#39','#39'IBSMUN'#39')'
      ''
      'group by df.numero'
      ''
      'having'
      
        '    sum(case when ti.codigo = '#39'CBS'#39'    and tsti.vimposto is not ' +
        'null then 1 else 0 end) > 0'
      
        'or sum(case when ti.codigo = '#39'IBSUF'#39'  and tsti.vimposto is not n' +
        'ull then 1 else 0 end) > 0'
      
        'or sum(case when ti.codigo = '#39'IBSMUN'#39' and tsti.vimposto is not n' +
        'ull then 1 else 0 end) > 0;'
      '')
    RequestLive = False
    Left = 96
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'dadofiscal'
        ParamType = ptUnknown
      end>
    object qryTotais_trib_saida_impostovbc_cbsibs: TFloatField
      FieldName = 'vbc_cbsibs'
      DisplayFormat = '0.00'
    end
    object qryTotais_trib_saida_impostovimposto_cbs: TFloatField
      FieldName = 'vimposto_cbs'
      DisplayFormat = '0.00'
    end
    object qryTotais_trib_saida_impostovimposto_ibsuf: TFloatField
      FieldName = 'vimposto_ibsuf'
      DisplayFormat = '0.00'
    end
    object qryTotais_trib_saida_impostovimposto_ibsmun: TFloatField
      FieldName = 'vimposto_ibsmun'
      DisplayFormat = '0.00'
    end
  end
  object dsrTotais_trib_saida_imposto: TtecDataSource
    DataSet = qryTotais_trib_saida_imposto
    Left = 144
    Top = 256
  end
  object qrytrib_saida_serv_imposto: TtecQuery
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
      'select  sdf.dadofiscal,'
      '        sdf.servico,'
      ''
      
        '         /* as regras para defini'#231#227'o do cst, cclasstrib e vbs s'#227 +
        'o as mesmas, pode-se pegar'
      
        '           o cst e cclasstrib de um dos tr'#234's cbs, ibsuf ou ibsmu' +
        'n */'
      ''
      '        (select tssi.codigo_cst'
      '         from trib_saida_serv_imposto  tssi'
      '              join trib_imposto ti'
      '              on tssi.id_imposto = ti.id_imposto'
      ''
      ''
      '         where sdf.dadofiscal =  tssi.dadofiscal'
      '           and sdf.servico = tssi.servico'
      '           and ti.codigo = '#39'CBS'#39') as codigo_cst_cbsibs,'
      ''
      '        (select tssi.cclasstrib'
      '         from trib_saida_serv_imposto  tssi'
      '              join trib_imposto ti'
      '              on tssi.id_imposto = ti.id_imposto'
      ''
      '         where sdf.dadofiscal =  tssi.dadofiscal'
      '           and sdf.servico = tssi.servico'
      '           and ti.codigo = '#39'CBS'#39') as cclasstrib_cbsibs,'
      ''
      '        (select tssi.vbc'
      '         from trib_saida_serv_imposto  tssi'
      '              join trib_imposto ti'
      '              on tssi.id_imposto = ti.id_imposto'
      ''
      '         where sdf.dadofiscal =  tssi.dadofiscal'
      '           and sdf.servico = tssi.servico'
      '           and ti.codigo = '#39'CBS'#39') as vbc_cbsibs,'
      ''
      ''
      '        (select tssi.paliq'
      '         from trib_saida_serv_imposto  tssi'
      '              join trib_imposto ti'
      '              on tssi.id_imposto = ti.id_imposto'
      ''
      '         where sdf.dadofiscal =  tssi.dadofiscal'
      '           and sdf.servico = tssi.servico'
      '           and ti.codigo = '#39'CBS'#39') as paliq_cbs,'
      ''
      '        (select tssi.vimposto'
      '         from trib_saida_serv_imposto  tssi'
      '              join trib_imposto ti'
      '              on tssi.id_imposto = ti.id_imposto'
      ''
      '         where sdf.dadofiscal =  tssi.dadofiscal'
      '           and sdf.servico = tssi.servico'
      '           and ti.codigo = '#39'CBS'#39') as vimposto_cbs,'
      ''
      '        (select tssi.paliq'
      '         from trib_saida_serv_imposto  tssi'
      '              join trib_imposto ti'
      '              on tssi.id_imposto = ti.id_imposto'
      ''
      '         where sdf.dadofiscal =  tssi.dadofiscal'
      '           and sdf.servico = tssi.servico'
      '           and ti.codigo = '#39'IBSUF'#39') as paliq_ibsuf,'
      ''
      '        (select tssi.vimposto'
      '         from trib_saida_serv_imposto  tssi'
      '              join trib_imposto ti'
      '              on tssi.id_imposto = ti.id_imposto'
      ''
      '         where sdf.dadofiscal =  tssi.dadofiscal'
      '           and sdf.servico = tssi.servico'
      '           and ti.codigo = '#39'IBSUF'#39') as vimposto_ibsuf,'
      ''
      '        (select tssi.paliq'
      '         from trib_saida_serv_imposto  tssi'
      '              join trib_imposto ti'
      '              on tssi.id_imposto = ti.id_imposto'
      ''
      '         where sdf.dadofiscal =  tssi.dadofiscal'
      '           and sdf.servico = tssi.servico'
      '           and ti.codigo = '#39'IBSMUN'#39') as paliq_ibsmun,'
      ''
      '        (select tssi.vimposto'
      '         from trib_saida_serv_imposto  tssi'
      '              join trib_imposto ti'
      '              on tssi.id_imposto = ti.id_imposto'
      ''
      '         where sdf.dadofiscal =  tssi.dadofiscal'
      '           and sdf.servico = tssi.servico'
      '           and ti.codigo = '#39'IBSMUN'#39') as vimposto_ibsmun'
      ''
      'from servicosdadosfiscais sdf'
      'where sdf.dadofiscal  = :Dadofiscal'
      '  and sdf.servico = :servico'
      '')
    RequestLive = False
    Left = 288
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'dadofiscal'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'servico'
        ParamType = ptUnknown
      end>
    object qrytrib_saida_serv_impostodadofiscal: TIntegerField
      FieldName = 'dadofiscal'
      Required = True
    end
    object qrytrib_saida_serv_impostoservico: TIntegerField
      FieldName = 'servico'
      Required = True
    end
    object qrytrib_saida_serv_impostocodigo_cst_cbsibs: TStringField
      DisplayWidth = 3
      FieldName = 'codigo_cst_cbsibs'
      Size = 4
    end
    object qrytrib_saida_serv_impostocclasstrib_cbsibs: TStringField
      FieldName = 'cclasstrib_cbsibs'
      Size = 6
    end
    object qrytrib_saida_serv_impostovbc_cbsibs: TFloatField
      FieldName = 'vbc_cbsibs'
      DisplayFormat = '0.00'
    end
    object qrytrib_saida_serv_impostopaliq_cbs: TFloatField
      FieldName = 'paliq_cbs'
      DisplayFormat = '0.00'
    end
    object qrytrib_saida_serv_impostovimposto_cbs: TFloatField
      FieldName = 'vimposto_cbs'
      DisplayFormat = '0.00'
    end
    object qrytrib_saida_serv_impostopaliq_ibsuf: TFloatField
      FieldName = 'paliq_ibsuf'
      DisplayFormat = '0.00'
    end
    object qrytrib_saida_serv_impostovimposto_ibsuf: TFloatField
      FieldName = 'vimposto_ibsuf'
      DisplayFormat = '0.00'
    end
    object qrytrib_saida_serv_impostopaliq_ibsmun: TFloatField
      FieldName = 'paliq_ibsmun'
      DisplayFormat = '0.00'
    end
    object qrytrib_saida_serv_impostovimposto_ibsmun: TFloatField
      FieldName = 'vimposto_ibsmun'
      DisplayFormat = '0.00'
    end
  end
  object dsrtrib_saida_serv_imposto: TtecDataSource
    DataSet = qrytrib_saida_serv_imposto
    Left = 328
    Top = 144
  end
  object qryTotais_trib_entrada_imposto: TtecQuery
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
      
        '/* as regras para defini'#231#227'o do cst, cclasstrib e vbs s'#227'o as mesm' +
        'as, pode-se pegar'
      
        '           o cst e cclasstrib de um dos tr'#234's cbs, ibsuf ou ibsmu' +
        'n */'
      'select'
      
        '    sum(case when ti.codigo = '#39'CBS'#39'    then teti.vbc      end) a' +
        's vbc_cbsibs,'
      
        '    sum(case when ti.codigo = '#39'CBS'#39'    then teti.vimposto end) a' +
        's vimposto_cbs,'
      
        '    sum(case when ti.codigo = '#39'IBSUF'#39'  then teti.vimposto end) a' +
        's vimposto_ibsuf,'
      
        '    sum(case when ti.codigo = '#39'IBSMUN'#39' then teti.vimposto end) a' +
        's vimposto_ibsmun'
      ''
      'from notaspag np'
      '     join trib_entrada_total_imposto teti'
      '       on teti.codigonota = np.codigo'
      '     join trib_imposto ti'
      '       on ti.id_imposto = teti.id_imposto'
      ''
      'where np.codigo = :codigonota'
      '  and ti.codigo in ('#39'CBS'#39','#39'IBSUF'#39','#39'IBSMUN'#39')'
      ''
      'group by np.codigo'
      ''
      'having'
      
        '    sum(case when ti.codigo = '#39'CBS'#39'    and teti.vimposto is not ' +
        'null then 1 else 0 end) > 0'
      
        'or sum(case when ti.codigo = '#39'IBSUF'#39'  and teti.vimposto is not n' +
        'ull then 1 else 0 end) > 0'
      
        'or sum(case when ti.codigo = '#39'IBSMUN'#39' and teti.vimposto is not n' +
        'ull then 1 else 0 end) > 0;'
      '')
    RequestLive = False
    Left = 96
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigonota'
        ParamType = ptUnknown
      end>
    object qryTotais_trib_entrada_impostovbc_cbsibs: TFloatField
      FieldName = 'vbc_cbsibs'
    end
    object qryTotais_trib_entrada_impostovimposto_cbs: TFloatField
      FieldName = 'vimposto_cbs'
    end
    object qryTotais_trib_entrada_impostovimposto_ibsuf: TFloatField
      FieldName = 'vimposto_ibsuf'
    end
    object qryTotais_trib_entrada_impostovimposto_ibsmun: TFloatField
      FieldName = 'vimposto_ibsmun'
    end
  end
  object dsrTotais_trib_entrada_imposto: TtecDataSource
    DataSet = qryTotais_trib_entrada_imposto
    Left = 144
    Top = 336
  end
end
