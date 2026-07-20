inherited dtmManutencaoCheques: TdtmManutencaoCheques
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 133
  Top = 169
  Height = 540
  Width = 734
  object dsrFiliais: TtecDataSource
    DataSet = qryFiliais
    Left = 331
    Top = 69
  end
  object qryFiliais: TtecQuery
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
      'select codigo, nome'
      'from filiais'
      'where codigo=:codigo')
    RequestLive = True
    Left = 331
    Top = 10
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryFiliaiscodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryFiliaisnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
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
      'select codigo,nome'
      'from filiais'
      'order by UPPER(TO_ASCII(nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 331
    Top = 127
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
  object qryCheques: TtecQuery
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
        Name = 'tipocheque'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'remessa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataremessa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'periodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'situacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cobrador'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'Select c.numero,'
      '           cast(substring(c.numero,01,03) as varchar) as banco,'
      
        '           cast(substring(c.numero,04,04) as varchar) as agencia' +
        ','
      '           cast(substring(c.numero,20,10) as varchar) as conta,'
      '           cast(substring(c.numero,12,06) as varchar) as cheque,'
      '           c.data,'
      '           c.valor,'
      '           c.vencto,'
      '           c.remessanumero,'
      '           c.remessadata,'
      '           c.remessanumero2,           '
      '           c.remessadata2,'
      '           c.titular,'
      '           c.usuario,'
      '           c.situacao,'
      '           c.primeiradevolucao,'
      '           c.segundadevolucao,'
      '           c.reapresentar,'
      '           c.filial,'
      '           c.motivo,'
      '           c.arquivomagnetico,'
      
        '           cast((to_char(c.remessadata,'#39'DD/MM/YYYY'#39') || '#39' -'#39' || ' +
        'to_char(c.remessanumero,'#39'000'#39')) as varchar) as primeiraremessa,'
      
        '           cast((to_char(c.remessadata2,'#39'DD/MM/YYYY'#39') || '#39' -'#39' ||' +
        ' to_char(c.remessanumero2,'#39'000'#39')) as varchar) as segundaremessa,'
      
        '           (Select coalesce(v.razao,v.nome) as nome  From vfornecedores v Where c.cliente =' +
        ' v.codigo and c.tipocliente = v.tipo) as cliente,'
      
        '           (Select v.pessoatipo From vfornecedores v Where c.cli' +
        'ente = v.codigo and c.tipocliente = v.tipo) as pessoatipo,'
      
        '           (Select v.pessoanumero From vfornecedores v Where c.c' +
        'liente = v.codigo and c.tipocliente = v.tipo) as pessoanumero,'
      
        '           (Select u.nome From usuarios u Where c.usuario = u.co' +
        'digo) as cobrador,'
      '           false as marcar'
      'From  cheques c '
      '/*Where  False */'
      '%tipocheque'
      '%filial'
      '%remessa'
      '%dataremessa'
      '%periodo'
      '%situacao'
      '%cobrador         '
      'Order by c.vencto desc')
    RequestLive = True
    Left = 58
    Top = 10
    object qryChequesbanco: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'banco'
      Size = 3
    end
    object qryChequescheque: TStringField
      DisplayLabel = 'Cheque'
      FieldName = 'cheque'
      Size = 6
    end
    object qryChequesagencia: TStringField
      FieldName = 'agencia'
      Size = 50
    end
    object qryChequesconta: TStringField
      FieldName = 'conta'
      Size = 50
    end
    object qryChequesdata: TDateField
      
      DisplayLabel = 'Data'
      FieldName = 'data'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryChequesvalor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'valor'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryChequesvencto: TDateField
      
      DisplayLabel = 'Dt.Vencto'
      FieldName = 'vencto'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryChequesremessanumero: TIntegerField
      DisplayLabel = 'Nr.Remessa'
      FieldName = 'remessanumero'
      DisplayFormat = '0'
    end
    object qryChequesremessadata: TDateField
      
      DisplayLabel = 'Dt.Remessa'
      FieldName = 'remessadata'
      EditMask = '99/99/9999;1; '
    end
    object qryChequestitular: TStringField
      FieldName = 'titular'
      Required = True
      Size = 40
    end
    object qryChequescliente: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'cliente'
      Size = 40
    end
    object qryChequessituacao: TStringField
      DisplayLabel = 'Sit.'
      FieldName = 'situacao'
      Size = 1
    end
    object qryChequesnumero: TStringField
      FieldName = 'numero'
      Size = 30
    end
    object qryChequesfilial: TIntegerField
      DisplayLabel = 'Fil.'
      FieldName = 'filial'
      Required = True
      DisplayFormat = '0'
    end
    object qryChequescobrador: TStringField
      FieldName = 'cobrador'
      Size = 40
    end
    object qryChequesmarcar: TBooleanField
      FieldName = 'marcar'
    end
    object qryChequesprimeiradevolucao: TDateField
      
      FieldName = 'primeiradevolucao'
      EditMask = '99/99/9999;1; '
    end
    object qryChequesremessanumero2: TIntegerField
      FieldName = 'remessanumero2'
    end
    object qryChequesremessadata2: TDateField
      FieldName = 'remessadata2'
    end
    object qryChequessegundadevolucao: TDateField
      FieldName = 'segundadevolucao'
    end
    object qryChequesreapresentar: TDateField
      FieldName = 'reapresentar'
    end
    object qryChequesmotivo: TIntegerField
      FieldName = 'motivo'
    end
    object qryChequesprimeiraremessa: TStringField
      FieldName = 'primeiraremessa'
      Size = 50
    end
    object qryChequessegundaremessa: TStringField
      FieldName = 'segundaremessa'
      Size = 50
    end
    object qryChequesarquivomagnetico: TBooleanField
      FieldName = 'arquivomagnetico'
    end
    object qryChequespessoatipo: TStringField
      FieldName = 'pessoatipo'
      Size = 50
    end
    object qryChequespessoanumero: TStringField
      FieldName = 'pessoanumero'
      Size = 50
    end
    object qryChequesusuario: TIntegerField
      FieldName = 'usuario'
    end
  end
  object dsrPesquisa: TtecDataSource
    DataSet = qryCheques
    Left = 58
    Top = 69
  end
  object qryParcelasCheques: TtecQuery
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
      'Select cheque,'
      '            numero,'
      '            datavencto,'
      '            valorvencto'
      'From    parcelascheques'
      'Where  false')
    RequestLive = True
    Left = 59
    Top = 127
    object qryParcelasChequescheque: TStringField
      FieldName = 'cheque'
      Size = 30
    end
    object qryParcelasChequesdatavencto: TDateField
      
      FieldName = 'datavencto'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasChequesvalorvencto: TFloatField
      FieldName = 'valorvencto'
      DisplayFormat = '0.00'
    end
    object qryParcelasChequesnumero: TIntegerField
      FieldName = 'numero'
    end
  end
  object qryCobradores: TtecQuery
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
      'select codigo, nome'
      'from usuarios'
      'where codigo=:codigo')
    RequestLive = True
    Left = 495
    Top = 10
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryCobradorescodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryCobradoresnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
  end
  object dsrCobradores: TtecDataSource
    DataSet = qryCobradores
    Left = 495
    Top = 69
  end
  object qryConsultaCobradores: TtecQuery
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
      'from    usuarios'
      'where cobranca'
      'Order by UPPER(TO_ASCII(nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 495
    Top = 127
    object qryConsultaCobradoresnome: TStringField
      DisplayLabel = 'Cobrador'
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaCobradorescodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
  object qryBancos: TtecQuery
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
      'From   bancos'
      'Where codigo =:codigo')
    RequestLive = False
    Left = 188
    Top = 10
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryBancoscodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
    object qryBancosnome: TStringField
      FieldName = 'nome'
      Size = 50
    end
  end
  object dsrBancos: TtecDataSource
    DataSet = qryBancos
    Left = 196
    Top = 69
  end
  object qryConsultaBancos: TtecQuery
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
      'Select  b.nome,'
      '            b.codigo'
      'From    bancos b'
      'Where (b.inativo is null)'
      'Order By UPPER(TO_ASCII(b.nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 196
    Top = 127
    object qryConsultaBancosnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 50
    end
    object qryConsultaBancoscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
  end
  object qryNumeroRemessa: TtecQuery
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
      '(Select max(novaremessa.numero) as numero'
      ' From   (Select coalesce(max(remessanumero),0) as numero'
      '             From   cheques'
      '             Where remessadata =:data'
      '             Union'
      '             Select coalesce(max(remessanumero2),0) as numero'
      '             From   cheques'
      '             Where remessadata2 =:data) as novaremessa)'
      '')
    RequestLive = False
    Left = 331
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'data'
        ParamType = ptUnknown
      end>
    object qryNumeroRemessanumero: TIntegerField
      FieldName = 'numero'
    end
  end
  object qryConsultaMotivos: TtecQuery
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
      'From   motivos'
      'Order By UPPER(TO_ASCII(descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 495
    Top = 192
    object qryConsultaMotivosdescricao: TStringField
      DisplayLabel = 'Descri;'#227'o'
      FieldName = 'descricao'
      Size = 30
    end
    object qryConsultaMotivoscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
  end
  object qryMotivos: TtecQuery
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
      'From   motivos'
      'Where codigo =:codigo')
    RequestLive = False
    Left = 495
    Top = 253
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryMotivoscodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryMotivosdescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
  end
  object dsrMotivos: TtecDataSource
    DataSet = qryMotivos
    Left = 600
    Top = 253
  end
  object qryDefinirCobradores: TtecQuery
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
      'from usuarios'
      'where cobranca and codigo =:codigo')
    RequestLive = False
    Left = 331
    Top = 253
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
      end>
  end
  object dsrDefinirCobradores: TtecDataSource
    DataSet = qryDefinirCobradores
    Left = 331
    Top = 312
  end
  object qryAgencias: TtecQuery
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
      'Select  a.codigo,'
      
        '            cast((b.sigla || '#39' - '#39' || a.nome) as varchar) as nom' +
        'e,'
      '            a.banco,'
      '            b.sigla,'
      '            b.diasuteisremessa,'
      '            b.valorlimitecheque,'
      '            b.qtdechequevista,'
      '            b.qtdechequeprazo'
      '/*            c.numeroconta,'
      '            c.digitoconta,'
      '            c.convenio */'
      'From  agencias a, bancos b, contas c'
      'Where (a.banco  = b.codigo) and'
      '      (a.banco  =:banco)    and'
      '      (a.codigo =:codigo)'
      '       /* and'
      '      (c.banco  = a.banco)  and'
      '      (c.agencia= a.codigo) */')
    RequestLive = False
    Left = 62
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'banco'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryAgenciascodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryAgenciasnome: TStringField
      FieldName = 'nome'
      Size = 30
    end
    object qryAgenciasbanco: TIntegerField
      FieldName = 'banco'
      DisplayFormat = '0'
    end
    object qryAgenciassigla: TStringField
      FieldName = 'sigla'
      Size = 10
    end
    object qryAgenciasdiasuteisremessa: TIntegerField
      FieldName = 'diasuteisremessa'
      DisplayFormat = '0'
    end
    object qryAgenciasvalorlimitecheque: TFloatField
      FieldName = 'valorlimitecheque'
      DisplayFormat = '0.00'
    end
    object qryAgenciasqtdechequevista: TIntegerField
      FieldName = 'qtdechequevista'
      DisplayFormat = '0'
    end
    object qryAgenciasqtdechequeprazo: TIntegerField
      FieldName = 'qtdechequeprazo'
      DisplayFormat = '0'
    end
  end
  object qryConsultaAgencias: TtecQuery
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
      'Select  nome,'
      '            codigo,'
      '            banco'
      'From    agencias'
      'Where (banco =:banco)'
      'Order By UPPER(TO_ASCII(nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 64
    Top = 253
    ParamData = <
      item
        DataType = ftInteger
        Name = 'banco'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryConsultaAgenciasnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Required = True
      Size = 30
    end
    object qryConsultaAgenciascodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Required = True
    end
    object qryConsultaAgenciasbanco: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'banco'
      Required = True
    end
  end
  object dsrAgencia: TtecDataSource
    DataSet = qryAgencias
    Left = 180
    Top = 192
  end
  object svdCaminho: TSaveDialog
    DefaultExt = 'txt'
    Filter = '*.txt'
    Title = 'Salvar'
    Left = 640
    Top = 10
  end
  object dsrContas: TtecDataSource
    DataSet = qryProcurarContas
    Left = 208
    Top = 434
  end
  object qryProcurarContas: TtecQuery
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
      '       a.Nome,'
      '       c.contacontabil'
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
    Left = 208
    Top = 367
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Conta'
        ParamType = ptUnknown
      end>
    object qryProcurarContasBanco: TIntegerField
      FieldName = 'Banco'
      Required = True
      DisplayFormat = '0'
    end
    object qryProcurarContasAgencia: TIntegerField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'Agencia'
      Required = True
      DisplayFormat = '0'
    end
    object qryProcurarContasConta: TIntegerField
      FieldName = 'Conta'
      Required = True
      DisplayFormat = '0'
    end
    object qryProcurarContasDigito: TStringField
      DisplayLabel = 'D'#237'gito'
      FieldName = 'Digito'
      Required = True
      Size = 2
    end
    object qryProcurarContasTitular: TStringField
      FieldName = 'Titular'
      Size = 50
    end
    object qryProcurarContasSigla: TStringField
      FieldName = 'Sigla'
      Size = 10
    end
    object qryProcurarContasNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
    object qryProcurarContascontacontabil: TIntegerField
      FieldName = 'contacontabil'
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
        'II(c.titular,'#39'LATIN1'#39'))')
    RequestLive = True
    Left = 208
    Top = 309
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
    end
    object qryConsultarContasDigito: TStringField
      DisplayLabel = 'D'#237'gito'
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
    end
    object qryConsultarContasBanco: TIntegerField
      FieldName = 'Banco'
      Visible = False
    end
  end
end
