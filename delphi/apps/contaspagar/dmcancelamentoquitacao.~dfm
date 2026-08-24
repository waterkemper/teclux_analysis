inherited dtmCancelamentoQuitacao: TdtmCancelamentoQuitacao
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 309
  Top = 176
  Height = 511
  Width = 660
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
      'SELECT f.Codigo,'
      '       f.Nome'
      ''
      'FROM   filiais f'
      ''
      'WHERE  f.Codigo = :Codigo')
    RequestLive = True
    Left = 53
    Top = 15
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Codigo'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryFilialCodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      DisplayFormat = '0'
    end
    object qryFilialNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
  end
  object dsrFilial: TtecDataSource
    DataSet = qryFilial
    Left = 172
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
      'SELECT f.Nome,'
      '       f.Codigo'
      ''
      'FROM   filiais f'
      ''
      'ORDER BY UPPER(TO_ASCII(f.nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 287
    Top = 15
    object qryConsultaFiliaisNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object qryConsultaFiliaiscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      DisplayFormat = '0'
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
      'SELECT g.Codigo,'
      '       g.Descricao'
      ''
      'FROM   gruposfiliais g'
      ''
      'WHERE  g.Codigo = :Codigo')
    RequestLive = True
    Left = 53
    Top = 70
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Codigo'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryGrupoFiliaisCodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      DisplayFormat = '0'
    end
    object qryGrupoFiliaisDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Size = 30
    end
  end
  object dsrGrupoFiliais: TtecDataSource
    DataSet = qryGrupoFiliais
    Left = 172
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
      'SELECT   g.Descricao,'
      '         g.Codigo'
      ''
      'FROM     gruposfiliais g'
      ''
      'ORDER BY UPPER(TO_ASCII(g.descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 287
    Top = 70
    object qryConsultaGrupoFiliaisDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Size = 30
    end
    object qryConsultaGrupoFiliaisCodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
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
      'SELECT vf.Codigo,'
      '       coalesce(vf.razao,vf.nome) as nome ,'
      '       vf.Tipo'
      ''
      'FROM   vfornecedores vf'
      ''
      'WHERE  vf.Tipo   = :Tipo AND'
      '       vf.Codigo = :Codigo')
    RequestLive = True
    Left = 53
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Codigo'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryFornecedoresCodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      DisplayFormat = '0'
    end
    object qryFornecedoresNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qryFornecedoresTipo: TStringField
      FieldName = 'Tipo'
    end
  end
  object dsrFornecedores: TtecDataSource
    DataSet = qryFornecedores
    Left = 172
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
    Macros = <
      item
        DataType = ftUnknown
        Name = 'Codigo'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'SELECT coalesce(v.razao,v.nome) as nome ,'
      '       v.Codigo,'
      '       v.Tipo,'
      '       Formatar_CPF_CNPJ(v.PessoaNumero) AS PessoaNumero,'
      '       Descricao_TipoCliente(v.Tipo) AS TipoCliente,'
      '       v.Estado,'
      '       c.Nome as NomeCidade'
      'FROM   vfornecedores v, cidades c'
      'WHERE  v.Estado = c.Estado'
      '       %Codigo'
      '  AND  v.Cidade = c.Codigo'
      'ORDER BY UPPER(TO_ASCII(coalesce(v.razao,v.nome),'#39'LATIN1'#39'))')
    RequestLive = True
    Left = 287
    Top = 128
    object qryConsultaFornecedoresNome: TStringField
      DisplayWidth = 40
      FieldName = 'Nome'
      Size = 40
    end
    object qryConsultaFornecedoresPessoaNumero: TStringField
      DisplayLabel = 'CPF ou CNPJ'
      FieldName = 'PessoaNumero'
      Size = 18
    end
    object qryConsultaFornecedoresNomeCidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'NomeCidade'
      Required = True
      Size = 30
    end
    object qryConsultaFornecedoresEstado: TStringField
      DisplayLabel = 'UF'
      FieldName = 'Estado'
      Size = 2
    end
    object qryConsultaFornecedoresCodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      DisplayFormat = '0'
    end
    object qryConsultaFornecedoresTipoCliente: TStringField
      DisplayLabel = 'Tipo Fornecedor'
      FieldName = 'tipocliente'
      Size = 14
    end
    object qryConsultaFornecedoresTipo: TStringField
      FieldName = 'Tipo'
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
    AfterInsert = qryDuplicatasAfterInsert
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'Pagamento'
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
      end
      item
        DataType = ftUnknown
        Name = 'Conta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ContaContabil'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Ordenacao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'SELECT d.Fornecedor AS Codigo,'
      '       d.TipoFornecedor,'
      ''
      
        '      (SELECT coalesce(v.razao,v.nome) as nome FROM  vfornecedor' +
        'es v'
      '                     WHERE d.Fornecedor = v.Codigo  AND'
      
        '                           d.TipoFornecedor = CAST(v.Tipo AS CHA' +
        'R)) AS Fornecedor,'
      ''
      '       t.DocumentoPag,'
      '                            /*'
      
        '       COALESCE(CAST(REPLACE(TRIM(TO_CHAR((SELECT n.Numero FROM ' +
        ' NotasPag n'
      
        '                                              WHERE n.DocumentoP' +
        'ag = t.DocumentoPag), '#39'999,999,999'#39')),'#39','#39','#39'.'#39') AS VARCHAR(15)),'
      ''
      
        '                cast(case when position('#39'/'#39' in d.complemento)<>0' +
        ' then SUBSTRING(d.Complemento FROM position('#39'/'#39' in d.complemento' +
        ') FOR length(d.complemento))'
      '                else d.complemento end as varchar(15))'
      ''
      '                ) AS NrNota,'
      ''
      '       COALESCE(CAST((SELECT n.Serie FROM  NotasPag n'
      
        '                                     WHERE n.DocumentoPag = t.Do' +
        'cumentoPag) AS VARCHAR),'
      ''
      
        '                cast(case when position('#39'/'#39' in d.complemento)<>0' +
        ' then SUBSTRING(d.Complemento FROM 1 FOR position('#39'/'#39' in d.compl' +
        'emento)-1)'
      '                else null end as varchar(3))'
      ''
      '                ) AS Serie,'
      '                */'
      ''
      '       d.complemento,'
      '       t.DataVencto,'
      ''
      '       t.DataPagto,'
      ''
      
        '       CASE WHEN PrimeiroDiaUtil(d.filialemissao, t.datavencto, ' +
        #39'P'#39') < t.DataPagto THEN'
      
        '                 ABS(PrimeiroDiaUtil(d.filialemissao, t.datavenc' +
        'to, '#39'P'#39') - t.DataPagto)'
      '            ELSE 0'
      '       END AS Atraso,'
      ''
      '       t.ValorPagto,'
      '       t.Numero,'
      '       t.ContaPagto,'
      '       t.ChequePagto,'
      '       t.ContaCredito,'
      '       false as Quitar'
      ''
      ''
      'FROM   duplicatas t, documentospag d'
      ''
      'WHERE  t.DocumentoPag = d.Numero AND'
      '       t.DataPagto IS NOT NULL'
      ''
      '%Pagamento'
      '%Filial'
      '%GrupoFilial'
      '%Fornecedor'
      '%Administrador'
      '%Conta'
      '%ContaContabil'
      '%Ordenacao'
      ''
      '')
    RequestLive = True
    Left = 53
    Top = 279
    object qryDuplicatasCodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      DisplayFormat = '###,##0'
    end
    object qryDuplicatasFornecedor: TStringField
      FieldName = 'Fornecedor'
      Size = 50
    end
    object qryDuplicatasTipoFornecedor: TStringField
      FieldName = 'TipoFornecedor'
      Required = True
      Size = 1
    end
    object qryDuplicatasDocumentoPag: TIntegerField
      DisplayLabel = 'Docto'
      FieldName = 'DocumentoPag'
      Required = True
      DisplayFormat = '###,##0'
    end
    object qryDuplicatasDataVencto: TDateField
      FieldName = 'DataVencto'
      Required = True
    end
    object qryDuplicatasDataPagto: TDateField
      FieldName = 'DataPagto'
    end
    object qryDuplicatasAtraso: TIntegerField
      FieldName = 'Atraso'
    end
    object qryDuplicatasValorPagto: TFloatField
      FieldName = 'ValorPagto'
      DisplayFormat = '###,##0.00'
    end
    object qryDuplicatasNumero: TIntegerField
      DisplayLabel = 'ND'
      FieldName = 'Numero'
      Required = True
    end
    object qryDuplicatasContaPagto: TIntegerField
      DisplayLabel = 'Conta'
      FieldName = 'ContaPagto'
    end
    object qryDuplicatasChequePagto: TIntegerField
      DisplayLabel = 'N'#186' Cheque'
      FieldName = 'ChequePagto'
      DisplayFormat = '000,000'
    end
    object qryDuplicatasQuitar: TBooleanField
      FieldName = 'Quitar'
    end
    object qryDuplicatascomplemento: TStringField
      FieldName = 'complemento'
      Size = 15
    end
  end
  object dsrDuplicatas: TtecDataSource
    DataSet = qryDuplicatas
    Left = 172
    Top = 279
  end
  object qryMesmoCheque: TtecQuery
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
      'SELECT d.DocumentoPag,'
      '       d.DataVencto,'
      '       d.Numero'
      ''
      'FROM   duplicatas d'
      ''
      'WHERE  d.ContaPagto  = :Conta AND'
      '       d.ChequePagto = :Cheque'
      ''
      '')
    RequestLive = False
    Left = 407
    Top = 278
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Conta'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cheque'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryMesmoChequeDocumentoPag: TIntegerField
      FieldName = 'DocumentoPag'
      Required = True
    end
    object qryMesmoChequeDataVencto: TDateField
      DisplayLabel = 'Vencto'
      FieldName = 'DataVencto'
      Required = True
    end
    object qryMesmoChequeNumero: TIntegerField
      DisplayLabel = 'ND'
      FieldName = 'Numero'
      Required = True
    end
  end
  object qryCancelarQuitacao: TtecQuery
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
      'SELECT t.DocumentoPag,'
      '       t.DataVencto,'
      '       t.ValorVencto,'
      '       t.Numero,'
      '       t.DataPagto,'
      '       t.ValorPagto,'
      '       t.FilialPagto,'
      '       t.ContaPagto,'
      '       t.ChequePagto,'
      '       t.TipoPagamento,'
      '       t.Usuario,'
      '       t.ContaCredito,'
      '       t.Autorizado'
      ''
      'FROM   duplicatas t'
      ''
      'WHERE  t.DocumentoPag = :Documento AND'
      '       t.DataVencto   = :Data'
      ''
      '')
    RequestLive = True
    Left = 287
    Top = 279
    ParamData = <
      item
        DataType = ftInteger
        Name = 'documento'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftDate
        Name = 'data'
        ParamType = ptUnknown
      end>
    object qryCancelarQuitacaoDocumentoPag: TIntegerField
      FieldName = 'DocumentoPag'
      Required = True
      DisplayFormat = '###,##0'
    end
    object qryCancelarQuitacaoDataVencto: TDateField
      Alignment = taCenter
      FieldName = 'DataVencto'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryCancelarQuitacaoValorVencto: TFloatField
      FieldName = 'ValorVencto'
      Required = True
      DisplayFormat = '###,###.00'
    end
    object qryCancelarQuitacaoNumero: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'ND'
      FieldName = 'Numero'
      Required = True
      DisplayFormat = '0'
    end
    object qryCancelarQuitacaoDataPagto: TDateField
      Alignment = taCenter
      FieldName = 'DataPagto'
      EditMask = '99/99/9999;1; '
    end
    object qryCancelarQuitacaoValorPagto: TFloatField
      FieldName = 'ValorPagto'
      DisplayFormat = '###,##0.00'
    end
    object qryCancelarQuitacaoFilialPagto: TIntegerField
      FieldName = 'FilialPagto'
      DisplayFormat = '0'
    end
    object qryCancelarQuitacaoChequePagto: TIntegerField
      DisplayLabel = 'Cheque'
      FieldName = 'ChequePagto'
      DisplayFormat = '0'
    end
    object qryCancelarQuitacaoTipoPagamento: TIntegerField
      DisplayLabel = 'Tipo Pagto'
      FieldName = 'TipoPagamento'
      DisplayFormat = '0'
    end
    object qryCancelarQuitacaoUsuario: TIntegerField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usuario'
      DisplayFormat = '0'
    end
    object qryCancelarQuitacaoContaCredito: TIntegerField
      FieldName = 'ContaCredito'
      DisplayFormat = '0'
    end
    object qryCancelarQuitacaoAutorizado: TBooleanField
      FieldName = 'Autorizado'
    end
    object qryCancelarQuitacaoContaPagto: TIntegerField
      DisplayLabel = 'Conta'
      DisplayWidth = 7
      FieldName = 'ContaPagto'
      DisplayFormat = '###.##0'
    end
  end
  object qryConsultarBancos: TtecQuery
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
      'SELECT   b.Sigla,'
      '         b.Codigo,'
      '         b.Nome'
      ''
      'FROM     bancos b'
      ''
      'WHERE    b.Inativo IS NULL'
      ''
      'ORDER BY b.Sigla'
      '')
    RequestLive = True
    Left = 65152
    Top = 354
    object qryConsultarBancosSigla: TStringField
      FieldName = 'Sigla'
      Size = 15
    end
    object qryConsultarBancosCodigo: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      DisplayFormat = '000'
    end
    object qryConsultarBancoNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
  end
  object qryConsultarContas: TtecQuery
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
      '       c.Agencia'
      ''
      'FROM   Contas c JOIN Bancos b   ON c.Banco   = b.Codigo'
      '                JOIN Agencias a ON c.Banco   = a.Banco AND'
      '                                   c.Agencia = a.Codigo'
      ''
      
        'ORDER BY b.Sigla, UPPER(TO_ASCII(a.nome,'#39'LATIN1'#39')), UPPER(TO_ASC' +
        'II(c.titular,'#39'LATIN1'#39'))'
      '')
    RequestLive = True
    Left = 287
    Top = 201
    object qryConsultarContasSigla: TStringField
      FieldName = 'Sigla'
      Size = 10
    end
    object qryConsultarContasNome: TStringField
      DisplayLabel = 'Nome da Ag'#234'ncia'
      FieldName = 'Nome'
      Size = 30
    end
    object qryConsultarContasConta: TIntegerField
      FieldName = 'Conta'
      DisplayFormat = '0'
    end
    object qryConsultarContasDigito: TStringField
      Alignment = taCenter
      DisplayLabel = 'D'
      FieldName = 'Digito'
      Size = 2
    end
    object qryConsultarContasTitular: TStringField
      FieldName = 'Titular'
      Size = 50
    end
    object qryConsultarContasAgencia: TIntegerField
      FieldName = 'Agencia'
      Visible = False
      DisplayFormat = '0'
    end
    object qryConsultarContasBanco: TIntegerField
      FieldName = 'Banco'
      Visible = False
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
    AfterOpen = qryContasAfterOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT c.Banco,'
      '       c.Agencia,'
      '       c.Conta,'
      '       c.Digito,'
      '       c.Titular,'
      '       b.Sigla,'
      '       a.Nome,'
      '       c.contacontabil '
      ''
      'FROM   Contas c JOIN Bancos b   ON c.Banco   = b.Codigo'
      '                JOIN Agencias a ON c.Banco   = a.Banco AND'
      '                                   c.Agencia = a.Codigo'
      ''
      'WHERE  c.Conta = :Conta'
      ''
      ''
      '')
    RequestLive = True
    Left = 56
    Top = 199
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
    object qryContascontacontabil: TIntegerField
      FieldName = 'contacontabil'
    end
  end
  object dsrContas: TtecDataSource
    DataSet = qryContas
    Left = 172
    Top = 202
  end
  object qryConsultaContaContabil: TtecQuery
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
        Name = 'consulta'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      
        'SELECT   cast(repeat('#39' '#39', length(btrim(p.classificacao)))||p.Des' +
        'cricao as varchar) as DescricaoEdentada,'
      '         p.descricao,'
      '         p.classificacao,'
      '         p.Codigo,'
      '         p.tipo'
      'FROM     planocontas p'
      'WHERE    p.Inativo IS NULL'
      '%consulta'
      
        'order by p.classificacao, UPPER(TO_ASCII(p.descricao,'#39'LATIN1'#39')),' +
        ' p.codigo')
    RequestLive = True
    Left = 449
    Top = 29
    object qryConsultaContaContabildescricaoedentada: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricaoedentada'
      Size = 52
    end
    object qryConsultaContaContabildescricao: TStringField
      FieldName = 'descricao'
      Visible = False
      Size = 50
    end
    object qryConsultaContaContabilclassificacao: TStringField
      DisplayLabel = 'Classifica'#231#227'o'
      FieldName = 'classificacao'
    end
    object qryConsultaContaContabilcodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
    object qryConsultaContaContabiltipo: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'tipo'
      Size = 1
    end
  end
  object qryProcuraCreditarPagamento: TtecQuery
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
      
        'select codigo, cast(btrim(classificacao, '#39'. '#39') as varchar) as cl' +
        'assificacao, descricao'
      'from planocontas'
      'where codigo = :codigo'
      '  and tipo = '#39'A'#39
      '  and inativo is null')
    RequestLive = False
    Left = 430
    Top = 84
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraCreditarPagamentocodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
    object qryProcuraCreditarPagamentoclassificacao: TStringField
      FieldName = 'classificacao'
    end
    object qryProcuraCreditarPagamentodescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 50
    end
  end
  object dsrProcuraCreditarPagamento: TtecDataSource
    DataSet = qryProcuraCreditarPagamento
    Left = 454
    Top = 101
  end
end
