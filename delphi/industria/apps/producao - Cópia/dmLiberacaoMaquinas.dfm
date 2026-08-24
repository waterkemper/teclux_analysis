inherited dtmLiberacaoMaquinas: TdtmLiberacaoMaquinas
  OldCreateOrder = False
  Left = 504
  Top = 305
  Height = 276
  Width = 458
  object dsrMaquinasBloqueadas: TtecDataSource
    DataSet = qryMaquinasBloqueadas
    OnDataChange = dsrMaquinasBloqueadasDataChange
    Left = 80
    Top = 48
  end
  object qryMaquinasBloqueadas: TtecQuery
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
      ''
      'SELECT oou.Maquina,'
      '       m.Descricao AS DescricaoMaquina,'
      '       ooup.OSP,'
      '       ooup.Lote,'
      '       oou.operacao,'
      '       o.Nome AS NomeOperacao, o.C01, o.C02, o.C03,'
      '       ooup.Usuario,'
      '       u.Nome AS NomeUsuario,'
      '       ooup.Data,'
      '       ooup.Inicio,'
      '       oou.DataTermino,'
      '       oou.Termino,'
      '       ooup.InicioParada,'
      '       ooup.CodigoParada,'
      '       mp.Descricao AS DescricaoParada,'
      '       ooup.FimParada,'
      '       FALSE AS Liberar'
      ''
      'FROM ((OperacoesOSPUsuarioParadas ooup'
      '       JOIN Operacoes o ON o.Codigo = ooup.Operacao'
      '       JOIN MotivosParadas mp'
      '       ON ooup.CodigoParada = mp.Codigo)'
      '      '
      '       JOIN ((OperacoesOSPUsuario oou'
      '             JOIN Usuarios u'
      '                 ON oou.Usuario = u.Codigo)'
      '                 '
      '             JOIN (OperacoesMaquinas om'
      '                   JOIN Maquinas m'
      '                   ON om.Maquina = m.Codigo)'
      ''
      '                   '
      '             ON oou.operacao = om.operacao'
      '             AND oou.Maquina = om.Maquina)'
      ''
      ''
      '       ON oou.osp      = ooup.osp      AND'
      '          oou.lote     = ooup.lote     AND'
      '          oou.operacao = ooup.operacao AND'
      '          oou.usuario  = ooup.usuario  AND'
      '          oou.Data     = ooup.Data     AND'
      '          oou.inicio   = ooup.inicio)'
      '          '
      ''
      'WHERE (oou.DataTermino  IS NOT NULL AND'
      '      COALESCE(ooup.BloqueiaMaquina,FALSE) AND'
      '      ooup.FimParada is null )'
      ''
      'ORDER BY ooup.InicioParada')
    RequestLive = True
    Left = 152
    Top = 32
    object qryMaquinasBloqueadasmaquina: TIntegerField
      DisplayLabel = 'M'#225'quina'
      FieldName = 'maquina'
      DisplayFormat = '0'
    end
    object qryMaquinasBloqueadasdescricaomaquina: TStringField
      DisplayLabel = 'Descri'#231#227'o da M'#225'quina'
      FieldName = 'descricaomaquina'
      Size = 30
    end
    object qryMaquinasBloqueadasosp: TIntegerField
      DisplayLabel = 'OSP'
      FieldName = 'osp'
      DisplayFormat = '0'
    end
    object qryMaquinasBloqueadasnomeoperacao: TStringField
      FieldName = 'nomeoperacao'
      Size = 10
    end
    object qryMaquinasBloqueadasc01: TStringField
      FieldName = 'c01'
      Size = 2
    end
    object qryMaquinasBloqueadasc02: TStringField
      FieldName = 'c02'
      Size = 2
    end
    object qryMaquinasBloqueadasc03: TStringField
      FieldName = 'c03'
      Size = 2
    end
    object qryMaquinasBloqueadaslote: TIntegerField
      DisplayLabel = 'Lote'
      FieldName = 'lote'
      DisplayFormat = '0'
    end
    object qryMaquinasBloqueadasusuario: TIntegerField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'usuario'
      DisplayFormat = '0'
    end
    object qryMaquinasBloqueadasnomeusuario: TStringField
      DisplayLabel = 'Nome do usu'#225'rio'
      FieldName = 'nomeusuario'
      Size = 40
    end
    object qryMaquinasBloqueadasdata: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data'
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object qryMaquinasBloqueadasinicio: TTimeField
      Alignment = taCenter
      DisplayLabel = 'In'#237'cio'
      FieldName = 'inicio'
      DisplayFormat = 'hh:mm:ss'
      EditMask = '99:99;1; '
    end
    object qryMaquinasBloqueadasdatatermino: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data'
      FieldName = 'datatermino'
      EditMask = '99/99/9999;1; '
    end
    object qryMaquinasBloqueadastermino: TTimeField
      Alignment = taCenter
      DisplayLabel = 'T'#233'rmino'
      FieldName = 'termino'
      EditMask = '99:99;1; '
    end
    object qryMaquinasBloqueadasinicioparada: TDateTimeField
      DisplayLabel = 'In'#237'cio da Parada'
      FieldName = 'inicioparada'
      DisplayFormat = 'dd/mm/yyyy hh:mm:ss'
    end
    object qryMaquinasBloqueadascodigoparada: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigoparada'
      DisplayFormat = '0'
    end
    object qryMaquinasBloqueadasdescricaoparada: TStringField
      DisplayLabel = 'Descri'#231#227'o da Parada'
      FieldName = 'descricaoparada'
      Size = 50
    end
    object qryMaquinasBloqueadasliberar: TBooleanField
      DisplayLabel = 'Liberar'
      FieldName = 'liberar'
    end
    object qryMaquinasBloqueadasfimparada: TDateTimeField
      FieldName = 'fimparada'
    end
    object qryMaquinasBloqueadasoperacao: TIntegerField
      FieldName = 'operacao'
    end
  end
  object qryUpdatesMaquinasBloqueadas: TtecQuery
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
      'update operacoesospusuarioparadas'
      'set fimparada = current_timestamp'
      'where osp = :osp'
      '  and lote = :lote'
      '  and operacao = :operacao'
      '  and usuario = :usuario'
      '  and data = :data'
      '  and inicio = :inicio'
      '  and codigoparada = :codigoparada')
    RequestLive = False
    Left = 168
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'osp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'lote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'operacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'usuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'data'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'inicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigoparada'
        ParamType = ptUnknown
      end>
  end
end
