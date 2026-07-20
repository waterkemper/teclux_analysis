inherited dtmConsultaOrcamentos: TdtmConsultaOrcamentos
  Left = 685
  Top = 195
  Height = 540
  Width = 625
  object qryOrcamentos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryOrcamentosAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'Situacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Vendedor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Marcadosparanaoligar'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Plano'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Emissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Validade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'QtAtendimentos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataContato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IntervaloValorTotal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Lembrarem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaItemProdutos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaProdutos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaGrupos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaClasses'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaMarcas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaCondicionalPromocoes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Ordenacao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'Select o.codigo,'
      '       o.cliente,'
      '       o.tipocliente,'
      ''
      '       case when o.cliente is not null then'
      
        '         cast((select vf.razao from vfornecedores vf where vf.co' +
        'digo = o.cliente and vf.tipo = o.tipocliente) as varchar(60))'
      '       else'
      '         cast(o.nome as varchar(60))'
      '       end as nome,'
      '       o.filial,'
      '       o.emissao,'
      '       o.validade,'
      '      (Select sum(po.quantidade * po.precovenda)'
      '        From produtosorcamentos po'
      '        Where po.orcamento = o.codigo) as totalprodutos,'
      '       o.situacao,'
      '       o.vendedor,'
      '       u.nome as nome_vendedor,'
      '       o.contrato,'
      ''
      
        '       (select ct.valorprazo from contratos ct where ct.numero =' +
        ' o.contrato) as valorprazo,'
      '       (select cast(CASE WHEN ct.situacao ='#39'O'#39' THEN '#39'OR'#199'ADO'#39
      '                    WHEN ct.situacao ='#39'R'#39' THEN '#39'RESERVADO'#39
      '                    WHEN ct.situacao ='#39'F'#39' THEN '#39'FATURADO'#39
      '                    WHEN ct.situacao ='#39'N'#39' THEN '#39'NOTA FISCAL'#39
      '                    WHEN ct.situacao ='#39'P'#39' THEN '#39'NOTA PARCIAL'#39
      '                    WHEN ct.situacao ='#39'C'#39' THEN '#39'CANCELADO'#39
      '               END  as varchar(20))'
      
        '         from contratos ct where ct.numero = o.contrato) as situ' +
        'acao_contrato,'
      ''
      '       o.cancelamento, '
      ''
      '      (select count(*)'
      '       from atendimentos a'
      '       where a.orcamento = o.codigo) as NAtendimentos,'
      ''
      '      (select a.data'
      '       from atendimentos a'
      '       where a.orcamento = o.codigo'
      '       order by a.data desc limit 1) as data,'
      ''
      '       /*'
      
        '      (select cast(cast(a.lembrar as varchar)||'#39' '#39'||cast(a.lembr' +
        'arhora as varchar) as timestamp)'
      '       from atendimentos a'
      '       where a.orcamento = o.codigo'
      
        '       order by cast(cast(a.lembrar as varchar)||'#39' '#39'||cast(a.lem' +
        'brarhora as varchar) as timestamp) desc limit 1) as lembrardatah' +
        'ora,'
      '       */'
      ''
      
        '      (select cast(cast(a.lembrar as varchar)||'#39' '#39'||cast(a.lembr' +
        'arhora as varchar) as timestamp)'
      '       from atendimentos a'
      '       where a.orcamento = o.codigo'
      '       order by a.codigo desc limit 1) as lembrardatahora,'
      ''
      '      (select a.assunto'
      '       from atendimentos a'
      '       where a.orcamento = o.codigo'
      '       order by a.data desc limit 1) as assunto,'
      ''
      
        '       CASE WHEN contrato IS NULL THEN o.motivo ELSE (select mot' +
        'ivo from contratos ct where ct.numero=o.contrato) END as motivoc' +
        'ancelamento,'
      
        '       CASE WHEN contrato IS NULL THEN m.descricao ELSE (select ' +
        'm1.descricao from motivos m1 where m1.codigo=(select motivo from' +
        ' contratos ct where ct.numero=o.contrato) ) END as descricaomoti' +
        'vocancelamento,'
      '       case when o.contrato is not null then'
      '        (select cast(informes as varchar(1000))'
      '         from atendimentos'
      '         where atendimentos.contrato=o.contrato'
      '         and atendimentos.status='#39'F'#39
      '         order by codigo desc limit 1)'
      '       else'
      '        o.descricaocancelamento'
      '       end as descricaocancelamento,'
      ''
      '       false as selecionar'
      ''
      
        'From (orcamentos o left join motivos m on o.motivo = m.codigo) ,' +
        ' usuarios u'
      'where u.codigo=o.vendedor'
      'and o.codigo in ('
      '                    Select distinct o.codigo'
      '                    From (orcamentos o'
      '                         join (produtosorcamentos po'
      
        '                              join (produtos p left join promoco' +
        'es pro on p.promocao = pro.codigo)'
      '                                   join (((caracteristicas c'
      '                                        join grupos g'
      '                                        on g.codigo = c.grupo)'
      '                                        join classes cl'
      '                                        on cl.codigo = c.classe)'
      '                                        join marcas m'
      '                                        on m.codigo = c.marca)'
      
        '                                   on p.caracteristica = c.codig' +
        'o'
      '                              on po.produto = p.codigo)'
      '                         on o.codigo = po.orcamento)'
      ''
      '                    %Situacao'
      '                    %Filial'
      '                    %Vendedor'
      '                    %Cliente'
      '                    %Marcadosparanaoligar'
      '                    %Contem'
      '                    %Plano'
      '                    %Produto'
      '                    %Emissao'
      '                    %Validade'
      '                    '
      '                    %QtAtendimentos'
      '                    %DataContato'
      ''
      '                    %IntervaloValorTotal'
      ''
      '                    %Lembrarem'
      ''
      '                    %ListaItemProdutos'
      '                    %ListaProdutos'
      '                    %ListaGrupos'
      '                    %ListaClasses'
      '                    %ListaMarcas'
      '                    %ListaCondicionalPromocoes'
      '                   )'
      ''
      '%Ordenacao')
    RequestLive = True
    Left = 80
    Top = 315
    object qryOrcamentosnome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object qryOrcamentosfilial: TIntegerField
      FieldName = 'filial'
    end
    object qryOrcamentosemissao: TDateTimeField
      FieldName = 'emissao'
      DisplayFormat = 'dd/MM/yy hh:mm'
    end
    object qryOrcamentosvalidade: TDateField
      Alignment = taCenter
      FieldName = 'validade'
      EditMask = '99/99/9999;1; '
    end
    object qryOrcamentosselecionar: TBooleanField
      FieldName = 'selecionar'
    end
    object qryOrcamentoscodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryOrcamentossituacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
    object qryOrcamentoscliente: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object qryOrcamentosvendedor: TIntegerField
      FieldName = 'vendedor'
      DisplayFormat = '0'
    end
    object qryOrcamentostotalprodutos: TFloatField
      FieldName = 'totalprodutos'
      DisplayFormat = '0.00'
    end
    object qryOrcamentoscontrato: TStringField
      FieldName = 'contrato'
    end
    object qryOrcamentostipocliente: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
    object qryOrcamentoscancelamento: TDateField
      Alignment = taCenter
      FieldName = 'cancelamento'
      EditMask = '99/99/9999;1; '
    end
    object qryOrcamentosnatendimentos: TLargeintField
      FieldName = 'natendimentos'
    end
    object qryOrcamentoslembrardatahora: TDateTimeField
      FieldName = 'lembrardatahora'
    end
    object qryOrcamentosassunto: TStringField
      FieldName = 'assunto'
      Size = 100
    end
    object qryOrcamentosdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object qryOrcamentosvalorprazo: TFloatField
      FieldName = 'valorprazo'
      DisplayFormat = '###,##0.00'
    end
    object qryOrcamentosnome_vendedor: TStringField
      FieldName = 'nome_vendedor'
      Required = True
      Size = 40
    end
    object qryOrcamentossituacao_contrato: TStringField
      FieldName = 'situacao_contrato'
    end
    object qryOrcamentosmotivocancelamento: TIntegerField
      FieldName = 'motivocancelamento'
    end
    object qryOrcamentosdescricaomotivocancelamento: TStringField
      FieldName = 'descricaomotivocancelamento'
      Size = 30
    end
    object qryOrcamentosdescricaocancelamento: TStringField
      FieldName = 'descricaocancelamento'
      Size = 512
    end
  end
  object dsrOrcamentos: TtecDataSource
    DataSet = qryOrcamentos
    Left = 261
    Top = 315
  end
  object qryConsultaMotivos: TtecQuery
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
      'select descricao,'
      '          codigo'
      'from motivos'
      'order by UPPER(TO_ASCII(descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 407
    Top = 315
    object qryConsultaMotivosdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 70
      FieldName = 'descricao'
      Size = 30
    end
    object qryConsultaMotivoscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Visible = False
    end
  end
  object qryOperacoesOrcamentos: TtecQuery
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
    RequestLive = True
    Left = 414
    Top = 376
  end
  object qryProdutosOrcamentos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 'codigo=orcamento'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrOrcamentos
    Constraints = <>
    BeforeOpen = qryProdutosOrcamentosBeforeOpen
    AfterScroll = qryProdutosOrcamentosAfterScroll
    OnCalcFields = qryProdutosOrcamentosCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'Listaorcamentos'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select po.orcamento,'
      '          po.produto, po.produtodigitado,'
      '          po.filial,'
      '          po.numero,'
      '          po.quantidade,'
      '          po.precovenda,'
      '          po.precotabela,'
      
        '          (po.quantidade * po.precovenda-coalesce(po.valordescon' +
        'toitem,0)) as total,'
      '          po.descricaoprecovenda,'
      '          po.vendido,'
      '          po.montagem,'
      '          po.entrega,'
      '          po.previsao,'
      '          p.descricao,'
      
        '          (select e.emestoque  from estoques e where e.produto =' +
        ' po.produto and e.filial = po.filial) as emestoque,'
      
        '          (select e.reservado  from estoques e where e.produto =' +
        ' po.produto and e.filial = po.filial) as reservado,'
      '          false as promocao,'
      '          po.vendedor,'
      '          po.valordescontoitem,'
      '          cast(null as varchar(30)) as codigobarras,'
      '          p.codigovisual as produtovisual,'
      '          p.valorgrade1,'
      '          p.valorgrade2,'
      
        '         (select g.descricao from grades g, caracteristicas c wh' +
        'ere c.codigo = p.caracteristica and g.codigo = c.grade1) as linh' +
        'a,'
      
        '         (select g.descricao from grades g, caracteristicas c wh' +
        'ere c.codigo = p.caracteristica and g.codigo = c.grade2) as colu' +
        'na,'
      '         c.unidade,'
      '         c.brinde,'
      '         c.vendanegativa as vendasemestoque,'
      '         c.composto,'
      '         c.montagem as montagemoriginal,'
      ''
      '         coalesce((select m.futuro'
      '           from movimentos m'
      '            where m.numero = (select m2.numero'
      '                              from movimentos m2,'
      '                              ('
      '                               (select Max(m1.data) as data'
      '                                from movimentos m1'
      
        '                                where (m1.produto = po.Produto) ' +
        'and'
      '                                      (m1.filial  = po.Filial))'
      '                               ) as m1'
      '                               where m2.produto = po.produto'
      '                                 and m2.filial = po.filial'
      '                                 and m2.data = m1.data'
      '                               order by m2.lancto desc limit 1)'
      '         ),0) as futuro,'
      ''
      '      case when :VisualizarSituacaoProdutos then'
      
        '        produtosorcamentos_situacao(po.orcamento, po.produto, po' +
        '.filial, o.situacao)'
      '      else cast(null as varchar(1)) end as situacao_produto'
      ''
      
        'from produtosorcamentos po, orcamentos o, produtos p, caracteris' +
        'ticas c'
      'where po.orcamento = o.codigo'
      ' and p.codigo = po.produto'
      ' and p.caracteristica = c.codigo'
      ' and po.orcamento in (%Listaorcamentos)'
      'Order By po.numero')
    RequestLive = False
    Left = 80
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'VisualizarSituacaoProdutos'
        ParamType = ptUnknown
      end>
    object qryProdutosOrcamentosorcamento: TIntegerField
      FieldName = 'orcamento'
    end
    object qryProdutosOrcamentosproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryProdutosOrcamentosprodutodigitado: TStringField
      FieldName = 'produtodigitado'
      Size = 30
    end
    object qryProdutosOrcamentosfilial: TIntegerField
      FieldName = 'filial'
    end
    object qryProdutosOrcamentosnumero: TIntegerField
      FieldName = 'numero'
    end
    object qryProdutosOrcamentosquantidade: TFloatField
      FieldName = 'quantidade'
    end
    object qryProdutosOrcamentosprecovenda: TFloatField
      FieldName = 'precovenda'
    end
    object qryProdutosOrcamentosprecotabela: TFloatField
      FieldName = 'precotabela'
    end
    object qryProdutosOrcamentostotal: TFloatField
      FieldName = 'total'
    end
    object qryProdutosOrcamentosdescricaoprecovenda: TStringField
      FieldName = 'descricaoprecovenda'
      Size = 40
    end
    object qryProdutosOrcamentosvendido: TFloatField
      FieldName = 'vendido'
    end
    object qryProdutosOrcamentosmontagem: TStringField
      FieldName = 'montagem'
      Size = 1
    end
    object qryProdutosOrcamentosentrega: TStringField
      FieldName = 'entrega'
      Size = 1
    end
    object qryProdutosOrcamentosprevisao: TDateField
      FieldName = 'previsao'
    end
    object qryProdutosOrcamentosdescricao: TStringField
      DisplayWidth = 50
      FieldName = 'descricao'
      Size = 100
    end
    object qryProdutosOrcamentosemestoque: TFloatField
      FieldName = 'emestoque'
    end
    object qryProdutosOrcamentosreservado: TFloatField
      FieldName = 'reservado'
    end
    object qryProdutosOrcamentospromocao: TBooleanField
      FieldName = 'promocao'
    end
    object qryProdutosOrcamentosvendedor: TIntegerField
      FieldName = 'vendedor'
    end
    object qryProdutosOrcamentosvalordescontoitem: TFloatField
      FieldName = 'valordescontoitem'
    end
    object qryProdutosOrcamentoscodigobarras: TStringField
      FieldName = 'codigobarras'
      Size = 30
    end
    object qryProdutosOrcamentosprodutovisual: TStringField
      FieldName = 'produtovisual'
    end
    object qryProdutosOrcamentosvalorgrade1: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade1'
      Size = 30
    end
    object qryProdutosOrcamentosvalorgrade2: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade2'
      Size = 30
    end
    object qryProdutosOrcamentoslinha: TStringField
      FieldName = 'linha'
      Size = 40
    end
    object qryProdutosOrcamentoscoluna: TStringField
      FieldName = 'coluna'
      Size = 40
    end
    object qryProdutosOrcamentosunidade: TStringField
      FieldName = 'unidade'
      Size = 8
    end
    object qryProdutosOrcamentosbrinde: TBooleanField
      FieldName = 'brinde'
    end
    object qryProdutosOrcamentosvendasemestoque: TStringField
      FieldName = 'vendasemestoque'
      Size = 1
    end
    object qryProdutosOrcamentoscomposto: TBooleanField
      FieldName = 'composto'
    end
    object qryProdutosOrcamentosmontagemoriginal: TBooleanField
      FieldName = 'montagemoriginal'
    end
    object qryProdutosOrcamentosfuturo: TFloatField
      FieldName = 'futuro'
    end
    object qryProdutosOrcamentossituacao_produto: TStringField
      FieldName = 'situacao_produto'
      Size = 1
    end
    object qryProdutosOrcamentosdescricaolc: TStringField
      DisplayWidth = 72
      FieldKind = fkCalculated
      FieldName = 'descricaolc'
      Size = 162
      Calculated = True
    end
  end
  object dsrProdutosOrcamentos: TtecDataSource
    DataSet = qryProdutosOrcamentos
    Left = 264
    Top = 376
  end
  object qryOrcamentosProdutos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryOrcamentosAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'Situacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Vendedor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Marcadosparanaoligar'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Plano'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Emissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Validade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'QtAtendimentos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataContato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IntervaloValorTotal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Lembrarem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaItemProdutos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaProdutos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaGrupos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaClasses'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaMarcas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Ordenacao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'Select o.codigo,'
      '       o.cliente,'
      '       o.tipocliente,'
      ''
      '       case when o.cliente is not null then'
      
        '         cast((select vf.razao from vfornecedores vf where vf.co' +
        'digo = o.cliente and vf.tipo = o.tipocliente) as varchar(60))'
      '       else'
      '         cast(o.nome as varchar(60))'
      '       end as nome,'
      '       o.filial,'
      '       o.emissao,'
      '       o.validade,'
      '      (Select sum(po.quantidade * po.precovenda)'
      '        From produtosorcamentos po'
      '        Where po.orcamento = o.codigo) as totalprodutos,'
      '       o.situacao,'
      '       o.vendedor,'
      '       u.nome as nome_vendedor,'
      '       o.contrato,'
      ''
      
        '       (select ct.valorprazo from contratos ct where ct.numero =' +
        ' o.contrato) as valorprazo,'
      '       (select cast(CASE WHEN ct.situacao ='#39'O'#39' THEN '#39'OR'#199'ADO'#39
      '                    WHEN ct.situacao ='#39'R'#39' THEN '#39'RESERVADO'#39
      '                    WHEN ct.situacao ='#39'F'#39' THEN '#39'FATURADO'#39
      '                    WHEN ct.situacao ='#39'N'#39' THEN '#39'NOTA FISCAL'#39
      '                    WHEN ct.situacao ='#39'P'#39' THEN '#39'NOTA PARCIAL'#39
      '                    WHEN ct.situacao ='#39'C'#39' THEN '#39'CANCELADO'#39
      '               END  as varchar(20))'
      
        '         from contratos ct where ct.numero = o.contrato) as situ' +
        'acao_contrato,'
      ''
      '       o.cancelamento, '
      ''
      '      (select count(*)'
      '       from atendimentos a'
      '       where a.orcamento = o.codigo) as NAtendimentos,'
      ''
      '      (select a.data'
      '       from atendimentos a'
      '       where a.orcamento = o.codigo'
      '       order by a.data desc limit 1) as data,'
      ''
      
        '      (select cast(cast(a.lembrar as varchar)||'#39' '#39'||cast(a.lembr' +
        'arhora as varchar) as timestamp)'
      '       from atendimentos a'
      '       where a.orcamento = o.codigo'
      
        '       order by cast(cast(a.lembrar as varchar)||'#39' '#39'||cast(a.lem' +
        'brarhora as varchar) as timestamp) desc limit 1) as lembrardatah' +
        'ora,'
      ''
      '      (select a.assunto'
      '       from atendimentos a'
      '       where a.orcamento = o.codigo'
      '       order by a.data desc limit 1) as assunto,'
      ''
      '       o.motivo as motivocancelamento,'
      '       m.descricao as descricaomotivocancelamento,'
      ''
      '       false as selecionar'
      ''
      'From ((orcamentos o'
      '       left join motivos m'
      '       on o.motivo = m.codigo)'
      ''
      '       join usuarios u'
      '       on o.vendedor = u.codigo)'
      ''
      'where u.codigo=o.vendedor'
      'and o.codigo in ('
      '                    Select distinct o.codigo'
      '                    From (orcamentos o'
      '                         join (produtosorcamentos po'
      '                              join produtos p'
      '                                   join (((caracteristicas c'
      '                                        join grupos g'
      '                                        on g.codigo = c.grupo)'
      '                                        join classes cl'
      '                                        on cl.codigo = c.classe)'
      '                                        join marcas m'
      '                                        on m.codigo = c.marca)'
      
        '                                   on p.caracteristica = c.codig' +
        'o'
      '                              on po.produto = p.codigo)'
      '                         on o.codigo = po.orcamento)'
      ''
      '                    %Situacao'
      '                    %Filial'
      '                    %Vendedor'
      '                    %Cliente'
      '                    %Marcadosparanaoligar'
      '                    %Contem'
      '                    %Plano'
      '                    %Produto'
      '                    %Emissao'
      '                    %Validade'
      '                    '
      '                    %QtAtendimentos'
      '                    %DataContato'
      ''
      '                    %IntervaloValorTotal'
      ''
      '                    %Lembrarem'
      ''
      '                    %ListaItemProdutos'
      '                    %ListaProdutos'
      '                    %ListaGrupos'
      '                    %ListaClasses'
      '                    %ListaMarcas'
      '                   )'
      ''
      '%Ordenacao')
    RequestLive = True
    Left = 80
    Top = 259
    object StringField1: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object IntegerField1: TIntegerField
      FieldName = 'filial'
    end
    object DateField1: TDateField
      Alignment = taCenter
      FieldName = 'emissao'
      EditMask = '99/99/9999;1; '
    end
    object DateField2: TDateField
      Alignment = taCenter
      FieldName = 'validade'
      EditMask = '99/99/9999;1; '
    end
    object BooleanField1: TBooleanField
      FieldName = 'selecionar'
    end
    object IntegerField2: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object StringField2: TStringField
      FieldName = 'situacao'
      Size = 1
    end
    object IntegerField3: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object IntegerField4: TIntegerField
      FieldName = 'vendedor'
      DisplayFormat = '0'
    end
    object FloatField1: TFloatField
      FieldName = 'totalprodutos'
      DisplayFormat = '0.00'
    end
    object StringField3: TStringField
      FieldName = 'contrato'
    end
    object StringField4: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
    object DateField3: TDateField
      Alignment = taCenter
      FieldName = 'cancelamento'
      EditMask = '99/99/9999;1; '
    end
    object LargeintField1: TLargeintField
      FieldName = 'natendimentos'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'lembrardatahora'
    end
    object StringField5: TStringField
      FieldName = 'assunto'
      Size = 100
    end
    object DateField4: TDateField
      Alignment = taCenter
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object FloatField2: TFloatField
      FieldName = 'valorprazo'
      DisplayFormat = '###,##0.00'
    end
    object StringField6: TStringField
      FieldName = 'nome_vendedor'
      Required = True
      Size = 40
    end
    object StringField7: TStringField
      FieldName = 'situacao_contrato'
    end
    object IntegerField5: TIntegerField
      FieldName = 'motivocancelamento'
    end
    object StringField8: TStringField
      FieldName = 'descricaomotivocancelamento'
      Size = 30
    end
  end
  object dsrOrcamentosProdutos: TtecDataSource
    DataSet = qryOrcamentosProdutos
    Left = 261
    Top = 259
  end
  object dsrDetalheProdutosOrcamentos: TtecDataSource
    DataSet = qryDetalheProdutosOrcamentos
    Left = 264
    Top = 432
  end
  object qryDetalheProdutosOrcamentos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select c.grupo,'
      '       g.descricao as descricaogrupo'
      'from produtos p'
      '     join caracteristicas c'
      '          join grupos g'
      '          on c.grupo = g.codigo'
      '     on p.caracteristica = c.codigo'
      'where p.codigo = :produto     ')
    RequestLive = False
    Left = 80
    Top = 432
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qryDetalheProdutosOrcamentosgrupo: TStringField
      DisplayLabel = 'GRUPO'
      FieldName = 'grupo'
      Required = True
      Size = 4
    end
    object qryDetalheProdutosOrcamentosdescricaogrupo: TStringField
      DisplayLabel = 'DESCRI'#199#195'O DO GRUPO'
      FieldName = 'descricaogrupo'
      Required = True
      Size = 30
    end
  end
end
