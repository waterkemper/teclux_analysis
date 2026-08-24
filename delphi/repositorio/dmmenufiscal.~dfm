inherited dtmMenuFiscal: TdtmMenuFiscal
  OldCreateOrder = False
  Left = 643
  Top = 192
  Height = 532
  Width = 727
  object qryProdutos: TtecQuery
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
      ';'
      'select sel.*,'
      '       CASE WHEN upper(hash_paf_registro_p2) ='
      
        '                 upper(hash_paf_registro_p2_calculado) THEN true' +
        ' ELSE false END as registrovalido'
      'from'
      ' ('
      '  select *,'
      
        '          md5(cnpj||cast(produto as varchar)||coalesce(cest,'#39#39')|' +
        '|coalesce(ncm,'#39#39')||descricao||unidade||ippt||situacaotributaria|' +
        '|cast(aliquota as varchar)||cast(valorunitario as varchar)) as  ' +
        'hash_paf_registro_p2_calculado'
      '  from registro_p2'
      '  where cnpj = :cnpj'
      ''
      '  ) as sel'
      'order by produto'
      '')
    RequestLive = False
    Left = 48
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cnpj'
        ParamType = ptUnknown
      end>
    object qryProdutoscnpj: TStringField
      FieldName = 'cnpj'
      Size = 14
    end
    object qryProdutosproduto: TStringField
      FieldName = 'produto'
      Size = 14
    end
    object qryProdutosdescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
    object qryProdutosunidade: TStringField
      FieldName = 'unidade'
      Size = 6
    end
    object qryProdutosiat: TStringField
      FieldName = 'iat'
      Size = 1
    end
    object qryProdutosippt: TStringField
      FieldName = 'ippt'
      Size = 1
    end
    object qryProdutossituacaotributaria: TStringField
      FieldName = 'situacaotributaria'
      Size = 1
    end
    object qryProdutosaliquota: TFloatField
      FieldName = 'aliquota'
    end
    object qryProdutosvalorunitario: TFloatField
      FieldName = 'valorunitario'
    end
    object qryProdutoshash_paf_registro_p2: TStringField
      FieldName = 'hash_paf_registro_p2'
      Size = 32
    end
    object qryProdutoshash_paf_registro_p2_calculado: TMemoField
      FieldName = 'hash_paf_registro_p2_calculado'
      BlobType = ftMemo
    end
    object qryProdutosregistrovalido: TBooleanField
      FieldName = 'registrovalido'
    end
    object qryProdutosncm: TStringField
      FieldName = 'ncm'
      Size = 8
    end
    object qryProdutoscest: TStringField
      FieldName = 'cest'
      Size = 7
    end
  end
  object qryEstoques_anterior: TtecQuery
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
        Name = 'SQLListaParcialdeProdutos'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';'
      'SELECT sel.codigovisual,descricao,'
      
        '       case when hash_paf_registro_e2=hash_paf_registro_e2_calcu' +
        'lado THEN unidade ELSE '#39'?'#39' END as unidade,'
      '       estoque'
      'FROM'
      '('
      '       SELECT p.codigovisual,'
      
        '              CAST(p.descricao || coalesce(p.valorgrade1,'#39#39') || ' +
        'coalesce(p.valorgrade2,'#39#39') AS VARCHAR) AS descricao,'
      '              u.descricao AS unidade,'
      '              e.emestoque as estoque,'
      '              hash_paf_registro_e2,'
      
        '              md5(f.cnpj||cast(e.produto as varchar)||p.descrica' +
        'o||u.descricao||'#39'+'#39'||cast(emestoque as varchar)) as hash_paf_reg' +
        'istro_e2_calculado'
      
        '       FROM caracteristicas c JOIN produtos p ON (p.caracteristi' +
        'ca = c.codigo),'
      '            unidades u,estoques e,filiais f'
      '       WHERE c.unidade=u.codigo'
      '       and e.filial=:filialbase'
      '       and e.produto=p.codigo'
      '       and f.codigo=:filialbase'
      '       AND e.filial=f.codigo'
      '       %SQLListaParcialdeProdutos'
      '       ORDER BY p.codigovisual'
      ') as sel')
    RequestLive = False
    Left = 88
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filialbase'
        ParamType = ptUnknown
      end>
    object qryEstoques_anteriorcodigovisual: TStringField
      FieldName = 'codigovisual'
      Size = 30
    end
    object qryEstoques_anteriordescricao: TStringField
      FieldName = 'descricao'
      Size = 40
    end
    object qryEstoques_anteriorunidade: TStringField
      FieldName = 'unidade'
      Size = 8
    end
    object qryEstoques_anteriorestoque: TFloatField
      FieldName = 'estoque'
    end
  end
  object ACBrPAF1: TACBrPAF
    LinesBuffer = 1000
    Path = 'C:\Arquivos de programas\Borland\Delphi6\Bin\'
    AssinarArquivo = False
    OnPAFGetKeyRSA = ACBrEAD1GetChavePrivada
    Left = 128
    Top = 24
  end
  object qryReducaoZMes: TtecQuery
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
      'SELECT not exists(SELECT *'
      '                  FROM reducoesz'
      '                  WHERE numerofabricacao = :serie'
      
        '                    AND EXTRACT(year FROM datamovimento) = EXTRA' +
        'CT(year FROM current_date)'
      
        '                    AND EXTRACT(month FROM datamovimento) = EXTR' +
        'ACT(month FROM current_date)'
      '                  ) AS naoexiste')
    RequestLive = False
    Left = 144
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'serie'
        ParamType = ptUnknown
      end>
    object qryReducaoZMesnaoexiste: TBooleanField
      FieldName = 'naoexiste'
    end
  end
  object qryReducoesZ: TtecQuery
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
      'select *,'
      
        '       CASE WHEN upper(hash_paf_registro_r02)=upper(md5(numerofa' +
        'bricacao ||cast(crz as varchar)||cast(coo as varchar)||cast(cro ' +
        'as varchar)||to_char(datamovimento,'#39'DD/MM/YYYY'#39')||to_char(dataem' +
        'issao,'#39'DD/MM/YYYY HH24:MI:SS'#39')||to_char(horaemissao,'#39'DD/MM/YYYY ' +
        'HH24:MI:SS'#39')||cast(vendabrutadiaria as varchar))) THEN'
      '         true ELSE false END as registrovalido,'
      '         CASE WHEN (select upper(hash_calculado)'
      '                   from hash_inclusao_exclusao'
      
        '                   WHERE nome_registro='#39'r02'#39') = upper((select md' +
        '5(count(*)) from registro_r02))'
      '        THEN'
      '           false'
      '        else'
      '            true'
      '        end as inclusao_exclusao'
      ''
      'from registro_r02'
      
        'where cast(datamovimento as date) between :datainicial and :data' +
        'final'
      
        '     and numerofabricacao=:numerofabricacao /*numerofabricacao =' +
        ' :numerofabricacao*/'
      
        'order by numerofabricacao, mfadicional, modelodoecf, numerousuar' +
        'io,'
      '         crz, coo, cro, datamovimento, dataemissao, horaemissao,'
      '         vendabrutadiaria, parametroincidenciaissqn, filial')
    RequestLive = False
    Left = 48
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numerofabricacao'
        ParamType = ptUnknown
      end>
    object qryReducoesZnumerofabricacao: TStringField
      FieldName = 'numerofabricacao'
    end
    object qryReducoesZfilial: TIntegerField
      FieldName = 'filial'
      Required = True
    end
    object qryReducoesZmfadicional: TStringField
      FieldName = 'mfadicional'
      Size = 1
    end
    object qryReducoesZmodelodoecf: TStringField
      FieldName = 'modelodoecf'
    end
    object qryReducoesZnumerousuario: TIntegerField
      FieldName = 'numerousuario'
      Required = True
    end
    object qryReducoesZcrz: TIntegerField
      FieldName = 'crz'
    end
    object qryReducoesZcoo: TIntegerField
      FieldName = 'coo'
    end
    object qryReducoesZcro: TIntegerField
      FieldName = 'cro'
      Required = True
    end
    object qryReducoesZdatamovimento: TDateField
      FieldName = 'datamovimento'
      Required = True
    end
    object qryReducoesZdataemissao: TDateTimeField
      FieldName = 'dataemissao'
    end
    object qryReducoesZhoraemissao: TDateTimeField
      FieldName = 'horaemissao'
    end
    object qryReducoesZvendabrutadiaria: TFloatField
      FieldName = 'vendabrutadiaria'
    end
    object qryReducoesZparametroincidenciaissqn: TStringField
      FieldName = 'parametroincidenciaissqn'
      Size = 1
    end
    object qryReducoesZregistrovalido: TBooleanField
      FieldName = 'registrovalido'
    end
    object qryReducoesZinclusao_exclusao: TBooleanField
      FieldName = 'inclusao_exclusao'
    end
  end
  object qryReducoesZDetalhes: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkFields = 
      'filial=filial;numerousuario=numerousuario;cro=cro;datamovimento=' +
      'datamovimento'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrReducoesZ
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select rzd.*,'
      
        #9#9#9#9'case when upper(hash_paf_registro_r03)=upper(md5(rz.NumeroFa' +
        'bricacao||cast(rzd.numerousuario as varchar)||to_char(rzd.datamo' +
        'vimento,'#39'DD/MM/YYYY'#39')||cast(rzd.tipototalizadorparcial as varcha' +
        'r)||cast(rzd.aliquota as varchar)||cast(rzd.valoracumulado as va' +
        'rchar)||cast(rz.crz as varchar))) then'
      '          true'
      '        else'
      '          false'
      '        end as registrovalido'
      ''
      'from registro_r02 rz'
      '     join registro_r03 rzd'
      '     on   rz.filial = rzd.filial'
      '     and  rz.numerousuario = rzd.numerousuario'
      '     and  rz.cro = rzd.cro'
      '     and  rz.datamovimento = rzd.datamovimento'
      
        'where cast(rz.datamovimento as date) between :datainicial and :d' +
        'atafinal'
      
        '     and rz.numerofabricacao=:numerofabricacao /*rz.numerofabric' +
        'acao = :numerofabricacao*/'
      
        'order by numerousuario, cro, datamovimento, tipototalizadorparci' +
        'al, filial')
    RequestLive = False
    Left = 56
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numerofabricacao'
        ParamType = ptUnknown
      end>
    object qryReducoesZDetalhesfilial: TIntegerField
      FieldName = 'filial'
    end
    object qryReducoesZDetalhesnumerousuario: TIntegerField
      FieldName = 'numerousuario'
    end
    object qryReducoesZDetalhescro: TIntegerField
      FieldName = 'cro'
    end
    object qryReducoesZDetalhesdatamovimento: TDateField
      FieldName = 'datamovimento'
    end
    object qryReducoesZDetalhestipototalizadorparcial: TStringField
      FieldName = 'tipototalizadorparcial'
      Size = 7
    end
    object qryReducoesZDetalhesaliquota: TFloatField
      FieldName = 'aliquota'
    end
    object qryReducoesZDetalhesvaloracumulado: TFloatField
      FieldName = 'valoracumulado'
    end
    object qryReducoesZDetalhesregistrovalido: TBooleanField
      FieldName = 'registrovalido'
    end
  end
  object qryUltimaReducaoZ: TtecQuery
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
      'select max(crz) as crz'
      'from reducoesz'
      'where  numerofabricacao = :numerofabricacao'
      '   and cro = :cro'
      '   and filial = :filialbase')
    RequestLive = False
    Left = 456
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numerofabricacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filialbase'
        ParamType = ptUnknown
      end>
    object qryUltimaReducaoZcrz: TIntegerField
      FieldName = 'crz'
    end
  end
  object qryMeiosPagto: TtecQuery
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
      ';'
      'SELECT sel.*,'
      '       CASE WHEN upper(hash_paf_registro_a2) ='
      
        '                 upper(hash_paf_registro_a2_calculado) THEN true' +
        ' ELSE false END as registrovalido'
      'FROM'
      '('
      '  SELECT *,'
      
        '        md5(coalesce(cast(ecf as varchar),'#39#39')||cast(data as varc' +
        'har)||cast(tipodocto as varchar)||cast(valoracumulado as varchar' +
        ')) as hash_paf_registro_a2_calculado'
      '  FROM registro_a2'
      '  WHERE filial = :filial'
      '  and data between :datainicial and :datafinal'
      '  ORDER BY data'
      ') as sel'
      '')
    RequestLive = True
    Left = 176
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end>
    object qryMeiosPagtoecf: TIntegerField
      FieldName = 'ecf'
    end
    object qryMeiosPagtofilial: TIntegerField
      FieldName = 'filial'
    end
    object qryMeiosPagtodata: TDateField
      FieldName = 'data'
    end
    object qryMeiosPagtotipodocto: TStringField
      FieldName = 'tipodocto'
      Size = 1
    end
    object qryMeiosPagtomeiopagto: TStringField
      FieldName = 'meiopagto'
      Size = 50
    end
    object qryMeiosPagtovaloracumulado: TFloatField
      FieldName = 'valoracumulado'
    end
    object qryMeiosPagtohash_paf_registro_a2: TStringField
      FieldName = 'hash_paf_registro_a2'
      Size = 32
    end
    object qryMeiosPagtohash_paf_registro_a2_calculado: TMemoField
      FieldName = 'hash_paf_registro_a2_calculado'
      BlobType = ftMemo
    end
    object qryMeiosPagtoregistrovalido: TBooleanField
      FieldName = 'registrovalido'
    end
  end
  object dsrReducoesZ: TtecDataSource
    DataSet = qryReducoesZ
    Left = 80
    Top = 144
  end
  object qryDadosCupom: TtecQuery
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
      'select dlc.num_fab,'
      '       dlc.*,'
      
        '       case when upper(hash_paf_registro_r04)=upper(md5(dlc.Num_' +
        'fab||cast(dlc.ccf as varchar)||cast(dlc.coo as varchar)||cast(dl' +
        'c.vl_tot as varchar)||cast(dlc.canc as varchar))) then'
      '        true'
      '       else'
      '        false'
      '       end as registrovalido'
      'from registro_r04 dlc'
      
        'where cast(dlc.dt_ini as date) between :datainicial and :datafin' +
        'al'
      '  and dlc.num_fab = :num_fab/*dc.num_fab = :num_fab*/'
      '  '
      
        'order by dlc.num_fab, dlc.num_usu, dlc.cro, dlc.coo, dlc.ccf, dl' +
        'c.filial')
    RequestLive = False
    Left = 56
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'num_fab'
        ParamType = ptUnknown
      end>
    object qryDadosCupomnum_fab: TStringField
      FieldName = 'num_fab'
    end
    object qryDadosCupomfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryDadosCupomnum_usu: TIntegerField
      FieldName = 'num_usu'
      DisplayFormat = '0'
    end
    object qryDadosCupomcro: TIntegerField
      FieldName = 'cro'
      DisplayFormat = '0'
    end
    object qryDadosCupomcoo: TIntegerField
      FieldName = 'coo'
      DisplayFormat = '0'
    end
    object qryDadosCupomccf: TIntegerField
      FieldName = 'ccf'
      DisplayFormat = '0'
    end
    object qryDadosCupomdt_ini: TDateField
      Alignment = taCenter
      FieldName = 'dt_ini'
      EditMask = '99/99/9999;1; '
    end
    object qryDadosCupomsub_docto: TFloatField
      FieldName = 'sub_docto'
      DisplayFormat = '0.00'
    end
    object qryDadosCupomsub_descto: TFloatField
      FieldName = 'sub_descto'
      DisplayFormat = '0.00'
    end
    object qryDadosCupomtp_descto: TStringField
      FieldName = 'tp_descto'
      Size = 1
    end
    object qryDadosCupomsub_acres: TFloatField
      FieldName = 'sub_acres'
      DisplayFormat = '0.00'
    end
    object qryDadosCupomtp_acres: TStringField
      FieldName = 'tp_acres'
      Size = 1
    end
    object qryDadosCupomvl_tot: TFloatField
      FieldName = 'vl_tot'
      DisplayFormat = '0.00'
    end
    object qryDadosCupomcanc: TStringField
      FieldName = 'canc'
      Size = 1
    end
    object qryDadosCupomvl_ca: TFloatField
      FieldName = 'vl_ca'
      DisplayFormat = '0.00'
    end
    object qryDadosCupomordem_da: TStringField
      FieldName = 'ordem_da'
      Size = 1
    end
    object qryDadosCupomnome_cli: TStringField
      FieldName = 'nome_cli'
    end
    object qryDadosCupomcnpj_cpf: TStringField
      FieldName = 'cnpj_cpf'
      Size = 14
    end
    object qryDadosCupomregistrovalido: TBooleanField
      FieldName = 'registrovalido'
    end
  end
  object dsrDadosCupom: TtecDataSource
    DataSet = qryDadosCupom
    Left = 104
    Top = 264
  end
  object qryDadosItemCupom: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkFields = 'filial=filial; num_usu=num_usu; cro=cro;  coo=coo'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrDadosCupom
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select dic.*,'
      
        '       case when upper(hash_paf_registro_r05)=upper(md5(dic.num_' +
        'fab||cast(dic.coo as varchar)||cast(dic.ccf as varchar)||cast(co' +
        'd_item as varchar)||cast(qtde_item as varchar)||cast(vl_unit as ' +
        'varchar)||cast(vl_tot_item as varchar)||cast(cod_tot_parc as var' +
        'char)||cast(ind_canc as varchar))) then'
      '         true'
      '       else'
      '         false'
      '       end as registrovalido'
      'from  registro_r05 dic'
      
        'where cast(dic.dt_ini as date) between :datainicial and :datafin' +
        'al'
      '  and dic.num_fab = :num_fab'
      'order by dic.num_usu, dic.cro, dic.coo, dic.num_item, dic.filial')
    RequestLive = False
    Left = 56
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'num_fab'
        ParamType = ptUnknown
      end>
    object qryDadosItemCupomfilial: TIntegerField
      FieldName = 'filial'
      Required = True
      DisplayFormat = '0'
    end
    object qryDadosItemCupomnum_usu: TIntegerField
      FieldName = 'num_usu'
      Required = True
      DisplayFormat = '0'
    end
    object qryDadosItemCupomcro: TIntegerField
      FieldName = 'cro'
      Required = True
      DisplayFormat = '0'
    end
    object qryDadosItemCupomcoo: TIntegerField
      FieldName = 'coo'
      Required = True
      DisplayFormat = '0'
    end
    object qryDadosItemCupomnum_item: TIntegerField
      FieldName = 'num_item'
      Required = True
      DisplayFormat = '0'
    end
    object qryDadosItemCupomcod_item: TStringField
      FieldName = 'cod_item'
      Size = 14
    end
    object qryDadosItemCupomdesc_item: TStringField
      FieldName = 'desc_item'
      Size = 100
    end
    object qryDadosItemCupomqtde_item: TFloatField
      FieldName = 'qtde_item'
      DisplayFormat = '0.00'
    end
    object qryDadosItemCupomun_med: TStringField
      FieldName = 'un_med'
      Size = 3
    end
    object qryDadosItemCupomvl_unit: TFloatField
      FieldName = 'vl_unit'
      DisplayFormat = '0.00'
    end
    object qryDadosItemCupomdescto_item: TFloatField
      FieldName = 'descto_item'
      DisplayFormat = '0.00'
    end
    object qryDadosItemCupomacres_item: TFloatField
      FieldName = 'acres_item'
      DisplayFormat = '0.00'
    end
    object qryDadosItemCupomvl_tot_item: TFloatField
      FieldName = 'vl_tot_item'
      DisplayFormat = '0.00'
    end
    object qryDadosItemCupomcod_tot_parc: TStringField
      FieldName = 'cod_tot_parc'
      Size = 7
    end
    object qryDadosItemCupomind_canc: TStringField
      FieldName = 'ind_canc'
      Size = 1
    end
    object qryDadosItemCupomqtde_canc: TFloatField
      FieldName = 'qtde_canc'
      DisplayFormat = '0.00'
    end
    object qryDadosItemCupomvl_canc: TFloatField
      FieldName = 'vl_canc'
      DisplayFormat = '0.00'
    end
    object qryDadosItemCupomvl_canc_acres: TFloatField
      FieldName = 'vl_canc_acres'
      DisplayFormat = '0.00'
    end
    object qryDadosItemCupomiat: TStringField
      FieldName = 'iat'
      Size = 1
    end
    object qryDadosItemCupomippt: TStringField
      FieldName = 'ippt'
      Size = 1
    end
    object qryDadosItemCupomqtde_decimal: TIntegerField
      FieldName = 'qtde_decimal'
      DisplayFormat = '0'
    end
    object qryDadosItemCupomvl_decimal: TIntegerField
      FieldName = 'vl_decimal'
      DisplayFormat = '0'
    end
    object qryDadosItemCupomregistrovalido: TBooleanField
      FieldName = 'registrovalido'
    end
  end
  object qryFormasPagamentoCupom: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkFields = 'filial=filial; num_usu=num_usu; cro=cro;  coo=coo'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrDadosCupom
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select fp.*,'
      '       case when'
      
        '         upper(hash_paf_registro_r07)=upper(md5(fp.num_fab||cast' +
        '(fp.coo as varchar)||cast(COALESCE(fp.ccf,0) as varchar)||cast(C' +
        'OALESCE(fp.gnf,0) as varchar)||cast(fp.datacupom as varchar)))'
      '       then'
      '          true'
      '       else'
      '          false'
      '       end as registrovalido'
      'from registro_r07 fp'
      ''
      
        'where cast(fp.datacupom as date) between :datainicial and :dataf' +
        'inal'
      '  and fp.num_fab = :num_fab'
      '  and fp.tipo='#39'detalhecupom'#39
      'order by fp.num_usu, fp.cro, fp.coo, fp.num_item, fp.filial')
    RequestLive = False
    Left = 56
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'num_fab'
        ParamType = ptUnknown
      end>
    object qryFormasPagamentoCupomfilial: TIntegerField
      FieldName = 'filial'
      Required = True
      DisplayFormat = '0'
    end
    object qryFormasPagamentoCupomnum_usu: TIntegerField
      FieldName = 'num_usu'
      Required = True
      DisplayFormat = '0'
    end
    object qryFormasPagamentoCupomcro: TIntegerField
      FieldName = 'cro'
      Required = True
      DisplayFormat = '0'
    end
    object qryFormasPagamentoCupomcoo: TIntegerField
      FieldName = 'coo'
      Required = True
      DisplayFormat = '0'
    end
    object qryFormasPagamentoCupomnum_item: TIntegerField
      FieldName = 'num_item'
      Required = True
      DisplayFormat = '0'
    end
    object qryFormasPagamentoCupommp: TStringField
      FieldName = 'mp'
      Size = 15
    end
    object qryFormasPagamentoCupomvl_pagto: TFloatField
      FieldName = 'vl_pagto'
      DisplayFormat = '0.00'
    end
    object qryFormasPagamentoCupomind_est: TStringField
      FieldName = 'ind_est'
      Size = 1
    end
    object qryFormasPagamentoCupomvl_est: TFloatField
      FieldName = 'vl_est'
      DisplayFormat = '0.00'
    end
    object qryFormasPagamentoCupomccf: TIntegerField
      FieldName = 'ccf'
      DisplayFormat = '0'
    end
    object qryFormasPagamentoCupomregistrovalido: TBooleanField
      FieldName = 'registrovalido'
    end
  end
  object qryDemaisDoctos: TtecQuery
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
      'select ddc.*,'
      
        '       case when upper(hash_paf_registro_r06)=upper(md5(ddc.num_' +
        'fab||cast(ddc.coo as varchar)||cast(COALESCE(gnf,0) as varchar)|' +
        '|cast(COALESCE(cdc,0) as varchar)||cast(denom as varchar)||to_ch' +
        'ar(dt_fin,'#39'DD/MM/YYYY'#39'))) then'
      '          true'
      '       else'
      '          false'
      '       end as registrovalido'
      'from registro_r06 ddc'
      
        '            /*nao trazer cupom fiscal cancelado .. verificar se ' +
        'deveria ser gravado em detalhdemaisdoctos'
      
        '       and not exists (select * from detalhecupom dlc where dlc.' +
        'filial=dc.filial and dlc.num_usu=dc.num_usu and dlc.cro=dc.cro a' +
        'nd dlc.coo=ddc.cooref and dlc.canc='#39'S'#39')*/'
      
        'where cast(ddc.dt_fin as date) between :datainicial and :datafin' +
        'al'
      '  and ddc.num_fab = :num_fab'
      'order by ddc.num_usu, ddc.cro, ddc.coo, ddc.filial')
    RequestLive = False
    Left = 176
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'num_fab'
        ParamType = ptUnknown
      end>
    object qryDemaisDoctosfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryDemaisDoctosnum_usu: TIntegerField
      FieldName = 'num_usu'
      DisplayFormat = '0'
    end
    object qryDemaisDoctoscro: TIntegerField
      FieldName = 'cro'
      DisplayFormat = '0'
    end
    object qryDemaisDoctoscoo: TIntegerField
      FieldName = 'coo'
      DisplayFormat = '0'
    end
    object qryDemaisDoctoscooref: TIntegerField
      FieldName = 'cooref'
      DisplayFormat = '0'
    end
    object qryDemaisDoctosgnf: TIntegerField
      FieldName = 'gnf'
      DisplayFormat = '0'
    end
    object qryDemaisDoctosgrg: TIntegerField
      FieldName = 'grg'
      DisplayFormat = '0'
    end
    object qryDemaisDoctoscdc: TIntegerField
      FieldName = 'cdc'
      DisplayFormat = '0'
    end
    object qryDemaisDoctosdenom: TStringField
      FieldName = 'denom'
      Size = 2
    end
    object qryDemaisDoctosdt_fin: TDateTimeField
      FieldName = 'dt_fin'
    end
    object qryDemaisDoctoshr_fin: TDateTimeField
      FieldName = 'hr_fin'
    end
    object qryDemaisDoctosregistrovalido: TBooleanField
      FieldName = 'registrovalido'
    end
  end
  object dsrDemaisDoctos: TtecDataSource
    DataSet = qryDemaisDoctos
    Left = 208
    Top = 272
  end
  object qryFormasPagtoDemais: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkFields = 'filial=filial; num_usu=num_usu; cro=cro;  coo=coo'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrDemaisDoctos
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select fp.*,'
      '       case when'
      
        '         upper(hash_paf_registro_r07)=upper(md5(fp.num_fab||cast' +
        '(fp.coo as varchar)||cast(COALESCE(fp.ccf,0) as varchar)||cast(C' +
        'OALESCE(fp.gnf,0) as varchar)||cast(fp.datacupom as varchar)))'
      '       then'
      '          true'
      '       else'
      '          false'
      '       end as registrovalido'
      'from  registro_r07 fp'
      
        'where cast(fp.datacupom as date) between :datainicial and :dataf' +
        'inal'
      '  and fp.num_fab = :num_fab'
      '  and fp.tipo='#39'demaisdoctos'#39
      'order by fp.num_usu, fp.cro, fp.coo, fp.num_item, fp.filial')
    RequestLive = False
    Left = 176
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'num_fab'
        ParamType = ptUnknown
      end>
    object qryFormasPagtoDemaisfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryFormasPagtoDemaisnum_usu: TIntegerField
      FieldName = 'num_usu'
      DisplayFormat = '0'
    end
    object qryFormasPagtoDemaiscro: TIntegerField
      FieldName = 'cro'
      DisplayFormat = '0'
    end
    object qryFormasPagtoDemaiscoo: TIntegerField
      FieldName = 'coo'
      DisplayFormat = '0'
    end
    object qryFormasPagtoDemaisnum_item: TIntegerField
      FieldName = 'num_item'
      DisplayFormat = '0'
    end
    object qryFormasPagtoDemaismp: TStringField
      FieldName = 'mp'
      Size = 15
    end
    object qryFormasPagtoDemaisvl_pagto: TFloatField
      FieldName = 'vl_pagto'
      DisplayFormat = '0.00'
    end
    object qryFormasPagtoDemaisind_est: TStringField
      FieldName = 'ind_est'
      Size = 1
    end
    object qryFormasPagtoDemaisvl_est: TFloatField
      FieldName = 'vl_est'
      DisplayFormat = '0.00'
    end
    object qryFormasPagtoDemaisgnf: TIntegerField
      FieldName = 'gnf'
      DisplayFormat = '0'
    end
    object qryFormasPagtoDemaisregistrovalido: TBooleanField
      FieldName = 'registrovalido'
    end
  end
  object qryDataMovimentoUltimaZ: TtecQuery
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
      'select datamovimento'
      'from reducoesz'
      'where  numerofabricacao = :numerofabricacao'
      '   and cro = :cro'
      '   and filial = :filialbase'
      '   and crz = :crz')
    RequestLive = False
    Left = 288
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numerofabricacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filialbase'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'crz'
        ParamType = ptUnknown
      end>
    object qryDataMovimentoUltimaZdatamovimento: TDateField
      FieldName = 'datamovimento'
    end
  end
  object qryDadosECF: TtecQuery
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
      ';'
      'select serie,mfadicional,tipo,marca,modelodescricao,'
      
        '       CASE WHEN upper(hash_paf_registro_r01)=upper(hash_paf_reg' +
        'istro_r01_calculado) THEN true ELSE false END as registrovalido,'
      '       versao_sb,data_sb,maquina,cnpj,ie,'
      
        '        codigo,filial,intervencao,cniee,modelo,grandetotal,venda' +
        'bruta,'
      '        /*CASE WHEN (select upper(hash_calculado)'
      
        '                   from hash_inclusao_exclusao where nome_regist' +
        'ro='#39'MOVECF'#39') = upper('
      ''
      '                   md5(('#9'select cast(sum(total) as varchar)'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9'       from'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9'('
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9' '#9'select count(*) as total from registro_r01'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9' '#9'union'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9'  '#9'select count(*) as total from registro_r02'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9' '#9'union'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9' '#9'select count(*) as total from registro_r03'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9' '#9'union'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9' '#9'select count(*) as total from registro_r04'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9' '#9'union'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9' '#9'select count(*) as total from registro_r05'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9' '#9'union'
      
        '                              '#9'select count(*) as total from reg' +
        'istro_r06'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9' '#9'union'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9' '#9'select count(*) as total from regisro_r07'
      '                                union'
      
        '                                select count(*) as total from re' +
        'gisro_a2'
      '                                union'
      
        '                                select count(*) as total from re' +
        'gisro_e2'
      '                                union'
      
        '                                select count(*) as total from re' +
        'gisro_p2'
      '                                union'
      
        '                                select count(*) as total from re' +
        'gisro_h2'
      '                                union'
      
        '                                select count(*) as total from re' +
        'gisro_j1'
      '                                union'
      
        '                                select count(*) as total from re' +
        'gisro_j2'
      '                            )'
      ''
      ''
      '                   )'
      '        THEN'
      '           false'
      '        else'
      '            true'
      '        end as inclusao_exclusao*/ false as inclusao_exclusao'
      ''
      'from'
      '('
      '  select *,'
      
        '       md5(serie || mfadicional||tipo||marca||modelodescricao||v' +
        'ersao_sb ||cast(data_sb as varchar)||cast(maquina as varchar)||c' +
        'ast(cnpj as varchar)||COALESCE(ie,'#39#39#39#39')) as hash_paf_registro_r0' +
        '1_calculado'
      ''
      '  from registro_r01'
      ') as sel')
    RequestLive = False
    Left = 288
    Top = 168
    object qryDadosECFcodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
      DisplayFormat = '0'
    end
    object qryDadosECFfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryDadosECFmaquina: TStringField
      FieldName = 'maquina'
      Size = 4
    end
    object qryDadosECFintervencao: TStringField
      FieldName = 'intervencao'
      Size = 4
    end
    object qryDadosECFserie: TStringField
      FieldName = 'serie'
    end
    object qryDadosECFcniee: TStringField
      FieldName = 'cniee'
      Size = 6
    end
    object qryDadosECFmodelo: TIntegerField
      FieldName = 'modelo'
      DisplayFormat = '0'
    end
    object qryDadosECFmodelodescricao: TStringField
      FieldName = 'modelodescricao'
    end
    object qryDadosECFgrandetotal: TFloatField
      FieldName = 'grandetotal'
      DisplayFormat = '0.00'
    end
    object qryDadosECFvendabruta: TFloatField
      FieldName = 'vendabruta'
      DisplayFormat = '0.00'
    end
    object qryDadosECFmfadicional: TStringField
      FieldName = 'mfadicional'
      Size = 1
    end
    object qryDadosECFtipo: TStringField
      FieldName = 'tipo'
      Size = 7
    end
    object qryDadosECFmarca: TStringField
      FieldName = 'marca'
    end
    object qryDadosECFdata_sb: TDateTimeField
      FieldName = 'data_sb'
    end
    object qryDadosECFcnpj: TStringField
      FieldName = 'cnpj'
    end
    object qryDadosECFie: TStringField
      FieldName = 'ie'
    end
    object qryDadosECFversao_sb: TStringField
      FieldName = 'versao_sb'
      Size = 15
    end
    object qryDadosECFregistrovalido: TBooleanField
      FieldName = 'registrovalido'
    end
    object qryDadosECFinclusao_exclusao: TBooleanField
      FieldName = 'inclusao_exclusao'
    end
  end
  object ACBrEAD1: TACBrEAD
    OnGetChavePrivada = ACBrEAD1GetChavePrivada
    Left = 424
    Top = 112
  end
  object qryEstoquesData: TtecQuery
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
      ';'
      
        'select cnpj,inscricao_estadual,inscricao_municipal,razao_social,' +
        'numero_fabricacao,mf_adicional,'
      '       tipo_ecf,marca_do_ecf,modelo_do_ecf,'
      
        '       case WHEN hash_registro_e3=hash_registro_e3_atual THEN tr' +
        'ue ELSE false END as registrovalido,'
      '       data_do_estoque,cast(hora_do_estoque as varchar(8)),'
      
        '       case when (select hash_calculado from hash_inclusao_exclu' +
        'sao where nome_registro='#39'ESTOQUE'#39')=md5((select cast(count(*) as ' +
        'varchar) from registro_e2))then'
      '         false'
      '       else'
      '         true'
      '       end as inclusao_exclusao'
      'FROM'
      '('
      'select *,'
      
        '       md5(cnpj || COALESCE(inscricao_estadual,'#39#39') || COALESCE(i' +
        'nscricao_municipal,'#39#39') || razao_social'
      
        '           || numero_fabricacao || mf_adicional || tipo_ecf || m' +
        'arca_do_ecf || modelo_do_ecf'
      
        '           || cast(data_do_estoque as varchar) || cast(hora_do_e' +
        'stoque as varchar)) as hash_registro_e3_atual'
      
        '         from paf_cabecalho WHERE filial=:filialbase and atual L' +
        'IMIT 1) AS sel;'
      '/*select data, cast(hora as varchar) as hora'
      'from movimentos'
      'order by data desc, hora desc limit 1;*/')
    RequestLive = False
    Left = 392
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filialbase'
        ParamType = ptUnknown
      end>
    object qryEstoquesDatacnpj: TStringField
      FieldName = 'cnpj'
      Size = 14
    end
    object qryEstoquesDatainscricao_estadual: TStringField
      FieldName = 'inscricao_estadual'
      Size = 14
    end
    object qryEstoquesDatainscricao_municipal: TStringField
      FieldName = 'inscricao_municipal'
      Size = 14
    end
    object qryEstoquesDatarazao_social: TStringField
      FieldName = 'razao_social'
      Size = 50
    end
    object qryEstoquesDatanumero_fabricacao: TStringField
      FieldName = 'numero_fabricacao'
    end
    object qryEstoquesDatamf_adicional: TStringField
      FieldName = 'mf_adicional'
      Size = 1
    end
    object qryEstoquesDatatipo_ecf: TStringField
      FieldName = 'tipo_ecf'
      Size = 7
    end
    object qryEstoquesDatamarca_do_ecf: TStringField
      FieldName = 'marca_do_ecf'
    end
    object qryEstoquesDatamodelo_do_ecf: TStringField
      FieldName = 'modelo_do_ecf'
      Size = 50
    end
    object qryEstoquesDatadata_do_estoque: TDateField
      FieldName = 'data_do_estoque'
    end
    object qryEstoquesDatahora_do_estoque: TStringField
      FieldName = 'hora_do_estoque'
      Size = 8
    end
    object qryEstoquesDataregistrovalido: TBooleanField
      FieldName = 'registrovalido'
    end
    object qryEstoquesDatainclusao_exclusao: TBooleanField
      FieldName = 'inclusao_exclusao'
    end
  end
  object qryEstoques: TtecQuery
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
        Name = 'SQLListaParcialdeProdutos'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';'
      'SELECT sel.*,'
      '       CASE WHEN upper(hash_paf_registro_e2) ='
      
        '                 upper(hash_paf_registro_e2_calculado) THEN true' +
        ' ELSE false END as registrovalido'
      'FROM'
      '('
      '  SELECT *,'
      
        '        md5(cnpj||cast(produto as varchar)||coalesce(cest,'#39#39')||c' +
        'oalesce(ncm,'#39#39')||descricao||unidade||'#39'+'#39'||cast(emestoque as varc' +
        'har)) as hash_paf_registro_e2_calculado'
      '  FROM registro_e2'
      '  WHERE cnpj = :cnpj'
      '  %SQLListaParcialdeProdutos'
      '  ORDER BY produto'
      ') as sel')
    RequestLive = False
    Left = 40
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cnpj'
        ParamType = ptUnknown
      end>
    object qryEstoquescnpj: TStringField
      FieldName = 'cnpj'
      Size = 14
    end
    object qryEstoquesproduto: TStringField
      FieldName = 'produto'
      Size = 14
    end
    object qryEstoquesdescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
    object qryEstoquesunidade: TStringField
      FieldName = 'unidade'
      Size = 6
    end
    object qryEstoquesemestoque: TFloatField
      FieldName = 'emestoque'
    end
    object qryEstoquesmensuracao: TStringField
      FieldName = 'mensuracao'
      Size = 1
    end
    object qryEstoqueshash_paf_registro_e2: TStringField
      FieldName = 'hash_paf_registro_e2'
      Size = 32
    end
    object qryEstoqueshash_paf_registro_e2_calculado: TMemoField
      FieldName = 'hash_paf_registro_e2_calculado'
      BlobType = ftMemo
    end
    object qryEstoquesregistrovalido: TBooleanField
      FieldName = 'registrovalido'
    end
    object qryEstoquesncm: TStringField
      FieldName = 'ncm'
      Size = 8
    end
    object qryEstoquescest: TStringField
      FieldName = 'cest'
      Size = 7
    end
  end
  object qryprodutos_anterior: TtecQuery
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
      ';'
      'SELECT codigovisual,descricao,'
      
        '       CASE WHEN hash_paf_registro_p2=hash_paf_registro_p2_calcu' +
        'lado THEN unidade ELSE '#39'?'#39' END AS unidade,'
      '       producaopropria,situacaotributaria,aliquota,precounitario'
      'FROM'
      '('
      '   SELECT p.codigovisual,'
      
        '       CAST(p.descricao || coalesce(p.valorgrade1,'#39#39') || coalesc' +
        'e(p.valorgrade2,'#39#39') AS VARCHAR) AS descricao,'
      ''
      '       u.descricao AS unidade,'
      '       CAST(CASE WHEN c.producaopropria THEN '#39'P'#39
      '                                        ELSE '#39'T'#39
      '            END AS CHAR) as producaopropria,'
      ''
      '       CAST(CASE WHEN c.incidencia = 5           THEN '#39'I'#39
      '                 WHEN c.incidencia in (4,6,7,11) THEN '#39'N'#39
      '                 WHEN c.incidencia in (2,9,10)   THEN '#39'F'#39
      '                 WHEN c.incidencia in (1,3,8)    THEN '#39'T'#39
      '            END AS CHAR) AS situacaotributaria,'
      ''
      
        '       CAST(COALESCE((SELECT ei.valor FROM estadosicms ei WHERE ' +
        'ei.icms = c.icms AND ei.estado = :estado),0) AS NUMERIC) AS aliq' +
        'uota,'
      ''
      '       estoques_preco(p.codigo,:filialbase) AS precounitario,'
      ''
      '       hash_paf_registro_p2,'
      ''
      '       md5(f.cnpj||p.codigo||p.descricao||u.descricao||'#39'T'#39'||'#39'T'#39
      '           || CAST(CASE WHEN c.incidencia = 5  THEN '#39'I'#39
      #9'      '#9'        WHEN c.incidencia in (4,6,7,11) THEN '#39'N'#39
      #9#9#9'WHEN c.incidencia in (2,9,10)   THEN '#39'F'#39
      #9#9#9'WHEN c.incidencia in (1,3,8)    THEN '#39'T'#39
      '                    END AS CHAR)'
      
        '           || CAST(COALESCE((SELECT ei.valor FROM estadosicms ei' +
        ' WHERE ei.icms = c.icms AND ei.estado = f.estado),0) AS NUMERIC)'
      
        #9#9#9#9#9#9#9'|| estoques_preco(p.codigo,f.codigo))  as hash_paf_regist' +
        'ro_p2_calculado'
      ''
      ''
      
        '   FROM caracteristicas c JOIN produtos p ON p.caracteristica = ' +
        'c.codigo,'
      '        filiais f, unidades u,estoques e'
      '   WHERE f.codigo=:filialbase'
      '   AND u.codigo=c.unidade'
      '   AND e.filial=f.codigo'
      '   AND e.produto=p.codigo'
      '   ORDER BY p.codigovisual'
      ') AS SEL')
    RequestLive = False
    Left = 408
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'estado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filialbase'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      FieldName = 'codigovisual'
      Required = True
      Size = 30
    end
    object StringField2: TStringField
      FieldName = 'descricao'
      Size = 40
    end
    object StringField3: TStringField
      FieldName = 'unidade'
      Size = 8
    end
    object StringField4: TStringField
      FieldName = 'producaopropria'
      Size = 1
    end
    object StringField5: TStringField
      FieldName = 'situacaotributaria'
      Size = 1
    end
    object FloatField1: TFloatField
      FieldName = 'aliquota'
      DisplayFormat = '0.00'
    end
    object FloatField2: TFloatField
      FieldName = 'precounitario'
      DisplayFormat = '0.00'
    end
  end
  object qryInclusaoExclusao: TtecQuery
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
      ';'
      
        'SELECT CASE WHEN upper(hash_paf_registro_u1)=upper(hash_paf_regi' +
        'stro_u1_calculado) THEN true ELSE false END as registrovalido'
      'from'
      '(select hash_paf_registro_u1,'
      ''
      ''
      #9#9#9#9#9#9#9#9'md5(('#9'select cast(sum(total) as varchar)'
      #9#9#9#9#9#9#9#9#9#9'from'
      #9#9#9#9#9#9#9#9#9#9'('
      #9#9#9#9#9#9#9#9#9#9#9'select count(*) as total from paf_cabecalho'
      #9#9#9#9#9#9#9#9#9#9#9'union all'
      #9#9#9#9#9#9#9#9#9#9#9'select count(*) as total from registro_a2'
      #9#9#9#9#9#9#9#9#9#9#9'union all'
      #9#9#9#9#9#9#9#9#9#9#9'select count(*) as total from registro_p2'
      #9#9#9#9#9#9#9#9#9#9#9'union all'
      #9#9#9#9#9#9#9#9#9#9#9'select count(*) as total from registro_e2'
      '                      union all'
      #9#9#9#9#9#9#9#9#9#9#9'select count(*) as total from registro_r01'
      #9#9#9#9#9#9#9#9#9#9#9'union all'
      #9#9#9#9#9#9#9#9#9#9#9'('
      #9#9#9#9#9#9#9#9#9#9#9#9'select count(*) as total'
      #9#9#9#9#9#9#9#9#9#9#9#9'from registro_r02'
      #9#9#9#9#9#9#9#9#9#9#9')'
      #9#9#9#9#9#9#9#9#9#9#9'union all'
      #9#9#9#9#9#9#9#9#9#9#9'('
      #9#9#9#9#9#9#9#9#9#9#9#9'select count(*) as total'
      #9#9#9#9#9#9#9#9#9#9#9#9'from registro_r03'
      #9#9#9#9#9#9#9#9#9#9#9')'
      #9#9#9#9#9#9#9#9#9#9#9'union all'
      #9#9#9#9#9#9#9#9#9#9#9'('
      #9#9#9#9#9#9#9#9#9#9#9#9'select count(*) from registro_r04'
      ''
      #9#9#9#9#9#9#9#9#9#9#9')'
      #9#9#9#9#9#9#9#9#9#9#9'union all'
      #9#9#9#9#9#9#9#9#9#9#9'select count(*) from registro_r05'
      #9#9#9#9#9#9#9#9#9#9#9'union all'
      #9#9#9#9#9#9#9#9#9#9#9'('
      #9#9#9#9#9#9#9#9#9#9#9#9'select count(*) from registro_r06'
      #9#9#9#9#9#9#9#9#9#9#9')'
      #9#9#9#9#9#9#9#9#9#9#9'union all'
      #9#9#9#9#9#9#9#9#9#9#9'select count(*) as total from registro_r07'
      #9#9#9#9#9#9#9#9#9#9#9'union all'
      '                      select count(*) as total from registro_h2'
      #9#9#9#9#9#9#9#9#9#9#9'union all'
      '                      select count(*) as total from registro_j1'
      #9#9#9#9#9#9#9#9#9#9#9'union all'
      '                      select count(*) as total from registro_j2'
      ''
      #9#9#9#9#9#9#9#9#9#9') as sel'
      #9#9#9#9#9#9#9#9#9')) as hash_paf_registro_u1_calculado'
      #9'from filiais'
      #9'where codigo=:filial'
      ') as sel'
      '')
    RequestLive = False
    Left = 368
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end>
    object qryInclusaoExclusaoregistrovalido: TBooleanField
      FieldName = 'registrovalido'
    end
  end
  object qryTroco: TtecQuery
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
      ';'
      'select *,'
      
        '       case WHEN hash_registro_h2=hash_registro_h2_calculado THE' +
        'N true ELSE false END as registrovalido'
      'FROM'
      '('
      'select rh.*,e.mfadicional,e.tipo,e.marca,e.modelo,'
      
        '       md5(cnpj_credenciadora || rh.numero_fabricacao || cast(co' +
        'o as varchar) || cast(ccf as varchar)'
      
        '          || cast(valor_troco as varchar) || to_char(data_troco,' +
        #39'DD/MM/YYYY H24:MI:SS'#39') || cpf || titulo) as hash_registro_h2_ca' +
        'lculado'
      '         from registro_h2 rh,ecfs e'
      '         WHERE rh.filial=:filialbase'
      '         and rh.numero_fabricacao=e.serie'
      
        '         AND data_troco between :datainicial and :datafinal) AS ' +
        'sel;'
      '')
    RequestLive = False
    Left = 328
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filialbase'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end>
    object qryTrocofilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryTrococnpj_credenciadora: TStringField
      FieldName = 'cnpj_credenciadora'
      Size = 14
    end
    object qryTroconumero_fabricacao: TStringField
      FieldName = 'numero_fabricacao'
    end
    object qryTrococoo: TIntegerField
      FieldName = 'coo'
      DisplayFormat = '0'
    end
    object qryTrococcf: TIntegerField
      FieldName = 'ccf'
      DisplayFormat = '0'
    end
    object qryTrocovalor_troco: TFloatField
      FieldName = 'valor_troco'
      DisplayFormat = '0.00'
    end
    object qryTrocodata_troco: TDateTimeField
      FieldName = 'data_troco'
    end
    object qryTrococpf: TStringField
      FieldName = 'cpf'
      Size = 14
    end
    object qryTrocotitulo: TStringField
      FieldName = 'titulo'
      Size = 7
    end
    object qryTrocohash_registro_h2: TStringField
      FieldName = 'hash_registro_h2'
      Size = 32
    end
    object qryTrocohash_registro_h2_calculado: TMemoField
      FieldName = 'hash_registro_h2_calculado'
      BlobType = ftMemo
    end
    object qryTrocoregistrovalido: TBooleanField
      FieldName = 'registrovalido'
    end
    object qryTrocomfadicional: TStringField
      FieldName = 'mfadicional'
      Size = 1
    end
    object qryTrocotipo: TStringField
      FieldName = 'tipo'
      Size = 7
    end
    object qryTrocomarca: TStringField
      FieldName = 'marca'
    end
    object qryTrocomodelo: TIntegerField
      FieldName = 'modelo'
    end
  end
  object qryNotas: TtecQuery
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
      'select *,'
      '       case when hash_paf_registro_j1 ='
      ''
      '       md5('
      ''
      '             cast(cnpj as varchar)||'
      '             cast(emissao as varchar)||'
      '             cast(subtotal as varchar)||'
      '             cast(DescSubtotal as varchar)||'
      '             cast(TipoDescSubtotal as varchar)||'
      '             cast(AcrescSubtotal as varchar)||'
      '             cast(TipoAcrescSubtotal as varchar)||'
      '             cast(TotalLiquido as varchar)||'
      '             cast(IndCanc as varchar)||'
      '             cast(CancAcrescSubTotal as varchar)||'
      '             cast(OrdemAplicDesc_e_Acresc as varchar)||'
      '             cast(NomedoCliente as varchar)||'
      '             cast(cpf_ou_cnpj_cliente as varchar)||'
      '             cast(numeronota as varchar)||'
      '             cast(serienota as varchar)||'
      '             cast(chv_nfe as varchar)||'
      '             cast(tipodedocumento as varchar)'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '        ) then true else false end as registrovalido'
      ''
      'from registro_j1'
      ''
      'where emissao between :dataInicial and :dataFinal'
      'order by dadofiscal')
    RequestLive = False
    Left = 240
    Top = 384
    ParamData = <
      item
        DataType = ftString
        Name = 'dataInicial'
        ParamType = ptUnknown
        Value = '2016-10-01'
      end
      item
        DataType = ftString
        Name = 'dataFinal'
        ParamType = ptUnknown
        Value = '2016-10-31'
      end>
    object qryNotasdadofiscal: TIntegerField
      FieldName = 'dadofiscal'
      Required = True
      DisplayFormat = '0'
    end
    object qryNotascnpj: TStringField
      FieldName = 'cnpj'
      Size = 14
    end
    object qryNotasemissao: TDateField
      Alignment = taCenter
      FieldName = 'emissao'
      EditMask = '99/99/9999;1; '
    end
    object qryNotassubtotal: TFloatField
      FieldName = 'subtotal'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryNotasdescsubtotal: TFloatField
      FieldName = 'descsubtotal'
      DisplayFormat = '0.00'
    end
    object qryNotastipodescsubtotal: TStringField
      FieldName = 'tipodescsubtotal'
      Size = 1
    end
    object qryNotasacrescsubtotal: TFloatField
      FieldName = 'acrescsubtotal'
      DisplayFormat = '0.00'
    end
    object qryNotastipoacrescsubtotal: TStringField
      FieldName = 'tipoacrescsubtotal'
      Size = 1
    end
    object qryNotastotalliquido: TFloatField
      FieldName = 'totalliquido'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryNotasindcanc: TStringField
      FieldName = 'indcanc'
      Size = 1
    end
    object qryNotascancacrescsubtotal: TFloatField
      FieldName = 'cancacrescsubtotal'
      DisplayFormat = '0.00'
    end
    object qryNotasordemaplicdesc_e_acresc: TStringField
      FieldName = 'ordemaplicdesc_e_acresc'
      Size = 1
    end
    object qryNotasnomedocliente: TStringField
      FieldName = 'nomedocliente'
      Size = 40
    end
    object qryNotascpf_ou_cnpj_cliente: TStringField
      FieldName = 'cpf_ou_cnpj_cliente'
      Size = 14
    end
    object qryNotasnumeronota: TIntegerField
      FieldName = 'numeronota'
      Required = True
      DisplayFormat = '0'
    end
    object qryNotasserienota: TStringField
      FieldName = 'serienota'
      Required = True
      Size = 3
    end
    object qryNotaschv_nfe: TStringField
      FieldName = 'chv_nfe'
      Size = 44
    end
    object qryNotastipodedocumento: TIntegerField
      FieldName = 'tipodedocumento'
      DisplayFormat = '0'
    end
    object qryNotashash_paf_registro_j1: TStringField
      FieldName = 'hash_paf_registro_j1'
      Size = 32
    end
    object qryNotasregistrovalido: TBooleanField
      FieldName = 'registrovalido'
    end
  end
  object qryNotasItens: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 'dadofiscal = dadofiscal'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrNotas
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select *,'
      '        case when hash_paf_registro_j2 = md5('
      ''
      ''
      '             cast(cnpj as varchar)||'
      '             cast(emissao as varchar)||'
      '             cast(numero as varchar)||'
      '             cast(codigovisual as varchar)||'
      '             cast(descricao as varchar)||'
      '             cast(quantidade as varchar)||'
      '             cast(unidade as varchar)||'
      '             cast(precovenda as varchar)||'
      '             coalesce(cast(desconto as varchar),'#39#39')||'
      '             coalesce(cast(acrescimo as varchar),'#39#39')||'
      '             coalesce(cast(valortotalliquido as varchar),'#39#39')||'
      '             coalesce(cast(numeronota as varchar),'#39#39')||'
      '             coalesce(cast(serienota as varchar),'#39#39')||'
      '             coalesce(cast(chv_nfe as varchar),'#39#39')||'
      
        '             coalesce(cast(tipototalizadorparcial as varchar),'#39#39 +
        ')||'
      
        '             coalesce(cast(casasdecimaisquantidade as varchar),'#39 +
        #39')||'
      
        '             coalesce(cast(casasdecimaisvalorunitario as varchar' +
        '),'#39#39')||'
      '             coalesce(cast(tipodedocumento as varchar),'#39#39')'
      ''
      '        ) then true else false end as registrovalido'
      ''
      'from registro_j2'
      ''
      'where emissao between :dataInicial and :dataFinal'
      ''
      'order by dadofiscal, numero'
      '')
    RequestLive = False
    Left = 312
    Top = 424
    ParamData = <
      item
        DataType = ftString
        Name = 'dataInicial'
        ParamType = ptUnknown
        Value = '2016-10-01'
      end
      item
        DataType = ftString
        Name = 'dataFinal'
        ParamType = ptUnknown
        Value = '2016-10-31'
      end>
    object qryNotasItensdadofiscal: TIntegerField
      FieldName = 'dadofiscal'
      Required = True
      DisplayFormat = '0'
    end
    object qryNotasItenscnpj: TStringField
      FieldName = 'cnpj'
      Size = 14
    end
    object qryNotasItensemissao: TDateField
      Alignment = taCenter
      FieldName = 'emissao'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryNotasItensnumero: TIntegerField
      FieldName = 'numero'
      Required = True
      DisplayFormat = '0'
    end
    object qryNotasItenscodigovisual: TStringField
      FieldName = 'codigovisual'
      Required = True
      Size = 30
    end
    object qryNotasItensdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 51
    end
    object qryNotasItensquantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryNotasItensunidade: TStringField
      FieldName = 'unidade'
      Size = 8
    end
    object qryNotasItensprecovenda: TFloatField
      FieldName = 'precovenda'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryNotasItensdesconto: TFloatField
      FieldName = 'desconto'
      DisplayFormat = '0.00'
    end
    object qryNotasItensacrescimo: TFloatField
      FieldName = 'acrescimo'
      DisplayFormat = '0.00'
    end
    object qryNotasItensvalortotalliquido: TFloatField
      FieldName = 'valortotalliquido'
      DisplayFormat = '0.00'
    end
    object qryNotasItensnumeronota: TIntegerField
      FieldName = 'numeronota'
      Required = True
      DisplayFormat = '0'
    end
    object qryNotasItensserienota: TStringField
      FieldName = 'serienota'
      Required = True
      Size = 3
    end
    object qryNotasItenschv_nfe: TStringField
      FieldName = 'chv_nfe'
      Size = 44
    end
    object qryNotasItenstipototalizadorparcial: TStringField
      FieldName = 'tipototalizadorparcial'
      Size = 7
    end
    object qryNotasItenscasasdecimaisquantidade: TIntegerField
      FieldName = 'casasdecimaisquantidade'
      DisplayFormat = '0'
    end
    object qryNotasItenscasasdecimaisvalorunitario: TIntegerField
      FieldName = 'casasdecimaisvalorunitario'
      DisplayFormat = '0'
    end
    object qryNotasItenstipodedocumento: TIntegerField
      FieldName = 'tipodedocumento'
      DisplayFormat = '0'
    end
    object qryNotasItenshash_paf_registro_j2: TStringField
      FieldName = 'hash_paf_registro_j2'
      Size = 32
    end
    object qryNotasItensregistrovalido: TBooleanField
      FieldName = 'registrovalido'
    end
  end
  object dsrNotas: TtecDataSource
    DataSet = qryNotas
    Left = 272
    Top = 392
  end
  object qryNReducoes: TtecQuery
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
      'select count(*) as Quantidade'
      'from reducoesz'
      'where datamovimento = :datamovimento')
    RequestLive = False
    Left = 512
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'datamovimento'
        ParamType = ptUnknown
      end>
    object qryNReducoesquantidade: TLargeintField
      FieldName = 'quantidade'
    end
  end
  object qryVendasIdentificadas: TtecQuery
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
        Name = 'CondicaoIntervalo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CondicaoCPFouCNPJ'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select df.pessoanumero,'
      
        '       cast(to_char(df.data, '#39'YYYY-MM-01'#39') as date) as AnoMesPri' +
        'mDia,'
      '       sum(df.valortotal) as valortotal'
      'from dadosfiscais df'
      'where df.situacao = '#39'N'#39
      '  and df.pessoanumero is not null'
      '  and df.filialvenda = :filialbase '
      '  %CondicaoIntervalo'
      '  %CondicaoCPFouCNPJ'
      
        'group by df.pessoanumero, cast(to_char(df.data, '#39'YYYY-MM-01'#39') as' +
        ' date)'
      
        'order by cast(to_char(df.data, '#39'YYYY-MM-01'#39') as date), df.pessoa' +
        'numero'
      ''
      ''
      '/*'
      '  and df.data between :datainicial and :datafinal'
      '  and df.pessoanumero = :CPFouCNPJ'
      '*/')
    RequestLive = False
    Left = 440
    Top = 408
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filialbase'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CPFouCNPJ'
        ParamType = ptUnknown
      end>
    object qryVendasIdentificadaspessoanumero: TStringField
      FieldName = 'pessoanumero'
      Size = 14
    end
    object qryVendasIdentificadasanomesprimdia: TDateField
      FieldName = 'anomesprimdia'
    end
    object qryVendasIdentificadasvalortotal: TFloatField
      FieldName = 'valortotal'
    end
  end
end
