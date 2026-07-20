inherited dtmManutencaoLigacao: TdtmManutencaoLigacao
  OldCreateOrder = True
  Left = 199
  Top = 175
  Height = 282
  Width = 533
  object qryManutencaoLigacao: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterPost = qryManutencaoLigacaoAfterPost
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'Select   * '
      'From    Ligacoes'
      '/*                         */'
      '/*                         */'
      '/*                         */'
      'Order by Situacao,Datahora')
    RequestLive = True
    Left = 203
    Top = 18
    object qryManutencaoLigacaofiltrosac: TIntegerField
      FieldName = 'filtrosac'
      ReadOnly = True
      DisplayFormat = '0'
    end
    object qryManutencaoLigacaocliente: TIntegerField
      FieldName = 'cliente'
      ReadOnly = True
      DisplayFormat = '0'
    end
    object qryManutencaoLigacaousuario: TIntegerField
      FieldName = 'usuario'
      ReadOnly = True
      DisplayFormat = '0'
    end
    object qryManutencaoLigacaodatahora: TDateTimeField
      FieldName = 'datahora'
      ReadOnly = True
    end
    object qryManutencaoLigacaosituacao: TStringField
      FieldName = 'situacao'
      ReadOnly = True
      Size = 1
    end
    object qryManutencaoLigacaoreligado: TIntegerField
      FieldName = 'religado'
      ReadOnly = True
      DisplayFormat = '0'
    end
    object qryManutencaoLigacaocontato: TIntegerField
      FieldName = 'contato'
      ReadOnly = True
      DisplayFormat = '0'
    end
    object qryManutencaoLigacaomarcar: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'marcar'
      DisplayValues = 'Sim;N'#227'o'
      Calculated = True
    end
  end
  object dsrManutencaoLigacao: TtecDataSource
    DataSet = qryManutencaoLigacao
    Left = 384
    Top = 18
  end
  object qryFiltrosSAC: TtecQuery
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
      'Select  Numero,'
      '           Descricao'
      'From    FiltrosSAC'
      'Where  Numero =:Numero')
    RequestLive = True
    Left = 203
    Top = 80
    ParamData = <
      item
        DataType = ftString
        Name = 'Numero'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryFiltrosSACnumero: TIntegerField
      FieldName = 'numero'
      Required = True
    end
    object qryFiltrosSACdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 30
    end
  end
  object dsFiltrosSAC: TtecDataSource
    DataSet = qryFiltrosSAC
    Left = 384
    Top = 80
  end
  object qryTotaisManutencaoLigacao: TtecQuery
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
      
        'select    int4(sum(case  when (situacao = '#39'A'#39') then 1 else 0 end' +
        ')) as QtdeAtendida,'
      
        '            int4(sum(case  when (situacao = '#39'R'#39') then 1 else 0 e' +
        'nd)) as QtdeReligar,'
      
        '            int4(sum(case  when (situacao = '#39'C'#39') then 1 else 0 e' +
        'nd)) as QtdeCancelado,'
      
        '            int4(sum(case  when (situacao = '#39'D'#39') then 1 else 0 e' +
        'nd)) as QtdeDiscando,'
      
        '            int4(sum(case  when (situacao = '#39'0'#39') then 1 else 0 e' +
        'nd)) as QtdeLigar'
      'From     Ligacoes'
      '/*                                              */')
    RequestLive = False
    Active = True
    Left = 203
    Top = 145
    object qryTotaisManutencaoLigacaoqtdeatendida: TIntegerField
      FieldName = 'qtdeatendida'
      DisplayFormat = '0'
    end
    object qryTotaisManutencaoLigacaoqtdereligar: TIntegerField
      FieldName = 'qtdereligar'
      DisplayFormat = '0'
    end
    object qryTotaisManutencaoLigacaoqtdecancelado: TIntegerField
      FieldName = 'qtdecancelado'
      DisplayFormat = '0'
    end
    object qryTotaisManutencaoLigacaoqtdediscando: TIntegerField
      FieldName = 'qtdediscando'
      DisplayFormat = '0'
    end
    object qryTotaisManutencaoLigacaoqtdeligar: TIntegerField
      FieldName = 'qtdeligar'
      DisplayFormat = '0'
    end
  end
  object dsrTotaisManutencaoLigacao: TtecDataSource
    DataSet = qryTotaisManutencaoLigacao
    Left = 384
    Top = 145
  end
  object qryConsultaFiltrosSAC: TtecQuery
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
      'Select * '
      'From   FiltrosSAC'
      'Order By UPPER(TO_ASCII(descricao,''LATIN1''))')
    RequestLive = False
    Left = 201
    Top = 214
    object qryConsultaFiltrosSACdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Required = True
      Size = 30
    end
    object qryConsultaFiltrosSACnumero: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'numero'
      Required = True
      DisplayFormat = '0'
    end
  end
end
