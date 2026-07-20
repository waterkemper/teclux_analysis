inherited dtmSAC: TdtmSAC
  Left = 55
  Top = 178
  Height = 490
  Width = 888
  inherited qryPerguntasAplicadas: TtecQuery
    Sql.Strings = (
      'select  p.codigo,'
      '        p.enunciado,'
      '        p.complementos,'
      '        p.minimo,'
      '        p.maximo,'
      '        p.tipo'
      'from Perguntas p'
      'where (p.valida) and p.codigo in (select qp.pergunta'
      '                                from questionariosperguntas qp'
      '                                where qp.questionario = :codigo)'
      'order by p.ordem  ')
    Left = 174
  end
  inherited dsrPerguntasAplicadas: TtecDataSource
    Left = 334
  end
  inherited dsrRespostaDiscursiva: TtecDataSource
    Left = 334
    Top = 132
  end
  inherited qryContatos: TtecQuery
    AfterPost = qryContatosAfterPost
    AfterCancel = qryContatosAfterCancel
    AfterScroll = qryContatosAfterScroll
    Left = 174
    inherited qryContatossexo: TStringField
      Alignment = taCenter
    end
  end
  inherited dsrContatos: TtecDataSource
    Left = 334
  end
  inherited qryRespostaDiscursiva: TtecQuery
    Left = 174
    Top = 132
  end
  inherited qryOpcoesPerguntasAplicadas: TtecQuery
    Sql.Strings = (
      'Select pergunta,'
      '           codigo,'
      '           opcao'
      'From   opcoesperguntas'
      'Where (Pergunta =:Pergunta)'
      'Order By codigo'
      ''
      ''
      '')
    Left = 334
    Top = 191
  end
  inherited qryRespostaObjetiva: TtecQuery
    Left = 174
    Top = 191
  end
  inherited qryConsultaRespostaObjetiva: TtecQuery
    Left = 499
  end
  inherited qryConsultaContatos: TtecQuery
    Left = 499
  end
  inherited qryProximoNumeroContato: TtecQuery
    Left = 499
    Top = 132
  end
  inherited qryLigacoes: TtecQuery
    Sql.Strings = (
      'select L.filtrosac,'
      '       L.cliente,'
      '       L.usuario,'
      '       L.datahora,'
      '       L.religado,'
      '       L.contato,'
      '       L.situacao'
      'From ligacoes L'
      'Where (L.filtrosac     = :filtrosac)   '
      '          /* Peenchido em RunTime   */  '
      'Order By L.situacao , L.datahora '
      'For Update'
      'Limit 1')
    Left = 662
    ParamData = <
      item
        DataType = ftInteger
        Name = 'filtrosac'
        ParamType = ptUnknown
        Value = '3'
      end>
  end
  inherited dsrLigacoes: TtecDataSource
    Left = 662
  end
  inherited qryExisteContatos: TtecQuery
    Left = 499
    Top = 191
  end
  inherited qryExcluirRespostaObjetiva: TtecQuery
    Left = 662
    Top = 132
  end
  inherited qryExcluirRespostaDiscursiva: TtecQuery
    Left = 662
    Top = 191
  end
  inherited qryExcluirLigacoes: TtecQuery
    Left = 800
  end
  object qryPesquisarPergunta: TtecQuery
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
      'Select Codigo From Perguntas'
      'where Codigo =:PCodigo')
    RequestLive = False
    Left = 499
    Top = 367
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCodigo'
        ParamType = ptUnknown
        Value = 1
      end>
    object qryPesquisarPerguntacodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
  end
  object qryConsultaClientes: TtecQuery
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
      'Select c.Codigo,'
      '       c.Nome,'
      '       c.Nascto,'
      '       c.IdDocumento'
      'From Clientes c'
      '/* Preenchido em runtime. N'#227'o apague */'
      'Order By UPPER(TO_ASCII(c.nome,''LATIN1''))'
      '           ')
    RequestLive = False
    Left = 174
    Top = 367
    object qryConsultaClientescodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Required = True
      Visible = False
    end
    object qryConsultaClientesnome: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'nome'
      Required = True
      Size = 40
    end
    object qryConsultaClientesnascto: TDateField
      DisplayLabel = 'Nascimento'
      FieldName = 'nascto'
    end
    object qryConsultaClientesiddocumento: TStringField
      DisplayLabel = 'Identidade'
      FieldName = 'iddocumento'
    end
  end
  object qryNrOpcoesAssinaladas: TtecQuery
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
      'select Count(*) as Quantidade'
      'from    Objetivas'
      'where (Contato =:Contato) and'
      '           (Questionario =:Questionario) and'
      '           (Pergunta =:Pergunta)')
    RequestLive = False
    Left = 662
    Top = 367
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Contato'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'Questionario'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'Pergunta'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryNrOpcoesAssinaladasquantidade: TIntegerField
      FieldName = 'quantidade'
    end
  end
  object qryDetalhesCliente: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryDetalhesClienteAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    MacroCheck = False
    Sql.Strings = (
      'Select c.codigo,'
      
        '       fone_formatado(c.foneddd,c.fonenumero,c.foneramal) as Tel' +
        'efone1,'
      
        '       fone_formatado(c.fone2ddd,c.fone2numero,c.fone2ramal) as ' +
        'Telefone2,'
      
        '       fone_formatado(c.empfoneddd,c.empfonenumero,c.empfonerama' +
        'l) as FoneEmpresa,'
      
        '       fone_formatado(c.confoneddd,c.confonenumero,c.confonerama' +
        'l) as FoneConjuge,'
      
        '       fone_formatado(c.reffoneddd,c.reffonenumero,c.reffonerama' +
        'l) as FoneRef1,'
      
        '       fone_formatado(c.reffone2ddd,c.reffone2numero,c.reffone2r' +
        'amal) as FoneRef2,'
      '       c.sexo,'
      '       c.connome,'
      '       c.rua,'
      '       c.cidade as codcidade,'
      '       b.nome as bairro,'
      '       cid.nome as cidade,'
      '       c.cep,'
      '       e.codigo as estado,'
      '       c.empcidade as empcidade,'
      '       c.empestado as empestado,'
      '       c.refcidade   as  refcidade,'
      '       c.refestado   as  refestado,'
      '       g.descricao  as  descricaocargo'
      
        'From Clientes c Left Join Cargos g on (c.empcargo = g.codigo), B' +
        'airros b, Cidades cid, Estados e '
      'where (e.codigo = c.estado)   And'
      '      (cid.codigo = c.cidade)    And'
      '      (b.codigo = c.bairro)        And'
      '      (cid.estado = e.codigo)    And'
      '      (cid.codigo = b.cidade)    And'
      '      (e.codigo = b.estado)       And'
      '      (c.codigo = :Cliente)')
    RequestLive = True
    Left = 174
    Top = 249
    ParamData = <
      item
        DataType = ftString
        Name = 'Cliente'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryDetalhesClientecodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryDetalhesClienterua: TStringField
      FieldName = 'rua'
      Required = True
      Size = 100
    end
    object qryDetalhesClientebairro: TStringField
      FieldName = 'bairro'
      Size = 30
    end
    object qryDetalhesClientecidade: TStringField
      FieldName = 'cidade'
      Required = True
      Size = 30
    end
    object qryDetalhesClientecep: TIntegerField
      FieldName = 'cep'
      Required = True
      DisplayFormat = '0'
    end
    object qryDetalhesClienteestado: TStringField
      FieldName = 'estado'
      Required = True
      Size = 2
    end
    object qryDetalhesClienterefcidade: TIntegerField
      FieldName = 'refcidade'
      DisplayFormat = '0'
    end
    object qryDetalhesClienterefestado: TStringField
      FieldName = 'refestado'
      Size = 2
    end
    object qryDetalhesClientecodcidade: TIntegerField
      FieldName = 'codcidade'
      Required = True
      DisplayFormat = '0'
    end
    object qryDetalhesClienteempcidade: TIntegerField
      FieldName = 'empcidade'
      DisplayFormat = '0'
    end
    object qryDetalhesClienteempestado: TStringField
      FieldName = 'empestado'
      Size = 2
    end
    object qryDetalhesClientesexo: TStringField
      FieldName = 'sexo'
      Size = 1
    end
    object qryDetalhesClientetelefone1: TStringField
      Alignment = taRightJustify
      DisplayWidth = 25
      FieldName = 'telefone1'
      Size = 25
    end
    object qryDetalhesClientetelefone2: TStringField
      Alignment = taRightJustify
      FieldName = 'telefone2'
      Size = 25
    end
    object qryDetalhesClientefoneempresa: TStringField
      Alignment = taRightJustify
      FieldName = 'foneempresa'
      Size = 25
    end
    object qryDetalhesClientefoneconjuge: TStringField
      Alignment = taRightJustify
      FieldName = 'foneconjuge'
      Size = 25
    end
    object qryDetalhesClientefoneref1: TStringField
      Alignment = taRightJustify
      FieldName = 'foneref1'
      Size = 25
    end
    object qryDetalhesClientefoneref2: TStringField
      Alignment = taRightJustify
      FieldName = 'foneref2'
      Size = 25
    end
    object qryDetalhesClienteconnome: TStringField
      FieldName = 'connome'
      Size = 40
    end
    object qryDetalhesClientedescricaocargo: TStringField
      FieldName = 'descricaocargo'
      Required = True
      Size = 30
    end
  end
  object qryProdutosContrato: TtecQuery
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
    MacroCheck = False
    Sql.Strings = (
      'Select p.descricao,'
      '       pc.quantidade'
      'From Produtos p, ProdutosContratos pc'
      'where (p.codigo = pc.produto) And'
      '      (pc.contrato = :contrato)')
    RequestLive = False
    Left = 499
    Top = 249
    ParamData = <
      item
        DataType = ftString
        Name = 'contrato'
        ParamType = ptUnknown
      end>
    object qryProdutosContratodescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 60
      FieldName = 'descricao'
      Required = True
      Size = 40
    end
    object qryProdutosContratoquantidade: TIntegerField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
      Required = True
    end
  end
  object dsrDetalhesCliente: TtecDataSource
    DataSet = qryDetalhesCliente
    Left = 334
    Top = 249
  end
  object dsrProdutosContrato: TtecDataSource
    DataSet = qryProdutosContrato
    Left = 662
    Top = 249
  end
  object qryContratosCliente: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryContratosClienteAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'Select s.numero,'
      '           s.data,'
      '           s.filialvenda,'
      '           s.vendedor,'
      '           u.nome '
      'from    contratos s, usuarios u'
      'where (s.cliente = :cliente) and'
      '          (s.vendedor = u.codigo)'
      'order by data desc')
    RequestLive = False
    Left = 174
    Top = 308
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cliente'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryContratosClientenumero: TStringField
      DisplayLabel = 'N'#250'mero'
      DisplayWidth = 14
      FieldName = 'numero'
      Required = True
    end
    object qryContratosClientedata: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data'
      FieldName = 'data'
      Required = True
      DisplayFormat = 'dd/mmm/yyyy'
      EditMask = '99/99/9999;1; '
    end
    object qryContratosClientefilialvenda: TIntegerField
      DisplayLabel = 'Filial'
      DisplayWidth = 4
      FieldName = 'filialvenda'
      DisplayFormat = '0'
    end
    object qryContratosClientenome: TStringField
      DisplayLabel = 'Vendedor'
      FieldName = 'nome'
      Required = True
      Size = 40
    end
  end
  object dsrContratosCliente: TtecDataSource
    DataSet = qryContratosCliente
    Left = 334
    Top = 308
  end
  object qryQuestionarioFiltro: TtecQuery
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
      'Select   F.Questionario,'
      '            F.Tipo,'
      '            Q.Descricao'
      
        'From     FiltrosSAC F left join Questionarios Q on (F.Numero =:N' +
        'umero)'
      'Where   (F.Questionario = Q.Codigo)')
    RequestLive = False
    Left = 334
    Top = 367
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Numero'
        ParamType = ptUnknown
      end>
    object qryQuestionarioFiltroquestionario: TIntegerField
      FieldName = 'questionario'
      DisplayFormat = '0'
    end
    object qryQuestionarioFiltrotipo: TStringField
      FieldName = 'tipo'
      Required = True
      Size = 1
    end
    object qryQuestionarioFiltrodescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 30
    end
  end
  object qryFonesCliente: TtecQuery
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
      'Select  Fonenumero,'
      '            Fone2numero,'
      '            Empfonenumero,'
      '            Confonenumero,'
      '            Reffonenumero,'
      '            Reffone2numero'
      'From    Clientes'
      'Where Codigo =:Codigo'
      '')
    RequestLive = False
    Left = 800
    Top = 308
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
        Value = '100001'
      end>
    object qryFonesClientefonenumero: TIntegerField
      FieldName = 'fonenumero'
    end
    object qryFonesClientefone2numero: TIntegerField
      FieldName = 'fone2numero'
    end
    object qryFonesClienteempfonenumero: TIntegerField
      FieldName = 'empfonenumero'
    end
    object qryFonesClienteconfonenumero: TIntegerField
      FieldName = 'confonenumero'
    end
    object qryFonesClientereffonenumero: TIntegerField
      FieldName = 'reffonenumero'
    end
    object qryFonesClientereffone2numero: TIntegerField
      FieldName = 'reffone2numero'
    end
  end
  object qryChamadaLigar: TtecQuery
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
      
        'Select Chamadas_Ligar(:Fone,:Estado,:Cidade,:Operador,:Filtro) a' +
        's numero')
    RequestLive = False
    Left = 174
    Top = 426
    ParamData = <
      item
        DataType = ftString
        Name = 'Fone'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'Estado'
        ParamType = ptUnknown
        Value = 'SC'
      end
      item
        DataType = ftString
        Name = 'Cidade'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'Operador'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Filtro'
        ParamType = ptUnknown
        Value = '1'
      end>
    object qryChamadaLigarnumero: TIntegerField
      FieldName = 'numero'
    end
  end
  object qryChamadaDesligar: TtecQuery
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
      'Select Chamadas_Desligar(:Numero)')
    RequestLive = False
    Left = 334
    Top = 426
    ParamData = <
      item
        DataType = ftString
        Name = 'Numero'
        ParamType = ptUnknown
        Value = '1'
      end>
  end
  object qryChamadaStatus: TtecQuery
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
      'Select Chamadas_Status(:Numero,:Status) as QueStatus')
    RequestLive = False
    Left = 499
    Top = 426
    ParamData = <
      item
        DataType = ftString
        Name = 'Numero'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'Status'
        ParamType = ptUnknown
      end>
    object qryChamadaStatusQueStatus: TStringField
      FieldName = 'QueStatus'
      Size = 1
    end
  end
  object dsrAtendimentosPorCliente: TtecDataSource
    DataSet = qryAtendimentosPorCliente
    Left = 662
    Top = 308
  end
  object qryAtendimentosPorCliente: TtecQuery
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
      'select a.cliente,'
      '       a.data,'
      '       a.lembrar,'
      '       a.tipo,'
      '       a.concluido,'
      '       a.Informes'
      'from   atendimentos a'
      'where  (a.cliente =:cliente)'
      'order by a.data desc'
      '          ')
    RequestLive = True
    Left = 499
    Top = 308
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cliente'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryAtendimentosPorClientecliente: TIntegerField
      FieldName = 'cliente'
      Required = True
    end
    object qryAtendimentosPorClientedata: TDateField
      FieldName = 'data'
      Required = True
    end
    object qryAtendimentosPorClientelembrar: TDateField
      FieldName = 'lembrar'
    end
    object qryAtendimentosPorClientetipo: TStringField
      FieldName = 'tipo'
      Required = True
      Size = 1
    end
    object qryAtendimentosPorClienteconcluido: TBooleanField
      FieldName = 'concluido'
    end
    object qryAtendimentosPorClienteinformes: TStringField
      FieldName = 'informes'
      Required = True
      Size = 512
    end
  end
  object qryExisteLigacoes: TtecQuery
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
      'Select int4(Count(*)) as Qtde '
      'from Ligacoes'
      'Where  '
      '    /*                           */'
      '    FiltroSAC =:Filtro')
    RequestLive = False
    Left = 800
    Top = 73
    ParamData = <
      item
        DataType = ftString
        Name = 'Filtro'
        ParamType = ptUnknown
        Value = '3'
      end>
    object qryExisteLigacoesqtde: TIntegerField
      FieldName = 'qtde'
      DisplayFormat = '0'
    end
  end
end
