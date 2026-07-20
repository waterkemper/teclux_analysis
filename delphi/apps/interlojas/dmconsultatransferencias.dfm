inherited dtmConsultaTransferencias: TdtmConsultaTransferencias
  OldCreateOrder = False
  Left = 664
  Top = 251
  Height = 237
  Width = 362
  object qryPedidosFiliais: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'Periodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FiliaisRequisitantes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FiliaisRequisitadas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Situacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CurvaABC'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select pf.*,'
      '       fe.nome as NomeFilialRequisitante,'
      '       fa.nome as NomeFilialRequisitada,'
      '       p.codigovisual as produtovisual,'
      '       p.descricao as descricaoproduto,'
      '       p.resultadocurvaabc,'
      '       p.valorgrade1,'
      '       p.valorgrade2,'
      
        '       (select gr.descricao from grades gr where gr.codigo = c.g' +
        'rade1) as linha,'
      
        '       (select gr.descricao from grades gr where gr.codigo = c.g' +
        'rade2) as coluna,'
      ''
      '       n.filial as filialnota,'
      '       n.serie as serienota,'
      '       n.numero as numeronota,'
      '/*       cp.filial as filialcupom,'
      '       cp.maquina,'
      '       cp.intervensao,'
      '       cp.numero as numerocupom,'
      '       */'
      '       df.data as datanota,'
      
        '       case when pf.situacao = ''A'' then cast(''ABERTA'' as varchar' +
        '(12))'
      
        '            when pf.situacao = ''F'' then cast(''FECHADADA'' as varc' +
        'har(12))'
      
        '            when pf.situacao = ''D'' then cast(''ATENDIDA'' as varch' +
        'ar(12))'
      
        '            when pf.situacao = ''C'' then cast(''CANCELADA'' as varc' +
        'har(12))'
      '       end as descricaosituacao,'
      ''
      '       (Select e1.emestoque'
      '        From estoques e1'
      '        Where (e1.produto = pf.produto)'
      
        '        and (e1.filial = pf.requisitante)) as estoquerequisitant' +
        'e,'
      ''
      '       (Select e1.emestoque'
      '        From estoques e1'
      '        Where (e1.produto = pf.produto)'
      
        '        and (e1.filial = (case when fA.tipofilial=''V'' then COALE' +
        'SCE(fa.filial_estoque,fa.codigo) ELSE fa.codigo END))) as estoqu' +
        'erequisitada,'
      ''
      '       (Select e1.reservaprevia'
      '        From estoques e1'
      '        Where e1.produto=pf.produto'
      
        '        and e1.filial= (case when fa.tipofilial=''V'' then COALESC' +
        'E(fa.filial_estoque,fa.codigo) ELSE fa.codigo END)) as reservapr' +
        'eviarequisitada,'
      ''
      
        '       (select ti.valor from tributosicms ti where ti.codigo = c' +
        '.incidencia) as cst_produto,'
      '       c.csosn as csosn_produto,'
      '       c.piscst as piscst_produto,'
      '       c.cofinscst as cofinscst_produto'
      ''
      ''
      ''
      'from pedidosfiliais pf'
      '     join filiais fe'
      '     on pf.requisitante = fe.codigo'
      '     join filiais fa'
      '     on pf.requisitada = fa.codigo'
      ''
      '     join (produtos p'
      '           join caracteristicas c'
      '           on p.caracteristica = c.codigo)'
      ''
      '     on pf.produto = p.codigo'
      ''
      '     left join /*(*/ (dadosfiscais df'
      
        '                /*left*/ join notas n on df.numero = n.dadofisca' +
        'l)'
      
        '                /*left join cupons cp on df.numero = cp.dadofisc' +
        'al)*/'
      ''
      ''
      '     on pf.dadofiscal = df.numero'
      ''
      'where true'
      ''
      '%Periodo'
      '%FiliaisRequisitantes'
      '%FiliaisRequisitadas'
      '%Situacao'
      '%CurvaABC'
      ''
      'order by pf.data, pf.hora'
      '')
    RequestLive = False
    Left = 80
    Top = 80
    object qryPedidosFiliaiscodigo: TIntegerField
      DisplayLabel = 'NR. TRANSF.'
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
    object qryPedidosFiliaissituacao: TStringField
      DisplayLabel = 'SIT.'
      FieldName = 'situacao'
      Required = True
      Size = 1
    end
    object qryPedidosFiliaisdescricaosituacao: TStringField
      DisplayLabel = 'DESCRIÇÃO SIT.'
      FieldName = 'descricaosituacao'
      Size = 50
    end
    object qryPedidosFiliaisdata: TDateTimeField
      DisplayLabel = 'DATA'
      FieldName = 'data'
    end
    object qryPedidosFiliaishora: TTimeField
      Alignment = taCenter
      DisplayLabel = 'HORA'
      FieldName = 'hora'
      EditMask = '99:99;1; '
    end
    object qryPedidosFiliaisproduto: TLargeintField
      DisplayLabel = 'COD. PROD.'
      FieldName = 'produto'
    end
    object qryPedidosFiliaisprodutovisual: TStringField
      DisplayLabel = 'PRODUTO'
      FieldName = 'produtovisual'
      Required = True
      Size = 30
    end
    object qryPedidosFiliaisdescricaoproduto: TStringField
      DisplayLabel = 'DESCRIÇÃO PRODUTO'
      DisplayWidth = 50
      FieldName = 'descricaoproduto'
      Required = True
      Size = 100
    end
    object qryPedidosFiliaisresultadocurvaabc: TStringField
      DisplayLabel = 'ABC'
      FieldName = 'resultadocurvaabc'
      Size = 1
    end
    object qryPedidosFiliaisrequisitante: TIntegerField
      DisplayLabel = 'REQUISITANTE'
      FieldName = 'requisitante'
      DisplayFormat = '0'
    end
    object qryPedidosFiliaisnomefilialrequisitante: TStringField
      DisplayLabel = 'NOME REQUISITANTE'
      FieldName = 'nomefilialrequisitante'
      Required = True
      Size = 60
    end
    object qryPedidosFiliaisrequisitada: TIntegerField
      DisplayLabel = 'REQUISITADA'
      FieldName = 'requisitada'
      DisplayFormat = '0'
    end
    object qryPedidosFiliaisnomefilialrequisitada: TStringField
      DisplayLabel = 'NOME REQUISITADA'
      FieldName = 'nomefilialrequisitada'
      Size = 60
    end
    object qryPedidosFiliaisqtdepedida: TFloatField
      DisplayLabel = 'PEDIDA'
      FieldName = 'qtdepedida'
      DisplayFormat = '0.00'
    end
    object qryPedidosFiliaisqtderecebida: TFloatField
      DisplayLabel = 'RECEBIDA'
      FieldName = 'qtderecebida'
      DisplayFormat = '0.00'
    end
    object qryPedidosFiliaislotetransferencia: TIntegerField
      DisplayLabel = 'NR. LOTE'
      FieldName = 'lotetransferencia'
      DisplayFormat = '0'
    end
    object qryPedidosFiliaisdatanota: TDateField
      Alignment = taCenter
      DisplayLabel = 'DATA DOC.'
      FieldName = 'datanota'
      EditMask = '99/99/9999;1; '
    end
    object qryPedidosFiliaisfilialnota: TIntegerField
      DisplayLabel = 'FIL. NF'
      FieldName = 'filialnota'
      DisplayFormat = '0'
    end
    object qryPedidosFiliaisserienota: TStringField
      DisplayLabel = 'SÉRIE NF'
      FieldName = 'serienota'
      Size = 3
    end
    object qryPedidosFiliaisnumeronota: TIntegerField
      DisplayLabel = 'NR NF'
      FieldName = 'numeronota'
      DisplayFormat = '0'
    end
    object qryPedidosFiliaisobservacao: TStringField
      DisplayLabel = 'OBSERVAÇÃO'
      FieldName = 'observacao'
      Size = 150
    end
    object qryPedidosFiliaisvalorgrade1: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade1'
      Size = 30
    end
    object qryPedidosFiliaisvalorgrade2: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade2'
      Size = 30
    end
    object qryPedidosFiliaislinha: TStringField
      FieldName = 'linha'
      Size = 40
    end
    object qryPedidosFiliaiscoluna: TStringField
      FieldName = 'coluna'
      Size = 40
    end
    object qryPedidosFiliaisdadofiscal: TIntegerField
      FieldName = 'dadofiscal'
      DisplayFormat = '0'
    end
    object qryPedidosFiliaisestoquerequisitante: TFloatField
      FieldName = 'estoquerequisitante'
      DisplayFormat = '0.00'
    end
    object qryPedidosFiliaisestoquerequisitada: TFloatField
      FieldName = 'estoquerequisitada'
      DisplayFormat = '0.00'
    end
    object qryPedidosFiliaisreservapreviarequisitada: TFloatField
      FieldName = 'reservapreviarequisitada'
      DisplayFormat = '0.00'
    end
    object qryPedidosFiliaiscst_produto: TStringField
      FieldName = 'cst_produto'
      Size = 2
    end
    object qryPedidosFiliaiscsosn_produto: TStringField
      FieldName = 'csosn_produto'
      Size = 3
    end
    object qryPedidosFiliaispiscst_produto: TStringField
      FieldName = 'piscst_produto'
      Size = 2
    end
    object qryPedidosFiliaiscofinscst_produto: TStringField
      FieldName = 'cofinscst_produto'
      Size = 2
    end
  end
  object dsrPedidosFiliais: TtecDataSource
    DataSet = qryPedidosFiliais
    Left = 120
    Top = 96
  end
end
