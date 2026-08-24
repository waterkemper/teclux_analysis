inherited dtmContratosImoveis: TdtmContratosImoveis
  Left = 463
  Top = 138
  Height = 632
  Width = 1019
  object qryContratos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeClose = qryContratosBeforeClose
    AfterScroll = qryContratosAfterScroll
    OnCalcFields = qryContratosCalcFields
    OnNewRecord = qryContratosNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT c.Contrato,'
      '       c.Data,'
      '       c.Filial,'
      '       c.Habite_se,'
      '       c.DataChaves,'
      '       c.DataAlteracao,'
      '       c.Situacao,'
      '       '
      '       CAST(CASE WHEN c.Situacao = '#39'R'#39' THEN '#39'RESERVADO'#39
      '                 WHEN c.Situacao = '#39'C'#39' THEN '#39'CANCELADO'#39
      '                 WHEN c.Situacao = '#39'V'#39' THEN '#39'VENDIDO'#39
      '                 WHEN c.Situacao = '#39'Q'#39' THEN '#39'QUITADO'#39
      
        '                 WHEN c.Situacao = '#39'G'#39' THEN '#39'RENEGOCIADO PARA N'#186 +
        ' '#39' ||'
      
        '                                             CAST((SELECT vi.Con' +
        'trato FROM VendasImoveis vi'
      
        '                                                      WHERE vi.C' +
        'ontrato_Origem = c.Contrato) AS VARCHAR)'
      
        '                 WHEN c.Situacao = '#39'D'#39' THEN '#39'RENEGOCIADO DE N'#186' '#39 +
        ' || CAST(c.Contrato_Origem AS VARCHAR)'
      '                 WHEN c.Situacao = '#39'S'#39' THEN '#39'RESCINDIDO'#39
      
        '                 WHEN c.Situacao = '#39'T'#39' THEN '#39'TRANSFERIDO PARA N'#186 +
        ' '#39' ||'
      
        '                                            CAST((SELECT vi.Cont' +
        'rato FROM VendasImoveis vi'
      
        '                                                     WHERE vi.Co' +
        'ntrato_Origem = c.Contrato) AS VARCHAR)'
      
        '                 WHEN c.Situacao = '#39'F'#39' THEN '#39'TRANSFERIDO DE N'#186' '#39 +
        ' || CAST(c.Contrato_Origem AS VARCHAR)'
      '            END AS VARCHAR(50)) AS NomeSituacao,'
      '            '
      '       c.Vendedor,'
      '       c.ValorTotal,'
      '       c.Empreendimento,'
      '       c.IndexadorAteHabiteSe,'
      '       c.IndexadorAposHabiteSe,'
      '       c.DataBase,'
      '       c.JurosCompostos,'
      '       c.Juros,'
      '       c.AtrasoMulta,'
      '       c.AtrasoJuros,'
      '       c.ContaCliente,'
      '       c.ContaLongoPrazo,'
      '       c.PISHistorico,'
      '       c.COFINSHistorico,'
      '       c.IRPJHistorico,'
      '       c.CSLLHistorico,'
      '       c.SaldoVenda,'
      '       c.SaldoCorrecao,'
      '       c.DataBaseCorrecao,'
      '       c.CustoImovel,'
      '       c.DespesaVenda,'
      '       c.Observacoes,'
      '       c.AVPTaxaDesconto,'
      '       c.nojuridico,'
      '       c.CustoImovelRescisao,'
      '       c.SaidaJuridico,'
      ''
      '      (SELECT vi.Contrato FROM VendasImoveis vi'
      
        '          WHERE vi.Contrato_Origem = c.Contrato) AS Contrato_Ger' +
        'ado,'
      ''
      '       c.Contrato_Origem,'
      '       c.SaldoCusto,'
      ''
      '      (SELECT vi.DataChaves FROM VendasImoveis vi'
      
        '          WHERE vi.Contrato = c.Contrato_Origem) AS DataChaves_C' +
        'ontrato_Origem,'
      ''
      '      (SELECT vi.Situacao FROM VendasImoveis vi'
      
        '          WHERE vi.Contrato = c.Contrato_Origem) AS Situacao_Con' +
        'trato_Origem,'
      ''
      '      (SELECT vi.Situacao FROM VendasImoveis vi'
      
        '         WHERE vi.Contrato_Origem = c.Contrato) AS Situacao_Cont' +
        'rato_Gerado,'
      ''
      '      (SELECT vi.Data FROM VendasImoveis vi'
      
        '          WHERE vi.Contrato_Origem = c.Contrato) AS Data_Contrat' +
        'o_Gerado,'
      ''
      '      (SELECT vi.DataAlteracao FROM VendasImoveis vi'
      
        '          WHERE vi.Contrato_Origem = c.Contrato) AS DataAlteraca' +
        'o_Contrato_Gerado,'
      ''
      '      COALESCE((SELECT FALSE FROM VendasImoveis vi'
      
        '                   WHERE vi.Contrato_Origem = c.Contrato), TRUE)' +
        ' AS ContratoAtual,'
      ''
      '      CAST(CAST((SELECT UPPER(vf.Nome) FROM vfornecedores vf'
      
        '                    WHERE (vf.Codigo, vf.Tipo) IN (SELECT cp.Cli' +
        'ente, cp.TipoCliente FROM Compradores cp'
      
        '                                                      WHERE cp.C' +
        'ontrato = c.Contrato AND'
      
        '                                                            COAL' +
        'ESCE(cp.Principal, FALSE))) AS VARCHAR)'
      
        '                                               || COALESCE((SELE' +
        'CT CAST('#39' & OUTROS'#39' AS VARCHAR(9))'
      
        '                                                               W' +
        'HERE COALESCE((SELECT TRUE FROM Compradores cp'
      
        '                                                                ' +
        '                  WHERE cp.Contrato = c.Contrato AND'
      
        '                                                                ' +
        '                        NOT COALESCE(cp.Principal, FALSE) LIMIT ' +
        '1), FALSE)), '#39#39') AS VARCHAR(69))'
      '                    AS CompradorPrincipal'
      ''
      ''
      'FROM vendasimoveis c'
      'WHERE c.Contrato  = :Contrato'
      '')
    RequestLive = True
    Left = 56
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'Contrato'
        ParamType = ptUnknown
      end>
    object qryContratoscontrato: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'contrato'
      DisplayFormat = '0'
    end
    object qryContratosdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryContratossituacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
    object qryContratosnomesituacao: TStringField
      FieldName = 'nomesituacao'
      Size = 50
    end
    object qryContratosvendedor: TIntegerField
      FieldName = 'vendedor'
      Required = True
      DisplayFormat = '0'
    end
    object qryContratosvalortotal: TFloatField
      FieldName = 'valortotal'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryContratosobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 512
    end
    object qryContratosdatabase: TDateField
      Alignment = taCenter
      FieldName = 'database'
      EditMask = '99/99/9999;1; '
    end
    object qryContratosjuros: TFloatField
      FieldName = 'juros'
      DisplayFormat = '0.00'
    end
    object qryContratosatrasomulta: TFloatField
      FieldName = 'atrasomulta'
      DisplayFormat = '0.00'
    end
    object qryContratosatrasojuros: TFloatField
      FieldName = 'atrasojuros'
      DisplayFormat = '0.00'
    end
    object qryContratosindexadoratehabitese: TStringField
      FieldName = 'indexadoratehabitese'
      Size = 10
    end
    object qryContratosindexadoraposhabitese: TStringField
      FieldName = 'indexadoraposhabitese'
      Size = 10
    end
    object qryContratosContaCliente: TIntegerField
      FieldName = 'ContaCliente'
      DisplayFormat = '0'
    end
    object qryContratosContaLongoPrazo: TIntegerField
      DisplayLabel = 'Conta cont'#225'bil longo prazo'
      FieldName = 'ContaLongoPrazo'
      Required = True
      DisplayFormat = '0'
    end
    object qryContratosjuroscompostos: TBooleanField
      FieldName = 'juroscompostos'
    end
    object qryContratoshabite_se: TDateField
      Alignment = taCenter
      FieldName = 'habite_se'
      EditMask = '99/99/9999;1; '
    end
    object qryContratosdatachaves: TDateField
      Alignment = taCenter
      FieldName = 'datachaves'
      EditMask = '99/99/9999;1; '
    end
    object qryContratospishistorico: TFloatField
      FieldName = 'pishistorico'
      DisplayFormat = '0.00'
    end
    object qryContratoscofinshistorico: TFloatField
      FieldName = 'cofinshistorico'
      DisplayFormat = '0.00'
    end
    object qryContratosirpjhistorico: TFloatField
      FieldName = 'irpjhistorico'
      DisplayFormat = '0.00'
    end
    object qryContratoscsllhistorico: TFloatField
      FieldName = 'csllhistorico'
      DisplayFormat = '0.00'
    end
    object qryContratossaldovenda: TFloatField
      FieldName = 'saldovenda'
      DisplayFormat = '0.00'
    end
    object qryContratossaldocorrecao: TFloatField
      FieldName = 'saldocorrecao'
      DisplayFormat = '0.00'
    end
    object qryContratosdatabasecorrecao: TDateField
      Alignment = taCenter
      FieldName = 'databasecorrecao'
      EditMask = '99/99/9999;1; '
    end
    object qryContratoscustoimovel: TFloatField
      FieldName = 'custoimovel'
      DisplayFormat = '0.00'
    end
    object qryContratosdespesavenda: TFloatField
      FieldName = 'despesavenda'
      DisplayFormat = '0.00'
    end
    object qryContratosdataalteracao: TDateField
      Alignment = taCenter
      FieldName = 'dataalteracao'
      EditMask = '99/99/9999;1; '
    end
    object qryContratoscontrato_gerado: TIntegerField
      FieldName = 'contrato_gerado'
      DisplayFormat = '0'
    end
    object qryContratoscontrato_origem: TIntegerField
      FieldName = 'contrato_origem'
      DisplayFormat = '0'
    end
    object qryContratossaldocusto: TFloatField
      FieldName = 'saldocusto'
      DisplayFormat = '0.00'
    end
    object qryContratosempreendimento: TIntegerField
      FieldName = 'empreendimento'
      DisplayFormat = '0'
    end
    object qryContratosfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryContratosdatachaves_contrato_origem: TDateField
      Alignment = taCenter
      FieldName = 'datachaves_contrato_origem'
      EditMask = '99/99/9999;1; '
    end
    object qryContratossituacao_contrato_origem: TStringField
      FieldName = 'situacao_contrato_origem'
      Size = 50
    end
    object qryContratoscontratoatual: TBooleanField
      FieldName = 'contratoatual'
    end
    object qryContratossituacao_contrato_gerado: TStringField
      FieldName = 'situacao_contrato_gerado'
      Size = 50
    end
    object qryContratosdata_contrato_gerado: TDateField
      Alignment = taCenter
      FieldName = 'data_contrato_gerado'
      EditMask = '99/99/9999;1; '
    end
    object qryContratosdataalteracao_contrato_gerado: TDateField
      Alignment = taCenter
      FieldName = 'dataalteracao_contrato_gerado'
      EditMask = '99/99/9999;1; '
    end
    object qryContratoscompradorprincipal: TStringField
      FieldName = 'compradorprincipal'
      Size = 69
    end
    object qryContratosAVPTaxaDesconto: TFloatField
      FieldName = 'AVPTaxaDesconto'
      DisplayFormat = '0.00'
    end
    object qryContratosnojuridico: TBooleanField
      FieldName = 'nojuridico'
    end
    object qryContratosNoJuridicoDescricao: TStringField
      FieldKind = fkCalculated
      FieldName = 'NoJuridicoDescricao'
      Size = 15
      Calculated = True
    end
    object qryContratoscustoimovelrescisao: TFloatField
      FieldName = 'custoimovelrescisao'
    end
    object qryContratosSaidaJuridico: TDateField
      FieldName = 'SaidaJuridico'
    end
  end
  object dsrContratos: TtecDataSource
    DataSet = qryContratos
    OnDataChange = dsrContratosDataChange
    Left = 96
    Top = 24
  end
  object qryProcuraVendedor: TtecQuery
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
      'select u.codigo,'
      '          u.nome'
      'from usuarios u'
      'where (u.codigo = :codigo) and'
      '           (u.inativo is null) and'
      '           ((u.venda) or'
      '           (0 < (select Count(*)'
      '                   from gruposusuarios gu'
      '                   where (gu.codigo = u.grupo) and'
      '                               gu.vendedor)))')
    RequestLive = False
    Left = 224
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraVendedorcodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
    object qryProcuraVendedornome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 40
    end
  end
  object dsrProcuraVendedor: TtecDataSource
    DataSet = qryProcuraVendedor
    Left = 248
    Top = 56
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
      'select u.nome,'
      '          u.codigo'
      'from usuarios u'
      'where (u.venda or'
      '           (select gu.vendedor'
      '            from gruposusuarios gu'
      '            where gu.codigo = u.grupo)) and'
      '           u.inativo is null'
      'order by UPPER(TO_ASCII(u.nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 200
    Top = 8
    object qryConsultaVendedoresnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaVendedorescodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
  object qryCompradores: TtecQuery
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
      'Select c.contrato,'
      '       c.cliente,'
      
        '       (select v.tipo from vfornecedores v where v.codigo = c.cl' +
        'iente and'
      
        '                                                 v.tipo = c.tipo' +
        'cliente) as tipoCliente,'
      
        '       (select coalesce(v.razao,v.nome)  from vfornecedores v wh' +
        'ere c.cliente = v.codigo and'
      
        '                                                c.tipocliente = ' +
        'v.tipo) as NomeCliente,'
      '       c.percentual,'
      '       c.representante,'
      '       c.fiador,'
      '       c.principal,'
      '       c.observacoes,'
      
        '       cast(c.representante||'#39' - '#39'||(select coalesce(v.razao,v.n' +
        'ome)  from vfornecedores v where c.representante = v.codigo'
      
        '                                                 and c.tiporepre' +
        'sentante = v.tipo) as varchar) as NomeRepresentante,'
      
        '       (select coalesce(v.razao,v.nome)  from vfornecedores v wh' +
        'ere v.codigo = c.representante and'
      
        '                                                 v.tipo = c.tipo' +
        'representante) as TipoRepresentante,'
      '       '
      
        '       cast(c.fiador||'#39' - '#39'||(select coalesce(v.razao,v.nome)  f' +
        'rom vfornecedores v where c.fiador = v.codigo'
      
        '                                          and c.tipofiador = v.t' +
        'ipo) as varchar) as NomeFiador,'
      
        '       (select v.nome from vfornecedores v where v.codigo = c.fi' +
        'ador and'
      
        '                                                 v.tipo = c.tipo' +
        'fiador) as TipoFiador       '
      'from compradores c'
      'where c.contrato =:Contrato'
      'order by c.principal DESC')
    RequestLive = True
    Left = 56
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptUnknown
      end>
    object qryCompradorescontrato: TIntegerField
      FieldName = 'contrato'
      DisplayFormat = '0'
    end
    object qryCompradorescliente: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object qryCompradoresnomecliente: TStringField
      FieldName = 'nomecliente'
      Size = 50
    end
    object qryCompradorespercentual: TFloatField
      FieldName = 'percentual'
      DisplayFormat = '##0.0000'
    end
    object qryCompradoresrepresentante: TIntegerField
      FieldName = 'representante'
      DisplayFormat = '0'
    end
    object qryCompradoresnomerepresentante: TStringField
      FieldName = 'nomerepresentante'
      Size = 50
    end
    object qryCompradoresfiador: TIntegerField
      FieldName = 'fiador'
      DisplayFormat = '0'
    end
    object qryCompradoresnomefiador: TStringField
      FieldName = 'nomefiador'
      Size = 50
    end
    object qryCompradoresobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 200
    end
    object qryCompradorestipocliente: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
    object qryCompradorestiporepresentante: TStringField
      FieldName = 'tiporepresentante'
      Size = 1
    end
    object qryCompradorestipofiador: TStringField
      FieldName = 'tipofiador'
      Size = 1
    end
    object qryCompradoresprincipal: TBooleanField
      FieldName = 'principal'
      Required = True
    end
  end
  object dsrCompradores: TtecDataSource
    DataSet = qryCompradores
    OnDataChange = dsrCompradoresDataChange
    Left = 80
    Top = 104
  end
  object qryImoveisVendidos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryImoveisVendidosAfterOpen
    AfterInsert = qryImoveisVendidosAfterInsert
    AfterPost = qryImoveisVendidosAfterPost
    BeforeDelete = qryImoveisVendidosBeforeDelete
    AfterDelete = qryImoveisVendidosAfterDelete
    OnCalcFields = qryImoveisVendidosCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT iv.Ordem,'
      '       iv.Contrato,'
      '       e.Codigo as CodigoEmpreendimento,'
      '       e.Nome as Empreendimento,'
      '       iv.Bloco,'
      '       cast(null as integer) as BlocoAnterior,'
      '       b.Descricao as NomeBloco,'
      '       iv.Numero,'
      '       cast(null as varchar(10)) as NumeroAnterior,'
      '       iv.unidade,'
      '       cast(null as integer) as unidadeanterior,'
      '       tu.Nome as TipoUnidade,'
      '       i.Pavimento,'
      '       i.Situacao,'
      '       i.AreaPrivativa,'
      '       i.AreaComum,'
      '       i.FracaoIdeal,'
      '       i.Preco,'
      '       iv.PrecoVenda,'
      '       iv.Observacoes,'
      '       e.*'
      ''
      'FROM imoveisvendidos iv JOIN (imoveis i JOIN tiposunidades tu'
      
        '                                             ON i.Unidade = tu.C' +
        'odigo)'
      
        '                        ON iv.Bloco = i.Bloco AND iv.Numero = i.' +
        'Numero and iv.unidade = i.unidade'
      '                        JOIN (Blocos b JOIN Empreendimentos e'
      
        '                                   ON b.Empreendimento = e.Codig' +
        'o) ON iv.Bloco = b.Codigo'
      ''
      'WHERE iv.Contrato = :Contrato'
      'ORDER BY iv.Ordem'
      ''
      '')
    RequestLive = True
    Left = 56
    Top = 152
    ParamData = <
      item
        DataType = ftString
        Name = 'Contrato'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryImoveisVendidoscontrato: TIntegerField
      FieldName = 'contrato'
      DisplayFormat = '0'
    end
    object qryImoveisVendidoscodigoempreendimento: TIntegerField
      DisplayLabel = 'C'#243'digo do empreendimento'
      FieldName = 'codigoempreendimento'
      Required = True
      DisplayFormat = '0'
    end
    object qryImoveisVendidosempreendimento: TStringField
      FieldName = 'empreendimento'
      Size = 60
    end
    object qryImoveisVendidosbloco: TIntegerField
      FieldName = 'bloco'
      Required = True
      DisplayFormat = '0'
    end
    object qryImoveisVendidosnomebloco: TStringField
      FieldName = 'nomebloco'
      Size = 40
    end
    object qryImoveisVendidosnumero: TStringField
      DisplayLabel = 'n'#250'mero'
      FieldName = 'numero'
      Required = True
      Size = 10
    end
    object qryImoveisVendidosunidade: TIntegerField
      FieldName = 'unidade'
      Required = True
      DisplayFormat = '0'
    end
    object qryImoveisVendidostipounidade: TStringField
      FieldName = 'tipounidade'
      Size = 15
    end
    object qryImoveisVendidospavimento: TStringField
      FieldName = 'pavimento'
    end
    object qryImoveisVendidossituacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
    object qryImoveisVendidosareaprivativa: TFloatField
      FieldName = 'areaprivativa'
      DisplayFormat = '#,##0.0000'
    end
    object qryImoveisVendidosareacomum: TFloatField
      FieldName = 'areacomum'
      DisplayFormat = '#,##0.0000'
    end
    object qryImoveisVendidosareatotal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'areatotal'
      DisplayFormat = '#,##0.0000'
      Calculated = True
    end
    object qryImoveisVendidosfracaoideal: TFloatField
      FieldName = 'fracaoideal'
      DisplayFormat = '##0.00000000'
    end
    object qryImoveisVendidospreco: TFloatField
      FieldName = 'preco'
      DisplayFormat = '0.00'
    end
    object qryImoveisVendidosprecovenda: TFloatField
      FieldName = 'precovenda'
      DisplayFormat = '###,###,##0.00'
    end
    object qryImoveisVendidosobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 200
    end
    object qryImoveisVendidoscodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryImoveisVendidosnome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object qryImoveisVendidosdatahabitese: TDateField
      Alignment = taCenter
      FieldName = 'datahabitese'
    end
    object qryImoveisVendidossigla: TStringField
      FieldName = 'sigla'
      Size = 10
    end
    object qryImoveisVendidosrua: TStringField
      FieldName = 'rua'
      Size = 100
    end
    object qryImoveisVendidoscomplemento: TStringField
      FieldName = 'complemento'
      Size = 100
    end
    object qryImoveisVendidosestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object qryImoveisVendidoscidade: TIntegerField
      FieldName = 'cidade'
      DisplayFormat = '0'
    end
    object qryImoveisVendidosbairro: TIntegerField
      FieldName = 'bairro'
      DisplayFormat = '0'
    end
    object qryImoveisVendidoscep: TIntegerField
      FieldName = 'cep'
      DisplayFormat = '0'
    end
    object qryImoveisVendidoscontavenda: TIntegerField
      FieldName = 'contavenda'
      DisplayFormat = '0'
    end
    object qryImoveisVendidoscontacofins: TIntegerField
      FieldName = 'contacofins'
      DisplayFormat = '0'
    end
    object qryImoveisVendidoscontacsll: TIntegerField
      FieldName = 'contacsll'
      DisplayFormat = '0'
    end
    object qryImoveisVendidoscontairpj: TIntegerField
      FieldName = 'contairpj'
      DisplayFormat = '0'
    end
    object qryImoveisVendidoscontapis: TIntegerField
      FieldName = 'contapis'
      DisplayFormat = '0'
    end
    object qryImoveisVendidosdebitocustos: TIntegerField
      FieldName = 'debitocustos'
      DisplayFormat = '0'
    end
    object qryImoveisVendidoscreditocustos: TIntegerField
      FieldName = 'creditocustos'
      DisplayFormat = '0'
    end
    object qryImoveisVendidoscreditovendachaves: TIntegerField
      FieldName = 'creditovendachaves'
      DisplayFormat = '0'
    end
    object qryImoveisVendidosdebitocustochaves: TIntegerField
      FieldName = 'debitocustochaves'
      DisplayFormat = '0'
    end
    object qryImoveisVendidoscreditoatualizacaomonetaria: TIntegerField
      FieldName = 'creditoatualizacaomonetaria'
      DisplayFormat = '0'
    end
    object qryImoveisVendidosdebitodescontorecebimento: TIntegerField
      FieldName = 'debitodescontorecebimento'
      DisplayFormat = '0'
    end
    object qryImoveisVendidosareaterreno: TFloatField
      FieldName = 'areaterreno'
      DisplayFormat = '0.00'
    end
    object qryImoveisVendidosdebitodescontoconcedidos: TIntegerField
      FieldName = 'debitodescontoconcedidos'
      DisplayFormat = '0'
    end
    object qryImoveisVendidoscreditodespesasvenda: TIntegerField
      FieldName = 'creditodespesasvenda'
      DisplayFormat = '0'
    end
    object qryImoveisVendidosblocoanterior: TIntegerField
      FieldName = 'blocoanterior'
      DisplayFormat = '0'
    end
    object qryImoveisVendidosnumeroanterior: TStringField
      FieldName = 'numeroanterior'
      Size = 10
    end
    object qryImoveisVendidosunidadeanterior: TIntegerField
      FieldName = 'unidadeanterior'
      DisplayFormat = '0'
    end
    object qryImoveisVendidosordem: TIntegerField
      FieldName = 'ordem'
      DisplayFormat = '0'
    end
    object qryImoveisVendidosAVPTaxaDesconto: TFloatField
      DisplayLabel = 'AVPTaxaDesconto'
      FieldName = 'avptaxadesconto'
      DisplayFormat = '0.00'
    end
    object qryImoveisVendidosunid_imob: TStringField
      FieldName = 'unid_imob'
      Size = 2
    end
    object qryImoveisVendidosind_nat_emp: TStringField
      FieldName = 'ind_nat_emp'
      Size = 1
    end
    object qryImoveisVendidosavpcurtoprazo: TIntegerField
      FieldName = 'avpcurtoprazo'
      DisplayFormat = '0'
    end
    object qryImoveisVendidosavplongoprazo: TIntegerField
      FieldName = 'avplongoprazo'
      DisplayFormat = '0'
    end
  end
  object dsrImoveisVendidos: TtecDataSource
    DataSet = qryImoveisVendidos
    Left = 80
    Top = 176
  end
  object qryBloquearContrato: TtecQuery
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
      'select contrato,'
      '       user_write_lock_oid(oid) as lock'
      'from vendasimoveis'
      'where contrato = :Contrato')
    RequestLive = False
    Left = 368
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptUnknown
      end>
    object qryBloquearContratocontrato: TStringField
      FieldName = 'contrato'
    end
    object qryBloquearContratolock: TIntegerField
      FieldName = 'lock'
    end
  end
  object qryDesbloquearContrato: TtecQuery
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
      'select user_write_unlock_oid(oid) as lock'
      'from vendasimoveis'
      'Where Contrato = :Contrato')
    RequestLive = False
    Left = 368
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'Contrato'
        ParamType = ptUnknown
      end>
    object qryDesbloquearContratolock: TIntegerField
      FieldName = 'lock'
    end
  end
  object qryConsultaBlocos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeOpen = qryConsultaBlocosBeforeOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'WhereSituacao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'Select b.codigo,'
      '       b.empreendimento,'
      '       b.descricao'
      'from blocos b'
      'where b.empreendimento = :Empreendimento'
      '  and exists (select i.numero'
      '              from imoveis i'
      '              where i.bloco = b.codigo'
      ''
      '                %WhereSituacao'
      ''
      '                limit 1'
      '                   )'
      '')
    RequestLive = False
    Left = 200
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Empreendimento'
        ParamType = ptUnknown
      end>
    object qryConsultaBlocoscodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryConsultaBlocosempreendimento: TIntegerField
      FieldName = 'empreendimento'
    end
    object qryConsultaBlocosdescricao: TStringField
      FieldName = 'descricao'
      Size = 35
    end
  end
  object qryConsultaImoveis: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeOpen = qryConsultaImoveisBeforeOpen
    AfterOpen = qryConsultaImoveisAfterOpen
    OnCalcFields = qryConsultaImoveisCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'WhereSituacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WhereUnidades'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WhereImoveis'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'JaCadastrado'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'Select e.nome as empreendimento,'
      '       e.codigo as emp,'
      '       e.datahabitese,'
      '       b.codigo as bloco,'
      '       b.descricao as Nomebloco,'
      '       i.numero as Imovel,'
      '       e.rua,'
      '       e.numero as casanumero,'
      '       e.complemento,'
      '       e.bairro,'
      '       e.cidade,'
      '       e.estado,'
      '       e.cep,'
      '       i.unidade,'
      
        '       (select tu.nome from tiposunidades tu where i.unidade = t' +
        'u.codigo) as TipoUnidade,'
      '       e.observacoes,'
      '       i.pavimento,'
      '       i.situacao,'
      '       i.areaprivativa,'
      '       i.areacomum,'
      '       i.fracaoideal,'
      '       i.preco'
      
        'from imoveis i join (blocos b join empreendimentos e on b.empree' +
        'ndimento = e.codigo)on i.bloco = b.codigo'
      'where i.bloco  = :Bloco'
      ''
      '%WhereSituacao'
      '%WhereUnidades'
      '%WhereImoveis'
      '%JaCadastrado')
    RequestLive = False
    Left = 200
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Bloco'
        ParamType = ptUnknown
      end>
    object qryConsultaImoveisemp: TIntegerField
      FieldName = 'emp'
      DisplayFormat = '0'
    end
    object qryConsultaImoveisempreendimento: TStringField
      FieldName = 'empreendimento'
      Size = 60
    end
    object qryConsultaImoveisbloco: TIntegerField
      FieldName = 'bloco'
      DisplayFormat = '0'
    end
    object qryConsultaImoveisnomebloco: TStringField
      FieldName = 'nomebloco'
      Size = 40
    end
    object qryConsultaImoveisimovel: TStringField
      DisplayWidth = 10
      FieldName = 'imovel'
      Size = 10
    end
    object qryConsultaImoveisrua: TStringField
      FieldName = 'rua'
      Size = 100
    end
    object qryConsultaImoveiscasanumero: TIntegerField
      FieldName = 'casanumero'
      DisplayFormat = '0'
    end
    object qryConsultaImoveiscomplemento: TStringField
      FieldName = 'complemento'
      Size = 100
    end
    object qryConsultaImoveisbairro: TIntegerField
      FieldName = 'bairro'
      DisplayFormat = '0'
    end
    object qryConsultaImoveiscidade: TIntegerField
      FieldName = 'cidade'
      DisplayFormat = '0'
    end
    object qryConsultaImoveisestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object qryConsultaImoveiscep: TIntegerField
      FieldName = 'cep'
      DisplayFormat = '0'
    end
    object qryConsultaImoveisunidade: TIntegerField
      FieldName = 'unidade'
      DisplayFormat = '0'
    end
    object qryConsultaImoveistipounidade: TStringField
      FieldName = 'tipounidade'
      Size = 50
    end
    object qryConsultaImoveisobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 512
    end
    object qryConsultaImoveispavimento: TStringField
      FieldName = 'pavimento'
      Size = 10
    end
    object qryConsultaImoveissituacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
    object qryConsultaImoveisareaprivativa: TFloatField
      FieldName = 'areaprivativa'
      DisplayFormat = '0.00'
    end
    object qryConsultaImoveisareacomum: TFloatField
      FieldName = 'areacomum'
      DisplayFormat = '0.00'
    end
    object qryConsultaImoveisAreaTotal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'AreaTotal'
      DisplayFormat = '###,##0.0000'
      Calculated = True
    end
    object qryConsultaImoveisfracaoideal: TFloatField
      DisplayWidth = 12
      FieldName = 'fracaoideal'
      DisplayFormat = '##0.00000000'
    end
    object qryConsultaImoveispreco: TFloatField
      DisplayLabel = 'Pre'#231'o'
      DisplayWidth = 13
      FieldName = 'preco'
      DisplayFormat = '###,###,##0.00'
      currency = True
      Precision = 2
    end
    object qryConsultaImoveisdatahabitese: TDateField
      Alignment = taCenter
      FieldName = 'datahabitese'
    end
  end
  object dsrConsultaBlocos: TtecDataSource
    DataSet = qryConsultaBlocos
    Left = 224
    Top = 128
  end
  object dsrConsultaImoveis: TtecDataSource
    DataSet = qryConsultaImoveis
    Left = 224
    Top = 200
  end
  object qryEnderecoempreendimento: TtecQuery
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
      'Select em.rua,'
      '       em.numero,'
      '       em.complemento,'
      '       em.CEP,'
      '       em.estado,'
      '       (Select cd.nome From cidades cd'
      
        '                       Where (cd.estado = em.estado) and (cd.cod' +
        'igo = em.cidade)) as nomecidadecliente,'
      '       (Select ba.nome From bairros ba'
      
        '                       Where (ba.estado = em.estado) and (ba.cid' +
        'ade = em.cidade) and (ba.codigo = em.bairro)) as nomebairroclien' +
        'te'
      'from empreendimentos em'
      'where em.codigo = :Numero')
    RequestLive = False
    Left = 56
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Numero'
        ParamType = ptUnknown
      end>
    object qryEnderecoempreendimentorua: TStringField
      FieldName = 'rua'
      Size = 100
    end
    object qryEnderecoempreendimentonumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryEnderecoempreendimentocomplemento: TStringField
      FieldName = 'complemento'
      Size = 15
    end
    object qryEnderecoempreendimentocep: TIntegerField
      FieldName = 'cep'
      DisplayFormat = '0'
    end
    object qryEnderecoempreendimentoestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object qryEnderecoempreendimentonomecidadecliente: TStringField
      FieldName = 'nomecidadecliente'
      Size = 50
    end
    object qryEnderecoempreendimentonomebairrocliente: TStringField
      FieldName = 'nomebairrocliente'
      Size = 50
    end
  end
  object dsrEnderecoempreendimento: TtecDataSource
    DataSet = qryEnderecoempreendimento
    Left = 80
    Top = 248
  end
  object qryConsultarImoveis: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeOpen = qryConsultarImoveisBeforeOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'WhereSituacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WhereUnidades'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WhereImoveis'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'JaCadastrado'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'SELECT e.Sigla,'
      '       e.Codigo    as Emp,'
      '       e.Nome      AS Empreendimento,'
      '       b.Descricao AS NomeBloco,'
      '       tu.Nome     AS Tipo,'
      '       i.Numero,'
      '       i.Bloco,'
      '       i.unidade,'
      '       i.Pavimento,'
      '       i.Preco'
      ''
      'FROM Imoveis i JOIN Blocos b'
      '                    JOIN Empreendimentos e'
      '                    ON b.Empreendimento = e.Codigo'
      '               ON i.Bloco = b.Codigo'
      '               JOIN TiposUnidades tu'
      '               ON i.Unidade = tu.Codigo'
      ''
      'Where True'
      ''
      '%WhereSituacao'
      '%WhereUnidades'
      '%WhereImoveis'
      '%JaCadastrado'
      ''
      'ORDER BY UPPER(TO_ASCII(e.Sigla,    '#39'LATIN1'#39')),'
      '         UPPER(TO_ASCII(e.Nome,     '#39'LATIN1'#39')),'
      '         UPPER(TO_ASCII(b.Descricao,'#39'LATIN1'#39')),'
      '         UPPER(TO_ASCII(tu.Nome,    '#39'LATIN1'#39')),'
      '         UPPER(TO_ASCII(i.Numero,   '#39'LATIN1'#39'))')
    RequestLive = False
    Left = 368
    Top = 120
    object qryConsultarImoveissigla: TStringField
      DisplayLabel = 'Sigla'
      FieldName = 'sigla'
      Size = 10
    end
    object qryConsultarImoveisempreendimento: TStringField
      DisplayLabel = 'Nome do Empreendimento'
      DisplayWidth = 30
      FieldName = 'empreendimento'
      Size = 55
    end
    object qryConsultarImoveisnomebloco: TStringField
      DisplayLabel = 'Bloco'
      DisplayWidth = 10
      FieldName = 'nomebloco'
    end
    object qryConsultarImoveistipo: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 10
      FieldName = 'tipo'
    end
    object qryConsultarImoveisnumero: TStringField
      DisplayLabel = 'N'#250'mero'
      DisplayWidth = 10
      FieldName = 'numero'
      Size = 10
    end
    object qryConsultarImoveisbloco: TIntegerField
      DisplayLabel = 'Bloco'
      FieldName = 'bloco'
      Visible = False
      DisplayFormat = '0'
    end
    object qryConsultarImoveispavimento: TStringField
      DisplayLabel = 'Pavimento'
      FieldName = 'pavimento'
      Size = 10
    end
    object qryConsultarImoveisemp: TIntegerField
      FieldName = 'emp'
      Visible = False
      DisplayFormat = '0'
    end
    object qryConsultarImoveispreco: TFloatField
      DisplayLabel = 'Pre'#231'o'
      DisplayWidth = 13
      FieldName = 'preco'
      DisplayFormat = '###,###,##0.0'
      currency = True
      Precision = 2
    end
    object qryConsultarImoveisunidade: TIntegerField
      FieldName = 'unidade'
    end
  end
  object qryParcelasContrato: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterClose = qryParcelasContratoAfterClose
    AfterPost = qryParcelasContratoAfterPost
    OnCalcFields = qryParcelasContratoCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT pi.Contrato,'
      '       pi.Tipo,'
      '       pi.Origem,'
      '       pi.Numero,'
      '       pi.NrPagto,'
      '       pi.DataVencto,'
      '       pi.ValorHistorico,'
      '       pi.ValorContratado,'
      ''
      
        '      (SELECT ValorDevido(pi.Contrato, pi.Tipo, pi.Numero, pi.Nr' +
        'Pagto,'
      '                         (CASE WHEN pi.Datapagto IS NULL'
      '                               THEN CURRENT_DATE'
      '                               ELSE pi.Datapagto '
      '                          END))) AS ValorDevido,'
      ''
      
        '      (SELECT ValorCorrigido(pi.Contrato, pi.Tipo, pi.Numero, pi' +
        '.NrPagto,'
      '                            (CASE WHEN pi.Datapagto IS NULL'
      '                                  THEN CURRENT_DATE'
      '                                  ELSE pi.Datapagto '
      '                             END), TRUE)) AS ValorCorrigido,'
      ''
      '       pi.Datapagto,'
      '      (CASE WHEN pi.Datapagto IS NULL'
      '            THEN NULL'
      '            ELSE pi.ValorPagto'
      '       END) AS ValorPagto,'
      '  '
      
        '      (SELECT JurosContratuais(pi.Contrato, pi.Tipo, pi.Numero, ' +
        'pi.NrPagto,'
      '                              (CASE WHEN pi.Datapagto IS NULL'
      '                                    THEN CURRENT_DATE'
      '                                    ELSE pi.Datapagto '
      '                               END))) AS Juros,'
      '       pi.Moeda,'
      '      (SELECT m.Descricao'
      
        '          FROM Moedas m WHERE pi.moeda = m.Codigo) AS DescricaoM' +
        'oeda,'
      ''
      '       pi.Database,'
      '       pi.TaxaJuros,'
      '       pi.Juroscompostos,'
      ''
      
        '     ((SELECT ValorCorrigido(pi.Contrato, pi.Tipo, pi.Numero, pi' +
        '.NrPagto,'
      '                            (CASE WHEN pi.Datapagto IS NULL'
      '                                  THEN CURRENT_DATE'
      '                                  ELSE pi.Datapagto '
      
        '                             END), TRUE)) - pi.ValorHistorico) A' +
        'S Correcao,'
      ''
      '      (CASE WHEN pi.DataPagto IS NULL'
      '            THEN NULL'
      
        '            ELSE CASE WHEN (pi.Valorpagto - (SELECT ValorDevido(' +
        'pi.Contrato, pi.Tipo, '
      
        '                                                                ' +
        'pi.Numero,pi.NrPagto,'
      
        '                                                                ' +
        'pi.Datapagto))) = 0'
      '                      THEN NULL'
      
        '                      ELSE (pi.Valorpagto - (SELECT ValorDevido(' +
        'pi.Contrato, pi.Tipo,'
      
        '                                                                ' +
        'pi.Numero,   pi.NrPagto,'
      
        '                                                                ' +
        'pi.Datapagto)))'
      '                 END'
      '       END) AS Diferenca,'
      ''
      '       pi.Promissoria,'
      '       pi.Documento,'
      '       pi.Observacoes,'
      '       pi.ReciboPagto,'
      '       pi.NumeroOrigem,'
      '       pi.TipoPagto,'
      '       '
      '       pi.ValorContratadoAteHabiteSe,'
      '       pi.MoedaAteHabiteSe,'
      '       pi.TaxaJurosAteHabiteSe,'
      '       pi.DataBaseAteHabiteSe,'
      '       pi.TipoJurosAteHabiteSe,'
      '       pi.AVPValor,'
      ''
      '       CAST(CASE WHEN pi.AVPPrazo = '#39'LONGO'#39' THEN '#39'L'#39
      '                 WHEN pi.AVPPrazo = '#39'CURTO'#39' THEN '#39'C'#39
      '                                            ELSE '#39' '#39
      '            END AS CHAR(1)) AS PrazoAVP'
      ''
      'FROM parcelasimoveis pi'
      ''
      'WHERE pi.Contrato = :Contrato'
      'ORDER BY pi.Tipo, pi.Numero, pi.NrPagto'
      '')
    RequestLive = True
    Left = 368
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'Contrato'
        ParamType = ptUnknown
      end>
    object qryParcelasContratocontrato: TIntegerField
      FieldName = 'contrato'
      DisplayFormat = '0'
    end
    object qryParcelasContratotipo: TStringField
      FieldName = 'tipo'
      Size = 1
    end
    object qryParcelasContratoorigem: TStringField
      FieldName = 'origem'
      Size = 8
    end
    object qryParcelasContratonumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryParcelasContratodatavencto: TDateField
      Alignment = taCenter
      FieldName = 'datavencto'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasContratovalorhistorico: TFloatField
      FieldName = 'valorhistorico'
      DisplayFormat = '###,###,##0.00'
    end
    object qryParcelasContratovalorcontratado: TFloatField
      FieldName = 'valorcontratado'
      DisplayFormat = '###,###,##0.00'
    end
    object qryParcelasContratovalordevido: TFloatField
      FieldName = 'valordevido'
      DisplayFormat = '###,###,##0.00'
    end
    object qryParcelasContratovalorcorrigido: TFloatField
      FieldName = 'valorcorrigido'
      DisplayFormat = '###,###,##0.00'
    end
    object qryParcelasContratodatapagto: TDateField
      Alignment = taCenter
      FieldName = 'datapagto'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasContratovalorpagto: TFloatField
      FieldName = 'valorpagto'
      DisplayFormat = '###,###,##0.00'
    end
    object qryParcelasContratojuros: TFloatField
      FieldName = 'juros'
      DisplayFormat = '0.00'
    end
    object qryParcelasContratomoeda: TStringField
      FieldName = 'moeda'
      Size = 10
    end
    object qryParcelasContratodatabase: TDateField
      Alignment = taCenter
      FieldName = 'database'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasContratotaxajuros: TFloatField
      FieldName = 'taxajuros'
      DisplayFormat = '0.00'
    end
    object qryParcelasContratojuroscompostos: TBooleanField
      FieldName = 'juroscompostos'
    end
    object qryParcelasContratocorrecao: TFloatField
      FieldName = 'correcao'
      DisplayFormat = '###,###,##0.00'
    end
    object qryParcelasContratodiferenca: TFloatField
      FieldName = 'diferenca'
      DisplayFormat = '###,###,##0.00'
    end
    object qryParcelasContratopromissoria: TBooleanField
      FieldName = 'promissoria'
    end
    object qryParcelasContratodocumento: TStringField
      FieldName = 'documento'
      Size = 12
    end
    object qryParcelasContratonrpagto: TIntegerField
      FieldName = 'nrpagto'
      DisplayFormat = '0'
    end
    object qryParcelasContratoobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 200
    end
    object qryParcelasContratojuros2: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'juros2'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryParcelasContratocorrecao2: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'correcao2'
      DisplayFormat = '###,###,##0.00'
      Calculated = True
    end
    object qryParcelasContratodescricaomoeda: TStringField
      FieldName = 'descricaomoeda'
      Size = 50
    end
    object qryParcelasContratotipopagto: TStringField
      FieldName = 'tipopagto'
      Size = 1
    end
    object qryParcelasContratorecibopagto: TIntegerField
      FieldName = 'recibopagto'
      DisplayFormat = '0'
    end
    object qryParcelasContratonumeroorigem: TLargeintField
      FieldName = 'numeroorigem'
    end
    object qryParcelasContratovalorcontratadoatehabitese: TFloatField
      FieldName = 'valorcontratadoatehabitese'
      DisplayFormat = '###,###,##0.00'
    end
    object qryParcelasContratomoedaatehabitese: TStringField
      FieldName = 'moedaatehabitese'
      Size = 10
    end
    object qryParcelasContratotaxajurosatehabitese: TFloatField
      FieldName = 'taxajurosatehabitese'
      DisplayFormat = '0.00'
    end
    object qryParcelasContratodatabaseatehabitese: TDateField
      Alignment = taCenter
      FieldName = 'databaseatehabitese'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasContratotipojurosatehabitese: TBooleanField
      FieldName = 'tipojurosatehabitese'
    end
    object qryParcelasContratoAVPValor: TFloatField
      FieldName = 'AVPValor'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryParcelasContratoPrazoAVP: TStringField
      FieldName = 'PrazoAVP'
      Size = 1
    end
  end
  object dsrParcelasContrato: TtecDataSource
    DataSet = qryParcelasContrato
    Left = 400
    Top = 200
  end
  object spcContratos_ProximoNumero: TtecQuery
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
      'SELECT VendasImoveis_ProximoContrato() AS Numero')
    RequestLive = True
    Left = 368
    Top = 256
    object spcContratos_ProximoNumeronumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
  end
  object qryImoveis: TtecQuery
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
      'SELECT i.Bloco,'
      '       i.Numero,'
      '       i.Situacao,'
      '       i.Pavimento,'
      '       i.Preco,'
      '       i.Observacoes'
      ''
      'FROM imoveis i'
      ''
      'WHERE i.Bloco =  :Bloco AND'
      '      i.Numero = :Numero and'
      '      i.unidade = :unidade')
    RequestLive = True
    Left = 200
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Bloco'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'unidade'
        ParamType = ptUnknown
      end>
    object qryImoveisbloco: TIntegerField
      FieldName = 'bloco'
    end
    object qryImoveisnumero: TStringField
      DisplayWidth = 10
      FieldName = 'numero'
      Size = 10
    end
    object qryImoveissituacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
    object qryImoveispavimento: TStringField
      FieldName = 'pavimento'
    end
    object qryImoveisobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 512
    end
    object qryImoveispreco: TFloatField
      DisplayLabel = 'Pre'#231'o'
      DisplayWidth = 13
      FieldName = 'preco'
      DisplayFormat = '###,###,##0.00'
      currency = True
      Precision = 2
    end
  end
  object dsrImoveis: TtecDataSource
    DataSet = qryImoveis
    Left = 224
    Top = 272
  end
  object qryTotaisParcelas: TtecQuery
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
      'SELECT SUM(pi.ValorHistorico)  AS TotalVencto,'
      '       SUM(pi.ValorContratado) AS TotalContratado,'
      
        '       SUM((SELECT ValorDevido(pi.Contrato, pi.Tipo, pi.Numero, ' +
        'pi.NrPagto,'
      '                              (CASE WHEN pi.DataPagto IS NULL '
      '                                    THEN CURRENT_DATE'
      '                                    ELSE pi.DataPagto'
      '                               END)))) AS TotalDevido,'
      ''
      '       SUM(pi.ValorPagto) AS TotalPago,'
      
        '       SUM((SELECT JurosContratuais(pi.Contrato, pi.Tipo, pi.Num' +
        'ero, pi.NrPagto,'
      
        '                                   (CASE WHEN pi.DataPagto IS NU' +
        'LL '
      '                                         THEN CURRENT_DATE'
      '                                         ELSE pi.DataPagto'
      '                                    END)))) AS TotalJuros,'
      ''
      
        '       SUM(((SELECT ValorCorrigido(pi.Contrato, pi.Tipo, pi.Nume' +
        'ro, pi.NrPagto,'
      
        '                                 (CASE WHEN pi.DataPagto IS NULL' +
        ' '
      '                                       THEN CURRENT_DATE'
      '                                       ELSE pi.DataPagto'
      
        '                                  END),true)) - pi.ValorHistoric' +
        'o)) AS TotalCorrecao,'
      ''
      '       SUM((CASE WHEN (pi.ValorPagto -'
      '                      (SELECT ValorDevido(pi.Contrato, pi.Tipo, '
      
        '                                          pi.Numero,   pi.NrPagt' +
        'o,'
      
        '                                         (CASE WHEN pi.DataPagto' +
        ' IS NULL '
      '                                               THEN CURRENT_DATE'
      '                                               ELSE pi.DataPagto'
      '                                           END)))) = 0'
      '                 THEN NULL'
      '                 ELSE (pi.ValorPagto - '
      '                      (SELECT ValorDevido(pi.Contrato, pi.Tipo,'
      
        '                                          pi.Numero,   pi.NrPagt' +
        'o,'
      
        '                                         (CASE WHEN pi.DataPagto' +
        ' IS NULL '
      '                                               THEN CURRENT_DATE'
      '                                               ELSE pi.DataPagto'
      '                                          END))))'
      '            END)) AS TotalDiferenca'
      'FROM parcelasimoveis pi'
      'WHERE pi.Contrato = :Contrato'
      '')
    RequestLive = False
    Left = 376
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptUnknown
      end>
    object qryTotaisParcelastotalvencto: TFloatField
      FieldName = 'totalvencto'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryTotaisParcelastotalcontratado: TFloatField
      FieldName = 'totalcontratado'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryTotaisParcelastotaldevido: TFloatField
      FieldName = 'totaldevido'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryTotaisParcelastotalpago: TFloatField
      FieldName = 'totalpago'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryTotaisParcelastotaljuros: TFloatField
      FieldName = 'totaljuros'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryTotaisParcelastotalcorrecao: TFloatField
      FieldName = 'totalcorrecao'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryTotaisParcelastotaldiferenca: TFloatField
      FieldName = 'totaldiferenca'
      DisplayFormat = '###,###,###,##0.00'
    end
  end
  object dsrTotaisParcelas: TtecDataSource
    DataSet = qryTotaisParcelas
    Left = 400
    Top = 328
  end
  object qryParametros: TtecQuery
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
      'select * from parametroscontasimoveis'
      '')
    RequestLive = False
    Left = 192
    Top = 320
    object qryParametroscreditarcofinsvenda: TIntegerField
      FieldName = 'creditarcofinsvenda'
      DisplayFormat = '0'
    end
    object qryParametroscreditarcsllvenda: TIntegerField
      FieldName = 'creditarcsllvenda'
      DisplayFormat = '0'
    end
    object qryParametroscreditarirpjvenda: TIntegerField
      FieldName = 'creditarirpjvenda'
      DisplayFormat = '0'
    end
    object qryParametroscreditarpisvenda: TIntegerField
      FieldName = 'creditarpisvenda'
      DisplayFormat = '0'
    end
    object qryParametrosdebitarcofinschaves: TIntegerField
      FieldName = 'debitarcofinschaves'
      DisplayFormat = '0'
    end
    object qryParametrosdebitarcsllchaves: TIntegerField
      FieldName = 'debitarcsllchaves'
      DisplayFormat = '0'
    end
    object qryParametrosdebitarirpjchaves: TIntegerField
      FieldName = 'debitarirpjchaves'
      DisplayFormat = '0'
    end
    object qryParametrosdebitarpischaves: TIntegerField
      FieldName = 'debitarpischaves'
      DisplayFormat = '0'
    end
    object qryParametroscreditarcofinsrecebimento: TIntegerField
      FieldName = 'creditarcofinsrecebimento'
      DisplayFormat = '0'
    end
    object qryParametroscreditarcsllrecebimento: TIntegerField
      FieldName = 'creditarcsllrecebimento'
      DisplayFormat = '0'
    end
    object qryParametroscreditarirpjrecebimento: TIntegerField
      FieldName = 'creditarirpjrecebimento'
      DisplayFormat = '0'
    end
    object qryParametroscreditarpisrecebimento: TIntegerField
      FieldName = 'creditarpisrecebimento'
      DisplayFormat = '0'
    end
    object qryParametrosevento: TIntegerField
      FieldName = 'evento'
      DisplayFormat = '0'
    end
    object qryParametroshistoricovendalancamento: TIntegerField
      FieldName = 'historicovendalancamento'
      DisplayFormat = '0'
    end
    object qryParametroshistoricovendaimpostos: TIntegerField
      FieldName = 'historicovendaimpostos'
      DisplayFormat = '0'
    end
    object qryParametroshistoricochavesvalorvenda: TIntegerField
      FieldName = 'historicochavesvalorvenda'
      DisplayFormat = '0'
    end
    object qryParametroshistoricochavesimpostos: TIntegerField
      FieldName = 'historicochavesimpostos'
      DisplayFormat = '0'
    end
    object qryParametroshistoricochavescustoscomissoes: TIntegerField
      FieldName = 'historicochavescustoscomissoes'
      DisplayFormat = '0'
    end
    object qryParametroshistoricochavesatualizacaomonetaria: TIntegerField
      FieldName = 'historicochavesatualizacaomonetaria'
      DisplayFormat = '0'
    end
    object qryParametroshistoricorecebcaixabanco: TIntegerField
      FieldName = 'historicorecebcaixabanco'
      DisplayFormat = '0'
    end
    object qryParametroshistoricorecebprincipal: TIntegerField
      FieldName = 'historicorecebprincipal'
      DisplayFormat = '0'
    end
    object qryParametroshistoricorecebatualizacaomonetaria: TIntegerField
      FieldName = 'historicorecebatualizacaomonetaria'
      DisplayFormat = '0'
    end
    object qryParametroshistoricorecebdescontos: TIntegerField
      FieldName = 'historicorecebdescontos'
      DisplayFormat = '0'
    end
    object qryParametroshistoricorecebjuros: TIntegerField
      FieldName = 'historicorecebjuros'
      DisplayFormat = '0'
    end
    object qryParametroshistoricoapropriacaomensal: TIntegerField
      FieldName = 'historicoapropriacaomensal'
      DisplayFormat = '0'
    end
    object qryParametrosdebitardespesasvenda: TIntegerField
      FieldName = 'debitardespesasvenda'
      DisplayFormat = '0'
    end
    object qryParametrosdebitaratualizacaomonetariaate2013: TIntegerField
      FieldName = 'debitaratualizacaomonetariaate2013'
      DisplayFormat = '0'
    end
    object qryParametrosdebitaratualizacaomonetariaapos2014: TIntegerField
      FieldName = 'debitaratualizacaomonetariaapos2014'
      DisplayFormat = '0'
    end
    object qryParametrosapropriarimpostosimoveis: TBooleanField
      FieldName = 'apropriarimpostosimoveis'
    end
  end
  object dsrParametros: TtecDataSource
    DataSet = qryParametros
    Left = 216
    Top = 344
  end
  object qryCotacoes: TtecQuery
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
      'Select mc.moeda,'
      '       mc.data,'
      '       mc.cotacao'
      'from moedascotacoes MC'
      'where mc.moeda = :Moeda and mc.data = :data')
    RequestLive = False
    Left = 488
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Moeda'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'data'
        ParamType = ptUnknown
      end>
    object qryCotacoesmoeda: TStringField
      FieldName = 'moeda'
      Size = 10
    end
    object qryCotacoesdata: TDateField
      FieldName = 'data'
    end
    object qryCotacoescotacao: TFloatField
      FieldName = 'cotacao'
    end
  end
  object dsrCotacoes: TtecDataSource
    DataSet = qryCotacoes
    Left = 512
    Top = 104
  end
  object qryContasSaidasFiliais: TtecQuery
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
      
        'select coalesce(csff.contacontabil, csfg.contacontabil) as conta' +
        'contabil,'
      '       coalesce(csff.descricao, csfg.descricao) as descricao,'
      '      (select pc.descricao'
      '          from planocontas pc'
      
        '          where pc.codigo = coalesce(csff.contacontabil, csfg.co' +
        'ntacontabil)) as descricaoconta,'
      ''
      '         (select pc.classificacao'
      '          from planocontas pc'
      
        '          where pc.codigo = coalesce(csff.contacontabil, csfg.co' +
        'ntacontabil)) as classificacao'
      'from contassaidasfiliais csfg'
      '     left join contassaidasfiliais csff'
      '     on csfg.descricao = csff.descricao'
      '     and csff.filial = :filial'
      ' where csfg.filial is null')
    RequestLive = False
    Left = 488
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end>
    object qryContasSaidasFiliaiscontacontabil: TIntegerField
      FieldName = 'contacontabil'
    end
    object qryContasSaidasFiliaisdescricao: TStringField
      FieldName = 'descricao'
      Size = 40
    end
    object qryContasSaidasFiliaisdescricaoconta: TStringField
      FieldName = 'descricaoconta'
    end
    object qryContasSaidasFiliaisclassificacao: TStringField
      FieldName = 'classificacao'
      Size = 17
    end
  end
  object dsrContasSaidasFiliais: TtecDataSource
    DataSet = qryContasSaidasFiliais
    Left = 512
    Top = 184
  end
  object qryContasEntradasFiliais: TtecQuery
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
      'select filial,'
      '         contacontabil,'
      '         descricao,'
      '         (select descricao '
      '          from planocontas '
      '          where codigo = contacontabil) as descricaoconta,'
      '         (select classificacao'
      '          from planocontas '
      '          where codigo = contacontabil) as classificacao'
      'from contasentradasfiliais '
      'order by UPPER(TO_ASCII(descricao,'#39'LATIN1'#39'))'
      '')
    RequestLive = False
    Left = 488
    Top = 232
    object qryContasEntradasFiliaisfilial: TIntegerField
      FieldName = 'filial'
    end
    object qryContasEntradasFiliaiscontacontabil: TIntegerField
      FieldName = 'contacontabil'
    end
    object qryContasEntradasFiliaisdescricao: TStringField
      FieldName = 'descricao'
      Size = 40
    end
    object qryContasEntradasFiliaisdescricaoconta: TStringField
      FieldName = 'descricaoconta'
      Size = 33
    end
    object qryContasEntradasFiliaisclassificacao: TStringField
      FieldName = 'classificacao'
      Size = 17
    end
  end
  object dsrContasEntradasFiliais: TtecDataSource
    DataSet = qryContasEntradasFiliais
    Left = 512
    Top = 256
  end
  object qryMovtosBancos: TtecQuery
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
      'Select m.conta,'
      '       m.data,'
      '       m.sequencia,'
      '       m.compensacao,'
      '       m.seqcompensacao,'
      '       m.dataoriginal,'
      '       m.evento,'
      '       m.tipo,'
      '       m.origemlancto,'
      '       m.documento,'
      '       m.observacoes,'
      '       m.valor'
      'FROM movtosbancos m'
      'WHERE m.Conta = :ContaPagto AND'
      '      m.Data  = :DataPagto  AND'
      '      m.Sequencia = :Sequencia')
    RequestLive = True
    Left = 632
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ContaPagto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataPagto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sequencia'
        ParamType = ptUnknown
      end>
    object qryMovtosBancosconta: TIntegerField
      FieldName = 'conta'
      Required = True
      DisplayFormat = '0'
    end
    object qryMovtosBancosdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryMovtosBancossequencia: TIntegerField
      FieldName = 'sequencia'
      Required = True
      DisplayFormat = '0'
    end
    object qryMovtosBancoscompensacao: TDateField
      Alignment = taCenter
      FieldName = 'compensacao'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryMovtosBancosseqcompensacao: TIntegerField
      FieldName = 'seqcompensacao'
      Required = True
      DisplayFormat = '0'
    end
    object qryMovtosBancosdataoriginal: TDateField
      Alignment = taCenter
      FieldName = 'dataoriginal'
      EditMask = '99/99/9999;1; '
    end
    object qryMovtosBancosevento: TIntegerField
      FieldName = 'evento'
      DisplayFormat = '0'
    end
    object qryMovtosBancostipo: TStringField
      FieldName = 'tipo'
      Size = 1
    end
    object qryMovtosBancosorigemlancto: TStringField
      FieldName = 'origemlancto'
      Size = 1
    end
    object qryMovtosBancosdocumento: TStringField
      FieldName = 'documento'
    end
    object qryMovtosBancosobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 512
    end
    object qryMovtosBancosvalor: TFloatField
      FieldName = 'valor'
      Required = True
      DisplayFormat = '0.00'
    end
  end
  object dsrMovtosBancos: TtecDataSource
    DataSet = qryMovtosBancos
    Left = 656
    Top = 448
  end
  object qryMovtosBancosEventos: TtecQuery
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
      'SELECT  me.conta,'
      '        me.data,'
      '        me.sequencia,'
      '        me.evento,'
      '        me.tipo,'
      '        me.valor'
      'FROM movtosbancoseventos me'
      '')
    RequestLive = True
    Left = 192
    Top = 400
    object qryMovtosBancosEventosconta: TIntegerField
      FieldName = 'conta'
      Required = True
      DisplayFormat = '0'
    end
    object qryMovtosBancosEventosdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryMovtosBancosEventossequencia: TIntegerField
      FieldName = 'sequencia'
      Required = True
      DisplayFormat = '0'
    end
    object qryMovtosBancosEventosevento: TIntegerField
      FieldName = 'evento'
      Required = True
      DisplayFormat = '0'
    end
    object qryMovtosBancosEventostipo: TStringField
      FieldName = 'tipo'
      Size = 1
    end
    object qryMovtosBancosEventosvalor: TFloatField
      FieldName = 'valor'
      Required = True
      DisplayFormat = '0.00'
    end
  end
  object dsrMovtosBancosEventos: TtecDataSource
    DataSet = qryMovtosBancosEventos
    Left = 216
    Top = 424
  end
  object qrySequencia: TtecQuery
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
      'SELECT MAX(m.Sequencia) as Sequencia'
      'FROM  MovtosBancos m'
      'WHERE m.Conta = :ContaPagto AND'
      '      m.Data  = :DataPagto;')
    RequestLive = False
    Left = 320
    Top = 400
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ContaPagto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataPagto'
        ParamType = ptUnknown
      end>
    object qrySequenciasequencia: TIntegerField
      FieldName = 'sequencia'
    end
  end
  object qryRecalcularParcelas: TtecQuery
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
      
        'SELECT (SELECT ValorDevido(pi.Contrato, pi.Tipo, pi.Numero, pi.N' +
        'rPagto,:Data)) AS ValorDevido,'
      ''
      
        '       (SELECT ValorCorrigido(pi.Contrato, pi.Tipo, pi.Numero, p' +
        'i.NrPagto,:Data, true)) AS ValorCorrigido,'
      '        pi.DataVencto,'
      '        pi.Datapagto,'
      '       (CASE WHEN pi.Datapagto IS NULL'
      '             THEN NULL'
      '             ELSE pi.ValorPagto'
      '        END) AS ValorPagto,'
      '  '
      
        '       (SELECT JurosContratuais(pi.Contrato, pi.Tipo, pi.Numero,' +
        ' pi.NrPagto,:Data)) AS Juros,'
      ''
      
        '       ((SELECT ValorCorrigido(pi.Contrato, pi.Tipo, pi.Numero, ' +
        'pi.NrPagto,:Data, true)) - pi.ValorHistorico) AS Correcao'
      ''
      'FROM parcelasimoveis pi'
      ''
      'WHERE pi.Contrato = :Contrato AND'
      '      pi.Tipo = :Tipo AND'
      '      pi.numero = :Numero AND'
      '      pi.nrPagto = :NrPagto'
      'ORDER BY pi.Tipo, pi.Numero, pi.NrPagto'
      '')
    RequestLive = False
    Left = 504
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Data'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NrPagto'
        ParamType = ptUnknown
      end>
    object qryRecalcularParcelasvalordevido: TFloatField
      FieldName = 'valordevido'
    end
    object qryRecalcularParcelasvalorcorrigido: TFloatField
      FieldName = 'valorcorrigido'
    end
    object qryRecalcularParcelasdatavencto: TDateField
      FieldName = 'datavencto'
    end
    object qryRecalcularParcelasdatapagto: TDateField
      FieldName = 'datapagto'
    end
    object qryRecalcularParcelasvalorpagto: TFloatField
      FieldName = 'valorpagto'
    end
    object qryRecalcularParcelasjuros: TFloatField
      FieldName = 'juros'
    end
    object qryRecalcularParcelascorrecao: TFloatField
      FieldName = 'correcao'
    end
  end
  object qryCancelarQuitacao: TtecQuery
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
      'UPDATE parcelasimoveis SET'
      '  ValorPagto = null,'
      '  datapagto = null,'
      '  valorvencto = null,'
      '  banco = null,'
      '  bancocheque = null,'
      '  cheque = null,'
      '  emitente = null,'
      '  contapagto = null,'
      '  agencia = null'
      'Where Contrato = :Contrato AND'
      '      Tipo = :Tipo AND'
      '      Numero = :Numero AND'
      '      NrPagto = NrPagto')
    RequestLive = True
    Left = 424
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Numero'
        ParamType = ptUnknown
      end>
  end
  object spcRecibos: TtecQuery
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
      'select recibosimoveis_proximocodigo() as recibo')
    RequestLive = False
    Left = 504
    Top = 376
    object spcRecibosrecibo: TIntegerField
      FieldName = 'recibo'
    end
  end
  object qryContas: TtecQuery
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
      'Select * from contas where conta = 1;')
    RequestLive = False
    Left = 288
    Top = 328
    object qryContasbanco: TIntegerField
      FieldName = 'banco'
    end
    object qryContasagencia: TIntegerField
      FieldName = 'agencia'
    end
    object qryContasconta: TIntegerField
      FieldName = 'conta'
    end
    object qryContasdigito: TStringField
      FieldName = 'digito'
      Size = 2
    end
    object qryContasconvenio: TLargeintField
      FieldName = 'convenio'
    end
    object qryContastitular: TStringField
      FieldName = 'titular'
      Size = 50
    end
    object qryContassequencial: TIntegerField
      FieldName = 'sequencial'
    end
    object qryContascontacontabil: TIntegerField
      FieldName = 'contacontabil'
    end
    object qryContasusodobanco: TStringField
      FieldName = 'usodobanco'
      Size = 15
    end
    object qryContascedente: TStringField
      FieldName = 'cedente'
    end
    object qryContasinstrucoesboleto: TStringField
      FieldName = 'instrucoesboleto'
      Size = 300
    end
    object qryContaslocalpagamento: TStringField
      FieldName = 'localpagamento'
      Size = 100
    end
    object qryContasfluxocaixa: TBooleanField
      FieldName = 'fluxocaixa'
    end
    object qryContascarteira: TStringField
      FieldName = 'carteira'
    end
    object qryContasfilial: TIntegerField
      FieldName = 'filial'
    end
  end
  object qryLancamentos: TtecQuery
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
        Name = 'WhereContas'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'Select SUM(valor) as Valor'
      'from lancamentos'
      'where Origem = :Origem'
      '   %WhereContas'
      '')
    RequestLive = False
    Left = 520
    Top = 432
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Origem'
        ParamType = ptUnknown
      end>
    object qryLancamentosvalor: TFloatField
      FieldName = 'valor'
    end
  end
  object dsrLancamentos: TtecDataSource
    DataSet = qryLancamentos
    Left = 544
    Top = 456
  end
  object qryCompradores_Anteriores: TtecQuery
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
      'SELECT c.Contrato,'
      '       c.Cliente,'
      '      (SELECT coalesce(v.razao,v.nome) '
      '          FROM vFornecedores v'
      '          WHERE c.Cliente     = v.Codigo AND'
      '                c.TipoCliente = v.Tipo) AS NomeCliente,'
      '       c.TipoCliente,'
      '       c.Principal,'
      '       c.Percentual,'
      '       c.Representante,'
      '       CAST(c.Representante || '#39' - '#39' || '
      '           (SELECT coalesce(v.razao,v.nome) '
      '               FROM vFornecedores v'
      '               WHERE c.Representante = v.Codigo AND'
      
        '                     c.TipoRepresentante = v.Tipo) AS VARCHAR) A' +
        'S NomeRepresentante,'
      '       c.TipoRepresentante,'
      '       c.Fiador,'
      '       CAST(c.Fiador || '#39' - '#39' ||'
      
        '           (SELECT coalesce(v.razao,v.nome)  FROM vFornecedores ' +
        'v'
      '               WHERE c.Fiador = v.Codigo AND'
      
        '                     c.TipoFiador = v.Tipo) AS VARCHAR) AS NomeF' +
        'iador,'
      '       c.TipoFiador,'
      '       c.Observacoes'
      'FROM compradores c'
      'WHERE c.Contrato = :Contrato'
      'ORDER BY c.Principal DESC, c.Percentual DESC'
      '')
    RequestLive = False
    Left = 56
    Top = 456
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptUnknown
      end>
    object IntegerField1: TIntegerField
      FieldName = 'contrato'
      DisplayFormat = '0'
    end
    object IntegerField2: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object StringField1: TStringField
      FieldName = 'nomecliente'
      Size = 50
    end
    object FloatField1: TFloatField
      FieldName = 'percentual'
      DisplayFormat = '##0.0000'
    end
    object IntegerField3: TIntegerField
      FieldName = 'representante'
      DisplayFormat = '0'
    end
    object StringField2: TStringField
      FieldName = 'nomerepresentante'
      Size = 50
    end
    object IntegerField4: TIntegerField
      FieldName = 'fiador'
      DisplayFormat = '0'
    end
    object StringField3: TStringField
      FieldName = 'nomefiador'
      Size = 50
    end
    object StringField4: TStringField
      FieldName = 'observacoes'
      Size = 200
    end
    object StringField5: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
    object StringField6: TStringField
      FieldName = 'tiporepresentante'
      Size = 1
    end
    object StringField7: TStringField
      FieldName = 'tipofiador'
      Size = 1
    end
  end
  object dsrCompradores_Anteriores: TtecDataSource
    DataSet = qryCompradores_Anteriores
    OnDataChange = dsrCompradoresDataChange
    Left = 72
    Top = 472
  end
  object qryLancamentosRecebimentos: TtecQuery
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
        Name = 'WhereContas'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'Select SUM(valor) as Valor'
      'from lancamentos'
      'where Origem = :Origem AND'
      '      NrOrigem ilike :NumeroOrigem'
      '      %WhereContas')
    RequestLive = False
    Left = 408
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Origem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NumeroOrigem'
        ParamType = ptUnknown
      end>
  end
  object dsrLancamentosRecebimentos: TtecDataSource
    DataSet = qryLancamentosRecebimentos
    Left = 432
    Top = 472
  end
  object qryProcessarRecebimentos: TtecQuery
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
      
        'SELECT ContabilizarRecebimentosImoveis(:Filial, :Recibo) AS Lanc' +
        'amentos'
      '')
    RequestLive = False
    Left = 624
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Recibo'
        ParamType = ptUnknown
      end>
  end
  object spcLancamentosProximo: TtecQuery
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
      
        'SELECT lancamentos_proximonrlancto(:Exercicio, :Filial) as codig' +
        'o')
    RequestLive = True
    Left = 632
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Exercicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Filial'
        ParamType = ptUnknown
      end>
    object spcLancamentosProximocodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object qryTotalAtualizacaoMonetaria_OLD: TtecQuery
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
      ';'
      'SELECT DISTINCT VendasImoveis.Contrato,'
      '                ParcelasImoveis.Correcao'
      '            FROM ('
      '                  SELECT ParcelasImoveis.Contrato,'
      '                         SUM(ValorDevidoMesAtual -'
      
        '                                     ValorDevidoMesAnterior) AS ' +
        'Correcao'
      '                     FROM ('
      '                            SELECT Contrato,'
      '                                   ValorDevido(Contrato, Tipo,'
      '                                               Numero, NrPagto,'
      
        '                                               Last_Day(CAST(:pE' +
        'xercicio||'#39'-'#39'||:pMes||'#39'-'#39'||'#39'01'#39' AS date)-15))'
      
        '                                                      AS ValorDe' +
        'vidoMesAnterior,'
      ''
      '                                  ValorDevido(Contrato, Tipo,'
      '                                              Numero, NrPagto,'
      
        '                                              last_day(CAST(:pEx' +
        'ercicio||'#39'-'#39'||:pMes||'#39'-'#39'||'#39'01'#39' AS date)))'
      
        '                                                          AS Val' +
        'orDevidoMesAtual'
      '                               FROM ('
      
        '                                     SELECT DISTINCT VendasImove' +
        'is.Contrato,'
      
        '                                            ParcelasImoveis.Tipo' +
        ','
      
        '                                            ParcelasImoveis.Nume' +
        'ro,'
      
        '                                            ParcelasImoveis.NrPa' +
        'gto,'
      
        '                                            ParcelasImoveis.Moed' +
        'a,'
      
        '                                            VendasImoveis.Indexa' +
        'dorAteHabiteSe,'
      
        '                                            VendasImoveis.DataBa' +
        'se as VendasDataBase,'
      
        '                                            ParcelasImoveis.Valo' +
        'rHistorico,'
      
        '                                            ParcelasImoveis.Valo' +
        'rcontratado,'
      
        '                                            ParcelasImoveis.juro' +
        'scompostos,'
      
        '                                            ParcelasImoveis.taxa' +
        'juros'
      ''
      '                                        FROM VendasImoveis'
      '                                           JOIN ParcelasImoveis'
      
        '                                             ON VendasImoveis.Co' +
        'ntrato = ParcelasImoveis.Contrato'
      ''
      
        '                                        WHERE VendasImoveis.Cont' +
        'rato = ParcelasImoveis.Contrato'
      
        '                                          AND VendasImoveis.Cont' +
        'rato = :Contrato'
      
        '                                          AND (ParcelasImoveis.D' +
        'atapagto IS NULL OR'
      
        '                                               ParcelasImoveis.D' +
        'ataPagto > :DataInicioMes)'
      ''
      
        '                                         AND CASE WHEN VendasImo' +
        'veis.Situacao in ('#39'C'#39','#39'R'#39') THEN FALSE'
      
        '                                                  WHEN VendasImo' +
        'veis.Situacao in ('#39'T'#39','#39'G'#39') AND'
      
        '                                                      (EXTRACT(Y' +
        'EAR FROM VendasImoveis.DataAlteracao) = CAST(:pExercicio as inte' +
        'ger) AND'
      
        '                                                      (CAST(:pMe' +
        's as Integer) <= EXTRACT(MONTH FROM VendasImoveis.DataAlteracao)' +
        ')) THEN TRUE'
      
        '                                                  WHEN VendasImo' +
        'veis.Situacao in ('#39'F'#39','#39'D'#39') AND'
      
        '                                                       (select C' +
        'AST(:pMes as Integer) > extract(month from VI2.dataalteracao)'
      
        '                                                          from V' +
        'endasImoveis VI2'
      
        '                                                          where ' +
        'VI2.contrato = VendasImoveis.contrato_origem) THEN True'
      
        '                                                  WHEN VendasImo' +
        'veis.Situacao in ('#39'V'#39','#39'Q'#39') THEN TRUE'
      '                                                  ELSE FALSE'
      '                                             END'
      '                                    ) AS Selecao'
      '                          ) AS ParcelasImoveis'
      '                            GROUP BY Contrato'
      '                 ) AS ParcelasImoveis'
      ''
      '                   JOIN VendasImoveis'
      
        '                      ON VendasImoveis.Contrato = ParcelasImovei' +
        's.Contrato')
    RequestLive = True
    Left = 792
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pExercicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pMes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioMes'
        ParamType = ptUnknown
      end>
    object qryTotalAtualizacaoMonetaria_OLDcontrato: TIntegerField
      FieldName = 'contrato'
      DisplayFormat = '0'
    end
    object qryTotalAtualizacaoMonetaria_OLDcorrecao: TFloatField
      FieldName = 'correcao'
      DisplayFormat = '0.00'
    end
  end
  object qryTotalDescontos: TtecQuery
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
      'SELECT COALESCE(SUM(DescontoCorrecao),  0) +'
      '       COALESCE(SUM(DescontoCorrecao1), 0) AS DescontoCorrecao,'
      '       COALESCE(SUM(DescontoPrincipal), 0) AS DescontoPrincipal'
      'FROM'
      '('
      'SELECT CASE WHEN ABS(Diferenca) <= Correcao + Juros'
      '            THEN ABS(Diferenca)'
      '       END AS DescontoCorrecao,'
      '       CASE WHEN ABS(Diferenca) > Correcao + Juros'
      '            THEN Correcao + Juros'
      '       END AS DescontoCorrecao1,'
      '       CASE WHEN ABS(Diferenca) > Correcao + Juros'
      '            THEN ABS(Diferenca) - Correcao - Juros'
      '       END AS DescontoPrincipal'
      'FROM'
      '('
      
        'SELECT (SELECT JurosContratuais(pi.Contrato, pi.Tipo, pi.Numero,' +
        ' pi.NrPagto,'
      '                               (CASE WHEN pi.Datapagto IS NULL'
      '                                   THEN CURRENT_DATE'
      '                                   ELSE pi.Datapagto'
      '                                END))) AS Juros,'
      ''
      
        '       ((SELECT ValorCorrigido(pi.Contrato, pi.Tipo, pi.Numero, ' +
        'pi.NrPagto,'
      '                              (CASE WHEN pi.Datapagto IS NULL'
      '                                    THEN CURRENT_DATE'
      '                                    ELSE pi.Datapagto'
      
        '                               END),true)) - pi.ValorHistorico) ' +
        'AS Correcao,'
      ''
      '       (CASE WHEN pi.DataPagto IS NULL'
      '             THEN NULL'
      
        '             ELSE CASE WHEN (pi.Valorpagto - (SELECT ValorDevido' +
        '(pi.Contrato, pi.Tipo,'
      
        '                                                                ' +
        ' pi.Numero,pi.NrPagto,'
      
        '                                                                ' +
        ' pi.Datapagto))) = 0'
      '                       THEN NULL'
      
        '                       ELSE (pi.Valorpagto - (SELECT ValorDevido' +
        '(pi.Contrato, pi.Tipo,'
      
        '                                                                ' +
        ' pi.Numero,   pi.NrPagto,'
      
        '                                                                ' +
        ' pi.Datapagto)))'
      '                  END'
      '        END) AS Diferenca'
      ''
      'FROM parcelasimoveis pi'
      ''
      'WHERE pi.Contrato = :Contrato AND'
      '      pi.Datapagto is not null AND'
      '      pi.datapagto between :DataCorrecao and :DataChaves'
      ') as diferencas'
      'where diferenca < 0'
      ')as descontos')
    RequestLive = False
    Left = 632
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataCorrecao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataChaves'
        ParamType = ptUnknown
      end>
    object qryTotalDescontosdescontocorrecao: TFloatField
      FieldName = 'descontocorrecao'
    end
    object qryTotalDescontosdescontoprincipal: TFloatField
      FieldName = 'descontoprincipal'
    end
  end
  object dsrTotalDescontos: TtecDataSource
    DataSet = qryTotalDescontos
    Left = 656
    Top = 256
  end
  object qryTotaisParcelasAberto: TtecQuery
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
      'SELECT SUM(pi.ValorHistorico)  AS TotalVencto,'
      '       SUM(pi.ValorContratado) AS TotalContratado,'
      
        '       SUM((SELECT ValorDevido(pi.Contrato, pi.Tipo, pi.Numero, ' +
        'pi.NrPagto,'
      '                              (CASE WHEN pi.DataPagto IS NULL '
      '                                    THEN CURRENT_DATE'
      '                                    ELSE pi.DataPagto'
      '                               END)))) AS TotalDevido,'
      ''
      '       SUM(pi.ValorPagto) AS TotalPago,'
      
        '       SUM((SELECT JurosContratuais(pi.Contrato, pi.Tipo, pi.Num' +
        'ero, pi.NrPagto,'
      
        '                                   (CASE WHEN pi.DataPagto IS NU' +
        'LL '
      '                                         THEN CURRENT_DATE'
      '                                         ELSE pi.DataPagto'
      '                                    END)))) AS TotalJuros'
      'FROM parcelasimoveis pi'
      'WHERE pi.Contrato = :Contrato'
      '      AND pi.datapagto is NULL'
      '')
    RequestLive = False
    Left = 632
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptUnknown
      end>
    object qryTotaisParcelasAbertototalvencto: TFloatField
      FieldName = 'totalvencto'
    end
    object qryTotaisParcelasAbertototalcontratado: TFloatField
      FieldName = 'totalcontratado'
    end
    object qryTotaisParcelasAbertototaldevido: TFloatField
      FieldName = 'totaldevido'
    end
    object qryTotaisParcelasAbertototalpago: TFloatField
      FieldName = 'totalpago'
    end
    object qryTotaisParcelasAbertototaljuros: TFloatField
      FieldName = 'totaljuros'
    end
  end
  object dsrTotaisParcelasAberto: TtecDataSource
    DataSet = qryTotaisParcelasAberto
    Left = 656
    Top = 336
  end
  object spcMaiorContrato: TtecQuery
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
      'select max(contrato) as MaiorValorContrato from vendasimoveis ')
    RequestLive = False
    Left = 784
    Top = 136
    object spcMaiorContratomaiorvalorcontrato: TIntegerField
      FieldName = 'maiorvalorcontrato'
    end
  end
  object dsrMaiorContrato: TtecDataSource
    DataSet = spcMaiorContrato
    Left = 808
    Top = 160
  end
  object qryCorrecaoMes: TtecQuery
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
      'select ValorCorrecaoMes(:Contrato, :Exercicio, :Mes) as valor')
    RequestLive = False
    Left = 808
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Exercicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Mes'
        ParamType = ptUnknown
      end>
    object qryCorrecaoMesvalor: TFloatField
      FieldName = 'valor'
    end
  end
  object qryContratosOrigem: TtecQuery
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
      'select vi.contrato,'
      '       vi.situacao,'
      '          (select vio.situacao'
      '           from vendasimoveis vio'
      
        '           where vio.contrato = vi.contrato_origem) as situacao_' +
        'contrato_origem '
      'from vendasimoveis vi'
      'where vi.contrato = :contratoorigem')
    RequestLive = True
    Left = 784
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contratoorigem'
        ParamType = ptUnknown
      end>
    object qryContratosOrigemcontrato: TIntegerField
      FieldName = 'contrato'
      Required = True
    end
    object qryContratosOrigemsituacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
    object qryContratosOrigemsituacao_contrato_origem: TStringField
      FieldName = 'situacao_contrato_origem'
      Size = 50
    end
  end
  object qryContratosGerado: TtecQuery
    Tag = -1
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select vi.dataalteracao,'
      '          vi.contrato_gerado,'
      '          vi.situacao'
      'from vendasimoveis vi'
      'where vi.contrato = :contrato')
    RequestLive = False
    Left = 768
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptUnknown
      end>
  end
  object qryApagarLancamentosContabeis: TtecQuery
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
      'DELETE FROM lancamentos'
      'Where origem = :origem'
      '    and nrorigem = :nrorigem'
      '')
    RequestLive = False
    Left = 72
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'origem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nrorigem'
        ParamType = ptUnknown
      end>
  end
  object qrySituacaoImoveis: TtecQuery
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
      'select cast(null as integer) as bloco,'
      '          cast(null as varchar(10)) as numero,'
      '          cast(null as integer) as unidade,'
      '          cast(null as char(1)) as situacao')
    RequestLive = True
    Left = 48
    Top = 376
    object qrySituacaoImoveisbloco: TIntegerField
      FieldName = 'bloco'
    end
    object qrySituacaoImoveisnumero: TStringField
      FieldName = 'numero'
      Size = 10
    end
    object qrySituacaoImoveissituacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
    object qrySituacaoImoveisunidade: TIntegerField
      FieldName = 'unidade'
    end
  end
  object qryContratoOrigem: TtecQuery
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
      'SELECT c.dataalteracao'
      'from vendasimoveis c'
      'where c.contrato  = :Contrato_Origem')
    RequestLive = True
    Left = 112
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contrato_Origem'
        ParamType = ptUnknown
      end>
    object qryContratoOrigemdataalteracao: TDateField
      FieldName = 'dataalteracao'
    end
  end
  object qryConsultaTiposUnidades: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeOpen = qryConsultaTiposUnidadesBeforeOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'WhereSituacao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'Select tu.Codigo,'
      '       tu.nome'
      'from TiposUnidades tu'
      ''
      'where tu.codigo in (select i.unidade'
      '                    from imoveis i'
      '                    where i.bloco = :bloco'
      ''
      '                      %WhereSituacao'
      ''
      '                      )'
      ''
      'Order By UPPER(TO_ASCII(tu.Nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 624
    Top = 158
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'bloco'
        ParamType = ptUnknown
      end>
    object qryConsultaTiposUnidadescodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
      Visible = False
    end
    object qryConsultaTiposUnidadesnome: TStringField
      DisplayLabel = 'Tipo de Unidade'
      DisplayWidth = 65
      FieldName = 'nome'
      Required = True
      Size = 65
    end
  end
  object dsrConsultaTiposUnidades: TtecDataSource
    DataSet = qryConsultaTiposUnidades
    Left = 656
    Top = 176
  end
  object qrySaldoDevedor: TtecQuery
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
      'select saldodevedorimoveis(:Contrato, :Data) as valor')
    RequestLive = False
    Left = 768
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Data'
        ParamType = ptUnknown
      end>
    object qrySaldoDevedorvalor: TFloatField
      FieldName = 'valor'
    end
  end
  object qryAtualizarDatadoHabitese: TtecQuery
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
      'UPDATE ParcelasImoveis'
      '   SET ValorContratadoAteHabitese = ValorContratado,'
      '       MoedaAteHabitese           = Moeda,'
      '       TaxaJurosAteHabiteSe       = TaxaJuros,'
      '       TipoJurosAteHabiteSe       = Juroscompostos,'
      '       DataBaseAteHabiteSe        = DataBase,'
      ''
      
        '       DataBase                   = CASE WHEN sel.Data > sel.Hab' +
        'ite_Se'
      
        '                                         THEN CASE WHEN DataBase' +
        ' > sel.Data'
      '                                                   THEN DataBase'
      '                                                   ELSE sel.Data'
      '                                              END'
      
        '                                         ELSE CASE WHEN DataBase' +
        ' > sel.Habite_Se'
      '                                                   THEN DataBase'
      
        '                                                   ELSE sel.Habi' +
        'te_Se'
      '                                              END'
      '                                    END,'
      ''
      '       Moeda                      = sel.IndexadorAposHabiteSe,'
      '       TaxaJuros                  = sel.Juros,'
      
        '       ValorContratado            = ValorCorrigido(sel.Contrato,' +
        ' sel.Tipo, sel.Numero, sel.NrPagto, sel.Habite_Se, FALSE)'
      ''
      'FROM (SELECT pi.Contrato,   pi.Tipo,   pi.Numero, pi.NrPagto,'
      
        '             vi.IndexadorAposHabitese, vi.Juros,  vi.Habite_Se, ' +
        'vi.Data'
      ''
      '      FROM ParcelasImoveis pi'
      '           JOIN VendasImoveis vi ON pi.Contrato = vi.Contrato'
      ''
      '      WHERE pi.Contrato = vi.Contrato AND'
      '            pi.Datapagto IS NULL      AND'
      '            pi.Moeda     <> '#39'FIXA'#39'    AND'
      '            vi.Contrato = :Contrato   AND'
      '            vi.IndexadorAposHabiteSe IS NOT NULL'
      '     ) AS sel'
      ''
      'WHERE ParcelasImoveis.Contrato = sel.Contrato AND'
      '      ParcelasImoveis.Tipo     = sel.Tipo     AND'
      '      ParcelasImoveis.Numero   = sel.Numero   AND'
      '      ParcelasImoveis.NrPagto  = sel.NrPagto'
      ''
      '')
    RequestLive = False
    Left = 224
    Top = 504
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptUnknown
      end>
  end
  object qryGerarLancamentosHabitese: TtecQuery
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
      'select ContabilizarEntregaChaves(:Filial, :Contrato)')
    RequestLive = False
    Left = 296
    Top = 528
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptUnknown
      end>
  end
  object qryReverterDatadoHabitese: TtecQuery
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
      'UPDATE ParcelasImoveis '
      '   SET ValorContratado = ValorContratadoAteHabiteSe,'
      '       Moeda           = MoedaAteHabiteSe,'
      '       TaxaJuros       = TaxaJurosAteHabiteSe,'
      '       Juroscompostos  = TipoJurosAteHabiteSe,'
      '       DataBase        = DataBaseAteHabiteSe,'
      ''
      '       ValorContratadoAteHabiteSe = NULL,'
      '       MoedaAteHabiteSe           = NULL,'
      '       TaxaJurosAteHabiteSe       = NULL,'
      '       DataBaseAteHabiteSe        = NULL,'
      '       TipoJurosAteHabiteSe       = NULL'
      ''
      'FROM (SELECT pi.Contrato, pi.Tipo, pi.Numero, pi.NrPagto'
      '         FROM ParcelasImoveis pi'
      '              JOIN VendasImoveis vi ON pi.Contrato = vi.Contrato'
      ''
      '         WHERE pi.Contrato = :Contrato AND'
      '               pi.DataPagto IS NULL    AND'
      '               pi.Moeda <> '#39'FIXA'#39'      AND'
      '               vi.IndexadorAposHabiteSe IS NOT NULL'
      '     ) AS sel'
      ''
      'WHERE ParcelasImoveis.Contrato = sel.Contrato AND'
      '      ParcelasImoveis.Tipo     = sel.Tipo     AND'
      '      ParcelasImoveis.Numero   = sel.Numero   AND'
      '      ParcelasImoveis.NrPagto  = sel.NrPagto'
      '')
    RequestLive = True
    Left = 256
    Top = 516
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptUnknown
      end>
  end
  object qryContabilizarVendasImoveis: TtecQuery
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
      'select ContabilizarVendasImoveis(:Contrato, false)')
    RequestLive = True
    Left = 456
    Top = 528
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptUnknown
      end>
  end
  object qryContabilizarRescisoesImoveis: TtecQuery
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
      'select ContabilizarRescisoesImoveis(:Contrato,false)')
    RequestLive = True
    Left = 608
    Top = 528
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptUnknown
      end>
  end
  object qryContabilizarRenegociacoesImoveis: TtecQuery
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
      'select ContabilizarRenegociacoesImoveis(:Contrato, false)')
    RequestLive = True
    Left = 800
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptUnknown
      end>
  end
  object qryContabilizarTransferenciasImoveis: TtecQuery
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
      'select ContabilizarTransferenciasImoveis(:Contrato, false)')
    RequestLive = True
    Left = 800
    Top = 504
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptUnknown
      end>
  end
end
