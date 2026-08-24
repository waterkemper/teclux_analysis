inherited dtmOperacoesPorcelana: TdtmOperacoesPorcelana
  OldCreateOrder = False
  Left = 664
  Top = 247
  Height = 277
  Width = 595
  object dsrOperacoes: TtecDataSource
    DataSet = qryOperacoes
    Left = 40
    Top = 40
  end
  object qryOperacoes: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryOperacoesAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select o.*,'
      '       (select om.maquina'
      '        from operacoesmaquinas om'
      '        where om.operacao = o.codigo'
      '        order by om.maquina desc limit 1) as maquina'
      'from operacoes o'
      'where o.codigo in (181,658)'
      'order by o.codigo desc')
    RequestLive = False
    Left = 104
    Top = 32
    object qryOperacoescodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryOperacoesnome: TStringField
      DisplayLabel = 'OPERA'#199#195'O'
      FieldName = 'nome'
      Size = 10
    end
    object qryOperacoesc01: TStringField
      DisplayLabel = 'C1'
      FieldName = 'c01'
      Size = 2
    end
    object qryOperacoesc02: TStringField
      DisplayLabel = 'C2'
      FieldName = 'c02'
      Size = 2
    end
    object qryOperacoesc03: TStringField
      DisplayLabel = 'C3'
      FieldName = 'c03'
      Size = 2
    end
    object qryOperacoesdescricao: TStringField
      DisplayLabel = 'DESCRI'#199#195'O'
      FieldName = 'descricao'
      Size = 60
    end
    object qryOperacoesmaquina: TIntegerField
      FieldName = 'maquina'
    end
  end
  object qryConsultaOperacoesOSPUsuarios: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterInsert = qryConsultaOperacoesOSPUsuariosAfterInsert
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      
        'select selecao.*, selecao.quantidade as quantidadeoriginal, fals' +
        'e as OK'
      'from'
      '('
      'select oo.osp, oo.lote, oo.operacao,'
      ''
      '        /* quantidade da opera'#231#227'o anterior */'
      ''
      '       cast(coalesce((select sum(oou.quantidade)'
      '        from operacoesosp oo2'
      '             join operacoesospusuario oou'
      '             on oo2.osp = oou.osp'
      '             and oo2.lote = oou.lote'
      '             and oo2.operacao = oou.operacao'
      ''
      
        '        where oo2.sequencia = (cast(oo.sequencia as numeric) - 1' +
        ')'
      '          and oo2.osp = oo.osp'
      '          and oo2.lote = oo.lote'
      ''
      '        group by oo2.sequencia'
      '        order by oo2.sequencia desc  limit 1),0) -'
      ''
      
        '        /* quantidade da opera'#231#227'o atual (montar 658 ou queima 18' +
        '1 */'
      ''
      '       coalesce((select sum(oou.quantidade)'
      '        from  operacoesospusuario oou'
      '        where oou.osp = oo.osp'
      '          and oou.lote = oo.lote'
      
        '          and oou.operacao = oo.operacao),0) as integer) as quan' +
        'tidade,'
      ''
      ''
      '       case when oo.operacao = 181 then'
      '         (select oou.datatermino'
      '          from operacoesospusuario oou'
      '          where oou.osp = oo.osp'
      '            and oou.lote = oo.lote'
      '            and oou.operacao = 658'
      '          order by oou.datatermino desc limit 1'
      '          )'
      '       else'
      '         cast(null as date)'
      '       end as dataterminoUltimaOperacao,'
      ''
      '       case when oo.operacao = 181 then'
      '         (select oou.termino'
      '          from operacoesospusuario oou'
      '          where oou.osp = oo.osp'
      '            and oou.lote = oo.lote'
      '            and oou.operacao = 658'
      
        '          order by oou.datatermino desc, oou.termino desc limit ' +
        '1'
      '          )'
      '       else'
      '         cast(null as time)'
      '       end as terminoUltimaOperacao'
      ''
      'from operacoesosp oo'
      'where oo.operacao = :operacao'
      '  and case when oo.operacao = 658 then'
      '        (select oo2.operacao'
      '         from operacoesosp oo2'
      '         where oo2.osp = oo.osp'
      '           and oo2.lote = oo.lote'
      '           and oo2.sequencia > oo.sequencia'
      '         order by oo2.sequencia limit 1) = 181'
      '      else'
      '        (select oo2.operacao'
      '         from operacoesosp oo2'
      '         where oo2.osp = oo.osp'
      '           and oo2.lote = oo.lote'
      '           and oo2.sequencia < oo.sequencia'
      '         order by oo2.sequencia desc  limit 1) = 658'
      '      end'
      'order by oo.osp'
      ') as selecao'
      'where coalesce(quantidade,0)<>0'
      'order by osp, lote')
    RequestLive = True
    Left = 88
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'operacao'
        ParamType = ptUnknown
      end>
    object qryConsultaOperacoesOSPUsuariososp: TIntegerField
      DisplayLabel = 'OSP'
      FieldName = 'osp'
      ReadOnly = True
    end
    object qryConsultaOperacoesOSPUsuarioslote: TIntegerField
      DisplayLabel = 'LOTE'
      FieldName = 'lote'
      ReadOnly = True
    end
    object qryConsultaOperacoesOSPUsuariosquantidade: TIntegerField
      DisplayLabel = 'QUANTIDADE'
      FieldName = 'quantidade'
    end
    object qryConsultaOperacoesOSPUsuariosok: TBooleanField
      DisplayLabel = 'OK'
      FieldName = 'ok'
    end
    object qryConsultaOperacoesOSPUsuariosquantidadeoriginal: TIntegerField
      FieldName = 'quantidadeoriginal'
    end
    object qryConsultaOperacoesOSPUsuariosdataterminoultimaoperacao: TDateField
      FieldName = 'dataterminoultimaoperacao'
    end
    object qryConsultaOperacoesOSPUsuariosterminoultimaoperacao: TTimeField
      FieldName = 'terminoultimaoperacao'
    end
  end
  object dsrConsultaOperacoesOSPUsuarios: TtecDataSource
    DataSet = qryConsultaOperacoesOSPUsuarios
    OnDataChange = dsrConsultaOperacoesOSPUsuariosDataChange
    Left = 48
    Top = 120
  end
  object qryOperacoesOSPUsuario: TtecQuery
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
      'select oou.*'
      'from operacoesospusuario oou'
      'where false')
    RequestLive = True
    Left = 256
    Top = 120
    object qryOperacoesOSPUsuarioosp: TIntegerField
      FieldName = 'osp'
    end
    object qryOperacoesOSPUsuariolote: TIntegerField
      FieldName = 'lote'
    end
    object qryOperacoesOSPUsuariooperacao: TIntegerField
      FieldName = 'operacao'
    end
    object qryOperacoesOSPUsuariousuario: TIntegerField
      FieldName = 'usuario'
    end
    object qryOperacoesOSPUsuariodata: TDateField
      FieldName = 'data'
    end
    object qryOperacoesOSPUsuarioinicio: TTimeField
      FieldName = 'inicio'
    end
    object qryOperacoesOSPUsuariotermino: TTimeField
      FieldName = 'termino'
    end
    object qryOperacoesOSPUsuarioquantidade: TIntegerField
      FieldName = 'quantidade'
    end
    object qryOperacoesOSPUsuarioturno: TIntegerField
      FieldName = 'turno'
    end
    object qryOperacoesOSPUsuariodatatermino: TDateField
      FieldName = 'datatermino'
    end
    object qryOperacoesOSPUsuariousuariotermino: TIntegerField
      FieldName = 'usuariotermino'
    end
    object qryOperacoesOSPUsuariomaquina: TIntegerField
      FieldName = 'maquina'
    end
  end
end
