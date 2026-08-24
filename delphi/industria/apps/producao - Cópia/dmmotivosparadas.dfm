inherited dtmmotivosparadas: Tdtmmotivosparadas
  OldCreateOrder = False
  Left = 765
  Top = 216
  Height = 462
  Width = 647
  object qrymotivosparadas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qrymotivosparadasAfterOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'SQLIntervalo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SQLSetoresProducao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SQLOperadores'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SQLMaquinas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SQLMotivosParadas'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select oou.osp,'
      '       oou.lote,'
      ''
      '       o.Nome AS NomeOperacao,'
      '       o.C01,'
      '       o.C02,'
      '       o.C03,'
      ''
      '       sp.codigo as setor,'
      '       sp.descricao as descricaosetor,'
      '       '
      '       m.codigo as maquina,'
      '       m.descricao as descricaomaquina,'
      '       '
      '       ooup.usuario,'
      '       u.nome as nomeusuario,'
      ''
      '       ooup.codigoparada,'
      '       mp.descricao as descricaoparada,'
      ''
      '       sum(ooup.tempoparada) as tempoparada,'
      '       '
      '       cp.pn'
      '       '
      'FROM OperacoesOSPUsuario oou'
      '     join OperacoesOSPUsuarioparadas ooup'
      '          join motivosparadas mp'
      '          on ooup.codigoparada = mp.codigo'
      '          '
      '     on oou.osp = ooup.osp and'
      '        oou.lote = ooup.lote and'
      '        oou.operacao = ooup.operacao and'
      '        oou.usuario = ooup.usuario and'
      '        oou.data = ooup.data and'
      '        oou.inicio = ooup.inicio'
      ''
      '     join osp on osp.numero = oou.osp'
      ''
      '     join clientesprodutos cp'
      '        on cp.cliente = osp.cliente and'
      '           cp.tipocliente = osp.tipocliente and'
      '           cp.produto = osp.produto'
      ''
      '     JOIN Operacoes o  ON oou.Operacao = o.Codigo'
      '     JOIN Usuarios u   ON oou.Usuario  = u.Codigo'
      
        '     JOIN Maquinas m   ON m.Codigo     = COALESCE(oou.Maquina, (' +
        'SELECT om.Maquina FROM OperacoesMaquinas om'
      
        '                                                                ' +
        'WHERE om.Operacao = oou.Operacao LIMIT 1))'
      '     JOIN SetoresProducao sp ON sp.Codigo = m.SetorProducao'
      ''
      ''
      'WHERE true'
      ''
      '   %SQLIntervalo'
      '   %SQLSetoresProducao'
      '   %SQLOperadores'
      '   %SQLMaquinas'
      '   %SQLMotivosParadas'
      ''
      
        'group by sp.codigo, sp.descricao, m.codigo, m.descricao, ooup.us' +
        'uario, u.nome, ooup.codigoparada, mp.descricao, cp.pn, oou.osp, ' +
        'oou.lote, o.Nome, o.C01, o.C02, o.C03'
      
        'order by sp.codigo, sp.descricao, m.codigo, m.descricao, ooup.us' +
        'uario, u.nome, ooup.codigoparada, mp.descricao, cp.pn, oou.osp, ' +
        'oou.lote, o.Nome, o.C01, o.C02, o.C03'
      ''
      ''
      '/*'
      ''
      ':dataInicial'
      ':dataFinal'
      ''
      '*/')
    RequestLive = True
    Left = 96
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dataInicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataFinal'
        ParamType = ptUnknown
      end>
    object qrymotivosparadassetor: TStringField
      DisplayLabel = 'Setor'
      FieldName = 'setor'
      Required = True
      Size = 4
    end
    object qrymotivosparadasdescricaosetor: TStringField
      DisplayLabel = 'Descri'#231#227'o do Setor'
      FieldName = 'descricaosetor'
      Size = 50
    end
    object qrymotivosparadasmaquina: TIntegerField
      DisplayLabel = 'M'#225'quina'
      FieldName = 'maquina'
      Required = True
    end
    object qrymotivosparadasdescricaomaquina: TStringField
      DisplayLabel = 'Descri'#231#227'o da M'#225'quina'
      FieldName = 'descricaomaquina'
      Required = True
      Size = 30
    end
    object qrymotivosparadasusuario: TIntegerField
      DisplayLabel = 'operador'
      FieldName = 'usuario'
      Required = True
    end
    object qrymotivosparadasnomeusuario: TStringField
      DisplayLabel = 'Nome do Operador'
      FieldName = 'nomeusuario'
      Required = True
      Size = 40
    end
    object qrymotivosparadascodigoparada: TIntegerField
      DisplayLabel = 'Parada'
      FieldName = 'codigoparada'
      Required = True
    end
    object qrymotivosparadasdescricaoparada: TStringField
      DisplayLabel = 'Descri'#231#227'o da Parada'
      FieldName = 'descricaoparada'
      Size = 50
    end
    object qrymotivosparadastempoparada: TLargeintField
      DisplayLabel = 'Tempo de parada'
      FieldName = 'tempoparada'
    end
    object qrymotivosparadaspn: TStringField
      DisplayLabel = 'PN'
      FieldName = 'pn'
      Size = 10
    end
    object qrymotivosparadasosp: TIntegerField
      DisplayLabel = 'OSP'
      FieldName = 'osp'
      Required = True
    end
    object qrymotivosparadaslote: TIntegerField
      DisplayLabel = 'Lote'
      FieldName = 'lote'
      Required = True
    end
    object qrymotivosparadasnomeoperacao: TStringField
      DisplayLabel = 'Opera'#231#227'o'
      FieldName = 'nomeoperacao'
      Size = 10
    end
    object qrymotivosparadasc01: TStringField
      DisplayLabel = 'C1'
      FieldName = 'c01'
      Size = 2
    end
    object qrymotivosparadasc02: TStringField
      DisplayLabel = 'C2'
      FieldName = 'c02'
      Size = 2
    end
    object qrymotivosparadasc03: TStringField
      DisplayLabel = 'C3'
      FieldName = 'c03'
      Size = 2
    end
  end
  object dsrmotivosparadas: TtecDataSource
    DataSet = qrymotivosparadas
    Left = 112
    Top = 128
  end
  object ExcelExport1: TExcelExport
    FontTitles.Charset = DEFAULT_CHARSET
    FontTitles.Color = clWindowText
    FontTitles.Height = -11
    FontTitles.Name = 'MS Sans Serif'
    FontTitles.Style = [fsBold]
    OrientationTitles = 0
    FontData.Charset = DEFAULT_CHARSET
    FontData.Color = clWindowText
    FontData.Height = -11
    FontData.Name = 'MS Sans Serif'
    FontData.Style = []
    StyleColumnWidth = cwAutoFit
    ColumnWidth = 80
    WorksheetName = 'MotivosParadas'
    Dataset = qrymotivosparadas
    Left = 328
    Top = 56
  end
  object qrySetores: TtecQuery
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
        Name = 'FiltroPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FiltroSetoresProducao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FiltroFuncionarios'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select  sp.codigo as setor'
      '   FROM OperacoesOSPUsuario oou'
      '        JOIN Operacoes o  ON oou.Operacao = o.Codigo'
      '        JOIN Usuarios u   ON oou.Usuario  = u.Codigo'
      
        '        JOIN Maquinas m   ON m.Codigo     = COALESCE(oou.Maquina' +
        ', (SELECT om.Maquina FROM OperacoesMaquinas om'
      
        '                                                                ' +
        '      WHERE om.Operacao = oou.Operacao LIMIT 1))'
      '        JOIN SetoresProducao sp ON sp.Codigo = m.SetorProducao'
      ''
      '   WHERE oou.usuario = oou.usuariotermino         AND'
      '         COALESCE(oou.Quantidade,0) <> 0          AND'
      '         oou.DataTermino IS NOT NULL              AND'
      '         oou.Termino     IS NOT NULL'
      ''
      '         %FiltroPeriodo'
      '         %FiltroSetoresProducao'
      '         %FiltroFuncionarios'
      ''
      'group by sp.codigo'
      'order by sp.codigo')
    RequestLive = False
    Left = 216
    Top = 216
    object qrySetoressetor: TStringField
      FieldName = 'setor'
      Required = True
      Size = 4
    end
  end
end
