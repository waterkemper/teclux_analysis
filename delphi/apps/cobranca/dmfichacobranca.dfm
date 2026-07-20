inherited dtmFichaCobranca: TdtmFichaCobranca
  Left = 205
  Top = 154
  Height = 541
  Width = 813
  object qryFilial: TtecQuery
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
      '            nome'
      'From    filiais'
      'Where codigo=:codigo')
    RequestLive = True
    Left = 60
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryFilialcodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryFilialnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
  end
  object dsrFilial: TtecDataSource
    DataSet = qryFilial
    Left = 203
    Top = 16
  end
  object qryGrupoFiliais: TtecQuery
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
      'Select codigo, '
      '           descricao'
      'From   gruposfiliais'
      'Where codigo=:codigo')
    RequestLive = True
    Left = 60
    Top = 71
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryGrupoFiliaiscodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryGrupoFiliaisdescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
  end
  object dsrGrupoFiliais: TtecDataSource
    DataSet = qryGrupoFiliais
    Left = 203
    Top = 71
  end
  object qryRegiao: TtecQuery
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
      '            nome'
      'From    regioes'
      'Where  codigo=:codigo')
    RequestLive = True
    Left = 60
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryRegiaocodigo: TStringField
      FieldName = 'codigo'
      Size = 10
    end
    object qryRegiaonome: TStringField
      FieldName = 'nome'
      Size = 30
    end
  end
  object dsrRegiao: TtecDataSource
    DataSet = qryRegiao
    Left = 203
    Top = 128
  end
  object qryCobrador: TtecQuery
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
      'Select u.codigo,'
      '              u.nome'
      
        'From  (usuarios u left join gruposusuarios gu on u.grupo=gu.codi' +
        'go)'
      'Where u.codigo =:codigo and (u.cobranca or gu.cobrador)'
      ''
      ''
      '                  ')
    RequestLive = True
    Left = 59
    Top = 185
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryCobradorcodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryCobradornome: TStringField
      FieldName = 'nome'
      Size = 40
    end
  end
  object dsrCobrador: TtecDataSource
    DataSet = qryCobrador
    Left = 203
    Top = 185
  end
  object qryAgentes: TtecQuery
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
      'Select codigo,'
      '          descricao'
      'From  agentes'
      'Order By UPPER(TO_ASCII(descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 60
    Top = 297
    object qryAgentescodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryAgentesdescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
  end
  object qryConceitos: TtecQuery
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
      'Select codigo,'
      '           descricao'
      'From   conceitos'
      'Order By UPPER(TO_ASCII(descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 60
    Top = 355
    object qryConceitoscodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryConceitosdescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
  end
  object qryConsultaFilial: TtecQuery
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
      'SELECT f.Nome,'
      '       f.Codigo'
      ''
      'FROM   filiais f'
      ''
      'ORDER BY UPPER(TO_ASCII(f.nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 359
    Top = 16
    object qryConsultaFilialnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaFilialcodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
  end
  object qryConsultaGrupoFiliais: TtecQuery
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
      'Select descricao,'
      '           codigo'
      'From   gruposfiliais'
      'Order By UPPER(TO_ASCII(descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 359
    Top = 71
    object qryConsultaGrupoFiliaisdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
    object qryConsultaGrupoFiliaiscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
  end
  object qryConsultaRegiao: TtecQuery
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
      'Select nome,'
      '           codigo'
      'From   regioes'
      'Order By UPPER(TO_ASCII(nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 359
    Top = 128
    object qryConsultaRegiaonome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 30
    end
    object qryConsultaRegiaocodigo: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Size = 10
    end
  end
  object qryConsultaCobrador: TtecQuery
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
      'Select u.nome,'
      '           u.codigo'
      
        'From  (usuarios  u left join gruposusuarios gu on u.grupo=gu.cod' +
        'igo)'
      'Where (u.cobranca or gu.cobrador)'
      'Order By UPPER(TO_ASCII(u.nome,'#39'LATIN1'#39'))'
      ''
      '')
    RequestLive = False
    Left = 359
    Top = 185
    object qryConsultaCobradornome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaCobradorcodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
  object qryContratosFichaCobranca: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterInsert = qryContratosFichaCobrancaAfterInsert
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'Vencimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Faturamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'GrupoFilial'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Agentes'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Conceito'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Cobrador'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ContratoSemCobrador'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PrimeiraCompra'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PrimeiroAtraso'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Ocorrencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Atendimentos'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Regiao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Ordenacao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';SELECT * FROM'
      '('
      'select contratos.*,'
      '           vf.estado,'
      '           vf.cidade,'
      '           vf.bairro,'
      '           (Select cr.nome From cidades cr'
      
        '                                     Where (cr.estado = vf.estad' +
        'o)  and'
      
        '                                                (cr.codigo = vf.' +
        'cidade)) as cidaderesidencia,'
      '          (Select br.nome From bairros br'
      
        '                                    Where (br.estado = vf.estado' +
        ')  and'
      
        '                                               (br.cidade = vf.c' +
        'idade)  and'
      
        '                                               (br.codigo = vf.b' +
        'airro)) as bairroresidencia'
      ''
      'from'
      '('
      'select distinct on (ct.numero)'
      '       ct.numero,'
      '       ct.data,'
      '       ct.filialvenda,'
      '       ct.cliente,'
      '       ct.tipocliente,'
      '       ct.nome,'
      '       p.totalaberto,'
      '       p.atraso,'
      '       false as selecionar,'
      '       p.atraso'
      'from'
      '('
      '  Select p.contrato,'
      '         sum(p.valorvencto) as totalaberto,'
      '         min(p.datavencto) as atraso'
      '  From parcelas p'
      '%Vencimento'
      '  group by p.contrato'
      '  order by p.contrato'
      ') as p, contratos ct'
      'where ct.numero = p.contrato '
      '%Faturamento'
      '            and (ct.situacao in ('#39'F'#39','#39'N'#39','#39'P'#39'))'
      '            and (contratos_atual(ct.numero))'
      '%Filial'
      '%GrupoFilial'
      '%Agentes'
      '%Conceito'
      '%Cobrador'
      '%ContratoSemCobrador'
      '%PrimeiraCompra'
      '%PrimeiroAtraso'
      '%Ocorrencia'
      ''
      
        ') as contratos join vfornecedores vf on contratos.cliente = vf.c' +
        'odigo and contratos.tipocliente = vf.tipo'
      'where contratos.numero is not null'
      '%Atendimentos'
      '%Regiao'
      ''
      ') AS CT'
      '%Ordenacao')
    RequestLive = True
    Left = 550
    Top = 16
    object qryContratosFichaCobrancanumero: TStringField
      FieldName = 'numero'
    end
    object qryContratosFichaCobrancadata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object qryContratosFichaCobrancafilialvenda: TIntegerField
      FieldName = 'filialvenda'
      DisplayFormat = '0'
    end
    object qryContratosFichaCobrancaestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object qryContratosFichaCobrancacidade: TIntegerField
      FieldName = 'cidade'
      DisplayFormat = '0'
    end
    object qryContratosFichaCobrancabairro: TIntegerField
      FieldName = 'bairro'
      DisplayFormat = '0'
    end
    object qryContratosFichaCobrancacliente: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object qryContratosFichaCobrancatipocliente: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
    object qryContratosFichaCobrancanome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryContratosFichaCobrancacidaderesidencia: TStringField
      FieldName = 'cidaderesidencia'
      Size = 50
    end
    object qryContratosFichaCobrancabairroresidencia: TStringField
      FieldName = 'bairroresidencia'
      Size = 50
    end
    object qryContratosFichaCobrancatotalaberto: TFloatField
      FieldName = 'totalaberto'
      DisplayFormat = '###,###,##0.00'
    end
    object qryContratosFichaCobrancaatraso: TDateField
      Alignment = taCenter
      FieldName = 'atraso'
      EditMask = '99/99/9999;1; '
    end
    object qryContratosFichaCobrancaselecionar: TBooleanField
      FieldName = 'selecionar'
    end
  end
  object dsrContratosFichaCobranca: TtecDataSource
    DataSet = qryContratosFichaCobranca
    Left = 542
    Top = 79
  end
  object qryUsuariosContratos: TtecQuery
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
      'Select contrato,'
      '           usuario,'
      '           data'
      'From   usuarioscontratos'
      'Where contrato =:contrato')
    RequestLive = True
    Left = 359
    Top = 297
    ParamData = <
      item
        DataType = ftString
        Name = 'Contrato'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryUsuariosContratoscontrato: TStringField
      FieldName = 'contrato'
    end
    object qryUsuariosContratosusuario: TIntegerField
      FieldName = 'usuario'
    end
    object qryUsuariosContratosdata: TDateField
      FieldName = 'data'
    end
  end
  object dsrCobradorContrato: TtecDataSource
    DataSet = qryCobradorContrato
    Left = 203
    Top = 241
  end
  object qryCobradorContrato: TtecQuery
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
      'Select codigo, '
      '           nome'
      'From   usuarios'
      'Where codigo =:codigo')
    RequestLive = False
    Left = 60
    Top = 241
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Codigo'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryCobradorContratocodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object qryCobradorContratonome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 40
    end
  end
  object qryCobrancaExiste: TtecQuery
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
      'Select contrato'
      'From   usuarioscontratos'
      'Where '
      '/*           Contratos           */            '
      '           and (data = current_date)'
      '           and retorno is null')
    RequestLive = False
    Left = 534
    Top = 144
    object qryCobrancaExistecontrato: TStringField
      FieldName = 'contrato'
      Required = True
    end
  end
end
