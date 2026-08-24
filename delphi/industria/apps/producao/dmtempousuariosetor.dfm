inherited dtmtempousuariosetor: Tdtmtempousuariosetor
  OldCreateOrder = False
  Left = 765
  Top = 216
  Height = 462
  Width = 647
  object qrytempousuariosetor: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qrytempousuariosetorAfterOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'Setores'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';'
      'select detalhes.*,'
      '       totais.total'
      'from'
      '('
      'SELECT * FROM crosstab'
      '('
      #39
      
        'select usuario, nomeusuario, setor, trim(to_char(tempo/60,'#39#39'000'#39 +
        #39'))||'#39#39':'#39#39'||trim(to_char(tempo%60,'#39#39'00'#39#39')) as tempo'
      'from'
      '('
      ''
      'select usuario, nomeusuario, setor, sum(tempo) as tempo'
      'from'
      '('
      'select oou.usuario, u.nome as nomeusuario,'
      
        '       TempoOperacaoUsuario(oou.OSP, oou.Lote, oou.Operacao, oou' +
        '.Usuario, oou.Data, oou.Inicio) +'
      
        #9'   nrminutosintervaloturno(oou.Data, oou.Inicio, oou.dataTermin' +
        'o, oou.termino, u.turno) as tempo,'
      '       sp.codigo as setor'
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
      ''
      '         /* %FiltroPeriodo_1 */'
      '         '
      '         /* %FiltroSetoresProducao_1 */'
      '         '
      '         /* %FiltroFuncionarios_1 */'
      ''
      ') as setor'
      'group by usuario, nomeusuario, setor'
      ') as setor'
      'order by usuario, nomeusuario, setor'#39','
      ''
      #39
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
      '         /* %FiltroPeriodo_2 */'
      ''
      '         /* %FiltroSetoresProducao_2 */'
      ''
      '         /* %FiltroFuncionarios_2 */'
      ''
      'group by sp.codigo'
      'order by sp.codigo'
      ''
      #39')'
      ''
      'AS'
      ' ( usuario int,'
      ' nomeusuario varchar(40),'
      ' %Setores'
      ')'
      'order by usuario, nomeusuario'
      ') as detalhes'
      ''
      'join'
      ''
      ''
      '('
      'SELECT * FROM crosstab'
      '('
      #39
      
        'select usuario, nomeusuario, setor, trim(to_char(tempo/60,'#39#39'000'#39 +
        #39'))||'#39#39':'#39#39'||trim(to_char(tempo%60,'#39#39'00'#39#39')) as tempo'
      'from'
      '('
      ''
      'select usuario, nomeusuario, setor, sum(tempo) as tempo'
      'from'
      '('
      'select oou.usuario, u.nome as nomeusuario,'
      
        '       TempoOperacaoUsuario(oou.OSP, oou.Lote, oou.Operacao, oou' +
        '.Usuario, oou.Data, oou.Inicio) +'
      
        #9'   nrminutosintervaloturno(oou.Data, oou.Inicio, oou.dataTermin' +
        'o, oou.termino, u.turno) as tempo,'
      '       cast('#39#39'TOTAL'#39#39' as varchar(6)) as setor'
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
      ''
      '         /* %FiltroPeriodo_3 */'
      ''
      '         /* %FiltroSetoresProducao_3 */'
      '         '
      '         /* %FiltroFuncionarios_3 */'
      ''
      ') as setor'
      'group by usuario, nomeusuario, setor'
      ') as setor'
      'order by usuario, nomeusuario, setor'#39','
      ''
      #39
      '  select cast('#39#39'TOTAL'#39#39' as varchar(6)) as TOTAL'
      #39')'
      ''
      'AS'
      ' ( usuario int,'
      ' nomeusuario varchar(40),'
      ' TOTAL varchar(6)'
      ')'
      'order by usuario, nomeusuario'
      ') as totais'
      ''
      'on detalhes.usuario = totais.usuario'
      ''
      ''
      '')
    RequestLive = True
    Left = 96
    Top = 56
  end
  object dsrtempousuariosetor: TtecDataSource
    DataSet = qrytempousuariosetor
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
    WorksheetName = 'TempoUus'#225'riosSetores'
    Dataset = qrytempousuariosetor
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
