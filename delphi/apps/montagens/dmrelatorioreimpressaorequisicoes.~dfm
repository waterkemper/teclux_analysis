inherited dtmRelatorioReimpressaoRequisicoes: TdtmRelatorioReimpressaoRequisicoes
  OldCreateOrder = False
  Left = 345
  Top = 202
  Height = 471
  Width = 756
  object qryCliente: TtecQuery
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
      '          vf.tipo,'
      '          coalesce(vf.razao,vf.nome) as nome         '
      'From   vfornecedores vf'
      'where (vf.codigo = :codigo)  and'
      '          (vf.tipo     = :tipocliente) '
      'Order By Codigo, tipo')
    RequestLive = False
    Left = 50
    Top = 12
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
    object qryClientecodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryClientenome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object qryClientetipo: TStringField
      FieldName = 'tipo'
      Size = 50
    end
  end
  object dsrCliente: TtecDataSource
    DataSet = qryCliente
    Left = 143
    Top = 13
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
      '       cast(case when tipo = ''F'' then ''Fornecedor'''
      '                       when tipo = ''C'' then ''Cliente'''
      '               end as varchar) as tipoorig'
      'From   vfornecedores'
      ''
      '/* editado em run time */'
      ''
      'Order By UPPER(TO_ASCII(nome,''LATIN1''))'
      '')
    RequestLive = False
    Left = 260
    Top = 11
    object qryConsultaClientesnome: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaClientespessoanumero: TStringField
      DisplayLabel = 'CPF/CGC'
      FieldName = 'pessoanumero'
      Size = 14
    end
    object qryConsultaClientescodigo: TIntegerField
      DisplayLabel = 'Código'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryConsultaClientestipo: TStringField
      DisplayLabel = 'Tipo Cliente'
      FieldName = 'tipo'
      Visible = False
      Size = 10
    end
    object qryConsultaClientestipoorig: TStringField
      FieldName = 'tipoorig'
      Visible = False
      Size = 1
    end
  end
  object qryMontador: TtecQuery
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
    Left = 50
    Top = 69
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
    object qryMontadorcodigo: TIntegerField
      DisplayLabel = 'Código do Montador'
      FieldName = 'codigo'
    end
    object qryMontadornome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object qryMontadortipo: TStringField
      FieldName = 'tipo'
      Size = 50
    end
  end
  object dsrMontador: TtecDataSource
    DataSet = qryMontador
    Left = 143
    Top = 70
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
      '       cast(case when tipo = ''F'' then ''Fornecedor'''
      '                       when tipo = ''U'' then ''Usuário'''
      '               end as varchar) as tipoorig'
      'From   vmontadores'
      'Order By UPPER(TO_ASCII(nome,''LATIN1''))')
    RequestLive = False
    Left = 260
    Top = 72
    object qryConsultaMontadornome: TStringField
      DisplayLabel = 'Montador'
      FieldName = 'nome'
      Size = 17
    end
    object qryConsultaMontadorcodigo: TIntegerField
      DisplayLabel = 'Código'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryConsultaMontadortipo: TStringField
      FieldName = 'tipo'
      Visible = False
      Size = 1
    end
    object qryConsultaMontadortipoorig: TStringField
      DisplayLabel = 'Tipo de Montador'
      FieldName = 'tipoorig'
      Size = 10
    end
  end
  object qryRequisicoes: TtecQuery
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
      'select'
      '       r.numero,'
      '       r.abertura,'
      '       r.datahora,'
      '       r.dadofiscal,'
      '       r.filialmontagem,'
      
        '       (select f.nome from filiais f where f.codigo=r.filialmont' +
        'agem) as nomefilialmontagem,'
      '       r.montador,'
      '       r.tipomontador,'
      
        '       (select vm.nome from vmontadores vm where vm.codigo=r.mon' +
        'tador and vm.tipo=r.tipomontador) as nomemontador,'
      '       r.vendedor,'
      
        '       (select u.nome from usuarios u where u.codigo=r.vendedor)' +
        ' as nomevendedor,   '
      '       r.cliente,'
      '       r.tipocliente,'
      '          coalesce(vf.razao, vf.nome) as nomecliente,'
      '          vf.rua as ruaresidencia,'
      '          vf.cidade as cidaderesidencia,'
      '          (select nome'
      '           from cidades d'
      '           where (d.estado = vf.estado) and'
      '              (d.codigo = vf.cidade)'
      '           ) as nomecidaderesidencia,'
      '          vf.estado as estadoresidencia,'
      '          vf.bairro as bairroresidencia,'
      '          (select nome'
      '           from bairros b'
      '           where (b.estado = vf.estado) and'
      '              (b.cidade = vf.cidade) and'
      '              (b.codigo = vf.bairro)'
      '           ) as nomebairroresidencia,'
      '          vf.cep as cepresidencia,'
      '          vf.foneddd as fonedddresidencia,'
      '          vf.fonenumero as fonenumeroresidencia,'
      '          vf.foneramal as foneramalresidencia,'
      '          vf.fonedddempresa,'
      '          vf.fonenumeroempresa,'
      '          vf.foneramalempresa,'
      '          vf.empresa,   '
      '       r.cidade,'
      '       (select nome'
      '        from cidades d'
      '        where (d.estado = r.estado) and'
      '              (d.codigo = r.cidade)'
      '       ) as nomecidade,'
      '       r.bairro,'
      '       (select nome'
      '        from bairros b'
      '        where (b.estado = r.estado) and'
      '              (b.cidade = r.cidade) and'
      '              (b.codigo = r.bairro)'
      '       ) as nomebairro,'
      '       r.rua,'
      '       r.estado,'
      '       r.cep,'
      '       r.observacoes,'
      
        '       (select df.observacoes from dadosfiscais df where df.nume' +
        'ro=r.dadofiscal) as obsdadofiscal,'
      '       r.foneddd,'
      '       r.fonenumero,'
      '       r.foneramal,'
      
        '       (select df.filialemissao from dadosfiscais df where df.nu' +
        'mero=r.dadofiscal) as filialemissao,'
      
        '       (select f.nome from filiais f where f.codigo=(select df.f' +
        'ilialemissao from dadosfiscais df where df.numero=r.dadofiscal)'
      
        '                                                                ' +
        '    ) as nomefilialemissao,'
      
        '       (select ct.filialvenda from contratos ct where ct.numero=' +
        '(select df.contrato from dadosfiscais df where df.numero=r.dadof' +
        'iscal)) as filialvenda,'
      
        '       (select f.nome from filiais f where f.codigo=(select ct.f' +
        'ilialvenda from contratos ct where ct.numero=(select df.contrato' +
        ' from dadosfiscais df where df.numero=r.dadofiscal))'
      
        '                                                                ' +
        '    ) as nomefilialvenda,'
      
        '       (select df.contrato from dadosfiscais df where df.numero=' +
        'r.dadofiscal) as contrato,'
      
        '       (select n.serie from notas n where n.dadofiscal=r.dadofis' +
        'cal) as serie,'
      
        '       (select n.numero from notas n where n.dadofiscal=r.dadofi' +
        'scal) as notafiscal,'
      
        '       (select c.maquina from cupons c where c.dadofiscal=r.dado' +
        'fiscal) as maquina,'
      
        '       (select c.intervensao from cupons c where c.dadofiscal=r.' +
        'dadofiscal) as intervensao,'
      
        '       (select c.numero from cupons c where c.dadofiscal=r.dadof' +
        'iscal) as cupomfiscal,'
      ''
      '       ri.produto,'
      
        '       (select cast(p.descricao||'' ''||coalesce(p.valorgrade1,'''')' +
        '||'' ''||coalesce(p.valorgrade2,'''') as varchar) from produtos p wh' +
        'ere p.codigo=ri.produto) as descricaoproduto,'
      '       ri.filial,'
      '       ri.quantidade,'
      '       ri.montagem,'
      
        '       (select tm.descricao from tabelademontagens tm where tm.c' +
        'odigo=ri.montagem) as descricaomontagem,'
      '       ri.tipodemontagem,'
      '       ri.datamontagem,'
      '       ri.valorpagto,'
      '       ri.datapagto,'
      '       ri.observacoes as observacoesitens,'
      
        '       (select count(*) from requisicoesitens ri where ri.requis' +
        'icao=r.numero) as numerodeitens'
      ''
      
        'from ((requisicoes r  join requisicoesitens ri on r.numero=ri.re' +
        'quisicao)'
      
        '                             join vfornecedores vf on r.cliente=' +
        'vf.codigo and r.tipocliente=vf.tipo)'
      
        'where date_trunc(''minute'', r.datahora) between (:datainicial) an' +
        'd (:datafinal) '
      ''
      '         /* Where clientes */'
      '         /* Where Montadores */'
      '         /* Where Situacao Montagem Requisicao */'
      '         /* Where Situacao Montagem Itens Requisicao */ '
      '         /* Where Numero Requisicoes */'
      ''
      'order by r.numero, ri.produto, ri.filial')
    RequestLive = True
    Left = 48
    Top = 136
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'datainicial'
        ParamType = ptUnknown
        Value = '''01/01/2000 00:00'''
      end
      item
        DataType = ftDateTime
        Name = 'datafinal'
        ParamType = ptUnknown
        Value = '''08/12/2005 23:59'''
      end>
    object qryRequisicoesnumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryRequisicoesabertura: TDateField
      Alignment = taCenter
      FieldName = 'abertura'
      EditMask = '99/99/9999;1; '
    end
    object qryRequisicoesdatahora: TDateTimeField
      FieldName = 'datahora'
    end
    object qryRequisicoesdadofiscal: TIntegerField
      FieldName = 'dadofiscal'
      DisplayFormat = '0'
    end
    object qryRequisicoesfilialmontagem: TIntegerField
      FieldName = 'filialmontagem'
      DisplayFormat = '0'
    end
    object qryRequisicoesnomefilialmontagem: TStringField
      FieldName = 'nomefilialmontagem'
      Size = 50
    end
    object qryRequisicoesmontador: TIntegerField
      FieldName = 'montador'
      DisplayFormat = '0'
    end
    object qryRequisicoestipomontador: TStringField
      FieldName = 'tipomontador'
      Size = 1
    end
    object qryRequisicoesnomemontador: TStringField
      FieldName = 'nomemontador'
      Size = 50
    end
    object qryRequisicoesvendedor: TIntegerField
      FieldName = 'vendedor'
      DisplayFormat = '0'
    end
    object qryRequisicoesnomevendedor: TStringField
      FieldName = 'nomevendedor'
      Size = 50
    end
    object qryRequisicoescliente: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object qryRequisicoestipocliente: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
    object qryRequisicoesnomecliente: TStringField
      FieldName = 'nomecliente'
      Size = 50
    end
    object qryRequisicoesruaresidencia: TStringField
      DisplayWidth = 100
      FieldName = 'ruaresidencia'
      Size = 100
    end
    object qryRequisicoescidaderesidencia: TIntegerField
      FieldName = 'cidaderesidencia'
      DisplayFormat = '0'
    end
    object qryRequisicoesnomecidaderesidencia: TStringField
      FieldName = 'nomecidaderesidencia'
      Size = 50
    end
    object qryRequisicoesestadoresidencia: TStringField
      FieldName = 'estadoresidencia'
      Size = 50
    end
    object qryRequisicoesbairroresidencia: TIntegerField
      FieldName = 'bairroresidencia'
      DisplayFormat = '0'
    end
    object qryRequisicoesnomebairroresidencia: TStringField
      FieldName = 'nomebairroresidencia'
      Size = 50
    end
    object qryRequisicoescepresidencia: TIntegerField
      FieldName = 'cepresidencia'
      DisplayFormat = '0'
    end
    object qryRequisicoesfonedddresidencia: TIntegerField
      FieldName = 'fonedddresidencia'
      DisplayFormat = '0'
    end
    object qryRequisicoesfonenumeroresidencia: TIntegerField
      FieldName = 'fonenumeroresidencia'
      DisplayFormat = '0'
    end
    object qryRequisicoesfoneramalresidencia: TStringField
      FieldName = 'foneramalresidencia'
      Size = 50
    end
    object qryRequisicoesfonedddempresa: TIntegerField
      FieldName = 'fonedddempresa'
      DisplayFormat = '0'
    end
    object qryRequisicoesfonenumeroempresa: TIntegerField
      FieldName = 'fonenumeroempresa'
      DisplayFormat = '0'
    end
    object qryRequisicoesfoneramalempresa: TStringField
      FieldName = 'foneramalempresa'
      Size = 50
    end
    object qryRequisicoesempresa: TStringField
      FieldName = 'empresa'
      Size = 50
    end
    object qryRequisicoescidade: TIntegerField
      FieldName = 'cidade'
      DisplayFormat = '0'
    end
    object qryRequisicoesobsdadofiscal: TStringField
      FieldName = 'obsdadofiscal'
      Size = 50
    end
    object qryRequisicoesnomecidade: TStringField
      FieldName = 'nomecidade'
      Size = 50
    end
    object qryRequisicoesnumerodeitens: TLargeintField
      FieldName = 'numerodeitens'
    end
    object qryRequisicoesrua: TStringField
      FieldName = 'rua'
      Size = 100
    end
    object qryRequisicoesbairro: TIntegerField
      FieldName = 'bairro'
      DisplayFormat = '0'
    end
    object qryRequisicoesnomebairro: TStringField
      FieldName = 'nomebairro'
      Size = 50
    end
    object qryRequisicoesestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object qryRequisicoescep: TIntegerField
      FieldName = 'cep'
      DisplayFormat = '0'
    end
    object qryRequisicoesobservacoes: TStringField
      DisplayWidth = 250
      FieldName = 'observacoes'
      Size = 250
    end
    object qryRequisicoesfoneddd: TIntegerField
      FieldName = 'foneddd'
      DisplayFormat = '0'
    end
    object qryRequisicoesfonenumero: TIntegerField
      FieldName = 'fonenumero'
      DisplayFormat = '0'
    end
    object qryRequisicoesfoneramal: TStringField
      FieldName = 'foneramal'
      Size = 10
    end
    object qryRequisicoesfilialemissao: TIntegerField
      FieldName = 'filialemissao'
      DisplayFormat = '0'
    end
    object qryRequisicoesnomefilialemissao: TStringField
      FieldName = 'nomefilialemissao'
      Size = 50
    end
    object qryRequisicoesfilialvenda: TIntegerField
      FieldName = 'filialvenda'
      DisplayFormat = '0'
    end
    object qryRequisicoesnomefilialvenda: TStringField
      FieldName = 'nomefilialvenda'
      Size = 50
    end
    object qryRequisicoescontrato: TStringField
      FieldName = 'contrato'
      Size = 50
    end
    object qryRequisicoesserie: TStringField
      FieldName = 'serie'
      Size = 50
    end
    object qryRequisicoesnotafiscal: TIntegerField
      FieldName = 'notafiscal'
      DisplayFormat = '0'
    end
    object qryRequisicoesmaquina: TIntegerField
      FieldName = 'maquina'
      DisplayFormat = '0'
    end
    object qryRequisicoesintervensao: TIntegerField
      FieldName = 'intervensao'
      DisplayFormat = '0'
    end
    object qryRequisicoescupomfiscal: TIntegerField
      FieldName = 'cupomfiscal'
      DisplayFormat = '0'
    end
    object qryRequisicoesproduto: TLargeintField
      FieldName = 'produto'
      DisplayFormat = '0'
    end
    object qryRequisicoesdescricaoproduto: TStringField
      DisplayWidth = 62
      FieldName = 'descricaoproduto'
      Size = 162
    end
    object qryRequisicoesfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryRequisicoesquantidade: TFloatField
      FieldName = 'quantidade'
      DisplayFormat = '0'
    end
    object qryRequisicoesmontagem: TIntegerField
      FieldName = 'montagem'
      DisplayFormat = '0'
    end
    object qryRequisicoesdescricaomontagem: TStringField
      FieldName = 'descricaomontagem'
      Size = 50
    end
    object qryRequisicoestipodemontagem: TStringField
      FieldName = 'tipodemontagem'
      Size = 1
    end
    object qryRequisicoesdatamontagem: TDateField
      Alignment = taCenter
      FieldName = 'datamontagem'
      EditMask = '99/99/9999;1; '
    end
    object qryRequisicoesvalorpagto: TFloatField
      FieldName = 'valorpagto'
      DisplayFormat = '0.00'
    end
    object qryRequisicoesdatapagto: TDateField
      Alignment = taCenter
      FieldName = 'datapagto'
      EditMask = '99/99/9999;1; '
    end
    object qryRequisicoesobservacoesitens: TStringField
      FieldName = 'observacoesitens'
      Size = 100
    end
  end
  object frpRequisicao: TfrReport
    Dataset = fdsRequisicoes
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnGetValue = frpRequisicaoGetValue
    OnBeforePrint = frpRequisicaoBeforePrint
    Left = 48
    Top = 208
    ReportForm = {
      190000002179000019FFFF00000A0050444643726561746F7200FFFFFFFFFF02
      0000006F080000EA0A0000000000000000000000000000000000000000040000
      0000FFFF000000000000000000000000030400466F726D00FEFFFFFFDC000000
      780000007C0100002C010000040000000200D10000000900666276526F646170
      6500020100000000B90300000B0300000E000000300003000100000000000000
      0000FFFFFF1F00000000000000000000000000FFFF0000000000020000000100
      00000000000001000000C8000000140000000100000000000002003C0100000B
      005061676548656164657231000201000000001D0000000B0300003300000030
      00020001000000000000000000FFFFFF1F00000000000000000000000000FFFF
      000000000002000000010000000000000001000000C800000014000000010000
      000000000200BA0100000B004D61737465724461746132000201000000003402
      00000B0300000B0000003000050001000000000000000000FFFFFF1F00000000
      130066647352657175697369636F65734974656E7300000000000000FFFF0000
      00000002000000010000000000000001000000C8000000140000000100000000
      0000020068020000120043616265E7616C686F446520477275706F3100020100
      000000970000000B0300005C0100003200100001000000000000000000FFFFFF
      1F0000000019005B71727952657175697369636F65732E226E756D65726F225D
      0000000003000500626567696E0D130020636F6E74696E75613A3D66616C7365
      3B20200D0300656E6400FFFF0000000000020000000100000000000000010000
      00C800000014000000010000000000000200E80300000F00526F646170E94465
      20477275706F3100020100000000580200000B03000006000000300011000100
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
      20477275706F3200020100000000000300000B030000A8000000300011000100
      0000000000000000FFFFFF1F0000000000000000000003000500626567696E0D
      1900637572793A3D706167656865696768742D68656967687420200D0300656E
      6400FFFF000000000002000000010000000000000001000000C8000000140000
      000100000000000002000B050000120043616265E7616C686F44652047727570
      6F3200020100000000080200000B030000170000007000100001000000000000
      000000FFFFFF1F0000000019005B71727952657175697369636F65732E226E75
      6D65726F225D00000000000000FFFF0000000000020000000100000000000000
      01000000C8000000140000000100000000000000008C05000006004D656D6F31
      350002008900000029010000530200001900000043000F00F401000000000000
      0000FFFFFF1F2C020000000000000000000000FFFF0000000000020000000100
      000000090068656C766574696361000800000000000000000000000000010002
      0000000000FFFFFF00000000020000000000000000000C06000005004D656D6F
      390002001400000000030000C8020000A600000043000F00F401000000000000
      0000FFFFFF1F2C020000000000000000000000FFFF0000000000020000000100
      000000090068656C766574696361000800000004000000000002000000010002
      0000000000FFFFFF00000000020000000000000000008C06000005004D656D6F
      3700020089000000EF000000530200003A00000043000F00F401000000000000
      0000FFFFFF1F2C020000000000000000000000FFFF0000000000020000000100
      000000090068656C766574696361000800000000000000000000000000010002
      0000000000FFFFFF00000000020000000000000000000C07000005004D656D6F
      3600020089000000B5000000530200003A00000043000F00F401000000000000
      0000FFFFFF1F2C020000000000000000000000FFFF0000000000020000000100
      000000090068656C76657469636100080000000000000000000A000000010002
      0000000000FFFFFF00000000020000000000000001006E36000008006C6F676F
      7469706F000200180000001D000000730000002700000005000000F401000000
      0000000000FFFFFF1F2C020000000000000000000000FFFF0000000000020000
      00010000000601006E360000424D0A2F00000000000036000000280000006C00
      0000250000000100180000000000D42E0000120B0000120B0000000000000000
      0000C0C0C0C0C0C0C0C0C0BFBFBFBFBFBFBFBFBFBEBEBEBEBEBEBEBEBEBEBEBE
      BEBEBEBEBEBEBEBEBEBEBEBEBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBEBEBEBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBE
      BEBEBEBEBEBEBEBEBCBCBCBCBCBCBBBBBBBBBBBBBCBCBCBDBDBDBEBEBEBEBEBE
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBEBE
      BEBEBEBEBEBEBEBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BEBEBEBEBEBEBFBFBFBFBFBFBFBFBFBFBFBFBEBEBEBEBEBEBEBEBEBEBEBEBEBE
      BEBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBEBEBEBEBEBEBEBEBEBEBEBEBFBFBFBFBFBFBFBFBFBFBFBFC0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0BFBFBFBEBEBEBEBEBEBCBCBCBBBBBBBBBBBBBBBBBBBBBB
      BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBB
      BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
      BBBBBBBBBBBBBABABAB9B9B9B8B8B8B7B7B7B5B5B5B5B5B5B7B7B7B8B8B8BABA
      BABBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBCBCBCBDBDBDBEBEBEBEBEBEBDBDBDBC
      BCBCBCBCBCBBBBBBBCBCBCBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBCBCBC
      BDBDBDBEBEBEBEBEBEBEBEBEBDBDBDBCBCBCBCBCBCBCBCBCBCBCBCBBBBBBBBBB
      BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
      BBBBBCBCBCBCBCBCBCBCBCBCBCBCBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
      BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBCBCBCBDBDBDBEBEBEBFBF
      BFBFBFBFC0C0C0C0C0C0BFBFBFBEBEBEBCBCBCBBBBBBB8B8B8B7B7B7B6B6B6B5
      B5B5B5B5B5B5B5B5B5B5B5B6B6B6B7B7B7B7B7B7B8B8B8B8B8B8B8B8B8B7B7B7
      B7B7B7B5B5B5B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B5B5B5B5B5B5B5B5B5B5B5
      B5B5B5B5B4B4B4B4B4B4B4B4B4B2B2B2B1B1B1AFAFAFADADADADADADAFAFAFB1
      B1B1B3B3B3B4B4B4B5B5B5B5B5B5B5B5B5B6B6B6B8B8B8B9B9B9BABABABABABA
      B8B8B8B8B8B8B7B7B7B7B7B7B7B7B7B6B6B6B6B6B6B5B5B5B5B5B5B5B5B5B6B6
      B6B7B7B7B8B8B8BBBBBBBBBBBBBBBBBBBABABAB8B8B8B7B7B7B7B7B7B7B7B7B6
      B6B6B6B6B6B7B7B7B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
      B5B5B5B6B6B6B7B7B7B7B7B7B7B7B7B7B7B7B6B6B6B5B5B5B5B5B5B5B5B5B5B5
      B5B5B5B5B5B5B5B4B4B4B4B4B4B5B5B5B5B5B5B5B5B5B7B7B7B7B7B7B9B9B9BB
      BBBBBDBDBDBEBEBEBFBFBFC0C0C0BFBFBFBCBCBCBABABAB7B7B7B3B3B3B0B0B0
      AFAFAFADADADACACACADADADADADADAEAEAEAFAFAFB0B0B0B2B2B2B2B2B2B2B2
      B2B0B0B0AFAFAFAEAEAEACACACABABABABABABABABABABABABACACACACACACAC
      ACACACACACACACACABABABABABABABABABA9A9A9A7A7A7A5A5A5A3A3A3A3A3A3
      A5A5A5A7A7A7A9A9A9ACACACACACACACACACACACACAFAFAFB1B1B1B3B3B3B5B5
      B5B5B5B5B3B3B3B2B2B2AFAFAFAFAFAFAFAFAFAFAFAFAEAEAEAEAEAEADADADAC
      ACACAEAEAEB0B0B0B3B3B3B5B5B5B7B7B7B6B6B6B5B5B5B3B3B3B0B0B0B0B0B0
      B0B0B0AFAFAFAFAFAFAFAFAFAEAEAEADADADAFAFAFAFAFAFADADADADADADAFAF
      AFADADADADADADAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFADADADADADADAD
      ADADADADADACACACACACACABABABACACACACACACACACACAEAEAEAFAFAFB1B1B1
      B4B4B4B7B7B7BABABABDBDBDBFBFBFC0C0C0BEBEBEBBBBBBB7B7B7B2B2B2ABAB
      ABA6A6A6A5A5A5A3A3A3A1A1A1A2A2A2A3A3A3A3A3A3A5A5A5A6A6A6A8A8A8AA
      AAAAA9A9A9A7A7A7A5A5A5A3A3A3A0A0A09F9F9F9E9E9E9F9F9FA0A0A0A1A1A1
      A1A1A1A1A1A1A1A1A1A0A0A0A0A0A0A0A0A09F9F9F9E9E9E9D9D9D9A9A9A9999
      999898989A9A9A9D9D9DA0A0A0A1A1A1A2A2A2A1A1A1A1A1A1A3A3A3A8A8A8AC
      ACACAFAFAFAFAFAFACACACA9A9A9A6A6A6A5A5A5A5A5A5A3A3A3A3A3A3A3A3A3
      A1A1A1A0A0A0A3A3A3A6A6A6ABABABAFAFAFB2B2B2B1B1B1AFAFAFACACACA8A8
      A8A7A7A7A6A6A6A5A5A5A5A5A5A6A6A6A3A3A3A2A2A2A3A3A3A4A4A4A3A3A3A3
      A3A3A3A3A3A3A3A3A3A3A3A3A3A3A5A5A5A5A5A5A5A5A5A4A4A4A3A3A3A2A2A2
      A1A1A1A2A2A2A1A1A1A1A1A1A1A1A1A0A0A0A0A0A0A0A0A0A1A1A1A3A3A3A6A6
      A6A8A8A8ACACACB2B2B2B7B7B7BBBBBBBEBEBEC0C0C0BEBEBEBABABAB4B4B4AE
      AEAEA5A5A59F9F9F9D9D9D9A9A9A9898989A9A9A9A9A9A9B9B9B9D9D9DA0A0A0
      A3A3A3A4A4A4A3A3A3A0A0A09D9D9D9A9A9A9797979595959494949696969696
      9697979798989897979797979796969696969696969696969696969695959593
      93939292929292929292929595959797979999999999999999999999999B9B9B
      A1A1A1A6A6A6A9A9A9A9A9A9A7A7A7A3A3A3A0A0A09E9E9E9D9D9D9C9C9C9A9A
      9A9999999797979797979A9A9A9E9E9EA3A3A3ABABABADADADADADADACACACA6
      A6A6A1A1A1A0A0A0A0A0A09D9D9D9D9D9D9F9F9F9D9D9D9A9A9A9B9B9B9C9C9C
      9999999A9A9A9B9B9B9A9A9A9A9A9A9C9C9C9D9D9D9E9E9E9D9D9D9D9D9D9B9B
      9B9999999898989999999898989898989898989797979797979898989999999C
      9C9C9F9F9FA1A1A1A6A6A6ADADADB3B3B3B9B9B9BEBEBEC0C0C0BEBEBEB9B9B9
      B3B3B3ACACACA3A3A39B9B9B9898989595959393939494949595959696969999
      999C9C9C9F9F9FA1A1A1A0A0A09D9D9D9A9A9A96969692929291919191919192
      9292929292939393949494939393929292919191919191919191929292929292
      9393939191919191919090909191919292929494949595959595959595959595
      959797979D9D9DA3A3A3A6A6A6A7A7A7A5A5A5A0A0A09D9D9D9A9A9A98989897
      97979696969494949393939292929494949A9A9AA0A0A0A8A8A8ACACACABABAB
      A9A9A9A4A4A49E9E9E9D9D9D9D9D9D9A9A9A9999999A9A9A9898989595959696
      9697979794949494949496969696969695959597979799999999999999999998
      9898969696949494939393949494949494949494949494949494949494949494
      9595959898989B9B9B9D9D9DA3A3A3ACACACB2B2B2B8B8B8BEBEBEC0C0C0BEBE
      BEB9B9B9B3B3B3ACACACA3A3A39B9B9B97979794949493939394949494949496
      96969999999B9B9B9E9E9EA1A1A1A0A0A09D9D9D9A9A9A979797939393929292
      9292929393939393939393939494949393939191919191919191918F7F688F7D
      63907B5F94928F94949492929292929291919193939394949495959595959595
      95959696969797979D9D9DA3A3A3A6A6A6A8A8A8A6A6A6A1A1A19D9D9D9A9A9A
      9898989797979696969494949393939292929494949A9A9AA0A0A0A7A7A7ACAC
      ACACACACA9A9A9A5A5A5A0A0A09E9E9E9D9D9D9A9A9A9999999A9A9A99999996
      9696979797979797949494949494969696959595949494979797989898999999
      9999999797979696969494949393939494949494949696969696969696969696
      969595959696969999999B9B9B9E9E9EA4A4A4ACACACB2B2B2B8B8B8BDBDBDBF
      BFBFACA08FA4937DB0ACA6A7A19999887295856E94836D989898958F8792826B
      93826C99948F9C9A9896866FA19F9D9D958A9B8F7EA1A1A197897594836D9486
      7297959398989893826C97918998969494867293826C92847095959596969694
      8A7C9385718F7550937E629A9A9A948672958D82979797918370938776938776
      948C819898989999999B9B9B9F9D9A9988729B8B749C8B75A6A29DA39F9A9887
      709E9E9E978B7A978D7F9A989593826C96928D9797979A9A9A9E9E9E9888729B
      8B74A3998BAFAFAFA8A49F9B8B74A3A3A39A8E7D9786709889769D9B989F9F9F
      95877494836D99948F98928A93826C92826B948672999999958B7D968C7E9D9D
      9D95856E9C989299918696897899999996908893826C968C7E94836D9D9D9D99
      918694846E94846E9A96919E9E9EA0A0A0A3A3A3A7A7A7ADADADB3B3B3B8B8B8
      BDBDBDBFBFBF8D6C3FA4947EB8B8B8A08F79927853A4A29FA3A3A3A1A1A19279
      58947D5EA3A3A3A5A5A5A7A7A790734C9F9382A2988A8E7045A9A9A98D6C3F9A
      8C78998B78927958A3A3A3947D5E9581659D958A8D6C3F9E9890947F6395826A
      A0A0A09076529888719B8F7E8E7045A5A5A597846B937C5EA0A0A08D6C3F9A91
      86927B5C917B5C9D9D9D9E9E9EA0A0A09F978C8D6C3FAAA6A1B1B1B1B0B0B0AC
      AAA78D6C3FA096889B8D7A90734CA6A6A690724C9A8C78A3A3A3A3A3A3A6A6A6
      A9A9A9A9A59F91744DA59B8DAFAFAF8E70459F9382A9A9A9A8A6A3957F609682
      66A8A8A88D6C3F9D9284A3A3A39279589179579F9F9FA0A0A0A1A1A19B8F7E90
      724CA6A6A69277539C8E7AA29C938D6C3FA3A19E988770927A58998B788D6C3F
      9D9385A6A6A6A6A6A69A897390734CA9A9A9AAAAAAABABABAFAFAFB3B3B3B7B7
      B7BBBBBBBEBEBEBFBFBF9D86679F8B6FBABABAA99F918D6C3F9C8B759A8A749D
      91809B8D7A90734CA9A9A9ABABABADADAD9C8970978163B0B0B08F7047A3998B
      967F61988367A4A09B8D6C3FA39D959E92818E7045AAAAAA8E7045A093829F93
      828E7045A9A9A9988367967F60A9A9A98E6F45A09587A19B938D6C3FA19F9D92
      79589787709D978E8D6C3F9D9994A0A0A0A1A1A1A4A29F8D6C3F9A856AA08F79
      A0907AB4B4B49983649B866AACA8A28D6C3FA9A39B9F917D927853AAAAAAA9A9
      A9A9A9A9A9A9A99A886F8D6C3F9E907CACACAC988468967F61ACACACA194848E
      7045968061AFAFAF9379549E907CABABAB9C8E7A90734C988872998872A0988C
      A8A6A38D6C3FA8A29AA1927F937954B0B0B091744D9F917DA49C918E7045A7A5
      A2957E60988367ABABABA7A19891744D8F7047B1B1B1B2B2B2B3B3B3B5B5B5B8
      B8B8BABABABCBCBCBEBEBEC0C0C0ADA190907147BBBBBBB8B8B88F7047A19483
      9E92818E7045A29E988D6C3FA49E96A8A49FAEACA9ABA59C8D6C3FACA8A39985
      699883679E92818E7045A6A6A69277529A8973A6A4A18D6C3FA2988A99856997
      8162B0B0B08D6C3FA49A8CA59D918D6C3FA8A6A3978266958165A3A3A390724C
      988C7C9E9C99947F639178578E6E459789759F9F9F9F9F9FA3A3A3957F609984
      67ADA9A38D6C3FAEA8A0A79B8A8F7047B6B4B1957A559D886CAFABA58D6C3FA9
      A5A0A9A9A9A6A6A6A5A5A58D6C3F9A8C79A5A5A5A5A5A59E94868D6C3FA6A4A2
      947C5A978163B1B1B1B3B3B3A39581947955AFAFAFA9A7A48D6C3F9E968B9888
      72927753ACACAC9882639B876BB2AEA88D6C3FB0AAA19F8C73977D5DB0B0B0A3
      998B947B5A9277538E7045ABABAB9D8D7691754DB3B1AEB8B8B8B9B9B9BABABA
      BBBBBBBBBBBBBDBDBDBEBEBEBFBFBFC0C0C0A796808D6C3F967B57A2927BA397
      858D6C3F9176528E6E45A0A0A09A8E7D92775390734CA39685B1B1B191744D94
      7C5A8D6C3F958165A0A0A0947F639076528E6E45988770A5A5A5957F60988367
      AEACA9977D5D977D5D8D6C3FA59B8DABABAB97856C90724C9076528F724A9D9D
      9D948168917B5C9D9D9D9A8F819179578E6E459587749B9B9B9A9A9A9C9C9C9C
      968D90724C947B598D6C3FACA59DB4B2AF8D6C3F98805E8D6C3F9E896D9F8D74
      8F7047A49E96A3A3A39E9E9E9B9B9B9586728F724A907856968A799D9D9D8E6E
      459A8D7CA0999190734C967D5B9E8C729D886C8D6C3F967D5B9E92819B8E7D90
      76528F724A917652ABABABA498878F7047A18E76907147A5947E8D6C3F987F5D
      B2B2B2ACACAC947E5F9076528E6E45A4A4A4A9A7A4937954987F5D98805EBEBE
      BEBEBEBEBEBEBEBEBEBEBFBFBFBFBFBFC0C0C0C0C0C0C0C0C0AB9F8E9E896DB4
      B4B4ABABABA1A1A19A9A9A949494949494989898A0A0A0A6A6A6ACACACACACAC
      A9A9A9A3A3A39C9C9C9797979494949494949696969898989B9B9B9F9F9F9B8F
      7E8E7045AFAFAFB3B3B3B4B4B4B2B2B2ACACACA3A3A39B9B9B96969694949493
      9393949494979797978E839C9A97A0A0A0A1A1A1A0A0A09D9D9D9A9A9A969696
      9494949494949898989D9D9DA3A3A3A9A9A9AFAFAFB5B5B5BABABABBBBBBBABA
      BAB5B5B5ACACACA2A2A29898989191918C8C8C8C8C8C8E8E8E8F8F8F91919192
      9292928E88938D85999999A0A0A0A7A7A7AFAFAFB3B3B39D8B729D8C76A3A3A3
      9A9A9A9494949494949A9A9AA4A4A4AFAFAFB7B7B7BDBDBDC0C0C0C0C0C0BEBE
      BEB9B9B9B2B2B2A7A7A79D9D9D969696949494999999A2A2A2ACACACB5B5B5BC
      BCBCBFBFBFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0BDBDBD
      AFA9A1AFAFAFA3A3A39494948A8A8A8484848585858B8B8B9696969F9F9FA5A5
      A5A6A6A6A0A0A09696968C8C8C8585858383838585858A8A8A8E8E8E93939397
      97979C9A979E968BAAA8A5B2B2B2B2B2B2AEAEAEA5A5A59797978C8C8C858585
      8383838484848989898F8F8F938A7F999795A0A0A0A3A3A3A3A3A3A0A0A09A9A
      9A9494948E8E8E8B8B8B8B8B8B8D8D8D9393939A9A9AA3A3A3ABABABB2B2B2B5
      B5B5B4B4B4AEAEAEA3A3A39595958989898282827E7E7E808080858585898989
      8B8B8B8B8B8B8985808A81768B8B8B9191919A9A9AA3A3A3ABABABACACACA39D
      949D9D9D9191918989898888888E8E8E9A9A9AA8A8A8B3B3B3BBBBBBBFBFBFC0
      C0C0BEBEBEB8B8B8AFAFAFA2A2A29494948A8A8A8787878B8B8B969696A4A4A4
      B1B1B1BABABABEBEBEC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0BCBCBCB5B5B5A9A9A99A9A9A8A8A8A7E7E7E7878787A7A7A8484849191919C
      9C9CA3A3A3A1A1A19999998B8B8B8080807979797878787D7D7D8585858C8C8C
      9393939898989D9D9DA3A3A3ACACACB1B1B1B0B0B0A9A9A99D9D9D8E8E8E8080
      8079797980736389714E8979628F8D8A96928C998F81A19D97A6A6A6A6A6A6A4
      A4A49F9F9F9797978F8F8F8888888282828080808282828888889191919B9B9B
      A6A6A6ACACACACACACA6A6A69999998A8A8A7D7D7D7676767676767C7C7C8585
      858C8C8C8E8E8E8D8D8D8888888484848282828585858C8C8C979797A1A1A1A6
      A6A6A3A3A39999998B8B8B8282827E7E7E828282909090A0A0A0AEAEAEB8B8B8
      BEBEBEC0C0C0BEBEBEB8B8B8AEAEAEA0A0A08F8F8F8282827D7D7D8080808C8C
      8C9C9C9CABABABB6B6B6BDBDBDC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0BCBCBCB3B3B3A6A6A6959595838383767676717171757575828282
      9292929E9E9EA3A3A3A1A1A19595958585857878787171717171717979798484
      848E8E8E9494949B9B9BA0A0A0A5A5A5ACACACAFAFAFADADADA6A6A698989886
      868678787872727278716980786C8A7F71907E6595826A9D9180927853998569
      AEAEAEACACACA6A6A69D9D9D9494948A8A8A8080807979797777777979798080
      808B8B8B979797A0A0A0A1A1A19D9D9D9191918080807575756F6F6F7272727D
      7D7D8A8A8A9393939797979696968E8E8E8585857E7E7E7D7D7D8282828B8B8B
      9696969E9E9E9E9E9E9797978989897D7D7D7777777A7A7A878787989898A9A9
      A9B5B5B5BCBCBCBFBFBFBEBEBEB9B9B9AFAFAFA0A0A08E8E8E7E7E7E76767678
      7878828282949494A5A5A5B3B3B3BBBBBBBFBFBFC0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0BCBCBC9D9D9D7D7D7D6F6F6F6060605656565A5A5A7272
      72818181939393A0A0A09C9C9C7A7A7A6F6F6F62626257575751515151515158
      58586262626969699494949A9A9A9D9D9DA1A1A1A8A8A8ABABABA0A0A07B7B7B
      6F6F6F6262625858585353535454545D5D5D8B8B8B9A9A9AA5A3A09E8D778F70
      478D6C3F91754DA59987ACABA8A6A6A69C9C9C9191918585857979797272726F
      6F6F7272727B7B7B8787879191918484844141412323231F1F1F1C1C1C1B1B1B
      1D1D1D202020363636626262A2A2A2A0A0A09797978C8C8C8181817979797979
      795858582323232626262626265454548A8A8A7B7B7B7373737575757E7E7E8F
      8F8FA1A1A1AFAFAFB8B8B89A9A9A2F2F2F2F2F2F2C2C2C3D3D3D9191917E7E7E
      7474747373737B7B7B8C8C8CA0A0A0AFAFAFB9B9B9BEBEBEC0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C05E5E5E00000000000000000000000000000007
      07077272728181819494946666660B0B0B000000000000000000000000000000
      0000000000000000000000007676769696969999999B9B9BA0A0A07171710B0B
      0B0000000000000000000000000000000000000000007373739E9E9EABABABB4
      B4B4B6B4B19A84658D6C3F8D6C3F8F70479D8D76A5A3A09A9A9A8E8E8E808080
      7575756E6E6E6C6C6C7070707A7A7A6C6C6C0909090000000000000000000000
      000000000000000000000000000000000B0B0B767676A3A3A39696968888887B
      7B7B7575756969690000000000000000001313138D8D8D7F7F7F757575727272
      787878858585979797A5A5A5B0B0B0B6B6B60B0B0B0000000000000000008484
      84838383767676727272787878868686999999AAAAAAB6B6B6BDBDBDC0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0A9A9A9000000000000000000000000111111
      1D1D1D1C1C1C5D5D5D8181819494940B0B0B0000000000000000000808081D1D
      1D1B1B1B1A1A1A1C1C1C1E1E1E20202057575790909091919192929295959514
      14140000000000000000000808081E1E1E1C1C1C1C1C1C1F1F1F5959599C9388
      A39685B3AFA9BCBCBCBDBDBDA89A869071478D6C3F8D6C3F8F70479A89739A98
      958C8C8C7E7E7E7272726B6B6B6969696F6F6F0F0F0F00000000000000000007
      07073838385252525757573A3A3A090909000000000000000000424242A0A0A0
      9191918080807575757474741717170000000000000000007575758484847777
      777070707272727C7C7C8B8B8B9A9A9AA6A6A6AFAFAF44444400000000000000
      00005757578A8A8A797979727272757575818181939393A5A5A5B2B2B2BBBBBB
      BFBFBFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C09191910000000000000000000000
      008383837B7B7B7272727373737E7E7E90909000000000000000000000000075
      75757D7D7D6F6F6F6969696B6B6B7272727C7C7C848484868686858585858585
      8787870000000000000000000000006666667D7D7D7373737272727B7B7B8C8C
      8C9E9E9EADADADADA59AAB9F8EB7B3AEBCBCBCB3ADA592754F8D6C3F8D6C3F8D
      6C3F8E704593887B8888887979796D6D6D676767555555000000000000000000
      0000005959597171716F6F6F7575758282828383831F1F1F0000000000000000
      0040404099999987878778787872727243434300000000000000000041414188
      88887A7A7A7070706E6E6E7373738080808E8E8E9C9C9CA6A6A6797979000000
      0000000000001E1E1E9090907E7E7E7373737272727B7B7B8C8C8C9F9F9FAFAF
      AFB9B9B9BEBEBEC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0A8A8A800000000000000
      00000000009292928080807575757272727979798A8A8A0A0A0A000000000000
      0000008383838282827272726969696868686E6E6E7777777E7E7E8080807D7D
      7D7A7A7A7B7B7B0808080000000000000000007B7B7B82828276767672727278
      7878858585979797A6A6A6B2B2B2B7B7B7AEA69AA59783ABA193B7B5B292754F
      8D6C3F8D6C3F8D6C3F8D6C3F8D7B627F7F7F7272726969694E4E4E0000000000
      000000000000007A7A7A7373737070707373737E7E7E91919198989820202000
      00000000000000005A5A5A8E8E8E7C7C7C737373656565000000000000000000
      1313138C8C8C7E7E7E7171716A6A6A6C6C6C7575758282829191919E9E9EA9A9
      A90B0B0B00000000000000000084848484848476767672727278787886868699
      9999AAAAAAB6B6B6BDBDBDC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0242424
      0000000000000000007B7B7B8484847575756F6F6F7474748181813737370000
      000000000000005757578787877676766B6B6B6969696C6C6C7575757B7B7B7C
      7C7C7979797373737272722C2C2C0000000000000000005151518787877B7B7B
      7474747575757E7E7E8E8E8E9D9D9DA6A6A6ACACACAFAFAFAFAFAFA9A095977D
      5D8D6C3F8D6C3F8D6C3F8D6C3F8D6C3F8D6C3F8974587878786F6F6F5E5E5E00
      00000000000000000000007F7F7F7878787272727272727A7A7A8B8B8B9D9D9D
      9797970000000000000000000B0B0B9494948282827575757272721717170000
      000000000000006363638282827373736969696868686E6E6E7B7B7B8B8B8B9A
      9A9AA6A6A64242420000000000000000005858588A8A8A7A7A7A727272757575
      818181939393A5A5A5B2B2B2BBBBBBBFBFBFC0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C06C6C6C0000000000000000004444448585857575756C6C6C6E6E6E7878785D
      5D5D0000000000000000001D1D1D6969695D5D5D545454515151525252565656
      5A5A5A5A5A5A7474746E6E6E6C6C6C4E4E4E0000000000000000001C1C1C8E8E
      8E8282827878787575757A7A7A8585859191919999999E9E9EA1A1A1A3A3A3A7
      A7A7ABABABA49C9190734C8D6C3F8D6C3F8D6C3F8D6C3F8D6C3F7F7567737373
      7272720F0F0F0000000000000000006D6D6D7E7E7E7575757272727676768484
      84979797A8A8A838383800000000000000000061616187878778787871717142
      42420000000000000000003737378888887878786C6C6C6868686C6C6C797979
      8A8A8A9A9A9AA8A8A87B7B7B0000000000000000001F1F1F9191917E7E7E7474
      747373737B7B7B8C8C8CA0A0A0AFAFAFB9B9B9BEBEBEC0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0A8A8A80000000000000000001414148888887676766B6B6B696969
      6F6F6F7C7C7C0909090000000000000000000000000000000000000000000000
      000000000000000000005E5E5E6E6E6E6C6C6C70707008080800000000000000
      00008484848B8B8B8080807979797979797F7F7F8787878D8D8D929292949494
      9797979D9D9DA3A3A3A5A5A5A3A3A39280678D6C3F8D6C3F8D6C3F8D6C3F8B6C
      427979797B7B7B3939390000000000000000003F3F3F8686867B7B7B73737374
      74747E7E7E8F8F8FA0A0A06D6D6D0000000000000000003232328B8B8B7A7A7A
      7171716363630000000000000000000909098C8C8C7D7D7D6F6F6F6969696C6C
      6C7979798B8B8B9B9B9BAAAAAAB5B5B50B0B0B00000000000000000085858585
      8585777777727272787878878787999999AAAAAAB5B5B5BDBDBDC0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C02323230000000000000000006060607878786C6C
      6C6666666969697272723030300000000000000000001212122323232020201F
      1F1F171717000000000000000000343434727272717171757575383838000000
      0000000000005A5A5A9696968A8A8A8181817D7D7D7E7E7E8282828585858888
      888B8B8B9191919797979E9E9EA1A1A19D9D9D9494948A80728C6D448D6C3F8D
      6C3F8D6C3F857968888888757575000000000000000000141414909090828282
      7878787474747979798787879797979B9B9B0000000000000000000000008585
      857B7B7B7070706F6F6F1717170000000000000000001B1B1B2121211D1D1D1B
      1B1B5353537878788A8A8A9B9B9BAAAAAAB4B4B4464646000000000000000000
      575757898989797979727272747474808080929292A3A3A3B1B1B1BABABABEBE
      BEBFBFBFBFBFBFC0C0C0C0C0C0C0C0C06B6B6B0000000000000000003636367D
      7D7D6F6F6F6666666565656B6B6B5151510000000000000000001D1D1D959595
      8F8F8F8A8A8A7575750000000000000000001010107979797A7A7A7F7F7F7070
      70000000000000000000202020A2A2A29797978D8D8D86868682828282828282
      82828585858888888E8E8E9696969E9E9EA1A1A19D9D9D94949488888882786A
      8D6C3F8D6C3F8D6C3F8A73558E8E8E9999991414140000000000000000007D7D
      7D8C8C8C7E7E7E7878787878788080808D8D8D9A9A9A33333300000000000000
      00005757577979796F6F6F6E6E6E434343000000000000000000000000000000
      0000000000002A2A2A787878878787979797A6A6A6AFAFAF7C7C7C0000000000
      000000001D1D1D8A8A8A7979796F6F6F6F6F6F7878788888889A9A9AA8A8A8B2
      B2B2B8B8B8BBBBBBBDBDBDBEBEBEC0C0C0C0C0C0A6A6A6000000000000000000
      0A0A0A8686867878786C6C6C6868686969697272720808080000000000000000
      008B8B8B9D9D9D9898989393931A1A1A0000000000000000006C6C6C8888888E
      8E8E979797141414000000000000000000979797A4A4A49B9B9B949494747474
      6969698282828B8B8B8E8E8E9494949B9B9BA3A3A3A19A929D958A9486728C78
      5C8C6D448D6C3F8D6C3F8D6C3F8A71509090909B9B9B49494900000000000000
      00004848489797978888887E7E7E7A7A7A7D7D7D858585909090606060000000
      0000000000002A2A2A7676766F6F6F6F6F6F6969690000000000000000000000
      006D6D6D6161615757575C5C5C7676768383839292929E9E9EA6A6A6ACACAC0B
      0B0B0000000000000000007878787979796E6E6E6C6C6C727272808080909090
      9E9E9EA9A9A9B2B2B2B6B6B6BABABABDBDBDC0C0C0C0C0C0BFBFBF2323230000
      0000000000000066666685858579797972727271717178787842424200000000
      0000000000353535AAAAAAA6A6A6A3A3A33B3B3B0000000000000000004C4C4C
      9A9A9A9E9E9EA5A5A5575757000000000000000000393939AFAFAFA9A9A9A3A3
      A34545450000004343439999999B9B9BA0A0A09E94868E70458D6C3F8D6C3F8D
      6C3F8D6C3F8D6C3F8D6C3F8D6C3F8D6C3F8A775E8F8F8F9A9A9A858585000000
      000000000000161616A2A2A29494948888888181817E7E7E8282828888888787
      870000000000000000000000006F6F6F7171717474747E7E7E1B1B1B00000000
      00000000006A6A6A8A8A8A7B7B7B7575757676767F7F7F8B8B8B9696969D9D9D
      A2A2A24848480000000000000000004D4D4D7A7A7A6F6F6F6C6C6C7171717A7A
      7A888888969696A1A1A1ABABABB2B2B2B7B7B7BBBBBBC0C0C0B5B5B590909047
      47470000000000000000003232326F6F6F666666606060666666828282838383
      1D1D1D0000000000000000003838388686867878780B0B0B0000000000000000
      00545454A9A9A9ACACACB0B0B0AAAAAA2323230000000000000000003A3A3A88
      88888484841616160000000B0B0BA6A6A6A9A9A9ACACAC967D5B8D6C3F8D6C3F
      8D6C3F9680619E968B978F8490877C8A817687837D8787878D8D8D969696A1A1
      A1161616000000000000000000818181A1A1A19696968C8C8C85858584848485
      85858989892B2B2B0000000000000000004C4C4C7878787D7D7D888888555555
      0000000000000000003D3D3D9393938585857B7B7B7A7A7A7E7E7E8686868E8E
      8E9494949898987D7D7D0000000000000000001A1A1A7C7C7C74747471717172
      72727A7A7A8585859090909A9A9AA3A3A3ACACACB4B4B4B9B9B9C0C0C0A8A8A8
      0000000000000000000000000000000000000000000000000000000909098585
      8596969697979720202000000000000000000000000000000000000000000000
      0000000000868686B4B4B4B6B6B6B8B8B8BBBBBBB2B2B22F2F2F000000000000
      0000000000000000000000000000000000009D9D9DB4B4B4B5B5B5987F5D8D6C
      3F8D6C3F8D6C3FABA398AFAFAFA7A7A79E9E9E9595958E8E8E8B8B8B8D8D8D93
      93939D9D9D6969690000000000000000002D2D2DACACACA3A3A39A9A9A929292
      8D8D8D8B8B8B8B8B8B4545450000000000000000003131318484848A8A8A9494
      948D8D8D0000000000000000000B0B0B9D9D9D91919187878782828283838388
      88888C8C8C9191919494949494941313130000000000000000007272727D7D7D
      7A7A7A7B7B7B7F7F7F8787878F8F8F979797A1A1A1A9A9A9B2B2B2B8B8B8C0C0
      C0C0C0C024242400000000000000000000000000000000000000000000000000
      0000636363A3A3A3ABABABB3B3B37474742F2F2F181818000000000000000000
      0C0C0C2F2F2F818181BCBCBCBCBCBCBDBDBDBEBEBEBFBFBFBFBFBFC0C0C07878
      783B3B3B1818180000000000000000000C0C0C525252BCBCBCBCBCBCBDBDBDBA
      B8B699805F8D6C3F8D6C3F8D6C3FA2927BB2B2B2AAAAAAA1A1A1999999939393
      9292929595959C9C9CA6A6A62C2C2C000000000000000000505050AFAFAFA8A8
      A8A0A0A09B9B9B9797979595954040400000000000000000002424249494949A
      9A9AA3A3A3ACACAC2222220000000000000000007474749D9D9D969696919191
      9090909292929494949797979999999A9A9A4444440000000000000000005151
      518C8C8C8A8A8A8B8B8B8C8C8C9191919797979D9D9DA4A4A4ACACACB3B3B3B9
      B9B9C0C0C0C0C0C0C0C0C0C0C0C09C9C9C0C0C0C000000000000454545B2B2B2
      ADADADAAAAAAAAAAAAAFAFAFB4B4B4B8B8B8BDBDBDBFBFBFC0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0A6967F8D6C3F8D6C3F8D6C3F98805EB2B0ADADADADA6A6
      A6A0A0A09D9D9D9D9D9DA1A1A1A9A9A9A6A6A623232300000000000000000039
      3939A7A7A7ADADADA9A9A9A5A5A58484840A0A0A000000000000000000515151
      A3A3A3A8A8A8AFAFAFB5B5B5757575000000000000000000434343ABABABA5A5
      A5A1A1A1A0A0A0A0A0A0A0A0A0A2A2A2A3A3A3A3A3A385858500000000000000
      00001414149D9D9D9C9C9C9C9C9C9D9D9D9F9F9FA3A3A3A6A6A6ABABABB1B1B1
      B6B6B6BBBBBBC0C0C0C0C0C0C0C0C0C0C0C0C0C0C08484840000000000000C0C
      0CB8B8B8B5B5B5B3B3B3B3B3B3B5B5B5B8B8B8BBBBBBBEBEBEC0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0B3ABA09071478D6C3F8D6C3F907147AC
      A498B1B1B1ACACACA9A9A9A8A8A8ABABABAFAFAFB5B5B5AFAFAF2F2F2F000000
      0000000000000000002E2E2E5A5A5A3838380000000000000000000000000B0B
      0B989898B0B0B0B4B4B4B7B7B7BBBBBBB1B1B10000000000000000000B0B0B5A
      5A5A5858585757575757575656565656565C5C5C575757575757575757000000
      0000000000000000004B4B4B565656565656565656979797ADADADAFAFAFB2B2
      B2B5B5B5BABABABCBCBCC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C06C6C6C00
      0000000000828282BBBBBBBABABABABABABBBBBBBCBCBCBEBEBEBFBFBFC0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0BDBBB89A815F8D6C3F
      8D6C3F8D6C3FA2927CB5B5B5B3B3B3B2B2B2B3B3B3B5B5B5B9B9B9BCBCBCBEBE
      BE7878781818180000000000000000000000000000000000000000000000000B
      0B0B898989B8B8B8BABABABBBBBBBDBDBDBEBEBEBFBFBF3C3C3C000000000000
      0000000000000000000000000000000000000000002B2B2B0000000000000000
      00000000000000000000000000000000000000000000000000505050B7B7B7B8
      B8B8B9B9B9BBBBBBBCBCBCBEBEBEC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0484848000000484848BFBFBFBEBEBEBEBEBEBEBEBEBFBFBFBFBFBFC0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0A6967F9071478D6C3F8D6C3FAB9F8EBBBBBBBABABABABABABBBBBBBCBCBCBE
      BEBEBFBFBFC0C0C0C0C0C09C9C9C6C6C6C6060606060606060605F5F5F5F5F5F
      828282B2B2B2BEBEBEBEBEBEBFBFBFBFBFBFBFBFBFC0C0C0C0C0C09090906060
      606060606060606060605F5F5F5F5F5F5F5F5F5F5F5F5F5F5F6969695F5F5F5F
      5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F767676
      BEBEBEBEBEBEBEBEBEBFBFBFBFBFBFBFBFBFC0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0BAB5B0A08B6F907147ACA08FBFBFBFBEBEBEBEBEBEBEBEBE
      BFBFBFBFBFBFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000FB3600000600666D
      76527561000200910000001E000000D80000000A00000041000000F401000000
      0000000000FFFFFF1F2C02000000000001000A005275613A205B5275615D0000
      0000FFFF0000000000020000000100000000090068656C766574696361000700
      0000000000000000100000000100020000000000FFFFFF000000000200000000
      00000000008A3700000900666D764369646164650002009100000034000000D6
      0000000A00000041000000F4010000000000000000FFFFFF1F2C020000000000
      010009005B4369646164655D2000000000FFFF00000000000200000001000000
      00090068656C7665746963610007000000000000000000100000000100020000
      000000FFFFFF00000000020000000000000000001A3800000700666D76466F6E
      65000200910000003F000000D60000000A00000041000000F401000000000000
      0000FFFFFF1F2C02000000000001000C00466F6E653A205B466F6E655D000000
      00FFFF0000000000020000000100000000090068656C76657469636100070000
      00000000000000100000000100020000000000FFFFFF00000000020000000000
      00000000A93800000900666D76546974756C6F0002006D0100001D0000000E01
      00001200000043000000F4010000000000000000FFFFFF1F2C02000000000001
      0009005B546974756C6F5D2000000000FFFF0000000000020000000100000006
      090068656C766574696361000B00000002000000000002000000000002000000
      0000FFFFFF0000000002000000000000000000473900000700666D7644617461
      000200820200001D0000005A0000000D00000043000000F40100000000000000
      00FFFFFF1F2C02000000000001001A0044617461203A205B4441544520234464
      642F6D6D2F797979795D00000000FFFF00000000000200000001000000060900
      68656C7665746963610008000000000000000000110000000100020000000000
      FFFFFF0000000002000000000000000000DA3900000900666D76506167696E61
      000200820200002B0000004A0000001100000043000000F40100000000000000
      00FFFFFF1F2C02000000000001000D00506167203A205B50414745235D000000
      00FFFF0000000000020000000100000000090068656C76657469636100080000
      00000000000000000000000100020000000000FFFFFF00000000020000000000
      000000006F3A00000700666D76486F726100020034000000BA03000058000000
      0B00000043000000F4010000000000000000FFFFFF1F2C020000000000010011
      005B54494D4520235468683A6D6D3A73735D00000000FFFF0000000000020000
      000100000000090068656C766574696361000700000000000000000010000000
      0100020000000000FFFFFF00000000020000000000000000001C3B0000100066
      6D76446573656E766F6C7665646F72000200FF010000BA030000D00000000B00
      000043000000F4010000000000000000FFFFFF1F2C0200000000000100200074
      6563534F4654202D205465636E6F6C6F67696120656D2053697374656D617300
      000000FFFF0000000000020000000100000000090068656C7665746963610007
      000000000000000000110000000100020000000000FFFFFF0000000002000000
      000000000000AB3B00000900666D764F75747261730002006D01000031000000
      0F0100001B00000003000000F4010000000000000000FFFFFF1F2C0200000000
      00010009005B4F75747261735D2000000000FFFF000000000002000000010000
      0000090068656C76657469636100070000000000000000000200000001000200
      00000000FFFFFF00000000020000000000000000003A3C00000900666D764261
      6972726F0002009100000029000000D70000000A00000041000000F401000000
      0000000000FFFFFF1F2C020000000000010009005B42616972726F5D20000000
      00FFFF0000000000020000000100000000090068656C76657469636100070000
      00000000000000100000000100020000000000FFFFFF00000000020000000000
      00000000C83C00000A006C626C436C69656E7465000200140000009C00000075
      0000001900000043000F00F4010000000000000000FFFFFF1F2C020000000000
      01000700436C69656E746500000000FFFF000000000002000000010000000009
      0068656C76657469636100080000000000000000000A00000001000200000000
      00FFFFFF0000000002000000000000000000563D00000A006C626C456E747265
      676100020014000000B5000000750000003A00000043000F00F4010000000000
      000000FFFFFF1F2C02000000000001000700456E747265676100000000FFFF00
      00000000020000000100000000090068656C7665746963610008000000000000
      0000000A0000000100020000000000FFFFFF0000000002000000000000000000
      EA3D00000D006C626C5265736964656E63696100020014000000EF0000007500
      00003A00000043000F00F4010000000000000000FFFFFF1F2C02000000000001
      000A005265736964656E63696100000000FFFF00000000000200000001000000
      00090068656C76657469636100080000000000000000000A0000000100020000
      000000FFFFFF00000000020000000000000000007A3E00000B006C626C547261
      62616C686F0002001400000029010000750000001900000043000F00F4010000
      000000000000FFFFFF1F2C0200000000000100080054726162616C686F000000
      00FFFF0000000000020000000100000000090068656C76657469636100080000
      000000000000000A0000000100020000000000FFFFFF00000000020000000000
      00000000633F000008006C626C4E6F7461730002001400000042010000750000
      002700000043000F00F4010000000000000000FFFFFF1F2C0200000000000100
      64005B2746696C69616C20646520456D697373616F3A20275D5B4946285B7172
      7952657175697369636F65732E2266696C69616C656D697373616F225D3C3E30
      2C5B71727952657175697369636F65732E2266696C69616C656D697373616F22
      5D2C2727295D00000000FFFF0000000000020000000100000000090068656C76
      65746963610008000000000000000000020000000100020000000000FFFFFF00
      00000002000000000000000000F33F00000B006C626C436F6E747261746F0002
      001400000069010000750000002500000043000F00F4010000000000000000FF
      FFFF1F2C02000000000001000800436F6E747261746F00000000FFFF00000000
      00020000000100000000090068656C7665746963610008000000000000000000
      020000000100020000000000FFFFFF00000000020000000000000000007B4000
      0007006C626C4E6F6D650002008B000000D4FFFFFF4700000012000000430000
      00F4010000000000000000FFFFFF1F2C020000000000010004004E6F6D650000
      0000FFFF0000000000020000000100000000090068656C766574696361000A00
      0000000000000000000000000100020000000000FFFFFF000000000200000000
      0000000000404100000E006D6D6F4E6F6D65436C69656E746500020089000000
      9C000000D50100001900000043000F00F4010000000000000000FFFFFF1F2C02
      000000000001003A00205B71727952657175697369636F65732E22636C69656E
      7465225D205B71727952657175697369636F65732E226E6F6D65636C69656E74
      65225D00000000FFFF0000000000020000000100000000090068656C76657469
      63610008000000000000000000080000000100020000000000FFFFFF00000000
      02000000000000000000E741000010006D6D6F436F6469676F436C69656E7465
      000200970200009C000000450000001900000043000F00F40100000000000000
      00FFFFFF1F2C02000000000001001A005B71727952657175697369636F65732E
      226E756D65726F225D2000000000FFFF00000000000200000001000000000900
      68656C766574696361000A000000020000000000090000000100020000000000
      FFFFFF00000000020000000000000000007742000009006C626C436F6469676F
      0002005E0200009C000000390000001900000043000F00F40100000000000000
      00FFFFFF1F2C02000000000001000A005265717569736963616F00000000FFFF
      0000000000020000000100000000090068656C76657469636100080000000000
      00000000080000000100020000000000FFFFFF00000000020000000000000000
      00FD42000006006C626C5275610002008E000000B8000000340000000F000000
      43000000F4010000000000000000FFFFFF1F2C02000000000001000300527561
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      08000000000000000000000000000100020000000000FFFFFF00000000020000
      000000000000008943000009006C626C4369646164650002008E000000C90000
      00340000000F00000043000000F4010000000000000000FFFFFF1F2C02000000
      00000100060043696461646500000000FFFF0000000000020000000100000000
      090068656C766574696361000800000000000000000000000000010002000000
      0000FFFFFF00000000020000000000000000001544000009006C626C42616972
      726F0002008E000000DB000000350000000F00000043000000F4010000000000
      000000FFFFFF1F2C0200000000000100060042616972726F00000000FFFF0000
      000000020000000100000000090068656C766574696361000800000000000000
      0000000000000100020000000000FFFFFF0000000002000000000000000000A2
      4400000D006C626C436570456E7472656761000200F4010000C9000000280000
      000F00000043000000F4010000000000000000FFFFFF1F2C0200000000000100
      030043657000000000FFFF0000000000020000000100000000090068656C7665
      746963610008000000000000000000000000000100020000000000FFFFFF0000
      0000020000000000000000002A45000007006C626C466F6E65000200F4010000
      DB0000002A0000000F00000043000000F4010000000000000000FFFFFF1F2C02
      000000000001000400466F6E6500000000FFFF00000000000200000001000000
      00090068656C7665746963610008000000000000000000000000000100020000
      000000FFFFFF0000000002000000000000000000CA4500000D006D6D6F527561
      456E7472656761000200C7000000B8000000100200000F00000043000000F401
      0000000000000000FFFFFF1F2C020000000000010016005B7172795265717569
      7369636F65732E22727561225D00000000FFFF00000000000200000001000000
      00090068656C7665746963610008000000000000000000000000000100020000
      000000FFFFFF00000000020000000000000000007446000010006D6D6F436964
      616465456E7472656761000200C7000000C9000000270100000F000000430000
      00F4010000000000000000FFFFFF1F2C02000000000001001D005B7172795265
      7175697369636F65732E226E6F6D65636964616465225D00000000FFFF000000
      0000020000000100000000090068656C76657469636100080000000000000000
      00000000000100020000000000FFFFFF00000000020000000000000000001E47
      000010006D6D6F42616972726F456E7472656761000200C7000000DB00000026
      0100000F00000043000000F4010000000000000000FFFFFF1F2C020000000000
      01001D005B71727952657175697369636F65732E226E6F6D6562616972726F22
      5D00000000FFFF0000000000020000000100000000090068656C766574696361
      0008000000000000000000000000000100020000000000FFFFFF000000000200
      0000000000000000DD4700000D006D6D6F436570456E74726567610002002302
      0000C9000000890000000F00000043000000F4010000000000000000FFFFFF1F
      2C020000000000020032005B464F524D415454455854282723232E2323232D23
      2323272C205B71727952657175697369636F65732E22636570225D295D0D0000
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      08000000000000000000000000000100020000000000FFFFFF00000000020000
      00000000000000C348000011006D6D6F466F6E65444444456E74726567610002
      0023020000DB000000200000000F00000043000000F4010000000000000000FF
      FFFF1F2C020000000000020055005B4946285B71727952657175697369636F65
      732E22666F6E65646464225D3C3E302C464F524D415454455854282728232323
      29272C5B71727952657175697369636F65732E22666F6E65646464225D292C27
      27295D0D000000000000FFFF0000000000020000000100000000090068656C76
      65746963610008000000000000000000000000000100020000000000FFFFFF00
      00000002000000000000000000B949000014006D6D6F466F6E654E756D65726F
      456E747265676100020047020000DB0000004C0000000F00000043000000F401
      0000000000000000FFFFFF1F2C02000000000003005F005B4946285B71727952
      657175697369636F65732E22666F6E656E756D65726F225D3C3E302C464F524D
      4154544558542827232323232D23232323272C5B71727952657175697369636F
      65732E22666F6E656E756D65726F225D292C2727295D0D00000D000000000000
      FFFF0000000000020000000100000000090068656C7665746963610008000000
      000000000000000000000100020000000000FFFFFF0000000002000000000000
      0000009E4A000013006D6D6F466F6E6552616D616C456E747265676100020097
      020000DB000000400000000F00000043000000F4010000000000000000FFFFFF
      1F2C02000000000003004F005B4946285B71727952657175697369636F65732E
      22666F6E6572616D616C225D3C3E27272C2752616D616C20272B5B7172795265
      7175697369636F65732E22666F6E6572616D616C225D2C2727295D0D00000D00
      0000000000FFFF0000000000020000000100000000090068656C766574696361
      0008000000000000000000000000000100020000000000FFFFFF000000000200
      00000000000000002E4B000010006C626C5275615265736964656E6369610002
      008D000000F0000000360000000F00000043000000F4010000000000000000FF
      FFFF1F2C0200000000000100030052756100000000FFFF000000000002000000
      0100000000090068656C76657469636100080000000000000000000000000001
      00020000000000FFFFFF0000000002000000000000000000C44B000013006C62
      6C4369646164655265736964656E6369610002008D0000000201000036000000
      0F00000043000000F4010000000000000000FFFFFF1F2C020000000000010006
      0043696461646500000000FFFF0000000000020000000100000000090068656C
      7665746963610008000000000000000000000000000100020000000000FFFFFF
      00000000020000000000000000005A4C000013006C626C42616972726F526573
      6964656E6369610002008D00000014010000370000000F00000043000000F401
      0000000000000000FFFFFF1F2C0200000000000100060042616972726F000000
      00FFFF0000000000020000000100000000090068656C76657469636100080000
      00000000000000000000000100020000000000FFFFFF00000000020000000000
      00000000EA4C000010006D6D6F4365705265736964656E636961000200F40100
      0002010000280000000F00000043000000F4010000000000000000FFFFFF1F2C
      0200000000000100030043657000000000FFFF00000000000200000001000000
      00090068656C7665746963610008000000000000000000000000000100020000
      000000FFFFFF00000000020000000000000000007C4D000011006C626C466F6E
      655265736964656E636961000200F4010000140100002A0000000F0000004300
      0000F4010000000000000000FFFFFF1F2C02000000000001000400466F6E6500
      000000FFFF0000000000020000000100000000090068656C7665746963610008
      000000000000000000000000000100020000000000FFFFFF0000000002000000
      000000000000334E000013006D6D6F42616972726F5265736964656E63696100
      0200C700000014010000270100000F00000043000000F4010000000000000000
      FFFFFF1F2C020000000000010027005B71727952657175697369636F65732E22
      6E6F6D6562616972726F7265736964656E636961225D00000000FFFF00000000
      00020000000100000000090068656C7665746963610008000000000000000000
      000000000100020000000000FFFFFF0000000002000000000000000000E34E00
      0013006D6D6F5275615265736964656E636961636961000200C7000000F00000
      00100200000F00000043000000F4010000000000000000FFFFFF1F2C02000000
      0000010020005B71727952657175697369636F65732E22727561726573696465
      6E636961225D00000000FFFF0000000000020000000100000000090068656C76
      65746963610008000000000000000000000000000100020000000000FFFFFF00
      000000020000000000000000009A4F000013006D6D6F43696461646552657369
      64656E636961000200C700000002010000270100000F00000043000000F40100
      00000000000000FFFFFF1F2C020000000000010027005B717279526571756973
      69636F65732E226E6F6D656369646164657265736964656E636961225D000000
      00FFFF0000000000020000000100000000090068656C76657469636100080000
      00000000000000000000000100020000000000FFFFFF00000000020000000000
      000000006C50000013006D6D6F4365705265736964656E636961636961000200
      2302000002010000800000000F00000043000000F4010000000000000000FFFF
      FF1F2C02000000000003003C005B464F524D415454455854282723232E232323
      2D232323272C205B71727952657175697369636F65732E226365707265736964
      656E636961225D295D0D00000D000000000000FFFF0000000000020000000100
      000000090068656C766574696361000800000000000000000000000000010002
      0000000000FFFFFF00000000020000000000000000006F51000014006D6D6F46
      6F6E654444445265736964656E6369610002002302000014010000200000000F
      00000043000000F4010000000000000000FFFFFF1F2C02000000000004006900
      5B4946285B71727952657175697369636F65732E22666F6E6564646472657369
      64656E636961225D3C3E302C464F524D41545445585428272823232329272C5B
      71727952657175697369636F65732E22666F6E656464647265736964656E6369
      61225D292C2727295D0D00000D00000D000000000000FFFF0000000000020000
      000100000000090068656C766574696361000800000000000000000000000000
      0100020000000000FFFFFF00000000020000000000000000007952000017006D
      6D6F466F6E654E756D65726F5265736964656E63696100020047020000140100
      004A0000000F00000043000000F4010000000000000000FFFFFF1F2C02000000
      0000020073005B4946285B71727952657175697369636F65732E22666F6E656E
      756D65726F7265736964656E636961225D3C3E302C464F524D41545445585428
      27232323232D23232323272C5B71727952657175697369636F65732E22666F6E
      656E756D65726F7265736964656E636961225D292C2727295D0D000000000000
      FFFF0000000000020000000100000000090068656C7665746963610008000000
      000000000000000000000100020000000000FFFFFF0000000002000000000000
      0000006F53000016006D6D6F466F6E6552616D616C5265736964656E63696100
      02009702000014010000410000000F00000043000000F4010000000000000000
      FFFFFF1F2C020000000000010063005B4946285B71727952657175697369636F
      65732E22666F6E6572616D616C7265736964656E636961225D3C3E27272C2752
      616D616C20272B5B71727952657175697369636F65732E22666F6E6572616D61
      6C7265736964656E636961225D2C2727295D00000000FFFF0000000000020000
      000100000000090068656C766574696361000800000000000000000000000000
      0100020000000000FFFFFF0000000002000000000000000000125400000B006D
      6D6F436F6E747261746F0002001B0000007B0100006B00000012000000430000
      00F4010000000000000000FFFFFF1F2C02000000000001001B005B7172795265
      7175697369636F65732E22636F6E747261746F225D00000000FFFF0000000000
      020000000100000000090068656C76657469636100080000000000000000000A
      0000000100020000000000FFFFFF0000000002000000000000000000FD540000
      10006C626C46696C69616C646556656E6461000200140000008E010000750000
      002400000043000F00F4010000000000000000FFFFFF1F2C0200000000000100
      5E005B2746696C69616C2064652056656E64613A20275D5B4946285B71727952
      657175697369636F65732E2266696C69616C76656E6461225D3C3E302C5B7172
      7952657175697369636F65732E2266696C69616C76656E6461225D2C2727295D
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      08000000000000000000020000000100020000000000FFFFFF00000000020000
      00000000000000F455000013006C626C46696C69616C64654D6F6E746167656D
      00020014000000B2010000750000003E00000043000F00F40100000000000000
      00FFFFFF1F2C020000000000010067005B2746696C69616C206465204D6F6E74
      6167656D3A20275D5B4946285B71727952657175697369636F65732E2266696C
      69616C6D6F6E746167656D225D3C3E302C5B71727952657175697369636F6573
      2E2266696C69616C6D6F6E746167656D225D2C2727295D00000000FFFF000000
      0000020000000100000000090068656C76657469636100080000000000000000
      00020000000100020000000000FFFFFF00000000020000000000000000009B56
      000016006C626C4F627365727661636F65734D6F6E746167656D000200890000
      00B20100007D0100003E00000043000F00F4010000000000000000FFFFFF1F2C
      020000000000010014004F627365727661636F6573204D6F6E746167656D0000
      0000FFFF0000000000020000000100000000090068656C766574696361000800
      0000000000000000020000000100020000000000FFFFFF000000000200000000
      00000000004C57000016006D6D6F4F627365727661636F65734D6F6E74616765
      6D0002008E000000C7010000740100002800000043000000F401000000000000
      0000FFFFFF1F2C02000000000001001E005B71727952657175697369636F6573
      2E226F627365727661636F6573225D00000000FFFF0000000000020000000100
      000000090068656C766574696361000800000000000000000000000000010002
      0000000000FFFFFF0000000002000000000000000000DC5700000B006C626C56
      656E6465646F7200020006020000B2010000D60000003E00000043000F00F401
      0000000000000000FFFFFF1F2C0200000000000100080056656E6465646F7200
      000000FFFF0000000000020000000100000000090068656C7665746963610008
      000000000000000000020000000100020000000000FFFFFF0000000002000000
      0000000000007058000011006C626C436F6469676F56656E6465646F72000200
      0A020000C80100002F0000001100000043000000F4010000000000000000FFFF
      FF1F2C02000000000001000600436F6469676F00000000FFFF00000000000200
      00000100000000090068656C7665746963610008000000000000000000000000
      000100020000000000FFFFFF0000000002000000000000000000005900000F00
      6C626C4E6F6D6556656E6465646F720002000A020000DC010000300000001100
      000043000000F4010000000000000000FFFFFF1F2C020000000000010004004E
      6F6D6500000000FFFF0000000000020000000100000000090068656C76657469
      63610008000000000000000000000000000100020000000000FFFFFF00000000
      02000000000000000000A959000011006D6D6F436F6469676F56656E6465646F
      7200020040020000C7010000200000001100000043000000F401000000000000
      0000FFFFFF1F2C02000000000001001B005B71727952657175697369636F6573
      2E2276656E6465646F72225D00000000FFFF0000000000020000000100000000
      090068656C766574696361000800000000000000000001000000010002000000
      0000FFFFFF0000000002000000000000000000545A00000F006D6D6F4E6F6D65
      56656E6465646F7200020040020000DC010000980000001100000043000000F4
      010000000000000000FFFFFF1F2C02000000000001001F005B71727952657175
      697369636F65732E226E6F6D6576656E6465646F72225D00000000FFFF000000
      0000020000000100000000090068656C76657469636100080000000000000000
      00000000000100020000000000FFFFFF0000000002000000000000000000035B
      000018006C626C4F627365727661636F65734E6F746146697363616C00020089
      00000069010000530200004900000043000F00F4010000000000000000FFFFFF
      1F2C02000000000001001A004F627365727661636F6573206461204E6F746120
      46697363616C00000000FFFF0000000000020000000100000000090068656C76
      65746963610008000000000000000000020000000100020000000000FFFFFF00
      00000002000000000000000000B85B000018006D6D6F4F627365727661636F65
      734E6F746146697363616C000200910000007D01000048020000320000004300
      0000F4010000000000000000FFFFFF1F2C020000000000010020005B71727952
      657175697369636F65732E226F62736461646F66697363616C225D00000000FF
      FF0000000000020000000100000000090068656C766574696361000800000000
      0000000000000000000100020000000000FFFFFF000000000200000000000000
      0000485C00000B006C626C4D6F6E7461646F720002001A000000090300003F00
      00001200000043000000F4010000000000000000FFFFFF1F2C02000000000001
      0008004D6F6E7461646F7200000000FFFF000000000002000000010000000009
      0068656C76657469636100080000000000000000000000000001000200000000
      00FFFFFF0000000002000000000000000000F15C000011006D6D6F436F646967
      6F6D6F6E7461646F720002005F00000009030000260000001200000043000000
      F4010000000000000000FFFFFF1F2C02000000000001001B005B717279526571
      75697369636F65732E226D6F6E7461646F72225D00000000FFFF000000000002
      0000000100000000090068656C76657469636100080000000000000000000000
      00000100020000000000FFFFFF00000000020000000000000000009C5D00000F
      006D6D6F4E6F6D654D6F6E7461646F720002008800000009030000EE00000012
      00000043000000F4010000000000000000FFFFFF1F2C02000000000001001F00
      5B71727952657175697369636F65732E226E6F6D656D6F6E7461646F72225D00
      000000FFFF0000000000020000000100000000090068656C7665746963610008
      000000000000000000000000000100020000000000FFFFFF0000000002000000
      0000000000004E5E00000F006C626C446174614D6F6E746167656D0002001900
      000027030000F30000001200000043000000F4010000000000000000FFFFFF1F
      2C0200000000000100260044617461206461204D6F6E746167656D3A20202020
      2020202020202F2020202020202020202F00000000FFFF000000000002000000
      0100000000090068656C76657469636100080000000000000000000000000001
      00020000000000FFFFFF0000000002000000000000000000165F000013006C62
      6C4D6F6E746167656D5065726665697461000200380100002703000014010000
      1200000043000000F4010000000000000000FFFFFF1F2C020000000000010038
      004D6F6E746167656D2050657266656974612020202020202028202020202020
      292053696D20202020202020202820202020202029204E616F00000000FFFF00
      00000000020000000100000000090068656C7665746963610008000000000000
      000000000000000100020000000000FFFFFF0000000002000000000000000000
      AC5F00000E006C626C4F627365727661636F65730002001A0000004003000061
      0000001200000043000000F4010000000000000000FFFFFF1F2C020000000000
      01000B004F627365727661636F657300000000FFFF0000000000020000000100
      000000090068656C766574696361000800000000000000000000000000010002
      0000000000FFFFFF00000000020000000000000000006D60000017006C626C45
      6D6974656E746564615265717569736963616F000200360000007D0300009C00
      00002500000043000000F4010000000000000000FFFFFF1F2C02000000000002
      0014005F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F0D1600456D6974656E
      7465206461205265717569736963616F00000000FFFF00000000000200000001
      00000000090068656C766574696361000A000000000000000000000000000100
      020000000000FFFFFF00000000020000000000000000002A61000016006C626C
      417373696E6174757261646F436C69656E7465000200470100007B0300009300
      00002500000043000000F4010000000000000000FFFFFF1F2C02000000000002
      0012005F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F0D1500417373696E617475
      726120646F20436C69656E746500000000FFFF00000000000200000001000000
      00090068656C766574696361000A000000000000000000000000000100020000
      000000FFFFFF0000000002000000000000000000DB61000011006C626C4E6F6D
      65646F4D6F6E7461646F72000200520200007903000083000000270000004300
      0000F4010000000000000000FFFFFF1F2C020000000000020010005F5F5F5F5F
      5F5F5F5F5F5F5F5F5F5F5F0D10004E6F6D6520646F204D6F6E7461646F720000
      0000FFFF0000000000020000000100000000090068656C766574696361000A00
      0000000000000000000000000100020000000000FFFFFF000000000200000000
      00000000007962000005004D656D6F3100020014000000340200006E0000000B
      00000040000400F4010000000000000000FFFFFF1F2C02000000000001001C00
      205B71727952657175697369636F65732E2270726F6475746F225D2000000000
      FFFF0000000000020000000100000006090068656C7665746963610008000000
      000000000000110000000100020000000000FFFFFF0000000002000000000000
      0000001463000005004D656D6F320002008200000034020000180000000B0000
      0040000400F4010000000000000000FFFFFF1F2C020000000000010019005B71
      727952657175697369636F65732E2266696C69616C225D00000000FFFF000000
      0000020000000100000006090068656C76657469636100080000000000000000
      00120000000100020000000000FFFFFF0000000002000000000000000000AA63
      000005004D656D6F330002009B00000034020000430000000B00000040000400
      F4010000000000000000FFFFFF1F2C020000000000010014005B5155414E5449
      4441444550524F4455544F5D2000000000FFFF00000000000200000001000000
      06090068656C7665746963610008000000000000000000110000000100020000
      000000FFFFFF00000000020000000000000000005064000005004D656D6F3400
      0200DB00000034020000510100000B00000040000400F4010000000000000000
      FFFFFF1F2C02000000000001002400205B71727952657175697369636F65732E
      2264657363726963616F70726F6475746F225D00000000FFFF00000000000200
      00000100000006090068656C7665746963610008000000000000000000100000
      000100020000000000FFFFFF0000000002000000000000000000ED6400000600
      4D656D6F31300002008D0000002F0100005F0100001100000043000000F40100
      00000000000000FFFFFF1F2C02000000000001001A005B717279526571756973
      69636F65732E22656D7072657361225D00000000FFFF00000000000200000001
      00000000090068656C7665746963610008000000000000000000000000000100
      020000000000FFFFFF00000000020000000000000000007465000006004D656D
      6F3131000200F40100002F0100002A0000001100000043000000F40100000000
      00000000FFFFFF1F2C02000000000001000400466F6E6500000000FFFF000000
      0000020000000100000000090068656C76657469636100080000000000000000
      00000000000100020000000000FFFFFF00000000020000000000000000006066
      000006004D656D6F3132000200230200002F0100002000000011000000430000
      00F4010000000000000000FFFFFF1F2C020000000000030063005B4946285B71
      727952657175697369636F65732E22666F6E65646464656D7072657361225D3C
      3E302C464F524D41545445585428272823232329272C5B717279526571756973
      69636F65732E22666F6E65646464656D7072657361225D292C2727295D0D0000
      0D000000000000FFFF0000000000020000000100000000090068656C76657469
      63610008000000000000000000000000000100020000000000FFFFFF00000000
      020000000000000000005667000006004D656D6F3133000200470200002F0100
      004A0000001100000043000000F4010000000000000000FFFFFF1F2C02000000
      000003006D005B4946285B71727952657175697369636F65732E22666F6E656E
      756D65726F656D7072657361225D3C3E302C464F524D41545445585428272323
      23232D23232323272C5B71727952657175697369636F65732E22666F6E656E75
      6D65726F656D7072657361225D292C2727295D0D00000D000000000000FFFF00
      00000000020000000100000000090068656C7665746963610008000000000000
      000000000000000100020000000000FFFFFF0000000002000000000000000000
      3668000006004D656D6F3134000200970200002F010000410000001100000043
      000000F4010000000000000000FFFFFF1F2C02000000000001005D005B494628
      5B71727952657175697369636F65732E22666F6E6572616D616C656D70726573
      61225D3C3E27272C2752616D616C20272B5B71727952657175697369636F6573
      2E22666F6E6572616D616C656D7072657361225D2C2727295D00000000FFFF00
      00000000020000000100000000090068656C7665746963610008000000000000
      000000000000000100020000000000FFFFFF0000000002000000000000000000
      DB68000006004D656D6F3231000200180000009D0100006E0000001300000043
      000000F4010000000000000000FFFFFF1F2C020000000000010022005B717279
      52657175697369636F65732E226E6F6D6566696C69616C76656E6461225D0000
      0000FFFF0000000000020000000100000000090068656C766574696361000700
      0000000000000000080000000100020000000000FFFFFF000000000200000000
      00000000008369000006004D656D6F323200020017000000C40100006E000000
      2600000043000000F4010000000000000000FFFFFF1F2C020000000000010025
      005B71727952657175697369636F65732E226E6F6D6566696C69616C6D6F6E74
      6167656D225D00000000FFFF0000000000020000000100000000090068656C76
      65746963610007000000000000000000080000000100020000000000FFFFFF00
      000000020000000000000000002A6A000006004D656D6F323400020017000000
      500100006E0000001600000043000000F4010000000000000000FFFFFF1F2C02
      0000000000010024005B71727952657175697369636F65732E226E6F6D656669
      6C69616C656D697373616F225D00000000FFFF00000000000200000001000000
      00090068656C7665746963610007000000000000000000080000000100020000
      000000FFFFFF0000000002000000000000000000B76A000005004D656D6F3800
      02008900000042010000F50000002700000043000F00F4010000000000000000
      FFFFFF1F2C02000000000001000B004E6F74612046697363616C00000000FFFF
      0000000000020000000100000000090068656C76657469636100080000000000
      00000000020000000100020000000000FFFFFF00000000020000000000000000
      00466B000006004D656D6F32350002007E010000420100005E01000027000000
      43000F00F4010000000000000000FFFFFF1F2C02000000000001000C00437570
      6F6D2046697363616C00000000FFFF0000000000020000000100000000090068
      656C7665746963610008000000000000000000020000000100020000000000FF
      FFFF0000000002000000000000000000CE6B000006004D656D6F323600020090
      000000540100001F0000001100000043000000F4010000000000000000FFFFFF
      1F2C02000000000001000500536572696500000000FFFF000000000002000000
      0100000000090068656C76657469636100080000000000000000000000000001
      00020000000000FFFFFF0000000002000000000000000000576C000006004D65
      6D6F3237000200E8000000540100002F0000001100000043000000F401000000
      0000000000FFFFFF1F2C020000000000010006004E756D65726F00000000FFFF
      0000000000020000000100000000090068656C76657469636100080000000000
      00000000000000000100020000000000FFFFFF00000000020000000000000000
      00E16C000006004D656D6F323800020084010000540100002F00000011000000
      43000000F4010000000000000000FFFFFF1F2C020000000000010007004D6171
      75696E6100000000FFFF0000000000020000000100000000090068656C766574
      6963610008000000000000000000000000000100020000000000FFFFFF000000
      00020000000000000000006F6D000006004D656D6F3239000200E40100005401
      00003F0000001100000043000000F4010000000000000000FFFFFF1F2C020000
      00000001000B00496E74657276656E73616F00000000FFFF0000000000020000
      000100000000090068656C766574696361000800000000000000000000000000
      0100020000000000FFFFFF0000000002000000000000000000F86D000006004D
      656D6F333000020058020000540100002F0000001100000043000000F4010000
      000000000000FFFFFF1F2C020000000000010006004E756D65726F00000000FF
      FF0000000000020000000100000000090068656C766574696361000800000000
      0000000000000000000100020000000000FFFFFF000000000200000000000000
      0000936E000006004D656D6F3331000200B4000000540100001F000000110000
      0043000000F4010000000000000000FFFFFF1F2C020000000000010018005B71
      727952657175697369636F65732E227365726965225D00000000FFFF00000000
      00020000000100000000090068656C7665746963610008000000000000000000
      000000000100020000000000FFFFFF0000000002000000000000000000606F00
      0006004D656D6F33320002001C01000054010000530000001100000043000000
      F4010000000000000000FFFFFF1F2C020000000000020047005B4946285B7172
      7952657175697369636F65732E226E6F746166697363616C225D3C3E302C5B71
      727952657175697369636F65732E226E6F746166697363616C225D2C2727295D
      0D000000000000FFFF0000000000020000000100000000090068656C76657469
      63610008000000000000000000000000000100020000000000FFFFFF00000000
      020000000000000000002770000006004D656D6F3333000200B8010000540100
      001F0000001100000043000000F4010000000000000000FFFFFF1F2C02000000
      0000020041005B4946285B71727952657175697369636F65732E226D61717569
      6E61225D3C3E302C5B71727952657175697369636F65732E226D617175696E61
      225D2C2727295D0D000000000000FFFF00000000000200000001000000000900
      68656C7665746963610008000000000000000000000000000100020000000000
      FFFFFF0000000002000000000000000000F370000006004D656D6F3334000200
      28020000540100001F0000001100000043000000F4010000000000000000FFFF
      FF1F2C020000000000010049005B4946285B71727952657175697369636F6573
      2E22696E74657276656E73616F225D3C3E302C5B71727952657175697369636F
      65732E22696E74657276656E73616F225D2C2727295D00000000FFFF00000000
      00020000000100000000090068656C7665746963610008000000000000000000
      000000000100020000000000FFFFFF0000000002000000000000000000BF7100
      0006004D656D6F33350002008C020000540100004B0000001100000043000000
      F4010000000000000000FFFFFF1F2C020000000000010049005B4946285B7172
      7952657175697369636F65732E226375706F6D66697363616C225D3C3E302C5B
      71727952657175697369636F65732E226375706F6D66697363616C225D2C2727
      295D00000000FFFF0000000000020000000100000000090068656C7665746963
      610008000000000000000000000000000100020000000000FFFFFF0000000002
      0000000000000000004E7200000E006C626C4974656D50726F6475746F000200
      14000000090200006E0000001300000043000E00F4010000000000000000FFFF
      FF1F2C020000000000010004004974656D00000000FFFF000000000002000000
      0100000000090068656C76657469636100080000000000000000000200000001
      00020000000000FFFFFF0000000002000000000000000000E172000010006C62
      6C46696C69616C50726F6475746F000200820000000902000018000000130000
      0043000E00F4010000000000000000FFFFFF1F2C020000000000010006004669
      6C69616C00000000FFFF0000000000020000000100000000090068656C766574
      6963610008000000000000000000020000000100020000000000FFFFFF000000
      00020000000000000000007C73000014006C626C5175616E7469646164655072
      6F6475746F0002009B00000009020000400000001300000043000E00F4010000
      000000000000FFFFFF1F2C02000000000001000A005175616E74696461646500
      000000FFFF0000000000020000000100000000090068656C7665746963610008
      000000000000000000020000000100020000000000FFFFFF0000000002000000
      0000000000001374000013006C626C44657363726963616F50726F6475746F00
      0200DB00000009020000510100001300000043000E00F4010000000000000000
      FFFFFF1F2C0200000000000100070050726F6475746F00000000FFFF00000000
      00020000000100000000090068656C7665746963610008000000000000000000
      020000000100020000000000FFFFFF0000000002000000000000000000B67400
      0014006C626C4F62736572766163616F50726F6475746F0002002C0200000902
      0000B00000001300000043000F00F4010000000000000000FFFFFF1F2C020000
      000000010012004F62736572766163616F2050726F6475746F00000000FFFF00
      00000000020000000100000000090068656C7665746963610008000000000000
      000000020000000100020000000000FFFFFF0000000002000000000000000000
      3975000008004D656D6F4974656D000200140000005C0200006E000000020000
      0043000600F4010000000000000000FFFFFF1F2C020000000000000000000000
      FFFF0000000000020000000100000005090068656C7665746963610008000000
      000000000000020000000100020000000000FFFFFF0000000002000000000000
      000000BE7500000A004D656D6F46696C69616C000200820000005C0200001800
      00000200000043000600F4010000000000000000FFFFFF1F2C02000000000000
      0000000000FFFF0000000000020000000100000005090068656C766574696361
      0008000000000000000000020000000100020000000000FFFFFF000000000200
      0000000000000000437600000A004D656D6F5174646164650002009B0000005C
      020000400000000200000043000700F4010000000000000000FFFFFF1F2C0200
      00000000000000000000FFFF0000000000020000000100000005090068656C76
      65746963610008000000000000000000020000000100020000000000FFFFFF00
      00000002000000000000000000D276000014004D656D6F64657363726963616F
      70726F6475746F000200DB0000005C020000510100000200000043000700F401
      0000000000000000FFFFFF1F2C020000000000000000000000FFFF0000000000
      020000000100000005090068656C766574696361000800000000000000000002
      0000000100020000000000FFFFFF000000000200000000000000000078770000
      05004D656D6F350002002C02000034020000B00000000B00000040000500F401
      0000000000000000FFFFFF1F2C02000000000001002400205B71727952657175
      697369636F65732E226F627365727661636F65736974656E73225D00000000FF
      FF0000000000020000000100000006090068656C766574696361000800000000
      0000000000100000000100020000000000FFFFFF000000000200000000000000
      00000878000015004D656D6F4F62736572766163616F50726F6475746F000200
      2C0200005C020000B00000000200000043000700F4010000000000000000FFFF
      FF1F2C020000000000000000000000FFFF000000000002000000010000000509
      0068656C76657469636100080000000000000000000200000001000200000000
      00FFFFFF000000000200000000000000FEFEFF0E000000070020546F74616973
      000000001300537562546F74616C56616C6F7256656E63746F00010030001200
      537562546F74616C56616C6F72506167746F00010030000D00537562546F7461
      6C4A75726F7300010030001000546F74616C56616C6F7256656E63746F000100
      30000F00546F74616C56616C6F72506167746F00010030000A00546F74616C4A
      75726F7300010030000300527561000000000600436964616465000000000400
      466F6E65000000000600546974756C6F0000000006004F757472617300000000
      060042616972726F000000000800436F6E74696E756100040054727565000000
      000000000000FC000000000000000000000000000000005800A623F645CFB6E3
      4008C0DC8D7308E540}
  end
  object fdsRequisicoes: TfrDBDataSet
    DataSet = qryRequisicoes
    OpenDataSource = False
    Left = 48
    Top = 272
  end
end
