inherited dtmGerarMapasECF: TdtmGerarMapasECF
  OldCreateOrder = False
  Left = 289
  Top = 79
  Height = 695
  Width = 830
  object qryCuponsExistentes_MesmaData: TtecQuery
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
        Name = 'ListadeDatas'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select df.data,'
      '          max(c.numero) as cupom'
      'from cupons c join dadosfiscais df on c.dadofiscal = df.numero'
      'where c.filial = :Filial'
      '  and c.maquina = :Maquina'
      '  and c.intervensao = :Intervensao'
      '%ListadeDatas'
      'group by df.data')
    RequestLive = False
    Left = 72
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Maquina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Intervensao'
        ParamType = ptUnknown
      end>
    object qryCuponsExistentes_MesmaDatadata: TDateField
      FieldName = 'data'
    end
    object qryCuponsExistentes_MesmaDatacupom: TIntegerField
      FieldName = 'cupom'
    end
  end
  object qryApagarMapasECF: TtecQuery
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
      
        'delete from mapasecf where (filial,maquina,intervensao,data) in ' +
        '()')
    RequestLive = False
    Left = 280
    Top = 16
  end
  object qryIncluirMapasECF: TtecQuery
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
      'insert into MapasECF'
      '( filial,'
      '  maquina,'
      '  intervensao,'
      '  data,'
      '  cupomfinal,'
      '  reducoes,'
      '  grandetotal,'
      '  cancelamentos,'
      '  descontos,'
      '  substituicao,'
      '  isento,'
      '  naotributado)'
      ''
      '  values'
      ''
      '( :filial,'
      '  :maquina,'
      '  :intervensao,'
      '  :data,'
      '  :cupomfinal,'
      '  :reducoes,'
      '  :grandetotal,'
      '  :cancelamentos,'
      '  :descontos,'
      '  :substituicao,'
      '  :isento,'
      '  :naotributado);')
    RequestLive = False
    Left = 280
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'maquina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'intervensao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'data'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cupomfinal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'reducoes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'grandetotal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cancelamentos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'descontos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'substituicao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'isento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'naotributado'
        ParamType = ptUnknown
      end>
  end
  object qryIncluirMapasECFTributados: TtecQuery
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
      'Insert into MapasECFTributados'
      ' (filial,'
      '  maquina,'
      '  intervensao,'
      '  data,'
      '  aliquota,'
      '  base,'
      '  valor)'
      ''
      ' values'
      ''
      ' (:filial,'
      '  :maquina,'
      '  :intervensao,'
      '  :data,'
      '  :aliquota,'
      '  :base,'
      '  :valor)')
    RequestLive = False
    Left = 280
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'maquina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'intervensao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'data'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'aliquota'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'base'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'valor'
        ParamType = ptUnknown
      end>
  end
  object qryCuponsExistentes_InferiorData: TtecQuery
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
      'select max(c.numero) as cupom'
      'from cupons c join dadosfiscais df on c.dadofiscal = df.numero'
      'where c.filial = :Filial'
      '  and c.maquina = :Maquina'
      '  and c.intervensao = :Intervensao'
      '  and df.data < :data')
    RequestLive = False
    Left = 104
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Maquina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Intervensao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'data'
        ParamType = ptUnknown
      end>
    object qryCuponsExistentes_InferiorDatacupom: TIntegerField
      FieldName = 'cupom'
    end
  end
  object qryCuponsExistentes_SuperiorData: TtecQuery
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
      'select max(c.numero) as cupom'
      'from cupons c join dadosfiscais df on c.dadofiscal = df.numero'
      'where c.filial = :Filial'
      '  and c.maquina = :Maquina'
      '  and c.intervensao = :Intervensao'
      '  and df.data < :data')
    RequestLive = False
    Left = 136
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Maquina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Intervensao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'data'
        ParamType = ptUnknown
      end>
    object qryCuponsExistentes_SuperiorDatacupom: TIntegerField
      FieldName = 'cupom'
    end
  end
  object qryReducoesZ: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'Condicao'
        ParamType = ptUnknown
        Value = 'false'
      end>
    Sql.Strings = (
      'select rz.*,'
      '       (select ecfs.versao_sb'
      '       from ecfs'
      '       where ecfs.filial = rz.filial'
      '         and cast(ecfs.maquina as INTEGER) = rz.numerousuario'
      '         and cast(ecfs.intervencao as INTEGER) = rz.cro '
      '         and ecfs.serie = rz.numerofabricacao'
      '       order by ecfs.codigo desc limit 1) as versao_sb'
      'from reducoesz rz'
      'where %Condicao'
      'order by rz.datamovimento'
      ''
      ''
      '/*'
      ''
      ':DataInicial'
      ':DataFinal'
      ':crzinicial'
      ':crzfinal'
      ''
      ':filialbase'
      ''
      ''
      '*/'
      '')
    RequestLive = True
    Left = 24
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DataInicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataFinal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'crzinicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'crzfinal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filialbase'
        ParamType = ptUnknown
      end>
    object qryReducoesZnumerofabricacao: TStringField
      FieldName = 'numerofabricacao'
    end
    object qryReducoesZfilial: TIntegerField
      FieldName = 'filial'
    end
    object qryReducoesZmfadicional: TStringField
      FieldName = 'mfadicional'
      Size = 1
    end
    object qryReducoesZmodelodoecf: TStringField
      FieldName = 'modelodoecf'
    end
    object qryReducoesZnumerousuario: TIntegerField
      FieldName = 'numerousuario'
    end
    object qryReducoesZcrz: TIntegerField
      FieldName = 'crz'
    end
    object qryReducoesZcoo: TIntegerField
      FieldName = 'coo'
    end
    object qryReducoesZcro: TIntegerField
      FieldName = 'cro'
    end
    object qryReducoesZdatamovimento: TDateField
      Alignment = taCenter
      FieldName = 'datamovimento'
      EditMask = '99/99/9999;1; '
    end
    object qryReducoesZdataemissao: TDateTimeField
      Alignment = taCenter
      FieldName = 'dataemissao'
      DisplayFormat = 'dd/MM/yy hh:mm'
      EditMask = '99/99/99 99:99;1; '
    end
    object qryReducoesZhoraemissao: TDateTimeField
      Alignment = taCenter
      FieldName = 'horaemissao'
      DisplayFormat = 'dd/MM/yy hh:mm'
      EditMask = '99/99/99 99:99;1; '
    end
    object qryReducoesZvendabrutadiaria: TFloatField
      FieldName = 'vendabrutadiaria'
      DisplayFormat = '0.00'
    end
    object qryReducoesZparametroincidenciaissqn: TStringField
      FieldName = 'parametroincidenciaissqn'
      Size = 1
    end
    object qryReducoesZcoo_inicial: TIntegerField
      FieldName = 'coo_inicial'
    end
    object qryReducoesZcoo_final: TIntegerField
      FieldName = 'coo_final'
    end
    object qryReducoesZtotalizadorgeral: TFloatField
      FieldName = 'totalizadorgeral'
      DisplayFormat = '0.00'
    end
    object qryReducoesZhash_paf_registro_r02: TStringField
      FieldName = 'hash_paf_registro_r02'
      Size = 32
    end
    object qryReducoesZcodigo_ecf: TIntegerField
      FieldName = 'codigo_ecf'
    end
    object qryReducoesZdatahoraenviofiscoreducaoz: TDateTimeField
      Alignment = taCenter
      FieldName = 'datahoraenviofiscoreducaoz'
      DisplayFormat = 'dd/MM/yy hh:mm'
      EditMask = '99/99/99 99:99;1; '
    end
    object qryReducoesZreciboenviofiscoreducaoz: TStringField
      FieldName = 'reciboenviofiscoreducaoz'
      Size = 50
    end
    object qryReducoesZversao_sb: TStringField
      FieldName = 'versao_sb'
      Size = 15
    end
    object qryReducoesZsituacaoprocessamentocodigo: TIntegerField
      FieldName = 'situacaoprocessamentocodigo'
    end
    object qryReducoesZsituacaoprocessamentodescricao: TStringField
      FieldName = 'situacaoprocessamentodescricao'
      Size = 200
    end
    object qryReducoesZmensagemprocessamentodescricao: TStringField
      FieldName = 'mensagemprocessamentodescricao'
      Size = 500
    end
    object qryReducoesZorigeminformacao: TStringField
      FieldName = 'origeminformacao'
      Size = 2
    end
    object qryReducoesZdatahorareenviofiscoreducaoz: TDateTimeField
      FieldName = 'datahorareenviofiscoreducaoz'
    end
    object qryReducoesZsituacaoprocessamentooper: TIntegerField
      FieldName = 'situacaoprocessamentooper'
    end
    object qryReducoesZsituacaoprocessamentooperdescricao: TStringField
      FieldName = 'situacaoprocessamentooperdescricao'
      Size = 200
    end
    object qryReducoesZmensagemprocessamentooperdescricao: TStringField
      FieldName = 'mensagemprocessamentooperdescricao'
      Size = 500
    end
  end
  object qryReducoesZDetalhes: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkFields = 
      'filial=filial;numerousuario=numerousuario;cro=cro;numerofabricac' +
      'ao=numerofabricacao;datamovimento=datamovimento'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrReducoesZ
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'Condicao'
        ParamType = ptUnknown
        Value = 'false'
      end>
    Sql.Strings = (
      'select rzd.*'
      'from reducoeszdetalhes rzd'
      '     join reducoesz rz'
      
        '     on  rzd.filial                  =  rz.filial              a' +
        'nd'
      
        '         rzd.numerousuario           =  rz.numerousuario       a' +
        'nd'
      
        '         rzd.cro                     =  rz.cro                 a' +
        'nd'
      
        '         rzd.numerofabricacao        =  rz.numerofabricacao    a' +
        'nd'
      '         rzd.datamovimento           =  rz.datamovimento'
      ''
      'where %Condicao'
      ''
      'order by rzd.datamovimento'
      ''
      ''
      '/*'
      ''
      ':DataInicial'
      ':DataFinal'
      ':crzinicial'
      ':crzfinal'
      ''
      ':filialbase'
      ''
      '*/'
      '')
    RequestLive = True
    Left = 128
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DataInicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataFinal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'crzinicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'crzfinal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filialbase'
        ParamType = ptUnknown
      end>
    object qryReducoesZDetalhesfilial: TIntegerField
      FieldName = 'filial'
      Required = True
    end
    object qryReducoesZDetalhesnumerousuario: TIntegerField
      FieldName = 'numerousuario'
      Required = True
    end
    object qryReducoesZDetalhescro: TIntegerField
      FieldName = 'cro'
      Required = True
    end
    object qryReducoesZDetalhesdatamovimento: TDateField
      FieldName = 'datamovimento'
      Required = True
    end
    object qryReducoesZDetalhestipototalizadorparcial: TStringField
      FieldName = 'tipototalizadorparcial'
      Required = True
      Size = 7
    end
    object qryReducoesZDetalhesaliquota: TFloatField
      FieldName = 'aliquota'
    end
    object qryReducoesZDetalhesvaloracumulado: TFloatField
      FieldName = 'valoracumulado'
      Required = True
    end
    object qryReducoesZDetalheshash_paf_registro_r03: TStringField
      FieldName = 'hash_paf_registro_r03'
      Size = 32
    end
    object qryReducoesZDetalhesnumerofabricacao: TStringField
      FieldName = 'numerofabricacao'
      Required = True
    end
  end
  object qryReducoesZ_: TtecQuery
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
      'insert into reducoesz'
      ' ('
      '    NumeroFabricacao,'
      '    Filial,'
      '    MFadicional,'
      '    ModelodoECF,'
      '    Numerousuario,'
      '    CRZ,'
      '    COO,'
      '    COO_Inicial,'
      '    COO_Final,'
      '    CRO,'
      '    DataMovimento,'
      '    DataEmissao,'
      '    HoraEmissao,'
      '    VendaBrutaDiaria,'
      '    TotalizadorGeral,'
      '    ParametroIncidenciaISSQN,'
      '    hash_paf_registro_r02'
      '  )'
      ''
      '  values'
      ''
      '  ('
      '    :NumeroFabricacao,'
      '    :Filial,'
      '    :MFadicional,'
      '    :ModelodoECF,'
      '    :Numerousuario,'
      '    :CRZ,'
      '    :COO,'
      '    :COO_Inicial,'
      '    :COO_Final,'
      '    :CRO,'
      '    cast(:DataMovimento as date),'
      '    cast(:DataEmissao as timestamp),'
      '    cast(:HoraEmissao as timestamp),'
      '    :VendaBrutaDiaria,'
      '    :TotalizadorGeral,'
      '    :ParametroIncidenciaISSQN,'
      '    :hash_paf_registro_r02'
      '  )')
    RequestLive = True
    Left = 336
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NumeroFabricacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MFadicional'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ModelodoECF'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Numerousuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CRZ'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COO_Inicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COO_Final'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataMovimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataEmissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HoraEmissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VendaBrutaDiaria'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TotalizadorGeral'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ParametroIncidenciaISSQN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'hash_paf_registro_r02'
        ParamType = ptUnknown
      end>
  end
  object qryReducoesZDetalhes_: TtecQuery
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
      'insert into reducoeszdetalhes'
      ' ('
      '  Filial,'
      '  NumeroUsuario,'
      '  CRO,'
      '  numerofabricacao,'
      '  DataMovimento,'
      '  TipoTotalizadorParcial,'
      '  aliquota,'
      '  ValorAcumulado,'
      '  hash_paf_registro_r03'
      ' )'
      ''
      ' values'
      ''
      ' ('
      '  :Filial,'
      '  :NumeroUsuario,'
      '  :CRO,'
      '  :numerofabricacao,'
      '  :DataMovimento,'
      '  :TipoTotalizadorParcial,'
      '  :aliquota,'
      '  :ValorAcumulado,'
      '  :hash_paf_registro_R03'
      ''
      ' )')
    RequestLive = True
    Left = 304
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NumeroUsuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numerofabricacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataMovimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TipoTotalizadorParcial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'aliquota'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ValorAcumulado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'hash_paf_registro_R03'
        ParamType = ptUnknown
      end>
  end
  object qryDadosItemCupom: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkFields = 
      'filial=filial;numerousuario=num_usu;cro=cro;numerofabricacao=num' +
      '_fab;datamovimento=datamovimento;tipototalizadorparcial=cod_tot_' +
      'parc'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrReducoesZDetalhes
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'Condicao'
        ParamType = ptUnknown
        Value = 'true'
      end>
    Sql.Strings = (
      '  select dic.filial,'
      '                 dic.num_usu,'
      '                 dic.cro,'
      '                 dic.crz,'
      '                 dic.num_fab,'
      '                 dic.cod_item,'
      '                 dic.classificacaofiscal,'
      
        '                 cast(max(dic.desc_item) as varchar(100)) as des' +
        'c_item,'
      '                 sum(dic.qtde_item) as qtde_item,'
      '                 dic.un_med,'
      '                 sum(dic.vl_unit) as vl_unit,'
      ''
      '                 sum(dic.descto_item) as descto_item,'
      '                 sum(dic.acres_item) as acres_item,'
      '                 sum(vl_canc) as vl_canc,'
      ''
      '                 dic.cod_tot_parc,'
      '                 dic.aliquota,'
      '                 sum(dic.vl_tot_item) as vl_tot_item,'
      '                 dic.datamovimento'
      ''
      '  from'
      '  ('
      ''
      '         select dic.filial,'
      '                 dic.num_usu,'
      '                 dic.cro,'
      '                 dc.crz,'
      '                 dic.num_fab,'
      '                 dic.cod_item,'
      '                 dic.classificacaofiscal,'
      
        '                 cast(btrim(dic.desc_item) as varchar(100)) as d' +
        'esc_item,'
      '                 dic.qtde_item,'
      '                 dic.un_med,'
      '                 dic.vl_unit,'
      ''
      '                 /*'
      
        '                 abs(coalesce(case when ValorDescontoAcrescCupom' +
        'Rateado(dic.filial, dic.num_usu, dic.cro, dic.coo, dic.num_item)' +
        ' <'
      '                   dic.vl_tot_item and dc.canc='#39'N'#39' then'
      ''
      
        '                    ValorDescontoAcrescCupomRateado(dic.filial, ' +
        'dic.num_usu, dic.cro, dic.coo, dic.num_item) -'
      '                    dic.vl_tot_item'
      '                 else'
      '                   0.00'
      
        '                 end, 0) + coalesce(dic.descto_item,0)) as desct' +
        'o_item,'
      '                 */'
      ''
      
        '                 abs(coalesce(case when ValorDescontoAcrescCupom' +
        'Rateado(dic.filial, dic.num_usu, dic.cro, dic.coo, dic.num_item,' +
        ' false) <'
      '                   dic.vl_tot_item and dc.canc='#39'N'#39
      ''
      
        '                   and dic.ind_canc='#39'N'#39' /*alterado para atender ' +
        'num_fab='#39'BE111910101110043064'#39' and coo = 17366  da Andra item ca' +
        'ncelado n'#227'o deve entrar como desconto*/ '
      ''
      '                   then'
      ''
      '                   dic.vl_tot_item -'
      
        '                    ValorDescontoAcrescCupomRateado(dic.filial, ' +
        'dic.num_usu, dic.cro, dic.coo, dic.num_item, false)'
      ''
      '                 else'
      '                   0.00'
      
        '                 end, 0) + case when dc.canc='#39'S'#39' and dic.ind_can' +
        'c='#39'N'#39' then 0.00 else coalesce(dic.descto_item,0) end) as descto_' +
        'item,'
      ''
      ''
      ''
      '                   /*'
      
        '                 abs(coalesce(case when ValorDescontoAcrescCupom' +
        'Rateado(dic.filial, dic.num_usu, dic.cro, dic.coo, dic.num_item)' +
        ' >'
      '                   dic.vl_tot_item then'
      
        '                    ValorDescontoAcrescCupomRateado(dic.filial, ' +
        'dic.num_usu, dic.cro, dic.coo, dic.num_item) -'
      '                    dic.vl_tot_item'
      '                 else'
      '                   0.00'
      
        '                 end, 0) + coalesce(dic.acres_item,0)) as acres_' +
        'item,'
      ''
      '                 */'
      ''
      '                 dic.acres_item,'
      ''
      ''
      
        '/*                 case when dc.canc = '#39'S'#39' or dic.ind_canc='#39'S'#39' t' +
        'hen dic.vl_tot_item else 0.00 end as vl_canc,*/'
      '                /* 0.00 as vl_canc,*/'
      ''
      '                /*'
      '                 case when dc.canc = '#39'S'#39' then  dic.vl_tot_item'
      ''
      '                      when dic.ind_canc='#39'S'#39' then'
      ''
      
        '                      coalesce(nullif(dic.vl_canc,0), dic.vl_tot' +
        '_item)'
      ''
      '                 else 0.00 end as vl_canc,'
      ''
      '                 */'
      ''
      
        '                 case when dc.canc = '#39'S'#39' then  /*ValorDescontoAc' +
        'rescCupomRateado(dic.filial, dic.num_usu, dic.cro, dic.coo, dic.' +
        'num_item)*/'
      ''
      
        '                      coalesce(nullif(ValorDescontoAcrescCupomRa' +
        'teado(dic.filial, dic.num_usu, dic.cro, dic.coo, dic.num_item, t' +
        'rue),0), dic.vl_tot_item)'
      ''
      '                 '
      '                      when dic.ind_canc='#39'S'#39' then '
      '                      '
      
        '                      coalesce(nullif(dic.vl_canc,0), dic.vl_tot' +
        '_item)'
      '                      '
      '                 else 0.00 end as vl_canc,'
      ''
      ''
      '                 dic.cod_tot_parc,'
      '                 coalesce(dic.aliq_icms,0) as aliquota,'
      ''
      
        '                 /*ValorDescontoAcrescCupomRateado(dic.filial, d' +
        'ic.num_usu, dic.cro, dic.coo, dic.num_item) as vl_tot_item ,*/'
      ''
      ''
      
        '                 case when dc.canc = '#39'S'#39'  or dic.ind_canc='#39'S'#39' Th' +
        'en 0.00'
      '                 else'
      ''
      
        '                 ValorDescontoAcrescCupomRateado(dic.filial, dic' +
        '.num_usu, dic.cro, dic.coo, dic.num_item, false)'
      '                 end  as vl_tot_item ,'
      '                 '
      ''
      '                 rz.datamovimento'
      ''
      '          from reducoesz rz'
      '               join dadositemcupom dic'
      '                    join detalhecupom dc'
      '                    on dic.filial = dc.filial'
      '                    and dic.num_usu = dc.num_usu'
      '                    and dic.cro = dc.cro'
      '                    and dic.num_fab = dc.num_fab'
      '                    and dic.coo = dc.coo'
      '                   /* and dc.canc='#39'N'#39
      '                    and dic.ind_canc='#39'N'#39'*/'
      ''
      '               on dic.filial = rz.filial'
      '            and dic.num_usu = rz.numerousuario'
      '            and dic.cro = rz.cro'
      '            and dic.num_fab = rz.numerofabricacao'
      '            and dic.coo between rz.coo_inicial and rz.coo_final'
      ''
      '           where %Condicao'
      ''
      '          union all'
      '          '
      '          '
      '         select dic.filial,'
      '                 dic.num_usu,'
      '                 dic.cro,'
      '                 dc.crz,'
      '                 dic.num_fab,'
      '                 dic.cod_item,'
      '                 dic.classificacaofiscal,'
      
        '                 cast(btrim(dic.desc_item) as varchar(100)) as d' +
        'esc_item,'
      '                 dic.qtde_item,'
      '                 dic.un_med,'
      '                 dic.vl_unit,'
      '                 dic.descto_item,'
      '                 dic.acres_item,'
      '                 0.00 AS vl_canc,'
      
        '                 /*case when dc.canc = '#39'S'#39' or dic.ind_canc='#39'S'#39' t' +
        'hen dic.vl_tot_item else 0.00 end as vl_canc,*/'
      '                 cast('#39'Can-T'#39' as varchar(7)) as cod_tot_parc,'
      
        '                 coalesce(dic.aliq_icms,0) as aliquota,         ' +
        '        '
      
        '                 /*ValorDescontoAcrescCupomRateado(dic.filial, d' +
        'ic.num_usu, dic.cro, dic.coo, dic.num_item) as vl_tot_item,*/'
      
        '                 case when dc.canc = '#39'S'#39' or dic.ind_canc='#39'S'#39' the' +
        'n dic.vl_tot_item else 0.00 end as vl_tot_item,'
      '                 rz.datamovimento'
      '          from reducoesz rz'
      '               join dadositemcupom dic'
      '                    join detalhecupom dc'
      '                    on dic.filial = dc.filial'
      '                    and dic.num_usu = dc.num_usu'
      '                    and dic.cro = dc.cro'
      '                    and dic.num_fab = dc.num_fab'
      '                    and dic.coo = dc.coo'
      ''
      ''
      ''
      '               on dic.filial = rz.filial'
      '            and dic.num_usu = rz.numerousuario'
      '            and dic.cro = rz.cro'
      '            and dic.num_fab = rz.numerofabricacao'
      '            and dic.coo between rz.coo_inicial and rz.coo_final'
      ''
      '           where %Condicao'
      '             and (dc.canc='#39'S'#39' or dic.ind_canc='#39'S'#39')'
      ''
      '      union all'
      ''
      ''
      ''
      '         select dic.filial,'
      '                 dic.num_usu,'
      '                 dic.cro,'
      '                 dc.crz,'
      '                 dic.num_fab,                 '
      '                 dic.cod_item,'
      '                 dic.classificacaofiscal,'
      
        '                 cast(btrim(dic.desc_item) as varchar(100)) as d' +
        'esc_item,'
      '                 dic.qtde_item,'
      '                 dic.un_med,'
      '                 dic.vl_unit,'
      '                 dic.descto_item,'
      '                 dic.acres_item,'
      '                 0.00 AS vl_canc,'
      
        '/*                 case when dc.canc = '#39'S'#39' or dic.ind_canc='#39'S'#39' t' +
        'hen dic.vl_tot_item else 0.00 end as vl_canc,*/'
      '                 cast('#39'DT'#39' as varchar(7)) as cod_tot_parc,'
      
        '                 coalesce(dic.aliq_icms,0) as aliquota,         ' +
        '        '
      
        '                 ValorDescontoAcrescCupomRateado(dic.filial, dic' +
        '.num_usu, dic.cro, dic.coo, dic.num_item) as vl_tot_item ,'
      '                 rz.datamovimento'
      '          from reducoesz rz'
      '               join dadositemcupom dic'
      '                    join detalhecupom dc'
      '                    on dic.filial = dc.filial'
      '                    and dic.num_usu = dc.num_usu'
      '                    and dic.cro = dc.cro'
      '                    and dic.num_fab = dc.num_fab'
      '                    and dic.coo = dc.coo'
      ''
      '               on dic.filial = rz.filial'
      '            and dic.num_usu = rz.numerousuario'
      '            and dic.cro = rz.cro'
      '            and dic.num_fab = rz.numerofabricacao'
      '            and dic.coo between rz.coo_inicial and rz.coo_final'
      '                        '
      '           where %Condicao'
      '             and dic.descto_item <> 0'
      '                          '
      '    union all'
      ''
      ''
      '         select dic.filial,'
      '                 dic.num_usu,'
      '                 dic.cro,'
      '                 dc.crz,'
      '                 dic.num_fab,                 '
      '                 dic.cod_item,'
      '                 dic.classificacaofiscal,'
      
        '                 cast(btrim(dic.desc_item) as varchar(100)) as d' +
        'esc_item,'
      '                 dic.qtde_item,'
      '                 dic.un_med,'
      '                 dic.vl_unit,'
      '                 dic.descto_item,'
      '                 dic.acres_item,'
      '                 0.00 AS vl_canc,'
      
        '/*                 case when dc.canc = '#39'S'#39' or dic.ind_canc='#39'S'#39' t' +
        'hen dic.vl_tot_item else 0.00 end as vl_canc,*/'
      '                 cast('#39'AT'#39' as varchar(7)) as cod_tot_parc,'
      
        '                 coalesce(dic.aliq_icms,0) as aliquota,         ' +
        '        '
      
        '                 ValorDescontoAcrescCupomRateado(dic.filial, dic' +
        '.num_usu, dic.cro, dic.coo, dic.num_item) as vl_tot_item ,'
      '                 rz.datamovimento'
      '          from reducoesz rz'
      '               join dadositemcupom dic'
      '                    join detalhecupom dc'
      '                    on dic.filial = dc.filial'
      '                    and dic.num_usu = dc.num_usu'
      '                    and dic.cro = dc.cro'
      '                    and dic.num_fab = dc.num_fab'
      '                    and dic.coo = dc.coo'
      ''
      '               on dic.filial = rz.filial'
      '            and dic.num_usu = rz.numerousuario'
      '            and dic.cro = rz.cro'
      '            and dic.num_fab = rz.numerofabricacao'
      '            and dic.coo between rz.coo_inicial and rz.coo_final'
      '                        '
      '           where %Condicao'
      '             and dic.acres_item <> 0'
      ''
      ') as dic'
      ''
      '  group by dic.filial,'
      '                 dic.num_usu,'
      '                 dic.cro,'
      '                 dic.crz,'
      '                 dic.num_fab,'
      '                 dic.cod_item,'
      '                 dic.classificacaofiscal,'
      '/*                 dic.desc_item, */'
      '                 dic.un_med,'
      '                 dic.cod_tot_parc,'
      '                 dic.aliquota,'
      '                 dic.datamovimento'
      ''
      ''
      '/*'
      ''
      ':DataInicial'
      ':filialbase'
      ''
      '*/'
      '')
    RequestLive = False
    Left = 56
    Top = 256
    ParamData = <
      item
        DataType = ftString
        Name = 'DataInicial'
        ParamType = ptUnknown
        Value = #39'2022-01-01'#39
      end
      item
        DataType = ftUnknown
        Name = 'filialbase'
        ParamType = ptUnknown
      end>
    object qryDadosItemCupomfilial: TIntegerField
      FieldName = 'filial'
      Required = True
    end
    object qryDadosItemCupomnum_usu: TIntegerField
      FieldName = 'num_usu'
      Required = True
    end
    object qryDadosItemCupomcro: TIntegerField
      FieldName = 'cro'
      Required = True
    end
    object qryDadosItemCupomcrz: TIntegerField
      FieldName = 'crz'
      Required = True
    end
    object qryDadosItemCupomnum_fab: TStringField
      FieldName = 'num_fab'
      Required = True
    end
    object qryDadosItemCupomcod_item: TStringField
      FieldName = 'cod_item'
      Required = True
      Size = 14
    end
    object qryDadosItemCupomclassificacaofiscal: TStringField
      FieldName = 'classificacaofiscal'
      Size = 8
    end
    object qryDadosItemCupomdesc_item: TStringField
      FieldName = 'desc_item'
      Required = True
      Size = 100
    end
    object qryDadosItemCupomqtde_item: TFloatField
      FieldName = 'qtde_item'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryDadosItemCupomun_med: TStringField
      FieldName = 'un_med'
      Required = True
      Size = 8
    end
    object qryDadosItemCupomvl_unit: TFloatField
      FieldName = 'vl_unit'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryDadosItemCupomdescto_item: TFloatField
      FieldName = 'descto_item'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryDadosItemCupomacres_item: TFloatField
      FieldName = 'acres_item'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryDadosItemCupomvl_canc: TFloatField
      FieldName = 'vl_canc'
      DisplayFormat = '0.00'
    end
    object qryDadosItemCupomcod_tot_parc: TStringField
      FieldName = 'cod_tot_parc'
      Required = True
      Size = 7
    end
    object qryDadosItemCupomaliquota: TFloatField
      FieldName = 'aliquota'
      DisplayFormat = '0.00'
    end
    object qryDadosItemCupomvl_tot_item: TFloatField
      FieldName = 'vl_tot_item'
      DisplayFormat = '0.00'
    end
    object qryDadosItemCupomdatamovimento: TDateField
      Alignment = taCenter
      FieldName = 'datamovimento'
      EditMask = '99/99/9999;1; '
    end
  end
  object ACBrEAD1: TACBrEAD
    OnGetChavePrivada = ACBrEAD1GetChavePrivada
    Left = 448
    Top = 160
  end
  object qryWebService: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeOpen = qryWebServiceBeforeOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select ws.*'
      'from webservice ws'
      'where ws.descricao = '#39'ENVIO-FISCO'#39
      '  and ws.filial = :filialbase'
      'order by codigo desc limit 1'
      ''
      ''
      '')
    RequestLive = False
    Left = 152
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filialbase'
        ParamType = ptUnknown
      end>
    object qryWebServicecodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryWebServicetipo: TStringField
      FieldName = 'tipo'
      Size = 50
    end
    object qryWebServicedescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object qryWebServicenumeroserie: TStringField
      FieldName = 'numeroserie'
      Size = 50
    end
    object qryWebServicearquivopfx: TStringField
      FieldName = 'arquivopfx'
      Size = 200
    end
    object qryWebServiceproxyhost: TStringField
      FieldName = 'proxyhost'
      Size = 100
    end
    object qryWebServiceproxyport: TStringField
      FieldName = 'proxyport'
      Size = 100
    end
    object qryWebServiceproxyuser: TStringField
      FieldName = 'proxyuser'
      Size = 100
    end
    object qryWebServiceproxypass: TStringField
      FieldName = 'proxypass'
      Size = 10
    end
    object qryWebServicesenha: TStringField
      FieldName = 'senha'
      Size = 10
    end
    object qryWebServiceambiente: TStringField
      FieldName = 'ambiente'
      Size = 50
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 56
    Top = 304
  end
  object dsrReducoesZ: TtecDataSource
    DataSet = qryReducoesZ
    Left = 64
    Top = 120
  end
  object qryECFs: TtecQuery
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
      'select ecfs.*'
      'from ecfs'
      'where filial = :filial'
      '   and cast(maquina as integer) = :maquina'
      '/* and cast(intervencao as integer) = :intervencao*/'
      '   and serie = :serie'
      'order by intervencao desc limit 1')
    RequestLive = False
    Left = 200
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'maquina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'intervencao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'serie'
        ParamType = ptUnknown
      end>
    object qryECFscodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryECFsfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryECFsmaquina: TStringField
      FieldName = 'maquina'
      Size = 5
    end
    object qryECFsintervencao: TStringField
      FieldName = 'intervencao'
      Size = 4
    end
    object qryECFsserie: TStringField
      FieldName = 'serie'
    end
    object qryECFscniee: TStringField
      FieldName = 'cniee'
      Size = 6
    end
    object qryECFsmodelo: TIntegerField
      FieldName = 'modelo'
      DisplayFormat = '0'
    end
    object qryECFsmodelodescricao: TStringField
      FieldName = 'modelodescricao'
    end
    object qryECFsgrandetotal: TFloatField
      FieldName = 'grandetotal'
      DisplayFormat = '0.00'
    end
    object qryECFsvendabruta: TFloatField
      FieldName = 'vendabruta'
      DisplayFormat = '0.00'
    end
    object qryECFsmfadicional: TStringField
      FieldName = 'mfadicional'
      Size = 1
    end
    object qryECFstipo: TStringField
      FieldName = 'tipo'
      Size = 7
    end
    object qryECFsmarca: TStringField
      FieldName = 'marca'
    end
    object qryECFsdata_sb: TDateTimeField
      FieldName = 'data_sb'
    end
    object qryECFscnpj: TStringField
      FieldName = 'cnpj'
    end
    object qryECFsie: TStringField
      FieldName = 'ie'
    end
    object qryECFsversao_sb: TStringField
      FieldName = 'versao_sb'
      Size = 15
    end
    object qryECFshash_paf_registro_r01: TStringField
      FieldName = 'hash_paf_registro_r01'
      Size = 32
    end
    object qryECFsminas_legal: TBooleanField
      FieldName = 'minas_legal'
    end
    object qryECFscupom_mania: TBooleanField
      FieldName = 'cupom_mania'
    end
    object qryECFsparaiba_legal: TBooleanField
      FieldName = 'paraiba_legal'
    end
    object qryECFsnota_legal_df: TBooleanField
      FieldName = 'nota_legal_df'
    end
  end
  object qryReducaoNMovimentos: TtecQuery
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
      'select count(*) <= :Dias as gerar'
      'from reducoesz'
      'where numerofabricacao = :numerofabricacao'
      '  and cro = :cro'
      '  and filial = :filial'
      '  and numerousuario = :numerousuario'
      '  and extract(month from datamovimento) = :MesReducao')
    RequestLive = False
    Left = 368
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Dias'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numerofabricacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numerousuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MesReducao'
        ParamType = ptUnknown
      end>
    object qryReducaoNMovimentosgerar: TBooleanField
      FieldName = 'gerar'
    end
  end
  object KAZip1: TKAZip
    IsZipFile = False
    SaveMethod = FastSave
    StoreRelativePath = False
    StoreFolders = False
    CompressionType = ctMaximum
    UseTempFiles = False
    OverwriteAction = oaSkip
    ComponentVersion = '2.0'
    ReadOnly = False
    ApplyAtributes = True
    Active = False
    Left = 416
    Top = 96
  end
  object ACBrBlocoX1: TACBrBlocoX
    Configuracoes.VersaoER = erv0206
    Configuracoes.Geral.SSLLib = libWinCrypt
    Configuracoes.Geral.SSLCryptLib = cryWinCrypt
    Configuracoes.Geral.SSLHttpLib = httpWinHttp
    Configuracoes.Geral.SSLXmlSignLib = xsLibXml2
    Configuracoes.Geral.Salvar = False
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.WebServices.UF = 'SC'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.Salvar = True
    Configuracoes.WebServices.QuebradeLinha = '|'
    Left = 318
    Top = 181
  end
  object qryReducaoZResumoEnvioFisco: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnCalcFields = qryReducaoZResumoEnvioFiscoCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select distinct rz.datamovimento'
      'from reducoesz rz'
      
        'where (rz.datahoraenviofiscoreducaoz = :datahoraenviofiscoreduca' +
        'oz or'
      
        '       rz.datahorareenviofiscoreducaoz = :datahoraenviofiscoredu' +
        'caoz)'
      '  and rz.situacaoprocessamentocodigo <> 2'
      'order by rz.datamovimento')
    RequestLive = False
    Left = 80
    Top = 520
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'datahoraenviofiscoreducaoz'
        ParamType = ptUnknown
      end>
    object qryReducaoZResumoEnvioFiscodatamovimento: TDateField
      DisplayLabel = 'Data do Movimento'
      FieldName = 'datamovimento'
      Visible = False
    end
    object qryReducaoZResumoEnvioFiscodescricaodatamovimento: TStringField
      DisplayLabel = 'Redu'#231#227'o Z'
      FieldKind = fkCalculated
      FieldName = 'descricaodatamovimento'
      Visible = False
      Size = 100
      Calculated = True
    end
  end
  object qryQtReducoaZPendentes: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnCalcFields = qryReducaoZResumoEnvioFiscoCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select count(*) as qt'
      'from reducoesz rz'
      'where (rz.reciboenviofiscoreducaoz is null  or'
      
        '       (rz.reciboenviofiscoreducaoz is not null and rz.situacaop' +
        'rocessamentocodigo in ( /*0,*/ 2)))'
      '   and rz.datamovimento >= :DataInicialEnvioAoFisco'
      '   and rz.filial = :filialbase')
    RequestLive = False
    Left = 64
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DataInicialEnvioAoFisco'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filialbase'
        ParamType = ptUnknown
      end>
    object qryQtReducoaZPendentesqt: TLargeintField
      FieldName = 'qt'
    end
  end
  object qryIncluirfiscoestoquefiliais: TtecQuery
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
      'insert into fiscoestoquefiliais (filial, dataestoque)'
      ''
      '('
      ''
      
        '/*  Esta linha abaixo limita a enviar o estoque somente uma vez ' +
        'por ano  */'
      ' select * from'
      '('
      ''
      ''
      
        'select :filial, cast((date_trunc('#39'MONTH'#39', cast(mes||'#39'-01'#39' as dat' +
        'e))+ INTERVAL '#39'1 MONTH - 1 day'#39') as DATE) as dataestoque'
      'from'
      '('
      ''
      'select distinct to_char('
      ''
      'COALESCE((select max(fef.dataestoque)'
      ' from fiscoestoquefiliais fef'
      ' where fef.filial = :filial'
      
        ' and fef.reciboenviofiscoestoque is not null ), (CAST(:Data_Inic' +
        'ial_Envio_ao_Fisco as date)-1)) + s.a , '#39'YYYY-MM'#39') as mes'
      ''
      
        ' from generate_series(0, /* coalesce(nullif(( */ (cast(to_char(c' +
        'urrent_date,'#39'YYYY-MM-01'#39') as date)-1 -'
      ''
      'COALESCE((select max(fef.dataestoque)'
      ' from fiscoestoquefiliais fef'
      ' where fef.filial = :filial'
      
        ' and fef.reciboenviofiscoestoque is not null ), (CAST(:Data_Inic' +
        'ial_Envio_ao_Fisco as date)-1))'
      ''
      ''
      ' )  /*),0),1)*/'
      ''
      ' ) as s(a)'
      ''
      ')  as s'
      
        '/*  Esta linha abaixo limita a enviar o estoque somente uma vez ' +
        'por ano  */'
      ''
      ') as s'
      'where EXTRACT(day from cast(dataestoque as timestamp))=31'
      '  and EXTRACT(month from cast(dataestoque as timestamp))=12'
      ''
      ')'
      'ON CONFLICT DO NOTHING;'
      ''
      '')
    RequestLive = True
    Left = 464
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Data_Inicial_Envio_ao_Fisco'
        ParamType = ptUnknown
      end>
  end
  object qryIncluirfiscoestoqueprodutos: TtecQuery
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
      
        'insert into fiscoestoqueprodutos (filial, dataestoque, codigoite' +
        'm, item, situacaotributaria, unidade,'
      
        '                                  aliquota, qtdestoque, vl_item,' +
        ' classificacaofiscal)'
      '('
      ''
      
        '  SELECT :filial, :datafinal, codigoitem, item, situacaotributar' +
        'ia, unidade, aliquota,'
      
        '         qtdestoque, vl_item/qtdestoque as vl_unit, classificaca' +
        'ofiscal'
      ''
      ''
      '  from'
      '  ('
      ''
      
        '    SELECT cast(('#39'P'#39'||cast(ep.codigoitem as varchar)) as varchar' +
        '(60)) as codigoitem,  ep.item, ep.situacaotributaria,'
      ''
      '     ep.unidade, ep.aliquota,'
      
        '     (ep.emestoque+ep.reservado+ep.transito+ep.demonstracao+ep.c' +
        'onserto+ep.danificada+ep.reservaprevia) AS qtdestoque,'
      '     custo_medio as vl_item, ep.classificacaofiscal  /*,'
      '     coalesce(subconta,0) as cod_cta*/'
      '    FROM'
      '     ('
      ''
      '       select ep.*,'
      ''
      
        '           (select i.classificacaofiscal from ipi i where i.codi' +
        'go = c.ipi) as classificacaofiscal,'
      '           cl.descricao AS classeproduto,'
      '           cl.codigo AS codigoclasse,'
      '           g.descricao AS grupoproduto,'
      '           g.codigo AS codigogrupo,'
      '           c.descricao AS produto,'
      '           c.codigo AS codigoproduto,'
      
        '           cast(p.descricao||'#39' '#39'||coalesce(p.valorgrade1,'#39#39')||'#39' ' +
        #39'||coalesce(p.valorgrade2,'#39#39') as varchar) AS item,'
      '           ma.descricao AS marca, p.referencia,'
      '           c.unidade,'
      '           c.subconta,'
      ''
      
        '          CAST(CASE WHEN c.incidencia = 5 or c.csosn='#39'300'#39'  THEN' +
        ' '#39'I'#39
      
        '              WHEN (c.incidencia in (4,6,7,11) or c.csosn in ('#39'1' +
        '03'#39','#39'400'#39','#39'900'#39')) THEN '#39'N'#39
      
        '              WHEN (c.incidencia in (2,9,10) or c.csosn in ('#39'201' +
        #39','#39'202'#39','#39'203'#39','#39'500'#39'))  THEN '#39'F'#39
      
        '              WHEN (c.incidencia in (1,3,8) or c.csosn in ('#39'101'#39 +
        ','#39'102'#39'))    THEN '#39'T'#39
      '          END AS CHAR) AS situacaotributaria,'
      ''
      
        '           CAST(COALESCE((SELECT ei.valor FROM estadosicms ei WH' +
        'ERE ei.icms = c.icms AND ei.estado = f.estado),0) AS NUMERIC(4,2' +
        ')) AS aliquota'
      ''
      '       from'
      '       ('
      '         select ep.*,'
      '         m2.valor,'
      '         m2.quantidade as qtdUltimaEntrada'
      '         from'
      '         ('
      '           select'
      '           e.codigofilial,'
      '           e.codigoitem,'
      '           e.localizacao,'
      
        '           e.precocomicms, /*,estoques_preco(e.produto,e.filial)' +
        ' as precovenda*/'
      '           m.emestoque,'
      '           m.reservado,'
      '           m.transito,'
      '           m.demonstracao,'
      '           m.conserto,'
      '           m.danificada,'
      '           m.reservaprevia,'
      '           m.estoquefisico,'
      '           m.financeiro as Custo_Medio'
      '           from'
      '           ('
      '             select m.numero,'
      '             e.filial as codigofilial,'
      '             e.produto as codigoitem,'
      '             e.localizacao,'
      '             e.precocomicms'
      '             from'
      '             ('
      ''
      '               select m2.numero, m1.produto, m1.filial'
      '               from'
      '               ('
      '                select m1.data, m1.produto, m1.filial,'
      #9#9#9#9#9#9#9
      '                   (select max(m2.lancto)'
      '                    from movimentos m2'
      '                    where m2.produto = m1.produto'
      '                    and m2.filial = m1.filial'
      '                    and m2.data = m1.data) as lancto'
      ''
      '                 from'
      '                 ('
      
        '                   select max(m1.data) as data, m1.produto, m1.f' +
        'ilial'
      '                   from movimentos m1'
      '                   where m1.data < (cast(:datafinal as date)+1)'
      
        '                    /* and m1.data>=cast(date_trunc('#39'month'#39', cas' +
        't(:datafinal as date)) as date) */'
      '                   group by m1.produto, m1.filial'
      '                   order by m1.produto, m1.filial'
      '                 ) as m1'
      ''
      
        '               ) as m1 join movimentos m2 on m1.data = m2.data a' +
        'nd m1.lancto = m2.lancto and m1.produto = m2.produto and m1.fili' +
        'al = m2.filial'
      ''
      
        '             ) as m join estoques e on m.produto = e.produto and' +
        ' m.filial = e.filial'
      
        '             Where (e.filial = :filial ) /* WHERE ESTOQUE where ' +
        'e.produto =0 */'
      ''
      '           ) as e join movimentos m on e.numero = m.numero'
      '             and m.financeiro<>0 /*and m1.financeiro<>0*/'
      ''
      
        '         ) as ep LEFT JOIN movimentos m2 ON m2.produto = ep.codi' +
        'goitem AND'
      '           m2.filial = ep.codigofilial and'
      '           m2.numero = (SELECT max(m.numero)'
      '                   from movimentos m'
      '                   where m.produto=ep.codigoitem and'
      '                   m.filial=ep.codigofilial and'
      '                   m.data < (cast(:datafinal as date)+1) and'
      
        '                   /*m.data>=cast(date_trunc('#39'month'#39', cast(:data' +
        'final as date)) as date) and*/'
      '                   substring(m.operacao from 12 for 1)='#39'+'#39')'
      ''
      '       ) as ep'
      '       JOIN filiais f'
      '       on ep.codigofilial = f.codigo'
      #9#9' '
      '       JOIN ( produtos p'
      '       JOIN (((caracteristicas c'
      '       JOIN grupos g'
      '       ON c.grupo = g.codigo)'
      '       JOIN classes cl'
      '       ON c.classe=cl.codigo)'
      '       JOIN marcas ma'
      '       ON c.marca=ma.codigo)'
      '       ON p.caracteristica=c.codigo)'
      '       ON p.codigo = ep.codigoitem'
      
        '       where true /*((not (c.inativo is not null)) or (c.inativo' +
        '>:datafinal))*/'
      ''
      ''
      '    ) as EP'
      '    Order BY item, codigoitem'
      '  ) as T'
      '   WHERE qtdestoque>0'
      ''
      ''
      ''
      ''
      ''
      ');')
    RequestLive = True
    Left = 464
    Top = 472
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end>
  end
  object qryfiscoestoquefiliais: TtecQuery
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
      'select fef.*'
      'from fiscoestoquefiliais fef'
      'where (fef.reciboenviofiscoestoque is null'
      ''
      
        '/* Codigo 3 uso da TecSoft para cancelar um envio com recibo v'#225'l' +
        'ido para poder gerar novamente */'
      ''
      
        '  or (fef.reciboenviofiscoestoque is not null and fef.SituacaoPr' +
        'ocessamentoCodigo in (0,2,9)))'
      '  and fef.filial = :filial'
      
        '  and fef.dataestoque >= (CAST(:Data_Inicial_Envio_ao_Fisco as d' +
        'ate)-1)'
      'order by fef.dataestoque  ')
    RequestLive = True
    Left = 296
    Top = 440
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Data_Inicial_Envio_ao_Fisco'
        ParamType = ptUnknown
      end>
    object qryfiscoestoquefiliaisfilial: TIntegerField
      FieldName = 'filial'
    end
    object qryfiscoestoquefiliaisdataestoque: TDateField
      Alignment = taCenter
      FieldName = 'dataestoque'
      EditMask = '99/99/9999;1; '
    end
    object qryfiscoestoquefiliaisreciboenviofiscoestoque: TStringField
      FieldName = 'reciboenviofiscoestoque'
      Size = 50
    end
    object qryfiscoestoquefiliaissituacaoprocessamentocodigo: TIntegerField
      FieldName = 'situacaoprocessamentocodigo'
    end
    object qryfiscoestoquefiliaisdatahoraenviofiscoestoque: TDateTimeField
      Alignment = taCenter
      FieldName = 'datahoraenviofiscoestoque'
      DisplayFormat = 'dd/MM/yy hh:mm'
      EditMask = '99/99/99 99:99;1; '
    end
    object qryfiscoestoquefiliaissituacaoprocessamentodescricao: TStringField
      FieldName = 'situacaoprocessamentodescricao'
      Size = 200
    end
    object qryfiscoestoquefiliaismensagemprocessamentodescricao: TStringField
      FieldName = 'mensagemprocessamentodescricao'
      Size = 500
    end
    object qryfiscoestoquefiliaissituacaoprocessamentooper: TIntegerField
      FieldName = 'situacaoprocessamentooper'
    end
    object qryfiscoestoquefiliaissituacaoprocessamentooperdescricao: TStringField
      FieldName = 'situacaoprocessamentooperdescricao'
      Size = 200
    end
    object qryfiscoestoquefiliaismensagemprocessamentooperdescricao: TStringField
      FieldName = 'mensagemprocessamentooperdescricao'
      Size = 500
    end
    object qryfiscoestoquefiliaisdatahorareenviofiscoestoque: TDateTimeField
      FieldName = 'datahorareenviofiscoestoque'
    end
  end
  object qryfiscoestoqueprodutos: TtecQuery
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
      'select fep.*'
      'from fiscoestoqueprodutos fep'
      'where fep.filial = :filial'
      '  and fep.dataestoque = :dataestoque'
      'order by fep.codigoitem'
      '')
    RequestLive = False
    Left = 296
    Top = 488
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataestoque'
        ParamType = ptUnknown
      end>
    object qryfiscoestoqueprodutosfilial: TIntegerField
      FieldName = 'filial'
    end
    object qryfiscoestoqueprodutosdataestoque: TDateField
      FieldName = 'dataestoque'
    end
    object qryfiscoestoqueprodutoscodigoitem: TStringField
      FieldName = 'codigoitem'
      Size = 60
    end
    object qryfiscoestoqueprodutositem: TStringField
      FieldName = 'item'
      Size = 100
    end
    object qryfiscoestoqueprodutosunidade: TStringField
      FieldName = 'unidade'
      Size = 8
    end
    object qryfiscoestoqueprodutosqtdestoque: TFloatField
      FieldName = 'qtdestoque'
    end
    object qryfiscoestoqueprodutosvl_item: TFloatField
      FieldName = 'vl_item'
    end
    object qryfiscoestoqueprodutossituacaotributaria: TStringField
      FieldName = 'situacaotributaria'
      Size = 1
    end
    object qryfiscoestoqueprodutosaliquota: TFloatField
      FieldName = 'aliquota'
    end
    object qryfiscoestoqueprodutosclassificacaofiscal: TStringField
      FieldName = 'classificacaofiscal'
      Size = 8
    end
  end
  object qryQtEstoqueFiscoPendente: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnCalcFields = qryReducaoZResumoEnvioFiscoCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select count(*) as qt'
      'from fiscoestoquefiliais fef'
      'where (fef.reciboenviofiscoestoque is null  or'
      
        '       (fef.reciboenviofiscoestoque is not null and fef.situacao' +
        'processamentocodigo in ( /*0,*/ 2)))'
      
        '   and fef.dataestoque >= (cast(:DataInicialEnvioAoFisco as date' +
        ')-1)')
    RequestLive = False
    Left = 64
    Top = 440
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DataInicialEnvioAoFisco'
        ParamType = ptUnknown
      end>
    object qryQtEstoqueFiscoPendenteqt: TLargeintField
      FieldName = 'qt'
    end
  end
  object qryApagarfiscoestoquefiliais: TtecQuery
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
      
        'delete from fiscoestoquefiliais where  reciboenviofiscoestoque i' +
        's null')
    RequestLive = True
    Left = 464
    Top = 368
  end
  object qryfiscoestoquefiliaisResumoEnvioFisco: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnCalcFields = qryfiscoestoquefiliaisResumoEnvioFiscoCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select distinct fef.dataestoque'
      'from fiscoestoquefiliais fef'
      
        'where (fef.datahoraenviofiscoestoque = :datahoraenviofiscoestoqu' +
        'e or'
      
        '       fef.datahorareenviofiscoestoque = :datahoraenviofiscoesto' +
        'que)'
      '  and fef.situacaoprocessamentocodigo <> 2'
      'order by fef.dataestoque')
    RequestLive = False
    Left = 120
    Top = 568
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'datahoraenviofiscoestoque'
        ParamType = ptUnknown
      end>
    object qryfiscoestoquefiliaisResumoEnvioFiscodataestoque: TDateField
      Alignment = taCenter
      FieldName = 'dataestoque'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryfiscoestoquefiliaisResumoEnvioFiscoDescricaoDataEstoque: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescricaoDataEstoque'
      Size = 50
      Calculated = True
    end
  end
  object dsrReducoesZDetalhes: TtecDataSource
    DataSet = qryReducoesZDetalhes
    Left = 168
    Top = 184
  end
  object qryRegistro_R02: TtecQuery
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
      'select r02.*,'
      '       cast(null as varchar(15)) as versao_sb'
      'from registro_r02 r02'
      'where false'
      '')
    RequestLive = True
    Left = 632
    Top = 224
    object qryRegistro_R02numerofabricacao: TStringField
      FieldName = 'numerofabricacao'
    end
    object qryRegistro_R02filial: TIntegerField
      FieldName = 'filial'
    end
    object qryRegistro_R02mfadicional: TStringField
      FieldName = 'mfadicional'
      Size = 1
    end
    object qryRegistro_R02modelodoecf: TStringField
      FieldName = 'modelodoecf'
    end
    object qryRegistro_R02numerousuario: TIntegerField
      FieldName = 'numerousuario'
    end
    object qryRegistro_R02crz: TIntegerField
      FieldName = 'crz'
    end
    object qryRegistro_R02coo: TIntegerField
      FieldName = 'coo'
    end
    object qryRegistro_R02cro: TIntegerField
      FieldName = 'cro'
    end
    object qryRegistro_R02datamovimento: TDateField
      Alignment = taCenter
      FieldName = 'datamovimento'
      EditMask = '99/99/9999;1; '
    end
    object qryRegistro_R02dataemissao: TDateTimeField
      FieldName = 'dataemissao'
    end
    object qryRegistro_R02horaemissao: TDateTimeField
      FieldName = 'horaemissao'
    end
    object qryRegistro_R02vendabrutadiaria: TFloatField
      FieldName = 'vendabrutadiaria'
      DisplayFormat = '0.00'
    end
    object qryRegistro_R02parametroincidenciaissqn: TStringField
      FieldName = 'parametroincidenciaissqn'
      Size = 1
    end
    object qryRegistro_R02coo_inicial: TIntegerField
      FieldName = 'coo_inicial'
    end
    object qryRegistro_R02coo_final: TIntegerField
      FieldName = 'coo_final'
    end
    object qryRegistro_R02totalizadorgeral: TFloatField
      FieldName = 'totalizadorgeral'
      DisplayFormat = '0.00'
    end
    object qryRegistro_R02hash_paf_registro_r02: TStringField
      FieldName = 'hash_paf_registro_r02'
      Size = 32
    end
    object qryRegistro_R02codigo_ecf: TIntegerField
      FieldName = 'codigo_ecf'
    end
    object qryRegistro_R02datahoraenviofiscoreducaoz: TDateTimeField
      FieldName = 'datahoraenviofiscoreducaoz'
    end
    object qryRegistro_R02reciboenviofiscoreducaoz: TStringField
      FieldName = 'reciboenviofiscoreducaoz'
    end
    object qryRegistro_R02versao_sb: TStringField
      FieldName = 'versao_sb'
      Size = 15
    end
  end
  object qryRegistro_R03: TtecQuery
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
      'select r03.*'
      'from registro_r03 r03'
      'where false')
    RequestLive = True
    Left = 632
    Top = 272
    object qryRegistro_R03filial: TIntegerField
      FieldName = 'filial'
    end
    object qryRegistro_R03numerousuario: TIntegerField
      FieldName = 'numerousuario'
    end
    object qryRegistro_R03cro: TIntegerField
      FieldName = 'cro'
    end
    object qryRegistro_R03datamovimento: TDateField
      Alignment = taCenter
      FieldName = 'datamovimento'
      EditMask = '99/99/9999;1; '
    end
    object qryRegistro_R03tipototalizadorparcial: TStringField
      FieldName = 'tipototalizadorparcial'
      Size = 7
    end
    object qryRegistro_R03aliquota: TFloatField
      FieldName = 'aliquota'
      DisplayFormat = '0.00'
    end
    object qryRegistro_R03valoracumulado: TFloatField
      FieldName = 'valoracumulado'
      DisplayFormat = '0.00'
    end
    object qryRegistro_R03hash_paf_registro_r03: TStringField
      FieldName = 'hash_paf_registro_r03'
      Size = 32
    end
    object qryRegistro_R03numerofabricacao: TStringField
      FieldName = 'numerofabricacao'
    end
  end
  object qryIncluir_Registro_R04: TtecQuery
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
      'insert into registro_r04 ('
      'filial               ,'
      'num_usu              ,'
      'cro                  ,'
      'coo                  ,'
      'ccf                  ,'
      'crz                  ,'
      'dt_ini               ,'
      'sub_docto            ,'
      'sub_descto           ,'
      'tp_descto            ,'
      'sub_acres            ,'
      'tp_acres             ,'
      'vl_tot               ,'
      'canc                 ,'
      'vl_ca                ,'
      'ordem_da             ,'
      'nome_cli             ,'
      'cnpj_cpf             ,'
      'hash_paf_registro_r04,'
      'num_fab'
      ')'
      ''
      '('
      ' select'
      ''
      'dlc.filial                ,'
      'dlc.num_usu               ,'
      'dlc.cro                   ,'
      'dlc.coo                   ,'
      'dlc.ccf                   ,'
      'dlc.crz                   ,'
      'dlc.dt_ini                ,'
      'dlc.sub_docto             ,'
      'dlc.sub_descto            ,'
      'dlc.tp_descto             ,'
      'dlc.sub_acres             ,'
      'dlc.tp_acres              ,'
      'dlc.vl_tot                ,'
      'dlc.canc                  ,'
      'dlc.vl_ca                 ,'
      'dlc.ordem_da              ,'
      'dlc.nome_cli              ,'
      'dlc.cnpj_cpf              ,'
      'dlc.hash_paf_registro_r04 ,'
      'dlc.num_fab'
      ''
      ' from detalhecupom dlc'
      ' where dlc.filial = :filial'
      '   and dlc.num_usu = :num_usu'
      '   and dlc.cro = :cro'
      '   and dlc.crz = :crz'
      '   and dlc.num_fab = :num_fab'
      ''
      ')'
      '')
    RequestLive = True
    Left = 632
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'num_usu'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'crz'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'num_fab'
        ParamType = ptUnknown
      end>
  end
  object qryIncluir_Registro_R05: TtecQuery
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
      'insert into registro_r05 ('
      'filial                ,'
      'num_usu               ,'
      'cro                   ,'
      'coo                   ,'
      'num_item              ,'
      'cod_item              ,'
      'desc_item             ,'
      'qtde_item             ,'
      'un_med                ,'
      'vl_unit               ,'
      'descto_item           ,'
      'acres_item            ,'
      'vl_tot_item           ,'
      'cod_tot_parc          ,'
      'ind_canc              ,'
      'qtde_canc             ,'
      'vl_canc               ,'
      'vl_canc_acres         ,'
      'iat                   ,'
      'ippt                  ,'
      'qtde_decimal          ,'
      'vl_decimal            ,'
      'aliq_icms             ,'
      'hash_paf_registro_r05 ,'
      'num_fab               ,'
      'classificacaofiscal   ,'
      'aliquotaipi           ,'
      'cest                  ,'
      'ccf                   ,'
      'dt_ini)'
      ''
      '('
      ' select'
      ''
      'dic.filial                ,'
      'dic.num_usu               ,'
      'dic.cro                   ,'
      'dic.coo                   ,'
      'dic.num_item              ,'
      'dic.cod_item              ,'
      'dic.desc_item             ,'
      'dic.qtde_item             ,'
      'dic.un_med                ,'
      'dic.vl_unit               ,'
      'dic.descto_item           ,'
      'dic.acres_item            ,'
      'dic.vl_tot_item           ,'
      'dic.cod_tot_parc          ,'
      'dic.ind_canc              ,'
      'dic.qtde_canc             ,'
      'dic.vl_canc               ,'
      'dic.vl_canc_acres         ,'
      'dic.iat                   ,'
      'dic.ippt                  ,'
      'dic.qtde_decimal          ,'
      'dic.vl_decimal            ,'
      'dic.aliq_icms             ,'
      'dic.hash_paf_registro_r05 ,'
      'dic.num_fab               ,'
      'dic.classificacaofiscal   ,'
      'dic.aliquotaipi           ,'
      'dic.cest                  ,'
      'dlc.ccf                   ,'
      'dlc.dt_ini'
      ''
      'from dadoscupom dc'
      '     join detalhecupom dlc'
      '       on  dc.filial = dlc.filial'
      '       and dc.num_usu = dlc.num_usu'
      '       and dc.cro = dlc.cro'
      '       and dc.coo = dlc.coo'
      '     join dadositemcupom dic'
      '       on  dc.filial = dic.filial'
      '       and dc.num_usu = dic.num_usu'
      '       and dc.cro = dic.cro'
      '       and dc.coo = dic.coo'
      ''
      ' where dlc.filial = :filial'
      '   and dlc.num_usu = :num_usu'
      '   and dlc.cro = :cro'
      '   and dlc.crz = :crz'
      '   and dlc.num_fab = :num_fab'
      ''
      ')'
      '')
    RequestLive = True
    Left = 632
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'num_usu'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'crz'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'num_fab'
        ParamType = ptUnknown
      end>
  end
  object qryIncluir_Registro_R06: TtecQuery
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
      'insert into registro_r06 ('
      ''
      'filial                ,'
      'num_usu               ,'
      'cro                   ,'
      'coo                   ,'
      'cooref                ,'
      'gnf                   ,'
      'grg                   ,'
      'cdc                   ,'
      'denom                 ,'
      'dt_fin                ,'
      'hr_fin                ,'
      'hash_paf_registro_r06 ,'
      'num_fab )'
      ''
      '('
      ' select'
      ''
      'ddc.filial                ,'
      'ddc.num_usu               ,'
      'ddc.cro                   ,'
      'ddc.coo                   ,'
      'ddc.cooref                ,'
      'ddc.gnf                   ,'
      'ddc.grg                   ,'
      'ddc.cdc                   ,'
      'ddc.denom                 ,'
      'ddc.dt_fin                ,'
      'ddc.hr_fin                ,'
      'ddc.hash_paf_registro_r06 ,'
      'ddc.num_fab'
      ''
      'from dadoscupom dc'
      ''
      '     join detalhedemaisdoctos ddc'
      '       on  dc.filial = ddc.filial'
      '       and dc.num_usu = ddc.num_usu'
      '       and dc.cro = ddc.cro'
      '       and dc.coo = ddc.coo'
      ''
      ' where dc.filial = :filial'
      '   and dc.num_usu = :num_usu'
      '   and dc.cro = :cro'
      '   and dc.coo between :coo_inicial and :coo_final'
      '   and dc.num_fab = :num_fab'
      ''
      ')'
      '')
    RequestLive = True
    Left = 632
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'num_usu'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'coo_inicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'coo_final'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'num_fab'
        ParamType = ptUnknown
      end>
  end
  object qryIncluir_Registro_R07: TtecQuery
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
      'insert into registro_r07 ('
      ''
      'filial                ,'
      'num_usu               ,'
      'cro                   ,'
      'coo                   ,'
      'num_item              ,'
      'mp                    ,'
      'vl_pagto              ,'
      'ind_est               ,'
      'vl_est                ,'
      'hash_paf_registro_r07 ,'
      'num_fab               ,'
      'ccf                   ,'
      'gnf                   ,'
      'datacupom             ,'
      'tipo                  )'
      ''
      ''
      '('
      ''
      ''
      'select'
      '  fp.filial                ,'
      '  fp.num_usu               ,'
      '  fp.cro                   ,'
      '  fp.coo                   ,'
      '  fp.num_item              ,'
      '  fp.mp                    ,'
      '  fp.vl_pagto              ,'
      '  fp.ind_est               ,'
      '  fp.vl_est                ,'
      
        '  md5(fp.num_fab||cast(fp.coo as varchar)||cast(COALESCE(dlc.ccf' +
        ',0) as varchar)||cast(0 as varchar)||cast(dlc.dt_ini as varchar)' +
        ') ,'
      '  fp.num_fab               ,'
      '  dlc.ccf                  ,'
      '  cast(null as integer) as gnf,'
      '  dlc.dt_ini as datacupom,'
      '  cast('#39'detalhecupom'#39' as varchar(12)) as tipo'
      ''
      ''
      'from detalhecupom dlc'
      '     join formaspagamentoecf fp'
      '       on  dlc.filial = fp.filial'
      '       and dlc.num_usu = fp.num_usu'
      '       and dlc.cro = fp.cro'
      '       and dlc.coo = fp.coo'
      ''
      'where'
      ''
      '  fp.filial  = :filial and'
      '  fp.num_usu = :num_usu and'
      '  fp.cro     = :cro and'
      '  fp.coo     between :coo_inicial and :coo_final and'
      '  fp.num_fab = :num_fab'
      ''
      ''
      'UNION'
      ''
      'select'
      '  fp.filial                ,'
      '  fp.num_usu               ,'
      '  fp.cro                   ,'
      '  fp.coo                   ,'
      '  fp.num_item              ,'
      '  fp.mp                    ,'
      '  fp.vl_pagto              ,'
      '  fp.ind_est               ,'
      '  fp.vl_est                ,'
      
        '  md5(fp.num_fab||cast(fp.coo as varchar)||cast(0 as varchar)||c' +
        'ast(COALESCE(ddc.gnf,0) as varchar)||cast(ddc.dt_fin as varchar)' +
        ') ,'
      '  fp.num_fab               ,'
      '  cast(null as integer) as ccf,'
      '  ddc.gnf,'
      '  ddc.dt_fin as datacupom,'
      '  cast('#39'demaisdoctos'#39' as varchar(12)) as tipo'
      ''
      'from detalhedemaisdoctos ddc'
      '     join formaspagamentoecf fp'
      '       on  ddc.filial = fp.filial'
      '       and ddc.num_usu = fp.num_usu'
      '       and ddc.cro = fp.cro'
      '       and ddc.coo = fp.coo'
      '       and ind_est ='#39'N'#39
      ''
      'where'
      '  fp.filial  = :filial and'
      '  fp.num_usu = :num_usu and'
      '  fp.cro     = :cro and'
      '  fp.coo     between :coo_inicial and :coo_final  and'
      '  fp.num_fab = :num_fab'
      ''
      ''
      ')'
      '')
    RequestLive = True
    Left = 632
    Top = 472
    ParamData = <
      item
        DataType = ftString
        Name = 'filial'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'num_usu'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'cro'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'coo_inicial'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'coo_final'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'num_fab'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
end
