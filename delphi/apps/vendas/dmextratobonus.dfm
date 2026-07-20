inherited dtmExtratoBonus: TdtmExtratoBonus
  OldCreateOrder = False
  Left = 277
  Top = 106
  Height = 330
  Width = 551
  object qryBonus: TtecQuery
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
        Name = 'CANCELADOS'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'SELECT b.contrato,'
      '       b.tipo,'
      '       (CASE WHEN b.datasaida IS NOT NULL THEN b.datasaida'
      '                   ELSE b.data'
      '        END) as data,'
      '       b.parcela,'
      '       cast((SELECT p.descricao'
      '         FROM   produtos p'
      '         WHERE  p.codigo = b.produto'
      '         )||'#39' '#39'||(SELECT p.valorgrade1'
      '                  FROM   produtos p'
      '                  WHERE  p.codigo = b.produto'
      '                  )||'#39' '#39'||(SELECT p.valorgrade2'
      #9#9#9'   FROM   produtos p'
      #9#9#9'   WHERE  p.codigo = b.produto'
      '                           )'
      '       AS varchar) AS produto,'
      '       valor,'
      '       cancelado'
      'FROM bonus b'
      'where cliente = :cliente'
      'and data >= :data'
      '%CANCELADOS'
      'ORDER BY data')
    RequestLive = False
    Left = 32
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'data'
        ParamType = ptUnknown
      end>
    object qryBonustipo: TStringField
      FieldName = 'tipo'
      Size = 15
    end
    object qryBonuscontrato: TStringField
      FieldName = 'contrato'
      Required = True
      Size = 15
    end
    object qryBonusdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryBonusparcela: TIntegerField
      FieldName = 'parcela'
      DisplayFormat = '0'
    end
    object qryBonusvalor: TIntegerField
      FieldName = 'valor'
      Required = True
      DisplayFormat = '0'
    end
    object qryBonuscancelado: TBooleanField
      FieldName = 'cancelado'
      Required = True
    end
    object qryBonusproduto: TStringField
      FieldName = 'produto'
      Size = 162
    end
  end
  object dsrBonus: TtecDataSource
    DataSet = qryBonus
    Left = 72
    Top = 16
  end
  object qryProcuraClientes: TtecQuery
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
      '       nome'
      'From  clientes'
      'Where codigo  = :codigo')
    RequestLive = False
    Left = 32
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraClientescodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryProcuraClientesnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
  end
  object dsrProcuraClientes: TtecDataSource
    DataSet = qryProcuraClientes
    Left = 72
    Top = 72
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
      'Select cl.codigo,'
      '           cl.nome,'
      '           formatar_cpf_cnpj(cl.pessoanumero) as pessoanumero,'
      '           cl.estado,'
      '           c.nome as nomecidade'
      'From    clientes cl, cidades c'
      'Where (cl.codigo = 0)  /*  Preencher em Tempo de Execu'#231#227'o  */'
      '   and  (cl.estado = c.estado)'
      '   and (cl.cidade = c.codigo)'
      'Order By UPPER(TO_ASCII(cl.nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 162
    Top = 8
    object qryConsultaClientesnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaClientespessoanumero: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'pessoanumero'
      Size = 18
    end
    object qryConsultaClientesnomecidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'nomecidade'
      Required = True
      Size = 40
    end
    object qryConsultaClientesestado: TStringField
      DisplayLabel = 'UF'
      FieldName = 'estado'
      Size = 2
    end
    object qryConsultaClientescodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 8
      FieldName = 'codigo'
    end
  end
  object qrySaldoAtual: TtecQuery
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
      'select bonus_saldoatual(:Cliente) as saldoatual')
    RequestLive = False
    Left = 32
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente'
        ParamType = ptUnknown
      end>
    object qrySaldoAtualsaldoatual: TIntegerField
      FieldName = 'saldoatual'
      DisplayFormat = '0'
    end
  end
  object dsrSaldoAtual: TtecDataSource
    DataSet = qrySaldoAtual
    Left = 72
    Top = 136
  end
  object qryProdutosResgate: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryProdutosResgateAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select produtos.*'
      'from (select descricao, valorgrade1, valorgrade2,'
      '             codigo,'
      '             filial,'
      '             emestoque,'
      '             reservado,'
      '             brinde,'
      '             montagem,'
      '             cast(bonus as float),'
      '             linha,'
      '             coluna,'
      '             false as selecionar'
      '      from(select p.descricao, p.valorgrade1, p.valorgrade2,'
      '                  p.codigo,'
      '                  e.filial,'
      '                  e.emestoque,'
      '                  e.reservado,'
      '                  c.brinde,'
      '                  c.montagem,'
      '                  c.bonus,'
      
        '                  (select gr.descricao from grades gr where gr.c' +
        'odigo = c.grade1) as linha,'
      
        '                  (select gr.descricao from grades gr where gr.c' +
        'odigo = c.grade2) as coluna'
      
        '           from estoques e, produtos p, caracteristicas c, filia' +
        'is f'
      '           where  e.produto = p.codigo'
      '             and  p.caracteristica = c.codigo'
      '             and  e.filial = f.codigo'
      '             and  e.emestoque > 0'
      
        '             and  ((p.inativo is null ) or (p.inativo>current_da' +
        'te))'
      '          ) as temp'
      '     ) as produtos'
      'where brinde'
      '  and bonus <= :SaldoAtual'
      
        'order by UPPER(TO_ASCII(descricao,'#39'LATIN1'#39')), valorgrade1, valor' +
        'grade2')
    RequestLive = True
    Left = 160
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SaldoAtual'
        ParamType = ptUnknown
      end>
    object qryProdutosResgatedescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object qryProdutosResgatevalorgrade1: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade1'
      Size = 30
    end
    object qryProdutosResgatevalorgrade2: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade2'
      Size = 30
    end
    object qryProdutosResgatecodigo: TLargeintField
      FieldName = 'codigo'
    end
    object qryProdutosResgatefilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryProdutosResgateemestoque: TFloatField
      FieldName = 'emestoque'
      DisplayFormat = '0'
    end
    object qryProdutosResgatereservado: TFloatField
      FieldName = 'reservado'
      DisplayFormat = '0'
    end
    object qryProdutosResgatebrinde: TBooleanField
      FieldName = 'brinde'
    end
    object qryProdutosResgatemontagem: TBooleanField
      FieldName = 'montagem'
    end
    object qryProdutosResgatebonus: TFloatField
      FieldName = 'bonus'
      DisplayFormat = '0.00'
    end
    object qryProdutosResgateselecionar: TBooleanField
      FieldName = 'selecionar'
    end
    object qryProdutosResgatelinha: TStringField
      FieldName = 'linha'
      Size = 50
    end
    object qryProdutosResgatecoluna: TStringField
      FieldName = 'coluna'
      Size = 50
    end
  end
  object dsrProdutosResgate: TtecDataSource
    DataSet = qryProdutosResgate
    Left = 200
    Top = 72
  end
  object spcContratosProximo: TtecQuery
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
      'select contratos_proximonumero() as numero')
    RequestLive = False
    Left = 160
    Top = 128
    object spcContratosProximonumero: TStringField
      FieldName = 'numero'
      Size = 5
    end
  end
  object qryProdutosContratos: TtecQuery
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
      'select pc.contrato,'
      '          pc.produto,'
      '          pc.filial,'
      '          pc.numero,'
      '          pc.quantidade,'
      '          pc.precovenda,'
      '          pc.precotabela,'
      '          pc.descricaoprecovenda,'
      '          pc.montagem,'
      '          pc.entrega,'
      '          pc.produtolista,'
      '          pc.cancelado,'
      '          p.descricao,'
      
        '          (select gr.descricao from grades gr where gr.codigo = ' +
        'c.grade1) as linha,'
      
        '          (select gr.descricao from grades gr where gr.codigo = ' +
        'c.grade2) as coluna,'
      '          p.valorgrade1,'
      '          p.valorgrade2,'
      '          pc.reserva,'
      '          pc.brinde,'
      '          pc.vendedor,'
      '          pc.promocao'
      'from produtoscontratos pc, produtos p, caracteristicas c'
      'where (p.codigo = pc.produto) and'
      '         (p.caracteristica = c.codigo) and'
      '          (pc.contrato = :contrato)'
      'Order By pc.numero')
    RequestLive = True
    Left = 392
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptUnknown
      end>
    object qryProdutosContratoscontrato: TStringField
      FieldName = 'contrato'
    end
    object qryProdutosContratosproduto: TLargeintField
      FieldName = 'produto'
      Required = True
    end
    object qryProdutosContratosfilial: TIntegerField
      FieldName = 'filial'
      Required = True
    end
    object qryProdutosContratosnumero: TIntegerField
      FieldName = 'numero'
      Required = True
    end
    object qryProdutosContratosquantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
    end
    object qryProdutosContratosprecovenda: TFloatField
      FieldName = 'precovenda'
      Required = True
    end
    object qryProdutosContratosprecotabela: TFloatField
      FieldName = 'precotabela'
      Required = True
    end
    object qryProdutosContratosdescricaoprecovenda: TStringField
      FieldName = 'descricaoprecovenda'
      Size = 40
    end
    object qryProdutosContratosmontagem: TStringField
      FieldName = 'montagem'
      Required = True
      Size = 1
    end
    object qryProdutosContratosentrega: TStringField
      FieldName = 'entrega'
      Required = True
      Size = 1
    end
    object qryProdutosContratosprodutolista: TBooleanField
      FieldName = 'produtolista'
      Required = True
    end
    object qryProdutosContratoscancelado: TFloatField
      FieldName = 'cancelado'
    end
    object qryProdutosContratosdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 100
    end
    object qryProdutosContratoslinha: TStringField
      FieldName = 'linha'
      Size = 50
    end
    object qryProdutosContratoscoluna: TStringField
      FieldName = 'coluna'
      Size = 50
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
    object qryProdutosContratosreserva: TFloatField
      FieldName = 'reserva'
    end
    object qryProdutosContratosbrinde: TBooleanField
      FieldName = 'brinde'
      Required = True
    end
    object qryProdutosContratosvendedor: TIntegerField
      FieldName = 'vendedor'
      Required = True
    end
    object qryProdutosContratospromocao: TBooleanField
      FieldName = 'promocao'
      Required = True
    end
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
      'select *'
      'from clientes'
      'where codigo = :clientes;')
    RequestLive = False
    Left = 304
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'clientes'
        ParamType = ptUnknown
      end>
    object qryClientescodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryClientesnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryClientesnascto: TDateField
      FieldName = 'nascto'
    end
    object qryClientesapelido: TStringField
      FieldName = 'apelido'
    end
    object qryClientessexo: TStringField
      FieldName = 'sexo'
      Size = 1
    end
    object qryClientescivil: TStringField
      FieldName = 'civil'
      Size = 1
    end
    object qryClientescivildata: TDateField
      FieldName = 'civildata'
    end
    object qryClientesiddocumento: TStringField
      FieldName = 'iddocumento'
    end
    object qryClientesidorgao: TStringField
      FieldName = 'idorgao'
      Size = 5
    end
    object qryClientesiddata: TDateField
      FieldName = 'iddata'
    end
    object qryClientesidestado: TStringField
      FieldName = 'idestado'
      Size = 2
    end
    object qryClientespessoatipo: TStringField
      FieldName = 'pessoatipo'
      Size = 1
    end
    object qryClientespessoanumero: TStringField
      FieldName = 'pessoanumero'
      Size = 14
    end
    object qryClientesmae: TStringField
      FieldName = 'mae'
      Size = 40
    end
    object qryClientespai: TStringField
      FieldName = 'pai'
      Size = 40
    end
    object qryClientesconceito: TIntegerField
      FieldName = 'conceito'
    end
    object qryClientesnaturalcidade: TIntegerField
      FieldName = 'naturalcidade'
    end
    object qryClientesnaturalestado: TStringField
      FieldName = 'naturalestado'
      Size = 2
    end
    object qryClientesrua: TStringField
      FieldName = 'rua'
      Size = 100
    end
    object qryClientesestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object qryClientescidade: TIntegerField
      FieldName = 'cidade'
    end
    object qryClientesbairro: TIntegerField
      FieldName = 'bairro'
    end
    object qryClientescep: TIntegerField
      FieldName = 'cep'
    end
    object qryClientesfonetipo: TStringField
      FieldName = 'fonetipo'
      Size = 1
    end
    object qryClientesfoneddd: TIntegerField
      FieldName = 'foneddd'
    end
    object qryClientesfonenumero: TIntegerField
      FieldName = 'fonenumero'
    end
    object qryClientesfoneramal: TStringField
      FieldName = 'foneramal'
      Size = 10
    end
    object qryClientesfone2ddd: TIntegerField
      FieldName = 'fone2ddd'
    end
    object qryClientesfone2numero: TIntegerField
      FieldName = 'fone2numero'
    end
    object qryClientesfone2ramal: TStringField
      FieldName = 'fone2ramal'
      Size = 10
    end
    object qryClientesrestipo: TStringField
      FieldName = 'restipo'
      Size = 1
    end
    object qryClientesresonus: TFloatField
      FieldName = 'resonus'
    end
    object qryClientesrestempo: TDateField
      FieldName = 'restempo'
    end
    object qryClientesempresa: TStringField
      FieldName = 'empresa'
      Size = 40
    end
    object qryClientesempadmissao: TDateField
      FieldName = 'empadmissao'
    end
    object qryClientesempcep: TIntegerField
      FieldName = 'empcep'
    end
    object qryClientesempcomprovado: TBooleanField
      FieldName = 'empcomprovado'
    end
    object qryClientesempfoneddd: TIntegerField
      FieldName = 'empfoneddd'
    end
    object qryClientesempfonenumero: TIntegerField
      FieldName = 'empfonenumero'
    end
    object qryClientesempfoneramal: TStringField
      FieldName = 'empfoneramal'
      Size = 10
    end
    object qryClientesempoutrasdescricao: TStringField
      FieldName = 'empoutrasdescricao'
      Size = 40
    end
    object qryClientesempoutrasfaixa: TIntegerField
      FieldName = 'empoutrasfaixa'
    end
    object qryClientesempoutrasvalor: TFloatField
      FieldName = 'empoutrasvalor'
    end
    object qryClientesemprendafaixa: TIntegerField
      FieldName = 'emprendafaixa'
    end
    object qryClientesemprendavalor: TFloatField
      FieldName = 'emprendavalor'
    end
    object qryClientesemprua: TStringField
      FieldName = 'emprua'
      Size = 100
    end
    object qryClientesempestado: TStringField
      FieldName = 'empestado'
      Size = 2
    end
    object qryClientesempcidade: TIntegerField
      FieldName = 'empcidade'
    end
    object qryClientesempbairro: TIntegerField
      FieldName = 'empbairro'
    end
    object qryClientesempcargo: TIntegerField
      FieldName = 'empcargo'
    end
    object qryClientesconjuge: TIntegerField
      FieldName = 'conjuge'
    end
    object qryClientesconnome: TStringField
      FieldName = 'connome'
      Size = 40
    end
    object qryClientesconadmissao: TDateField
      FieldName = 'conadmissao'
    end
    object qryClientesconcep: TIntegerField
      FieldName = 'concep'
    end
    object qryClientesconempresa: TStringField
      FieldName = 'conempresa'
      Size = 40
    end
    object qryClientesconfoneddd: TIntegerField
      FieldName = 'confoneddd'
    end
    object qryClientesconfonenumero: TIntegerField
      FieldName = 'confonenumero'
    end
    object qryClientesconfoneramal: TStringField
      FieldName = 'confoneramal'
      Size = 10
    end
    object qryClientesconnascto: TDateField
      FieldName = 'connascto'
    end
    object qryClientesconrendafaixa: TIntegerField
      FieldName = 'conrendafaixa'
    end
    object qryClientesconrendavalor: TFloatField
      FieldName = 'conrendavalor'
    end
    object qryClientesconrua: TStringField
      FieldName = 'conrua'
      Size = 100
    end
    object qryClientesconestado: TStringField
      FieldName = 'conestado'
      Size = 2
    end
    object qryClientesconcidade: TIntegerField
      FieldName = 'concidade'
    end
    object qryClientesconbairro: TIntegerField
      FieldName = 'conbairro'
    end
    object qryClientesconcargo: TIntegerField
      FieldName = 'concargo'
    end
    object qryClientesreferencia: TStringField
      FieldName = 'referencia'
      Size = 40
    end
    object qryClientesreftipo: TStringField
      FieldName = 'reftipo'
      Size = 1
    end
    object qryClientesrefrua: TStringField
      FieldName = 'refrua'
      Size = 100
    end
    object qryClientesrefestado: TStringField
      FieldName = 'refestado'
      Size = 2
    end
    object qryClientesrefcidade: TIntegerField
      FieldName = 'refcidade'
    end
    object qryClientesrefbairro: TIntegerField
      FieldName = 'refbairro'
    end
    object qryClientesrefcep: TIntegerField
      FieldName = 'refcep'
    end
    object qryClientesreffoneddd: TIntegerField
      FieldName = 'reffoneddd'
    end
    object qryClientesreffonenumero: TIntegerField
      FieldName = 'reffonenumero'
    end
    object qryClientesreffoneramal: TStringField
      FieldName = 'reffoneramal'
      Size = 10
    end
    object qryClientesreffone2ddd: TIntegerField
      FieldName = 'reffone2ddd'
    end
    object qryClientesreffone2numero: TIntegerField
      FieldName = 'reffone2numero'
    end
    object qryClientesreffone2ramal: TStringField
      FieldName = 'reffone2ramal'
      Size = 10
    end
    object qryClientesobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 512
    end
    object qryClientesemail: TStringField
      FieldName = 'email'
      Size = 128
    end
    object qryClientesautomovel: TBooleanField
      FieldName = 'automovel'
    end
    object qryClientescartaocredito: TBooleanField
      FieldName = 'cartaocredito'
    end
    object qryClientescartaoloja: TBooleanField
      FieldName = 'cartaoloja'
    end
    object qryClientescheque: TBooleanField
      FieldName = 'cheque'
    end
    object qryClienteschequeespecial: TBooleanField
      FieldName = 'chequeespecial'
    end
    object qryClientesdependentes: TIntegerField
      FieldName = 'dependentes'
    end
    object qryClientesonus: TFloatField
      FieldName = 'onus'
    end
    object qryClientesenderecoalterado: TDateField
      FieldName = 'enderecoalterado'
    end
    object qryClientesfilialcadastro: TIntegerField
      FieldName = 'filialcadastro'
    end
    object qryClientesdatacadastro: TDateField
      FieldName = 'datacadastro'
    end
    object qryClientesultimaalteracao: TDateField
      FieldName = 'ultimaalteracao'
    end
  end
end
