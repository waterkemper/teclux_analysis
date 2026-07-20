inherited dtmAutorizacaoPagamento: TdtmAutorizacaoPagamento
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 189
  Top = 222
  Height = 368
  Width = 568
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
      'SELECT codigo, nome'
      'FROM      filiais'
      'WHERE  codigo=:codigo')
    RequestLive = True
    Left = 57
    Top = 15
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryFilialcodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryFilialnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
  end
  object dsrFilial: TtecDataSource
    DataSet = qryFilial
    Left = 186
    Top = 15
  end
  object qryConsultaFiliais: TtecQuery
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
      'SELECT nome,codigo'
      'FROM     filiais'
      'ORDER BY UPPER(TO_ASCII(nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 336
    Top = 15
    object qryConsultaFiliaisnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaFiliaiscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
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
      'SELECT codigo, descricao'
      'FROM     gruposfiliais'
      'WHERE codigo=:codigo')
    RequestLive = True
    Left = 57
    Top = 70
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
    Left = 186
    Top = 70
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
      'SELECT descricao,codigo'
      'FROM     gruposfiliais'
      'ORDER BY UPPER(TO_ASCII(descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 336
    Top = 70
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
  object qryFornecedores: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeOpen = qryFornecedoresBeforeOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'Select  codigo,'
      '            nome,'
      '            tipo'
      'From    vfornecedores'
      'Where (tipo =:tipo) and'
      '            (codigo =:codigo)')
    RequestLive = True
    Left = 57
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryFornecedorescodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryFornecedoresnome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object qryFornecedorestipo: TStringField
      FieldName = 'tipo'
    end
  end
  object dsrFornecedores: TtecDataSource
    DataSet = qryFornecedores
    Left = 186
    Top = 128
  end
  object qryConsultaFornecedores: TtecQuery
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
      'Select  coalesce(v.razao,v.nome) as nome ,'
      '            v.codigo,'
      '            v.tipo,'
      '            formatar_cpf_cnpj(v.pessoanumero) as pessoanumero,'
      '            descricao_tipocliente(v.tipo) as tipocliente,'
      '            v.estado,'
      '            c.nome as nomecidade'
      'From    vfornecedores v, cidades c'
      '/*     Preenchido em RunTime      */'
      '   and (v.estado = c.estado)'
      '   and (v.cidade = c.codigo)'
      'Order By UPPER(TO_ASCII(coalesce(v.razao,v.nome) ,'#39'LATIN1'#39'))')
    RequestLive = True
    Left = 336
    Top = 128
    object qryConsultaFornecedoresnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaFornecedorespessoanumero: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'pessoanumero'
      Size = 18
    end
    object qryConsultaFornecedoresnomecidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'nomecidade'
      Required = True
      Size = 30
    end
    object qryConsultaFornecedoresestado: TStringField
      DisplayLabel = 'UF'
      FieldName = 'estado'
      Size = 2
    end
    object qryConsultaFornecedorescodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
    object qryConsultaFornecedorestipocliente: TStringField
      DisplayLabel = 'Tipo cliente'
      FieldName = 'tipocliente'
      Size = 18
    end
    object qryConsultaFornecedorestipo: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'tipo'
      Visible = False
      Size = 1
    end
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
    BeforeOpen = qryDuplicatasBeforeOpen
    OnFilterRecord = qryDuplicatasFilterRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'Operacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Lancamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Vencimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Autorizacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GrupoFilial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fornecedor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Administrador'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'Select '
      
        '       CAST(TRIM(BOTH '#39' '#39' FROM TO_CHAR(t.Numero, '#39'999'#39'))  || '#39'.'#39 +
        ' ||'
      
        '            TRIM(BOTH '#39' '#39' FROM TO_CHAR((SELECT COUNT(*) FROM  Du' +
        'plicatas d1'
      
        '                                                        WHERE d1' +
        '.DocumentoPag = t.DocumentoPag), '#39'999'#39')) AS VARCHAR)'
      '                          as Ordem,'
      '       t.documentopag,'
      '       t.datavencto,'
      '       t.valorvencto,'
      '       t.valordesconto,'
      '       t.tipojuros,'
      '       t.juros,'
      '       t.tipomulta,'
      '       t.multa,'
      '       t.numero,'
      '       t.autorizado,'
      '       false as selecionar,'
      
        '       case when PrimeiroDiaUtil(d.filialemissao, t.datavencto, ' +
        #39'P'#39') < current_date then'
      '                         case when (t.tipomulta = '#39'%'#39') then'
      
        '                                           case when (t.tipojuro' +
        's = '#39'%'#39') then t.valorvencto + ((t.valorvencto * coalesce(t.multa' +
        ',0)) / 100) +'
      
        '                                                     (t.valorven' +
        'cto * (abs(PrimeiroDiaUtil(d.filialemissao, t.datavencto, '#39'P'#39') -' +
        ' current_date) * coalesce(t.juros,0) / 100))'
      
        '                                                     /* - coales' +
        'ce(t.valordesconto,0) */'
      
        '                                                    when (t.tipo' +
        'juros =  '#39'V'#39') then t.valorvencto + ((t.valorvencto * coalesce(t.' +
        'multa,0)) / 100) +'
      
        '                                                         (abs(Pr' +
        'imeiroDiaUtil(d.filialemissao, t.datavencto, '#39'P'#39') - current_date' +
        ') * coalesce(t.juros,0))'
      
        '                                                         /* - co' +
        'alesce(t.valordesconto,0) */'
      '                                           end'
      '                                  when (t.tipomulta = '#39'V'#39') then'
      
        '                                           case when (t.tipojuro' +
        's = '#39'%'#39') then t.valorvencto + coalesce(t.multa,0) +'
      
        '                                                     (t.valorven' +
        'cto * (abs(PrimeiroDiaUtil(d.filialemissao, t.datavencto, '#39'P'#39') -' +
        ' current_date) * coalesce(t.juros,0) / 100))'
      
        '                                                     /* - coales' +
        'ce(t.valordesconto,0) */'
      
        '                                                    when (t.tipo' +
        'juros =  '#39'V'#39') then t.valorvencto + coalesce(t.multa,0) +'
      
        '                                                         (abs(Pr' +
        'imeiroDiaUtil(d.filialemissao, t.datavencto, '#39'P'#39') - current_date' +
        ') * coalesce(t.juros,0))'
      
        '                                                         /* - co' +
        'alesce(t.valordesconto,0) */'
      '                                           end'
      '                         end'
      '                else t.valorvencto - coalesce(t.valordesconto,0)'
      '       end as  previsao,'
      ''
      '       d.fornecedor,'
      '       d.tipofornecedor,'
      '       d.referencia,'
      '       d.complemento,'
      '       coalesce(np.data, d.datalancto) as datalancto,'
      '       coalesce(np.emissao, d.emissao) as emissao,'
      '       coalesce(np.valornota, d.valor) as valornota,     '
      '       d.filialemissao,'
      
        '       (select razao from filiais f where f.codigo = d.filialemi' +
        'ssao) as descricaofilialemissao,'
      '       vf.nome,'
      '       vf.rua, '
      '       (select b.nome'
      '        from bairros b'
      '        where (b.estado = vf.estado) and'
      '              (b.cidade = vf.cidade) and'
      '              (b.codigo = vf.bairro)'
      '       ) as nomebairro,'
      '       vf.cep,'
      '       (select c.nome'
      '        from cidades c'
      '        where (c.estado = vf.estado) and'
      '              (c.codigo = vf.cidade)'
      '       ) as nomecidade,'
      '      vf.estado,'
      '      t.dataautorizacaopagto,'
      '      t.observacao'
      ''
      
        'From   duplicatas t, documentospag d left join notaspag np on (n' +
        'p.documentopag = d.numero)'
      
        '                                                        join vfo' +
        'rnecedores vf on d.fornecedor = vf.codigo and'
      
        '                                                                ' +
        '                            d.tipofornecedor = vf.tipo    '
      'where (t.documentopag = d.numero)'
      '           and not (coalesce(d.previsao,false))'
      '           and (t.datapagto is null)'
      '%Operacao'
      '%Lancamento'
      '%Vencimento'
      '%Autorizacao'
      '%Filial'
      '%GrupoFilial'
      '%Fornecedor'
      '%Administrador'
      
        'Order By UPPER(TO_ASCII(vf.nome,'#39'LATIN1'#39')), d.tipofornecedor, t.' +
        'documentopag, t.datavencto')
    RequestLive = True
    Left = 337
    Top = 189
    object qryDuplicatasdocumentopag: TIntegerField
      FieldName = 'documentopag'
      Required = True
      DisplayFormat = '###,##0'
    end
    object qryDuplicatasdatavencto: TDateField
      Alignment = taCenter
      FieldName = 'datavencto'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryDuplicatasvalorvencto: TFloatField
      FieldName = 'valorvencto'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryDuplicatasvalordesconto: TFloatField
      FieldName = 'valordesconto'
      DisplayFormat = '###,##0.00'
    end
    object qryDuplicatastipojuros: TStringField
      FieldName = 'tipojuros'
      Required = True
      Size = 1
    end
    object qryDuplicatasjuros: TFloatField
      FieldName = 'juros'
      DisplayFormat = '###,##0.00'
    end
    object qryDuplicatastipomulta: TStringField
      FieldName = 'tipomulta'
      Required = True
      Size = 1
    end
    object qryDuplicatasmulta: TFloatField
      FieldName = 'multa'
      DisplayFormat = '###,##0.00'
    end
    object qryDuplicatasnumero: TIntegerField
      FieldName = 'numero'
      Required = True
      DisplayFormat = '0'
    end
    object qryDuplicatasprevisao: TFloatField
      FieldName = 'previsao'
      DisplayFormat = '###,###,##0.00'
    end
    object qryDuplicatasfornecedor: TIntegerField
      FieldName = 'fornecedor'
      Required = True
      DisplayFormat = '###,##0'
    end
    object qryDuplicatastipofornecedor: TStringField
      FieldName = 'tipofornecedor'
      Required = True
      Size = 1
    end
    object qryDuplicatasautorizado: TBooleanField
      FieldName = 'autorizado'
    end
    object qryDuplicatasselecionar: TBooleanField
      FieldName = 'selecionar'
    end
    object qryDuplicatasfilialemissao: TIntegerField
      FieldName = 'filialemissao'
      DisplayFormat = '0'
    end
    object qryDuplicatasdescricaofilialemissao: TStringField
      FieldName = 'descricaofilialemissao'
      Size = 40
    end
    object qryDuplicatasrua: TStringField
      FieldName = 'rua'
      Size = 100
    end
    object qryDuplicatasnomebairro: TStringField
      FieldName = 'nomebairro'
      Size = 30
    end
    object qryDuplicatascep: TIntegerField
      FieldName = 'cep'
      DisplayFormat = '0'
    end
    object qryDuplicatasnomecidade: TStringField
      FieldName = 'nomecidade'
      Size = 25
    end
    object qryDuplicatasestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object qryDuplicatasemissao: TDateField
      Alignment = taCenter
      FieldName = 'emissao'
      EditMask = '99/99/9999;1; '
    end
    object qryDuplicatasdatalancto: TDateField
      Alignment = taCenter
      FieldName = 'datalancto'
      EditMask = '99/99/9999;1; '
    end
    object qryDuplicatasvalornota: TFloatField
      FieldName = 'valornota'
      DisplayFormat = '0.00'
    end
    object qryDuplicatasreferencia: TStringField
      FieldName = 'referencia'
      Size = 100
    end
    object qryDuplicatasordem: TStringField
      FieldName = 'ordem'
      Size = 5
    end
    object qryDuplicatascomplemento: TStringField
      FieldName = 'complemento'
      Size = 15
    end
    object qryDuplicatasnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryDuplicatasdataautorizacaopagto: TDateField
      FieldName = 'dataautorizacaopagto'
    end
    object qryDuplicatasobservacao: TStringField
      FieldName = 'observacao'
      Size = 1000
    end
  end
  object dsrDuplicatas: TtecDataSource
    DataSet = qryDuplicatas
    Left = 188
    Top = 189
  end
end
