inherited dtmFichaFinanceiraFornecedor: TdtmFichaFinanceiraFornecedor
  OldCreateOrder = False
  Left = 678
  Top = 101
  Height = 553
  Width = 672
  object qryFilial: TtecQuery
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
      'Select  codigo,'
      '             nome'
      'From     filiais'
      'Where  codigo =:codigo')
    RequestLive = True
    Left = 74
    Top = 15
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
        Value = '0'
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
    Left = 242
    Top = 15
  end
  object qryFornecedor: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeOpen = qryFornecedorBeforeOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT Codigo,'
      '       CAST(COALESCE(Razao, Nome) AS VARCHAR(60)) AS Nome,'
      '       Tipo'
      ''
      'FROM   vFornecedores'
      ''
      'WHERE  Tipo   = :Tipo AND'
      '       Codigo = :Codigo'
      '')
    RequestLive = True
    Left = 74
    Top = 81
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
    object qryFornecedorcodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryFornecedornome: TStringField
      DisplayWidth = 60
      FieldName = 'nome'
      Size = 60
    end
    object qryFornecedortipo: TStringField
      FieldName = 'tipo'
    end
  end
  object dsrFornecedor: TtecDataSource
    DataSet = qryFornecedor
    Left = 242
    Top = 81
  end
  object qryConsultaFiliais: TtecQuery
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
      'Select   nome,'
      '             codigo'
      'From     filiais'
      'Order By UPPER(TO_ASCII(nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 447
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
      'Select   coalesce(v.razao,v.nome) as nome ,'
      '             v.codigo,'
      '             formatar_cpf_cnpj(v.pessoanumero) as pessoanumero,'
      '             v.estado,'
      '             cast(v.tipo as varchar) as tipo,'
      '             descricao_tipocliente(v.tipo) as tipocliente,'
      '             c.nome as nomecidade'
      'From     vfornecedores v, cidades c'
      '/*    Preenchido em RunTime      */'
      '   and (v.estado = c.estado)'
      '   and (v.cidade = c.codigo)'
      'Order By UPPER(TO_ASCII(coalesce(v.razao,v.nome),'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 447
    Top = 81
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
      DisplayFormat = '0'
    end
    object qryConsultaFornecedorestipocliente: TStringField
      DisplayLabel = 'Tipo fornecedor'
      FieldName = 'tipocliente'
      Size = 15
    end
    object qryConsultaFornecedorestipo: TStringField
      FieldName = 'tipo'
      Visible = False
      Size = 1
    end
  end
  object qryFichaFornecedor: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnProgress = ShowProgress
    BeforeOpen = qryFichaFornecedorBeforeOpen
    AfterScroll = qryFichaFornecedorAfterScroll
    OnCalcFields = qryFichaFornecedorCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'dataemissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fornecedor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cfop'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'grupofilial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'grupofornecedor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Administrador'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'SELECT d.Numero,'
      '       d.Emissao,'
      '       d.DataLancto,'
      '       d.FilialEmissao AS Filial,'
      '       d.Evento,'
      '      (SELECT e.Descricao FROM Eventos e'
      '          WHERE e.Codigo = d.Evento) AS DescricaoEvento,'
      '       d.Valor,'
      '       d.IRRetido,'
      '       d.INSSRetido,'
      '       d.ISSRetido,'
      '       d.COFINSRetido,'
      '       d.PISRetido,'
      '       d.CSLLRetido,'
      '       d.PISCOFINSCSLLRetido,'
      ''
      '       d.Fornecedor,'
      '       d.Referencia,'
      '       d.Complemento,'
      '       np.Codigo,'
      '  /*       np.serie,  */'
      '  /*       np.numero as numeronota, */'
      '       np.CodigoFiscal,'
      '       CAST(COALESCE(v.Razao, v.Nome) AS VARCHAR(60)) AS Nome,'
      '       CAST(f.Nome AS VARCHAR(60)) AS NomeFilial,'
      '       cf.Descricao as CFOPDescricao,'
      ''
      
        '       case when v.tipo = '#39'F'#39' then (select fo.fichaalerta from f' +
        'ornecedores fo where fo.codigo = v.codigo)'
      
        '            when v.tipo = '#39'C'#39' then (select cli.fichaalerta from ' +
        'clientes cli where cli.codigo = v.codigo)'
      '       end as fichaalerta     '
      ''
      
        'FROM   (documentospag d left join (notaspag np left join codigos' +
        'fiscais cf on np.CodigoFiscal = cf.Codigo)'
      
        '                                     on d.Numero = np.DocumentoP' +
        'ag),'
      '        vfornecedores v, filiais f'
      ''
      'WHERE   d.Fornecedor     = v.Codigo AND'
      '        d.TipoFornecedor = v.Tipo   AND'
      '        d.FilialEmissao  = f.Codigo'
      ''
      '%DataEmissao'
      '%Filial'
      '%Fornecedor'
      '%CFOP'
      '%GrupoFilial'
      '%GrupoFornecedor'
      '%Administrador'
      ''
      'ORDER BY d.DataLancto DESC'
      '')
    RequestLive = False
    Left = 68
    Top = 459
    object qryFichaFornecedornumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '###,##0'
    end
    object qryFichaFornecedoremissao: TDateField
      Alignment = taCenter
      FieldName = 'emissao'
      EditMask = '99/99/9999;1; '
    end
    object qryFichaFornecedorDataLancto: TDateField
      FieldName = 'datalancto'
    end
    object qryFichaFornecedorfilial: TIntegerField
      Alignment = taCenter
      FieldName = 'filial'
      DisplayFormat = '000'
    end
    object qryFichaFornecedorEvento: TIntegerField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = 'evento'
      DisplayFormat = '0000'
    end
    object qryFichaFornecedorDescricaoEvento: TStringField
      FieldName = 'descricaoevento'
      Size = 45
    end
    object qryFichaFornecedorvalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '###,###,##0.00'
    end
    object qryFichaFornecedorReferencia: TStringField
      DisplayWidth = 100
      FieldName = 'referencia'
      Size = 100
    end
    object qryFichaFornecedorcodigofiscal: TIntegerField
      Alignment = taCenter
      FieldName = 'codigofiscal'
      DisplayFormat = '0,000'
    end
    object qryFichaFornecedorfornecedor: TIntegerField
      Alignment = taCenter
      FieldName = 'fornecedor'
      DisplayFormat = '0000'
    end
    object qryFichaFornecedornome: TStringField
      DisplayWidth = 60
      FieldName = 'nome'
      Size = 60
    end
    object qryFichaFornecedornomefilial: TStringField
      DisplayWidth = 60
      FieldName = 'nomefilial'
      Size = 60
    end
    object qryFichaFornecedorcfopdescricao: TStringField
      FieldName = 'cfopdescricao'
      Size = 80
    end
    object qryFichaFornecedorcodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryFichaFornecedorcomplemento: TStringField
      FieldName = 'complemento'
      Size = 15
    end
    object qryFichaFornecedorirretido: TFloatField
      FieldName = 'irretido'
      DisplayFormat = '###,###,##0.00'
    end
    object qryFichaFornecedorinssretido: TFloatField
      FieldName = 'inssretido'
      DisplayFormat = '###,###,##0.00'
    end
    object qryFichaFornecedorissretido: TFloatField
      FieldName = 'issretido'
      DisplayFormat = '###,###,##0.00'
    end
    object qryFichaFornecedorcofinsretido: TFloatField
      FieldName = 'cofinsretido'
      DisplayFormat = '###,###,##0.00'
    end
    object qryFichaFornecedorpisretido: TFloatField
      FieldName = 'pisretido'
      DisplayFormat = '###,###,##0.00'
    end
    object qryFichaFornecedorcsllretido: TFloatField
      FieldName = 'csllretido'
      DisplayFormat = '###,###,##0.00'
    end
    object qryFichaFornecedorValorLiquido: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ValorLiquido'
      DisplayFormat = '###,###,##0.00'
      Calculated = True
    end
    object qryFichaFornecedorpiscofinscsllretido: TFloatField
      FieldName = 'piscofinscsllretido'
      DisplayFormat = '0.00'
    end
    object qryFichaFornecedorfichaalerta: TStringField
      FieldName = 'fichaalerta'
      Size = 200
    end
  end
  object dsrFichaFornecedor: TtecDataSource
    DataSet = qryFichaFornecedor
    Left = 243
    Top = 466
  end
  object qryDuplicatas: TtecQuery
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
      
        'SELECT CAST(TRIM(BOTH '#39' '#39' FROM TO_CHAR(Numero, '#39'999'#39'))  || '#39'.'#39' |' +
        '|'
      
        '            TRIM(BOTH '#39' '#39' FROM TO_CHAR((SELECT COUNT(*) FROM  Du' +
        'plicatas d1'
      
        '                                                        WHERE d1' +
        '.DocumentoPag = :Documento), '#39'999'#39')) AS VARCHAR)'
      '                          as Ordem,'
      '       DataVencto,'
      '       ValorVencto,'
      '       DataPagto,'
      '       ValorPagto,'
      '       ContaPagto,'
      '       ChequePagto,'
      '       FilialPagto,'
      '       ValorDesconto,'
      '       Juros'
      ''
      'FROM   duplicatas'
      ''
      'WHERE  DocumentoPag = :Documento'
      ''
      'ORDER BY DataVencto')
    RequestLive = False
    Left = 72
    Top = 333
    ParamData = <
      item
        DataType = ftInteger
        Name = 'documento'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryDuplicatasdatavencto: TDateField
      Alignment = taCenter
      DisplayLabel = 'Vencto'
      FieldName = 'datavencto'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryDuplicatasvalorvencto: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'valorvencto'
      Required = True
      DisplayFormat = '###,##0.00'
    end
    object qryDuplicatasdatapagto: TDateField
      Alignment = taCenter
      DisplayLabel = 'Pagto'
      FieldName = 'datapagto'
      EditMask = '99/99/9999;1; '
    end
    object qryDuplicatasvalorpagto: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'valorpagto'
      DisplayFormat = '###,##0.00'
    end
    object qryDuplicatascontapagto: TIntegerField
      FieldName = 'contapagto'
      DisplayFormat = '#,###,##0'
    end
    object qryDuplicataschequepagto: TIntegerField
      FieldName = 'chequepagto'
      DisplayFormat = '###,##0'
    end
    object qryDuplicatasfilialpagto: TIntegerField
      FieldName = 'filialpagto'
      DisplayFormat = '0'
    end
    object qryDuplicatasvalordesconto: TFloatField
      FieldName = 'valordesconto'
      DisplayFormat = '###,##0.00'
    end
    object qryDuplicatasjuros: TFloatField
      FieldName = 'juros'
      DisplayFormat = '###,##0.00'
    end
    object qryDuplicatasOrdem: TStringField
      FieldName = 'Ordem'
      Size = 50
    end
  end
  object dsrDuplicatas: TtecDataSource
    DataSet = qryDuplicatas
    Left = 239
    Top = 333
  end
  object qryProdutosNotas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterClose = qryProdutosNotasAfterScroll
    AfterScroll = qryProdutosNotasAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'Select pn.filial,'
      '       pn.produto,'
      '       p.descricao,'
      
        '       (select gr.descricao from grades gr where gr.codigo = c.g' +
        'rade1) as linha,'
      
        '       (select gr.descricao from grades gr where gr.codigo = c.g' +
        'rade2) as coluna, '
      '       p.valorgrade1,'
      '       p.valorgrade2,'
      '       pn.quantidade,'
      '       pn.precounitario,'
      '       (pn.quantidade * pn.precounitario) as precototal,'
      '       pn.aliquotaicms,'
      '       pn.codigofiscal'
      'From   produtosnotaspag pn, produtos p, caracteristicas c'
      'Where  (pn.codigonota =:codigo) and'
      '           (pn.produto = p.codigo) and'
      '           (p.caracteristica = c.codigo)')
    RequestLive = False
    Left = 72
    Top = 391
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProdutosNotasfilial: TIntegerField
      FieldName = 'filial'
      Required = True
      DisplayFormat = '0'
    end
    object qryProdutosNotasproduto: TLargeintField
      FieldName = 'produto'
      Required = True
    end
    object qryProdutosNotasdescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
    object qryProdutosNotasquantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
      DisplayFormat = '0'
    end
    object qryProdutosNotasprecounitario: TFloatField
      FieldName = 'precounitario'
      Required = True
      DisplayFormat = '###,##0.00'
    end
    object qryProdutosNotasprecototal: TFloatField
      FieldName = 'precototal'
      DisplayFormat = '###,##0.00'
    end
    object qryProdutosNotasaliquotaicms: TFloatField
      FieldName = 'aliquotaicms'
      DisplayFormat = '0.00'
    end
    object qryProdutosNotaslinha: TStringField
      FieldName = 'linha'
      Size = 50
    end
    object qryProdutosNotascoluna: TStringField
      FieldName = 'coluna'
      Size = 50
    end
    object qryProdutosNotasvalorgrade1: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade1'
      Size = 30
    end
    object qryProdutosNotasvalorgrade2: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade2'
      Size = 30
    end
    object qryProdutosNotascodigofiscal: TIntegerField
      Alignment = taCenter
      FieldName = 'codigofiscal'
      Required = True
      DisplayFormat = '#,###'
    end
  end
  object dsrProdutosNotas: TtecDataSource
    DataSet = qryProdutosNotas
    Left = 247
    Top = 399
  end
  object qryCFOP: TtecQuery
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
      'Select codigo,'
      '           descricao'
      'From   codigosfiscais'
      'Where codigo =:codigo')
    RequestLive = False
    Left = 74
    Top = 271
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryCFOPcodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryCFOPdescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
  end
  object dsrCFOP: TtecDataSource
    DataSet = qryCFOP
    Left = 242
    Top = 271
  end
  object qryConsultaCFOP: TtecQuery
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
      'Select  descricao,'
      '            codigo'
      'From    codigosfiscais'
      'Order By UPPER(TO_ASCII(descricao,'#39'LATIN1'#39'))'
      '            ')
    RequestLive = False
    Left = 447
    Top = 271
    object qryConsultaCFOPcodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Required = True
    end
    object qryConsultaCFOPdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Required = True
      Size = 50
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
      'Select codigo,'
      '           descricao'
      'From   gruposfiliais'
      'Where (codigo =:codigo)')
    RequestLive = True
    Left = 74
    Top = 145
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryGrupoFiliaiscodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object qryGrupoFiliaisdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 30
    end
  end
  object dsrGruposFiliais: TtecDataSource
    DataSet = qryGrupoFiliais
    Left = 242
    Top = 145
  end
  object qryConsultaGruposFiliais: TtecQuery
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
    Left = 447
    Top = 145
    object qryConsultaGruposFiliaisdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
    object qryConsultaGruposFiliaiscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
  end
  object qryGruposFornecedores: TtecQuery
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
      '           nome'
      'From   gruposfornecedores'
      'Where codigo =:codigo')
    RequestLive = True
    Left = 74
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryGruposFornecedorescodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object qryGruposFornecedoresnome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 50
    end
  end
  object dsrGruposFornecedores: TtecDataSource
    DataSet = qryGruposFornecedores
    Left = 242
    Top = 208
  end
  object qryConsultaGruposFornecedores: TtecQuery
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
      'From   gruposfornecedores'
      'Order By UPPER(TO_ASCII(nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 447
    Top = 208
    object qryConsultaGruposFornecedoresnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 50
    end
    object qryConsultaGruposFornecedorescodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
  end
end
