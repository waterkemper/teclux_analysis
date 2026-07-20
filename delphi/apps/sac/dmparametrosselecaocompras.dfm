inherited dtmParametrosSelecaoCompras: TdtmParametrosSelecaoCompras
  Left = 202
  Top = 250
  Height = 311
  Width = 514
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
      'select  f.codigo,'
      '        f.mnemonico'
      'from filiais f'
      'where f.codigo = :codigo')
    RequestLive = False
    Left = 60
    Top = 63
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryFiliaiscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
    object qryFiliaismnemonico: TStringField
      DisplayLabel = 'MNem'#244'nico'
      FieldName = 'mnemonico'
      Size = 3
    end
  end
  object dsrFiliais: TtecDataSource
    DataSet = qryFiliais
    Left = 208
    Top = 63
  end
  object dsrGruposDeFiliais: TtecDataSource
    DataSet = qryGruposDeFiliais
    Left = 208
    Top = 122
  end
  object dsrConsultaContratos: TtecDataSource
    DataSet = qryConsultaContratos
    Left = 208
    Top = 7
  end
  object qryGruposDeFiliais: TtecQuery
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
      'select g.codigo,'
      '       g.mnemonico'
      'from gruposfiliais g'
      'where g.codigo = :codigo')
    RequestLive = False
    Left = 60
    Top = 122
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryGruposDeFiliaiscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
    object qryGruposDeFiliaismnemonico: TStringField
      DisplayLabel = 'MNem'#244'nico'
      FieldName = 'mnemonico'
      Required = True
      Size = 3
    end
  end
  object qryConsultaContratos: TtecQuery
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
      'Set DateStyle = ISO, european;'
      'Select distinct on (c.codigo) c.codigo,'
      '        c.Nome as nomecliente,'
      '        s.numero,'
      '        s.Data,'
      '        s.FilialVenda'
      'from  Contratos s,'
      '        Clientes c'
      'where (s.cliente = c.codigo) and'
      '      (s.origem is null) and (s.situacao = '#39'F'#39')'
      '      and not contratos_estornado(s.numero) '
      '/* as linhas em branco ser'#227'o preenchidas em runtime */'
      '/*   dependendo das op'#231#245'es de pesquisa. */'
      '/*                 */'
      '/*                 */'
      '/*                 */'
      '/*  faixa de valor */'
      'order by c.codigo'
      ''
      '')
    RequestLive = False
    Left = 60
    Top = 7
    object qryConsultaContratoscodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryConsultaContratosnomecliente: TStringField
      FieldName = 'nomecliente'
      Size = 40
    end
    object qryConsultaContratosnumero: TStringField
      FieldName = 'numero'
    end
    object qryConsultaContratosdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object qryConsultaContratosfilialvenda: TIntegerField
      FieldName = 'filialvenda'
      DisplayFormat = '0'
    end
  end
  object dsrConsultaFiliais: TtecDataSource
    DataSet = qryConsultaFiliais
    Left = 208
    Top = 182
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
      'select  f.codigo,'
      '        f.nome,'
      '        f.mnemonico'
      'from filiais f'
      'order by f.codigo')
    RequestLive = False
    Left = 60
    Top = 182
    object qryConsultaFiliaiscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryConsultaFiliaisnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaFiliaismnemonico: TStringField
      DisplayLabel = 'MNem'#244'nico'
      FieldName = 'mnemonico'
      Size = 3
    end
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
      'select g.codigo,'
      '       g.descricao,'
      '       g.mnemonico'
      'from gruposfiliais g'
      'order by g.codigo')
    RequestLive = False
    Left = 60
    Top = 242
    object qryConsultaGrupoFiliaiscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryConsultaGrupoFiliaisdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
    object qryConsultaGrupoFiliaismnemonico: TStringField
      DisplayLabel = 'MNem'#244'nico'
      FieldName = 'mnemonico'
      Size = 3
    end
  end
  object dsrConsultaGrupoFiliais: TtecDataSource
    DataSet = qryConsultaGrupoFiliais
    Left = 208
    Top = 242
  end
end
