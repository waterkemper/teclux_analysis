inherited dtmImprimeCarne: TdtmImprimeCarne
  Left = 402
  Top = 202
  Height = 432
  Width = 713
  object qryParcelas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnCalcFields = qryParcelasCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'WhereNumeroParcelas'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'Select p.contrato,'
      '           p.numero,p.parcelaorigem,'
      
        '           cast(substr(p.parcelaorigem,1,1)as varchar)as numerop' +
        'arcela,'
      '           p.datavencto,'
      '           p.valorvencto,'
      '           p.datapagto,'
      '           p.valorpagto,'
      '           (p.valorpagto - p.valorvencto) as jurodesconto,'
      '           (p.datapagto - p.datavencto) as diasatraso,'
      '           (case when (p.datapagto - p.datavencto) > 0 then'
      
        '                      ((p.valorpagto - p.valorvencto)  /  (p.dat' +
        'apagto - p.datavencto))'
      '                    else'
      '                      (p.valorpagto - p.valorvencto)'
      '            end)  as jurosdias,'
      '           0.00 as jurosmora,'
      '           c.cliente,'
      '           c.nome,'
      '           cast(case when coalesce(c.endnumero,0)<>0 then'
      
        '                 c.rua||'#39', '#39'||cast(c.endnumero as varchar) else ' +
        'c.rua end as varchar(100)) as rua,'
      ''
      
        '           (Select b1.nome From bairros b1 Where c.estado = b1.e' +
        'stado and c.cidade = b1.cidade and c.bairro = b1.codigo)'
      
        '                                                                ' +
        '                                 as bairrocliente,'
      '                 '
      ''
      
        '           (select cidades.nome from cidades where cidades.estad' +
        'o=c.estado and cidades.codigo = c.cidade) as cidade,'
      
        '           cast(substr(cast(c.cep as varchar),1,5) || '#39'-'#39' || sub' +
        'str(cast(c.cep as varchar),6,3) as varchar) as cep,'
      '           c.estado,'
      
        '           coalesce((select cidades.nome from cidades where cida' +
        'des.estado=c.empestado and cidades.codigo = c.empcidade),'
      
        '                    (select cidades.nome from cidades where cida' +
        'des.estado=c.estado and cidades.codigo = c.cidade)) as empcidade' +
        ','
      
        '           coalesce(cast(substr(cast(c.empcep as varchar),1,5) |' +
        '| '#39'-'#39' || substr(cast(c.empcep as varchar),6,3) as varchar),'
      
        '                    cast(substr(cast(c.cep as varchar),1,5) || '#39 +
        '-'#39' || substr(cast(c.cep as varchar),6,3) as varchar)) as empcep,'
      
        '           cast(case when (c.pessoatipo = '#39'F'#39') then substr(c.pes' +
        'soanumero,1,3) || '#39'.'#39' || substr(c.pessoanumero,4,3) || '#39'.'#39' ||'
      
        '                                                                ' +
        '             substr(c.pessoanumero,7,3) || '#39'-'#39' || substr(c.pesso' +
        'anumero,10,2)'
      
        '                            when (c.pessoatipo = '#39'J'#39') then subst' +
        'r(c.pessoanumero,1,2) || '#39'.'#39' || substr(c.pessoanumero,3,3) || '#39'.' +
        #39' ||'
      
        '                                                                ' +
        '              substr(c.pessoanumero,6,3) || '#39'/'#39' || substr(c.pess' +
        'oanumero,9,4) || '#39'-'#39' || substr(c.pessoanumero,13,2)'
      '                            else  c.pessoanumero'
      '                   end as varchar) as pessoanumero,'
      '           c.iddocumento as documento,'
      '           '#39#39' as valorextenso1,'
      '           '#39#39' as valorextenso2,'
      '           '#39#39' as valorextenso3,'
      '           '#39#39' as valorextenso4,'
      '           COALESCE(c.faturamento,c.data) as data,'
      '           f.codigo as filial,'
      '           formatar_cpf_cnpj(f.cnpj) as numerofilial,'
      '           f.inscricaoestadual as inscricaoestadualfilial,'
      '           f.inscricaomunicipal as inscricaomunicipalfilial,'
      '           cast((select cidades.nome'
      '            from cidades'
      
        '            where cidades.estado=f.estado and cidades.codigo = f' +
        '.cidade'
      
        '                )||'#39' - '#39'||f.estado as varchar) as cidadeestadofi' +
        'lial,'
      '           cast(f.rua||'#39' - '#39'||(select bairros.nome'
      '                               from bairros'
      '                               where bairros.estado = f.estado'
      '                                 and bairros.cidade = f.cidade'
      '                                 and bairros.codigo = f.bairro'
      '                              )as varchar) as ruabairrofilial,'
      ''
      '           f.rua as ruafilial,                   '
      '           f.numero as endnumerofilial,'
      '           f.complemento as complementofilial,'
      ''
      '           (select bairros.nome from bairros'
      '                               where bairros.estado = f.estado'
      '                                 and bairros.cidade = f.cidade'
      
        '                                 and bairros.codigo = f.bairro) ' +
        'as bairrofilial,'
      ''
      
        '           cast(substr(cast(f.cep as varchar),1,5) || '#39'-'#39' || sub' +
        'str(cast(f.cep as varchar),6,3) as varchar) as cepfilial,'
      
        '           formatar_fone_fax(f.foneddd,f.fonenumero,'#39#39') as fonef' +
        'ilial,'
      '           f.razaocarne,'
      '           f.razao as razaofilial,'
      '           f.nome as nomefilial,'
      '           c.valorprazo,'
      ''
      '           coalesce( ((Select ci.nome'
      '                      from cidades ci'
      
        '                      where (ci.estado = (Select cl.pracapagtoes' +
        'tado'
      '                                          from clientes cl'
      
        '                                          where cl.codigo = c.cl' +
        'iente)) and'
      
        '                            (ci.codigo = (Select cl.pracapagtoci' +
        'dade'
      '                                          from clientes cl'
      
        '                                          where cl.codigo = c.cl' +
        'iente))) || '#39' '#39' ||'
      '                     (Select cl.pracapagtoestado'
      '                      from clientes cl'
      '                      where cl.codigo = c.cliente)),'
      ''
      '                     (case when c.cidade is not null then'
      
        '                        cast(substr(cast(c.cep as varchar),1,5) ' +
        '|| '#39'-'#39' || substr(cast(c.cep as varchar),6,3) as varchar) ||'#39' '#39'||'
      '                        (select cidades.nome'
      '                         from cidades'
      '                         where cidades.estado=c.estado'
      
        '                           and cidades.codigo = c.cidade) ||'#39' '#39'|' +
        '|c.estado end) )'
      '          as pracapagto,'
      ''
      '           (select max(n.numero)'
      '            from notas n, dadosfiscais d'
      '            where n.dadofiscal = d.numero'
      '            and d.contrato = c.numero) as numeronota,'
      ''
      '           coalesce((select d.data'
      '                     from notas n, dadosfiscais d'
      '                     where n.dadofiscal = d.numero'
      '                       and d.contrato = c.numero'
      
        '                     order by n.numero desc limit 1), c.faturame' +
        'nto, c.data) as emissao,'
      ''
      '         pl.descricao as descricaoplano,'
      '         c.desconto'
      '         '
      'From  (parcelas p'
      '       join ((contratos c'
      ''
      '             join filiais f'
      '             on c.filialvenda = f.codigo)'
      ''
      '             join planos pl'
      '             on c.plano = pl.codigo)'
      ''
      '       on p.contrato = c.numero)'
      'Where (p.contrato =:contrato)'
      '      %WhereNumeroParcelas'
      'Order By p.datavencto, p.datapagto')
    RequestLive = True
    Left = 34
    Top = 17
    ParamData = <
      item
        DataType = ftString
        Name = 'contrato'
        ParamType = ptUnknown
        Value = '3'
      end>
    object qryParcelascontrato: TStringField
      FieldName = 'contrato'
      Required = True
    end
    object qryParcelasnumero: TIntegerField
      FieldName = 'numero'
      Required = True
      DisplayFormat = '0'
    end
    object qryParcelasnumeroparcela: TStringField
      FieldName = 'numeroparcela'
      Size = 50
    end
    object qryParcelasdatavencto: TDateField
      Alignment = taCenter
      FieldName = 'datavencto'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasvalorvencto: TFloatField
      FieldName = 'valorvencto'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryParcelasdatapagto: TDateField
      Alignment = taCenter
      FieldName = 'datapagto'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasvalorpagto: TFloatField
      FieldName = 'valorpagto'
      DisplayFormat = '0.00'
    end
    object qryParcelasnome: TStringField
      DisplayWidth = 40
      FieldName = 'nome'
      Required = True
      Size = 60
    end
    object qryParcelasfilial: TIntegerField
      FieldName = 'filial'
      Required = True
      DisplayFormat = '0'
    end
    object qryParcelasrazaocarne: TStringField
      FieldName = 'razaocarne'
      Size = 15
    end
    object qryParcelasdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryParcelascliente: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object qryParcelasjurodesconto: TFloatField
      FieldName = 'jurodesconto'
      DisplayFormat = '0.00'
    end
    object qryParcelasdiasatraso: TIntegerField
      FieldName = 'diasatraso'
      DisplayFormat = '0'
    end
    object qryParcelasjurosdias: TFloatField
      FieldName = 'jurosdias'
      DisplayFormat = '0.00'
    end
    object qryParcelasparcelaorigem: TStringField
      FieldName = 'parcelaorigem'
      Required = True
      Size = 7
    end
    object qryParcelasrua: TStringField
      FieldName = 'rua'
      Size = 100
    end
    object qryParcelascidade: TStringField
      DisplayWidth = 50
      FieldName = 'cidade'
      Size = 72
    end
    object qryParcelasestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object qryParcelasempcidade: TStringField
      DisplayWidth = 50
      FieldName = 'empcidade'
      Size = 72
    end
    object qryParcelaspessoanumero: TStringField
      DisplayWidth = 18
      FieldName = 'pessoanumero'
      Size = 50
    end
    object qryParcelasdocumento: TStringField
      FieldName = 'documento'
      EditMask = '000.000.000;1;_'
    end
    object qryParcelascep: TStringField
      FieldName = 'cep'
      Size = 50
    end
    object qryParcelasjurosmora: TFloatField
      FieldName = 'jurosmora'
      DisplayFormat = '0.00'
    end
    object qryParcelasvalorextenso1: TStringField
      DisplayWidth = 45
      FieldName = 'valorextenso1'
      Size = 50
    end
    object qryParcelasvalorextenso2: TStringField
      DisplayWidth = 45
      FieldName = 'valorextenso2'
      Size = 50
    end
    object qryParcelasvalorextenso3: TStringField
      DisplayWidth = 45
      FieldName = 'valorextenso3'
      Size = 50
    end
    object qryParcelasvalorextenso4: TStringField
      DisplayWidth = 45
      FieldName = 'valorextenso4'
      Size = 50
    end
    object qryParcelasnumerofilial: TStringField
      FieldName = 'numerofilial'
      Size = 50
    end
    object qryParcelasinscricaoestadualfilial: TStringField
      FieldName = 'inscricaoestadualfilial'
    end
    object qryParcelasinscricaomunicipalfilial: TStringField
      FieldName = 'inscricaomunicipalfilial'
    end
    object qryParcelascidadeestadofilial: TStringField
      FieldName = 'cidadeestadofilial'
      Size = 50
    end
    object qryParcelasruabairrofilial: TStringField
      FieldName = 'ruabairrofilial'
      Size = 50
    end
    object qryParcelascepfilial: TStringField
      FieldName = 'cepfilial'
      Size = 50
    end
    object qryParcelasfonefilial: TStringField
      FieldName = 'fonefilial'
      Size = 50
    end
    object qryParcelasvalorprazo: TFloatField
      FieldName = 'valorprazo'
      DisplayFormat = '0.00'
    end
    object qryParcelasnumeronota: TIntegerField
      FieldName = 'numeronota'
      DisplayFormat = '0'
    end
    object qryParcelasempcep: TStringField
      FieldName = 'empcep'
      Size = 50
    end
    object qryParcelasbairrofilial: TStringField
      DisplayWidth = 50
      FieldName = 'bairrofilial'
      Size = 80
    end
    object qryParcelaspracapagto: TMemoField
      FieldName = 'pracapagto'
      BlobType = ftMemo
    end
    object qryParcelasnumeroparcelaletra: TStringField
      FieldKind = fkCalculated
      FieldName = 'numeroparcelaletra'
      Size = 1
      Calculated = True
    end
    object qryParcelasrazaofilial: TStringField
      FieldName = 'razaofilial'
      Size = 60
    end
    object qryParcelasnomefilial: TStringField
      FieldName = 'nomefilial'
      Size = 60
    end
    object qryParcelasdescricaoplano: TStringField
      FieldName = 'descricaoplano'
      Size = 30
    end
    object qryParcelasendnumerofilial: TIntegerField
      FieldName = 'endnumerofilial'
    end
    object qryParcelascomplementofilial: TStringField
      FieldName = 'complementofilial'
      Size = 100
    end
    object qryParcelasruafilial: TStringField
      FieldName = 'ruafilial'
      Size = 100
    end
    object qryParcelasemissao: TDateField
      FieldName = 'emissao'
    end
    object qryParcelasdesconto: TFloatField
      FieldName = 'desconto'
    end
    object qryParcelasbairrocliente: TStringField
      FieldName = 'bairrocliente'
      Size = 80
    end
  end
  object qryModeloCarne: TtecQuery
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
      'select codigo,'
      '          configurar,'
      '          cabecalho,'
      '          emaberto,'
      '          comatraso,'
      '          sematraso,'
      '          rodape,'
      '          imprimirlayout,'
      '          linha01,'
      '          linha02,'
      '          linha03,'
      '          linha04,'
      '          linha05,'
      '          linha06,'
      '          linha07,'
      '          linha08,'
      '          linha09,'
      '          linha10,'
      '          linha11,'
      '          linha12,'
      '          linha13,'
      '          linha14,'
      '          linha15,'
      '          linha16,'
      '          linha17,'
      '          linha18,'
      '          linha19,'
      '          linha20,'
      '          arquivofast'
      '         from modeloscarnes'
      'where (codigo = :codigo)')
    RequestLive = False
    Left = 137
    Top = 17
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryModeloCarnecodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
    object qryModeloCarneconfigurar: TStringField
      FieldName = 'configurar'
      Required = True
      Size = 100
    end
    object qryModeloCarnecabecalho: TStringField
      FieldName = 'cabecalho'
      Required = True
      Size = 2000
    end
    object qryModeloCarneemaberto: TStringField
      FieldName = 'emaberto'
      Size = 1500
    end
    object qryModeloCarnesematraso: TStringField
      FieldName = 'sematraso'
      Required = True
      Size = 1500
    end
    object qryModeloCarnecomatraso: TStringField
      FieldName = 'comatraso'
      Required = True
      Size = 1500
    end
    object qryModeloCarnerodape: TStringField
      FieldName = 'rodape'
      Required = True
      Size = 1500
    end
    object qryModeloCarneimprimirlayout: TBooleanField
      FieldName = 'imprimirlayout'
    end
    object qryModeloCarnelinha01: TStringField
      FieldName = 'linha01'
      Size = 512
    end
    object qryModeloCarnelinha02: TStringField
      FieldName = 'linha02'
      Size = 512
    end
    object qryModeloCarnelinha03: TStringField
      FieldName = 'linha03'
      Size = 512
    end
    object qryModeloCarnelinha04: TStringField
      FieldName = 'linha04'
      Size = 512
    end
    object qryModeloCarnelinha05: TStringField
      FieldName = 'linha05'
      Size = 512
    end
    object qryModeloCarnelinha06: TStringField
      FieldName = 'linha06'
      Size = 512
    end
    object qryModeloCarnelinha07: TStringField
      FieldName = 'linha07'
      Size = 512
    end
    object qryModeloCarnelinha08: TStringField
      FieldName = 'linha08'
      Size = 512
    end
    object qryModeloCarnelinha09: TStringField
      FieldName = 'linha09'
      Size = 512
    end
    object qryModeloCarnelinha10: TStringField
      FieldName = 'linha10'
      Size = 512
    end
    object qryModeloCarnelinha11: TStringField
      FieldName = 'linha11'
      Size = 512
    end
    object qryModeloCarnelinha12: TStringField
      FieldName = 'linha12'
      Size = 512
    end
    object qryModeloCarnelinha13: TStringField
      FieldName = 'linha13'
      Size = 512
    end
    object qryModeloCarnelinha14: TStringField
      FieldName = 'linha14'
      Size = 512
    end
    object qryModeloCarnelinha15: TStringField
      FieldName = 'linha15'
      Size = 512
    end
    object qryModeloCarnelinha16: TStringField
      FieldName = 'linha16'
      Size = 512
    end
    object qryModeloCarnelinha17: TStringField
      FieldName = 'linha17'
      Size = 512
    end
    object qryModeloCarnelinha18: TStringField
      FieldName = 'linha18'
      Size = 512
    end
    object qryModeloCarnelinha19: TStringField
      FieldName = 'linha19'
      Size = 512
    end
    object qryModeloCarnelinha20: TStringField
      FieldName = 'linha20'
      Size = 512
    end
    object qryModeloCarnearquivofast: TStringField
      FieldName = 'arquivofast'
      Size = 30
    end
  end
  object qryParcelasECF: TtecQuery
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
      'Select p.contrato,'
      '       p.numero,'
      '       p.datavencto,'
      '       p.valorvencto,'
      
        '       case when datapagto is not null then to_char(datapagto, '#39 +
        'DD/MM/YY'#39')'
      #9'    else '#39' '#39
      '       end as datapagto,'
      '       p.valorpagto,'
      '       cast(case when datapagto is not null then '#39'PAGO'#39
      '                 ELSE '#39' '#39
      '            end as varchar) as situacao,'
      
        '       case when valorpagto > valorvencto then valorpagto - valo' +
        'rvencto'
      '            else 0.00 end as acrescimo,'
      
        '       case when valorpagto < valorvencto then valorvencto - val' +
        'orpagto'
      '            else 0.00 end as desconto,'
      '       c.data,'
      '       c.cliente,'
      '       c.nome,'
      '       c.iddocumento,'
      '       formatar_cpf_cnpj(c.pessoanumero) as pessoanumero,'
      '       (Select ci.nome from cidades ci where (ci.estado ='
      
        '                             (Select cl.pracapagtoestado from cl' +
        'ientes cl where cl.codigo = c.cliente)) and'
      
        '                             (ci.codigo = (Select cl.pracapagtoc' +
        'idade from clientes cl where cl.codigo = c.cliente))) || '#39' - '#39' |' +
        '|'
      
        '       (Select cl.pracapagtoestado from clientes cl where cl.cod' +
        'igo = c.cliente) as pracapagto,'
      
        '       (SELECT nome from usuarios where codigo = c.vendedor) as ' +
        'vendedor'
      'from contratos c join parcelas p on c.numero = p.contrato'
      'where c.numero = :contrato'
      'order by datavencto, datapagto')
    RequestLive = True
    Left = 44
    Top = 70
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptUnknown
      end>
    object qryParcelasECFdatavencto: TDateField
      Alignment = taCenter
      FieldName = 'datavencto'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasECFvalorvencto: TFloatField
      FieldName = 'valorvencto'
      DisplayFormat = '0.00'
    end
    object qryParcelasECFnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryParcelasECFiddocumento: TStringField
      FieldName = 'iddocumento'
    end
    object qryParcelasECFpessoanumero: TStringField
      FieldName = 'pessoanumero'
      Size = 14
    end
    object qryParcelasECFvendedor: TStringField
      FieldName = 'vendedor'
      Size = 50
    end
    object qryParcelasECFcliente: TIntegerField
      FieldName = 'cliente'
      DisplayFormat = '0'
    end
    object qryParcelasECFcontrato: TStringField
      FieldName = 'contrato'
    end
    object qryParcelasECFdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasECFnumero: TIntegerField
      FieldName = 'numero'
      DisplayFormat = '0'
    end
    object qryParcelasECFvalorpagto: TFloatField
      FieldName = 'valorpagto'
      DisplayFormat = '0.00'
    end
    object qryParcelasECFdatapagto: TMemoField
      FieldName = 'datapagto'
      BlobType = ftMemo
    end
    object qryParcelasECFsituacao: TStringField
      FieldName = 'situacao'
      Size = 50
    end
    object qryParcelasECFacrescimo: TFloatField
      FieldName = 'acrescimo'
      DisplayFormat = '0.00'
    end
    object qryParcelasECFdesconto: TFloatField
      FieldName = 'desconto'
      DisplayFormat = '0.00'
    end
    object qryParcelasECFpracapagto: TMemoField
      FieldName = 'pracapagto'
      BlobType = ftMemo
    end
  end
  object frpCarne: TfrReport
    Dataset = fdsCarne
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 216
    Top = 112
    ReportForm = {
      190000007517000019FFFF00000A0050444643726561746F7200FFFFFFFFFF00
      000000340800009A0B0000120000001200000012000000120000000000040000
      0000FFFF000000000000000000000000030400466F726D00FEFFFFFFDC000000
      780000007C0100002C010000040000000200DC0000000C004461646F734D6573
      747265310002010000000080000000F5020000CA000000300005000100000000
      0000000000FFFFFF1F0000000008006664734361726E6500000000000000FFFF
      000000000002000000010000000000000001000000C800000014000000010000
      0000000000005801000005004D656D6F36000200540000008600000038010000
      3E00000043000F0001000000000000000000FFFFFF1F2C020000000000000000
      000000FFFF00000000000200000001000000000500417269616C000800000002
      0000000000020000000100020000000000FFFFFF000000000200000000000000
      0000F001000005004D656D6F3100020058000000880000003001000012000000
      4300000001000000000000000000FFFFFF1F2C02000000000001001A005B7172
      7950617263656C61732E2272617A616F6361726E65225D00000000FFFF000000
      00000200000001000000000500417269616C0009000000020000000000000000
      000100020000000000FFFFFF0000000002000000000000000000800200000500
      4D656D6F32000200580000009C00000084000000120000004300000001000000
      000000000000FFFFFF1F2C02000000000001001200444154412044452056454E
      43494D454E544F00000000FFFF00000000000200000001000000000500417269
      616C0008000000000000000000020000000100020000000000FFFFFF00000000
      020000000000000000001003000005004D656D6F33000200F80000009C000000
      90000000120000004300000001000000000000000000FFFFFF1F2C0200000000
      000100120056414C4F5220444120505245535441C7C34F00000000FFFF000000
      00000200000001000000000500417269616C0008000000000000000000020000
      000100020000000000FFFFFF0000000002000000000000000000A80300000500
      4D656D6F3400020058000000B000000084000000120000004300000001000000
      000000000000FFFFFF1F2C02000000000001001A005B71727950617263656C61
      732E226461746176656E63746F225D00000000FFFF0000000000020000000100
      0000000500417269616C00090000000000000000000200000001000200000000
      00FFFFFF00000000020000000000000000004F04000005004D656D6F35000200
      F8000000B000000090000000120000004300000001000000000000000000FFFF
      FF1F2C0204010E002323232C2323232C2323302E30300001001B005B71727950
      617263656C61732E2276616C6F7276656E63746F225D00000000FFFF00000000
      000200000001000000000500417269616C000900000000000000000002000000
      0100020000000000FFFFFF00000000020000000000000004009E04000005004C
      696E6531000200E80000009C0000000000000028000000010004000100000000
      0000000000FFFFFF002C020000000000000000000000FFFF0000000000020000
      00010000000000001A05000005004D656D6F3700020054000000C40000003801
      00005200000043000F0001000000000000000000FFFFFF1F2C02000000000000
      0000000000FFFF00000000000200000001000000000500417269616C00080000
      00020000000000020000000100020000000000FFFFFF00000000020000000000
      00000000A905000005004D656D6F3800020058000000C8000000740000001200
      00004300000001000000000000000000FFFFFF1F2C0200000000000100110043
      D34449474F20444F20434C49454E544500000000FFFF00000000000200000001
      000000000500417269616C000800000000000000000000000000010002000000
      0000FFFFFF00000000020000000000000000003E06000005004D656D6F390002
      00D0000000C800000064000000120000004300000001000000000000000000FF
      FFFF1F2C020000000000010017005B71727950617263656C61732E22636C6965
      6E7465225D00000000FFFF00000000000200000001000000000500417269616C
      0008000000000000000000000000000100020000000000FFFFFF000000000200
      0000000000000000CC06000006004D656D6F313000020058000000D800000068
      000000120000004300000001000000000000000000FFFFFF1F2C020000000000
      01000F004E4F4D4520444F20434C49454E544500000000FFFF00000000000200
      000001000000000500417269616C000800000000000000000000000000010002
      0000000000FFFFFF00000000020000000000000000005307000006004D656D6F
      313100020058000000E800000040000000120000004300000001000000000000
      000000FFFFFF1F2C02000000000001000800454E44455245C74F00000000FFFF
      00000000000200000001000000000500417269616C0008000000000000000000
      000000000100020000000000FFFFFF0000000002000000000000000000E60700
      0006004D656D6F3133000200C4000000D8000000CC0000001200000043000000
      01000000000000000000FFFFFF1F2C020000000000010014005B717279506172
      63656C61732E226E6F6D65225D00000000FFFF00000000000200000001000000
      000500417269616C0008000000000000000000000000000100020000000000FF
      FFFF0000000002000000000000000000C208000006004D656D6F31320002009C
      000000E6000000EC0000002E0000004300000001000000000000000000FFFFFF
      1F2C020000000000020013005B71727950617263656C61732E22727561225D0D
      47005B71727950617263656C61732E22636570225D205B71727950617263656C
      61732E22636964616465225D205B272D275D205B71727950617263656C61732E
      2265737461646F225D00000000FFFF0000000000020000000100000000050041
      7269616C0008000000000000000000000000000100020000000000FFFFFF0000
      0000020000000000000000003F09000006004D656D6F31340002005400000016
      010000380100002A00000043000F0001000000000000000000FFFFFF1F2C0200
      00000000000000000000FFFF0000000000020000000100000000050041726961
      6C000A000000020000000000000000000100020000000000FFFFFF0000000002
      000000000000000000C409000006004D656D6F3135000200580000001A010000
      9C000000120000004300000001000000000000000000FFFFFF1F2C0200000000
      000100060054CD54554C4F00000000FFFF000000000002000000010000000005
      00417269616C0008000000000000000000020000000100020000000000FFFFFF
      0000000002000000000000000000520A000006004D656D6F3136000200F80000
      001A01000090000000120000004300000001000000000000000000FFFFFF1F2C
      02000000000001000F004441544120444520454D495353C34F00000000FFFF00
      000000000200000001000000000500417269616C000800000000000000000002
      0000000100020000000000FFFFFF0000000002000000000000000000090B0000
      06004D656D6F3137000200580000002C0100009C000000120000004300000001
      000000000000000000FFFFFF1F2C020000000000010038005B71727950617263
      656C61732E22636F6E747261746F225D2020205B71727950617263656C61732E
      2270617263656C616F726967656D225D00000000FFFF00000000000200000001
      000000000500417269616C000900000000000000000002000000010002000000
      0000FFFFFF00000000020000000000000000009C0B000006004D656D6F313800
      0200F80000002C01000090000000120000004300000001000000000000000000
      FFFFFF1F2C020000000000010014005B71727950617263656C61732E22646174
      61225D00000000FFFF00000000000200000001000000000500417269616C0009
      000000000000000000020000000100020000000000FFFFFF0000000002000000
      000000000000190C000006004D656D6F31390002009801000086000000380100
      002A00000043000F0001000000000000000000FFFFFF1F2C0200000000000000
      00000000FFFF00000000000200000001000000000500417269616C0008000000
      020000000000020000000100020000000000FFFFFF0000000002000000000000
      000000A90C000006004D656D6F32300002009C0100008A000000700000001200
      00004300000001000000000000000000FFFFFF1F2C0200000000000100110043
      D34449474F20444F20434C49454E544500000000FFFF00000000000200000001
      000000000500417269616C000800000000000000000000000000010002000000
      0000FFFFFF00000000020000000000000000003F0D000006004D656D6F323100
      0200180200008A00000064000000120000004300000001000000000000000000
      FFFFFF1F2C020000000000010017005B71727950617263656C61732E22636C69
      656E7465225D00000000FFFF0000000000020000000100000000050041726961
      6C0008000000000000000000000000000100020000000000FFFFFF0000000002
      000000000000000000D20D000006004D656D6F32320002009C0100009C000000
      30010000120000004300000001000000000000000000FFFFFF1F2C0200000000
      00010014005B71727950617263656C61732E226E6F6D65225D00000000FFFF00
      000000000200000001000000000500417269616C000800000000000000000000
      0000000100020000000000FFFFFF00000000020000000000000000004F0E0000
      06004D656D6F323300020098010000B0000000380100001800000043000F0001
      000000000000000000FFFFFF1F2C020000000000000000000000FFFF00000000
      000200000001000000000500417269616C000A00000002000000000000000000
      0100020000000000FFFFFF0000000002000000000000000000D40E000006004D
      656D6F32340002009C010000B400000084000000120000004300000001000000
      000000000000FFFFFF1F2C0200000000000100060054CD54554C4F00000000FF
      FF00000000000200000001000000000500417269616C00080000000000000000
      00010000000100020000000000FFFFFF00000000020000000000000000008B0F
      000006004D656D6F323500020024020000B4000000A800000012000000430000
      0001000000000000000000FFFFFF1F2C020000000000010038005B7172795061
      7263656C61732E22636F6E747261746F225D2020205B71727950617263656C61
      732E2270617263656C616F726967656D225D00000000FFFF0000000000020000
      0001000000000500417269616C00090000000000000000000200000001000200
      00000000FFFFFF00000000020000000000000000000810000006004D656D6F32
      3600020098010000C8000000380100007800000043000F000100000000000000
      0000FFFFFF1F2C020000000000000000000000FFFF0000000000020000000100
      0000000500417269616C000A0000000200000000000200000001000200000000
      00FFFFFF00000000020000000000000000009110000006004D656D6F32370002
      009C010000CC00000084000000120000004300000001000000000000000000FF
      FFFF1F2C02000000000001000A0056454E43494D454E544F00000000FFFF0000
      0000000200000001000000000500417269616C00080000000000000000000100
      00000100020000000000FFFFFF00000000020000000000000000002211000006
      004D656D6F32380002009C010000DE0000008400000012000000430000000100
      0000000000000000FFFFFF1F2C0200000000000100120056414C4F5220444120
      505245535441C7C34F00000000FFFF0000000000020000000100000000050041
      7269616C0008000000000000000000010000000100020000000000FFFFFF0000
      000002000000000000000000AA11000006004D656D6F32390002009C010000F0
      00000084000000120000004300000001000000000000000000FFFFFF1F2C0200
      00000000010009004A55524F532F44494100000000FFFF000000000002000000
      01000000000500417269616C0008000000000000000000010000000100020000
      000000FFFFFF00000000020000000000000000003412000006004D656D6F3330
      0002009C01000002010000840000001200000043000000010000000000000000
      00FFFFFF1F2C02000000000001000B00544F54414C2F4A55524F5300000000FF
      FF00000000000200000001000000000500417269616C00080000000000000000
      00010000000100020000000000FFFFFF0000000002000000000000000000C412
      000006004D656D6F33310002009C010000180100008400000012000000430000
      0001000000000000000000FFFFFF1F2C02000000000001001100444154412044
      4F20504147414D454E544F00000000FFFF000000000002000000010000000005
      00417269616C0008000000000000000000010000000100020000000000FFFFFF
      00000000020000000000000000005513000006004D656D6F33320002009C0100
      002C01000084000000120000004300000001000000000000000000FFFFFF1F2C
      0200000000000100120056414C4F5220444F20504147414D454E544F00000000
      FFFF00000000000200000001000000000500417269616C000800000000000000
      0000010000000100020000000000FFFFFF0000000002000000000000000000EE
      13000006004D656D6F333300020034020000CC00000064000000120000004300
      000001000000000000000000FFFFFF1F2C02000000000001001A005B71727950
      617263656C61732E226461746176656E63746F225D00000000FFFF0000000000
      0200000001000000000500417269616C00090000000000000000000100000001
      00020000000000FFFFFF00000000020000000000000000009614000006004D65
      6D6F333400020034020000DE0000006400000012000000430000000100000000
      0000000000FFFFFF1F2C0204010E002323232C2323232C2323302E3030000100
      1B005B71727950617263656C61732E2276616C6F7276656E63746F225D000000
      00FFFF00000000000200000001000000000500417269616C0009000000000000
      000000010000000100020000000000FFFFFF0000000002000000000000000000
      3C15000006004D656D6F333500020034020000F0000000640000001200000043
      00000001000000000000000000FFFFFF1F2C0204010E002323232C2323232C23
      23302E303000010019005B71727950617263656C61732E226A75726F73646961
      73225D00000000FFFF00000000000200000001000000000500417269616C0009
      000000000000000000010000000100020000000000FFFFFF0000000002000000
      000000000000E915000006004D656D6F33360002003402000004010000640000
      00120000004300000001000000000000000000FFFFFF1F2C0204010E00232323
      2C2323232C2323302E3030000100200020202020202020202020202E20202020
      202020202020202C202020202020202000000000FFFF00000000000200000001
      000000000500417269616C000900000004000000000011000000010002000000
      0000FFFFFF00000000020000000000000000009616000006004D656D6F333700
      0200340200002C01000064000000120000004300000001000000000000000000
      FFFFFF1F2C0204010E002323232C2323232C2323302E30300001002000202020
      20202020202020202E20202020202020202020202C2020202020202020000000
      00FFFF00000000000200000001000000000500417269616C0009000000040000
      000000110000000100020000000000FFFFFF0000000002000000000000000000
      4317000006004D656D6F33380002003402000018010000640000001200000043
      00000001000000000000000000FFFFFF1F2C0204010E002323232C2323232C23
      23302E3030000100200020202020202020202F2020202020202020202F202020
      2020202020202020202000000000FFFF00000000000200000001000000000500
      417269616C0009000000040000000000110000000100020000000000FFFFFF00
      0000000200000000000000FEFEFF000000000000000000000000FC0000000000
      000000000000000000000058000F384C2153DEE340B822BBF614BCE540}
  end
  object fdsCarne: TfrDBDataSet
    DataSet = qryParcelas
    Left = 272
    Top = 136
  end
  object frpCarne_fast_4: TfrxReport
    Version = '4.0.11'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43201.685482372700000000
    ReportOptions.LastChange = 43206.416979224540000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 320
    Top = 56
    Datasets = <
      item
        DataSet = frxDBParcelas
        DataSetName = 'frxDBParcelas'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 284.000000000000000000
      PaperSize = 256
      object MasterData1: TfrxMasterData
        Height = 264.566929130000000000
        Top = 18.897650000000000000
        Width = 793.701300000000000000
        DataSet = frxDBParcelas
        DataSetName = 'frxDBParcelas'
        RowCount = 0
        object Memo1: TfrxMemoView
          Left = 181.417440000000000000
          Top = 30.236240000000000000
          Width = 279.685220000000000000
          Height = 18.897650000000000000
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBParcelas."cliente"] - [frxDBParcelas."nome"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 181.417440000000000000
          Top = 60.472480000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataField = 'contrato'
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBParcelas."contrato"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 181.417440000000000000
          Top = 90.708720000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBParcelas."valorprazo"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 154.960730000000000000
          Top = 124.724490000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          DataField = 'descricaoplano'
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBParcelas."descricaoplano"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 181.417440000000000000
          Top = 154.960730000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBParcelas."valorvencto"]')
          ParentFont = False
        end
        object BarCode1: TfrxBarCodeView
          Left = 105.826840000000000000
          Top = 207.874150000000000000
          Width = 129.000000000000000000
          Height = 49.133890000000000000
          BarType = bcCode39
          Expression = '<frxDBParcelas."contrato">'
          Rotation = 0
          Text = '12345678'
          WideBarRatio = 2.000000000000000000
          Zoom = 1.000000000000000000
        end
        object Memo6: TfrxMemoView
          Left = 347.716760000000000000
          Top = 90.708720000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataField = 'data'
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBParcelas."data"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 347.716760000000000000
          Top = 124.724490000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'parcelaorigem'
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBParcelas."parcelaorigem"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 347.716760000000000000
          Top = 154.960730000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataField = 'datavencto'
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBParcelas."datavencto"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 498.897960000000000000
          Top = 30.236240000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Cliente: [frxDBParcelas."cliente"] - [frxDBParcelas."nome"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 498.897960000000000000
          Top = 60.472480000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Venda N'#194#186': [frxDBParcelas."contrato"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 616.063390000000000000
          Top = 90.708720000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBParcelas."valorprazo"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 498.897960000000000000
          Top = 90.708720000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Total da Venda:')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 570.709030000000000000
          Top = 124.724490000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'parcelaorigem'
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBParcelas."parcelaorigem"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 498.897960000000000000
          Top = 124.724490000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Parcela:')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 536.693260000000000000
          Top = 154.960730000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBParcelas."valorvencto"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 498.897960000000000000
          Top = 154.960730000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Valor:')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 619.842920000000000000
          Top = 154.960730000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Vencimento:')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 691.653990000000000000
          Top = 154.960730000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataField = 'datavencto'
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBParcelas."datavencto"]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBParcelas: TfrxDBDataset
    UserName = 'frxDBParcelas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'contrato=contrato'
      'numero=numero'
      'numeroparcela=numeroparcela'
      'datavencto=datavencto'
      'valorvencto=valorvencto'
      'datapagto=datapagto'
      'valorpagto=valorpagto'
      'nome=nome'
      'filial=filial'
      'razaocarne=razaocarne'
      'data=data'
      'cliente=cliente'
      'jurodesconto=jurodesconto'
      'diasatraso=diasatraso'
      'jurosdias=jurosdias'
      'parcelaorigem=parcelaorigem'
      'rua=rua'
      'cidade=cidade'
      'estado=estado'
      'empcidade=empcidade'
      'pessoanumero=pessoanumero'
      'documento=documento'
      'cep=cep'
      'jurosmora=jurosmora'
      'valorextenso1=valorextenso1'
      'valorextenso2=valorextenso2'
      'valorextenso3=valorextenso3'
      'valorextenso4=valorextenso4'
      'numerofilial=numerofilial'
      'inscricaoestadualfilial=inscricaoestadualfilial'
      'inscricaomunicipalfilial=inscricaomunicipalfilial'
      'cidadeestadofilial=cidadeestadofilial'
      'ruabairrofilial=ruabairrofilial'
      'cepfilial=cepfilial'
      'fonefilial=fonefilial'
      'valorprazo=valorprazo'
      'numeronota=numeronota'
      'empcep=empcep'
      'bairrofilial=bairrofilial'
      'pracapagto=pracapagto'
      'numeroparcelaletra=numeroparcelaletra'
      'razaofilial=razaofilial'
      'nomefilial=nomefilial'
      'descricaoplano=descricaoplano'
      'endnumerofilial=endnumerofilial'
      'complementofilial=complementofilial'
      'ruafilial=ruafilial'
      'emissao=emissao'
      'desconto=desconto'
      'bairrocliente=bairrocliente')
    DataSet = qryParcelas
    Left = 368
    Top = 120
  end
  object frxReport1: TfrxReport
    Version = '4.0.11'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43201.685482372700000000
    ReportOptions.LastChange = 43206.416876689800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 392
    Top = 40
    Datasets = <
      item
        DataSet = frxDBParcelas
        DataSetName = 'frxDBParcelas'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 284.000000000000000000
      PaperSize = 256
      object MasterData1: TfrxMasterData
        Height = 264.566929130000000000
        Top = 18.897650000000000000
        Width = 793.701300000000000000
        DataSet = frxDBParcelas
        DataSetName = 'frxDBParcelas'
        RowCount = 0
        object Memo1: TfrxMemoView
          Left = 181.417440000000000000
          Top = 30.236240000000000000
          Width = 279.685220000000000000
          Height = 18.897650000000000000
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBParcelas."cliente"] - [frxDBParcelas."nome"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 181.417440000000000000
          Top = 60.472480000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataField = 'contrato'
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBParcelas."contrato"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 181.417440000000000000
          Top = 90.708720000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBParcelas."valorprazo"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 154.960730000000000000
          Top = 124.724490000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          DataField = 'descricaoplano'
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBParcelas."descricaoplano"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 181.417440000000000000
          Top = 154.960730000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBParcelas."valorvencto"]')
          ParentFont = False
        end
        object BarCode1: TfrxBarCodeView
          Left = 105.826840000000000000
          Top = 207.874150000000000000
          Width = 129.000000000000000000
          Height = 49.133890000000000000
          BarType = bcCode39
          Expression = '<frxDBParcelas."contrato">'
          Rotation = 0
          Text = '12345678'
          WideBarRatio = 2.000000000000000000
          Zoom = 1.000000000000000000
        end
        object Memo6: TfrxMemoView
          Left = 347.716760000000000000
          Top = 90.708720000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataField = 'data'
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBParcelas."data"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 347.716760000000000000
          Top = 124.724490000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'parcelaorigem'
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBParcelas."parcelaorigem"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 347.716760000000000000
          Top = 154.960730000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataField = 'datavencto'
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBParcelas."datavencto"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 498.897960000000000000
          Top = 30.236240000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Cliente: [frxDBParcelas."cliente"] - [frxDBParcelas."nome"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 498.897960000000000000
          Top = 60.472480000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Venda N'#194#186': [frxDBParcelas."contrato"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 616.063390000000000000
          Top = 90.708720000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBParcelas."valorprazo"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 498.897960000000000000
          Top = 90.708720000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Total da Venda:')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 570.709030000000000000
          Top = 124.724490000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'parcelaorigem'
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBParcelas."parcelaorigem"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 498.897960000000000000
          Top = 124.724490000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Parcela:')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 536.693260000000000000
          Top = 154.960730000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBParcelas."valorvencto"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 498.897960000000000000
          Top = 154.960730000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Valor:')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 619.842920000000000000
          Top = 154.960730000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Vencimento:')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 691.653990000000000000
          Top = 154.960730000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataField = 'datavencto'
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBParcelas."datavencto"]')
          ParentFont = False
        end
      end
    end
  end
  object frxModeloFatura: TfrxReport
    Version = '4.0.11'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43201.685482372700000000
    ReportOptions.LastChange = 44511.702421759300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 264
    Top = 208
    Datasets = <
      item
        DataSet = frxDBParcelas
        DataSetName = 'frxDBParcelas'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 148.500000000000000000
      PaperSize = 256
      LeftMargin = 15.000000000000000000
      RightMargin = 15.000000000000000000
      TopMargin = 20.000000000000000000
      BottomMargin = 20.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 389.291419130000000000
        Top = 18.897650000000000000
        Width = 680.315400000000000000
        DataSet = frxDBParcelas
        DataSetName = 'frxDBParcelas'
        RowCount = 0
        object Shape10: TfrxShapeView
          Left = 90.708720000000000000
          Top = 328.819110000000000000
          Width = 589.606680000000000000
          Height = 60.472480000000000000
        end
        object Shape7: TfrxShapeView
          Left = 514.016080000000000000
          Top = 98.267780000000000000
          Width = 166.299320000000000000
          Height = 86.929136300000000000
          Frame.Width = 0.100000000000000000
        end
        object Shape2: TfrxShapeView
          Left = 90.708720000000000000
          Top = 139.842610000000000000
          Width = 423.307035350000000000
          Height = 45.354335590000000000
          Frame.Width = 0.100000000000000000
        end
        object Shape1: TfrxShapeView
          Width = 272.125984250000000000
          Height = 98.267714090000000000
          Frame.Width = 0.100000000000000000
        end
        object Shape3: TfrxShapeView
          Top = 98.267780000000000000
          Width = 90.708661420000000000
          Height = 291.023810000000000000
          Frame.Width = 0.100000000000000000
        end
        object Shape4: TfrxShapeView
          Left = 90.708720000000000000
          Top = 98.267780000000000000
          Width = 75.590551180000000000
          Height = 41.574830000000000000
          Frame.Width = 0.100000000000000000
        end
        object Shape5: TfrxShapeView
          Left = 438.425480000000000000
          Top = 98.267780000000000000
          Width = 75.590551180000000000
          Height = 41.574830000000000000
          Frame.Width = 0.100000000000000000
        end
        object Shape6: TfrxShapeView
          Left = 260.787570000000000000
          Top = 98.267780000000000000
          Width = 86.929141180000000000
          Height = 41.574830000000000000
          Frame.Width = 0.100000000000000000
        end
        object Memo1: TfrxMemoView
          Top = 98.267780000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          GapX = 1.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'N'#194#186' da Fatura - NF')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 90.708720000000000000
          Top = 98.267780000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          GapX = 1.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Emiss'#195#163'o-NF')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 166.299320000000000000
          Top = 98.267780000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          GapX = 1.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Valor da Fatura-NF')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 260.787570000000000000
          Top = 98.267780000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          GapX = 1.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'N'#194#186' Duplicata')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 347.716760000000000000
          Top = 98.267780000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          GapX = 1.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Valor da Duplicata')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 438.425480000000000000
          Top = 98.267780000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          GapX = 1.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Vencimento')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 517.795610000000000000
          Top = 102.047310000000000000
          Width = 162.519790000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          GapX = 9.000000000000000000
          Memo.UTF8 = (
            'Para uso da Institui'#195#167#195#163'o Financeira')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 56.692950000000000000
          Top = 170.078850000000000000
          Width = 30.236240000000000000
          Height = 188.976500000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          GapX = 10.000000000000000000
          GapY = 20.000000000000000000
          Memo.UTF8 = (
            'ASSINATURA DO EMITENTE')
          ParentFont = False
          Rotation = 90
        end
        object Memo9: TfrxMemoView
          Left = 275.905690000000000000
          Top = 3.779530000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'razaofilial'
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBParcelas."razaofilial"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 275.905690000000000000
          Top = 22.677180000000000000
          Width = 400.630180000000000000
          Height = 34.015770000000000000
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[<frxDBParcelas."ruafilial">]['#39', '#39'][<frxDBParcelas."endnumerofil' +
              'ial">] [<frxDBParcelas."complementofilial">]'
            
              '[<frxDBParcelas."bairrofilial">]['#39' - '#39'][<frxDBParcelas."cidadees' +
              'tadofilial">] ['#39'Cep'#39'] [<frxDBParcelas."cepfilial">]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 275.905690000000000000
          Top = 60.472480000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            
              'CNPJ: [frxDBParcelas."numerofilial"]   IE: [frxDBParcelas."inscr' +
              'icaoestadualfilial"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 275.905690000000000000
          Top = 79.370130000000000000
          Width = 438.425480000000000000
          Height = 15.118120000000000000
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'C'#195#8220'DIGO: [frxDBParcelas."filial"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Top = 117.165430000000000000
          Width = 90.708720000000000000
          Height = 22.677180000000000000
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBParcelas."numeronota"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 94.488250000000000000
          Top = 120.944960000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataField = 'emissao'
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBParcelas."emissao"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 170.078850000000000000
          Top = 120.944960000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBParcelas."valorprazo"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 260.787570000000000000
          Top = 120.944960000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[IIF(<frxDBParcelas."numeronota">=0,IntToStr(<frxDBParcelas."num' +
              'ero">),IntToStr(<frxDBParcelas."numeronota">) + '#39'/'#39' + IntToStr(<' +
              'frxDBParcelas."numero">))]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 438.425480000000000000
          Top = 120.944960000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataField = 'datavencto'
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBParcelas."datavencto"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 351.496290000000000000
          Top = 120.944960000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataField = 'valorvencto'
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBParcelas."valorvencto"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 94.488250000000000000
          Top = 188.976500000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'SACADO:')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 94.488250000000000000
          Top = 207.874150000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'ENDERE'#195#8225'O:')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 94.488250000000000000
          Top = 226.771800000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'MUNIC'#195#141'PIO:')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 94.488250000000000000
          Top = 245.669450000000000000
          Width = 355.275820000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'PRA'#195#8225'A DE PAGAMENTO: [frxDBParcelas."pracapagto"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 94.488250000000000000
          Top = 264.567100000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'CNPJ/CPF:')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 90.708720000000000000
          Top = 287.244280000000000000
          Width = 94.488250000000000000
          Height = 41.574830000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Valor por'
            ' Extenso')
          ParentFont = False
          VAlign = vaCenter
        end
        object Shape9: TfrxShapeView
          Left = 185.196970000000000000
          Top = 287.244280000000000000
          Width = 495.118430000000000000
          Height = 41.574830000000000000
        end
        object Memo25: TfrxMemoView
          Left = 98.267780000000000000
          Top = 332.598640000000000000
          Width = 578.268090000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            
              'RECONHE'#195#8225'O(EMOS) A EXATID'#195#402'O DESTA DUPLICATA DE VENDA MERCANTIL ' +
              'NA IMPORT'#195#8218'NCIA  ACIMA EM')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 98.267780000000000000
          Top = 355.275820000000000000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '____ /_____ /____')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 328.819110000000000000
          Top = 355.275820000000000000
          Width = 343.937230000000000000
          Height = 30.236240000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '_________________________________________________________'
            ' ASSINATURA DO SACADO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 143.622140000000000000
          Top = 139.842610000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Desconto')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 196.535560000000000000
          Top = 143.622140000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'desconto'
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBParcelas."desconto"]')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 154.960730000000000000
          Top = 158.740260000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Sobre')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 192.756030000000000000
          Top = 158.740260000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[<frxDBParcelas."desconto"> + <frxDBParcelas."valorprazo">]')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 170.078850000000000000
          Top = 188.976500000000000000
          Width = 502.677490000000000000
          Height = 18.897650000000000000
          DataField = 'nome'
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBParcelas."nome"]')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 170.078850000000000000
          Top = 207.874150000000000000
          Width = 272.126160000000000000
          Height = 18.897650000000000000
          DataField = 'rua'
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBParcelas."rua"]')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 445.984540000000000000
          Top = 207.874150000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'BAIRRO:')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 495.118430000000000000
          Top = 207.874150000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBParcelas."bairrocliente"]')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 170.078850000000000000
          Top = 226.771800000000000000
          Width = 291.023810000000000000
          Height = 18.897650000000000000
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBParcelas."cidade"]')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 464.882190000000000000
          Top = 226.771800000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'CEP:')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 495.118430000000000000
          Top = 226.771800000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          DataField = 'cep'
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBParcelas."cep"]')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 453.543600000000000000
          Top = 245.669450000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'IE/RG:')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 170.078850000000000000
          Top = 264.567100000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          DataField = 'pessoanumero'
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBParcelas."pessoanumero"]')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 495.118430000000000000
          Top = 245.669450000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          DataField = 'documento'
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBParcelas."documento"]')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 468.661720000000000000
          Top = 264.567100000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'UF:')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 495.118430000000000000
          Top = 264.567100000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBParcelas."estado"]')
          ParentFont = False
        end
        object PictureFatura: TfrxPictureView
          Left = 7.559060000000000000
          Top = 7.559060000000000000
          Width = 260.787570000000000000
          Height = 83.149660000000000000
          Picture.Data = {
            07544269746D617016110000424D161100000000000036000000280000004800
            0000140000000100180000000000E0100000C40E0000C40E0000000000000000
            0000FFFFFFFFFFFFFCFCFCCECDCDFFFFFFE3E3E3CFCFD0FFFFFFF1F1F1CDCDCD
            FAFAFADDDDDDFFFFFFE4E3E3FFFFFFE4E4E4DBDCDCFFFFFFECECECFBFBFBFCFC
            FCCECECDF9F9F9FFFFFFB5B5B58D8D8E9E9E9DF8F8F8F4F4F4FAFAFAD0D0D0D3
            D3D4FEFEFEFFFFFFFFFFFFD7D7D8DBDADAFDFDFDF2F2F2DDDDDDFEFEFEE9E9E9
            FFFFFFFEFEFECFCFD0CFCFCFFAFAFAF0F0F1FAFAFADADADACECECEEEEEEEFFFF
            FFE7E7E7ECECECFEFEFED0D0D1E9E9E9F1F1F1FBFBFBE1E1E1FBFBFBF4F4F4FA
            FAFACFCFCFD4D4D5FFFFFFCECECECECECEFAFAFAFFFFFFFFFFFFFFFFFFFFFFFF
            A9A8A8D2D2D2DCDCDC999999DFDFDFF7F7F7585859F1F1F1FDFDFD3C3A3AFFFF
            FF545453ECECEC969696C7C7C7B2B2B2999A9AEBEBEB424140EDEDED414141FA
            FAF9585757E7E7E7868686D9D9D9C0C0C06F6F6FDDDDDD696969F9F9F9FFFFFF
            929394D0D0D0E7E7E7EFEFEFB3B3B23E3E3FF9F9F97B7B7AFFFFFFFFFFFFE0E0
            E0C7C7C68C8C8CAFAEAEDFDFDFECECECD8D7D73F3F3FFEFEFE4C4D4EF9F9F946
            4646DFDFDFF1F1F1A8A7A7E7E7E7484747DEDEDEBCBCBC545352E1E1E15A5A5A
            FFFFFFE0E0E0D3D3D37E7D7EFFFFFFFFFFFFFFFFFFFFFFFFABABABE2E2E1DADA
            DA7A7A79B9B9B9F6F6F668686AFEFEFEFFFFFF3E3D3DFEFEFE565658E8E8E8B0
            B0AFD8D8D8A5A5A4999A9AEBEBEB403F3EFCFCFB464646F8F8F8616161F2F2F2
            868686D9D9D9C0C0C0F3F3F3B3B3B3484949FAFAFAFFFFFF8E8F90AAAAA9C9C9
            C8EFEFEFB7B7B73E4043F1F1F1848485FFFFFFF9F9F94D4D4DC5C5C5F6F6F6B1
            B0B0DFDFDF4B4B4DC3C3C3E4E4E4FDFDFD555656FEFEFE40403FB9B9B9E1E1E1
            A8A8A8E6E6E64B4A4ADADADAC0C1C2F2F2F2B3B3B33F3F3FFFFFFF404040C4C4
            C4F5F5F5FFFFFFFFFFFFFFFFFFFFFFFF7474749C9B9AFFFFFFE2E2E2AFAFB0FE
            FEFEF0F0F0AEAEADF5F6F6C0BFBEB3B3B2FCFCFCFFFFFFD7D7D8C6C6C6FFFFFF
            989999EAEBEBFCFCFCAFAFAFF6F6F6FFFFFFEDEDEDB0B0AFE1E1E0F0F0F0E7E7
            E7D9D9D9AFAEAEDCDDDDFFFFFFFFFFFFFFFFFFC9C9C9C2C2C2FCFCFCB0B0AFB7
            B7B7B7B6B5FCFCFCFFFFFFFFFFFFD6D7D7AEAEADE7E7E5E0E0E0F2F2F2F2F2F2
            B0AFAFC2C2C2E6E6E63B3A3ADDDEDEFFFFFFB6B6B6DDDDDDE9E9E9B0AFAFB7B7
            B7BEBEBEFFFFFFD1D1D1AFAEAEE0E0E0FFFFFFDADADAAFAEAEE1E1E1FFFFFFFF
            FFFFFFFFFFFFFFFFEAEAEAF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9FAFAF9FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F3DDDAB6ECE9C4ECE9C4FD
            FDF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEAF7F7F7FFFFFFFFFFFFFFFFFFFFFF
            FFD6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFEFEFECDCDCEB2B2B1ADAEB0BABCBDFFFFFFFFFFFFFFFFFFF8F8F9CACB
            CCB3B4B4ADAEB0ADAEB0ADAEB0C6C7C8FFFFFFFFFFFFFFFFFFFEFEFED1D2D3B7
            B7B7B6B7B8FFFFFFFFFFFFFCFCF6ACA205ADA400ADA400F6F5E5FFFFFFFFFFFF
            EAE7BFE3DFA6E3DFA6E3DFA6E3DFA6E3DFA6E3DFA6E3DFA6E5E1AEECE9C5FCFC
            F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDECEBC6E4E0ABECE9C3FDFCF9FF
            FFFFFFFFFFFFFFFFFFFFFFFEFEFCE6E3B1E6E3B1EDEAC7FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFF7F6E6E8E7BAE6E3B1E6E3B1FFFFFFFFFFFFF3F3F41B1E231619
            20171A20171A203F4045FFFFFFFDFDFD8183850F1218161920171A20171A2017
            1A20171A205C5D61FFFFFFFFFFFF9FA0A10F1218161920171A20313337FFFFFF
            FFFFFFFCFCF6ACA205ADA400ADA400F6F5E5FFFFFFFFFFFFC2BA43ADA400ADA4
            00ADA400ADA400ADA400ADA400ADA400ADA400ADA400ABA104F9F8EFFFFFFFFF
            FFFFFFFEFCCDC869ACA104ADA400ADA400ADA400ACA103C8C156FEFEFBFFFFFF
            FFFFFFFAFAEFABA100ADA400C2BA45FFFFFFFFFFFFFFFFFFFFFFFFC1B944ACA3
            00ADA400ADA400ADA400FFFFFFFFFFFF838586171A20181B2111151B3C3E4160
            6265FFFFFF71737616191F181B210F13193034383D3F443D40443D4044797A7B
            FFFFFFBEBFC113161C181B2114181D1C20244D4F4CEEECCBEEECCBEDEAC7BCB5
            36BCB635BCB635E5E2B0E8E6BBE8E6BBC8C45ABDB63FBDB63FBDB63FBDB63FBD
            B63FBDB63FBDB640BBB438ADA400ADA400B9AF26FFFFFFFEFEFDBCB334ADA400
            ADA400ABA101AEA404ABA101ADA400ADA400B7AE26FEFEFAFFFFFFFAFAEFABA1
            00ADA400C2BA45FFFFFFFFFFFFFFFFFFF4F1DCACA300ADA400ADA400B0A608B1
            A811FFFFFFFFFFFF35383C181B2111151AE8E8E8FFFFFFFFFFFFF7F7F70E1217
            181B211C1F24F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD1F2227181B
            2115181EB6B7B9FFFFFFF2EFD4ACA300ADA400AFA409FEFDFAFFFFFFFFFFFFB1
            A810ADA400ADA400E5E2AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFB0A611ADA400AEA504FDFDF8D3CD78ACA300ADA400DCD791FFFFFFFFFF
            FFFFFFFFDFDC9EACA202ADA400CAC35BFFFFFFFAFAEFABA100ADA400C2BA45FF
            FFFFFFFFFFFFFFFFD4D07BADA400ADA400D3CD77FFFFFFFFFFFFFFFFFFFFFFFF
            282A2C181B2112151BF0F1F1FFFFFFFFFFFFB6B7B8181B21181B212F32368081
            857F80857F80857F80857F8085A6A7A8E6E6E613161C181B2124272CFFFFFFFF
            FFFFF2EFD4ACA300ADA400B0A709FEFDFAFFFFFFFFFFFFB1A810ADA400ADA400
            E5E2AFFFFFFFFFFFFFFEFEFEFDFDFBFBFAF3FBFAF3F9F9F0E9E6BCADA403ADA4
            00B0A707FEFDF9ACA202ADA400CDC767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4
            CF7BADA400ABA100FFFFFFFAFAEFABA100ADA400C2BA45FFFFFFFFFFFFFFFFFF
            CEC763ADA400ADA400E4E1ABFFFFFFFFFFFFFFFFFFFFFFFF292C31181B211216
            1BF1F1F2FFFFFFFFFFFF9A9C9E181B21181B21181B21181B21181B21181B2118
            1B21181B215D5E62DBDCDC11141A181B21494B4EFFFFFFFFFFFFF3F2DBB9B02A
            B9B02BBAB230D7D7D7D7D7D7D7D7D7BDB53EBEB53BBEB53BEBE8BEFFFFFFECE9
            C5ADA307ACA200ADA400ADA400ADA400ADA400ADA400ADA400CCC661FFFFFFAB
            A100ADA400EEECC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F5E5ACA300ADA400
            FBFAF2FAFAEFABA100ADA400C2BA45FFFFFFFFFFFFFFFFFFCEC762ADA400ADA4
            00E7E4B5FFFFFFFFFFFFFFFFFFFFFFFF292C31181B2112161BF1F1F2FFFFFFFF
            FFFFABABAB181B21181B21171A2014171C14171C14171C14171C14171C5C5E62
            E2E3E313161C181B21373A3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7171A
            1F13161B13161BE7E8EAFFFFFFFFFFFFFFFFFFFFFFFEA99E02ADA400ADA400B1
            A610B3A918B3A919B3A91ABBB32EE5E2AFFFFFFFFFFFFFABA100ADA400E5E1AD
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEBCAADA400ABA000FFFFFEFAFAEFABA1
            00ADA400C2BA45FFFFFFFFFFFFFFFFFFCEC762ADA400ADA400E7E4B5FFFFFFFF
            FFFFFFFFFFFFFFFF292C31181B2112161BF1F1F2FFFFFFFFFFFFDFDFDF14171D
            181B213C3E42F1F1F2F0F0F1F0F0F1F0F0F1F0F0F1F5F5F5F8F8F8171A1F181B
            210C0F15FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7171A1F181B21181B21E7
            E8E9FFFFFFFFFFFFFFFFFFF3F1D7ADA400ADA400B8B023FEFEFDFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3AA15ADA400B8B023FEFEFBFFFFFFFFFF
            FFFFFFFFFFFFFFBCB330ADA400AFA405FFFFFFFAFAEFABA100ADA400C2BA45FF
            FFFFFFFFFFFFFFFFCEC762ADA400ADA400E7E4B5FFFFFFFFFFFFEEEEEEE8E8E8
            272A2F181B2113171CDFDFDFE8E8E8ECECECFFFFFF111319181B21171A20ADAE
            B0E2E2E3E8E8E8E8E8E8E8E8E8EFEFEFFFFFFF4D4F52181B21181B2147494ECF
            D0D1E3E3E4E4E4E5E4E4E5DEDFDF27292D272B2F272B2FDADADAE6E7E7E6E7E7
            F5F5F5F5F3E0ADA400ADA400B0A70FF1EFD4F2F0D6F2F0D6F1F0D4F1F0D4F1F0
            D4F7F5E5FFFFFFF1EFD3ACA202ADA400AEA503DED999EDEAC5E1DEA1B0A70AAD
            A400ACA300E8E5B7F1EFD4EEEDCCACA200ADA400BFB73BF1EFD4F1EFD4FAF9EE
            CEC762ADA400ADA400DDD996F1EFD4F1EFD4595B5E15181E181B21181B21181B
            2115181E15181E3D3E43FFFFFFC7C7C90E1117181B2115191E15181E15181E15
            181E15181E5B5C5FFFFFFFF0F0F10A0E13181B21181B2115181E15181E15181E
            15181E16191EFAFAFAFFFFFFFFFFFF25292D15181E15181E9D9EA0FFFFFFABA0
            00ADA400ADA400ACA300ACA300ACA300ACA300ACA300ACA300CAC55CFFFFFFFF
            FFFFE4E1ADABA200ADA400ADA400ACA300ADA400ADA400ABA200DEDA99D2CD73
            ACA300ACA300ADA400ADA400ADA400ACA300ACA300E0DD9ECEC762ADA400ADA4
            00ADA400ACA300ACA3005A5D6015181D181B21181B21181B2116191E15181D3E
            4044FFFFFFFFFFFFE0E0E1494C4F212429171A1F15181D15181D15181D5C5F62
            FFFFFFFFFFFFF0F1F16B6D70282C301B1E2215181D15181D15181D161A1FF9F9
            F9FFFFFFFFFFFF272B2F181B21181B219E9FA2FFFFFFF9F9EDBEB83DAFA60BAD
            A403ADA403ADA403ADA403ADA403ADA403CBC55EFFFFFFFFFFFFFFFFFFFAF9EF
            CDC865B5AB1BAEA406B3AA18CBC562F9F7E9FFFFFFD2CD75AFA605AFA605ADA4
            00ADA400ADA400AFA605AFA605E0DCA0CEC762ADA400ADA400AEA502AFA605AF
            A605FDFDFDFCFCFC292C31181B2112161BF0F0F0FCFCFCFDFDFDFFFFFFFFFFFF
            FFFFFFFFFFFFFEFEFEFCFCFCFCFCFCFCFCFCFCFCFCFDFDFDFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFDFDFDFCFCFCFCFCFCFCFCFCFCFCFCFFFFFFFFFFFFFFFFFF2A
            2C2F15191E15191EA0A0A0FFFFFFFFFFFFFFFFFFFEFEFDFEFEFCFEFEFCFEFEFC
            FEFEFCFEFEFCFEFEFCFEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
            FDFFFFFEFFFFFFFFFFFFFFFFFFFFFEFEFEFEFDFBFBF3ABA100ADA400BEB639FE
            FEFDFEFEFDFFFFFECEC762ADA400ADA400E6E3B3FEFEFDFEFEFDFFFFFFFFFFFF
            292C31181B2112161BF1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFDFDF8AAA000ADA400ADA400C4BC4BC7C152ECE9C1
            CEC762ADA400ADA400E7E4B5FFFFFFFFFFFFFFFFFFFFFFFF292C31181B211216
            1BF1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFBFB740ACA200ADA400ADA400ADA400E2DEA3CEC762ADA400ADA4
            00E7E4B5FFFFFFFFFFFFFFFFFFFFFFFF67696B5A5C60585A5EF5F5F5FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
            FCE6E3B1CBC55DC5C34EC5C34EEAE7BEDDD893C5C34EC5C34EEEECCAFFFFFFFF
            FFFF}
        end
        object Memo44: TfrxMemoView
          Left = 188.976500000000000000
          Top = 287.244280000000000000
          Width = 487.559370000000000000
          Height = 37.795300000000000000
          DataSet = frxDBParcelas
          DataSetName = 'frxDBParcelas'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '[frxDBParcelas."valorextenso1"] [frxDBParcelas."valorextenso2"] ' +
              '[frxDBParcelas."valorextenso3"] [frxDBParcelas."valorextenso4"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 98.267780000000000000
          Top = 374.173470000000000000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'DATA DO ACEITE')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Left = 680.315400000000000000
          Top = 185.196970000000000000
          Height = 102.047310000000000000
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
        end
      end
    end
  end
end
