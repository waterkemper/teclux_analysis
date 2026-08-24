inherited dtmConsultaListasPadrao: TdtmConsultaListasPadrao
  OldCreateOrder = False
  Left = 351
  Top = 211
  Height = 393
  Width = 684
  object qryListasPadrao: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'Condicao'
        ParamType = ptUnknown
        Value = ' false '
      end
      item
        DataType = ftUnknown
        Name = 'CondicaoIntervaloCadastro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CondicaoIntervaloConferencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CondicaoListasFiliais'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CondicaoUsuarios'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';'
      ''
      'select lp.*,'
      
        '       current_date - cast(lp.datahora as date) as DiasAlteracao' +
        'Cadastro,'
      '       f.nome as nomefilial,'
      '       cf.data as datahoraconferencia,'
      
        '       current_date - cast(cf.data as date) as DiasAlteracaoConf' +
        'erencia,'
      '       u.nome as nomeusuario'
      ''
      'from (listaspadrao lp'
      '     left join conferencia cf'
      '     on cf.tipo = '#39'LPA'#39
      '       and cf.codigo = cast(lp.codigo as varchar))'
      ''
      '     left join usuarios u'
      '     on lp.usuario = u.codigo'
      ''
      '     join filiais f'
      '     on lp.filial = f.codigo'
      ''
      ''
      'where %Condicao'
      ''
      '  %CondicaoIntervaloCadastro'
      '  %CondicaoIntervaloConferencia'
      '  %CondicaoListasFiliais'
      '  %CondicaoUsuarios'
      '  '
      'order by lp.codigo')
    RequestLive = False
    Left = 112
    Top = 32
    object qryListasPadraocodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object qryListasPadraodescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 30
    end
    object qryListasPadraofilial: TIntegerField
      FieldName = 'filial'
    end
    object qryListasPadraodatahora: TDateTimeField
      Alignment = taCenter
      FieldName = 'datahora'
      DisplayFormat = 'dd/MM/yy hh:mm'
      EditMask = '99/99/99 99:99;1; '
    end
    object qryListasPadraonomefilial: TStringField
      FieldName = 'nomefilial'
      Size = 60
    end
    object qryListasPadraodatahoraconferencia: TDateTimeField
      FieldName = 'datahoraconferencia'
      DisplayFormat = 'dd/MM/yy hh:mm'
      EditMask = '99/99/99 99:99;1; '
    end
    object qryListasPadraodiasalteracaocadastro: TIntegerField
      FieldName = 'diasalteracaocadastro'
    end
    object qryListasPadraodiasalteracaoconferencia: TIntegerField
      FieldName = 'diasalteracaoconferencia'
    end
    object qryListasPadraousuario: TIntegerField
      FieldName = 'usuario'
    end
    object qryListasPadraonomeusuario: TStringField
      FieldName = 'nomeusuario'
      Size = 100
    end
  end
  object dsrListasPadrao: TtecDataSource
    DataSet = qryListasPadrao
    Left = 160
    Top = 48
  end
  object qryProdutosListasPadrao: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 'codigo=listapadrao'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrListasPadrao
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'Condicao'
        ParamType = ptUnknown
        Value = ' and false '
      end
      item
        DataType = ftUnknown
        Name = 'CondicaoIntervaloCadastro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CondicaoIntervaloConferencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CondicaoListasFiliais'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';'
      ''
      'Select pl.listapadrao,'
      '       pl.produto,'
      '       p.codigovisual as produtovisual,'
      '       p.descricao,'
      '       p.referencia,'
      '       c.grupo,'
      '       g.descricao as descricaogrupo,'
      '       p.valorgrade1,'
      '       p.valorgrade2,'
      
        '       (select gr.descricao from grades gr where gr.codigo = c.g' +
        'rade1) as linha,'
      
        '       (select gr.descricao from grades gr where gr.codigo = c.g' +
        'rade2) as coluna,'
      '       c.classe,'
      '       cl.descricao as descricaoclasse,'
      '       CodigoBarras(p.codigo) as CodigoDeBarras,'
      '       cast(1 as numeric(11,3)) as quantidade,'
      '       estoques_preco(pl.produto,lp.filial) as preco'
      ''
      'From produtoslistaspadrao pl,'
      ''
      '    ((listaspadrao lp'
      '     left join conferencia cf'
      '     on cf.tipo = '#39'LPA'#39
      '     and cf.codigo = cast(lp.codigo as varchar))'
      ''
      '     join filiais f'
      '     on lp.filial = f.codigo),'
      ''
      '     produtos p, caracteristicas c, grupos g, classes cl'
      ''
      'Where (pl.produto = p.codigo)'
      '  and (p.caracteristica = c.codigo)'
      '  and (c.grupo = g.codigo)'
      '  and (c.classe = cl.codigo)'
      '  and (pl.listapadrao=lp.codigo)'
      ''
      '  %Condicao'
      ''
      '  %CondicaoIntervaloCadastro'
      '  %CondicaoIntervaloConferencia'
      ''
      '  %CondicaoListasFiliais'
      ''
      ''
      'Order By c.grupo')
    RequestLive = False
    Left = 128
    Top = 136
    object qryProdutosListasPadraolistapadrao: TIntegerField
      FieldName = 'listapadrao'
      DisplayFormat = '0'
    end
    object qryProdutosListasPadraoproduto: TLargeintField
      DisplayLabel = 'Produto'
      FieldName = 'produto'
    end
    object qryProdutosListasPadraodescricao: TStringField
      DisplayWidth = 50
      FieldName = 'descricao'
      Size = 100
    end
    object qryProdutosListasPadraoreferencia: TStringField
      DisplayWidth = 15
      FieldName = 'referencia'
      Size = 50
    end
    object qryProdutosListasPadraogrupo: TStringField
      FieldName = 'grupo'
      Size = 4
    end
    object qryProdutosListasPadraoprodutovisual: TStringField
      FieldName = 'produtovisual'
      Size = 30
    end
    object qryProdutosListasPadraodescricaogrupo: TStringField
      FieldName = 'descricaogrupo'
      Size = 30
    end
    object qryProdutosListasPadraovalorgrade1: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade1'
      Size = 50
    end
    object qryProdutosListasPadraovalorgrade2: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade2'
      Size = 50
    end
    object qryProdutosListasPadraolinha: TStringField
      FieldName = 'linha'
      Size = 40
    end
    object qryProdutosListasPadraocoluna: TStringField
      FieldName = 'coluna'
      Size = 40
    end
    object qryProdutosListasPadraoclasse: TStringField
      FieldName = 'classe'
      Size = 2
    end
    object qryProdutosListasPadraodescricaoclasse: TStringField
      FieldName = 'descricaoclasse'
      Size = 30
    end
    object qryProdutosListasPadraoquantidade: TFloatField
      FieldName = 'quantidade'
      DisplayFormat = '0.00'
    end
    object qryProdutosListasPadraocodigodebarras: TStringField
      FieldName = 'codigodebarras'
      Size = 12
    end
    object qryProdutosListasPadraopreco: TFloatField
      FieldName = 'preco'
      DisplayFormat = '0.00'
    end
  end
  object dsrProdutosListasPadrao: TtecDataSource
    DataSet = qryProdutosListasPadrao
    Left = 311
    Top = 134
  end
end
