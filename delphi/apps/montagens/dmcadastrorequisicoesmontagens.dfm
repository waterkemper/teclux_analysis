inherited dtmCadastroRequisicoesMontagens: TdtmCadastroRequisicoesMontagens
  OldCreateOrder = False
  Left = 388
  Top = 100
  Height = 668
  Width = 772
  object qryRequisicoes: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryRequisicoesAfterOpen
    AfterScroll = qryRequisicoesAfterScroll
    OnDeleteError = PostError
    OnEditError = PostError
    OnPostError = PostError
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select'
      '       r.numero,'
      '       r.abertura,'
      '       r.dadofiscal,'
      '       r.filialmontagem,'
      '       r.montador,'
      '       r.tipomontador,'
      '       r.vendedor,'
      '       r.cliente,'
      '       r.tipocliente,'
      '       r.datahora,'
      '       r.rua,'
      '       r.endnumero,'
      '       r.endcomplemento,'
      '       r.estado,'
      '       r.cidade,'
      '       r.bairro,'
      '       r.cep,'
      '       r.observacoes,'
      '       r.foneddd,'
      '       r.fonenumero,'
      '       r.foneramal,'
      '       (select df.observacoes from dadosfiscais df'
      
        '                              where df.numero = r.dadofiscal) as' +
        ' obsdadofiscal,'
      '       (select df.filialemissao from dadosfiscais df'
      
        '                                where df.numero = r.dadofiscal) ' +
        'as filialemissao,'
      '       (select f.nome from filiais f'
      
        '                      where f.codigo = (select df.filialemissao ' +
        'from dadosfiscais df'
      
        '                                                                ' +
        'where df.numero = r.dadofiscal)) as nomefilialemissao,'
      '       (select ct.filialvenda from contratos ct'
      
        '                              where ct.numero = (select df.contr' +
        'ato from dadosfiscais df'
      
        '                                                                ' +
        '    where df.numero = r.dadofiscal)) as filialvenda,'
      '       (select f.nome from filiais f'
      
        '                      where f.codigo = (select ct.filialvenda fr' +
        'om contratos ct'
      
        '                                                              wh' +
        'ere ct.numero=(select df.contrato from dadosfiscais df'
      
        '                                                                ' +
        '                                  where df.numero = r.dadofiscal' +
        '))) as nomefilialvenda,'
      '       (select df.contrato from dadosfiscais df'
      
        '                           where df.numero=r.dadofiscal) as cont' +
        'rato,'
      '       (select ct.faturamento from contratos ct'
      
        '                              where ct.numero = (select df.contr' +
        'ato from dadosfiscais df'
      
        '                                                                ' +
        '    where df.numero = r.dadofiscal)) as faturamento,'
      
        '       (select n.serie from notas n where n.dadofiscal = r.dadof' +
        'iscal) as serie,'
      
        '       (select n.numero from notas n where n.dadofiscal = r.dado' +
        'fiscal) as notafiscal,'
      
        '       (select c.maquina from cupons c where c.dadofiscal = r.da' +
        'dofiscal) as maquina,'
      
        '       (select c.intervensao from cupons c where c.dadofiscal = ' +
        'r.dadofiscal) as intervensao,'
      
        '       (select c.numero from cupons c where c.dadofiscal = r.dad' +
        'ofiscal) as cupomfiscal,'
      '       (select nome from cidades d'
      '                    where (d.estado = r.estado) and'
      '                          (d.codigo = r.cidade)) as nomecidade,'
      '       (select nome from bairros b'
      '                    where (b.estado = r.estado) and'
      '                          (b.cidade = r.cidade) and'
      '                          (b.codigo = r.bairro)) as nomebairro,'
      
        '        cast(coalesce((case when (select count(*) from requisico' +
        'esitens ri'
      
        '                                  where ri.requisicao = r.numero' +
        ' and'
      
        '                                        ri.datamontagem is not n' +
        'ull) = 0 then '#39'ABERTO'#39' else'
      
        '                      (case when (select count(*) from requisico' +
        'esitens ri'
      
        '                                  where ri.requisicao = r.numero' +
        ' and'
      
        '                                        ri.datamontagem is null)' +
        '=0 then '#39'FECHADO'#39' else'
      '                      '#39'PARCIAL'#39
      '                      end)'
      '        end),'#39'ABERTA'#39') as varchar) as situacao,'
      
        '        cast(coalesce((case when (select count(*) from requisico' +
        'esitens ri'
      
        '                                  where ri.requisicao = r.numero' +
        ' and'
      
        '                                        ri.datapagto is not null' +
        ')=0 then '#39'ABERTO'#39' else'
      
        '                      (case when (select count(*) from requisico' +
        'esitens ri'
      
        '                                  where ri.requisicao = r.numero' +
        ' and'
      
        '                                        ri.datapagto is null)=0 ' +
        'then '#39'FECHADO'#39' else'
      '                      '#39'PARCIAL'#39
      '                      end)'
      '        end),'#39'ABERTA'#39') as varchar) as situacaopagto'
      'from requisicoes r'
      'where (r.numero = :numero)')
    RequestLive = True
    Left = 72
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end>
    object qryRequisicoesnumero: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryRequisicoesabertura: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data de Abertura'
      FieldName = 'abertura'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryRequisicoesfilialemissao: TIntegerField
      DisplayLabel = 'Filial'
      FieldName = 'filialemissao'
      DisplayFormat = '0'
    end
    object qryRequisicoesserie: TStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'serie'
      Size = 50
    end
    object qryRequisicoesmaquina: TIntegerField
      DisplayLabel = 'ECF'
      FieldName = 'maquina'
      DisplayFormat = '0'
    end
    object qryRequisicoesintervensao: TIntegerField
      DisplayLabel = 'Interven'#231#227'o'
      FieldName = 'intervensao'
      DisplayFormat = '0'
    end
    object qryRequisicoesfilialmontagem: TIntegerField
      DisplayLabel = 'Filial de Montagem'
      FieldName = 'filialmontagem'
      Required = True
      DisplayFormat = '0'
    end
    object qryRequisicoesmontador: TIntegerField
      DisplayLabel = 'Montador'
      FieldName = 'montador'
      Required = True
      DisplayFormat = '0'
    end
    object qryRequisicoesvendedor: TIntegerField
      FieldName = 'vendedor'
      DisplayFormat = '0'
    end
    object qryRequisicoescliente: TIntegerField
      FieldName = 'cliente'
      Required = True
      DisplayFormat = '0'
    end
    object qryRequisicoesdatahora: TDateTimeField
      FieldName = 'datahora'
      Required = True
    end
    object qryRequisicoesrua: TStringField
      FieldName = 'rua'
      Size = 100
    end
    object qryRequisicoesestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object qryRequisicoescidade: TIntegerField
      FieldName = 'cidade'
      DisplayFormat = '0'
    end
    object qryRequisicoesbairro: TIntegerField
      FieldName = 'bairro'
      DisplayFormat = '0'
    end
    object qryRequisicoescep: TIntegerField
      FieldName = 'cep'
      DisplayFormat = '0'
    end
    object qryRequisicoesobservacoes: TStringField
      DisplayWidth = 500
      FieldName = 'observacoes'
      Size = 500
    end
    object qryRequisicoesnomebairro: TStringField
      FieldName = 'nomebairro'
      Size = 50
    end
    object qryRequisicoesnomecidade: TStringField
      FieldName = 'nomecidade'
      Size = 50
    end
    object qryRequisicoessituacao: TStringField
      FieldName = 'situacao'
      Size = 50
    end
    object qryRequisicoesfoneddd: TIntegerField
      FieldName = 'foneddd'
      DisplayFormat = '0'
    end
    object qryRequisicoesfoneramal: TStringField
      FieldName = 'foneramal'
      Size = 10
    end
    object qryRequisicoesfonenumero: TIntegerField
      FieldName = 'fonenumero'
      DisplayFormat = '0'
    end
    object qryRequisicoesnotafiscal: TIntegerField
      DisplayLabel = 'N'#250'mero da Nota Fiscal'
      FieldName = 'notafiscal'
      DisplayFormat = '0'
    end
    object qryRequisicoescupomfiscal: TIntegerField
      DisplayLabel = 'N'#250'mero do Cupom Fiscal'
      FieldName = 'cupomfiscal'
      DisplayFormat = '0'
    end
    object qryRequisicoesdadofiscal: TIntegerField
      FieldName = 'dadofiscal'
      DisplayFormat = '0'
    end
    object qryRequisicoestipomontador: TStringField
      FieldName = 'tipomontador'
      Required = True
      Size = 1
    end
    object qryRequisicoestipocliente: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
    object qryRequisicoescontrato: TStringField
      FieldName = 'contrato'
      Size = 50
    end
    object qryRequisicoesfilialvenda: TIntegerField
      FieldName = 'filialvenda'
      DisplayFormat = '0'
    end
    object qryRequisicoesobsdadofiscal: TStringField
      FieldName = 'obsdadofiscal'
      Size = 50
    end
    object qryRequisicoesnomefilialvenda: TStringField
      FieldName = 'nomefilialvenda'
      Size = 50
    end
    object qryRequisicoesnomefilialemissao: TStringField
      FieldName = 'nomefilialemissao'
      Size = 50
    end
    object qryRequisicoessituacaopagto: TStringField
      FieldName = 'situacaopagto'
      Size = 50
    end
    object qryRequisicoesfaturamento: TDateField
      Alignment = taCenter
      FieldName = 'faturamento'
      EditMask = '99/99/9999;1; '
    end
    object qryRequisicoesendnumero: TIntegerField
      FieldName = 'endnumero'
    end
    object qryRequisicoesendcomplemento: TStringField
      FieldName = 'endcomplemento'
      Size = 100
    end
  end
  object dsrRequisicoes: TtecDataSource
    DataSet = qryRequisicoes
    OnDataChange = dsrRequisicoesDataChange
    Left = 272
    Top = 8
  end
  object dsrRequisicoesItens: TtecDataSource
    DataSet = qryRequisicoesItens
    OnDataChange = dsrRequisicoesItensDataChange
    Left = 272
    Top = 56
  end
  object qryProcuraFiliaisMontagem: TtecQuery
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
      'select codigo, nome'
      'from filiais'
      'where codigo=:codigo')
    RequestLive = False
    Left = 72
    Top = 202
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraFiliaisMontagemcodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryProcuraFiliaisMontagemnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
  end
  object dsrProcuraFiliaisMontagem: TtecDataSource
    DataSet = qryProcuraFiliaisMontagem
    Left = 272
    Top = 202
  end
  object qryProcuraVendedor: TtecQuery
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
      'SELECT u.codigo,'
      '       u.nome'
      'FROM  usuarios u'
      'WHERE (u.codigo = :codigo)'
      '  and ((u.inativo is null) or (u.inativo >= :dataemissao))'
      '  and (((u.venda) or ((Select count(*)'
      #9#9'       from gruposusuarios gu'
      #9#9'       where gu.codigo = u.grupo'
      #9#9#9' and gu.vendedor) > 0))'
      #9'or u.codigo = :codigoinativo)')
    RequestLive = False
    Left = 72
    Top = 404
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'dataemissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'codigoinativo'
        ParamType = ptUnknown
      end>
    object qryProcuraVendedorcodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryProcuraVendedornome: TStringField
      FieldName = 'nome'
      Size = 40
    end
  end
  object dsrProcuraVendedor: TtecDataSource
    DataSet = qryProcuraVendedor
    Left = 272
    Top = 404
  end
  object qryProcuraCliente: TtecQuery
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
      'Select vf.Codigo,'
      '          coalesce(vf.razao,vf.nome) as nome,'
      '          vf.tipo,'
      '          vf.rua,'
      '          vf.cidade,'
      '          vf.estado,'
      '          vf.bairro, '
      '          vf.cep,'
      '          vf.foneddd,'
      '          vf.fonenumero,'
      '          vf.foneramal,'
      '          vf.fonedddempresa,'
      '          vf.fonenumeroempresa,'
      '          vf.foneramalempresa,'
      '          vf.empresa,   '
      '       (select nome'
      '        from cidades d'
      '        where (d.estado = vf.estado) and'
      '              (d.codigo = vf.cidade)'
      '       ) as nomecidade,'
      '       (select nome'
      '        from bairros b'
      '        where (b.estado = vf.estado) and'
      '              (b.cidade = vf.cidade) and'
      '              (b.codigo = vf.bairro)'
      '       ) as nomebairro'
      '                 '
      'From   vfornecedores vf'
      'where (vf.codigo = :codigo)  and'
      '          (vf.tipo     = :tipocliente) '
      'Order By Codigo, tipo')
    RequestLive = False
    Left = 74
    Top = 452
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'tipocliente'
        ParamType = ptUnknown
      end>
    object qryProcuraClientecodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryProcuraClientenome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object qryProcuraClientetipo: TStringField
      FieldName = 'tipo'
      Size = 50
    end
    object qryProcuraClienterua: TStringField
      FieldName = 'rua'
      Size = 50
    end
    object qryProcuraClientecidade: TIntegerField
      FieldName = 'cidade'
      DisplayFormat = '0'
    end
    object qryProcuraClienteestado: TStringField
      FieldName = 'estado'
      Size = 50
    end
    object qryProcuraClientebairro: TIntegerField
      FieldName = 'bairro'
      DisplayFormat = '0'
    end
    object qryProcuraClientecep: TIntegerField
      FieldName = 'cep'
      DisplayFormat = '0'
    end
    object qryProcuraClientefoneddd: TIntegerField
      FieldName = 'foneddd'
      DisplayFormat = '0'
    end
    object qryProcuraClientefonenumero: TIntegerField
      FieldName = 'fonenumero'
      DisplayFormat = '0'
    end
    object qryProcuraClientefoneramal: TStringField
      FieldName = 'foneramal'
      Size = 50
    end
    object qryProcuraClientenomecidade: TStringField
      FieldName = 'nomecidade'
      Size = 50
    end
    object qryProcuraClientenomebairro: TStringField
      FieldName = 'nomebairro'
      Size = 50
    end
    object qryProcuraClientefonedddempresa: TIntegerField
      FieldName = 'fonedddempresa'
      DisplayFormat = '0'
    end
    object qryProcuraClientefonenumeroempresa: TIntegerField
      FieldName = 'fonenumeroempresa'
      DisplayFormat = '0'
    end
    object qryProcuraClientefoneramalempresa: TStringField
      FieldName = 'foneramalempresa'
      Size = 50
    end
    object qryProcuraClienteempresa: TStringField
      FieldName = 'empresa'
      Size = 50
    end
  end
  object dsrProcuraCliente: TtecDataSource
    DataSet = qryProcuraCliente
    Left = 271
    Top = 453
  end
  object qryConsultaVendedores: TtecQuery
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
      'Select u.nome,'
      '           u.codigo'
      'From  usuarios u'
      'WHERE (u.codigo = :codigo)'
      '  and ((u.inativo is null) or (u.inativo >= :dataemissao))'
      '  and (((u.venda) or ((Select count(*)'
      #9#9'       from gruposusuarios gu'
      #9#9'       where gu.codigo = u.grupo'
      #9#9#9' and gu.vendedor) > 0))'
      #9'or u.codigo = :codigoinativo)'
      'Order By UPPER(TO_ASCII(u.nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 443
    Top = 406
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataemissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'codigoinativo'
        ParamType = ptUnknown
      end>
    object qryConsultaVendedoresnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaVendedorescodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
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
      'select codigo,nome'
      'from filiais'
      'order by UPPER(TO_ASCII(nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 436
    Top = 212
    object qryConsultaFiliaisnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaFiliaiscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
  object qryProcuraMontador: TtecQuery
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
      'Select Codigo,'
      '          Nome,'
      '          tipo'
      'From   vmontadores'
      'where (codigo = :codigo) and'
      '          (tipo     = :tipomontador)'
      'Order By Codigo, tipo')
    RequestLive = False
    Left = 74
    Top = 501
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'tipomontador'
        ParamType = ptUnknown
      end>
    object qryProcuraMontadorcodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryProcuraMontadornome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object qryProcuraMontadortipo: TStringField
      FieldName = 'tipo'
      Size = 50
    end
  end
  object dsrProcuraMontador: TtecDataSource
    DataSet = qryProcuraMontador
    Left = 271
    Top = 502
  end
  object qryConsultaMontador: TtecQuery
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
      'Select Nome,'
      '          Codigo,'
      '        tipo,'
      '       cast(case when tipo = '#39'F'#39' then '#39'Fornecedor'#39
      '                       when tipo = '#39'U'#39' then '#39'Usu'#225'rio'#39
      '               end as varchar) as tipoorig'
      'From   vmontadores'
      'Order By UPPER(TO_ASCII(nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 436
    Top = 512
    object qryConsultaMontadornome: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 40
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaMontadorcodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
    object qryConsultaMontadortipo: TStringField
      FieldName = 'tipo'
      Visible = False
      Size = 1
    end
    object qryConsultaMontadortipoorig: TStringField
      DisplayLabel = 'Tipo Montador'
      FieldName = 'tipoorig'
      Visible = False
      Size = 10
    end
  end
  object qryProcuraDadosFiscaisNotas: TtecQuery
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
      'select  distinct'
      '        df.numero as dadofiscal,'
      '        df.filialemissao,'
      '        n.serie,'
      '        n.numero,'
      '        cp.maquina,'
      '        cp.intervensao,'
      '        cp.numero as CupomFiscal,'
      '        c.vendedor,'
      '        c.cliente,'
      '        c.tipocliente,'
      '        c.montagemfilial,'
      '        c.montagemobs,'
      
        '        case when c.entrua is not null then c.entrua            ' +
        'else vf.rua end as entrua,'
      
        '        case when c.entrua is not null then c.entcidade       el' +
        'se vf.cidade end as entcidade,'
      '       (select nome'
      '        from cidades d'
      
        '        where (d.estado = (case when c.entrua is not null then c' +
        '.entestado        else vf.estado end) ) and'
      
        '                 (d.codigo = (case when c.entrua is not null the' +
        'n c.entcidade        else vf.cidade end) )'
      '       ) as nomecidade,'
      
        '        case when c.entrua is not null then c.entestado        e' +
        'lse vf.estado end as entestado,'
      
        '        case when c.entrua is not null then c.entbairro         ' +
        'else vf.bairro end as entbairro,'
      '        (select nome'
      '        from bairros b'
      
        '        where (b.estado = (case when c.entrua is not null then c' +
        '.entestado        else vf.estado end) ) and'
      
        '                 (b.cidade = (case when c.entrua is not null the' +
        'n c.entcidade        else vf.cidade end) ) and'
      
        '                 (b.codigo = (case when c.entrua is not null the' +
        'n c.entbairro         else vf.bairro end) )'
      '        ) as nomebairro,'
      
        '        case when c.entrua is not null then c.entcep            ' +
        'else vf.cep end as entcep,'
      
        '        case when c.entrua is not null then c.entfoneddd      el' +
        'se vf.foneddd end as entfoneddd,'
      
        '        case when c.entrua is not null then c.entfonenumero else' +
        ' vf.fonenumero end as entfonenumero,'
      
        '        case when c.entrua is not null then c.entfoneramal    el' +
        'se vf.foneramal end as entfoneramal,'
      '        r.numero as requisicao,'
      '        c.numero as contrato,'
      '        c.faturamento '
      ''
      
        'from (((((((dadosfiscais df join (produtosdadosfiscais pdf join ' +
        'produtos p on pdf.produto=p.codigo) on df.numero=pdf.dadofiscal)'
      
        '                           join ((contratos c join produtoscontr' +
        'atos pc on c.numero=pc.contrato) join filiais fc on c.filialvend' +
        'a=fc.codigo) on df.contrato=c.numero)'
      
        '                           join vfornecedores vf on df.cliente=v' +
        'f.codigo and df.tipocliente=vf.tipo)'
      
        '                                join notas n on df.numero=n.dado' +
        'fiscal)'
      
        '                           left join cupons cp on df.numero=cp.d' +
        'adofiscal)'
      
        '                           join filiais f on df.filialemissao=f.' +
        'codigo)'
      
        '                           left join requisicoes r on df.numero=' +
        'r.dadofiscal)'
      ''
      
        'where  (pdf.produto=pc.produto and pdf.filial=pc.filial and pc.m' +
        'ontagem='#39'S'#39') and c.montagemfilial is not null'
      
        '/*        and (pdf.produto||pdf.filial) not in (select ri.produt' +
        'o||ri.filial from requisicoesitens ri where ri.requisicao in (se' +
        'lect r.numero from requisicoes r where r.dadofiscal=pdf.dadofisc' +
        'al)) */'
      '        and df.situacao<>'#39'C'#39
      '        and df.filialemissao=:filialemissao'
      '        and n.serie=:serie'
      '        and n.numero=:numeronota')
    RequestLive = False
    Left = 75
    Top = 105
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filialemissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'serie'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numeronota'
        ParamType = ptUnknown
      end>
    object qryProcuraDadosFiscaisNotasdadofiscal: TIntegerField
      FieldName = 'dadofiscal'
      DisplayFormat = '0'
    end
    object qryProcuraDadosFiscaisNotasvendedor: TIntegerField
      FieldName = 'vendedor'
      DisplayFormat = '0'
    end
    object qryProcuraDadosFiscaisNotascliente: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object qryProcuraDadosFiscaisNotasmontagemfilial: TIntegerField
      FieldName = 'montagemfilial'
      DisplayFormat = '0'
    end
    object qryProcuraDadosFiscaisNotasentrua: TStringField
      FieldName = 'entrua'
      Size = 50
    end
    object qryProcuraDadosFiscaisNotasentcidade: TIntegerField
      FieldName = 'entcidade'
      DisplayFormat = '0'
    end
    object qryProcuraDadosFiscaisNotasentestado: TStringField
      FieldName = 'entestado'
      Size = 50
    end
    object qryProcuraDadosFiscaisNotasentbairro: TIntegerField
      FieldName = 'entbairro'
      DisplayFormat = '0'
    end
    object qryProcuraDadosFiscaisNotasentcep: TIntegerField
      FieldName = 'entcep'
      DisplayFormat = '0'
    end
    object qryProcuraDadosFiscaisNotasentfoneddd: TIntegerField
      FieldName = 'entfoneddd'
      DisplayFormat = '0'
    end
    object qryProcuraDadosFiscaisNotasentfonenumero: TIntegerField
      FieldName = 'entfonenumero'
      DisplayFormat = '0'
    end
    object qryProcuraDadosFiscaisNotasnumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryProcuraDadosFiscaisNotasfilialemissao: TIntegerField
      FieldName = 'filialemissao'
      DisplayFormat = '0'
    end
    object qryProcuraDadosFiscaisNotasserie: TStringField
      FieldName = 'serie'
      Size = 3
    end
    object qryProcuraDadosFiscaisNotasmaquina: TIntegerField
      FieldName = 'maquina'
      DisplayFormat = '0'
    end
    object qryProcuraDadosFiscaisNotasintervensao: TIntegerField
      FieldName = 'intervensao'
      DisplayFormat = '0'
    end
    object qryProcuraDadosFiscaisNotascupomfiscal: TIntegerField
      FieldName = 'cupomfiscal'
      DisplayFormat = '0'
    end
    object qryProcuraDadosFiscaisNotasmontagemobs: TStringField
      FieldName = 'montagemobs'
      Size = 100
    end
    object qryProcuraDadosFiscaisNotasentfoneramal: TStringField
      FieldName = 'entfoneramal'
      Size = 50
    end
    object qryProcuraDadosFiscaisNotasnomecidade: TStringField
      FieldName = 'nomecidade'
      Size = 50
    end
    object qryProcuraDadosFiscaisNotasnomebairro: TStringField
      FieldName = 'nomebairro'
      Size = 50
    end
    object qryProcuraDadosFiscaisNotastipocliente: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
    object qryProcuraDadosFiscaisNotasrequisicao: TIntegerField
      FieldName = 'requisicao'
      DisplayFormat = '0'
    end
    object qryProcuraDadosFiscaisNotascontrato: TStringField
      FieldName = 'contrato'
    end
    object qryProcuraDadosFiscaisNotasfaturamento: TDateField
      Alignment = taCenter
      FieldName = 'faturamento'
      EditMask = '99/99/9999;1; '
    end
  end
  object dsrProcuraDadosFiscaisNotas: TtecDataSource
    DataSet = qryProcuraDadosFiscaisNotas
    Left = 272
    Top = 105
  end
  object qryConsultaDadosFiscaisNotas: TtecQuery
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
      'select  distinct'
      '        n.numero as NotaFiscal,'
      '        n.serie,'
      '        df.filialemissao,'
      '        f.nome as nomefilialemissao,'
      '        c.numero as contrato,'
      '        c.vendedor,'
      '        c.cliente,'
      '        c.montagemfilial,'
      '        df.numero as dadofiscal,'
      '        cp.maquina,'
      '        cp.intervensao,'
      '        cp.numero as CupomFiscal'
      ''
      
        'from ((((((dadosfiscais df join (produtosdadosfiscais pdf join p' +
        'rodutos p on pdf.produto=p.codigo) on df.numero=pdf.dadofiscal)'
      
        '                           join ((contratos c join produtoscontr' +
        'atos pc on c.numero=pc.contrato) join filiais fc on c.filialvend' +
        'a=fc.codigo) on df.contrato=c.numero)'
      
        '                           join vfornecedores vf on df.cliente=v' +
        'f.codigo and df.tipocliente=vf.tipo)'
      
        '                                join notas n on df.numero=n.dado' +
        'fiscal)'
      
        '                           left join cupons cp on df.numero=cp.d' +
        'adofiscal)'
      
        '                           join filiais f on df.filialemissao=f.' +
        'codigo)'
      ''
      
        'where  (pdf.produto=pc.produto and pdf.filial=pc.filial and pc.m' +
        'ontagem='#39'S'#39') and c.montagemfilial is not null'
      
        '        and (pdf.produto,pdf.filial) not in (select ri.produto,r' +
        'i.filial from requisicoesitens ri where ri.requisicao in (select' +
        ' r.numero from requisicoes r where r.dadofiscal=pdf.dadofiscal))'
      '        and df.situacao<>'#39'C'#39
      '         /* Where Filiais */'
      '         /* Where Series */'
      '        or df.numero=:dadofiscal_1 or df.numero=:dadofiscal_2'
      'order by n.numero')
    RequestLive = False
    Left = 435
    Top = 106
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dadofiscal_1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dadofiscal_2'
        ParamType = ptUnknown
      end>
    object qryConsultaDadosFiscaisNotasnotafiscal: TIntegerField
      DisplayLabel = 'Nota Fiscal'
      FieldName = 'notafiscal'
      DisplayFormat = '0'
    end
    object qryConsultaDadosFiscaisNotasserie: TStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'serie'
      Required = True
      Size = 3
    end
    object qryConsultaDadosFiscaisNotasfilialemissao: TIntegerField
      DisplayLabel = 'Filial'
      FieldName = 'filialemissao'
      Visible = False
      DisplayFormat = '0'
    end
    object qryConsultaDadosFiscaisNotasnomefilialemissao2: TStringField
      DisplayLabel = 'Filial de Emiss'#227'o'
      FieldName = 'nomefilialemissao'
      Required = True
      Size = 40
    end
    object qryConsultaDadosFiscaisNotasdadofiscal: TIntegerField
      FieldName = 'dadofiscal'
      Visible = False
      DisplayFormat = '0'
    end
    object qryConsultaDadosFiscaisNotascontrato: TStringField
      DisplayLabel = 'Contrato'
      FieldName = 'contrato'
    end
    object qryConsultaDadosFiscaisNotasvendedor: TIntegerField
      FieldName = 'vendedor'
      Visible = False
      DisplayFormat = '0'
    end
    object qryConsultaDadosFiscaisNotascliente: TIntegerField
      FieldName = 'cliente'
      Visible = False
      DisplayFormat = '0'
    end
    object qryConsultaDadosFiscaisNotasmontagemfilial: TIntegerField
      FieldName = 'montagemfilial'
      Visible = False
      DisplayFormat = '0'
    end
    object qryConsultaDadosFiscaisNotasmaquina: TIntegerField
      FieldName = 'maquina'
      Visible = False
      DisplayFormat = '0'
    end
    object qryConsultaDadosFiscaisNotasintervensao: TIntegerField
      FieldName = 'intervensao'
      Visible = False
      DisplayFormat = '0'
    end
    object qryConsultaDadosFiscaisNotascupomfiscal: TIntegerField
      FieldName = 'cupomfiscal'
      Visible = False
      DisplayFormat = '0'
    end
  end
  object spcRequisicoesProximoCodigo: TtecQuery
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
      'SELECT requisicoes_proximonumero() as numero')
    RequestLive = False
    Left = 598
    Top = 67
    object spcRequisicoesProximoCodigonumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
  end
  object qryConsultaRequisicoes: TtecQuery
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
      'select r.numero,'
      '       r.abertura,'
      '       r.tipomontador,'
      '       (SELECT coalesce(vf.razao,vf.nome)'
      '        FROM vfornecedores vf'
      '        WHERE vf.codigo = r.cliente'
      '          AND vf.tipo = r.tipocliente) as nomecliente,'
      '       r.tipocliente,'
      '       cast(coalesce((case when (select count(*)'
      '                                 from requisicoesitens ri'
      '                                 where ri.requisicao=r.numero'
      
        '                                   and ri.datamontagem is not nu' +
        'll)=0 then '#39'Aberto'#39
      '                           else (case when (select count(*)'
      
        '                                            from requisicoesiten' +
        's ri'
      
        '                                            where ri.requisicao=' +
        'r.numero'
      
        '                                              and ri.datamontage' +
        'm is null)=0 then '#39'Fechado'#39
      '                                      else '#39'Parcial'#39
      '                                 end)'
      '                      end),'#39'Aberta'#39') as varchar) as situacao,'
      '       cast(coalesce((case when (select count(*)'
      '                                 from requisicoesitens ri'
      '                                 where ri.requisicao=r.numero'
      
        '                                   and ri.datapagto is not null)' +
        '=0 then '#39'Aberto'#39
      '                           else (case when (select count(*)'
      
        '                                            from requisicoesiten' +
        's ri'
      
        '                                            where ri.requisicao=' +
        'r.numero'
      
        '                                              and ri.datapagto i' +
        's null)=0 then '#39'Fechado'#39
      '                                      else '#39'Parcial'#39
      '                                 end)'
      
        '                      end),'#39'Aberta'#39') as varchar) as situacaopagt' +
        'o'
      ''
      'from requisicoes r'
      'order by r.numero')
    RequestLive = False
    Left = 424
    Top = 8
    object qryConsultaRequisicoesnumero: TIntegerField
      DisplayLabel = 'Requisi'#231#227'o'
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryConsultaRequisicoesnomecliente: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'nomecliente'
      Size = 40
    end
    object qryConsultaRequisicoesabertura: TDateField
      Alignment = taCenter
      DisplayLabel = 'Abertura'
      FieldName = 'abertura'
      EditMask = '99/99/9999;1; '
    end
    object qryConsultaRequisicoessituacao: TStringField
      DisplayLabel = 'Sit. Montagem'
      DisplayWidth = 20
      FieldName = 'situacao'
      Size = 15
    end
    object qryConsultaRequisicoessituacaopagto: TStringField
      DisplayLabel = 'Sit. Pagamento'
      FieldName = 'situacaopagto'
      Size = 15
    end
  end
  object qryProdutosDadosFiscais: TtecQuery
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
      'Select'
      '          pdf.quantidade,'
      '          pdf.produto,'
      '          pdf.filial,'
      '          p.descricao as descricaoproduto,'
      '          pdf.precovenda'
      
        'from produtosdadosfiscais pdf, dadosfiscais df, produtoscontrato' +
        's pc, produtos p'
      'where pdf.dadofiscal=df.numero and'
      '         df.contrato=pc.contrato and'
      '         pdf.produto=pc.produto and'
      '         pdf.filial=pc.filial and'
      '         pdf.produto=p.codigo and'
      '         pdf.dadofiscal=:dadofiscal and pc.montagem='#39'S'#39
      ''
      '/* where calculo valor pagto se tipo percentual  */')
    RequestLive = False
    Left = 592
    Top = 5
    ParamData = <
      item
        DataType = ftInteger
        Name = 'dadofiscal'
        ParamType = ptUnknown
      end>
    object qryProdutosDadosFiscaisquantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
    end
    object qryProdutosDadosFiscaisproduto: TLargeintField
      FieldName = 'produto'
      Required = True
    end
    object qryProdutosDadosFiscaisfilial: TIntegerField
      FieldName = 'filial'
    end
    object qryProdutosDadosFiscaisdescricaoproduto: TStringField
      DisplayWidth = 50
      FieldName = 'descricaoproduto'
      Required = True
      Size = 100
    end
    object qryProdutosDadosFiscaisprecovenda: TFloatField
      FieldName = 'precovenda'
      Required = True
    end
  end
  object qryProcuraProdutos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnCalcFields = qryProcuraProdutosCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'Produtos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Montagem'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select p.descricao,'
      
        '         (select gr.descricao from grades gr where gr.codigo = c' +
        '.grade1) as linha,'
      
        '         (select gr.descricao from grades gr where gr.codigo = c' +
        '.grade2) as coluna,    '
      '         p.valorgrade1,'
      '         p.valorgrade2, '
      '         p.codigo,'
      '         e.filial,'
      '         estoques_preco(p.codigo, e.filial) as preco'
      
        'from ((produtos p join (estoques e join filiais f on e.filial=f.' +
        'codigo)'
      
        '                                                on p.codigo=e.pr' +
        'oduto)'
      
        '                        join caracteristicas c on p.caracteristi' +
        'ca=c.codigo)                     '
      'where ((p.inativo is null ) or (p.inativo>current_date))'
      '         and p.codigo = :codigo'
      '%Produtos'
      '%Montagem')
    RequestLive = False
    Left = 72
    Top = 549
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraProdutosdescricao: TStringField
      DisplayWidth = 50
      FieldName = 'descricao'
      Size = 100
    end
    object qryProcuraProdutoscodigo: TLargeintField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryProcuraProdutosfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryProcuraProdutospreco: TFloatField
      FieldName = 'preco'
      DisplayFormat = '0.00'
    end
    object qryProcuraProdutoslinha: TStringField
      FieldName = 'linha'
      Size = 50
    end
    object qryProcuraProdutoscoluna: TStringField
      FieldName = 'coluna'
      Size = 50
    end
    object qryProcuraProdutosvalorgrade1: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade1'
      Size = 30
    end
    object qryProcuraProdutosvalorgrade2: TStringField
      DisplayWidth = 10
      FieldName = 'valorgrade2'
      Size = 30
    end
    object qryProcuraProdutosdescricaolc: TStringField
      FieldKind = fkCalculated
      FieldName = 'descricaolc'
      Size = 62
      Calculated = True
    end
  end
  object dsrProcuraProdutos: TtecDataSource
    DataSet = qryProcuraProdutos
    Left = 272
    Top = 550
  end
  object qryProcuraTabeladeMontagem: TtecQuery
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
      'select tm.codigo,'
      '         tm.descricao,'
      '         tm.valorloja,'
      '         tm.valordentro,'
      '         tm.valorfora,'
      '         tm.tipovalor'
      'from tabelademontagens tm'
      'where codigo=:codigo')
    RequestLive = False
    Left = 624
    Top = 263
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryProcuraTabeladeMontagemcodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
    object qryProcuraTabeladeMontagemdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
    object qryProcuraTabeladeMontagemvalorloja: TFloatField
      FieldName = 'valorloja'
    end
    object qryProcuraTabeladeMontagemvalordentro: TFloatField
      FieldName = 'valordentro'
    end
    object qryProcuraTabeladeMontagemvalorfora: TFloatField
      FieldName = 'valorfora'
    end
    object qryProcuraTabeladeMontagemtipovalor: TStringField
      FieldName = 'tipovalor'
      Size = 1
    end
  end
  object dsrProcuraTabeladeMontagem: TtecDataSource
    DataSet = qryProcuraTabeladeMontagem
    Left = 624
    Top = 320
  end
  object qryConsultaProdutos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryConsultaProdutosAfterOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select p.descricao, p.valorgrade1, p.valorgrade2,'
      '          p.codigo,'
      '          e.filial,'
      '          f.nome as nomefilial '
      
        'from ((produtos p join (estoques e join filiais f on e.filial=f.' +
        'codigo)'
      
        '                                                on p.codigo=e.pr' +
        'oduto)'
      
        '                        join caracteristicas c on p.caracteristi' +
        'ca=c.codigo)                     '
      'where ((p.inativo is null ) or (p.inativo>current_date))'
      '/*        Preenchido em RunTime      */'
      ''
      ''
      ''
      ''
      ''
      '/* Preenchido em runtime */'
      
        '/* Where produtos para inclusao com campo marcado para montagem ' +
        '*/'
      
        'order by UPPER(TO_ASCII(p.descricao,'#39'LATIN1'#39')), p.valorgrade1, p' +
        '.valorgrade2')
    RequestLive = False
    Left = 440
    Top = 557
    object qryConsultaProdutosdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 50
      FieldName = 'descricao'
      Size = 100
    end
    object qryConsultaProdutoscodigo: TLargeintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryConsultaProdutosfilial: TIntegerField
      DisplayLabel = 'Filial'
      FieldName = 'filial'
      Visible = False
      DisplayFormat = '0'
    end
    object qryConsultaProdutosnomefilial: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'nomefilial'
      Size = 40
    end
    object qryConsultaProdutosvalorgrade1: TStringField
      DisplayLabel = 'Linha'
      DisplayWidth = 10
      FieldName = 'valorgrade1'
      Size = 30
    end
    object qryConsultaProdutosvalorgrade2: TStringField
      DisplayLabel = 'Coluna'
      DisplayWidth = 10
      FieldName = 'valorgrade2'
      Size = 30
    end
  end
  object qryConsultaTabeladeMontagem: TtecQuery
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
      'select tm.descricao,'
      '         tm.codigo'
      'from tabelademontagens tm'
      'order by UPPER(TO_ASCII(tm.Descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 616
    Top = 384
    object qryConsultaTabeladeMontagemdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
    object qryConsultaTabeladeMontagemcodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
  end
  object qryProcuraFiliaisEmissaoNota: TtecQuery
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
      'select codigo, nome'
      'from filiais'
      'where codigo=:codigo')
    RequestLive = False
    Left = 72
    Top = 250
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraFiliaisEmissaoNotacodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryProcuraFiliaisEmissaoNotanome: TStringField
      FieldName = 'nome'
      Size = 40
    end
  end
  object dsrProcuraFiliaisEmissaoNota: TtecDataSource
    DataSet = qryProcuraFiliaisEmissaoNota
    Left = 272
    Top = 251
  end
  object qryProcuraDadosFiscaisCupons: TtecQuery
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
      'select distinct '
      '        df.numero as dadofiscal,'
      '        df.filialemissao,'
      '        n.serie,'
      '        n.numero as NotaFiscal,             '
      '        cp.maquina,'
      '        cp.intervensao,'
      '        cp.numero as CupomFiscal,'
      '        c.numero as Contrato,'
      '        c.faturamento, '
      '        c.vendedor,'
      '        c.cliente,'
      '        c.tipocliente, '
      '        c.montagemfilial,'
      '        c.montagemobs,'
      
        '        case when c.entrua is not null then c.entrua            ' +
        'else vf.rua end as entrua,'
      
        '        case when c.entrua is not null then c.entcidade       el' +
        'se vf.cidade end as entcidade,'
      '       (select nome'
      '        from cidades d'
      
        '        where (d.estado = (case when c.entrua is not null then c' +
        '.entestado        else vf.estado end) ) and'
      
        '                 (d.codigo = (case when c.entrua is not null the' +
        'n c.entcidade        else vf.cidade end) )'
      '       ) as nomecidade,'
      
        '        case when c.entrua is not null then c.entestado        e' +
        'lse vf.estado end as entestado,'
      
        '        case when c.entrua is not null then c.entbairro         ' +
        'else vf.bairro end as entbairro,'
      '        (select nome'
      '        from bairros b'
      
        '        where (b.estado = (case when c.entrua is not null then c' +
        '.entestado        else vf.estado end) ) and'
      
        '                 (b.cidade = (case when c.entrua is not null the' +
        'n c.entcidade        else vf.cidade end) ) and'
      
        '                 (b.codigo = (case when c.entrua is not null the' +
        'n c.entbairro         else vf.bairro end) )'
      '        ) as nomebairro,'
      
        '        case when c.entrua is not null then c.entcep            ' +
        'else vf.cep end as entcep,'
      
        '        case when c.entrua is not null then c.entfoneddd      el' +
        'se vf.foneddd end as entfoneddd,'
      
        '        case when c.entrua is not null then c.entfonenumero else' +
        ' vf.fonenumero end as entfonenumero,'
      
        '        case when c.entrua is not null then c.entfoneramal    el' +
        'se vf.foneramal end as entfoneramal'
      ''
      
        'from ((((((dadosfiscais df join (produtosdadosfiscais pdf join p' +
        'rodutos p on pdf.produto=p.codigo) on df.numero=pdf.dadofiscal)'
      
        '                           join ((contratos c join produtoscontr' +
        'atos pc on c.numero=pc.contrato) join filiais fc on c.filialvend' +
        'a=fc.codigo) on df.contrato=c.numero)'
      
        '                           join vfornecedores vf on df.cliente=v' +
        'f.codigo and df.tipocliente=vf.tipo)'
      
        '                                left join notas n on df.numero=n' +
        '.dadofiscal)'
      
        '                           join cupons cp on df.numero=cp.dadofi' +
        'scal)'
      
        '                           join filiais f on df.filialemissao=f.' +
        'codigo)'
      ''
      
        'where  (pdf.produto=pc.produto and pdf.filial=pc.filial and pc.m' +
        'ontagem='#39'S'#39') and c.montagemfilial is not null'
      
        '        and (pdf.produto,pdf.filial) not in (select ri.produto,r' +
        'i.filial from requisicoesitens ri where ri.requisicao in (select' +
        ' r.numero from requisicoes r where r.dadofiscal=pdf.dadofiscal))'
      '        and df.situacao<>'#39'C'#39
      '        and df.filialemissao=:filialemissao'
      '        and cp.maquina=:maquina'
      '        and cp.intervensao=:intervensao'
      '        and cp.numero=:numerocupom'
      '')
    RequestLive = False
    Left = 75
    Top = 153
    ParamData = <
      item
        DataType = ftString
        Name = 'filialemissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'maquina'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'intervensao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'numerocupom'
        ParamType = ptUnknown
      end>
    object qryProcuraDadosFiscaisCuponsdadofiscal: TIntegerField
      FieldName = 'dadofiscal'
      DisplayFormat = '0'
    end
    object qryProcuraDadosFiscaisCuponsvendedor: TIntegerField
      FieldName = 'vendedor'
      DisplayFormat = '0'
    end
    object qryProcuraDadosFiscaisCuponscliente: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object qryProcuraDadosFiscaisCuponsmontagemfilial: TIntegerField
      FieldName = 'montagemfilial'
      DisplayFormat = '0'
    end
    object qryProcuraDadosFiscaisCuponsentrua: TStringField
      FieldName = 'entrua'
      Size = 50
    end
    object qryProcuraDadosFiscaisCuponsentcidade: TIntegerField
      FieldName = 'entcidade'
      DisplayFormat = '0'
    end
    object qryProcuraDadosFiscaisCuponsentestado: TStringField
      FieldName = 'entestado'
      Size = 50
    end
    object qryProcuraDadosFiscaisCuponsentbairro: TIntegerField
      FieldName = 'entbairro'
      DisplayFormat = '0'
    end
    object qryProcuraDadosFiscaisCuponsentcep: TIntegerField
      FieldName = 'entcep'
      DisplayFormat = '0'
    end
    object qryProcuraDadosFiscaisCuponsentfoneddd: TIntegerField
      FieldName = 'entfoneddd'
      DisplayFormat = '0'
    end
    object qryProcuraDadosFiscaisCuponsentfonenumero: TIntegerField
      FieldName = 'entfonenumero'
      DisplayFormat = '0'
    end
    object qryProcuraDadosFiscaisCuponsmaquina: TIntegerField
      FieldName = 'maquina'
      Required = True
      DisplayFormat = '0'
    end
    object qryProcuraDadosFiscaisCuponsintervensao: TIntegerField
      FieldName = 'intervensao'
      Required = True
      DisplayFormat = '0'
    end
    object qryProcuraDadosFiscaisCuponscupomfiscal: TIntegerField
      FieldName = 'cupomfiscal'
      Required = True
      DisplayFormat = '0'
    end
    object qryProcuraDadosFiscaisCuponscontrato: TStringField
      FieldName = 'contrato'
    end
    object qryProcuraDadosFiscaisCuponsfilialemissao: TIntegerField
      FieldName = 'filialemissao'
      DisplayFormat = '0'
    end
    object qryProcuraDadosFiscaisCuponsserie: TStringField
      FieldName = 'serie'
      Size = 3
    end
    object qryProcuraDadosFiscaisCuponsnotafiscal: TIntegerField
      FieldName = 'notafiscal'
      DisplayFormat = '0'
    end
    object qryProcuraDadosFiscaisCuponsmontagemobs: TStringField
      FieldName = 'montagemobs'
      Size = 100
    end
    object qryProcuraDadosFiscaisCuponsentfoneramal: TStringField
      FieldName = 'entfoneramal'
      Size = 50
    end
    object qryProcuraDadosFiscaisCuponsnomecidade: TStringField
      FieldName = 'nomecidade'
      Size = 50
    end
    object qryProcuraDadosFiscaisCuponsnomebairro: TStringField
      FieldName = 'nomebairro'
      Size = 50
    end
    object qryProcuraDadosFiscaisCuponstipocliente: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
    object qryProcuraDadosFiscaisCuponsfaturamento: TDateField
      Alignment = taCenter
      FieldName = 'faturamento'
      EditMask = '99/99/9999;1; '
    end
  end
  object dsrProcuraDadosFiscaisCupons: TtecDataSource
    DataSet = qryProcuraDadosFiscaisCupons
    Left = 272
    Top = 154
  end
  object qryConsultaDadosFiscaisCupons: TtecQuery
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
      'select distinct'
      '         cp.numero,'
      '         cp.maquina,'
      '         cp.intervensao,'
      '         df.filialemissao,'
      '         f.nome as nomefilialemissao, '
      '         df.numero as dadofiscal,'
      '        c.numero as contrato,'
      '        c.vendedor,'
      '        c.cliente,'
      '        c.montagemfilial,'
      '        n.serie,'
      '        n.numero as NotaFiscal'
      ''
      
        'from ((((((dadosfiscais df join (produtosdadosfiscais pdf join p' +
        'rodutos p on pdf.produto=p.codigo) on df.numero=pdf.dadofiscal)'
      
        '                           join ((contratos c join produtoscontr' +
        'atos pc on c.numero=pc.contrato) join filiais fc on c.filialvend' +
        'a=fc.codigo) on df.contrato=c.numero)'
      
        '                           join vfornecedores vf on df.cliente=v' +
        'f.codigo and df.tipocliente=vf.tipo)'
      
        '                           left join notas n on df.numero=n.dado' +
        'fiscal)'
      
        '                                join cupons cp on df.numero=cp.d' +
        'adofiscal)'
      
        '                           join filiais f on df.filialemissao=f.' +
        'codigo)'
      ''
      
        'where  (pdf.produto=pc.produto and pdf.filial=pc.filial and pc.m' +
        'ontagem='#39'S'#39') and c.montagemfilial is not null'
      
        '        and (pdf.produto,pdf.filial) not in (select ri.produto,r' +
        'i.filial from requisicoesitens ri where ri.requisicao in (select' +
        ' r.numero from requisicoes r where r.dadofiscal=pdf.dadofiscal))'
      '        and df.situacao<>'#39'C'#39
      '/* Where Filiais */'
      '/* Where ECF */'
      '/* Where Intervencao */'
      ''
      'order by cp.numero')
    RequestLive = False
    Left = 435
    Top = 159
    object qryConsultaDadosFiscaisCuponsnumero: TIntegerField
      DisplayLabel = 'Cupom'
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryConsultaDadosFiscaisCuponsmaquina: TIntegerField
      DisplayLabel = 'ECF'
      FieldName = 'maquina'
      DisplayFormat = '0'
    end
    object qryConsultaDadosFiscaisCuponsintervensao: TIntegerField
      DisplayLabel = 'Interv.'
      FieldName = 'intervensao'
      DisplayFormat = '0'
    end
    object qryConsultaDadosFiscaisCuponsfilialemissao: TIntegerField
      DisplayLabel = 'Filial'
      FieldName = 'filialemissao'
      Visible = False
      DisplayFormat = '0'
    end
    object qryConsultaDadosFiscaisCuponsnomefilialemissao: TStringField
      DisplayLabel = 'Filial de Emiss'#227'o'
      FieldName = 'nomefilialemissao'
      Size = 40
    end
    object qryConsultaDadosFiscaisCuponsdadofiscal: TIntegerField
      FieldName = 'dadofiscal'
      Visible = False
      DisplayFormat = '0'
    end
    object qryConsultaDadosFiscaisCuponscontrato: TStringField
      DisplayLabel = 'Contrato'
      FieldName = 'contrato'
    end
    object qryConsultaDadosFiscaisCuponsvendedor: TIntegerField
      FieldName = 'vendedor'
      Visible = False
      DisplayFormat = '0'
    end
    object qryConsultaDadosFiscaisCuponscliente: TIntegerField
      FieldName = 'cliente'
      Visible = False
      DisplayFormat = '0'
    end
    object qryConsultaDadosFiscaisCuponsmontagemfilial: TIntegerField
      FieldName = 'montagemfilial'
      Visible = False
      DisplayFormat = '0'
    end
    object qryConsultaDadosFiscaisCuponsserie: TStringField
      FieldName = 'serie'
      Visible = False
      Size = 3
    end
    object qryConsultaDadosFiscaisCuponsnotafiscal: TIntegerField
      FieldName = 'notafiscal'
      Visible = False
      DisplayFormat = '0'
    end
  end
  object qryProcuraSeriesFiliais: TtecQuery
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
      'select sf.filial,'
      '         sf.valor'
      'from seriesfiliais sf'
      'where sf.valor=:valor'
      '/* Where Filial emissao */')
    RequestLive = False
    Left = 72
    Top = 355
    ParamData = <
      item
        DataType = ftString
        Name = 'valor'
        ParamType = ptUnknown
      end>
    object qryProcuraSeriesFiliaisfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryProcuraSeriesFiliaisvalor: TStringField
      FieldName = 'valor'
      Size = 3
    end
  end
  object dsrProcuraSeriesFiliais: TtecDataSource
    DataSet = qryProcuraSeriesFiliais
    Left = 272
    Top = 356
  end
  object qryConsultaSeriesFiliais: TtecQuery
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
      'select distinct '
      '  sf.valor'
      'from seriesfiliais sf'
      ''
      '/* Where Filiais */'
      'order by sf.valor'
      '')
    RequestLive = False
    Left = 440
    Top = 361
    object qryConsultaSeriesFiliaisvalor: TStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'valor'
      Size = 3
    end
  end
  object qryConsultaFilialProduto: TtecQuery
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
      'select f.nome,'
      '       f.codigo'
      'from filiais f'
      'where f.codigo in (select e.filial'
      
        '                   from estoques e, produtos p, caracteristicas ' +
        'c'
      '                   where (e.produto = :produto) and'
      '                             (e.produto = p.codigo) and '
      '                             (p.caracteristica = c.codigo)'
      ''
      ''
      ''
      ''
      ''
      ''
      '/* preenchido em runtime */'
      '/* Where produtos para inclusao com campo montagem sendo S */'
      '                  )'
      'order by UPPER(TO_ASCII(f.nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 440
    Top = 602
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qryConsultaFilialProdutonome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaFilialProdutocodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
  object qryProcuraFiliaisEmissaoCupom: TtecQuery
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
      'select codigo, nome'
      'from filiais'
      'where codigo=:codigo')
    RequestLive = False
    Left = 72
    Top = 298
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object IntegerField1: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object StringField1: TStringField
      FieldName = 'nome'
      Size = 40
    end
  end
  object dsrProcuraFiliaisEmissaoCupom: TtecDataSource
    DataSet = qryProcuraFiliaisEmissaoCupom
    Left = 272
    Top = 299
  end
  object qryProcuraFilialProduto: TtecQuery
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
      'select f.codigo,'
      '         f.nome'
      'from filiais f'
      'where (f.codigo = :codigo) and'
      '          (f.codigo in (select e.filial'
      
        '                            from estoques e, produtos p, caracte' +
        'risticas c'
      '                            where (e.produto = :produto) and'
      '                                      (e.produto = p.codigo) and'
      
        '                                      (p.caracteristica=c.codigo' +
        ')                 '
      ''
      ''
      ''
      ''
      ''
      '/* Where nao inclusao produto ja cadastrado */'
      '/* Where produtos para inclusao com campo montagem sendo S */'
      '      )            )')
    RequestLive = False
    Left = 72
    Top = 600
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qryProcuraFilialProdutocodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryProcuraFilialProdutonome: TStringField
      FieldName = 'nome'
      Size = 40
    end
  end
  object dsrProcuraFilialProduto: TtecDataSource
    DataSet = qryProcuraFilialProduto
    Left = 272
    Top = 600
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
      'Select Nome,'
      '       pessoanumero,'
      '       Codigo,'
      '       tipo,'
      '       cast(case when tipo = '#39'F'#39' then '#39'Fornecedor'#39
      '                       when tipo = '#39'C'#39' then '#39'Cliente'#39
      '               end as varchar) as tipoorig'
      'From   vfornecedores'
      ''
      '/* editado em run time */'
      'Order By UPPER(TO_ASCII(nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 438
    Top = 456
    object qryConsultaClientesnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaClientespessoanumero: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'pessoanumero'
      Size = 14
    end
    object qryConsultaClientescodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
    object qryConsultaClientestipo: TStringField
      FieldName = 'tipo'
      Visible = False
      Size = 1
    end
    object qryConsultaClientestipoorig: TStringField
      DisplayLabel = 'Tipo Cliente'
      FieldName = 'tipoorig'
      Size = 10
    end
  end
  object frpRequisicao: TfrReport
    Dataset = fdsRequisicoesItens
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnGetValue = frpRequisicaoGetValue
    OnBeforePrint = frpRequisicaoBeforePrint
    Left = 632
    Top = 144
    ReportForm = {
      190000009A64000019FFFF00000A0050444643726561746F7200FFFFFFFFFF02
      0000006F080000EA0A0000000000000000000000000000000000000000040000
      0000FFFF000000000000000000000000030400466F726D00FEFFFFFFDC000000
      780000007C0100002C010000040000000200D10000000900666276526F646170
      6500020100000000BD0300000B0300000C000000300003000100000000000000
      0000FFFFFF1F00000000000000000000000000FFFF0000000000020000000100
      00000000000001000000C8000000140000000100000000000002003C0100000B
      005061676548656164657231000201000000001D0000000B0300002F00000030
      00020001000000000000000000FFFFFF1F00000000000000000000000000FFFF
      000000000002000000010000000000000001000000C800000014000000010000
      000000000200BA0100000B004D61737465724461746132000201000000000902
      00000B0300000C0000003000050001000000000000000000FFFFFF1F00000000
      130066647352657175697369636F65734974656E7300000000000000FFFF0000
      00000002000000010000000000000001000000C80000000B0000000100000000
      0000020068020000120043616265E7616C686F446520477275706F3100020100
      0000006B0000000B030000580100003300100001000000000000000000FFFFFF
      1F0000000019005B71727952657175697369636F65732E226E756D65726F225D
      0000000003000500626567696E0D130020636F6E74696E75613A3D66616C7365
      3B20200D0300656E6400FFFF0000000000020000000100000000000000010000
      00C800000014000000010000000000000200E80300000F00526F646170E94465
      20477275706F3100020100000000300200000B03000006000000300011000100
      0000000000000000FFFFFF1F0000000000000000000008000500626567696E0D
      25004D454D4F4954454D2E4845494748543A3D504147454845494748542D4355
      52592D3136383B0D27004D454D4F46494C49414C2E4845494748543A3D504147
      454845494748542D435552592D3136383B0D31004D454D4F4445534352494341
      4F50524F4455544F2E4845494748543A3D504147454845494748542D43555259
      2D3136383B0D27004D454D4F5154444144452E4845494748543A3D5041474548
      45494748542D435552592D3136383B0D32004D454D4F4F42534552564143414F
      50524F4455544F2E4845494748543A3D504147454845494748542D435552592D
      3136383B0D1C004845494748543A3D504147454845494748542D435552592D31
      36383B0D0300656E6400FFFF0000000000020000000100000000000000010000
      00C800000014000000010000000000000200800400000F00526F646170E94465
      20477275706F3200020100000000080300000B030000A8000000300011000100
      0000000000000000FFFFFF1F0000000000000000000003000500626567696E0D
      1900637572793A3D706167656865696768742D68656967687420200D0300656E
      6400FFFF000000000002000000010000000000000001000000C8000000140000
      000100000000000002000B050000120043616265E7616C686F44652047727570
      6F3200020100000000DC0100000B030000140000007000100001000000000000
      000000FFFFFF1F0000000019005B71727952657175697369636F65732E226E75
      6D65726F225D00000000000000FFFF0000000000020000000100000000000000
      01000000C8000000140000000100000000000000008C05000006004D656D6F31
      3500020089000000FD000000530200001900000042000F00F401000000000000
      0000FFFFFF1F2C020000000000000000000000FFFF0000000000020000000100
      000000090068656C766574696361000800000000000000000000000000010002
      0000000000FFFFFF00000000020000000000000000000C06000005004D656D6F
      390002001400000008030000C8020000A600000043000F00F401000000000000
      0000FFFFFF1F2C020000000000000000000000FFFF0000000000020000000100
      000000090068656C766574696361000800000004000000000002000000010002
      0000000000FFFFFF00000000020000000000000000008C06000005004D656D6F
      3700020089000000C3000000530200003A00000042000F00F401000000000000
      0000FFFFFF1F2C020000000000000000000000FFFF0000000000020000000100
      000000090068656C766574696361000800000000000000000000000000010002
      0000000000FFFFFF00000000020000000000000000000C07000005004D656D6F
      360002008900000089000000530200003A00000042000F00F401000000000000
      0000FFFFFF1F2C020000000000000000000000FFFF0000000000020000000100
      000000090068656C76657469636100080000000000000000000A000000010002
      0000000000FFFFFF0000000002000000000000000100311F000007006670764C
      6F676F000200160000001D000000730000002700000005000000F40100000000
      00000000FFFFFF1F2C020000000000000000000000FFFF000000000002000000
      01000000060100311F0000424DCE170000000000003604000028000000830000
      0026000000010008000000000098130000120B0000120B000000010000000100
      0000000000E8E5A800AA9E000099990000ADADAD003A3C4100A3970000BFB737
      00D8D48600FBFAF000A5A5A5001E1D1C00D8D9DA0054575A00D6D6D500E7E8F2
      0012161B00B6AD1900CBC55B008C8D9200BEC0C500E1E2E40085878A005E6063
      00494C4F00090D12002C2E3300DEDB98007D7F8100EFEDCB00B9BABB00AEA400
      007C7B7B00C5BE440066666600D1CC6F00CDC9810048484600F7F6E600AFA508
      0004080D00F9F8ED00B8AF2700DBD68C00999999001B1A1900C6BF5100131312
      003B3A3A00FFFFFF00EAE8BE00CCCCCC0023262A00E2DEA400F1EFD600B0B1B3
      00D3CD7500B1A81000CCCC660072727200535252004342420001060A00ECE9C3
      008C8C8B00F5F4DF004A4A4A0057575600B6AC1F00282B3000C7C05C0061615F
      00F7F7F70088888700DDD89300E3E0A600FDFCF70021242900070A1000BDB531
      00C5BE4A00E3E3E200A69C000099999900BABAB900DEDEDE00525458002A2928
      00D9D58A005F5E5D00C7C595001B1E2300E8E5B60000000700B5AB1300D5D07B
      00C6C6C500B2A80B0021202000B9B12400504F4E00666666006B6D7000B5B5BD
      0084848400E0DC9E00BCB42C00F7EFD6005B5B5A00EFEFEF0087898B00DEDEE6
      003E3D3C0014181E00C8C25300CCC55F00A8A9AC00BDBDBC00E5E1AC00757679
      00181B2000E6E6E6000E1117000810190033333300929191002D2C2B00B5B5B4
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0031313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131543D42470E313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131523131313131486D3131316D6D4C3131316D6D313131313131313131
      316D4831313131313131316D6D3131316D040A6C6C313131313131486D6D4C31
      31313131316D6D4C313131313131313131313131486D6D6D313131313131486D
      6D48313131316D483131316D6D3131313131313131313131316D6D6D3131486D
      6D6D31313131313152313131317F7E6631554225256031603D42647931420C31
      3B7D316D6C3D70403131662C316D593D7068313133646C702531484255312C70
      643059313131310C2525420E31477431420E4825793131315442433D474C4C64
      0E3120423C300A3131207E2C317F70254748484251512531603C316D59253C62
      0A312C25433068313131313152313131316C2031315959313131317C7D4C4C31
      487C0E3159683177424C51347531434031203D487957543130494C7F3D31487C
      0C310B37317F70313131313C6631313131642C317C33487E5131313131317960
      2F55317C3331316D793B7031487E14314857043131316D7C55557E311E303154
      2D4C314340313148790A0B4C313131315231313131477D313125306C64334C57
      79313131487C0E31224931422C31314340316C7D313C7D3131594931570C3154
      3D31487C0C3168705930253131313170706C3C0E313C0A313033317C51313131
      0C702570474C4C3033312C7C64300A3148300E31796243432248483051517C31
      603D316D6464590B2C31547C42301C313131313152313131314749313166420C
      5548313D2C484831487C0E48302C311C4248516275316C7D31493D4879627F31
      256848373031487C0E3131550E207031313131473C0C554831642C4C7E330C62
      793131316830796D3131487C3331577D6D6D313148303331487C49555131487C
      0C0C7E4C2C703131480C0E7C2C313C476D6D31313131313152313131040B7E20
      316D473C6C33310E3D3C6C7931254264646D31486C42706831316C7D31484742
      702031310E3D433D6C31484355314043473D0A31313131796C3C6C0E31667059
      7E3C3D20313131310E256C6C7731316C0E312C3D47430431772F3D0A31334243
      66484825643C7E6C7C74316D225943425531543D59437D313131313152313131
      6D643B6D3131316D514831313179514C316D51793131313131796D3131313C40
      313131796D313131313179794831317F6D316D15154831313131313131795148
      314879516D796D3131313131313151517931317F6D31316D51516D3151577F6D
      313131797931316D51516D5148313131515151313131314851516D3131313131
      5231313131400431313131313131313131313131313131313131313131313131
      31316804313131313131313131313131313148660F3131313131313131313131
      3131313131313131313131313131313131313131313131220E31313131313131
      3166553131313131313131313131313131313131313131313131313131313131
      3131313152313131313131313131313131313131313131313131313131313131
      31313131313131313131313131313131313131313131315C46121212463F3131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131523131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131315F06020202
      061B313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131523131313131310E40173C18183D6E3131313131
      310C2C666C3C181818181805683131313131316D3768220D0516313131313108
      021F1F1F5235313131313172070707070707070707070707070750732B363131
      3131313131313131362B73212112081D31313131313131313123505050504B31
      31313131313131313F08122E505050085231313131312C103E191919195D1731
      3131317966713E4E191919191919195D0D31313131312C342828191900173131
      31313108021F1F1F523531313131311152020202020202020202020202020202
      022776313131313131313F501F02020202020202075C313131313131316A0602
      02065F313131313131314C120202020202020221523131313175287A78787878
      784E223131310E1A3E10787871717171717171281731313131773E7A71717171
      2822313131313108021F1F1F5235313131313144021F1F1F1F1F1F1F1F1F1F1F
      1F1F1F1F1F1F1F1D31313131310802021F1F1F1F1F1F1F1F0202233131313131
      3107021F1F0208313131313131313A521F1F1F1F1F1F1F5052313131310D4E78
      78787A7A71282231316D7C4E7878784E4E7A717171717128173131312C3E7171
      717119195D22313131313108021F1F1F5269314C4C4C4C631F1F1F1F1F1F1F1F
      1F1F1F1F1F1F1F1F1F1F52503131313138521F1F1F0202020202021F1F1F5212
      313131313107021F1F0208313131313131361F1F1F1F1F020202022152313131
      6D457A78787A3D370E0E5131313B3E7878787A2274140E0E0E0E0E0E15313115
      787A787871190D0A145A2A6A6A6A2A5F36363636365044111111113226262626
      262626262626262626264A1F1F1F1F612631311B521F1F1F02443A0808236302
      1F1F1F525F3131313107021F1F02083131313131311B021F1F1F1F6A2B353532
      523131310E71717171710C313131313115781078784E68313131313131313131
      3131311C287878787A2C3131310106020202025F313131313150520202020236
      31313131313131313131313131313144021F1F1F32312639021F1F1F584C3131
      3131311B27021F1F1F3631313107021F1F020831313131313123021F1F1F1109
      3131313152313131337A717171454831313131312C28787810344C3131313131
      31313131313131057A78784E663131313135021F1F1F025F313131313150021F
      1F1F1F3631313131313131313131313131314C5E021F1F0276315F521F1F1F4B
      313131313131313132271F1F527331313107021F1F020831313131313112021F
      1F0272313131313152313131601978787A7C4C3131313131662878781045166E
      6E6E6E6E6E6E6E1C0431555B1078717A603131313135021F1F1F025F31313131
      3150021F1F1F1F36313131313131314C0909090909363A021F1F1F1F3F314F02
      1F02723131313131313131313123021F1F1109313107021F1F02083131313131
      312E021F1F0273313131313152313131601978787A054C313131313156197878
      7871282828282828282828005631337A717171346D313131313552020202025F
      31313131312106020202023631313131762E635E61616161611F1F1F1F1F1F11
      4C26611F1F0276313131313131313131311D1F1F1F1F1D313107021F1F020831
      31313131312E021F1F023A313131313152313131601978787A054C3131313131
      1819787878787878787878787878784E1731141978787A454831313131764444
      444444241551515151464F4F4F4F4F413131313A0202021F1F1F1F1F1F1F1F1F
      1F1F521B311D1F1F1F1F363131313131313131313126391F1F1F5C313107021F
      1F02083131313131312E021F1F023A313131313152313131601978787A054C31
      313131315619787878787878787878787878784E1731337A717171346D313131
      313109090909097D713434347A37313131313131313158521F1F1F1F1F020202
      0202020202275831311D1F1F1F1F1D3131313131313131313126391F1F1F5C31
      3107021F1F02083131313131312E021F1F023A31313131315231313160197878
      7A054C3131313131224E787878784E28282828282828280056310C787171715B
      0C31313131313131313131133E1010105D74313131313131312939021F1F1F1F
      3911636363636A50083631313126611F1F024B313131313131313131313F021F
      1F1F36313107021F1F02083131313131312E021F1F023A313131313152313131
      601978787A054C313131313116287878101A2C2C2C2C2C2C2C2C2C7D1E316D1A
      7A7878197F31313131313131313131134E78787828743131313131313176021F
      1F1F1F23263131313131313131313131313107021F0221313131313131313131
      3173021F1F444C313107021F1F02083131313131312E021F1F023A3131313131
      52313131601978787A054C31313131317F197171713448313131313131313131
      313131561978784E6631313131313131313131134E7878782874313131313131
      312B521F1F1F6129313131313131313131313131313158521F1F024A31313131
      313131317602021F522331313107021F1F02083131313131312E021F1F023A31
      3131313152313131331978787A053131313131316D347A78784E133131313131
      313131313131317D287878717104313131313131313131130019191900043131
      31313131312B521F1F1F274131313131313131313131313131310911021F1F1F
      232631313131295F1F1F1F1F612931313107021F1F022B3131313131312E021F
      1F52233131313131520E14602C7A78787A7C141414140C3131203E7878717166
      0A1E6014141414140E3131155B107878107A567D371E1E1E1E1E1E13566C6C6C
      182C75757575756D315C021F1F1F1F211B1B1B1B1B1B4A4A4A4A4A3631313176
      021F1F1F0261502323725E021F1F1F0258762B2B4A44021F1F1F504A4A4A2B1D
      312E021F1F1F074A4A4A4A5C520D7A7A7A78787878787A7A7A5D173131794519
      7878784E4E7A7A7A7A7A7A5D6C313131165D7171717119191919191919195D6E
      313131313166007A7A7A4E1431295E021F1F1F0202020202020202020202062B
      313131315802021F1F1F020202021F1F1F1F52384C395252521F1F1F1F1F0202
      02020608312E021F1F1F1F0202020221521771717878787878787171714E2231
      3131335B28717878787871717171714E1731313131173E7A7178787878787878
      78784E6E313131313166287171717A6031314A521F1F1F1F1F1F1F1F1F1F1F1F
      1F1F524A31313131316939521F1F1F1F1F1F1F1F020258310911021F1F1F1F1F
      1F1F1F1F1F1F022B312E021F1F1F1F1F1F1F1F50520D19191978787878781919
      190017313131310C0D10284E4E191919191919000D31313131317D1A4E4E4E19
      191919191919001C3131313131662878787810603131315F0202020202020202
      020202020202062B31313131313136733902020202020261721D313129615252
      521F1F1F1F1F020202020608312E021F1F1F1F0202020221527D17173C107878
      714D1717170D2C3131313131310E0A1C3B2217171717170D7D31313131313148
      757D77661717171717170D0431313131316628787878106031313131364A3A72
      72727272727272727272505C3131313131313131264B5F737338354131313131
      093A7272725E1F1F1F1F4F1212122E5C312E021F1F1F63121212125852313131
      0E1978787A053131313131313131313131313131313131313131313131313131
      31313131313131313131313131313131313131313117003E3E3E5D7531313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313107021F1F52583131313131312E021F1F02233131313131
      52313131601978787A054C313131313131313131313131313131313131313131
      313131313131313131313131313131313131313131313131317F686E6E6E6E15
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313121021F1F02073131313131312E021F1F023A31
      3131313152313131601978787A054C3131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131313173021F1F1F1F4F3A233A32312E021F
      1F023A313131313152313131601978787A054C31313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      31313131313131313131313131313131313131313169521F1F1F1F0202020608
      312E021F1F023A313131313152313131601978787A054C313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131313131313131313131313131313131313131313131310963521F1F1F1F
      1F1F024A312E021F1F023A313131313152313131601971717A054C3131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131314150
      611F1F1F1F1F024A3150021F1F023A3131313131523131310C0D17176C774C31
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      3131313131313131313131313131313131313131313131313131313131313131
      313131315C3872727272725C31082E2E2E2E1B3131313131520000BE1F000006
      00666D765275610002008B0000001D000000C20000000A00000041000000F401
      0000000000000000FFFFFF1F2C02000000000001000A005275613A205B527561
      5D00000000FFFF0000000000020000000100000006090068656C766574696361
      0007000000000000000000100000000100020000000000FFFFFF000000000200
      00000000000000004D2000000900666D764369646164650002008B0000003200
      0000C20000000A00000041000000F4010000000000000000FFFFFF1F2C020000
      000000010009005B4369646164655D2000000000FFFF00000000000200000001
      00000000090068656C7665746963610007000000000000000000100000000100
      020000000000FFFFFF0000000002000000000000000000DD2000000700666D76
      466F6E650002008B0000003D000000C20000000A00000041000000F401000000
      0000000000FFFFFF1F2C02000000000001000C00466F6E653A205B466F6E655D
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      07000000000000000000100000000100020000000000FFFFFF00000000020000
      000000000000006C2100000900666D76546974756C6F000200510100001D0000
      002A0100001200000043000000F4010000000000000000FFFFFF1F2C02000000
      0000010009005B546974756C6F5D2000000000FFFF0000000000020000000100
      000006090068656C766574696361000B00000002000000000002000000000002
      0000000000FFFFFF00000000020000000000000000000A2200000700666D7644
      617461000200820200001D0000005A0000000D00000043000000F40100000000
      00000000FFFFFF1F2C02000000000001001A0044617461203A205B4441544520
      234464642F6D6D2F797979795D00000000FFFF00000000000200000001000000
      06090068656C7665746963610008000000000000000000110000000100020000
      000000FFFFFF00000000020000000000000000009D2200000900666D76506167
      696E61000200820200002B0000004A0000000D00000043000000F40100000000
      00000000FFFFFF1F2C02000000000001000D00506167203A205B50414745235D
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      08000000000000000000100000000100020000000000FFFFFF00000000020000
      00000000000000322300000700666D76486F726100020038000000BD03000058
      0000000B00000043000000F4010000000000000000FFFFFF1F2C020000000000
      010011005B54494D4520235468683A6D6D3A73735D00000000FFFF0000000000
      020000000100000000090068656C766574696361000700000000000000000010
      0000000100020000000000FFFFFF0000000002000000000000000000DF230000
      1000666D76446573656E766F6C7665646F720002000F020000BE030000B80000
      000B00000043000000F4010000000000000000FFFFFF1F2C0200000000000100
      2000746563534F4654202D205465636E6F6C6F67696120656D2053697374656D
      617300000000FFFF0000000000020000000100000000090068656C7665746963
      610007000000000000000000110000000100020000000000FFFFFF0000000002
      0000000000000000006E2400000900666D764F75747261730002005201000031
      0000002B0100001700000043000000F4010000000000000000FFFFFF1F2C0200
      00000000010009005B4F75747261735D2000000000FFFF000000000002000000
      0100000000090068656C76657469636100070000000000000000000A00000001
      00020000000000FFFFFF0000000002000000000000000000FD2400000900666D
      7642616972726F0002008B00000027000000C20000000A00000041000000F401
      0000000000000000FFFFFF1F2C020000000000010009005B42616972726F5D20
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      07000000000000000000100000000100020000000000FFFFFF00000000020000
      000000000000008B2500000A006C626C436C69656E7465000200140000007000
      0000750000001900000042000F00F4010000000000000000FFFFFF1F2C020000
      00000001000700436C69656E746500000000FFFF000000000002000000010000
      0000090068656C76657469636100080000000000000000000A00000001000200
      00000000FFFFFF0000000002000000000000000000192600000A006C626C456E
      74726567610002001400000089000000750000003A00000042000F00F4010000
      000000000000FFFFFF1F2C02000000000001000700456E747265676100000000
      FFFF0000000000020000000100000000090068656C7665746963610008000000
      0000000000000A0000000100020000000000FFFFFF0000000002000000000000
      000000AD2600000D006C626C5265736964656E63696100020014000000C30000
      00750000003A00000042000F00F4010000000000000000FFFFFF1F2C02000000
      000001000A005265736964656E63696100000000FFFF00000000000200000001
      00000000090068656C76657469636100080000000000000000000A0000000100
      020000000000FFFFFF00000000020000000000000000003D2700000B006C626C
      54726162616C686F00020014000000FD000000750000001900000042000F00F4
      010000000000000000FFFFFF1F2C0200000000000100080054726162616C686F
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      080000000000000000000A0000000100020000000000FFFFFF00000000020000
      00000000000000D327000008006C626C4E6F7461730002001400000016010000
      750000002700000042000F00F4010000000000000000FFFFFF1F2C0200000000
      000100110046494C49414C20444520454D495353414F00000000FFFF00000000
      00020000000100000000090068656C7665746963610007000000000000000000
      000000000100020000000000FFFFFF0000000002000000000000000000632800
      000B006C626C436F6E747261746F000200140000003D01000075000000250000
      0042000F00F4010000000000000000FFFFFF1F2C02000000000001000800436F
      6E747261746F00000000FFFF0000000000020000000100000000090068656C76
      65746963610008000000000000000000020000000100020000000000FFFFFF00
      00000002000000000000000000EB28000007006C626C4E6F6D650002008B0000
      00D4FFFFFF470000001200000043000000F4010000000000000000FFFFFF1F2C
      020000000000010004004E6F6D6500000000FFFF000000000002000000010000
      0000090068656C766574696361000A0000000000000000000000000001000200
      00000000FFFFFF0000000002000000000000000000AC2900000E006D6D6F4E6F
      6D65436C69656E74650002008900000070000000D10100001900000042000F00
      F4010000000000000000FFFFFF1F2C02000000000001003600205B7172795265
      7175697369636F65732E22636C69656E7465225D205B71727950726F63757261
      436C69656E74652E226E6F6D65225D00000000FFFF0000000000020000000100
      000000090068656C766574696361000800000000000000000008000000010002
      0000000000FFFFFF0000000002000000000000000000532A000010006D6D6F43
      6F6469676F436C69656E74650002009302000070000000490000001900000042
      000F00F4010000000000000000FFFFFF1F2C02000000000001001A005B717279
      52657175697369636F65732E226E756D65726F225D2000000000FFFF00000000
      00020000000100000000090068656C766574696361000A000000020000000000
      090000000100020000000000FFFFFF0000000002000000000000000000E32A00
      0009006C626C436F6469676F0002005A02000070000000390000001900000042
      000F00F4010000000000000000FFFFFF1F2C02000000000001000A0052657175
      69736963616F00000000FFFF0000000000020000000100000000090068656C76
      657469636100080000000000000000000A0000000100020000000000FFFFFF00
      00000002000000000000000000692B000006006C626C5275610002008E000000
      8C000000340000000F00000043000000F4010000000000000000FFFFFF1F2C02
      00000000000100030052756100000000FFFF0000000000020000000100000000
      090068656C766574696361000800000000000000000000000000010002000000
      0000FFFFFF0000000002000000000000000000F52B000009006C626C43696461
      64650002008E0000009D000000340000000F00000043000000F4010000000000
      000000FFFFFF1F2C0200000000000100060043696461646500000000FFFF0000
      000000020000000100000000090068656C766574696361000800000000000000
      0000000000000100020000000000FFFFFF000000000200000000000000000081
      2C000009006C626C42616972726F0002008E000000AF000000350000000F0000
      0043000000F4010000000000000000FFFFFF1F2C020000000000010006004261
      6972726F00000000FFFF0000000000020000000100000000090068656C766574
      6963610008000000000000000000000000000100020000000000FFFFFF000000
      00020000000000000000000E2D00000D006C626C436570456E74726567610002
      00F40100009D000000280000000F00000043000000F4010000000000000000FF
      FFFF1F2C0200000000000100030043657000000000FFFF000000000002000000
      0100000000090068656C76657469636100080000000000000000000000000001
      00020000000000FFFFFF0000000002000000000000000000962D000007006C62
      6C466F6E65000200F4010000AF0000002A0000000F00000043000000F4010000
      000000000000FFFFFF1F2C02000000000001000400466F6E6500000000FFFF00
      00000000020000000100000000090068656C7665746963610008000000000000
      000000000000000100020000000000FFFFFF0000000002000000000000000000
      362E00000D006D6D6F527561456E7472656761000200C70000008C0000001002
      00000F00000043000000F4010000000000000000FFFFFF1F2C02000000000001
      0016005B71727952657175697369636F65732E22727561225D00000000FFFF00
      00000000020000000100000000090068656C7665746963610008000000000000
      000000000000000100020000000000FFFFFF0000000002000000000000000000
      E02E000010006D6D6F436964616465456E7472656761000200C70000009D0000
      00270100000F00000043000000F4010000000000000000FFFFFF1F2C02000000
      000001001D005B71727952657175697369636F65732E226E6F6D656369646164
      65225D00000000FFFF0000000000020000000100000000090068656C76657469
      63610008000000000000000000000000000100020000000000FFFFFF00000000
      020000000000000000008A2F000010006D6D6F42616972726F456E7472656761
      000200C7000000AF000000260100000F00000043000000F40100000000000000
      00FFFFFF1F2C02000000000001001D005B71727952657175697369636F65732E
      226E6F6D6562616972726F225D00000000FFFF00000000000200000001000000
      00090068656C7665746963610008000000000000000000000000000100020000
      000000FFFFFF0000000002000000000000000000493000000D006D6D6F436570
      456E7472656761000200230200009D000000890000000F00000043000000F401
      0000000000000000FFFFFF1F2C020000000000020032005B464F524D41545445
      5854282723232E2323232D232323272C205B71727952657175697369636F6573
      2E22636570225D295D0D000000000000FFFF0000000000020000000100000000
      090068656C766574696361000800000000000000000000000000010002000000
      0000FFFFFF00000000020000000000000000002F31000011006D6D6F466F6E65
      444444456E747265676100020023020000AF000000200000000F000000430000
      00F4010000000000000000FFFFFF1F2C020000000000020055005B4946285B71
      727952657175697369636F65732E22666F6E65646464225D3C3E302C464F524D
      41545445585428272823232329272C5B71727952657175697369636F65732E22
      666F6E65646464225D292C2727295D0D000000000000FFFF0000000000020000
      000100000000090068656C766574696361000800000000000000000000000000
      0100020000000000FFFFFF00000000020000000000000000009432000014006D
      6D6F466F6E654E756D65726F456E747265676100020047020000AF0000004C00
      00000F00000043000000F4010000000000000000FFFFFF1F2C02000000000002
      00D1005B4946285B71727952657175697369636F65732E22666F6E656E756D65
      726F225D3C3E302C205B4946285B4C454E475448285B5452494D285B71727952
      657175697369636F65732E22666F6E656E756D65726F225D295D295D3D382C46
      4F524D4154544558542827232323232D23232323272C5B717279526571756973
      69636F65732E22666F6E656E756D65726F225D292C20464F524D415454455854
      28272323232D23232323272C5B71727952657175697369636F65732E22666F6E
      656E756D65726F225D2920295D2C20272720295D0D000000000000FFFF000000
      0000020000000100000000090068656C76657469636100080000000000000000
      00000000000100020000000000FFFFFF00000000020000000000000000007633
      000013006D6D6F466F6E6552616D616C456E747265676100020097020000AF00
      0000400000000F00000043000000F4010000000000000000FFFFFF1F2C020000
      00000003004C005B4946285B71727952657175697369636F65732E22666F6E65
      72616D616C225D3C3E27272C27522E20272B5B71727952657175697369636F65
      732E22666F6E6572616D616C225D2C2727295D0D00000D000000000000FFFF00
      00000000020000000100000000090068656C7665746963610008000000000000
      000000000000000100020000000000FFFFFF0000000002000000000000000000
      0634000010006C626C5275615265736964656E6369610002008D000000C40000
      00360000000F00000043000000F4010000000000000000FFFFFF1F2C02000000
      00000100030052756100000000FFFF0000000000020000000100000000090068
      656C7665746963610008000000000000000000000000000100020000000000FF
      FFFF00000000020000000000000000009C34000013006C626C43696461646552
      65736964656E6369610002008D000000D6000000360000000F00000043000000
      F4010000000000000000FFFFFF1F2C0200000000000100060043696461646500
      000000FFFF0000000000020000000100000000090068656C7665746963610008
      000000000000000000000000000100020000000000FFFFFF0000000002000000
      0000000000003235000013006C626C42616972726F5265736964656E63696100
      02008D000000E8000000370000000F00000043000000F4010000000000000000
      FFFFFF1F2C0200000000000100060042616972726F00000000FFFF0000000000
      020000000100000000090068656C766574696361000800000000000000000000
      0000000100020000000000FFFFFF0000000002000000000000000000C2350000
      10006D6D6F4365705265736964656E636961000200F4010000D6000000280000
      000F00000043000000F4010000000000000000FFFFFF1F2C0200000000000100
      030043657000000000FFFF0000000000020000000100000000090068656C7665
      746963610008000000000000000000000000000100020000000000FFFFFF0000
      0000020000000000000000005436000011006C626C466F6E655265736964656E
      636961000200F4010000E80000002A0000000F00000043000000F40100000000
      00000000FFFFFF1F2C02000000000001000400466F6E6500000000FFFF000000
      0000020000000100000000090068656C76657469636100080000000000000000
      00000000000100020000000000FFFFFF00000000020000000000000000000437
      000013006D6D6F42616972726F5265736964656E636961000200C7000000E800
      0000270100000F00000043000000F4010000000000000000FFFFFF1F2C020000
      000000010020005B71727950726F63757261436C69656E74652E226E6F6D6562
      616972726F225D00000000FFFF0000000000020000000100000000090068656C
      7665746963610008000000000000000000000000000100020000000000FFFFFF
      0000000002000000000000000000AD37000013006D6D6F527561526573696465
      6E636961636961000200C7000000C4000000100200000F00000043000000F401
      0000000000000000FFFFFF1F2C020000000000010019005B71727950726F6375
      7261436C69656E74652E22727561225D00000000FFFF00000000000200000001
      00000000090068656C7665746963610008000000000000000000000000000100
      020000000000FFFFFF00000000020000000000000000005D38000013006D6D6F
      4369646164655265736964656E636961000200C7000000D6000000270100000F
      00000043000000F4010000000000000000FFFFFF1F2C02000000000001002000
      5B71727950726F63757261436C69656E74652E226E6F6D65636964616465225D
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      08000000000000000000000000000100020000000000FFFFFF00000000020000
      000000000000002839000013006D6D6F4365705265736964656E636961636961
      00020023020000D6000000800000000F00000043000000F40100000000000000
      00FFFFFF1F2C020000000000030035005B464F524D415454455854282723232E
      2323232D232323272C205B71727950726F63757261436C69656E74652E226365
      70225D295D0D00000D000000000000FFFF000000000002000000010000000009
      0068656C76657469636100080000000000000000000000000001000200000000
      00FFFFFF00000000020000000000000000001D3A000014006D6D6F466F6E6544
      44445265736964656E63696100020023020000E8000000200000000F00000043
      000000F4010000000000000000FFFFFF1F2C02000000000004005B005B494628
      5B71727950726F63757261436C69656E74652E22666F6E65646464225D3C3E30
      2C464F524D41545445585428272823232329272C5B71727950726F6375726143
      6C69656E74652E22666F6E65646464225D292C2727295D0D00000D00000D0000
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      08000000000000000000000000000100020000000000FFFFFF00000000020000
      00000000000000973B000017006D6D6F466F6E654E756D65726F526573696465
      6E63696100020047020000E80000004A0000000F00000043000000F401000000
      0000000000FFFFFF1F2C0200000000000400DD005B4946285B71727950726F63
      757261436C69656E74652E22666F6E656E756D65726F225D3C3E302C205B4946
      285B4C454E475448285B5452494D285B71727970726F63757261636C69656E74
      652E22666F6E656E756D65726F225D295D295D3D382C464F524D415454455854
      2827232323232D23232323272C5B71727950726F63757261436C69656E74652E
      22666F6E656E756D65726F225D292C20464F524D41545445585428272323232D
      23232323272C5B71727950726F63757261436C69656E74652E22666F6E656E75
      6D65726F225D2920295D2C20272720295D0D00000D00000D000000000000FFFF
      0000000000020000000100000000090068656C76657469636100080000000000
      00000000000000000100020000000000FFFFFF00000000020000000000000000
      007C3C000016006D6D6F466F6E6552616D616C5265736964656E636961000200
      97020000E8000000410000000F00000043000000F4010000000000000000FFFF
      FF1F2C020000000000010052005B4946285B71727950726F63757261436C6965
      6E74652E22666F6E6572616D616C225D3C3E27272C27522E20272B5B71727950
      726F63757261436C69656E74652E22666F6E6572616D616C225D2C2727295D00
      000000FFFF0000000000020000000100000000090068656C7665746963610008
      000000000000000000000000000100020000000000FFFFFF0000000002000000
      0000000000001F3D00000B006D6D6F436F6E747261746F0002001B0000004F01
      00006B0000001200000043000000F4010000000000000000FFFFFF1F2C020000
      00000001001B005B71727952657175697369636F65732E22636F6E747261746F
      225D00000000FFFF0000000000020000000100000000090068656C7665746963
      610008000000000000000000020000000100020000000000FFFFFF0000000002
      000000000000000000BB3D000010006C626C46696C69616C646556656E646100
      02001400000062010000750000002400000043000F00F4010000000000000000
      FFFFFF1F2C02000000000001000F0046494C49414C2044452056454E44410000
      0000FFFF0000000000020000000100000000090068656C766574696361000700
      0000000000000000000000000100020000000000FFFFFF000000000200000000
      0000000000913E000010006D6D6F46696C69616C646556656E64610002007300
      000063010000120000000D00000043000000F4010000000000000000FFFFFF1F
      2C020000000000010049005B4946285B71727952657175697369636F65732E22
      66696C69616C76656E6461225D3C3E302C5B71727952657175697369636F6573
      2E2266696C69616C76656E6461225D2C2727295D00000000FFFF000000000002
      0000000100000000090068656C76657469636100070000000000000000000100
      00000100020000000000FFFFFF0000000002000000000000000000333F000013
      006C626C46696C69616C64654D6F6E746167656D000200140000008601000075
      0000003E00000043000F00F4010000000000000000FFFFFF1F2C020000000000
      0100120046494C49414C204445204D4F4E544147454D00000000FFFF00000000
      00020000000100000000090068656C7665746963610007000000000000000000
      000000000100020000000000FFFFFF0000000002000000000000000000124000
      0013006D6D6F46696C69616C64654D6F6E746167656D00020073000000870100
      00110000001000000043000000F4010000000000000000FFFFFF1F2C02000000
      000001004F005B4946285B71727952657175697369636F65732E2266696C6961
      6C6D6F6E746167656D225D3C3E302C5B71727952657175697369636F65732E22
      66696C69616C6D6F6E746167656D225D2C2727295D00000000FFFF0000000000
      020000000100000000090068656C766574696361000700000000000000000001
      0000000100020000000000FFFFFF0000000002000000000000000000B9400000
      16006C626C4F627365727661636F65734D6F6E746167656D0002008900000086
      0100007D0100003E00000043000F00F4010000000000000000FFFFFF1F2C0200
      00000000010014004F627365727661636F6573204D6F6E746167656D00000000
      FFFF0000000000020000000100000000090068656C7665746963610008000000
      000000000000020000000100020000000000FFFFFF0000000002000000000000
      000000494100000B006C626C56656E6465646F720002000602000086010000D6
      0000003E00000043000F00F4010000000000000000FFFFFF1F2C020000000000
      0100080056656E6465646F7200000000FFFF0000000000020000000100000000
      090068656C766574696361000800000000000000000002000000010002000000
      0000FFFFFF0000000002000000000000000000DD41000011006C626C436F6469
      676F56656E6465646F720002000A0200009C0100002F00000011000000430000
      00F4010000000000000000FFFFFF1F2C02000000000001000600436F6469676F
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      08000000000000000000000000000100020000000000FFFFFF00000000020000
      000000000000006D4200000F006C626C4E6F6D6556656E6465646F720002000A
      020000B0010000300000001100000043000000F4010000000000000000FFFFFF
      1F2C020000000000010004004E6F6D6500000000FFFF00000000000200000001
      00000000090068656C7665746963610008000000000000000000000000000100
      020000000000FFFFFF00000000020000000000000000001643000011006D6D6F
      436F6469676F56656E6465646F72000200400200009B01000020000000110000
      0043000000F4010000000000000000FFFFFF1F2C02000000000001001B005B71
      727952657175697369636F65732E2276656E6465646F72225D00000000FFFF00
      00000000020000000100000000090068656C7665746963610008000000000000
      000000010000000100020000000000FFFFFF0000000002000000000000000000
      BD4300000F006D6D6F4E6F6D6556656E6465646F7200020040020000B0010000
      990000001100000043000000F4010000000000000000FFFFFF1F2C0200000000
      0001001B005B71727950726F6375726156656E6465646F722E226E6F6D65225D
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      08000000000000000000000000000100020000000000FFFFFF00000000020000
      000000000000006C44000018006C626C4F627365727661636F65734E6F746146
      697363616C000200890000003D010000530200004900000043000F00F4010000
      000000000000FFFFFF1F2C02000000000001001A004F627365727661636F6573
      206461204E6F74612046697363616C00000000FFFF0000000000020000000100
      000000090068656C766574696361000800000000000000000002000000010002
      0000000000FFFFFF00000000020000000000000000002145000018006D6D6F4F
      627365727661636F65734E6F746146697363616C000200910000005101000044
      0200003200000043000000F4010000000000000000FFFFFF1F2C020000000000
      010020005B71727952657175697369636F65732E226F62736461646F66697363
      616C225D00000000FFFF0000000000020000000100000000090068656C766574
      6963610008000000000000000000000000000100020000000000FFFFFF000000
      0002000000000000000000B14500000B006C626C4D6F6E7461646F720002001A
      000000110300003F0000001200000043000000F4010000000000000000FFFFFF
      1F2C020000000000010008004D6F6E7461646F7200000000FFFF000000000002
      0000000100000000090068656C76657469636100080000000000000000000000
      00000100020000000000FFFFFF00000000020000000000000000005A46000011
      006D6D6F436F6469676F6D6F6E7461646F720002005F00000011030000260000
      001200000043000000F4010000000000000000FFFFFF1F2C0200000000000100
      1B005B71727952657175697369636F65732E226D6F6E7461646F72225D000000
      00FFFF0000000000020000000100000000090068656C76657469636100080000
      00000000000000000000000100020000000000FFFFFF00000000020000000000
      00000000014700000F006D6D6F4E6F6D654D6F6E7461646F7200020088000000
      110300007A0100001200000043000000F4010000000000000000FFFFFF1F2C02
      000000000001001B005B71727950726F637572614D6F6E7461646F722E226E6F
      6D65225D00000000FFFF0000000000020000000100000000090068656C766574
      6963610008000000000000000000000000000100020000000000FFFFFF000000
      0002000000000000000000B34700000F006C626C446174614D6F6E746167656D
      000200190000002F030000F30000001200000043000000F40100000000000000
      00FFFFFF1F2C0200000000000100260044617461206461204D6F6E746167656D
      3A202020202020202020202F2020202020202020202F00000000FFFF00000000
      00020000000100000000090068656C7665746963610008000000000000000000
      000000000100020000000000FFFFFF00000000020000000000000000007B4800
      0013006C626C4D6F6E746167656D5065726665697461000200380100002F0300
      00140100001200000043000000F4010000000000000000FFFFFF1F2C02000000
      0000010038004D6F6E746167656D205065726665697461202020202020202820
      2020202020292053696D20202020202020202820202020202029204E616F0000
      0000FFFF0000000000020000000100000000090068656C766574696361000800
      0000000000000000000000000100020000000000FFFFFF000000000200000000
      0000000000114900000E006C626C4F627365727661636F65730002001A000000
      48030000610000001200000043000000F4010000000000000000FFFFFF1F2C02
      000000000001000B004F627365727661636F657300000000FFFF000000000002
      0000000100000000090068656C76657469636100080000000000000000000000
      00000100020000000000FFFFFF0000000002000000000000000000D249000017
      006C626C456D6974656E746564615265717569736963616F0002003600000085
      030000980000002500000043000000F4010000000000000000FFFFFF1F2C0200
      00000000020014005F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F0D160045
      6D6974656E7465206461205265717569736963616F00000000FFFF0000000000
      020000000100000000090068656C766574696361000A00000000000000000000
      0000000100020000000000FFFFFF00000000020000000000000000008F4A0000
      16006C626C417373696E6174757261646F436C69656E74650002004701000083
      030000900000002500000043000000F4010000000000000000FFFFFF1F2C0200
      00000000020012005F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F0D1500417373
      696E617475726120646F20436C69656E746500000000FFFF0000000000020000
      000100000000090068656C766574696361000A00000000000000000000000000
      0100020000000000FFFFFF0000000002000000000000000000404B000011006C
      626C4E6F6D65646F4D6F6E7461646F7200020058020000810300007D00000027
      00000043000000F4010000000000000000FFFFFF1F2C02000000000002001000
      5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F0D10004E6F6D6520646F204D6F6E7461
      646F7200000000FFFF0000000000020000000100000000090068656C76657469
      6361000A000000000000000000000000000100020000000000FFFFFF00000000
      02000000000000000000E34B000005004D656D6F31000200140000000A020000
      6E0000000C00000040000400F4010000000000000000FFFFFF1F2C0200000000
      0001002100205B71727952657175697369636F65734974656E732E2270726F64
      75746F225D2000000000FFFF0000000000020000000100000000090068656C76
      65746963610008000000000000000000110000000100020000000000FFFFFF00
      00000002000000000000000000784C000005004D656D6F33000200970000000A
      020000400000000C00000040000400F4010000000000000000FFFFFF1F2C0200
      00000000010013005B5155414E54494441444550524F4455544F5D00000000FF
      FF0000000000020000000100000000090068656C766574696361000800000000
      0000000000110000000100020000000000FFFFFF000000000200000000000000
      0000254D000005004D656D6F34000200D80000000A0200004B0100000C000000
      40000400F4010000000000000000FFFFFF1F2C02000000000001002B00205B71
      727952657175697369636F65734974656E732E2264657363726963616F70726F
      6475746F6C63225D00000000FFFF000000000002000000010000000009006865
      6C7665746963610008000000000000000000100000000100020000000000FFFF
      FF0000000002000000000000000000CB4D000005004D656D6F35000200230200
      000A020000B90000000C00000040000500F4010000000000000000FFFFFF1F2C
      02000000000001002400205B71727952657175697369636F65734974656E732E
      226F627365727661636F6573225D00000000FFFF000000000002000000010000
      0000090068656C76657469636100080000000000000000001000000001000200
      00000000FFFFFF00000000020000000000000000006B4E000006004D656D6F31
      300002008D00000003010000630100001100000043000000F401000000000000
      0000FFFFFF1F2C02000000000001001D005B71727950726F63757261436C6965
      6E74652E22656D7072657361225D00000000FFFF000000000002000000010000
      0000090068656C76657469636100080000000000000000000000000001000200
      00000000FFFFFF0000000002000000000000000000F24E000006004D656D6F31
      31000200F4010000030100002A0000001100000043000000F401000000000000
      0000FFFFFF1F2C02000000000001000400466F6E6500000000FFFF0000000000
      020000000100000000090068656C766574696361000800000000000000000000
      0000000100020000000000FFFFFF0000000002000000000000000000E44F0000
      06004D656D6F31320002002302000003010000200000001100000043000000F4
      010000000000000000FFFFFF1F2C020000000000030069005B4946285B717279
      50726F63757261436C69656E74652E22666F6E65646464656D7072657361225D
      3C3E302C464F524D41545445585428272823232329272C5B71727950726F6375
      7261436C69656E74652E22666F6E65646464656D7072657361225D292C272729
      5D0D00000D000000000000FFFF0000000000020000000100000000090068656C
      7665746963610008000000000000000000000000000100020000000000FFFFFF
      00000000020000000000000000006651000006004D656D6F3133000200470200
      00030100004A0000001100000043000000F4010000000000000000FFFFFF1F2C
      0200000000000300F9005B4946285B71727950726F63757261436C69656E7465
      2E22666F6E656E756D65726F656D7072657361225D3C3E302C205B4946285B4C
      454E475448285B5452494D285B71727970726F63757261636C69656E74652E22
      666F6E656E756D65726F656D7072657361225D295D295D3D382C464F524D4154
      544558542827232323232D23232323272C5B71727950726F63757261436C6965
      6E74652E22666F6E656E756D65726F656D7072657361225D292C20464F524D41
      545445585428272323232D23232323272C5B71727950726F63757261436C6965
      6E74652E22666F6E656E756D65726F656D7072657361225D2920295D2C202727
      20295D0D00000D000000000000FFFF0000000000020000000100000000090068
      656C7665746963610008000000000000000000000000000100020000000000FF
      FFFF00000000020000000000000000004952000006004D656D6F313400020097
      02000003010000410000001100000043000000F4010000000000000000FFFFFF
      1F2C020000000000010060005B4946285B71727950726F63757261436C69656E
      74652E22666F6E6572616D616C656D7072657361225D3C3E27272C27522E2027
      2B5B71727950726F63757261436C69656E74652E22666F6E6572616D616C656D
      7072657361225D2C2727295D00000000FFFF0000000000020000000100000000
      090068656C766574696361000800000000000000000000000000010002000000
      0000FFFFFF0000000002000000000000000000EE52000006004D656D6F323100
      02001500000072010000720000001300000043000000F4010000000000000000
      FFFFFF1F2C020000000000010022005B71727952657175697369636F65732E22
      6E6F6D6566696C69616C76656E6461225D00000000FFFF000000000002000000
      0100000000090068656C76657469636100070000000000000000000000000001
      00020000000000FFFFFF00000000020000000000000000009353000006004D65
      6D6F3232000200150000009A010000730000002900000043000000F401000000
      0000000000FFFFFF1F2C020000000000010022005B71727950726F6375726146
      696C696169734D6F6E746167656D2E226E6F6D65225D00000000FFFF00000000
      00020000000100000000090068656C7665746963610007000000000000000000
      000000000100020000000000FFFFFF0000000002000000000000000000635400
      0006004D656D6F32330002007300000018010000120000000D00000043000000
      F4010000000000000000FFFFFF1F2C02000000000001004D005B4946285B7172
      7952657175697369636F65732E2266696C69616C656D697373616F225D3C3E30
      2C5B71727952657175697369636F65732E2266696C69616C656D697373616F22
      5D2C2727295D00000000FFFF0000000000020000000100000000090068656C76
      65746963610007000000000000000000010000000100020000000000FFFFFF00
      000000020000000000000000000A55000006004D656D6F323400020015000000
      24010000720000001700000043000000F4010000000000000000FFFFFF1F2C02
      0000000000010024005B71727952657175697369636F65732E226E6F6D656669
      6C69616C656D697373616F225D00000000FFFF00000000000200000001000000
      00090068656C7665746963610007000000000000000000000000000100020000
      000000FFFFFF00000000020000000000000000009755000005004D656D6F3800
      02008900000016010000F50000002700000042000F00F4010000000000000000
      FFFFFF1F2C02000000000001000B004E6F74612046697363616C00000000FFFF
      0000000000020000000100000000090068656C76657469636100080000000000
      00000000020000000100020000000000FFFFFF00000000020000000000000000
      002656000006004D656D6F32350002007E010000160100005E01000027000000
      42000F00F4010000000000000000FFFFFF1F2C02000000000001000C00437570
      6F6D2046697363616C00000000FFFF0000000000020000000100000000090068
      656C7665746963610008000000000000000000020000000100020000000000FF
      FFFF0000000002000000000000000000AE56000006004D656D6F323600020090
      000000280100001F0000001100000043000000F4010000000000000000FFFFFF
      1F2C02000000000001000500536572696500000000FFFF000000000002000000
      0100000000090068656C76657469636100080000000000000000000000000001
      00020000000000FFFFFF00000000020000000000000000003757000006004D65
      6D6F3237000200E8000000280100002F0000001100000043000000F401000000
      0000000000FFFFFF1F2C020000000000010006004E756D65726F00000000FFFF
      0000000000020000000100000000090068656C76657469636100080000000000
      00000000000000000100020000000000FFFFFF00000000020000000000000000
      00C157000006004D656D6F323800020084010000280100002F00000011000000
      43000000F4010000000000000000FFFFFF1F2C020000000000010007004D6171
      75696E6100000000FFFF0000000000020000000100000000090068656C766574
      6963610008000000000000000000000000000100020000000000FFFFFF000000
      00020000000000000000004F58000006004D656D6F3239000200E40100002801
      00003F0000001100000043000000F4010000000000000000FFFFFF1F2C020000
      00000001000B00496E74657276656E73616F00000000FFFF0000000000020000
      000100000000090068656C766574696361000800000000000000000000000000
      0100020000000000FFFFFF0000000002000000000000000000D858000006004D
      656D6F333000020058020000280100002F0000001100000043000000F4010000
      000000000000FFFFFF1F2C020000000000010006004E756D65726F00000000FF
      FF0000000000020000000100000000090068656C766574696361000800000000
      0000000000000000000100020000000000FFFFFF000000000200000000000000
      00007359000006004D656D6F3331000200B4000000280100001F000000110000
      0043000000F4010000000000000000FFFFFF1F2C020000000000010018005B71
      727952657175697369636F65732E227365726965225D00000000FFFF00000000
      00020000000100000000090068656C7665746963610008000000000000000000
      000000000100020000000000FFFFFF0000000002000000000000000000405A00
      0006004D656D6F33320002001C010000280100005B0000001100000043000000
      F4010000000000000000FFFFFF1F2C020000000000020047005B4946285B7172
      7952657175697369636F65732E226E6F746166697363616C225D3C3E302C5B71
      727952657175697369636F65732E226E6F746166697363616C225D2C2727295D
      0D000000000000FFFF0000000000020000000100000000090068656C76657469
      63610008000000000000000000000000000100020000000000FFFFFF00000000
      02000000000000000000075B000006004D656D6F3333000200B8010000280100
      001F0000001100000043000000F4010000000000000000FFFFFF1F2C02000000
      0000020041005B4946285B71727952657175697369636F65732E226D61717569
      6E61225D3C3E302C5B71727952657175697369636F65732E226D617175696E61
      225D2C2727295D0D000000000000FFFF00000000000200000001000000000900
      68656C7665746963610008000000000000000000000000000100020000000000
      FFFFFF0000000002000000000000000000D35B000006004D656D6F3334000200
      28020000280100001F0000001100000043000000F4010000000000000000FFFF
      FF1F2C020000000000010049005B4946285B71727952657175697369636F6573
      2E22696E74657276656E73616F225D3C3E302C5B71727952657175697369636F
      65732E22696E74657276656E73616F225D2C2727295D00000000FFFF00000000
      00020000000100000000090068656C7665746963610008000000000000000000
      000000000100020000000000FFFFFF00000000020000000000000000009F5C00
      0006004D656D6F33350002008C020000280100004B0000001100000043000000
      F4010000000000000000FFFFFF1F2C020000000000010049005B4946285B7172
      7952657175697369636F65732E226375706F6D66697363616C225D3C3E302C5B
      71727952657175697369636F65732E226375706F6D66697363616C225D2C2727
      295D00000000FFFF0000000000020000000100000000090068656C7665746963
      610008000000000000000000000000000100020000000000FFFFFF0000000002
      0000000000000000002E5D00000E006C626C4974656D50726F6475746F000200
      14000000DD0100006E0000001300000043000E00F4010000000000000000FFFF
      FF1F2C020000000000010004004974656D00000000FFFF000000000002000000
      0100000000090068656C76657469636100080000000000000000000200000001
      00020000000000FFFFFF0000000002000000000000000000C95D000014006C62
      6C5175616E74696461646550726F6475746F00020097000000DD010000410000
      001300000043000F00F4010000000000000000FFFFFF1F2C0200000000000100
      0A005175616E74696461646500000000FFFF0000000000020000000100000000
      090068656C766574696361000800000000000000000002000000010002000000
      0000FFFFFF0000000002000000000000000000605E000013006C626C44657363
      726963616F50726F6475746F000200D8000000DD0100004B0100001300000043
      000F00F4010000000000000000FFFFFF1F2C0200000000000100070050726F64
      75746F00000000FFFF0000000000020000000100000000090068656C76657469
      63610008000000000000000000020000000100020000000000FFFFFF00000000
      02000000000000000000035F000014006C626C4F62736572766163616F50726F
      6475746F00020023020000DD010000B90000001300000043000F00F401000000
      0000000000FFFFFF1F2C020000000000010012004F62736572766163616F2050
      726F6475746F00000000FFFF0000000000020000000100000000090068656C76
      65746963610008000000000000000000020000000100020000000000FFFFFF00
      00000002000000000000000000865F000008004D656D6F4974656D0002001400
      0000340200006E0000000200000043000600F4010000000000000000FFFFFF1F
      2C020000000000000000000000FFFF0000000000020000000100000005090068
      656C7665746963610008000000000000000000020000000100020000000000FF
      FFFF00000000020000000000000000000B6000000A004D656D6F46696C69616C
      0002008300000034020000140000000200000043000600F40100000000000000
      00FFFFFF1F2C020000000000000000000000FFFF000000000002000000010000
      0005090068656C76657469636100080000000000000000000200000001000200
      00000000FFFFFF0000000002000000000000000000906000000A004D656D6F51
      74646164650002009700000034020000410000000200000043000700F4010000
      000000000000FFFFFF1F2C020000000000000000000000FFFF00000000000200
      00000100000005090068656C7665746963610008000000000000000000020000
      000100020000000000FFFFFF00000000020000000000000000001F6100001400
      4D656D6F64657363726963616F70726F6475746F000200D8000000340200004B
      0100000200000043000700F4010000000000000000FFFFFF1F2C020000000000
      000000000000FFFF0000000000020000000100000005090068656C7665746963
      610008000000000000000000020000000100020000000000FFFFFF0000000002
      000000000000000000AF61000015004D656D6F4F62736572766163616F50726F
      6475746F0002002302000034020000B90000000200000043000700F401000000
      0000000000FFFFFF1F2C020000000000000000000000FFFF0000000000020000
      000100000005090068656C766574696361000800000000000000000002000000
      0100020000000000FFFFFF00000000020000000000000000004062000010006C
      626C46696C69616C50726F6475746F00020083000000DD010000140000001300
      000043000F00F4010000000000000000FFFFFF1F2C0200000000000100040046
      696C2E00000000FFFF0000000000020000000100000000090068656C76657469
      63610008000000000000000000020000000100020000000000FFFFFF00000000
      02000000000000000000E062000005004D656D6F32000200830000000A020000
      140000000C00000040000400F4010000000000000000FFFFFF1F2C0200000000
      0001001E005B71727952657175697369636F65734974656E732E2266696C6961
      6C225D00000000FFFF0000000000020000000100000000090068656C76657469
      63610008000000000000000000120000000100020000000000FFFFFF00000000
      020000000000000000008163000006004D656D6F31360002008A000000950100
      007B0100002E0000006700000001000000000000000000FFFFFF1F2C02000000
      000001001E005B71727952657175697369636F65732E226F627365727661636F
      6573225D00000000FFFF0000000000020000000100000000090068656C766574
      6963610007000000000000000000000000000100020000000000FFFFFF000000
      000200000000000000FEFEFF0E000000070020546F7461697300000000130053
      7562546F74616C56616C6F7256656E63746F00010030001200537562546F7461
      6C56616C6F72506167746F00010030000D00537562546F74616C4A75726F7300
      010030001000546F74616C56616C6F7256656E63746F00010030000F00546F74
      616C56616C6F72506167746F00010030000A00546F74616C4A75726F73000100
      30000300527561000000000600436964616465000000000400466F6E65000000
      000600546974756C6F0000000006004F75747261730000000006004261697272
      6F000000000800436F6E74696E756100040054727565000000000000000000FC
      000000000000000000000000000000005800357C5A4756E2E3404B3D8164943D
      E540}
  end
  object fdsRequisicoesItens: TfrDBDataSet
    DataSet = qryRequisicoesItens
    OpenDataSource = False
    Left = 632
    Top = 208
  end
  object qryRequisicoesItens: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryRequisicoesItensAfterOpen
    BeforeDelete = qryRequisicoesItensBeforeDelete
    AfterScroll = qryRequisicoesItensAfterScroll
    OnCalcFields = qryRequisicoesItensCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select'
      '   ri.requisicao, '
      '   ri.produto,'
      '   ri.filial,'
      '   ri.quantidade,'
      '   ri.montagem,'
      '   ri.tipodemontagem,'
      '   ri.datamontagem,'
      '   ri.valorpagto,'
      '   ri.datapagto,'
      '   ri.observacoes,'
      '   p.descricao as descricaoproduto,'
      
        '   (select gr.descricao from grades gr, caracteristicas c where ' +
        'gr.codigo = c.grade1 and c.codigo = p.caracteristica) as linha,'
      
        '   (select gr.descricao from grades gr, caracteristicas c where ' +
        'gr.codigo = c.grade2 and c.codigo = p.caracteristica) as coluna,'
      '   p.valorgrade1,'
      '   p.valorgrade2,'
      
        '   (select tm.descricao from tabelademontagens tm where tm.codig' +
        'o=ri.montagem) as descricaomontagem'
      
        ' from requisicoesitens ri join produtos p on p.codigo = ri.produ' +
        'to'
      'where ri.requisicao = :numero'
      
        'order by UPPER(TO_ASCII(p.descricao,'#39'LATIN1'#39')),p.valorgrade1,p.v' +
        'alorgrade2')
    RequestLive = True
    Left = 72
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end>
    object qryRequisicoesItensrequisicao: TIntegerField
      FieldName = 'requisicao'
      Visible = False
      DisplayFormat = '0'
    end
    object qryRequisicoesItensproduto: TLargeintField
      DisplayLabel = 'Produto'
      FieldName = 'produto'
      Required = True
    end
    object qryRequisicoesItensfilial: TIntegerField
      DisplayLabel = 'Fil'
      FieldName = 'filial'
      Required = True
      DisplayFormat = '0'
    end
    object qryRequisicoesItensmontagem: TIntegerField
      DisplayLabel = 'Montagem'
      FieldName = 'montagem'
      Visible = False
      DisplayFormat = '0'
    end
    object qryRequisicoesItenstipodemontagem: TStringField
      DisplayLabel = 'Tp'
      FieldName = 'tipodemontagem'
      Size = 1
    end
    object qryRequisicoesItensdatamontagem: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data'
      FieldName = 'datamontagem'
      EditMask = '99/99/9999;1; '
    end
    object qryRequisicoesItensvalorpagto: TFloatField
      DisplayLabel = 'Valor Pagto'
      FieldName = 'valorpagto'
      DisplayFormat = '0.00'
    end
    object qryRequisicoesItensdatapagto: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data Pagto'
      FieldName = 'datapagto'
      EditMask = '99/99/9999;1; '
    end
    object qryRequisicoesItensobservacoes: TStringField
      FieldName = 'observacoes'
      Visible = False
      Size = 100
    end
    object qryRequisicoesItensdescricaoproduto: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 50
      FieldName = 'descricaoproduto'
      Size = 100
    end
    object qryRequisicoesItenslinha: TStringField
      FieldName = 'linha'
      Visible = False
      Size = 50
    end
    object qryRequisicoesItenscoluna: TStringField
      FieldName = 'coluna'
      Visible = False
      Size = 50
    end
    object qryRequisicoesItensvalorgrade1: TStringField
      DisplayLabel = 'Linha'
      FieldName = 'valorgrade1'
      Size = 50
    end
    object qryRequisicoesItensvalorgrade2: TStringField
      DisplayLabel = 'Coluna'
      FieldName = 'valorgrade2'
      Size = 50
    end
    object qryRequisicoesItensdescricaomontagem: TStringField
      DisplayLabel = 'Montagem'
      FieldName = 'descricaomontagem'
      Size = 50
    end
    object qryRequisicoesItensdescricaoprodutolc: TStringField
      FieldKind = fkCalculated
      FieldName = 'descricaoprodutolc'
      Visible = False
      Size = 62
      Calculated = True
    end
    object qryRequisicoesItensquantidade: TFloatField
      DisplayLabel = 'Qtdade'
      FieldName = 'quantidade'
    end
  end
end
