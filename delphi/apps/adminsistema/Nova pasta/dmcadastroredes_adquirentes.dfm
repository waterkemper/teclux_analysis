inherited dtmCadastroRedes_Adquirentes: TdtmCadastroRedes_Adquirentes
  Left = 233
  Top = 151
  Height = 254
  Width = 464
  object qryRedes_Adquirentes: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterClose = qryRedes_AdquirentesAfterClose
    AfterScroll = qryRedes_AdquirentesAfterScroll
    OnDeleteError = PostError
    OnEditError = PostError
    OnPostError = PostError
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT *'
      'FROM Redes_Adquirentes'
      'WHERE codigo = :codigo')
    RequestLive = True
    Left = 69
    Top = 15
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryRedes_Adquirentescodigo: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryRedes_Adquirentesdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Required = True
      Size = 30
    end
    object qryRedes_Adquirentesmnemonico: TStringField
      DisplayLabel = 'Mnem'#244'nico'
      FieldName = 'mnemonico'
      Required = True
      Size = 3
    end
    object qryRedes_Adquirentesestoque: TBooleanField
      FieldName = 'estoque'
    end
  end
  object qryRedes_Adquirentes_Tipos_Recebimentos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeInsert = qryRedes_Adquirentes_Tipos_RecebimentosBeforeInsert
    BeforeEdit = qryRedes_Adquirentes_Tipos_RecebimentosBeforeEdit
    BeforeDelete = qryRedes_Adquirentes_Tipos_RecebimentosBeforeDelete
    AfterDelete = qryRedes_Adquirentes_Tipos_RecebimentosAfterDelete
    OnDeleteError = PostError
    OnEditError = PostError
    OnPostError = PostError
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'Select GF.*, '
      '           (Select F.Nome '
      '            From filiais F'
      '            Where (F.Codigo = GF.Filial)) as Nome'
      'From  filiaisRedes_Adquirentes GF'
      'Where GF.Grupo =:Grupo'
      'Order By GF.Filial'
      '')
    RequestLive = True
    Left = 234
    Top = 15
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Grupo'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryRedes_Adquirentes_Tipos_Recebimentosgrupo: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'grupo'
    end
    object qryRedes_Adquirentes_Tipos_Recebimentosfilial: TIntegerField
      DisplayLabel = 'Filial'
      FieldName = 'filial'
    end
    object qryRedes_Adquirentes_Tipos_Recebimentosnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 40
    end
  end
  object dsrRedes_Adquirentes: TtecDataSource
    DataSet = qryRedes_Adquirentes
    Left = 69
    Top = 74
  end
  object dsrFiliaisRedes_Adquirentes: TtecDataSource
    DataSet = qryRedes_Adquirentes_Tipos_Recebimentos
    Left = 234
    Top = 74
  end
  object spcProximoRedes_Adquirentes: TtecQuery
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
      'SELECT Redes_Adquirentes_proximocodigo() as codigo')
    RequestLive = False
    Left = 69
    Top = 191
    object spcProximoRedes_Adquirentescodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
  object qryConsultaRedes_Adquirentes: TtecQuery
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
      'Select   * '
      'From Redes_Adquirentes'
      'Order By  UPPER(TO_ASCII(descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 69
    Top = 135
    object qryConsultaRedes_Adquirentesdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
    object qryConsultaRedes_Adquirentesmnemonico: TStringField
      DisplayLabel = 'Mnem'#244'nico'
      FieldName = 'mnemonico'
      Visible = False
      Size = 3
    end
    object qryConsultaRedes_Adquirentescodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
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
      'Select F.Codigo, '
      '              F.Nome '
      'From    filiais F'
      '/*                                        */'
      'Order By UPPER(TO_ASCII(f.nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 371
    Top = 134
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
  object qryProcuraFiliais: TtecQuery
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
      'Select F.Codigo, '
      '              F.Nome'
      'From    filiais F'
      'Where (F.Codigo =:Codigo) '
      '/* Preencher em RunTime    */'
      ''
      ''
      '')
    RequestLive = False
    Left = 371
    Top = 15
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraFiliaisnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Required = True
      Size = 40
    end
    object qryProcuraFiliaiscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Required = True
    end
  end
  object dsrProcuraFiliais: TtecDataSource
    DataSet = qryProcuraFiliais
    Left = 371
    Top = 73
  end
end
