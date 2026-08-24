inherited dtmConsultaContratos: TdtmConsultaContratos
  Left = 451
  Top = 295
  Height = 572
  Width = 703
  object qryFiliais: TtecQuery
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
      'select codigo, nome'
      'from filiais'
      'where codigo =: codigo')
    RequestLive = False
    Left = 40
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryFiliaiscodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryFiliaisnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
  end
  object dsrFiliais: TtecDataSource
    DataSet = qryFiliais
    Left = 128
    Top = 8
  end
  object qryVendedores: TtecQuery
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
      'Select u.codigo,  '
      '           u.nome'
      
        'From  (usuarios u left join gruposusuarios gu on u.grupo=gu.codi' +
        'go)'
      'Where (u.codigo =:codigo) and'
      '           (u.venda or gu.vendedor)')
    RequestLive = False
    Left = 40
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryVendedorescodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryVendedoresnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
  end
  object dsrVendedores: TtecDataSource
    DataSet = qryVendedores
    Left = 128
    Top = 56
  end
  object qryPlanos: TtecQuery
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
      'select codigo, descricao'
      'from planos'
      'where codigo =: codigo')
    RequestLive = False
    Left = 40
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryPlanoscodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryPlanosdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 30
    end
  end
  object dsrPlanos: TtecDataSource
    DataSet = qryPlanos
    Left = 128
    Top = 104
  end
  object qryClientes: TtecQuery
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
      'Select  codigo,'
      '            coalesce(razao,nome) as nome,'
      '            tipo'
      'From    vfornecedores'
      'Where (tipo =:tipo) and'
      '            (codigo =:codigo)')
    RequestLive = False
    Left = 40
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryClientescodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryClientesnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryClientestipo: TStringField
      FieldName = 'tipo'
      Size = 1
    end
  end
  object dsrClientes: TtecDataSource
    DataSet = qryClientes
    Left = 128
    Top = 152
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
      'select codigo, nome'
      'from filiais'
      'order by UPPER(TO_ASCII(nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 224
    Top = 8
    object qryConsultaFiliaisnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Required = True
      Size = 40
    end
    object qryConsultaFiliaiscodigo: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'codigo'
      Required = True
    end
  end
  object qryConsultaVendedores: TtecQuery
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
      'select u.codigo, u.nome'
      
        'from (usuarios u left join gruposusuarios gu on u.grupo = gu.cod' +
        'igo)'
      'where (u.venda = gu.vendedor)'
      'order by UPPER(TO_ASCII(u.nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 224
    Top = 56
    object qryConsultaVendedoresnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaVendedorescodigo: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
  object qryProdutos: TtecQuery
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
      'Select p.codigo,'
      
        '           cast(p.descricao||'#39' '#39'||coalesce(p.valorgrade1,'#39#39')||'#39' ' +
        #39'||coalesce(p.valorgrade2,'#39#39') as varchar) as descricao'
      'From   produtos p'
      'Where p.codigo =:codigo')
    RequestLive = False
    Left = 40
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProdutoscodigo: TLargeintField
      FieldName = 'codigo'
      Required = True
    end
    object qryProdutosdescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
  end
  object dsrProdutos: TtecDataSource
    DataSet = qryProdutos
    Left = 128
    Top = 200
  end
  object qryCaracteristicas: TtecQuery
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
      'Select  codigo,  '
      '            descricao'
      'From    caracteristicas'
      'Where  codigo =: codigo ')
    RequestLive = False
    Left = 328
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryCaracteristicascodigo: TLargeintField
      FieldName = 'codigo'
      Required = True
    end
    object qryCaracteristicasdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 40
    end
  end
  object dsrCaracteristicas: TtecDataSource
    DataSet = qryCaracteristicas
    Left = 416
    Top = 8
  end
  object qryConsultaClientes: TtecQuery
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
      'Select  coalesce(v.razao,v.nome) as nome,'
      '            v.codigo,'
      '            formatar_cpf_cnpj(v.pessoanumero) as pessoanumero,'
      '            cast(v.tipo as varchar) as tipo,'
      '            cast(case when v.tipo = '#39'F'#39'  then '#39'F - Fornecedor'#39
      
        '                            when v.tipo = '#39'C'#39'  then '#39'C - Cliente' +
        #39
      '                            when v.tipo = '#39'L'#39'  then '#39'L - Filial'#39
      '                    end  as varchar) as tipopessoa,'
      '            v.estado,'
      '            c.nome as nomecidade '
      'From    vfornecedores v, cidades c'
      'Where false   /* Alterado em RumTime  */     '
      '    and (v.estado = c.estado)'
      '    and (v.cidade = c.codigo)'
      'Order By UPPER(TO_ASCII(coalesce(v.razao,v.nome),'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 224
    Top = 152
    object qryConsultaClientesnome: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 40
      FieldName = 'nome'
      Size = 30
    end
    object qryConsultaClientespessoanumero: TStringField
      DisplayLabel = 'CPF/CNPJ'
      DisplayWidth = 14
      FieldName = 'pessoanumero'
      Size = 14
    end
    object qryConsultaClientesnomecidade: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 20
      FieldName = 'nomecidade'
      Required = True
    end
    object qryConsultaClientesestado: TStringField
      DisplayLabel = 'UF'
      FieldName = 'estado'
      Size = 2
    end
    object qryConsultaClientescodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryConsultaClientestipopessoa: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 14
      FieldName = 'tipopessoa'
      Size = 14
    end
    object qryConsultaClientestipo: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 1
      FieldName = 'tipo'
      Visible = False
      Size = 5
    end
  end
  object qryConsultaProdutos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryConsultaProdutosAfterOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT p.descricao,'
      '       p.valorgrade1,'
      '       p.valorgrade2,'
      '       p.referencia,'
      '       p.codigo,'
      '       p.codigovisual,'     
      '      codigobarras(p.codigo) as codigobarras'                
      'FROM produtos p'
      'WHERE false'
      
        'ORDER BY UPPER(TO_ASCII(p.descricao,'#39'latin1'#39')), p.valorgrade1, p' +
        '.valorgrade2')
    RequestLive = False
    Left = 224
    Top = 200
    object qryConsultaProdutosdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 40
    end
    object qryConsultaProdutosvalorgrade1: TStringField
      DisplayLabel = 'Linha'
      DisplayWidth = 10
      FieldName = 'valorgrade1'
      Size = 30
    end
    object qryConsultaProdutosvalorgrade2: TStringField
      DisplayLabel = 'Coluna'
      DisplayWidth = 10
      FieldName = 'valorgrade2'
      Size = 30
    end
    object qryConsultaProdutosreferencia: TStringField
      DisplayLabel = 'Refer'#234'ncia'
      FieldName = 'referencia'
      Size = 15
    end
    object qryConsultaProdutoscodigo: TLargeintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Visible = False
    end
    object qryConsultaProdutoscodigovisual: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigovisual'
    end
    object qryConsultaProdutoscodigobarras: TLargeintField
      DisplayLabel = 'C'#243'digo de Barras'
      FieldName = 'codigobarras'
    end
  end
  object qryConsultaGrupoProdutos: TtecQuery
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
      'select codigo, descricao'
      'from grupos'
      'order by UPPER(TO_ASCII(descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 512
    Top = 56
    object qryConsultaGrupoProdutosdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
    object qryConsultaGrupoProdutoscodigo: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Size = 4
    end
  end
  object qryConsultaPlanos: TtecQuery
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
      'select codigo, descricao'
      'from planos'
      'order by UPPER(TO_ASCII(descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 224
    Top = 104
    object qryConsultaPlanosdescricao: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'descricao'
      Size = 30
    end
    object qryConsultaPlanoscodigo: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'codigo'
    end
  end
  object qryConsultaCaracteristicas: TtecQuery
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
      'SELECT c.Descricao,'
      '       c.Codigo,'
      '       c.CodigoVisual'
      'From caracteristicas c'
      'Where False'
      'Order By UPPER(TO_ASCII(c.Descricao, '#39'latin1'#39'));')
    RequestLive = False
    Left = 520
    Top = 8
    object qryConsultaCaracteristicasdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Required = True
      Size = 40
    end
    object qryConsultaCaracteristicascodigo: TLargeintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Required = True
      Visible = False
    end
    object qryConsultaCaracteristicascodigovisual: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigovisual'
    end
  end
  object qryGrupoProdutos: TtecQuery
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
      'select codigo, descricao'
      'from grupos'
      'where codigo =: codigo')
    RequestLive = False
    Left = 328
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryGrupoProdutoscodigo: TStringField
      FieldName = 'codigo'
      Required = True
      Size = 4
    end
    object qryGrupoProdutosdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 30
    end
  end
  object dsrGrupoProdutos: TtecDataSource
    DataSet = qryGrupoProdutos
    Left = 416
    Top = 56
  end
  object qryClasseProdutos: TtecQuery
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
      'select codigo, descricao'
      'from classes'
      'where codigo =: codigo')
    RequestLive = False
    Left = 328
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryClasseProdutoscodigo: TStringField
      FieldName = 'codigo'
      Size = 2
    end
    object qryClasseProdutosdescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
  end
  object dsrClasseProdutos: TtecDataSource
    DataSet = qryClasseProdutos
    Left = 416
    Top = 104
  end
  object qryConsultaClasseProdutos: TtecQuery
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
      'select codigo, descricao'
      'from classes'
      'order by UPPER(TO_ASCII(descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 520
    Top = 104
    object qryConsultaClasseProdutosdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Required = True
      Size = 30
    end
    object qryConsultaClasseProdutoscodigo: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Required = True
      Size = 2
    end
  end
  object qryContratos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryContratosAfterScroll
    OnCalcFields = qryContratosCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'Situacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Emaberto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quitado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Renegociado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EmAtraso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Abertura'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fechamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Plano'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Reservado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Vendedor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Caracteristica'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Grupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Classe'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fornecedor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Pedidocliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Ordenacao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select c.numero,'
      '       c.data,'
      '       c.datareservado, c.faturamento, c.pedidocliente,'
      '       c.cliente,'
      '       cast(0 as numeric(11,2)) as TotalProdutos,'
      '       formatar_cpf_cnpj(c.pessoanumero) as pessoanumero,'
      '       cast(c.cliente||'#39' - '#39'||c.nome as varchar) as clientenome,'
      '       c.estado,'
      '       c.situacao,'
      '       cast (case when c.situacao = '#39'O'#39' then '#39'OR'#199'ADO'#39
      '                        when c.situacao = '#39'R'#39' then '#39'RESERVADO'#39
      '                        when c.situacao = '#39'F'#39' then '#39'FATURADO'#39
      
        '                        when c.situacao = '#39'P'#39' then '#39'NOTA PARCIAL' +
        #39
      '                        when c.situacao = '#39'N'#39' then '#39'NOTA FISCAL'#39
      '                        when c.situacao = '#39'C'#39' then '#39'CANCELADO'#39
      '             end as varchar) as NomeSituacao,'
      '       vficha_situacaocontrato(c.numero) as situacaocontrato,'
      '       contratos_emaberto(c.numero) as aberto,'
      '       contratos_quitado(c.numero) as quitado,'
      '       (select c2.numero'
      '        from contratos c2'
      '        where c2.origem = c.numero) as renegociado,'
      
        '       (select descricao from planos pl where pl.codigo = c.plan' +
        'o) as plano,'
      '       c.vendedor,'
      
        '       cast(c.vendedor||'#39' - '#39'||(select u.nome from usuarios u wh' +
        'ere u.codigo = c.vendedor) as varchar) as vendedornome,'
      '       c.valorprazo,'
      '       c.valorvista,'
      '       c.desconto,'
      '       c.frete,'
      '       c.seguro,'
      '       c.valoricmssubstituicao,'
      '       c.creditotroca,'
      
        '       (select sum(pc1.quantidade*pc1.precovenda) from produtosc' +
        'ontratos pc1 where pc1.contrato = c.numero) as totalItens,'
      '       c.nome,'
      '       c.emitirnotadepoisde,'
      '       false as selecionar'
      ''
      'from contratos c'
      '%Situacao'
      '%Emaberto'
      '%Quitado'
      '%Renegociado'
      '%EmAtraso'
      '%Abertura'
      '%Fechamento'
      '%Cliente'
      '%Plano'
      '%Filial'
      '%Reservado'
      '%Vendedor'
      '%Produto'
      '%Caracteristica'
      '%Grupo'
      '%Classe'
      '%Fornecedor'
      '%Pedidocliente'
      '%Contrato'
      '%Ordenacao')
    RequestLive = True
    Left = 328
    Top = 200
    object qryContratosnumero: TStringField
      FieldName = 'numero'
    end
    object qryContratosdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object qryContratosfaturamento: TDateField
      Alignment = taCenter
      FieldName = 'faturamento'
      EditMask = '99/99/9999;1; '
    end
    object qryContratospessoanumero: TStringField
      FieldName = 'pessoanumero'
      Size = 50
    end
    object qryContratoscliente: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object qryContratosclientenome: TStringField
      FieldName = 'clientenome'
      Size = 50
    end
    object qryContratosestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object qryContratossituacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
    object qryContratosnomesituacao: TStringField
      FieldName = 'nomesituacao'
      Size = 50
    end
    object qryContratossituacaocontrato: TStringField
      FieldName = 'situacaocontrato'
      Size = 10
    end
    object qryContratosaberto: TBooleanField
      FieldName = 'aberto'
    end
    object qryContratosrenegociado: TStringField
      FieldName = 'renegociado'
    end
    object qryContratosplano: TStringField
      FieldName = 'plano'
      Size = 50
    end
    object qryContratosvendedor: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'vendedor'
      Required = True
      DisplayFormat = '0'
    end
    object qryContratosvendedornome: TStringField
      FieldName = 'vendedornome'
      Size = 50
    end
    object qryContratospedidocliente: TStringField
      FieldName = 'pedidocliente'
      Size = 15
    end
    object qryContratosselecionar: TBooleanField
      FieldName = 'selecionar'
    end
    object qryContratosnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryContratosdatareservado: TDateField
      Alignment = taCenter
      FieldName = 'datareservado'
      EditMask = '99/99/9999;1; '
    end
    object qryContratosvalorvista: TFloatField
      FieldName = 'valorvista'
      DisplayFormat = '0.00'
    end
    object qryContratosdesconto: TFloatField
      FieldName = 'desconto'
      DisplayFormat = '0.00'
    end
    object qryContratostotalprodutos: TFloatField
      FieldName = 'totalprodutos'
      DisplayFormat = '0.00'
    end
    object qryContratosvalorprazo: TFloatField
      FieldName = 'valorprazo'
      DisplayFormat = '0.00'
    end
    object qryContratostotalitens: TFloatField
      FieldName = 'totalitens'
      DisplayFormat = '0.00'
    end
    object qryContratosacrescimo: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'acrescimo'
      DisplayFormat = '0.00'
      Currency = False
      Calculated = True
    end
    object qryContratossubtotal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'subtotal'
      DisplayFormat = '0.00'
      Currency = False
      Calculated = True
    end
    object qryContratosfrete: TFloatField
      FieldName = 'frete'
      OnGetText = qryContratosfreteGetText
      DisplayFormat = '0.00'
    end
    object qryContratosseguro: TFloatField
      FieldName = 'seguro'
      DisplayFormat = '0.00'
    end
    object qryContratosvaloricmssubstituicao: TFloatField
      DefaultExpression = '0,00'
      FieldName = 'valoricmssubstituicao'
      DisplayFormat = '0.00'
    end
    object qryContratoscreditotroca: TFloatField
      FieldName = 'creditotroca'
      DisplayFormat = '0.00'
    end
    object qryContratosquitado: TBooleanField
      FieldName = 'quitado'
    end
    object qryContratosemitirnotadepoisde: TDateField
      FieldName = 'emitirnotadepoisde'
    end
  end
  object qryFornecedores: TtecQuery
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
      'Select f.codigo, f.nome'
      'From fornecedores f'
      'Where f.codigo =: codigo')
    RequestLive = False
    Left = 328
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryFornecedorescodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
    object qryFornecedoresnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Required = True
      Size = 40
    end
  end
  object dsrFornecedores: TtecDataSource
    DataSet = qryFornecedores
    Left = 416
    Top = 152
  end
  object qryConsultaFornecedores: TtecQuery
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
      'Select  f.nome,'
      '            f.codigo,'
      '            formatar_cpf_cnpj(f.pessoanumero) as pessoanumero,'
      '            f.estado,'
      '            c.nome as nomecidade '
      'From    fornecedores f, cidades c'
      'Where false   /* Alterado em RumTime  */     '
      '    and (f.estado = c.estado)'
      '    and (f.cidade = c.codigo)'
      'Order By UPPER(TO_ASCII(f.nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 520
    Top = 152
    object qryConsultaFornecedoresnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Required = True
      Size = 40
    end
    object qryConsultaFornecedorespessoanumero: TStringField
      DisplayLabel = 'CPF/CNPJ'
      DisplayWidth = 14
      FieldName = 'pessoanumero'
      Size = 14
    end
    object qryConsultaFornecedoresnomecidade: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 20
      FieldName = 'nomecidade'
      Required = True
    end
    object qryConsultaFornecedoresestado: TStringField
      DisplayLabel = 'UF'
      FieldName = 'estado'
      Required = True
      Size = 2
    end
    object qryConsultaFornecedorescodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
  end
  object dsrContratos: TtecDataSource
    DataSet = qryContratos
    Left = 416
    Top = 200
  end
  object qryProdutosContratos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkFields = 'numero=contrato'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrImprimirContratos
    Constraints = <>
    AfterPost = qryProdutosContratosAfterPost
    AfterScroll = qryProdutosContratosAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select pc.contrato,'
      '       pc.produto,'
      '       p.descricao,'
      '       pc.quantidade,'
      '       pc.filial,'
      '       pc.precovenda,'
      '       (pc.quantidade * pc.precovenda) as total,'
      '       pc.entrega,'
      '       pc.dias,'
      '       (select ei.valor'
      '        from estadosicms ei'
      '        where (ei.estado = :estado) and'
      '                   (ei.icms = (select c2.icms'
      '                                     from caracteristicas c2'
      
        '                                     where c2.codigo = p.caracte' +
        'ristica))'
      '       ) as aliquotaicms,'
      '       (select i.aliquota'
      '        from ipi i'
      '        where i.codigo = (select c1.ipi'
      '                                     from caracteristicas c1'
      
        '                                     where c1.codigo = p.caracte' +
        'ristica)'
      '       ) as aliquotaipi,'
      
        '       (select g.descricao from grades g, caracteristicas c wher' +
        'e c.codigo = p.caracteristica and g.codigo = c.grade1) as linha,'
      
        '       (select g.descricao from grades g, caracteristicas c wher' +
        'e c.codigo = p.caracteristica and g.codigo = c.grade2) as coluna' +
        ','
      '       p.valorgrade1,'
      '       p.valorgrade2,'
      '       pedidos_estoquepedido(pc.produto,pc.filial) as pedido,'
      '       e.emestoque,'
      '       e.reservado,'
      '       pc.xped,'
      '       pc.vendedor,'
      
        '       (select u.nome from usuarios u where u.codigo = pc.vended' +
        'or) as nomevendedor,'
      '       pc.usuariologadoalteracao,'
      '       pc.usuarioalteracao,'
      '       pc.datahoraalteracaousuario,'
      '       false as vendedoralterado'
      ''
      'from produtoscontratos pc, produtos p, estoques e'
      
        'where p.codigo = pc.produto and e.filial=pc.filial and e.produto' +
        '=pc.produto and e.produto=p.codigo and'
      '%contrato')
    RequestLive = True
    Left = 40
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'estado'
        ParamType = ptUnknown
      end>
    object qryProdutosContratosproduto: TLargeintField
      FieldName = 'produto'
      Required = True
    end
    object qryProdutosContratosdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 40
    end
    object qryProdutosContratosfilial: TIntegerField
      FieldName = 'filial'
      Required = True
      DisplayFormat = '0'
    end
    object qryProdutosContratosvalorgrade1: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade1'
      Size = 30
    end
    object qryProdutosContratosvalorgrade2: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade2'
      Size = 30
    end
    object qryProdutosContratosquantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
      DisplayFormat = '0'
    end
    object qryProdutosContratosprecovenda: TFloatField
      FieldName = 'precovenda'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryProdutosContratostotal: TFloatField
      FieldName = 'total'
      DisplayFormat = '0.00'
    end
    object qryProdutosContratosaliquotaicms: TFloatField
      FieldName = 'aliquotaicms'
      DisplayFormat = '0.00'
    end
    object qryProdutosContratosaliquotaipi: TFloatField
      FieldName = 'aliquotaipi'
      DisplayFormat = '0.00'
    end
    object qryProdutosContratoslinha: TStringField
      FieldName = 'linha'
      Size = 50
    end
    object qryProdutosContratoscoluna: TStringField
      FieldName = 'coluna'
      Size = 50
    end
    object qryProdutosContratospedido: TFloatField
      FieldName = 'pedido'
      DisplayFormat = '0'
    end
    object qryProdutosContratoscontrato: TStringField
      FieldName = 'contrato'
    end
    object qryProdutosContratosentrega: TStringField
      FieldName = 'entrega'
      Required = True
      Size = 1
    end
    object qryProdutosContratosdias: TIntegerField
      FieldName = 'dias'
      DisplayFormat = '0'
    end
    object qryProdutosContratosemestoque: TFloatField
      FieldName = 'emestoque'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryProdutosContratosreservado: TFloatField
      FieldName = 'reservado'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryProdutosContratosxped: TStringField
      FieldName = 'xped'
      Size = 15
    end
    object qryProdutosContratosvendedor: TIntegerField
      FieldName = 'vendedor'
      DisplayFormat = '0'
    end
    object qryProdutosContratosusuariologadoalteracao: TIntegerField
      FieldName = 'usuariologadoalteracao'
    end
    object qryProdutosContratosusuarioalteracao: TIntegerField
      FieldName = 'usuarioalteracao'
    end
    object qryProdutosContratosdatahoraalteracaousuario: TDateTimeField
      FieldName = 'datahoraalteracaousuario'
    end
    object qryProdutosContratosvendedoralterado: TBooleanField
      FieldName = 'vendedoralterado'
    end
    object qryProdutosContratosnomevendedor: TStringField
      FieldName = 'nomevendedor'
      Size = 50
    end
  end
  object dsrProdutosContratos: TtecDataSource
    DataSet = qryProdutosContratos
    Left = 128
    Top = 256
  end
  object qryProdutosSimilares: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryProdutosSimilaresAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select produtos.*,'
      
        '        (select g.descricao from grades g, caracteristicas c whe' +
        're c.codigo = produtos.caracteristica and g.codigo = c.grade1) a' +
        's linha,'
      
        '        (select g.descricao from grades g, caracteristicas c whe' +
        're c.codigo = produtos.caracteristica and g.codigo = c.grade2) a' +
        's coluna,'
      
        '        (select count(*) from produtos p where p.caracteristica ' +
        'in (select distinct similares.similar'
      
        '                                                                ' +
        '                                    from similares'
      
        '                                                                ' +
        '                                    where similares.caracteristi' +
        'ca = (select p1.caracteristica'
      
        '                                                                ' +
        '                                                                ' +
        '                        from produtos p1'
      
        '                                                                ' +
        '                                                                ' +
        '                        where p1.codigo = produtos.codigo)) or'
      
        '                                                                ' +
        '     (p.caracteristica = produtos.caracteristica and p.codigo <>' +
        ' produtos.codigo)) as similares'
      'from'
      '('
      'select descricao, '
      '          valorgrade1, '
      '          valorgrade2,'
      '          codigo, '
      '          filial,'
      '          caracteristica,'
      '          emestoque,'
      '       reservado,'
      '       unidade,'
      '       brinde,'
      '       case when coalesce(valorproduto,0)=0 then'
      '        (SELECT valor'
      '         FROM colunasprecos'
      
        '         WHERE (colunasprecos.caracteristica = temp.caracteristi' +
        'ca) AND'
      '               (colunasprecos.preco = temp.preco) AND'
      '               (colunasprecos.coluna = temp.preconormal))'
      '       else  coalesce(temp.valorproduto,0)  '
      '       end as valorproduto,'
      '       pedidos_estoquepedido(codigo,filial) as pedido'
      'from'
      ' ('
      ' select p.descricao, '
      '           p.valorgrade1, '
      '           p.valorgrade2,'
      '       p.codigo, p.caracteristica,'
      '       p.preco,'
      '       e.filial,'
      '       e.emestoque,'
      '       e.reservado,'
      '       c.unidade,'
      '       c.brinde,'
      '       f.preconormal,'
      '       case when f.precopromocao is not null then'
      '        (SELECT valor'
      '         FROM colunasprecos'
      
        '         WHERE (colunasprecos.caracteristica = p.caracteristica)' +
        ' AND'
      '               (colunasprecos.preco = p.preco) AND'
      '               (colunasprecos.coluna = f.precopromocao) AND'
      '               (colunasprecos.validade >= now()))'
      '       end as valorproduto'
      'from estoques e, produtos p, caracteristicas c, filiais f'
      'where (e.produto = p.codigo) and  '
      '           (p.caracteristica = c.codigo) and  '
      '           (e.filial = f.codigo) and   '
      '          ((p.inativo is null ) or (p.inativo>current_date)) and'
      
        '          (p.caracteristica in (select distinct similares."simil' +
        'ar"'
      '                                          from similares'
      
        '                                          where similares.caract' +
        'eristica = (Select p1.caracteristica'
      
        '                                                                ' +
        '                              from produtos p1'
      
        '                                                                ' +
        '                              Where p1.codigo =:produto)'
      '                                        union'
      '                                        select p2.caracteristica'
      '                                        from produtos p2'
      
        '                                        where p2.codigo = :produ' +
        'to)   '
      '          ) and  p.codigo <> :produto'
      ''
      '          and (e.filial = :FilialBase)'
      ''
      ''
      ' ) as temp'
      ') as produtos'
      'where (valorproduto > 0)'
      'order by valorproduto')
    RequestLive = False
    Left = 328
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FilialBase'
        ParamType = ptUnknown
      end>
    object qryProdutosSimilaresdescricao: TStringField
      FieldName = 'descricao'
      Size = 40
    end
    object qryProdutosSimilaresvalorgrade1: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade1'
      Size = 30
    end
    object qryProdutosSimilaresvalorgrade2: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade2'
      Size = 30
    end
    object qryProdutosSimilarescodigo: TLargeintField
      FieldName = 'codigo'
    end
    object qryProdutosSimilaresfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryProdutosSimilarescaracteristica: TLargeintField
      FieldName = 'caracteristica'
    end
    object qryProdutosSimilaresemestoque: TFloatField
      FieldName = 'emestoque'
      DisplayFormat = '0'
    end
    object qryProdutosSimilaresreservado: TFloatField
      FieldName = 'reservado'
      DisplayFormat = '0'
    end
    object qryProdutosSimilaresunidade: TStringField
      FieldName = 'unidade'
      Size = 8
    end
    object qryProdutosSimilaresbrinde: TBooleanField
      FieldName = 'brinde'
    end
    object qryProdutosSimilaresvalorproduto: TFloatField
      FieldName = 'valorproduto'
      DisplayFormat = '0.00'
    end
    object qryProdutosSimilareslinha: TStringField
      FieldName = 'linha'
      Size = 50
    end
    object qryProdutosSimilarescoluna: TStringField
      FieldName = 'coluna'
      Size = 50
    end
    object qryProdutosSimilaressimilares: TLargeintField
      FieldName = 'similares'
    end
    object qryProdutosSimilarespedido: TFloatField
      FieldName = 'pedido'
    end
  end
  object dsrProdutosSimilares: TtecDataSource
    DataSet = qryProdutosSimilares
    Left = 416
    Top = 256
  end
  object frpImprimirContratos: TfrReport
    Dataset = fdbImprimirContratos
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnBeforePrint = frpImprimirContratosBeforePrint
    Left = 384
    Top = 336
    ReportForm = {
      190000005464000019FFFF000021005C5C4C5543494F2D313631305C4C65786D
      61726B2058313130302053657269657300FFFFFFFFFF00000000340800009A0B
      0000000000000000000000000000000000000100040000FFFFFFFF0000000000
      00000000000000030400466F726D00FEFFFFFFDC000000780000007C0100002C
      01000004000000FFFFFFFFFF00000000340800009A0B00000000000000000000
      00000000000000000100040000FFFFFFFF000000000000000000000000030400
      466F726D00FEFFFFFFDC000000780000007C0100002C01000004000000FFFFFF
      FFFF00000000340800009A0B0000000000000000000000000000000000000100
      040000FFFFFFFF000000000000000000000000030400466F726D00FEFFFFFFDC
      000000780000007C0100002C01000004000000FFFFFFFFFF0000000034080000
      9A0B0000000000000000000000000000000000000100040000FFFFFFFF000000
      000000000000000000030400466F726D00FEFFFFFFDC000000780000007C0100
      002C010000040000000200EA0100000900666276526F64617065000201000000
      00420100002E0400000E0000003000030001000000000000000000FFFFFF1F00
      000000000000000000000000FFFF000000000002000000010000000000000001
      000000C800000014000000010000000000000200D70200000B00506167654865
      616465723100020100000000300000002E0400004A0000003000020001000000
      000000000000FFFFFF1F0000000000000000000005000500626567696E0D4300
      202069662028636C69656E74653D3029206F722028636C69656E74653D5B7172
      79496D7072696D6972436F6E747261746F732E22636C69656E7465225D292074
      68656E0D1500202020506167696E61203A3D20506167696E612B310D14002020
      656C736520506167696E61203A3D20313B200D0300656E6400FFFF0000000000
      02000000010000000000000001000000C8000000140000000100000000000002
      008503000011004361626563616C686F434F4E545241544F000201000000009F
      0000002E0400000F0000003000100001000000000000000000FFFFFF1F000000
      0034005B64746D436F6E73756C7461436F6E747261746F732E717279496D7072
      696D6972436F6E747261746F732E226E756D65726F225D00000000000000FFFF
      000000000002000000010000000000000001000000C800000014000000010000
      000900436F6E747261746F73000200400400000900436F6E747261746F730002
      0100000000C30000002E040000180000003000050001000000000000000000FF
      FFFF1F000000001400666462496D7072696D6972436F6E747261746F73000000
      0003000500626567696E0D2E002020636C69656E7465203A3D205B717279496D
      7072696D6972436F6E747261746F732E22636C69656E7465225D3B0D0300656E
      64000100000000000002000000010000000000000001000000C8000000140000
      00010000000000000200D9040000100043616265E7616C686F434C49454E5445
      00020100000000880000002E0400000600000032001000010000000000000000
      00FFFFFF1F0000000020005B717279496D7072696D6972436F6E747261746F73
      2E22636C69656E7465225D00000000000000FFFF000000000002000000010000
      000000000001000000C800000014000000010000000900436F6E747261746F73
      000200460500000D00526F64617065436C69656E746500020100000000180100
      002E0400000F0000003000110001000000000000000000FFFFFF1F0000000000
      0000000000000000FFFF000000000002000000010000000000000001000000C8
      00000014000000010000000000000200B40500000E00526F64617065436F6E74
      7261746F00020100000000F30000002E04000006000000300011000100000000
      0000000000FFFFFF1F00000000000000000000000000FFFF0000000000020000
      00010000000000000001000000C8000000140000000100000000000000003E06
      000005004D656D6F380002006E0300005F0000007E0000000D00000043000F00
      F4010000000000000000FFFFFF1F2C020000000000010008005155495441C7C3
      4F00000000FFFF0000000000020000000100000000090068656C766574696361
      0007000000000000000000020000000100020000000000FFFFFF000000000200
      0000000000000000C906000005004D656D6F36000200C20200005F000000AC00
      00000D00000043000F00F4010000000000000000FFFFFF1F2C02000000000001
      000900505245535441C7C34F00000000FFFF0000000000020000000100000000
      090068656C76657469636100070000000000000000000A000000010002000000
      0000FFFFFF0000000002000000000000000100B830000009006670764C6F676F
      5F500002001E00000033000000730000002700000005000000F4010000000000
      000000FFFFFF1F2C020000000000000000000000FFFF00000000000200000001
      000000000100B8300000424D96290000000000003604000028000000B8000000
      34000000010008000000000060250000120B0000120B00000001000000010000
      00000000E6E3AF00AA9F0000A2960000ABAAA90034373B0085878A00BFB73A00
      66666600D7D38300FBFAF200181B2100D5CF7B00B6AD1A00DBD78F00EFEFEF00
      52545800DEDA97001F222800DEDEDE00CBC45A00B8B8BA00E6E6E6000C0B0A00
      99999900D8D9DB00D6D6D60044474A0076787B00EDEBC700ADA4000003070D00
      F5F3DF00CCCCCC00CCCC6600AEA4070012151A00C5BE4A005D606300B0B1B300
      B8B02600A0A2A3001B1E23002B2E3300F9F8ED0001050A004C4F530086877600
      3B3E4200CDC77C00FFFFFF0092929100C1C2C200090D1200E3DEA5005A5A5900
      1615140010131900CCCC6600B3A905006E707300F1EFD500C8C25300C1BA4000
      E9E7BD002221210029292900F1F0E9005B5D6300BDB53100F7F7F700A7A8AA00
      E1DEA3008A898800D3CE7400403F3E00B2A80B00F5F3D800B7AE210061605F00
      4A4C50001D1C1C009F9FA200FDFDF700080809003A3A3A008C8C8B0010101000
      C9C357004F4F4E0026252400AFB0B2003F424600292B3000EBE8BF0047464500
      BDBDBD00070A10007F8183006B6D7000A2A1A000E5E1AD007473730000020700
      C6BE4F00B2B1B100A59B0000DCDDE6007C7D8000F5F4DF00393B40005A5A5200
      08101900424241004A4A49005F5E5D0024272B00C7C26C00A5A5A500ADADAD00
      D7D1810066666600CCC56300E7E4B50084848400525A5A00B9B22500BDB54200
      F0EECF00DFDB9B00D1CC7200DED99900807F7F00BCB32A0090909200B5B5B500
      333333008F919300F7F6E600B1A80F00474545001A19180052525100C5C5C500
      B4AA1200B0A71000D6DEDE0021211900EDEAC60029292100B5BDBD00EFEFF700
      E6DEDE00948C8C00BDB5B500A5ADA500524A4A00C4BC4300C5BDBD007B7B7B00
      999999002E2D2C0074767900F7F7D600423A3A00DCD89300DEDBAF0010100800
      87898B0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      3232323232323232323232323232323232323232323232323232323232323232
      32323232323232323232323232323232323232323232323232323232329F5F59
      1084163232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      323232323232323232323232323232323232323232189F060655713232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      323232323232323232323232323232323232323232320F04331A323232605218
      520F323232217618331332326921323216040F3232321647335B463232321647
      163232320F7733040F323232323221040473570F323234343232321647181852
      770F32323232323232605218640F32467719324676133246771A32323232320F
      5218181876163232465B1A32328F331818186032323232466933213232328F52
      1818163232872132325B1A323215213232321964181852153232131818181804
      0F3232323232323232323232323259545A773246375788555F1332329F57554B
      A18F320F383C323287008F32326038418851A113323260003432321A5A51885A
      41213232324F578871428D16323271553232195A414B4B5A0013323232323246
      59578855721632135456321600643216547C3232323232195F55715557550F32
      16579F323256887171A1541832323208545A1832320857885571213246510832
      32176632465A3732328757A14B4B5741323234554B4B55173732323232323232
      323232323216387C323232040021323232323221008632323232320F419F3232
      15178F32464255463216518E323234548F32325F5A0F32465588533269000432
      3204541632325972323233000F32328F0013323232323252001A323232323216
      3833320F0076320F385632323232323232323232040021320F517C3232323232
      3232558C3232465A63323232600087323232323246A1663232519F3246880832
      328E5A3232327C413232323232323249540F3232323232323232323232168D33
      3232329F57333356330F3233000F32323232320F419F323215578F3213007732
      32329F8D0F3234548F32461756323232521713329F3832323264171632325972
      32326000A2760466541332323232323C57183356180F32168D33320F6776320F
      3856323232323232216373735A3816320F417C3232463373738E003C32320F42
      9F323232565449333333163246A1663232519F32468808323249678647475942
      323232150873738DA1463232323232323232323232168D863232329F00597271
      8E133252000F32323232320F419F323260178F321300043232321C8D0F323454
      8F32465749323232181719324957463232641716323259723232321855555542
      57133232323232660059728C8E1632168D18320F6776320F3856323232323216
      51417308636032320F417C32328600590808060F323246421C32323256005F72
      8C721A3246A16632325184323288083232469F8855558DA132322154884F0866
      213232323232323232323232320F513332323215006032323232321A67183232
      3232320F418432323367133246884B323216515F323234548F32328E5A0F3246
      55A146323400473232765416323259723232323232323229001632323232325B
      008F3232323232168D18320F6704321A545232323232328F0060323232323232
      0F417C323210A13232323232323246429F323232210047323232323246A16632
      325184320F381C32323232323232084232327600163232323232323232323232
      323232328F7257888E1532326654718E4F16323249544B375921320F41414F72
      004F3232328F3842378D411A323234548F3232195151375A3834323232080071
      7388541632328C4B3232138E37378E175932323232323232635471104F163216
      57424F8E0055378D411332323232320F8851373759664632163884323277675F
      37375915321A8E57A18E76323249175510371A32464251733700427342172132
      32605937375F006232321351A1373759493232323232323232323232199F5759
      492132323221187C860F3232321A52497C193246045649336046323232321652
      84760F32323234548F3232320F4784521632323232328F184956644632328F34
      3232167C4949565B46323232323232323221187C330F32467656494918865664
      16323232323232320F2949497C52533246871A323232218649497C2132167C8D
      7149343232321A18495616323277864949183356181A323232217C4949336032
      323232161849497C773232323232323232323232320F57333232323232323232
      3232323232323232323232323232323232323232323232323232323232323400
      3432323232323232323232323232323232323232323204043232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232463334323232323232323232323232411C32323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      32323232323232323232323232164B6432323232323232323232323232323232
      3232323232323232323232323232323232323232323221A12132323232323232
      32323232323232323232323232324F4F32323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      0F88863232323232323232323232467256323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232320F46323232323232323232323232323232323232323232323232
      3232323232323232323232323232320F53323232323232323232323232323232
      32323232323243A67B7B7B7B7B7B7B0A32323232323232323232323232323232
      323232323232323232323232323232323232323232323232320F463232323232
      323232323232320F463232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232324D3B
      6A0202020202023D323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      323232323232323232323232323232323232323232323D8B021E1E1E1E1E1E3D
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      323232323232323232323232323232323213476C083710101010260F32323232
      3232323232195B0663087D10101010101010101B153232323232323232323219
      27066608441B56323232323232323D8B021E1E1E1E1E1E3D3232323232323282
      3F9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D68147A787B2032323232323232
      3232323232323232323D814A142558820E800A32323232323232323232323232
      4A1414141414146532323232323232323232323232531D114A22141414141481
      323232323232320FA22A613535353535351F2A163232323232323227100B6135
      353535353535353535353500183232323232323232181B246135353535004432
      3232323232323D8B021E1E1E1E1E1E3D32323232323232456A02020202020202
      0202020202020202020202020202020223825332323232323232323232320A0E
      071E0202020202020202854A8A32323232323232323232530D6A020202020382
      3232323232323232323232328145020202020202020202583232323232320F1B
      2D240B0B0B0B0B0B0B245D16323232323216263961240B0B0B0B0B0B0B0B0B0B
      0B0B0B615232323232323213506161240B0B0B0B0B1F08323232323232323D8B
      021E1E1E1E1E1E3D3232323232323207021E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
      1E1E1E1E1E1E1E1E1E6A5832323232323232323232482802021E1E1E1E1E1E1E
      1E1E02029078533232323232323232537E021E1E1E1E020C3232323232323232
      3232328202021E1E1E1E1E1E1E1E1E7A3232323232323C2D0B0B0B0B0B0B0B0B
      0B245D16323232321A881F240B0B0B0B0B0B0B0B0B0B0B0B0B0B0B6152323232
      32321A2B610B0B0B0B0B0B0B0B1F08323232323232323D8B021E1E1E1E1E1E3D
      3232323232323207021E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
      1E1E6A78323232323232320A7A02021E1E1E1E1E1E1E1E1E1E1E1E1E1E6A3F20
      32323232323232537E021E1E1E1E020C3232323232323232323283021E1E1E1E
      1E1E1E1E1E1E1E7A3232323232132A390B0B0B0B0B0B3961612D0B1632323213
      88610B0B0B0B0B0B24243561616161616161610018323232320F05610B0B0B0B
      0B0B0B2424004432323232323232201E6A02020202026A8A3232323232323245
      036A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A1E1E1E1E1E1E4C20323232
      32320A076A1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E020D3D32323232323253
      7E021E1E1E1E020C3232323232323232320A4E021E1E1E1E1E1E1E1E02020214
      3232323232291F0B0B0B0B0B0B3505372626630F323232441F0B0B0B0B0B3961
      125C2E4426262626262626106032323232631F0B0B0B0B0B0B3535745C5C2F65
      65656565656548583E3E3E3E3E3E250983A5A5A5A5A5A5227A7A7A7A7A7A7A7A
      7A7A7A7A7A7A7A7A7A7A8282071E1E1E1E1E1E0209323232325368021E1E1E1E
      1E02020202231E0202021E1E1E1E1E02288A3232323232537E021E1E1E1E020C
      32323232323232323240021E1E1E1E1E1E1E024C0D0D0D82323232323266350B
      0B0B0B0B0B330F3232323232323227350B0B0B0B0B395D291346323232323232
      32323232323232328F39390B0B0B0B0B616E04164632366A0202020202024E32
      323232323232534C036A6A6A6A6A6A5E32323232323232323232323232323232
      32323232327A021E1E1E1E023F323232324A6A1E1E1E1E1E020D22013D3D3D40
      0C8502021E1E1E1E6A9D3232323232537E021E1E1E1E020C3232323232323232
      3209021E1E1E1E1E1E4E36208A8A8A0A32323232322E350B0B0B0B3508323232
      32323232323250350B0B0B0B24121A3232323232323232323232323232323232
      26610B0B0B0B0B35260F32323232366A1E1E1E1E1E02850A3232323232322C0D
      021E1E1E1E1E1E7B32323232323232323232323232323232323232323294021E
      1E1E1E1E0D2C32323D23021E1E1E1E1E4A2C3232323232323253A58B021E1E1E
      1E023632323232537E021E1E1E1E020C3232323232323232323E021E1E1E1E1E
      238032323232323232323232325C390B0B0B0B2D1832323232323232321A2A39
      0B0B0B0B616C3232323232323232323232323232323232162A240B0B0B0B355C
      463232323232366A1E1E1E1E1E1E850A3232323232322C0D021E1E1E1E1E1E7B
      3232323232323232323232323232323232323232327B021E1E1E1E1E1E8A3232
      3E021E1E1E1E1E4832323232323232323232321D90021E1E1E1E7E5332323253
      7E021E1E1E1E020C3232323232323232323F021E1E1E1E1E0732323232323232
      323232323205390B0B0B0B1F293232323232323232291F0B0B0B0B0B0B603232
      32323232323232323232323232323227390B0B0B0B0B3515323232323232366A
      1E1E1E1E1E1E850A3232323232322C0D021E1E1E1E1E1E7B3232323232323232
      323232323232323232323232327A021E1E1E1E1E4C8A328A8B021E1E1E027832
      323232323232323232323232011E1E1E1E1E1E7B323232537E021E1E1E1E020C
      32323232323232323245021E1E1E1E023E32323232323232323232323288390B
      0B0B0B357732323232323232321C610B0B0B0B0B0B2E26444444444444444444
      4444441060323284350B0B0B0B39050F323232323232366A1E1E1E1E1E1E850A
      3232323232322C0D021E1E1E1E1E1E7B32323232323232323232530A0A0A0A0A
      0A2C8A8078231E1E1E1E1E1E7E0A3281021E1E1E1E4E53323232323232323232
      323232323268021E1E1E027A323232537E021E1E1E1E020C3232323232323232
      3285021E1E1E1E027A32323232323232323232323205390B0B0B0B3527323232
      323232323244350B0B0B0B0B0B35616161616161616161616161610018323263
      610B0B0B0B611032323232323232366A1E1E1E1E1E1E850A3232323232322C0D
      021E1E1E1E1E1E7B323232323232534814450D904C4C4C4C4C4C4C23021E1E1E
      1E1E1E6A7A323222021E1E1E028232323232323232323232323232323236021E
      1E1E0245323232537E021E1E1E1E020C32323232323232323285021E1E1E1E02
      2232323232323232323232323205390B0B0B0B352732323232323232322E350B
      0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B61523232441F0B0B0B0B1F2632
      32323232323248030202020202024E32323232323232324C6A02020202020201
      32323232325E850202021E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1D32323E
      021E1E1E1E8132323232323232323232323232323280231E1E1E1E7E0A323253
      7E021E1E1E1E020C32323232323232323285021E1E1E1E028232323232323232
      323232323205390B0B0B0B352732323232323232322E390B0B0B0B0B0B0B0B0B
      0B0B0B0B0B0B0B0B0B0B0B61523232371F0B0B0B0B1F0832323232323232943E
      141414141414757777777777777776310C0C0C0C0C0C0C4D323232324023021E
      1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E020932323207021E1E1E1E7B3232
      323232323232323232323232322090021E1E1E0D6D3232537E021E1E1E1E020C
      32323232323232323285021E1E1E1E028232323232323232323232323205390B
      0B0B0B3527323232323232323237350B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B
      0B0B0B6152323263610B0B0B0B61443232323232323232323232323232321912
      353939393939356B32323232323232323232328A0D021E1E1E1E1E1E1E1E1E1E
      1E1E1E1E1E1E020202910E3232323225021E1E1E1E3632323232323232323232
      32323232323D8B021E1E1E4E8A3232537E021E1E1E1E020C3232323232323232
      3285021E1E1E1E028232323232323232323232323205390B0B0B0B3527323232
      323232323208350B0B0B0B0B0B24242424242424242424242424241F5232321C
      350B0B0B0B355032323232323232323232323232323219743924242424242419
      3232323232323232323232826A1E1E1E1E1E1E1E020202020202020202028B85
      4A2032323232327A021E1E1E02783232323232323232323232323232327B1E1E
      1E1E0245323232537E021E1E1E1E020C32323232323232323285021E1E1E1E02
      8232323232323232323232323205390B0B0B0B35273232323232323232A81F0B
      0B0B0B0B0B2A2A2A2A2A2A2A2A2A2A2A2A2A2A3529323286350B0B0B0B392B16
      32323232323232323232323232321974390B0B0B0B0B39193232323232323232
      32320A4E021E1E1E1E1E1E850C1111363636363665403D323232323232323209
      021E1E1E020732323232323232323232323232323282021E1E1E022532323253
      7E021E1E1E1E020C32323232323232323285021E1E1E1E028232323232323232
      323232323205390B0B0B0B35273232323232323232771F0B0B0B0B0B0B761319
      19191919191919191919191A0F323234390B0B0B0B0B35213232323232323232
      3232323232321974390B0B0B0B0B3919323232323232323232321D021E1E1E1E
      1E1E072C323232323232323232323232323232323232321D1E1E1E1E1E1E7B32
      3232323232323232323232326D901E1E1E1E0211323232537E021E1E1E1E020C
      32323232323232323285021E1E1E1E028232323232323232323232323205390B
      0B0B0B352732323232323232321A12390B0B0B0B352932323232323232323232
      323232323232320F74240B0B0B0B616232323232323232323232323232321974
      390B0B0B0B0B39193232323232323232323201021E1E1E1E1E1E113232323232
      3232323232323232323232323232323245021E1E1E1E4E6D3232323232323232
      323232329D021E1E1E1E4C8A323232537E021E1E1E1E020C3232323232323232
      3285021E1E1E1E028232323232323232323232323205390B0B0B0B3527323232
      3232323232321B350B0B0B0B3510323232323232323232323232323232323232
      7D350B0B0B0B24121A323232323232323232323232321974390B0B0B0B0B3919
      3232323232323232323236021E1E1E1E1E1E1132323232323232323232323232
      323232323232323236021E1E1E1E02285E3232323232323232324D9D021E1E1E
      1E024A32323232537E021E1E1E1E020C32323232323232323285021E1E1E1E02
      8232323232323232323232323205390B0B0B0B3515323232323232323232861F
      0B0B0B0B0B3989323232323232323232323232323232323252610B0B0B0B0B39
      2B5B323232323232323232323232130B2D35353535352D163232323232323232
      323240021E1E1E1E1E0225323232323232323232323232323232323232323232
      323F6A1E1E1E1E021E7A400A323232321D0C90021E1E1E1E020D533232323232
      85021E1E1E1E027832323232323232323285021E1E1E1E028232323232323232
      21878787875D240B0B0B0B3962608787878715463232165D390B0B0B0B0B391B
      6C185B87878787878787875B133232320F88350B0B0B0B0B3939306389524747
      474747474747293C08636363636308765B5B5B5B5B5B04133232204C1E1E1E1E
      1E1E1E580C0C0C0C0C0C0C4A4A4A4A4A4A4A4AA532323232323D90021E1E1E1E
      1E02024E079D078523021E1E1E1E1E1E1E01368282828282901E1E1E1E1E1E45
      4A828282828201323285021E1E1E1E1E454A82828282823608353535350B0B0B
      0B0B0B0B39353535351F0B16323232181F240B0B0B0B0B353535353535353535
      353535001832323232521F0B0B0B0B0B0B0B3535353535353535353535670532
      323232323232320567353535353567183232329D021E1E1E1E1E1E0202020202
      020202020202020202026A7E323232323232948B021E1E1E1E1E1E0202020202
      1E1E1E1E1E1E1E028132076A020202021E1E1E1E1E1E1E1E02020202026A8232
      3285021E1E1E1E1E1E020202020202583C0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B
      0B245D1632323232632D240B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B6152323232
      3232262D240B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B39300F3232323232323230
      350B0B0B0B0B35523232327B021E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
      1E1E1E4532323232323232400D021E1E1E1E1E1E1E1E1E1E1E1E1E1E1E022381
      32329D021E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E024A323285021E1E1E1E1E
      1E1E1E1E1E1E1E7A3C0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B245D1632323232
      326361390B0B0B0B0B0B0B0B0B0B0B0B0B0B0B6152323232323246086139390B
      0B0B0B0B0B0B0B0B0B0B0B0B0B39300F3232323232323230350B0B0B0B0B3552
      32323232826A1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E4532323232
      323232328A6802021E1E1E1E1E1E1E1E1E1E1E1E0245943232329D021E1E1E1E
      1E1E1E1E1E1E1E1E1E1E1E1E1E024A323285021E1E1E1E1E1E1E1E1E1E1E1E7A
      3C242424240B0B0B0B0B0B0B24242424242474163232323232324705351F3535
      39242424242424242424241F52323232323232324705391F6139392424242424
      2424242424356E0F3232323232323230350B0B0B0B0B35523232323232220202
      02021E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E0245323232323232323232327B3F
      1E02020202020202020202858153323232323F021E1E1E1E1E1E1E1E1E1E1E1E
      1E1E1E1E1E6A82323285021E1E1E1E1E1E1E1E1E1E1E1E143C0B0B0B0B0B0B0B
      0B0B0B0B0B2A0B0B0B0B5D163232323232323246473C506E2B120B0B0B0B0B0B
      0B0B0B352932323232323232323215A27D302B74120B0B0B0B0B0B0B0B395C0F
      3232323232323230350B0B0B0B0B35523232323232324022070D8B2323232323
      2323232323232323232302453232323232323232323232321D7825850D4C907E
      3F4A405332323232323225234C4C4C4C1E1E1E1E1E1E1E1E4C4C4C4C4C230C32
      3285021E1E1E1E1E1E4C4C4C4C4C4C2216131313132B390B0B0B0B3918131313
      1313135332323232323232323232320F0F13131313131313131313190F323232
      3232323232323232320F16161313131313131313131913323232323232323230
      350B0B0B0B0B35523232323232323232328A6D4D4D4D4D4D4D4D4D4D4D4D4D4D
      4D4D4D6D3232323232323232323232323232320A8A20202C3232323232323232
      32328A4D2020203D4E021E1E1E1E02222020202020202C323285021E1E1E1E02
      142020202020202C323232323205390B0B0B0B35153232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      32323232323232323232323232323232323232323232322B001F1F1F1F1F0018
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      85021E1E1E1E028232323232323232323285021E1E1E1E028232323232323232
      323232323205390B0B0B0B352732323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      32323232323232323232323232323206083C3C3C3C3C63343232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      32323232323232323232323232323232323232323232323245021E1E1E1E1E85
      53323232323232323285021E1E1E1E028232323232323232323232323205390B
      0B0B0B3527323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323225021E1E1E1E1E1E9D403D3D3D3D2C32
      3285021E1E1E1E028232323232323232323232323205390B0B0B0B3527323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      32323232323232324A6A1E1E1E1E1E1E1E021E1E1E020C323285021E1E1E1E02
      8232323232323232323232323205390B0B0B0B35273232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      40021E1E1E1E1E1E1E1E1E1E1E024A323285021E1E1E1E028232323232323232
      323232323205390B0B0B0B352732323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      323232323232323232323232323232323232323232323232323F6A1E1E1E1E1E
      1E1E1E1E1E020C323285021E1E1E1E028232323232323232323232323205390B
      0B0B0B3527323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      323232323232323232323232323232323220286A021E1E1E1E1E1E1E1E020C32
      3285021E1E1E1E028232323232323232323232323205390B0B0B0B3527323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      323232323232323232328A824E1E1E1E1E1E1E1E1E020C323285021E1E1E1E02
      8232323232323232323232323262633C3C3C3C63213232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      32323232206509827A222222227A653232787A222222227A3632323232323232
      0000473100000900666D76546974756C6F0002006D0100003300000020020000
      1200000043000000F4010000000000000000FFFFFF1F2C020000000000010009
      005B546974756C6F5D2000000000FFFF00000000000200000001000000000900
      68656C7665746963610009000000020000000000020000000000020000000000
      FFFFFF0000000002000000000000000000DA3100000F006D6D6F524F54554C4F
      444154415F50000200A2030000330000001A0000000D00000041000000F40100
      00000000000000FFFFFF1F2C0200000000000100070044617461203A20000000
      00FFFF0000000000020000000100000000090068656C76657469636100070000
      00000000000000000000000100020000000000FFFFFF00000000020000000000
      000000006F32000011006D6D6F524F54554C4F504147494E415F50000200A203
      000042000000220000000D00000043000000F4010000000000000000FFFFFF1F
      2C0200000000000100070050E167696E613A00000000FFFF0000000000020000
      000100000000090068656C766574696361000700000000000000000008000000
      0100020000000000FFFFFF00000000020000000000000000000C3300000F006D
      6D6F524F44415045484F52415F500002001C00000042010000580000000A0000
      0043000000F4010000000000000000FFFFFF1F2C020000000000010011005B54
      494D4520235468683A6D6D3A73735D00000000FFFF0000000000020000000100
      000000090068656C766574696361000700000000000000000010000000010002
      0000000000FFFFFF0000000002000000000000000000BB33000012006D6D6F52
      4F44415045544543534F46545F500002000003000043010000EC0000000A0000
      0043000000F4010000000000000000FFFFFF1F2C020000000000010020007465
      63534F4654202D205465636E6F6C6F67696120656D2053697374656D61730000
      0000FFFF0000000000020000000100000000090068656C766574696361000700
      0000000000000000110000000100020000000000FFFFFF000000000200000000
      00000000004434000005004D656D6F310002006D0000006C000000C70000000E
      00000043000F00F4010000000000000000FFFFFF1F2C02000000000001000700
      50524F4455544F00000000FFFF0000000000020000000100000000090068656C
      76657469636100070000000000000000000A0000000100020000000000FFFFFF
      0000000002000000000000000000CC34000005004D656D6F320002001D000000
      6C000000500000000E00000043000F00F4010000000000000000FFFFFF1F2C02
      00000000000100060043D34449474F00000000FFFF0000000000020000000100
      000000090068656C76657469636100070000000000000000000A000000010002
      0000000000FFFFFF00000000020000000000000000005035000005004D656D6F
      37000200C20200006C000000130000000E00000043000F00F401000000000000
      0000FFFFFF1F2C020000000000010002004E5000000000FFFF00000000000200
      00000100000000090068656C76657469636100070000000000000000000A0000
      000100020000000000FFFFFF0000000002000000000000000000D73500000500
      4D656D6F33000200240300006C0000004A0000000E00000043000F00F4010000
      000000000000FFFFFF1F2C0200000000000100050056414C4F5200000000FFFF
      0000000000020000000100000000090068656C76657469636100070000000000
      000000000A0000000100020000000000FFFFFF00000000020000000000000000
      005F36000005004D656D6F34000200F00200006C000000340000000E00000043
      000F00F4010000000000000000FFFFFF1F2C0200000000000100060056454E43
      544F00000000FFFF0000000000020000000100000000090068656C7665746963
      6100070000000000000000000A0000000100020000000000FFFFFF0000000002
      000000000000000000E736000006004D656D6F3132000200A20300006C000000
      4A0000000E00000043000F00F4010000000000000000FFFFFF1F2C0200000000
      000100050056414C4F5200000000FFFF00000000000200000001000000000900
      68656C7665746963610007000000000000000000120000000100020000000000
      FFFFFF0000000002000000000000000000A937000006004D656D6F3138000200
      1E0000009F0000008E0000000F00000041000000F4010000000000000000FFFF
      FF1F2C02000000000001003F00434F4E545241544F3A20205B64746D436F6E73
      756C7461436F6E747261746F732E717279496D7072696D6972436F6E74726174
      6F732E226E756D65726F225D00000000FFFF0000000000020000000100000000
      090068656C766574696361000700000006000000000008000000010002000000
      0000FFFFFF00000000020000000000000000003038000006004D656D6F343600
      02008F0100006C000000200000000E00000043000F00F4010000000000000000
      FFFFFF1F2C0200000000000100040043D3442E00000000FFFF00000000000200
      00000100000000090068656C76657469636100070000000000000000000A0000
      000100020000000000FFFFFF0000000002000000000000000000B63800000500
      4D656D6F39000200340100006C000000270000000E00000043000F00F4010000
      000000000000FFFFFF1F2C020000000000010004005154444500000000FFFF00
      00000000020000000100000000090068656C7665746963610007000000000000
      0000000A0000000100020000000000FFFFFF0000000002000000000000000000
      4039000006004D656D6F3130000200AF0100006C000000C40000000E00000043
      000F00F4010000000000000000FFFFFF1F2C0200000000000100070053455256
      49C74F00000000FFFF0000000000020000000100000000090068656C76657469
      636100070000000000000000000A0000000100020000000000FFFFFF00000000
      02000000000000000000C739000006004D656D6F33300002006E0300006C0000
      00340000000E00000043000F00F4010000000000000000FFFFFF1F2C02000000
      0000010004004441544100000000FFFF00000000000200000001000000000900
      68656C76657469636100070000000000000000000A0000000100020000000000
      FFFFFF0000000002000000000000000000963A000006004D656D6F3237000200
      AE0000009F0000006E0000000F00000041000000F4010000000000000000FFFF
      FF1F2C02000000000001004C0056414C4F523A20205B466F726D6174466C6F61
      7428272323232C2323232C2323302E3030272C205B717279496D7072696D6972
      436F6E747261746F732E2276616C6F727072617A6F225D295D00000000FFFF00
      00000000020000000100000000090068656C7665746963610007000000060000
      000000090000000100020000000000FFFFFF0000000002000000000000000000
      423B00000900666D7642616972726F000200940000003E000000D70000000A00
      000043000000F4010000000000000000FFFFFF1F2C020000000000010026005B
      52554146494C49414C424153455D20202D20205B42414952524F46494C49414C
      424153455D00000000FFFF0000000000020000000100000000090068656C7665
      746963610007000000000000000000100000000100020000000000FFFFFF0000
      000002000000000000000000053C00000900666D764369646164650002009400
      000049000000D70000000A00000043000000F4010000000000000000FFFFFF1F
      2C02000000000001003D005B43455046494C49414C424153455D20202D20205B
      43494441444546494C49414C424153455D20202D20205B45535441444F46494C
      49414C424153455D00000000FFFF000000000002000000010000000009006865
      6C7665746963610007000000000000000000100000000100020000000000FFFF
      FF0000000002000000000000000000993C00000600666D765275610002009400
      000033000000D70000000A00000043000000F4010000000000000000FFFFFF1F
      2C020000000000010011005B52415A414F46494C49414C424153455D00000000
      FFFF0000000000020000000100000000090068656C7665746963610007000000
      000000000000100000000100020000000000FFFFFF0000000002000000000000
      000000203D000006004D656D6F3231000200730200006C0000001B0000000E00
      000043000F00F4010000000000000000FFFFFF1F2C0200000000000100040051
      54444500000000FFFF0000000000020000000100000000090068656C76657469
      636100070000000000000000000A0000000100020000000000FFFFFF00000000
      02000000000000000000A83D000006004D656D6F34330002008E0200006C0000
      00340000000E00000043000F00F4010000000000000000FFFFFF1F2C02000000
      000001000500544F54414C00000000FFFF000000000002000000010000000009
      0068656C76657469636100070000000000000000000A00000001000200000000
      00FFFFFF0000000002000000000000000300003E00000A005375625265706F72
      74310002001D000000C40000006C010000140000000100000001000000000000
      000000FFFFFF1F2C020000000000000000000000FFFF00000000000200000001
      00000000010000000300583E00000A005375625265706F727432000200900100
      00C400000014010000140000000100000001000000000000000000FFFFFF1F2C
      020000000000000000000000FFFF000000000002000000010000000002000000
      0300B03E00000A005375625265706F727433000200A7020000C40000002A0100
      00140000000100000001000000000000000000FFFFFF1F2C0200000000000000
      00000000FFFF0000000000020000000100000000030000000000383F00000600
      4D656D6F31310002005B0100006C000000340000000E00000043000F00F40100
      00000000000000FFFFFF1F2C02000000000001000500544F54414C00000000FF
      FF0000000000020000000100000000090068656C766574696361000700000000
      00000000000A0000000100020000000000FFFFFF000000000200000000000000
      00008D40000006004D656D6F33350002006D0100004800000020020000100000
      0043000000F4010000000000000000FFFFFF1F2C0200000000000100D2005B64
      746D436F6E73756C7461436F6E747261746F732E717279496D7072696D697243
      6F6E747261746F732E22636C69656E7465225D202D205B64746D436F6E73756C
      7461436F6E747261746F732E717279496D7072696D6972436F6E747261746F73
      2E226E6F6D65225D202D205B4946285B717279496D7072696D6972436F6E7472
      61746F732E22706573736F617469706F225D203D202746272C2027435046272C
      2027434E504A27295D3A205B717279496D7072696D6972436F6E747261746F73
      2E22706573736F616E756D65726F225D00000000FFFF00000000000200000001
      00000000090068656C76657469636100090000000200000000000A0000000100
      020000000000FFFFFF00000000020000000000000000008541000006004D656D
      6F343400020045020000A0000000580000000F00000043000000F40100000000
      00000000FFFFFF1F2C02000000000000000005000500626567696E0D32002069
      66205B717279496D7072696D6972436F6E747261746F732E226372656469746F
      74726F6361225D203E2030207468656E0D1E002020206D656D6F203A3D202743
      52454449544F2044452054524F43413A270D110020656C7365206D656D6F203A
      3D2027273B0D0300656E6400FFFF000000000002000000010000000009006865
      6C7665746963610007000000060000000000080000000100020000000000FFFF
      FF0000000002000000000000000000B842000006004D656D6F34380002009D02
      0000A0000000540000000F00000043000000F4010000000000000000FFFFFF1F
      2C020000000000010000000006000500626567696E0D330020206966205B7172
      79496D7072696D6972436F6E747261746F732E226372656469746F74726F6361
      225D203E2030207468656E0D4F00202020204D656D6F203A3D20466F726D6174
      466C6F617428272323232C2323232C2323302E3030272C5B717279496D707269
      6D6972436F6E747261746F732E226372656469746F74726F6361225D290D0600
      2020656C73650D0F00202020204D656D6F203A3D2027273B0D0300656E6400FF
      FF0000000000020000000100000000090068656C766574696361000700000006
      0000000000090000000100020000000000FFFFFF000000000200000000000000
      0000AD43000006004D656D6F3238000200A80100009F000000540000000F0000
      0041000000F4010000000000000000FFFFFF1F2C020000000000000000050005
      00626567696E0D320020204946205B717279496D7072696D6972436F6E747261
      746F732E226661747572616D656E746F225D203E2030205448454E0D1A002020
      20204D656D6F203A3D20274641545552414D454E544F3A270D12002020454C53
      45204D656D6F203A3D2027273B0D0300656E6400FFFF00000000000200000001
      00000000090068656C76657469636100070000000600000000000A0000000100
      020000000000FFFFFF00000000020000000000000000002E44000006004D656D
      6F35340002001D00000018010000D00300000F00000043000F00F40100000000
      00000000FFFFFF1F2C020000000000000000000000FFFF000000000002000000
      0100000000090068656C76657469636100080000000200000000000A00000001
      00020000000000FFFFFF0000000002000000000000000000F244000006004D65
      6D6F353500020035030000180100003C0000000F00000043000000F401000000
      0000000000FFFFFF1F2C020000000000010041005B464F524D4154464C4F4154
      28272323232C2323232C2323302E3030272C205B53554D285B717279546F7461
      69732E22746F74616C61626572746F225D295D295D00000000FFFF0000000000
      020000000100000000090068656C766574696361000800000002000000000009
      0000000100020000000000FFFFFF0000000002000000000000000000B4450000
      06004D656D6F3536000200AE030000180100003E0000000F00000043000000F4
      010000000000000000FFFFFF1F2C02000000000001003F005B464F524D415446
      4C4F415428272323232C2323232C2323302E3030272C205B53554D285B717279
      546F746169732E22746F74616C7061676F225D295D295D00000000FFFF000000
      0000020000000100000000090068656C76657469636100080000000200000000
      00090000000100020000000000FFFFFF00000000020000000000000000008246
      000006004D656D6F3537000200D3000000180100004A0000000F000000430000
      00F4010000000000000000FFFFFF1F2C02000000000001004B005B464F524D41
      54464C4F415428272323232C2323232C2323302E3030272C205B53554D285B71
      7279496D7072696D6972436F6E747261746F732E2276616C6F727072617A6F22
      5D295D295D00000000FFFF0000000000020000000100000000090068656C7665
      746963610008000000020000000000090000000100020000000000FFFFFF0000
      0000020000000000000000000B47000006004D656D6F35380002001D00000018
      010000380000000F00000041000000F4010000000000000000FFFFFF1F2C0200
      0000000001000600544F5441495300000000FFFF000000000002000000010000
      0000090068656C76657469636100080000000200000000000800000001000200
      00000000FFFFFF00000000020000000000000000009847000006004D656D6F35
      39000200CA02000018010000680000000F00000041000000F401000000000000
      0000FFFFFF1F2C02000000000001000A00454D2041424552544F3A00000000FF
      FF0000000000020000000100000000090068656C766574696361000800000002
      0000000000090000000100020000000000FFFFFF000000000200000000000000
      00002348000006004D656D6F363000020074030000180100003C0000000F0000
      0041000000F4010000000000000000FFFFFF1F2C020000000000010008005155
      495441444F3A00000000FFFF0000000000020000000100000000090068656C76
      65746963610008000000020000000000090000000100020000000000FFFFFF00
      00000002000000000000000000A948000006004D656D6F3336000200D5020000
      6C0000001B0000000E00000043000F00F4010000000000000000FFFFFF1F2C02
      00000000000100030042434F00000000FFFF0000000000020000000100000000
      090068656C76657469636100070000000000000000000A000000010002000000
      0000FFFFFF0000000002000000000000000000B449000006004D656D6F333700
      0200230100009F0000007D0000000F00000041000000F4010000000000000000
      FFFFFF1F2C020000000000010000000005000500626567696E0D2E0020204946
      205B717279496D7072696D6972436F6E747261746F732E226E6F746173225D20
      3C3E202727205448454E0D3300202020204D656D6F203A3D20274E2E462E3A20
      205B717279496D7072696D6972436F6E747261746F732E226E6F746173225D27
      0D11002020454C5345204D656D6F203A3D2027270D0300656E6400FFFF000000
      0000020000000100000000090068656C76657469636100070000000600000000
      00080000000100020000000000FFFFFF0000000002000000000000000000DF4A
      000006004D656D6F3338000200FC0100009F000000380000000F000000410000
      00F4010000000000000000FFFFFF1F2C02000000000000000005000500626567
      696E0D320020204946205B717279496D7072696D6972436F6E747261746F732E
      226661747572616D656E746F225D203E2030205448454E0D5000202020204D65
      6D6F203A3D205B464F524D41544441544554494D45282764642F6D6D2F797979
      79272C205B717279496D7072696D6972436F6E747261746F732E226661747572
      616D656E746F225D295D0D12002020454C5345204D656D6F203A3D2027273B0D
      0300656E6400FFFF0000000000020000000100000000090068656C7665746963
      6100070000000600000000000A0000000100020000000000FFFFFF0000000002
      0000000000000000006F4B00000B006D6D6F504147494E415F50000200C40300
      0042000000280000000D00000043000000F4010000000000000000FFFFFF1F2C
      020000000000010008005B506167696E615D00000000FFFF0000000000020000
      000100000000090068656C766574696361000700000000000000000009000000
      0100020000000000FFFFFF0000000002000000000000000000084C000009006D
      6D6F444154415F50000200BC03000033000000300000000D00000041000000F4
      010000000000000000FFFFFF1F2C020000000000010013005B44415445202344
      64642F6D6D2F797979795D00000000FFFF000000000002000000010000000009
      0068656C76657469636100070000000000000000000100000001000200000000
      00FFFFFF0000000002000000000000000000954C000006004D656D6F31330002
      008000000018010000500000000F00000041000000F4010000000000000000FF
      FFFF1F2C02000000000001000A00434F4E545241544F533A00000000FFFF0000
      000000020000000100000000090068656C766574696361000800000002000000
      0000090000000100020000000000FFFFFF000000000200000000000000020116
      4D00000D004461646F7350726F6475746F73000201000000002C0000002E0400
      000B0000003000050001000000000000000000FFFFFF1F000000001400666462
      50726F6475746F73436F6E747261746F7300000000000000FFFF000000000002
      000000010000000000000001000000C800000014000000010000000000000201
      844D00000E00526F6461706550726F6475746F7300020100000000500000002E
      0400000D0000003000060001000000000000000000FFFFFF1F00000000000000
      000000000000FFFF000000000002000000010000000000000001000000C80000
      0014000000010000000000000001A24E000005004D656D6F3500020020010000
      50000000540000000D0000004300000001000000000000000000FFFFFF1F2C02
      0101000000010000000005000500626567696E0D290020206966205B71727954
      6F746169732E22746F74616C70726F6475746F73225D203E2030207468656E0D
      4700202020202020204D656D6F3A3D20466F726D6174466C6F61742827232323
      2C2323232C2323302E3030272C5B717279546F746169732E22746F74616C7072
      6F6475746F73225D290D16002020656C7365204D656D6F3A3D2027302E303027
      3B200D0300656E6400FFFF0000000000020000000100000000090068656C7665
      746963610007000000020000000000090000000100020000000000FFFFFF0000
      000002000000000000000001374F000006004D656D6F31350002004000000050
      000000840000000D0000004100000001000000000000000000FFFFFF1F2C0200
      0000000001001200544F54414C20444F532050524F4455544F5300000000FFFF
      0000000000020000000100000000090068656C76657469636100070000000200
      00000000080000000100020000000000FFFFFF00000000020000000000000000
      01BC4F00000A006D6D6F5A65627261646F000200000000002C00000074010000
      0B00000003000000F4010000000000000000FFFFFF1F2C020000000000000000
      000000FFFF0000000000020000000100000006090068656C766574696361000A
      000000000000000000080000000100020000000000FFFFFF0000000002000000
      0000000000017450000006004D656D6F3430000200FFFFFFFF2C000000520000
      000B0000004100000001000000000000000000FFFFFF1F2C0200000000000100
      35005B64746D436F6E73756C7461436F6E747261746F732E71727950726F6475
      746F73436F6E747261746F732E2270726F6475746F225D00000000FFFF000000
      0000020000000100000000090068656C76657469636100070000000000000000
      00090000000100020000000000FFFFFF0000000002000000000000000001A251
      000006004D656D6F3431000200520000002C000000C60000000B000000410000
      00F4010000000000000000FFFFFF1F2C0200000000000100AB005B64746D436F
      6E73756C7461436F6E747261746F732E71727950726F6475746F73436F6E7472
      61746F732E2264657363726963616F225D205B64746D436F6E73756C7461436F
      6E747261746F732E71727950726F6475746F73436F6E747261746F732E227661
      6C6F72677261646531225D205B64746D436F6E73756C7461436F6E747261746F
      732E71727950726F6475746F73436F6E747261746F732E2276616C6F72677261
      646532225D00000000FFFF0000000000020000000100000000090068656C7665
      746963610007000000000000000000080000000100020000000000FFFFFF0000
      0000020000000000000000018052000006004D656D6F35310002001A0100002C
      000000250000000B0000004100000001000000000000000000FFFFFF1F2C0200
      0000000001005B005B466F726D6174466C6F6174285B4D617363617261517561
      6E7469646164655D2C5B64746D436F6E73756C7461436F6E747261746F732E71
      727950726F6475746F73436F6E747261746F732E227175616E74696461646522
      5D295D00000000FFFF0000000000020000000100000000090068656C76657469
      63610007000000000000000000090000000100020000000000FFFFFF00000000
      020000000000000000014153000006004D656D6F3532000200410100002C0000
      00320000000B0000004100000001000000000000000000FFFFFF1F2C02010100
      000001003E005B466F726D6174466C6F617428272323232C2323232C2323302E
      3030272C5B71727950726F6475746F73436F6E747261746F732E22746F74616C
      225D295D00000000FFFF0000000000020000000100000000090068656C766574
      6963610007000000000000000000090000000100020000000000FFFFFF000000
      0002000000000000000202C25300000D004461646F735365727669636F730002
      0100000000300000002E0400000B0000003000050001000000000000000000FF
      FFFF1F0000000014006664625365727669636F73436F6E747261746F73000000
      00000000FFFF000000000002000000010000000000000001000000C800000014
      000000010000000000000202305400000E00526F646170655365727669636F73
      00020100000000500000002E0400000D00000030000600010000000000000000
      00FFFFFF1F00000000000000000000000000FFFF000000000002000000010000
      000000000001000000C8000000140000000100000000000000024D5500000600
      4D656D6F3134000200D400000050000000600000000D00000043000000010000
      00000000000000FFFFFF1F2C02010100000000000005000500626567696E0D29
      0020206966205B717279546F746169732E22746F74616C7365727669636F7322
      5D203E2030207468656E0D4700202020202020204D656D6F3A3D20466F726D61
      74466C6F617428272323232C2323232C2323302E3030272C5B717279546F7461
      69732E22746F74616C7365727669636F73225D290D16002020656C7365204D65
      6D6F3A3D2027302E3030273B200D0300656E6400FFFF00000000000200000001
      00000000090068656C7665746963610007000000020000000000090000000100
      020000000000FFFFFF0000000002000000000000000002E255000006004D656D
      6F32320002002C00000050000000980000000D00000041000000010000000000
      00000000FFFFFF1F2C02000000000001001200544F54414C20444F5320534552
      5649434F5300000000FFFF0000000000020000000100000000090068656C7665
      746963610007000000020000000000080000000100020000000000FFFFFF0000
      0000020000000000000000026A5600000D006D6D6F5A65627261646F53756200
      02000100000030000000340100000B00000003000000F4010000000000000000
      FFFFFF1F2C020000000000000000000000FFFF00000000000200000001000000
      06090068656C766574696361000A000000000000000000000000000100020000
      000000FFFFFF00000000020000000000000000022257000006004D656D6F3137
      00020002000000300000001C0000000B00000041000000010000000000000000
      00FFFFFF1F2C020000000000010035005B64746D436F6E73756C7461436F6E74
      7261746F732E7172795365727669636F73436F6E747261746F732E2273657276
      69636F225D00000000FFFF0000000000020000000100000000090068656C7665
      746963610007000000000000000000090000000100020000000000FFFFFF0000
      000002000000000000000002DC57000006004D656D6F32300002002000000030
      000000C60000000B0000004100000001000000000000000000FFFFFF1F2C0200
      00000000010037005B64746D436F6E73756C7461436F6E747261746F732E7172
      795365727669636F73436F6E747261746F732E2264657363726963616F225D00
      000000FFFF0000000000020000000100000000090068656C7665746963610007
      000000000000000000080000000100020000000000FFFFFF0000000002000000
      0000000000029758000006004D656D6F3234000200E700000030000000190000
      000B0000004100000001000000000000000000FFFFFF1F2C0200000000000100
      38005B64746D436F6E73756C7461436F6E747261746F732E7172795365727669
      636F73436F6E747261746F732E227175616E746964616465225D00000000FFFF
      0000000000020000000100000000090068656C76657469636100070000000000
      00000000090000000100020000000000FFFFFF00000000020000000000000000
      02AF59000006004D656D6F32390002000101000030000000320000000B000000
      4100000001000000000000000000FFFFFF1F2C020101000000010095005B466F
      726D6174466C6F617428272323232C2323232C2323302E3030272C5B5B64746D
      436F6E73756C7461436F6E747261746F732E7172795365727669636F73436F6E
      747261746F732E2276616C6F727365727669636F225D2A205B64746D436F6E73
      756C7461436F6E747261746F732E7172795365727669636F73436F6E74726174
      6F732E227175616E746964616465225D295D00000000FFFF0000000000020000
      000100000000090068656C766574696361000700000000000000000009000000
      0100020000000000FFFFFF0000000002000000000000000203275A00000D0044
      61646F7350617263656C6173000201000000002C0000002E0400000C00000030
      00050001000000000000000000FFFFFF1F000000000B0066646250617263656C
      617300000000000000FFFF000000000002000000010000000000000001000000
      C800000014000000010000000000000203955A00000E00526F64617065506172
      63656C6173000201000000004C0000002E0400000D0000003000060001000000
      000000000000FFFFFF1F00000000000000000000000000FFFF00000000000200
      0000010000000000000001000000C80000001400000001000000000000000321
      5B000006004D656D6F3233000200300000004C0000004E0000000D0000004100
      000001000000000000000000FFFFFF1F2C02000000000001000900454D204142
      4552544F00000000FFFF0000000000020000000100000000090068656C766574
      6963610007000000020000000000090000000100020000000000FFFFFF000000
      0002000000000000000003DE5B000006004D656D6F32350002007F0000004C00
      00004A0000000D0000004100000001000000000000000000FFFFFF1F2C020000
      00000001003A005B464F524D4154464C4F415428272323232C2323232C232330
      2E3030272C205B717279546F746169732E22746F74616C41424552544F225D29
      5D00000000FFFF0000000000020000000100000000090068656C766574696361
      0007000000020000000000090000000100020000000000FFFFFF000000000200
      0000000000000003C45C000006004D656D6F3236000200CB0000004C0000003A
      0000000D0000004100000001000000000000000000FFFFFF1F2C020000000000
      010000000005000500626567696E0D250020206966205B717279546F74616973
      2E22746F74616C7061676F225D203E2030207468656E0D1500202020204D656D
      6F203A3D20275155495441444F270D13002020656C7365204D656D6F203A3D20
      272720200D0300656E6400FFFF0000000000020000000100000000090068656C
      7665746963610007000000020000000000090000000100020000000000FFFFFF
      0000000002000000000000000003D75D000006004D656D6F3339000200070100
      004C000000400000000D0000004100000001000000000000000000FFFFFF1F2C
      020000000000010000000005000500626567696E0D250020206966205B717279
      546F746169732E22746F74616C7061676F225D203E2030207468656E0D420020
      2020204D656D6F203A3D20464F524D4154464C4F415428272323232C2323232C
      2323302E3030272C205B717279546F746169732E22746F74616C7061676F225D
      290D13002020656C7365204D656D6F203A3D20272720200D0300656E6400FFFF
      0000000000020000000100000000090068656C76657469636100070000000200
      00000000090000000100020000000000FFFFFF00000000020000000000000000
      03625E000010006D6D6F5A65627261646F5375625375620002001C0000002C00
      00002A0100000B00000003000000F4010000000000000000FFFFFF1F2C020000
      000000000000000000FFFF0000000000020000000100000006090068656C7665
      74696361000A000000000000000000000000000100020000000000FFFFFF0000
      000002000000000000000003105F000006004D656D6F33310002001D0000002C
      000000130000000B0000004100000001000000000000000000FFFFFF1F2C0200
      0000000001002B005B64746D436F6E73756C7461436F6E747261746F732E7172
      7950617263656C61732E226E756D65726F225D00000000FFFF00000000000200
      00000100000000090068656C7665746963610007000000000000000000090000
      000100020000000000FFFFFF0000000002000000000000000003D55F00000600
      4D656D6F33320002004C0000002C000000340000000B00000041000000010000
      00000000000000FFFFFF1F2C000000080064642F6D6D2F79790001003A005B46
      4F524D41544441544554494D45282764642F6D6D2F79797979272C205B717279
      50617263656C61732E226461746176656E63746F225D295D00000000FFFF0000
      000000020000000100000000090068656C766574696361000700000000000000
      00000A0000000100020000000000FFFFFF0000000002000000000000000003A9
      60000006004D656D6F3333000200820000002C000000460000000B0000000100
      000001000000000000000000FFFFFF1F2C020101000000010051005B464F524D
      4154464C4F415428272323232C2323232C2323302E3030272C205B64746D436F
      6E73756C7461436F6E747261746F732E71727950617263656C61732E2276616C
      6F7276656E63746F225D295D00000000FFFF0000000000020000000100000000
      090068656C766574696361000700000000000000000009000000010002000000
      0000FFFFFF0000000002000000000000000003C961000006004D656D6F333400
      0200CA0000002C000000340000000B0000004100000001000000000000000000
      FFFFFF1F2C000000080064642F6D6D2F79790001000000000600050062656769
      6E0D270020206966205B71727950617263656C61732E2264617461706167746F
      225D3C3E2030207468656E0D4300202020206D656D6F3A3D5B464F524D415444
      41544554494D45282764642F6D6D2F79797979272C205B71727950617263656C
      61732E2264617461706167746F225D295D0D06002020656C73650D0C00202020
      206D656D6F3A3D27270D0300656E6400FFFF0000000000020000000100000000
      090068656C76657469636100070000000000000000000A000000010002000000
      0000FFFFFF0000000002000000000000000003DE62000006004D656D6F353300
      0200000100002C000000450000000B0000000100000001000000000000000000
      FFFFFF1F2C00000000000000000005000500626567696E0D280020206966205B
      71727950617263656C61732E2276616C6F72706167746F225D203E2030207468
      656E0D4500202020204D656D6F203A3D20464F524D4154464C4F415428272323
      232C2323232C2323302E3030272C205B71727950617263656C61732E2276616C
      6F72706167746F225D290D11002020656C7365204D656D6F203A3D2027270D03
      00656E6400FFFF0000000000020000000100000000090068656C766574696361
      0007000000000000000000090000000100020000000000FFFFFF000000000200
      0000000000000003F763000006004D656D6F3432000200310000002C0000001B
      0000000B0000004100000001000000000000000000FFFFFF1F2C020000000000
      010000000005000500626567696E0D380020204946205B64746D436F6E73756C
      7461436F6E747261746F732E71727950617263656C61732E2262616E636F225D
      203E2030205448454E0D3600202020204D656D6F203A3D205B64746D436F6E73
      756C7461436F6E747261746F732E71727950617263656C61732E2262616E636F
      225D0D12002020454C5345204D656D6F203A3D2027273B0D0300656E6400FFFF
      0000000000020000000100000000090068656C76657469636100070000000000
      00000000090000000100020000000000FFFFFF000000000200000000000000FE
      FEFF030000000A002043617465676F727931000000000600506167696E610001
      0030000700636C69656E746500010030000000000000000000FC000000000000
      00000000000000000000580023045BDE6D89E340D1ACCE6635F9E340}
  end
  object fdbImprimirContratos: TfrDBDataSet
    DataSet = qryImprimirContratos
    Left = 440
    Top = 384
  end
  object qryServicosContratos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkFields = 'numero=contrato'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrImprimirContratos
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select sc.contrato,'
      '          sc.servico,'
      '          sc.quantidade,'
      '          sc.valorservico,'
      '          s.descricao'
      'from servicoscontratos sc, servicos s'
      'where s.codigo = sc.servico and'
      '%contrato')
    RequestLive = False
    Left = 40
    Top = 312
    object qryServicosContratoscontrato: TStringField
      FieldName = 'contrato'
    end
    object qryServicosContratosservico: TIntegerField
      FieldName = 'servico'
      DisplayFormat = '0'
    end
    object qryServicosContratosquantidade: TIntegerField
      FieldName = 'quantidade'
      DisplayFormat = '0'
    end
    object qryServicosContratosvalorservico: TFloatField
      FieldName = 'valorservico'
      DisplayFormat = '0.00'
    end
    object qryServicosContratosdescricao: TStringField
      FieldName = 'descricao'
      Size = 70
    end
  end
  object qryParcelas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkFields = 'numero=contrato'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrImprimirContratos
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'where'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select numero,'
      '          contrato,'
      '          datavencto,'
      '          valorvencto,'
      '          datapagto,'
      '          valorpagto,'
      
        '          (select banco from contas where conta = contaboleto li' +
        'mit 1) as banco'
      'from parcelas'
      '%where'
      'order by numero, datavencto')
    RequestLive = False
    Left = 40
    Top = 368
    object qryParcelasnumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryParcelascontrato: TStringField
      FieldName = 'contrato'
    end
    object qryParcelasdatavencto: TDateField
      Alignment = taCenter
      FieldName = 'datavencto'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasvalorvencto: TFloatField
      FieldName = 'valorvencto'
      DisplayFormat = '0.00'
    end
    object qryParcelasdatapagto: TDateField
      Alignment = taCenter
      FieldName = 'datapagto'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasvalorpagto: TFloatField
      FieldName = 'valorpagto'
      DisplayFormat = '0.00'
    end
    object qryParcelasbanco: TIntegerField
      FieldName = 'banco'
      DisplayFormat = '0'
    end
  end
  object qryImprimirContratos: TtecQuery
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
        Name = 'where'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select numero,'
      '           cliente,'
      '           nome,'
      '           pessoatipo,'
      '           formatar_cpf_cnpj(pessoanumero) as pessoanumero,'
      '           faturamento,'
      '           valorprazo,'
      '           creditotroca,'
      '           notas_notasdocontrato(numero) as notas'
      'from contratos'
      '%where'
      'order by cliente')
    RequestLive = False
    Left = 324
    Top = 307
    object qryImprimirContratosnumero: TStringField
      FieldName = 'numero'
    end
    object qryImprimirContratoscliente: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object qryImprimirContratosnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryImprimirContratospessoanumero: TStringField
      FieldName = 'pessoanumero'
      Size = 18
    end
    object qryImprimirContratosfaturamento: TDateField
      Alignment = taCenter
      FieldName = 'faturamento'
      EditMask = '99/99/9999;1; '
    end
    object qryImprimirContratospessoatipo: TStringField
      FieldName = 'pessoatipo'
      Size = 1
    end
    object qryImprimirContratosvalorprazo: TFloatField
      FieldName = 'valorprazo'
      DisplayFormat = '0.00'
    end
    object qryImprimirContratoscreditotroca: TFloatField
      FieldName = 'creditotroca'
      DisplayFormat = '0.00'
    end
    object qryImprimirContratosnotas: TStringField
      FieldName = 'notas'
      Size = 14
    end
  end
  object fdbProdutosContratos: TfrDBDataSet
    DataSet = qryProdutosContratos
    Left = 224
    Top = 256
  end
  object fdbServicosContratos: TfrDBDataSet
    DataSet = qryServicosContratos
    Left = 128
    Top = 312
  end
  object fdbParcelas: TfrDBDataSet
    DataSet = qryParcelas
    Left = 128
    Top = 368
  end
  object qryTotais: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkFields = 'numero=numero'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrImprimirContratos
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'where'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select c.numero,'
      
        '(select sum(pc1.quantidade*pc1.precovenda) from produtoscontrato' +
        's pc1 where pc1.contrato = c.numero) as totalprodutos,'
      
        '(select sum(sc1.quantidade*sc1.valorservico) from servicoscontra' +
        'tos sc1 where sc1.contrato = c.numero) as totalservicos,'
      
        '(select sum(p.valorvencto) from parcelas p where p.contrato = c.' +
        'numero and p.datapagto is null) as totalaberto,'
      
        '(select sum(p.valorpagto) from parcelas p where p.contrato = c.n' +
        'umero and p.datapagto is not null) as totalpago'
      'from contratos c'
      '%where'
      'group by c.numero'
      'order by c.numero')
    RequestLive = False
    Left = 40
    Top = 432
    object qryTotaistotalprodutos: TFloatField
      FieldName = 'totalprodutos'
      DisplayFormat = '0.00'
    end
    object qryTotaistotalservicos: TFloatField
      FieldName = 'totalservicos'
      DisplayFormat = '0.00'
    end
    object qryTotaistotalaberto: TFloatField
      FieldName = 'totalaberto'
      DisplayFormat = '0.00'
    end
    object qryTotaistotalpago: TFloatField
      FieldName = 'totalpago'
      DisplayFormat = '0.00'
    end
    object qryTotaisnumero: TStringField
      FieldName = 'numero'
    end
  end
  object dsrImprimirContratos: TtecDataSource
    DataSet = qryImprimirContratos
    Left = 352
    Top = 320
  end
  object frpImprimirContratos_Lista: TfrReport
    Dataset = fdbImprimirContratos_Lista
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnBeforePrint = frpImprimirContratos_ListaBeforePrint
    Left = 352
    Top = 416
    ReportForm = {
      190000008E2E000019FFFF000021005C5C4C5543494F2D313631305C4C65786D
      61726B2058313130302053657269657300FFFFFFFFFF00000000340800009A0B
      00000000000000000000000000000000000000000400000000FFFF0000000000
      00000000000000030400466F726D00FEFFFFFFDC000000780000007C0100002C
      010000040000000200E80000000900726470506167696E6100020100000000DC
      010000F50200000D0000003000030001000000000000000000FFFFFF1F000000
      00000000000000000000FFFF0000000000020000000100000000000000010000
      00C80000001400000001000000000000020081010000080050726F6475746F73
      000201000000000E010000F50200000B00000030000500010000000000000000
      00FFFFFF1F000000000D00666473496E76656E746172696F0000000004000500
      626567696E0D1100204C696E6861203A3D205B4C494E45235D0D0300656E640D
      000000005B000000000002000000010000000000000001000000C80000001400
      0000010000000000000200EA0100000900636162506167696E61000201000000
      0001000000F5020000570000003000020001000000000000000000FFFFFF1F00
      000000000000000000000000FFFF000000000002000000010000000000000001
      000000C8000000140000000100000000000002005E020000140053756DE17269
      6F446F2052656C6174F372696F3100020100000000B3010000F5020000140000
      003000010001000000000000000000FFFFFF1F00000000000000000000000000
      FFFF000000000002000000010000000000000001000000C80000001400000001
      0000000000000000F00200000A006D6D6F5A65627261646F0002002F0000000E
      010000980200000B0000004300000001000000FFFFFF1F0000FFFFFF1F2C0200
      0000000000000002000500626567696E0D0300656E6400FFFF00000000000200
      00000100000006090068656C766574696361000A000000000000000000000000
      000100020000000000FFFFFF1F00000002000000000000000000920300000500
      4D656D6F350002002F000000DE010000C40000000B00000043000000F4010000
      000000000000FFFFFF1F2C020000000000010020005B4461746520237464642F
      64642F79795D205B54494D4520235468683A6D6D5D00000000FFFF0000000000
      020000000100000000090068656C766574696361000700000000000000000010
      0000000100020000000000FFFFFF0000000002000000000000000400E1030000
      05004C696E65370002003A04000062000000000000002400000001000400F401
      0000000000000000FFFFFF1F2C020000000000000000000000FFFF0000000000
      02000000010000000000006B04000009004D656D6F4D61726361000200850100
      003C0000002A0000001800000043000F00F4010000000000000000FFFFFF1F2C
      020101000000010004004461746100000000015B000000000002000000010000
      0000090068656C76657469636100080000000200000000000A00000017000200
      00000000FFFFFF0000000002000000000000000000F304000006004D656D6F31
      34000200070200003C0000002B0000001800000041000F00F401000000000000
      0000FFFFFF1F2C0200000000000100050043616E632E00000000015B00000000
      00020000000100000000090068656C7665746963610008000000020000000000
      0A0000001700020000000000FFFFFF0000000002000000000000000000840500
      0009004D656D6F546F74616C000200770200003C0000004F0000001800000043
      000F00F4010000000000000000FFFFFF1F2C02000000000001000B004175746F
      72697A61E7E36F00000000FFFF0000000000020000000100000000090068656C
      76657469636100080000000200000000000A0000001700020000000000FFFFFF
      00000000020000000000000000000F0600000A004D656D6F436F6469676F0002
      002F0000003C000000150000001800000043000F00F4010000000000000000FF
      FFFF1F2C0200000000000100040046696C2E00000000005B0000000000020000
      000100000000090068656C76657469636100080000000200000000000A000000
      0100020000000000FFFFFF0000000002000000000000000100341E0000070066
      70764C6F676F0002002F00000001000000740000002A00000005000000F40100
      00000000000000FFFFFF1F2C020000000000000000000000FFFF000000000002
      00000001000000060100341E0000424DCE170000000000003604000028000000
      8300000026000000010008000000000098130000120B0000120B000000010000
      0001000000000000E8E5A800AA9E000099990000ADADAD003A3C4100A3970000
      BFB73700D8D48600FBFAF000A5A5A5001E1D1C00D8D9DA0054575A00D6D6D500
      E7E8F20012161B00B6AD1900CBC55B008C8D9200BEC0C500E1E2E40085878A00
      5E606300494C4F00090D12002C2E3300DEDB98007D7F8100EFEDCB00B9BABB00
      AEA400007C7B7B00C5BE440066666600D1CC6F00CDC9810048484600F7F6E600
      AFA5080004080D00F9F8ED00B8AF2700DBD68C00999999001B1A1900C6BF5100
      131312003B3A3A00FFFFFF00EAE8BE00CCCCCC0023262A00E2DEA400F1EFD600
      B0B1B300D3CD7500B1A81000CCCC660072727200535252004342420001060A00
      ECE9C3008C8C8B00F5F4DF004A4A4A0057575600B6AC1F00282B3000C7C05C00
      61615F00F7F7F70088888700DDD89300E3E0A600FDFCF70021242900070A1000
      BDB53100C5BE4A00E3E3E200A69C000099999900BABAB900DEDEDE0052545800
      2A292800D9D58A005F5E5D00C7C595001B1E2300E8E5B60000000700B5AB1300
      D5D07B00C6C6C500B2A80B0021202000B9B12400504F4E00666666006B6D7000
      B5B5BD0084848400E0DC9E00BCB42C00F7EFD6005B5B5A00EFEFEF0087898B00
      DEDEE6003E3D3C0014181E00C8C25300CCC55F00A8A9AC00BDBDBC00E5E1AC00
      75767900181B2000E6E6E6000E1117000810190033333300929191002D2C2B00
      B5B5B40000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000031313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131543D42470E313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131523131313131486D3131316D6D4C3131316D6D313131313131
      313131316D4831313131313131316D6D3131316D040A6C6C313131313131486D
      6D4C3131313131316D6D4C313131313131313131313131486D6D6D3131313131
      31486D6D48313131316D483131316D6D3131313131313131313131316D6D6D31
      31486D6D6D31313131313152313131317F7E6631554225256031603D42647931
      420C313B7D316D6C3D70403131662C316D593D7068313133646C702531484255
      312C70643059313131310C2525420E31477431420E4825793131315442433D47
      4C4C640E3120423C300A3131207E2C317F70254748484251512531603C316D59
      253C620A312C25433068313131313152313131316C2031315959313131317C7D
      4C4C31487C0E3159683177424C51347531434031203D487957543130494C7F3D
      31487C0C310B37317F70313131313C6631313131642C317C33487E5131313131
      3179602F55317C3331316D793B7031487E14314857043131316D7C55557E311E
      3031542D4C314340313148790A0B4C313131315231313131477D313125306C64
      334C5779313131487C0E31224931422C31314340316C7D313C7D313159493157
      0C31543D31487C0C3168705930253131313170706C3C0E313C0A313033317C51
      3131310C702570474C4C3033312C7C64300A3148300E31796243432248483051
      517C31603D316D6464590B2C31547C42301C3131313131523131313147493131
      66420C5548313D2C484831487C0E48302C311C4248516275316C7D31493D4879
      627F31256848373031487C0E3131550E207031313131473C0C554831642C4C7E
      330C62793131316830796D3131487C3331577D6D6D313148303331487C495551
      31487C0C0C7E4C2C703131480C0E7C2C313C476D6D3131313131315231313104
      0B7E20316D473C6C33310E3D3C6C7931254264646D31486C42706831316C7D31
      484742702031310E3D433D6C31484355314043473D0A31313131796C3C6C0E31
      6670597E3C3D20313131310E256C6C7731316C0E312C3D47430431772F3D0A31
      33424366484825643C7E6C7C74316D225943425531543D59437D313131313152
      3131316D643B6D3131316D514831313179514C316D51793131313131796D3131
      313C40313131796D313131313179794831317F6D316D15154831313131313131
      795148314879516D796D3131313131313151517931317F6D31316D51516D3151
      577F6D313131797931316D51516D5148313131515151313131314851516D3131
      3131315231313131400431313131313131313131313131313131313131313131
      31313131316804313131313131313131313131313148660F3131313131313131
      3131313131313131313131313131313131313131313131313131220E31313131
      3131313166553131313131313131313131313131313131313131313131313131
      3131313131313152313131313131313131313131313131313131313131313131
      31313131313131313131313131313131313131313131313131315C4612121246
      3F31313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131523131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131315F06
      020202061B313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131523131313131310E40173C18183D6E3131
      313131310C2C666C3C181818181805683131313131316D3768220D0516313131
      313108021F1F1F5235313131313172070707070707070707070707070750732B
      3631313131313131313131362B73212112081D31313131313131313123505050
      504B3131313131313131313F08122E505050085231313131312C103E19191919
      5D17313131317966713E4E191919191919195D0D31313131312C342828191900
      17313131313108021F1F1F523531313131311152020202020202020202020202
      020202022776313131313131313F501F02020202020202075C31313131313131
      6A060202065F313131313131314C120202020202020221523131313175287A78
      787878784E223131310E1A3E10787871717171717171281731313131773E7A71
      7171712822313131313108021F1F1F5235313131313144021F1F1F1F1F1F1F1F
      1F1F1F1F1F1F1F1F1F1F1D31313131310802021F1F1F1F1F1F1F1F0202233131
      3131313107021F1F0208313131313131313A521F1F1F1F1F1F1F505231313131
      0D4E7878787A7A71282231316D7C4E7878784E4E7A717171717128173131312C
      3E7171717119195D22313131313108021F1F1F5269314C4C4C4C631F1F1F1F1F
      1F1F1F1F1F1F1F1F1F1F1F1F1F52503131313138521F1F1F0202020202021F1F
      1F5212313131313107021F1F0208313131313131361F1F1F1F1F020202022152
      3131316D457A78787A3D370E0E5131313B3E7878787A2274140E0E0E0E0E0E15
      313115787A787871190D0A145A2A6A6A6A2A5F36363636365044111111113226
      262626262626262626262626264A1F1F1F1F612631311B521F1F1F02443A0808
      2363021F1F1F525F3131313107021F1F02083131313131311B021F1F1F1F6A2B
      353532523131310E71717171710C313131313115781078784E68313131313131
      3131313131311C287878787A2C3131310106020202025F313131313150520202
      02023631313131313131313131313131313144021F1F1F32312639021F1F1F58
      4C31313131311B27021F1F1F3631313107021F1F020831313131313123021F1F
      1F11093131313152313131337A717171454831313131312C28787810344C3131
      31313131313131313131057A78784E663131313135021F1F1F025F3131313131
      50021F1F1F1F3631313131313131313131313131314C5E021F1F0276315F521F
      1F1F4B313131313131313132271F1F527331313107021F1F0208313131313131
      12021F1F0272313131313152313131601978787A7C4C31313131316628787810
      45166E6E6E6E6E6E6E6E1C0431555B1078717A603131313135021F1F1F025F31
      3131313150021F1F1F1F36313131313131314C0909090909363A021F1F1F1F3F
      314F021F02723131313131313131313123021F1F1109313107021F1F02083131
      313131312E021F1F0273313131313152313131601978787A054C313131313156
      1978787871282828282828282828005631337A717171346D3131313135520202
      02025F31313131312106020202023631313131762E635E61616161611F1F1F1F
      1F1F114C26611F1F0276313131313131313131311D1F1F1F1F1D313107021F1F
      02083131313131312E021F1F023A313131313152313131601978787A054C3131
      3131311819787878787878787878787878784E1731141978787A454831313131
      764444444444241551515151464F4F4F4F4F413131313A0202021F1F1F1F1F1F
      1F1F1F1F1F521B311D1F1F1F1F363131313131313131313126391F1F1F5C3131
      07021F1F02083131313131312E021F1F023A313131313152313131601978787A
      054C31313131315619787878787878787878787878784E1731337A717171346D
      313131313109090909097D713434347A37313131313131313158521F1F1F1F1F
      0202020202020202275831311D1F1F1F1F1D3131313131313131313126391F1F
      1F5C313107021F1F02083131313131312E021F1F023A31313131315231313160
      1978787A054C3131313131224E787878784E28282828282828280056310C7871
      71715B0C31313131313131313131133E1010105D74313131313131312939021F
      1F1F1F3911636363636A50083631313126611F1F024B31313131313131313131
      3F021F1F1F36313107021F1F02083131313131312E021F1F023A313131313152
      313131601978787A054C313131313116287878101A2C2C2C2C2C2C2C2C2C7D1E
      316D1A7A7878197F31313131313131313131134E787878287431313131313131
      76021F1F1F1F23263131313131313131313131313107021F0221313131313131
      3131313173021F1F444C313107021F1F02083131313131312E021F1F023A3131
      31313152313131601978787A054C31313131317F197171713448313131313131
      313131313131561978784E6631313131313131313131134E7878782874313131
      313131312B521F1F1F6129313131313131313131313131313158521F1F024A31
      313131313131317602021F522331313107021F1F02083131313131312E021F1F
      023A313131313152313131331978787A053131313131316D347A78784E133131
      313131313131313131317D287878717104313131313131313131130019191900
      04313131313131312B521F1F1F27413131313131313131313131313131091102
      1F1F1F232631313131295F1F1F1F1F612931313107021F1F022B313131313131
      2E021F1F52233131313131520E14602C7A78787A7C141414140C3131203E7878
      7171660A1E6014141414140E3131155B107878107A567D371E1E1E1E1E1E1356
      6C6C6C182C75757575756D315C021F1F1F1F211B1B1B1B1B1B4A4A4A4A4A3631
      313176021F1F1F0261502323725E021F1F1F0258762B2B4A44021F1F1F504A4A
      4A2B1D312E021F1F1F074A4A4A4A5C520D7A7A7A78787878787A7A7A5D173131
      7945197878784E4E7A7A7A7A7A7A5D6C313131165D7171717119191919191919
      195D6E313131313166007A7A7A4E1431295E021F1F1F02020202020202020202
      02062B313131315802021F1F1F020202021F1F1F1F52384C395252521F1F1F1F
      1F020202020608312E021F1F1F1F020202022152177171787878787878717171
      4E22313131335B28717878787871717171714E1731313131173E7A7178787878
      78787878784E6E313131313166287171717A6031314A521F1F1F1F1F1F1F1F1F
      1F1F1F1F1F524A31313131316939521F1F1F1F1F1F1F1F020258310911021F1F
      1F1F1F1F1F1F1F1F1F022B312E021F1F1F1F1F1F1F1F50520D19191978787878
      781919190017313131310C0D10284E4E191919191919000D31313131317D1A4E
      4E4E19191919191919001C3131313131662878787810603131315F0202020202
      020202020202020202062B31313131313136733902020202020261721D313129
      615252521F1F1F1F1F020202020608312E021F1F1F1F0202020221527D17173C
      107878714D1717170D2C3131313131310E0A1C3B2217171717170D7D31313131
      313148757D77661717171717170D043131313131662878787810603131313136
      4A3A7272727272727272727272505C3131313131313131264B5F737338354131
      313131093A7272725E1F1F1F1F4F1212122E5C312E021F1F1F63121212125852
      3131310E1978787A053131313131313131313131313131313131313131313131
      31313131313131313131313131313131313131313131313117003E3E3E5D7531
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313107021F1F52583131313131312E021F1F02233131
      31313152313131601978787A054C313131313131313131313131313131313131
      313131313131313131313131313131313131313131313131313131317F686E6E
      6E6E153131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313121021F1F02073131313131312E021F1F
      023A313131313152313131601978787A054C3131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131313131313173021F1F1F1F4F3A233A3231
      2E021F1F023A313131313152313131601978787A054C31313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131313131313131313131313169521F1F1F1F0202
      020608312E021F1F023A313131313152313131601978787A054C313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131313131313131313131313131310963521F
      1F1F1F1F1F024A312E021F1F023A313131313152313131601971717A054C3131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      314150611F1F1F1F1F024A3150021F1F023A3131313131523131310C0D17176C
      774C313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131315C3872727272725C31082E2E2E2E1B3131313131520000C21E
      000009006D6D6F544954554C4F00020054010000010000001E0100001A000000
      43000000F4010000000000000000FFFFFF1F2C020000000000010008005B7469
      74756C6F5D00000000FFFF0000000000020000000100000006090068656C7665
      74696361000A000000020000000000020000000100020000000000FFFFFF0000
      000002000000000000000000651F000006004D656D6F313200020029020000DE
      0100009A0000000A00000043000000F4010000000000000000FFFFFF1F2C0200
      0000000001002000746563534F4654202D205465636E6F6C6F67696120656D20
      53697374656D617300000000FFFF000000000002000000010000000009006865
      6C7665746963610007000000000000000000110000000100020000000000FFFF
      FF00000000020000000000000000001120000005004D656D6F320002002F0000
      000E010000150000000B00000000000000F4010000000000000000FFFFFF1F2C
      02000000000001002A005B717279496D7072696D6972436F6E747261746F735F
      4C697374612E2266696C69616C76656E6461225D00000000FFFF000000000002
      0000000100000006090068656C76657469636100070000000000000000001100
      00001700020000000000FFFFFF0000000002000000000000000000E620000006
      004D656D6F3133000200970000000E010000120000000B00000000000000F401
      0000000000000000FFFFFF1F2C020000000000010027005B717279496D707269
      6D6972436F6E747261746F735F4C697374612E22736974756163616F225D0000
      0000FFFF0000000000020000000100000006090068656C766574696361000700
      00000000000000001200000017000000FF000000FFFFFF1F2B005B717279496D
      7072696D6972436F6E747261746F735F4C697374612E22736974756163616F22
      5D3D27432700020000000000000000008E21000005004D656D6F34000200A900
      00000E010000DC0000000B00000000000000F4010000000000000000FFFFFF1F
      2C020000000000010026005B717279496D7072696D6972436F6E747261746F73
      5F4C497374612E22636C69656E7465225D00000000FFFF000000000002000000
      0100000006090068656C76657469636100070000000000000000001000000017
      00020000000000FFFFFF00000000020000000000000000008D22000005004D65
      6D6F38000200E00100000E010000270000000B00000040000000F40100000000
      00000000FFFFFF1F2C02000000000001007D005B4946285B717279496D707269
      6D6972436F6E747261746F735F4C697374612E226661747572616D656E746F22
      5D3D302C27272C5B464F524D41544441544554494D45282764642F6D6D2F7979
      272C5B717279496D7072696D6972436F6E747261746F735F4C697374612E2266
      61747572616D656E746F225D295D295D00000000FFFF00000000000200000001
      00000006090068656C7665746963610007000000000000000000120000001700
      020000000000FFFFFF00000000020000000000000000001823000006004D656D
      6F554E000200440000003C000000530000001800000043000F00F40100000000
      00000000FFFFFF1F2C02000000000001000800436F6E747261746F0000000001
      5B0000000000020000000100000000090068656C766574696361000800000002
      00000000000A0000000100020000000000FFFFFF000000000200000000000000
      0000EB23000006004D656D6F3136000200440000000E010000530000000B0000
      0000000000F4010000000000000000FFFFFF1F2C020000000000010025005B71
      7279496D7072696D6972436F6E747261746F735F4C697374612E226E756D6572
      6F225D00000000FFFF0000000000020000000100000006090068656C76657469
      636100070000000000000000001100000017000000FF020200FFFFFF1F2B005B
      717279496D7072696D6972436F6E747261746F735F4C697374612E2273697475
      6163616F225D3D27432700020000000000000000007524000006004D656D6F33
      30000200AF0100003C000000310000001800000043000F00F401000000000000
      0000FFFFFF1F2C020101000000010007005265736572762E00000000015B0000
      000000020000000100000000090068656C766574696361000800000002000000
      00000A0000001700020000000000FFFFFF000000000200000000000000000039
      25000006004D656D6F3331000200850100000E0100002A0000000B0000000000
      0000F4010000000000000000FFFFFF1F2C020000000000010041005B464F524D
      41544441544554494D4528202764642F6D6D2F7979272C5B717279496D707269
      6D6972436F6E747261746F735F4C697374612E2264617461225D295D00000000
      FFFF0000000000020000000100000006090068656C7665746963610007000000
      000000000000120000001700020000000000FFFFFF0000000002000000000000
      000000C525000009004D656D6F437573746F000200320200003C000000450000
      001800000043000F00F4010000000000000000FFFFFF1F2C0200000000000100
      06004C6F6761646F00000000015B000000000002000000010000000009006865
      6C76657469636100080000000200000000000A0000001700020000000000FFFF
      FF00000000020000000000000000004C26000006004D656D6F3239000200E001
      00003C000000270000001800000043000F00F4010000000000000000FFFFFF1F
      2C020101000000010004004661742E00000000015B0000000000020000000100
      000000090068656C76657469636100080000000200000000000A000000170002
      0000000000FFFFFF00000000020000000000000000005027000006004D656D6F
      3333000200AF0100000E010000310000000B00000000000000F4010000000000
      000000FFFFFF1F2C020000000000010081005B4946285B717279496D7072696D
      6972436F6E747261746F735F4C697374612E226461746172657365727661646F
      225D3D302C27272C5B464F524D41544441544554494D45282764642F6D6D2F79
      79272C5B717279496D7072696D6972436F6E747261746F735F4C697374612E22
      6461746172657365727661646F225D295D295D00000000FFFF00000000000200
      00000100000006090068656C7665746963610007000000000000000000120000
      001700020000000000FFFFFF00000000020000000000000000004A2800000600
      4D656D6F3137000200070200000E0100002B0000000B00000040000000F40100
      00000000000000FFFFFF1F2C000000000000010077005B4946285B717279496D
      7072696D6972436F6E747261746F735F4C697374612E2263616E5F6461746122
      5D3D302C27272C5B464F524D41544441544554494D45282764642F6D6D2F7979
      272C5B717279496D7072696D6972436F6E747261746F735F4C697374612E2263
      616E5F64617461225D295D295D00000000FFFF00000000000200000001000000
      06090068656C7665746963610007000000000000000000120000001700020000
      000000FFFFFF0000000002000000000000000000E728000005006D6D6F494500
      0200A400000019000000AE0000000A00000043000000F4010000000000000000
      FFFFFF1F2C02000000000001001B00492E4553542E3A5B496E7363726963616F
      457374616475616C5D2000000000FFFF00000000000200000001000000000900
      68656C7665746963610007000000000000000000100000000100020000000000
      FFFFFF00000000020000000000000000009B29000007006D6D6F434E504A0002
      00A40000000D000000AE0000000A00000043000000F4010000000000000000FF
      FFFF1F2C02000000000001003000434E504A3A205B464F524D41545445585428
      2723232E2323232E2323232F232323232D2323272C205B434E504A5D295D0000
      0000FFFF0000000000020000000100000000090068656C766574696361000700
      0000000000000000100000000100020000000000FFFFFF000000000200000000
      0000000000272A000008006D6D6F52617A616F000200A400000001000000AE00
      00000A00000043000000F4010000000000000000FFFFFF1F2C02000000000001
      0007005B52617A616F5D00000000FFFF00000000000200000001000000060900
      68656C7665746963610007000000000000000000100000000100020000000000
      FFFFFF0000000002000000000000000000AD2A000005004D656D6F3100020097
      0000003C000000120000001800000043000F00F4010000000000000000FFFFFF
      1F2C020000000000010004005369742E00000000005B00000000000200000001
      00000000090068656C76657469636100080000000200000000000A0000000100
      020000000000FFFFFF0000000002000000000000000000402B00000F006D6D6F
      524F54554C4F444154415F5000020075020000040000001A0000000D00000041
      000000F4010000000000000000FFFFFF1F2C0200000000000100070044617461
      203A2000000000FFFF0000000000020000000100000000090068656C76657469
      63610007000000000000000000000000000100020000000000FFFFFF00000000
      02000000000000000000D92B000009006D6D6F444154415F5000020092020000
      04000000300000000D00000041000000F4010000000000000000FFFFFF1F2C02
      0000000000010013005B4441544520234464642F6D6D2F797979795D00000000
      FFFF0000000000020000000100000000090068656C7665746963610007000000
      000000000000010000000100020000000000FFFFFF0000000002000000000000
      0000006C2C00000900666D76506167696E6100020075020000140000004A0000
      000F00000043000000F4010000000000000000FFFFFF1F2C0200000000000100
      0D00506167203A205B50414745235D00000000FFFF0000000000020000000100
      000000090068656C766574696361000700000000000000000000000000010002
      0000000000FFFFFF0000000002000000000000000000FB2C00000B004D656D6F
      50726F6475746F000200A90000003C000000DC0000001800000043000F00F401
      0000000000000000FFFFFF1F2C02000000000001000700436C69656E74650000
      0000015B0000000000020000000100000000090068656C766574696361000800
      00000200000000000A0000000100020000000000FFFFFF000000000200000000
      0000000000A92D000005004D656D6F33000200320200000E010000450000000B
      00000000000000F4010000000000000000FFFFFF1F2C02000000000001002C00
      5B717279496D7072696D6972436F6E747261746F735F4C497374612E22757375
      6172696F6C6F6761646F225D00000000FFFF0000000000020000000100000006
      090068656C766574696361000700000000000000000010000000170002000000
      0000FFFFFF00000000020000000000000000005C2E000005004D656D6F360002
      00770200000E0100004F0000000B00000000000000F4010000000000000000FF
      FFFF1F2C020000000000010031005B717279496D7072696D6972436F6E747261
      746F735F4C497374612E227573756172696F6175746F72697A6163616F225D00
      000000FFFF0000000000020000000100000006090068656C7665746963610007
      000000000000000000100000001700020000000000FFFFFF0000000002000000
      00000000FEFEFF000000000000000000000000FC000000000000000000000000
      00000000580023045BDE6D89E3403C10CF6635F9E340}
  end
  object qryImprimirContratos_Lista: TtecQuery
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
        Name = 'where'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'order'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select  situacao,'
      '           numero,'
      
        '           cast (cliente as varchar) || '#39' - '#39' || nome as cliente' +
        ','
      '           data,'
      '           datareservado,'
      '           faturamento,'
      '           can_data,'
      
        '           cast(can_usuariologado as varchar)  || '#39' - '#39' || (SELE' +
        'CT nome FROM usuarios WHERE codigo=can_usuariologado) as usuario' +
        'logado,'
      
        '           cast(can_usuarioautorizacao  as varchar) || '#39' - '#39' || ' +
        '(SELECT nome FROM usuarios WHERE codigo=can_usuarioautorizacao) ' +
        'as usuarioautorizacao,'
      '           filialvenda'
      '           '
      'from contratos c'
      '%where'
      '%order')
    RequestLive = False
    Left = 252
    Top = 387
    object qryImprimirContratos_Listasituacao: TStringField
      FieldName = 'situacao'
      Required = True
      Size = 1
    end
    object qryImprimirContratos_Listanumero: TStringField
      FieldName = 'numero'
      Required = True
    end
    object qryImprimirContratos_Listacliente: TMemoField
      FieldName = 'cliente'
      BlobType = ftMemo
    end
    object qryImprimirContratos_Listadata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryImprimirContratos_Listadatareservado: TDateField
      Alignment = taCenter
      FieldName = 'datareservado'
      EditMask = '99/99/9999;1; '
    end
    object qryImprimirContratos_Listafaturamento: TDateField
      Alignment = taCenter
      FieldName = 'faturamento'
      EditMask = '99/99/9999;1; '
    end
    object qryImprimirContratos_Listacan_data: TDateField
      Alignment = taCenter
      FieldName = 'can_data'
      EditMask = '99/99/9999;1; '
    end
    object qryImprimirContratos_Listausuariologado: TMemoField
      FieldName = 'usuariologado'
      BlobType = ftMemo
    end
    object qryImprimirContratos_Listausuarioautorizacao: TMemoField
      FieldName = 'usuarioautorizacao'
      BlobType = ftMemo
    end
    object qryImprimirContratos_Listafilialvenda: TIntegerField
      FieldName = 'filialvenda'
      Required = True
    end
  end
  object dsrImprimirContratos_Lista: TtecDataSource
    DataSet = qryImprimirContratos_Lista
    Left = 280
    Top = 400
  end
  object fdbImprimirContratos_Lista: TfrDBDataSet
    DataSet = qryImprimirContratos_Lista
    Left = 424
    Top = 432
  end
  object qryNotasContrato: TtecQuery
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
      'Select  n.filial, '
      '            n.serie, '
      '            n.numero'
      'From    notas n, dadosfiscais df'
      'Where (n.dadofiscal = df.numero) '
      '     and (df.contrato =: contrato)'
      '     and df.situacao='#39'N'#39
      '')
    RequestLive = False
    Left = 520
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptUnknown
      end>
    object qryNotasContratofilial: TIntegerField
      FieldName = 'filial'
      Required = True
      DisplayFormat = '0'
    end
    object qryNotasContratoserie: TStringField
      FieldName = 'serie'
      Required = True
      Size = 3
    end
    object qryNotasContratonumero: TIntegerField
      FieldName = 'numero'
      Required = True
      DisplayFormat = '0'
    end
  end
  object dsrNotasContratos: TDataSource
    DataSet = qryNotasContrato
    Left = 520
    Top = 256
  end
  object qryContratosAlteracao: TtecQuery
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
      'select c.numero,'
      '       c.vendedor,'
      '       c.usuariologadoalteracao,'
      '       c.usuarioalteracao,'
      '       c.datahoraalteracaousuario,'
      '       c.filialvenda'
      ''
      'from contratos c'
      'where c.numero = :numero'
      '')
    RequestLive = True
    Left = 128
    Top = 472
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end>
    object qryContratosAlteracaonumero: TStringField
      FieldName = 'numero'
    end
    object qryContratosAlteracaovendedor: TIntegerField
      FieldName = 'vendedor'
      Required = True
    end
    object qryContratosAlteracaousuariologadoalteracao: TIntegerField
      FieldName = 'usuariologadoalteracao'
    end
    object qryContratosAlteracaousuarioalteracao: TIntegerField
      FieldName = 'usuarioalteracao'
    end
    object qryContratosAlteracaodatahoraalteracaousuario: TDateTimeField
      FieldName = 'datahoraalteracaousuario'
    end
    object qryContratosAlteracaofilialvenda: TIntegerField
      FieldName = 'filialvenda'
      Required = True
    end
  end
  object dsrContratosAlteracao: TtecDataSource
    DataSet = qryContratosAlteracao
    OnDataChange = dsrContratosAlteracaoDataChange
    Left = 304
    Top = 472
  end
  object qryDadosFiscaisAlteracao: TtecQuery
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
      'select df.numero,'
      '       df.vendedor,'
      '       df.usuariologadoalteracao,'
      '       df.usuarioalteracao,'
      '       df.datahoraalteracaousuario,'
      '       df.filialvenda'
      'from dadosfiscais df'
      'where df.contrato = :contrato'
      ''
      ''
      '')
    RequestLive = True
    Left = 128
    Top = 520
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptUnknown
      end>
    object qryDadosFiscaisAlteracaonumero: TIntegerField
      FieldName = 'numero'
    end
    object qryDadosFiscaisAlteracaovendedor: TIntegerField
      FieldName = 'vendedor'
    end
    object qryDadosFiscaisAlteracaousuariologadoalteracao: TIntegerField
      FieldName = 'usuariologadoalteracao'
    end
    object qryDadosFiscaisAlteracaousuarioalteracao: TIntegerField
      FieldName = 'usuarioalteracao'
    end
    object qryDadosFiscaisAlteracaodatahoraalteracaousuario: TDateTimeField
      FieldName = 'datahoraalteracaousuario'
    end
    object qryDadosFiscaisAlteracaofilialvenda: TIntegerField
      FieldName = 'filialvenda'
    end
  end
  object dsrDadosFiscaisAlteracao: TtecDataSource
    DataSet = qryDadosFiscaisAlteracao
    Left = 304
    Top = 520
  end
  object qryProdutosDadosFiscaisAlteracao: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'ListaProdutos'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select pdf.dadofiscal,'
      '       pdf.produto,'
      '       pdf.filial,'
      '       pdf.numero,'
      '       pdf.vendedor,'
      '       pdf.usuariologadoalteracao,'
      '       pdf.usuarioalteracao,'
      '       pdf.datahoraalteracaousuario'
      ''
      'from produtosdadosfiscais pdf, dadosfiscais df'
      'where pdf.dadofiscal = df.numero'
      '   and df.contrato = :contrato'
      '   and (pdf.produto,pdf.filial) in (%ListaProdutos) '
      ''
      ''
      '')
    RequestLive = True
    Left = 128
    Top = 568
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptUnknown
      end>
    object qryProdutosDadosFiscaisAlteracaodadofiscal: TIntegerField
      FieldName = 'dadofiscal'
    end
    object qryProdutosDadosFiscaisAlteracaonumero: TIntegerField
      FieldName = 'numero'
    end
    object qryProdutosDadosFiscaisAlteracaoproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryProdutosDadosFiscaisAlteracaofilial: TIntegerField
      FieldName = 'filial'
    end
    object qryProdutosDadosFiscaisAlteracaovendedor: TIntegerField
      FieldName = 'vendedor'
    end
    object qryProdutosDadosFiscaisAlteracaousuariologadoalteracao: TIntegerField
      FieldName = 'usuariologadoalteracao'
    end
    object qryProdutosDadosFiscaisAlteracaousuarioalteracao: TIntegerField
      FieldName = 'usuarioalteracao'
    end
    object qryProdutosDadosFiscaisAlteracaodatahoraalteracaousuario: TDateTimeField
      FieldName = 'datahoraalteracaousuario'
    end
  end
  object dsrProdutosDadosFiscaisAlteracao: TtecDataSource
    DataSet = qryProdutosDadosFiscaisAlteracao
    Left = 304
    Top = 568
  end
end
