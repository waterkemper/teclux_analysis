inherited dtmCadastroMotivosParadas: TdtmCadastroMotivosParadas
  OldCreateOrder = False
  Left = 595
  Top = 232
  Height = 408
  Width = 449
  object dsrMotivosParadas: TtecDataSource
    DataSet = qryMotivosParadas
    Left = 88
    Top = 24
  end
  object qryMotivosParadas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryMotivosParadasAfterScroll
    OnNewRecord = qryMotivosParadasNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select nc.*'
      'from  motivosparadas nc'
      'where nc.codigo = :codigo')
    RequestLive = True
    Left = 88
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryMotivosParadascodigo: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryMotivosParadasdescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
    object qryMotivosParadasbloqueiamaquina: TBooleanField
      FieldName = 'bloqueiamaquina'
    end
    object qryMotivosParadasparadanaoprogramada: TBooleanField
      FieldName = 'paradanaoprogramada'
    end
    object qryMotivosParadasNaoInfluiEficiencia: TBooleanField
      FieldName = 'naoinfluieficiencia'
    end
  end
  object qryMotivosParadasProximo: TtecQuery
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
      'select coalesce(max(codigo),0)+1 as codigo'
      'from MotivosParadas')
    RequestLive = True
    Left = 88
    Top = 144
    object qryMotivosParadasProximocodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
  object qryRegistrodasOperacoes: TtecQuery
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
      ';'
      'SELECT Inclusao.UsuarioInclusao,'
      
        '       CAST(TO_CHAR(Inclusao.DataInclusao, '#39'DD/MM/YYYY HH24:MI:S' +
        'S'#39') AS VARCHAR(20)) AS DataInclusao,'
      '      (SELECT u.Nome'
      '          FROM Usuarios u'
      
        '          WHERE u.UseName = UsuarioInclusao) AS NomeUsuarioInclu' +
        'sao,'
      ''
      '       Alteracao.UsuarioAlteracao,'
      
        '       CAST(TO_CHAR(Alteracao.DataAlteracao, '#39'DD/MM/YYYY HH24:MI' +
        ':SS'#39') AS VARCHAR(20)) AS DataAlteracao,'
      '      (SELECT u.Nome'
      '          FROM Usuarios u'
      
        '          WHERE u.UseName = UsuarioAlteracao) AS NomeUsuarioAlte' +
        'racao,'
      '       Alteracao.Operacao,'
      '       Alteracao.Tabela'
      ''
      'FROM'
      ''
      '('
      ' SELECT Inclusao.*'
      ' FROM'
      ''
      ' ('
      '  (SELECT mpl.Trigger_User    AS UsuarioInclusao,'
      '          mpl.Trigger_Changed AS DataInclusao'
      '      FROM MotivosParadas_Log mpl'
      '      WHERE mpl.Codigo    = :Motivo AND'
      '            Trigger_Mode = '#39'INSERT'#39
      '      ORDER BY mpl.Trigger_Changed DESC LIMIT 1)'
      ''
      ''
      '  UNION ALL'
      ''
      '  (SELECT CAST(NULL AS VARCHAR(50)) AS UsuarioInclusao,'
      '          CAST(NULL AS TIMESTAMP)   AS DataInclusao'
      '      WHERE NOT EXISTS (SELECT mpl.Codigo'
      '                           FROM MotivosParadas_Log mpl'
      '                           WHERE mpl.Codigo = :Motivo AND'
      '                                 Trigger_Mode = '#39'INSERT'#39
      
        '                           ORDER BY mpl.Trigger_Changed DESC LIM' +
        'IT 1))'
      ' ) AS Inclusao'
      ''
      ') AS Inclusao,'
      ''
      ''
      '('
      ' SELECT Alteracao.*'
      ' FROM'
      ''
      ' ('
      '  SELECT Alteracao.* FROM'
      ''
      '  ('
      '   (SELECT mpl.Trigger_User    AS UsuarioAlteracao,'
      '           mpl.Trigger_Changed AS DataAlteracao,'
      ''
      
        '           CAST(CASE WHEN Trigger_Mode = '#39'INSERT'#39' THEN '#39'INCLUS'#195'O' +
        #39
      
        '                                                  ELSE '#39'ALTERA'#199#195 +
        'O'#39
      '                END AS VARCHAR(10)) AS Operacao,'
      '           CAST('#39'MOTIVOS PARADAS'#39' AS VARCHAR(30)) AS Tabela'
      ''
      '       FROM MotivosParadas_Log mpl'
      '       WHERE mpl.Codigo = :Motivo               AND'
      '             Trigger_Mode IN ('#39'INSERT'#39', '#39'UPDATE'#39') AND'
      '             Trigger_Tuple = '#39'new'#39
      '       ORDER BY mpl.Trigger_Changed DESC LIMIT 1)'
      ''
      '  ) AS Alteracao'
      '  ORDER BY DataAlteracao DESC LIMIT 1'
      ' ) AS Alteracao'
      ') AS Alteracao'
      'ORDER BY UsuarioInclusao')
    RequestLive = False
    Left = 240
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'motivo'
        ParamType = ptUnknown
      end>
    object qryRegistrodasOperacoesusuarioinclusao: TStringField
      FieldName = 'usuarioinclusao'
      Size = 32
    end
    object qryRegistrodasOperacoesdatainclusao: TStringField
      FieldName = 'datainclusao'
    end
    object qryRegistrodasOperacoesusuarioalteracao: TStringField
      FieldName = 'usuarioalteracao'
      Size = 32
    end
    object qryRegistrodasOperacoesdataalteracao: TStringField
      FieldName = 'dataalteracao'
    end
    object qryRegistrodasOperacoesoperacao: TStringField
      FieldName = 'operacao'
      Size = 10
    end
    object qryRegistrodasOperacoestabela: TStringField
      FieldName = 'tabela'
      Size = 30
    end
    object qryRegistrodasOperacoesnomeusuarioinclusao: TStringField
      FieldName = 'nomeusuarioinclusao'
      Size = 40
    end
    object qryRegistrodasOperacoesnomeusuarioalteracao: TStringField
      FieldName = 'nomeusuarioalteracao'
      Size = 40
    end
  end
end
