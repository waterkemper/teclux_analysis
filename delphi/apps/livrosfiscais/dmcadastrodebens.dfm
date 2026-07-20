inherited dtmCadastrodeBens: TdtmCadastrodeBens
  OldCreateOrder = False
  Left = 577
  Top = 149
  Height = 363
  Width = 481
  object qryImobilizado: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryImobilizadoAfterOpen
    AfterScroll = qryImobilizadoAfterScroll
    OnCalcFields = qryImobilizadoCalcFields
    OnNewRecord = qryImobilizadoNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select i.*,'
      '       (select np.fornecedor'
      '        from notaspag np'
      '        where np.codigo = i.codigonota) as fornecedor_entrada,'
      ''
      '       (select np.tipofornecedor'
      '        from notaspag np'
      
        '        where np.codigo = i.codigonota) as tipofornecedor_entrad' +
        'a,'
      ''
      '       (select np.serie'
      '        from notaspag np'
      '        where np.codigo = i.codigonota) as serie_entrada,'
      ''
      '       (select np.numero'
      '        from notaspag np'
      '        where np.codigo = i.codigonota) as numero_entrada,'
      ''
      '       (select n.serie'
      
        '        from dadosfiscais df join notas n on df.numero = n.dadof' +
        'iscal'
      
        '        where df.numero = n.dadofiscal and df.numero = i.dadofis' +
        'cal) as serie_saida,'
      ''
      '       (select n.numero'
      
        '        from dadosfiscais df join notas n on df.numero = n.dadof' +
        'iscal'
      
        '        where df.numero = n.dadofiscal and df.numero = i.dadofis' +
        'cal) as numero_saida,'
      ''
      '       p.codigovisual as produtovisual'
      ''
      'from imobilizado i'
      '     join produtos p'
      '     on i.codigobem = p.codigo'
      ''
      'where i.numero = :numero'
      '')
    RequestLive = True
    Left = 88
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end>
    object qryImobilizadonumero: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryImobilizadodata_entrada: TDateField
      Alignment = taCenter
      DisplayLabel = 'data de entrada'
      FieldName = 'data_entrada'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryImobilizadofilialcontribuinte: TIntegerField
      DisplayLabel = 'Filial Contribuinte'
      FieldName = 'filialcontribuinte'
      Required = True
      DisplayFormat = '0'
    end
    object qryImobilizadocodigobem: TLargeintField
      DisplayLabel = 'C'#243'digo do bem Imobilizado'
      FieldName = 'codigobem'
      Required = True
    end
    object qryImobilizadonumlre: TStringField
      FieldName = 'numlre'
      Size = 10
    end
    object qryImobilizadofolhalre: TStringField
      FieldName = 'folhalre'
      Size = 10
    end
    object qryImobilizadoicmsvalor: TFloatField
      FieldName = 'icmsvalor'
      DisplayFormat = '0.00'
    end
    object qryImobilizadoicmsvalorst: TFloatField
      FieldName = 'icmsvalorst'
      DisplayFormat = '0.00'
    end
    object qryImobilizadoicmsvalorfrt: TFloatField
      FieldName = 'icmsvalorfrt'
      DisplayFormat = '0.00'
    end
    object qryImobilizadoicmsvalordif: TFloatField
      FieldName = 'icmsvalordif'
      DisplayFormat = '0.00'
    end
    object qryImobilizadodata_saida: TDateField
      Alignment = taCenter
      FieldName = 'data_saida'
      EditMask = '99/99/9999;1; '
    end
    object qryImobilizadoprodutovisual: TStringField
      FieldName = 'produtovisual'
      Size = 30
    end
    object qryImobilizadonmeses: TIntegerField
      DisplayLabel = 'N'#250'mero de Meses do parcelamento'
      FieldName = 'nmeses'
      Required = True
      DisplayFormat = '0'
    end
    object qryImobilizadoTotalICMS: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TotalICMS'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryImobilizadotipomovimentosaida: TStringField
      FieldName = 'tipomovimentosaida'
      Size = 2
    end
    object qryImobilizadoValorDoBem: TFloatField
      FieldName = 'ValorDoBem'
      DisplayFormat = '0.00'
    end
    object qryImobilizadoidentificacao: TStringField
      FieldName = 'identificacao'
      Size = 50
    end
    object qryImobilizadoinfcomplementar: TStringField
      FieldName = 'infcomplementar'
      Size = 200
    end
    object qryImobilizadodatagarantia: TDateField
      Alignment = taCenter
      FieldName = 'datagarantia'
      EditMask = '99/99/9999;1; '
    end
    object qryImobilizadotipoconta: TStringField
      FieldName = 'tipoconta'
      Required = True
      Size = 1
    end
    object qryImobilizadodepreciar: TStringField
      FieldName = 'depreciar'
      Required = True
      Size = 1
    end
    object qryImobilizadovalordepreciar: TFloatField
      FieldName = 'valordepreciar'
      DisplayFormat = '0.00'
    end
    object qryImobilizadotaxadepreciacao: TFloatField
      FieldName = 'taxadepreciacao'
      DisplayFormat = '0.00'
    end
    object qryImobilizadodepreciacaoacumulada: TFloatField
      FieldName = 'depreciacaoacumulada'
      DisplayFormat = '0.00'
    end
    object qryImobilizadoobsdepreciacao: TStringField
      FieldName = 'obsdepreciacao'
      Size = 200
    end
    object qryImobilizadofuncaobemnaempresa: TStringField
      DisplayLabel = 'Fun'#231#227'o do bem na empresa'
      FieldName = 'funcaobemnaempresa'
      Size = 200
    end
    object qryImobilizadovidautil: TIntegerField
      DisplayLabel = 'vida '#250'til'
      FieldName = 'vidautil'
      DisplayFormat = '0'
    end
    object qryImobilizadoiniciouso: TDateField
      Alignment = taCenter
      DisplayLabel = 'In'#237'cio de uso'
      FieldName = 'iniciouso'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryImobilizadocodigonota: TIntegerField
      FieldName = 'codigonota'
      DisplayFormat = '0'
    end
    object qryImobilizadoccdobem: TIntegerField
      DisplayLabel = 'Conta cont'#225'bil do bem'
      FieldName = 'ccdobem'
      DisplayFormat = '0'
    end
    object qryImobilizadoccdepreciacaoacumulada: TIntegerField
      FieldName = 'ccdepreciacaoacumulada'
      DisplayFormat = '0'
    end
    object qryImobilizadocccorrecaomonetaria: TIntegerField
      FieldName = 'cccorrecaomonetaria'
      DisplayFormat = '0'
    end
    object qryImobilizadoccdepreciacao: TIntegerField
      FieldName = 'ccdepreciacao'
      DisplayFormat = '0'
    end
    object qryImobilizadocentrodecusto: TIntegerField
      DisplayLabel = 'Centro de custo'
      FieldName = 'centrodecusto'
      DisplayFormat = '0'
    end
    object qryImobilizadodadofiscal: TIntegerField
      FieldName = 'dadofiscal'
      DisplayFormat = '0'
    end
    object qryImobilizadofornecedor_entrada: TIntegerField
      FieldName = 'fornecedor_entrada'
    end
    object qryImobilizadotipofornecedor_entrada: TStringField
      FieldName = 'tipofornecedor_entrada'
      Size = 50
    end
    object qryImobilizadoserie_entrada: TStringField
      FieldName = 'serie_entrada'
      Size = 50
    end
    object qryImobilizadonumero_entrada: TIntegerField
      FieldName = 'numero_entrada'
    end
    object qryImobilizadoserie_saida: TStringField
      FieldName = 'serie_saida'
      Size = 50
    end
    object qryImobilizadonumero_saida: TIntegerField
      FieldName = 'numero_saida'
    end
    object qryImobilizadoValorResidual: TFloatField
      FieldName = 'ValorResidual'
    end
    object qryImobilizadoTaxaResidual: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TaxaResidual'
      Calculated = True
    end
  end
  object dsrImobilizado: TtecDataSource
    DataSet = qryImobilizado
    OnDataChange = dsrImobilizadoDataChange
    Left = 136
    Top = 48
  end
  object qryApropriacaoICMSImobilizado: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterPost = qryApropriacaoICMSImobilizadoAfterPost
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select aim.*,'
      '       cast(to_char(aim.periodo, '#39'MM/YYYY'#39') as char(7)) as mes,'
      
        '       cast(to_char(aim.dataapropriacao, '#39'MM/YYYY'#39') as char(7)) ' +
        'as periodoapropriacao'
      ''
      'from apropriacaoicmsimobilizado aim'
      'where aim.numeroimobilizado = :numeroimobilizado'
      'order by periodo')
    RequestLive = True
    Left = 72
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numeroimobilizado'
        ParamType = ptUnknown
      end>
    object qryApropriacaoICMSImobilizadonumeroimobilizado: TIntegerField
      FieldName = 'numeroimobilizado'
      ReadOnly = True
      DisplayFormat = '0'
    end
    object qryApropriacaoICMSImobilizadoperiodo: TDateField
      Alignment = taCenter
      FieldName = 'periodo'
      ReadOnly = True
      DisplayFormat = '00'
      EditMask = '99/99/9999;1; '
    end
    object qryApropriacaoICMSImobilizadofator: TFloatField
      DisplayLabel = 'FATOR'
      FieldName = 'fator'
      ReadOnly = True
      DisplayFormat = '##0.000000'
      Precision = 6
    end
    object qryApropriacaoICMSImobilizadovalor: TFloatField
      DisplayLabel = 'VALOR'
      FieldName = 'valor'
      ReadOnly = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryApropriacaoICMSImobilizadomes: TStringField
      FieldName = 'mes'
      ReadOnly = True
      Size = 7
    end
    object qryApropriacaoICMSImobilizadosequencia: TIntegerField
      FieldName = 'sequencia'
      ReadOnly = True
    end
    object qryApropriacaoICMSImobilizadodataapropriacao: TDateField
      FieldName = 'dataapropriacao'
      DisplayFormat = 'mm/yyyy'
      EditMask = '!99/0000;1;_'
    end
    object qryApropriacaoICMSImobilizadoperiodoapropriacao: TStringField
      FieldName = 'periodoapropriacao'
      EditMask = '!99/0000;1;_'
      Size = 7
    end
  end
  object dsrApropriacaoICMSImobilizado: TtecDataSource
    DataSet = qryApropriacaoICMSImobilizado
    OnDataChange = dsrApropriacaoICMSImobilizadoDataChange
    Left = 120
    Top = 136
  end
  object spcImobilizadoProximo: TtecQuery
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
      'Select imobilizado_proximonumero() as codigo')
    RequestLive = False
    Left = 286
    Top = 78
    object spcImobilizadoProximocodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
  object qryNotaSaida: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeOpen = qryNotaSaidaBeforeOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'SQLProdutoImobilizado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SQL'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select n.filial,'
      '       n.serie,'
      '       n.dadofiscal,'
      '       n.numero,'
      '       case when (:produto <> '#39#39') and (:filial <>0) then'
      '        (select pdf.numero'
      '         from produtosdadosfiscais pdf'
      '         where pdf.dadofiscal = n.dadofiscal'
      '           and pdf.produto = :produto'
      '           and pdf.filial = :filial)'
      '       else'
      '         cast(null as integer)'
      '       end as numitemdocfiscalsaida,'
      '       df.data'
      ''
      'from dadosfiscais df'
      '     join notas n'
      '     on df.numero = n.dadofiscal'
      ''
      'where  (n.filial = :Filial'
      '        and n.serie  = :serie'
      '        and n.numero = :Numero)'
      ''
      '%SQLProdutoImobilizado'
      '%SQL')
    RequestLive = True
    Left = 264
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'serie'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Numero'
        ParamType = ptUnknown
      end>
    object qryNotaSaidafilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryNotaSaidaserie: TStringField
      FieldName = 'serie'
      Size = 3
    end
    object qryNotaSaidadadofiscal: TIntegerField
      FieldName = 'dadofiscal'
      DisplayFormat = '0'
    end
    object qryNotaSaidanumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryNotaSaidanumitemdocfiscalsaida: TIntegerField
      FieldName = 'numitemdocfiscalsaida'
      DisplayFormat = '0'
    end
    object qryNotaSaidadata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
  end
  object dsrNotaSaida: TtecDataSource
    DataSet = qryNotaSaida
    Left = 296
    Top = 216
  end
  object qryNotaEntrada: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeOpen = qryNotaEntradaBeforeOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'SQL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SQLProdutoImobilizado'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      '/*:fornecedor :Serie :Numero*/'
      ''
      'select np.fornecedor,'
      '       np.tipofornecedor,'
      '       np.serie,'
      '       np.numero,'
      '       np.codigo,'
      '       np.data,'
      '       case when (:produto <> '#39#39') and (:filial <>0) then'
      '        (select pnp.numero'
      '         from produtosnotaspag pnp'
      '         where pnp.codigonota = np.codigo'
      '           and pnp.produto = :produto'
      '           and pnp.filial = :filial)'
      '       else'
      '         cast(null as integer)'
      '       end as numitemdocfiscal'
      ''
      'from notaspag np'
      'where  (np.fornecedor = :fornecedor'
      '        and np.tipofornecedor = :tipofornecedor'
      '        and np.serie  = :Serie'
      '        and np.numero = :Numero)'
      ''
      '%SQL'
      '%SQLProdutoImobilizado')
    RequestLive = True
    Left = 72
    Top = 227
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'fornecedor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Serie'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipofornecedor'
        ParamType = ptUnknown
      end>
    object qryNotaEntradafornecedor: TIntegerField
      FieldName = 'fornecedor'
      DisplayFormat = '0'
    end
    object qryNotaEntradatipofornecedor: TStringField
      FieldName = 'tipofornecedor'
      Size = 1
    end
    object qryNotaEntradaserie: TStringField
      FieldName = 'serie'
      Size = 3
    end
    object qryNotaEntradanumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryNotaEntradacodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryNotaEntradadata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object qryNotaEntradanumitemdocfiscal: TIntegerField
      FieldName = 'numitemdocfiscal'
      DisplayFormat = '0'
    end
  end
  object dsrNotaEntrada: TtecDataSource
    DataSet = qryNotaEntrada
    Left = 104
    Top = 248
  end
end
