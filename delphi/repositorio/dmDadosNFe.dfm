inherited dtmDadosNFe: TdtmDadosNFe
  OldCreateOrder = False
  Left = 404
  Top = 234
  Height = 386
  Width = 484
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
    RequestLive = False
    Left = 96
    Top = 56
  end
  object dsrtrib_entrada_item_imposto: TtecDataSource
    DataSet = qrytrib_entrada_item_imposto
    Left = 136
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
      
        '           o cst e cclasstrib de um dos tr'#234's: cbs, ibsuf ou ibsm' +
        'un */'
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
      ''
      'from produtosdadosfiscais pdf'
      'where pdf.dadofiscal  = :Dadofiscal'
      '')
    RequestLive = False
    Left = 96
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cbs'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'dadofiscal'
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
    Left = 136
    Top = 136
  end
  object qryTotais_trib_saida_item_imposto: TtecQuery
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
      
        'select   /* as regras para defini'#231#227'o do cst, cclasstrib e vbs s'#227 +
        'o as mesmas, pode-se pegar'
      
        '           o cst e cclasstrib de um dos tr'#234's: cbs, ibsuf ou ibsm' +
        'un */'
      ''
      '        sum((select tsti.vbc'
      '         from trib_saida_total_imposto  tsti'
      '              join trib_imposto ti'
      '              on tsti.id_imposto = ti.id_imposto'
      ''
      '         where df.numero =  tsti.dadofiscal'
      '           and ti.codigo = '#39'CBS'#39')) as vbc_cbsibs,'
      ''
      ''
      '        sum((select tsti.vimposto'
      '         from trib_saida_total_imposto  tsti'
      '              join trib_imposto ti'
      '              on tsti.id_imposto = ti.id_imposto'
      ''
      '         where df.numero =  tsti.dadofiscal'
      '           and ti.codigo = '#39'CBS'#39')) as vimposto_cbs,'
      ''
      ''
      '        sum((select tsti.vimposto'
      '         from trib_saida_total_imposto  tsti'
      '              join trib_imposto ti'
      '              on tsti.id_imposto = ti.id_imposto'
      ''
      '         where df.numero =  tsti.dadofiscal'
      '           and ti.codigo = '#39'IBSUF'#39')) as vimposto_ibsuf,'
      ''
      '        sum((select tsti.vimposto'
      '         from trib_saida_item_imposto  tsti'
      '              join trib_imposto ti'
      '              on tsti.id_imposto = ti.id_imposto'
      ''
      '         where df.numero =  tsti.dadofiscal'
      '           and ti.codigo = '#39'IBSMUN'#39')) as vimposto_ibsmun'
      ''
      ''
      'from dadosfiscais df'
      'where df.numero = :Dadofiscal'
      '')
    RequestLive = False
    Left = 96
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cbs'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'dadofiscal'
        ParamType = ptUnknown
      end>
    object qryTotais_trib_saida_item_impostovbc_cbsibs: TFloatField
      FieldName = 'vbc_cbsibs'
    end
    object qryTotais_trib_saida_item_impostovimposto_cbs: TFloatField
      FieldName = 'vimposto_cbs'
    end
    object qryTotais_trib_saida_item_impostovimposto_ibsuf: TFloatField
      FieldName = 'vimposto_ibsuf'
    end
    object qryTotais_trib_saida_item_impostovimposto_ibsmun: TFloatField
      FieldName = 'vimposto_ibsmun'
    end
  end
  object dsrTotais_trib_saida_item_imposto: TtecDataSource
    DataSet = qryTotais_trib_saida_item_imposto
    Left = 136
    Top = 232
  end
end
