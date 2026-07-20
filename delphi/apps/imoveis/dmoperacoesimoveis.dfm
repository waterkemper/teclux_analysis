inherited dtmOperacoesImoveis: TdtmOperacoesImoveis
  OldCreateOrder = False
  Left = 402
  Top = 190
  Height = 393
  Width = 486
  object qryContratosImoveis: TtecQuery
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
      '       c.Data,'
      '       c.Habite_se,'
      '       c.datachaves,'
      '       c.Situacao,'
      '       cast(case when c.situacao = '#39'R'#39' then '#39'RESERVADO'#39
      '                 when c.situacao = '#39'C'#39' then '#39'CANCELADO'#39
      '                 when c.situacao = '#39'V'#39' then '#39'VENDIDO'#39
      '                 when c.situacao = '#39'Q'#39' then '#39'QUITADO'#39
      '            end as varchar) as NomeSituacao,'
      '       c.vendedor,'
      '       c.valortotal,'
      '       c.indexadoratehabitese,'
      '       c.indexadoraposhabitese,'
      '       c.database,'
      '       c.juroscompostos,'
      '       c.juros,'
      '       c.atrasomulta,'
      '       c.atrasojuros,'
      '       c.debitovenda,'
      '       c.observacoes'
      'from vendasimoveis c'
      'where c.contrato  = :Contrato')
    RequestLive = False
    Left = 56
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptUnknown
      end>
    object qryContratosImoveiscontrato: TIntegerField
      FieldName = 'contrato'
      Required = True
    end
    object qryContratosImoveisdata: TDateField
      FieldName = 'data'
      Required = True
    end
    object qryContratosImoveishabite_se: TDateField
      FieldName = 'habite_se'
    end
    object qryContratosImoveisdatachaves: TDateField
      FieldName = 'datachaves'
    end
    object qryContratosImoveissituacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
    object qryContratosImoveisnomesituacao: TStringField
      FieldName = 'nomesituacao'
      Size = 50
    end
    object qryContratosImoveisvendedor: TIntegerField
      FieldName = 'vendedor'
      Required = True
    end
    object qryContratosImoveisvalortotal: TFloatField
      FieldName = 'valortotal'
      Required = True
    end
    object qryContratosImoveisindexadoratehabitese: TStringField
      FieldName = 'indexadoratehabitese'
      Size = 10
    end
    object qryContratosImoveisindexadoraposhabitese: TStringField
      FieldName = 'indexadoraposhabitese'
      Size = 10
    end
    object qryContratosImoveisdatabase: TDateField
      FieldName = 'database'
    end
    object qryContratosImoveisjuroscompostos: TBooleanField
      FieldName = 'juroscompostos'
    end
    object qryContratosImoveisjuros: TFloatField
      FieldName = 'juros'
    end
    object qryContratosImoveisatrasomulta: TFloatField
      FieldName = 'atrasomulta'
    end
    object qryContratosImoveisatrasojuros: TFloatField
      FieldName = 'atrasojuros'
    end
    object qryContratosImoveisdebitovenda: TIntegerField
      FieldName = 'debitovenda'
    end
    object qryContratosImoveisobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 512
    end
  end
  object qryParcelasImoveis: TtecQuery
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
        Name = 'Contrato'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'SELECT pi.Contrato,'
      '       pi.Tipo,'
      '       pi.Origem,'
      '       pi.Numero,'
      '       pi.NrPagto,'
      '       pi.DataVencto,'
      '       pi.ValorHistorico,'
      '       pi.ValorContratado,'
      '       pi.Datapagto,'
      
        '       (CASE WHEN pi.Datapagto IS NULL THEN NULL ELSE pi.ValorPa' +
        'gto END) AS ValorPagto,'
      '       pi.moeda,'
      
        '       (select m.descricao from moedas m where pi.moeda = m.codi' +
        'go) as DescricaoMoeda,'
      '       pi.Database,'
      '       pi.TaxaJuros,'
      '       pi.Juroscompostos,'
      '       pi.promissoria,'
      '       pi.banco,'
      
        '      (SELECT b.sigla FROM bancos b where b.codigo = pi.banco) A' +
        'S NomeBanco,'
      '       pi.documento,'
      '       pi.observacoes,'
      '       pi.tipopagto,'
      
        '       (Select vi.indexadoraposhabitese from vendasimoveis vi wh' +
        'ere vi.contrato = pi.contrato) as Indexadoraposhabitese,'
      
        '       (Select vi.juros from vendasimoveis vi where vi.contrato ' +
        '= pi.contrato) as Jurosaposhabitese'
      'FROM parcelasimoveis pi'
      'WHERE %Contrato'
      'ORDER BY pi.Tipo, pi.Numero, pi.NrPagto'
      ''
      ''
      ''
      '    '
      ''
      '')
    RequestLive = False
    Left = 56
    Top = 72
    object qryParcelasImoveiscontrato: TIntegerField
      FieldName = 'contrato'
      Required = True
      DisplayFormat = '0'
    end
    object qryParcelasImoveistipo: TStringField
      FieldName = 'tipo'
      Required = True
      Size = 1
    end
    object qryParcelasImoveisorigem: TStringField
      FieldName = 'origem'
      Size = 8
    end
    object qryParcelasImoveisnumero: TIntegerField
      FieldName = 'numero'
      Required = True
      DisplayFormat = '0'
    end
    object qryParcelasImoveisnrpagto: TIntegerField
      FieldName = 'nrpagto'
      Required = True
      DisplayFormat = '0'
    end
    object qryParcelasImoveisdatavencto: TDateField
      Alignment = taCenter
      FieldName = 'datavencto'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasImoveisvalorhistorico: TFloatField
      FieldName = 'valorhistorico'
      DisplayFormat = '0.00'
    end
    object qryParcelasImoveisvalorcontratado: TFloatField
      FieldName = 'valorcontratado'
      DisplayFormat = '0.00'
    end
    object qryParcelasImoveisdatapagto: TDateField
      Alignment = taCenter
      FieldName = 'datapagto'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasImoveisvalorpagto: TFloatField
      FieldName = 'valorpagto'
      DisplayFormat = '0.00'
    end
    object qryParcelasImoveismoeda: TStringField
      FieldName = 'moeda'
      Size = 10
    end
    object qryParcelasImoveisdescricaomoeda: TStringField
      FieldName = 'descricaomoeda'
      Size = 50
    end
    object qryParcelasImoveisdatabase: TDateField
      Alignment = taCenter
      FieldName = 'database'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasImoveistaxajuros: TFloatField
      FieldName = 'taxajuros'
      DisplayFormat = '0.00'
    end
    object qryParcelasImoveisjuroscompostos: TBooleanField
      FieldName = 'juroscompostos'
    end
    object qryParcelasImoveispromissoria: TBooleanField
      FieldName = 'promissoria'
    end
    object qryParcelasImoveisbanco: TIntegerField
      FieldName = 'banco'
      DisplayFormat = '0'
    end
    object qryParcelasImoveisnomebanco: TStringField
      FieldName = 'nomebanco'
      Size = 50
    end
    object qryParcelasImoveisdocumento: TStringField
      FieldName = 'documento'
      Size = 12
    end
    object qryParcelasImoveisobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 200
    end
    object qryParcelasImoveistipopagto: TStringField
      FieldName = 'tipopagto'
      Size = 1
    end
    object qryParcelasImoveisindexadoraposhabitese: TStringField
      FieldName = 'indexadoraposhabitese'
      Size = 1
    end
    object qryParcelasImoveisjurosaposhabitese: TFloatField
      FieldName = 'jurosaposhabitese'
    end
  end
  object qryImoveisContrato: TtecQuery
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
      'Select iv.contrato,'
      '       e.codigo as CodigoEmpreendimento,'
      '       e.nome as NomeEmpreendimento,'
      '       e.datahabitese,'
      '       iv.bloco,'
      '       b.descricao as nomebloco,'
      '       iv.numero,'
      '       tu.codigo as Unidade,'
      '       tu.nome as TipoUnidade,'
      '       i.pavimento,'
      '       i.situacao,'
      '       i.areaprivativa,'
      '       i.areacomum,'
      '       cast(null as numeric) as AreaTotal,'
      '       i.fracaoideal,'
      '       i.valor,'
      '       iv.valor as precovendido,'
      '       iv.observacoes'
      
        'from imoveisvendidos iv left join (imoveis i join tiposunidades ' +
        'tu on i.unidade = tu.codigo)on iv.bloco = i.bloco and iv.numero ' +
        '= i.numero'
      
        '                        left join (blocos b join empreendimentos' +
        ' e on b.empreendimento = e.codigo) on iv.bloco = b.codigo'
      'where iv.contrato =:Contrato')
    RequestLive = False
    Left = 56
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptUnknown
      end>
    object qryImoveisContratocontrato: TIntegerField
      FieldName = 'contrato'
    end
    object qryImoveisContratocodigoempreendimento: TIntegerField
      FieldName = 'codigoempreendimento'
    end
    object qryImoveisContratonomeempreendimento: TStringField
      FieldName = 'nomeempreendimento'
      Size = 60
    end
    object qryImoveisContratodatahabitese: TDateField
      FieldName = 'datahabitese'
    end
    object qryImoveisContratobloco: TIntegerField
      FieldName = 'bloco'
      Required = True
    end
    object qryImoveisContratonomebloco: TStringField
      FieldName = 'nomebloco'
      Size = 40
    end
    object qryImoveisContratonumero: TStringField
      FieldName = 'numero'
      Size = 6
    end
    object qryImoveisContratounidade: TIntegerField
      FieldName = 'unidade'
    end
    object qryImoveisContratotipounidade: TStringField
      FieldName = 'tipounidade'
      Size = 15
    end
    object qryImoveisContratopavimento: TStringField
      FieldName = 'pavimento'
    end
    object qryImoveisContratosituacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
    object qryImoveisContratoareaprivativa: TFloatField
      FieldName = 'areaprivativa'
    end
    object qryImoveisContratoareacomum: TFloatField
      FieldName = 'areacomum'
    end
    object qryImoveisContratoareatotal: TFloatField
      FieldName = 'areatotal'
    end
    object qryImoveisContratofracaoideal: TFloatField
      FieldName = 'fracaoideal'
    end
    object qryImoveisContratovalor: TFloatField
      FieldName = 'valor'
    end
    object qryImoveisContratoprecovendido: TFloatField
      FieldName = 'precovendido'
    end
    object qryImoveisContratoobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 200
    end
  end
  object qryImoveis: TtecQuery
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
      'Select i.bloco,'
      '       i.numero,'
      '       i.situacao,'
      '       i.pavimento,'
      '       i.valor,'
      '       i.observacoes'
      'from imoveis i'
      'where i.bloco =  :Bloco'
      '  and i.numero = :Numero')
    RequestLive = False
    Left = 56
    Top = 200
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
      end>
    object qryImoveisbloco: TIntegerField
      FieldName = 'bloco'
    end
    object qryImoveisnumero: TStringField
      FieldName = 'numero'
      Size = 6
    end
    object qryImoveissituacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
    object qryImoveispavimento: TStringField
      FieldName = 'pavimento'
    end
    object qryImoveisvalor: TFloatField
      FieldName = 'valor'
    end
    object qryImoveisobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 512
    end
  end
  object qryEmpreendimentos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryEmpreendimentosAfterOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'Select  e.codigo,'
      '        e.nome,'
      '        e.sigla,'
      '        e.rua,'
      '        e.numero,'
      '        e.complemento,'
      '        e.estado,'
      '        e.cidade,'
      '        e.bairro,'
      '        e.cep,'
      '        e.datahabitese,'
      '        e.observacoes,'
      '        e.contavenda,'
      '        e.contacofins,'
      '        e.contacsll,'
      '        e.contairpj,'
      '        e.contapis,'
      '        e.debitocustos,'
      '        e.creditocustos,'
      '        e.debitovendachaves,'
      '        e.creditovendachaves,'
      '        e.debitocustochaves,'
      '        e.creditoatualizacaomonetaria'
      'from Empreendimentos e'
      'Where e.codigo = :Empreendimento')
    RequestLive = False
    Left = 56
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Empreendimento'
        ParamType = ptUnknown
      end>
    object qryEmpreendimentoscodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object qryEmpreendimentosnome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object qryEmpreendimentossigla: TStringField
      FieldName = 'sigla'
      Size = 10
    end
    object qryEmpreendimentosrua: TStringField
      FieldName = 'rua'
      Required = True
      Size = 100
    end
    object qryEmpreendimentosnumero: TIntegerField
      FieldName = 'numero'
    end
    object qryEmpreendimentoscomplemento: TStringField
      FieldName = 'complemento'
      Size = 100
    end
    object qryEmpreendimentosestado: TStringField
      FieldName = 'estado'
      Required = True
      Size = 2
    end
    object qryEmpreendimentoscidade: TIntegerField
      FieldName = 'cidade'
      Required = True
    end
    object qryEmpreendimentosbairro: TIntegerField
      FieldName = 'bairro'
      Required = True
    end
    object qryEmpreendimentoscep: TIntegerField
      FieldName = 'cep'
      Required = True
    end
    object qryEmpreendimentosdatahabitese: TDateField
      FieldName = 'datahabitese'
    end
    object qryEmpreendimentosobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 512
    end
    object qryEmpreendimentoscontavenda: TIntegerField
      FieldName = 'contavenda'
    end
    object qryEmpreendimentoscontacofins: TIntegerField
      FieldName = 'contacofins'
    end
    object qryEmpreendimentoscontacsll: TIntegerField
      FieldName = 'contacsll'
    end
    object qryEmpreendimentoscontairpj: TIntegerField
      FieldName = 'contairpj'
    end
    object qryEmpreendimentoscontapis: TIntegerField
      FieldName = 'contapis'
    end
    object qryEmpreendimentosdebitocustos: TIntegerField
      FieldName = 'debitocustos'
    end
    object qryEmpreendimentoscreditocustos: TIntegerField
      FieldName = 'creditocustos'
    end
    object qryEmpreendimentosdebitovendachaves: TIntegerField
      FieldName = 'debitovendachaves'
    end
    object qryEmpreendimentoscreditovendachaves: TIntegerField
      FieldName = 'creditovendachaves'
    end
    object qryEmpreendimentosdebitocustochaves: TIntegerField
      FieldName = 'debitocustochaves'
    end
    object qryEmpreendimentoscreditoatualizacaomonetaria: TIntegerField
      FieldName = 'creditoatualizacaomonetaria'
    end
  end
  object qryValoresParcelas: TtecQuery
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
      'SELECT'
      
        '   (SELECT ValorDevido(pi.Contrato, pi.Tipo, pi.Numero, pi.NrPag' +
        'to,'
      '                           (CASE WHEN pi.Datapagto IS NULL'
      '                                 THEN CURRENT_DATE'
      '                                 ELSE pi.Datapagto'
      '                            END))) AS ValorDevido,'
      ''
      
        '       (SELECT ValorCorrigido(pi.Contrato, pi.Tipo, pi.Numero, p' +
        'i.NrPagto,'
      '                             (CASE WHEN pi.Datapagto IS NULL'
      '                                   THEN CURRENT_DATE'
      '                                   ELSE pi.Datapagto'
      '                              END),true)) AS ValorCorrigido,'
      ''
      
        '       (SELECT JurosContratuais(pi.Contrato, pi.Tipo, pi.Numero,' +
        ' pi.NrPagto,'
      '                               (CASE WHEN pi.Datapagto IS NULL'
      '                                   THEN CURRENT_DATE'
      '                                   ELSE pi.Datapagto'
      '                                END))) AS Juros,'
      ''
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
      'FROM parcelasimoveis pi'
      'Where pi.contrato = :Contrato ')
    RequestLive = False
    Left = 200
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptUnknown
      end>
    object qryValoresParcelasvalordevido: TFloatField
      FieldName = 'valordevido'
      DisplayFormat = '0.00'
    end
    object qryValoresParcelasvalorcorrigido: TFloatField
      FieldName = 'valorcorrigido'
      DisplayFormat = '0.00'
    end
    object qryValoresParcelasjuros: TFloatField
      FieldName = 'juros'
      DisplayFormat = '0.00'
    end
    object qryValoresParcelascorrecao: TFloatField
      FieldName = 'correcao'
      DisplayFormat = '0.00'
    end
    object qryValoresParcelasdiferenca: TFloatField
      FieldName = 'diferenca'
      DisplayFormat = '0.00'
    end
  end
  object dsrValoresParcelas: TtecDataSource
    DataSet = qryValoresParcelas
    Left = 224
    Top = 32
  end
  object qryContratosEmpreendimento: TtecQuery
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
      'Select distinct iv.contrato'
      
        'from imoveisvendidos iv join (blocos b join empreendimentos e on' +
        ' b.empreendimento = e.codigo) on iv.bloco = b.codigo'
      'where e.codigo = :Empreendimento')
    RequestLive = False
    Left = 208
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Empreendimento'
        ParamType = ptUnknown
      end>
    object qryContratosEmpreendimentocontrato: TIntegerField
      FieldName = 'contrato'
    end
  end
  object dsrContratosEmpreendimento: TtecDataSource
    DataSet = qryContratosEmpreendimento
    Left = 232
    Top = 120
  end
  object qryValorCorrecao: TtecQuery
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
      
        'Select valorCorrigido(:Contrato,:TipoParcela,:NumeroPArcel,:NrPa' +
        'gtoParcela,:Data,true) as Valor;')
    RequestLive = False
    Left = 216
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TipoParcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NumeroPArcel'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NrPagtoParcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Data'
        ParamType = ptUnknown
      end>
    object qryValorCorrecaovalor: TFloatField
      FieldName = 'valor'
    end
  end
end
