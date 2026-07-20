inherited dtmImprimeFichaCobranca: TdtmImprimeFichaCobranca
  OldCreateOrder = False
  Left = 466
  Top = 136
  Height = 571
  Width = 576
  object qryDadosClientes: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnCalcFields = qryDadosClientesCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'Select    vfc.codigo,'
      
        '              cast(coalesce(vfc.razao,vfc.nome) as varchar(60)) ' +
        'as nome,'
      
        '              formatar_cpf_cnpj(vfc.pessoanumero) as pessoanumer' +
        'o,'
      '              c.Iddocumento,'
      '              c.nascto,'
      
        '              (Select descricao From conceitos Where codigo = c.' +
        'conceito) as NomeConceito,'
      '              Case When (c.sexo = '#39'F'#39') Then '#39'Feminino'#39
      '                       when (c.sexo = '#39'M'#39') then '#39'Masculino'#39
      
        '                       Else                             '#39'Empresa' +
        #39
      '              End as Sexo,'
      '              Case When (c.civil = '#39'C'#39') Then '#39'Casado'#39
      '                       When (c.civil = '#39'S'#39') Then '#39'Solteiro'#39
      '                       When (c.civil = '#39'D'#39') Then '#39'Divorciado'#39
      '                       When (c.civil = '#39'V'#39') Then '#39'Vi'#250'vo'#39
      '                       Else                      null'
      '              End as EstadoCivil,'
      ''
      '              /*'
      
        '              translate(translate(substr(vfc.rua,1,50),chr(10),'#39 +
        ' '#39'),chr(13),'#39' '#39') as Residencia_Rua_1,'
      
        '              translate(translate(substr(vfc.rua,51,50),chr(10),' +
        #39' '#39'),chr(13),'#39' '#39') as Residencia_Rua_2,*/'
      ''
      '              vfc.rua as Rua_Residencia,'
      '              vfc.numero as Numero_Residencia,'
      '              vfc.complemento as Complemento_Residencia,'
      ''
      '              vfc.estado,'
      '              vfc.cep,'
      '              (Select cr.nome From cidades cr'
      
        '                                        Where  (cr.estado = vfc.' +
        'estado)  and'
      
        '                                                    (cr.codigo =' +
        ' vfc.cidade)) as CidadeResidencia,'
      '              (Select br.nome From bairros br'
      
        '                                        Where  (br.estado = vfc.' +
        'estado)  and'
      
        '                                                    (br.cidade =' +
        ' vfc.cidade)  and'
      
        '                                                    (br.codigo =' +
        ' vfc.bairro)) as BairroResidencia,'
      
        '              formatar_fone_fax(vfc.foneddd,vfc.fonenumero,vfc.f' +
        'oneramal) as fone,'
      
        '              formatar_fone_fax(c.fone2ddd,c.fone2numero,c.fone2' +
        'ramal) as fone2,'
      '              vfc.empresa,'
      ''
      '              c.emprua as Rua_Emprego,'
      '              c.empnumero as Numero_Emprego,'
      '              c.empcomplemento as Complemento_Emprego,'
      ''
      '              /*'
      
        '              translate(translate(substr(c.emprua,1,50),chr(10),' +
        #39' '#39'),chr(13),'#39' '#39') as  Emprego_Rua_1,'
      
        '              translate(translate(substr(c.emprua,51,50),Chr(10)' +
        ','#39' '#39'),Chr(13),'#39' '#39') as Emprego_Rua_2,'
      '              */'
      ''
      
        '              formatar_fone_fax(vfc.fonedddempresa,vfc.fonenumer' +
        'oempresa,vfc.foneramalempresa) as foneempresa,'
      '              c.emprendavalor,'
      '              c.empadmissao,'
      
        '              (Select ce.descricao From cargos ce Where (ce.codi' +
        'go = c.empcargo)) as CargoCliente,'
      '              coalesce(c.connome, c2.nome) as connome,'
      '              coalesce(c.conempresa, c2.empresa) as conempresa,'
      ''
      '              c.conrua as Rua_EmpregoConjuge,'
      '              c.connumero as Numero_EmpregoConjuge,'
      '              c.concomplemento as Complemento_EmpregoConjuge,'
      ''
      '              /*'
      
        '              translate(translate(substr(coalesce(c.conrua, c2.r' +
        'ua),1,50),chr(10),'#39' '#39'),chr(13),'#39' '#39') as  EmpregoConjuge_Rua_1,'
      
        '              translate(translate(substr(coalesce(c.conrua,c2.ru' +
        'a),5,50),chr(10),'#39' '#39'),chr(13),'#39' '#39') as  EmpregoConjuge_Rua_2,'
      '              */'
      ''
      
        '              formatar_fone_fax(coalesce(c.confoneddd, c2.fonedd' +
        'd),'
      
        '                                             coalesce(c.confonen' +
        'umero, c2.fonenumero),'
      
        '                                             coalesce(c.confoner' +
        'amal, c2.foneramal)) as foneconjuge,'
      
        '              coalesce(c.conrendavalor, c2.emprendavalor) as  co' +
        'nrendavalor,'
      
        '              coalesce(c.conadmissao, c2.empadmissao) as conadmi' +
        'ssao,'
      '              coalesce(c.connascto, c2.nascto) as connascto,'
      
        '              (Select descricao From cargos Where (codigo = coal' +
        'esce(c.concargo, c2.empcargo))) as CargoConjuge,'
      '              c.pai,'
      '              c.mae,'
      '              (Select cn.nome From cidades cn'
      
        '                                         Where  (cn.estado = c.n' +
        'aturalestado)  and'
      
        '                                                      (cn.codigo' +
        ' = c.naturalcidade)) as NomeCidadeNatural,'
      '              c.naturalestado,'
      '              c.referencia,'
      '              case When (c.reftipo = '#39'P'#39') Then '#39'Parente'#39
      '                      When (c.reftipo = '#39'A'#39') Then '#39'Amigo'#39
      '                      when (c.reftipo = '#39'T'#39') Then '#39'Trabalho'#39'  '
      '                      Else                                null'
      '              End as TipoReferencia,'
      
        '              formatar_fone_fax(c.reffoneddd,c.reffonenumero,c.r' +
        'effoneramal) as fonereferencia,'
      
        '              translate(translate(substr(c.observacoes,1,84),chr' +
        '(10),'#39' '#39'),chr(13),'#39' '#39')   as Observacoes_1,'
      
        '              translate(translate(substr(c.observacoes,85,84),ch' +
        'r(10),'#39' '#39'),chr(13),'#39' '#39')  as Observacoes_2,'
      
        '              translate(translate(substr(c.observacoes,165,84),c' +
        'hr(10),'#39' '#39'),chr(13),'#39' '#39') as Observacoes_3,'
      
        '              translate(translate(substr(c.observacoes,245,84),c' +
        'hr(10),'#39' '#39'),chr(13),'#39' '#39') as Observacoes_4,'
      
        '              translate(translate(substr(c.observacoes,325,84),c' +
        'hr(10),'#39' '#39'),chr(13),'#39' '#39') as Observacoes_5,'
      '              case when vfc.pessoatipo = '#39'F'#39' then'
      '                  situacao_cliente_spc(vfc.codigo,vfc.tipo) '
      '              else '
      '                null '
      '             end as SPC'
      
        'From     vfornecedores vfc left join clientes c on ((vfc.codigo ' +
        '= c.codigo) and (vfc.tipo = '#39'C'#39'))'
      
        '                                          left join clientes c2 ' +
        'on c2.codigo = vfc.conjuge'
      'Where   (vfc.codigo  =:cliente) and '
      '              (vfc.tipo =:tipo)')
    RequestLive = False
    Left = 134
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'cliente'
        ParamType = ptUnknown
        Value = '911106'
      end
      item
        DataType = ftString
        Name = 'tipo'
        ParamType = ptUnknown
        Value = 'C'
      end>
    object qryDadosClientescodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryDadosClientesnome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object qryDadosClientesiddocumento: TStringField
      FieldName = 'iddocumento'
    end
    object qryDadosClientespessoanumero: TStringField
      FieldName = 'pessoanumero'
      Size = 18
    end
    object qryDadosClientesnascto: TDateField
      Alignment = taCenter
      FieldName = 'nascto'
      EditMask = '99/99/9999;1; '
    end
    object qryDadosClientesnomeconceito: TStringField
      FieldName = 'nomeconceito'
      Size = 30
    end
    object qryDadosClientessexo: TMemoField
      FieldName = 'sexo'
      BlobType = ftMemo
    end
    object qryDadosClientesestadocivil: TMemoField
      FieldName = 'estadocivil'
      BlobType = ftMemo
    end
    object qryDadosClientesresidencia_rua_1: TStringField
      FieldKind = fkCalculated
      FieldName = 'residencia_rua_1'
      Size = 100
      Calculated = True
    end
    object qryDadosClientesestado: TStringField
      FieldName = 'estado'
      Size = 50
    end
    object qryDadosClientescep: TIntegerField
      FieldName = 'cep'
      DisplayFormat = '0'
    end
    object qryDadosClientescidaderesidencia: TStringField
      FieldName = 'cidaderesidencia'
      Size = 50
    end
    object qryDadosClientesbairroresidencia: TStringField
      FieldName = 'bairroresidencia'
      Size = 50
    end
    object qryDadosClientesempresa: TStringField
      FieldName = 'empresa'
      Size = 50
    end
    object qryDadosClientesemprego_rua_1: TStringField
      FieldKind = fkCalculated
      FieldName = 'emprego_rua_1'
      Size = 100
      Calculated = True
    end
    object qryDadosClientesemprendavalor: TFloatField
      FieldName = 'emprendavalor'
      DisplayFormat = '0.00'
    end
    object qryDadosClientesempadmissao: TDateField
      Alignment = taCenter
      FieldName = 'empadmissao'
      EditMask = '99/99/9999;1; '
    end
    object qryDadosClientescargocliente: TStringField
      FieldName = 'cargocliente'
      Size = 50
    end
    object qryDadosClientesconnome: TStringField
      FieldName = 'connome'
      Size = 50
    end
    object qryDadosClientesconempresa: TStringField
      FieldName = 'conempresa'
      Size = 50
    end
    object qryDadosClientesempregoconjuge_rua_1: TStringField
      FieldKind = fkCalculated
      FieldName = 'empregoconjuge_rua_1'
      Size = 100
      Calculated = True
    end
    object qryDadosClientesconrendavalor: TFloatField
      FieldName = 'conrendavalor'
      DisplayFormat = '0.00'
    end
    object qryDadosClientesconadmissao: TDateField
      Alignment = taCenter
      FieldName = 'conadmissao'
      EditMask = '99/99/9999;1; '
    end
    object qryDadosClientesconnascto: TDateField
      Alignment = taCenter
      FieldName = 'connascto'
      EditMask = '99/99/9999;1; '
    end
    object qryDadosClientescargoconjuge: TStringField
      FieldName = 'cargoconjuge'
      Size = 50
    end
    object qryDadosClientespai: TStringField
      FieldName = 'pai'
      Size = 40
    end
    object qryDadosClientesmae: TStringField
      FieldName = 'mae'
      Size = 40
    end
    object qryDadosClientesnomecidadenatural: TStringField
      FieldName = 'nomecidadenatural'
      Size = 50
    end
    object qryDadosClientesnaturalestado: TStringField
      FieldName = 'naturalestado'
      Size = 2
    end
    object qryDadosClientesreferencia: TStringField
      FieldName = 'referencia'
      Size = 40
    end
    object qryDadosClientestiporeferencia: TMemoField
      FieldName = 'tiporeferencia'
      BlobType = ftMemo
    end
    object qryDadosClientesobservacoes_1: TMemoField
      FieldName = 'observacoes_1'
      BlobType = ftMemo
    end
    object qryDadosClientesobservacoes_2: TMemoField
      FieldName = 'observacoes_2'
      BlobType = ftMemo
    end
    object qryDadosClientesobservacoes_3: TMemoField
      FieldName = 'observacoes_3'
      BlobType = ftMemo
    end
    object qryDadosClientesobservacoes_4: TMemoField
      FieldName = 'observacoes_4'
      BlobType = ftMemo
    end
    object qryDadosClientesobservacoes_5: TMemoField
      FieldName = 'observacoes_5'
      BlobType = ftMemo
    end
    object qryDadosClientesspc: TDateField
      Alignment = taCenter
      FieldName = 'spc'
      EditMask = '99/99/9999;1; '
    end
    object qryDadosClientesfone: TStringField
      FieldName = 'fone'
      Size = 10
    end
    object qryDadosClientesfone2: TStringField
      FieldName = 'fone2'
      Size = 50
    end
    object qryDadosClientesfoneempresa: TStringField
      FieldName = 'foneempresa'
      Size = 50
    end
    object qryDadosClientesfoneconjuge: TStringField
      FieldName = 'foneconjuge'
      Size = 10
    end
    object qryDadosClientesfonereferencia: TStringField
      FieldName = 'fonereferencia'
      Size = 24
    end
    object qryDadosClientesrua_residencia: TStringField
      FieldName = 'rua_residencia'
      Size = 100
    end
    object qryDadosClientesnumero_residencia: TIntegerField
      FieldName = 'numero_residencia'
    end
    object qryDadosClientescomplemento_residencia: TStringField
      FieldName = 'complemento_residencia'
      Size = 100
    end
    object qryDadosClientesrua_emprego: TStringField
      FieldName = 'rua_emprego'
      Size = 100
    end
    object qryDadosClientesnumero_emprego: TIntegerField
      FieldName = 'numero_emprego'
    end
    object qryDadosClientescomplemento_emprego: TStringField
      FieldName = 'complemento_emprego'
      Size = 100
    end
    object qryDadosClientesrua_empregoconjuge: TStringField
      FieldName = 'rua_empregoconjuge'
      Size = 100
    end
    object qryDadosClientesnumero_empregoconjuge: TIntegerField
      FieldName = 'numero_empregoconjuge'
    end
    object qryDadosClientescomplemento_empregoconjuge: TStringField
      FieldName = 'complemento_empregoconjuge'
      Size = 100
    end
  end
  object qryContratosFichaCobrancaImprimir: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryContratosFichaCobrancaImprimirAfterScroll
    OnCalcFields = qryContratosFichaCobrancaImprimirCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'Vencimentos'
        ParamType = ptUnknown
        Value = 'and p.datavencto between '#39'2009-06-08'#39' and '#39'2009-06-10'#39
      end
      item
        DataType = ftString
        Name = 'Contratos'
        ParamType = ptUnknown
        Value = 'Where t.numero = 161079'
      end
      item
        DataType = ftString
        Name = 'Ordenacao'
        ParamType = ptUnknown
        Value = 'order by cliente'
      end>
    Sql.Strings = (
      ';select * from'
      '('
      'Select t.numero,'
      '           t.cliente,'
      '           t.tipocliente,'
      '           t.data,'
      '           t.valorprazo,'
      '           t.filialvenda,'
      '           t.avalista,'
      ''
      '           t.entrua as Rua_Entrega,'
      '           t.entnumero as Numero_Residencia,'
      '           t.entcomplemento as Complemento_Residencia,'
      ''
      '           /*'
      
        '           translate(translate(substr(t.entrua,1,35),chr(10),'#39' '#39 +
        '),chr(13),'#39' '#39')  as Entrega_Rua_1,'
      
        '           translate(translate(substr(t.entrua,36,50),chr(10),'#39' ' +
        #39'),chr(13),'#39' '#39') as Entrega_Rua_2,'
      '           */'
      ''
      '           t.entcep as cepEntrega,'
      '           t.entestado,'
      '           (Select ce.nome From cidades ce'
      
        '                                      Where  (ce.estado = t.ente' +
        'stado)  and'
      
        '                                                   (ce.codigo = ' +
        't.entcidade)) as CidadeEntrega,'
      '           (Select be.nome From bairros be'
      
        '                                      Where  (be.estado = t.ente' +
        'stado)  and'
      
        '                                                   (be.cidade = ' +
        't.entcidade)  and'
      
        '                                                   (be.codigo = ' +
        't.entbairro)) as BairroEntrega,'
      
        '           formatar_fone_fax(t.entfoneddd,t.entfonenumero,t.entf' +
        'oneramal) as foneentrega,'
      '           false as Selecionar,'
      '           t.nome,'
      '           (Select cr.nome From cidades cr'
      
        '                                     Where  (cr.estado = vf.esta' +
        'do)  and'
      
        '                                                  (cr.codigo = v' +
        'f.cidade)) as CidadeResidencia,'
      '           (Select br.nome From bairros br'
      
        '                                     Where  (br.estado = vf.esta' +
        'do)  and'
      
        '                                                  (br.cidade = v' +
        'f.cidade)  and'
      
        '                                                  (br.codigo = v' +
        'f.bairro)) as BairroResidencia,'
      '           a.nome as NomeAvalista,'
      ''
      ''
      '           a.rua as Rua_Avalista,'
      '           a.numero as Numero_Avalista,'
      '           a.complemento as Complemento_Avalista,'
      ''
      '           /*'
      
        '           translate(translate(substr(a.rua,1,28),chr(10),'#39' '#39'),c' +
        'hr(13),'#39' '#39')  as Avalista_Rua_1,'
      
        '           translate(translate(substr(a.rua,29,70),chr(10),'#39' '#39'),' +
        'chr(13),'#39' '#39') as Avalista_Rua_2,'
      '           */'
      ''
      '           a.estado as EstadoAvalista,'
      '           a.cep as CEPAvalista,'
      '           (Select nome From  cidades'
      '                                 Where (estado = a.estado)  and'
      
        '                                             (codigo = a.cidade)' +
        ') as CidadeAvalista,'
      '           (Select nome From  bairros'
      '                                 Where (estado = a.estado)  and'
      
        '                                             (cidade = a.cidade)' +
        '  and'
      
        '                                             (codigo = a.bairro)' +
        ') as BairroAvalista,'
      
        '            formatar_fone_fax(a.foneddd,a.fonenumero,a.foneramal' +
        ') as foneavalista,'
      '          (Select sum(p.valorvencto) From parcelas p'
      
        '                                                       Where p.c' +
        'ontrato = t.numero'
      
        '                                                                ' +
        ' %Vencimentos'
      
        '                                                                ' +
        ' and p.datapagto is null) as totalAberto'
      
        'From  contratos t join vfornecedores vf on t.cliente = vf.codigo' +
        ' and t.tipocliente = vf.tipo Left Join clientes a on (a.codigo =' +
        ' t.avalista)'
      '%Contratos'
      '/* Preenchido em RunTime */'
      ') as temp'
      '%Ordenacao'
      '/* ordenacao */')
    RequestLive = True
    Left = 126
    Top = 15
    object qryContratosFichaCobrancaImprimirnumero: TStringField
      FieldName = 'numero'
      Required = True
    end
    object qryContratosFichaCobrancaImprimircliente: TIntegerField
      FieldName = 'cliente'
      Required = True
      DisplayFormat = '0'
    end
    object qryContratosFichaCobrancaImprimirdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryContratosFichaCobrancaImprimirvalorprazo: TFloatField
      FieldName = 'valorprazo'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryContratosFichaCobrancaImprimirfilialvenda: TIntegerField
      FieldName = 'filialvenda'
      Required = True
      DisplayFormat = '0'
    end
    object qryContratosFichaCobrancaImprimiravalista: TIntegerField
      FieldName = 'avalista'
      DisplayFormat = '0'
    end
    object qryContratosFichaCobrancaImprimirentestado: TStringField
      FieldName = 'entestado'
      Size = 2
    end
    object qryContratosFichaCobrancaImprimircidadeentrega: TStringField
      FieldName = 'cidadeentrega'
      Size = 50
    end
    object qryContratosFichaCobrancaImprimirbairroentrega: TStringField
      FieldName = 'bairroentrega'
      Size = 50
    end
    object qryContratosFichaCobrancaImprimirselecionar: TBooleanField
      FieldName = 'selecionar'
    end
    object qryContratosFichaCobrancaImprimirnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryContratosFichaCobrancaImprimircidaderesidencia: TStringField
      FieldName = 'cidaderesidencia'
      Size = 7
    end
    object qryContratosFichaCobrancaImprimirbairroresidencia: TStringField
      FieldName = 'bairroresidencia'
      Size = 6
    end
    object qryContratosFichaCobrancaImprimirnomeavalista: TStringField
      FieldName = 'nomeavalista'
      Size = 40
    end
    object qryContratosFichaCobrancaImprimirestadoavalista: TStringField
      FieldName = 'estadoavalista'
      Size = 2
    end
    object qryContratosFichaCobrancaImprimircidadeavalista: TStringField
      FieldName = 'cidadeavalista'
      Size = 50
    end
    object qryContratosFichaCobrancaImprimirbairroavalista: TStringField
      FieldName = 'bairroavalista'
      Size = 50
    end
    object qryContratosFichaCobrancaImprimircepentrega: TIntegerField
      FieldName = 'cepentrega'
      DisplayFormat = '0'
    end
    object qryContratosFichaCobrancaImprimircepavalista: TIntegerField
      FieldName = 'cepavalista'
      Required = True
      DisplayFormat = '0'
    end
    object qryContratosFichaCobrancaImprimirtipocliente: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
    object qryContratosFichaCobrancaImprimirfoneentrega: TStringField
      FieldName = 'foneentrega'
      Size = 35
    end
    object qryContratosFichaCobrancaImprimirfoneavalista: TStringField
      FieldName = 'foneavalista'
      Size = 35
    end
    object qryContratosFichaCobrancaImprimirrua_entrega: TStringField
      FieldName = 'rua_entrega'
      Size = 100
    end
    object qryContratosFichaCobrancaImprimirnumero_residencia: TIntegerField
      FieldName = 'numero_residencia'
    end
    object qryContratosFichaCobrancaImprimircomplemento_residencia: TStringField
      FieldName = 'complemento_residencia'
      Size = 100
    end
    object qryContratosFichaCobrancaImprimirrua_avalista: TStringField
      FieldName = 'rua_avalista'
      Size = 100
    end
    object qryContratosFichaCobrancaImprimirnumero_avalista: TIntegerField
      FieldName = 'numero_avalista'
    end
    object qryContratosFichaCobrancaImprimircomplemento_avalista: TStringField
      FieldName = 'complemento_avalista'
      Size = 100
    end
    object qryContratosFichaCobrancaImprimirtotalaberto: TFloatField
      FieldName = 'totalaberto'
    end
    object qryContratosFichaCobrancaImprimirentrega_rua_1: TStringField
      FieldKind = fkCalculated
      FieldName = 'entrega_rua_1'
      Size = 100
      Calculated = True
    end
    object qryContratosFichaCobrancaImprimiravalista_rua_1: TStringField
      FieldKind = fkCalculated
      FieldName = 'avalista_rua_1'
      Size = 100
      Calculated = True
    end
  end
  object qryParcelasFichaCobrancaQuitadas: TtecQuery
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
      ';select * from'
      '('
      'Select count(numero) as Numero, '
      '           max(datavencto) as DataVencto, '
      '           valorvencto, '
      '           max(datapagto) as DataPagto,'
      '           sum(valorpagto) as ValorPagto  '
      'From   parcelas '
      
        'Where (contrato =:contrato)  and datapagto is Not Null and (tipo' +
        'pagto='#39'B'#39' or tipopagto is null)'
      'Group By valorvencto'
      ') as temp'
      'Order  By datavencto')
    RequestLive = False
    Left = 134
    Top = 129
    ParamData = <
      item
        DataType = ftString
        Name = 'Contrato'
        ParamType = ptUnknown
        Value = '161079'
      end>
    object qryParcelasFichaCobrancaQuitadasnumero: TLargeintField
      FieldName = 'numero'
    end
    object qryParcelasFichaCobrancaQuitadasdatavencto: TDateField
      Alignment = taCenter
      FieldName = 'datavencto'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasFichaCobrancaQuitadasvalorvencto: TFloatField
      FieldName = 'valorvencto'
      DisplayFormat = '0.00'
    end
    object qryParcelasFichaCobrancaQuitadasdatapagto: TDateField
      Alignment = taCenter
      FieldName = 'datapagto'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasFichaCobrancaQuitadasvalorpagto: TFloatField
      FieldName = 'valorpagto'
      DisplayFormat = '0.00'
    end
  end
  object qryProdutosFichaCobranca: TtecQuery
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
      'Select  pc.produto,'
      '            pc.quantidade,'
      '            p.descricao'
      'From    produtoscontratos pc, produtos p'
      'Where (pc.contrato =:contrato) and '
      '            (pc.produto = p.codigo)'
      'Limit 20  ')
    RequestLive = False
    Left = 134
    Top = 297
    ParamData = <
      item
        DataType = ftString
        Name = 'Contrato'
        ParamType = ptUnknown
        Value = '161079'
      end>
    object qryProdutosFichaCobrancaproduto: TLargeintField
      FieldName = 'produto'
      Required = True
      DisplayFormat = '0'
    end
    object qryProdutosFichaCobrancadescricao: TStringField
      DisplayWidth = 50
      FieldName = 'descricao'
      Required = True
      Size = 100
    end
    object qryProdutosFichaCobrancaquantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
      DisplayFormat = '0.00'
    end
  end
  object qryNotasFichaCobranca: TtecQuery
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
      'select  n.numero as notafiscal'
      'from dadosfiscais df left join notas n on df.numero=n.dadofiscal'
      'Where df.contrato=:contrato and n.numero is not null')
    RequestLive = False
    Left = 134
    Top = 353
    ParamData = <
      item
        DataType = ftInteger
        Name = 'contrato'
        ParamType = ptUnknown
        Value = '161079'
      end>
    object qryNotasFichaCobrancanotafiscal: TIntegerField
      FieldName = 'notafiscal'
      DisplayFormat = '0'
    end
  end
  object frpContratosFichaCobrancaImprimir: TfrReport
    Dataset = fdsContratosFichaCobranca
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 384
    Top = 15
    ReportForm = {
      190000007A76000019FFFF00000A0050444643726561746F7200FFFFFFFFFF00
      000000340800009A0B0000000000000400000000000000040000000000040000
      000000E9010000000000000000000000030400466F726D00FEFFFFFFDC000000
      780000007C0100002C01000004000000FFFFFFFFFF020000006F080000EA0A00
      000000000000000000000000000000000000000400000000FFFF010000000000
      000000000000030400466F726D00FEFFFFFFDC000000780000007C0100002C01
      000004000000FFFFFFFFFF020000006F080000EA0A0000000000000000000000
      0000000000000000000400000000FFFF01000000000000000000000003040046
      6F726D00FEFFFFFFDC000000780000007C0100002C01000004000000FFFFFFFF
      FF020000006F080000EA0A000000000000000000000000000000000000000004
      00000000FFFF000000000000000000000000030400466F726D00FEFFFFFFDC00
      0000780000007C0100002C01000004000000FFFFFFFFFF020000006F080000EA
      0A00000000000000000000000000000000000000000400000000FFFF00000000
      0000000000000000030400466F726D00FEFFFFFFDC000000780000007C010000
      2C01000004000000FFFFFFFFFF00000000340800009A0B000000000000000000
      00000000000000000000000400000000FFFF0000000000000000000000000304
      00466F726D00FEFFFFFFDC000000780000007C0100002C01000004000000FFFF
      FFFFFF00000000340800009A0B00000000000000000000000000000000000000
      000400000000FFFF000000000000000000000000030400466F726D00FEFFFFFF
      DC000000780000007C0100002C01000004000000FFFFFFFFFF00000000340800
      009A0B00000000000000000000000000000000000000000400000000FFFF0000
      00000000000000000000030400466F726D00FEFFFFFFDC000000780000007C01
      00002C010000040000000200470300000C004461646F734D6573747265310002
      0100000000FDFFFFFFF5020000FE0100003000050001000000000000000000FF
      FFFF1F000000001900666473436F6E747261746F734669636861436F6272616E
      636100000000000000FFFF000000000002000000010000000000000001000000
      C800000014000000010000000000000000C803000006004D656D6F3733000200
      2A000000060000009E020000ED01000043000F0001000000000000000000FFFF
      FF1F2C020000000000000000000000FFFF000000000002000000010000000009
      0068656C766574696361000A0000000000000000000000000001000200000000
      00FFFFFF00000000020000000000000000005704000006004D656D6F35300002
      007C010000C40000004F0000000900000043000000F4010000000000000000FF
      FFFF1F2C02000000000001000C00434F4D504C454D454E544F5300000000FFFF
      0000000000020000000100000000090068656C76657469636100070000000200
      00000000090000000100020000000000FFFFFF00000000020000000000000000
      00F204000006004D656D6F353100020062000000C5000000130100000C000000
      43000000F4010000000000000000FFFFFF1F2C020000000000010018005B7172
      794461646F73436C69656E7465732E22706169225D00000000FFFF0000000000
      020000000100000000090068656C766574696361000800000000000000000008
      0000000100020000000000FFFFFF000000000200000000000000000098050000
      06004D656D6F38370002008A01000033010000410000000C00000043000000F4
      010000000000000000FFFFFF1F2C020000000000010023005B7172794461646F
      73436C69656E7465732E227469706F7265666572656E636961225D00000000FF
      FF0000000000020000000100000000090068656C766574696361000700000000
      0000000000090000000100020000000000FFFFFF000000000200000000000000
      00002B06000006004D656D6F343200020066010000F500000068000000090000
      0043000000F4010000000000000000FFFFFF1F2C020000000000010010005452
      4142414C484F20434F4E4A55474500000000FFFF000000000002000000010000
      0000090068656C76657469636100070000000200000000000900000001000200
      00000000FFFFFF0000000002000000000000000000B606000006004D656D6F33
      37000200800100007F0000004B0000000900000043000000F401000000000000
      0000FFFFFF1F2C0200000000000100080054524142414C484F00000000FFFF00
      00000000020000000100000000090068656C7665746963610007000000020000
      000000090000000100020000000000FFFFFF0000000002000000000000000000
      4B07000007004D656D6F3133350002007202000052000000510000000A000000
      43000000F4010000000000000000FFFFFF1F2C020000000000010011005B4441
      544520234464642F6D6D2F79795D00000000FFFF000000000002000000010000
      0000090068656C76657469636100070000000000000000000900000001000200
      00000000FFFFFF0000000002000000000000000000E507000007004D656D6F31
      3330000200E1010000520000008C0000000A00000043000000F4010000000000
      000000FFFFFF1F2C02000000000001001600434F4E4449434F45532044452050
      4147414D454E544F00000000FFFF000000000002000000010000000009006865
      6C7665746963610007000000000000000000080000000100020000000000FFFF
      FF00000000020000000000000000006E08000005004D656D6F31000200330000
      0006000000280000000C00000043000000F4010000000000000000FFFFFF1F2C
      02000000000001000700436C69656E746500000000FFFF000000000002000000
      0100000000090068656C76657469636100080000000000000000000900000001
      00020000000000FFFFFF00000000020000000000000000000B09000005004D65
      6D6F3200020062000000060000004F0000000C00000043000000F40100000000
      00000000FFFFFF1F2C02000000000001001B005B7172794461646F73436C6965
      6E7465732E22636F6469676F225D00000000FFFF000000000002000000010000
      0000090068656C76657469636100080000000000000000000800000001000200
      00000000FFFFFF00000000020000000000000000009109000005004D656D6F33
      000200C300000006000000220000000C00000043000000F40100000000000000
      00FFFFFF1F2C020000000000010004004E6F6D6500000000FFFF000000000002
      0000000100000000090068656C76657469636100080000000000000000000900
      00000100020000000000FFFFFF0000000002000000000000000400E009000005
      004C696E6535000200BE00000006000000000000002A00000001000400F40100
      00000000000000FFFFFF1F2C020000000000000000000000FFFF000000000002
      000000010000000004002F0A000005004C696E6536000200EC01000006000000
      000000002A00000001000400F4010000000000000000FFFFFF1F2C0200000000
      00000000000000FFFF00000000000200000001000000000000B70A000005004D
      656D6F350002003300000013000000280000000C00000043000000F401000000
      0000000000FFFFFF1F2C020000000000010006004E617363746F00000000FFFF
      0000000000020000000100000000090068656C76657469636100080000000000
      00000000090000000100020000000000FFFFFF00000000020000000000000000
      00610B000005004D656D6F3600020062000000130000004A0000000C00000043
      000000F4010000000000000000FFFFFF1F2C020000000000010028005B717279
      4461646F73436C69656E7465732E226E617363746F2220234464642F6D6D2F79
      7979795D00000000FFFF0000000000020000000100000000090068656C766574
      6963610008000000000000000000080000000100020000000000FFFFFF000000
      0002000000000000000400B00B000005004C696E65370002006A010000140000
      00000000001C00000001000400F4010000000000000000FFFFFF1F2C02000000
      0000000000000000FFFF00000000000200000001000000000000350C00000500
      4D656D6F37000200C300000013000000220000000C00000043000000F4010000
      000000000000FFFFFF1F2C0200000000000100030043504600000000FFFF0000
      000000020000000100000000090068656C766574696361000800000000000000
      0000090000000100020000000000FFFFFF0000000002000000000000000000BC
      0C000005004D656D6F39000200C300000021000000220000000C000000430000
      00F4010000000000000000FFFFFF1F2C020000000000010005004964656E7400
      000000FFFF0000000000020000000100000000090068656C7665746963610008
      000000000000000000090000000100020000000000FFFFFF0000000002000000
      000000000000470D000006004D656D6F313100020030000000210000002B0000
      000C00000043000000F4010000000000000000FFFFFF1F2C0200000000000100
      0800436F6E636569746F00000000FFFF00000000000200000001000000000900
      68656C7665746963610008000000000000000000090000000100020000000000
      FFFFFF0000000002000000000000000000EB0D000006004D656D6F3132000200
      6200000021000000500000000C00000043000000F4010000000000000000FFFF
      FF1F2C020000000000010021005B7172794461646F73436C69656E7465732E22
      6E6F6D65636F6E636569746F225D00000000FFFF000000000002000000010000
      0000090068656C76657469636100080000000000000000000800000001000200
      00000000FFFFFF00000000020000000000000004003A0E000005004C696E6538
      0002002A00000031000000C20100000000000001000800F40100000000000000
      00FFFFFF1F2C020000000000000000000000FFFF000000000002000000010000
      00000000C10E000006004D656D6F313300020071010000140000002C0000000C
      00000043000000F4010000000000000000FFFFFF1F2C02000000000001000400
      5365786F00000000FFFF0000000000020000000100000000090068656C766574
      6963610008000000000000000000090000000100020000000000FFFFFF000000
      0002000000000000000400100F000005004C696E65390002006A010000140000
      00820000000000000001000800F4010000000000000000FFFFFF1F2C02000000
      0000000000000000FFFF000000000002000000010000000000009A0F00000600
      4D656D6F31340002006F010000210000002E0000000C00000043000000F40100
      00000000000000FFFFFF1F2C02000000000001000700452E436976696C000000
      00FFFF0000000000020000000100000000090068656C76657469636100080000
      00000000000000090000000100020000000000FFFFFF00000000020000000000
      000000003610000006004D656D6F3135000200A201000014000000480000000C
      00000041000000F4010000000000000000FFFFFF1F2C02000000000001001900
      5B7172794461646F73436C69656E7465732E227365786F225D00000000FFFF00
      00000000020000000100000000090068656C7665746963610008000000000000
      000000080000000100020000000000FFFFFF0000000002000000000000000000
      D910000006004D656D6F3136000200A201000021000000480000000C00000041
      000000F4010000000000000000FFFFFF1F2C020000000000010020005B717279
      4461646F73436C69656E7465732E2265737461646F636976696C225D00000000
      FFFF0000000000020000000100000000090068656C7665746963610008000000
      000000000000080000000100020000000000FFFFFF0000000002000000000000
      0004002911000006004C696E653131000200F001000006000000000000002A00
      000001000400F4010000000000000000FFFFFF1F2C0200000000000000000000
      00FFFF00000000000200000001000000000000B011000006004D656D6F313800
      0200F301000013000000240000000C00000043000000F4010000000000000000
      FFFFFF1F2C020000000000010004004461746100000000FFFF00000000000200
      00000100000000090068656C7665746963610008000000000000000000090000
      000100020000000000FFFFFF0000000002000000000000000000381200000600
      4D656D6F3139000200F301000021000000240000000C00000043000000F40100
      00000000000000FFFFFF1F2C0200000000000100050056616C6F7200000000FF
      FF0000000000020000000100000000090068656C766574696361000800000000
      0000000000090000000100020000000000FFFFFF000000000200000000000000
      0000F012000006004D656D6F32300002001C020000130000003C0000000C0000
      0043000000F4010000000000000000FFFFFF1F2C020000000000010035005B71
      7279436F6E747261746F734669636861436F6272616E6361496D7072696D6972
      2E22646174612220234464642F6D6D2F79795D00000000FFFF00000000000200
      00000100000000090068656C76657469636100080000000000000000000A0000
      000100020000000000FFFFFF0000000002000000000000000000A81300000600
      4D656D6F32310002001C02000021000000520000000C00000043000000F40100
      00000000000000FFFFFF1F2C020000000000010035005B717279436F6E747261
      746F734669636861436F6272616E6361496D7072696D69722E2276616C6F7270
      72617A6F222023392E325D00000000FFFF000000000002000000010000000009
      0068656C76657469636100080000000000000000000900000001000200000000
      00FFFFFF00000000020000000000000000002E14000006004D656D6F32320002
      005A02000013000000160000000C00000043000000F4010000000000000000FF
      FFFF1F2C020000000000010003004E433A00000000FFFF000000000002000000
      0100000000090068656C76657469636100080000000000000000000800000001
      00020000000000FFFFFF0000000002000000000000000000DD14000006004D65
      6D6F323300020072020000130000004A0000000C00000043000000F401000000
      0000000000FFFFFF1F2C02000000000001002C005B717279436F6E747261746F
      734669636861436F6272616E6361496D7072696D69722E226E756D65726F225D
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      08000000000000000000090000000100020000000000FFFFFF00000000020000
      000000000004002D15000006004C696E653133000200F001000031000000D700
      00000000000001000800F4010000000000000000FFFFFF1F2C02000000000000
      0000000000FFFF000000000002000000010000000004007D15000006004C696E
      6531340002002A00000035000000A60100000000000001000800F40100000000
      00000000FFFFFF1F2C020000000000000000000000FFFF000000000002000000
      01000000000400CD15000006004C696E653136000200D0010000350000000000
      0000BE01000001000400F4010000000000000000FFFFFF1F2C02000000000000
      0000000000FFFF000000000002000000010000000000005316000006004D656D
      6F3235000200430000003F000000180000000C00000043000000F40100000000
      00000000FFFFFF1F2C0200000000000100030052756100000000FFFF00000000
      00020000000100000000090068656C7665746963610008000000000000000000
      090000000100020000000000FFFFFF0000000002000000000000000000DC1600
      0006004D656D6F32360002003700000056000000240000000C00000043000000
      F4010000000000000000FFFFFF1F2C0200000000000100060042616972726F00
      000000FFFF0000000000020000000100000000090068656C7665746963610008
      000000000000000000090000000100020000000000FFFFFF0000000002000000
      0000000000006517000006004D656D6F32370002003700000062000000240000
      000C00000042000000F4010000000000000000FFFFFF1F2C0200000000000100
      060043696461646500000000FFFF000000000002000000010000000009006865
      6C7665746963610008000000000000000000090000000100020000000000FFFF
      FF0000000002000000000000000000EA17000006004D656D6F32380002007101
      000060000000140000000C00000043000000F4010000000000000000FFFFFF1F
      2C02000000000001000200554600000000FFFF00000000000200000001000000
      00090068656C7665746963610008000000000000000000090000000100020000
      000000FFFFFF00000000020000000000000000007018000006004D656D6F3239
      00020069010000560000001C0000000C00000043000000F40100000000000000
      00FFFFFF1F2C0200000000000100030043455000000000FFFF00000000000200
      00000100000000090068656C7665746963610008000000000000000000090000
      000100020000000000FFFFFF0000000002000000000000000000F81800000600
      4D656D6F3330000200370000006E000000240000000C00000042000000F40100
      00000000000000FFFFFF1F2C02000000000001000500466F6E657300000000FF
      FF0000000000020000000100000000090068656C766574696361000800000000
      0000000000090000000100020000000000FFFFFF000000000200000000000000
      0000A019000006004D656D6F3332000200620000003F00000069010000180000
      0043000000F4010000000000000000FFFFFF1F2C020000000000010025005B71
      72794461646F73436C69656E7465732E227265736964656E6369615F7275615F
      31225D00000000FFFF0000000000020000000100000000090068656C76657469
      63610008000000000000000000000000000100020000000000FFFFFF00000000
      02000000000000000400F019000006004C696E6531370002005F000000060000
      00000000002A00000001000400F4010000000000000000FFFFFF1F2C02000000
      0000000000000000FFFF00000000000200000001000000000400401A00000600
      4C696E653230000200E800000006000000000000002A00000001000400F40100
      00000000000000FFFFFF1F2C020000000000000000000000FFFF000000000002
      00000001000000000400901A000006004C696E6532310002005F000000260000
      00000000002701000001000400F4010000000000000000FFFFFF1F2C02000000
      0000000000000000FFFF00000000000200000001000000000400E01A00000600
      4C696E653232000200A001000014000000000000001C00000001000400F40100
      00000000000000FFFFFF1F2C020000000000000000000000FFFF000000000002
      00000001000000000400301B000006004C696E65323300020019020000070000
      00000000002A00000001000400F4010000000000000000FFFFFF1F2C02000000
      0000000000000000FFFF00000000000200000001000000000400801B00000600
      4C696E653138000200D401000051000000F20000000000000001000800F40100
      00000000000000FFFFFF1F2C020000000000000000000000FFFF000000000002
      000000010000000000001E1C000006004D656D6F333400020087010000610000
      00190000000C00000043000000F4010000000000000000FFFFFF1F2C02000000
      000001001B005B7172794461646F73436C69656E7465732E2265737461646F22
      5D00000000FFFF0000000000020000000100000000090068656C766574696361
      0008000000000000000000080000000100020000000000FFFFFF000000000200
      00000000000004006E1C000006004C696E6532350002002A0000007F000000A6
      0100000000000001000800F4010000000000000000FFFFFF1F2C020000000000
      000000000000FFFF00000000000200000001000000000000F61C000006004D65
      6D6F343000020038000000A8000000230000000C00000043000000F401000000
      0000000000FFFFFF1F2C02000000000001000500436172676F00000000FFFF00
      00000000020000000100000000090068656C7665746963610008000000000000
      000000090000000100020000000000FFFFFF0000000002000000000000000000
      9A1D000006004D656D6F343100020062000000A8000000A80000000C00000044
      000000F4010000000000000000FFFFFF1F2C020000000000010021005B717279
      4461646F73436C69656E7465732E22636172676F636C69656E7465225D000000
      00FFFF0000000000020000000100000000090068656C76657469636100070000
      00000000000000080000000100020000000000FFFFFF00000000020000000000
      00000000211E000006004D656D6F34340002003C000000B40000001F0000000C
      00000043000000F4010000000000000000FFFFFF1F2C02000000000001000400
      466F6E6500000000FFFF0000000000020000000100000000090068656C766574
      6963610008000000000000000000090000000100020000000000FFFFFF000000
      0002000000000000000000A81E000006004D656D6F343500020007010000A800
      00001A0000000C00000043000000F4010000000000000000FFFFFF1F2C020000
      0000000100040053616C3A00000000FFFF000000000002000000010000000009
      0068656C76657469636100080000000000000000000900000001000200000000
      00FFFFFF0000000002000000000000000000521F000006004D656D6F34360002
      0022010000A8000000490000000C00000043000000F4010000000000000000FF
      FFFF1F2C020000000000010027005B7172794461646F73436C69656E7465732E
      22656D7072656E646176616C6F72222023372E325D00000000FFFF0000000000
      020000000100000000090068656C766574696361000800000000000000000009
      0000000100020000000000FFFFFF0000000002000000000000000000DB1F0000
      06004D656D6F34370002006F010000A8000000270000000C00000043000000F4
      010000000000000000FFFFFF1F2C0200000000000100060041646D69733A0000
      0000FFFF0000000000020000000100000000090068656C766574696361000800
      0000000000000000090000000100020000000000FFFFFF000000000200000000
      0000000000B520000006004D656D6F343800020093010000A80000003B000000
      0C00000043000000F4010000000000000000FFFFFF1F2C0004020A0064642F6D
      6D2F797979790001004D005B4946285B7172794461646F73436C69656E746573
      2E22656D7061646D697373616F225D3C3E302C5B7172794461646F73436C6965
      6E7465732E22656D7061646D697373616F225D2C2727295D00000000FFFF0000
      000000020000000100000000090068656C766574696361000800000000000000
      0000080000000100020000000000FFFFFF000000000200000000000000040005
      21000006004C696E6532360002002A000000C4000000A6010000000000000100
      0800F4010000000000000000FFFFFF1F2C020000000000000000000000FFFF00
      0000000002000000010000000000008B21000006004D656D6F35320002004300
      0000C5000000180000000C00000043000000F4010000000000000000FFFFFF1F
      2C0200000000000100030050616900000000FFFF000000000002000000010000
      0000090068656C76657469636100080000000000000000000900000001000200
      00000000FFFFFF00000000020000000000000000002622000006004D656D6F35
      3500020062000000D00000006B0100000C00000043000000F401000000000000
      0000FFFFFF1F2C020000000000010018005B7172794461646F73436C69656E74
      65732E226D6165225D00000000FFFF0000000000020000000100000000090068
      656C7665746963610008000000000000000000080000000100020000000000FF
      FFFF0000000002000000000000000000AC22000006004D656D6F353900020030
      010000E6000000160000000C00000043000000F4010000000000000000FFFFFF
      1F2C0200000000000100030055463A00000000FFFF0000000000020000000100
      000000090068656C766574696361000800000000000000000009000000010002
      0000000000FFFFFF00000000020000000000000000005123000006004D656D6F
      363200020042010000E6000000110000000C00000043000000F4010000000000
      000000FFFFFF1F2C020000000000010022005B7172794461646F73436C69656E
      7465732E226E61747572616C65737461646F225D00000000FFFF000000000002
      0000000100000000090068656C76657469636100080000000000000000000800
      00000100020000000000FFFFFF0000000002000000000000000400A123000006
      004C696E6532370002002A000000F4000000A60100000000000001000800F401
      0000000000000000FFFFFF1F2C020000000000000000000000FFFF0000000000
      02000000010000000000004A24000006004D656D6F353400020062000000E600
      0000C70000000C00000043000000F4010000000000000000FFFFFF1F2C020000
      000000010026005B7172794461646F73436C69656E7465732E226E6F6D656369
      646164656E61747572616C225D00000000FFFF00000000000200000001000000
      00090068656C7665746963610008000000000000000000080000000100020000
      000000FFFFFF0000000002000000000000000000EC24000006004D656D6F3537
      00020062000000F8000000090100000C00000043000000F40100000000000000
      00FFFFFF1F2C02000000000001001F005B7172794461646F73436C69656E7465
      732E22636F6E656D7072657361225D00000000FFFF0000000000020000000100
      000000090068656C766574696361000800000000000000000008000000010002
      0000000000FFFFFF00000000020000000000000004003C25000006004C696E65
      32380002002A00000035010000A60100000000000001000800F4010000000000
      000000FFFFFF1F2C020000000000000000000000FFFF00000000000200000001
      000000000000C525000006004D656D6F36350002003C0000003E0100001F0000
      000C00000043000000F4010000000000000000FFFFFF1F2C0200000000000100
      060052656665722E00000000FFFF000000000002000000010000000009006865
      6C7665746963610008000000000000000000090000000100020000000000FFFF
      FF00000000020000000000000000006726000006004D656D6F36360002006200
      000037010000920000001300000043000000F4010000000000000000FFFFFF1F
      2C02000000000001001F005B7172794461646F73436C69656E7465732E227265
      666572656E636961225D00000000FFFF00000000000200000001000000000900
      68656C7665746963610007000000000000000000100000000100020000000000
      FFFFFF0000000002000000000000000400B726000006004C696E653239000200
      2A0000004D010000A60100000000000001000800F4010000000000000000FFFF
      FF1F2C020000000000000000000000FFFF000000000002000000010000000000
      005C27000006004D656D6F333800020062000000920000006D01000018000000
      43000000F4010000000000000000FFFFFF1F2C020000000000010022005B7172
      794461646F73436C69656E7465732E22656D707265676F5F7275615F31225D00
      000000FFFF0000000000020000000100000000090068656C7665746963610008
      000000000000000000000000000100020000000000FFFFFF0000000002000000
      000000000000E627000006004D656D6F37340002002F000000870000002C0000
      000C00000043000000F4010000000000000000FFFFFF1F2C0200000000000100
      0700456D707265736100000000FFFF0000000000020000000100000000090068
      656C7665746963610008000000000000000000090000000100020000000000FF
      FFFF00000000020000000000000000008528000006004D656D6F373500020062
      000000870000001D0100000C00000043000000F4010000000000000000FFFFFF
      1F2C02000000000001001C005B7172794461646F73436C69656E7465732E2265
      6D7072657361225D00000000FFFF000000000002000000010000000009006865
      6C7665746963610008000000000000000000080000000100020000000000FFFF
      FF00000000020000000000000000002429000006004D656D6F36310002006200
      0000DB0000002B0100000C00000043000000F4010000000000000000FFFFFF1F
      2C02000000000001001C005B7172794461646F73436C69656E7465732E22636F
      6E6E6F6D65225D00000000FFFF0000000000020000000100000000090068656C
      7665746963610008000000000000000000080000000100020000000000FFFFFF
      0000000002000000000000000000AE29000006004D656D6F37360002005E0100
      00E6000000320000000C00000043000000F4010000000000000000FFFFFF1F2C
      020000000000010007004E617363746F3A00000000FFFF000000000002000000
      0100000000090068656C76657469636100080000000000000000000900000001
      00020000000000FFFFFF0000000002000000000000000000842A000006004D65
      6D6F373700020090010000E60000003E0000000C00000043000000F401000000
      0000000000FFFFFF1F2C0004020A0064642F6D6D2F7979797900010049005B49
      46285B7172794461646F73436C69656E7465732E22636F6E6E617363746F225D
      3C3E302C5B7172794461646F73436C69656E7465732E22636F6E6E617363746F
      225D2C2727295D00000000FFFF0000000000020000000100000000090068656C
      7665746963610008000000000000000000080000000100020000000000FFFFFF
      00000000020000000000000000000E2B000006004D656D6F37380002002F0000
      00F80000002C0000001000000042000000F4010000000000000000FFFFFF1F2C
      02000000000001000700456D707265736100000000FFFF000000000002000000
      0100000000090068656C76657469636100080000000000000000000900000001
      00020000000000FFFFFF0000000002000000000000000000942B000006004D65
      6D6F37390002004300000007010000180000000C00000043000000F401000000
      0000000000FFFFFF1F2C0200000000000100030052756100000000FFFF000000
      0000020000000100000000090068656C76657469636100080000000000000000
      00090000000100020000000000FFFFFF0000000002000000000000000000402C
      000006004D656D6F383000020062000000030100006901000018000000430000
      00F4010000000000000000FFFFFF1F2C020000000000010029005B7172794461
      646F73436C69656E7465732E22656D707265676F636F6E6A7567655F7275615F
      31225D00000000FFFF0000000000020000000100000000090068656C76657469
      63610008000000000000000000000000000100020000000000FFFFFF00000000
      02000000000000000000C82C000006004D656D6F353600020038000000190100
      00230000000C00000043000000F4010000000000000000FFFFFF1F2C02000000
      000001000500436172676F00000000FFFF000000000002000000010000000009
      0068656C76657469636100080000000000000000000900000001000200000000
      00FFFFFF00000000020000000000000000006C2D000006004D656D6F36330002
      0062000000190100009A0000000C00000040000000F4010000000000000000FF
      FFFF1F2C020000000000010021005B7172794461646F73436C69656E7465732E
      22636172676F636F6E6A756765225D00000000FFFF0000000000020000000100
      000000090068656C766574696361000700000000000000000008000000010002
      0000000000FFFFFF0000000002000000000000000000F32D000006004D656D6F
      3832000200FF000000190100001A0000000C00000043000000F4010000000000
      000000FFFFFF1F2C0200000000000100040053616C3A00000000FFFF00000000
      00020000000100000000090068656C7665746963610008000000000000000000
      090000000100020000000000FFFFFF00000000020000000000000000009D2E00
      0006004D656D6F38330002001601000019010000510000000C00000043000000
      F4010000000000000000FFFFFF1F2C020000000000010027005B717279446164
      6F73436C69656E7465732E22636F6E72656E646176616C6F72222023372E325D
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      08000000000000000000090000000100020000000000FFFFFF00000000020000
      00000000000000262F000006004D656D6F35380002006D010000190100002700
      00000C00000043000000F4010000000000000000FFFFFF1F2C02000000000001
      00060041646D69733A00000000FFFF0000000000020000000100000000090068
      656C7665746963610008000000000000000000090000000100020000000000FF
      FFFF00000000020000000000000000000130000006004D656D6F383400020092
      010000190100003B0000000C00000043000000F4010000000000000000FFFFFF
      1F2C0004020A0064642F6D6D2F797979790001004E005B4946285B7172794461
      646F73436C69656E7465732E22636F6E61646D697373616F225D3C3E302C5B71
      72794461646F73436C69656E7465732E22636F6E61646D697373616F22205D2C
      2727295D00000000FFFF0000000000020000000100000000090068656C766574
      6963610008000000000000000000080000000100020000000000FFFFFF000000
      00020000000000000000008830000006004D656D6F38350002003C0000002601
      00001F0000000C00000043000000F4010000000000000000FFFFFF1F2C020000
      00000001000400466F6E6500000000FFFF000000000002000000010000000009
      0068656C76657469636100080000000000000000000900000001000200000000
      00FFFFFF00000000020000000000000000002D31000006004D656D6F37300002
      0030000000550100009E0100000C00000040000000F4010000000000000000FF
      FFFF1F2C020000000000010022005B7172794461646F73436C69656E7465732E
      226F627365727661636F65735F31225D00000000FFFF00000000000200000001
      00000000090068656C7665746963610007000000000000000000080000000100
      020000000000FFFFFF0000000002000000000000000000D231000006004D656D
      6F3838000200300000005E0100009E0100000C00000040000000F40100000000
      00000000FFFFFF1F2C020000000000010022005B7172794461646F73436C6965
      6E7465732E226F627365727661636F65735F32225D00000000FFFF0000000000
      020000000100000000090068656C766574696361000700000000000000000008
      0000000100020000000000FFFFFF000000000200000000000000000077320000
      06004D656D6F383900020030000000670100009E0100000C00000040000000F4
      010000000000000000FFFFFF1F2C020000000000010022005B7172794461646F
      73436C69656E7465732E226F627365727661636F65735F33225D00000000FFFF
      0000000000020000000100000000090068656C76657469636100070000000000
      00000000080000000100020000000000FFFFFF00000000020000000000000000
      001C33000006004D656D6F393000020030000000700100009E0100000C000000
      40000000F4010000000000000000FFFFFF1F2C020000000000010022005B7172
      794461646F73436C69656E7465732E226F627365727661636F65735F34225D00
      000000FFFF0000000000020000000100000000090068656C7665746963610007
      000000000000000000080000000100020000000000FFFFFF0000000002000000
      000000000000C133000006004D656D6F3931000200300000007A0100009E0100
      000C00000040000000F4010000000000000000FFFFFF1F2C0200000000000100
      22005B7172794461646F73436C69656E7465732E226F627365727661636F6573
      5F35225D00000000FFFF0000000000020000000100000000090068656C766574
      6963610007000000000000000000080000000100020000000000FFFFFF000000
      00020000000000000004001134000006004C696E6531390002002A0000008601
      0000A60100000000000001000800F4010000000000000000FFFFFF1F2C020000
      000000000000000000FFFF000000000002000000010000000004006134000006
      004C696E653330000200D40100003600000000000000BE01000001000400F401
      0000000000000000FFFFFF1F2C020000000000000000000000FFFF0000000000
      02000000010000000000001835000006004D656D6F393300020061000000C101
      0000ED0000001800000041000000F4010000000000000000FFFFFF1F2C020000
      000000010034005B717279436F6E747261746F734669636861436F6272616E63
      61496D7072696D69722E226176616C697374615F7275615F31225D00000000FF
      FF0000000000020000000100000000090068656C766574696361000800000000
      0000000000000000000100020000000000FFFFFF000000000200000000000000
      0000CF35000006004D656D6F393500020061000000D9010000D00000000C0000
      0043000000F4010000000000000000FFFFFF1F2C020000000000010034005B71
      7279436F6E747261746F734669636861436F6272616E6361496D7072696D6972
      2E2262616972726F6176616C69737461225D00000000FFFF0000000000020000
      000100000000090068656C766574696361000800000000000000000010000000
      0100020000000000FFFFFF00000000020000000000000000008636000006004D
      656D6F393600020061000000E4010000C70000000C00000043000000F4010000
      000000000000FFFFFF1F2C020000000000010034005B717279436F6E74726174
      6F734669636861436F6272616E6361496D7072696D69722E2263696461646561
      76616C69737461225D00000000FFFF0000000000020000000100000000090068
      656C7665746963610008000000000000000000100000000100020000000000FF
      FFFF00000000020000000000000000000D37000006004D656D6F39380002002E
      010000D90100001C0000000C00000042000000F4010000000000000000FFFFFF
      1F2C020000000000010004004345503A00000000FFFF00000000000200000001
      00000000090068656C7665746963610007000000000000000000110000000100
      020000000000FFFFFF00000000020000000000000000009437000007004D656D
      6F3130300002009A010000D9010000140000000C00000042000000F401000000
      0000000000FFFFFF1F2C0200000000000100030055463A00000000FFFF000000
      0000020000000100000000090068656C76657469636100070000000000000000
      00110000000100020000000000FFFFFF00000000020000000000000000004C38
      000007004D656D6F313031000200B2010000D9010000190000000C0000004300
      0000F4010000000000000000FFFFFF1F2C020000000000010034005B71727943
      6F6E747261746F734669636861436F6272616E6361496D7072696D69722E2265
      737461646F6176616C69737461225D00000000FFFF0000000000020000000100
      000000090068656C766574696361000800000000000000000010000000010002
      0000000000FFFFFF0000000002000000000000000000D338000007004D656D6F
      31303200020043000000C3010000180000000C00000043000000F40100000000
      00000000FFFFFF1F2C0200000000000100030052756100000000FFFF00000000
      00020000000100000000090068656C7665746963610008000000000000000000
      090000000100020000000000FFFFFF00000000020000000000000000005D3900
      0007004D656D6F3130330002003B000000D9010000200000000C000000430000
      00F4010000000000000000FFFFFF1F2C0200000000000100060042616972726F
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      08000000000000000000090000000100020000000000FFFFFF00000000020000
      00000000000000E739000007004D656D6F31303400020037000000E401000024
      0000000C00000043000000F4010000000000000000FFFFFF1F2C020000000000
      0100060043696461646500000000FFFF00000000000200000001000000000900
      68656C7665746963610008000000000000000000090000000100020000000000
      FFFFFF0000000002000000000000000000703A000007004D656D6F3130350002
      0025010000E40100001C0000000C00000043000000F4010000000000000000FF
      FFFF1F2C02000000000001000500466F6E653A00000000FFFF00000000000200
      00000100000000090068656C7665746963610008000000000000000000110000
      000100020000000000FFFFFF0000000002000000000000000000273B00000700
      4D656D6F3130360002006200000087010000FC0000001800000043000000F401
      0000000000000000FFFFFF1F2C020000000000010033005B717279436F6E7472
      61746F734669636861436F6272616E6361496D7072696D69722E22656E747265
      67615F7275615F31225D00000000FFFF00000000000200000001000000000900
      68656C7665746963610008000000000000000000000000000100020000000000
      FFFFFF0000000002000000000000000000DE3B000007004D656D6F3130380002
      00620000009D010000DB0000000C00000041000000F4010000000000000000FF
      FFFF1F2C020000000000010033005B717279436F6E747261746F734669636861
      436F6272616E6361496D7072696D69722E2262616972726F656E747265676122
      5D00000000FFFF0000000000020000000100000000090068656C766574696361
      0008000000000000000000080000000100020000000000FFFFFF000000000200
      0000000000000000953C000007004D656D6F31303900020062000000A8010000
      E60000000C00000041000000F4010000000000000000FFFFFF1F2C0200000000
      00010033005B717279436F6E747261746F734669636861436F6272616E636149
      6D7072696D69722E22636964616465656E7472656761225D00000000FFFF0000
      000000020000000100000000090068656C766574696361000800000000000000
      0000080000000100020000000000FFFFFF00000000020000000000000000001C
      3D000007004D656D6F3131320002004300000087010000180000000C00000043
      000000F4010000000000000000FFFFFF1F2C0200000000000100030052756100
      000000FFFF0000000000020000000100000000090068656C7665746963610008
      000000000000000000090000000100020000000000FFFFFF0000000002000000
      000000000000A63D000007004D656D6F313133000200390000009D0100002200
      00000C00000043000000F4010000000000000000FFFFFF1F2C02000000000001
      00060042616972726F00000000FFFF0000000000020000000100000000090068
      656C7665746963610008000000000000000000090000000100020000000000FF
      FFFF0000000002000000000000000000303E000007004D656D6F313134000200
      39000000A8010000220000000C00000043000000F4010000000000000000FFFF
      FF1F2C0200000000000100060043696461646500000000FFFF00000000000200
      00000100000000090068656C7665746963610008000000000000000000090000
      000100020000000000FFFFFF0000000002000000000000000000B83E00000700
      4D656D6F31313500020042000000B2010000190000000C00000043000000F401
      0000000000000000FFFFFF1F2C02000000000001000400466F6E6500000000FF
      FF0000000000020000000100000000090068656C766574696361000800000000
      0000000000090000000100020000000000FFFFFF000000000200000000000000
      00003F3F000007004D656D6F313136000200460100009D010000180000000C00
      000043000000F4010000000000000000FFFFFF1F2C0200000000000100030043
      455000000000FFFF0000000000020000000100000000090068656C7665746963
      610007000000000000000000080000000100020000000000FFFFFF0000000002
      000000000000000000C53F000007004D656D6F313137000200A60100009D0100
      00120000000C00000043000000F4010000000000000000FFFFFF1F2C02000000
      000001000200554600000000FFFF000000000002000000010000000009006865
      6C7665746963610007000000000000000000080000000100020000000000FFFF
      FF00000000020000000000000000007840000007004D656D6F313139000200BB
      0100009D010000100000000C00000043000000F4010000000000000000FFFFFF
      1F2C02000000000001002F005B717279436F6E747261746F734669636861436F
      6272616E6361496D7072696D69722E22656E7465737461646F225D00000000FF
      FF0000000000020000000100000000090068656C766574696361000800000000
      0000000000080000000100020000000000FFFFFF000000000200000000000000
      0400C840000006004C696E65333400020051010000AB01000000000000140000
      0001000400F4010000000000000000FFFFFF1F2C020000000000000000000000
      FFFF000000000002000000010000000004001841000006004C696E6533350002
      0051010000AB0100007D0000000000000001000800F4010000000000000000FF
      FFFF1F2C020000000000000000000000FFFF0000000000020000000100000000
      0000A041000007004D656D6F31323000020062010000B20100001C0000000C00
      000043000000F4010000000000000000FFFFFF1F2C0200000000000100040053
      50433A00000000FFFF0000000000020000000100000000090068656C76657469
      63610008000000000000000000110000000100020000000000FFFFFF00000000
      020000000000000000003C42000007004D656D6F31323100020081010000B201
      00004A0000000C00000043000000F4010000000000000000FFFFFF1F2C020000
      000000010018005B7172794461646F73436C69656E7465732E22737063225D00
      000000FFFF0000000000020000000100000000090068656C7665746963610008
      000000000000000000100000000100020000000000FFFFFF0000000002000000
      000000000000C742000007004D656D6F3132320002007B0200001F0000001A00
      00000C00000043000000F4010000000000000000FFFFFF1F2C02000000000001
      00070046696C69616C3A00000000FFFF00000000000200000001000000000900
      68656C7665746963610008000000000000000000080000000100020000000000
      FFFFFF00000000020000000000000000007C43000007004D656D6F3132330002
      00980200001F000000140000000C00000043000000F4010000000000000000FF
      FFFF1F2C020000000000010031005B717279436F6E747261746F734669636861
      436F6272616E6361496D7072696D69722E2266696C69616C76656E6461225D00
      000000FFFF0000000000020000000100000000090068656C7665746963610008
      000000000000000000090000000100020000000000FFFFFF0000000002000000
      000000000300D44300000A005375625265706F727431000200D6010000780000
      0060000000120000000100000001000000000000000000FFFFFF1F2C02000000
      0000000000000000FFFF00000000000200000001000000000100000003002C44
      00000A005375625265706F727432000200D60100004501000060000000120000
      000100000001000000000000000000FFFFFF1F2C020000000000000000000000
      FFFF00000000000200000001000000000200000004007C44000006004C696E65
      3338000200D401000035000000F40000000000000001000800F4010000000000
      000000FFFFFF1F2C020000000000000000000000FFFF00000000000200000001
      0000000000000645000007004D656D6F313336000200680200002E0000003900
      00000A00000043000000F4010000000000000000FFFFFF002C02000000000001
      0006004355504F4E5300000000FFFF0000000000020000000100000000090068
      656C76657469636100070000000200000000000A0000000100020000000000FF
      FFFF00000000020000000000000000008C45000007004D656D6F313439000200
      D501000060000000120000000C00000043000000F4010000000000000000FFFF
      FF1F2C02000000000001000200505200000000FFFF0000000000020000000100
      000000090068656C766574696361000800000000000000000010000000010002
      0000000000FFFFFF00000000020000000000000000001646000007004D656D6F
      313530000200ED010000600000002E0000000C00000043000000F40100000000
      00000000FFFFFF1F2C0200000000000100060056656E63746F00000000FFFF00
      00000000020000000100000000090068656C7665746963610008000000000000
      000000100000000100020000000000FFFFFF0000000002000000000000000000
      9F46000007004D656D6F3135310002002802000060000000270000000C000000
      43000000F4010000000000000000FFFFFF1F2C0200000000000100050056616C
      6F7200000000FFFF0000000000020000000100000000090068656C7665746963
      610008000000000000000000100000000100020000000000FFFFFF0000000002
      0000000000000000002847000007004D656D6F31353200020069020000600000
      00280000000C00000043000000F4010000000000000000FFFFFF1F2C02000000
      000001000500506167746F00000000FFFF000000000002000000010000000009
      0068656C76657469636100080000000000000000001000000001000200000000
      00FFFFFF0000000002000000000000000000B147000007004D656D6F31353300
      0200A002000060000000260000000C00000043000000F4010000000000000000
      FFFFFF1F2C0200000000000100050056616C6F7200000000FFFF000000000002
      0000000100000000090068656C76657469636100080000000000000000001000
      00000100020000000000FFFFFF00000000020000000000000004000148000006
      004C696E653434000200D60100005F000000F20000000000000001000800F401
      0000000000000000FFFFFF1F2C020000000000000000000000FFFF0000000000
      02000000010000000004005148000006004C696E653435000200D60100006D00
      0000F10000000000000001000800F4010000000000000000FFFFFF1F2C020000
      000000000000000000FFFF00000000000200000001000000000400A148000006
      004C696E6534370002008802000066000000010000000000000001000800F401
      0000000000000000FFFFFF1F2C020000000000000000000000FFFF0000000000
      0200000001000000000400F148000006004C696E653336000200D50100004301
      0000F30000000000000001000800F4010000000000000000FFFFFF1F2C020000
      000000000000000000FFFF000000000002000000010000000004004149000006
      004C696E653337000200D501000035010000F10000000000000001000800F401
      0000000000000000FFFFFF1F2C020000000000000000000000FFFF0000000000
      0200000001000000000000CB49000007004D656D6F313234000200D601000036
      0100002E0000000C00000043000000F4010000000000000000FFFFFF1F2C0200
      0000000001000600436F6469676F00000000FFFF000000000002000000010000
      0000090068656C76657469636100080000000000000000001200000001000200
      00000000FFFFFF0000000002000000000000000000584A000007004D656D6F31
      32350002003B02000036010000410000000C00000043000000F4010000000000
      000000FFFFFF1F2C0200000000000100090044657363726963616F00000000FF
      FF0000000000020000000100000000090068656C766574696361000800000000
      0000000000120000000100020000000000FFFFFF000000000200000000000000
      0000E04A000007004D656D6F313236000200A502000036010000200000000C00
      000043000000F4010000000000000000FFFFFF1F2C0200000000000100040051
      74646500000000FFFF0000000000020000000100000000090068656C76657469
      63610008000000000000000000120000000100020000000000FFFFFF00000000
      020000000000000000006A4B000006004D656D6F343300020035000000E60000
      00260000000C00000043000000F4010000000000000000FFFFFF1F2C02000000
      0000010007004E61747572616C00000000FFFF00000000000200000001000000
      00090068656C7665746963610008000000000000000000090000000100020000
      000000FFFFFF0000000002000000000000000000F04B000006004D656D6F3533
      00020043000000D0000000180000000C00000043000000F40100000000000000
      00FFFFFF1F2C020000000000010003004D616500000000FFFF00000000000200
      00000100000000090068656C7665746963610008000000000000000000090000
      000100020000000000FFFFFF00000000020000000000000000007A4C00000600
      4D656D6F363000020033000000DB000000280000000C00000043000000F40100
      00000000000000FFFFFF1F2C02000000000001000700436F6E6A756765000000
      00FFFF0000000000020000000100000000090068656C76657469636100080000
      00000000000000090000000100020000000000FFFFFF00000000020000000000
      00000000174D000007004D656D6F313534000200620000006E000000B4000000
      0C00000043000000F4010000000000000000FFFFFF1F2C020000000000010019
      005B7172794461646F73436C69656E7465732E22666F6E65225D00000000FFFF
      0000000000020000000100000000090068656C76657469636100080000000000
      00000000080000000100020000000000FFFFFF00000000020000000000000000
      00B44D000006004D656D6F3336000200240100006E000000A80000000C000000
      43000000F4010000000000000000FFFFFF1F2C02000000000001001A005B7172
      794461646F73436C69656E7465732E22666F6E6532225D00000000FFFF000000
      0000020000000100000000090068656C76657469636100080000000000000000
      00080000000100020000000000FFFFFF0000000002000000000000000000574E
      000006004D656D6F343900020062000000B4000000C00000000C000000430000
      00F4010000000000000000FFFFFF1F2C020000000000010020005B7172794461
      646F73436C69656E7465732E22666F6E65656D7072657361225D00000000FFFF
      0000000000020000000100000000090068656C76657469636100080000000000
      00000000080000000100020000000000FFFFFF00000000020000000000000000
      00FA4E000006004D656D6F38360002006200000026010000B80000000C000000
      43000000F4010000000000000000FFFFFF1F2C020000000000010020005B7172
      794461646F73436C69656E7465732E22666F6E65636F6E6A756765225D000000
      00FFFF0000000000020000000100000000090068656C76657469636100080000
      00000000000000080000000100020000000000FFFFFF00000000020000000000
      00000000AF4F000007004D656D6F31353700020062000000B2010000E4000000
      0C00000043000000F4010000000000000000FFFFFF1F2C020000000000010031
      005B717279436F6E747261746F734669636861436F6272616E6361496D707269
      6D69722E22666F6E65656E7472656761225D00000000FFFF0000000000020000
      000100000000090068656C766574696361000800000000000000000008000000
      0100020000000000FFFFFF00000000020000000000000000006450000006004D
      656D6F363700020041010000E40100008C0000000C00000041000000F4010000
      000000000000FFFFFF1F2C020000000000010032005B717279436F6E74726174
      6F734669636861436F6272616E6361496D7072696D69722E22666F6E65617661
      6C69737461225D00000000FFFF0000000000020000000100000000090068656C
      7665746963610008000000000000000000100000000100020000000000FFFFFF
      00000000020000000000000000007051000006004D656D6F39370002004C0100
      00D90100004B0000000C00000042000000F4010000000000000000FFFFFF1F2C
      020000000000010089005B4946285B717279436F6E747261746F734669636861
      436F6272616E6361496D7072696D69722E226365706176616C69737461225D3C
      3E302C20464F524D415454455854282723232E2323232D232323272C5B717279
      436F6E747261746F734669636861436F6272616E6361496D7072696D69722E22
      6365706176616C69737461225D292C2727295D00000000FFFF00000000000200
      00000100000000090068656C7665746963610008000000000000000000110000
      000100020000000000FFFFFF00000000020000000000000000007D5200000700
      4D656D6F313138000200600100009C010000430000000E00000043000000F401
      0000000000000000FFFFFF1F2C020000000000010089005B4946285B71727943
      6F6E747261746F734669636861436F6272616E6361496D7072696D69722E2263
      65706176616C69737461225D3C3E302C20464F524D415454455854282723232E
      2323232D232323272C5B717279436F6E747261746F734669636861436F627261
      6E6361496D7072696D69722E226365706176616C69737461225D292C2727295D
      00000000FFFF0000000000020000000100000000090068656C76657469636100
      08000000000000000000090000000100020000000000FFFFFF00000000020000
      000000000000005753000006004D656D6F393900020087010000560000004300
      00000C00000043000000F4010000000000000000FFFFFF1F2C02000000000001
      0057005B4946285B7172794461646F73436C69656E7465732E22636570225D3C
      3E302C20464F524D415454455854282723232E2323232D232323272C5B717279
      4461646F73436C69656E7465732E22636570225D292C2727295D00000000FFFF
      0000000000020000000100000000090068656C76657469636100080000000000
      00000000080000000100020000000000FFFFFF00000000020000000000000000
      00DE53000006004D656D6F3331000200040100003E010000200000000C000000
      43000000F4010000000000000000FFFFFF1F2C02000000000001000400466F6E
      6500000000FFFF0000000000020000000100000000090068656C766574696361
      0008000000000000000000090000000100020000000000FFFFFF000000000200
      00000000000000008454000006004D656D6F3638000200270100003E010000A4
      0000000C00000043000000F4010000000000000000FFFFFF1F2C020000000000
      010023005B7172794461646F73436C69656E7465732E22666F6E657265666572
      656E636961225D00000000FFFF0000000000020000000100000000090068656C
      7665746963610008000000000000000000080000000100020000000000FFFFFF
      0000000002000000000000000300DC5400000A005375625265706F7274350002
      00680200003A00000060000000120000000100000001000000000000000000FF
      FFFF1F2C020000000000000000000000FFFF0000000000020000000100000000
      0400000004002C55000006004C696E6534310002006402000036000000000000
      001A00000001000400F4010000000000000000FFFFFF1F2C0200000000000000
      00000000FFFF00000000000200000001000000000000B555000006004D656D6F
      31370002005202000006000000440000000C00000043000000F4010000000000
      000000FFFFFF1F2C02000000000001000600434F4D50524100000000FFFF0000
      000000020000000100000000090068656C766574696361000800000002000000
      00000A0000000100020000000000FFFFFF00000000020000000000000000003E
      56000007004D656D6F313437000200D80100002E0000002D0000000A00000043
      000000F4010000000000000000FFFFFF002C020000000000010005004E4F5441
      5300000000FFFF0000000000020000000100000000090068656C766574696361
      00070000000200000000000A0000000100020000000000FFFFFF000000000200
      0000000000000300965600000A005375625265706F727434000200D60100003A
      00000060000000120000000100000001000000000000000000FFFFFF1F2C0200
      00000000000000000000FFFF0000000000020000000100000000030000000000
      1C57000006004D656D6F33390002004300000092000000180000000C00000043
      000000F4010000000000000000FFFFFF1F2C0200000000000100030052756100
      000000FFFF0000000000020000000100000000090068656C7665746963610008
      000000000000000000090000000100020000000000FFFFFF0000000002000000
      000000000000A857000006004D656D6F393200020056010000C3010000310000
      000B00000041000000F4010000000000000000FFFFFF1F2C0200000000000100
      09004176616C697374613A00000000FFFF000000000002000000010000000009
      0068656C76657469636100080000000200000000001000000017000200000000
      00FFFFFF00000000020000000000000000003C58000007004D656D6F31313100
      02006301000087010000690000000900000041000000F4010000000000000000
      FFFFFF1F2C02000000000001001000454E44455245434F20454E545245474100
      000000FFFF0000000000020000000100000000090068656C7665746963610007
      000000020000000000090000000100020000000000FFFFFF0000000002000000
      000000000000C958000006004D656D6F3634000200F500000035010000560000
      000900000043000000F4010000000000000000FFFFFF1F2C0200000000000100
      0A005245464552454E43494100000000FFFF0000000000020000000100000000
      090068656C76657469636100070000000000000000000A000000010002000000
      0000FFFFFF0000000002000000000000000300215900000A005375625265706F
      7274330002005A020000F4010000600000000000000001000000010000000000
      00000000FFFFFF1F2C020000000000000000000000FFFF000000000002000000
      0100000000050000000000C959000006004D656D6F3335000200620000006200
      0000FF0000000C00000043000000F4010000000000000000FFFFFF1F2C020000
      000000010025005B7172794461646F73436C69656E7465732E22636964616465
      7265736964656E636961225D00000000FFFF0000000000020000000100000000
      090068656C766574696361000800000000000000000008000000010002000000
      0000FFFFFF0000000002000000000000000000715A000006004D656D6F333300
      02006200000056000000000100000C00000043000000F4010000000000000000
      FFFFFF1F2C020000000000010025005B7172794461646F73436C69656E746573
      2E2262616972726F7265736964656E636961225D00000000FFFF000000000002
      0000000100000000090068656C76657469636100080000000000000000000800
      00000100020000000000FFFFFF0000000002000000000000000400C05A000005
      004C696E65310002002A000000C0010000A60100000000000001000800F40100
      00000000000000FFFFFF1F2C020000000000000000000000FFFF000000000002
      000000010000000000004C5B000007004D656D6F313130000200D40100006E00
      0000F00000000800000043000000F4010000000000000000FFFFFF1F2C020000
      00000001000800515549544144415300000000FFFF0000000000020000000100
      000000090068656C76657469636100070000000200000000000A000000010002
      0000000000FFFFFF0000000002000000000000000000D85B000007004D656D6F
      313331000200D4010000AA000000F30000000800000043000000F40100000000
      00000000FFFFFF1F2C0200000000000100080056454E434944415300000000FF
      FF0000000000020000000100000000090068656C766574696361000700000002
      00000000000A0000000100020000000000FFFFFF000000000200000000000000
      0000645C000007004D656D6F313332000200D4010000EE000000F30000000800
      000043000000F4010000000000000000FFFFFF1F2C0200000000000100080041
      2056454E43455200000000FFFF0000000000020000000100000000090068656C
      76657469636100070000000200000000000A0000000100020000000000FFFFFF
      0000000002000000000000000400B35C000005004C696E653200020060000000
      86010000000000006D00000001000400F4010000000000000000FFFFFF1F2C02
      0000000000000000000000FFFF000000000002000000010000000003000B5D00
      000A005375625265706F727436000200D6010000B40000006000000012000000
      0100000001000000000000000000FFFFFF1F2C020000000000000000000000FF
      FF0000000000020000000100000000060000000300635D00000A005375625265
      706F727437000200D6010000F800000060000000120000000100000001000000
      000000000000FFFFFF1F2C020000000000000000000000FFFF00000000000200
      00000100000000070000000400B25D000005004C696E6533000200C501000086
      010000090000000000000001000800F4010000000000000000FFFFFF1F2C0200
      00000000000000000000FFFF00000000000200000001000000000000685E0000
      07004D656D6F31363100020055010000CB010000790000000C00000041000000
      F4010000000000000000FFFFFF1F2C020000000000010032005B717279436F6E
      747261746F734669636861436F6272616E6361496D7072696D69722E226E6F6D
      656176616C69737461225D00000000FFFF000000000002000000010000000009
      0068656C76657469636100080000000000000000001000000017000200000000
      00FFFFFF0000000002000000000000000000F65E000006004D656D6F36390002
      00810100004E0100004D0000000900000043000000F4010000000000000000FF
      FFFF1F2C02000000000001000B004F425345525641434F455300000000FFFF00
      00000000020000000100000000090068656C7665746963610007000000020000
      000000090000000100020000000000FFFFFF0000000002000000000000000000
      805F000007004D656D6F313630000200400000004C000000180000000C000000
      43000000F4010000000000000000FFFFFF1F2C020000000000010006004E756D
      65726F00000000FFFF0000000000020000000100000000090068656C76657469
      63610008000000000000000000090000000100020000000000FFFFFF00000000
      020000000000000000000D60000006004D656D6F32340002007B010000370000
      004F0000000900000043000000F4010000000000000000FFFFFF1F2C02000000
      000001000A005245534944454E43494100000000FFFF00000000000200000001
      00000000090068656C7665746963610007000000020000000000090000000100
      020000000000FFFFFF0000000002000000000000000000A860000005004D656D
      6F34000200E900000004000000020100000C00000041000000F4010000000000
      000000FFFFFF1F2C020000000000010019005B7172794461646F73436C69656E
      7465732E226E6F6D65225D00000000FFFF000000000002000000010000000009
      0068656C76657469636100080000000000000000000000000001000200000000
      00FFFFFF00000000020000000000000000004B61000005004D656D6F38000200
      E900000014000000780000000C00000041000000F4010000000000000000FFFF
      FF1F2C020000000000010021005B7172794461646F73436C69656E7465732E22
      706573736F616E756D65726F225D00000000FFFF000000000002000000010000
      0000090068656C76657469636100080000000000000000000800000001000200
      00000000FFFFFF0000000002000000000000000000EE61000006004D656D6F31
      30000200E9000000230000007C0000000C00000041000000F401000000000000
      0000FFFFFF1F2C020000000000010020005B7172794461646F73436C69656E74
      65732E226964646F63756D656E746F225D00000000FFFF000000000002000000
      0100000000090068656C76657469636100080000000000000000000800000001
      00020000000000FFFFFF00000000020000000000000002017A6200000C004461
      646F734D657374726532000201000000002D0000000B0300000C000000300005
      0001000000000000000000FFFFFF1F00000000200066647350617263656C6173
      4669636861436F6272616E6361517569746164617300000000000000FFFF0000
      00000002000000010000000000000001000000C8000000140000000100000000
      000000012963000007004D656D6F313237000200000000002D00000011000000
      0B00000043000000F4010000000000000000FFFFFF1F2C02000000000001002B
      005B71727950617263656C61734669636861436F6272616E6361517569746164
      61732E226E756D65726F225D00000000FFFF0000000000020000000100000000
      090068656C766574696361000700000000000000000011000000010002000000
      0000FFFFFF0000000002000000000000000001E763000007004D656D6F313238
      000200140000002D000000360000000B00000043000000F40100000000000000
      00FFFFFF1F2C02000000000001003A005B71727950617263656C617346696368
      61436F6272616E636151756974616461732E226461746176656E63746F222023
      4464642F6D6D2F79795D00000000FFFF00000000000200000001000000000900
      68656C7665746963610007000000000000000000120000000100020000000000
      FFFFFF0000000002000000000000000001A964000007004D656D6F3132390002
      004D0000002D000000360000000B00000043000000F4010000000000000000FF
      FFFF1F2C0204010E002323232C2323232C2323302E303000010030005B717279
      50617263656C61734669636861436F6272616E636151756974616461732E2276
      616C6F7276656E63746F225D00000000FFFF0000000000020000000100000000
      090068656C766574696361000700000000000000000011000000010002000000
      0000FFFFFF0000000002000000000000000001E265000007004D656D6F313333
      000200830000002D000000320000000B00000043000000F40100000000000000
      00FFFFFF1F2C02000000000000000006000500626567696E0D3B002020696620
      5B71727950617263656C61734669636861436F6272616E636151756974616461
      732E2264617461706167746F225D3C3E30207468656E0D54002020206D656D6F
      3A3D5B464F524D41544441544554494D45282764642F6D6D2F7979272C5B7172
      7950617263656C61734669636861436F6272616E636151756974616461732E22
      64617461706167746F225D295D0D0400656C73650D0B0020206D656D6F3A3D27
      273B0D0300656E6400FFFF0000000000020000000100000000090068656C7665
      746963610007000000000000000000120000000100020000000000FFFFFF0000
      000002000000000000000001E166000007004D656D6F313334000200B8000000
      2D0000003A0000000B00000043000000F4010000000000000000FFFFFF1F2C02
      04010E002323232C2323232C2323302E30300001006D005B6966285B71727950
      617263656C61734669636861436F6272616E636151756974616461732E227661
      6C6F72706167746F225D3C3E302C205B71727950617263656C61734669636861
      436F6272616E636151756974616461732E2276616C6F72706167746F225D2C20
      2727295D00000000FFFF0000000000020000000100000000090068656C766574
      6963610007000000000000000000110000000100020000000000FFFFFF000000
      0002000000000000000202656700000C004461646F734D657374726534000201
      000000001D0000000B0300000C0000003000050001000000000000000000FFFF
      FF1F00000000180066647350726F6475746F734669636861436F6272616E6361
      00000000000000FFFF000000000002000000010000000000000001000000C800
      0000140000000100000000000000020D68000007004D656D6F31343100020001
      0000001D0000003D0000000B00000043000000F4010000000000000000FFFFFF
      1F2C020000000000010024005B71727950726F6475746F734669636861436F62
      72616E63612E2270726F6475746F225D00000000FFFF00000000000200000001
      00000000090068656C7665746963610007000000000000000000110000000100
      020000000000FFFFFF0000000002000000000000000002B768000007004D656D
      6F313432000200410000001D0000007F0000000B00000041000000F401000000
      0000000000FFFFFF1F2C020000000000010026005B71727950726F6475746F73
      4669636861436F6272616E63612E2264657363726963616F225D00000000FFFF
      0000000000020000000100000000090068656C76657469636100070000000000
      00000000100000000100020000000000FFFFFF00000000020000000000000000
      028569000007004D656D6F313433000200C20000001D000000300000000B0000
      0043000000F4010000000000000000FFFFFF1F2C02000000000001004A005B46
      6F726D6174466C6F6174285B4D6173636172615175616E7469646164655D2C5B
      71727950726F6475746F734669636861436F6272616E63612E227175616E7469
      64616465225D295D00000000FFFF000000000002000000010000000009006865
      6C7665746963610007000000000000000000110000000100020000000000FFFF
      FF0000000002000000000000000203066A00000C004461646F734D6573747265
      35000201000000001C0000000B0300000C000000300005000100000000000000
      0000FFFFFF1F0000000015006664734E6F7461734669636861436F6272616E63
      6100000000000000FFFF0000000000020000000100000000000000030000002D
      00000002000000010000000000000003AE6A000007004D656D6F313438000200
      000000001D000000300000000A00000043000000F4010000000000000000FFFF
      FF1F2C020000000000010024005B7172794E6F7461734669636861436F627261
      6E63612E226E6F746166697363616C225D00000000FFFF000000000002000000
      0100000000090068656C76657469636100080000000000000000001000000001
      00020000000000FFFFFF0000000002000000000000000204306B00000C004461
      646F734D657374726536000201000000001C0000000B0300000C000000300005
      0001000000000000000000FFFFFF1F0000000016006664734375706F6E734669
      636861436F6272616E636100000000000000FFFF000000000002000000010000
      0000000000030000003200000002000000010000000000000004DA6B00000700
      4D656D6F313436000200000000001D000000300000000A00000043000000F401
      0000000000000000FFFFFF1F2C020000000000010026005B7172794375706F6E
      734669636861436F6272616E63612E226375706F6D66697363616C225D000000
      00FFFF0000000000020000000100000000090068656C76657469636100080000
      00000000000000100000000100020000000000FFFFFF00000000020000000000
      000002054A6C0000100043616265E7616C686F4D657374726531000201000000
      001C000000F5020000060000003000040001000000000000000000FFFFFF1F00
      000000000000000000000000FFFF000000000002000000010000000000000001
      000000C800000014000000010000000000000206CF6C0000050042616E643100
      02010000000038000000F50200000C0000003000050001000000000000000000
      FFFFFF1F00000000200066647350617263656C61734669636861436F6272616E
      636156656E636964617300000000000000FFFF00000000000200000001000000
      0000000001000000C8000000140000000100000000000000067E6D000007004D
      656D6F3133370002000000000038000000110000000B00000043000000F40100
      00000000000000FFFFFF1F2C02000000000001002B005B71727950617263656C
      61734669636861436F6272616E636156656E63696461732E226E756D65726F22
      5D00000000FFFF0000000000020000000100000000090068656C766574696361
      0007000000000000000000110000000100020000000000FFFFFF000000000200
      00000000000000063C6E000007004D656D6F3133380002001400000038000000
      360000000B00000043000000F4010000000000000000FFFFFF1F2C0200000000
      0001003A005B71727950617263656C61734669636861436F6272616E63615665
      6E63696461732E226461746176656E63746F2220234464642F6D6D2F79795D00
      000000FFFF0000000000020000000100000000090068656C7665746963610007
      000000000000000000120000000100020000000000FFFFFF0000000002000000
      000000000006FE6E000007004D656D6F3133390002004D000000380000003600
      00000B00000043000000F4010000000000000000FFFFFF1F2C0204010E002323
      232C2323232C2323302E303000010030005B71727950617263656C6173466963
      6861436F6272616E636156656E63696461732E2276616C6F7276656E63746F22
      5D00000000FFFF0000000000020000000100000000090068656C766574696361
      0007000000000000000000110000000100020000000000FFFFFF000000000200
      00000000000000063770000007004D656D6F3134300002008300000038000000
      320000000B00000043000000F4010000000000000000FFFFFF1F2C0200000000
      0000000006000500626567696E0D3B0020206966205B71727950617263656C61
      734669636861436F6272616E636156656E63696461732E226461746170616774
      6F225D3C3E30207468656E0D54002020206D656D6F3A3D5B464F524D41544441
      544554494D45282764642F6D6D2F7979272C5B71727950617263656C61734669
      636861436F6272616E636156656E63696461732E2264617461706167746F225D
      295D0D0400656C73650D0B0020206D656D6F3A3D27273B0D0300656E6400FFFF
      0000000000020000000100000000090068656C76657469636100070000000000
      00000000120000000100020000000000FFFFFF00000000020000000000000000
      063671000007004D656D6F313434000200B8000000380000003A0000000B0000
      0043000000F4010000000000000000FFFFFF1F2C0204010E002323232C232323
      2C2323302E30300001006D005B6966285B71727950617263656C617346696368
      61436F6272616E636156656E63696461732E2276616C6F72706167746F225D3C
      3E302C205B71727950617263656C61734669636861436F6272616E636156656E
      63696461732E2276616C6F72706167746F225D2C202727295D00000000FFFF00
      00000000020000000100000000090068656C7665746963610007000000000000
      000000110000000100020000000000FFFFFF0000000002000000000000000207
      BA710000050042616E64320002010000000028000000F50200000C0000003000
      050001000000000000000000FFFFFF1F000000001F0066647350617263656C61
      734669636861436F6272616E63616156656E63657200000000000000FFFF0000
      00000002000000010000000000000001000000C8000000140000000100000000
      000000076872000007004D656D6F313435000200000000002800000011000000
      0B00000043000000F4010000000000000000FFFFFF1F2C02000000000001002A
      005B71727950617263656C61734669636861436F6272616E63616156656E6365
      722E226E756D65726F225D00000000FFFF000000000002000000010000000009
      0068656C76657469636100070000000000000000001100000001000200000000
      00FFFFFF00000000020000000000000000072573000007004D656D6F31353500
      02001400000028000000360000000B00000043000000F4010000000000000000
      FFFFFF1F2C020000000000010039005B71727950617263656C61734669636861
      436F6272616E63616156656E6365722E226461746176656E63746F2220234464
      642F6D6D2F79795D00000000FFFF000000000002000000010000000009006865
      6C7665746963610007000000000000000000120000000100020000000000FFFF
      FF0000000002000000000000000007E673000007004D656D6F3135360002004D
      00000028000000360000000B00000043000000F4010000000000000000FFFFFF
      1F2C0204010E002323232C2323232C2323302E30300001002F005B7172795061
      7263656C61734669636861436F6272616E63616156656E6365722E2276616C6F
      7276656E63746F225D00000000FFFF0000000000020000000100000000090068
      656C7665746963610007000000000000000000110000000100020000000000FF
      FFFF00000000020000000000000000071D75000007004D656D6F313538000200
      8300000028000000320000000B00000043000000F4010000000000000000FFFF
      FF1F2C02000000000000000006000500626567696E0D3A0020206966205B7172
      7950617263656C61734669636861436F6272616E63616156656E6365722E2264
      617461706167746F225D3C3E30207468656E0D53002020206D656D6F3A3D5B46
      4F524D41544441544554494D45282764642F6D6D2F7979272C5B717279506172
      63656C61734669636861436F6272616E63616156656E6365722E226461746170
      6167746F225D295D0D0400656C73650D0B0020206D656D6F3A3D27273B0D0300
      656E6400FFFF0000000000020000000100000000090068656C76657469636100
      07000000000000000000120000000100020000000000FFFFFF00000000020000
      000000000000071A76000007004D656D6F313539000200B8000000280000003A
      0000000B00000043000000F4010000000000000000FFFFFF1F2C0204010E0023
      23232C2323232C2323302E30300001006B005B6966285B71727950617263656C
      61734669636861436F6272616E63616156656E6365722E2276616C6F72506167
      746F225D3C3E302C205B71727950617263656C61734669636861436F6272616E
      63616156656E6365722E2276616C6F72706167746F225D2C202727295D000000
      00FFFF0000000000020000000100000000090068656C76657469636100070000
      00000000000000110000000100020000000000FFFFFF00000000020000000000
      0000FEFEFF020000000A002043617465676F7279310000000011004D61736361
      72615175616E74696461646500070027232323232327000000000000000000FC
      0000000000000000000000000000000058003DBC4AA08E84E3400204C1D8CE2E
      E540}
  end
  object fdsContratosFichaCobranca: TfrDBDataSet
    DataSet = qryContratosFichaCobrancaImprimir
    Left = 384
    Top = 72
  end
  object fdsParcelasFichaCobrancaQuitadas: TfrDBDataSet
    DataSet = qryParcelasFichaCobrancaQuitadas
    Left = 384
    Top = 129
  end
  object fdsProdutosFichaCobranca: TfrDBDataSet
    DataSet = qryProdutosFichaCobranca
    Left = 384
    Top = 297
  end
  object qryCuponsFichaCobranca: TtecQuery
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
      'select  c.numero as cupomfiscal'
      
        'from dadosfiscais df left join cupons c on df.numero=c.dadofisca' +
        'l'
      'Where df.contrato=:contrato and c.numero is not null')
    RequestLive = False
    Left = 134
    Top = 409
    ParamData = <
      item
        DataType = ftInteger
        Name = 'contrato'
        ParamType = ptUnknown
        Value = '161079'
      end>
    object qryCuponsFichaCobrancacupomfiscal: TIntegerField
      FieldName = 'cupomfiscal'
      DisplayFormat = '0'
    end
  end
  object fdsNotasFichaCobranca: TfrDBDataSet
    DataSet = qryNotasFichaCobranca
    Left = 384
    Top = 353
  end
  object fdsCuponsFichaCobranca: TfrDBDataSet
    DataSet = qryCuponsFichaCobranca
    Left = 384
    Top = 409
  end
  object qryParcelasFichaCobrancaVencidas: TtecQuery
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
      ';select * from'
      '('
      'Select count(*) as Numero, '
      '           min(p.datavencto) as DataVencto, '
      '           p.valorvencto,  '
      '           min(p.datapagto) as DataPagto,'
      '           sum(p.valorpagto) as ValorPagto'
      'From   parcelas p'
      
        'Where (p.contrato =:contrato)  and p.datapagto is Null and p.tip' +
        'opagto is null and p.datavencto <= current_date'
      'Group By p.valorvencto'
      ') as temp'
      'order by datavencto')
    RequestLive = False
    Left = 134
    Top = 185
    ParamData = <
      item
        DataType = ftString
        Name = 'Contrato'
        ParamType = ptUnknown
        Value = '161079'
      end>
    object qryParcelasFichaCobrancaVencidasnumero: TLargeintField
      FieldName = 'numero'
    end
    object qryParcelasFichaCobrancaVencidasdatavencto: TDateField
      Alignment = taCenter
      FieldName = 'datavencto'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasFichaCobrancaVencidasvalorvencto: TFloatField
      FieldName = 'valorvencto'
      DisplayFormat = '0.00'
    end
    object qryParcelasFichaCobrancaVencidasdatapagto: TDateField
      Alignment = taCenter
      FieldName = 'datapagto'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasFichaCobrancaVencidasvalorpagto: TFloatField
      FieldName = 'valorpagto'
      DisplayFormat = '0.00'
    end
  end
  object qryParcelasFichaCobrancaaVencer: TtecQuery
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
      ';select * from'
      '('
      'Select count(*) as Numero, '
      '           min(p.datavencto) as DataVencto, '
      '           p.valorvencto,  '
      '           min(p.datapagto) as DataPagto,'
      '           sum(p.valorpagto) as ValorPagto'
      'From   parcelas p'
      
        'Where (p.contrato =:contrato)  and p.datapagto is Null and p.tip' +
        'opagto is null and p.datavencto > current_date'
      'Group By p.valorvencto'
      ') as temp'
      'order by datavencto')
    RequestLive = False
    Left = 134
    Top = 241
    ParamData = <
      item
        DataType = ftString
        Name = 'Contrato'
        ParamType = ptUnknown
        Value = '161079'
      end>
    object qryParcelasFichaCobrancaaVencernumero: TLargeintField
      FieldName = 'numero'
    end
    object qryParcelasFichaCobrancaaVencerdatavencto: TDateField
      Alignment = taCenter
      FieldName = 'datavencto'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasFichaCobrancaaVencervalorvencto: TFloatField
      FieldName = 'valorvencto'
      DisplayFormat = '0.00'
    end
    object qryParcelasFichaCobrancaaVencerdatapagto: TDateField
      Alignment = taCenter
      FieldName = 'datapagto'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasFichaCobrancaaVencervalorpagto: TFloatField
      FieldName = 'valorpagto'
      DisplayFormat = '0.00'
    end
  end
  object fdsParcelasFichaCobrancaVencidas: TfrDBDataSet
    DataSet = qryParcelasFichaCobrancaVencidas
    Left = 384
    Top = 185
  end
  object fdsParcelasFichaCobrancaaVencer: TfrDBDataSet
    DataSet = qryParcelasFichaCobrancaaVencer
    Left = 384
    Top = 241
  end
end
