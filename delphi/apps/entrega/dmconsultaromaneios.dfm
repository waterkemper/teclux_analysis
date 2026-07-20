inherited dtmConsultaRomaneios: TdtmConsultaRomaneios
  OldCreateOrder = False
  Left = 585
  Top = 224
  Height = 397
  Width = 697
  object qryRomaneios: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryRomaneiosAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'IntervaloDatas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Situacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaFiliaisEmissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaFiliaisDestino'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SelecaoAleatoriaCliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SelecaoAleatoriaFornecedores'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'SELECT distinct'
      '       r.numero,'
      '       r.fornecedor,'
      '       f.razao as nomefornecedor,'
      ''
      '       r.emissao,'
      '       r.tipo,'
      ''
      
        '       case when r.tipo = '#39'T'#39' then cast('#39'Transfer'#234'ncia'#39' as varch' +
        'ar(20)) else'
      '       cast('#39'Normal'#39' as varchar(20)) end as descricaotipo,'
      ''
      ''
      '       r.documentopag,'
      ''
      ''
      '       (select max(d.datapagto)'
      '        from duplicatas d'
      '        where d.documentopag = r.documentopag) as datapagto,'
      ''
      '       (select sum(d.valorpagto)'
      '        from duplicatas d'
      '        where d.documentopag = r.documentopag) as valorpagto,'
      ''
      ''
      '       (select u.nome'
      '        from usuarios u'
      '        where u.codigo = (select conf.usuario'
      '                          from conferencia conf'
      '                          where conf.tipo = '#39'ROS'#39
      
        '                            and conf.codigo = cast(r.numero as v' +
        'archar(20)))) as NomeUsuarioConferencia,'
      ''
      '       (select conf.data'
      '        from conferencia conf'
      '        where conf.tipo = '#39'ROS'#39
      
        '          and conf.codigo = cast(r.numero as varchar(20))) as Da' +
        'taHoraUsuarioConferencia,'
      ''
      '       r.situacao_romaneio'
      ''
      'FROM romaneios r'
      '     join vfornecedores f'
      '     on r.fornecedor = f.codigo'
      '     and f.tipo = '#39'F'#39
      ''
      '     join romaneiosnotas rn'
      '          join dadosfiscais df'
      '                join vfornecedores vf'
      '                on df.cliente = vf.codigo'
      '                and df.tipocliente = vf.tipo'
      '                '
      '          on rn.dadofiscal = df.numero'
      ''
      '     on r.numero = rn.romaneio'
      ''
      'WHERE true'
      '%IntervaloDatas'
      '%Tipo'
      '%Situacao'
      '%ListaFiliaisEmissao'
      '%ListaFiliaisDestino'
      '%SelecaoAleatoriaCliente'
      '%SelecaoAleatoriaFornecedores')
    RequestLive = False
    Left = 48
    Top = 16
    object qryRomaneiosnumero: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'numero'
    end
    object qryRomaneiosfornecedor: TIntegerField
      DisplayLabel = 'Fornecedor'
      FieldName = 'fornecedor'
    end
    object qryRomaneiosnomefornecedor: TStringField
      DisplayLabel = 'Nome Fornecedor Transporte'
      FieldName = 'nomefornecedor'
      Size = 60
    end
    object qryRomaneiosemissao: TDateField
      Alignment = taCenter
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'emissao'
      EditMask = '99/99/9999;1; '
    end
    object qryRomaneiostipo: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'tipo'
      Size = 1
    end
    object qryRomaneiosdescricaotipo: TStringField
      DisplayLabel = 'Descri'#231#227'o Tipo'
      FieldName = 'descricaotipo'
    end
    object qryRomaneiosdocumentopag: TIntegerField
      DisplayLabel = 'Doc.a Pagar'
      FieldName = 'documentopag'
    end
    object qryRomaneiosdatapagto: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data Pagto'
      FieldName = 'datapagto'
      EditMask = '99/99/9999;1; '
    end
    object qryRomaneiosvalorpagto: TFloatField
      DisplayLabel = 'Valor Pagto'
      FieldName = 'valorpagto'
      DisplayFormat = '0.00'
    end
    object qryRomaneiosnomeusuarioconferencia: TStringField
      DisplayLabel = 'Usu'#225'rio Confer'#234'ncia'
      FieldName = 'nomeusuarioconferencia'
      Size = 100
    end
    object qryRomaneiosdatahorausuarioconferencia: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data Hora Confer'#234'ncia'
      FieldName = 'datahorausuarioconferencia'
      DisplayFormat = 'dd/MM/yy hh:mm'
      EditMask = '99/99/99 99:99;1; '
    end
    object qryRomaneiossituacao_romaneio: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'situacao_romaneio'
      Size = 18
    end
  end
  object dsrRomaneios: TtecDataSource
    DataSet = qryRomaneios
    Left = 88
    Top = 32
  end
  object qryRomaneiosNotas: TtecQuery
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
      'Select rn.romaneio,'
      '       rn.dadofiscal,'
      
        '       retirabrancoepipeeascii255(rn.observacao) as observacao_2' +
        ','
      '       rn.observacao,'
      '       rn.entrega,'
      '       rn.valor,'
      '       rn.codigofrete,'
      '       rn.cancelado,'
      ''
      '       (select df.data'
      '        from DadosFiscais df'
      '        where rn.dadofiscal=df.numero) as DataEmissao,'
      ''
      '       (select df.chv_nfe'
      '        from DadosFiscais df'
      '        where rn.dadofiscal=df.numero) as chv_nfe,'
      ''
      '       (select f.nome'
      '        from Filiais f'
      '        where (f.codigo = (select df.FilialEmissao'
      '                           from DadosFiscais df'
      
        '                           where rn.dadofiscal=df.numero))) as n' +
        'omefilial,'
      ''
      '       (select df.FilialEmissao'
      '        from dadosfiscais df'
      '        where rn.dadofiscal=df.numero) as FilialEmissao,'
      ''
      '       (select df.data_hora_recebimento'
      '        from dadosfiscais df'
      '        where rn.dadofiscal=df.numero) as data_hora_recebimento,'
      ''
      '       (select n.serie'
      '        from Notas n'
      '        where rn.dadofiscal=n.dadofiscal) as Serie,'
      ''
      '       (select n.numero'
      '        from Notas n'
      '        where rn.dadofiscal=n.dadofiscal) as Numero_NF,'
      ''
      '       (select c.maquina'
      '        from Cupons c'
      '        where rn.dadofiscal=c.dadofiscal) as maquina,'
      ''
      '       (select c.intervensao'
      '        from Cupons c'
      '        where rn.dadofiscal=c.dadofiscal) as Intervensao,'
      ''
      '       (select c.numero'
      '        from Cupons c'
      '        where rn.dadofiscal=c.dadofiscal) as Numero_Cupom,'
      ''
      '       (select tf.descricao'
      '        from TabeladeFretes tf'
      '        where rn.codigofrete = tf.codigo) as descricaofrete,'
      ''
      '       (select tf.ValorFornecedor'
      '        from TabeladeFretes tf'
      '        where rn.codigofrete = tf.codigo) as ValorFornecedor,'
      ''
      
        '       (select case when df.tipocliente<>'#39'C'#39' then cast(cast(df.c' +
        'liente as varchar(19))||df.tipocliente as varchar(20))'
      '               else cast(df.cliente as varchar(20)) end'
      '        from  dadosfiscais df'
      '        where df.numero = rn.dadofiscal) as cliente,'
      ''
      '       (select coalesce(vf.razao,vf.nome) '
      '        from vfornecedores vf, dadosfiscais df'
      '        where df.cliente = vf.codigo and'
      '                 df.tipocliente = vf.tipo and'
      '                 df.numero = rn.dadofiscal) as nomecliente,'
      ''
      '       (select vdf.volumes'
      '        from volumesdadosfiscais vdf'
      '        where vdf.dadofiscal = rn.dadofiscal'
      '          and vdf.volumes is not null limit 1) as volumes'
      ''
      'from romaneiosnotas rn'
      'where rn.romaneio=:numero'
      'order by dadofiscal')
    RequestLive = True
    Left = 48
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptUnknown
      end>
    object qryRomaneiosNotasnomefilial: TStringField
      DisplayLabel = 'Filial da Emiss'#227'o da Nota'
      DisplayWidth = 50
      FieldName = 'nomefilial'
      Size = 60
    end
    object qryRomaneiosNotasserie: TStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'serie'
      Required = True
      Size = 3
    end
    object qryRomaneiosNotasnumero_nf: TIntegerField
      DisplayLabel = 'Nota'
      FieldName = 'numero_nf'
      Required = True
      DisplayFormat = '0'
    end
    object qryRomaneiosNotasmaquina: TIntegerField
      DisplayLabel = 'ECF'
      FieldName = 'maquina'
      Required = True
      DisplayFormat = '0'
    end
    object qryRomaneiosNotasintervensao: TIntegerField
      DisplayLabel = 'Interv.'
      FieldName = 'intervensao'
      Required = True
      DisplayFormat = '0'
    end
    object qryRomaneiosNotasnumero_cupom: TIntegerField
      DisplayLabel = 'Cupom Fiscal'
      FieldName = 'numero_cupom'
      Required = True
      DisplayFormat = '0'
    end
    object qryRomaneiosNotasdataemissao: TDateField
      Alignment = taCenter
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'dataemissao'
      EditMask = '99/99/9999;1; '
    end
    object qryRomaneiosNotasentrega: TDateField
      Alignment = taCenter
      DisplayLabel = 'Entrega'
      FieldName = 'entrega'
      EditMask = '99/99/9999;1; '
    end
    object qryRomaneiosNotasvalor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'valor'
      DisplayFormat = '0.00'
    end
    object qryRomaneiosNotascancelado: TBooleanField
      DisplayLabel = 'Anulado'
      FieldName = 'cancelado'
    end
    object qryRomaneiosNotasdadofiscal: TIntegerField
      FieldName = 'dadofiscal'
      Visible = False
      DisplayFormat = '0'
    end
    object qryRomaneiosNotasobservacao: TStringField
      FieldName = 'observacao'
      Visible = False
      Size = 100
    end
    object qryRomaneiosNotasromaneio: TIntegerField
      FieldName = 'romaneio'
      Visible = False
      DisplayFormat = '0'
    end
    object qryRomaneiosNotascodigofrete: TIntegerField
      FieldName = 'codigofrete'
      Visible = False
      DisplayFormat = '0'
    end
    object qryRomaneiosNotasfilialemissao: TIntegerField
      DisplayLabel = 'Filial de Emiss'#227'o'
      FieldName = 'filialemissao'
      Required = True
      Visible = False
      DisplayFormat = '0'
    end
    object qryRomaneiosNotasdescricaofrete: TStringField
      FieldName = 'descricaofrete'
      Visible = False
      Size = 30
    end
    object qryRomaneiosNotasvalorfornecedor: TFloatField
      FieldName = 'valorfornecedor'
      Visible = False
      DisplayFormat = '0.00'
    end
    object qryRomaneiosNotasnomecliente: TStringField
      FieldName = 'nomecliente'
      Size = 50
    end
    object qryRomaneiosNotasobservacao_2: TStringField
      FieldName = 'observacao_2'
      Size = 50
    end
    object qryRomaneiosNotaschv_nfe: TStringField
      FieldName = 'chv_nfe'
      EditMask = '99\-9999\-99999999999999\-99\-999\-999999999\-9\-99999999\-9;0;_'
      Size = 44
    end
    object qryRomaneiosNotasdata_hora_recebimento: TDateTimeField
      Alignment = taCenter
      FieldName = 'data_hora_recebimento'
      ReadOnly = True
      DisplayFormat = 'dd/MM/yy hh:mm'
      EditMask = '99/99/99 99:99;1; '
    end
    object qryRomaneiosNotascliente: TStringField
      FieldName = 'cliente'
    end
    object qryRomaneiosNotasvolumes: TIntegerField
      FieldName = 'volumes'
    end
  end
  object dsrRomaneiosNotas: TtecDataSource
    DataSet = qryRomaneiosNotas
    Left = 96
    Top = 96
  end
end
