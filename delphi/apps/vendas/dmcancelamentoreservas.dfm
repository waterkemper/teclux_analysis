inherited dtmCancelamentoReservas: TdtmCancelamentoReservas
  Left = 307
  Top = 294
  Height = 275
  Width = 514
  object qryVendedores: TtecQuery
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
      'Select u.codigo,  '
      '           u.nome'
      
        'From  (usuarios u left join gruposusuarios gu on u.grupo=gu.codi' +
        'go)'
      'Where u.codigo =:codigo and'
      
        '((u.inativo is null) or (u.inativo>=:dataemissao)) and (u.venda ' +
        'or gu.vendedor)')
    RequestLive = True
    Left = 64
    Top = 15
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftDateTime
        Name = 'dataemissao'
        ParamType = ptUnknown
      end>
    object qryVendedorescodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
    object qryVendedoresnome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 40
    end
  end
  object dsrVendedores: TtecDataSource
    DataSet = qryVendedores
    Left = 221
    Top = 15
  end
  object qryConsultaVendedores: TtecQuery
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
      'Select u.nome,'
      '           u.codigo'
      'From usuarios u left join gruposusuarios gu on u.grupo=gu.codigo'
      
        'Where ((u.inativo is null) or (u.inativo>=:dataemissao)) and (u.' +
        'venda or gu.vendedor)'
      'Order By UPPER(TO_ASCII(u.nome,''LATIN1''))')
    RequestLive = False
    Left = 376
    Top = 15
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'dataemissao'
        ParamType = ptUnknown
      end>
    object qryConsultaVendedoresnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaVendedorescodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
  object qryReservas: TtecQuery
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
      'Select  r.numero, '
      '            r.filial,'
      '            r.data, '
      '            r.cliente, '
      '            r.cancelado,'
      '            r.validade,'
      '            u.nome as nomevendedor,'
      '            0.00 as valoraux,'
      '            false as selecionar,r.usuario'
      'From reservas r , usuarios u'
      'Where  (r.usuario = u.codigo)  '
      '            and (cast(r.validade as date) < current_date) '
      '            and (cancelado is null)'
      
        '            and ((Select sum(baixado) from produtosreservas wher' +
        'e (reserva = r.numero)) = 0)'
      '/*                    Vendedor            */'
      '/*                    Emissao              */'
      'Order By r.data'
      ''
      '              ')
    RequestLive = True
    Left = 64
    Top = 76
    object qryReservasnumero: TIntegerField
      FieldName = 'numero'
      Required = True
      DisplayFormat = '0'
    end
    object qryReservasfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryReservasdata: TDateTimeField
      FieldName = 'data'
      Required = True
    end
    object qryReservascliente: TStringField
      FieldName = 'cliente'
      Size = 30
    end
    object qryReservasvalidade: TDateTimeField
      FieldName = 'validade'
    end
    object qryReservasnomevendedor: TStringField
      FieldName = 'nomevendedor'
      Required = True
      Size = 40
    end
    object qryReservasselecionar: TBooleanField
      FieldName = 'selecionar'
    end
    object qryReservascancelado: TDateTimeField
      FieldName = 'cancelado'
    end
    object qryReservasvaloraux: TFloatField
      FieldName = 'valoraux'
      DisplayFormat = '0.00'
    end
    object qryReservasusuario: TIntegerField
      FieldName = 'usuario'
    end
  end
  object dsrReservas: TtecDataSource
    DataSet = qryReservas
    Left = 221
    Top = 76
  end
  object qryMovimentos: TtecQuery
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
      'Select tipomovimento,'
      '           referencia,'
      '           numero,'
      '           produto,'
      '           filial,'
      '           quantidade,'
      '           data'
      'From   movimentos'
      'Where (numero = 0)')
    RequestLive = True
    Left = 376
    Top = 136
    object qryMovimentostipomovimento: TStringField
      FieldName = 'tipomovimento'
      Required = True
      Size = 3
    end
    object qryMovimentosreferencia: TStringField
      FieldName = 'referencia'
      Size = 60
    end
    object qryMovimentosnumero: TIntegerField
      FieldName = 'numero'
      Required = True
      DisplayFormat = '0'
    end
    object qryMovimentosproduto: TLargeintField
      FieldName = 'produto'
      Required = True
      DisplayFormat = '0'
    end
    object qryMovimentosfilial: TIntegerField
      FieldName = 'filial'
      Required = True
      DisplayFormat = '0'
    end
    object qryMovimentosquantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
      DisplayFormat = '0'
    end
    object qryMovimentosdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      Required = True
      EditMask = '99/99/9999;1; '
    end
  end
  object qryEstoqueBloqueio: TtecQuery
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
      'select e.produto,'
      '       e.filial,'
      '       m.emestoque,'
      '       m.reservado,'
      '       m.futuro'
      'from estoques e, movimentos m'
      'where ('
      '/*Preenchido em runtime. n'#227'o apague*/'
      '    )and (m.numero = (select Max(m1.numero)'
      '                      from movimentos m1'
      '                      where (m1.produto = e.Produto) and'
      '                            (m1.filial  = e.Filial)'
      '                     )'
      '         )'
      'for update')
    RequestLive = False
    Left = 221
    Top = 193
    object qryEstoqueBloqueioproduto: TLargeintField
      FieldName = 'produto'
      DisplayFormat = '0'
    end
    object qryEstoqueBloqueiofilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryEstoqueBloqueioemestoque: TFloatField
      FieldName = 'emestoque'
      DisplayFormat = '0'
    end
    object qryEstoqueBloqueioreservado: TFloatField
      FieldName = 'reservado'
      DisplayFormat = '0'
    end
    object qryEstoqueBloqueiofuturo: TFloatField
      FieldName = 'futuro'
      DisplayFormat = '0'
    end
  end
  object spcMovimentosProximo: TtecQuery
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
      'select movimentos_proximonumero() as numero')
    RequestLive = False
    Left = 221
    Top = 137
    object spcMovimentosProximonumero: TIntegerField
      FieldName = 'numero'
    end
  end
  object qryProdutosReservas: TtecQuery
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
      'Select   pr.numero, '
      '             pr.reserva, '
      '             pr.filial, '
      '             pr.produto, '
      '             pr.quantidade,'
      
        '             (Select m.futuro From movimentos m where (m.numero ' +
        '= (Select max(m1.numero) '
      
        '                                                                ' +
        '                                          From movimentos m1'
      
        '                                                                ' +
        '                                          Where (m1.produto = pr' +
        '.produto) and'
      
        '                                                                ' +
        '                                                     (m1.filial ' +
        '= pr.filial)))) as futuro,'
      
        '            (select c.composto from caracteristicas c, produtos ' +
        'p where p.codigo = pr.produto and p.caracteristica = c.codigo) a' +
        's composto'
      'From produtosreservas pr'
      'Where (pr.reserva = :reserva)    ')
    RequestLive = True
    Left = 65
    Top = 137
    ParamData = <
      item
        DataType = ftInteger
        Name = 'reserva'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryProdutosReservasnumero: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryProdutosReservasquantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
      Visible = False
      DisplayFormat = '0'
    end
    object qryProdutosReservasreserva: TIntegerField
      FieldName = 'reserva'
      Visible = False
      DisplayFormat = '0'
    end
    object qryProdutosReservasfilial: TIntegerField
      FieldName = 'filial'
      Required = True
      DisplayFormat = '0'
    end
    object qryProdutosReservasfuturo: TFloatField
      FieldName = 'futuro'
      DisplayFormat = '0'
    end
    object qryProdutosReservasproduto: TLargeintField
      FieldName = 'produto'
      Required = True
    end
    object qryProdutosReservascomposto: TBooleanField
      FieldName = 'composto'
    end
  end
  object qryEstoques: TtecQuery
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
      'select emestoque,'
      '        reservado,'
      '        futuro,'
      '        reservaprevia'
      'from estoques'
      'where produto = :produto'
      '  and filial  = :filial')
    RequestLive = False
    Left = 376
    Top = 192
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
      end>
    object qryEstoquesemestoque: TFloatField
      FieldName = 'emestoque'
    end
    object qryEstoquesreservado: TFloatField
      FieldName = 'reservado'
    end
    object qryEstoquesfuturo: TFloatField
      FieldName = 'futuro'
    end
    object qryEstoquesreservaprevia: TFloatField
      FieldName = 'reservaprevia'
    end
  end
end
