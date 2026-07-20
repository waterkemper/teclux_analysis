inherited dtmLerRetornos: TdtmLerRetornos
  Left = 405
  Top = 277
  Height = 465
  Width = 973
  object dsrParcelas: TtecDataSource
    DataSet = qryParcelas
    Left = 90
    Top = 81
  end
  object qryParcelas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryParcelasAfterOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'contratosparcelas'
        ParamType = ptUnknown
        Value = 'and false'
      end>
    Sql.Strings = (
      'Select p.contrato,'
      '       p.numero,'
      '      (SELECT max(n.Numero)'
      '          FROM Notas n, DadosFiscais df'
      '          WHERE n.DadoFiscal = df.Numero AND'
      '                ct.Numero    = df.Contrato) AS NrNota,'
      '       p.nossonumero,'
      '       p.datavencto,'
      '       p.valorvencto,'
      '       p.datapagto,'
      '       p.valorpagto,'
      '       p.remessa, p.formapagamento,'
      '       ct.cliente,'
      '       ct.nome,'
      '       ct.filialvenda,'
      '       ct.faturamento,'
      '       ct.pessoatipo,'
      '       ct.iddocumento as documento,'
      '       ct.rua,'
      '       ct.pessoanumero as inscricao,'
      '       ct.cep,'
      '       f.nome as nomefilial,'
      '       ct.situacao as SituacaoContrato,'
      '       '#39#39' as motivo,'
      '       p.transacao,'
      '       p.filialpagto,'
      '       p.tiporecebimento,'
      '       p.parcelaorigem,'
      '       p.parcelaoriginal,'
      '       p.pagamentoextracaixa,'
      '       p.evento,'
      '       p.contaboleto,'
      '       False as JaVerificada,'
      '       false as desmembrada,'
      '       contratos_atual(ct.numero) as contratoatual,'
      '       (select ps.contrato'
      '        from pedidos_site ps'
      '        where ps.contrato = ct.numero) as ExistePedidoSite,'
      '        cast(null as date) as datapagtoboleto,'
      '       p.datacredito,'
      '        cast(null as numeric(12,2)) as valorpagtoboleto,'
      '       contratos_atual(ct.numero) as contratos_atual,'
      '       contrato_atual(ct.numero) as atual'
      ''
      ''
      'From  parcelas p, contratos ct, /*clientes c,*/ filiais f'
      'Where p.contrato  = ct.numero and'
      '/*      ct.cliente = c.codigo and*/'
      '      ct.filialvenda = f.codigo and'
      ''
      '     ((ct.situacao in ('#39'F'#39','#39'N'#39','#39'P'#39','#39'C'#39') or'
      
        '      ((ct.situacao = '#39'O'#39' OR ct.situacao = '#39'R'#39') /* and exists (s' +
        'elect ps.contrato'
      
        '                                                             fro' +
        'm pedidos_site ps'
      
        '                                                             whe' +
        're ps.contrato = ct.numero) */ )))'
      '/*      and contratos_atual(ct.numero)*/'
      ''
      '      %filial'
      '      %contratosparcelas'
      ''
      
        'Order by UPPER(TO_ASCII(ct.nome,'#39'LATIN1'#39')), p.contrato, p.datave' +
        'ncto'
      '')
    RequestLive = True
    Left = 20
    Top = 81
    object qryParcelasContrato: TStringField
      DisplayWidth = 20
      FieldName = 'Contrato'
      Required = True
    end
    object qryParcelasNumero: TIntegerField
      DisplayWidth = 2
      FieldName = 'Numero'
      Required = True
      DisplayFormat = '0'
    end
    object qryParcelasDataVencto: TDateField
      Alignment = taCenter
      DisplayLabel = 'DataVencto'
      FieldName = 'datavencto'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasvalorvencto: TFloatField
      FieldName = 'valorvencto'
      Required = True
      DisplayFormat = '#,###,##0.00'
      EditFormat = '#,###,##0.00'
    end
    object qryParcelasdatapagto: TDateField
      Alignment = taCenter
      FieldName = 'datapagto'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasvalorpagto: TFloatField
      FieldName = 'valorpagto'
      DisplayFormat = '#,###,##0.00'
      EditFormat = '#,###,##0.00'
    end
    object qryParcelasremessa: TStringField
      DisplayWidth = 10
      FieldName = 'remessa'
      Size = 8
    end
    object qryParcelascliente: TIntegerField
      DisplayWidth = 6
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object qryParcelasnome: TStringField
      DisplayWidth = 40
      FieldName = 'nome'
      Size = 60
    end
    object qryParcelasfilialvenda: TIntegerField
      FieldName = 'filialvenda'
      DisplayFormat = '0'
    end
    object qryParcelasfaturamento: TDateField
      Alignment = taCenter
      FieldName = 'faturamento'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelaspessoatipo: TStringField
      FieldName = 'pessoatipo'
      Size = 1
    end
    object qryParcelasdocumento: TStringField
      FieldName = 'documento'
    end
    object qryParcelasrua: TStringField
      FieldName = 'rua'
      Size = 100
    end
    object qryParcelasinscricao: TStringField
      FieldName = 'inscricao'
      Size = 14
    end
    object qryParcelascep: TIntegerField
      FieldName = 'cep'
      DisplayFormat = '0'
    end
    object qryParcelasnomefilial: TStringField
      DisplayWidth = 40
      FieldName = 'nomefilial'
      Size = 60
    end
    object qryParcelasmotivo: TStringField
      DisplayWidth = 200
      FieldName = 'motivo'
      Size = 50
    end
    object qryParcelasformapagamento: TStringField
      FieldName = 'formapagamento'
      Size = 1
    end
    object qryParcelasnrdocumento: TIntegerField
      FieldName = 'NrNota'
      DisplayFormat = '0'
    end
    object qryParcelassituacaocontrato: TStringField
      FieldName = 'situacaocontrato'
      Size = 1
    end
    object qryParcelasnossonumero: TLargeintField
      FieldName = 'nossonumero'
    end
    object qryParcelastransacao: TIntegerField
      FieldName = 'transacao'
      DisplayFormat = '0'
    end
    object qryParcelasfilialpagto: TIntegerField
      FieldName = 'filialpagto'
      DisplayFormat = '0'
    end
    object qryParcelastiporecebimento: TIntegerField
      FieldName = 'tiporecebimento'
      DisplayFormat = '0'
    end
    object qryParcelasparcelaorigem: TStringField
      FieldName = 'parcelaorigem'
      Size = 7
    end
    object qryParcelasparcelaoriginal: TIntegerField
      FieldName = 'parcelaoriginal'
      DisplayFormat = '0'
    end
    object qryParcelasdesmembrada: TBooleanField
      FieldName = 'desmembrada'
    end
    object qryParcelaspagamentoextracaixa: TBooleanField
      FieldName = 'pagamentoextracaixa'
    end
    object qryParcelasjaverificada: TBooleanField
      FieldName = 'javerificada'
    end
    object qryParcelasevento: TIntegerField
      FieldName = 'evento'
      DisplayFormat = '0'
    end
    object qryParcelascontaboleto: TIntegerField
      FieldName = 'contaboleto'
      DisplayFormat = '0'
    end
    object qryParcelascontratoatual: TBooleanField
      FieldName = 'contratoatual'
    end
    object qryParcelasexistepedidosite: TStringField
      FieldName = 'existepedidosite'
    end
    object qryParcelasdatapagtoboleto: TDateField
      Alignment = taCenter
      FieldName = 'datapagtoboleto'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasvalorpagtoboleto: TFloatField
      FieldName = 'valorpagtoboleto'
      DisplayFormat = '0.00'
    end
    object qryParcelascontratos_atual: TBooleanField
      FieldName = 'contratos_atual'
    end
    object qryParcelasatual: TStringField
      DisplayWidth = 20
      FieldName = 'atual'
      Size = 50
    end
    object qryParcelasdatacredito: TDateField
      Alignment = taCenter
      FieldName = 'datacredito'
      EditMask = '99/99/9999;1; '
    end
  end
  object qryFiliais: TtecQuery
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
      '            nome,'
      '            inscricaoestadual,'
      '            cnpj'
      ''
      'From    filiais'
      'Where codigo=:codigo')
    RequestLive = True
    Left = 20
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryFiliaiscodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryFiliaisnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryFiliaisinscricaoestadual: TStringField
      FieldName = 'inscricaoestadual'
    end
    object qryFiliaiscnpj: TStringField
      FieldName = 'cnpj'
      Size = 14
    end
  end
  object dsrFiliais: TtecDataSource
    DataSet = qryFiliais
    Left = 90
    Top = 16
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
      'Select nome,'
      '           codigo'
      'From   filiais'
      'Order By UPPER(TO_ASCII(nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 172
    Top = 16
    object qryConsultaFiliaisnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaFiliaiscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
  object qryContas: TtecQuery
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
      'SELECT c.Banco,'
      '       c.Agencia,'
      '       c.Conta,'
      '       c.Digito,'
      '       c.Titular,'
      '       b.Sigla,'
      ''
      '       b.ModeloCheque,'
      '       a.Nome,'
      '       c.bancoreferencia,'
      '       c.convenio,'
      '       c.variacao_carteira,'
      '       formatacao_convenio,'
      '       formatacao_nosso_numero,'
      '       valor_isencao_taxa,'
      '       agenciareferencia,'
      '       cnpj_agencia_referencia,'
      '       cedente_nome,'
      '       codigo_singular,'
      '       c.tiporecebimento,'
      '       c.filial'
      ''
      ''
      'FROM   contas c JOIN Bancos b   ON c.Banco   = b.Codigo'
      '                JOIN Agencias a ON c.Banco   = a.Banco AND'
      '                                   c.Agencia = a.Codigo'
      ''
      'WHERE  c.Conta = :Conta'
      '')
    RequestLive = True
    Left = 19
    Top = 147
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Conta'
        ParamType = ptUnknown
      end>
    object qryContasBanco: TIntegerField
      FieldName = 'Banco'
      Required = True
      DisplayFormat = '0'
    end
    object qryContasAgencia: TIntegerField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'Agencia'
      Required = True
      DisplayFormat = '0'
    end
    object qryContasConta: TIntegerField
      FieldName = 'Conta'
      Required = True
      DisplayFormat = '0'
    end
    object qryContasDigito: TStringField
      DisplayLabel = 'D'#237'gito'
      FieldName = 'Digito'
      Required = True
      Size = 2
    end
    object qryContasTitular: TStringField
      FieldName = 'Titular'
      Size = 50
    end
    object qryContasSigla: TStringField
      FieldName = 'Sigla'
      Size = 10
    end
    object qryContasNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
    object qryContasModeloCheque: TIntegerField
      FieldName = 'ModeloCheque'
      DisplayFormat = '0'
    end
    object qryContasbancoreferencia: TStringField
      FieldName = 'bancoreferencia'
      Size = 3
    end
    object qryContasconvenio: TLargeintField
      FieldName = 'convenio'
    end
    object qryContasvariacao_carteira: TStringField
      FieldName = 'variacao_carteira'
      Size = 50
    end
    object qryContasformatacao_convenio: TStringField
      FieldName = 'formatacao_convenio'
      Size = 50
    end
    object qryContasformatacao_nosso_numero: TStringField
      FieldName = 'formatacao_nosso_numero'
      Size = 50
    end
    object qryContasvalor_isencao_taxa: TFloatField
      FieldName = 'valor_isencao_taxa'
      DisplayFormat = '0.00'
    end
    object qryContasagenciareferencia: TIntegerField
      FieldName = 'agenciareferencia'
      DisplayFormat = '0'
    end
    object qryContascnpj_agencia_referencia: TStringField
      FieldName = 'cnpj_agencia_referencia'
      Size = 14
    end
    object qryContascedente_nome: TStringField
      FieldName = 'cedente_nome'
      Size = 100
    end
    object qryContascodigo_singular: TLargeintField
      FieldName = 'codigo_singular'
    end
    object qryContastiporecebimento: TIntegerField
      FieldName = 'tiporecebimento'
    end
    object qryContasfilial: TIntegerField
      FieldName = 'filial'
    end
  end
  object dsrContas: TtecDataSource
    DataSet = qryContas
    Left = 92
    Top = 147
  end
  object qryConsultaContas: TtecQuery
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
    DataSource = dsrContas
    Sql.Strings = (
      'SELECT b.Sigla,'
      '       a.Nome,'
      '       c.Conta,'
      '       c.Digito,'
      '       c.Titular,'
      '       c.Banco,'
      '       c.Agencia,'
      '       b.ModeloCheque'
      ''
      'FROM   Contas c JOIN Bancos b   ON c.Banco   = b.Codigo'
      '                JOIN Agencias a ON c.Banco   = a.Banco AND'
      '                                   c.Agencia = a.Codigo'
      ''
      
        'ORDER BY b.Sigla, UPPER(TO_ASCII(a.nome,'#39'LATIN1'#39')), UPPER(TO_ASC' +
        'II(c.titular,'#39'LATIN1'#39'))'
      '')
    RequestLive = True
    Left = 172
    Top = 147
    object qryConsultaContasSigla: TStringField
      FieldName = 'Sigla'
      Size = 10
    end
    object qryConsultaContasNome: TStringField
      DisplayLabel = 'Nome da Ag'#234'ncia'
      FieldName = 'Nome'
      Size = 30
    end
    object qryConsultaContasConta: TIntegerField
      FieldName = 'Conta'
      DisplayFormat = '0'
    end
    object qryConsultaContasDigito: TStringField
      Alignment = taCenter
      DisplayLabel = 'D'
      FieldName = 'Digito'
      Size = 2
    end
    object qryConsultaContasTitular: TStringField
      FieldName = 'Titular'
      Size = 50
    end
    object qryConsultaContasAgencia: TIntegerField
      FieldName = 'Agencia'
      Visible = False
      DisplayFormat = '0'
    end
    object qryConsultaContasBanco: TIntegerField
      FieldName = 'Banco'
      Visible = False
      DisplayFormat = '0'
    end
  end
  object qryParcelas_CLIENTE_USA_CONTRATO: TtecQuery
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
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'contratosparcelas'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'Select p.contrato,'
      '       p.numero,'
      '       cast(null as integer) as nrdocumento,'
      '       p.datavencto,'
      '       p.valorvencto,'
      '       p.datapagto,'
      '       p.valorpagto,'
      '       p.remessa,'
      '       p.formapagamento,'
      '       ct.cliente,'
      '       ct.nome,'
      '       ct.filialvenda,'
      '       ct.faturamento,'
      '       ct.pessoatipo,'
      '       ct.iddocumento as documento,'
      '       ct.rua,'
      '       ct.pessoanumero as inscricao,'
      '       ct.cep,'
      '       f.nome as nomefilial,'
      '       '#39#39' as motivo'
      'From  parcelas p, contratos ct, clientes c, filiais f'
      'Where p.contrato  = ct.numero'
      '      and ct.cliente = c.codigo'
      '      and ct.filialvenda = f.codigo'
      '  /*  and p.datapagto is null */'
      '      and ct.situacao in ('#39'F'#39','#39'N'#39','#39'P'#39')'
      '      and contratos_atual(ct.numero)'
      ''
      '      %filial'
      '      %contratosparcelas'
      '      '
      
        'Order by UPPER(TO_ASCII(ct.nome,'#39'LATIN1'#39')), p.contrato, p.datave' +
        'ncto')
    RequestLive = True
    Left = 362
    Top = 12
  end
  object qryParcelas_CLIENTE_NFE_NAO_USA_CONTRATO: TtecQuery
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
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'contratosparcelas'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'Select p.contrato,'
      '       p.numero,'
      '       n.numero as nrdocumento,'
      '       p.datavencto,'
      '       p.valorvencto,'
      '       p.datapagto,'
      '       p.valorpagto,'
      '       p.remessa,'
      '       p.formapagamento,'
      '       ct.cliente,'
      '       ct.nome,'
      '       ct.filialvenda,'
      '       ct.faturamento,'
      '       ct.pessoatipo,'
      '       ct.iddocumento as documento,'
      '       ct.rua,'
      '       ct.pessoanumero as inscricao,'
      '       ct.cep,'
      '       f.nome as nomefilial,'
      '       '#39#39' as motivo'
      
        'From  parcelas p, contratos ct, dadosfiscais df, notas n, client' +
        'es c, filiais f,'
      'Where p.contrato  = ct.numero and'
      '      ct.cliente = c.codigo and'
      '      ct.filialvenda = f.codigo and'
      '      ct.numero = df.contrato and'
      '      df.numero = n.dadofiscal and'
      '      ct.situacao in ('#39'F'#39','#39'N'#39','#39'P'#39') and'
      '      contratos_atual(ct.numero)'
      ''
      '      %filial'
      '      %contratosparcelas'
      ''
      
        'Order by UPPER(TO_ASCII(ct.nome,'#39'LATIN1'#39')), p.contrato, p.datave' +
        'ncto'
      '')
    RequestLive = True
    Left = 394
    Top = 28
  end
  object ACBrBoleto1: TACBrBoleto
    Banco.TamanhoMaximoNossoNum = 10
    Banco.TipoCobranca = cobNenhum
    Banco.LayoutVersaoArquivo = 0
    Banco.LayoutVersaoLote = 0
    Banco.CasasDecimaisMoraJuros = 2
    Cedente.TipoInscricao = pJuridica
    NumeroArquivo = 0
    LeCedenteRetorno = True
    Configuracoes.Arquivos.LogRegistro = False
    Configuracoes.WebService.SSLHttpLib = httpOpenSSL
    Configuracoes.WebService.StoreName = 'My'
    Configuracoes.WebService.Ambiente = taHomologacao
    Configuracoes.WebService.Operacao = tpInclui
    Configuracoes.WebService.VersaoDF = '1.2'
    Left = 312
    Top = 192
  end
  object spcTransacaoProximo: TtecQuery
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
      'Select transacao_proximocodigo() as transacao')
    RequestLive = False
    Left = 460
    Top = 202
    object spcTransacaoProximotransacao: TIntegerField
      FieldName = 'transacao'
    end
  end
  object spcRecebimentosProximo: TtecQuery
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
      'Select recebimentos_proximocodigo() as codigo')
    RequestLive = False
    Left = 456
    Top = 152
    object spcRecebimentosProximocodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object qryRecebimentos: TtecQuery
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
      'select codigo,'
      '       tiporecebimento,'
      '       controle,'
      '       controlerecebimento, '
      '       valorlancto,'
      '       datalancto,'
      '       datavencto,'
      '       transacao,'
      '       cheque,'
      '       situacao,'
      '       filial,'
      '       tef'
      'from recebimentos'
      'where false')
    RequestLive = True
    Left = 456
    Top = 104
    object qryRecebimentoscodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
    object qryRecebimentostiporecebimento: TIntegerField
      FieldName = 'tiporecebimento'
      DisplayFormat = '0'
    end
    object qryRecebimentostransacao: TIntegerField
      FieldName = 'transacao'
      Required = True
      DisplayFormat = '0'
    end
    object qryRecebimentosvalorlancto: TFloatField
      FieldName = 'valorlancto'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryRecebimentosdatalancto: TDateTimeField
      FieldName = 'datalancto'
    end
    object qryRecebimentoscheque: TStringField
      FieldName = 'cheque'
      Size = 30
    end
    object qryRecebimentossituacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
    object qryRecebimentosfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryRecebimentosdatavencto: TDateField
      Alignment = taCenter
      FieldName = 'datavencto'
      EditMask = '99/99/9999;1; '
    end
    object qryRecebimentoscontrole: TIntegerField
      FieldName = 'controle'
      DisplayFormat = '0'
    end
    object qryRecebimentoscontrolerecebimento: TIntegerField
      FieldName = 'controlerecebimento'
    end
    object qryRecebimentostef: TStringField
      FieldName = 'tef'
      Size = 12
    end
  end
  object qryInserirParcelaParcial: TtecQuery
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
      'insert into parcelas'
      
        '  (contrato, numero, datavencto, valorvencto, parcelaorigem, par' +
        'celaoriginal, tiporecebimento, formapagamento, cliente, nome)'
      'values'
      
        '  (cast(:contrato as varchar), :numero, :datavencto, :valorvenct' +
        'o, :parcelaorigem, :parcelaoriginal, :tiporecebimento, :formapag' +
        'amento, :cliente, :nome)'
      '')
    RequestLive = False
    Left = 592
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datavencto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'valorvencto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'parcelaorigem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'parcelaoriginal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tiporecebimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'formapagamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nome'
        ParamType = ptUnknown
      end>
  end
  object spcParcelasProximo: TtecQuery
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
      
        'select parcelas_proximonumero(cast(:contrato as varchar)) as num' +
        'ero')
    RequestLive = False
    Left = 592
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptUnknown
      end>
    object spcParcelasProximonumero: TIntegerField
      FieldName = 'numero'
    end
  end
  object qryParcelas_log: TtecQuery
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
      'select textcat_all(ct.contrato||'#39' '#39') as listacontrato'
      'from'
      '('
      
        ' select distinct contrato from parcelas_log where nossonumero = ' +
        ':nossonumero'
      ') as ct')
    RequestLive = False
    Left = 456
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nossonumero'
        ParamType = ptUnknown
      end>
    object qryParcelas_loglistacontrato: TMemoField
      FieldName = 'listacontrato'
      BlobType = ftMemo
    end
  end
  object cdsParcelas: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspParcelas'
    Left = 272
    Top = 88
    object cdsParcelasTotalvencto: TAggregateField
      Alignment = taRightJustify
      FieldName = 'Totalvencto'
      Active = True
      Expression = 'sum(valorvencto)'
    end
    object cdsParcelasTotalPagto: TAggregateField
      Alignment = taRightJustify
      FieldName = 'TotalPagto'
      Active = True
      Expression = 'sum(valorpagto)'
    end
    object cdsParcelasTotalRecebidoBoleto: TAggregateField
      Alignment = taRightJustify
      FieldName = 'TotalRecebidoBoleto'
      Active = True
      Expression = 'sum(valorpagtoboleto)'
    end
  end
  object dspParcelas: TDataSetProvider
    DataSet = qryParcelas
    Left = 336
    Top = 104
  end
  object dsrcdsParcelas: TDataSource
    DataSet = cdsParcelas
    Left = 288
    Top = 136
  end
  object qryemail_boleto_pago: TtecQuery
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
      'select ebp.*'
      'from email_boleto_pago ebp'
      'where false')
    RequestLive = True
    Left = 104
    Top = 264
    object qryemail_boleto_pagocontrato: TStringField
      FieldName = 'contrato'
    end
  end
  object qryretorno_cobranca: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryretorno_cobrancaAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'condicao'
        ParamType = ptUnknown
        Value = 'and false'
      end>
    Sql.Strings = (
      'select rcob.codigo,'
      '       rcob.nomearquivo,'
      '       rcob.datahora,'
      '       rcob.conta,'
      '       (select bc.nome'
      '        from bancos bc'
      '        where bc.codigo = (select cta.banco'
      '                           from contas cta'
      '                           where cta.conta = rcob.conta)'
      '       ) as nomebanco,'
      ''
      '       (select sum(rcobt.valordocumento)'
      '        from retorno_cobranca_titulo rcobt'
      
        '        where rcobt.retorno_cobranca = rcob.codigo) as TotalRece' +
        'bidoBoleto,'
      ''
      '       (select sum(p.valorvencto)'
      '        from parcelas p'
      '             join retorno_cobranca_titulo rcobt'
      '             on rcobt.qualehnossonumero = p.nossonumero'
      
        '        where rcobt.retorno_cobranca = rcob.codigo) as Totalvenc' +
        'to,'
      ''
      '       (select sum(rcobt.valorrecebido)'
      '        from retorno_cobranca_titulo rcobt'
      
        '        where rcobt.retorno_cobranca = rcob.codigo) as TotalPagt' +
        'o'
      ''
      ''
      'from retorno_cobranca rcob'
      ''
      'where true'
      ''
      '  %condicao'
      ''
      'order by rcob.datahora'
      ''
      ''
      '/*   :datainicial :datafinal   */')
    RequestLive = True
    Left = 616
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end>
    object qryretorno_cobrancacodigo: TLargeintField
      FieldName = 'codigo'
    end
    object qryretorno_cobrancanomearquivo: TStringField
      FieldName = 'nomearquivo'
      Size = 100
    end
    object qryretorno_cobrancadatahora: TDateTimeField
      Alignment = taCenter
      FieldName = 'datahora'
      DisplayFormat = 'dd/MM/yy hh:mm'
      EditMask = '99/99/99 99:99;1; '
    end
    object qryretorno_cobrancaconta: TIntegerField
      FieldName = 'conta'
    end
    object qryretorno_cobrancanomebanco: TStringField
      FieldName = 'nomebanco'
      Size = 50
    end
    object qryretorno_cobrancatotalrecebidoboleto: TFloatField
      FieldName = 'totalrecebidoboleto'
      DisplayFormat = '0.00'
    end
    object qryretorno_cobrancatotalvencto: TFloatField
      FieldName = 'totalvencto'
      DisplayFormat = '0.00'
    end
    object qryretorno_cobrancatotalpagto: TFloatField
      FieldName = 'totalpagto'
      DisplayFormat = '0.00'
    end
  end
  object dsrretorno_cobranca: TtecDataSource
    DataSet = qryretorno_cobranca
    Left = 640
    Top = 200
  end
  object qryretorno_cobranca_titulo: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 'codigo=retorno_cobranca'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrretorno_cobranca
    Constraints = <>
    BeforeCancel = qryretorno_cobranca_tituloBeforeCancel
    AfterCancel = qryretorno_cobranca_tituloAfterCancel
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'condicao'
        ParamType = ptUnknown
        Value = 'and false'
      end>
    Sql.Strings = (
      'select rcobt.*,'
      ''
      '       (select p.contrato'
      '        from parcelas p'
      
        '        where p.nossonumero =  rcobt.qualehnossonumero) as contr' +
        'ato'
      ''
      ''
      'from retorno_cobranca_titulo rcobt,'
      '     retorno_cobranca rcob'
      ''
      ''
      'where rcob.codigo = rcobt.retorno_cobranca'
      '  %condicao'
      ''
      ''
      '/*   :datainicial :datafinal   */')
    RequestLive = True
    Left = 616
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end>
    object qryretorno_cobranca_tituloretorno_cobranca: TLargeintField
      FieldName = 'retorno_cobranca'
    end
    object qryretorno_cobranca_titulosequencia: TIntegerField
      FieldName = 'sequencia'
    end
    object qryretorno_cobranca_tituloseunumero: TStringField
      FieldName = 'seunumero'
      Size = 30
    end
    object qryretorno_cobranca_titulonossonumero: TStringField
      FieldName = 'nossonumero'
      Size = 30
    end
    object qryretorno_cobranca_tituloqualehnossonumero: TLargeintField
      FieldName = 'qualehnossonumero'
    end
    object qryretorno_cobranca_titulodataocorrencia: TDateField
      Alignment = taCenter
      FieldName = 'dataocorrencia'
      EditMask = '99/99/9999;1; '
    end
    object qryretorno_cobranca_titulonumerodocumento: TStringField
      FieldName = 'numerodocumento'
      Size = 30
    end
    object qryretorno_cobranca_titulovencimento: TDateField
      Alignment = taCenter
      FieldName = 'vencimento'
      EditMask = '99/99/9999;1; '
    end
    object qryretorno_cobranca_titulovalordocumento: TFloatField
      FieldName = 'valordocumento'
      DisplayFormat = '0.00'
    end
    object qryretorno_cobranca_titulovalorrecebido: TFloatField
      FieldName = 'valorrecebido'
      DisplayFormat = '0.00'
    end
    object qryretorno_cobranca_titulodatacredito: TDateField
      Alignment = taCenter
      FieldName = 'datacredito'
      EditMask = '99/99/9999;1; '
    end
    object qryretorno_cobranca_tituloobservacao: TStringField
      FieldName = 'observacao'
      Size = 200
    end
    object qryretorno_cobranca_titulocontrato: TStringField
      FieldName = 'contrato'
    end
  end
  object dsrretorno_cobranca_titulo: TtecDataSource
    DataSet = qryretorno_cobranca_titulo
    Left = 648
    Top = 280
  end
  object qryretorno_cobranca_proximocodigo: TtecQuery
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
      
        'select nextval('#39'retorno_cobranca_proximocodigo'#39') as codigo_retor' +
        'no')
    RequestLive = True
    Left = 752
    Top = 136
    object qryretorno_cobranca_proximocodigocodigo_retorno: TLargeintField
      FieldName = 'codigo_retorno'
    end
  end
  object qryRetornoCobrancaTexto: TtecQuery
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
      'select rcob.codigo,'
      '       rcob.conteudoarquivo'
      'from retorno_cobranca rcob'
      'where rcob.codigo = :codigo')
    RequestLive = True
    Left = 752
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryRetornoCobrancaTextocodigo: TLargeintField
      FieldName = 'codigo'
      Required = True
    end
    object qryRetornoCobrancaTextoconteudoarquivo: TMemoField
      FieldName = 'conteudoarquivo'
      BlobType = ftMemo
    end
  end
end
